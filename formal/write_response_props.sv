// Copyright (c) 2026 Leonardo Capossio — bard0 design  hello@bard0.com
// SPDX-License-Identifier: MIT
//
// Formal wrapper: instantiates AxiZeroMixedTop (MyFull_2M2S.v) and asserts
// write-response routing properties.
//
// Topology verified: 2 AXI4 masters × 2 AXI4 slaves, 64-bit data.
//
// Properties:
//   1. prop_b_routes_to_issuer   — B.id always matches the outstanding AW.id
//   2. prop_no_spurious_b        — B.valid only when a write is outstanding
//   3. prop_r_routes_to_issuer   — R.id always matches the outstanding AR.id
//   4. prop_no_spurious_r        — R.valid only when a read is outstanding
//
// Bounded proof depth: 30 cycles (see write_response_routing.sby).
//
// Run:
//   sby -f write_response_routing.sby

`default_nettype none

module write_response_props (
    input wire clk,
    input wire rst
);

    // Maximum consecutive cycles a response channel may stall before its
    // ready must be asserted.  Matches the original `##[1:5]` bound.
    localparam [3:0] STALL_MAX = 4'd5;

    // =========================================================================
    // Free inputs — let the solver explore all legal stimulus
    // =========================================================================
    wire        aw_valid;
    wire        aw_ready;
    wire [3:0]  aw_id;
    wire        b_valid;
    wire        b_ready;
    wire [4:0]  b_id;   // 5-bit: effectiveIdW(4) + masterIndexBits(1)

    // Other DUT ports — declared as free wires for the solver
    wire [31:0]  aw_addr;
    wire [7:0]   aw_len;
    wire [2:0]   aw_size;
    wire [1:0]   aw_burst;
    wire [0:0]   aw_lock;
    wire [3:0]   aw_cache, aw_qos;
    wire [2:0]   aw_prot;
    wire [3:0]   aw_region;

    wire         w_valid, w_last;
    wire [63:0]  w_data;
    wire [7:0]   w_strb;

    wire [3:0]   s1_aw_id;
    wire [31:0]  s1_aw_addr;
    wire [7:0]   s1_aw_len;
    wire [2:0]   s1_aw_size;
    wire [1:0]   s1_aw_burst;
    wire [0:0]   s1_aw_lock;
    wire [3:0]   s1_aw_cache, s1_aw_qos;
    wire [2:0]   s1_aw_prot;
    wire [3:0]   s1_aw_region;
    wire         s1_aw_valid, s1_b_ready;
    wire         s1_w_valid, s1_w_last;
    wire [63:0]  s1_w_data;
    wire [7:0]   s1_w_strb;

    wire         m0_aw_ready, m0_w_ready, m0_b_valid;
    wire [4:0]   m0_b_id;
    wire [1:0]   m0_b_resp;
    wire         m0_ar_ready, m0_r_valid, m0_r_last;
    wire [4:0]   m0_r_id;
    wire [1:0]   m0_r_resp;
    wire [63:0]  m0_r_data;

    wire         m1_aw_ready, m1_w_ready, m1_b_valid;
    wire [4:0]   m1_b_id;
    wire [1:0]   m1_b_resp;
    wire         m1_ar_ready, m1_r_valid, m1_r_last;
    wire [4:0]   m1_r_id;
    wire [1:0]   m1_r_resp;
    wire [63:0]  m1_r_data;

    // Request side of each slave port, driven by the DUT.  These were left
    // unconnected, which is what made the proof unsound: with no visibility of
    // what the crossbar actually asked a slave for, nothing tied a response to
    // a request and the solver was free to invent one.
    wire         m0_aw_valid_o, m0_ar_valid_o, m0_b_ready_o, m0_r_ready_o;
    wire [4:0]   m0_aw_id_o,    m0_ar_id_o;
    wire         m1_aw_valid_o, m1_ar_valid_o, m1_b_ready_o, m1_r_ready_o;
    wire [4:0]   m1_aw_id_o,    m1_ar_id_o;

    // Master 0 AR/R — free wires for read-path properties
    wire         ar_valid;
    wire         ar_ready;
    wire [3:0]   ar_id;
    wire [31:0]  ar_addr;
    wire [7:0]   ar_len;
    wire [2:0]   ar_size;
    wire [1:0]   ar_burst;
    wire [0:0]   ar_lock;
    wire [3:0]   ar_cache, ar_qos;
    wire [2:0]   ar_prot;
    wire [3:0]   ar_region;
    wire         r_valid;
    wire         r_ready;
    wire [3:0]   r_id;
    wire         r_last;

    wire         s0_ar_valid, s0_r_ready, s1_ar_valid, s1_r_ready;
    wire [31:0]  s0_ar_addr, s1_ar_addr;
    wire [3:0]   s0_ar_id, s1_ar_id;
    wire [7:0]   s0_ar_len, s1_ar_len;
    wire [2:0]   s0_ar_size, s1_ar_size;
    wire [1:0]   s0_ar_burst, s1_ar_burst;
    wire [0:0]   s0_ar_lock, s1_ar_lock;
    wire [3:0]   s0_ar_cache, s0_ar_qos, s1_ar_cache, s1_ar_qos;
    wire [2:0]   s0_ar_prot, s1_ar_prot;
    wire [3:0]   s0_ar_region, s1_ar_region;

    // =========================================================================
    // DUT instantiation — AxiZeroMixedTop from generated/MyFull_2M2S.v
    // =========================================================================
    AxiZeroMixedTop dut (
        // master 0 (s0_axi_*)
        .s0_axi_awvalid  (aw_valid),
        .s0_axi_awready  (aw_ready),
        .s0_axi_awaddr   (aw_addr),
        .s0_axi_awid     (aw_id),
        .s0_axi_awregion (aw_region),
        .s0_axi_awlen    (aw_len),
        .s0_axi_awsize   (aw_size),
        .s0_axi_awburst  (aw_burst),
        .s0_axi_awlock   (aw_lock),
        .s0_axi_awcache  (aw_cache),
        .s0_axi_awqos    (aw_qos),
        .s0_axi_awprot   (aw_prot),
        .s0_axi_wvalid   (w_valid),
        .s0_axi_wready   (),
        .s0_axi_wdata    (w_data),
        .s0_axi_wstrb    (w_strb),
        .s0_axi_wlast    (w_last),
        .s0_axi_bvalid   (b_valid),
        .s0_axi_bready   (b_ready),
        .s0_axi_bid      (b_id[3:0]),
        .s0_axi_bresp    (),
        // master 0 read (s0_axi_ar/r)
        .s0_axi_arvalid  (ar_valid),
        .s0_axi_arready  (ar_ready),
        .s0_axi_araddr   (ar_addr),
        .s0_axi_arid     (ar_id),
        .s0_axi_arregion (ar_region),
        .s0_axi_arlen    (ar_len),
        .s0_axi_arsize   (ar_size),
        .s0_axi_arburst  (ar_burst),
        .s0_axi_arlock   (ar_lock),
        .s0_axi_arcache  (ar_cache),
        .s0_axi_arqos    (ar_qos),
        .s0_axi_arprot   (ar_prot),
        .s0_axi_rvalid   (r_valid),
        .s0_axi_rready   (r_ready),
        .s0_axi_rdata    (),
        .s0_axi_rid      (r_id),
        .s0_axi_rresp    (),
        .s0_axi_rlast    (r_last),
        // master 1 (s1_axi_*)
        .s1_axi_awvalid  (s1_aw_valid),
        .s1_axi_awready  (),
        .s1_axi_awaddr   (s1_aw_addr),
        .s1_axi_awid     (s1_aw_id),
        .s1_axi_awregion (s1_aw_region),
        .s1_axi_awlen    (s1_aw_len),
        .s1_axi_awsize   (s1_aw_size),
        .s1_axi_awburst  (s1_aw_burst),
        .s1_axi_awlock   (s1_aw_lock),
        .s1_axi_awcache  (s1_aw_cache),
        .s1_axi_awqos    (s1_aw_qos),
        .s1_axi_awprot   (s1_aw_prot),
        .s1_axi_wvalid   (s1_w_valid),
        .s1_axi_wready   (),
        .s1_axi_wdata    (s1_w_data),
        .s1_axi_wstrb    (s1_w_strb),
        .s1_axi_wlast    (s1_w_last),
        .s1_axi_bvalid   (),
        .s1_axi_bready   (s1_b_ready),
        .s1_axi_bid      (),
        .s1_axi_bresp    (),
        // master 1 read (s1_axi_ar/r)
        .s1_axi_arvalid  (s1_ar_valid),
        .s1_axi_arready  (),
        .s1_axi_araddr   (s1_ar_addr),
        .s1_axi_arid     (s1_ar_id),
        .s1_axi_arregion (s1_ar_region),
        .s1_axi_arlen    (s1_ar_len),
        .s1_axi_arsize   (s1_ar_size),
        .s1_axi_arburst  (s1_ar_burst),
        .s1_axi_arlock   (s1_ar_lock),
        .s1_axi_arcache  (s1_ar_cache),
        .s1_axi_arqos    (s1_ar_qos),
        .s1_axi_arprot   (s1_ar_prot),
        .s1_axi_rvalid   (),
        .s1_axi_rready   (),
        .s1_axi_rdata    (),
        .s1_axi_rid      (),
        .s1_axi_rresp    (),
        .s1_axi_rlast    (),
        // slave 0 (m0_axi_*)
        .m0_axi_awvalid  (m0_aw_valid_o),
        .m0_axi_awready  (m0_aw_ready),
        .m0_axi_awaddr   (),
        .m0_axi_awid     (m0_aw_id_o),
        .m0_axi_awregion (),
        .m0_axi_awlen    (),
        .m0_axi_awsize   (),
        .m0_axi_awburst  (),
        .m0_axi_awlock   (),
        .m0_axi_awcache  (),
        .m0_axi_awqos    (),
        .m0_axi_awprot   (),
        .m0_axi_wvalid   (),
        .m0_axi_wready   (m0_w_ready),
        .m0_axi_wdata    (),
        .m0_axi_wstrb    (),
        .m0_axi_wlast    (),
        .m0_axi_bvalid   (m0_b_valid),
        .m0_axi_bready   (m0_b_ready_o),
        .m0_axi_bid      (m0_b_id),
        .m0_axi_bresp    (m0_b_resp),
        .m0_axi_arvalid  (m0_ar_valid_o),
        .m0_axi_arready  (m0_ar_ready),
        .m0_axi_araddr   (),
        .m0_axi_arid     (m0_ar_id_o),
        .m0_axi_arregion (),
        .m0_axi_arlen    (),
        .m0_axi_arsize   (),
        .m0_axi_arburst  (),
        .m0_axi_arlock   (),
        .m0_axi_arcache  (),
        .m0_axi_arqos    (),
        .m0_axi_arprot   (),
        .m0_axi_rvalid   (m0_r_valid),
        .m0_axi_rready   (m0_r_ready_o),
        .m0_axi_rdata    (m0_r_data),
        .m0_axi_rid      (m0_r_id),
        .m0_axi_rresp    (m0_r_resp),
        .m0_axi_rlast    (m0_r_last),
        // slave 1 (m1_axi_*)
        .m1_axi_awvalid  (m1_aw_valid_o),
        .m1_axi_awready  (m1_aw_ready),
        .m1_axi_awaddr   (),
        .m1_axi_awid     (m1_aw_id_o),
        .m1_axi_awregion (),
        .m1_axi_awlen    (),
        .m1_axi_awsize   (),
        .m1_axi_awburst  (),
        .m1_axi_awlock   (),
        .m1_axi_awcache  (),
        .m1_axi_awqos    (),
        .m1_axi_awprot   (),
        .m1_axi_wvalid   (),
        .m1_axi_wready   (m1_w_ready),
        .m1_axi_wdata    (),
        .m1_axi_wstrb    (),
        .m1_axi_wlast    (),
        .m1_axi_bvalid   (m1_b_valid),
        .m1_axi_bready   (m1_b_ready_o),
        .m1_axi_bid      (m1_b_id),
        .m1_axi_bresp    (m1_b_resp),
        .m1_axi_arvalid  (m1_ar_valid_o),
        .m1_axi_arready  (m1_ar_ready),
        .m1_axi_araddr   (),
        .m1_axi_arid     (m1_ar_id_o),
        .m1_axi_arregion (),
        .m1_axi_arlen    (),
        .m1_axi_arsize   (),
        .m1_axi_arburst  (),
        .m1_axi_arlock   (),
        .m1_axi_arcache  (),
        .m1_axi_arqos    (),
        .m1_axi_arprot   (),
        .m1_axi_rvalid   (m1_r_valid),
        .m1_axi_rready   (m1_r_ready_o),
        .m1_axi_rdata    (m1_r_data),
        .m1_axi_rid      (m1_r_id),
        .m1_axi_rresp    (m1_r_resp),
        .m1_axi_rlast    (m1_r_last),
        .aclk            (clk),
        .aresetn         (!rst)
    );

    // =========================================================================
    // Constrain the trace to start in reset
    //
    // BMC begins from an arbitrary state: rst is a free input and neither the
    // DUT registers nor the tracking registers below carry an initial value.
    // Without this the solver simply starts mid-transaction -- `outstanding`
    // already set, with a b_id unrelated to it -- and reports a counterexample
    // at step 1 that no real trace can reach, because hardware always powers
    // up through reset.  Assuming reset for the first cycle makes every
    // register defined from step 1 onwards.
    // =========================================================================
    reg initialized = 1'b0;

    always @(posedge clk) begin
        initialized <= 1'b1;
        if (!initialized) begin
            assume(rst);
        end
    end

    // =========================================================================
    // Assume well-formed AXI4 stimulus for master 0 only
    // (properties are checked on the master 0 B channel)
    // =========================================================================

    // AW is stable once valid until accepted
    always @(posedge clk) begin
        if (!rst && $past(aw_valid) && !$past(aw_ready))
            assume(aw_valid && aw_id == $past(aw_id) && aw_addr == $past(aw_addr));
    end

    // b_ready is eventually asserted (no backpressure deadlock in proof).
    // Written as a stall counter rather than `b_valid |-> ##[1:5] b_ready`:
    // yosys's built-in SVA subset accepts implication but not a ranged delay,
    // so that form fails to parse.  Bounding consecutive stalled cycles states
    // the same thing.  b_ready is a free wire, so the solver can always satisfy
    // this by raising it; the assumption cannot make the proof vacuous.
    reg [3:0] b_stall;
    always @(posedge clk) begin
        if (rst)
            b_stall <= 4'd0;
        else if (b_valid && !b_ready)
            b_stall <= b_stall + 4'd1;
        else
            b_stall <= 4'd0;
    end

    always @(posedge clk) begin
        if (!rst)
            assume(b_stall <= STALL_MAX);
    end

    // Slave always accepts AW and W (simplify proof: slaves are always ready)
    always @(posedge clk) begin
        if (!rst) begin
            assume(m0_aw_ready);
            assume(m0_w_ready);
            assume(m1_aw_ready);
            assume(m1_w_ready);
        end
    end

    // =========================================================================
    // Slave response model
    //
    // Without this the slave B/R channels are free wires, so the solver simply
    // produces a response for a transaction no master ever issued.  The
    // crossbar forwards it correctly and the routing properties then "fail"
    // against a DUT that is behaving -- the proof was measuring nothing.
    //
    // The design is generated with the default max_outstanding = 1, so each
    // slave port carries at most one read and one write at a time (there is no
    // W-route FIFO in the netlist).  Modelling one of each per slave is
    // therefore faithful rather than a convenient restriction.
    //
    // A slave may only answer a request it was given, and must answer with the
    // ID it was given.  Everything else about the response stays free.
    // =========================================================================
    reg        s0_rd_busy, s0_wr_busy;
    reg [4:0]  s0_rd_id,   s0_wr_id;
    reg        s1_rd_busy, s1_wr_busy;
    reg [4:0]  s1_rd_id,   s1_wr_id;

    always @(posedge clk) begin
        if (rst) begin
            s0_rd_busy <= 1'b0;  s0_rd_id <= 5'b0;
            s0_wr_busy <= 1'b0;  s0_wr_id <= 5'b0;
            s1_rd_busy <= 1'b0;  s1_rd_id <= 5'b0;
            s1_wr_busy <= 1'b0;  s1_wr_id <= 5'b0;
        end else begin
            if (m0_ar_valid_o && m0_ar_ready) begin
                s0_rd_busy <= 1'b1;  s0_rd_id <= m0_ar_id_o;
            end else if (m0_r_valid && m0_r_ready_o && m0_r_last) begin
                s0_rd_busy <= 1'b0;
            end

            if (m0_aw_valid_o && m0_aw_ready) begin
                s0_wr_busy <= 1'b1;  s0_wr_id <= m0_aw_id_o;
            end else if (m0_b_valid && m0_b_ready_o) begin
                s0_wr_busy <= 1'b0;
            end

            if (m1_ar_valid_o && m1_ar_ready) begin
                s1_rd_busy <= 1'b1;  s1_rd_id <= m1_ar_id_o;
            end else if (m1_r_valid && m1_r_ready_o && m1_r_last) begin
                s1_rd_busy <= 1'b0;
            end

            if (m1_aw_valid_o && m1_aw_ready) begin
                s1_wr_busy <= 1'b1;  s1_wr_id <= m1_aw_id_o;
            end else if (m1_b_valid && m1_b_ready_o) begin
                s1_wr_busy <= 1'b0;
            end
        end
    end

    always @(posedge clk) begin
        if (!rst) begin
            if (!s0_rd_busy) assume(!m0_r_valid);
            if (m0_r_valid)  assume(m0_r_id == s0_rd_id);
            if (!s0_wr_busy) assume(!m0_b_valid);
            if (m0_b_valid)  assume(m0_b_id == s0_wr_id);

            if (!s1_rd_busy) assume(!m1_r_valid);
            if (m1_r_valid)  assume(m1_r_id == s1_rd_id);
            if (!s1_wr_busy) assume(!m1_b_valid);
            if (m1_b_valid)  assume(m1_b_id == s1_wr_id);
        end
    end

    // =========================================================================
    // Track one outstanding write from master 0 (single-outstanding assume)
    // =========================================================================
    reg         outstanding;
    reg [3:0]   outstanding_id;

    always @(posedge clk) begin
        if (rst) begin
            outstanding    <= 1'b0;
            outstanding_id <= 4'b0;
        end else begin
            // Order matters: a write accepted in the same cycle the previous
            // one retires must leave the tracker set. With the clear last it
            // won, the new write was forgotten, and its perfectly legitimate
            // B response then looked spurious.
            if (b_valid && b_ready) begin
                outstanding <= 1'b0;
            end
            if (aw_valid && aw_ready) begin
                outstanding    <= 1'b1;
                outstanding_id <= aw_id;
            end
        end
    end

    // Only one outstanding write at a time from master 0.
    //
    // This previously only forced a second AW to carry the same ID, which does
    // not enforce what the comment claims: the solver could issue a second AW
    // while the first was still in flight, and the single-bit tracker above
    // cleared on the first B, so the second, entirely legitimate B looked
    // spurious.  Hold AW off until the outstanding write retires, allowing a
    // new one in the same cycle the response completes.
    always @(posedge clk) begin
        if (!rst && outstanding && !(b_valid && b_ready))
            assume(!aw_valid);
    end

    // =========================================================================
    // Property 1: B.id[3:0] always matches the outstanding AW.id
    // The upper bit (masterIndexBits) encodes which master issued the write.
    // For master 0 the index bit is 0; the lower bits carry the transaction ID.
    // =========================================================================
    always @(posedge clk) begin
        if (!rst && b_valid && outstanding)
            prop_b_routes_to_issuer: assert(b_id[3:0] == outstanding_id);
    end

    // =========================================================================
    // Property 2: No spurious B on master 0's channel
    // =========================================================================
    always @(posedge clk) begin
        if (!rst && b_valid)
            prop_no_spurious_b: assert(outstanding);
    end

    // =========================================================================
    // Read path — assumptions and properties for master 0
    // =========================================================================

    // AR is stable once valid until accepted
    always @(posedge clk) begin
        if (!rst && $past(ar_valid) && !$past(ar_ready))
            assume(ar_valid && ar_id == $past(ar_id) && ar_addr == $past(ar_addr));
    end

    // r_ready is eventually asserted — same stall-counter form as b_stall above
    reg [3:0] r_stall;
    always @(posedge clk) begin
        if (rst)
            r_stall <= 4'd0;
        else if (r_valid && !r_ready)
            r_stall <= r_stall + 4'd1;
        else
            r_stall <= 4'd0;
    end

    always @(posedge clk) begin
        if (!rst)
            assume(r_stall <= STALL_MAX);
    end

    // Slaves always accept AR
    always @(posedge clk) begin
        if (!rst) begin
            assume(m0_ar_ready);
            assume(m1_ar_ready);
        end
    end

    // Track one outstanding read from master 0 (single-outstanding)
    reg         rd_outstanding;
    reg [3:0]   rd_outstanding_id;

    always @(posedge clk) begin
        if (rst) begin
            rd_outstanding    <= 1'b0;
            rd_outstanding_id <= 4'b0;
        end else begin
            // Acceptance wins over completion — see the write tracker above.
            if (r_valid && r_ready && r_last) begin
                rd_outstanding <= 1'b0;
            end
            if (ar_valid && ar_ready) begin
                rd_outstanding    <= 1'b1;
                rd_outstanding_id <= ar_id;
            end
        end
    end

    // Only one outstanding read at a time from master 0 — same correction as
    // the write side above.
    always @(posedge clk) begin
        if (!rst && rd_outstanding && !(r_valid && r_ready && r_last))
            assume(!ar_valid);
    end

    // =========================================================================
    // Property 3: R.id[3:0] matches outstanding AR.id for master 0
    // =========================================================================
    always @(posedge clk) begin
        if (!rst && r_valid && rd_outstanding)
            prop_r_routes_to_issuer: assert(r_id[3:0] == rd_outstanding_id);
    end

    // =========================================================================
    // Property 4: No spurious R on master 0's channel
    // =========================================================================
    always @(posedge clk) begin
        if (!rst && r_valid)
            prop_no_spurious_r: assert(rd_outstanding);
    end

endmodule
