// Copyright (c) 2026 Leonardo Capossio - bard0 design  hello@bard0.com
// SPDX-License-Identifier: MIT
//
// axi_sat_gen - Full AXI4 saturating, self-checking read/write generator.
//
// Replaces axi_qos_rand_burst_gen in the QoS stress design. It closes two
// holes that limited what the hardware suites could observe:
//
//   Saturation. Every earlier generator ran one transaction at a time,
//   waiting in a B state for each response before presenting the next
//   address. A master that never has a second request outstanding cannot
//   keep an address channel busy, so the arbiter is rarely asked to choose
//   and an arbitration policy has little to act on. This one keeps up to
//   MAX_OUTSTAND bursts in flight, so AW runs ahead of W and of B -- which
//   is also the case the crossbar's per-slave W-route FIFO exists for.
//
//   Reads. Every earlier generator tied AR and R off, so AR arbitration saw
//   only one master (the CPU) and no generated traffic ever checked what
//   came back. This one reads back every word it writes and compares it, so
//   a mis-routed or dropped read beat fails on hardware rather than only in
//   simulation.
//
// Determinism is what makes the read check possible. Each word carries a
// value derived from its own offset and the pass index:
//
//     data(k, p) = DATA_PATTERN | (p << 16) | k
//
// with k the word offset inside the window. A pass covers the window
// exactly, so after the write phase of pass p every word holds data(k, p),
// and the read phase predicts the expected value from the address alone.
//
// Burst length varies per pass rather than per burst: pass p uses
// 1 << (p % 4) beats, capped at MAX_BURST_LEN. That keeps the mix of short
// and long bursts that the generator this replaces produced -- long bursts
// are what make an arbitration ranking decay, since a waiting master's
// priority ages one step per cycle -- without a per-burst length queue
// between AW and W, whose only purpose would be to let the two disagree.
// WINDOW_WORDS must be a multiple of the largest burst length used, which
// 128 is for 1, 2, 4 and 8.
//
// The verdict has to reach software without a port the block design does
// not have. This is an AXI master, so it writes its own result to
// STATUS_ADDR as its final transaction:
//
//     status = STATUS_TAG | (resp_errors << 8) | data_errors  (both saturating)
//
// A clean run writes STATUS_TAG exactly, so firmware comparing that word
// fails the suite on any mismatch.

module axi_sat_gen #(
    parameter [31:0] BASE_ADDR      = 32'hC001_1800,
    parameter [31:0] DATA_PATTERN   = 32'hB300_0000,
    parameter [31:0] STATUS_ADDR    = 32'hC001_1FFC,
    parameter [31:0] STATUS_TAG     = 32'h5A70_0000,
    parameter [3:0]  QOS_VALUE      = 4'h0,
    parameter integer WINDOW_WORDS  = 128,
    parameter integer NPASSES       = 8,
    parameter integer MAX_BURST_LEN = 8,
    parameter integer MAX_OUTSTAND  = 4
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

    // AXI4 Read Address
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

    // AXI4 Read Data
    input  wire        rvalid,
    output wire        rready,
    input  wire [31:0] rdata,
    input  wire [0:0]  rid,
    input  wire [1:0]  rresp,
    input  wire        rlast
);

    localparam [3:0] S_IDLE    = 4'd0,
                     S_WRITE   = 4'd1,   // issuing AW, ahead of W and B
                     S_WDRAIN  = 4'd2,   // all AW issued, wait for W and B
                     S_READ    = 4'd3,   // issuing AR, checking R
                     S_RDRAIN  = 4'd4,   // all AR issued, wait for R
                     S_NEXT    = 4'd5,
                     S_STAT_AW = 4'd6,
                     S_STAT_W  = 4'd7,
                     S_STAT_B  = 4'd8,
                     S_DONE    = 4'd9;

    localparam integer WIDX_W = 16;
    localparam integer OSW    = 5;

    reg [3:0]        state;
    reg [7:0]        pass_idx;
    reg              trigger_prev;

    reg [WIDX_W-1:0] aw_word, w_word, ar_word, r_word;
    reg [7:0]        w_beats_left;
    reg              w_active;
    reg [OSW-1:0]    aw_out;    // AW issued, B not yet returned
    reg [OSW-1:0]    wq_count;  // AW accepted, W burst not yet started
    reg [OSW-1:0]    ar_out;    // AR issued, RLAST not yet returned
    reg [7:0]        data_err, resp_err;

    // Burst length for this pass: 1, 2, 4, 8, capped at MAX_BURST_LEN.
    wire [7:0] pass_len_raw = 8'd1 << (pass_idx[1:0]);
    wire [7:0] burst_len    = (pass_len_raw > MAX_BURST_LEN[7:0])
                                ? MAX_BURST_LEN[7:0] : pass_len_raw;

    wire aw_hs = awvalid && awready;
    wire w_hs  = wvalid  && wready;
    wire b_hs  = bvalid  && bready;
    wire ar_hs = arvalid && arready;
    wire r_hs  = rvalid  && rready;

    // Room to issue another burst. wq_count is bounded alongside aw_out so W
    // can never fall more than MAX_OUTSTAND bursts behind AW.
    wire aw_room = (aw_out < MAX_OUTSTAND[OSW-1:0]) &&
                   (wq_count < MAX_OUTSTAND[OSW-1:0]);
    wire ar_room = (ar_out < MAX_OUTSTAND[OSW-1:0]);

    // Events, so every counter below has exactly one assignment.
    wire issue_aw = (state == S_WRITE) && aw_hs;
    wire issue_ar = (state == S_READ)  && ar_hs;
    wire retire_b = b_hs && (state != S_STAT_B) && (state != S_STAT_AW) &&
                    (state != S_STAT_W);
    wire retire_r = r_hs && rlast;
    wire w_start  = !w_active && (wq_count != 0) &&
                    (state == S_WRITE || state == S_WDRAIN);

    function [31:0] expect_word;
        input [WIDX_W-1:0] k;
        input [7:0]        p;
        begin
            expect_word = DATA_PATTERN | {8'd0, p, k};
        end
    endfunction

    // ---- write address ------------------------------------------------
    assign awvalid  = ((state == S_WRITE) && aw_room) || (state == S_STAT_AW);
    assign awaddr   = (state == S_STAT_AW) ? STATUS_ADDR
                                           : (BASE_ADDR + {14'd0, aw_word, 2'b00});
    assign awid     = 1'b0;
    assign awlen    = (state == S_STAT_AW) ? 8'd0 : (burst_len - 8'd1);
    assign awsize   = 3'd2;
    assign awburst  = 2'b01;
    assign awlock   = 1'b0;
    assign awcache  = 4'b0011;
    assign awqos    = QOS_VALUE;
    assign awprot   = 3'b000;
    assign awregion = 4'b0000;

    // ---- write data ---------------------------------------------------
    wire [31:0] status_word = STATUS_TAG | {16'd0, resp_err, 8'd0} |
                              {24'd0, data_err};

    assign wvalid = (state == S_STAT_W) ||
                    (w_active && (state == S_WRITE || state == S_WDRAIN));
    assign wdata  = (state == S_STAT_W) ? status_word
                                        : expect_word(w_word, pass_idx);
    assign wstrb  = 4'b1111;
    assign wlast  = (state == S_STAT_W) ? 1'b1 : (w_beats_left == 8'd1);
    assign bready = 1'b1;

    // ---- read ---------------------------------------------------------
    assign arvalid  = (state == S_READ) && ar_room;
    assign araddr   = BASE_ADDR + {14'd0, ar_word, 2'b00};
    assign arid     = 1'b0;
    assign arlen    = burst_len - 8'd1;
    assign arsize   = 3'd2;
    assign arburst  = 2'b01;
    assign arlock   = 1'b0;
    assign arcache  = 4'b0011;
    assign arqos    = QOS_VALUE;
    assign arprot   = 3'b000;
    assign arregion = 4'b0000;
    assign rready   = 1'b1;

    assign done = (state == S_DONE);

    wire last_aw_of_pass = (aw_word + burst_len) >= WINDOW_WORDS[WIDX_W-1:0];
    wire last_ar_of_pass = (ar_word + burst_len) >= WINDOW_WORDS[WIDX_W-1:0];

    wire bad_read = r_hs && (rdata != expect_word(r_word, pass_idx));
    wire bad_resp = (b_hs && bresp != 2'b00) || (r_hs && rresp != 2'b00);

    always @(posedge aclk) begin
        if (!aresetn) begin
            state        <= S_IDLE;
            pass_idx     <= 8'd0;
            trigger_prev <= 1'b0;
            aw_word      <= {WIDX_W{1'b0}};
            w_word       <= {WIDX_W{1'b0}};
            ar_word      <= {WIDX_W{1'b0}};
            r_word       <= {WIDX_W{1'b0}};
            w_beats_left <= 8'd0;
            w_active     <= 1'b0;
            aw_out       <= {OSW{1'b0}};
            wq_count     <= {OSW{1'b0}};
            ar_out       <= {OSW{1'b0}};
            data_err     <= 8'd0;
            resp_err     <= 8'd0;
        end else begin
            trigger_prev <= trigger;

            // ---- counters: one assignment each ------------------------
            aw_out   <= aw_out   + (issue_aw ? 1'b1 : 1'b0)
                                 - (retire_b ? 1'b1 : 1'b0);
            wq_count <= wq_count + (issue_aw ? 1'b1 : 1'b0)
                                 - (w_start  ? 1'b1 : 1'b0);
            ar_out   <= ar_out   + (issue_ar ? 1'b1 : 1'b0)
                                 - (retire_r ? 1'b1 : 1'b0);

            // ---- W burst emission, independent of the AW state ---------
            if (w_start) begin
                w_active     <= 1'b1;
                w_beats_left <= burst_len;
            end else if (w_active && w_hs) begin
                w_word <= w_word + 1'b1;
                if (w_beats_left == 8'd1) w_active <= 1'b0;
                else                      w_beats_left <= w_beats_left - 8'd1;
            end

            // ---- error accounting -------------------------------------
            if (bad_read && data_err != 8'hFF) data_err <= data_err + 8'd1;
            if (bad_resp && resp_err != 8'hFF) resp_err <= resp_err + 8'd1;
            if (r_hs) r_word <= r_word + 1'b1;

            case (state)
            S_IDLE: if (trigger && !trigger_prev) begin
                state    <= S_WRITE;
                pass_idx <= 8'd0;
                aw_word  <= {WIDX_W{1'b0}};
                w_word   <= {WIDX_W{1'b0}};
                data_err <= 8'd0;
                resp_err <= 8'd0;
            end

            S_WRITE: if (aw_hs) begin
                if (last_aw_of_pass) begin
                    aw_word <= {WIDX_W{1'b0}};
                    state   <= S_WDRAIN;
                end else begin
                    aw_word <= aw_word + {{(WIDX_W-8){1'b0}}, burst_len};
                end
            end

            S_WDRAIN: if (aw_out == (retire_b ? 1 : 0) && !w_active &&
                          wq_count == 0) begin
                state   <= S_READ;
                ar_word <= {WIDX_W{1'b0}};
                r_word  <= {WIDX_W{1'b0}};
                w_word  <= {WIDX_W{1'b0}};
            end

            S_READ: if (ar_hs) begin
                if (last_ar_of_pass) begin
                    ar_word <= {WIDX_W{1'b0}};
                    state   <= S_RDRAIN;
                end else begin
                    ar_word <= ar_word + {{(WIDX_W-8){1'b0}}, burst_len};
                end
            end

            S_RDRAIN: if (ar_out == (retire_r ? 1 : 0)) state <= S_NEXT;

            S_NEXT: if (pass_idx + 8'd1 >= NPASSES[7:0]) begin
                state <= S_STAT_AW;
            end else begin
                pass_idx <= pass_idx + 8'd1;
                aw_word  <= {WIDX_W{1'b0}};
                w_word   <= {WIDX_W{1'b0}};
                state    <= S_WRITE;
            end

            S_STAT_AW: if (aw_hs) state <= S_STAT_W;
            S_STAT_W:  if (w_hs)  state <= S_STAT_B;
            S_STAT_B:  if (b_hs)  state <= S_DONE;

            S_DONE: if (!trigger && trigger_prev) state <= S_IDLE;

            default: state <= S_IDLE;
            endcase
        end
    end

endmodule
