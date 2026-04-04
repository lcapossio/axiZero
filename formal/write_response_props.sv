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
//
// Bounded proof depth: 20 cycles (see write_response_routing.sby).
//
// Run:
//   sby -f write_response_routing.sby

`default_nettype none

module write_response_props (
    input wire clk,
    input wire rst
);

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
        // slave 0 (m0_axi_*)
        .m0_axi_awvalid  (),
        .m0_axi_awready  (m0_aw_ready),
        .m0_axi_awaddr   (),
        .m0_axi_awid     (),
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
        .m0_axi_bready   (),
        .m0_axi_bid      (m0_b_id),
        .m0_axi_bresp    (m0_b_resp),
        .m0_axi_arvalid  (),
        .m0_axi_arready  (m0_ar_ready),
        .m0_axi_araddr   (),
        .m0_axi_arid     (),
        .m0_axi_arregion (),
        .m0_axi_arlen    (),
        .m0_axi_arsize   (),
        .m0_axi_arburst  (),
        .m0_axi_arlock   (),
        .m0_axi_arcache  (),
        .m0_axi_arqos    (),
        .m0_axi_arprot   (),
        .m0_axi_rvalid   (m0_r_valid),
        .m0_axi_rready   (),
        .m0_axi_rdata    (m0_r_data),
        .m0_axi_rid      (m0_r_id),
        .m0_axi_rresp    (m0_r_resp),
        .m0_axi_rlast    (m0_r_last),
        // slave 1 (m1_axi_*)
        .m1_axi_awvalid  (),
        .m1_axi_awready  (m1_aw_ready),
        .m1_axi_awaddr   (),
        .m1_axi_awid     (),
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
        .m1_axi_bready   (),
        .m1_axi_bid      (m1_b_id),
        .m1_axi_bresp    (m1_b_resp),
        .m1_axi_arvalid  (),
        .m1_axi_arready  (m1_ar_ready),
        .m1_axi_araddr   (),
        .m1_axi_arid     (),
        .m1_axi_arregion (),
        .m1_axi_arlen    (),
        .m1_axi_arsize   (),
        .m1_axi_arburst  (),
        .m1_axi_arlock   (),
        .m1_axi_arcache  (),
        .m1_axi_arqos    (),
        .m1_axi_arprot   (),
        .m1_axi_rvalid   (m1_r_valid),
        .m1_axi_rready   (),
        .m1_axi_rdata    (m1_r_data),
        .m1_axi_rid      (m1_r_id),
        .m1_axi_rresp    (m1_r_resp),
        .m1_axi_rlast    (m1_r_last),
        .aclk            (clk),
        .aresetn         (!rst)
    );

    // =========================================================================
    // Assume well-formed AXI4 stimulus for master 0 only
    // (properties are checked on the master 0 B channel)
    // =========================================================================

    // AW is stable once valid until accepted
    always @(posedge clk) begin
        if (!rst && $past(aw_valid) && !$past(aw_ready))
            assume(aw_valid && aw_id == $past(aw_id) && aw_addr == $past(aw_addr));
    end

    // b_ready is eventually asserted (no backpressure deadlock in proof)
    assume property (@(posedge clk) disable iff (rst) b_valid |-> ##[1:5] b_ready);

    // Slave always accepts AW and W (simplify proof: slaves are always ready)
    assume property (@(posedge clk) disable iff (rst) m0_aw_ready);
    assume property (@(posedge clk) disable iff (rst) m0_w_ready);
    assume property (@(posedge clk) disable iff (rst) m1_aw_ready);
    assume property (@(posedge clk) disable iff (rst) m1_w_ready);

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
            if (aw_valid && aw_ready) begin
                outstanding    <= 1'b1;
                outstanding_id <= aw_id;
            end
            if (b_valid && b_ready) begin
                outstanding <= 1'b0;
            end
        end
    end

    // Only one outstanding write at a time from master 0
    assume property (
        @(posedge clk) disable iff (rst)
        (outstanding && aw_valid) |-> (aw_id == outstanding_id)
    );

    // =========================================================================
    // Property 1: B.id[3:0] always matches the outstanding AW.id
    // The upper bit (masterIndexBits) encodes which master issued the write.
    // For master 0 the index bit is 0; the lower bits carry the transaction ID.
    // =========================================================================
    prop_b_routes_to_issuer: assert property (
        @(posedge clk) disable iff (rst)
        (b_valid && outstanding) |-> (b_id[3:0] == outstanding_id)
    );

    // =========================================================================
    // Property 2: No spurious B on master 0's channel
    // =========================================================================
    prop_no_spurious_b: assert property (
        @(posedge clk) disable iff (rst)
        b_valid |-> outstanding
    );

endmodule
