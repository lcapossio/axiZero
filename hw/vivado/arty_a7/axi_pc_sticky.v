// Copyright (c) 2026 Leonardo Capossio - bard0 design  hello@bard0.com
// SPDX-License-Identifier: MIT
//
// axi_pc_sticky - sticky-latch + compressed readback for the AMD AXI
// Protocol Checker pc_status output (full 160-bit width).
//
// Internal: per-bit sticky FF, one per pc_status bit (160 FFs total).
//           Each bit goes high the first time the corresponding rule fires
//           after aresetn deassert and stays high until the next reset.
//
// Outputs:
//   any_violation - OR-reduction of all 160 sticky bits.  Drives LD0_R for
//                   visual confirmation of *any* violation across the full
//                   rule set.
//   view[31:0]    - software-readable compressed view, exposed via AXI GPIO
//                   ch2 at 0xC0020008.  Bit assignment:
//
//     view[15:0]  = chunk OR — bit i = OR of sticky_full[10*i +: 10]
//                   chunk 0 covers rules 0..9, chunk 1 covers rules 10..19,
//                   ..., chunk 15 covers rules 150..159.
//     view[30:16] = reserved (read 0)
//     view[31]    = any_violation (== |sticky_full).  Sanity bit so software
//                   can confirm the readback path is alive even if every
//                   chunk is empty (i.e., a glitch flagged a high-numbered
//                   rule we missed).
//
// Decoding workflow:
//   1. Read view via `mrd 0xC0020008`.
//   2. If bit 31 is set, a violation occurred.
//   3. Find which chunks (bits 15..0) are set.  Each chunk corresponds to
//      a 10-rule range from PG101's AXI_ERRM_*/AXI_ERRS_* rule table.
//   4. Optional: rebuild with a finer slice over the suspect range to
//      identify the exact bit.

module axi_pc_sticky (
    input  wire         clk,
    input  wire         aresetn,
    input  wire [159:0] pc_status,
    output wire         any_violation,
    output wire [31:0]  view
);
    reg [159:0] sticky_full;
    integer i;
    always @(posedge clk) begin
        if (!aresetn) begin
            sticky_full <= 160'b0;
        end else begin
            for (i = 0; i < 160; i = i + 1) begin
                if (pc_status[i]) sticky_full[i] <= 1'b1;
            end
        end
    end

    assign any_violation = |sticky_full;

    // Detail view: bits 30..59 of pc_status (30 rules) directly visible.
    // Earlier coarse-chunk run pinpointed chunks 3 (rules 30..39) and 5
    // (rules 50..59) as the violators; this layout exposes both ranges
    // bit-for-bit so the exact rule numbers can be read from one xsdb
    // mrd 0xC0020008.
    //
    //   view[29:0]  = sticky_full[59:30]
    //                 view[i] = sticky_full[30+i]
    //                 → e.g. view[0]=rule30, view[9]=rule39,
    //                        view[20]=rule50, view[29]=rule59
    //   view[30]    = reserved (read 0)
    //   view[31]    = any_violation (sanity bit)
    assign view[29:0] = sticky_full[59:30];
    assign view[30]   = 1'b0;
    assign view[31]   = |sticky_full;
endmodule
