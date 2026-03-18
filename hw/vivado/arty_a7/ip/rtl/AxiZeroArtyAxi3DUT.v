// Copyright (c) 2026 Leonardo Capossio
// SPDX-License-Identifier: MIT
// Generator : SpinalHDL v1.10.1    git head : 2527c7c6b0fb0f95e5e1a5722a0be732b364ce43
// Component : Axi3BridgeTestTop
// Git hash  : 0a9a41afbaaacfe04903973a7d3809685e861cc5

`timescale 1ns/1ps

module Axi3BridgeTestTop (
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
  input  wire          clk,
  input  wire          resetn
);

  wire                adapter_io_axi3_awready;
  wire                adapter_io_axi3_wready;
  wire                adapter_io_axi3_arready;
  wire                adapter_io_axi3_bvalid;
  wire       [0:0]    adapter_io_axi3_bid;
  wire       [1:0]    adapter_io_axi3_bresp;
  wire                adapter_io_axi3_rvalid;
  wire       [0:0]    adapter_io_axi3_rid;
  wire       [31:0]   adapter_io_axi3_rdata;
  wire       [1:0]    adapter_io_axi3_rresp;
  wire                adapter_io_axi3_rlast;
  wire                adapter_io_axi4_arvalid;
  wire       [31:0]   adapter_io_axi4_araddr;
  wire       [0:0]    adapter_io_axi4_arid;
  wire       [3:0]    adapter_io_axi4_arregion;
  wire       [7:0]    adapter_io_axi4_arlen;
  wire       [2:0]    adapter_io_axi4_arsize;
  wire       [1:0]    adapter_io_axi4_arburst;
  wire       [0:0]    adapter_io_axi4_arlock;
  wire       [3:0]    adapter_io_axi4_arcache;
  wire       [3:0]    adapter_io_axi4_arqos;
  wire       [2:0]    adapter_io_axi4_arprot;
  wire                adapter_io_axi4_awvalid;
  wire       [31:0]   adapter_io_axi4_awaddr;
  wire       [0:0]    adapter_io_axi4_awid;
  wire       [3:0]    adapter_io_axi4_awregion;
  wire       [7:0]    adapter_io_axi4_awlen;
  wire       [2:0]    adapter_io_axi4_awsize;
  wire       [1:0]    adapter_io_axi4_awburst;
  wire       [0:0]    adapter_io_axi4_awlock;
  wire       [3:0]    adapter_io_axi4_awcache;
  wire       [3:0]    adapter_io_axi4_awqos;
  wire       [2:0]    adapter_io_axi4_awprot;
  wire                adapter_io_axi4_wvalid;
  wire       [31:0]   adapter_io_axi4_wdata;
  wire       [3:0]    adapter_io_axi4_wstrb;
  wire                adapter_io_axi4_wlast;
  wire                adapter_io_axi4_rready;
  wire                adapter_io_axi4_bready;
  wire                crossbar_io_masters_0_arready;
  wire                crossbar_io_masters_0_awready;
  wire                crossbar_io_masters_0_wready;
  wire                crossbar_io_masters_0_rvalid;
  wire       [31:0]   crossbar_io_masters_0_rdata;
  wire       [0:0]    crossbar_io_masters_0_rid;
  wire       [1:0]    crossbar_io_masters_0_rresp;
  wire                crossbar_io_masters_0_rlast;
  wire                crossbar_io_masters_0_bvalid;
  wire       [0:0]    crossbar_io_masters_0_bid;
  wire       [1:0]    crossbar_io_masters_0_bresp;
  wire                crossbar_io_slaves_0_arvalid;
  wire       [31:0]   crossbar_io_slaves_0_araddr;
  wire       [0:0]    crossbar_io_slaves_0_arid;
  wire       [3:0]    crossbar_io_slaves_0_arregion;
  wire       [7:0]    crossbar_io_slaves_0_arlen;
  wire       [2:0]    crossbar_io_slaves_0_arsize;
  wire       [1:0]    crossbar_io_slaves_0_arburst;
  wire       [0:0]    crossbar_io_slaves_0_arlock;
  wire       [3:0]    crossbar_io_slaves_0_arcache;
  wire       [3:0]    crossbar_io_slaves_0_arqos;
  wire       [2:0]    crossbar_io_slaves_0_arprot;
  wire                crossbar_io_slaves_0_awvalid;
  wire       [31:0]   crossbar_io_slaves_0_awaddr;
  wire       [0:0]    crossbar_io_slaves_0_awid;
  wire       [3:0]    crossbar_io_slaves_0_awregion;
  wire       [7:0]    crossbar_io_slaves_0_awlen;
  wire       [2:0]    crossbar_io_slaves_0_awsize;
  wire       [1:0]    crossbar_io_slaves_0_awburst;
  wire       [0:0]    crossbar_io_slaves_0_awlock;
  wire       [3:0]    crossbar_io_slaves_0_awcache;
  wire       [3:0]    crossbar_io_slaves_0_awqos;
  wire       [2:0]    crossbar_io_slaves_0_awprot;
  wire                crossbar_io_slaves_0_wvalid;
  wire       [31:0]   crossbar_io_slaves_0_wdata;
  wire       [3:0]    crossbar_io_slaves_0_wstrb;
  wire                crossbar_io_slaves_0_wlast;
  wire                crossbar_io_slaves_0_rready;
  wire                crossbar_io_slaves_0_bready;
  wire                crossbar_io_slaves_1_arvalid;
  wire       [31:0]   crossbar_io_slaves_1_araddr;
  wire       [0:0]    crossbar_io_slaves_1_arid;
  wire       [3:0]    crossbar_io_slaves_1_arregion;
  wire       [7:0]    crossbar_io_slaves_1_arlen;
  wire       [2:0]    crossbar_io_slaves_1_arsize;
  wire       [1:0]    crossbar_io_slaves_1_arburst;
  wire       [0:0]    crossbar_io_slaves_1_arlock;
  wire       [3:0]    crossbar_io_slaves_1_arcache;
  wire       [3:0]    crossbar_io_slaves_1_arqos;
  wire       [2:0]    crossbar_io_slaves_1_arprot;
  wire                crossbar_io_slaves_1_awvalid;
  wire       [31:0]   crossbar_io_slaves_1_awaddr;
  wire       [0:0]    crossbar_io_slaves_1_awid;
  wire       [3:0]    crossbar_io_slaves_1_awregion;
  wire       [7:0]    crossbar_io_slaves_1_awlen;
  wire       [2:0]    crossbar_io_slaves_1_awsize;
  wire       [1:0]    crossbar_io_slaves_1_awburst;
  wire       [0:0]    crossbar_io_slaves_1_awlock;
  wire       [3:0]    crossbar_io_slaves_1_awcache;
  wire       [3:0]    crossbar_io_slaves_1_awqos;
  wire       [2:0]    crossbar_io_slaves_1_awprot;
  wire                crossbar_io_slaves_1_wvalid;
  wire       [31:0]   crossbar_io_slaves_1_wdata;
  wire       [3:0]    crossbar_io_slaves_1_wstrb;
  wire                crossbar_io_slaves_1_wlast;
  wire                crossbar_io_slaves_1_rready;
  wire                crossbar_io_slaves_1_bready;
  wire                crossbar_io_slaves_2_arvalid;
  wire       [31:0]   crossbar_io_slaves_2_araddr;
  wire       [2:0]    crossbar_io_slaves_2_arprot;
  wire                crossbar_io_slaves_2_awvalid;
  wire       [31:0]   crossbar_io_slaves_2_awaddr;
  wire       [2:0]    crossbar_io_slaves_2_awprot;
  wire                crossbar_io_slaves_2_wvalid;
  wire       [31:0]   crossbar_io_slaves_2_wdata;
  wire       [3:0]    crossbar_io_slaves_2_wstrb;
  wire                crossbar_io_slaves_2_rready;
  wire                crossbar_io_slaves_2_bready;
  wire                crossbar_io_slaves_3_arvalid;
  wire       [31:0]   crossbar_io_slaves_3_araddr;
  wire       [2:0]    crossbar_io_slaves_3_arprot;
  wire                crossbar_io_slaves_3_awvalid;
  wire       [31:0]   crossbar_io_slaves_3_awaddr;
  wire       [2:0]    crossbar_io_slaves_3_awprot;
  wire                crossbar_io_slaves_3_wvalid;
  wire       [31:0]   crossbar_io_slaves_3_wdata;
  wire       [3:0]    crossbar_io_slaves_3_wstrb;
  wire                crossbar_io_slaves_3_rready;
  wire                crossbar_io_slaves_3_bready;
  wire                axi3Bus_awvalid;
  wire                axi3Bus_awready;
  wire       [0:0]    axi3Bus_awid;
  wire       [31:0]   axi3Bus_awaddr;
  wire       [3:0]    axi3Bus_awlen;
  wire       [2:0]    axi3Bus_awsize;
  wire       [1:0]    axi3Bus_awburst;
  wire       [1:0]    axi3Bus_awlock;
  wire       [3:0]    axi3Bus_awcache;
  wire       [2:0]    axi3Bus_awprot;
  wire                axi3Bus_wvalid;
  wire                axi3Bus_wready;
  wire       [0:0]    axi3Bus_wid;
  wire       [31:0]   axi3Bus_wdata;
  wire       [3:0]    axi3Bus_wstrb;
  wire                axi3Bus_wlast;
  wire                axi3Bus_bvalid;
  wire                axi3Bus_bready;
  wire       [0:0]    axi3Bus_bid;
  wire       [1:0]    axi3Bus_bresp;
  wire                axi3Bus_arvalid;
  wire                axi3Bus_arready;
  wire       [0:0]    axi3Bus_arid;
  wire       [31:0]   axi3Bus_araddr;
  wire       [3:0]    axi3Bus_arlen;
  wire       [2:0]    axi3Bus_arsize;
  wire       [1:0]    axi3Bus_arburst;
  wire       [1:0]    axi3Bus_arlock;
  wire       [3:0]    axi3Bus_arcache;
  wire       [2:0]    axi3Bus_arprot;
  wire                axi3Bus_rvalid;
  wire                axi3Bus_rready;
  wire       [0:0]    axi3Bus_rid;
  wire       [31:0]   axi3Bus_rdata;
  wire       [1:0]    axi3Bus_rresp;
  wire                axi3Bus_rlast;

  Axi3ToAxi4Adapter adapter (
    .io_axi3_awvalid          (axi3Bus_awvalid                          ), //i
    .io_axi3_awready          (adapter_io_axi3_awready                  ), //o
    .io_axi3_awid     (axi3Bus_awid                     ), //i
    .io_axi3_awaddr   (axi3Bus_awaddr[31:0]             ), //i
    .io_axi3_awlen    (axi3Bus_awlen[3:0]               ), //i
    .io_axi3_awsize   (axi3Bus_awsize[2:0]              ), //i
    .io_axi3_awburst  (axi3Bus_awburst[1:0]             ), //i
    .io_axi3_awlock   (axi3Bus_awlock[1:0]              ), //i
    .io_axi3_awcache  (axi3Bus_awcache[3:0]             ), //i
    .io_axi3_awprot   (axi3Bus_awprot[2:0]              ), //i
    .io_axi3_wvalid           (axi3Bus_wvalid                           ), //i
    .io_axi3_wready           (adapter_io_axi3_wready                   ), //o
    .io_axi3_wid      (axi3Bus_wid                      ), //i
    .io_axi3_wdata    (axi3Bus_wdata[31:0]              ), //i
    .io_axi3_wstrb    (axi3Bus_wstrb[3:0]               ), //i
    .io_axi3_wlast    (axi3Bus_wlast                    ), //i
    .io_axi3_bvalid           (adapter_io_axi3_bvalid                   ), //o
    .io_axi3_bready           (axi3Bus_bready                           ), //i
    .io_axi3_bid      (adapter_io_axi3_bid              ), //o
    .io_axi3_bresp    (adapter_io_axi3_bresp[1:0]       ), //o
    .io_axi3_arvalid          (axi3Bus_arvalid                          ), //i
    .io_axi3_arready          (adapter_io_axi3_arready                  ), //o
    .io_axi3_arid     (axi3Bus_arid                     ), //i
    .io_axi3_araddr   (axi3Bus_araddr[31:0]             ), //i
    .io_axi3_arlen    (axi3Bus_arlen[3:0]               ), //i
    .io_axi3_arsize   (axi3Bus_arsize[2:0]              ), //i
    .io_axi3_arburst  (axi3Bus_arburst[1:0]             ), //i
    .io_axi3_arlock   (axi3Bus_arlock[1:0]              ), //i
    .io_axi3_arcache  (axi3Bus_arcache[3:0]             ), //i
    .io_axi3_arprot   (axi3Bus_arprot[2:0]              ), //i
    .io_axi3_rvalid           (adapter_io_axi3_rvalid                   ), //o
    .io_axi3_rready           (axi3Bus_rready                           ), //i
    .io_axi3_rid      (adapter_io_axi3_rid              ), //o
    .io_axi3_rdata    (adapter_io_axi3_rdata[31:0]      ), //o
    .io_axi3_rresp    (adapter_io_axi3_rresp[1:0]       ), //o
    .io_axi3_rlast    (adapter_io_axi3_rlast            ), //o
    .io_axi4_awvalid          (adapter_io_axi4_awvalid                  ), //o
    .io_axi4_awready          (crossbar_io_masters_0_awready            ), //i
    .io_axi4_awaddr   (adapter_io_axi4_awaddr[31:0]     ), //o
    .io_axi4_awid     (adapter_io_axi4_awid             ), //o
    .io_axi4_awregion (adapter_io_axi4_awregion[3:0]    ), //o
    .io_axi4_awlen    (adapter_io_axi4_awlen[7:0]       ), //o
    .io_axi4_awsize   (adapter_io_axi4_awsize[2:0]      ), //o
    .io_axi4_awburst  (adapter_io_axi4_awburst[1:0]     ), //o
    .io_axi4_awlock   (adapter_io_axi4_awlock           ), //o
    .io_axi4_awcache  (adapter_io_axi4_awcache[3:0]     ), //o
    .io_axi4_awqos    (adapter_io_axi4_awqos[3:0]       ), //o
    .io_axi4_awprot   (adapter_io_axi4_awprot[2:0]      ), //o
    .io_axi4_wvalid           (adapter_io_axi4_wvalid                   ), //o
    .io_axi4_wready           (crossbar_io_masters_0_wready             ), //i
    .io_axi4_wdata    (adapter_io_axi4_wdata[31:0]      ), //o
    .io_axi4_wstrb    (adapter_io_axi4_wstrb[3:0]       ), //o
    .io_axi4_wlast    (adapter_io_axi4_wlast            ), //o
    .io_axi4_bvalid           (crossbar_io_masters_0_bvalid             ), //i
    .io_axi4_bready           (adapter_io_axi4_bready                   ), //o
    .io_axi4_bid      (crossbar_io_masters_0_bid        ), //i
    .io_axi4_bresp    (crossbar_io_masters_0_bresp[1:0] ), //i
    .io_axi4_arvalid          (adapter_io_axi4_arvalid                  ), //o
    .io_axi4_arready          (crossbar_io_masters_0_arready            ), //i
    .io_axi4_araddr   (adapter_io_axi4_araddr[31:0]     ), //o
    .io_axi4_arid     (adapter_io_axi4_arid             ), //o
    .io_axi4_arregion (adapter_io_axi4_arregion[3:0]    ), //o
    .io_axi4_arlen    (adapter_io_axi4_arlen[7:0]       ), //o
    .io_axi4_arsize   (adapter_io_axi4_arsize[2:0]      ), //o
    .io_axi4_arburst  (adapter_io_axi4_arburst[1:0]     ), //o
    .io_axi4_arlock   (adapter_io_axi4_arlock           ), //o
    .io_axi4_arcache  (adapter_io_axi4_arcache[3:0]     ), //o
    .io_axi4_arqos    (adapter_io_axi4_arqos[3:0]       ), //o
    .io_axi4_arprot   (adapter_io_axi4_arprot[2:0]      ), //o
    .io_axi4_rvalid           (crossbar_io_masters_0_rvalid             ), //i
    .io_axi4_rready           (adapter_io_axi4_rready                   ), //o
    .io_axi4_rdata    (crossbar_io_masters_0_rdata[31:0]), //i
    .io_axi4_rid      (crossbar_io_masters_0_rid        ), //i
    .io_axi4_rresp    (crossbar_io_masters_0_rresp[1:0] ), //i
    .io_axi4_rlast    (crossbar_io_masters_0_rlast      ), //i
    .clk                       (clk                                       ), //i
    .resetn                    (resetn                                    )  //i
  );
  AxiZeroMixedTop crossbar (
    .io_masters_0_awvalid          (adapter_io_axi4_awvalid                   ), //i
    .io_masters_0_awready          (crossbar_io_masters_0_awready             ), //o
    .io_masters_0_awaddr   (adapter_io_axi4_awaddr[31:0]      ), //i
    .io_masters_0_awid     (adapter_io_axi4_awid              ), //i
    .io_masters_0_awregion (adapter_io_axi4_awregion[3:0]     ), //i
    .io_masters_0_awlen    (adapter_io_axi4_awlen[7:0]        ), //i
    .io_masters_0_awsize   (adapter_io_axi4_awsize[2:0]       ), //i
    .io_masters_0_awburst  (adapter_io_axi4_awburst[1:0]      ), //i
    .io_masters_0_awlock   (adapter_io_axi4_awlock            ), //i
    .io_masters_0_awcache  (adapter_io_axi4_awcache[3:0]      ), //i
    .io_masters_0_awqos    (adapter_io_axi4_awqos[3:0]        ), //i
    .io_masters_0_awprot   (adapter_io_axi4_awprot[2:0]       ), //i
    .io_masters_0_wvalid           (adapter_io_axi4_wvalid                    ), //i
    .io_masters_0_wready           (crossbar_io_masters_0_wready              ), //o
    .io_masters_0_wdata    (adapter_io_axi4_wdata[31:0]       ), //i
    .io_masters_0_wstrb    (adapter_io_axi4_wstrb[3:0]        ), //i
    .io_masters_0_wlast    (adapter_io_axi4_wlast             ), //i
    .io_masters_0_bvalid           (crossbar_io_masters_0_bvalid              ), //o
    .io_masters_0_bready           (adapter_io_axi4_bready                    ), //i
    .io_masters_0_bid      (crossbar_io_masters_0_bid         ), //o
    .io_masters_0_bresp    (crossbar_io_masters_0_bresp[1:0]  ), //o
    .io_masters_0_arvalid          (adapter_io_axi4_arvalid                   ), //i
    .io_masters_0_arready          (crossbar_io_masters_0_arready             ), //o
    .io_masters_0_araddr   (adapter_io_axi4_araddr[31:0]      ), //i
    .io_masters_0_arid     (adapter_io_axi4_arid              ), //i
    .io_masters_0_arregion (adapter_io_axi4_arregion[3:0]     ), //i
    .io_masters_0_arlen    (adapter_io_axi4_arlen[7:0]        ), //i
    .io_masters_0_arsize   (adapter_io_axi4_arsize[2:0]       ), //i
    .io_masters_0_arburst  (adapter_io_axi4_arburst[1:0]      ), //i
    .io_masters_0_arlock   (adapter_io_axi4_arlock            ), //i
    .io_masters_0_arcache  (adapter_io_axi4_arcache[3:0]      ), //i
    .io_masters_0_arqos    (adapter_io_axi4_arqos[3:0]        ), //i
    .io_masters_0_arprot   (adapter_io_axi4_arprot[2:0]       ), //i
    .io_masters_0_rvalid           (crossbar_io_masters_0_rvalid              ), //o
    .io_masters_0_rready           (adapter_io_axi4_rready                    ), //i
    .io_masters_0_rdata    (crossbar_io_masters_0_rdata[31:0] ), //o
    .io_masters_0_rid      (crossbar_io_masters_0_rid         ), //o
    .io_masters_0_rresp    (crossbar_io_masters_0_rresp[1:0]  ), //o
    .io_masters_0_rlast    (crossbar_io_masters_0_rlast       ), //o
    .io_slaves_0_awvalid           (crossbar_io_slaves_0_awvalid              ), //o
    .io_slaves_0_awready           (m0_axi_awready                             ), //i
    .io_slaves_0_awaddr    (crossbar_io_slaves_0_awaddr[31:0] ), //o
    .io_slaves_0_awid      (crossbar_io_slaves_0_awid         ), //o
    .io_slaves_0_awregion  (crossbar_io_slaves_0_awregion[3:0]), //o
    .io_slaves_0_awlen     (crossbar_io_slaves_0_awlen[7:0]   ), //o
    .io_slaves_0_awsize    (crossbar_io_slaves_0_awsize[2:0]  ), //o
    .io_slaves_0_awburst   (crossbar_io_slaves_0_awburst[1:0] ), //o
    .io_slaves_0_awlock    (crossbar_io_slaves_0_awlock       ), //o
    .io_slaves_0_awcache   (crossbar_io_slaves_0_awcache[3:0] ), //o
    .io_slaves_0_awqos     (crossbar_io_slaves_0_awqos[3:0]   ), //o
    .io_slaves_0_awprot    (crossbar_io_slaves_0_awprot[2:0]  ), //o
    .io_slaves_0_wvalid            (crossbar_io_slaves_0_wvalid               ), //o
    .io_slaves_0_wready            (m0_axi_wready                              ), //i
    .io_slaves_0_wdata     (crossbar_io_slaves_0_wdata[31:0]  ), //o
    .io_slaves_0_wstrb     (crossbar_io_slaves_0_wstrb[3:0]   ), //o
    .io_slaves_0_wlast     (crossbar_io_slaves_0_wlast        ), //o
    .io_slaves_0_bvalid            (m0_axi_bvalid                              ), //i
    .io_slaves_0_bready            (crossbar_io_slaves_0_bready               ), //o
    .io_slaves_0_bid       (m0_axi_bid                         ), //i
    .io_slaves_0_bresp     (m0_axi_bresp[1:0]                  ), //i
    .io_slaves_0_arvalid           (crossbar_io_slaves_0_arvalid              ), //o
    .io_slaves_0_arready           (m0_axi_arready                             ), //i
    .io_slaves_0_araddr    (crossbar_io_slaves_0_araddr[31:0] ), //o
    .io_slaves_0_arid      (crossbar_io_slaves_0_arid         ), //o
    .io_slaves_0_arregion  (crossbar_io_slaves_0_arregion[3:0]), //o
    .io_slaves_0_arlen     (crossbar_io_slaves_0_arlen[7:0]   ), //o
    .io_slaves_0_arsize    (crossbar_io_slaves_0_arsize[2:0]  ), //o
    .io_slaves_0_arburst   (crossbar_io_slaves_0_arburst[1:0] ), //o
    .io_slaves_0_arlock    (crossbar_io_slaves_0_arlock       ), //o
    .io_slaves_0_arcache   (crossbar_io_slaves_0_arcache[3:0] ), //o
    .io_slaves_0_arqos     (crossbar_io_slaves_0_arqos[3:0]   ), //o
    .io_slaves_0_arprot    (crossbar_io_slaves_0_arprot[2:0]  ), //o
    .io_slaves_0_rvalid            (m0_axi_rvalid                              ), //i
    .io_slaves_0_rready            (crossbar_io_slaves_0_rready               ), //o
    .io_slaves_0_rdata     (m0_axi_rdata[31:0]                 ), //i
    .io_slaves_0_rid       (m0_axi_rid                         ), //i
    .io_slaves_0_rresp     (m0_axi_rresp[1:0]                  ), //i
    .io_slaves_0_rlast     (m0_axi_rlast                       ), //i
    .io_slaves_1_awvalid           (crossbar_io_slaves_1_awvalid              ), //o
    .io_slaves_1_awready           (m1_axi_awready                             ), //i
    .io_slaves_1_awaddr    (crossbar_io_slaves_1_awaddr[31:0] ), //o
    .io_slaves_1_awid      (crossbar_io_slaves_1_awid         ), //o
    .io_slaves_1_awregion  (crossbar_io_slaves_1_awregion[3:0]), //o
    .io_slaves_1_awlen     (crossbar_io_slaves_1_awlen[7:0]   ), //o
    .io_slaves_1_awsize    (crossbar_io_slaves_1_awsize[2:0]  ), //o
    .io_slaves_1_awburst   (crossbar_io_slaves_1_awburst[1:0] ), //o
    .io_slaves_1_awlock    (crossbar_io_slaves_1_awlock       ), //o
    .io_slaves_1_awcache   (crossbar_io_slaves_1_awcache[3:0] ), //o
    .io_slaves_1_awqos     (crossbar_io_slaves_1_awqos[3:0]   ), //o
    .io_slaves_1_awprot    (crossbar_io_slaves_1_awprot[2:0]  ), //o
    .io_slaves_1_wvalid            (crossbar_io_slaves_1_wvalid               ), //o
    .io_slaves_1_wready            (m1_axi_wready                              ), //i
    .io_slaves_1_wdata     (crossbar_io_slaves_1_wdata[31:0]  ), //o
    .io_slaves_1_wstrb     (crossbar_io_slaves_1_wstrb[3:0]   ), //o
    .io_slaves_1_wlast     (crossbar_io_slaves_1_wlast        ), //o
    .io_slaves_1_bvalid            (m1_axi_bvalid                              ), //i
    .io_slaves_1_bready            (crossbar_io_slaves_1_bready               ), //o
    .io_slaves_1_bid       (m1_axi_bid                         ), //i
    .io_slaves_1_bresp     (m1_axi_bresp[1:0]                  ), //i
    .io_slaves_1_arvalid           (crossbar_io_slaves_1_arvalid              ), //o
    .io_slaves_1_arready           (m1_axi_arready                             ), //i
    .io_slaves_1_araddr    (crossbar_io_slaves_1_araddr[31:0] ), //o
    .io_slaves_1_arid      (crossbar_io_slaves_1_arid         ), //o
    .io_slaves_1_arregion  (crossbar_io_slaves_1_arregion[3:0]), //o
    .io_slaves_1_arlen     (crossbar_io_slaves_1_arlen[7:0]   ), //o
    .io_slaves_1_arsize    (crossbar_io_slaves_1_arsize[2:0]  ), //o
    .io_slaves_1_arburst   (crossbar_io_slaves_1_arburst[1:0] ), //o
    .io_slaves_1_arlock    (crossbar_io_slaves_1_arlock       ), //o
    .io_slaves_1_arcache   (crossbar_io_slaves_1_arcache[3:0] ), //o
    .io_slaves_1_arqos     (crossbar_io_slaves_1_arqos[3:0]   ), //o
    .io_slaves_1_arprot    (crossbar_io_slaves_1_arprot[2:0]  ), //o
    .io_slaves_1_rvalid            (m1_axi_rvalid                              ), //i
    .io_slaves_1_rready            (crossbar_io_slaves_1_rready               ), //o
    .io_slaves_1_rdata     (m1_axi_rdata[31:0]                 ), //i
    .io_slaves_1_rid       (m1_axi_rid                         ), //i
    .io_slaves_1_rresp     (m1_axi_rresp[1:0]                  ), //i
    .io_slaves_1_rlast     (m1_axi_rlast                       ), //i
    .io_slaves_2_awvalid           (crossbar_io_slaves_2_awvalid              ), //o
    .io_slaves_2_awready           (m2_axi_awready                             ), //i
    .io_slaves_2_awaddr    (crossbar_io_slaves_2_awaddr[31:0] ), //o
    .io_slaves_2_awprot    (crossbar_io_slaves_2_awprot[2:0]  ), //o
    .io_slaves_2_wvalid            (crossbar_io_slaves_2_wvalid               ), //o
    .io_slaves_2_wready            (m2_axi_wready                              ), //i
    .io_slaves_2_wdata     (crossbar_io_slaves_2_wdata[31:0]  ), //o
    .io_slaves_2_wstrb     (crossbar_io_slaves_2_wstrb[3:0]   ), //o
    .io_slaves_2_bvalid            (m2_axi_bvalid                              ), //i
    .io_slaves_2_bready            (crossbar_io_slaves_2_bready               ), //o
    .io_slaves_2_bresp     (m2_axi_bresp[1:0]                  ), //i
    .io_slaves_2_arvalid           (crossbar_io_slaves_2_arvalid              ), //o
    .io_slaves_2_arready           (m2_axi_arready                             ), //i
    .io_slaves_2_araddr    (crossbar_io_slaves_2_araddr[31:0] ), //o
    .io_slaves_2_arprot    (crossbar_io_slaves_2_arprot[2:0]  ), //o
    .io_slaves_2_rvalid            (m2_axi_rvalid                              ), //i
    .io_slaves_2_rready            (crossbar_io_slaves_2_rready               ), //o
    .io_slaves_2_rdata     (m2_axi_rdata[31:0]                 ), //i
    .io_slaves_2_rresp     (m2_axi_rresp[1:0]                  ), //i
    .io_slaves_3_awvalid           (crossbar_io_slaves_3_awvalid              ), //o
    .io_slaves_3_awready           (m3_axi_awready                             ), //i
    .io_slaves_3_awaddr    (crossbar_io_slaves_3_awaddr[31:0] ), //o
    .io_slaves_3_awprot    (crossbar_io_slaves_3_awprot[2:0]  ), //o
    .io_slaves_3_wvalid            (crossbar_io_slaves_3_wvalid               ), //o
    .io_slaves_3_wready            (m3_axi_wready                              ), //i
    .io_slaves_3_wdata     (crossbar_io_slaves_3_wdata[31:0]  ), //o
    .io_slaves_3_wstrb     (crossbar_io_slaves_3_wstrb[3:0]   ), //o
    .io_slaves_3_bvalid            (m3_axi_bvalid                              ), //i
    .io_slaves_3_bready            (crossbar_io_slaves_3_bready               ), //o
    .io_slaves_3_bresp     (m3_axi_bresp[1:0]                  ), //i
    .io_slaves_3_arvalid           (crossbar_io_slaves_3_arvalid              ), //o
    .io_slaves_3_arready           (m3_axi_arready                             ), //i
    .io_slaves_3_araddr    (crossbar_io_slaves_3_araddr[31:0] ), //o
    .io_slaves_3_arprot    (crossbar_io_slaves_3_arprot[2:0]  ), //o
    .io_slaves_3_rvalid            (m3_axi_rvalid                              ), //i
    .io_slaves_3_rready            (crossbar_io_slaves_3_rready               ), //o
    .io_slaves_3_rdata     (m3_axi_rdata[31:0]                 ), //i
    .io_slaves_3_rresp     (m3_axi_rresp[1:0]                  ), //i
    .clk                            (clk                                        ), //i
    .resetn                         (resetn                                     )  //i
  );
  assign axi3Bus_awvalid = s0_axi_awvalid;
  assign s0_axi_awready = axi3Bus_awready;
  assign axi3Bus_awid = s0_axi_awid;
  assign axi3Bus_awaddr = s0_axi_awaddr;
  assign axi3Bus_awlen = s0_axi_awlen[3:0];
  assign axi3Bus_awsize = s0_axi_awsize;
  assign axi3Bus_awburst = s0_axi_awburst;
  assign axi3Bus_awlock = {1'd0, s0_axi_awlock};
  assign axi3Bus_awcache = s0_axi_awcache;
  assign axi3Bus_awprot = s0_axi_awprot;
  assign axi3Bus_wvalid = s0_axi_wvalid;
  assign s0_axi_wready = axi3Bus_wready;
  assign axi3Bus_wid = 1'b0;
  assign axi3Bus_wdata = s0_axi_wdata;
  assign axi3Bus_wstrb = s0_axi_wstrb;
  assign axi3Bus_wlast = s0_axi_wlast;
  assign s0_axi_bvalid = axi3Bus_bvalid;
  assign axi3Bus_bready = s0_axi_bready;
  assign s0_axi_bid = axi3Bus_bid;
  assign s0_axi_bresp = axi3Bus_bresp;
  assign axi3Bus_arvalid = s0_axi_arvalid;
  assign s0_axi_arready = axi3Bus_arready;
  assign axi3Bus_arid = s0_axi_arid;
  assign axi3Bus_araddr = s0_axi_araddr;
  assign axi3Bus_arlen = s0_axi_arlen[3:0];
  assign axi3Bus_arsize = s0_axi_arsize;
  assign axi3Bus_arburst = s0_axi_arburst;
  assign axi3Bus_arlock = {1'd0, s0_axi_arlock};
  assign axi3Bus_arcache = s0_axi_arcache;
  assign axi3Bus_arprot = s0_axi_arprot;
  assign s0_axi_rvalid = axi3Bus_rvalid;
  assign axi3Bus_rready = s0_axi_rready;
  assign s0_axi_rid = axi3Bus_rid;
  assign s0_axi_rdata = axi3Bus_rdata;
  assign s0_axi_rresp = axi3Bus_rresp;
  assign s0_axi_rlast = axi3Bus_rlast;
  assign axi3Bus_awready = adapter_io_axi3_awready;
  assign axi3Bus_wready = adapter_io_axi3_wready;
  assign axi3Bus_bvalid = adapter_io_axi3_bvalid;
  assign axi3Bus_bid = adapter_io_axi3_bid;
  assign axi3Bus_bresp = adapter_io_axi3_bresp;
  assign axi3Bus_arready = adapter_io_axi3_arready;
  assign axi3Bus_rvalid = adapter_io_axi3_rvalid;
  assign axi3Bus_rid = adapter_io_axi3_rid;
  assign axi3Bus_rdata = adapter_io_axi3_rdata;
  assign axi3Bus_rresp = adapter_io_axi3_rresp;
  assign axi3Bus_rlast = adapter_io_axi3_rlast;
  assign m0_axi_awvalid = crossbar_io_slaves_0_awvalid;
  assign m0_axi_awaddr = crossbar_io_slaves_0_awaddr;
  assign m0_axi_awid = crossbar_io_slaves_0_awid;
  assign m0_axi_awregion = crossbar_io_slaves_0_awregion;
  assign m0_axi_awlen = crossbar_io_slaves_0_awlen;
  assign m0_axi_awsize = crossbar_io_slaves_0_awsize;
  assign m0_axi_awburst = crossbar_io_slaves_0_awburst;
  assign m0_axi_awlock = crossbar_io_slaves_0_awlock;
  assign m0_axi_awcache = crossbar_io_slaves_0_awcache;
  assign m0_axi_awqos = crossbar_io_slaves_0_awqos;
  assign m0_axi_awprot = crossbar_io_slaves_0_awprot;
  assign m0_axi_wvalid = crossbar_io_slaves_0_wvalid;
  assign m0_axi_wdata = crossbar_io_slaves_0_wdata;
  assign m0_axi_wstrb = crossbar_io_slaves_0_wstrb;
  assign m0_axi_wlast = crossbar_io_slaves_0_wlast;
  assign m0_axi_bready = crossbar_io_slaves_0_bready;
  assign m0_axi_arvalid = crossbar_io_slaves_0_arvalid;
  assign m0_axi_araddr = crossbar_io_slaves_0_araddr;
  assign m0_axi_arid = crossbar_io_slaves_0_arid;
  assign m0_axi_arregion = crossbar_io_slaves_0_arregion;
  assign m0_axi_arlen = crossbar_io_slaves_0_arlen;
  assign m0_axi_arsize = crossbar_io_slaves_0_arsize;
  assign m0_axi_arburst = crossbar_io_slaves_0_arburst;
  assign m0_axi_arlock = crossbar_io_slaves_0_arlock;
  assign m0_axi_arcache = crossbar_io_slaves_0_arcache;
  assign m0_axi_arqos = crossbar_io_slaves_0_arqos;
  assign m0_axi_arprot = crossbar_io_slaves_0_arprot;
  assign m0_axi_rready = crossbar_io_slaves_0_rready;
  assign m1_axi_awvalid = crossbar_io_slaves_1_awvalid;
  assign m1_axi_awaddr = crossbar_io_slaves_1_awaddr;
  assign m1_axi_awid = crossbar_io_slaves_1_awid;
  assign m1_axi_awregion = crossbar_io_slaves_1_awregion;
  assign m1_axi_awlen = crossbar_io_slaves_1_awlen;
  assign m1_axi_awsize = crossbar_io_slaves_1_awsize;
  assign m1_axi_awburst = crossbar_io_slaves_1_awburst;
  assign m1_axi_awlock = crossbar_io_slaves_1_awlock;
  assign m1_axi_awcache = crossbar_io_slaves_1_awcache;
  assign m1_axi_awqos = crossbar_io_slaves_1_awqos;
  assign m1_axi_awprot = crossbar_io_slaves_1_awprot;
  assign m1_axi_wvalid = crossbar_io_slaves_1_wvalid;
  assign m1_axi_wdata = crossbar_io_slaves_1_wdata;
  assign m1_axi_wstrb = crossbar_io_slaves_1_wstrb;
  assign m1_axi_wlast = crossbar_io_slaves_1_wlast;
  assign m1_axi_bready = crossbar_io_slaves_1_bready;
  assign m1_axi_arvalid = crossbar_io_slaves_1_arvalid;
  assign m1_axi_araddr = crossbar_io_slaves_1_araddr;
  assign m1_axi_arid = crossbar_io_slaves_1_arid;
  assign m1_axi_arregion = crossbar_io_slaves_1_arregion;
  assign m1_axi_arlen = crossbar_io_slaves_1_arlen;
  assign m1_axi_arsize = crossbar_io_slaves_1_arsize;
  assign m1_axi_arburst = crossbar_io_slaves_1_arburst;
  assign m1_axi_arlock = crossbar_io_slaves_1_arlock;
  assign m1_axi_arcache = crossbar_io_slaves_1_arcache;
  assign m1_axi_arqos = crossbar_io_slaves_1_arqos;
  assign m1_axi_arprot = crossbar_io_slaves_1_arprot;
  assign m1_axi_rready = crossbar_io_slaves_1_rready;
  assign m2_axi_awvalid = crossbar_io_slaves_2_awvalid;
  assign m2_axi_awaddr = crossbar_io_slaves_2_awaddr;
  assign m2_axi_awprot = crossbar_io_slaves_2_awprot;
  assign m2_axi_wvalid = crossbar_io_slaves_2_wvalid;
  assign m2_axi_wdata = crossbar_io_slaves_2_wdata;
  assign m2_axi_wstrb = crossbar_io_slaves_2_wstrb;
  assign m2_axi_bready = crossbar_io_slaves_2_bready;
  assign m2_axi_arvalid = crossbar_io_slaves_2_arvalid;
  assign m2_axi_araddr = crossbar_io_slaves_2_araddr;
  assign m2_axi_arprot = crossbar_io_slaves_2_arprot;
  assign m2_axi_rready = crossbar_io_slaves_2_rready;
  assign m3_axi_awvalid = crossbar_io_slaves_3_awvalid;
  assign m3_axi_awaddr = crossbar_io_slaves_3_awaddr;
  assign m3_axi_awprot = crossbar_io_slaves_3_awprot;
  assign m3_axi_wvalid = crossbar_io_slaves_3_wvalid;
  assign m3_axi_wdata = crossbar_io_slaves_3_wdata;
  assign m3_axi_wstrb = crossbar_io_slaves_3_wstrb;
  assign m3_axi_bready = crossbar_io_slaves_3_bready;
  assign m3_axi_arvalid = crossbar_io_slaves_3_arvalid;
  assign m3_axi_araddr = crossbar_io_slaves_3_araddr;
  assign m3_axi_arprot = crossbar_io_slaves_3_arprot;
  assign m3_axi_rready = crossbar_io_slaves_3_rready;

endmodule

module AxiZeroMixedTop (
  input  wire          io_masters_0_awvalid,
  output wire          io_masters_0_awready,
  input  wire [31:0]   io_masters_0_awaddr,
  input  wire [0:0]    io_masters_0_awid,
  input  wire [3:0]    io_masters_0_awregion,
  input  wire [7:0]    io_masters_0_awlen,
  input  wire [2:0]    io_masters_0_awsize,
  input  wire [1:0]    io_masters_0_awburst,
  input  wire [0:0]    io_masters_0_awlock,
  input  wire [3:0]    io_masters_0_awcache,
  input  wire [3:0]    io_masters_0_awqos,
  input  wire [2:0]    io_masters_0_awprot,
  input  wire          io_masters_0_wvalid,
  output wire          io_masters_0_wready,
  input  wire [31:0]   io_masters_0_wdata,
  input  wire [3:0]    io_masters_0_wstrb,
  input  wire          io_masters_0_wlast,
  output wire          io_masters_0_bvalid,
  input  wire          io_masters_0_bready,
  output wire [0:0]    io_masters_0_bid,
  output wire [1:0]    io_masters_0_bresp,
  input  wire          io_masters_0_arvalid,
  output wire          io_masters_0_arready,
  input  wire [31:0]   io_masters_0_araddr,
  input  wire [0:0]    io_masters_0_arid,
  input  wire [3:0]    io_masters_0_arregion,
  input  wire [7:0]    io_masters_0_arlen,
  input  wire [2:0]    io_masters_0_arsize,
  input  wire [1:0]    io_masters_0_arburst,
  input  wire [0:0]    io_masters_0_arlock,
  input  wire [3:0]    io_masters_0_arcache,
  input  wire [3:0]    io_masters_0_arqos,
  input  wire [2:0]    io_masters_0_arprot,
  output wire          io_masters_0_rvalid,
  input  wire          io_masters_0_rready,
  output wire [31:0]   io_masters_0_rdata,
  output wire [0:0]    io_masters_0_rid,
  output wire [1:0]    io_masters_0_rresp,
  output wire          io_masters_0_rlast,
  output wire          io_slaves_0_awvalid,
  input  wire          io_slaves_0_awready,
  output wire [31:0]   io_slaves_0_awaddr,
  output wire [0:0]    io_slaves_0_awid,
  output wire [3:0]    io_slaves_0_awregion,
  output wire [7:0]    io_slaves_0_awlen,
  output wire [2:0]    io_slaves_0_awsize,
  output wire [1:0]    io_slaves_0_awburst,
  output wire [0:0]    io_slaves_0_awlock,
  output wire [3:0]    io_slaves_0_awcache,
  output wire [3:0]    io_slaves_0_awqos,
  output wire [2:0]    io_slaves_0_awprot,
  output wire          io_slaves_0_wvalid,
  input  wire          io_slaves_0_wready,
  output wire [31:0]   io_slaves_0_wdata,
  output wire [3:0]    io_slaves_0_wstrb,
  output wire          io_slaves_0_wlast,
  input  wire          io_slaves_0_bvalid,
  output wire          io_slaves_0_bready,
  input  wire [0:0]    io_slaves_0_bid,
  input  wire [1:0]    io_slaves_0_bresp,
  output wire          io_slaves_0_arvalid,
  input  wire          io_slaves_0_arready,
  output wire [31:0]   io_slaves_0_araddr,
  output wire [0:0]    io_slaves_0_arid,
  output wire [3:0]    io_slaves_0_arregion,
  output wire [7:0]    io_slaves_0_arlen,
  output wire [2:0]    io_slaves_0_arsize,
  output wire [1:0]    io_slaves_0_arburst,
  output wire [0:0]    io_slaves_0_arlock,
  output wire [3:0]    io_slaves_0_arcache,
  output wire [3:0]    io_slaves_0_arqos,
  output wire [2:0]    io_slaves_0_arprot,
  input  wire          io_slaves_0_rvalid,
  output wire          io_slaves_0_rready,
  input  wire [31:0]   io_slaves_0_rdata,
  input  wire [0:0]    io_slaves_0_rid,
  input  wire [1:0]    io_slaves_0_rresp,
  input  wire          io_slaves_0_rlast,
  output wire          io_slaves_1_awvalid,
  input  wire          io_slaves_1_awready,
  output wire [31:0]   io_slaves_1_awaddr,
  output wire [0:0]    io_slaves_1_awid,
  output wire [3:0]    io_slaves_1_awregion,
  output wire [7:0]    io_slaves_1_awlen,
  output wire [2:0]    io_slaves_1_awsize,
  output wire [1:0]    io_slaves_1_awburst,
  output wire [0:0]    io_slaves_1_awlock,
  output wire [3:0]    io_slaves_1_awcache,
  output wire [3:0]    io_slaves_1_awqos,
  output wire [2:0]    io_slaves_1_awprot,
  output wire          io_slaves_1_wvalid,
  input  wire          io_slaves_1_wready,
  output wire [31:0]   io_slaves_1_wdata,
  output wire [3:0]    io_slaves_1_wstrb,
  output wire          io_slaves_1_wlast,
  input  wire          io_slaves_1_bvalid,
  output wire          io_slaves_1_bready,
  input  wire [0:0]    io_slaves_1_bid,
  input  wire [1:0]    io_slaves_1_bresp,
  output wire          io_slaves_1_arvalid,
  input  wire          io_slaves_1_arready,
  output wire [31:0]   io_slaves_1_araddr,
  output wire [0:0]    io_slaves_1_arid,
  output wire [3:0]    io_slaves_1_arregion,
  output wire [7:0]    io_slaves_1_arlen,
  output wire [2:0]    io_slaves_1_arsize,
  output wire [1:0]    io_slaves_1_arburst,
  output wire [0:0]    io_slaves_1_arlock,
  output wire [3:0]    io_slaves_1_arcache,
  output wire [3:0]    io_slaves_1_arqos,
  output wire [2:0]    io_slaves_1_arprot,
  input  wire          io_slaves_1_rvalid,
  output wire          io_slaves_1_rready,
  input  wire [31:0]   io_slaves_1_rdata,
  input  wire [0:0]    io_slaves_1_rid,
  input  wire [1:0]    io_slaves_1_rresp,
  input  wire          io_slaves_1_rlast,
  output wire          io_slaves_2_awvalid,
  input  wire          io_slaves_2_awready,
  output wire [31:0]   io_slaves_2_awaddr,
  output wire [2:0]    io_slaves_2_awprot,
  output wire          io_slaves_2_wvalid,
  input  wire          io_slaves_2_wready,
  output wire [31:0]   io_slaves_2_wdata,
  output wire [3:0]    io_slaves_2_wstrb,
  input  wire          io_slaves_2_bvalid,
  output wire          io_slaves_2_bready,
  input  wire [1:0]    io_slaves_2_bresp,
  output wire          io_slaves_2_arvalid,
  input  wire          io_slaves_2_arready,
  output wire [31:0]   io_slaves_2_araddr,
  output wire [2:0]    io_slaves_2_arprot,
  input  wire          io_slaves_2_rvalid,
  output wire          io_slaves_2_rready,
  input  wire [31:0]   io_slaves_2_rdata,
  input  wire [1:0]    io_slaves_2_rresp,
  output wire          io_slaves_3_awvalid,
  input  wire          io_slaves_3_awready,
  output wire [31:0]   io_slaves_3_awaddr,
  output wire [2:0]    io_slaves_3_awprot,
  output wire          io_slaves_3_wvalid,
  input  wire          io_slaves_3_wready,
  output wire [31:0]   io_slaves_3_wdata,
  output wire [3:0]    io_slaves_3_wstrb,
  input  wire          io_slaves_3_bvalid,
  output wire          io_slaves_3_bready,
  input  wire [1:0]    io_slaves_3_bresp,
  output wire          io_slaves_3_arvalid,
  input  wire          io_slaves_3_arready,
  output wire [31:0]   io_slaves_3_araddr,
  output wire [2:0]    io_slaves_3_arprot,
  input  wire          io_slaves_3_rvalid,
  output wire          io_slaves_3_rready,
  input  wire [31:0]   io_slaves_3_rdata,
  input  wire [1:0]    io_slaves_3_rresp,
  input  wire          clk,
  input  wire          resetn
);

  wire                xbar_io_masters_0_arready;
  wire                xbar_io_masters_0_awready;
  wire                xbar_io_masters_0_wready;
  wire                xbar_io_masters_0_rvalid;
  wire       [31:0]   xbar_io_masters_0_rdata;
  wire       [0:0]    xbar_io_masters_0_rid;
  wire       [1:0]    xbar_io_masters_0_rresp;
  wire                xbar_io_masters_0_rlast;
  wire                xbar_io_masters_0_bvalid;
  wire       [0:0]    xbar_io_masters_0_bid;
  wire       [1:0]    xbar_io_masters_0_bresp;
  wire                xbar_io_slaves_0_arvalid;
  wire       [31:0]   xbar_io_slaves_0_araddr;
  wire       [0:0]    xbar_io_slaves_0_arid;
  wire       [3:0]    xbar_io_slaves_0_arregion;
  wire       [7:0]    xbar_io_slaves_0_arlen;
  wire       [2:0]    xbar_io_slaves_0_arsize;
  wire       [1:0]    xbar_io_slaves_0_arburst;
  wire       [0:0]    xbar_io_slaves_0_arlock;
  wire       [3:0]    xbar_io_slaves_0_arcache;
  wire       [3:0]    xbar_io_slaves_0_arqos;
  wire       [2:0]    xbar_io_slaves_0_arprot;
  wire                xbar_io_slaves_0_awvalid;
  wire       [31:0]   xbar_io_slaves_0_awaddr;
  wire       [0:0]    xbar_io_slaves_0_awid;
  wire       [3:0]    xbar_io_slaves_0_awregion;
  wire       [7:0]    xbar_io_slaves_0_awlen;
  wire       [2:0]    xbar_io_slaves_0_awsize;
  wire       [1:0]    xbar_io_slaves_0_awburst;
  wire       [0:0]    xbar_io_slaves_0_awlock;
  wire       [3:0]    xbar_io_slaves_0_awcache;
  wire       [3:0]    xbar_io_slaves_0_awqos;
  wire       [2:0]    xbar_io_slaves_0_awprot;
  wire                xbar_io_slaves_0_wvalid;
  wire       [31:0]   xbar_io_slaves_0_wdata;
  wire       [3:0]    xbar_io_slaves_0_wstrb;
  wire                xbar_io_slaves_0_wlast;
  wire                xbar_io_slaves_0_rready;
  wire                xbar_io_slaves_0_bready;
  wire                xbar_io_slaves_1_arvalid;
  wire       [31:0]   xbar_io_slaves_1_araddr;
  wire       [0:0]    xbar_io_slaves_1_arid;
  wire       [3:0]    xbar_io_slaves_1_arregion;
  wire       [7:0]    xbar_io_slaves_1_arlen;
  wire       [2:0]    xbar_io_slaves_1_arsize;
  wire       [1:0]    xbar_io_slaves_1_arburst;
  wire       [0:0]    xbar_io_slaves_1_arlock;
  wire       [3:0]    xbar_io_slaves_1_arcache;
  wire       [3:0]    xbar_io_slaves_1_arqos;
  wire       [2:0]    xbar_io_slaves_1_arprot;
  wire                xbar_io_slaves_1_awvalid;
  wire       [31:0]   xbar_io_slaves_1_awaddr;
  wire       [0:0]    xbar_io_slaves_1_awid;
  wire       [3:0]    xbar_io_slaves_1_awregion;
  wire       [7:0]    xbar_io_slaves_1_awlen;
  wire       [2:0]    xbar_io_slaves_1_awsize;
  wire       [1:0]    xbar_io_slaves_1_awburst;
  wire       [0:0]    xbar_io_slaves_1_awlock;
  wire       [3:0]    xbar_io_slaves_1_awcache;
  wire       [3:0]    xbar_io_slaves_1_awqos;
  wire       [2:0]    xbar_io_slaves_1_awprot;
  wire                xbar_io_slaves_1_wvalid;
  wire       [31:0]   xbar_io_slaves_1_wdata;
  wire       [3:0]    xbar_io_slaves_1_wstrb;
  wire                xbar_io_slaves_1_wlast;
  wire                xbar_io_slaves_1_rready;
  wire                xbar_io_slaves_1_bready;
  wire                xbar_io_slaves_2_arvalid;
  wire       [31:0]   xbar_io_slaves_2_araddr;
  wire       [0:0]    xbar_io_slaves_2_arid;
  wire       [3:0]    xbar_io_slaves_2_arregion;
  wire       [7:0]    xbar_io_slaves_2_arlen;
  wire       [2:0]    xbar_io_slaves_2_arsize;
  wire       [1:0]    xbar_io_slaves_2_arburst;
  wire       [0:0]    xbar_io_slaves_2_arlock;
  wire       [3:0]    xbar_io_slaves_2_arcache;
  wire       [3:0]    xbar_io_slaves_2_arqos;
  wire       [2:0]    xbar_io_slaves_2_arprot;
  wire                xbar_io_slaves_2_awvalid;
  wire       [31:0]   xbar_io_slaves_2_awaddr;
  wire       [0:0]    xbar_io_slaves_2_awid;
  wire       [3:0]    xbar_io_slaves_2_awregion;
  wire       [7:0]    xbar_io_slaves_2_awlen;
  wire       [2:0]    xbar_io_slaves_2_awsize;
  wire       [1:0]    xbar_io_slaves_2_awburst;
  wire       [0:0]    xbar_io_slaves_2_awlock;
  wire       [3:0]    xbar_io_slaves_2_awcache;
  wire       [3:0]    xbar_io_slaves_2_awqos;
  wire       [2:0]    xbar_io_slaves_2_awprot;
  wire                xbar_io_slaves_2_wvalid;
  wire       [31:0]   xbar_io_slaves_2_wdata;
  wire       [3:0]    xbar_io_slaves_2_wstrb;
  wire                xbar_io_slaves_2_wlast;
  wire                xbar_io_slaves_2_rready;
  wire                xbar_io_slaves_2_bready;
  wire                xbar_io_slaves_3_arvalid;
  wire       [31:0]   xbar_io_slaves_3_araddr;
  wire       [0:0]    xbar_io_slaves_3_arid;
  wire       [3:0]    xbar_io_slaves_3_arregion;
  wire       [7:0]    xbar_io_slaves_3_arlen;
  wire       [2:0]    xbar_io_slaves_3_arsize;
  wire       [1:0]    xbar_io_slaves_3_arburst;
  wire       [0:0]    xbar_io_slaves_3_arlock;
  wire       [3:0]    xbar_io_slaves_3_arcache;
  wire       [3:0]    xbar_io_slaves_3_arqos;
  wire       [2:0]    xbar_io_slaves_3_arprot;
  wire                xbar_io_slaves_3_awvalid;
  wire       [31:0]   xbar_io_slaves_3_awaddr;
  wire       [0:0]    xbar_io_slaves_3_awid;
  wire       [3:0]    xbar_io_slaves_3_awregion;
  wire       [7:0]    xbar_io_slaves_3_awlen;
  wire       [2:0]    xbar_io_slaves_3_awsize;
  wire       [1:0]    xbar_io_slaves_3_awburst;
  wire       [0:0]    xbar_io_slaves_3_awlock;
  wire       [3:0]    xbar_io_slaves_3_awcache;
  wire       [3:0]    xbar_io_slaves_3_awqos;
  wire       [2:0]    xbar_io_slaves_3_awprot;
  wire                xbar_io_slaves_3_wvalid;
  wire       [31:0]   xbar_io_slaves_3_wdata;
  wire       [3:0]    xbar_io_slaves_3_wstrb;
  wire                xbar_io_slaves_3_wlast;
  wire                xbar_io_slaves_3_rready;
  wire                xbar_io_slaves_3_bready;
  wire                axi4FullToLiteAdapter_2_io_full_arready;
  wire                axi4FullToLiteAdapter_2_io_full_awready;
  wire                axi4FullToLiteAdapter_2_io_full_wready;
  wire                axi4FullToLiteAdapter_2_io_full_rvalid;
  wire       [31:0]   axi4FullToLiteAdapter_2_io_full_rdata;
  wire       [0:0]    axi4FullToLiteAdapter_2_io_full_rid;
  wire       [1:0]    axi4FullToLiteAdapter_2_io_full_rresp;
  wire                axi4FullToLiteAdapter_2_io_full_rlast;
  wire                axi4FullToLiteAdapter_2_io_full_bvalid;
  wire       [0:0]    axi4FullToLiteAdapter_2_io_full_bid;
  wire       [1:0]    axi4FullToLiteAdapter_2_io_full_bresp;
  wire                axi4FullToLiteAdapter_2_io_lite_arvalid;
  wire       [31:0]   axi4FullToLiteAdapter_2_io_lite_araddr;
  wire       [2:0]    axi4FullToLiteAdapter_2_io_lite_arprot;
  wire                axi4FullToLiteAdapter_2_io_lite_awvalid;
  wire       [31:0]   axi4FullToLiteAdapter_2_io_lite_awaddr;
  wire       [2:0]    axi4FullToLiteAdapter_2_io_lite_awprot;
  wire                axi4FullToLiteAdapter_2_io_lite_wvalid;
  wire       [31:0]   axi4FullToLiteAdapter_2_io_lite_wdata;
  wire       [3:0]    axi4FullToLiteAdapter_2_io_lite_wstrb;
  wire                axi4FullToLiteAdapter_2_io_lite_rready;
  wire                axi4FullToLiteAdapter_2_io_lite_bready;
  wire                axi4FullToLiteAdapter_3_io_full_arready;
  wire                axi4FullToLiteAdapter_3_io_full_awready;
  wire                axi4FullToLiteAdapter_3_io_full_wready;
  wire                axi4FullToLiteAdapter_3_io_full_rvalid;
  wire       [31:0]   axi4FullToLiteAdapter_3_io_full_rdata;
  wire       [0:0]    axi4FullToLiteAdapter_3_io_full_rid;
  wire       [1:0]    axi4FullToLiteAdapter_3_io_full_rresp;
  wire                axi4FullToLiteAdapter_3_io_full_rlast;
  wire                axi4FullToLiteAdapter_3_io_full_bvalid;
  wire       [0:0]    axi4FullToLiteAdapter_3_io_full_bid;
  wire       [1:0]    axi4FullToLiteAdapter_3_io_full_bresp;
  wire                axi4FullToLiteAdapter_3_io_lite_arvalid;
  wire       [31:0]   axi4FullToLiteAdapter_3_io_lite_araddr;
  wire       [2:0]    axi4FullToLiteAdapter_3_io_lite_arprot;
  wire                axi4FullToLiteAdapter_3_io_lite_awvalid;
  wire       [31:0]   axi4FullToLiteAdapter_3_io_lite_awaddr;
  wire       [2:0]    axi4FullToLiteAdapter_3_io_lite_awprot;
  wire                axi4FullToLiteAdapter_3_io_lite_wvalid;
  wire       [31:0]   axi4FullToLiteAdapter_3_io_lite_wdata;
  wire       [3:0]    axi4FullToLiteAdapter_3_io_lite_wstrb;
  wire                axi4FullToLiteAdapter_3_io_lite_rready;
  wire                axi4FullToLiteAdapter_3_io_lite_bready;

  Axi4Crossbar xbar (
    .io_masters_0_awvalid          (io_masters_0_awvalid                               ), //i
    .io_masters_0_awready          (xbar_io_masters_0_awready                          ), //o
    .io_masters_0_awaddr   (io_masters_0_awaddr[31:0]                  ), //i
    .io_masters_0_awid     (io_masters_0_awid                          ), //i
    .io_masters_0_awregion (io_masters_0_awregion[3:0]                 ), //i
    .io_masters_0_awlen    (io_masters_0_awlen[7:0]                    ), //i
    .io_masters_0_awsize   (io_masters_0_awsize[2:0]                   ), //i
    .io_masters_0_awburst  (io_masters_0_awburst[1:0]                  ), //i
    .io_masters_0_awlock   (io_masters_0_awlock                        ), //i
    .io_masters_0_awcache  (io_masters_0_awcache[3:0]                  ), //i
    .io_masters_0_awqos    (io_masters_0_awqos[3:0]                    ), //i
    .io_masters_0_awprot   (io_masters_0_awprot[2:0]                   ), //i
    .io_masters_0_wvalid           (io_masters_0_wvalid                                ), //i
    .io_masters_0_wready           (xbar_io_masters_0_wready                           ), //o
    .io_masters_0_wdata    (io_masters_0_wdata[31:0]                   ), //i
    .io_masters_0_wstrb    (io_masters_0_wstrb[3:0]                    ), //i
    .io_masters_0_wlast    (io_masters_0_wlast                         ), //i
    .io_masters_0_bvalid           (xbar_io_masters_0_bvalid                           ), //o
    .io_masters_0_bready           (io_masters_0_bready                                ), //i
    .io_masters_0_bid      (xbar_io_masters_0_bid                      ), //o
    .io_masters_0_bresp    (xbar_io_masters_0_bresp[1:0]               ), //o
    .io_masters_0_arvalid          (io_masters_0_arvalid                               ), //i
    .io_masters_0_arready          (xbar_io_masters_0_arready                          ), //o
    .io_masters_0_araddr   (io_masters_0_araddr[31:0]                  ), //i
    .io_masters_0_arid     (io_masters_0_arid                          ), //i
    .io_masters_0_arregion (io_masters_0_arregion[3:0]                 ), //i
    .io_masters_0_arlen    (io_masters_0_arlen[7:0]                    ), //i
    .io_masters_0_arsize   (io_masters_0_arsize[2:0]                   ), //i
    .io_masters_0_arburst  (io_masters_0_arburst[1:0]                  ), //i
    .io_masters_0_arlock   (io_masters_0_arlock                        ), //i
    .io_masters_0_arcache  (io_masters_0_arcache[3:0]                  ), //i
    .io_masters_0_arqos    (io_masters_0_arqos[3:0]                    ), //i
    .io_masters_0_arprot   (io_masters_0_arprot[2:0]                   ), //i
    .io_masters_0_rvalid           (xbar_io_masters_0_rvalid                           ), //o
    .io_masters_0_rready           (io_masters_0_rready                                ), //i
    .io_masters_0_rdata    (xbar_io_masters_0_rdata[31:0]              ), //o
    .io_masters_0_rid      (xbar_io_masters_0_rid                      ), //o
    .io_masters_0_rresp    (xbar_io_masters_0_rresp[1:0]               ), //o
    .io_masters_0_rlast    (xbar_io_masters_0_rlast                    ), //o
    .io_slaves_0_awvalid           (xbar_io_slaves_0_awvalid                           ), //o
    .io_slaves_0_awready           (io_slaves_0_awready                                ), //i
    .io_slaves_0_awaddr    (xbar_io_slaves_0_awaddr[31:0]              ), //o
    .io_slaves_0_awid      (xbar_io_slaves_0_awid                      ), //o
    .io_slaves_0_awregion  (xbar_io_slaves_0_awregion[3:0]             ), //o
    .io_slaves_0_awlen     (xbar_io_slaves_0_awlen[7:0]                ), //o
    .io_slaves_0_awsize    (xbar_io_slaves_0_awsize[2:0]               ), //o
    .io_slaves_0_awburst   (xbar_io_slaves_0_awburst[1:0]              ), //o
    .io_slaves_0_awlock    (xbar_io_slaves_0_awlock                    ), //o
    .io_slaves_0_awcache   (xbar_io_slaves_0_awcache[3:0]              ), //o
    .io_slaves_0_awqos     (xbar_io_slaves_0_awqos[3:0]                ), //o
    .io_slaves_0_awprot    (xbar_io_slaves_0_awprot[2:0]               ), //o
    .io_slaves_0_wvalid            (xbar_io_slaves_0_wvalid                            ), //o
    .io_slaves_0_wready            (io_slaves_0_wready                                 ), //i
    .io_slaves_0_wdata     (xbar_io_slaves_0_wdata[31:0]               ), //o
    .io_slaves_0_wstrb     (xbar_io_slaves_0_wstrb[3:0]                ), //o
    .io_slaves_0_wlast     (xbar_io_slaves_0_wlast                     ), //o
    .io_slaves_0_bvalid            (io_slaves_0_bvalid                                 ), //i
    .io_slaves_0_bready            (xbar_io_slaves_0_bready                            ), //o
    .io_slaves_0_bid       (io_slaves_0_bid                            ), //i
    .io_slaves_0_bresp     (io_slaves_0_bresp[1:0]                     ), //i
    .io_slaves_0_arvalid           (xbar_io_slaves_0_arvalid                           ), //o
    .io_slaves_0_arready           (io_slaves_0_arready                                ), //i
    .io_slaves_0_araddr    (xbar_io_slaves_0_araddr[31:0]              ), //o
    .io_slaves_0_arid      (xbar_io_slaves_0_arid                      ), //o
    .io_slaves_0_arregion  (xbar_io_slaves_0_arregion[3:0]             ), //o
    .io_slaves_0_arlen     (xbar_io_slaves_0_arlen[7:0]                ), //o
    .io_slaves_0_arsize    (xbar_io_slaves_0_arsize[2:0]               ), //o
    .io_slaves_0_arburst   (xbar_io_slaves_0_arburst[1:0]              ), //o
    .io_slaves_0_arlock    (xbar_io_slaves_0_arlock                    ), //o
    .io_slaves_0_arcache   (xbar_io_slaves_0_arcache[3:0]              ), //o
    .io_slaves_0_arqos     (xbar_io_slaves_0_arqos[3:0]                ), //o
    .io_slaves_0_arprot    (xbar_io_slaves_0_arprot[2:0]               ), //o
    .io_slaves_0_rvalid            (io_slaves_0_rvalid                                 ), //i
    .io_slaves_0_rready            (xbar_io_slaves_0_rready                            ), //o
    .io_slaves_0_rdata     (io_slaves_0_rdata[31:0]                    ), //i
    .io_slaves_0_rid       (io_slaves_0_rid                            ), //i
    .io_slaves_0_rresp     (io_slaves_0_rresp[1:0]                     ), //i
    .io_slaves_0_rlast     (io_slaves_0_rlast                          ), //i
    .io_slaves_1_awvalid           (xbar_io_slaves_1_awvalid                           ), //o
    .io_slaves_1_awready           (io_slaves_1_awready                                ), //i
    .io_slaves_1_awaddr    (xbar_io_slaves_1_awaddr[31:0]              ), //o
    .io_slaves_1_awid      (xbar_io_slaves_1_awid                      ), //o
    .io_slaves_1_awregion  (xbar_io_slaves_1_awregion[3:0]             ), //o
    .io_slaves_1_awlen     (xbar_io_slaves_1_awlen[7:0]                ), //o
    .io_slaves_1_awsize    (xbar_io_slaves_1_awsize[2:0]               ), //o
    .io_slaves_1_awburst   (xbar_io_slaves_1_awburst[1:0]              ), //o
    .io_slaves_1_awlock    (xbar_io_slaves_1_awlock                    ), //o
    .io_slaves_1_awcache   (xbar_io_slaves_1_awcache[3:0]              ), //o
    .io_slaves_1_awqos     (xbar_io_slaves_1_awqos[3:0]                ), //o
    .io_slaves_1_awprot    (xbar_io_slaves_1_awprot[2:0]               ), //o
    .io_slaves_1_wvalid            (xbar_io_slaves_1_wvalid                            ), //o
    .io_slaves_1_wready            (io_slaves_1_wready                                 ), //i
    .io_slaves_1_wdata     (xbar_io_slaves_1_wdata[31:0]               ), //o
    .io_slaves_1_wstrb     (xbar_io_slaves_1_wstrb[3:0]                ), //o
    .io_slaves_1_wlast     (xbar_io_slaves_1_wlast                     ), //o
    .io_slaves_1_bvalid            (io_slaves_1_bvalid                                 ), //i
    .io_slaves_1_bready            (xbar_io_slaves_1_bready                            ), //o
    .io_slaves_1_bid       (io_slaves_1_bid                            ), //i
    .io_slaves_1_bresp     (io_slaves_1_bresp[1:0]                     ), //i
    .io_slaves_1_arvalid           (xbar_io_slaves_1_arvalid                           ), //o
    .io_slaves_1_arready           (io_slaves_1_arready                                ), //i
    .io_slaves_1_araddr    (xbar_io_slaves_1_araddr[31:0]              ), //o
    .io_slaves_1_arid      (xbar_io_slaves_1_arid                      ), //o
    .io_slaves_1_arregion  (xbar_io_slaves_1_arregion[3:0]             ), //o
    .io_slaves_1_arlen     (xbar_io_slaves_1_arlen[7:0]                ), //o
    .io_slaves_1_arsize    (xbar_io_slaves_1_arsize[2:0]               ), //o
    .io_slaves_1_arburst   (xbar_io_slaves_1_arburst[1:0]              ), //o
    .io_slaves_1_arlock    (xbar_io_slaves_1_arlock                    ), //o
    .io_slaves_1_arcache   (xbar_io_slaves_1_arcache[3:0]              ), //o
    .io_slaves_1_arqos     (xbar_io_slaves_1_arqos[3:0]                ), //o
    .io_slaves_1_arprot    (xbar_io_slaves_1_arprot[2:0]               ), //o
    .io_slaves_1_rvalid            (io_slaves_1_rvalid                                 ), //i
    .io_slaves_1_rready            (xbar_io_slaves_1_rready                            ), //o
    .io_slaves_1_rdata     (io_slaves_1_rdata[31:0]                    ), //i
    .io_slaves_1_rid       (io_slaves_1_rid                            ), //i
    .io_slaves_1_rresp     (io_slaves_1_rresp[1:0]                     ), //i
    .io_slaves_1_rlast     (io_slaves_1_rlast                          ), //i
    .io_slaves_2_awvalid           (xbar_io_slaves_2_awvalid                           ), //o
    .io_slaves_2_awready           (axi4FullToLiteAdapter_2_io_full_awready            ), //i
    .io_slaves_2_awaddr    (xbar_io_slaves_2_awaddr[31:0]              ), //o
    .io_slaves_2_awid      (xbar_io_slaves_2_awid                      ), //o
    .io_slaves_2_awregion  (xbar_io_slaves_2_awregion[3:0]             ), //o
    .io_slaves_2_awlen     (xbar_io_slaves_2_awlen[7:0]                ), //o
    .io_slaves_2_awsize    (xbar_io_slaves_2_awsize[2:0]               ), //o
    .io_slaves_2_awburst   (xbar_io_slaves_2_awburst[1:0]              ), //o
    .io_slaves_2_awlock    (xbar_io_slaves_2_awlock                    ), //o
    .io_slaves_2_awcache   (xbar_io_slaves_2_awcache[3:0]              ), //o
    .io_slaves_2_awqos     (xbar_io_slaves_2_awqos[3:0]                ), //o
    .io_slaves_2_awprot    (xbar_io_slaves_2_awprot[2:0]               ), //o
    .io_slaves_2_wvalid            (xbar_io_slaves_2_wvalid                            ), //o
    .io_slaves_2_wready            (axi4FullToLiteAdapter_2_io_full_wready             ), //i
    .io_slaves_2_wdata     (xbar_io_slaves_2_wdata[31:0]               ), //o
    .io_slaves_2_wstrb     (xbar_io_slaves_2_wstrb[3:0]                ), //o
    .io_slaves_2_wlast     (xbar_io_slaves_2_wlast                     ), //o
    .io_slaves_2_bvalid            (axi4FullToLiteAdapter_2_io_full_bvalid             ), //i
    .io_slaves_2_bready            (xbar_io_slaves_2_bready                            ), //o
    .io_slaves_2_bid       (axi4FullToLiteAdapter_2_io_full_bid        ), //i
    .io_slaves_2_bresp     (axi4FullToLiteAdapter_2_io_full_bresp[1:0] ), //i
    .io_slaves_2_arvalid           (xbar_io_slaves_2_arvalid                           ), //o
    .io_slaves_2_arready           (axi4FullToLiteAdapter_2_io_full_arready            ), //i
    .io_slaves_2_araddr    (xbar_io_slaves_2_araddr[31:0]              ), //o
    .io_slaves_2_arid      (xbar_io_slaves_2_arid                      ), //o
    .io_slaves_2_arregion  (xbar_io_slaves_2_arregion[3:0]             ), //o
    .io_slaves_2_arlen     (xbar_io_slaves_2_arlen[7:0]                ), //o
    .io_slaves_2_arsize    (xbar_io_slaves_2_arsize[2:0]               ), //o
    .io_slaves_2_arburst   (xbar_io_slaves_2_arburst[1:0]              ), //o
    .io_slaves_2_arlock    (xbar_io_slaves_2_arlock                    ), //o
    .io_slaves_2_arcache   (xbar_io_slaves_2_arcache[3:0]              ), //o
    .io_slaves_2_arqos     (xbar_io_slaves_2_arqos[3:0]                ), //o
    .io_slaves_2_arprot    (xbar_io_slaves_2_arprot[2:0]               ), //o
    .io_slaves_2_rvalid            (axi4FullToLiteAdapter_2_io_full_rvalid             ), //i
    .io_slaves_2_rready            (xbar_io_slaves_2_rready                            ), //o
    .io_slaves_2_rdata     (axi4FullToLiteAdapter_2_io_full_rdata[31:0]), //i
    .io_slaves_2_rid       (axi4FullToLiteAdapter_2_io_full_rid        ), //i
    .io_slaves_2_rresp     (axi4FullToLiteAdapter_2_io_full_rresp[1:0] ), //i
    .io_slaves_2_rlast     (axi4FullToLiteAdapter_2_io_full_rlast      ), //i
    .io_slaves_3_awvalid           (xbar_io_slaves_3_awvalid                           ), //o
    .io_slaves_3_awready           (axi4FullToLiteAdapter_3_io_full_awready            ), //i
    .io_slaves_3_awaddr    (xbar_io_slaves_3_awaddr[31:0]              ), //o
    .io_slaves_3_awid      (xbar_io_slaves_3_awid                      ), //o
    .io_slaves_3_awregion  (xbar_io_slaves_3_awregion[3:0]             ), //o
    .io_slaves_3_awlen     (xbar_io_slaves_3_awlen[7:0]                ), //o
    .io_slaves_3_awsize    (xbar_io_slaves_3_awsize[2:0]               ), //o
    .io_slaves_3_awburst   (xbar_io_slaves_3_awburst[1:0]              ), //o
    .io_slaves_3_awlock    (xbar_io_slaves_3_awlock                    ), //o
    .io_slaves_3_awcache   (xbar_io_slaves_3_awcache[3:0]              ), //o
    .io_slaves_3_awqos     (xbar_io_slaves_3_awqos[3:0]                ), //o
    .io_slaves_3_awprot    (xbar_io_slaves_3_awprot[2:0]               ), //o
    .io_slaves_3_wvalid            (xbar_io_slaves_3_wvalid                            ), //o
    .io_slaves_3_wready            (axi4FullToLiteAdapter_3_io_full_wready             ), //i
    .io_slaves_3_wdata     (xbar_io_slaves_3_wdata[31:0]               ), //o
    .io_slaves_3_wstrb     (xbar_io_slaves_3_wstrb[3:0]                ), //o
    .io_slaves_3_wlast     (xbar_io_slaves_3_wlast                     ), //o
    .io_slaves_3_bvalid            (axi4FullToLiteAdapter_3_io_full_bvalid             ), //i
    .io_slaves_3_bready            (xbar_io_slaves_3_bready                            ), //o
    .io_slaves_3_bid       (axi4FullToLiteAdapter_3_io_full_bid        ), //i
    .io_slaves_3_bresp     (axi4FullToLiteAdapter_3_io_full_bresp[1:0] ), //i
    .io_slaves_3_arvalid           (xbar_io_slaves_3_arvalid                           ), //o
    .io_slaves_3_arready           (axi4FullToLiteAdapter_3_io_full_arready            ), //i
    .io_slaves_3_araddr    (xbar_io_slaves_3_araddr[31:0]              ), //o
    .io_slaves_3_arid      (xbar_io_slaves_3_arid                      ), //o
    .io_slaves_3_arregion  (xbar_io_slaves_3_arregion[3:0]             ), //o
    .io_slaves_3_arlen     (xbar_io_slaves_3_arlen[7:0]                ), //o
    .io_slaves_3_arsize    (xbar_io_slaves_3_arsize[2:0]               ), //o
    .io_slaves_3_arburst   (xbar_io_slaves_3_arburst[1:0]              ), //o
    .io_slaves_3_arlock    (xbar_io_slaves_3_arlock                    ), //o
    .io_slaves_3_arcache   (xbar_io_slaves_3_arcache[3:0]              ), //o
    .io_slaves_3_arqos     (xbar_io_slaves_3_arqos[3:0]                ), //o
    .io_slaves_3_arprot    (xbar_io_slaves_3_arprot[2:0]               ), //o
    .io_slaves_3_rvalid            (axi4FullToLiteAdapter_3_io_full_rvalid             ), //i
    .io_slaves_3_rready            (xbar_io_slaves_3_rready                            ), //o
    .io_slaves_3_rdata     (axi4FullToLiteAdapter_3_io_full_rdata[31:0]), //i
    .io_slaves_3_rid       (axi4FullToLiteAdapter_3_io_full_rid        ), //i
    .io_slaves_3_rresp     (axi4FullToLiteAdapter_3_io_full_rresp[1:0] ), //i
    .io_slaves_3_rlast     (axi4FullToLiteAdapter_3_io_full_rlast      ), //i
    .clk                            (clk                                                 ), //i
    .resetn                         (resetn                                              )  //i
  );
  Axi4FullToLiteAdapter axi4FullToLiteAdapter_2 (
    .io_full_awvalid          (xbar_io_slaves_2_awvalid                            ), //i
    .io_full_awready          (axi4FullToLiteAdapter_2_io_full_awready             ), //o
    .io_full_awaddr   (xbar_io_slaves_2_awaddr[31:0]               ), //i
    .io_full_awid     (xbar_io_slaves_2_awid                       ), //i
    .io_full_awregion (xbar_io_slaves_2_awregion[3:0]              ), //i
    .io_full_awlen    (xbar_io_slaves_2_awlen[7:0]                 ), //i
    .io_full_awsize   (xbar_io_slaves_2_awsize[2:0]                ), //i
    .io_full_awburst  (xbar_io_slaves_2_awburst[1:0]               ), //i
    .io_full_awlock   (xbar_io_slaves_2_awlock                     ), //i
    .io_full_awcache  (xbar_io_slaves_2_awcache[3:0]               ), //i
    .io_full_awqos    (xbar_io_slaves_2_awqos[3:0]                 ), //i
    .io_full_awprot   (xbar_io_slaves_2_awprot[2:0]                ), //i
    .io_full_wvalid           (xbar_io_slaves_2_wvalid                             ), //i
    .io_full_wready           (axi4FullToLiteAdapter_2_io_full_wready              ), //o
    .io_full_wdata    (xbar_io_slaves_2_wdata[31:0]                ), //i
    .io_full_wstrb    (xbar_io_slaves_2_wstrb[3:0]                 ), //i
    .io_full_wlast    (xbar_io_slaves_2_wlast                      ), //i
    .io_full_bvalid           (axi4FullToLiteAdapter_2_io_full_bvalid              ), //o
    .io_full_bready           (xbar_io_slaves_2_bready                             ), //i
    .io_full_bid      (axi4FullToLiteAdapter_2_io_full_bid         ), //o
    .io_full_bresp    (axi4FullToLiteAdapter_2_io_full_bresp[1:0]  ), //o
    .io_full_arvalid          (xbar_io_slaves_2_arvalid                            ), //i
    .io_full_arready          (axi4FullToLiteAdapter_2_io_full_arready             ), //o
    .io_full_araddr   (xbar_io_slaves_2_araddr[31:0]               ), //i
    .io_full_arid     (xbar_io_slaves_2_arid                       ), //i
    .io_full_arregion (xbar_io_slaves_2_arregion[3:0]              ), //i
    .io_full_arlen    (xbar_io_slaves_2_arlen[7:0]                 ), //i
    .io_full_arsize   (xbar_io_slaves_2_arsize[2:0]                ), //i
    .io_full_arburst  (xbar_io_slaves_2_arburst[1:0]               ), //i
    .io_full_arlock   (xbar_io_slaves_2_arlock                     ), //i
    .io_full_arcache  (xbar_io_slaves_2_arcache[3:0]               ), //i
    .io_full_arqos    (xbar_io_slaves_2_arqos[3:0]                 ), //i
    .io_full_arprot   (xbar_io_slaves_2_arprot[2:0]                ), //i
    .io_full_rvalid           (axi4FullToLiteAdapter_2_io_full_rvalid              ), //o
    .io_full_rready           (xbar_io_slaves_2_rready                             ), //i
    .io_full_rdata    (axi4FullToLiteAdapter_2_io_full_rdata[31:0] ), //o
    .io_full_rid      (axi4FullToLiteAdapter_2_io_full_rid         ), //o
    .io_full_rresp    (axi4FullToLiteAdapter_2_io_full_rresp[1:0]  ), //o
    .io_full_rlast    (axi4FullToLiteAdapter_2_io_full_rlast       ), //o
    .io_lite_awvalid          (axi4FullToLiteAdapter_2_io_lite_awvalid             ), //o
    .io_lite_awready          (io_slaves_2_awready                                 ), //i
    .io_lite_awaddr   (axi4FullToLiteAdapter_2_io_lite_awaddr[31:0]), //o
    .io_lite_awprot   (axi4FullToLiteAdapter_2_io_lite_awprot[2:0] ), //o
    .io_lite_wvalid           (axi4FullToLiteAdapter_2_io_lite_wvalid              ), //o
    .io_lite_wready           (io_slaves_2_wready                                  ), //i
    .io_lite_wdata    (axi4FullToLiteAdapter_2_io_lite_wdata[31:0] ), //o
    .io_lite_wstrb    (axi4FullToLiteAdapter_2_io_lite_wstrb[3:0]  ), //o
    .io_lite_bvalid           (io_slaves_2_bvalid                                  ), //i
    .io_lite_bready           (axi4FullToLiteAdapter_2_io_lite_bready              ), //o
    .io_lite_bresp    (io_slaves_2_bresp[1:0]                      ), //i
    .io_lite_arvalid          (axi4FullToLiteAdapter_2_io_lite_arvalid             ), //o
    .io_lite_arready          (io_slaves_2_arready                                 ), //i
    .io_lite_araddr   (axi4FullToLiteAdapter_2_io_lite_araddr[31:0]), //o
    .io_lite_arprot   (axi4FullToLiteAdapter_2_io_lite_arprot[2:0] ), //o
    .io_lite_rvalid           (io_slaves_2_rvalid                                  ), //i
    .io_lite_rready           (axi4FullToLiteAdapter_2_io_lite_rready              ), //o
    .io_lite_rdata    (io_slaves_2_rdata[31:0]                     ), //i
    .io_lite_rresp    (io_slaves_2_rresp[1:0]                      ), //i
    .clk                       (clk                                                  ), //i
    .resetn                    (resetn                                               )  //i
  );
  Axi4FullToLiteAdapter axi4FullToLiteAdapter_3 (
    .io_full_awvalid          (xbar_io_slaves_3_awvalid                            ), //i
    .io_full_awready          (axi4FullToLiteAdapter_3_io_full_awready             ), //o
    .io_full_awaddr   (xbar_io_slaves_3_awaddr[31:0]               ), //i
    .io_full_awid     (xbar_io_slaves_3_awid                       ), //i
    .io_full_awregion (xbar_io_slaves_3_awregion[3:0]              ), //i
    .io_full_awlen    (xbar_io_slaves_3_awlen[7:0]                 ), //i
    .io_full_awsize   (xbar_io_slaves_3_awsize[2:0]                ), //i
    .io_full_awburst  (xbar_io_slaves_3_awburst[1:0]               ), //i
    .io_full_awlock   (xbar_io_slaves_3_awlock                     ), //i
    .io_full_awcache  (xbar_io_slaves_3_awcache[3:0]               ), //i
    .io_full_awqos    (xbar_io_slaves_3_awqos[3:0]                 ), //i
    .io_full_awprot   (xbar_io_slaves_3_awprot[2:0]                ), //i
    .io_full_wvalid           (xbar_io_slaves_3_wvalid                             ), //i
    .io_full_wready           (axi4FullToLiteAdapter_3_io_full_wready              ), //o
    .io_full_wdata    (xbar_io_slaves_3_wdata[31:0]                ), //i
    .io_full_wstrb    (xbar_io_slaves_3_wstrb[3:0]                 ), //i
    .io_full_wlast    (xbar_io_slaves_3_wlast                      ), //i
    .io_full_bvalid           (axi4FullToLiteAdapter_3_io_full_bvalid              ), //o
    .io_full_bready           (xbar_io_slaves_3_bready                             ), //i
    .io_full_bid      (axi4FullToLiteAdapter_3_io_full_bid         ), //o
    .io_full_bresp    (axi4FullToLiteAdapter_3_io_full_bresp[1:0]  ), //o
    .io_full_arvalid          (xbar_io_slaves_3_arvalid                            ), //i
    .io_full_arready          (axi4FullToLiteAdapter_3_io_full_arready             ), //o
    .io_full_araddr   (xbar_io_slaves_3_araddr[31:0]               ), //i
    .io_full_arid     (xbar_io_slaves_3_arid                       ), //i
    .io_full_arregion (xbar_io_slaves_3_arregion[3:0]              ), //i
    .io_full_arlen    (xbar_io_slaves_3_arlen[7:0]                 ), //i
    .io_full_arsize   (xbar_io_slaves_3_arsize[2:0]                ), //i
    .io_full_arburst  (xbar_io_slaves_3_arburst[1:0]               ), //i
    .io_full_arlock   (xbar_io_slaves_3_arlock                     ), //i
    .io_full_arcache  (xbar_io_slaves_3_arcache[3:0]               ), //i
    .io_full_arqos    (xbar_io_slaves_3_arqos[3:0]                 ), //i
    .io_full_arprot   (xbar_io_slaves_3_arprot[2:0]                ), //i
    .io_full_rvalid           (axi4FullToLiteAdapter_3_io_full_rvalid              ), //o
    .io_full_rready           (xbar_io_slaves_3_rready                             ), //i
    .io_full_rdata    (axi4FullToLiteAdapter_3_io_full_rdata[31:0] ), //o
    .io_full_rid      (axi4FullToLiteAdapter_3_io_full_rid         ), //o
    .io_full_rresp    (axi4FullToLiteAdapter_3_io_full_rresp[1:0]  ), //o
    .io_full_rlast    (axi4FullToLiteAdapter_3_io_full_rlast       ), //o
    .io_lite_awvalid          (axi4FullToLiteAdapter_3_io_lite_awvalid             ), //o
    .io_lite_awready          (io_slaves_3_awready                                 ), //i
    .io_lite_awaddr   (axi4FullToLiteAdapter_3_io_lite_awaddr[31:0]), //o
    .io_lite_awprot   (axi4FullToLiteAdapter_3_io_lite_awprot[2:0] ), //o
    .io_lite_wvalid           (axi4FullToLiteAdapter_3_io_lite_wvalid              ), //o
    .io_lite_wready           (io_slaves_3_wready                                  ), //i
    .io_lite_wdata    (axi4FullToLiteAdapter_3_io_lite_wdata[31:0] ), //o
    .io_lite_wstrb    (axi4FullToLiteAdapter_3_io_lite_wstrb[3:0]  ), //o
    .io_lite_bvalid           (io_slaves_3_bvalid                                  ), //i
    .io_lite_bready           (axi4FullToLiteAdapter_3_io_lite_bready              ), //o
    .io_lite_bresp    (io_slaves_3_bresp[1:0]                      ), //i
    .io_lite_arvalid          (axi4FullToLiteAdapter_3_io_lite_arvalid             ), //o
    .io_lite_arready          (io_slaves_3_arready                                 ), //i
    .io_lite_araddr   (axi4FullToLiteAdapter_3_io_lite_araddr[31:0]), //o
    .io_lite_arprot   (axi4FullToLiteAdapter_3_io_lite_arprot[2:0] ), //o
    .io_lite_rvalid           (io_slaves_3_rvalid                                  ), //i
    .io_lite_rready           (axi4FullToLiteAdapter_3_io_lite_rready              ), //o
    .io_lite_rdata    (io_slaves_3_rdata[31:0]                     ), //i
    .io_lite_rresp    (io_slaves_3_rresp[1:0]                      ), //i
    .clk                       (clk                                                  ), //i
    .resetn                    (resetn                                               )  //i
  );
  assign io_masters_0_awready = xbar_io_masters_0_awready;
  assign io_masters_0_wready = xbar_io_masters_0_wready;
  assign io_masters_0_bvalid = xbar_io_masters_0_bvalid;
  assign io_masters_0_bid = xbar_io_masters_0_bid;
  assign io_masters_0_bresp = xbar_io_masters_0_bresp;
  assign io_masters_0_arready = xbar_io_masters_0_arready;
  assign io_masters_0_rvalid = xbar_io_masters_0_rvalid;
  assign io_masters_0_rdata = xbar_io_masters_0_rdata;
  assign io_masters_0_rid = xbar_io_masters_0_rid;
  assign io_masters_0_rresp = xbar_io_masters_0_rresp;
  assign io_masters_0_rlast = xbar_io_masters_0_rlast;
  assign io_slaves_0_awvalid = xbar_io_slaves_0_awvalid;
  assign io_slaves_0_awaddr = xbar_io_slaves_0_awaddr;
  assign io_slaves_0_awid = xbar_io_slaves_0_awid;
  assign io_slaves_0_awregion = xbar_io_slaves_0_awregion;
  assign io_slaves_0_awlen = xbar_io_slaves_0_awlen;
  assign io_slaves_0_awsize = xbar_io_slaves_0_awsize;
  assign io_slaves_0_awburst = xbar_io_slaves_0_awburst;
  assign io_slaves_0_awlock = xbar_io_slaves_0_awlock;
  assign io_slaves_0_awcache = xbar_io_slaves_0_awcache;
  assign io_slaves_0_awqos = xbar_io_slaves_0_awqos;
  assign io_slaves_0_awprot = xbar_io_slaves_0_awprot;
  assign io_slaves_0_wvalid = xbar_io_slaves_0_wvalid;
  assign io_slaves_0_wdata = xbar_io_slaves_0_wdata;
  assign io_slaves_0_wstrb = xbar_io_slaves_0_wstrb;
  assign io_slaves_0_wlast = xbar_io_slaves_0_wlast;
  assign io_slaves_0_bready = xbar_io_slaves_0_bready;
  assign io_slaves_0_arvalid = xbar_io_slaves_0_arvalid;
  assign io_slaves_0_araddr = xbar_io_slaves_0_araddr;
  assign io_slaves_0_arid = xbar_io_slaves_0_arid;
  assign io_slaves_0_arregion = xbar_io_slaves_0_arregion;
  assign io_slaves_0_arlen = xbar_io_slaves_0_arlen;
  assign io_slaves_0_arsize = xbar_io_slaves_0_arsize;
  assign io_slaves_0_arburst = xbar_io_slaves_0_arburst;
  assign io_slaves_0_arlock = xbar_io_slaves_0_arlock;
  assign io_slaves_0_arcache = xbar_io_slaves_0_arcache;
  assign io_slaves_0_arqos = xbar_io_slaves_0_arqos;
  assign io_slaves_0_arprot = xbar_io_slaves_0_arprot;
  assign io_slaves_0_rready = xbar_io_slaves_0_rready;
  assign io_slaves_1_awvalid = xbar_io_slaves_1_awvalid;
  assign io_slaves_1_awaddr = xbar_io_slaves_1_awaddr;
  assign io_slaves_1_awid = xbar_io_slaves_1_awid;
  assign io_slaves_1_awregion = xbar_io_slaves_1_awregion;
  assign io_slaves_1_awlen = xbar_io_slaves_1_awlen;
  assign io_slaves_1_awsize = xbar_io_slaves_1_awsize;
  assign io_slaves_1_awburst = xbar_io_slaves_1_awburst;
  assign io_slaves_1_awlock = xbar_io_slaves_1_awlock;
  assign io_slaves_1_awcache = xbar_io_slaves_1_awcache;
  assign io_slaves_1_awqos = xbar_io_slaves_1_awqos;
  assign io_slaves_1_awprot = xbar_io_slaves_1_awprot;
  assign io_slaves_1_wvalid = xbar_io_slaves_1_wvalid;
  assign io_slaves_1_wdata = xbar_io_slaves_1_wdata;
  assign io_slaves_1_wstrb = xbar_io_slaves_1_wstrb;
  assign io_slaves_1_wlast = xbar_io_slaves_1_wlast;
  assign io_slaves_1_bready = xbar_io_slaves_1_bready;
  assign io_slaves_1_arvalid = xbar_io_slaves_1_arvalid;
  assign io_slaves_1_araddr = xbar_io_slaves_1_araddr;
  assign io_slaves_1_arid = xbar_io_slaves_1_arid;
  assign io_slaves_1_arregion = xbar_io_slaves_1_arregion;
  assign io_slaves_1_arlen = xbar_io_slaves_1_arlen;
  assign io_slaves_1_arsize = xbar_io_slaves_1_arsize;
  assign io_slaves_1_arburst = xbar_io_slaves_1_arburst;
  assign io_slaves_1_arlock = xbar_io_slaves_1_arlock;
  assign io_slaves_1_arcache = xbar_io_slaves_1_arcache;
  assign io_slaves_1_arqos = xbar_io_slaves_1_arqos;
  assign io_slaves_1_arprot = xbar_io_slaves_1_arprot;
  assign io_slaves_1_rready = xbar_io_slaves_1_rready;
  assign io_slaves_2_awvalid = axi4FullToLiteAdapter_2_io_lite_awvalid;
  assign io_slaves_2_awaddr = axi4FullToLiteAdapter_2_io_lite_awaddr;
  assign io_slaves_2_awprot = axi4FullToLiteAdapter_2_io_lite_awprot;
  assign io_slaves_2_wvalid = axi4FullToLiteAdapter_2_io_lite_wvalid;
  assign io_slaves_2_wdata = axi4FullToLiteAdapter_2_io_lite_wdata;
  assign io_slaves_2_wstrb = axi4FullToLiteAdapter_2_io_lite_wstrb;
  assign io_slaves_2_bready = axi4FullToLiteAdapter_2_io_lite_bready;
  assign io_slaves_2_arvalid = axi4FullToLiteAdapter_2_io_lite_arvalid;
  assign io_slaves_2_araddr = axi4FullToLiteAdapter_2_io_lite_araddr;
  assign io_slaves_2_arprot = axi4FullToLiteAdapter_2_io_lite_arprot;
  assign io_slaves_2_rready = axi4FullToLiteAdapter_2_io_lite_rready;
  assign io_slaves_3_awvalid = axi4FullToLiteAdapter_3_io_lite_awvalid;
  assign io_slaves_3_awaddr = axi4FullToLiteAdapter_3_io_lite_awaddr;
  assign io_slaves_3_awprot = axi4FullToLiteAdapter_3_io_lite_awprot;
  assign io_slaves_3_wvalid = axi4FullToLiteAdapter_3_io_lite_wvalid;
  assign io_slaves_3_wdata = axi4FullToLiteAdapter_3_io_lite_wdata;
  assign io_slaves_3_wstrb = axi4FullToLiteAdapter_3_io_lite_wstrb;
  assign io_slaves_3_bready = axi4FullToLiteAdapter_3_io_lite_bready;
  assign io_slaves_3_arvalid = axi4FullToLiteAdapter_3_io_lite_arvalid;
  assign io_slaves_3_araddr = axi4FullToLiteAdapter_3_io_lite_araddr;
  assign io_slaves_3_arprot = axi4FullToLiteAdapter_3_io_lite_arprot;
  assign io_slaves_3_rready = axi4FullToLiteAdapter_3_io_lite_rready;

endmodule

module Axi3ToAxi4Adapter (
  input  wire          io_axi3_awvalid,
  output wire          io_axi3_awready,
  input  wire [0:0]    io_axi3_awid,
  input  wire [31:0]   io_axi3_awaddr,
  input  wire [3:0]    io_axi3_awlen,
  input  wire [2:0]    io_axi3_awsize,
  input  wire [1:0]    io_axi3_awburst,
  input  wire [1:0]    io_axi3_awlock,
  input  wire [3:0]    io_axi3_awcache,
  input  wire [2:0]    io_axi3_awprot,
  input  wire          io_axi3_wvalid,
  output reg           io_axi3_wready,
  input  wire [0:0]    io_axi3_wid,
  input  wire [31:0]   io_axi3_wdata,
  input  wire [3:0]    io_axi3_wstrb,
  input  wire          io_axi3_wlast,
  output wire          io_axi3_bvalid,
  input  wire          io_axi3_bready,
  output wire [0:0]    io_axi3_bid,
  output wire [1:0]    io_axi3_bresp,
  input  wire          io_axi3_arvalid,
  output wire          io_axi3_arready,
  input  wire [0:0]    io_axi3_arid,
  input  wire [31:0]   io_axi3_araddr,
  input  wire [3:0]    io_axi3_arlen,
  input  wire [2:0]    io_axi3_arsize,
  input  wire [1:0]    io_axi3_arburst,
  input  wire [1:0]    io_axi3_arlock,
  input  wire [3:0]    io_axi3_arcache,
  input  wire [2:0]    io_axi3_arprot,
  output wire          io_axi3_rvalid,
  input  wire          io_axi3_rready,
  output wire [0:0]    io_axi3_rid,
  output wire [31:0]   io_axi3_rdata,
  output wire [1:0]    io_axi3_rresp,
  output wire          io_axi3_rlast,
  output reg           io_axi4_awvalid,
  input  wire          io_axi4_awready,
  output reg  [31:0]   io_axi4_awaddr,
  output reg  [0:0]    io_axi4_awid,
  output reg  [3:0]    io_axi4_awregion,
  output reg  [7:0]    io_axi4_awlen,
  output reg  [2:0]    io_axi4_awsize,
  output reg  [1:0]    io_axi4_awburst,
  output reg  [0:0]    io_axi4_awlock,
  output reg  [3:0]    io_axi4_awcache,
  output reg  [3:0]    io_axi4_awqos,
  output reg  [2:0]    io_axi4_awprot,
  output reg           io_axi4_wvalid,
  input  wire          io_axi4_wready,
  output reg  [31:0]   io_axi4_wdata,
  output reg  [3:0]    io_axi4_wstrb,
  output reg           io_axi4_wlast,
  input  wire          io_axi4_bvalid,
  output wire          io_axi4_bready,
  input  wire [0:0]    io_axi4_bid,
  input  wire [1:0]    io_axi4_bresp,
  output wire          io_axi4_arvalid,
  input  wire          io_axi4_arready,
  output reg  [31:0]   io_axi4_araddr,
  output reg  [0:0]    io_axi4_arid,
  output reg  [3:0]    io_axi4_arregion,
  output reg  [7:0]    io_axi4_arlen,
  output reg  [2:0]    io_axi4_arsize,
  output reg  [1:0]    io_axi4_arburst,
  output reg  [0:0]    io_axi4_arlock,
  output reg  [3:0]    io_axi4_arcache,
  output reg  [3:0]    io_axi4_arqos,
  output reg  [2:0]    io_axi4_arprot,
  input  wire          io_axi4_rvalid,
  output wire          io_axi4_rready,
  input  wire [31:0]   io_axi4_rdata,
  input  wire [0:0]    io_axi4_rid,
  input  wire [1:0]    io_axi4_rresp,
  input  wire          io_axi4_rlast,
  input  wire          clk,
  input  wire          resetn
);
  localparam FsmState_IDLE = 2'd0;
  localparam FsmState_SEND_AW = 2'd1;
  localparam FsmState_DRAIN_W = 2'd2;
  localparam FsmState_WAIT_B = 2'd3;

  wire                awCmdFifo_io_pushlocked;
  reg                 awCmdFifo_io_pop_ready;
  wire                awCmdFifo_io_flush;
  wire                wSlots_0_io_push_valid;
  reg                 wSlots_0_io_pop_ready;
  wire                wSlots_0_io_flush;
  wire                wSlots_1_io_push_valid;
  reg                 wSlots_1_io_pop_ready;
  wire                wSlots_1_io_flush;
  wire                awCmdFifo_io_push_ready;
  wire                awCmdFifo_io_pop_valid;
  wire       [0:0]    awCmdFifo_io_popid;
  wire       [31:0]   awCmdFifo_io_popaddr;
  wire       [3:0]    awCmdFifo_io_poplen;
  wire       [2:0]    awCmdFifo_io_popsize;
  wire       [1:0]    awCmdFifo_io_popburst;
  wire       [1:0]    awCmdFifo_io_poplock;
  wire       [3:0]    awCmdFifo_io_popcache;
  wire       [2:0]    awCmdFifo_io_popprot;
  wire                awCmdFifo_io_poplocked;
  wire       [2:0]    awCmdFifo_io_occupancy;
  wire       [2:0]    awCmdFifo_io_availability;
  wire                wSlots_0_io_push_ready;
  wire                wSlots_0_io_pop_valid;
  wire       [31:0]   wSlots_0_io_popdata;
  wire       [3:0]    wSlots_0_io_popstrb;
  wire                wSlots_0_io_poplast;
  wire       [4:0]    wSlots_0_io_occupancy;
  wire       [4:0]    wSlots_0_io_availability;
  wire                wSlots_1_io_push_ready;
  wire                wSlots_1_io_pop_valid;
  wire       [31:0]   wSlots_1_io_popdata;
  wire       [3:0]    wSlots_1_io_popstrb;
  wire                wSlots_1_io_poplast;
  wire       [4:0]    wSlots_1_io_occupancy;
  wire       [4:0]    wSlots_1_io_availability;
  wire       [61:0]   _zz_io_axi4_araddr;
  wire                when_Axi3ToAxi4Adapter_l211;
  wire                when_Axi3ToAxi4Adapter_l211_1;
  reg        [1:0]    state;
  reg        [0:0]    curCmd_id;
  reg        [31:0]   curCmd_addr;
  reg        [3:0]    curCmd_len;
  reg        [2:0]    curCmd_size;
  reg        [1:0]    curCmd_burst;
  reg        [1:0]    curCmd_lock;
  reg        [3:0]    curCmd_cache;
  reg        [2:0]    curCmd_prot;
  reg                 curCmd_locked;
  wire       [61:0]   _zz_io_axi4_awaddr;
  wire       [36:0]   _zz_io_axi4_wdata;
  reg        [31:0]   drainBeat_data;
  reg        [3:0]    drainBeat_strb;
  reg                 drainBeat_last;
  reg                 slotValid;
  reg                 drainReady;
  wire                when_Axi3ToAxi4Adapter_l256;
  wire                when_Axi3ToAxi4Adapter_l256_1;
  wire                io_axi4_w_fire;
  wire                when_Axi3ToAxi4Adapter_l297;
  wire                when_Axi3ToAxi4Adapter_l316;
  wire                io_axi3_b_fire;
  `ifndef SYNTHESIS
  reg [55:0] state_string;
  `endif


  StreamFifo awCmdFifo (
    .io_push_valid          (io_axi3_awvalid                   ), //i
    .io_push_ready          (awCmdFifo_io_push_ready            ), //o
    .io_pushid     (io_axi3_awid              ), //i
    .io_pushaddr   (io_axi3_awaddr[31:0]      ), //i
    .io_pushlen    (io_axi3_awlen[3:0]        ), //i
    .io_pushsize   (io_axi3_awsize[2:0]       ), //i
    .io_pushburst  (io_axi3_awburst[1:0]      ), //i
    .io_pushlock   (io_axi3_awlock[1:0]       ), //i
    .io_pushcache  (io_axi3_awcache[3:0]      ), //i
    .io_pushprot   (io_axi3_awprot[2:0]       ), //i
    .io_pushlocked (awCmdFifo_io_pushlocked   ), //i
    .io_pop_valid           (awCmdFifo_io_pop_valid             ), //o
    .io_pop_ready           (awCmdFifo_io_pop_ready             ), //i
    .io_popid      (awCmdFifo_io_popid        ), //o
    .io_popaddr    (awCmdFifo_io_popaddr[31:0]), //o
    .io_poplen     (awCmdFifo_io_poplen[3:0]  ), //o
    .io_popsize    (awCmdFifo_io_popsize[2:0] ), //o
    .io_popburst   (awCmdFifo_io_popburst[1:0]), //o
    .io_poplock    (awCmdFifo_io_poplock[1:0] ), //o
    .io_popcache   (awCmdFifo_io_popcache[3:0]), //o
    .io_popprot    (awCmdFifo_io_popprot[2:0] ), //o
    .io_poplocked  (awCmdFifo_io_poplocked    ), //o
    .io_flush               (awCmdFifo_io_flush                 ), //i
    .io_occupancy           (awCmdFifo_io_occupancy[2:0]        ), //o
    .io_availability        (awCmdFifo_io_availability[2:0]     ), //o
    .clk                    (clk                                ), //i
    .resetn                 (resetn                             )  //i
  );
  StreamFifo_1 wSlots_0 (
    .io_push_valid        (wSlots_0_io_push_valid            ), //i
    .io_push_ready        (wSlots_0_io_push_ready            ), //o
    .io_pushdata (io_axi3_wdata[31:0]      ), //i
    .io_pushstrb (io_axi3_wstrb[3:0]       ), //i
    .io_pushlast (io_axi3_wlast            ), //i
    .io_pop_valid         (wSlots_0_io_pop_valid             ), //o
    .io_pop_ready         (wSlots_0_io_pop_ready             ), //i
    .io_popdata  (wSlots_0_io_popdata[31:0]), //o
    .io_popstrb  (wSlots_0_io_popstrb[3:0] ), //o
    .io_poplast  (wSlots_0_io_poplast      ), //o
    .io_flush             (wSlots_0_io_flush                 ), //i
    .io_occupancy         (wSlots_0_io_occupancy[4:0]        ), //o
    .io_availability      (wSlots_0_io_availability[4:0]     ), //o
    .clk                  (clk                               ), //i
    .resetn               (resetn                            )  //i
  );
  StreamFifo_1 wSlots_1 (
    .io_push_valid        (wSlots_1_io_push_valid            ), //i
    .io_push_ready        (wSlots_1_io_push_ready            ), //o
    .io_pushdata (io_axi3_wdata[31:0]      ), //i
    .io_pushstrb (io_axi3_wstrb[3:0]       ), //i
    .io_pushlast (io_axi3_wlast            ), //i
    .io_pop_valid         (wSlots_1_io_pop_valid             ), //o
    .io_pop_ready         (wSlots_1_io_pop_ready             ), //i
    .io_popdata  (wSlots_1_io_popdata[31:0]), //o
    .io_popstrb  (wSlots_1_io_popstrb[3:0] ), //o
    .io_poplast  (wSlots_1_io_poplast      ), //o
    .io_flush             (wSlots_1_io_flush                 ), //i
    .io_occupancy         (wSlots_1_io_occupancy[4:0]        ), //o
    .io_availability      (wSlots_1_io_availability[4:0]     ), //o
    .clk                  (clk                               ), //i
    .resetn               (resetn                            )  //i
  );
  `ifndef SYNTHESIS
  always @(*) begin
    case(state)
      FsmState_IDLE : state_string = "IDLE   ";
      FsmState_SEND_AW : state_string = "SEND_AW";
      FsmState_DRAIN_W : state_string = "DRAIN_W";
      FsmState_WAIT_B : state_string = "WAIT_B ";
      default : state_string = "???????";
    endcase
  end
  `endif

  assign io_axi4_arvalid = io_axi3_arvalid;
  assign io_axi3_arready = io_axi4_arready;
  assign _zz_io_axi4_araddr = 62'h0000000000000000;
  always @(*) begin
    io_axi4_araddr = _zz_io_axi4_araddr[31 : 0];
    io_axi4_araddr = io_axi3_araddr;
  end

  always @(*) begin
    io_axi4_arid = _zz_io_axi4_araddr[32 : 32];
    io_axi4_arid = io_axi3_arid;
  end

  always @(*) begin
    io_axi4_arregion = _zz_io_axi4_araddr[36 : 33];
    io_axi4_arregion = 4'b0000;
  end

  always @(*) begin
    io_axi4_arlen = _zz_io_axi4_araddr[44 : 37];
    io_axi4_arlen = {4'd0, io_axi3_arlen};
  end

  always @(*) begin
    io_axi4_arsize = _zz_io_axi4_araddr[47 : 45];
    io_axi4_arsize = io_axi3_arsize;
  end

  always @(*) begin
    io_axi4_arburst = _zz_io_axi4_araddr[49 : 48];
    io_axi4_arburst = io_axi3_arburst;
  end

  always @(*) begin
    io_axi4_arlock = _zz_io_axi4_araddr[50 : 50];
    io_axi4_arlock = io_axi3_arlock[0 : 0];
  end

  always @(*) begin
    io_axi4_arcache = _zz_io_axi4_araddr[54 : 51];
    io_axi4_arcache = io_axi3_arcache;
  end

  always @(*) begin
    io_axi4_arqos = _zz_io_axi4_araddr[58 : 55];
    io_axi4_arqos = 4'b0000;
  end

  always @(*) begin
    io_axi4_arprot = _zz_io_axi4_araddr[61 : 59];
    io_axi4_arprot = io_axi3_arprot;
  end

  assign io_axi3_rvalid = io_axi4_rvalid;
  assign io_axi4_rready = io_axi3_rready;
  assign io_axi3_rid = io_axi4_rid;
  assign io_axi3_rdata = io_axi4_rdata;
  assign io_axi3_rresp = io_axi4_rresp;
  assign io_axi3_rlast = io_axi4_rlast;
  assign awCmdFifo_io_pushlocked = (io_axi3_awlock == 2'b10);
  assign io_axi3_awready = awCmdFifo_io_push_ready;
  assign wSlots_0_io_push_valid = (io_axi3_wvalid && (io_axi3_wid == 1'b0));
  assign wSlots_1_io_push_valid = (io_axi3_wvalid && (io_axi3_wid == 1'b1));
  always @(*) begin
    io_axi3_wready = 1'b0;
    if(when_Axi3ToAxi4Adapter_l211) begin
      io_axi3_wready = wSlots_0_io_push_ready;
    end
    if(when_Axi3ToAxi4Adapter_l211_1) begin
      io_axi3_wready = wSlots_1_io_push_ready;
    end
  end

  assign when_Axi3ToAxi4Adapter_l211 = (io_axi3_wid == 1'b0);
  assign when_Axi3ToAxi4Adapter_l211_1 = (io_axi3_wid == 1'b1);
  always @(*) begin
    awCmdFifo_io_pop_ready = 1'b0;
    case(state)
      FsmState_IDLE : begin
        if(awCmdFifo_io_pop_valid) begin
          awCmdFifo_io_pop_ready = 1'b1;
        end
      end
      FsmState_SEND_AW : begin
      end
      FsmState_DRAIN_W : begin
      end
      default : begin
      end
    endcase
  end

  always @(*) begin
    io_axi4_awvalid = 1'b0;
    case(state)
      FsmState_IDLE : begin
      end
      FsmState_SEND_AW : begin
        io_axi4_awvalid = 1'b1;
      end
      FsmState_DRAIN_W : begin
      end
      default : begin
      end
    endcase
  end

  assign _zz_io_axi4_awaddr = 62'h0000000000000000;
  always @(*) begin
    io_axi4_awaddr = _zz_io_axi4_awaddr[31 : 0];
    case(state)
      FsmState_IDLE : begin
      end
      FsmState_SEND_AW : begin
        io_axi4_awaddr = curCmd_addr;
      end
      FsmState_DRAIN_W : begin
      end
      default : begin
      end
    endcase
  end

  always @(*) begin
    io_axi4_awid = _zz_io_axi4_awaddr[32 : 32];
    case(state)
      FsmState_IDLE : begin
      end
      FsmState_SEND_AW : begin
        io_axi4_awid = curCmd_id;
      end
      FsmState_DRAIN_W : begin
      end
      default : begin
      end
    endcase
  end

  always @(*) begin
    io_axi4_awregion = _zz_io_axi4_awaddr[36 : 33];
    case(state)
      FsmState_IDLE : begin
      end
      FsmState_SEND_AW : begin
        io_axi4_awregion = 4'b0000;
      end
      FsmState_DRAIN_W : begin
      end
      default : begin
      end
    endcase
  end

  always @(*) begin
    io_axi4_awlen = _zz_io_axi4_awaddr[44 : 37];
    case(state)
      FsmState_IDLE : begin
      end
      FsmState_SEND_AW : begin
        io_axi4_awlen = {4'd0, curCmd_len};
      end
      FsmState_DRAIN_W : begin
      end
      default : begin
      end
    endcase
  end

  always @(*) begin
    io_axi4_awsize = _zz_io_axi4_awaddr[47 : 45];
    case(state)
      FsmState_IDLE : begin
      end
      FsmState_SEND_AW : begin
        io_axi4_awsize = curCmd_size;
      end
      FsmState_DRAIN_W : begin
      end
      default : begin
      end
    endcase
  end

  always @(*) begin
    io_axi4_awburst = _zz_io_axi4_awaddr[49 : 48];
    case(state)
      FsmState_IDLE : begin
      end
      FsmState_SEND_AW : begin
        io_axi4_awburst = curCmd_burst;
      end
      FsmState_DRAIN_W : begin
      end
      default : begin
      end
    endcase
  end

  always @(*) begin
    io_axi4_awlock = _zz_io_axi4_awaddr[50 : 50];
    case(state)
      FsmState_IDLE : begin
      end
      FsmState_SEND_AW : begin
        io_axi4_awlock = curCmd_lock[0 : 0];
      end
      FsmState_DRAIN_W : begin
      end
      default : begin
      end
    endcase
  end

  always @(*) begin
    io_axi4_awcache = _zz_io_axi4_awaddr[54 : 51];
    case(state)
      FsmState_IDLE : begin
      end
      FsmState_SEND_AW : begin
        io_axi4_awcache = curCmd_cache;
      end
      FsmState_DRAIN_W : begin
      end
      default : begin
      end
    endcase
  end

  always @(*) begin
    io_axi4_awqos = _zz_io_axi4_awaddr[58 : 55];
    case(state)
      FsmState_IDLE : begin
      end
      FsmState_SEND_AW : begin
        io_axi4_awqos = 4'b0000;
      end
      FsmState_DRAIN_W : begin
      end
      default : begin
      end
    endcase
  end

  always @(*) begin
    io_axi4_awprot = _zz_io_axi4_awaddr[61 : 59];
    case(state)
      FsmState_IDLE : begin
      end
      FsmState_SEND_AW : begin
        io_axi4_awprot = curCmd_prot;
      end
      FsmState_DRAIN_W : begin
      end
      default : begin
      end
    endcase
  end

  always @(*) begin
    io_axi4_wvalid = 1'b0;
    case(state)
      FsmState_IDLE : begin
      end
      FsmState_SEND_AW : begin
        io_axi4_wvalid = slotValid;
      end
      FsmState_DRAIN_W : begin
        io_axi4_wvalid = slotValid;
      end
      default : begin
      end
    endcase
  end

  assign _zz_io_axi4_wdata = 37'h0000000000;
  always @(*) begin
    io_axi4_wdata = _zz_io_axi4_wdata[31 : 0];
    case(state)
      FsmState_IDLE : begin
      end
      FsmState_SEND_AW : begin
        io_axi4_wdata = drainBeat_data;
      end
      FsmState_DRAIN_W : begin
        io_axi4_wdata = drainBeat_data;
      end
      default : begin
      end
    endcase
  end

  always @(*) begin
    io_axi4_wstrb = _zz_io_axi4_wdata[35 : 32];
    case(state)
      FsmState_IDLE : begin
      end
      FsmState_SEND_AW : begin
        io_axi4_wstrb = drainBeat_strb;
      end
      FsmState_DRAIN_W : begin
        io_axi4_wstrb = drainBeat_strb;
      end
      default : begin
      end
    endcase
  end

  always @(*) begin
    io_axi4_wlast = _zz_io_axi4_wdata[36];
    case(state)
      FsmState_IDLE : begin
      end
      FsmState_SEND_AW : begin
        io_axi4_wlast = drainBeat_last;
      end
      FsmState_DRAIN_W : begin
        io_axi4_wlast = drainBeat_last;
      end
      default : begin
      end
    endcase
  end

  always @(*) begin
    drainBeat_data = 32'h00000000;
    if(when_Axi3ToAxi4Adapter_l256) begin
      drainBeat_data = wSlots_0_io_popdata;
    end
    if(when_Axi3ToAxi4Adapter_l256_1) begin
      drainBeat_data = wSlots_1_io_popdata;
    end
  end

  always @(*) begin
    drainBeat_strb = 4'b0000;
    if(when_Axi3ToAxi4Adapter_l256) begin
      drainBeat_strb = wSlots_0_io_popstrb;
    end
    if(when_Axi3ToAxi4Adapter_l256_1) begin
      drainBeat_strb = wSlots_1_io_popstrb;
    end
  end

  always @(*) begin
    drainBeat_last = 1'b0;
    if(when_Axi3ToAxi4Adapter_l256) begin
      drainBeat_last = wSlots_0_io_poplast;
    end
    if(when_Axi3ToAxi4Adapter_l256_1) begin
      drainBeat_last = wSlots_1_io_poplast;
    end
  end

  always @(*) begin
    slotValid = 1'b0;
    if(when_Axi3ToAxi4Adapter_l256) begin
      slotValid = wSlots_0_io_pop_valid;
    end
    if(when_Axi3ToAxi4Adapter_l256_1) begin
      slotValid = wSlots_1_io_pop_valid;
    end
  end

  always @(*) begin
    drainReady = 1'b0;
    case(state)
      FsmState_IDLE : begin
      end
      FsmState_SEND_AW : begin
        drainReady = io_axi4_wready;
      end
      FsmState_DRAIN_W : begin
        drainReady = io_axi4_wready;
      end
      default : begin
      end
    endcase
  end

  always @(*) begin
    wSlots_0_io_pop_ready = 1'b0;
    if(when_Axi3ToAxi4Adapter_l256) begin
      wSlots_0_io_pop_ready = drainReady;
    end
  end

  assign when_Axi3ToAxi4Adapter_l256 = (curCmd_id == 1'b0);
  always @(*) begin
    wSlots_1_io_pop_ready = 1'b0;
    if(when_Axi3ToAxi4Adapter_l256_1) begin
      wSlots_1_io_pop_ready = drainReady;
    end
  end

  assign when_Axi3ToAxi4Adapter_l256_1 = (curCmd_id == 1'b1);
  assign io_axi4_w_fire = (io_axi4_wvalid && io_axi4_wready);
  assign when_Axi3ToAxi4Adapter_l297 = (io_axi4_w_fire && drainBeat_last);
  assign when_Axi3ToAxi4Adapter_l316 = (io_axi4_w_fire && drainBeat_last);
  assign io_axi3_b_fire = (io_axi3_bvalid && io_axi3_bready);
  assign io_axi3_bvalid = (io_axi4_bvalid && (state == FsmState_WAIT_B));
  assign io_axi4_bready = (io_axi3_bready && (state == FsmState_WAIT_B));
  assign io_axi3_bid = io_axi4_bid;
  assign io_axi3_bresp = (curCmd_locked ? 2'b10 : io_axi4_bresp);
  assign awCmdFifo_io_flush = 1'b0;
  assign wSlots_0_io_flush = 1'b0;
  assign wSlots_1_io_flush = 1'b0;
  always @(posedge clk) begin
    if(!resetn) begin
      state <= FsmState_IDLE;
    end else begin
      case(state)
        FsmState_IDLE : begin
          if(awCmdFifo_io_pop_valid) begin
            state <= FsmState_SEND_AW;
          end
        end
        FsmState_SEND_AW : begin
          if(io_axi4_awready) begin
            if(when_Axi3ToAxi4Adapter_l297) begin
              state <= FsmState_WAIT_B;
            end else begin
              state <= FsmState_DRAIN_W;
            end
          end
        end
        FsmState_DRAIN_W : begin
          if(when_Axi3ToAxi4Adapter_l316) begin
            state <= FsmState_WAIT_B;
          end
        end
        default : begin
          if(io_axi3_b_fire) begin
            state <= FsmState_IDLE;
          end
        end
      endcase
    end
  end

  always @(posedge clk) begin
    case(state)
      FsmState_IDLE : begin
        if(awCmdFifo_io_pop_valid) begin
          curCmd_id <= awCmdFifo_io_popid;
          curCmd_addr <= awCmdFifo_io_popaddr;
          curCmd_len <= awCmdFifo_io_poplen;
          curCmd_size <= awCmdFifo_io_popsize;
          curCmd_burst <= awCmdFifo_io_popburst;
          curCmd_lock <= awCmdFifo_io_poplock;
          curCmd_cache <= awCmdFifo_io_popcache;
          curCmd_prot <= awCmdFifo_io_popprot;
          curCmd_locked <= awCmdFifo_io_poplocked;
        end
      end
      FsmState_SEND_AW : begin
      end
      FsmState_DRAIN_W : begin
      end
      default : begin
      end
    endcase
  end


endmodule

//Axi4FullToLiteAdapter_1 replaced by Axi4FullToLiteAdapter

module Axi4FullToLiteAdapter (
  input  wire          io_full_awvalid,
  output wire          io_full_awready,
  input  wire [31:0]   io_full_awaddr,
  input  wire [0:0]    io_full_awid,
  input  wire [3:0]    io_full_awregion,
  input  wire [7:0]    io_full_awlen,
  input  wire [2:0]    io_full_awsize,
  input  wire [1:0]    io_full_awburst,
  input  wire [0:0]    io_full_awlock,
  input  wire [3:0]    io_full_awcache,
  input  wire [3:0]    io_full_awqos,
  input  wire [2:0]    io_full_awprot,
  input  wire          io_full_wvalid,
  output wire          io_full_wready,
  input  wire [31:0]   io_full_wdata,
  input  wire [3:0]    io_full_wstrb,
  input  wire          io_full_wlast,
  output wire          io_full_bvalid,
  input  wire          io_full_bready,
  output reg  [0:0]    io_full_bid,
  output reg  [1:0]    io_full_bresp,
  input  wire          io_full_arvalid,
  output wire          io_full_arready,
  input  wire [31:0]   io_full_araddr,
  input  wire [0:0]    io_full_arid,
  input  wire [3:0]    io_full_arregion,
  input  wire [7:0]    io_full_arlen,
  input  wire [2:0]    io_full_arsize,
  input  wire [1:0]    io_full_arburst,
  input  wire [0:0]    io_full_arlock,
  input  wire [3:0]    io_full_arcache,
  input  wire [3:0]    io_full_arqos,
  input  wire [2:0]    io_full_arprot,
  output wire          io_full_rvalid,
  input  wire          io_full_rready,
  output reg  [31:0]   io_full_rdata,
  output reg  [0:0]    io_full_rid,
  output reg  [1:0]    io_full_rresp,
  output reg           io_full_rlast,
  output wire          io_lite_awvalid,
  input  wire          io_lite_awready,
  output reg  [31:0]   io_lite_awaddr,
  output reg  [2:0]    io_lite_awprot,
  output wire          io_lite_wvalid,
  input  wire          io_lite_wready,
  output reg  [31:0]   io_lite_wdata,
  output reg  [3:0]    io_lite_wstrb,
  input  wire          io_lite_bvalid,
  output wire          io_lite_bready,
  input  wire [1:0]    io_lite_bresp,
  output wire          io_lite_arvalid,
  input  wire          io_lite_arready,
  output reg  [31:0]   io_lite_araddr,
  output reg  [2:0]    io_lite_arprot,
  input  wire          io_lite_rvalid,
  output wire          io_lite_rready,
  input  wire [31:0]   io_lite_rdata,
  input  wire [1:0]    io_lite_rresp,
  input  wire          clk,
  input  wire          resetn
);

  wire       [34:0]   _zz_io_lite_awaddr;
  reg        [0:0]    _zz_io_full_bid;
  wire                io_full_aw_fire;
  wire       [2:0]    _zz_io_full_bid_1;
  wire       [35:0]   _zz_io_lite_wdata;
  wire       [34:0]   _zz_io_lite_araddr;
  reg        [0:0]    _zz_io_full_rid;
  wire                io_full_ar_fire;
  wire       [35:0]   _zz_io_full_rdata;

  assign io_lite_awvalid = io_full_awvalid;
  assign _zz_io_lite_awaddr = 35'h000000000;
  always @(*) begin
    io_lite_awaddr = _zz_io_lite_awaddr[31 : 0];
    io_lite_awaddr = io_full_awaddr;
  end

  always @(*) begin
    io_lite_awprot = _zz_io_lite_awaddr[34 : 32];
    io_lite_awprot = io_full_awprot;
  end

  assign io_full_awready = io_lite_awready;
  assign io_full_aw_fire = (io_full_awvalid && io_full_awready);
  assign io_full_bvalid = io_lite_bvalid;
  assign _zz_io_full_bid_1 = 3'b000;
  always @(*) begin
    io_full_bid = _zz_io_full_bid_1[0 : 0];
    io_full_bid = _zz_io_full_bid;
  end

  always @(*) begin
    io_full_bresp = _zz_io_full_bid_1[2 : 1];
    io_full_bresp = io_lite_bresp;
  end

  assign io_lite_bready = io_full_bready;
  assign io_lite_wvalid = io_full_wvalid;
  assign _zz_io_lite_wdata = 36'h000000000;
  always @(*) begin
    io_lite_wdata = _zz_io_lite_wdata[31 : 0];
    io_lite_wdata = io_full_wdata;
  end

  always @(*) begin
    io_lite_wstrb = _zz_io_lite_wdata[35 : 32];
    io_lite_wstrb = io_full_wstrb;
  end

  assign io_full_wready = io_lite_wready;
  assign io_lite_arvalid = io_full_arvalid;
  assign _zz_io_lite_araddr = 35'h000000000;
  always @(*) begin
    io_lite_araddr = _zz_io_lite_araddr[31 : 0];
    io_lite_araddr = io_full_araddr;
  end

  always @(*) begin
    io_lite_arprot = _zz_io_lite_araddr[34 : 32];
    io_lite_arprot = io_full_arprot;
  end

  assign io_full_arready = io_lite_arready;
  assign io_full_ar_fire = (io_full_arvalid && io_full_arready);
  assign io_full_rvalid = io_lite_rvalid;
  assign _zz_io_full_rdata = 36'h000000000;
  always @(*) begin
    io_full_rdata = _zz_io_full_rdata[31 : 0];
    io_full_rdata = io_lite_rdata;
  end

  always @(*) begin
    io_full_rid = _zz_io_full_rdata[32 : 32];
    io_full_rid = _zz_io_full_rid;
  end

  always @(*) begin
    io_full_rresp = _zz_io_full_rdata[34 : 33];
    io_full_rresp = io_lite_rresp;
  end

  always @(*) begin
    io_full_rlast = _zz_io_full_rdata[35];
    io_full_rlast = 1'b1;
  end

  assign io_lite_rready = io_full_rready;
  always @(posedge clk) begin
    if(!resetn) begin
      _zz_io_full_bid <= 1'b0;
      _zz_io_full_rid <= 1'b0;
    end else begin
      if(io_full_aw_fire) begin
        _zz_io_full_bid <= io_full_awid;
      end
      if(io_full_ar_fire) begin
        _zz_io_full_rid <= io_full_arid;
      end
    end
  end


endmodule

module Axi4Crossbar (
  input  wire          io_masters_0_awvalid,
  output reg           io_masters_0_awready,
  input  wire [31:0]   io_masters_0_awaddr,
  input  wire [0:0]    io_masters_0_awid,
  input  wire [3:0]    io_masters_0_awregion,
  input  wire [7:0]    io_masters_0_awlen,
  input  wire [2:0]    io_masters_0_awsize,
  input  wire [1:0]    io_masters_0_awburst,
  input  wire [0:0]    io_masters_0_awlock,
  input  wire [3:0]    io_masters_0_awcache,
  input  wire [3:0]    io_masters_0_awqos,
  input  wire [2:0]    io_masters_0_awprot,
  input  wire          io_masters_0_wvalid,
  output reg           io_masters_0_wready,
  input  wire [31:0]   io_masters_0_wdata,
  input  wire [3:0]    io_masters_0_wstrb,
  input  wire          io_masters_0_wlast,
  output reg           io_masters_0_bvalid,
  input  wire          io_masters_0_bready,
  output reg  [0:0]    io_masters_0_bid,
  output reg  [1:0]    io_masters_0_bresp,
  input  wire          io_masters_0_arvalid,
  output reg           io_masters_0_arready,
  input  wire [31:0]   io_masters_0_araddr,
  input  wire [0:0]    io_masters_0_arid,
  input  wire [3:0]    io_masters_0_arregion,
  input  wire [7:0]    io_masters_0_arlen,
  input  wire [2:0]    io_masters_0_arsize,
  input  wire [1:0]    io_masters_0_arburst,
  input  wire [0:0]    io_masters_0_arlock,
  input  wire [3:0]    io_masters_0_arcache,
  input  wire [3:0]    io_masters_0_arqos,
  input  wire [2:0]    io_masters_0_arprot,
  output reg           io_masters_0_rvalid,
  input  wire          io_masters_0_rready,
  output reg  [31:0]   io_masters_0_rdata,
  output reg  [0:0]    io_masters_0_rid,
  output reg  [1:0]    io_masters_0_rresp,
  output reg           io_masters_0_rlast,
  output reg           io_slaves_0_awvalid,
  input  wire          io_slaves_0_awready,
  output reg  [31:0]   io_slaves_0_awaddr,
  output reg  [0:0]    io_slaves_0_awid,
  output wire [3:0]    io_slaves_0_awregion,
  output reg  [7:0]    io_slaves_0_awlen,
  output reg  [2:0]    io_slaves_0_awsize,
  output reg  [1:0]    io_slaves_0_awburst,
  output reg  [0:0]    io_slaves_0_awlock,
  output reg  [3:0]    io_slaves_0_awcache,
  output reg  [3:0]    io_slaves_0_awqos,
  output reg  [2:0]    io_slaves_0_awprot,
  output reg           io_slaves_0_wvalid,
  input  wire          io_slaves_0_wready,
  output reg  [31:0]   io_slaves_0_wdata,
  output reg  [3:0]    io_slaves_0_wstrb,
  output reg           io_slaves_0_wlast,
  input  wire          io_slaves_0_bvalid,
  output reg           io_slaves_0_bready,
  input  wire [0:0]    io_slaves_0_bid,
  input  wire [1:0]    io_slaves_0_bresp,
  output reg           io_slaves_0_arvalid,
  input  wire          io_slaves_0_arready,
  output reg  [31:0]   io_slaves_0_araddr,
  output reg  [0:0]    io_slaves_0_arid,
  output wire [3:0]    io_slaves_0_arregion,
  output reg  [7:0]    io_slaves_0_arlen,
  output reg  [2:0]    io_slaves_0_arsize,
  output reg  [1:0]    io_slaves_0_arburst,
  output reg  [0:0]    io_slaves_0_arlock,
  output reg  [3:0]    io_slaves_0_arcache,
  output reg  [3:0]    io_slaves_0_arqos,
  output reg  [2:0]    io_slaves_0_arprot,
  input  wire          io_slaves_0_rvalid,
  output reg           io_slaves_0_rready,
  input  wire [31:0]   io_slaves_0_rdata,
  input  wire [0:0]    io_slaves_0_rid,
  input  wire [1:0]    io_slaves_0_rresp,
  input  wire          io_slaves_0_rlast,
  output reg           io_slaves_1_awvalid,
  input  wire          io_slaves_1_awready,
  output reg  [31:0]   io_slaves_1_awaddr,
  output reg  [0:0]    io_slaves_1_awid,
  output wire [3:0]    io_slaves_1_awregion,
  output reg  [7:0]    io_slaves_1_awlen,
  output reg  [2:0]    io_slaves_1_awsize,
  output reg  [1:0]    io_slaves_1_awburst,
  output reg  [0:0]    io_slaves_1_awlock,
  output reg  [3:0]    io_slaves_1_awcache,
  output reg  [3:0]    io_slaves_1_awqos,
  output reg  [2:0]    io_slaves_1_awprot,
  output reg           io_slaves_1_wvalid,
  input  wire          io_slaves_1_wready,
  output reg  [31:0]   io_slaves_1_wdata,
  output reg  [3:0]    io_slaves_1_wstrb,
  output reg           io_slaves_1_wlast,
  input  wire          io_slaves_1_bvalid,
  output reg           io_slaves_1_bready,
  input  wire [0:0]    io_slaves_1_bid,
  input  wire [1:0]    io_slaves_1_bresp,
  output reg           io_slaves_1_arvalid,
  input  wire          io_slaves_1_arready,
  output reg  [31:0]   io_slaves_1_araddr,
  output reg  [0:0]    io_slaves_1_arid,
  output wire [3:0]    io_slaves_1_arregion,
  output reg  [7:0]    io_slaves_1_arlen,
  output reg  [2:0]    io_slaves_1_arsize,
  output reg  [1:0]    io_slaves_1_arburst,
  output reg  [0:0]    io_slaves_1_arlock,
  output reg  [3:0]    io_slaves_1_arcache,
  output reg  [3:0]    io_slaves_1_arqos,
  output reg  [2:0]    io_slaves_1_arprot,
  input  wire          io_slaves_1_rvalid,
  output reg           io_slaves_1_rready,
  input  wire [31:0]   io_slaves_1_rdata,
  input  wire [0:0]    io_slaves_1_rid,
  input  wire [1:0]    io_slaves_1_rresp,
  input  wire          io_slaves_1_rlast,
  output reg           io_slaves_2_awvalid,
  input  wire          io_slaves_2_awready,
  output reg  [31:0]   io_slaves_2_awaddr,
  output reg  [0:0]    io_slaves_2_awid,
  output wire [3:0]    io_slaves_2_awregion,
  output reg  [7:0]    io_slaves_2_awlen,
  output reg  [2:0]    io_slaves_2_awsize,
  output reg  [1:0]    io_slaves_2_awburst,
  output reg  [0:0]    io_slaves_2_awlock,
  output reg  [3:0]    io_slaves_2_awcache,
  output reg  [3:0]    io_slaves_2_awqos,
  output reg  [2:0]    io_slaves_2_awprot,
  output reg           io_slaves_2_wvalid,
  input  wire          io_slaves_2_wready,
  output reg  [31:0]   io_slaves_2_wdata,
  output reg  [3:0]    io_slaves_2_wstrb,
  output reg           io_slaves_2_wlast,
  input  wire          io_slaves_2_bvalid,
  output reg           io_slaves_2_bready,
  input  wire [0:0]    io_slaves_2_bid,
  input  wire [1:0]    io_slaves_2_bresp,
  output reg           io_slaves_2_arvalid,
  input  wire          io_slaves_2_arready,
  output reg  [31:0]   io_slaves_2_araddr,
  output reg  [0:0]    io_slaves_2_arid,
  output wire [3:0]    io_slaves_2_arregion,
  output reg  [7:0]    io_slaves_2_arlen,
  output reg  [2:0]    io_slaves_2_arsize,
  output reg  [1:0]    io_slaves_2_arburst,
  output reg  [0:0]    io_slaves_2_arlock,
  output reg  [3:0]    io_slaves_2_arcache,
  output reg  [3:0]    io_slaves_2_arqos,
  output reg  [2:0]    io_slaves_2_arprot,
  input  wire          io_slaves_2_rvalid,
  output reg           io_slaves_2_rready,
  input  wire [31:0]   io_slaves_2_rdata,
  input  wire [0:0]    io_slaves_2_rid,
  input  wire [1:0]    io_slaves_2_rresp,
  input  wire          io_slaves_2_rlast,
  output reg           io_slaves_3_awvalid,
  input  wire          io_slaves_3_awready,
  output reg  [31:0]   io_slaves_3_awaddr,
  output reg  [0:0]    io_slaves_3_awid,
  output wire [3:0]    io_slaves_3_awregion,
  output reg  [7:0]    io_slaves_3_awlen,
  output reg  [2:0]    io_slaves_3_awsize,
  output reg  [1:0]    io_slaves_3_awburst,
  output reg  [0:0]    io_slaves_3_awlock,
  output reg  [3:0]    io_slaves_3_awcache,
  output reg  [3:0]    io_slaves_3_awqos,
  output reg  [2:0]    io_slaves_3_awprot,
  output reg           io_slaves_3_wvalid,
  input  wire          io_slaves_3_wready,
  output reg  [31:0]   io_slaves_3_wdata,
  output reg  [3:0]    io_slaves_3_wstrb,
  output reg           io_slaves_3_wlast,
  input  wire          io_slaves_3_bvalid,
  output reg           io_slaves_3_bready,
  input  wire [0:0]    io_slaves_3_bid,
  input  wire [1:0]    io_slaves_3_bresp,
  output reg           io_slaves_3_arvalid,
  input  wire          io_slaves_3_arready,
  output reg  [31:0]   io_slaves_3_araddr,
  output reg  [0:0]    io_slaves_3_arid,
  output wire [3:0]    io_slaves_3_arregion,
  output reg  [7:0]    io_slaves_3_arlen,
  output reg  [2:0]    io_slaves_3_arsize,
  output reg  [1:0]    io_slaves_3_arburst,
  output reg  [0:0]    io_slaves_3_arlock,
  output reg  [3:0]    io_slaves_3_arcache,
  output reg  [3:0]    io_slaves_3_arqos,
  output reg  [2:0]    io_slaves_3_arprot,
  input  wire          io_slaves_3_rvalid,
  output reg           io_slaves_3_rready,
  input  wire [31:0]   io_slaves_3_rdata,
  input  wire [0:0]    io_slaves_3_rid,
  input  wire [1:0]    io_slaves_3_rresp,
  input  wire          io_slaves_3_rlast,
  input  wire          clk,
  input  wire          resetn
);

  wire       [0:0]    _zz__zz_5_port0;
  wire       [0:0]    _zz__zz_6_port0;
  wire       [0:0]    _zz__zz_7_port0;
  wire       [0:0]    _zz__zz_8_port0;
  wire       [0:0]    _zz_when_Axi4Crossbar_l161_32;
  wire       [0:0]    _zz_when_Axi4Crossbar_l161_33;
  wire       [0:0]    _zz_when_Axi4Crossbar_l161_34;
  wire       [1:0]    _zz__zz_9;
  wire       [0:0]    _zz__zz_5_port;
  wire       [1:0]    _zz__zz_when_Axi4Crossbar_l482;
  wire       [0:0]    _zz_when_Axi4Crossbar_l161_1_1;
  wire       [0:0]    _zz_when_Axi4Crossbar_l161_1_2;
  wire       [0:0]    _zz_when_Axi4Crossbar_l161_1_3;
  wire       [1:0]    _zz__zz_10;
  wire       [0:0]    _zz__zz_6_port;
  wire       [1:0]    _zz__zz_when_Axi4Crossbar_l482_1;
  wire       [0:0]    _zz_when_Axi4Crossbar_l161_2_1;
  wire       [0:0]    _zz_when_Axi4Crossbar_l161_2_2;
  wire       [0:0]    _zz_when_Axi4Crossbar_l161_2_3;
  wire       [1:0]    _zz__zz_11;
  wire       [0:0]    _zz__zz_7_port;
  wire       [1:0]    _zz__zz_when_Axi4Crossbar_l482_2;
  wire       [0:0]    _zz_when_Axi4Crossbar_l161_3_1;
  wire       [0:0]    _zz_when_Axi4Crossbar_l161_3_2;
  wire       [0:0]    _zz_when_Axi4Crossbar_l161_3_3;
  wire       [1:0]    _zz__zz_12;
  wire       [0:0]    _zz__zz_8_port;
  wire       [1:0]    _zz__zz_when_Axi4Crossbar_l482_3;
  wire       [3:0]    _zz__zz_when_Axi4Crossbar_l534_2;
  wire       [0:0]    _zz_when_Axi4Crossbar_l161_4_1;
  wire       [0:0]    _zz_when_Axi4Crossbar_l161_4_2;
  wire       [0:0]    _zz_when_Axi4Crossbar_l161_4_3;
  wire       [0:0]    _zz_when_Axi4Crossbar_l161_5_1;
  wire       [0:0]    _zz_when_Axi4Crossbar_l161_5_2;
  wire       [0:0]    _zz_when_Axi4Crossbar_l161_5_3;
  wire       [0:0]    _zz_when_Axi4Crossbar_l161_6_1;
  wire       [0:0]    _zz_when_Axi4Crossbar_l161_6_2;
  wire       [0:0]    _zz_when_Axi4Crossbar_l161_6_3;
  wire       [0:0]    _zz_when_Axi4Crossbar_l161_7_1;
  wire       [0:0]    _zz_when_Axi4Crossbar_l161_7_2;
  wire       [0:0]    _zz_when_Axi4Crossbar_l161_7_3;
  wire       [3:0]    _zz__zz_when_Axi4Crossbar_l604_2;
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
  wire       [2:0]    _zz_io_masters_0_bid;
  wire       [35:0]   _zz_io_masters_0_rdata;
  wire       [61:0]   _zz_io_slaves_0_awaddr;
  wire       [36:0]   _zz_io_slaves_0_wdata;
  wire       [61:0]   _zz_io_slaves_0_araddr;
  wire       [61:0]   _zz_io_slaves_1_awaddr;
  wire       [36:0]   _zz_io_slaves_1_wdata;
  wire       [61:0]   _zz_io_slaves_1_araddr;
  wire       [61:0]   _zz_io_slaves_2_awaddr;
  wire       [36:0]   _zz_io_slaves_2_wdata;
  wire       [61:0]   _zz_io_slaves_2_araddr;
  wire       [61:0]   _zz_io_slaves_3_awaddr;
  wire       [36:0]   _zz_io_slaves_3_wdata;
  wire       [61:0]   _zz_io_slaves_3_araddr;
  reg        [2:0]    _zz_when_Axi4Crossbar_l450;
  reg        [2:0]    _zz_when_Axi4Crossbar_l450_1;
  reg        [2:0]    _zz_when_Axi4Crossbar_l450_2;
  reg        [2:0]    _zz_when_Axi4Crossbar_l450_3;
  reg        [1:0]    _zz_9;
  reg        [1:0]    _zz_10;
  reg        [1:0]    _zz_11;
  reg        [1:0]    _zz_12;
  reg        [1:0]    _zz_when_Axi4Crossbar_l482;
  reg        [1:0]    _zz_when_Axi4Crossbar_l482_1;
  reg        [1:0]    _zz_when_Axi4Crossbar_l482_2;
  reg        [1:0]    _zz_when_Axi4Crossbar_l482_3;
  reg        [2:0]    _zz_when_Axi4Crossbar_l459;
  reg        [2:0]    _zz_when_Axi4Crossbar_l459_1;
  reg        [2:0]    _zz_when_Axi4Crossbar_l459_2;
  reg        [2:0]    _zz_when_Axi4Crossbar_l459_3;
  reg        [2:0]    _zz_when_Axi4Crossbar_l563;
  reg        [2:0]    _zz_when_Axi4Crossbar_l563_1;
  reg        [2:0]    _zz_when_Axi4Crossbar_l563_2;
  reg        [2:0]    _zz_when_Axi4Crossbar_l563_3;
  wire       [0:0]    _zz_when_Axi4Crossbar_l450_4;
  reg        [3:0]    _zz_when_Axi4Crossbar_l450_5;
  wire       [0:0]    _zz_when_Axi4Crossbar_l161;
  wire       [0:0]    _zz_when_Axi4Crossbar_l161_1;
  wire       [0:0]    _zz_when_Axi4Crossbar_l161_2;
  wire       [0:0]    _zz_when_Axi4Crossbar_l161_3;
  reg        [0:0]    _zz_wrRrPtr_0;
  wire                when_Axi4Crossbar_l161;
  wire                when_Axi4Crossbar_l459;
  wire                when_Axi4Crossbar_l450;
  wire                when_Axi4Crossbar_l453;
  wire                io_slaves_0_aw_fire;
  wire                when_Axi4Crossbar_l480;
  wire                when_Axi4Crossbar_l482;
  wire                when_Axi4Crossbar_l497;
  wire                io_slaves_0_w_fire;
  wire                when_Axi4Crossbar_l503;
  wire                when_Axi4Crossbar_l505;
  wire                io_slaves_0_b_fire;
  wire                when_Axi4Crossbar_l512;
  wire                when_Axi4Crossbar_l514;
  wire       [0:0]    _zz_when_Axi4Crossbar_l450_6;
  reg        [3:0]    _zz_when_Axi4Crossbar_l450_7;
  wire       [0:0]    _zz_when_Axi4Crossbar_l161_4;
  wire       [0:0]    _zz_when_Axi4Crossbar_l161_5;
  wire       [0:0]    _zz_when_Axi4Crossbar_l161_6;
  wire       [0:0]    _zz_when_Axi4Crossbar_l161_7;
  reg        [0:0]    _zz_wrRrPtr_1;
  wire                when_Axi4Crossbar_l161_1;
  wire                when_Axi4Crossbar_l459_1;
  wire                when_Axi4Crossbar_l450_1;
  wire                when_Axi4Crossbar_l453_1;
  wire                io_slaves_1_aw_fire;
  wire                when_Axi4Crossbar_l480_1;
  wire                when_Axi4Crossbar_l482_1;
  wire                when_Axi4Crossbar_l497_1;
  wire                io_slaves_1_w_fire;
  wire                when_Axi4Crossbar_l503_1;
  wire                when_Axi4Crossbar_l505_1;
  wire                io_slaves_1_b_fire;
  wire                when_Axi4Crossbar_l512_1;
  wire                when_Axi4Crossbar_l514_1;
  wire       [0:0]    _zz_when_Axi4Crossbar_l450_8;
  reg        [3:0]    _zz_when_Axi4Crossbar_l450_9;
  wire       [0:0]    _zz_when_Axi4Crossbar_l161_8;
  wire       [0:0]    _zz_when_Axi4Crossbar_l161_9;
  wire       [0:0]    _zz_when_Axi4Crossbar_l161_10;
  wire       [0:0]    _zz_when_Axi4Crossbar_l161_11;
  reg        [0:0]    _zz_wrRrPtr_2;
  wire                when_Axi4Crossbar_l161_2;
  wire                when_Axi4Crossbar_l459_2;
  wire                when_Axi4Crossbar_l450_2;
  wire                when_Axi4Crossbar_l453_2;
  wire                io_slaves_2_aw_fire;
  wire                when_Axi4Crossbar_l480_2;
  wire                when_Axi4Crossbar_l482_2;
  wire                when_Axi4Crossbar_l497_2;
  wire                io_slaves_2_w_fire;
  wire                when_Axi4Crossbar_l503_2;
  wire                when_Axi4Crossbar_l505_2;
  wire                io_slaves_2_b_fire;
  wire                when_Axi4Crossbar_l512_2;
  wire                when_Axi4Crossbar_l514_2;
  wire       [0:0]    _zz_when_Axi4Crossbar_l450_10;
  reg        [3:0]    _zz_when_Axi4Crossbar_l450_11;
  wire       [0:0]    _zz_when_Axi4Crossbar_l161_12;
  wire       [0:0]    _zz_when_Axi4Crossbar_l161_13;
  wire       [0:0]    _zz_when_Axi4Crossbar_l161_14;
  wire       [0:0]    _zz_when_Axi4Crossbar_l161_15;
  reg        [0:0]    _zz_wrRrPtr_3;
  wire                when_Axi4Crossbar_l161_3;
  wire                when_Axi4Crossbar_l459_3;
  wire                when_Axi4Crossbar_l450_3;
  wire                when_Axi4Crossbar_l453_3;
  wire                io_slaves_3_aw_fire;
  wire                when_Axi4Crossbar_l480_3;
  wire                when_Axi4Crossbar_l482_3;
  wire                when_Axi4Crossbar_l497_3;
  wire                io_slaves_3_w_fire;
  wire                when_Axi4Crossbar_l503_3;
  wire                when_Axi4Crossbar_l505_3;
  wire                io_slaves_3_b_fire;
  wire                when_Axi4Crossbar_l512_3;
  wire                when_Axi4Crossbar_l514_3;
  reg        [3:0]    _zz_when_Axi4Crossbar_l534;
  wire       [3:0]    _zz_when_Axi4Crossbar_l534_1;
  wire       [3:0]    _zz_when_Axi4Crossbar_l534_2;
  wire                when_Axi4Crossbar_l534;
  wire                when_Axi4Crossbar_l534_1;
  wire                when_Axi4Crossbar_l534_2;
  wire                when_Axi4Crossbar_l534_3;
  wire       [0:0]    _zz_when_Axi4Crossbar_l563_4;
  reg        [3:0]    _zz_when_Axi4Crossbar_l563_5;
  wire       [0:0]    _zz_when_Axi4Crossbar_l161_16;
  wire       [0:0]    _zz_when_Axi4Crossbar_l161_17;
  wire       [0:0]    _zz_when_Axi4Crossbar_l161_18;
  wire       [0:0]    _zz_when_Axi4Crossbar_l161_19;
  reg        [0:0]    _zz_rdRrPtr_0;
  wire                when_Axi4Crossbar_l161_4;
  wire                when_Axi4Crossbar_l563;
  wire                when_Axi4Crossbar_l566;
  wire                io_slaves_0_ar_fire;
  wire                _zz_when_Axi4Crossbar_l584;
  wire                io_slaves_0_r_fire;
  wire                when_Axi4Crossbar_l584;
  wire                when_Axi4Crossbar_l586;
  wire       [0:0]    _zz_when_Axi4Crossbar_l563_6;
  reg        [3:0]    _zz_when_Axi4Crossbar_l563_7;
  wire       [0:0]    _zz_when_Axi4Crossbar_l161_20;
  wire       [0:0]    _zz_when_Axi4Crossbar_l161_21;
  wire       [0:0]    _zz_when_Axi4Crossbar_l161_22;
  wire       [0:0]    _zz_when_Axi4Crossbar_l161_23;
  reg        [0:0]    _zz_rdRrPtr_1;
  wire                when_Axi4Crossbar_l161_5;
  wire                when_Axi4Crossbar_l563_1;
  wire                when_Axi4Crossbar_l566_1;
  wire                io_slaves_1_ar_fire;
  wire                _zz_when_Axi4Crossbar_l584_1;
  wire                io_slaves_1_r_fire;
  wire                when_Axi4Crossbar_l584_1;
  wire                when_Axi4Crossbar_l586_1;
  wire       [0:0]    _zz_when_Axi4Crossbar_l563_8;
  reg        [3:0]    _zz_when_Axi4Crossbar_l563_9;
  wire       [0:0]    _zz_when_Axi4Crossbar_l161_24;
  wire       [0:0]    _zz_when_Axi4Crossbar_l161_25;
  wire       [0:0]    _zz_when_Axi4Crossbar_l161_26;
  wire       [0:0]    _zz_when_Axi4Crossbar_l161_27;
  reg        [0:0]    _zz_rdRrPtr_2;
  wire                when_Axi4Crossbar_l161_6;
  wire                when_Axi4Crossbar_l563_2;
  wire                when_Axi4Crossbar_l566_2;
  wire                io_slaves_2_ar_fire;
  wire                _zz_when_Axi4Crossbar_l584_2;
  wire                io_slaves_2_r_fire;
  wire                when_Axi4Crossbar_l584_2;
  wire                when_Axi4Crossbar_l586_2;
  wire       [0:0]    _zz_when_Axi4Crossbar_l563_10;
  reg        [3:0]    _zz_when_Axi4Crossbar_l563_11;
  wire       [0:0]    _zz_when_Axi4Crossbar_l161_28;
  wire       [0:0]    _zz_when_Axi4Crossbar_l161_29;
  wire       [0:0]    _zz_when_Axi4Crossbar_l161_30;
  wire       [0:0]    _zz_when_Axi4Crossbar_l161_31;
  reg        [0:0]    _zz_rdRrPtr_3;
  wire                when_Axi4Crossbar_l161_7;
  wire                when_Axi4Crossbar_l563_3;
  wire                when_Axi4Crossbar_l566_3;
  wire                io_slaves_3_ar_fire;
  wire                _zz_when_Axi4Crossbar_l584_3;
  wire                io_slaves_3_r_fire;
  wire                when_Axi4Crossbar_l584_3;
  wire                when_Axi4Crossbar_l586_3;
  reg        [3:0]    _zz_when_Axi4Crossbar_l604;
  wire       [3:0]    _zz_when_Axi4Crossbar_l604_1;
  wire       [3:0]    _zz_when_Axi4Crossbar_l604_2;
  wire                when_Axi4Crossbar_l604;
  wire                when_Axi4Crossbar_l604_1;
  wire                when_Axi4Crossbar_l604_2;
  wire                when_Axi4Crossbar_l604_3;
  (* ram_style = "distributed" *) reg [0:0] _zz_5 [0:3];
  (* ram_style = "distributed" *) reg [0:0] _zz_6 [0:3];
  (* ram_style = "distributed" *) reg [0:0] _zz_7 [0:3];
  (* ram_style = "distributed" *) reg [0:0] _zz_8 [0:3];

  assign _zz_when_Axi4Crossbar_l161_32 = ((|_zz_when_Axi4Crossbar_l161_1) ? (_zz_when_Axi4Crossbar_l161_2 & (~ _zz_when_Axi4Crossbar_l161_33)) : (_zz_when_Axi4Crossbar_l161_3 & (~ _zz_when_Axi4Crossbar_l161_34)));
  assign _zz_when_Axi4Crossbar_l161_33 = (_zz_when_Axi4Crossbar_l161_2 - 1'b1);
  assign _zz_when_Axi4Crossbar_l161_34 = (_zz_when_Axi4Crossbar_l161_3 - 1'b1);
  assign _zz__zz_9 = (_zz_9 + 2'b01);
  assign _zz__zz_when_Axi4Crossbar_l482 = (_zz_when_Axi4Crossbar_l482 + 2'b01);
  assign _zz_when_Axi4Crossbar_l161_1_1 = ((|_zz_when_Axi4Crossbar_l161_5) ? (_zz_when_Axi4Crossbar_l161_6 & (~ _zz_when_Axi4Crossbar_l161_1_2)) : (_zz_when_Axi4Crossbar_l161_7 & (~ _zz_when_Axi4Crossbar_l161_1_3)));
  assign _zz_when_Axi4Crossbar_l161_1_2 = (_zz_when_Axi4Crossbar_l161_6 - 1'b1);
  assign _zz_when_Axi4Crossbar_l161_1_3 = (_zz_when_Axi4Crossbar_l161_7 - 1'b1);
  assign _zz__zz_10 = (_zz_10 + 2'b01);
  assign _zz__zz_when_Axi4Crossbar_l482_1 = (_zz_when_Axi4Crossbar_l482_1 + 2'b01);
  assign _zz_when_Axi4Crossbar_l161_2_1 = ((|_zz_when_Axi4Crossbar_l161_9) ? (_zz_when_Axi4Crossbar_l161_10 & (~ _zz_when_Axi4Crossbar_l161_2_2)) : (_zz_when_Axi4Crossbar_l161_11 & (~ _zz_when_Axi4Crossbar_l161_2_3)));
  assign _zz_when_Axi4Crossbar_l161_2_2 = (_zz_when_Axi4Crossbar_l161_10 - 1'b1);
  assign _zz_when_Axi4Crossbar_l161_2_3 = (_zz_when_Axi4Crossbar_l161_11 - 1'b1);
  assign _zz__zz_11 = (_zz_11 + 2'b01);
  assign _zz__zz_when_Axi4Crossbar_l482_2 = (_zz_when_Axi4Crossbar_l482_2 + 2'b01);
  assign _zz_when_Axi4Crossbar_l161_3_1 = ((|_zz_when_Axi4Crossbar_l161_13) ? (_zz_when_Axi4Crossbar_l161_14 & (~ _zz_when_Axi4Crossbar_l161_3_2)) : (_zz_when_Axi4Crossbar_l161_15 & (~ _zz_when_Axi4Crossbar_l161_3_3)));
  assign _zz_when_Axi4Crossbar_l161_3_2 = (_zz_when_Axi4Crossbar_l161_14 - 1'b1);
  assign _zz_when_Axi4Crossbar_l161_3_3 = (_zz_when_Axi4Crossbar_l161_15 - 1'b1);
  assign _zz__zz_12 = (_zz_12 + 2'b01);
  assign _zz__zz_when_Axi4Crossbar_l482_3 = (_zz_when_Axi4Crossbar_l482_3 + 2'b01);
  assign _zz__zz_when_Axi4Crossbar_l534_2 = (_zz_when_Axi4Crossbar_l534_1 - 4'b0001);
  assign _zz_when_Axi4Crossbar_l161_4_1 = ((|_zz_when_Axi4Crossbar_l161_17) ? (_zz_when_Axi4Crossbar_l161_18 & (~ _zz_when_Axi4Crossbar_l161_4_2)) : (_zz_when_Axi4Crossbar_l161_19 & (~ _zz_when_Axi4Crossbar_l161_4_3)));
  assign _zz_when_Axi4Crossbar_l161_4_2 = (_zz_when_Axi4Crossbar_l161_18 - 1'b1);
  assign _zz_when_Axi4Crossbar_l161_4_3 = (_zz_when_Axi4Crossbar_l161_19 - 1'b1);
  assign _zz_when_Axi4Crossbar_l161_5_1 = ((|_zz_when_Axi4Crossbar_l161_21) ? (_zz_when_Axi4Crossbar_l161_22 & (~ _zz_when_Axi4Crossbar_l161_5_2)) : (_zz_when_Axi4Crossbar_l161_23 & (~ _zz_when_Axi4Crossbar_l161_5_3)));
  assign _zz_when_Axi4Crossbar_l161_5_2 = (_zz_when_Axi4Crossbar_l161_22 - 1'b1);
  assign _zz_when_Axi4Crossbar_l161_5_3 = (_zz_when_Axi4Crossbar_l161_23 - 1'b1);
  assign _zz_when_Axi4Crossbar_l161_6_1 = ((|_zz_when_Axi4Crossbar_l161_25) ? (_zz_when_Axi4Crossbar_l161_26 & (~ _zz_when_Axi4Crossbar_l161_6_2)) : (_zz_when_Axi4Crossbar_l161_27 & (~ _zz_when_Axi4Crossbar_l161_6_3)));
  assign _zz_when_Axi4Crossbar_l161_6_2 = (_zz_when_Axi4Crossbar_l161_26 - 1'b1);
  assign _zz_when_Axi4Crossbar_l161_6_3 = (_zz_when_Axi4Crossbar_l161_27 - 1'b1);
  assign _zz_when_Axi4Crossbar_l161_7_1 = ((|_zz_when_Axi4Crossbar_l161_29) ? (_zz_when_Axi4Crossbar_l161_30 & (~ _zz_when_Axi4Crossbar_l161_7_2)) : (_zz_when_Axi4Crossbar_l161_31 & (~ _zz_when_Axi4Crossbar_l161_7_3)));
  assign _zz_when_Axi4Crossbar_l161_7_2 = (_zz_when_Axi4Crossbar_l161_30 - 1'b1);
  assign _zz_when_Axi4Crossbar_l161_7_3 = (_zz_when_Axi4Crossbar_l161_31 - 1'b1);
  assign _zz__zz_when_Axi4Crossbar_l604_2 = (_zz_when_Axi4Crossbar_l604_1 - 4'b0001);
  assign _zz__zz_5_port = _zz_wrRrPtr_0;
  assign _zz__zz_6_port = _zz_wrRrPtr_1;
  assign _zz__zz_7_port = _zz_wrRrPtr_2;
  assign _zz__zz_8_port = _zz_wrRrPtr_3;
  assign _zz__zz_5_port0 = _zz_5[_zz_when_Axi4Crossbar_l482];
  always @(posedge clk) begin
    if(_zz_4) begin
      _zz_5[_zz_9] <= _zz__zz_5_port;
    end
  end

  assign _zz__zz_6_port0 = _zz_6[_zz_when_Axi4Crossbar_l482_1];
  always @(posedge clk) begin
    if(_zz_3) begin
      _zz_6[_zz_10] <= _zz__zz_6_port;
    end
  end

  assign _zz__zz_7_port0 = _zz_7[_zz_when_Axi4Crossbar_l482_2];
  always @(posedge clk) begin
    if(_zz_2) begin
      _zz_7[_zz_11] <= _zz__zz_7_port;
    end
  end

  assign _zz__zz_8_port0 = _zz_8[_zz_when_Axi4Crossbar_l482_3];
  always @(posedge clk) begin
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
    io_masters_0_awready = 1'b0;
    if(when_Axi4Crossbar_l450) begin
      if(when_Axi4Crossbar_l453) begin
        io_masters_0_awready = io_slaves_0_awready;
      end
    end
    if(when_Axi4Crossbar_l450_1) begin
      if(when_Axi4Crossbar_l453_1) begin
        io_masters_0_awready = io_slaves_1_awready;
      end
    end
    if(when_Axi4Crossbar_l450_2) begin
      if(when_Axi4Crossbar_l453_2) begin
        io_masters_0_awready = io_slaves_2_awready;
      end
    end
    if(when_Axi4Crossbar_l450_3) begin
      if(when_Axi4Crossbar_l453_3) begin
        io_masters_0_awready = io_slaves_3_awready;
      end
    end
  end

  always @(*) begin
    io_masters_0_wready = 1'b0;
    if(when_Axi4Crossbar_l450) begin
      if(when_Axi4Crossbar_l453) begin
        if(when_Axi4Crossbar_l459) begin
          io_masters_0_wready = io_slaves_0_wready;
        end
      end
    end
    if(when_Axi4Crossbar_l480) begin
      if(when_Axi4Crossbar_l482) begin
        io_masters_0_wready = io_slaves_0_wready;
      end
    end
    if(when_Axi4Crossbar_l450_1) begin
      if(when_Axi4Crossbar_l453_1) begin
        if(when_Axi4Crossbar_l459_1) begin
          io_masters_0_wready = io_slaves_1_wready;
        end
      end
    end
    if(when_Axi4Crossbar_l480_1) begin
      if(when_Axi4Crossbar_l482_1) begin
        io_masters_0_wready = io_slaves_1_wready;
      end
    end
    if(when_Axi4Crossbar_l450_2) begin
      if(when_Axi4Crossbar_l453_2) begin
        if(when_Axi4Crossbar_l459_2) begin
          io_masters_0_wready = io_slaves_2_wready;
        end
      end
    end
    if(when_Axi4Crossbar_l480_2) begin
      if(when_Axi4Crossbar_l482_2) begin
        io_masters_0_wready = io_slaves_2_wready;
      end
    end
    if(when_Axi4Crossbar_l450_3) begin
      if(when_Axi4Crossbar_l453_3) begin
        if(when_Axi4Crossbar_l459_3) begin
          io_masters_0_wready = io_slaves_3_wready;
        end
      end
    end
    if(when_Axi4Crossbar_l480_3) begin
      if(when_Axi4Crossbar_l482_3) begin
        io_masters_0_wready = io_slaves_3_wready;
      end
    end
  end

  always @(*) begin
    io_masters_0_bvalid = 1'b0;
    if(when_Axi4Crossbar_l534) begin
      io_masters_0_bvalid = 1'b1;
    end
    if(when_Axi4Crossbar_l534_1) begin
      io_masters_0_bvalid = 1'b1;
    end
    if(when_Axi4Crossbar_l534_2) begin
      io_masters_0_bvalid = 1'b1;
    end
    if(when_Axi4Crossbar_l534_3) begin
      io_masters_0_bvalid = 1'b1;
    end
  end

  assign _zz_io_masters_0_bid = 3'b000;
  always @(*) begin
    io_masters_0_bid = _zz_io_masters_0_bid[0 : 0];
    if(when_Axi4Crossbar_l534) begin
      io_masters_0_bid = io_slaves_0_bid[0 : 0];
    end
    if(when_Axi4Crossbar_l534_1) begin
      io_masters_0_bid = io_slaves_1_bid[0 : 0];
    end
    if(when_Axi4Crossbar_l534_2) begin
      io_masters_0_bid = io_slaves_2_bid[0 : 0];
    end
    if(when_Axi4Crossbar_l534_3) begin
      io_masters_0_bid = io_slaves_3_bid[0 : 0];
    end
  end

  always @(*) begin
    io_masters_0_bresp = _zz_io_masters_0_bid[2 : 1];
    if(when_Axi4Crossbar_l534) begin
      io_masters_0_bresp = io_slaves_0_bresp;
    end
    if(when_Axi4Crossbar_l534_1) begin
      io_masters_0_bresp = io_slaves_1_bresp;
    end
    if(when_Axi4Crossbar_l534_2) begin
      io_masters_0_bresp = io_slaves_2_bresp;
    end
    if(when_Axi4Crossbar_l534_3) begin
      io_masters_0_bresp = io_slaves_3_bresp;
    end
  end

  always @(*) begin
    io_masters_0_arready = 1'b0;
    if(when_Axi4Crossbar_l563) begin
      if(when_Axi4Crossbar_l566) begin
        io_masters_0_arready = io_slaves_0_arready;
      end
    end
    if(when_Axi4Crossbar_l563_1) begin
      if(when_Axi4Crossbar_l566_1) begin
        io_masters_0_arready = io_slaves_1_arready;
      end
    end
    if(when_Axi4Crossbar_l563_2) begin
      if(when_Axi4Crossbar_l566_2) begin
        io_masters_0_arready = io_slaves_2_arready;
      end
    end
    if(when_Axi4Crossbar_l563_3) begin
      if(when_Axi4Crossbar_l566_3) begin
        io_masters_0_arready = io_slaves_3_arready;
      end
    end
  end

  always @(*) begin
    io_masters_0_rvalid = 1'b0;
    if(when_Axi4Crossbar_l604) begin
      io_masters_0_rvalid = 1'b1;
    end
    if(when_Axi4Crossbar_l604_1) begin
      io_masters_0_rvalid = 1'b1;
    end
    if(when_Axi4Crossbar_l604_2) begin
      io_masters_0_rvalid = 1'b1;
    end
    if(when_Axi4Crossbar_l604_3) begin
      io_masters_0_rvalid = 1'b1;
    end
  end

  assign _zz_io_masters_0_rdata = 36'h000000000;
  always @(*) begin
    io_masters_0_rdata = _zz_io_masters_0_rdata[31 : 0];
    if(when_Axi4Crossbar_l604) begin
      io_masters_0_rdata = io_slaves_0_rdata;
    end
    if(when_Axi4Crossbar_l604_1) begin
      io_masters_0_rdata = io_slaves_1_rdata;
    end
    if(when_Axi4Crossbar_l604_2) begin
      io_masters_0_rdata = io_slaves_2_rdata;
    end
    if(when_Axi4Crossbar_l604_3) begin
      io_masters_0_rdata = io_slaves_3_rdata;
    end
  end

  always @(*) begin
    io_masters_0_rid = _zz_io_masters_0_rdata[32 : 32];
    if(when_Axi4Crossbar_l604) begin
      io_masters_0_rid = io_slaves_0_rid[0 : 0];
    end
    if(when_Axi4Crossbar_l604_1) begin
      io_masters_0_rid = io_slaves_1_rid[0 : 0];
    end
    if(when_Axi4Crossbar_l604_2) begin
      io_masters_0_rid = io_slaves_2_rid[0 : 0];
    end
    if(when_Axi4Crossbar_l604_3) begin
      io_masters_0_rid = io_slaves_3_rid[0 : 0];
    end
  end

  always @(*) begin
    io_masters_0_rresp = _zz_io_masters_0_rdata[34 : 33];
    if(when_Axi4Crossbar_l604) begin
      io_masters_0_rresp = io_slaves_0_rresp;
    end
    if(when_Axi4Crossbar_l604_1) begin
      io_masters_0_rresp = io_slaves_1_rresp;
    end
    if(when_Axi4Crossbar_l604_2) begin
      io_masters_0_rresp = io_slaves_2_rresp;
    end
    if(when_Axi4Crossbar_l604_3) begin
      io_masters_0_rresp = io_slaves_3_rresp;
    end
  end

  always @(*) begin
    io_masters_0_rlast = _zz_io_masters_0_rdata[35];
    if(when_Axi4Crossbar_l604) begin
      io_masters_0_rlast = io_slaves_0_rlast;
    end
    if(when_Axi4Crossbar_l604_1) begin
      io_masters_0_rlast = io_slaves_1_rlast;
    end
    if(when_Axi4Crossbar_l604_2) begin
      io_masters_0_rlast = io_slaves_2_rlast;
    end
    if(when_Axi4Crossbar_l604_3) begin
      io_masters_0_rlast = io_slaves_3_rlast;
    end
  end

  always @(*) begin
    io_slaves_0_awvalid = 1'b0;
    if(when_Axi4Crossbar_l450) begin
      io_slaves_0_awvalid = 1'b1;
    end
  end

  assign _zz_io_slaves_0_awaddr = 62'h0000000000000000;
  always @(*) begin
    io_slaves_0_awaddr = _zz_io_slaves_0_awaddr[31 : 0];
    if(when_Axi4Crossbar_l450) begin
      if(when_Axi4Crossbar_l453) begin
        io_slaves_0_awaddr = io_masters_0_awaddr;
      end
    end
  end

  always @(*) begin
    io_slaves_0_awid = _zz_io_slaves_0_awaddr[32 : 32];
    if(when_Axi4Crossbar_l450) begin
      if(when_Axi4Crossbar_l453) begin
        io_slaves_0_awid = io_masters_0_awid;
      end
    end
  end

  assign io_slaves_0_awregion = _zz_io_slaves_0_awaddr[36 : 33];
  always @(*) begin
    io_slaves_0_awlen = _zz_io_slaves_0_awaddr[44 : 37];
    if(when_Axi4Crossbar_l450) begin
      if(when_Axi4Crossbar_l453) begin
        io_slaves_0_awlen = io_masters_0_awlen;
      end
    end
  end

  always @(*) begin
    io_slaves_0_awsize = _zz_io_slaves_0_awaddr[47 : 45];
    if(when_Axi4Crossbar_l450) begin
      if(when_Axi4Crossbar_l453) begin
        io_slaves_0_awsize = io_masters_0_awsize;
      end
    end
  end

  always @(*) begin
    io_slaves_0_awburst = _zz_io_slaves_0_awaddr[49 : 48];
    if(when_Axi4Crossbar_l450) begin
      if(when_Axi4Crossbar_l453) begin
        io_slaves_0_awburst = io_masters_0_awburst;
      end
    end
  end

  always @(*) begin
    io_slaves_0_awlock = _zz_io_slaves_0_awaddr[50 : 50];
    if(when_Axi4Crossbar_l450) begin
      if(when_Axi4Crossbar_l453) begin
        io_slaves_0_awlock = io_masters_0_awlock;
      end
    end
  end

  always @(*) begin
    io_slaves_0_awcache = _zz_io_slaves_0_awaddr[54 : 51];
    if(when_Axi4Crossbar_l450) begin
      if(when_Axi4Crossbar_l453) begin
        io_slaves_0_awcache = io_masters_0_awcache;
      end
    end
  end

  always @(*) begin
    io_slaves_0_awqos = _zz_io_slaves_0_awaddr[58 : 55];
    if(when_Axi4Crossbar_l450) begin
      if(when_Axi4Crossbar_l453) begin
        io_slaves_0_awqos = io_masters_0_awqos;
      end
    end
  end

  always @(*) begin
    io_slaves_0_awprot = _zz_io_slaves_0_awaddr[61 : 59];
    if(when_Axi4Crossbar_l450) begin
      if(when_Axi4Crossbar_l453) begin
        io_slaves_0_awprot = io_masters_0_awprot;
      end
    end
  end

  always @(*) begin
    io_slaves_0_wvalid = 1'b0;
    if(when_Axi4Crossbar_l450) begin
      if(when_Axi4Crossbar_l453) begin
        if(when_Axi4Crossbar_l459) begin
          io_slaves_0_wvalid = io_masters_0_wvalid;
        end
      end
    end
    if(when_Axi4Crossbar_l480) begin
      if(when_Axi4Crossbar_l482) begin
        io_slaves_0_wvalid = io_masters_0_wvalid;
      end
    end
  end

  assign _zz_io_slaves_0_wdata = 37'h0000000000;
  always @(*) begin
    io_slaves_0_wdata = _zz_io_slaves_0_wdata[31 : 0];
    if(when_Axi4Crossbar_l450) begin
      if(when_Axi4Crossbar_l453) begin
        if(when_Axi4Crossbar_l459) begin
          io_slaves_0_wdata = io_masters_0_wdata;
        end
      end
    end
    if(when_Axi4Crossbar_l480) begin
      if(when_Axi4Crossbar_l482) begin
        io_slaves_0_wdata = io_masters_0_wdata;
      end
    end
  end

  always @(*) begin
    io_slaves_0_wstrb = _zz_io_slaves_0_wdata[35 : 32];
    if(when_Axi4Crossbar_l450) begin
      if(when_Axi4Crossbar_l453) begin
        if(when_Axi4Crossbar_l459) begin
          io_slaves_0_wstrb = io_masters_0_wstrb;
        end
      end
    end
    if(when_Axi4Crossbar_l480) begin
      if(when_Axi4Crossbar_l482) begin
        io_slaves_0_wstrb = io_masters_0_wstrb;
      end
    end
  end

  always @(*) begin
    io_slaves_0_wlast = _zz_io_slaves_0_wdata[36];
    if(when_Axi4Crossbar_l450) begin
      if(when_Axi4Crossbar_l453) begin
        if(when_Axi4Crossbar_l459) begin
          io_slaves_0_wlast = io_masters_0_wlast;
        end
      end
    end
    if(when_Axi4Crossbar_l480) begin
      if(when_Axi4Crossbar_l482) begin
        io_slaves_0_wlast = io_masters_0_wlast;
      end
    end
  end

  always @(*) begin
    io_slaves_0_bready = 1'b0;
    if(when_Axi4Crossbar_l534) begin
      io_slaves_0_bready = io_masters_0_bready;
    end
  end

  always @(*) begin
    io_slaves_0_arvalid = 1'b0;
    if(when_Axi4Crossbar_l563) begin
      io_slaves_0_arvalid = 1'b1;
    end
  end

  assign _zz_io_slaves_0_araddr = 62'h0000000000000000;
  always @(*) begin
    io_slaves_0_araddr = _zz_io_slaves_0_araddr[31 : 0];
    if(when_Axi4Crossbar_l563) begin
      if(when_Axi4Crossbar_l566) begin
        io_slaves_0_araddr = io_masters_0_araddr;
      end
    end
  end

  always @(*) begin
    io_slaves_0_arid = _zz_io_slaves_0_araddr[32 : 32];
    if(when_Axi4Crossbar_l563) begin
      if(when_Axi4Crossbar_l566) begin
        io_slaves_0_arid = io_masters_0_arid;
      end
    end
  end

  assign io_slaves_0_arregion = _zz_io_slaves_0_araddr[36 : 33];
  always @(*) begin
    io_slaves_0_arlen = _zz_io_slaves_0_araddr[44 : 37];
    if(when_Axi4Crossbar_l563) begin
      if(when_Axi4Crossbar_l566) begin
        io_slaves_0_arlen = io_masters_0_arlen;
      end
    end
  end

  always @(*) begin
    io_slaves_0_arsize = _zz_io_slaves_0_araddr[47 : 45];
    if(when_Axi4Crossbar_l563) begin
      if(when_Axi4Crossbar_l566) begin
        io_slaves_0_arsize = io_masters_0_arsize;
      end
    end
  end

  always @(*) begin
    io_slaves_0_arburst = _zz_io_slaves_0_araddr[49 : 48];
    if(when_Axi4Crossbar_l563) begin
      if(when_Axi4Crossbar_l566) begin
        io_slaves_0_arburst = io_masters_0_arburst;
      end
    end
  end

  always @(*) begin
    io_slaves_0_arlock = _zz_io_slaves_0_araddr[50 : 50];
    if(when_Axi4Crossbar_l563) begin
      if(when_Axi4Crossbar_l566) begin
        io_slaves_0_arlock = io_masters_0_arlock;
      end
    end
  end

  always @(*) begin
    io_slaves_0_arcache = _zz_io_slaves_0_araddr[54 : 51];
    if(when_Axi4Crossbar_l563) begin
      if(when_Axi4Crossbar_l566) begin
        io_slaves_0_arcache = io_masters_0_arcache;
      end
    end
  end

  always @(*) begin
    io_slaves_0_arqos = _zz_io_slaves_0_araddr[58 : 55];
    if(when_Axi4Crossbar_l563) begin
      if(when_Axi4Crossbar_l566) begin
        io_slaves_0_arqos = io_masters_0_arqos;
      end
    end
  end

  always @(*) begin
    io_slaves_0_arprot = _zz_io_slaves_0_araddr[61 : 59];
    if(when_Axi4Crossbar_l563) begin
      if(when_Axi4Crossbar_l566) begin
        io_slaves_0_arprot = io_masters_0_arprot;
      end
    end
  end

  always @(*) begin
    io_slaves_0_rready = 1'b0;
    if(when_Axi4Crossbar_l604) begin
      io_slaves_0_rready = io_masters_0_rready;
    end
  end

  always @(*) begin
    io_slaves_1_awvalid = 1'b0;
    if(when_Axi4Crossbar_l450_1) begin
      io_slaves_1_awvalid = 1'b1;
    end
  end

  assign _zz_io_slaves_1_awaddr = 62'h0000000000000000;
  always @(*) begin
    io_slaves_1_awaddr = _zz_io_slaves_1_awaddr[31 : 0];
    if(when_Axi4Crossbar_l450_1) begin
      if(when_Axi4Crossbar_l453_1) begin
        io_slaves_1_awaddr = io_masters_0_awaddr;
      end
    end
  end

  always @(*) begin
    io_slaves_1_awid = _zz_io_slaves_1_awaddr[32 : 32];
    if(when_Axi4Crossbar_l450_1) begin
      if(when_Axi4Crossbar_l453_1) begin
        io_slaves_1_awid = io_masters_0_awid;
      end
    end
  end

  assign io_slaves_1_awregion = _zz_io_slaves_1_awaddr[36 : 33];
  always @(*) begin
    io_slaves_1_awlen = _zz_io_slaves_1_awaddr[44 : 37];
    if(when_Axi4Crossbar_l450_1) begin
      if(when_Axi4Crossbar_l453_1) begin
        io_slaves_1_awlen = io_masters_0_awlen;
      end
    end
  end

  always @(*) begin
    io_slaves_1_awsize = _zz_io_slaves_1_awaddr[47 : 45];
    if(when_Axi4Crossbar_l450_1) begin
      if(when_Axi4Crossbar_l453_1) begin
        io_slaves_1_awsize = io_masters_0_awsize;
      end
    end
  end

  always @(*) begin
    io_slaves_1_awburst = _zz_io_slaves_1_awaddr[49 : 48];
    if(when_Axi4Crossbar_l450_1) begin
      if(when_Axi4Crossbar_l453_1) begin
        io_slaves_1_awburst = io_masters_0_awburst;
      end
    end
  end

  always @(*) begin
    io_slaves_1_awlock = _zz_io_slaves_1_awaddr[50 : 50];
    if(when_Axi4Crossbar_l450_1) begin
      if(when_Axi4Crossbar_l453_1) begin
        io_slaves_1_awlock = io_masters_0_awlock;
      end
    end
  end

  always @(*) begin
    io_slaves_1_awcache = _zz_io_slaves_1_awaddr[54 : 51];
    if(when_Axi4Crossbar_l450_1) begin
      if(when_Axi4Crossbar_l453_1) begin
        io_slaves_1_awcache = io_masters_0_awcache;
      end
    end
  end

  always @(*) begin
    io_slaves_1_awqos = _zz_io_slaves_1_awaddr[58 : 55];
    if(when_Axi4Crossbar_l450_1) begin
      if(when_Axi4Crossbar_l453_1) begin
        io_slaves_1_awqos = io_masters_0_awqos;
      end
    end
  end

  always @(*) begin
    io_slaves_1_awprot = _zz_io_slaves_1_awaddr[61 : 59];
    if(when_Axi4Crossbar_l450_1) begin
      if(when_Axi4Crossbar_l453_1) begin
        io_slaves_1_awprot = io_masters_0_awprot;
      end
    end
  end

  always @(*) begin
    io_slaves_1_wvalid = 1'b0;
    if(when_Axi4Crossbar_l450_1) begin
      if(when_Axi4Crossbar_l453_1) begin
        if(when_Axi4Crossbar_l459_1) begin
          io_slaves_1_wvalid = io_masters_0_wvalid;
        end
      end
    end
    if(when_Axi4Crossbar_l480_1) begin
      if(when_Axi4Crossbar_l482_1) begin
        io_slaves_1_wvalid = io_masters_0_wvalid;
      end
    end
  end

  assign _zz_io_slaves_1_wdata = 37'h0000000000;
  always @(*) begin
    io_slaves_1_wdata = _zz_io_slaves_1_wdata[31 : 0];
    if(when_Axi4Crossbar_l450_1) begin
      if(when_Axi4Crossbar_l453_1) begin
        if(when_Axi4Crossbar_l459_1) begin
          io_slaves_1_wdata = io_masters_0_wdata;
        end
      end
    end
    if(when_Axi4Crossbar_l480_1) begin
      if(when_Axi4Crossbar_l482_1) begin
        io_slaves_1_wdata = io_masters_0_wdata;
      end
    end
  end

  always @(*) begin
    io_slaves_1_wstrb = _zz_io_slaves_1_wdata[35 : 32];
    if(when_Axi4Crossbar_l450_1) begin
      if(when_Axi4Crossbar_l453_1) begin
        if(when_Axi4Crossbar_l459_1) begin
          io_slaves_1_wstrb = io_masters_0_wstrb;
        end
      end
    end
    if(when_Axi4Crossbar_l480_1) begin
      if(when_Axi4Crossbar_l482_1) begin
        io_slaves_1_wstrb = io_masters_0_wstrb;
      end
    end
  end

  always @(*) begin
    io_slaves_1_wlast = _zz_io_slaves_1_wdata[36];
    if(when_Axi4Crossbar_l450_1) begin
      if(when_Axi4Crossbar_l453_1) begin
        if(when_Axi4Crossbar_l459_1) begin
          io_slaves_1_wlast = io_masters_0_wlast;
        end
      end
    end
    if(when_Axi4Crossbar_l480_1) begin
      if(when_Axi4Crossbar_l482_1) begin
        io_slaves_1_wlast = io_masters_0_wlast;
      end
    end
  end

  always @(*) begin
    io_slaves_1_bready = 1'b0;
    if(when_Axi4Crossbar_l534_1) begin
      io_slaves_1_bready = io_masters_0_bready;
    end
  end

  always @(*) begin
    io_slaves_1_arvalid = 1'b0;
    if(when_Axi4Crossbar_l563_1) begin
      io_slaves_1_arvalid = 1'b1;
    end
  end

  assign _zz_io_slaves_1_araddr = 62'h0000000000000000;
  always @(*) begin
    io_slaves_1_araddr = _zz_io_slaves_1_araddr[31 : 0];
    if(when_Axi4Crossbar_l563_1) begin
      if(when_Axi4Crossbar_l566_1) begin
        io_slaves_1_araddr = io_masters_0_araddr;
      end
    end
  end

  always @(*) begin
    io_slaves_1_arid = _zz_io_slaves_1_araddr[32 : 32];
    if(when_Axi4Crossbar_l563_1) begin
      if(when_Axi4Crossbar_l566_1) begin
        io_slaves_1_arid = io_masters_0_arid;
      end
    end
  end

  assign io_slaves_1_arregion = _zz_io_slaves_1_araddr[36 : 33];
  always @(*) begin
    io_slaves_1_arlen = _zz_io_slaves_1_araddr[44 : 37];
    if(when_Axi4Crossbar_l563_1) begin
      if(when_Axi4Crossbar_l566_1) begin
        io_slaves_1_arlen = io_masters_0_arlen;
      end
    end
  end

  always @(*) begin
    io_slaves_1_arsize = _zz_io_slaves_1_araddr[47 : 45];
    if(when_Axi4Crossbar_l563_1) begin
      if(when_Axi4Crossbar_l566_1) begin
        io_slaves_1_arsize = io_masters_0_arsize;
      end
    end
  end

  always @(*) begin
    io_slaves_1_arburst = _zz_io_slaves_1_araddr[49 : 48];
    if(when_Axi4Crossbar_l563_1) begin
      if(when_Axi4Crossbar_l566_1) begin
        io_slaves_1_arburst = io_masters_0_arburst;
      end
    end
  end

  always @(*) begin
    io_slaves_1_arlock = _zz_io_slaves_1_araddr[50 : 50];
    if(when_Axi4Crossbar_l563_1) begin
      if(when_Axi4Crossbar_l566_1) begin
        io_slaves_1_arlock = io_masters_0_arlock;
      end
    end
  end

  always @(*) begin
    io_slaves_1_arcache = _zz_io_slaves_1_araddr[54 : 51];
    if(when_Axi4Crossbar_l563_1) begin
      if(when_Axi4Crossbar_l566_1) begin
        io_slaves_1_arcache = io_masters_0_arcache;
      end
    end
  end

  always @(*) begin
    io_slaves_1_arqos = _zz_io_slaves_1_araddr[58 : 55];
    if(when_Axi4Crossbar_l563_1) begin
      if(when_Axi4Crossbar_l566_1) begin
        io_slaves_1_arqos = io_masters_0_arqos;
      end
    end
  end

  always @(*) begin
    io_slaves_1_arprot = _zz_io_slaves_1_araddr[61 : 59];
    if(when_Axi4Crossbar_l563_1) begin
      if(when_Axi4Crossbar_l566_1) begin
        io_slaves_1_arprot = io_masters_0_arprot;
      end
    end
  end

  always @(*) begin
    io_slaves_1_rready = 1'b0;
    if(when_Axi4Crossbar_l604_1) begin
      io_slaves_1_rready = io_masters_0_rready;
    end
  end

  always @(*) begin
    io_slaves_2_awvalid = 1'b0;
    if(when_Axi4Crossbar_l450_2) begin
      io_slaves_2_awvalid = 1'b1;
    end
  end

  assign _zz_io_slaves_2_awaddr = 62'h0000000000000000;
  always @(*) begin
    io_slaves_2_awaddr = _zz_io_slaves_2_awaddr[31 : 0];
    if(when_Axi4Crossbar_l450_2) begin
      if(when_Axi4Crossbar_l453_2) begin
        io_slaves_2_awaddr = io_masters_0_awaddr;
      end
    end
  end

  always @(*) begin
    io_slaves_2_awid = _zz_io_slaves_2_awaddr[32 : 32];
    if(when_Axi4Crossbar_l450_2) begin
      if(when_Axi4Crossbar_l453_2) begin
        io_slaves_2_awid = io_masters_0_awid;
      end
    end
  end

  assign io_slaves_2_awregion = _zz_io_slaves_2_awaddr[36 : 33];
  always @(*) begin
    io_slaves_2_awlen = _zz_io_slaves_2_awaddr[44 : 37];
    if(when_Axi4Crossbar_l450_2) begin
      if(when_Axi4Crossbar_l453_2) begin
        io_slaves_2_awlen = io_masters_0_awlen;
      end
    end
  end

  always @(*) begin
    io_slaves_2_awsize = _zz_io_slaves_2_awaddr[47 : 45];
    if(when_Axi4Crossbar_l450_2) begin
      if(when_Axi4Crossbar_l453_2) begin
        io_slaves_2_awsize = io_masters_0_awsize;
      end
    end
  end

  always @(*) begin
    io_slaves_2_awburst = _zz_io_slaves_2_awaddr[49 : 48];
    if(when_Axi4Crossbar_l450_2) begin
      if(when_Axi4Crossbar_l453_2) begin
        io_slaves_2_awburst = io_masters_0_awburst;
      end
    end
  end

  always @(*) begin
    io_slaves_2_awlock = _zz_io_slaves_2_awaddr[50 : 50];
    if(when_Axi4Crossbar_l450_2) begin
      if(when_Axi4Crossbar_l453_2) begin
        io_slaves_2_awlock = io_masters_0_awlock;
      end
    end
  end

  always @(*) begin
    io_slaves_2_awcache = _zz_io_slaves_2_awaddr[54 : 51];
    if(when_Axi4Crossbar_l450_2) begin
      if(when_Axi4Crossbar_l453_2) begin
        io_slaves_2_awcache = io_masters_0_awcache;
      end
    end
  end

  always @(*) begin
    io_slaves_2_awqos = _zz_io_slaves_2_awaddr[58 : 55];
    if(when_Axi4Crossbar_l450_2) begin
      if(when_Axi4Crossbar_l453_2) begin
        io_slaves_2_awqos = io_masters_0_awqos;
      end
    end
  end

  always @(*) begin
    io_slaves_2_awprot = _zz_io_slaves_2_awaddr[61 : 59];
    if(when_Axi4Crossbar_l450_2) begin
      if(when_Axi4Crossbar_l453_2) begin
        io_slaves_2_awprot = io_masters_0_awprot;
      end
    end
  end

  always @(*) begin
    io_slaves_2_wvalid = 1'b0;
    if(when_Axi4Crossbar_l450_2) begin
      if(when_Axi4Crossbar_l453_2) begin
        if(when_Axi4Crossbar_l459_2) begin
          io_slaves_2_wvalid = io_masters_0_wvalid;
        end
      end
    end
    if(when_Axi4Crossbar_l480_2) begin
      if(when_Axi4Crossbar_l482_2) begin
        io_slaves_2_wvalid = io_masters_0_wvalid;
      end
    end
  end

  assign _zz_io_slaves_2_wdata = 37'h0000000000;
  always @(*) begin
    io_slaves_2_wdata = _zz_io_slaves_2_wdata[31 : 0];
    if(when_Axi4Crossbar_l450_2) begin
      if(when_Axi4Crossbar_l453_2) begin
        if(when_Axi4Crossbar_l459_2) begin
          io_slaves_2_wdata = io_masters_0_wdata;
        end
      end
    end
    if(when_Axi4Crossbar_l480_2) begin
      if(when_Axi4Crossbar_l482_2) begin
        io_slaves_2_wdata = io_masters_0_wdata;
      end
    end
  end

  always @(*) begin
    io_slaves_2_wstrb = _zz_io_slaves_2_wdata[35 : 32];
    if(when_Axi4Crossbar_l450_2) begin
      if(when_Axi4Crossbar_l453_2) begin
        if(when_Axi4Crossbar_l459_2) begin
          io_slaves_2_wstrb = io_masters_0_wstrb;
        end
      end
    end
    if(when_Axi4Crossbar_l480_2) begin
      if(when_Axi4Crossbar_l482_2) begin
        io_slaves_2_wstrb = io_masters_0_wstrb;
      end
    end
  end

  always @(*) begin
    io_slaves_2_wlast = _zz_io_slaves_2_wdata[36];
    if(when_Axi4Crossbar_l450_2) begin
      if(when_Axi4Crossbar_l453_2) begin
        if(when_Axi4Crossbar_l459_2) begin
          io_slaves_2_wlast = io_masters_0_wlast;
        end
      end
    end
    if(when_Axi4Crossbar_l480_2) begin
      if(when_Axi4Crossbar_l482_2) begin
        io_slaves_2_wlast = io_masters_0_wlast;
      end
    end
  end

  always @(*) begin
    io_slaves_2_bready = 1'b0;
    if(when_Axi4Crossbar_l534_2) begin
      io_slaves_2_bready = io_masters_0_bready;
    end
  end

  always @(*) begin
    io_slaves_2_arvalid = 1'b0;
    if(when_Axi4Crossbar_l563_2) begin
      io_slaves_2_arvalid = 1'b1;
    end
  end

  assign _zz_io_slaves_2_araddr = 62'h0000000000000000;
  always @(*) begin
    io_slaves_2_araddr = _zz_io_slaves_2_araddr[31 : 0];
    if(when_Axi4Crossbar_l563_2) begin
      if(when_Axi4Crossbar_l566_2) begin
        io_slaves_2_araddr = io_masters_0_araddr;
      end
    end
  end

  always @(*) begin
    io_slaves_2_arid = _zz_io_slaves_2_araddr[32 : 32];
    if(when_Axi4Crossbar_l563_2) begin
      if(when_Axi4Crossbar_l566_2) begin
        io_slaves_2_arid = io_masters_0_arid;
      end
    end
  end

  assign io_slaves_2_arregion = _zz_io_slaves_2_araddr[36 : 33];
  always @(*) begin
    io_slaves_2_arlen = _zz_io_slaves_2_araddr[44 : 37];
    if(when_Axi4Crossbar_l563_2) begin
      if(when_Axi4Crossbar_l566_2) begin
        io_slaves_2_arlen = io_masters_0_arlen;
      end
    end
  end

  always @(*) begin
    io_slaves_2_arsize = _zz_io_slaves_2_araddr[47 : 45];
    if(when_Axi4Crossbar_l563_2) begin
      if(when_Axi4Crossbar_l566_2) begin
        io_slaves_2_arsize = io_masters_0_arsize;
      end
    end
  end

  always @(*) begin
    io_slaves_2_arburst = _zz_io_slaves_2_araddr[49 : 48];
    if(when_Axi4Crossbar_l563_2) begin
      if(when_Axi4Crossbar_l566_2) begin
        io_slaves_2_arburst = io_masters_0_arburst;
      end
    end
  end

  always @(*) begin
    io_slaves_2_arlock = _zz_io_slaves_2_araddr[50 : 50];
    if(when_Axi4Crossbar_l563_2) begin
      if(when_Axi4Crossbar_l566_2) begin
        io_slaves_2_arlock = io_masters_0_arlock;
      end
    end
  end

  always @(*) begin
    io_slaves_2_arcache = _zz_io_slaves_2_araddr[54 : 51];
    if(when_Axi4Crossbar_l563_2) begin
      if(when_Axi4Crossbar_l566_2) begin
        io_slaves_2_arcache = io_masters_0_arcache;
      end
    end
  end

  always @(*) begin
    io_slaves_2_arqos = _zz_io_slaves_2_araddr[58 : 55];
    if(when_Axi4Crossbar_l563_2) begin
      if(when_Axi4Crossbar_l566_2) begin
        io_slaves_2_arqos = io_masters_0_arqos;
      end
    end
  end

  always @(*) begin
    io_slaves_2_arprot = _zz_io_slaves_2_araddr[61 : 59];
    if(when_Axi4Crossbar_l563_2) begin
      if(when_Axi4Crossbar_l566_2) begin
        io_slaves_2_arprot = io_masters_0_arprot;
      end
    end
  end

  always @(*) begin
    io_slaves_2_rready = 1'b0;
    if(when_Axi4Crossbar_l604_2) begin
      io_slaves_2_rready = io_masters_0_rready;
    end
  end

  always @(*) begin
    io_slaves_3_awvalid = 1'b0;
    if(when_Axi4Crossbar_l450_3) begin
      io_slaves_3_awvalid = 1'b1;
    end
  end

  assign _zz_io_slaves_3_awaddr = 62'h0000000000000000;
  always @(*) begin
    io_slaves_3_awaddr = _zz_io_slaves_3_awaddr[31 : 0];
    if(when_Axi4Crossbar_l450_3) begin
      if(when_Axi4Crossbar_l453_3) begin
        io_slaves_3_awaddr = io_masters_0_awaddr;
      end
    end
  end

  always @(*) begin
    io_slaves_3_awid = _zz_io_slaves_3_awaddr[32 : 32];
    if(when_Axi4Crossbar_l450_3) begin
      if(when_Axi4Crossbar_l453_3) begin
        io_slaves_3_awid = io_masters_0_awid;
      end
    end
  end

  assign io_slaves_3_awregion = _zz_io_slaves_3_awaddr[36 : 33];
  always @(*) begin
    io_slaves_3_awlen = _zz_io_slaves_3_awaddr[44 : 37];
    if(when_Axi4Crossbar_l450_3) begin
      if(when_Axi4Crossbar_l453_3) begin
        io_slaves_3_awlen = io_masters_0_awlen;
      end
    end
  end

  always @(*) begin
    io_slaves_3_awsize = _zz_io_slaves_3_awaddr[47 : 45];
    if(when_Axi4Crossbar_l450_3) begin
      if(when_Axi4Crossbar_l453_3) begin
        io_slaves_3_awsize = io_masters_0_awsize;
      end
    end
  end

  always @(*) begin
    io_slaves_3_awburst = _zz_io_slaves_3_awaddr[49 : 48];
    if(when_Axi4Crossbar_l450_3) begin
      if(when_Axi4Crossbar_l453_3) begin
        io_slaves_3_awburst = io_masters_0_awburst;
      end
    end
  end

  always @(*) begin
    io_slaves_3_awlock = _zz_io_slaves_3_awaddr[50 : 50];
    if(when_Axi4Crossbar_l450_3) begin
      if(when_Axi4Crossbar_l453_3) begin
        io_slaves_3_awlock = io_masters_0_awlock;
      end
    end
  end

  always @(*) begin
    io_slaves_3_awcache = _zz_io_slaves_3_awaddr[54 : 51];
    if(when_Axi4Crossbar_l450_3) begin
      if(when_Axi4Crossbar_l453_3) begin
        io_slaves_3_awcache = io_masters_0_awcache;
      end
    end
  end

  always @(*) begin
    io_slaves_3_awqos = _zz_io_slaves_3_awaddr[58 : 55];
    if(when_Axi4Crossbar_l450_3) begin
      if(when_Axi4Crossbar_l453_3) begin
        io_slaves_3_awqos = io_masters_0_awqos;
      end
    end
  end

  always @(*) begin
    io_slaves_3_awprot = _zz_io_slaves_3_awaddr[61 : 59];
    if(when_Axi4Crossbar_l450_3) begin
      if(when_Axi4Crossbar_l453_3) begin
        io_slaves_3_awprot = io_masters_0_awprot;
      end
    end
  end

  always @(*) begin
    io_slaves_3_wvalid = 1'b0;
    if(when_Axi4Crossbar_l450_3) begin
      if(when_Axi4Crossbar_l453_3) begin
        if(when_Axi4Crossbar_l459_3) begin
          io_slaves_3_wvalid = io_masters_0_wvalid;
        end
      end
    end
    if(when_Axi4Crossbar_l480_3) begin
      if(when_Axi4Crossbar_l482_3) begin
        io_slaves_3_wvalid = io_masters_0_wvalid;
      end
    end
  end

  assign _zz_io_slaves_3_wdata = 37'h0000000000;
  always @(*) begin
    io_slaves_3_wdata = _zz_io_slaves_3_wdata[31 : 0];
    if(when_Axi4Crossbar_l450_3) begin
      if(when_Axi4Crossbar_l453_3) begin
        if(when_Axi4Crossbar_l459_3) begin
          io_slaves_3_wdata = io_masters_0_wdata;
        end
      end
    end
    if(when_Axi4Crossbar_l480_3) begin
      if(when_Axi4Crossbar_l482_3) begin
        io_slaves_3_wdata = io_masters_0_wdata;
      end
    end
  end

  always @(*) begin
    io_slaves_3_wstrb = _zz_io_slaves_3_wdata[35 : 32];
    if(when_Axi4Crossbar_l450_3) begin
      if(when_Axi4Crossbar_l453_3) begin
        if(when_Axi4Crossbar_l459_3) begin
          io_slaves_3_wstrb = io_masters_0_wstrb;
        end
      end
    end
    if(when_Axi4Crossbar_l480_3) begin
      if(when_Axi4Crossbar_l482_3) begin
        io_slaves_3_wstrb = io_masters_0_wstrb;
      end
    end
  end

  always @(*) begin
    io_slaves_3_wlast = _zz_io_slaves_3_wdata[36];
    if(when_Axi4Crossbar_l450_3) begin
      if(when_Axi4Crossbar_l453_3) begin
        if(when_Axi4Crossbar_l459_3) begin
          io_slaves_3_wlast = io_masters_0_wlast;
        end
      end
    end
    if(when_Axi4Crossbar_l480_3) begin
      if(when_Axi4Crossbar_l482_3) begin
        io_slaves_3_wlast = io_masters_0_wlast;
      end
    end
  end

  always @(*) begin
    io_slaves_3_bready = 1'b0;
    if(when_Axi4Crossbar_l534_3) begin
      io_slaves_3_bready = io_masters_0_bready;
    end
  end

  always @(*) begin
    io_slaves_3_arvalid = 1'b0;
    if(when_Axi4Crossbar_l563_3) begin
      io_slaves_3_arvalid = 1'b1;
    end
  end

  assign _zz_io_slaves_3_araddr = 62'h0000000000000000;
  always @(*) begin
    io_slaves_3_araddr = _zz_io_slaves_3_araddr[31 : 0];
    if(when_Axi4Crossbar_l563_3) begin
      if(when_Axi4Crossbar_l566_3) begin
        io_slaves_3_araddr = io_masters_0_araddr;
      end
    end
  end

  always @(*) begin
    io_slaves_3_arid = _zz_io_slaves_3_araddr[32 : 32];
    if(when_Axi4Crossbar_l563_3) begin
      if(when_Axi4Crossbar_l566_3) begin
        io_slaves_3_arid = io_masters_0_arid;
      end
    end
  end

  assign io_slaves_3_arregion = _zz_io_slaves_3_araddr[36 : 33];
  always @(*) begin
    io_slaves_3_arlen = _zz_io_slaves_3_araddr[44 : 37];
    if(when_Axi4Crossbar_l563_3) begin
      if(when_Axi4Crossbar_l566_3) begin
        io_slaves_3_arlen = io_masters_0_arlen;
      end
    end
  end

  always @(*) begin
    io_slaves_3_arsize = _zz_io_slaves_3_araddr[47 : 45];
    if(when_Axi4Crossbar_l563_3) begin
      if(when_Axi4Crossbar_l566_3) begin
        io_slaves_3_arsize = io_masters_0_arsize;
      end
    end
  end

  always @(*) begin
    io_slaves_3_arburst = _zz_io_slaves_3_araddr[49 : 48];
    if(when_Axi4Crossbar_l563_3) begin
      if(when_Axi4Crossbar_l566_3) begin
        io_slaves_3_arburst = io_masters_0_arburst;
      end
    end
  end

  always @(*) begin
    io_slaves_3_arlock = _zz_io_slaves_3_araddr[50 : 50];
    if(when_Axi4Crossbar_l563_3) begin
      if(when_Axi4Crossbar_l566_3) begin
        io_slaves_3_arlock = io_masters_0_arlock;
      end
    end
  end

  always @(*) begin
    io_slaves_3_arcache = _zz_io_slaves_3_araddr[54 : 51];
    if(when_Axi4Crossbar_l563_3) begin
      if(when_Axi4Crossbar_l566_3) begin
        io_slaves_3_arcache = io_masters_0_arcache;
      end
    end
  end

  always @(*) begin
    io_slaves_3_arqos = _zz_io_slaves_3_araddr[58 : 55];
    if(when_Axi4Crossbar_l563_3) begin
      if(when_Axi4Crossbar_l566_3) begin
        io_slaves_3_arqos = io_masters_0_arqos;
      end
    end
  end

  always @(*) begin
    io_slaves_3_arprot = _zz_io_slaves_3_araddr[61 : 59];
    if(when_Axi4Crossbar_l563_3) begin
      if(when_Axi4Crossbar_l566_3) begin
        io_slaves_3_arprot = io_masters_0_arprot;
      end
    end
  end

  always @(*) begin
    io_slaves_3_rready = 1'b0;
    if(when_Axi4Crossbar_l604_3) begin
      io_slaves_3_rready = io_masters_0_rready;
    end
  end

  always @(*) begin
    _zz_when_Axi4Crossbar_l450_5[0] = ((32'hc0000000 <= io_masters_0_awaddr) && (io_masters_0_awaddr < 32'hc0010000));
    _zz_when_Axi4Crossbar_l450_5[1] = ((32'hc0010000 <= io_masters_0_awaddr) && (io_masters_0_awaddr < 32'hc0020000));
    _zz_when_Axi4Crossbar_l450_5[2] = ((32'hc0020000 <= io_masters_0_awaddr) && (io_masters_0_awaddr < 32'hc0021000));
    _zz_when_Axi4Crossbar_l450_5[3] = ((32'hc0030000 <= io_masters_0_awaddr) && (io_masters_0_awaddr < 32'hc0031000));
  end

  assign _zz_when_Axi4Crossbar_l450_4[0] = (io_masters_0_awvalid && _zz_when_Axi4Crossbar_l450_5[0]);
  assign _zz_when_Axi4Crossbar_l161[0] = (wrRrPtr_0 <= 1'b0);
  assign _zz_when_Axi4Crossbar_l161_1 = (_zz_when_Axi4Crossbar_l450_4 & _zz_when_Axi4Crossbar_l161);
  assign _zz_when_Axi4Crossbar_l161_2 = _zz_when_Axi4Crossbar_l161_1;
  assign _zz_when_Axi4Crossbar_l161_3 = _zz_when_Axi4Crossbar_l450_4;
  always @(*) begin
    _zz_wrRrPtr_0 = 1'b0;
    if(when_Axi4Crossbar_l161) begin
      _zz_wrRrPtr_0 = 1'b0;
    end
  end

  assign when_Axi4Crossbar_l161 = _zz_when_Axi4Crossbar_l161_32[0];
  assign when_Axi4Crossbar_l459 = (_zz_when_Axi4Crossbar_l459 == 3'b000);
  assign when_Axi4Crossbar_l450 = ((_zz_when_Axi4Crossbar_l450 < 3'b100) && (|_zz_when_Axi4Crossbar_l450_4));
  assign when_Axi4Crossbar_l453 = (_zz_wrRrPtr_0 == 1'b0);
  assign io_slaves_0_aw_fire = (io_slaves_0_awvalid && io_slaves_0_awready);
  assign when_Axi4Crossbar_l480 = (! when_Axi4Crossbar_l459);
  assign when_Axi4Crossbar_l482 = (_zz__zz_5_port0 == 1'b0);
  assign io_slaves_0_w_fire = (io_slaves_0_wvalid && io_slaves_0_wready);
  assign when_Axi4Crossbar_l497 = (io_slaves_0_w_fire && io_slaves_0_wlast);
  assign when_Axi4Crossbar_l503 = (io_slaves_0_aw_fire && (! when_Axi4Crossbar_l497));
  assign when_Axi4Crossbar_l505 = ((! io_slaves_0_aw_fire) && when_Axi4Crossbar_l497);
  assign io_slaves_0_b_fire = (io_slaves_0_bvalid && io_slaves_0_bready);
  assign when_Axi4Crossbar_l512 = (io_slaves_0_aw_fire && (! io_slaves_0_b_fire));
  assign when_Axi4Crossbar_l514 = ((! io_slaves_0_aw_fire) && io_slaves_0_b_fire);
  always @(*) begin
    _zz_when_Axi4Crossbar_l450_7[0] = ((32'hc0000000 <= io_masters_0_awaddr) && (io_masters_0_awaddr < 32'hc0010000));
    _zz_when_Axi4Crossbar_l450_7[1] = ((32'hc0010000 <= io_masters_0_awaddr) && (io_masters_0_awaddr < 32'hc0020000));
    _zz_when_Axi4Crossbar_l450_7[2] = ((32'hc0020000 <= io_masters_0_awaddr) && (io_masters_0_awaddr < 32'hc0021000));
    _zz_when_Axi4Crossbar_l450_7[3] = ((32'hc0030000 <= io_masters_0_awaddr) && (io_masters_0_awaddr < 32'hc0031000));
  end

  assign _zz_when_Axi4Crossbar_l450_6[0] = (io_masters_0_awvalid && _zz_when_Axi4Crossbar_l450_7[1]);
  assign _zz_when_Axi4Crossbar_l161_4[0] = (wrRrPtr_1 <= 1'b0);
  assign _zz_when_Axi4Crossbar_l161_5 = (_zz_when_Axi4Crossbar_l450_6 & _zz_when_Axi4Crossbar_l161_4);
  assign _zz_when_Axi4Crossbar_l161_6 = _zz_when_Axi4Crossbar_l161_5;
  assign _zz_when_Axi4Crossbar_l161_7 = _zz_when_Axi4Crossbar_l450_6;
  always @(*) begin
    _zz_wrRrPtr_1 = 1'b0;
    if(when_Axi4Crossbar_l161_1) begin
      _zz_wrRrPtr_1 = 1'b0;
    end
  end

  assign when_Axi4Crossbar_l161_1 = _zz_when_Axi4Crossbar_l161_1_1[0];
  assign when_Axi4Crossbar_l459_1 = (_zz_when_Axi4Crossbar_l459_1 == 3'b000);
  assign when_Axi4Crossbar_l450_1 = ((_zz_when_Axi4Crossbar_l450_1 < 3'b100) && (|_zz_when_Axi4Crossbar_l450_6));
  assign when_Axi4Crossbar_l453_1 = (_zz_wrRrPtr_1 == 1'b0);
  assign io_slaves_1_aw_fire = (io_slaves_1_awvalid && io_slaves_1_awready);
  assign when_Axi4Crossbar_l480_1 = (! when_Axi4Crossbar_l459_1);
  assign when_Axi4Crossbar_l482_1 = (_zz__zz_6_port0 == 1'b0);
  assign io_slaves_1_w_fire = (io_slaves_1_wvalid && io_slaves_1_wready);
  assign when_Axi4Crossbar_l497_1 = (io_slaves_1_w_fire && io_slaves_1_wlast);
  assign when_Axi4Crossbar_l503_1 = (io_slaves_1_aw_fire && (! when_Axi4Crossbar_l497_1));
  assign when_Axi4Crossbar_l505_1 = ((! io_slaves_1_aw_fire) && when_Axi4Crossbar_l497_1);
  assign io_slaves_1_b_fire = (io_slaves_1_bvalid && io_slaves_1_bready);
  assign when_Axi4Crossbar_l512_1 = (io_slaves_1_aw_fire && (! io_slaves_1_b_fire));
  assign when_Axi4Crossbar_l514_1 = ((! io_slaves_1_aw_fire) && io_slaves_1_b_fire);
  always @(*) begin
    _zz_when_Axi4Crossbar_l450_9[0] = ((32'hc0000000 <= io_masters_0_awaddr) && (io_masters_0_awaddr < 32'hc0010000));
    _zz_when_Axi4Crossbar_l450_9[1] = ((32'hc0010000 <= io_masters_0_awaddr) && (io_masters_0_awaddr < 32'hc0020000));
    _zz_when_Axi4Crossbar_l450_9[2] = ((32'hc0020000 <= io_masters_0_awaddr) && (io_masters_0_awaddr < 32'hc0021000));
    _zz_when_Axi4Crossbar_l450_9[3] = ((32'hc0030000 <= io_masters_0_awaddr) && (io_masters_0_awaddr < 32'hc0031000));
  end

  assign _zz_when_Axi4Crossbar_l450_8[0] = (io_masters_0_awvalid && _zz_when_Axi4Crossbar_l450_9[2]);
  assign _zz_when_Axi4Crossbar_l161_8[0] = (wrRrPtr_2 <= 1'b0);
  assign _zz_when_Axi4Crossbar_l161_9 = (_zz_when_Axi4Crossbar_l450_8 & _zz_when_Axi4Crossbar_l161_8);
  assign _zz_when_Axi4Crossbar_l161_10 = _zz_when_Axi4Crossbar_l161_9;
  assign _zz_when_Axi4Crossbar_l161_11 = _zz_when_Axi4Crossbar_l450_8;
  always @(*) begin
    _zz_wrRrPtr_2 = 1'b0;
    if(when_Axi4Crossbar_l161_2) begin
      _zz_wrRrPtr_2 = 1'b0;
    end
  end

  assign when_Axi4Crossbar_l161_2 = _zz_when_Axi4Crossbar_l161_2_1[0];
  assign when_Axi4Crossbar_l459_2 = (_zz_when_Axi4Crossbar_l459_2 == 3'b000);
  assign when_Axi4Crossbar_l450_2 = ((_zz_when_Axi4Crossbar_l450_2 < 3'b100) && (|_zz_when_Axi4Crossbar_l450_8));
  assign when_Axi4Crossbar_l453_2 = (_zz_wrRrPtr_2 == 1'b0);
  assign io_slaves_2_aw_fire = (io_slaves_2_awvalid && io_slaves_2_awready);
  assign when_Axi4Crossbar_l480_2 = (! when_Axi4Crossbar_l459_2);
  assign when_Axi4Crossbar_l482_2 = (_zz__zz_7_port0 == 1'b0);
  assign io_slaves_2_w_fire = (io_slaves_2_wvalid && io_slaves_2_wready);
  assign when_Axi4Crossbar_l497_2 = (io_slaves_2_w_fire && io_slaves_2_wlast);
  assign when_Axi4Crossbar_l503_2 = (io_slaves_2_aw_fire && (! when_Axi4Crossbar_l497_2));
  assign when_Axi4Crossbar_l505_2 = ((! io_slaves_2_aw_fire) && when_Axi4Crossbar_l497_2);
  assign io_slaves_2_b_fire = (io_slaves_2_bvalid && io_slaves_2_bready);
  assign when_Axi4Crossbar_l512_2 = (io_slaves_2_aw_fire && (! io_slaves_2_b_fire));
  assign when_Axi4Crossbar_l514_2 = ((! io_slaves_2_aw_fire) && io_slaves_2_b_fire);
  always @(*) begin
    _zz_when_Axi4Crossbar_l450_11[0] = ((32'hc0000000 <= io_masters_0_awaddr) && (io_masters_0_awaddr < 32'hc0010000));
    _zz_when_Axi4Crossbar_l450_11[1] = ((32'hc0010000 <= io_masters_0_awaddr) && (io_masters_0_awaddr < 32'hc0020000));
    _zz_when_Axi4Crossbar_l450_11[2] = ((32'hc0020000 <= io_masters_0_awaddr) && (io_masters_0_awaddr < 32'hc0021000));
    _zz_when_Axi4Crossbar_l450_11[3] = ((32'hc0030000 <= io_masters_0_awaddr) && (io_masters_0_awaddr < 32'hc0031000));
  end

  assign _zz_when_Axi4Crossbar_l450_10[0] = (io_masters_0_awvalid && _zz_when_Axi4Crossbar_l450_11[3]);
  assign _zz_when_Axi4Crossbar_l161_12[0] = (wrRrPtr_3 <= 1'b0);
  assign _zz_when_Axi4Crossbar_l161_13 = (_zz_when_Axi4Crossbar_l450_10 & _zz_when_Axi4Crossbar_l161_12);
  assign _zz_when_Axi4Crossbar_l161_14 = _zz_when_Axi4Crossbar_l161_13;
  assign _zz_when_Axi4Crossbar_l161_15 = _zz_when_Axi4Crossbar_l450_10;
  always @(*) begin
    _zz_wrRrPtr_3 = 1'b0;
    if(when_Axi4Crossbar_l161_3) begin
      _zz_wrRrPtr_3 = 1'b0;
    end
  end

  assign when_Axi4Crossbar_l161_3 = _zz_when_Axi4Crossbar_l161_3_1[0];
  assign when_Axi4Crossbar_l459_3 = (_zz_when_Axi4Crossbar_l459_3 == 3'b000);
  assign when_Axi4Crossbar_l450_3 = ((_zz_when_Axi4Crossbar_l450_3 < 3'b100) && (|_zz_when_Axi4Crossbar_l450_10));
  assign when_Axi4Crossbar_l453_3 = (_zz_wrRrPtr_3 == 1'b0);
  assign io_slaves_3_aw_fire = (io_slaves_3_awvalid && io_slaves_3_awready);
  assign when_Axi4Crossbar_l480_3 = (! when_Axi4Crossbar_l459_3);
  assign when_Axi4Crossbar_l482_3 = (_zz__zz_8_port0 == 1'b0);
  assign io_slaves_3_w_fire = (io_slaves_3_wvalid && io_slaves_3_wready);
  assign when_Axi4Crossbar_l497_3 = (io_slaves_3_w_fire && io_slaves_3_wlast);
  assign when_Axi4Crossbar_l503_3 = (io_slaves_3_aw_fire && (! when_Axi4Crossbar_l497_3));
  assign when_Axi4Crossbar_l505_3 = ((! io_slaves_3_aw_fire) && when_Axi4Crossbar_l497_3);
  assign io_slaves_3_b_fire = (io_slaves_3_bvalid && io_slaves_3_bready);
  assign when_Axi4Crossbar_l512_3 = (io_slaves_3_aw_fire && (! io_slaves_3_b_fire));
  assign when_Axi4Crossbar_l514_3 = ((! io_slaves_3_aw_fire) && io_slaves_3_b_fire);
  always @(*) begin
    _zz_when_Axi4Crossbar_l534[0] = (io_slaves_0_bvalid && (1'b0 == 1'b0));
    _zz_when_Axi4Crossbar_l534[1] = (io_slaves_1_bvalid && (1'b0 == 1'b0));
    _zz_when_Axi4Crossbar_l534[2] = (io_slaves_2_bvalid && (1'b0 == 1'b0));
    _zz_when_Axi4Crossbar_l534[3] = (io_slaves_3_bvalid && (1'b0 == 1'b0));
  end

  assign _zz_when_Axi4Crossbar_l534_1 = _zz_when_Axi4Crossbar_l534;
  assign _zz_when_Axi4Crossbar_l534_2 = (_zz_when_Axi4Crossbar_l534_1 & (~ _zz__zz_when_Axi4Crossbar_l534_2));
  assign when_Axi4Crossbar_l534 = _zz_when_Axi4Crossbar_l534_2[0];
  assign when_Axi4Crossbar_l534_1 = _zz_when_Axi4Crossbar_l534_2[1];
  assign when_Axi4Crossbar_l534_2 = _zz_when_Axi4Crossbar_l534_2[2];
  assign when_Axi4Crossbar_l534_3 = _zz_when_Axi4Crossbar_l534_2[3];
  always @(*) begin
    _zz_when_Axi4Crossbar_l563_5[0] = ((32'hc0000000 <= io_masters_0_araddr) && (io_masters_0_araddr < 32'hc0010000));
    _zz_when_Axi4Crossbar_l563_5[1] = ((32'hc0010000 <= io_masters_0_araddr) && (io_masters_0_araddr < 32'hc0020000));
    _zz_when_Axi4Crossbar_l563_5[2] = ((32'hc0020000 <= io_masters_0_araddr) && (io_masters_0_araddr < 32'hc0021000));
    _zz_when_Axi4Crossbar_l563_5[3] = ((32'hc0030000 <= io_masters_0_araddr) && (io_masters_0_araddr < 32'hc0031000));
  end

  assign _zz_when_Axi4Crossbar_l563_4[0] = (io_masters_0_arvalid && _zz_when_Axi4Crossbar_l563_5[0]);
  assign _zz_when_Axi4Crossbar_l161_16[0] = (rdRrPtr_0 <= 1'b0);
  assign _zz_when_Axi4Crossbar_l161_17 = (_zz_when_Axi4Crossbar_l563_4 & _zz_when_Axi4Crossbar_l161_16);
  assign _zz_when_Axi4Crossbar_l161_18 = _zz_when_Axi4Crossbar_l161_17;
  assign _zz_when_Axi4Crossbar_l161_19 = _zz_when_Axi4Crossbar_l563_4;
  always @(*) begin
    _zz_rdRrPtr_0 = 1'b0;
    if(when_Axi4Crossbar_l161_4) begin
      _zz_rdRrPtr_0 = 1'b0;
    end
  end

  assign when_Axi4Crossbar_l161_4 = _zz_when_Axi4Crossbar_l161_4_1[0];
  assign when_Axi4Crossbar_l563 = ((_zz_when_Axi4Crossbar_l563 < 3'b100) && (|_zz_when_Axi4Crossbar_l563_4));
  assign when_Axi4Crossbar_l566 = (_zz_rdRrPtr_0 == 1'b0);
  assign io_slaves_0_ar_fire = (io_slaves_0_arvalid && io_slaves_0_arready);
  assign io_slaves_0_r_fire = (io_slaves_0_rvalid && io_slaves_0_rready);
  assign _zz_when_Axi4Crossbar_l584 = (io_slaves_0_r_fire && io_slaves_0_rlast);
  assign when_Axi4Crossbar_l584 = (io_slaves_0_ar_fire && (! _zz_when_Axi4Crossbar_l584));
  assign when_Axi4Crossbar_l586 = ((! io_slaves_0_ar_fire) && _zz_when_Axi4Crossbar_l584);
  always @(*) begin
    _zz_when_Axi4Crossbar_l563_7[0] = ((32'hc0000000 <= io_masters_0_araddr) && (io_masters_0_araddr < 32'hc0010000));
    _zz_when_Axi4Crossbar_l563_7[1] = ((32'hc0010000 <= io_masters_0_araddr) && (io_masters_0_araddr < 32'hc0020000));
    _zz_when_Axi4Crossbar_l563_7[2] = ((32'hc0020000 <= io_masters_0_araddr) && (io_masters_0_araddr < 32'hc0021000));
    _zz_when_Axi4Crossbar_l563_7[3] = ((32'hc0030000 <= io_masters_0_araddr) && (io_masters_0_araddr < 32'hc0031000));
  end

  assign _zz_when_Axi4Crossbar_l563_6[0] = (io_masters_0_arvalid && _zz_when_Axi4Crossbar_l563_7[1]);
  assign _zz_when_Axi4Crossbar_l161_20[0] = (rdRrPtr_1 <= 1'b0);
  assign _zz_when_Axi4Crossbar_l161_21 = (_zz_when_Axi4Crossbar_l563_6 & _zz_when_Axi4Crossbar_l161_20);
  assign _zz_when_Axi4Crossbar_l161_22 = _zz_when_Axi4Crossbar_l161_21;
  assign _zz_when_Axi4Crossbar_l161_23 = _zz_when_Axi4Crossbar_l563_6;
  always @(*) begin
    _zz_rdRrPtr_1 = 1'b0;
    if(when_Axi4Crossbar_l161_5) begin
      _zz_rdRrPtr_1 = 1'b0;
    end
  end

  assign when_Axi4Crossbar_l161_5 = _zz_when_Axi4Crossbar_l161_5_1[0];
  assign when_Axi4Crossbar_l563_1 = ((_zz_when_Axi4Crossbar_l563_1 < 3'b100) && (|_zz_when_Axi4Crossbar_l563_6));
  assign when_Axi4Crossbar_l566_1 = (_zz_rdRrPtr_1 == 1'b0);
  assign io_slaves_1_ar_fire = (io_slaves_1_arvalid && io_slaves_1_arready);
  assign io_slaves_1_r_fire = (io_slaves_1_rvalid && io_slaves_1_rready);
  assign _zz_when_Axi4Crossbar_l584_1 = (io_slaves_1_r_fire && io_slaves_1_rlast);
  assign when_Axi4Crossbar_l584_1 = (io_slaves_1_ar_fire && (! _zz_when_Axi4Crossbar_l584_1));
  assign when_Axi4Crossbar_l586_1 = ((! io_slaves_1_ar_fire) && _zz_when_Axi4Crossbar_l584_1);
  always @(*) begin
    _zz_when_Axi4Crossbar_l563_9[0] = ((32'hc0000000 <= io_masters_0_araddr) && (io_masters_0_araddr < 32'hc0010000));
    _zz_when_Axi4Crossbar_l563_9[1] = ((32'hc0010000 <= io_masters_0_araddr) && (io_masters_0_araddr < 32'hc0020000));
    _zz_when_Axi4Crossbar_l563_9[2] = ((32'hc0020000 <= io_masters_0_araddr) && (io_masters_0_araddr < 32'hc0021000));
    _zz_when_Axi4Crossbar_l563_9[3] = ((32'hc0030000 <= io_masters_0_araddr) && (io_masters_0_araddr < 32'hc0031000));
  end

  assign _zz_when_Axi4Crossbar_l563_8[0] = (io_masters_0_arvalid && _zz_when_Axi4Crossbar_l563_9[2]);
  assign _zz_when_Axi4Crossbar_l161_24[0] = (rdRrPtr_2 <= 1'b0);
  assign _zz_when_Axi4Crossbar_l161_25 = (_zz_when_Axi4Crossbar_l563_8 & _zz_when_Axi4Crossbar_l161_24);
  assign _zz_when_Axi4Crossbar_l161_26 = _zz_when_Axi4Crossbar_l161_25;
  assign _zz_when_Axi4Crossbar_l161_27 = _zz_when_Axi4Crossbar_l563_8;
  always @(*) begin
    _zz_rdRrPtr_2 = 1'b0;
    if(when_Axi4Crossbar_l161_6) begin
      _zz_rdRrPtr_2 = 1'b0;
    end
  end

  assign when_Axi4Crossbar_l161_6 = _zz_when_Axi4Crossbar_l161_6_1[0];
  assign when_Axi4Crossbar_l563_2 = ((_zz_when_Axi4Crossbar_l563_2 < 3'b100) && (|_zz_when_Axi4Crossbar_l563_8));
  assign when_Axi4Crossbar_l566_2 = (_zz_rdRrPtr_2 == 1'b0);
  assign io_slaves_2_ar_fire = (io_slaves_2_arvalid && io_slaves_2_arready);
  assign io_slaves_2_r_fire = (io_slaves_2_rvalid && io_slaves_2_rready);
  assign _zz_when_Axi4Crossbar_l584_2 = (io_slaves_2_r_fire && io_slaves_2_rlast);
  assign when_Axi4Crossbar_l584_2 = (io_slaves_2_ar_fire && (! _zz_when_Axi4Crossbar_l584_2));
  assign when_Axi4Crossbar_l586_2 = ((! io_slaves_2_ar_fire) && _zz_when_Axi4Crossbar_l584_2);
  always @(*) begin
    _zz_when_Axi4Crossbar_l563_11[0] = ((32'hc0000000 <= io_masters_0_araddr) && (io_masters_0_araddr < 32'hc0010000));
    _zz_when_Axi4Crossbar_l563_11[1] = ((32'hc0010000 <= io_masters_0_araddr) && (io_masters_0_araddr < 32'hc0020000));
    _zz_when_Axi4Crossbar_l563_11[2] = ((32'hc0020000 <= io_masters_0_araddr) && (io_masters_0_araddr < 32'hc0021000));
    _zz_when_Axi4Crossbar_l563_11[3] = ((32'hc0030000 <= io_masters_0_araddr) && (io_masters_0_araddr < 32'hc0031000));
  end

  assign _zz_when_Axi4Crossbar_l563_10[0] = (io_masters_0_arvalid && _zz_when_Axi4Crossbar_l563_11[3]);
  assign _zz_when_Axi4Crossbar_l161_28[0] = (rdRrPtr_3 <= 1'b0);
  assign _zz_when_Axi4Crossbar_l161_29 = (_zz_when_Axi4Crossbar_l563_10 & _zz_when_Axi4Crossbar_l161_28);
  assign _zz_when_Axi4Crossbar_l161_30 = _zz_when_Axi4Crossbar_l161_29;
  assign _zz_when_Axi4Crossbar_l161_31 = _zz_when_Axi4Crossbar_l563_10;
  always @(*) begin
    _zz_rdRrPtr_3 = 1'b0;
    if(when_Axi4Crossbar_l161_7) begin
      _zz_rdRrPtr_3 = 1'b0;
    end
  end

  assign when_Axi4Crossbar_l161_7 = _zz_when_Axi4Crossbar_l161_7_1[0];
  assign when_Axi4Crossbar_l563_3 = ((_zz_when_Axi4Crossbar_l563_3 < 3'b100) && (|_zz_when_Axi4Crossbar_l563_10));
  assign when_Axi4Crossbar_l566_3 = (_zz_rdRrPtr_3 == 1'b0);
  assign io_slaves_3_ar_fire = (io_slaves_3_arvalid && io_slaves_3_arready);
  assign io_slaves_3_r_fire = (io_slaves_3_rvalid && io_slaves_3_rready);
  assign _zz_when_Axi4Crossbar_l584_3 = (io_slaves_3_r_fire && io_slaves_3_rlast);
  assign when_Axi4Crossbar_l584_3 = (io_slaves_3_ar_fire && (! _zz_when_Axi4Crossbar_l584_3));
  assign when_Axi4Crossbar_l586_3 = ((! io_slaves_3_ar_fire) && _zz_when_Axi4Crossbar_l584_3);
  always @(*) begin
    _zz_when_Axi4Crossbar_l604[0] = (io_slaves_0_rvalid && (1'b0 == 1'b0));
    _zz_when_Axi4Crossbar_l604[1] = (io_slaves_1_rvalid && (1'b0 == 1'b0));
    _zz_when_Axi4Crossbar_l604[2] = (io_slaves_2_rvalid && (1'b0 == 1'b0));
    _zz_when_Axi4Crossbar_l604[3] = (io_slaves_3_rvalid && (1'b0 == 1'b0));
  end

  assign _zz_when_Axi4Crossbar_l604_1 = _zz_when_Axi4Crossbar_l604;
  assign _zz_when_Axi4Crossbar_l604_2 = (_zz_when_Axi4Crossbar_l604_1 & (~ _zz__zz_when_Axi4Crossbar_l604_2));
  assign when_Axi4Crossbar_l604 = _zz_when_Axi4Crossbar_l604_2[0];
  assign when_Axi4Crossbar_l604_1 = _zz_when_Axi4Crossbar_l604_2[1];
  assign when_Axi4Crossbar_l604_2 = _zz_when_Axi4Crossbar_l604_2[2];
  assign when_Axi4Crossbar_l604_3 = _zz_when_Axi4Crossbar_l604_2[3];
  always @(posedge clk) begin
    if(!resetn) begin
      wrRrPtr_0 <= 1'b0;
      wrRrPtr_1 <= 1'b0;
      wrRrPtr_2 <= 1'b0;
      wrRrPtr_3 <= 1'b0;
      rdRrPtr_0 <= 1'b0;
      rdRrPtr_1 <= 1'b0;
      rdRrPtr_2 <= 1'b0;
      rdRrPtr_3 <= 1'b0;
      _zz_when_Axi4Crossbar_l450 <= 3'b000;
      _zz_when_Axi4Crossbar_l450_1 <= 3'b000;
      _zz_when_Axi4Crossbar_l450_2 <= 3'b000;
      _zz_when_Axi4Crossbar_l450_3 <= 3'b000;
      _zz_9 <= 2'b00;
      _zz_10 <= 2'b00;
      _zz_11 <= 2'b00;
      _zz_12 <= 2'b00;
      _zz_when_Axi4Crossbar_l482 <= 2'b00;
      _zz_when_Axi4Crossbar_l482_1 <= 2'b00;
      _zz_when_Axi4Crossbar_l482_2 <= 2'b00;
      _zz_when_Axi4Crossbar_l482_3 <= 2'b00;
      _zz_when_Axi4Crossbar_l459 <= 3'b000;
      _zz_when_Axi4Crossbar_l459_1 <= 3'b000;
      _zz_when_Axi4Crossbar_l459_2 <= 3'b000;
      _zz_when_Axi4Crossbar_l459_3 <= 3'b000;
      _zz_when_Axi4Crossbar_l563 <= 3'b000;
      _zz_when_Axi4Crossbar_l563_1 <= 3'b000;
      _zz_when_Axi4Crossbar_l563_2 <= 3'b000;
      _zz_when_Axi4Crossbar_l563_3 <= 3'b000;
    end else begin
      if(io_slaves_0_aw_fire) begin
        _zz_9 <= ((_zz_9 == 2'b11) ? 2'b00 : _zz__zz_9);
        wrRrPtr_0 <= (_zz_wrRrPtr_0 + 1'b1);
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
        _zz_10 <= ((_zz_10 == 2'b11) ? 2'b00 : _zz__zz_10);
        wrRrPtr_1 <= (_zz_wrRrPtr_1 + 1'b1);
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
      if(io_slaves_2_aw_fire) begin
        _zz_11 <= ((_zz_11 == 2'b11) ? 2'b00 : _zz__zz_11);
        wrRrPtr_2 <= (_zz_wrRrPtr_2 + 1'b1);
      end
      if(when_Axi4Crossbar_l497_2) begin
        _zz_when_Axi4Crossbar_l482_2 <= ((_zz_when_Axi4Crossbar_l482_2 == 2'b11) ? 2'b00 : _zz__zz_when_Axi4Crossbar_l482_2);
      end
      if(when_Axi4Crossbar_l503_2) begin
        _zz_when_Axi4Crossbar_l459_2 <= (_zz_when_Axi4Crossbar_l459_2 + 3'b001);
      end else begin
        if(when_Axi4Crossbar_l505_2) begin
          _zz_when_Axi4Crossbar_l459_2 <= (_zz_when_Axi4Crossbar_l459_2 - 3'b001);
        end
      end
      if(when_Axi4Crossbar_l512_2) begin
        _zz_when_Axi4Crossbar_l450_2 <= (_zz_when_Axi4Crossbar_l450_2 + 3'b001);
      end else begin
        if(when_Axi4Crossbar_l514_2) begin
          _zz_when_Axi4Crossbar_l450_2 <= (_zz_when_Axi4Crossbar_l450_2 - 3'b001);
        end
      end
      if(io_slaves_3_aw_fire) begin
        _zz_12 <= ((_zz_12 == 2'b11) ? 2'b00 : _zz__zz_12);
        wrRrPtr_3 <= (_zz_wrRrPtr_3 + 1'b1);
      end
      if(when_Axi4Crossbar_l497_3) begin
        _zz_when_Axi4Crossbar_l482_3 <= ((_zz_when_Axi4Crossbar_l482_3 == 2'b11) ? 2'b00 : _zz__zz_when_Axi4Crossbar_l482_3);
      end
      if(when_Axi4Crossbar_l503_3) begin
        _zz_when_Axi4Crossbar_l459_3 <= (_zz_when_Axi4Crossbar_l459_3 + 3'b001);
      end else begin
        if(when_Axi4Crossbar_l505_3) begin
          _zz_when_Axi4Crossbar_l459_3 <= (_zz_when_Axi4Crossbar_l459_3 - 3'b001);
        end
      end
      if(when_Axi4Crossbar_l512_3) begin
        _zz_when_Axi4Crossbar_l450_3 <= (_zz_when_Axi4Crossbar_l450_3 + 3'b001);
      end else begin
        if(when_Axi4Crossbar_l514_3) begin
          _zz_when_Axi4Crossbar_l450_3 <= (_zz_when_Axi4Crossbar_l450_3 - 3'b001);
        end
      end
      if(io_slaves_0_ar_fire) begin
        rdRrPtr_0 <= (_zz_rdRrPtr_0 + 1'b1);
      end
      if(when_Axi4Crossbar_l584) begin
        _zz_when_Axi4Crossbar_l563 <= (_zz_when_Axi4Crossbar_l563 + 3'b001);
      end else begin
        if(when_Axi4Crossbar_l586) begin
          _zz_when_Axi4Crossbar_l563 <= (_zz_when_Axi4Crossbar_l563 - 3'b001);
        end
      end
      if(io_slaves_1_ar_fire) begin
        rdRrPtr_1 <= (_zz_rdRrPtr_1 + 1'b1);
      end
      if(when_Axi4Crossbar_l584_1) begin
        _zz_when_Axi4Crossbar_l563_1 <= (_zz_when_Axi4Crossbar_l563_1 + 3'b001);
      end else begin
        if(when_Axi4Crossbar_l586_1) begin
          _zz_when_Axi4Crossbar_l563_1 <= (_zz_when_Axi4Crossbar_l563_1 - 3'b001);
        end
      end
      if(io_slaves_2_ar_fire) begin
        rdRrPtr_2 <= (_zz_rdRrPtr_2 + 1'b1);
      end
      if(when_Axi4Crossbar_l584_2) begin
        _zz_when_Axi4Crossbar_l563_2 <= (_zz_when_Axi4Crossbar_l563_2 + 3'b001);
      end else begin
        if(when_Axi4Crossbar_l586_2) begin
          _zz_when_Axi4Crossbar_l563_2 <= (_zz_when_Axi4Crossbar_l563_2 - 3'b001);
        end
      end
      if(io_slaves_3_ar_fire) begin
        rdRrPtr_3 <= (_zz_rdRrPtr_3 + 1'b1);
      end
      if(when_Axi4Crossbar_l584_3) begin
        _zz_when_Axi4Crossbar_l563_3 <= (_zz_when_Axi4Crossbar_l563_3 + 3'b001);
      end else begin
        if(when_Axi4Crossbar_l586_3) begin
          _zz_when_Axi4Crossbar_l563_3 <= (_zz_when_Axi4Crossbar_l563_3 - 3'b001);
        end
      end
    end
  end


endmodule

//StreamFifo_2 replaced by StreamFifo_1

module StreamFifo_1 (
  input  wire          io_push_valid,
  output wire          io_push_ready,
  input  wire [31:0]   io_pushdata,
  input  wire [3:0]    io_pushstrb,
  input  wire          io_pushlast,
  output wire          io_pop_valid,
  input  wire          io_pop_ready,
  output wire [31:0]   io_popdata,
  output wire [3:0]    io_popstrb,
  output wire          io_poplast,
  input  wire          io_flush,
  output wire [4:0]    io_occupancy,
  output wire [4:0]    io_availability,
  input  wire          clk,
  input  wire          resetn
);

  reg        [36:0]   _zz_logic_ram_port1;
  wire       [36:0]   _zz_logic_ram_port;
  reg                 _zz_1;
  wire                logic_ptr_doPush;
  wire                logic_ptr_doPop;
  wire                logic_ptr_full;
  wire                logic_ptr_empty;
  reg        [4:0]    logic_ptr_push;
  reg        [4:0]    logic_ptr_pop;
  wire       [4:0]    logic_ptr_occupancy;
  wire       [4:0]    logic_ptr_popOnIo;
  wire                when_Stream_l1205;
  reg                 logic_ptr_wentUp;
  wire                io_push_fire;
  wire                logic_push_onRam_write_valid;
  wire       [3:0]    logic_push_onRam_writeaddress;
  wire       [31:0]   logic_push_onRam_writedata_data;
  wire       [3:0]    logic_push_onRam_writedata_strb;
  wire                logic_push_onRam_writedata_last;
  wire                logic_pop_addressGen_valid;
  reg                 logic_pop_addressGen_ready;
  wire       [3:0]    logic_pop_addressGen_payload;
  wire                logic_pop_addressGen_fire;
  wire                logic_pop_sync_readArbitation_valid;
  wire                logic_pop_sync_readArbitation_ready;
  wire       [3:0]    logic_pop_sync_readArbitation_payload;
  reg                 logic_pop_addressGen_rValid;
  reg        [3:0]    logic_pop_addressGen_rData;
  wire                when_Stream_l369;
  wire                logic_pop_sync_readPort_cmd_valid;
  wire       [3:0]    logic_pop_sync_readPort_cmd_payload;
  wire       [31:0]   logic_pop_sync_readPort_rsp_data;
  wire       [3:0]    logic_pop_sync_readPort_rsp_strb;
  wire                logic_pop_sync_readPort_rsp_last;
  wire       [36:0]   _zz_logic_pop_sync_readPort_rsp_data;
  wire                logic_pop_sync_readArbitation_translated_valid;
  wire                logic_pop_sync_readArbitation_translated_ready;
  wire       [31:0]   logic_pop_sync_readArbitation_translateddata;
  wire       [3:0]    logic_pop_sync_readArbitation_translatedstrb;
  wire                logic_pop_sync_readArbitation_translatedlast;
  wire                logic_pop_sync_readArbitation_fire;
  reg        [4:0]    logic_pop_sync_popReg;
  reg [36:0] logic_ram [0:15];

  assign _zz_logic_ram_port = {logic_push_onRam_writedata_last,{logic_push_onRam_writedata_strb,logic_push_onRam_writedata_data}};
  always @(posedge clk) begin
    if(_zz_1) begin
      logic_ram[logic_push_onRam_writeaddress] <= _zz_logic_ram_port;
    end
  end

  always @(posedge clk) begin
    if(logic_pop_sync_readPort_cmd_valid) begin
      _zz_logic_ram_port1 <= logic_ram[logic_pop_sync_readPort_cmd_payload];
    end
  end

  always @(*) begin
    _zz_1 = 1'b0;
    if(logic_push_onRam_write_valid) begin
      _zz_1 = 1'b1;
    end
  end

  assign when_Stream_l1205 = (logic_ptr_doPush != logic_ptr_doPop);
  assign logic_ptr_full = (((logic_ptr_push ^ logic_ptr_popOnIo) ^ 5'h10) == 5'h00);
  assign logic_ptr_empty = (logic_ptr_push == logic_ptr_pop);
  assign logic_ptr_occupancy = (logic_ptr_push - logic_ptr_popOnIo);
  assign io_push_ready = (! logic_ptr_full);
  assign io_push_fire = (io_push_valid && io_push_ready);
  assign logic_ptr_doPush = io_push_fire;
  assign logic_push_onRam_write_valid = io_push_fire;
  assign logic_push_onRam_writeaddress = logic_ptr_push[3:0];
  assign logic_push_onRam_writedata_data = io_pushdata;
  assign logic_push_onRam_writedata_strb = io_pushstrb;
  assign logic_push_onRam_writedata_last = io_pushlast;
  assign logic_pop_addressGen_valid = (! logic_ptr_empty);
  assign logic_pop_addressGen_payload = logic_ptr_pop[3:0];
  assign logic_pop_addressGen_fire = (logic_pop_addressGen_valid && logic_pop_addressGen_ready);
  assign logic_ptr_doPop = logic_pop_addressGen_fire;
  always @(*) begin
    logic_pop_addressGen_ready = logic_pop_sync_readArbitation_ready;
    if(when_Stream_l369) begin
      logic_pop_addressGen_ready = 1'b1;
    end
  end

  assign when_Stream_l369 = (! logic_pop_sync_readArbitation_valid);
  assign logic_pop_sync_readArbitation_valid = logic_pop_addressGen_rValid;
  assign logic_pop_sync_readArbitation_payload = logic_pop_addressGen_rData;
  assign _zz_logic_pop_sync_readPort_rsp_data = _zz_logic_ram_port1;
  assign logic_pop_sync_readPort_rsp_data = _zz_logic_pop_sync_readPort_rsp_data[31 : 0];
  assign logic_pop_sync_readPort_rsp_strb = _zz_logic_pop_sync_readPort_rsp_data[35 : 32];
  assign logic_pop_sync_readPort_rsp_last = _zz_logic_pop_sync_readPort_rsp_data[36];
  assign logic_pop_sync_readPort_cmd_valid = logic_pop_addressGen_fire;
  assign logic_pop_sync_readPort_cmd_payload = logic_pop_addressGen_payload;
  assign logic_pop_sync_readArbitation_translated_valid = logic_pop_sync_readArbitation_valid;
  assign logic_pop_sync_readArbitation_ready = logic_pop_sync_readArbitation_translated_ready;
  assign logic_pop_sync_readArbitation_translateddata = logic_pop_sync_readPort_rsp_data;
  assign logic_pop_sync_readArbitation_translatedstrb = logic_pop_sync_readPort_rsp_strb;
  assign logic_pop_sync_readArbitation_translatedlast = logic_pop_sync_readPort_rsp_last;
  assign io_pop_valid = logic_pop_sync_readArbitation_translated_valid;
  assign logic_pop_sync_readArbitation_translated_ready = io_pop_ready;
  assign io_popdata = logic_pop_sync_readArbitation_translateddata;
  assign io_popstrb = logic_pop_sync_readArbitation_translatedstrb;
  assign io_poplast = logic_pop_sync_readArbitation_translatedlast;
  assign logic_pop_sync_readArbitation_fire = (logic_pop_sync_readArbitation_valid && logic_pop_sync_readArbitation_ready);
  assign logic_ptr_popOnIo = logic_pop_sync_popReg;
  assign io_occupancy = logic_ptr_occupancy;
  assign io_availability = (5'h10 - logic_ptr_occupancy);
  always @(posedge clk) begin
    if(!resetn) begin
      logic_ptr_push <= 5'h00;
      logic_ptr_pop <= 5'h00;
      logic_ptr_wentUp <= 1'b0;
      logic_pop_addressGen_rValid <= 1'b0;
      logic_pop_sync_popReg <= 5'h00;
    end else begin
      if(when_Stream_l1205) begin
        logic_ptr_wentUp <= logic_ptr_doPush;
      end
      if(io_flush) begin
        logic_ptr_wentUp <= 1'b0;
      end
      if(logic_ptr_doPush) begin
        logic_ptr_push <= (logic_ptr_push + 5'h01);
      end
      if(logic_ptr_doPop) begin
        logic_ptr_pop <= (logic_ptr_pop + 5'h01);
      end
      if(io_flush) begin
        logic_ptr_push <= 5'h00;
        logic_ptr_pop <= 5'h00;
      end
      if(logic_pop_addressGen_ready) begin
        logic_pop_addressGen_rValid <= logic_pop_addressGen_valid;
      end
      if(io_flush) begin
        logic_pop_addressGen_rValid <= 1'b0;
      end
      if(logic_pop_sync_readArbitation_fire) begin
        logic_pop_sync_popReg <= logic_ptr_pop;
      end
      if(io_flush) begin
        logic_pop_sync_popReg <= 5'h00;
      end
    end
  end

  always @(posedge clk) begin
    if(logic_pop_addressGen_ready) begin
      logic_pop_addressGen_rData <= logic_pop_addressGen_payload;
    end
  end


endmodule

module StreamFifo (
  input  wire          io_push_valid,
  output wire          io_push_ready,
  input  wire [0:0]    io_pushid,
  input  wire [31:0]   io_pushaddr,
  input  wire [3:0]    io_pushlen,
  input  wire [2:0]    io_pushsize,
  input  wire [1:0]    io_pushburst,
  input  wire [1:0]    io_pushlock,
  input  wire [3:0]    io_pushcache,
  input  wire [2:0]    io_pushprot,
  input  wire          io_pushlocked,
  output wire          io_pop_valid,
  input  wire          io_pop_ready,
  output wire [0:0]    io_popid,
  output wire [31:0]   io_popaddr,
  output wire [3:0]    io_poplen,
  output wire [2:0]    io_popsize,
  output wire [1:0]    io_popburst,
  output wire [1:0]    io_poplock,
  output wire [3:0]    io_popcache,
  output wire [2:0]    io_popprot,
  output wire          io_poplocked,
  input  wire          io_flush,
  output wire [2:0]    io_occupancy,
  output wire [2:0]    io_availability,
  input  wire          clk,
  input  wire          resetn
);

  reg        [51:0]   _zz_logic_ram_port1;
  wire       [51:0]   _zz_logic_ram_port;
  reg                 _zz_1;
  wire                logic_ptr_doPush;
  wire                logic_ptr_doPop;
  wire                logic_ptr_full;
  wire                logic_ptr_empty;
  reg        [2:0]    logic_ptr_push;
  reg        [2:0]    logic_ptr_pop;
  wire       [2:0]    logic_ptr_occupancy;
  wire       [2:0]    logic_ptr_popOnIo;
  wire                when_Stream_l1205;
  reg                 logic_ptr_wentUp;
  wire                io_push_fire;
  wire                logic_push_onRam_write_valid;
  wire       [1:0]    logic_push_onRam_writeaddress;
  wire       [0:0]    logic_push_onRam_writedata_id;
  wire       [31:0]   logic_push_onRam_writedata_addr;
  wire       [3:0]    logic_push_onRam_writedata_len;
  wire       [2:0]    logic_push_onRam_writedata_size;
  wire       [1:0]    logic_push_onRam_writedata_burst;
  wire       [1:0]    logic_push_onRam_writedata_lock;
  wire       [3:0]    logic_push_onRam_writedata_cache;
  wire       [2:0]    logic_push_onRam_writedata_prot;
  wire                logic_push_onRam_writedata_locked;
  wire                logic_pop_addressGen_valid;
  reg                 logic_pop_addressGen_ready;
  wire       [1:0]    logic_pop_addressGen_payload;
  wire                logic_pop_addressGen_fire;
  wire                logic_pop_sync_readArbitation_valid;
  wire                logic_pop_sync_readArbitation_ready;
  wire       [1:0]    logic_pop_sync_readArbitation_payload;
  reg                 logic_pop_addressGen_rValid;
  reg        [1:0]    logic_pop_addressGen_rData;
  wire                when_Stream_l369;
  wire                logic_pop_sync_readPort_cmd_valid;
  wire       [1:0]    logic_pop_sync_readPort_cmd_payload;
  wire       [0:0]    logic_pop_sync_readPort_rsp_id;
  wire       [31:0]   logic_pop_sync_readPort_rsp_addr;
  wire       [3:0]    logic_pop_sync_readPort_rsp_len;
  wire       [2:0]    logic_pop_sync_readPort_rsp_size;
  wire       [1:0]    logic_pop_sync_readPort_rsp_burst;
  wire       [1:0]    logic_pop_sync_readPort_rsp_lock;
  wire       [3:0]    logic_pop_sync_readPort_rsp_cache;
  wire       [2:0]    logic_pop_sync_readPort_rsp_prot;
  wire                logic_pop_sync_readPort_rsp_locked;
  wire       [51:0]   _zz_logic_pop_sync_readPort_rsp_id;
  wire                logic_pop_sync_readArbitation_translated_valid;
  wire                logic_pop_sync_readArbitation_translated_ready;
  wire       [0:0]    logic_pop_sync_readArbitation_translatedid;
  wire       [31:0]   logic_pop_sync_readArbitation_translatedaddr;
  wire       [3:0]    logic_pop_sync_readArbitation_translatedlen;
  wire       [2:0]    logic_pop_sync_readArbitation_translatedsize;
  wire       [1:0]    logic_pop_sync_readArbitation_translatedburst;
  wire       [1:0]    logic_pop_sync_readArbitation_translatedlock;
  wire       [3:0]    logic_pop_sync_readArbitation_translatedcache;
  wire       [2:0]    logic_pop_sync_readArbitation_translatedprot;
  wire                logic_pop_sync_readArbitation_translatedlocked;
  wire                logic_pop_sync_readArbitation_fire;
  reg        [2:0]    logic_pop_sync_popReg;
  reg [51:0] logic_ram [0:3];

  assign _zz_logic_ram_port = {logic_push_onRam_writedata_locked,{logic_push_onRam_writedata_prot,{logic_push_onRam_writedata_cache,{logic_push_onRam_writedata_lock,{logic_push_onRam_writedata_burst,{logic_push_onRam_writedata_size,{logic_push_onRam_writedata_len,{logic_push_onRam_writedata_addr,logic_push_onRam_writedata_id}}}}}}}};
  always @(posedge clk) begin
    if(_zz_1) begin
      logic_ram[logic_push_onRam_writeaddress] <= _zz_logic_ram_port;
    end
  end

  always @(posedge clk) begin
    if(logic_pop_sync_readPort_cmd_valid) begin
      _zz_logic_ram_port1 <= logic_ram[logic_pop_sync_readPort_cmd_payload];
    end
  end

  always @(*) begin
    _zz_1 = 1'b0;
    if(logic_push_onRam_write_valid) begin
      _zz_1 = 1'b1;
    end
  end

  assign when_Stream_l1205 = (logic_ptr_doPush != logic_ptr_doPop);
  assign logic_ptr_full = (((logic_ptr_push ^ logic_ptr_popOnIo) ^ 3'b100) == 3'b000);
  assign logic_ptr_empty = (logic_ptr_push == logic_ptr_pop);
  assign logic_ptr_occupancy = (logic_ptr_push - logic_ptr_popOnIo);
  assign io_push_ready = (! logic_ptr_full);
  assign io_push_fire = (io_push_valid && io_push_ready);
  assign logic_ptr_doPush = io_push_fire;
  assign logic_push_onRam_write_valid = io_push_fire;
  assign logic_push_onRam_writeaddress = logic_ptr_push[1:0];
  assign logic_push_onRam_writedata_id = io_pushid;
  assign logic_push_onRam_writedata_addr = io_pushaddr;
  assign logic_push_onRam_writedata_len = io_pushlen;
  assign logic_push_onRam_writedata_size = io_pushsize;
  assign logic_push_onRam_writedata_burst = io_pushburst;
  assign logic_push_onRam_writedata_lock = io_pushlock;
  assign logic_push_onRam_writedata_cache = io_pushcache;
  assign logic_push_onRam_writedata_prot = io_pushprot;
  assign logic_push_onRam_writedata_locked = io_pushlocked;
  assign logic_pop_addressGen_valid = (! logic_ptr_empty);
  assign logic_pop_addressGen_payload = logic_ptr_pop[1:0];
  assign logic_pop_addressGen_fire = (logic_pop_addressGen_valid && logic_pop_addressGen_ready);
  assign logic_ptr_doPop = logic_pop_addressGen_fire;
  always @(*) begin
    logic_pop_addressGen_ready = logic_pop_sync_readArbitation_ready;
    if(when_Stream_l369) begin
      logic_pop_addressGen_ready = 1'b1;
    end
  end

  assign when_Stream_l369 = (! logic_pop_sync_readArbitation_valid);
  assign logic_pop_sync_readArbitation_valid = logic_pop_addressGen_rValid;
  assign logic_pop_sync_readArbitation_payload = logic_pop_addressGen_rData;
  assign _zz_logic_pop_sync_readPort_rsp_id = _zz_logic_ram_port1;
  assign logic_pop_sync_readPort_rsp_id = _zz_logic_pop_sync_readPort_rsp_id[0 : 0];
  assign logic_pop_sync_readPort_rsp_addr = _zz_logic_pop_sync_readPort_rsp_id[32 : 1];
  assign logic_pop_sync_readPort_rsp_len = _zz_logic_pop_sync_readPort_rsp_id[36 : 33];
  assign logic_pop_sync_readPort_rsp_size = _zz_logic_pop_sync_readPort_rsp_id[39 : 37];
  assign logic_pop_sync_readPort_rsp_burst = _zz_logic_pop_sync_readPort_rsp_id[41 : 40];
  assign logic_pop_sync_readPort_rsp_lock = _zz_logic_pop_sync_readPort_rsp_id[43 : 42];
  assign logic_pop_sync_readPort_rsp_cache = _zz_logic_pop_sync_readPort_rsp_id[47 : 44];
  assign logic_pop_sync_readPort_rsp_prot = _zz_logic_pop_sync_readPort_rsp_id[50 : 48];
  assign logic_pop_sync_readPort_rsp_locked = _zz_logic_pop_sync_readPort_rsp_id[51];
  assign logic_pop_sync_readPort_cmd_valid = logic_pop_addressGen_fire;
  assign logic_pop_sync_readPort_cmd_payload = logic_pop_addressGen_payload;
  assign logic_pop_sync_readArbitation_translated_valid = logic_pop_sync_readArbitation_valid;
  assign logic_pop_sync_readArbitation_ready = logic_pop_sync_readArbitation_translated_ready;
  assign logic_pop_sync_readArbitation_translatedid = logic_pop_sync_readPort_rsp_id;
  assign logic_pop_sync_readArbitation_translatedaddr = logic_pop_sync_readPort_rsp_addr;
  assign logic_pop_sync_readArbitation_translatedlen = logic_pop_sync_readPort_rsp_len;
  assign logic_pop_sync_readArbitation_translatedsize = logic_pop_sync_readPort_rsp_size;
  assign logic_pop_sync_readArbitation_translatedburst = logic_pop_sync_readPort_rsp_burst;
  assign logic_pop_sync_readArbitation_translatedlock = logic_pop_sync_readPort_rsp_lock;
  assign logic_pop_sync_readArbitation_translatedcache = logic_pop_sync_readPort_rsp_cache;
  assign logic_pop_sync_readArbitation_translatedprot = logic_pop_sync_readPort_rsp_prot;
  assign logic_pop_sync_readArbitation_translatedlocked = logic_pop_sync_readPort_rsp_locked;
  assign io_pop_valid = logic_pop_sync_readArbitation_translated_valid;
  assign logic_pop_sync_readArbitation_translated_ready = io_pop_ready;
  assign io_popid = logic_pop_sync_readArbitation_translatedid;
  assign io_popaddr = logic_pop_sync_readArbitation_translatedaddr;
  assign io_poplen = logic_pop_sync_readArbitation_translatedlen;
  assign io_popsize = logic_pop_sync_readArbitation_translatedsize;
  assign io_popburst = logic_pop_sync_readArbitation_translatedburst;
  assign io_poplock = logic_pop_sync_readArbitation_translatedlock;
  assign io_popcache = logic_pop_sync_readArbitation_translatedcache;
  assign io_popprot = logic_pop_sync_readArbitation_translatedprot;
  assign io_poplocked = logic_pop_sync_readArbitation_translatedlocked;
  assign logic_pop_sync_readArbitation_fire = (logic_pop_sync_readArbitation_valid && logic_pop_sync_readArbitation_ready);
  assign logic_ptr_popOnIo = logic_pop_sync_popReg;
  assign io_occupancy = logic_ptr_occupancy;
  assign io_availability = (3'b100 - logic_ptr_occupancy);
  always @(posedge clk) begin
    if(!resetn) begin
      logic_ptr_push <= 3'b000;
      logic_ptr_pop <= 3'b000;
      logic_ptr_wentUp <= 1'b0;
      logic_pop_addressGen_rValid <= 1'b0;
      logic_pop_sync_popReg <= 3'b000;
    end else begin
      if(when_Stream_l1205) begin
        logic_ptr_wentUp <= logic_ptr_doPush;
      end
      if(io_flush) begin
        logic_ptr_wentUp <= 1'b0;
      end
      if(logic_ptr_doPush) begin
        logic_ptr_push <= (logic_ptr_push + 3'b001);
      end
      if(logic_ptr_doPop) begin
        logic_ptr_pop <= (logic_ptr_pop + 3'b001);
      end
      if(io_flush) begin
        logic_ptr_push <= 3'b000;
        logic_ptr_pop <= 3'b000;
      end
      if(logic_pop_addressGen_ready) begin
        logic_pop_addressGen_rValid <= logic_pop_addressGen_valid;
      end
      if(io_flush) begin
        logic_pop_addressGen_rValid <= 1'b0;
      end
      if(logic_pop_sync_readArbitation_fire) begin
        logic_pop_sync_popReg <= logic_ptr_pop;
      end
      if(io_flush) begin
        logic_pop_sync_popReg <= 3'b000;
      end
    end
  end

  always @(posedge clk) begin
    if(logic_pop_addressGen_ready) begin
      logic_pop_addressGen_rData <= logic_pop_addressGen_payload;
    end
  end


endmodule
