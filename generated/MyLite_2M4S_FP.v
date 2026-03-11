// Copyright (c) 2026 Leonardo Capossio — bard0 design  hello@bard0.com
// SPDX-License-Identifier: MIT
// Generator : SpinalHDL v1.10.1    git head : 2527c7c6b0fb0f95e5e1a5722a0be732b364ce43
// Component : AxiZeroLiteTop
// Git hash  : c347b302d22fb4f88f2fff621de18f3348535148

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

  wire       [1:0]    _zz_io_masters_0_b_payload_resp;
  wire       [1:0]    _zz_io_masters_1_b_payload_resp;
  wire       [1:0]    _zz__zz_when_Axi4LiteCrossbar_l131_1;
  wire       [1:0]    _zz__zz_when_Axi4LiteCrossbar_l131_3;
  wire       [1:0]    _zz__zz_when_Axi4LiteCrossbar_l131_5;
  wire       [1:0]    _zz__zz_when_Axi4LiteCrossbar_l131_7;
  wire       [1:0]    _zz__zz_when_Axi4LiteCrossbar_l131_9;
  wire       [1:0]    _zz__zz_when_Axi4LiteCrossbar_l131_11;
  wire       [1:0]    _zz__zz_when_Axi4LiteCrossbar_l131_13;
  wire       [1:0]    _zz__zz_when_Axi4LiteCrossbar_l131_15;
  reg                 wrActive_0;
  reg                 wrActive_1;
  reg                 wrActive_2;
  reg                 wrActive_3;
  reg        [0:0]    wrGranted_0;
  reg        [0:0]    wrGranted_1;
  reg        [0:0]    wrGranted_2;
  reg        [0:0]    wrGranted_3;
  reg        [0:0]    wrRrPtr_0;
  reg        [0:0]    wrRrPtr_1;
  reg        [0:0]    wrRrPtr_2;
  reg        [0:0]    wrRrPtr_3;
  reg                 rdActive_0;
  reg                 rdActive_1;
  reg                 rdActive_2;
  reg                 rdActive_3;
  reg        [0:0]    rdGranted_0;
  reg        [0:0]    rdGranted_1;
  reg        [0:0]    rdGranted_2;
  reg        [0:0]    rdGranted_3;
  reg        [0:0]    rdRrPtr_0;
  reg        [0:0]    rdRrPtr_1;
  reg        [0:0]    rdRrPtr_2;
  reg        [0:0]    rdRrPtr_3;
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
  wire                when_Axi4LiteCrossbar_l194;
  reg        [1:0]    _zz_when_Axi4LiteCrossbar_l206;
  reg        [3:0]    _zz_when_Axi4LiteCrossbar_l206_1;
  reg        [3:0]    _zz_when_Axi4LiteCrossbar_l206_2;
  wire       [1:0]    _zz_when_Axi4LiteCrossbar_l131;
  wire       [1:0]    _zz_when_Axi4LiteCrossbar_l131_1;
  reg        [0:0]    _zz_wrGranted_0;
  wire                when_Axi4LiteCrossbar_l131;
  wire                when_Axi4LiteCrossbar_l131_1;
  wire                when_Axi4LiteCrossbar_l206;
  wire                when_Axi4LiteCrossbar_l210;
  wire                when_Axi4LiteCrossbar_l210_1;
  wire                io_slaves_0_aw_fire;
  wire                when_Axi4LiteCrossbar_l262;
  wire                when_Axi4LiteCrossbar_l262_1;
  wire                io_slaves_0_b_fire;
  wire                when_Axi4LiteCrossbar_l194_1;
  reg        [1:0]    _zz_when_Axi4LiteCrossbar_l206_3;
  reg        [3:0]    _zz_when_Axi4LiteCrossbar_l206_4;
  reg        [3:0]    _zz_when_Axi4LiteCrossbar_l206_5;
  wire       [1:0]    _zz_when_Axi4LiteCrossbar_l131_2;
  wire       [1:0]    _zz_when_Axi4LiteCrossbar_l131_3;
  reg        [0:0]    _zz_wrGranted_1;
  wire                when_Axi4LiteCrossbar_l131_2;
  wire                when_Axi4LiteCrossbar_l131_3;
  wire                when_Axi4LiteCrossbar_l206_1;
  wire                when_Axi4LiteCrossbar_l210_2;
  wire                when_Axi4LiteCrossbar_l210_3;
  wire                io_slaves_1_aw_fire;
  wire                when_Axi4LiteCrossbar_l262_2;
  wire                when_Axi4LiteCrossbar_l262_3;
  wire                io_slaves_1_b_fire;
  wire                when_Axi4LiteCrossbar_l194_2;
  reg        [1:0]    _zz_when_Axi4LiteCrossbar_l206_6;
  reg        [3:0]    _zz_when_Axi4LiteCrossbar_l206_7;
  reg        [3:0]    _zz_when_Axi4LiteCrossbar_l206_8;
  wire       [1:0]    _zz_when_Axi4LiteCrossbar_l131_4;
  wire       [1:0]    _zz_when_Axi4LiteCrossbar_l131_5;
  reg        [0:0]    _zz_wrGranted_2;
  wire                when_Axi4LiteCrossbar_l131_4;
  wire                when_Axi4LiteCrossbar_l131_5;
  wire                when_Axi4LiteCrossbar_l206_2;
  wire                when_Axi4LiteCrossbar_l210_4;
  wire                when_Axi4LiteCrossbar_l210_5;
  wire                io_slaves_2_aw_fire;
  wire                when_Axi4LiteCrossbar_l262_4;
  wire                when_Axi4LiteCrossbar_l262_5;
  wire                io_slaves_2_b_fire;
  wire                when_Axi4LiteCrossbar_l194_3;
  reg        [1:0]    _zz_when_Axi4LiteCrossbar_l206_9;
  reg        [3:0]    _zz_when_Axi4LiteCrossbar_l206_10;
  reg        [3:0]    _zz_when_Axi4LiteCrossbar_l206_11;
  wire       [1:0]    _zz_when_Axi4LiteCrossbar_l131_6;
  wire       [1:0]    _zz_when_Axi4LiteCrossbar_l131_7;
  reg        [0:0]    _zz_wrGranted_3;
  wire                when_Axi4LiteCrossbar_l131_6;
  wire                when_Axi4LiteCrossbar_l131_7;
  wire                when_Axi4LiteCrossbar_l206_3;
  wire                when_Axi4LiteCrossbar_l210_6;
  wire                when_Axi4LiteCrossbar_l210_7;
  wire                io_slaves_3_aw_fire;
  wire                when_Axi4LiteCrossbar_l262_6;
  wire                when_Axi4LiteCrossbar_l262_7;
  wire                io_slaves_3_b_fire;
  wire                when_Axi4LiteCrossbar_l283;
  reg        [1:0]    _zz_when_Axi4LiteCrossbar_l294;
  reg        [3:0]    _zz_when_Axi4LiteCrossbar_l294_1;
  reg        [3:0]    _zz_when_Axi4LiteCrossbar_l294_2;
  wire       [1:0]    _zz_when_Axi4LiteCrossbar_l131_8;
  wire       [1:0]    _zz_when_Axi4LiteCrossbar_l131_9;
  reg        [0:0]    _zz_rdGranted_0;
  wire                when_Axi4LiteCrossbar_l131_8;
  wire                when_Axi4LiteCrossbar_l131_9;
  wire                when_Axi4LiteCrossbar_l294;
  wire                when_Axi4LiteCrossbar_l297;
  wire                when_Axi4LiteCrossbar_l297_1;
  wire                io_slaves_0_ar_fire;
  wire                when_Axi4LiteCrossbar_l340;
  wire                when_Axi4LiteCrossbar_l340_1;
  wire                io_slaves_0_r_fire;
  wire                when_Axi4LiteCrossbar_l283_1;
  reg        [1:0]    _zz_when_Axi4LiteCrossbar_l294_3;
  reg        [3:0]    _zz_when_Axi4LiteCrossbar_l294_4;
  reg        [3:0]    _zz_when_Axi4LiteCrossbar_l294_5;
  wire       [1:0]    _zz_when_Axi4LiteCrossbar_l131_10;
  wire       [1:0]    _zz_when_Axi4LiteCrossbar_l131_11;
  reg        [0:0]    _zz_rdGranted_1;
  wire                when_Axi4LiteCrossbar_l131_10;
  wire                when_Axi4LiteCrossbar_l131_11;
  wire                when_Axi4LiteCrossbar_l294_1;
  wire                when_Axi4LiteCrossbar_l297_2;
  wire                when_Axi4LiteCrossbar_l297_3;
  wire                io_slaves_1_ar_fire;
  wire                when_Axi4LiteCrossbar_l340_2;
  wire                when_Axi4LiteCrossbar_l340_3;
  wire                io_slaves_1_r_fire;
  wire                when_Axi4LiteCrossbar_l283_2;
  reg        [1:0]    _zz_when_Axi4LiteCrossbar_l294_6;
  reg        [3:0]    _zz_when_Axi4LiteCrossbar_l294_7;
  reg        [3:0]    _zz_when_Axi4LiteCrossbar_l294_8;
  wire       [1:0]    _zz_when_Axi4LiteCrossbar_l131_12;
  wire       [1:0]    _zz_when_Axi4LiteCrossbar_l131_13;
  reg        [0:0]    _zz_rdGranted_2;
  wire                when_Axi4LiteCrossbar_l131_12;
  wire                when_Axi4LiteCrossbar_l131_13;
  wire                when_Axi4LiteCrossbar_l294_2;
  wire                when_Axi4LiteCrossbar_l297_4;
  wire                when_Axi4LiteCrossbar_l297_5;
  wire                io_slaves_2_ar_fire;
  wire                when_Axi4LiteCrossbar_l340_4;
  wire                when_Axi4LiteCrossbar_l340_5;
  wire                io_slaves_2_r_fire;
  wire                when_Axi4LiteCrossbar_l283_3;
  reg        [1:0]    _zz_when_Axi4LiteCrossbar_l294_9;
  reg        [3:0]    _zz_when_Axi4LiteCrossbar_l294_10;
  reg        [3:0]    _zz_when_Axi4LiteCrossbar_l294_11;
  wire       [1:0]    _zz_when_Axi4LiteCrossbar_l131_14;
  wire       [1:0]    _zz_when_Axi4LiteCrossbar_l131_15;
  reg        [0:0]    _zz_rdGranted_3;
  wire                when_Axi4LiteCrossbar_l131_14;
  wire                when_Axi4LiteCrossbar_l131_15;
  wire                when_Axi4LiteCrossbar_l294_3;
  wire                when_Axi4LiteCrossbar_l297_6;
  wire                when_Axi4LiteCrossbar_l297_7;
  wire                io_slaves_3_ar_fire;
  wire                when_Axi4LiteCrossbar_l340_6;
  wire                when_Axi4LiteCrossbar_l340_7;
  wire                io_slaves_3_r_fire;

  assign _zz_io_masters_0_b_payload_resp = 2'b00;
  assign _zz_io_masters_1_b_payload_resp = 2'b00;
  assign _zz__zz_when_Axi4LiteCrossbar_l131_1 = (_zz_when_Axi4LiteCrossbar_l131 - 2'b01);
  assign _zz__zz_when_Axi4LiteCrossbar_l131_3 = (_zz_when_Axi4LiteCrossbar_l131_2 - 2'b01);
  assign _zz__zz_when_Axi4LiteCrossbar_l131_5 = (_zz_when_Axi4LiteCrossbar_l131_4 - 2'b01);
  assign _zz__zz_when_Axi4LiteCrossbar_l131_7 = (_zz_when_Axi4LiteCrossbar_l131_6 - 2'b01);
  assign _zz__zz_when_Axi4LiteCrossbar_l131_9 = (_zz_when_Axi4LiteCrossbar_l131_8 - 2'b01);
  assign _zz__zz_when_Axi4LiteCrossbar_l131_11 = (_zz_when_Axi4LiteCrossbar_l131_10 - 2'b01);
  assign _zz__zz_when_Axi4LiteCrossbar_l131_13 = (_zz_when_Axi4LiteCrossbar_l131_12 - 2'b01);
  assign _zz__zz_when_Axi4LiteCrossbar_l131_15 = (_zz_when_Axi4LiteCrossbar_l131_14 - 2'b01);
  always @(*) begin
    s0_axi_awready = 1'b0;
    if(when_Axi4LiteCrossbar_l194) begin
      if(when_Axi4LiteCrossbar_l206) begin
        if(when_Axi4LiteCrossbar_l210) begin
          s0_axi_awready = m0_axi_awready;
        end
      end
    end
    if(when_Axi4LiteCrossbar_l194_1) begin
      if(when_Axi4LiteCrossbar_l206_1) begin
        if(when_Axi4LiteCrossbar_l210_2) begin
          s0_axi_awready = m1_axi_awready;
        end
      end
    end
    if(when_Axi4LiteCrossbar_l194_2) begin
      if(when_Axi4LiteCrossbar_l206_2) begin
        if(when_Axi4LiteCrossbar_l210_4) begin
          s0_axi_awready = m2_axi_awready;
        end
      end
    end
    if(when_Axi4LiteCrossbar_l194_3) begin
      if(when_Axi4LiteCrossbar_l206_3) begin
        if(when_Axi4LiteCrossbar_l210_6) begin
          s0_axi_awready = m3_axi_awready;
        end
      end
    end
  end

  always @(*) begin
    s0_axi_wready = 1'b0;
    if(when_Axi4LiteCrossbar_l194) begin
      if(when_Axi4LiteCrossbar_l206) begin
        if(when_Axi4LiteCrossbar_l210) begin
          s0_axi_wready = m0_axi_wready;
        end
      end
    end else begin
      if(when_Axi4LiteCrossbar_l262) begin
        s0_axi_wready = m0_axi_wready;
      end
    end
    if(when_Axi4LiteCrossbar_l194_1) begin
      if(when_Axi4LiteCrossbar_l206_1) begin
        if(when_Axi4LiteCrossbar_l210_2) begin
          s0_axi_wready = m1_axi_wready;
        end
      end
    end else begin
      if(when_Axi4LiteCrossbar_l262_2) begin
        s0_axi_wready = m1_axi_wready;
      end
    end
    if(when_Axi4LiteCrossbar_l194_2) begin
      if(when_Axi4LiteCrossbar_l206_2) begin
        if(when_Axi4LiteCrossbar_l210_4) begin
          s0_axi_wready = m2_axi_wready;
        end
      end
    end else begin
      if(when_Axi4LiteCrossbar_l262_4) begin
        s0_axi_wready = m2_axi_wready;
      end
    end
    if(when_Axi4LiteCrossbar_l194_3) begin
      if(when_Axi4LiteCrossbar_l206_3) begin
        if(when_Axi4LiteCrossbar_l210_6) begin
          s0_axi_wready = m3_axi_wready;
        end
      end
    end else begin
      if(when_Axi4LiteCrossbar_l262_6) begin
        s0_axi_wready = m3_axi_wready;
      end
    end
  end

  always @(*) begin
    s0_axi_bvalid = 1'b0;
    if(!when_Axi4LiteCrossbar_l194) begin
      if(when_Axi4LiteCrossbar_l262) begin
        s0_axi_bvalid = m0_axi_bvalid;
      end
    end
    if(!when_Axi4LiteCrossbar_l194_1) begin
      if(when_Axi4LiteCrossbar_l262_2) begin
        s0_axi_bvalid = m1_axi_bvalid;
      end
    end
    if(!when_Axi4LiteCrossbar_l194_2) begin
      if(when_Axi4LiteCrossbar_l262_4) begin
        s0_axi_bvalid = m2_axi_bvalid;
      end
    end
    if(!when_Axi4LiteCrossbar_l194_3) begin
      if(when_Axi4LiteCrossbar_l262_6) begin
        s0_axi_bvalid = m3_axi_bvalid;
      end
    end
  end

  always @(*) begin
    s0_axi_bresp = _zz_io_masters_0_b_payload_resp[1 : 0];
    if(!when_Axi4LiteCrossbar_l194) begin
      if(when_Axi4LiteCrossbar_l262) begin
        s0_axi_bresp = m0_axi_bresp;
      end
    end
    if(!when_Axi4LiteCrossbar_l194_1) begin
      if(when_Axi4LiteCrossbar_l262_2) begin
        s0_axi_bresp = m1_axi_bresp;
      end
    end
    if(!when_Axi4LiteCrossbar_l194_2) begin
      if(when_Axi4LiteCrossbar_l262_4) begin
        s0_axi_bresp = m2_axi_bresp;
      end
    end
    if(!when_Axi4LiteCrossbar_l194_3) begin
      if(when_Axi4LiteCrossbar_l262_6) begin
        s0_axi_bresp = m3_axi_bresp;
      end
    end
  end

  always @(*) begin
    s0_axi_arready = 1'b0;
    if(when_Axi4LiteCrossbar_l283) begin
      if(when_Axi4LiteCrossbar_l294) begin
        if(when_Axi4LiteCrossbar_l297) begin
          s0_axi_arready = m0_axi_arready;
        end
      end
    end
    if(when_Axi4LiteCrossbar_l283_1) begin
      if(when_Axi4LiteCrossbar_l294_1) begin
        if(when_Axi4LiteCrossbar_l297_2) begin
          s0_axi_arready = m1_axi_arready;
        end
      end
    end
    if(when_Axi4LiteCrossbar_l283_2) begin
      if(when_Axi4LiteCrossbar_l294_2) begin
        if(when_Axi4LiteCrossbar_l297_4) begin
          s0_axi_arready = m2_axi_arready;
        end
      end
    end
    if(when_Axi4LiteCrossbar_l283_3) begin
      if(when_Axi4LiteCrossbar_l294_3) begin
        if(when_Axi4LiteCrossbar_l297_6) begin
          s0_axi_arready = m3_axi_arready;
        end
      end
    end
  end

  always @(*) begin
    s0_axi_rvalid = 1'b0;
    if(!when_Axi4LiteCrossbar_l283) begin
      if(when_Axi4LiteCrossbar_l340) begin
        s0_axi_rvalid = m0_axi_rvalid;
      end
    end
    if(!when_Axi4LiteCrossbar_l283_1) begin
      if(when_Axi4LiteCrossbar_l340_2) begin
        s0_axi_rvalid = m1_axi_rvalid;
      end
    end
    if(!when_Axi4LiteCrossbar_l283_2) begin
      if(when_Axi4LiteCrossbar_l340_4) begin
        s0_axi_rvalid = m2_axi_rvalid;
      end
    end
    if(!when_Axi4LiteCrossbar_l283_3) begin
      if(when_Axi4LiteCrossbar_l340_6) begin
        s0_axi_rvalid = m3_axi_rvalid;
      end
    end
  end

  assign _zz_io_masters_0_r_payload_data = 34'h000000000;
  always @(*) begin
    s0_axi_rdata = _zz_io_masters_0_r_payload_data[31 : 0];
    if(!when_Axi4LiteCrossbar_l283) begin
      if(when_Axi4LiteCrossbar_l340) begin
        s0_axi_rdata = m0_axi_rdata;
      end
    end
    if(!when_Axi4LiteCrossbar_l283_1) begin
      if(when_Axi4LiteCrossbar_l340_2) begin
        s0_axi_rdata = m1_axi_rdata;
      end
    end
    if(!when_Axi4LiteCrossbar_l283_2) begin
      if(when_Axi4LiteCrossbar_l340_4) begin
        s0_axi_rdata = m2_axi_rdata;
      end
    end
    if(!when_Axi4LiteCrossbar_l283_3) begin
      if(when_Axi4LiteCrossbar_l340_6) begin
        s0_axi_rdata = m3_axi_rdata;
      end
    end
  end

  always @(*) begin
    s0_axi_rresp = _zz_io_masters_0_r_payload_data[33 : 32];
    if(!when_Axi4LiteCrossbar_l283) begin
      if(when_Axi4LiteCrossbar_l340) begin
        s0_axi_rresp = m0_axi_rresp;
      end
    end
    if(!when_Axi4LiteCrossbar_l283_1) begin
      if(when_Axi4LiteCrossbar_l340_2) begin
        s0_axi_rresp = m1_axi_rresp;
      end
    end
    if(!when_Axi4LiteCrossbar_l283_2) begin
      if(when_Axi4LiteCrossbar_l340_4) begin
        s0_axi_rresp = m2_axi_rresp;
      end
    end
    if(!when_Axi4LiteCrossbar_l283_3) begin
      if(when_Axi4LiteCrossbar_l340_6) begin
        s0_axi_rresp = m3_axi_rresp;
      end
    end
  end

  always @(*) begin
    s1_axi_awready = 1'b0;
    if(when_Axi4LiteCrossbar_l194) begin
      if(when_Axi4LiteCrossbar_l206) begin
        if(when_Axi4LiteCrossbar_l210_1) begin
          s1_axi_awready = m0_axi_awready;
        end
      end
    end
    if(when_Axi4LiteCrossbar_l194_1) begin
      if(when_Axi4LiteCrossbar_l206_1) begin
        if(when_Axi4LiteCrossbar_l210_3) begin
          s1_axi_awready = m1_axi_awready;
        end
      end
    end
    if(when_Axi4LiteCrossbar_l194_2) begin
      if(when_Axi4LiteCrossbar_l206_2) begin
        if(when_Axi4LiteCrossbar_l210_5) begin
          s1_axi_awready = m2_axi_awready;
        end
      end
    end
    if(when_Axi4LiteCrossbar_l194_3) begin
      if(when_Axi4LiteCrossbar_l206_3) begin
        if(when_Axi4LiteCrossbar_l210_7) begin
          s1_axi_awready = m3_axi_awready;
        end
      end
    end
  end

  always @(*) begin
    s1_axi_wready = 1'b0;
    if(when_Axi4LiteCrossbar_l194) begin
      if(when_Axi4LiteCrossbar_l206) begin
        if(when_Axi4LiteCrossbar_l210_1) begin
          s1_axi_wready = m0_axi_wready;
        end
      end
    end else begin
      if(when_Axi4LiteCrossbar_l262_1) begin
        s1_axi_wready = m0_axi_wready;
      end
    end
    if(when_Axi4LiteCrossbar_l194_1) begin
      if(when_Axi4LiteCrossbar_l206_1) begin
        if(when_Axi4LiteCrossbar_l210_3) begin
          s1_axi_wready = m1_axi_wready;
        end
      end
    end else begin
      if(when_Axi4LiteCrossbar_l262_3) begin
        s1_axi_wready = m1_axi_wready;
      end
    end
    if(when_Axi4LiteCrossbar_l194_2) begin
      if(when_Axi4LiteCrossbar_l206_2) begin
        if(when_Axi4LiteCrossbar_l210_5) begin
          s1_axi_wready = m2_axi_wready;
        end
      end
    end else begin
      if(when_Axi4LiteCrossbar_l262_5) begin
        s1_axi_wready = m2_axi_wready;
      end
    end
    if(when_Axi4LiteCrossbar_l194_3) begin
      if(when_Axi4LiteCrossbar_l206_3) begin
        if(when_Axi4LiteCrossbar_l210_7) begin
          s1_axi_wready = m3_axi_wready;
        end
      end
    end else begin
      if(when_Axi4LiteCrossbar_l262_7) begin
        s1_axi_wready = m3_axi_wready;
      end
    end
  end

  always @(*) begin
    s1_axi_bvalid = 1'b0;
    if(!when_Axi4LiteCrossbar_l194) begin
      if(when_Axi4LiteCrossbar_l262_1) begin
        s1_axi_bvalid = m0_axi_bvalid;
      end
    end
    if(!when_Axi4LiteCrossbar_l194_1) begin
      if(when_Axi4LiteCrossbar_l262_3) begin
        s1_axi_bvalid = m1_axi_bvalid;
      end
    end
    if(!when_Axi4LiteCrossbar_l194_2) begin
      if(when_Axi4LiteCrossbar_l262_5) begin
        s1_axi_bvalid = m2_axi_bvalid;
      end
    end
    if(!when_Axi4LiteCrossbar_l194_3) begin
      if(when_Axi4LiteCrossbar_l262_7) begin
        s1_axi_bvalid = m3_axi_bvalid;
      end
    end
  end

  always @(*) begin
    s1_axi_bresp = _zz_io_masters_1_b_payload_resp[1 : 0];
    if(!when_Axi4LiteCrossbar_l194) begin
      if(when_Axi4LiteCrossbar_l262_1) begin
        s1_axi_bresp = m0_axi_bresp;
      end
    end
    if(!when_Axi4LiteCrossbar_l194_1) begin
      if(when_Axi4LiteCrossbar_l262_3) begin
        s1_axi_bresp = m1_axi_bresp;
      end
    end
    if(!when_Axi4LiteCrossbar_l194_2) begin
      if(when_Axi4LiteCrossbar_l262_5) begin
        s1_axi_bresp = m2_axi_bresp;
      end
    end
    if(!when_Axi4LiteCrossbar_l194_3) begin
      if(when_Axi4LiteCrossbar_l262_7) begin
        s1_axi_bresp = m3_axi_bresp;
      end
    end
  end

  always @(*) begin
    s1_axi_arready = 1'b0;
    if(when_Axi4LiteCrossbar_l283) begin
      if(when_Axi4LiteCrossbar_l294) begin
        if(when_Axi4LiteCrossbar_l297_1) begin
          s1_axi_arready = m0_axi_arready;
        end
      end
    end
    if(when_Axi4LiteCrossbar_l283_1) begin
      if(when_Axi4LiteCrossbar_l294_1) begin
        if(when_Axi4LiteCrossbar_l297_3) begin
          s1_axi_arready = m1_axi_arready;
        end
      end
    end
    if(when_Axi4LiteCrossbar_l283_2) begin
      if(when_Axi4LiteCrossbar_l294_2) begin
        if(when_Axi4LiteCrossbar_l297_5) begin
          s1_axi_arready = m2_axi_arready;
        end
      end
    end
    if(when_Axi4LiteCrossbar_l283_3) begin
      if(when_Axi4LiteCrossbar_l294_3) begin
        if(when_Axi4LiteCrossbar_l297_7) begin
          s1_axi_arready = m3_axi_arready;
        end
      end
    end
  end

  always @(*) begin
    s1_axi_rvalid = 1'b0;
    if(!when_Axi4LiteCrossbar_l283) begin
      if(when_Axi4LiteCrossbar_l340_1) begin
        s1_axi_rvalid = m0_axi_rvalid;
      end
    end
    if(!when_Axi4LiteCrossbar_l283_1) begin
      if(when_Axi4LiteCrossbar_l340_3) begin
        s1_axi_rvalid = m1_axi_rvalid;
      end
    end
    if(!when_Axi4LiteCrossbar_l283_2) begin
      if(when_Axi4LiteCrossbar_l340_5) begin
        s1_axi_rvalid = m2_axi_rvalid;
      end
    end
    if(!when_Axi4LiteCrossbar_l283_3) begin
      if(when_Axi4LiteCrossbar_l340_7) begin
        s1_axi_rvalid = m3_axi_rvalid;
      end
    end
  end

  assign _zz_io_masters_1_r_payload_data = 34'h000000000;
  always @(*) begin
    s1_axi_rdata = _zz_io_masters_1_r_payload_data[31 : 0];
    if(!when_Axi4LiteCrossbar_l283) begin
      if(when_Axi4LiteCrossbar_l340_1) begin
        s1_axi_rdata = m0_axi_rdata;
      end
    end
    if(!when_Axi4LiteCrossbar_l283_1) begin
      if(when_Axi4LiteCrossbar_l340_3) begin
        s1_axi_rdata = m1_axi_rdata;
      end
    end
    if(!when_Axi4LiteCrossbar_l283_2) begin
      if(when_Axi4LiteCrossbar_l340_5) begin
        s1_axi_rdata = m2_axi_rdata;
      end
    end
    if(!when_Axi4LiteCrossbar_l283_3) begin
      if(when_Axi4LiteCrossbar_l340_7) begin
        s1_axi_rdata = m3_axi_rdata;
      end
    end
  end

  always @(*) begin
    s1_axi_rresp = _zz_io_masters_1_r_payload_data[33 : 32];
    if(!when_Axi4LiteCrossbar_l283) begin
      if(when_Axi4LiteCrossbar_l340_1) begin
        s1_axi_rresp = m0_axi_rresp;
      end
    end
    if(!when_Axi4LiteCrossbar_l283_1) begin
      if(when_Axi4LiteCrossbar_l340_3) begin
        s1_axi_rresp = m1_axi_rresp;
      end
    end
    if(!when_Axi4LiteCrossbar_l283_2) begin
      if(when_Axi4LiteCrossbar_l340_5) begin
        s1_axi_rresp = m2_axi_rresp;
      end
    end
    if(!when_Axi4LiteCrossbar_l283_3) begin
      if(when_Axi4LiteCrossbar_l340_7) begin
        s1_axi_rresp = m3_axi_rresp;
      end
    end
  end

  always @(*) begin
    m0_axi_awvalid = 1'b0;
    if(when_Axi4LiteCrossbar_l194) begin
      if(when_Axi4LiteCrossbar_l206) begin
        m0_axi_awvalid = 1'b1;
      end
    end
  end

  assign _zz_io_slaves_0_aw_payload_addr = 35'h000000000;
  always @(*) begin
    m0_axi_awaddr = _zz_io_slaves_0_aw_payload_addr[31 : 0];
    if(when_Axi4LiteCrossbar_l194) begin
      if(when_Axi4LiteCrossbar_l206) begin
        if(when_Axi4LiteCrossbar_l210) begin
          m0_axi_awaddr = s0_axi_awaddr;
        end
        if(when_Axi4LiteCrossbar_l210_1) begin
          m0_axi_awaddr = s1_axi_awaddr;
        end
      end
    end
  end

  always @(*) begin
    m0_axi_awprot = _zz_io_slaves_0_aw_payload_addr[34 : 32];
    if(when_Axi4LiteCrossbar_l194) begin
      if(when_Axi4LiteCrossbar_l206) begin
        if(when_Axi4LiteCrossbar_l210) begin
          m0_axi_awprot = s0_axi_awprot;
        end
        if(when_Axi4LiteCrossbar_l210_1) begin
          m0_axi_awprot = s1_axi_awprot;
        end
      end
    end
  end

  always @(*) begin
    m0_axi_wvalid = 1'b0;
    if(when_Axi4LiteCrossbar_l194) begin
      if(when_Axi4LiteCrossbar_l206) begin
        if(when_Axi4LiteCrossbar_l210) begin
          m0_axi_wvalid = s0_axi_wvalid;
        end
        if(when_Axi4LiteCrossbar_l210_1) begin
          m0_axi_wvalid = s1_axi_wvalid;
        end
      end
    end else begin
      if(when_Axi4LiteCrossbar_l262) begin
        m0_axi_wvalid = s0_axi_wvalid;
      end
      if(when_Axi4LiteCrossbar_l262_1) begin
        m0_axi_wvalid = s1_axi_wvalid;
      end
    end
  end

  assign _zz_io_slaves_0_w_payload_data = 36'h000000000;
  always @(*) begin
    m0_axi_wdata = _zz_io_slaves_0_w_payload_data[31 : 0];
    if(when_Axi4LiteCrossbar_l194) begin
      if(when_Axi4LiteCrossbar_l206) begin
        if(when_Axi4LiteCrossbar_l210) begin
          m0_axi_wdata = s0_axi_wdata;
        end
        if(when_Axi4LiteCrossbar_l210_1) begin
          m0_axi_wdata = s1_axi_wdata;
        end
      end
    end else begin
      if(when_Axi4LiteCrossbar_l262) begin
        m0_axi_wdata = s0_axi_wdata;
      end
      if(when_Axi4LiteCrossbar_l262_1) begin
        m0_axi_wdata = s1_axi_wdata;
      end
    end
  end

  always @(*) begin
    m0_axi_wstrb = _zz_io_slaves_0_w_payload_data[35 : 32];
    if(when_Axi4LiteCrossbar_l194) begin
      if(when_Axi4LiteCrossbar_l206) begin
        if(when_Axi4LiteCrossbar_l210) begin
          m0_axi_wstrb = s0_axi_wstrb;
        end
        if(when_Axi4LiteCrossbar_l210_1) begin
          m0_axi_wstrb = s1_axi_wstrb;
        end
      end
    end else begin
      if(when_Axi4LiteCrossbar_l262) begin
        m0_axi_wstrb = s0_axi_wstrb;
      end
      if(when_Axi4LiteCrossbar_l262_1) begin
        m0_axi_wstrb = s1_axi_wstrb;
      end
    end
  end

  always @(*) begin
    m0_axi_bready = 1'b0;
    if(!when_Axi4LiteCrossbar_l194) begin
      if(when_Axi4LiteCrossbar_l262) begin
        m0_axi_bready = s0_axi_bready;
      end
      if(when_Axi4LiteCrossbar_l262_1) begin
        m0_axi_bready = s1_axi_bready;
      end
    end
  end

  always @(*) begin
    m0_axi_arvalid = 1'b0;
    if(when_Axi4LiteCrossbar_l283) begin
      if(when_Axi4LiteCrossbar_l294) begin
        m0_axi_arvalid = 1'b1;
      end
    end
  end

  assign _zz_io_slaves_0_ar_payload_addr = 35'h000000000;
  always @(*) begin
    m0_axi_araddr = _zz_io_slaves_0_ar_payload_addr[31 : 0];
    if(when_Axi4LiteCrossbar_l283) begin
      if(when_Axi4LiteCrossbar_l294) begin
        if(when_Axi4LiteCrossbar_l297) begin
          m0_axi_araddr = s0_axi_araddr;
        end
        if(when_Axi4LiteCrossbar_l297_1) begin
          m0_axi_araddr = s1_axi_araddr;
        end
      end
    end
  end

  always @(*) begin
    m0_axi_arprot = _zz_io_slaves_0_ar_payload_addr[34 : 32];
    if(when_Axi4LiteCrossbar_l283) begin
      if(when_Axi4LiteCrossbar_l294) begin
        if(when_Axi4LiteCrossbar_l297) begin
          m0_axi_arprot = s0_axi_arprot;
        end
        if(when_Axi4LiteCrossbar_l297_1) begin
          m0_axi_arprot = s1_axi_arprot;
        end
      end
    end
  end

  always @(*) begin
    m0_axi_rready = 1'b0;
    if(!when_Axi4LiteCrossbar_l283) begin
      if(when_Axi4LiteCrossbar_l340) begin
        m0_axi_rready = s0_axi_rready;
      end
      if(when_Axi4LiteCrossbar_l340_1) begin
        m0_axi_rready = s1_axi_rready;
      end
    end
  end

  always @(*) begin
    m1_axi_awvalid = 1'b0;
    if(when_Axi4LiteCrossbar_l194_1) begin
      if(when_Axi4LiteCrossbar_l206_1) begin
        m1_axi_awvalid = 1'b1;
      end
    end
  end

  assign _zz_io_slaves_1_aw_payload_addr = 35'h000000000;
  always @(*) begin
    m1_axi_awaddr = _zz_io_slaves_1_aw_payload_addr[31 : 0];
    if(when_Axi4LiteCrossbar_l194_1) begin
      if(when_Axi4LiteCrossbar_l206_1) begin
        if(when_Axi4LiteCrossbar_l210_2) begin
          m1_axi_awaddr = s0_axi_awaddr;
        end
        if(when_Axi4LiteCrossbar_l210_3) begin
          m1_axi_awaddr = s1_axi_awaddr;
        end
      end
    end
  end

  always @(*) begin
    m1_axi_awprot = _zz_io_slaves_1_aw_payload_addr[34 : 32];
    if(when_Axi4LiteCrossbar_l194_1) begin
      if(when_Axi4LiteCrossbar_l206_1) begin
        if(when_Axi4LiteCrossbar_l210_2) begin
          m1_axi_awprot = s0_axi_awprot;
        end
        if(when_Axi4LiteCrossbar_l210_3) begin
          m1_axi_awprot = s1_axi_awprot;
        end
      end
    end
  end

  always @(*) begin
    m1_axi_wvalid = 1'b0;
    if(when_Axi4LiteCrossbar_l194_1) begin
      if(when_Axi4LiteCrossbar_l206_1) begin
        if(when_Axi4LiteCrossbar_l210_2) begin
          m1_axi_wvalid = s0_axi_wvalid;
        end
        if(when_Axi4LiteCrossbar_l210_3) begin
          m1_axi_wvalid = s1_axi_wvalid;
        end
      end
    end else begin
      if(when_Axi4LiteCrossbar_l262_2) begin
        m1_axi_wvalid = s0_axi_wvalid;
      end
      if(when_Axi4LiteCrossbar_l262_3) begin
        m1_axi_wvalid = s1_axi_wvalid;
      end
    end
  end

  assign _zz_io_slaves_1_w_payload_data = 36'h000000000;
  always @(*) begin
    m1_axi_wdata = _zz_io_slaves_1_w_payload_data[31 : 0];
    if(when_Axi4LiteCrossbar_l194_1) begin
      if(when_Axi4LiteCrossbar_l206_1) begin
        if(when_Axi4LiteCrossbar_l210_2) begin
          m1_axi_wdata = s0_axi_wdata;
        end
        if(when_Axi4LiteCrossbar_l210_3) begin
          m1_axi_wdata = s1_axi_wdata;
        end
      end
    end else begin
      if(when_Axi4LiteCrossbar_l262_2) begin
        m1_axi_wdata = s0_axi_wdata;
      end
      if(when_Axi4LiteCrossbar_l262_3) begin
        m1_axi_wdata = s1_axi_wdata;
      end
    end
  end

  always @(*) begin
    m1_axi_wstrb = _zz_io_slaves_1_w_payload_data[35 : 32];
    if(when_Axi4LiteCrossbar_l194_1) begin
      if(when_Axi4LiteCrossbar_l206_1) begin
        if(when_Axi4LiteCrossbar_l210_2) begin
          m1_axi_wstrb = s0_axi_wstrb;
        end
        if(when_Axi4LiteCrossbar_l210_3) begin
          m1_axi_wstrb = s1_axi_wstrb;
        end
      end
    end else begin
      if(when_Axi4LiteCrossbar_l262_2) begin
        m1_axi_wstrb = s0_axi_wstrb;
      end
      if(when_Axi4LiteCrossbar_l262_3) begin
        m1_axi_wstrb = s1_axi_wstrb;
      end
    end
  end

  always @(*) begin
    m1_axi_bready = 1'b0;
    if(!when_Axi4LiteCrossbar_l194_1) begin
      if(when_Axi4LiteCrossbar_l262_2) begin
        m1_axi_bready = s0_axi_bready;
      end
      if(when_Axi4LiteCrossbar_l262_3) begin
        m1_axi_bready = s1_axi_bready;
      end
    end
  end

  always @(*) begin
    m1_axi_arvalid = 1'b0;
    if(when_Axi4LiteCrossbar_l283_1) begin
      if(when_Axi4LiteCrossbar_l294_1) begin
        m1_axi_arvalid = 1'b1;
      end
    end
  end

  assign _zz_io_slaves_1_ar_payload_addr = 35'h000000000;
  always @(*) begin
    m1_axi_araddr = _zz_io_slaves_1_ar_payload_addr[31 : 0];
    if(when_Axi4LiteCrossbar_l283_1) begin
      if(when_Axi4LiteCrossbar_l294_1) begin
        if(when_Axi4LiteCrossbar_l297_2) begin
          m1_axi_araddr = s0_axi_araddr;
        end
        if(when_Axi4LiteCrossbar_l297_3) begin
          m1_axi_araddr = s1_axi_araddr;
        end
      end
    end
  end

  always @(*) begin
    m1_axi_arprot = _zz_io_slaves_1_ar_payload_addr[34 : 32];
    if(when_Axi4LiteCrossbar_l283_1) begin
      if(when_Axi4LiteCrossbar_l294_1) begin
        if(when_Axi4LiteCrossbar_l297_2) begin
          m1_axi_arprot = s0_axi_arprot;
        end
        if(when_Axi4LiteCrossbar_l297_3) begin
          m1_axi_arprot = s1_axi_arprot;
        end
      end
    end
  end

  always @(*) begin
    m1_axi_rready = 1'b0;
    if(!when_Axi4LiteCrossbar_l283_1) begin
      if(when_Axi4LiteCrossbar_l340_2) begin
        m1_axi_rready = s0_axi_rready;
      end
      if(when_Axi4LiteCrossbar_l340_3) begin
        m1_axi_rready = s1_axi_rready;
      end
    end
  end

  always @(*) begin
    m2_axi_awvalid = 1'b0;
    if(when_Axi4LiteCrossbar_l194_2) begin
      if(when_Axi4LiteCrossbar_l206_2) begin
        m2_axi_awvalid = 1'b1;
      end
    end
  end

  assign _zz_io_slaves_2_aw_payload_addr = 35'h000000000;
  always @(*) begin
    m2_axi_awaddr = _zz_io_slaves_2_aw_payload_addr[31 : 0];
    if(when_Axi4LiteCrossbar_l194_2) begin
      if(when_Axi4LiteCrossbar_l206_2) begin
        if(when_Axi4LiteCrossbar_l210_4) begin
          m2_axi_awaddr = s0_axi_awaddr;
        end
        if(when_Axi4LiteCrossbar_l210_5) begin
          m2_axi_awaddr = s1_axi_awaddr;
        end
      end
    end
  end

  always @(*) begin
    m2_axi_awprot = _zz_io_slaves_2_aw_payload_addr[34 : 32];
    if(when_Axi4LiteCrossbar_l194_2) begin
      if(when_Axi4LiteCrossbar_l206_2) begin
        if(when_Axi4LiteCrossbar_l210_4) begin
          m2_axi_awprot = s0_axi_awprot;
        end
        if(when_Axi4LiteCrossbar_l210_5) begin
          m2_axi_awprot = s1_axi_awprot;
        end
      end
    end
  end

  always @(*) begin
    m2_axi_wvalid = 1'b0;
    if(when_Axi4LiteCrossbar_l194_2) begin
      if(when_Axi4LiteCrossbar_l206_2) begin
        if(when_Axi4LiteCrossbar_l210_4) begin
          m2_axi_wvalid = s0_axi_wvalid;
        end
        if(when_Axi4LiteCrossbar_l210_5) begin
          m2_axi_wvalid = s1_axi_wvalid;
        end
      end
    end else begin
      if(when_Axi4LiteCrossbar_l262_4) begin
        m2_axi_wvalid = s0_axi_wvalid;
      end
      if(when_Axi4LiteCrossbar_l262_5) begin
        m2_axi_wvalid = s1_axi_wvalid;
      end
    end
  end

  assign _zz_io_slaves_2_w_payload_data = 36'h000000000;
  always @(*) begin
    m2_axi_wdata = _zz_io_slaves_2_w_payload_data[31 : 0];
    if(when_Axi4LiteCrossbar_l194_2) begin
      if(when_Axi4LiteCrossbar_l206_2) begin
        if(when_Axi4LiteCrossbar_l210_4) begin
          m2_axi_wdata = s0_axi_wdata;
        end
        if(when_Axi4LiteCrossbar_l210_5) begin
          m2_axi_wdata = s1_axi_wdata;
        end
      end
    end else begin
      if(when_Axi4LiteCrossbar_l262_4) begin
        m2_axi_wdata = s0_axi_wdata;
      end
      if(when_Axi4LiteCrossbar_l262_5) begin
        m2_axi_wdata = s1_axi_wdata;
      end
    end
  end

  always @(*) begin
    m2_axi_wstrb = _zz_io_slaves_2_w_payload_data[35 : 32];
    if(when_Axi4LiteCrossbar_l194_2) begin
      if(when_Axi4LiteCrossbar_l206_2) begin
        if(when_Axi4LiteCrossbar_l210_4) begin
          m2_axi_wstrb = s0_axi_wstrb;
        end
        if(when_Axi4LiteCrossbar_l210_5) begin
          m2_axi_wstrb = s1_axi_wstrb;
        end
      end
    end else begin
      if(when_Axi4LiteCrossbar_l262_4) begin
        m2_axi_wstrb = s0_axi_wstrb;
      end
      if(when_Axi4LiteCrossbar_l262_5) begin
        m2_axi_wstrb = s1_axi_wstrb;
      end
    end
  end

  always @(*) begin
    m2_axi_bready = 1'b0;
    if(!when_Axi4LiteCrossbar_l194_2) begin
      if(when_Axi4LiteCrossbar_l262_4) begin
        m2_axi_bready = s0_axi_bready;
      end
      if(when_Axi4LiteCrossbar_l262_5) begin
        m2_axi_bready = s1_axi_bready;
      end
    end
  end

  always @(*) begin
    m2_axi_arvalid = 1'b0;
    if(when_Axi4LiteCrossbar_l283_2) begin
      if(when_Axi4LiteCrossbar_l294_2) begin
        m2_axi_arvalid = 1'b1;
      end
    end
  end

  assign _zz_io_slaves_2_ar_payload_addr = 35'h000000000;
  always @(*) begin
    m2_axi_araddr = _zz_io_slaves_2_ar_payload_addr[31 : 0];
    if(when_Axi4LiteCrossbar_l283_2) begin
      if(when_Axi4LiteCrossbar_l294_2) begin
        if(when_Axi4LiteCrossbar_l297_4) begin
          m2_axi_araddr = s0_axi_araddr;
        end
        if(when_Axi4LiteCrossbar_l297_5) begin
          m2_axi_araddr = s1_axi_araddr;
        end
      end
    end
  end

  always @(*) begin
    m2_axi_arprot = _zz_io_slaves_2_ar_payload_addr[34 : 32];
    if(when_Axi4LiteCrossbar_l283_2) begin
      if(when_Axi4LiteCrossbar_l294_2) begin
        if(when_Axi4LiteCrossbar_l297_4) begin
          m2_axi_arprot = s0_axi_arprot;
        end
        if(when_Axi4LiteCrossbar_l297_5) begin
          m2_axi_arprot = s1_axi_arprot;
        end
      end
    end
  end

  always @(*) begin
    m2_axi_rready = 1'b0;
    if(!when_Axi4LiteCrossbar_l283_2) begin
      if(when_Axi4LiteCrossbar_l340_4) begin
        m2_axi_rready = s0_axi_rready;
      end
      if(when_Axi4LiteCrossbar_l340_5) begin
        m2_axi_rready = s1_axi_rready;
      end
    end
  end

  always @(*) begin
    m3_axi_awvalid = 1'b0;
    if(when_Axi4LiteCrossbar_l194_3) begin
      if(when_Axi4LiteCrossbar_l206_3) begin
        m3_axi_awvalid = 1'b1;
      end
    end
  end

  assign _zz_io_slaves_3_aw_payload_addr = 35'h000000000;
  always @(*) begin
    m3_axi_awaddr = _zz_io_slaves_3_aw_payload_addr[31 : 0];
    if(when_Axi4LiteCrossbar_l194_3) begin
      if(when_Axi4LiteCrossbar_l206_3) begin
        if(when_Axi4LiteCrossbar_l210_6) begin
          m3_axi_awaddr = s0_axi_awaddr;
        end
        if(when_Axi4LiteCrossbar_l210_7) begin
          m3_axi_awaddr = s1_axi_awaddr;
        end
      end
    end
  end

  always @(*) begin
    m3_axi_awprot = _zz_io_slaves_3_aw_payload_addr[34 : 32];
    if(when_Axi4LiteCrossbar_l194_3) begin
      if(when_Axi4LiteCrossbar_l206_3) begin
        if(when_Axi4LiteCrossbar_l210_6) begin
          m3_axi_awprot = s0_axi_awprot;
        end
        if(when_Axi4LiteCrossbar_l210_7) begin
          m3_axi_awprot = s1_axi_awprot;
        end
      end
    end
  end

  always @(*) begin
    m3_axi_wvalid = 1'b0;
    if(when_Axi4LiteCrossbar_l194_3) begin
      if(when_Axi4LiteCrossbar_l206_3) begin
        if(when_Axi4LiteCrossbar_l210_6) begin
          m3_axi_wvalid = s0_axi_wvalid;
        end
        if(when_Axi4LiteCrossbar_l210_7) begin
          m3_axi_wvalid = s1_axi_wvalid;
        end
      end
    end else begin
      if(when_Axi4LiteCrossbar_l262_6) begin
        m3_axi_wvalid = s0_axi_wvalid;
      end
      if(when_Axi4LiteCrossbar_l262_7) begin
        m3_axi_wvalid = s1_axi_wvalid;
      end
    end
  end

  assign _zz_io_slaves_3_w_payload_data = 36'h000000000;
  always @(*) begin
    m3_axi_wdata = _zz_io_slaves_3_w_payload_data[31 : 0];
    if(when_Axi4LiteCrossbar_l194_3) begin
      if(when_Axi4LiteCrossbar_l206_3) begin
        if(when_Axi4LiteCrossbar_l210_6) begin
          m3_axi_wdata = s0_axi_wdata;
        end
        if(when_Axi4LiteCrossbar_l210_7) begin
          m3_axi_wdata = s1_axi_wdata;
        end
      end
    end else begin
      if(when_Axi4LiteCrossbar_l262_6) begin
        m3_axi_wdata = s0_axi_wdata;
      end
      if(when_Axi4LiteCrossbar_l262_7) begin
        m3_axi_wdata = s1_axi_wdata;
      end
    end
  end

  always @(*) begin
    m3_axi_wstrb = _zz_io_slaves_3_w_payload_data[35 : 32];
    if(when_Axi4LiteCrossbar_l194_3) begin
      if(when_Axi4LiteCrossbar_l206_3) begin
        if(when_Axi4LiteCrossbar_l210_6) begin
          m3_axi_wstrb = s0_axi_wstrb;
        end
        if(when_Axi4LiteCrossbar_l210_7) begin
          m3_axi_wstrb = s1_axi_wstrb;
        end
      end
    end else begin
      if(when_Axi4LiteCrossbar_l262_6) begin
        m3_axi_wstrb = s0_axi_wstrb;
      end
      if(when_Axi4LiteCrossbar_l262_7) begin
        m3_axi_wstrb = s1_axi_wstrb;
      end
    end
  end

  always @(*) begin
    m3_axi_bready = 1'b0;
    if(!when_Axi4LiteCrossbar_l194_3) begin
      if(when_Axi4LiteCrossbar_l262_6) begin
        m3_axi_bready = s0_axi_bready;
      end
      if(when_Axi4LiteCrossbar_l262_7) begin
        m3_axi_bready = s1_axi_bready;
      end
    end
  end

  always @(*) begin
    m3_axi_arvalid = 1'b0;
    if(when_Axi4LiteCrossbar_l283_3) begin
      if(when_Axi4LiteCrossbar_l294_3) begin
        m3_axi_arvalid = 1'b1;
      end
    end
  end

  assign _zz_io_slaves_3_ar_payload_addr = 35'h000000000;
  always @(*) begin
    m3_axi_araddr = _zz_io_slaves_3_ar_payload_addr[31 : 0];
    if(when_Axi4LiteCrossbar_l283_3) begin
      if(when_Axi4LiteCrossbar_l294_3) begin
        if(when_Axi4LiteCrossbar_l297_6) begin
          m3_axi_araddr = s0_axi_araddr;
        end
        if(when_Axi4LiteCrossbar_l297_7) begin
          m3_axi_araddr = s1_axi_araddr;
        end
      end
    end
  end

  always @(*) begin
    m3_axi_arprot = _zz_io_slaves_3_ar_payload_addr[34 : 32];
    if(when_Axi4LiteCrossbar_l283_3) begin
      if(when_Axi4LiteCrossbar_l294_3) begin
        if(when_Axi4LiteCrossbar_l297_6) begin
          m3_axi_arprot = s0_axi_arprot;
        end
        if(when_Axi4LiteCrossbar_l297_7) begin
          m3_axi_arprot = s1_axi_arprot;
        end
      end
    end
  end

  always @(*) begin
    m3_axi_rready = 1'b0;
    if(!when_Axi4LiteCrossbar_l283_3) begin
      if(when_Axi4LiteCrossbar_l340_6) begin
        m3_axi_rready = s0_axi_rready;
      end
      if(when_Axi4LiteCrossbar_l340_7) begin
        m3_axi_rready = s1_axi_rready;
      end
    end
  end

  assign when_Axi4LiteCrossbar_l194 = (! wrActive_0);
  always @(*) begin
    _zz_when_Axi4LiteCrossbar_l206_1[0] = ((32'h00000000 <= s0_axi_awaddr) && (s0_axi_awaddr < 32'h00001000));
    _zz_when_Axi4LiteCrossbar_l206_1[1] = ((32'h00010000 <= s0_axi_awaddr) && (s0_axi_awaddr < 32'h00011000));
    _zz_when_Axi4LiteCrossbar_l206_1[2] = ((32'h00020000 <= s0_axi_awaddr) && (s0_axi_awaddr < 32'h00021000));
    _zz_when_Axi4LiteCrossbar_l206_1[3] = ((32'h00030000 <= s0_axi_awaddr) && (s0_axi_awaddr < 32'h00031000));
  end

  always @(*) begin
    _zz_when_Axi4LiteCrossbar_l206[0] = (s0_axi_awvalid && _zz_when_Axi4LiteCrossbar_l206_1[0]);
    _zz_when_Axi4LiteCrossbar_l206[1] = (s1_axi_awvalid && _zz_when_Axi4LiteCrossbar_l206_2[0]);
  end

  always @(*) begin
    _zz_when_Axi4LiteCrossbar_l206_2[0] = ((32'h00000000 <= s1_axi_awaddr) && (s1_axi_awaddr < 32'h00001000));
    _zz_when_Axi4LiteCrossbar_l206_2[1] = ((32'h00010000 <= s1_axi_awaddr) && (s1_axi_awaddr < 32'h00011000));
    _zz_when_Axi4LiteCrossbar_l206_2[2] = ((32'h00020000 <= s1_axi_awaddr) && (s1_axi_awaddr < 32'h00021000));
    _zz_when_Axi4LiteCrossbar_l206_2[3] = ((32'h00030000 <= s1_axi_awaddr) && (s1_axi_awaddr < 32'h00031000));
  end

  assign _zz_when_Axi4LiteCrossbar_l131 = _zz_when_Axi4LiteCrossbar_l206;
  assign _zz_when_Axi4LiteCrossbar_l131_1 = (_zz_when_Axi4LiteCrossbar_l131 & (~ _zz__zz_when_Axi4LiteCrossbar_l131_1));
  always @(*) begin
    _zz_wrGranted_0 = 1'b0;
    if(when_Axi4LiteCrossbar_l131) begin
      _zz_wrGranted_0 = 1'b0;
    end
    if(when_Axi4LiteCrossbar_l131_1) begin
      _zz_wrGranted_0 = 1'b1;
    end
  end

  assign when_Axi4LiteCrossbar_l131 = _zz_when_Axi4LiteCrossbar_l131_1[0];
  assign when_Axi4LiteCrossbar_l131_1 = _zz_when_Axi4LiteCrossbar_l131_1[1];
  assign when_Axi4LiteCrossbar_l206 = (|_zz_when_Axi4LiteCrossbar_l206);
  assign when_Axi4LiteCrossbar_l210 = (_zz_wrGranted_0 == 1'b0);
  assign when_Axi4LiteCrossbar_l210_1 = (_zz_wrGranted_0 == 1'b1);
  assign io_slaves_0_aw_fire = (m0_axi_awvalid && m0_axi_awready);
  assign when_Axi4LiteCrossbar_l262 = (wrGranted_0 == 1'b0);
  assign when_Axi4LiteCrossbar_l262_1 = (wrGranted_0 == 1'b1);
  assign io_slaves_0_b_fire = (m0_axi_bvalid && m0_axi_bready);
  assign when_Axi4LiteCrossbar_l194_1 = (! wrActive_1);
  always @(*) begin
    _zz_when_Axi4LiteCrossbar_l206_4[0] = ((32'h00000000 <= s0_axi_awaddr) && (s0_axi_awaddr < 32'h00001000));
    _zz_when_Axi4LiteCrossbar_l206_4[1] = ((32'h00010000 <= s0_axi_awaddr) && (s0_axi_awaddr < 32'h00011000));
    _zz_when_Axi4LiteCrossbar_l206_4[2] = ((32'h00020000 <= s0_axi_awaddr) && (s0_axi_awaddr < 32'h00021000));
    _zz_when_Axi4LiteCrossbar_l206_4[3] = ((32'h00030000 <= s0_axi_awaddr) && (s0_axi_awaddr < 32'h00031000));
  end

  always @(*) begin
    _zz_when_Axi4LiteCrossbar_l206_3[0] = (s0_axi_awvalid && _zz_when_Axi4LiteCrossbar_l206_4[1]);
    _zz_when_Axi4LiteCrossbar_l206_3[1] = (s1_axi_awvalid && _zz_when_Axi4LiteCrossbar_l206_5[1]);
  end

  always @(*) begin
    _zz_when_Axi4LiteCrossbar_l206_5[0] = ((32'h00000000 <= s1_axi_awaddr) && (s1_axi_awaddr < 32'h00001000));
    _zz_when_Axi4LiteCrossbar_l206_5[1] = ((32'h00010000 <= s1_axi_awaddr) && (s1_axi_awaddr < 32'h00011000));
    _zz_when_Axi4LiteCrossbar_l206_5[2] = ((32'h00020000 <= s1_axi_awaddr) && (s1_axi_awaddr < 32'h00021000));
    _zz_when_Axi4LiteCrossbar_l206_5[3] = ((32'h00030000 <= s1_axi_awaddr) && (s1_axi_awaddr < 32'h00031000));
  end

  assign _zz_when_Axi4LiteCrossbar_l131_2 = _zz_when_Axi4LiteCrossbar_l206_3;
  assign _zz_when_Axi4LiteCrossbar_l131_3 = (_zz_when_Axi4LiteCrossbar_l131_2 & (~ _zz__zz_when_Axi4LiteCrossbar_l131_3));
  always @(*) begin
    _zz_wrGranted_1 = 1'b0;
    if(when_Axi4LiteCrossbar_l131_2) begin
      _zz_wrGranted_1 = 1'b0;
    end
    if(when_Axi4LiteCrossbar_l131_3) begin
      _zz_wrGranted_1 = 1'b1;
    end
  end

  assign when_Axi4LiteCrossbar_l131_2 = _zz_when_Axi4LiteCrossbar_l131_3[0];
  assign when_Axi4LiteCrossbar_l131_3 = _zz_when_Axi4LiteCrossbar_l131_3[1];
  assign when_Axi4LiteCrossbar_l206_1 = (|_zz_when_Axi4LiteCrossbar_l206_3);
  assign when_Axi4LiteCrossbar_l210_2 = (_zz_wrGranted_1 == 1'b0);
  assign when_Axi4LiteCrossbar_l210_3 = (_zz_wrGranted_1 == 1'b1);
  assign io_slaves_1_aw_fire = (m1_axi_awvalid && m1_axi_awready);
  assign when_Axi4LiteCrossbar_l262_2 = (wrGranted_1 == 1'b0);
  assign when_Axi4LiteCrossbar_l262_3 = (wrGranted_1 == 1'b1);
  assign io_slaves_1_b_fire = (m1_axi_bvalid && m1_axi_bready);
  assign when_Axi4LiteCrossbar_l194_2 = (! wrActive_2);
  always @(*) begin
    _zz_when_Axi4LiteCrossbar_l206_7[0] = ((32'h00000000 <= s0_axi_awaddr) && (s0_axi_awaddr < 32'h00001000));
    _zz_when_Axi4LiteCrossbar_l206_7[1] = ((32'h00010000 <= s0_axi_awaddr) && (s0_axi_awaddr < 32'h00011000));
    _zz_when_Axi4LiteCrossbar_l206_7[2] = ((32'h00020000 <= s0_axi_awaddr) && (s0_axi_awaddr < 32'h00021000));
    _zz_when_Axi4LiteCrossbar_l206_7[3] = ((32'h00030000 <= s0_axi_awaddr) && (s0_axi_awaddr < 32'h00031000));
  end

  always @(*) begin
    _zz_when_Axi4LiteCrossbar_l206_6[0] = (s0_axi_awvalid && _zz_when_Axi4LiteCrossbar_l206_7[2]);
    _zz_when_Axi4LiteCrossbar_l206_6[1] = (s1_axi_awvalid && _zz_when_Axi4LiteCrossbar_l206_8[2]);
  end

  always @(*) begin
    _zz_when_Axi4LiteCrossbar_l206_8[0] = ((32'h00000000 <= s1_axi_awaddr) && (s1_axi_awaddr < 32'h00001000));
    _zz_when_Axi4LiteCrossbar_l206_8[1] = ((32'h00010000 <= s1_axi_awaddr) && (s1_axi_awaddr < 32'h00011000));
    _zz_when_Axi4LiteCrossbar_l206_8[2] = ((32'h00020000 <= s1_axi_awaddr) && (s1_axi_awaddr < 32'h00021000));
    _zz_when_Axi4LiteCrossbar_l206_8[3] = ((32'h00030000 <= s1_axi_awaddr) && (s1_axi_awaddr < 32'h00031000));
  end

  assign _zz_when_Axi4LiteCrossbar_l131_4 = _zz_when_Axi4LiteCrossbar_l206_6;
  assign _zz_when_Axi4LiteCrossbar_l131_5 = (_zz_when_Axi4LiteCrossbar_l131_4 & (~ _zz__zz_when_Axi4LiteCrossbar_l131_5));
  always @(*) begin
    _zz_wrGranted_2 = 1'b0;
    if(when_Axi4LiteCrossbar_l131_4) begin
      _zz_wrGranted_2 = 1'b0;
    end
    if(when_Axi4LiteCrossbar_l131_5) begin
      _zz_wrGranted_2 = 1'b1;
    end
  end

  assign when_Axi4LiteCrossbar_l131_4 = _zz_when_Axi4LiteCrossbar_l131_5[0];
  assign when_Axi4LiteCrossbar_l131_5 = _zz_when_Axi4LiteCrossbar_l131_5[1];
  assign when_Axi4LiteCrossbar_l206_2 = (|_zz_when_Axi4LiteCrossbar_l206_6);
  assign when_Axi4LiteCrossbar_l210_4 = (_zz_wrGranted_2 == 1'b0);
  assign when_Axi4LiteCrossbar_l210_5 = (_zz_wrGranted_2 == 1'b1);
  assign io_slaves_2_aw_fire = (m2_axi_awvalid && m2_axi_awready);
  assign when_Axi4LiteCrossbar_l262_4 = (wrGranted_2 == 1'b0);
  assign when_Axi4LiteCrossbar_l262_5 = (wrGranted_2 == 1'b1);
  assign io_slaves_2_b_fire = (m2_axi_bvalid && m2_axi_bready);
  assign when_Axi4LiteCrossbar_l194_3 = (! wrActive_3);
  always @(*) begin
    _zz_when_Axi4LiteCrossbar_l206_10[0] = ((32'h00000000 <= s0_axi_awaddr) && (s0_axi_awaddr < 32'h00001000));
    _zz_when_Axi4LiteCrossbar_l206_10[1] = ((32'h00010000 <= s0_axi_awaddr) && (s0_axi_awaddr < 32'h00011000));
    _zz_when_Axi4LiteCrossbar_l206_10[2] = ((32'h00020000 <= s0_axi_awaddr) && (s0_axi_awaddr < 32'h00021000));
    _zz_when_Axi4LiteCrossbar_l206_10[3] = ((32'h00030000 <= s0_axi_awaddr) && (s0_axi_awaddr < 32'h00031000));
  end

  always @(*) begin
    _zz_when_Axi4LiteCrossbar_l206_9[0] = (s0_axi_awvalid && _zz_when_Axi4LiteCrossbar_l206_10[3]);
    _zz_when_Axi4LiteCrossbar_l206_9[1] = (s1_axi_awvalid && _zz_when_Axi4LiteCrossbar_l206_11[3]);
  end

  always @(*) begin
    _zz_when_Axi4LiteCrossbar_l206_11[0] = ((32'h00000000 <= s1_axi_awaddr) && (s1_axi_awaddr < 32'h00001000));
    _zz_when_Axi4LiteCrossbar_l206_11[1] = ((32'h00010000 <= s1_axi_awaddr) && (s1_axi_awaddr < 32'h00011000));
    _zz_when_Axi4LiteCrossbar_l206_11[2] = ((32'h00020000 <= s1_axi_awaddr) && (s1_axi_awaddr < 32'h00021000));
    _zz_when_Axi4LiteCrossbar_l206_11[3] = ((32'h00030000 <= s1_axi_awaddr) && (s1_axi_awaddr < 32'h00031000));
  end

  assign _zz_when_Axi4LiteCrossbar_l131_6 = _zz_when_Axi4LiteCrossbar_l206_9;
  assign _zz_when_Axi4LiteCrossbar_l131_7 = (_zz_when_Axi4LiteCrossbar_l131_6 & (~ _zz__zz_when_Axi4LiteCrossbar_l131_7));
  always @(*) begin
    _zz_wrGranted_3 = 1'b0;
    if(when_Axi4LiteCrossbar_l131_6) begin
      _zz_wrGranted_3 = 1'b0;
    end
    if(when_Axi4LiteCrossbar_l131_7) begin
      _zz_wrGranted_3 = 1'b1;
    end
  end

  assign when_Axi4LiteCrossbar_l131_6 = _zz_when_Axi4LiteCrossbar_l131_7[0];
  assign when_Axi4LiteCrossbar_l131_7 = _zz_when_Axi4LiteCrossbar_l131_7[1];
  assign when_Axi4LiteCrossbar_l206_3 = (|_zz_when_Axi4LiteCrossbar_l206_9);
  assign when_Axi4LiteCrossbar_l210_6 = (_zz_wrGranted_3 == 1'b0);
  assign when_Axi4LiteCrossbar_l210_7 = (_zz_wrGranted_3 == 1'b1);
  assign io_slaves_3_aw_fire = (m3_axi_awvalid && m3_axi_awready);
  assign when_Axi4LiteCrossbar_l262_6 = (wrGranted_3 == 1'b0);
  assign when_Axi4LiteCrossbar_l262_7 = (wrGranted_3 == 1'b1);
  assign io_slaves_3_b_fire = (m3_axi_bvalid && m3_axi_bready);
  assign when_Axi4LiteCrossbar_l283 = (! rdActive_0);
  always @(*) begin
    _zz_when_Axi4LiteCrossbar_l294_1[0] = ((32'h00000000 <= s0_axi_araddr) && (s0_axi_araddr < 32'h00001000));
    _zz_when_Axi4LiteCrossbar_l294_1[1] = ((32'h00010000 <= s0_axi_araddr) && (s0_axi_araddr < 32'h00011000));
    _zz_when_Axi4LiteCrossbar_l294_1[2] = ((32'h00020000 <= s0_axi_araddr) && (s0_axi_araddr < 32'h00021000));
    _zz_when_Axi4LiteCrossbar_l294_1[3] = ((32'h00030000 <= s0_axi_araddr) && (s0_axi_araddr < 32'h00031000));
  end

  always @(*) begin
    _zz_when_Axi4LiteCrossbar_l294[0] = (s0_axi_arvalid && _zz_when_Axi4LiteCrossbar_l294_1[0]);
    _zz_when_Axi4LiteCrossbar_l294[1] = (s1_axi_arvalid && _zz_when_Axi4LiteCrossbar_l294_2[0]);
  end

  always @(*) begin
    _zz_when_Axi4LiteCrossbar_l294_2[0] = ((32'h00000000 <= s1_axi_araddr) && (s1_axi_araddr < 32'h00001000));
    _zz_when_Axi4LiteCrossbar_l294_2[1] = ((32'h00010000 <= s1_axi_araddr) && (s1_axi_araddr < 32'h00011000));
    _zz_when_Axi4LiteCrossbar_l294_2[2] = ((32'h00020000 <= s1_axi_araddr) && (s1_axi_araddr < 32'h00021000));
    _zz_when_Axi4LiteCrossbar_l294_2[3] = ((32'h00030000 <= s1_axi_araddr) && (s1_axi_araddr < 32'h00031000));
  end

  assign _zz_when_Axi4LiteCrossbar_l131_8 = _zz_when_Axi4LiteCrossbar_l294;
  assign _zz_when_Axi4LiteCrossbar_l131_9 = (_zz_when_Axi4LiteCrossbar_l131_8 & (~ _zz__zz_when_Axi4LiteCrossbar_l131_9));
  always @(*) begin
    _zz_rdGranted_0 = 1'b0;
    if(when_Axi4LiteCrossbar_l131_8) begin
      _zz_rdGranted_0 = 1'b0;
    end
    if(when_Axi4LiteCrossbar_l131_9) begin
      _zz_rdGranted_0 = 1'b1;
    end
  end

  assign when_Axi4LiteCrossbar_l131_8 = _zz_when_Axi4LiteCrossbar_l131_9[0];
  assign when_Axi4LiteCrossbar_l131_9 = _zz_when_Axi4LiteCrossbar_l131_9[1];
  assign when_Axi4LiteCrossbar_l294 = (|_zz_when_Axi4LiteCrossbar_l294);
  assign when_Axi4LiteCrossbar_l297 = (_zz_rdGranted_0 == 1'b0);
  assign when_Axi4LiteCrossbar_l297_1 = (_zz_rdGranted_0 == 1'b1);
  assign io_slaves_0_ar_fire = (m0_axi_arvalid && m0_axi_arready);
  assign when_Axi4LiteCrossbar_l340 = (rdGranted_0 == 1'b0);
  assign when_Axi4LiteCrossbar_l340_1 = (rdGranted_0 == 1'b1);
  assign io_slaves_0_r_fire = (m0_axi_rvalid && m0_axi_rready);
  assign when_Axi4LiteCrossbar_l283_1 = (! rdActive_1);
  always @(*) begin
    _zz_when_Axi4LiteCrossbar_l294_4[0] = ((32'h00000000 <= s0_axi_araddr) && (s0_axi_araddr < 32'h00001000));
    _zz_when_Axi4LiteCrossbar_l294_4[1] = ((32'h00010000 <= s0_axi_araddr) && (s0_axi_araddr < 32'h00011000));
    _zz_when_Axi4LiteCrossbar_l294_4[2] = ((32'h00020000 <= s0_axi_araddr) && (s0_axi_araddr < 32'h00021000));
    _zz_when_Axi4LiteCrossbar_l294_4[3] = ((32'h00030000 <= s0_axi_araddr) && (s0_axi_araddr < 32'h00031000));
  end

  always @(*) begin
    _zz_when_Axi4LiteCrossbar_l294_3[0] = (s0_axi_arvalid && _zz_when_Axi4LiteCrossbar_l294_4[1]);
    _zz_when_Axi4LiteCrossbar_l294_3[1] = (s1_axi_arvalid && _zz_when_Axi4LiteCrossbar_l294_5[1]);
  end

  always @(*) begin
    _zz_when_Axi4LiteCrossbar_l294_5[0] = ((32'h00000000 <= s1_axi_araddr) && (s1_axi_araddr < 32'h00001000));
    _zz_when_Axi4LiteCrossbar_l294_5[1] = ((32'h00010000 <= s1_axi_araddr) && (s1_axi_araddr < 32'h00011000));
    _zz_when_Axi4LiteCrossbar_l294_5[2] = ((32'h00020000 <= s1_axi_araddr) && (s1_axi_araddr < 32'h00021000));
    _zz_when_Axi4LiteCrossbar_l294_5[3] = ((32'h00030000 <= s1_axi_araddr) && (s1_axi_araddr < 32'h00031000));
  end

  assign _zz_when_Axi4LiteCrossbar_l131_10 = _zz_when_Axi4LiteCrossbar_l294_3;
  assign _zz_when_Axi4LiteCrossbar_l131_11 = (_zz_when_Axi4LiteCrossbar_l131_10 & (~ _zz__zz_when_Axi4LiteCrossbar_l131_11));
  always @(*) begin
    _zz_rdGranted_1 = 1'b0;
    if(when_Axi4LiteCrossbar_l131_10) begin
      _zz_rdGranted_1 = 1'b0;
    end
    if(when_Axi4LiteCrossbar_l131_11) begin
      _zz_rdGranted_1 = 1'b1;
    end
  end

  assign when_Axi4LiteCrossbar_l131_10 = _zz_when_Axi4LiteCrossbar_l131_11[0];
  assign when_Axi4LiteCrossbar_l131_11 = _zz_when_Axi4LiteCrossbar_l131_11[1];
  assign when_Axi4LiteCrossbar_l294_1 = (|_zz_when_Axi4LiteCrossbar_l294_3);
  assign when_Axi4LiteCrossbar_l297_2 = (_zz_rdGranted_1 == 1'b0);
  assign when_Axi4LiteCrossbar_l297_3 = (_zz_rdGranted_1 == 1'b1);
  assign io_slaves_1_ar_fire = (m1_axi_arvalid && m1_axi_arready);
  assign when_Axi4LiteCrossbar_l340_2 = (rdGranted_1 == 1'b0);
  assign when_Axi4LiteCrossbar_l340_3 = (rdGranted_1 == 1'b1);
  assign io_slaves_1_r_fire = (m1_axi_rvalid && m1_axi_rready);
  assign when_Axi4LiteCrossbar_l283_2 = (! rdActive_2);
  always @(*) begin
    _zz_when_Axi4LiteCrossbar_l294_7[0] = ((32'h00000000 <= s0_axi_araddr) && (s0_axi_araddr < 32'h00001000));
    _zz_when_Axi4LiteCrossbar_l294_7[1] = ((32'h00010000 <= s0_axi_araddr) && (s0_axi_araddr < 32'h00011000));
    _zz_when_Axi4LiteCrossbar_l294_7[2] = ((32'h00020000 <= s0_axi_araddr) && (s0_axi_araddr < 32'h00021000));
    _zz_when_Axi4LiteCrossbar_l294_7[3] = ((32'h00030000 <= s0_axi_araddr) && (s0_axi_araddr < 32'h00031000));
  end

  always @(*) begin
    _zz_when_Axi4LiteCrossbar_l294_6[0] = (s0_axi_arvalid && _zz_when_Axi4LiteCrossbar_l294_7[2]);
    _zz_when_Axi4LiteCrossbar_l294_6[1] = (s1_axi_arvalid && _zz_when_Axi4LiteCrossbar_l294_8[2]);
  end

  always @(*) begin
    _zz_when_Axi4LiteCrossbar_l294_8[0] = ((32'h00000000 <= s1_axi_araddr) && (s1_axi_araddr < 32'h00001000));
    _zz_when_Axi4LiteCrossbar_l294_8[1] = ((32'h00010000 <= s1_axi_araddr) && (s1_axi_araddr < 32'h00011000));
    _zz_when_Axi4LiteCrossbar_l294_8[2] = ((32'h00020000 <= s1_axi_araddr) && (s1_axi_araddr < 32'h00021000));
    _zz_when_Axi4LiteCrossbar_l294_8[3] = ((32'h00030000 <= s1_axi_araddr) && (s1_axi_araddr < 32'h00031000));
  end

  assign _zz_when_Axi4LiteCrossbar_l131_12 = _zz_when_Axi4LiteCrossbar_l294_6;
  assign _zz_when_Axi4LiteCrossbar_l131_13 = (_zz_when_Axi4LiteCrossbar_l131_12 & (~ _zz__zz_when_Axi4LiteCrossbar_l131_13));
  always @(*) begin
    _zz_rdGranted_2 = 1'b0;
    if(when_Axi4LiteCrossbar_l131_12) begin
      _zz_rdGranted_2 = 1'b0;
    end
    if(when_Axi4LiteCrossbar_l131_13) begin
      _zz_rdGranted_2 = 1'b1;
    end
  end

  assign when_Axi4LiteCrossbar_l131_12 = _zz_when_Axi4LiteCrossbar_l131_13[0];
  assign when_Axi4LiteCrossbar_l131_13 = _zz_when_Axi4LiteCrossbar_l131_13[1];
  assign when_Axi4LiteCrossbar_l294_2 = (|_zz_when_Axi4LiteCrossbar_l294_6);
  assign when_Axi4LiteCrossbar_l297_4 = (_zz_rdGranted_2 == 1'b0);
  assign when_Axi4LiteCrossbar_l297_5 = (_zz_rdGranted_2 == 1'b1);
  assign io_slaves_2_ar_fire = (m2_axi_arvalid && m2_axi_arready);
  assign when_Axi4LiteCrossbar_l340_4 = (rdGranted_2 == 1'b0);
  assign when_Axi4LiteCrossbar_l340_5 = (rdGranted_2 == 1'b1);
  assign io_slaves_2_r_fire = (m2_axi_rvalid && m2_axi_rready);
  assign when_Axi4LiteCrossbar_l283_3 = (! rdActive_3);
  always @(*) begin
    _zz_when_Axi4LiteCrossbar_l294_10[0] = ((32'h00000000 <= s0_axi_araddr) && (s0_axi_araddr < 32'h00001000));
    _zz_when_Axi4LiteCrossbar_l294_10[1] = ((32'h00010000 <= s0_axi_araddr) && (s0_axi_araddr < 32'h00011000));
    _zz_when_Axi4LiteCrossbar_l294_10[2] = ((32'h00020000 <= s0_axi_araddr) && (s0_axi_araddr < 32'h00021000));
    _zz_when_Axi4LiteCrossbar_l294_10[3] = ((32'h00030000 <= s0_axi_araddr) && (s0_axi_araddr < 32'h00031000));
  end

  always @(*) begin
    _zz_when_Axi4LiteCrossbar_l294_9[0] = (s0_axi_arvalid && _zz_when_Axi4LiteCrossbar_l294_10[3]);
    _zz_when_Axi4LiteCrossbar_l294_9[1] = (s1_axi_arvalid && _zz_when_Axi4LiteCrossbar_l294_11[3]);
  end

  always @(*) begin
    _zz_when_Axi4LiteCrossbar_l294_11[0] = ((32'h00000000 <= s1_axi_araddr) && (s1_axi_araddr < 32'h00001000));
    _zz_when_Axi4LiteCrossbar_l294_11[1] = ((32'h00010000 <= s1_axi_araddr) && (s1_axi_araddr < 32'h00011000));
    _zz_when_Axi4LiteCrossbar_l294_11[2] = ((32'h00020000 <= s1_axi_araddr) && (s1_axi_araddr < 32'h00021000));
    _zz_when_Axi4LiteCrossbar_l294_11[3] = ((32'h00030000 <= s1_axi_araddr) && (s1_axi_araddr < 32'h00031000));
  end

  assign _zz_when_Axi4LiteCrossbar_l131_14 = _zz_when_Axi4LiteCrossbar_l294_9;
  assign _zz_when_Axi4LiteCrossbar_l131_15 = (_zz_when_Axi4LiteCrossbar_l131_14 & (~ _zz__zz_when_Axi4LiteCrossbar_l131_15));
  always @(*) begin
    _zz_rdGranted_3 = 1'b0;
    if(when_Axi4LiteCrossbar_l131_14) begin
      _zz_rdGranted_3 = 1'b0;
    end
    if(when_Axi4LiteCrossbar_l131_15) begin
      _zz_rdGranted_3 = 1'b1;
    end
  end

  assign when_Axi4LiteCrossbar_l131_14 = _zz_when_Axi4LiteCrossbar_l131_15[0];
  assign when_Axi4LiteCrossbar_l131_15 = _zz_when_Axi4LiteCrossbar_l131_15[1];
  assign when_Axi4LiteCrossbar_l294_3 = (|_zz_when_Axi4LiteCrossbar_l294_9);
  assign when_Axi4LiteCrossbar_l297_6 = (_zz_rdGranted_3 == 1'b0);
  assign when_Axi4LiteCrossbar_l297_7 = (_zz_rdGranted_3 == 1'b1);
  assign io_slaves_3_ar_fire = (m3_axi_arvalid && m3_axi_arready);
  assign when_Axi4LiteCrossbar_l340_6 = (rdGranted_3 == 1'b0);
  assign when_Axi4LiteCrossbar_l340_7 = (rdGranted_3 == 1'b1);
  assign io_slaves_3_r_fire = (m3_axi_rvalid && m3_axi_rready);
  always @(posedge aclk) begin
    if(!aresetn) begin
      wrActive_0 <= 1'b0;
      wrActive_1 <= 1'b0;
      wrActive_2 <= 1'b0;
      wrActive_3 <= 1'b0;
      wrGranted_0 <= 1'b0;
      wrGranted_1 <= 1'b0;
      wrGranted_2 <= 1'b0;
      wrGranted_3 <= 1'b0;
      wrRrPtr_0 <= 1'b0;
      wrRrPtr_1 <= 1'b0;
      wrRrPtr_2 <= 1'b0;
      wrRrPtr_3 <= 1'b0;
      rdActive_0 <= 1'b0;
      rdActive_1 <= 1'b0;
      rdActive_2 <= 1'b0;
      rdActive_3 <= 1'b0;
      rdGranted_0 <= 1'b0;
      rdGranted_1 <= 1'b0;
      rdGranted_2 <= 1'b0;
      rdGranted_3 <= 1'b0;
      rdRrPtr_0 <= 1'b0;
      rdRrPtr_1 <= 1'b0;
      rdRrPtr_2 <= 1'b0;
      rdRrPtr_3 <= 1'b0;
    end else begin
      if(when_Axi4LiteCrossbar_l194) begin
        if(when_Axi4LiteCrossbar_l206) begin
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
      if(when_Axi4LiteCrossbar_l194_1) begin
        if(when_Axi4LiteCrossbar_l206_1) begin
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
      if(when_Axi4LiteCrossbar_l194_2) begin
        if(when_Axi4LiteCrossbar_l206_2) begin
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
      if(when_Axi4LiteCrossbar_l194_3) begin
        if(when_Axi4LiteCrossbar_l206_3) begin
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
      if(when_Axi4LiteCrossbar_l283) begin
        if(when_Axi4LiteCrossbar_l294) begin
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
      if(when_Axi4LiteCrossbar_l283_1) begin
        if(when_Axi4LiteCrossbar_l294_1) begin
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
      if(when_Axi4LiteCrossbar_l283_2) begin
        if(when_Axi4LiteCrossbar_l294_2) begin
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
      if(when_Axi4LiteCrossbar_l283_3) begin
        if(when_Axi4LiteCrossbar_l294_3) begin
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
    end
  end


endmodule
