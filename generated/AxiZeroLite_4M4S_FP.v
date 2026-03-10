// Copyright (c) 2026 Leonardo Capossio — bard0 design  hello@bard0.com
// SPDX-License-Identifier: MIT
// Generator : SpinalHDL v1.10.1    git head : 2527c7c6b0fb0f95e5e1a5722a0be732b364ce43
// Component : AxiZeroLiteTop

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
  input  wire          s2_axi_awvalid,
  output wire          s2_axi_awready,
  input  wire [31:0]   s2_axi_awaddr,
  input  wire [2:0]    s2_axi_awprot,
  input  wire          s2_axi_wvalid,
  output wire          s2_axi_wready,
  input  wire [31:0]   s2_axi_wdata,
  input  wire [3:0]    s2_axi_wstrb,
  output wire          s2_axi_bvalid,
  input  wire          s2_axi_bready,
  output wire [1:0]    s2_axi_bresp,
  input  wire          s2_axi_arvalid,
  output wire          s2_axi_arready,
  input  wire [31:0]   s2_axi_araddr,
  input  wire [2:0]    s2_axi_arprot,
  output wire          s2_axi_rvalid,
  input  wire          s2_axi_rready,
  output wire [31:0]   s2_axi_rdata,
  output wire [1:0]    s2_axi_rresp,
  input  wire          s3_axi_awvalid,
  output wire          s3_axi_awready,
  input  wire [31:0]   s3_axi_awaddr,
  input  wire [2:0]    s3_axi_awprot,
  input  wire          s3_axi_wvalid,
  output wire          s3_axi_wready,
  input  wire [31:0]   s3_axi_wdata,
  input  wire [3:0]    s3_axi_wstrb,
  output wire          s3_axi_bvalid,
  input  wire          s3_axi_bready,
  output wire [1:0]    s3_axi_bresp,
  input  wire          s3_axi_arvalid,
  output wire          s3_axi_arready,
  input  wire [31:0]   s3_axi_araddr,
  input  wire [2:0]    s3_axi_arprot,
  output wire          s3_axi_rvalid,
  input  wire          s3_axi_rready,
  output wire [31:0]   s3_axi_rdata,
  output wire [1:0]    s3_axi_rresp,
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
  wire                xbar_io_masters_2_ar_ready;
  wire                xbar_io_masters_2_aw_ready;
  wire                xbar_io_masters_2_w_ready;
  wire                xbar_io_masters_2_r_valid;
  wire       [31:0]   xbar_io_masters_2_r_payload_data;
  wire       [1:0]    xbar_io_masters_2_r_payload_resp;
  wire                xbar_io_masters_2_b_valid;
  wire       [1:0]    xbar_io_masters_2_b_payload_resp;
  wire                xbar_io_masters_3_ar_ready;
  wire                xbar_io_masters_3_aw_ready;
  wire                xbar_io_masters_3_w_ready;
  wire                xbar_io_masters_3_r_valid;
  wire       [31:0]   xbar_io_masters_3_r_payload_data;
  wire       [1:0]    xbar_io_masters_3_r_payload_resp;
  wire                xbar_io_masters_3_b_valid;
  wire       [1:0]    xbar_io_masters_3_b_payload_resp;
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
    .s2_axi_awvalid        (s2_axi_awvalid                 ), //i
    .s2_axi_awready        (xbar_io_masters_2_aw_ready            ), //o
    .s2_axi_awaddr (s2_axi_awaddr[31:0]    ), //i
    .s2_axi_awprot (s2_axi_awprot[2:0]     ), //i
    .s2_axi_wvalid         (s2_axi_wvalid                  ), //i
    .s2_axi_wready         (xbar_io_masters_2_w_ready             ), //o
    .s2_axi_wdata  (s2_axi_wdata[31:0]     ), //i
    .s2_axi_wstrb  (s2_axi_wstrb[3:0]      ), //i
    .s2_axi_bvalid         (xbar_io_masters_2_b_valid             ), //o
    .s2_axi_bready         (s2_axi_bready                  ), //i
    .s2_axi_bresp  (xbar_io_masters_2_b_payload_resp[1:0] ), //o
    .s2_axi_arvalid        (s2_axi_arvalid                 ), //i
    .s2_axi_arready        (xbar_io_masters_2_ar_ready            ), //o
    .s2_axi_araddr (s2_axi_araddr[31:0]    ), //i
    .s2_axi_arprot (s2_axi_arprot[2:0]     ), //i
    .s2_axi_rvalid         (xbar_io_masters_2_r_valid             ), //o
    .s2_axi_rready         (s2_axi_rready                  ), //i
    .s2_axi_rdata  (xbar_io_masters_2_r_payload_data[31:0]), //o
    .s2_axi_rresp  (xbar_io_masters_2_r_payload_resp[1:0] ), //o
    .s3_axi_awvalid        (s3_axi_awvalid                 ), //i
    .s3_axi_awready        (xbar_io_masters_3_aw_ready            ), //o
    .s3_axi_awaddr (s3_axi_awaddr[31:0]    ), //i
    .s3_axi_awprot (s3_axi_awprot[2:0]     ), //i
    .s3_axi_wvalid         (s3_axi_wvalid                  ), //i
    .s3_axi_wready         (xbar_io_masters_3_w_ready             ), //o
    .s3_axi_wdata  (s3_axi_wdata[31:0]     ), //i
    .s3_axi_wstrb  (s3_axi_wstrb[3:0]      ), //i
    .s3_axi_bvalid         (xbar_io_masters_3_b_valid             ), //o
    .s3_axi_bready         (s3_axi_bready                  ), //i
    .s3_axi_bresp  (xbar_io_masters_3_b_payload_resp[1:0] ), //o
    .s3_axi_arvalid        (s3_axi_arvalid                 ), //i
    .s3_axi_arready        (xbar_io_masters_3_ar_ready            ), //o
    .s3_axi_araddr (s3_axi_araddr[31:0]    ), //i
    .s3_axi_arprot (s3_axi_arprot[2:0]     ), //i
    .s3_axi_rvalid         (xbar_io_masters_3_r_valid             ), //o
    .s3_axi_rready         (s3_axi_rready                  ), //i
    .s3_axi_rdata  (xbar_io_masters_3_r_payload_data[31:0]), //o
    .s3_axi_rresp  (xbar_io_masters_3_r_payload_resp[1:0] ), //o
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
  assign s2_axi_awready = xbar_io_masters_2_aw_ready;
  assign s2_axi_wready = xbar_io_masters_2_w_ready;
  assign s2_axi_bvalid = xbar_io_masters_2_b_valid;
  assign s2_axi_bresp = xbar_io_masters_2_b_payload_resp;
  assign s2_axi_arready = xbar_io_masters_2_ar_ready;
  assign s2_axi_rvalid = xbar_io_masters_2_r_valid;
  assign s2_axi_rdata = xbar_io_masters_2_r_payload_data;
  assign s2_axi_rresp = xbar_io_masters_2_r_payload_resp;
  assign s3_axi_awready = xbar_io_masters_3_aw_ready;
  assign s3_axi_wready = xbar_io_masters_3_w_ready;
  assign s3_axi_bvalid = xbar_io_masters_3_b_valid;
  assign s3_axi_bresp = xbar_io_masters_3_b_payload_resp;
  assign s3_axi_arready = xbar_io_masters_3_ar_ready;
  assign s3_axi_rvalid = xbar_io_masters_3_r_valid;
  assign s3_axi_rdata = xbar_io_masters_3_r_payload_data;
  assign s3_axi_rresp = xbar_io_masters_3_r_payload_resp;
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
  input  wire          s2_axi_awvalid,
  output reg           s2_axi_awready,
  input  wire [31:0]   s2_axi_awaddr,
  input  wire [2:0]    s2_axi_awprot,
  input  wire          s2_axi_wvalid,
  output reg           s2_axi_wready,
  input  wire [31:0]   s2_axi_wdata,
  input  wire [3:0]    s2_axi_wstrb,
  output reg           s2_axi_bvalid,
  input  wire          s2_axi_bready,
  output reg  [1:0]    s2_axi_bresp,
  input  wire          s2_axi_arvalid,
  output reg           s2_axi_arready,
  input  wire [31:0]   s2_axi_araddr,
  input  wire [2:0]    s2_axi_arprot,
  output reg           s2_axi_rvalid,
  input  wire          s2_axi_rready,
  output reg  [31:0]   s2_axi_rdata,
  output reg  [1:0]    s2_axi_rresp,
  input  wire          s3_axi_awvalid,
  output reg           s3_axi_awready,
  input  wire [31:0]   s3_axi_awaddr,
  input  wire [2:0]    s3_axi_awprot,
  input  wire          s3_axi_wvalid,
  output reg           s3_axi_wready,
  input  wire [31:0]   s3_axi_wdata,
  input  wire [3:0]    s3_axi_wstrb,
  output reg           s3_axi_bvalid,
  input  wire          s3_axi_bready,
  output reg  [1:0]    s3_axi_bresp,
  input  wire          s3_axi_arvalid,
  output reg           s3_axi_arready,
  input  wire [31:0]   s3_axi_araddr,
  input  wire [2:0]    s3_axi_arprot,
  output reg           s3_axi_rvalid,
  input  wire          s3_axi_rready,
  output reg  [31:0]   s3_axi_rdata,
  output reg  [1:0]    s3_axi_rresp,
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
  wire       [1:0]    _zz_io_masters_2_b_payload_resp;
  wire       [1:0]    _zz_io_masters_3_b_payload_resp;
  wire       [3:0]    _zz__zz_when_Axi4LiteCrossbar_l117_1;
  wire       [3:0]    _zz__zz_when_Axi4LiteCrossbar_l117_3;
  wire       [3:0]    _zz__zz_when_Axi4LiteCrossbar_l117_5;
  wire       [3:0]    _zz__zz_when_Axi4LiteCrossbar_l117_7;
  wire       [3:0]    _zz__zz_when_Axi4LiteCrossbar_l117_9;
  wire       [3:0]    _zz__zz_when_Axi4LiteCrossbar_l117_11;
  wire       [3:0]    _zz__zz_when_Axi4LiteCrossbar_l117_13;
  wire       [3:0]    _zz__zz_when_Axi4LiteCrossbar_l117_15;
  reg                 wrActive_0;
  reg                 wrActive_1;
  reg                 wrActive_2;
  reg                 wrActive_3;
  reg        [1:0]    wrGranted_0;
  reg        [1:0]    wrGranted_1;
  reg        [1:0]    wrGranted_2;
  reg        [1:0]    wrGranted_3;
  reg        [1:0]    wrRrPtr_0;
  reg        [1:0]    wrRrPtr_1;
  reg        [1:0]    wrRrPtr_2;
  reg        [1:0]    wrRrPtr_3;
  reg                 rdActive_0;
  reg                 rdActive_1;
  reg                 rdActive_2;
  reg                 rdActive_3;
  reg        [1:0]    rdGranted_0;
  reg        [1:0]    rdGranted_1;
  reg        [1:0]    rdGranted_2;
  reg        [1:0]    rdGranted_3;
  reg        [1:0]    rdRrPtr_0;
  reg        [1:0]    rdRrPtr_1;
  reg        [1:0]    rdRrPtr_2;
  reg        [1:0]    rdRrPtr_3;
  wire       [33:0]   _zz_io_masters_0_r_payload_data;
  wire       [33:0]   _zz_io_masters_1_r_payload_data;
  wire       [33:0]   _zz_io_masters_2_r_payload_data;
  wire       [33:0]   _zz_io_masters_3_r_payload_data;
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
  wire                when_Axi4LiteCrossbar_l160;
  reg        [3:0]    _zz_when_Axi4LiteCrossbar_l172;
  reg        [3:0]    _zz_when_Axi4LiteCrossbar_l172_1;
  reg        [3:0]    _zz_when_Axi4LiteCrossbar_l172_2;
  reg        [3:0]    _zz_when_Axi4LiteCrossbar_l172_3;
  reg        [3:0]    _zz_when_Axi4LiteCrossbar_l172_4;
  wire       [3:0]    _zz_when_Axi4LiteCrossbar_l117;
  wire       [3:0]    _zz_when_Axi4LiteCrossbar_l117_1;
  reg        [1:0]    _zz_wrGranted_0;
  wire                when_Axi4LiteCrossbar_l117;
  wire                when_Axi4LiteCrossbar_l117_1;
  wire                when_Axi4LiteCrossbar_l117_2;
  wire                when_Axi4LiteCrossbar_l117_3;
  wire                when_Axi4LiteCrossbar_l172;
  wire                when_Axi4LiteCrossbar_l176;
  wire                when_Axi4LiteCrossbar_l176_1;
  wire                when_Axi4LiteCrossbar_l176_2;
  wire                when_Axi4LiteCrossbar_l176_3;
  wire                io_slaves_0_aw_fire;
  wire                when_Axi4LiteCrossbar_l195;
  wire                when_Axi4LiteCrossbar_l195_1;
  wire                when_Axi4LiteCrossbar_l195_2;
  wire                when_Axi4LiteCrossbar_l195_3;
  wire                io_slaves_0_b_fire;
  wire                when_Axi4LiteCrossbar_l160_1;
  reg        [3:0]    _zz_when_Axi4LiteCrossbar_l172_5;
  reg        [3:0]    _zz_when_Axi4LiteCrossbar_l172_6;
  reg        [3:0]    _zz_when_Axi4LiteCrossbar_l172_7;
  reg        [3:0]    _zz_when_Axi4LiteCrossbar_l172_8;
  reg        [3:0]    _zz_when_Axi4LiteCrossbar_l172_9;
  wire       [3:0]    _zz_when_Axi4LiteCrossbar_l117_2;
  wire       [3:0]    _zz_when_Axi4LiteCrossbar_l117_3;
  reg        [1:0]    _zz_wrGranted_1;
  wire                when_Axi4LiteCrossbar_l117_4;
  wire                when_Axi4LiteCrossbar_l117_5;
  wire                when_Axi4LiteCrossbar_l117_6;
  wire                when_Axi4LiteCrossbar_l117_7;
  wire                when_Axi4LiteCrossbar_l172_1;
  wire                when_Axi4LiteCrossbar_l176_4;
  wire                when_Axi4LiteCrossbar_l176_5;
  wire                when_Axi4LiteCrossbar_l176_6;
  wire                when_Axi4LiteCrossbar_l176_7;
  wire                io_slaves_1_aw_fire;
  wire                when_Axi4LiteCrossbar_l195_4;
  wire                when_Axi4LiteCrossbar_l195_5;
  wire                when_Axi4LiteCrossbar_l195_6;
  wire                when_Axi4LiteCrossbar_l195_7;
  wire                io_slaves_1_b_fire;
  wire                when_Axi4LiteCrossbar_l160_2;
  reg        [3:0]    _zz_when_Axi4LiteCrossbar_l172_10;
  reg        [3:0]    _zz_when_Axi4LiteCrossbar_l172_11;
  reg        [3:0]    _zz_when_Axi4LiteCrossbar_l172_12;
  reg        [3:0]    _zz_when_Axi4LiteCrossbar_l172_13;
  reg        [3:0]    _zz_when_Axi4LiteCrossbar_l172_14;
  wire       [3:0]    _zz_when_Axi4LiteCrossbar_l117_4;
  wire       [3:0]    _zz_when_Axi4LiteCrossbar_l117_5;
  reg        [1:0]    _zz_wrGranted_2;
  wire                when_Axi4LiteCrossbar_l117_8;
  wire                when_Axi4LiteCrossbar_l117_9;
  wire                when_Axi4LiteCrossbar_l117_10;
  wire                when_Axi4LiteCrossbar_l117_11;
  wire                when_Axi4LiteCrossbar_l172_2;
  wire                when_Axi4LiteCrossbar_l176_8;
  wire                when_Axi4LiteCrossbar_l176_9;
  wire                when_Axi4LiteCrossbar_l176_10;
  wire                when_Axi4LiteCrossbar_l176_11;
  wire                io_slaves_2_aw_fire;
  wire                when_Axi4LiteCrossbar_l195_8;
  wire                when_Axi4LiteCrossbar_l195_9;
  wire                when_Axi4LiteCrossbar_l195_10;
  wire                when_Axi4LiteCrossbar_l195_11;
  wire                io_slaves_2_b_fire;
  wire                when_Axi4LiteCrossbar_l160_3;
  reg        [3:0]    _zz_when_Axi4LiteCrossbar_l172_15;
  reg        [3:0]    _zz_when_Axi4LiteCrossbar_l172_16;
  reg        [3:0]    _zz_when_Axi4LiteCrossbar_l172_17;
  reg        [3:0]    _zz_when_Axi4LiteCrossbar_l172_18;
  reg        [3:0]    _zz_when_Axi4LiteCrossbar_l172_19;
  wire       [3:0]    _zz_when_Axi4LiteCrossbar_l117_6;
  wire       [3:0]    _zz_when_Axi4LiteCrossbar_l117_7;
  reg        [1:0]    _zz_wrGranted_3;
  wire                when_Axi4LiteCrossbar_l117_12;
  wire                when_Axi4LiteCrossbar_l117_13;
  wire                when_Axi4LiteCrossbar_l117_14;
  wire                when_Axi4LiteCrossbar_l117_15;
  wire                when_Axi4LiteCrossbar_l172_3;
  wire                when_Axi4LiteCrossbar_l176_12;
  wire                when_Axi4LiteCrossbar_l176_13;
  wire                when_Axi4LiteCrossbar_l176_14;
  wire                when_Axi4LiteCrossbar_l176_15;
  wire                io_slaves_3_aw_fire;
  wire                when_Axi4LiteCrossbar_l195_12;
  wire                when_Axi4LiteCrossbar_l195_13;
  wire                when_Axi4LiteCrossbar_l195_14;
  wire                when_Axi4LiteCrossbar_l195_15;
  wire                io_slaves_3_b_fire;
  wire                when_Axi4LiteCrossbar_l216;
  reg        [3:0]    _zz_when_Axi4LiteCrossbar_l227;
  reg        [3:0]    _zz_when_Axi4LiteCrossbar_l227_1;
  reg        [3:0]    _zz_when_Axi4LiteCrossbar_l227_2;
  reg        [3:0]    _zz_when_Axi4LiteCrossbar_l227_3;
  reg        [3:0]    _zz_when_Axi4LiteCrossbar_l227_4;
  wire       [3:0]    _zz_when_Axi4LiteCrossbar_l117_8;
  wire       [3:0]    _zz_when_Axi4LiteCrossbar_l117_9;
  reg        [1:0]    _zz_rdGranted_0;
  wire                when_Axi4LiteCrossbar_l117_16;
  wire                when_Axi4LiteCrossbar_l117_17;
  wire                when_Axi4LiteCrossbar_l117_18;
  wire                when_Axi4LiteCrossbar_l117_19;
  wire                when_Axi4LiteCrossbar_l227;
  wire                when_Axi4LiteCrossbar_l230;
  wire                when_Axi4LiteCrossbar_l230_1;
  wire                when_Axi4LiteCrossbar_l230_2;
  wire                when_Axi4LiteCrossbar_l230_3;
  wire                io_slaves_0_ar_fire;
  wire                when_Axi4LiteCrossbar_l247;
  wire                when_Axi4LiteCrossbar_l247_1;
  wire                when_Axi4LiteCrossbar_l247_2;
  wire                when_Axi4LiteCrossbar_l247_3;
  wire                io_slaves_0_r_fire;
  wire                when_Axi4LiteCrossbar_l216_1;
  reg        [3:0]    _zz_when_Axi4LiteCrossbar_l227_5;
  reg        [3:0]    _zz_when_Axi4LiteCrossbar_l227_6;
  reg        [3:0]    _zz_when_Axi4LiteCrossbar_l227_7;
  reg        [3:0]    _zz_when_Axi4LiteCrossbar_l227_8;
  reg        [3:0]    _zz_when_Axi4LiteCrossbar_l227_9;
  wire       [3:0]    _zz_when_Axi4LiteCrossbar_l117_10;
  wire       [3:0]    _zz_when_Axi4LiteCrossbar_l117_11;
  reg        [1:0]    _zz_rdGranted_1;
  wire                when_Axi4LiteCrossbar_l117_20;
  wire                when_Axi4LiteCrossbar_l117_21;
  wire                when_Axi4LiteCrossbar_l117_22;
  wire                when_Axi4LiteCrossbar_l117_23;
  wire                when_Axi4LiteCrossbar_l227_1;
  wire                when_Axi4LiteCrossbar_l230_4;
  wire                when_Axi4LiteCrossbar_l230_5;
  wire                when_Axi4LiteCrossbar_l230_6;
  wire                when_Axi4LiteCrossbar_l230_7;
  wire                io_slaves_1_ar_fire;
  wire                when_Axi4LiteCrossbar_l247_4;
  wire                when_Axi4LiteCrossbar_l247_5;
  wire                when_Axi4LiteCrossbar_l247_6;
  wire                when_Axi4LiteCrossbar_l247_7;
  wire                io_slaves_1_r_fire;
  wire                when_Axi4LiteCrossbar_l216_2;
  reg        [3:0]    _zz_when_Axi4LiteCrossbar_l227_10;
  reg        [3:0]    _zz_when_Axi4LiteCrossbar_l227_11;
  reg        [3:0]    _zz_when_Axi4LiteCrossbar_l227_12;
  reg        [3:0]    _zz_when_Axi4LiteCrossbar_l227_13;
  reg        [3:0]    _zz_when_Axi4LiteCrossbar_l227_14;
  wire       [3:0]    _zz_when_Axi4LiteCrossbar_l117_12;
  wire       [3:0]    _zz_when_Axi4LiteCrossbar_l117_13;
  reg        [1:0]    _zz_rdGranted_2;
  wire                when_Axi4LiteCrossbar_l117_24;
  wire                when_Axi4LiteCrossbar_l117_25;
  wire                when_Axi4LiteCrossbar_l117_26;
  wire                when_Axi4LiteCrossbar_l117_27;
  wire                when_Axi4LiteCrossbar_l227_2;
  wire                when_Axi4LiteCrossbar_l230_8;
  wire                when_Axi4LiteCrossbar_l230_9;
  wire                when_Axi4LiteCrossbar_l230_10;
  wire                when_Axi4LiteCrossbar_l230_11;
  wire                io_slaves_2_ar_fire;
  wire                when_Axi4LiteCrossbar_l247_8;
  wire                when_Axi4LiteCrossbar_l247_9;
  wire                when_Axi4LiteCrossbar_l247_10;
  wire                when_Axi4LiteCrossbar_l247_11;
  wire                io_slaves_2_r_fire;
  wire                when_Axi4LiteCrossbar_l216_3;
  reg        [3:0]    _zz_when_Axi4LiteCrossbar_l227_15;
  reg        [3:0]    _zz_when_Axi4LiteCrossbar_l227_16;
  reg        [3:0]    _zz_when_Axi4LiteCrossbar_l227_17;
  reg        [3:0]    _zz_when_Axi4LiteCrossbar_l227_18;
  reg        [3:0]    _zz_when_Axi4LiteCrossbar_l227_19;
  wire       [3:0]    _zz_when_Axi4LiteCrossbar_l117_14;
  wire       [3:0]    _zz_when_Axi4LiteCrossbar_l117_15;
  reg        [1:0]    _zz_rdGranted_3;
  wire                when_Axi4LiteCrossbar_l117_28;
  wire                when_Axi4LiteCrossbar_l117_29;
  wire                when_Axi4LiteCrossbar_l117_30;
  wire                when_Axi4LiteCrossbar_l117_31;
  wire                when_Axi4LiteCrossbar_l227_3;
  wire                when_Axi4LiteCrossbar_l230_12;
  wire                when_Axi4LiteCrossbar_l230_13;
  wire                when_Axi4LiteCrossbar_l230_14;
  wire                when_Axi4LiteCrossbar_l230_15;
  wire                io_slaves_3_ar_fire;
  wire                when_Axi4LiteCrossbar_l247_12;
  wire                when_Axi4LiteCrossbar_l247_13;
  wire                when_Axi4LiteCrossbar_l247_14;
  wire                when_Axi4LiteCrossbar_l247_15;
  wire                io_slaves_3_r_fire;

  assign _zz_io_masters_0_b_payload_resp = 2'b00;
  assign _zz_io_masters_1_b_payload_resp = 2'b00;
  assign _zz_io_masters_2_b_payload_resp = 2'b00;
  assign _zz_io_masters_3_b_payload_resp = 2'b00;
  assign _zz__zz_when_Axi4LiteCrossbar_l117_1 = (_zz_when_Axi4LiteCrossbar_l117 - 4'b0001);
  assign _zz__zz_when_Axi4LiteCrossbar_l117_3 = (_zz_when_Axi4LiteCrossbar_l117_2 - 4'b0001);
  assign _zz__zz_when_Axi4LiteCrossbar_l117_5 = (_zz_when_Axi4LiteCrossbar_l117_4 - 4'b0001);
  assign _zz__zz_when_Axi4LiteCrossbar_l117_7 = (_zz_when_Axi4LiteCrossbar_l117_6 - 4'b0001);
  assign _zz__zz_when_Axi4LiteCrossbar_l117_9 = (_zz_when_Axi4LiteCrossbar_l117_8 - 4'b0001);
  assign _zz__zz_when_Axi4LiteCrossbar_l117_11 = (_zz_when_Axi4LiteCrossbar_l117_10 - 4'b0001);
  assign _zz__zz_when_Axi4LiteCrossbar_l117_13 = (_zz_when_Axi4LiteCrossbar_l117_12 - 4'b0001);
  assign _zz__zz_when_Axi4LiteCrossbar_l117_15 = (_zz_when_Axi4LiteCrossbar_l117_14 - 4'b0001);
  always @(*) begin
    s0_axi_awready = 1'b0;
    if(when_Axi4LiteCrossbar_l160) begin
      if(when_Axi4LiteCrossbar_l172) begin
        if(when_Axi4LiteCrossbar_l176) begin
          s0_axi_awready = m0_axi_awready;
        end
      end
    end
    if(when_Axi4LiteCrossbar_l160_1) begin
      if(when_Axi4LiteCrossbar_l172_1) begin
        if(when_Axi4LiteCrossbar_l176_4) begin
          s0_axi_awready = m1_axi_awready;
        end
      end
    end
    if(when_Axi4LiteCrossbar_l160_2) begin
      if(when_Axi4LiteCrossbar_l172_2) begin
        if(when_Axi4LiteCrossbar_l176_8) begin
          s0_axi_awready = m2_axi_awready;
        end
      end
    end
    if(when_Axi4LiteCrossbar_l160_3) begin
      if(when_Axi4LiteCrossbar_l172_3) begin
        if(when_Axi4LiteCrossbar_l176_12) begin
          s0_axi_awready = m3_axi_awready;
        end
      end
    end
  end

  always @(*) begin
    s0_axi_wready = 1'b0;
    if(!when_Axi4LiteCrossbar_l160) begin
      if(when_Axi4LiteCrossbar_l195) begin
        s0_axi_wready = m0_axi_wready;
      end
    end
    if(!when_Axi4LiteCrossbar_l160_1) begin
      if(when_Axi4LiteCrossbar_l195_4) begin
        s0_axi_wready = m1_axi_wready;
      end
    end
    if(!when_Axi4LiteCrossbar_l160_2) begin
      if(when_Axi4LiteCrossbar_l195_8) begin
        s0_axi_wready = m2_axi_wready;
      end
    end
    if(!when_Axi4LiteCrossbar_l160_3) begin
      if(when_Axi4LiteCrossbar_l195_12) begin
        s0_axi_wready = m3_axi_wready;
      end
    end
  end

  always @(*) begin
    s0_axi_bvalid = 1'b0;
    if(!when_Axi4LiteCrossbar_l160) begin
      if(when_Axi4LiteCrossbar_l195) begin
        s0_axi_bvalid = m0_axi_bvalid;
      end
    end
    if(!when_Axi4LiteCrossbar_l160_1) begin
      if(when_Axi4LiteCrossbar_l195_4) begin
        s0_axi_bvalid = m1_axi_bvalid;
      end
    end
    if(!when_Axi4LiteCrossbar_l160_2) begin
      if(when_Axi4LiteCrossbar_l195_8) begin
        s0_axi_bvalid = m2_axi_bvalid;
      end
    end
    if(!when_Axi4LiteCrossbar_l160_3) begin
      if(when_Axi4LiteCrossbar_l195_12) begin
        s0_axi_bvalid = m3_axi_bvalid;
      end
    end
  end

  always @(*) begin
    s0_axi_bresp = _zz_io_masters_0_b_payload_resp[1 : 0];
    if(!when_Axi4LiteCrossbar_l160) begin
      if(when_Axi4LiteCrossbar_l195) begin
        s0_axi_bresp = m0_axi_bresp;
      end
    end
    if(!when_Axi4LiteCrossbar_l160_1) begin
      if(when_Axi4LiteCrossbar_l195_4) begin
        s0_axi_bresp = m1_axi_bresp;
      end
    end
    if(!when_Axi4LiteCrossbar_l160_2) begin
      if(when_Axi4LiteCrossbar_l195_8) begin
        s0_axi_bresp = m2_axi_bresp;
      end
    end
    if(!when_Axi4LiteCrossbar_l160_3) begin
      if(when_Axi4LiteCrossbar_l195_12) begin
        s0_axi_bresp = m3_axi_bresp;
      end
    end
  end

  always @(*) begin
    s0_axi_arready = 1'b0;
    if(when_Axi4LiteCrossbar_l216) begin
      if(when_Axi4LiteCrossbar_l227) begin
        if(when_Axi4LiteCrossbar_l230) begin
          s0_axi_arready = m0_axi_arready;
        end
      end
    end
    if(when_Axi4LiteCrossbar_l216_1) begin
      if(when_Axi4LiteCrossbar_l227_1) begin
        if(when_Axi4LiteCrossbar_l230_4) begin
          s0_axi_arready = m1_axi_arready;
        end
      end
    end
    if(when_Axi4LiteCrossbar_l216_2) begin
      if(when_Axi4LiteCrossbar_l227_2) begin
        if(when_Axi4LiteCrossbar_l230_8) begin
          s0_axi_arready = m2_axi_arready;
        end
      end
    end
    if(when_Axi4LiteCrossbar_l216_3) begin
      if(when_Axi4LiteCrossbar_l227_3) begin
        if(when_Axi4LiteCrossbar_l230_12) begin
          s0_axi_arready = m3_axi_arready;
        end
      end
    end
  end

  always @(*) begin
    s0_axi_rvalid = 1'b0;
    if(!when_Axi4LiteCrossbar_l216) begin
      if(when_Axi4LiteCrossbar_l247) begin
        s0_axi_rvalid = m0_axi_rvalid;
      end
    end
    if(!when_Axi4LiteCrossbar_l216_1) begin
      if(when_Axi4LiteCrossbar_l247_4) begin
        s0_axi_rvalid = m1_axi_rvalid;
      end
    end
    if(!when_Axi4LiteCrossbar_l216_2) begin
      if(when_Axi4LiteCrossbar_l247_8) begin
        s0_axi_rvalid = m2_axi_rvalid;
      end
    end
    if(!when_Axi4LiteCrossbar_l216_3) begin
      if(when_Axi4LiteCrossbar_l247_12) begin
        s0_axi_rvalid = m3_axi_rvalid;
      end
    end
  end

  assign _zz_io_masters_0_r_payload_data = 34'h000000000;
  always @(*) begin
    s0_axi_rdata = _zz_io_masters_0_r_payload_data[31 : 0];
    if(!when_Axi4LiteCrossbar_l216) begin
      if(when_Axi4LiteCrossbar_l247) begin
        s0_axi_rdata = m0_axi_rdata;
      end
    end
    if(!when_Axi4LiteCrossbar_l216_1) begin
      if(when_Axi4LiteCrossbar_l247_4) begin
        s0_axi_rdata = m1_axi_rdata;
      end
    end
    if(!when_Axi4LiteCrossbar_l216_2) begin
      if(when_Axi4LiteCrossbar_l247_8) begin
        s0_axi_rdata = m2_axi_rdata;
      end
    end
    if(!when_Axi4LiteCrossbar_l216_3) begin
      if(when_Axi4LiteCrossbar_l247_12) begin
        s0_axi_rdata = m3_axi_rdata;
      end
    end
  end

  always @(*) begin
    s0_axi_rresp = _zz_io_masters_0_r_payload_data[33 : 32];
    if(!when_Axi4LiteCrossbar_l216) begin
      if(when_Axi4LiteCrossbar_l247) begin
        s0_axi_rresp = m0_axi_rresp;
      end
    end
    if(!when_Axi4LiteCrossbar_l216_1) begin
      if(when_Axi4LiteCrossbar_l247_4) begin
        s0_axi_rresp = m1_axi_rresp;
      end
    end
    if(!when_Axi4LiteCrossbar_l216_2) begin
      if(when_Axi4LiteCrossbar_l247_8) begin
        s0_axi_rresp = m2_axi_rresp;
      end
    end
    if(!when_Axi4LiteCrossbar_l216_3) begin
      if(when_Axi4LiteCrossbar_l247_12) begin
        s0_axi_rresp = m3_axi_rresp;
      end
    end
  end

  always @(*) begin
    s1_axi_awready = 1'b0;
    if(when_Axi4LiteCrossbar_l160) begin
      if(when_Axi4LiteCrossbar_l172) begin
        if(when_Axi4LiteCrossbar_l176_1) begin
          s1_axi_awready = m0_axi_awready;
        end
      end
    end
    if(when_Axi4LiteCrossbar_l160_1) begin
      if(when_Axi4LiteCrossbar_l172_1) begin
        if(when_Axi4LiteCrossbar_l176_5) begin
          s1_axi_awready = m1_axi_awready;
        end
      end
    end
    if(when_Axi4LiteCrossbar_l160_2) begin
      if(when_Axi4LiteCrossbar_l172_2) begin
        if(when_Axi4LiteCrossbar_l176_9) begin
          s1_axi_awready = m2_axi_awready;
        end
      end
    end
    if(when_Axi4LiteCrossbar_l160_3) begin
      if(when_Axi4LiteCrossbar_l172_3) begin
        if(when_Axi4LiteCrossbar_l176_13) begin
          s1_axi_awready = m3_axi_awready;
        end
      end
    end
  end

  always @(*) begin
    s1_axi_wready = 1'b0;
    if(!when_Axi4LiteCrossbar_l160) begin
      if(when_Axi4LiteCrossbar_l195_1) begin
        s1_axi_wready = m0_axi_wready;
      end
    end
    if(!when_Axi4LiteCrossbar_l160_1) begin
      if(when_Axi4LiteCrossbar_l195_5) begin
        s1_axi_wready = m1_axi_wready;
      end
    end
    if(!when_Axi4LiteCrossbar_l160_2) begin
      if(when_Axi4LiteCrossbar_l195_9) begin
        s1_axi_wready = m2_axi_wready;
      end
    end
    if(!when_Axi4LiteCrossbar_l160_3) begin
      if(when_Axi4LiteCrossbar_l195_13) begin
        s1_axi_wready = m3_axi_wready;
      end
    end
  end

  always @(*) begin
    s1_axi_bvalid = 1'b0;
    if(!when_Axi4LiteCrossbar_l160) begin
      if(when_Axi4LiteCrossbar_l195_1) begin
        s1_axi_bvalid = m0_axi_bvalid;
      end
    end
    if(!when_Axi4LiteCrossbar_l160_1) begin
      if(when_Axi4LiteCrossbar_l195_5) begin
        s1_axi_bvalid = m1_axi_bvalid;
      end
    end
    if(!when_Axi4LiteCrossbar_l160_2) begin
      if(when_Axi4LiteCrossbar_l195_9) begin
        s1_axi_bvalid = m2_axi_bvalid;
      end
    end
    if(!when_Axi4LiteCrossbar_l160_3) begin
      if(when_Axi4LiteCrossbar_l195_13) begin
        s1_axi_bvalid = m3_axi_bvalid;
      end
    end
  end

  always @(*) begin
    s1_axi_bresp = _zz_io_masters_1_b_payload_resp[1 : 0];
    if(!when_Axi4LiteCrossbar_l160) begin
      if(when_Axi4LiteCrossbar_l195_1) begin
        s1_axi_bresp = m0_axi_bresp;
      end
    end
    if(!when_Axi4LiteCrossbar_l160_1) begin
      if(when_Axi4LiteCrossbar_l195_5) begin
        s1_axi_bresp = m1_axi_bresp;
      end
    end
    if(!when_Axi4LiteCrossbar_l160_2) begin
      if(when_Axi4LiteCrossbar_l195_9) begin
        s1_axi_bresp = m2_axi_bresp;
      end
    end
    if(!when_Axi4LiteCrossbar_l160_3) begin
      if(when_Axi4LiteCrossbar_l195_13) begin
        s1_axi_bresp = m3_axi_bresp;
      end
    end
  end

  always @(*) begin
    s1_axi_arready = 1'b0;
    if(when_Axi4LiteCrossbar_l216) begin
      if(when_Axi4LiteCrossbar_l227) begin
        if(when_Axi4LiteCrossbar_l230_1) begin
          s1_axi_arready = m0_axi_arready;
        end
      end
    end
    if(when_Axi4LiteCrossbar_l216_1) begin
      if(when_Axi4LiteCrossbar_l227_1) begin
        if(when_Axi4LiteCrossbar_l230_5) begin
          s1_axi_arready = m1_axi_arready;
        end
      end
    end
    if(when_Axi4LiteCrossbar_l216_2) begin
      if(when_Axi4LiteCrossbar_l227_2) begin
        if(when_Axi4LiteCrossbar_l230_9) begin
          s1_axi_arready = m2_axi_arready;
        end
      end
    end
    if(when_Axi4LiteCrossbar_l216_3) begin
      if(when_Axi4LiteCrossbar_l227_3) begin
        if(when_Axi4LiteCrossbar_l230_13) begin
          s1_axi_arready = m3_axi_arready;
        end
      end
    end
  end

  always @(*) begin
    s1_axi_rvalid = 1'b0;
    if(!when_Axi4LiteCrossbar_l216) begin
      if(when_Axi4LiteCrossbar_l247_1) begin
        s1_axi_rvalid = m0_axi_rvalid;
      end
    end
    if(!when_Axi4LiteCrossbar_l216_1) begin
      if(when_Axi4LiteCrossbar_l247_5) begin
        s1_axi_rvalid = m1_axi_rvalid;
      end
    end
    if(!when_Axi4LiteCrossbar_l216_2) begin
      if(when_Axi4LiteCrossbar_l247_9) begin
        s1_axi_rvalid = m2_axi_rvalid;
      end
    end
    if(!when_Axi4LiteCrossbar_l216_3) begin
      if(when_Axi4LiteCrossbar_l247_13) begin
        s1_axi_rvalid = m3_axi_rvalid;
      end
    end
  end

  assign _zz_io_masters_1_r_payload_data = 34'h000000000;
  always @(*) begin
    s1_axi_rdata = _zz_io_masters_1_r_payload_data[31 : 0];
    if(!when_Axi4LiteCrossbar_l216) begin
      if(when_Axi4LiteCrossbar_l247_1) begin
        s1_axi_rdata = m0_axi_rdata;
      end
    end
    if(!when_Axi4LiteCrossbar_l216_1) begin
      if(when_Axi4LiteCrossbar_l247_5) begin
        s1_axi_rdata = m1_axi_rdata;
      end
    end
    if(!when_Axi4LiteCrossbar_l216_2) begin
      if(when_Axi4LiteCrossbar_l247_9) begin
        s1_axi_rdata = m2_axi_rdata;
      end
    end
    if(!when_Axi4LiteCrossbar_l216_3) begin
      if(when_Axi4LiteCrossbar_l247_13) begin
        s1_axi_rdata = m3_axi_rdata;
      end
    end
  end

  always @(*) begin
    s1_axi_rresp = _zz_io_masters_1_r_payload_data[33 : 32];
    if(!when_Axi4LiteCrossbar_l216) begin
      if(when_Axi4LiteCrossbar_l247_1) begin
        s1_axi_rresp = m0_axi_rresp;
      end
    end
    if(!when_Axi4LiteCrossbar_l216_1) begin
      if(when_Axi4LiteCrossbar_l247_5) begin
        s1_axi_rresp = m1_axi_rresp;
      end
    end
    if(!when_Axi4LiteCrossbar_l216_2) begin
      if(when_Axi4LiteCrossbar_l247_9) begin
        s1_axi_rresp = m2_axi_rresp;
      end
    end
    if(!when_Axi4LiteCrossbar_l216_3) begin
      if(when_Axi4LiteCrossbar_l247_13) begin
        s1_axi_rresp = m3_axi_rresp;
      end
    end
  end

  always @(*) begin
    s2_axi_awready = 1'b0;
    if(when_Axi4LiteCrossbar_l160) begin
      if(when_Axi4LiteCrossbar_l172) begin
        if(when_Axi4LiteCrossbar_l176_2) begin
          s2_axi_awready = m0_axi_awready;
        end
      end
    end
    if(when_Axi4LiteCrossbar_l160_1) begin
      if(when_Axi4LiteCrossbar_l172_1) begin
        if(when_Axi4LiteCrossbar_l176_6) begin
          s2_axi_awready = m1_axi_awready;
        end
      end
    end
    if(when_Axi4LiteCrossbar_l160_2) begin
      if(when_Axi4LiteCrossbar_l172_2) begin
        if(when_Axi4LiteCrossbar_l176_10) begin
          s2_axi_awready = m2_axi_awready;
        end
      end
    end
    if(when_Axi4LiteCrossbar_l160_3) begin
      if(when_Axi4LiteCrossbar_l172_3) begin
        if(when_Axi4LiteCrossbar_l176_14) begin
          s2_axi_awready = m3_axi_awready;
        end
      end
    end
  end

  always @(*) begin
    s2_axi_wready = 1'b0;
    if(!when_Axi4LiteCrossbar_l160) begin
      if(when_Axi4LiteCrossbar_l195_2) begin
        s2_axi_wready = m0_axi_wready;
      end
    end
    if(!when_Axi4LiteCrossbar_l160_1) begin
      if(when_Axi4LiteCrossbar_l195_6) begin
        s2_axi_wready = m1_axi_wready;
      end
    end
    if(!when_Axi4LiteCrossbar_l160_2) begin
      if(when_Axi4LiteCrossbar_l195_10) begin
        s2_axi_wready = m2_axi_wready;
      end
    end
    if(!when_Axi4LiteCrossbar_l160_3) begin
      if(when_Axi4LiteCrossbar_l195_14) begin
        s2_axi_wready = m3_axi_wready;
      end
    end
  end

  always @(*) begin
    s2_axi_bvalid = 1'b0;
    if(!when_Axi4LiteCrossbar_l160) begin
      if(when_Axi4LiteCrossbar_l195_2) begin
        s2_axi_bvalid = m0_axi_bvalid;
      end
    end
    if(!when_Axi4LiteCrossbar_l160_1) begin
      if(when_Axi4LiteCrossbar_l195_6) begin
        s2_axi_bvalid = m1_axi_bvalid;
      end
    end
    if(!when_Axi4LiteCrossbar_l160_2) begin
      if(when_Axi4LiteCrossbar_l195_10) begin
        s2_axi_bvalid = m2_axi_bvalid;
      end
    end
    if(!when_Axi4LiteCrossbar_l160_3) begin
      if(when_Axi4LiteCrossbar_l195_14) begin
        s2_axi_bvalid = m3_axi_bvalid;
      end
    end
  end

  always @(*) begin
    s2_axi_bresp = _zz_io_masters_2_b_payload_resp[1 : 0];
    if(!when_Axi4LiteCrossbar_l160) begin
      if(when_Axi4LiteCrossbar_l195_2) begin
        s2_axi_bresp = m0_axi_bresp;
      end
    end
    if(!when_Axi4LiteCrossbar_l160_1) begin
      if(when_Axi4LiteCrossbar_l195_6) begin
        s2_axi_bresp = m1_axi_bresp;
      end
    end
    if(!when_Axi4LiteCrossbar_l160_2) begin
      if(when_Axi4LiteCrossbar_l195_10) begin
        s2_axi_bresp = m2_axi_bresp;
      end
    end
    if(!when_Axi4LiteCrossbar_l160_3) begin
      if(when_Axi4LiteCrossbar_l195_14) begin
        s2_axi_bresp = m3_axi_bresp;
      end
    end
  end

  always @(*) begin
    s2_axi_arready = 1'b0;
    if(when_Axi4LiteCrossbar_l216) begin
      if(when_Axi4LiteCrossbar_l227) begin
        if(when_Axi4LiteCrossbar_l230_2) begin
          s2_axi_arready = m0_axi_arready;
        end
      end
    end
    if(when_Axi4LiteCrossbar_l216_1) begin
      if(when_Axi4LiteCrossbar_l227_1) begin
        if(when_Axi4LiteCrossbar_l230_6) begin
          s2_axi_arready = m1_axi_arready;
        end
      end
    end
    if(when_Axi4LiteCrossbar_l216_2) begin
      if(when_Axi4LiteCrossbar_l227_2) begin
        if(when_Axi4LiteCrossbar_l230_10) begin
          s2_axi_arready = m2_axi_arready;
        end
      end
    end
    if(when_Axi4LiteCrossbar_l216_3) begin
      if(when_Axi4LiteCrossbar_l227_3) begin
        if(when_Axi4LiteCrossbar_l230_14) begin
          s2_axi_arready = m3_axi_arready;
        end
      end
    end
  end

  always @(*) begin
    s2_axi_rvalid = 1'b0;
    if(!when_Axi4LiteCrossbar_l216) begin
      if(when_Axi4LiteCrossbar_l247_2) begin
        s2_axi_rvalid = m0_axi_rvalid;
      end
    end
    if(!when_Axi4LiteCrossbar_l216_1) begin
      if(when_Axi4LiteCrossbar_l247_6) begin
        s2_axi_rvalid = m1_axi_rvalid;
      end
    end
    if(!when_Axi4LiteCrossbar_l216_2) begin
      if(when_Axi4LiteCrossbar_l247_10) begin
        s2_axi_rvalid = m2_axi_rvalid;
      end
    end
    if(!when_Axi4LiteCrossbar_l216_3) begin
      if(when_Axi4LiteCrossbar_l247_14) begin
        s2_axi_rvalid = m3_axi_rvalid;
      end
    end
  end

  assign _zz_io_masters_2_r_payload_data = 34'h000000000;
  always @(*) begin
    s2_axi_rdata = _zz_io_masters_2_r_payload_data[31 : 0];
    if(!when_Axi4LiteCrossbar_l216) begin
      if(when_Axi4LiteCrossbar_l247_2) begin
        s2_axi_rdata = m0_axi_rdata;
      end
    end
    if(!when_Axi4LiteCrossbar_l216_1) begin
      if(when_Axi4LiteCrossbar_l247_6) begin
        s2_axi_rdata = m1_axi_rdata;
      end
    end
    if(!when_Axi4LiteCrossbar_l216_2) begin
      if(when_Axi4LiteCrossbar_l247_10) begin
        s2_axi_rdata = m2_axi_rdata;
      end
    end
    if(!when_Axi4LiteCrossbar_l216_3) begin
      if(when_Axi4LiteCrossbar_l247_14) begin
        s2_axi_rdata = m3_axi_rdata;
      end
    end
  end

  always @(*) begin
    s2_axi_rresp = _zz_io_masters_2_r_payload_data[33 : 32];
    if(!when_Axi4LiteCrossbar_l216) begin
      if(when_Axi4LiteCrossbar_l247_2) begin
        s2_axi_rresp = m0_axi_rresp;
      end
    end
    if(!when_Axi4LiteCrossbar_l216_1) begin
      if(when_Axi4LiteCrossbar_l247_6) begin
        s2_axi_rresp = m1_axi_rresp;
      end
    end
    if(!when_Axi4LiteCrossbar_l216_2) begin
      if(when_Axi4LiteCrossbar_l247_10) begin
        s2_axi_rresp = m2_axi_rresp;
      end
    end
    if(!when_Axi4LiteCrossbar_l216_3) begin
      if(when_Axi4LiteCrossbar_l247_14) begin
        s2_axi_rresp = m3_axi_rresp;
      end
    end
  end

  always @(*) begin
    s3_axi_awready = 1'b0;
    if(when_Axi4LiteCrossbar_l160) begin
      if(when_Axi4LiteCrossbar_l172) begin
        if(when_Axi4LiteCrossbar_l176_3) begin
          s3_axi_awready = m0_axi_awready;
        end
      end
    end
    if(when_Axi4LiteCrossbar_l160_1) begin
      if(when_Axi4LiteCrossbar_l172_1) begin
        if(when_Axi4LiteCrossbar_l176_7) begin
          s3_axi_awready = m1_axi_awready;
        end
      end
    end
    if(when_Axi4LiteCrossbar_l160_2) begin
      if(when_Axi4LiteCrossbar_l172_2) begin
        if(when_Axi4LiteCrossbar_l176_11) begin
          s3_axi_awready = m2_axi_awready;
        end
      end
    end
    if(when_Axi4LiteCrossbar_l160_3) begin
      if(when_Axi4LiteCrossbar_l172_3) begin
        if(when_Axi4LiteCrossbar_l176_15) begin
          s3_axi_awready = m3_axi_awready;
        end
      end
    end
  end

  always @(*) begin
    s3_axi_wready = 1'b0;
    if(!when_Axi4LiteCrossbar_l160) begin
      if(when_Axi4LiteCrossbar_l195_3) begin
        s3_axi_wready = m0_axi_wready;
      end
    end
    if(!when_Axi4LiteCrossbar_l160_1) begin
      if(when_Axi4LiteCrossbar_l195_7) begin
        s3_axi_wready = m1_axi_wready;
      end
    end
    if(!when_Axi4LiteCrossbar_l160_2) begin
      if(when_Axi4LiteCrossbar_l195_11) begin
        s3_axi_wready = m2_axi_wready;
      end
    end
    if(!when_Axi4LiteCrossbar_l160_3) begin
      if(when_Axi4LiteCrossbar_l195_15) begin
        s3_axi_wready = m3_axi_wready;
      end
    end
  end

  always @(*) begin
    s3_axi_bvalid = 1'b0;
    if(!when_Axi4LiteCrossbar_l160) begin
      if(when_Axi4LiteCrossbar_l195_3) begin
        s3_axi_bvalid = m0_axi_bvalid;
      end
    end
    if(!when_Axi4LiteCrossbar_l160_1) begin
      if(when_Axi4LiteCrossbar_l195_7) begin
        s3_axi_bvalid = m1_axi_bvalid;
      end
    end
    if(!when_Axi4LiteCrossbar_l160_2) begin
      if(when_Axi4LiteCrossbar_l195_11) begin
        s3_axi_bvalid = m2_axi_bvalid;
      end
    end
    if(!when_Axi4LiteCrossbar_l160_3) begin
      if(when_Axi4LiteCrossbar_l195_15) begin
        s3_axi_bvalid = m3_axi_bvalid;
      end
    end
  end

  always @(*) begin
    s3_axi_bresp = _zz_io_masters_3_b_payload_resp[1 : 0];
    if(!when_Axi4LiteCrossbar_l160) begin
      if(when_Axi4LiteCrossbar_l195_3) begin
        s3_axi_bresp = m0_axi_bresp;
      end
    end
    if(!when_Axi4LiteCrossbar_l160_1) begin
      if(when_Axi4LiteCrossbar_l195_7) begin
        s3_axi_bresp = m1_axi_bresp;
      end
    end
    if(!when_Axi4LiteCrossbar_l160_2) begin
      if(when_Axi4LiteCrossbar_l195_11) begin
        s3_axi_bresp = m2_axi_bresp;
      end
    end
    if(!when_Axi4LiteCrossbar_l160_3) begin
      if(when_Axi4LiteCrossbar_l195_15) begin
        s3_axi_bresp = m3_axi_bresp;
      end
    end
  end

  always @(*) begin
    s3_axi_arready = 1'b0;
    if(when_Axi4LiteCrossbar_l216) begin
      if(when_Axi4LiteCrossbar_l227) begin
        if(when_Axi4LiteCrossbar_l230_3) begin
          s3_axi_arready = m0_axi_arready;
        end
      end
    end
    if(when_Axi4LiteCrossbar_l216_1) begin
      if(when_Axi4LiteCrossbar_l227_1) begin
        if(when_Axi4LiteCrossbar_l230_7) begin
          s3_axi_arready = m1_axi_arready;
        end
      end
    end
    if(when_Axi4LiteCrossbar_l216_2) begin
      if(when_Axi4LiteCrossbar_l227_2) begin
        if(when_Axi4LiteCrossbar_l230_11) begin
          s3_axi_arready = m2_axi_arready;
        end
      end
    end
    if(when_Axi4LiteCrossbar_l216_3) begin
      if(when_Axi4LiteCrossbar_l227_3) begin
        if(when_Axi4LiteCrossbar_l230_15) begin
          s3_axi_arready = m3_axi_arready;
        end
      end
    end
  end

  always @(*) begin
    s3_axi_rvalid = 1'b0;
    if(!when_Axi4LiteCrossbar_l216) begin
      if(when_Axi4LiteCrossbar_l247_3) begin
        s3_axi_rvalid = m0_axi_rvalid;
      end
    end
    if(!when_Axi4LiteCrossbar_l216_1) begin
      if(when_Axi4LiteCrossbar_l247_7) begin
        s3_axi_rvalid = m1_axi_rvalid;
      end
    end
    if(!when_Axi4LiteCrossbar_l216_2) begin
      if(when_Axi4LiteCrossbar_l247_11) begin
        s3_axi_rvalid = m2_axi_rvalid;
      end
    end
    if(!when_Axi4LiteCrossbar_l216_3) begin
      if(when_Axi4LiteCrossbar_l247_15) begin
        s3_axi_rvalid = m3_axi_rvalid;
      end
    end
  end

  assign _zz_io_masters_3_r_payload_data = 34'h000000000;
  always @(*) begin
    s3_axi_rdata = _zz_io_masters_3_r_payload_data[31 : 0];
    if(!when_Axi4LiteCrossbar_l216) begin
      if(when_Axi4LiteCrossbar_l247_3) begin
        s3_axi_rdata = m0_axi_rdata;
      end
    end
    if(!when_Axi4LiteCrossbar_l216_1) begin
      if(when_Axi4LiteCrossbar_l247_7) begin
        s3_axi_rdata = m1_axi_rdata;
      end
    end
    if(!when_Axi4LiteCrossbar_l216_2) begin
      if(when_Axi4LiteCrossbar_l247_11) begin
        s3_axi_rdata = m2_axi_rdata;
      end
    end
    if(!when_Axi4LiteCrossbar_l216_3) begin
      if(when_Axi4LiteCrossbar_l247_15) begin
        s3_axi_rdata = m3_axi_rdata;
      end
    end
  end

  always @(*) begin
    s3_axi_rresp = _zz_io_masters_3_r_payload_data[33 : 32];
    if(!when_Axi4LiteCrossbar_l216) begin
      if(when_Axi4LiteCrossbar_l247_3) begin
        s3_axi_rresp = m0_axi_rresp;
      end
    end
    if(!when_Axi4LiteCrossbar_l216_1) begin
      if(when_Axi4LiteCrossbar_l247_7) begin
        s3_axi_rresp = m1_axi_rresp;
      end
    end
    if(!when_Axi4LiteCrossbar_l216_2) begin
      if(when_Axi4LiteCrossbar_l247_11) begin
        s3_axi_rresp = m2_axi_rresp;
      end
    end
    if(!when_Axi4LiteCrossbar_l216_3) begin
      if(when_Axi4LiteCrossbar_l247_15) begin
        s3_axi_rresp = m3_axi_rresp;
      end
    end
  end

  always @(*) begin
    m0_axi_awvalid = 1'b0;
    if(when_Axi4LiteCrossbar_l160) begin
      if(when_Axi4LiteCrossbar_l172) begin
        m0_axi_awvalid = 1'b1;
      end
    end
  end

  assign _zz_io_slaves_0_aw_payload_addr = 35'h000000000;
  always @(*) begin
    m0_axi_awaddr = _zz_io_slaves_0_aw_payload_addr[31 : 0];
    if(when_Axi4LiteCrossbar_l160) begin
      if(when_Axi4LiteCrossbar_l172) begin
        if(when_Axi4LiteCrossbar_l176) begin
          m0_axi_awaddr = s0_axi_awaddr;
        end
        if(when_Axi4LiteCrossbar_l176_1) begin
          m0_axi_awaddr = s1_axi_awaddr;
        end
        if(when_Axi4LiteCrossbar_l176_2) begin
          m0_axi_awaddr = s2_axi_awaddr;
        end
        if(when_Axi4LiteCrossbar_l176_3) begin
          m0_axi_awaddr = s3_axi_awaddr;
        end
      end
    end
  end

  always @(*) begin
    m0_axi_awprot = _zz_io_slaves_0_aw_payload_addr[34 : 32];
    if(when_Axi4LiteCrossbar_l160) begin
      if(when_Axi4LiteCrossbar_l172) begin
        if(when_Axi4LiteCrossbar_l176) begin
          m0_axi_awprot = s0_axi_awprot;
        end
        if(when_Axi4LiteCrossbar_l176_1) begin
          m0_axi_awprot = s1_axi_awprot;
        end
        if(when_Axi4LiteCrossbar_l176_2) begin
          m0_axi_awprot = s2_axi_awprot;
        end
        if(when_Axi4LiteCrossbar_l176_3) begin
          m0_axi_awprot = s3_axi_awprot;
        end
      end
    end
  end

  always @(*) begin
    m0_axi_wvalid = 1'b0;
    if(!when_Axi4LiteCrossbar_l160) begin
      if(when_Axi4LiteCrossbar_l195) begin
        m0_axi_wvalid = s0_axi_wvalid;
      end
      if(when_Axi4LiteCrossbar_l195_1) begin
        m0_axi_wvalid = s1_axi_wvalid;
      end
      if(when_Axi4LiteCrossbar_l195_2) begin
        m0_axi_wvalid = s2_axi_wvalid;
      end
      if(when_Axi4LiteCrossbar_l195_3) begin
        m0_axi_wvalid = s3_axi_wvalid;
      end
    end
  end

  assign _zz_io_slaves_0_w_payload_data = 36'h000000000;
  always @(*) begin
    m0_axi_wdata = _zz_io_slaves_0_w_payload_data[31 : 0];
    if(!when_Axi4LiteCrossbar_l160) begin
      if(when_Axi4LiteCrossbar_l195) begin
        m0_axi_wdata = s0_axi_wdata;
      end
      if(when_Axi4LiteCrossbar_l195_1) begin
        m0_axi_wdata = s1_axi_wdata;
      end
      if(when_Axi4LiteCrossbar_l195_2) begin
        m0_axi_wdata = s2_axi_wdata;
      end
      if(when_Axi4LiteCrossbar_l195_3) begin
        m0_axi_wdata = s3_axi_wdata;
      end
    end
  end

  always @(*) begin
    m0_axi_wstrb = _zz_io_slaves_0_w_payload_data[35 : 32];
    if(!when_Axi4LiteCrossbar_l160) begin
      if(when_Axi4LiteCrossbar_l195) begin
        m0_axi_wstrb = s0_axi_wstrb;
      end
      if(when_Axi4LiteCrossbar_l195_1) begin
        m0_axi_wstrb = s1_axi_wstrb;
      end
      if(when_Axi4LiteCrossbar_l195_2) begin
        m0_axi_wstrb = s2_axi_wstrb;
      end
      if(when_Axi4LiteCrossbar_l195_3) begin
        m0_axi_wstrb = s3_axi_wstrb;
      end
    end
  end

  always @(*) begin
    m0_axi_bready = 1'b0;
    if(!when_Axi4LiteCrossbar_l160) begin
      if(when_Axi4LiteCrossbar_l195) begin
        m0_axi_bready = s0_axi_bready;
      end
      if(when_Axi4LiteCrossbar_l195_1) begin
        m0_axi_bready = s1_axi_bready;
      end
      if(when_Axi4LiteCrossbar_l195_2) begin
        m0_axi_bready = s2_axi_bready;
      end
      if(when_Axi4LiteCrossbar_l195_3) begin
        m0_axi_bready = s3_axi_bready;
      end
    end
  end

  always @(*) begin
    m0_axi_arvalid = 1'b0;
    if(when_Axi4LiteCrossbar_l216) begin
      if(when_Axi4LiteCrossbar_l227) begin
        m0_axi_arvalid = 1'b1;
      end
    end
  end

  assign _zz_io_slaves_0_ar_payload_addr = 35'h000000000;
  always @(*) begin
    m0_axi_araddr = _zz_io_slaves_0_ar_payload_addr[31 : 0];
    if(when_Axi4LiteCrossbar_l216) begin
      if(when_Axi4LiteCrossbar_l227) begin
        if(when_Axi4LiteCrossbar_l230) begin
          m0_axi_araddr = s0_axi_araddr;
        end
        if(when_Axi4LiteCrossbar_l230_1) begin
          m0_axi_araddr = s1_axi_araddr;
        end
        if(when_Axi4LiteCrossbar_l230_2) begin
          m0_axi_araddr = s2_axi_araddr;
        end
        if(when_Axi4LiteCrossbar_l230_3) begin
          m0_axi_araddr = s3_axi_araddr;
        end
      end
    end
  end

  always @(*) begin
    m0_axi_arprot = _zz_io_slaves_0_ar_payload_addr[34 : 32];
    if(when_Axi4LiteCrossbar_l216) begin
      if(when_Axi4LiteCrossbar_l227) begin
        if(when_Axi4LiteCrossbar_l230) begin
          m0_axi_arprot = s0_axi_arprot;
        end
        if(when_Axi4LiteCrossbar_l230_1) begin
          m0_axi_arprot = s1_axi_arprot;
        end
        if(when_Axi4LiteCrossbar_l230_2) begin
          m0_axi_arprot = s2_axi_arprot;
        end
        if(when_Axi4LiteCrossbar_l230_3) begin
          m0_axi_arprot = s3_axi_arprot;
        end
      end
    end
  end

  always @(*) begin
    m0_axi_rready = 1'b0;
    if(!when_Axi4LiteCrossbar_l216) begin
      if(when_Axi4LiteCrossbar_l247) begin
        m0_axi_rready = s0_axi_rready;
      end
      if(when_Axi4LiteCrossbar_l247_1) begin
        m0_axi_rready = s1_axi_rready;
      end
      if(when_Axi4LiteCrossbar_l247_2) begin
        m0_axi_rready = s2_axi_rready;
      end
      if(when_Axi4LiteCrossbar_l247_3) begin
        m0_axi_rready = s3_axi_rready;
      end
    end
  end

  always @(*) begin
    m1_axi_awvalid = 1'b0;
    if(when_Axi4LiteCrossbar_l160_1) begin
      if(when_Axi4LiteCrossbar_l172_1) begin
        m1_axi_awvalid = 1'b1;
      end
    end
  end

  assign _zz_io_slaves_1_aw_payload_addr = 35'h000000000;
  always @(*) begin
    m1_axi_awaddr = _zz_io_slaves_1_aw_payload_addr[31 : 0];
    if(when_Axi4LiteCrossbar_l160_1) begin
      if(when_Axi4LiteCrossbar_l172_1) begin
        if(when_Axi4LiteCrossbar_l176_4) begin
          m1_axi_awaddr = s0_axi_awaddr;
        end
        if(when_Axi4LiteCrossbar_l176_5) begin
          m1_axi_awaddr = s1_axi_awaddr;
        end
        if(when_Axi4LiteCrossbar_l176_6) begin
          m1_axi_awaddr = s2_axi_awaddr;
        end
        if(when_Axi4LiteCrossbar_l176_7) begin
          m1_axi_awaddr = s3_axi_awaddr;
        end
      end
    end
  end

  always @(*) begin
    m1_axi_awprot = _zz_io_slaves_1_aw_payload_addr[34 : 32];
    if(when_Axi4LiteCrossbar_l160_1) begin
      if(when_Axi4LiteCrossbar_l172_1) begin
        if(when_Axi4LiteCrossbar_l176_4) begin
          m1_axi_awprot = s0_axi_awprot;
        end
        if(when_Axi4LiteCrossbar_l176_5) begin
          m1_axi_awprot = s1_axi_awprot;
        end
        if(when_Axi4LiteCrossbar_l176_6) begin
          m1_axi_awprot = s2_axi_awprot;
        end
        if(when_Axi4LiteCrossbar_l176_7) begin
          m1_axi_awprot = s3_axi_awprot;
        end
      end
    end
  end

  always @(*) begin
    m1_axi_wvalid = 1'b0;
    if(!when_Axi4LiteCrossbar_l160_1) begin
      if(when_Axi4LiteCrossbar_l195_4) begin
        m1_axi_wvalid = s0_axi_wvalid;
      end
      if(when_Axi4LiteCrossbar_l195_5) begin
        m1_axi_wvalid = s1_axi_wvalid;
      end
      if(when_Axi4LiteCrossbar_l195_6) begin
        m1_axi_wvalid = s2_axi_wvalid;
      end
      if(when_Axi4LiteCrossbar_l195_7) begin
        m1_axi_wvalid = s3_axi_wvalid;
      end
    end
  end

  assign _zz_io_slaves_1_w_payload_data = 36'h000000000;
  always @(*) begin
    m1_axi_wdata = _zz_io_slaves_1_w_payload_data[31 : 0];
    if(!when_Axi4LiteCrossbar_l160_1) begin
      if(when_Axi4LiteCrossbar_l195_4) begin
        m1_axi_wdata = s0_axi_wdata;
      end
      if(when_Axi4LiteCrossbar_l195_5) begin
        m1_axi_wdata = s1_axi_wdata;
      end
      if(when_Axi4LiteCrossbar_l195_6) begin
        m1_axi_wdata = s2_axi_wdata;
      end
      if(when_Axi4LiteCrossbar_l195_7) begin
        m1_axi_wdata = s3_axi_wdata;
      end
    end
  end

  always @(*) begin
    m1_axi_wstrb = _zz_io_slaves_1_w_payload_data[35 : 32];
    if(!when_Axi4LiteCrossbar_l160_1) begin
      if(when_Axi4LiteCrossbar_l195_4) begin
        m1_axi_wstrb = s0_axi_wstrb;
      end
      if(when_Axi4LiteCrossbar_l195_5) begin
        m1_axi_wstrb = s1_axi_wstrb;
      end
      if(when_Axi4LiteCrossbar_l195_6) begin
        m1_axi_wstrb = s2_axi_wstrb;
      end
      if(when_Axi4LiteCrossbar_l195_7) begin
        m1_axi_wstrb = s3_axi_wstrb;
      end
    end
  end

  always @(*) begin
    m1_axi_bready = 1'b0;
    if(!when_Axi4LiteCrossbar_l160_1) begin
      if(when_Axi4LiteCrossbar_l195_4) begin
        m1_axi_bready = s0_axi_bready;
      end
      if(when_Axi4LiteCrossbar_l195_5) begin
        m1_axi_bready = s1_axi_bready;
      end
      if(when_Axi4LiteCrossbar_l195_6) begin
        m1_axi_bready = s2_axi_bready;
      end
      if(when_Axi4LiteCrossbar_l195_7) begin
        m1_axi_bready = s3_axi_bready;
      end
    end
  end

  always @(*) begin
    m1_axi_arvalid = 1'b0;
    if(when_Axi4LiteCrossbar_l216_1) begin
      if(when_Axi4LiteCrossbar_l227_1) begin
        m1_axi_arvalid = 1'b1;
      end
    end
  end

  assign _zz_io_slaves_1_ar_payload_addr = 35'h000000000;
  always @(*) begin
    m1_axi_araddr = _zz_io_slaves_1_ar_payload_addr[31 : 0];
    if(when_Axi4LiteCrossbar_l216_1) begin
      if(when_Axi4LiteCrossbar_l227_1) begin
        if(when_Axi4LiteCrossbar_l230_4) begin
          m1_axi_araddr = s0_axi_araddr;
        end
        if(when_Axi4LiteCrossbar_l230_5) begin
          m1_axi_araddr = s1_axi_araddr;
        end
        if(when_Axi4LiteCrossbar_l230_6) begin
          m1_axi_araddr = s2_axi_araddr;
        end
        if(when_Axi4LiteCrossbar_l230_7) begin
          m1_axi_araddr = s3_axi_araddr;
        end
      end
    end
  end

  always @(*) begin
    m1_axi_arprot = _zz_io_slaves_1_ar_payload_addr[34 : 32];
    if(when_Axi4LiteCrossbar_l216_1) begin
      if(when_Axi4LiteCrossbar_l227_1) begin
        if(when_Axi4LiteCrossbar_l230_4) begin
          m1_axi_arprot = s0_axi_arprot;
        end
        if(when_Axi4LiteCrossbar_l230_5) begin
          m1_axi_arprot = s1_axi_arprot;
        end
        if(when_Axi4LiteCrossbar_l230_6) begin
          m1_axi_arprot = s2_axi_arprot;
        end
        if(when_Axi4LiteCrossbar_l230_7) begin
          m1_axi_arprot = s3_axi_arprot;
        end
      end
    end
  end

  always @(*) begin
    m1_axi_rready = 1'b0;
    if(!when_Axi4LiteCrossbar_l216_1) begin
      if(when_Axi4LiteCrossbar_l247_4) begin
        m1_axi_rready = s0_axi_rready;
      end
      if(when_Axi4LiteCrossbar_l247_5) begin
        m1_axi_rready = s1_axi_rready;
      end
      if(when_Axi4LiteCrossbar_l247_6) begin
        m1_axi_rready = s2_axi_rready;
      end
      if(when_Axi4LiteCrossbar_l247_7) begin
        m1_axi_rready = s3_axi_rready;
      end
    end
  end

  always @(*) begin
    m2_axi_awvalid = 1'b0;
    if(when_Axi4LiteCrossbar_l160_2) begin
      if(when_Axi4LiteCrossbar_l172_2) begin
        m2_axi_awvalid = 1'b1;
      end
    end
  end

  assign _zz_io_slaves_2_aw_payload_addr = 35'h000000000;
  always @(*) begin
    m2_axi_awaddr = _zz_io_slaves_2_aw_payload_addr[31 : 0];
    if(when_Axi4LiteCrossbar_l160_2) begin
      if(when_Axi4LiteCrossbar_l172_2) begin
        if(when_Axi4LiteCrossbar_l176_8) begin
          m2_axi_awaddr = s0_axi_awaddr;
        end
        if(when_Axi4LiteCrossbar_l176_9) begin
          m2_axi_awaddr = s1_axi_awaddr;
        end
        if(when_Axi4LiteCrossbar_l176_10) begin
          m2_axi_awaddr = s2_axi_awaddr;
        end
        if(when_Axi4LiteCrossbar_l176_11) begin
          m2_axi_awaddr = s3_axi_awaddr;
        end
      end
    end
  end

  always @(*) begin
    m2_axi_awprot = _zz_io_slaves_2_aw_payload_addr[34 : 32];
    if(when_Axi4LiteCrossbar_l160_2) begin
      if(when_Axi4LiteCrossbar_l172_2) begin
        if(when_Axi4LiteCrossbar_l176_8) begin
          m2_axi_awprot = s0_axi_awprot;
        end
        if(when_Axi4LiteCrossbar_l176_9) begin
          m2_axi_awprot = s1_axi_awprot;
        end
        if(when_Axi4LiteCrossbar_l176_10) begin
          m2_axi_awprot = s2_axi_awprot;
        end
        if(when_Axi4LiteCrossbar_l176_11) begin
          m2_axi_awprot = s3_axi_awprot;
        end
      end
    end
  end

  always @(*) begin
    m2_axi_wvalid = 1'b0;
    if(!when_Axi4LiteCrossbar_l160_2) begin
      if(when_Axi4LiteCrossbar_l195_8) begin
        m2_axi_wvalid = s0_axi_wvalid;
      end
      if(when_Axi4LiteCrossbar_l195_9) begin
        m2_axi_wvalid = s1_axi_wvalid;
      end
      if(when_Axi4LiteCrossbar_l195_10) begin
        m2_axi_wvalid = s2_axi_wvalid;
      end
      if(when_Axi4LiteCrossbar_l195_11) begin
        m2_axi_wvalid = s3_axi_wvalid;
      end
    end
  end

  assign _zz_io_slaves_2_w_payload_data = 36'h000000000;
  always @(*) begin
    m2_axi_wdata = _zz_io_slaves_2_w_payload_data[31 : 0];
    if(!when_Axi4LiteCrossbar_l160_2) begin
      if(when_Axi4LiteCrossbar_l195_8) begin
        m2_axi_wdata = s0_axi_wdata;
      end
      if(when_Axi4LiteCrossbar_l195_9) begin
        m2_axi_wdata = s1_axi_wdata;
      end
      if(when_Axi4LiteCrossbar_l195_10) begin
        m2_axi_wdata = s2_axi_wdata;
      end
      if(when_Axi4LiteCrossbar_l195_11) begin
        m2_axi_wdata = s3_axi_wdata;
      end
    end
  end

  always @(*) begin
    m2_axi_wstrb = _zz_io_slaves_2_w_payload_data[35 : 32];
    if(!when_Axi4LiteCrossbar_l160_2) begin
      if(when_Axi4LiteCrossbar_l195_8) begin
        m2_axi_wstrb = s0_axi_wstrb;
      end
      if(when_Axi4LiteCrossbar_l195_9) begin
        m2_axi_wstrb = s1_axi_wstrb;
      end
      if(when_Axi4LiteCrossbar_l195_10) begin
        m2_axi_wstrb = s2_axi_wstrb;
      end
      if(when_Axi4LiteCrossbar_l195_11) begin
        m2_axi_wstrb = s3_axi_wstrb;
      end
    end
  end

  always @(*) begin
    m2_axi_bready = 1'b0;
    if(!when_Axi4LiteCrossbar_l160_2) begin
      if(when_Axi4LiteCrossbar_l195_8) begin
        m2_axi_bready = s0_axi_bready;
      end
      if(when_Axi4LiteCrossbar_l195_9) begin
        m2_axi_bready = s1_axi_bready;
      end
      if(when_Axi4LiteCrossbar_l195_10) begin
        m2_axi_bready = s2_axi_bready;
      end
      if(when_Axi4LiteCrossbar_l195_11) begin
        m2_axi_bready = s3_axi_bready;
      end
    end
  end

  always @(*) begin
    m2_axi_arvalid = 1'b0;
    if(when_Axi4LiteCrossbar_l216_2) begin
      if(when_Axi4LiteCrossbar_l227_2) begin
        m2_axi_arvalid = 1'b1;
      end
    end
  end

  assign _zz_io_slaves_2_ar_payload_addr = 35'h000000000;
  always @(*) begin
    m2_axi_araddr = _zz_io_slaves_2_ar_payload_addr[31 : 0];
    if(when_Axi4LiteCrossbar_l216_2) begin
      if(when_Axi4LiteCrossbar_l227_2) begin
        if(when_Axi4LiteCrossbar_l230_8) begin
          m2_axi_araddr = s0_axi_araddr;
        end
        if(when_Axi4LiteCrossbar_l230_9) begin
          m2_axi_araddr = s1_axi_araddr;
        end
        if(when_Axi4LiteCrossbar_l230_10) begin
          m2_axi_araddr = s2_axi_araddr;
        end
        if(when_Axi4LiteCrossbar_l230_11) begin
          m2_axi_araddr = s3_axi_araddr;
        end
      end
    end
  end

  always @(*) begin
    m2_axi_arprot = _zz_io_slaves_2_ar_payload_addr[34 : 32];
    if(when_Axi4LiteCrossbar_l216_2) begin
      if(when_Axi4LiteCrossbar_l227_2) begin
        if(when_Axi4LiteCrossbar_l230_8) begin
          m2_axi_arprot = s0_axi_arprot;
        end
        if(when_Axi4LiteCrossbar_l230_9) begin
          m2_axi_arprot = s1_axi_arprot;
        end
        if(when_Axi4LiteCrossbar_l230_10) begin
          m2_axi_arprot = s2_axi_arprot;
        end
        if(when_Axi4LiteCrossbar_l230_11) begin
          m2_axi_arprot = s3_axi_arprot;
        end
      end
    end
  end

  always @(*) begin
    m2_axi_rready = 1'b0;
    if(!when_Axi4LiteCrossbar_l216_2) begin
      if(when_Axi4LiteCrossbar_l247_8) begin
        m2_axi_rready = s0_axi_rready;
      end
      if(when_Axi4LiteCrossbar_l247_9) begin
        m2_axi_rready = s1_axi_rready;
      end
      if(when_Axi4LiteCrossbar_l247_10) begin
        m2_axi_rready = s2_axi_rready;
      end
      if(when_Axi4LiteCrossbar_l247_11) begin
        m2_axi_rready = s3_axi_rready;
      end
    end
  end

  always @(*) begin
    m3_axi_awvalid = 1'b0;
    if(when_Axi4LiteCrossbar_l160_3) begin
      if(when_Axi4LiteCrossbar_l172_3) begin
        m3_axi_awvalid = 1'b1;
      end
    end
  end

  assign _zz_io_slaves_3_aw_payload_addr = 35'h000000000;
  always @(*) begin
    m3_axi_awaddr = _zz_io_slaves_3_aw_payload_addr[31 : 0];
    if(when_Axi4LiteCrossbar_l160_3) begin
      if(when_Axi4LiteCrossbar_l172_3) begin
        if(when_Axi4LiteCrossbar_l176_12) begin
          m3_axi_awaddr = s0_axi_awaddr;
        end
        if(when_Axi4LiteCrossbar_l176_13) begin
          m3_axi_awaddr = s1_axi_awaddr;
        end
        if(when_Axi4LiteCrossbar_l176_14) begin
          m3_axi_awaddr = s2_axi_awaddr;
        end
        if(when_Axi4LiteCrossbar_l176_15) begin
          m3_axi_awaddr = s3_axi_awaddr;
        end
      end
    end
  end

  always @(*) begin
    m3_axi_awprot = _zz_io_slaves_3_aw_payload_addr[34 : 32];
    if(when_Axi4LiteCrossbar_l160_3) begin
      if(when_Axi4LiteCrossbar_l172_3) begin
        if(when_Axi4LiteCrossbar_l176_12) begin
          m3_axi_awprot = s0_axi_awprot;
        end
        if(when_Axi4LiteCrossbar_l176_13) begin
          m3_axi_awprot = s1_axi_awprot;
        end
        if(when_Axi4LiteCrossbar_l176_14) begin
          m3_axi_awprot = s2_axi_awprot;
        end
        if(when_Axi4LiteCrossbar_l176_15) begin
          m3_axi_awprot = s3_axi_awprot;
        end
      end
    end
  end

  always @(*) begin
    m3_axi_wvalid = 1'b0;
    if(!when_Axi4LiteCrossbar_l160_3) begin
      if(when_Axi4LiteCrossbar_l195_12) begin
        m3_axi_wvalid = s0_axi_wvalid;
      end
      if(when_Axi4LiteCrossbar_l195_13) begin
        m3_axi_wvalid = s1_axi_wvalid;
      end
      if(when_Axi4LiteCrossbar_l195_14) begin
        m3_axi_wvalid = s2_axi_wvalid;
      end
      if(when_Axi4LiteCrossbar_l195_15) begin
        m3_axi_wvalid = s3_axi_wvalid;
      end
    end
  end

  assign _zz_io_slaves_3_w_payload_data = 36'h000000000;
  always @(*) begin
    m3_axi_wdata = _zz_io_slaves_3_w_payload_data[31 : 0];
    if(!when_Axi4LiteCrossbar_l160_3) begin
      if(when_Axi4LiteCrossbar_l195_12) begin
        m3_axi_wdata = s0_axi_wdata;
      end
      if(when_Axi4LiteCrossbar_l195_13) begin
        m3_axi_wdata = s1_axi_wdata;
      end
      if(when_Axi4LiteCrossbar_l195_14) begin
        m3_axi_wdata = s2_axi_wdata;
      end
      if(when_Axi4LiteCrossbar_l195_15) begin
        m3_axi_wdata = s3_axi_wdata;
      end
    end
  end

  always @(*) begin
    m3_axi_wstrb = _zz_io_slaves_3_w_payload_data[35 : 32];
    if(!when_Axi4LiteCrossbar_l160_3) begin
      if(when_Axi4LiteCrossbar_l195_12) begin
        m3_axi_wstrb = s0_axi_wstrb;
      end
      if(when_Axi4LiteCrossbar_l195_13) begin
        m3_axi_wstrb = s1_axi_wstrb;
      end
      if(when_Axi4LiteCrossbar_l195_14) begin
        m3_axi_wstrb = s2_axi_wstrb;
      end
      if(when_Axi4LiteCrossbar_l195_15) begin
        m3_axi_wstrb = s3_axi_wstrb;
      end
    end
  end

  always @(*) begin
    m3_axi_bready = 1'b0;
    if(!when_Axi4LiteCrossbar_l160_3) begin
      if(when_Axi4LiteCrossbar_l195_12) begin
        m3_axi_bready = s0_axi_bready;
      end
      if(when_Axi4LiteCrossbar_l195_13) begin
        m3_axi_bready = s1_axi_bready;
      end
      if(when_Axi4LiteCrossbar_l195_14) begin
        m3_axi_bready = s2_axi_bready;
      end
      if(when_Axi4LiteCrossbar_l195_15) begin
        m3_axi_bready = s3_axi_bready;
      end
    end
  end

  always @(*) begin
    m3_axi_arvalid = 1'b0;
    if(when_Axi4LiteCrossbar_l216_3) begin
      if(when_Axi4LiteCrossbar_l227_3) begin
        m3_axi_arvalid = 1'b1;
      end
    end
  end

  assign _zz_io_slaves_3_ar_payload_addr = 35'h000000000;
  always @(*) begin
    m3_axi_araddr = _zz_io_slaves_3_ar_payload_addr[31 : 0];
    if(when_Axi4LiteCrossbar_l216_3) begin
      if(when_Axi4LiteCrossbar_l227_3) begin
        if(when_Axi4LiteCrossbar_l230_12) begin
          m3_axi_araddr = s0_axi_araddr;
        end
        if(when_Axi4LiteCrossbar_l230_13) begin
          m3_axi_araddr = s1_axi_araddr;
        end
        if(when_Axi4LiteCrossbar_l230_14) begin
          m3_axi_araddr = s2_axi_araddr;
        end
        if(when_Axi4LiteCrossbar_l230_15) begin
          m3_axi_araddr = s3_axi_araddr;
        end
      end
    end
  end

  always @(*) begin
    m3_axi_arprot = _zz_io_slaves_3_ar_payload_addr[34 : 32];
    if(when_Axi4LiteCrossbar_l216_3) begin
      if(when_Axi4LiteCrossbar_l227_3) begin
        if(when_Axi4LiteCrossbar_l230_12) begin
          m3_axi_arprot = s0_axi_arprot;
        end
        if(when_Axi4LiteCrossbar_l230_13) begin
          m3_axi_arprot = s1_axi_arprot;
        end
        if(when_Axi4LiteCrossbar_l230_14) begin
          m3_axi_arprot = s2_axi_arprot;
        end
        if(when_Axi4LiteCrossbar_l230_15) begin
          m3_axi_arprot = s3_axi_arprot;
        end
      end
    end
  end

  always @(*) begin
    m3_axi_rready = 1'b0;
    if(!when_Axi4LiteCrossbar_l216_3) begin
      if(when_Axi4LiteCrossbar_l247_12) begin
        m3_axi_rready = s0_axi_rready;
      end
      if(when_Axi4LiteCrossbar_l247_13) begin
        m3_axi_rready = s1_axi_rready;
      end
      if(when_Axi4LiteCrossbar_l247_14) begin
        m3_axi_rready = s2_axi_rready;
      end
      if(when_Axi4LiteCrossbar_l247_15) begin
        m3_axi_rready = s3_axi_rready;
      end
    end
  end

  assign when_Axi4LiteCrossbar_l160 = (! wrActive_0);
  always @(*) begin
    _zz_when_Axi4LiteCrossbar_l172_1[0] = ((32'h00000000 <= s0_axi_awaddr) && (s0_axi_awaddr < 32'h00010000));
    _zz_when_Axi4LiteCrossbar_l172_1[1] = ((32'h00010000 <= s0_axi_awaddr) && (s0_axi_awaddr < 32'h00020000));
    _zz_when_Axi4LiteCrossbar_l172_1[2] = ((32'h00020000 <= s0_axi_awaddr) && (s0_axi_awaddr < 32'h00030000));
    _zz_when_Axi4LiteCrossbar_l172_1[3] = ((32'h00030000 <= s0_axi_awaddr) && (s0_axi_awaddr < 32'h00040000));
  end

  always @(*) begin
    _zz_when_Axi4LiteCrossbar_l172[0] = (s0_axi_awvalid && _zz_when_Axi4LiteCrossbar_l172_1[0]);
    _zz_when_Axi4LiteCrossbar_l172[1] = (s1_axi_awvalid && _zz_when_Axi4LiteCrossbar_l172_2[0]);
    _zz_when_Axi4LiteCrossbar_l172[2] = (s2_axi_awvalid && _zz_when_Axi4LiteCrossbar_l172_3[0]);
    _zz_when_Axi4LiteCrossbar_l172[3] = (s3_axi_awvalid && _zz_when_Axi4LiteCrossbar_l172_4[0]);
  end

  always @(*) begin
    _zz_when_Axi4LiteCrossbar_l172_2[0] = ((32'h00000000 <= s1_axi_awaddr) && (s1_axi_awaddr < 32'h00010000));
    _zz_when_Axi4LiteCrossbar_l172_2[1] = ((32'h00010000 <= s1_axi_awaddr) && (s1_axi_awaddr < 32'h00020000));
    _zz_when_Axi4LiteCrossbar_l172_2[2] = ((32'h00020000 <= s1_axi_awaddr) && (s1_axi_awaddr < 32'h00030000));
    _zz_when_Axi4LiteCrossbar_l172_2[3] = ((32'h00030000 <= s1_axi_awaddr) && (s1_axi_awaddr < 32'h00040000));
  end

  always @(*) begin
    _zz_when_Axi4LiteCrossbar_l172_3[0] = ((32'h00000000 <= s2_axi_awaddr) && (s2_axi_awaddr < 32'h00010000));
    _zz_when_Axi4LiteCrossbar_l172_3[1] = ((32'h00010000 <= s2_axi_awaddr) && (s2_axi_awaddr < 32'h00020000));
    _zz_when_Axi4LiteCrossbar_l172_3[2] = ((32'h00020000 <= s2_axi_awaddr) && (s2_axi_awaddr < 32'h00030000));
    _zz_when_Axi4LiteCrossbar_l172_3[3] = ((32'h00030000 <= s2_axi_awaddr) && (s2_axi_awaddr < 32'h00040000));
  end

  always @(*) begin
    _zz_when_Axi4LiteCrossbar_l172_4[0] = ((32'h00000000 <= s3_axi_awaddr) && (s3_axi_awaddr < 32'h00010000));
    _zz_when_Axi4LiteCrossbar_l172_4[1] = ((32'h00010000 <= s3_axi_awaddr) && (s3_axi_awaddr < 32'h00020000));
    _zz_when_Axi4LiteCrossbar_l172_4[2] = ((32'h00020000 <= s3_axi_awaddr) && (s3_axi_awaddr < 32'h00030000));
    _zz_when_Axi4LiteCrossbar_l172_4[3] = ((32'h00030000 <= s3_axi_awaddr) && (s3_axi_awaddr < 32'h00040000));
  end

  assign _zz_when_Axi4LiteCrossbar_l117 = _zz_when_Axi4LiteCrossbar_l172;
  assign _zz_when_Axi4LiteCrossbar_l117_1 = (_zz_when_Axi4LiteCrossbar_l117 & (~ _zz__zz_when_Axi4LiteCrossbar_l117_1));
  always @(*) begin
    _zz_wrGranted_0 = 2'b00;
    if(when_Axi4LiteCrossbar_l117) begin
      _zz_wrGranted_0 = 2'b00;
    end
    if(when_Axi4LiteCrossbar_l117_1) begin
      _zz_wrGranted_0 = 2'b01;
    end
    if(when_Axi4LiteCrossbar_l117_2) begin
      _zz_wrGranted_0 = 2'b10;
    end
    if(when_Axi4LiteCrossbar_l117_3) begin
      _zz_wrGranted_0 = 2'b11;
    end
  end

  assign when_Axi4LiteCrossbar_l117 = _zz_when_Axi4LiteCrossbar_l117_1[0];
  assign when_Axi4LiteCrossbar_l117_1 = _zz_when_Axi4LiteCrossbar_l117_1[1];
  assign when_Axi4LiteCrossbar_l117_2 = _zz_when_Axi4LiteCrossbar_l117_1[2];
  assign when_Axi4LiteCrossbar_l117_3 = _zz_when_Axi4LiteCrossbar_l117_1[3];
  assign when_Axi4LiteCrossbar_l172 = (|_zz_when_Axi4LiteCrossbar_l172);
  assign when_Axi4LiteCrossbar_l176 = (_zz_wrGranted_0 == 2'b00);
  assign when_Axi4LiteCrossbar_l176_1 = (_zz_wrGranted_0 == 2'b01);
  assign when_Axi4LiteCrossbar_l176_2 = (_zz_wrGranted_0 == 2'b10);
  assign when_Axi4LiteCrossbar_l176_3 = (_zz_wrGranted_0 == 2'b11);
  assign io_slaves_0_aw_fire = (m0_axi_awvalid && m0_axi_awready);
  assign when_Axi4LiteCrossbar_l195 = (wrGranted_0 == 2'b00);
  assign when_Axi4LiteCrossbar_l195_1 = (wrGranted_0 == 2'b01);
  assign when_Axi4LiteCrossbar_l195_2 = (wrGranted_0 == 2'b10);
  assign when_Axi4LiteCrossbar_l195_3 = (wrGranted_0 == 2'b11);
  assign io_slaves_0_b_fire = (m0_axi_bvalid && m0_axi_bready);
  assign when_Axi4LiteCrossbar_l160_1 = (! wrActive_1);
  always @(*) begin
    _zz_when_Axi4LiteCrossbar_l172_6[0] = ((32'h00000000 <= s0_axi_awaddr) && (s0_axi_awaddr < 32'h00010000));
    _zz_when_Axi4LiteCrossbar_l172_6[1] = ((32'h00010000 <= s0_axi_awaddr) && (s0_axi_awaddr < 32'h00020000));
    _zz_when_Axi4LiteCrossbar_l172_6[2] = ((32'h00020000 <= s0_axi_awaddr) && (s0_axi_awaddr < 32'h00030000));
    _zz_when_Axi4LiteCrossbar_l172_6[3] = ((32'h00030000 <= s0_axi_awaddr) && (s0_axi_awaddr < 32'h00040000));
  end

  always @(*) begin
    _zz_when_Axi4LiteCrossbar_l172_5[0] = (s0_axi_awvalid && _zz_when_Axi4LiteCrossbar_l172_6[1]);
    _zz_when_Axi4LiteCrossbar_l172_5[1] = (s1_axi_awvalid && _zz_when_Axi4LiteCrossbar_l172_7[1]);
    _zz_when_Axi4LiteCrossbar_l172_5[2] = (s2_axi_awvalid && _zz_when_Axi4LiteCrossbar_l172_8[1]);
    _zz_when_Axi4LiteCrossbar_l172_5[3] = (s3_axi_awvalid && _zz_when_Axi4LiteCrossbar_l172_9[1]);
  end

  always @(*) begin
    _zz_when_Axi4LiteCrossbar_l172_7[0] = ((32'h00000000 <= s1_axi_awaddr) && (s1_axi_awaddr < 32'h00010000));
    _zz_when_Axi4LiteCrossbar_l172_7[1] = ((32'h00010000 <= s1_axi_awaddr) && (s1_axi_awaddr < 32'h00020000));
    _zz_when_Axi4LiteCrossbar_l172_7[2] = ((32'h00020000 <= s1_axi_awaddr) && (s1_axi_awaddr < 32'h00030000));
    _zz_when_Axi4LiteCrossbar_l172_7[3] = ((32'h00030000 <= s1_axi_awaddr) && (s1_axi_awaddr < 32'h00040000));
  end

  always @(*) begin
    _zz_when_Axi4LiteCrossbar_l172_8[0] = ((32'h00000000 <= s2_axi_awaddr) && (s2_axi_awaddr < 32'h00010000));
    _zz_when_Axi4LiteCrossbar_l172_8[1] = ((32'h00010000 <= s2_axi_awaddr) && (s2_axi_awaddr < 32'h00020000));
    _zz_when_Axi4LiteCrossbar_l172_8[2] = ((32'h00020000 <= s2_axi_awaddr) && (s2_axi_awaddr < 32'h00030000));
    _zz_when_Axi4LiteCrossbar_l172_8[3] = ((32'h00030000 <= s2_axi_awaddr) && (s2_axi_awaddr < 32'h00040000));
  end

  always @(*) begin
    _zz_when_Axi4LiteCrossbar_l172_9[0] = ((32'h00000000 <= s3_axi_awaddr) && (s3_axi_awaddr < 32'h00010000));
    _zz_when_Axi4LiteCrossbar_l172_9[1] = ((32'h00010000 <= s3_axi_awaddr) && (s3_axi_awaddr < 32'h00020000));
    _zz_when_Axi4LiteCrossbar_l172_9[2] = ((32'h00020000 <= s3_axi_awaddr) && (s3_axi_awaddr < 32'h00030000));
    _zz_when_Axi4LiteCrossbar_l172_9[3] = ((32'h00030000 <= s3_axi_awaddr) && (s3_axi_awaddr < 32'h00040000));
  end

  assign _zz_when_Axi4LiteCrossbar_l117_2 = _zz_when_Axi4LiteCrossbar_l172_5;
  assign _zz_when_Axi4LiteCrossbar_l117_3 = (_zz_when_Axi4LiteCrossbar_l117_2 & (~ _zz__zz_when_Axi4LiteCrossbar_l117_3));
  always @(*) begin
    _zz_wrGranted_1 = 2'b00;
    if(when_Axi4LiteCrossbar_l117_4) begin
      _zz_wrGranted_1 = 2'b00;
    end
    if(when_Axi4LiteCrossbar_l117_5) begin
      _zz_wrGranted_1 = 2'b01;
    end
    if(when_Axi4LiteCrossbar_l117_6) begin
      _zz_wrGranted_1 = 2'b10;
    end
    if(when_Axi4LiteCrossbar_l117_7) begin
      _zz_wrGranted_1 = 2'b11;
    end
  end

  assign when_Axi4LiteCrossbar_l117_4 = _zz_when_Axi4LiteCrossbar_l117_3[0];
  assign when_Axi4LiteCrossbar_l117_5 = _zz_when_Axi4LiteCrossbar_l117_3[1];
  assign when_Axi4LiteCrossbar_l117_6 = _zz_when_Axi4LiteCrossbar_l117_3[2];
  assign when_Axi4LiteCrossbar_l117_7 = _zz_when_Axi4LiteCrossbar_l117_3[3];
  assign when_Axi4LiteCrossbar_l172_1 = (|_zz_when_Axi4LiteCrossbar_l172_5);
  assign when_Axi4LiteCrossbar_l176_4 = (_zz_wrGranted_1 == 2'b00);
  assign when_Axi4LiteCrossbar_l176_5 = (_zz_wrGranted_1 == 2'b01);
  assign when_Axi4LiteCrossbar_l176_6 = (_zz_wrGranted_1 == 2'b10);
  assign when_Axi4LiteCrossbar_l176_7 = (_zz_wrGranted_1 == 2'b11);
  assign io_slaves_1_aw_fire = (m1_axi_awvalid && m1_axi_awready);
  assign when_Axi4LiteCrossbar_l195_4 = (wrGranted_1 == 2'b00);
  assign when_Axi4LiteCrossbar_l195_5 = (wrGranted_1 == 2'b01);
  assign when_Axi4LiteCrossbar_l195_6 = (wrGranted_1 == 2'b10);
  assign when_Axi4LiteCrossbar_l195_7 = (wrGranted_1 == 2'b11);
  assign io_slaves_1_b_fire = (m1_axi_bvalid && m1_axi_bready);
  assign when_Axi4LiteCrossbar_l160_2 = (! wrActive_2);
  always @(*) begin
    _zz_when_Axi4LiteCrossbar_l172_11[0] = ((32'h00000000 <= s0_axi_awaddr) && (s0_axi_awaddr < 32'h00010000));
    _zz_when_Axi4LiteCrossbar_l172_11[1] = ((32'h00010000 <= s0_axi_awaddr) && (s0_axi_awaddr < 32'h00020000));
    _zz_when_Axi4LiteCrossbar_l172_11[2] = ((32'h00020000 <= s0_axi_awaddr) && (s0_axi_awaddr < 32'h00030000));
    _zz_when_Axi4LiteCrossbar_l172_11[3] = ((32'h00030000 <= s0_axi_awaddr) && (s0_axi_awaddr < 32'h00040000));
  end

  always @(*) begin
    _zz_when_Axi4LiteCrossbar_l172_10[0] = (s0_axi_awvalid && _zz_when_Axi4LiteCrossbar_l172_11[2]);
    _zz_when_Axi4LiteCrossbar_l172_10[1] = (s1_axi_awvalid && _zz_when_Axi4LiteCrossbar_l172_12[2]);
    _zz_when_Axi4LiteCrossbar_l172_10[2] = (s2_axi_awvalid && _zz_when_Axi4LiteCrossbar_l172_13[2]);
    _zz_when_Axi4LiteCrossbar_l172_10[3] = (s3_axi_awvalid && _zz_when_Axi4LiteCrossbar_l172_14[2]);
  end

  always @(*) begin
    _zz_when_Axi4LiteCrossbar_l172_12[0] = ((32'h00000000 <= s1_axi_awaddr) && (s1_axi_awaddr < 32'h00010000));
    _zz_when_Axi4LiteCrossbar_l172_12[1] = ((32'h00010000 <= s1_axi_awaddr) && (s1_axi_awaddr < 32'h00020000));
    _zz_when_Axi4LiteCrossbar_l172_12[2] = ((32'h00020000 <= s1_axi_awaddr) && (s1_axi_awaddr < 32'h00030000));
    _zz_when_Axi4LiteCrossbar_l172_12[3] = ((32'h00030000 <= s1_axi_awaddr) && (s1_axi_awaddr < 32'h00040000));
  end

  always @(*) begin
    _zz_when_Axi4LiteCrossbar_l172_13[0] = ((32'h00000000 <= s2_axi_awaddr) && (s2_axi_awaddr < 32'h00010000));
    _zz_when_Axi4LiteCrossbar_l172_13[1] = ((32'h00010000 <= s2_axi_awaddr) && (s2_axi_awaddr < 32'h00020000));
    _zz_when_Axi4LiteCrossbar_l172_13[2] = ((32'h00020000 <= s2_axi_awaddr) && (s2_axi_awaddr < 32'h00030000));
    _zz_when_Axi4LiteCrossbar_l172_13[3] = ((32'h00030000 <= s2_axi_awaddr) && (s2_axi_awaddr < 32'h00040000));
  end

  always @(*) begin
    _zz_when_Axi4LiteCrossbar_l172_14[0] = ((32'h00000000 <= s3_axi_awaddr) && (s3_axi_awaddr < 32'h00010000));
    _zz_when_Axi4LiteCrossbar_l172_14[1] = ((32'h00010000 <= s3_axi_awaddr) && (s3_axi_awaddr < 32'h00020000));
    _zz_when_Axi4LiteCrossbar_l172_14[2] = ((32'h00020000 <= s3_axi_awaddr) && (s3_axi_awaddr < 32'h00030000));
    _zz_when_Axi4LiteCrossbar_l172_14[3] = ((32'h00030000 <= s3_axi_awaddr) && (s3_axi_awaddr < 32'h00040000));
  end

  assign _zz_when_Axi4LiteCrossbar_l117_4 = _zz_when_Axi4LiteCrossbar_l172_10;
  assign _zz_when_Axi4LiteCrossbar_l117_5 = (_zz_when_Axi4LiteCrossbar_l117_4 & (~ _zz__zz_when_Axi4LiteCrossbar_l117_5));
  always @(*) begin
    _zz_wrGranted_2 = 2'b00;
    if(when_Axi4LiteCrossbar_l117_8) begin
      _zz_wrGranted_2 = 2'b00;
    end
    if(when_Axi4LiteCrossbar_l117_9) begin
      _zz_wrGranted_2 = 2'b01;
    end
    if(when_Axi4LiteCrossbar_l117_10) begin
      _zz_wrGranted_2 = 2'b10;
    end
    if(when_Axi4LiteCrossbar_l117_11) begin
      _zz_wrGranted_2 = 2'b11;
    end
  end

  assign when_Axi4LiteCrossbar_l117_8 = _zz_when_Axi4LiteCrossbar_l117_5[0];
  assign when_Axi4LiteCrossbar_l117_9 = _zz_when_Axi4LiteCrossbar_l117_5[1];
  assign when_Axi4LiteCrossbar_l117_10 = _zz_when_Axi4LiteCrossbar_l117_5[2];
  assign when_Axi4LiteCrossbar_l117_11 = _zz_when_Axi4LiteCrossbar_l117_5[3];
  assign when_Axi4LiteCrossbar_l172_2 = (|_zz_when_Axi4LiteCrossbar_l172_10);
  assign when_Axi4LiteCrossbar_l176_8 = (_zz_wrGranted_2 == 2'b00);
  assign when_Axi4LiteCrossbar_l176_9 = (_zz_wrGranted_2 == 2'b01);
  assign when_Axi4LiteCrossbar_l176_10 = (_zz_wrGranted_2 == 2'b10);
  assign when_Axi4LiteCrossbar_l176_11 = (_zz_wrGranted_2 == 2'b11);
  assign io_slaves_2_aw_fire = (m2_axi_awvalid && m2_axi_awready);
  assign when_Axi4LiteCrossbar_l195_8 = (wrGranted_2 == 2'b00);
  assign when_Axi4LiteCrossbar_l195_9 = (wrGranted_2 == 2'b01);
  assign when_Axi4LiteCrossbar_l195_10 = (wrGranted_2 == 2'b10);
  assign when_Axi4LiteCrossbar_l195_11 = (wrGranted_2 == 2'b11);
  assign io_slaves_2_b_fire = (m2_axi_bvalid && m2_axi_bready);
  assign when_Axi4LiteCrossbar_l160_3 = (! wrActive_3);
  always @(*) begin
    _zz_when_Axi4LiteCrossbar_l172_16[0] = ((32'h00000000 <= s0_axi_awaddr) && (s0_axi_awaddr < 32'h00010000));
    _zz_when_Axi4LiteCrossbar_l172_16[1] = ((32'h00010000 <= s0_axi_awaddr) && (s0_axi_awaddr < 32'h00020000));
    _zz_when_Axi4LiteCrossbar_l172_16[2] = ((32'h00020000 <= s0_axi_awaddr) && (s0_axi_awaddr < 32'h00030000));
    _zz_when_Axi4LiteCrossbar_l172_16[3] = ((32'h00030000 <= s0_axi_awaddr) && (s0_axi_awaddr < 32'h00040000));
  end

  always @(*) begin
    _zz_when_Axi4LiteCrossbar_l172_15[0] = (s0_axi_awvalid && _zz_when_Axi4LiteCrossbar_l172_16[3]);
    _zz_when_Axi4LiteCrossbar_l172_15[1] = (s1_axi_awvalid && _zz_when_Axi4LiteCrossbar_l172_17[3]);
    _zz_when_Axi4LiteCrossbar_l172_15[2] = (s2_axi_awvalid && _zz_when_Axi4LiteCrossbar_l172_18[3]);
    _zz_when_Axi4LiteCrossbar_l172_15[3] = (s3_axi_awvalid && _zz_when_Axi4LiteCrossbar_l172_19[3]);
  end

  always @(*) begin
    _zz_when_Axi4LiteCrossbar_l172_17[0] = ((32'h00000000 <= s1_axi_awaddr) && (s1_axi_awaddr < 32'h00010000));
    _zz_when_Axi4LiteCrossbar_l172_17[1] = ((32'h00010000 <= s1_axi_awaddr) && (s1_axi_awaddr < 32'h00020000));
    _zz_when_Axi4LiteCrossbar_l172_17[2] = ((32'h00020000 <= s1_axi_awaddr) && (s1_axi_awaddr < 32'h00030000));
    _zz_when_Axi4LiteCrossbar_l172_17[3] = ((32'h00030000 <= s1_axi_awaddr) && (s1_axi_awaddr < 32'h00040000));
  end

  always @(*) begin
    _zz_when_Axi4LiteCrossbar_l172_18[0] = ((32'h00000000 <= s2_axi_awaddr) && (s2_axi_awaddr < 32'h00010000));
    _zz_when_Axi4LiteCrossbar_l172_18[1] = ((32'h00010000 <= s2_axi_awaddr) && (s2_axi_awaddr < 32'h00020000));
    _zz_when_Axi4LiteCrossbar_l172_18[2] = ((32'h00020000 <= s2_axi_awaddr) && (s2_axi_awaddr < 32'h00030000));
    _zz_when_Axi4LiteCrossbar_l172_18[3] = ((32'h00030000 <= s2_axi_awaddr) && (s2_axi_awaddr < 32'h00040000));
  end

  always @(*) begin
    _zz_when_Axi4LiteCrossbar_l172_19[0] = ((32'h00000000 <= s3_axi_awaddr) && (s3_axi_awaddr < 32'h00010000));
    _zz_when_Axi4LiteCrossbar_l172_19[1] = ((32'h00010000 <= s3_axi_awaddr) && (s3_axi_awaddr < 32'h00020000));
    _zz_when_Axi4LiteCrossbar_l172_19[2] = ((32'h00020000 <= s3_axi_awaddr) && (s3_axi_awaddr < 32'h00030000));
    _zz_when_Axi4LiteCrossbar_l172_19[3] = ((32'h00030000 <= s3_axi_awaddr) && (s3_axi_awaddr < 32'h00040000));
  end

  assign _zz_when_Axi4LiteCrossbar_l117_6 = _zz_when_Axi4LiteCrossbar_l172_15;
  assign _zz_when_Axi4LiteCrossbar_l117_7 = (_zz_when_Axi4LiteCrossbar_l117_6 & (~ _zz__zz_when_Axi4LiteCrossbar_l117_7));
  always @(*) begin
    _zz_wrGranted_3 = 2'b00;
    if(when_Axi4LiteCrossbar_l117_12) begin
      _zz_wrGranted_3 = 2'b00;
    end
    if(when_Axi4LiteCrossbar_l117_13) begin
      _zz_wrGranted_3 = 2'b01;
    end
    if(when_Axi4LiteCrossbar_l117_14) begin
      _zz_wrGranted_3 = 2'b10;
    end
    if(when_Axi4LiteCrossbar_l117_15) begin
      _zz_wrGranted_3 = 2'b11;
    end
  end

  assign when_Axi4LiteCrossbar_l117_12 = _zz_when_Axi4LiteCrossbar_l117_7[0];
  assign when_Axi4LiteCrossbar_l117_13 = _zz_when_Axi4LiteCrossbar_l117_7[1];
  assign when_Axi4LiteCrossbar_l117_14 = _zz_when_Axi4LiteCrossbar_l117_7[2];
  assign when_Axi4LiteCrossbar_l117_15 = _zz_when_Axi4LiteCrossbar_l117_7[3];
  assign when_Axi4LiteCrossbar_l172_3 = (|_zz_when_Axi4LiteCrossbar_l172_15);
  assign when_Axi4LiteCrossbar_l176_12 = (_zz_wrGranted_3 == 2'b00);
  assign when_Axi4LiteCrossbar_l176_13 = (_zz_wrGranted_3 == 2'b01);
  assign when_Axi4LiteCrossbar_l176_14 = (_zz_wrGranted_3 == 2'b10);
  assign when_Axi4LiteCrossbar_l176_15 = (_zz_wrGranted_3 == 2'b11);
  assign io_slaves_3_aw_fire = (m3_axi_awvalid && m3_axi_awready);
  assign when_Axi4LiteCrossbar_l195_12 = (wrGranted_3 == 2'b00);
  assign when_Axi4LiteCrossbar_l195_13 = (wrGranted_3 == 2'b01);
  assign when_Axi4LiteCrossbar_l195_14 = (wrGranted_3 == 2'b10);
  assign when_Axi4LiteCrossbar_l195_15 = (wrGranted_3 == 2'b11);
  assign io_slaves_3_b_fire = (m3_axi_bvalid && m3_axi_bready);
  assign when_Axi4LiteCrossbar_l216 = (! rdActive_0);
  always @(*) begin
    _zz_when_Axi4LiteCrossbar_l227_1[0] = ((32'h00000000 <= s0_axi_araddr) && (s0_axi_araddr < 32'h00010000));
    _zz_when_Axi4LiteCrossbar_l227_1[1] = ((32'h00010000 <= s0_axi_araddr) && (s0_axi_araddr < 32'h00020000));
    _zz_when_Axi4LiteCrossbar_l227_1[2] = ((32'h00020000 <= s0_axi_araddr) && (s0_axi_araddr < 32'h00030000));
    _zz_when_Axi4LiteCrossbar_l227_1[3] = ((32'h00030000 <= s0_axi_araddr) && (s0_axi_araddr < 32'h00040000));
  end

  always @(*) begin
    _zz_when_Axi4LiteCrossbar_l227[0] = (s0_axi_arvalid && _zz_when_Axi4LiteCrossbar_l227_1[0]);
    _zz_when_Axi4LiteCrossbar_l227[1] = (s1_axi_arvalid && _zz_when_Axi4LiteCrossbar_l227_2[0]);
    _zz_when_Axi4LiteCrossbar_l227[2] = (s2_axi_arvalid && _zz_when_Axi4LiteCrossbar_l227_3[0]);
    _zz_when_Axi4LiteCrossbar_l227[3] = (s3_axi_arvalid && _zz_when_Axi4LiteCrossbar_l227_4[0]);
  end

  always @(*) begin
    _zz_when_Axi4LiteCrossbar_l227_2[0] = ((32'h00000000 <= s1_axi_araddr) && (s1_axi_araddr < 32'h00010000));
    _zz_when_Axi4LiteCrossbar_l227_2[1] = ((32'h00010000 <= s1_axi_araddr) && (s1_axi_araddr < 32'h00020000));
    _zz_when_Axi4LiteCrossbar_l227_2[2] = ((32'h00020000 <= s1_axi_araddr) && (s1_axi_araddr < 32'h00030000));
    _zz_when_Axi4LiteCrossbar_l227_2[3] = ((32'h00030000 <= s1_axi_araddr) && (s1_axi_araddr < 32'h00040000));
  end

  always @(*) begin
    _zz_when_Axi4LiteCrossbar_l227_3[0] = ((32'h00000000 <= s2_axi_araddr) && (s2_axi_araddr < 32'h00010000));
    _zz_when_Axi4LiteCrossbar_l227_3[1] = ((32'h00010000 <= s2_axi_araddr) && (s2_axi_araddr < 32'h00020000));
    _zz_when_Axi4LiteCrossbar_l227_3[2] = ((32'h00020000 <= s2_axi_araddr) && (s2_axi_araddr < 32'h00030000));
    _zz_when_Axi4LiteCrossbar_l227_3[3] = ((32'h00030000 <= s2_axi_araddr) && (s2_axi_araddr < 32'h00040000));
  end

  always @(*) begin
    _zz_when_Axi4LiteCrossbar_l227_4[0] = ((32'h00000000 <= s3_axi_araddr) && (s3_axi_araddr < 32'h00010000));
    _zz_when_Axi4LiteCrossbar_l227_4[1] = ((32'h00010000 <= s3_axi_araddr) && (s3_axi_araddr < 32'h00020000));
    _zz_when_Axi4LiteCrossbar_l227_4[2] = ((32'h00020000 <= s3_axi_araddr) && (s3_axi_araddr < 32'h00030000));
    _zz_when_Axi4LiteCrossbar_l227_4[3] = ((32'h00030000 <= s3_axi_araddr) && (s3_axi_araddr < 32'h00040000));
  end

  assign _zz_when_Axi4LiteCrossbar_l117_8 = _zz_when_Axi4LiteCrossbar_l227;
  assign _zz_when_Axi4LiteCrossbar_l117_9 = (_zz_when_Axi4LiteCrossbar_l117_8 & (~ _zz__zz_when_Axi4LiteCrossbar_l117_9));
  always @(*) begin
    _zz_rdGranted_0 = 2'b00;
    if(when_Axi4LiteCrossbar_l117_16) begin
      _zz_rdGranted_0 = 2'b00;
    end
    if(when_Axi4LiteCrossbar_l117_17) begin
      _zz_rdGranted_0 = 2'b01;
    end
    if(when_Axi4LiteCrossbar_l117_18) begin
      _zz_rdGranted_0 = 2'b10;
    end
    if(when_Axi4LiteCrossbar_l117_19) begin
      _zz_rdGranted_0 = 2'b11;
    end
  end

  assign when_Axi4LiteCrossbar_l117_16 = _zz_when_Axi4LiteCrossbar_l117_9[0];
  assign when_Axi4LiteCrossbar_l117_17 = _zz_when_Axi4LiteCrossbar_l117_9[1];
  assign when_Axi4LiteCrossbar_l117_18 = _zz_when_Axi4LiteCrossbar_l117_9[2];
  assign when_Axi4LiteCrossbar_l117_19 = _zz_when_Axi4LiteCrossbar_l117_9[3];
  assign when_Axi4LiteCrossbar_l227 = (|_zz_when_Axi4LiteCrossbar_l227);
  assign when_Axi4LiteCrossbar_l230 = (_zz_rdGranted_0 == 2'b00);
  assign when_Axi4LiteCrossbar_l230_1 = (_zz_rdGranted_0 == 2'b01);
  assign when_Axi4LiteCrossbar_l230_2 = (_zz_rdGranted_0 == 2'b10);
  assign when_Axi4LiteCrossbar_l230_3 = (_zz_rdGranted_0 == 2'b11);
  assign io_slaves_0_ar_fire = (m0_axi_arvalid && m0_axi_arready);
  assign when_Axi4LiteCrossbar_l247 = (rdGranted_0 == 2'b00);
  assign when_Axi4LiteCrossbar_l247_1 = (rdGranted_0 == 2'b01);
  assign when_Axi4LiteCrossbar_l247_2 = (rdGranted_0 == 2'b10);
  assign when_Axi4LiteCrossbar_l247_3 = (rdGranted_0 == 2'b11);
  assign io_slaves_0_r_fire = (m0_axi_rvalid && m0_axi_rready);
  assign when_Axi4LiteCrossbar_l216_1 = (! rdActive_1);
  always @(*) begin
    _zz_when_Axi4LiteCrossbar_l227_6[0] = ((32'h00000000 <= s0_axi_araddr) && (s0_axi_araddr < 32'h00010000));
    _zz_when_Axi4LiteCrossbar_l227_6[1] = ((32'h00010000 <= s0_axi_araddr) && (s0_axi_araddr < 32'h00020000));
    _zz_when_Axi4LiteCrossbar_l227_6[2] = ((32'h00020000 <= s0_axi_araddr) && (s0_axi_araddr < 32'h00030000));
    _zz_when_Axi4LiteCrossbar_l227_6[3] = ((32'h00030000 <= s0_axi_araddr) && (s0_axi_araddr < 32'h00040000));
  end

  always @(*) begin
    _zz_when_Axi4LiteCrossbar_l227_5[0] = (s0_axi_arvalid && _zz_when_Axi4LiteCrossbar_l227_6[1]);
    _zz_when_Axi4LiteCrossbar_l227_5[1] = (s1_axi_arvalid && _zz_when_Axi4LiteCrossbar_l227_7[1]);
    _zz_when_Axi4LiteCrossbar_l227_5[2] = (s2_axi_arvalid && _zz_when_Axi4LiteCrossbar_l227_8[1]);
    _zz_when_Axi4LiteCrossbar_l227_5[3] = (s3_axi_arvalid && _zz_when_Axi4LiteCrossbar_l227_9[1]);
  end

  always @(*) begin
    _zz_when_Axi4LiteCrossbar_l227_7[0] = ((32'h00000000 <= s1_axi_araddr) && (s1_axi_araddr < 32'h00010000));
    _zz_when_Axi4LiteCrossbar_l227_7[1] = ((32'h00010000 <= s1_axi_araddr) && (s1_axi_araddr < 32'h00020000));
    _zz_when_Axi4LiteCrossbar_l227_7[2] = ((32'h00020000 <= s1_axi_araddr) && (s1_axi_araddr < 32'h00030000));
    _zz_when_Axi4LiteCrossbar_l227_7[3] = ((32'h00030000 <= s1_axi_araddr) && (s1_axi_araddr < 32'h00040000));
  end

  always @(*) begin
    _zz_when_Axi4LiteCrossbar_l227_8[0] = ((32'h00000000 <= s2_axi_araddr) && (s2_axi_araddr < 32'h00010000));
    _zz_when_Axi4LiteCrossbar_l227_8[1] = ((32'h00010000 <= s2_axi_araddr) && (s2_axi_araddr < 32'h00020000));
    _zz_when_Axi4LiteCrossbar_l227_8[2] = ((32'h00020000 <= s2_axi_araddr) && (s2_axi_araddr < 32'h00030000));
    _zz_when_Axi4LiteCrossbar_l227_8[3] = ((32'h00030000 <= s2_axi_araddr) && (s2_axi_araddr < 32'h00040000));
  end

  always @(*) begin
    _zz_when_Axi4LiteCrossbar_l227_9[0] = ((32'h00000000 <= s3_axi_araddr) && (s3_axi_araddr < 32'h00010000));
    _zz_when_Axi4LiteCrossbar_l227_9[1] = ((32'h00010000 <= s3_axi_araddr) && (s3_axi_araddr < 32'h00020000));
    _zz_when_Axi4LiteCrossbar_l227_9[2] = ((32'h00020000 <= s3_axi_araddr) && (s3_axi_araddr < 32'h00030000));
    _zz_when_Axi4LiteCrossbar_l227_9[3] = ((32'h00030000 <= s3_axi_araddr) && (s3_axi_araddr < 32'h00040000));
  end

  assign _zz_when_Axi4LiteCrossbar_l117_10 = _zz_when_Axi4LiteCrossbar_l227_5;
  assign _zz_when_Axi4LiteCrossbar_l117_11 = (_zz_when_Axi4LiteCrossbar_l117_10 & (~ _zz__zz_when_Axi4LiteCrossbar_l117_11));
  always @(*) begin
    _zz_rdGranted_1 = 2'b00;
    if(when_Axi4LiteCrossbar_l117_20) begin
      _zz_rdGranted_1 = 2'b00;
    end
    if(when_Axi4LiteCrossbar_l117_21) begin
      _zz_rdGranted_1 = 2'b01;
    end
    if(when_Axi4LiteCrossbar_l117_22) begin
      _zz_rdGranted_1 = 2'b10;
    end
    if(when_Axi4LiteCrossbar_l117_23) begin
      _zz_rdGranted_1 = 2'b11;
    end
  end

  assign when_Axi4LiteCrossbar_l117_20 = _zz_when_Axi4LiteCrossbar_l117_11[0];
  assign when_Axi4LiteCrossbar_l117_21 = _zz_when_Axi4LiteCrossbar_l117_11[1];
  assign when_Axi4LiteCrossbar_l117_22 = _zz_when_Axi4LiteCrossbar_l117_11[2];
  assign when_Axi4LiteCrossbar_l117_23 = _zz_when_Axi4LiteCrossbar_l117_11[3];
  assign when_Axi4LiteCrossbar_l227_1 = (|_zz_when_Axi4LiteCrossbar_l227_5);
  assign when_Axi4LiteCrossbar_l230_4 = (_zz_rdGranted_1 == 2'b00);
  assign when_Axi4LiteCrossbar_l230_5 = (_zz_rdGranted_1 == 2'b01);
  assign when_Axi4LiteCrossbar_l230_6 = (_zz_rdGranted_1 == 2'b10);
  assign when_Axi4LiteCrossbar_l230_7 = (_zz_rdGranted_1 == 2'b11);
  assign io_slaves_1_ar_fire = (m1_axi_arvalid && m1_axi_arready);
  assign when_Axi4LiteCrossbar_l247_4 = (rdGranted_1 == 2'b00);
  assign when_Axi4LiteCrossbar_l247_5 = (rdGranted_1 == 2'b01);
  assign when_Axi4LiteCrossbar_l247_6 = (rdGranted_1 == 2'b10);
  assign when_Axi4LiteCrossbar_l247_7 = (rdGranted_1 == 2'b11);
  assign io_slaves_1_r_fire = (m1_axi_rvalid && m1_axi_rready);
  assign when_Axi4LiteCrossbar_l216_2 = (! rdActive_2);
  always @(*) begin
    _zz_when_Axi4LiteCrossbar_l227_11[0] = ((32'h00000000 <= s0_axi_araddr) && (s0_axi_araddr < 32'h00010000));
    _zz_when_Axi4LiteCrossbar_l227_11[1] = ((32'h00010000 <= s0_axi_araddr) && (s0_axi_araddr < 32'h00020000));
    _zz_when_Axi4LiteCrossbar_l227_11[2] = ((32'h00020000 <= s0_axi_araddr) && (s0_axi_araddr < 32'h00030000));
    _zz_when_Axi4LiteCrossbar_l227_11[3] = ((32'h00030000 <= s0_axi_araddr) && (s0_axi_araddr < 32'h00040000));
  end

  always @(*) begin
    _zz_when_Axi4LiteCrossbar_l227_10[0] = (s0_axi_arvalid && _zz_when_Axi4LiteCrossbar_l227_11[2]);
    _zz_when_Axi4LiteCrossbar_l227_10[1] = (s1_axi_arvalid && _zz_when_Axi4LiteCrossbar_l227_12[2]);
    _zz_when_Axi4LiteCrossbar_l227_10[2] = (s2_axi_arvalid && _zz_when_Axi4LiteCrossbar_l227_13[2]);
    _zz_when_Axi4LiteCrossbar_l227_10[3] = (s3_axi_arvalid && _zz_when_Axi4LiteCrossbar_l227_14[2]);
  end

  always @(*) begin
    _zz_when_Axi4LiteCrossbar_l227_12[0] = ((32'h00000000 <= s1_axi_araddr) && (s1_axi_araddr < 32'h00010000));
    _zz_when_Axi4LiteCrossbar_l227_12[1] = ((32'h00010000 <= s1_axi_araddr) && (s1_axi_araddr < 32'h00020000));
    _zz_when_Axi4LiteCrossbar_l227_12[2] = ((32'h00020000 <= s1_axi_araddr) && (s1_axi_araddr < 32'h00030000));
    _zz_when_Axi4LiteCrossbar_l227_12[3] = ((32'h00030000 <= s1_axi_araddr) && (s1_axi_araddr < 32'h00040000));
  end

  always @(*) begin
    _zz_when_Axi4LiteCrossbar_l227_13[0] = ((32'h00000000 <= s2_axi_araddr) && (s2_axi_araddr < 32'h00010000));
    _zz_when_Axi4LiteCrossbar_l227_13[1] = ((32'h00010000 <= s2_axi_araddr) && (s2_axi_araddr < 32'h00020000));
    _zz_when_Axi4LiteCrossbar_l227_13[2] = ((32'h00020000 <= s2_axi_araddr) && (s2_axi_araddr < 32'h00030000));
    _zz_when_Axi4LiteCrossbar_l227_13[3] = ((32'h00030000 <= s2_axi_araddr) && (s2_axi_araddr < 32'h00040000));
  end

  always @(*) begin
    _zz_when_Axi4LiteCrossbar_l227_14[0] = ((32'h00000000 <= s3_axi_araddr) && (s3_axi_araddr < 32'h00010000));
    _zz_when_Axi4LiteCrossbar_l227_14[1] = ((32'h00010000 <= s3_axi_araddr) && (s3_axi_araddr < 32'h00020000));
    _zz_when_Axi4LiteCrossbar_l227_14[2] = ((32'h00020000 <= s3_axi_araddr) && (s3_axi_araddr < 32'h00030000));
    _zz_when_Axi4LiteCrossbar_l227_14[3] = ((32'h00030000 <= s3_axi_araddr) && (s3_axi_araddr < 32'h00040000));
  end

  assign _zz_when_Axi4LiteCrossbar_l117_12 = _zz_when_Axi4LiteCrossbar_l227_10;
  assign _zz_when_Axi4LiteCrossbar_l117_13 = (_zz_when_Axi4LiteCrossbar_l117_12 & (~ _zz__zz_when_Axi4LiteCrossbar_l117_13));
  always @(*) begin
    _zz_rdGranted_2 = 2'b00;
    if(when_Axi4LiteCrossbar_l117_24) begin
      _zz_rdGranted_2 = 2'b00;
    end
    if(when_Axi4LiteCrossbar_l117_25) begin
      _zz_rdGranted_2 = 2'b01;
    end
    if(when_Axi4LiteCrossbar_l117_26) begin
      _zz_rdGranted_2 = 2'b10;
    end
    if(when_Axi4LiteCrossbar_l117_27) begin
      _zz_rdGranted_2 = 2'b11;
    end
  end

  assign when_Axi4LiteCrossbar_l117_24 = _zz_when_Axi4LiteCrossbar_l117_13[0];
  assign when_Axi4LiteCrossbar_l117_25 = _zz_when_Axi4LiteCrossbar_l117_13[1];
  assign when_Axi4LiteCrossbar_l117_26 = _zz_when_Axi4LiteCrossbar_l117_13[2];
  assign when_Axi4LiteCrossbar_l117_27 = _zz_when_Axi4LiteCrossbar_l117_13[3];
  assign when_Axi4LiteCrossbar_l227_2 = (|_zz_when_Axi4LiteCrossbar_l227_10);
  assign when_Axi4LiteCrossbar_l230_8 = (_zz_rdGranted_2 == 2'b00);
  assign when_Axi4LiteCrossbar_l230_9 = (_zz_rdGranted_2 == 2'b01);
  assign when_Axi4LiteCrossbar_l230_10 = (_zz_rdGranted_2 == 2'b10);
  assign when_Axi4LiteCrossbar_l230_11 = (_zz_rdGranted_2 == 2'b11);
  assign io_slaves_2_ar_fire = (m2_axi_arvalid && m2_axi_arready);
  assign when_Axi4LiteCrossbar_l247_8 = (rdGranted_2 == 2'b00);
  assign when_Axi4LiteCrossbar_l247_9 = (rdGranted_2 == 2'b01);
  assign when_Axi4LiteCrossbar_l247_10 = (rdGranted_2 == 2'b10);
  assign when_Axi4LiteCrossbar_l247_11 = (rdGranted_2 == 2'b11);
  assign io_slaves_2_r_fire = (m2_axi_rvalid && m2_axi_rready);
  assign when_Axi4LiteCrossbar_l216_3 = (! rdActive_3);
  always @(*) begin
    _zz_when_Axi4LiteCrossbar_l227_16[0] = ((32'h00000000 <= s0_axi_araddr) && (s0_axi_araddr < 32'h00010000));
    _zz_when_Axi4LiteCrossbar_l227_16[1] = ((32'h00010000 <= s0_axi_araddr) && (s0_axi_araddr < 32'h00020000));
    _zz_when_Axi4LiteCrossbar_l227_16[2] = ((32'h00020000 <= s0_axi_araddr) && (s0_axi_araddr < 32'h00030000));
    _zz_when_Axi4LiteCrossbar_l227_16[3] = ((32'h00030000 <= s0_axi_araddr) && (s0_axi_araddr < 32'h00040000));
  end

  always @(*) begin
    _zz_when_Axi4LiteCrossbar_l227_15[0] = (s0_axi_arvalid && _zz_when_Axi4LiteCrossbar_l227_16[3]);
    _zz_when_Axi4LiteCrossbar_l227_15[1] = (s1_axi_arvalid && _zz_when_Axi4LiteCrossbar_l227_17[3]);
    _zz_when_Axi4LiteCrossbar_l227_15[2] = (s2_axi_arvalid && _zz_when_Axi4LiteCrossbar_l227_18[3]);
    _zz_when_Axi4LiteCrossbar_l227_15[3] = (s3_axi_arvalid && _zz_when_Axi4LiteCrossbar_l227_19[3]);
  end

  always @(*) begin
    _zz_when_Axi4LiteCrossbar_l227_17[0] = ((32'h00000000 <= s1_axi_araddr) && (s1_axi_araddr < 32'h00010000));
    _zz_when_Axi4LiteCrossbar_l227_17[1] = ((32'h00010000 <= s1_axi_araddr) && (s1_axi_araddr < 32'h00020000));
    _zz_when_Axi4LiteCrossbar_l227_17[2] = ((32'h00020000 <= s1_axi_araddr) && (s1_axi_araddr < 32'h00030000));
    _zz_when_Axi4LiteCrossbar_l227_17[3] = ((32'h00030000 <= s1_axi_araddr) && (s1_axi_araddr < 32'h00040000));
  end

  always @(*) begin
    _zz_when_Axi4LiteCrossbar_l227_18[0] = ((32'h00000000 <= s2_axi_araddr) && (s2_axi_araddr < 32'h00010000));
    _zz_when_Axi4LiteCrossbar_l227_18[1] = ((32'h00010000 <= s2_axi_araddr) && (s2_axi_araddr < 32'h00020000));
    _zz_when_Axi4LiteCrossbar_l227_18[2] = ((32'h00020000 <= s2_axi_araddr) && (s2_axi_araddr < 32'h00030000));
    _zz_when_Axi4LiteCrossbar_l227_18[3] = ((32'h00030000 <= s2_axi_araddr) && (s2_axi_araddr < 32'h00040000));
  end

  always @(*) begin
    _zz_when_Axi4LiteCrossbar_l227_19[0] = ((32'h00000000 <= s3_axi_araddr) && (s3_axi_araddr < 32'h00010000));
    _zz_when_Axi4LiteCrossbar_l227_19[1] = ((32'h00010000 <= s3_axi_araddr) && (s3_axi_araddr < 32'h00020000));
    _zz_when_Axi4LiteCrossbar_l227_19[2] = ((32'h00020000 <= s3_axi_araddr) && (s3_axi_araddr < 32'h00030000));
    _zz_when_Axi4LiteCrossbar_l227_19[3] = ((32'h00030000 <= s3_axi_araddr) && (s3_axi_araddr < 32'h00040000));
  end

  assign _zz_when_Axi4LiteCrossbar_l117_14 = _zz_when_Axi4LiteCrossbar_l227_15;
  assign _zz_when_Axi4LiteCrossbar_l117_15 = (_zz_when_Axi4LiteCrossbar_l117_14 & (~ _zz__zz_when_Axi4LiteCrossbar_l117_15));
  always @(*) begin
    _zz_rdGranted_3 = 2'b00;
    if(when_Axi4LiteCrossbar_l117_28) begin
      _zz_rdGranted_3 = 2'b00;
    end
    if(when_Axi4LiteCrossbar_l117_29) begin
      _zz_rdGranted_3 = 2'b01;
    end
    if(when_Axi4LiteCrossbar_l117_30) begin
      _zz_rdGranted_3 = 2'b10;
    end
    if(when_Axi4LiteCrossbar_l117_31) begin
      _zz_rdGranted_3 = 2'b11;
    end
  end

  assign when_Axi4LiteCrossbar_l117_28 = _zz_when_Axi4LiteCrossbar_l117_15[0];
  assign when_Axi4LiteCrossbar_l117_29 = _zz_when_Axi4LiteCrossbar_l117_15[1];
  assign when_Axi4LiteCrossbar_l117_30 = _zz_when_Axi4LiteCrossbar_l117_15[2];
  assign when_Axi4LiteCrossbar_l117_31 = _zz_when_Axi4LiteCrossbar_l117_15[3];
  assign when_Axi4LiteCrossbar_l227_3 = (|_zz_when_Axi4LiteCrossbar_l227_15);
  assign when_Axi4LiteCrossbar_l230_12 = (_zz_rdGranted_3 == 2'b00);
  assign when_Axi4LiteCrossbar_l230_13 = (_zz_rdGranted_3 == 2'b01);
  assign when_Axi4LiteCrossbar_l230_14 = (_zz_rdGranted_3 == 2'b10);
  assign when_Axi4LiteCrossbar_l230_15 = (_zz_rdGranted_3 == 2'b11);
  assign io_slaves_3_ar_fire = (m3_axi_arvalid && m3_axi_arready);
  assign when_Axi4LiteCrossbar_l247_12 = (rdGranted_3 == 2'b00);
  assign when_Axi4LiteCrossbar_l247_13 = (rdGranted_3 == 2'b01);
  assign when_Axi4LiteCrossbar_l247_14 = (rdGranted_3 == 2'b10);
  assign when_Axi4LiteCrossbar_l247_15 = (rdGranted_3 == 2'b11);
  assign io_slaves_3_r_fire = (m3_axi_rvalid && m3_axi_rready);
  always @(posedge aclk) begin
    if(!aresetn) begin
      wrActive_0 <= 1'b0;
      wrActive_1 <= 1'b0;
      wrActive_2 <= 1'b0;
      wrActive_3 <= 1'b0;
      wrGranted_0 <= 2'b00;
      wrGranted_1 <= 2'b00;
      wrGranted_2 <= 2'b00;
      wrGranted_3 <= 2'b00;
      wrRrPtr_0 <= 2'b00;
      wrRrPtr_1 <= 2'b00;
      wrRrPtr_2 <= 2'b00;
      wrRrPtr_3 <= 2'b00;
      rdActive_0 <= 1'b0;
      rdActive_1 <= 1'b0;
      rdActive_2 <= 1'b0;
      rdActive_3 <= 1'b0;
      rdGranted_0 <= 2'b00;
      rdGranted_1 <= 2'b00;
      rdGranted_2 <= 2'b00;
      rdGranted_3 <= 2'b00;
      rdRrPtr_0 <= 2'b00;
      rdRrPtr_1 <= 2'b00;
      rdRrPtr_2 <= 2'b00;
      rdRrPtr_3 <= 2'b00;
    end else begin
      if(when_Axi4LiteCrossbar_l160) begin
        if(when_Axi4LiteCrossbar_l172) begin
          if(io_slaves_0_aw_fire) begin
            wrActive_0 <= 1'b1;
            wrGranted_0 <= _zz_wrGranted_0;
            wrRrPtr_0 <= (_zz_wrGranted_0 + 2'b01);
          end
        end
      end else begin
        if(io_slaves_0_b_fire) begin
          wrActive_0 <= 1'b0;
        end
      end
      if(when_Axi4LiteCrossbar_l160_1) begin
        if(when_Axi4LiteCrossbar_l172_1) begin
          if(io_slaves_1_aw_fire) begin
            wrActive_1 <= 1'b1;
            wrGranted_1 <= _zz_wrGranted_1;
            wrRrPtr_1 <= (_zz_wrGranted_1 + 2'b01);
          end
        end
      end else begin
        if(io_slaves_1_b_fire) begin
          wrActive_1 <= 1'b0;
        end
      end
      if(when_Axi4LiteCrossbar_l160_2) begin
        if(when_Axi4LiteCrossbar_l172_2) begin
          if(io_slaves_2_aw_fire) begin
            wrActive_2 <= 1'b1;
            wrGranted_2 <= _zz_wrGranted_2;
            wrRrPtr_2 <= (_zz_wrGranted_2 + 2'b01);
          end
        end
      end else begin
        if(io_slaves_2_b_fire) begin
          wrActive_2 <= 1'b0;
        end
      end
      if(when_Axi4LiteCrossbar_l160_3) begin
        if(when_Axi4LiteCrossbar_l172_3) begin
          if(io_slaves_3_aw_fire) begin
            wrActive_3 <= 1'b1;
            wrGranted_3 <= _zz_wrGranted_3;
            wrRrPtr_3 <= (_zz_wrGranted_3 + 2'b01);
          end
        end
      end else begin
        if(io_slaves_3_b_fire) begin
          wrActive_3 <= 1'b0;
        end
      end
      if(when_Axi4LiteCrossbar_l216) begin
        if(when_Axi4LiteCrossbar_l227) begin
          if(io_slaves_0_ar_fire) begin
            rdActive_0 <= 1'b1;
            rdGranted_0 <= _zz_rdGranted_0;
            rdRrPtr_0 <= (_zz_rdGranted_0 + 2'b01);
          end
        end
      end else begin
        if(io_slaves_0_r_fire) begin
          rdActive_0 <= 1'b0;
        end
      end
      if(when_Axi4LiteCrossbar_l216_1) begin
        if(when_Axi4LiteCrossbar_l227_1) begin
          if(io_slaves_1_ar_fire) begin
            rdActive_1 <= 1'b1;
            rdGranted_1 <= _zz_rdGranted_1;
            rdRrPtr_1 <= (_zz_rdGranted_1 + 2'b01);
          end
        end
      end else begin
        if(io_slaves_1_r_fire) begin
          rdActive_1 <= 1'b0;
        end
      end
      if(when_Axi4LiteCrossbar_l216_2) begin
        if(when_Axi4LiteCrossbar_l227_2) begin
          if(io_slaves_2_ar_fire) begin
            rdActive_2 <= 1'b1;
            rdGranted_2 <= _zz_rdGranted_2;
            rdRrPtr_2 <= (_zz_rdGranted_2 + 2'b01);
          end
        end
      end else begin
        if(io_slaves_2_r_fire) begin
          rdActive_2 <= 1'b0;
        end
      end
      if(when_Axi4LiteCrossbar_l216_3) begin
        if(when_Axi4LiteCrossbar_l227_3) begin
          if(io_slaves_3_ar_fire) begin
            rdActive_3 <= 1'b1;
            rdGranted_3 <= _zz_rdGranted_3;
            rdRrPtr_3 <= (_zz_rdGranted_3 + 2'b01);
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
