// Copyright (c) 2026 Leonardo Capossio - bard0 design  hello@bard0.com
// SPDX-License-Identifier: MIT
//
// axi_qos_rand_burst_gen - Full AXI4 random short-burst write generator.
//
// On trigger 0->1, this master issues NPASSES * NBURSTS INCR write bursts.
// Burst length is pseudo-random in [1..MAX_BURST_LEN] (default 1..4 beats).
// Burst start address is pseudo-random inside a WINDOW_WORDS region at BASE_ADDR.
// A completion sentinel is written as the final transaction.

module axi_qos_rand_burst_gen #(
    parameter [31:0] BASE_ADDR      = 32'hC001_1800,
    parameter [31:0] DATA_PATTERN   = 32'hB300_0000,
    parameter [31:0] SENTINEL_DATA  = 32'hD00D_0000,
    parameter [3:0]  QOS_VALUE      = 4'h0,
    parameter integer WINDOW_WORDS  = 128,
    parameter integer NBURSTS       = 1024,
    parameter integer NPASSES       = 8,
    parameter integer MAX_BURST_LEN = 4
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
    localparam [2:0] S_IDLE    = 3'd0,
                     S_AW      = 3'd1,
                     S_W       = 3'd2,
                     S_B       = 3'd3,
                     S_DONE_AW = 3'd4,
                     S_DONE_W  = 3'd5,
                     S_DONE_B  = 3'd6,
                     S_DONE    = 3'd7;

    reg [2:0]  state;
    reg [7:0]  pass_idx;
    reg [15:0] burst_idx;
    reg [15:0] beat_idx;
    reg [2:0]  burst_len;
    reg [31:0] curr_awaddr;
    reg [31:0] lfsr;
    reg        trigger_prev;

    wire aw_hs = awvalid && awready;
    wire w_hs  = wvalid && wready;
    wire b_hs  = bvalid && bready;

    // Read channel unused
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
    assign awvalid  = (state == S_AW) || (state == S_DONE_AW);
    assign awaddr   = curr_awaddr;
    assign awid     = 1'b0;
    assign awlen    = ((state == S_DONE_AW) || (state == S_DONE_W) || (state == S_DONE_B)) ? 8'd0 : (burst_len - 1'b1);
    assign awsize   = 3'd2;
    assign awburst  = 2'b01;
    assign awlock   = 1'b0;
    assign awcache  = 4'b0011;
    assign awqos    = QOS_VALUE;
    assign awprot   = 3'b000;
    assign awregion = 4'b0000;

    assign wvalid   = (state == S_W) || (state == S_DONE_W);
    assign wdata    = (state == S_DONE_W)
                    ? (SENTINEL_DATA | {24'b0, pass_idx})
                    : (DATA_PATTERN | ({24'b0, pass_idx} << 16) | {16'b0, burst_idx} ^ {24'b0, lfsr[7:0]} ^ {24'b0, beat_idx[7:0]});
    assign wstrb    = 4'hF;
    assign wlast    = (state == S_DONE_W) ? 1'b1 : (beat_idx == (burst_len - 1'b1));
    assign bready   = (state == S_B) || (state == S_DONE_B);
    assign done     = (state == S_DONE);

    function [31:0] lfsr_next;
        input [31:0] x;
        begin
            lfsr_next = {x[30:0], x[31] ^ x[21] ^ x[1] ^ x[0]};
        end
    endfunction

    function [31:0] rand_addr;
        input [31:0] seed;
        reg [6:0] idx;
        begin
            idx = {seed[6:2], 2'b00}; // 4-word alignment for short INCR bursts
            rand_addr = BASE_ADDR + {23'b0, idx, 2'b00};
        end
    endfunction

    always @(posedge aclk) begin
        if (!aresetn) begin
            state        <= S_IDLE;
            pass_idx     <= 8'd0;
            burst_idx    <= 16'd0;
            beat_idx     <= 16'd0;
            burst_len    <= 3'd1;
            curr_awaddr  <= BASE_ADDR;
            lfsr         <= 32'h1A2B_3C4D;
            trigger_prev <= 1'b0;
        end else begin
            trigger_prev <= trigger;
            case (state)
                S_IDLE: begin
                    if (trigger && !trigger_prev) begin
                        pass_idx    <= 8'd0;
                        burst_idx   <= 16'd0;
                        beat_idx    <= 16'd0;
                        burst_len   <= (lfsr[1:0] + 3'd1);
                        curr_awaddr <= rand_addr(lfsr);
                        lfsr        <= lfsr_next(lfsr);
                        state       <= S_AW;
                    end
                end

                S_AW: begin
                    if (aw_hs) begin
                        beat_idx <= 16'd0;
                        state <= S_W;
                    end
                end

                S_W: begin
                    if (w_hs) begin
                        if (beat_idx == (burst_len - 1'b1)) begin
                            state <= S_B;
                        end else begin
                            beat_idx <= beat_idx + 16'd1;
                        end
                    end
                end

                S_B: begin
                    if (b_hs) begin
                        if (burst_idx == (NBURSTS - 1)) begin
                            if (pass_idx == (NPASSES - 1)) begin
                                curr_awaddr <= BASE_ADDR + ((WINDOW_WORDS - 1) * 4);
                                state <= S_DONE_AW;
                            end else begin
                                pass_idx    <= pass_idx + 8'd1;
                                burst_idx   <= 16'd0;
                                burst_len   <= (lfsr[1:0] + 3'd1);
                                curr_awaddr <= rand_addr(lfsr);
                                lfsr        <= lfsr_next(lfsr);
                                state       <= S_AW;
                            end
                        end else begin
                            burst_idx   <= burst_idx + 16'd1;
                            burst_len   <= (lfsr[1:0] + 3'd1);
                            curr_awaddr <= rand_addr(lfsr);
                            lfsr        <= lfsr_next(lfsr);
                            state       <= S_AW;
                        end
                    end
                end

                S_DONE_AW: begin
                    if (aw_hs) state <= S_DONE_W;
                end

                S_DONE_W: begin
                    if (w_hs) state <= S_DONE_B;
                end

                S_DONE_B: begin
                    if (b_hs) state <= S_DONE;
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
