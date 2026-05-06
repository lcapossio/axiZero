// Copyright (c) 2026 Leonardo Capossio - bard0 design  hello@bard0.com
// SPDX-License-Identifier: MIT
// Generator : SpinalHDL v1.10.1    git head : 2527c7c6b0fb0f95e5e1a5722a0be732b364ce43
// Component : AxiZeroMixedTop
// Git hash  : a247c8e6093e42031e2bcde57f9e5c07ec8b5455

`timescale 1ns/1ps

module AxiZeroMixedTop (
  input  wire          s0_axi_awvalid,
  output wire          s0_axi_awready,
  input  wire [31:0]   s0_axi_awaddr,
  input  wire [0:0]    s0_axi_awid,
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
  output wire [0:0]    s0_axi_bid,
  output wire [1:0]    s0_axi_bresp,
  input  wire          s0_axi_arvalid,
  output wire          s0_axi_arready,
  input  wire [31:0]   s0_axi_araddr,
  input  wire [0:0]    s0_axi_arid,
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
  output wire [0:0]    s0_axi_rid,
  output wire [1:0]    s0_axi_rresp,
  output wire          s0_axi_rlast,
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
  output wire [1:0]    m0_axi_awid,
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
  input  wire [1:0]    m0_axi_bid,
  input  wire [1:0]    m0_axi_bresp,
  output wire          m0_axi_arvalid,
  input  wire          m0_axi_arready,
  output wire [31:0]   m0_axi_araddr,
  output wire [1:0]    m0_axi_arid,
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
  input  wire [1:0]    m0_axi_rid,
  input  wire [1:0]    m0_axi_rresp,
  input  wire          m0_axi_rlast,
  output wire          m1_axi_awvalid,
  input  wire          m1_axi_awready,
  output wire [31:0]   m1_axi_awaddr,
  output wire [1:0]    m1_axi_awid,
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
  input  wire [1:0]    m1_axi_bid,
  input  wire [1:0]    m1_axi_bresp,
  output wire          m1_axi_arvalid,
  input  wire          m1_axi_arready,
  output wire [31:0]   m1_axi_araddr,
  output wire [1:0]    m1_axi_arid,
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
  input  wire [1:0]    m1_axi_rid,
  input  wire [1:0]    m1_axi_rresp,
  input  wire          m1_axi_rlast,
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

  wire                xbar_s0_axi_arready;
  wire                xbar_s0_axi_awready;
  wire                xbar_s0_axi_wready;
  wire                xbar_s0_axi_rvalid;
  wire       [31:0]   xbar_s0_axi_rdata;
  wire       [0:0]    xbar_s0_axi_rid;
  wire       [1:0]    xbar_s0_axi_rresp;
  wire                xbar_s0_axi_rlast;
  wire                xbar_s0_axi_bvalid;
  wire       [0:0]    xbar_s0_axi_bid;
  wire       [1:0]    xbar_s0_axi_bresp;
  wire                xbar_s1_axi_arready;
  wire                xbar_s1_axi_awready;
  wire                xbar_s1_axi_wready;
  wire                xbar_s1_axi_rvalid;
  wire       [31:0]   xbar_s1_axi_rdata;
  wire       [0:0]    xbar_s1_axi_rid;
  wire       [1:0]    xbar_s1_axi_rresp;
  wire                xbar_s1_axi_rlast;
  wire                xbar_s1_axi_bvalid;
  wire       [0:0]    xbar_s1_axi_bid;
  wire       [1:0]    xbar_s1_axi_bresp;
  wire                xbar_m0_axi_arvalid;
  wire       [31:0]   xbar_m0_axi_araddr;
  wire       [1:0]    xbar_m0_axi_arid;
  wire       [3:0]    xbar_m0_axi_arregion;
  wire       [7:0]    xbar_m0_axi_arlen;
  wire       [2:0]    xbar_m0_axi_arsize;
  wire       [1:0]    xbar_m0_axi_arburst;
  wire       [0:0]    xbar_m0_axi_arlock;
  wire       [3:0]    xbar_m0_axi_arcache;
  wire       [3:0]    xbar_m0_axi_arqos;
  wire       [2:0]    xbar_m0_axi_arprot;
  wire                xbar_m0_axi_awvalid;
  wire       [31:0]   xbar_m0_axi_awaddr;
  wire       [1:0]    xbar_m0_axi_awid;
  wire       [3:0]    xbar_m0_axi_awregion;
  wire       [7:0]    xbar_m0_axi_awlen;
  wire       [2:0]    xbar_m0_axi_awsize;
  wire       [1:0]    xbar_m0_axi_awburst;
  wire       [0:0]    xbar_m0_axi_awlock;
  wire       [3:0]    xbar_m0_axi_awcache;
  wire       [3:0]    xbar_m0_axi_awqos;
  wire       [2:0]    xbar_m0_axi_awprot;
  wire                xbar_m0_axi_wvalid;
  wire       [31:0]   xbar_m0_axi_wdata;
  wire       [3:0]    xbar_m0_axi_wstrb;
  wire                xbar_m0_axi_wlast;
  wire                xbar_m0_axi_rready;
  wire                xbar_m0_axi_bready;
  wire                xbar_m1_axi_arvalid;
  wire       [31:0]   xbar_m1_axi_araddr;
  wire       [1:0]    xbar_m1_axi_arid;
  wire       [3:0]    xbar_m1_axi_arregion;
  wire       [7:0]    xbar_m1_axi_arlen;
  wire       [2:0]    xbar_m1_axi_arsize;
  wire       [1:0]    xbar_m1_axi_arburst;
  wire       [0:0]    xbar_m1_axi_arlock;
  wire       [3:0]    xbar_m1_axi_arcache;
  wire       [3:0]    xbar_m1_axi_arqos;
  wire       [2:0]    xbar_m1_axi_arprot;
  wire                xbar_m1_axi_awvalid;
  wire       [31:0]   xbar_m1_axi_awaddr;
  wire       [1:0]    xbar_m1_axi_awid;
  wire       [3:0]    xbar_m1_axi_awregion;
  wire       [7:0]    xbar_m1_axi_awlen;
  wire       [2:0]    xbar_m1_axi_awsize;
  wire       [1:0]    xbar_m1_axi_awburst;
  wire       [0:0]    xbar_m1_axi_awlock;
  wire       [3:0]    xbar_m1_axi_awcache;
  wire       [3:0]    xbar_m1_axi_awqos;
  wire       [2:0]    xbar_m1_axi_awprot;
  wire                xbar_m1_axi_wvalid;
  wire       [31:0]   xbar_m1_axi_wdata;
  wire       [3:0]    xbar_m1_axi_wstrb;
  wire                xbar_m1_axi_wlast;
  wire                xbar_m1_axi_rready;
  wire                xbar_m1_axi_bready;
  wire                xbar_m2_axi_arvalid;
  wire       [31:0]   xbar_m2_axi_araddr;
  wire       [1:0]    xbar_m2_axi_arid;
  wire       [3:0]    xbar_m2_axi_arregion;
  wire       [7:0]    xbar_m2_axi_arlen;
  wire       [2:0]    xbar_m2_axi_arsize;
  wire       [1:0]    xbar_m2_axi_arburst;
  wire       [0:0]    xbar_m2_axi_arlock;
  wire       [3:0]    xbar_m2_axi_arcache;
  wire       [3:0]    xbar_m2_axi_arqos;
  wire       [2:0]    xbar_m2_axi_arprot;
  wire                xbar_m2_axi_awvalid;
  wire       [31:0]   xbar_m2_axi_awaddr;
  wire       [1:0]    xbar_m2_axi_awid;
  wire       [3:0]    xbar_m2_axi_awregion;
  wire       [7:0]    xbar_m2_axi_awlen;
  wire       [2:0]    xbar_m2_axi_awsize;
  wire       [1:0]    xbar_m2_axi_awburst;
  wire       [0:0]    xbar_m2_axi_awlock;
  wire       [3:0]    xbar_m2_axi_awcache;
  wire       [3:0]    xbar_m2_axi_awqos;
  wire       [2:0]    xbar_m2_axi_awprot;
  wire                xbar_m2_axi_wvalid;
  wire       [31:0]   xbar_m2_axi_wdata;
  wire       [3:0]    xbar_m2_axi_wstrb;
  wire                xbar_m2_axi_wlast;
  wire                xbar_m2_axi_rready;
  wire                xbar_m2_axi_bready;
  wire                xbar_m3_axi_arvalid;
  wire       [31:0]   xbar_m3_axi_araddr;
  wire       [1:0]    xbar_m3_axi_arid;
  wire       [3:0]    xbar_m3_axi_arregion;
  wire       [7:0]    xbar_m3_axi_arlen;
  wire       [2:0]    xbar_m3_axi_arsize;
  wire       [1:0]    xbar_m3_axi_arburst;
  wire       [0:0]    xbar_m3_axi_arlock;
  wire       [3:0]    xbar_m3_axi_arcache;
  wire       [3:0]    xbar_m3_axi_arqos;
  wire       [2:0]    xbar_m3_axi_arprot;
  wire                xbar_m3_axi_awvalid;
  wire       [31:0]   xbar_m3_axi_awaddr;
  wire       [1:0]    xbar_m3_axi_awid;
  wire       [3:0]    xbar_m3_axi_awregion;
  wire       [7:0]    xbar_m3_axi_awlen;
  wire       [2:0]    xbar_m3_axi_awsize;
  wire       [1:0]    xbar_m3_axi_awburst;
  wire       [0:0]    xbar_m3_axi_awlock;
  wire       [3:0]    xbar_m3_axi_awcache;
  wire       [3:0]    xbar_m3_axi_awqos;
  wire       [2:0]    xbar_m3_axi_awprot;
  wire                xbar_m3_axi_wvalid;
  wire       [31:0]   xbar_m3_axi_wdata;
  wire       [3:0]    xbar_m3_axi_wstrb;
  wire                xbar_m3_axi_wlast;
  wire                xbar_m3_axi_rready;
  wire                xbar_m3_axi_bready;
  wire                axi4LiteToFullAdapter_1_io_lite_ar_ready;
  wire                axi4LiteToFullAdapter_1_io_lite_aw_ready;
  wire                axi4LiteToFullAdapter_1_io_lite_w_ready;
  wire                axi4LiteToFullAdapter_1_io_lite_r_valid;
  wire       [31:0]   axi4LiteToFullAdapter_1_io_lite_r_payload_data;
  wire       [1:0]    axi4LiteToFullAdapter_1_io_lite_r_payload_resp;
  wire                axi4LiteToFullAdapter_1_io_lite_b_valid;
  wire       [1:0]    axi4LiteToFullAdapter_1_io_lite_b_payload_resp;
  wire                axi4LiteToFullAdapter_1_io_full_ar_valid;
  wire       [31:0]   axi4LiteToFullAdapter_1_io_full_ar_payload_addr;
  wire       [0:0]    axi4LiteToFullAdapter_1_io_full_ar_payload_id;
  wire       [3:0]    axi4LiteToFullAdapter_1_io_full_ar_payload_region;
  wire       [7:0]    axi4LiteToFullAdapter_1_io_full_ar_payload_len;
  wire       [2:0]    axi4LiteToFullAdapter_1_io_full_ar_payload_size;
  wire       [1:0]    axi4LiteToFullAdapter_1_io_full_ar_payload_burst;
  wire       [0:0]    axi4LiteToFullAdapter_1_io_full_ar_payload_lock;
  wire       [3:0]    axi4LiteToFullAdapter_1_io_full_ar_payload_cache;
  wire       [3:0]    axi4LiteToFullAdapter_1_io_full_ar_payload_qos;
  wire       [2:0]    axi4LiteToFullAdapter_1_io_full_ar_payload_prot;
  wire                axi4LiteToFullAdapter_1_io_full_aw_valid;
  wire       [31:0]   axi4LiteToFullAdapter_1_io_full_aw_payload_addr;
  wire       [0:0]    axi4LiteToFullAdapter_1_io_full_aw_payload_id;
  wire       [3:0]    axi4LiteToFullAdapter_1_io_full_aw_payload_region;
  wire       [7:0]    axi4LiteToFullAdapter_1_io_full_aw_payload_len;
  wire       [2:0]    axi4LiteToFullAdapter_1_io_full_aw_payload_size;
  wire       [1:0]    axi4LiteToFullAdapter_1_io_full_aw_payload_burst;
  wire       [0:0]    axi4LiteToFullAdapter_1_io_full_aw_payload_lock;
  wire       [3:0]    axi4LiteToFullAdapter_1_io_full_aw_payload_cache;
  wire       [3:0]    axi4LiteToFullAdapter_1_io_full_aw_payload_qos;
  wire       [2:0]    axi4LiteToFullAdapter_1_io_full_aw_payload_prot;
  wire                axi4LiteToFullAdapter_1_io_full_w_valid;
  wire       [31:0]   axi4LiteToFullAdapter_1_io_full_w_payload_data;
  wire       [3:0]    axi4LiteToFullAdapter_1_io_full_w_payload_strb;
  wire                axi4LiteToFullAdapter_1_io_full_w_payload_last;
  wire                axi4LiteToFullAdapter_1_io_full_r_ready;
  wire                axi4LiteToFullAdapter_1_io_full_b_ready;
  wire                axi4FullToLiteAdapter_2_io_full_ar_ready;
  wire                axi4FullToLiteAdapter_2_io_full_aw_ready;
  wire                axi4FullToLiteAdapter_2_io_full_w_ready;
  wire                axi4FullToLiteAdapter_2_io_full_r_valid;
  wire       [31:0]   axi4FullToLiteAdapter_2_io_full_r_payload_data;
  wire       [1:0]    axi4FullToLiteAdapter_2_io_full_r_payload_id;
  wire       [1:0]    axi4FullToLiteAdapter_2_io_full_r_payload_resp;
  wire                axi4FullToLiteAdapter_2_io_full_r_payload_last;
  wire                axi4FullToLiteAdapter_2_io_full_b_valid;
  wire       [1:0]    axi4FullToLiteAdapter_2_io_full_b_payload_id;
  wire       [1:0]    axi4FullToLiteAdapter_2_io_full_b_payload_resp;
  wire                axi4FullToLiteAdapter_2_io_lite_ar_valid;
  wire       [31:0]   axi4FullToLiteAdapter_2_io_lite_ar_payload_addr;
  wire       [2:0]    axi4FullToLiteAdapter_2_io_lite_ar_payload_prot;
  wire                axi4FullToLiteAdapter_2_io_lite_aw_valid;
  wire       [31:0]   axi4FullToLiteAdapter_2_io_lite_aw_payload_addr;
  wire       [2:0]    axi4FullToLiteAdapter_2_io_lite_aw_payload_prot;
  wire                axi4FullToLiteAdapter_2_io_lite_w_valid;
  wire       [31:0]   axi4FullToLiteAdapter_2_io_lite_w_payload_data;
  wire       [3:0]    axi4FullToLiteAdapter_2_io_lite_w_payload_strb;
  wire                axi4FullToLiteAdapter_2_io_lite_r_ready;
  wire                axi4FullToLiteAdapter_2_io_lite_b_ready;
  wire                axi4FullToLiteAdapter_3_io_full_ar_ready;
  wire                axi4FullToLiteAdapter_3_io_full_aw_ready;
  wire                axi4FullToLiteAdapter_3_io_full_w_ready;
  wire                axi4FullToLiteAdapter_3_io_full_r_valid;
  wire       [31:0]   axi4FullToLiteAdapter_3_io_full_r_payload_data;
  wire       [1:0]    axi4FullToLiteAdapter_3_io_full_r_payload_id;
  wire       [1:0]    axi4FullToLiteAdapter_3_io_full_r_payload_resp;
  wire                axi4FullToLiteAdapter_3_io_full_r_payload_last;
  wire                axi4FullToLiteAdapter_3_io_full_b_valid;
  wire       [1:0]    axi4FullToLiteAdapter_3_io_full_b_payload_id;
  wire       [1:0]    axi4FullToLiteAdapter_3_io_full_b_payload_resp;
  wire                axi4FullToLiteAdapter_3_io_lite_ar_valid;
  wire       [31:0]   axi4FullToLiteAdapter_3_io_lite_ar_payload_addr;
  wire       [2:0]    axi4FullToLiteAdapter_3_io_lite_ar_payload_prot;
  wire                axi4FullToLiteAdapter_3_io_lite_aw_valid;
  wire       [31:0]   axi4FullToLiteAdapter_3_io_lite_aw_payload_addr;
  wire       [2:0]    axi4FullToLiteAdapter_3_io_lite_aw_payload_prot;
  wire                axi4FullToLiteAdapter_3_io_lite_w_valid;
  wire       [31:0]   axi4FullToLiteAdapter_3_io_lite_w_payload_data;
  wire       [3:0]    axi4FullToLiteAdapter_3_io_lite_w_payload_strb;
  wire                axi4FullToLiteAdapter_3_io_lite_r_ready;
  wire                axi4FullToLiteAdapter_3_io_lite_b_ready;

  Axi4Crossbar xbar (
    .s0_axi_awvalid          (s0_axi_awvalid                                 ), //i
    .s0_axi_awready          (xbar_s0_axi_awready                            ), //o
    .s0_axi_awaddr   (s0_axi_awaddr[31:0]                    ), //i
    .s0_axi_awid     (s0_axi_awid                            ), //i
    .s0_axi_awregion (s0_axi_awregion[3:0]                   ), //i
    .s0_axi_awlen    (s0_axi_awlen[7:0]                      ), //i
    .s0_axi_awsize   (s0_axi_awsize[2:0]                     ), //i
    .s0_axi_awburst  (s0_axi_awburst[1:0]                    ), //i
    .s0_axi_awlock   (s0_axi_awlock                          ), //i
    .s0_axi_awcache  (s0_axi_awcache[3:0]                    ), //i
    .s0_axi_awqos    (s0_axi_awqos[3:0]                      ), //i
    .s0_axi_awprot   (s0_axi_awprot[2:0]                     ), //i
    .s0_axi_wvalid           (s0_axi_wvalid                                  ), //i
    .s0_axi_wready           (xbar_s0_axi_wready                             ), //o
    .s0_axi_wdata    (s0_axi_wdata[31:0]                     ), //i
    .s0_axi_wstrb    (s0_axi_wstrb[3:0]                      ), //i
    .s0_axi_wlast    (s0_axi_wlast                           ), //i
    .s0_axi_bvalid           (xbar_s0_axi_bvalid                             ), //o
    .s0_axi_bready           (s0_axi_bready                                  ), //i
    .s0_axi_bid      (xbar_s0_axi_bid                        ), //o
    .s0_axi_bresp    (xbar_s0_axi_bresp[1:0]                 ), //o
    .s0_axi_arvalid          (s0_axi_arvalid                                 ), //i
    .s0_axi_arready          (xbar_s0_axi_arready                            ), //o
    .s0_axi_araddr   (s0_axi_araddr[31:0]                    ), //i
    .s0_axi_arid     (s0_axi_arid                            ), //i
    .s0_axi_arregion (s0_axi_arregion[3:0]                   ), //i
    .s0_axi_arlen    (s0_axi_arlen[7:0]                      ), //i
    .s0_axi_arsize   (s0_axi_arsize[2:0]                     ), //i
    .s0_axi_arburst  (s0_axi_arburst[1:0]                    ), //i
    .s0_axi_arlock   (s0_axi_arlock                          ), //i
    .s0_axi_arcache  (s0_axi_arcache[3:0]                    ), //i
    .s0_axi_arqos    (s0_axi_arqos[3:0]                      ), //i
    .s0_axi_arprot   (s0_axi_arprot[2:0]                     ), //i
    .s0_axi_rvalid           (xbar_s0_axi_rvalid                             ), //o
    .s0_axi_rready           (s0_axi_rready                                  ), //i
    .s0_axi_rdata    (xbar_s0_axi_rdata[31:0]                ), //o
    .s0_axi_rid      (xbar_s0_axi_rid                        ), //o
    .s0_axi_rresp    (xbar_s0_axi_rresp[1:0]                 ), //o
    .s0_axi_rlast    (xbar_s0_axi_rlast                      ), //o
    .s1_axi_awvalid          (axi4LiteToFullAdapter_1_io_full_aw_valid              ), //i
    .s1_axi_awready          (xbar_s1_axi_awready                            ), //o
    .s1_axi_awaddr   (axi4LiteToFullAdapter_1_io_full_aw_payload_addr[31:0] ), //i
    .s1_axi_awid     (axi4LiteToFullAdapter_1_io_full_aw_payload_id         ), //i
    .s1_axi_awregion (axi4LiteToFullAdapter_1_io_full_aw_payload_region[3:0]), //i
    .s1_axi_awlen    (axi4LiteToFullAdapter_1_io_full_aw_payload_len[7:0]   ), //i
    .s1_axi_awsize   (axi4LiteToFullAdapter_1_io_full_aw_payload_size[2:0]  ), //i
    .s1_axi_awburst  (axi4LiteToFullAdapter_1_io_full_aw_payload_burst[1:0] ), //i
    .s1_axi_awlock   (axi4LiteToFullAdapter_1_io_full_aw_payload_lock       ), //i
    .s1_axi_awcache  (axi4LiteToFullAdapter_1_io_full_aw_payload_cache[3:0] ), //i
    .s1_axi_awqos    (axi4LiteToFullAdapter_1_io_full_aw_payload_qos[3:0]   ), //i
    .s1_axi_awprot   (axi4LiteToFullAdapter_1_io_full_aw_payload_prot[2:0]  ), //i
    .s1_axi_wvalid           (axi4LiteToFullAdapter_1_io_full_w_valid               ), //i
    .s1_axi_wready           (xbar_s1_axi_wready                             ), //o
    .s1_axi_wdata    (axi4LiteToFullAdapter_1_io_full_w_payload_data[31:0]  ), //i
    .s1_axi_wstrb    (axi4LiteToFullAdapter_1_io_full_w_payload_strb[3:0]   ), //i
    .s1_axi_wlast    (axi4LiteToFullAdapter_1_io_full_w_payload_last        ), //i
    .s1_axi_bvalid           (xbar_s1_axi_bvalid                             ), //o
    .s1_axi_bready           (axi4LiteToFullAdapter_1_io_full_b_ready               ), //i
    .s1_axi_bid      (xbar_s1_axi_bid                        ), //o
    .s1_axi_bresp    (xbar_s1_axi_bresp[1:0]                 ), //o
    .s1_axi_arvalid          (axi4LiteToFullAdapter_1_io_full_ar_valid              ), //i
    .s1_axi_arready          (xbar_s1_axi_arready                            ), //o
    .s1_axi_araddr   (axi4LiteToFullAdapter_1_io_full_ar_payload_addr[31:0] ), //i
    .s1_axi_arid     (axi4LiteToFullAdapter_1_io_full_ar_payload_id         ), //i
    .s1_axi_arregion (axi4LiteToFullAdapter_1_io_full_ar_payload_region[3:0]), //i
    .s1_axi_arlen    (axi4LiteToFullAdapter_1_io_full_ar_payload_len[7:0]   ), //i
    .s1_axi_arsize   (axi4LiteToFullAdapter_1_io_full_ar_payload_size[2:0]  ), //i
    .s1_axi_arburst  (axi4LiteToFullAdapter_1_io_full_ar_payload_burst[1:0] ), //i
    .s1_axi_arlock   (axi4LiteToFullAdapter_1_io_full_ar_payload_lock       ), //i
    .s1_axi_arcache  (axi4LiteToFullAdapter_1_io_full_ar_payload_cache[3:0] ), //i
    .s1_axi_arqos    (axi4LiteToFullAdapter_1_io_full_ar_payload_qos[3:0]   ), //i
    .s1_axi_arprot   (axi4LiteToFullAdapter_1_io_full_ar_payload_prot[2:0]  ), //i
    .s1_axi_rvalid           (xbar_s1_axi_rvalid                             ), //o
    .s1_axi_rready           (axi4LiteToFullAdapter_1_io_full_r_ready               ), //i
    .s1_axi_rdata    (xbar_s1_axi_rdata[31:0]                ), //o
    .s1_axi_rid      (xbar_s1_axi_rid                        ), //o
    .s1_axi_rresp    (xbar_s1_axi_rresp[1:0]                 ), //o
    .s1_axi_rlast    (xbar_s1_axi_rlast                      ), //o
    .m0_axi_awvalid           (xbar_m0_axi_awvalid                             ), //o
    .m0_axi_awready           (m0_axi_awready                                  ), //i
    .m0_axi_awaddr    (xbar_m0_axi_awaddr[31:0]                ), //o
    .m0_axi_awid      (xbar_m0_axi_awid[1:0]                   ), //o
    .m0_axi_awregion  (xbar_m0_axi_awregion[3:0]               ), //o
    .m0_axi_awlen     (xbar_m0_axi_awlen[7:0]                  ), //o
    .m0_axi_awsize    (xbar_m0_axi_awsize[2:0]                 ), //o
    .m0_axi_awburst   (xbar_m0_axi_awburst[1:0]                ), //o
    .m0_axi_awlock    (xbar_m0_axi_awlock                      ), //o
    .m0_axi_awcache   (xbar_m0_axi_awcache[3:0]                ), //o
    .m0_axi_awqos     (xbar_m0_axi_awqos[3:0]                  ), //o
    .m0_axi_awprot    (xbar_m0_axi_awprot[2:0]                 ), //o
    .m0_axi_wvalid            (xbar_m0_axi_wvalid                              ), //o
    .m0_axi_wready            (m0_axi_wready                                   ), //i
    .m0_axi_wdata     (xbar_m0_axi_wdata[31:0]                 ), //o
    .m0_axi_wstrb     (xbar_m0_axi_wstrb[3:0]                  ), //o
    .m0_axi_wlast     (xbar_m0_axi_wlast                       ), //o
    .m0_axi_bvalid            (m0_axi_bvalid                                   ), //i
    .m0_axi_bready            (xbar_m0_axi_bready                              ), //o
    .m0_axi_bid       (m0_axi_bid[1:0]                         ), //i
    .m0_axi_bresp     (m0_axi_bresp[1:0]                       ), //i
    .m0_axi_arvalid           (xbar_m0_axi_arvalid                             ), //o
    .m0_axi_arready           (m0_axi_arready                                  ), //i
    .m0_axi_araddr    (xbar_m0_axi_araddr[31:0]                ), //o
    .m0_axi_arid      (xbar_m0_axi_arid[1:0]                   ), //o
    .m0_axi_arregion  (xbar_m0_axi_arregion[3:0]               ), //o
    .m0_axi_arlen     (xbar_m0_axi_arlen[7:0]                  ), //o
    .m0_axi_arsize    (xbar_m0_axi_arsize[2:0]                 ), //o
    .m0_axi_arburst   (xbar_m0_axi_arburst[1:0]                ), //o
    .m0_axi_arlock    (xbar_m0_axi_arlock                      ), //o
    .m0_axi_arcache   (xbar_m0_axi_arcache[3:0]                ), //o
    .m0_axi_arqos     (xbar_m0_axi_arqos[3:0]                  ), //o
    .m0_axi_arprot    (xbar_m0_axi_arprot[2:0]                 ), //o
    .m0_axi_rvalid            (m0_axi_rvalid                                   ), //i
    .m0_axi_rready            (xbar_m0_axi_rready                              ), //o
    .m0_axi_rdata     (m0_axi_rdata[31:0]                      ), //i
    .m0_axi_rid       (m0_axi_rid[1:0]                         ), //i
    .m0_axi_rresp     (m0_axi_rresp[1:0]                       ), //i
    .m0_axi_rlast     (m0_axi_rlast                            ), //i
    .m1_axi_awvalid           (xbar_m1_axi_awvalid                             ), //o
    .m1_axi_awready           (m1_axi_awready                                  ), //i
    .m1_axi_awaddr    (xbar_m1_axi_awaddr[31:0]                ), //o
    .m1_axi_awid      (xbar_m1_axi_awid[1:0]                   ), //o
    .m1_axi_awregion  (xbar_m1_axi_awregion[3:0]               ), //o
    .m1_axi_awlen     (xbar_m1_axi_awlen[7:0]                  ), //o
    .m1_axi_awsize    (xbar_m1_axi_awsize[2:0]                 ), //o
    .m1_axi_awburst   (xbar_m1_axi_awburst[1:0]                ), //o
    .m1_axi_awlock    (xbar_m1_axi_awlock                      ), //o
    .m1_axi_awcache   (xbar_m1_axi_awcache[3:0]                ), //o
    .m1_axi_awqos     (xbar_m1_axi_awqos[3:0]                  ), //o
    .m1_axi_awprot    (xbar_m1_axi_awprot[2:0]                 ), //o
    .m1_axi_wvalid            (xbar_m1_axi_wvalid                              ), //o
    .m1_axi_wready            (m1_axi_wready                                   ), //i
    .m1_axi_wdata     (xbar_m1_axi_wdata[31:0]                 ), //o
    .m1_axi_wstrb     (xbar_m1_axi_wstrb[3:0]                  ), //o
    .m1_axi_wlast     (xbar_m1_axi_wlast                       ), //o
    .m1_axi_bvalid            (m1_axi_bvalid                                   ), //i
    .m1_axi_bready            (xbar_m1_axi_bready                              ), //o
    .m1_axi_bid       (m1_axi_bid[1:0]                         ), //i
    .m1_axi_bresp     (m1_axi_bresp[1:0]                       ), //i
    .m1_axi_arvalid           (xbar_m1_axi_arvalid                             ), //o
    .m1_axi_arready           (m1_axi_arready                                  ), //i
    .m1_axi_araddr    (xbar_m1_axi_araddr[31:0]                ), //o
    .m1_axi_arid      (xbar_m1_axi_arid[1:0]                   ), //o
    .m1_axi_arregion  (xbar_m1_axi_arregion[3:0]               ), //o
    .m1_axi_arlen     (xbar_m1_axi_arlen[7:0]                  ), //o
    .m1_axi_arsize    (xbar_m1_axi_arsize[2:0]                 ), //o
    .m1_axi_arburst   (xbar_m1_axi_arburst[1:0]                ), //o
    .m1_axi_arlock    (xbar_m1_axi_arlock                      ), //o
    .m1_axi_arcache   (xbar_m1_axi_arcache[3:0]                ), //o
    .m1_axi_arqos     (xbar_m1_axi_arqos[3:0]                  ), //o
    .m1_axi_arprot    (xbar_m1_axi_arprot[2:0]                 ), //o
    .m1_axi_rvalid            (m1_axi_rvalid                                   ), //i
    .m1_axi_rready            (xbar_m1_axi_rready                              ), //o
    .m1_axi_rdata     (m1_axi_rdata[31:0]                      ), //i
    .m1_axi_rid       (m1_axi_rid[1:0]                         ), //i
    .m1_axi_rresp     (m1_axi_rresp[1:0]                       ), //i
    .m1_axi_rlast     (m1_axi_rlast                            ), //i
    .m2_axi_awvalid           (xbar_m2_axi_awvalid                             ), //o
    .m2_axi_awready           (axi4FullToLiteAdapter_2_io_full_aw_ready              ), //i
    .m2_axi_awaddr    (xbar_m2_axi_awaddr[31:0]                ), //o
    .m2_axi_awid      (xbar_m2_axi_awid[1:0]                   ), //o
    .m2_axi_awregion  (xbar_m2_axi_awregion[3:0]               ), //o
    .m2_axi_awlen     (xbar_m2_axi_awlen[7:0]                  ), //o
    .m2_axi_awsize    (xbar_m2_axi_awsize[2:0]                 ), //o
    .m2_axi_awburst   (xbar_m2_axi_awburst[1:0]                ), //o
    .m2_axi_awlock    (xbar_m2_axi_awlock                      ), //o
    .m2_axi_awcache   (xbar_m2_axi_awcache[3:0]                ), //o
    .m2_axi_awqos     (xbar_m2_axi_awqos[3:0]                  ), //o
    .m2_axi_awprot    (xbar_m2_axi_awprot[2:0]                 ), //o
    .m2_axi_wvalid            (xbar_m2_axi_wvalid                              ), //o
    .m2_axi_wready            (axi4FullToLiteAdapter_2_io_full_w_ready               ), //i
    .m2_axi_wdata     (xbar_m2_axi_wdata[31:0]                 ), //o
    .m2_axi_wstrb     (xbar_m2_axi_wstrb[3:0]                  ), //o
    .m2_axi_wlast     (xbar_m2_axi_wlast                       ), //o
    .m2_axi_bvalid            (axi4FullToLiteAdapter_2_io_full_b_valid               ), //i
    .m2_axi_bready            (xbar_m2_axi_bready                              ), //o
    .m2_axi_bid       (axi4FullToLiteAdapter_2_io_full_b_payload_id[1:0]     ), //i
    .m2_axi_bresp     (axi4FullToLiteAdapter_2_io_full_b_payload_resp[1:0]   ), //i
    .m2_axi_arvalid           (xbar_m2_axi_arvalid                             ), //o
    .m2_axi_arready           (axi4FullToLiteAdapter_2_io_full_ar_ready              ), //i
    .m2_axi_araddr    (xbar_m2_axi_araddr[31:0]                ), //o
    .m2_axi_arid      (xbar_m2_axi_arid[1:0]                   ), //o
    .m2_axi_arregion  (xbar_m2_axi_arregion[3:0]               ), //o
    .m2_axi_arlen     (xbar_m2_axi_arlen[7:0]                  ), //o
    .m2_axi_arsize    (xbar_m2_axi_arsize[2:0]                 ), //o
    .m2_axi_arburst   (xbar_m2_axi_arburst[1:0]                ), //o
    .m2_axi_arlock    (xbar_m2_axi_arlock                      ), //o
    .m2_axi_arcache   (xbar_m2_axi_arcache[3:0]                ), //o
    .m2_axi_arqos     (xbar_m2_axi_arqos[3:0]                  ), //o
    .m2_axi_arprot    (xbar_m2_axi_arprot[2:0]                 ), //o
    .m2_axi_rvalid            (axi4FullToLiteAdapter_2_io_full_r_valid               ), //i
    .m2_axi_rready            (xbar_m2_axi_rready                              ), //o
    .m2_axi_rdata     (axi4FullToLiteAdapter_2_io_full_r_payload_data[31:0]  ), //i
    .m2_axi_rid       (axi4FullToLiteAdapter_2_io_full_r_payload_id[1:0]     ), //i
    .m2_axi_rresp     (axi4FullToLiteAdapter_2_io_full_r_payload_resp[1:0]   ), //i
    .m2_axi_rlast     (axi4FullToLiteAdapter_2_io_full_r_payload_last        ), //i
    .m3_axi_awvalid           (xbar_m3_axi_awvalid                             ), //o
    .m3_axi_awready           (axi4FullToLiteAdapter_3_io_full_aw_ready              ), //i
    .m3_axi_awaddr    (xbar_m3_axi_awaddr[31:0]                ), //o
    .m3_axi_awid      (xbar_m3_axi_awid[1:0]                   ), //o
    .m3_axi_awregion  (xbar_m3_axi_awregion[3:0]               ), //o
    .m3_axi_awlen     (xbar_m3_axi_awlen[7:0]                  ), //o
    .m3_axi_awsize    (xbar_m3_axi_awsize[2:0]                 ), //o
    .m3_axi_awburst   (xbar_m3_axi_awburst[1:0]                ), //o
    .m3_axi_awlock    (xbar_m3_axi_awlock                      ), //o
    .m3_axi_awcache   (xbar_m3_axi_awcache[3:0]                ), //o
    .m3_axi_awqos     (xbar_m3_axi_awqos[3:0]                  ), //o
    .m3_axi_awprot    (xbar_m3_axi_awprot[2:0]                 ), //o
    .m3_axi_wvalid            (xbar_m3_axi_wvalid                              ), //o
    .m3_axi_wready            (axi4FullToLiteAdapter_3_io_full_w_ready               ), //i
    .m3_axi_wdata     (xbar_m3_axi_wdata[31:0]                 ), //o
    .m3_axi_wstrb     (xbar_m3_axi_wstrb[3:0]                  ), //o
    .m3_axi_wlast     (xbar_m3_axi_wlast                       ), //o
    .m3_axi_bvalid            (axi4FullToLiteAdapter_3_io_full_b_valid               ), //i
    .m3_axi_bready            (xbar_m3_axi_bready                              ), //o
    .m3_axi_bid       (axi4FullToLiteAdapter_3_io_full_b_payload_id[1:0]     ), //i
    .m3_axi_bresp     (axi4FullToLiteAdapter_3_io_full_b_payload_resp[1:0]   ), //i
    .m3_axi_arvalid           (xbar_m3_axi_arvalid                             ), //o
    .m3_axi_arready           (axi4FullToLiteAdapter_3_io_full_ar_ready              ), //i
    .m3_axi_araddr    (xbar_m3_axi_araddr[31:0]                ), //o
    .m3_axi_arid      (xbar_m3_axi_arid[1:0]                   ), //o
    .m3_axi_arregion  (xbar_m3_axi_arregion[3:0]               ), //o
    .m3_axi_arlen     (xbar_m3_axi_arlen[7:0]                  ), //o
    .m3_axi_arsize    (xbar_m3_axi_arsize[2:0]                 ), //o
    .m3_axi_arburst   (xbar_m3_axi_arburst[1:0]                ), //o
    .m3_axi_arlock    (xbar_m3_axi_arlock                      ), //o
    .m3_axi_arcache   (xbar_m3_axi_arcache[3:0]                ), //o
    .m3_axi_arqos     (xbar_m3_axi_arqos[3:0]                  ), //o
    .m3_axi_arprot    (xbar_m3_axi_arprot[2:0]                 ), //o
    .m3_axi_rvalid            (axi4FullToLiteAdapter_3_io_full_r_valid               ), //i
    .m3_axi_rready            (xbar_m3_axi_rready                              ), //o
    .m3_axi_rdata     (axi4FullToLiteAdapter_3_io_full_r_payload_data[31:0]  ), //i
    .m3_axi_rid       (axi4FullToLiteAdapter_3_io_full_r_payload_id[1:0]     ), //i
    .m3_axi_rresp     (axi4FullToLiteAdapter_3_io_full_r_payload_resp[1:0]   ), //i
    .m3_axi_rlast     (axi4FullToLiteAdapter_3_io_full_r_payload_last        ), //i
    .aclk                            (aclk                                                   ), //i
    .aresetn                         (aresetn                                                )  //i
  );
  Axi4LiteToFullAdapter axi4LiteToFullAdapter_1 (
    .io_lite_aw_valid          (s1_axi_awvalid                                 ), //i
    .io_lite_aw_ready          (axi4LiteToFullAdapter_1_io_lite_aw_ready              ), //o
    .io_lite_aw_payload_addr   (s1_axi_awaddr[31:0]                    ), //i
    .io_lite_aw_payload_prot   (s1_axi_awprot[2:0]                     ), //i
    .io_lite_w_valid           (s1_axi_wvalid                                  ), //i
    .io_lite_w_ready           (axi4LiteToFullAdapter_1_io_lite_w_ready               ), //o
    .io_lite_w_payload_data    (s1_axi_wdata[31:0]                     ), //i
    .io_lite_w_payload_strb    (s1_axi_wstrb[3:0]                      ), //i
    .io_lite_b_valid           (axi4LiteToFullAdapter_1_io_lite_b_valid               ), //o
    .io_lite_b_ready           (s1_axi_bready                                  ), //i
    .io_lite_b_payload_resp    (axi4LiteToFullAdapter_1_io_lite_b_payload_resp[1:0]   ), //o
    .io_lite_ar_valid          (s1_axi_arvalid                                 ), //i
    .io_lite_ar_ready          (axi4LiteToFullAdapter_1_io_lite_ar_ready              ), //o
    .io_lite_ar_payload_addr   (s1_axi_araddr[31:0]                    ), //i
    .io_lite_ar_payload_prot   (s1_axi_arprot[2:0]                     ), //i
    .io_lite_r_valid           (axi4LiteToFullAdapter_1_io_lite_r_valid               ), //o
    .io_lite_r_ready           (s1_axi_rready                                  ), //i
    .io_lite_r_payload_data    (axi4LiteToFullAdapter_1_io_lite_r_payload_data[31:0]  ), //o
    .io_lite_r_payload_resp    (axi4LiteToFullAdapter_1_io_lite_r_payload_resp[1:0]   ), //o
    .io_full_aw_valid          (axi4LiteToFullAdapter_1_io_full_aw_valid              ), //o
    .io_full_aw_ready          (xbar_s1_axi_awready                            ), //i
    .io_full_aw_payload_addr   (axi4LiteToFullAdapter_1_io_full_aw_payload_addr[31:0] ), //o
    .io_full_aw_payload_id     (axi4LiteToFullAdapter_1_io_full_aw_payload_id         ), //o
    .io_full_aw_payload_region (axi4LiteToFullAdapter_1_io_full_aw_payload_region[3:0]), //o
    .io_full_aw_payload_len    (axi4LiteToFullAdapter_1_io_full_aw_payload_len[7:0]   ), //o
    .io_full_aw_payload_size   (axi4LiteToFullAdapter_1_io_full_aw_payload_size[2:0]  ), //o
    .io_full_aw_payload_burst  (axi4LiteToFullAdapter_1_io_full_aw_payload_burst[1:0] ), //o
    .io_full_aw_payload_lock   (axi4LiteToFullAdapter_1_io_full_aw_payload_lock       ), //o
    .io_full_aw_payload_cache  (axi4LiteToFullAdapter_1_io_full_aw_payload_cache[3:0] ), //o
    .io_full_aw_payload_qos    (axi4LiteToFullAdapter_1_io_full_aw_payload_qos[3:0]   ), //o
    .io_full_aw_payload_prot   (axi4LiteToFullAdapter_1_io_full_aw_payload_prot[2:0]  ), //o
    .io_full_w_valid           (axi4LiteToFullAdapter_1_io_full_w_valid               ), //o
    .io_full_w_ready           (xbar_s1_axi_wready                             ), //i
    .io_full_w_payload_data    (axi4LiteToFullAdapter_1_io_full_w_payload_data[31:0]  ), //o
    .io_full_w_payload_strb    (axi4LiteToFullAdapter_1_io_full_w_payload_strb[3:0]   ), //o
    .io_full_w_payload_last    (axi4LiteToFullAdapter_1_io_full_w_payload_last        ), //o
    .io_full_b_valid           (xbar_s1_axi_bvalid                             ), //i
    .io_full_b_ready           (axi4LiteToFullAdapter_1_io_full_b_ready               ), //o
    .io_full_b_payload_id      (xbar_s1_axi_bid                        ), //i
    .io_full_b_payload_resp    (xbar_s1_axi_bresp[1:0]                 ), //i
    .io_full_ar_valid          (axi4LiteToFullAdapter_1_io_full_ar_valid              ), //o
    .io_full_ar_ready          (xbar_s1_axi_arready                            ), //i
    .io_full_ar_payload_addr   (axi4LiteToFullAdapter_1_io_full_ar_payload_addr[31:0] ), //o
    .io_full_ar_payload_id     (axi4LiteToFullAdapter_1_io_full_ar_payload_id         ), //o
    .io_full_ar_payload_region (axi4LiteToFullAdapter_1_io_full_ar_payload_region[3:0]), //o
    .io_full_ar_payload_len    (axi4LiteToFullAdapter_1_io_full_ar_payload_len[7:0]   ), //o
    .io_full_ar_payload_size   (axi4LiteToFullAdapter_1_io_full_ar_payload_size[2:0]  ), //o
    .io_full_ar_payload_burst  (axi4LiteToFullAdapter_1_io_full_ar_payload_burst[1:0] ), //o
    .io_full_ar_payload_lock   (axi4LiteToFullAdapter_1_io_full_ar_payload_lock       ), //o
    .io_full_ar_payload_cache  (axi4LiteToFullAdapter_1_io_full_ar_payload_cache[3:0] ), //o
    .io_full_ar_payload_qos    (axi4LiteToFullAdapter_1_io_full_ar_payload_qos[3:0]   ), //o
    .io_full_ar_payload_prot   (axi4LiteToFullAdapter_1_io_full_ar_payload_prot[2:0]  ), //o
    .io_full_r_valid           (xbar_s1_axi_rvalid                             ), //i
    .io_full_r_ready           (axi4LiteToFullAdapter_1_io_full_r_ready               ), //o
    .io_full_r_payload_data    (xbar_s1_axi_rdata[31:0]                ), //i
    .io_full_r_payload_id      (xbar_s1_axi_rid                        ), //i
    .io_full_r_payload_resp    (xbar_s1_axi_rresp[1:0]                 ), //i
    .io_full_r_payload_last    (xbar_s1_axi_rlast                      )  //i
  );
  Axi4FullToLiteAdapter axi4FullToLiteAdapter_2 (
    .io_full_aw_valid          (xbar_m2_axi_awvalid                            ), //i
    .io_full_aw_ready          (axi4FullToLiteAdapter_2_io_full_aw_ready             ), //o
    .io_full_aw_payload_addr   (xbar_m2_axi_awaddr[31:0]               ), //i
    .io_full_aw_payload_id     (xbar_m2_axi_awid[1:0]                  ), //i
    .io_full_aw_payload_region (xbar_m2_axi_awregion[3:0]              ), //i
    .io_full_aw_payload_len    (xbar_m2_axi_awlen[7:0]                 ), //i
    .io_full_aw_payload_size   (xbar_m2_axi_awsize[2:0]                ), //i
    .io_full_aw_payload_burst  (xbar_m2_axi_awburst[1:0]               ), //i
    .io_full_aw_payload_lock   (xbar_m2_axi_awlock                     ), //i
    .io_full_aw_payload_cache  (xbar_m2_axi_awcache[3:0]               ), //i
    .io_full_aw_payload_qos    (xbar_m2_axi_awqos[3:0]                 ), //i
    .io_full_aw_payload_prot   (xbar_m2_axi_awprot[2:0]                ), //i
    .io_full_w_valid           (xbar_m2_axi_wvalid                             ), //i
    .io_full_w_ready           (axi4FullToLiteAdapter_2_io_full_w_ready              ), //o
    .io_full_w_payload_data    (xbar_m2_axi_wdata[31:0]                ), //i
    .io_full_w_payload_strb    (xbar_m2_axi_wstrb[3:0]                 ), //i
    .io_full_w_payload_last    (xbar_m2_axi_wlast                      ), //i
    .io_full_b_valid           (axi4FullToLiteAdapter_2_io_full_b_valid              ), //o
    .io_full_b_ready           (xbar_m2_axi_bready                             ), //i
    .io_full_b_payload_id      (axi4FullToLiteAdapter_2_io_full_b_payload_id[1:0]    ), //o
    .io_full_b_payload_resp    (axi4FullToLiteAdapter_2_io_full_b_payload_resp[1:0]  ), //o
    .io_full_ar_valid          (xbar_m2_axi_arvalid                            ), //i
    .io_full_ar_ready          (axi4FullToLiteAdapter_2_io_full_ar_ready             ), //o
    .io_full_ar_payload_addr   (xbar_m2_axi_araddr[31:0]               ), //i
    .io_full_ar_payload_id     (xbar_m2_axi_arid[1:0]                  ), //i
    .io_full_ar_payload_region (xbar_m2_axi_arregion[3:0]              ), //i
    .io_full_ar_payload_len    (xbar_m2_axi_arlen[7:0]                 ), //i
    .io_full_ar_payload_size   (xbar_m2_axi_arsize[2:0]                ), //i
    .io_full_ar_payload_burst  (xbar_m2_axi_arburst[1:0]               ), //i
    .io_full_ar_payload_lock   (xbar_m2_axi_arlock                     ), //i
    .io_full_ar_payload_cache  (xbar_m2_axi_arcache[3:0]               ), //i
    .io_full_ar_payload_qos    (xbar_m2_axi_arqos[3:0]                 ), //i
    .io_full_ar_payload_prot   (xbar_m2_axi_arprot[2:0]                ), //i
    .io_full_r_valid           (axi4FullToLiteAdapter_2_io_full_r_valid              ), //o
    .io_full_r_ready           (xbar_m2_axi_rready                             ), //i
    .io_full_r_payload_data    (axi4FullToLiteAdapter_2_io_full_r_payload_data[31:0] ), //o
    .io_full_r_payload_id      (axi4FullToLiteAdapter_2_io_full_r_payload_id[1:0]    ), //o
    .io_full_r_payload_resp    (axi4FullToLiteAdapter_2_io_full_r_payload_resp[1:0]  ), //o
    .io_full_r_payload_last    (axi4FullToLiteAdapter_2_io_full_r_payload_last       ), //o
    .io_lite_aw_valid          (axi4FullToLiteAdapter_2_io_lite_aw_valid             ), //o
    .io_lite_aw_ready          (m2_axi_awready                                 ), //i
    .io_lite_aw_payload_addr   (axi4FullToLiteAdapter_2_io_lite_aw_payload_addr[31:0]), //o
    .io_lite_aw_payload_prot   (axi4FullToLiteAdapter_2_io_lite_aw_payload_prot[2:0] ), //o
    .io_lite_w_valid           (axi4FullToLiteAdapter_2_io_lite_w_valid              ), //o
    .io_lite_w_ready           (m2_axi_wready                                  ), //i
    .io_lite_w_payload_data    (axi4FullToLiteAdapter_2_io_lite_w_payload_data[31:0] ), //o
    .io_lite_w_payload_strb    (axi4FullToLiteAdapter_2_io_lite_w_payload_strb[3:0]  ), //o
    .io_lite_b_valid           (m2_axi_bvalid                                  ), //i
    .io_lite_b_ready           (axi4FullToLiteAdapter_2_io_lite_b_ready              ), //o
    .io_lite_b_payload_resp    (m2_axi_bresp[1:0]                      ), //i
    .io_lite_ar_valid          (axi4FullToLiteAdapter_2_io_lite_ar_valid             ), //o
    .io_lite_ar_ready          (m2_axi_arready                                 ), //i
    .io_lite_ar_payload_addr   (axi4FullToLiteAdapter_2_io_lite_ar_payload_addr[31:0]), //o
    .io_lite_ar_payload_prot   (axi4FullToLiteAdapter_2_io_lite_ar_payload_prot[2:0] ), //o
    .io_lite_r_valid           (m2_axi_rvalid                                  ), //i
    .io_lite_r_ready           (axi4FullToLiteAdapter_2_io_lite_r_ready              ), //o
    .io_lite_r_payload_data    (m2_axi_rdata[31:0]                     ), //i
    .io_lite_r_payload_resp    (m2_axi_rresp[1:0]                      ), //i
    .aclk                       (aclk                                                  ), //i
    .aresetn                    (aresetn                                               )  //i
  );
  Axi4FullToLiteAdapter axi4FullToLiteAdapter_3 (
    .io_full_aw_valid          (xbar_m3_axi_awvalid                            ), //i
    .io_full_aw_ready          (axi4FullToLiteAdapter_3_io_full_aw_ready             ), //o
    .io_full_aw_payload_addr   (xbar_m3_axi_awaddr[31:0]               ), //i
    .io_full_aw_payload_id     (xbar_m3_axi_awid[1:0]                  ), //i
    .io_full_aw_payload_region (xbar_m3_axi_awregion[3:0]              ), //i
    .io_full_aw_payload_len    (xbar_m3_axi_awlen[7:0]                 ), //i
    .io_full_aw_payload_size   (xbar_m3_axi_awsize[2:0]                ), //i
    .io_full_aw_payload_burst  (xbar_m3_axi_awburst[1:0]               ), //i
    .io_full_aw_payload_lock   (xbar_m3_axi_awlock                     ), //i
    .io_full_aw_payload_cache  (xbar_m3_axi_awcache[3:0]               ), //i
    .io_full_aw_payload_qos    (xbar_m3_axi_awqos[3:0]                 ), //i
    .io_full_aw_payload_prot   (xbar_m3_axi_awprot[2:0]                ), //i
    .io_full_w_valid           (xbar_m3_axi_wvalid                             ), //i
    .io_full_w_ready           (axi4FullToLiteAdapter_3_io_full_w_ready              ), //o
    .io_full_w_payload_data    (xbar_m3_axi_wdata[31:0]                ), //i
    .io_full_w_payload_strb    (xbar_m3_axi_wstrb[3:0]                 ), //i
    .io_full_w_payload_last    (xbar_m3_axi_wlast                      ), //i
    .io_full_b_valid           (axi4FullToLiteAdapter_3_io_full_b_valid              ), //o
    .io_full_b_ready           (xbar_m3_axi_bready                             ), //i
    .io_full_b_payload_id      (axi4FullToLiteAdapter_3_io_full_b_payload_id[1:0]    ), //o
    .io_full_b_payload_resp    (axi4FullToLiteAdapter_3_io_full_b_payload_resp[1:0]  ), //o
    .io_full_ar_valid          (xbar_m3_axi_arvalid                            ), //i
    .io_full_ar_ready          (axi4FullToLiteAdapter_3_io_full_ar_ready             ), //o
    .io_full_ar_payload_addr   (xbar_m3_axi_araddr[31:0]               ), //i
    .io_full_ar_payload_id     (xbar_m3_axi_arid[1:0]                  ), //i
    .io_full_ar_payload_region (xbar_m3_axi_arregion[3:0]              ), //i
    .io_full_ar_payload_len    (xbar_m3_axi_arlen[7:0]                 ), //i
    .io_full_ar_payload_size   (xbar_m3_axi_arsize[2:0]                ), //i
    .io_full_ar_payload_burst  (xbar_m3_axi_arburst[1:0]               ), //i
    .io_full_ar_payload_lock   (xbar_m3_axi_arlock                     ), //i
    .io_full_ar_payload_cache  (xbar_m3_axi_arcache[3:0]               ), //i
    .io_full_ar_payload_qos    (xbar_m3_axi_arqos[3:0]                 ), //i
    .io_full_ar_payload_prot   (xbar_m3_axi_arprot[2:0]                ), //i
    .io_full_r_valid           (axi4FullToLiteAdapter_3_io_full_r_valid              ), //o
    .io_full_r_ready           (xbar_m3_axi_rready                             ), //i
    .io_full_r_payload_data    (axi4FullToLiteAdapter_3_io_full_r_payload_data[31:0] ), //o
    .io_full_r_payload_id      (axi4FullToLiteAdapter_3_io_full_r_payload_id[1:0]    ), //o
    .io_full_r_payload_resp    (axi4FullToLiteAdapter_3_io_full_r_payload_resp[1:0]  ), //o
    .io_full_r_payload_last    (axi4FullToLiteAdapter_3_io_full_r_payload_last       ), //o
    .io_lite_aw_valid          (axi4FullToLiteAdapter_3_io_lite_aw_valid             ), //o
    .io_lite_aw_ready          (m3_axi_awready                                 ), //i
    .io_lite_aw_payload_addr   (axi4FullToLiteAdapter_3_io_lite_aw_payload_addr[31:0]), //o
    .io_lite_aw_payload_prot   (axi4FullToLiteAdapter_3_io_lite_aw_payload_prot[2:0] ), //o
    .io_lite_w_valid           (axi4FullToLiteAdapter_3_io_lite_w_valid              ), //o
    .io_lite_w_ready           (m3_axi_wready                                  ), //i
    .io_lite_w_payload_data    (axi4FullToLiteAdapter_3_io_lite_w_payload_data[31:0] ), //o
    .io_lite_w_payload_strb    (axi4FullToLiteAdapter_3_io_lite_w_payload_strb[3:0]  ), //o
    .io_lite_b_valid           (m3_axi_bvalid                                  ), //i
    .io_lite_b_ready           (axi4FullToLiteAdapter_3_io_lite_b_ready              ), //o
    .io_lite_b_payload_resp    (m3_axi_bresp[1:0]                      ), //i
    .io_lite_ar_valid          (axi4FullToLiteAdapter_3_io_lite_ar_valid             ), //o
    .io_lite_ar_ready          (m3_axi_arready                                 ), //i
    .io_lite_ar_payload_addr   (axi4FullToLiteAdapter_3_io_lite_ar_payload_addr[31:0]), //o
    .io_lite_ar_payload_prot   (axi4FullToLiteAdapter_3_io_lite_ar_payload_prot[2:0] ), //o
    .io_lite_r_valid           (m3_axi_rvalid                                  ), //i
    .io_lite_r_ready           (axi4FullToLiteAdapter_3_io_lite_r_ready              ), //o
    .io_lite_r_payload_data    (m3_axi_rdata[31:0]                     ), //i
    .io_lite_r_payload_resp    (m3_axi_rresp[1:0]                      ), //i
    .aclk                       (aclk                                                  ), //i
    .aresetn                    (aresetn                                               )  //i
  );
  assign s0_axi_awready = xbar_s0_axi_awready;
  assign s0_axi_wready = xbar_s0_axi_wready;
  assign s0_axi_bvalid = xbar_s0_axi_bvalid;
  assign s0_axi_bid = xbar_s0_axi_bid;
  assign s0_axi_bresp = xbar_s0_axi_bresp;
  assign s0_axi_arready = xbar_s0_axi_arready;
  assign s0_axi_rvalid = xbar_s0_axi_rvalid;
  assign s0_axi_rdata = xbar_s0_axi_rdata;
  assign s0_axi_rid = xbar_s0_axi_rid;
  assign s0_axi_rresp = xbar_s0_axi_rresp;
  assign s0_axi_rlast = xbar_s0_axi_rlast;
  assign s1_axi_awready = axi4LiteToFullAdapter_1_io_lite_aw_ready;
  assign s1_axi_wready = axi4LiteToFullAdapter_1_io_lite_w_ready;
  assign s1_axi_bvalid = axi4LiteToFullAdapter_1_io_lite_b_valid;
  assign s1_axi_bresp = axi4LiteToFullAdapter_1_io_lite_b_payload_resp;
  assign s1_axi_arready = axi4LiteToFullAdapter_1_io_lite_ar_ready;
  assign s1_axi_rvalid = axi4LiteToFullAdapter_1_io_lite_r_valid;
  assign s1_axi_rdata = axi4LiteToFullAdapter_1_io_lite_r_payload_data;
  assign s1_axi_rresp = axi4LiteToFullAdapter_1_io_lite_r_payload_resp;
  assign m0_axi_awvalid = xbar_m0_axi_awvalid;
  assign m0_axi_awaddr = xbar_m0_axi_awaddr;
  assign m0_axi_awid = xbar_m0_axi_awid;
  assign m0_axi_awregion = xbar_m0_axi_awregion;
  assign m0_axi_awlen = xbar_m0_axi_awlen;
  assign m0_axi_awsize = xbar_m0_axi_awsize;
  assign m0_axi_awburst = xbar_m0_axi_awburst;
  assign m0_axi_awlock = xbar_m0_axi_awlock;
  assign m0_axi_awcache = xbar_m0_axi_awcache;
  assign m0_axi_awqos = xbar_m0_axi_awqos;
  assign m0_axi_awprot = xbar_m0_axi_awprot;
  assign m0_axi_wvalid = xbar_m0_axi_wvalid;
  assign m0_axi_wdata = xbar_m0_axi_wdata;
  assign m0_axi_wstrb = xbar_m0_axi_wstrb;
  assign m0_axi_wlast = xbar_m0_axi_wlast;
  assign m0_axi_bready = xbar_m0_axi_bready;
  assign m0_axi_arvalid = xbar_m0_axi_arvalid;
  assign m0_axi_araddr = xbar_m0_axi_araddr;
  assign m0_axi_arid = xbar_m0_axi_arid;
  assign m0_axi_arregion = xbar_m0_axi_arregion;
  assign m0_axi_arlen = xbar_m0_axi_arlen;
  assign m0_axi_arsize = xbar_m0_axi_arsize;
  assign m0_axi_arburst = xbar_m0_axi_arburst;
  assign m0_axi_arlock = xbar_m0_axi_arlock;
  assign m0_axi_arcache = xbar_m0_axi_arcache;
  assign m0_axi_arqos = xbar_m0_axi_arqos;
  assign m0_axi_arprot = xbar_m0_axi_arprot;
  assign m0_axi_rready = xbar_m0_axi_rready;
  assign m1_axi_awvalid = xbar_m1_axi_awvalid;
  assign m1_axi_awaddr = xbar_m1_axi_awaddr;
  assign m1_axi_awid = xbar_m1_axi_awid;
  assign m1_axi_awregion = xbar_m1_axi_awregion;
  assign m1_axi_awlen = xbar_m1_axi_awlen;
  assign m1_axi_awsize = xbar_m1_axi_awsize;
  assign m1_axi_awburst = xbar_m1_axi_awburst;
  assign m1_axi_awlock = xbar_m1_axi_awlock;
  assign m1_axi_awcache = xbar_m1_axi_awcache;
  assign m1_axi_awqos = xbar_m1_axi_awqos;
  assign m1_axi_awprot = xbar_m1_axi_awprot;
  assign m1_axi_wvalid = xbar_m1_axi_wvalid;
  assign m1_axi_wdata = xbar_m1_axi_wdata;
  assign m1_axi_wstrb = xbar_m1_axi_wstrb;
  assign m1_axi_wlast = xbar_m1_axi_wlast;
  assign m1_axi_bready = xbar_m1_axi_bready;
  assign m1_axi_arvalid = xbar_m1_axi_arvalid;
  assign m1_axi_araddr = xbar_m1_axi_araddr;
  assign m1_axi_arid = xbar_m1_axi_arid;
  assign m1_axi_arregion = xbar_m1_axi_arregion;
  assign m1_axi_arlen = xbar_m1_axi_arlen;
  assign m1_axi_arsize = xbar_m1_axi_arsize;
  assign m1_axi_arburst = xbar_m1_axi_arburst;
  assign m1_axi_arlock = xbar_m1_axi_arlock;
  assign m1_axi_arcache = xbar_m1_axi_arcache;
  assign m1_axi_arqos = xbar_m1_axi_arqos;
  assign m1_axi_arprot = xbar_m1_axi_arprot;
  assign m1_axi_rready = xbar_m1_axi_rready;
  assign m2_axi_awvalid = axi4FullToLiteAdapter_2_io_lite_aw_valid;
  assign m2_axi_awaddr = axi4FullToLiteAdapter_2_io_lite_aw_payload_addr;
  assign m2_axi_awprot = axi4FullToLiteAdapter_2_io_lite_aw_payload_prot;
  assign m2_axi_wvalid = axi4FullToLiteAdapter_2_io_lite_w_valid;
  assign m2_axi_wdata = axi4FullToLiteAdapter_2_io_lite_w_payload_data;
  assign m2_axi_wstrb = axi4FullToLiteAdapter_2_io_lite_w_payload_strb;
  assign m2_axi_bready = axi4FullToLiteAdapter_2_io_lite_b_ready;
  assign m2_axi_arvalid = axi4FullToLiteAdapter_2_io_lite_ar_valid;
  assign m2_axi_araddr = axi4FullToLiteAdapter_2_io_lite_ar_payload_addr;
  assign m2_axi_arprot = axi4FullToLiteAdapter_2_io_lite_ar_payload_prot;
  assign m2_axi_rready = axi4FullToLiteAdapter_2_io_lite_r_ready;
  assign m3_axi_awvalid = axi4FullToLiteAdapter_3_io_lite_aw_valid;
  assign m3_axi_awaddr = axi4FullToLiteAdapter_3_io_lite_aw_payload_addr;
  assign m3_axi_awprot = axi4FullToLiteAdapter_3_io_lite_aw_payload_prot;
  assign m3_axi_wvalid = axi4FullToLiteAdapter_3_io_lite_w_valid;
  assign m3_axi_wdata = axi4FullToLiteAdapter_3_io_lite_w_payload_data;
  assign m3_axi_wstrb = axi4FullToLiteAdapter_3_io_lite_w_payload_strb;
  assign m3_axi_bready = axi4FullToLiteAdapter_3_io_lite_b_ready;
  assign m3_axi_arvalid = axi4FullToLiteAdapter_3_io_lite_ar_valid;
  assign m3_axi_araddr = axi4FullToLiteAdapter_3_io_lite_ar_payload_addr;
  assign m3_axi_arprot = axi4FullToLiteAdapter_3_io_lite_ar_payload_prot;
  assign m3_axi_rready = axi4FullToLiteAdapter_3_io_lite_r_ready;

endmodule

//Axi4FullToLiteAdapter_1 replaced by Axi4FullToLiteAdapter

module Axi4FullToLiteAdapter (
  input  wire          io_full_aw_valid,
  output wire          io_full_aw_ready,
  input  wire [31:0]   io_full_aw_payload_addr,
  input  wire [1:0]    io_full_aw_payload_id,
  input  wire [3:0]    io_full_aw_payload_region,
  input  wire [7:0]    io_full_aw_payload_len,
  input  wire [2:0]    io_full_aw_payload_size,
  input  wire [1:0]    io_full_aw_payload_burst,
  input  wire [0:0]    io_full_aw_payload_lock,
  input  wire [3:0]    io_full_aw_payload_cache,
  input  wire [3:0]    io_full_aw_payload_qos,
  input  wire [2:0]    io_full_aw_payload_prot,
  input  wire          io_full_w_valid,
  output wire          io_full_w_ready,
  input  wire [31:0]   io_full_w_payload_data,
  input  wire [3:0]    io_full_w_payload_strb,
  input  wire          io_full_w_payload_last,
  output wire          io_full_b_valid,
  input  wire          io_full_b_ready,
  output reg  [1:0]    io_full_b_payload_id,
  output reg  [1:0]    io_full_b_payload_resp,
  input  wire          io_full_ar_valid,
  output wire          io_full_ar_ready,
  input  wire [31:0]   io_full_ar_payload_addr,
  input  wire [1:0]    io_full_ar_payload_id,
  input  wire [3:0]    io_full_ar_payload_region,
  input  wire [7:0]    io_full_ar_payload_len,
  input  wire [2:0]    io_full_ar_payload_size,
  input  wire [1:0]    io_full_ar_payload_burst,
  input  wire [0:0]    io_full_ar_payload_lock,
  input  wire [3:0]    io_full_ar_payload_cache,
  input  wire [3:0]    io_full_ar_payload_qos,
  input  wire [2:0]    io_full_ar_payload_prot,
  output wire          io_full_r_valid,
  input  wire          io_full_r_ready,
  output reg  [31:0]   io_full_r_payload_data,
  output reg  [1:0]    io_full_r_payload_id,
  output reg  [1:0]    io_full_r_payload_resp,
  output reg           io_full_r_payload_last,
  output wire          io_lite_aw_valid,
  input  wire          io_lite_aw_ready,
  output reg  [31:0]   io_lite_aw_payload_addr,
  output reg  [2:0]    io_lite_aw_payload_prot,
  output wire          io_lite_w_valid,
  input  wire          io_lite_w_ready,
  output reg  [31:0]   io_lite_w_payload_data,
  output reg  [3:0]    io_lite_w_payload_strb,
  input  wire          io_lite_b_valid,
  output wire          io_lite_b_ready,
  input  wire [1:0]    io_lite_b_payload_resp,
  output wire          io_lite_ar_valid,
  input  wire          io_lite_ar_ready,
  output reg  [31:0]   io_lite_ar_payload_addr,
  output reg  [2:0]    io_lite_ar_payload_prot,
  input  wire          io_lite_r_valid,
  output wire          io_lite_r_ready,
  input  wire [31:0]   io_lite_r_payload_data,
  input  wire [1:0]    io_lite_r_payload_resp,
  input  wire          aclk,
  input  wire          aresetn
);

  wire       [34:0]   _zz_io_lite_aw_payload_addr;
  reg        [1:0]    _zz_io_full_b_payload_id;
  reg                 _zz_1;
  wire                io_full_aw_fire;
  wire                io_full_b_fire;
  wire       [3:0]    _zz_io_full_b_payload_id_1;
  wire       [35:0]   _zz_io_lite_w_payload_data;
  wire       [34:0]   _zz_io_lite_ar_payload_addr;
  reg        [1:0]    _zz_io_full_r_payload_id;
  reg                 _zz_2;
  wire                io_full_ar_fire;
  wire                io_full_r_fire;
  wire                when_Axi4FullToLiteAdapter_l89;
  wire       [36:0]   _zz_io_full_r_payload_data;

  assign io_lite_aw_valid = io_full_aw_valid;
  assign _zz_io_lite_aw_payload_addr = 35'h000000000;
  always @(*) begin
    io_lite_aw_payload_addr = _zz_io_lite_aw_payload_addr[31 : 0];
    io_lite_aw_payload_addr = io_full_aw_payload_addr;
  end

  always @(*) begin
    io_lite_aw_payload_prot = _zz_io_lite_aw_payload_addr[34 : 32];
    io_lite_aw_payload_prot = io_full_aw_payload_prot;
  end

  assign io_full_aw_ready = io_lite_aw_ready;
  assign io_full_aw_fire = (io_full_aw_valid && io_full_aw_ready);
  assign io_full_b_fire = (io_full_b_valid && io_full_b_ready);
  assign io_full_b_valid = io_lite_b_valid;
  assign _zz_io_full_b_payload_id_1 = 4'b0000;
  always @(*) begin
    io_full_b_payload_id = _zz_io_full_b_payload_id_1[1 : 0];
    io_full_b_payload_id = _zz_io_full_b_payload_id;
  end

  always @(*) begin
    io_full_b_payload_resp = _zz_io_full_b_payload_id_1[3 : 2];
    io_full_b_payload_resp = io_lite_b_payload_resp;
  end

  assign io_lite_b_ready = io_full_b_ready;
  assign io_lite_w_valid = io_full_w_valid;
  assign _zz_io_lite_w_payload_data = 36'h000000000;
  always @(*) begin
    io_lite_w_payload_data = _zz_io_lite_w_payload_data[31 : 0];
    io_lite_w_payload_data = io_full_w_payload_data;
  end

  always @(*) begin
    io_lite_w_payload_strb = _zz_io_lite_w_payload_data[35 : 32];
    io_lite_w_payload_strb = io_full_w_payload_strb;
  end

  assign io_full_w_ready = io_lite_w_ready;
  assign io_lite_ar_valid = io_full_ar_valid;
  assign _zz_io_lite_ar_payload_addr = 35'h000000000;
  always @(*) begin
    io_lite_ar_payload_addr = _zz_io_lite_ar_payload_addr[31 : 0];
    io_lite_ar_payload_addr = io_full_ar_payload_addr;
  end

  always @(*) begin
    io_lite_ar_payload_prot = _zz_io_lite_ar_payload_addr[34 : 32];
    io_lite_ar_payload_prot = io_full_ar_payload_prot;
  end

  assign io_full_ar_ready = io_lite_ar_ready;
  assign io_full_ar_fire = (io_full_ar_valid && io_full_ar_ready);
  assign io_full_r_fire = (io_full_r_valid && io_full_r_ready);
  assign when_Axi4FullToLiteAdapter_l89 = (io_full_r_fire && io_full_r_payload_last);
  assign io_full_r_valid = io_lite_r_valid;
  assign _zz_io_full_r_payload_data = 37'h0000000000;
  always @(*) begin
    io_full_r_payload_data = _zz_io_full_r_payload_data[31 : 0];
    io_full_r_payload_data = io_lite_r_payload_data;
  end

  always @(*) begin
    io_full_r_payload_id = _zz_io_full_r_payload_data[33 : 32];
    io_full_r_payload_id = _zz_io_full_r_payload_id;
  end

  always @(*) begin
    io_full_r_payload_resp = _zz_io_full_r_payload_data[35 : 34];
    io_full_r_payload_resp = io_lite_r_payload_resp;
  end

  always @(*) begin
    io_full_r_payload_last = _zz_io_full_r_payload_data[36];
    io_full_r_payload_last = 1'b1;
  end

  assign io_lite_r_ready = io_full_r_ready;
  always @(posedge aclk) begin
    if(!aresetn) begin
      _zz_io_full_b_payload_id <= 2'b00;
      _zz_1 <= 1'b0;
      _zz_io_full_r_payload_id <= 2'b00;
      _zz_2 <= 1'b0;
    end else begin
      if(io_full_aw_fire) begin
        _zz_io_full_b_payload_id <= io_full_aw_payload_id;
        _zz_1 <= 1'b1;
      end
      if(io_full_b_fire) begin
        _zz_1 <= 1'b0;
      end
      `ifndef SYNTHESIS
        `ifdef FORMAL
          assert((! (_zz_1 && io_full_aw_fire))); // Axi4FullToLiteAdapter.scala:L50
        `else
          if(!(! (_zz_1 && io_full_aw_fire))) begin
            $display("FAILURE Axi4FullToLiteAdapter: new AW while previous write still in-flight"); // Axi4FullToLiteAdapter.scala:L50
            $finish;
          end
        `endif
      `endif
      if(io_full_ar_fire) begin
        _zz_io_full_r_payload_id <= io_full_ar_payload_id;
        _zz_2 <= 1'b1;
      end
      if(when_Axi4FullToLiteAdapter_l89) begin
        _zz_2 <= 1'b0;
      end
      `ifndef SYNTHESIS
        `ifdef FORMAL
          assert((! (_zz_2 && io_full_ar_fire))); // Axi4FullToLiteAdapter.scala:L90
        `else
          if(!(! (_zz_2 && io_full_ar_fire))) begin
            $display("FAILURE Axi4FullToLiteAdapter: new AR while previous read still in-flight"); // Axi4FullToLiteAdapter.scala:L90
            $finish;
          end
        `endif
      `endif
    end
  end


endmodule

module Axi4LiteToFullAdapter (
  input  wire          io_lite_aw_valid,
  output wire          io_lite_aw_ready,
  input  wire [31:0]   io_lite_aw_payload_addr,
  input  wire [2:0]    io_lite_aw_payload_prot,
  input  wire          io_lite_w_valid,
  output wire          io_lite_w_ready,
  input  wire [31:0]   io_lite_w_payload_data,
  input  wire [3:0]    io_lite_w_payload_strb,
  output wire          io_lite_b_valid,
  input  wire          io_lite_b_ready,
  output reg  [1:0]    io_lite_b_payload_resp,
  input  wire          io_lite_ar_valid,
  output wire          io_lite_ar_ready,
  input  wire [31:0]   io_lite_ar_payload_addr,
  input  wire [2:0]    io_lite_ar_payload_prot,
  output wire          io_lite_r_valid,
  input  wire          io_lite_r_ready,
  output reg  [31:0]   io_lite_r_payload_data,
  output reg  [1:0]    io_lite_r_payload_resp,
  output wire          io_full_aw_valid,
  input  wire          io_full_aw_ready,
  output reg  [31:0]   io_full_aw_payload_addr,
  output reg  [0:0]    io_full_aw_payload_id,
  output wire [3:0]    io_full_aw_payload_region,
  output reg  [7:0]    io_full_aw_payload_len,
  output reg  [2:0]    io_full_aw_payload_size,
  output reg  [1:0]    io_full_aw_payload_burst,
  output wire [0:0]    io_full_aw_payload_lock,
  output wire [3:0]    io_full_aw_payload_cache,
  output wire [3:0]    io_full_aw_payload_qos,
  output reg  [2:0]    io_full_aw_payload_prot,
  output wire          io_full_w_valid,
  input  wire          io_full_w_ready,
  output reg  [31:0]   io_full_w_payload_data,
  output reg  [3:0]    io_full_w_payload_strb,
  output reg           io_full_w_payload_last,
  input  wire          io_full_b_valid,
  output wire          io_full_b_ready,
  input  wire [0:0]    io_full_b_payload_id,
  input  wire [1:0]    io_full_b_payload_resp,
  output wire          io_full_ar_valid,
  input  wire          io_full_ar_ready,
  output reg  [31:0]   io_full_ar_payload_addr,
  output reg  [0:0]    io_full_ar_payload_id,
  output wire [3:0]    io_full_ar_payload_region,
  output reg  [7:0]    io_full_ar_payload_len,
  output reg  [2:0]    io_full_ar_payload_size,
  output reg  [1:0]    io_full_ar_payload_burst,
  output wire [0:0]    io_full_ar_payload_lock,
  output wire [3:0]    io_full_ar_payload_cache,
  output wire [3:0]    io_full_ar_payload_qos,
  output reg  [2:0]    io_full_ar_payload_prot,
  input  wire          io_full_r_valid,
  output wire          io_full_r_ready,
  input  wire [31:0]   io_full_r_payload_data,
  input  wire [0:0]    io_full_r_payload_id,
  input  wire [1:0]    io_full_r_payload_resp,
  input  wire          io_full_r_payload_last
);

  wire       [1:0]    _zz_io_lite_b_payload_resp;
  wire       [61:0]   _zz_io_full_aw_payload_addr;
  wire       [36:0]   _zz_io_full_w_payload_data;
  wire       [61:0]   _zz_io_full_ar_payload_addr;
  wire       [33:0]   _zz_io_lite_r_payload_data;

  assign _zz_io_lite_b_payload_resp = 2'b00;
  assign io_full_aw_valid = io_lite_aw_valid;
  assign _zz_io_full_aw_payload_addr = 62'h0000000000000000;
  always @(*) begin
    io_full_aw_payload_addr = _zz_io_full_aw_payload_addr[31 : 0];
    io_full_aw_payload_addr = io_lite_aw_payload_addr;
  end

  always @(*) begin
    io_full_aw_payload_id = _zz_io_full_aw_payload_addr[32 : 32];
    io_full_aw_payload_id = 1'b0;
  end

  assign io_full_aw_payload_region = _zz_io_full_aw_payload_addr[36 : 33];
  always @(*) begin
    io_full_aw_payload_len = _zz_io_full_aw_payload_addr[44 : 37];
    io_full_aw_payload_len = 8'h00;
  end

  always @(*) begin
    io_full_aw_payload_size = _zz_io_full_aw_payload_addr[47 : 45];
    io_full_aw_payload_size = 3'b010;
  end

  always @(*) begin
    io_full_aw_payload_burst = _zz_io_full_aw_payload_addr[49 : 48];
    io_full_aw_payload_burst = 2'b01;
  end

  assign io_full_aw_payload_lock = _zz_io_full_aw_payload_addr[50 : 50];
  assign io_full_aw_payload_cache = _zz_io_full_aw_payload_addr[54 : 51];
  assign io_full_aw_payload_qos = _zz_io_full_aw_payload_addr[58 : 55];
  always @(*) begin
    io_full_aw_payload_prot = _zz_io_full_aw_payload_addr[61 : 59];
    io_full_aw_payload_prot = io_lite_aw_payload_prot;
  end

  assign io_lite_aw_ready = io_full_aw_ready;
  assign io_full_w_valid = io_lite_w_valid;
  assign _zz_io_full_w_payload_data = 37'h0000000000;
  always @(*) begin
    io_full_w_payload_data = _zz_io_full_w_payload_data[31 : 0];
    io_full_w_payload_data = io_lite_w_payload_data;
  end

  always @(*) begin
    io_full_w_payload_strb = _zz_io_full_w_payload_data[35 : 32];
    io_full_w_payload_strb = io_lite_w_payload_strb;
  end

  always @(*) begin
    io_full_w_payload_last = _zz_io_full_w_payload_data[36];
    io_full_w_payload_last = 1'b1;
  end

  assign io_lite_w_ready = io_full_w_ready;
  assign io_lite_b_valid = io_full_b_valid;
  always @(*) begin
    io_lite_b_payload_resp = _zz_io_lite_b_payload_resp[1 : 0];
    io_lite_b_payload_resp = io_full_b_payload_resp;
  end

  assign io_full_b_ready = io_lite_b_ready;
  assign io_full_ar_valid = io_lite_ar_valid;
  assign _zz_io_full_ar_payload_addr = 62'h0000000000000000;
  always @(*) begin
    io_full_ar_payload_addr = _zz_io_full_ar_payload_addr[31 : 0];
    io_full_ar_payload_addr = io_lite_ar_payload_addr;
  end

  always @(*) begin
    io_full_ar_payload_id = _zz_io_full_ar_payload_addr[32 : 32];
    io_full_ar_payload_id = 1'b0;
  end

  assign io_full_ar_payload_region = _zz_io_full_ar_payload_addr[36 : 33];
  always @(*) begin
    io_full_ar_payload_len = _zz_io_full_ar_payload_addr[44 : 37];
    io_full_ar_payload_len = 8'h00;
  end

  always @(*) begin
    io_full_ar_payload_size = _zz_io_full_ar_payload_addr[47 : 45];
    io_full_ar_payload_size = 3'b010;
  end

  always @(*) begin
    io_full_ar_payload_burst = _zz_io_full_ar_payload_addr[49 : 48];
    io_full_ar_payload_burst = 2'b01;
  end

  assign io_full_ar_payload_lock = _zz_io_full_ar_payload_addr[50 : 50];
  assign io_full_ar_payload_cache = _zz_io_full_ar_payload_addr[54 : 51];
  assign io_full_ar_payload_qos = _zz_io_full_ar_payload_addr[58 : 55];
  always @(*) begin
    io_full_ar_payload_prot = _zz_io_full_ar_payload_addr[61 : 59];
    io_full_ar_payload_prot = io_lite_ar_payload_prot;
  end

  assign io_lite_ar_ready = io_full_ar_ready;
  assign io_lite_r_valid = io_full_r_valid;
  assign _zz_io_lite_r_payload_data = 34'h000000000;
  always @(*) begin
    io_lite_r_payload_data = _zz_io_lite_r_payload_data[31 : 0];
    io_lite_r_payload_data = io_full_r_payload_data;
  end

  always @(*) begin
    io_lite_r_payload_resp = _zz_io_lite_r_payload_data[33 : 32];
    io_lite_r_payload_resp = io_full_r_payload_resp;
  end

  assign io_full_r_ready = io_lite_r_ready;

endmodule

module Axi4Crossbar (
  input  wire          s0_axi_awvalid,
  output reg           s0_axi_awready,
  input  wire [31:0]   s0_axi_awaddr,
  input  wire [0:0]    s0_axi_awid,
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
  output reg  [0:0]    s0_axi_bid,
  output reg  [1:0]    s0_axi_bresp,
  input  wire          s0_axi_arvalid,
  output reg           s0_axi_arready,
  input  wire [31:0]   s0_axi_araddr,
  input  wire [0:0]    s0_axi_arid,
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
  output reg  [0:0]    s0_axi_rid,
  output reg  [1:0]    s0_axi_rresp,
  output reg           s0_axi_rlast,
  input  wire          s1_axi_awvalid,
  output reg           s1_axi_awready,
  input  wire [31:0]   s1_axi_awaddr,
  input  wire [0:0]    s1_axi_awid,
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
  output reg  [0:0]    s1_axi_bid,
  output reg  [1:0]    s1_axi_bresp,
  input  wire          s1_axi_arvalid,
  output reg           s1_axi_arready,
  input  wire [31:0]   s1_axi_araddr,
  input  wire [0:0]    s1_axi_arid,
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
  output reg  [0:0]    s1_axi_rid,
  output reg  [1:0]    s1_axi_rresp,
  output reg           s1_axi_rlast,
  output reg           m0_axi_awvalid,
  input  wire          m0_axi_awready,
  output reg  [31:0]   m0_axi_awaddr,
  output reg  [1:0]    m0_axi_awid,
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
  input  wire [1:0]    m0_axi_bid,
  input  wire [1:0]    m0_axi_bresp,
  output reg           m0_axi_arvalid,
  input  wire          m0_axi_arready,
  output reg  [31:0]   m0_axi_araddr,
  output reg  [1:0]    m0_axi_arid,
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
  input  wire [1:0]    m0_axi_rid,
  input  wire [1:0]    m0_axi_rresp,
  input  wire          m0_axi_rlast,
  output reg           m1_axi_awvalid,
  input  wire          m1_axi_awready,
  output reg  [31:0]   m1_axi_awaddr,
  output reg  [1:0]    m1_axi_awid,
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
  input  wire [1:0]    m1_axi_bid,
  input  wire [1:0]    m1_axi_bresp,
  output reg           m1_axi_arvalid,
  input  wire          m1_axi_arready,
  output reg  [31:0]   m1_axi_araddr,
  output reg  [1:0]    m1_axi_arid,
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
  input  wire [1:0]    m1_axi_rid,
  input  wire [1:0]    m1_axi_rresp,
  input  wire          m1_axi_rlast,
  output reg           m2_axi_awvalid,
  input  wire          m2_axi_awready,
  output reg  [31:0]   m2_axi_awaddr,
  output reg  [1:0]    m2_axi_awid,
  output wire [3:0]    m2_axi_awregion,
  output reg  [7:0]    m2_axi_awlen,
  output reg  [2:0]    m2_axi_awsize,
  output reg  [1:0]    m2_axi_awburst,
  output reg  [0:0]    m2_axi_awlock,
  output reg  [3:0]    m2_axi_awcache,
  output reg  [3:0]    m2_axi_awqos,
  output reg  [2:0]    m2_axi_awprot,
  output reg           m2_axi_wvalid,
  input  wire          m2_axi_wready,
  output reg  [31:0]   m2_axi_wdata,
  output reg  [3:0]    m2_axi_wstrb,
  output reg           m2_axi_wlast,
  input  wire          m2_axi_bvalid,
  output reg           m2_axi_bready,
  input  wire [1:0]    m2_axi_bid,
  input  wire [1:0]    m2_axi_bresp,
  output reg           m2_axi_arvalid,
  input  wire          m2_axi_arready,
  output reg  [31:0]   m2_axi_araddr,
  output reg  [1:0]    m2_axi_arid,
  output wire [3:0]    m2_axi_arregion,
  output reg  [7:0]    m2_axi_arlen,
  output reg  [2:0]    m2_axi_arsize,
  output reg  [1:0]    m2_axi_arburst,
  output reg  [0:0]    m2_axi_arlock,
  output reg  [3:0]    m2_axi_arcache,
  output reg  [3:0]    m2_axi_arqos,
  output reg  [2:0]    m2_axi_arprot,
  input  wire          m2_axi_rvalid,
  output reg           m2_axi_rready,
  input  wire [31:0]   m2_axi_rdata,
  input  wire [1:0]    m2_axi_rid,
  input  wire [1:0]    m2_axi_rresp,
  input  wire          m2_axi_rlast,
  output reg           m3_axi_awvalid,
  input  wire          m3_axi_awready,
  output reg  [31:0]   m3_axi_awaddr,
  output reg  [1:0]    m3_axi_awid,
  output wire [3:0]    m3_axi_awregion,
  output reg  [7:0]    m3_axi_awlen,
  output reg  [2:0]    m3_axi_awsize,
  output reg  [1:0]    m3_axi_awburst,
  output reg  [0:0]    m3_axi_awlock,
  output reg  [3:0]    m3_axi_awcache,
  output reg  [3:0]    m3_axi_awqos,
  output reg  [2:0]    m3_axi_awprot,
  output reg           m3_axi_wvalid,
  input  wire          m3_axi_wready,
  output reg  [31:0]   m3_axi_wdata,
  output reg  [3:0]    m3_axi_wstrb,
  output reg           m3_axi_wlast,
  input  wire          m3_axi_bvalid,
  output reg           m3_axi_bready,
  input  wire [1:0]    m3_axi_bid,
  input  wire [1:0]    m3_axi_bresp,
  output reg           m3_axi_arvalid,
  input  wire          m3_axi_arready,
  output reg  [31:0]   m3_axi_araddr,
  output reg  [1:0]    m3_axi_arid,
  output wire [3:0]    m3_axi_arregion,
  output reg  [7:0]    m3_axi_arlen,
  output reg  [2:0]    m3_axi_arsize,
  output reg  [1:0]    m3_axi_arburst,
  output reg  [0:0]    m3_axi_arlock,
  output reg  [3:0]    m3_axi_arcache,
  output reg  [3:0]    m3_axi_arqos,
  output reg  [2:0]    m3_axi_arprot,
  input  wire          m3_axi_rvalid,
  output reg           m3_axi_rready,
  input  wire [31:0]   m3_axi_rdata,
  input  wire [1:0]    m3_axi_rid,
  input  wire [1:0]    m3_axi_rresp,
  input  wire          m3_axi_rlast,
  input  wire          aclk,
  input  wire          aresetn
);

  wire       [0:0]    _zz__zz_5_port0;
  wire       [0:0]    _zz__zz_6_port0;
  wire       [0:0]    _zz__zz_7_port0;
  wire       [0:0]    _zz__zz_8_port0;
  wire       [1:0]    _zz__zz_when_Axi4Crossbar_l167_4;
  wire       [1:0]    _zz__zz_when_Axi4Crossbar_l167_4_1;
  wire       [1:0]    _zz__zz_9;
  wire       [0:0]    _zz__zz_5_port;
  wire       [1:0]    _zz__zz_when_Axi4Crossbar_l496;
  wire       [1:0]    _zz__zz_when_Axi4Crossbar_l167_9;
  wire       [1:0]    _zz__zz_when_Axi4Crossbar_l167_9_1;
  wire       [1:0]    _zz__zz_10;
  wire       [0:0]    _zz__zz_6_port;
  wire       [1:0]    _zz__zz_when_Axi4Crossbar_l496_1;
  wire       [1:0]    _zz__zz_when_Axi4Crossbar_l167_14;
  wire       [1:0]    _zz__zz_when_Axi4Crossbar_l167_14_1;
  wire       [1:0]    _zz__zz_11;
  wire       [0:0]    _zz__zz_7_port;
  wire       [1:0]    _zz__zz_when_Axi4Crossbar_l496_2;
  wire       [1:0]    _zz__zz_when_Axi4Crossbar_l167_19;
  wire       [1:0]    _zz__zz_when_Axi4Crossbar_l167_19_1;
  wire       [1:0]    _zz__zz_12;
  wire       [0:0]    _zz__zz_8_port;
  wire       [1:0]    _zz__zz_when_Axi4Crossbar_l496_3;
  wire       [0:0]    _zz__zz_when_Axi4Crossbar_l548;
  wire       [0:0]    _zz__zz_when_Axi4Crossbar_l548_1;
  wire       [0:0]    _zz__zz_when_Axi4Crossbar_l548_2;
  wire       [0:0]    _zz__zz_when_Axi4Crossbar_l548_3;
  wire       [3:0]    _zz__zz_when_Axi4Crossbar_l548_2_1;
  wire       [0:0]    _zz__zz_when_Axi4Crossbar_l548_3_1;
  wire       [0:0]    _zz__zz_when_Axi4Crossbar_l548_3_2;
  wire       [0:0]    _zz__zz_when_Axi4Crossbar_l548_3_3;
  wire       [0:0]    _zz__zz_when_Axi4Crossbar_l548_3_4;
  wire       [3:0]    _zz__zz_when_Axi4Crossbar_l548_5;
  wire       [1:0]    _zz__zz_when_Axi4Crossbar_l167_24;
  wire       [1:0]    _zz__zz_when_Axi4Crossbar_l167_24_1;
  wire       [1:0]    _zz__zz_when_Axi4Crossbar_l167_29;
  wire       [1:0]    _zz__zz_when_Axi4Crossbar_l167_29_1;
  wire       [1:0]    _zz__zz_when_Axi4Crossbar_l167_34;
  wire       [1:0]    _zz__zz_when_Axi4Crossbar_l167_34_1;
  wire       [1:0]    _zz__zz_when_Axi4Crossbar_l167_39;
  wire       [1:0]    _zz__zz_when_Axi4Crossbar_l167_39_1;
  wire       [0:0]    _zz__zz_when_Axi4Crossbar_l620;
  wire       [0:0]    _zz__zz_when_Axi4Crossbar_l620_1;
  wire       [0:0]    _zz__zz_when_Axi4Crossbar_l620_2;
  wire       [0:0]    _zz__zz_when_Axi4Crossbar_l620_3;
  wire       [3:0]    _zz__zz_when_Axi4Crossbar_l620_2_1;
  wire       [0:0]    _zz__zz_when_Axi4Crossbar_l620_3_1;
  wire       [0:0]    _zz__zz_when_Axi4Crossbar_l620_3_2;
  wire       [0:0]    _zz__zz_when_Axi4Crossbar_l620_3_3;
  wire       [0:0]    _zz__zz_when_Axi4Crossbar_l620_3_4;
  wire       [3:0]    _zz__zz_when_Axi4Crossbar_l620_5;
  reg                 _zz_1;
  reg                 _zz_2;
  reg                 _zz_3;
  reg                 _zz_4;
  reg        [0:0]    wrRrPtr_0;
  reg        [0:0]    wrRrPtr_1;
  reg        [0:0]    wrRrPtr_2;
  reg        [0:0]    wrRrPtr_3;
  reg        [0:0]    rdRrPtr_0;
  reg        [0:0]    rdRrPtr_1;
  reg        [0:0]    rdRrPtr_2;
  reg        [0:0]    rdRrPtr_3;
  wire       [2:0]    _zz_s0_axi_bid;
  wire       [35:0]   _zz_s0_axi_rdata;
  wire       [2:0]    _zz_s1_axi_bid;
  wire       [35:0]   _zz_s1_axi_rdata;
  wire       [62:0]   _zz_m0_axi_awaddr;
  wire       [36:0]   _zz_m0_axi_wdata;
  wire       [62:0]   _zz_m0_axi_araddr;
  wire       [62:0]   _zz_m1_axi_awaddr;
  wire       [36:0]   _zz_m1_axi_wdata;
  wire       [62:0]   _zz_m1_axi_araddr;
  wire       [62:0]   _zz_m2_axi_awaddr;
  wire       [36:0]   _zz_m2_axi_wdata;
  wire       [62:0]   _zz_m2_axi_araddr;
  wire       [62:0]   _zz_m3_axi_awaddr;
  wire       [36:0]   _zz_m3_axi_wdata;
  wire       [62:0]   _zz_m3_axi_araddr;
  reg        [2:0]    _zz_when_Axi4Crossbar_l464;
  reg        [2:0]    _zz_when_Axi4Crossbar_l464_1;
  reg        [2:0]    _zz_when_Axi4Crossbar_l464_2;
  reg        [2:0]    _zz_when_Axi4Crossbar_l464_3;
  reg        [1:0]    _zz_9;
  reg        [1:0]    _zz_10;
  reg        [1:0]    _zz_11;
  reg        [1:0]    _zz_12;
  reg        [1:0]    _zz_when_Axi4Crossbar_l496;
  reg        [1:0]    _zz_when_Axi4Crossbar_l496_1;
  reg        [1:0]    _zz_when_Axi4Crossbar_l496_2;
  reg        [1:0]    _zz_when_Axi4Crossbar_l496_3;
  reg        [2:0]    _zz_when_Axi4Crossbar_l473;
  reg        [2:0]    _zz_when_Axi4Crossbar_l473_1;
  reg        [2:0]    _zz_when_Axi4Crossbar_l473_2;
  reg        [2:0]    _zz_when_Axi4Crossbar_l473_3;
  reg        [2:0]    _zz_when_Axi4Crossbar_l579;
  reg        [2:0]    _zz_when_Axi4Crossbar_l579_1;
  reg        [2:0]    _zz_when_Axi4Crossbar_l579_2;
  reg        [2:0]    _zz_when_Axi4Crossbar_l579_3;
  reg        [1:0]    _zz_when_Axi4Crossbar_l464_4;
  reg        [3:0]    _zz_when_Axi4Crossbar_l464_5;
  reg        [3:0]    _zz_when_Axi4Crossbar_l464_6;
  reg        [1:0]    _zz_when_Axi4Crossbar_l167;
  wire       [1:0]    _zz_when_Axi4Crossbar_l167_1;
  wire       [1:0]    _zz_when_Axi4Crossbar_l167_2;
  wire       [1:0]    _zz_when_Axi4Crossbar_l167_3;
  wire       [1:0]    _zz_when_Axi4Crossbar_l167_4;
  reg        [0:0]    _zz_m0_axi_awid;
  wire                when_Axi4Crossbar_l167;
  wire                when_Axi4Crossbar_l167_1;
  wire                when_Axi4Crossbar_l473;
  wire       [0:0]    _zz_when_Axi4Crossbar_l496_4;
  wire                when_Axi4Crossbar_l464;
  wire                when_Axi4Crossbar_l467;
  wire                when_Axi4Crossbar_l467_1;
  wire                io_slaves_0_aw_fire;
  wire                when_Axi4Crossbar_l494;
  wire                when_Axi4Crossbar_l496;
  wire                when_Axi4Crossbar_l496_1;
  wire                when_Axi4Crossbar_l511;
  wire                io_slaves_0_w_fire;
  wire                when_Axi4Crossbar_l517;
  wire                when_Axi4Crossbar_l519;
  wire                io_slaves_0_b_fire;
  wire                when_Axi4Crossbar_l526;
  wire                when_Axi4Crossbar_l528;
  reg        [1:0]    _zz_when_Axi4Crossbar_l464_7;
  reg        [3:0]    _zz_when_Axi4Crossbar_l464_8;
  reg        [3:0]    _zz_when_Axi4Crossbar_l464_9;
  reg        [1:0]    _zz_when_Axi4Crossbar_l167_5;
  wire       [1:0]    _zz_when_Axi4Crossbar_l167_6;
  wire       [1:0]    _zz_when_Axi4Crossbar_l167_7;
  wire       [1:0]    _zz_when_Axi4Crossbar_l167_8;
  wire       [1:0]    _zz_when_Axi4Crossbar_l167_9;
  reg        [0:0]    _zz_m1_axi_awid;
  wire                when_Axi4Crossbar_l167_2;
  wire                when_Axi4Crossbar_l167_3;
  wire                when_Axi4Crossbar_l473_1;
  wire       [0:0]    _zz_when_Axi4Crossbar_l496_5;
  wire                when_Axi4Crossbar_l464_1;
  wire                when_Axi4Crossbar_l467_2;
  wire                when_Axi4Crossbar_l467_3;
  wire                io_slaves_1_aw_fire;
  wire                when_Axi4Crossbar_l494_1;
  wire                when_Axi4Crossbar_l496_2;
  wire                when_Axi4Crossbar_l496_3;
  wire                when_Axi4Crossbar_l511_1;
  wire                io_slaves_1_w_fire;
  wire                when_Axi4Crossbar_l517_1;
  wire                when_Axi4Crossbar_l519_1;
  wire                io_slaves_1_b_fire;
  wire                when_Axi4Crossbar_l526_1;
  wire                when_Axi4Crossbar_l528_1;
  reg        [1:0]    _zz_when_Axi4Crossbar_l464_10;
  reg        [3:0]    _zz_when_Axi4Crossbar_l464_11;
  reg        [3:0]    _zz_when_Axi4Crossbar_l464_12;
  reg        [1:0]    _zz_when_Axi4Crossbar_l167_10;
  wire       [1:0]    _zz_when_Axi4Crossbar_l167_11;
  wire       [1:0]    _zz_when_Axi4Crossbar_l167_12;
  wire       [1:0]    _zz_when_Axi4Crossbar_l167_13;
  wire       [1:0]    _zz_when_Axi4Crossbar_l167_14;
  reg        [0:0]    _zz_m2_axi_awid;
  wire                when_Axi4Crossbar_l167_4;
  wire                when_Axi4Crossbar_l167_5;
  wire                when_Axi4Crossbar_l473_2;
  wire       [0:0]    _zz_when_Axi4Crossbar_l496_6;
  wire                when_Axi4Crossbar_l464_2;
  wire                when_Axi4Crossbar_l467_4;
  wire                when_Axi4Crossbar_l467_5;
  wire                io_slaves_2_aw_fire;
  wire                when_Axi4Crossbar_l494_2;
  wire                when_Axi4Crossbar_l496_4;
  wire                when_Axi4Crossbar_l496_5;
  wire                when_Axi4Crossbar_l511_2;
  wire                io_slaves_2_w_fire;
  wire                when_Axi4Crossbar_l517_2;
  wire                when_Axi4Crossbar_l519_2;
  wire                io_slaves_2_b_fire;
  wire                when_Axi4Crossbar_l526_2;
  wire                when_Axi4Crossbar_l528_2;
  reg        [1:0]    _zz_when_Axi4Crossbar_l464_13;
  reg        [3:0]    _zz_when_Axi4Crossbar_l464_14;
  reg        [3:0]    _zz_when_Axi4Crossbar_l464_15;
  reg        [1:0]    _zz_when_Axi4Crossbar_l167_15;
  wire       [1:0]    _zz_when_Axi4Crossbar_l167_16;
  wire       [1:0]    _zz_when_Axi4Crossbar_l167_17;
  wire       [1:0]    _zz_when_Axi4Crossbar_l167_18;
  wire       [1:0]    _zz_when_Axi4Crossbar_l167_19;
  reg        [0:0]    _zz_m3_axi_awid;
  wire                when_Axi4Crossbar_l167_6;
  wire                when_Axi4Crossbar_l167_7;
  wire                when_Axi4Crossbar_l473_3;
  wire       [0:0]    _zz_when_Axi4Crossbar_l496_7;
  wire                when_Axi4Crossbar_l464_3;
  wire                when_Axi4Crossbar_l467_6;
  wire                when_Axi4Crossbar_l467_7;
  wire                io_slaves_3_aw_fire;
  wire                when_Axi4Crossbar_l494_3;
  wire                when_Axi4Crossbar_l496_6;
  wire                when_Axi4Crossbar_l496_7;
  wire                when_Axi4Crossbar_l511_3;
  wire                io_slaves_3_w_fire;
  wire                when_Axi4Crossbar_l517_3;
  wire                when_Axi4Crossbar_l519_3;
  wire                io_slaves_3_b_fire;
  wire                when_Axi4Crossbar_l526_3;
  wire                when_Axi4Crossbar_l528_3;
  reg        [3:0]    _zz_when_Axi4Crossbar_l548;
  wire       [3:0]    _zz_when_Axi4Crossbar_l548_1;
  wire       [3:0]    _zz_when_Axi4Crossbar_l548_2;
  wire                when_Axi4Crossbar_l548;
  wire                when_Axi4Crossbar_l548_1;
  wire                when_Axi4Crossbar_l548_2;
  wire                when_Axi4Crossbar_l548_3;
  reg        [3:0]    _zz_when_Axi4Crossbar_l548_3;
  wire       [3:0]    _zz_when_Axi4Crossbar_l548_4;
  wire       [3:0]    _zz_when_Axi4Crossbar_l548_5;
  wire                when_Axi4Crossbar_l548_4;
  wire                when_Axi4Crossbar_l548_5;
  wire                when_Axi4Crossbar_l548_6;
  wire                when_Axi4Crossbar_l548_7;
  reg        [1:0]    _zz_when_Axi4Crossbar_l579_4;
  reg        [3:0]    _zz_when_Axi4Crossbar_l579_5;
  reg        [3:0]    _zz_when_Axi4Crossbar_l579_6;
  reg        [1:0]    _zz_when_Axi4Crossbar_l167_20;
  wire       [1:0]    _zz_when_Axi4Crossbar_l167_21;
  wire       [1:0]    _zz_when_Axi4Crossbar_l167_22;
  wire       [1:0]    _zz_when_Axi4Crossbar_l167_23;
  wire       [1:0]    _zz_when_Axi4Crossbar_l167_24;
  reg        [0:0]    _zz_m0_axi_arid;
  wire                when_Axi4Crossbar_l167_8;
  wire                when_Axi4Crossbar_l167_9;
  wire                when_Axi4Crossbar_l579;
  wire                when_Axi4Crossbar_l582;
  wire                when_Axi4Crossbar_l582_1;
  wire                io_slaves_0_ar_fire;
  wire                _zz_when_Axi4Crossbar_l600;
  wire                io_slaves_0_r_fire;
  wire                when_Axi4Crossbar_l600;
  wire                when_Axi4Crossbar_l602;
  reg        [1:0]    _zz_when_Axi4Crossbar_l579_7;
  reg        [3:0]    _zz_when_Axi4Crossbar_l579_8;
  reg        [3:0]    _zz_when_Axi4Crossbar_l579_9;
  reg        [1:0]    _zz_when_Axi4Crossbar_l167_25;
  wire       [1:0]    _zz_when_Axi4Crossbar_l167_26;
  wire       [1:0]    _zz_when_Axi4Crossbar_l167_27;
  wire       [1:0]    _zz_when_Axi4Crossbar_l167_28;
  wire       [1:0]    _zz_when_Axi4Crossbar_l167_29;
  reg        [0:0]    _zz_m1_axi_arid;
  wire                when_Axi4Crossbar_l167_10;
  wire                when_Axi4Crossbar_l167_11;
  wire                when_Axi4Crossbar_l579_1;
  wire                when_Axi4Crossbar_l582_2;
  wire                when_Axi4Crossbar_l582_3;
  wire                io_slaves_1_ar_fire;
  wire                _zz_when_Axi4Crossbar_l600_1;
  wire                io_slaves_1_r_fire;
  wire                when_Axi4Crossbar_l600_1;
  wire                when_Axi4Crossbar_l602_1;
  reg        [1:0]    _zz_when_Axi4Crossbar_l579_10;
  reg        [3:0]    _zz_when_Axi4Crossbar_l579_11;
  reg        [3:0]    _zz_when_Axi4Crossbar_l579_12;
  reg        [1:0]    _zz_when_Axi4Crossbar_l167_30;
  wire       [1:0]    _zz_when_Axi4Crossbar_l167_31;
  wire       [1:0]    _zz_when_Axi4Crossbar_l167_32;
  wire       [1:0]    _zz_when_Axi4Crossbar_l167_33;
  wire       [1:0]    _zz_when_Axi4Crossbar_l167_34;
  reg        [0:0]    _zz_m2_axi_arid;
  wire                when_Axi4Crossbar_l167_12;
  wire                when_Axi4Crossbar_l167_13;
  wire                when_Axi4Crossbar_l579_2;
  wire                when_Axi4Crossbar_l582_4;
  wire                when_Axi4Crossbar_l582_5;
  wire                io_slaves_2_ar_fire;
  wire                _zz_when_Axi4Crossbar_l600_2;
  wire                io_slaves_2_r_fire;
  wire                when_Axi4Crossbar_l600_2;
  wire                when_Axi4Crossbar_l602_2;
  reg        [1:0]    _zz_when_Axi4Crossbar_l579_13;
  reg        [3:0]    _zz_when_Axi4Crossbar_l579_14;
  reg        [3:0]    _zz_when_Axi4Crossbar_l579_15;
  reg        [1:0]    _zz_when_Axi4Crossbar_l167_35;
  wire       [1:0]    _zz_when_Axi4Crossbar_l167_36;
  wire       [1:0]    _zz_when_Axi4Crossbar_l167_37;
  wire       [1:0]    _zz_when_Axi4Crossbar_l167_38;
  wire       [1:0]    _zz_when_Axi4Crossbar_l167_39;
  reg        [0:0]    _zz_m3_axi_arid;
  wire                when_Axi4Crossbar_l167_14;
  wire                when_Axi4Crossbar_l167_15;
  wire                when_Axi4Crossbar_l579_3;
  wire                when_Axi4Crossbar_l582_6;
  wire                when_Axi4Crossbar_l582_7;
  wire                io_slaves_3_ar_fire;
  wire                _zz_when_Axi4Crossbar_l600_3;
  wire                io_slaves_3_r_fire;
  wire                when_Axi4Crossbar_l600_3;
  wire                when_Axi4Crossbar_l602_3;
  reg        [3:0]    _zz_when_Axi4Crossbar_l620;
  wire       [3:0]    _zz_when_Axi4Crossbar_l620_1;
  wire       [3:0]    _zz_when_Axi4Crossbar_l620_2;
  wire                when_Axi4Crossbar_l620;
  wire                when_Axi4Crossbar_l620_1;
  wire                when_Axi4Crossbar_l620_2;
  wire                when_Axi4Crossbar_l620_3;
  reg        [3:0]    _zz_when_Axi4Crossbar_l620_3;
  wire       [3:0]    _zz_when_Axi4Crossbar_l620_4;
  wire       [3:0]    _zz_when_Axi4Crossbar_l620_5;
  wire                when_Axi4Crossbar_l620_4;
  wire                when_Axi4Crossbar_l620_5;
  wire                when_Axi4Crossbar_l620_6;
  wire                when_Axi4Crossbar_l620_7;
  (* ram_style = "distributed" *) reg [0:0] _zz_5 [0:3];
  (* ram_style = "distributed" *) reg [0:0] _zz_6 [0:3];
  (* ram_style = "distributed" *) reg [0:0] _zz_7 [0:3];
  (* ram_style = "distributed" *) reg [0:0] _zz_8 [0:3];

  assign _zz__zz_when_Axi4Crossbar_l167_4 = (_zz_when_Axi4Crossbar_l167_2 - 2'b01);
  assign _zz__zz_when_Axi4Crossbar_l167_4_1 = (_zz_when_Axi4Crossbar_l167_3 - 2'b01);
  assign _zz__zz_9 = (_zz_9 + 2'b01);
  assign _zz__zz_when_Axi4Crossbar_l496 = (_zz_when_Axi4Crossbar_l496 + 2'b01);
  assign _zz__zz_when_Axi4Crossbar_l167_9 = (_zz_when_Axi4Crossbar_l167_7 - 2'b01);
  assign _zz__zz_when_Axi4Crossbar_l167_9_1 = (_zz_when_Axi4Crossbar_l167_8 - 2'b01);
  assign _zz__zz_10 = (_zz_10 + 2'b01);
  assign _zz__zz_when_Axi4Crossbar_l496_1 = (_zz_when_Axi4Crossbar_l496_1 + 2'b01);
  assign _zz__zz_when_Axi4Crossbar_l167_14 = (_zz_when_Axi4Crossbar_l167_12 - 2'b01);
  assign _zz__zz_when_Axi4Crossbar_l167_14_1 = (_zz_when_Axi4Crossbar_l167_13 - 2'b01);
  assign _zz__zz_11 = (_zz_11 + 2'b01);
  assign _zz__zz_when_Axi4Crossbar_l496_2 = (_zz_when_Axi4Crossbar_l496_2 + 2'b01);
  assign _zz__zz_when_Axi4Crossbar_l167_19 = (_zz_when_Axi4Crossbar_l167_17 - 2'b01);
  assign _zz__zz_when_Axi4Crossbar_l167_19_1 = (_zz_when_Axi4Crossbar_l167_18 - 2'b01);
  assign _zz__zz_12 = (_zz_12 + 2'b01);
  assign _zz__zz_when_Axi4Crossbar_l496_3 = (_zz_when_Axi4Crossbar_l496_3 + 2'b01);
  assign _zz__zz_when_Axi4Crossbar_l548 = (m0_axi_bid >>> 1'd1);
  assign _zz__zz_when_Axi4Crossbar_l548_1 = (m1_axi_bid >>> 1'd1);
  assign _zz__zz_when_Axi4Crossbar_l548_2 = (m2_axi_bid >>> 1'd1);
  assign _zz__zz_when_Axi4Crossbar_l548_3 = (m3_axi_bid >>> 1'd1);
  assign _zz__zz_when_Axi4Crossbar_l548_2_1 = (_zz_when_Axi4Crossbar_l548_1 - 4'b0001);
  assign _zz__zz_when_Axi4Crossbar_l548_3_1 = (m0_axi_bid >>> 1'd1);
  assign _zz__zz_when_Axi4Crossbar_l548_3_2 = (m1_axi_bid >>> 1'd1);
  assign _zz__zz_when_Axi4Crossbar_l548_3_3 = (m2_axi_bid >>> 1'd1);
  assign _zz__zz_when_Axi4Crossbar_l548_3_4 = (m3_axi_bid >>> 1'd1);
  assign _zz__zz_when_Axi4Crossbar_l548_5 = (_zz_when_Axi4Crossbar_l548_4 - 4'b0001);
  assign _zz__zz_when_Axi4Crossbar_l167_24 = (_zz_when_Axi4Crossbar_l167_22 - 2'b01);
  assign _zz__zz_when_Axi4Crossbar_l167_24_1 = (_zz_when_Axi4Crossbar_l167_23 - 2'b01);
  assign _zz__zz_when_Axi4Crossbar_l167_29 = (_zz_when_Axi4Crossbar_l167_27 - 2'b01);
  assign _zz__zz_when_Axi4Crossbar_l167_29_1 = (_zz_when_Axi4Crossbar_l167_28 - 2'b01);
  assign _zz__zz_when_Axi4Crossbar_l167_34 = (_zz_when_Axi4Crossbar_l167_32 - 2'b01);
  assign _zz__zz_when_Axi4Crossbar_l167_34_1 = (_zz_when_Axi4Crossbar_l167_33 - 2'b01);
  assign _zz__zz_when_Axi4Crossbar_l167_39 = (_zz_when_Axi4Crossbar_l167_37 - 2'b01);
  assign _zz__zz_when_Axi4Crossbar_l167_39_1 = (_zz_when_Axi4Crossbar_l167_38 - 2'b01);
  assign _zz__zz_when_Axi4Crossbar_l620 = (m0_axi_rid >>> 1'd1);
  assign _zz__zz_when_Axi4Crossbar_l620_1 = (m1_axi_rid >>> 1'd1);
  assign _zz__zz_when_Axi4Crossbar_l620_2 = (m2_axi_rid >>> 1'd1);
  assign _zz__zz_when_Axi4Crossbar_l620_3 = (m3_axi_rid >>> 1'd1);
  assign _zz__zz_when_Axi4Crossbar_l620_2_1 = (_zz_when_Axi4Crossbar_l620_1 - 4'b0001);
  assign _zz__zz_when_Axi4Crossbar_l620_3_1 = (m0_axi_rid >>> 1'd1);
  assign _zz__zz_when_Axi4Crossbar_l620_3_2 = (m1_axi_rid >>> 1'd1);
  assign _zz__zz_when_Axi4Crossbar_l620_3_3 = (m2_axi_rid >>> 1'd1);
  assign _zz__zz_when_Axi4Crossbar_l620_3_4 = (m3_axi_rid >>> 1'd1);
  assign _zz__zz_when_Axi4Crossbar_l620_5 = (_zz_when_Axi4Crossbar_l620_4 - 4'b0001);
  assign _zz__zz_5_port = _zz_m0_axi_awid;
  assign _zz__zz_6_port = _zz_m1_axi_awid;
  assign _zz__zz_7_port = _zz_m2_axi_awid;
  assign _zz__zz_8_port = _zz_m3_axi_awid;
  assign _zz__zz_5_port0 = _zz_5[_zz_when_Axi4Crossbar_l496];
  always @(posedge aclk) begin
    if(_zz_4) begin
      _zz_5[_zz_9] <= _zz__zz_5_port;
    end
  end

  assign _zz__zz_6_port0 = _zz_6[_zz_when_Axi4Crossbar_l496_1];
  always @(posedge aclk) begin
    if(_zz_3) begin
      _zz_6[_zz_10] <= _zz__zz_6_port;
    end
  end

  assign _zz__zz_7_port0 = _zz_7[_zz_when_Axi4Crossbar_l496_2];
  always @(posedge aclk) begin
    if(_zz_2) begin
      _zz_7[_zz_11] <= _zz__zz_7_port;
    end
  end

  assign _zz__zz_8_port0 = _zz_8[_zz_when_Axi4Crossbar_l496_3];
  always @(posedge aclk) begin
    if(_zz_1) begin
      _zz_8[_zz_12] <= _zz__zz_8_port;
    end
  end

  always @(*) begin
    _zz_1 = 1'b0;
    if(io_slaves_3_aw_fire) begin
      _zz_1 = 1'b1;
    end
  end

  always @(*) begin
    _zz_2 = 1'b0;
    if(io_slaves_2_aw_fire) begin
      _zz_2 = 1'b1;
    end
  end

  always @(*) begin
    _zz_3 = 1'b0;
    if(io_slaves_1_aw_fire) begin
      _zz_3 = 1'b1;
    end
  end

  always @(*) begin
    _zz_4 = 1'b0;
    if(io_slaves_0_aw_fire) begin
      _zz_4 = 1'b1;
    end
  end

  always @(*) begin
    s0_axi_awready = 1'b0;
    if(when_Axi4Crossbar_l464) begin
      if(when_Axi4Crossbar_l467) begin
        s0_axi_awready = m0_axi_awready;
      end
    end
    if(when_Axi4Crossbar_l464_1) begin
      if(when_Axi4Crossbar_l467_2) begin
        s0_axi_awready = m1_axi_awready;
      end
    end
    if(when_Axi4Crossbar_l464_2) begin
      if(when_Axi4Crossbar_l467_4) begin
        s0_axi_awready = m2_axi_awready;
      end
    end
    if(when_Axi4Crossbar_l464_3) begin
      if(when_Axi4Crossbar_l467_6) begin
        s0_axi_awready = m3_axi_awready;
      end
    end
  end

  always @(*) begin
    s0_axi_wready = 1'b0;
    if(when_Axi4Crossbar_l464) begin
      if(when_Axi4Crossbar_l467) begin
        if(when_Axi4Crossbar_l473) begin
          s0_axi_wready = m0_axi_wready;
        end
      end
    end
    if(when_Axi4Crossbar_l494) begin
      if(when_Axi4Crossbar_l496) begin
        s0_axi_wready = m0_axi_wready;
      end
    end
    if(when_Axi4Crossbar_l464_1) begin
      if(when_Axi4Crossbar_l467_2) begin
        if(when_Axi4Crossbar_l473_1) begin
          s0_axi_wready = m1_axi_wready;
        end
      end
    end
    if(when_Axi4Crossbar_l494_1) begin
      if(when_Axi4Crossbar_l496_2) begin
        s0_axi_wready = m1_axi_wready;
      end
    end
    if(when_Axi4Crossbar_l464_2) begin
      if(when_Axi4Crossbar_l467_4) begin
        if(when_Axi4Crossbar_l473_2) begin
          s0_axi_wready = m2_axi_wready;
        end
      end
    end
    if(when_Axi4Crossbar_l494_2) begin
      if(when_Axi4Crossbar_l496_4) begin
        s0_axi_wready = m2_axi_wready;
      end
    end
    if(when_Axi4Crossbar_l464_3) begin
      if(when_Axi4Crossbar_l467_6) begin
        if(when_Axi4Crossbar_l473_3) begin
          s0_axi_wready = m3_axi_wready;
        end
      end
    end
    if(when_Axi4Crossbar_l494_3) begin
      if(when_Axi4Crossbar_l496_6) begin
        s0_axi_wready = m3_axi_wready;
      end
    end
  end

  always @(*) begin
    s0_axi_bvalid = 1'b0;
    if(when_Axi4Crossbar_l548) begin
      s0_axi_bvalid = 1'b1;
    end
    if(when_Axi4Crossbar_l548_1) begin
      s0_axi_bvalid = 1'b1;
    end
    if(when_Axi4Crossbar_l548_2) begin
      s0_axi_bvalid = 1'b1;
    end
    if(when_Axi4Crossbar_l548_3) begin
      s0_axi_bvalid = 1'b1;
    end
  end

  assign _zz_s0_axi_bid = 3'b000;
  always @(*) begin
    s0_axi_bid = _zz_s0_axi_bid[0 : 0];
    if(when_Axi4Crossbar_l548) begin
      s0_axi_bid = m0_axi_bid[0 : 0];
    end
    if(when_Axi4Crossbar_l548_1) begin
      s0_axi_bid = m1_axi_bid[0 : 0];
    end
    if(when_Axi4Crossbar_l548_2) begin
      s0_axi_bid = m2_axi_bid[0 : 0];
    end
    if(when_Axi4Crossbar_l548_3) begin
      s0_axi_bid = m3_axi_bid[0 : 0];
    end
  end

  always @(*) begin
    s0_axi_bresp = _zz_s0_axi_bid[2 : 1];
    if(when_Axi4Crossbar_l548) begin
      s0_axi_bresp = m0_axi_bresp;
    end
    if(when_Axi4Crossbar_l548_1) begin
      s0_axi_bresp = m1_axi_bresp;
    end
    if(when_Axi4Crossbar_l548_2) begin
      s0_axi_bresp = m2_axi_bresp;
    end
    if(when_Axi4Crossbar_l548_3) begin
      s0_axi_bresp = m3_axi_bresp;
    end
  end

  always @(*) begin
    s0_axi_arready = 1'b0;
    if(when_Axi4Crossbar_l579) begin
      if(when_Axi4Crossbar_l582) begin
        s0_axi_arready = m0_axi_arready;
      end
    end
    if(when_Axi4Crossbar_l579_1) begin
      if(when_Axi4Crossbar_l582_2) begin
        s0_axi_arready = m1_axi_arready;
      end
    end
    if(when_Axi4Crossbar_l579_2) begin
      if(when_Axi4Crossbar_l582_4) begin
        s0_axi_arready = m2_axi_arready;
      end
    end
    if(when_Axi4Crossbar_l579_3) begin
      if(when_Axi4Crossbar_l582_6) begin
        s0_axi_arready = m3_axi_arready;
      end
    end
  end

  always @(*) begin
    s0_axi_rvalid = 1'b0;
    if(when_Axi4Crossbar_l620) begin
      s0_axi_rvalid = 1'b1;
    end
    if(when_Axi4Crossbar_l620_1) begin
      s0_axi_rvalid = 1'b1;
    end
    if(when_Axi4Crossbar_l620_2) begin
      s0_axi_rvalid = 1'b1;
    end
    if(when_Axi4Crossbar_l620_3) begin
      s0_axi_rvalid = 1'b1;
    end
  end

  assign _zz_s0_axi_rdata = 36'h000000000;
  always @(*) begin
    s0_axi_rdata = _zz_s0_axi_rdata[31 : 0];
    if(when_Axi4Crossbar_l620) begin
      s0_axi_rdata = m0_axi_rdata;
    end
    if(when_Axi4Crossbar_l620_1) begin
      s0_axi_rdata = m1_axi_rdata;
    end
    if(when_Axi4Crossbar_l620_2) begin
      s0_axi_rdata = m2_axi_rdata;
    end
    if(when_Axi4Crossbar_l620_3) begin
      s0_axi_rdata = m3_axi_rdata;
    end
  end

  always @(*) begin
    s0_axi_rid = _zz_s0_axi_rdata[32 : 32];
    if(when_Axi4Crossbar_l620) begin
      s0_axi_rid = m0_axi_rid[0 : 0];
    end
    if(when_Axi4Crossbar_l620_1) begin
      s0_axi_rid = m1_axi_rid[0 : 0];
    end
    if(when_Axi4Crossbar_l620_2) begin
      s0_axi_rid = m2_axi_rid[0 : 0];
    end
    if(when_Axi4Crossbar_l620_3) begin
      s0_axi_rid = m3_axi_rid[0 : 0];
    end
  end

  always @(*) begin
    s0_axi_rresp = _zz_s0_axi_rdata[34 : 33];
    if(when_Axi4Crossbar_l620) begin
      s0_axi_rresp = m0_axi_rresp;
    end
    if(when_Axi4Crossbar_l620_1) begin
      s0_axi_rresp = m1_axi_rresp;
    end
    if(when_Axi4Crossbar_l620_2) begin
      s0_axi_rresp = m2_axi_rresp;
    end
    if(when_Axi4Crossbar_l620_3) begin
      s0_axi_rresp = m3_axi_rresp;
    end
  end

  always @(*) begin
    s0_axi_rlast = _zz_s0_axi_rdata[35];
    if(when_Axi4Crossbar_l620) begin
      s0_axi_rlast = m0_axi_rlast;
    end
    if(when_Axi4Crossbar_l620_1) begin
      s0_axi_rlast = m1_axi_rlast;
    end
    if(when_Axi4Crossbar_l620_2) begin
      s0_axi_rlast = m2_axi_rlast;
    end
    if(when_Axi4Crossbar_l620_3) begin
      s0_axi_rlast = m3_axi_rlast;
    end
  end

  always @(*) begin
    s1_axi_awready = 1'b0;
    if(when_Axi4Crossbar_l464) begin
      if(when_Axi4Crossbar_l467_1) begin
        s1_axi_awready = m0_axi_awready;
      end
    end
    if(when_Axi4Crossbar_l464_1) begin
      if(when_Axi4Crossbar_l467_3) begin
        s1_axi_awready = m1_axi_awready;
      end
    end
    if(when_Axi4Crossbar_l464_2) begin
      if(when_Axi4Crossbar_l467_5) begin
        s1_axi_awready = m2_axi_awready;
      end
    end
    if(when_Axi4Crossbar_l464_3) begin
      if(when_Axi4Crossbar_l467_7) begin
        s1_axi_awready = m3_axi_awready;
      end
    end
  end

  always @(*) begin
    s1_axi_wready = 1'b0;
    if(when_Axi4Crossbar_l464) begin
      if(when_Axi4Crossbar_l467_1) begin
        if(when_Axi4Crossbar_l473) begin
          s1_axi_wready = m0_axi_wready;
        end
      end
    end
    if(when_Axi4Crossbar_l494) begin
      if(when_Axi4Crossbar_l496_1) begin
        s1_axi_wready = m0_axi_wready;
      end
    end
    if(when_Axi4Crossbar_l464_1) begin
      if(when_Axi4Crossbar_l467_3) begin
        if(when_Axi4Crossbar_l473_1) begin
          s1_axi_wready = m1_axi_wready;
        end
      end
    end
    if(when_Axi4Crossbar_l494_1) begin
      if(when_Axi4Crossbar_l496_3) begin
        s1_axi_wready = m1_axi_wready;
      end
    end
    if(when_Axi4Crossbar_l464_2) begin
      if(when_Axi4Crossbar_l467_5) begin
        if(when_Axi4Crossbar_l473_2) begin
          s1_axi_wready = m2_axi_wready;
        end
      end
    end
    if(when_Axi4Crossbar_l494_2) begin
      if(when_Axi4Crossbar_l496_5) begin
        s1_axi_wready = m2_axi_wready;
      end
    end
    if(when_Axi4Crossbar_l464_3) begin
      if(when_Axi4Crossbar_l467_7) begin
        if(when_Axi4Crossbar_l473_3) begin
          s1_axi_wready = m3_axi_wready;
        end
      end
    end
    if(when_Axi4Crossbar_l494_3) begin
      if(when_Axi4Crossbar_l496_7) begin
        s1_axi_wready = m3_axi_wready;
      end
    end
  end

  always @(*) begin
    s1_axi_bvalid = 1'b0;
    if(when_Axi4Crossbar_l548_4) begin
      s1_axi_bvalid = 1'b1;
    end
    if(when_Axi4Crossbar_l548_5) begin
      s1_axi_bvalid = 1'b1;
    end
    if(when_Axi4Crossbar_l548_6) begin
      s1_axi_bvalid = 1'b1;
    end
    if(when_Axi4Crossbar_l548_7) begin
      s1_axi_bvalid = 1'b1;
    end
  end

  assign _zz_s1_axi_bid = 3'b000;
  always @(*) begin
    s1_axi_bid = _zz_s1_axi_bid[0 : 0];
    if(when_Axi4Crossbar_l548_4) begin
      s1_axi_bid = m0_axi_bid[0 : 0];
    end
    if(when_Axi4Crossbar_l548_5) begin
      s1_axi_bid = m1_axi_bid[0 : 0];
    end
    if(when_Axi4Crossbar_l548_6) begin
      s1_axi_bid = m2_axi_bid[0 : 0];
    end
    if(when_Axi4Crossbar_l548_7) begin
      s1_axi_bid = m3_axi_bid[0 : 0];
    end
  end

  always @(*) begin
    s1_axi_bresp = _zz_s1_axi_bid[2 : 1];
    if(when_Axi4Crossbar_l548_4) begin
      s1_axi_bresp = m0_axi_bresp;
    end
    if(when_Axi4Crossbar_l548_5) begin
      s1_axi_bresp = m1_axi_bresp;
    end
    if(when_Axi4Crossbar_l548_6) begin
      s1_axi_bresp = m2_axi_bresp;
    end
    if(when_Axi4Crossbar_l548_7) begin
      s1_axi_bresp = m3_axi_bresp;
    end
  end

  always @(*) begin
    s1_axi_arready = 1'b0;
    if(when_Axi4Crossbar_l579) begin
      if(when_Axi4Crossbar_l582_1) begin
        s1_axi_arready = m0_axi_arready;
      end
    end
    if(when_Axi4Crossbar_l579_1) begin
      if(when_Axi4Crossbar_l582_3) begin
        s1_axi_arready = m1_axi_arready;
      end
    end
    if(when_Axi4Crossbar_l579_2) begin
      if(when_Axi4Crossbar_l582_5) begin
        s1_axi_arready = m2_axi_arready;
      end
    end
    if(when_Axi4Crossbar_l579_3) begin
      if(when_Axi4Crossbar_l582_7) begin
        s1_axi_arready = m3_axi_arready;
      end
    end
  end

  always @(*) begin
    s1_axi_rvalid = 1'b0;
    if(when_Axi4Crossbar_l620_4) begin
      s1_axi_rvalid = 1'b1;
    end
    if(when_Axi4Crossbar_l620_5) begin
      s1_axi_rvalid = 1'b1;
    end
    if(when_Axi4Crossbar_l620_6) begin
      s1_axi_rvalid = 1'b1;
    end
    if(when_Axi4Crossbar_l620_7) begin
      s1_axi_rvalid = 1'b1;
    end
  end

  assign _zz_s1_axi_rdata = 36'h000000000;
  always @(*) begin
    s1_axi_rdata = _zz_s1_axi_rdata[31 : 0];
    if(when_Axi4Crossbar_l620_4) begin
      s1_axi_rdata = m0_axi_rdata;
    end
    if(when_Axi4Crossbar_l620_5) begin
      s1_axi_rdata = m1_axi_rdata;
    end
    if(when_Axi4Crossbar_l620_6) begin
      s1_axi_rdata = m2_axi_rdata;
    end
    if(when_Axi4Crossbar_l620_7) begin
      s1_axi_rdata = m3_axi_rdata;
    end
  end

  always @(*) begin
    s1_axi_rid = _zz_s1_axi_rdata[32 : 32];
    if(when_Axi4Crossbar_l620_4) begin
      s1_axi_rid = m0_axi_rid[0 : 0];
    end
    if(when_Axi4Crossbar_l620_5) begin
      s1_axi_rid = m1_axi_rid[0 : 0];
    end
    if(when_Axi4Crossbar_l620_6) begin
      s1_axi_rid = m2_axi_rid[0 : 0];
    end
    if(when_Axi4Crossbar_l620_7) begin
      s1_axi_rid = m3_axi_rid[0 : 0];
    end
  end

  always @(*) begin
    s1_axi_rresp = _zz_s1_axi_rdata[34 : 33];
    if(when_Axi4Crossbar_l620_4) begin
      s1_axi_rresp = m0_axi_rresp;
    end
    if(when_Axi4Crossbar_l620_5) begin
      s1_axi_rresp = m1_axi_rresp;
    end
    if(when_Axi4Crossbar_l620_6) begin
      s1_axi_rresp = m2_axi_rresp;
    end
    if(when_Axi4Crossbar_l620_7) begin
      s1_axi_rresp = m3_axi_rresp;
    end
  end

  always @(*) begin
    s1_axi_rlast = _zz_s1_axi_rdata[35];
    if(when_Axi4Crossbar_l620_4) begin
      s1_axi_rlast = m0_axi_rlast;
    end
    if(when_Axi4Crossbar_l620_5) begin
      s1_axi_rlast = m1_axi_rlast;
    end
    if(when_Axi4Crossbar_l620_6) begin
      s1_axi_rlast = m2_axi_rlast;
    end
    if(when_Axi4Crossbar_l620_7) begin
      s1_axi_rlast = m3_axi_rlast;
    end
  end

  always @(*) begin
    m0_axi_awvalid = 1'b0;
    if(when_Axi4Crossbar_l464) begin
      m0_axi_awvalid = 1'b1;
    end
  end

  assign _zz_m0_axi_awaddr = 63'h0000000000000000;
  always @(*) begin
    m0_axi_awaddr = _zz_m0_axi_awaddr[31 : 0];
    if(when_Axi4Crossbar_l464) begin
      if(when_Axi4Crossbar_l467) begin
        m0_axi_awaddr = s0_axi_awaddr;
      end
      if(when_Axi4Crossbar_l467_1) begin
        m0_axi_awaddr = s1_axi_awaddr;
      end
    end
  end

  always @(*) begin
    m0_axi_awid = _zz_m0_axi_awaddr[33 : 32];
    if(when_Axi4Crossbar_l464) begin
      if(when_Axi4Crossbar_l467) begin
        m0_axi_awid = {_zz_m0_axi_awid,s0_axi_awid};
      end
      if(when_Axi4Crossbar_l467_1) begin
        m0_axi_awid = {_zz_m0_axi_awid,s1_axi_awid};
      end
    end
  end

  assign m0_axi_awregion = _zz_m0_axi_awaddr[37 : 34];
  always @(*) begin
    m0_axi_awlen = _zz_m0_axi_awaddr[45 : 38];
    if(when_Axi4Crossbar_l464) begin
      if(when_Axi4Crossbar_l467) begin
        m0_axi_awlen = s0_axi_awlen;
      end
      if(when_Axi4Crossbar_l467_1) begin
        m0_axi_awlen = s1_axi_awlen;
      end
    end
  end

  always @(*) begin
    m0_axi_awsize = _zz_m0_axi_awaddr[48 : 46];
    if(when_Axi4Crossbar_l464) begin
      if(when_Axi4Crossbar_l467) begin
        m0_axi_awsize = s0_axi_awsize;
      end
      if(when_Axi4Crossbar_l467_1) begin
        m0_axi_awsize = s1_axi_awsize;
      end
    end
  end

  always @(*) begin
    m0_axi_awburst = _zz_m0_axi_awaddr[50 : 49];
    if(when_Axi4Crossbar_l464) begin
      if(when_Axi4Crossbar_l467) begin
        m0_axi_awburst = s0_axi_awburst;
      end
      if(when_Axi4Crossbar_l467_1) begin
        m0_axi_awburst = s1_axi_awburst;
      end
    end
  end

  always @(*) begin
    m0_axi_awlock = _zz_m0_axi_awaddr[51 : 51];
    if(when_Axi4Crossbar_l464) begin
      if(when_Axi4Crossbar_l467) begin
        m0_axi_awlock = s0_axi_awlock;
      end
      if(when_Axi4Crossbar_l467_1) begin
        m0_axi_awlock = s1_axi_awlock;
      end
    end
  end

  always @(*) begin
    m0_axi_awcache = _zz_m0_axi_awaddr[55 : 52];
    if(when_Axi4Crossbar_l464) begin
      if(when_Axi4Crossbar_l467) begin
        m0_axi_awcache = s0_axi_awcache;
      end
      if(when_Axi4Crossbar_l467_1) begin
        m0_axi_awcache = s1_axi_awcache;
      end
    end
  end

  always @(*) begin
    m0_axi_awqos = _zz_m0_axi_awaddr[59 : 56];
    if(when_Axi4Crossbar_l464) begin
      if(when_Axi4Crossbar_l467) begin
        m0_axi_awqos = s0_axi_awqos;
      end
      if(when_Axi4Crossbar_l467_1) begin
        m0_axi_awqos = s1_axi_awqos;
      end
    end
  end

  always @(*) begin
    m0_axi_awprot = _zz_m0_axi_awaddr[62 : 60];
    if(when_Axi4Crossbar_l464) begin
      if(when_Axi4Crossbar_l467) begin
        m0_axi_awprot = s0_axi_awprot;
      end
      if(when_Axi4Crossbar_l467_1) begin
        m0_axi_awprot = s1_axi_awprot;
      end
    end
  end

  always @(*) begin
    m0_axi_wvalid = 1'b0;
    if(when_Axi4Crossbar_l464) begin
      if(when_Axi4Crossbar_l467) begin
        if(when_Axi4Crossbar_l473) begin
          m0_axi_wvalid = s0_axi_wvalid;
        end
      end
      if(when_Axi4Crossbar_l467_1) begin
        if(when_Axi4Crossbar_l473) begin
          m0_axi_wvalid = s1_axi_wvalid;
        end
      end
    end
    if(when_Axi4Crossbar_l494) begin
      if(when_Axi4Crossbar_l496) begin
        m0_axi_wvalid = s0_axi_wvalid;
      end
      if(when_Axi4Crossbar_l496_1) begin
        m0_axi_wvalid = s1_axi_wvalid;
      end
    end
  end

  assign _zz_m0_axi_wdata = 37'h0000000000;
  always @(*) begin
    m0_axi_wdata = _zz_m0_axi_wdata[31 : 0];
    if(when_Axi4Crossbar_l464) begin
      if(when_Axi4Crossbar_l467) begin
        if(when_Axi4Crossbar_l473) begin
          m0_axi_wdata = s0_axi_wdata;
        end
      end
      if(when_Axi4Crossbar_l467_1) begin
        if(when_Axi4Crossbar_l473) begin
          m0_axi_wdata = s1_axi_wdata;
        end
      end
    end
    if(when_Axi4Crossbar_l494) begin
      if(when_Axi4Crossbar_l496) begin
        m0_axi_wdata = s0_axi_wdata;
      end
      if(when_Axi4Crossbar_l496_1) begin
        m0_axi_wdata = s1_axi_wdata;
      end
    end
  end

  always @(*) begin
    m0_axi_wstrb = _zz_m0_axi_wdata[35 : 32];
    if(when_Axi4Crossbar_l464) begin
      if(when_Axi4Crossbar_l467) begin
        if(when_Axi4Crossbar_l473) begin
          m0_axi_wstrb = s0_axi_wstrb;
        end
      end
      if(when_Axi4Crossbar_l467_1) begin
        if(when_Axi4Crossbar_l473) begin
          m0_axi_wstrb = s1_axi_wstrb;
        end
      end
    end
    if(when_Axi4Crossbar_l494) begin
      if(when_Axi4Crossbar_l496) begin
        m0_axi_wstrb = s0_axi_wstrb;
      end
      if(when_Axi4Crossbar_l496_1) begin
        m0_axi_wstrb = s1_axi_wstrb;
      end
    end
  end

  always @(*) begin
    m0_axi_wlast = _zz_m0_axi_wdata[36];
    if(when_Axi4Crossbar_l464) begin
      if(when_Axi4Crossbar_l467) begin
        if(when_Axi4Crossbar_l473) begin
          m0_axi_wlast = s0_axi_wlast;
        end
      end
      if(when_Axi4Crossbar_l467_1) begin
        if(when_Axi4Crossbar_l473) begin
          m0_axi_wlast = s1_axi_wlast;
        end
      end
    end
    if(when_Axi4Crossbar_l494) begin
      if(when_Axi4Crossbar_l496) begin
        m0_axi_wlast = s0_axi_wlast;
      end
      if(when_Axi4Crossbar_l496_1) begin
        m0_axi_wlast = s1_axi_wlast;
      end
    end
  end

  always @(*) begin
    m0_axi_bready = 1'b0;
    if(when_Axi4Crossbar_l548) begin
      m0_axi_bready = s0_axi_bready;
    end
    if(when_Axi4Crossbar_l548_4) begin
      m0_axi_bready = s1_axi_bready;
    end
  end

  always @(*) begin
    m0_axi_arvalid = 1'b0;
    if(when_Axi4Crossbar_l579) begin
      m0_axi_arvalid = 1'b1;
    end
  end

  assign _zz_m0_axi_araddr = 63'h0000000000000000;
  always @(*) begin
    m0_axi_araddr = _zz_m0_axi_araddr[31 : 0];
    if(when_Axi4Crossbar_l579) begin
      if(when_Axi4Crossbar_l582) begin
        m0_axi_araddr = s0_axi_araddr;
      end
      if(when_Axi4Crossbar_l582_1) begin
        m0_axi_araddr = s1_axi_araddr;
      end
    end
  end

  always @(*) begin
    m0_axi_arid = _zz_m0_axi_araddr[33 : 32];
    if(when_Axi4Crossbar_l579) begin
      if(when_Axi4Crossbar_l582) begin
        m0_axi_arid = {_zz_m0_axi_arid,s0_axi_arid};
      end
      if(when_Axi4Crossbar_l582_1) begin
        m0_axi_arid = {_zz_m0_axi_arid,s1_axi_arid};
      end
    end
  end

  assign m0_axi_arregion = _zz_m0_axi_araddr[37 : 34];
  always @(*) begin
    m0_axi_arlen = _zz_m0_axi_araddr[45 : 38];
    if(when_Axi4Crossbar_l579) begin
      if(when_Axi4Crossbar_l582) begin
        m0_axi_arlen = s0_axi_arlen;
      end
      if(when_Axi4Crossbar_l582_1) begin
        m0_axi_arlen = s1_axi_arlen;
      end
    end
  end

  always @(*) begin
    m0_axi_arsize = _zz_m0_axi_araddr[48 : 46];
    if(when_Axi4Crossbar_l579) begin
      if(when_Axi4Crossbar_l582) begin
        m0_axi_arsize = s0_axi_arsize;
      end
      if(when_Axi4Crossbar_l582_1) begin
        m0_axi_arsize = s1_axi_arsize;
      end
    end
  end

  always @(*) begin
    m0_axi_arburst = _zz_m0_axi_araddr[50 : 49];
    if(when_Axi4Crossbar_l579) begin
      if(when_Axi4Crossbar_l582) begin
        m0_axi_arburst = s0_axi_arburst;
      end
      if(when_Axi4Crossbar_l582_1) begin
        m0_axi_arburst = s1_axi_arburst;
      end
    end
  end

  always @(*) begin
    m0_axi_arlock = _zz_m0_axi_araddr[51 : 51];
    if(when_Axi4Crossbar_l579) begin
      if(when_Axi4Crossbar_l582) begin
        m0_axi_arlock = s0_axi_arlock;
      end
      if(when_Axi4Crossbar_l582_1) begin
        m0_axi_arlock = s1_axi_arlock;
      end
    end
  end

  always @(*) begin
    m0_axi_arcache = _zz_m0_axi_araddr[55 : 52];
    if(when_Axi4Crossbar_l579) begin
      if(when_Axi4Crossbar_l582) begin
        m0_axi_arcache = s0_axi_arcache;
      end
      if(when_Axi4Crossbar_l582_1) begin
        m0_axi_arcache = s1_axi_arcache;
      end
    end
  end

  always @(*) begin
    m0_axi_arqos = _zz_m0_axi_araddr[59 : 56];
    if(when_Axi4Crossbar_l579) begin
      if(when_Axi4Crossbar_l582) begin
        m0_axi_arqos = s0_axi_arqos;
      end
      if(when_Axi4Crossbar_l582_1) begin
        m0_axi_arqos = s1_axi_arqos;
      end
    end
  end

  always @(*) begin
    m0_axi_arprot = _zz_m0_axi_araddr[62 : 60];
    if(when_Axi4Crossbar_l579) begin
      if(when_Axi4Crossbar_l582) begin
        m0_axi_arprot = s0_axi_arprot;
      end
      if(when_Axi4Crossbar_l582_1) begin
        m0_axi_arprot = s1_axi_arprot;
      end
    end
  end

  always @(*) begin
    m0_axi_rready = 1'b0;
    if(when_Axi4Crossbar_l620) begin
      m0_axi_rready = s0_axi_rready;
    end
    if(when_Axi4Crossbar_l620_4) begin
      m0_axi_rready = s1_axi_rready;
    end
  end

  always @(*) begin
    m1_axi_awvalid = 1'b0;
    if(when_Axi4Crossbar_l464_1) begin
      m1_axi_awvalid = 1'b1;
    end
  end

  assign _zz_m1_axi_awaddr = 63'h0000000000000000;
  always @(*) begin
    m1_axi_awaddr = _zz_m1_axi_awaddr[31 : 0];
    if(when_Axi4Crossbar_l464_1) begin
      if(when_Axi4Crossbar_l467_2) begin
        m1_axi_awaddr = s0_axi_awaddr;
      end
      if(when_Axi4Crossbar_l467_3) begin
        m1_axi_awaddr = s1_axi_awaddr;
      end
    end
  end

  always @(*) begin
    m1_axi_awid = _zz_m1_axi_awaddr[33 : 32];
    if(when_Axi4Crossbar_l464_1) begin
      if(when_Axi4Crossbar_l467_2) begin
        m1_axi_awid = {_zz_m1_axi_awid,s0_axi_awid};
      end
      if(when_Axi4Crossbar_l467_3) begin
        m1_axi_awid = {_zz_m1_axi_awid,s1_axi_awid};
      end
    end
  end

  assign m1_axi_awregion = _zz_m1_axi_awaddr[37 : 34];
  always @(*) begin
    m1_axi_awlen = _zz_m1_axi_awaddr[45 : 38];
    if(when_Axi4Crossbar_l464_1) begin
      if(when_Axi4Crossbar_l467_2) begin
        m1_axi_awlen = s0_axi_awlen;
      end
      if(when_Axi4Crossbar_l467_3) begin
        m1_axi_awlen = s1_axi_awlen;
      end
    end
  end

  always @(*) begin
    m1_axi_awsize = _zz_m1_axi_awaddr[48 : 46];
    if(when_Axi4Crossbar_l464_1) begin
      if(when_Axi4Crossbar_l467_2) begin
        m1_axi_awsize = s0_axi_awsize;
      end
      if(when_Axi4Crossbar_l467_3) begin
        m1_axi_awsize = s1_axi_awsize;
      end
    end
  end

  always @(*) begin
    m1_axi_awburst = _zz_m1_axi_awaddr[50 : 49];
    if(when_Axi4Crossbar_l464_1) begin
      if(when_Axi4Crossbar_l467_2) begin
        m1_axi_awburst = s0_axi_awburst;
      end
      if(when_Axi4Crossbar_l467_3) begin
        m1_axi_awburst = s1_axi_awburst;
      end
    end
  end

  always @(*) begin
    m1_axi_awlock = _zz_m1_axi_awaddr[51 : 51];
    if(when_Axi4Crossbar_l464_1) begin
      if(when_Axi4Crossbar_l467_2) begin
        m1_axi_awlock = s0_axi_awlock;
      end
      if(when_Axi4Crossbar_l467_3) begin
        m1_axi_awlock = s1_axi_awlock;
      end
    end
  end

  always @(*) begin
    m1_axi_awcache = _zz_m1_axi_awaddr[55 : 52];
    if(when_Axi4Crossbar_l464_1) begin
      if(when_Axi4Crossbar_l467_2) begin
        m1_axi_awcache = s0_axi_awcache;
      end
      if(when_Axi4Crossbar_l467_3) begin
        m1_axi_awcache = s1_axi_awcache;
      end
    end
  end

  always @(*) begin
    m1_axi_awqos = _zz_m1_axi_awaddr[59 : 56];
    if(when_Axi4Crossbar_l464_1) begin
      if(when_Axi4Crossbar_l467_2) begin
        m1_axi_awqos = s0_axi_awqos;
      end
      if(when_Axi4Crossbar_l467_3) begin
        m1_axi_awqos = s1_axi_awqos;
      end
    end
  end

  always @(*) begin
    m1_axi_awprot = _zz_m1_axi_awaddr[62 : 60];
    if(when_Axi4Crossbar_l464_1) begin
      if(when_Axi4Crossbar_l467_2) begin
        m1_axi_awprot = s0_axi_awprot;
      end
      if(when_Axi4Crossbar_l467_3) begin
        m1_axi_awprot = s1_axi_awprot;
      end
    end
  end

  always @(*) begin
    m1_axi_wvalid = 1'b0;
    if(when_Axi4Crossbar_l464_1) begin
      if(when_Axi4Crossbar_l467_2) begin
        if(when_Axi4Crossbar_l473_1) begin
          m1_axi_wvalid = s0_axi_wvalid;
        end
      end
      if(when_Axi4Crossbar_l467_3) begin
        if(when_Axi4Crossbar_l473_1) begin
          m1_axi_wvalid = s1_axi_wvalid;
        end
      end
    end
    if(when_Axi4Crossbar_l494_1) begin
      if(when_Axi4Crossbar_l496_2) begin
        m1_axi_wvalid = s0_axi_wvalid;
      end
      if(when_Axi4Crossbar_l496_3) begin
        m1_axi_wvalid = s1_axi_wvalid;
      end
    end
  end

  assign _zz_m1_axi_wdata = 37'h0000000000;
  always @(*) begin
    m1_axi_wdata = _zz_m1_axi_wdata[31 : 0];
    if(when_Axi4Crossbar_l464_1) begin
      if(when_Axi4Crossbar_l467_2) begin
        if(when_Axi4Crossbar_l473_1) begin
          m1_axi_wdata = s0_axi_wdata;
        end
      end
      if(when_Axi4Crossbar_l467_3) begin
        if(when_Axi4Crossbar_l473_1) begin
          m1_axi_wdata = s1_axi_wdata;
        end
      end
    end
    if(when_Axi4Crossbar_l494_1) begin
      if(when_Axi4Crossbar_l496_2) begin
        m1_axi_wdata = s0_axi_wdata;
      end
      if(when_Axi4Crossbar_l496_3) begin
        m1_axi_wdata = s1_axi_wdata;
      end
    end
  end

  always @(*) begin
    m1_axi_wstrb = _zz_m1_axi_wdata[35 : 32];
    if(when_Axi4Crossbar_l464_1) begin
      if(when_Axi4Crossbar_l467_2) begin
        if(when_Axi4Crossbar_l473_1) begin
          m1_axi_wstrb = s0_axi_wstrb;
        end
      end
      if(when_Axi4Crossbar_l467_3) begin
        if(when_Axi4Crossbar_l473_1) begin
          m1_axi_wstrb = s1_axi_wstrb;
        end
      end
    end
    if(when_Axi4Crossbar_l494_1) begin
      if(when_Axi4Crossbar_l496_2) begin
        m1_axi_wstrb = s0_axi_wstrb;
      end
      if(when_Axi4Crossbar_l496_3) begin
        m1_axi_wstrb = s1_axi_wstrb;
      end
    end
  end

  always @(*) begin
    m1_axi_wlast = _zz_m1_axi_wdata[36];
    if(when_Axi4Crossbar_l464_1) begin
      if(when_Axi4Crossbar_l467_2) begin
        if(when_Axi4Crossbar_l473_1) begin
          m1_axi_wlast = s0_axi_wlast;
        end
      end
      if(when_Axi4Crossbar_l467_3) begin
        if(when_Axi4Crossbar_l473_1) begin
          m1_axi_wlast = s1_axi_wlast;
        end
      end
    end
    if(when_Axi4Crossbar_l494_1) begin
      if(when_Axi4Crossbar_l496_2) begin
        m1_axi_wlast = s0_axi_wlast;
      end
      if(when_Axi4Crossbar_l496_3) begin
        m1_axi_wlast = s1_axi_wlast;
      end
    end
  end

  always @(*) begin
    m1_axi_bready = 1'b0;
    if(when_Axi4Crossbar_l548_1) begin
      m1_axi_bready = s0_axi_bready;
    end
    if(when_Axi4Crossbar_l548_5) begin
      m1_axi_bready = s1_axi_bready;
    end
  end

  always @(*) begin
    m1_axi_arvalid = 1'b0;
    if(when_Axi4Crossbar_l579_1) begin
      m1_axi_arvalid = 1'b1;
    end
  end

  assign _zz_m1_axi_araddr = 63'h0000000000000000;
  always @(*) begin
    m1_axi_araddr = _zz_m1_axi_araddr[31 : 0];
    if(when_Axi4Crossbar_l579_1) begin
      if(when_Axi4Crossbar_l582_2) begin
        m1_axi_araddr = s0_axi_araddr;
      end
      if(when_Axi4Crossbar_l582_3) begin
        m1_axi_araddr = s1_axi_araddr;
      end
    end
  end

  always @(*) begin
    m1_axi_arid = _zz_m1_axi_araddr[33 : 32];
    if(when_Axi4Crossbar_l579_1) begin
      if(when_Axi4Crossbar_l582_2) begin
        m1_axi_arid = {_zz_m1_axi_arid,s0_axi_arid};
      end
      if(when_Axi4Crossbar_l582_3) begin
        m1_axi_arid = {_zz_m1_axi_arid,s1_axi_arid};
      end
    end
  end

  assign m1_axi_arregion = _zz_m1_axi_araddr[37 : 34];
  always @(*) begin
    m1_axi_arlen = _zz_m1_axi_araddr[45 : 38];
    if(when_Axi4Crossbar_l579_1) begin
      if(when_Axi4Crossbar_l582_2) begin
        m1_axi_arlen = s0_axi_arlen;
      end
      if(when_Axi4Crossbar_l582_3) begin
        m1_axi_arlen = s1_axi_arlen;
      end
    end
  end

  always @(*) begin
    m1_axi_arsize = _zz_m1_axi_araddr[48 : 46];
    if(when_Axi4Crossbar_l579_1) begin
      if(when_Axi4Crossbar_l582_2) begin
        m1_axi_arsize = s0_axi_arsize;
      end
      if(when_Axi4Crossbar_l582_3) begin
        m1_axi_arsize = s1_axi_arsize;
      end
    end
  end

  always @(*) begin
    m1_axi_arburst = _zz_m1_axi_araddr[50 : 49];
    if(when_Axi4Crossbar_l579_1) begin
      if(when_Axi4Crossbar_l582_2) begin
        m1_axi_arburst = s0_axi_arburst;
      end
      if(when_Axi4Crossbar_l582_3) begin
        m1_axi_arburst = s1_axi_arburst;
      end
    end
  end

  always @(*) begin
    m1_axi_arlock = _zz_m1_axi_araddr[51 : 51];
    if(when_Axi4Crossbar_l579_1) begin
      if(when_Axi4Crossbar_l582_2) begin
        m1_axi_arlock = s0_axi_arlock;
      end
      if(when_Axi4Crossbar_l582_3) begin
        m1_axi_arlock = s1_axi_arlock;
      end
    end
  end

  always @(*) begin
    m1_axi_arcache = _zz_m1_axi_araddr[55 : 52];
    if(when_Axi4Crossbar_l579_1) begin
      if(when_Axi4Crossbar_l582_2) begin
        m1_axi_arcache = s0_axi_arcache;
      end
      if(when_Axi4Crossbar_l582_3) begin
        m1_axi_arcache = s1_axi_arcache;
      end
    end
  end

  always @(*) begin
    m1_axi_arqos = _zz_m1_axi_araddr[59 : 56];
    if(when_Axi4Crossbar_l579_1) begin
      if(when_Axi4Crossbar_l582_2) begin
        m1_axi_arqos = s0_axi_arqos;
      end
      if(when_Axi4Crossbar_l582_3) begin
        m1_axi_arqos = s1_axi_arqos;
      end
    end
  end

  always @(*) begin
    m1_axi_arprot = _zz_m1_axi_araddr[62 : 60];
    if(when_Axi4Crossbar_l579_1) begin
      if(when_Axi4Crossbar_l582_2) begin
        m1_axi_arprot = s0_axi_arprot;
      end
      if(when_Axi4Crossbar_l582_3) begin
        m1_axi_arprot = s1_axi_arprot;
      end
    end
  end

  always @(*) begin
    m1_axi_rready = 1'b0;
    if(when_Axi4Crossbar_l620_1) begin
      m1_axi_rready = s0_axi_rready;
    end
    if(when_Axi4Crossbar_l620_5) begin
      m1_axi_rready = s1_axi_rready;
    end
  end

  always @(*) begin
    m2_axi_awvalid = 1'b0;
    if(when_Axi4Crossbar_l464_2) begin
      m2_axi_awvalid = 1'b1;
    end
  end

  assign _zz_m2_axi_awaddr = 63'h0000000000000000;
  always @(*) begin
    m2_axi_awaddr = _zz_m2_axi_awaddr[31 : 0];
    if(when_Axi4Crossbar_l464_2) begin
      if(when_Axi4Crossbar_l467_4) begin
        m2_axi_awaddr = s0_axi_awaddr;
      end
      if(when_Axi4Crossbar_l467_5) begin
        m2_axi_awaddr = s1_axi_awaddr;
      end
    end
  end

  always @(*) begin
    m2_axi_awid = _zz_m2_axi_awaddr[33 : 32];
    if(when_Axi4Crossbar_l464_2) begin
      if(when_Axi4Crossbar_l467_4) begin
        m2_axi_awid = {_zz_m2_axi_awid,s0_axi_awid};
      end
      if(when_Axi4Crossbar_l467_5) begin
        m2_axi_awid = {_zz_m2_axi_awid,s1_axi_awid};
      end
    end
  end

  assign m2_axi_awregion = _zz_m2_axi_awaddr[37 : 34];
  always @(*) begin
    m2_axi_awlen = _zz_m2_axi_awaddr[45 : 38];
    if(when_Axi4Crossbar_l464_2) begin
      if(when_Axi4Crossbar_l467_4) begin
        m2_axi_awlen = s0_axi_awlen;
      end
      if(when_Axi4Crossbar_l467_5) begin
        m2_axi_awlen = s1_axi_awlen;
      end
    end
  end

  always @(*) begin
    m2_axi_awsize = _zz_m2_axi_awaddr[48 : 46];
    if(when_Axi4Crossbar_l464_2) begin
      if(when_Axi4Crossbar_l467_4) begin
        m2_axi_awsize = s0_axi_awsize;
      end
      if(when_Axi4Crossbar_l467_5) begin
        m2_axi_awsize = s1_axi_awsize;
      end
    end
  end

  always @(*) begin
    m2_axi_awburst = _zz_m2_axi_awaddr[50 : 49];
    if(when_Axi4Crossbar_l464_2) begin
      if(when_Axi4Crossbar_l467_4) begin
        m2_axi_awburst = s0_axi_awburst;
      end
      if(when_Axi4Crossbar_l467_5) begin
        m2_axi_awburst = s1_axi_awburst;
      end
    end
  end

  always @(*) begin
    m2_axi_awlock = _zz_m2_axi_awaddr[51 : 51];
    if(when_Axi4Crossbar_l464_2) begin
      if(when_Axi4Crossbar_l467_4) begin
        m2_axi_awlock = s0_axi_awlock;
      end
      if(when_Axi4Crossbar_l467_5) begin
        m2_axi_awlock = s1_axi_awlock;
      end
    end
  end

  always @(*) begin
    m2_axi_awcache = _zz_m2_axi_awaddr[55 : 52];
    if(when_Axi4Crossbar_l464_2) begin
      if(when_Axi4Crossbar_l467_4) begin
        m2_axi_awcache = s0_axi_awcache;
      end
      if(when_Axi4Crossbar_l467_5) begin
        m2_axi_awcache = s1_axi_awcache;
      end
    end
  end

  always @(*) begin
    m2_axi_awqos = _zz_m2_axi_awaddr[59 : 56];
    if(when_Axi4Crossbar_l464_2) begin
      if(when_Axi4Crossbar_l467_4) begin
        m2_axi_awqos = s0_axi_awqos;
      end
      if(when_Axi4Crossbar_l467_5) begin
        m2_axi_awqos = s1_axi_awqos;
      end
    end
  end

  always @(*) begin
    m2_axi_awprot = _zz_m2_axi_awaddr[62 : 60];
    if(when_Axi4Crossbar_l464_2) begin
      if(when_Axi4Crossbar_l467_4) begin
        m2_axi_awprot = s0_axi_awprot;
      end
      if(when_Axi4Crossbar_l467_5) begin
        m2_axi_awprot = s1_axi_awprot;
      end
    end
  end

  always @(*) begin
    m2_axi_wvalid = 1'b0;
    if(when_Axi4Crossbar_l464_2) begin
      if(when_Axi4Crossbar_l467_4) begin
        if(when_Axi4Crossbar_l473_2) begin
          m2_axi_wvalid = s0_axi_wvalid;
        end
      end
      if(when_Axi4Crossbar_l467_5) begin
        if(when_Axi4Crossbar_l473_2) begin
          m2_axi_wvalid = s1_axi_wvalid;
        end
      end
    end
    if(when_Axi4Crossbar_l494_2) begin
      if(when_Axi4Crossbar_l496_4) begin
        m2_axi_wvalid = s0_axi_wvalid;
      end
      if(when_Axi4Crossbar_l496_5) begin
        m2_axi_wvalid = s1_axi_wvalid;
      end
    end
  end

  assign _zz_m2_axi_wdata = 37'h0000000000;
  always @(*) begin
    m2_axi_wdata = _zz_m2_axi_wdata[31 : 0];
    if(when_Axi4Crossbar_l464_2) begin
      if(when_Axi4Crossbar_l467_4) begin
        if(when_Axi4Crossbar_l473_2) begin
          m2_axi_wdata = s0_axi_wdata;
        end
      end
      if(when_Axi4Crossbar_l467_5) begin
        if(when_Axi4Crossbar_l473_2) begin
          m2_axi_wdata = s1_axi_wdata;
        end
      end
    end
    if(when_Axi4Crossbar_l494_2) begin
      if(when_Axi4Crossbar_l496_4) begin
        m2_axi_wdata = s0_axi_wdata;
      end
      if(when_Axi4Crossbar_l496_5) begin
        m2_axi_wdata = s1_axi_wdata;
      end
    end
  end

  always @(*) begin
    m2_axi_wstrb = _zz_m2_axi_wdata[35 : 32];
    if(when_Axi4Crossbar_l464_2) begin
      if(when_Axi4Crossbar_l467_4) begin
        if(when_Axi4Crossbar_l473_2) begin
          m2_axi_wstrb = s0_axi_wstrb;
        end
      end
      if(when_Axi4Crossbar_l467_5) begin
        if(when_Axi4Crossbar_l473_2) begin
          m2_axi_wstrb = s1_axi_wstrb;
        end
      end
    end
    if(when_Axi4Crossbar_l494_2) begin
      if(when_Axi4Crossbar_l496_4) begin
        m2_axi_wstrb = s0_axi_wstrb;
      end
      if(when_Axi4Crossbar_l496_5) begin
        m2_axi_wstrb = s1_axi_wstrb;
      end
    end
  end

  always @(*) begin
    m2_axi_wlast = _zz_m2_axi_wdata[36];
    if(when_Axi4Crossbar_l464_2) begin
      if(when_Axi4Crossbar_l467_4) begin
        if(when_Axi4Crossbar_l473_2) begin
          m2_axi_wlast = s0_axi_wlast;
        end
      end
      if(when_Axi4Crossbar_l467_5) begin
        if(when_Axi4Crossbar_l473_2) begin
          m2_axi_wlast = s1_axi_wlast;
        end
      end
    end
    if(when_Axi4Crossbar_l494_2) begin
      if(when_Axi4Crossbar_l496_4) begin
        m2_axi_wlast = s0_axi_wlast;
      end
      if(when_Axi4Crossbar_l496_5) begin
        m2_axi_wlast = s1_axi_wlast;
      end
    end
  end

  always @(*) begin
    m2_axi_bready = 1'b0;
    if(when_Axi4Crossbar_l548_2) begin
      m2_axi_bready = s0_axi_bready;
    end
    if(when_Axi4Crossbar_l548_6) begin
      m2_axi_bready = s1_axi_bready;
    end
  end

  always @(*) begin
    m2_axi_arvalid = 1'b0;
    if(when_Axi4Crossbar_l579_2) begin
      m2_axi_arvalid = 1'b1;
    end
  end

  assign _zz_m2_axi_araddr = 63'h0000000000000000;
  always @(*) begin
    m2_axi_araddr = _zz_m2_axi_araddr[31 : 0];
    if(when_Axi4Crossbar_l579_2) begin
      if(when_Axi4Crossbar_l582_4) begin
        m2_axi_araddr = s0_axi_araddr;
      end
      if(when_Axi4Crossbar_l582_5) begin
        m2_axi_araddr = s1_axi_araddr;
      end
    end
  end

  always @(*) begin
    m2_axi_arid = _zz_m2_axi_araddr[33 : 32];
    if(when_Axi4Crossbar_l579_2) begin
      if(when_Axi4Crossbar_l582_4) begin
        m2_axi_arid = {_zz_m2_axi_arid,s0_axi_arid};
      end
      if(when_Axi4Crossbar_l582_5) begin
        m2_axi_arid = {_zz_m2_axi_arid,s1_axi_arid};
      end
    end
  end

  assign m2_axi_arregion = _zz_m2_axi_araddr[37 : 34];
  always @(*) begin
    m2_axi_arlen = _zz_m2_axi_araddr[45 : 38];
    if(when_Axi4Crossbar_l579_2) begin
      if(when_Axi4Crossbar_l582_4) begin
        m2_axi_arlen = s0_axi_arlen;
      end
      if(when_Axi4Crossbar_l582_5) begin
        m2_axi_arlen = s1_axi_arlen;
      end
    end
  end

  always @(*) begin
    m2_axi_arsize = _zz_m2_axi_araddr[48 : 46];
    if(when_Axi4Crossbar_l579_2) begin
      if(when_Axi4Crossbar_l582_4) begin
        m2_axi_arsize = s0_axi_arsize;
      end
      if(when_Axi4Crossbar_l582_5) begin
        m2_axi_arsize = s1_axi_arsize;
      end
    end
  end

  always @(*) begin
    m2_axi_arburst = _zz_m2_axi_araddr[50 : 49];
    if(when_Axi4Crossbar_l579_2) begin
      if(when_Axi4Crossbar_l582_4) begin
        m2_axi_arburst = s0_axi_arburst;
      end
      if(when_Axi4Crossbar_l582_5) begin
        m2_axi_arburst = s1_axi_arburst;
      end
    end
  end

  always @(*) begin
    m2_axi_arlock = _zz_m2_axi_araddr[51 : 51];
    if(when_Axi4Crossbar_l579_2) begin
      if(when_Axi4Crossbar_l582_4) begin
        m2_axi_arlock = s0_axi_arlock;
      end
      if(when_Axi4Crossbar_l582_5) begin
        m2_axi_arlock = s1_axi_arlock;
      end
    end
  end

  always @(*) begin
    m2_axi_arcache = _zz_m2_axi_araddr[55 : 52];
    if(when_Axi4Crossbar_l579_2) begin
      if(when_Axi4Crossbar_l582_4) begin
        m2_axi_arcache = s0_axi_arcache;
      end
      if(when_Axi4Crossbar_l582_5) begin
        m2_axi_arcache = s1_axi_arcache;
      end
    end
  end

  always @(*) begin
    m2_axi_arqos = _zz_m2_axi_araddr[59 : 56];
    if(when_Axi4Crossbar_l579_2) begin
      if(when_Axi4Crossbar_l582_4) begin
        m2_axi_arqos = s0_axi_arqos;
      end
      if(when_Axi4Crossbar_l582_5) begin
        m2_axi_arqos = s1_axi_arqos;
      end
    end
  end

  always @(*) begin
    m2_axi_arprot = _zz_m2_axi_araddr[62 : 60];
    if(when_Axi4Crossbar_l579_2) begin
      if(when_Axi4Crossbar_l582_4) begin
        m2_axi_arprot = s0_axi_arprot;
      end
      if(when_Axi4Crossbar_l582_5) begin
        m2_axi_arprot = s1_axi_arprot;
      end
    end
  end

  always @(*) begin
    m2_axi_rready = 1'b0;
    if(when_Axi4Crossbar_l620_2) begin
      m2_axi_rready = s0_axi_rready;
    end
    if(when_Axi4Crossbar_l620_6) begin
      m2_axi_rready = s1_axi_rready;
    end
  end

  always @(*) begin
    m3_axi_awvalid = 1'b0;
    if(when_Axi4Crossbar_l464_3) begin
      m3_axi_awvalid = 1'b1;
    end
  end

  assign _zz_m3_axi_awaddr = 63'h0000000000000000;
  always @(*) begin
    m3_axi_awaddr = _zz_m3_axi_awaddr[31 : 0];
    if(when_Axi4Crossbar_l464_3) begin
      if(when_Axi4Crossbar_l467_6) begin
        m3_axi_awaddr = s0_axi_awaddr;
      end
      if(when_Axi4Crossbar_l467_7) begin
        m3_axi_awaddr = s1_axi_awaddr;
      end
    end
  end

  always @(*) begin
    m3_axi_awid = _zz_m3_axi_awaddr[33 : 32];
    if(when_Axi4Crossbar_l464_3) begin
      if(when_Axi4Crossbar_l467_6) begin
        m3_axi_awid = {_zz_m3_axi_awid,s0_axi_awid};
      end
      if(when_Axi4Crossbar_l467_7) begin
        m3_axi_awid = {_zz_m3_axi_awid,s1_axi_awid};
      end
    end
  end

  assign m3_axi_awregion = _zz_m3_axi_awaddr[37 : 34];
  always @(*) begin
    m3_axi_awlen = _zz_m3_axi_awaddr[45 : 38];
    if(when_Axi4Crossbar_l464_3) begin
      if(when_Axi4Crossbar_l467_6) begin
        m3_axi_awlen = s0_axi_awlen;
      end
      if(when_Axi4Crossbar_l467_7) begin
        m3_axi_awlen = s1_axi_awlen;
      end
    end
  end

  always @(*) begin
    m3_axi_awsize = _zz_m3_axi_awaddr[48 : 46];
    if(when_Axi4Crossbar_l464_3) begin
      if(when_Axi4Crossbar_l467_6) begin
        m3_axi_awsize = s0_axi_awsize;
      end
      if(when_Axi4Crossbar_l467_7) begin
        m3_axi_awsize = s1_axi_awsize;
      end
    end
  end

  always @(*) begin
    m3_axi_awburst = _zz_m3_axi_awaddr[50 : 49];
    if(when_Axi4Crossbar_l464_3) begin
      if(when_Axi4Crossbar_l467_6) begin
        m3_axi_awburst = s0_axi_awburst;
      end
      if(when_Axi4Crossbar_l467_7) begin
        m3_axi_awburst = s1_axi_awburst;
      end
    end
  end

  always @(*) begin
    m3_axi_awlock = _zz_m3_axi_awaddr[51 : 51];
    if(when_Axi4Crossbar_l464_3) begin
      if(when_Axi4Crossbar_l467_6) begin
        m3_axi_awlock = s0_axi_awlock;
      end
      if(when_Axi4Crossbar_l467_7) begin
        m3_axi_awlock = s1_axi_awlock;
      end
    end
  end

  always @(*) begin
    m3_axi_awcache = _zz_m3_axi_awaddr[55 : 52];
    if(when_Axi4Crossbar_l464_3) begin
      if(when_Axi4Crossbar_l467_6) begin
        m3_axi_awcache = s0_axi_awcache;
      end
      if(when_Axi4Crossbar_l467_7) begin
        m3_axi_awcache = s1_axi_awcache;
      end
    end
  end

  always @(*) begin
    m3_axi_awqos = _zz_m3_axi_awaddr[59 : 56];
    if(when_Axi4Crossbar_l464_3) begin
      if(when_Axi4Crossbar_l467_6) begin
        m3_axi_awqos = s0_axi_awqos;
      end
      if(when_Axi4Crossbar_l467_7) begin
        m3_axi_awqos = s1_axi_awqos;
      end
    end
  end

  always @(*) begin
    m3_axi_awprot = _zz_m3_axi_awaddr[62 : 60];
    if(when_Axi4Crossbar_l464_3) begin
      if(when_Axi4Crossbar_l467_6) begin
        m3_axi_awprot = s0_axi_awprot;
      end
      if(when_Axi4Crossbar_l467_7) begin
        m3_axi_awprot = s1_axi_awprot;
      end
    end
  end

  always @(*) begin
    m3_axi_wvalid = 1'b0;
    if(when_Axi4Crossbar_l464_3) begin
      if(when_Axi4Crossbar_l467_6) begin
        if(when_Axi4Crossbar_l473_3) begin
          m3_axi_wvalid = s0_axi_wvalid;
        end
      end
      if(when_Axi4Crossbar_l467_7) begin
        if(when_Axi4Crossbar_l473_3) begin
          m3_axi_wvalid = s1_axi_wvalid;
        end
      end
    end
    if(when_Axi4Crossbar_l494_3) begin
      if(when_Axi4Crossbar_l496_6) begin
        m3_axi_wvalid = s0_axi_wvalid;
      end
      if(when_Axi4Crossbar_l496_7) begin
        m3_axi_wvalid = s1_axi_wvalid;
      end
    end
  end

  assign _zz_m3_axi_wdata = 37'h0000000000;
  always @(*) begin
    m3_axi_wdata = _zz_m3_axi_wdata[31 : 0];
    if(when_Axi4Crossbar_l464_3) begin
      if(when_Axi4Crossbar_l467_6) begin
        if(when_Axi4Crossbar_l473_3) begin
          m3_axi_wdata = s0_axi_wdata;
        end
      end
      if(when_Axi4Crossbar_l467_7) begin
        if(when_Axi4Crossbar_l473_3) begin
          m3_axi_wdata = s1_axi_wdata;
        end
      end
    end
    if(when_Axi4Crossbar_l494_3) begin
      if(when_Axi4Crossbar_l496_6) begin
        m3_axi_wdata = s0_axi_wdata;
      end
      if(when_Axi4Crossbar_l496_7) begin
        m3_axi_wdata = s1_axi_wdata;
      end
    end
  end

  always @(*) begin
    m3_axi_wstrb = _zz_m3_axi_wdata[35 : 32];
    if(when_Axi4Crossbar_l464_3) begin
      if(when_Axi4Crossbar_l467_6) begin
        if(when_Axi4Crossbar_l473_3) begin
          m3_axi_wstrb = s0_axi_wstrb;
        end
      end
      if(when_Axi4Crossbar_l467_7) begin
        if(when_Axi4Crossbar_l473_3) begin
          m3_axi_wstrb = s1_axi_wstrb;
        end
      end
    end
    if(when_Axi4Crossbar_l494_3) begin
      if(when_Axi4Crossbar_l496_6) begin
        m3_axi_wstrb = s0_axi_wstrb;
      end
      if(when_Axi4Crossbar_l496_7) begin
        m3_axi_wstrb = s1_axi_wstrb;
      end
    end
  end

  always @(*) begin
    m3_axi_wlast = _zz_m3_axi_wdata[36];
    if(when_Axi4Crossbar_l464_3) begin
      if(when_Axi4Crossbar_l467_6) begin
        if(when_Axi4Crossbar_l473_3) begin
          m3_axi_wlast = s0_axi_wlast;
        end
      end
      if(when_Axi4Crossbar_l467_7) begin
        if(when_Axi4Crossbar_l473_3) begin
          m3_axi_wlast = s1_axi_wlast;
        end
      end
    end
    if(when_Axi4Crossbar_l494_3) begin
      if(when_Axi4Crossbar_l496_6) begin
        m3_axi_wlast = s0_axi_wlast;
      end
      if(when_Axi4Crossbar_l496_7) begin
        m3_axi_wlast = s1_axi_wlast;
      end
    end
  end

  always @(*) begin
    m3_axi_bready = 1'b0;
    if(when_Axi4Crossbar_l548_3) begin
      m3_axi_bready = s0_axi_bready;
    end
    if(when_Axi4Crossbar_l548_7) begin
      m3_axi_bready = s1_axi_bready;
    end
  end

  always @(*) begin
    m3_axi_arvalid = 1'b0;
    if(when_Axi4Crossbar_l579_3) begin
      m3_axi_arvalid = 1'b1;
    end
  end

  assign _zz_m3_axi_araddr = 63'h0000000000000000;
  always @(*) begin
    m3_axi_araddr = _zz_m3_axi_araddr[31 : 0];
    if(when_Axi4Crossbar_l579_3) begin
      if(when_Axi4Crossbar_l582_6) begin
        m3_axi_araddr = s0_axi_araddr;
      end
      if(when_Axi4Crossbar_l582_7) begin
        m3_axi_araddr = s1_axi_araddr;
      end
    end
  end

  always @(*) begin
    m3_axi_arid = _zz_m3_axi_araddr[33 : 32];
    if(when_Axi4Crossbar_l579_3) begin
      if(when_Axi4Crossbar_l582_6) begin
        m3_axi_arid = {_zz_m3_axi_arid,s0_axi_arid};
      end
      if(when_Axi4Crossbar_l582_7) begin
        m3_axi_arid = {_zz_m3_axi_arid,s1_axi_arid};
      end
    end
  end

  assign m3_axi_arregion = _zz_m3_axi_araddr[37 : 34];
  always @(*) begin
    m3_axi_arlen = _zz_m3_axi_araddr[45 : 38];
    if(when_Axi4Crossbar_l579_3) begin
      if(when_Axi4Crossbar_l582_6) begin
        m3_axi_arlen = s0_axi_arlen;
      end
      if(when_Axi4Crossbar_l582_7) begin
        m3_axi_arlen = s1_axi_arlen;
      end
    end
  end

  always @(*) begin
    m3_axi_arsize = _zz_m3_axi_araddr[48 : 46];
    if(when_Axi4Crossbar_l579_3) begin
      if(when_Axi4Crossbar_l582_6) begin
        m3_axi_arsize = s0_axi_arsize;
      end
      if(when_Axi4Crossbar_l582_7) begin
        m3_axi_arsize = s1_axi_arsize;
      end
    end
  end

  always @(*) begin
    m3_axi_arburst = _zz_m3_axi_araddr[50 : 49];
    if(when_Axi4Crossbar_l579_3) begin
      if(when_Axi4Crossbar_l582_6) begin
        m3_axi_arburst = s0_axi_arburst;
      end
      if(when_Axi4Crossbar_l582_7) begin
        m3_axi_arburst = s1_axi_arburst;
      end
    end
  end

  always @(*) begin
    m3_axi_arlock = _zz_m3_axi_araddr[51 : 51];
    if(when_Axi4Crossbar_l579_3) begin
      if(when_Axi4Crossbar_l582_6) begin
        m3_axi_arlock = s0_axi_arlock;
      end
      if(when_Axi4Crossbar_l582_7) begin
        m3_axi_arlock = s1_axi_arlock;
      end
    end
  end

  always @(*) begin
    m3_axi_arcache = _zz_m3_axi_araddr[55 : 52];
    if(when_Axi4Crossbar_l579_3) begin
      if(when_Axi4Crossbar_l582_6) begin
        m3_axi_arcache = s0_axi_arcache;
      end
      if(when_Axi4Crossbar_l582_7) begin
        m3_axi_arcache = s1_axi_arcache;
      end
    end
  end

  always @(*) begin
    m3_axi_arqos = _zz_m3_axi_araddr[59 : 56];
    if(when_Axi4Crossbar_l579_3) begin
      if(when_Axi4Crossbar_l582_6) begin
        m3_axi_arqos = s0_axi_arqos;
      end
      if(when_Axi4Crossbar_l582_7) begin
        m3_axi_arqos = s1_axi_arqos;
      end
    end
  end

  always @(*) begin
    m3_axi_arprot = _zz_m3_axi_araddr[62 : 60];
    if(when_Axi4Crossbar_l579_3) begin
      if(when_Axi4Crossbar_l582_6) begin
        m3_axi_arprot = s0_axi_arprot;
      end
      if(when_Axi4Crossbar_l582_7) begin
        m3_axi_arprot = s1_axi_arprot;
      end
    end
  end

  always @(*) begin
    m3_axi_rready = 1'b0;
    if(when_Axi4Crossbar_l620_3) begin
      m3_axi_rready = s0_axi_rready;
    end
    if(when_Axi4Crossbar_l620_7) begin
      m3_axi_rready = s1_axi_rready;
    end
  end

  always @(*) begin
    _zz_when_Axi4Crossbar_l464_5[0] = ((32'hc0000000 <= s0_axi_awaddr) && (s0_axi_awaddr < 32'hc0010000));
    _zz_when_Axi4Crossbar_l464_5[1] = ((32'hc0010000 <= s0_axi_awaddr) && (s0_axi_awaddr < 32'hc0020000));
    _zz_when_Axi4Crossbar_l464_5[2] = ((32'hc0020000 <= s0_axi_awaddr) && (s0_axi_awaddr < 32'hc0021000));
    _zz_when_Axi4Crossbar_l464_5[3] = ((32'hc0030000 <= s0_axi_awaddr) && (s0_axi_awaddr < 32'hc0031000));
  end

  always @(*) begin
    _zz_when_Axi4Crossbar_l464_4[0] = (s0_axi_awvalid && _zz_when_Axi4Crossbar_l464_5[0]);
    _zz_when_Axi4Crossbar_l464_4[1] = (s1_axi_awvalid && _zz_when_Axi4Crossbar_l464_6[0]);
  end

  always @(*) begin
    _zz_when_Axi4Crossbar_l464_6[0] = ((32'hc0000000 <= s1_axi_awaddr) && (s1_axi_awaddr < 32'hc0010000));
    _zz_when_Axi4Crossbar_l464_6[1] = ((32'hc0010000 <= s1_axi_awaddr) && (s1_axi_awaddr < 32'hc0020000));
    _zz_when_Axi4Crossbar_l464_6[2] = ((32'hc0020000 <= s1_axi_awaddr) && (s1_axi_awaddr < 32'hc0021000));
    _zz_when_Axi4Crossbar_l464_6[3] = ((32'hc0030000 <= s1_axi_awaddr) && (s1_axi_awaddr < 32'hc0031000));
  end

  always @(*) begin
    _zz_when_Axi4Crossbar_l167[0] = (wrRrPtr_0 <= 1'b0);
    _zz_when_Axi4Crossbar_l167[1] = (wrRrPtr_0 <= 1'b1);
  end

  assign _zz_when_Axi4Crossbar_l167_1 = (_zz_when_Axi4Crossbar_l464_4 & _zz_when_Axi4Crossbar_l167);
  assign _zz_when_Axi4Crossbar_l167_2 = _zz_when_Axi4Crossbar_l167_1;
  assign _zz_when_Axi4Crossbar_l167_3 = _zz_when_Axi4Crossbar_l464_4;
  assign _zz_when_Axi4Crossbar_l167_4 = ((|_zz_when_Axi4Crossbar_l167_1) ? (_zz_when_Axi4Crossbar_l167_2 & (~ _zz__zz_when_Axi4Crossbar_l167_4)) : (_zz_when_Axi4Crossbar_l167_3 & (~ _zz__zz_when_Axi4Crossbar_l167_4_1)));
  always @(*) begin
    _zz_m0_axi_awid = 1'b0;
    if(when_Axi4Crossbar_l167) begin
      _zz_m0_axi_awid = 1'b0;
    end
    if(when_Axi4Crossbar_l167_1) begin
      _zz_m0_axi_awid = 1'b1;
    end
  end

  assign when_Axi4Crossbar_l167 = _zz_when_Axi4Crossbar_l167_4[0];
  assign when_Axi4Crossbar_l167_1 = _zz_when_Axi4Crossbar_l167_4[1];
  assign when_Axi4Crossbar_l473 = (_zz_when_Axi4Crossbar_l473 == 3'b000);
  assign _zz_when_Axi4Crossbar_l496_4 = _zz__zz_5_port0;
  assign when_Axi4Crossbar_l464 = ((_zz_when_Axi4Crossbar_l464 < 3'b100) && (|_zz_when_Axi4Crossbar_l464_4));
  assign when_Axi4Crossbar_l467 = (_zz_m0_axi_awid == 1'b0);
  assign when_Axi4Crossbar_l467_1 = (_zz_m0_axi_awid == 1'b1);
  assign io_slaves_0_aw_fire = (m0_axi_awvalid && m0_axi_awready);
  assign when_Axi4Crossbar_l494 = (! when_Axi4Crossbar_l473);
  assign when_Axi4Crossbar_l496 = (_zz_when_Axi4Crossbar_l496_4 == 1'b0);
  assign when_Axi4Crossbar_l496_1 = (_zz_when_Axi4Crossbar_l496_4 == 1'b1);
  assign io_slaves_0_w_fire = (m0_axi_wvalid && m0_axi_wready);
  assign when_Axi4Crossbar_l511 = (io_slaves_0_w_fire && m0_axi_wlast);
  assign when_Axi4Crossbar_l517 = (io_slaves_0_aw_fire && (! when_Axi4Crossbar_l511));
  assign when_Axi4Crossbar_l519 = ((! io_slaves_0_aw_fire) && when_Axi4Crossbar_l511);
  assign io_slaves_0_b_fire = (m0_axi_bvalid && m0_axi_bready);
  assign when_Axi4Crossbar_l526 = (io_slaves_0_aw_fire && (! io_slaves_0_b_fire));
  assign when_Axi4Crossbar_l528 = ((! io_slaves_0_aw_fire) && io_slaves_0_b_fire);
  always @(*) begin
    _zz_when_Axi4Crossbar_l464_8[0] = ((32'hc0000000 <= s0_axi_awaddr) && (s0_axi_awaddr < 32'hc0010000));
    _zz_when_Axi4Crossbar_l464_8[1] = ((32'hc0010000 <= s0_axi_awaddr) && (s0_axi_awaddr < 32'hc0020000));
    _zz_when_Axi4Crossbar_l464_8[2] = ((32'hc0020000 <= s0_axi_awaddr) && (s0_axi_awaddr < 32'hc0021000));
    _zz_when_Axi4Crossbar_l464_8[3] = ((32'hc0030000 <= s0_axi_awaddr) && (s0_axi_awaddr < 32'hc0031000));
  end

  always @(*) begin
    _zz_when_Axi4Crossbar_l464_7[0] = (s0_axi_awvalid && _zz_when_Axi4Crossbar_l464_8[1]);
    _zz_when_Axi4Crossbar_l464_7[1] = (s1_axi_awvalid && _zz_when_Axi4Crossbar_l464_9[1]);
  end

  always @(*) begin
    _zz_when_Axi4Crossbar_l464_9[0] = ((32'hc0000000 <= s1_axi_awaddr) && (s1_axi_awaddr < 32'hc0010000));
    _zz_when_Axi4Crossbar_l464_9[1] = ((32'hc0010000 <= s1_axi_awaddr) && (s1_axi_awaddr < 32'hc0020000));
    _zz_when_Axi4Crossbar_l464_9[2] = ((32'hc0020000 <= s1_axi_awaddr) && (s1_axi_awaddr < 32'hc0021000));
    _zz_when_Axi4Crossbar_l464_9[3] = ((32'hc0030000 <= s1_axi_awaddr) && (s1_axi_awaddr < 32'hc0031000));
  end

  always @(*) begin
    _zz_when_Axi4Crossbar_l167_5[0] = (wrRrPtr_1 <= 1'b0);
    _zz_when_Axi4Crossbar_l167_5[1] = (wrRrPtr_1 <= 1'b1);
  end

  assign _zz_when_Axi4Crossbar_l167_6 = (_zz_when_Axi4Crossbar_l464_7 & _zz_when_Axi4Crossbar_l167_5);
  assign _zz_when_Axi4Crossbar_l167_7 = _zz_when_Axi4Crossbar_l167_6;
  assign _zz_when_Axi4Crossbar_l167_8 = _zz_when_Axi4Crossbar_l464_7;
  assign _zz_when_Axi4Crossbar_l167_9 = ((|_zz_when_Axi4Crossbar_l167_6) ? (_zz_when_Axi4Crossbar_l167_7 & (~ _zz__zz_when_Axi4Crossbar_l167_9)) : (_zz_when_Axi4Crossbar_l167_8 & (~ _zz__zz_when_Axi4Crossbar_l167_9_1)));
  always @(*) begin
    _zz_m1_axi_awid = 1'b0;
    if(when_Axi4Crossbar_l167_2) begin
      _zz_m1_axi_awid = 1'b0;
    end
    if(when_Axi4Crossbar_l167_3) begin
      _zz_m1_axi_awid = 1'b1;
    end
  end

  assign when_Axi4Crossbar_l167_2 = _zz_when_Axi4Crossbar_l167_9[0];
  assign when_Axi4Crossbar_l167_3 = _zz_when_Axi4Crossbar_l167_9[1];
  assign when_Axi4Crossbar_l473_1 = (_zz_when_Axi4Crossbar_l473_1 == 3'b000);
  assign _zz_when_Axi4Crossbar_l496_5 = _zz__zz_6_port0;
  assign when_Axi4Crossbar_l464_1 = ((_zz_when_Axi4Crossbar_l464_1 < 3'b100) && (|_zz_when_Axi4Crossbar_l464_7));
  assign when_Axi4Crossbar_l467_2 = (_zz_m1_axi_awid == 1'b0);
  assign when_Axi4Crossbar_l467_3 = (_zz_m1_axi_awid == 1'b1);
  assign io_slaves_1_aw_fire = (m1_axi_awvalid && m1_axi_awready);
  assign when_Axi4Crossbar_l494_1 = (! when_Axi4Crossbar_l473_1);
  assign when_Axi4Crossbar_l496_2 = (_zz_when_Axi4Crossbar_l496_5 == 1'b0);
  assign when_Axi4Crossbar_l496_3 = (_zz_when_Axi4Crossbar_l496_5 == 1'b1);
  assign io_slaves_1_w_fire = (m1_axi_wvalid && m1_axi_wready);
  assign when_Axi4Crossbar_l511_1 = (io_slaves_1_w_fire && m1_axi_wlast);
  assign when_Axi4Crossbar_l517_1 = (io_slaves_1_aw_fire && (! when_Axi4Crossbar_l511_1));
  assign when_Axi4Crossbar_l519_1 = ((! io_slaves_1_aw_fire) && when_Axi4Crossbar_l511_1);
  assign io_slaves_1_b_fire = (m1_axi_bvalid && m1_axi_bready);
  assign when_Axi4Crossbar_l526_1 = (io_slaves_1_aw_fire && (! io_slaves_1_b_fire));
  assign when_Axi4Crossbar_l528_1 = ((! io_slaves_1_aw_fire) && io_slaves_1_b_fire);
  always @(*) begin
    _zz_when_Axi4Crossbar_l464_11[0] = ((32'hc0000000 <= s0_axi_awaddr) && (s0_axi_awaddr < 32'hc0010000));
    _zz_when_Axi4Crossbar_l464_11[1] = ((32'hc0010000 <= s0_axi_awaddr) && (s0_axi_awaddr < 32'hc0020000));
    _zz_when_Axi4Crossbar_l464_11[2] = ((32'hc0020000 <= s0_axi_awaddr) && (s0_axi_awaddr < 32'hc0021000));
    _zz_when_Axi4Crossbar_l464_11[3] = ((32'hc0030000 <= s0_axi_awaddr) && (s0_axi_awaddr < 32'hc0031000));
  end

  always @(*) begin
    _zz_when_Axi4Crossbar_l464_10[0] = (s0_axi_awvalid && _zz_when_Axi4Crossbar_l464_11[2]);
    _zz_when_Axi4Crossbar_l464_10[1] = (s1_axi_awvalid && _zz_when_Axi4Crossbar_l464_12[2]);
  end

  always @(*) begin
    _zz_when_Axi4Crossbar_l464_12[0] = ((32'hc0000000 <= s1_axi_awaddr) && (s1_axi_awaddr < 32'hc0010000));
    _zz_when_Axi4Crossbar_l464_12[1] = ((32'hc0010000 <= s1_axi_awaddr) && (s1_axi_awaddr < 32'hc0020000));
    _zz_when_Axi4Crossbar_l464_12[2] = ((32'hc0020000 <= s1_axi_awaddr) && (s1_axi_awaddr < 32'hc0021000));
    _zz_when_Axi4Crossbar_l464_12[3] = ((32'hc0030000 <= s1_axi_awaddr) && (s1_axi_awaddr < 32'hc0031000));
  end

  always @(*) begin
    _zz_when_Axi4Crossbar_l167_10[0] = (wrRrPtr_2 <= 1'b0);
    _zz_when_Axi4Crossbar_l167_10[1] = (wrRrPtr_2 <= 1'b1);
  end

  assign _zz_when_Axi4Crossbar_l167_11 = (_zz_when_Axi4Crossbar_l464_10 & _zz_when_Axi4Crossbar_l167_10);
  assign _zz_when_Axi4Crossbar_l167_12 = _zz_when_Axi4Crossbar_l167_11;
  assign _zz_when_Axi4Crossbar_l167_13 = _zz_when_Axi4Crossbar_l464_10;
  assign _zz_when_Axi4Crossbar_l167_14 = ((|_zz_when_Axi4Crossbar_l167_11) ? (_zz_when_Axi4Crossbar_l167_12 & (~ _zz__zz_when_Axi4Crossbar_l167_14)) : (_zz_when_Axi4Crossbar_l167_13 & (~ _zz__zz_when_Axi4Crossbar_l167_14_1)));
  always @(*) begin
    _zz_m2_axi_awid = 1'b0;
    if(when_Axi4Crossbar_l167_4) begin
      _zz_m2_axi_awid = 1'b0;
    end
    if(when_Axi4Crossbar_l167_5) begin
      _zz_m2_axi_awid = 1'b1;
    end
  end

  assign when_Axi4Crossbar_l167_4 = _zz_when_Axi4Crossbar_l167_14[0];
  assign when_Axi4Crossbar_l167_5 = _zz_when_Axi4Crossbar_l167_14[1];
  assign when_Axi4Crossbar_l473_2 = (_zz_when_Axi4Crossbar_l473_2 == 3'b000);
  assign _zz_when_Axi4Crossbar_l496_6 = _zz__zz_7_port0;
  assign when_Axi4Crossbar_l464_2 = ((_zz_when_Axi4Crossbar_l464_2 < 3'b100) && (|_zz_when_Axi4Crossbar_l464_10));
  assign when_Axi4Crossbar_l467_4 = (_zz_m2_axi_awid == 1'b0);
  assign when_Axi4Crossbar_l467_5 = (_zz_m2_axi_awid == 1'b1);
  assign io_slaves_2_aw_fire = (m2_axi_awvalid && m2_axi_awready);
  assign when_Axi4Crossbar_l494_2 = (! when_Axi4Crossbar_l473_2);
  assign when_Axi4Crossbar_l496_4 = (_zz_when_Axi4Crossbar_l496_6 == 1'b0);
  assign when_Axi4Crossbar_l496_5 = (_zz_when_Axi4Crossbar_l496_6 == 1'b1);
  assign io_slaves_2_w_fire = (m2_axi_wvalid && m2_axi_wready);
  assign when_Axi4Crossbar_l511_2 = (io_slaves_2_w_fire && m2_axi_wlast);
  assign when_Axi4Crossbar_l517_2 = (io_slaves_2_aw_fire && (! when_Axi4Crossbar_l511_2));
  assign when_Axi4Crossbar_l519_2 = ((! io_slaves_2_aw_fire) && when_Axi4Crossbar_l511_2);
  assign io_slaves_2_b_fire = (m2_axi_bvalid && m2_axi_bready);
  assign when_Axi4Crossbar_l526_2 = (io_slaves_2_aw_fire && (! io_slaves_2_b_fire));
  assign when_Axi4Crossbar_l528_2 = ((! io_slaves_2_aw_fire) && io_slaves_2_b_fire);
  always @(*) begin
    _zz_when_Axi4Crossbar_l464_14[0] = ((32'hc0000000 <= s0_axi_awaddr) && (s0_axi_awaddr < 32'hc0010000));
    _zz_when_Axi4Crossbar_l464_14[1] = ((32'hc0010000 <= s0_axi_awaddr) && (s0_axi_awaddr < 32'hc0020000));
    _zz_when_Axi4Crossbar_l464_14[2] = ((32'hc0020000 <= s0_axi_awaddr) && (s0_axi_awaddr < 32'hc0021000));
    _zz_when_Axi4Crossbar_l464_14[3] = ((32'hc0030000 <= s0_axi_awaddr) && (s0_axi_awaddr < 32'hc0031000));
  end

  always @(*) begin
    _zz_when_Axi4Crossbar_l464_13[0] = (s0_axi_awvalid && _zz_when_Axi4Crossbar_l464_14[3]);
    _zz_when_Axi4Crossbar_l464_13[1] = (s1_axi_awvalid && _zz_when_Axi4Crossbar_l464_15[3]);
  end

  always @(*) begin
    _zz_when_Axi4Crossbar_l464_15[0] = ((32'hc0000000 <= s1_axi_awaddr) && (s1_axi_awaddr < 32'hc0010000));
    _zz_when_Axi4Crossbar_l464_15[1] = ((32'hc0010000 <= s1_axi_awaddr) && (s1_axi_awaddr < 32'hc0020000));
    _zz_when_Axi4Crossbar_l464_15[2] = ((32'hc0020000 <= s1_axi_awaddr) && (s1_axi_awaddr < 32'hc0021000));
    _zz_when_Axi4Crossbar_l464_15[3] = ((32'hc0030000 <= s1_axi_awaddr) && (s1_axi_awaddr < 32'hc0031000));
  end

  always @(*) begin
    _zz_when_Axi4Crossbar_l167_15[0] = (wrRrPtr_3 <= 1'b0);
    _zz_when_Axi4Crossbar_l167_15[1] = (wrRrPtr_3 <= 1'b1);
  end

  assign _zz_when_Axi4Crossbar_l167_16 = (_zz_when_Axi4Crossbar_l464_13 & _zz_when_Axi4Crossbar_l167_15);
  assign _zz_when_Axi4Crossbar_l167_17 = _zz_when_Axi4Crossbar_l167_16;
  assign _zz_when_Axi4Crossbar_l167_18 = _zz_when_Axi4Crossbar_l464_13;
  assign _zz_when_Axi4Crossbar_l167_19 = ((|_zz_when_Axi4Crossbar_l167_16) ? (_zz_when_Axi4Crossbar_l167_17 & (~ _zz__zz_when_Axi4Crossbar_l167_19)) : (_zz_when_Axi4Crossbar_l167_18 & (~ _zz__zz_when_Axi4Crossbar_l167_19_1)));
  always @(*) begin
    _zz_m3_axi_awid = 1'b0;
    if(when_Axi4Crossbar_l167_6) begin
      _zz_m3_axi_awid = 1'b0;
    end
    if(when_Axi4Crossbar_l167_7) begin
      _zz_m3_axi_awid = 1'b1;
    end
  end

  assign when_Axi4Crossbar_l167_6 = _zz_when_Axi4Crossbar_l167_19[0];
  assign when_Axi4Crossbar_l167_7 = _zz_when_Axi4Crossbar_l167_19[1];
  assign when_Axi4Crossbar_l473_3 = (_zz_when_Axi4Crossbar_l473_3 == 3'b000);
  assign _zz_when_Axi4Crossbar_l496_7 = _zz__zz_8_port0;
  assign when_Axi4Crossbar_l464_3 = ((_zz_when_Axi4Crossbar_l464_3 < 3'b100) && (|_zz_when_Axi4Crossbar_l464_13));
  assign when_Axi4Crossbar_l467_6 = (_zz_m3_axi_awid == 1'b0);
  assign when_Axi4Crossbar_l467_7 = (_zz_m3_axi_awid == 1'b1);
  assign io_slaves_3_aw_fire = (m3_axi_awvalid && m3_axi_awready);
  assign when_Axi4Crossbar_l494_3 = (! when_Axi4Crossbar_l473_3);
  assign when_Axi4Crossbar_l496_6 = (_zz_when_Axi4Crossbar_l496_7 == 1'b0);
  assign when_Axi4Crossbar_l496_7 = (_zz_when_Axi4Crossbar_l496_7 == 1'b1);
  assign io_slaves_3_w_fire = (m3_axi_wvalid && m3_axi_wready);
  assign when_Axi4Crossbar_l511_3 = (io_slaves_3_w_fire && m3_axi_wlast);
  assign when_Axi4Crossbar_l517_3 = (io_slaves_3_aw_fire && (! when_Axi4Crossbar_l511_3));
  assign when_Axi4Crossbar_l519_3 = ((! io_slaves_3_aw_fire) && when_Axi4Crossbar_l511_3);
  assign io_slaves_3_b_fire = (m3_axi_bvalid && m3_axi_bready);
  assign when_Axi4Crossbar_l526_3 = (io_slaves_3_aw_fire && (! io_slaves_3_b_fire));
  assign when_Axi4Crossbar_l528_3 = ((! io_slaves_3_aw_fire) && io_slaves_3_b_fire);
  always @(*) begin
    _zz_when_Axi4Crossbar_l548[0] = (m0_axi_bvalid && (_zz__zz_when_Axi4Crossbar_l548 == 1'b0));
    _zz_when_Axi4Crossbar_l548[1] = (m1_axi_bvalid && (_zz__zz_when_Axi4Crossbar_l548_1 == 1'b0));
    _zz_when_Axi4Crossbar_l548[2] = (m2_axi_bvalid && (_zz__zz_when_Axi4Crossbar_l548_2 == 1'b0));
    _zz_when_Axi4Crossbar_l548[3] = (m3_axi_bvalid && (_zz__zz_when_Axi4Crossbar_l548_3 == 1'b0));
  end

  assign _zz_when_Axi4Crossbar_l548_1 = _zz_when_Axi4Crossbar_l548;
  assign _zz_when_Axi4Crossbar_l548_2 = (_zz_when_Axi4Crossbar_l548_1 & (~ _zz__zz_when_Axi4Crossbar_l548_2_1));
  assign when_Axi4Crossbar_l548 = _zz_when_Axi4Crossbar_l548_2[0];
  assign when_Axi4Crossbar_l548_1 = _zz_when_Axi4Crossbar_l548_2[1];
  assign when_Axi4Crossbar_l548_2 = _zz_when_Axi4Crossbar_l548_2[2];
  assign when_Axi4Crossbar_l548_3 = _zz_when_Axi4Crossbar_l548_2[3];
  always @(*) begin
    _zz_when_Axi4Crossbar_l548_3[0] = (m0_axi_bvalid && (_zz__zz_when_Axi4Crossbar_l548_3_1 == 1'b1));
    _zz_when_Axi4Crossbar_l548_3[1] = (m1_axi_bvalid && (_zz__zz_when_Axi4Crossbar_l548_3_2 == 1'b1));
    _zz_when_Axi4Crossbar_l548_3[2] = (m2_axi_bvalid && (_zz__zz_when_Axi4Crossbar_l548_3_3 == 1'b1));
    _zz_when_Axi4Crossbar_l548_3[3] = (m3_axi_bvalid && (_zz__zz_when_Axi4Crossbar_l548_3_4 == 1'b1));
  end

  assign _zz_when_Axi4Crossbar_l548_4 = _zz_when_Axi4Crossbar_l548_3;
  assign _zz_when_Axi4Crossbar_l548_5 = (_zz_when_Axi4Crossbar_l548_4 & (~ _zz__zz_when_Axi4Crossbar_l548_5));
  assign when_Axi4Crossbar_l548_4 = _zz_when_Axi4Crossbar_l548_5[0];
  assign when_Axi4Crossbar_l548_5 = _zz_when_Axi4Crossbar_l548_5[1];
  assign when_Axi4Crossbar_l548_6 = _zz_when_Axi4Crossbar_l548_5[2];
  assign when_Axi4Crossbar_l548_7 = _zz_when_Axi4Crossbar_l548_5[3];
  always @(*) begin
    _zz_when_Axi4Crossbar_l579_5[0] = ((32'hc0000000 <= s0_axi_araddr) && (s0_axi_araddr < 32'hc0010000));
    _zz_when_Axi4Crossbar_l579_5[1] = ((32'hc0010000 <= s0_axi_araddr) && (s0_axi_araddr < 32'hc0020000));
    _zz_when_Axi4Crossbar_l579_5[2] = ((32'hc0020000 <= s0_axi_araddr) && (s0_axi_araddr < 32'hc0021000));
    _zz_when_Axi4Crossbar_l579_5[3] = ((32'hc0030000 <= s0_axi_araddr) && (s0_axi_araddr < 32'hc0031000));
  end

  always @(*) begin
    _zz_when_Axi4Crossbar_l579_4[0] = (s0_axi_arvalid && _zz_when_Axi4Crossbar_l579_5[0]);
    _zz_when_Axi4Crossbar_l579_4[1] = (s1_axi_arvalid && _zz_when_Axi4Crossbar_l579_6[0]);
  end

  always @(*) begin
    _zz_when_Axi4Crossbar_l579_6[0] = ((32'hc0000000 <= s1_axi_araddr) && (s1_axi_araddr < 32'hc0010000));
    _zz_when_Axi4Crossbar_l579_6[1] = ((32'hc0010000 <= s1_axi_araddr) && (s1_axi_araddr < 32'hc0020000));
    _zz_when_Axi4Crossbar_l579_6[2] = ((32'hc0020000 <= s1_axi_araddr) && (s1_axi_araddr < 32'hc0021000));
    _zz_when_Axi4Crossbar_l579_6[3] = ((32'hc0030000 <= s1_axi_araddr) && (s1_axi_araddr < 32'hc0031000));
  end

  always @(*) begin
    _zz_when_Axi4Crossbar_l167_20[0] = (rdRrPtr_0 <= 1'b0);
    _zz_when_Axi4Crossbar_l167_20[1] = (rdRrPtr_0 <= 1'b1);
  end

  assign _zz_when_Axi4Crossbar_l167_21 = (_zz_when_Axi4Crossbar_l579_4 & _zz_when_Axi4Crossbar_l167_20);
  assign _zz_when_Axi4Crossbar_l167_22 = _zz_when_Axi4Crossbar_l167_21;
  assign _zz_when_Axi4Crossbar_l167_23 = _zz_when_Axi4Crossbar_l579_4;
  assign _zz_when_Axi4Crossbar_l167_24 = ((|_zz_when_Axi4Crossbar_l167_21) ? (_zz_when_Axi4Crossbar_l167_22 & (~ _zz__zz_when_Axi4Crossbar_l167_24)) : (_zz_when_Axi4Crossbar_l167_23 & (~ _zz__zz_when_Axi4Crossbar_l167_24_1)));
  always @(*) begin
    _zz_m0_axi_arid = 1'b0;
    if(when_Axi4Crossbar_l167_8) begin
      _zz_m0_axi_arid = 1'b0;
    end
    if(when_Axi4Crossbar_l167_9) begin
      _zz_m0_axi_arid = 1'b1;
    end
  end

  assign when_Axi4Crossbar_l167_8 = _zz_when_Axi4Crossbar_l167_24[0];
  assign when_Axi4Crossbar_l167_9 = _zz_when_Axi4Crossbar_l167_24[1];
  assign when_Axi4Crossbar_l579 = ((_zz_when_Axi4Crossbar_l579 < 3'b100) && (|_zz_when_Axi4Crossbar_l579_4));
  assign when_Axi4Crossbar_l582 = (_zz_m0_axi_arid == 1'b0);
  assign when_Axi4Crossbar_l582_1 = (_zz_m0_axi_arid == 1'b1);
  assign io_slaves_0_ar_fire = (m0_axi_arvalid && m0_axi_arready);
  assign io_slaves_0_r_fire = (m0_axi_rvalid && m0_axi_rready);
  assign _zz_when_Axi4Crossbar_l600 = (io_slaves_0_r_fire && m0_axi_rlast);
  assign when_Axi4Crossbar_l600 = (io_slaves_0_ar_fire && (! _zz_when_Axi4Crossbar_l600));
  assign when_Axi4Crossbar_l602 = ((! io_slaves_0_ar_fire) && _zz_when_Axi4Crossbar_l600);
  always @(*) begin
    _zz_when_Axi4Crossbar_l579_8[0] = ((32'hc0000000 <= s0_axi_araddr) && (s0_axi_araddr < 32'hc0010000));
    _zz_when_Axi4Crossbar_l579_8[1] = ((32'hc0010000 <= s0_axi_araddr) && (s0_axi_araddr < 32'hc0020000));
    _zz_when_Axi4Crossbar_l579_8[2] = ((32'hc0020000 <= s0_axi_araddr) && (s0_axi_araddr < 32'hc0021000));
    _zz_when_Axi4Crossbar_l579_8[3] = ((32'hc0030000 <= s0_axi_araddr) && (s0_axi_araddr < 32'hc0031000));
  end

  always @(*) begin
    _zz_when_Axi4Crossbar_l579_7[0] = (s0_axi_arvalid && _zz_when_Axi4Crossbar_l579_8[1]);
    _zz_when_Axi4Crossbar_l579_7[1] = (s1_axi_arvalid && _zz_when_Axi4Crossbar_l579_9[1]);
  end

  always @(*) begin
    _zz_when_Axi4Crossbar_l579_9[0] = ((32'hc0000000 <= s1_axi_araddr) && (s1_axi_araddr < 32'hc0010000));
    _zz_when_Axi4Crossbar_l579_9[1] = ((32'hc0010000 <= s1_axi_araddr) && (s1_axi_araddr < 32'hc0020000));
    _zz_when_Axi4Crossbar_l579_9[2] = ((32'hc0020000 <= s1_axi_araddr) && (s1_axi_araddr < 32'hc0021000));
    _zz_when_Axi4Crossbar_l579_9[3] = ((32'hc0030000 <= s1_axi_araddr) && (s1_axi_araddr < 32'hc0031000));
  end

  always @(*) begin
    _zz_when_Axi4Crossbar_l167_25[0] = (rdRrPtr_1 <= 1'b0);
    _zz_when_Axi4Crossbar_l167_25[1] = (rdRrPtr_1 <= 1'b1);
  end

  assign _zz_when_Axi4Crossbar_l167_26 = (_zz_when_Axi4Crossbar_l579_7 & _zz_when_Axi4Crossbar_l167_25);
  assign _zz_when_Axi4Crossbar_l167_27 = _zz_when_Axi4Crossbar_l167_26;
  assign _zz_when_Axi4Crossbar_l167_28 = _zz_when_Axi4Crossbar_l579_7;
  assign _zz_when_Axi4Crossbar_l167_29 = ((|_zz_when_Axi4Crossbar_l167_26) ? (_zz_when_Axi4Crossbar_l167_27 & (~ _zz__zz_when_Axi4Crossbar_l167_29)) : (_zz_when_Axi4Crossbar_l167_28 & (~ _zz__zz_when_Axi4Crossbar_l167_29_1)));
  always @(*) begin
    _zz_m1_axi_arid = 1'b0;
    if(when_Axi4Crossbar_l167_10) begin
      _zz_m1_axi_arid = 1'b0;
    end
    if(when_Axi4Crossbar_l167_11) begin
      _zz_m1_axi_arid = 1'b1;
    end
  end

  assign when_Axi4Crossbar_l167_10 = _zz_when_Axi4Crossbar_l167_29[0];
  assign when_Axi4Crossbar_l167_11 = _zz_when_Axi4Crossbar_l167_29[1];
  assign when_Axi4Crossbar_l579_1 = ((_zz_when_Axi4Crossbar_l579_1 < 3'b100) && (|_zz_when_Axi4Crossbar_l579_7));
  assign when_Axi4Crossbar_l582_2 = (_zz_m1_axi_arid == 1'b0);
  assign when_Axi4Crossbar_l582_3 = (_zz_m1_axi_arid == 1'b1);
  assign io_slaves_1_ar_fire = (m1_axi_arvalid && m1_axi_arready);
  assign io_slaves_1_r_fire = (m1_axi_rvalid && m1_axi_rready);
  assign _zz_when_Axi4Crossbar_l600_1 = (io_slaves_1_r_fire && m1_axi_rlast);
  assign when_Axi4Crossbar_l600_1 = (io_slaves_1_ar_fire && (! _zz_when_Axi4Crossbar_l600_1));
  assign when_Axi4Crossbar_l602_1 = ((! io_slaves_1_ar_fire) && _zz_when_Axi4Crossbar_l600_1);
  always @(*) begin
    _zz_when_Axi4Crossbar_l579_11[0] = ((32'hc0000000 <= s0_axi_araddr) && (s0_axi_araddr < 32'hc0010000));
    _zz_when_Axi4Crossbar_l579_11[1] = ((32'hc0010000 <= s0_axi_araddr) && (s0_axi_araddr < 32'hc0020000));
    _zz_when_Axi4Crossbar_l579_11[2] = ((32'hc0020000 <= s0_axi_araddr) && (s0_axi_araddr < 32'hc0021000));
    _zz_when_Axi4Crossbar_l579_11[3] = ((32'hc0030000 <= s0_axi_araddr) && (s0_axi_araddr < 32'hc0031000));
  end

  always @(*) begin
    _zz_when_Axi4Crossbar_l579_10[0] = (s0_axi_arvalid && _zz_when_Axi4Crossbar_l579_11[2]);
    _zz_when_Axi4Crossbar_l579_10[1] = (s1_axi_arvalid && _zz_when_Axi4Crossbar_l579_12[2]);
  end

  always @(*) begin
    _zz_when_Axi4Crossbar_l579_12[0] = ((32'hc0000000 <= s1_axi_araddr) && (s1_axi_araddr < 32'hc0010000));
    _zz_when_Axi4Crossbar_l579_12[1] = ((32'hc0010000 <= s1_axi_araddr) && (s1_axi_araddr < 32'hc0020000));
    _zz_when_Axi4Crossbar_l579_12[2] = ((32'hc0020000 <= s1_axi_araddr) && (s1_axi_araddr < 32'hc0021000));
    _zz_when_Axi4Crossbar_l579_12[3] = ((32'hc0030000 <= s1_axi_araddr) && (s1_axi_araddr < 32'hc0031000));
  end

  always @(*) begin
    _zz_when_Axi4Crossbar_l167_30[0] = (rdRrPtr_2 <= 1'b0);
    _zz_when_Axi4Crossbar_l167_30[1] = (rdRrPtr_2 <= 1'b1);
  end

  assign _zz_when_Axi4Crossbar_l167_31 = (_zz_when_Axi4Crossbar_l579_10 & _zz_when_Axi4Crossbar_l167_30);
  assign _zz_when_Axi4Crossbar_l167_32 = _zz_when_Axi4Crossbar_l167_31;
  assign _zz_when_Axi4Crossbar_l167_33 = _zz_when_Axi4Crossbar_l579_10;
  assign _zz_when_Axi4Crossbar_l167_34 = ((|_zz_when_Axi4Crossbar_l167_31) ? (_zz_when_Axi4Crossbar_l167_32 & (~ _zz__zz_when_Axi4Crossbar_l167_34)) : (_zz_when_Axi4Crossbar_l167_33 & (~ _zz__zz_when_Axi4Crossbar_l167_34_1)));
  always @(*) begin
    _zz_m2_axi_arid = 1'b0;
    if(when_Axi4Crossbar_l167_12) begin
      _zz_m2_axi_arid = 1'b0;
    end
    if(when_Axi4Crossbar_l167_13) begin
      _zz_m2_axi_arid = 1'b1;
    end
  end

  assign when_Axi4Crossbar_l167_12 = _zz_when_Axi4Crossbar_l167_34[0];
  assign when_Axi4Crossbar_l167_13 = _zz_when_Axi4Crossbar_l167_34[1];
  assign when_Axi4Crossbar_l579_2 = ((_zz_when_Axi4Crossbar_l579_2 < 3'b100) && (|_zz_when_Axi4Crossbar_l579_10));
  assign when_Axi4Crossbar_l582_4 = (_zz_m2_axi_arid == 1'b0);
  assign when_Axi4Crossbar_l582_5 = (_zz_m2_axi_arid == 1'b1);
  assign io_slaves_2_ar_fire = (m2_axi_arvalid && m2_axi_arready);
  assign io_slaves_2_r_fire = (m2_axi_rvalid && m2_axi_rready);
  assign _zz_when_Axi4Crossbar_l600_2 = (io_slaves_2_r_fire && m2_axi_rlast);
  assign when_Axi4Crossbar_l600_2 = (io_slaves_2_ar_fire && (! _zz_when_Axi4Crossbar_l600_2));
  assign when_Axi4Crossbar_l602_2 = ((! io_slaves_2_ar_fire) && _zz_when_Axi4Crossbar_l600_2);
  always @(*) begin
    _zz_when_Axi4Crossbar_l579_14[0] = ((32'hc0000000 <= s0_axi_araddr) && (s0_axi_araddr < 32'hc0010000));
    _zz_when_Axi4Crossbar_l579_14[1] = ((32'hc0010000 <= s0_axi_araddr) && (s0_axi_araddr < 32'hc0020000));
    _zz_when_Axi4Crossbar_l579_14[2] = ((32'hc0020000 <= s0_axi_araddr) && (s0_axi_araddr < 32'hc0021000));
    _zz_when_Axi4Crossbar_l579_14[3] = ((32'hc0030000 <= s0_axi_araddr) && (s0_axi_araddr < 32'hc0031000));
  end

  always @(*) begin
    _zz_when_Axi4Crossbar_l579_13[0] = (s0_axi_arvalid && _zz_when_Axi4Crossbar_l579_14[3]);
    _zz_when_Axi4Crossbar_l579_13[1] = (s1_axi_arvalid && _zz_when_Axi4Crossbar_l579_15[3]);
  end

  always @(*) begin
    _zz_when_Axi4Crossbar_l579_15[0] = ((32'hc0000000 <= s1_axi_araddr) && (s1_axi_araddr < 32'hc0010000));
    _zz_when_Axi4Crossbar_l579_15[1] = ((32'hc0010000 <= s1_axi_araddr) && (s1_axi_araddr < 32'hc0020000));
    _zz_when_Axi4Crossbar_l579_15[2] = ((32'hc0020000 <= s1_axi_araddr) && (s1_axi_araddr < 32'hc0021000));
    _zz_when_Axi4Crossbar_l579_15[3] = ((32'hc0030000 <= s1_axi_araddr) && (s1_axi_araddr < 32'hc0031000));
  end

  always @(*) begin
    _zz_when_Axi4Crossbar_l167_35[0] = (rdRrPtr_3 <= 1'b0);
    _zz_when_Axi4Crossbar_l167_35[1] = (rdRrPtr_3 <= 1'b1);
  end

  assign _zz_when_Axi4Crossbar_l167_36 = (_zz_when_Axi4Crossbar_l579_13 & _zz_when_Axi4Crossbar_l167_35);
  assign _zz_when_Axi4Crossbar_l167_37 = _zz_when_Axi4Crossbar_l167_36;
  assign _zz_when_Axi4Crossbar_l167_38 = _zz_when_Axi4Crossbar_l579_13;
  assign _zz_when_Axi4Crossbar_l167_39 = ((|_zz_when_Axi4Crossbar_l167_36) ? (_zz_when_Axi4Crossbar_l167_37 & (~ _zz__zz_when_Axi4Crossbar_l167_39)) : (_zz_when_Axi4Crossbar_l167_38 & (~ _zz__zz_when_Axi4Crossbar_l167_39_1)));
  always @(*) begin
    _zz_m3_axi_arid = 1'b0;
    if(when_Axi4Crossbar_l167_14) begin
      _zz_m3_axi_arid = 1'b0;
    end
    if(when_Axi4Crossbar_l167_15) begin
      _zz_m3_axi_arid = 1'b1;
    end
  end

  assign when_Axi4Crossbar_l167_14 = _zz_when_Axi4Crossbar_l167_39[0];
  assign when_Axi4Crossbar_l167_15 = _zz_when_Axi4Crossbar_l167_39[1];
  assign when_Axi4Crossbar_l579_3 = ((_zz_when_Axi4Crossbar_l579_3 < 3'b100) && (|_zz_when_Axi4Crossbar_l579_13));
  assign when_Axi4Crossbar_l582_6 = (_zz_m3_axi_arid == 1'b0);
  assign when_Axi4Crossbar_l582_7 = (_zz_m3_axi_arid == 1'b1);
  assign io_slaves_3_ar_fire = (m3_axi_arvalid && m3_axi_arready);
  assign io_slaves_3_r_fire = (m3_axi_rvalid && m3_axi_rready);
  assign _zz_when_Axi4Crossbar_l600_3 = (io_slaves_3_r_fire && m3_axi_rlast);
  assign when_Axi4Crossbar_l600_3 = (io_slaves_3_ar_fire && (! _zz_when_Axi4Crossbar_l600_3));
  assign when_Axi4Crossbar_l602_3 = ((! io_slaves_3_ar_fire) && _zz_when_Axi4Crossbar_l600_3);
  always @(*) begin
    _zz_when_Axi4Crossbar_l620[0] = (m0_axi_rvalid && (_zz__zz_when_Axi4Crossbar_l620 == 1'b0));
    _zz_when_Axi4Crossbar_l620[1] = (m1_axi_rvalid && (_zz__zz_when_Axi4Crossbar_l620_1 == 1'b0));
    _zz_when_Axi4Crossbar_l620[2] = (m2_axi_rvalid && (_zz__zz_when_Axi4Crossbar_l620_2 == 1'b0));
    _zz_when_Axi4Crossbar_l620[3] = (m3_axi_rvalid && (_zz__zz_when_Axi4Crossbar_l620_3 == 1'b0));
  end

  assign _zz_when_Axi4Crossbar_l620_1 = _zz_when_Axi4Crossbar_l620;
  assign _zz_when_Axi4Crossbar_l620_2 = (_zz_when_Axi4Crossbar_l620_1 & (~ _zz__zz_when_Axi4Crossbar_l620_2_1));
  assign when_Axi4Crossbar_l620 = _zz_when_Axi4Crossbar_l620_2[0];
  assign when_Axi4Crossbar_l620_1 = _zz_when_Axi4Crossbar_l620_2[1];
  assign when_Axi4Crossbar_l620_2 = _zz_when_Axi4Crossbar_l620_2[2];
  assign when_Axi4Crossbar_l620_3 = _zz_when_Axi4Crossbar_l620_2[3];
  always @(*) begin
    _zz_when_Axi4Crossbar_l620_3[0] = (m0_axi_rvalid && (_zz__zz_when_Axi4Crossbar_l620_3_1 == 1'b1));
    _zz_when_Axi4Crossbar_l620_3[1] = (m1_axi_rvalid && (_zz__zz_when_Axi4Crossbar_l620_3_2 == 1'b1));
    _zz_when_Axi4Crossbar_l620_3[2] = (m2_axi_rvalid && (_zz__zz_when_Axi4Crossbar_l620_3_3 == 1'b1));
    _zz_when_Axi4Crossbar_l620_3[3] = (m3_axi_rvalid && (_zz__zz_when_Axi4Crossbar_l620_3_4 == 1'b1));
  end

  assign _zz_when_Axi4Crossbar_l620_4 = _zz_when_Axi4Crossbar_l620_3;
  assign _zz_when_Axi4Crossbar_l620_5 = (_zz_when_Axi4Crossbar_l620_4 & (~ _zz__zz_when_Axi4Crossbar_l620_5));
  assign when_Axi4Crossbar_l620_4 = _zz_when_Axi4Crossbar_l620_5[0];
  assign when_Axi4Crossbar_l620_5 = _zz_when_Axi4Crossbar_l620_5[1];
  assign when_Axi4Crossbar_l620_6 = _zz_when_Axi4Crossbar_l620_5[2];
  assign when_Axi4Crossbar_l620_7 = _zz_when_Axi4Crossbar_l620_5[3];
  always @(posedge aclk) begin
    if(!aresetn) begin
      wrRrPtr_0 <= 1'b0;
      wrRrPtr_1 <= 1'b0;
      wrRrPtr_2 <= 1'b0;
      wrRrPtr_3 <= 1'b0;
      rdRrPtr_0 <= 1'b0;
      rdRrPtr_1 <= 1'b0;
      rdRrPtr_2 <= 1'b0;
      rdRrPtr_3 <= 1'b0;
      _zz_when_Axi4Crossbar_l464 <= 3'b000;
      _zz_when_Axi4Crossbar_l464_1 <= 3'b000;
      _zz_when_Axi4Crossbar_l464_2 <= 3'b000;
      _zz_when_Axi4Crossbar_l464_3 <= 3'b000;
      _zz_9 <= 2'b00;
      _zz_10 <= 2'b00;
      _zz_11 <= 2'b00;
      _zz_12 <= 2'b00;
      _zz_when_Axi4Crossbar_l496 <= 2'b00;
      _zz_when_Axi4Crossbar_l496_1 <= 2'b00;
      _zz_when_Axi4Crossbar_l496_2 <= 2'b00;
      _zz_when_Axi4Crossbar_l496_3 <= 2'b00;
      _zz_when_Axi4Crossbar_l473 <= 3'b000;
      _zz_when_Axi4Crossbar_l473_1 <= 3'b000;
      _zz_when_Axi4Crossbar_l473_2 <= 3'b000;
      _zz_when_Axi4Crossbar_l473_3 <= 3'b000;
      _zz_when_Axi4Crossbar_l579 <= 3'b000;
      _zz_when_Axi4Crossbar_l579_1 <= 3'b000;
      _zz_when_Axi4Crossbar_l579_2 <= 3'b000;
      _zz_when_Axi4Crossbar_l579_3 <= 3'b000;
    end else begin
      if(io_slaves_0_aw_fire) begin
        _zz_9 <= ((_zz_9 == 2'b11) ? 2'b00 : _zz__zz_9);
        wrRrPtr_0 <= (_zz_m0_axi_awid + 1'b1);
      end
      if(when_Axi4Crossbar_l511) begin
        _zz_when_Axi4Crossbar_l496 <= ((_zz_when_Axi4Crossbar_l496 == 2'b11) ? 2'b00 : _zz__zz_when_Axi4Crossbar_l496);
      end
      if(when_Axi4Crossbar_l517) begin
        _zz_when_Axi4Crossbar_l473 <= (_zz_when_Axi4Crossbar_l473 + 3'b001);
      end else begin
        if(when_Axi4Crossbar_l519) begin
          _zz_when_Axi4Crossbar_l473 <= (_zz_when_Axi4Crossbar_l473 - 3'b001);
        end
      end
      if(when_Axi4Crossbar_l526) begin
        _zz_when_Axi4Crossbar_l464 <= (_zz_when_Axi4Crossbar_l464 + 3'b001);
      end else begin
        if(when_Axi4Crossbar_l528) begin
          _zz_when_Axi4Crossbar_l464 <= (_zz_when_Axi4Crossbar_l464 - 3'b001);
        end
      end
      if(io_slaves_1_aw_fire) begin
        _zz_10 <= ((_zz_10 == 2'b11) ? 2'b00 : _zz__zz_10);
        wrRrPtr_1 <= (_zz_m1_axi_awid + 1'b1);
      end
      if(when_Axi4Crossbar_l511_1) begin
        _zz_when_Axi4Crossbar_l496_1 <= ((_zz_when_Axi4Crossbar_l496_1 == 2'b11) ? 2'b00 : _zz__zz_when_Axi4Crossbar_l496_1);
      end
      if(when_Axi4Crossbar_l517_1) begin
        _zz_when_Axi4Crossbar_l473_1 <= (_zz_when_Axi4Crossbar_l473_1 + 3'b001);
      end else begin
        if(when_Axi4Crossbar_l519_1) begin
          _zz_when_Axi4Crossbar_l473_1 <= (_zz_when_Axi4Crossbar_l473_1 - 3'b001);
        end
      end
      if(when_Axi4Crossbar_l526_1) begin
        _zz_when_Axi4Crossbar_l464_1 <= (_zz_when_Axi4Crossbar_l464_1 + 3'b001);
      end else begin
        if(when_Axi4Crossbar_l528_1) begin
          _zz_when_Axi4Crossbar_l464_1 <= (_zz_when_Axi4Crossbar_l464_1 - 3'b001);
        end
      end
      if(io_slaves_2_aw_fire) begin
        _zz_11 <= ((_zz_11 == 2'b11) ? 2'b00 : _zz__zz_11);
        wrRrPtr_2 <= (_zz_m2_axi_awid + 1'b1);
      end
      if(when_Axi4Crossbar_l511_2) begin
        _zz_when_Axi4Crossbar_l496_2 <= ((_zz_when_Axi4Crossbar_l496_2 == 2'b11) ? 2'b00 : _zz__zz_when_Axi4Crossbar_l496_2);
      end
      if(when_Axi4Crossbar_l517_2) begin
        _zz_when_Axi4Crossbar_l473_2 <= (_zz_when_Axi4Crossbar_l473_2 + 3'b001);
      end else begin
        if(when_Axi4Crossbar_l519_2) begin
          _zz_when_Axi4Crossbar_l473_2 <= (_zz_when_Axi4Crossbar_l473_2 - 3'b001);
        end
      end
      if(when_Axi4Crossbar_l526_2) begin
        _zz_when_Axi4Crossbar_l464_2 <= (_zz_when_Axi4Crossbar_l464_2 + 3'b001);
      end else begin
        if(when_Axi4Crossbar_l528_2) begin
          _zz_when_Axi4Crossbar_l464_2 <= (_zz_when_Axi4Crossbar_l464_2 - 3'b001);
        end
      end
      if(io_slaves_3_aw_fire) begin
        _zz_12 <= ((_zz_12 == 2'b11) ? 2'b00 : _zz__zz_12);
        wrRrPtr_3 <= (_zz_m3_axi_awid + 1'b1);
      end
      if(when_Axi4Crossbar_l511_3) begin
        _zz_when_Axi4Crossbar_l496_3 <= ((_zz_when_Axi4Crossbar_l496_3 == 2'b11) ? 2'b00 : _zz__zz_when_Axi4Crossbar_l496_3);
      end
      if(when_Axi4Crossbar_l517_3) begin
        _zz_when_Axi4Crossbar_l473_3 <= (_zz_when_Axi4Crossbar_l473_3 + 3'b001);
      end else begin
        if(when_Axi4Crossbar_l519_3) begin
          _zz_when_Axi4Crossbar_l473_3 <= (_zz_when_Axi4Crossbar_l473_3 - 3'b001);
        end
      end
      if(when_Axi4Crossbar_l526_3) begin
        _zz_when_Axi4Crossbar_l464_3 <= (_zz_when_Axi4Crossbar_l464_3 + 3'b001);
      end else begin
        if(when_Axi4Crossbar_l528_3) begin
          _zz_when_Axi4Crossbar_l464_3 <= (_zz_when_Axi4Crossbar_l464_3 - 3'b001);
        end
      end
      if(io_slaves_0_ar_fire) begin
        rdRrPtr_0 <= (_zz_m0_axi_arid + 1'b1);
      end
      if(when_Axi4Crossbar_l600) begin
        _zz_when_Axi4Crossbar_l579 <= (_zz_when_Axi4Crossbar_l579 + 3'b001);
      end else begin
        if(when_Axi4Crossbar_l602) begin
          _zz_when_Axi4Crossbar_l579 <= (_zz_when_Axi4Crossbar_l579 - 3'b001);
        end
      end
      if(io_slaves_1_ar_fire) begin
        rdRrPtr_1 <= (_zz_m1_axi_arid + 1'b1);
      end
      if(when_Axi4Crossbar_l600_1) begin
        _zz_when_Axi4Crossbar_l579_1 <= (_zz_when_Axi4Crossbar_l579_1 + 3'b001);
      end else begin
        if(when_Axi4Crossbar_l602_1) begin
          _zz_when_Axi4Crossbar_l579_1 <= (_zz_when_Axi4Crossbar_l579_1 - 3'b001);
        end
      end
      if(io_slaves_2_ar_fire) begin
        rdRrPtr_2 <= (_zz_m2_axi_arid + 1'b1);
      end
      if(when_Axi4Crossbar_l600_2) begin
        _zz_when_Axi4Crossbar_l579_2 <= (_zz_when_Axi4Crossbar_l579_2 + 3'b001);
      end else begin
        if(when_Axi4Crossbar_l602_2) begin
          _zz_when_Axi4Crossbar_l579_2 <= (_zz_when_Axi4Crossbar_l579_2 - 3'b001);
        end
      end
      if(io_slaves_3_ar_fire) begin
        rdRrPtr_3 <= (_zz_m3_axi_arid + 1'b1);
      end
      if(when_Axi4Crossbar_l600_3) begin
        _zz_when_Axi4Crossbar_l579_3 <= (_zz_when_Axi4Crossbar_l579_3 + 3'b001);
      end else begin
        if(when_Axi4Crossbar_l602_3) begin
          _zz_when_Axi4Crossbar_l579_3 <= (_zz_when_Axi4Crossbar_l579_3 - 3'b001);
        end
      end
    end
  end


endmodule
