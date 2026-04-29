// Copyright (c) 2026 Leonardo Capossio - bard0 design  hello@bard0.com
// SPDX-License-Identifier: MIT
//
// pc_reset_delay - hold the AXI Protocol Checker's aresetn LOW for an
// additional 63 cycles after the system aresetn_in deasserts.
//
// Purpose: when proc_sys_reset_0/peripheral_aresetn deasserts, downstream
// AXI slaves (axi_bram_ctrl_0, etc.) take several cycles to settle their
// response signals (BVALID, RVALID, BID, RID, BRESP, RRESP, RLAST).  The
// AMD AXI Protocol Checker, watching the same bus, observes these
// transient signals and reports false positives such as AXI_ERRS_BRESP_AW
// or AXI_ERRS_RID at startup.  Delaying the checker's reset by 63 cycles
// (~630 ns @ 100 MHz) gives every slave time to reach its idle state
// before observation begins.  The MicroBlaze takes much longer than this
// to come out of reset (proc_sys_reset_0/mb_reset deasserts after the
// internal reset sequence completes), so no real transactions are missed.

module pc_reset_delay (
    input  wire clk,
    input  wire aresetn_in,    // synchronous-deassert from proc_sys_reset
    output reg  aresetn_out    // delayed by 63 cycles
);
    reg [5:0] cnt;
    always @(posedge clk) begin
        if (!aresetn_in) begin
            cnt         <= 6'd0;
            aresetn_out <= 1'b0;
        end else begin
            if (cnt < 6'd63) begin
                cnt <= cnt + 6'd1;
            end
            aresetn_out <= (cnt == 6'd63);
        end
    end
endmodule
