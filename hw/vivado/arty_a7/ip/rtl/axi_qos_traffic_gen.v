// Copyright (c) 2026 Leonardo Capossio - bard0 design  hello@bard0.com
// SPDX-License-Identifier: MIT
//
// axi_qos_traffic_gen - Full AXI4 traffic generator with fixed QoS.
//
// Mode 0: Sequential BRAM writes:
//   addr = BASE_ADDR + (word_idx * 4)
// Mode 1: Reverse-order BRAM writes:
//   addr = BASE_ADDR + ((NWORDS - 1 - word_idx) * 4)
// Mode 2: Mixed slave traffic:
//   word_idx[3:0] == 0 : GPIO_ADDR writes
//   word_idx[3:0] == 1 : UART_ADDR writes
//   otherwise:
//     word_idx[0] == 0 : BASE_ADDR window writes
//     word_idx[0] == 1 : ALT_BASE_ADDR window writes
//
// On trigger 0->1, writes NPASSES * NWORDS single-beat transactions.
//
// READ_CHECK adds a read-back. With it set, each write is followed by a read
// of the same address whose data is compared against what was just written,
// and the run ends with a status write:
//
//     status = STATUS_TAG | (resp_errors << 8) | data_errors  (both saturating)
//
// so a clean run leaves STATUS_TAG exactly at STATUS_ADDR and firmware can
// tell "still running" from "finished with errors". Two things this buys that
// the write-only generator could not give: the read address channel sees
// generated traffic at this generator's QoS rather than the CPU alone, and a
// dropped or mis-routed read beat fails on hardware instead of only in
// simulation. Addresses outside the generator's own window (the GPIO and UART
// writes of MODE 2) are never read back, since those are not memory.
//
// It defaults off so the designs that only need write traffic are unchanged.

module axi_qos_traffic_gen #(
    parameter [31:0] BASE_ADDR    = 32'hC000_0800,
    parameter [31:0] ALT_BASE_ADDR= 32'hC001_0800,
    parameter [31:0] GPIO_ADDR    = 32'hC002_0000,
    parameter [31:0] UART_ADDR    = 32'hC003_0004,
    parameter [31:0] DATA_PATTERN = 32'hB100_0000,
    parameter [3:0]  QOS_VALUE    = 4'h0,
    parameter [31:0] STATUS_ADDR  = 32'hC000_FFFC,
    parameter [31:0] STATUS_TAG   = 32'h5A71_0000,
    parameter integer MODE        = 0,
    parameter integer NWORDS      = 512,
    parameter integer NPASSES     = 8,
    parameter integer READ_CHECK  = 0
)(
    input  wire        aclk,
    input  wire        aresetn,
    input  wire        trigger,
    output wire        done,

    // AXI4 Write Address
    output wire        awvalid,
    input  wire        awready,
    output wire [31:0] awaddr,
    output wire [0:0]  awid,
    output wire [7:0]  awlen,
    output wire [2:0]  awsize,
    output wire [1:0]  awburst,
    output wire        awlock,
    output wire [3:0]  awcache,
    output wire [3:0]  awqos,
    output wire [2:0]  awprot,
    output wire [3:0]  awregion,

    // AXI4 Write Data
    output wire        wvalid,
    input  wire        wready,
    output wire [31:0] wdata,
    output wire [3:0]  wstrb,
    output wire        wlast,

    // AXI4 Write Response
    input  wire        bvalid,
    output wire        bready,
    input  wire [0:0]  bid,
    input  wire [1:0]  bresp,

    // AXI4 Read Address (unused)
    output wire        arvalid,
    input  wire        arready,
    output wire [31:0] araddr,
    output wire [0:0]  arid,
    output wire [7:0]  arlen,
    output wire [2:0]  arsize,
    output wire [1:0]  arburst,
    output wire        arlock,
    output wire [3:0]  arcache,
    output wire [3:0]  arqos,
    output wire [2:0]  arprot,
    output wire [3:0]  arregion,

    // AXI4 Read Data (unused)
    input  wire        rvalid,
    output wire        rready,
    input  wire [31:0] rdata,
    input  wire [0:0]  rid,
    input  wire [1:0]  rresp,
    input  wire        rlast
);

    localparam [3:0] S_IDLE     = 4'd0,
                     S_AW_W     = 4'd1,
                     S_WAIT_B   = 4'd2,
                     S_DONE     = 4'd3,
                     S_AR       = 4'd4,   // read back the word just written
                     S_R        = 4'd5,
                     S_ST_AW_W  = 4'd6,   // final status write
                     S_ST_B     = 4'd7;

    reg [3:0] state;
    reg [15:0] word_idx;
    reg [7:0]  pass_idx;
    reg aw_sent;
    reg w_sent;
    reg trigger_prev;
    reg [31:0] curr_addr;
    reg [31:0] curr_data;
    reg [15:0] mirror_idx;
    reg [6:0]  mix_idx;
    reg [3:0]  phase;
    reg [7:0]  data_err, resp_err;

    // Read-back is only meaningful for the generator's own memory windows.
    // MODE 2 phases 0 and 1 target the GPIO and UART, which are not memory.
    wire readable = (MODE != 2) || (word_idx[3:0] > 4'd1);
    wire do_read  = (READ_CHECK != 0) && readable;

    wire [31:0] status_word = STATUS_TAG | {16'd0, resp_err, 8'd0} |
                              {24'd0, data_err};

    // Read channel: idle unless READ_CHECK is set.
    assign arvalid  = (state == S_AR);
    assign araddr   = curr_addr;
    assign arid     = 1'b0;
    assign arlen    = 8'd0;      // single-beat
    assign arsize   = 3'd2;
    assign arburst  = 2'b01;
    assign arlock   = 1'b0;
    assign arcache  = 4'b0011;
    assign arqos    = QOS_VALUE;
    assign arprot   = 3'b000;
    assign arregion = 4'b0000;
    assign rready   = (state == S_R);

    // Write channel
    assign awvalid  = ((state == S_AW_W) || (state == S_ST_AW_W)) && !aw_sent;
    assign awaddr   = (state == S_ST_AW_W) ? STATUS_ADDR : curr_addr;
    assign awid     = 1'b0;
    assign awlen    = 8'd0;      // single-beat
    assign awsize   = 3'd2;      // 4 bytes
    assign awburst  = 2'b01;     // INCR
    assign awlock   = 1'b0;
    assign awcache  = 4'b0011;
    assign awqos    = QOS_VALUE;
    assign awprot   = 3'b000;
    assign awregion = 4'b0000;

    assign wvalid   = ((state == S_AW_W) || (state == S_ST_AW_W)) && !w_sent;
    assign wdata    = (state == S_ST_AW_W) ? status_word : curr_data;
    assign wstrb    = 4'hF;
    assign wlast    = 1'b1;

    assign bready   = (state == S_WAIT_B) || (state == S_ST_B);
    assign done     = (state == S_DONE);

    always @(*) begin
        phase = word_idx[3:0];
        mirror_idx = NWORDS - 1 - word_idx;
        mix_idx = word_idx[6:0];

        curr_addr = BASE_ADDR + {word_idx, 2'b00};
        curr_data = DATA_PATTERN | ({24'b0, pass_idx} << 16) | {16'b0, word_idx};

        case (MODE)
            1: begin
                curr_addr = BASE_ADDR + {mirror_idx, 2'b00};
                curr_data = DATA_PATTERN | ({24'b0, pass_idx} << 16) | {16'b0, mirror_idx};
            end
            2: begin
                if (phase == 4'h0) begin
                    curr_addr = GPIO_ADDR;
                    curr_data = 32'h0000_000F & (DATA_PATTERN ^ {28'h0, pass_idx[3:0]});
                end else if (phase == 4'h1) begin
                    curr_addr = UART_ADDR;
                    curr_data = 32'h0000_0000 | (8'h41 + word_idx[4:0]);
                end else if (word_idx[0] == 1'b0) begin
                    curr_addr = BASE_ADDR + {9'b0, mix_idx, 2'b00};
                    curr_data = DATA_PATTERN | ({24'b0, pass_idx} << 16) | {16'h5500, mix_idx};
                end else begin
                    curr_addr = ALT_BASE_ADDR + {9'b0, mix_idx, 2'b00};
                    curr_data = DATA_PATTERN | ({24'b0, pass_idx} << 16) | {16'hAA00, mix_idx};
                end
            end
            default: begin
                // MODE 0 default already assigned.
            end
        endcase
    end

    wire b_hs = bvalid && bready;
    wire r_hs = rvalid && rready;

    wire last_word = (word_idx == (NWORDS - 1));
    wire last_pass = (pass_idx == (NPASSES - 1));

    // One place advances the word/pass counters, whether the step ended at B
    // (no read-back) or at R (read-back).
    wire adv = ((state == S_WAIT_B) && b_hs && !do_read) ||
               ((state == S_R)      && r_hs);
    wire fin = adv && last_word && last_pass;

    wire bad_data = r_hs && (rdata != curr_data);
    wire bad_resp = (b_hs && (bresp != 2'b00) && (state == S_WAIT_B)) ||
                    (r_hs && (rresp != 2'b00));

    always @(posedge aclk) begin
        if (!aresetn) begin
            state        <= S_IDLE;
            word_idx     <= 16'd0;
            pass_idx     <= 8'd0;
            aw_sent      <= 1'b0;
            w_sent       <= 1'b0;
            trigger_prev <= 1'b0;
            data_err     <= 8'd0;
            resp_err     <= 8'd0;
        end else begin
            trigger_prev <= trigger;

            if (bad_data && data_err != 8'hFF) data_err <= data_err + 8'd1;
            if (bad_resp && resp_err != 8'hFF) resp_err <= resp_err + 8'd1;

            if (adv) begin
                aw_sent <= 1'b0;
                w_sent  <= 1'b0;
                if (last_word) begin
                    word_idx <= 16'd0;
                    if (!last_pass) pass_idx <= pass_idx + 8'd1;
                end else begin
                    word_idx <= word_idx + 16'd1;
                end
            end

            case (state)
                S_IDLE: begin
                    if (trigger && !trigger_prev) begin
                        state    <= S_AW_W;
                        word_idx <= 16'd0;
                        pass_idx <= 8'd0;
                        aw_sent  <= 1'b0;
                        w_sent   <= 1'b0;
                        data_err <= 8'd0;
                        resp_err <= 8'd0;
                    end
                end

                S_AW_W: begin
                    if (awvalid && awready) aw_sent <= 1'b1;
                    if (wvalid  && wready)  w_sent  <= 1'b1;
                    if ((aw_sent || (awvalid && awready)) &&
                        (w_sent  || (wvalid  && wready))) begin
                        state <= S_WAIT_B;
                    end
                end

                S_WAIT_B: begin
                    if (b_hs) begin
                        if (do_read)      state <= S_AR;
                        else if (fin)     state <= (READ_CHECK != 0) ? S_ST_AW_W
                                                                    : S_DONE;
                        else              state <= S_AW_W;
                    end
                end

                S_AR: if (arvalid && arready) state <= S_R;

                S_R: if (r_hs) begin
                    if (fin) state <= (READ_CHECK != 0) ? S_ST_AW_W : S_DONE;
                    else     state <= S_AW_W;
                end

                S_ST_AW_W: begin
                    if (awvalid && awready) aw_sent <= 1'b1;
                    if (wvalid  && wready)  w_sent  <= 1'b1;
                    if ((aw_sent || (awvalid && awready)) &&
                        (w_sent  || (wvalid  && wready))) begin
                        state <= S_ST_B;
                    end
                end

                S_ST_B: if (b_hs) state <= S_DONE;

                S_DONE: begin
                    // Return to idle when trigger de-asserts so we
                    // can be re-triggered for the next stress iteration.
                    if (!trigger)
                        state <= S_IDLE;
                end

                default: state <= S_IDLE;
            endcase
        end
    end

endmodule
