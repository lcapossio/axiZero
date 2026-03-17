// Copyright (c) 2026 Leonardo Capossio — bard0 design  hello@bard0.com
// SPDX-License-Identifier: MIT
// Generator : SpinalHDL v1.10.1    git head : 2527c7c6b0fb0f95e5e1a5722a0be732b364ce43
// Component : AxiZeroMixedTop
// Git hash  : faec7504b72e249cccb471ae73c8c021a4a0986f

`timescale 1ns/1ps

module AxiZeroMixedTop (
  input  wire          s0_axi_awvalid,
  output wire          s0_axi_awready,
  input  wire [31:0]   s0_axi_awaddr,
  input  wire [3:0]    s0_axi_awid,
  input  wire [3:0]    s0_axi_awregion,
  input  wire [7:0]    s0_axi_awlen,
  input  wire [2:0]    s0_axi_awsize,
  input  wire [1:0]    s0_axi_awburst,
  input  wire [0:0]    s0_axi_awlock,
  input  wire [3:0]    s0_axi_awcache,
  input  wire [3:0]    s0_axi_awqos,
  input  wire [2:0]    s0_axi_awprot,
  input  wire          s0_axi_wvalid,
  output wire          s0_axi_wready,
  input  wire [31:0]   s0_axi_wdata,
  input  wire [3:0]    s0_axi_wstrb,
  input  wire          s0_axi_wlast,
  output wire          s0_axi_bvalid,
  input  wire          s0_axi_bready,
  output wire [3:0]    s0_axi_bid,
  output wire [1:0]    s0_axi_bresp,
  input  wire          s0_axi_arvalid,
  output wire          s0_axi_arready,
  input  wire [31:0]   s0_axi_araddr,
  input  wire [3:0]    s0_axi_arid,
  input  wire [3:0]    s0_axi_arregion,
  input  wire [7:0]    s0_axi_arlen,
  input  wire [2:0]    s0_axi_arsize,
  input  wire [1:0]    s0_axi_arburst,
  input  wire [0:0]    s0_axi_arlock,
  input  wire [3:0]    s0_axi_arcache,
  input  wire [3:0]    s0_axi_arqos,
  input  wire [2:0]    s0_axi_arprot,
  output wire          s0_axi_rvalid,
  input  wire          s0_axi_rready,
  output wire [31:0]   s0_axi_rdata,
  output wire [3:0]    s0_axi_rid,
  output wire [1:0]    s0_axi_rresp,
  output wire          s0_axi_rlast,
  input  wire          s1_axi_awvalid,
  output wire          s1_axi_awready,
  input  wire [31:0]   s1_axi_awaddr,
  input  wire [3:0]    s1_axi_awid,
  input  wire [3:0]    s1_axi_awregion,
  input  wire [7:0]    s1_axi_awlen,
  input  wire [2:0]    s1_axi_awsize,
  input  wire [1:0]    s1_axi_awburst,
  input  wire [0:0]    s1_axi_awlock,
  input  wire [3:0]    s1_axi_awcache,
  input  wire [3:0]    s1_axi_awqos,
  input  wire [2:0]    s1_axi_awprot,
  input  wire          s1_axi_wvalid,
  output wire          s1_axi_wready,
  input  wire [31:0]   s1_axi_wdata,
  input  wire [3:0]    s1_axi_wstrb,
  input  wire          s1_axi_wlast,
  output wire          s1_axi_bvalid,
  input  wire          s1_axi_bready,
  output wire [3:0]    s1_axi_bid,
  output wire [1:0]    s1_axi_bresp,
  input  wire          s1_axi_arvalid,
  output wire          s1_axi_arready,
  input  wire [31:0]   s1_axi_araddr,
  input  wire [3:0]    s1_axi_arid,
  input  wire [3:0]    s1_axi_arregion,
  input  wire [7:0]    s1_axi_arlen,
  input  wire [2:0]    s1_axi_arsize,
  input  wire [1:0]    s1_axi_arburst,
  input  wire [0:0]    s1_axi_arlock,
  input  wire [3:0]    s1_axi_arcache,
  input  wire [3:0]    s1_axi_arqos,
  input  wire [2:0]    s1_axi_arprot,
  output wire          s1_axi_rvalid,
  input  wire          s1_axi_rready,
  output wire [31:0]   s1_axi_rdata,
  output wire [3:0]    s1_axi_rid,
  output wire [1:0]    s1_axi_rresp,
  output wire          s1_axi_rlast,
  output wire          m0_axi_awvalid,
  input  wire          m0_axi_awready,
  output wire [31:0]   m0_axi_awaddr,
  output wire [4:0]    m0_axi_awid,
  output wire [3:0]    m0_axi_awregion,
  output wire [7:0]    m0_axi_awlen,
  output wire [2:0]    m0_axi_awsize,
  output wire [1:0]    m0_axi_awburst,
  output wire [0:0]    m0_axi_awlock,
  output wire [3:0]    m0_axi_awcache,
  output wire [3:0]    m0_axi_awqos,
  output wire [2:0]    m0_axi_awprot,
  output wire          m0_axi_wvalid,
  input  wire          m0_axi_wready,
  output wire [31:0]   m0_axi_wdata,
  output wire [3:0]    m0_axi_wstrb,
  output wire          m0_axi_wlast,
  input  wire          m0_axi_bvalid,
  output wire          m0_axi_bready,
  input  wire [4:0]    m0_axi_bid,
  input  wire [1:0]    m0_axi_bresp,
  output wire          m0_axi_arvalid,
  input  wire          m0_axi_arready,
  output wire [31:0]   m0_axi_araddr,
  output wire [4:0]    m0_axi_arid,
  output wire [3:0]    m0_axi_arregion,
  output wire [7:0]    m0_axi_arlen,
  output wire [2:0]    m0_axi_arsize,
  output wire [1:0]    m0_axi_arburst,
  output wire [0:0]    m0_axi_arlock,
  output wire [3:0]    m0_axi_arcache,
  output wire [3:0]    m0_axi_arqos,
  output wire [2:0]    m0_axi_arprot,
  input  wire          m0_axi_rvalid,
  output wire          m0_axi_rready,
  input  wire [31:0]   m0_axi_rdata,
  input  wire [4:0]    m0_axi_rid,
  input  wire [1:0]    m0_axi_rresp,
  input  wire          m0_axi_rlast,
  output wire          m1_axi_awvalid,
  input  wire          m1_axi_awready,
  output wire [31:0]   m1_axi_awaddr,
  output wire [4:0]    m1_axi_awid,
  output wire [3:0]    m1_axi_awregion,
  output wire [7:0]    m1_axi_awlen,
  output wire [2:0]    m1_axi_awsize,
  output wire [1:0]    m1_axi_awburst,
  output wire [0:0]    m1_axi_awlock,
  output wire [3:0]    m1_axi_awcache,
  output wire [3:0]    m1_axi_awqos,
  output wire [2:0]    m1_axi_awprot,
  output wire          m1_axi_wvalid,
  input  wire          m1_axi_wready,
  output wire [31:0]   m1_axi_wdata,
  output wire [3:0]    m1_axi_wstrb,
  output wire          m1_axi_wlast,
  input  wire          m1_axi_bvalid,
  output wire          m1_axi_bready,
  input  wire [4:0]    m1_axi_bid,
  input  wire [1:0]    m1_axi_bresp,
  output wire          m1_axi_arvalid,
  input  wire          m1_axi_arready,
  output wire [31:0]   m1_axi_araddr,
  output wire [4:0]    m1_axi_arid,
  output wire [3:0]    m1_axi_arregion,
  output wire [7:0]    m1_axi_arlen,
  output wire [2:0]    m1_axi_arsize,
  output wire [1:0]    m1_axi_arburst,
  output wire [0:0]    m1_axi_arlock,
  output wire [3:0]    m1_axi_arcache,
  output wire [3:0]    m1_axi_arqos,
  output wire [2:0]    m1_axi_arprot,
  input  wire          m1_axi_rvalid,
  output wire          m1_axi_rready,
  input  wire [31:0]   m1_axi_rdata,
  input  wire [4:0]    m1_axi_rid,
  input  wire [1:0]    m1_axi_rresp,
  input  wire          m1_axi_rlast,
  input  wire          aclk,
  input  wire          aresetn
);

  wire                xbar_io_masters_0_ar_ready;
  wire                xbar_io_masters_0_aw_ready;
  wire                xbar_io_masters_0_w_ready;
  wire                xbar_io_masters_0_r_valid;
  wire       [31:0]   xbar_io_masters_0_r_payload_data;
  wire       [3:0]    xbar_io_masters_0_r_payload_id;
  wire       [1:0]    xbar_io_masters_0_r_payload_resp;
  wire                xbar_io_masters_0_r_payload_last;
  wire                xbar_io_masters_0_b_valid;
  wire       [3:0]    xbar_io_masters_0_b_payload_id;
  wire       [1:0]    xbar_io_masters_0_b_payload_resp;
  wire                xbar_io_masters_1_ar_ready;
  wire                xbar_io_masters_1_aw_ready;
  wire                xbar_io_masters_1_w_ready;
  wire                xbar_io_masters_1_r_valid;
  wire       [31:0]   xbar_io_masters_1_r_payload_data;
  wire       [3:0]    xbar_io_masters_1_r_payload_id;
  wire       [1:0]    xbar_io_masters_1_r_payload_resp;
  wire                xbar_io_masters_1_r_payload_last;
  wire                xbar_io_masters_1_b_valid;
  wire       [3:0]    xbar_io_masters_1_b_payload_id;
  wire       [1:0]    xbar_io_masters_1_b_payload_resp;
  wire                xbar_io_slaves_0_ar_valid;
  wire       [31:0]   xbar_io_slaves_0_ar_payload_addr;
  wire       [4:0]    xbar_io_slaves_0_ar_payload_id;
  wire       [3:0]    xbar_io_slaves_0_ar_payload_region;
  wire       [7:0]    xbar_io_slaves_0_ar_payload_len;
  wire       [2:0]    xbar_io_slaves_0_ar_payload_size;
  wire       [1:0]    xbar_io_slaves_0_ar_payload_burst;
  wire       [0:0]    xbar_io_slaves_0_ar_payload_lock;
  wire       [3:0]    xbar_io_slaves_0_ar_payload_cache;
  wire       [3:0]    xbar_io_slaves_0_ar_payload_qos;
  wire       [2:0]    xbar_io_slaves_0_ar_payload_prot;
  wire                xbar_io_slaves_0_aw_valid;
  wire       [31:0]   xbar_io_slaves_0_aw_payload_addr;
  wire       [4:0]    xbar_io_slaves_0_aw_payload_id;
  wire       [3:0]    xbar_io_slaves_0_aw_payload_region;
  wire       [7:0]    xbar_io_slaves_0_aw_payload_len;
  wire       [2:0]    xbar_io_slaves_0_aw_payload_size;
  wire       [1:0]    xbar_io_slaves_0_aw_payload_burst;
  wire       [0:0]    xbar_io_slaves_0_aw_payload_lock;
  wire       [3:0]    xbar_io_slaves_0_aw_payload_cache;
  wire       [3:0]    xbar_io_slaves_0_aw_payload_qos;
  wire       [2:0]    xbar_io_slaves_0_aw_payload_prot;
  wire                xbar_io_slaves_0_w_valid;
  wire       [31:0]   xbar_io_slaves_0_w_payload_data;
  wire       [3:0]    xbar_io_slaves_0_w_payload_strb;
  wire                xbar_io_slaves_0_w_payload_last;
  wire                xbar_io_slaves_0_r_ready;
  wire                xbar_io_slaves_0_b_ready;
  wire                xbar_io_slaves_1_ar_valid;
  wire       [31:0]   xbar_io_slaves_1_ar_payload_addr;
  wire       [4:0]    xbar_io_slaves_1_ar_payload_id;
  wire       [3:0]    xbar_io_slaves_1_ar_payload_region;
  wire       [7:0]    xbar_io_slaves_1_ar_payload_len;
  wire       [2:0]    xbar_io_slaves_1_ar_payload_size;
  wire       [1:0]    xbar_io_slaves_1_ar_payload_burst;
  wire       [0:0]    xbar_io_slaves_1_ar_payload_lock;
  wire       [3:0]    xbar_io_slaves_1_ar_payload_cache;
  wire       [3:0]    xbar_io_slaves_1_ar_payload_qos;
  wire       [2:0]    xbar_io_slaves_1_ar_payload_prot;
  wire                xbar_io_slaves_1_aw_valid;
  wire       [31:0]   xbar_io_slaves_1_aw_payload_addr;
  wire       [4:0]    xbar_io_slaves_1_aw_payload_id;
  wire       [3:0]    xbar_io_slaves_1_aw_payload_region;
  wire       [7:0]    xbar_io_slaves_1_aw_payload_len;
  wire       [2:0]    xbar_io_slaves_1_aw_payload_size;
  wire       [1:0]    xbar_io_slaves_1_aw_payload_burst;
  wire       [0:0]    xbar_io_slaves_1_aw_payload_lock;
  wire       [3:0]    xbar_io_slaves_1_aw_payload_cache;
  wire       [3:0]    xbar_io_slaves_1_aw_payload_qos;
  wire       [2:0]    xbar_io_slaves_1_aw_payload_prot;
  wire                xbar_io_slaves_1_w_valid;
  wire       [31:0]   xbar_io_slaves_1_w_payload_data;
  wire       [3:0]    xbar_io_slaves_1_w_payload_strb;
  wire                xbar_io_slaves_1_w_payload_last;
  wire                xbar_io_slaves_1_r_ready;
  wire                xbar_io_slaves_1_b_ready;

  Axi4Crossbar xbar (
    .s0_axi_awvalid          (s0_axi_awvalid                  ), //i
    .s0_axi_awready          (xbar_io_masters_0_aw_ready             ), //o
    .s0_axi_awaddr   (s0_axi_awaddr[31:0]     ), //i
    .s0_axi_awid     (s0_axi_awid[3:0]        ), //i
    .s0_axi_awregion (s0_axi_awregion[3:0]    ), //i
    .s0_axi_awlen    (s0_axi_awlen[7:0]       ), //i
    .s0_axi_awsize   (s0_axi_awsize[2:0]      ), //i
    .s0_axi_awburst  (s0_axi_awburst[1:0]     ), //i
    .s0_axi_awlock   (s0_axi_awlock           ), //i
    .s0_axi_awcache  (s0_axi_awcache[3:0]     ), //i
    .s0_axi_awqos    (s0_axi_awqos[3:0]       ), //i
    .s0_axi_awprot   (s0_axi_awprot[2:0]      ), //i
    .s0_axi_wvalid           (s0_axi_wvalid                   ), //i
    .s0_axi_wready           (xbar_io_masters_0_w_ready              ), //o
    .s0_axi_wdata    (s0_axi_wdata[31:0]      ), //i
    .s0_axi_wstrb    (s0_axi_wstrb[3:0]       ), //i
    .s0_axi_wlast    (s0_axi_wlast            ), //i
    .s0_axi_bvalid           (xbar_io_masters_0_b_valid              ), //o
    .s0_axi_bready           (s0_axi_bready                   ), //i
    .s0_axi_bid      (xbar_io_masters_0_b_payload_id[3:0]    ), //o
    .s0_axi_bresp    (xbar_io_masters_0_b_payload_resp[1:0]  ), //o
    .s0_axi_arvalid          (s0_axi_arvalid                  ), //i
    .s0_axi_arready          (xbar_io_masters_0_ar_ready             ), //o
    .s0_axi_araddr   (s0_axi_araddr[31:0]     ), //i
    .s0_axi_arid     (s0_axi_arid[3:0]        ), //i
    .s0_axi_arregion (s0_axi_arregion[3:0]    ), //i
    .s0_axi_arlen    (s0_axi_arlen[7:0]       ), //i
    .s0_axi_arsize   (s0_axi_arsize[2:0]      ), //i
    .s0_axi_arburst  (s0_axi_arburst[1:0]     ), //i
    .s0_axi_arlock   (s0_axi_arlock           ), //i
    .s0_axi_arcache  (s0_axi_arcache[3:0]     ), //i
    .s0_axi_arqos    (s0_axi_arqos[3:0]       ), //i
    .s0_axi_arprot   (s0_axi_arprot[2:0]      ), //i
    .s0_axi_rvalid           (xbar_io_masters_0_r_valid              ), //o
    .s0_axi_rready           (s0_axi_rready                   ), //i
    .s0_axi_rdata    (xbar_io_masters_0_r_payload_data[31:0] ), //o
    .s0_axi_rid      (xbar_io_masters_0_r_payload_id[3:0]    ), //o
    .s0_axi_rresp    (xbar_io_masters_0_r_payload_resp[1:0]  ), //o
    .s0_axi_rlast    (xbar_io_masters_0_r_payload_last       ), //o
    .s1_axi_awvalid          (s1_axi_awvalid                  ), //i
    .s1_axi_awready          (xbar_io_masters_1_aw_ready             ), //o
    .s1_axi_awaddr   (s1_axi_awaddr[31:0]     ), //i
    .s1_axi_awid     (s1_axi_awid[3:0]        ), //i
    .s1_axi_awregion (s1_axi_awregion[3:0]    ), //i
    .s1_axi_awlen    (s1_axi_awlen[7:0]       ), //i
    .s1_axi_awsize   (s1_axi_awsize[2:0]      ), //i
    .s1_axi_awburst  (s1_axi_awburst[1:0]     ), //i
    .s1_axi_awlock   (s1_axi_awlock           ), //i
    .s1_axi_awcache  (s1_axi_awcache[3:0]     ), //i
    .s1_axi_awqos    (s1_axi_awqos[3:0]       ), //i
    .s1_axi_awprot   (s1_axi_awprot[2:0]      ), //i
    .s1_axi_wvalid           (s1_axi_wvalid                   ), //i
    .s1_axi_wready           (xbar_io_masters_1_w_ready              ), //o
    .s1_axi_wdata    (s1_axi_wdata[31:0]      ), //i
    .s1_axi_wstrb    (s1_axi_wstrb[3:0]       ), //i
    .s1_axi_wlast    (s1_axi_wlast            ), //i
    .s1_axi_bvalid           (xbar_io_masters_1_b_valid              ), //o
    .s1_axi_bready           (s1_axi_bready                   ), //i
    .s1_axi_bid      (xbar_io_masters_1_b_payload_id[3:0]    ), //o
    .s1_axi_bresp    (xbar_io_masters_1_b_payload_resp[1:0]  ), //o
    .s1_axi_arvalid          (s1_axi_arvalid                  ), //i
    .s1_axi_arready          (xbar_io_masters_1_ar_ready             ), //o
    .s1_axi_araddr   (s1_axi_araddr[31:0]     ), //i
    .s1_axi_arid     (s1_axi_arid[3:0]        ), //i
    .s1_axi_arregion (s1_axi_arregion[3:0]    ), //i
    .s1_axi_arlen    (s1_axi_arlen[7:0]       ), //i
    .s1_axi_arsize   (s1_axi_arsize[2:0]      ), //i
    .s1_axi_arburst  (s1_axi_arburst[1:0]     ), //i
    .s1_axi_arlock   (s1_axi_arlock           ), //i
    .s1_axi_arcache  (s1_axi_arcache[3:0]     ), //i
    .s1_axi_arqos    (s1_axi_arqos[3:0]       ), //i
    .s1_axi_arprot   (s1_axi_arprot[2:0]      ), //i
    .s1_axi_rvalid           (xbar_io_masters_1_r_valid              ), //o
    .s1_axi_rready           (s1_axi_rready                   ), //i
    .s1_axi_rdata    (xbar_io_masters_1_r_payload_data[31:0] ), //o
    .s1_axi_rid      (xbar_io_masters_1_r_payload_id[3:0]    ), //o
    .s1_axi_rresp    (xbar_io_masters_1_r_payload_resp[1:0]  ), //o
    .s1_axi_rlast    (xbar_io_masters_1_r_payload_last       ), //o
    .m0_axi_awvalid           (xbar_io_slaves_0_aw_valid              ), //o
    .m0_axi_awready           (m0_axi_awready                   ), //i
    .m0_axi_awaddr    (xbar_io_slaves_0_aw_payload_addr[31:0] ), //o
    .m0_axi_awid      (xbar_io_slaves_0_aw_payload_id[4:0]    ), //o
    .m0_axi_awregion  (xbar_io_slaves_0_aw_payload_region[3:0]), //o
    .m0_axi_awlen     (xbar_io_slaves_0_aw_payload_len[7:0]   ), //o
    .m0_axi_awsize    (xbar_io_slaves_0_aw_payload_size[2:0]  ), //o
    .m0_axi_awburst   (xbar_io_slaves_0_aw_payload_burst[1:0] ), //o
    .m0_axi_awlock    (xbar_io_slaves_0_aw_payload_lock       ), //o
    .m0_axi_awcache   (xbar_io_slaves_0_aw_payload_cache[3:0] ), //o
    .m0_axi_awqos     (xbar_io_slaves_0_aw_payload_qos[3:0]   ), //o
    .m0_axi_awprot    (xbar_io_slaves_0_aw_payload_prot[2:0]  ), //o
    .m0_axi_wvalid            (xbar_io_slaves_0_w_valid               ), //o
    .m0_axi_wready            (m0_axi_wready                    ), //i
    .m0_axi_wdata     (xbar_io_slaves_0_w_payload_data[31:0]  ), //o
    .m0_axi_wstrb     (xbar_io_slaves_0_w_payload_strb[3:0]   ), //o
    .m0_axi_wlast     (xbar_io_slaves_0_w_payload_last        ), //o
    .m0_axi_bvalid            (m0_axi_bvalid                    ), //i
    .m0_axi_bready            (xbar_io_slaves_0_b_ready               ), //o
    .m0_axi_bid       (m0_axi_bid[4:0]          ), //i
    .m0_axi_bresp     (m0_axi_bresp[1:0]        ), //i
    .m0_axi_arvalid           (xbar_io_slaves_0_ar_valid              ), //o
    .m0_axi_arready           (m0_axi_arready                   ), //i
    .m0_axi_araddr    (xbar_io_slaves_0_ar_payload_addr[31:0] ), //o
    .m0_axi_arid      (xbar_io_slaves_0_ar_payload_id[4:0]    ), //o
    .m0_axi_arregion  (xbar_io_slaves_0_ar_payload_region[3:0]), //o
    .m0_axi_arlen     (xbar_io_slaves_0_ar_payload_len[7:0]   ), //o
    .m0_axi_arsize    (xbar_io_slaves_0_ar_payload_size[2:0]  ), //o
    .m0_axi_arburst   (xbar_io_slaves_0_ar_payload_burst[1:0] ), //o
    .m0_axi_arlock    (xbar_io_slaves_0_ar_payload_lock       ), //o
    .m0_axi_arcache   (xbar_io_slaves_0_ar_payload_cache[3:0] ), //o
    .m0_axi_arqos     (xbar_io_slaves_0_ar_payload_qos[3:0]   ), //o
    .m0_axi_arprot    (xbar_io_slaves_0_ar_payload_prot[2:0]  ), //o
    .m0_axi_rvalid            (m0_axi_rvalid                    ), //i
    .m0_axi_rready            (xbar_io_slaves_0_r_ready               ), //o
    .m0_axi_rdata     (m0_axi_rdata[31:0]       ), //i
    .m0_axi_rid       (m0_axi_rid[4:0]          ), //i
    .m0_axi_rresp     (m0_axi_rresp[1:0]        ), //i
    .m0_axi_rlast     (m0_axi_rlast             ), //i
    .m1_axi_awvalid           (xbar_io_slaves_1_aw_valid              ), //o
    .m1_axi_awready           (m1_axi_awready                   ), //i
    .m1_axi_awaddr    (xbar_io_slaves_1_aw_payload_addr[31:0] ), //o
    .m1_axi_awid      (xbar_io_slaves_1_aw_payload_id[4:0]    ), //o
    .m1_axi_awregion  (xbar_io_slaves_1_aw_payload_region[3:0]), //o
    .m1_axi_awlen     (xbar_io_slaves_1_aw_payload_len[7:0]   ), //o
    .m1_axi_awsize    (xbar_io_slaves_1_aw_payload_size[2:0]  ), //o
    .m1_axi_awburst   (xbar_io_slaves_1_aw_payload_burst[1:0] ), //o
    .m1_axi_awlock    (xbar_io_slaves_1_aw_payload_lock       ), //o
    .m1_axi_awcache   (xbar_io_slaves_1_aw_payload_cache[3:0] ), //o
    .m1_axi_awqos     (xbar_io_slaves_1_aw_payload_qos[3:0]   ), //o
    .m1_axi_awprot    (xbar_io_slaves_1_aw_payload_prot[2:0]  ), //o
    .m1_axi_wvalid            (xbar_io_slaves_1_w_valid               ), //o
    .m1_axi_wready            (m1_axi_wready                    ), //i
    .m1_axi_wdata     (xbar_io_slaves_1_w_payload_data[31:0]  ), //o
    .m1_axi_wstrb     (xbar_io_slaves_1_w_payload_strb[3:0]   ), //o
    .m1_axi_wlast     (xbar_io_slaves_1_w_payload_last        ), //o
    .m1_axi_bvalid            (m1_axi_bvalid                    ), //i
    .m1_axi_bready            (xbar_io_slaves_1_b_ready               ), //o
    .m1_axi_bid       (m1_axi_bid[4:0]          ), //i
    .m1_axi_bresp     (m1_axi_bresp[1:0]        ), //i
    .m1_axi_arvalid           (xbar_io_slaves_1_ar_valid              ), //o
    .m1_axi_arready           (m1_axi_arready                   ), //i
    .m1_axi_araddr    (xbar_io_slaves_1_ar_payload_addr[31:0] ), //o
    .m1_axi_arid      (xbar_io_slaves_1_ar_payload_id[4:0]    ), //o
    .m1_axi_arregion  (xbar_io_slaves_1_ar_payload_region[3:0]), //o
    .m1_axi_arlen     (xbar_io_slaves_1_ar_payload_len[7:0]   ), //o
    .m1_axi_arsize    (xbar_io_slaves_1_ar_payload_size[2:0]  ), //o
    .m1_axi_arburst   (xbar_io_slaves_1_ar_payload_burst[1:0] ), //o
    .m1_axi_arlock    (xbar_io_slaves_1_ar_payload_lock       ), //o
    .m1_axi_arcache   (xbar_io_slaves_1_ar_payload_cache[3:0] ), //o
    .m1_axi_arqos     (xbar_io_slaves_1_ar_payload_qos[3:0]   ), //o
    .m1_axi_arprot    (xbar_io_slaves_1_ar_payload_prot[2:0]  ), //o
    .m1_axi_rvalid            (m1_axi_rvalid                    ), //i
    .m1_axi_rready            (xbar_io_slaves_1_r_ready               ), //o
    .m1_axi_rdata     (m1_axi_rdata[31:0]       ), //i
    .m1_axi_rid       (m1_axi_rid[4:0]          ), //i
    .m1_axi_rresp     (m1_axi_rresp[1:0]        ), //i
    .m1_axi_rlast     (m1_axi_rlast             ), //i
    .aclk                            (aclk                                    ), //i
    .aresetn                         (aresetn                                 )  //i
  );
  assign s0_axi_awready = xbar_io_masters_0_aw_ready;
  assign s0_axi_wready = xbar_io_masters_0_w_ready;
  assign s0_axi_bvalid = xbar_io_masters_0_b_valid;
  assign s0_axi_bid = xbar_io_masters_0_b_payload_id;
  assign s0_axi_bresp = xbar_io_masters_0_b_payload_resp;
  assign s0_axi_arready = xbar_io_masters_0_ar_ready;
  assign s0_axi_rvalid = xbar_io_masters_0_r_valid;
  assign s0_axi_rdata = xbar_io_masters_0_r_payload_data;
  assign s0_axi_rid = xbar_io_masters_0_r_payload_id;
  assign s0_axi_rresp = xbar_io_masters_0_r_payload_resp;
  assign s0_axi_rlast = xbar_io_masters_0_r_payload_last;
  assign s1_axi_awready = xbar_io_masters_1_aw_ready;
  assign s1_axi_wready = xbar_io_masters_1_w_ready;
  assign s1_axi_bvalid = xbar_io_masters_1_b_valid;
  assign s1_axi_bid = xbar_io_masters_1_b_payload_id;
  assign s1_axi_bresp = xbar_io_masters_1_b_payload_resp;
  assign s1_axi_arready = xbar_io_masters_1_ar_ready;
  assign s1_axi_rvalid = xbar_io_masters_1_r_valid;
  assign s1_axi_rdata = xbar_io_masters_1_r_payload_data;
  assign s1_axi_rid = xbar_io_masters_1_r_payload_id;
  assign s1_axi_rresp = xbar_io_masters_1_r_payload_resp;
  assign s1_axi_rlast = xbar_io_masters_1_r_payload_last;
  assign m0_axi_awvalid = xbar_io_slaves_0_aw_valid;
  assign m0_axi_awaddr = xbar_io_slaves_0_aw_payload_addr;
  assign m0_axi_awid = xbar_io_slaves_0_aw_payload_id;
  assign m0_axi_awregion = xbar_io_slaves_0_aw_payload_region;
  assign m0_axi_awlen = xbar_io_slaves_0_aw_payload_len;
  assign m0_axi_awsize = xbar_io_slaves_0_aw_payload_size;
  assign m0_axi_awburst = xbar_io_slaves_0_aw_payload_burst;
  assign m0_axi_awlock = xbar_io_slaves_0_aw_payload_lock;
  assign m0_axi_awcache = xbar_io_slaves_0_aw_payload_cache;
  assign m0_axi_awqos = xbar_io_slaves_0_aw_payload_qos;
  assign m0_axi_awprot = xbar_io_slaves_0_aw_payload_prot;
  assign m0_axi_wvalid = xbar_io_slaves_0_w_valid;
  assign m0_axi_wdata = xbar_io_slaves_0_w_payload_data;
  assign m0_axi_wstrb = xbar_io_slaves_0_w_payload_strb;
  assign m0_axi_wlast = xbar_io_slaves_0_w_payload_last;
  assign m0_axi_bready = xbar_io_slaves_0_b_ready;
  assign m0_axi_arvalid = xbar_io_slaves_0_ar_valid;
  assign m0_axi_araddr = xbar_io_slaves_0_ar_payload_addr;
  assign m0_axi_arid = xbar_io_slaves_0_ar_payload_id;
  assign m0_axi_arregion = xbar_io_slaves_0_ar_payload_region;
  assign m0_axi_arlen = xbar_io_slaves_0_ar_payload_len;
  assign m0_axi_arsize = xbar_io_slaves_0_ar_payload_size;
  assign m0_axi_arburst = xbar_io_slaves_0_ar_payload_burst;
  assign m0_axi_arlock = xbar_io_slaves_0_ar_payload_lock;
  assign m0_axi_arcache = xbar_io_slaves_0_ar_payload_cache;
  assign m0_axi_arqos = xbar_io_slaves_0_ar_payload_qos;
  assign m0_axi_arprot = xbar_io_slaves_0_ar_payload_prot;
  assign m0_axi_rready = xbar_io_slaves_0_r_ready;
  assign m1_axi_awvalid = xbar_io_slaves_1_aw_valid;
  assign m1_axi_awaddr = xbar_io_slaves_1_aw_payload_addr;
  assign m1_axi_awid = xbar_io_slaves_1_aw_payload_id;
  assign m1_axi_awregion = xbar_io_slaves_1_aw_payload_region;
  assign m1_axi_awlen = xbar_io_slaves_1_aw_payload_len;
  assign m1_axi_awsize = xbar_io_slaves_1_aw_payload_size;
  assign m1_axi_awburst = xbar_io_slaves_1_aw_payload_burst;
  assign m1_axi_awlock = xbar_io_slaves_1_aw_payload_lock;
  assign m1_axi_awcache = xbar_io_slaves_1_aw_payload_cache;
  assign m1_axi_awqos = xbar_io_slaves_1_aw_payload_qos;
  assign m1_axi_awprot = xbar_io_slaves_1_aw_payload_prot;
  assign m1_axi_wvalid = xbar_io_slaves_1_w_valid;
  assign m1_axi_wdata = xbar_io_slaves_1_w_payload_data;
  assign m1_axi_wstrb = xbar_io_slaves_1_w_payload_strb;
  assign m1_axi_wlast = xbar_io_slaves_1_w_payload_last;
  assign m1_axi_bready = xbar_io_slaves_1_b_ready;
  assign m1_axi_arvalid = xbar_io_slaves_1_ar_valid;
  assign m1_axi_araddr = xbar_io_slaves_1_ar_payload_addr;
  assign m1_axi_arid = xbar_io_slaves_1_ar_payload_id;
  assign m1_axi_arregion = xbar_io_slaves_1_ar_payload_region;
  assign m1_axi_arlen = xbar_io_slaves_1_ar_payload_len;
  assign m1_axi_arsize = xbar_io_slaves_1_ar_payload_size;
  assign m1_axi_arburst = xbar_io_slaves_1_ar_payload_burst;
  assign m1_axi_arlock = xbar_io_slaves_1_ar_payload_lock;
  assign m1_axi_arcache = xbar_io_slaves_1_ar_payload_cache;
  assign m1_axi_arqos = xbar_io_slaves_1_ar_payload_qos;
  assign m1_axi_arprot = xbar_io_slaves_1_ar_payload_prot;
  assign m1_axi_rready = xbar_io_slaves_1_r_ready;

endmodule

module Axi4Crossbar (
  input  wire          s0_axi_awvalid,
  output reg           s0_axi_awready,
  input  wire [31:0]   s0_axi_awaddr,
  input  wire [3:0]    s0_axi_awid,
  input  wire [3:0]    s0_axi_awregion,
  input  wire [7:0]    s0_axi_awlen,
  input  wire [2:0]    s0_axi_awsize,
  input  wire [1:0]    s0_axi_awburst,
  input  wire [0:0]    s0_axi_awlock,
  input  wire [3:0]    s0_axi_awcache,
  input  wire [3:0]    s0_axi_awqos,
  input  wire [2:0]    s0_axi_awprot,
  input  wire          s0_axi_wvalid,
  output reg           s0_axi_wready,
  input  wire [31:0]   s0_axi_wdata,
  input  wire [3:0]    s0_axi_wstrb,
  input  wire          s0_axi_wlast,
  output reg           s0_axi_bvalid,
  input  wire          s0_axi_bready,
  output reg  [3:0]    s0_axi_bid,
  output reg  [1:0]    s0_axi_bresp,
  input  wire          s0_axi_arvalid,
  output reg           s0_axi_arready,
  input  wire [31:0]   s0_axi_araddr,
  input  wire [3:0]    s0_axi_arid,
  input  wire [3:0]    s0_axi_arregion,
  input  wire [7:0]    s0_axi_arlen,
  input  wire [2:0]    s0_axi_arsize,
  input  wire [1:0]    s0_axi_arburst,
  input  wire [0:0]    s0_axi_arlock,
  input  wire [3:0]    s0_axi_arcache,
  input  wire [3:0]    s0_axi_arqos,
  input  wire [2:0]    s0_axi_arprot,
  output reg           s0_axi_rvalid,
  input  wire          s0_axi_rready,
  output reg  [31:0]   s0_axi_rdata,
  output reg  [3:0]    s0_axi_rid,
  output reg  [1:0]    s0_axi_rresp,
  output reg           s0_axi_rlast,
  input  wire          s1_axi_awvalid,
  output reg           s1_axi_awready,
  input  wire [31:0]   s1_axi_awaddr,
  input  wire [3:0]    s1_axi_awid,
  input  wire [3:0]    s1_axi_awregion,
  input  wire [7:0]    s1_axi_awlen,
  input  wire [2:0]    s1_axi_awsize,
  input  wire [1:0]    s1_axi_awburst,
  input  wire [0:0]    s1_axi_awlock,
  input  wire [3:0]    s1_axi_awcache,
  input  wire [3:0]    s1_axi_awqos,
  input  wire [2:0]    s1_axi_awprot,
  input  wire          s1_axi_wvalid,
  output reg           s1_axi_wready,
  input  wire [31:0]   s1_axi_wdata,
  input  wire [3:0]    s1_axi_wstrb,
  input  wire          s1_axi_wlast,
  output reg           s1_axi_bvalid,
  input  wire          s1_axi_bready,
  output reg  [3:0]    s1_axi_bid,
  output reg  [1:0]    s1_axi_bresp,
  input  wire          s1_axi_arvalid,
  output reg           s1_axi_arready,
  input  wire [31:0]   s1_axi_araddr,
  input  wire [3:0]    s1_axi_arid,
  input  wire [3:0]    s1_axi_arregion,
  input  wire [7:0]    s1_axi_arlen,
  input  wire [2:0]    s1_axi_arsize,
  input  wire [1:0]    s1_axi_arburst,
  input  wire [0:0]    s1_axi_arlock,
  input  wire [3:0]    s1_axi_arcache,
  input  wire [3:0]    s1_axi_arqos,
  input  wire [2:0]    s1_axi_arprot,
  output reg           s1_axi_rvalid,
  input  wire          s1_axi_rready,
  output reg  [31:0]   s1_axi_rdata,
  output reg  [3:0]    s1_axi_rid,
  output reg  [1:0]    s1_axi_rresp,
  output reg           s1_axi_rlast,
  output reg           m0_axi_awvalid,
  input  wire          m0_axi_awready,
  output reg  [31:0]   m0_axi_awaddr,
  output reg  [4:0]    m0_axi_awid,
  output wire [3:0]    m0_axi_awregion,
  output reg  [7:0]    m0_axi_awlen,
  output reg  [2:0]    m0_axi_awsize,
  output reg  [1:0]    m0_axi_awburst,
  output reg  [0:0]    m0_axi_awlock,
  output reg  [3:0]    m0_axi_awcache,
  output reg  [3:0]    m0_axi_awqos,
  output reg  [2:0]    m0_axi_awprot,
  output reg           m0_axi_wvalid,
  input  wire          m0_axi_wready,
  output reg  [31:0]   m0_axi_wdata,
  output reg  [3:0]    m0_axi_wstrb,
  output reg           m0_axi_wlast,
  input  wire          m0_axi_bvalid,
  output reg           m0_axi_bready,
  input  wire [4:0]    m0_axi_bid,
  input  wire [1:0]    m0_axi_bresp,
  output reg           m0_axi_arvalid,
  input  wire          m0_axi_arready,
  output reg  [31:0]   m0_axi_araddr,
  output reg  [4:0]    m0_axi_arid,
  output wire [3:0]    m0_axi_arregion,
  output reg  [7:0]    m0_axi_arlen,
  output reg  [2:0]    m0_axi_arsize,
  output reg  [1:0]    m0_axi_arburst,
  output reg  [0:0]    m0_axi_arlock,
  output reg  [3:0]    m0_axi_arcache,
  output reg  [3:0]    m0_axi_arqos,
  output reg  [2:0]    m0_axi_arprot,
  input  wire          m0_axi_rvalid,
  output reg           m0_axi_rready,
  input  wire [31:0]   m0_axi_rdata,
  input  wire [4:0]    m0_axi_rid,
  input  wire [1:0]    m0_axi_rresp,
  input  wire          m0_axi_rlast,
  output reg           m1_axi_awvalid,
  input  wire          m1_axi_awready,
  output reg  [31:0]   m1_axi_awaddr,
  output reg  [4:0]    m1_axi_awid,
  output wire [3:0]    m1_axi_awregion,
  output reg  [7:0]    m1_axi_awlen,
  output reg  [2:0]    m1_axi_awsize,
  output reg  [1:0]    m1_axi_awburst,
  output reg  [0:0]    m1_axi_awlock,
  output reg  [3:0]    m1_axi_awcache,
  output reg  [3:0]    m1_axi_awqos,
  output reg  [2:0]    m1_axi_awprot,
  output reg           m1_axi_wvalid,
  input  wire          m1_axi_wready,
  output reg  [31:0]   m1_axi_wdata,
  output reg  [3:0]    m1_axi_wstrb,
  output reg           m1_axi_wlast,
  input  wire          m1_axi_bvalid,
  output reg           m1_axi_bready,
  input  wire [4:0]    m1_axi_bid,
  input  wire [1:0]    m1_axi_bresp,
  output reg           m1_axi_arvalid,
  input  wire          m1_axi_arready,
  output reg  [31:0]   m1_axi_araddr,
  output reg  [4:0]    m1_axi_arid,
  output wire [3:0]    m1_axi_arregion,
  output reg  [7:0]    m1_axi_arlen,
  output reg  [2:0]    m1_axi_arsize,
  output reg  [1:0]    m1_axi_arburst,
  output reg  [0:0]    m1_axi_arlock,
  output reg  [3:0]    m1_axi_arcache,
  output reg  [3:0]    m1_axi_arqos,
  output reg  [2:0]    m1_axi_arprot,
  input  wire          m1_axi_rvalid,
  output reg           m1_axi_rready,
  input  wire [31:0]   m1_axi_rdata,
  input  wire [4:0]    m1_axi_rid,
  input  wire [1:0]    m1_axi_rresp,
  input  wire          m1_axi_rlast,
  input  wire          aclk,
  input  wire          aresetn
);

  wire       [0:0]    _zz__zz_3_port0;
  wire       [0:0]    _zz__zz_4_port0;
  wire       [7:0]    _zz__zz_when_Axi4Crossbar_l161_2;
  wire       [3:0]    _zz__zz_when_Axi4Crossbar_l161_2_1;
  wire       [7:0]    _zz__zz_when_Axi4Crossbar_l161_2_2;
  wire       [3:0]    _zz__zz_when_Axi4Crossbar_l161;
  wire       [7:0]    _zz__zz_when_Axi4Crossbar_l161_3;
  wire       [3:0]    _zz__zz_when_Axi4Crossbar_l161_3_1;
  wire       [7:0]    _zz__zz_when_Axi4Crossbar_l161_3_2;
  wire       [3:0]    _zz__zz_when_Axi4Crossbar_l161_1;
  wire       [1:0]    _zz__zz_when_Axi4Crossbar_l161_12;
  wire       [1:0]    _zz__zz_when_Axi4Crossbar_l161_12_1;
  wire       [1:0]    _zz__zz_5;
  wire       [0:0]    _zz__zz_3_port;
  wire       [1:0]    _zz__zz_when_Axi4Crossbar_l482;
  wire       [7:0]    _zz__zz_when_Axi4Crossbar_l161_15;
  wire       [3:0]    _zz__zz_when_Axi4Crossbar_l161_15_1;
  wire       [7:0]    _zz__zz_when_Axi4Crossbar_l161_15_2;
  wire       [3:0]    _zz__zz_when_Axi4Crossbar_l161_13;
  wire       [7:0]    _zz__zz_when_Axi4Crossbar_l161_16;
  wire       [3:0]    _zz__zz_when_Axi4Crossbar_l161_16_1;
  wire       [7:0]    _zz__zz_when_Axi4Crossbar_l161_16_2;
  wire       [3:0]    _zz__zz_when_Axi4Crossbar_l161_14;
  wire       [1:0]    _zz__zz_when_Axi4Crossbar_l161_25;
  wire       [1:0]    _zz__zz_when_Axi4Crossbar_l161_25_1;
  wire       [1:0]    _zz__zz_6;
  wire       [0:0]    _zz__zz_4_port;
  wire       [1:0]    _zz__zz_when_Axi4Crossbar_l482_1;
  wire       [0:0]    _zz__zz_when_Axi4Crossbar_l534;
  wire       [0:0]    _zz__zz_when_Axi4Crossbar_l534_1;
  wire       [1:0]    _zz__zz_when_Axi4Crossbar_l534_2;
  wire       [0:0]    _zz__zz_when_Axi4Crossbar_l534_3;
  wire       [0:0]    _zz__zz_when_Axi4Crossbar_l534_3_1;
  wire       [1:0]    _zz__zz_when_Axi4Crossbar_l534_5;
  wire       [7:0]    _zz__zz_when_Axi4Crossbar_l161_28;
  wire       [3:0]    _zz__zz_when_Axi4Crossbar_l161_28_1;
  wire       [7:0]    _zz__zz_when_Axi4Crossbar_l161_28_2;
  wire       [3:0]    _zz__zz_when_Axi4Crossbar_l161_26;
  wire       [7:0]    _zz__zz_when_Axi4Crossbar_l161_29;
  wire       [3:0]    _zz__zz_when_Axi4Crossbar_l161_29_1;
  wire       [7:0]    _zz__zz_when_Axi4Crossbar_l161_29_2;
  wire       [3:0]    _zz__zz_when_Axi4Crossbar_l161_27;
  wire       [1:0]    _zz__zz_when_Axi4Crossbar_l161_38;
  wire       [1:0]    _zz__zz_when_Axi4Crossbar_l161_38_1;
  wire       [7:0]    _zz__zz_when_Axi4Crossbar_l161_41;
  wire       [3:0]    _zz__zz_when_Axi4Crossbar_l161_41_1;
  wire       [7:0]    _zz__zz_when_Axi4Crossbar_l161_41_2;
  wire       [3:0]    _zz__zz_when_Axi4Crossbar_l161_39;
  wire       [7:0]    _zz__zz_when_Axi4Crossbar_l161_42;
  wire       [3:0]    _zz__zz_when_Axi4Crossbar_l161_42_1;
  wire       [7:0]    _zz__zz_when_Axi4Crossbar_l161_42_2;
  wire       [3:0]    _zz__zz_when_Axi4Crossbar_l161_40;
  wire       [1:0]    _zz__zz_when_Axi4Crossbar_l161_51;
  wire       [1:0]    _zz__zz_when_Axi4Crossbar_l161_51_1;
  wire       [0:0]    _zz__zz_when_Axi4Crossbar_l604;
  wire       [0:0]    _zz__zz_when_Axi4Crossbar_l604_1;
  wire       [1:0]    _zz__zz_when_Axi4Crossbar_l604_2;
  wire       [0:0]    _zz__zz_when_Axi4Crossbar_l604_3;
  wire       [0:0]    _zz__zz_when_Axi4Crossbar_l604_3_1;
  wire       [1:0]    _zz__zz_when_Axi4Crossbar_l604_5;
  reg                 _zz_1;
  reg                 _zz_2;
  reg        [0:0]    wrRrPtr_0;
  reg        [0:0]    wrRrPtr_1;
  reg        [0:0]    rdRrPtr_0;
  reg        [0:0]    rdRrPtr_1;
  reg        [3:0]    wrQosAge_0_0;
  reg        [3:0]    wrQosAge_0_1;
  reg        [3:0]    wrQosAge_1_0;
  reg        [3:0]    wrQosAge_1_1;
  reg        [3:0]    rdQosAge_0_0;
  reg        [3:0]    rdQosAge_0_1;
  reg        [3:0]    rdQosAge_1_0;
  reg        [3:0]    rdQosAge_1_1;
  wire       [5:0]    _zz_io_masters_0_b_payload_id;
  wire       [38:0]   _zz_io_masters_0_r_payload_data;
  wire       [5:0]    _zz_io_masters_1_b_payload_id;
  wire       [38:0]   _zz_io_masters_1_r_payload_data;
  wire       [65:0]   _zz_io_slaves_0_aw_payload_addr;
  wire       [36:0]   _zz_io_slaves_0_w_payload_data;
  wire       [65:0]   _zz_io_slaves_0_ar_payload_addr;
  wire       [65:0]   _zz_io_slaves_1_aw_payload_addr;
  wire       [36:0]   _zz_io_slaves_1_w_payload_data;
  wire       [65:0]   _zz_io_slaves_1_ar_payload_addr;
  reg        [2:0]    _zz_when_Axi4Crossbar_l450;
  reg        [2:0]    _zz_when_Axi4Crossbar_l450_1;
  reg        [1:0]    _zz_5;
  reg        [1:0]    _zz_6;
  reg        [1:0]    _zz_when_Axi4Crossbar_l482;
  reg        [1:0]    _zz_when_Axi4Crossbar_l482_1;
  reg        [2:0]    _zz_when_Axi4Crossbar_l459;
  reg        [2:0]    _zz_when_Axi4Crossbar_l459_1;
  reg        [2:0]    _zz_when_Axi4Crossbar_l563;
  reg        [2:0]    _zz_when_Axi4Crossbar_l563_1;
  reg        [1:0]    _zz_when_Axi4Crossbar_l450_2;
  reg        [1:0]    _zz_when_Axi4Crossbar_l450_3;
  reg        [1:0]    _zz_when_Axi4Crossbar_l450_4;
  wire       [3:0]    _zz_when_Axi4Crossbar_l161;
  wire       [3:0]    _zz_when_Axi4Crossbar_l161_1;
  wire       [7:0]    _zz_when_Axi4Crossbar_l161_2;
  wire       [7:0]    _zz_when_Axi4Crossbar_l161_3;
  wire       [3:0]    _zz_when_Axi4Crossbar_l161_4;
  wire       [3:0]    _zz_when_Axi4Crossbar_l161_5;
  wire       [3:0]    _zz_when_Axi4Crossbar_l161_6;
  reg        [1:0]    _zz_when_Axi4Crossbar_l161_7;
  reg        [1:0]    _zz_when_Axi4Crossbar_l161_8;
  wire       [1:0]    _zz_when_Axi4Crossbar_l161_9;
  wire       [1:0]    _zz_when_Axi4Crossbar_l161_10;
  wire       [1:0]    _zz_when_Axi4Crossbar_l161_11;
  wire       [1:0]    _zz_when_Axi4Crossbar_l161_12;
  reg        [0:0]    _zz_io_slaves_0_aw_payload_id;
  wire                when_Axi4Crossbar_l161;
  wire                when_Axi4Crossbar_l161_1;
  wire                when_Axi4Crossbar_l459;
  wire       [0:0]    _zz_when_Axi4Crossbar_l482_2;
  wire                when_Axi4Crossbar_l450;
  wire                when_Axi4Crossbar_l453;
  wire                when_Axi4Crossbar_l453_1;
  wire                io_slaves_0_aw_fire;
  wire                when_Axi4Crossbar_l101;
  wire                when_Axi4Crossbar_l106;
  wire                when_Axi4Crossbar_l103;
  wire                when_Axi4Crossbar_l101_1;
  wire                when_Axi4Crossbar_l106_1;
  wire                when_Axi4Crossbar_l103_1;
  wire                when_Axi4Crossbar_l480;
  wire                when_Axi4Crossbar_l482;
  wire                when_Axi4Crossbar_l482_1;
  wire                when_Axi4Crossbar_l497;
  wire                io_slaves_0_w_fire;
  wire                when_Axi4Crossbar_l503;
  wire                when_Axi4Crossbar_l505;
  wire                io_slaves_0_b_fire;
  wire                when_Axi4Crossbar_l512;
  wire                when_Axi4Crossbar_l514;
  reg        [1:0]    _zz_when_Axi4Crossbar_l450_5;
  reg        [1:0]    _zz_when_Axi4Crossbar_l450_6;
  reg        [1:0]    _zz_when_Axi4Crossbar_l450_7;
  wire       [3:0]    _zz_when_Axi4Crossbar_l161_13;
  wire       [3:0]    _zz_when_Axi4Crossbar_l161_14;
  wire       [7:0]    _zz_when_Axi4Crossbar_l161_15;
  wire       [7:0]    _zz_when_Axi4Crossbar_l161_16;
  wire       [3:0]    _zz_when_Axi4Crossbar_l161_17;
  wire       [3:0]    _zz_when_Axi4Crossbar_l161_18;
  wire       [3:0]    _zz_when_Axi4Crossbar_l161_19;
  reg        [1:0]    _zz_when_Axi4Crossbar_l161_20;
  reg        [1:0]    _zz_when_Axi4Crossbar_l161_21;
  wire       [1:0]    _zz_when_Axi4Crossbar_l161_22;
  wire       [1:0]    _zz_when_Axi4Crossbar_l161_23;
  wire       [1:0]    _zz_when_Axi4Crossbar_l161_24;
  wire       [1:0]    _zz_when_Axi4Crossbar_l161_25;
  reg        [0:0]    _zz_io_slaves_1_aw_payload_id;
  wire                when_Axi4Crossbar_l161_2;
  wire                when_Axi4Crossbar_l161_3;
  wire                when_Axi4Crossbar_l459_1;
  wire       [0:0]    _zz_when_Axi4Crossbar_l482_3;
  wire                when_Axi4Crossbar_l450_1;
  wire                when_Axi4Crossbar_l453_2;
  wire                when_Axi4Crossbar_l453_3;
  wire                io_slaves_1_aw_fire;
  wire                when_Axi4Crossbar_l101_2;
  wire                when_Axi4Crossbar_l106_2;
  wire                when_Axi4Crossbar_l103_2;
  wire                when_Axi4Crossbar_l101_3;
  wire                when_Axi4Crossbar_l106_3;
  wire                when_Axi4Crossbar_l103_3;
  wire                when_Axi4Crossbar_l480_1;
  wire                when_Axi4Crossbar_l482_2;
  wire                when_Axi4Crossbar_l482_3;
  wire                when_Axi4Crossbar_l497_1;
  wire                io_slaves_1_w_fire;
  wire                when_Axi4Crossbar_l503_1;
  wire                when_Axi4Crossbar_l505_1;
  wire                io_slaves_1_b_fire;
  wire                when_Axi4Crossbar_l512_1;
  wire                when_Axi4Crossbar_l514_1;
  reg        [1:0]    _zz_when_Axi4Crossbar_l534;
  wire       [1:0]    _zz_when_Axi4Crossbar_l534_1;
  wire       [1:0]    _zz_when_Axi4Crossbar_l534_2;
  wire                when_Axi4Crossbar_l534;
  wire                when_Axi4Crossbar_l534_1;
  reg        [1:0]    _zz_when_Axi4Crossbar_l534_3;
  wire       [1:0]    _zz_when_Axi4Crossbar_l534_4;
  wire       [1:0]    _zz_when_Axi4Crossbar_l534_5;
  wire                when_Axi4Crossbar_l534_2;
  wire                when_Axi4Crossbar_l534_3;
  reg        [1:0]    _zz_when_Axi4Crossbar_l563_2;
  reg        [1:0]    _zz_when_Axi4Crossbar_l563_3;
  reg        [1:0]    _zz_when_Axi4Crossbar_l563_4;
  wire       [3:0]    _zz_when_Axi4Crossbar_l161_26;
  wire       [3:0]    _zz_when_Axi4Crossbar_l161_27;
  wire       [7:0]    _zz_when_Axi4Crossbar_l161_28;
  wire       [7:0]    _zz_when_Axi4Crossbar_l161_29;
  wire       [3:0]    _zz_when_Axi4Crossbar_l161_30;
  wire       [3:0]    _zz_when_Axi4Crossbar_l161_31;
  wire       [3:0]    _zz_when_Axi4Crossbar_l161_32;
  reg        [1:0]    _zz_when_Axi4Crossbar_l161_33;
  reg        [1:0]    _zz_when_Axi4Crossbar_l161_34;
  wire       [1:0]    _zz_when_Axi4Crossbar_l161_35;
  wire       [1:0]    _zz_when_Axi4Crossbar_l161_36;
  wire       [1:0]    _zz_when_Axi4Crossbar_l161_37;
  wire       [1:0]    _zz_when_Axi4Crossbar_l161_38;
  reg        [0:0]    _zz_io_slaves_0_ar_payload_id;
  wire                when_Axi4Crossbar_l161_4;
  wire                when_Axi4Crossbar_l161_5;
  wire                when_Axi4Crossbar_l563;
  wire                when_Axi4Crossbar_l566;
  wire                when_Axi4Crossbar_l566_1;
  wire                io_slaves_0_ar_fire;
  wire                when_Axi4Crossbar_l101_4;
  wire                when_Axi4Crossbar_l106_4;
  wire                when_Axi4Crossbar_l103_4;
  wire                when_Axi4Crossbar_l101_5;
  wire                when_Axi4Crossbar_l106_5;
  wire                when_Axi4Crossbar_l103_5;
  wire                _zz_when_Axi4Crossbar_l584;
  wire                io_slaves_0_r_fire;
  wire                when_Axi4Crossbar_l584;
  wire                when_Axi4Crossbar_l586;
  reg        [1:0]    _zz_when_Axi4Crossbar_l563_5;
  reg        [1:0]    _zz_when_Axi4Crossbar_l563_6;
  reg        [1:0]    _zz_when_Axi4Crossbar_l563_7;
  wire       [3:0]    _zz_when_Axi4Crossbar_l161_39;
  wire       [3:0]    _zz_when_Axi4Crossbar_l161_40;
  wire       [7:0]    _zz_when_Axi4Crossbar_l161_41;
  wire       [7:0]    _zz_when_Axi4Crossbar_l161_42;
  wire       [3:0]    _zz_when_Axi4Crossbar_l161_43;
  wire       [3:0]    _zz_when_Axi4Crossbar_l161_44;
  wire       [3:0]    _zz_when_Axi4Crossbar_l161_45;
  reg        [1:0]    _zz_when_Axi4Crossbar_l161_46;
  reg        [1:0]    _zz_when_Axi4Crossbar_l161_47;
  wire       [1:0]    _zz_when_Axi4Crossbar_l161_48;
  wire       [1:0]    _zz_when_Axi4Crossbar_l161_49;
  wire       [1:0]    _zz_when_Axi4Crossbar_l161_50;
  wire       [1:0]    _zz_when_Axi4Crossbar_l161_51;
  reg        [0:0]    _zz_io_slaves_1_ar_payload_id;
  wire                when_Axi4Crossbar_l161_6;
  wire                when_Axi4Crossbar_l161_7;
  wire                when_Axi4Crossbar_l563_1;
  wire                when_Axi4Crossbar_l566_2;
  wire                when_Axi4Crossbar_l566_3;
  wire                io_slaves_1_ar_fire;
  wire                when_Axi4Crossbar_l101_6;
  wire                when_Axi4Crossbar_l106_6;
  wire                when_Axi4Crossbar_l103_6;
  wire                when_Axi4Crossbar_l101_7;
  wire                when_Axi4Crossbar_l106_7;
  wire                when_Axi4Crossbar_l103_7;
  wire                _zz_when_Axi4Crossbar_l584_1;
  wire                io_slaves_1_r_fire;
  wire                when_Axi4Crossbar_l584_1;
  wire                when_Axi4Crossbar_l586_1;
  reg        [1:0]    _zz_when_Axi4Crossbar_l604;
  wire       [1:0]    _zz_when_Axi4Crossbar_l604_1;
  wire       [1:0]    _zz_when_Axi4Crossbar_l604_2;
  wire                when_Axi4Crossbar_l604;
  wire                when_Axi4Crossbar_l604_1;
  reg        [1:0]    _zz_when_Axi4Crossbar_l604_3;
  wire       [1:0]    _zz_when_Axi4Crossbar_l604_4;
  wire       [1:0]    _zz_when_Axi4Crossbar_l604_5;
  wire                when_Axi4Crossbar_l604_2;
  wire                when_Axi4Crossbar_l604_3;
  (* ram_style = "distributed" *) reg [0:0] _zz_3 [0:3];
  (* ram_style = "distributed" *) reg [0:0] _zz_4 [0:3];

  assign _zz__zz_when_Axi4Crossbar_l161_2_1 = s0_axi_awqos;
  assign _zz__zz_when_Axi4Crossbar_l161_2 = {4'd0, _zz__zz_when_Axi4Crossbar_l161_2_1};
  assign _zz__zz_when_Axi4Crossbar_l161_2_2 = {4'd0, wrQosAge_0_0};
  assign _zz__zz_when_Axi4Crossbar_l161 = _zz_when_Axi4Crossbar_l161_2[3:0];
  assign _zz__zz_when_Axi4Crossbar_l161_3_1 = s1_axi_awqos;
  assign _zz__zz_when_Axi4Crossbar_l161_3 = {4'd0, _zz__zz_when_Axi4Crossbar_l161_3_1};
  assign _zz__zz_when_Axi4Crossbar_l161_3_2 = {4'd0, wrQosAge_0_1};
  assign _zz__zz_when_Axi4Crossbar_l161_1 = _zz_when_Axi4Crossbar_l161_3[3:0];
  assign _zz__zz_when_Axi4Crossbar_l161_12 = (_zz_when_Axi4Crossbar_l161_10 - 2'b01);
  assign _zz__zz_when_Axi4Crossbar_l161_12_1 = (_zz_when_Axi4Crossbar_l161_11 - 2'b01);
  assign _zz__zz_5 = (_zz_5 + 2'b01);
  assign _zz__zz_when_Axi4Crossbar_l482 = (_zz_when_Axi4Crossbar_l482 + 2'b01);
  assign _zz__zz_when_Axi4Crossbar_l161_15_1 = s0_axi_awqos;
  assign _zz__zz_when_Axi4Crossbar_l161_15 = {4'd0, _zz__zz_when_Axi4Crossbar_l161_15_1};
  assign _zz__zz_when_Axi4Crossbar_l161_15_2 = {4'd0, wrQosAge_1_0};
  assign _zz__zz_when_Axi4Crossbar_l161_13 = _zz_when_Axi4Crossbar_l161_15[3:0];
  assign _zz__zz_when_Axi4Crossbar_l161_16_1 = s1_axi_awqos;
  assign _zz__zz_when_Axi4Crossbar_l161_16 = {4'd0, _zz__zz_when_Axi4Crossbar_l161_16_1};
  assign _zz__zz_when_Axi4Crossbar_l161_16_2 = {4'd0, wrQosAge_1_1};
  assign _zz__zz_when_Axi4Crossbar_l161_14 = _zz_when_Axi4Crossbar_l161_16[3:0];
  assign _zz__zz_when_Axi4Crossbar_l161_25 = (_zz_when_Axi4Crossbar_l161_23 - 2'b01);
  assign _zz__zz_when_Axi4Crossbar_l161_25_1 = (_zz_when_Axi4Crossbar_l161_24 - 2'b01);
  assign _zz__zz_6 = (_zz_6 + 2'b01);
  assign _zz__zz_when_Axi4Crossbar_l482_1 = (_zz_when_Axi4Crossbar_l482_1 + 2'b01);
  assign _zz__zz_when_Axi4Crossbar_l534 = (m0_axi_bid >>> 3'd4);
  assign _zz__zz_when_Axi4Crossbar_l534_1 = (m1_axi_bid >>> 3'd4);
  assign _zz__zz_when_Axi4Crossbar_l534_2 = (_zz_when_Axi4Crossbar_l534_1 - 2'b01);
  assign _zz__zz_when_Axi4Crossbar_l534_3 = (m0_axi_bid >>> 3'd4);
  assign _zz__zz_when_Axi4Crossbar_l534_3_1 = (m1_axi_bid >>> 3'd4);
  assign _zz__zz_when_Axi4Crossbar_l534_5 = (_zz_when_Axi4Crossbar_l534_4 - 2'b01);
  assign _zz__zz_when_Axi4Crossbar_l161_28_1 = s0_axi_arqos;
  assign _zz__zz_when_Axi4Crossbar_l161_28 = {4'd0, _zz__zz_when_Axi4Crossbar_l161_28_1};
  assign _zz__zz_when_Axi4Crossbar_l161_28_2 = {4'd0, rdQosAge_0_0};
  assign _zz__zz_when_Axi4Crossbar_l161_26 = _zz_when_Axi4Crossbar_l161_28[3:0];
  assign _zz__zz_when_Axi4Crossbar_l161_29_1 = s1_axi_arqos;
  assign _zz__zz_when_Axi4Crossbar_l161_29 = {4'd0, _zz__zz_when_Axi4Crossbar_l161_29_1};
  assign _zz__zz_when_Axi4Crossbar_l161_29_2 = {4'd0, rdQosAge_0_1};
  assign _zz__zz_when_Axi4Crossbar_l161_27 = _zz_when_Axi4Crossbar_l161_29[3:0];
  assign _zz__zz_when_Axi4Crossbar_l161_38 = (_zz_when_Axi4Crossbar_l161_36 - 2'b01);
  assign _zz__zz_when_Axi4Crossbar_l161_38_1 = (_zz_when_Axi4Crossbar_l161_37 - 2'b01);
  assign _zz__zz_when_Axi4Crossbar_l161_41_1 = s0_axi_arqos;
  assign _zz__zz_when_Axi4Crossbar_l161_41 = {4'd0, _zz__zz_when_Axi4Crossbar_l161_41_1};
  assign _zz__zz_when_Axi4Crossbar_l161_41_2 = {4'd0, rdQosAge_1_0};
  assign _zz__zz_when_Axi4Crossbar_l161_39 = _zz_when_Axi4Crossbar_l161_41[3:0];
  assign _zz__zz_when_Axi4Crossbar_l161_42_1 = s1_axi_arqos;
  assign _zz__zz_when_Axi4Crossbar_l161_42 = {4'd0, _zz__zz_when_Axi4Crossbar_l161_42_1};
  assign _zz__zz_when_Axi4Crossbar_l161_42_2 = {4'd0, rdQosAge_1_1};
  assign _zz__zz_when_Axi4Crossbar_l161_40 = _zz_when_Axi4Crossbar_l161_42[3:0];
  assign _zz__zz_when_Axi4Crossbar_l161_51 = (_zz_when_Axi4Crossbar_l161_49 - 2'b01);
  assign _zz__zz_when_Axi4Crossbar_l161_51_1 = (_zz_when_Axi4Crossbar_l161_50 - 2'b01);
  assign _zz__zz_when_Axi4Crossbar_l604 = (m0_axi_rid >>> 3'd4);
  assign _zz__zz_when_Axi4Crossbar_l604_1 = (m1_axi_rid >>> 3'd4);
  assign _zz__zz_when_Axi4Crossbar_l604_2 = (_zz_when_Axi4Crossbar_l604_1 - 2'b01);
  assign _zz__zz_when_Axi4Crossbar_l604_3 = (m0_axi_rid >>> 3'd4);
  assign _zz__zz_when_Axi4Crossbar_l604_3_1 = (m1_axi_rid >>> 3'd4);
  assign _zz__zz_when_Axi4Crossbar_l604_5 = (_zz_when_Axi4Crossbar_l604_4 - 2'b01);
  assign _zz__zz_3_port = _zz_io_slaves_0_aw_payload_id;
  assign _zz__zz_4_port = _zz_io_slaves_1_aw_payload_id;
  assign _zz__zz_3_port0 = _zz_3[_zz_when_Axi4Crossbar_l482];
  always @(posedge aclk) begin
    if(_zz_2) begin
      _zz_3[_zz_5] <= _zz__zz_3_port;
    end
  end

  assign _zz__zz_4_port0 = _zz_4[_zz_when_Axi4Crossbar_l482_1];
  always @(posedge aclk) begin
    if(_zz_1) begin
      _zz_4[_zz_6] <= _zz__zz_4_port;
    end
  end

  always @(*) begin
    _zz_1 = 1'b0;
    if(io_slaves_1_aw_fire) begin
      _zz_1 = 1'b1;
    end
  end

  always @(*) begin
    _zz_2 = 1'b0;
    if(io_slaves_0_aw_fire) begin
      _zz_2 = 1'b1;
    end
  end

  always @(*) begin
    s0_axi_awready = 1'b0;
    if(when_Axi4Crossbar_l450) begin
      if(when_Axi4Crossbar_l453) begin
        s0_axi_awready = m0_axi_awready;
      end
    end
    if(when_Axi4Crossbar_l450_1) begin
      if(when_Axi4Crossbar_l453_2) begin
        s0_axi_awready = m1_axi_awready;
      end
    end
  end

  always @(*) begin
    s0_axi_wready = 1'b0;
    if(when_Axi4Crossbar_l450) begin
      if(when_Axi4Crossbar_l453) begin
        if(when_Axi4Crossbar_l459) begin
          s0_axi_wready = m0_axi_wready;
        end
      end
    end
    if(when_Axi4Crossbar_l480) begin
      if(when_Axi4Crossbar_l482) begin
        s0_axi_wready = m0_axi_wready;
      end
    end
    if(when_Axi4Crossbar_l450_1) begin
      if(when_Axi4Crossbar_l453_2) begin
        if(when_Axi4Crossbar_l459_1) begin
          s0_axi_wready = m1_axi_wready;
        end
      end
    end
    if(when_Axi4Crossbar_l480_1) begin
      if(when_Axi4Crossbar_l482_2) begin
        s0_axi_wready = m1_axi_wready;
      end
    end
  end

  always @(*) begin
    s0_axi_bvalid = 1'b0;
    if(when_Axi4Crossbar_l534) begin
      s0_axi_bvalid = 1'b1;
    end
    if(when_Axi4Crossbar_l534_1) begin
      s0_axi_bvalid = 1'b1;
    end
  end

  assign _zz_io_masters_0_b_payload_id = 6'h00;
  always @(*) begin
    s0_axi_bid = _zz_io_masters_0_b_payload_id[3 : 0];
    if(when_Axi4Crossbar_l534) begin
      s0_axi_bid = m0_axi_bid[3 : 0];
    end
    if(when_Axi4Crossbar_l534_1) begin
      s0_axi_bid = m1_axi_bid[3 : 0];
    end
  end

  always @(*) begin
    s0_axi_bresp = _zz_io_masters_0_b_payload_id[5 : 4];
    if(when_Axi4Crossbar_l534) begin
      s0_axi_bresp = m0_axi_bresp;
    end
    if(when_Axi4Crossbar_l534_1) begin
      s0_axi_bresp = m1_axi_bresp;
    end
  end

  always @(*) begin
    s0_axi_arready = 1'b0;
    if(when_Axi4Crossbar_l563) begin
      if(when_Axi4Crossbar_l566) begin
        s0_axi_arready = m0_axi_arready;
      end
    end
    if(when_Axi4Crossbar_l563_1) begin
      if(when_Axi4Crossbar_l566_2) begin
        s0_axi_arready = m1_axi_arready;
      end
    end
  end

  always @(*) begin
    s0_axi_rvalid = 1'b0;
    if(when_Axi4Crossbar_l604) begin
      s0_axi_rvalid = 1'b1;
    end
    if(when_Axi4Crossbar_l604_1) begin
      s0_axi_rvalid = 1'b1;
    end
  end

  assign _zz_io_masters_0_r_payload_data = 39'h0000000000;
  always @(*) begin
    s0_axi_rdata = _zz_io_masters_0_r_payload_data[31 : 0];
    if(when_Axi4Crossbar_l604) begin
      s0_axi_rdata = m0_axi_rdata;
    end
    if(when_Axi4Crossbar_l604_1) begin
      s0_axi_rdata = m1_axi_rdata;
    end
  end

  always @(*) begin
    s0_axi_rid = _zz_io_masters_0_r_payload_data[35 : 32];
    if(when_Axi4Crossbar_l604) begin
      s0_axi_rid = m0_axi_rid[3 : 0];
    end
    if(when_Axi4Crossbar_l604_1) begin
      s0_axi_rid = m1_axi_rid[3 : 0];
    end
  end

  always @(*) begin
    s0_axi_rresp = _zz_io_masters_0_r_payload_data[37 : 36];
    if(when_Axi4Crossbar_l604) begin
      s0_axi_rresp = m0_axi_rresp;
    end
    if(when_Axi4Crossbar_l604_1) begin
      s0_axi_rresp = m1_axi_rresp;
    end
  end

  always @(*) begin
    s0_axi_rlast = _zz_io_masters_0_r_payload_data[38];
    if(when_Axi4Crossbar_l604) begin
      s0_axi_rlast = m0_axi_rlast;
    end
    if(when_Axi4Crossbar_l604_1) begin
      s0_axi_rlast = m1_axi_rlast;
    end
  end

  always @(*) begin
    s1_axi_awready = 1'b0;
    if(when_Axi4Crossbar_l450) begin
      if(when_Axi4Crossbar_l453_1) begin
        s1_axi_awready = m0_axi_awready;
      end
    end
    if(when_Axi4Crossbar_l450_1) begin
      if(when_Axi4Crossbar_l453_3) begin
        s1_axi_awready = m1_axi_awready;
      end
    end
  end

  always @(*) begin
    s1_axi_wready = 1'b0;
    if(when_Axi4Crossbar_l450) begin
      if(when_Axi4Crossbar_l453_1) begin
        if(when_Axi4Crossbar_l459) begin
          s1_axi_wready = m0_axi_wready;
        end
      end
    end
    if(when_Axi4Crossbar_l480) begin
      if(when_Axi4Crossbar_l482_1) begin
        s1_axi_wready = m0_axi_wready;
      end
    end
    if(when_Axi4Crossbar_l450_1) begin
      if(when_Axi4Crossbar_l453_3) begin
        if(when_Axi4Crossbar_l459_1) begin
          s1_axi_wready = m1_axi_wready;
        end
      end
    end
    if(when_Axi4Crossbar_l480_1) begin
      if(when_Axi4Crossbar_l482_3) begin
        s1_axi_wready = m1_axi_wready;
      end
    end
  end

  always @(*) begin
    s1_axi_bvalid = 1'b0;
    if(when_Axi4Crossbar_l534_2) begin
      s1_axi_bvalid = 1'b1;
    end
    if(when_Axi4Crossbar_l534_3) begin
      s1_axi_bvalid = 1'b1;
    end
  end

  assign _zz_io_masters_1_b_payload_id = 6'h00;
  always @(*) begin
    s1_axi_bid = _zz_io_masters_1_b_payload_id[3 : 0];
    if(when_Axi4Crossbar_l534_2) begin
      s1_axi_bid = m0_axi_bid[3 : 0];
    end
    if(when_Axi4Crossbar_l534_3) begin
      s1_axi_bid = m1_axi_bid[3 : 0];
    end
  end

  always @(*) begin
    s1_axi_bresp = _zz_io_masters_1_b_payload_id[5 : 4];
    if(when_Axi4Crossbar_l534_2) begin
      s1_axi_bresp = m0_axi_bresp;
    end
    if(when_Axi4Crossbar_l534_3) begin
      s1_axi_bresp = m1_axi_bresp;
    end
  end

  always @(*) begin
    s1_axi_arready = 1'b0;
    if(when_Axi4Crossbar_l563) begin
      if(when_Axi4Crossbar_l566_1) begin
        s1_axi_arready = m0_axi_arready;
      end
    end
    if(when_Axi4Crossbar_l563_1) begin
      if(when_Axi4Crossbar_l566_3) begin
        s1_axi_arready = m1_axi_arready;
      end
    end
  end

  always @(*) begin
    s1_axi_rvalid = 1'b0;
    if(when_Axi4Crossbar_l604_2) begin
      s1_axi_rvalid = 1'b1;
    end
    if(when_Axi4Crossbar_l604_3) begin
      s1_axi_rvalid = 1'b1;
    end
  end

  assign _zz_io_masters_1_r_payload_data = 39'h0000000000;
  always @(*) begin
    s1_axi_rdata = _zz_io_masters_1_r_payload_data[31 : 0];
    if(when_Axi4Crossbar_l604_2) begin
      s1_axi_rdata = m0_axi_rdata;
    end
    if(when_Axi4Crossbar_l604_3) begin
      s1_axi_rdata = m1_axi_rdata;
    end
  end

  always @(*) begin
    s1_axi_rid = _zz_io_masters_1_r_payload_data[35 : 32];
    if(when_Axi4Crossbar_l604_2) begin
      s1_axi_rid = m0_axi_rid[3 : 0];
    end
    if(when_Axi4Crossbar_l604_3) begin
      s1_axi_rid = m1_axi_rid[3 : 0];
    end
  end

  always @(*) begin
    s1_axi_rresp = _zz_io_masters_1_r_payload_data[37 : 36];
    if(when_Axi4Crossbar_l604_2) begin
      s1_axi_rresp = m0_axi_rresp;
    end
    if(when_Axi4Crossbar_l604_3) begin
      s1_axi_rresp = m1_axi_rresp;
    end
  end

  always @(*) begin
    s1_axi_rlast = _zz_io_masters_1_r_payload_data[38];
    if(when_Axi4Crossbar_l604_2) begin
      s1_axi_rlast = m0_axi_rlast;
    end
    if(when_Axi4Crossbar_l604_3) begin
      s1_axi_rlast = m1_axi_rlast;
    end
  end

  always @(*) begin
    m0_axi_awvalid = 1'b0;
    if(when_Axi4Crossbar_l450) begin
      m0_axi_awvalid = 1'b1;
    end
  end

  assign _zz_io_slaves_0_aw_payload_addr = 66'h00000000000000000;
  always @(*) begin
    m0_axi_awaddr = _zz_io_slaves_0_aw_payload_addr[31 : 0];
    if(when_Axi4Crossbar_l450) begin
      if(when_Axi4Crossbar_l453) begin
        m0_axi_awaddr = s0_axi_awaddr;
      end
      if(when_Axi4Crossbar_l453_1) begin
        m0_axi_awaddr = s1_axi_awaddr;
      end
    end
  end

  always @(*) begin
    m0_axi_awid = _zz_io_slaves_0_aw_payload_addr[36 : 32];
    if(when_Axi4Crossbar_l450) begin
      if(when_Axi4Crossbar_l453) begin
        m0_axi_awid = {_zz_io_slaves_0_aw_payload_id,s0_axi_awid};
      end
      if(when_Axi4Crossbar_l453_1) begin
        m0_axi_awid = {_zz_io_slaves_0_aw_payload_id,s1_axi_awid};
      end
    end
  end

  assign m0_axi_awregion = _zz_io_slaves_0_aw_payload_addr[40 : 37];
  always @(*) begin
    m0_axi_awlen = _zz_io_slaves_0_aw_payload_addr[48 : 41];
    if(when_Axi4Crossbar_l450) begin
      if(when_Axi4Crossbar_l453) begin
        m0_axi_awlen = s0_axi_awlen;
      end
      if(when_Axi4Crossbar_l453_1) begin
        m0_axi_awlen = s1_axi_awlen;
      end
    end
  end

  always @(*) begin
    m0_axi_awsize = _zz_io_slaves_0_aw_payload_addr[51 : 49];
    if(when_Axi4Crossbar_l450) begin
      if(when_Axi4Crossbar_l453) begin
        m0_axi_awsize = s0_axi_awsize;
      end
      if(when_Axi4Crossbar_l453_1) begin
        m0_axi_awsize = s1_axi_awsize;
      end
    end
  end

  always @(*) begin
    m0_axi_awburst = _zz_io_slaves_0_aw_payload_addr[53 : 52];
    if(when_Axi4Crossbar_l450) begin
      if(when_Axi4Crossbar_l453) begin
        m0_axi_awburst = s0_axi_awburst;
      end
      if(when_Axi4Crossbar_l453_1) begin
        m0_axi_awburst = s1_axi_awburst;
      end
    end
  end

  always @(*) begin
    m0_axi_awlock = _zz_io_slaves_0_aw_payload_addr[54 : 54];
    if(when_Axi4Crossbar_l450) begin
      if(when_Axi4Crossbar_l453) begin
        m0_axi_awlock = s0_axi_awlock;
      end
      if(when_Axi4Crossbar_l453_1) begin
        m0_axi_awlock = s1_axi_awlock;
      end
    end
  end

  always @(*) begin
    m0_axi_awcache = _zz_io_slaves_0_aw_payload_addr[58 : 55];
    if(when_Axi4Crossbar_l450) begin
      if(when_Axi4Crossbar_l453) begin
        m0_axi_awcache = s0_axi_awcache;
      end
      if(when_Axi4Crossbar_l453_1) begin
        m0_axi_awcache = s1_axi_awcache;
      end
    end
  end

  always @(*) begin
    m0_axi_awqos = _zz_io_slaves_0_aw_payload_addr[62 : 59];
    if(when_Axi4Crossbar_l450) begin
      if(when_Axi4Crossbar_l453) begin
        m0_axi_awqos = s0_axi_awqos;
      end
      if(when_Axi4Crossbar_l453_1) begin
        m0_axi_awqos = s1_axi_awqos;
      end
    end
  end

  always @(*) begin
    m0_axi_awprot = _zz_io_slaves_0_aw_payload_addr[65 : 63];
    if(when_Axi4Crossbar_l450) begin
      if(when_Axi4Crossbar_l453) begin
        m0_axi_awprot = s0_axi_awprot;
      end
      if(when_Axi4Crossbar_l453_1) begin
        m0_axi_awprot = s1_axi_awprot;
      end
    end
  end

  always @(*) begin
    m0_axi_wvalid = 1'b0;
    if(when_Axi4Crossbar_l450) begin
      if(when_Axi4Crossbar_l453) begin
        if(when_Axi4Crossbar_l459) begin
          m0_axi_wvalid = s0_axi_wvalid;
        end
      end
      if(when_Axi4Crossbar_l453_1) begin
        if(when_Axi4Crossbar_l459) begin
          m0_axi_wvalid = s1_axi_wvalid;
        end
      end
    end
    if(when_Axi4Crossbar_l480) begin
      if(when_Axi4Crossbar_l482) begin
        m0_axi_wvalid = s0_axi_wvalid;
      end
      if(when_Axi4Crossbar_l482_1) begin
        m0_axi_wvalid = s1_axi_wvalid;
      end
    end
  end

  assign _zz_io_slaves_0_w_payload_data = 37'h0000000000;
  always @(*) begin
    m0_axi_wdata = _zz_io_slaves_0_w_payload_data[31 : 0];
    if(when_Axi4Crossbar_l450) begin
      if(when_Axi4Crossbar_l453) begin
        if(when_Axi4Crossbar_l459) begin
          m0_axi_wdata = s0_axi_wdata;
        end
      end
      if(when_Axi4Crossbar_l453_1) begin
        if(when_Axi4Crossbar_l459) begin
          m0_axi_wdata = s1_axi_wdata;
        end
      end
    end
    if(when_Axi4Crossbar_l480) begin
      if(when_Axi4Crossbar_l482) begin
        m0_axi_wdata = s0_axi_wdata;
      end
      if(when_Axi4Crossbar_l482_1) begin
        m0_axi_wdata = s1_axi_wdata;
      end
    end
  end

  always @(*) begin
    m0_axi_wstrb = _zz_io_slaves_0_w_payload_data[35 : 32];
    if(when_Axi4Crossbar_l450) begin
      if(when_Axi4Crossbar_l453) begin
        if(when_Axi4Crossbar_l459) begin
          m0_axi_wstrb = s0_axi_wstrb;
        end
      end
      if(when_Axi4Crossbar_l453_1) begin
        if(when_Axi4Crossbar_l459) begin
          m0_axi_wstrb = s1_axi_wstrb;
        end
      end
    end
    if(when_Axi4Crossbar_l480) begin
      if(when_Axi4Crossbar_l482) begin
        m0_axi_wstrb = s0_axi_wstrb;
      end
      if(when_Axi4Crossbar_l482_1) begin
        m0_axi_wstrb = s1_axi_wstrb;
      end
    end
  end

  always @(*) begin
    m0_axi_wlast = _zz_io_slaves_0_w_payload_data[36];
    if(when_Axi4Crossbar_l450) begin
      if(when_Axi4Crossbar_l453) begin
        if(when_Axi4Crossbar_l459) begin
          m0_axi_wlast = s0_axi_wlast;
        end
      end
      if(when_Axi4Crossbar_l453_1) begin
        if(when_Axi4Crossbar_l459) begin
          m0_axi_wlast = s1_axi_wlast;
        end
      end
    end
    if(when_Axi4Crossbar_l480) begin
      if(when_Axi4Crossbar_l482) begin
        m0_axi_wlast = s0_axi_wlast;
      end
      if(when_Axi4Crossbar_l482_1) begin
        m0_axi_wlast = s1_axi_wlast;
      end
    end
  end

  always @(*) begin
    m0_axi_bready = 1'b0;
    if(when_Axi4Crossbar_l534) begin
      m0_axi_bready = s0_axi_bready;
    end
    if(when_Axi4Crossbar_l534_2) begin
      m0_axi_bready = s1_axi_bready;
    end
  end

  always @(*) begin
    m0_axi_arvalid = 1'b0;
    if(when_Axi4Crossbar_l563) begin
      m0_axi_arvalid = 1'b1;
    end
  end

  assign _zz_io_slaves_0_ar_payload_addr = 66'h00000000000000000;
  always @(*) begin
    m0_axi_araddr = _zz_io_slaves_0_ar_payload_addr[31 : 0];
    if(when_Axi4Crossbar_l563) begin
      if(when_Axi4Crossbar_l566) begin
        m0_axi_araddr = s0_axi_araddr;
      end
      if(when_Axi4Crossbar_l566_1) begin
        m0_axi_araddr = s1_axi_araddr;
      end
    end
  end

  always @(*) begin
    m0_axi_arid = _zz_io_slaves_0_ar_payload_addr[36 : 32];
    if(when_Axi4Crossbar_l563) begin
      if(when_Axi4Crossbar_l566) begin
        m0_axi_arid = {_zz_io_slaves_0_ar_payload_id,s0_axi_arid};
      end
      if(when_Axi4Crossbar_l566_1) begin
        m0_axi_arid = {_zz_io_slaves_0_ar_payload_id,s1_axi_arid};
      end
    end
  end

  assign m0_axi_arregion = _zz_io_slaves_0_ar_payload_addr[40 : 37];
  always @(*) begin
    m0_axi_arlen = _zz_io_slaves_0_ar_payload_addr[48 : 41];
    if(when_Axi4Crossbar_l563) begin
      if(when_Axi4Crossbar_l566) begin
        m0_axi_arlen = s0_axi_arlen;
      end
      if(when_Axi4Crossbar_l566_1) begin
        m0_axi_arlen = s1_axi_arlen;
      end
    end
  end

  always @(*) begin
    m0_axi_arsize = _zz_io_slaves_0_ar_payload_addr[51 : 49];
    if(when_Axi4Crossbar_l563) begin
      if(when_Axi4Crossbar_l566) begin
        m0_axi_arsize = s0_axi_arsize;
      end
      if(when_Axi4Crossbar_l566_1) begin
        m0_axi_arsize = s1_axi_arsize;
      end
    end
  end

  always @(*) begin
    m0_axi_arburst = _zz_io_slaves_0_ar_payload_addr[53 : 52];
    if(when_Axi4Crossbar_l563) begin
      if(when_Axi4Crossbar_l566) begin
        m0_axi_arburst = s0_axi_arburst;
      end
      if(when_Axi4Crossbar_l566_1) begin
        m0_axi_arburst = s1_axi_arburst;
      end
    end
  end

  always @(*) begin
    m0_axi_arlock = _zz_io_slaves_0_ar_payload_addr[54 : 54];
    if(when_Axi4Crossbar_l563) begin
      if(when_Axi4Crossbar_l566) begin
        m0_axi_arlock = s0_axi_arlock;
      end
      if(when_Axi4Crossbar_l566_1) begin
        m0_axi_arlock = s1_axi_arlock;
      end
    end
  end

  always @(*) begin
    m0_axi_arcache = _zz_io_slaves_0_ar_payload_addr[58 : 55];
    if(when_Axi4Crossbar_l563) begin
      if(when_Axi4Crossbar_l566) begin
        m0_axi_arcache = s0_axi_arcache;
      end
      if(when_Axi4Crossbar_l566_1) begin
        m0_axi_arcache = s1_axi_arcache;
      end
    end
  end

  always @(*) begin
    m0_axi_arqos = _zz_io_slaves_0_ar_payload_addr[62 : 59];
    if(when_Axi4Crossbar_l563) begin
      if(when_Axi4Crossbar_l566) begin
        m0_axi_arqos = s0_axi_arqos;
      end
      if(when_Axi4Crossbar_l566_1) begin
        m0_axi_arqos = s1_axi_arqos;
      end
    end
  end

  always @(*) begin
    m0_axi_arprot = _zz_io_slaves_0_ar_payload_addr[65 : 63];
    if(when_Axi4Crossbar_l563) begin
      if(when_Axi4Crossbar_l566) begin
        m0_axi_arprot = s0_axi_arprot;
      end
      if(when_Axi4Crossbar_l566_1) begin
        m0_axi_arprot = s1_axi_arprot;
      end
    end
  end

  always @(*) begin
    m0_axi_rready = 1'b0;
    if(when_Axi4Crossbar_l604) begin
      m0_axi_rready = s0_axi_rready;
    end
    if(when_Axi4Crossbar_l604_2) begin
      m0_axi_rready = s1_axi_rready;
    end
  end

  always @(*) begin
    m1_axi_awvalid = 1'b0;
    if(when_Axi4Crossbar_l450_1) begin
      m1_axi_awvalid = 1'b1;
    end
  end

  assign _zz_io_slaves_1_aw_payload_addr = 66'h00000000000000000;
  always @(*) begin
    m1_axi_awaddr = _zz_io_slaves_1_aw_payload_addr[31 : 0];
    if(when_Axi4Crossbar_l450_1) begin
      if(when_Axi4Crossbar_l453_2) begin
        m1_axi_awaddr = s0_axi_awaddr;
      end
      if(when_Axi4Crossbar_l453_3) begin
        m1_axi_awaddr = s1_axi_awaddr;
      end
    end
  end

  always @(*) begin
    m1_axi_awid = _zz_io_slaves_1_aw_payload_addr[36 : 32];
    if(when_Axi4Crossbar_l450_1) begin
      if(when_Axi4Crossbar_l453_2) begin
        m1_axi_awid = {_zz_io_slaves_1_aw_payload_id,s0_axi_awid};
      end
      if(when_Axi4Crossbar_l453_3) begin
        m1_axi_awid = {_zz_io_slaves_1_aw_payload_id,s1_axi_awid};
      end
    end
  end

  assign m1_axi_awregion = _zz_io_slaves_1_aw_payload_addr[40 : 37];
  always @(*) begin
    m1_axi_awlen = _zz_io_slaves_1_aw_payload_addr[48 : 41];
    if(when_Axi4Crossbar_l450_1) begin
      if(when_Axi4Crossbar_l453_2) begin
        m1_axi_awlen = s0_axi_awlen;
      end
      if(when_Axi4Crossbar_l453_3) begin
        m1_axi_awlen = s1_axi_awlen;
      end
    end
  end

  always @(*) begin
    m1_axi_awsize = _zz_io_slaves_1_aw_payload_addr[51 : 49];
    if(when_Axi4Crossbar_l450_1) begin
      if(when_Axi4Crossbar_l453_2) begin
        m1_axi_awsize = s0_axi_awsize;
      end
      if(when_Axi4Crossbar_l453_3) begin
        m1_axi_awsize = s1_axi_awsize;
      end
    end
  end

  always @(*) begin
    m1_axi_awburst = _zz_io_slaves_1_aw_payload_addr[53 : 52];
    if(when_Axi4Crossbar_l450_1) begin
      if(when_Axi4Crossbar_l453_2) begin
        m1_axi_awburst = s0_axi_awburst;
      end
      if(when_Axi4Crossbar_l453_3) begin
        m1_axi_awburst = s1_axi_awburst;
      end
    end
  end

  always @(*) begin
    m1_axi_awlock = _zz_io_slaves_1_aw_payload_addr[54 : 54];
    if(when_Axi4Crossbar_l450_1) begin
      if(when_Axi4Crossbar_l453_2) begin
        m1_axi_awlock = s0_axi_awlock;
      end
      if(when_Axi4Crossbar_l453_3) begin
        m1_axi_awlock = s1_axi_awlock;
      end
    end
  end

  always @(*) begin
    m1_axi_awcache = _zz_io_slaves_1_aw_payload_addr[58 : 55];
    if(when_Axi4Crossbar_l450_1) begin
      if(when_Axi4Crossbar_l453_2) begin
        m1_axi_awcache = s0_axi_awcache;
      end
      if(when_Axi4Crossbar_l453_3) begin
        m1_axi_awcache = s1_axi_awcache;
      end
    end
  end

  always @(*) begin
    m1_axi_awqos = _zz_io_slaves_1_aw_payload_addr[62 : 59];
    if(when_Axi4Crossbar_l450_1) begin
      if(when_Axi4Crossbar_l453_2) begin
        m1_axi_awqos = s0_axi_awqos;
      end
      if(when_Axi4Crossbar_l453_3) begin
        m1_axi_awqos = s1_axi_awqos;
      end
    end
  end

  always @(*) begin
    m1_axi_awprot = _zz_io_slaves_1_aw_payload_addr[65 : 63];
    if(when_Axi4Crossbar_l450_1) begin
      if(when_Axi4Crossbar_l453_2) begin
        m1_axi_awprot = s0_axi_awprot;
      end
      if(when_Axi4Crossbar_l453_3) begin
        m1_axi_awprot = s1_axi_awprot;
      end
    end
  end

  always @(*) begin
    m1_axi_wvalid = 1'b0;
    if(when_Axi4Crossbar_l450_1) begin
      if(when_Axi4Crossbar_l453_2) begin
        if(when_Axi4Crossbar_l459_1) begin
          m1_axi_wvalid = s0_axi_wvalid;
        end
      end
      if(when_Axi4Crossbar_l453_3) begin
        if(when_Axi4Crossbar_l459_1) begin
          m1_axi_wvalid = s1_axi_wvalid;
        end
      end
    end
    if(when_Axi4Crossbar_l480_1) begin
      if(when_Axi4Crossbar_l482_2) begin
        m1_axi_wvalid = s0_axi_wvalid;
      end
      if(when_Axi4Crossbar_l482_3) begin
        m1_axi_wvalid = s1_axi_wvalid;
      end
    end
  end

  assign _zz_io_slaves_1_w_payload_data = 37'h0000000000;
  always @(*) begin
    m1_axi_wdata = _zz_io_slaves_1_w_payload_data[31 : 0];
    if(when_Axi4Crossbar_l450_1) begin
      if(when_Axi4Crossbar_l453_2) begin
        if(when_Axi4Crossbar_l459_1) begin
          m1_axi_wdata = s0_axi_wdata;
        end
      end
      if(when_Axi4Crossbar_l453_3) begin
        if(when_Axi4Crossbar_l459_1) begin
          m1_axi_wdata = s1_axi_wdata;
        end
      end
    end
    if(when_Axi4Crossbar_l480_1) begin
      if(when_Axi4Crossbar_l482_2) begin
        m1_axi_wdata = s0_axi_wdata;
      end
      if(when_Axi4Crossbar_l482_3) begin
        m1_axi_wdata = s1_axi_wdata;
      end
    end
  end

  always @(*) begin
    m1_axi_wstrb = _zz_io_slaves_1_w_payload_data[35 : 32];
    if(when_Axi4Crossbar_l450_1) begin
      if(when_Axi4Crossbar_l453_2) begin
        if(when_Axi4Crossbar_l459_1) begin
          m1_axi_wstrb = s0_axi_wstrb;
        end
      end
      if(when_Axi4Crossbar_l453_3) begin
        if(when_Axi4Crossbar_l459_1) begin
          m1_axi_wstrb = s1_axi_wstrb;
        end
      end
    end
    if(when_Axi4Crossbar_l480_1) begin
      if(when_Axi4Crossbar_l482_2) begin
        m1_axi_wstrb = s0_axi_wstrb;
      end
      if(when_Axi4Crossbar_l482_3) begin
        m1_axi_wstrb = s1_axi_wstrb;
      end
    end
  end

  always @(*) begin
    m1_axi_wlast = _zz_io_slaves_1_w_payload_data[36];
    if(when_Axi4Crossbar_l450_1) begin
      if(when_Axi4Crossbar_l453_2) begin
        if(when_Axi4Crossbar_l459_1) begin
          m1_axi_wlast = s0_axi_wlast;
        end
      end
      if(when_Axi4Crossbar_l453_3) begin
        if(when_Axi4Crossbar_l459_1) begin
          m1_axi_wlast = s1_axi_wlast;
        end
      end
    end
    if(when_Axi4Crossbar_l480_1) begin
      if(when_Axi4Crossbar_l482_2) begin
        m1_axi_wlast = s0_axi_wlast;
      end
      if(when_Axi4Crossbar_l482_3) begin
        m1_axi_wlast = s1_axi_wlast;
      end
    end
  end

  always @(*) begin
    m1_axi_bready = 1'b0;
    if(when_Axi4Crossbar_l534_1) begin
      m1_axi_bready = s0_axi_bready;
    end
    if(when_Axi4Crossbar_l534_3) begin
      m1_axi_bready = s1_axi_bready;
    end
  end

  always @(*) begin
    m1_axi_arvalid = 1'b0;
    if(when_Axi4Crossbar_l563_1) begin
      m1_axi_arvalid = 1'b1;
    end
  end

  assign _zz_io_slaves_1_ar_payload_addr = 66'h00000000000000000;
  always @(*) begin
    m1_axi_araddr = _zz_io_slaves_1_ar_payload_addr[31 : 0];
    if(when_Axi4Crossbar_l563_1) begin
      if(when_Axi4Crossbar_l566_2) begin
        m1_axi_araddr = s0_axi_araddr;
      end
      if(when_Axi4Crossbar_l566_3) begin
        m1_axi_araddr = s1_axi_araddr;
      end
    end
  end

  always @(*) begin
    m1_axi_arid = _zz_io_slaves_1_ar_payload_addr[36 : 32];
    if(when_Axi4Crossbar_l563_1) begin
      if(when_Axi4Crossbar_l566_2) begin
        m1_axi_arid = {_zz_io_slaves_1_ar_payload_id,s0_axi_arid};
      end
      if(when_Axi4Crossbar_l566_3) begin
        m1_axi_arid = {_zz_io_slaves_1_ar_payload_id,s1_axi_arid};
      end
    end
  end

  assign m1_axi_arregion = _zz_io_slaves_1_ar_payload_addr[40 : 37];
  always @(*) begin
    m1_axi_arlen = _zz_io_slaves_1_ar_payload_addr[48 : 41];
    if(when_Axi4Crossbar_l563_1) begin
      if(when_Axi4Crossbar_l566_2) begin
        m1_axi_arlen = s0_axi_arlen;
      end
      if(when_Axi4Crossbar_l566_3) begin
        m1_axi_arlen = s1_axi_arlen;
      end
    end
  end

  always @(*) begin
    m1_axi_arsize = _zz_io_slaves_1_ar_payload_addr[51 : 49];
    if(when_Axi4Crossbar_l563_1) begin
      if(when_Axi4Crossbar_l566_2) begin
        m1_axi_arsize = s0_axi_arsize;
      end
      if(when_Axi4Crossbar_l566_3) begin
        m1_axi_arsize = s1_axi_arsize;
      end
    end
  end

  always @(*) begin
    m1_axi_arburst = _zz_io_slaves_1_ar_payload_addr[53 : 52];
    if(when_Axi4Crossbar_l563_1) begin
      if(when_Axi4Crossbar_l566_2) begin
        m1_axi_arburst = s0_axi_arburst;
      end
      if(when_Axi4Crossbar_l566_3) begin
        m1_axi_arburst = s1_axi_arburst;
      end
    end
  end

  always @(*) begin
    m1_axi_arlock = _zz_io_slaves_1_ar_payload_addr[54 : 54];
    if(when_Axi4Crossbar_l563_1) begin
      if(when_Axi4Crossbar_l566_2) begin
        m1_axi_arlock = s0_axi_arlock;
      end
      if(when_Axi4Crossbar_l566_3) begin
        m1_axi_arlock = s1_axi_arlock;
      end
    end
  end

  always @(*) begin
    m1_axi_arcache = _zz_io_slaves_1_ar_payload_addr[58 : 55];
    if(when_Axi4Crossbar_l563_1) begin
      if(when_Axi4Crossbar_l566_2) begin
        m1_axi_arcache = s0_axi_arcache;
      end
      if(when_Axi4Crossbar_l566_3) begin
        m1_axi_arcache = s1_axi_arcache;
      end
    end
  end

  always @(*) begin
    m1_axi_arqos = _zz_io_slaves_1_ar_payload_addr[62 : 59];
    if(when_Axi4Crossbar_l563_1) begin
      if(when_Axi4Crossbar_l566_2) begin
        m1_axi_arqos = s0_axi_arqos;
      end
      if(when_Axi4Crossbar_l566_3) begin
        m1_axi_arqos = s1_axi_arqos;
      end
    end
  end

  always @(*) begin
    m1_axi_arprot = _zz_io_slaves_1_ar_payload_addr[65 : 63];
    if(when_Axi4Crossbar_l563_1) begin
      if(when_Axi4Crossbar_l566_2) begin
        m1_axi_arprot = s0_axi_arprot;
      end
      if(when_Axi4Crossbar_l566_3) begin
        m1_axi_arprot = s1_axi_arprot;
      end
    end
  end

  always @(*) begin
    m1_axi_rready = 1'b0;
    if(when_Axi4Crossbar_l604_1) begin
      m1_axi_rready = s0_axi_rready;
    end
    if(when_Axi4Crossbar_l604_3) begin
      m1_axi_rready = s1_axi_rready;
    end
  end

  always @(*) begin
    _zz_when_Axi4Crossbar_l450_3[0] = ((32'h00000000 <= s0_axi_awaddr) && (s0_axi_awaddr < 32'h00010000));
    _zz_when_Axi4Crossbar_l450_3[1] = ((32'h00010000 <= s0_axi_awaddr) && (s0_axi_awaddr < 32'h00020000));
  end

  always @(*) begin
    _zz_when_Axi4Crossbar_l450_2[0] = (s0_axi_awvalid && _zz_when_Axi4Crossbar_l450_3[0]);
    _zz_when_Axi4Crossbar_l450_2[1] = (s1_axi_awvalid && _zz_when_Axi4Crossbar_l450_4[0]);
  end

  always @(*) begin
    _zz_when_Axi4Crossbar_l450_4[0] = ((32'h00000000 <= s1_axi_awaddr) && (s1_axi_awaddr < 32'h00010000));
    _zz_when_Axi4Crossbar_l450_4[1] = ((32'h00010000 <= s1_axi_awaddr) && (s1_axi_awaddr < 32'h00020000));
  end

  assign _zz_when_Axi4Crossbar_l161_2 = (_zz__zz_when_Axi4Crossbar_l161_2 + _zz__zz_when_Axi4Crossbar_l161_2_2);
  assign _zz_when_Axi4Crossbar_l161 = ((8'h0f < _zz_when_Axi4Crossbar_l161_2) ? 4'b1111 : _zz__zz_when_Axi4Crossbar_l161);
  assign _zz_when_Axi4Crossbar_l161_3 = (_zz__zz_when_Axi4Crossbar_l161_3 + _zz__zz_when_Axi4Crossbar_l161_3_2);
  assign _zz_when_Axi4Crossbar_l161_1 = ((8'h0f < _zz_when_Axi4Crossbar_l161_3) ? 4'b1111 : _zz__zz_when_Axi4Crossbar_l161_1);
  assign _zz_when_Axi4Crossbar_l161_4 = (_zz_when_Axi4Crossbar_l450_2[0] ? _zz_when_Axi4Crossbar_l161 : 4'b0000);
  assign _zz_when_Axi4Crossbar_l161_5 = (_zz_when_Axi4Crossbar_l450_2[1] ? _zz_when_Axi4Crossbar_l161_1 : 4'b0000);
  assign _zz_when_Axi4Crossbar_l161_6 = ((_zz_when_Axi4Crossbar_l161_5 < _zz_when_Axi4Crossbar_l161_4) ? _zz_when_Axi4Crossbar_l161_4 : _zz_when_Axi4Crossbar_l161_5);
  always @(*) begin
    _zz_when_Axi4Crossbar_l161_7[0] = (_zz_when_Axi4Crossbar_l450_2[0] && (_zz_when_Axi4Crossbar_l161 == _zz_when_Axi4Crossbar_l161_6));
    _zz_when_Axi4Crossbar_l161_7[1] = (_zz_when_Axi4Crossbar_l450_2[1] && (_zz_when_Axi4Crossbar_l161_1 == _zz_when_Axi4Crossbar_l161_6));
  end

  always @(*) begin
    _zz_when_Axi4Crossbar_l161_8[0] = (wrRrPtr_0 <= 1'b0);
    _zz_when_Axi4Crossbar_l161_8[1] = (wrRrPtr_0 <= 1'b1);
  end

  assign _zz_when_Axi4Crossbar_l161_9 = (_zz_when_Axi4Crossbar_l161_7 & _zz_when_Axi4Crossbar_l161_8);
  assign _zz_when_Axi4Crossbar_l161_10 = _zz_when_Axi4Crossbar_l161_9;
  assign _zz_when_Axi4Crossbar_l161_11 = _zz_when_Axi4Crossbar_l161_7;
  assign _zz_when_Axi4Crossbar_l161_12 = ((|_zz_when_Axi4Crossbar_l161_9) ? (_zz_when_Axi4Crossbar_l161_10 & (~ _zz__zz_when_Axi4Crossbar_l161_12)) : (_zz_when_Axi4Crossbar_l161_11 & (~ _zz__zz_when_Axi4Crossbar_l161_12_1)));
  always @(*) begin
    _zz_io_slaves_0_aw_payload_id = 1'b0;
    if(when_Axi4Crossbar_l161) begin
      _zz_io_slaves_0_aw_payload_id = 1'b0;
    end
    if(when_Axi4Crossbar_l161_1) begin
      _zz_io_slaves_0_aw_payload_id = 1'b1;
    end
  end

  assign when_Axi4Crossbar_l161 = _zz_when_Axi4Crossbar_l161_12[0];
  assign when_Axi4Crossbar_l161_1 = _zz_when_Axi4Crossbar_l161_12[1];
  assign when_Axi4Crossbar_l459 = (_zz_when_Axi4Crossbar_l459 == 3'b000);
  assign _zz_when_Axi4Crossbar_l482_2 = _zz__zz_3_port0;
  assign when_Axi4Crossbar_l450 = ((_zz_when_Axi4Crossbar_l450 < 3'b100) && (|_zz_when_Axi4Crossbar_l450_2));
  assign when_Axi4Crossbar_l453 = (_zz_io_slaves_0_aw_payload_id == 1'b0);
  assign when_Axi4Crossbar_l453_1 = (_zz_io_slaves_0_aw_payload_id == 1'b1);
  assign io_slaves_0_aw_fire = (m0_axi_awvalid && m0_axi_awready);
  assign when_Axi4Crossbar_l101 = (! _zz_when_Axi4Crossbar_l450_2[0]);
  assign when_Axi4Crossbar_l106 = (wrQosAge_0_0 != 4'b1111);
  assign when_Axi4Crossbar_l103 = (io_slaves_0_aw_fire && (_zz_io_slaves_0_aw_payload_id == 1'b0));
  assign when_Axi4Crossbar_l101_1 = (! _zz_when_Axi4Crossbar_l450_2[1]);
  assign when_Axi4Crossbar_l106_1 = (wrQosAge_0_1 != 4'b1111);
  assign when_Axi4Crossbar_l103_1 = (io_slaves_0_aw_fire && (_zz_io_slaves_0_aw_payload_id == 1'b1));
  assign when_Axi4Crossbar_l480 = (! when_Axi4Crossbar_l459);
  assign when_Axi4Crossbar_l482 = (_zz_when_Axi4Crossbar_l482_2 == 1'b0);
  assign when_Axi4Crossbar_l482_1 = (_zz_when_Axi4Crossbar_l482_2 == 1'b1);
  assign io_slaves_0_w_fire = (m0_axi_wvalid && m0_axi_wready);
  assign when_Axi4Crossbar_l497 = (io_slaves_0_w_fire && m0_axi_wlast);
  assign when_Axi4Crossbar_l503 = (io_slaves_0_aw_fire && (! when_Axi4Crossbar_l497));
  assign when_Axi4Crossbar_l505 = ((! io_slaves_0_aw_fire) && when_Axi4Crossbar_l497);
  assign io_slaves_0_b_fire = (m0_axi_bvalid && m0_axi_bready);
  assign when_Axi4Crossbar_l512 = (io_slaves_0_aw_fire && (! io_slaves_0_b_fire));
  assign when_Axi4Crossbar_l514 = ((! io_slaves_0_aw_fire) && io_slaves_0_b_fire);
  always @(*) begin
    _zz_when_Axi4Crossbar_l450_6[0] = ((32'h00000000 <= s0_axi_awaddr) && (s0_axi_awaddr < 32'h00010000));
    _zz_when_Axi4Crossbar_l450_6[1] = ((32'h00010000 <= s0_axi_awaddr) && (s0_axi_awaddr < 32'h00020000));
  end

  always @(*) begin
    _zz_when_Axi4Crossbar_l450_5[0] = (s0_axi_awvalid && _zz_when_Axi4Crossbar_l450_6[1]);
    _zz_when_Axi4Crossbar_l450_5[1] = (s1_axi_awvalid && _zz_when_Axi4Crossbar_l450_7[1]);
  end

  always @(*) begin
    _zz_when_Axi4Crossbar_l450_7[0] = ((32'h00000000 <= s1_axi_awaddr) && (s1_axi_awaddr < 32'h00010000));
    _zz_when_Axi4Crossbar_l450_7[1] = ((32'h00010000 <= s1_axi_awaddr) && (s1_axi_awaddr < 32'h00020000));
  end

  assign _zz_when_Axi4Crossbar_l161_15 = (_zz__zz_when_Axi4Crossbar_l161_15 + _zz__zz_when_Axi4Crossbar_l161_15_2);
  assign _zz_when_Axi4Crossbar_l161_13 = ((8'h0f < _zz_when_Axi4Crossbar_l161_15) ? 4'b1111 : _zz__zz_when_Axi4Crossbar_l161_13);
  assign _zz_when_Axi4Crossbar_l161_16 = (_zz__zz_when_Axi4Crossbar_l161_16 + _zz__zz_when_Axi4Crossbar_l161_16_2);
  assign _zz_when_Axi4Crossbar_l161_14 = ((8'h0f < _zz_when_Axi4Crossbar_l161_16) ? 4'b1111 : _zz__zz_when_Axi4Crossbar_l161_14);
  assign _zz_when_Axi4Crossbar_l161_17 = (_zz_when_Axi4Crossbar_l450_5[0] ? _zz_when_Axi4Crossbar_l161_13 : 4'b0000);
  assign _zz_when_Axi4Crossbar_l161_18 = (_zz_when_Axi4Crossbar_l450_5[1] ? _zz_when_Axi4Crossbar_l161_14 : 4'b0000);
  assign _zz_when_Axi4Crossbar_l161_19 = ((_zz_when_Axi4Crossbar_l161_18 < _zz_when_Axi4Crossbar_l161_17) ? _zz_when_Axi4Crossbar_l161_17 : _zz_when_Axi4Crossbar_l161_18);
  always @(*) begin
    _zz_when_Axi4Crossbar_l161_20[0] = (_zz_when_Axi4Crossbar_l450_5[0] && (_zz_when_Axi4Crossbar_l161_13 == _zz_when_Axi4Crossbar_l161_19));
    _zz_when_Axi4Crossbar_l161_20[1] = (_zz_when_Axi4Crossbar_l450_5[1] && (_zz_when_Axi4Crossbar_l161_14 == _zz_when_Axi4Crossbar_l161_19));
  end

  always @(*) begin
    _zz_when_Axi4Crossbar_l161_21[0] = (wrRrPtr_1 <= 1'b0);
    _zz_when_Axi4Crossbar_l161_21[1] = (wrRrPtr_1 <= 1'b1);
  end

  assign _zz_when_Axi4Crossbar_l161_22 = (_zz_when_Axi4Crossbar_l161_20 & _zz_when_Axi4Crossbar_l161_21);
  assign _zz_when_Axi4Crossbar_l161_23 = _zz_when_Axi4Crossbar_l161_22;
  assign _zz_when_Axi4Crossbar_l161_24 = _zz_when_Axi4Crossbar_l161_20;
  assign _zz_when_Axi4Crossbar_l161_25 = ((|_zz_when_Axi4Crossbar_l161_22) ? (_zz_when_Axi4Crossbar_l161_23 & (~ _zz__zz_when_Axi4Crossbar_l161_25)) : (_zz_when_Axi4Crossbar_l161_24 & (~ _zz__zz_when_Axi4Crossbar_l161_25_1)));
  always @(*) begin
    _zz_io_slaves_1_aw_payload_id = 1'b0;
    if(when_Axi4Crossbar_l161_2) begin
      _zz_io_slaves_1_aw_payload_id = 1'b0;
    end
    if(when_Axi4Crossbar_l161_3) begin
      _zz_io_slaves_1_aw_payload_id = 1'b1;
    end
  end

  assign when_Axi4Crossbar_l161_2 = _zz_when_Axi4Crossbar_l161_25[0];
  assign when_Axi4Crossbar_l161_3 = _zz_when_Axi4Crossbar_l161_25[1];
  assign when_Axi4Crossbar_l459_1 = (_zz_when_Axi4Crossbar_l459_1 == 3'b000);
  assign _zz_when_Axi4Crossbar_l482_3 = _zz__zz_4_port0;
  assign when_Axi4Crossbar_l450_1 = ((_zz_when_Axi4Crossbar_l450_1 < 3'b100) && (|_zz_when_Axi4Crossbar_l450_5));
  assign when_Axi4Crossbar_l453_2 = (_zz_io_slaves_1_aw_payload_id == 1'b0);
  assign when_Axi4Crossbar_l453_3 = (_zz_io_slaves_1_aw_payload_id == 1'b1);
  assign io_slaves_1_aw_fire = (m1_axi_awvalid && m1_axi_awready);
  assign when_Axi4Crossbar_l101_2 = (! _zz_when_Axi4Crossbar_l450_5[0]);
  assign when_Axi4Crossbar_l106_2 = (wrQosAge_1_0 != 4'b1111);
  assign when_Axi4Crossbar_l103_2 = (io_slaves_1_aw_fire && (_zz_io_slaves_1_aw_payload_id == 1'b0));
  assign when_Axi4Crossbar_l101_3 = (! _zz_when_Axi4Crossbar_l450_5[1]);
  assign when_Axi4Crossbar_l106_3 = (wrQosAge_1_1 != 4'b1111);
  assign when_Axi4Crossbar_l103_3 = (io_slaves_1_aw_fire && (_zz_io_slaves_1_aw_payload_id == 1'b1));
  assign when_Axi4Crossbar_l480_1 = (! when_Axi4Crossbar_l459_1);
  assign when_Axi4Crossbar_l482_2 = (_zz_when_Axi4Crossbar_l482_3 == 1'b0);
  assign when_Axi4Crossbar_l482_3 = (_zz_when_Axi4Crossbar_l482_3 == 1'b1);
  assign io_slaves_1_w_fire = (m1_axi_wvalid && m1_axi_wready);
  assign when_Axi4Crossbar_l497_1 = (io_slaves_1_w_fire && m1_axi_wlast);
  assign when_Axi4Crossbar_l503_1 = (io_slaves_1_aw_fire && (! when_Axi4Crossbar_l497_1));
  assign when_Axi4Crossbar_l505_1 = ((! io_slaves_1_aw_fire) && when_Axi4Crossbar_l497_1);
  assign io_slaves_1_b_fire = (m1_axi_bvalid && m1_axi_bready);
  assign when_Axi4Crossbar_l512_1 = (io_slaves_1_aw_fire && (! io_slaves_1_b_fire));
  assign when_Axi4Crossbar_l514_1 = ((! io_slaves_1_aw_fire) && io_slaves_1_b_fire);
  always @(*) begin
    _zz_when_Axi4Crossbar_l534[0] = (m0_axi_bvalid && (_zz__zz_when_Axi4Crossbar_l534 == 1'b0));
    _zz_when_Axi4Crossbar_l534[1] = (m1_axi_bvalid && (_zz__zz_when_Axi4Crossbar_l534_1 == 1'b0));
  end

  assign _zz_when_Axi4Crossbar_l534_1 = _zz_when_Axi4Crossbar_l534;
  assign _zz_when_Axi4Crossbar_l534_2 = (_zz_when_Axi4Crossbar_l534_1 & (~ _zz__zz_when_Axi4Crossbar_l534_2));
  assign when_Axi4Crossbar_l534 = _zz_when_Axi4Crossbar_l534_2[0];
  assign when_Axi4Crossbar_l534_1 = _zz_when_Axi4Crossbar_l534_2[1];
  always @(*) begin
    _zz_when_Axi4Crossbar_l534_3[0] = (m0_axi_bvalid && (_zz__zz_when_Axi4Crossbar_l534_3 == 1'b1));
    _zz_when_Axi4Crossbar_l534_3[1] = (m1_axi_bvalid && (_zz__zz_when_Axi4Crossbar_l534_3_1 == 1'b1));
  end

  assign _zz_when_Axi4Crossbar_l534_4 = _zz_when_Axi4Crossbar_l534_3;
  assign _zz_when_Axi4Crossbar_l534_5 = (_zz_when_Axi4Crossbar_l534_4 & (~ _zz__zz_when_Axi4Crossbar_l534_5));
  assign when_Axi4Crossbar_l534_2 = _zz_when_Axi4Crossbar_l534_5[0];
  assign when_Axi4Crossbar_l534_3 = _zz_when_Axi4Crossbar_l534_5[1];
  always @(*) begin
    _zz_when_Axi4Crossbar_l563_3[0] = ((32'h00000000 <= s0_axi_araddr) && (s0_axi_araddr < 32'h00010000));
    _zz_when_Axi4Crossbar_l563_3[1] = ((32'h00010000 <= s0_axi_araddr) && (s0_axi_araddr < 32'h00020000));
  end

  always @(*) begin
    _zz_when_Axi4Crossbar_l563_2[0] = (s0_axi_arvalid && _zz_when_Axi4Crossbar_l563_3[0]);
    _zz_when_Axi4Crossbar_l563_2[1] = (s1_axi_arvalid && _zz_when_Axi4Crossbar_l563_4[0]);
  end

  always @(*) begin
    _zz_when_Axi4Crossbar_l563_4[0] = ((32'h00000000 <= s1_axi_araddr) && (s1_axi_araddr < 32'h00010000));
    _zz_when_Axi4Crossbar_l563_4[1] = ((32'h00010000 <= s1_axi_araddr) && (s1_axi_araddr < 32'h00020000));
  end

  assign _zz_when_Axi4Crossbar_l161_28 = (_zz__zz_when_Axi4Crossbar_l161_28 + _zz__zz_when_Axi4Crossbar_l161_28_2);
  assign _zz_when_Axi4Crossbar_l161_26 = ((8'h0f < _zz_when_Axi4Crossbar_l161_28) ? 4'b1111 : _zz__zz_when_Axi4Crossbar_l161_26);
  assign _zz_when_Axi4Crossbar_l161_29 = (_zz__zz_when_Axi4Crossbar_l161_29 + _zz__zz_when_Axi4Crossbar_l161_29_2);
  assign _zz_when_Axi4Crossbar_l161_27 = ((8'h0f < _zz_when_Axi4Crossbar_l161_29) ? 4'b1111 : _zz__zz_when_Axi4Crossbar_l161_27);
  assign _zz_when_Axi4Crossbar_l161_30 = (_zz_when_Axi4Crossbar_l563_2[0] ? _zz_when_Axi4Crossbar_l161_26 : 4'b0000);
  assign _zz_when_Axi4Crossbar_l161_31 = (_zz_when_Axi4Crossbar_l563_2[1] ? _zz_when_Axi4Crossbar_l161_27 : 4'b0000);
  assign _zz_when_Axi4Crossbar_l161_32 = ((_zz_when_Axi4Crossbar_l161_31 < _zz_when_Axi4Crossbar_l161_30) ? _zz_when_Axi4Crossbar_l161_30 : _zz_when_Axi4Crossbar_l161_31);
  always @(*) begin
    _zz_when_Axi4Crossbar_l161_33[0] = (_zz_when_Axi4Crossbar_l563_2[0] && (_zz_when_Axi4Crossbar_l161_26 == _zz_when_Axi4Crossbar_l161_32));
    _zz_when_Axi4Crossbar_l161_33[1] = (_zz_when_Axi4Crossbar_l563_2[1] && (_zz_when_Axi4Crossbar_l161_27 == _zz_when_Axi4Crossbar_l161_32));
  end

  always @(*) begin
    _zz_when_Axi4Crossbar_l161_34[0] = (rdRrPtr_0 <= 1'b0);
    _zz_when_Axi4Crossbar_l161_34[1] = (rdRrPtr_0 <= 1'b1);
  end

  assign _zz_when_Axi4Crossbar_l161_35 = (_zz_when_Axi4Crossbar_l161_33 & _zz_when_Axi4Crossbar_l161_34);
  assign _zz_when_Axi4Crossbar_l161_36 = _zz_when_Axi4Crossbar_l161_35;
  assign _zz_when_Axi4Crossbar_l161_37 = _zz_when_Axi4Crossbar_l161_33;
  assign _zz_when_Axi4Crossbar_l161_38 = ((|_zz_when_Axi4Crossbar_l161_35) ? (_zz_when_Axi4Crossbar_l161_36 & (~ _zz__zz_when_Axi4Crossbar_l161_38)) : (_zz_when_Axi4Crossbar_l161_37 & (~ _zz__zz_when_Axi4Crossbar_l161_38_1)));
  always @(*) begin
    _zz_io_slaves_0_ar_payload_id = 1'b0;
    if(when_Axi4Crossbar_l161_4) begin
      _zz_io_slaves_0_ar_payload_id = 1'b0;
    end
    if(when_Axi4Crossbar_l161_5) begin
      _zz_io_slaves_0_ar_payload_id = 1'b1;
    end
  end

  assign when_Axi4Crossbar_l161_4 = _zz_when_Axi4Crossbar_l161_38[0];
  assign when_Axi4Crossbar_l161_5 = _zz_when_Axi4Crossbar_l161_38[1];
  assign when_Axi4Crossbar_l563 = ((_zz_when_Axi4Crossbar_l563 < 3'b100) && (|_zz_when_Axi4Crossbar_l563_2));
  assign when_Axi4Crossbar_l566 = (_zz_io_slaves_0_ar_payload_id == 1'b0);
  assign when_Axi4Crossbar_l566_1 = (_zz_io_slaves_0_ar_payload_id == 1'b1);
  assign io_slaves_0_ar_fire = (m0_axi_arvalid && m0_axi_arready);
  assign when_Axi4Crossbar_l101_4 = (! _zz_when_Axi4Crossbar_l563_2[0]);
  assign when_Axi4Crossbar_l106_4 = (rdQosAge_0_0 != 4'b1111);
  assign when_Axi4Crossbar_l103_4 = (io_slaves_0_ar_fire && (_zz_io_slaves_0_ar_payload_id == 1'b0));
  assign when_Axi4Crossbar_l101_5 = (! _zz_when_Axi4Crossbar_l563_2[1]);
  assign when_Axi4Crossbar_l106_5 = (rdQosAge_0_1 != 4'b1111);
  assign when_Axi4Crossbar_l103_5 = (io_slaves_0_ar_fire && (_zz_io_slaves_0_ar_payload_id == 1'b1));
  assign io_slaves_0_r_fire = (m0_axi_rvalid && m0_axi_rready);
  assign _zz_when_Axi4Crossbar_l584 = (io_slaves_0_r_fire && m0_axi_rlast);
  assign when_Axi4Crossbar_l584 = (io_slaves_0_ar_fire && (! _zz_when_Axi4Crossbar_l584));
  assign when_Axi4Crossbar_l586 = ((! io_slaves_0_ar_fire) && _zz_when_Axi4Crossbar_l584);
  always @(*) begin
    _zz_when_Axi4Crossbar_l563_6[0] = ((32'h00000000 <= s0_axi_araddr) && (s0_axi_araddr < 32'h00010000));
    _zz_when_Axi4Crossbar_l563_6[1] = ((32'h00010000 <= s0_axi_araddr) && (s0_axi_araddr < 32'h00020000));
  end

  always @(*) begin
    _zz_when_Axi4Crossbar_l563_5[0] = (s0_axi_arvalid && _zz_when_Axi4Crossbar_l563_6[1]);
    _zz_when_Axi4Crossbar_l563_5[1] = (s1_axi_arvalid && _zz_when_Axi4Crossbar_l563_7[1]);
  end

  always @(*) begin
    _zz_when_Axi4Crossbar_l563_7[0] = ((32'h00000000 <= s1_axi_araddr) && (s1_axi_araddr < 32'h00010000));
    _zz_when_Axi4Crossbar_l563_7[1] = ((32'h00010000 <= s1_axi_araddr) && (s1_axi_araddr < 32'h00020000));
  end

  assign _zz_when_Axi4Crossbar_l161_41 = (_zz__zz_when_Axi4Crossbar_l161_41 + _zz__zz_when_Axi4Crossbar_l161_41_2);
  assign _zz_when_Axi4Crossbar_l161_39 = ((8'h0f < _zz_when_Axi4Crossbar_l161_41) ? 4'b1111 : _zz__zz_when_Axi4Crossbar_l161_39);
  assign _zz_when_Axi4Crossbar_l161_42 = (_zz__zz_when_Axi4Crossbar_l161_42 + _zz__zz_when_Axi4Crossbar_l161_42_2);
  assign _zz_when_Axi4Crossbar_l161_40 = ((8'h0f < _zz_when_Axi4Crossbar_l161_42) ? 4'b1111 : _zz__zz_when_Axi4Crossbar_l161_40);
  assign _zz_when_Axi4Crossbar_l161_43 = (_zz_when_Axi4Crossbar_l563_5[0] ? _zz_when_Axi4Crossbar_l161_39 : 4'b0000);
  assign _zz_when_Axi4Crossbar_l161_44 = (_zz_when_Axi4Crossbar_l563_5[1] ? _zz_when_Axi4Crossbar_l161_40 : 4'b0000);
  assign _zz_when_Axi4Crossbar_l161_45 = ((_zz_when_Axi4Crossbar_l161_44 < _zz_when_Axi4Crossbar_l161_43) ? _zz_when_Axi4Crossbar_l161_43 : _zz_when_Axi4Crossbar_l161_44);
  always @(*) begin
    _zz_when_Axi4Crossbar_l161_46[0] = (_zz_when_Axi4Crossbar_l563_5[0] && (_zz_when_Axi4Crossbar_l161_39 == _zz_when_Axi4Crossbar_l161_45));
    _zz_when_Axi4Crossbar_l161_46[1] = (_zz_when_Axi4Crossbar_l563_5[1] && (_zz_when_Axi4Crossbar_l161_40 == _zz_when_Axi4Crossbar_l161_45));
  end

  always @(*) begin
    _zz_when_Axi4Crossbar_l161_47[0] = (rdRrPtr_1 <= 1'b0);
    _zz_when_Axi4Crossbar_l161_47[1] = (rdRrPtr_1 <= 1'b1);
  end

  assign _zz_when_Axi4Crossbar_l161_48 = (_zz_when_Axi4Crossbar_l161_46 & _zz_when_Axi4Crossbar_l161_47);
  assign _zz_when_Axi4Crossbar_l161_49 = _zz_when_Axi4Crossbar_l161_48;
  assign _zz_when_Axi4Crossbar_l161_50 = _zz_when_Axi4Crossbar_l161_46;
  assign _zz_when_Axi4Crossbar_l161_51 = ((|_zz_when_Axi4Crossbar_l161_48) ? (_zz_when_Axi4Crossbar_l161_49 & (~ _zz__zz_when_Axi4Crossbar_l161_51)) : (_zz_when_Axi4Crossbar_l161_50 & (~ _zz__zz_when_Axi4Crossbar_l161_51_1)));
  always @(*) begin
    _zz_io_slaves_1_ar_payload_id = 1'b0;
    if(when_Axi4Crossbar_l161_6) begin
      _zz_io_slaves_1_ar_payload_id = 1'b0;
    end
    if(when_Axi4Crossbar_l161_7) begin
      _zz_io_slaves_1_ar_payload_id = 1'b1;
    end
  end

  assign when_Axi4Crossbar_l161_6 = _zz_when_Axi4Crossbar_l161_51[0];
  assign when_Axi4Crossbar_l161_7 = _zz_when_Axi4Crossbar_l161_51[1];
  assign when_Axi4Crossbar_l563_1 = ((_zz_when_Axi4Crossbar_l563_1 < 3'b100) && (|_zz_when_Axi4Crossbar_l563_5));
  assign when_Axi4Crossbar_l566_2 = (_zz_io_slaves_1_ar_payload_id == 1'b0);
  assign when_Axi4Crossbar_l566_3 = (_zz_io_slaves_1_ar_payload_id == 1'b1);
  assign io_slaves_1_ar_fire = (m1_axi_arvalid && m1_axi_arready);
  assign when_Axi4Crossbar_l101_6 = (! _zz_when_Axi4Crossbar_l563_5[0]);
  assign when_Axi4Crossbar_l106_6 = (rdQosAge_1_0 != 4'b1111);
  assign when_Axi4Crossbar_l103_6 = (io_slaves_1_ar_fire && (_zz_io_slaves_1_ar_payload_id == 1'b0));
  assign when_Axi4Crossbar_l101_7 = (! _zz_when_Axi4Crossbar_l563_5[1]);
  assign when_Axi4Crossbar_l106_7 = (rdQosAge_1_1 != 4'b1111);
  assign when_Axi4Crossbar_l103_7 = (io_slaves_1_ar_fire && (_zz_io_slaves_1_ar_payload_id == 1'b1));
  assign io_slaves_1_r_fire = (m1_axi_rvalid && m1_axi_rready);
  assign _zz_when_Axi4Crossbar_l584_1 = (io_slaves_1_r_fire && m1_axi_rlast);
  assign when_Axi4Crossbar_l584_1 = (io_slaves_1_ar_fire && (! _zz_when_Axi4Crossbar_l584_1));
  assign when_Axi4Crossbar_l586_1 = ((! io_slaves_1_ar_fire) && _zz_when_Axi4Crossbar_l584_1);
  always @(*) begin
    _zz_when_Axi4Crossbar_l604[0] = (m0_axi_rvalid && (_zz__zz_when_Axi4Crossbar_l604 == 1'b0));
    _zz_when_Axi4Crossbar_l604[1] = (m1_axi_rvalid && (_zz__zz_when_Axi4Crossbar_l604_1 == 1'b0));
  end

  assign _zz_when_Axi4Crossbar_l604_1 = _zz_when_Axi4Crossbar_l604;
  assign _zz_when_Axi4Crossbar_l604_2 = (_zz_when_Axi4Crossbar_l604_1 & (~ _zz__zz_when_Axi4Crossbar_l604_2));
  assign when_Axi4Crossbar_l604 = _zz_when_Axi4Crossbar_l604_2[0];
  assign when_Axi4Crossbar_l604_1 = _zz_when_Axi4Crossbar_l604_2[1];
  always @(*) begin
    _zz_when_Axi4Crossbar_l604_3[0] = (m0_axi_rvalid && (_zz__zz_when_Axi4Crossbar_l604_3 == 1'b1));
    _zz_when_Axi4Crossbar_l604_3[1] = (m1_axi_rvalid && (_zz__zz_when_Axi4Crossbar_l604_3_1 == 1'b1));
  end

  assign _zz_when_Axi4Crossbar_l604_4 = _zz_when_Axi4Crossbar_l604_3;
  assign _zz_when_Axi4Crossbar_l604_5 = (_zz_when_Axi4Crossbar_l604_4 & (~ _zz__zz_when_Axi4Crossbar_l604_5));
  assign when_Axi4Crossbar_l604_2 = _zz_when_Axi4Crossbar_l604_5[0];
  assign when_Axi4Crossbar_l604_3 = _zz_when_Axi4Crossbar_l604_5[1];
  always @(posedge aclk) begin
    if(!aresetn) begin
      wrRrPtr_0 <= 1'b0;
      wrRrPtr_1 <= 1'b0;
      rdRrPtr_0 <= 1'b0;
      rdRrPtr_1 <= 1'b0;
      wrQosAge_0_0 <= 4'b0000;
      wrQosAge_0_1 <= 4'b0000;
      wrQosAge_1_0 <= 4'b0000;
      wrQosAge_1_1 <= 4'b0000;
      rdQosAge_0_0 <= 4'b0000;
      rdQosAge_0_1 <= 4'b0000;
      rdQosAge_1_0 <= 4'b0000;
      rdQosAge_1_1 <= 4'b0000;
      _zz_when_Axi4Crossbar_l450 <= 3'b000;
      _zz_when_Axi4Crossbar_l450_1 <= 3'b000;
      _zz_5 <= 2'b00;
      _zz_6 <= 2'b00;
      _zz_when_Axi4Crossbar_l482 <= 2'b00;
      _zz_when_Axi4Crossbar_l482_1 <= 2'b00;
      _zz_when_Axi4Crossbar_l459 <= 3'b000;
      _zz_when_Axi4Crossbar_l459_1 <= 3'b000;
      _zz_when_Axi4Crossbar_l563 <= 3'b000;
      _zz_when_Axi4Crossbar_l563_1 <= 3'b000;
    end else begin
      if(io_slaves_0_aw_fire) begin
        _zz_5 <= ((_zz_5 == 2'b11) ? 2'b00 : _zz__zz_5);
        wrRrPtr_0 <= (_zz_io_slaves_0_aw_payload_id + 1'b1);
      end
      if(when_Axi4Crossbar_l101) begin
        wrQosAge_0_0 <= 4'b0000;
      end else begin
        if(when_Axi4Crossbar_l103) begin
          wrQosAge_0_0 <= 4'b0000;
        end else begin
          if(when_Axi4Crossbar_l106) begin
            wrQosAge_0_0 <= (wrQosAge_0_0 + 4'b0001);
          end
        end
      end
      if(when_Axi4Crossbar_l101_1) begin
        wrQosAge_0_1 <= 4'b0000;
      end else begin
        if(when_Axi4Crossbar_l103_1) begin
          wrQosAge_0_1 <= 4'b0000;
        end else begin
          if(when_Axi4Crossbar_l106_1) begin
            wrQosAge_0_1 <= (wrQosAge_0_1 + 4'b0001);
          end
        end
      end
      if(when_Axi4Crossbar_l497) begin
        _zz_when_Axi4Crossbar_l482 <= ((_zz_when_Axi4Crossbar_l482 == 2'b11) ? 2'b00 : _zz__zz_when_Axi4Crossbar_l482);
      end
      if(when_Axi4Crossbar_l503) begin
        _zz_when_Axi4Crossbar_l459 <= (_zz_when_Axi4Crossbar_l459 + 3'b001);
      end else begin
        if(when_Axi4Crossbar_l505) begin
          _zz_when_Axi4Crossbar_l459 <= (_zz_when_Axi4Crossbar_l459 - 3'b001);
        end
      end
      if(when_Axi4Crossbar_l512) begin
        _zz_when_Axi4Crossbar_l450 <= (_zz_when_Axi4Crossbar_l450 + 3'b001);
      end else begin
        if(when_Axi4Crossbar_l514) begin
          _zz_when_Axi4Crossbar_l450 <= (_zz_when_Axi4Crossbar_l450 - 3'b001);
        end
      end
      if(io_slaves_1_aw_fire) begin
        _zz_6 <= ((_zz_6 == 2'b11) ? 2'b00 : _zz__zz_6);
        wrRrPtr_1 <= (_zz_io_slaves_1_aw_payload_id + 1'b1);
      end
      if(when_Axi4Crossbar_l101_2) begin
        wrQosAge_1_0 <= 4'b0000;
      end else begin
        if(when_Axi4Crossbar_l103_2) begin
          wrQosAge_1_0 <= 4'b0000;
        end else begin
          if(when_Axi4Crossbar_l106_2) begin
            wrQosAge_1_0 <= (wrQosAge_1_0 + 4'b0001);
          end
        end
      end
      if(when_Axi4Crossbar_l101_3) begin
        wrQosAge_1_1 <= 4'b0000;
      end else begin
        if(when_Axi4Crossbar_l103_3) begin
          wrQosAge_1_1 <= 4'b0000;
        end else begin
          if(when_Axi4Crossbar_l106_3) begin
            wrQosAge_1_1 <= (wrQosAge_1_1 + 4'b0001);
          end
        end
      end
      if(when_Axi4Crossbar_l497_1) begin
        _zz_when_Axi4Crossbar_l482_1 <= ((_zz_when_Axi4Crossbar_l482_1 == 2'b11) ? 2'b00 : _zz__zz_when_Axi4Crossbar_l482_1);
      end
      if(when_Axi4Crossbar_l503_1) begin
        _zz_when_Axi4Crossbar_l459_1 <= (_zz_when_Axi4Crossbar_l459_1 + 3'b001);
      end else begin
        if(when_Axi4Crossbar_l505_1) begin
          _zz_when_Axi4Crossbar_l459_1 <= (_zz_when_Axi4Crossbar_l459_1 - 3'b001);
        end
      end
      if(when_Axi4Crossbar_l512_1) begin
        _zz_when_Axi4Crossbar_l450_1 <= (_zz_when_Axi4Crossbar_l450_1 + 3'b001);
      end else begin
        if(when_Axi4Crossbar_l514_1) begin
          _zz_when_Axi4Crossbar_l450_1 <= (_zz_when_Axi4Crossbar_l450_1 - 3'b001);
        end
      end
      if(io_slaves_0_ar_fire) begin
        rdRrPtr_0 <= (_zz_io_slaves_0_ar_payload_id + 1'b1);
      end
      if(when_Axi4Crossbar_l101_4) begin
        rdQosAge_0_0 <= 4'b0000;
      end else begin
        if(when_Axi4Crossbar_l103_4) begin
          rdQosAge_0_0 <= 4'b0000;
        end else begin
          if(when_Axi4Crossbar_l106_4) begin
            rdQosAge_0_0 <= (rdQosAge_0_0 + 4'b0001);
          end
        end
      end
      if(when_Axi4Crossbar_l101_5) begin
        rdQosAge_0_1 <= 4'b0000;
      end else begin
        if(when_Axi4Crossbar_l103_5) begin
          rdQosAge_0_1 <= 4'b0000;
        end else begin
          if(when_Axi4Crossbar_l106_5) begin
            rdQosAge_0_1 <= (rdQosAge_0_1 + 4'b0001);
          end
        end
      end
      if(when_Axi4Crossbar_l584) begin
        _zz_when_Axi4Crossbar_l563 <= (_zz_when_Axi4Crossbar_l563 + 3'b001);
      end else begin
        if(when_Axi4Crossbar_l586) begin
          _zz_when_Axi4Crossbar_l563 <= (_zz_when_Axi4Crossbar_l563 - 3'b001);
        end
      end
      if(io_slaves_1_ar_fire) begin
        rdRrPtr_1 <= (_zz_io_slaves_1_ar_payload_id + 1'b1);
      end
      if(when_Axi4Crossbar_l101_6) begin
        rdQosAge_1_0 <= 4'b0000;
      end else begin
        if(when_Axi4Crossbar_l103_6) begin
          rdQosAge_1_0 <= 4'b0000;
        end else begin
          if(when_Axi4Crossbar_l106_6) begin
            rdQosAge_1_0 <= (rdQosAge_1_0 + 4'b0001);
          end
        end
      end
      if(when_Axi4Crossbar_l101_7) begin
        rdQosAge_1_1 <= 4'b0000;
      end else begin
        if(when_Axi4Crossbar_l103_7) begin
          rdQosAge_1_1 <= 4'b0000;
        end else begin
          if(when_Axi4Crossbar_l106_7) begin
            rdQosAge_1_1 <= (rdQosAge_1_1 + 4'b0001);
          end
        end
      end
      if(when_Axi4Crossbar_l584_1) begin
        _zz_when_Axi4Crossbar_l563_1 <= (_zz_when_Axi4Crossbar_l563_1 + 3'b001);
      end else begin
        if(when_Axi4Crossbar_l586_1) begin
          _zz_when_Axi4Crossbar_l563_1 <= (_zz_when_Axi4Crossbar_l563_1 - 3'b001);
        end
      end
    end
  end


endmodule
