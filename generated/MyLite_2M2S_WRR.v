// Copyright (c) 2026 Leonardo Capossio - bard0 design  hello@bard0.com
// SPDX-License-Identifier: MIT
// Generator : SpinalHDL v1.14.2    git head : 78f29dc66110fc099a777992b6daa2f803ab445e
// Component : AxiZeroLiteTop
// Git hash  : e4ae231ab45f2af93f68dbb509b855f6a8cb625a

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

  reg                 decErr_io_axi_aw_valid;
  reg        [31:0]   decErr_io_axi_aw_payload_addr;
  reg        [2:0]    decErr_io_axi_aw_payload_prot;
  reg                 decErr_io_axi_w_valid;
  reg        [31:0]   decErr_io_axi_w_payload_data;
  reg        [3:0]    decErr_io_axi_w_payload_strb;
  reg                 decErr_io_axi_b_ready;
  reg                 decErr_io_axi_ar_valid;
  reg        [31:0]   decErr_io_axi_ar_payload_addr;
  reg        [2:0]    decErr_io_axi_ar_payload_prot;
  reg                 decErr_io_axi_r_ready;
  wire                decErr_io_axi_ar_ready;
  wire                decErr_io_axi_aw_ready;
  wire                decErr_io_axi_w_ready;
  wire                decErr_io_axi_r_valid;
  wire       [31:0]   decErr_io_axi_r_payload_data;
  wire       [1:0]    decErr_io_axi_r_payload_resp;
  wire                decErr_io_axi_b_valid;
  wire       [1:0]    decErr_io_axi_b_payload_resp;
  wire       [1:0]    _zz_io_masters_0_b_payload_resp;
  wire       [1:0]    _zz_io_masters_1_b_payload_resp;
  wire       [2:0]    _zz__zz_when_Axi4LiteCrossbar_l229;
  wire       [2:0]    _zz__zz_when_Axi4LiteCrossbar_l229_1;
  wire       [1:0]    _zz__zz_when_Axi4LiteCrossbar_l152_9;
  wire       [1:0]    _zz__zz_when_Axi4LiteCrossbar_l152_9_1;
  wire       [1:0]    _zz__zz_when_Axi4LiteCrossbar_l152_9_2;
  wire       [1:0]    _zz__zz_when_Axi4LiteCrossbar_l152_9_3;
  wire       [2:0]    _zz__zz_when_Axi4LiteCrossbar_l229_3;
  wire       [2:0]    _zz__zz_when_Axi4LiteCrossbar_l229_3_1;
  wire       [1:0]    _zz__zz_when_Axi4LiteCrossbar_l152_19;
  wire       [1:0]    _zz__zz_when_Axi4LiteCrossbar_l152_19_1;
  wire       [1:0]    _zz__zz_when_Axi4LiteCrossbar_l152_19_2;
  wire       [1:0]    _zz__zz_when_Axi4LiteCrossbar_l152_19_3;
  wire       [2:0]    _zz__zz_when_Axi4LiteCrossbar_l229_6;
  wire       [2:0]    _zz__zz_when_Axi4LiteCrossbar_l229_6_1;
  wire       [1:0]    _zz__zz_when_Axi4LiteCrossbar_l152_29;
  wire       [1:0]    _zz__zz_when_Axi4LiteCrossbar_l152_29_1;
  wire       [1:0]    _zz__zz_when_Axi4LiteCrossbar_l152_29_2;
  wire       [1:0]    _zz__zz_when_Axi4LiteCrossbar_l152_29_3;
  wire       [2:0]    _zz__zz_when_Axi4LiteCrossbar_l317;
  wire       [2:0]    _zz__zz_when_Axi4LiteCrossbar_l317_1;
  wire       [1:0]    _zz__zz_when_Axi4LiteCrossbar_l152_39;
  wire       [1:0]    _zz__zz_when_Axi4LiteCrossbar_l152_39_1;
  wire       [1:0]    _zz__zz_when_Axi4LiteCrossbar_l152_39_2;
  wire       [1:0]    _zz__zz_when_Axi4LiteCrossbar_l152_39_3;
  wire       [2:0]    _zz__zz_when_Axi4LiteCrossbar_l317_3;
  wire       [2:0]    _zz__zz_when_Axi4LiteCrossbar_l317_3_1;
  wire       [1:0]    _zz__zz_when_Axi4LiteCrossbar_l152_49;
  wire       [1:0]    _zz__zz_when_Axi4LiteCrossbar_l152_49_1;
  wire       [1:0]    _zz__zz_when_Axi4LiteCrossbar_l152_49_2;
  wire       [1:0]    _zz__zz_when_Axi4LiteCrossbar_l152_49_3;
  wire       [2:0]    _zz__zz_when_Axi4LiteCrossbar_l317_6;
  wire       [2:0]    _zz__zz_when_Axi4LiteCrossbar_l317_6_1;
  wire       [1:0]    _zz__zz_when_Axi4LiteCrossbar_l152_59;
  wire       [1:0]    _zz__zz_when_Axi4LiteCrossbar_l152_59_1;
  wire       [1:0]    _zz__zz_when_Axi4LiteCrossbar_l152_59_2;
  wire       [1:0]    _zz__zz_when_Axi4LiteCrossbar_l152_59_3;
  reg                 wrActive_0;
  reg                 wrActive_1;
  reg                 wrActive_2;
  reg        [0:0]    wrGranted_0;
  reg        [0:0]    wrGranted_1;
  reg        [0:0]    wrGranted_2;
  reg        [0:0]    wrRrPtr_0;
  reg        [0:0]    wrRrPtr_1;
  reg        [0:0]    wrRrPtr_2;
  reg                 rdActive_0;
  reg                 rdActive_1;
  reg                 rdActive_2;
  reg        [0:0]    rdGranted_0;
  reg        [0:0]    rdGranted_1;
  reg        [0:0]    rdGranted_2;
  reg        [0:0]    rdRrPtr_0;
  reg        [0:0]    rdRrPtr_1;
  reg        [0:0]    rdRrPtr_2;
  reg        [1:0]    wrCredits_0_0;
  reg        [1:0]    wrCredits_0_1;
  reg        [1:0]    wrCredits_1_0;
  reg        [1:0]    wrCredits_1_1;
  reg        [1:0]    wrCredits_2_0;
  reg        [1:0]    wrCredits_2_1;
  reg        [1:0]    rdCredits_0_0;
  reg        [1:0]    rdCredits_0_1;
  reg        [1:0]    rdCredits_1_0;
  reg        [1:0]    rdCredits_1_1;
  reg        [1:0]    rdCredits_2_0;
  reg        [1:0]    rdCredits_2_1;
  wire       [33:0]   _zz_io_masters_0_r_payload_data;
  wire       [33:0]   _zz_io_masters_1_r_payload_data;
  wire       [34:0]   _zz_io_slaves_0_aw_payload_addr;
  wire       [35:0]   _zz_io_slaves_0_w_payload_data;
  wire       [34:0]   _zz_io_slaves_0_ar_payload_addr;
  wire       [34:0]   _zz_io_slaves_1_aw_payload_addr;
  wire       [35:0]   _zz_io_slaves_1_w_payload_data;
  wire       [34:0]   _zz_io_slaves_1_ar_payload_addr;
  wire       [34:0]   _zz_io_axi_aw_payload_addr;
  wire       [35:0]   _zz_io_axi_w_payload_data;
  wire       [34:0]   _zz_io_axi_ar_payload_addr;
  wire                when_Axi4LiteCrossbar_l217;
  reg        [1:0]    _zz_when_Axi4LiteCrossbar_l229;
  reg        [1:0]    _zz_when_Axi4LiteCrossbar_l229_1;
  reg        [1:0]    _zz_when_Axi4LiteCrossbar_l229_2;
  reg        [1:0]    _zz_when_Axi4LiteCrossbar_l152;
  reg        [1:0]    _zz_when_Axi4LiteCrossbar_l152_1;
  wire                when_Axi4LiteCrossbar_l109;
  wire       [1:0]    _zz_when_Axi4LiteCrossbar_l152_2;
  wire       [1:0]    _zz_when_Axi4LiteCrossbar_l152_3;
  wire       [1:0]    _zz_when_Axi4LiteCrossbar_l152_4;
  reg        [1:0]    _zz_when_Axi4LiteCrossbar_l152_5;
  wire                when_Axi4LiteCrossbar_l109_1;
  wire       [1:0]    _zz_when_Axi4LiteCrossbar_l152_6;
  wire       [1:0]    _zz_when_Axi4LiteCrossbar_l152_7;
  wire       [1:0]    _zz_when_Axi4LiteCrossbar_l152_8;
  wire       [1:0]    _zz_when_Axi4LiteCrossbar_l152_9;
  reg        [0:0]    _zz_wrGranted_0;
  wire                when_Axi4LiteCrossbar_l152;
  wire                when_Axi4LiteCrossbar_l152_1;
  wire                when_Axi4LiteCrossbar_l229;
  wire                when_Axi4LiteCrossbar_l233;
  wire                when_Axi4LiteCrossbar_l233_1;
  wire                io_slaves_0_aw_fire;
  wire                when_Axi4LiteCrossbar_l253;
  wire                when_Axi4LiteCrossbar_l253_1;
  reg                 when_Axi4LiteCrossbar_l271;
  wire                when_Axi4LiteCrossbar_l261;
  reg        [1:0]    _zz_when_Axi4LiteCrossbar_l268;
  wire                when_Axi4LiteCrossbar_l265;
  wire                when_Axi4LiteCrossbar_l268;
  wire                when_Axi4LiteCrossbar_l261_1;
  reg        [1:0]    _zz_when_Axi4LiteCrossbar_l268_1;
  wire                when_Axi4LiteCrossbar_l265_1;
  wire                when_Axi4LiteCrossbar_l268_1;
  wire                when_Axi4LiteCrossbar_l285;
  wire                when_Axi4LiteCrossbar_l285_1;
  wire                io_slaves_0_b_fire;
  wire                when_Axi4LiteCrossbar_l217_1;
  reg        [1:0]    _zz_when_Axi4LiteCrossbar_l229_3;
  reg        [1:0]    _zz_when_Axi4LiteCrossbar_l229_4;
  reg        [1:0]    _zz_when_Axi4LiteCrossbar_l229_5;
  reg        [1:0]    _zz_when_Axi4LiteCrossbar_l152_10;
  reg        [1:0]    _zz_when_Axi4LiteCrossbar_l152_11;
  wire                when_Axi4LiteCrossbar_l109_2;
  wire       [1:0]    _zz_when_Axi4LiteCrossbar_l152_12;
  wire       [1:0]    _zz_when_Axi4LiteCrossbar_l152_13;
  wire       [1:0]    _zz_when_Axi4LiteCrossbar_l152_14;
  reg        [1:0]    _zz_when_Axi4LiteCrossbar_l152_15;
  wire                when_Axi4LiteCrossbar_l109_3;
  wire       [1:0]    _zz_when_Axi4LiteCrossbar_l152_16;
  wire       [1:0]    _zz_when_Axi4LiteCrossbar_l152_17;
  wire       [1:0]    _zz_when_Axi4LiteCrossbar_l152_18;
  wire       [1:0]    _zz_when_Axi4LiteCrossbar_l152_19;
  reg        [0:0]    _zz_wrGranted_1;
  wire                when_Axi4LiteCrossbar_l152_2;
  wire                when_Axi4LiteCrossbar_l152_3;
  wire                when_Axi4LiteCrossbar_l229_1;
  wire                when_Axi4LiteCrossbar_l233_2;
  wire                when_Axi4LiteCrossbar_l233_3;
  wire                io_slaves_1_aw_fire;
  wire                when_Axi4LiteCrossbar_l253_2;
  wire                when_Axi4LiteCrossbar_l253_3;
  reg                 when_Axi4LiteCrossbar_l271_1;
  wire                when_Axi4LiteCrossbar_l261_2;
  reg        [1:0]    _zz_when_Axi4LiteCrossbar_l268_2;
  wire                when_Axi4LiteCrossbar_l265_2;
  wire                when_Axi4LiteCrossbar_l268_2;
  wire                when_Axi4LiteCrossbar_l261_3;
  reg        [1:0]    _zz_when_Axi4LiteCrossbar_l268_3;
  wire                when_Axi4LiteCrossbar_l265_3;
  wire                when_Axi4LiteCrossbar_l268_3;
  wire                when_Axi4LiteCrossbar_l285_2;
  wire                when_Axi4LiteCrossbar_l285_3;
  wire                io_slaves_1_b_fire;
  wire                when_Axi4LiteCrossbar_l217_2;
  reg        [1:0]    _zz_when_Axi4LiteCrossbar_l229_6;
  reg        [1:0]    _zz_when_Axi4LiteCrossbar_l229_7;
  reg        [1:0]    _zz_when_Axi4LiteCrossbar_l229_8;
  reg        [1:0]    _zz_when_Axi4LiteCrossbar_l152_20;
  reg        [1:0]    _zz_when_Axi4LiteCrossbar_l152_21;
  wire                when_Axi4LiteCrossbar_l109_4;
  wire       [1:0]    _zz_when_Axi4LiteCrossbar_l152_22;
  wire       [1:0]    _zz_when_Axi4LiteCrossbar_l152_23;
  wire       [1:0]    _zz_when_Axi4LiteCrossbar_l152_24;
  reg        [1:0]    _zz_when_Axi4LiteCrossbar_l152_25;
  wire                when_Axi4LiteCrossbar_l109_5;
  wire       [1:0]    _zz_when_Axi4LiteCrossbar_l152_26;
  wire       [1:0]    _zz_when_Axi4LiteCrossbar_l152_27;
  wire       [1:0]    _zz_when_Axi4LiteCrossbar_l152_28;
  wire       [1:0]    _zz_when_Axi4LiteCrossbar_l152_29;
  reg        [0:0]    _zz_wrGranted_2;
  wire                when_Axi4LiteCrossbar_l152_4;
  wire                when_Axi4LiteCrossbar_l152_5;
  wire                when_Axi4LiteCrossbar_l229_2;
  wire                when_Axi4LiteCrossbar_l233_4;
  wire                when_Axi4LiteCrossbar_l233_5;
  wire                decErr_io_axi_aw_fire;
  wire                when_Axi4LiteCrossbar_l253_4;
  wire                when_Axi4LiteCrossbar_l253_5;
  reg                 when_Axi4LiteCrossbar_l271_2;
  wire                when_Axi4LiteCrossbar_l261_4;
  reg        [1:0]    _zz_when_Axi4LiteCrossbar_l268_4;
  wire                when_Axi4LiteCrossbar_l265_4;
  wire                when_Axi4LiteCrossbar_l268_4;
  wire                when_Axi4LiteCrossbar_l261_5;
  reg        [1:0]    _zz_when_Axi4LiteCrossbar_l268_5;
  wire                when_Axi4LiteCrossbar_l265_5;
  wire                when_Axi4LiteCrossbar_l268_5;
  wire                when_Axi4LiteCrossbar_l285_4;
  wire                when_Axi4LiteCrossbar_l285_5;
  wire                decErr_io_axi_b_fire;
  wire                when_Axi4LiteCrossbar_l306;
  reg        [1:0]    _zz_when_Axi4LiteCrossbar_l317;
  reg        [1:0]    _zz_when_Axi4LiteCrossbar_l317_1;
  reg        [1:0]    _zz_when_Axi4LiteCrossbar_l317_2;
  reg        [1:0]    _zz_when_Axi4LiteCrossbar_l152_30;
  reg        [1:0]    _zz_when_Axi4LiteCrossbar_l152_31;
  wire                when_Axi4LiteCrossbar_l109_6;
  wire       [1:0]    _zz_when_Axi4LiteCrossbar_l152_32;
  wire       [1:0]    _zz_when_Axi4LiteCrossbar_l152_33;
  wire       [1:0]    _zz_when_Axi4LiteCrossbar_l152_34;
  reg        [1:0]    _zz_when_Axi4LiteCrossbar_l152_35;
  wire                when_Axi4LiteCrossbar_l109_7;
  wire       [1:0]    _zz_when_Axi4LiteCrossbar_l152_36;
  wire       [1:0]    _zz_when_Axi4LiteCrossbar_l152_37;
  wire       [1:0]    _zz_when_Axi4LiteCrossbar_l152_38;
  wire       [1:0]    _zz_when_Axi4LiteCrossbar_l152_39;
  reg        [0:0]    _zz_rdGranted_0;
  wire                when_Axi4LiteCrossbar_l152_6;
  wire                when_Axi4LiteCrossbar_l152_7;
  wire                when_Axi4LiteCrossbar_l317;
  wire                when_Axi4LiteCrossbar_l320;
  wire                when_Axi4LiteCrossbar_l320_1;
  wire                io_slaves_0_ar_fire;
  wire                when_Axi4LiteCrossbar_l334;
  wire                when_Axi4LiteCrossbar_l334_1;
  reg                 when_Axi4LiteCrossbar_l350;
  wire                when_Axi4LiteCrossbar_l341;
  reg        [1:0]    _zz_when_Axi4LiteCrossbar_l347;
  wire                when_Axi4LiteCrossbar_l344;
  wire                when_Axi4LiteCrossbar_l347;
  wire                when_Axi4LiteCrossbar_l341_1;
  reg        [1:0]    _zz_when_Axi4LiteCrossbar_l347_1;
  wire                when_Axi4LiteCrossbar_l344_1;
  wire                when_Axi4LiteCrossbar_l347_1;
  wire                when_Axi4LiteCrossbar_l363;
  wire                when_Axi4LiteCrossbar_l363_1;
  wire                io_slaves_0_r_fire;
  wire                when_Axi4LiteCrossbar_l306_1;
  reg        [1:0]    _zz_when_Axi4LiteCrossbar_l317_3;
  reg        [1:0]    _zz_when_Axi4LiteCrossbar_l317_4;
  reg        [1:0]    _zz_when_Axi4LiteCrossbar_l317_5;
  reg        [1:0]    _zz_when_Axi4LiteCrossbar_l152_40;
  reg        [1:0]    _zz_when_Axi4LiteCrossbar_l152_41;
  wire                when_Axi4LiteCrossbar_l109_8;
  wire       [1:0]    _zz_when_Axi4LiteCrossbar_l152_42;
  wire       [1:0]    _zz_when_Axi4LiteCrossbar_l152_43;
  wire       [1:0]    _zz_when_Axi4LiteCrossbar_l152_44;
  reg        [1:0]    _zz_when_Axi4LiteCrossbar_l152_45;
  wire                when_Axi4LiteCrossbar_l109_9;
  wire       [1:0]    _zz_when_Axi4LiteCrossbar_l152_46;
  wire       [1:0]    _zz_when_Axi4LiteCrossbar_l152_47;
  wire       [1:0]    _zz_when_Axi4LiteCrossbar_l152_48;
  wire       [1:0]    _zz_when_Axi4LiteCrossbar_l152_49;
  reg        [0:0]    _zz_rdGranted_1;
  wire                when_Axi4LiteCrossbar_l152_8;
  wire                when_Axi4LiteCrossbar_l152_9;
  wire                when_Axi4LiteCrossbar_l317_1;
  wire                when_Axi4LiteCrossbar_l320_2;
  wire                when_Axi4LiteCrossbar_l320_3;
  wire                io_slaves_1_ar_fire;
  wire                when_Axi4LiteCrossbar_l334_2;
  wire                when_Axi4LiteCrossbar_l334_3;
  reg                 when_Axi4LiteCrossbar_l350_1;
  wire                when_Axi4LiteCrossbar_l341_2;
  reg        [1:0]    _zz_when_Axi4LiteCrossbar_l347_2;
  wire                when_Axi4LiteCrossbar_l344_2;
  wire                when_Axi4LiteCrossbar_l347_2;
  wire                when_Axi4LiteCrossbar_l341_3;
  reg        [1:0]    _zz_when_Axi4LiteCrossbar_l347_3;
  wire                when_Axi4LiteCrossbar_l344_3;
  wire                when_Axi4LiteCrossbar_l347_3;
  wire                when_Axi4LiteCrossbar_l363_2;
  wire                when_Axi4LiteCrossbar_l363_3;
  wire                io_slaves_1_r_fire;
  wire                when_Axi4LiteCrossbar_l306_2;
  reg        [1:0]    _zz_when_Axi4LiteCrossbar_l317_6;
  reg        [1:0]    _zz_when_Axi4LiteCrossbar_l317_7;
  reg        [1:0]    _zz_when_Axi4LiteCrossbar_l317_8;
  reg        [1:0]    _zz_when_Axi4LiteCrossbar_l152_50;
  reg        [1:0]    _zz_when_Axi4LiteCrossbar_l152_51;
  wire                when_Axi4LiteCrossbar_l109_10;
  wire       [1:0]    _zz_when_Axi4LiteCrossbar_l152_52;
  wire       [1:0]    _zz_when_Axi4LiteCrossbar_l152_53;
  wire       [1:0]    _zz_when_Axi4LiteCrossbar_l152_54;
  reg        [1:0]    _zz_when_Axi4LiteCrossbar_l152_55;
  wire                when_Axi4LiteCrossbar_l109_11;
  wire       [1:0]    _zz_when_Axi4LiteCrossbar_l152_56;
  wire       [1:0]    _zz_when_Axi4LiteCrossbar_l152_57;
  wire       [1:0]    _zz_when_Axi4LiteCrossbar_l152_58;
  wire       [1:0]    _zz_when_Axi4LiteCrossbar_l152_59;
  reg        [0:0]    _zz_rdGranted_2;
  wire                when_Axi4LiteCrossbar_l152_10;
  wire                when_Axi4LiteCrossbar_l152_11;
  wire                when_Axi4LiteCrossbar_l317_2;
  wire                when_Axi4LiteCrossbar_l320_4;
  wire                when_Axi4LiteCrossbar_l320_5;
  wire                decErr_io_axi_ar_fire;
  wire                when_Axi4LiteCrossbar_l334_4;
  wire                when_Axi4LiteCrossbar_l334_5;
  reg                 when_Axi4LiteCrossbar_l350_2;
  wire                when_Axi4LiteCrossbar_l341_4;
  reg        [1:0]    _zz_when_Axi4LiteCrossbar_l347_4;
  wire                when_Axi4LiteCrossbar_l344_4;
  wire                when_Axi4LiteCrossbar_l347_4;
  wire                when_Axi4LiteCrossbar_l341_5;
  reg        [1:0]    _zz_when_Axi4LiteCrossbar_l347_5;
  wire                when_Axi4LiteCrossbar_l344_5;
  wire                when_Axi4LiteCrossbar_l347_5;
  wire                when_Axi4LiteCrossbar_l363_4;
  wire                when_Axi4LiteCrossbar_l363_5;
  wire                decErr_io_axi_r_fire;

  assign _zz_io_masters_0_b_payload_resp = 2'b00;
  assign _zz_io_masters_1_b_payload_resp = 2'b00;
  assign _zz__zz_when_Axi4LiteCrossbar_l229 = {(! (|_zz_when_Axi4LiteCrossbar_l229_1)),_zz_when_Axi4LiteCrossbar_l229_1};
  assign _zz__zz_when_Axi4LiteCrossbar_l229_1 = {(! (|_zz_when_Axi4LiteCrossbar_l229_2)),_zz_when_Axi4LiteCrossbar_l229_2};
  assign _zz__zz_when_Axi4LiteCrossbar_l152_9 = (_zz_when_Axi4LiteCrossbar_l152_3 - 2'b01);
  assign _zz__zz_when_Axi4LiteCrossbar_l152_9_1 = (_zz_when_Axi4LiteCrossbar_l152_4 - 2'b01);
  assign _zz__zz_when_Axi4LiteCrossbar_l152_9_2 = (_zz_when_Axi4LiteCrossbar_l152_7 - 2'b01);
  assign _zz__zz_when_Axi4LiteCrossbar_l152_9_3 = (_zz_when_Axi4LiteCrossbar_l152_8 - 2'b01);
  assign _zz__zz_when_Axi4LiteCrossbar_l229_3 = {(! (|_zz_when_Axi4LiteCrossbar_l229_4)),_zz_when_Axi4LiteCrossbar_l229_4};
  assign _zz__zz_when_Axi4LiteCrossbar_l229_3_1 = {(! (|_zz_when_Axi4LiteCrossbar_l229_5)),_zz_when_Axi4LiteCrossbar_l229_5};
  assign _zz__zz_when_Axi4LiteCrossbar_l152_19 = (_zz_when_Axi4LiteCrossbar_l152_13 - 2'b01);
  assign _zz__zz_when_Axi4LiteCrossbar_l152_19_1 = (_zz_when_Axi4LiteCrossbar_l152_14 - 2'b01);
  assign _zz__zz_when_Axi4LiteCrossbar_l152_19_2 = (_zz_when_Axi4LiteCrossbar_l152_17 - 2'b01);
  assign _zz__zz_when_Axi4LiteCrossbar_l152_19_3 = (_zz_when_Axi4LiteCrossbar_l152_18 - 2'b01);
  assign _zz__zz_when_Axi4LiteCrossbar_l229_6 = {(! (|_zz_when_Axi4LiteCrossbar_l229_7)),_zz_when_Axi4LiteCrossbar_l229_7};
  assign _zz__zz_when_Axi4LiteCrossbar_l229_6_1 = {(! (|_zz_when_Axi4LiteCrossbar_l229_8)),_zz_when_Axi4LiteCrossbar_l229_8};
  assign _zz__zz_when_Axi4LiteCrossbar_l152_29 = (_zz_when_Axi4LiteCrossbar_l152_23 - 2'b01);
  assign _zz__zz_when_Axi4LiteCrossbar_l152_29_1 = (_zz_when_Axi4LiteCrossbar_l152_24 - 2'b01);
  assign _zz__zz_when_Axi4LiteCrossbar_l152_29_2 = (_zz_when_Axi4LiteCrossbar_l152_27 - 2'b01);
  assign _zz__zz_when_Axi4LiteCrossbar_l152_29_3 = (_zz_when_Axi4LiteCrossbar_l152_28 - 2'b01);
  assign _zz__zz_when_Axi4LiteCrossbar_l317 = {(! (|_zz_when_Axi4LiteCrossbar_l317_1)),_zz_when_Axi4LiteCrossbar_l317_1};
  assign _zz__zz_when_Axi4LiteCrossbar_l317_1 = {(! (|_zz_when_Axi4LiteCrossbar_l317_2)),_zz_when_Axi4LiteCrossbar_l317_2};
  assign _zz__zz_when_Axi4LiteCrossbar_l152_39 = (_zz_when_Axi4LiteCrossbar_l152_33 - 2'b01);
  assign _zz__zz_when_Axi4LiteCrossbar_l152_39_1 = (_zz_when_Axi4LiteCrossbar_l152_34 - 2'b01);
  assign _zz__zz_when_Axi4LiteCrossbar_l152_39_2 = (_zz_when_Axi4LiteCrossbar_l152_37 - 2'b01);
  assign _zz__zz_when_Axi4LiteCrossbar_l152_39_3 = (_zz_when_Axi4LiteCrossbar_l152_38 - 2'b01);
  assign _zz__zz_when_Axi4LiteCrossbar_l317_3 = {(! (|_zz_when_Axi4LiteCrossbar_l317_4)),_zz_when_Axi4LiteCrossbar_l317_4};
  assign _zz__zz_when_Axi4LiteCrossbar_l317_3_1 = {(! (|_zz_when_Axi4LiteCrossbar_l317_5)),_zz_when_Axi4LiteCrossbar_l317_5};
  assign _zz__zz_when_Axi4LiteCrossbar_l152_49 = (_zz_when_Axi4LiteCrossbar_l152_43 - 2'b01);
  assign _zz__zz_when_Axi4LiteCrossbar_l152_49_1 = (_zz_when_Axi4LiteCrossbar_l152_44 - 2'b01);
  assign _zz__zz_when_Axi4LiteCrossbar_l152_49_2 = (_zz_when_Axi4LiteCrossbar_l152_47 - 2'b01);
  assign _zz__zz_when_Axi4LiteCrossbar_l152_49_3 = (_zz_when_Axi4LiteCrossbar_l152_48 - 2'b01);
  assign _zz__zz_when_Axi4LiteCrossbar_l317_6 = {(! (|_zz_when_Axi4LiteCrossbar_l317_7)),_zz_when_Axi4LiteCrossbar_l317_7};
  assign _zz__zz_when_Axi4LiteCrossbar_l317_6_1 = {(! (|_zz_when_Axi4LiteCrossbar_l317_8)),_zz_when_Axi4LiteCrossbar_l317_8};
  assign _zz__zz_when_Axi4LiteCrossbar_l152_59 = (_zz_when_Axi4LiteCrossbar_l152_53 - 2'b01);
  assign _zz__zz_when_Axi4LiteCrossbar_l152_59_1 = (_zz_when_Axi4LiteCrossbar_l152_54 - 2'b01);
  assign _zz__zz_when_Axi4LiteCrossbar_l152_59_2 = (_zz_when_Axi4LiteCrossbar_l152_57 - 2'b01);
  assign _zz__zz_when_Axi4LiteCrossbar_l152_59_3 = (_zz_when_Axi4LiteCrossbar_l152_58 - 2'b01);
  Axi4DecErrSlave decErr (
    .io_axi_aw_valid        (decErr_io_axi_aw_valid             ), //i
    .io_axi_aw_ready        (decErr_io_axi_aw_ready             ), //o
    .io_axi_aw_payload_addr (decErr_io_axi_aw_payload_addr[31:0]), //i
    .io_axi_aw_payload_prot (decErr_io_axi_aw_payload_prot[2:0] ), //i
    .io_axi_w_valid         (decErr_io_axi_w_valid              ), //i
    .io_axi_w_ready         (decErr_io_axi_w_ready              ), //o
    .io_axi_w_payload_data  (decErr_io_axi_w_payload_data[31:0] ), //i
    .io_axi_w_payload_strb  (decErr_io_axi_w_payload_strb[3:0]  ), //i
    .io_axi_b_valid         (decErr_io_axi_b_valid              ), //o
    .io_axi_b_ready         (decErr_io_axi_b_ready              ), //i
    .io_axi_b_payload_resp  (decErr_io_axi_b_payload_resp[1:0]  ), //o
    .io_axi_ar_valid        (decErr_io_axi_ar_valid             ), //i
    .io_axi_ar_ready        (decErr_io_axi_ar_ready             ), //o
    .io_axi_ar_payload_addr (decErr_io_axi_ar_payload_addr[31:0]), //i
    .io_axi_ar_payload_prot (decErr_io_axi_ar_payload_prot[2:0] ), //i
    .io_axi_r_valid         (decErr_io_axi_r_valid              ), //o
    .io_axi_r_ready         (decErr_io_axi_r_ready              ), //i
    .io_axi_r_payload_data  (decErr_io_axi_r_payload_data[31:0] ), //o
    .io_axi_r_payload_resp  (decErr_io_axi_r_payload_resp[1:0]  ), //o
    .aclk                    (aclk                                ), //i
    .aresetn                 (aresetn                             )  //i
  );
  always @(*) begin
    s0_axi_awready = 1'b0;
    if(when_Axi4LiteCrossbar_l217) begin
      if(when_Axi4LiteCrossbar_l229) begin
        if(when_Axi4LiteCrossbar_l233) begin
          s0_axi_awready = m0_axi_awready;
        end
      end
    end
    if(when_Axi4LiteCrossbar_l217_1) begin
      if(when_Axi4LiteCrossbar_l229_1) begin
        if(when_Axi4LiteCrossbar_l233_2) begin
          s0_axi_awready = m1_axi_awready;
        end
      end
    end
    if(when_Axi4LiteCrossbar_l217_2) begin
      if(when_Axi4LiteCrossbar_l229_2) begin
        if(when_Axi4LiteCrossbar_l233_4) begin
          s0_axi_awready = decErr_io_axi_aw_ready;
        end
      end
    end
  end

  always @(*) begin
    s0_axi_wready = 1'b0;
    if(when_Axi4LiteCrossbar_l217) begin
      if(when_Axi4LiteCrossbar_l229) begin
        if(when_Axi4LiteCrossbar_l233) begin
          s0_axi_wready = m0_axi_wready;
        end
      end
    end else begin
      if(when_Axi4LiteCrossbar_l285) begin
        s0_axi_wready = m0_axi_wready;
      end
    end
    if(when_Axi4LiteCrossbar_l217_1) begin
      if(when_Axi4LiteCrossbar_l229_1) begin
        if(when_Axi4LiteCrossbar_l233_2) begin
          s0_axi_wready = m1_axi_wready;
        end
      end
    end else begin
      if(when_Axi4LiteCrossbar_l285_2) begin
        s0_axi_wready = m1_axi_wready;
      end
    end
    if(when_Axi4LiteCrossbar_l217_2) begin
      if(when_Axi4LiteCrossbar_l229_2) begin
        if(when_Axi4LiteCrossbar_l233_4) begin
          s0_axi_wready = decErr_io_axi_w_ready;
        end
      end
    end else begin
      if(when_Axi4LiteCrossbar_l285_4) begin
        s0_axi_wready = decErr_io_axi_w_ready;
      end
    end
  end

  always @(*) begin
    s0_axi_bvalid = 1'b0;
    if(!when_Axi4LiteCrossbar_l217) begin
      if(when_Axi4LiteCrossbar_l285) begin
        s0_axi_bvalid = m0_axi_bvalid;
      end
    end
    if(!when_Axi4LiteCrossbar_l217_1) begin
      if(when_Axi4LiteCrossbar_l285_2) begin
        s0_axi_bvalid = m1_axi_bvalid;
      end
    end
    if(!when_Axi4LiteCrossbar_l217_2) begin
      if(when_Axi4LiteCrossbar_l285_4) begin
        s0_axi_bvalid = decErr_io_axi_b_valid;
      end
    end
  end

  always @(*) begin
    s0_axi_bresp = _zz_io_masters_0_b_payload_resp[1 : 0];
    if(!when_Axi4LiteCrossbar_l217) begin
      if(when_Axi4LiteCrossbar_l285) begin
        s0_axi_bresp = m0_axi_bresp;
      end
    end
    if(!when_Axi4LiteCrossbar_l217_1) begin
      if(when_Axi4LiteCrossbar_l285_2) begin
        s0_axi_bresp = m1_axi_bresp;
      end
    end
    if(!when_Axi4LiteCrossbar_l217_2) begin
      if(when_Axi4LiteCrossbar_l285_4) begin
        s0_axi_bresp = decErr_io_axi_b_payload_resp;
      end
    end
  end

  always @(*) begin
    s0_axi_arready = 1'b0;
    if(when_Axi4LiteCrossbar_l306) begin
      if(when_Axi4LiteCrossbar_l317) begin
        if(when_Axi4LiteCrossbar_l320) begin
          s0_axi_arready = m0_axi_arready;
        end
      end
    end
    if(when_Axi4LiteCrossbar_l306_1) begin
      if(when_Axi4LiteCrossbar_l317_1) begin
        if(when_Axi4LiteCrossbar_l320_2) begin
          s0_axi_arready = m1_axi_arready;
        end
      end
    end
    if(when_Axi4LiteCrossbar_l306_2) begin
      if(when_Axi4LiteCrossbar_l317_2) begin
        if(when_Axi4LiteCrossbar_l320_4) begin
          s0_axi_arready = decErr_io_axi_ar_ready;
        end
      end
    end
  end

  always @(*) begin
    s0_axi_rvalid = 1'b0;
    if(!when_Axi4LiteCrossbar_l306) begin
      if(when_Axi4LiteCrossbar_l363) begin
        s0_axi_rvalid = m0_axi_rvalid;
      end
    end
    if(!when_Axi4LiteCrossbar_l306_1) begin
      if(when_Axi4LiteCrossbar_l363_2) begin
        s0_axi_rvalid = m1_axi_rvalid;
      end
    end
    if(!when_Axi4LiteCrossbar_l306_2) begin
      if(when_Axi4LiteCrossbar_l363_4) begin
        s0_axi_rvalid = decErr_io_axi_r_valid;
      end
    end
  end

  assign _zz_io_masters_0_r_payload_data = 34'h0;
  always @(*) begin
    s0_axi_rdata = _zz_io_masters_0_r_payload_data[31 : 0];
    if(!when_Axi4LiteCrossbar_l306) begin
      if(when_Axi4LiteCrossbar_l363) begin
        s0_axi_rdata = m0_axi_rdata;
      end
    end
    if(!when_Axi4LiteCrossbar_l306_1) begin
      if(when_Axi4LiteCrossbar_l363_2) begin
        s0_axi_rdata = m1_axi_rdata;
      end
    end
    if(!when_Axi4LiteCrossbar_l306_2) begin
      if(when_Axi4LiteCrossbar_l363_4) begin
        s0_axi_rdata = decErr_io_axi_r_payload_data;
      end
    end
  end

  always @(*) begin
    s0_axi_rresp = _zz_io_masters_0_r_payload_data[33 : 32];
    if(!when_Axi4LiteCrossbar_l306) begin
      if(when_Axi4LiteCrossbar_l363) begin
        s0_axi_rresp = m0_axi_rresp;
      end
    end
    if(!when_Axi4LiteCrossbar_l306_1) begin
      if(when_Axi4LiteCrossbar_l363_2) begin
        s0_axi_rresp = m1_axi_rresp;
      end
    end
    if(!when_Axi4LiteCrossbar_l306_2) begin
      if(when_Axi4LiteCrossbar_l363_4) begin
        s0_axi_rresp = decErr_io_axi_r_payload_resp;
      end
    end
  end

  always @(*) begin
    s1_axi_awready = 1'b0;
    if(when_Axi4LiteCrossbar_l217) begin
      if(when_Axi4LiteCrossbar_l229) begin
        if(when_Axi4LiteCrossbar_l233_1) begin
          s1_axi_awready = m0_axi_awready;
        end
      end
    end
    if(when_Axi4LiteCrossbar_l217_1) begin
      if(when_Axi4LiteCrossbar_l229_1) begin
        if(when_Axi4LiteCrossbar_l233_3) begin
          s1_axi_awready = m1_axi_awready;
        end
      end
    end
    if(when_Axi4LiteCrossbar_l217_2) begin
      if(when_Axi4LiteCrossbar_l229_2) begin
        if(when_Axi4LiteCrossbar_l233_5) begin
          s1_axi_awready = decErr_io_axi_aw_ready;
        end
      end
    end
  end

  always @(*) begin
    s1_axi_wready = 1'b0;
    if(when_Axi4LiteCrossbar_l217) begin
      if(when_Axi4LiteCrossbar_l229) begin
        if(when_Axi4LiteCrossbar_l233_1) begin
          s1_axi_wready = m0_axi_wready;
        end
      end
    end else begin
      if(when_Axi4LiteCrossbar_l285_1) begin
        s1_axi_wready = m0_axi_wready;
      end
    end
    if(when_Axi4LiteCrossbar_l217_1) begin
      if(when_Axi4LiteCrossbar_l229_1) begin
        if(when_Axi4LiteCrossbar_l233_3) begin
          s1_axi_wready = m1_axi_wready;
        end
      end
    end else begin
      if(when_Axi4LiteCrossbar_l285_3) begin
        s1_axi_wready = m1_axi_wready;
      end
    end
    if(when_Axi4LiteCrossbar_l217_2) begin
      if(when_Axi4LiteCrossbar_l229_2) begin
        if(when_Axi4LiteCrossbar_l233_5) begin
          s1_axi_wready = decErr_io_axi_w_ready;
        end
      end
    end else begin
      if(when_Axi4LiteCrossbar_l285_5) begin
        s1_axi_wready = decErr_io_axi_w_ready;
      end
    end
  end

  always @(*) begin
    s1_axi_bvalid = 1'b0;
    if(!when_Axi4LiteCrossbar_l217) begin
      if(when_Axi4LiteCrossbar_l285_1) begin
        s1_axi_bvalid = m0_axi_bvalid;
      end
    end
    if(!when_Axi4LiteCrossbar_l217_1) begin
      if(when_Axi4LiteCrossbar_l285_3) begin
        s1_axi_bvalid = m1_axi_bvalid;
      end
    end
    if(!when_Axi4LiteCrossbar_l217_2) begin
      if(when_Axi4LiteCrossbar_l285_5) begin
        s1_axi_bvalid = decErr_io_axi_b_valid;
      end
    end
  end

  always @(*) begin
    s1_axi_bresp = _zz_io_masters_1_b_payload_resp[1 : 0];
    if(!when_Axi4LiteCrossbar_l217) begin
      if(when_Axi4LiteCrossbar_l285_1) begin
        s1_axi_bresp = m0_axi_bresp;
      end
    end
    if(!when_Axi4LiteCrossbar_l217_1) begin
      if(when_Axi4LiteCrossbar_l285_3) begin
        s1_axi_bresp = m1_axi_bresp;
      end
    end
    if(!when_Axi4LiteCrossbar_l217_2) begin
      if(when_Axi4LiteCrossbar_l285_5) begin
        s1_axi_bresp = decErr_io_axi_b_payload_resp;
      end
    end
  end

  always @(*) begin
    s1_axi_arready = 1'b0;
    if(when_Axi4LiteCrossbar_l306) begin
      if(when_Axi4LiteCrossbar_l317) begin
        if(when_Axi4LiteCrossbar_l320_1) begin
          s1_axi_arready = m0_axi_arready;
        end
      end
    end
    if(when_Axi4LiteCrossbar_l306_1) begin
      if(when_Axi4LiteCrossbar_l317_1) begin
        if(when_Axi4LiteCrossbar_l320_3) begin
          s1_axi_arready = m1_axi_arready;
        end
      end
    end
    if(when_Axi4LiteCrossbar_l306_2) begin
      if(when_Axi4LiteCrossbar_l317_2) begin
        if(when_Axi4LiteCrossbar_l320_5) begin
          s1_axi_arready = decErr_io_axi_ar_ready;
        end
      end
    end
  end

  always @(*) begin
    s1_axi_rvalid = 1'b0;
    if(!when_Axi4LiteCrossbar_l306) begin
      if(when_Axi4LiteCrossbar_l363_1) begin
        s1_axi_rvalid = m0_axi_rvalid;
      end
    end
    if(!when_Axi4LiteCrossbar_l306_1) begin
      if(when_Axi4LiteCrossbar_l363_3) begin
        s1_axi_rvalid = m1_axi_rvalid;
      end
    end
    if(!when_Axi4LiteCrossbar_l306_2) begin
      if(when_Axi4LiteCrossbar_l363_5) begin
        s1_axi_rvalid = decErr_io_axi_r_valid;
      end
    end
  end

  assign _zz_io_masters_1_r_payload_data = 34'h0;
  always @(*) begin
    s1_axi_rdata = _zz_io_masters_1_r_payload_data[31 : 0];
    if(!when_Axi4LiteCrossbar_l306) begin
      if(when_Axi4LiteCrossbar_l363_1) begin
        s1_axi_rdata = m0_axi_rdata;
      end
    end
    if(!when_Axi4LiteCrossbar_l306_1) begin
      if(when_Axi4LiteCrossbar_l363_3) begin
        s1_axi_rdata = m1_axi_rdata;
      end
    end
    if(!when_Axi4LiteCrossbar_l306_2) begin
      if(when_Axi4LiteCrossbar_l363_5) begin
        s1_axi_rdata = decErr_io_axi_r_payload_data;
      end
    end
  end

  always @(*) begin
    s1_axi_rresp = _zz_io_masters_1_r_payload_data[33 : 32];
    if(!when_Axi4LiteCrossbar_l306) begin
      if(when_Axi4LiteCrossbar_l363_1) begin
        s1_axi_rresp = m0_axi_rresp;
      end
    end
    if(!when_Axi4LiteCrossbar_l306_1) begin
      if(when_Axi4LiteCrossbar_l363_3) begin
        s1_axi_rresp = m1_axi_rresp;
      end
    end
    if(!when_Axi4LiteCrossbar_l306_2) begin
      if(when_Axi4LiteCrossbar_l363_5) begin
        s1_axi_rresp = decErr_io_axi_r_payload_resp;
      end
    end
  end

  always @(*) begin
    m0_axi_awvalid = 1'b0;
    if(when_Axi4LiteCrossbar_l217) begin
      if(when_Axi4LiteCrossbar_l229) begin
        m0_axi_awvalid = 1'b1;
      end
    end
  end

  assign _zz_io_slaves_0_aw_payload_addr = 35'h0;
  always @(*) begin
    m0_axi_awaddr = _zz_io_slaves_0_aw_payload_addr[31 : 0];
    if(when_Axi4LiteCrossbar_l217) begin
      if(when_Axi4LiteCrossbar_l229) begin
        if(when_Axi4LiteCrossbar_l233) begin
          m0_axi_awaddr = s0_axi_awaddr;
        end
        if(when_Axi4LiteCrossbar_l233_1) begin
          m0_axi_awaddr = s1_axi_awaddr;
        end
      end
    end
  end

  always @(*) begin
    m0_axi_awprot = _zz_io_slaves_0_aw_payload_addr[34 : 32];
    if(when_Axi4LiteCrossbar_l217) begin
      if(when_Axi4LiteCrossbar_l229) begin
        if(when_Axi4LiteCrossbar_l233) begin
          m0_axi_awprot = s0_axi_awprot;
        end
        if(when_Axi4LiteCrossbar_l233_1) begin
          m0_axi_awprot = s1_axi_awprot;
        end
      end
    end
  end

  always @(*) begin
    m0_axi_wvalid = 1'b0;
    if(when_Axi4LiteCrossbar_l217) begin
      if(when_Axi4LiteCrossbar_l229) begin
        if(when_Axi4LiteCrossbar_l233) begin
          m0_axi_wvalid = s0_axi_wvalid;
        end
        if(when_Axi4LiteCrossbar_l233_1) begin
          m0_axi_wvalid = s1_axi_wvalid;
        end
      end
    end else begin
      if(when_Axi4LiteCrossbar_l285) begin
        m0_axi_wvalid = s0_axi_wvalid;
      end
      if(when_Axi4LiteCrossbar_l285_1) begin
        m0_axi_wvalid = s1_axi_wvalid;
      end
    end
  end

  assign _zz_io_slaves_0_w_payload_data = 36'h0;
  always @(*) begin
    m0_axi_wdata = _zz_io_slaves_0_w_payload_data[31 : 0];
    if(when_Axi4LiteCrossbar_l217) begin
      if(when_Axi4LiteCrossbar_l229) begin
        if(when_Axi4LiteCrossbar_l233) begin
          m0_axi_wdata = s0_axi_wdata;
        end
        if(when_Axi4LiteCrossbar_l233_1) begin
          m0_axi_wdata = s1_axi_wdata;
        end
      end
    end else begin
      if(when_Axi4LiteCrossbar_l285) begin
        m0_axi_wdata = s0_axi_wdata;
      end
      if(when_Axi4LiteCrossbar_l285_1) begin
        m0_axi_wdata = s1_axi_wdata;
      end
    end
  end

  always @(*) begin
    m0_axi_wstrb = _zz_io_slaves_0_w_payload_data[35 : 32];
    if(when_Axi4LiteCrossbar_l217) begin
      if(when_Axi4LiteCrossbar_l229) begin
        if(when_Axi4LiteCrossbar_l233) begin
          m0_axi_wstrb = s0_axi_wstrb;
        end
        if(when_Axi4LiteCrossbar_l233_1) begin
          m0_axi_wstrb = s1_axi_wstrb;
        end
      end
    end else begin
      if(when_Axi4LiteCrossbar_l285) begin
        m0_axi_wstrb = s0_axi_wstrb;
      end
      if(when_Axi4LiteCrossbar_l285_1) begin
        m0_axi_wstrb = s1_axi_wstrb;
      end
    end
  end

  always @(*) begin
    m0_axi_bready = 1'b0;
    if(!when_Axi4LiteCrossbar_l217) begin
      if(when_Axi4LiteCrossbar_l285) begin
        m0_axi_bready = s0_axi_bready;
      end
      if(when_Axi4LiteCrossbar_l285_1) begin
        m0_axi_bready = s1_axi_bready;
      end
    end
  end

  always @(*) begin
    m0_axi_arvalid = 1'b0;
    if(when_Axi4LiteCrossbar_l306) begin
      if(when_Axi4LiteCrossbar_l317) begin
        m0_axi_arvalid = 1'b1;
      end
    end
  end

  assign _zz_io_slaves_0_ar_payload_addr = 35'h0;
  always @(*) begin
    m0_axi_araddr = _zz_io_slaves_0_ar_payload_addr[31 : 0];
    if(when_Axi4LiteCrossbar_l306) begin
      if(when_Axi4LiteCrossbar_l317) begin
        if(when_Axi4LiteCrossbar_l320) begin
          m0_axi_araddr = s0_axi_araddr;
        end
        if(when_Axi4LiteCrossbar_l320_1) begin
          m0_axi_araddr = s1_axi_araddr;
        end
      end
    end
  end

  always @(*) begin
    m0_axi_arprot = _zz_io_slaves_0_ar_payload_addr[34 : 32];
    if(when_Axi4LiteCrossbar_l306) begin
      if(when_Axi4LiteCrossbar_l317) begin
        if(when_Axi4LiteCrossbar_l320) begin
          m0_axi_arprot = s0_axi_arprot;
        end
        if(when_Axi4LiteCrossbar_l320_1) begin
          m0_axi_arprot = s1_axi_arprot;
        end
      end
    end
  end

  always @(*) begin
    m0_axi_rready = 1'b0;
    if(!when_Axi4LiteCrossbar_l306) begin
      if(when_Axi4LiteCrossbar_l363) begin
        m0_axi_rready = s0_axi_rready;
      end
      if(when_Axi4LiteCrossbar_l363_1) begin
        m0_axi_rready = s1_axi_rready;
      end
    end
  end

  always @(*) begin
    m1_axi_awvalid = 1'b0;
    if(when_Axi4LiteCrossbar_l217_1) begin
      if(when_Axi4LiteCrossbar_l229_1) begin
        m1_axi_awvalid = 1'b1;
      end
    end
  end

  assign _zz_io_slaves_1_aw_payload_addr = 35'h0;
  always @(*) begin
    m1_axi_awaddr = _zz_io_slaves_1_aw_payload_addr[31 : 0];
    if(when_Axi4LiteCrossbar_l217_1) begin
      if(when_Axi4LiteCrossbar_l229_1) begin
        if(when_Axi4LiteCrossbar_l233_2) begin
          m1_axi_awaddr = s0_axi_awaddr;
        end
        if(when_Axi4LiteCrossbar_l233_3) begin
          m1_axi_awaddr = s1_axi_awaddr;
        end
      end
    end
  end

  always @(*) begin
    m1_axi_awprot = _zz_io_slaves_1_aw_payload_addr[34 : 32];
    if(when_Axi4LiteCrossbar_l217_1) begin
      if(when_Axi4LiteCrossbar_l229_1) begin
        if(when_Axi4LiteCrossbar_l233_2) begin
          m1_axi_awprot = s0_axi_awprot;
        end
        if(when_Axi4LiteCrossbar_l233_3) begin
          m1_axi_awprot = s1_axi_awprot;
        end
      end
    end
  end

  always @(*) begin
    m1_axi_wvalid = 1'b0;
    if(when_Axi4LiteCrossbar_l217_1) begin
      if(when_Axi4LiteCrossbar_l229_1) begin
        if(when_Axi4LiteCrossbar_l233_2) begin
          m1_axi_wvalid = s0_axi_wvalid;
        end
        if(when_Axi4LiteCrossbar_l233_3) begin
          m1_axi_wvalid = s1_axi_wvalid;
        end
      end
    end else begin
      if(when_Axi4LiteCrossbar_l285_2) begin
        m1_axi_wvalid = s0_axi_wvalid;
      end
      if(when_Axi4LiteCrossbar_l285_3) begin
        m1_axi_wvalid = s1_axi_wvalid;
      end
    end
  end

  assign _zz_io_slaves_1_w_payload_data = 36'h0;
  always @(*) begin
    m1_axi_wdata = _zz_io_slaves_1_w_payload_data[31 : 0];
    if(when_Axi4LiteCrossbar_l217_1) begin
      if(when_Axi4LiteCrossbar_l229_1) begin
        if(when_Axi4LiteCrossbar_l233_2) begin
          m1_axi_wdata = s0_axi_wdata;
        end
        if(when_Axi4LiteCrossbar_l233_3) begin
          m1_axi_wdata = s1_axi_wdata;
        end
      end
    end else begin
      if(when_Axi4LiteCrossbar_l285_2) begin
        m1_axi_wdata = s0_axi_wdata;
      end
      if(when_Axi4LiteCrossbar_l285_3) begin
        m1_axi_wdata = s1_axi_wdata;
      end
    end
  end

  always @(*) begin
    m1_axi_wstrb = _zz_io_slaves_1_w_payload_data[35 : 32];
    if(when_Axi4LiteCrossbar_l217_1) begin
      if(when_Axi4LiteCrossbar_l229_1) begin
        if(when_Axi4LiteCrossbar_l233_2) begin
          m1_axi_wstrb = s0_axi_wstrb;
        end
        if(when_Axi4LiteCrossbar_l233_3) begin
          m1_axi_wstrb = s1_axi_wstrb;
        end
      end
    end else begin
      if(when_Axi4LiteCrossbar_l285_2) begin
        m1_axi_wstrb = s0_axi_wstrb;
      end
      if(when_Axi4LiteCrossbar_l285_3) begin
        m1_axi_wstrb = s1_axi_wstrb;
      end
    end
  end

  always @(*) begin
    m1_axi_bready = 1'b0;
    if(!when_Axi4LiteCrossbar_l217_1) begin
      if(when_Axi4LiteCrossbar_l285_2) begin
        m1_axi_bready = s0_axi_bready;
      end
      if(when_Axi4LiteCrossbar_l285_3) begin
        m1_axi_bready = s1_axi_bready;
      end
    end
  end

  always @(*) begin
    m1_axi_arvalid = 1'b0;
    if(when_Axi4LiteCrossbar_l306_1) begin
      if(when_Axi4LiteCrossbar_l317_1) begin
        m1_axi_arvalid = 1'b1;
      end
    end
  end

  assign _zz_io_slaves_1_ar_payload_addr = 35'h0;
  always @(*) begin
    m1_axi_araddr = _zz_io_slaves_1_ar_payload_addr[31 : 0];
    if(when_Axi4LiteCrossbar_l306_1) begin
      if(when_Axi4LiteCrossbar_l317_1) begin
        if(when_Axi4LiteCrossbar_l320_2) begin
          m1_axi_araddr = s0_axi_araddr;
        end
        if(when_Axi4LiteCrossbar_l320_3) begin
          m1_axi_araddr = s1_axi_araddr;
        end
      end
    end
  end

  always @(*) begin
    m1_axi_arprot = _zz_io_slaves_1_ar_payload_addr[34 : 32];
    if(when_Axi4LiteCrossbar_l306_1) begin
      if(when_Axi4LiteCrossbar_l317_1) begin
        if(when_Axi4LiteCrossbar_l320_2) begin
          m1_axi_arprot = s0_axi_arprot;
        end
        if(when_Axi4LiteCrossbar_l320_3) begin
          m1_axi_arprot = s1_axi_arprot;
        end
      end
    end
  end

  always @(*) begin
    m1_axi_rready = 1'b0;
    if(!when_Axi4LiteCrossbar_l306_1) begin
      if(when_Axi4LiteCrossbar_l363_2) begin
        m1_axi_rready = s0_axi_rready;
      end
      if(when_Axi4LiteCrossbar_l363_3) begin
        m1_axi_rready = s1_axi_rready;
      end
    end
  end

  always @(*) begin
    decErr_io_axi_aw_valid = 1'b0;
    if(when_Axi4LiteCrossbar_l217_2) begin
      if(when_Axi4LiteCrossbar_l229_2) begin
        decErr_io_axi_aw_valid = 1'b1;
      end
    end
  end

  assign _zz_io_axi_aw_payload_addr = 35'h0;
  always @(*) begin
    decErr_io_axi_aw_payload_addr = _zz_io_axi_aw_payload_addr[31 : 0];
    if(when_Axi4LiteCrossbar_l217_2) begin
      if(when_Axi4LiteCrossbar_l229_2) begin
        if(when_Axi4LiteCrossbar_l233_4) begin
          decErr_io_axi_aw_payload_addr = s0_axi_awaddr;
        end
        if(when_Axi4LiteCrossbar_l233_5) begin
          decErr_io_axi_aw_payload_addr = s1_axi_awaddr;
        end
      end
    end
  end

  always @(*) begin
    decErr_io_axi_aw_payload_prot = _zz_io_axi_aw_payload_addr[34 : 32];
    if(when_Axi4LiteCrossbar_l217_2) begin
      if(when_Axi4LiteCrossbar_l229_2) begin
        if(when_Axi4LiteCrossbar_l233_4) begin
          decErr_io_axi_aw_payload_prot = s0_axi_awprot;
        end
        if(when_Axi4LiteCrossbar_l233_5) begin
          decErr_io_axi_aw_payload_prot = s1_axi_awprot;
        end
      end
    end
  end

  always @(*) begin
    decErr_io_axi_w_valid = 1'b0;
    if(when_Axi4LiteCrossbar_l217_2) begin
      if(when_Axi4LiteCrossbar_l229_2) begin
        if(when_Axi4LiteCrossbar_l233_4) begin
          decErr_io_axi_w_valid = s0_axi_wvalid;
        end
        if(when_Axi4LiteCrossbar_l233_5) begin
          decErr_io_axi_w_valid = s1_axi_wvalid;
        end
      end
    end else begin
      if(when_Axi4LiteCrossbar_l285_4) begin
        decErr_io_axi_w_valid = s0_axi_wvalid;
      end
      if(when_Axi4LiteCrossbar_l285_5) begin
        decErr_io_axi_w_valid = s1_axi_wvalid;
      end
    end
  end

  assign _zz_io_axi_w_payload_data = 36'h0;
  always @(*) begin
    decErr_io_axi_w_payload_data = _zz_io_axi_w_payload_data[31 : 0];
    if(when_Axi4LiteCrossbar_l217_2) begin
      if(when_Axi4LiteCrossbar_l229_2) begin
        if(when_Axi4LiteCrossbar_l233_4) begin
          decErr_io_axi_w_payload_data = s0_axi_wdata;
        end
        if(when_Axi4LiteCrossbar_l233_5) begin
          decErr_io_axi_w_payload_data = s1_axi_wdata;
        end
      end
    end else begin
      if(when_Axi4LiteCrossbar_l285_4) begin
        decErr_io_axi_w_payload_data = s0_axi_wdata;
      end
      if(when_Axi4LiteCrossbar_l285_5) begin
        decErr_io_axi_w_payload_data = s1_axi_wdata;
      end
    end
  end

  always @(*) begin
    decErr_io_axi_w_payload_strb = _zz_io_axi_w_payload_data[35 : 32];
    if(when_Axi4LiteCrossbar_l217_2) begin
      if(when_Axi4LiteCrossbar_l229_2) begin
        if(when_Axi4LiteCrossbar_l233_4) begin
          decErr_io_axi_w_payload_strb = s0_axi_wstrb;
        end
        if(when_Axi4LiteCrossbar_l233_5) begin
          decErr_io_axi_w_payload_strb = s1_axi_wstrb;
        end
      end
    end else begin
      if(when_Axi4LiteCrossbar_l285_4) begin
        decErr_io_axi_w_payload_strb = s0_axi_wstrb;
      end
      if(when_Axi4LiteCrossbar_l285_5) begin
        decErr_io_axi_w_payload_strb = s1_axi_wstrb;
      end
    end
  end

  always @(*) begin
    decErr_io_axi_b_ready = 1'b0;
    if(!when_Axi4LiteCrossbar_l217_2) begin
      if(when_Axi4LiteCrossbar_l285_4) begin
        decErr_io_axi_b_ready = s0_axi_bready;
      end
      if(when_Axi4LiteCrossbar_l285_5) begin
        decErr_io_axi_b_ready = s1_axi_bready;
      end
    end
  end

  always @(*) begin
    decErr_io_axi_ar_valid = 1'b0;
    if(when_Axi4LiteCrossbar_l306_2) begin
      if(when_Axi4LiteCrossbar_l317_2) begin
        decErr_io_axi_ar_valid = 1'b1;
      end
    end
  end

  assign _zz_io_axi_ar_payload_addr = 35'h0;
  always @(*) begin
    decErr_io_axi_ar_payload_addr = _zz_io_axi_ar_payload_addr[31 : 0];
    if(when_Axi4LiteCrossbar_l306_2) begin
      if(when_Axi4LiteCrossbar_l317_2) begin
        if(when_Axi4LiteCrossbar_l320_4) begin
          decErr_io_axi_ar_payload_addr = s0_axi_araddr;
        end
        if(when_Axi4LiteCrossbar_l320_5) begin
          decErr_io_axi_ar_payload_addr = s1_axi_araddr;
        end
      end
    end
  end

  always @(*) begin
    decErr_io_axi_ar_payload_prot = _zz_io_axi_ar_payload_addr[34 : 32];
    if(when_Axi4LiteCrossbar_l306_2) begin
      if(when_Axi4LiteCrossbar_l317_2) begin
        if(when_Axi4LiteCrossbar_l320_4) begin
          decErr_io_axi_ar_payload_prot = s0_axi_arprot;
        end
        if(when_Axi4LiteCrossbar_l320_5) begin
          decErr_io_axi_ar_payload_prot = s1_axi_arprot;
        end
      end
    end
  end

  always @(*) begin
    decErr_io_axi_r_ready = 1'b0;
    if(!when_Axi4LiteCrossbar_l306_2) begin
      if(when_Axi4LiteCrossbar_l363_4) begin
        decErr_io_axi_r_ready = s0_axi_rready;
      end
      if(when_Axi4LiteCrossbar_l363_5) begin
        decErr_io_axi_r_ready = s1_axi_rready;
      end
    end
  end

  assign when_Axi4LiteCrossbar_l217 = (! wrActive_0);
  always @(*) begin
    _zz_when_Axi4LiteCrossbar_l229_1[0] = ((32'h0 <= s0_axi_awaddr) && (s0_axi_awaddr < 32'h00010000));
    _zz_when_Axi4LiteCrossbar_l229_1[1] = ((32'h00010000 <= s0_axi_awaddr) && (s0_axi_awaddr < 32'h00020000));
  end

  always @(*) begin
    _zz_when_Axi4LiteCrossbar_l229[0] = (s0_axi_awvalid && _zz__zz_when_Axi4LiteCrossbar_l229[0]);
    _zz_when_Axi4LiteCrossbar_l229[1] = (s1_axi_awvalid && _zz__zz_when_Axi4LiteCrossbar_l229_1[0]);
  end

  always @(*) begin
    _zz_when_Axi4LiteCrossbar_l229_2[0] = ((32'h0 <= s1_axi_awaddr) && (s1_axi_awaddr < 32'h00010000));
    _zz_when_Axi4LiteCrossbar_l229_2[1] = ((32'h00010000 <= s1_axi_awaddr) && (s1_axi_awaddr < 32'h00020000));
  end

  always @(*) begin
    _zz_when_Axi4LiteCrossbar_l152[0] = (_zz_when_Axi4LiteCrossbar_l229[0] && (wrCredits_0_0 != 2'b00));
    _zz_when_Axi4LiteCrossbar_l152[1] = (_zz_when_Axi4LiteCrossbar_l229[1] && (wrCredits_0_1 != 2'b00));
  end

  always @(*) begin
    _zz_when_Axi4LiteCrossbar_l152_1 = 2'b00;
    if(when_Axi4LiteCrossbar_l109) begin
      _zz_when_Axi4LiteCrossbar_l152_1 = 2'b01;
    end
  end

  assign when_Axi4LiteCrossbar_l109 = (1'b1 <= wrRrPtr_0);
  assign _zz_when_Axi4LiteCrossbar_l152_2 = (_zz_when_Axi4LiteCrossbar_l152 & (~ _zz_when_Axi4LiteCrossbar_l152_1));
  assign _zz_when_Axi4LiteCrossbar_l152_3 = _zz_when_Axi4LiteCrossbar_l152_2;
  assign _zz_when_Axi4LiteCrossbar_l152_4 = _zz_when_Axi4LiteCrossbar_l152;
  always @(*) begin
    _zz_when_Axi4LiteCrossbar_l152_5 = 2'b00;
    if(when_Axi4LiteCrossbar_l109_1) begin
      _zz_when_Axi4LiteCrossbar_l152_5 = 2'b01;
    end
  end

  assign when_Axi4LiteCrossbar_l109_1 = (1'b1 <= wrRrPtr_0);
  assign _zz_when_Axi4LiteCrossbar_l152_6 = (_zz_when_Axi4LiteCrossbar_l229 & (~ _zz_when_Axi4LiteCrossbar_l152_5));
  assign _zz_when_Axi4LiteCrossbar_l152_7 = _zz_when_Axi4LiteCrossbar_l152_6;
  assign _zz_when_Axi4LiteCrossbar_l152_8 = _zz_when_Axi4LiteCrossbar_l229;
  assign _zz_when_Axi4LiteCrossbar_l152_9 = ((|_zz_when_Axi4LiteCrossbar_l152) ? ((|_zz_when_Axi4LiteCrossbar_l152_2) ? (_zz_when_Axi4LiteCrossbar_l152_3 & (~ _zz__zz_when_Axi4LiteCrossbar_l152_9)) : (_zz_when_Axi4LiteCrossbar_l152_4 & (~ _zz__zz_when_Axi4LiteCrossbar_l152_9_1))) : ((|_zz_when_Axi4LiteCrossbar_l152_6) ? (_zz_when_Axi4LiteCrossbar_l152_7 & (~ _zz__zz_when_Axi4LiteCrossbar_l152_9_2)) : (_zz_when_Axi4LiteCrossbar_l152_8 & (~ _zz__zz_when_Axi4LiteCrossbar_l152_9_3))));
  always @(*) begin
    _zz_wrGranted_0 = 1'b0;
    if(when_Axi4LiteCrossbar_l152) begin
      _zz_wrGranted_0 = 1'b0;
    end
    if(when_Axi4LiteCrossbar_l152_1) begin
      _zz_wrGranted_0 = 1'b1;
    end
  end

  assign when_Axi4LiteCrossbar_l152 = _zz_when_Axi4LiteCrossbar_l152_9[0];
  assign when_Axi4LiteCrossbar_l152_1 = _zz_when_Axi4LiteCrossbar_l152_9[1];
  assign when_Axi4LiteCrossbar_l229 = (|_zz_when_Axi4LiteCrossbar_l229);
  assign when_Axi4LiteCrossbar_l233 = (_zz_wrGranted_0 == 1'b0);
  assign when_Axi4LiteCrossbar_l233_1 = (_zz_wrGranted_0 == 1'b1);
  assign io_slaves_0_aw_fire = (m0_axi_awvalid && m0_axi_awready);
  assign when_Axi4LiteCrossbar_l253 = ((_zz_wrGranted_0 == 1'b0) && (wrCredits_0_0 != 2'b00));
  assign when_Axi4LiteCrossbar_l253_1 = ((_zz_wrGranted_0 == 1'b1) && (wrCredits_0_1 != 2'b00));
  always @(*) begin
    when_Axi4LiteCrossbar_l271 = 1'b1;
    if(when_Axi4LiteCrossbar_l261) begin
      if(when_Axi4LiteCrossbar_l268) begin
        when_Axi4LiteCrossbar_l271 = 1'b0;
      end
    end
    if(when_Axi4LiteCrossbar_l261_1) begin
      if(when_Axi4LiteCrossbar_l268_1) begin
        when_Axi4LiteCrossbar_l271 = 1'b0;
      end
    end
  end

  assign when_Axi4LiteCrossbar_l261 = _zz_when_Axi4LiteCrossbar_l229[0];
  always @(*) begin
    _zz_when_Axi4LiteCrossbar_l268 = wrCredits_0_0;
    if(when_Axi4LiteCrossbar_l265) begin
      _zz_when_Axi4LiteCrossbar_l268 = (wrCredits_0_0 - 2'b01);
    end
  end

  assign when_Axi4LiteCrossbar_l265 = ((_zz_wrGranted_0 == 1'b0) && (wrCredits_0_0 != 2'b00));
  assign when_Axi4LiteCrossbar_l268 = (_zz_when_Axi4LiteCrossbar_l268 != 2'b00);
  assign when_Axi4LiteCrossbar_l261_1 = _zz_when_Axi4LiteCrossbar_l229[1];
  always @(*) begin
    _zz_when_Axi4LiteCrossbar_l268_1 = wrCredits_0_1;
    if(when_Axi4LiteCrossbar_l265_1) begin
      _zz_when_Axi4LiteCrossbar_l268_1 = (wrCredits_0_1 - 2'b01);
    end
  end

  assign when_Axi4LiteCrossbar_l265_1 = ((_zz_wrGranted_0 == 1'b1) && (wrCredits_0_1 != 2'b00));
  assign when_Axi4LiteCrossbar_l268_1 = (_zz_when_Axi4LiteCrossbar_l268_1 != 2'b00);
  assign when_Axi4LiteCrossbar_l285 = (wrGranted_0 == 1'b0);
  assign when_Axi4LiteCrossbar_l285_1 = (wrGranted_0 == 1'b1);
  assign io_slaves_0_b_fire = (m0_axi_bvalid && m0_axi_bready);
  assign when_Axi4LiteCrossbar_l217_1 = (! wrActive_1);
  always @(*) begin
    _zz_when_Axi4LiteCrossbar_l229_4[0] = ((32'h0 <= s0_axi_awaddr) && (s0_axi_awaddr < 32'h00010000));
    _zz_when_Axi4LiteCrossbar_l229_4[1] = ((32'h00010000 <= s0_axi_awaddr) && (s0_axi_awaddr < 32'h00020000));
  end

  always @(*) begin
    _zz_when_Axi4LiteCrossbar_l229_3[0] = (s0_axi_awvalid && _zz__zz_when_Axi4LiteCrossbar_l229_3[1]);
    _zz_when_Axi4LiteCrossbar_l229_3[1] = (s1_axi_awvalid && _zz__zz_when_Axi4LiteCrossbar_l229_3_1[1]);
  end

  always @(*) begin
    _zz_when_Axi4LiteCrossbar_l229_5[0] = ((32'h0 <= s1_axi_awaddr) && (s1_axi_awaddr < 32'h00010000));
    _zz_when_Axi4LiteCrossbar_l229_5[1] = ((32'h00010000 <= s1_axi_awaddr) && (s1_axi_awaddr < 32'h00020000));
  end

  always @(*) begin
    _zz_when_Axi4LiteCrossbar_l152_10[0] = (_zz_when_Axi4LiteCrossbar_l229_3[0] && (wrCredits_1_0 != 2'b00));
    _zz_when_Axi4LiteCrossbar_l152_10[1] = (_zz_when_Axi4LiteCrossbar_l229_3[1] && (wrCredits_1_1 != 2'b00));
  end

  always @(*) begin
    _zz_when_Axi4LiteCrossbar_l152_11 = 2'b00;
    if(when_Axi4LiteCrossbar_l109_2) begin
      _zz_when_Axi4LiteCrossbar_l152_11 = 2'b01;
    end
  end

  assign when_Axi4LiteCrossbar_l109_2 = (1'b1 <= wrRrPtr_1);
  assign _zz_when_Axi4LiteCrossbar_l152_12 = (_zz_when_Axi4LiteCrossbar_l152_10 & (~ _zz_when_Axi4LiteCrossbar_l152_11));
  assign _zz_when_Axi4LiteCrossbar_l152_13 = _zz_when_Axi4LiteCrossbar_l152_12;
  assign _zz_when_Axi4LiteCrossbar_l152_14 = _zz_when_Axi4LiteCrossbar_l152_10;
  always @(*) begin
    _zz_when_Axi4LiteCrossbar_l152_15 = 2'b00;
    if(when_Axi4LiteCrossbar_l109_3) begin
      _zz_when_Axi4LiteCrossbar_l152_15 = 2'b01;
    end
  end

  assign when_Axi4LiteCrossbar_l109_3 = (1'b1 <= wrRrPtr_1);
  assign _zz_when_Axi4LiteCrossbar_l152_16 = (_zz_when_Axi4LiteCrossbar_l229_3 & (~ _zz_when_Axi4LiteCrossbar_l152_15));
  assign _zz_when_Axi4LiteCrossbar_l152_17 = _zz_when_Axi4LiteCrossbar_l152_16;
  assign _zz_when_Axi4LiteCrossbar_l152_18 = _zz_when_Axi4LiteCrossbar_l229_3;
  assign _zz_when_Axi4LiteCrossbar_l152_19 = ((|_zz_when_Axi4LiteCrossbar_l152_10) ? ((|_zz_when_Axi4LiteCrossbar_l152_12) ? (_zz_when_Axi4LiteCrossbar_l152_13 & (~ _zz__zz_when_Axi4LiteCrossbar_l152_19)) : (_zz_when_Axi4LiteCrossbar_l152_14 & (~ _zz__zz_when_Axi4LiteCrossbar_l152_19_1))) : ((|_zz_when_Axi4LiteCrossbar_l152_16) ? (_zz_when_Axi4LiteCrossbar_l152_17 & (~ _zz__zz_when_Axi4LiteCrossbar_l152_19_2)) : (_zz_when_Axi4LiteCrossbar_l152_18 & (~ _zz__zz_when_Axi4LiteCrossbar_l152_19_3))));
  always @(*) begin
    _zz_wrGranted_1 = 1'b0;
    if(when_Axi4LiteCrossbar_l152_2) begin
      _zz_wrGranted_1 = 1'b0;
    end
    if(when_Axi4LiteCrossbar_l152_3) begin
      _zz_wrGranted_1 = 1'b1;
    end
  end

  assign when_Axi4LiteCrossbar_l152_2 = _zz_when_Axi4LiteCrossbar_l152_19[0];
  assign when_Axi4LiteCrossbar_l152_3 = _zz_when_Axi4LiteCrossbar_l152_19[1];
  assign when_Axi4LiteCrossbar_l229_1 = (|_zz_when_Axi4LiteCrossbar_l229_3);
  assign when_Axi4LiteCrossbar_l233_2 = (_zz_wrGranted_1 == 1'b0);
  assign when_Axi4LiteCrossbar_l233_3 = (_zz_wrGranted_1 == 1'b1);
  assign io_slaves_1_aw_fire = (m1_axi_awvalid && m1_axi_awready);
  assign when_Axi4LiteCrossbar_l253_2 = ((_zz_wrGranted_1 == 1'b0) && (wrCredits_1_0 != 2'b00));
  assign when_Axi4LiteCrossbar_l253_3 = ((_zz_wrGranted_1 == 1'b1) && (wrCredits_1_1 != 2'b00));
  always @(*) begin
    when_Axi4LiteCrossbar_l271_1 = 1'b1;
    if(when_Axi4LiteCrossbar_l261_2) begin
      if(when_Axi4LiteCrossbar_l268_2) begin
        when_Axi4LiteCrossbar_l271_1 = 1'b0;
      end
    end
    if(when_Axi4LiteCrossbar_l261_3) begin
      if(when_Axi4LiteCrossbar_l268_3) begin
        when_Axi4LiteCrossbar_l271_1 = 1'b0;
      end
    end
  end

  assign when_Axi4LiteCrossbar_l261_2 = _zz_when_Axi4LiteCrossbar_l229_3[0];
  always @(*) begin
    _zz_when_Axi4LiteCrossbar_l268_2 = wrCredits_1_0;
    if(when_Axi4LiteCrossbar_l265_2) begin
      _zz_when_Axi4LiteCrossbar_l268_2 = (wrCredits_1_0 - 2'b01);
    end
  end

  assign when_Axi4LiteCrossbar_l265_2 = ((_zz_wrGranted_1 == 1'b0) && (wrCredits_1_0 != 2'b00));
  assign when_Axi4LiteCrossbar_l268_2 = (_zz_when_Axi4LiteCrossbar_l268_2 != 2'b00);
  assign when_Axi4LiteCrossbar_l261_3 = _zz_when_Axi4LiteCrossbar_l229_3[1];
  always @(*) begin
    _zz_when_Axi4LiteCrossbar_l268_3 = wrCredits_1_1;
    if(when_Axi4LiteCrossbar_l265_3) begin
      _zz_when_Axi4LiteCrossbar_l268_3 = (wrCredits_1_1 - 2'b01);
    end
  end

  assign when_Axi4LiteCrossbar_l265_3 = ((_zz_wrGranted_1 == 1'b1) && (wrCredits_1_1 != 2'b00));
  assign when_Axi4LiteCrossbar_l268_3 = (_zz_when_Axi4LiteCrossbar_l268_3 != 2'b00);
  assign when_Axi4LiteCrossbar_l285_2 = (wrGranted_1 == 1'b0);
  assign when_Axi4LiteCrossbar_l285_3 = (wrGranted_1 == 1'b1);
  assign io_slaves_1_b_fire = (m1_axi_bvalid && m1_axi_bready);
  assign when_Axi4LiteCrossbar_l217_2 = (! wrActive_2);
  always @(*) begin
    _zz_when_Axi4LiteCrossbar_l229_7[0] = ((32'h0 <= s0_axi_awaddr) && (s0_axi_awaddr < 32'h00010000));
    _zz_when_Axi4LiteCrossbar_l229_7[1] = ((32'h00010000 <= s0_axi_awaddr) && (s0_axi_awaddr < 32'h00020000));
  end

  always @(*) begin
    _zz_when_Axi4LiteCrossbar_l229_6[0] = (s0_axi_awvalid && _zz__zz_when_Axi4LiteCrossbar_l229_6[2]);
    _zz_when_Axi4LiteCrossbar_l229_6[1] = (s1_axi_awvalid && _zz__zz_when_Axi4LiteCrossbar_l229_6_1[2]);
  end

  always @(*) begin
    _zz_when_Axi4LiteCrossbar_l229_8[0] = ((32'h0 <= s1_axi_awaddr) && (s1_axi_awaddr < 32'h00010000));
    _zz_when_Axi4LiteCrossbar_l229_8[1] = ((32'h00010000 <= s1_axi_awaddr) && (s1_axi_awaddr < 32'h00020000));
  end

  always @(*) begin
    _zz_when_Axi4LiteCrossbar_l152_20[0] = (_zz_when_Axi4LiteCrossbar_l229_6[0] && (wrCredits_2_0 != 2'b00));
    _zz_when_Axi4LiteCrossbar_l152_20[1] = (_zz_when_Axi4LiteCrossbar_l229_6[1] && (wrCredits_2_1 != 2'b00));
  end

  always @(*) begin
    _zz_when_Axi4LiteCrossbar_l152_21 = 2'b00;
    if(when_Axi4LiteCrossbar_l109_4) begin
      _zz_when_Axi4LiteCrossbar_l152_21 = 2'b01;
    end
  end

  assign when_Axi4LiteCrossbar_l109_4 = (1'b1 <= wrRrPtr_2);
  assign _zz_when_Axi4LiteCrossbar_l152_22 = (_zz_when_Axi4LiteCrossbar_l152_20 & (~ _zz_when_Axi4LiteCrossbar_l152_21));
  assign _zz_when_Axi4LiteCrossbar_l152_23 = _zz_when_Axi4LiteCrossbar_l152_22;
  assign _zz_when_Axi4LiteCrossbar_l152_24 = _zz_when_Axi4LiteCrossbar_l152_20;
  always @(*) begin
    _zz_when_Axi4LiteCrossbar_l152_25 = 2'b00;
    if(when_Axi4LiteCrossbar_l109_5) begin
      _zz_when_Axi4LiteCrossbar_l152_25 = 2'b01;
    end
  end

  assign when_Axi4LiteCrossbar_l109_5 = (1'b1 <= wrRrPtr_2);
  assign _zz_when_Axi4LiteCrossbar_l152_26 = (_zz_when_Axi4LiteCrossbar_l229_6 & (~ _zz_when_Axi4LiteCrossbar_l152_25));
  assign _zz_when_Axi4LiteCrossbar_l152_27 = _zz_when_Axi4LiteCrossbar_l152_26;
  assign _zz_when_Axi4LiteCrossbar_l152_28 = _zz_when_Axi4LiteCrossbar_l229_6;
  assign _zz_when_Axi4LiteCrossbar_l152_29 = ((|_zz_when_Axi4LiteCrossbar_l152_20) ? ((|_zz_when_Axi4LiteCrossbar_l152_22) ? (_zz_when_Axi4LiteCrossbar_l152_23 & (~ _zz__zz_when_Axi4LiteCrossbar_l152_29)) : (_zz_when_Axi4LiteCrossbar_l152_24 & (~ _zz__zz_when_Axi4LiteCrossbar_l152_29_1))) : ((|_zz_when_Axi4LiteCrossbar_l152_26) ? (_zz_when_Axi4LiteCrossbar_l152_27 & (~ _zz__zz_when_Axi4LiteCrossbar_l152_29_2)) : (_zz_when_Axi4LiteCrossbar_l152_28 & (~ _zz__zz_when_Axi4LiteCrossbar_l152_29_3))));
  always @(*) begin
    _zz_wrGranted_2 = 1'b0;
    if(when_Axi4LiteCrossbar_l152_4) begin
      _zz_wrGranted_2 = 1'b0;
    end
    if(when_Axi4LiteCrossbar_l152_5) begin
      _zz_wrGranted_2 = 1'b1;
    end
  end

  assign when_Axi4LiteCrossbar_l152_4 = _zz_when_Axi4LiteCrossbar_l152_29[0];
  assign when_Axi4LiteCrossbar_l152_5 = _zz_when_Axi4LiteCrossbar_l152_29[1];
  assign when_Axi4LiteCrossbar_l229_2 = (|_zz_when_Axi4LiteCrossbar_l229_6);
  assign when_Axi4LiteCrossbar_l233_4 = (_zz_wrGranted_2 == 1'b0);
  assign when_Axi4LiteCrossbar_l233_5 = (_zz_wrGranted_2 == 1'b1);
  assign decErr_io_axi_aw_fire = (decErr_io_axi_aw_valid && decErr_io_axi_aw_ready);
  assign when_Axi4LiteCrossbar_l253_4 = ((_zz_wrGranted_2 == 1'b0) && (wrCredits_2_0 != 2'b00));
  assign when_Axi4LiteCrossbar_l253_5 = ((_zz_wrGranted_2 == 1'b1) && (wrCredits_2_1 != 2'b00));
  always @(*) begin
    when_Axi4LiteCrossbar_l271_2 = 1'b1;
    if(when_Axi4LiteCrossbar_l261_4) begin
      if(when_Axi4LiteCrossbar_l268_4) begin
        when_Axi4LiteCrossbar_l271_2 = 1'b0;
      end
    end
    if(when_Axi4LiteCrossbar_l261_5) begin
      if(when_Axi4LiteCrossbar_l268_5) begin
        when_Axi4LiteCrossbar_l271_2 = 1'b0;
      end
    end
  end

  assign when_Axi4LiteCrossbar_l261_4 = _zz_when_Axi4LiteCrossbar_l229_6[0];
  always @(*) begin
    _zz_when_Axi4LiteCrossbar_l268_4 = wrCredits_2_0;
    if(when_Axi4LiteCrossbar_l265_4) begin
      _zz_when_Axi4LiteCrossbar_l268_4 = (wrCredits_2_0 - 2'b01);
    end
  end

  assign when_Axi4LiteCrossbar_l265_4 = ((_zz_wrGranted_2 == 1'b0) && (wrCredits_2_0 != 2'b00));
  assign when_Axi4LiteCrossbar_l268_4 = (_zz_when_Axi4LiteCrossbar_l268_4 != 2'b00);
  assign when_Axi4LiteCrossbar_l261_5 = _zz_when_Axi4LiteCrossbar_l229_6[1];
  always @(*) begin
    _zz_when_Axi4LiteCrossbar_l268_5 = wrCredits_2_1;
    if(when_Axi4LiteCrossbar_l265_5) begin
      _zz_when_Axi4LiteCrossbar_l268_5 = (wrCredits_2_1 - 2'b01);
    end
  end

  assign when_Axi4LiteCrossbar_l265_5 = ((_zz_wrGranted_2 == 1'b1) && (wrCredits_2_1 != 2'b00));
  assign when_Axi4LiteCrossbar_l268_5 = (_zz_when_Axi4LiteCrossbar_l268_5 != 2'b00);
  assign when_Axi4LiteCrossbar_l285_4 = (wrGranted_2 == 1'b0);
  assign when_Axi4LiteCrossbar_l285_5 = (wrGranted_2 == 1'b1);
  assign decErr_io_axi_b_fire = (decErr_io_axi_b_valid && decErr_io_axi_b_ready);
  assign when_Axi4LiteCrossbar_l306 = (! rdActive_0);
  always @(*) begin
    _zz_when_Axi4LiteCrossbar_l317_1[0] = ((32'h0 <= s0_axi_araddr) && (s0_axi_araddr < 32'h00010000));
    _zz_when_Axi4LiteCrossbar_l317_1[1] = ((32'h00010000 <= s0_axi_araddr) && (s0_axi_araddr < 32'h00020000));
  end

  always @(*) begin
    _zz_when_Axi4LiteCrossbar_l317[0] = (s0_axi_arvalid && _zz__zz_when_Axi4LiteCrossbar_l317[0]);
    _zz_when_Axi4LiteCrossbar_l317[1] = (s1_axi_arvalid && _zz__zz_when_Axi4LiteCrossbar_l317_1[0]);
  end

  always @(*) begin
    _zz_when_Axi4LiteCrossbar_l317_2[0] = ((32'h0 <= s1_axi_araddr) && (s1_axi_araddr < 32'h00010000));
    _zz_when_Axi4LiteCrossbar_l317_2[1] = ((32'h00010000 <= s1_axi_araddr) && (s1_axi_araddr < 32'h00020000));
  end

  always @(*) begin
    _zz_when_Axi4LiteCrossbar_l152_30[0] = (_zz_when_Axi4LiteCrossbar_l317[0] && (rdCredits_0_0 != 2'b00));
    _zz_when_Axi4LiteCrossbar_l152_30[1] = (_zz_when_Axi4LiteCrossbar_l317[1] && (rdCredits_0_1 != 2'b00));
  end

  always @(*) begin
    _zz_when_Axi4LiteCrossbar_l152_31 = 2'b00;
    if(when_Axi4LiteCrossbar_l109_6) begin
      _zz_when_Axi4LiteCrossbar_l152_31 = 2'b01;
    end
  end

  assign when_Axi4LiteCrossbar_l109_6 = (1'b1 <= rdRrPtr_0);
  assign _zz_when_Axi4LiteCrossbar_l152_32 = (_zz_when_Axi4LiteCrossbar_l152_30 & (~ _zz_when_Axi4LiteCrossbar_l152_31));
  assign _zz_when_Axi4LiteCrossbar_l152_33 = _zz_when_Axi4LiteCrossbar_l152_32;
  assign _zz_when_Axi4LiteCrossbar_l152_34 = _zz_when_Axi4LiteCrossbar_l152_30;
  always @(*) begin
    _zz_when_Axi4LiteCrossbar_l152_35 = 2'b00;
    if(when_Axi4LiteCrossbar_l109_7) begin
      _zz_when_Axi4LiteCrossbar_l152_35 = 2'b01;
    end
  end

  assign when_Axi4LiteCrossbar_l109_7 = (1'b1 <= rdRrPtr_0);
  assign _zz_when_Axi4LiteCrossbar_l152_36 = (_zz_when_Axi4LiteCrossbar_l317 & (~ _zz_when_Axi4LiteCrossbar_l152_35));
  assign _zz_when_Axi4LiteCrossbar_l152_37 = _zz_when_Axi4LiteCrossbar_l152_36;
  assign _zz_when_Axi4LiteCrossbar_l152_38 = _zz_when_Axi4LiteCrossbar_l317;
  assign _zz_when_Axi4LiteCrossbar_l152_39 = ((|_zz_when_Axi4LiteCrossbar_l152_30) ? ((|_zz_when_Axi4LiteCrossbar_l152_32) ? (_zz_when_Axi4LiteCrossbar_l152_33 & (~ _zz__zz_when_Axi4LiteCrossbar_l152_39)) : (_zz_when_Axi4LiteCrossbar_l152_34 & (~ _zz__zz_when_Axi4LiteCrossbar_l152_39_1))) : ((|_zz_when_Axi4LiteCrossbar_l152_36) ? (_zz_when_Axi4LiteCrossbar_l152_37 & (~ _zz__zz_when_Axi4LiteCrossbar_l152_39_2)) : (_zz_when_Axi4LiteCrossbar_l152_38 & (~ _zz__zz_when_Axi4LiteCrossbar_l152_39_3))));
  always @(*) begin
    _zz_rdGranted_0 = 1'b0;
    if(when_Axi4LiteCrossbar_l152_6) begin
      _zz_rdGranted_0 = 1'b0;
    end
    if(when_Axi4LiteCrossbar_l152_7) begin
      _zz_rdGranted_0 = 1'b1;
    end
  end

  assign when_Axi4LiteCrossbar_l152_6 = _zz_when_Axi4LiteCrossbar_l152_39[0];
  assign when_Axi4LiteCrossbar_l152_7 = _zz_when_Axi4LiteCrossbar_l152_39[1];
  assign when_Axi4LiteCrossbar_l317 = (|_zz_when_Axi4LiteCrossbar_l317);
  assign when_Axi4LiteCrossbar_l320 = (_zz_rdGranted_0 == 1'b0);
  assign when_Axi4LiteCrossbar_l320_1 = (_zz_rdGranted_0 == 1'b1);
  assign io_slaves_0_ar_fire = (m0_axi_arvalid && m0_axi_arready);
  assign when_Axi4LiteCrossbar_l334 = ((_zz_rdGranted_0 == 1'b0) && (rdCredits_0_0 != 2'b00));
  assign when_Axi4LiteCrossbar_l334_1 = ((_zz_rdGranted_0 == 1'b1) && (rdCredits_0_1 != 2'b00));
  always @(*) begin
    when_Axi4LiteCrossbar_l350 = 1'b1;
    if(when_Axi4LiteCrossbar_l341) begin
      if(when_Axi4LiteCrossbar_l347) begin
        when_Axi4LiteCrossbar_l350 = 1'b0;
      end
    end
    if(when_Axi4LiteCrossbar_l341_1) begin
      if(when_Axi4LiteCrossbar_l347_1) begin
        when_Axi4LiteCrossbar_l350 = 1'b0;
      end
    end
  end

  assign when_Axi4LiteCrossbar_l341 = _zz_when_Axi4LiteCrossbar_l317[0];
  always @(*) begin
    _zz_when_Axi4LiteCrossbar_l347 = rdCredits_0_0;
    if(when_Axi4LiteCrossbar_l344) begin
      _zz_when_Axi4LiteCrossbar_l347 = (rdCredits_0_0 - 2'b01);
    end
  end

  assign when_Axi4LiteCrossbar_l344 = ((_zz_rdGranted_0 == 1'b0) && (rdCredits_0_0 != 2'b00));
  assign when_Axi4LiteCrossbar_l347 = (_zz_when_Axi4LiteCrossbar_l347 != 2'b00);
  assign when_Axi4LiteCrossbar_l341_1 = _zz_when_Axi4LiteCrossbar_l317[1];
  always @(*) begin
    _zz_when_Axi4LiteCrossbar_l347_1 = rdCredits_0_1;
    if(when_Axi4LiteCrossbar_l344_1) begin
      _zz_when_Axi4LiteCrossbar_l347_1 = (rdCredits_0_1 - 2'b01);
    end
  end

  assign when_Axi4LiteCrossbar_l344_1 = ((_zz_rdGranted_0 == 1'b1) && (rdCredits_0_1 != 2'b00));
  assign when_Axi4LiteCrossbar_l347_1 = (_zz_when_Axi4LiteCrossbar_l347_1 != 2'b00);
  assign when_Axi4LiteCrossbar_l363 = (rdGranted_0 == 1'b0);
  assign when_Axi4LiteCrossbar_l363_1 = (rdGranted_0 == 1'b1);
  assign io_slaves_0_r_fire = (m0_axi_rvalid && m0_axi_rready);
  assign when_Axi4LiteCrossbar_l306_1 = (! rdActive_1);
  always @(*) begin
    _zz_when_Axi4LiteCrossbar_l317_4[0] = ((32'h0 <= s0_axi_araddr) && (s0_axi_araddr < 32'h00010000));
    _zz_when_Axi4LiteCrossbar_l317_4[1] = ((32'h00010000 <= s0_axi_araddr) && (s0_axi_araddr < 32'h00020000));
  end

  always @(*) begin
    _zz_when_Axi4LiteCrossbar_l317_3[0] = (s0_axi_arvalid && _zz__zz_when_Axi4LiteCrossbar_l317_3[1]);
    _zz_when_Axi4LiteCrossbar_l317_3[1] = (s1_axi_arvalid && _zz__zz_when_Axi4LiteCrossbar_l317_3_1[1]);
  end

  always @(*) begin
    _zz_when_Axi4LiteCrossbar_l317_5[0] = ((32'h0 <= s1_axi_araddr) && (s1_axi_araddr < 32'h00010000));
    _zz_when_Axi4LiteCrossbar_l317_5[1] = ((32'h00010000 <= s1_axi_araddr) && (s1_axi_araddr < 32'h00020000));
  end

  always @(*) begin
    _zz_when_Axi4LiteCrossbar_l152_40[0] = (_zz_when_Axi4LiteCrossbar_l317_3[0] && (rdCredits_1_0 != 2'b00));
    _zz_when_Axi4LiteCrossbar_l152_40[1] = (_zz_when_Axi4LiteCrossbar_l317_3[1] && (rdCredits_1_1 != 2'b00));
  end

  always @(*) begin
    _zz_when_Axi4LiteCrossbar_l152_41 = 2'b00;
    if(when_Axi4LiteCrossbar_l109_8) begin
      _zz_when_Axi4LiteCrossbar_l152_41 = 2'b01;
    end
  end

  assign when_Axi4LiteCrossbar_l109_8 = (1'b1 <= rdRrPtr_1);
  assign _zz_when_Axi4LiteCrossbar_l152_42 = (_zz_when_Axi4LiteCrossbar_l152_40 & (~ _zz_when_Axi4LiteCrossbar_l152_41));
  assign _zz_when_Axi4LiteCrossbar_l152_43 = _zz_when_Axi4LiteCrossbar_l152_42;
  assign _zz_when_Axi4LiteCrossbar_l152_44 = _zz_when_Axi4LiteCrossbar_l152_40;
  always @(*) begin
    _zz_when_Axi4LiteCrossbar_l152_45 = 2'b00;
    if(when_Axi4LiteCrossbar_l109_9) begin
      _zz_when_Axi4LiteCrossbar_l152_45 = 2'b01;
    end
  end

  assign when_Axi4LiteCrossbar_l109_9 = (1'b1 <= rdRrPtr_1);
  assign _zz_when_Axi4LiteCrossbar_l152_46 = (_zz_when_Axi4LiteCrossbar_l317_3 & (~ _zz_when_Axi4LiteCrossbar_l152_45));
  assign _zz_when_Axi4LiteCrossbar_l152_47 = _zz_when_Axi4LiteCrossbar_l152_46;
  assign _zz_when_Axi4LiteCrossbar_l152_48 = _zz_when_Axi4LiteCrossbar_l317_3;
  assign _zz_when_Axi4LiteCrossbar_l152_49 = ((|_zz_when_Axi4LiteCrossbar_l152_40) ? ((|_zz_when_Axi4LiteCrossbar_l152_42) ? (_zz_when_Axi4LiteCrossbar_l152_43 & (~ _zz__zz_when_Axi4LiteCrossbar_l152_49)) : (_zz_when_Axi4LiteCrossbar_l152_44 & (~ _zz__zz_when_Axi4LiteCrossbar_l152_49_1))) : ((|_zz_when_Axi4LiteCrossbar_l152_46) ? (_zz_when_Axi4LiteCrossbar_l152_47 & (~ _zz__zz_when_Axi4LiteCrossbar_l152_49_2)) : (_zz_when_Axi4LiteCrossbar_l152_48 & (~ _zz__zz_when_Axi4LiteCrossbar_l152_49_3))));
  always @(*) begin
    _zz_rdGranted_1 = 1'b0;
    if(when_Axi4LiteCrossbar_l152_8) begin
      _zz_rdGranted_1 = 1'b0;
    end
    if(when_Axi4LiteCrossbar_l152_9) begin
      _zz_rdGranted_1 = 1'b1;
    end
  end

  assign when_Axi4LiteCrossbar_l152_8 = _zz_when_Axi4LiteCrossbar_l152_49[0];
  assign when_Axi4LiteCrossbar_l152_9 = _zz_when_Axi4LiteCrossbar_l152_49[1];
  assign when_Axi4LiteCrossbar_l317_1 = (|_zz_when_Axi4LiteCrossbar_l317_3);
  assign when_Axi4LiteCrossbar_l320_2 = (_zz_rdGranted_1 == 1'b0);
  assign when_Axi4LiteCrossbar_l320_3 = (_zz_rdGranted_1 == 1'b1);
  assign io_slaves_1_ar_fire = (m1_axi_arvalid && m1_axi_arready);
  assign when_Axi4LiteCrossbar_l334_2 = ((_zz_rdGranted_1 == 1'b0) && (rdCredits_1_0 != 2'b00));
  assign when_Axi4LiteCrossbar_l334_3 = ((_zz_rdGranted_1 == 1'b1) && (rdCredits_1_1 != 2'b00));
  always @(*) begin
    when_Axi4LiteCrossbar_l350_1 = 1'b1;
    if(when_Axi4LiteCrossbar_l341_2) begin
      if(when_Axi4LiteCrossbar_l347_2) begin
        when_Axi4LiteCrossbar_l350_1 = 1'b0;
      end
    end
    if(when_Axi4LiteCrossbar_l341_3) begin
      if(when_Axi4LiteCrossbar_l347_3) begin
        when_Axi4LiteCrossbar_l350_1 = 1'b0;
      end
    end
  end

  assign when_Axi4LiteCrossbar_l341_2 = _zz_when_Axi4LiteCrossbar_l317_3[0];
  always @(*) begin
    _zz_when_Axi4LiteCrossbar_l347_2 = rdCredits_1_0;
    if(when_Axi4LiteCrossbar_l344_2) begin
      _zz_when_Axi4LiteCrossbar_l347_2 = (rdCredits_1_0 - 2'b01);
    end
  end

  assign when_Axi4LiteCrossbar_l344_2 = ((_zz_rdGranted_1 == 1'b0) && (rdCredits_1_0 != 2'b00));
  assign when_Axi4LiteCrossbar_l347_2 = (_zz_when_Axi4LiteCrossbar_l347_2 != 2'b00);
  assign when_Axi4LiteCrossbar_l341_3 = _zz_when_Axi4LiteCrossbar_l317_3[1];
  always @(*) begin
    _zz_when_Axi4LiteCrossbar_l347_3 = rdCredits_1_1;
    if(when_Axi4LiteCrossbar_l344_3) begin
      _zz_when_Axi4LiteCrossbar_l347_3 = (rdCredits_1_1 - 2'b01);
    end
  end

  assign when_Axi4LiteCrossbar_l344_3 = ((_zz_rdGranted_1 == 1'b1) && (rdCredits_1_1 != 2'b00));
  assign when_Axi4LiteCrossbar_l347_3 = (_zz_when_Axi4LiteCrossbar_l347_3 != 2'b00);
  assign when_Axi4LiteCrossbar_l363_2 = (rdGranted_1 == 1'b0);
  assign when_Axi4LiteCrossbar_l363_3 = (rdGranted_1 == 1'b1);
  assign io_slaves_1_r_fire = (m1_axi_rvalid && m1_axi_rready);
  assign when_Axi4LiteCrossbar_l306_2 = (! rdActive_2);
  always @(*) begin
    _zz_when_Axi4LiteCrossbar_l317_7[0] = ((32'h0 <= s0_axi_araddr) && (s0_axi_araddr < 32'h00010000));
    _zz_when_Axi4LiteCrossbar_l317_7[1] = ((32'h00010000 <= s0_axi_araddr) && (s0_axi_araddr < 32'h00020000));
  end

  always @(*) begin
    _zz_when_Axi4LiteCrossbar_l317_6[0] = (s0_axi_arvalid && _zz__zz_when_Axi4LiteCrossbar_l317_6[2]);
    _zz_when_Axi4LiteCrossbar_l317_6[1] = (s1_axi_arvalid && _zz__zz_when_Axi4LiteCrossbar_l317_6_1[2]);
  end

  always @(*) begin
    _zz_when_Axi4LiteCrossbar_l317_8[0] = ((32'h0 <= s1_axi_araddr) && (s1_axi_araddr < 32'h00010000));
    _zz_when_Axi4LiteCrossbar_l317_8[1] = ((32'h00010000 <= s1_axi_araddr) && (s1_axi_araddr < 32'h00020000));
  end

  always @(*) begin
    _zz_when_Axi4LiteCrossbar_l152_50[0] = (_zz_when_Axi4LiteCrossbar_l317_6[0] && (rdCredits_2_0 != 2'b00));
    _zz_when_Axi4LiteCrossbar_l152_50[1] = (_zz_when_Axi4LiteCrossbar_l317_6[1] && (rdCredits_2_1 != 2'b00));
  end

  always @(*) begin
    _zz_when_Axi4LiteCrossbar_l152_51 = 2'b00;
    if(when_Axi4LiteCrossbar_l109_10) begin
      _zz_when_Axi4LiteCrossbar_l152_51 = 2'b01;
    end
  end

  assign when_Axi4LiteCrossbar_l109_10 = (1'b1 <= rdRrPtr_2);
  assign _zz_when_Axi4LiteCrossbar_l152_52 = (_zz_when_Axi4LiteCrossbar_l152_50 & (~ _zz_when_Axi4LiteCrossbar_l152_51));
  assign _zz_when_Axi4LiteCrossbar_l152_53 = _zz_when_Axi4LiteCrossbar_l152_52;
  assign _zz_when_Axi4LiteCrossbar_l152_54 = _zz_when_Axi4LiteCrossbar_l152_50;
  always @(*) begin
    _zz_when_Axi4LiteCrossbar_l152_55 = 2'b00;
    if(when_Axi4LiteCrossbar_l109_11) begin
      _zz_when_Axi4LiteCrossbar_l152_55 = 2'b01;
    end
  end

  assign when_Axi4LiteCrossbar_l109_11 = (1'b1 <= rdRrPtr_2);
  assign _zz_when_Axi4LiteCrossbar_l152_56 = (_zz_when_Axi4LiteCrossbar_l317_6 & (~ _zz_when_Axi4LiteCrossbar_l152_55));
  assign _zz_when_Axi4LiteCrossbar_l152_57 = _zz_when_Axi4LiteCrossbar_l152_56;
  assign _zz_when_Axi4LiteCrossbar_l152_58 = _zz_when_Axi4LiteCrossbar_l317_6;
  assign _zz_when_Axi4LiteCrossbar_l152_59 = ((|_zz_when_Axi4LiteCrossbar_l152_50) ? ((|_zz_when_Axi4LiteCrossbar_l152_52) ? (_zz_when_Axi4LiteCrossbar_l152_53 & (~ _zz__zz_when_Axi4LiteCrossbar_l152_59)) : (_zz_when_Axi4LiteCrossbar_l152_54 & (~ _zz__zz_when_Axi4LiteCrossbar_l152_59_1))) : ((|_zz_when_Axi4LiteCrossbar_l152_56) ? (_zz_when_Axi4LiteCrossbar_l152_57 & (~ _zz__zz_when_Axi4LiteCrossbar_l152_59_2)) : (_zz_when_Axi4LiteCrossbar_l152_58 & (~ _zz__zz_when_Axi4LiteCrossbar_l152_59_3))));
  always @(*) begin
    _zz_rdGranted_2 = 1'b0;
    if(when_Axi4LiteCrossbar_l152_10) begin
      _zz_rdGranted_2 = 1'b0;
    end
    if(when_Axi4LiteCrossbar_l152_11) begin
      _zz_rdGranted_2 = 1'b1;
    end
  end

  assign when_Axi4LiteCrossbar_l152_10 = _zz_when_Axi4LiteCrossbar_l152_59[0];
  assign when_Axi4LiteCrossbar_l152_11 = _zz_when_Axi4LiteCrossbar_l152_59[1];
  assign when_Axi4LiteCrossbar_l317_2 = (|_zz_when_Axi4LiteCrossbar_l317_6);
  assign when_Axi4LiteCrossbar_l320_4 = (_zz_rdGranted_2 == 1'b0);
  assign when_Axi4LiteCrossbar_l320_5 = (_zz_rdGranted_2 == 1'b1);
  assign decErr_io_axi_ar_fire = (decErr_io_axi_ar_valid && decErr_io_axi_ar_ready);
  assign when_Axi4LiteCrossbar_l334_4 = ((_zz_rdGranted_2 == 1'b0) && (rdCredits_2_0 != 2'b00));
  assign when_Axi4LiteCrossbar_l334_5 = ((_zz_rdGranted_2 == 1'b1) && (rdCredits_2_1 != 2'b00));
  always @(*) begin
    when_Axi4LiteCrossbar_l350_2 = 1'b1;
    if(when_Axi4LiteCrossbar_l341_4) begin
      if(when_Axi4LiteCrossbar_l347_4) begin
        when_Axi4LiteCrossbar_l350_2 = 1'b0;
      end
    end
    if(when_Axi4LiteCrossbar_l341_5) begin
      if(when_Axi4LiteCrossbar_l347_5) begin
        when_Axi4LiteCrossbar_l350_2 = 1'b0;
      end
    end
  end

  assign when_Axi4LiteCrossbar_l341_4 = _zz_when_Axi4LiteCrossbar_l317_6[0];
  always @(*) begin
    _zz_when_Axi4LiteCrossbar_l347_4 = rdCredits_2_0;
    if(when_Axi4LiteCrossbar_l344_4) begin
      _zz_when_Axi4LiteCrossbar_l347_4 = (rdCredits_2_0 - 2'b01);
    end
  end

  assign when_Axi4LiteCrossbar_l344_4 = ((_zz_rdGranted_2 == 1'b0) && (rdCredits_2_0 != 2'b00));
  assign when_Axi4LiteCrossbar_l347_4 = (_zz_when_Axi4LiteCrossbar_l347_4 != 2'b00);
  assign when_Axi4LiteCrossbar_l341_5 = _zz_when_Axi4LiteCrossbar_l317_6[1];
  always @(*) begin
    _zz_when_Axi4LiteCrossbar_l347_5 = rdCredits_2_1;
    if(when_Axi4LiteCrossbar_l344_5) begin
      _zz_when_Axi4LiteCrossbar_l347_5 = (rdCredits_2_1 - 2'b01);
    end
  end

  assign when_Axi4LiteCrossbar_l344_5 = ((_zz_rdGranted_2 == 1'b1) && (rdCredits_2_1 != 2'b00));
  assign when_Axi4LiteCrossbar_l347_5 = (_zz_when_Axi4LiteCrossbar_l347_5 != 2'b00);
  assign when_Axi4LiteCrossbar_l363_4 = (rdGranted_2 == 1'b0);
  assign when_Axi4LiteCrossbar_l363_5 = (rdGranted_2 == 1'b1);
  assign decErr_io_axi_r_fire = (decErr_io_axi_r_valid && decErr_io_axi_r_ready);
  always @(posedge aclk) begin
    if(!aresetn) begin
      wrActive_0 <= 1'b0;
      wrActive_1 <= 1'b0;
      wrActive_2 <= 1'b0;
      wrGranted_0 <= 1'b0;
      wrGranted_1 <= 1'b0;
      wrGranted_2 <= 1'b0;
      wrRrPtr_0 <= 1'b0;
      wrRrPtr_1 <= 1'b0;
      wrRrPtr_2 <= 1'b0;
      rdActive_0 <= 1'b0;
      rdActive_1 <= 1'b0;
      rdActive_2 <= 1'b0;
      rdGranted_0 <= 1'b0;
      rdGranted_1 <= 1'b0;
      rdGranted_2 <= 1'b0;
      rdRrPtr_0 <= 1'b0;
      rdRrPtr_1 <= 1'b0;
      rdRrPtr_2 <= 1'b0;
      wrCredits_0_0 <= 2'b11;
      wrCredits_0_1 <= 2'b01;
      wrCredits_1_0 <= 2'b11;
      wrCredits_1_1 <= 2'b01;
      wrCredits_2_0 <= 2'b11;
      wrCredits_2_1 <= 2'b01;
      rdCredits_0_0 <= 2'b11;
      rdCredits_0_1 <= 2'b01;
      rdCredits_1_0 <= 2'b11;
      rdCredits_1_1 <= 2'b01;
      rdCredits_2_0 <= 2'b11;
      rdCredits_2_1 <= 2'b01;
    end else begin
      if(when_Axi4LiteCrossbar_l217) begin
        if(when_Axi4LiteCrossbar_l229) begin
          if(io_slaves_0_aw_fire) begin
            wrActive_0 <= 1'b1;
            wrGranted_0 <= _zz_wrGranted_0;
            wrRrPtr_0 <= (_zz_wrGranted_0 + 1'b1);
            if(when_Axi4LiteCrossbar_l253) begin
              wrCredits_0_0 <= (wrCredits_0_0 - 2'b01);
            end
            if(when_Axi4LiteCrossbar_l253_1) begin
              wrCredits_0_1 <= (wrCredits_0_1 - 2'b01);
            end
            if(when_Axi4LiteCrossbar_l271) begin
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
      if(when_Axi4LiteCrossbar_l217_1) begin
        if(when_Axi4LiteCrossbar_l229_1) begin
          if(io_slaves_1_aw_fire) begin
            wrActive_1 <= 1'b1;
            wrGranted_1 <= _zz_wrGranted_1;
            wrRrPtr_1 <= (_zz_wrGranted_1 + 1'b1);
            if(when_Axi4LiteCrossbar_l253_2) begin
              wrCredits_1_0 <= (wrCredits_1_0 - 2'b01);
            end
            if(when_Axi4LiteCrossbar_l253_3) begin
              wrCredits_1_1 <= (wrCredits_1_1 - 2'b01);
            end
            if(when_Axi4LiteCrossbar_l271_1) begin
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
      if(when_Axi4LiteCrossbar_l217_2) begin
        if(when_Axi4LiteCrossbar_l229_2) begin
          if(decErr_io_axi_aw_fire) begin
            wrActive_2 <= 1'b1;
            wrGranted_2 <= _zz_wrGranted_2;
            wrRrPtr_2 <= (_zz_wrGranted_2 + 1'b1);
            if(when_Axi4LiteCrossbar_l253_4) begin
              wrCredits_2_0 <= (wrCredits_2_0 - 2'b01);
            end
            if(when_Axi4LiteCrossbar_l253_5) begin
              wrCredits_2_1 <= (wrCredits_2_1 - 2'b01);
            end
            if(when_Axi4LiteCrossbar_l271_2) begin
              wrCredits_2_0 <= 2'b11;
              wrCredits_2_1 <= 2'b01;
            end
          end
        end
      end else begin
        if(decErr_io_axi_b_fire) begin
          wrActive_2 <= 1'b0;
        end
      end
      if(when_Axi4LiteCrossbar_l306) begin
        if(when_Axi4LiteCrossbar_l317) begin
          if(io_slaves_0_ar_fire) begin
            rdActive_0 <= 1'b1;
            rdGranted_0 <= _zz_rdGranted_0;
            rdRrPtr_0 <= (_zz_rdGranted_0 + 1'b1);
            if(when_Axi4LiteCrossbar_l334) begin
              rdCredits_0_0 <= (rdCredits_0_0 - 2'b01);
            end
            if(when_Axi4LiteCrossbar_l334_1) begin
              rdCredits_0_1 <= (rdCredits_0_1 - 2'b01);
            end
            if(when_Axi4LiteCrossbar_l350) begin
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
      if(when_Axi4LiteCrossbar_l306_1) begin
        if(when_Axi4LiteCrossbar_l317_1) begin
          if(io_slaves_1_ar_fire) begin
            rdActive_1 <= 1'b1;
            rdGranted_1 <= _zz_rdGranted_1;
            rdRrPtr_1 <= (_zz_rdGranted_1 + 1'b1);
            if(when_Axi4LiteCrossbar_l334_2) begin
              rdCredits_1_0 <= (rdCredits_1_0 - 2'b01);
            end
            if(when_Axi4LiteCrossbar_l334_3) begin
              rdCredits_1_1 <= (rdCredits_1_1 - 2'b01);
            end
            if(when_Axi4LiteCrossbar_l350_1) begin
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
      if(when_Axi4LiteCrossbar_l306_2) begin
        if(when_Axi4LiteCrossbar_l317_2) begin
          if(decErr_io_axi_ar_fire) begin
            rdActive_2 <= 1'b1;
            rdGranted_2 <= _zz_rdGranted_2;
            rdRrPtr_2 <= (_zz_rdGranted_2 + 1'b1);
            if(when_Axi4LiteCrossbar_l334_4) begin
              rdCredits_2_0 <= (rdCredits_2_0 - 2'b01);
            end
            if(when_Axi4LiteCrossbar_l334_5) begin
              rdCredits_2_1 <= (rdCredits_2_1 - 2'b01);
            end
            if(when_Axi4LiteCrossbar_l350_2) begin
              rdCredits_2_0 <= 2'b11;
              rdCredits_2_1 <= 2'b01;
            end
          end
        end
      end else begin
        if(decErr_io_axi_r_fire) begin
          rdActive_2 <= 1'b0;
        end
      end
    end
  end


endmodule

module Axi4DecErrSlave (
  input  wire          io_axi_aw_valid,
  output wire          io_axi_aw_ready,
  input  wire [31:0]   io_axi_aw_payload_addr,
  input  wire [2:0]    io_axi_aw_payload_prot,
  input  wire          io_axi_w_valid,
  output wire          io_axi_w_ready,
  input  wire [31:0]   io_axi_w_payload_data,
  input  wire [3:0]    io_axi_w_payload_strb,
  output wire          io_axi_b_valid,
  input  wire          io_axi_b_ready,
  output reg  [1:0]    io_axi_b_payload_resp,
  input  wire          io_axi_ar_valid,
  output wire          io_axi_ar_ready,
  input  wire [31:0]   io_axi_ar_payload_addr,
  input  wire [2:0]    io_axi_ar_payload_prot,
  output wire          io_axi_r_valid,
  input  wire          io_axi_r_ready,
  output reg  [31:0]   io_axi_r_payload_data,
  output reg  [1:0]    io_axi_r_payload_resp,
  input  wire          aclk,
  input  wire          aresetn
);

  wire       [1:0]    _zz_io_axi_b_payload_resp;
  reg                 write_sinking;
  reg                 write_answering;
  wire                io_axi_aw_fire;
  wire                write_lastBeat;
  wire                io_axi_w_fire;
  wire                when_Axi4DecErrSlave_l59;
  wire                io_axi_b_fire;
  reg                 read_busy;
  reg        [7:0]    read_beatsLeft;
  wire                io_axi_ar_fire;
  wire       [33:0]   _zz_io_axi_r_payload_data;
  wire                io_axi_r_fire;
  wire                when_Axi4DecErrSlave_l97;

  assign _zz_io_axi_b_payload_resp = 2'b00;
  assign io_axi_aw_ready = ((! write_sinking) && (! write_answering));
  assign io_axi_aw_fire = (io_axi_aw_valid && io_axi_aw_ready);
  assign io_axi_w_ready = write_sinking;
  assign write_lastBeat = 1'b1;
  assign io_axi_w_fire = (io_axi_w_valid && io_axi_w_ready);
  assign when_Axi4DecErrSlave_l59 = ((write_sinking && io_axi_w_fire) && write_lastBeat);
  assign io_axi_b_valid = write_answering;
  always @(*) begin
    io_axi_b_payload_resp = _zz_io_axi_b_payload_resp[1 : 0];
    io_axi_b_payload_resp = 2'b11;
  end

  assign io_axi_b_fire = (io_axi_b_valid && io_axi_b_ready);
  assign io_axi_ar_ready = (! read_busy);
  assign io_axi_ar_fire = (io_axi_ar_valid && io_axi_ar_ready);
  assign io_axi_r_valid = read_busy;
  assign _zz_io_axi_r_payload_data = 34'h0;
  always @(*) begin
    io_axi_r_payload_data = _zz_io_axi_r_payload_data[31 : 0];
    io_axi_r_payload_data = 32'h0;
  end

  always @(*) begin
    io_axi_r_payload_resp = _zz_io_axi_r_payload_data[33 : 32];
    io_axi_r_payload_resp = 2'b11;
  end

  assign io_axi_r_fire = (io_axi_r_valid && io_axi_r_ready);
  assign when_Axi4DecErrSlave_l97 = (read_beatsLeft == 8'h0);
  always @(posedge aclk) begin
    if(!aresetn) begin
      write_sinking <= 1'b0;
      write_answering <= 1'b0;
      read_busy <= 1'b0;
      read_beatsLeft <= 8'h0;
    end else begin
      if(io_axi_aw_fire) begin
        write_sinking <= 1'b1;
      end
      if(when_Axi4DecErrSlave_l59) begin
        write_sinking <= 1'b0;
        write_answering <= 1'b1;
      end
      if(io_axi_b_fire) begin
        write_answering <= 1'b0;
      end
      if(io_axi_ar_fire) begin
        read_busy <= 1'b1;
        read_beatsLeft <= 8'h0;
      end
      if(io_axi_r_fire) begin
        if(when_Axi4DecErrSlave_l97) begin
          read_busy <= 1'b0;
        end else begin
          read_beatsLeft <= (read_beatsLeft - 8'h01);
        end
      end
    end
  end


endmodule
