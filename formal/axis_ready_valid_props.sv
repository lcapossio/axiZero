// Copyright (c) 2026 Leonardo Capossio - bard0 design  hello@bard0.com
// SPDX-License-Identifier: MIT
/*
 * Reusable AXI4-Stream ready/valid protocol properties.
 *
 * Bind or instantiate this monitor on any AXIS interface.  It checks the core
 * invariant that all payload sideband fields remain stable while TVALID is
 * asserted and TREADY is low, and that TVALID is not asserted during reset.
 */

`timescale 1ns/1ps

module axis_ready_valid_props #(
    parameter integer DATA_WIDTH = 32,
    parameter integer KEEP_WIDTH = (DATA_WIDTH + 7) / 8,
    parameter integer STRB_WIDTH = KEEP_WIDTH,
    parameter integer ID_WIDTH = 1,
    parameter integer DEST_WIDTH = 1,
    parameter integer USER_WIDTH = 1,
    parameter HAS_KEEP = 1,
    parameter HAS_STRB = 1,
    parameter HAS_LAST = 1,
    parameter HAS_ID = 0,
    parameter HAS_DEST = 0,
    parameter HAS_USER = 0,
    parameter ASSUME = 0
) (
    input  wire                   aclk,
    input  wire                   aresetn,
    input  wire                   tvalid,
    input  wire                   tready,
    input  wire [DATA_WIDTH-1:0]  tdata,
    input  wire [KEEP_WIDTH-1:0]  tkeep,
    input  wire [STRB_WIDTH-1:0]  tstrb,
    input  wire                   tlast,
    input  wire [ID_WIDTH-1:0]    tid,
    input  wire [DEST_WIDTH-1:0]  tdest,
    input  wire [USER_WIDTH-1:0]  tuser
);

`ifdef FORMAL
    generate
        if (ASSUME) begin : assume_mode
            reg past_valid = 1'b0;

            always @(posedge aclk) begin
                past_valid <= 1'b1;

                if (!aresetn) begin
                    assume(!tvalid);
                end

                if (past_valid && $past(aresetn) && $past(tvalid) && !$past(tready)) begin
                    assume(tvalid);
                    assume(tdata == $past(tdata));
                    if (HAS_KEEP) begin
                        assume(tkeep == $past(tkeep));
                    end
                    if (HAS_STRB) begin
                        assume(tstrb == $past(tstrb));
                    end
                    if (HAS_LAST) begin
                        assume(tlast == $past(tlast));
                    end
                    if (HAS_ID) begin
                        assume(tid == $past(tid));
                    end
                    if (HAS_DEST) begin
                        assume(tdest == $past(tdest));
                    end
                    if (HAS_USER) begin
                        assume(tuser == $past(tuser));
                    end
                end
            end
        end else begin : assert_mode
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
                    if (HAS_ID) begin
                        assert(tid == $past(tid));
                    end
                    if (HAS_DEST) begin
                        assert(tdest == $past(tdest));
                    end
                    if (HAS_USER) begin
                        assert(tuser == $past(tuser));
                    end
                end
            end
        end
    endgenerate
`endif

endmodule
