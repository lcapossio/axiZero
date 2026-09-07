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
  input  wire [63:0]   s0_axi_wdata,
  input  wire [7:0]    s0_axi_wstrb,
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
  output wire [63:0]   s0_axi_rdata,
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
  input  wire [63:0]   s1_axi_wdata,
  input  wire [7:0]    s1_axi_wstrb,
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
  output wire [63:0]   s1_axi_rdata,
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
  output wire [63:0]   m0_axi_wdata,
  output wire [7:0]    m0_axi_wstrb,
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
  input  wire [63:0]   m0_axi_rdata,
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
  output wire [63:0]   m1_axi_wdata,
  output wire [7:0]    m1_axi_wstrb,
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
  input  wire [63:0]   m1_axi_rdata,
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
  wire       [63:0]   xbar_io_masters_0_r_payload_data;
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
  wire       [63:0]   xbar_io_masters_1_r_payload_data;
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
  wire       [63:0]   xbar_io_slaves_0_w_payload_data;
  wire       [7:0]    xbar_io_slaves_0_w_payload_strb;
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
  wire       [63:0]   xbar_io_slaves_1_w_payload_data;
  wire       [7:0]    xbar_io_slaves_1_w_payload_strb;
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
    .s0_axi_wdata    (s0_axi_wdata[63:0]      ), //i
    .s0_axi_wstrb    (s0_axi_wstrb[7:0]       ), //i
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
    .s0_axi_rdata    (xbar_io_masters_0_r_payload_data[63:0] ), //o
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
    .s1_axi_wdata    (s1_axi_wdata[63:0]      ), //i
    .s1_axi_wstrb    (s1_axi_wstrb[7:0]       ), //i
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
    .s1_axi_rdata    (xbar_io_masters_1_r_payload_data[63:0] ), //o
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
    .m0_axi_wdata     (xbar_io_slaves_0_w_payload_data[63:0]  ), //o
    .m0_axi_wstrb     (xbar_io_slaves_0_w_payload_strb[7:0]   ), //o
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
    .m0_axi_rdata     (m0_axi_rdata[63:0]       ), //i
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
    .m1_axi_wdata     (xbar_io_slaves_1_w_payload_data[63:0]  ), //o
    .m1_axi_wstrb     (xbar_io_slaves_1_w_payload_strb[7:0]   ), //o
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
    .m1_axi_rdata     (m1_axi_rdata[63:0]       ), //i
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
  input  wire [63:0]   s0_axi_wdata,
  input  wire [7:0]    s0_axi_wstrb,
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
  output reg  [63:0]   s0_axi_rdata,
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
  input  wire [63:0]   s1_axi_wdata,
  input  wire [7:0]    s1_axi_wstrb,
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
  output reg  [63:0]   s1_axi_rdata,
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
  output reg  [63:0]   m0_axi_wdata,
  output reg  [7:0]    m0_axi_wstrb,
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
  input  wire [63:0]   m0_axi_rdata,
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
  output reg  [63:0]   m1_axi_wdata,
  output reg  [7:0]    m1_axi_wstrb,
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
  input  wire [63:0]   m1_axi_rdata,
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
  reg        [63:0]   decErr_io_axi_w_payload_data;
  reg        [7:0]    decErr_io_axi_w_payload_strb;
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
  wire                decErr_io_axi_ar_ready;
  wire                decErr_io_axi_aw_ready;
  wire                decErr_io_axi_w_ready;
  wire                decErr_io_axi_r_valid;
  wire       [63:0]   decErr_io_axi_r_payload_data;
  wire       [4:0]    decErr_io_axi_r_payload_id;
  wire       [1:0]    decErr_io_axi_r_payload_resp;
  wire                decErr_io_axi_r_payload_last;
  wire                decErr_io_axi_b_valid;
  wire       [4:0]    decErr_io_axi_b_payload_id;
  wire       [1:0]    decErr_io_axi_b_payload_resp;
  wire       [2:0]    _zz__zz_when_Axi4Crossbar_l360;
  wire       [2:0]    _zz__zz_when_Axi4Crossbar_l360_1;
  wire       [1:0]    _zz__zz_when_Axi4Crossbar_l203_4;
  wire       [1:0]    _zz__zz_when_Axi4Crossbar_l203_4_1;
  wire       [2:0]    _zz__zz_when_Axi4Crossbar_l360_3;
  wire       [2:0]    _zz__zz_when_Axi4Crossbar_l360_3_1;
  wire       [1:0]    _zz__zz_when_Axi4Crossbar_l203_9;
  wire       [1:0]    _zz__zz_when_Axi4Crossbar_l203_9_1;
  wire       [2:0]    _zz__zz_when_Axi4Crossbar_l360_6;
  wire       [2:0]    _zz__zz_when_Axi4Crossbar_l360_6_1;
  wire       [1:0]    _zz__zz_when_Axi4Crossbar_l203_14;
  wire       [1:0]    _zz__zz_when_Axi4Crossbar_l203_14_1;
  wire       [2:0]    _zz__zz_when_Axi4Crossbar_l420;
  wire       [2:0]    _zz__zz_when_Axi4Crossbar_l420_1;
  wire       [1:0]    _zz__zz_when_Axi4Crossbar_l203_19;
  wire       [1:0]    _zz__zz_when_Axi4Crossbar_l203_19_1;
  wire       [2:0]    _zz__zz_when_Axi4Crossbar_l420_3;
  wire       [2:0]    _zz__zz_when_Axi4Crossbar_l420_3_1;
  wire       [1:0]    _zz__zz_when_Axi4Crossbar_l203_24;
  wire       [1:0]    _zz__zz_when_Axi4Crossbar_l203_24_1;
  wire       [2:0]    _zz__zz_when_Axi4Crossbar_l420_6;
  wire       [2:0]    _zz__zz_when_Axi4Crossbar_l420_6_1;
  wire       [1:0]    _zz__zz_when_Axi4Crossbar_l203_29;
  wire       [1:0]    _zz__zz_when_Axi4Crossbar_l203_29_1;
  reg        [0:0]    wrRrPtr_0;
  reg        [0:0]    wrRrPtr_1;
  reg        [0:0]    wrRrPtr_2;
  reg        [0:0]    rdRrPtr_0;
  reg        [0:0]    rdRrPtr_1;
  reg        [0:0]    rdRrPtr_2;
  wire       [5:0]    _zz_io_masters_0_b_payload_id;
  wire       [70:0]   _zz_io_masters_0_r_payload_data;
  wire       [5:0]    _zz_io_masters_1_b_payload_id;
  wire       [70:0]   _zz_io_masters_1_r_payload_data;
  wire       [65:0]   _zz_io_slaves_0_aw_payload_addr;
  wire       [72:0]   _zz_io_slaves_0_w_payload_data;
  wire       [65:0]   _zz_io_slaves_0_ar_payload_addr;
  wire       [65:0]   _zz_io_slaves_1_aw_payload_addr;
  wire       [72:0]   _zz_io_slaves_1_w_payload_data;
  wire       [65:0]   _zz_io_slaves_1_ar_payload_addr;
  wire       [65:0]   _zz_io_axi_aw_payload_addr;
  wire       [72:0]   _zz_io_axi_w_payload_data;
  wire       [65:0]   _zz_io_axi_ar_payload_addr;
  reg                 _zz_when_Axi4Crossbar_l345;
  reg                 _zz_when_Axi4Crossbar_l345_1;
  reg                 _zz_when_Axi4Crossbar_l345_2;
  reg        [0:0]    _zz_when_Axi4Crossbar_l386;
  reg        [0:0]    _zz_when_Axi4Crossbar_l386_1;
  reg        [0:0]    _zz_when_Axi4Crossbar_l386_2;
  reg                 _zz_when_Axi4Crossbar_l405;
  reg                 _zz_when_Axi4Crossbar_l405_1;
  reg                 _zz_when_Axi4Crossbar_l405_2;
  reg        [0:0]    _zz_when_Axi4Crossbar_l437;
  reg        [0:0]    _zz_when_Axi4Crossbar_l437_1;
  reg        [0:0]    _zz_when_Axi4Crossbar_l437_2;
  wire                when_Axi4Crossbar_l345;
  reg        [1:0]    _zz_when_Axi4Crossbar_l360;
  reg        [1:0]    _zz_when_Axi4Crossbar_l360_1;
  reg        [1:0]    _zz_when_Axi4Crossbar_l360_2;
  reg        [1:0]    _zz_when_Axi4Crossbar_l203;
  wire       [1:0]    _zz_when_Axi4Crossbar_l203_1;
  wire       [1:0]    _zz_when_Axi4Crossbar_l203_2;
  wire       [1:0]    _zz_when_Axi4Crossbar_l203_3;
  wire       [1:0]    _zz_when_Axi4Crossbar_l203_4;
  reg        [0:0]    _zz_io_slaves_0_aw_payload_id;
  wire                when_Axi4Crossbar_l203;
  wire                when_Axi4Crossbar_l203_1;
  wire                when_Axi4Crossbar_l360;
  wire                when_Axi4Crossbar_l363;
  wire                when_Axi4Crossbar_l363_1;
  wire                io_slaves_0_aw_fire;
  wire                when_Axi4Crossbar_l386;
  wire                when_Axi4Crossbar_l386_1;
  wire                io_slaves_0_b_fire;
  wire                when_Axi4Crossbar_l345_1;
  reg        [1:0]    _zz_when_Axi4Crossbar_l360_3;
  reg        [1:0]    _zz_when_Axi4Crossbar_l360_4;
  reg        [1:0]    _zz_when_Axi4Crossbar_l360_5;
  reg        [1:0]    _zz_when_Axi4Crossbar_l203_5;
  wire       [1:0]    _zz_when_Axi4Crossbar_l203_6;
  wire       [1:0]    _zz_when_Axi4Crossbar_l203_7;
  wire       [1:0]    _zz_when_Axi4Crossbar_l203_8;
  wire       [1:0]    _zz_when_Axi4Crossbar_l203_9;
  reg        [0:0]    _zz_io_slaves_1_aw_payload_id;
  wire                when_Axi4Crossbar_l203_2;
  wire                when_Axi4Crossbar_l203_3;
  wire                when_Axi4Crossbar_l360_1;
  wire                when_Axi4Crossbar_l363_2;
  wire                when_Axi4Crossbar_l363_3;
  wire                io_slaves_1_aw_fire;
  wire                when_Axi4Crossbar_l386_2;
  wire                when_Axi4Crossbar_l386_3;
  wire                io_slaves_1_b_fire;
  wire                when_Axi4Crossbar_l345_2;
  reg        [1:0]    _zz_when_Axi4Crossbar_l360_6;
  reg        [1:0]    _zz_when_Axi4Crossbar_l360_7;
  reg        [1:0]    _zz_when_Axi4Crossbar_l360_8;
  reg        [1:0]    _zz_when_Axi4Crossbar_l203_10;
  wire       [1:0]    _zz_when_Axi4Crossbar_l203_11;
  wire       [1:0]    _zz_when_Axi4Crossbar_l203_12;
  wire       [1:0]    _zz_when_Axi4Crossbar_l203_13;
  wire       [1:0]    _zz_when_Axi4Crossbar_l203_14;
  reg        [0:0]    _zz_wrRrPtr_2;
  wire                when_Axi4Crossbar_l203_4;
  wire                when_Axi4Crossbar_l203_5;
  wire                when_Axi4Crossbar_l360_2;
  wire                when_Axi4Crossbar_l363_4;
  wire                when_Axi4Crossbar_l363_5;
  wire                decErr_io_axi_aw_fire;
  wire                when_Axi4Crossbar_l386_4;
  wire                when_Axi4Crossbar_l386_5;
  wire                decErr_io_axi_b_fire;
  wire                when_Axi4Crossbar_l405;
  reg        [1:0]    _zz_when_Axi4Crossbar_l420;
  reg        [1:0]    _zz_when_Axi4Crossbar_l420_1;
  reg        [1:0]    _zz_when_Axi4Crossbar_l420_2;
  reg        [1:0]    _zz_when_Axi4Crossbar_l203_15;
  wire       [1:0]    _zz_when_Axi4Crossbar_l203_16;
  wire       [1:0]    _zz_when_Axi4Crossbar_l203_17;
  wire       [1:0]    _zz_when_Axi4Crossbar_l203_18;
  wire       [1:0]    _zz_when_Axi4Crossbar_l203_19;
  reg        [0:0]    _zz_io_slaves_0_ar_payload_id;
  wire                when_Axi4Crossbar_l203_6;
  wire                when_Axi4Crossbar_l203_7;
  wire                when_Axi4Crossbar_l420;
  wire                when_Axi4Crossbar_l423;
  wire                when_Axi4Crossbar_l423_1;
  wire                io_slaves_0_ar_fire;
  wire                when_Axi4Crossbar_l437;
  wire                when_Axi4Crossbar_l437_1;
  wire                io_slaves_0_r_fire;
  wire                when_Axi4Crossbar_l447;
  wire                when_Axi4Crossbar_l405_1;
  reg        [1:0]    _zz_when_Axi4Crossbar_l420_3;
  reg        [1:0]    _zz_when_Axi4Crossbar_l420_4;
  reg        [1:0]    _zz_when_Axi4Crossbar_l420_5;
  reg        [1:0]    _zz_when_Axi4Crossbar_l203_20;
  wire       [1:0]    _zz_when_Axi4Crossbar_l203_21;
  wire       [1:0]    _zz_when_Axi4Crossbar_l203_22;
  wire       [1:0]    _zz_when_Axi4Crossbar_l203_23;
  wire       [1:0]    _zz_when_Axi4Crossbar_l203_24;
  reg        [0:0]    _zz_io_slaves_1_ar_payload_id;
  wire                when_Axi4Crossbar_l203_8;
  wire                when_Axi4Crossbar_l203_9;
  wire                when_Axi4Crossbar_l420_1;
  wire                when_Axi4Crossbar_l423_2;
  wire                when_Axi4Crossbar_l423_3;
  wire                io_slaves_1_ar_fire;
  wire                when_Axi4Crossbar_l437_2;
  wire                when_Axi4Crossbar_l437_3;
  wire                io_slaves_1_r_fire;
  wire                when_Axi4Crossbar_l447_1;
  wire                when_Axi4Crossbar_l405_2;
  reg        [1:0]    _zz_when_Axi4Crossbar_l420_6;
  reg        [1:0]    _zz_when_Axi4Crossbar_l420_7;
  reg        [1:0]    _zz_when_Axi4Crossbar_l420_8;
  reg        [1:0]    _zz_when_Axi4Crossbar_l203_25;
  wire       [1:0]    _zz_when_Axi4Crossbar_l203_26;
  wire       [1:0]    _zz_when_Axi4Crossbar_l203_27;
  wire       [1:0]    _zz_when_Axi4Crossbar_l203_28;
  wire       [1:0]    _zz_when_Axi4Crossbar_l203_29;
  reg        [0:0]    _zz_rdRrPtr_2;
  wire                when_Axi4Crossbar_l203_10;
  wire                when_Axi4Crossbar_l203_11;
  wire                when_Axi4Crossbar_l420_2;
  wire                when_Axi4Crossbar_l423_4;
  wire                when_Axi4Crossbar_l423_5;
  wire                decErr_io_axi_ar_fire;
  wire                when_Axi4Crossbar_l437_4;
  wire                when_Axi4Crossbar_l437_5;
  wire                decErr_io_axi_r_fire;
  wire                when_Axi4Crossbar_l447_2;

  assign _zz__zz_when_Axi4Crossbar_l360 = {(! (|_zz_when_Axi4Crossbar_l360_1)),_zz_when_Axi4Crossbar_l360_1};
  assign _zz__zz_when_Axi4Crossbar_l360_1 = {(! (|_zz_when_Axi4Crossbar_l360_2)),_zz_when_Axi4Crossbar_l360_2};
  assign _zz__zz_when_Axi4Crossbar_l203_4 = (_zz_when_Axi4Crossbar_l203_2 - 2'b01);
  assign _zz__zz_when_Axi4Crossbar_l203_4_1 = (_zz_when_Axi4Crossbar_l203_3 - 2'b01);
  assign _zz__zz_when_Axi4Crossbar_l360_3 = {(! (|_zz_when_Axi4Crossbar_l360_4)),_zz_when_Axi4Crossbar_l360_4};
  assign _zz__zz_when_Axi4Crossbar_l360_3_1 = {(! (|_zz_when_Axi4Crossbar_l360_5)),_zz_when_Axi4Crossbar_l360_5};
  assign _zz__zz_when_Axi4Crossbar_l203_9 = (_zz_when_Axi4Crossbar_l203_7 - 2'b01);
  assign _zz__zz_when_Axi4Crossbar_l203_9_1 = (_zz_when_Axi4Crossbar_l203_8 - 2'b01);
  assign _zz__zz_when_Axi4Crossbar_l360_6 = {(! (|_zz_when_Axi4Crossbar_l360_7)),_zz_when_Axi4Crossbar_l360_7};
  assign _zz__zz_when_Axi4Crossbar_l360_6_1 = {(! (|_zz_when_Axi4Crossbar_l360_8)),_zz_when_Axi4Crossbar_l360_8};
  assign _zz__zz_when_Axi4Crossbar_l203_14 = (_zz_when_Axi4Crossbar_l203_12 - 2'b01);
  assign _zz__zz_when_Axi4Crossbar_l203_14_1 = (_zz_when_Axi4Crossbar_l203_13 - 2'b01);
  assign _zz__zz_when_Axi4Crossbar_l420 = {(! (|_zz_when_Axi4Crossbar_l420_1)),_zz_when_Axi4Crossbar_l420_1};
  assign _zz__zz_when_Axi4Crossbar_l420_1 = {(! (|_zz_when_Axi4Crossbar_l420_2)),_zz_when_Axi4Crossbar_l420_2};
  assign _zz__zz_when_Axi4Crossbar_l203_19 = (_zz_when_Axi4Crossbar_l203_17 - 2'b01);
  assign _zz__zz_when_Axi4Crossbar_l203_19_1 = (_zz_when_Axi4Crossbar_l203_18 - 2'b01);
  assign _zz__zz_when_Axi4Crossbar_l420_3 = {(! (|_zz_when_Axi4Crossbar_l420_4)),_zz_when_Axi4Crossbar_l420_4};
  assign _zz__zz_when_Axi4Crossbar_l420_3_1 = {(! (|_zz_when_Axi4Crossbar_l420_5)),_zz_when_Axi4Crossbar_l420_5};
  assign _zz__zz_when_Axi4Crossbar_l203_24 = (_zz_when_Axi4Crossbar_l203_22 - 2'b01);
  assign _zz__zz_when_Axi4Crossbar_l203_24_1 = (_zz_when_Axi4Crossbar_l203_23 - 2'b01);
  assign _zz__zz_when_Axi4Crossbar_l420_6 = {(! (|_zz_when_Axi4Crossbar_l420_7)),_zz_when_Axi4Crossbar_l420_7};
  assign _zz__zz_when_Axi4Crossbar_l420_6_1 = {(! (|_zz_when_Axi4Crossbar_l420_8)),_zz_when_Axi4Crossbar_l420_8};
  assign _zz__zz_when_Axi4Crossbar_l203_29 = (_zz_when_Axi4Crossbar_l203_27 - 2'b01);
  assign _zz__zz_when_Axi4Crossbar_l203_29_1 = (_zz_when_Axi4Crossbar_l203_28 - 2'b01);
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
    .io_axi_w_payload_data    (decErr_io_axi_w_payload_data[63:0]  ), //i
    .io_axi_w_payload_strb    (decErr_io_axi_w_payload_strb[7:0]   ), //i
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
    .io_axi_r_payload_data    (decErr_io_axi_r_payload_data[63:0]  ), //o
    .io_axi_r_payload_id      (decErr_io_axi_r_payload_id[4:0]     ), //o
    .io_axi_r_payload_resp    (decErr_io_axi_r_payload_resp[1:0]   ), //o
    .io_axi_r_payload_last    (decErr_io_axi_r_payload_last        ), //o
    .aclk                      (aclk                                 ), //i
    .aresetn                   (aresetn                              )  //i
  );
  always @(*) begin
    s0_axi_awready = 1'b0;
    if(when_Axi4Crossbar_l345) begin
      if(when_Axi4Crossbar_l360) begin
        if(when_Axi4Crossbar_l363) begin
          s0_axi_awready = m0_axi_awready;
        end
      end
    end
    if(when_Axi4Crossbar_l345_1) begin
      if(when_Axi4Crossbar_l360_1) begin
        if(when_Axi4Crossbar_l363_2) begin
          s0_axi_awready = m1_axi_awready;
        end
      end
    end
    if(when_Axi4Crossbar_l345_2) begin
      if(when_Axi4Crossbar_l360_2) begin
        if(when_Axi4Crossbar_l363_4) begin
          s0_axi_awready = decErr_io_axi_aw_ready;
        end
      end
    end
  end

  always @(*) begin
    s0_axi_wready = 1'b0;
    if(when_Axi4Crossbar_l345) begin
      if(when_Axi4Crossbar_l360) begin
        if(when_Axi4Crossbar_l363) begin
          s0_axi_wready = m0_axi_wready;
        end
      end
    end else begin
      if(when_Axi4Crossbar_l386) begin
        s0_axi_wready = m0_axi_wready;
      end
    end
    if(when_Axi4Crossbar_l345_1) begin
      if(when_Axi4Crossbar_l360_1) begin
        if(when_Axi4Crossbar_l363_2) begin
          s0_axi_wready = m1_axi_wready;
        end
      end
    end else begin
      if(when_Axi4Crossbar_l386_2) begin
        s0_axi_wready = m1_axi_wready;
      end
    end
    if(when_Axi4Crossbar_l345_2) begin
      if(when_Axi4Crossbar_l360_2) begin
        if(when_Axi4Crossbar_l363_4) begin
          s0_axi_wready = decErr_io_axi_w_ready;
        end
      end
    end else begin
      if(when_Axi4Crossbar_l386_4) begin
        s0_axi_wready = decErr_io_axi_w_ready;
      end
    end
  end

  always @(*) begin
    s0_axi_bvalid = 1'b0;
    if(!when_Axi4Crossbar_l345) begin
      if(when_Axi4Crossbar_l386) begin
        s0_axi_bvalid = m0_axi_bvalid;
      end
    end
    if(!when_Axi4Crossbar_l345_1) begin
      if(when_Axi4Crossbar_l386_2) begin
        s0_axi_bvalid = m1_axi_bvalid;
      end
    end
    if(!when_Axi4Crossbar_l345_2) begin
      if(when_Axi4Crossbar_l386_4) begin
        s0_axi_bvalid = decErr_io_axi_b_valid;
      end
    end
  end

  assign _zz_io_masters_0_b_payload_id = 6'h0;
  always @(*) begin
    s0_axi_bid = _zz_io_masters_0_b_payload_id[3 : 0];
    if(!when_Axi4Crossbar_l345) begin
      if(when_Axi4Crossbar_l386) begin
        s0_axi_bid = m0_axi_bid[3 : 0];
      end
    end
    if(!when_Axi4Crossbar_l345_1) begin
      if(when_Axi4Crossbar_l386_2) begin
        s0_axi_bid = m1_axi_bid[3 : 0];
      end
    end
    if(!when_Axi4Crossbar_l345_2) begin
      if(when_Axi4Crossbar_l386_4) begin
        s0_axi_bid = decErr_io_axi_b_payload_id[3 : 0];
      end
    end
  end

  always @(*) begin
    s0_axi_bresp = _zz_io_masters_0_b_payload_id[5 : 4];
    if(!when_Axi4Crossbar_l345) begin
      if(when_Axi4Crossbar_l386) begin
        s0_axi_bresp = m0_axi_bresp;
      end
    end
    if(!when_Axi4Crossbar_l345_1) begin
      if(when_Axi4Crossbar_l386_2) begin
        s0_axi_bresp = m1_axi_bresp;
      end
    end
    if(!when_Axi4Crossbar_l345_2) begin
      if(when_Axi4Crossbar_l386_4) begin
        s0_axi_bresp = decErr_io_axi_b_payload_resp;
      end
    end
  end

  always @(*) begin
    s0_axi_arready = 1'b0;
    if(when_Axi4Crossbar_l405) begin
      if(when_Axi4Crossbar_l420) begin
        if(when_Axi4Crossbar_l423) begin
          s0_axi_arready = m0_axi_arready;
        end
      end
    end
    if(when_Axi4Crossbar_l405_1) begin
      if(when_Axi4Crossbar_l420_1) begin
        if(when_Axi4Crossbar_l423_2) begin
          s0_axi_arready = m1_axi_arready;
        end
      end
    end
    if(when_Axi4Crossbar_l405_2) begin
      if(when_Axi4Crossbar_l420_2) begin
        if(when_Axi4Crossbar_l423_4) begin
          s0_axi_arready = decErr_io_axi_ar_ready;
        end
      end
    end
  end

  always @(*) begin
    s0_axi_rvalid = 1'b0;
    if(!when_Axi4Crossbar_l405) begin
      if(when_Axi4Crossbar_l437) begin
        s0_axi_rvalid = m0_axi_rvalid;
      end
    end
    if(!when_Axi4Crossbar_l405_1) begin
      if(when_Axi4Crossbar_l437_2) begin
        s0_axi_rvalid = m1_axi_rvalid;
      end
    end
    if(!when_Axi4Crossbar_l405_2) begin
      if(when_Axi4Crossbar_l437_4) begin
        s0_axi_rvalid = decErr_io_axi_r_valid;
      end
    end
  end

  assign _zz_io_masters_0_r_payload_data = 71'h0;
  always @(*) begin
    s0_axi_rdata = _zz_io_masters_0_r_payload_data[63 : 0];
    if(!when_Axi4Crossbar_l405) begin
      if(when_Axi4Crossbar_l437) begin
        s0_axi_rdata = m0_axi_rdata;
      end
    end
    if(!when_Axi4Crossbar_l405_1) begin
      if(when_Axi4Crossbar_l437_2) begin
        s0_axi_rdata = m1_axi_rdata;
      end
    end
    if(!when_Axi4Crossbar_l405_2) begin
      if(when_Axi4Crossbar_l437_4) begin
        s0_axi_rdata = decErr_io_axi_r_payload_data;
      end
    end
  end

  always @(*) begin
    s0_axi_rid = _zz_io_masters_0_r_payload_data[67 : 64];
    if(!when_Axi4Crossbar_l405) begin
      if(when_Axi4Crossbar_l437) begin
        s0_axi_rid = m0_axi_rid[3 : 0];
      end
    end
    if(!when_Axi4Crossbar_l405_1) begin
      if(when_Axi4Crossbar_l437_2) begin
        s0_axi_rid = m1_axi_rid[3 : 0];
      end
    end
    if(!when_Axi4Crossbar_l405_2) begin
      if(when_Axi4Crossbar_l437_4) begin
        s0_axi_rid = decErr_io_axi_r_payload_id[3 : 0];
      end
    end
  end

  always @(*) begin
    s0_axi_rresp = _zz_io_masters_0_r_payload_data[69 : 68];
    if(!when_Axi4Crossbar_l405) begin
      if(when_Axi4Crossbar_l437) begin
        s0_axi_rresp = m0_axi_rresp;
      end
    end
    if(!when_Axi4Crossbar_l405_1) begin
      if(when_Axi4Crossbar_l437_2) begin
        s0_axi_rresp = m1_axi_rresp;
      end
    end
    if(!when_Axi4Crossbar_l405_2) begin
      if(when_Axi4Crossbar_l437_4) begin
        s0_axi_rresp = decErr_io_axi_r_payload_resp;
      end
    end
  end

  always @(*) begin
    s0_axi_rlast = _zz_io_masters_0_r_payload_data[70];
    if(!when_Axi4Crossbar_l405) begin
      if(when_Axi4Crossbar_l437) begin
        s0_axi_rlast = m0_axi_rlast;
      end
    end
    if(!when_Axi4Crossbar_l405_1) begin
      if(when_Axi4Crossbar_l437_2) begin
        s0_axi_rlast = m1_axi_rlast;
      end
    end
    if(!when_Axi4Crossbar_l405_2) begin
      if(when_Axi4Crossbar_l437_4) begin
        s0_axi_rlast = decErr_io_axi_r_payload_last;
      end
    end
  end

  always @(*) begin
    s1_axi_awready = 1'b0;
    if(when_Axi4Crossbar_l345) begin
      if(when_Axi4Crossbar_l360) begin
        if(when_Axi4Crossbar_l363_1) begin
          s1_axi_awready = m0_axi_awready;
        end
      end
    end
    if(when_Axi4Crossbar_l345_1) begin
      if(when_Axi4Crossbar_l360_1) begin
        if(when_Axi4Crossbar_l363_3) begin
          s1_axi_awready = m1_axi_awready;
        end
      end
    end
    if(when_Axi4Crossbar_l345_2) begin
      if(when_Axi4Crossbar_l360_2) begin
        if(when_Axi4Crossbar_l363_5) begin
          s1_axi_awready = decErr_io_axi_aw_ready;
        end
      end
    end
  end

  always @(*) begin
    s1_axi_wready = 1'b0;
    if(when_Axi4Crossbar_l345) begin
      if(when_Axi4Crossbar_l360) begin
        if(when_Axi4Crossbar_l363_1) begin
          s1_axi_wready = m0_axi_wready;
        end
      end
    end else begin
      if(when_Axi4Crossbar_l386_1) begin
        s1_axi_wready = m0_axi_wready;
      end
    end
    if(when_Axi4Crossbar_l345_1) begin
      if(when_Axi4Crossbar_l360_1) begin
        if(when_Axi4Crossbar_l363_3) begin
          s1_axi_wready = m1_axi_wready;
        end
      end
    end else begin
      if(when_Axi4Crossbar_l386_3) begin
        s1_axi_wready = m1_axi_wready;
      end
    end
    if(when_Axi4Crossbar_l345_2) begin
      if(when_Axi4Crossbar_l360_2) begin
        if(when_Axi4Crossbar_l363_5) begin
          s1_axi_wready = decErr_io_axi_w_ready;
        end
      end
    end else begin
      if(when_Axi4Crossbar_l386_5) begin
        s1_axi_wready = decErr_io_axi_w_ready;
      end
    end
  end

  always @(*) begin
    s1_axi_bvalid = 1'b0;
    if(!when_Axi4Crossbar_l345) begin
      if(when_Axi4Crossbar_l386_1) begin
        s1_axi_bvalid = m0_axi_bvalid;
      end
    end
    if(!when_Axi4Crossbar_l345_1) begin
      if(when_Axi4Crossbar_l386_3) begin
        s1_axi_bvalid = m1_axi_bvalid;
      end
    end
    if(!when_Axi4Crossbar_l345_2) begin
      if(when_Axi4Crossbar_l386_5) begin
        s1_axi_bvalid = decErr_io_axi_b_valid;
      end
    end
  end

  assign _zz_io_masters_1_b_payload_id = 6'h0;
  always @(*) begin
    s1_axi_bid = _zz_io_masters_1_b_payload_id[3 : 0];
    if(!when_Axi4Crossbar_l345) begin
      if(when_Axi4Crossbar_l386_1) begin
        s1_axi_bid = m0_axi_bid[3 : 0];
      end
    end
    if(!when_Axi4Crossbar_l345_1) begin
      if(when_Axi4Crossbar_l386_3) begin
        s1_axi_bid = m1_axi_bid[3 : 0];
      end
    end
    if(!when_Axi4Crossbar_l345_2) begin
      if(when_Axi4Crossbar_l386_5) begin
        s1_axi_bid = decErr_io_axi_b_payload_id[3 : 0];
      end
    end
  end

  always @(*) begin
    s1_axi_bresp = _zz_io_masters_1_b_payload_id[5 : 4];
    if(!when_Axi4Crossbar_l345) begin
      if(when_Axi4Crossbar_l386_1) begin
        s1_axi_bresp = m0_axi_bresp;
      end
    end
    if(!when_Axi4Crossbar_l345_1) begin
      if(when_Axi4Crossbar_l386_3) begin
        s1_axi_bresp = m1_axi_bresp;
      end
    end
    if(!when_Axi4Crossbar_l345_2) begin
      if(when_Axi4Crossbar_l386_5) begin
        s1_axi_bresp = decErr_io_axi_b_payload_resp;
      end
    end
  end

  always @(*) begin
    s1_axi_arready = 1'b0;
    if(when_Axi4Crossbar_l405) begin
      if(when_Axi4Crossbar_l420) begin
        if(when_Axi4Crossbar_l423_1) begin
          s1_axi_arready = m0_axi_arready;
        end
      end
    end
    if(when_Axi4Crossbar_l405_1) begin
      if(when_Axi4Crossbar_l420_1) begin
        if(when_Axi4Crossbar_l423_3) begin
          s1_axi_arready = m1_axi_arready;
        end
      end
    end
    if(when_Axi4Crossbar_l405_2) begin
      if(when_Axi4Crossbar_l420_2) begin
        if(when_Axi4Crossbar_l423_5) begin
          s1_axi_arready = decErr_io_axi_ar_ready;
        end
      end
    end
  end

  always @(*) begin
    s1_axi_rvalid = 1'b0;
    if(!when_Axi4Crossbar_l405) begin
      if(when_Axi4Crossbar_l437_1) begin
        s1_axi_rvalid = m0_axi_rvalid;
      end
    end
    if(!when_Axi4Crossbar_l405_1) begin
      if(when_Axi4Crossbar_l437_3) begin
        s1_axi_rvalid = m1_axi_rvalid;
      end
    end
    if(!when_Axi4Crossbar_l405_2) begin
      if(when_Axi4Crossbar_l437_5) begin
        s1_axi_rvalid = decErr_io_axi_r_valid;
      end
    end
  end

  assign _zz_io_masters_1_r_payload_data = 71'h0;
  always @(*) begin
    s1_axi_rdata = _zz_io_masters_1_r_payload_data[63 : 0];
    if(!when_Axi4Crossbar_l405) begin
      if(when_Axi4Crossbar_l437_1) begin
        s1_axi_rdata = m0_axi_rdata;
      end
    end
    if(!when_Axi4Crossbar_l405_1) begin
      if(when_Axi4Crossbar_l437_3) begin
        s1_axi_rdata = m1_axi_rdata;
      end
    end
    if(!when_Axi4Crossbar_l405_2) begin
      if(when_Axi4Crossbar_l437_5) begin
        s1_axi_rdata = decErr_io_axi_r_payload_data;
      end
    end
  end

  always @(*) begin
    s1_axi_rid = _zz_io_masters_1_r_payload_data[67 : 64];
    if(!when_Axi4Crossbar_l405) begin
      if(when_Axi4Crossbar_l437_1) begin
        s1_axi_rid = m0_axi_rid[3 : 0];
      end
    end
    if(!when_Axi4Crossbar_l405_1) begin
      if(when_Axi4Crossbar_l437_3) begin
        s1_axi_rid = m1_axi_rid[3 : 0];
      end
    end
    if(!when_Axi4Crossbar_l405_2) begin
      if(when_Axi4Crossbar_l437_5) begin
        s1_axi_rid = decErr_io_axi_r_payload_id[3 : 0];
      end
    end
  end

  always @(*) begin
    s1_axi_rresp = _zz_io_masters_1_r_payload_data[69 : 68];
    if(!when_Axi4Crossbar_l405) begin
      if(when_Axi4Crossbar_l437_1) begin
        s1_axi_rresp = m0_axi_rresp;
      end
    end
    if(!when_Axi4Crossbar_l405_1) begin
      if(when_Axi4Crossbar_l437_3) begin
        s1_axi_rresp = m1_axi_rresp;
      end
    end
    if(!when_Axi4Crossbar_l405_2) begin
      if(when_Axi4Crossbar_l437_5) begin
        s1_axi_rresp = decErr_io_axi_r_payload_resp;
      end
    end
  end

  always @(*) begin
    s1_axi_rlast = _zz_io_masters_1_r_payload_data[70];
    if(!when_Axi4Crossbar_l405) begin
      if(when_Axi4Crossbar_l437_1) begin
        s1_axi_rlast = m0_axi_rlast;
      end
    end
    if(!when_Axi4Crossbar_l405_1) begin
      if(when_Axi4Crossbar_l437_3) begin
        s1_axi_rlast = m1_axi_rlast;
      end
    end
    if(!when_Axi4Crossbar_l405_2) begin
      if(when_Axi4Crossbar_l437_5) begin
        s1_axi_rlast = decErr_io_axi_r_payload_last;
      end
    end
  end

  always @(*) begin
    m0_axi_awvalid = 1'b0;
    if(when_Axi4Crossbar_l345) begin
      if(when_Axi4Crossbar_l360) begin
        m0_axi_awvalid = 1'b1;
      end
    end
  end

  assign _zz_io_slaves_0_aw_payload_addr = 66'h0;
  always @(*) begin
    m0_axi_awaddr = _zz_io_slaves_0_aw_payload_addr[31 : 0];
    if(when_Axi4Crossbar_l345) begin
      if(when_Axi4Crossbar_l360) begin
        if(when_Axi4Crossbar_l363) begin
          m0_axi_awaddr = s0_axi_awaddr;
        end
        if(when_Axi4Crossbar_l363_1) begin
          m0_axi_awaddr = s1_axi_awaddr;
        end
      end
    end
  end

  always @(*) begin
    m0_axi_awid = _zz_io_slaves_0_aw_payload_addr[36 : 32];
    if(when_Axi4Crossbar_l345) begin
      if(when_Axi4Crossbar_l360) begin
        if(when_Axi4Crossbar_l363) begin
          m0_axi_awid = {_zz_io_slaves_0_aw_payload_id,s0_axi_awid};
        end
        if(when_Axi4Crossbar_l363_1) begin
          m0_axi_awid = {_zz_io_slaves_0_aw_payload_id,s1_axi_awid};
        end
      end
    end
  end

  assign m0_axi_awregion = _zz_io_slaves_0_aw_payload_addr[40 : 37];
  always @(*) begin
    m0_axi_awlen = _zz_io_slaves_0_aw_payload_addr[48 : 41];
    if(when_Axi4Crossbar_l345) begin
      if(when_Axi4Crossbar_l360) begin
        if(when_Axi4Crossbar_l363) begin
          m0_axi_awlen = s0_axi_awlen;
        end
        if(when_Axi4Crossbar_l363_1) begin
          m0_axi_awlen = s1_axi_awlen;
        end
      end
    end
  end

  always @(*) begin
    m0_axi_awsize = _zz_io_slaves_0_aw_payload_addr[51 : 49];
    if(when_Axi4Crossbar_l345) begin
      if(when_Axi4Crossbar_l360) begin
        if(when_Axi4Crossbar_l363) begin
          m0_axi_awsize = s0_axi_awsize;
        end
        if(when_Axi4Crossbar_l363_1) begin
          m0_axi_awsize = s1_axi_awsize;
        end
      end
    end
  end

  always @(*) begin
    m0_axi_awburst = _zz_io_slaves_0_aw_payload_addr[53 : 52];
    if(when_Axi4Crossbar_l345) begin
      if(when_Axi4Crossbar_l360) begin
        if(when_Axi4Crossbar_l363) begin
          m0_axi_awburst = s0_axi_awburst;
        end
        if(when_Axi4Crossbar_l363_1) begin
          m0_axi_awburst = s1_axi_awburst;
        end
      end
    end
  end

  always @(*) begin
    m0_axi_awlock = _zz_io_slaves_0_aw_payload_addr[54 : 54];
    if(when_Axi4Crossbar_l345) begin
      if(when_Axi4Crossbar_l360) begin
        if(when_Axi4Crossbar_l363) begin
          m0_axi_awlock = s0_axi_awlock;
        end
        if(when_Axi4Crossbar_l363_1) begin
          m0_axi_awlock = s1_axi_awlock;
        end
      end
    end
  end

  always @(*) begin
    m0_axi_awcache = _zz_io_slaves_0_aw_payload_addr[58 : 55];
    if(when_Axi4Crossbar_l345) begin
      if(when_Axi4Crossbar_l360) begin
        if(when_Axi4Crossbar_l363) begin
          m0_axi_awcache = s0_axi_awcache;
        end
        if(when_Axi4Crossbar_l363_1) begin
          m0_axi_awcache = s1_axi_awcache;
        end
      end
    end
  end

  always @(*) begin
    m0_axi_awqos = _zz_io_slaves_0_aw_payload_addr[62 : 59];
    if(when_Axi4Crossbar_l345) begin
      if(when_Axi4Crossbar_l360) begin
        if(when_Axi4Crossbar_l363) begin
          m0_axi_awqos = s0_axi_awqos;
        end
        if(when_Axi4Crossbar_l363_1) begin
          m0_axi_awqos = s1_axi_awqos;
        end
      end
    end
  end

  always @(*) begin
    m0_axi_awprot = _zz_io_slaves_0_aw_payload_addr[65 : 63];
    if(when_Axi4Crossbar_l345) begin
      if(when_Axi4Crossbar_l360) begin
        if(when_Axi4Crossbar_l363) begin
          m0_axi_awprot = s0_axi_awprot;
        end
        if(when_Axi4Crossbar_l363_1) begin
          m0_axi_awprot = s1_axi_awprot;
        end
      end
    end
  end

  always @(*) begin
    m0_axi_wvalid = 1'b0;
    if(when_Axi4Crossbar_l345) begin
      if(when_Axi4Crossbar_l360) begin
        if(when_Axi4Crossbar_l363) begin
          m0_axi_wvalid = s0_axi_wvalid;
        end
        if(when_Axi4Crossbar_l363_1) begin
          m0_axi_wvalid = s1_axi_wvalid;
        end
      end
    end else begin
      if(when_Axi4Crossbar_l386) begin
        m0_axi_wvalid = s0_axi_wvalid;
      end
      if(when_Axi4Crossbar_l386_1) begin
        m0_axi_wvalid = s1_axi_wvalid;
      end
    end
  end

  assign _zz_io_slaves_0_w_payload_data = 73'h0;
  always @(*) begin
    m0_axi_wdata = _zz_io_slaves_0_w_payload_data[63 : 0];
    if(when_Axi4Crossbar_l345) begin
      if(when_Axi4Crossbar_l360) begin
        if(when_Axi4Crossbar_l363) begin
          m0_axi_wdata = s0_axi_wdata;
        end
        if(when_Axi4Crossbar_l363_1) begin
          m0_axi_wdata = s1_axi_wdata;
        end
      end
    end else begin
      if(when_Axi4Crossbar_l386) begin
        m0_axi_wdata = s0_axi_wdata;
      end
      if(when_Axi4Crossbar_l386_1) begin
        m0_axi_wdata = s1_axi_wdata;
      end
    end
  end

  always @(*) begin
    m0_axi_wstrb = _zz_io_slaves_0_w_payload_data[71 : 64];
    if(when_Axi4Crossbar_l345) begin
      if(when_Axi4Crossbar_l360) begin
        if(when_Axi4Crossbar_l363) begin
          m0_axi_wstrb = s0_axi_wstrb;
        end
        if(when_Axi4Crossbar_l363_1) begin
          m0_axi_wstrb = s1_axi_wstrb;
        end
      end
    end else begin
      if(when_Axi4Crossbar_l386) begin
        m0_axi_wstrb = s0_axi_wstrb;
      end
      if(when_Axi4Crossbar_l386_1) begin
        m0_axi_wstrb = s1_axi_wstrb;
      end
    end
  end

  always @(*) begin
    m0_axi_wlast = _zz_io_slaves_0_w_payload_data[72];
    if(when_Axi4Crossbar_l345) begin
      if(when_Axi4Crossbar_l360) begin
        if(when_Axi4Crossbar_l363) begin
          m0_axi_wlast = s0_axi_wlast;
        end
        if(when_Axi4Crossbar_l363_1) begin
          m0_axi_wlast = s1_axi_wlast;
        end
      end
    end else begin
      if(when_Axi4Crossbar_l386) begin
        m0_axi_wlast = s0_axi_wlast;
      end
      if(when_Axi4Crossbar_l386_1) begin
        m0_axi_wlast = s1_axi_wlast;
      end
    end
  end

  always @(*) begin
    m0_axi_bready = 1'b0;
    if(!when_Axi4Crossbar_l345) begin
      if(when_Axi4Crossbar_l386) begin
        m0_axi_bready = s0_axi_bready;
      end
      if(when_Axi4Crossbar_l386_1) begin
        m0_axi_bready = s1_axi_bready;
      end
    end
  end

  always @(*) begin
    m0_axi_arvalid = 1'b0;
    if(when_Axi4Crossbar_l405) begin
      if(when_Axi4Crossbar_l420) begin
        m0_axi_arvalid = 1'b1;
      end
    end
  end

  assign _zz_io_slaves_0_ar_payload_addr = 66'h0;
  always @(*) begin
    m0_axi_araddr = _zz_io_slaves_0_ar_payload_addr[31 : 0];
    if(when_Axi4Crossbar_l405) begin
      if(when_Axi4Crossbar_l420) begin
        if(when_Axi4Crossbar_l423) begin
          m0_axi_araddr = s0_axi_araddr;
        end
        if(when_Axi4Crossbar_l423_1) begin
          m0_axi_araddr = s1_axi_araddr;
        end
      end
    end
  end

  always @(*) begin
    m0_axi_arid = _zz_io_slaves_0_ar_payload_addr[36 : 32];
    if(when_Axi4Crossbar_l405) begin
      if(when_Axi4Crossbar_l420) begin
        if(when_Axi4Crossbar_l423) begin
          m0_axi_arid = {_zz_io_slaves_0_ar_payload_id,s0_axi_arid};
        end
        if(when_Axi4Crossbar_l423_1) begin
          m0_axi_arid = {_zz_io_slaves_0_ar_payload_id,s1_axi_arid};
        end
      end
    end
  end

  assign m0_axi_arregion = _zz_io_slaves_0_ar_payload_addr[40 : 37];
  always @(*) begin
    m0_axi_arlen = _zz_io_slaves_0_ar_payload_addr[48 : 41];
    if(when_Axi4Crossbar_l405) begin
      if(when_Axi4Crossbar_l420) begin
        if(when_Axi4Crossbar_l423) begin
          m0_axi_arlen = s0_axi_arlen;
        end
        if(when_Axi4Crossbar_l423_1) begin
          m0_axi_arlen = s1_axi_arlen;
        end
      end
    end
  end

  always @(*) begin
    m0_axi_arsize = _zz_io_slaves_0_ar_payload_addr[51 : 49];
    if(when_Axi4Crossbar_l405) begin
      if(when_Axi4Crossbar_l420) begin
        if(when_Axi4Crossbar_l423) begin
          m0_axi_arsize = s0_axi_arsize;
        end
        if(when_Axi4Crossbar_l423_1) begin
          m0_axi_arsize = s1_axi_arsize;
        end
      end
    end
  end

  always @(*) begin
    m0_axi_arburst = _zz_io_slaves_0_ar_payload_addr[53 : 52];
    if(when_Axi4Crossbar_l405) begin
      if(when_Axi4Crossbar_l420) begin
        if(when_Axi4Crossbar_l423) begin
          m0_axi_arburst = s0_axi_arburst;
        end
        if(when_Axi4Crossbar_l423_1) begin
          m0_axi_arburst = s1_axi_arburst;
        end
      end
    end
  end

  always @(*) begin
    m0_axi_arlock = _zz_io_slaves_0_ar_payload_addr[54 : 54];
    if(when_Axi4Crossbar_l405) begin
      if(when_Axi4Crossbar_l420) begin
        if(when_Axi4Crossbar_l423) begin
          m0_axi_arlock = s0_axi_arlock;
        end
        if(when_Axi4Crossbar_l423_1) begin
          m0_axi_arlock = s1_axi_arlock;
        end
      end
    end
  end

  always @(*) begin
    m0_axi_arcache = _zz_io_slaves_0_ar_payload_addr[58 : 55];
    if(when_Axi4Crossbar_l405) begin
      if(when_Axi4Crossbar_l420) begin
        if(when_Axi4Crossbar_l423) begin
          m0_axi_arcache = s0_axi_arcache;
        end
        if(when_Axi4Crossbar_l423_1) begin
          m0_axi_arcache = s1_axi_arcache;
        end
      end
    end
  end

  always @(*) begin
    m0_axi_arqos = _zz_io_slaves_0_ar_payload_addr[62 : 59];
    if(when_Axi4Crossbar_l405) begin
      if(when_Axi4Crossbar_l420) begin
        if(when_Axi4Crossbar_l423) begin
          m0_axi_arqos = s0_axi_arqos;
        end
        if(when_Axi4Crossbar_l423_1) begin
          m0_axi_arqos = s1_axi_arqos;
        end
      end
    end
  end

  always @(*) begin
    m0_axi_arprot = _zz_io_slaves_0_ar_payload_addr[65 : 63];
    if(when_Axi4Crossbar_l405) begin
      if(when_Axi4Crossbar_l420) begin
        if(when_Axi4Crossbar_l423) begin
          m0_axi_arprot = s0_axi_arprot;
        end
        if(when_Axi4Crossbar_l423_1) begin
          m0_axi_arprot = s1_axi_arprot;
        end
      end
    end
  end

  always @(*) begin
    m0_axi_rready = 1'b0;
    if(!when_Axi4Crossbar_l405) begin
      if(when_Axi4Crossbar_l437) begin
        m0_axi_rready = s0_axi_rready;
      end
      if(when_Axi4Crossbar_l437_1) begin
        m0_axi_rready = s1_axi_rready;
      end
    end
  end

  always @(*) begin
    m1_axi_awvalid = 1'b0;
    if(when_Axi4Crossbar_l345_1) begin
      if(when_Axi4Crossbar_l360_1) begin
        m1_axi_awvalid = 1'b1;
      end
    end
  end

  assign _zz_io_slaves_1_aw_payload_addr = 66'h0;
  always @(*) begin
    m1_axi_awaddr = _zz_io_slaves_1_aw_payload_addr[31 : 0];
    if(when_Axi4Crossbar_l345_1) begin
      if(when_Axi4Crossbar_l360_1) begin
        if(when_Axi4Crossbar_l363_2) begin
          m1_axi_awaddr = s0_axi_awaddr;
        end
        if(when_Axi4Crossbar_l363_3) begin
          m1_axi_awaddr = s1_axi_awaddr;
        end
      end
    end
  end

  always @(*) begin
    m1_axi_awid = _zz_io_slaves_1_aw_payload_addr[36 : 32];
    if(when_Axi4Crossbar_l345_1) begin
      if(when_Axi4Crossbar_l360_1) begin
        if(when_Axi4Crossbar_l363_2) begin
          m1_axi_awid = {_zz_io_slaves_1_aw_payload_id,s0_axi_awid};
        end
        if(when_Axi4Crossbar_l363_3) begin
          m1_axi_awid = {_zz_io_slaves_1_aw_payload_id,s1_axi_awid};
        end
      end
    end
  end

  assign m1_axi_awregion = _zz_io_slaves_1_aw_payload_addr[40 : 37];
  always @(*) begin
    m1_axi_awlen = _zz_io_slaves_1_aw_payload_addr[48 : 41];
    if(when_Axi4Crossbar_l345_1) begin
      if(when_Axi4Crossbar_l360_1) begin
        if(when_Axi4Crossbar_l363_2) begin
          m1_axi_awlen = s0_axi_awlen;
        end
        if(when_Axi4Crossbar_l363_3) begin
          m1_axi_awlen = s1_axi_awlen;
        end
      end
    end
  end

  always @(*) begin
    m1_axi_awsize = _zz_io_slaves_1_aw_payload_addr[51 : 49];
    if(when_Axi4Crossbar_l345_1) begin
      if(when_Axi4Crossbar_l360_1) begin
        if(when_Axi4Crossbar_l363_2) begin
          m1_axi_awsize = s0_axi_awsize;
        end
        if(when_Axi4Crossbar_l363_3) begin
          m1_axi_awsize = s1_axi_awsize;
        end
      end
    end
  end

  always @(*) begin
    m1_axi_awburst = _zz_io_slaves_1_aw_payload_addr[53 : 52];
    if(when_Axi4Crossbar_l345_1) begin
      if(when_Axi4Crossbar_l360_1) begin
        if(when_Axi4Crossbar_l363_2) begin
          m1_axi_awburst = s0_axi_awburst;
        end
        if(when_Axi4Crossbar_l363_3) begin
          m1_axi_awburst = s1_axi_awburst;
        end
      end
    end
  end

  always @(*) begin
    m1_axi_awlock = _zz_io_slaves_1_aw_payload_addr[54 : 54];
    if(when_Axi4Crossbar_l345_1) begin
      if(when_Axi4Crossbar_l360_1) begin
        if(when_Axi4Crossbar_l363_2) begin
          m1_axi_awlock = s0_axi_awlock;
        end
        if(when_Axi4Crossbar_l363_3) begin
          m1_axi_awlock = s1_axi_awlock;
        end
      end
    end
  end

  always @(*) begin
    m1_axi_awcache = _zz_io_slaves_1_aw_payload_addr[58 : 55];
    if(when_Axi4Crossbar_l345_1) begin
      if(when_Axi4Crossbar_l360_1) begin
        if(when_Axi4Crossbar_l363_2) begin
          m1_axi_awcache = s0_axi_awcache;
        end
        if(when_Axi4Crossbar_l363_3) begin
          m1_axi_awcache = s1_axi_awcache;
        end
      end
    end
  end

  always @(*) begin
    m1_axi_awqos = _zz_io_slaves_1_aw_payload_addr[62 : 59];
    if(when_Axi4Crossbar_l345_1) begin
      if(when_Axi4Crossbar_l360_1) begin
        if(when_Axi4Crossbar_l363_2) begin
          m1_axi_awqos = s0_axi_awqos;
        end
        if(when_Axi4Crossbar_l363_3) begin
          m1_axi_awqos = s1_axi_awqos;
        end
      end
    end
  end

  always @(*) begin
    m1_axi_awprot = _zz_io_slaves_1_aw_payload_addr[65 : 63];
    if(when_Axi4Crossbar_l345_1) begin
      if(when_Axi4Crossbar_l360_1) begin
        if(when_Axi4Crossbar_l363_2) begin
          m1_axi_awprot = s0_axi_awprot;
        end
        if(when_Axi4Crossbar_l363_3) begin
          m1_axi_awprot = s1_axi_awprot;
        end
      end
    end
  end

  always @(*) begin
    m1_axi_wvalid = 1'b0;
    if(when_Axi4Crossbar_l345_1) begin
      if(when_Axi4Crossbar_l360_1) begin
        if(when_Axi4Crossbar_l363_2) begin
          m1_axi_wvalid = s0_axi_wvalid;
        end
        if(when_Axi4Crossbar_l363_3) begin
          m1_axi_wvalid = s1_axi_wvalid;
        end
      end
    end else begin
      if(when_Axi4Crossbar_l386_2) begin
        m1_axi_wvalid = s0_axi_wvalid;
      end
      if(when_Axi4Crossbar_l386_3) begin
        m1_axi_wvalid = s1_axi_wvalid;
      end
    end
  end

  assign _zz_io_slaves_1_w_payload_data = 73'h0;
  always @(*) begin
    m1_axi_wdata = _zz_io_slaves_1_w_payload_data[63 : 0];
    if(when_Axi4Crossbar_l345_1) begin
      if(when_Axi4Crossbar_l360_1) begin
        if(when_Axi4Crossbar_l363_2) begin
          m1_axi_wdata = s0_axi_wdata;
        end
        if(when_Axi4Crossbar_l363_3) begin
          m1_axi_wdata = s1_axi_wdata;
        end
      end
    end else begin
      if(when_Axi4Crossbar_l386_2) begin
        m1_axi_wdata = s0_axi_wdata;
      end
      if(when_Axi4Crossbar_l386_3) begin
        m1_axi_wdata = s1_axi_wdata;
      end
    end
  end

  always @(*) begin
    m1_axi_wstrb = _zz_io_slaves_1_w_payload_data[71 : 64];
    if(when_Axi4Crossbar_l345_1) begin
      if(when_Axi4Crossbar_l360_1) begin
        if(when_Axi4Crossbar_l363_2) begin
          m1_axi_wstrb = s0_axi_wstrb;
        end
        if(when_Axi4Crossbar_l363_3) begin
          m1_axi_wstrb = s1_axi_wstrb;
        end
      end
    end else begin
      if(when_Axi4Crossbar_l386_2) begin
        m1_axi_wstrb = s0_axi_wstrb;
      end
      if(when_Axi4Crossbar_l386_3) begin
        m1_axi_wstrb = s1_axi_wstrb;
      end
    end
  end

  always @(*) begin
    m1_axi_wlast = _zz_io_slaves_1_w_payload_data[72];
    if(when_Axi4Crossbar_l345_1) begin
      if(when_Axi4Crossbar_l360_1) begin
        if(when_Axi4Crossbar_l363_2) begin
          m1_axi_wlast = s0_axi_wlast;
        end
        if(when_Axi4Crossbar_l363_3) begin
          m1_axi_wlast = s1_axi_wlast;
        end
      end
    end else begin
      if(when_Axi4Crossbar_l386_2) begin
        m1_axi_wlast = s0_axi_wlast;
      end
      if(when_Axi4Crossbar_l386_3) begin
        m1_axi_wlast = s1_axi_wlast;
      end
    end
  end

  always @(*) begin
    m1_axi_bready = 1'b0;
    if(!when_Axi4Crossbar_l345_1) begin
      if(when_Axi4Crossbar_l386_2) begin
        m1_axi_bready = s0_axi_bready;
      end
      if(when_Axi4Crossbar_l386_3) begin
        m1_axi_bready = s1_axi_bready;
      end
    end
  end

  always @(*) begin
    m1_axi_arvalid = 1'b0;
    if(when_Axi4Crossbar_l405_1) begin
      if(when_Axi4Crossbar_l420_1) begin
        m1_axi_arvalid = 1'b1;
      end
    end
  end

  assign _zz_io_slaves_1_ar_payload_addr = 66'h0;
  always @(*) begin
    m1_axi_araddr = _zz_io_slaves_1_ar_payload_addr[31 : 0];
    if(when_Axi4Crossbar_l405_1) begin
      if(when_Axi4Crossbar_l420_1) begin
        if(when_Axi4Crossbar_l423_2) begin
          m1_axi_araddr = s0_axi_araddr;
        end
        if(when_Axi4Crossbar_l423_3) begin
          m1_axi_araddr = s1_axi_araddr;
        end
      end
    end
  end

  always @(*) begin
    m1_axi_arid = _zz_io_slaves_1_ar_payload_addr[36 : 32];
    if(when_Axi4Crossbar_l405_1) begin
      if(when_Axi4Crossbar_l420_1) begin
        if(when_Axi4Crossbar_l423_2) begin
          m1_axi_arid = {_zz_io_slaves_1_ar_payload_id,s0_axi_arid};
        end
        if(when_Axi4Crossbar_l423_3) begin
          m1_axi_arid = {_zz_io_slaves_1_ar_payload_id,s1_axi_arid};
        end
      end
    end
  end

  assign m1_axi_arregion = _zz_io_slaves_1_ar_payload_addr[40 : 37];
  always @(*) begin
    m1_axi_arlen = _zz_io_slaves_1_ar_payload_addr[48 : 41];
    if(when_Axi4Crossbar_l405_1) begin
      if(when_Axi4Crossbar_l420_1) begin
        if(when_Axi4Crossbar_l423_2) begin
          m1_axi_arlen = s0_axi_arlen;
        end
        if(when_Axi4Crossbar_l423_3) begin
          m1_axi_arlen = s1_axi_arlen;
        end
      end
    end
  end

  always @(*) begin
    m1_axi_arsize = _zz_io_slaves_1_ar_payload_addr[51 : 49];
    if(when_Axi4Crossbar_l405_1) begin
      if(when_Axi4Crossbar_l420_1) begin
        if(when_Axi4Crossbar_l423_2) begin
          m1_axi_arsize = s0_axi_arsize;
        end
        if(when_Axi4Crossbar_l423_3) begin
          m1_axi_arsize = s1_axi_arsize;
        end
      end
    end
  end

  always @(*) begin
    m1_axi_arburst = _zz_io_slaves_1_ar_payload_addr[53 : 52];
    if(when_Axi4Crossbar_l405_1) begin
      if(when_Axi4Crossbar_l420_1) begin
        if(when_Axi4Crossbar_l423_2) begin
          m1_axi_arburst = s0_axi_arburst;
        end
        if(when_Axi4Crossbar_l423_3) begin
          m1_axi_arburst = s1_axi_arburst;
        end
      end
    end
  end

  always @(*) begin
    m1_axi_arlock = _zz_io_slaves_1_ar_payload_addr[54 : 54];
    if(when_Axi4Crossbar_l405_1) begin
      if(when_Axi4Crossbar_l420_1) begin
        if(when_Axi4Crossbar_l423_2) begin
          m1_axi_arlock = s0_axi_arlock;
        end
        if(when_Axi4Crossbar_l423_3) begin
          m1_axi_arlock = s1_axi_arlock;
        end
      end
    end
  end

  always @(*) begin
    m1_axi_arcache = _zz_io_slaves_1_ar_payload_addr[58 : 55];
    if(when_Axi4Crossbar_l405_1) begin
      if(when_Axi4Crossbar_l420_1) begin
        if(when_Axi4Crossbar_l423_2) begin
          m1_axi_arcache = s0_axi_arcache;
        end
        if(when_Axi4Crossbar_l423_3) begin
          m1_axi_arcache = s1_axi_arcache;
        end
      end
    end
  end

  always @(*) begin
    m1_axi_arqos = _zz_io_slaves_1_ar_payload_addr[62 : 59];
    if(when_Axi4Crossbar_l405_1) begin
      if(when_Axi4Crossbar_l420_1) begin
        if(when_Axi4Crossbar_l423_2) begin
          m1_axi_arqos = s0_axi_arqos;
        end
        if(when_Axi4Crossbar_l423_3) begin
          m1_axi_arqos = s1_axi_arqos;
        end
      end
    end
  end

  always @(*) begin
    m1_axi_arprot = _zz_io_slaves_1_ar_payload_addr[65 : 63];
    if(when_Axi4Crossbar_l405_1) begin
      if(when_Axi4Crossbar_l420_1) begin
        if(when_Axi4Crossbar_l423_2) begin
          m1_axi_arprot = s0_axi_arprot;
        end
        if(when_Axi4Crossbar_l423_3) begin
          m1_axi_arprot = s1_axi_arprot;
        end
      end
    end
  end

  always @(*) begin
    m1_axi_rready = 1'b0;
    if(!when_Axi4Crossbar_l405_1) begin
      if(when_Axi4Crossbar_l437_2) begin
        m1_axi_rready = s0_axi_rready;
      end
      if(when_Axi4Crossbar_l437_3) begin
        m1_axi_rready = s1_axi_rready;
      end
    end
  end

  always @(*) begin
    decErr_io_axi_aw_valid = 1'b0;
    if(when_Axi4Crossbar_l345_2) begin
      if(when_Axi4Crossbar_l360_2) begin
        decErr_io_axi_aw_valid = 1'b1;
      end
    end
  end

  assign _zz_io_axi_aw_payload_addr = 66'h0;
  always @(*) begin
    decErr_io_axi_aw_payload_addr = _zz_io_axi_aw_payload_addr[31 : 0];
    if(when_Axi4Crossbar_l345_2) begin
      if(when_Axi4Crossbar_l360_2) begin
        if(when_Axi4Crossbar_l363_4) begin
          decErr_io_axi_aw_payload_addr = s0_axi_awaddr;
        end
        if(when_Axi4Crossbar_l363_5) begin
          decErr_io_axi_aw_payload_addr = s1_axi_awaddr;
        end
      end
    end
  end

  always @(*) begin
    decErr_io_axi_aw_payload_id = _zz_io_axi_aw_payload_addr[36 : 32];
    if(when_Axi4Crossbar_l345_2) begin
      if(when_Axi4Crossbar_l360_2) begin
        if(when_Axi4Crossbar_l363_4) begin
          decErr_io_axi_aw_payload_id = {_zz_wrRrPtr_2,s0_axi_awid};
        end
        if(when_Axi4Crossbar_l363_5) begin
          decErr_io_axi_aw_payload_id = {_zz_wrRrPtr_2,s1_axi_awid};
        end
      end
    end
  end

  assign decErr_io_axi_aw_payload_region = _zz_io_axi_aw_payload_addr[40 : 37];
  always @(*) begin
    decErr_io_axi_aw_payload_len = _zz_io_axi_aw_payload_addr[48 : 41];
    if(when_Axi4Crossbar_l345_2) begin
      if(when_Axi4Crossbar_l360_2) begin
        if(when_Axi4Crossbar_l363_4) begin
          decErr_io_axi_aw_payload_len = s0_axi_awlen;
        end
        if(when_Axi4Crossbar_l363_5) begin
          decErr_io_axi_aw_payload_len = s1_axi_awlen;
        end
      end
    end
  end

  always @(*) begin
    decErr_io_axi_aw_payload_size = _zz_io_axi_aw_payload_addr[51 : 49];
    if(when_Axi4Crossbar_l345_2) begin
      if(when_Axi4Crossbar_l360_2) begin
        if(when_Axi4Crossbar_l363_4) begin
          decErr_io_axi_aw_payload_size = s0_axi_awsize;
        end
        if(when_Axi4Crossbar_l363_5) begin
          decErr_io_axi_aw_payload_size = s1_axi_awsize;
        end
      end
    end
  end

  always @(*) begin
    decErr_io_axi_aw_payload_burst = _zz_io_axi_aw_payload_addr[53 : 52];
    if(when_Axi4Crossbar_l345_2) begin
      if(when_Axi4Crossbar_l360_2) begin
        if(when_Axi4Crossbar_l363_4) begin
          decErr_io_axi_aw_payload_burst = s0_axi_awburst;
        end
        if(when_Axi4Crossbar_l363_5) begin
          decErr_io_axi_aw_payload_burst = s1_axi_awburst;
        end
      end
    end
  end

  always @(*) begin
    decErr_io_axi_aw_payload_lock = _zz_io_axi_aw_payload_addr[54 : 54];
    if(when_Axi4Crossbar_l345_2) begin
      if(when_Axi4Crossbar_l360_2) begin
        if(when_Axi4Crossbar_l363_4) begin
          decErr_io_axi_aw_payload_lock = s0_axi_awlock;
        end
        if(when_Axi4Crossbar_l363_5) begin
          decErr_io_axi_aw_payload_lock = s1_axi_awlock;
        end
      end
    end
  end

  always @(*) begin
    decErr_io_axi_aw_payload_cache = _zz_io_axi_aw_payload_addr[58 : 55];
    if(when_Axi4Crossbar_l345_2) begin
      if(when_Axi4Crossbar_l360_2) begin
        if(when_Axi4Crossbar_l363_4) begin
          decErr_io_axi_aw_payload_cache = s0_axi_awcache;
        end
        if(when_Axi4Crossbar_l363_5) begin
          decErr_io_axi_aw_payload_cache = s1_axi_awcache;
        end
      end
    end
  end

  always @(*) begin
    decErr_io_axi_aw_payload_qos = _zz_io_axi_aw_payload_addr[62 : 59];
    if(when_Axi4Crossbar_l345_2) begin
      if(when_Axi4Crossbar_l360_2) begin
        if(when_Axi4Crossbar_l363_4) begin
          decErr_io_axi_aw_payload_qos = s0_axi_awqos;
        end
        if(when_Axi4Crossbar_l363_5) begin
          decErr_io_axi_aw_payload_qos = s1_axi_awqos;
        end
      end
    end
  end

  always @(*) begin
    decErr_io_axi_aw_payload_prot = _zz_io_axi_aw_payload_addr[65 : 63];
    if(when_Axi4Crossbar_l345_2) begin
      if(when_Axi4Crossbar_l360_2) begin
        if(when_Axi4Crossbar_l363_4) begin
          decErr_io_axi_aw_payload_prot = s0_axi_awprot;
        end
        if(when_Axi4Crossbar_l363_5) begin
          decErr_io_axi_aw_payload_prot = s1_axi_awprot;
        end
      end
    end
  end

  always @(*) begin
    decErr_io_axi_w_valid = 1'b0;
    if(when_Axi4Crossbar_l345_2) begin
      if(when_Axi4Crossbar_l360_2) begin
        if(when_Axi4Crossbar_l363_4) begin
          decErr_io_axi_w_valid = s0_axi_wvalid;
        end
        if(when_Axi4Crossbar_l363_5) begin
          decErr_io_axi_w_valid = s1_axi_wvalid;
        end
      end
    end else begin
      if(when_Axi4Crossbar_l386_4) begin
        decErr_io_axi_w_valid = s0_axi_wvalid;
      end
      if(when_Axi4Crossbar_l386_5) begin
        decErr_io_axi_w_valid = s1_axi_wvalid;
      end
    end
  end

  assign _zz_io_axi_w_payload_data = 73'h0;
  always @(*) begin
    decErr_io_axi_w_payload_data = _zz_io_axi_w_payload_data[63 : 0];
    if(when_Axi4Crossbar_l345_2) begin
      if(when_Axi4Crossbar_l360_2) begin
        if(when_Axi4Crossbar_l363_4) begin
          decErr_io_axi_w_payload_data = s0_axi_wdata;
        end
        if(when_Axi4Crossbar_l363_5) begin
          decErr_io_axi_w_payload_data = s1_axi_wdata;
        end
      end
    end else begin
      if(when_Axi4Crossbar_l386_4) begin
        decErr_io_axi_w_payload_data = s0_axi_wdata;
      end
      if(when_Axi4Crossbar_l386_5) begin
        decErr_io_axi_w_payload_data = s1_axi_wdata;
      end
    end
  end

  always @(*) begin
    decErr_io_axi_w_payload_strb = _zz_io_axi_w_payload_data[71 : 64];
    if(when_Axi4Crossbar_l345_2) begin
      if(when_Axi4Crossbar_l360_2) begin
        if(when_Axi4Crossbar_l363_4) begin
          decErr_io_axi_w_payload_strb = s0_axi_wstrb;
        end
        if(when_Axi4Crossbar_l363_5) begin
          decErr_io_axi_w_payload_strb = s1_axi_wstrb;
        end
      end
    end else begin
      if(when_Axi4Crossbar_l386_4) begin
        decErr_io_axi_w_payload_strb = s0_axi_wstrb;
      end
      if(when_Axi4Crossbar_l386_5) begin
        decErr_io_axi_w_payload_strb = s1_axi_wstrb;
      end
    end
  end

  always @(*) begin
    decErr_io_axi_w_payload_last = _zz_io_axi_w_payload_data[72];
    if(when_Axi4Crossbar_l345_2) begin
      if(when_Axi4Crossbar_l360_2) begin
        if(when_Axi4Crossbar_l363_4) begin
          decErr_io_axi_w_payload_last = s0_axi_wlast;
        end
        if(when_Axi4Crossbar_l363_5) begin
          decErr_io_axi_w_payload_last = s1_axi_wlast;
        end
      end
    end else begin
      if(when_Axi4Crossbar_l386_4) begin
        decErr_io_axi_w_payload_last = s0_axi_wlast;
      end
      if(when_Axi4Crossbar_l386_5) begin
        decErr_io_axi_w_payload_last = s1_axi_wlast;
      end
    end
  end

  always @(*) begin
    decErr_io_axi_b_ready = 1'b0;
    if(!when_Axi4Crossbar_l345_2) begin
      if(when_Axi4Crossbar_l386_4) begin
        decErr_io_axi_b_ready = s0_axi_bready;
      end
      if(when_Axi4Crossbar_l386_5) begin
        decErr_io_axi_b_ready = s1_axi_bready;
      end
    end
  end

  always @(*) begin
    decErr_io_axi_ar_valid = 1'b0;
    if(when_Axi4Crossbar_l405_2) begin
      if(when_Axi4Crossbar_l420_2) begin
        decErr_io_axi_ar_valid = 1'b1;
      end
    end
  end

  assign _zz_io_axi_ar_payload_addr = 66'h0;
  always @(*) begin
    decErr_io_axi_ar_payload_addr = _zz_io_axi_ar_payload_addr[31 : 0];
    if(when_Axi4Crossbar_l405_2) begin
      if(when_Axi4Crossbar_l420_2) begin
        if(when_Axi4Crossbar_l423_4) begin
          decErr_io_axi_ar_payload_addr = s0_axi_araddr;
        end
        if(when_Axi4Crossbar_l423_5) begin
          decErr_io_axi_ar_payload_addr = s1_axi_araddr;
        end
      end
    end
  end

  always @(*) begin
    decErr_io_axi_ar_payload_id = _zz_io_axi_ar_payload_addr[36 : 32];
    if(when_Axi4Crossbar_l405_2) begin
      if(when_Axi4Crossbar_l420_2) begin
        if(when_Axi4Crossbar_l423_4) begin
          decErr_io_axi_ar_payload_id = {_zz_rdRrPtr_2,s0_axi_arid};
        end
        if(when_Axi4Crossbar_l423_5) begin
          decErr_io_axi_ar_payload_id = {_zz_rdRrPtr_2,s1_axi_arid};
        end
      end
    end
  end

  assign decErr_io_axi_ar_payload_region = _zz_io_axi_ar_payload_addr[40 : 37];
  always @(*) begin
    decErr_io_axi_ar_payload_len = _zz_io_axi_ar_payload_addr[48 : 41];
    if(when_Axi4Crossbar_l405_2) begin
      if(when_Axi4Crossbar_l420_2) begin
        if(when_Axi4Crossbar_l423_4) begin
          decErr_io_axi_ar_payload_len = s0_axi_arlen;
        end
        if(when_Axi4Crossbar_l423_5) begin
          decErr_io_axi_ar_payload_len = s1_axi_arlen;
        end
      end
    end
  end

  always @(*) begin
    decErr_io_axi_ar_payload_size = _zz_io_axi_ar_payload_addr[51 : 49];
    if(when_Axi4Crossbar_l405_2) begin
      if(when_Axi4Crossbar_l420_2) begin
        if(when_Axi4Crossbar_l423_4) begin
          decErr_io_axi_ar_payload_size = s0_axi_arsize;
        end
        if(when_Axi4Crossbar_l423_5) begin
          decErr_io_axi_ar_payload_size = s1_axi_arsize;
        end
      end
    end
  end

  always @(*) begin
    decErr_io_axi_ar_payload_burst = _zz_io_axi_ar_payload_addr[53 : 52];
    if(when_Axi4Crossbar_l405_2) begin
      if(when_Axi4Crossbar_l420_2) begin
        if(when_Axi4Crossbar_l423_4) begin
          decErr_io_axi_ar_payload_burst = s0_axi_arburst;
        end
        if(when_Axi4Crossbar_l423_5) begin
          decErr_io_axi_ar_payload_burst = s1_axi_arburst;
        end
      end
    end
  end

  always @(*) begin
    decErr_io_axi_ar_payload_lock = _zz_io_axi_ar_payload_addr[54 : 54];
    if(when_Axi4Crossbar_l405_2) begin
      if(when_Axi4Crossbar_l420_2) begin
        if(when_Axi4Crossbar_l423_4) begin
          decErr_io_axi_ar_payload_lock = s0_axi_arlock;
        end
        if(when_Axi4Crossbar_l423_5) begin
          decErr_io_axi_ar_payload_lock = s1_axi_arlock;
        end
      end
    end
  end

  always @(*) begin
    decErr_io_axi_ar_payload_cache = _zz_io_axi_ar_payload_addr[58 : 55];
    if(when_Axi4Crossbar_l405_2) begin
      if(when_Axi4Crossbar_l420_2) begin
        if(when_Axi4Crossbar_l423_4) begin
          decErr_io_axi_ar_payload_cache = s0_axi_arcache;
        end
        if(when_Axi4Crossbar_l423_5) begin
          decErr_io_axi_ar_payload_cache = s1_axi_arcache;
        end
      end
    end
  end

  always @(*) begin
    decErr_io_axi_ar_payload_qos = _zz_io_axi_ar_payload_addr[62 : 59];
    if(when_Axi4Crossbar_l405_2) begin
      if(when_Axi4Crossbar_l420_2) begin
        if(when_Axi4Crossbar_l423_4) begin
          decErr_io_axi_ar_payload_qos = s0_axi_arqos;
        end
        if(when_Axi4Crossbar_l423_5) begin
          decErr_io_axi_ar_payload_qos = s1_axi_arqos;
        end
      end
    end
  end

  always @(*) begin
    decErr_io_axi_ar_payload_prot = _zz_io_axi_ar_payload_addr[65 : 63];
    if(when_Axi4Crossbar_l405_2) begin
      if(when_Axi4Crossbar_l420_2) begin
        if(when_Axi4Crossbar_l423_4) begin
          decErr_io_axi_ar_payload_prot = s0_axi_arprot;
        end
        if(when_Axi4Crossbar_l423_5) begin
          decErr_io_axi_ar_payload_prot = s1_axi_arprot;
        end
      end
    end
  end

  always @(*) begin
    decErr_io_axi_r_ready = 1'b0;
    if(!when_Axi4Crossbar_l405_2) begin
      if(when_Axi4Crossbar_l437_4) begin
        decErr_io_axi_r_ready = s0_axi_rready;
      end
      if(when_Axi4Crossbar_l437_5) begin
        decErr_io_axi_r_ready = s1_axi_rready;
      end
    end
  end

  assign when_Axi4Crossbar_l345 = (! _zz_when_Axi4Crossbar_l345);
  always @(*) begin
    _zz_when_Axi4Crossbar_l360_1[0] = ((32'h0 <= s0_axi_awaddr) && (s0_axi_awaddr < 32'h80000000));
    _zz_when_Axi4Crossbar_l360_1[1] = ((32'h80000000 <= s0_axi_awaddr) && (s0_axi_awaddr < 32'ha0000000));
  end

  always @(*) begin
    _zz_when_Axi4Crossbar_l360[0] = (s0_axi_awvalid && _zz__zz_when_Axi4Crossbar_l360[0]);
    _zz_when_Axi4Crossbar_l360[1] = (s1_axi_awvalid && _zz__zz_when_Axi4Crossbar_l360_1[0]);
  end

  always @(*) begin
    _zz_when_Axi4Crossbar_l360_2[0] = ((32'h0 <= s1_axi_awaddr) && (s1_axi_awaddr < 32'h80000000));
    _zz_when_Axi4Crossbar_l360_2[1] = ((32'h80000000 <= s1_axi_awaddr) && (s1_axi_awaddr < 32'ha0000000));
  end

  always @(*) begin
    _zz_when_Axi4Crossbar_l203[0] = (wrRrPtr_0 <= 1'b0);
    _zz_when_Axi4Crossbar_l203[1] = (wrRrPtr_0 <= 1'b1);
  end

  assign _zz_when_Axi4Crossbar_l203_1 = (_zz_when_Axi4Crossbar_l360 & _zz_when_Axi4Crossbar_l203);
  assign _zz_when_Axi4Crossbar_l203_2 = _zz_when_Axi4Crossbar_l203_1;
  assign _zz_when_Axi4Crossbar_l203_3 = _zz_when_Axi4Crossbar_l360;
  assign _zz_when_Axi4Crossbar_l203_4 = ((|_zz_when_Axi4Crossbar_l203_1) ? (_zz_when_Axi4Crossbar_l203_2 & (~ _zz__zz_when_Axi4Crossbar_l203_4)) : (_zz_when_Axi4Crossbar_l203_3 & (~ _zz__zz_when_Axi4Crossbar_l203_4_1)));
  always @(*) begin
    _zz_io_slaves_0_aw_payload_id = 1'b0;
    if(when_Axi4Crossbar_l203) begin
      _zz_io_slaves_0_aw_payload_id = 1'b0;
    end
    if(when_Axi4Crossbar_l203_1) begin
      _zz_io_slaves_0_aw_payload_id = 1'b1;
    end
  end

  assign when_Axi4Crossbar_l203 = _zz_when_Axi4Crossbar_l203_4[0];
  assign when_Axi4Crossbar_l203_1 = _zz_when_Axi4Crossbar_l203_4[1];
  assign when_Axi4Crossbar_l360 = (|_zz_when_Axi4Crossbar_l360);
  assign when_Axi4Crossbar_l363 = (_zz_io_slaves_0_aw_payload_id == 1'b0);
  assign when_Axi4Crossbar_l363_1 = (_zz_io_slaves_0_aw_payload_id == 1'b1);
  assign io_slaves_0_aw_fire = (m0_axi_awvalid && m0_axi_awready);
  assign when_Axi4Crossbar_l386 = (_zz_when_Axi4Crossbar_l386 == 1'b0);
  assign when_Axi4Crossbar_l386_1 = (_zz_when_Axi4Crossbar_l386 == 1'b1);
  assign io_slaves_0_b_fire = (m0_axi_bvalid && m0_axi_bready);
  assign when_Axi4Crossbar_l345_1 = (! _zz_when_Axi4Crossbar_l345_1);
  always @(*) begin
    _zz_when_Axi4Crossbar_l360_4[0] = ((32'h0 <= s0_axi_awaddr) && (s0_axi_awaddr < 32'h80000000));
    _zz_when_Axi4Crossbar_l360_4[1] = ((32'h80000000 <= s0_axi_awaddr) && (s0_axi_awaddr < 32'ha0000000));
  end

  always @(*) begin
    _zz_when_Axi4Crossbar_l360_3[0] = (s0_axi_awvalid && _zz__zz_when_Axi4Crossbar_l360_3[1]);
    _zz_when_Axi4Crossbar_l360_3[1] = (s1_axi_awvalid && _zz__zz_when_Axi4Crossbar_l360_3_1[1]);
  end

  always @(*) begin
    _zz_when_Axi4Crossbar_l360_5[0] = ((32'h0 <= s1_axi_awaddr) && (s1_axi_awaddr < 32'h80000000));
    _zz_when_Axi4Crossbar_l360_5[1] = ((32'h80000000 <= s1_axi_awaddr) && (s1_axi_awaddr < 32'ha0000000));
  end

  always @(*) begin
    _zz_when_Axi4Crossbar_l203_5[0] = (wrRrPtr_1 <= 1'b0);
    _zz_when_Axi4Crossbar_l203_5[1] = (wrRrPtr_1 <= 1'b1);
  end

  assign _zz_when_Axi4Crossbar_l203_6 = (_zz_when_Axi4Crossbar_l360_3 & _zz_when_Axi4Crossbar_l203_5);
  assign _zz_when_Axi4Crossbar_l203_7 = _zz_when_Axi4Crossbar_l203_6;
  assign _zz_when_Axi4Crossbar_l203_8 = _zz_when_Axi4Crossbar_l360_3;
  assign _zz_when_Axi4Crossbar_l203_9 = ((|_zz_when_Axi4Crossbar_l203_6) ? (_zz_when_Axi4Crossbar_l203_7 & (~ _zz__zz_when_Axi4Crossbar_l203_9)) : (_zz_when_Axi4Crossbar_l203_8 & (~ _zz__zz_when_Axi4Crossbar_l203_9_1)));
  always @(*) begin
    _zz_io_slaves_1_aw_payload_id = 1'b0;
    if(when_Axi4Crossbar_l203_2) begin
      _zz_io_slaves_1_aw_payload_id = 1'b0;
    end
    if(when_Axi4Crossbar_l203_3) begin
      _zz_io_slaves_1_aw_payload_id = 1'b1;
    end
  end

  assign when_Axi4Crossbar_l203_2 = _zz_when_Axi4Crossbar_l203_9[0];
  assign when_Axi4Crossbar_l203_3 = _zz_when_Axi4Crossbar_l203_9[1];
  assign when_Axi4Crossbar_l360_1 = (|_zz_when_Axi4Crossbar_l360_3);
  assign when_Axi4Crossbar_l363_2 = (_zz_io_slaves_1_aw_payload_id == 1'b0);
  assign when_Axi4Crossbar_l363_3 = (_zz_io_slaves_1_aw_payload_id == 1'b1);
  assign io_slaves_1_aw_fire = (m1_axi_awvalid && m1_axi_awready);
  assign when_Axi4Crossbar_l386_2 = (_zz_when_Axi4Crossbar_l386_1 == 1'b0);
  assign when_Axi4Crossbar_l386_3 = (_zz_when_Axi4Crossbar_l386_1 == 1'b1);
  assign io_slaves_1_b_fire = (m1_axi_bvalid && m1_axi_bready);
  assign when_Axi4Crossbar_l345_2 = (! _zz_when_Axi4Crossbar_l345_2);
  always @(*) begin
    _zz_when_Axi4Crossbar_l360_7[0] = ((32'h0 <= s0_axi_awaddr) && (s0_axi_awaddr < 32'h80000000));
    _zz_when_Axi4Crossbar_l360_7[1] = ((32'h80000000 <= s0_axi_awaddr) && (s0_axi_awaddr < 32'ha0000000));
  end

  always @(*) begin
    _zz_when_Axi4Crossbar_l360_6[0] = (s0_axi_awvalid && _zz__zz_when_Axi4Crossbar_l360_6[2]);
    _zz_when_Axi4Crossbar_l360_6[1] = (s1_axi_awvalid && _zz__zz_when_Axi4Crossbar_l360_6_1[2]);
  end

  always @(*) begin
    _zz_when_Axi4Crossbar_l360_8[0] = ((32'h0 <= s1_axi_awaddr) && (s1_axi_awaddr < 32'h80000000));
    _zz_when_Axi4Crossbar_l360_8[1] = ((32'h80000000 <= s1_axi_awaddr) && (s1_axi_awaddr < 32'ha0000000));
  end

  always @(*) begin
    _zz_when_Axi4Crossbar_l203_10[0] = (wrRrPtr_2 <= 1'b0);
    _zz_when_Axi4Crossbar_l203_10[1] = (wrRrPtr_2 <= 1'b1);
  end

  assign _zz_when_Axi4Crossbar_l203_11 = (_zz_when_Axi4Crossbar_l360_6 & _zz_when_Axi4Crossbar_l203_10);
  assign _zz_when_Axi4Crossbar_l203_12 = _zz_when_Axi4Crossbar_l203_11;
  assign _zz_when_Axi4Crossbar_l203_13 = _zz_when_Axi4Crossbar_l360_6;
  assign _zz_when_Axi4Crossbar_l203_14 = ((|_zz_when_Axi4Crossbar_l203_11) ? (_zz_when_Axi4Crossbar_l203_12 & (~ _zz__zz_when_Axi4Crossbar_l203_14)) : (_zz_when_Axi4Crossbar_l203_13 & (~ _zz__zz_when_Axi4Crossbar_l203_14_1)));
  always @(*) begin
    _zz_wrRrPtr_2 = 1'b0;
    if(when_Axi4Crossbar_l203_4) begin
      _zz_wrRrPtr_2 = 1'b0;
    end
    if(when_Axi4Crossbar_l203_5) begin
      _zz_wrRrPtr_2 = 1'b1;
    end
  end

  assign when_Axi4Crossbar_l203_4 = _zz_when_Axi4Crossbar_l203_14[0];
  assign when_Axi4Crossbar_l203_5 = _zz_when_Axi4Crossbar_l203_14[1];
  assign when_Axi4Crossbar_l360_2 = (|_zz_when_Axi4Crossbar_l360_6);
  assign when_Axi4Crossbar_l363_4 = (_zz_wrRrPtr_2 == 1'b0);
  assign when_Axi4Crossbar_l363_5 = (_zz_wrRrPtr_2 == 1'b1);
  assign decErr_io_axi_aw_fire = (decErr_io_axi_aw_valid && decErr_io_axi_aw_ready);
  assign when_Axi4Crossbar_l386_4 = (_zz_when_Axi4Crossbar_l386_2 == 1'b0);
  assign when_Axi4Crossbar_l386_5 = (_zz_when_Axi4Crossbar_l386_2 == 1'b1);
  assign decErr_io_axi_b_fire = (decErr_io_axi_b_valid && decErr_io_axi_b_ready);
  assign when_Axi4Crossbar_l405 = (! _zz_when_Axi4Crossbar_l405);
  always @(*) begin
    _zz_when_Axi4Crossbar_l420_1[0] = ((32'h0 <= s0_axi_araddr) && (s0_axi_araddr < 32'h80000000));
    _zz_when_Axi4Crossbar_l420_1[1] = ((32'h80000000 <= s0_axi_araddr) && (s0_axi_araddr < 32'ha0000000));
  end

  always @(*) begin
    _zz_when_Axi4Crossbar_l420[0] = (s0_axi_arvalid && _zz__zz_when_Axi4Crossbar_l420[0]);
    _zz_when_Axi4Crossbar_l420[1] = (s1_axi_arvalid && _zz__zz_when_Axi4Crossbar_l420_1[0]);
  end

  always @(*) begin
    _zz_when_Axi4Crossbar_l420_2[0] = ((32'h0 <= s1_axi_araddr) && (s1_axi_araddr < 32'h80000000));
    _zz_when_Axi4Crossbar_l420_2[1] = ((32'h80000000 <= s1_axi_araddr) && (s1_axi_araddr < 32'ha0000000));
  end

  always @(*) begin
    _zz_when_Axi4Crossbar_l203_15[0] = (rdRrPtr_0 <= 1'b0);
    _zz_when_Axi4Crossbar_l203_15[1] = (rdRrPtr_0 <= 1'b1);
  end

  assign _zz_when_Axi4Crossbar_l203_16 = (_zz_when_Axi4Crossbar_l420 & _zz_when_Axi4Crossbar_l203_15);
  assign _zz_when_Axi4Crossbar_l203_17 = _zz_when_Axi4Crossbar_l203_16;
  assign _zz_when_Axi4Crossbar_l203_18 = _zz_when_Axi4Crossbar_l420;
  assign _zz_when_Axi4Crossbar_l203_19 = ((|_zz_when_Axi4Crossbar_l203_16) ? (_zz_when_Axi4Crossbar_l203_17 & (~ _zz__zz_when_Axi4Crossbar_l203_19)) : (_zz_when_Axi4Crossbar_l203_18 & (~ _zz__zz_when_Axi4Crossbar_l203_19_1)));
  always @(*) begin
    _zz_io_slaves_0_ar_payload_id = 1'b0;
    if(when_Axi4Crossbar_l203_6) begin
      _zz_io_slaves_0_ar_payload_id = 1'b0;
    end
    if(when_Axi4Crossbar_l203_7) begin
      _zz_io_slaves_0_ar_payload_id = 1'b1;
    end
  end

  assign when_Axi4Crossbar_l203_6 = _zz_when_Axi4Crossbar_l203_19[0];
  assign when_Axi4Crossbar_l203_7 = _zz_when_Axi4Crossbar_l203_19[1];
  assign when_Axi4Crossbar_l420 = (|_zz_when_Axi4Crossbar_l420);
  assign when_Axi4Crossbar_l423 = (_zz_io_slaves_0_ar_payload_id == 1'b0);
  assign when_Axi4Crossbar_l423_1 = (_zz_io_slaves_0_ar_payload_id == 1'b1);
  assign io_slaves_0_ar_fire = (m0_axi_arvalid && m0_axi_arready);
  assign when_Axi4Crossbar_l437 = (_zz_when_Axi4Crossbar_l437 == 1'b0);
  assign when_Axi4Crossbar_l437_1 = (_zz_when_Axi4Crossbar_l437 == 1'b1);
  assign io_slaves_0_r_fire = (m0_axi_rvalid && m0_axi_rready);
  assign when_Axi4Crossbar_l447 = (io_slaves_0_r_fire && m0_axi_rlast);
  assign when_Axi4Crossbar_l405_1 = (! _zz_when_Axi4Crossbar_l405_1);
  always @(*) begin
    _zz_when_Axi4Crossbar_l420_4[0] = ((32'h0 <= s0_axi_araddr) && (s0_axi_araddr < 32'h80000000));
    _zz_when_Axi4Crossbar_l420_4[1] = ((32'h80000000 <= s0_axi_araddr) && (s0_axi_araddr < 32'ha0000000));
  end

  always @(*) begin
    _zz_when_Axi4Crossbar_l420_3[0] = (s0_axi_arvalid && _zz__zz_when_Axi4Crossbar_l420_3[1]);
    _zz_when_Axi4Crossbar_l420_3[1] = (s1_axi_arvalid && _zz__zz_when_Axi4Crossbar_l420_3_1[1]);
  end

  always @(*) begin
    _zz_when_Axi4Crossbar_l420_5[0] = ((32'h0 <= s1_axi_araddr) && (s1_axi_araddr < 32'h80000000));
    _zz_when_Axi4Crossbar_l420_5[1] = ((32'h80000000 <= s1_axi_araddr) && (s1_axi_araddr < 32'ha0000000));
  end

  always @(*) begin
    _zz_when_Axi4Crossbar_l203_20[0] = (rdRrPtr_1 <= 1'b0);
    _zz_when_Axi4Crossbar_l203_20[1] = (rdRrPtr_1 <= 1'b1);
  end

  assign _zz_when_Axi4Crossbar_l203_21 = (_zz_when_Axi4Crossbar_l420_3 & _zz_when_Axi4Crossbar_l203_20);
  assign _zz_when_Axi4Crossbar_l203_22 = _zz_when_Axi4Crossbar_l203_21;
  assign _zz_when_Axi4Crossbar_l203_23 = _zz_when_Axi4Crossbar_l420_3;
  assign _zz_when_Axi4Crossbar_l203_24 = ((|_zz_when_Axi4Crossbar_l203_21) ? (_zz_when_Axi4Crossbar_l203_22 & (~ _zz__zz_when_Axi4Crossbar_l203_24)) : (_zz_when_Axi4Crossbar_l203_23 & (~ _zz__zz_when_Axi4Crossbar_l203_24_1)));
  always @(*) begin
    _zz_io_slaves_1_ar_payload_id = 1'b0;
    if(when_Axi4Crossbar_l203_8) begin
      _zz_io_slaves_1_ar_payload_id = 1'b0;
    end
    if(when_Axi4Crossbar_l203_9) begin
      _zz_io_slaves_1_ar_payload_id = 1'b1;
    end
  end

  assign when_Axi4Crossbar_l203_8 = _zz_when_Axi4Crossbar_l203_24[0];
  assign when_Axi4Crossbar_l203_9 = _zz_when_Axi4Crossbar_l203_24[1];
  assign when_Axi4Crossbar_l420_1 = (|_zz_when_Axi4Crossbar_l420_3);
  assign when_Axi4Crossbar_l423_2 = (_zz_io_slaves_1_ar_payload_id == 1'b0);
  assign when_Axi4Crossbar_l423_3 = (_zz_io_slaves_1_ar_payload_id == 1'b1);
  assign io_slaves_1_ar_fire = (m1_axi_arvalid && m1_axi_arready);
  assign when_Axi4Crossbar_l437_2 = (_zz_when_Axi4Crossbar_l437_1 == 1'b0);
  assign when_Axi4Crossbar_l437_3 = (_zz_when_Axi4Crossbar_l437_1 == 1'b1);
  assign io_slaves_1_r_fire = (m1_axi_rvalid && m1_axi_rready);
  assign when_Axi4Crossbar_l447_1 = (io_slaves_1_r_fire && m1_axi_rlast);
  assign when_Axi4Crossbar_l405_2 = (! _zz_when_Axi4Crossbar_l405_2);
  always @(*) begin
    _zz_when_Axi4Crossbar_l420_7[0] = ((32'h0 <= s0_axi_araddr) && (s0_axi_araddr < 32'h80000000));
    _zz_when_Axi4Crossbar_l420_7[1] = ((32'h80000000 <= s0_axi_araddr) && (s0_axi_araddr < 32'ha0000000));
  end

  always @(*) begin
    _zz_when_Axi4Crossbar_l420_6[0] = (s0_axi_arvalid && _zz__zz_when_Axi4Crossbar_l420_6[2]);
    _zz_when_Axi4Crossbar_l420_6[1] = (s1_axi_arvalid && _zz__zz_when_Axi4Crossbar_l420_6_1[2]);
  end

  always @(*) begin
    _zz_when_Axi4Crossbar_l420_8[0] = ((32'h0 <= s1_axi_araddr) && (s1_axi_araddr < 32'h80000000));
    _zz_when_Axi4Crossbar_l420_8[1] = ((32'h80000000 <= s1_axi_araddr) && (s1_axi_araddr < 32'ha0000000));
  end

  always @(*) begin
    _zz_when_Axi4Crossbar_l203_25[0] = (rdRrPtr_2 <= 1'b0);
    _zz_when_Axi4Crossbar_l203_25[1] = (rdRrPtr_2 <= 1'b1);
  end

  assign _zz_when_Axi4Crossbar_l203_26 = (_zz_when_Axi4Crossbar_l420_6 & _zz_when_Axi4Crossbar_l203_25);
  assign _zz_when_Axi4Crossbar_l203_27 = _zz_when_Axi4Crossbar_l203_26;
  assign _zz_when_Axi4Crossbar_l203_28 = _zz_when_Axi4Crossbar_l420_6;
  assign _zz_when_Axi4Crossbar_l203_29 = ((|_zz_when_Axi4Crossbar_l203_26) ? (_zz_when_Axi4Crossbar_l203_27 & (~ _zz__zz_when_Axi4Crossbar_l203_29)) : (_zz_when_Axi4Crossbar_l203_28 & (~ _zz__zz_when_Axi4Crossbar_l203_29_1)));
  always @(*) begin
    _zz_rdRrPtr_2 = 1'b0;
    if(when_Axi4Crossbar_l203_10) begin
      _zz_rdRrPtr_2 = 1'b0;
    end
    if(when_Axi4Crossbar_l203_11) begin
      _zz_rdRrPtr_2 = 1'b1;
    end
  end

  assign when_Axi4Crossbar_l203_10 = _zz_when_Axi4Crossbar_l203_29[0];
  assign when_Axi4Crossbar_l203_11 = _zz_when_Axi4Crossbar_l203_29[1];
  assign when_Axi4Crossbar_l420_2 = (|_zz_when_Axi4Crossbar_l420_6);
  assign when_Axi4Crossbar_l423_4 = (_zz_rdRrPtr_2 == 1'b0);
  assign when_Axi4Crossbar_l423_5 = (_zz_rdRrPtr_2 == 1'b1);
  assign decErr_io_axi_ar_fire = (decErr_io_axi_ar_valid && decErr_io_axi_ar_ready);
  assign when_Axi4Crossbar_l437_4 = (_zz_when_Axi4Crossbar_l437_2 == 1'b0);
  assign when_Axi4Crossbar_l437_5 = (_zz_when_Axi4Crossbar_l437_2 == 1'b1);
  assign decErr_io_axi_r_fire = (decErr_io_axi_r_valid && decErr_io_axi_r_ready);
  assign when_Axi4Crossbar_l447_2 = (decErr_io_axi_r_fire && decErr_io_axi_r_payload_last);
  always @(posedge aclk) begin
    if(!aresetn) begin
      wrRrPtr_0 <= 1'b0;
      wrRrPtr_1 <= 1'b0;
      wrRrPtr_2 <= 1'b0;
      rdRrPtr_0 <= 1'b0;
      rdRrPtr_1 <= 1'b0;
      rdRrPtr_2 <= 1'b0;
      _zz_when_Axi4Crossbar_l345 <= 1'b0;
      _zz_when_Axi4Crossbar_l345_1 <= 1'b0;
      _zz_when_Axi4Crossbar_l345_2 <= 1'b0;
      _zz_when_Axi4Crossbar_l386 <= 1'b0;
      _zz_when_Axi4Crossbar_l386_1 <= 1'b0;
      _zz_when_Axi4Crossbar_l386_2 <= 1'b0;
      _zz_when_Axi4Crossbar_l405 <= 1'b0;
      _zz_when_Axi4Crossbar_l405_1 <= 1'b0;
      _zz_when_Axi4Crossbar_l405_2 <= 1'b0;
      _zz_when_Axi4Crossbar_l437 <= 1'b0;
      _zz_when_Axi4Crossbar_l437_1 <= 1'b0;
      _zz_when_Axi4Crossbar_l437_2 <= 1'b0;
    end else begin
      if(when_Axi4Crossbar_l345) begin
        if(when_Axi4Crossbar_l360) begin
          if(io_slaves_0_aw_fire) begin
            _zz_when_Axi4Crossbar_l345 <= 1'b1;
            _zz_when_Axi4Crossbar_l386 <= _zz_io_slaves_0_aw_payload_id;
            wrRrPtr_0 <= (_zz_io_slaves_0_aw_payload_id + 1'b1);
          end
        end
      end else begin
        if(io_slaves_0_b_fire) begin
          _zz_when_Axi4Crossbar_l345 <= 1'b0;
        end
      end
      if(when_Axi4Crossbar_l345_1) begin
        if(when_Axi4Crossbar_l360_1) begin
          if(io_slaves_1_aw_fire) begin
            _zz_when_Axi4Crossbar_l345_1 <= 1'b1;
            _zz_when_Axi4Crossbar_l386_1 <= _zz_io_slaves_1_aw_payload_id;
            wrRrPtr_1 <= (_zz_io_slaves_1_aw_payload_id + 1'b1);
          end
        end
      end else begin
        if(io_slaves_1_b_fire) begin
          _zz_when_Axi4Crossbar_l345_1 <= 1'b0;
        end
      end
      if(when_Axi4Crossbar_l345_2) begin
        if(when_Axi4Crossbar_l360_2) begin
          if(decErr_io_axi_aw_fire) begin
            _zz_when_Axi4Crossbar_l345_2 <= 1'b1;
            _zz_when_Axi4Crossbar_l386_2 <= _zz_wrRrPtr_2;
            wrRrPtr_2 <= (_zz_wrRrPtr_2 + 1'b1);
          end
        end
      end else begin
        if(decErr_io_axi_b_fire) begin
          _zz_when_Axi4Crossbar_l345_2 <= 1'b0;
        end
      end
      if(when_Axi4Crossbar_l405) begin
        if(when_Axi4Crossbar_l420) begin
          if(io_slaves_0_ar_fire) begin
            _zz_when_Axi4Crossbar_l405 <= 1'b1;
            _zz_when_Axi4Crossbar_l437 <= _zz_io_slaves_0_ar_payload_id;
            rdRrPtr_0 <= (_zz_io_slaves_0_ar_payload_id + 1'b1);
          end
        end
      end else begin
        if(when_Axi4Crossbar_l447) begin
          _zz_when_Axi4Crossbar_l405 <= 1'b0;
        end
      end
      if(when_Axi4Crossbar_l405_1) begin
        if(when_Axi4Crossbar_l420_1) begin
          if(io_slaves_1_ar_fire) begin
            _zz_when_Axi4Crossbar_l405_1 <= 1'b1;
            _zz_when_Axi4Crossbar_l437_1 <= _zz_io_slaves_1_ar_payload_id;
            rdRrPtr_1 <= (_zz_io_slaves_1_ar_payload_id + 1'b1);
          end
        end
      end else begin
        if(when_Axi4Crossbar_l447_1) begin
          _zz_when_Axi4Crossbar_l405_1 <= 1'b0;
        end
      end
      if(when_Axi4Crossbar_l405_2) begin
        if(when_Axi4Crossbar_l420_2) begin
          if(decErr_io_axi_ar_fire) begin
            _zz_when_Axi4Crossbar_l405_2 <= 1'b1;
            _zz_when_Axi4Crossbar_l437_2 <= _zz_rdRrPtr_2;
            rdRrPtr_2 <= (_zz_rdRrPtr_2 + 1'b1);
          end
        end
      end else begin
        if(when_Axi4Crossbar_l447_2) begin
          _zz_when_Axi4Crossbar_l405_2 <= 1'b0;
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
  input  wire [63:0]   io_axi_w_payload_data,
  input  wire [7:0]    io_axi_w_payload_strb,
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
  output reg  [63:0]   io_axi_r_payload_data,
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
  wire       [71:0]   _zz_io_axi_r_payload_data;
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
  assign _zz_io_axi_r_payload_data = 72'h0;
  always @(*) begin
    io_axi_r_payload_data = _zz_io_axi_r_payload_data[63 : 0];
    io_axi_r_payload_data = 64'h0;
  end

  always @(*) begin
    io_axi_r_payload_id = _zz_io_axi_r_payload_data[68 : 64];
    io_axi_r_payload_id = read_id;
  end

  always @(*) begin
    io_axi_r_payload_resp = _zz_io_axi_r_payload_data[70 : 69];
    io_axi_r_payload_resp = 2'b11;
  end

  always @(*) begin
    io_axi_r_payload_last = _zz_io_axi_r_payload_data[71];
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
