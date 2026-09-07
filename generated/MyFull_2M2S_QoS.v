// Copyright (c) 2026 Leonardo Capossio - bard0 design  hello@bard0.com
// SPDX-License-Identifier: MIT
// Generator : SpinalHDL v1.14.2    git head : 78f29dc66110fc099a777992b6daa2f803ab445e
// Component : AxiZeroMixedTop
// Git hash  : e4ae231ab45f2af93f68dbb509b855f6a8cb625a

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

  reg                 decErr_io_axi_aw_valid;
  reg        [31:0]   decErr_io_axi_aw_payload_addr;
  reg        [4:0]    decErr_io_axi_aw_payload_id;
  wire       [3:0]    decErr_io_axi_aw_payload_region;
  reg        [7:0]    decErr_io_axi_aw_payload_len;
  reg        [2:0]    decErr_io_axi_aw_payload_size;
  reg        [1:0]    decErr_io_axi_aw_payload_burst;
  reg        [0:0]    decErr_io_axi_aw_payload_lock;
  reg        [3:0]    decErr_io_axi_aw_payload_cache;
  reg        [3:0]    decErr_io_axi_aw_payload_qos;
  reg        [2:0]    decErr_io_axi_aw_payload_prot;
  reg                 decErr_io_axi_w_valid;
  reg        [31:0]   decErr_io_axi_w_payload_data;
  reg        [3:0]    decErr_io_axi_w_payload_strb;
  reg                 decErr_io_axi_w_payload_last;
  reg                 decErr_io_axi_b_ready;
  reg                 decErr_io_axi_ar_valid;
  reg        [31:0]   decErr_io_axi_ar_payload_addr;
  reg        [4:0]    decErr_io_axi_ar_payload_id;
  wire       [3:0]    decErr_io_axi_ar_payload_region;
  reg        [7:0]    decErr_io_axi_ar_payload_len;
  reg        [2:0]    decErr_io_axi_ar_payload_size;
  reg        [1:0]    decErr_io_axi_ar_payload_burst;
  reg        [0:0]    decErr_io_axi_ar_payload_lock;
  reg        [3:0]    decErr_io_axi_ar_payload_cache;
  reg        [3:0]    decErr_io_axi_ar_payload_qos;
  reg        [2:0]    decErr_io_axi_ar_payload_prot;
  reg                 decErr_io_axi_r_ready;
  wire       [0:0]    _zz_4_spinal_port0;
  wire       [0:0]    _zz_5_spinal_port0;
  wire       [0:0]    _zz_6_spinal_port0;
  wire                decErr_io_axi_ar_ready;
  wire                decErr_io_axi_aw_ready;
  wire                decErr_io_axi_w_ready;
  wire                decErr_io_axi_r_valid;
  wire       [31:0]   decErr_io_axi_r_payload_data;
  wire       [4:0]    decErr_io_axi_r_payload_id;
  wire       [1:0]    decErr_io_axi_r_payload_resp;
  wire                decErr_io_axi_r_payload_last;
  wire                decErr_io_axi_b_valid;
  wire       [4:0]    decErr_io_axi_b_payload_id;
  wire       [1:0]    decErr_io_axi_b_payload_resp;
  wire       [2:0]    _zz__zz_when_Axi4Crossbar_l500_3;
  wire       [2:0]    _zz__zz_when_Axi4Crossbar_l500_3_1;
  wire       [7:0]    _zz__zz_when_Axi4Crossbar_l203_2;
  wire       [3:0]    _zz__zz_when_Axi4Crossbar_l203_2_1;
  wire       [7:0]    _zz__zz_when_Axi4Crossbar_l203_2_2;
  wire       [3:0]    _zz__zz_when_Axi4Crossbar_l203;
  wire       [7:0]    _zz__zz_when_Axi4Crossbar_l203_3;
  wire       [3:0]    _zz__zz_when_Axi4Crossbar_l203_3_1;
  wire       [7:0]    _zz__zz_when_Axi4Crossbar_l203_3_2;
  wire       [3:0]    _zz__zz_when_Axi4Crossbar_l203_1;
  wire       [1:0]    _zz__zz_when_Axi4Crossbar_l203_12;
  wire       [1:0]    _zz__zz_when_Axi4Crossbar_l203_12_1;
  wire       [1:0]    _zz__zz_7;
  wire       [0:0]    _zz__zz_4_port;
  wire       [1:0]    _zz__zz_when_Axi4Crossbar_l532;
  wire       [2:0]    _zz__zz_when_Axi4Crossbar_l500_6;
  wire       [2:0]    _zz__zz_when_Axi4Crossbar_l500_6_1;
  wire       [7:0]    _zz__zz_when_Axi4Crossbar_l203_15;
  wire       [3:0]    _zz__zz_when_Axi4Crossbar_l203_15_1;
  wire       [7:0]    _zz__zz_when_Axi4Crossbar_l203_15_2;
  wire       [3:0]    _zz__zz_when_Axi4Crossbar_l203_13;
  wire       [7:0]    _zz__zz_when_Axi4Crossbar_l203_16;
  wire       [3:0]    _zz__zz_when_Axi4Crossbar_l203_16_1;
  wire       [7:0]    _zz__zz_when_Axi4Crossbar_l203_16_2;
  wire       [3:0]    _zz__zz_when_Axi4Crossbar_l203_14;
  wire       [1:0]    _zz__zz_when_Axi4Crossbar_l203_25;
  wire       [1:0]    _zz__zz_when_Axi4Crossbar_l203_25_1;
  wire       [1:0]    _zz__zz_8;
  wire       [0:0]    _zz__zz_5_port;
  wire       [1:0]    _zz__zz_when_Axi4Crossbar_l532_1;
  wire       [2:0]    _zz__zz_when_Axi4Crossbar_l500_9;
  wire       [2:0]    _zz__zz_when_Axi4Crossbar_l500_9_1;
  wire       [7:0]    _zz__zz_when_Axi4Crossbar_l203_28;
  wire       [3:0]    _zz__zz_when_Axi4Crossbar_l203_28_1;
  wire       [7:0]    _zz__zz_when_Axi4Crossbar_l203_28_2;
  wire       [3:0]    _zz__zz_when_Axi4Crossbar_l203_26;
  wire       [7:0]    _zz__zz_when_Axi4Crossbar_l203_29;
  wire       [3:0]    _zz__zz_when_Axi4Crossbar_l203_29_1;
  wire       [7:0]    _zz__zz_when_Axi4Crossbar_l203_29_2;
  wire       [3:0]    _zz__zz_when_Axi4Crossbar_l203_27;
  wire       [1:0]    _zz__zz_when_Axi4Crossbar_l203_38;
  wire       [1:0]    _zz__zz_when_Axi4Crossbar_l203_38_1;
  wire       [1:0]    _zz__zz_9;
  wire       [0:0]    _zz__zz_6_port;
  wire       [1:0]    _zz__zz_when_Axi4Crossbar_l532_2;
  wire       [0:0]    _zz__zz_when_Axi4Crossbar_l584;
  wire       [0:0]    _zz__zz_when_Axi4Crossbar_l584_1;
  wire       [0:0]    _zz__zz_when_Axi4Crossbar_l584_2;
  wire       [2:0]    _zz__zz_when_Axi4Crossbar_l584_2_1;
  wire       [0:0]    _zz__zz_when_Axi4Crossbar_l584_3;
  wire       [0:0]    _zz__zz_when_Axi4Crossbar_l584_3_1;
  wire       [0:0]    _zz__zz_when_Axi4Crossbar_l584_3_2;
  wire       [2:0]    _zz__zz_when_Axi4Crossbar_l584_5;
  wire       [2:0]    _zz__zz_when_Axi4Crossbar_l615_3;
  wire       [2:0]    _zz__zz_when_Axi4Crossbar_l615_3_1;
  wire       [7:0]    _zz__zz_when_Axi4Crossbar_l203_41;
  wire       [3:0]    _zz__zz_when_Axi4Crossbar_l203_41_1;
  wire       [7:0]    _zz__zz_when_Axi4Crossbar_l203_41_2;
  wire       [3:0]    _zz__zz_when_Axi4Crossbar_l203_39;
  wire       [7:0]    _zz__zz_when_Axi4Crossbar_l203_42;
  wire       [3:0]    _zz__zz_when_Axi4Crossbar_l203_42_1;
  wire       [7:0]    _zz__zz_when_Axi4Crossbar_l203_42_2;
  wire       [3:0]    _zz__zz_when_Axi4Crossbar_l203_40;
  wire       [1:0]    _zz__zz_when_Axi4Crossbar_l203_51;
  wire       [1:0]    _zz__zz_when_Axi4Crossbar_l203_51_1;
  wire       [2:0]    _zz__zz_when_Axi4Crossbar_l615_6;
  wire       [2:0]    _zz__zz_when_Axi4Crossbar_l615_6_1;
  wire       [7:0]    _zz__zz_when_Axi4Crossbar_l203_54;
  wire       [3:0]    _zz__zz_when_Axi4Crossbar_l203_54_1;
  wire       [7:0]    _zz__zz_when_Axi4Crossbar_l203_54_2;
  wire       [3:0]    _zz__zz_when_Axi4Crossbar_l203_52;
  wire       [7:0]    _zz__zz_when_Axi4Crossbar_l203_55;
  wire       [3:0]    _zz__zz_when_Axi4Crossbar_l203_55_1;
  wire       [7:0]    _zz__zz_when_Axi4Crossbar_l203_55_2;
  wire       [3:0]    _zz__zz_when_Axi4Crossbar_l203_53;
  wire       [1:0]    _zz__zz_when_Axi4Crossbar_l203_64;
  wire       [1:0]    _zz__zz_when_Axi4Crossbar_l203_64_1;
  wire       [2:0]    _zz__zz_when_Axi4Crossbar_l615_9;
  wire       [2:0]    _zz__zz_when_Axi4Crossbar_l615_9_1;
  wire       [7:0]    _zz__zz_when_Axi4Crossbar_l203_67;
  wire       [3:0]    _zz__zz_when_Axi4Crossbar_l203_67_1;
  wire       [7:0]    _zz__zz_when_Axi4Crossbar_l203_67_2;
  wire       [3:0]    _zz__zz_when_Axi4Crossbar_l203_65;
  wire       [7:0]    _zz__zz_when_Axi4Crossbar_l203_68;
  wire       [3:0]    _zz__zz_when_Axi4Crossbar_l203_68_1;
  wire       [7:0]    _zz__zz_when_Axi4Crossbar_l203_68_2;
  wire       [3:0]    _zz__zz_when_Axi4Crossbar_l203_66;
  wire       [1:0]    _zz__zz_when_Axi4Crossbar_l203_77;
  wire       [1:0]    _zz__zz_when_Axi4Crossbar_l203_77_1;
  wire       [0:0]    _zz__zz_when_Axi4Crossbar_l656;
  wire       [0:0]    _zz__zz_when_Axi4Crossbar_l656_1;
  wire       [0:0]    _zz__zz_when_Axi4Crossbar_l656_2;
  wire       [2:0]    _zz__zz_when_Axi4Crossbar_l656_2_1;
  wire       [0:0]    _zz__zz_when_Axi4Crossbar_l656_3;
  wire       [0:0]    _zz__zz_when_Axi4Crossbar_l656_3_1;
  wire       [0:0]    _zz__zz_when_Axi4Crossbar_l656_3_2;
  wire       [2:0]    _zz__zz_when_Axi4Crossbar_l656_5;
  reg                 _zz_1;
  reg                 _zz_2;
  reg                 _zz_3;
  reg        [0:0]    wrRrPtr_0;
  reg        [0:0]    wrRrPtr_1;
  reg        [0:0]    wrRrPtr_2;
  reg        [0:0]    rdRrPtr_0;
  reg        [0:0]    rdRrPtr_1;
  reg        [0:0]    rdRrPtr_2;
  reg        [3:0]    wrQosAge_0_0;
  reg        [3:0]    wrQosAge_0_1;
  reg        [3:0]    wrQosAge_1_0;
  reg        [3:0]    wrQosAge_1_1;
  reg        [3:0]    wrQosAge_2_0;
  reg        [3:0]    wrQosAge_2_1;
  reg        [3:0]    rdQosAge_0_0;
  reg        [3:0]    rdQosAge_0_1;
  reg        [3:0]    rdQosAge_1_0;
  reg        [3:0]    rdQosAge_1_1;
  reg        [3:0]    rdQosAge_2_0;
  reg        [3:0]    rdQosAge_2_1;
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
  wire       [65:0]   _zz_io_axi_aw_payload_addr;
  wire       [36:0]   _zz_io_axi_w_payload_data;
  wire       [65:0]   _zz_io_axi_ar_payload_addr;
  reg        [2:0]    _zz_when_Axi4Crossbar_l500;
  reg        [2:0]    _zz_when_Axi4Crossbar_l500_1;
  reg        [2:0]    _zz_when_Axi4Crossbar_l500_2;
  reg        [1:0]    _zz_7;
  reg        [1:0]    _zz_8;
  reg        [1:0]    _zz_9;
  reg        [1:0]    _zz_when_Axi4Crossbar_l532;
  reg        [1:0]    _zz_when_Axi4Crossbar_l532_1;
  reg        [1:0]    _zz_when_Axi4Crossbar_l532_2;
  reg        [2:0]    _zz_when_Axi4Crossbar_l509;
  reg        [2:0]    _zz_when_Axi4Crossbar_l509_1;
  reg        [2:0]    _zz_when_Axi4Crossbar_l509_2;
  reg        [2:0]    _zz_when_Axi4Crossbar_l615;
  reg        [2:0]    _zz_when_Axi4Crossbar_l615_1;
  reg        [2:0]    _zz_when_Axi4Crossbar_l615_2;
  reg        [1:0]    _zz_when_Axi4Crossbar_l500_3;
  reg        [1:0]    _zz_when_Axi4Crossbar_l500_4;
  reg        [1:0]    _zz_when_Axi4Crossbar_l500_5;
  wire       [3:0]    _zz_when_Axi4Crossbar_l203;
  wire       [3:0]    _zz_when_Axi4Crossbar_l203_1;
  wire       [7:0]    _zz_when_Axi4Crossbar_l203_2;
  wire       [7:0]    _zz_when_Axi4Crossbar_l203_3;
  wire       [3:0]    _zz_when_Axi4Crossbar_l203_4;
  wire       [3:0]    _zz_when_Axi4Crossbar_l203_5;
  wire       [3:0]    _zz_when_Axi4Crossbar_l203_6;
  reg        [1:0]    _zz_when_Axi4Crossbar_l203_7;
  reg        [1:0]    _zz_when_Axi4Crossbar_l203_8;
  wire       [1:0]    _zz_when_Axi4Crossbar_l203_9;
  wire       [1:0]    _zz_when_Axi4Crossbar_l203_10;
  wire       [1:0]    _zz_when_Axi4Crossbar_l203_11;
  wire       [1:0]    _zz_when_Axi4Crossbar_l203_12;
  reg        [0:0]    _zz_io_slaves_0_aw_payload_id;
  wire                when_Axi4Crossbar_l203;
  wire                when_Axi4Crossbar_l203_1;
  wire                when_Axi4Crossbar_l509;
  wire       [0:0]    _zz_when_Axi4Crossbar_l532_3;
  wire                when_Axi4Crossbar_l500;
  wire                when_Axi4Crossbar_l503;
  wire                when_Axi4Crossbar_l503_1;
  wire                io_slaves_0_aw_fire;
  wire                when_Axi4Crossbar_l140;
  wire                when_Axi4Crossbar_l145;
  wire                when_Axi4Crossbar_l142;
  wire                when_Axi4Crossbar_l140_1;
  wire                when_Axi4Crossbar_l145_1;
  wire                when_Axi4Crossbar_l142_1;
  wire                when_Axi4Crossbar_l530;
  wire                when_Axi4Crossbar_l532;
  wire                when_Axi4Crossbar_l532_1;
  wire                when_Axi4Crossbar_l547;
  wire                io_slaves_0_w_fire;
  wire                when_Axi4Crossbar_l553;
  wire                when_Axi4Crossbar_l555;
  wire                io_slaves_0_b_fire;
  wire                when_Axi4Crossbar_l562;
  wire                when_Axi4Crossbar_l564;
  reg        [1:0]    _zz_when_Axi4Crossbar_l500_6;
  reg        [1:0]    _zz_when_Axi4Crossbar_l500_7;
  reg        [1:0]    _zz_when_Axi4Crossbar_l500_8;
  wire       [3:0]    _zz_when_Axi4Crossbar_l203_13;
  wire       [3:0]    _zz_when_Axi4Crossbar_l203_14;
  wire       [7:0]    _zz_when_Axi4Crossbar_l203_15;
  wire       [7:0]    _zz_when_Axi4Crossbar_l203_16;
  wire       [3:0]    _zz_when_Axi4Crossbar_l203_17;
  wire       [3:0]    _zz_when_Axi4Crossbar_l203_18;
  wire       [3:0]    _zz_when_Axi4Crossbar_l203_19;
  reg        [1:0]    _zz_when_Axi4Crossbar_l203_20;
  reg        [1:0]    _zz_when_Axi4Crossbar_l203_21;
  wire       [1:0]    _zz_when_Axi4Crossbar_l203_22;
  wire       [1:0]    _zz_when_Axi4Crossbar_l203_23;
  wire       [1:0]    _zz_when_Axi4Crossbar_l203_24;
  wire       [1:0]    _zz_when_Axi4Crossbar_l203_25;
  reg        [0:0]    _zz_io_slaves_1_aw_payload_id;
  wire                when_Axi4Crossbar_l203_2;
  wire                when_Axi4Crossbar_l203_3;
  wire                when_Axi4Crossbar_l509_1;
  wire       [0:0]    _zz_when_Axi4Crossbar_l532_4;
  wire                when_Axi4Crossbar_l500_1;
  wire                when_Axi4Crossbar_l503_2;
  wire                when_Axi4Crossbar_l503_3;
  wire                io_slaves_1_aw_fire;
  wire                when_Axi4Crossbar_l140_2;
  wire                when_Axi4Crossbar_l145_2;
  wire                when_Axi4Crossbar_l142_2;
  wire                when_Axi4Crossbar_l140_3;
  wire                when_Axi4Crossbar_l145_3;
  wire                when_Axi4Crossbar_l142_3;
  wire                when_Axi4Crossbar_l530_1;
  wire                when_Axi4Crossbar_l532_2;
  wire                when_Axi4Crossbar_l532_3;
  wire                when_Axi4Crossbar_l547_1;
  wire                io_slaves_1_w_fire;
  wire                when_Axi4Crossbar_l553_1;
  wire                when_Axi4Crossbar_l555_1;
  wire                io_slaves_1_b_fire;
  wire                when_Axi4Crossbar_l562_1;
  wire                when_Axi4Crossbar_l564_1;
  reg        [1:0]    _zz_when_Axi4Crossbar_l500_9;
  reg        [1:0]    _zz_when_Axi4Crossbar_l500_10;
  reg        [1:0]    _zz_when_Axi4Crossbar_l500_11;
  wire       [3:0]    _zz_when_Axi4Crossbar_l203_26;
  wire       [3:0]    _zz_when_Axi4Crossbar_l203_27;
  wire       [7:0]    _zz_when_Axi4Crossbar_l203_28;
  wire       [7:0]    _zz_when_Axi4Crossbar_l203_29;
  wire       [3:0]    _zz_when_Axi4Crossbar_l203_30;
  wire       [3:0]    _zz_when_Axi4Crossbar_l203_31;
  wire       [3:0]    _zz_when_Axi4Crossbar_l203_32;
  reg        [1:0]    _zz_when_Axi4Crossbar_l203_33;
  reg        [1:0]    _zz_when_Axi4Crossbar_l203_34;
  wire       [1:0]    _zz_when_Axi4Crossbar_l203_35;
  wire       [1:0]    _zz_when_Axi4Crossbar_l203_36;
  wire       [1:0]    _zz_when_Axi4Crossbar_l203_37;
  wire       [1:0]    _zz_when_Axi4Crossbar_l203_38;
  reg        [0:0]    _zz_wrRrPtr_2;
  wire                when_Axi4Crossbar_l203_4;
  wire                when_Axi4Crossbar_l203_5;
  wire                when_Axi4Crossbar_l509_2;
  wire       [0:0]    _zz_when_Axi4Crossbar_l532_5;
  wire                when_Axi4Crossbar_l500_2;
  wire                when_Axi4Crossbar_l503_4;
  wire                when_Axi4Crossbar_l503_5;
  wire                decErr_io_axi_aw_fire;
  wire                when_Axi4Crossbar_l140_4;
  wire                when_Axi4Crossbar_l145_4;
  wire                when_Axi4Crossbar_l142_4;
  wire                when_Axi4Crossbar_l140_5;
  wire                when_Axi4Crossbar_l145_5;
  wire                when_Axi4Crossbar_l142_5;
  wire                when_Axi4Crossbar_l530_2;
  wire                when_Axi4Crossbar_l532_4;
  wire                when_Axi4Crossbar_l532_5;
  wire                when_Axi4Crossbar_l547_2;
  wire                decErr_io_axi_w_fire;
  wire                when_Axi4Crossbar_l553_2;
  wire                when_Axi4Crossbar_l555_2;
  wire                decErr_io_axi_b_fire;
  wire                when_Axi4Crossbar_l562_2;
  wire                when_Axi4Crossbar_l564_2;
  reg        [2:0]    _zz_when_Axi4Crossbar_l584;
  wire       [2:0]    _zz_when_Axi4Crossbar_l584_1;
  wire       [2:0]    _zz_when_Axi4Crossbar_l584_2;
  wire                when_Axi4Crossbar_l584;
  wire                when_Axi4Crossbar_l584_1;
  wire                when_Axi4Crossbar_l584_2;
  reg        [2:0]    _zz_when_Axi4Crossbar_l584_3;
  wire       [2:0]    _zz_when_Axi4Crossbar_l584_4;
  wire       [2:0]    _zz_when_Axi4Crossbar_l584_5;
  wire                when_Axi4Crossbar_l584_3;
  wire                when_Axi4Crossbar_l584_4;
  wire                when_Axi4Crossbar_l584_5;
  reg        [1:0]    _zz_when_Axi4Crossbar_l615_3;
  reg        [1:0]    _zz_when_Axi4Crossbar_l615_4;
  reg        [1:0]    _zz_when_Axi4Crossbar_l615_5;
  wire       [3:0]    _zz_when_Axi4Crossbar_l203_39;
  wire       [3:0]    _zz_when_Axi4Crossbar_l203_40;
  wire       [7:0]    _zz_when_Axi4Crossbar_l203_41;
  wire       [7:0]    _zz_when_Axi4Crossbar_l203_42;
  wire       [3:0]    _zz_when_Axi4Crossbar_l203_43;
  wire       [3:0]    _zz_when_Axi4Crossbar_l203_44;
  wire       [3:0]    _zz_when_Axi4Crossbar_l203_45;
  reg        [1:0]    _zz_when_Axi4Crossbar_l203_46;
  reg        [1:0]    _zz_when_Axi4Crossbar_l203_47;
  wire       [1:0]    _zz_when_Axi4Crossbar_l203_48;
  wire       [1:0]    _zz_when_Axi4Crossbar_l203_49;
  wire       [1:0]    _zz_when_Axi4Crossbar_l203_50;
  wire       [1:0]    _zz_when_Axi4Crossbar_l203_51;
  reg        [0:0]    _zz_io_slaves_0_ar_payload_id;
  wire                when_Axi4Crossbar_l203_6;
  wire                when_Axi4Crossbar_l203_7;
  wire                when_Axi4Crossbar_l615;
  wire                when_Axi4Crossbar_l618;
  wire                when_Axi4Crossbar_l618_1;
  wire                io_slaves_0_ar_fire;
  wire                when_Axi4Crossbar_l140_6;
  wire                when_Axi4Crossbar_l145_6;
  wire                when_Axi4Crossbar_l142_6;
  wire                when_Axi4Crossbar_l140_7;
  wire                when_Axi4Crossbar_l145_7;
  wire                when_Axi4Crossbar_l142_7;
  wire                _zz_when_Axi4Crossbar_l636;
  wire                io_slaves_0_r_fire;
  wire                when_Axi4Crossbar_l636;
  wire                when_Axi4Crossbar_l638;
  reg        [1:0]    _zz_when_Axi4Crossbar_l615_6;
  reg        [1:0]    _zz_when_Axi4Crossbar_l615_7;
  reg        [1:0]    _zz_when_Axi4Crossbar_l615_8;
  wire       [3:0]    _zz_when_Axi4Crossbar_l203_52;
  wire       [3:0]    _zz_when_Axi4Crossbar_l203_53;
  wire       [7:0]    _zz_when_Axi4Crossbar_l203_54;
  wire       [7:0]    _zz_when_Axi4Crossbar_l203_55;
  wire       [3:0]    _zz_when_Axi4Crossbar_l203_56;
  wire       [3:0]    _zz_when_Axi4Crossbar_l203_57;
  wire       [3:0]    _zz_when_Axi4Crossbar_l203_58;
  reg        [1:0]    _zz_when_Axi4Crossbar_l203_59;
  reg        [1:0]    _zz_when_Axi4Crossbar_l203_60;
  wire       [1:0]    _zz_when_Axi4Crossbar_l203_61;
  wire       [1:0]    _zz_when_Axi4Crossbar_l203_62;
  wire       [1:0]    _zz_when_Axi4Crossbar_l203_63;
  wire       [1:0]    _zz_when_Axi4Crossbar_l203_64;
  reg        [0:0]    _zz_io_slaves_1_ar_payload_id;
  wire                when_Axi4Crossbar_l203_8;
  wire                when_Axi4Crossbar_l203_9;
  wire                when_Axi4Crossbar_l615_1;
  wire                when_Axi4Crossbar_l618_2;
  wire                when_Axi4Crossbar_l618_3;
  wire                io_slaves_1_ar_fire;
  wire                when_Axi4Crossbar_l140_8;
  wire                when_Axi4Crossbar_l145_8;
  wire                when_Axi4Crossbar_l142_8;
  wire                when_Axi4Crossbar_l140_9;
  wire                when_Axi4Crossbar_l145_9;
  wire                when_Axi4Crossbar_l142_9;
  wire                _zz_when_Axi4Crossbar_l636_1;
  wire                io_slaves_1_r_fire;
  wire                when_Axi4Crossbar_l636_1;
  wire                when_Axi4Crossbar_l638_1;
  reg        [1:0]    _zz_when_Axi4Crossbar_l615_9;
  reg        [1:0]    _zz_when_Axi4Crossbar_l615_10;
  reg        [1:0]    _zz_when_Axi4Crossbar_l615_11;
  wire       [3:0]    _zz_when_Axi4Crossbar_l203_65;
  wire       [3:0]    _zz_when_Axi4Crossbar_l203_66;
  wire       [7:0]    _zz_when_Axi4Crossbar_l203_67;
  wire       [7:0]    _zz_when_Axi4Crossbar_l203_68;
  wire       [3:0]    _zz_when_Axi4Crossbar_l203_69;
  wire       [3:0]    _zz_when_Axi4Crossbar_l203_70;
  wire       [3:0]    _zz_when_Axi4Crossbar_l203_71;
  reg        [1:0]    _zz_when_Axi4Crossbar_l203_72;
  reg        [1:0]    _zz_when_Axi4Crossbar_l203_73;
  wire       [1:0]    _zz_when_Axi4Crossbar_l203_74;
  wire       [1:0]    _zz_when_Axi4Crossbar_l203_75;
  wire       [1:0]    _zz_when_Axi4Crossbar_l203_76;
  wire       [1:0]    _zz_when_Axi4Crossbar_l203_77;
  reg        [0:0]    _zz_rdRrPtr_2;
  wire                when_Axi4Crossbar_l203_10;
  wire                when_Axi4Crossbar_l203_11;
  wire                when_Axi4Crossbar_l615_2;
  wire                when_Axi4Crossbar_l618_4;
  wire                when_Axi4Crossbar_l618_5;
  wire                decErr_io_axi_ar_fire;
  wire                when_Axi4Crossbar_l140_10;
  wire                when_Axi4Crossbar_l145_10;
  wire                when_Axi4Crossbar_l142_10;
  wire                when_Axi4Crossbar_l140_11;
  wire                when_Axi4Crossbar_l145_11;
  wire                when_Axi4Crossbar_l142_11;
  wire                _zz_when_Axi4Crossbar_l636_2;
  wire                decErr_io_axi_r_fire;
  wire                when_Axi4Crossbar_l636_2;
  wire                when_Axi4Crossbar_l638_2;
  reg        [2:0]    _zz_when_Axi4Crossbar_l656;
  wire       [2:0]    _zz_when_Axi4Crossbar_l656_1;
  wire       [2:0]    _zz_when_Axi4Crossbar_l656_2;
  wire                when_Axi4Crossbar_l656;
  wire                when_Axi4Crossbar_l656_1;
  wire                when_Axi4Crossbar_l656_2;
  reg        [2:0]    _zz_when_Axi4Crossbar_l656_3;
  wire       [2:0]    _zz_when_Axi4Crossbar_l656_4;
  wire       [2:0]    _zz_when_Axi4Crossbar_l656_5;
  wire                when_Axi4Crossbar_l656_3;
  wire                when_Axi4Crossbar_l656_4;
  wire                when_Axi4Crossbar_l656_5;
  (* ram_style = "distributed" *) reg [0:0] _zz_4 [0:3];
  (* ram_style = "distributed" *) reg [0:0] _zz_5 [0:3];
  (* ram_style = "distributed" *) reg [0:0] _zz_6 [0:3];

  assign _zz__zz_when_Axi4Crossbar_l500_3 = {(! (|_zz_when_Axi4Crossbar_l500_4)),_zz_when_Axi4Crossbar_l500_4};
  assign _zz__zz_when_Axi4Crossbar_l500_3_1 = {(! (|_zz_when_Axi4Crossbar_l500_5)),_zz_when_Axi4Crossbar_l500_5};
  assign _zz__zz_when_Axi4Crossbar_l203_2_1 = s0_axi_awqos;
  assign _zz__zz_when_Axi4Crossbar_l203_2 = {4'd0, _zz__zz_when_Axi4Crossbar_l203_2_1};
  assign _zz__zz_when_Axi4Crossbar_l203_2_2 = {4'd0, wrQosAge_0_0};
  assign _zz__zz_when_Axi4Crossbar_l203 = _zz_when_Axi4Crossbar_l203_2[3:0];
  assign _zz__zz_when_Axi4Crossbar_l203_3_1 = s1_axi_awqos;
  assign _zz__zz_when_Axi4Crossbar_l203_3 = {4'd0, _zz__zz_when_Axi4Crossbar_l203_3_1};
  assign _zz__zz_when_Axi4Crossbar_l203_3_2 = {4'd0, wrQosAge_0_1};
  assign _zz__zz_when_Axi4Crossbar_l203_1 = _zz_when_Axi4Crossbar_l203_3[3:0];
  assign _zz__zz_when_Axi4Crossbar_l203_12 = (_zz_when_Axi4Crossbar_l203_10 - 2'b01);
  assign _zz__zz_when_Axi4Crossbar_l203_12_1 = (_zz_when_Axi4Crossbar_l203_11 - 2'b01);
  assign _zz__zz_7 = (_zz_7 + 2'b01);
  assign _zz__zz_when_Axi4Crossbar_l532 = (_zz_when_Axi4Crossbar_l532 + 2'b01);
  assign _zz__zz_when_Axi4Crossbar_l500_6 = {(! (|_zz_when_Axi4Crossbar_l500_7)),_zz_when_Axi4Crossbar_l500_7};
  assign _zz__zz_when_Axi4Crossbar_l500_6_1 = {(! (|_zz_when_Axi4Crossbar_l500_8)),_zz_when_Axi4Crossbar_l500_8};
  assign _zz__zz_when_Axi4Crossbar_l203_15_1 = s0_axi_awqos;
  assign _zz__zz_when_Axi4Crossbar_l203_15 = {4'd0, _zz__zz_when_Axi4Crossbar_l203_15_1};
  assign _zz__zz_when_Axi4Crossbar_l203_15_2 = {4'd0, wrQosAge_1_0};
  assign _zz__zz_when_Axi4Crossbar_l203_13 = _zz_when_Axi4Crossbar_l203_15[3:0];
  assign _zz__zz_when_Axi4Crossbar_l203_16_1 = s1_axi_awqos;
  assign _zz__zz_when_Axi4Crossbar_l203_16 = {4'd0, _zz__zz_when_Axi4Crossbar_l203_16_1};
  assign _zz__zz_when_Axi4Crossbar_l203_16_2 = {4'd0, wrQosAge_1_1};
  assign _zz__zz_when_Axi4Crossbar_l203_14 = _zz_when_Axi4Crossbar_l203_16[3:0];
  assign _zz__zz_when_Axi4Crossbar_l203_25 = (_zz_when_Axi4Crossbar_l203_23 - 2'b01);
  assign _zz__zz_when_Axi4Crossbar_l203_25_1 = (_zz_when_Axi4Crossbar_l203_24 - 2'b01);
  assign _zz__zz_8 = (_zz_8 + 2'b01);
  assign _zz__zz_when_Axi4Crossbar_l532_1 = (_zz_when_Axi4Crossbar_l532_1 + 2'b01);
  assign _zz__zz_when_Axi4Crossbar_l500_9 = {(! (|_zz_when_Axi4Crossbar_l500_10)),_zz_when_Axi4Crossbar_l500_10};
  assign _zz__zz_when_Axi4Crossbar_l500_9_1 = {(! (|_zz_when_Axi4Crossbar_l500_11)),_zz_when_Axi4Crossbar_l500_11};
  assign _zz__zz_when_Axi4Crossbar_l203_28_1 = s0_axi_awqos;
  assign _zz__zz_when_Axi4Crossbar_l203_28 = {4'd0, _zz__zz_when_Axi4Crossbar_l203_28_1};
  assign _zz__zz_when_Axi4Crossbar_l203_28_2 = {4'd0, wrQosAge_2_0};
  assign _zz__zz_when_Axi4Crossbar_l203_26 = _zz_when_Axi4Crossbar_l203_28[3:0];
  assign _zz__zz_when_Axi4Crossbar_l203_29_1 = s1_axi_awqos;
  assign _zz__zz_when_Axi4Crossbar_l203_29 = {4'd0, _zz__zz_when_Axi4Crossbar_l203_29_1};
  assign _zz__zz_when_Axi4Crossbar_l203_29_2 = {4'd0, wrQosAge_2_1};
  assign _zz__zz_when_Axi4Crossbar_l203_27 = _zz_when_Axi4Crossbar_l203_29[3:0];
  assign _zz__zz_when_Axi4Crossbar_l203_38 = (_zz_when_Axi4Crossbar_l203_36 - 2'b01);
  assign _zz__zz_when_Axi4Crossbar_l203_38_1 = (_zz_when_Axi4Crossbar_l203_37 - 2'b01);
  assign _zz__zz_9 = (_zz_9 + 2'b01);
  assign _zz__zz_when_Axi4Crossbar_l532_2 = (_zz_when_Axi4Crossbar_l532_2 + 2'b01);
  assign _zz__zz_when_Axi4Crossbar_l584 = (m0_axi_bid >>> 3'd4);
  assign _zz__zz_when_Axi4Crossbar_l584_1 = (m1_axi_bid >>> 3'd4);
  assign _zz__zz_when_Axi4Crossbar_l584_2 = (decErr_io_axi_b_payload_id >>> 3'd4);
  assign _zz__zz_when_Axi4Crossbar_l584_2_1 = (_zz_when_Axi4Crossbar_l584_1 - 3'b001);
  assign _zz__zz_when_Axi4Crossbar_l584_3 = (m0_axi_bid >>> 3'd4);
  assign _zz__zz_when_Axi4Crossbar_l584_3_1 = (m1_axi_bid >>> 3'd4);
  assign _zz__zz_when_Axi4Crossbar_l584_3_2 = (decErr_io_axi_b_payload_id >>> 3'd4);
  assign _zz__zz_when_Axi4Crossbar_l584_5 = (_zz_when_Axi4Crossbar_l584_4 - 3'b001);
  assign _zz__zz_when_Axi4Crossbar_l615_3 = {(! (|_zz_when_Axi4Crossbar_l615_4)),_zz_when_Axi4Crossbar_l615_4};
  assign _zz__zz_when_Axi4Crossbar_l615_3_1 = {(! (|_zz_when_Axi4Crossbar_l615_5)),_zz_when_Axi4Crossbar_l615_5};
  assign _zz__zz_when_Axi4Crossbar_l203_41_1 = s0_axi_arqos;
  assign _zz__zz_when_Axi4Crossbar_l203_41 = {4'd0, _zz__zz_when_Axi4Crossbar_l203_41_1};
  assign _zz__zz_when_Axi4Crossbar_l203_41_2 = {4'd0, rdQosAge_0_0};
  assign _zz__zz_when_Axi4Crossbar_l203_39 = _zz_when_Axi4Crossbar_l203_41[3:0];
  assign _zz__zz_when_Axi4Crossbar_l203_42_1 = s1_axi_arqos;
  assign _zz__zz_when_Axi4Crossbar_l203_42 = {4'd0, _zz__zz_when_Axi4Crossbar_l203_42_1};
  assign _zz__zz_when_Axi4Crossbar_l203_42_2 = {4'd0, rdQosAge_0_1};
  assign _zz__zz_when_Axi4Crossbar_l203_40 = _zz_when_Axi4Crossbar_l203_42[3:0];
  assign _zz__zz_when_Axi4Crossbar_l203_51 = (_zz_when_Axi4Crossbar_l203_49 - 2'b01);
  assign _zz__zz_when_Axi4Crossbar_l203_51_1 = (_zz_when_Axi4Crossbar_l203_50 - 2'b01);
  assign _zz__zz_when_Axi4Crossbar_l615_6 = {(! (|_zz_when_Axi4Crossbar_l615_7)),_zz_when_Axi4Crossbar_l615_7};
  assign _zz__zz_when_Axi4Crossbar_l615_6_1 = {(! (|_zz_when_Axi4Crossbar_l615_8)),_zz_when_Axi4Crossbar_l615_8};
  assign _zz__zz_when_Axi4Crossbar_l203_54_1 = s0_axi_arqos;
  assign _zz__zz_when_Axi4Crossbar_l203_54 = {4'd0, _zz__zz_when_Axi4Crossbar_l203_54_1};
  assign _zz__zz_when_Axi4Crossbar_l203_54_2 = {4'd0, rdQosAge_1_0};
  assign _zz__zz_when_Axi4Crossbar_l203_52 = _zz_when_Axi4Crossbar_l203_54[3:0];
  assign _zz__zz_when_Axi4Crossbar_l203_55_1 = s1_axi_arqos;
  assign _zz__zz_when_Axi4Crossbar_l203_55 = {4'd0, _zz__zz_when_Axi4Crossbar_l203_55_1};
  assign _zz__zz_when_Axi4Crossbar_l203_55_2 = {4'd0, rdQosAge_1_1};
  assign _zz__zz_when_Axi4Crossbar_l203_53 = _zz_when_Axi4Crossbar_l203_55[3:0];
  assign _zz__zz_when_Axi4Crossbar_l203_64 = (_zz_when_Axi4Crossbar_l203_62 - 2'b01);
  assign _zz__zz_when_Axi4Crossbar_l203_64_1 = (_zz_when_Axi4Crossbar_l203_63 - 2'b01);
  assign _zz__zz_when_Axi4Crossbar_l615_9 = {(! (|_zz_when_Axi4Crossbar_l615_10)),_zz_when_Axi4Crossbar_l615_10};
  assign _zz__zz_when_Axi4Crossbar_l615_9_1 = {(! (|_zz_when_Axi4Crossbar_l615_11)),_zz_when_Axi4Crossbar_l615_11};
  assign _zz__zz_when_Axi4Crossbar_l203_67_1 = s0_axi_arqos;
  assign _zz__zz_when_Axi4Crossbar_l203_67 = {4'd0, _zz__zz_when_Axi4Crossbar_l203_67_1};
  assign _zz__zz_when_Axi4Crossbar_l203_67_2 = {4'd0, rdQosAge_2_0};
  assign _zz__zz_when_Axi4Crossbar_l203_65 = _zz_when_Axi4Crossbar_l203_67[3:0];
  assign _zz__zz_when_Axi4Crossbar_l203_68_1 = s1_axi_arqos;
  assign _zz__zz_when_Axi4Crossbar_l203_68 = {4'd0, _zz__zz_when_Axi4Crossbar_l203_68_1};
  assign _zz__zz_when_Axi4Crossbar_l203_68_2 = {4'd0, rdQosAge_2_1};
  assign _zz__zz_when_Axi4Crossbar_l203_66 = _zz_when_Axi4Crossbar_l203_68[3:0];
  assign _zz__zz_when_Axi4Crossbar_l203_77 = (_zz_when_Axi4Crossbar_l203_75 - 2'b01);
  assign _zz__zz_when_Axi4Crossbar_l203_77_1 = (_zz_when_Axi4Crossbar_l203_76 - 2'b01);
  assign _zz__zz_when_Axi4Crossbar_l656 = (m0_axi_rid >>> 3'd4);
  assign _zz__zz_when_Axi4Crossbar_l656_1 = (m1_axi_rid >>> 3'd4);
  assign _zz__zz_when_Axi4Crossbar_l656_2 = (decErr_io_axi_r_payload_id >>> 3'd4);
  assign _zz__zz_when_Axi4Crossbar_l656_2_1 = (_zz_when_Axi4Crossbar_l656_1 - 3'b001);
  assign _zz__zz_when_Axi4Crossbar_l656_3 = (m0_axi_rid >>> 3'd4);
  assign _zz__zz_when_Axi4Crossbar_l656_3_1 = (m1_axi_rid >>> 3'd4);
  assign _zz__zz_when_Axi4Crossbar_l656_3_2 = (decErr_io_axi_r_payload_id >>> 3'd4);
  assign _zz__zz_when_Axi4Crossbar_l656_5 = (_zz_when_Axi4Crossbar_l656_4 - 3'b001);
  assign _zz__zz_4_port = _zz_io_slaves_0_aw_payload_id;
  assign _zz__zz_5_port = _zz_io_slaves_1_aw_payload_id;
  assign _zz__zz_6_port = _zz_wrRrPtr_2;
  assign _zz_4_spinal_port0 = _zz_4[_zz_when_Axi4Crossbar_l532];
  always @(posedge aclk) begin
    if(_zz_3) begin
      _zz_4[_zz_7] <= _zz__zz_4_port;
    end
  end

  assign _zz_5_spinal_port0 = _zz_5[_zz_when_Axi4Crossbar_l532_1];
  always @(posedge aclk) begin
    if(_zz_2) begin
      _zz_5[_zz_8] <= _zz__zz_5_port;
    end
  end

  assign _zz_6_spinal_port0 = _zz_6[_zz_when_Axi4Crossbar_l532_2];
  always @(posedge aclk) begin
    if(_zz_1) begin
      _zz_6[_zz_9] <= _zz__zz_6_port;
    end
  end

  Axi4DecErrSlave decErr (
    .io_axi_aw_valid          (decErr_io_axi_aw_valid              ), //i
    .io_axi_aw_ready          (decErr_io_axi_aw_ready              ), //o
    .io_axi_aw_payload_addr   (decErr_io_axi_aw_payload_addr[31:0] ), //i
    .io_axi_aw_payload_id     (decErr_io_axi_aw_payload_id[4:0]    ), //i
    .io_axi_aw_payload_region (decErr_io_axi_aw_payload_region[3:0]), //i
    .io_axi_aw_payload_len    (decErr_io_axi_aw_payload_len[7:0]   ), //i
    .io_axi_aw_payload_size   (decErr_io_axi_aw_payload_size[2:0]  ), //i
    .io_axi_aw_payload_burst  (decErr_io_axi_aw_payload_burst[1:0] ), //i
    .io_axi_aw_payload_lock   (decErr_io_axi_aw_payload_lock       ), //i
    .io_axi_aw_payload_cache  (decErr_io_axi_aw_payload_cache[3:0] ), //i
    .io_axi_aw_payload_qos    (decErr_io_axi_aw_payload_qos[3:0]   ), //i
    .io_axi_aw_payload_prot   (decErr_io_axi_aw_payload_prot[2:0]  ), //i
    .io_axi_w_valid           (decErr_io_axi_w_valid               ), //i
    .io_axi_w_ready           (decErr_io_axi_w_ready               ), //o
    .io_axi_w_payload_data    (decErr_io_axi_w_payload_data[31:0]  ), //i
    .io_axi_w_payload_strb    (decErr_io_axi_w_payload_strb[3:0]   ), //i
    .io_axi_w_payload_last    (decErr_io_axi_w_payload_last        ), //i
    .io_axi_b_valid           (decErr_io_axi_b_valid               ), //o
    .io_axi_b_ready           (decErr_io_axi_b_ready               ), //i
    .io_axi_b_payload_id      (decErr_io_axi_b_payload_id[4:0]     ), //o
    .io_axi_b_payload_resp    (decErr_io_axi_b_payload_resp[1:0]   ), //o
    .io_axi_ar_valid          (decErr_io_axi_ar_valid              ), //i
    .io_axi_ar_ready          (decErr_io_axi_ar_ready              ), //o
    .io_axi_ar_payload_addr   (decErr_io_axi_ar_payload_addr[31:0] ), //i
    .io_axi_ar_payload_id     (decErr_io_axi_ar_payload_id[4:0]    ), //i
    .io_axi_ar_payload_region (decErr_io_axi_ar_payload_region[3:0]), //i
    .io_axi_ar_payload_len    (decErr_io_axi_ar_payload_len[7:0]   ), //i
    .io_axi_ar_payload_size   (decErr_io_axi_ar_payload_size[2:0]  ), //i
    .io_axi_ar_payload_burst  (decErr_io_axi_ar_payload_burst[1:0] ), //i
    .io_axi_ar_payload_lock   (decErr_io_axi_ar_payload_lock       ), //i
    .io_axi_ar_payload_cache  (decErr_io_axi_ar_payload_cache[3:0] ), //i
    .io_axi_ar_payload_qos    (decErr_io_axi_ar_payload_qos[3:0]   ), //i
    .io_axi_ar_payload_prot   (decErr_io_axi_ar_payload_prot[2:0]  ), //i
    .io_axi_r_valid           (decErr_io_axi_r_valid               ), //o
    .io_axi_r_ready           (decErr_io_axi_r_ready               ), //i
    .io_axi_r_payload_data    (decErr_io_axi_r_payload_data[31:0]  ), //o
    .io_axi_r_payload_id      (decErr_io_axi_r_payload_id[4:0]     ), //o
    .io_axi_r_payload_resp    (decErr_io_axi_r_payload_resp[1:0]   ), //o
    .io_axi_r_payload_last    (decErr_io_axi_r_payload_last        ), //o
    .aclk                      (aclk                                 ), //i
    .aresetn                   (aresetn                              )  //i
  );
  always @(*) begin
    _zz_1 = 1'b0;
    if(decErr_io_axi_aw_fire) begin
      _zz_1 = 1'b1;
    end
  end

  always @(*) begin
    _zz_2 = 1'b0;
    if(io_slaves_1_aw_fire) begin
      _zz_2 = 1'b1;
    end
  end

  always @(*) begin
    _zz_3 = 1'b0;
    if(io_slaves_0_aw_fire) begin
      _zz_3 = 1'b1;
    end
  end

  always @(*) begin
    s0_axi_awready = 1'b0;
    if(when_Axi4Crossbar_l500) begin
      if(when_Axi4Crossbar_l503) begin
        s0_axi_awready = m0_axi_awready;
      end
    end
    if(when_Axi4Crossbar_l500_1) begin
      if(when_Axi4Crossbar_l503_2) begin
        s0_axi_awready = m1_axi_awready;
      end
    end
    if(when_Axi4Crossbar_l500_2) begin
      if(when_Axi4Crossbar_l503_4) begin
        s0_axi_awready = decErr_io_axi_aw_ready;
      end
    end
  end

  always @(*) begin
    s0_axi_wready = 1'b0;
    if(when_Axi4Crossbar_l500) begin
      if(when_Axi4Crossbar_l503) begin
        if(when_Axi4Crossbar_l509) begin
          s0_axi_wready = m0_axi_wready;
        end
      end
    end
    if(when_Axi4Crossbar_l530) begin
      if(when_Axi4Crossbar_l532) begin
        s0_axi_wready = m0_axi_wready;
      end
    end
    if(when_Axi4Crossbar_l500_1) begin
      if(when_Axi4Crossbar_l503_2) begin
        if(when_Axi4Crossbar_l509_1) begin
          s0_axi_wready = m1_axi_wready;
        end
      end
    end
    if(when_Axi4Crossbar_l530_1) begin
      if(when_Axi4Crossbar_l532_2) begin
        s0_axi_wready = m1_axi_wready;
      end
    end
    if(when_Axi4Crossbar_l500_2) begin
      if(when_Axi4Crossbar_l503_4) begin
        if(when_Axi4Crossbar_l509_2) begin
          s0_axi_wready = decErr_io_axi_w_ready;
        end
      end
    end
    if(when_Axi4Crossbar_l530_2) begin
      if(when_Axi4Crossbar_l532_4) begin
        s0_axi_wready = decErr_io_axi_w_ready;
      end
    end
  end

  always @(*) begin
    s0_axi_bvalid = 1'b0;
    if(when_Axi4Crossbar_l584) begin
      s0_axi_bvalid = 1'b1;
    end
    if(when_Axi4Crossbar_l584_1) begin
      s0_axi_bvalid = 1'b1;
    end
    if(when_Axi4Crossbar_l584_2) begin
      s0_axi_bvalid = 1'b1;
    end
  end

  assign _zz_io_masters_0_b_payload_id = 6'h0;
  always @(*) begin
    s0_axi_bid = _zz_io_masters_0_b_payload_id[3 : 0];
    if(when_Axi4Crossbar_l584) begin
      s0_axi_bid = m0_axi_bid[3 : 0];
    end
    if(when_Axi4Crossbar_l584_1) begin
      s0_axi_bid = m1_axi_bid[3 : 0];
    end
    if(when_Axi4Crossbar_l584_2) begin
      s0_axi_bid = decErr_io_axi_b_payload_id[3 : 0];
    end
  end

  always @(*) begin
    s0_axi_bresp = _zz_io_masters_0_b_payload_id[5 : 4];
    if(when_Axi4Crossbar_l584) begin
      s0_axi_bresp = m0_axi_bresp;
    end
    if(when_Axi4Crossbar_l584_1) begin
      s0_axi_bresp = m1_axi_bresp;
    end
    if(when_Axi4Crossbar_l584_2) begin
      s0_axi_bresp = decErr_io_axi_b_payload_resp;
    end
  end

  always @(*) begin
    s0_axi_arready = 1'b0;
    if(when_Axi4Crossbar_l615) begin
      if(when_Axi4Crossbar_l618) begin
        s0_axi_arready = m0_axi_arready;
      end
    end
    if(when_Axi4Crossbar_l615_1) begin
      if(when_Axi4Crossbar_l618_2) begin
        s0_axi_arready = m1_axi_arready;
      end
    end
    if(when_Axi4Crossbar_l615_2) begin
      if(when_Axi4Crossbar_l618_4) begin
        s0_axi_arready = decErr_io_axi_ar_ready;
      end
    end
  end

  always @(*) begin
    s0_axi_rvalid = 1'b0;
    if(when_Axi4Crossbar_l656) begin
      s0_axi_rvalid = 1'b1;
    end
    if(when_Axi4Crossbar_l656_1) begin
      s0_axi_rvalid = 1'b1;
    end
    if(when_Axi4Crossbar_l656_2) begin
      s0_axi_rvalid = 1'b1;
    end
  end

  assign _zz_io_masters_0_r_payload_data = 39'h0;
  always @(*) begin
    s0_axi_rdata = _zz_io_masters_0_r_payload_data[31 : 0];
    if(when_Axi4Crossbar_l656) begin
      s0_axi_rdata = m0_axi_rdata;
    end
    if(when_Axi4Crossbar_l656_1) begin
      s0_axi_rdata = m1_axi_rdata;
    end
    if(when_Axi4Crossbar_l656_2) begin
      s0_axi_rdata = decErr_io_axi_r_payload_data;
    end
  end

  always @(*) begin
    s0_axi_rid = _zz_io_masters_0_r_payload_data[35 : 32];
    if(when_Axi4Crossbar_l656) begin
      s0_axi_rid = m0_axi_rid[3 : 0];
    end
    if(when_Axi4Crossbar_l656_1) begin
      s0_axi_rid = m1_axi_rid[3 : 0];
    end
    if(when_Axi4Crossbar_l656_2) begin
      s0_axi_rid = decErr_io_axi_r_payload_id[3 : 0];
    end
  end

  always @(*) begin
    s0_axi_rresp = _zz_io_masters_0_r_payload_data[37 : 36];
    if(when_Axi4Crossbar_l656) begin
      s0_axi_rresp = m0_axi_rresp;
    end
    if(when_Axi4Crossbar_l656_1) begin
      s0_axi_rresp = m1_axi_rresp;
    end
    if(when_Axi4Crossbar_l656_2) begin
      s0_axi_rresp = decErr_io_axi_r_payload_resp;
    end
  end

  always @(*) begin
    s0_axi_rlast = _zz_io_masters_0_r_payload_data[38];
    if(when_Axi4Crossbar_l656) begin
      s0_axi_rlast = m0_axi_rlast;
    end
    if(when_Axi4Crossbar_l656_1) begin
      s0_axi_rlast = m1_axi_rlast;
    end
    if(when_Axi4Crossbar_l656_2) begin
      s0_axi_rlast = decErr_io_axi_r_payload_last;
    end
  end

  always @(*) begin
    s1_axi_awready = 1'b0;
    if(when_Axi4Crossbar_l500) begin
      if(when_Axi4Crossbar_l503_1) begin
        s1_axi_awready = m0_axi_awready;
      end
    end
    if(when_Axi4Crossbar_l500_1) begin
      if(when_Axi4Crossbar_l503_3) begin
        s1_axi_awready = m1_axi_awready;
      end
    end
    if(when_Axi4Crossbar_l500_2) begin
      if(when_Axi4Crossbar_l503_5) begin
        s1_axi_awready = decErr_io_axi_aw_ready;
      end
    end
  end

  always @(*) begin
    s1_axi_wready = 1'b0;
    if(when_Axi4Crossbar_l500) begin
      if(when_Axi4Crossbar_l503_1) begin
        if(when_Axi4Crossbar_l509) begin
          s1_axi_wready = m0_axi_wready;
        end
      end
    end
    if(when_Axi4Crossbar_l530) begin
      if(when_Axi4Crossbar_l532_1) begin
        s1_axi_wready = m0_axi_wready;
      end
    end
    if(when_Axi4Crossbar_l500_1) begin
      if(when_Axi4Crossbar_l503_3) begin
        if(when_Axi4Crossbar_l509_1) begin
          s1_axi_wready = m1_axi_wready;
        end
      end
    end
    if(when_Axi4Crossbar_l530_1) begin
      if(when_Axi4Crossbar_l532_3) begin
        s1_axi_wready = m1_axi_wready;
      end
    end
    if(when_Axi4Crossbar_l500_2) begin
      if(when_Axi4Crossbar_l503_5) begin
        if(when_Axi4Crossbar_l509_2) begin
          s1_axi_wready = decErr_io_axi_w_ready;
        end
      end
    end
    if(when_Axi4Crossbar_l530_2) begin
      if(when_Axi4Crossbar_l532_5) begin
        s1_axi_wready = decErr_io_axi_w_ready;
      end
    end
  end

  always @(*) begin
    s1_axi_bvalid = 1'b0;
    if(when_Axi4Crossbar_l584_3) begin
      s1_axi_bvalid = 1'b1;
    end
    if(when_Axi4Crossbar_l584_4) begin
      s1_axi_bvalid = 1'b1;
    end
    if(when_Axi4Crossbar_l584_5) begin
      s1_axi_bvalid = 1'b1;
    end
  end

  assign _zz_io_masters_1_b_payload_id = 6'h0;
  always @(*) begin
    s1_axi_bid = _zz_io_masters_1_b_payload_id[3 : 0];
    if(when_Axi4Crossbar_l584_3) begin
      s1_axi_bid = m0_axi_bid[3 : 0];
    end
    if(when_Axi4Crossbar_l584_4) begin
      s1_axi_bid = m1_axi_bid[3 : 0];
    end
    if(when_Axi4Crossbar_l584_5) begin
      s1_axi_bid = decErr_io_axi_b_payload_id[3 : 0];
    end
  end

  always @(*) begin
    s1_axi_bresp = _zz_io_masters_1_b_payload_id[5 : 4];
    if(when_Axi4Crossbar_l584_3) begin
      s1_axi_bresp = m0_axi_bresp;
    end
    if(when_Axi4Crossbar_l584_4) begin
      s1_axi_bresp = m1_axi_bresp;
    end
    if(when_Axi4Crossbar_l584_5) begin
      s1_axi_bresp = decErr_io_axi_b_payload_resp;
    end
  end

  always @(*) begin
    s1_axi_arready = 1'b0;
    if(when_Axi4Crossbar_l615) begin
      if(when_Axi4Crossbar_l618_1) begin
        s1_axi_arready = m0_axi_arready;
      end
    end
    if(when_Axi4Crossbar_l615_1) begin
      if(when_Axi4Crossbar_l618_3) begin
        s1_axi_arready = m1_axi_arready;
      end
    end
    if(when_Axi4Crossbar_l615_2) begin
      if(when_Axi4Crossbar_l618_5) begin
        s1_axi_arready = decErr_io_axi_ar_ready;
      end
    end
  end

  always @(*) begin
    s1_axi_rvalid = 1'b0;
    if(when_Axi4Crossbar_l656_3) begin
      s1_axi_rvalid = 1'b1;
    end
    if(when_Axi4Crossbar_l656_4) begin
      s1_axi_rvalid = 1'b1;
    end
    if(when_Axi4Crossbar_l656_5) begin
      s1_axi_rvalid = 1'b1;
    end
  end

  assign _zz_io_masters_1_r_payload_data = 39'h0;
  always @(*) begin
    s1_axi_rdata = _zz_io_masters_1_r_payload_data[31 : 0];
    if(when_Axi4Crossbar_l656_3) begin
      s1_axi_rdata = m0_axi_rdata;
    end
    if(when_Axi4Crossbar_l656_4) begin
      s1_axi_rdata = m1_axi_rdata;
    end
    if(when_Axi4Crossbar_l656_5) begin
      s1_axi_rdata = decErr_io_axi_r_payload_data;
    end
  end

  always @(*) begin
    s1_axi_rid = _zz_io_masters_1_r_payload_data[35 : 32];
    if(when_Axi4Crossbar_l656_3) begin
      s1_axi_rid = m0_axi_rid[3 : 0];
    end
    if(when_Axi4Crossbar_l656_4) begin
      s1_axi_rid = m1_axi_rid[3 : 0];
    end
    if(when_Axi4Crossbar_l656_5) begin
      s1_axi_rid = decErr_io_axi_r_payload_id[3 : 0];
    end
  end

  always @(*) begin
    s1_axi_rresp = _zz_io_masters_1_r_payload_data[37 : 36];
    if(when_Axi4Crossbar_l656_3) begin
      s1_axi_rresp = m0_axi_rresp;
    end
    if(when_Axi4Crossbar_l656_4) begin
      s1_axi_rresp = m1_axi_rresp;
    end
    if(when_Axi4Crossbar_l656_5) begin
      s1_axi_rresp = decErr_io_axi_r_payload_resp;
    end
  end

  always @(*) begin
    s1_axi_rlast = _zz_io_masters_1_r_payload_data[38];
    if(when_Axi4Crossbar_l656_3) begin
      s1_axi_rlast = m0_axi_rlast;
    end
    if(when_Axi4Crossbar_l656_4) begin
      s1_axi_rlast = m1_axi_rlast;
    end
    if(when_Axi4Crossbar_l656_5) begin
      s1_axi_rlast = decErr_io_axi_r_payload_last;
    end
  end

  always @(*) begin
    m0_axi_awvalid = 1'b0;
    if(when_Axi4Crossbar_l500) begin
      m0_axi_awvalid = 1'b1;
    end
  end

  assign _zz_io_slaves_0_aw_payload_addr = 66'h0;
  always @(*) begin
    m0_axi_awaddr = _zz_io_slaves_0_aw_payload_addr[31 : 0];
    if(when_Axi4Crossbar_l500) begin
      if(when_Axi4Crossbar_l503) begin
        m0_axi_awaddr = s0_axi_awaddr;
      end
      if(when_Axi4Crossbar_l503_1) begin
        m0_axi_awaddr = s1_axi_awaddr;
      end
    end
  end

  always @(*) begin
    m0_axi_awid = _zz_io_slaves_0_aw_payload_addr[36 : 32];
    if(when_Axi4Crossbar_l500) begin
      if(when_Axi4Crossbar_l503) begin
        m0_axi_awid = {_zz_io_slaves_0_aw_payload_id,s0_axi_awid};
      end
      if(when_Axi4Crossbar_l503_1) begin
        m0_axi_awid = {_zz_io_slaves_0_aw_payload_id,s1_axi_awid};
      end
    end
  end

  assign m0_axi_awregion = _zz_io_slaves_0_aw_payload_addr[40 : 37];
  always @(*) begin
    m0_axi_awlen = _zz_io_slaves_0_aw_payload_addr[48 : 41];
    if(when_Axi4Crossbar_l500) begin
      if(when_Axi4Crossbar_l503) begin
        m0_axi_awlen = s0_axi_awlen;
      end
      if(when_Axi4Crossbar_l503_1) begin
        m0_axi_awlen = s1_axi_awlen;
      end
    end
  end

  always @(*) begin
    m0_axi_awsize = _zz_io_slaves_0_aw_payload_addr[51 : 49];
    if(when_Axi4Crossbar_l500) begin
      if(when_Axi4Crossbar_l503) begin
        m0_axi_awsize = s0_axi_awsize;
      end
      if(when_Axi4Crossbar_l503_1) begin
        m0_axi_awsize = s1_axi_awsize;
      end
    end
  end

  always @(*) begin
    m0_axi_awburst = _zz_io_slaves_0_aw_payload_addr[53 : 52];
    if(when_Axi4Crossbar_l500) begin
      if(when_Axi4Crossbar_l503) begin
        m0_axi_awburst = s0_axi_awburst;
      end
      if(when_Axi4Crossbar_l503_1) begin
        m0_axi_awburst = s1_axi_awburst;
      end
    end
  end

  always @(*) begin
    m0_axi_awlock = _zz_io_slaves_0_aw_payload_addr[54 : 54];
    if(when_Axi4Crossbar_l500) begin
      if(when_Axi4Crossbar_l503) begin
        m0_axi_awlock = s0_axi_awlock;
      end
      if(when_Axi4Crossbar_l503_1) begin
        m0_axi_awlock = s1_axi_awlock;
      end
    end
  end

  always @(*) begin
    m0_axi_awcache = _zz_io_slaves_0_aw_payload_addr[58 : 55];
    if(when_Axi4Crossbar_l500) begin
      if(when_Axi4Crossbar_l503) begin
        m0_axi_awcache = s0_axi_awcache;
      end
      if(when_Axi4Crossbar_l503_1) begin
        m0_axi_awcache = s1_axi_awcache;
      end
    end
  end

  always @(*) begin
    m0_axi_awqos = _zz_io_slaves_0_aw_payload_addr[62 : 59];
    if(when_Axi4Crossbar_l500) begin
      if(when_Axi4Crossbar_l503) begin
        m0_axi_awqos = s0_axi_awqos;
      end
      if(when_Axi4Crossbar_l503_1) begin
        m0_axi_awqos = s1_axi_awqos;
      end
    end
  end

  always @(*) begin
    m0_axi_awprot = _zz_io_slaves_0_aw_payload_addr[65 : 63];
    if(when_Axi4Crossbar_l500) begin
      if(when_Axi4Crossbar_l503) begin
        m0_axi_awprot = s0_axi_awprot;
      end
      if(when_Axi4Crossbar_l503_1) begin
        m0_axi_awprot = s1_axi_awprot;
      end
    end
  end

  always @(*) begin
    m0_axi_wvalid = 1'b0;
    if(when_Axi4Crossbar_l500) begin
      if(when_Axi4Crossbar_l503) begin
        if(when_Axi4Crossbar_l509) begin
          m0_axi_wvalid = s0_axi_wvalid;
        end
      end
      if(when_Axi4Crossbar_l503_1) begin
        if(when_Axi4Crossbar_l509) begin
          m0_axi_wvalid = s1_axi_wvalid;
        end
      end
    end
    if(when_Axi4Crossbar_l530) begin
      if(when_Axi4Crossbar_l532) begin
        m0_axi_wvalid = s0_axi_wvalid;
      end
      if(when_Axi4Crossbar_l532_1) begin
        m0_axi_wvalid = s1_axi_wvalid;
      end
    end
  end

  assign _zz_io_slaves_0_w_payload_data = 37'h0;
  always @(*) begin
    m0_axi_wdata = _zz_io_slaves_0_w_payload_data[31 : 0];
    if(when_Axi4Crossbar_l500) begin
      if(when_Axi4Crossbar_l503) begin
        if(when_Axi4Crossbar_l509) begin
          m0_axi_wdata = s0_axi_wdata;
        end
      end
      if(when_Axi4Crossbar_l503_1) begin
        if(when_Axi4Crossbar_l509) begin
          m0_axi_wdata = s1_axi_wdata;
        end
      end
    end
    if(when_Axi4Crossbar_l530) begin
      if(when_Axi4Crossbar_l532) begin
        m0_axi_wdata = s0_axi_wdata;
      end
      if(when_Axi4Crossbar_l532_1) begin
        m0_axi_wdata = s1_axi_wdata;
      end
    end
  end

  always @(*) begin
    m0_axi_wstrb = _zz_io_slaves_0_w_payload_data[35 : 32];
    if(when_Axi4Crossbar_l500) begin
      if(when_Axi4Crossbar_l503) begin
        if(when_Axi4Crossbar_l509) begin
          m0_axi_wstrb = s0_axi_wstrb;
        end
      end
      if(when_Axi4Crossbar_l503_1) begin
        if(when_Axi4Crossbar_l509) begin
          m0_axi_wstrb = s1_axi_wstrb;
        end
      end
    end
    if(when_Axi4Crossbar_l530) begin
      if(when_Axi4Crossbar_l532) begin
        m0_axi_wstrb = s0_axi_wstrb;
      end
      if(when_Axi4Crossbar_l532_1) begin
        m0_axi_wstrb = s1_axi_wstrb;
      end
    end
  end

  always @(*) begin
    m0_axi_wlast = _zz_io_slaves_0_w_payload_data[36];
    if(when_Axi4Crossbar_l500) begin
      if(when_Axi4Crossbar_l503) begin
        if(when_Axi4Crossbar_l509) begin
          m0_axi_wlast = s0_axi_wlast;
        end
      end
      if(when_Axi4Crossbar_l503_1) begin
        if(when_Axi4Crossbar_l509) begin
          m0_axi_wlast = s1_axi_wlast;
        end
      end
    end
    if(when_Axi4Crossbar_l530) begin
      if(when_Axi4Crossbar_l532) begin
        m0_axi_wlast = s0_axi_wlast;
      end
      if(when_Axi4Crossbar_l532_1) begin
        m0_axi_wlast = s1_axi_wlast;
      end
    end
  end

  always @(*) begin
    m0_axi_bready = 1'b0;
    if(when_Axi4Crossbar_l584) begin
      m0_axi_bready = s0_axi_bready;
    end
    if(when_Axi4Crossbar_l584_3) begin
      m0_axi_bready = s1_axi_bready;
    end
  end

  always @(*) begin
    m0_axi_arvalid = 1'b0;
    if(when_Axi4Crossbar_l615) begin
      m0_axi_arvalid = 1'b1;
    end
  end

  assign _zz_io_slaves_0_ar_payload_addr = 66'h0;
  always @(*) begin
    m0_axi_araddr = _zz_io_slaves_0_ar_payload_addr[31 : 0];
    if(when_Axi4Crossbar_l615) begin
      if(when_Axi4Crossbar_l618) begin
        m0_axi_araddr = s0_axi_araddr;
      end
      if(when_Axi4Crossbar_l618_1) begin
        m0_axi_araddr = s1_axi_araddr;
      end
    end
  end

  always @(*) begin
    m0_axi_arid = _zz_io_slaves_0_ar_payload_addr[36 : 32];
    if(when_Axi4Crossbar_l615) begin
      if(when_Axi4Crossbar_l618) begin
        m0_axi_arid = {_zz_io_slaves_0_ar_payload_id,s0_axi_arid};
      end
      if(when_Axi4Crossbar_l618_1) begin
        m0_axi_arid = {_zz_io_slaves_0_ar_payload_id,s1_axi_arid};
      end
    end
  end

  assign m0_axi_arregion = _zz_io_slaves_0_ar_payload_addr[40 : 37];
  always @(*) begin
    m0_axi_arlen = _zz_io_slaves_0_ar_payload_addr[48 : 41];
    if(when_Axi4Crossbar_l615) begin
      if(when_Axi4Crossbar_l618) begin
        m0_axi_arlen = s0_axi_arlen;
      end
      if(when_Axi4Crossbar_l618_1) begin
        m0_axi_arlen = s1_axi_arlen;
      end
    end
  end

  always @(*) begin
    m0_axi_arsize = _zz_io_slaves_0_ar_payload_addr[51 : 49];
    if(when_Axi4Crossbar_l615) begin
      if(when_Axi4Crossbar_l618) begin
        m0_axi_arsize = s0_axi_arsize;
      end
      if(when_Axi4Crossbar_l618_1) begin
        m0_axi_arsize = s1_axi_arsize;
      end
    end
  end

  always @(*) begin
    m0_axi_arburst = _zz_io_slaves_0_ar_payload_addr[53 : 52];
    if(when_Axi4Crossbar_l615) begin
      if(when_Axi4Crossbar_l618) begin
        m0_axi_arburst = s0_axi_arburst;
      end
      if(when_Axi4Crossbar_l618_1) begin
        m0_axi_arburst = s1_axi_arburst;
      end
    end
  end

  always @(*) begin
    m0_axi_arlock = _zz_io_slaves_0_ar_payload_addr[54 : 54];
    if(when_Axi4Crossbar_l615) begin
      if(when_Axi4Crossbar_l618) begin
        m0_axi_arlock = s0_axi_arlock;
      end
      if(when_Axi4Crossbar_l618_1) begin
        m0_axi_arlock = s1_axi_arlock;
      end
    end
  end

  always @(*) begin
    m0_axi_arcache = _zz_io_slaves_0_ar_payload_addr[58 : 55];
    if(when_Axi4Crossbar_l615) begin
      if(when_Axi4Crossbar_l618) begin
        m0_axi_arcache = s0_axi_arcache;
      end
      if(when_Axi4Crossbar_l618_1) begin
        m0_axi_arcache = s1_axi_arcache;
      end
    end
  end

  always @(*) begin
    m0_axi_arqos = _zz_io_slaves_0_ar_payload_addr[62 : 59];
    if(when_Axi4Crossbar_l615) begin
      if(when_Axi4Crossbar_l618) begin
        m0_axi_arqos = s0_axi_arqos;
      end
      if(when_Axi4Crossbar_l618_1) begin
        m0_axi_arqos = s1_axi_arqos;
      end
    end
  end

  always @(*) begin
    m0_axi_arprot = _zz_io_slaves_0_ar_payload_addr[65 : 63];
    if(when_Axi4Crossbar_l615) begin
      if(when_Axi4Crossbar_l618) begin
        m0_axi_arprot = s0_axi_arprot;
      end
      if(when_Axi4Crossbar_l618_1) begin
        m0_axi_arprot = s1_axi_arprot;
      end
    end
  end

  always @(*) begin
    m0_axi_rready = 1'b0;
    if(when_Axi4Crossbar_l656) begin
      m0_axi_rready = s0_axi_rready;
    end
    if(when_Axi4Crossbar_l656_3) begin
      m0_axi_rready = s1_axi_rready;
    end
  end

  always @(*) begin
    m1_axi_awvalid = 1'b0;
    if(when_Axi4Crossbar_l500_1) begin
      m1_axi_awvalid = 1'b1;
    end
  end

  assign _zz_io_slaves_1_aw_payload_addr = 66'h0;
  always @(*) begin
    m1_axi_awaddr = _zz_io_slaves_1_aw_payload_addr[31 : 0];
    if(when_Axi4Crossbar_l500_1) begin
      if(when_Axi4Crossbar_l503_2) begin
        m1_axi_awaddr = s0_axi_awaddr;
      end
      if(when_Axi4Crossbar_l503_3) begin
        m1_axi_awaddr = s1_axi_awaddr;
      end
    end
  end

  always @(*) begin
    m1_axi_awid = _zz_io_slaves_1_aw_payload_addr[36 : 32];
    if(when_Axi4Crossbar_l500_1) begin
      if(when_Axi4Crossbar_l503_2) begin
        m1_axi_awid = {_zz_io_slaves_1_aw_payload_id,s0_axi_awid};
      end
      if(when_Axi4Crossbar_l503_3) begin
        m1_axi_awid = {_zz_io_slaves_1_aw_payload_id,s1_axi_awid};
      end
    end
  end

  assign m1_axi_awregion = _zz_io_slaves_1_aw_payload_addr[40 : 37];
  always @(*) begin
    m1_axi_awlen = _zz_io_slaves_1_aw_payload_addr[48 : 41];
    if(when_Axi4Crossbar_l500_1) begin
      if(when_Axi4Crossbar_l503_2) begin
        m1_axi_awlen = s0_axi_awlen;
      end
      if(when_Axi4Crossbar_l503_3) begin
        m1_axi_awlen = s1_axi_awlen;
      end
    end
  end

  always @(*) begin
    m1_axi_awsize = _zz_io_slaves_1_aw_payload_addr[51 : 49];
    if(when_Axi4Crossbar_l500_1) begin
      if(when_Axi4Crossbar_l503_2) begin
        m1_axi_awsize = s0_axi_awsize;
      end
      if(when_Axi4Crossbar_l503_3) begin
        m1_axi_awsize = s1_axi_awsize;
      end
    end
  end

  always @(*) begin
    m1_axi_awburst = _zz_io_slaves_1_aw_payload_addr[53 : 52];
    if(when_Axi4Crossbar_l500_1) begin
      if(when_Axi4Crossbar_l503_2) begin
        m1_axi_awburst = s0_axi_awburst;
      end
      if(when_Axi4Crossbar_l503_3) begin
        m1_axi_awburst = s1_axi_awburst;
      end
    end
  end

  always @(*) begin
    m1_axi_awlock = _zz_io_slaves_1_aw_payload_addr[54 : 54];
    if(when_Axi4Crossbar_l500_1) begin
      if(when_Axi4Crossbar_l503_2) begin
        m1_axi_awlock = s0_axi_awlock;
      end
      if(when_Axi4Crossbar_l503_3) begin
        m1_axi_awlock = s1_axi_awlock;
      end
    end
  end

  always @(*) begin
    m1_axi_awcache = _zz_io_slaves_1_aw_payload_addr[58 : 55];
    if(when_Axi4Crossbar_l500_1) begin
      if(when_Axi4Crossbar_l503_2) begin
        m1_axi_awcache = s0_axi_awcache;
      end
      if(when_Axi4Crossbar_l503_3) begin
        m1_axi_awcache = s1_axi_awcache;
      end
    end
  end

  always @(*) begin
    m1_axi_awqos = _zz_io_slaves_1_aw_payload_addr[62 : 59];
    if(when_Axi4Crossbar_l500_1) begin
      if(when_Axi4Crossbar_l503_2) begin
        m1_axi_awqos = s0_axi_awqos;
      end
      if(when_Axi4Crossbar_l503_3) begin
        m1_axi_awqos = s1_axi_awqos;
      end
    end
  end

  always @(*) begin
    m1_axi_awprot = _zz_io_slaves_1_aw_payload_addr[65 : 63];
    if(when_Axi4Crossbar_l500_1) begin
      if(when_Axi4Crossbar_l503_2) begin
        m1_axi_awprot = s0_axi_awprot;
      end
      if(when_Axi4Crossbar_l503_3) begin
        m1_axi_awprot = s1_axi_awprot;
      end
    end
  end

  always @(*) begin
    m1_axi_wvalid = 1'b0;
    if(when_Axi4Crossbar_l500_1) begin
      if(when_Axi4Crossbar_l503_2) begin
        if(when_Axi4Crossbar_l509_1) begin
          m1_axi_wvalid = s0_axi_wvalid;
        end
      end
      if(when_Axi4Crossbar_l503_3) begin
        if(when_Axi4Crossbar_l509_1) begin
          m1_axi_wvalid = s1_axi_wvalid;
        end
      end
    end
    if(when_Axi4Crossbar_l530_1) begin
      if(when_Axi4Crossbar_l532_2) begin
        m1_axi_wvalid = s0_axi_wvalid;
      end
      if(when_Axi4Crossbar_l532_3) begin
        m1_axi_wvalid = s1_axi_wvalid;
      end
    end
  end

  assign _zz_io_slaves_1_w_payload_data = 37'h0;
  always @(*) begin
    m1_axi_wdata = _zz_io_slaves_1_w_payload_data[31 : 0];
    if(when_Axi4Crossbar_l500_1) begin
      if(when_Axi4Crossbar_l503_2) begin
        if(when_Axi4Crossbar_l509_1) begin
          m1_axi_wdata = s0_axi_wdata;
        end
      end
      if(when_Axi4Crossbar_l503_3) begin
        if(when_Axi4Crossbar_l509_1) begin
          m1_axi_wdata = s1_axi_wdata;
        end
      end
    end
    if(when_Axi4Crossbar_l530_1) begin
      if(when_Axi4Crossbar_l532_2) begin
        m1_axi_wdata = s0_axi_wdata;
      end
      if(when_Axi4Crossbar_l532_3) begin
        m1_axi_wdata = s1_axi_wdata;
      end
    end
  end

  always @(*) begin
    m1_axi_wstrb = _zz_io_slaves_1_w_payload_data[35 : 32];
    if(when_Axi4Crossbar_l500_1) begin
      if(when_Axi4Crossbar_l503_2) begin
        if(when_Axi4Crossbar_l509_1) begin
          m1_axi_wstrb = s0_axi_wstrb;
        end
      end
      if(when_Axi4Crossbar_l503_3) begin
        if(when_Axi4Crossbar_l509_1) begin
          m1_axi_wstrb = s1_axi_wstrb;
        end
      end
    end
    if(when_Axi4Crossbar_l530_1) begin
      if(when_Axi4Crossbar_l532_2) begin
        m1_axi_wstrb = s0_axi_wstrb;
      end
      if(when_Axi4Crossbar_l532_3) begin
        m1_axi_wstrb = s1_axi_wstrb;
      end
    end
  end

  always @(*) begin
    m1_axi_wlast = _zz_io_slaves_1_w_payload_data[36];
    if(when_Axi4Crossbar_l500_1) begin
      if(when_Axi4Crossbar_l503_2) begin
        if(when_Axi4Crossbar_l509_1) begin
          m1_axi_wlast = s0_axi_wlast;
        end
      end
      if(when_Axi4Crossbar_l503_3) begin
        if(when_Axi4Crossbar_l509_1) begin
          m1_axi_wlast = s1_axi_wlast;
        end
      end
    end
    if(when_Axi4Crossbar_l530_1) begin
      if(when_Axi4Crossbar_l532_2) begin
        m1_axi_wlast = s0_axi_wlast;
      end
      if(when_Axi4Crossbar_l532_3) begin
        m1_axi_wlast = s1_axi_wlast;
      end
    end
  end

  always @(*) begin
    m1_axi_bready = 1'b0;
    if(when_Axi4Crossbar_l584_1) begin
      m1_axi_bready = s0_axi_bready;
    end
    if(when_Axi4Crossbar_l584_4) begin
      m1_axi_bready = s1_axi_bready;
    end
  end

  always @(*) begin
    m1_axi_arvalid = 1'b0;
    if(when_Axi4Crossbar_l615_1) begin
      m1_axi_arvalid = 1'b1;
    end
  end

  assign _zz_io_slaves_1_ar_payload_addr = 66'h0;
  always @(*) begin
    m1_axi_araddr = _zz_io_slaves_1_ar_payload_addr[31 : 0];
    if(when_Axi4Crossbar_l615_1) begin
      if(when_Axi4Crossbar_l618_2) begin
        m1_axi_araddr = s0_axi_araddr;
      end
      if(when_Axi4Crossbar_l618_3) begin
        m1_axi_araddr = s1_axi_araddr;
      end
    end
  end

  always @(*) begin
    m1_axi_arid = _zz_io_slaves_1_ar_payload_addr[36 : 32];
    if(when_Axi4Crossbar_l615_1) begin
      if(when_Axi4Crossbar_l618_2) begin
        m1_axi_arid = {_zz_io_slaves_1_ar_payload_id,s0_axi_arid};
      end
      if(when_Axi4Crossbar_l618_3) begin
        m1_axi_arid = {_zz_io_slaves_1_ar_payload_id,s1_axi_arid};
      end
    end
  end

  assign m1_axi_arregion = _zz_io_slaves_1_ar_payload_addr[40 : 37];
  always @(*) begin
    m1_axi_arlen = _zz_io_slaves_1_ar_payload_addr[48 : 41];
    if(when_Axi4Crossbar_l615_1) begin
      if(when_Axi4Crossbar_l618_2) begin
        m1_axi_arlen = s0_axi_arlen;
      end
      if(when_Axi4Crossbar_l618_3) begin
        m1_axi_arlen = s1_axi_arlen;
      end
    end
  end

  always @(*) begin
    m1_axi_arsize = _zz_io_slaves_1_ar_payload_addr[51 : 49];
    if(when_Axi4Crossbar_l615_1) begin
      if(when_Axi4Crossbar_l618_2) begin
        m1_axi_arsize = s0_axi_arsize;
      end
      if(when_Axi4Crossbar_l618_3) begin
        m1_axi_arsize = s1_axi_arsize;
      end
    end
  end

  always @(*) begin
    m1_axi_arburst = _zz_io_slaves_1_ar_payload_addr[53 : 52];
    if(when_Axi4Crossbar_l615_1) begin
      if(when_Axi4Crossbar_l618_2) begin
        m1_axi_arburst = s0_axi_arburst;
      end
      if(when_Axi4Crossbar_l618_3) begin
        m1_axi_arburst = s1_axi_arburst;
      end
    end
  end

  always @(*) begin
    m1_axi_arlock = _zz_io_slaves_1_ar_payload_addr[54 : 54];
    if(when_Axi4Crossbar_l615_1) begin
      if(when_Axi4Crossbar_l618_2) begin
        m1_axi_arlock = s0_axi_arlock;
      end
      if(when_Axi4Crossbar_l618_3) begin
        m1_axi_arlock = s1_axi_arlock;
      end
    end
  end

  always @(*) begin
    m1_axi_arcache = _zz_io_slaves_1_ar_payload_addr[58 : 55];
    if(when_Axi4Crossbar_l615_1) begin
      if(when_Axi4Crossbar_l618_2) begin
        m1_axi_arcache = s0_axi_arcache;
      end
      if(when_Axi4Crossbar_l618_3) begin
        m1_axi_arcache = s1_axi_arcache;
      end
    end
  end

  always @(*) begin
    m1_axi_arqos = _zz_io_slaves_1_ar_payload_addr[62 : 59];
    if(when_Axi4Crossbar_l615_1) begin
      if(when_Axi4Crossbar_l618_2) begin
        m1_axi_arqos = s0_axi_arqos;
      end
      if(when_Axi4Crossbar_l618_3) begin
        m1_axi_arqos = s1_axi_arqos;
      end
    end
  end

  always @(*) begin
    m1_axi_arprot = _zz_io_slaves_1_ar_payload_addr[65 : 63];
    if(when_Axi4Crossbar_l615_1) begin
      if(when_Axi4Crossbar_l618_2) begin
        m1_axi_arprot = s0_axi_arprot;
      end
      if(when_Axi4Crossbar_l618_3) begin
        m1_axi_arprot = s1_axi_arprot;
      end
    end
  end

  always @(*) begin
    m1_axi_rready = 1'b0;
    if(when_Axi4Crossbar_l656_1) begin
      m1_axi_rready = s0_axi_rready;
    end
    if(when_Axi4Crossbar_l656_4) begin
      m1_axi_rready = s1_axi_rready;
    end
  end

  always @(*) begin
    decErr_io_axi_aw_valid = 1'b0;
    if(when_Axi4Crossbar_l500_2) begin
      decErr_io_axi_aw_valid = 1'b1;
    end
  end

  assign _zz_io_axi_aw_payload_addr = 66'h0;
  always @(*) begin
    decErr_io_axi_aw_payload_addr = _zz_io_axi_aw_payload_addr[31 : 0];
    if(when_Axi4Crossbar_l500_2) begin
      if(when_Axi4Crossbar_l503_4) begin
        decErr_io_axi_aw_payload_addr = s0_axi_awaddr;
      end
      if(when_Axi4Crossbar_l503_5) begin
        decErr_io_axi_aw_payload_addr = s1_axi_awaddr;
      end
    end
  end

  always @(*) begin
    decErr_io_axi_aw_payload_id = _zz_io_axi_aw_payload_addr[36 : 32];
    if(when_Axi4Crossbar_l500_2) begin
      if(when_Axi4Crossbar_l503_4) begin
        decErr_io_axi_aw_payload_id = {_zz_wrRrPtr_2,s0_axi_awid};
      end
      if(when_Axi4Crossbar_l503_5) begin
        decErr_io_axi_aw_payload_id = {_zz_wrRrPtr_2,s1_axi_awid};
      end
    end
  end

  assign decErr_io_axi_aw_payload_region = _zz_io_axi_aw_payload_addr[40 : 37];
  always @(*) begin
    decErr_io_axi_aw_payload_len = _zz_io_axi_aw_payload_addr[48 : 41];
    if(when_Axi4Crossbar_l500_2) begin
      if(when_Axi4Crossbar_l503_4) begin
        decErr_io_axi_aw_payload_len = s0_axi_awlen;
      end
      if(when_Axi4Crossbar_l503_5) begin
        decErr_io_axi_aw_payload_len = s1_axi_awlen;
      end
    end
  end

  always @(*) begin
    decErr_io_axi_aw_payload_size = _zz_io_axi_aw_payload_addr[51 : 49];
    if(when_Axi4Crossbar_l500_2) begin
      if(when_Axi4Crossbar_l503_4) begin
        decErr_io_axi_aw_payload_size = s0_axi_awsize;
      end
      if(when_Axi4Crossbar_l503_5) begin
        decErr_io_axi_aw_payload_size = s1_axi_awsize;
      end
    end
  end

  always @(*) begin
    decErr_io_axi_aw_payload_burst = _zz_io_axi_aw_payload_addr[53 : 52];
    if(when_Axi4Crossbar_l500_2) begin
      if(when_Axi4Crossbar_l503_4) begin
        decErr_io_axi_aw_payload_burst = s0_axi_awburst;
      end
      if(when_Axi4Crossbar_l503_5) begin
        decErr_io_axi_aw_payload_burst = s1_axi_awburst;
      end
    end
  end

  always @(*) begin
    decErr_io_axi_aw_payload_lock = _zz_io_axi_aw_payload_addr[54 : 54];
    if(when_Axi4Crossbar_l500_2) begin
      if(when_Axi4Crossbar_l503_4) begin
        decErr_io_axi_aw_payload_lock = s0_axi_awlock;
      end
      if(when_Axi4Crossbar_l503_5) begin
        decErr_io_axi_aw_payload_lock = s1_axi_awlock;
      end
    end
  end

  always @(*) begin
    decErr_io_axi_aw_payload_cache = _zz_io_axi_aw_payload_addr[58 : 55];
    if(when_Axi4Crossbar_l500_2) begin
      if(when_Axi4Crossbar_l503_4) begin
        decErr_io_axi_aw_payload_cache = s0_axi_awcache;
      end
      if(when_Axi4Crossbar_l503_5) begin
        decErr_io_axi_aw_payload_cache = s1_axi_awcache;
      end
    end
  end

  always @(*) begin
    decErr_io_axi_aw_payload_qos = _zz_io_axi_aw_payload_addr[62 : 59];
    if(when_Axi4Crossbar_l500_2) begin
      if(when_Axi4Crossbar_l503_4) begin
        decErr_io_axi_aw_payload_qos = s0_axi_awqos;
      end
      if(when_Axi4Crossbar_l503_5) begin
        decErr_io_axi_aw_payload_qos = s1_axi_awqos;
      end
    end
  end

  always @(*) begin
    decErr_io_axi_aw_payload_prot = _zz_io_axi_aw_payload_addr[65 : 63];
    if(when_Axi4Crossbar_l500_2) begin
      if(when_Axi4Crossbar_l503_4) begin
        decErr_io_axi_aw_payload_prot = s0_axi_awprot;
      end
      if(when_Axi4Crossbar_l503_5) begin
        decErr_io_axi_aw_payload_prot = s1_axi_awprot;
      end
    end
  end

  always @(*) begin
    decErr_io_axi_w_valid = 1'b0;
    if(when_Axi4Crossbar_l500_2) begin
      if(when_Axi4Crossbar_l503_4) begin
        if(when_Axi4Crossbar_l509_2) begin
          decErr_io_axi_w_valid = s0_axi_wvalid;
        end
      end
      if(when_Axi4Crossbar_l503_5) begin
        if(when_Axi4Crossbar_l509_2) begin
          decErr_io_axi_w_valid = s1_axi_wvalid;
        end
      end
    end
    if(when_Axi4Crossbar_l530_2) begin
      if(when_Axi4Crossbar_l532_4) begin
        decErr_io_axi_w_valid = s0_axi_wvalid;
      end
      if(when_Axi4Crossbar_l532_5) begin
        decErr_io_axi_w_valid = s1_axi_wvalid;
      end
    end
  end

  assign _zz_io_axi_w_payload_data = 37'h0;
  always @(*) begin
    decErr_io_axi_w_payload_data = _zz_io_axi_w_payload_data[31 : 0];
    if(when_Axi4Crossbar_l500_2) begin
      if(when_Axi4Crossbar_l503_4) begin
        if(when_Axi4Crossbar_l509_2) begin
          decErr_io_axi_w_payload_data = s0_axi_wdata;
        end
      end
      if(when_Axi4Crossbar_l503_5) begin
        if(when_Axi4Crossbar_l509_2) begin
          decErr_io_axi_w_payload_data = s1_axi_wdata;
        end
      end
    end
    if(when_Axi4Crossbar_l530_2) begin
      if(when_Axi4Crossbar_l532_4) begin
        decErr_io_axi_w_payload_data = s0_axi_wdata;
      end
      if(when_Axi4Crossbar_l532_5) begin
        decErr_io_axi_w_payload_data = s1_axi_wdata;
      end
    end
  end

  always @(*) begin
    decErr_io_axi_w_payload_strb = _zz_io_axi_w_payload_data[35 : 32];
    if(when_Axi4Crossbar_l500_2) begin
      if(when_Axi4Crossbar_l503_4) begin
        if(when_Axi4Crossbar_l509_2) begin
          decErr_io_axi_w_payload_strb = s0_axi_wstrb;
        end
      end
      if(when_Axi4Crossbar_l503_5) begin
        if(when_Axi4Crossbar_l509_2) begin
          decErr_io_axi_w_payload_strb = s1_axi_wstrb;
        end
      end
    end
    if(when_Axi4Crossbar_l530_2) begin
      if(when_Axi4Crossbar_l532_4) begin
        decErr_io_axi_w_payload_strb = s0_axi_wstrb;
      end
      if(when_Axi4Crossbar_l532_5) begin
        decErr_io_axi_w_payload_strb = s1_axi_wstrb;
      end
    end
  end

  always @(*) begin
    decErr_io_axi_w_payload_last = _zz_io_axi_w_payload_data[36];
    if(when_Axi4Crossbar_l500_2) begin
      if(when_Axi4Crossbar_l503_4) begin
        if(when_Axi4Crossbar_l509_2) begin
          decErr_io_axi_w_payload_last = s0_axi_wlast;
        end
      end
      if(when_Axi4Crossbar_l503_5) begin
        if(when_Axi4Crossbar_l509_2) begin
          decErr_io_axi_w_payload_last = s1_axi_wlast;
        end
      end
    end
    if(when_Axi4Crossbar_l530_2) begin
      if(when_Axi4Crossbar_l532_4) begin
        decErr_io_axi_w_payload_last = s0_axi_wlast;
      end
      if(when_Axi4Crossbar_l532_5) begin
        decErr_io_axi_w_payload_last = s1_axi_wlast;
      end
    end
  end

  always @(*) begin
    decErr_io_axi_b_ready = 1'b0;
    if(when_Axi4Crossbar_l584_2) begin
      decErr_io_axi_b_ready = s0_axi_bready;
    end
    if(when_Axi4Crossbar_l584_5) begin
      decErr_io_axi_b_ready = s1_axi_bready;
    end
  end

  always @(*) begin
    decErr_io_axi_ar_valid = 1'b0;
    if(when_Axi4Crossbar_l615_2) begin
      decErr_io_axi_ar_valid = 1'b1;
    end
  end

  assign _zz_io_axi_ar_payload_addr = 66'h0;
  always @(*) begin
    decErr_io_axi_ar_payload_addr = _zz_io_axi_ar_payload_addr[31 : 0];
    if(when_Axi4Crossbar_l615_2) begin
      if(when_Axi4Crossbar_l618_4) begin
        decErr_io_axi_ar_payload_addr = s0_axi_araddr;
      end
      if(when_Axi4Crossbar_l618_5) begin
        decErr_io_axi_ar_payload_addr = s1_axi_araddr;
      end
    end
  end

  always @(*) begin
    decErr_io_axi_ar_payload_id = _zz_io_axi_ar_payload_addr[36 : 32];
    if(when_Axi4Crossbar_l615_2) begin
      if(when_Axi4Crossbar_l618_4) begin
        decErr_io_axi_ar_payload_id = {_zz_rdRrPtr_2,s0_axi_arid};
      end
      if(when_Axi4Crossbar_l618_5) begin
        decErr_io_axi_ar_payload_id = {_zz_rdRrPtr_2,s1_axi_arid};
      end
    end
  end

  assign decErr_io_axi_ar_payload_region = _zz_io_axi_ar_payload_addr[40 : 37];
  always @(*) begin
    decErr_io_axi_ar_payload_len = _zz_io_axi_ar_payload_addr[48 : 41];
    if(when_Axi4Crossbar_l615_2) begin
      if(when_Axi4Crossbar_l618_4) begin
        decErr_io_axi_ar_payload_len = s0_axi_arlen;
      end
      if(when_Axi4Crossbar_l618_5) begin
        decErr_io_axi_ar_payload_len = s1_axi_arlen;
      end
    end
  end

  always @(*) begin
    decErr_io_axi_ar_payload_size = _zz_io_axi_ar_payload_addr[51 : 49];
    if(when_Axi4Crossbar_l615_2) begin
      if(when_Axi4Crossbar_l618_4) begin
        decErr_io_axi_ar_payload_size = s0_axi_arsize;
      end
      if(when_Axi4Crossbar_l618_5) begin
        decErr_io_axi_ar_payload_size = s1_axi_arsize;
      end
    end
  end

  always @(*) begin
    decErr_io_axi_ar_payload_burst = _zz_io_axi_ar_payload_addr[53 : 52];
    if(when_Axi4Crossbar_l615_2) begin
      if(when_Axi4Crossbar_l618_4) begin
        decErr_io_axi_ar_payload_burst = s0_axi_arburst;
      end
      if(when_Axi4Crossbar_l618_5) begin
        decErr_io_axi_ar_payload_burst = s1_axi_arburst;
      end
    end
  end

  always @(*) begin
    decErr_io_axi_ar_payload_lock = _zz_io_axi_ar_payload_addr[54 : 54];
    if(when_Axi4Crossbar_l615_2) begin
      if(when_Axi4Crossbar_l618_4) begin
        decErr_io_axi_ar_payload_lock = s0_axi_arlock;
      end
      if(when_Axi4Crossbar_l618_5) begin
        decErr_io_axi_ar_payload_lock = s1_axi_arlock;
      end
    end
  end

  always @(*) begin
    decErr_io_axi_ar_payload_cache = _zz_io_axi_ar_payload_addr[58 : 55];
    if(when_Axi4Crossbar_l615_2) begin
      if(when_Axi4Crossbar_l618_4) begin
        decErr_io_axi_ar_payload_cache = s0_axi_arcache;
      end
      if(when_Axi4Crossbar_l618_5) begin
        decErr_io_axi_ar_payload_cache = s1_axi_arcache;
      end
    end
  end

  always @(*) begin
    decErr_io_axi_ar_payload_qos = _zz_io_axi_ar_payload_addr[62 : 59];
    if(when_Axi4Crossbar_l615_2) begin
      if(when_Axi4Crossbar_l618_4) begin
        decErr_io_axi_ar_payload_qos = s0_axi_arqos;
      end
      if(when_Axi4Crossbar_l618_5) begin
        decErr_io_axi_ar_payload_qos = s1_axi_arqos;
      end
    end
  end

  always @(*) begin
    decErr_io_axi_ar_payload_prot = _zz_io_axi_ar_payload_addr[65 : 63];
    if(when_Axi4Crossbar_l615_2) begin
      if(when_Axi4Crossbar_l618_4) begin
        decErr_io_axi_ar_payload_prot = s0_axi_arprot;
      end
      if(when_Axi4Crossbar_l618_5) begin
        decErr_io_axi_ar_payload_prot = s1_axi_arprot;
      end
    end
  end

  always @(*) begin
    decErr_io_axi_r_ready = 1'b0;
    if(when_Axi4Crossbar_l656_2) begin
      decErr_io_axi_r_ready = s0_axi_rready;
    end
    if(when_Axi4Crossbar_l656_5) begin
      decErr_io_axi_r_ready = s1_axi_rready;
    end
  end

  always @(*) begin
    _zz_when_Axi4Crossbar_l500_4[0] = ((32'h0 <= s0_axi_awaddr) && (s0_axi_awaddr < 32'h00010000));
    _zz_when_Axi4Crossbar_l500_4[1] = ((32'h00010000 <= s0_axi_awaddr) && (s0_axi_awaddr < 32'h00020000));
  end

  always @(*) begin
    _zz_when_Axi4Crossbar_l500_3[0] = (s0_axi_awvalid && _zz__zz_when_Axi4Crossbar_l500_3[0]);
    _zz_when_Axi4Crossbar_l500_3[1] = (s1_axi_awvalid && _zz__zz_when_Axi4Crossbar_l500_3_1[0]);
  end

  always @(*) begin
    _zz_when_Axi4Crossbar_l500_5[0] = ((32'h0 <= s1_axi_awaddr) && (s1_axi_awaddr < 32'h00010000));
    _zz_when_Axi4Crossbar_l500_5[1] = ((32'h00010000 <= s1_axi_awaddr) && (s1_axi_awaddr < 32'h00020000));
  end

  assign _zz_when_Axi4Crossbar_l203_2 = (_zz__zz_when_Axi4Crossbar_l203_2 + _zz__zz_when_Axi4Crossbar_l203_2_2);
  assign _zz_when_Axi4Crossbar_l203 = ((8'h0f < _zz_when_Axi4Crossbar_l203_2) ? 4'b1111 : _zz__zz_when_Axi4Crossbar_l203);
  assign _zz_when_Axi4Crossbar_l203_3 = (_zz__zz_when_Axi4Crossbar_l203_3 + _zz__zz_when_Axi4Crossbar_l203_3_2);
  assign _zz_when_Axi4Crossbar_l203_1 = ((8'h0f < _zz_when_Axi4Crossbar_l203_3) ? 4'b1111 : _zz__zz_when_Axi4Crossbar_l203_1);
  assign _zz_when_Axi4Crossbar_l203_4 = (_zz_when_Axi4Crossbar_l500_3[0] ? _zz_when_Axi4Crossbar_l203 : 4'b0000);
  assign _zz_when_Axi4Crossbar_l203_5 = (_zz_when_Axi4Crossbar_l500_3[1] ? _zz_when_Axi4Crossbar_l203_1 : 4'b0000);
  assign _zz_when_Axi4Crossbar_l203_6 = ((_zz_when_Axi4Crossbar_l203_5 < _zz_when_Axi4Crossbar_l203_4) ? _zz_when_Axi4Crossbar_l203_4 : _zz_when_Axi4Crossbar_l203_5);
  always @(*) begin
    _zz_when_Axi4Crossbar_l203_7[0] = (_zz_when_Axi4Crossbar_l500_3[0] && (_zz_when_Axi4Crossbar_l203 == _zz_when_Axi4Crossbar_l203_6));
    _zz_when_Axi4Crossbar_l203_7[1] = (_zz_when_Axi4Crossbar_l500_3[1] && (_zz_when_Axi4Crossbar_l203_1 == _zz_when_Axi4Crossbar_l203_6));
  end

  always @(*) begin
    _zz_when_Axi4Crossbar_l203_8[0] = (wrRrPtr_0 <= 1'b0);
    _zz_when_Axi4Crossbar_l203_8[1] = (wrRrPtr_0 <= 1'b1);
  end

  assign _zz_when_Axi4Crossbar_l203_9 = (_zz_when_Axi4Crossbar_l203_7 & _zz_when_Axi4Crossbar_l203_8);
  assign _zz_when_Axi4Crossbar_l203_10 = _zz_when_Axi4Crossbar_l203_9;
  assign _zz_when_Axi4Crossbar_l203_11 = _zz_when_Axi4Crossbar_l203_7;
  assign _zz_when_Axi4Crossbar_l203_12 = ((|_zz_when_Axi4Crossbar_l203_9) ? (_zz_when_Axi4Crossbar_l203_10 & (~ _zz__zz_when_Axi4Crossbar_l203_12)) : (_zz_when_Axi4Crossbar_l203_11 & (~ _zz__zz_when_Axi4Crossbar_l203_12_1)));
  always @(*) begin
    _zz_io_slaves_0_aw_payload_id = 1'b0;
    if(when_Axi4Crossbar_l203) begin
      _zz_io_slaves_0_aw_payload_id = 1'b0;
    end
    if(when_Axi4Crossbar_l203_1) begin
      _zz_io_slaves_0_aw_payload_id = 1'b1;
    end
  end

  assign when_Axi4Crossbar_l203 = _zz_when_Axi4Crossbar_l203_12[0];
  assign when_Axi4Crossbar_l203_1 = _zz_when_Axi4Crossbar_l203_12[1];
  assign when_Axi4Crossbar_l509 = (_zz_when_Axi4Crossbar_l509 == 3'b000);
  assign _zz_when_Axi4Crossbar_l532_3 = _zz_4_spinal_port0;
  assign when_Axi4Crossbar_l500 = ((_zz_when_Axi4Crossbar_l500 < 3'b100) && (|_zz_when_Axi4Crossbar_l500_3));
  assign when_Axi4Crossbar_l503 = (_zz_io_slaves_0_aw_payload_id == 1'b0);
  assign when_Axi4Crossbar_l503_1 = (_zz_io_slaves_0_aw_payload_id == 1'b1);
  assign io_slaves_0_aw_fire = (m0_axi_awvalid && m0_axi_awready);
  assign when_Axi4Crossbar_l140 = (! _zz_when_Axi4Crossbar_l500_3[0]);
  assign when_Axi4Crossbar_l145 = (wrQosAge_0_0 != 4'b1111);
  assign when_Axi4Crossbar_l142 = (io_slaves_0_aw_fire && (_zz_io_slaves_0_aw_payload_id == 1'b0));
  assign when_Axi4Crossbar_l140_1 = (! _zz_when_Axi4Crossbar_l500_3[1]);
  assign when_Axi4Crossbar_l145_1 = (wrQosAge_0_1 != 4'b1111);
  assign when_Axi4Crossbar_l142_1 = (io_slaves_0_aw_fire && (_zz_io_slaves_0_aw_payload_id == 1'b1));
  assign when_Axi4Crossbar_l530 = (! when_Axi4Crossbar_l509);
  assign when_Axi4Crossbar_l532 = (_zz_when_Axi4Crossbar_l532_3 == 1'b0);
  assign when_Axi4Crossbar_l532_1 = (_zz_when_Axi4Crossbar_l532_3 == 1'b1);
  assign io_slaves_0_w_fire = (m0_axi_wvalid && m0_axi_wready);
  assign when_Axi4Crossbar_l547 = (io_slaves_0_w_fire && m0_axi_wlast);
  assign when_Axi4Crossbar_l553 = (io_slaves_0_aw_fire && (! when_Axi4Crossbar_l547));
  assign when_Axi4Crossbar_l555 = ((! io_slaves_0_aw_fire) && when_Axi4Crossbar_l547);
  assign io_slaves_0_b_fire = (m0_axi_bvalid && m0_axi_bready);
  assign when_Axi4Crossbar_l562 = (io_slaves_0_aw_fire && (! io_slaves_0_b_fire));
  assign when_Axi4Crossbar_l564 = ((! io_slaves_0_aw_fire) && io_slaves_0_b_fire);
  always @(*) begin
    _zz_when_Axi4Crossbar_l500_7[0] = ((32'h0 <= s0_axi_awaddr) && (s0_axi_awaddr < 32'h00010000));
    _zz_when_Axi4Crossbar_l500_7[1] = ((32'h00010000 <= s0_axi_awaddr) && (s0_axi_awaddr < 32'h00020000));
  end

  always @(*) begin
    _zz_when_Axi4Crossbar_l500_6[0] = (s0_axi_awvalid && _zz__zz_when_Axi4Crossbar_l500_6[1]);
    _zz_when_Axi4Crossbar_l500_6[1] = (s1_axi_awvalid && _zz__zz_when_Axi4Crossbar_l500_6_1[1]);
  end

  always @(*) begin
    _zz_when_Axi4Crossbar_l500_8[0] = ((32'h0 <= s1_axi_awaddr) && (s1_axi_awaddr < 32'h00010000));
    _zz_when_Axi4Crossbar_l500_8[1] = ((32'h00010000 <= s1_axi_awaddr) && (s1_axi_awaddr < 32'h00020000));
  end

  assign _zz_when_Axi4Crossbar_l203_15 = (_zz__zz_when_Axi4Crossbar_l203_15 + _zz__zz_when_Axi4Crossbar_l203_15_2);
  assign _zz_when_Axi4Crossbar_l203_13 = ((8'h0f < _zz_when_Axi4Crossbar_l203_15) ? 4'b1111 : _zz__zz_when_Axi4Crossbar_l203_13);
  assign _zz_when_Axi4Crossbar_l203_16 = (_zz__zz_when_Axi4Crossbar_l203_16 + _zz__zz_when_Axi4Crossbar_l203_16_2);
  assign _zz_when_Axi4Crossbar_l203_14 = ((8'h0f < _zz_when_Axi4Crossbar_l203_16) ? 4'b1111 : _zz__zz_when_Axi4Crossbar_l203_14);
  assign _zz_when_Axi4Crossbar_l203_17 = (_zz_when_Axi4Crossbar_l500_6[0] ? _zz_when_Axi4Crossbar_l203_13 : 4'b0000);
  assign _zz_when_Axi4Crossbar_l203_18 = (_zz_when_Axi4Crossbar_l500_6[1] ? _zz_when_Axi4Crossbar_l203_14 : 4'b0000);
  assign _zz_when_Axi4Crossbar_l203_19 = ((_zz_when_Axi4Crossbar_l203_18 < _zz_when_Axi4Crossbar_l203_17) ? _zz_when_Axi4Crossbar_l203_17 : _zz_when_Axi4Crossbar_l203_18);
  always @(*) begin
    _zz_when_Axi4Crossbar_l203_20[0] = (_zz_when_Axi4Crossbar_l500_6[0] && (_zz_when_Axi4Crossbar_l203_13 == _zz_when_Axi4Crossbar_l203_19));
    _zz_when_Axi4Crossbar_l203_20[1] = (_zz_when_Axi4Crossbar_l500_6[1] && (_zz_when_Axi4Crossbar_l203_14 == _zz_when_Axi4Crossbar_l203_19));
  end

  always @(*) begin
    _zz_when_Axi4Crossbar_l203_21[0] = (wrRrPtr_1 <= 1'b0);
    _zz_when_Axi4Crossbar_l203_21[1] = (wrRrPtr_1 <= 1'b1);
  end

  assign _zz_when_Axi4Crossbar_l203_22 = (_zz_when_Axi4Crossbar_l203_20 & _zz_when_Axi4Crossbar_l203_21);
  assign _zz_when_Axi4Crossbar_l203_23 = _zz_when_Axi4Crossbar_l203_22;
  assign _zz_when_Axi4Crossbar_l203_24 = _zz_when_Axi4Crossbar_l203_20;
  assign _zz_when_Axi4Crossbar_l203_25 = ((|_zz_when_Axi4Crossbar_l203_22) ? (_zz_when_Axi4Crossbar_l203_23 & (~ _zz__zz_when_Axi4Crossbar_l203_25)) : (_zz_when_Axi4Crossbar_l203_24 & (~ _zz__zz_when_Axi4Crossbar_l203_25_1)));
  always @(*) begin
    _zz_io_slaves_1_aw_payload_id = 1'b0;
    if(when_Axi4Crossbar_l203_2) begin
      _zz_io_slaves_1_aw_payload_id = 1'b0;
    end
    if(when_Axi4Crossbar_l203_3) begin
      _zz_io_slaves_1_aw_payload_id = 1'b1;
    end
  end

  assign when_Axi4Crossbar_l203_2 = _zz_when_Axi4Crossbar_l203_25[0];
  assign when_Axi4Crossbar_l203_3 = _zz_when_Axi4Crossbar_l203_25[1];
  assign when_Axi4Crossbar_l509_1 = (_zz_when_Axi4Crossbar_l509_1 == 3'b000);
  assign _zz_when_Axi4Crossbar_l532_4 = _zz_5_spinal_port0;
  assign when_Axi4Crossbar_l500_1 = ((_zz_when_Axi4Crossbar_l500_1 < 3'b100) && (|_zz_when_Axi4Crossbar_l500_6));
  assign when_Axi4Crossbar_l503_2 = (_zz_io_slaves_1_aw_payload_id == 1'b0);
  assign when_Axi4Crossbar_l503_3 = (_zz_io_slaves_1_aw_payload_id == 1'b1);
  assign io_slaves_1_aw_fire = (m1_axi_awvalid && m1_axi_awready);
  assign when_Axi4Crossbar_l140_2 = (! _zz_when_Axi4Crossbar_l500_6[0]);
  assign when_Axi4Crossbar_l145_2 = (wrQosAge_1_0 != 4'b1111);
  assign when_Axi4Crossbar_l142_2 = (io_slaves_1_aw_fire && (_zz_io_slaves_1_aw_payload_id == 1'b0));
  assign when_Axi4Crossbar_l140_3 = (! _zz_when_Axi4Crossbar_l500_6[1]);
  assign when_Axi4Crossbar_l145_3 = (wrQosAge_1_1 != 4'b1111);
  assign when_Axi4Crossbar_l142_3 = (io_slaves_1_aw_fire && (_zz_io_slaves_1_aw_payload_id == 1'b1));
  assign when_Axi4Crossbar_l530_1 = (! when_Axi4Crossbar_l509_1);
  assign when_Axi4Crossbar_l532_2 = (_zz_when_Axi4Crossbar_l532_4 == 1'b0);
  assign when_Axi4Crossbar_l532_3 = (_zz_when_Axi4Crossbar_l532_4 == 1'b1);
  assign io_slaves_1_w_fire = (m1_axi_wvalid && m1_axi_wready);
  assign when_Axi4Crossbar_l547_1 = (io_slaves_1_w_fire && m1_axi_wlast);
  assign when_Axi4Crossbar_l553_1 = (io_slaves_1_aw_fire && (! when_Axi4Crossbar_l547_1));
  assign when_Axi4Crossbar_l555_1 = ((! io_slaves_1_aw_fire) && when_Axi4Crossbar_l547_1);
  assign io_slaves_1_b_fire = (m1_axi_bvalid && m1_axi_bready);
  assign when_Axi4Crossbar_l562_1 = (io_slaves_1_aw_fire && (! io_slaves_1_b_fire));
  assign when_Axi4Crossbar_l564_1 = ((! io_slaves_1_aw_fire) && io_slaves_1_b_fire);
  always @(*) begin
    _zz_when_Axi4Crossbar_l500_10[0] = ((32'h0 <= s0_axi_awaddr) && (s0_axi_awaddr < 32'h00010000));
    _zz_when_Axi4Crossbar_l500_10[1] = ((32'h00010000 <= s0_axi_awaddr) && (s0_axi_awaddr < 32'h00020000));
  end

  always @(*) begin
    _zz_when_Axi4Crossbar_l500_9[0] = (s0_axi_awvalid && _zz__zz_when_Axi4Crossbar_l500_9[2]);
    _zz_when_Axi4Crossbar_l500_9[1] = (s1_axi_awvalid && _zz__zz_when_Axi4Crossbar_l500_9_1[2]);
  end

  always @(*) begin
    _zz_when_Axi4Crossbar_l500_11[0] = ((32'h0 <= s1_axi_awaddr) && (s1_axi_awaddr < 32'h00010000));
    _zz_when_Axi4Crossbar_l500_11[1] = ((32'h00010000 <= s1_axi_awaddr) && (s1_axi_awaddr < 32'h00020000));
  end

  assign _zz_when_Axi4Crossbar_l203_28 = (_zz__zz_when_Axi4Crossbar_l203_28 + _zz__zz_when_Axi4Crossbar_l203_28_2);
  assign _zz_when_Axi4Crossbar_l203_26 = ((8'h0f < _zz_when_Axi4Crossbar_l203_28) ? 4'b1111 : _zz__zz_when_Axi4Crossbar_l203_26);
  assign _zz_when_Axi4Crossbar_l203_29 = (_zz__zz_when_Axi4Crossbar_l203_29 + _zz__zz_when_Axi4Crossbar_l203_29_2);
  assign _zz_when_Axi4Crossbar_l203_27 = ((8'h0f < _zz_when_Axi4Crossbar_l203_29) ? 4'b1111 : _zz__zz_when_Axi4Crossbar_l203_27);
  assign _zz_when_Axi4Crossbar_l203_30 = (_zz_when_Axi4Crossbar_l500_9[0] ? _zz_when_Axi4Crossbar_l203_26 : 4'b0000);
  assign _zz_when_Axi4Crossbar_l203_31 = (_zz_when_Axi4Crossbar_l500_9[1] ? _zz_when_Axi4Crossbar_l203_27 : 4'b0000);
  assign _zz_when_Axi4Crossbar_l203_32 = ((_zz_when_Axi4Crossbar_l203_31 < _zz_when_Axi4Crossbar_l203_30) ? _zz_when_Axi4Crossbar_l203_30 : _zz_when_Axi4Crossbar_l203_31);
  always @(*) begin
    _zz_when_Axi4Crossbar_l203_33[0] = (_zz_when_Axi4Crossbar_l500_9[0] && (_zz_when_Axi4Crossbar_l203_26 == _zz_when_Axi4Crossbar_l203_32));
    _zz_when_Axi4Crossbar_l203_33[1] = (_zz_when_Axi4Crossbar_l500_9[1] && (_zz_when_Axi4Crossbar_l203_27 == _zz_when_Axi4Crossbar_l203_32));
  end

  always @(*) begin
    _zz_when_Axi4Crossbar_l203_34[0] = (wrRrPtr_2 <= 1'b0);
    _zz_when_Axi4Crossbar_l203_34[1] = (wrRrPtr_2 <= 1'b1);
  end

  assign _zz_when_Axi4Crossbar_l203_35 = (_zz_when_Axi4Crossbar_l203_33 & _zz_when_Axi4Crossbar_l203_34);
  assign _zz_when_Axi4Crossbar_l203_36 = _zz_when_Axi4Crossbar_l203_35;
  assign _zz_when_Axi4Crossbar_l203_37 = _zz_when_Axi4Crossbar_l203_33;
  assign _zz_when_Axi4Crossbar_l203_38 = ((|_zz_when_Axi4Crossbar_l203_35) ? (_zz_when_Axi4Crossbar_l203_36 & (~ _zz__zz_when_Axi4Crossbar_l203_38)) : (_zz_when_Axi4Crossbar_l203_37 & (~ _zz__zz_when_Axi4Crossbar_l203_38_1)));
  always @(*) begin
    _zz_wrRrPtr_2 = 1'b0;
    if(when_Axi4Crossbar_l203_4) begin
      _zz_wrRrPtr_2 = 1'b0;
    end
    if(when_Axi4Crossbar_l203_5) begin
      _zz_wrRrPtr_2 = 1'b1;
    end
  end

  assign when_Axi4Crossbar_l203_4 = _zz_when_Axi4Crossbar_l203_38[0];
  assign when_Axi4Crossbar_l203_5 = _zz_when_Axi4Crossbar_l203_38[1];
  assign when_Axi4Crossbar_l509_2 = (_zz_when_Axi4Crossbar_l509_2 == 3'b000);
  assign _zz_when_Axi4Crossbar_l532_5 = _zz_6_spinal_port0;
  assign when_Axi4Crossbar_l500_2 = ((_zz_when_Axi4Crossbar_l500_2 < 3'b100) && (|_zz_when_Axi4Crossbar_l500_9));
  assign when_Axi4Crossbar_l503_4 = (_zz_wrRrPtr_2 == 1'b0);
  assign when_Axi4Crossbar_l503_5 = (_zz_wrRrPtr_2 == 1'b1);
  assign decErr_io_axi_aw_fire = (decErr_io_axi_aw_valid && decErr_io_axi_aw_ready);
  assign when_Axi4Crossbar_l140_4 = (! _zz_when_Axi4Crossbar_l500_9[0]);
  assign when_Axi4Crossbar_l145_4 = (wrQosAge_2_0 != 4'b1111);
  assign when_Axi4Crossbar_l142_4 = (decErr_io_axi_aw_fire && (_zz_wrRrPtr_2 == 1'b0));
  assign when_Axi4Crossbar_l140_5 = (! _zz_when_Axi4Crossbar_l500_9[1]);
  assign when_Axi4Crossbar_l145_5 = (wrQosAge_2_1 != 4'b1111);
  assign when_Axi4Crossbar_l142_5 = (decErr_io_axi_aw_fire && (_zz_wrRrPtr_2 == 1'b1));
  assign when_Axi4Crossbar_l530_2 = (! when_Axi4Crossbar_l509_2);
  assign when_Axi4Crossbar_l532_4 = (_zz_when_Axi4Crossbar_l532_5 == 1'b0);
  assign when_Axi4Crossbar_l532_5 = (_zz_when_Axi4Crossbar_l532_5 == 1'b1);
  assign decErr_io_axi_w_fire = (decErr_io_axi_w_valid && decErr_io_axi_w_ready);
  assign when_Axi4Crossbar_l547_2 = (decErr_io_axi_w_fire && decErr_io_axi_w_payload_last);
  assign when_Axi4Crossbar_l553_2 = (decErr_io_axi_aw_fire && (! when_Axi4Crossbar_l547_2));
  assign when_Axi4Crossbar_l555_2 = ((! decErr_io_axi_aw_fire) && when_Axi4Crossbar_l547_2);
  assign decErr_io_axi_b_fire = (decErr_io_axi_b_valid && decErr_io_axi_b_ready);
  assign when_Axi4Crossbar_l562_2 = (decErr_io_axi_aw_fire && (! decErr_io_axi_b_fire));
  assign when_Axi4Crossbar_l564_2 = ((! decErr_io_axi_aw_fire) && decErr_io_axi_b_fire);
  always @(*) begin
    _zz_when_Axi4Crossbar_l584[0] = (m0_axi_bvalid && (_zz__zz_when_Axi4Crossbar_l584 == 1'b0));
    _zz_when_Axi4Crossbar_l584[1] = (m1_axi_bvalid && (_zz__zz_when_Axi4Crossbar_l584_1 == 1'b0));
    _zz_when_Axi4Crossbar_l584[2] = (decErr_io_axi_b_valid && (_zz__zz_when_Axi4Crossbar_l584_2 == 1'b0));
  end

  assign _zz_when_Axi4Crossbar_l584_1 = _zz_when_Axi4Crossbar_l584;
  assign _zz_when_Axi4Crossbar_l584_2 = (_zz_when_Axi4Crossbar_l584_1 & (~ _zz__zz_when_Axi4Crossbar_l584_2_1));
  assign when_Axi4Crossbar_l584 = _zz_when_Axi4Crossbar_l584_2[0];
  assign when_Axi4Crossbar_l584_1 = _zz_when_Axi4Crossbar_l584_2[1];
  assign when_Axi4Crossbar_l584_2 = _zz_when_Axi4Crossbar_l584_2[2];
  always @(*) begin
    _zz_when_Axi4Crossbar_l584_3[0] = (m0_axi_bvalid && (_zz__zz_when_Axi4Crossbar_l584_3 == 1'b1));
    _zz_when_Axi4Crossbar_l584_3[1] = (m1_axi_bvalid && (_zz__zz_when_Axi4Crossbar_l584_3_1 == 1'b1));
    _zz_when_Axi4Crossbar_l584_3[2] = (decErr_io_axi_b_valid && (_zz__zz_when_Axi4Crossbar_l584_3_2 == 1'b1));
  end

  assign _zz_when_Axi4Crossbar_l584_4 = _zz_when_Axi4Crossbar_l584_3;
  assign _zz_when_Axi4Crossbar_l584_5 = (_zz_when_Axi4Crossbar_l584_4 & (~ _zz__zz_when_Axi4Crossbar_l584_5));
  assign when_Axi4Crossbar_l584_3 = _zz_when_Axi4Crossbar_l584_5[0];
  assign when_Axi4Crossbar_l584_4 = _zz_when_Axi4Crossbar_l584_5[1];
  assign when_Axi4Crossbar_l584_5 = _zz_when_Axi4Crossbar_l584_5[2];
  always @(*) begin
    _zz_when_Axi4Crossbar_l615_4[0] = ((32'h0 <= s0_axi_araddr) && (s0_axi_araddr < 32'h00010000));
    _zz_when_Axi4Crossbar_l615_4[1] = ((32'h00010000 <= s0_axi_araddr) && (s0_axi_araddr < 32'h00020000));
  end

  always @(*) begin
    _zz_when_Axi4Crossbar_l615_3[0] = (s0_axi_arvalid && _zz__zz_when_Axi4Crossbar_l615_3[0]);
    _zz_when_Axi4Crossbar_l615_3[1] = (s1_axi_arvalid && _zz__zz_when_Axi4Crossbar_l615_3_1[0]);
  end

  always @(*) begin
    _zz_when_Axi4Crossbar_l615_5[0] = ((32'h0 <= s1_axi_araddr) && (s1_axi_araddr < 32'h00010000));
    _zz_when_Axi4Crossbar_l615_5[1] = ((32'h00010000 <= s1_axi_araddr) && (s1_axi_araddr < 32'h00020000));
  end

  assign _zz_when_Axi4Crossbar_l203_41 = (_zz__zz_when_Axi4Crossbar_l203_41 + _zz__zz_when_Axi4Crossbar_l203_41_2);
  assign _zz_when_Axi4Crossbar_l203_39 = ((8'h0f < _zz_when_Axi4Crossbar_l203_41) ? 4'b1111 : _zz__zz_when_Axi4Crossbar_l203_39);
  assign _zz_when_Axi4Crossbar_l203_42 = (_zz__zz_when_Axi4Crossbar_l203_42 + _zz__zz_when_Axi4Crossbar_l203_42_2);
  assign _zz_when_Axi4Crossbar_l203_40 = ((8'h0f < _zz_when_Axi4Crossbar_l203_42) ? 4'b1111 : _zz__zz_when_Axi4Crossbar_l203_40);
  assign _zz_when_Axi4Crossbar_l203_43 = (_zz_when_Axi4Crossbar_l615_3[0] ? _zz_when_Axi4Crossbar_l203_39 : 4'b0000);
  assign _zz_when_Axi4Crossbar_l203_44 = (_zz_when_Axi4Crossbar_l615_3[1] ? _zz_when_Axi4Crossbar_l203_40 : 4'b0000);
  assign _zz_when_Axi4Crossbar_l203_45 = ((_zz_when_Axi4Crossbar_l203_44 < _zz_when_Axi4Crossbar_l203_43) ? _zz_when_Axi4Crossbar_l203_43 : _zz_when_Axi4Crossbar_l203_44);
  always @(*) begin
    _zz_when_Axi4Crossbar_l203_46[0] = (_zz_when_Axi4Crossbar_l615_3[0] && (_zz_when_Axi4Crossbar_l203_39 == _zz_when_Axi4Crossbar_l203_45));
    _zz_when_Axi4Crossbar_l203_46[1] = (_zz_when_Axi4Crossbar_l615_3[1] && (_zz_when_Axi4Crossbar_l203_40 == _zz_when_Axi4Crossbar_l203_45));
  end

  always @(*) begin
    _zz_when_Axi4Crossbar_l203_47[0] = (rdRrPtr_0 <= 1'b0);
    _zz_when_Axi4Crossbar_l203_47[1] = (rdRrPtr_0 <= 1'b1);
  end

  assign _zz_when_Axi4Crossbar_l203_48 = (_zz_when_Axi4Crossbar_l203_46 & _zz_when_Axi4Crossbar_l203_47);
  assign _zz_when_Axi4Crossbar_l203_49 = _zz_when_Axi4Crossbar_l203_48;
  assign _zz_when_Axi4Crossbar_l203_50 = _zz_when_Axi4Crossbar_l203_46;
  assign _zz_when_Axi4Crossbar_l203_51 = ((|_zz_when_Axi4Crossbar_l203_48) ? (_zz_when_Axi4Crossbar_l203_49 & (~ _zz__zz_when_Axi4Crossbar_l203_51)) : (_zz_when_Axi4Crossbar_l203_50 & (~ _zz__zz_when_Axi4Crossbar_l203_51_1)));
  always @(*) begin
    _zz_io_slaves_0_ar_payload_id = 1'b0;
    if(when_Axi4Crossbar_l203_6) begin
      _zz_io_slaves_0_ar_payload_id = 1'b0;
    end
    if(when_Axi4Crossbar_l203_7) begin
      _zz_io_slaves_0_ar_payload_id = 1'b1;
    end
  end

  assign when_Axi4Crossbar_l203_6 = _zz_when_Axi4Crossbar_l203_51[0];
  assign when_Axi4Crossbar_l203_7 = _zz_when_Axi4Crossbar_l203_51[1];
  assign when_Axi4Crossbar_l615 = ((_zz_when_Axi4Crossbar_l615 < 3'b100) && (|_zz_when_Axi4Crossbar_l615_3));
  assign when_Axi4Crossbar_l618 = (_zz_io_slaves_0_ar_payload_id == 1'b0);
  assign when_Axi4Crossbar_l618_1 = (_zz_io_slaves_0_ar_payload_id == 1'b1);
  assign io_slaves_0_ar_fire = (m0_axi_arvalid && m0_axi_arready);
  assign when_Axi4Crossbar_l140_6 = (! _zz_when_Axi4Crossbar_l615_3[0]);
  assign when_Axi4Crossbar_l145_6 = (rdQosAge_0_0 != 4'b1111);
  assign when_Axi4Crossbar_l142_6 = (io_slaves_0_ar_fire && (_zz_io_slaves_0_ar_payload_id == 1'b0));
  assign when_Axi4Crossbar_l140_7 = (! _zz_when_Axi4Crossbar_l615_3[1]);
  assign when_Axi4Crossbar_l145_7 = (rdQosAge_0_1 != 4'b1111);
  assign when_Axi4Crossbar_l142_7 = (io_slaves_0_ar_fire && (_zz_io_slaves_0_ar_payload_id == 1'b1));
  assign io_slaves_0_r_fire = (m0_axi_rvalid && m0_axi_rready);
  assign _zz_when_Axi4Crossbar_l636 = (io_slaves_0_r_fire && m0_axi_rlast);
  assign when_Axi4Crossbar_l636 = (io_slaves_0_ar_fire && (! _zz_when_Axi4Crossbar_l636));
  assign when_Axi4Crossbar_l638 = ((! io_slaves_0_ar_fire) && _zz_when_Axi4Crossbar_l636);
  always @(*) begin
    _zz_when_Axi4Crossbar_l615_7[0] = ((32'h0 <= s0_axi_araddr) && (s0_axi_araddr < 32'h00010000));
    _zz_when_Axi4Crossbar_l615_7[1] = ((32'h00010000 <= s0_axi_araddr) && (s0_axi_araddr < 32'h00020000));
  end

  always @(*) begin
    _zz_when_Axi4Crossbar_l615_6[0] = (s0_axi_arvalid && _zz__zz_when_Axi4Crossbar_l615_6[1]);
    _zz_when_Axi4Crossbar_l615_6[1] = (s1_axi_arvalid && _zz__zz_when_Axi4Crossbar_l615_6_1[1]);
  end

  always @(*) begin
    _zz_when_Axi4Crossbar_l615_8[0] = ((32'h0 <= s1_axi_araddr) && (s1_axi_araddr < 32'h00010000));
    _zz_when_Axi4Crossbar_l615_8[1] = ((32'h00010000 <= s1_axi_araddr) && (s1_axi_araddr < 32'h00020000));
  end

  assign _zz_when_Axi4Crossbar_l203_54 = (_zz__zz_when_Axi4Crossbar_l203_54 + _zz__zz_when_Axi4Crossbar_l203_54_2);
  assign _zz_when_Axi4Crossbar_l203_52 = ((8'h0f < _zz_when_Axi4Crossbar_l203_54) ? 4'b1111 : _zz__zz_when_Axi4Crossbar_l203_52);
  assign _zz_when_Axi4Crossbar_l203_55 = (_zz__zz_when_Axi4Crossbar_l203_55 + _zz__zz_when_Axi4Crossbar_l203_55_2);
  assign _zz_when_Axi4Crossbar_l203_53 = ((8'h0f < _zz_when_Axi4Crossbar_l203_55) ? 4'b1111 : _zz__zz_when_Axi4Crossbar_l203_53);
  assign _zz_when_Axi4Crossbar_l203_56 = (_zz_when_Axi4Crossbar_l615_6[0] ? _zz_when_Axi4Crossbar_l203_52 : 4'b0000);
  assign _zz_when_Axi4Crossbar_l203_57 = (_zz_when_Axi4Crossbar_l615_6[1] ? _zz_when_Axi4Crossbar_l203_53 : 4'b0000);
  assign _zz_when_Axi4Crossbar_l203_58 = ((_zz_when_Axi4Crossbar_l203_57 < _zz_when_Axi4Crossbar_l203_56) ? _zz_when_Axi4Crossbar_l203_56 : _zz_when_Axi4Crossbar_l203_57);
  always @(*) begin
    _zz_when_Axi4Crossbar_l203_59[0] = (_zz_when_Axi4Crossbar_l615_6[0] && (_zz_when_Axi4Crossbar_l203_52 == _zz_when_Axi4Crossbar_l203_58));
    _zz_when_Axi4Crossbar_l203_59[1] = (_zz_when_Axi4Crossbar_l615_6[1] && (_zz_when_Axi4Crossbar_l203_53 == _zz_when_Axi4Crossbar_l203_58));
  end

  always @(*) begin
    _zz_when_Axi4Crossbar_l203_60[0] = (rdRrPtr_1 <= 1'b0);
    _zz_when_Axi4Crossbar_l203_60[1] = (rdRrPtr_1 <= 1'b1);
  end

  assign _zz_when_Axi4Crossbar_l203_61 = (_zz_when_Axi4Crossbar_l203_59 & _zz_when_Axi4Crossbar_l203_60);
  assign _zz_when_Axi4Crossbar_l203_62 = _zz_when_Axi4Crossbar_l203_61;
  assign _zz_when_Axi4Crossbar_l203_63 = _zz_when_Axi4Crossbar_l203_59;
  assign _zz_when_Axi4Crossbar_l203_64 = ((|_zz_when_Axi4Crossbar_l203_61) ? (_zz_when_Axi4Crossbar_l203_62 & (~ _zz__zz_when_Axi4Crossbar_l203_64)) : (_zz_when_Axi4Crossbar_l203_63 & (~ _zz__zz_when_Axi4Crossbar_l203_64_1)));
  always @(*) begin
    _zz_io_slaves_1_ar_payload_id = 1'b0;
    if(when_Axi4Crossbar_l203_8) begin
      _zz_io_slaves_1_ar_payload_id = 1'b0;
    end
    if(when_Axi4Crossbar_l203_9) begin
      _zz_io_slaves_1_ar_payload_id = 1'b1;
    end
  end

  assign when_Axi4Crossbar_l203_8 = _zz_when_Axi4Crossbar_l203_64[0];
  assign when_Axi4Crossbar_l203_9 = _zz_when_Axi4Crossbar_l203_64[1];
  assign when_Axi4Crossbar_l615_1 = ((_zz_when_Axi4Crossbar_l615_1 < 3'b100) && (|_zz_when_Axi4Crossbar_l615_6));
  assign when_Axi4Crossbar_l618_2 = (_zz_io_slaves_1_ar_payload_id == 1'b0);
  assign when_Axi4Crossbar_l618_3 = (_zz_io_slaves_1_ar_payload_id == 1'b1);
  assign io_slaves_1_ar_fire = (m1_axi_arvalid && m1_axi_arready);
  assign when_Axi4Crossbar_l140_8 = (! _zz_when_Axi4Crossbar_l615_6[0]);
  assign when_Axi4Crossbar_l145_8 = (rdQosAge_1_0 != 4'b1111);
  assign when_Axi4Crossbar_l142_8 = (io_slaves_1_ar_fire && (_zz_io_slaves_1_ar_payload_id == 1'b0));
  assign when_Axi4Crossbar_l140_9 = (! _zz_when_Axi4Crossbar_l615_6[1]);
  assign when_Axi4Crossbar_l145_9 = (rdQosAge_1_1 != 4'b1111);
  assign when_Axi4Crossbar_l142_9 = (io_slaves_1_ar_fire && (_zz_io_slaves_1_ar_payload_id == 1'b1));
  assign io_slaves_1_r_fire = (m1_axi_rvalid && m1_axi_rready);
  assign _zz_when_Axi4Crossbar_l636_1 = (io_slaves_1_r_fire && m1_axi_rlast);
  assign when_Axi4Crossbar_l636_1 = (io_slaves_1_ar_fire && (! _zz_when_Axi4Crossbar_l636_1));
  assign when_Axi4Crossbar_l638_1 = ((! io_slaves_1_ar_fire) && _zz_when_Axi4Crossbar_l636_1);
  always @(*) begin
    _zz_when_Axi4Crossbar_l615_10[0] = ((32'h0 <= s0_axi_araddr) && (s0_axi_araddr < 32'h00010000));
    _zz_when_Axi4Crossbar_l615_10[1] = ((32'h00010000 <= s0_axi_araddr) && (s0_axi_araddr < 32'h00020000));
  end

  always @(*) begin
    _zz_when_Axi4Crossbar_l615_9[0] = (s0_axi_arvalid && _zz__zz_when_Axi4Crossbar_l615_9[2]);
    _zz_when_Axi4Crossbar_l615_9[1] = (s1_axi_arvalid && _zz__zz_when_Axi4Crossbar_l615_9_1[2]);
  end

  always @(*) begin
    _zz_when_Axi4Crossbar_l615_11[0] = ((32'h0 <= s1_axi_araddr) && (s1_axi_araddr < 32'h00010000));
    _zz_when_Axi4Crossbar_l615_11[1] = ((32'h00010000 <= s1_axi_araddr) && (s1_axi_araddr < 32'h00020000));
  end

  assign _zz_when_Axi4Crossbar_l203_67 = (_zz__zz_when_Axi4Crossbar_l203_67 + _zz__zz_when_Axi4Crossbar_l203_67_2);
  assign _zz_when_Axi4Crossbar_l203_65 = ((8'h0f < _zz_when_Axi4Crossbar_l203_67) ? 4'b1111 : _zz__zz_when_Axi4Crossbar_l203_65);
  assign _zz_when_Axi4Crossbar_l203_68 = (_zz__zz_when_Axi4Crossbar_l203_68 + _zz__zz_when_Axi4Crossbar_l203_68_2);
  assign _zz_when_Axi4Crossbar_l203_66 = ((8'h0f < _zz_when_Axi4Crossbar_l203_68) ? 4'b1111 : _zz__zz_when_Axi4Crossbar_l203_66);
  assign _zz_when_Axi4Crossbar_l203_69 = (_zz_when_Axi4Crossbar_l615_9[0] ? _zz_when_Axi4Crossbar_l203_65 : 4'b0000);
  assign _zz_when_Axi4Crossbar_l203_70 = (_zz_when_Axi4Crossbar_l615_9[1] ? _zz_when_Axi4Crossbar_l203_66 : 4'b0000);
  assign _zz_when_Axi4Crossbar_l203_71 = ((_zz_when_Axi4Crossbar_l203_70 < _zz_when_Axi4Crossbar_l203_69) ? _zz_when_Axi4Crossbar_l203_69 : _zz_when_Axi4Crossbar_l203_70);
  always @(*) begin
    _zz_when_Axi4Crossbar_l203_72[0] = (_zz_when_Axi4Crossbar_l615_9[0] && (_zz_when_Axi4Crossbar_l203_65 == _zz_when_Axi4Crossbar_l203_71));
    _zz_when_Axi4Crossbar_l203_72[1] = (_zz_when_Axi4Crossbar_l615_9[1] && (_zz_when_Axi4Crossbar_l203_66 == _zz_when_Axi4Crossbar_l203_71));
  end

  always @(*) begin
    _zz_when_Axi4Crossbar_l203_73[0] = (rdRrPtr_2 <= 1'b0);
    _zz_when_Axi4Crossbar_l203_73[1] = (rdRrPtr_2 <= 1'b1);
  end

  assign _zz_when_Axi4Crossbar_l203_74 = (_zz_when_Axi4Crossbar_l203_72 & _zz_when_Axi4Crossbar_l203_73);
  assign _zz_when_Axi4Crossbar_l203_75 = _zz_when_Axi4Crossbar_l203_74;
  assign _zz_when_Axi4Crossbar_l203_76 = _zz_when_Axi4Crossbar_l203_72;
  assign _zz_when_Axi4Crossbar_l203_77 = ((|_zz_when_Axi4Crossbar_l203_74) ? (_zz_when_Axi4Crossbar_l203_75 & (~ _zz__zz_when_Axi4Crossbar_l203_77)) : (_zz_when_Axi4Crossbar_l203_76 & (~ _zz__zz_when_Axi4Crossbar_l203_77_1)));
  always @(*) begin
    _zz_rdRrPtr_2 = 1'b0;
    if(when_Axi4Crossbar_l203_10) begin
      _zz_rdRrPtr_2 = 1'b0;
    end
    if(when_Axi4Crossbar_l203_11) begin
      _zz_rdRrPtr_2 = 1'b1;
    end
  end

  assign when_Axi4Crossbar_l203_10 = _zz_when_Axi4Crossbar_l203_77[0];
  assign when_Axi4Crossbar_l203_11 = _zz_when_Axi4Crossbar_l203_77[1];
  assign when_Axi4Crossbar_l615_2 = ((_zz_when_Axi4Crossbar_l615_2 < 3'b100) && (|_zz_when_Axi4Crossbar_l615_9));
  assign when_Axi4Crossbar_l618_4 = (_zz_rdRrPtr_2 == 1'b0);
  assign when_Axi4Crossbar_l618_5 = (_zz_rdRrPtr_2 == 1'b1);
  assign decErr_io_axi_ar_fire = (decErr_io_axi_ar_valid && decErr_io_axi_ar_ready);
  assign when_Axi4Crossbar_l140_10 = (! _zz_when_Axi4Crossbar_l615_9[0]);
  assign when_Axi4Crossbar_l145_10 = (rdQosAge_2_0 != 4'b1111);
  assign when_Axi4Crossbar_l142_10 = (decErr_io_axi_ar_fire && (_zz_rdRrPtr_2 == 1'b0));
  assign when_Axi4Crossbar_l140_11 = (! _zz_when_Axi4Crossbar_l615_9[1]);
  assign when_Axi4Crossbar_l145_11 = (rdQosAge_2_1 != 4'b1111);
  assign when_Axi4Crossbar_l142_11 = (decErr_io_axi_ar_fire && (_zz_rdRrPtr_2 == 1'b1));
  assign decErr_io_axi_r_fire = (decErr_io_axi_r_valid && decErr_io_axi_r_ready);
  assign _zz_when_Axi4Crossbar_l636_2 = (decErr_io_axi_r_fire && decErr_io_axi_r_payload_last);
  assign when_Axi4Crossbar_l636_2 = (decErr_io_axi_ar_fire && (! _zz_when_Axi4Crossbar_l636_2));
  assign when_Axi4Crossbar_l638_2 = ((! decErr_io_axi_ar_fire) && _zz_when_Axi4Crossbar_l636_2);
  always @(*) begin
    _zz_when_Axi4Crossbar_l656[0] = (m0_axi_rvalid && (_zz__zz_when_Axi4Crossbar_l656 == 1'b0));
    _zz_when_Axi4Crossbar_l656[1] = (m1_axi_rvalid && (_zz__zz_when_Axi4Crossbar_l656_1 == 1'b0));
    _zz_when_Axi4Crossbar_l656[2] = (decErr_io_axi_r_valid && (_zz__zz_when_Axi4Crossbar_l656_2 == 1'b0));
  end

  assign _zz_when_Axi4Crossbar_l656_1 = _zz_when_Axi4Crossbar_l656;
  assign _zz_when_Axi4Crossbar_l656_2 = (_zz_when_Axi4Crossbar_l656_1 & (~ _zz__zz_when_Axi4Crossbar_l656_2_1));
  assign when_Axi4Crossbar_l656 = _zz_when_Axi4Crossbar_l656_2[0];
  assign when_Axi4Crossbar_l656_1 = _zz_when_Axi4Crossbar_l656_2[1];
  assign when_Axi4Crossbar_l656_2 = _zz_when_Axi4Crossbar_l656_2[2];
  always @(*) begin
    _zz_when_Axi4Crossbar_l656_3[0] = (m0_axi_rvalid && (_zz__zz_when_Axi4Crossbar_l656_3 == 1'b1));
    _zz_when_Axi4Crossbar_l656_3[1] = (m1_axi_rvalid && (_zz__zz_when_Axi4Crossbar_l656_3_1 == 1'b1));
    _zz_when_Axi4Crossbar_l656_3[2] = (decErr_io_axi_r_valid && (_zz__zz_when_Axi4Crossbar_l656_3_2 == 1'b1));
  end

  assign _zz_when_Axi4Crossbar_l656_4 = _zz_when_Axi4Crossbar_l656_3;
  assign _zz_when_Axi4Crossbar_l656_5 = (_zz_when_Axi4Crossbar_l656_4 & (~ _zz__zz_when_Axi4Crossbar_l656_5));
  assign when_Axi4Crossbar_l656_3 = _zz_when_Axi4Crossbar_l656_5[0];
  assign when_Axi4Crossbar_l656_4 = _zz_when_Axi4Crossbar_l656_5[1];
  assign when_Axi4Crossbar_l656_5 = _zz_when_Axi4Crossbar_l656_5[2];
  always @(posedge aclk) begin
    if(!aresetn) begin
      wrRrPtr_0 <= 1'b0;
      wrRrPtr_1 <= 1'b0;
      wrRrPtr_2 <= 1'b0;
      rdRrPtr_0 <= 1'b0;
      rdRrPtr_1 <= 1'b0;
      rdRrPtr_2 <= 1'b0;
      wrQosAge_0_0 <= 4'b0000;
      wrQosAge_0_1 <= 4'b0000;
      wrQosAge_1_0 <= 4'b0000;
      wrQosAge_1_1 <= 4'b0000;
      wrQosAge_2_0 <= 4'b0000;
      wrQosAge_2_1 <= 4'b0000;
      rdQosAge_0_0 <= 4'b0000;
      rdQosAge_0_1 <= 4'b0000;
      rdQosAge_1_0 <= 4'b0000;
      rdQosAge_1_1 <= 4'b0000;
      rdQosAge_2_0 <= 4'b0000;
      rdQosAge_2_1 <= 4'b0000;
      _zz_when_Axi4Crossbar_l500 <= 3'b000;
      _zz_when_Axi4Crossbar_l500_1 <= 3'b000;
      _zz_when_Axi4Crossbar_l500_2 <= 3'b000;
      _zz_7 <= 2'b00;
      _zz_8 <= 2'b00;
      _zz_9 <= 2'b00;
      _zz_when_Axi4Crossbar_l532 <= 2'b00;
      _zz_when_Axi4Crossbar_l532_1 <= 2'b00;
      _zz_when_Axi4Crossbar_l532_2 <= 2'b00;
      _zz_when_Axi4Crossbar_l509 <= 3'b000;
      _zz_when_Axi4Crossbar_l509_1 <= 3'b000;
      _zz_when_Axi4Crossbar_l509_2 <= 3'b000;
      _zz_when_Axi4Crossbar_l615 <= 3'b000;
      _zz_when_Axi4Crossbar_l615_1 <= 3'b000;
      _zz_when_Axi4Crossbar_l615_2 <= 3'b000;
    end else begin
      if(io_slaves_0_aw_fire) begin
        _zz_7 <= ((_zz_7 == 2'b11) ? 2'b00 : _zz__zz_7);
        wrRrPtr_0 <= (_zz_io_slaves_0_aw_payload_id + 1'b1);
      end
      if(when_Axi4Crossbar_l140) begin
        wrQosAge_0_0 <= 4'b0000;
      end else begin
        if(when_Axi4Crossbar_l142) begin
          wrQosAge_0_0 <= 4'b0000;
        end else begin
          if(when_Axi4Crossbar_l145) begin
            wrQosAge_0_0 <= (wrQosAge_0_0 + 4'b0001);
          end
        end
      end
      if(when_Axi4Crossbar_l140_1) begin
        wrQosAge_0_1 <= 4'b0000;
      end else begin
        if(when_Axi4Crossbar_l142_1) begin
          wrQosAge_0_1 <= 4'b0000;
        end else begin
          if(when_Axi4Crossbar_l145_1) begin
            wrQosAge_0_1 <= (wrQosAge_0_1 + 4'b0001);
          end
        end
      end
      if(when_Axi4Crossbar_l547) begin
        _zz_when_Axi4Crossbar_l532 <= ((_zz_when_Axi4Crossbar_l532 == 2'b11) ? 2'b00 : _zz__zz_when_Axi4Crossbar_l532);
      end
      if(when_Axi4Crossbar_l553) begin
        _zz_when_Axi4Crossbar_l509 <= (_zz_when_Axi4Crossbar_l509 + 3'b001);
      end else begin
        if(when_Axi4Crossbar_l555) begin
          _zz_when_Axi4Crossbar_l509 <= (_zz_when_Axi4Crossbar_l509 - 3'b001);
        end
      end
      if(when_Axi4Crossbar_l562) begin
        _zz_when_Axi4Crossbar_l500 <= (_zz_when_Axi4Crossbar_l500 + 3'b001);
      end else begin
        if(when_Axi4Crossbar_l564) begin
          _zz_when_Axi4Crossbar_l500 <= (_zz_when_Axi4Crossbar_l500 - 3'b001);
        end
      end
      if(io_slaves_1_aw_fire) begin
        _zz_8 <= ((_zz_8 == 2'b11) ? 2'b00 : _zz__zz_8);
        wrRrPtr_1 <= (_zz_io_slaves_1_aw_payload_id + 1'b1);
      end
      if(when_Axi4Crossbar_l140_2) begin
        wrQosAge_1_0 <= 4'b0000;
      end else begin
        if(when_Axi4Crossbar_l142_2) begin
          wrQosAge_1_0 <= 4'b0000;
        end else begin
          if(when_Axi4Crossbar_l145_2) begin
            wrQosAge_1_0 <= (wrQosAge_1_0 + 4'b0001);
          end
        end
      end
      if(when_Axi4Crossbar_l140_3) begin
        wrQosAge_1_1 <= 4'b0000;
      end else begin
        if(when_Axi4Crossbar_l142_3) begin
          wrQosAge_1_1 <= 4'b0000;
        end else begin
          if(when_Axi4Crossbar_l145_3) begin
            wrQosAge_1_1 <= (wrQosAge_1_1 + 4'b0001);
          end
        end
      end
      if(when_Axi4Crossbar_l547_1) begin
        _zz_when_Axi4Crossbar_l532_1 <= ((_zz_when_Axi4Crossbar_l532_1 == 2'b11) ? 2'b00 : _zz__zz_when_Axi4Crossbar_l532_1);
      end
      if(when_Axi4Crossbar_l553_1) begin
        _zz_when_Axi4Crossbar_l509_1 <= (_zz_when_Axi4Crossbar_l509_1 + 3'b001);
      end else begin
        if(when_Axi4Crossbar_l555_1) begin
          _zz_when_Axi4Crossbar_l509_1 <= (_zz_when_Axi4Crossbar_l509_1 - 3'b001);
        end
      end
      if(when_Axi4Crossbar_l562_1) begin
        _zz_when_Axi4Crossbar_l500_1 <= (_zz_when_Axi4Crossbar_l500_1 + 3'b001);
      end else begin
        if(when_Axi4Crossbar_l564_1) begin
          _zz_when_Axi4Crossbar_l500_1 <= (_zz_when_Axi4Crossbar_l500_1 - 3'b001);
        end
      end
      if(decErr_io_axi_aw_fire) begin
        _zz_9 <= ((_zz_9 == 2'b11) ? 2'b00 : _zz__zz_9);
        wrRrPtr_2 <= (_zz_wrRrPtr_2 + 1'b1);
      end
      if(when_Axi4Crossbar_l140_4) begin
        wrQosAge_2_0 <= 4'b0000;
      end else begin
        if(when_Axi4Crossbar_l142_4) begin
          wrQosAge_2_0 <= 4'b0000;
        end else begin
          if(when_Axi4Crossbar_l145_4) begin
            wrQosAge_2_0 <= (wrQosAge_2_0 + 4'b0001);
          end
        end
      end
      if(when_Axi4Crossbar_l140_5) begin
        wrQosAge_2_1 <= 4'b0000;
      end else begin
        if(when_Axi4Crossbar_l142_5) begin
          wrQosAge_2_1 <= 4'b0000;
        end else begin
          if(when_Axi4Crossbar_l145_5) begin
            wrQosAge_2_1 <= (wrQosAge_2_1 + 4'b0001);
          end
        end
      end
      if(when_Axi4Crossbar_l547_2) begin
        _zz_when_Axi4Crossbar_l532_2 <= ((_zz_when_Axi4Crossbar_l532_2 == 2'b11) ? 2'b00 : _zz__zz_when_Axi4Crossbar_l532_2);
      end
      if(when_Axi4Crossbar_l553_2) begin
        _zz_when_Axi4Crossbar_l509_2 <= (_zz_when_Axi4Crossbar_l509_2 + 3'b001);
      end else begin
        if(when_Axi4Crossbar_l555_2) begin
          _zz_when_Axi4Crossbar_l509_2 <= (_zz_when_Axi4Crossbar_l509_2 - 3'b001);
        end
      end
      if(when_Axi4Crossbar_l562_2) begin
        _zz_when_Axi4Crossbar_l500_2 <= (_zz_when_Axi4Crossbar_l500_2 + 3'b001);
      end else begin
        if(when_Axi4Crossbar_l564_2) begin
          _zz_when_Axi4Crossbar_l500_2 <= (_zz_when_Axi4Crossbar_l500_2 - 3'b001);
        end
      end
      if(io_slaves_0_ar_fire) begin
        rdRrPtr_0 <= (_zz_io_slaves_0_ar_payload_id + 1'b1);
      end
      if(when_Axi4Crossbar_l140_6) begin
        rdQosAge_0_0 <= 4'b0000;
      end else begin
        if(when_Axi4Crossbar_l142_6) begin
          rdQosAge_0_0 <= 4'b0000;
        end else begin
          if(when_Axi4Crossbar_l145_6) begin
            rdQosAge_0_0 <= (rdQosAge_0_0 + 4'b0001);
          end
        end
      end
      if(when_Axi4Crossbar_l140_7) begin
        rdQosAge_0_1 <= 4'b0000;
      end else begin
        if(when_Axi4Crossbar_l142_7) begin
          rdQosAge_0_1 <= 4'b0000;
        end else begin
          if(when_Axi4Crossbar_l145_7) begin
            rdQosAge_0_1 <= (rdQosAge_0_1 + 4'b0001);
          end
        end
      end
      if(when_Axi4Crossbar_l636) begin
        _zz_when_Axi4Crossbar_l615 <= (_zz_when_Axi4Crossbar_l615 + 3'b001);
      end else begin
        if(when_Axi4Crossbar_l638) begin
          _zz_when_Axi4Crossbar_l615 <= (_zz_when_Axi4Crossbar_l615 - 3'b001);
        end
      end
      if(io_slaves_1_ar_fire) begin
        rdRrPtr_1 <= (_zz_io_slaves_1_ar_payload_id + 1'b1);
      end
      if(when_Axi4Crossbar_l140_8) begin
        rdQosAge_1_0 <= 4'b0000;
      end else begin
        if(when_Axi4Crossbar_l142_8) begin
          rdQosAge_1_0 <= 4'b0000;
        end else begin
          if(when_Axi4Crossbar_l145_8) begin
            rdQosAge_1_0 <= (rdQosAge_1_0 + 4'b0001);
          end
        end
      end
      if(when_Axi4Crossbar_l140_9) begin
        rdQosAge_1_1 <= 4'b0000;
      end else begin
        if(when_Axi4Crossbar_l142_9) begin
          rdQosAge_1_1 <= 4'b0000;
        end else begin
          if(when_Axi4Crossbar_l145_9) begin
            rdQosAge_1_1 <= (rdQosAge_1_1 + 4'b0001);
          end
        end
      end
      if(when_Axi4Crossbar_l636_1) begin
        _zz_when_Axi4Crossbar_l615_1 <= (_zz_when_Axi4Crossbar_l615_1 + 3'b001);
      end else begin
        if(when_Axi4Crossbar_l638_1) begin
          _zz_when_Axi4Crossbar_l615_1 <= (_zz_when_Axi4Crossbar_l615_1 - 3'b001);
        end
      end
      if(decErr_io_axi_ar_fire) begin
        rdRrPtr_2 <= (_zz_rdRrPtr_2 + 1'b1);
      end
      if(when_Axi4Crossbar_l140_10) begin
        rdQosAge_2_0 <= 4'b0000;
      end else begin
        if(when_Axi4Crossbar_l142_10) begin
          rdQosAge_2_0 <= 4'b0000;
        end else begin
          if(when_Axi4Crossbar_l145_10) begin
            rdQosAge_2_0 <= (rdQosAge_2_0 + 4'b0001);
          end
        end
      end
      if(when_Axi4Crossbar_l140_11) begin
        rdQosAge_2_1 <= 4'b0000;
      end else begin
        if(when_Axi4Crossbar_l142_11) begin
          rdQosAge_2_1 <= 4'b0000;
        end else begin
          if(when_Axi4Crossbar_l145_11) begin
            rdQosAge_2_1 <= (rdQosAge_2_1 + 4'b0001);
          end
        end
      end
      if(when_Axi4Crossbar_l636_2) begin
        _zz_when_Axi4Crossbar_l615_2 <= (_zz_when_Axi4Crossbar_l615_2 + 3'b001);
      end else begin
        if(when_Axi4Crossbar_l638_2) begin
          _zz_when_Axi4Crossbar_l615_2 <= (_zz_when_Axi4Crossbar_l615_2 - 3'b001);
        end
      end
    end
  end


endmodule

module Axi4DecErrSlave (
  input  wire          io_axi_aw_valid,
  output wire          io_axi_aw_ready,
  input  wire [31:0]   io_axi_aw_payload_addr,
  input  wire [4:0]    io_axi_aw_payload_id,
  input  wire [3:0]    io_axi_aw_payload_region,
  input  wire [7:0]    io_axi_aw_payload_len,
  input  wire [2:0]    io_axi_aw_payload_size,
  input  wire [1:0]    io_axi_aw_payload_burst,
  input  wire [0:0]    io_axi_aw_payload_lock,
  input  wire [3:0]    io_axi_aw_payload_cache,
  input  wire [3:0]    io_axi_aw_payload_qos,
  input  wire [2:0]    io_axi_aw_payload_prot,
  input  wire          io_axi_w_valid,
  output wire          io_axi_w_ready,
  input  wire [31:0]   io_axi_w_payload_data,
  input  wire [3:0]    io_axi_w_payload_strb,
  input  wire          io_axi_w_payload_last,
  output wire          io_axi_b_valid,
  input  wire          io_axi_b_ready,
  output reg  [4:0]    io_axi_b_payload_id,
  output reg  [1:0]    io_axi_b_payload_resp,
  input  wire          io_axi_ar_valid,
  output wire          io_axi_ar_ready,
  input  wire [31:0]   io_axi_ar_payload_addr,
  input  wire [4:0]    io_axi_ar_payload_id,
  input  wire [3:0]    io_axi_ar_payload_region,
  input  wire [7:0]    io_axi_ar_payload_len,
  input  wire [2:0]    io_axi_ar_payload_size,
  input  wire [1:0]    io_axi_ar_payload_burst,
  input  wire [0:0]    io_axi_ar_payload_lock,
  input  wire [3:0]    io_axi_ar_payload_cache,
  input  wire [3:0]    io_axi_ar_payload_qos,
  input  wire [2:0]    io_axi_ar_payload_prot,
  output wire          io_axi_r_valid,
  input  wire          io_axi_r_ready,
  output reg  [31:0]   io_axi_r_payload_data,
  output reg  [4:0]    io_axi_r_payload_id,
  output reg  [1:0]    io_axi_r_payload_resp,
  output reg           io_axi_r_payload_last,
  input  wire          aclk,
  input  wire          aresetn
);

  reg                 write_sinking;
  reg                 write_answering;
  reg        [4:0]    write_id;
  wire                io_axi_aw_fire;
  wire                io_axi_w_fire;
  wire                when_Axi4DecErrSlave_l59;
  wire       [6:0]    _zz_io_axi_b_payload_id;
  wire                io_axi_b_fire;
  reg                 read_busy;
  reg        [4:0]    read_id;
  reg        [7:0]    read_beatsLeft;
  wire                io_axi_ar_fire;
  wire       [39:0]   _zz_io_axi_r_payload_data;
  wire                io_axi_r_fire;
  wire                when_Axi4DecErrSlave_l97;

  assign io_axi_aw_ready = ((! write_sinking) && (! write_answering));
  assign io_axi_aw_fire = (io_axi_aw_valid && io_axi_aw_ready);
  assign io_axi_w_ready = write_sinking;
  assign io_axi_w_fire = (io_axi_w_valid && io_axi_w_ready);
  assign when_Axi4DecErrSlave_l59 = ((write_sinking && io_axi_w_fire) && io_axi_w_payload_last);
  assign io_axi_b_valid = write_answering;
  assign _zz_io_axi_b_payload_id = 7'h0;
  always @(*) begin
    io_axi_b_payload_id = _zz_io_axi_b_payload_id[4 : 0];
    io_axi_b_payload_id = write_id;
  end

  always @(*) begin
    io_axi_b_payload_resp = _zz_io_axi_b_payload_id[6 : 5];
    io_axi_b_payload_resp = 2'b11;
  end

  assign io_axi_b_fire = (io_axi_b_valid && io_axi_b_ready);
  assign io_axi_ar_ready = (! read_busy);
  assign io_axi_ar_fire = (io_axi_ar_valid && io_axi_ar_ready);
  assign io_axi_r_valid = read_busy;
  assign _zz_io_axi_r_payload_data = 40'h0;
  always @(*) begin
    io_axi_r_payload_data = _zz_io_axi_r_payload_data[31 : 0];
    io_axi_r_payload_data = 32'h0;
  end

  always @(*) begin
    io_axi_r_payload_id = _zz_io_axi_r_payload_data[36 : 32];
    io_axi_r_payload_id = read_id;
  end

  always @(*) begin
    io_axi_r_payload_resp = _zz_io_axi_r_payload_data[38 : 37];
    io_axi_r_payload_resp = 2'b11;
  end

  always @(*) begin
    io_axi_r_payload_last = _zz_io_axi_r_payload_data[39];
    io_axi_r_payload_last = (read_beatsLeft == 8'h0);
  end

  assign io_axi_r_fire = (io_axi_r_valid && io_axi_r_ready);
  assign when_Axi4DecErrSlave_l97 = (read_beatsLeft == 8'h0);
  always @(posedge aclk) begin
    if(!aresetn) begin
      write_sinking <= 1'b0;
      write_answering <= 1'b0;
      write_id <= 5'h0;
      read_busy <= 1'b0;
      read_id <= 5'h0;
      read_beatsLeft <= 8'h0;
    end else begin
      if(io_axi_aw_fire) begin
        write_sinking <= 1'b1;
        write_id <= io_axi_aw_payload_id;
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
        read_id <= io_axi_ar_payload_id;
        read_beatsLeft <= io_axi_ar_payload_len;
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
