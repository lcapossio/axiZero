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
  output wire          m2_axi_awvalid,
  input  wire          m2_axi_awready,
  output wire [31:0]   m2_axi_awaddr,
  output wire [2:0]    m2_axi_awprot,
  output wire          m2_axi_wvalid,
  input  wire          m2_axi_wready,
  output wire [31:0]   m2_axi_wdata,
  output wire [3:0]    m2_axi_wstrb,
  input  wire          m2_axi_bvalid,
  output wire          m2_axi_bready,
  input  wire [1:0]    m2_axi_bresp,
  output wire          m2_axi_arvalid,
  input  wire          m2_axi_arready,
  output wire [31:0]   m2_axi_araddr,
  output wire [2:0]    m2_axi_arprot,
  input  wire          m2_axi_rvalid,
  output wire          m2_axi_rready,
  input  wire [31:0]   m2_axi_rdata,
  input  wire [1:0]    m2_axi_rresp,
  output wire          m3_axi_awvalid,
  input  wire          m3_axi_awready,
  output wire [31:0]   m3_axi_awaddr,
  output wire [2:0]    m3_axi_awprot,
  output wire          m3_axi_wvalid,
  input  wire          m3_axi_wready,
  output wire [31:0]   m3_axi_wdata,
  output wire [3:0]    m3_axi_wstrb,
  input  wire          m3_axi_bvalid,
  output wire          m3_axi_bready,
  input  wire [1:0]    m3_axi_bresp,
  output wire          m3_axi_arvalid,
  input  wire          m3_axi_arready,
  output wire [31:0]   m3_axi_araddr,
  output wire [2:0]    m3_axi_arprot,
  input  wire          m3_axi_rvalid,
  output wire          m3_axi_rready,
  input  wire [31:0]   m3_axi_rdata,
  input  wire [1:0]    m3_axi_rresp,
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
  wire                xbar_io_slaves_2_ar_valid;
  wire       [31:0]   xbar_io_slaves_2_ar_payload_addr;
  wire       [2:0]    xbar_io_slaves_2_ar_payload_prot;
  wire                xbar_io_slaves_2_aw_valid;
  wire       [31:0]   xbar_io_slaves_2_aw_payload_addr;
  wire       [2:0]    xbar_io_slaves_2_aw_payload_prot;
  wire                xbar_io_slaves_2_w_valid;
  wire       [31:0]   xbar_io_slaves_2_w_payload_data;
  wire       [3:0]    xbar_io_slaves_2_w_payload_strb;
  wire                xbar_io_slaves_2_r_ready;
  wire                xbar_io_slaves_2_b_ready;
  wire                xbar_io_slaves_3_ar_valid;
  wire       [31:0]   xbar_io_slaves_3_ar_payload_addr;
  wire       [2:0]    xbar_io_slaves_3_ar_payload_prot;
  wire                xbar_io_slaves_3_aw_valid;
  wire       [31:0]   xbar_io_slaves_3_aw_payload_addr;
  wire       [2:0]    xbar_io_slaves_3_aw_payload_prot;
  wire                xbar_io_slaves_3_w_valid;
  wire       [31:0]   xbar_io_slaves_3_w_payload_data;
  wire       [3:0]    xbar_io_slaves_3_w_payload_strb;
  wire                xbar_io_slaves_3_r_ready;
  wire                xbar_io_slaves_3_b_ready;

  Axi4LiteCrossbar xbar (
    .s0_axi_awvalid        (s0_axi_awvalid                 ), //i
    .s0_axi_awready        (xbar_io_masters_0_aw_ready            ), //o
    .s0_axi_awaddr (s0_axi_awaddr[31:0]    ), //i
    .s0_axi_awprot (s0_axi_awprot[2:0]     ), //i
    .s0_axi_wvalid         (s0_axi_wvalid                  ), //i
    .s0_axi_wready         (xbar_io_masters_0_w_ready             ), //o
    .s0_axi_wdata  (s0_axi_wdata[31:0]     ), //i
    .s0_axi_wstrb  (s0_axi_wstrb[3:0]      ), //i
    .s0_axi_bvalid         (xbar_io_masters_0_b_valid             ), //o
    .s0_axi_bready         (s0_axi_bready                  ), //i
    .s0_axi_bresp  (xbar_io_masters_0_b_payload_resp[1:0] ), //o
    .s0_axi_arvalid        (s0_axi_arvalid                 ), //i
    .s0_axi_arready        (xbar_io_masters_0_ar_ready            ), //o
    .s0_axi_araddr (s0_axi_araddr[31:0]    ), //i
    .s0_axi_arprot (s0_axi_arprot[2:0]     ), //i
    .s0_axi_rvalid         (xbar_io_masters_0_r_valid             ), //o
    .s0_axi_rready         (s0_axi_rready                  ), //i
    .s0_axi_rdata  (xbar_io_masters_0_r_payload_data[31:0]), //o
    .s0_axi_rresp  (xbar_io_masters_0_r_payload_resp[1:0] ), //o
    .s1_axi_awvalid        (s1_axi_awvalid                 ), //i
    .s1_axi_awready        (xbar_io_masters_1_aw_ready            ), //o
    .s1_axi_awaddr (s1_axi_awaddr[31:0]    ), //i
    .s1_axi_awprot (s1_axi_awprot[2:0]     ), //i
    .s1_axi_wvalid         (s1_axi_wvalid                  ), //i
    .s1_axi_wready         (xbar_io_masters_1_w_ready             ), //o
    .s1_axi_wdata  (s1_axi_wdata[31:0]     ), //i
    .s1_axi_wstrb  (s1_axi_wstrb[3:0]      ), //i
    .s1_axi_bvalid         (xbar_io_masters_1_b_valid             ), //o
    .s1_axi_bready         (s1_axi_bready                  ), //i
    .s1_axi_bresp  (xbar_io_masters_1_b_payload_resp[1:0] ), //o
    .s1_axi_arvalid        (s1_axi_arvalid                 ), //i
    .s1_axi_arready        (xbar_io_masters_1_ar_ready            ), //o
    .s1_axi_araddr (s1_axi_araddr[31:0]    ), //i
    .s1_axi_arprot (s1_axi_arprot[2:0]     ), //i
    .s1_axi_rvalid         (xbar_io_masters_1_r_valid             ), //o
    .s1_axi_rready         (s1_axi_rready                  ), //i
    .s1_axi_rdata  (xbar_io_masters_1_r_payload_data[31:0]), //o
    .s1_axi_rresp  (xbar_io_masters_1_r_payload_resp[1:0] ), //o
    .m0_axi_awvalid         (xbar_io_slaves_0_aw_valid             ), //o
    .m0_axi_awready         (m0_axi_awready                  ), //i
    .m0_axi_awaddr  (xbar_io_slaves_0_aw_payload_addr[31:0]), //o
    .m0_axi_awprot  (xbar_io_slaves_0_aw_payload_prot[2:0] ), //o
    .m0_axi_wvalid          (xbar_io_slaves_0_w_valid              ), //o
    .m0_axi_wready          (m0_axi_wready                   ), //i
    .m0_axi_wdata   (xbar_io_slaves_0_w_payload_data[31:0] ), //o
    .m0_axi_wstrb   (xbar_io_slaves_0_w_payload_strb[3:0]  ), //o
    .m0_axi_bvalid          (m0_axi_bvalid                   ), //i
    .m0_axi_bready          (xbar_io_slaves_0_b_ready              ), //o
    .m0_axi_bresp   (m0_axi_bresp[1:0]       ), //i
    .m0_axi_arvalid         (xbar_io_slaves_0_ar_valid             ), //o
    .m0_axi_arready         (m0_axi_arready                  ), //i
    .m0_axi_araddr  (xbar_io_slaves_0_ar_payload_addr[31:0]), //o
    .m0_axi_arprot  (xbar_io_slaves_0_ar_payload_prot[2:0] ), //o
    .m0_axi_rvalid          (m0_axi_rvalid                   ), //i
    .m0_axi_rready          (xbar_io_slaves_0_r_ready              ), //o
    .m0_axi_rdata   (m0_axi_rdata[31:0]      ), //i
    .m0_axi_rresp   (m0_axi_rresp[1:0]       ), //i
    .m1_axi_awvalid         (xbar_io_slaves_1_aw_valid             ), //o
    .m1_axi_awready         (m1_axi_awready                  ), //i
    .m1_axi_awaddr  (xbar_io_slaves_1_aw_payload_addr[31:0]), //o
    .m1_axi_awprot  (xbar_io_slaves_1_aw_payload_prot[2:0] ), //o
    .m1_axi_wvalid          (xbar_io_slaves_1_w_valid              ), //o
    .m1_axi_wready          (m1_axi_wready                   ), //i
    .m1_axi_wdata   (xbar_io_slaves_1_w_payload_data[31:0] ), //o
    .m1_axi_wstrb   (xbar_io_slaves_1_w_payload_strb[3:0]  ), //o
    .m1_axi_bvalid          (m1_axi_bvalid                   ), //i
    .m1_axi_bready          (xbar_io_slaves_1_b_ready              ), //o
    .m1_axi_bresp   (m1_axi_bresp[1:0]       ), //i
    .m1_axi_arvalid         (xbar_io_slaves_1_ar_valid             ), //o
    .m1_axi_arready         (m1_axi_arready                  ), //i
    .m1_axi_araddr  (xbar_io_slaves_1_ar_payload_addr[31:0]), //o
    .m1_axi_arprot  (xbar_io_slaves_1_ar_payload_prot[2:0] ), //o
    .m1_axi_rvalid          (m1_axi_rvalid                   ), //i
    .m1_axi_rready          (xbar_io_slaves_1_r_ready              ), //o
    .m1_axi_rdata   (m1_axi_rdata[31:0]      ), //i
    .m1_axi_rresp   (m1_axi_rresp[1:0]       ), //i
    .m2_axi_awvalid         (xbar_io_slaves_2_aw_valid             ), //o
    .m2_axi_awready         (m2_axi_awready                  ), //i
    .m2_axi_awaddr  (xbar_io_slaves_2_aw_payload_addr[31:0]), //o
    .m2_axi_awprot  (xbar_io_slaves_2_aw_payload_prot[2:0] ), //o
    .m2_axi_wvalid          (xbar_io_slaves_2_w_valid              ), //o
    .m2_axi_wready          (m2_axi_wready                   ), //i
    .m2_axi_wdata   (xbar_io_slaves_2_w_payload_data[31:0] ), //o
    .m2_axi_wstrb   (xbar_io_slaves_2_w_payload_strb[3:0]  ), //o
    .m2_axi_bvalid          (m2_axi_bvalid                   ), //i
    .m2_axi_bready          (xbar_io_slaves_2_b_ready              ), //o
    .m2_axi_bresp   (m2_axi_bresp[1:0]       ), //i
    .m2_axi_arvalid         (xbar_io_slaves_2_ar_valid             ), //o
    .m2_axi_arready         (m2_axi_arready                  ), //i
    .m2_axi_araddr  (xbar_io_slaves_2_ar_payload_addr[31:0]), //o
    .m2_axi_arprot  (xbar_io_slaves_2_ar_payload_prot[2:0] ), //o
    .m2_axi_rvalid          (m2_axi_rvalid                   ), //i
    .m2_axi_rready          (xbar_io_slaves_2_r_ready              ), //o
    .m2_axi_rdata   (m2_axi_rdata[31:0]      ), //i
    .m2_axi_rresp   (m2_axi_rresp[1:0]       ), //i
    .m3_axi_awvalid         (xbar_io_slaves_3_aw_valid             ), //o
    .m3_axi_awready         (m3_axi_awready                  ), //i
    .m3_axi_awaddr  (xbar_io_slaves_3_aw_payload_addr[31:0]), //o
    .m3_axi_awprot  (xbar_io_slaves_3_aw_payload_prot[2:0] ), //o
    .m3_axi_wvalid          (xbar_io_slaves_3_w_valid              ), //o
    .m3_axi_wready          (m3_axi_wready                   ), //i
    .m3_axi_wdata   (xbar_io_slaves_3_w_payload_data[31:0] ), //o
    .m3_axi_wstrb   (xbar_io_slaves_3_w_payload_strb[3:0]  ), //o
    .m3_axi_bvalid          (m3_axi_bvalid                   ), //i
    .m3_axi_bready          (xbar_io_slaves_3_b_ready              ), //o
    .m3_axi_bresp   (m3_axi_bresp[1:0]       ), //i
    .m3_axi_arvalid         (xbar_io_slaves_3_ar_valid             ), //o
    .m3_axi_arready         (m3_axi_arready                  ), //i
    .m3_axi_araddr  (xbar_io_slaves_3_ar_payload_addr[31:0]), //o
    .m3_axi_arprot  (xbar_io_slaves_3_ar_payload_prot[2:0] ), //o
    .m3_axi_rvalid          (m3_axi_rvalid                   ), //i
    .m3_axi_rready          (xbar_io_slaves_3_r_ready              ), //o
    .m3_axi_rdata   (m3_axi_rdata[31:0]      ), //i
    .m3_axi_rresp   (m3_axi_rresp[1:0]       ), //i
    .aclk                          (aclk                                   ), //i
    .aresetn                       (aresetn                                )  //i
  );
  assign s0_axi_awready = xbar_io_masters_0_aw_ready;
  assign s0_axi_wready = xbar_io_masters_0_w_ready;
  assign s0_axi_bvalid = xbar_io_masters_0_b_valid;
  assign s0_axi_bresp = xbar_io_masters_0_b_payload_resp;
  assign s0_axi_arready = xbar_io_masters_0_ar_ready;
  assign s0_axi_rvalid = xbar_io_masters_0_r_valid;
  assign s0_axi_rdata = xbar_io_masters_0_r_payload_data;
  assign s0_axi_rresp = xbar_io_masters_0_r_payload_resp;
  assign s1_axi_awready = xbar_io_masters_1_aw_ready;
  assign s1_axi_wready = xbar_io_masters_1_w_ready;
  assign s1_axi_bvalid = xbar_io_masters_1_b_valid;
  assign s1_axi_bresp = xbar_io_masters_1_b_payload_resp;
  assign s1_axi_arready = xbar_io_masters_1_ar_ready;
  assign s1_axi_rvalid = xbar_io_masters_1_r_valid;
  assign s1_axi_rdata = xbar_io_masters_1_r_payload_data;
  assign s1_axi_rresp = xbar_io_masters_1_r_payload_resp;
  assign m0_axi_awvalid = xbar_io_slaves_0_aw_valid;
  assign m0_axi_awaddr = xbar_io_slaves_0_aw_payload_addr;
  assign m0_axi_awprot = xbar_io_slaves_0_aw_payload_prot;
  assign m0_axi_wvalid = xbar_io_slaves_0_w_valid;
  assign m0_axi_wdata = xbar_io_slaves_0_w_payload_data;
  assign m0_axi_wstrb = xbar_io_slaves_0_w_payload_strb;
  assign m0_axi_bready = xbar_io_slaves_0_b_ready;
  assign m0_axi_arvalid = xbar_io_slaves_0_ar_valid;
  assign m0_axi_araddr = xbar_io_slaves_0_ar_payload_addr;
  assign m0_axi_arprot = xbar_io_slaves_0_ar_payload_prot;
  assign m0_axi_rready = xbar_io_slaves_0_r_ready;
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
  assign m2_axi_awvalid = xbar_io_slaves_2_aw_valid;
  assign m2_axi_awaddr = xbar_io_slaves_2_aw_payload_addr;
  assign m2_axi_awprot = xbar_io_slaves_2_aw_payload_prot;
  assign m2_axi_wvalid = xbar_io_slaves_2_w_valid;
  assign m2_axi_wdata = xbar_io_slaves_2_w_payload_data;
  assign m2_axi_wstrb = xbar_io_slaves_2_w_payload_strb;
  assign m2_axi_bready = xbar_io_slaves_2_b_ready;
  assign m2_axi_arvalid = xbar_io_slaves_2_ar_valid;
  assign m2_axi_araddr = xbar_io_slaves_2_ar_payload_addr;
  assign m2_axi_arprot = xbar_io_slaves_2_ar_payload_prot;
  assign m2_axi_rready = xbar_io_slaves_2_r_ready;
  assign m3_axi_awvalid = xbar_io_slaves_3_aw_valid;
  assign m3_axi_awaddr = xbar_io_slaves_3_aw_payload_addr;
  assign m3_axi_awprot = xbar_io_slaves_3_aw_payload_prot;
  assign m3_axi_wvalid = xbar_io_slaves_3_w_valid;
  assign m3_axi_wdata = xbar_io_slaves_3_w_payload_data;
  assign m3_axi_wstrb = xbar_io_slaves_3_w_payload_strb;
  assign m3_axi_bready = xbar_io_slaves_3_b_ready;
  assign m3_axi_arvalid = xbar_io_slaves_3_ar_valid;
  assign m3_axi_araddr = xbar_io_slaves_3_ar_payload_addr;
  assign m3_axi_arprot = xbar_io_slaves_3_ar_payload_prot;
  assign m3_axi_rready = xbar_io_slaves_3_r_ready;

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
  output reg           m2_axi_awvalid,
  input  wire          m2_axi_awready,
  output reg  [31:0]   m2_axi_awaddr,
  output reg  [2:0]    m2_axi_awprot,
  output reg           m2_axi_wvalid,
  input  wire          m2_axi_wready,
  output reg  [31:0]   m2_axi_wdata,
  output reg  [3:0]    m2_axi_wstrb,
  input  wire          m2_axi_bvalid,
  output reg           m2_axi_bready,
  input  wire [1:0]    m2_axi_bresp,
  output reg           m2_axi_arvalid,
  input  wire          m2_axi_arready,
  output reg  [31:0]   m2_axi_araddr,
  output reg  [2:0]    m2_axi_arprot,
  input  wire          m2_axi_rvalid,
  output reg           m2_axi_rready,
  input  wire [31:0]   m2_axi_rdata,
  input  wire [1:0]    m2_axi_rresp,
  output reg           m3_axi_awvalid,
  input  wire          m3_axi_awready,
  output reg  [31:0]   m3_axi_awaddr,
  output reg  [2:0]    m3_axi_awprot,
  output reg           m3_axi_wvalid,
  input  wire          m3_axi_wready,
  output reg  [31:0]   m3_axi_wdata,
  output reg  [3:0]    m3_axi_wstrb,
  input  wire          m3_axi_bvalid,
  output reg           m3_axi_bready,
  input  wire [1:0]    m3_axi_bresp,
  output reg           m3_axi_arvalid,
  input  wire          m3_axi_arready,
  output reg  [31:0]   m3_axi_araddr,
  output reg  [2:0]    m3_axi_arprot,
  input  wire          m3_axi_rvalid,
  output reg           m3_axi_rready,
  input  wire [31:0]   m3_axi_rdata,
  input  wire [1:0]    m3_axi_rresp,
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
  wire       [4:0]    _zz__zz_when_Axi4LiteCrossbar_l229;
  wire       [4:0]    _zz__zz_when_Axi4LiteCrossbar_l229_1;
  wire       [1:0]    _zz__zz_when_Axi4LiteCrossbar_l152_1;
  wire       [4:0]    _zz__zz_when_Axi4LiteCrossbar_l229_3;
  wire       [4:0]    _zz__zz_when_Axi4LiteCrossbar_l229_3_1;
  wire       [1:0]    _zz__zz_when_Axi4LiteCrossbar_l152_3;
  wire       [4:0]    _zz__zz_when_Axi4LiteCrossbar_l229_6;
  wire       [4:0]    _zz__zz_when_Axi4LiteCrossbar_l229_6_1;
  wire       [1:0]    _zz__zz_when_Axi4LiteCrossbar_l152_5;
  wire       [4:0]    _zz__zz_when_Axi4LiteCrossbar_l229_9;
  wire       [4:0]    _zz__zz_when_Axi4LiteCrossbar_l229_9_1;
  wire       [1:0]    _zz__zz_when_Axi4LiteCrossbar_l152_7;
  wire       [4:0]    _zz__zz_when_Axi4LiteCrossbar_l229_12;
  wire       [4:0]    _zz__zz_when_Axi4LiteCrossbar_l229_12_1;
  wire       [1:0]    _zz__zz_when_Axi4LiteCrossbar_l152_9;
  wire       [4:0]    _zz__zz_when_Axi4LiteCrossbar_l317;
  wire       [4:0]    _zz__zz_when_Axi4LiteCrossbar_l317_1;
  wire       [1:0]    _zz__zz_when_Axi4LiteCrossbar_l152_11;
  wire       [4:0]    _zz__zz_when_Axi4LiteCrossbar_l317_3;
  wire       [4:0]    _zz__zz_when_Axi4LiteCrossbar_l317_3_1;
  wire       [1:0]    _zz__zz_when_Axi4LiteCrossbar_l152_13;
  wire       [4:0]    _zz__zz_when_Axi4LiteCrossbar_l317_6;
  wire       [4:0]    _zz__zz_when_Axi4LiteCrossbar_l317_6_1;
  wire       [1:0]    _zz__zz_when_Axi4LiteCrossbar_l152_15;
  wire       [4:0]    _zz__zz_when_Axi4LiteCrossbar_l317_9;
  wire       [4:0]    _zz__zz_when_Axi4LiteCrossbar_l317_9_1;
  wire       [1:0]    _zz__zz_when_Axi4LiteCrossbar_l152_17;
  wire       [4:0]    _zz__zz_when_Axi4LiteCrossbar_l317_12;
  wire       [4:0]    _zz__zz_when_Axi4LiteCrossbar_l317_12_1;
  wire       [1:0]    _zz__zz_when_Axi4LiteCrossbar_l152_19;
  reg                 wrActive_0;
  reg                 wrActive_1;
  reg                 wrActive_2;
  reg                 wrActive_3;
  reg                 wrActive_4;
  reg        [0:0]    wrGranted_0;
  reg        [0:0]    wrGranted_1;
  reg        [0:0]    wrGranted_2;
  reg        [0:0]    wrGranted_3;
  reg        [0:0]    wrGranted_4;
  reg        [0:0]    wrRrPtr_0;
  reg        [0:0]    wrRrPtr_1;
  reg        [0:0]    wrRrPtr_2;
  reg        [0:0]    wrRrPtr_3;
  reg        [0:0]    wrRrPtr_4;
  reg                 rdActive_0;
  reg                 rdActive_1;
  reg                 rdActive_2;
  reg                 rdActive_3;
  reg                 rdActive_4;
  reg        [0:0]    rdGranted_0;
  reg        [0:0]    rdGranted_1;
  reg        [0:0]    rdGranted_2;
  reg        [0:0]    rdGranted_3;
  reg        [0:0]    rdGranted_4;
  reg        [0:0]    rdRrPtr_0;
  reg        [0:0]    rdRrPtr_1;
  reg        [0:0]    rdRrPtr_2;
  reg        [0:0]    rdRrPtr_3;
  reg        [0:0]    rdRrPtr_4;
  wire       [33:0]   _zz_io_masters_0_r_payload_data;
  wire       [33:0]   _zz_io_masters_1_r_payload_data;
  wire       [34:0]   _zz_io_slaves_0_aw_payload_addr;
  wire       [35:0]   _zz_io_slaves_0_w_payload_data;
  wire       [34:0]   _zz_io_slaves_0_ar_payload_addr;
  wire       [34:0]   _zz_io_slaves_1_aw_payload_addr;
  wire       [35:0]   _zz_io_slaves_1_w_payload_data;
  wire       [34:0]   _zz_io_slaves_1_ar_payload_addr;
  wire       [34:0]   _zz_io_slaves_2_aw_payload_addr;
  wire       [35:0]   _zz_io_slaves_2_w_payload_data;
  wire       [34:0]   _zz_io_slaves_2_ar_payload_addr;
  wire       [34:0]   _zz_io_slaves_3_aw_payload_addr;
  wire       [35:0]   _zz_io_slaves_3_w_payload_data;
  wire       [34:0]   _zz_io_slaves_3_ar_payload_addr;
  wire       [34:0]   _zz_io_axi_aw_payload_addr;
  wire       [35:0]   _zz_io_axi_w_payload_data;
  wire       [34:0]   _zz_io_axi_ar_payload_addr;
  wire                when_Axi4LiteCrossbar_l217;
  reg        [1:0]    _zz_when_Axi4LiteCrossbar_l229;
  reg        [3:0]    _zz_when_Axi4LiteCrossbar_l229_1;
  reg        [3:0]    _zz_when_Axi4LiteCrossbar_l229_2;
  wire       [1:0]    _zz_when_Axi4LiteCrossbar_l152;
  wire       [1:0]    _zz_when_Axi4LiteCrossbar_l152_1;
  reg        [0:0]    _zz_wrGranted_0;
  wire                when_Axi4LiteCrossbar_l152;
  wire                when_Axi4LiteCrossbar_l152_1;
  wire                when_Axi4LiteCrossbar_l229;
  wire                when_Axi4LiteCrossbar_l233;
  wire                when_Axi4LiteCrossbar_l233_1;
  wire                io_slaves_0_aw_fire;
  wire                when_Axi4LiteCrossbar_l285;
  wire                when_Axi4LiteCrossbar_l285_1;
  wire                io_slaves_0_b_fire;
  wire                when_Axi4LiteCrossbar_l217_1;
  reg        [1:0]    _zz_when_Axi4LiteCrossbar_l229_3;
  reg        [3:0]    _zz_when_Axi4LiteCrossbar_l229_4;
  reg        [3:0]    _zz_when_Axi4LiteCrossbar_l229_5;
  wire       [1:0]    _zz_when_Axi4LiteCrossbar_l152_2;
  wire       [1:0]    _zz_when_Axi4LiteCrossbar_l152_3;
  reg        [0:0]    _zz_wrGranted_1;
  wire                when_Axi4LiteCrossbar_l152_2;
  wire                when_Axi4LiteCrossbar_l152_3;
  wire                when_Axi4LiteCrossbar_l229_1;
  wire                when_Axi4LiteCrossbar_l233_2;
  wire                when_Axi4LiteCrossbar_l233_3;
  wire                io_slaves_1_aw_fire;
  wire                when_Axi4LiteCrossbar_l285_2;
  wire                when_Axi4LiteCrossbar_l285_3;
  wire                io_slaves_1_b_fire;
  wire                when_Axi4LiteCrossbar_l217_2;
  reg        [1:0]    _zz_when_Axi4LiteCrossbar_l229_6;
  reg        [3:0]    _zz_when_Axi4LiteCrossbar_l229_7;
  reg        [3:0]    _zz_when_Axi4LiteCrossbar_l229_8;
  wire       [1:0]    _zz_when_Axi4LiteCrossbar_l152_4;
  wire       [1:0]    _zz_when_Axi4LiteCrossbar_l152_5;
  reg        [0:0]    _zz_wrGranted_2;
  wire                when_Axi4LiteCrossbar_l152_4;
  wire                when_Axi4LiteCrossbar_l152_5;
  wire                when_Axi4LiteCrossbar_l229_2;
  wire                when_Axi4LiteCrossbar_l233_4;
  wire                when_Axi4LiteCrossbar_l233_5;
  wire                io_slaves_2_aw_fire;
  wire                when_Axi4LiteCrossbar_l285_4;
  wire                when_Axi4LiteCrossbar_l285_5;
  wire                io_slaves_2_b_fire;
  wire                when_Axi4LiteCrossbar_l217_3;
  reg        [1:0]    _zz_when_Axi4LiteCrossbar_l229_9;
  reg        [3:0]    _zz_when_Axi4LiteCrossbar_l229_10;
  reg        [3:0]    _zz_when_Axi4LiteCrossbar_l229_11;
  wire       [1:0]    _zz_when_Axi4LiteCrossbar_l152_6;
  wire       [1:0]    _zz_when_Axi4LiteCrossbar_l152_7;
  reg        [0:0]    _zz_wrGranted_3;
  wire                when_Axi4LiteCrossbar_l152_6;
  wire                when_Axi4LiteCrossbar_l152_7;
  wire                when_Axi4LiteCrossbar_l229_3;
  wire                when_Axi4LiteCrossbar_l233_6;
  wire                when_Axi4LiteCrossbar_l233_7;
  wire                io_slaves_3_aw_fire;
  wire                when_Axi4LiteCrossbar_l285_6;
  wire                when_Axi4LiteCrossbar_l285_7;
  wire                io_slaves_3_b_fire;
  wire                when_Axi4LiteCrossbar_l217_4;
  reg        [1:0]    _zz_when_Axi4LiteCrossbar_l229_12;
  reg        [3:0]    _zz_when_Axi4LiteCrossbar_l229_13;
  reg        [3:0]    _zz_when_Axi4LiteCrossbar_l229_14;
  wire       [1:0]    _zz_when_Axi4LiteCrossbar_l152_8;
  wire       [1:0]    _zz_when_Axi4LiteCrossbar_l152_9;
  reg        [0:0]    _zz_wrGranted_4;
  wire                when_Axi4LiteCrossbar_l152_8;
  wire                when_Axi4LiteCrossbar_l152_9;
  wire                when_Axi4LiteCrossbar_l229_4;
  wire                when_Axi4LiteCrossbar_l233_8;
  wire                when_Axi4LiteCrossbar_l233_9;
  wire                decErr_io_axi_aw_fire;
  wire                when_Axi4LiteCrossbar_l285_8;
  wire                when_Axi4LiteCrossbar_l285_9;
  wire                decErr_io_axi_b_fire;
  wire                when_Axi4LiteCrossbar_l306;
  reg        [1:0]    _zz_when_Axi4LiteCrossbar_l317;
  reg        [3:0]    _zz_when_Axi4LiteCrossbar_l317_1;
  reg        [3:0]    _zz_when_Axi4LiteCrossbar_l317_2;
  wire       [1:0]    _zz_when_Axi4LiteCrossbar_l152_10;
  wire       [1:0]    _zz_when_Axi4LiteCrossbar_l152_11;
  reg        [0:0]    _zz_rdGranted_0;
  wire                when_Axi4LiteCrossbar_l152_10;
  wire                when_Axi4LiteCrossbar_l152_11;
  wire                when_Axi4LiteCrossbar_l317;
  wire                when_Axi4LiteCrossbar_l320;
  wire                when_Axi4LiteCrossbar_l320_1;
  wire                io_slaves_0_ar_fire;
  wire                when_Axi4LiteCrossbar_l363;
  wire                when_Axi4LiteCrossbar_l363_1;
  wire                io_slaves_0_r_fire;
  wire                when_Axi4LiteCrossbar_l306_1;
  reg        [1:0]    _zz_when_Axi4LiteCrossbar_l317_3;
  reg        [3:0]    _zz_when_Axi4LiteCrossbar_l317_4;
  reg        [3:0]    _zz_when_Axi4LiteCrossbar_l317_5;
  wire       [1:0]    _zz_when_Axi4LiteCrossbar_l152_12;
  wire       [1:0]    _zz_when_Axi4LiteCrossbar_l152_13;
  reg        [0:0]    _zz_rdGranted_1;
  wire                when_Axi4LiteCrossbar_l152_12;
  wire                when_Axi4LiteCrossbar_l152_13;
  wire                when_Axi4LiteCrossbar_l317_1;
  wire                when_Axi4LiteCrossbar_l320_2;
  wire                when_Axi4LiteCrossbar_l320_3;
  wire                io_slaves_1_ar_fire;
  wire                when_Axi4LiteCrossbar_l363_2;
  wire                when_Axi4LiteCrossbar_l363_3;
  wire                io_slaves_1_r_fire;
  wire                when_Axi4LiteCrossbar_l306_2;
  reg        [1:0]    _zz_when_Axi4LiteCrossbar_l317_6;
  reg        [3:0]    _zz_when_Axi4LiteCrossbar_l317_7;
  reg        [3:0]    _zz_when_Axi4LiteCrossbar_l317_8;
  wire       [1:0]    _zz_when_Axi4LiteCrossbar_l152_14;
  wire       [1:0]    _zz_when_Axi4LiteCrossbar_l152_15;
  reg        [0:0]    _zz_rdGranted_2;
  wire                when_Axi4LiteCrossbar_l152_14;
  wire                when_Axi4LiteCrossbar_l152_15;
  wire                when_Axi4LiteCrossbar_l317_2;
  wire                when_Axi4LiteCrossbar_l320_4;
  wire                when_Axi4LiteCrossbar_l320_5;
  wire                io_slaves_2_ar_fire;
  wire                when_Axi4LiteCrossbar_l363_4;
  wire                when_Axi4LiteCrossbar_l363_5;
  wire                io_slaves_2_r_fire;
  wire                when_Axi4LiteCrossbar_l306_3;
  reg        [1:0]    _zz_when_Axi4LiteCrossbar_l317_9;
  reg        [3:0]    _zz_when_Axi4LiteCrossbar_l317_10;
  reg        [3:0]    _zz_when_Axi4LiteCrossbar_l317_11;
  wire       [1:0]    _zz_when_Axi4LiteCrossbar_l152_16;
  wire       [1:0]    _zz_when_Axi4LiteCrossbar_l152_17;
  reg        [0:0]    _zz_rdGranted_3;
  wire                when_Axi4LiteCrossbar_l152_16;
  wire                when_Axi4LiteCrossbar_l152_17;
  wire                when_Axi4LiteCrossbar_l317_3;
  wire                when_Axi4LiteCrossbar_l320_6;
  wire                when_Axi4LiteCrossbar_l320_7;
  wire                io_slaves_3_ar_fire;
  wire                when_Axi4LiteCrossbar_l363_6;
  wire                when_Axi4LiteCrossbar_l363_7;
  wire                io_slaves_3_r_fire;
  wire                when_Axi4LiteCrossbar_l306_4;
  reg        [1:0]    _zz_when_Axi4LiteCrossbar_l317_12;
  reg        [3:0]    _zz_when_Axi4LiteCrossbar_l317_13;
  reg        [3:0]    _zz_when_Axi4LiteCrossbar_l317_14;
  wire       [1:0]    _zz_when_Axi4LiteCrossbar_l152_18;
  wire       [1:0]    _zz_when_Axi4LiteCrossbar_l152_19;
  reg        [0:0]    _zz_rdGranted_4;
  wire                when_Axi4LiteCrossbar_l152_18;
  wire                when_Axi4LiteCrossbar_l152_19;
  wire                when_Axi4LiteCrossbar_l317_4;
  wire                when_Axi4LiteCrossbar_l320_8;
  wire                when_Axi4LiteCrossbar_l320_9;
  wire                decErr_io_axi_ar_fire;
  wire                when_Axi4LiteCrossbar_l363_8;
  wire                when_Axi4LiteCrossbar_l363_9;
  wire                decErr_io_axi_r_fire;

  assign _zz_io_masters_0_b_payload_resp = 2'b00;
  assign _zz_io_masters_1_b_payload_resp = 2'b00;
  assign _zz__zz_when_Axi4LiteCrossbar_l229 = {(! (|_zz_when_Axi4LiteCrossbar_l229_1)),_zz_when_Axi4LiteCrossbar_l229_1};
  assign _zz__zz_when_Axi4LiteCrossbar_l229_1 = {(! (|_zz_when_Axi4LiteCrossbar_l229_2)),_zz_when_Axi4LiteCrossbar_l229_2};
  assign _zz__zz_when_Axi4LiteCrossbar_l152_1 = (_zz_when_Axi4LiteCrossbar_l152 - 2'b01);
  assign _zz__zz_when_Axi4LiteCrossbar_l229_3 = {(! (|_zz_when_Axi4LiteCrossbar_l229_4)),_zz_when_Axi4LiteCrossbar_l229_4};
  assign _zz__zz_when_Axi4LiteCrossbar_l229_3_1 = {(! (|_zz_when_Axi4LiteCrossbar_l229_5)),_zz_when_Axi4LiteCrossbar_l229_5};
  assign _zz__zz_when_Axi4LiteCrossbar_l152_3 = (_zz_when_Axi4LiteCrossbar_l152_2 - 2'b01);
  assign _zz__zz_when_Axi4LiteCrossbar_l229_6 = {(! (|_zz_when_Axi4LiteCrossbar_l229_7)),_zz_when_Axi4LiteCrossbar_l229_7};
  assign _zz__zz_when_Axi4LiteCrossbar_l229_6_1 = {(! (|_zz_when_Axi4LiteCrossbar_l229_8)),_zz_when_Axi4LiteCrossbar_l229_8};
  assign _zz__zz_when_Axi4LiteCrossbar_l152_5 = (_zz_when_Axi4LiteCrossbar_l152_4 - 2'b01);
  assign _zz__zz_when_Axi4LiteCrossbar_l229_9 = {(! (|_zz_when_Axi4LiteCrossbar_l229_10)),_zz_when_Axi4LiteCrossbar_l229_10};
  assign _zz__zz_when_Axi4LiteCrossbar_l229_9_1 = {(! (|_zz_when_Axi4LiteCrossbar_l229_11)),_zz_when_Axi4LiteCrossbar_l229_11};
  assign _zz__zz_when_Axi4LiteCrossbar_l152_7 = (_zz_when_Axi4LiteCrossbar_l152_6 - 2'b01);
  assign _zz__zz_when_Axi4LiteCrossbar_l229_12 = {(! (|_zz_when_Axi4LiteCrossbar_l229_13)),_zz_when_Axi4LiteCrossbar_l229_13};
  assign _zz__zz_when_Axi4LiteCrossbar_l229_12_1 = {(! (|_zz_when_Axi4LiteCrossbar_l229_14)),_zz_when_Axi4LiteCrossbar_l229_14};
  assign _zz__zz_when_Axi4LiteCrossbar_l152_9 = (_zz_when_Axi4LiteCrossbar_l152_8 - 2'b01);
  assign _zz__zz_when_Axi4LiteCrossbar_l317 = {(! (|_zz_when_Axi4LiteCrossbar_l317_1)),_zz_when_Axi4LiteCrossbar_l317_1};
  assign _zz__zz_when_Axi4LiteCrossbar_l317_1 = {(! (|_zz_when_Axi4LiteCrossbar_l317_2)),_zz_when_Axi4LiteCrossbar_l317_2};
  assign _zz__zz_when_Axi4LiteCrossbar_l152_11 = (_zz_when_Axi4LiteCrossbar_l152_10 - 2'b01);
  assign _zz__zz_when_Axi4LiteCrossbar_l317_3 = {(! (|_zz_when_Axi4LiteCrossbar_l317_4)),_zz_when_Axi4LiteCrossbar_l317_4};
  assign _zz__zz_when_Axi4LiteCrossbar_l317_3_1 = {(! (|_zz_when_Axi4LiteCrossbar_l317_5)),_zz_when_Axi4LiteCrossbar_l317_5};
  assign _zz__zz_when_Axi4LiteCrossbar_l152_13 = (_zz_when_Axi4LiteCrossbar_l152_12 - 2'b01);
  assign _zz__zz_when_Axi4LiteCrossbar_l317_6 = {(! (|_zz_when_Axi4LiteCrossbar_l317_7)),_zz_when_Axi4LiteCrossbar_l317_7};
  assign _zz__zz_when_Axi4LiteCrossbar_l317_6_1 = {(! (|_zz_when_Axi4LiteCrossbar_l317_8)),_zz_when_Axi4LiteCrossbar_l317_8};
  assign _zz__zz_when_Axi4LiteCrossbar_l152_15 = (_zz_when_Axi4LiteCrossbar_l152_14 - 2'b01);
  assign _zz__zz_when_Axi4LiteCrossbar_l317_9 = {(! (|_zz_when_Axi4LiteCrossbar_l317_10)),_zz_when_Axi4LiteCrossbar_l317_10};
  assign _zz__zz_when_Axi4LiteCrossbar_l317_9_1 = {(! (|_zz_when_Axi4LiteCrossbar_l317_11)),_zz_when_Axi4LiteCrossbar_l317_11};
  assign _zz__zz_when_Axi4LiteCrossbar_l152_17 = (_zz_when_Axi4LiteCrossbar_l152_16 - 2'b01);
  assign _zz__zz_when_Axi4LiteCrossbar_l317_12 = {(! (|_zz_when_Axi4LiteCrossbar_l317_13)),_zz_when_Axi4LiteCrossbar_l317_13};
  assign _zz__zz_when_Axi4LiteCrossbar_l317_12_1 = {(! (|_zz_when_Axi4LiteCrossbar_l317_14)),_zz_when_Axi4LiteCrossbar_l317_14};
  assign _zz__zz_when_Axi4LiteCrossbar_l152_19 = (_zz_when_Axi4LiteCrossbar_l152_18 - 2'b01);
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
          s0_axi_awready = m2_axi_awready;
        end
      end
    end
    if(when_Axi4LiteCrossbar_l217_3) begin
      if(when_Axi4LiteCrossbar_l229_3) begin
        if(when_Axi4LiteCrossbar_l233_6) begin
          s0_axi_awready = m3_axi_awready;
        end
      end
    end
    if(when_Axi4LiteCrossbar_l217_4) begin
      if(when_Axi4LiteCrossbar_l229_4) begin
        if(when_Axi4LiteCrossbar_l233_8) begin
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
          s0_axi_wready = m2_axi_wready;
        end
      end
    end else begin
      if(when_Axi4LiteCrossbar_l285_4) begin
        s0_axi_wready = m2_axi_wready;
      end
    end
    if(when_Axi4LiteCrossbar_l217_3) begin
      if(when_Axi4LiteCrossbar_l229_3) begin
        if(when_Axi4LiteCrossbar_l233_6) begin
          s0_axi_wready = m3_axi_wready;
        end
      end
    end else begin
      if(when_Axi4LiteCrossbar_l285_6) begin
        s0_axi_wready = m3_axi_wready;
      end
    end
    if(when_Axi4LiteCrossbar_l217_4) begin
      if(when_Axi4LiteCrossbar_l229_4) begin
        if(when_Axi4LiteCrossbar_l233_8) begin
          s0_axi_wready = decErr_io_axi_w_ready;
        end
      end
    end else begin
      if(when_Axi4LiteCrossbar_l285_8) begin
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
        s0_axi_bvalid = m2_axi_bvalid;
      end
    end
    if(!when_Axi4LiteCrossbar_l217_3) begin
      if(when_Axi4LiteCrossbar_l285_6) begin
        s0_axi_bvalid = m3_axi_bvalid;
      end
    end
    if(!when_Axi4LiteCrossbar_l217_4) begin
      if(when_Axi4LiteCrossbar_l285_8) begin
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
        s0_axi_bresp = m2_axi_bresp;
      end
    end
    if(!when_Axi4LiteCrossbar_l217_3) begin
      if(when_Axi4LiteCrossbar_l285_6) begin
        s0_axi_bresp = m3_axi_bresp;
      end
    end
    if(!when_Axi4LiteCrossbar_l217_4) begin
      if(when_Axi4LiteCrossbar_l285_8) begin
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
          s0_axi_arready = m2_axi_arready;
        end
      end
    end
    if(when_Axi4LiteCrossbar_l306_3) begin
      if(when_Axi4LiteCrossbar_l317_3) begin
        if(when_Axi4LiteCrossbar_l320_6) begin
          s0_axi_arready = m3_axi_arready;
        end
      end
    end
    if(when_Axi4LiteCrossbar_l306_4) begin
      if(when_Axi4LiteCrossbar_l317_4) begin
        if(when_Axi4LiteCrossbar_l320_8) begin
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
        s0_axi_rvalid = m2_axi_rvalid;
      end
    end
    if(!when_Axi4LiteCrossbar_l306_3) begin
      if(when_Axi4LiteCrossbar_l363_6) begin
        s0_axi_rvalid = m3_axi_rvalid;
      end
    end
    if(!when_Axi4LiteCrossbar_l306_4) begin
      if(when_Axi4LiteCrossbar_l363_8) begin
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
        s0_axi_rdata = m2_axi_rdata;
      end
    end
    if(!when_Axi4LiteCrossbar_l306_3) begin
      if(when_Axi4LiteCrossbar_l363_6) begin
        s0_axi_rdata = m3_axi_rdata;
      end
    end
    if(!when_Axi4LiteCrossbar_l306_4) begin
      if(when_Axi4LiteCrossbar_l363_8) begin
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
        s0_axi_rresp = m2_axi_rresp;
      end
    end
    if(!when_Axi4LiteCrossbar_l306_3) begin
      if(when_Axi4LiteCrossbar_l363_6) begin
        s0_axi_rresp = m3_axi_rresp;
      end
    end
    if(!when_Axi4LiteCrossbar_l306_4) begin
      if(when_Axi4LiteCrossbar_l363_8) begin
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
          s1_axi_awready = m2_axi_awready;
        end
      end
    end
    if(when_Axi4LiteCrossbar_l217_3) begin
      if(when_Axi4LiteCrossbar_l229_3) begin
        if(when_Axi4LiteCrossbar_l233_7) begin
          s1_axi_awready = m3_axi_awready;
        end
      end
    end
    if(when_Axi4LiteCrossbar_l217_4) begin
      if(when_Axi4LiteCrossbar_l229_4) begin
        if(when_Axi4LiteCrossbar_l233_9) begin
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
          s1_axi_wready = m2_axi_wready;
        end
      end
    end else begin
      if(when_Axi4LiteCrossbar_l285_5) begin
        s1_axi_wready = m2_axi_wready;
      end
    end
    if(when_Axi4LiteCrossbar_l217_3) begin
      if(when_Axi4LiteCrossbar_l229_3) begin
        if(when_Axi4LiteCrossbar_l233_7) begin
          s1_axi_wready = m3_axi_wready;
        end
      end
    end else begin
      if(when_Axi4LiteCrossbar_l285_7) begin
        s1_axi_wready = m3_axi_wready;
      end
    end
    if(when_Axi4LiteCrossbar_l217_4) begin
      if(when_Axi4LiteCrossbar_l229_4) begin
        if(when_Axi4LiteCrossbar_l233_9) begin
          s1_axi_wready = decErr_io_axi_w_ready;
        end
      end
    end else begin
      if(when_Axi4LiteCrossbar_l285_9) begin
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
        s1_axi_bvalid = m2_axi_bvalid;
      end
    end
    if(!when_Axi4LiteCrossbar_l217_3) begin
      if(when_Axi4LiteCrossbar_l285_7) begin
        s1_axi_bvalid = m3_axi_bvalid;
      end
    end
    if(!when_Axi4LiteCrossbar_l217_4) begin
      if(when_Axi4LiteCrossbar_l285_9) begin
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
        s1_axi_bresp = m2_axi_bresp;
      end
    end
    if(!when_Axi4LiteCrossbar_l217_3) begin
      if(when_Axi4LiteCrossbar_l285_7) begin
        s1_axi_bresp = m3_axi_bresp;
      end
    end
    if(!when_Axi4LiteCrossbar_l217_4) begin
      if(when_Axi4LiteCrossbar_l285_9) begin
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
          s1_axi_arready = m2_axi_arready;
        end
      end
    end
    if(when_Axi4LiteCrossbar_l306_3) begin
      if(when_Axi4LiteCrossbar_l317_3) begin
        if(when_Axi4LiteCrossbar_l320_7) begin
          s1_axi_arready = m3_axi_arready;
        end
      end
    end
    if(when_Axi4LiteCrossbar_l306_4) begin
      if(when_Axi4LiteCrossbar_l317_4) begin
        if(when_Axi4LiteCrossbar_l320_9) begin
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
        s1_axi_rvalid = m2_axi_rvalid;
      end
    end
    if(!when_Axi4LiteCrossbar_l306_3) begin
      if(when_Axi4LiteCrossbar_l363_7) begin
        s1_axi_rvalid = m3_axi_rvalid;
      end
    end
    if(!when_Axi4LiteCrossbar_l306_4) begin
      if(when_Axi4LiteCrossbar_l363_9) begin
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
        s1_axi_rdata = m2_axi_rdata;
      end
    end
    if(!when_Axi4LiteCrossbar_l306_3) begin
      if(when_Axi4LiteCrossbar_l363_7) begin
        s1_axi_rdata = m3_axi_rdata;
      end
    end
    if(!when_Axi4LiteCrossbar_l306_4) begin
      if(when_Axi4LiteCrossbar_l363_9) begin
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
        s1_axi_rresp = m2_axi_rresp;
      end
    end
    if(!when_Axi4LiteCrossbar_l306_3) begin
      if(when_Axi4LiteCrossbar_l363_7) begin
        s1_axi_rresp = m3_axi_rresp;
      end
    end
    if(!when_Axi4LiteCrossbar_l306_4) begin
      if(when_Axi4LiteCrossbar_l363_9) begin
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
    m2_axi_awvalid = 1'b0;
    if(when_Axi4LiteCrossbar_l217_2) begin
      if(when_Axi4LiteCrossbar_l229_2) begin
        m2_axi_awvalid = 1'b1;
      end
    end
  end

  assign _zz_io_slaves_2_aw_payload_addr = 35'h0;
  always @(*) begin
    m2_axi_awaddr = _zz_io_slaves_2_aw_payload_addr[31 : 0];
    if(when_Axi4LiteCrossbar_l217_2) begin
      if(when_Axi4LiteCrossbar_l229_2) begin
        if(when_Axi4LiteCrossbar_l233_4) begin
          m2_axi_awaddr = s0_axi_awaddr;
        end
        if(when_Axi4LiteCrossbar_l233_5) begin
          m2_axi_awaddr = s1_axi_awaddr;
        end
      end
    end
  end

  always @(*) begin
    m2_axi_awprot = _zz_io_slaves_2_aw_payload_addr[34 : 32];
    if(when_Axi4LiteCrossbar_l217_2) begin
      if(when_Axi4LiteCrossbar_l229_2) begin
        if(when_Axi4LiteCrossbar_l233_4) begin
          m2_axi_awprot = s0_axi_awprot;
        end
        if(when_Axi4LiteCrossbar_l233_5) begin
          m2_axi_awprot = s1_axi_awprot;
        end
      end
    end
  end

  always @(*) begin
    m2_axi_wvalid = 1'b0;
    if(when_Axi4LiteCrossbar_l217_2) begin
      if(when_Axi4LiteCrossbar_l229_2) begin
        if(when_Axi4LiteCrossbar_l233_4) begin
          m2_axi_wvalid = s0_axi_wvalid;
        end
        if(when_Axi4LiteCrossbar_l233_5) begin
          m2_axi_wvalid = s1_axi_wvalid;
        end
      end
    end else begin
      if(when_Axi4LiteCrossbar_l285_4) begin
        m2_axi_wvalid = s0_axi_wvalid;
      end
      if(when_Axi4LiteCrossbar_l285_5) begin
        m2_axi_wvalid = s1_axi_wvalid;
      end
    end
  end

  assign _zz_io_slaves_2_w_payload_data = 36'h0;
  always @(*) begin
    m2_axi_wdata = _zz_io_slaves_2_w_payload_data[31 : 0];
    if(when_Axi4LiteCrossbar_l217_2) begin
      if(when_Axi4LiteCrossbar_l229_2) begin
        if(when_Axi4LiteCrossbar_l233_4) begin
          m2_axi_wdata = s0_axi_wdata;
        end
        if(when_Axi4LiteCrossbar_l233_5) begin
          m2_axi_wdata = s1_axi_wdata;
        end
      end
    end else begin
      if(when_Axi4LiteCrossbar_l285_4) begin
        m2_axi_wdata = s0_axi_wdata;
      end
      if(when_Axi4LiteCrossbar_l285_5) begin
        m2_axi_wdata = s1_axi_wdata;
      end
    end
  end

  always @(*) begin
    m2_axi_wstrb = _zz_io_slaves_2_w_payload_data[35 : 32];
    if(when_Axi4LiteCrossbar_l217_2) begin
      if(when_Axi4LiteCrossbar_l229_2) begin
        if(when_Axi4LiteCrossbar_l233_4) begin
          m2_axi_wstrb = s0_axi_wstrb;
        end
        if(when_Axi4LiteCrossbar_l233_5) begin
          m2_axi_wstrb = s1_axi_wstrb;
        end
      end
    end else begin
      if(when_Axi4LiteCrossbar_l285_4) begin
        m2_axi_wstrb = s0_axi_wstrb;
      end
      if(when_Axi4LiteCrossbar_l285_5) begin
        m2_axi_wstrb = s1_axi_wstrb;
      end
    end
  end

  always @(*) begin
    m2_axi_bready = 1'b0;
    if(!when_Axi4LiteCrossbar_l217_2) begin
      if(when_Axi4LiteCrossbar_l285_4) begin
        m2_axi_bready = s0_axi_bready;
      end
      if(when_Axi4LiteCrossbar_l285_5) begin
        m2_axi_bready = s1_axi_bready;
      end
    end
  end

  always @(*) begin
    m2_axi_arvalid = 1'b0;
    if(when_Axi4LiteCrossbar_l306_2) begin
      if(when_Axi4LiteCrossbar_l317_2) begin
        m2_axi_arvalid = 1'b1;
      end
    end
  end

  assign _zz_io_slaves_2_ar_payload_addr = 35'h0;
  always @(*) begin
    m2_axi_araddr = _zz_io_slaves_2_ar_payload_addr[31 : 0];
    if(when_Axi4LiteCrossbar_l306_2) begin
      if(when_Axi4LiteCrossbar_l317_2) begin
        if(when_Axi4LiteCrossbar_l320_4) begin
          m2_axi_araddr = s0_axi_araddr;
        end
        if(when_Axi4LiteCrossbar_l320_5) begin
          m2_axi_araddr = s1_axi_araddr;
        end
      end
    end
  end

  always @(*) begin
    m2_axi_arprot = _zz_io_slaves_2_ar_payload_addr[34 : 32];
    if(when_Axi4LiteCrossbar_l306_2) begin
      if(when_Axi4LiteCrossbar_l317_2) begin
        if(when_Axi4LiteCrossbar_l320_4) begin
          m2_axi_arprot = s0_axi_arprot;
        end
        if(when_Axi4LiteCrossbar_l320_5) begin
          m2_axi_arprot = s1_axi_arprot;
        end
      end
    end
  end

  always @(*) begin
    m2_axi_rready = 1'b0;
    if(!when_Axi4LiteCrossbar_l306_2) begin
      if(when_Axi4LiteCrossbar_l363_4) begin
        m2_axi_rready = s0_axi_rready;
      end
      if(when_Axi4LiteCrossbar_l363_5) begin
        m2_axi_rready = s1_axi_rready;
      end
    end
  end

  always @(*) begin
    m3_axi_awvalid = 1'b0;
    if(when_Axi4LiteCrossbar_l217_3) begin
      if(when_Axi4LiteCrossbar_l229_3) begin
        m3_axi_awvalid = 1'b1;
      end
    end
  end

  assign _zz_io_slaves_3_aw_payload_addr = 35'h0;
  always @(*) begin
    m3_axi_awaddr = _zz_io_slaves_3_aw_payload_addr[31 : 0];
    if(when_Axi4LiteCrossbar_l217_3) begin
      if(when_Axi4LiteCrossbar_l229_3) begin
        if(when_Axi4LiteCrossbar_l233_6) begin
          m3_axi_awaddr = s0_axi_awaddr;
        end
        if(when_Axi4LiteCrossbar_l233_7) begin
          m3_axi_awaddr = s1_axi_awaddr;
        end
      end
    end
  end

  always @(*) begin
    m3_axi_awprot = _zz_io_slaves_3_aw_payload_addr[34 : 32];
    if(when_Axi4LiteCrossbar_l217_3) begin
      if(when_Axi4LiteCrossbar_l229_3) begin
        if(when_Axi4LiteCrossbar_l233_6) begin
          m3_axi_awprot = s0_axi_awprot;
        end
        if(when_Axi4LiteCrossbar_l233_7) begin
          m3_axi_awprot = s1_axi_awprot;
        end
      end
    end
  end

  always @(*) begin
    m3_axi_wvalid = 1'b0;
    if(when_Axi4LiteCrossbar_l217_3) begin
      if(when_Axi4LiteCrossbar_l229_3) begin
        if(when_Axi4LiteCrossbar_l233_6) begin
          m3_axi_wvalid = s0_axi_wvalid;
        end
        if(when_Axi4LiteCrossbar_l233_7) begin
          m3_axi_wvalid = s1_axi_wvalid;
        end
      end
    end else begin
      if(when_Axi4LiteCrossbar_l285_6) begin
        m3_axi_wvalid = s0_axi_wvalid;
      end
      if(when_Axi4LiteCrossbar_l285_7) begin
        m3_axi_wvalid = s1_axi_wvalid;
      end
    end
  end

  assign _zz_io_slaves_3_w_payload_data = 36'h0;
  always @(*) begin
    m3_axi_wdata = _zz_io_slaves_3_w_payload_data[31 : 0];
    if(when_Axi4LiteCrossbar_l217_3) begin
      if(when_Axi4LiteCrossbar_l229_3) begin
        if(when_Axi4LiteCrossbar_l233_6) begin
          m3_axi_wdata = s0_axi_wdata;
        end
        if(when_Axi4LiteCrossbar_l233_7) begin
          m3_axi_wdata = s1_axi_wdata;
        end
      end
    end else begin
      if(when_Axi4LiteCrossbar_l285_6) begin
        m3_axi_wdata = s0_axi_wdata;
      end
      if(when_Axi4LiteCrossbar_l285_7) begin
        m3_axi_wdata = s1_axi_wdata;
      end
    end
  end

  always @(*) begin
    m3_axi_wstrb = _zz_io_slaves_3_w_payload_data[35 : 32];
    if(when_Axi4LiteCrossbar_l217_3) begin
      if(when_Axi4LiteCrossbar_l229_3) begin
        if(when_Axi4LiteCrossbar_l233_6) begin
          m3_axi_wstrb = s0_axi_wstrb;
        end
        if(when_Axi4LiteCrossbar_l233_7) begin
          m3_axi_wstrb = s1_axi_wstrb;
        end
      end
    end else begin
      if(when_Axi4LiteCrossbar_l285_6) begin
        m3_axi_wstrb = s0_axi_wstrb;
      end
      if(when_Axi4LiteCrossbar_l285_7) begin
        m3_axi_wstrb = s1_axi_wstrb;
      end
    end
  end

  always @(*) begin
    m3_axi_bready = 1'b0;
    if(!when_Axi4LiteCrossbar_l217_3) begin
      if(when_Axi4LiteCrossbar_l285_6) begin
        m3_axi_bready = s0_axi_bready;
      end
      if(when_Axi4LiteCrossbar_l285_7) begin
        m3_axi_bready = s1_axi_bready;
      end
    end
  end

  always @(*) begin
    m3_axi_arvalid = 1'b0;
    if(when_Axi4LiteCrossbar_l306_3) begin
      if(when_Axi4LiteCrossbar_l317_3) begin
        m3_axi_arvalid = 1'b1;
      end
    end
  end

  assign _zz_io_slaves_3_ar_payload_addr = 35'h0;
  always @(*) begin
    m3_axi_araddr = _zz_io_slaves_3_ar_payload_addr[31 : 0];
    if(when_Axi4LiteCrossbar_l306_3) begin
      if(when_Axi4LiteCrossbar_l317_3) begin
        if(when_Axi4LiteCrossbar_l320_6) begin
          m3_axi_araddr = s0_axi_araddr;
        end
        if(when_Axi4LiteCrossbar_l320_7) begin
          m3_axi_araddr = s1_axi_araddr;
        end
      end
    end
  end

  always @(*) begin
    m3_axi_arprot = _zz_io_slaves_3_ar_payload_addr[34 : 32];
    if(when_Axi4LiteCrossbar_l306_3) begin
      if(when_Axi4LiteCrossbar_l317_3) begin
        if(when_Axi4LiteCrossbar_l320_6) begin
          m3_axi_arprot = s0_axi_arprot;
        end
        if(when_Axi4LiteCrossbar_l320_7) begin
          m3_axi_arprot = s1_axi_arprot;
        end
      end
    end
  end

  always @(*) begin
    m3_axi_rready = 1'b0;
    if(!when_Axi4LiteCrossbar_l306_3) begin
      if(when_Axi4LiteCrossbar_l363_6) begin
        m3_axi_rready = s0_axi_rready;
      end
      if(when_Axi4LiteCrossbar_l363_7) begin
        m3_axi_rready = s1_axi_rready;
      end
    end
  end

  always @(*) begin
    decErr_io_axi_aw_valid = 1'b0;
    if(when_Axi4LiteCrossbar_l217_4) begin
      if(when_Axi4LiteCrossbar_l229_4) begin
        decErr_io_axi_aw_valid = 1'b1;
      end
    end
  end

  assign _zz_io_axi_aw_payload_addr = 35'h0;
  always @(*) begin
    decErr_io_axi_aw_payload_addr = _zz_io_axi_aw_payload_addr[31 : 0];
    if(when_Axi4LiteCrossbar_l217_4) begin
      if(when_Axi4LiteCrossbar_l229_4) begin
        if(when_Axi4LiteCrossbar_l233_8) begin
          decErr_io_axi_aw_payload_addr = s0_axi_awaddr;
        end
        if(when_Axi4LiteCrossbar_l233_9) begin
          decErr_io_axi_aw_payload_addr = s1_axi_awaddr;
        end
      end
    end
  end

  always @(*) begin
    decErr_io_axi_aw_payload_prot = _zz_io_axi_aw_payload_addr[34 : 32];
    if(when_Axi4LiteCrossbar_l217_4) begin
      if(when_Axi4LiteCrossbar_l229_4) begin
        if(when_Axi4LiteCrossbar_l233_8) begin
          decErr_io_axi_aw_payload_prot = s0_axi_awprot;
        end
        if(when_Axi4LiteCrossbar_l233_9) begin
          decErr_io_axi_aw_payload_prot = s1_axi_awprot;
        end
      end
    end
  end

  always @(*) begin
    decErr_io_axi_w_valid = 1'b0;
    if(when_Axi4LiteCrossbar_l217_4) begin
      if(when_Axi4LiteCrossbar_l229_4) begin
        if(when_Axi4LiteCrossbar_l233_8) begin
          decErr_io_axi_w_valid = s0_axi_wvalid;
        end
        if(when_Axi4LiteCrossbar_l233_9) begin
          decErr_io_axi_w_valid = s1_axi_wvalid;
        end
      end
    end else begin
      if(when_Axi4LiteCrossbar_l285_8) begin
        decErr_io_axi_w_valid = s0_axi_wvalid;
      end
      if(when_Axi4LiteCrossbar_l285_9) begin
        decErr_io_axi_w_valid = s1_axi_wvalid;
      end
    end
  end

  assign _zz_io_axi_w_payload_data = 36'h0;
  always @(*) begin
    decErr_io_axi_w_payload_data = _zz_io_axi_w_payload_data[31 : 0];
    if(when_Axi4LiteCrossbar_l217_4) begin
      if(when_Axi4LiteCrossbar_l229_4) begin
        if(when_Axi4LiteCrossbar_l233_8) begin
          decErr_io_axi_w_payload_data = s0_axi_wdata;
        end
        if(when_Axi4LiteCrossbar_l233_9) begin
          decErr_io_axi_w_payload_data = s1_axi_wdata;
        end
      end
    end else begin
      if(when_Axi4LiteCrossbar_l285_8) begin
        decErr_io_axi_w_payload_data = s0_axi_wdata;
      end
      if(when_Axi4LiteCrossbar_l285_9) begin
        decErr_io_axi_w_payload_data = s1_axi_wdata;
      end
    end
  end

  always @(*) begin
    decErr_io_axi_w_payload_strb = _zz_io_axi_w_payload_data[35 : 32];
    if(when_Axi4LiteCrossbar_l217_4) begin
      if(when_Axi4LiteCrossbar_l229_4) begin
        if(when_Axi4LiteCrossbar_l233_8) begin
          decErr_io_axi_w_payload_strb = s0_axi_wstrb;
        end
        if(when_Axi4LiteCrossbar_l233_9) begin
          decErr_io_axi_w_payload_strb = s1_axi_wstrb;
        end
      end
    end else begin
      if(when_Axi4LiteCrossbar_l285_8) begin
        decErr_io_axi_w_payload_strb = s0_axi_wstrb;
      end
      if(when_Axi4LiteCrossbar_l285_9) begin
        decErr_io_axi_w_payload_strb = s1_axi_wstrb;
      end
    end
  end

  always @(*) begin
    decErr_io_axi_b_ready = 1'b0;
    if(!when_Axi4LiteCrossbar_l217_4) begin
      if(when_Axi4LiteCrossbar_l285_8) begin
        decErr_io_axi_b_ready = s0_axi_bready;
      end
      if(when_Axi4LiteCrossbar_l285_9) begin
        decErr_io_axi_b_ready = s1_axi_bready;
      end
    end
  end

  always @(*) begin
    decErr_io_axi_ar_valid = 1'b0;
    if(when_Axi4LiteCrossbar_l306_4) begin
      if(when_Axi4LiteCrossbar_l317_4) begin
        decErr_io_axi_ar_valid = 1'b1;
      end
    end
  end

  assign _zz_io_axi_ar_payload_addr = 35'h0;
  always @(*) begin
    decErr_io_axi_ar_payload_addr = _zz_io_axi_ar_payload_addr[31 : 0];
    if(when_Axi4LiteCrossbar_l306_4) begin
      if(when_Axi4LiteCrossbar_l317_4) begin
        if(when_Axi4LiteCrossbar_l320_8) begin
          decErr_io_axi_ar_payload_addr = s0_axi_araddr;
        end
        if(when_Axi4LiteCrossbar_l320_9) begin
          decErr_io_axi_ar_payload_addr = s1_axi_araddr;
        end
      end
    end
  end

  always @(*) begin
    decErr_io_axi_ar_payload_prot = _zz_io_axi_ar_payload_addr[34 : 32];
    if(when_Axi4LiteCrossbar_l306_4) begin
      if(when_Axi4LiteCrossbar_l317_4) begin
        if(when_Axi4LiteCrossbar_l320_8) begin
          decErr_io_axi_ar_payload_prot = s0_axi_arprot;
        end
        if(when_Axi4LiteCrossbar_l320_9) begin
          decErr_io_axi_ar_payload_prot = s1_axi_arprot;
        end
      end
    end
  end

  always @(*) begin
    decErr_io_axi_r_ready = 1'b0;
    if(!when_Axi4LiteCrossbar_l306_4) begin
      if(when_Axi4LiteCrossbar_l363_8) begin
        decErr_io_axi_r_ready = s0_axi_rready;
      end
      if(when_Axi4LiteCrossbar_l363_9) begin
        decErr_io_axi_r_ready = s1_axi_rready;
      end
    end
  end

  assign when_Axi4LiteCrossbar_l217 = (! wrActive_0);
  always @(*) begin
    _zz_when_Axi4LiteCrossbar_l229_1[0] = ((32'h0 <= s0_axi_awaddr) && (s0_axi_awaddr < 32'h00001000));
    _zz_when_Axi4LiteCrossbar_l229_1[1] = ((32'h00010000 <= s0_axi_awaddr) && (s0_axi_awaddr < 32'h00011000));
    _zz_when_Axi4LiteCrossbar_l229_1[2] = ((32'h00020000 <= s0_axi_awaddr) && (s0_axi_awaddr < 32'h00021000));
    _zz_when_Axi4LiteCrossbar_l229_1[3] = ((32'h00030000 <= s0_axi_awaddr) && (s0_axi_awaddr < 32'h00031000));
  end

  always @(*) begin
    _zz_when_Axi4LiteCrossbar_l229[0] = (s0_axi_awvalid && _zz__zz_when_Axi4LiteCrossbar_l229[0]);
    _zz_when_Axi4LiteCrossbar_l229[1] = (s1_axi_awvalid && _zz__zz_when_Axi4LiteCrossbar_l229_1[0]);
  end

  always @(*) begin
    _zz_when_Axi4LiteCrossbar_l229_2[0] = ((32'h0 <= s1_axi_awaddr) && (s1_axi_awaddr < 32'h00001000));
    _zz_when_Axi4LiteCrossbar_l229_2[1] = ((32'h00010000 <= s1_axi_awaddr) && (s1_axi_awaddr < 32'h00011000));
    _zz_when_Axi4LiteCrossbar_l229_2[2] = ((32'h00020000 <= s1_axi_awaddr) && (s1_axi_awaddr < 32'h00021000));
    _zz_when_Axi4LiteCrossbar_l229_2[3] = ((32'h00030000 <= s1_axi_awaddr) && (s1_axi_awaddr < 32'h00031000));
  end

  assign _zz_when_Axi4LiteCrossbar_l152 = _zz_when_Axi4LiteCrossbar_l229;
  assign _zz_when_Axi4LiteCrossbar_l152_1 = (_zz_when_Axi4LiteCrossbar_l152 & (~ _zz__zz_when_Axi4LiteCrossbar_l152_1));
  always @(*) begin
    _zz_wrGranted_0 = 1'b0;
    if(when_Axi4LiteCrossbar_l152) begin
      _zz_wrGranted_0 = 1'b0;
    end
    if(when_Axi4LiteCrossbar_l152_1) begin
      _zz_wrGranted_0 = 1'b1;
    end
  end

  assign when_Axi4LiteCrossbar_l152 = _zz_when_Axi4LiteCrossbar_l152_1[0];
  assign when_Axi4LiteCrossbar_l152_1 = _zz_when_Axi4LiteCrossbar_l152_1[1];
  assign when_Axi4LiteCrossbar_l229 = (|_zz_when_Axi4LiteCrossbar_l229);
  assign when_Axi4LiteCrossbar_l233 = (_zz_wrGranted_0 == 1'b0);
  assign when_Axi4LiteCrossbar_l233_1 = (_zz_wrGranted_0 == 1'b1);
  assign io_slaves_0_aw_fire = (m0_axi_awvalid && m0_axi_awready);
  assign when_Axi4LiteCrossbar_l285 = (wrGranted_0 == 1'b0);
  assign when_Axi4LiteCrossbar_l285_1 = (wrGranted_0 == 1'b1);
  assign io_slaves_0_b_fire = (m0_axi_bvalid && m0_axi_bready);
  assign when_Axi4LiteCrossbar_l217_1 = (! wrActive_1);
  always @(*) begin
    _zz_when_Axi4LiteCrossbar_l229_4[0] = ((32'h0 <= s0_axi_awaddr) && (s0_axi_awaddr < 32'h00001000));
    _zz_when_Axi4LiteCrossbar_l229_4[1] = ((32'h00010000 <= s0_axi_awaddr) && (s0_axi_awaddr < 32'h00011000));
    _zz_when_Axi4LiteCrossbar_l229_4[2] = ((32'h00020000 <= s0_axi_awaddr) && (s0_axi_awaddr < 32'h00021000));
    _zz_when_Axi4LiteCrossbar_l229_4[3] = ((32'h00030000 <= s0_axi_awaddr) && (s0_axi_awaddr < 32'h00031000));
  end

  always @(*) begin
    _zz_when_Axi4LiteCrossbar_l229_3[0] = (s0_axi_awvalid && _zz__zz_when_Axi4LiteCrossbar_l229_3[1]);
    _zz_when_Axi4LiteCrossbar_l229_3[1] = (s1_axi_awvalid && _zz__zz_when_Axi4LiteCrossbar_l229_3_1[1]);
  end

  always @(*) begin
    _zz_when_Axi4LiteCrossbar_l229_5[0] = ((32'h0 <= s1_axi_awaddr) && (s1_axi_awaddr < 32'h00001000));
    _zz_when_Axi4LiteCrossbar_l229_5[1] = ((32'h00010000 <= s1_axi_awaddr) && (s1_axi_awaddr < 32'h00011000));
    _zz_when_Axi4LiteCrossbar_l229_5[2] = ((32'h00020000 <= s1_axi_awaddr) && (s1_axi_awaddr < 32'h00021000));
    _zz_when_Axi4LiteCrossbar_l229_5[3] = ((32'h00030000 <= s1_axi_awaddr) && (s1_axi_awaddr < 32'h00031000));
  end

  assign _zz_when_Axi4LiteCrossbar_l152_2 = _zz_when_Axi4LiteCrossbar_l229_3;
  assign _zz_when_Axi4LiteCrossbar_l152_3 = (_zz_when_Axi4LiteCrossbar_l152_2 & (~ _zz__zz_when_Axi4LiteCrossbar_l152_3));
  always @(*) begin
    _zz_wrGranted_1 = 1'b0;
    if(when_Axi4LiteCrossbar_l152_2) begin
      _zz_wrGranted_1 = 1'b0;
    end
    if(when_Axi4LiteCrossbar_l152_3) begin
      _zz_wrGranted_1 = 1'b1;
    end
  end

  assign when_Axi4LiteCrossbar_l152_2 = _zz_when_Axi4LiteCrossbar_l152_3[0];
  assign when_Axi4LiteCrossbar_l152_3 = _zz_when_Axi4LiteCrossbar_l152_3[1];
  assign when_Axi4LiteCrossbar_l229_1 = (|_zz_when_Axi4LiteCrossbar_l229_3);
  assign when_Axi4LiteCrossbar_l233_2 = (_zz_wrGranted_1 == 1'b0);
  assign when_Axi4LiteCrossbar_l233_3 = (_zz_wrGranted_1 == 1'b1);
  assign io_slaves_1_aw_fire = (m1_axi_awvalid && m1_axi_awready);
  assign when_Axi4LiteCrossbar_l285_2 = (wrGranted_1 == 1'b0);
  assign when_Axi4LiteCrossbar_l285_3 = (wrGranted_1 == 1'b1);
  assign io_slaves_1_b_fire = (m1_axi_bvalid && m1_axi_bready);
  assign when_Axi4LiteCrossbar_l217_2 = (! wrActive_2);
  always @(*) begin
    _zz_when_Axi4LiteCrossbar_l229_7[0] = ((32'h0 <= s0_axi_awaddr) && (s0_axi_awaddr < 32'h00001000));
    _zz_when_Axi4LiteCrossbar_l229_7[1] = ((32'h00010000 <= s0_axi_awaddr) && (s0_axi_awaddr < 32'h00011000));
    _zz_when_Axi4LiteCrossbar_l229_7[2] = ((32'h00020000 <= s0_axi_awaddr) && (s0_axi_awaddr < 32'h00021000));
    _zz_when_Axi4LiteCrossbar_l229_7[3] = ((32'h00030000 <= s0_axi_awaddr) && (s0_axi_awaddr < 32'h00031000));
  end

  always @(*) begin
    _zz_when_Axi4LiteCrossbar_l229_6[0] = (s0_axi_awvalid && _zz__zz_when_Axi4LiteCrossbar_l229_6[2]);
    _zz_when_Axi4LiteCrossbar_l229_6[1] = (s1_axi_awvalid && _zz__zz_when_Axi4LiteCrossbar_l229_6_1[2]);
  end

  always @(*) begin
    _zz_when_Axi4LiteCrossbar_l229_8[0] = ((32'h0 <= s1_axi_awaddr) && (s1_axi_awaddr < 32'h00001000));
    _zz_when_Axi4LiteCrossbar_l229_8[1] = ((32'h00010000 <= s1_axi_awaddr) && (s1_axi_awaddr < 32'h00011000));
    _zz_when_Axi4LiteCrossbar_l229_8[2] = ((32'h00020000 <= s1_axi_awaddr) && (s1_axi_awaddr < 32'h00021000));
    _zz_when_Axi4LiteCrossbar_l229_8[3] = ((32'h00030000 <= s1_axi_awaddr) && (s1_axi_awaddr < 32'h00031000));
  end

  assign _zz_when_Axi4LiteCrossbar_l152_4 = _zz_when_Axi4LiteCrossbar_l229_6;
  assign _zz_when_Axi4LiteCrossbar_l152_5 = (_zz_when_Axi4LiteCrossbar_l152_4 & (~ _zz__zz_when_Axi4LiteCrossbar_l152_5));
  always @(*) begin
    _zz_wrGranted_2 = 1'b0;
    if(when_Axi4LiteCrossbar_l152_4) begin
      _zz_wrGranted_2 = 1'b0;
    end
    if(when_Axi4LiteCrossbar_l152_5) begin
      _zz_wrGranted_2 = 1'b1;
    end
  end

  assign when_Axi4LiteCrossbar_l152_4 = _zz_when_Axi4LiteCrossbar_l152_5[0];
  assign when_Axi4LiteCrossbar_l152_5 = _zz_when_Axi4LiteCrossbar_l152_5[1];
  assign when_Axi4LiteCrossbar_l229_2 = (|_zz_when_Axi4LiteCrossbar_l229_6);
  assign when_Axi4LiteCrossbar_l233_4 = (_zz_wrGranted_2 == 1'b0);
  assign when_Axi4LiteCrossbar_l233_5 = (_zz_wrGranted_2 == 1'b1);
  assign io_slaves_2_aw_fire = (m2_axi_awvalid && m2_axi_awready);
  assign when_Axi4LiteCrossbar_l285_4 = (wrGranted_2 == 1'b0);
  assign when_Axi4LiteCrossbar_l285_5 = (wrGranted_2 == 1'b1);
  assign io_slaves_2_b_fire = (m2_axi_bvalid && m2_axi_bready);
  assign when_Axi4LiteCrossbar_l217_3 = (! wrActive_3);
  always @(*) begin
    _zz_when_Axi4LiteCrossbar_l229_10[0] = ((32'h0 <= s0_axi_awaddr) && (s0_axi_awaddr < 32'h00001000));
    _zz_when_Axi4LiteCrossbar_l229_10[1] = ((32'h00010000 <= s0_axi_awaddr) && (s0_axi_awaddr < 32'h00011000));
    _zz_when_Axi4LiteCrossbar_l229_10[2] = ((32'h00020000 <= s0_axi_awaddr) && (s0_axi_awaddr < 32'h00021000));
    _zz_when_Axi4LiteCrossbar_l229_10[3] = ((32'h00030000 <= s0_axi_awaddr) && (s0_axi_awaddr < 32'h00031000));
  end

  always @(*) begin
    _zz_when_Axi4LiteCrossbar_l229_9[0] = (s0_axi_awvalid && _zz__zz_when_Axi4LiteCrossbar_l229_9[3]);
    _zz_when_Axi4LiteCrossbar_l229_9[1] = (s1_axi_awvalid && _zz__zz_when_Axi4LiteCrossbar_l229_9_1[3]);
  end

  always @(*) begin
    _zz_when_Axi4LiteCrossbar_l229_11[0] = ((32'h0 <= s1_axi_awaddr) && (s1_axi_awaddr < 32'h00001000));
    _zz_when_Axi4LiteCrossbar_l229_11[1] = ((32'h00010000 <= s1_axi_awaddr) && (s1_axi_awaddr < 32'h00011000));
    _zz_when_Axi4LiteCrossbar_l229_11[2] = ((32'h00020000 <= s1_axi_awaddr) && (s1_axi_awaddr < 32'h00021000));
    _zz_when_Axi4LiteCrossbar_l229_11[3] = ((32'h00030000 <= s1_axi_awaddr) && (s1_axi_awaddr < 32'h00031000));
  end

  assign _zz_when_Axi4LiteCrossbar_l152_6 = _zz_when_Axi4LiteCrossbar_l229_9;
  assign _zz_when_Axi4LiteCrossbar_l152_7 = (_zz_when_Axi4LiteCrossbar_l152_6 & (~ _zz__zz_when_Axi4LiteCrossbar_l152_7));
  always @(*) begin
    _zz_wrGranted_3 = 1'b0;
    if(when_Axi4LiteCrossbar_l152_6) begin
      _zz_wrGranted_3 = 1'b0;
    end
    if(when_Axi4LiteCrossbar_l152_7) begin
      _zz_wrGranted_3 = 1'b1;
    end
  end

  assign when_Axi4LiteCrossbar_l152_6 = _zz_when_Axi4LiteCrossbar_l152_7[0];
  assign when_Axi4LiteCrossbar_l152_7 = _zz_when_Axi4LiteCrossbar_l152_7[1];
  assign when_Axi4LiteCrossbar_l229_3 = (|_zz_when_Axi4LiteCrossbar_l229_9);
  assign when_Axi4LiteCrossbar_l233_6 = (_zz_wrGranted_3 == 1'b0);
  assign when_Axi4LiteCrossbar_l233_7 = (_zz_wrGranted_3 == 1'b1);
  assign io_slaves_3_aw_fire = (m3_axi_awvalid && m3_axi_awready);
  assign when_Axi4LiteCrossbar_l285_6 = (wrGranted_3 == 1'b0);
  assign when_Axi4LiteCrossbar_l285_7 = (wrGranted_3 == 1'b1);
  assign io_slaves_3_b_fire = (m3_axi_bvalid && m3_axi_bready);
  assign when_Axi4LiteCrossbar_l217_4 = (! wrActive_4);
  always @(*) begin
    _zz_when_Axi4LiteCrossbar_l229_13[0] = ((32'h0 <= s0_axi_awaddr) && (s0_axi_awaddr < 32'h00001000));
    _zz_when_Axi4LiteCrossbar_l229_13[1] = ((32'h00010000 <= s0_axi_awaddr) && (s0_axi_awaddr < 32'h00011000));
    _zz_when_Axi4LiteCrossbar_l229_13[2] = ((32'h00020000 <= s0_axi_awaddr) && (s0_axi_awaddr < 32'h00021000));
    _zz_when_Axi4LiteCrossbar_l229_13[3] = ((32'h00030000 <= s0_axi_awaddr) && (s0_axi_awaddr < 32'h00031000));
  end

  always @(*) begin
    _zz_when_Axi4LiteCrossbar_l229_12[0] = (s0_axi_awvalid && _zz__zz_when_Axi4LiteCrossbar_l229_12[4]);
    _zz_when_Axi4LiteCrossbar_l229_12[1] = (s1_axi_awvalid && _zz__zz_when_Axi4LiteCrossbar_l229_12_1[4]);
  end

  always @(*) begin
    _zz_when_Axi4LiteCrossbar_l229_14[0] = ((32'h0 <= s1_axi_awaddr) && (s1_axi_awaddr < 32'h00001000));
    _zz_when_Axi4LiteCrossbar_l229_14[1] = ((32'h00010000 <= s1_axi_awaddr) && (s1_axi_awaddr < 32'h00011000));
    _zz_when_Axi4LiteCrossbar_l229_14[2] = ((32'h00020000 <= s1_axi_awaddr) && (s1_axi_awaddr < 32'h00021000));
    _zz_when_Axi4LiteCrossbar_l229_14[3] = ((32'h00030000 <= s1_axi_awaddr) && (s1_axi_awaddr < 32'h00031000));
  end

  assign _zz_when_Axi4LiteCrossbar_l152_8 = _zz_when_Axi4LiteCrossbar_l229_12;
  assign _zz_when_Axi4LiteCrossbar_l152_9 = (_zz_when_Axi4LiteCrossbar_l152_8 & (~ _zz__zz_when_Axi4LiteCrossbar_l152_9));
  always @(*) begin
    _zz_wrGranted_4 = 1'b0;
    if(when_Axi4LiteCrossbar_l152_8) begin
      _zz_wrGranted_4 = 1'b0;
    end
    if(when_Axi4LiteCrossbar_l152_9) begin
      _zz_wrGranted_4 = 1'b1;
    end
  end

  assign when_Axi4LiteCrossbar_l152_8 = _zz_when_Axi4LiteCrossbar_l152_9[0];
  assign when_Axi4LiteCrossbar_l152_9 = _zz_when_Axi4LiteCrossbar_l152_9[1];
  assign when_Axi4LiteCrossbar_l229_4 = (|_zz_when_Axi4LiteCrossbar_l229_12);
  assign when_Axi4LiteCrossbar_l233_8 = (_zz_wrGranted_4 == 1'b0);
  assign when_Axi4LiteCrossbar_l233_9 = (_zz_wrGranted_4 == 1'b1);
  assign decErr_io_axi_aw_fire = (decErr_io_axi_aw_valid && decErr_io_axi_aw_ready);
  assign when_Axi4LiteCrossbar_l285_8 = (wrGranted_4 == 1'b0);
  assign when_Axi4LiteCrossbar_l285_9 = (wrGranted_4 == 1'b1);
  assign decErr_io_axi_b_fire = (decErr_io_axi_b_valid && decErr_io_axi_b_ready);
  assign when_Axi4LiteCrossbar_l306 = (! rdActive_0);
  always @(*) begin
    _zz_when_Axi4LiteCrossbar_l317_1[0] = ((32'h0 <= s0_axi_araddr) && (s0_axi_araddr < 32'h00001000));
    _zz_when_Axi4LiteCrossbar_l317_1[1] = ((32'h00010000 <= s0_axi_araddr) && (s0_axi_araddr < 32'h00011000));
    _zz_when_Axi4LiteCrossbar_l317_1[2] = ((32'h00020000 <= s0_axi_araddr) && (s0_axi_araddr < 32'h00021000));
    _zz_when_Axi4LiteCrossbar_l317_1[3] = ((32'h00030000 <= s0_axi_araddr) && (s0_axi_araddr < 32'h00031000));
  end

  always @(*) begin
    _zz_when_Axi4LiteCrossbar_l317[0] = (s0_axi_arvalid && _zz__zz_when_Axi4LiteCrossbar_l317[0]);
    _zz_when_Axi4LiteCrossbar_l317[1] = (s1_axi_arvalid && _zz__zz_when_Axi4LiteCrossbar_l317_1[0]);
  end

  always @(*) begin
    _zz_when_Axi4LiteCrossbar_l317_2[0] = ((32'h0 <= s1_axi_araddr) && (s1_axi_araddr < 32'h00001000));
    _zz_when_Axi4LiteCrossbar_l317_2[1] = ((32'h00010000 <= s1_axi_araddr) && (s1_axi_araddr < 32'h00011000));
    _zz_when_Axi4LiteCrossbar_l317_2[2] = ((32'h00020000 <= s1_axi_araddr) && (s1_axi_araddr < 32'h00021000));
    _zz_when_Axi4LiteCrossbar_l317_2[3] = ((32'h00030000 <= s1_axi_araddr) && (s1_axi_araddr < 32'h00031000));
  end

  assign _zz_when_Axi4LiteCrossbar_l152_10 = _zz_when_Axi4LiteCrossbar_l317;
  assign _zz_when_Axi4LiteCrossbar_l152_11 = (_zz_when_Axi4LiteCrossbar_l152_10 & (~ _zz__zz_when_Axi4LiteCrossbar_l152_11));
  always @(*) begin
    _zz_rdGranted_0 = 1'b0;
    if(when_Axi4LiteCrossbar_l152_10) begin
      _zz_rdGranted_0 = 1'b0;
    end
    if(when_Axi4LiteCrossbar_l152_11) begin
      _zz_rdGranted_0 = 1'b1;
    end
  end

  assign when_Axi4LiteCrossbar_l152_10 = _zz_when_Axi4LiteCrossbar_l152_11[0];
  assign when_Axi4LiteCrossbar_l152_11 = _zz_when_Axi4LiteCrossbar_l152_11[1];
  assign when_Axi4LiteCrossbar_l317 = (|_zz_when_Axi4LiteCrossbar_l317);
  assign when_Axi4LiteCrossbar_l320 = (_zz_rdGranted_0 == 1'b0);
  assign when_Axi4LiteCrossbar_l320_1 = (_zz_rdGranted_0 == 1'b1);
  assign io_slaves_0_ar_fire = (m0_axi_arvalid && m0_axi_arready);
  assign when_Axi4LiteCrossbar_l363 = (rdGranted_0 == 1'b0);
  assign when_Axi4LiteCrossbar_l363_1 = (rdGranted_0 == 1'b1);
  assign io_slaves_0_r_fire = (m0_axi_rvalid && m0_axi_rready);
  assign when_Axi4LiteCrossbar_l306_1 = (! rdActive_1);
  always @(*) begin
    _zz_when_Axi4LiteCrossbar_l317_4[0] = ((32'h0 <= s0_axi_araddr) && (s0_axi_araddr < 32'h00001000));
    _zz_when_Axi4LiteCrossbar_l317_4[1] = ((32'h00010000 <= s0_axi_araddr) && (s0_axi_araddr < 32'h00011000));
    _zz_when_Axi4LiteCrossbar_l317_4[2] = ((32'h00020000 <= s0_axi_araddr) && (s0_axi_araddr < 32'h00021000));
    _zz_when_Axi4LiteCrossbar_l317_4[3] = ((32'h00030000 <= s0_axi_araddr) && (s0_axi_araddr < 32'h00031000));
  end

  always @(*) begin
    _zz_when_Axi4LiteCrossbar_l317_3[0] = (s0_axi_arvalid && _zz__zz_when_Axi4LiteCrossbar_l317_3[1]);
    _zz_when_Axi4LiteCrossbar_l317_3[1] = (s1_axi_arvalid && _zz__zz_when_Axi4LiteCrossbar_l317_3_1[1]);
  end

  always @(*) begin
    _zz_when_Axi4LiteCrossbar_l317_5[0] = ((32'h0 <= s1_axi_araddr) && (s1_axi_araddr < 32'h00001000));
    _zz_when_Axi4LiteCrossbar_l317_5[1] = ((32'h00010000 <= s1_axi_araddr) && (s1_axi_araddr < 32'h00011000));
    _zz_when_Axi4LiteCrossbar_l317_5[2] = ((32'h00020000 <= s1_axi_araddr) && (s1_axi_araddr < 32'h00021000));
    _zz_when_Axi4LiteCrossbar_l317_5[3] = ((32'h00030000 <= s1_axi_araddr) && (s1_axi_araddr < 32'h00031000));
  end

  assign _zz_when_Axi4LiteCrossbar_l152_12 = _zz_when_Axi4LiteCrossbar_l317_3;
  assign _zz_when_Axi4LiteCrossbar_l152_13 = (_zz_when_Axi4LiteCrossbar_l152_12 & (~ _zz__zz_when_Axi4LiteCrossbar_l152_13));
  always @(*) begin
    _zz_rdGranted_1 = 1'b0;
    if(when_Axi4LiteCrossbar_l152_12) begin
      _zz_rdGranted_1 = 1'b0;
    end
    if(when_Axi4LiteCrossbar_l152_13) begin
      _zz_rdGranted_1 = 1'b1;
    end
  end

  assign when_Axi4LiteCrossbar_l152_12 = _zz_when_Axi4LiteCrossbar_l152_13[0];
  assign when_Axi4LiteCrossbar_l152_13 = _zz_when_Axi4LiteCrossbar_l152_13[1];
  assign when_Axi4LiteCrossbar_l317_1 = (|_zz_when_Axi4LiteCrossbar_l317_3);
  assign when_Axi4LiteCrossbar_l320_2 = (_zz_rdGranted_1 == 1'b0);
  assign when_Axi4LiteCrossbar_l320_3 = (_zz_rdGranted_1 == 1'b1);
  assign io_slaves_1_ar_fire = (m1_axi_arvalid && m1_axi_arready);
  assign when_Axi4LiteCrossbar_l363_2 = (rdGranted_1 == 1'b0);
  assign when_Axi4LiteCrossbar_l363_3 = (rdGranted_1 == 1'b1);
  assign io_slaves_1_r_fire = (m1_axi_rvalid && m1_axi_rready);
  assign when_Axi4LiteCrossbar_l306_2 = (! rdActive_2);
  always @(*) begin
    _zz_when_Axi4LiteCrossbar_l317_7[0] = ((32'h0 <= s0_axi_araddr) && (s0_axi_araddr < 32'h00001000));
    _zz_when_Axi4LiteCrossbar_l317_7[1] = ((32'h00010000 <= s0_axi_araddr) && (s0_axi_araddr < 32'h00011000));
    _zz_when_Axi4LiteCrossbar_l317_7[2] = ((32'h00020000 <= s0_axi_araddr) && (s0_axi_araddr < 32'h00021000));
    _zz_when_Axi4LiteCrossbar_l317_7[3] = ((32'h00030000 <= s0_axi_araddr) && (s0_axi_araddr < 32'h00031000));
  end

  always @(*) begin
    _zz_when_Axi4LiteCrossbar_l317_6[0] = (s0_axi_arvalid && _zz__zz_when_Axi4LiteCrossbar_l317_6[2]);
    _zz_when_Axi4LiteCrossbar_l317_6[1] = (s1_axi_arvalid && _zz__zz_when_Axi4LiteCrossbar_l317_6_1[2]);
  end

  always @(*) begin
    _zz_when_Axi4LiteCrossbar_l317_8[0] = ((32'h0 <= s1_axi_araddr) && (s1_axi_araddr < 32'h00001000));
    _zz_when_Axi4LiteCrossbar_l317_8[1] = ((32'h00010000 <= s1_axi_araddr) && (s1_axi_araddr < 32'h00011000));
    _zz_when_Axi4LiteCrossbar_l317_8[2] = ((32'h00020000 <= s1_axi_araddr) && (s1_axi_araddr < 32'h00021000));
    _zz_when_Axi4LiteCrossbar_l317_8[3] = ((32'h00030000 <= s1_axi_araddr) && (s1_axi_araddr < 32'h00031000));
  end

  assign _zz_when_Axi4LiteCrossbar_l152_14 = _zz_when_Axi4LiteCrossbar_l317_6;
  assign _zz_when_Axi4LiteCrossbar_l152_15 = (_zz_when_Axi4LiteCrossbar_l152_14 & (~ _zz__zz_when_Axi4LiteCrossbar_l152_15));
  always @(*) begin
    _zz_rdGranted_2 = 1'b0;
    if(when_Axi4LiteCrossbar_l152_14) begin
      _zz_rdGranted_2 = 1'b0;
    end
    if(when_Axi4LiteCrossbar_l152_15) begin
      _zz_rdGranted_2 = 1'b1;
    end
  end

  assign when_Axi4LiteCrossbar_l152_14 = _zz_when_Axi4LiteCrossbar_l152_15[0];
  assign when_Axi4LiteCrossbar_l152_15 = _zz_when_Axi4LiteCrossbar_l152_15[1];
  assign when_Axi4LiteCrossbar_l317_2 = (|_zz_when_Axi4LiteCrossbar_l317_6);
  assign when_Axi4LiteCrossbar_l320_4 = (_zz_rdGranted_2 == 1'b0);
  assign when_Axi4LiteCrossbar_l320_5 = (_zz_rdGranted_2 == 1'b1);
  assign io_slaves_2_ar_fire = (m2_axi_arvalid && m2_axi_arready);
  assign when_Axi4LiteCrossbar_l363_4 = (rdGranted_2 == 1'b0);
  assign when_Axi4LiteCrossbar_l363_5 = (rdGranted_2 == 1'b1);
  assign io_slaves_2_r_fire = (m2_axi_rvalid && m2_axi_rready);
  assign when_Axi4LiteCrossbar_l306_3 = (! rdActive_3);
  always @(*) begin
    _zz_when_Axi4LiteCrossbar_l317_10[0] = ((32'h0 <= s0_axi_araddr) && (s0_axi_araddr < 32'h00001000));
    _zz_when_Axi4LiteCrossbar_l317_10[1] = ((32'h00010000 <= s0_axi_araddr) && (s0_axi_araddr < 32'h00011000));
    _zz_when_Axi4LiteCrossbar_l317_10[2] = ((32'h00020000 <= s0_axi_araddr) && (s0_axi_araddr < 32'h00021000));
    _zz_when_Axi4LiteCrossbar_l317_10[3] = ((32'h00030000 <= s0_axi_araddr) && (s0_axi_araddr < 32'h00031000));
  end

  always @(*) begin
    _zz_when_Axi4LiteCrossbar_l317_9[0] = (s0_axi_arvalid && _zz__zz_when_Axi4LiteCrossbar_l317_9[3]);
    _zz_when_Axi4LiteCrossbar_l317_9[1] = (s1_axi_arvalid && _zz__zz_when_Axi4LiteCrossbar_l317_9_1[3]);
  end

  always @(*) begin
    _zz_when_Axi4LiteCrossbar_l317_11[0] = ((32'h0 <= s1_axi_araddr) && (s1_axi_araddr < 32'h00001000));
    _zz_when_Axi4LiteCrossbar_l317_11[1] = ((32'h00010000 <= s1_axi_araddr) && (s1_axi_araddr < 32'h00011000));
    _zz_when_Axi4LiteCrossbar_l317_11[2] = ((32'h00020000 <= s1_axi_araddr) && (s1_axi_araddr < 32'h00021000));
    _zz_when_Axi4LiteCrossbar_l317_11[3] = ((32'h00030000 <= s1_axi_araddr) && (s1_axi_araddr < 32'h00031000));
  end

  assign _zz_when_Axi4LiteCrossbar_l152_16 = _zz_when_Axi4LiteCrossbar_l317_9;
  assign _zz_when_Axi4LiteCrossbar_l152_17 = (_zz_when_Axi4LiteCrossbar_l152_16 & (~ _zz__zz_when_Axi4LiteCrossbar_l152_17));
  always @(*) begin
    _zz_rdGranted_3 = 1'b0;
    if(when_Axi4LiteCrossbar_l152_16) begin
      _zz_rdGranted_3 = 1'b0;
    end
    if(when_Axi4LiteCrossbar_l152_17) begin
      _zz_rdGranted_3 = 1'b1;
    end
  end

  assign when_Axi4LiteCrossbar_l152_16 = _zz_when_Axi4LiteCrossbar_l152_17[0];
  assign when_Axi4LiteCrossbar_l152_17 = _zz_when_Axi4LiteCrossbar_l152_17[1];
  assign when_Axi4LiteCrossbar_l317_3 = (|_zz_when_Axi4LiteCrossbar_l317_9);
  assign when_Axi4LiteCrossbar_l320_6 = (_zz_rdGranted_3 == 1'b0);
  assign when_Axi4LiteCrossbar_l320_7 = (_zz_rdGranted_3 == 1'b1);
  assign io_slaves_3_ar_fire = (m3_axi_arvalid && m3_axi_arready);
  assign when_Axi4LiteCrossbar_l363_6 = (rdGranted_3 == 1'b0);
  assign when_Axi4LiteCrossbar_l363_7 = (rdGranted_3 == 1'b1);
  assign io_slaves_3_r_fire = (m3_axi_rvalid && m3_axi_rready);
  assign when_Axi4LiteCrossbar_l306_4 = (! rdActive_4);
  always @(*) begin
    _zz_when_Axi4LiteCrossbar_l317_13[0] = ((32'h0 <= s0_axi_araddr) && (s0_axi_araddr < 32'h00001000));
    _zz_when_Axi4LiteCrossbar_l317_13[1] = ((32'h00010000 <= s0_axi_araddr) && (s0_axi_araddr < 32'h00011000));
    _zz_when_Axi4LiteCrossbar_l317_13[2] = ((32'h00020000 <= s0_axi_araddr) && (s0_axi_araddr < 32'h00021000));
    _zz_when_Axi4LiteCrossbar_l317_13[3] = ((32'h00030000 <= s0_axi_araddr) && (s0_axi_araddr < 32'h00031000));
  end

  always @(*) begin
    _zz_when_Axi4LiteCrossbar_l317_12[0] = (s0_axi_arvalid && _zz__zz_when_Axi4LiteCrossbar_l317_12[4]);
    _zz_when_Axi4LiteCrossbar_l317_12[1] = (s1_axi_arvalid && _zz__zz_when_Axi4LiteCrossbar_l317_12_1[4]);
  end

  always @(*) begin
    _zz_when_Axi4LiteCrossbar_l317_14[0] = ((32'h0 <= s1_axi_araddr) && (s1_axi_araddr < 32'h00001000));
    _zz_when_Axi4LiteCrossbar_l317_14[1] = ((32'h00010000 <= s1_axi_araddr) && (s1_axi_araddr < 32'h00011000));
    _zz_when_Axi4LiteCrossbar_l317_14[2] = ((32'h00020000 <= s1_axi_araddr) && (s1_axi_araddr < 32'h00021000));
    _zz_when_Axi4LiteCrossbar_l317_14[3] = ((32'h00030000 <= s1_axi_araddr) && (s1_axi_araddr < 32'h00031000));
  end

  assign _zz_when_Axi4LiteCrossbar_l152_18 = _zz_when_Axi4LiteCrossbar_l317_12;
  assign _zz_when_Axi4LiteCrossbar_l152_19 = (_zz_when_Axi4LiteCrossbar_l152_18 & (~ _zz__zz_when_Axi4LiteCrossbar_l152_19));
  always @(*) begin
    _zz_rdGranted_4 = 1'b0;
    if(when_Axi4LiteCrossbar_l152_18) begin
      _zz_rdGranted_4 = 1'b0;
    end
    if(when_Axi4LiteCrossbar_l152_19) begin
      _zz_rdGranted_4 = 1'b1;
    end
  end

  assign when_Axi4LiteCrossbar_l152_18 = _zz_when_Axi4LiteCrossbar_l152_19[0];
  assign when_Axi4LiteCrossbar_l152_19 = _zz_when_Axi4LiteCrossbar_l152_19[1];
  assign when_Axi4LiteCrossbar_l317_4 = (|_zz_when_Axi4LiteCrossbar_l317_12);
  assign when_Axi4LiteCrossbar_l320_8 = (_zz_rdGranted_4 == 1'b0);
  assign when_Axi4LiteCrossbar_l320_9 = (_zz_rdGranted_4 == 1'b1);
  assign decErr_io_axi_ar_fire = (decErr_io_axi_ar_valid && decErr_io_axi_ar_ready);
  assign when_Axi4LiteCrossbar_l363_8 = (rdGranted_4 == 1'b0);
  assign when_Axi4LiteCrossbar_l363_9 = (rdGranted_4 == 1'b1);
  assign decErr_io_axi_r_fire = (decErr_io_axi_r_valid && decErr_io_axi_r_ready);
  always @(posedge aclk) begin
    if(!aresetn) begin
      wrActive_0 <= 1'b0;
      wrActive_1 <= 1'b0;
      wrActive_2 <= 1'b0;
      wrActive_3 <= 1'b0;
      wrActive_4 <= 1'b0;
      wrGranted_0 <= 1'b0;
      wrGranted_1 <= 1'b0;
      wrGranted_2 <= 1'b0;
      wrGranted_3 <= 1'b0;
      wrGranted_4 <= 1'b0;
      wrRrPtr_0 <= 1'b0;
      wrRrPtr_1 <= 1'b0;
      wrRrPtr_2 <= 1'b0;
      wrRrPtr_3 <= 1'b0;
      wrRrPtr_4 <= 1'b0;
      rdActive_0 <= 1'b0;
      rdActive_1 <= 1'b0;
      rdActive_2 <= 1'b0;
      rdActive_3 <= 1'b0;
      rdActive_4 <= 1'b0;
      rdGranted_0 <= 1'b0;
      rdGranted_1 <= 1'b0;
      rdGranted_2 <= 1'b0;
      rdGranted_3 <= 1'b0;
      rdGranted_4 <= 1'b0;
      rdRrPtr_0 <= 1'b0;
      rdRrPtr_1 <= 1'b0;
      rdRrPtr_2 <= 1'b0;
      rdRrPtr_3 <= 1'b0;
      rdRrPtr_4 <= 1'b0;
    end else begin
      if(when_Axi4LiteCrossbar_l217) begin
        if(when_Axi4LiteCrossbar_l229) begin
          if(io_slaves_0_aw_fire) begin
            wrActive_0 <= 1'b1;
            wrGranted_0 <= _zz_wrGranted_0;
            wrRrPtr_0 <= (_zz_wrGranted_0 + 1'b1);
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
          end
        end
      end else begin
        if(io_slaves_1_b_fire) begin
          wrActive_1 <= 1'b0;
        end
      end
      if(when_Axi4LiteCrossbar_l217_2) begin
        if(when_Axi4LiteCrossbar_l229_2) begin
          if(io_slaves_2_aw_fire) begin
            wrActive_2 <= 1'b1;
            wrGranted_2 <= _zz_wrGranted_2;
            wrRrPtr_2 <= (_zz_wrGranted_2 + 1'b1);
          end
        end
      end else begin
        if(io_slaves_2_b_fire) begin
          wrActive_2 <= 1'b0;
        end
      end
      if(when_Axi4LiteCrossbar_l217_3) begin
        if(when_Axi4LiteCrossbar_l229_3) begin
          if(io_slaves_3_aw_fire) begin
            wrActive_3 <= 1'b1;
            wrGranted_3 <= _zz_wrGranted_3;
            wrRrPtr_3 <= (_zz_wrGranted_3 + 1'b1);
          end
        end
      end else begin
        if(io_slaves_3_b_fire) begin
          wrActive_3 <= 1'b0;
        end
      end
      if(when_Axi4LiteCrossbar_l217_4) begin
        if(when_Axi4LiteCrossbar_l229_4) begin
          if(decErr_io_axi_aw_fire) begin
            wrActive_4 <= 1'b1;
            wrGranted_4 <= _zz_wrGranted_4;
            wrRrPtr_4 <= (_zz_wrGranted_4 + 1'b1);
          end
        end
      end else begin
        if(decErr_io_axi_b_fire) begin
          wrActive_4 <= 1'b0;
        end
      end
      if(when_Axi4LiteCrossbar_l306) begin
        if(when_Axi4LiteCrossbar_l317) begin
          if(io_slaves_0_ar_fire) begin
            rdActive_0 <= 1'b1;
            rdGranted_0 <= _zz_rdGranted_0;
            rdRrPtr_0 <= (_zz_rdGranted_0 + 1'b1);
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
          end
        end
      end else begin
        if(io_slaves_1_r_fire) begin
          rdActive_1 <= 1'b0;
        end
      end
      if(when_Axi4LiteCrossbar_l306_2) begin
        if(when_Axi4LiteCrossbar_l317_2) begin
          if(io_slaves_2_ar_fire) begin
            rdActive_2 <= 1'b1;
            rdGranted_2 <= _zz_rdGranted_2;
            rdRrPtr_2 <= (_zz_rdGranted_2 + 1'b1);
          end
        end
      end else begin
        if(io_slaves_2_r_fire) begin
          rdActive_2 <= 1'b0;
        end
      end
      if(when_Axi4LiteCrossbar_l306_3) begin
        if(when_Axi4LiteCrossbar_l317_3) begin
          if(io_slaves_3_ar_fire) begin
            rdActive_3 <= 1'b1;
            rdGranted_3 <= _zz_rdGranted_3;
            rdRrPtr_3 <= (_zz_rdGranted_3 + 1'b1);
          end
        end
      end else begin
        if(io_slaves_3_r_fire) begin
          rdActive_3 <= 1'b0;
        end
      end
      if(when_Axi4LiteCrossbar_l306_4) begin
        if(when_Axi4LiteCrossbar_l317_4) begin
          if(decErr_io_axi_ar_fire) begin
            rdActive_4 <= 1'b1;
            rdGranted_4 <= _zz_rdGranted_4;
            rdRrPtr_4 <= (_zz_rdGranted_4 + 1'b1);
          end
        end
      end else begin
        if(decErr_io_axi_r_fire) begin
          rdActive_4 <= 1'b0;
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
