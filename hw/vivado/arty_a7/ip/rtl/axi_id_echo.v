// Copyright (c) 2026 Leonardo Capossio — bard0 design  hello@bard0.com
// SPDX-License-Identifier: MIT
//
// axi_id_echo — Echo AXI ID signals for slaves that don't support ID
//
// Sits between the crossbar output and a slave that has ID_WIDTH=0.
// Captures AWID on AW handshake, outputs as BID on B handshake.
// Captures ARID on AR handshake, outputs as RID on R+RLAST handshake.
// Uses small FIFOs (depth = MAX_OUTSTANDING) to handle pipelining.
//
// All other AXI signals pass through unchanged.

module axi_id_echo #(
    parameter ID_WIDTH         = 2,
    parameter MAX_OUTSTANDING  = 4
)(
    input  wire                  aclk,
    input  wire                  aresetn,

    // — From crossbar (master side) —
    input  wire [ID_WIDTH-1:0]   s_awid,
    input  wire                  s_awvalid,
    input  wire                  s_awready,   // from slave

    input  wire                  s_bready,
    output wire [ID_WIDTH-1:0]   s_bid,
    input  wire                  s_bvalid,    // from slave

    input  wire [ID_WIDTH-1:0]   s_arid,
    input  wire                  s_arvalid,
    input  wire                  s_arready,   // from slave

    input  wire                  s_rready,
    output wire [ID_WIDTH-1:0]   s_rid,
    input  wire                  s_rvalid,    // from slave
    input  wire                  s_rlast
);

    // Write ID FIFO
    reg [ID_WIDTH-1:0] w_fifo [0:MAX_OUTSTANDING-1];
    reg [$clog2(MAX_OUTSTANDING):0] w_wptr, w_rptr;

    always @(posedge aclk) begin
        if (!aresetn) begin
            w_wptr <= 0;
            w_rptr <= 0;
        end else begin
            if (s_awvalid && s_awready)
                begin w_fifo[w_wptr[$clog2(MAX_OUTSTANDING)-1:0]] <= s_awid; w_wptr <= w_wptr + 1; end
            if (s_bvalid && s_bready)
                w_rptr <= w_rptr + 1;
        end
    end

    assign s_bid = w_fifo[w_rptr[$clog2(MAX_OUTSTANDING)-1:0]];

    // Read ID FIFO
    reg [ID_WIDTH-1:0] r_fifo [0:MAX_OUTSTANDING-1];
    reg [$clog2(MAX_OUTSTANDING):0] r_wptr, r_rptr;

    always @(posedge aclk) begin
        if (!aresetn) begin
            r_wptr <= 0;
            r_rptr <= 0;
        end else begin
            if (s_arvalid && s_arready)
                begin r_fifo[r_wptr[$clog2(MAX_OUTSTANDING)-1:0]] <= s_arid; r_wptr <= r_wptr + 1; end
            if (s_rvalid && s_rready && s_rlast)
                r_rptr <= r_rptr + 1;
        end
    end

    assign s_rid = r_fifo[r_rptr[$clog2(MAX_OUTSTANDING)-1:0]];

endmodule
