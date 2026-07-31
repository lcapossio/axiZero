// Copyright (c) 2026 Leonardo Capossio - bard0 design  hello@bard0.com
// SPDX-License-Identifier: MIT
// Generator : SpinalHDL v1.14.2    git head : 78f29dc66110fc099a777992b6daa2f803ab445e
// Component : AxiZeroLiteTop
// Git hash  : c7f02aefbe00cd12f17e50e87e7cc6a26db8edf3

`timescale 1ns/1ps

module AxiZeroLiteTop (
  input  wire          s0_axi_awvalid,
  output wire          s0_axi_awready,
  input  wire [31:0]   s0_axi_awaddr,
  input  wire [2:0]    s0_axi_awprot,
  input  wire          s0_axi_wvalid,
  output wire          s0_axi_wready,
  input  wire [31:0]   s0_axi_wdata,
  input  wire [3:0]    s0_axi_wstrb,
  output wire          s0_axi_bvalid,
  input  wire          s0_axi_bready,
  output wire [1:0]    s0_axi_bresp,
  input  wire          s0_axi_arvalid,
  output wire          s0_axi_arready,
  input  wire [31:0]   s0_axi_araddr,
  input  wire [2:0]    s0_axi_arprot,
  output wire          s0_axi_rvalid,
  input  wire          s0_axi_rready,
  output wire [31:0]   s0_axi_rdata,
  output wire [1:0]    s0_axi_rresp,
  input  wire          s1_axi_awvalid,
  output wire          s1_axi_awready,
  input  wire [31:0]   s1_axi_awaddr,
  input  wire [2:0]    s1_axi_awprot,
  input  wire          s1_axi_wvalid,
  output wire          s1_axi_wready,
  input  wire [31:0]   s1_axi_wdata,
  input  wire [3:0]    s1_axi_wstrb,
  output wire          s1_axi_bvalid,
  input  wire          s1_axi_bready,
  output wire [1:0]    s1_axi_bresp,
  input  wire          s1_axi_arvalid,
  output wire          s1_axi_arready,
  input  wire [31:0]   s1_axi_araddr,
  input  wire [2:0]    s1_axi_arprot,
  output wire          s1_axi_rvalid,
  input  wire          s1_axi_rready,
  output wire [31:0]   s1_axi_rdata,
  output wire [1:0]    s1_axi_rresp,
  output wire          m0_axi_awvalid,
  input  wire          m0_axi_awready,
  output wire [31:0]   m0_axi_awaddr,
  output wire [2:0]    m0_axi_awprot,
  output wire          m0_axi_wvalid,
  input  wire          m0_axi_wready,
  output wire [31:0]   m0_axi_wdata,
  output wire [3:0]    m0_axi_wstrb,
  input  wire          m0_axi_bvalid,
  output wire          m0_axi_bready,
  input  wire [1:0]    m0_axi_bresp,
  output wire          m0_axi_arvalid,
  input  wire          m0_axi_arready,
  output wire [31:0]   m0_axi_araddr,
  output wire [2:0]    m0_axi_arprot,
  input  wire          m0_axi_rvalid,
  output wire          m0_axi_rready,
  input  wire [31:0]   m0_axi_rdata,
  input  wire [1:0]    m0_axi_rresp,
  output wire          m1_axi_awvalid,
  input  wire          m1_axi_awready,
  output wire [31:0]   m1_axi_awaddr,
  output wire [2:0]    m1_axi_awprot,
  output wire          m1_axi_wvalid,
  input  wire          m1_axi_wready,
  output wire [31:0]   m1_axi_wdata,
  output wire [3:0]    m1_axi_wstrb,
  input  wire          m1_axi_bvalid,
  output wire          m1_axi_bready,
  input  wire [1:0]    m1_axi_bresp,
  output wire          m1_axi_arvalid,
  input  wire          m1_axi_arready,
  output wire [31:0]   m1_axi_araddr,
  output wire [2:0]    m1_axi_arprot,
  input  wire          m1_axi_rvalid,
  output wire          m1_axi_rready,
  input  wire [31:0]   m1_axi_rdata,
  input  wire [1:0]    m1_axi_rresp,
  input  wire          aclk,
  input  wire          aresetn
);

  wire                xbar_io_masters_0_ar_ready;
  wire                xbar_io_masters_0_aw_ready;
  wire                xbar_io_masters_0_w_ready;
  wire                xbar_io_masters_0_r_valid;
  wire       [31:0]   xbar_io_masters_0_r_payload_data;
  wire       [1:0]    xbar_io_masters_0_r_payload_resp;
  wire                xbar_io_masters_0_b_valid;
  wire       [1:0]    xbar_io_masters_0_b_payload_resp;
  wire                xbar_io_masters_1_ar_ready;
  wire                xbar_io_masters_1_aw_ready;
  wire                xbar_io_masters_1_w_ready;
  wire                xbar_io_masters_1_r_valid;
  wire       [31:0]   xbar_io_masters_1_r_payload_data;
  wire       [1:0]    xbar_io_masters_1_r_payload_resp;
  wire                xbar_io_masters_1_b_valid;
  wire       [1:0]    xbar_io_masters_1_b_payload_resp;
  wire                xbar_io_slaves_0_ar_valid;
  wire       [31:0]   xbar_io_slaves_0_ar_payload_addr;
  wire       [2:0]    xbar_io_slaves_0_ar_payload_prot;
  wire                xbar_io_slaves_0_aw_valid;
  wire       [31:0]   xbar_io_slaves_0_aw_payload_addr;
  wire       [2:0]    xbar_io_slaves_0_aw_payload_prot;
  wire                xbar_io_slaves_0_w_valid;
  wire       [31:0]   xbar_io_slaves_0_w_payload_data;
  wire       [3:0]    xbar_io_slaves_0_w_payload_strb;
  wire                xbar_io_slaves_0_r_ready;
  wire                xbar_io_slaves_0_b_ready;
  wire                xbar_io_slaves_1_ar_valid;
  wire       [31:0]   xbar_io_slaves_1_ar_payload_addr;
  wire       [2:0]    xbar_io_slaves_1_ar_payload_prot;
  wire                xbar_io_slaves_1_aw_valid;
  wire       [31:0]   xbar_io_slaves_1_aw_payload_addr;
  wire       [2:0]    xbar_io_slaves_1_aw_payload_prot;
  wire                xbar_io_slaves_1_w_valid;
  wire       [31:0]   xbar_io_slaves_1_w_payload_data;
  wire       [3:0]    xbar_io_slaves_1_w_payload_strb;
  wire                xbar_io_slaves_1_r_ready;
  wire                xbar_io_slaves_1_b_ready;
  wire                axi4LiteRegSlice_2_io_upstream_ar_ready;
  wire                axi4LiteRegSlice_2_io_upstream_aw_ready;
  wire                axi4LiteRegSlice_2_io_upstream_w_ready;
  wire                axi4LiteRegSlice_2_io_upstream_r_valid;
  wire       [31:0]   axi4LiteRegSlice_2_io_upstream_r_payload_data;
  wire       [1:0]    axi4LiteRegSlice_2_io_upstream_r_payload_resp;
  wire                axi4LiteRegSlice_2_io_upstream_b_valid;
  wire       [1:0]    axi4LiteRegSlice_2_io_upstream_b_payload_resp;
  wire                axi4LiteRegSlice_2_io_downstream_ar_valid;
  wire       [31:0]   axi4LiteRegSlice_2_io_downstream_ar_payload_addr;
  wire       [2:0]    axi4LiteRegSlice_2_io_downstream_ar_payload_prot;
  wire                axi4LiteRegSlice_2_io_downstream_aw_valid;
  wire       [31:0]   axi4LiteRegSlice_2_io_downstream_aw_payload_addr;
  wire       [2:0]    axi4LiteRegSlice_2_io_downstream_aw_payload_prot;
  wire                axi4LiteRegSlice_2_io_downstream_w_valid;
  wire       [31:0]   axi4LiteRegSlice_2_io_downstream_w_payload_data;
  wire       [3:0]    axi4LiteRegSlice_2_io_downstream_w_payload_strb;
  wire                axi4LiteRegSlice_2_io_downstream_r_ready;
  wire                axi4LiteRegSlice_2_io_downstream_b_ready;
  wire                axi4LiteRegSlice_3_io_upstream_ar_ready;
  wire                axi4LiteRegSlice_3_io_upstream_aw_ready;
  wire                axi4LiteRegSlice_3_io_upstream_w_ready;
  wire                axi4LiteRegSlice_3_io_upstream_r_valid;
  wire       [31:0]   axi4LiteRegSlice_3_io_upstream_r_payload_data;
  wire       [1:0]    axi4LiteRegSlice_3_io_upstream_r_payload_resp;
  wire                axi4LiteRegSlice_3_io_upstream_b_valid;
  wire       [1:0]    axi4LiteRegSlice_3_io_upstream_b_payload_resp;
  wire                axi4LiteRegSlice_3_io_downstream_ar_valid;
  wire       [31:0]   axi4LiteRegSlice_3_io_downstream_ar_payload_addr;
  wire       [2:0]    axi4LiteRegSlice_3_io_downstream_ar_payload_prot;
  wire                axi4LiteRegSlice_3_io_downstream_aw_valid;
  wire       [31:0]   axi4LiteRegSlice_3_io_downstream_aw_payload_addr;
  wire       [2:0]    axi4LiteRegSlice_3_io_downstream_aw_payload_prot;
  wire                axi4LiteRegSlice_3_io_downstream_w_valid;
  wire       [31:0]   axi4LiteRegSlice_3_io_downstream_w_payload_data;
  wire       [3:0]    axi4LiteRegSlice_3_io_downstream_w_payload_strb;
  wire                axi4LiteRegSlice_3_io_downstream_r_ready;
  wire                axi4LiteRegSlice_3_io_downstream_b_ready;

  Axi4LiteCrossbar xbar (
    .s0_axi_awvalid        (axi4LiteRegSlice_2_io_downstream_aw_valid             ), //i
    .s0_axi_awready        (xbar_io_masters_0_aw_ready                            ), //o
    .s0_axi_awaddr (axi4LiteRegSlice_2_io_downstream_aw_payload_addr[31:0]), //i
    .s0_axi_awprot (axi4LiteRegSlice_2_io_downstream_aw_payload_prot[2:0] ), //i
    .s0_axi_wvalid         (axi4LiteRegSlice_2_io_downstream_w_valid              ), //i
    .s0_axi_wready         (xbar_io_masters_0_w_ready                             ), //o
    .s0_axi_wdata  (axi4LiteRegSlice_2_io_downstream_w_payload_data[31:0] ), //i
    .s0_axi_wstrb  (axi4LiteRegSlice_2_io_downstream_w_payload_strb[3:0]  ), //i
    .s0_axi_bvalid         (xbar_io_masters_0_b_valid                             ), //o
    .s0_axi_bready         (axi4LiteRegSlice_2_io_downstream_b_ready              ), //i
    .s0_axi_bresp  (xbar_io_masters_0_b_payload_resp[1:0]                 ), //o
    .s0_axi_arvalid        (axi4LiteRegSlice_2_io_downstream_ar_valid             ), //i
    .s0_axi_arready        (xbar_io_masters_0_ar_ready                            ), //o
    .s0_axi_araddr (axi4LiteRegSlice_2_io_downstream_ar_payload_addr[31:0]), //i
    .s0_axi_arprot (axi4LiteRegSlice_2_io_downstream_ar_payload_prot[2:0] ), //i
    .s0_axi_rvalid         (xbar_io_masters_0_r_valid                             ), //o
    .s0_axi_rready         (axi4LiteRegSlice_2_io_downstream_r_ready              ), //i
    .s0_axi_rdata  (xbar_io_masters_0_r_payload_data[31:0]                ), //o
    .s0_axi_rresp  (xbar_io_masters_0_r_payload_resp[1:0]                 ), //o
    .s1_axi_awvalid        (s1_axi_awvalid                                 ), //i
    .s1_axi_awready        (xbar_io_masters_1_aw_ready                            ), //o
    .s1_axi_awaddr (s1_axi_awaddr[31:0]                    ), //i
    .s1_axi_awprot (s1_axi_awprot[2:0]                     ), //i
    .s1_axi_wvalid         (s1_axi_wvalid                                  ), //i
    .s1_axi_wready         (xbar_io_masters_1_w_ready                             ), //o
    .s1_axi_wdata  (s1_axi_wdata[31:0]                     ), //i
    .s1_axi_wstrb  (s1_axi_wstrb[3:0]                      ), //i
    .s1_axi_bvalid         (xbar_io_masters_1_b_valid                             ), //o
    .s1_axi_bready         (s1_axi_bready                                  ), //i
    .s1_axi_bresp  (xbar_io_masters_1_b_payload_resp[1:0]                 ), //o
    .s1_axi_arvalid        (s1_axi_arvalid                                 ), //i
    .s1_axi_arready        (xbar_io_masters_1_ar_ready                            ), //o
    .s1_axi_araddr (s1_axi_araddr[31:0]                    ), //i
    .s1_axi_arprot (s1_axi_arprot[2:0]                     ), //i
    .s1_axi_rvalid         (xbar_io_masters_1_r_valid                             ), //o
    .s1_axi_rready         (s1_axi_rready                                  ), //i
    .s1_axi_rdata  (xbar_io_masters_1_r_payload_data[31:0]                ), //o
    .s1_axi_rresp  (xbar_io_masters_1_r_payload_resp[1:0]                 ), //o
    .m0_axi_awvalid         (xbar_io_slaves_0_aw_valid                             ), //o
    .m0_axi_awready         (axi4LiteRegSlice_3_io_upstream_aw_ready               ), //i
    .m0_axi_awaddr  (xbar_io_slaves_0_aw_payload_addr[31:0]                ), //o
    .m0_axi_awprot  (xbar_io_slaves_0_aw_payload_prot[2:0]                 ), //o
    .m0_axi_wvalid          (xbar_io_slaves_0_w_valid                              ), //o
    .m0_axi_wready          (axi4LiteRegSlice_3_io_upstream_w_ready                ), //i
    .m0_axi_wdata   (xbar_io_slaves_0_w_payload_data[31:0]                 ), //o
    .m0_axi_wstrb   (xbar_io_slaves_0_w_payload_strb[3:0]                  ), //o
    .m0_axi_bvalid          (axi4LiteRegSlice_3_io_upstream_b_valid                ), //i
    .m0_axi_bready          (xbar_io_slaves_0_b_ready                              ), //o
    .m0_axi_bresp   (axi4LiteRegSlice_3_io_upstream_b_payload_resp[1:0]    ), //i
    .m0_axi_arvalid         (xbar_io_slaves_0_ar_valid                             ), //o
    .m0_axi_arready         (axi4LiteRegSlice_3_io_upstream_ar_ready               ), //i
    .m0_axi_araddr  (xbar_io_slaves_0_ar_payload_addr[31:0]                ), //o
    .m0_axi_arprot  (xbar_io_slaves_0_ar_payload_prot[2:0]                 ), //o
    .m0_axi_rvalid          (axi4LiteRegSlice_3_io_upstream_r_valid                ), //i
    .m0_axi_rready          (xbar_io_slaves_0_r_ready                              ), //o
    .m0_axi_rdata   (axi4LiteRegSlice_3_io_upstream_r_payload_data[31:0]   ), //i
    .m0_axi_rresp   (axi4LiteRegSlice_3_io_upstream_r_payload_resp[1:0]    ), //i
    .m1_axi_awvalid         (xbar_io_slaves_1_aw_valid                             ), //o
    .m1_axi_awready         (m1_axi_awready                                  ), //i
    .m1_axi_awaddr  (xbar_io_slaves_1_aw_payload_addr[31:0]                ), //o
    .m1_axi_awprot  (xbar_io_slaves_1_aw_payload_prot[2:0]                 ), //o
    .m1_axi_wvalid          (xbar_io_slaves_1_w_valid                              ), //o
    .m1_axi_wready          (m1_axi_wready                                   ), //i
    .m1_axi_wdata   (xbar_io_slaves_1_w_payload_data[31:0]                 ), //o
    .m1_axi_wstrb   (xbar_io_slaves_1_w_payload_strb[3:0]                  ), //o
    .m1_axi_bvalid          (m1_axi_bvalid                                   ), //i
    .m1_axi_bready          (xbar_io_slaves_1_b_ready                              ), //o
    .m1_axi_bresp   (m1_axi_bresp[1:0]                       ), //i
    .m1_axi_arvalid         (xbar_io_slaves_1_ar_valid                             ), //o
    .m1_axi_arready         (m1_axi_arready                                  ), //i
    .m1_axi_araddr  (xbar_io_slaves_1_ar_payload_addr[31:0]                ), //o
    .m1_axi_arprot  (xbar_io_slaves_1_ar_payload_prot[2:0]                 ), //o
    .m1_axi_rvalid          (m1_axi_rvalid                                   ), //i
    .m1_axi_rready          (xbar_io_slaves_1_r_ready                              ), //o
    .m1_axi_rdata   (m1_axi_rdata[31:0]                      ), //i
    .m1_axi_rresp   (m1_axi_rresp[1:0]                       ), //i
    .aclk                          (aclk                                                   ), //i
    .aresetn                       (aresetn                                                )  //i
  );
  Axi4LiteRegSlice axi4LiteRegSlice_2 (
    .io_upstream_aw_valid          (s0_axi_awvalid                                 ), //i
    .io_upstream_aw_ready          (axi4LiteRegSlice_2_io_upstream_aw_ready               ), //o
    .io_upstream_aw_payload_addr   (s0_axi_awaddr[31:0]                    ), //i
    .io_upstream_aw_payload_prot   (s0_axi_awprot[2:0]                     ), //i
    .io_upstream_w_valid           (s0_axi_wvalid                                  ), //i
    .io_upstream_w_ready           (axi4LiteRegSlice_2_io_upstream_w_ready                ), //o
    .io_upstream_w_payload_data    (s0_axi_wdata[31:0]                     ), //i
    .io_upstream_w_payload_strb    (s0_axi_wstrb[3:0]                      ), //i
    .io_upstream_b_valid           (axi4LiteRegSlice_2_io_upstream_b_valid                ), //o
    .io_upstream_b_ready           (s0_axi_bready                                  ), //i
    .io_upstream_b_payload_resp    (axi4LiteRegSlice_2_io_upstream_b_payload_resp[1:0]    ), //o
    .io_upstream_ar_valid          (s0_axi_arvalid                                 ), //i
    .io_upstream_ar_ready          (axi4LiteRegSlice_2_io_upstream_ar_ready               ), //o
    .io_upstream_ar_payload_addr   (s0_axi_araddr[31:0]                    ), //i
    .io_upstream_ar_payload_prot   (s0_axi_arprot[2:0]                     ), //i
    .io_upstream_r_valid           (axi4LiteRegSlice_2_io_upstream_r_valid                ), //o
    .io_upstream_r_ready           (s0_axi_rready                                  ), //i
    .io_upstream_r_payload_data    (axi4LiteRegSlice_2_io_upstream_r_payload_data[31:0]   ), //o
    .io_upstream_r_payload_resp    (axi4LiteRegSlice_2_io_upstream_r_payload_resp[1:0]    ), //o
    .io_downstream_aw_valid        (axi4LiteRegSlice_2_io_downstream_aw_valid             ), //o
    .io_downstream_aw_ready        (xbar_io_masters_0_aw_ready                            ), //i
    .io_downstream_aw_payload_addr (axi4LiteRegSlice_2_io_downstream_aw_payload_addr[31:0]), //o
    .io_downstream_aw_payload_prot (axi4LiteRegSlice_2_io_downstream_aw_payload_prot[2:0] ), //o
    .io_downstream_w_valid         (axi4LiteRegSlice_2_io_downstream_w_valid              ), //o
    .io_downstream_w_ready         (xbar_io_masters_0_w_ready                             ), //i
    .io_downstream_w_payload_data  (axi4LiteRegSlice_2_io_downstream_w_payload_data[31:0] ), //o
    .io_downstream_w_payload_strb  (axi4LiteRegSlice_2_io_downstream_w_payload_strb[3:0]  ), //o
    .io_downstream_b_valid         (xbar_io_masters_0_b_valid                             ), //i
    .io_downstream_b_ready         (axi4LiteRegSlice_2_io_downstream_b_ready              ), //o
    .io_downstream_b_payload_resp  (xbar_io_masters_0_b_payload_resp[1:0]                 ), //i
    .io_downstream_ar_valid        (axi4LiteRegSlice_2_io_downstream_ar_valid             ), //o
    .io_downstream_ar_ready        (xbar_io_masters_0_ar_ready                            ), //i
    .io_downstream_ar_payload_addr (axi4LiteRegSlice_2_io_downstream_ar_payload_addr[31:0]), //o
    .io_downstream_ar_payload_prot (axi4LiteRegSlice_2_io_downstream_ar_payload_prot[2:0] ), //o
    .io_downstream_r_valid         (xbar_io_masters_0_r_valid                             ), //i
    .io_downstream_r_ready         (axi4LiteRegSlice_2_io_downstream_r_ready              ), //o
    .io_downstream_r_payload_data  (xbar_io_masters_0_r_payload_data[31:0]                ), //i
    .io_downstream_r_payload_resp  (xbar_io_masters_0_r_payload_resp[1:0]                 ), //i
    .aclk                           (aclk                                                   ), //i
    .aresetn                        (aresetn                                                )  //i
  );
  Axi4LiteRegSlice axi4LiteRegSlice_3 (
    .io_upstream_aw_valid          (xbar_io_slaves_0_aw_valid                             ), //i
    .io_upstream_aw_ready          (axi4LiteRegSlice_3_io_upstream_aw_ready               ), //o
    .io_upstream_aw_payload_addr   (xbar_io_slaves_0_aw_payload_addr[31:0]                ), //i
    .io_upstream_aw_payload_prot   (xbar_io_slaves_0_aw_payload_prot[2:0]                 ), //i
    .io_upstream_w_valid           (xbar_io_slaves_0_w_valid                              ), //i
    .io_upstream_w_ready           (axi4LiteRegSlice_3_io_upstream_w_ready                ), //o
    .io_upstream_w_payload_data    (xbar_io_slaves_0_w_payload_data[31:0]                 ), //i
    .io_upstream_w_payload_strb    (xbar_io_slaves_0_w_payload_strb[3:0]                  ), //i
    .io_upstream_b_valid           (axi4LiteRegSlice_3_io_upstream_b_valid                ), //o
    .io_upstream_b_ready           (xbar_io_slaves_0_b_ready                              ), //i
    .io_upstream_b_payload_resp    (axi4LiteRegSlice_3_io_upstream_b_payload_resp[1:0]    ), //o
    .io_upstream_ar_valid          (xbar_io_slaves_0_ar_valid                             ), //i
    .io_upstream_ar_ready          (axi4LiteRegSlice_3_io_upstream_ar_ready               ), //o
    .io_upstream_ar_payload_addr   (xbar_io_slaves_0_ar_payload_addr[31:0]                ), //i
    .io_upstream_ar_payload_prot   (xbar_io_slaves_0_ar_payload_prot[2:0]                 ), //i
    .io_upstream_r_valid           (axi4LiteRegSlice_3_io_upstream_r_valid                ), //o
    .io_upstream_r_ready           (xbar_io_slaves_0_r_ready                              ), //i
    .io_upstream_r_payload_data    (axi4LiteRegSlice_3_io_upstream_r_payload_data[31:0]   ), //o
    .io_upstream_r_payload_resp    (axi4LiteRegSlice_3_io_upstream_r_payload_resp[1:0]    ), //o
    .io_downstream_aw_valid        (axi4LiteRegSlice_3_io_downstream_aw_valid             ), //o
    .io_downstream_aw_ready        (m0_axi_awready                                  ), //i
    .io_downstream_aw_payload_addr (axi4LiteRegSlice_3_io_downstream_aw_payload_addr[31:0]), //o
    .io_downstream_aw_payload_prot (axi4LiteRegSlice_3_io_downstream_aw_payload_prot[2:0] ), //o
    .io_downstream_w_valid         (axi4LiteRegSlice_3_io_downstream_w_valid              ), //o
    .io_downstream_w_ready         (m0_axi_wready                                   ), //i
    .io_downstream_w_payload_data  (axi4LiteRegSlice_3_io_downstream_w_payload_data[31:0] ), //o
    .io_downstream_w_payload_strb  (axi4LiteRegSlice_3_io_downstream_w_payload_strb[3:0]  ), //o
    .io_downstream_b_valid         (m0_axi_bvalid                                   ), //i
    .io_downstream_b_ready         (axi4LiteRegSlice_3_io_downstream_b_ready              ), //o
    .io_downstream_b_payload_resp  (m0_axi_bresp[1:0]                       ), //i
    .io_downstream_ar_valid        (axi4LiteRegSlice_3_io_downstream_ar_valid             ), //o
    .io_downstream_ar_ready        (m0_axi_arready                                  ), //i
    .io_downstream_ar_payload_addr (axi4LiteRegSlice_3_io_downstream_ar_payload_addr[31:0]), //o
    .io_downstream_ar_payload_prot (axi4LiteRegSlice_3_io_downstream_ar_payload_prot[2:0] ), //o
    .io_downstream_r_valid         (m0_axi_rvalid                                   ), //i
    .io_downstream_r_ready         (axi4LiteRegSlice_3_io_downstream_r_ready              ), //o
    .io_downstream_r_payload_data  (m0_axi_rdata[31:0]                      ), //i
    .io_downstream_r_payload_resp  (m0_axi_rresp[1:0]                       ), //i
    .aclk                           (aclk                                                   ), //i
    .aresetn                        (aresetn                                                )  //i
  );
  assign s0_axi_awready = axi4LiteRegSlice_2_io_upstream_aw_ready;
  assign s0_axi_wready = axi4LiteRegSlice_2_io_upstream_w_ready;
  assign s0_axi_bvalid = axi4LiteRegSlice_2_io_upstream_b_valid;
  assign s0_axi_bresp = axi4LiteRegSlice_2_io_upstream_b_payload_resp;
  assign s0_axi_arready = axi4LiteRegSlice_2_io_upstream_ar_ready;
  assign s0_axi_rvalid = axi4LiteRegSlice_2_io_upstream_r_valid;
  assign s0_axi_rdata = axi4LiteRegSlice_2_io_upstream_r_payload_data;
  assign s0_axi_rresp = axi4LiteRegSlice_2_io_upstream_r_payload_resp;
  assign s1_axi_awready = xbar_io_masters_1_aw_ready;
  assign s1_axi_wready = xbar_io_masters_1_w_ready;
  assign s1_axi_bvalid = xbar_io_masters_1_b_valid;
  assign s1_axi_bresp = xbar_io_masters_1_b_payload_resp;
  assign s1_axi_arready = xbar_io_masters_1_ar_ready;
  assign s1_axi_rvalid = xbar_io_masters_1_r_valid;
  assign s1_axi_rdata = xbar_io_masters_1_r_payload_data;
  assign s1_axi_rresp = xbar_io_masters_1_r_payload_resp;
  assign m0_axi_awvalid = axi4LiteRegSlice_3_io_downstream_aw_valid;
  assign m0_axi_awaddr = axi4LiteRegSlice_3_io_downstream_aw_payload_addr;
  assign m0_axi_awprot = axi4LiteRegSlice_3_io_downstream_aw_payload_prot;
  assign m0_axi_wvalid = axi4LiteRegSlice_3_io_downstream_w_valid;
  assign m0_axi_wdata = axi4LiteRegSlice_3_io_downstream_w_payload_data;
  assign m0_axi_wstrb = axi4LiteRegSlice_3_io_downstream_w_payload_strb;
  assign m0_axi_bready = axi4LiteRegSlice_3_io_downstream_b_ready;
  assign m0_axi_arvalid = axi4LiteRegSlice_3_io_downstream_ar_valid;
  assign m0_axi_araddr = axi4LiteRegSlice_3_io_downstream_ar_payload_addr;
  assign m0_axi_arprot = axi4LiteRegSlice_3_io_downstream_ar_payload_prot;
  assign m0_axi_rready = axi4LiteRegSlice_3_io_downstream_r_ready;
  assign m1_axi_awvalid = xbar_io_slaves_1_aw_valid;
  assign m1_axi_awaddr = xbar_io_slaves_1_aw_payload_addr;
  assign m1_axi_awprot = xbar_io_slaves_1_aw_payload_prot;
  assign m1_axi_wvalid = xbar_io_slaves_1_w_valid;
  assign m1_axi_wdata = xbar_io_slaves_1_w_payload_data;
  assign m1_axi_wstrb = xbar_io_slaves_1_w_payload_strb;
  assign m1_axi_bready = xbar_io_slaves_1_b_ready;
  assign m1_axi_arvalid = xbar_io_slaves_1_ar_valid;
  assign m1_axi_araddr = xbar_io_slaves_1_ar_payload_addr;
  assign m1_axi_arprot = xbar_io_slaves_1_ar_payload_prot;
  assign m1_axi_rready = xbar_io_slaves_1_r_ready;

endmodule

//Axi4LiteRegSlice_1 replaced by Axi4LiteRegSlice

module Axi4LiteRegSlice (
  input  wire          io_upstream_aw_valid,
  output reg           io_upstream_aw_ready,
  input  wire [31:0]   io_upstream_aw_payload_addr,
  input  wire [2:0]    io_upstream_aw_payload_prot,
  input  wire          io_upstream_w_valid,
  output reg           io_upstream_w_ready,
  input  wire [31:0]   io_upstream_w_payload_data,
  input  wire [3:0]    io_upstream_w_payload_strb,
  output wire          io_upstream_b_valid,
  input  wire          io_upstream_b_ready,
  output wire [1:0]    io_upstream_b_payload_resp,
  input  wire          io_upstream_ar_valid,
  output reg           io_upstream_ar_ready,
  input  wire [31:0]   io_upstream_ar_payload_addr,
  input  wire [2:0]    io_upstream_ar_payload_prot,
  output wire          io_upstream_r_valid,
  input  wire          io_upstream_r_ready,
  output wire [31:0]   io_upstream_r_payload_data,
  output wire [1:0]    io_upstream_r_payload_resp,
  output wire          io_downstream_aw_valid,
  input  wire          io_downstream_aw_ready,
  output wire [31:0]   io_downstream_aw_payload_addr,
  output wire [2:0]    io_downstream_aw_payload_prot,
  output wire          io_downstream_w_valid,
  input  wire          io_downstream_w_ready,
  output wire [31:0]   io_downstream_w_payload_data,
  output wire [3:0]    io_downstream_w_payload_strb,
  input  wire          io_downstream_b_valid,
  output reg           io_downstream_b_ready,
  input  wire [1:0]    io_downstream_b_payload_resp,
  output wire          io_downstream_ar_valid,
  input  wire          io_downstream_ar_ready,
  output wire [31:0]   io_downstream_ar_payload_addr,
  output wire [2:0]    io_downstream_ar_payload_prot,
  input  wire          io_downstream_r_valid,
  output reg           io_downstream_r_ready,
  input  wire [31:0]   io_downstream_r_payload_data,
  input  wire [1:0]    io_downstream_r_payload_resp,
  input  wire          aclk,
  input  wire          aresetn
);

  wire                io_upstream_aw_stage_valid;
  wire                io_upstream_aw_stage_ready;
  wire       [31:0]   io_upstream_aw_stage_payload_addr;
  wire       [2:0]    io_upstream_aw_stage_payload_prot;
  reg                 io_upstream_aw_rValid;
  reg        [31:0]   io_upstream_aw_rData_addr;
  reg        [2:0]    io_upstream_aw_rData_prot;
  wire                when_Stream_l477;
  wire                io_upstream_w_stage_valid;
  wire                io_upstream_w_stage_ready;
  wire       [31:0]   io_upstream_w_stage_payload_data;
  wire       [3:0]    io_upstream_w_stage_payload_strb;
  reg                 io_upstream_w_rValid;
  reg        [31:0]   io_upstream_w_rData_data;
  reg        [3:0]    io_upstream_w_rData_strb;
  wire                when_Stream_l477_1;
  wire                io_upstream_ar_stage_valid;
  wire                io_upstream_ar_stage_ready;
  wire       [31:0]   io_upstream_ar_stage_payload_addr;
  wire       [2:0]    io_upstream_ar_stage_payload_prot;
  reg                 io_upstream_ar_rValid;
  reg        [31:0]   io_upstream_ar_rData_addr;
  reg        [2:0]    io_upstream_ar_rData_prot;
  wire                when_Stream_l477_2;
  wire                io_downstream_b_stage_valid;
  wire                io_downstream_b_stage_ready;
  wire       [1:0]    io_downstream_b_stage_payload_resp;
  reg                 io_downstream_b_rValid;
  reg        [1:0]    io_downstream_b_rData_resp;
  wire                when_Stream_l477_3;
  wire                io_downstream_r_stage_valid;
  wire                io_downstream_r_stage_ready;
  wire       [31:0]   io_downstream_r_stage_payload_data;
  wire       [1:0]    io_downstream_r_stage_payload_resp;
  reg                 io_downstream_r_rValid;
  reg        [31:0]   io_downstream_r_rData_data;
  reg        [1:0]    io_downstream_r_rData_resp;
  wire                when_Stream_l477_4;

  always @(*) begin
    io_upstream_aw_ready = io_upstream_aw_stage_ready;
    if(when_Stream_l477) begin
      io_upstream_aw_ready = 1'b1;
    end
  end

  assign when_Stream_l477 = (! io_upstream_aw_stage_valid);
  assign io_upstream_aw_stage_valid = io_upstream_aw_rValid;
  assign io_upstream_aw_stage_payload_addr = io_upstream_aw_rData_addr;
  assign io_upstream_aw_stage_payload_prot = io_upstream_aw_rData_prot;
  assign io_downstream_aw_valid = io_upstream_aw_stage_valid;
  assign io_upstream_aw_stage_ready = io_downstream_aw_ready;
  assign io_downstream_aw_payload_addr = io_upstream_aw_stage_payload_addr;
  assign io_downstream_aw_payload_prot = io_upstream_aw_stage_payload_prot;
  always @(*) begin
    io_upstream_w_ready = io_upstream_w_stage_ready;
    if(when_Stream_l477_1) begin
      io_upstream_w_ready = 1'b1;
    end
  end

  assign when_Stream_l477_1 = (! io_upstream_w_stage_valid);
  assign io_upstream_w_stage_valid = io_upstream_w_rValid;
  assign io_upstream_w_stage_payload_data = io_upstream_w_rData_data;
  assign io_upstream_w_stage_payload_strb = io_upstream_w_rData_strb;
  assign io_downstream_w_valid = io_upstream_w_stage_valid;
  assign io_upstream_w_stage_ready = io_downstream_w_ready;
  assign io_downstream_w_payload_data = io_upstream_w_stage_payload_data;
  assign io_downstream_w_payload_strb = io_upstream_w_stage_payload_strb;
  always @(*) begin
    io_upstream_ar_ready = io_upstream_ar_stage_ready;
    if(when_Stream_l477_2) begin
      io_upstream_ar_ready = 1'b1;
    end
  end

  assign when_Stream_l477_2 = (! io_upstream_ar_stage_valid);
  assign io_upstream_ar_stage_valid = io_upstream_ar_rValid;
  assign io_upstream_ar_stage_payload_addr = io_upstream_ar_rData_addr;
  assign io_upstream_ar_stage_payload_prot = io_upstream_ar_rData_prot;
  assign io_downstream_ar_valid = io_upstream_ar_stage_valid;
  assign io_upstream_ar_stage_ready = io_downstream_ar_ready;
  assign io_downstream_ar_payload_addr = io_upstream_ar_stage_payload_addr;
  assign io_downstream_ar_payload_prot = io_upstream_ar_stage_payload_prot;
  always @(*) begin
    io_downstream_b_ready = io_downstream_b_stage_ready;
    if(when_Stream_l477_3) begin
      io_downstream_b_ready = 1'b1;
    end
  end

  assign when_Stream_l477_3 = (! io_downstream_b_stage_valid);
  assign io_downstream_b_stage_valid = io_downstream_b_rValid;
  assign io_downstream_b_stage_payload_resp = io_downstream_b_rData_resp;
  assign io_upstream_b_valid = io_downstream_b_stage_valid;
  assign io_downstream_b_stage_ready = io_upstream_b_ready;
  assign io_upstream_b_payload_resp = io_downstream_b_stage_payload_resp;
  always @(*) begin
    io_downstream_r_ready = io_downstream_r_stage_ready;
    if(when_Stream_l477_4) begin
      io_downstream_r_ready = 1'b1;
    end
  end

  assign when_Stream_l477_4 = (! io_downstream_r_stage_valid);
  assign io_downstream_r_stage_valid = io_downstream_r_rValid;
  assign io_downstream_r_stage_payload_data = io_downstream_r_rData_data;
  assign io_downstream_r_stage_payload_resp = io_downstream_r_rData_resp;
  assign io_upstream_r_valid = io_downstream_r_stage_valid;
  assign io_downstream_r_stage_ready = io_upstream_r_ready;
  assign io_upstream_r_payload_data = io_downstream_r_stage_payload_data;
  assign io_upstream_r_payload_resp = io_downstream_r_stage_payload_resp;
  always @(posedge aclk) begin
    if(!aresetn) begin
      io_upstream_aw_rValid <= 1'b0;
      io_upstream_w_rValid <= 1'b0;
      io_upstream_ar_rValid <= 1'b0;
      io_downstream_b_rValid <= 1'b0;
      io_downstream_r_rValid <= 1'b0;
    end else begin
      if(io_upstream_aw_ready) begin
        io_upstream_aw_rValid <= io_upstream_aw_valid;
      end
      if(io_upstream_w_ready) begin
        io_upstream_w_rValid <= io_upstream_w_valid;
      end
      if(io_upstream_ar_ready) begin
        io_upstream_ar_rValid <= io_upstream_ar_valid;
      end
      if(io_downstream_b_ready) begin
        io_downstream_b_rValid <= io_downstream_b_valid;
      end
      if(io_downstream_r_ready) begin
        io_downstream_r_rValid <= io_downstream_r_valid;
      end
    end
  end

  always @(posedge aclk) begin
    if(io_upstream_aw_ready) begin
      io_upstream_aw_rData_addr <= io_upstream_aw_payload_addr;
      io_upstream_aw_rData_prot <= io_upstream_aw_payload_prot;
    end
    if(io_upstream_w_ready) begin
      io_upstream_w_rData_data <= io_upstream_w_payload_data;
      io_upstream_w_rData_strb <= io_upstream_w_payload_strb;
    end
    if(io_upstream_ar_ready) begin
      io_upstream_ar_rData_addr <= io_upstream_ar_payload_addr;
      io_upstream_ar_rData_prot <= io_upstream_ar_payload_prot;
    end
    if(io_downstream_b_ready) begin
      io_downstream_b_rData_resp <= io_downstream_b_payload_resp;
    end
    if(io_downstream_r_ready) begin
      io_downstream_r_rData_data <= io_downstream_r_payload_data;
      io_downstream_r_rData_resp <= io_downstream_r_payload_resp;
    end
  end


endmodule

module Axi4LiteCrossbar (
  input  wire          s0_axi_awvalid,
  output reg           s0_axi_awready,
  input  wire [31:0]   s0_axi_awaddr,
  input  wire [2:0]    s0_axi_awprot,
  input  wire          s0_axi_wvalid,
  output reg           s0_axi_wready,
  input  wire [31:0]   s0_axi_wdata,
  input  wire [3:0]    s0_axi_wstrb,
  output reg           s0_axi_bvalid,
  input  wire          s0_axi_bready,
  output reg  [1:0]    s0_axi_bresp,
  input  wire          s0_axi_arvalid,
  output reg           s0_axi_arready,
  input  wire [31:0]   s0_axi_araddr,
  input  wire [2:0]    s0_axi_arprot,
  output reg           s0_axi_rvalid,
  input  wire          s0_axi_rready,
  output reg  [31:0]   s0_axi_rdata,
  output reg  [1:0]    s0_axi_rresp,
  input  wire          s1_axi_awvalid,
  output reg           s1_axi_awready,
  input  wire [31:0]   s1_axi_awaddr,
  input  wire [2:0]    s1_axi_awprot,
  input  wire          s1_axi_wvalid,
  output reg           s1_axi_wready,
  input  wire [31:0]   s1_axi_wdata,
  input  wire [3:0]    s1_axi_wstrb,
  output reg           s1_axi_bvalid,
  input  wire          s1_axi_bready,
  output reg  [1:0]    s1_axi_bresp,
  input  wire          s1_axi_arvalid,
  output reg           s1_axi_arready,
  input  wire [31:0]   s1_axi_araddr,
  input  wire [2:0]    s1_axi_arprot,
  output reg           s1_axi_rvalid,
  input  wire          s1_axi_rready,
  output reg  [31:0]   s1_axi_rdata,
  output reg  [1:0]    s1_axi_rresp,
  output reg           m0_axi_awvalid,
  input  wire          m0_axi_awready,
  output reg  [31:0]   m0_axi_awaddr,
  output reg  [2:0]    m0_axi_awprot,
  output reg           m0_axi_wvalid,
  input  wire          m0_axi_wready,
  output reg  [31:0]   m0_axi_wdata,
  output reg  [3:0]    m0_axi_wstrb,
  input  wire          m0_axi_bvalid,
  output reg           m0_axi_bready,
  input  wire [1:0]    m0_axi_bresp,
  output reg           m0_axi_arvalid,
  input  wire          m0_axi_arready,
  output reg  [31:0]   m0_axi_araddr,
  output reg  [2:0]    m0_axi_arprot,
  input  wire          m0_axi_rvalid,
  output reg           m0_axi_rready,
  input  wire [31:0]   m0_axi_rdata,
  input  wire [1:0]    m0_axi_rresp,
  output reg           m1_axi_awvalid,
  input  wire          m1_axi_awready,
  output reg  [31:0]   m1_axi_awaddr,
  output reg  [2:0]    m1_axi_awprot,
  output reg           m1_axi_wvalid,
  input  wire          m1_axi_wready,
  output reg  [31:0]   m1_axi_wdata,
  output reg  [3:0]    m1_axi_wstrb,
  input  wire          m1_axi_bvalid,
  output reg           m1_axi_bready,
  input  wire [1:0]    m1_axi_bresp,
  output reg           m1_axi_arvalid,
  input  wire          m1_axi_arready,
  output reg  [31:0]   m1_axi_araddr,
  output reg  [2:0]    m1_axi_arprot,
  input  wire          m1_axi_rvalid,
  output reg           m1_axi_rready,
  input  wire [31:0]   m1_axi_rdata,
  input  wire [1:0]    m1_axi_rresp,
  input  wire          aclk,
  input  wire          aresetn
);

  wire       [1:0]    _zz_io_masters_0_b_payload_resp;
  wire       [1:0]    _zz_io_masters_1_b_payload_resp;
  wire       [1:0]    _zz__zz_when_Axi4LiteCrossbar_l131_9;
  wire       [1:0]    _zz__zz_when_Axi4LiteCrossbar_l131_9_1;
  wire       [1:0]    _zz__zz_when_Axi4LiteCrossbar_l131_9_2;
  wire       [1:0]    _zz__zz_when_Axi4LiteCrossbar_l131_9_3;
  wire       [1:0]    _zz__zz_when_Axi4LiteCrossbar_l131_19;
  wire       [1:0]    _zz__zz_when_Axi4LiteCrossbar_l131_19_1;
  wire       [1:0]    _zz__zz_when_Axi4LiteCrossbar_l131_19_2;
  wire       [1:0]    _zz__zz_when_Axi4LiteCrossbar_l131_19_3;
  wire       [1:0]    _zz__zz_when_Axi4LiteCrossbar_l131_29;
  wire       [1:0]    _zz__zz_when_Axi4LiteCrossbar_l131_29_1;
  wire       [1:0]    _zz__zz_when_Axi4LiteCrossbar_l131_29_2;
  wire       [1:0]    _zz__zz_when_Axi4LiteCrossbar_l131_29_3;
  wire       [1:0]    _zz__zz_when_Axi4LiteCrossbar_l131_39;
  wire       [1:0]    _zz__zz_when_Axi4LiteCrossbar_l131_39_1;
  wire       [1:0]    _zz__zz_when_Axi4LiteCrossbar_l131_39_2;
  wire       [1:0]    _zz__zz_when_Axi4LiteCrossbar_l131_39_3;
  reg                 wrActive_0;
  reg                 wrActive_1;
  reg        [0:0]    wrGranted_0;
  reg        [0:0]    wrGranted_1;
  reg        [0:0]    wrRrPtr_0;
  reg        [0:0]    wrRrPtr_1;
  reg                 rdActive_0;
  reg                 rdActive_1;
  reg        [0:0]    rdGranted_0;
  reg        [0:0]    rdGranted_1;
  reg        [0:0]    rdRrPtr_0;
  reg        [0:0]    rdRrPtr_1;
  reg        [1:0]    wrCredits_0_0;
  reg        [1:0]    wrCredits_0_1;
  reg        [1:0]    wrCredits_1_0;
  reg        [1:0]    wrCredits_1_1;
  reg        [1:0]    rdCredits_0_0;
  reg        [1:0]    rdCredits_0_1;
  reg        [1:0]    rdCredits_1_0;
  reg        [1:0]    rdCredits_1_1;
  wire       [33:0]   _zz_io_masters_0_r_payload_data;
  wire       [33:0]   _zz_io_masters_1_r_payload_data;
  wire       [34:0]   _zz_io_slaves_0_aw_payload_addr;
  wire       [35:0]   _zz_io_slaves_0_w_payload_data;
  wire       [34:0]   _zz_io_slaves_0_ar_payload_addr;
  wire       [34:0]   _zz_io_slaves_1_aw_payload_addr;
  wire       [35:0]   _zz_io_slaves_1_w_payload_data;
  wire       [34:0]   _zz_io_slaves_1_ar_payload_addr;
  wire                when_Axi4LiteCrossbar_l196;
  reg        [1:0]    _zz_when_Axi4LiteCrossbar_l208;
  reg        [1:0]    _zz_when_Axi4LiteCrossbar_l208_1;
  reg        [1:0]    _zz_when_Axi4LiteCrossbar_l208_2;
  reg        [1:0]    _zz_when_Axi4LiteCrossbar_l131;
  reg        [1:0]    _zz_when_Axi4LiteCrossbar_l131_1;
  wire                when_Axi4LiteCrossbar_l88;
  wire       [1:0]    _zz_when_Axi4LiteCrossbar_l131_2;
  wire       [1:0]    _zz_when_Axi4LiteCrossbar_l131_3;
  wire       [1:0]    _zz_when_Axi4LiteCrossbar_l131_4;
  reg        [1:0]    _zz_when_Axi4LiteCrossbar_l131_5;
  wire                when_Axi4LiteCrossbar_l88_1;
  wire       [1:0]    _zz_when_Axi4LiteCrossbar_l131_6;
  wire       [1:0]    _zz_when_Axi4LiteCrossbar_l131_7;
  wire       [1:0]    _zz_when_Axi4LiteCrossbar_l131_8;
  wire       [1:0]    _zz_when_Axi4LiteCrossbar_l131_9;
  reg        [0:0]    _zz_wrGranted_0;
  wire                when_Axi4LiteCrossbar_l131;
  wire                when_Axi4LiteCrossbar_l131_1;
  wire                when_Axi4LiteCrossbar_l208;
  wire                when_Axi4LiteCrossbar_l212;
  wire                when_Axi4LiteCrossbar_l212_1;
  wire                io_slaves_0_aw_fire;
  wire                when_Axi4LiteCrossbar_l232;
  wire                when_Axi4LiteCrossbar_l232_1;
  reg                 when_Axi4LiteCrossbar_l250;
  wire                when_Axi4LiteCrossbar_l240;
  reg        [1:0]    _zz_when_Axi4LiteCrossbar_l247;
  wire                when_Axi4LiteCrossbar_l244;
  wire                when_Axi4LiteCrossbar_l247;
  wire                when_Axi4LiteCrossbar_l240_1;
  reg        [1:0]    _zz_when_Axi4LiteCrossbar_l247_1;
  wire                when_Axi4LiteCrossbar_l244_1;
  wire                when_Axi4LiteCrossbar_l247_1;
  wire                when_Axi4LiteCrossbar_l264;
  wire                when_Axi4LiteCrossbar_l264_1;
  wire                io_slaves_0_b_fire;
  wire                when_Axi4LiteCrossbar_l196_1;
  reg        [1:0]    _zz_when_Axi4LiteCrossbar_l208_3;
  reg        [1:0]    _zz_when_Axi4LiteCrossbar_l208_4;
  reg        [1:0]    _zz_when_Axi4LiteCrossbar_l208_5;
  reg        [1:0]    _zz_when_Axi4LiteCrossbar_l131_10;
  reg        [1:0]    _zz_when_Axi4LiteCrossbar_l131_11;
  wire                when_Axi4LiteCrossbar_l88_2;
  wire       [1:0]    _zz_when_Axi4LiteCrossbar_l131_12;
  wire       [1:0]    _zz_when_Axi4LiteCrossbar_l131_13;
  wire       [1:0]    _zz_when_Axi4LiteCrossbar_l131_14;
  reg        [1:0]    _zz_when_Axi4LiteCrossbar_l131_15;
  wire                when_Axi4LiteCrossbar_l88_3;
  wire       [1:0]    _zz_when_Axi4LiteCrossbar_l131_16;
  wire       [1:0]    _zz_when_Axi4LiteCrossbar_l131_17;
  wire       [1:0]    _zz_when_Axi4LiteCrossbar_l131_18;
  wire       [1:0]    _zz_when_Axi4LiteCrossbar_l131_19;
  reg        [0:0]    _zz_wrGranted_1;
  wire                when_Axi4LiteCrossbar_l131_2;
  wire                when_Axi4LiteCrossbar_l131_3;
  wire                when_Axi4LiteCrossbar_l208_1;
  wire                when_Axi4LiteCrossbar_l212_2;
  wire                when_Axi4LiteCrossbar_l212_3;
  wire                io_slaves_1_aw_fire;
  wire                when_Axi4LiteCrossbar_l232_2;
  wire                when_Axi4LiteCrossbar_l232_3;
  reg                 when_Axi4LiteCrossbar_l250_1;
  wire                when_Axi4LiteCrossbar_l240_2;
  reg        [1:0]    _zz_when_Axi4LiteCrossbar_l247_2;
  wire                when_Axi4LiteCrossbar_l244_2;
  wire                when_Axi4LiteCrossbar_l247_2;
  wire                when_Axi4LiteCrossbar_l240_3;
  reg        [1:0]    _zz_when_Axi4LiteCrossbar_l247_3;
  wire                when_Axi4LiteCrossbar_l244_3;
  wire                when_Axi4LiteCrossbar_l247_3;
  wire                when_Axi4LiteCrossbar_l264_2;
  wire                when_Axi4LiteCrossbar_l264_3;
  wire                io_slaves_1_b_fire;
  wire                when_Axi4LiteCrossbar_l285;
  reg        [1:0]    _zz_when_Axi4LiteCrossbar_l296;
  reg        [1:0]    _zz_when_Axi4LiteCrossbar_l296_1;
  reg        [1:0]    _zz_when_Axi4LiteCrossbar_l296_2;
  reg        [1:0]    _zz_when_Axi4LiteCrossbar_l131_20;
  reg        [1:0]    _zz_when_Axi4LiteCrossbar_l131_21;
  wire                when_Axi4LiteCrossbar_l88_4;
  wire       [1:0]    _zz_when_Axi4LiteCrossbar_l131_22;
  wire       [1:0]    _zz_when_Axi4LiteCrossbar_l131_23;
  wire       [1:0]    _zz_when_Axi4LiteCrossbar_l131_24;
  reg        [1:0]    _zz_when_Axi4LiteCrossbar_l131_25;
  wire                when_Axi4LiteCrossbar_l88_5;
  wire       [1:0]    _zz_when_Axi4LiteCrossbar_l131_26;
  wire       [1:0]    _zz_when_Axi4LiteCrossbar_l131_27;
  wire       [1:0]    _zz_when_Axi4LiteCrossbar_l131_28;
  wire       [1:0]    _zz_when_Axi4LiteCrossbar_l131_29;
  reg        [0:0]    _zz_rdGranted_0;
  wire                when_Axi4LiteCrossbar_l131_4;
  wire                when_Axi4LiteCrossbar_l131_5;
  wire                when_Axi4LiteCrossbar_l296;
  wire                when_Axi4LiteCrossbar_l299;
  wire                when_Axi4LiteCrossbar_l299_1;
  wire                io_slaves_0_ar_fire;
  wire                when_Axi4LiteCrossbar_l313;
  wire                when_Axi4LiteCrossbar_l313_1;
  reg                 when_Axi4LiteCrossbar_l329;
  wire                when_Axi4LiteCrossbar_l320;
  reg        [1:0]    _zz_when_Axi4LiteCrossbar_l326;
  wire                when_Axi4LiteCrossbar_l323;
  wire                when_Axi4LiteCrossbar_l326;
  wire                when_Axi4LiteCrossbar_l320_1;
  reg        [1:0]    _zz_when_Axi4LiteCrossbar_l326_1;
  wire                when_Axi4LiteCrossbar_l323_1;
  wire                when_Axi4LiteCrossbar_l326_1;
  wire                when_Axi4LiteCrossbar_l342;
  wire                when_Axi4LiteCrossbar_l342_1;
  wire                io_slaves_0_r_fire;
  wire                when_Axi4LiteCrossbar_l285_1;
  reg        [1:0]    _zz_when_Axi4LiteCrossbar_l296_3;
  reg        [1:0]    _zz_when_Axi4LiteCrossbar_l296_4;
  reg        [1:0]    _zz_when_Axi4LiteCrossbar_l296_5;
  reg        [1:0]    _zz_when_Axi4LiteCrossbar_l131_30;
  reg        [1:0]    _zz_when_Axi4LiteCrossbar_l131_31;
  wire                when_Axi4LiteCrossbar_l88_6;
  wire       [1:0]    _zz_when_Axi4LiteCrossbar_l131_32;
  wire       [1:0]    _zz_when_Axi4LiteCrossbar_l131_33;
  wire       [1:0]    _zz_when_Axi4LiteCrossbar_l131_34;
  reg        [1:0]    _zz_when_Axi4LiteCrossbar_l131_35;
  wire                when_Axi4LiteCrossbar_l88_7;
  wire       [1:0]    _zz_when_Axi4LiteCrossbar_l131_36;
  wire       [1:0]    _zz_when_Axi4LiteCrossbar_l131_37;
  wire       [1:0]    _zz_when_Axi4LiteCrossbar_l131_38;
  wire       [1:0]    _zz_when_Axi4LiteCrossbar_l131_39;
  reg        [0:0]    _zz_rdGranted_1;
  wire                when_Axi4LiteCrossbar_l131_6;
  wire                when_Axi4LiteCrossbar_l131_7;
  wire                when_Axi4LiteCrossbar_l296_1;
  wire                when_Axi4LiteCrossbar_l299_2;
  wire                when_Axi4LiteCrossbar_l299_3;
  wire                io_slaves_1_ar_fire;
  wire                when_Axi4LiteCrossbar_l313_2;
  wire                when_Axi4LiteCrossbar_l313_3;
  reg                 when_Axi4LiteCrossbar_l329_1;
  wire                when_Axi4LiteCrossbar_l320_2;
  reg        [1:0]    _zz_when_Axi4LiteCrossbar_l326_2;
  wire                when_Axi4LiteCrossbar_l323_2;
  wire                when_Axi4LiteCrossbar_l326_2;
  wire                when_Axi4LiteCrossbar_l320_3;
  reg        [1:0]    _zz_when_Axi4LiteCrossbar_l326_3;
  wire                when_Axi4LiteCrossbar_l323_3;
  wire                when_Axi4LiteCrossbar_l326_3;
  wire                when_Axi4LiteCrossbar_l342_2;
  wire                when_Axi4LiteCrossbar_l342_3;
  wire                io_slaves_1_r_fire;

  assign _zz_io_masters_0_b_payload_resp = 2'b00;
  assign _zz_io_masters_1_b_payload_resp = 2'b00;
  assign _zz__zz_when_Axi4LiteCrossbar_l131_9 = (_zz_when_Axi4LiteCrossbar_l131_3 - 2'b01);
  assign _zz__zz_when_Axi4LiteCrossbar_l131_9_1 = (_zz_when_Axi4LiteCrossbar_l131_4 - 2'b01);
  assign _zz__zz_when_Axi4LiteCrossbar_l131_9_2 = (_zz_when_Axi4LiteCrossbar_l131_7 - 2'b01);
  assign _zz__zz_when_Axi4LiteCrossbar_l131_9_3 = (_zz_when_Axi4LiteCrossbar_l131_8 - 2'b01);
  assign _zz__zz_when_Axi4LiteCrossbar_l131_19 = (_zz_when_Axi4LiteCrossbar_l131_13 - 2'b01);
  assign _zz__zz_when_Axi4LiteCrossbar_l131_19_1 = (_zz_when_Axi4LiteCrossbar_l131_14 - 2'b01);
  assign _zz__zz_when_Axi4LiteCrossbar_l131_19_2 = (_zz_when_Axi4LiteCrossbar_l131_17 - 2'b01);
  assign _zz__zz_when_Axi4LiteCrossbar_l131_19_3 = (_zz_when_Axi4LiteCrossbar_l131_18 - 2'b01);
  assign _zz__zz_when_Axi4LiteCrossbar_l131_29 = (_zz_when_Axi4LiteCrossbar_l131_23 - 2'b01);
  assign _zz__zz_when_Axi4LiteCrossbar_l131_29_1 = (_zz_when_Axi4LiteCrossbar_l131_24 - 2'b01);
  assign _zz__zz_when_Axi4LiteCrossbar_l131_29_2 = (_zz_when_Axi4LiteCrossbar_l131_27 - 2'b01);
  assign _zz__zz_when_Axi4LiteCrossbar_l131_29_3 = (_zz_when_Axi4LiteCrossbar_l131_28 - 2'b01);
  assign _zz__zz_when_Axi4LiteCrossbar_l131_39 = (_zz_when_Axi4LiteCrossbar_l131_33 - 2'b01);
  assign _zz__zz_when_Axi4LiteCrossbar_l131_39_1 = (_zz_when_Axi4LiteCrossbar_l131_34 - 2'b01);
  assign _zz__zz_when_Axi4LiteCrossbar_l131_39_2 = (_zz_when_Axi4LiteCrossbar_l131_37 - 2'b01);
  assign _zz__zz_when_Axi4LiteCrossbar_l131_39_3 = (_zz_when_Axi4LiteCrossbar_l131_38 - 2'b01);
  always @(*) begin
    s0_axi_awready = 1'b0;
    if(when_Axi4LiteCrossbar_l196) begin
      if(when_Axi4LiteCrossbar_l208) begin
        if(when_Axi4LiteCrossbar_l212) begin
          s0_axi_awready = m0_axi_awready;
        end
      end
    end
    if(when_Axi4LiteCrossbar_l196_1) begin
      if(when_Axi4LiteCrossbar_l208_1) begin
        if(when_Axi4LiteCrossbar_l212_2) begin
          s0_axi_awready = m1_axi_awready;
        end
      end
    end
  end

  always @(*) begin
    s0_axi_wready = 1'b0;
    if(when_Axi4LiteCrossbar_l196) begin
      if(when_Axi4LiteCrossbar_l208) begin
        if(when_Axi4LiteCrossbar_l212) begin
          s0_axi_wready = m0_axi_wready;
        end
      end
    end else begin
      if(when_Axi4LiteCrossbar_l264) begin
        s0_axi_wready = m0_axi_wready;
      end
    end
    if(when_Axi4LiteCrossbar_l196_1) begin
      if(when_Axi4LiteCrossbar_l208_1) begin
        if(when_Axi4LiteCrossbar_l212_2) begin
          s0_axi_wready = m1_axi_wready;
        end
      end
    end else begin
      if(when_Axi4LiteCrossbar_l264_2) begin
        s0_axi_wready = m1_axi_wready;
      end
    end
  end

  always @(*) begin
    s0_axi_bvalid = 1'b0;
    if(!when_Axi4LiteCrossbar_l196) begin
      if(when_Axi4LiteCrossbar_l264) begin
        s0_axi_bvalid = m0_axi_bvalid;
      end
    end
    if(!when_Axi4LiteCrossbar_l196_1) begin
      if(when_Axi4LiteCrossbar_l264_2) begin
        s0_axi_bvalid = m1_axi_bvalid;
      end
    end
  end

  always @(*) begin
    s0_axi_bresp = _zz_io_masters_0_b_payload_resp[1 : 0];
    if(!when_Axi4LiteCrossbar_l196) begin
      if(when_Axi4LiteCrossbar_l264) begin
        s0_axi_bresp = m0_axi_bresp;
      end
    end
    if(!when_Axi4LiteCrossbar_l196_1) begin
      if(when_Axi4LiteCrossbar_l264_2) begin
        s0_axi_bresp = m1_axi_bresp;
      end
    end
  end

  always @(*) begin
    s0_axi_arready = 1'b0;
    if(when_Axi4LiteCrossbar_l285) begin
      if(when_Axi4LiteCrossbar_l296) begin
        if(when_Axi4LiteCrossbar_l299) begin
          s0_axi_arready = m0_axi_arready;
        end
      end
    end
    if(when_Axi4LiteCrossbar_l285_1) begin
      if(when_Axi4LiteCrossbar_l296_1) begin
        if(when_Axi4LiteCrossbar_l299_2) begin
          s0_axi_arready = m1_axi_arready;
        end
      end
    end
  end

  always @(*) begin
    s0_axi_rvalid = 1'b0;
    if(!when_Axi4LiteCrossbar_l285) begin
      if(when_Axi4LiteCrossbar_l342) begin
        s0_axi_rvalid = m0_axi_rvalid;
      end
    end
    if(!when_Axi4LiteCrossbar_l285_1) begin
      if(when_Axi4LiteCrossbar_l342_2) begin
        s0_axi_rvalid = m1_axi_rvalid;
      end
    end
  end

  assign _zz_io_masters_0_r_payload_data = 34'h0;
  always @(*) begin
    s0_axi_rdata = _zz_io_masters_0_r_payload_data[31 : 0];
    if(!when_Axi4LiteCrossbar_l285) begin
      if(when_Axi4LiteCrossbar_l342) begin
        s0_axi_rdata = m0_axi_rdata;
      end
    end
    if(!when_Axi4LiteCrossbar_l285_1) begin
      if(when_Axi4LiteCrossbar_l342_2) begin
        s0_axi_rdata = m1_axi_rdata;
      end
    end
  end

  always @(*) begin
    s0_axi_rresp = _zz_io_masters_0_r_payload_data[33 : 32];
    if(!when_Axi4LiteCrossbar_l285) begin
      if(when_Axi4LiteCrossbar_l342) begin
        s0_axi_rresp = m0_axi_rresp;
      end
    end
    if(!when_Axi4LiteCrossbar_l285_1) begin
      if(when_Axi4LiteCrossbar_l342_2) begin
        s0_axi_rresp = m1_axi_rresp;
      end
    end
  end

  always @(*) begin
    s1_axi_awready = 1'b0;
    if(when_Axi4LiteCrossbar_l196) begin
      if(when_Axi4LiteCrossbar_l208) begin
        if(when_Axi4LiteCrossbar_l212_1) begin
          s1_axi_awready = m0_axi_awready;
        end
      end
    end
    if(when_Axi4LiteCrossbar_l196_1) begin
      if(when_Axi4LiteCrossbar_l208_1) begin
        if(when_Axi4LiteCrossbar_l212_3) begin
          s1_axi_awready = m1_axi_awready;
        end
      end
    end
  end

  always @(*) begin
    s1_axi_wready = 1'b0;
    if(when_Axi4LiteCrossbar_l196) begin
      if(when_Axi4LiteCrossbar_l208) begin
        if(when_Axi4LiteCrossbar_l212_1) begin
          s1_axi_wready = m0_axi_wready;
        end
      end
    end else begin
      if(when_Axi4LiteCrossbar_l264_1) begin
        s1_axi_wready = m0_axi_wready;
      end
    end
    if(when_Axi4LiteCrossbar_l196_1) begin
      if(when_Axi4LiteCrossbar_l208_1) begin
        if(when_Axi4LiteCrossbar_l212_3) begin
          s1_axi_wready = m1_axi_wready;
        end
      end
    end else begin
      if(when_Axi4LiteCrossbar_l264_3) begin
        s1_axi_wready = m1_axi_wready;
      end
    end
  end

  always @(*) begin
    s1_axi_bvalid = 1'b0;
    if(!when_Axi4LiteCrossbar_l196) begin
      if(when_Axi4LiteCrossbar_l264_1) begin
        s1_axi_bvalid = m0_axi_bvalid;
      end
    end
    if(!when_Axi4LiteCrossbar_l196_1) begin
      if(when_Axi4LiteCrossbar_l264_3) begin
        s1_axi_bvalid = m1_axi_bvalid;
      end
    end
  end

  always @(*) begin
    s1_axi_bresp = _zz_io_masters_1_b_payload_resp[1 : 0];
    if(!when_Axi4LiteCrossbar_l196) begin
      if(when_Axi4LiteCrossbar_l264_1) begin
        s1_axi_bresp = m0_axi_bresp;
      end
    end
    if(!when_Axi4LiteCrossbar_l196_1) begin
      if(when_Axi4LiteCrossbar_l264_3) begin
        s1_axi_bresp = m1_axi_bresp;
      end
    end
  end

  always @(*) begin
    s1_axi_arready = 1'b0;
    if(when_Axi4LiteCrossbar_l285) begin
      if(when_Axi4LiteCrossbar_l296) begin
        if(when_Axi4LiteCrossbar_l299_1) begin
          s1_axi_arready = m0_axi_arready;
        end
      end
    end
    if(when_Axi4LiteCrossbar_l285_1) begin
      if(when_Axi4LiteCrossbar_l296_1) begin
        if(when_Axi4LiteCrossbar_l299_3) begin
          s1_axi_arready = m1_axi_arready;
        end
      end
    end
  end

  always @(*) begin
    s1_axi_rvalid = 1'b0;
    if(!when_Axi4LiteCrossbar_l285) begin
      if(when_Axi4LiteCrossbar_l342_1) begin
        s1_axi_rvalid = m0_axi_rvalid;
      end
    end
    if(!when_Axi4LiteCrossbar_l285_1) begin
      if(when_Axi4LiteCrossbar_l342_3) begin
        s1_axi_rvalid = m1_axi_rvalid;
      end
    end
  end

  assign _zz_io_masters_1_r_payload_data = 34'h0;
  always @(*) begin
    s1_axi_rdata = _zz_io_masters_1_r_payload_data[31 : 0];
    if(!when_Axi4LiteCrossbar_l285) begin
      if(when_Axi4LiteCrossbar_l342_1) begin
        s1_axi_rdata = m0_axi_rdata;
      end
    end
    if(!when_Axi4LiteCrossbar_l285_1) begin
      if(when_Axi4LiteCrossbar_l342_3) begin
        s1_axi_rdata = m1_axi_rdata;
      end
    end
  end

  always @(*) begin
    s1_axi_rresp = _zz_io_masters_1_r_payload_data[33 : 32];
    if(!when_Axi4LiteCrossbar_l285) begin
      if(when_Axi4LiteCrossbar_l342_1) begin
        s1_axi_rresp = m0_axi_rresp;
      end
    end
    if(!when_Axi4LiteCrossbar_l285_1) begin
      if(when_Axi4LiteCrossbar_l342_3) begin
        s1_axi_rresp = m1_axi_rresp;
      end
    end
  end

  always @(*) begin
    m0_axi_awvalid = 1'b0;
    if(when_Axi4LiteCrossbar_l196) begin
      if(when_Axi4LiteCrossbar_l208) begin
        m0_axi_awvalid = 1'b1;
      end
    end
  end

  assign _zz_io_slaves_0_aw_payload_addr = 35'h0;
  always @(*) begin
    m0_axi_awaddr = _zz_io_slaves_0_aw_payload_addr[31 : 0];
    if(when_Axi4LiteCrossbar_l196) begin
      if(when_Axi4LiteCrossbar_l208) begin
        if(when_Axi4LiteCrossbar_l212) begin
          m0_axi_awaddr = s0_axi_awaddr;
        end
        if(when_Axi4LiteCrossbar_l212_1) begin
          m0_axi_awaddr = s1_axi_awaddr;
        end
      end
    end
  end

  always @(*) begin
    m0_axi_awprot = _zz_io_slaves_0_aw_payload_addr[34 : 32];
    if(when_Axi4LiteCrossbar_l196) begin
      if(when_Axi4LiteCrossbar_l208) begin
        if(when_Axi4LiteCrossbar_l212) begin
          m0_axi_awprot = s0_axi_awprot;
        end
        if(when_Axi4LiteCrossbar_l212_1) begin
          m0_axi_awprot = s1_axi_awprot;
        end
      end
    end
  end

  always @(*) begin
    m0_axi_wvalid = 1'b0;
    if(when_Axi4LiteCrossbar_l196) begin
      if(when_Axi4LiteCrossbar_l208) begin
        if(when_Axi4LiteCrossbar_l212) begin
          m0_axi_wvalid = s0_axi_wvalid;
        end
        if(when_Axi4LiteCrossbar_l212_1) begin
          m0_axi_wvalid = s1_axi_wvalid;
        end
      end
    end else begin
      if(when_Axi4LiteCrossbar_l264) begin
        m0_axi_wvalid = s0_axi_wvalid;
      end
      if(when_Axi4LiteCrossbar_l264_1) begin
        m0_axi_wvalid = s1_axi_wvalid;
      end
    end
  end

  assign _zz_io_slaves_0_w_payload_data = 36'h0;
  always @(*) begin
    m0_axi_wdata = _zz_io_slaves_0_w_payload_data[31 : 0];
    if(when_Axi4LiteCrossbar_l196) begin
      if(when_Axi4LiteCrossbar_l208) begin
        if(when_Axi4LiteCrossbar_l212) begin
          m0_axi_wdata = s0_axi_wdata;
        end
        if(when_Axi4LiteCrossbar_l212_1) begin
          m0_axi_wdata = s1_axi_wdata;
        end
      end
    end else begin
      if(when_Axi4LiteCrossbar_l264) begin
        m0_axi_wdata = s0_axi_wdata;
      end
      if(when_Axi4LiteCrossbar_l264_1) begin
        m0_axi_wdata = s1_axi_wdata;
      end
    end
  end

  always @(*) begin
    m0_axi_wstrb = _zz_io_slaves_0_w_payload_data[35 : 32];
    if(when_Axi4LiteCrossbar_l196) begin
      if(when_Axi4LiteCrossbar_l208) begin
        if(when_Axi4LiteCrossbar_l212) begin
          m0_axi_wstrb = s0_axi_wstrb;
        end
        if(when_Axi4LiteCrossbar_l212_1) begin
          m0_axi_wstrb = s1_axi_wstrb;
        end
      end
    end else begin
      if(when_Axi4LiteCrossbar_l264) begin
        m0_axi_wstrb = s0_axi_wstrb;
      end
      if(when_Axi4LiteCrossbar_l264_1) begin
        m0_axi_wstrb = s1_axi_wstrb;
      end
    end
  end

  always @(*) begin
    m0_axi_bready = 1'b0;
    if(!when_Axi4LiteCrossbar_l196) begin
      if(when_Axi4LiteCrossbar_l264) begin
        m0_axi_bready = s0_axi_bready;
      end
      if(when_Axi4LiteCrossbar_l264_1) begin
        m0_axi_bready = s1_axi_bready;
      end
    end
  end

  always @(*) begin
    m0_axi_arvalid = 1'b0;
    if(when_Axi4LiteCrossbar_l285) begin
      if(when_Axi4LiteCrossbar_l296) begin
        m0_axi_arvalid = 1'b1;
      end
    end
  end

  assign _zz_io_slaves_0_ar_payload_addr = 35'h0;
  always @(*) begin
    m0_axi_araddr = _zz_io_slaves_0_ar_payload_addr[31 : 0];
    if(when_Axi4LiteCrossbar_l285) begin
      if(when_Axi4LiteCrossbar_l296) begin
        if(when_Axi4LiteCrossbar_l299) begin
          m0_axi_araddr = s0_axi_araddr;
        end
        if(when_Axi4LiteCrossbar_l299_1) begin
          m0_axi_araddr = s1_axi_araddr;
        end
      end
    end
  end

  always @(*) begin
    m0_axi_arprot = _zz_io_slaves_0_ar_payload_addr[34 : 32];
    if(when_Axi4LiteCrossbar_l285) begin
      if(when_Axi4LiteCrossbar_l296) begin
        if(when_Axi4LiteCrossbar_l299) begin
          m0_axi_arprot = s0_axi_arprot;
        end
        if(when_Axi4LiteCrossbar_l299_1) begin
          m0_axi_arprot = s1_axi_arprot;
        end
      end
    end
  end

  always @(*) begin
    m0_axi_rready = 1'b0;
    if(!when_Axi4LiteCrossbar_l285) begin
      if(when_Axi4LiteCrossbar_l342) begin
        m0_axi_rready = s0_axi_rready;
      end
      if(when_Axi4LiteCrossbar_l342_1) begin
        m0_axi_rready = s1_axi_rready;
      end
    end
  end

  always @(*) begin
    m1_axi_awvalid = 1'b0;
    if(when_Axi4LiteCrossbar_l196_1) begin
      if(when_Axi4LiteCrossbar_l208_1) begin
        m1_axi_awvalid = 1'b1;
      end
    end
  end

  assign _zz_io_slaves_1_aw_payload_addr = 35'h0;
  always @(*) begin
    m1_axi_awaddr = _zz_io_slaves_1_aw_payload_addr[31 : 0];
    if(when_Axi4LiteCrossbar_l196_1) begin
      if(when_Axi4LiteCrossbar_l208_1) begin
        if(when_Axi4LiteCrossbar_l212_2) begin
          m1_axi_awaddr = s0_axi_awaddr;
        end
        if(when_Axi4LiteCrossbar_l212_3) begin
          m1_axi_awaddr = s1_axi_awaddr;
        end
      end
    end
  end

  always @(*) begin
    m1_axi_awprot = _zz_io_slaves_1_aw_payload_addr[34 : 32];
    if(when_Axi4LiteCrossbar_l196_1) begin
      if(when_Axi4LiteCrossbar_l208_1) begin
        if(when_Axi4LiteCrossbar_l212_2) begin
          m1_axi_awprot = s0_axi_awprot;
        end
        if(when_Axi4LiteCrossbar_l212_3) begin
          m1_axi_awprot = s1_axi_awprot;
        end
      end
    end
  end

  always @(*) begin
    m1_axi_wvalid = 1'b0;
    if(when_Axi4LiteCrossbar_l196_1) begin
      if(when_Axi4LiteCrossbar_l208_1) begin
        if(when_Axi4LiteCrossbar_l212_2) begin
          m1_axi_wvalid = s0_axi_wvalid;
        end
        if(when_Axi4LiteCrossbar_l212_3) begin
          m1_axi_wvalid = s1_axi_wvalid;
        end
      end
    end else begin
      if(when_Axi4LiteCrossbar_l264_2) begin
        m1_axi_wvalid = s0_axi_wvalid;
      end
      if(when_Axi4LiteCrossbar_l264_3) begin
        m1_axi_wvalid = s1_axi_wvalid;
      end
    end
  end

  assign _zz_io_slaves_1_w_payload_data = 36'h0;
  always @(*) begin
    m1_axi_wdata = _zz_io_slaves_1_w_payload_data[31 : 0];
    if(when_Axi4LiteCrossbar_l196_1) begin
      if(when_Axi4LiteCrossbar_l208_1) begin
        if(when_Axi4LiteCrossbar_l212_2) begin
          m1_axi_wdata = s0_axi_wdata;
        end
        if(when_Axi4LiteCrossbar_l212_3) begin
          m1_axi_wdata = s1_axi_wdata;
        end
      end
    end else begin
      if(when_Axi4LiteCrossbar_l264_2) begin
        m1_axi_wdata = s0_axi_wdata;
      end
      if(when_Axi4LiteCrossbar_l264_3) begin
        m1_axi_wdata = s1_axi_wdata;
      end
    end
  end

  always @(*) begin
    m1_axi_wstrb = _zz_io_slaves_1_w_payload_data[35 : 32];
    if(when_Axi4LiteCrossbar_l196_1) begin
      if(when_Axi4LiteCrossbar_l208_1) begin
        if(when_Axi4LiteCrossbar_l212_2) begin
          m1_axi_wstrb = s0_axi_wstrb;
        end
        if(when_Axi4LiteCrossbar_l212_3) begin
          m1_axi_wstrb = s1_axi_wstrb;
        end
      end
    end else begin
      if(when_Axi4LiteCrossbar_l264_2) begin
        m1_axi_wstrb = s0_axi_wstrb;
      end
      if(when_Axi4LiteCrossbar_l264_3) begin
        m1_axi_wstrb = s1_axi_wstrb;
      end
    end
  end

  always @(*) begin
    m1_axi_bready = 1'b0;
    if(!when_Axi4LiteCrossbar_l196_1) begin
      if(when_Axi4LiteCrossbar_l264_2) begin
        m1_axi_bready = s0_axi_bready;
      end
      if(when_Axi4LiteCrossbar_l264_3) begin
        m1_axi_bready = s1_axi_bready;
      end
    end
  end

  always @(*) begin
    m1_axi_arvalid = 1'b0;
    if(when_Axi4LiteCrossbar_l285_1) begin
      if(when_Axi4LiteCrossbar_l296_1) begin
        m1_axi_arvalid = 1'b1;
      end
    end
  end

  assign _zz_io_slaves_1_ar_payload_addr = 35'h0;
  always @(*) begin
    m1_axi_araddr = _zz_io_slaves_1_ar_payload_addr[31 : 0];
    if(when_Axi4LiteCrossbar_l285_1) begin
      if(when_Axi4LiteCrossbar_l296_1) begin
        if(when_Axi4LiteCrossbar_l299_2) begin
          m1_axi_araddr = s0_axi_araddr;
        end
        if(when_Axi4LiteCrossbar_l299_3) begin
          m1_axi_araddr = s1_axi_araddr;
        end
      end
    end
  end

  always @(*) begin
    m1_axi_arprot = _zz_io_slaves_1_ar_payload_addr[34 : 32];
    if(when_Axi4LiteCrossbar_l285_1) begin
      if(when_Axi4LiteCrossbar_l296_1) begin
        if(when_Axi4LiteCrossbar_l299_2) begin
          m1_axi_arprot = s0_axi_arprot;
        end
        if(when_Axi4LiteCrossbar_l299_3) begin
          m1_axi_arprot = s1_axi_arprot;
        end
      end
    end
  end

  always @(*) begin
    m1_axi_rready = 1'b0;
    if(!when_Axi4LiteCrossbar_l285_1) begin
      if(when_Axi4LiteCrossbar_l342_2) begin
        m1_axi_rready = s0_axi_rready;
      end
      if(when_Axi4LiteCrossbar_l342_3) begin
        m1_axi_rready = s1_axi_rready;
      end
    end
  end

  assign when_Axi4LiteCrossbar_l196 = (! wrActive_0);
  always @(*) begin
    _zz_when_Axi4LiteCrossbar_l208_1[0] = ((32'h0 <= s0_axi_awaddr) && (s0_axi_awaddr < 32'h00010000));
    _zz_when_Axi4LiteCrossbar_l208_1[1] = ((32'h00010000 <= s0_axi_awaddr) && (s0_axi_awaddr < 32'h00020000));
  end

  always @(*) begin
    _zz_when_Axi4LiteCrossbar_l208[0] = (s0_axi_awvalid && _zz_when_Axi4LiteCrossbar_l208_1[0]);
    _zz_when_Axi4LiteCrossbar_l208[1] = (s1_axi_awvalid && _zz_when_Axi4LiteCrossbar_l208_2[0]);
  end

  always @(*) begin
    _zz_when_Axi4LiteCrossbar_l208_2[0] = ((32'h0 <= s1_axi_awaddr) && (s1_axi_awaddr < 32'h00010000));
    _zz_when_Axi4LiteCrossbar_l208_2[1] = ((32'h00010000 <= s1_axi_awaddr) && (s1_axi_awaddr < 32'h00020000));
  end

  always @(*) begin
    _zz_when_Axi4LiteCrossbar_l131[0] = (_zz_when_Axi4LiteCrossbar_l208[0] && (wrCredits_0_0 != 2'b00));
    _zz_when_Axi4LiteCrossbar_l131[1] = (_zz_when_Axi4LiteCrossbar_l208[1] && (wrCredits_0_1 != 2'b00));
  end

  always @(*) begin
    _zz_when_Axi4LiteCrossbar_l131_1 = 2'b00;
    if(when_Axi4LiteCrossbar_l88) begin
      _zz_when_Axi4LiteCrossbar_l131_1 = 2'b01;
    end
  end

  assign when_Axi4LiteCrossbar_l88 = (1'b1 <= wrRrPtr_0);
  assign _zz_when_Axi4LiteCrossbar_l131_2 = (_zz_when_Axi4LiteCrossbar_l131 & (~ _zz_when_Axi4LiteCrossbar_l131_1));
  assign _zz_when_Axi4LiteCrossbar_l131_3 = _zz_when_Axi4LiteCrossbar_l131_2;
  assign _zz_when_Axi4LiteCrossbar_l131_4 = _zz_when_Axi4LiteCrossbar_l131;
  always @(*) begin
    _zz_when_Axi4LiteCrossbar_l131_5 = 2'b00;
    if(when_Axi4LiteCrossbar_l88_1) begin
      _zz_when_Axi4LiteCrossbar_l131_5 = 2'b01;
    end
  end

  assign when_Axi4LiteCrossbar_l88_1 = (1'b1 <= wrRrPtr_0);
  assign _zz_when_Axi4LiteCrossbar_l131_6 = (_zz_when_Axi4LiteCrossbar_l208 & (~ _zz_when_Axi4LiteCrossbar_l131_5));
  assign _zz_when_Axi4LiteCrossbar_l131_7 = _zz_when_Axi4LiteCrossbar_l131_6;
  assign _zz_when_Axi4LiteCrossbar_l131_8 = _zz_when_Axi4LiteCrossbar_l208;
  assign _zz_when_Axi4LiteCrossbar_l131_9 = ((|_zz_when_Axi4LiteCrossbar_l131) ? ((|_zz_when_Axi4LiteCrossbar_l131_2) ? (_zz_when_Axi4LiteCrossbar_l131_3 & (~ _zz__zz_when_Axi4LiteCrossbar_l131_9)) : (_zz_when_Axi4LiteCrossbar_l131_4 & (~ _zz__zz_when_Axi4LiteCrossbar_l131_9_1))) : ((|_zz_when_Axi4LiteCrossbar_l131_6) ? (_zz_when_Axi4LiteCrossbar_l131_7 & (~ _zz__zz_when_Axi4LiteCrossbar_l131_9_2)) : (_zz_when_Axi4LiteCrossbar_l131_8 & (~ _zz__zz_when_Axi4LiteCrossbar_l131_9_3))));
  always @(*) begin
    _zz_wrGranted_0 = 1'b0;
    if(when_Axi4LiteCrossbar_l131) begin
      _zz_wrGranted_0 = 1'b0;
    end
    if(when_Axi4LiteCrossbar_l131_1) begin
      _zz_wrGranted_0 = 1'b1;
    end
  end

  assign when_Axi4LiteCrossbar_l131 = _zz_when_Axi4LiteCrossbar_l131_9[0];
  assign when_Axi4LiteCrossbar_l131_1 = _zz_when_Axi4LiteCrossbar_l131_9[1];
  assign when_Axi4LiteCrossbar_l208 = (|_zz_when_Axi4LiteCrossbar_l208);
  assign when_Axi4LiteCrossbar_l212 = (_zz_wrGranted_0 == 1'b0);
  assign when_Axi4LiteCrossbar_l212_1 = (_zz_wrGranted_0 == 1'b1);
  assign io_slaves_0_aw_fire = (m0_axi_awvalid && m0_axi_awready);
  assign when_Axi4LiteCrossbar_l232 = ((_zz_wrGranted_0 == 1'b0) && (wrCredits_0_0 != 2'b00));
  assign when_Axi4LiteCrossbar_l232_1 = ((_zz_wrGranted_0 == 1'b1) && (wrCredits_0_1 != 2'b00));
  always @(*) begin
    when_Axi4LiteCrossbar_l250 = 1'b1;
    if(when_Axi4LiteCrossbar_l240) begin
      if(when_Axi4LiteCrossbar_l247) begin
        when_Axi4LiteCrossbar_l250 = 1'b0;
      end
    end
    if(when_Axi4LiteCrossbar_l240_1) begin
      if(when_Axi4LiteCrossbar_l247_1) begin
        when_Axi4LiteCrossbar_l250 = 1'b0;
      end
    end
  end

  assign when_Axi4LiteCrossbar_l240 = _zz_when_Axi4LiteCrossbar_l208[0];
  always @(*) begin
    _zz_when_Axi4LiteCrossbar_l247 = wrCredits_0_0;
    if(when_Axi4LiteCrossbar_l244) begin
      _zz_when_Axi4LiteCrossbar_l247 = (wrCredits_0_0 - 2'b01);
    end
  end

  assign when_Axi4LiteCrossbar_l244 = ((_zz_wrGranted_0 == 1'b0) && (wrCredits_0_0 != 2'b00));
  assign when_Axi4LiteCrossbar_l247 = (_zz_when_Axi4LiteCrossbar_l247 != 2'b00);
  assign when_Axi4LiteCrossbar_l240_1 = _zz_when_Axi4LiteCrossbar_l208[1];
  always @(*) begin
    _zz_when_Axi4LiteCrossbar_l247_1 = wrCredits_0_1;
    if(when_Axi4LiteCrossbar_l244_1) begin
      _zz_when_Axi4LiteCrossbar_l247_1 = (wrCredits_0_1 - 2'b01);
    end
  end

  assign when_Axi4LiteCrossbar_l244_1 = ((_zz_wrGranted_0 == 1'b1) && (wrCredits_0_1 != 2'b00));
  assign when_Axi4LiteCrossbar_l247_1 = (_zz_when_Axi4LiteCrossbar_l247_1 != 2'b00);
  assign when_Axi4LiteCrossbar_l264 = (wrGranted_0 == 1'b0);
  assign when_Axi4LiteCrossbar_l264_1 = (wrGranted_0 == 1'b1);
  assign io_slaves_0_b_fire = (m0_axi_bvalid && m0_axi_bready);
  assign when_Axi4LiteCrossbar_l196_1 = (! wrActive_1);
  always @(*) begin
    _zz_when_Axi4LiteCrossbar_l208_4[0] = ((32'h0 <= s0_axi_awaddr) && (s0_axi_awaddr < 32'h00010000));
    _zz_when_Axi4LiteCrossbar_l208_4[1] = ((32'h00010000 <= s0_axi_awaddr) && (s0_axi_awaddr < 32'h00020000));
  end

  always @(*) begin
    _zz_when_Axi4LiteCrossbar_l208_3[0] = (s0_axi_awvalid && _zz_when_Axi4LiteCrossbar_l208_4[1]);
    _zz_when_Axi4LiteCrossbar_l208_3[1] = (s1_axi_awvalid && _zz_when_Axi4LiteCrossbar_l208_5[1]);
  end

  always @(*) begin
    _zz_when_Axi4LiteCrossbar_l208_5[0] = ((32'h0 <= s1_axi_awaddr) && (s1_axi_awaddr < 32'h00010000));
    _zz_when_Axi4LiteCrossbar_l208_5[1] = ((32'h00010000 <= s1_axi_awaddr) && (s1_axi_awaddr < 32'h00020000));
  end

  always @(*) begin
    _zz_when_Axi4LiteCrossbar_l131_10[0] = (_zz_when_Axi4LiteCrossbar_l208_3[0] && (wrCredits_1_0 != 2'b00));
    _zz_when_Axi4LiteCrossbar_l131_10[1] = (_zz_when_Axi4LiteCrossbar_l208_3[1] && (wrCredits_1_1 != 2'b00));
  end

  always @(*) begin
    _zz_when_Axi4LiteCrossbar_l131_11 = 2'b00;
    if(when_Axi4LiteCrossbar_l88_2) begin
      _zz_when_Axi4LiteCrossbar_l131_11 = 2'b01;
    end
  end

  assign when_Axi4LiteCrossbar_l88_2 = (1'b1 <= wrRrPtr_1);
  assign _zz_when_Axi4LiteCrossbar_l131_12 = (_zz_when_Axi4LiteCrossbar_l131_10 & (~ _zz_when_Axi4LiteCrossbar_l131_11));
  assign _zz_when_Axi4LiteCrossbar_l131_13 = _zz_when_Axi4LiteCrossbar_l131_12;
  assign _zz_when_Axi4LiteCrossbar_l131_14 = _zz_when_Axi4LiteCrossbar_l131_10;
  always @(*) begin
    _zz_when_Axi4LiteCrossbar_l131_15 = 2'b00;
    if(when_Axi4LiteCrossbar_l88_3) begin
      _zz_when_Axi4LiteCrossbar_l131_15 = 2'b01;
    end
  end

  assign when_Axi4LiteCrossbar_l88_3 = (1'b1 <= wrRrPtr_1);
  assign _zz_when_Axi4LiteCrossbar_l131_16 = (_zz_when_Axi4LiteCrossbar_l208_3 & (~ _zz_when_Axi4LiteCrossbar_l131_15));
  assign _zz_when_Axi4LiteCrossbar_l131_17 = _zz_when_Axi4LiteCrossbar_l131_16;
  assign _zz_when_Axi4LiteCrossbar_l131_18 = _zz_when_Axi4LiteCrossbar_l208_3;
  assign _zz_when_Axi4LiteCrossbar_l131_19 = ((|_zz_when_Axi4LiteCrossbar_l131_10) ? ((|_zz_when_Axi4LiteCrossbar_l131_12) ? (_zz_when_Axi4LiteCrossbar_l131_13 & (~ _zz__zz_when_Axi4LiteCrossbar_l131_19)) : (_zz_when_Axi4LiteCrossbar_l131_14 & (~ _zz__zz_when_Axi4LiteCrossbar_l131_19_1))) : ((|_zz_when_Axi4LiteCrossbar_l131_16) ? (_zz_when_Axi4LiteCrossbar_l131_17 & (~ _zz__zz_when_Axi4LiteCrossbar_l131_19_2)) : (_zz_when_Axi4LiteCrossbar_l131_18 & (~ _zz__zz_when_Axi4LiteCrossbar_l131_19_3))));
  always @(*) begin
    _zz_wrGranted_1 = 1'b0;
    if(when_Axi4LiteCrossbar_l131_2) begin
      _zz_wrGranted_1 = 1'b0;
    end
    if(when_Axi4LiteCrossbar_l131_3) begin
      _zz_wrGranted_1 = 1'b1;
    end
  end

  assign when_Axi4LiteCrossbar_l131_2 = _zz_when_Axi4LiteCrossbar_l131_19[0];
  assign when_Axi4LiteCrossbar_l131_3 = _zz_when_Axi4LiteCrossbar_l131_19[1];
  assign when_Axi4LiteCrossbar_l208_1 = (|_zz_when_Axi4LiteCrossbar_l208_3);
  assign when_Axi4LiteCrossbar_l212_2 = (_zz_wrGranted_1 == 1'b0);
  assign when_Axi4LiteCrossbar_l212_3 = (_zz_wrGranted_1 == 1'b1);
  assign io_slaves_1_aw_fire = (m1_axi_awvalid && m1_axi_awready);
  assign when_Axi4LiteCrossbar_l232_2 = ((_zz_wrGranted_1 == 1'b0) && (wrCredits_1_0 != 2'b00));
  assign when_Axi4LiteCrossbar_l232_3 = ((_zz_wrGranted_1 == 1'b1) && (wrCredits_1_1 != 2'b00));
  always @(*) begin
    when_Axi4LiteCrossbar_l250_1 = 1'b1;
    if(when_Axi4LiteCrossbar_l240_2) begin
      if(when_Axi4LiteCrossbar_l247_2) begin
        when_Axi4LiteCrossbar_l250_1 = 1'b0;
      end
    end
    if(when_Axi4LiteCrossbar_l240_3) begin
      if(when_Axi4LiteCrossbar_l247_3) begin
        when_Axi4LiteCrossbar_l250_1 = 1'b0;
      end
    end
  end

  assign when_Axi4LiteCrossbar_l240_2 = _zz_when_Axi4LiteCrossbar_l208_3[0];
  always @(*) begin
    _zz_when_Axi4LiteCrossbar_l247_2 = wrCredits_1_0;
    if(when_Axi4LiteCrossbar_l244_2) begin
      _zz_when_Axi4LiteCrossbar_l247_2 = (wrCredits_1_0 - 2'b01);
    end
  end

  assign when_Axi4LiteCrossbar_l244_2 = ((_zz_wrGranted_1 == 1'b0) && (wrCredits_1_0 != 2'b00));
  assign when_Axi4LiteCrossbar_l247_2 = (_zz_when_Axi4LiteCrossbar_l247_2 != 2'b00);
  assign when_Axi4LiteCrossbar_l240_3 = _zz_when_Axi4LiteCrossbar_l208_3[1];
  always @(*) begin
    _zz_when_Axi4LiteCrossbar_l247_3 = wrCredits_1_1;
    if(when_Axi4LiteCrossbar_l244_3) begin
      _zz_when_Axi4LiteCrossbar_l247_3 = (wrCredits_1_1 - 2'b01);
    end
  end

  assign when_Axi4LiteCrossbar_l244_3 = ((_zz_wrGranted_1 == 1'b1) && (wrCredits_1_1 != 2'b00));
  assign when_Axi4LiteCrossbar_l247_3 = (_zz_when_Axi4LiteCrossbar_l247_3 != 2'b00);
  assign when_Axi4LiteCrossbar_l264_2 = (wrGranted_1 == 1'b0);
  assign when_Axi4LiteCrossbar_l264_3 = (wrGranted_1 == 1'b1);
  assign io_slaves_1_b_fire = (m1_axi_bvalid && m1_axi_bready);
  assign when_Axi4LiteCrossbar_l285 = (! rdActive_0);
  always @(*) begin
    _zz_when_Axi4LiteCrossbar_l296_1[0] = ((32'h0 <= s0_axi_araddr) && (s0_axi_araddr < 32'h00010000));
    _zz_when_Axi4LiteCrossbar_l296_1[1] = ((32'h00010000 <= s0_axi_araddr) && (s0_axi_araddr < 32'h00020000));
  end

  always @(*) begin
    _zz_when_Axi4LiteCrossbar_l296[0] = (s0_axi_arvalid && _zz_when_Axi4LiteCrossbar_l296_1[0]);
    _zz_when_Axi4LiteCrossbar_l296[1] = (s1_axi_arvalid && _zz_when_Axi4LiteCrossbar_l296_2[0]);
  end

  always @(*) begin
    _zz_when_Axi4LiteCrossbar_l296_2[0] = ((32'h0 <= s1_axi_araddr) && (s1_axi_araddr < 32'h00010000));
    _zz_when_Axi4LiteCrossbar_l296_2[1] = ((32'h00010000 <= s1_axi_araddr) && (s1_axi_araddr < 32'h00020000));
  end

  always @(*) begin
    _zz_when_Axi4LiteCrossbar_l131_20[0] = (_zz_when_Axi4LiteCrossbar_l296[0] && (rdCredits_0_0 != 2'b00));
    _zz_when_Axi4LiteCrossbar_l131_20[1] = (_zz_when_Axi4LiteCrossbar_l296[1] && (rdCredits_0_1 != 2'b00));
  end

  always @(*) begin
    _zz_when_Axi4LiteCrossbar_l131_21 = 2'b00;
    if(when_Axi4LiteCrossbar_l88_4) begin
      _zz_when_Axi4LiteCrossbar_l131_21 = 2'b01;
    end
  end

  assign when_Axi4LiteCrossbar_l88_4 = (1'b1 <= rdRrPtr_0);
  assign _zz_when_Axi4LiteCrossbar_l131_22 = (_zz_when_Axi4LiteCrossbar_l131_20 & (~ _zz_when_Axi4LiteCrossbar_l131_21));
  assign _zz_when_Axi4LiteCrossbar_l131_23 = _zz_when_Axi4LiteCrossbar_l131_22;
  assign _zz_when_Axi4LiteCrossbar_l131_24 = _zz_when_Axi4LiteCrossbar_l131_20;
  always @(*) begin
    _zz_when_Axi4LiteCrossbar_l131_25 = 2'b00;
    if(when_Axi4LiteCrossbar_l88_5) begin
      _zz_when_Axi4LiteCrossbar_l131_25 = 2'b01;
    end
  end

  assign when_Axi4LiteCrossbar_l88_5 = (1'b1 <= rdRrPtr_0);
  assign _zz_when_Axi4LiteCrossbar_l131_26 = (_zz_when_Axi4LiteCrossbar_l296 & (~ _zz_when_Axi4LiteCrossbar_l131_25));
  assign _zz_when_Axi4LiteCrossbar_l131_27 = _zz_when_Axi4LiteCrossbar_l131_26;
  assign _zz_when_Axi4LiteCrossbar_l131_28 = _zz_when_Axi4LiteCrossbar_l296;
  assign _zz_when_Axi4LiteCrossbar_l131_29 = ((|_zz_when_Axi4LiteCrossbar_l131_20) ? ((|_zz_when_Axi4LiteCrossbar_l131_22) ? (_zz_when_Axi4LiteCrossbar_l131_23 & (~ _zz__zz_when_Axi4LiteCrossbar_l131_29)) : (_zz_when_Axi4LiteCrossbar_l131_24 & (~ _zz__zz_when_Axi4LiteCrossbar_l131_29_1))) : ((|_zz_when_Axi4LiteCrossbar_l131_26) ? (_zz_when_Axi4LiteCrossbar_l131_27 & (~ _zz__zz_when_Axi4LiteCrossbar_l131_29_2)) : (_zz_when_Axi4LiteCrossbar_l131_28 & (~ _zz__zz_when_Axi4LiteCrossbar_l131_29_3))));
  always @(*) begin
    _zz_rdGranted_0 = 1'b0;
    if(when_Axi4LiteCrossbar_l131_4) begin
      _zz_rdGranted_0 = 1'b0;
    end
    if(when_Axi4LiteCrossbar_l131_5) begin
      _zz_rdGranted_0 = 1'b1;
    end
  end

  assign when_Axi4LiteCrossbar_l131_4 = _zz_when_Axi4LiteCrossbar_l131_29[0];
  assign when_Axi4LiteCrossbar_l131_5 = _zz_when_Axi4LiteCrossbar_l131_29[1];
  assign when_Axi4LiteCrossbar_l296 = (|_zz_when_Axi4LiteCrossbar_l296);
  assign when_Axi4LiteCrossbar_l299 = (_zz_rdGranted_0 == 1'b0);
  assign when_Axi4LiteCrossbar_l299_1 = (_zz_rdGranted_0 == 1'b1);
  assign io_slaves_0_ar_fire = (m0_axi_arvalid && m0_axi_arready);
  assign when_Axi4LiteCrossbar_l313 = ((_zz_rdGranted_0 == 1'b0) && (rdCredits_0_0 != 2'b00));
  assign when_Axi4LiteCrossbar_l313_1 = ((_zz_rdGranted_0 == 1'b1) && (rdCredits_0_1 != 2'b00));
  always @(*) begin
    when_Axi4LiteCrossbar_l329 = 1'b1;
    if(when_Axi4LiteCrossbar_l320) begin
      if(when_Axi4LiteCrossbar_l326) begin
        when_Axi4LiteCrossbar_l329 = 1'b0;
      end
    end
    if(when_Axi4LiteCrossbar_l320_1) begin
      if(when_Axi4LiteCrossbar_l326_1) begin
        when_Axi4LiteCrossbar_l329 = 1'b0;
      end
    end
  end

  assign when_Axi4LiteCrossbar_l320 = _zz_when_Axi4LiteCrossbar_l296[0];
  always @(*) begin
    _zz_when_Axi4LiteCrossbar_l326 = rdCredits_0_0;
    if(when_Axi4LiteCrossbar_l323) begin
      _zz_when_Axi4LiteCrossbar_l326 = (rdCredits_0_0 - 2'b01);
    end
  end

  assign when_Axi4LiteCrossbar_l323 = ((_zz_rdGranted_0 == 1'b0) && (rdCredits_0_0 != 2'b00));
  assign when_Axi4LiteCrossbar_l326 = (_zz_when_Axi4LiteCrossbar_l326 != 2'b00);
  assign when_Axi4LiteCrossbar_l320_1 = _zz_when_Axi4LiteCrossbar_l296[1];
  always @(*) begin
    _zz_when_Axi4LiteCrossbar_l326_1 = rdCredits_0_1;
    if(when_Axi4LiteCrossbar_l323_1) begin
      _zz_when_Axi4LiteCrossbar_l326_1 = (rdCredits_0_1 - 2'b01);
    end
  end

  assign when_Axi4LiteCrossbar_l323_1 = ((_zz_rdGranted_0 == 1'b1) && (rdCredits_0_1 != 2'b00));
  assign when_Axi4LiteCrossbar_l326_1 = (_zz_when_Axi4LiteCrossbar_l326_1 != 2'b00);
  assign when_Axi4LiteCrossbar_l342 = (rdGranted_0 == 1'b0);
  assign when_Axi4LiteCrossbar_l342_1 = (rdGranted_0 == 1'b1);
  assign io_slaves_0_r_fire = (m0_axi_rvalid && m0_axi_rready);
  assign when_Axi4LiteCrossbar_l285_1 = (! rdActive_1);
  always @(*) begin
    _zz_when_Axi4LiteCrossbar_l296_4[0] = ((32'h0 <= s0_axi_araddr) && (s0_axi_araddr < 32'h00010000));
    _zz_when_Axi4LiteCrossbar_l296_4[1] = ((32'h00010000 <= s0_axi_araddr) && (s0_axi_araddr < 32'h00020000));
  end

  always @(*) begin
    _zz_when_Axi4LiteCrossbar_l296_3[0] = (s0_axi_arvalid && _zz_when_Axi4LiteCrossbar_l296_4[1]);
    _zz_when_Axi4LiteCrossbar_l296_3[1] = (s1_axi_arvalid && _zz_when_Axi4LiteCrossbar_l296_5[1]);
  end

  always @(*) begin
    _zz_when_Axi4LiteCrossbar_l296_5[0] = ((32'h0 <= s1_axi_araddr) && (s1_axi_araddr < 32'h00010000));
    _zz_when_Axi4LiteCrossbar_l296_5[1] = ((32'h00010000 <= s1_axi_araddr) && (s1_axi_araddr < 32'h00020000));
  end

  always @(*) begin
    _zz_when_Axi4LiteCrossbar_l131_30[0] = (_zz_when_Axi4LiteCrossbar_l296_3[0] && (rdCredits_1_0 != 2'b00));
    _zz_when_Axi4LiteCrossbar_l131_30[1] = (_zz_when_Axi4LiteCrossbar_l296_3[1] && (rdCredits_1_1 != 2'b00));
  end

  always @(*) begin
    _zz_when_Axi4LiteCrossbar_l131_31 = 2'b00;
    if(when_Axi4LiteCrossbar_l88_6) begin
      _zz_when_Axi4LiteCrossbar_l131_31 = 2'b01;
    end
  end

  assign when_Axi4LiteCrossbar_l88_6 = (1'b1 <= rdRrPtr_1);
  assign _zz_when_Axi4LiteCrossbar_l131_32 = (_zz_when_Axi4LiteCrossbar_l131_30 & (~ _zz_when_Axi4LiteCrossbar_l131_31));
  assign _zz_when_Axi4LiteCrossbar_l131_33 = _zz_when_Axi4LiteCrossbar_l131_32;
  assign _zz_when_Axi4LiteCrossbar_l131_34 = _zz_when_Axi4LiteCrossbar_l131_30;
  always @(*) begin
    _zz_when_Axi4LiteCrossbar_l131_35 = 2'b00;
    if(when_Axi4LiteCrossbar_l88_7) begin
      _zz_when_Axi4LiteCrossbar_l131_35 = 2'b01;
    end
  end

  assign when_Axi4LiteCrossbar_l88_7 = (1'b1 <= rdRrPtr_1);
  assign _zz_when_Axi4LiteCrossbar_l131_36 = (_zz_when_Axi4LiteCrossbar_l296_3 & (~ _zz_when_Axi4LiteCrossbar_l131_35));
  assign _zz_when_Axi4LiteCrossbar_l131_37 = _zz_when_Axi4LiteCrossbar_l131_36;
  assign _zz_when_Axi4LiteCrossbar_l131_38 = _zz_when_Axi4LiteCrossbar_l296_3;
  assign _zz_when_Axi4LiteCrossbar_l131_39 = ((|_zz_when_Axi4LiteCrossbar_l131_30) ? ((|_zz_when_Axi4LiteCrossbar_l131_32) ? (_zz_when_Axi4LiteCrossbar_l131_33 & (~ _zz__zz_when_Axi4LiteCrossbar_l131_39)) : (_zz_when_Axi4LiteCrossbar_l131_34 & (~ _zz__zz_when_Axi4LiteCrossbar_l131_39_1))) : ((|_zz_when_Axi4LiteCrossbar_l131_36) ? (_zz_when_Axi4LiteCrossbar_l131_37 & (~ _zz__zz_when_Axi4LiteCrossbar_l131_39_2)) : (_zz_when_Axi4LiteCrossbar_l131_38 & (~ _zz__zz_when_Axi4LiteCrossbar_l131_39_3))));
  always @(*) begin
    _zz_rdGranted_1 = 1'b0;
    if(when_Axi4LiteCrossbar_l131_6) begin
      _zz_rdGranted_1 = 1'b0;
    end
    if(when_Axi4LiteCrossbar_l131_7) begin
      _zz_rdGranted_1 = 1'b1;
    end
  end

  assign when_Axi4LiteCrossbar_l131_6 = _zz_when_Axi4LiteCrossbar_l131_39[0];
  assign when_Axi4LiteCrossbar_l131_7 = _zz_when_Axi4LiteCrossbar_l131_39[1];
  assign when_Axi4LiteCrossbar_l296_1 = (|_zz_when_Axi4LiteCrossbar_l296_3);
  assign when_Axi4LiteCrossbar_l299_2 = (_zz_rdGranted_1 == 1'b0);
  assign when_Axi4LiteCrossbar_l299_3 = (_zz_rdGranted_1 == 1'b1);
  assign io_slaves_1_ar_fire = (m1_axi_arvalid && m1_axi_arready);
  assign when_Axi4LiteCrossbar_l313_2 = ((_zz_rdGranted_1 == 1'b0) && (rdCredits_1_0 != 2'b00));
  assign when_Axi4LiteCrossbar_l313_3 = ((_zz_rdGranted_1 == 1'b1) && (rdCredits_1_1 != 2'b00));
  always @(*) begin
    when_Axi4LiteCrossbar_l329_1 = 1'b1;
    if(when_Axi4LiteCrossbar_l320_2) begin
      if(when_Axi4LiteCrossbar_l326_2) begin
        when_Axi4LiteCrossbar_l329_1 = 1'b0;
      end
    end
    if(when_Axi4LiteCrossbar_l320_3) begin
      if(when_Axi4LiteCrossbar_l326_3) begin
        when_Axi4LiteCrossbar_l329_1 = 1'b0;
      end
    end
  end

  assign when_Axi4LiteCrossbar_l320_2 = _zz_when_Axi4LiteCrossbar_l296_3[0];
  always @(*) begin
    _zz_when_Axi4LiteCrossbar_l326_2 = rdCredits_1_0;
    if(when_Axi4LiteCrossbar_l323_2) begin
      _zz_when_Axi4LiteCrossbar_l326_2 = (rdCredits_1_0 - 2'b01);
    end
  end

  assign when_Axi4LiteCrossbar_l323_2 = ((_zz_rdGranted_1 == 1'b0) && (rdCredits_1_0 != 2'b00));
  assign when_Axi4LiteCrossbar_l326_2 = (_zz_when_Axi4LiteCrossbar_l326_2 != 2'b00);
  assign when_Axi4LiteCrossbar_l320_3 = _zz_when_Axi4LiteCrossbar_l296_3[1];
  always @(*) begin
    _zz_when_Axi4LiteCrossbar_l326_3 = rdCredits_1_1;
    if(when_Axi4LiteCrossbar_l323_3) begin
      _zz_when_Axi4LiteCrossbar_l326_3 = (rdCredits_1_1 - 2'b01);
    end
  end

  assign when_Axi4LiteCrossbar_l323_3 = ((_zz_rdGranted_1 == 1'b1) && (rdCredits_1_1 != 2'b00));
  assign when_Axi4LiteCrossbar_l326_3 = (_zz_when_Axi4LiteCrossbar_l326_3 != 2'b00);
  assign when_Axi4LiteCrossbar_l342_2 = (rdGranted_1 == 1'b0);
  assign when_Axi4LiteCrossbar_l342_3 = (rdGranted_1 == 1'b1);
  assign io_slaves_1_r_fire = (m1_axi_rvalid && m1_axi_rready);
  always @(posedge aclk) begin
    if(!aresetn) begin
      wrActive_0 <= 1'b0;
      wrActive_1 <= 1'b0;
      wrGranted_0 <= 1'b0;
      wrGranted_1 <= 1'b0;
      wrRrPtr_0 <= 1'b0;
      wrRrPtr_1 <= 1'b0;
      rdActive_0 <= 1'b0;
      rdActive_1 <= 1'b0;
      rdGranted_0 <= 1'b0;
      rdGranted_1 <= 1'b0;
      rdRrPtr_0 <= 1'b0;
      rdRrPtr_1 <= 1'b0;
      wrCredits_0_0 <= 2'b11;
      wrCredits_0_1 <= 2'b01;
      wrCredits_1_0 <= 2'b11;
      wrCredits_1_1 <= 2'b01;
      rdCredits_0_0 <= 2'b11;
      rdCredits_0_1 <= 2'b01;
      rdCredits_1_0 <= 2'b11;
      rdCredits_1_1 <= 2'b01;
    end else begin
      if(when_Axi4LiteCrossbar_l196) begin
        if(when_Axi4LiteCrossbar_l208) begin
          if(io_slaves_0_aw_fire) begin
            wrActive_0 <= 1'b1;
            wrGranted_0 <= _zz_wrGranted_0;
            wrRrPtr_0 <= (_zz_wrGranted_0 + 1'b1);
            if(when_Axi4LiteCrossbar_l232) begin
              wrCredits_0_0 <= (wrCredits_0_0 - 2'b01);
            end
            if(when_Axi4LiteCrossbar_l232_1) begin
              wrCredits_0_1 <= (wrCredits_0_1 - 2'b01);
            end
            if(when_Axi4LiteCrossbar_l250) begin
              wrCredits_0_0 <= 2'b11;
              wrCredits_0_1 <= 2'b01;
            end
          end
        end
      end else begin
        if(io_slaves_0_b_fire) begin
          wrActive_0 <= 1'b0;
        end
      end
      if(when_Axi4LiteCrossbar_l196_1) begin
        if(when_Axi4LiteCrossbar_l208_1) begin
          if(io_slaves_1_aw_fire) begin
            wrActive_1 <= 1'b1;
            wrGranted_1 <= _zz_wrGranted_1;
            wrRrPtr_1 <= (_zz_wrGranted_1 + 1'b1);
            if(when_Axi4LiteCrossbar_l232_2) begin
              wrCredits_1_0 <= (wrCredits_1_0 - 2'b01);
            end
            if(when_Axi4LiteCrossbar_l232_3) begin
              wrCredits_1_1 <= (wrCredits_1_1 - 2'b01);
            end
            if(when_Axi4LiteCrossbar_l250_1) begin
              wrCredits_1_0 <= 2'b11;
              wrCredits_1_1 <= 2'b01;
            end
          end
        end
      end else begin
        if(io_slaves_1_b_fire) begin
          wrActive_1 <= 1'b0;
        end
      end
      if(when_Axi4LiteCrossbar_l285) begin
        if(when_Axi4LiteCrossbar_l296) begin
          if(io_slaves_0_ar_fire) begin
            rdActive_0 <= 1'b1;
            rdGranted_0 <= _zz_rdGranted_0;
            rdRrPtr_0 <= (_zz_rdGranted_0 + 1'b1);
            if(when_Axi4LiteCrossbar_l313) begin
              rdCredits_0_0 <= (rdCredits_0_0 - 2'b01);
            end
            if(when_Axi4LiteCrossbar_l313_1) begin
              rdCredits_0_1 <= (rdCredits_0_1 - 2'b01);
            end
            if(when_Axi4LiteCrossbar_l329) begin
              rdCredits_0_0 <= 2'b11;
              rdCredits_0_1 <= 2'b01;
            end
          end
        end
      end else begin
        if(io_slaves_0_r_fire) begin
          rdActive_0 <= 1'b0;
        end
      end
      if(when_Axi4LiteCrossbar_l285_1) begin
        if(when_Axi4LiteCrossbar_l296_1) begin
          if(io_slaves_1_ar_fire) begin
            rdActive_1 <= 1'b1;
            rdGranted_1 <= _zz_rdGranted_1;
            rdRrPtr_1 <= (_zz_rdGranted_1 + 1'b1);
            if(when_Axi4LiteCrossbar_l313_2) begin
              rdCredits_1_0 <= (rdCredits_1_0 - 2'b01);
            end
            if(when_Axi4LiteCrossbar_l313_3) begin
              rdCredits_1_1 <= (rdCredits_1_1 - 2'b01);
            end
            if(when_Axi4LiteCrossbar_l329_1) begin
              rdCredits_1_0 <= 2'b11;
              rdCredits_1_1 <= 2'b01;
            end
          end
        end
      end else begin
        if(io_slaves_1_r_fire) begin
          rdActive_1 <= 1'b0;
        end
      end
    end
  end


endmodule
