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

module axi_qos_traffic_gen #(
    parameter [31:0] BASE_ADDR    = 32'hC000_0800,
    parameter [31:0] ALT_BASE_ADDR= 32'hC001_0800,
    parameter [31:0] GPIO_ADDR    = 32'hC002_0000,
    parameter [31:0] UART_ADDR    = 32'hC003_0004,
    parameter [31:0] DATA_PATTERN = 32'hB100_0000,
    parameter [3:0]  QOS_VALUE    = 4'h0,
    parameter integer MODE        = 0,
    parameter integer NWORDS      = 512,
    parameter integer NPASSES     = 8
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

    localparam [2:0] S_IDLE   = 3'd0,
                     S_AW_W   = 3'd1,
                     S_WAIT_B = 3'd2,
                     S_DONE   = 3'd3;

    reg [2:0] state;
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

    // Read channel permanently idle
    assign arvalid  = 1'b0;
    assign araddr   = 32'b0;
    assign arid     = 1'b0;
    assign arlen    = 8'd0;
    assign arsize   = 3'd2;
    assign arburst  = 2'b01;
    assign arlock   = 1'b0;
    assign arcache  = 4'b0000;
    assign arqos    = QOS_VALUE;
    assign arprot   = 3'b000;
    assign arregion = 4'b0000;
    assign rready   = 1'b0;

    // Write channel
    assign awvalid  = (state == S_AW_W) && !aw_sent;
    assign awaddr   = curr_addr;
    assign awid     = 1'b0;
    assign awlen    = 8'd0;      // single-beat
    assign awsize   = 3'd2;      // 4 bytes
    assign awburst  = 2'b01;     // INCR
    assign awlock   = 1'b0;
    assign awcache  = 4'b0011;
    assign awqos    = QOS_VALUE;
    assign awprot   = 3'b000;
    assign awregion = 4'b0000;

    assign wvalid   = (state == S_AW_W) && !w_sent;
    assign wdata    = curr_data;
    assign wstrb    = 4'hF;
    assign wlast    = 1'b1;

    assign bready   = (state == S_WAIT_B);
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

    always @(posedge aclk) begin
        if (!aresetn) begin
            state        <= S_IDLE;
            word_idx     <= 16'd0;
            pass_idx     <= 8'd0;
            aw_sent      <= 1'b0;
            w_sent       <= 1'b0;
            trigger_prev <= 1'b0;
        end else begin
            trigger_prev <= trigger;
            case (state)
                S_IDLE: begin
                    if (trigger && !trigger_prev) begin
                        state    <= S_AW_W;
                        word_idx <= 16'd0;
                        pass_idx <= 8'd0;
                        aw_sent  <= 1'b0;
                        w_sent   <= 1'b0;
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
                    if (bvalid) begin
                        if (word_idx == (NWORDS - 1)) begin
                            if (pass_idx == (NPASSES - 1)) begin
                                state <= S_DONE;
                            end else begin
                                pass_idx <= pass_idx + 8'd1;
                                word_idx <= 16'd0;
                                state    <= S_AW_W;
                                aw_sent  <= 1'b0;
                                w_sent   <= 1'b0;
                            end
                        end else begin
                            word_idx <= word_idx + 16'd1;
                            state    <= S_AW_W;
                            aw_sent  <= 1'b0;
                            w_sent   <= 1'b0;
                        end
                    end
                end

                S_DONE: begin
                    // Return to idle when trigger de-asserts so we
                    // can be re-triggered for the next stress iteration.
                    if (!trigger)
                        state <= S_IDLE;
                end
            endcase
        end
    end

endmodule
