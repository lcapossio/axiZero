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
  output wire          m0_axi_awvalid,
  input  wire          m0_axi_awready,
  output wire [31:0]   m0_axi_awaddr,
  output wire [3:0]    m0_axi_awid,
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
  input  wire [3:0]    m0_axi_bid,
  input  wire [1:0]    m0_axi_bresp,
  output wire          m0_axi_arvalid,
  input  wire          m0_axi_arready,
  output wire [31:0]   m0_axi_araddr,
  output wire [3:0]    m0_axi_arid,
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
  input  wire [3:0]    m0_axi_rid,
  input  wire [1:0]    m0_axi_rresp,
  input  wire          m0_axi_rlast,
  output wire          m1_axi_awvalid,
  input  wire          m1_axi_awready,
  output wire [31:0]   m1_axi_awaddr,
  output wire [3:0]    m1_axi_awid,
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
  input  wire [3:0]    m1_axi_bid,
  input  wire [1:0]    m1_axi_bresp,
  output wire          m1_axi_arvalid,
  input  wire          m1_axi_arready,
  output wire [31:0]   m1_axi_araddr,
  output wire [3:0]    m1_axi_arid,
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
  input  wire [3:0]    m1_axi_rid,
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
  wire                xbar_io_slaves_0_ar_valid;
  wire       [31:0]   xbar_io_slaves_0_ar_payload_addr;
  wire       [3:0]    xbar_io_slaves_0_ar_payload_id;
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
  wire       [3:0]    xbar_io_slaves_0_aw_payload_id;
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
  wire       [3:0]    xbar_io_slaves_1_ar_payload_id;
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
  wire       [3:0]    xbar_io_slaves_1_aw_payload_id;
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
    .m0_axi_awvalid           (xbar_io_slaves_0_aw_valid              ), //o
    .m0_axi_awready           (m0_axi_awready                   ), //i
    .m0_axi_awaddr    (xbar_io_slaves_0_aw_payload_addr[31:0] ), //o
    .m0_axi_awid      (xbar_io_slaves_0_aw_payload_id[3:0]    ), //o
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
    .m0_axi_bid       (m0_axi_bid[3:0]          ), //i
    .m0_axi_bresp     (m0_axi_bresp[1:0]        ), //i
    .m0_axi_arvalid           (xbar_io_slaves_0_ar_valid              ), //o
    .m0_axi_arready           (m0_axi_arready                   ), //i
    .m0_axi_araddr    (xbar_io_slaves_0_ar_payload_addr[31:0] ), //o
    .m0_axi_arid      (xbar_io_slaves_0_ar_payload_id[3:0]    ), //o
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
    .m0_axi_rid       (m0_axi_rid[3:0]          ), //i
    .m0_axi_rresp     (m0_axi_rresp[1:0]        ), //i
    .m0_axi_rlast     (m0_axi_rlast             ), //i
    .m1_axi_awvalid           (xbar_io_slaves_1_aw_valid              ), //o
    .m1_axi_awready           (m1_axi_awready                   ), //i
    .m1_axi_awaddr    (xbar_io_slaves_1_aw_payload_addr[31:0] ), //o
    .m1_axi_awid      (xbar_io_slaves_1_aw_payload_id[3:0]    ), //o
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
    .m1_axi_bid       (m1_axi_bid[3:0]          ), //i
    .m1_axi_bresp     (m1_axi_bresp[1:0]        ), //i
    .m1_axi_arvalid           (xbar_io_slaves_1_ar_valid              ), //o
    .m1_axi_arready           (m1_axi_arready                   ), //i
    .m1_axi_araddr    (xbar_io_slaves_1_ar_payload_addr[31:0] ), //o
    .m1_axi_arid      (xbar_io_slaves_1_ar_payload_id[3:0]    ), //o
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
    .m1_axi_rid       (m1_axi_rid[3:0]          ), //i
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
  output reg           m0_axi_awvalid,
  input  wire          m0_axi_awready,
  output reg  [31:0]   m0_axi_awaddr,
  output reg  [3:0]    m0_axi_awid,
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
  input  wire [3:0]    m0_axi_bid,
  input  wire [1:0]    m0_axi_bresp,
  output reg           m0_axi_arvalid,
  input  wire          m0_axi_arready,
  output reg  [31:0]   m0_axi_araddr,
  output reg  [3:0]    m0_axi_arid,
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
  input  wire [3:0]    m0_axi_rid,
  input  wire [1:0]    m0_axi_rresp,
  input  wire          m0_axi_rlast,
  output reg           m1_axi_awvalid,
  input  wire          m1_axi_awready,
  output reg  [31:0]   m1_axi_awaddr,
  output reg  [3:0]    m1_axi_awid,
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
  input  wire [3:0]    m1_axi_bid,
  input  wire [1:0]    m1_axi_bresp,
  output reg           m1_axi_arvalid,
  input  wire          m1_axi_arready,
  output reg  [31:0]   m1_axi_araddr,
  output reg  [3:0]    m1_axi_arid,
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
  input  wire [3:0]    m1_axi_rid,
  input  wire [1:0]    m1_axi_rresp,
  input  wire          m1_axi_rlast,
  input  wire          aclk,
  input  wire          aresetn
);

  wire       [0:0]    _zz_when_Axi4Crossbar_l161_16;
  wire       [0:0]    _zz_when_Axi4Crossbar_l161_17;
  wire       [0:0]    _zz_when_Axi4Crossbar_l161_18;
  wire       [0:0]    _zz_when_Axi4Crossbar_l161_1_1;
  wire       [0:0]    _zz_when_Axi4Crossbar_l161_1_2;
  wire       [0:0]    _zz_when_Axi4Crossbar_l161_1_3;
  wire       [0:0]    _zz_when_Axi4Crossbar_l161_2_1;
  wire       [0:0]    _zz_when_Axi4Crossbar_l161_2_2;
  wire       [0:0]    _zz_when_Axi4Crossbar_l161_2_3;
  wire       [0:0]    _zz_when_Axi4Crossbar_l161_3_1;
  wire       [0:0]    _zz_when_Axi4Crossbar_l161_3_2;
  wire       [0:0]    _zz_when_Axi4Crossbar_l161_3_3;
  reg        [0:0]    wrRrPtr_0;
  reg        [0:0]    wrRrPtr_1;
  reg        [0:0]    rdRrPtr_0;
  reg        [0:0]    rdRrPtr_1;
  wire       [5:0]    _zz_io_masters_0_b_payload_id;
  wire       [70:0]   _zz_io_masters_0_r_payload_data;
  wire       [64:0]   _zz_io_slaves_0_aw_payload_addr;
  wire       [72:0]   _zz_io_slaves_0_w_payload_data;
  wire       [64:0]   _zz_io_slaves_0_ar_payload_addr;
  wire       [64:0]   _zz_io_slaves_1_aw_payload_addr;
  wire       [72:0]   _zz_io_slaves_1_w_payload_data;
  wire       [64:0]   _zz_io_slaves_1_ar_payload_addr;
  reg                 _zz_when_Axi4Crossbar_l303;
  reg                 _zz_when_Axi4Crossbar_l303_1;
  reg        [0:0]    _zz_when_Axi4Crossbar_l342;
  reg        [0:0]    _zz_when_Axi4Crossbar_l342_1;
  reg                 _zz_when_Axi4Crossbar_l361;
  reg                 _zz_when_Axi4Crossbar_l361_1;
  reg        [0:0]    _zz_when_Axi4Crossbar_l391;
  reg        [0:0]    _zz_when_Axi4Crossbar_l391_1;
  wire                when_Axi4Crossbar_l303;
  wire       [0:0]    _zz_when_Axi4Crossbar_l316;
  reg        [1:0]    _zz_when_Axi4Crossbar_l316_1;
  wire       [0:0]    _zz_when_Axi4Crossbar_l161;
  wire       [0:0]    _zz_when_Axi4Crossbar_l161_1;
  wire       [0:0]    _zz_when_Axi4Crossbar_l161_2;
  wire       [0:0]    _zz_when_Axi4Crossbar_l161_3;
  reg        [0:0]    _zz_wrRrPtr_0;
  wire                when_Axi4Crossbar_l161;
  wire                when_Axi4Crossbar_l316;
  wire                when_Axi4Crossbar_l319;
  wire                io_slaves_0_aw_fire;
  wire                when_Axi4Crossbar_l342;
  wire                io_slaves_0_b_fire;
  wire                when_Axi4Crossbar_l303_1;
  wire       [0:0]    _zz_when_Axi4Crossbar_l316_2;
  reg        [1:0]    _zz_when_Axi4Crossbar_l316_3;
  wire       [0:0]    _zz_when_Axi4Crossbar_l161_4;
  wire       [0:0]    _zz_when_Axi4Crossbar_l161_5;
  wire       [0:0]    _zz_when_Axi4Crossbar_l161_6;
  wire       [0:0]    _zz_when_Axi4Crossbar_l161_7;
  reg        [0:0]    _zz_wrRrPtr_1;
  wire                when_Axi4Crossbar_l161_1;
  wire                when_Axi4Crossbar_l316_1;
  wire                when_Axi4Crossbar_l319_1;
  wire                io_slaves_1_aw_fire;
  wire                when_Axi4Crossbar_l342_1;
  wire                io_slaves_1_b_fire;
  wire                when_Axi4Crossbar_l361;
  wire       [0:0]    _zz_when_Axi4Crossbar_l374;
  reg        [1:0]    _zz_when_Axi4Crossbar_l374_1;
  wire       [0:0]    _zz_when_Axi4Crossbar_l161_8;
  wire       [0:0]    _zz_when_Axi4Crossbar_l161_9;
  wire       [0:0]    _zz_when_Axi4Crossbar_l161_10;
  wire       [0:0]    _zz_when_Axi4Crossbar_l161_11;
  reg        [0:0]    _zz_rdRrPtr_0;
  wire                when_Axi4Crossbar_l161_2;
  wire                when_Axi4Crossbar_l374;
  wire                when_Axi4Crossbar_l377;
  wire                io_slaves_0_ar_fire;
  wire                when_Axi4Crossbar_l391;
  wire                io_slaves_0_r_fire;
  wire                when_Axi4Crossbar_l401;
  wire                when_Axi4Crossbar_l361_1;
  wire       [0:0]    _zz_when_Axi4Crossbar_l374_2;
  reg        [1:0]    _zz_when_Axi4Crossbar_l374_3;
  wire       [0:0]    _zz_when_Axi4Crossbar_l161_12;
  wire       [0:0]    _zz_when_Axi4Crossbar_l161_13;
  wire       [0:0]    _zz_when_Axi4Crossbar_l161_14;
  wire       [0:0]    _zz_when_Axi4Crossbar_l161_15;
  reg        [0:0]    _zz_rdRrPtr_1;
  wire                when_Axi4Crossbar_l161_3;
  wire                when_Axi4Crossbar_l374_1;
  wire                when_Axi4Crossbar_l377_1;
  wire                io_slaves_1_ar_fire;
  wire                when_Axi4Crossbar_l391_1;
  wire                io_slaves_1_r_fire;
  wire                when_Axi4Crossbar_l401_1;

  assign _zz_when_Axi4Crossbar_l161_16 = ((|_zz_when_Axi4Crossbar_l161_1) ? (_zz_when_Axi4Crossbar_l161_2 & (~ _zz_when_Axi4Crossbar_l161_17)) : (_zz_when_Axi4Crossbar_l161_3 & (~ _zz_when_Axi4Crossbar_l161_18)));
  assign _zz_when_Axi4Crossbar_l161_17 = (_zz_when_Axi4Crossbar_l161_2 - 1'b1);
  assign _zz_when_Axi4Crossbar_l161_18 = (_zz_when_Axi4Crossbar_l161_3 - 1'b1);
  assign _zz_when_Axi4Crossbar_l161_1_1 = ((|_zz_when_Axi4Crossbar_l161_5) ? (_zz_when_Axi4Crossbar_l161_6 & (~ _zz_when_Axi4Crossbar_l161_1_2)) : (_zz_when_Axi4Crossbar_l161_7 & (~ _zz_when_Axi4Crossbar_l161_1_3)));
  assign _zz_when_Axi4Crossbar_l161_1_2 = (_zz_when_Axi4Crossbar_l161_6 - 1'b1);
  assign _zz_when_Axi4Crossbar_l161_1_3 = (_zz_when_Axi4Crossbar_l161_7 - 1'b1);
  assign _zz_when_Axi4Crossbar_l161_2_1 = ((|_zz_when_Axi4Crossbar_l161_9) ? (_zz_when_Axi4Crossbar_l161_10 & (~ _zz_when_Axi4Crossbar_l161_2_2)) : (_zz_when_Axi4Crossbar_l161_11 & (~ _zz_when_Axi4Crossbar_l161_2_3)));
  assign _zz_when_Axi4Crossbar_l161_2_2 = (_zz_when_Axi4Crossbar_l161_10 - 1'b1);
  assign _zz_when_Axi4Crossbar_l161_2_3 = (_zz_when_Axi4Crossbar_l161_11 - 1'b1);
  assign _zz_when_Axi4Crossbar_l161_3_1 = ((|_zz_when_Axi4Crossbar_l161_13) ? (_zz_when_Axi4Crossbar_l161_14 & (~ _zz_when_Axi4Crossbar_l161_3_2)) : (_zz_when_Axi4Crossbar_l161_15 & (~ _zz_when_Axi4Crossbar_l161_3_3)));
  assign _zz_when_Axi4Crossbar_l161_3_2 = (_zz_when_Axi4Crossbar_l161_14 - 1'b1);
  assign _zz_when_Axi4Crossbar_l161_3_3 = (_zz_when_Axi4Crossbar_l161_15 - 1'b1);
  always @(*) begin
    s0_axi_awready = 1'b0;
    if(when_Axi4Crossbar_l303) begin
      if(when_Axi4Crossbar_l316) begin
        if(when_Axi4Crossbar_l319) begin
          s0_axi_awready = m0_axi_awready;
        end
      end
    end
    if(when_Axi4Crossbar_l303_1) begin
      if(when_Axi4Crossbar_l316_1) begin
        if(when_Axi4Crossbar_l319_1) begin
          s0_axi_awready = m1_axi_awready;
        end
      end
    end
  end

  always @(*) begin
    s0_axi_wready = 1'b0;
    if(when_Axi4Crossbar_l303) begin
      if(when_Axi4Crossbar_l316) begin
        if(when_Axi4Crossbar_l319) begin
          s0_axi_wready = m0_axi_wready;
        end
      end
    end else begin
      if(when_Axi4Crossbar_l342) begin
        s0_axi_wready = m0_axi_wready;
      end
    end
    if(when_Axi4Crossbar_l303_1) begin
      if(when_Axi4Crossbar_l316_1) begin
        if(when_Axi4Crossbar_l319_1) begin
          s0_axi_wready = m1_axi_wready;
        end
      end
    end else begin
      if(when_Axi4Crossbar_l342_1) begin
        s0_axi_wready = m1_axi_wready;
      end
    end
  end

  always @(*) begin
    s0_axi_bvalid = 1'b0;
    if(!when_Axi4Crossbar_l303) begin
      if(when_Axi4Crossbar_l342) begin
        s0_axi_bvalid = m0_axi_bvalid;
      end
    end
    if(!when_Axi4Crossbar_l303_1) begin
      if(when_Axi4Crossbar_l342_1) begin
        s0_axi_bvalid = m1_axi_bvalid;
      end
    end
  end

  assign _zz_io_masters_0_b_payload_id = 6'h00;
  always @(*) begin
    s0_axi_bid = _zz_io_masters_0_b_payload_id[3 : 0];
    if(!when_Axi4Crossbar_l303) begin
      if(when_Axi4Crossbar_l342) begin
        s0_axi_bid = m0_axi_bid[3 : 0];
      end
    end
    if(!when_Axi4Crossbar_l303_1) begin
      if(when_Axi4Crossbar_l342_1) begin
        s0_axi_bid = m1_axi_bid[3 : 0];
      end
    end
  end

  always @(*) begin
    s0_axi_bresp = _zz_io_masters_0_b_payload_id[5 : 4];
    if(!when_Axi4Crossbar_l303) begin
      if(when_Axi4Crossbar_l342) begin
        s0_axi_bresp = m0_axi_bresp;
      end
    end
    if(!when_Axi4Crossbar_l303_1) begin
      if(when_Axi4Crossbar_l342_1) begin
        s0_axi_bresp = m1_axi_bresp;
      end
    end
  end

  always @(*) begin
    s0_axi_arready = 1'b0;
    if(when_Axi4Crossbar_l361) begin
      if(when_Axi4Crossbar_l374) begin
        if(when_Axi4Crossbar_l377) begin
          s0_axi_arready = m0_axi_arready;
        end
      end
    end
    if(when_Axi4Crossbar_l361_1) begin
      if(when_Axi4Crossbar_l374_1) begin
        if(when_Axi4Crossbar_l377_1) begin
          s0_axi_arready = m1_axi_arready;
        end
      end
    end
  end

  always @(*) begin
    s0_axi_rvalid = 1'b0;
    if(!when_Axi4Crossbar_l361) begin
      if(when_Axi4Crossbar_l391) begin
        s0_axi_rvalid = m0_axi_rvalid;
      end
    end
    if(!when_Axi4Crossbar_l361_1) begin
      if(when_Axi4Crossbar_l391_1) begin
        s0_axi_rvalid = m1_axi_rvalid;
      end
    end
  end

  assign _zz_io_masters_0_r_payload_data = 71'h000000000000000000;
  always @(*) begin
    s0_axi_rdata = _zz_io_masters_0_r_payload_data[63 : 0];
    if(!when_Axi4Crossbar_l361) begin
      if(when_Axi4Crossbar_l391) begin
        s0_axi_rdata = m0_axi_rdata;
      end
    end
    if(!when_Axi4Crossbar_l361_1) begin
      if(when_Axi4Crossbar_l391_1) begin
        s0_axi_rdata = m1_axi_rdata;
      end
    end
  end

  always @(*) begin
    s0_axi_rid = _zz_io_masters_0_r_payload_data[67 : 64];
    if(!when_Axi4Crossbar_l361) begin
      if(when_Axi4Crossbar_l391) begin
        s0_axi_rid = m0_axi_rid[3 : 0];
      end
    end
    if(!when_Axi4Crossbar_l361_1) begin
      if(when_Axi4Crossbar_l391_1) begin
        s0_axi_rid = m1_axi_rid[3 : 0];
      end
    end
  end

  always @(*) begin
    s0_axi_rresp = _zz_io_masters_0_r_payload_data[69 : 68];
    if(!when_Axi4Crossbar_l361) begin
      if(when_Axi4Crossbar_l391) begin
        s0_axi_rresp = m0_axi_rresp;
      end
    end
    if(!when_Axi4Crossbar_l361_1) begin
      if(when_Axi4Crossbar_l391_1) begin
        s0_axi_rresp = m1_axi_rresp;
      end
    end
  end

  always @(*) begin
    s0_axi_rlast = _zz_io_masters_0_r_payload_data[70];
    if(!when_Axi4Crossbar_l361) begin
      if(when_Axi4Crossbar_l391) begin
        s0_axi_rlast = m0_axi_rlast;
      end
    end
    if(!when_Axi4Crossbar_l361_1) begin
      if(when_Axi4Crossbar_l391_1) begin
        s0_axi_rlast = m1_axi_rlast;
      end
    end
  end

  always @(*) begin
    m0_axi_awvalid = 1'b0;
    if(when_Axi4Crossbar_l303) begin
      if(when_Axi4Crossbar_l316) begin
        m0_axi_awvalid = 1'b1;
      end
    end
  end

  assign _zz_io_slaves_0_aw_payload_addr = 65'h00000000000000000;
  always @(*) begin
    m0_axi_awaddr = _zz_io_slaves_0_aw_payload_addr[31 : 0];
    if(when_Axi4Crossbar_l303) begin
      if(when_Axi4Crossbar_l316) begin
        if(when_Axi4Crossbar_l319) begin
          m0_axi_awaddr = s0_axi_awaddr;
        end
      end
    end
  end

  always @(*) begin
    m0_axi_awid = _zz_io_slaves_0_aw_payload_addr[35 : 32];
    if(when_Axi4Crossbar_l303) begin
      if(when_Axi4Crossbar_l316) begin
        if(when_Axi4Crossbar_l319) begin
          m0_axi_awid = s0_axi_awid;
        end
      end
    end
  end

  assign m0_axi_awregion = _zz_io_slaves_0_aw_payload_addr[39 : 36];
  always @(*) begin
    m0_axi_awlen = _zz_io_slaves_0_aw_payload_addr[47 : 40];
    if(when_Axi4Crossbar_l303) begin
      if(when_Axi4Crossbar_l316) begin
        if(when_Axi4Crossbar_l319) begin
          m0_axi_awlen = s0_axi_awlen;
        end
      end
    end
  end

  always @(*) begin
    m0_axi_awsize = _zz_io_slaves_0_aw_payload_addr[50 : 48];
    if(when_Axi4Crossbar_l303) begin
      if(when_Axi4Crossbar_l316) begin
        if(when_Axi4Crossbar_l319) begin
          m0_axi_awsize = s0_axi_awsize;
        end
      end
    end
  end

  always @(*) begin
    m0_axi_awburst = _zz_io_slaves_0_aw_payload_addr[52 : 51];
    if(when_Axi4Crossbar_l303) begin
      if(when_Axi4Crossbar_l316) begin
        if(when_Axi4Crossbar_l319) begin
          m0_axi_awburst = s0_axi_awburst;
        end
      end
    end
  end

  always @(*) begin
    m0_axi_awlock = _zz_io_slaves_0_aw_payload_addr[53 : 53];
    if(when_Axi4Crossbar_l303) begin
      if(when_Axi4Crossbar_l316) begin
        if(when_Axi4Crossbar_l319) begin
          m0_axi_awlock = s0_axi_awlock;
        end
      end
    end
  end

  always @(*) begin
    m0_axi_awcache = _zz_io_slaves_0_aw_payload_addr[57 : 54];
    if(when_Axi4Crossbar_l303) begin
      if(when_Axi4Crossbar_l316) begin
        if(when_Axi4Crossbar_l319) begin
          m0_axi_awcache = s0_axi_awcache;
        end
      end
    end
  end

  always @(*) begin
    m0_axi_awqos = _zz_io_slaves_0_aw_payload_addr[61 : 58];
    if(when_Axi4Crossbar_l303) begin
      if(when_Axi4Crossbar_l316) begin
        if(when_Axi4Crossbar_l319) begin
          m0_axi_awqos = s0_axi_awqos;
        end
      end
    end
  end

  always @(*) begin
    m0_axi_awprot = _zz_io_slaves_0_aw_payload_addr[64 : 62];
    if(when_Axi4Crossbar_l303) begin
      if(when_Axi4Crossbar_l316) begin
        if(when_Axi4Crossbar_l319) begin
          m0_axi_awprot = s0_axi_awprot;
        end
      end
    end
  end

  always @(*) begin
    m0_axi_wvalid = 1'b0;
    if(when_Axi4Crossbar_l303) begin
      if(when_Axi4Crossbar_l316) begin
        if(when_Axi4Crossbar_l319) begin
          m0_axi_wvalid = s0_axi_wvalid;
        end
      end
    end else begin
      if(when_Axi4Crossbar_l342) begin
        m0_axi_wvalid = s0_axi_wvalid;
      end
    end
  end

  assign _zz_io_slaves_0_w_payload_data = 73'h0000000000000000000;
  always @(*) begin
    m0_axi_wdata = _zz_io_slaves_0_w_payload_data[63 : 0];
    if(when_Axi4Crossbar_l303) begin
      if(when_Axi4Crossbar_l316) begin
        if(when_Axi4Crossbar_l319) begin
          m0_axi_wdata = s0_axi_wdata;
        end
      end
    end else begin
      if(when_Axi4Crossbar_l342) begin
        m0_axi_wdata = s0_axi_wdata;
      end
    end
  end

  always @(*) begin
    m0_axi_wstrb = _zz_io_slaves_0_w_payload_data[71 : 64];
    if(when_Axi4Crossbar_l303) begin
      if(when_Axi4Crossbar_l316) begin
        if(when_Axi4Crossbar_l319) begin
          m0_axi_wstrb = s0_axi_wstrb;
        end
      end
    end else begin
      if(when_Axi4Crossbar_l342) begin
        m0_axi_wstrb = s0_axi_wstrb;
      end
    end
  end

  always @(*) begin
    m0_axi_wlast = _zz_io_slaves_0_w_payload_data[72];
    if(when_Axi4Crossbar_l303) begin
      if(when_Axi4Crossbar_l316) begin
        if(when_Axi4Crossbar_l319) begin
          m0_axi_wlast = s0_axi_wlast;
        end
      end
    end else begin
      if(when_Axi4Crossbar_l342) begin
        m0_axi_wlast = s0_axi_wlast;
      end
    end
  end

  always @(*) begin
    m0_axi_bready = 1'b0;
    if(!when_Axi4Crossbar_l303) begin
      if(when_Axi4Crossbar_l342) begin
        m0_axi_bready = s0_axi_bready;
      end
    end
  end

  always @(*) begin
    m0_axi_arvalid = 1'b0;
    if(when_Axi4Crossbar_l361) begin
      if(when_Axi4Crossbar_l374) begin
        m0_axi_arvalid = 1'b1;
      end
    end
  end

  assign _zz_io_slaves_0_ar_payload_addr = 65'h00000000000000000;
  always @(*) begin
    m0_axi_araddr = _zz_io_slaves_0_ar_payload_addr[31 : 0];
    if(when_Axi4Crossbar_l361) begin
      if(when_Axi4Crossbar_l374) begin
        if(when_Axi4Crossbar_l377) begin
          m0_axi_araddr = s0_axi_araddr;
        end
      end
    end
  end

  always @(*) begin
    m0_axi_arid = _zz_io_slaves_0_ar_payload_addr[35 : 32];
    if(when_Axi4Crossbar_l361) begin
      if(when_Axi4Crossbar_l374) begin
        if(when_Axi4Crossbar_l377) begin
          m0_axi_arid = s0_axi_arid;
        end
      end
    end
  end

  assign m0_axi_arregion = _zz_io_slaves_0_ar_payload_addr[39 : 36];
  always @(*) begin
    m0_axi_arlen = _zz_io_slaves_0_ar_payload_addr[47 : 40];
    if(when_Axi4Crossbar_l361) begin
      if(when_Axi4Crossbar_l374) begin
        if(when_Axi4Crossbar_l377) begin
          m0_axi_arlen = s0_axi_arlen;
        end
      end
    end
  end

  always @(*) begin
    m0_axi_arsize = _zz_io_slaves_0_ar_payload_addr[50 : 48];
    if(when_Axi4Crossbar_l361) begin
      if(when_Axi4Crossbar_l374) begin
        if(when_Axi4Crossbar_l377) begin
          m0_axi_arsize = s0_axi_arsize;
        end
      end
    end
  end

  always @(*) begin
    m0_axi_arburst = _zz_io_slaves_0_ar_payload_addr[52 : 51];
    if(when_Axi4Crossbar_l361) begin
      if(when_Axi4Crossbar_l374) begin
        if(when_Axi4Crossbar_l377) begin
          m0_axi_arburst = s0_axi_arburst;
        end
      end
    end
  end

  always @(*) begin
    m0_axi_arlock = _zz_io_slaves_0_ar_payload_addr[53 : 53];
    if(when_Axi4Crossbar_l361) begin
      if(when_Axi4Crossbar_l374) begin
        if(when_Axi4Crossbar_l377) begin
          m0_axi_arlock = s0_axi_arlock;
        end
      end
    end
  end

  always @(*) begin
    m0_axi_arcache = _zz_io_slaves_0_ar_payload_addr[57 : 54];
    if(when_Axi4Crossbar_l361) begin
      if(when_Axi4Crossbar_l374) begin
        if(when_Axi4Crossbar_l377) begin
          m0_axi_arcache = s0_axi_arcache;
        end
      end
    end
  end

  always @(*) begin
    m0_axi_arqos = _zz_io_slaves_0_ar_payload_addr[61 : 58];
    if(when_Axi4Crossbar_l361) begin
      if(when_Axi4Crossbar_l374) begin
        if(when_Axi4Crossbar_l377) begin
          m0_axi_arqos = s0_axi_arqos;
        end
      end
    end
  end

  always @(*) begin
    m0_axi_arprot = _zz_io_slaves_0_ar_payload_addr[64 : 62];
    if(when_Axi4Crossbar_l361) begin
      if(when_Axi4Crossbar_l374) begin
        if(when_Axi4Crossbar_l377) begin
          m0_axi_arprot = s0_axi_arprot;
        end
      end
    end
  end

  always @(*) begin
    m0_axi_rready = 1'b0;
    if(!when_Axi4Crossbar_l361) begin
      if(when_Axi4Crossbar_l391) begin
        m0_axi_rready = s0_axi_rready;
      end
    end
  end

  always @(*) begin
    m1_axi_awvalid = 1'b0;
    if(when_Axi4Crossbar_l303_1) begin
      if(when_Axi4Crossbar_l316_1) begin
        m1_axi_awvalid = 1'b1;
      end
    end
  end

  assign _zz_io_slaves_1_aw_payload_addr = 65'h00000000000000000;
  always @(*) begin
    m1_axi_awaddr = _zz_io_slaves_1_aw_payload_addr[31 : 0];
    if(when_Axi4Crossbar_l303_1) begin
      if(when_Axi4Crossbar_l316_1) begin
        if(when_Axi4Crossbar_l319_1) begin
          m1_axi_awaddr = s0_axi_awaddr;
        end
      end
    end
  end

  always @(*) begin
    m1_axi_awid = _zz_io_slaves_1_aw_payload_addr[35 : 32];
    if(when_Axi4Crossbar_l303_1) begin
      if(when_Axi4Crossbar_l316_1) begin
        if(when_Axi4Crossbar_l319_1) begin
          m1_axi_awid = s0_axi_awid;
        end
      end
    end
  end

  assign m1_axi_awregion = _zz_io_slaves_1_aw_payload_addr[39 : 36];
  always @(*) begin
    m1_axi_awlen = _zz_io_slaves_1_aw_payload_addr[47 : 40];
    if(when_Axi4Crossbar_l303_1) begin
      if(when_Axi4Crossbar_l316_1) begin
        if(when_Axi4Crossbar_l319_1) begin
          m1_axi_awlen = s0_axi_awlen;
        end
      end
    end
  end

  always @(*) begin
    m1_axi_awsize = _zz_io_slaves_1_aw_payload_addr[50 : 48];
    if(when_Axi4Crossbar_l303_1) begin
      if(when_Axi4Crossbar_l316_1) begin
        if(when_Axi4Crossbar_l319_1) begin
          m1_axi_awsize = s0_axi_awsize;
        end
      end
    end
  end

  always @(*) begin
    m1_axi_awburst = _zz_io_slaves_1_aw_payload_addr[52 : 51];
    if(when_Axi4Crossbar_l303_1) begin
      if(when_Axi4Crossbar_l316_1) begin
        if(when_Axi4Crossbar_l319_1) begin
          m1_axi_awburst = s0_axi_awburst;
        end
      end
    end
  end

  always @(*) begin
    m1_axi_awlock = _zz_io_slaves_1_aw_payload_addr[53 : 53];
    if(when_Axi4Crossbar_l303_1) begin
      if(when_Axi4Crossbar_l316_1) begin
        if(when_Axi4Crossbar_l319_1) begin
          m1_axi_awlock = s0_axi_awlock;
        end
      end
    end
  end

  always @(*) begin
    m1_axi_awcache = _zz_io_slaves_1_aw_payload_addr[57 : 54];
    if(when_Axi4Crossbar_l303_1) begin
      if(when_Axi4Crossbar_l316_1) begin
        if(when_Axi4Crossbar_l319_1) begin
          m1_axi_awcache = s0_axi_awcache;
        end
      end
    end
  end

  always @(*) begin
    m1_axi_awqos = _zz_io_slaves_1_aw_payload_addr[61 : 58];
    if(when_Axi4Crossbar_l303_1) begin
      if(when_Axi4Crossbar_l316_1) begin
        if(when_Axi4Crossbar_l319_1) begin
          m1_axi_awqos = s0_axi_awqos;
        end
      end
    end
  end

  always @(*) begin
    m1_axi_awprot = _zz_io_slaves_1_aw_payload_addr[64 : 62];
    if(when_Axi4Crossbar_l303_1) begin
      if(when_Axi4Crossbar_l316_1) begin
        if(when_Axi4Crossbar_l319_1) begin
          m1_axi_awprot = s0_axi_awprot;
        end
      end
    end
  end

  always @(*) begin
    m1_axi_wvalid = 1'b0;
    if(when_Axi4Crossbar_l303_1) begin
      if(when_Axi4Crossbar_l316_1) begin
        if(when_Axi4Crossbar_l319_1) begin
          m1_axi_wvalid = s0_axi_wvalid;
        end
      end
    end else begin
      if(when_Axi4Crossbar_l342_1) begin
        m1_axi_wvalid = s0_axi_wvalid;
      end
    end
  end

  assign _zz_io_slaves_1_w_payload_data = 73'h0000000000000000000;
  always @(*) begin
    m1_axi_wdata = _zz_io_slaves_1_w_payload_data[63 : 0];
    if(when_Axi4Crossbar_l303_1) begin
      if(when_Axi4Crossbar_l316_1) begin
        if(when_Axi4Crossbar_l319_1) begin
          m1_axi_wdata = s0_axi_wdata;
        end
      end
    end else begin
      if(when_Axi4Crossbar_l342_1) begin
        m1_axi_wdata = s0_axi_wdata;
      end
    end
  end

  always @(*) begin
    m1_axi_wstrb = _zz_io_slaves_1_w_payload_data[71 : 64];
    if(when_Axi4Crossbar_l303_1) begin
      if(when_Axi4Crossbar_l316_1) begin
        if(when_Axi4Crossbar_l319_1) begin
          m1_axi_wstrb = s0_axi_wstrb;
        end
      end
    end else begin
      if(when_Axi4Crossbar_l342_1) begin
        m1_axi_wstrb = s0_axi_wstrb;
      end
    end
  end

  always @(*) begin
    m1_axi_wlast = _zz_io_slaves_1_w_payload_data[72];
    if(when_Axi4Crossbar_l303_1) begin
      if(when_Axi4Crossbar_l316_1) begin
        if(when_Axi4Crossbar_l319_1) begin
          m1_axi_wlast = s0_axi_wlast;
        end
      end
    end else begin
      if(when_Axi4Crossbar_l342_1) begin
        m1_axi_wlast = s0_axi_wlast;
      end
    end
  end

  always @(*) begin
    m1_axi_bready = 1'b0;
    if(!when_Axi4Crossbar_l303_1) begin
      if(when_Axi4Crossbar_l342_1) begin
        m1_axi_bready = s0_axi_bready;
      end
    end
  end

  always @(*) begin
    m1_axi_arvalid = 1'b0;
    if(when_Axi4Crossbar_l361_1) begin
      if(when_Axi4Crossbar_l374_1) begin
        m1_axi_arvalid = 1'b1;
      end
    end
  end

  assign _zz_io_slaves_1_ar_payload_addr = 65'h00000000000000000;
  always @(*) begin
    m1_axi_araddr = _zz_io_slaves_1_ar_payload_addr[31 : 0];
    if(when_Axi4Crossbar_l361_1) begin
      if(when_Axi4Crossbar_l374_1) begin
        if(when_Axi4Crossbar_l377_1) begin
          m1_axi_araddr = s0_axi_araddr;
        end
      end
    end
  end

  always @(*) begin
    m1_axi_arid = _zz_io_slaves_1_ar_payload_addr[35 : 32];
    if(when_Axi4Crossbar_l361_1) begin
      if(when_Axi4Crossbar_l374_1) begin
        if(when_Axi4Crossbar_l377_1) begin
          m1_axi_arid = s0_axi_arid;
        end
      end
    end
  end

  assign m1_axi_arregion = _zz_io_slaves_1_ar_payload_addr[39 : 36];
  always @(*) begin
    m1_axi_arlen = _zz_io_slaves_1_ar_payload_addr[47 : 40];
    if(when_Axi4Crossbar_l361_1) begin
      if(when_Axi4Crossbar_l374_1) begin
        if(when_Axi4Crossbar_l377_1) begin
          m1_axi_arlen = s0_axi_arlen;
        end
      end
    end
  end

  always @(*) begin
    m1_axi_arsize = _zz_io_slaves_1_ar_payload_addr[50 : 48];
    if(when_Axi4Crossbar_l361_1) begin
      if(when_Axi4Crossbar_l374_1) begin
        if(when_Axi4Crossbar_l377_1) begin
          m1_axi_arsize = s0_axi_arsize;
        end
      end
    end
  end

  always @(*) begin
    m1_axi_arburst = _zz_io_slaves_1_ar_payload_addr[52 : 51];
    if(when_Axi4Crossbar_l361_1) begin
      if(when_Axi4Crossbar_l374_1) begin
        if(when_Axi4Crossbar_l377_1) begin
          m1_axi_arburst = s0_axi_arburst;
        end
      end
    end
  end

  always @(*) begin
    m1_axi_arlock = _zz_io_slaves_1_ar_payload_addr[53 : 53];
    if(when_Axi4Crossbar_l361_1) begin
      if(when_Axi4Crossbar_l374_1) begin
        if(when_Axi4Crossbar_l377_1) begin
          m1_axi_arlock = s0_axi_arlock;
        end
      end
    end
  end

  always @(*) begin
    m1_axi_arcache = _zz_io_slaves_1_ar_payload_addr[57 : 54];
    if(when_Axi4Crossbar_l361_1) begin
      if(when_Axi4Crossbar_l374_1) begin
        if(when_Axi4Crossbar_l377_1) begin
          m1_axi_arcache = s0_axi_arcache;
        end
      end
    end
  end

  always @(*) begin
    m1_axi_arqos = _zz_io_slaves_1_ar_payload_addr[61 : 58];
    if(when_Axi4Crossbar_l361_1) begin
      if(when_Axi4Crossbar_l374_1) begin
        if(when_Axi4Crossbar_l377_1) begin
          m1_axi_arqos = s0_axi_arqos;
        end
      end
    end
  end

  always @(*) begin
    m1_axi_arprot = _zz_io_slaves_1_ar_payload_addr[64 : 62];
    if(when_Axi4Crossbar_l361_1) begin
      if(when_Axi4Crossbar_l374_1) begin
        if(when_Axi4Crossbar_l377_1) begin
          m1_axi_arprot = s0_axi_arprot;
        end
      end
    end
  end

  always @(*) begin
    m1_axi_rready = 1'b0;
    if(!when_Axi4Crossbar_l361_1) begin
      if(when_Axi4Crossbar_l391_1) begin
        m1_axi_rready = s0_axi_rready;
      end
    end
  end

  assign when_Axi4Crossbar_l303 = (! _zz_when_Axi4Crossbar_l303);
  always @(*) begin
    _zz_when_Axi4Crossbar_l316_1[0] = ((32'h00000000 <= s0_axi_awaddr) && (s0_axi_awaddr < 32'h80000000));
    _zz_when_Axi4Crossbar_l316_1[1] = ((32'h80000000 <= s0_axi_awaddr) && (s0_axi_awaddr < 32'ha0000000));
  end

  assign _zz_when_Axi4Crossbar_l316[0] = (s0_axi_awvalid && _zz_when_Axi4Crossbar_l316_1[0]);
  assign _zz_when_Axi4Crossbar_l161[0] = (wrRrPtr_0 <= 1'b0);
  assign _zz_when_Axi4Crossbar_l161_1 = (_zz_when_Axi4Crossbar_l316 & _zz_when_Axi4Crossbar_l161);
  assign _zz_when_Axi4Crossbar_l161_2 = _zz_when_Axi4Crossbar_l161_1;
  assign _zz_when_Axi4Crossbar_l161_3 = _zz_when_Axi4Crossbar_l316;
  always @(*) begin
    _zz_wrRrPtr_0 = 1'b0;
    if(when_Axi4Crossbar_l161) begin
      _zz_wrRrPtr_0 = 1'b0;
    end
  end

  assign when_Axi4Crossbar_l161 = _zz_when_Axi4Crossbar_l161_16[0];
  assign when_Axi4Crossbar_l316 = (|_zz_when_Axi4Crossbar_l316);
  assign when_Axi4Crossbar_l319 = (_zz_wrRrPtr_0 == 1'b0);
  assign io_slaves_0_aw_fire = (m0_axi_awvalid && m0_axi_awready);
  assign when_Axi4Crossbar_l342 = (_zz_when_Axi4Crossbar_l342 == 1'b0);
  assign io_slaves_0_b_fire = (m0_axi_bvalid && m0_axi_bready);
  assign when_Axi4Crossbar_l303_1 = (! _zz_when_Axi4Crossbar_l303_1);
  always @(*) begin
    _zz_when_Axi4Crossbar_l316_3[0] = ((32'h00000000 <= s0_axi_awaddr) && (s0_axi_awaddr < 32'h80000000));
    _zz_when_Axi4Crossbar_l316_3[1] = ((32'h80000000 <= s0_axi_awaddr) && (s0_axi_awaddr < 32'ha0000000));
  end

  assign _zz_when_Axi4Crossbar_l316_2[0] = (s0_axi_awvalid && _zz_when_Axi4Crossbar_l316_3[1]);
  assign _zz_when_Axi4Crossbar_l161_4[0] = (wrRrPtr_1 <= 1'b0);
  assign _zz_when_Axi4Crossbar_l161_5 = (_zz_when_Axi4Crossbar_l316_2 & _zz_when_Axi4Crossbar_l161_4);
  assign _zz_when_Axi4Crossbar_l161_6 = _zz_when_Axi4Crossbar_l161_5;
  assign _zz_when_Axi4Crossbar_l161_7 = _zz_when_Axi4Crossbar_l316_2;
  always @(*) begin
    _zz_wrRrPtr_1 = 1'b0;
    if(when_Axi4Crossbar_l161_1) begin
      _zz_wrRrPtr_1 = 1'b0;
    end
  end

  assign when_Axi4Crossbar_l161_1 = _zz_when_Axi4Crossbar_l161_1_1[0];
  assign when_Axi4Crossbar_l316_1 = (|_zz_when_Axi4Crossbar_l316_2);
  assign when_Axi4Crossbar_l319_1 = (_zz_wrRrPtr_1 == 1'b0);
  assign io_slaves_1_aw_fire = (m1_axi_awvalid && m1_axi_awready);
  assign when_Axi4Crossbar_l342_1 = (_zz_when_Axi4Crossbar_l342_1 == 1'b0);
  assign io_slaves_1_b_fire = (m1_axi_bvalid && m1_axi_bready);
  assign when_Axi4Crossbar_l361 = (! _zz_when_Axi4Crossbar_l361);
  always @(*) begin
    _zz_when_Axi4Crossbar_l374_1[0] = ((32'h00000000 <= s0_axi_araddr) && (s0_axi_araddr < 32'h80000000));
    _zz_when_Axi4Crossbar_l374_1[1] = ((32'h80000000 <= s0_axi_araddr) && (s0_axi_araddr < 32'ha0000000));
  end

  assign _zz_when_Axi4Crossbar_l374[0] = (s0_axi_arvalid && _zz_when_Axi4Crossbar_l374_1[0]);
  assign _zz_when_Axi4Crossbar_l161_8[0] = (rdRrPtr_0 <= 1'b0);
  assign _zz_when_Axi4Crossbar_l161_9 = (_zz_when_Axi4Crossbar_l374 & _zz_when_Axi4Crossbar_l161_8);
  assign _zz_when_Axi4Crossbar_l161_10 = _zz_when_Axi4Crossbar_l161_9;
  assign _zz_when_Axi4Crossbar_l161_11 = _zz_when_Axi4Crossbar_l374;
  always @(*) begin
    _zz_rdRrPtr_0 = 1'b0;
    if(when_Axi4Crossbar_l161_2) begin
      _zz_rdRrPtr_0 = 1'b0;
    end
  end

  assign when_Axi4Crossbar_l161_2 = _zz_when_Axi4Crossbar_l161_2_1[0];
  assign when_Axi4Crossbar_l374 = (|_zz_when_Axi4Crossbar_l374);
  assign when_Axi4Crossbar_l377 = (_zz_rdRrPtr_0 == 1'b0);
  assign io_slaves_0_ar_fire = (m0_axi_arvalid && m0_axi_arready);
  assign when_Axi4Crossbar_l391 = (_zz_when_Axi4Crossbar_l391 == 1'b0);
  assign io_slaves_0_r_fire = (m0_axi_rvalid && m0_axi_rready);
  assign when_Axi4Crossbar_l401 = (io_slaves_0_r_fire && m0_axi_rlast);
  assign when_Axi4Crossbar_l361_1 = (! _zz_when_Axi4Crossbar_l361_1);
  always @(*) begin
    _zz_when_Axi4Crossbar_l374_3[0] = ((32'h00000000 <= s0_axi_araddr) && (s0_axi_araddr < 32'h80000000));
    _zz_when_Axi4Crossbar_l374_3[1] = ((32'h80000000 <= s0_axi_araddr) && (s0_axi_araddr < 32'ha0000000));
  end

  assign _zz_when_Axi4Crossbar_l374_2[0] = (s0_axi_arvalid && _zz_when_Axi4Crossbar_l374_3[1]);
  assign _zz_when_Axi4Crossbar_l161_12[0] = (rdRrPtr_1 <= 1'b0);
  assign _zz_when_Axi4Crossbar_l161_13 = (_zz_when_Axi4Crossbar_l374_2 & _zz_when_Axi4Crossbar_l161_12);
  assign _zz_when_Axi4Crossbar_l161_14 = _zz_when_Axi4Crossbar_l161_13;
  assign _zz_when_Axi4Crossbar_l161_15 = _zz_when_Axi4Crossbar_l374_2;
  always @(*) begin
    _zz_rdRrPtr_1 = 1'b0;
    if(when_Axi4Crossbar_l161_3) begin
      _zz_rdRrPtr_1 = 1'b0;
    end
  end

  assign when_Axi4Crossbar_l161_3 = _zz_when_Axi4Crossbar_l161_3_1[0];
  assign when_Axi4Crossbar_l374_1 = (|_zz_when_Axi4Crossbar_l374_2);
  assign when_Axi4Crossbar_l377_1 = (_zz_rdRrPtr_1 == 1'b0);
  assign io_slaves_1_ar_fire = (m1_axi_arvalid && m1_axi_arready);
  assign when_Axi4Crossbar_l391_1 = (_zz_when_Axi4Crossbar_l391_1 == 1'b0);
  assign io_slaves_1_r_fire = (m1_axi_rvalid && m1_axi_rready);
  assign when_Axi4Crossbar_l401_1 = (io_slaves_1_r_fire && m1_axi_rlast);
  always @(posedge aclk) begin
    if(!aresetn) begin
      wrRrPtr_0 <= 1'b0;
      wrRrPtr_1 <= 1'b0;
      rdRrPtr_0 <= 1'b0;
      rdRrPtr_1 <= 1'b0;
      _zz_when_Axi4Crossbar_l303 <= 1'b0;
      _zz_when_Axi4Crossbar_l303_1 <= 1'b0;
      _zz_when_Axi4Crossbar_l342 <= 1'b0;
      _zz_when_Axi4Crossbar_l342_1 <= 1'b0;
      _zz_when_Axi4Crossbar_l361 <= 1'b0;
      _zz_when_Axi4Crossbar_l361_1 <= 1'b0;
      _zz_when_Axi4Crossbar_l391 <= 1'b0;
      _zz_when_Axi4Crossbar_l391_1 <= 1'b0;
    end else begin
      if(when_Axi4Crossbar_l303) begin
        if(when_Axi4Crossbar_l316) begin
          if(io_slaves_0_aw_fire) begin
            _zz_when_Axi4Crossbar_l303 <= 1'b1;
            _zz_when_Axi4Crossbar_l342 <= _zz_wrRrPtr_0;
            wrRrPtr_0 <= (_zz_wrRrPtr_0 + 1'b1);
          end
        end
      end else begin
        if(io_slaves_0_b_fire) begin
          _zz_when_Axi4Crossbar_l303 <= 1'b0;
        end
      end
      if(when_Axi4Crossbar_l303_1) begin
        if(when_Axi4Crossbar_l316_1) begin
          if(io_slaves_1_aw_fire) begin
            _zz_when_Axi4Crossbar_l303_1 <= 1'b1;
            _zz_when_Axi4Crossbar_l342_1 <= _zz_wrRrPtr_1;
            wrRrPtr_1 <= (_zz_wrRrPtr_1 + 1'b1);
          end
        end
      end else begin
        if(io_slaves_1_b_fire) begin
          _zz_when_Axi4Crossbar_l303_1 <= 1'b0;
        end
      end
      if(when_Axi4Crossbar_l361) begin
        if(when_Axi4Crossbar_l374) begin
          if(io_slaves_0_ar_fire) begin
            _zz_when_Axi4Crossbar_l361 <= 1'b1;
            _zz_when_Axi4Crossbar_l391 <= _zz_rdRrPtr_0;
            rdRrPtr_0 <= (_zz_rdRrPtr_0 + 1'b1);
          end
        end
      end else begin
        if(when_Axi4Crossbar_l401) begin
          _zz_when_Axi4Crossbar_l361 <= 1'b0;
        end
      end
      if(when_Axi4Crossbar_l361_1) begin
        if(when_Axi4Crossbar_l374_1) begin
          if(io_slaves_1_ar_fire) begin
            _zz_when_Axi4Crossbar_l361_1 <= 1'b1;
            _zz_when_Axi4Crossbar_l391_1 <= _zz_rdRrPtr_1;
            rdRrPtr_1 <= (_zz_rdRrPtr_1 + 1'b1);
          end
        end
      end else begin
        if(when_Axi4Crossbar_l401_1) begin
          _zz_when_Axi4Crossbar_l361_1 <= 1'b0;
        end
      end
    end
  end


endmodule
