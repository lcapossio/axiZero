// Copyright (c) 2026 Leonardo Capossio - bard0 design  hello@bard0.com
// SPDX-License-Identifier: MIT
// Generator : SpinalHDL v1.14.2    git head : 78f29dc66110fc099a777992b6daa2f803ab445e
// Component : AxiZeroMixedTop
// Git hash  : c7f02aefbe00cd12f17e50e87e7cc6a26db8edf3

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

  wire       [1:0]    _zz__zz_when_Axi4Crossbar_l167_4;
  wire       [1:0]    _zz__zz_when_Axi4Crossbar_l167_4_1;
  wire       [1:0]    _zz__zz_when_Axi4Crossbar_l167_9;
  wire       [1:0]    _zz__zz_when_Axi4Crossbar_l167_9_1;
  wire       [1:0]    _zz__zz_when_Axi4Crossbar_l167_14;
  wire       [1:0]    _zz__zz_when_Axi4Crossbar_l167_14_1;
  wire       [1:0]    _zz__zz_when_Axi4Crossbar_l167_19;
  wire       [1:0]    _zz__zz_when_Axi4Crossbar_l167_19_1;
  reg        [0:0]    wrRrPtr_0;
  reg        [0:0]    wrRrPtr_1;
  reg        [0:0]    rdRrPtr_0;
  reg        [0:0]    rdRrPtr_1;
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
  reg                 _zz_when_Axi4Crossbar_l309;
  reg                 _zz_when_Axi4Crossbar_l309_1;
  reg        [0:0]    _zz_when_Axi4Crossbar_l350;
  reg        [0:0]    _zz_when_Axi4Crossbar_l350_1;
  reg                 _zz_when_Axi4Crossbar_l369;
  reg                 _zz_when_Axi4Crossbar_l369_1;
  reg        [0:0]    _zz_when_Axi4Crossbar_l401;
  reg        [0:0]    _zz_when_Axi4Crossbar_l401_1;
  wire                when_Axi4Crossbar_l309;
  reg        [1:0]    _zz_when_Axi4Crossbar_l324;
  reg        [1:0]    _zz_when_Axi4Crossbar_l324_1;
  reg        [1:0]    _zz_when_Axi4Crossbar_l324_2;
  reg        [1:0]    _zz_when_Axi4Crossbar_l167;
  wire       [1:0]    _zz_when_Axi4Crossbar_l167_1;
  wire       [1:0]    _zz_when_Axi4Crossbar_l167_2;
  wire       [1:0]    _zz_when_Axi4Crossbar_l167_3;
  wire       [1:0]    _zz_when_Axi4Crossbar_l167_4;
  reg        [0:0]    _zz_io_slaves_0_aw_payload_id;
  wire                when_Axi4Crossbar_l167;
  wire                when_Axi4Crossbar_l167_1;
  wire                when_Axi4Crossbar_l324;
  wire                when_Axi4Crossbar_l327;
  wire                when_Axi4Crossbar_l327_1;
  wire                io_slaves_0_aw_fire;
  wire                when_Axi4Crossbar_l350;
  wire                when_Axi4Crossbar_l350_1;
  wire                io_slaves_0_b_fire;
  wire                when_Axi4Crossbar_l309_1;
  reg        [1:0]    _zz_when_Axi4Crossbar_l324_3;
  reg        [1:0]    _zz_when_Axi4Crossbar_l324_4;
  reg        [1:0]    _zz_when_Axi4Crossbar_l324_5;
  reg        [1:0]    _zz_when_Axi4Crossbar_l167_5;
  wire       [1:0]    _zz_when_Axi4Crossbar_l167_6;
  wire       [1:0]    _zz_when_Axi4Crossbar_l167_7;
  wire       [1:0]    _zz_when_Axi4Crossbar_l167_8;
  wire       [1:0]    _zz_when_Axi4Crossbar_l167_9;
  reg        [0:0]    _zz_io_slaves_1_aw_payload_id;
  wire                when_Axi4Crossbar_l167_2;
  wire                when_Axi4Crossbar_l167_3;
  wire                when_Axi4Crossbar_l324_1;
  wire                when_Axi4Crossbar_l327_2;
  wire                when_Axi4Crossbar_l327_3;
  wire                io_slaves_1_aw_fire;
  wire                when_Axi4Crossbar_l350_2;
  wire                when_Axi4Crossbar_l350_3;
  wire                io_slaves_1_b_fire;
  wire                when_Axi4Crossbar_l369;
  reg        [1:0]    _zz_when_Axi4Crossbar_l384;
  reg        [1:0]    _zz_when_Axi4Crossbar_l384_1;
  reg        [1:0]    _zz_when_Axi4Crossbar_l384_2;
  reg        [1:0]    _zz_when_Axi4Crossbar_l167_10;
  wire       [1:0]    _zz_when_Axi4Crossbar_l167_11;
  wire       [1:0]    _zz_when_Axi4Crossbar_l167_12;
  wire       [1:0]    _zz_when_Axi4Crossbar_l167_13;
  wire       [1:0]    _zz_when_Axi4Crossbar_l167_14;
  reg        [0:0]    _zz_io_slaves_0_ar_payload_id;
  wire                when_Axi4Crossbar_l167_4;
  wire                when_Axi4Crossbar_l167_5;
  wire                when_Axi4Crossbar_l384;
  wire                when_Axi4Crossbar_l387;
  wire                when_Axi4Crossbar_l387_1;
  wire                io_slaves_0_ar_fire;
  wire                when_Axi4Crossbar_l401;
  wire                when_Axi4Crossbar_l401_1;
  wire                io_slaves_0_r_fire;
  wire                when_Axi4Crossbar_l411;
  wire                when_Axi4Crossbar_l369_1;
  reg        [1:0]    _zz_when_Axi4Crossbar_l384_3;
  reg        [1:0]    _zz_when_Axi4Crossbar_l384_4;
  reg        [1:0]    _zz_when_Axi4Crossbar_l384_5;
  reg        [1:0]    _zz_when_Axi4Crossbar_l167_15;
  wire       [1:0]    _zz_when_Axi4Crossbar_l167_16;
  wire       [1:0]    _zz_when_Axi4Crossbar_l167_17;
  wire       [1:0]    _zz_when_Axi4Crossbar_l167_18;
  wire       [1:0]    _zz_when_Axi4Crossbar_l167_19;
  reg        [0:0]    _zz_io_slaves_1_ar_payload_id;
  wire                when_Axi4Crossbar_l167_6;
  wire                when_Axi4Crossbar_l167_7;
  wire                when_Axi4Crossbar_l384_1;
  wire                when_Axi4Crossbar_l387_2;
  wire                when_Axi4Crossbar_l387_3;
  wire                io_slaves_1_ar_fire;
  wire                when_Axi4Crossbar_l401_2;
  wire                when_Axi4Crossbar_l401_3;
  wire                io_slaves_1_r_fire;
  wire                when_Axi4Crossbar_l411_1;

  assign _zz__zz_when_Axi4Crossbar_l167_4 = (_zz_when_Axi4Crossbar_l167_2 - 2'b01);
  assign _zz__zz_when_Axi4Crossbar_l167_4_1 = (_zz_when_Axi4Crossbar_l167_3 - 2'b01);
  assign _zz__zz_when_Axi4Crossbar_l167_9 = (_zz_when_Axi4Crossbar_l167_7 - 2'b01);
  assign _zz__zz_when_Axi4Crossbar_l167_9_1 = (_zz_when_Axi4Crossbar_l167_8 - 2'b01);
  assign _zz__zz_when_Axi4Crossbar_l167_14 = (_zz_when_Axi4Crossbar_l167_12 - 2'b01);
  assign _zz__zz_when_Axi4Crossbar_l167_14_1 = (_zz_when_Axi4Crossbar_l167_13 - 2'b01);
  assign _zz__zz_when_Axi4Crossbar_l167_19 = (_zz_when_Axi4Crossbar_l167_17 - 2'b01);
  assign _zz__zz_when_Axi4Crossbar_l167_19_1 = (_zz_when_Axi4Crossbar_l167_18 - 2'b01);
  always @(*) begin
    s0_axi_awready = 1'b0;
    if(when_Axi4Crossbar_l309) begin
      if(when_Axi4Crossbar_l324) begin
        if(when_Axi4Crossbar_l327) begin
          s0_axi_awready = m0_axi_awready;
        end
      end
    end
    if(when_Axi4Crossbar_l309_1) begin
      if(when_Axi4Crossbar_l324_1) begin
        if(when_Axi4Crossbar_l327_2) begin
          s0_axi_awready = m1_axi_awready;
        end
      end
    end
  end

  always @(*) begin
    s0_axi_wready = 1'b0;
    if(when_Axi4Crossbar_l309) begin
      if(when_Axi4Crossbar_l324) begin
        if(when_Axi4Crossbar_l327) begin
          s0_axi_wready = m0_axi_wready;
        end
      end
    end else begin
      if(when_Axi4Crossbar_l350) begin
        s0_axi_wready = m0_axi_wready;
      end
    end
    if(when_Axi4Crossbar_l309_1) begin
      if(when_Axi4Crossbar_l324_1) begin
        if(when_Axi4Crossbar_l327_2) begin
          s0_axi_wready = m1_axi_wready;
        end
      end
    end else begin
      if(when_Axi4Crossbar_l350_2) begin
        s0_axi_wready = m1_axi_wready;
      end
    end
  end

  always @(*) begin
    s0_axi_bvalid = 1'b0;
    if(!when_Axi4Crossbar_l309) begin
      if(when_Axi4Crossbar_l350) begin
        s0_axi_bvalid = m0_axi_bvalid;
      end
    end
    if(!when_Axi4Crossbar_l309_1) begin
      if(when_Axi4Crossbar_l350_2) begin
        s0_axi_bvalid = m1_axi_bvalid;
      end
    end
  end

  assign _zz_io_masters_0_b_payload_id = 6'h0;
  always @(*) begin
    s0_axi_bid = _zz_io_masters_0_b_payload_id[3 : 0];
    if(!when_Axi4Crossbar_l309) begin
      if(when_Axi4Crossbar_l350) begin
        s0_axi_bid = m0_axi_bid[3 : 0];
      end
    end
    if(!when_Axi4Crossbar_l309_1) begin
      if(when_Axi4Crossbar_l350_2) begin
        s0_axi_bid = m1_axi_bid[3 : 0];
      end
    end
  end

  always @(*) begin
    s0_axi_bresp = _zz_io_masters_0_b_payload_id[5 : 4];
    if(!when_Axi4Crossbar_l309) begin
      if(when_Axi4Crossbar_l350) begin
        s0_axi_bresp = m0_axi_bresp;
      end
    end
    if(!when_Axi4Crossbar_l309_1) begin
      if(when_Axi4Crossbar_l350_2) begin
        s0_axi_bresp = m1_axi_bresp;
      end
    end
  end

  always @(*) begin
    s0_axi_arready = 1'b0;
    if(when_Axi4Crossbar_l369) begin
      if(when_Axi4Crossbar_l384) begin
        if(when_Axi4Crossbar_l387) begin
          s0_axi_arready = m0_axi_arready;
        end
      end
    end
    if(when_Axi4Crossbar_l369_1) begin
      if(when_Axi4Crossbar_l384_1) begin
        if(when_Axi4Crossbar_l387_2) begin
          s0_axi_arready = m1_axi_arready;
        end
      end
    end
  end

  always @(*) begin
    s0_axi_rvalid = 1'b0;
    if(!when_Axi4Crossbar_l369) begin
      if(when_Axi4Crossbar_l401) begin
        s0_axi_rvalid = m0_axi_rvalid;
      end
    end
    if(!when_Axi4Crossbar_l369_1) begin
      if(when_Axi4Crossbar_l401_2) begin
        s0_axi_rvalid = m1_axi_rvalid;
      end
    end
  end

  assign _zz_io_masters_0_r_payload_data = 71'h0;
  always @(*) begin
    s0_axi_rdata = _zz_io_masters_0_r_payload_data[63 : 0];
    if(!when_Axi4Crossbar_l369) begin
      if(when_Axi4Crossbar_l401) begin
        s0_axi_rdata = m0_axi_rdata;
      end
    end
    if(!when_Axi4Crossbar_l369_1) begin
      if(when_Axi4Crossbar_l401_2) begin
        s0_axi_rdata = m1_axi_rdata;
      end
    end
  end

  always @(*) begin
    s0_axi_rid = _zz_io_masters_0_r_payload_data[67 : 64];
    if(!when_Axi4Crossbar_l369) begin
      if(when_Axi4Crossbar_l401) begin
        s0_axi_rid = m0_axi_rid[3 : 0];
      end
    end
    if(!when_Axi4Crossbar_l369_1) begin
      if(when_Axi4Crossbar_l401_2) begin
        s0_axi_rid = m1_axi_rid[3 : 0];
      end
    end
  end

  always @(*) begin
    s0_axi_rresp = _zz_io_masters_0_r_payload_data[69 : 68];
    if(!when_Axi4Crossbar_l369) begin
      if(when_Axi4Crossbar_l401) begin
        s0_axi_rresp = m0_axi_rresp;
      end
    end
    if(!when_Axi4Crossbar_l369_1) begin
      if(when_Axi4Crossbar_l401_2) begin
        s0_axi_rresp = m1_axi_rresp;
      end
    end
  end

  always @(*) begin
    s0_axi_rlast = _zz_io_masters_0_r_payload_data[70];
    if(!when_Axi4Crossbar_l369) begin
      if(when_Axi4Crossbar_l401) begin
        s0_axi_rlast = m0_axi_rlast;
      end
    end
    if(!when_Axi4Crossbar_l369_1) begin
      if(when_Axi4Crossbar_l401_2) begin
        s0_axi_rlast = m1_axi_rlast;
      end
    end
  end

  always @(*) begin
    s1_axi_awready = 1'b0;
    if(when_Axi4Crossbar_l309) begin
      if(when_Axi4Crossbar_l324) begin
        if(when_Axi4Crossbar_l327_1) begin
          s1_axi_awready = m0_axi_awready;
        end
      end
    end
    if(when_Axi4Crossbar_l309_1) begin
      if(when_Axi4Crossbar_l324_1) begin
        if(when_Axi4Crossbar_l327_3) begin
          s1_axi_awready = m1_axi_awready;
        end
      end
    end
  end

  always @(*) begin
    s1_axi_wready = 1'b0;
    if(when_Axi4Crossbar_l309) begin
      if(when_Axi4Crossbar_l324) begin
        if(when_Axi4Crossbar_l327_1) begin
          s1_axi_wready = m0_axi_wready;
        end
      end
    end else begin
      if(when_Axi4Crossbar_l350_1) begin
        s1_axi_wready = m0_axi_wready;
      end
    end
    if(when_Axi4Crossbar_l309_1) begin
      if(when_Axi4Crossbar_l324_1) begin
        if(when_Axi4Crossbar_l327_3) begin
          s1_axi_wready = m1_axi_wready;
        end
      end
    end else begin
      if(when_Axi4Crossbar_l350_3) begin
        s1_axi_wready = m1_axi_wready;
      end
    end
  end

  always @(*) begin
    s1_axi_bvalid = 1'b0;
    if(!when_Axi4Crossbar_l309) begin
      if(when_Axi4Crossbar_l350_1) begin
        s1_axi_bvalid = m0_axi_bvalid;
      end
    end
    if(!when_Axi4Crossbar_l309_1) begin
      if(when_Axi4Crossbar_l350_3) begin
        s1_axi_bvalid = m1_axi_bvalid;
      end
    end
  end

  assign _zz_io_masters_1_b_payload_id = 6'h0;
  always @(*) begin
    s1_axi_bid = _zz_io_masters_1_b_payload_id[3 : 0];
    if(!when_Axi4Crossbar_l309) begin
      if(when_Axi4Crossbar_l350_1) begin
        s1_axi_bid = m0_axi_bid[3 : 0];
      end
    end
    if(!when_Axi4Crossbar_l309_1) begin
      if(when_Axi4Crossbar_l350_3) begin
        s1_axi_bid = m1_axi_bid[3 : 0];
      end
    end
  end

  always @(*) begin
    s1_axi_bresp = _zz_io_masters_1_b_payload_id[5 : 4];
    if(!when_Axi4Crossbar_l309) begin
      if(when_Axi4Crossbar_l350_1) begin
        s1_axi_bresp = m0_axi_bresp;
      end
    end
    if(!when_Axi4Crossbar_l309_1) begin
      if(when_Axi4Crossbar_l350_3) begin
        s1_axi_bresp = m1_axi_bresp;
      end
    end
  end

  always @(*) begin
    s1_axi_arready = 1'b0;
    if(when_Axi4Crossbar_l369) begin
      if(when_Axi4Crossbar_l384) begin
        if(when_Axi4Crossbar_l387_1) begin
          s1_axi_arready = m0_axi_arready;
        end
      end
    end
    if(when_Axi4Crossbar_l369_1) begin
      if(when_Axi4Crossbar_l384_1) begin
        if(when_Axi4Crossbar_l387_3) begin
          s1_axi_arready = m1_axi_arready;
        end
      end
    end
  end

  always @(*) begin
    s1_axi_rvalid = 1'b0;
    if(!when_Axi4Crossbar_l369) begin
      if(when_Axi4Crossbar_l401_1) begin
        s1_axi_rvalid = m0_axi_rvalid;
      end
    end
    if(!when_Axi4Crossbar_l369_1) begin
      if(when_Axi4Crossbar_l401_3) begin
        s1_axi_rvalid = m1_axi_rvalid;
      end
    end
  end

  assign _zz_io_masters_1_r_payload_data = 71'h0;
  always @(*) begin
    s1_axi_rdata = _zz_io_masters_1_r_payload_data[63 : 0];
    if(!when_Axi4Crossbar_l369) begin
      if(when_Axi4Crossbar_l401_1) begin
        s1_axi_rdata = m0_axi_rdata;
      end
    end
    if(!when_Axi4Crossbar_l369_1) begin
      if(when_Axi4Crossbar_l401_3) begin
        s1_axi_rdata = m1_axi_rdata;
      end
    end
  end

  always @(*) begin
    s1_axi_rid = _zz_io_masters_1_r_payload_data[67 : 64];
    if(!when_Axi4Crossbar_l369) begin
      if(when_Axi4Crossbar_l401_1) begin
        s1_axi_rid = m0_axi_rid[3 : 0];
      end
    end
    if(!when_Axi4Crossbar_l369_1) begin
      if(when_Axi4Crossbar_l401_3) begin
        s1_axi_rid = m1_axi_rid[3 : 0];
      end
    end
  end

  always @(*) begin
    s1_axi_rresp = _zz_io_masters_1_r_payload_data[69 : 68];
    if(!when_Axi4Crossbar_l369) begin
      if(when_Axi4Crossbar_l401_1) begin
        s1_axi_rresp = m0_axi_rresp;
      end
    end
    if(!when_Axi4Crossbar_l369_1) begin
      if(when_Axi4Crossbar_l401_3) begin
        s1_axi_rresp = m1_axi_rresp;
      end
    end
  end

  always @(*) begin
    s1_axi_rlast = _zz_io_masters_1_r_payload_data[70];
    if(!when_Axi4Crossbar_l369) begin
      if(when_Axi4Crossbar_l401_1) begin
        s1_axi_rlast = m0_axi_rlast;
      end
    end
    if(!when_Axi4Crossbar_l369_1) begin
      if(when_Axi4Crossbar_l401_3) begin
        s1_axi_rlast = m1_axi_rlast;
      end
    end
  end

  always @(*) begin
    m0_axi_awvalid = 1'b0;
    if(when_Axi4Crossbar_l309) begin
      if(when_Axi4Crossbar_l324) begin
        m0_axi_awvalid = 1'b1;
      end
    end
  end

  assign _zz_io_slaves_0_aw_payload_addr = 66'h0;
  always @(*) begin
    m0_axi_awaddr = _zz_io_slaves_0_aw_payload_addr[31 : 0];
    if(when_Axi4Crossbar_l309) begin
      if(when_Axi4Crossbar_l324) begin
        if(when_Axi4Crossbar_l327) begin
          m0_axi_awaddr = s0_axi_awaddr;
        end
        if(when_Axi4Crossbar_l327_1) begin
          m0_axi_awaddr = s1_axi_awaddr;
        end
      end
    end
  end

  always @(*) begin
    m0_axi_awid = _zz_io_slaves_0_aw_payload_addr[36 : 32];
    if(when_Axi4Crossbar_l309) begin
      if(when_Axi4Crossbar_l324) begin
        if(when_Axi4Crossbar_l327) begin
          m0_axi_awid = {_zz_io_slaves_0_aw_payload_id,s0_axi_awid};
        end
        if(when_Axi4Crossbar_l327_1) begin
          m0_axi_awid = {_zz_io_slaves_0_aw_payload_id,s1_axi_awid};
        end
      end
    end
  end

  assign m0_axi_awregion = _zz_io_slaves_0_aw_payload_addr[40 : 37];
  always @(*) begin
    m0_axi_awlen = _zz_io_slaves_0_aw_payload_addr[48 : 41];
    if(when_Axi4Crossbar_l309) begin
      if(when_Axi4Crossbar_l324) begin
        if(when_Axi4Crossbar_l327) begin
          m0_axi_awlen = s0_axi_awlen;
        end
        if(when_Axi4Crossbar_l327_1) begin
          m0_axi_awlen = s1_axi_awlen;
        end
      end
    end
  end

  always @(*) begin
    m0_axi_awsize = _zz_io_slaves_0_aw_payload_addr[51 : 49];
    if(when_Axi4Crossbar_l309) begin
      if(when_Axi4Crossbar_l324) begin
        if(when_Axi4Crossbar_l327) begin
          m0_axi_awsize = s0_axi_awsize;
        end
        if(when_Axi4Crossbar_l327_1) begin
          m0_axi_awsize = s1_axi_awsize;
        end
      end
    end
  end

  always @(*) begin
    m0_axi_awburst = _zz_io_slaves_0_aw_payload_addr[53 : 52];
    if(when_Axi4Crossbar_l309) begin
      if(when_Axi4Crossbar_l324) begin
        if(when_Axi4Crossbar_l327) begin
          m0_axi_awburst = s0_axi_awburst;
        end
        if(when_Axi4Crossbar_l327_1) begin
          m0_axi_awburst = s1_axi_awburst;
        end
      end
    end
  end

  always @(*) begin
    m0_axi_awlock = _zz_io_slaves_0_aw_payload_addr[54 : 54];
    if(when_Axi4Crossbar_l309) begin
      if(when_Axi4Crossbar_l324) begin
        if(when_Axi4Crossbar_l327) begin
          m0_axi_awlock = s0_axi_awlock;
        end
        if(when_Axi4Crossbar_l327_1) begin
          m0_axi_awlock = s1_axi_awlock;
        end
      end
    end
  end

  always @(*) begin
    m0_axi_awcache = _zz_io_slaves_0_aw_payload_addr[58 : 55];
    if(when_Axi4Crossbar_l309) begin
      if(when_Axi4Crossbar_l324) begin
        if(when_Axi4Crossbar_l327) begin
          m0_axi_awcache = s0_axi_awcache;
        end
        if(when_Axi4Crossbar_l327_1) begin
          m0_axi_awcache = s1_axi_awcache;
        end
      end
    end
  end

  always @(*) begin
    m0_axi_awqos = _zz_io_slaves_0_aw_payload_addr[62 : 59];
    if(when_Axi4Crossbar_l309) begin
      if(when_Axi4Crossbar_l324) begin
        if(when_Axi4Crossbar_l327) begin
          m0_axi_awqos = s0_axi_awqos;
        end
        if(when_Axi4Crossbar_l327_1) begin
          m0_axi_awqos = s1_axi_awqos;
        end
      end
    end
  end

  always @(*) begin
    m0_axi_awprot = _zz_io_slaves_0_aw_payload_addr[65 : 63];
    if(when_Axi4Crossbar_l309) begin
      if(when_Axi4Crossbar_l324) begin
        if(when_Axi4Crossbar_l327) begin
          m0_axi_awprot = s0_axi_awprot;
        end
        if(when_Axi4Crossbar_l327_1) begin
          m0_axi_awprot = s1_axi_awprot;
        end
      end
    end
  end

  always @(*) begin
    m0_axi_wvalid = 1'b0;
    if(when_Axi4Crossbar_l309) begin
      if(when_Axi4Crossbar_l324) begin
        if(when_Axi4Crossbar_l327) begin
          m0_axi_wvalid = s0_axi_wvalid;
        end
        if(when_Axi4Crossbar_l327_1) begin
          m0_axi_wvalid = s1_axi_wvalid;
        end
      end
    end else begin
      if(when_Axi4Crossbar_l350) begin
        m0_axi_wvalid = s0_axi_wvalid;
      end
      if(when_Axi4Crossbar_l350_1) begin
        m0_axi_wvalid = s1_axi_wvalid;
      end
    end
  end

  assign _zz_io_slaves_0_w_payload_data = 73'h0;
  always @(*) begin
    m0_axi_wdata = _zz_io_slaves_0_w_payload_data[63 : 0];
    if(when_Axi4Crossbar_l309) begin
      if(when_Axi4Crossbar_l324) begin
        if(when_Axi4Crossbar_l327) begin
          m0_axi_wdata = s0_axi_wdata;
        end
        if(when_Axi4Crossbar_l327_1) begin
          m0_axi_wdata = s1_axi_wdata;
        end
      end
    end else begin
      if(when_Axi4Crossbar_l350) begin
        m0_axi_wdata = s0_axi_wdata;
      end
      if(when_Axi4Crossbar_l350_1) begin
        m0_axi_wdata = s1_axi_wdata;
      end
    end
  end

  always @(*) begin
    m0_axi_wstrb = _zz_io_slaves_0_w_payload_data[71 : 64];
    if(when_Axi4Crossbar_l309) begin
      if(when_Axi4Crossbar_l324) begin
        if(when_Axi4Crossbar_l327) begin
          m0_axi_wstrb = s0_axi_wstrb;
        end
        if(when_Axi4Crossbar_l327_1) begin
          m0_axi_wstrb = s1_axi_wstrb;
        end
      end
    end else begin
      if(when_Axi4Crossbar_l350) begin
        m0_axi_wstrb = s0_axi_wstrb;
      end
      if(when_Axi4Crossbar_l350_1) begin
        m0_axi_wstrb = s1_axi_wstrb;
      end
    end
  end

  always @(*) begin
    m0_axi_wlast = _zz_io_slaves_0_w_payload_data[72];
    if(when_Axi4Crossbar_l309) begin
      if(when_Axi4Crossbar_l324) begin
        if(when_Axi4Crossbar_l327) begin
          m0_axi_wlast = s0_axi_wlast;
        end
        if(when_Axi4Crossbar_l327_1) begin
          m0_axi_wlast = s1_axi_wlast;
        end
      end
    end else begin
      if(when_Axi4Crossbar_l350) begin
        m0_axi_wlast = s0_axi_wlast;
      end
      if(when_Axi4Crossbar_l350_1) begin
        m0_axi_wlast = s1_axi_wlast;
      end
    end
  end

  always @(*) begin
    m0_axi_bready = 1'b0;
    if(!when_Axi4Crossbar_l309) begin
      if(when_Axi4Crossbar_l350) begin
        m0_axi_bready = s0_axi_bready;
      end
      if(when_Axi4Crossbar_l350_1) begin
        m0_axi_bready = s1_axi_bready;
      end
    end
  end

  always @(*) begin
    m0_axi_arvalid = 1'b0;
    if(when_Axi4Crossbar_l369) begin
      if(when_Axi4Crossbar_l384) begin
        m0_axi_arvalid = 1'b1;
      end
    end
  end

  assign _zz_io_slaves_0_ar_payload_addr = 66'h0;
  always @(*) begin
    m0_axi_araddr = _zz_io_slaves_0_ar_payload_addr[31 : 0];
    if(when_Axi4Crossbar_l369) begin
      if(when_Axi4Crossbar_l384) begin
        if(when_Axi4Crossbar_l387) begin
          m0_axi_araddr = s0_axi_araddr;
        end
        if(when_Axi4Crossbar_l387_1) begin
          m0_axi_araddr = s1_axi_araddr;
        end
      end
    end
  end

  always @(*) begin
    m0_axi_arid = _zz_io_slaves_0_ar_payload_addr[36 : 32];
    if(when_Axi4Crossbar_l369) begin
      if(when_Axi4Crossbar_l384) begin
        if(when_Axi4Crossbar_l387) begin
          m0_axi_arid = {_zz_io_slaves_0_ar_payload_id,s0_axi_arid};
        end
        if(when_Axi4Crossbar_l387_1) begin
          m0_axi_arid = {_zz_io_slaves_0_ar_payload_id,s1_axi_arid};
        end
      end
    end
  end

  assign m0_axi_arregion = _zz_io_slaves_0_ar_payload_addr[40 : 37];
  always @(*) begin
    m0_axi_arlen = _zz_io_slaves_0_ar_payload_addr[48 : 41];
    if(when_Axi4Crossbar_l369) begin
      if(when_Axi4Crossbar_l384) begin
        if(when_Axi4Crossbar_l387) begin
          m0_axi_arlen = s0_axi_arlen;
        end
        if(when_Axi4Crossbar_l387_1) begin
          m0_axi_arlen = s1_axi_arlen;
        end
      end
    end
  end

  always @(*) begin
    m0_axi_arsize = _zz_io_slaves_0_ar_payload_addr[51 : 49];
    if(when_Axi4Crossbar_l369) begin
      if(when_Axi4Crossbar_l384) begin
        if(when_Axi4Crossbar_l387) begin
          m0_axi_arsize = s0_axi_arsize;
        end
        if(when_Axi4Crossbar_l387_1) begin
          m0_axi_arsize = s1_axi_arsize;
        end
      end
    end
  end

  always @(*) begin
    m0_axi_arburst = _zz_io_slaves_0_ar_payload_addr[53 : 52];
    if(when_Axi4Crossbar_l369) begin
      if(when_Axi4Crossbar_l384) begin
        if(when_Axi4Crossbar_l387) begin
          m0_axi_arburst = s0_axi_arburst;
        end
        if(when_Axi4Crossbar_l387_1) begin
          m0_axi_arburst = s1_axi_arburst;
        end
      end
    end
  end

  always @(*) begin
    m0_axi_arlock = _zz_io_slaves_0_ar_payload_addr[54 : 54];
    if(when_Axi4Crossbar_l369) begin
      if(when_Axi4Crossbar_l384) begin
        if(when_Axi4Crossbar_l387) begin
          m0_axi_arlock = s0_axi_arlock;
        end
        if(when_Axi4Crossbar_l387_1) begin
          m0_axi_arlock = s1_axi_arlock;
        end
      end
    end
  end

  always @(*) begin
    m0_axi_arcache = _zz_io_slaves_0_ar_payload_addr[58 : 55];
    if(when_Axi4Crossbar_l369) begin
      if(when_Axi4Crossbar_l384) begin
        if(when_Axi4Crossbar_l387) begin
          m0_axi_arcache = s0_axi_arcache;
        end
        if(when_Axi4Crossbar_l387_1) begin
          m0_axi_arcache = s1_axi_arcache;
        end
      end
    end
  end

  always @(*) begin
    m0_axi_arqos = _zz_io_slaves_0_ar_payload_addr[62 : 59];
    if(when_Axi4Crossbar_l369) begin
      if(when_Axi4Crossbar_l384) begin
        if(when_Axi4Crossbar_l387) begin
          m0_axi_arqos = s0_axi_arqos;
        end
        if(when_Axi4Crossbar_l387_1) begin
          m0_axi_arqos = s1_axi_arqos;
        end
      end
    end
  end

  always @(*) begin
    m0_axi_arprot = _zz_io_slaves_0_ar_payload_addr[65 : 63];
    if(when_Axi4Crossbar_l369) begin
      if(when_Axi4Crossbar_l384) begin
        if(when_Axi4Crossbar_l387) begin
          m0_axi_arprot = s0_axi_arprot;
        end
        if(when_Axi4Crossbar_l387_1) begin
          m0_axi_arprot = s1_axi_arprot;
        end
      end
    end
  end

  always @(*) begin
    m0_axi_rready = 1'b0;
    if(!when_Axi4Crossbar_l369) begin
      if(when_Axi4Crossbar_l401) begin
        m0_axi_rready = s0_axi_rready;
      end
      if(when_Axi4Crossbar_l401_1) begin
        m0_axi_rready = s1_axi_rready;
      end
    end
  end

  always @(*) begin
    m1_axi_awvalid = 1'b0;
    if(when_Axi4Crossbar_l309_1) begin
      if(when_Axi4Crossbar_l324_1) begin
        m1_axi_awvalid = 1'b1;
      end
    end
  end

  assign _zz_io_slaves_1_aw_payload_addr = 66'h0;
  always @(*) begin
    m1_axi_awaddr = _zz_io_slaves_1_aw_payload_addr[31 : 0];
    if(when_Axi4Crossbar_l309_1) begin
      if(when_Axi4Crossbar_l324_1) begin
        if(when_Axi4Crossbar_l327_2) begin
          m1_axi_awaddr = s0_axi_awaddr;
        end
        if(when_Axi4Crossbar_l327_3) begin
          m1_axi_awaddr = s1_axi_awaddr;
        end
      end
    end
  end

  always @(*) begin
    m1_axi_awid = _zz_io_slaves_1_aw_payload_addr[36 : 32];
    if(when_Axi4Crossbar_l309_1) begin
      if(when_Axi4Crossbar_l324_1) begin
        if(when_Axi4Crossbar_l327_2) begin
          m1_axi_awid = {_zz_io_slaves_1_aw_payload_id,s0_axi_awid};
        end
        if(when_Axi4Crossbar_l327_3) begin
          m1_axi_awid = {_zz_io_slaves_1_aw_payload_id,s1_axi_awid};
        end
      end
    end
  end

  assign m1_axi_awregion = _zz_io_slaves_1_aw_payload_addr[40 : 37];
  always @(*) begin
    m1_axi_awlen = _zz_io_slaves_1_aw_payload_addr[48 : 41];
    if(when_Axi4Crossbar_l309_1) begin
      if(when_Axi4Crossbar_l324_1) begin
        if(when_Axi4Crossbar_l327_2) begin
          m1_axi_awlen = s0_axi_awlen;
        end
        if(when_Axi4Crossbar_l327_3) begin
          m1_axi_awlen = s1_axi_awlen;
        end
      end
    end
  end

  always @(*) begin
    m1_axi_awsize = _zz_io_slaves_1_aw_payload_addr[51 : 49];
    if(when_Axi4Crossbar_l309_1) begin
      if(when_Axi4Crossbar_l324_1) begin
        if(when_Axi4Crossbar_l327_2) begin
          m1_axi_awsize = s0_axi_awsize;
        end
        if(when_Axi4Crossbar_l327_3) begin
          m1_axi_awsize = s1_axi_awsize;
        end
      end
    end
  end

  always @(*) begin
    m1_axi_awburst = _zz_io_slaves_1_aw_payload_addr[53 : 52];
    if(when_Axi4Crossbar_l309_1) begin
      if(when_Axi4Crossbar_l324_1) begin
        if(when_Axi4Crossbar_l327_2) begin
          m1_axi_awburst = s0_axi_awburst;
        end
        if(when_Axi4Crossbar_l327_3) begin
          m1_axi_awburst = s1_axi_awburst;
        end
      end
    end
  end

  always @(*) begin
    m1_axi_awlock = _zz_io_slaves_1_aw_payload_addr[54 : 54];
    if(when_Axi4Crossbar_l309_1) begin
      if(when_Axi4Crossbar_l324_1) begin
        if(when_Axi4Crossbar_l327_2) begin
          m1_axi_awlock = s0_axi_awlock;
        end
        if(when_Axi4Crossbar_l327_3) begin
          m1_axi_awlock = s1_axi_awlock;
        end
      end
    end
  end

  always @(*) begin
    m1_axi_awcache = _zz_io_slaves_1_aw_payload_addr[58 : 55];
    if(when_Axi4Crossbar_l309_1) begin
      if(when_Axi4Crossbar_l324_1) begin
        if(when_Axi4Crossbar_l327_2) begin
          m1_axi_awcache = s0_axi_awcache;
        end
        if(when_Axi4Crossbar_l327_3) begin
          m1_axi_awcache = s1_axi_awcache;
        end
      end
    end
  end

  always @(*) begin
    m1_axi_awqos = _zz_io_slaves_1_aw_payload_addr[62 : 59];
    if(when_Axi4Crossbar_l309_1) begin
      if(when_Axi4Crossbar_l324_1) begin
        if(when_Axi4Crossbar_l327_2) begin
          m1_axi_awqos = s0_axi_awqos;
        end
        if(when_Axi4Crossbar_l327_3) begin
          m1_axi_awqos = s1_axi_awqos;
        end
      end
    end
  end

  always @(*) begin
    m1_axi_awprot = _zz_io_slaves_1_aw_payload_addr[65 : 63];
    if(when_Axi4Crossbar_l309_1) begin
      if(when_Axi4Crossbar_l324_1) begin
        if(when_Axi4Crossbar_l327_2) begin
          m1_axi_awprot = s0_axi_awprot;
        end
        if(when_Axi4Crossbar_l327_3) begin
          m1_axi_awprot = s1_axi_awprot;
        end
      end
    end
  end

  always @(*) begin
    m1_axi_wvalid = 1'b0;
    if(when_Axi4Crossbar_l309_1) begin
      if(when_Axi4Crossbar_l324_1) begin
        if(when_Axi4Crossbar_l327_2) begin
          m1_axi_wvalid = s0_axi_wvalid;
        end
        if(when_Axi4Crossbar_l327_3) begin
          m1_axi_wvalid = s1_axi_wvalid;
        end
      end
    end else begin
      if(when_Axi4Crossbar_l350_2) begin
        m1_axi_wvalid = s0_axi_wvalid;
      end
      if(when_Axi4Crossbar_l350_3) begin
        m1_axi_wvalid = s1_axi_wvalid;
      end
    end
  end

  assign _zz_io_slaves_1_w_payload_data = 73'h0;
  always @(*) begin
    m1_axi_wdata = _zz_io_slaves_1_w_payload_data[63 : 0];
    if(when_Axi4Crossbar_l309_1) begin
      if(when_Axi4Crossbar_l324_1) begin
        if(when_Axi4Crossbar_l327_2) begin
          m1_axi_wdata = s0_axi_wdata;
        end
        if(when_Axi4Crossbar_l327_3) begin
          m1_axi_wdata = s1_axi_wdata;
        end
      end
    end else begin
      if(when_Axi4Crossbar_l350_2) begin
        m1_axi_wdata = s0_axi_wdata;
      end
      if(when_Axi4Crossbar_l350_3) begin
        m1_axi_wdata = s1_axi_wdata;
      end
    end
  end

  always @(*) begin
    m1_axi_wstrb = _zz_io_slaves_1_w_payload_data[71 : 64];
    if(when_Axi4Crossbar_l309_1) begin
      if(when_Axi4Crossbar_l324_1) begin
        if(when_Axi4Crossbar_l327_2) begin
          m1_axi_wstrb = s0_axi_wstrb;
        end
        if(when_Axi4Crossbar_l327_3) begin
          m1_axi_wstrb = s1_axi_wstrb;
        end
      end
    end else begin
      if(when_Axi4Crossbar_l350_2) begin
        m1_axi_wstrb = s0_axi_wstrb;
      end
      if(when_Axi4Crossbar_l350_3) begin
        m1_axi_wstrb = s1_axi_wstrb;
      end
    end
  end

  always @(*) begin
    m1_axi_wlast = _zz_io_slaves_1_w_payload_data[72];
    if(when_Axi4Crossbar_l309_1) begin
      if(when_Axi4Crossbar_l324_1) begin
        if(when_Axi4Crossbar_l327_2) begin
          m1_axi_wlast = s0_axi_wlast;
        end
        if(when_Axi4Crossbar_l327_3) begin
          m1_axi_wlast = s1_axi_wlast;
        end
      end
    end else begin
      if(when_Axi4Crossbar_l350_2) begin
        m1_axi_wlast = s0_axi_wlast;
      end
      if(when_Axi4Crossbar_l350_3) begin
        m1_axi_wlast = s1_axi_wlast;
      end
    end
  end

  always @(*) begin
    m1_axi_bready = 1'b0;
    if(!when_Axi4Crossbar_l309_1) begin
      if(when_Axi4Crossbar_l350_2) begin
        m1_axi_bready = s0_axi_bready;
      end
      if(when_Axi4Crossbar_l350_3) begin
        m1_axi_bready = s1_axi_bready;
      end
    end
  end

  always @(*) begin
    m1_axi_arvalid = 1'b0;
    if(when_Axi4Crossbar_l369_1) begin
      if(when_Axi4Crossbar_l384_1) begin
        m1_axi_arvalid = 1'b1;
      end
    end
  end

  assign _zz_io_slaves_1_ar_payload_addr = 66'h0;
  always @(*) begin
    m1_axi_araddr = _zz_io_slaves_1_ar_payload_addr[31 : 0];
    if(when_Axi4Crossbar_l369_1) begin
      if(when_Axi4Crossbar_l384_1) begin
        if(when_Axi4Crossbar_l387_2) begin
          m1_axi_araddr = s0_axi_araddr;
        end
        if(when_Axi4Crossbar_l387_3) begin
          m1_axi_araddr = s1_axi_araddr;
        end
      end
    end
  end

  always @(*) begin
    m1_axi_arid = _zz_io_slaves_1_ar_payload_addr[36 : 32];
    if(when_Axi4Crossbar_l369_1) begin
      if(when_Axi4Crossbar_l384_1) begin
        if(when_Axi4Crossbar_l387_2) begin
          m1_axi_arid = {_zz_io_slaves_1_ar_payload_id,s0_axi_arid};
        end
        if(when_Axi4Crossbar_l387_3) begin
          m1_axi_arid = {_zz_io_slaves_1_ar_payload_id,s1_axi_arid};
        end
      end
    end
  end

  assign m1_axi_arregion = _zz_io_slaves_1_ar_payload_addr[40 : 37];
  always @(*) begin
    m1_axi_arlen = _zz_io_slaves_1_ar_payload_addr[48 : 41];
    if(when_Axi4Crossbar_l369_1) begin
      if(when_Axi4Crossbar_l384_1) begin
        if(when_Axi4Crossbar_l387_2) begin
          m1_axi_arlen = s0_axi_arlen;
        end
        if(when_Axi4Crossbar_l387_3) begin
          m1_axi_arlen = s1_axi_arlen;
        end
      end
    end
  end

  always @(*) begin
    m1_axi_arsize = _zz_io_slaves_1_ar_payload_addr[51 : 49];
    if(when_Axi4Crossbar_l369_1) begin
      if(when_Axi4Crossbar_l384_1) begin
        if(when_Axi4Crossbar_l387_2) begin
          m1_axi_arsize = s0_axi_arsize;
        end
        if(when_Axi4Crossbar_l387_3) begin
          m1_axi_arsize = s1_axi_arsize;
        end
      end
    end
  end

  always @(*) begin
    m1_axi_arburst = _zz_io_slaves_1_ar_payload_addr[53 : 52];
    if(when_Axi4Crossbar_l369_1) begin
      if(when_Axi4Crossbar_l384_1) begin
        if(when_Axi4Crossbar_l387_2) begin
          m1_axi_arburst = s0_axi_arburst;
        end
        if(when_Axi4Crossbar_l387_3) begin
          m1_axi_arburst = s1_axi_arburst;
        end
      end
    end
  end

  always @(*) begin
    m1_axi_arlock = _zz_io_slaves_1_ar_payload_addr[54 : 54];
    if(when_Axi4Crossbar_l369_1) begin
      if(when_Axi4Crossbar_l384_1) begin
        if(when_Axi4Crossbar_l387_2) begin
          m1_axi_arlock = s0_axi_arlock;
        end
        if(when_Axi4Crossbar_l387_3) begin
          m1_axi_arlock = s1_axi_arlock;
        end
      end
    end
  end

  always @(*) begin
    m1_axi_arcache = _zz_io_slaves_1_ar_payload_addr[58 : 55];
    if(when_Axi4Crossbar_l369_1) begin
      if(when_Axi4Crossbar_l384_1) begin
        if(when_Axi4Crossbar_l387_2) begin
          m1_axi_arcache = s0_axi_arcache;
        end
        if(when_Axi4Crossbar_l387_3) begin
          m1_axi_arcache = s1_axi_arcache;
        end
      end
    end
  end

  always @(*) begin
    m1_axi_arqos = _zz_io_slaves_1_ar_payload_addr[62 : 59];
    if(when_Axi4Crossbar_l369_1) begin
      if(when_Axi4Crossbar_l384_1) begin
        if(when_Axi4Crossbar_l387_2) begin
          m1_axi_arqos = s0_axi_arqos;
        end
        if(when_Axi4Crossbar_l387_3) begin
          m1_axi_arqos = s1_axi_arqos;
        end
      end
    end
  end

  always @(*) begin
    m1_axi_arprot = _zz_io_slaves_1_ar_payload_addr[65 : 63];
    if(when_Axi4Crossbar_l369_1) begin
      if(when_Axi4Crossbar_l384_1) begin
        if(when_Axi4Crossbar_l387_2) begin
          m1_axi_arprot = s0_axi_arprot;
        end
        if(when_Axi4Crossbar_l387_3) begin
          m1_axi_arprot = s1_axi_arprot;
        end
      end
    end
  end

  always @(*) begin
    m1_axi_rready = 1'b0;
    if(!when_Axi4Crossbar_l369_1) begin
      if(when_Axi4Crossbar_l401_2) begin
        m1_axi_rready = s0_axi_rready;
      end
      if(when_Axi4Crossbar_l401_3) begin
        m1_axi_rready = s1_axi_rready;
      end
    end
  end

  assign when_Axi4Crossbar_l309 = (! _zz_when_Axi4Crossbar_l309);
  always @(*) begin
    _zz_when_Axi4Crossbar_l324_1[0] = ((32'h0 <= s0_axi_awaddr) && (s0_axi_awaddr < 32'h80000000));
    _zz_when_Axi4Crossbar_l324_1[1] = ((32'h80000000 <= s0_axi_awaddr) && (s0_axi_awaddr < 32'ha0000000));
  end

  always @(*) begin
    _zz_when_Axi4Crossbar_l324[0] = (s0_axi_awvalid && _zz_when_Axi4Crossbar_l324_1[0]);
    _zz_when_Axi4Crossbar_l324[1] = (s1_axi_awvalid && _zz_when_Axi4Crossbar_l324_2[0]);
  end

  always @(*) begin
    _zz_when_Axi4Crossbar_l324_2[0] = ((32'h0 <= s1_axi_awaddr) && (s1_axi_awaddr < 32'h80000000));
    _zz_when_Axi4Crossbar_l324_2[1] = ((32'h80000000 <= s1_axi_awaddr) && (s1_axi_awaddr < 32'ha0000000));
  end

  always @(*) begin
    _zz_when_Axi4Crossbar_l167[0] = (wrRrPtr_0 <= 1'b0);
    _zz_when_Axi4Crossbar_l167[1] = (wrRrPtr_0 <= 1'b1);
  end

  assign _zz_when_Axi4Crossbar_l167_1 = (_zz_when_Axi4Crossbar_l324 & _zz_when_Axi4Crossbar_l167);
  assign _zz_when_Axi4Crossbar_l167_2 = _zz_when_Axi4Crossbar_l167_1;
  assign _zz_when_Axi4Crossbar_l167_3 = _zz_when_Axi4Crossbar_l324;
  assign _zz_when_Axi4Crossbar_l167_4 = ((|_zz_when_Axi4Crossbar_l167_1) ? (_zz_when_Axi4Crossbar_l167_2 & (~ _zz__zz_when_Axi4Crossbar_l167_4)) : (_zz_when_Axi4Crossbar_l167_3 & (~ _zz__zz_when_Axi4Crossbar_l167_4_1)));
  always @(*) begin
    _zz_io_slaves_0_aw_payload_id = 1'b0;
    if(when_Axi4Crossbar_l167) begin
      _zz_io_slaves_0_aw_payload_id = 1'b0;
    end
    if(when_Axi4Crossbar_l167_1) begin
      _zz_io_slaves_0_aw_payload_id = 1'b1;
    end
  end

  assign when_Axi4Crossbar_l167 = _zz_when_Axi4Crossbar_l167_4[0];
  assign when_Axi4Crossbar_l167_1 = _zz_when_Axi4Crossbar_l167_4[1];
  assign when_Axi4Crossbar_l324 = (|_zz_when_Axi4Crossbar_l324);
  assign when_Axi4Crossbar_l327 = (_zz_io_slaves_0_aw_payload_id == 1'b0);
  assign when_Axi4Crossbar_l327_1 = (_zz_io_slaves_0_aw_payload_id == 1'b1);
  assign io_slaves_0_aw_fire = (m0_axi_awvalid && m0_axi_awready);
  assign when_Axi4Crossbar_l350 = (_zz_when_Axi4Crossbar_l350 == 1'b0);
  assign when_Axi4Crossbar_l350_1 = (_zz_when_Axi4Crossbar_l350 == 1'b1);
  assign io_slaves_0_b_fire = (m0_axi_bvalid && m0_axi_bready);
  assign when_Axi4Crossbar_l309_1 = (! _zz_when_Axi4Crossbar_l309_1);
  always @(*) begin
    _zz_when_Axi4Crossbar_l324_4[0] = ((32'h0 <= s0_axi_awaddr) && (s0_axi_awaddr < 32'h80000000));
    _zz_when_Axi4Crossbar_l324_4[1] = ((32'h80000000 <= s0_axi_awaddr) && (s0_axi_awaddr < 32'ha0000000));
  end

  always @(*) begin
    _zz_when_Axi4Crossbar_l324_3[0] = (s0_axi_awvalid && _zz_when_Axi4Crossbar_l324_4[1]);
    _zz_when_Axi4Crossbar_l324_3[1] = (s1_axi_awvalid && _zz_when_Axi4Crossbar_l324_5[1]);
  end

  always @(*) begin
    _zz_when_Axi4Crossbar_l324_5[0] = ((32'h0 <= s1_axi_awaddr) && (s1_axi_awaddr < 32'h80000000));
    _zz_when_Axi4Crossbar_l324_5[1] = ((32'h80000000 <= s1_axi_awaddr) && (s1_axi_awaddr < 32'ha0000000));
  end

  always @(*) begin
    _zz_when_Axi4Crossbar_l167_5[0] = (wrRrPtr_1 <= 1'b0);
    _zz_when_Axi4Crossbar_l167_5[1] = (wrRrPtr_1 <= 1'b1);
  end

  assign _zz_when_Axi4Crossbar_l167_6 = (_zz_when_Axi4Crossbar_l324_3 & _zz_when_Axi4Crossbar_l167_5);
  assign _zz_when_Axi4Crossbar_l167_7 = _zz_when_Axi4Crossbar_l167_6;
  assign _zz_when_Axi4Crossbar_l167_8 = _zz_when_Axi4Crossbar_l324_3;
  assign _zz_when_Axi4Crossbar_l167_9 = ((|_zz_when_Axi4Crossbar_l167_6) ? (_zz_when_Axi4Crossbar_l167_7 & (~ _zz__zz_when_Axi4Crossbar_l167_9)) : (_zz_when_Axi4Crossbar_l167_8 & (~ _zz__zz_when_Axi4Crossbar_l167_9_1)));
  always @(*) begin
    _zz_io_slaves_1_aw_payload_id = 1'b0;
    if(when_Axi4Crossbar_l167_2) begin
      _zz_io_slaves_1_aw_payload_id = 1'b0;
    end
    if(when_Axi4Crossbar_l167_3) begin
      _zz_io_slaves_1_aw_payload_id = 1'b1;
    end
  end

  assign when_Axi4Crossbar_l167_2 = _zz_when_Axi4Crossbar_l167_9[0];
  assign when_Axi4Crossbar_l167_3 = _zz_when_Axi4Crossbar_l167_9[1];
  assign when_Axi4Crossbar_l324_1 = (|_zz_when_Axi4Crossbar_l324_3);
  assign when_Axi4Crossbar_l327_2 = (_zz_io_slaves_1_aw_payload_id == 1'b0);
  assign when_Axi4Crossbar_l327_3 = (_zz_io_slaves_1_aw_payload_id == 1'b1);
  assign io_slaves_1_aw_fire = (m1_axi_awvalid && m1_axi_awready);
  assign when_Axi4Crossbar_l350_2 = (_zz_when_Axi4Crossbar_l350_1 == 1'b0);
  assign when_Axi4Crossbar_l350_3 = (_zz_when_Axi4Crossbar_l350_1 == 1'b1);
  assign io_slaves_1_b_fire = (m1_axi_bvalid && m1_axi_bready);
  assign when_Axi4Crossbar_l369 = (! _zz_when_Axi4Crossbar_l369);
  always @(*) begin
    _zz_when_Axi4Crossbar_l384_1[0] = ((32'h0 <= s0_axi_araddr) && (s0_axi_araddr < 32'h80000000));
    _zz_when_Axi4Crossbar_l384_1[1] = ((32'h80000000 <= s0_axi_araddr) && (s0_axi_araddr < 32'ha0000000));
  end

  always @(*) begin
    _zz_when_Axi4Crossbar_l384[0] = (s0_axi_arvalid && _zz_when_Axi4Crossbar_l384_1[0]);
    _zz_when_Axi4Crossbar_l384[1] = (s1_axi_arvalid && _zz_when_Axi4Crossbar_l384_2[0]);
  end

  always @(*) begin
    _zz_when_Axi4Crossbar_l384_2[0] = ((32'h0 <= s1_axi_araddr) && (s1_axi_araddr < 32'h80000000));
    _zz_when_Axi4Crossbar_l384_2[1] = ((32'h80000000 <= s1_axi_araddr) && (s1_axi_araddr < 32'ha0000000));
  end

  always @(*) begin
    _zz_when_Axi4Crossbar_l167_10[0] = (rdRrPtr_0 <= 1'b0);
    _zz_when_Axi4Crossbar_l167_10[1] = (rdRrPtr_0 <= 1'b1);
  end

  assign _zz_when_Axi4Crossbar_l167_11 = (_zz_when_Axi4Crossbar_l384 & _zz_when_Axi4Crossbar_l167_10);
  assign _zz_when_Axi4Crossbar_l167_12 = _zz_when_Axi4Crossbar_l167_11;
  assign _zz_when_Axi4Crossbar_l167_13 = _zz_when_Axi4Crossbar_l384;
  assign _zz_when_Axi4Crossbar_l167_14 = ((|_zz_when_Axi4Crossbar_l167_11) ? (_zz_when_Axi4Crossbar_l167_12 & (~ _zz__zz_when_Axi4Crossbar_l167_14)) : (_zz_when_Axi4Crossbar_l167_13 & (~ _zz__zz_when_Axi4Crossbar_l167_14_1)));
  always @(*) begin
    _zz_io_slaves_0_ar_payload_id = 1'b0;
    if(when_Axi4Crossbar_l167_4) begin
      _zz_io_slaves_0_ar_payload_id = 1'b0;
    end
    if(when_Axi4Crossbar_l167_5) begin
      _zz_io_slaves_0_ar_payload_id = 1'b1;
    end
  end

  assign when_Axi4Crossbar_l167_4 = _zz_when_Axi4Crossbar_l167_14[0];
  assign when_Axi4Crossbar_l167_5 = _zz_when_Axi4Crossbar_l167_14[1];
  assign when_Axi4Crossbar_l384 = (|_zz_when_Axi4Crossbar_l384);
  assign when_Axi4Crossbar_l387 = (_zz_io_slaves_0_ar_payload_id == 1'b0);
  assign when_Axi4Crossbar_l387_1 = (_zz_io_slaves_0_ar_payload_id == 1'b1);
  assign io_slaves_0_ar_fire = (m0_axi_arvalid && m0_axi_arready);
  assign when_Axi4Crossbar_l401 = (_zz_when_Axi4Crossbar_l401 == 1'b0);
  assign when_Axi4Crossbar_l401_1 = (_zz_when_Axi4Crossbar_l401 == 1'b1);
  assign io_slaves_0_r_fire = (m0_axi_rvalid && m0_axi_rready);
  assign when_Axi4Crossbar_l411 = (io_slaves_0_r_fire && m0_axi_rlast);
  assign when_Axi4Crossbar_l369_1 = (! _zz_when_Axi4Crossbar_l369_1);
  always @(*) begin
    _zz_when_Axi4Crossbar_l384_4[0] = ((32'h0 <= s0_axi_araddr) && (s0_axi_araddr < 32'h80000000));
    _zz_when_Axi4Crossbar_l384_4[1] = ((32'h80000000 <= s0_axi_araddr) && (s0_axi_araddr < 32'ha0000000));
  end

  always @(*) begin
    _zz_when_Axi4Crossbar_l384_3[0] = (s0_axi_arvalid && _zz_when_Axi4Crossbar_l384_4[1]);
    _zz_when_Axi4Crossbar_l384_3[1] = (s1_axi_arvalid && _zz_when_Axi4Crossbar_l384_5[1]);
  end

  always @(*) begin
    _zz_when_Axi4Crossbar_l384_5[0] = ((32'h0 <= s1_axi_araddr) && (s1_axi_araddr < 32'h80000000));
    _zz_when_Axi4Crossbar_l384_5[1] = ((32'h80000000 <= s1_axi_araddr) && (s1_axi_araddr < 32'ha0000000));
  end

  always @(*) begin
    _zz_when_Axi4Crossbar_l167_15[0] = (rdRrPtr_1 <= 1'b0);
    _zz_when_Axi4Crossbar_l167_15[1] = (rdRrPtr_1 <= 1'b1);
  end

  assign _zz_when_Axi4Crossbar_l167_16 = (_zz_when_Axi4Crossbar_l384_3 & _zz_when_Axi4Crossbar_l167_15);
  assign _zz_when_Axi4Crossbar_l167_17 = _zz_when_Axi4Crossbar_l167_16;
  assign _zz_when_Axi4Crossbar_l167_18 = _zz_when_Axi4Crossbar_l384_3;
  assign _zz_when_Axi4Crossbar_l167_19 = ((|_zz_when_Axi4Crossbar_l167_16) ? (_zz_when_Axi4Crossbar_l167_17 & (~ _zz__zz_when_Axi4Crossbar_l167_19)) : (_zz_when_Axi4Crossbar_l167_18 & (~ _zz__zz_when_Axi4Crossbar_l167_19_1)));
  always @(*) begin
    _zz_io_slaves_1_ar_payload_id = 1'b0;
    if(when_Axi4Crossbar_l167_6) begin
      _zz_io_slaves_1_ar_payload_id = 1'b0;
    end
    if(when_Axi4Crossbar_l167_7) begin
      _zz_io_slaves_1_ar_payload_id = 1'b1;
    end
  end

  assign when_Axi4Crossbar_l167_6 = _zz_when_Axi4Crossbar_l167_19[0];
  assign when_Axi4Crossbar_l167_7 = _zz_when_Axi4Crossbar_l167_19[1];
  assign when_Axi4Crossbar_l384_1 = (|_zz_when_Axi4Crossbar_l384_3);
  assign when_Axi4Crossbar_l387_2 = (_zz_io_slaves_1_ar_payload_id == 1'b0);
  assign when_Axi4Crossbar_l387_3 = (_zz_io_slaves_1_ar_payload_id == 1'b1);
  assign io_slaves_1_ar_fire = (m1_axi_arvalid && m1_axi_arready);
  assign when_Axi4Crossbar_l401_2 = (_zz_when_Axi4Crossbar_l401_1 == 1'b0);
  assign when_Axi4Crossbar_l401_3 = (_zz_when_Axi4Crossbar_l401_1 == 1'b1);
  assign io_slaves_1_r_fire = (m1_axi_rvalid && m1_axi_rready);
  assign when_Axi4Crossbar_l411_1 = (io_slaves_1_r_fire && m1_axi_rlast);
  always @(posedge aclk) begin
    if(!aresetn) begin
      wrRrPtr_0 <= 1'b0;
      wrRrPtr_1 <= 1'b0;
      rdRrPtr_0 <= 1'b0;
      rdRrPtr_1 <= 1'b0;
      _zz_when_Axi4Crossbar_l309 <= 1'b0;
      _zz_when_Axi4Crossbar_l309_1 <= 1'b0;
      _zz_when_Axi4Crossbar_l350 <= 1'b0;
      _zz_when_Axi4Crossbar_l350_1 <= 1'b0;
      _zz_when_Axi4Crossbar_l369 <= 1'b0;
      _zz_when_Axi4Crossbar_l369_1 <= 1'b0;
      _zz_when_Axi4Crossbar_l401 <= 1'b0;
      _zz_when_Axi4Crossbar_l401_1 <= 1'b0;
    end else begin
      if(when_Axi4Crossbar_l309) begin
        if(when_Axi4Crossbar_l324) begin
          if(io_slaves_0_aw_fire) begin
            _zz_when_Axi4Crossbar_l309 <= 1'b1;
            _zz_when_Axi4Crossbar_l350 <= _zz_io_slaves_0_aw_payload_id;
            wrRrPtr_0 <= (_zz_io_slaves_0_aw_payload_id + 1'b1);
          end
        end
      end else begin
        if(io_slaves_0_b_fire) begin
          _zz_when_Axi4Crossbar_l309 <= 1'b0;
        end
      end
      if(when_Axi4Crossbar_l309_1) begin
        if(when_Axi4Crossbar_l324_1) begin
          if(io_slaves_1_aw_fire) begin
            _zz_when_Axi4Crossbar_l309_1 <= 1'b1;
            _zz_when_Axi4Crossbar_l350_1 <= _zz_io_slaves_1_aw_payload_id;
            wrRrPtr_1 <= (_zz_io_slaves_1_aw_payload_id + 1'b1);
          end
        end
      end else begin
        if(io_slaves_1_b_fire) begin
          _zz_when_Axi4Crossbar_l309_1 <= 1'b0;
        end
      end
      if(when_Axi4Crossbar_l369) begin
        if(when_Axi4Crossbar_l384) begin
          if(io_slaves_0_ar_fire) begin
            _zz_when_Axi4Crossbar_l369 <= 1'b1;
            _zz_when_Axi4Crossbar_l401 <= _zz_io_slaves_0_ar_payload_id;
            rdRrPtr_0 <= (_zz_io_slaves_0_ar_payload_id + 1'b1);
          end
        end
      end else begin
        if(when_Axi4Crossbar_l411) begin
          _zz_when_Axi4Crossbar_l369 <= 1'b0;
        end
      end
      if(when_Axi4Crossbar_l369_1) begin
        if(when_Axi4Crossbar_l384_1) begin
          if(io_slaves_1_ar_fire) begin
            _zz_when_Axi4Crossbar_l369_1 <= 1'b1;
            _zz_when_Axi4Crossbar_l401_1 <= _zz_io_slaves_1_ar_payload_id;
            rdRrPtr_1 <= (_zz_io_slaves_1_ar_payload_id + 1'b1);
          end
        end
      end else begin
        if(when_Axi4Crossbar_l411_1) begin
          _zz_when_Axi4Crossbar_l369_1 <= 1'b0;
        end
      end
    end
  end


endmodule
