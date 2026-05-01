// Copyright (c) 2026 Leonardo Capossio - bard0 design  hello@bard0.com
// SPDX-License-Identifier: MIT
/*
 * Reusable AXI4-Stream ready/valid protocol properties.
 *
 * Bind or instantiate this monitor on any AXIS interface.  It checks the core
 * invariant that all payload sideband fields remain stable while TVALID is
 * asserted and TREADY is low, and that TVALID is not asserted during reset.
 */

module axis_ready_valid_props #(
    parameter integer DATA_WIDTH = 32,
    parameter integer KEEP_WIDTH = (DATA_WIDTH + 7) / 8,
    parameter integer STRB_WIDTH = KEEP_WIDTH,
    parameter HAS_KEEP = 1,
    parameter HAS_STRB = 1,
    parameter HAS_LAST = 1
) (
    input  wire                   aclk,
    input  wire                   aresetn,
    input  wire                   tvalid,
    input  wire                   tready,
    input  wire [DATA_WIDTH-1:0]  tdata,
    input  wire [KEEP_WIDTH-1:0]  tkeep,
    input  wire [STRB_WIDTH-1:0]  tstrb,
    input  wire                   tlast
);

`ifdef FORMAL
    reg past_valid = 1'b0;

    always @(posedge aclk) begin
        past_valid <= 1'b1;

        if (!aresetn) begin
            assert(!tvalid);
        end

        if (past_valid && $past(aresetn) && $past(tvalid) && !$past(tready)) begin
            assert(tvalid);
            assert(tdata == $past(tdata));
            if (HAS_KEEP) begin
                assert(tkeep == $past(tkeep));
            end
            if (HAS_STRB) begin
                assert(tstrb == $past(tstrb));
            end
            if (HAS_LAST) begin
                assert(tlast == $past(tlast));
            end
        end
    end
`endif

endmodule
