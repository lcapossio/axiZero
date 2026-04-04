// Copyright (c) 2026 Leonardo Capossio — bard0 design  hello@bard0.com
// SPDX-License-Identifier: MIT
//
// Formal property stubs for axiZero write-response routing.
//
// Properties to prove (TODO: wire up to the actual DUT):
//   1. B response always returns to the master that issued the AW.
//   2. No B response is produced when there is no outstanding write.
//   3. Every AW eventually receives a B (no livelock under fair scheduling).
//
// These are module-level properties intended to be bound to the crossbar
// top-level in SymbiYosys using the [script] section of the .sby file.
// Replace the parameter declarations below with wires connected to the DUT.
//
// Status: STUB — properties are written but not yet connected to a DUT.

`default_nettype none

module write_response_props #(
    parameter ID_WIDTH   = 2,
    parameter NUM_MASTERS = 2
) (
    input wire clk,
    input wire rst,

    // Observed AW channel (master-side, before crossbar)
    input wire                  aw_valid,
    input wire                  aw_ready,
    input wire [ID_WIDTH-1:0]   aw_id,

    // Observed B channel (master-side, after crossbar)
    input wire                  b_valid,
    input wire                  b_ready,
    input wire [ID_WIDTH-1:0]   b_id
);

    // -------------------------------------------------------------------------
    // Assume well-formed AXI stimulus
    // -------------------------------------------------------------------------
    // AW is stable once valid until accepted
    always @(posedge clk) begin
        if (!rst && $past(aw_valid) && !$past(aw_ready))
            assume(aw_valid && aw_id == $past(aw_id));
    end

    // -------------------------------------------------------------------------
    // Track one outstanding write (simplified: single-outstanding assumption)
    // -------------------------------------------------------------------------
    reg                outstanding;
    reg [ID_WIDTH-1:0] outstanding_id;

    always @(posedge clk) begin
        if (rst) begin
            outstanding    <= 0;
            outstanding_id <= 0;
        end else begin
            if (aw_valid && aw_ready) begin
                outstanding    <= 1;
                outstanding_id <= aw_id;
            end
            if (b_valid && b_ready) begin
                outstanding <= 0;
            end
        end
    end

    // -------------------------------------------------------------------------
    // Property 1: B ID matches the outstanding AW ID
    // -------------------------------------------------------------------------
    prop_b_routes_to_issuer: assert property (
        @(posedge clk) disable iff (rst)
        (b_valid && outstanding) |-> (b_id == outstanding_id)
    );

    // -------------------------------------------------------------------------
    // Property 2: No spurious B (B only when outstanding write exists)
    // -------------------------------------------------------------------------
    prop_no_spurious_b: assert property (
        @(posedge clk) disable iff (rst)
        b_valid |-> outstanding
    );

    // -------------------------------------------------------------------------
    // Property 3: Write liveness — AW accepted implies B eventually follows
    // (requires fair scheduling assumption; bounded proof depth = 20 cycles)
    // TODO: enable once properties 1 and 2 pass cleanly.
    // -------------------------------------------------------------------------
    // prop_aw_implies_b: assert property (
    //     @(posedge clk) disable iff (rst)
    //     (aw_valid && aw_ready) |-> ##[1:20] (b_valid && b_ready)
    // );

endmodule
