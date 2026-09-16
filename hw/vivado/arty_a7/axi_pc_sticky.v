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
//     view[29:0]  = sticky_full[59:30]: one bit per rule, rule i visible
//                   at view[i-30], so view[0] is rule 30 and view[29] is
//                   rule 59.  Rules 0..29 and 60..159 are NOT exposed
//                   here; only the any_violation bit reflects them.
//     view[30]    = reserved (read 0)
//     view[31]    = any_violation (== |sticky_full).  Sanity bit so software
//                   can confirm the readback path is alive even when
//                   bits 29..0 are all clear (i.e. the violated rule is
//                   one this view does not expose).
//
// Decoding workflow:
//   1. Read view via `mrd 0xC0020008`.
//   2. If bit 31 is set, a violation occurred.
//   3. If any of bits 29..0 is set, the rule number is 30 + bit index;
//      run_base_test.py prints the PG101 name for it.
//   4. If bit 31 is set but bits 29..0 are all clear, the violated rule
//      lies outside 30..59: rebuild with a different slice to see it.

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
