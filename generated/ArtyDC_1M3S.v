// Copyright (c) 2026 Leonardo Capossio — bard0 design  hello@bard0.com
// SPDX-License-Identifier: MIT
// Generator : SpinalHDL v1.10.1    git head : 2527c7c6b0fb0f95e5e1a5722a0be732b364ce43
// Component : AxiZeroMixedTop
// Git hash  : 8db1e12afd6331a56d62eaf0efa2ba206ccbbf46

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
  output wire          m0_axi_awvalid,
  input  wire          m0_axi_awready,
  output wire [31:0]   m0_axi_awaddr,
  output wire [0:0]    m0_axi_awid,
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
  input  wire [0:0]    m0_axi_bid,
  input  wire [1:0]    m0_axi_bresp,
  output wire          m0_axi_arvalid,
  input  wire          m0_axi_arready,
  output wire [31:0]   m0_axi_araddr,
  output wire [0:0]    m0_axi_arid,
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
  input  wire [0:0]    m0_axi_rid,
  input  wire [1:0]    m0_axi_rresp,
  input  wire          m0_axi_rlast,
  output wire          m1_axi_awvalid,
  input  wire          m1_axi_awready,
  output wire [31:0]   m1_axi_awaddr,
  output wire [0:0]    m1_axi_awid,
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
  input  wire [0:0]    m1_axi_bid,
  input  wire [1:0]    m1_axi_bresp,
  output wire          m1_axi_arvalid,
  input  wire          m1_axi_arready,
  output wire [31:0]   m1_axi_araddr,
  output wire [0:0]    m1_axi_arid,
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
  input  wire [0:0]    m1_axi_rid,
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
  input  wire          aclk,
  input  wire          aresetn
);

  wire                xbar_io_masters_0_ar_ready;
  wire                xbar_io_masters_0_aw_ready;
  wire                xbar_io_masters_0_w_ready;
  wire                xbar_io_masters_0_r_valid;
  wire       [31:0]   xbar_io_masters_0_r_payload_data;
  wire       [0:0]    xbar_io_masters_0_r_payload_id;
  wire       [1:0]    xbar_io_masters_0_r_payload_resp;
  wire                xbar_io_masters_0_r_payload_last;
  wire                xbar_io_masters_0_b_valid;
  wire       [0:0]    xbar_io_masters_0_b_payload_id;
  wire       [1:0]    xbar_io_masters_0_b_payload_resp;
  wire                xbar_io_slaves_0_ar_valid;
  wire       [31:0]   xbar_io_slaves_0_ar_payload_addr;
  wire       [0:0]    xbar_io_slaves_0_ar_payload_id;
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
  wire       [0:0]    xbar_io_slaves_0_aw_payload_id;
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
  wire       [0:0]    xbar_io_slaves_1_ar_payload_id;
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
  wire       [0:0]    xbar_io_slaves_1_aw_payload_id;
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
  wire                xbar_io_slaves_2_ar_valid;
  wire       [31:0]   xbar_io_slaves_2_ar_payload_addr;
  wire       [0:0]    xbar_io_slaves_2_ar_payload_id;
  wire       [3:0]    xbar_io_slaves_2_ar_payload_region;
  wire       [7:0]    xbar_io_slaves_2_ar_payload_len;
  wire       [2:0]    xbar_io_slaves_2_ar_payload_size;
  wire       [1:0]    xbar_io_slaves_2_ar_payload_burst;
  wire       [0:0]    xbar_io_slaves_2_ar_payload_lock;
  wire       [3:0]    xbar_io_slaves_2_ar_payload_cache;
  wire       [3:0]    xbar_io_slaves_2_ar_payload_qos;
  wire       [2:0]    xbar_io_slaves_2_ar_payload_prot;
  wire                xbar_io_slaves_2_aw_valid;
  wire       [31:0]   xbar_io_slaves_2_aw_payload_addr;
  wire       [0:0]    xbar_io_slaves_2_aw_payload_id;
  wire       [3:0]    xbar_io_slaves_2_aw_payload_region;
  wire       [7:0]    xbar_io_slaves_2_aw_payload_len;
  wire       [2:0]    xbar_io_slaves_2_aw_payload_size;
  wire       [1:0]    xbar_io_slaves_2_aw_payload_burst;
  wire       [0:0]    xbar_io_slaves_2_aw_payload_lock;
  wire       [3:0]    xbar_io_slaves_2_aw_payload_cache;
  wire       [3:0]    xbar_io_slaves_2_aw_payload_qos;
  wire       [2:0]    xbar_io_slaves_2_aw_payload_prot;
  wire                xbar_io_slaves_2_w_valid;
  wire       [31:0]   xbar_io_slaves_2_w_payload_data;
  wire       [3:0]    xbar_io_slaves_2_w_payload_strb;
  wire                xbar_io_slaves_2_w_payload_last;
  wire                xbar_io_slaves_2_r_ready;
  wire                xbar_io_slaves_2_b_ready;
  wire                axi4FullToLiteAdapter_1_io_full_ar_ready;
  wire                axi4FullToLiteAdapter_1_io_full_aw_ready;
  wire                axi4FullToLiteAdapter_1_io_full_w_ready;
  wire                axi4FullToLiteAdapter_1_io_full_r_valid;
  wire       [31:0]   axi4FullToLiteAdapter_1_io_full_r_payload_data;
  wire       [0:0]    axi4FullToLiteAdapter_1_io_full_r_payload_id;
  wire       [1:0]    axi4FullToLiteAdapter_1_io_full_r_payload_resp;
  wire                axi4FullToLiteAdapter_1_io_full_r_payload_last;
  wire                axi4FullToLiteAdapter_1_io_full_b_valid;
  wire       [0:0]    axi4FullToLiteAdapter_1_io_full_b_payload_id;
  wire       [1:0]    axi4FullToLiteAdapter_1_io_full_b_payload_resp;
  wire                axi4FullToLiteAdapter_1_io_lite_ar_valid;
  wire       [31:0]   axi4FullToLiteAdapter_1_io_lite_ar_payload_addr;
  wire       [2:0]    axi4FullToLiteAdapter_1_io_lite_ar_payload_prot;
  wire                axi4FullToLiteAdapter_1_io_lite_aw_valid;
  wire       [31:0]   axi4FullToLiteAdapter_1_io_lite_aw_payload_addr;
  wire       [2:0]    axi4FullToLiteAdapter_1_io_lite_aw_payload_prot;
  wire                axi4FullToLiteAdapter_1_io_lite_w_valid;
  wire       [31:0]   axi4FullToLiteAdapter_1_io_lite_w_payload_data;
  wire       [3:0]    axi4FullToLiteAdapter_1_io_lite_w_payload_strb;
  wire                axi4FullToLiteAdapter_1_io_lite_r_ready;
  wire                axi4FullToLiteAdapter_1_io_lite_b_ready;

  Axi4Crossbar xbar (
    .s0_axi_awvalid          (s0_axi_awvalid                               ), //i
    .s0_axi_awready          (xbar_io_masters_0_aw_ready                          ), //o
    .s0_axi_awaddr   (s0_axi_awaddr[31:0]                  ), //i
    .s0_axi_awid     (s0_axi_awid                          ), //i
    .s0_axi_awregion (s0_axi_awregion[3:0]                 ), //i
    .s0_axi_awlen    (s0_axi_awlen[7:0]                    ), //i
    .s0_axi_awsize   (s0_axi_awsize[2:0]                   ), //i
    .s0_axi_awburst  (s0_axi_awburst[1:0]                  ), //i
    .s0_axi_awlock   (s0_axi_awlock                        ), //i
    .s0_axi_awcache  (s0_axi_awcache[3:0]                  ), //i
    .s0_axi_awqos    (s0_axi_awqos[3:0]                    ), //i
    .s0_axi_awprot   (s0_axi_awprot[2:0]                   ), //i
    .s0_axi_wvalid           (s0_axi_wvalid                                ), //i
    .s0_axi_wready           (xbar_io_masters_0_w_ready                           ), //o
    .s0_axi_wdata    (s0_axi_wdata[31:0]                   ), //i
    .s0_axi_wstrb    (s0_axi_wstrb[3:0]                    ), //i
    .s0_axi_wlast    (s0_axi_wlast                         ), //i
    .s0_axi_bvalid           (xbar_io_masters_0_b_valid                           ), //o
    .s0_axi_bready           (s0_axi_bready                                ), //i
    .s0_axi_bid      (xbar_io_masters_0_b_payload_id                      ), //o
    .s0_axi_bresp    (xbar_io_masters_0_b_payload_resp[1:0]               ), //o
    .s0_axi_arvalid          (s0_axi_arvalid                               ), //i
    .s0_axi_arready          (xbar_io_masters_0_ar_ready                          ), //o
    .s0_axi_araddr   (s0_axi_araddr[31:0]                  ), //i
    .s0_axi_arid     (s0_axi_arid                          ), //i
    .s0_axi_arregion (s0_axi_arregion[3:0]                 ), //i
    .s0_axi_arlen    (s0_axi_arlen[7:0]                    ), //i
    .s0_axi_arsize   (s0_axi_arsize[2:0]                   ), //i
    .s0_axi_arburst  (s0_axi_arburst[1:0]                  ), //i
    .s0_axi_arlock   (s0_axi_arlock                        ), //i
    .s0_axi_arcache  (s0_axi_arcache[3:0]                  ), //i
    .s0_axi_arqos    (s0_axi_arqos[3:0]                    ), //i
    .s0_axi_arprot   (s0_axi_arprot[2:0]                   ), //i
    .s0_axi_rvalid           (xbar_io_masters_0_r_valid                           ), //o
    .s0_axi_rready           (s0_axi_rready                                ), //i
    .s0_axi_rdata    (xbar_io_masters_0_r_payload_data[31:0]              ), //o
    .s0_axi_rid      (xbar_io_masters_0_r_payload_id                      ), //o
    .s0_axi_rresp    (xbar_io_masters_0_r_payload_resp[1:0]               ), //o
    .s0_axi_rlast    (xbar_io_masters_0_r_payload_last                    ), //o
    .m0_axi_awvalid           (xbar_io_slaves_0_aw_valid                           ), //o
    .m0_axi_awready           (m0_axi_awready                                ), //i
    .m0_axi_awaddr    (xbar_io_slaves_0_aw_payload_addr[31:0]              ), //o
    .m0_axi_awid      (xbar_io_slaves_0_aw_payload_id                      ), //o
    .m0_axi_awregion  (xbar_io_slaves_0_aw_payload_region[3:0]             ), //o
    .m0_axi_awlen     (xbar_io_slaves_0_aw_payload_len[7:0]                ), //o
    .m0_axi_awsize    (xbar_io_slaves_0_aw_payload_size[2:0]               ), //o
    .m0_axi_awburst   (xbar_io_slaves_0_aw_payload_burst[1:0]              ), //o
    .m0_axi_awlock    (xbar_io_slaves_0_aw_payload_lock                    ), //o
    .m0_axi_awcache   (xbar_io_slaves_0_aw_payload_cache[3:0]              ), //o
    .m0_axi_awqos     (xbar_io_slaves_0_aw_payload_qos[3:0]                ), //o
    .m0_axi_awprot    (xbar_io_slaves_0_aw_payload_prot[2:0]               ), //o
    .m0_axi_wvalid            (xbar_io_slaves_0_w_valid                            ), //o
    .m0_axi_wready            (m0_axi_wready                                 ), //i
    .m0_axi_wdata     (xbar_io_slaves_0_w_payload_data[31:0]               ), //o
    .m0_axi_wstrb     (xbar_io_slaves_0_w_payload_strb[3:0]                ), //o
    .m0_axi_wlast     (xbar_io_slaves_0_w_payload_last                     ), //o
    .m0_axi_bvalid            (m0_axi_bvalid                                 ), //i
    .m0_axi_bready            (xbar_io_slaves_0_b_ready                            ), //o
    .m0_axi_bid       (m0_axi_bid                            ), //i
    .m0_axi_bresp     (m0_axi_bresp[1:0]                     ), //i
    .m0_axi_arvalid           (xbar_io_slaves_0_ar_valid                           ), //o
    .m0_axi_arready           (m0_axi_arready                                ), //i
    .m0_axi_araddr    (xbar_io_slaves_0_ar_payload_addr[31:0]              ), //o
    .m0_axi_arid      (xbar_io_slaves_0_ar_payload_id                      ), //o
    .m0_axi_arregion  (xbar_io_slaves_0_ar_payload_region[3:0]             ), //o
    .m0_axi_arlen     (xbar_io_slaves_0_ar_payload_len[7:0]                ), //o
    .m0_axi_arsize    (xbar_io_slaves_0_ar_payload_size[2:0]               ), //o
    .m0_axi_arburst   (xbar_io_slaves_0_ar_payload_burst[1:0]              ), //o
    .m0_axi_arlock    (xbar_io_slaves_0_ar_payload_lock                    ), //o
    .m0_axi_arcache   (xbar_io_slaves_0_ar_payload_cache[3:0]              ), //o
    .m0_axi_arqos     (xbar_io_slaves_0_ar_payload_qos[3:0]                ), //o
    .m0_axi_arprot    (xbar_io_slaves_0_ar_payload_prot[2:0]               ), //o
    .m0_axi_rvalid            (m0_axi_rvalid                                 ), //i
    .m0_axi_rready            (xbar_io_slaves_0_r_ready                            ), //o
    .m0_axi_rdata     (m0_axi_rdata[31:0]                    ), //i
    .m0_axi_rid       (m0_axi_rid                            ), //i
    .m0_axi_rresp     (m0_axi_rresp[1:0]                     ), //i
    .m0_axi_rlast     (m0_axi_rlast                          ), //i
    .m1_axi_awvalid           (xbar_io_slaves_1_aw_valid                           ), //o
    .m1_axi_awready           (m1_axi_awready                                ), //i
    .m1_axi_awaddr    (xbar_io_slaves_1_aw_payload_addr[31:0]              ), //o
    .m1_axi_awid      (xbar_io_slaves_1_aw_payload_id                      ), //o
    .m1_axi_awregion  (xbar_io_slaves_1_aw_payload_region[3:0]             ), //o
    .m1_axi_awlen     (xbar_io_slaves_1_aw_payload_len[7:0]                ), //o
    .m1_axi_awsize    (xbar_io_slaves_1_aw_payload_size[2:0]               ), //o
    .m1_axi_awburst   (xbar_io_slaves_1_aw_payload_burst[1:0]              ), //o
    .m1_axi_awlock    (xbar_io_slaves_1_aw_payload_lock                    ), //o
    .m1_axi_awcache   (xbar_io_slaves_1_aw_payload_cache[3:0]              ), //o
    .m1_axi_awqos     (xbar_io_slaves_1_aw_payload_qos[3:0]                ), //o
    .m1_axi_awprot    (xbar_io_slaves_1_aw_payload_prot[2:0]               ), //o
    .m1_axi_wvalid            (xbar_io_slaves_1_w_valid                            ), //o
    .m1_axi_wready            (m1_axi_wready                                 ), //i
    .m1_axi_wdata     (xbar_io_slaves_1_w_payload_data[31:0]               ), //o
    .m1_axi_wstrb     (xbar_io_slaves_1_w_payload_strb[3:0]                ), //o
    .m1_axi_wlast     (xbar_io_slaves_1_w_payload_last                     ), //o
    .m1_axi_bvalid            (m1_axi_bvalid                                 ), //i
    .m1_axi_bready            (xbar_io_slaves_1_b_ready                            ), //o
    .m1_axi_bid       (m1_axi_bid                            ), //i
    .m1_axi_bresp     (m1_axi_bresp[1:0]                     ), //i
    .m1_axi_arvalid           (xbar_io_slaves_1_ar_valid                           ), //o
    .m1_axi_arready           (m1_axi_arready                                ), //i
    .m1_axi_araddr    (xbar_io_slaves_1_ar_payload_addr[31:0]              ), //o
    .m1_axi_arid      (xbar_io_slaves_1_ar_payload_id                      ), //o
    .m1_axi_arregion  (xbar_io_slaves_1_ar_payload_region[3:0]             ), //o
    .m1_axi_arlen     (xbar_io_slaves_1_ar_payload_len[7:0]                ), //o
    .m1_axi_arsize    (xbar_io_slaves_1_ar_payload_size[2:0]               ), //o
    .m1_axi_arburst   (xbar_io_slaves_1_ar_payload_burst[1:0]              ), //o
    .m1_axi_arlock    (xbar_io_slaves_1_ar_payload_lock                    ), //o
    .m1_axi_arcache   (xbar_io_slaves_1_ar_payload_cache[3:0]              ), //o
    .m1_axi_arqos     (xbar_io_slaves_1_ar_payload_qos[3:0]                ), //o
    .m1_axi_arprot    (xbar_io_slaves_1_ar_payload_prot[2:0]               ), //o
    .m1_axi_rvalid            (m1_axi_rvalid                                 ), //i
    .m1_axi_rready            (xbar_io_slaves_1_r_ready                            ), //o
    .m1_axi_rdata     (m1_axi_rdata[31:0]                    ), //i
    .m1_axi_rid       (m1_axi_rid                            ), //i
    .m1_axi_rresp     (m1_axi_rresp[1:0]                     ), //i
    .m1_axi_rlast     (m1_axi_rlast                          ), //i
    .m2_axi_awvalid           (xbar_io_slaves_2_aw_valid                           ), //o
    .m2_axi_awready           (axi4FullToLiteAdapter_1_io_full_aw_ready            ), //i
    .m2_axi_awaddr    (xbar_io_slaves_2_aw_payload_addr[31:0]              ), //o
    .m2_axi_awid      (xbar_io_slaves_2_aw_payload_id                      ), //o
    .m2_axi_awregion  (xbar_io_slaves_2_aw_payload_region[3:0]             ), //o
    .m2_axi_awlen     (xbar_io_slaves_2_aw_payload_len[7:0]                ), //o
    .m2_axi_awsize    (xbar_io_slaves_2_aw_payload_size[2:0]               ), //o
    .m2_axi_awburst   (xbar_io_slaves_2_aw_payload_burst[1:0]              ), //o
    .m2_axi_awlock    (xbar_io_slaves_2_aw_payload_lock                    ), //o
    .m2_axi_awcache   (xbar_io_slaves_2_aw_payload_cache[3:0]              ), //o
    .m2_axi_awqos     (xbar_io_slaves_2_aw_payload_qos[3:0]                ), //o
    .m2_axi_awprot    (xbar_io_slaves_2_aw_payload_prot[2:0]               ), //o
    .m2_axi_wvalid            (xbar_io_slaves_2_w_valid                            ), //o
    .m2_axi_wready            (axi4FullToLiteAdapter_1_io_full_w_ready             ), //i
    .m2_axi_wdata     (xbar_io_slaves_2_w_payload_data[31:0]               ), //o
    .m2_axi_wstrb     (xbar_io_slaves_2_w_payload_strb[3:0]                ), //o
    .m2_axi_wlast     (xbar_io_slaves_2_w_payload_last                     ), //o
    .m2_axi_bvalid            (axi4FullToLiteAdapter_1_io_full_b_valid             ), //i
    .m2_axi_bready            (xbar_io_slaves_2_b_ready                            ), //o
    .m2_axi_bid       (axi4FullToLiteAdapter_1_io_full_b_payload_id        ), //i
    .m2_axi_bresp     (axi4FullToLiteAdapter_1_io_full_b_payload_resp[1:0] ), //i
    .m2_axi_arvalid           (xbar_io_slaves_2_ar_valid                           ), //o
    .m2_axi_arready           (axi4FullToLiteAdapter_1_io_full_ar_ready            ), //i
    .m2_axi_araddr    (xbar_io_slaves_2_ar_payload_addr[31:0]              ), //o
    .m2_axi_arid      (xbar_io_slaves_2_ar_payload_id                      ), //o
    .m2_axi_arregion  (xbar_io_slaves_2_ar_payload_region[3:0]             ), //o
    .m2_axi_arlen     (xbar_io_slaves_2_ar_payload_len[7:0]                ), //o
    .m2_axi_arsize    (xbar_io_slaves_2_ar_payload_size[2:0]               ), //o
    .m2_axi_arburst   (xbar_io_slaves_2_ar_payload_burst[1:0]              ), //o
    .m2_axi_arlock    (xbar_io_slaves_2_ar_payload_lock                    ), //o
    .m2_axi_arcache   (xbar_io_slaves_2_ar_payload_cache[3:0]              ), //o
    .m2_axi_arqos     (xbar_io_slaves_2_ar_payload_qos[3:0]                ), //o
    .m2_axi_arprot    (xbar_io_slaves_2_ar_payload_prot[2:0]               ), //o
    .m2_axi_rvalid            (axi4FullToLiteAdapter_1_io_full_r_valid             ), //i
    .m2_axi_rready            (xbar_io_slaves_2_r_ready                            ), //o
    .m2_axi_rdata     (axi4FullToLiteAdapter_1_io_full_r_payload_data[31:0]), //i
    .m2_axi_rid       (axi4FullToLiteAdapter_1_io_full_r_payload_id        ), //i
    .m2_axi_rresp     (axi4FullToLiteAdapter_1_io_full_r_payload_resp[1:0] ), //i
    .m2_axi_rlast     (axi4FullToLiteAdapter_1_io_full_r_payload_last      ), //i
    .aclk                            (aclk                                                 ), //i
    .aresetn                         (aresetn                                              )  //i
  );
  Axi4FullToLiteAdapter axi4FullToLiteAdapter_1 (
    .io_full_aw_valid          (xbar_io_slaves_2_aw_valid                            ), //i
    .io_full_aw_ready          (axi4FullToLiteAdapter_1_io_full_aw_ready             ), //o
    .io_full_aw_payload_addr   (xbar_io_slaves_2_aw_payload_addr[31:0]               ), //i
    .io_full_aw_payload_id     (xbar_io_slaves_2_aw_payload_id                       ), //i
    .io_full_aw_payload_region (xbar_io_slaves_2_aw_payload_region[3:0]              ), //i
    .io_full_aw_payload_len    (xbar_io_slaves_2_aw_payload_len[7:0]                 ), //i
    .io_full_aw_payload_size   (xbar_io_slaves_2_aw_payload_size[2:0]                ), //i
    .io_full_aw_payload_burst  (xbar_io_slaves_2_aw_payload_burst[1:0]               ), //i
    .io_full_aw_payload_lock   (xbar_io_slaves_2_aw_payload_lock                     ), //i
    .io_full_aw_payload_cache  (xbar_io_slaves_2_aw_payload_cache[3:0]               ), //i
    .io_full_aw_payload_qos    (xbar_io_slaves_2_aw_payload_qos[3:0]                 ), //i
    .io_full_aw_payload_prot   (xbar_io_slaves_2_aw_payload_prot[2:0]                ), //i
    .io_full_w_valid           (xbar_io_slaves_2_w_valid                             ), //i
    .io_full_w_ready           (axi4FullToLiteAdapter_1_io_full_w_ready              ), //o
    .io_full_w_payload_data    (xbar_io_slaves_2_w_payload_data[31:0]                ), //i
    .io_full_w_payload_strb    (xbar_io_slaves_2_w_payload_strb[3:0]                 ), //i
    .io_full_w_payload_last    (xbar_io_slaves_2_w_payload_last                      ), //i
    .io_full_b_valid           (axi4FullToLiteAdapter_1_io_full_b_valid              ), //o
    .io_full_b_ready           (xbar_io_slaves_2_b_ready                             ), //i
    .io_full_b_payload_id      (axi4FullToLiteAdapter_1_io_full_b_payload_id         ), //o
    .io_full_b_payload_resp    (axi4FullToLiteAdapter_1_io_full_b_payload_resp[1:0]  ), //o
    .io_full_ar_valid          (xbar_io_slaves_2_ar_valid                            ), //i
    .io_full_ar_ready          (axi4FullToLiteAdapter_1_io_full_ar_ready             ), //o
    .io_full_ar_payload_addr   (xbar_io_slaves_2_ar_payload_addr[31:0]               ), //i
    .io_full_ar_payload_id     (xbar_io_slaves_2_ar_payload_id                       ), //i
    .io_full_ar_payload_region (xbar_io_slaves_2_ar_payload_region[3:0]              ), //i
    .io_full_ar_payload_len    (xbar_io_slaves_2_ar_payload_len[7:0]                 ), //i
    .io_full_ar_payload_size   (xbar_io_slaves_2_ar_payload_size[2:0]                ), //i
    .io_full_ar_payload_burst  (xbar_io_slaves_2_ar_payload_burst[1:0]               ), //i
    .io_full_ar_payload_lock   (xbar_io_slaves_2_ar_payload_lock                     ), //i
    .io_full_ar_payload_cache  (xbar_io_slaves_2_ar_payload_cache[3:0]               ), //i
    .io_full_ar_payload_qos    (xbar_io_slaves_2_ar_payload_qos[3:0]                 ), //i
    .io_full_ar_payload_prot   (xbar_io_slaves_2_ar_payload_prot[2:0]                ), //i
    .io_full_r_valid           (axi4FullToLiteAdapter_1_io_full_r_valid              ), //o
    .io_full_r_ready           (xbar_io_slaves_2_r_ready                             ), //i
    .io_full_r_payload_data    (axi4FullToLiteAdapter_1_io_full_r_payload_data[31:0] ), //o
    .io_full_r_payload_id      (axi4FullToLiteAdapter_1_io_full_r_payload_id         ), //o
    .io_full_r_payload_resp    (axi4FullToLiteAdapter_1_io_full_r_payload_resp[1:0]  ), //o
    .io_full_r_payload_last    (axi4FullToLiteAdapter_1_io_full_r_payload_last       ), //o
    .io_lite_aw_valid          (axi4FullToLiteAdapter_1_io_lite_aw_valid             ), //o
    .io_lite_aw_ready          (m2_axi_awready                                 ), //i
    .io_lite_aw_payload_addr   (axi4FullToLiteAdapter_1_io_lite_aw_payload_addr[31:0]), //o
    .io_lite_aw_payload_prot   (axi4FullToLiteAdapter_1_io_lite_aw_payload_prot[2:0] ), //o
    .io_lite_w_valid           (axi4FullToLiteAdapter_1_io_lite_w_valid              ), //o
    .io_lite_w_ready           (m2_axi_wready                                  ), //i
    .io_lite_w_payload_data    (axi4FullToLiteAdapter_1_io_lite_w_payload_data[31:0] ), //o
    .io_lite_w_payload_strb    (axi4FullToLiteAdapter_1_io_lite_w_payload_strb[3:0]  ), //o
    .io_lite_b_valid           (m2_axi_bvalid                                  ), //i
    .io_lite_b_ready           (axi4FullToLiteAdapter_1_io_lite_b_ready              ), //o
    .io_lite_b_payload_resp    (m2_axi_bresp[1:0]                      ), //i
    .io_lite_ar_valid          (axi4FullToLiteAdapter_1_io_lite_ar_valid             ), //o
    .io_lite_ar_ready          (m2_axi_arready                                 ), //i
    .io_lite_ar_payload_addr   (axi4FullToLiteAdapter_1_io_lite_ar_payload_addr[31:0]), //o
    .io_lite_ar_payload_prot   (axi4FullToLiteAdapter_1_io_lite_ar_payload_prot[2:0] ), //o
    .io_lite_r_valid           (m2_axi_rvalid                                  ), //i
    .io_lite_r_ready           (axi4FullToLiteAdapter_1_io_lite_r_ready              ), //o
    .io_lite_r_payload_data    (m2_axi_rdata[31:0]                     ), //i
    .io_lite_r_payload_resp    (m2_axi_rresp[1:0]                      ), //i
    .aclk                       (aclk                                                  ), //i
    .aresetn                    (aresetn                                               )  //i
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
  assign m2_axi_awvalid = axi4FullToLiteAdapter_1_io_lite_aw_valid;
  assign m2_axi_awaddr = axi4FullToLiteAdapter_1_io_lite_aw_payload_addr;
  assign m2_axi_awprot = axi4FullToLiteAdapter_1_io_lite_aw_payload_prot;
  assign m2_axi_wvalid = axi4FullToLiteAdapter_1_io_lite_w_valid;
  assign m2_axi_wdata = axi4FullToLiteAdapter_1_io_lite_w_payload_data;
  assign m2_axi_wstrb = axi4FullToLiteAdapter_1_io_lite_w_payload_strb;
  assign m2_axi_bready = axi4FullToLiteAdapter_1_io_lite_b_ready;
  assign m2_axi_arvalid = axi4FullToLiteAdapter_1_io_lite_ar_valid;
  assign m2_axi_araddr = axi4FullToLiteAdapter_1_io_lite_ar_payload_addr;
  assign m2_axi_arprot = axi4FullToLiteAdapter_1_io_lite_ar_payload_prot;
  assign m2_axi_rready = axi4FullToLiteAdapter_1_io_lite_r_ready;

endmodule

module Axi4FullToLiteAdapter (
  input  wire          io_full_aw_valid,
  output wire          io_full_aw_ready,
  input  wire [31:0]   io_full_aw_payload_addr,
  input  wire [0:0]    io_full_aw_payload_id,
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
  output reg  [0:0]    io_full_b_payload_id,
  output reg  [1:0]    io_full_b_payload_resp,
  input  wire          io_full_ar_valid,
  output wire          io_full_ar_ready,
  input  wire [31:0]   io_full_ar_payload_addr,
  input  wire [0:0]    io_full_ar_payload_id,
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
  output reg  [0:0]    io_full_r_payload_id,
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
  reg        [0:0]    _zz_io_full_b_payload_id;
  wire                io_full_aw_fire;
  wire       [2:0]    _zz_io_full_b_payload_id_1;
  wire       [35:0]   _zz_io_lite_w_payload_data;
  wire       [34:0]   _zz_io_lite_ar_payload_addr;
  reg        [0:0]    _zz_io_full_r_payload_id;
  wire                io_full_ar_fire;
  wire       [35:0]   _zz_io_full_r_payload_data;

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
  assign io_full_b_valid = io_lite_b_valid;
  assign _zz_io_full_b_payload_id_1 = 3'b000;
  always @(*) begin
    io_full_b_payload_id = _zz_io_full_b_payload_id_1[0 : 0];
    io_full_b_payload_id = _zz_io_full_b_payload_id;
  end

  always @(*) begin
    io_full_b_payload_resp = _zz_io_full_b_payload_id_1[2 : 1];
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
  assign io_full_r_valid = io_lite_r_valid;
  assign _zz_io_full_r_payload_data = 36'h000000000;
  always @(*) begin
    io_full_r_payload_data = _zz_io_full_r_payload_data[31 : 0];
    io_full_r_payload_data = io_lite_r_payload_data;
  end

  always @(*) begin
    io_full_r_payload_id = _zz_io_full_r_payload_data[32 : 32];
    io_full_r_payload_id = _zz_io_full_r_payload_id;
  end

  always @(*) begin
    io_full_r_payload_resp = _zz_io_full_r_payload_data[34 : 33];
    io_full_r_payload_resp = io_lite_r_payload_resp;
  end

  always @(*) begin
    io_full_r_payload_last = _zz_io_full_r_payload_data[35];
    io_full_r_payload_last = 1'b1;
  end

  assign io_lite_r_ready = io_full_r_ready;
  always @(posedge aclk) begin
    if(!aresetn) begin
      _zz_io_full_b_payload_id <= 1'b0;
      _zz_io_full_r_payload_id <= 1'b0;
    end else begin
      if(io_full_aw_fire) begin
        _zz_io_full_b_payload_id <= io_full_aw_payload_id;
      end
      if(io_full_ar_fire) begin
        _zz_io_full_r_payload_id <= io_full_ar_payload_id;
      end
    end
  end


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
  output reg           m0_axi_awvalid,
  input  wire          m0_axi_awready,
  output reg  [31:0]   m0_axi_awaddr,
  output reg  [0:0]    m0_axi_awid,
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
  input  wire [0:0]    m0_axi_bid,
  input  wire [1:0]    m0_axi_bresp,
  output reg           m0_axi_arvalid,
  input  wire          m0_axi_arready,
  output reg  [31:0]   m0_axi_araddr,
  output reg  [0:0]    m0_axi_arid,
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
  input  wire [0:0]    m0_axi_rid,
  input  wire [1:0]    m0_axi_rresp,
  input  wire          m0_axi_rlast,
  output reg           m1_axi_awvalid,
  input  wire          m1_axi_awready,
  output reg  [31:0]   m1_axi_awaddr,
  output reg  [0:0]    m1_axi_awid,
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
  input  wire [0:0]    m1_axi_bid,
  input  wire [1:0]    m1_axi_bresp,
  output reg           m1_axi_arvalid,
  input  wire          m1_axi_arready,
  output reg  [31:0]   m1_axi_araddr,
  output reg  [0:0]    m1_axi_arid,
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
  input  wire [0:0]    m1_axi_rid,
  input  wire [1:0]    m1_axi_rresp,
  input  wire          m1_axi_rlast,
  output reg           m2_axi_awvalid,
  input  wire          m2_axi_awready,
  output reg  [31:0]   m2_axi_awaddr,
  output reg  [0:0]    m2_axi_awid,
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
  input  wire [0:0]    m2_axi_bid,
  input  wire [1:0]    m2_axi_bresp,
  output reg           m2_axi_arvalid,
  input  wire          m2_axi_arready,
  output reg  [31:0]   m2_axi_araddr,
  output reg  [0:0]    m2_axi_arid,
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
  input  wire [0:0]    m2_axi_rid,
  input  wire [1:0]    m2_axi_rresp,
  input  wire          m2_axi_rlast,
  input  wire          aclk,
  input  wire          aresetn
);

  wire       [0:0]    _zz_when_Axi4Crossbar_l111_24;
  wire       [0:0]    _zz_when_Axi4Crossbar_l111_25;
  wire       [0:0]    _zz_when_Axi4Crossbar_l111_26;
  wire       [0:0]    _zz_when_Axi4Crossbar_l111_1_1;
  wire       [0:0]    _zz_when_Axi4Crossbar_l111_1_2;
  wire       [0:0]    _zz_when_Axi4Crossbar_l111_1_3;
  wire       [0:0]    _zz_when_Axi4Crossbar_l111_2_1;
  wire       [0:0]    _zz_when_Axi4Crossbar_l111_2_2;
  wire       [0:0]    _zz_when_Axi4Crossbar_l111_2_3;
  wire       [0:0]    _zz_when_Axi4Crossbar_l111_3_1;
  wire       [0:0]    _zz_when_Axi4Crossbar_l111_3_2;
  wire       [0:0]    _zz_when_Axi4Crossbar_l111_3_3;
  wire       [0:0]    _zz_when_Axi4Crossbar_l111_4_1;
  wire       [0:0]    _zz_when_Axi4Crossbar_l111_4_2;
  wire       [0:0]    _zz_when_Axi4Crossbar_l111_4_3;
  wire       [0:0]    _zz_when_Axi4Crossbar_l111_5_1;
  wire       [0:0]    _zz_when_Axi4Crossbar_l111_5_2;
  wire       [0:0]    _zz_when_Axi4Crossbar_l111_5_3;
  reg        [0:0]    wrRrPtr_0;
  reg        [0:0]    wrRrPtr_1;
  reg        [0:0]    wrRrPtr_2;
  reg        [0:0]    rdRrPtr_0;
  reg        [0:0]    rdRrPtr_1;
  reg        [0:0]    rdRrPtr_2;
  wire       [2:0]    _zz_io_masters_0_b_payload_id;
  wire       [35:0]   _zz_io_masters_0_r_payload_data;
  wire       [61:0]   _zz_io_slaves_0_aw_payload_addr;
  wire       [36:0]   _zz_io_slaves_0_w_payload_data;
  wire       [61:0]   _zz_io_slaves_0_ar_payload_addr;
  wire       [61:0]   _zz_io_slaves_1_aw_payload_addr;
  wire       [36:0]   _zz_io_slaves_1_w_payload_data;
  wire       [61:0]   _zz_io_slaves_1_ar_payload_addr;
  wire       [61:0]   _zz_io_slaves_2_aw_payload_addr;
  wire       [36:0]   _zz_io_slaves_2_w_payload_data;
  wire       [61:0]   _zz_io_slaves_2_ar_payload_addr;
  reg                 _zz_when_Axi4Crossbar_l193;
  reg                 _zz_when_Axi4Crossbar_l193_1;
  reg                 _zz_when_Axi4Crossbar_l193_2;
  reg        [0:0]    _zz_when_Axi4Crossbar_l218;
  reg        [0:0]    _zz_when_Axi4Crossbar_l218_1;
  reg        [0:0]    _zz_when_Axi4Crossbar_l218_2;
  reg                 _zz_when_Axi4Crossbar_l237;
  reg                 _zz_when_Axi4Crossbar_l237_1;
  reg                 _zz_when_Axi4Crossbar_l237_2;
  reg        [0:0]    _zz_when_Axi4Crossbar_l262;
  reg        [0:0]    _zz_when_Axi4Crossbar_l262_1;
  reg        [0:0]    _zz_when_Axi4Crossbar_l262_2;
  wire                when_Axi4Crossbar_l193;
  wire       [0:0]    _zz_when_Axi4Crossbar_l203;
  reg        [2:0]    _zz_when_Axi4Crossbar_l203_1;
  wire       [0:0]    _zz_when_Axi4Crossbar_l111;
  wire       [0:0]    _zz_when_Axi4Crossbar_l111_1;
  wire       [0:0]    _zz_when_Axi4Crossbar_l111_2;
  wire       [0:0]    _zz_when_Axi4Crossbar_l111_3;
  reg        [0:0]    _zz_wrRrPtr_0;
  wire                when_Axi4Crossbar_l111;
  wire                when_Axi4Crossbar_l203;
  wire                when_Axi4Crossbar_l206;
  wire                io_slaves_0_aw_fire;
  wire                when_Axi4Crossbar_l218;
  wire                io_slaves_0_b_fire;
  wire                when_Axi4Crossbar_l193_1;
  wire       [0:0]    _zz_when_Axi4Crossbar_l203_2;
  reg        [2:0]    _zz_when_Axi4Crossbar_l203_3;
  wire       [0:0]    _zz_when_Axi4Crossbar_l111_4;
  wire       [0:0]    _zz_when_Axi4Crossbar_l111_5;
  wire       [0:0]    _zz_when_Axi4Crossbar_l111_6;
  wire       [0:0]    _zz_when_Axi4Crossbar_l111_7;
  reg        [0:0]    _zz_wrRrPtr_1;
  wire                when_Axi4Crossbar_l111_1;
  wire                when_Axi4Crossbar_l203_1;
  wire                when_Axi4Crossbar_l206_1;
  wire                io_slaves_1_aw_fire;
  wire                when_Axi4Crossbar_l218_1;
  wire                io_slaves_1_b_fire;
  wire                when_Axi4Crossbar_l193_2;
  wire       [0:0]    _zz_when_Axi4Crossbar_l203_4;
  reg        [2:0]    _zz_when_Axi4Crossbar_l203_5;
  wire       [0:0]    _zz_when_Axi4Crossbar_l111_8;
  wire       [0:0]    _zz_when_Axi4Crossbar_l111_9;
  wire       [0:0]    _zz_when_Axi4Crossbar_l111_10;
  wire       [0:0]    _zz_when_Axi4Crossbar_l111_11;
  reg        [0:0]    _zz_wrRrPtr_2;
  wire                when_Axi4Crossbar_l111_2;
  wire                when_Axi4Crossbar_l203_2;
  wire                when_Axi4Crossbar_l206_2;
  wire                io_slaves_2_aw_fire;
  wire                when_Axi4Crossbar_l218_2;
  wire                io_slaves_2_b_fire;
  wire                when_Axi4Crossbar_l237;
  wire       [0:0]    _zz_when_Axi4Crossbar_l247;
  reg        [2:0]    _zz_when_Axi4Crossbar_l247_1;
  wire       [0:0]    _zz_when_Axi4Crossbar_l111_12;
  wire       [0:0]    _zz_when_Axi4Crossbar_l111_13;
  wire       [0:0]    _zz_when_Axi4Crossbar_l111_14;
  wire       [0:0]    _zz_when_Axi4Crossbar_l111_15;
  reg        [0:0]    _zz_rdRrPtr_0;
  wire                when_Axi4Crossbar_l111_3;
  wire                when_Axi4Crossbar_l247;
  wire                when_Axi4Crossbar_l250;
  wire                io_slaves_0_ar_fire;
  wire                when_Axi4Crossbar_l262;
  wire                io_slaves_0_r_fire;
  wire                when_Axi4Crossbar_l272;
  wire                when_Axi4Crossbar_l237_1;
  wire       [0:0]    _zz_when_Axi4Crossbar_l247_2;
  reg        [2:0]    _zz_when_Axi4Crossbar_l247_3;
  wire       [0:0]    _zz_when_Axi4Crossbar_l111_16;
  wire       [0:0]    _zz_when_Axi4Crossbar_l111_17;
  wire       [0:0]    _zz_when_Axi4Crossbar_l111_18;
  wire       [0:0]    _zz_when_Axi4Crossbar_l111_19;
  reg        [0:0]    _zz_rdRrPtr_1;
  wire                when_Axi4Crossbar_l111_4;
  wire                when_Axi4Crossbar_l247_1;
  wire                when_Axi4Crossbar_l250_1;
  wire                io_slaves_1_ar_fire;
  wire                when_Axi4Crossbar_l262_1;
  wire                io_slaves_1_r_fire;
  wire                when_Axi4Crossbar_l272_1;
  wire                when_Axi4Crossbar_l237_2;
  wire       [0:0]    _zz_when_Axi4Crossbar_l247_4;
  reg        [2:0]    _zz_when_Axi4Crossbar_l247_5;
  wire       [0:0]    _zz_when_Axi4Crossbar_l111_20;
  wire       [0:0]    _zz_when_Axi4Crossbar_l111_21;
  wire       [0:0]    _zz_when_Axi4Crossbar_l111_22;
  wire       [0:0]    _zz_when_Axi4Crossbar_l111_23;
  reg        [0:0]    _zz_rdRrPtr_2;
  wire                when_Axi4Crossbar_l111_5;
  wire                when_Axi4Crossbar_l247_2;
  wire                when_Axi4Crossbar_l250_2;
  wire                io_slaves_2_ar_fire;
  wire                when_Axi4Crossbar_l262_2;
  wire                io_slaves_2_r_fire;
  wire                when_Axi4Crossbar_l272_2;

  assign _zz_when_Axi4Crossbar_l111_24 = ((|_zz_when_Axi4Crossbar_l111_1) ? (_zz_when_Axi4Crossbar_l111_2 & (~ _zz_when_Axi4Crossbar_l111_25)) : (_zz_when_Axi4Crossbar_l111_3 & (~ _zz_when_Axi4Crossbar_l111_26)));
  assign _zz_when_Axi4Crossbar_l111_25 = (_zz_when_Axi4Crossbar_l111_2 - 1'b1);
  assign _zz_when_Axi4Crossbar_l111_26 = (_zz_when_Axi4Crossbar_l111_3 - 1'b1);
  assign _zz_when_Axi4Crossbar_l111_1_1 = ((|_zz_when_Axi4Crossbar_l111_5) ? (_zz_when_Axi4Crossbar_l111_6 & (~ _zz_when_Axi4Crossbar_l111_1_2)) : (_zz_when_Axi4Crossbar_l111_7 & (~ _zz_when_Axi4Crossbar_l111_1_3)));
  assign _zz_when_Axi4Crossbar_l111_1_2 = (_zz_when_Axi4Crossbar_l111_6 - 1'b1);
  assign _zz_when_Axi4Crossbar_l111_1_3 = (_zz_when_Axi4Crossbar_l111_7 - 1'b1);
  assign _zz_when_Axi4Crossbar_l111_2_1 = ((|_zz_when_Axi4Crossbar_l111_9) ? (_zz_when_Axi4Crossbar_l111_10 & (~ _zz_when_Axi4Crossbar_l111_2_2)) : (_zz_when_Axi4Crossbar_l111_11 & (~ _zz_when_Axi4Crossbar_l111_2_3)));
  assign _zz_when_Axi4Crossbar_l111_2_2 = (_zz_when_Axi4Crossbar_l111_10 - 1'b1);
  assign _zz_when_Axi4Crossbar_l111_2_3 = (_zz_when_Axi4Crossbar_l111_11 - 1'b1);
  assign _zz_when_Axi4Crossbar_l111_3_1 = ((|_zz_when_Axi4Crossbar_l111_13) ? (_zz_when_Axi4Crossbar_l111_14 & (~ _zz_when_Axi4Crossbar_l111_3_2)) : (_zz_when_Axi4Crossbar_l111_15 & (~ _zz_when_Axi4Crossbar_l111_3_3)));
  assign _zz_when_Axi4Crossbar_l111_3_2 = (_zz_when_Axi4Crossbar_l111_14 - 1'b1);
  assign _zz_when_Axi4Crossbar_l111_3_3 = (_zz_when_Axi4Crossbar_l111_15 - 1'b1);
  assign _zz_when_Axi4Crossbar_l111_4_1 = ((|_zz_when_Axi4Crossbar_l111_17) ? (_zz_when_Axi4Crossbar_l111_18 & (~ _zz_when_Axi4Crossbar_l111_4_2)) : (_zz_when_Axi4Crossbar_l111_19 & (~ _zz_when_Axi4Crossbar_l111_4_3)));
  assign _zz_when_Axi4Crossbar_l111_4_2 = (_zz_when_Axi4Crossbar_l111_18 - 1'b1);
  assign _zz_when_Axi4Crossbar_l111_4_3 = (_zz_when_Axi4Crossbar_l111_19 - 1'b1);
  assign _zz_when_Axi4Crossbar_l111_5_1 = ((|_zz_when_Axi4Crossbar_l111_21) ? (_zz_when_Axi4Crossbar_l111_22 & (~ _zz_when_Axi4Crossbar_l111_5_2)) : (_zz_when_Axi4Crossbar_l111_23 & (~ _zz_when_Axi4Crossbar_l111_5_3)));
  assign _zz_when_Axi4Crossbar_l111_5_2 = (_zz_when_Axi4Crossbar_l111_22 - 1'b1);
  assign _zz_when_Axi4Crossbar_l111_5_3 = (_zz_when_Axi4Crossbar_l111_23 - 1'b1);
  always @(*) begin
    s0_axi_awready = 1'b0;
    if(when_Axi4Crossbar_l193) begin
      if(when_Axi4Crossbar_l203) begin
        if(when_Axi4Crossbar_l206) begin
          s0_axi_awready = m0_axi_awready;
        end
      end
    end
    if(when_Axi4Crossbar_l193_1) begin
      if(when_Axi4Crossbar_l203_1) begin
        if(when_Axi4Crossbar_l206_1) begin
          s0_axi_awready = m1_axi_awready;
        end
      end
    end
    if(when_Axi4Crossbar_l193_2) begin
      if(when_Axi4Crossbar_l203_2) begin
        if(when_Axi4Crossbar_l206_2) begin
          s0_axi_awready = m2_axi_awready;
        end
      end
    end
  end

  always @(*) begin
    s0_axi_wready = 1'b0;
    if(!when_Axi4Crossbar_l193) begin
      if(when_Axi4Crossbar_l218) begin
        s0_axi_wready = m0_axi_wready;
      end
    end
    if(!when_Axi4Crossbar_l193_1) begin
      if(when_Axi4Crossbar_l218_1) begin
        s0_axi_wready = m1_axi_wready;
      end
    end
    if(!when_Axi4Crossbar_l193_2) begin
      if(when_Axi4Crossbar_l218_2) begin
        s0_axi_wready = m2_axi_wready;
      end
    end
  end

  always @(*) begin
    s0_axi_bvalid = 1'b0;
    if(!when_Axi4Crossbar_l193) begin
      if(when_Axi4Crossbar_l218) begin
        s0_axi_bvalid = m0_axi_bvalid;
      end
    end
    if(!when_Axi4Crossbar_l193_1) begin
      if(when_Axi4Crossbar_l218_1) begin
        s0_axi_bvalid = m1_axi_bvalid;
      end
    end
    if(!when_Axi4Crossbar_l193_2) begin
      if(when_Axi4Crossbar_l218_2) begin
        s0_axi_bvalid = m2_axi_bvalid;
      end
    end
  end

  assign _zz_io_masters_0_b_payload_id = 3'b000;
  always @(*) begin
    s0_axi_bid = _zz_io_masters_0_b_payload_id[0 : 0];
    if(!when_Axi4Crossbar_l193) begin
      if(when_Axi4Crossbar_l218) begin
        s0_axi_bid = m0_axi_bid[0 : 0];
      end
    end
    if(!when_Axi4Crossbar_l193_1) begin
      if(when_Axi4Crossbar_l218_1) begin
        s0_axi_bid = m1_axi_bid[0 : 0];
      end
    end
    if(!when_Axi4Crossbar_l193_2) begin
      if(when_Axi4Crossbar_l218_2) begin
        s0_axi_bid = m2_axi_bid[0 : 0];
      end
    end
  end

  always @(*) begin
    s0_axi_bresp = _zz_io_masters_0_b_payload_id[2 : 1];
    if(!when_Axi4Crossbar_l193) begin
      if(when_Axi4Crossbar_l218) begin
        s0_axi_bresp = m0_axi_bresp;
      end
    end
    if(!when_Axi4Crossbar_l193_1) begin
      if(when_Axi4Crossbar_l218_1) begin
        s0_axi_bresp = m1_axi_bresp;
      end
    end
    if(!when_Axi4Crossbar_l193_2) begin
      if(when_Axi4Crossbar_l218_2) begin
        s0_axi_bresp = m2_axi_bresp;
      end
    end
  end

  always @(*) begin
    s0_axi_arready = 1'b0;
    if(when_Axi4Crossbar_l237) begin
      if(when_Axi4Crossbar_l247) begin
        if(when_Axi4Crossbar_l250) begin
          s0_axi_arready = m0_axi_arready;
        end
      end
    end
    if(when_Axi4Crossbar_l237_1) begin
      if(when_Axi4Crossbar_l247_1) begin
        if(when_Axi4Crossbar_l250_1) begin
          s0_axi_arready = m1_axi_arready;
        end
      end
    end
    if(when_Axi4Crossbar_l237_2) begin
      if(when_Axi4Crossbar_l247_2) begin
        if(when_Axi4Crossbar_l250_2) begin
          s0_axi_arready = m2_axi_arready;
        end
      end
    end
  end

  always @(*) begin
    s0_axi_rvalid = 1'b0;
    if(!when_Axi4Crossbar_l237) begin
      if(when_Axi4Crossbar_l262) begin
        s0_axi_rvalid = m0_axi_rvalid;
      end
    end
    if(!when_Axi4Crossbar_l237_1) begin
      if(when_Axi4Crossbar_l262_1) begin
        s0_axi_rvalid = m1_axi_rvalid;
      end
    end
    if(!when_Axi4Crossbar_l237_2) begin
      if(when_Axi4Crossbar_l262_2) begin
        s0_axi_rvalid = m2_axi_rvalid;
      end
    end
  end

  assign _zz_io_masters_0_r_payload_data = 36'h000000000;
  always @(*) begin
    s0_axi_rdata = _zz_io_masters_0_r_payload_data[31 : 0];
    if(!when_Axi4Crossbar_l237) begin
      if(when_Axi4Crossbar_l262) begin
        s0_axi_rdata = m0_axi_rdata;
      end
    end
    if(!when_Axi4Crossbar_l237_1) begin
      if(when_Axi4Crossbar_l262_1) begin
        s0_axi_rdata = m1_axi_rdata;
      end
    end
    if(!when_Axi4Crossbar_l237_2) begin
      if(when_Axi4Crossbar_l262_2) begin
        s0_axi_rdata = m2_axi_rdata;
      end
    end
  end

  always @(*) begin
    s0_axi_rid = _zz_io_masters_0_r_payload_data[32 : 32];
    if(!when_Axi4Crossbar_l237) begin
      if(when_Axi4Crossbar_l262) begin
        s0_axi_rid = m0_axi_rid[0 : 0];
      end
    end
    if(!when_Axi4Crossbar_l237_1) begin
      if(when_Axi4Crossbar_l262_1) begin
        s0_axi_rid = m1_axi_rid[0 : 0];
      end
    end
    if(!when_Axi4Crossbar_l237_2) begin
      if(when_Axi4Crossbar_l262_2) begin
        s0_axi_rid = m2_axi_rid[0 : 0];
      end
    end
  end

  always @(*) begin
    s0_axi_rresp = _zz_io_masters_0_r_payload_data[34 : 33];
    if(!when_Axi4Crossbar_l237) begin
      if(when_Axi4Crossbar_l262) begin
        s0_axi_rresp = m0_axi_rresp;
      end
    end
    if(!when_Axi4Crossbar_l237_1) begin
      if(when_Axi4Crossbar_l262_1) begin
        s0_axi_rresp = m1_axi_rresp;
      end
    end
    if(!when_Axi4Crossbar_l237_2) begin
      if(when_Axi4Crossbar_l262_2) begin
        s0_axi_rresp = m2_axi_rresp;
      end
    end
  end

  always @(*) begin
    s0_axi_rlast = _zz_io_masters_0_r_payload_data[35];
    if(!when_Axi4Crossbar_l237) begin
      if(when_Axi4Crossbar_l262) begin
        s0_axi_rlast = m0_axi_rlast;
      end
    end
    if(!when_Axi4Crossbar_l237_1) begin
      if(when_Axi4Crossbar_l262_1) begin
        s0_axi_rlast = m1_axi_rlast;
      end
    end
    if(!when_Axi4Crossbar_l237_2) begin
      if(when_Axi4Crossbar_l262_2) begin
        s0_axi_rlast = m2_axi_rlast;
      end
    end
  end

  always @(*) begin
    m0_axi_awvalid = 1'b0;
    if(when_Axi4Crossbar_l193) begin
      if(when_Axi4Crossbar_l203) begin
        m0_axi_awvalid = 1'b1;
      end
    end
  end

  assign _zz_io_slaves_0_aw_payload_addr = 62'h0000000000000000;
  always @(*) begin
    m0_axi_awaddr = _zz_io_slaves_0_aw_payload_addr[31 : 0];
    if(when_Axi4Crossbar_l193) begin
      if(when_Axi4Crossbar_l203) begin
        if(when_Axi4Crossbar_l206) begin
          m0_axi_awaddr = s0_axi_awaddr;
        end
      end
    end
  end

  always @(*) begin
    m0_axi_awid = _zz_io_slaves_0_aw_payload_addr[32 : 32];
    if(when_Axi4Crossbar_l193) begin
      if(when_Axi4Crossbar_l203) begin
        if(when_Axi4Crossbar_l206) begin
          m0_axi_awid = s0_axi_awid;
        end
      end
    end
  end

  assign m0_axi_awregion = _zz_io_slaves_0_aw_payload_addr[36 : 33];
  always @(*) begin
    m0_axi_awlen = _zz_io_slaves_0_aw_payload_addr[44 : 37];
    if(when_Axi4Crossbar_l193) begin
      if(when_Axi4Crossbar_l203) begin
        if(when_Axi4Crossbar_l206) begin
          m0_axi_awlen = s0_axi_awlen;
        end
      end
    end
  end

  always @(*) begin
    m0_axi_awsize = _zz_io_slaves_0_aw_payload_addr[47 : 45];
    if(when_Axi4Crossbar_l193) begin
      if(when_Axi4Crossbar_l203) begin
        if(when_Axi4Crossbar_l206) begin
          m0_axi_awsize = s0_axi_awsize;
        end
      end
    end
  end

  always @(*) begin
    m0_axi_awburst = _zz_io_slaves_0_aw_payload_addr[49 : 48];
    if(when_Axi4Crossbar_l193) begin
      if(when_Axi4Crossbar_l203) begin
        if(when_Axi4Crossbar_l206) begin
          m0_axi_awburst = s0_axi_awburst;
        end
      end
    end
  end

  always @(*) begin
    m0_axi_awlock = _zz_io_slaves_0_aw_payload_addr[50 : 50];
    if(when_Axi4Crossbar_l193) begin
      if(when_Axi4Crossbar_l203) begin
        if(when_Axi4Crossbar_l206) begin
          m0_axi_awlock = s0_axi_awlock;
        end
      end
    end
  end

  always @(*) begin
    m0_axi_awcache = _zz_io_slaves_0_aw_payload_addr[54 : 51];
    if(when_Axi4Crossbar_l193) begin
      if(when_Axi4Crossbar_l203) begin
        if(when_Axi4Crossbar_l206) begin
          m0_axi_awcache = s0_axi_awcache;
        end
      end
    end
  end

  always @(*) begin
    m0_axi_awqos = _zz_io_slaves_0_aw_payload_addr[58 : 55];
    if(when_Axi4Crossbar_l193) begin
      if(when_Axi4Crossbar_l203) begin
        if(when_Axi4Crossbar_l206) begin
          m0_axi_awqos = s0_axi_awqos;
        end
      end
    end
  end

  always @(*) begin
    m0_axi_awprot = _zz_io_slaves_0_aw_payload_addr[61 : 59];
    if(when_Axi4Crossbar_l193) begin
      if(when_Axi4Crossbar_l203) begin
        if(when_Axi4Crossbar_l206) begin
          m0_axi_awprot = s0_axi_awprot;
        end
      end
    end
  end

  always @(*) begin
    m0_axi_wvalid = 1'b0;
    if(!when_Axi4Crossbar_l193) begin
      if(when_Axi4Crossbar_l218) begin
        m0_axi_wvalid = s0_axi_wvalid;
      end
    end
  end

  assign _zz_io_slaves_0_w_payload_data = 37'h0000000000;
  always @(*) begin
    m0_axi_wdata = _zz_io_slaves_0_w_payload_data[31 : 0];
    if(!when_Axi4Crossbar_l193) begin
      if(when_Axi4Crossbar_l218) begin
        m0_axi_wdata = s0_axi_wdata;
      end
    end
  end

  always @(*) begin
    m0_axi_wstrb = _zz_io_slaves_0_w_payload_data[35 : 32];
    if(!when_Axi4Crossbar_l193) begin
      if(when_Axi4Crossbar_l218) begin
        m0_axi_wstrb = s0_axi_wstrb;
      end
    end
  end

  always @(*) begin
    m0_axi_wlast = _zz_io_slaves_0_w_payload_data[36];
    if(!when_Axi4Crossbar_l193) begin
      if(when_Axi4Crossbar_l218) begin
        m0_axi_wlast = s0_axi_wlast;
      end
    end
  end

  always @(*) begin
    m0_axi_bready = 1'b0;
    if(!when_Axi4Crossbar_l193) begin
      if(when_Axi4Crossbar_l218) begin
        m0_axi_bready = s0_axi_bready;
      end
    end
  end

  always @(*) begin
    m0_axi_arvalid = 1'b0;
    if(when_Axi4Crossbar_l237) begin
      if(when_Axi4Crossbar_l247) begin
        m0_axi_arvalid = 1'b1;
      end
    end
  end

  assign _zz_io_slaves_0_ar_payload_addr = 62'h0000000000000000;
  always @(*) begin
    m0_axi_araddr = _zz_io_slaves_0_ar_payload_addr[31 : 0];
    if(when_Axi4Crossbar_l237) begin
      if(when_Axi4Crossbar_l247) begin
        if(when_Axi4Crossbar_l250) begin
          m0_axi_araddr = s0_axi_araddr;
        end
      end
    end
  end

  always @(*) begin
    m0_axi_arid = _zz_io_slaves_0_ar_payload_addr[32 : 32];
    if(when_Axi4Crossbar_l237) begin
      if(when_Axi4Crossbar_l247) begin
        if(when_Axi4Crossbar_l250) begin
          m0_axi_arid = s0_axi_arid;
        end
      end
    end
  end

  assign m0_axi_arregion = _zz_io_slaves_0_ar_payload_addr[36 : 33];
  always @(*) begin
    m0_axi_arlen = _zz_io_slaves_0_ar_payload_addr[44 : 37];
    if(when_Axi4Crossbar_l237) begin
      if(when_Axi4Crossbar_l247) begin
        if(when_Axi4Crossbar_l250) begin
          m0_axi_arlen = s0_axi_arlen;
        end
      end
    end
  end

  always @(*) begin
    m0_axi_arsize = _zz_io_slaves_0_ar_payload_addr[47 : 45];
    if(when_Axi4Crossbar_l237) begin
      if(when_Axi4Crossbar_l247) begin
        if(when_Axi4Crossbar_l250) begin
          m0_axi_arsize = s0_axi_arsize;
        end
      end
    end
  end

  always @(*) begin
    m0_axi_arburst = _zz_io_slaves_0_ar_payload_addr[49 : 48];
    if(when_Axi4Crossbar_l237) begin
      if(when_Axi4Crossbar_l247) begin
        if(when_Axi4Crossbar_l250) begin
          m0_axi_arburst = s0_axi_arburst;
        end
      end
    end
  end

  always @(*) begin
    m0_axi_arlock = _zz_io_slaves_0_ar_payload_addr[50 : 50];
    if(when_Axi4Crossbar_l237) begin
      if(when_Axi4Crossbar_l247) begin
        if(when_Axi4Crossbar_l250) begin
          m0_axi_arlock = s0_axi_arlock;
        end
      end
    end
  end

  always @(*) begin
    m0_axi_arcache = _zz_io_slaves_0_ar_payload_addr[54 : 51];
    if(when_Axi4Crossbar_l237) begin
      if(when_Axi4Crossbar_l247) begin
        if(when_Axi4Crossbar_l250) begin
          m0_axi_arcache = s0_axi_arcache;
        end
      end
    end
  end

  always @(*) begin
    m0_axi_arqos = _zz_io_slaves_0_ar_payload_addr[58 : 55];
    if(when_Axi4Crossbar_l237) begin
      if(when_Axi4Crossbar_l247) begin
        if(when_Axi4Crossbar_l250) begin
          m0_axi_arqos = s0_axi_arqos;
        end
      end
    end
  end

  always @(*) begin
    m0_axi_arprot = _zz_io_slaves_0_ar_payload_addr[61 : 59];
    if(when_Axi4Crossbar_l237) begin
      if(when_Axi4Crossbar_l247) begin
        if(when_Axi4Crossbar_l250) begin
          m0_axi_arprot = s0_axi_arprot;
        end
      end
    end
  end

  always @(*) begin
    m0_axi_rready = 1'b0;
    if(!when_Axi4Crossbar_l237) begin
      if(when_Axi4Crossbar_l262) begin
        m0_axi_rready = s0_axi_rready;
      end
    end
  end

  always @(*) begin
    m1_axi_awvalid = 1'b0;
    if(when_Axi4Crossbar_l193_1) begin
      if(when_Axi4Crossbar_l203_1) begin
        m1_axi_awvalid = 1'b1;
      end
    end
  end

  assign _zz_io_slaves_1_aw_payload_addr = 62'h0000000000000000;
  always @(*) begin
    m1_axi_awaddr = _zz_io_slaves_1_aw_payload_addr[31 : 0];
    if(when_Axi4Crossbar_l193_1) begin
      if(when_Axi4Crossbar_l203_1) begin
        if(when_Axi4Crossbar_l206_1) begin
          m1_axi_awaddr = s0_axi_awaddr;
        end
      end
    end
  end

  always @(*) begin
    m1_axi_awid = _zz_io_slaves_1_aw_payload_addr[32 : 32];
    if(when_Axi4Crossbar_l193_1) begin
      if(when_Axi4Crossbar_l203_1) begin
        if(when_Axi4Crossbar_l206_1) begin
          m1_axi_awid = s0_axi_awid;
        end
      end
    end
  end

  assign m1_axi_awregion = _zz_io_slaves_1_aw_payload_addr[36 : 33];
  always @(*) begin
    m1_axi_awlen = _zz_io_slaves_1_aw_payload_addr[44 : 37];
    if(when_Axi4Crossbar_l193_1) begin
      if(when_Axi4Crossbar_l203_1) begin
        if(when_Axi4Crossbar_l206_1) begin
          m1_axi_awlen = s0_axi_awlen;
        end
      end
    end
  end

  always @(*) begin
    m1_axi_awsize = _zz_io_slaves_1_aw_payload_addr[47 : 45];
    if(when_Axi4Crossbar_l193_1) begin
      if(when_Axi4Crossbar_l203_1) begin
        if(when_Axi4Crossbar_l206_1) begin
          m1_axi_awsize = s0_axi_awsize;
        end
      end
    end
  end

  always @(*) begin
    m1_axi_awburst = _zz_io_slaves_1_aw_payload_addr[49 : 48];
    if(when_Axi4Crossbar_l193_1) begin
      if(when_Axi4Crossbar_l203_1) begin
        if(when_Axi4Crossbar_l206_1) begin
          m1_axi_awburst = s0_axi_awburst;
        end
      end
    end
  end

  always @(*) begin
    m1_axi_awlock = _zz_io_slaves_1_aw_payload_addr[50 : 50];
    if(when_Axi4Crossbar_l193_1) begin
      if(when_Axi4Crossbar_l203_1) begin
        if(when_Axi4Crossbar_l206_1) begin
          m1_axi_awlock = s0_axi_awlock;
        end
      end
    end
  end

  always @(*) begin
    m1_axi_awcache = _zz_io_slaves_1_aw_payload_addr[54 : 51];
    if(when_Axi4Crossbar_l193_1) begin
      if(when_Axi4Crossbar_l203_1) begin
        if(when_Axi4Crossbar_l206_1) begin
          m1_axi_awcache = s0_axi_awcache;
        end
      end
    end
  end

  always @(*) begin
    m1_axi_awqos = _zz_io_slaves_1_aw_payload_addr[58 : 55];
    if(when_Axi4Crossbar_l193_1) begin
      if(when_Axi4Crossbar_l203_1) begin
        if(when_Axi4Crossbar_l206_1) begin
          m1_axi_awqos = s0_axi_awqos;
        end
      end
    end
  end

  always @(*) begin
    m1_axi_awprot = _zz_io_slaves_1_aw_payload_addr[61 : 59];
    if(when_Axi4Crossbar_l193_1) begin
      if(when_Axi4Crossbar_l203_1) begin
        if(when_Axi4Crossbar_l206_1) begin
          m1_axi_awprot = s0_axi_awprot;
        end
      end
    end
  end

  always @(*) begin
    m1_axi_wvalid = 1'b0;
    if(!when_Axi4Crossbar_l193_1) begin
      if(when_Axi4Crossbar_l218_1) begin
        m1_axi_wvalid = s0_axi_wvalid;
      end
    end
  end

  assign _zz_io_slaves_1_w_payload_data = 37'h0000000000;
  always @(*) begin
    m1_axi_wdata = _zz_io_slaves_1_w_payload_data[31 : 0];
    if(!when_Axi4Crossbar_l193_1) begin
      if(when_Axi4Crossbar_l218_1) begin
        m1_axi_wdata = s0_axi_wdata;
      end
    end
  end

  always @(*) begin
    m1_axi_wstrb = _zz_io_slaves_1_w_payload_data[35 : 32];
    if(!when_Axi4Crossbar_l193_1) begin
      if(when_Axi4Crossbar_l218_1) begin
        m1_axi_wstrb = s0_axi_wstrb;
      end
    end
  end

  always @(*) begin
    m1_axi_wlast = _zz_io_slaves_1_w_payload_data[36];
    if(!when_Axi4Crossbar_l193_1) begin
      if(when_Axi4Crossbar_l218_1) begin
        m1_axi_wlast = s0_axi_wlast;
      end
    end
  end

  always @(*) begin
    m1_axi_bready = 1'b0;
    if(!when_Axi4Crossbar_l193_1) begin
      if(when_Axi4Crossbar_l218_1) begin
        m1_axi_bready = s0_axi_bready;
      end
    end
  end

  always @(*) begin
    m1_axi_arvalid = 1'b0;
    if(when_Axi4Crossbar_l237_1) begin
      if(when_Axi4Crossbar_l247_1) begin
        m1_axi_arvalid = 1'b1;
      end
    end
  end

  assign _zz_io_slaves_1_ar_payload_addr = 62'h0000000000000000;
  always @(*) begin
    m1_axi_araddr = _zz_io_slaves_1_ar_payload_addr[31 : 0];
    if(when_Axi4Crossbar_l237_1) begin
      if(when_Axi4Crossbar_l247_1) begin
        if(when_Axi4Crossbar_l250_1) begin
          m1_axi_araddr = s0_axi_araddr;
        end
      end
    end
  end

  always @(*) begin
    m1_axi_arid = _zz_io_slaves_1_ar_payload_addr[32 : 32];
    if(when_Axi4Crossbar_l237_1) begin
      if(when_Axi4Crossbar_l247_1) begin
        if(when_Axi4Crossbar_l250_1) begin
          m1_axi_arid = s0_axi_arid;
        end
      end
    end
  end

  assign m1_axi_arregion = _zz_io_slaves_1_ar_payload_addr[36 : 33];
  always @(*) begin
    m1_axi_arlen = _zz_io_slaves_1_ar_payload_addr[44 : 37];
    if(when_Axi4Crossbar_l237_1) begin
      if(when_Axi4Crossbar_l247_1) begin
        if(when_Axi4Crossbar_l250_1) begin
          m1_axi_arlen = s0_axi_arlen;
        end
      end
    end
  end

  always @(*) begin
    m1_axi_arsize = _zz_io_slaves_1_ar_payload_addr[47 : 45];
    if(when_Axi4Crossbar_l237_1) begin
      if(when_Axi4Crossbar_l247_1) begin
        if(when_Axi4Crossbar_l250_1) begin
          m1_axi_arsize = s0_axi_arsize;
        end
      end
    end
  end

  always @(*) begin
    m1_axi_arburst = _zz_io_slaves_1_ar_payload_addr[49 : 48];
    if(when_Axi4Crossbar_l237_1) begin
      if(when_Axi4Crossbar_l247_1) begin
        if(when_Axi4Crossbar_l250_1) begin
          m1_axi_arburst = s0_axi_arburst;
        end
      end
    end
  end

  always @(*) begin
    m1_axi_arlock = _zz_io_slaves_1_ar_payload_addr[50 : 50];
    if(when_Axi4Crossbar_l237_1) begin
      if(when_Axi4Crossbar_l247_1) begin
        if(when_Axi4Crossbar_l250_1) begin
          m1_axi_arlock = s0_axi_arlock;
        end
      end
    end
  end

  always @(*) begin
    m1_axi_arcache = _zz_io_slaves_1_ar_payload_addr[54 : 51];
    if(when_Axi4Crossbar_l237_1) begin
      if(when_Axi4Crossbar_l247_1) begin
        if(when_Axi4Crossbar_l250_1) begin
          m1_axi_arcache = s0_axi_arcache;
        end
      end
    end
  end

  always @(*) begin
    m1_axi_arqos = _zz_io_slaves_1_ar_payload_addr[58 : 55];
    if(when_Axi4Crossbar_l237_1) begin
      if(when_Axi4Crossbar_l247_1) begin
        if(when_Axi4Crossbar_l250_1) begin
          m1_axi_arqos = s0_axi_arqos;
        end
      end
    end
  end

  always @(*) begin
    m1_axi_arprot = _zz_io_slaves_1_ar_payload_addr[61 : 59];
    if(when_Axi4Crossbar_l237_1) begin
      if(when_Axi4Crossbar_l247_1) begin
        if(when_Axi4Crossbar_l250_1) begin
          m1_axi_arprot = s0_axi_arprot;
        end
      end
    end
  end

  always @(*) begin
    m1_axi_rready = 1'b0;
    if(!when_Axi4Crossbar_l237_1) begin
      if(when_Axi4Crossbar_l262_1) begin
        m1_axi_rready = s0_axi_rready;
      end
    end
  end

  always @(*) begin
    m2_axi_awvalid = 1'b0;
    if(when_Axi4Crossbar_l193_2) begin
      if(when_Axi4Crossbar_l203_2) begin
        m2_axi_awvalid = 1'b1;
      end
    end
  end

  assign _zz_io_slaves_2_aw_payload_addr = 62'h0000000000000000;
  always @(*) begin
    m2_axi_awaddr = _zz_io_slaves_2_aw_payload_addr[31 : 0];
    if(when_Axi4Crossbar_l193_2) begin
      if(when_Axi4Crossbar_l203_2) begin
        if(when_Axi4Crossbar_l206_2) begin
          m2_axi_awaddr = s0_axi_awaddr;
        end
      end
    end
  end

  always @(*) begin
    m2_axi_awid = _zz_io_slaves_2_aw_payload_addr[32 : 32];
    if(when_Axi4Crossbar_l193_2) begin
      if(when_Axi4Crossbar_l203_2) begin
        if(when_Axi4Crossbar_l206_2) begin
          m2_axi_awid = s0_axi_awid;
        end
      end
    end
  end

  assign m2_axi_awregion = _zz_io_slaves_2_aw_payload_addr[36 : 33];
  always @(*) begin
    m2_axi_awlen = _zz_io_slaves_2_aw_payload_addr[44 : 37];
    if(when_Axi4Crossbar_l193_2) begin
      if(when_Axi4Crossbar_l203_2) begin
        if(when_Axi4Crossbar_l206_2) begin
          m2_axi_awlen = s0_axi_awlen;
        end
      end
    end
  end

  always @(*) begin
    m2_axi_awsize = _zz_io_slaves_2_aw_payload_addr[47 : 45];
    if(when_Axi4Crossbar_l193_2) begin
      if(when_Axi4Crossbar_l203_2) begin
        if(when_Axi4Crossbar_l206_2) begin
          m2_axi_awsize = s0_axi_awsize;
        end
      end
    end
  end

  always @(*) begin
    m2_axi_awburst = _zz_io_slaves_2_aw_payload_addr[49 : 48];
    if(when_Axi4Crossbar_l193_2) begin
      if(when_Axi4Crossbar_l203_2) begin
        if(when_Axi4Crossbar_l206_2) begin
          m2_axi_awburst = s0_axi_awburst;
        end
      end
    end
  end

  always @(*) begin
    m2_axi_awlock = _zz_io_slaves_2_aw_payload_addr[50 : 50];
    if(when_Axi4Crossbar_l193_2) begin
      if(when_Axi4Crossbar_l203_2) begin
        if(when_Axi4Crossbar_l206_2) begin
          m2_axi_awlock = s0_axi_awlock;
        end
      end
    end
  end

  always @(*) begin
    m2_axi_awcache = _zz_io_slaves_2_aw_payload_addr[54 : 51];
    if(when_Axi4Crossbar_l193_2) begin
      if(when_Axi4Crossbar_l203_2) begin
        if(when_Axi4Crossbar_l206_2) begin
          m2_axi_awcache = s0_axi_awcache;
        end
      end
    end
  end

  always @(*) begin
    m2_axi_awqos = _zz_io_slaves_2_aw_payload_addr[58 : 55];
    if(when_Axi4Crossbar_l193_2) begin
      if(when_Axi4Crossbar_l203_2) begin
        if(when_Axi4Crossbar_l206_2) begin
          m2_axi_awqos = s0_axi_awqos;
        end
      end
    end
  end

  always @(*) begin
    m2_axi_awprot = _zz_io_slaves_2_aw_payload_addr[61 : 59];
    if(when_Axi4Crossbar_l193_2) begin
      if(when_Axi4Crossbar_l203_2) begin
        if(when_Axi4Crossbar_l206_2) begin
          m2_axi_awprot = s0_axi_awprot;
        end
      end
    end
  end

  always @(*) begin
    m2_axi_wvalid = 1'b0;
    if(!when_Axi4Crossbar_l193_2) begin
      if(when_Axi4Crossbar_l218_2) begin
        m2_axi_wvalid = s0_axi_wvalid;
      end
    end
  end

  assign _zz_io_slaves_2_w_payload_data = 37'h0000000000;
  always @(*) begin
    m2_axi_wdata = _zz_io_slaves_2_w_payload_data[31 : 0];
    if(!when_Axi4Crossbar_l193_2) begin
      if(when_Axi4Crossbar_l218_2) begin
        m2_axi_wdata = s0_axi_wdata;
      end
    end
  end

  always @(*) begin
    m2_axi_wstrb = _zz_io_slaves_2_w_payload_data[35 : 32];
    if(!when_Axi4Crossbar_l193_2) begin
      if(when_Axi4Crossbar_l218_2) begin
        m2_axi_wstrb = s0_axi_wstrb;
      end
    end
  end

  always @(*) begin
    m2_axi_wlast = _zz_io_slaves_2_w_payload_data[36];
    if(!when_Axi4Crossbar_l193_2) begin
      if(when_Axi4Crossbar_l218_2) begin
        m2_axi_wlast = s0_axi_wlast;
      end
    end
  end

  always @(*) begin
    m2_axi_bready = 1'b0;
    if(!when_Axi4Crossbar_l193_2) begin
      if(when_Axi4Crossbar_l218_2) begin
        m2_axi_bready = s0_axi_bready;
      end
    end
  end

  always @(*) begin
    m2_axi_arvalid = 1'b0;
    if(when_Axi4Crossbar_l237_2) begin
      if(when_Axi4Crossbar_l247_2) begin
        m2_axi_arvalid = 1'b1;
      end
    end
  end

  assign _zz_io_slaves_2_ar_payload_addr = 62'h0000000000000000;
  always @(*) begin
    m2_axi_araddr = _zz_io_slaves_2_ar_payload_addr[31 : 0];
    if(when_Axi4Crossbar_l237_2) begin
      if(when_Axi4Crossbar_l247_2) begin
        if(when_Axi4Crossbar_l250_2) begin
          m2_axi_araddr = s0_axi_araddr;
        end
      end
    end
  end

  always @(*) begin
    m2_axi_arid = _zz_io_slaves_2_ar_payload_addr[32 : 32];
    if(when_Axi4Crossbar_l237_2) begin
      if(when_Axi4Crossbar_l247_2) begin
        if(when_Axi4Crossbar_l250_2) begin
          m2_axi_arid = s0_axi_arid;
        end
      end
    end
  end

  assign m2_axi_arregion = _zz_io_slaves_2_ar_payload_addr[36 : 33];
  always @(*) begin
    m2_axi_arlen = _zz_io_slaves_2_ar_payload_addr[44 : 37];
    if(when_Axi4Crossbar_l237_2) begin
      if(when_Axi4Crossbar_l247_2) begin
        if(when_Axi4Crossbar_l250_2) begin
          m2_axi_arlen = s0_axi_arlen;
        end
      end
    end
  end

  always @(*) begin
    m2_axi_arsize = _zz_io_slaves_2_ar_payload_addr[47 : 45];
    if(when_Axi4Crossbar_l237_2) begin
      if(when_Axi4Crossbar_l247_2) begin
        if(when_Axi4Crossbar_l250_2) begin
          m2_axi_arsize = s0_axi_arsize;
        end
      end
    end
  end

  always @(*) begin
    m2_axi_arburst = _zz_io_slaves_2_ar_payload_addr[49 : 48];
    if(when_Axi4Crossbar_l237_2) begin
      if(when_Axi4Crossbar_l247_2) begin
        if(when_Axi4Crossbar_l250_2) begin
          m2_axi_arburst = s0_axi_arburst;
        end
      end
    end
  end

  always @(*) begin
    m2_axi_arlock = _zz_io_slaves_2_ar_payload_addr[50 : 50];
    if(when_Axi4Crossbar_l237_2) begin
      if(when_Axi4Crossbar_l247_2) begin
        if(when_Axi4Crossbar_l250_2) begin
          m2_axi_arlock = s0_axi_arlock;
        end
      end
    end
  end

  always @(*) begin
    m2_axi_arcache = _zz_io_slaves_2_ar_payload_addr[54 : 51];
    if(when_Axi4Crossbar_l237_2) begin
      if(when_Axi4Crossbar_l247_2) begin
        if(when_Axi4Crossbar_l250_2) begin
          m2_axi_arcache = s0_axi_arcache;
        end
      end
    end
  end

  always @(*) begin
    m2_axi_arqos = _zz_io_slaves_2_ar_payload_addr[58 : 55];
    if(when_Axi4Crossbar_l237_2) begin
      if(when_Axi4Crossbar_l247_2) begin
        if(when_Axi4Crossbar_l250_2) begin
          m2_axi_arqos = s0_axi_arqos;
        end
      end
    end
  end

  always @(*) begin
    m2_axi_arprot = _zz_io_slaves_2_ar_payload_addr[61 : 59];
    if(when_Axi4Crossbar_l237_2) begin
      if(when_Axi4Crossbar_l247_2) begin
        if(when_Axi4Crossbar_l250_2) begin
          m2_axi_arprot = s0_axi_arprot;
        end
      end
    end
  end

  always @(*) begin
    m2_axi_rready = 1'b0;
    if(!when_Axi4Crossbar_l237_2) begin
      if(when_Axi4Crossbar_l262_2) begin
        m2_axi_rready = s0_axi_rready;
      end
    end
  end

  assign when_Axi4Crossbar_l193 = (! _zz_when_Axi4Crossbar_l193);
  always @(*) begin
    _zz_when_Axi4Crossbar_l203_1[0] = ((32'hc0000000 <= s0_axi_awaddr) && (s0_axi_awaddr < 32'hc0010000));
    _zz_when_Axi4Crossbar_l203_1[1] = ((32'hc0010000 <= s0_axi_awaddr) && (s0_axi_awaddr < 32'hc0020000));
    _zz_when_Axi4Crossbar_l203_1[2] = ((32'hc0020000 <= s0_axi_awaddr) && (s0_axi_awaddr < 32'hc0021000));
  end

  assign _zz_when_Axi4Crossbar_l203[0] = (s0_axi_awvalid && _zz_when_Axi4Crossbar_l203_1[0]);
  assign _zz_when_Axi4Crossbar_l111[0] = (wrRrPtr_0 <= 1'b0);
  assign _zz_when_Axi4Crossbar_l111_1 = (_zz_when_Axi4Crossbar_l203 & _zz_when_Axi4Crossbar_l111);
  assign _zz_when_Axi4Crossbar_l111_2 = _zz_when_Axi4Crossbar_l111_1;
  assign _zz_when_Axi4Crossbar_l111_3 = _zz_when_Axi4Crossbar_l203;
  always @(*) begin
    _zz_wrRrPtr_0 = 1'b0;
    if(when_Axi4Crossbar_l111) begin
      _zz_wrRrPtr_0 = 1'b0;
    end
  end

  assign when_Axi4Crossbar_l111 = _zz_when_Axi4Crossbar_l111_24[0];
  assign when_Axi4Crossbar_l203 = (|_zz_when_Axi4Crossbar_l203);
  assign when_Axi4Crossbar_l206 = (_zz_wrRrPtr_0 == 1'b0);
  assign io_slaves_0_aw_fire = (m0_axi_awvalid && m0_axi_awready);
  assign when_Axi4Crossbar_l218 = (_zz_when_Axi4Crossbar_l218 == 1'b0);
  assign io_slaves_0_b_fire = (m0_axi_bvalid && m0_axi_bready);
  assign when_Axi4Crossbar_l193_1 = (! _zz_when_Axi4Crossbar_l193_1);
  always @(*) begin
    _zz_when_Axi4Crossbar_l203_3[0] = ((32'hc0000000 <= s0_axi_awaddr) && (s0_axi_awaddr < 32'hc0010000));
    _zz_when_Axi4Crossbar_l203_3[1] = ((32'hc0010000 <= s0_axi_awaddr) && (s0_axi_awaddr < 32'hc0020000));
    _zz_when_Axi4Crossbar_l203_3[2] = ((32'hc0020000 <= s0_axi_awaddr) && (s0_axi_awaddr < 32'hc0021000));
  end

  assign _zz_when_Axi4Crossbar_l203_2[0] = (s0_axi_awvalid && _zz_when_Axi4Crossbar_l203_3[1]);
  assign _zz_when_Axi4Crossbar_l111_4[0] = (wrRrPtr_1 <= 1'b0);
  assign _zz_when_Axi4Crossbar_l111_5 = (_zz_when_Axi4Crossbar_l203_2 & _zz_when_Axi4Crossbar_l111_4);
  assign _zz_when_Axi4Crossbar_l111_6 = _zz_when_Axi4Crossbar_l111_5;
  assign _zz_when_Axi4Crossbar_l111_7 = _zz_when_Axi4Crossbar_l203_2;
  always @(*) begin
    _zz_wrRrPtr_1 = 1'b0;
    if(when_Axi4Crossbar_l111_1) begin
      _zz_wrRrPtr_1 = 1'b0;
    end
  end

  assign when_Axi4Crossbar_l111_1 = _zz_when_Axi4Crossbar_l111_1_1[0];
  assign when_Axi4Crossbar_l203_1 = (|_zz_when_Axi4Crossbar_l203_2);
  assign when_Axi4Crossbar_l206_1 = (_zz_wrRrPtr_1 == 1'b0);
  assign io_slaves_1_aw_fire = (m1_axi_awvalid && m1_axi_awready);
  assign when_Axi4Crossbar_l218_1 = (_zz_when_Axi4Crossbar_l218_1 == 1'b0);
  assign io_slaves_1_b_fire = (m1_axi_bvalid && m1_axi_bready);
  assign when_Axi4Crossbar_l193_2 = (! _zz_when_Axi4Crossbar_l193_2);
  always @(*) begin
    _zz_when_Axi4Crossbar_l203_5[0] = ((32'hc0000000 <= s0_axi_awaddr) && (s0_axi_awaddr < 32'hc0010000));
    _zz_when_Axi4Crossbar_l203_5[1] = ((32'hc0010000 <= s0_axi_awaddr) && (s0_axi_awaddr < 32'hc0020000));
    _zz_when_Axi4Crossbar_l203_5[2] = ((32'hc0020000 <= s0_axi_awaddr) && (s0_axi_awaddr < 32'hc0021000));
  end

  assign _zz_when_Axi4Crossbar_l203_4[0] = (s0_axi_awvalid && _zz_when_Axi4Crossbar_l203_5[2]);
  assign _zz_when_Axi4Crossbar_l111_8[0] = (wrRrPtr_2 <= 1'b0);
  assign _zz_when_Axi4Crossbar_l111_9 = (_zz_when_Axi4Crossbar_l203_4 & _zz_when_Axi4Crossbar_l111_8);
  assign _zz_when_Axi4Crossbar_l111_10 = _zz_when_Axi4Crossbar_l111_9;
  assign _zz_when_Axi4Crossbar_l111_11 = _zz_when_Axi4Crossbar_l203_4;
  always @(*) begin
    _zz_wrRrPtr_2 = 1'b0;
    if(when_Axi4Crossbar_l111_2) begin
      _zz_wrRrPtr_2 = 1'b0;
    end
  end

  assign when_Axi4Crossbar_l111_2 = _zz_when_Axi4Crossbar_l111_2_1[0];
  assign when_Axi4Crossbar_l203_2 = (|_zz_when_Axi4Crossbar_l203_4);
  assign when_Axi4Crossbar_l206_2 = (_zz_wrRrPtr_2 == 1'b0);
  assign io_slaves_2_aw_fire = (m2_axi_awvalid && m2_axi_awready);
  assign when_Axi4Crossbar_l218_2 = (_zz_when_Axi4Crossbar_l218_2 == 1'b0);
  assign io_slaves_2_b_fire = (m2_axi_bvalid && m2_axi_bready);
  assign when_Axi4Crossbar_l237 = (! _zz_when_Axi4Crossbar_l237);
  always @(*) begin
    _zz_when_Axi4Crossbar_l247_1[0] = ((32'hc0000000 <= s0_axi_araddr) && (s0_axi_araddr < 32'hc0010000));
    _zz_when_Axi4Crossbar_l247_1[1] = ((32'hc0010000 <= s0_axi_araddr) && (s0_axi_araddr < 32'hc0020000));
    _zz_when_Axi4Crossbar_l247_1[2] = ((32'hc0020000 <= s0_axi_araddr) && (s0_axi_araddr < 32'hc0021000));
  end

  assign _zz_when_Axi4Crossbar_l247[0] = (s0_axi_arvalid && _zz_when_Axi4Crossbar_l247_1[0]);
  assign _zz_when_Axi4Crossbar_l111_12[0] = (rdRrPtr_0 <= 1'b0);
  assign _zz_when_Axi4Crossbar_l111_13 = (_zz_when_Axi4Crossbar_l247 & _zz_when_Axi4Crossbar_l111_12);
  assign _zz_when_Axi4Crossbar_l111_14 = _zz_when_Axi4Crossbar_l111_13;
  assign _zz_when_Axi4Crossbar_l111_15 = _zz_when_Axi4Crossbar_l247;
  always @(*) begin
    _zz_rdRrPtr_0 = 1'b0;
    if(when_Axi4Crossbar_l111_3) begin
      _zz_rdRrPtr_0 = 1'b0;
    end
  end

  assign when_Axi4Crossbar_l111_3 = _zz_when_Axi4Crossbar_l111_3_1[0];
  assign when_Axi4Crossbar_l247 = (|_zz_when_Axi4Crossbar_l247);
  assign when_Axi4Crossbar_l250 = (_zz_rdRrPtr_0 == 1'b0);
  assign io_slaves_0_ar_fire = (m0_axi_arvalid && m0_axi_arready);
  assign when_Axi4Crossbar_l262 = (_zz_when_Axi4Crossbar_l262 == 1'b0);
  assign io_slaves_0_r_fire = (m0_axi_rvalid && m0_axi_rready);
  assign when_Axi4Crossbar_l272 = (io_slaves_0_r_fire && m0_axi_rlast);
  assign when_Axi4Crossbar_l237_1 = (! _zz_when_Axi4Crossbar_l237_1);
  always @(*) begin
    _zz_when_Axi4Crossbar_l247_3[0] = ((32'hc0000000 <= s0_axi_araddr) && (s0_axi_araddr < 32'hc0010000));
    _zz_when_Axi4Crossbar_l247_3[1] = ((32'hc0010000 <= s0_axi_araddr) && (s0_axi_araddr < 32'hc0020000));
    _zz_when_Axi4Crossbar_l247_3[2] = ((32'hc0020000 <= s0_axi_araddr) && (s0_axi_araddr < 32'hc0021000));
  end

  assign _zz_when_Axi4Crossbar_l247_2[0] = (s0_axi_arvalid && _zz_when_Axi4Crossbar_l247_3[1]);
  assign _zz_when_Axi4Crossbar_l111_16[0] = (rdRrPtr_1 <= 1'b0);
  assign _zz_when_Axi4Crossbar_l111_17 = (_zz_when_Axi4Crossbar_l247_2 & _zz_when_Axi4Crossbar_l111_16);
  assign _zz_when_Axi4Crossbar_l111_18 = _zz_when_Axi4Crossbar_l111_17;
  assign _zz_when_Axi4Crossbar_l111_19 = _zz_when_Axi4Crossbar_l247_2;
  always @(*) begin
    _zz_rdRrPtr_1 = 1'b0;
    if(when_Axi4Crossbar_l111_4) begin
      _zz_rdRrPtr_1 = 1'b0;
    end
  end

  assign when_Axi4Crossbar_l111_4 = _zz_when_Axi4Crossbar_l111_4_1[0];
  assign when_Axi4Crossbar_l247_1 = (|_zz_when_Axi4Crossbar_l247_2);
  assign when_Axi4Crossbar_l250_1 = (_zz_rdRrPtr_1 == 1'b0);
  assign io_slaves_1_ar_fire = (m1_axi_arvalid && m1_axi_arready);
  assign when_Axi4Crossbar_l262_1 = (_zz_when_Axi4Crossbar_l262_1 == 1'b0);
  assign io_slaves_1_r_fire = (m1_axi_rvalid && m1_axi_rready);
  assign when_Axi4Crossbar_l272_1 = (io_slaves_1_r_fire && m1_axi_rlast);
  assign when_Axi4Crossbar_l237_2 = (! _zz_when_Axi4Crossbar_l237_2);
  always @(*) begin
    _zz_when_Axi4Crossbar_l247_5[0] = ((32'hc0000000 <= s0_axi_araddr) && (s0_axi_araddr < 32'hc0010000));
    _zz_when_Axi4Crossbar_l247_5[1] = ((32'hc0010000 <= s0_axi_araddr) && (s0_axi_araddr < 32'hc0020000));
    _zz_when_Axi4Crossbar_l247_5[2] = ((32'hc0020000 <= s0_axi_araddr) && (s0_axi_araddr < 32'hc0021000));
  end

  assign _zz_when_Axi4Crossbar_l247_4[0] = (s0_axi_arvalid && _zz_when_Axi4Crossbar_l247_5[2]);
  assign _zz_when_Axi4Crossbar_l111_20[0] = (rdRrPtr_2 <= 1'b0);
  assign _zz_when_Axi4Crossbar_l111_21 = (_zz_when_Axi4Crossbar_l247_4 & _zz_when_Axi4Crossbar_l111_20);
  assign _zz_when_Axi4Crossbar_l111_22 = _zz_when_Axi4Crossbar_l111_21;
  assign _zz_when_Axi4Crossbar_l111_23 = _zz_when_Axi4Crossbar_l247_4;
  always @(*) begin
    _zz_rdRrPtr_2 = 1'b0;
    if(when_Axi4Crossbar_l111_5) begin
      _zz_rdRrPtr_2 = 1'b0;
    end
  end

  assign when_Axi4Crossbar_l111_5 = _zz_when_Axi4Crossbar_l111_5_1[0];
  assign when_Axi4Crossbar_l247_2 = (|_zz_when_Axi4Crossbar_l247_4);
  assign when_Axi4Crossbar_l250_2 = (_zz_rdRrPtr_2 == 1'b0);
  assign io_slaves_2_ar_fire = (m2_axi_arvalid && m2_axi_arready);
  assign when_Axi4Crossbar_l262_2 = (_zz_when_Axi4Crossbar_l262_2 == 1'b0);
  assign io_slaves_2_r_fire = (m2_axi_rvalid && m2_axi_rready);
  assign when_Axi4Crossbar_l272_2 = (io_slaves_2_r_fire && m2_axi_rlast);
  always @(posedge aclk) begin
    if(!aresetn) begin
      wrRrPtr_0 <= 1'b0;
      wrRrPtr_1 <= 1'b0;
      wrRrPtr_2 <= 1'b0;
      rdRrPtr_0 <= 1'b0;
      rdRrPtr_1 <= 1'b0;
      rdRrPtr_2 <= 1'b0;
      _zz_when_Axi4Crossbar_l193 <= 1'b0;
      _zz_when_Axi4Crossbar_l193_1 <= 1'b0;
      _zz_when_Axi4Crossbar_l193_2 <= 1'b0;
      _zz_when_Axi4Crossbar_l218 <= 1'b0;
      _zz_when_Axi4Crossbar_l218_1 <= 1'b0;
      _zz_when_Axi4Crossbar_l218_2 <= 1'b0;
      _zz_when_Axi4Crossbar_l237 <= 1'b0;
      _zz_when_Axi4Crossbar_l237_1 <= 1'b0;
      _zz_when_Axi4Crossbar_l237_2 <= 1'b0;
      _zz_when_Axi4Crossbar_l262 <= 1'b0;
      _zz_when_Axi4Crossbar_l262_1 <= 1'b0;
      _zz_when_Axi4Crossbar_l262_2 <= 1'b0;
    end else begin
      if(when_Axi4Crossbar_l193) begin
        if(when_Axi4Crossbar_l203) begin
          if(io_slaves_0_aw_fire) begin
            _zz_when_Axi4Crossbar_l193 <= 1'b1;
            _zz_when_Axi4Crossbar_l218 <= _zz_wrRrPtr_0;
            wrRrPtr_0 <= (_zz_wrRrPtr_0 + 1'b1);
          end
        end
      end else begin
        if(io_slaves_0_b_fire) begin
          _zz_when_Axi4Crossbar_l193 <= 1'b0;
        end
      end
      if(when_Axi4Crossbar_l193_1) begin
        if(when_Axi4Crossbar_l203_1) begin
          if(io_slaves_1_aw_fire) begin
            _zz_when_Axi4Crossbar_l193_1 <= 1'b1;
            _zz_when_Axi4Crossbar_l218_1 <= _zz_wrRrPtr_1;
            wrRrPtr_1 <= (_zz_wrRrPtr_1 + 1'b1);
          end
        end
      end else begin
        if(io_slaves_1_b_fire) begin
          _zz_when_Axi4Crossbar_l193_1 <= 1'b0;
        end
      end
      if(when_Axi4Crossbar_l193_2) begin
        if(when_Axi4Crossbar_l203_2) begin
          if(io_slaves_2_aw_fire) begin
            _zz_when_Axi4Crossbar_l193_2 <= 1'b1;
            _zz_when_Axi4Crossbar_l218_2 <= _zz_wrRrPtr_2;
            wrRrPtr_2 <= (_zz_wrRrPtr_2 + 1'b1);
          end
        end
      end else begin
        if(io_slaves_2_b_fire) begin
          _zz_when_Axi4Crossbar_l193_2 <= 1'b0;
        end
      end
      if(when_Axi4Crossbar_l237) begin
        if(when_Axi4Crossbar_l247) begin
          if(io_slaves_0_ar_fire) begin
            _zz_when_Axi4Crossbar_l237 <= 1'b1;
            _zz_when_Axi4Crossbar_l262 <= _zz_rdRrPtr_0;
            rdRrPtr_0 <= (_zz_rdRrPtr_0 + 1'b1);
          end
        end
      end else begin
        if(when_Axi4Crossbar_l272) begin
          _zz_when_Axi4Crossbar_l237 <= 1'b0;
        end
      end
      if(when_Axi4Crossbar_l237_1) begin
        if(when_Axi4Crossbar_l247_1) begin
          if(io_slaves_1_ar_fire) begin
            _zz_when_Axi4Crossbar_l237_1 <= 1'b1;
            _zz_when_Axi4Crossbar_l262_1 <= _zz_rdRrPtr_1;
            rdRrPtr_1 <= (_zz_rdRrPtr_1 + 1'b1);
          end
        end
      end else begin
        if(when_Axi4Crossbar_l272_1) begin
          _zz_when_Axi4Crossbar_l237_1 <= 1'b0;
        end
      end
      if(when_Axi4Crossbar_l237_2) begin
        if(when_Axi4Crossbar_l247_2) begin
          if(io_slaves_2_ar_fire) begin
            _zz_when_Axi4Crossbar_l237_2 <= 1'b1;
            _zz_when_Axi4Crossbar_l262_2 <= _zz_rdRrPtr_2;
            rdRrPtr_2 <= (_zz_rdRrPtr_2 + 1'b1);
          end
        end
      end else begin
        if(when_Axi4Crossbar_l272_2) begin
          _zz_when_Axi4Crossbar_l237_2 <= 1'b0;
        end
      end
    end
  end


endmodule
