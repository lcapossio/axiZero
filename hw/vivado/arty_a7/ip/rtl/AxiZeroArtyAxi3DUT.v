// Copyright (c) 2026 Leonardo Capossio - bard0 design  hello@bard0.com
// SPDX-License-Identifier: MIT
// Generator : SpinalHDL v1.14.2    git head : 78f29dc66110fc099a777992b6daa2f803ab445e
// Component : Axi3BridgeTestTop
// Git hash  : e4ae231ab45f2af93f68dbb509b855f6a8cb625a

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
  wire                crossbar_io_masters_1_arready;
  wire                crossbar_io_masters_1_awready;
  wire                crossbar_io_masters_1_wready;
  wire                crossbar_io_masters_1_rvalid;
  wire       [31:0]   crossbar_io_masters_1_rdata;
  wire       [1:0]    crossbar_io_masters_1_rresp;
  wire                crossbar_io_masters_1_bvalid;
  wire       [1:0]    crossbar_io_masters_1_bresp;
  wire                crossbar_io_slaves_0_arvalid;
  wire       [31:0]   crossbar_io_slaves_0_araddr;
  wire       [1:0]    crossbar_io_slaves_0_arid;
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
  wire       [1:0]    crossbar_io_slaves_0_awid;
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
  wire       [1:0]    crossbar_io_slaves_1_arid;
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
  wire       [1:0]    crossbar_io_slaves_1_awid;
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
    .io_masters_1_awvalid          (s1_axi_awvalid                             ), //i
    .io_masters_1_awready          (crossbar_io_masters_1_awready             ), //o
    .io_masters_1_awaddr   (s1_axi_awaddr[31:0]                ), //i
    .io_masters_1_awprot   (s1_axi_awprot[2:0]                 ), //i
    .io_masters_1_wvalid           (s1_axi_wvalid                              ), //i
    .io_masters_1_wready           (crossbar_io_masters_1_wready              ), //o
    .io_masters_1_wdata    (s1_axi_wdata[31:0]                 ), //i
    .io_masters_1_wstrb    (s1_axi_wstrb[3:0]                  ), //i
    .io_masters_1_bvalid           (crossbar_io_masters_1_bvalid              ), //o
    .io_masters_1_bready           (s1_axi_bready                              ), //i
    .io_masters_1_bresp    (crossbar_io_masters_1_bresp[1:0]  ), //o
    .io_masters_1_arvalid          (s1_axi_arvalid                             ), //i
    .io_masters_1_arready          (crossbar_io_masters_1_arready             ), //o
    .io_masters_1_araddr   (s1_axi_araddr[31:0]                ), //i
    .io_masters_1_arprot   (s1_axi_arprot[2:0]                 ), //i
    .io_masters_1_rvalid           (crossbar_io_masters_1_rvalid              ), //o
    .io_masters_1_rready           (s1_axi_rready                              ), //i
    .io_masters_1_rdata    (crossbar_io_masters_1_rdata[31:0] ), //o
    .io_masters_1_rresp    (crossbar_io_masters_1_rresp[1:0]  ), //o
    .io_slaves_0_awvalid           (crossbar_io_slaves_0_awvalid              ), //o
    .io_slaves_0_awready           (m0_axi_awready                             ), //i
    .io_slaves_0_awaddr    (crossbar_io_slaves_0_awaddr[31:0] ), //o
    .io_slaves_0_awid      (crossbar_io_slaves_0_awid[1:0]    ), //o
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
    .io_slaves_0_bid       (m0_axi_bid[1:0]                    ), //i
    .io_slaves_0_bresp     (m0_axi_bresp[1:0]                  ), //i
    .io_slaves_0_arvalid           (crossbar_io_slaves_0_arvalid              ), //o
    .io_slaves_0_arready           (m0_axi_arready                             ), //i
    .io_slaves_0_araddr    (crossbar_io_slaves_0_araddr[31:0] ), //o
    .io_slaves_0_arid      (crossbar_io_slaves_0_arid[1:0]    ), //o
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
    .io_slaves_0_rid       (m0_axi_rid[1:0]                    ), //i
    .io_slaves_0_rresp     (m0_axi_rresp[1:0]                  ), //i
    .io_slaves_0_rlast     (m0_axi_rlast                       ), //i
    .io_slaves_1_awvalid           (crossbar_io_slaves_1_awvalid              ), //o
    .io_slaves_1_awready           (m1_axi_awready                             ), //i
    .io_slaves_1_awaddr    (crossbar_io_slaves_1_awaddr[31:0] ), //o
    .io_slaves_1_awid      (crossbar_io_slaves_1_awid[1:0]    ), //o
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
    .io_slaves_1_bid       (m1_axi_bid[1:0]                    ), //i
    .io_slaves_1_bresp     (m1_axi_bresp[1:0]                  ), //i
    .io_slaves_1_arvalid           (crossbar_io_slaves_1_arvalid              ), //o
    .io_slaves_1_arready           (m1_axi_arready                             ), //i
    .io_slaves_1_araddr    (crossbar_io_slaves_1_araddr[31:0] ), //o
    .io_slaves_1_arid      (crossbar_io_slaves_1_arid[1:0]    ), //o
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
    .io_slaves_1_rid       (m1_axi_rid[1:0]                    ), //i
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
  assign s1_axi_awready = crossbar_io_masters_1_awready;
  assign s1_axi_wready = crossbar_io_masters_1_wready;
  assign s1_axi_bvalid = crossbar_io_masters_1_bvalid;
  assign s1_axi_bresp = crossbar_io_masters_1_bresp;
  assign s1_axi_arready = crossbar_io_masters_1_arready;
  assign s1_axi_rvalid = crossbar_io_masters_1_rvalid;
  assign s1_axi_rdata = crossbar_io_masters_1_rdata;
  assign s1_axi_rresp = crossbar_io_masters_1_rresp;
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
  input  wire          io_masters_1_awvalid,
  output wire          io_masters_1_awready,
  input  wire [31:0]   io_masters_1_awaddr,
  input  wire [2:0]    io_masters_1_awprot,
  input  wire          io_masters_1_wvalid,
  output wire          io_masters_1_wready,
  input  wire [31:0]   io_masters_1_wdata,
  input  wire [3:0]    io_masters_1_wstrb,
  output wire          io_masters_1_bvalid,
  input  wire          io_masters_1_bready,
  output wire [1:0]    io_masters_1_bresp,
  input  wire          io_masters_1_arvalid,
  output wire          io_masters_1_arready,
  input  wire [31:0]   io_masters_1_araddr,
  input  wire [2:0]    io_masters_1_arprot,
  output wire          io_masters_1_rvalid,
  input  wire          io_masters_1_rready,
  output wire [31:0]   io_masters_1_rdata,
  output wire [1:0]    io_masters_1_rresp,
  output wire          io_slaves_0_awvalid,
  input  wire          io_slaves_0_awready,
  output wire [31:0]   io_slaves_0_awaddr,
  output wire [1:0]    io_slaves_0_awid,
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
  input  wire [1:0]    io_slaves_0_bid,
  input  wire [1:0]    io_slaves_0_bresp,
  output wire          io_slaves_0_arvalid,
  input  wire          io_slaves_0_arready,
  output wire [31:0]   io_slaves_0_araddr,
  output wire [1:0]    io_slaves_0_arid,
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
  input  wire [1:0]    io_slaves_0_rid,
  input  wire [1:0]    io_slaves_0_rresp,
  input  wire          io_slaves_0_rlast,
  output wire          io_slaves_1_awvalid,
  input  wire          io_slaves_1_awready,
  output wire [31:0]   io_slaves_1_awaddr,
  output wire [1:0]    io_slaves_1_awid,
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
  input  wire [1:0]    io_slaves_1_bid,
  input  wire [1:0]    io_slaves_1_bresp,
  output wire          io_slaves_1_arvalid,
  input  wire          io_slaves_1_arready,
  output wire [31:0]   io_slaves_1_araddr,
  output wire [1:0]    io_slaves_1_arid,
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
  input  wire [1:0]    io_slaves_1_rid,
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
  wire                xbar_io_masters_1_arready;
  wire                xbar_io_masters_1_awready;
  wire                xbar_io_masters_1_wready;
  wire                xbar_io_masters_1_rvalid;
  wire       [31:0]   xbar_io_masters_1_rdata;
  wire       [0:0]    xbar_io_masters_1_rid;
  wire       [1:0]    xbar_io_masters_1_rresp;
  wire                xbar_io_masters_1_rlast;
  wire                xbar_io_masters_1_bvalid;
  wire       [0:0]    xbar_io_masters_1_bid;
  wire       [1:0]    xbar_io_masters_1_bresp;
  wire                xbar_io_slaves_0_arvalid;
  wire       [31:0]   xbar_io_slaves_0_araddr;
  wire       [1:0]    xbar_io_slaves_0_arid;
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
  wire       [1:0]    xbar_io_slaves_0_awid;
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
  wire       [1:0]    xbar_io_slaves_1_arid;
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
  wire       [1:0]    xbar_io_slaves_1_awid;
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
  wire       [1:0]    xbar_io_slaves_2_arid;
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
  wire       [1:0]    xbar_io_slaves_2_awid;
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
  wire       [1:0]    xbar_io_slaves_3_arid;
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
  wire       [1:0]    xbar_io_slaves_3_awid;
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
  wire                axi4LiteToFullAdapter_1_io_lite_arready;
  wire                axi4LiteToFullAdapter_1_io_lite_awready;
  wire                axi4LiteToFullAdapter_1_io_lite_wready;
  wire                axi4LiteToFullAdapter_1_io_lite_rvalid;
  wire       [31:0]   axi4LiteToFullAdapter_1_io_lite_rdata;
  wire       [1:0]    axi4LiteToFullAdapter_1_io_lite_rresp;
  wire                axi4LiteToFullAdapter_1_io_lite_bvalid;
  wire       [1:0]    axi4LiteToFullAdapter_1_io_lite_bresp;
  wire                axi4LiteToFullAdapter_1_io_full_arvalid;
  wire       [31:0]   axi4LiteToFullAdapter_1_io_full_araddr;
  wire       [0:0]    axi4LiteToFullAdapter_1_io_full_arid;
  wire       [3:0]    axi4LiteToFullAdapter_1_io_full_arregion;
  wire       [7:0]    axi4LiteToFullAdapter_1_io_full_arlen;
  wire       [2:0]    axi4LiteToFullAdapter_1_io_full_arsize;
  wire       [1:0]    axi4LiteToFullAdapter_1_io_full_arburst;
  wire       [0:0]    axi4LiteToFullAdapter_1_io_full_arlock;
  wire       [3:0]    axi4LiteToFullAdapter_1_io_full_arcache;
  wire       [3:0]    axi4LiteToFullAdapter_1_io_full_arqos;
  wire       [2:0]    axi4LiteToFullAdapter_1_io_full_arprot;
  wire                axi4LiteToFullAdapter_1_io_full_awvalid;
  wire       [31:0]   axi4LiteToFullAdapter_1_io_full_awaddr;
  wire       [0:0]    axi4LiteToFullAdapter_1_io_full_awid;
  wire       [3:0]    axi4LiteToFullAdapter_1_io_full_awregion;
  wire       [7:0]    axi4LiteToFullAdapter_1_io_full_awlen;
  wire       [2:0]    axi4LiteToFullAdapter_1_io_full_awsize;
  wire       [1:0]    axi4LiteToFullAdapter_1_io_full_awburst;
  wire       [0:0]    axi4LiteToFullAdapter_1_io_full_awlock;
  wire       [3:0]    axi4LiteToFullAdapter_1_io_full_awcache;
  wire       [3:0]    axi4LiteToFullAdapter_1_io_full_awqos;
  wire       [2:0]    axi4LiteToFullAdapter_1_io_full_awprot;
  wire                axi4LiteToFullAdapter_1_io_full_wvalid;
  wire       [31:0]   axi4LiteToFullAdapter_1_io_full_wdata;
  wire       [3:0]    axi4LiteToFullAdapter_1_io_full_wstrb;
  wire                axi4LiteToFullAdapter_1_io_full_wlast;
  wire                axi4LiteToFullAdapter_1_io_full_rready;
  wire                axi4LiteToFullAdapter_1_io_full_bready;
  wire                axi4FullToLiteAdapter_2_io_full_arready;
  wire                axi4FullToLiteAdapter_2_io_full_awready;
  wire                axi4FullToLiteAdapter_2_io_full_wready;
  wire                axi4FullToLiteAdapter_2_io_full_rvalid;
  wire       [31:0]   axi4FullToLiteAdapter_2_io_full_rdata;
  wire       [1:0]    axi4FullToLiteAdapter_2_io_full_rid;
  wire       [1:0]    axi4FullToLiteAdapter_2_io_full_rresp;
  wire                axi4FullToLiteAdapter_2_io_full_rlast;
  wire                axi4FullToLiteAdapter_2_io_full_bvalid;
  wire       [1:0]    axi4FullToLiteAdapter_2_io_full_bid;
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
  wire       [1:0]    axi4FullToLiteAdapter_3_io_full_rid;
  wire       [1:0]    axi4FullToLiteAdapter_3_io_full_rresp;
  wire                axi4FullToLiteAdapter_3_io_full_rlast;
  wire                axi4FullToLiteAdapter_3_io_full_bvalid;
  wire       [1:0]    axi4FullToLiteAdapter_3_io_full_bid;
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
    .io_masters_0_awvalid          (io_masters_0_awvalid                                 ), //i
    .io_masters_0_awready          (xbar_io_masters_0_awready                            ), //o
    .io_masters_0_awaddr   (io_masters_0_awaddr[31:0]                    ), //i
    .io_masters_0_awid     (io_masters_0_awid                            ), //i
    .io_masters_0_awregion (io_masters_0_awregion[3:0]                   ), //i
    .io_masters_0_awlen    (io_masters_0_awlen[7:0]                      ), //i
    .io_masters_0_awsize   (io_masters_0_awsize[2:0]                     ), //i
    .io_masters_0_awburst  (io_masters_0_awburst[1:0]                    ), //i
    .io_masters_0_awlock   (io_masters_0_awlock                          ), //i
    .io_masters_0_awcache  (io_masters_0_awcache[3:0]                    ), //i
    .io_masters_0_awqos    (io_masters_0_awqos[3:0]                      ), //i
    .io_masters_0_awprot   (io_masters_0_awprot[2:0]                     ), //i
    .io_masters_0_wvalid           (io_masters_0_wvalid                                  ), //i
    .io_masters_0_wready           (xbar_io_masters_0_wready                             ), //o
    .io_masters_0_wdata    (io_masters_0_wdata[31:0]                     ), //i
    .io_masters_0_wstrb    (io_masters_0_wstrb[3:0]                      ), //i
    .io_masters_0_wlast    (io_masters_0_wlast                           ), //i
    .io_masters_0_bvalid           (xbar_io_masters_0_bvalid                             ), //o
    .io_masters_0_bready           (io_masters_0_bready                                  ), //i
    .io_masters_0_bid      (xbar_io_masters_0_bid                        ), //o
    .io_masters_0_bresp    (xbar_io_masters_0_bresp[1:0]                 ), //o
    .io_masters_0_arvalid          (io_masters_0_arvalid                                 ), //i
    .io_masters_0_arready          (xbar_io_masters_0_arready                            ), //o
    .io_masters_0_araddr   (io_masters_0_araddr[31:0]                    ), //i
    .io_masters_0_arid     (io_masters_0_arid                            ), //i
    .io_masters_0_arregion (io_masters_0_arregion[3:0]                   ), //i
    .io_masters_0_arlen    (io_masters_0_arlen[7:0]                      ), //i
    .io_masters_0_arsize   (io_masters_0_arsize[2:0]                     ), //i
    .io_masters_0_arburst  (io_masters_0_arburst[1:0]                    ), //i
    .io_masters_0_arlock   (io_masters_0_arlock                          ), //i
    .io_masters_0_arcache  (io_masters_0_arcache[3:0]                    ), //i
    .io_masters_0_arqos    (io_masters_0_arqos[3:0]                      ), //i
    .io_masters_0_arprot   (io_masters_0_arprot[2:0]                     ), //i
    .io_masters_0_rvalid           (xbar_io_masters_0_rvalid                             ), //o
    .io_masters_0_rready           (io_masters_0_rready                                  ), //i
    .io_masters_0_rdata    (xbar_io_masters_0_rdata[31:0]                ), //o
    .io_masters_0_rid      (xbar_io_masters_0_rid                        ), //o
    .io_masters_0_rresp    (xbar_io_masters_0_rresp[1:0]                 ), //o
    .io_masters_0_rlast    (xbar_io_masters_0_rlast                      ), //o
    .io_masters_1_awvalid          (axi4LiteToFullAdapter_1_io_full_awvalid              ), //i
    .io_masters_1_awready          (xbar_io_masters_1_awready                            ), //o
    .io_masters_1_awaddr   (axi4LiteToFullAdapter_1_io_full_awaddr[31:0] ), //i
    .io_masters_1_awid     (axi4LiteToFullAdapter_1_io_full_awid         ), //i
    .io_masters_1_awregion (axi4LiteToFullAdapter_1_io_full_awregion[3:0]), //i
    .io_masters_1_awlen    (axi4LiteToFullAdapter_1_io_full_awlen[7:0]   ), //i
    .io_masters_1_awsize   (axi4LiteToFullAdapter_1_io_full_awsize[2:0]  ), //i
    .io_masters_1_awburst  (axi4LiteToFullAdapter_1_io_full_awburst[1:0] ), //i
    .io_masters_1_awlock   (axi4LiteToFullAdapter_1_io_full_awlock       ), //i
    .io_masters_1_awcache  (axi4LiteToFullAdapter_1_io_full_awcache[3:0] ), //i
    .io_masters_1_awqos    (axi4LiteToFullAdapter_1_io_full_awqos[3:0]   ), //i
    .io_masters_1_awprot   (axi4LiteToFullAdapter_1_io_full_awprot[2:0]  ), //i
    .io_masters_1_wvalid           (axi4LiteToFullAdapter_1_io_full_wvalid               ), //i
    .io_masters_1_wready           (xbar_io_masters_1_wready                             ), //o
    .io_masters_1_wdata    (axi4LiteToFullAdapter_1_io_full_wdata[31:0]  ), //i
    .io_masters_1_wstrb    (axi4LiteToFullAdapter_1_io_full_wstrb[3:0]   ), //i
    .io_masters_1_wlast    (axi4LiteToFullAdapter_1_io_full_wlast        ), //i
    .io_masters_1_bvalid           (xbar_io_masters_1_bvalid                             ), //o
    .io_masters_1_bready           (axi4LiteToFullAdapter_1_io_full_bready               ), //i
    .io_masters_1_bid      (xbar_io_masters_1_bid                        ), //o
    .io_masters_1_bresp    (xbar_io_masters_1_bresp[1:0]                 ), //o
    .io_masters_1_arvalid          (axi4LiteToFullAdapter_1_io_full_arvalid              ), //i
    .io_masters_1_arready          (xbar_io_masters_1_arready                            ), //o
    .io_masters_1_araddr   (axi4LiteToFullAdapter_1_io_full_araddr[31:0] ), //i
    .io_masters_1_arid     (axi4LiteToFullAdapter_1_io_full_arid         ), //i
    .io_masters_1_arregion (axi4LiteToFullAdapter_1_io_full_arregion[3:0]), //i
    .io_masters_1_arlen    (axi4LiteToFullAdapter_1_io_full_arlen[7:0]   ), //i
    .io_masters_1_arsize   (axi4LiteToFullAdapter_1_io_full_arsize[2:0]  ), //i
    .io_masters_1_arburst  (axi4LiteToFullAdapter_1_io_full_arburst[1:0] ), //i
    .io_masters_1_arlock   (axi4LiteToFullAdapter_1_io_full_arlock       ), //i
    .io_masters_1_arcache  (axi4LiteToFullAdapter_1_io_full_arcache[3:0] ), //i
    .io_masters_1_arqos    (axi4LiteToFullAdapter_1_io_full_arqos[3:0]   ), //i
    .io_masters_1_arprot   (axi4LiteToFullAdapter_1_io_full_arprot[2:0]  ), //i
    .io_masters_1_rvalid           (xbar_io_masters_1_rvalid                             ), //o
    .io_masters_1_rready           (axi4LiteToFullAdapter_1_io_full_rready               ), //i
    .io_masters_1_rdata    (xbar_io_masters_1_rdata[31:0]                ), //o
    .io_masters_1_rid      (xbar_io_masters_1_rid                        ), //o
    .io_masters_1_rresp    (xbar_io_masters_1_rresp[1:0]                 ), //o
    .io_masters_1_rlast    (xbar_io_masters_1_rlast                      ), //o
    .io_slaves_0_awvalid           (xbar_io_slaves_0_awvalid                             ), //o
    .io_slaves_0_awready           (io_slaves_0_awready                                  ), //i
    .io_slaves_0_awaddr    (xbar_io_slaves_0_awaddr[31:0]                ), //o
    .io_slaves_0_awid      (xbar_io_slaves_0_awid[1:0]                   ), //o
    .io_slaves_0_awregion  (xbar_io_slaves_0_awregion[3:0]               ), //o
    .io_slaves_0_awlen     (xbar_io_slaves_0_awlen[7:0]                  ), //o
    .io_slaves_0_awsize    (xbar_io_slaves_0_awsize[2:0]                 ), //o
    .io_slaves_0_awburst   (xbar_io_slaves_0_awburst[1:0]                ), //o
    .io_slaves_0_awlock    (xbar_io_slaves_0_awlock                      ), //o
    .io_slaves_0_awcache   (xbar_io_slaves_0_awcache[3:0]                ), //o
    .io_slaves_0_awqos     (xbar_io_slaves_0_awqos[3:0]                  ), //o
    .io_slaves_0_awprot    (xbar_io_slaves_0_awprot[2:0]                 ), //o
    .io_slaves_0_wvalid            (xbar_io_slaves_0_wvalid                              ), //o
    .io_slaves_0_wready            (io_slaves_0_wready                                   ), //i
    .io_slaves_0_wdata     (xbar_io_slaves_0_wdata[31:0]                 ), //o
    .io_slaves_0_wstrb     (xbar_io_slaves_0_wstrb[3:0]                  ), //o
    .io_slaves_0_wlast     (xbar_io_slaves_0_wlast                       ), //o
    .io_slaves_0_bvalid            (io_slaves_0_bvalid                                   ), //i
    .io_slaves_0_bready            (xbar_io_slaves_0_bready                              ), //o
    .io_slaves_0_bid       (io_slaves_0_bid[1:0]                         ), //i
    .io_slaves_0_bresp     (io_slaves_0_bresp[1:0]                       ), //i
    .io_slaves_0_arvalid           (xbar_io_slaves_0_arvalid                             ), //o
    .io_slaves_0_arready           (io_slaves_0_arready                                  ), //i
    .io_slaves_0_araddr    (xbar_io_slaves_0_araddr[31:0]                ), //o
    .io_slaves_0_arid      (xbar_io_slaves_0_arid[1:0]                   ), //o
    .io_slaves_0_arregion  (xbar_io_slaves_0_arregion[3:0]               ), //o
    .io_slaves_0_arlen     (xbar_io_slaves_0_arlen[7:0]                  ), //o
    .io_slaves_0_arsize    (xbar_io_slaves_0_arsize[2:0]                 ), //o
    .io_slaves_0_arburst   (xbar_io_slaves_0_arburst[1:0]                ), //o
    .io_slaves_0_arlock    (xbar_io_slaves_0_arlock                      ), //o
    .io_slaves_0_arcache   (xbar_io_slaves_0_arcache[3:0]                ), //o
    .io_slaves_0_arqos     (xbar_io_slaves_0_arqos[3:0]                  ), //o
    .io_slaves_0_arprot    (xbar_io_slaves_0_arprot[2:0]                 ), //o
    .io_slaves_0_rvalid            (io_slaves_0_rvalid                                   ), //i
    .io_slaves_0_rready            (xbar_io_slaves_0_rready                              ), //o
    .io_slaves_0_rdata     (io_slaves_0_rdata[31:0]                      ), //i
    .io_slaves_0_rid       (io_slaves_0_rid[1:0]                         ), //i
    .io_slaves_0_rresp     (io_slaves_0_rresp[1:0]                       ), //i
    .io_slaves_0_rlast     (io_slaves_0_rlast                            ), //i
    .io_slaves_1_awvalid           (xbar_io_slaves_1_awvalid                             ), //o
    .io_slaves_1_awready           (io_slaves_1_awready                                  ), //i
    .io_slaves_1_awaddr    (xbar_io_slaves_1_awaddr[31:0]                ), //o
    .io_slaves_1_awid      (xbar_io_slaves_1_awid[1:0]                   ), //o
    .io_slaves_1_awregion  (xbar_io_slaves_1_awregion[3:0]               ), //o
    .io_slaves_1_awlen     (xbar_io_slaves_1_awlen[7:0]                  ), //o
    .io_slaves_1_awsize    (xbar_io_slaves_1_awsize[2:0]                 ), //o
    .io_slaves_1_awburst   (xbar_io_slaves_1_awburst[1:0]                ), //o
    .io_slaves_1_awlock    (xbar_io_slaves_1_awlock                      ), //o
    .io_slaves_1_awcache   (xbar_io_slaves_1_awcache[3:0]                ), //o
    .io_slaves_1_awqos     (xbar_io_slaves_1_awqos[3:0]                  ), //o
    .io_slaves_1_awprot    (xbar_io_slaves_1_awprot[2:0]                 ), //o
    .io_slaves_1_wvalid            (xbar_io_slaves_1_wvalid                              ), //o
    .io_slaves_1_wready            (io_slaves_1_wready                                   ), //i
    .io_slaves_1_wdata     (xbar_io_slaves_1_wdata[31:0]                 ), //o
    .io_slaves_1_wstrb     (xbar_io_slaves_1_wstrb[3:0]                  ), //o
    .io_slaves_1_wlast     (xbar_io_slaves_1_wlast                       ), //o
    .io_slaves_1_bvalid            (io_slaves_1_bvalid                                   ), //i
    .io_slaves_1_bready            (xbar_io_slaves_1_bready                              ), //o
    .io_slaves_1_bid       (io_slaves_1_bid[1:0]                         ), //i
    .io_slaves_1_bresp     (io_slaves_1_bresp[1:0]                       ), //i
    .io_slaves_1_arvalid           (xbar_io_slaves_1_arvalid                             ), //o
    .io_slaves_1_arready           (io_slaves_1_arready                                  ), //i
    .io_slaves_1_araddr    (xbar_io_slaves_1_araddr[31:0]                ), //o
    .io_slaves_1_arid      (xbar_io_slaves_1_arid[1:0]                   ), //o
    .io_slaves_1_arregion  (xbar_io_slaves_1_arregion[3:0]               ), //o
    .io_slaves_1_arlen     (xbar_io_slaves_1_arlen[7:0]                  ), //o
    .io_slaves_1_arsize    (xbar_io_slaves_1_arsize[2:0]                 ), //o
    .io_slaves_1_arburst   (xbar_io_slaves_1_arburst[1:0]                ), //o
    .io_slaves_1_arlock    (xbar_io_slaves_1_arlock                      ), //o
    .io_slaves_1_arcache   (xbar_io_slaves_1_arcache[3:0]                ), //o
    .io_slaves_1_arqos     (xbar_io_slaves_1_arqos[3:0]                  ), //o
    .io_slaves_1_arprot    (xbar_io_slaves_1_arprot[2:0]                 ), //o
    .io_slaves_1_rvalid            (io_slaves_1_rvalid                                   ), //i
    .io_slaves_1_rready            (xbar_io_slaves_1_rready                              ), //o
    .io_slaves_1_rdata     (io_slaves_1_rdata[31:0]                      ), //i
    .io_slaves_1_rid       (io_slaves_1_rid[1:0]                         ), //i
    .io_slaves_1_rresp     (io_slaves_1_rresp[1:0]                       ), //i
    .io_slaves_1_rlast     (io_slaves_1_rlast                            ), //i
    .io_slaves_2_awvalid           (xbar_io_slaves_2_awvalid                             ), //o
    .io_slaves_2_awready           (axi4FullToLiteAdapter_2_io_full_awready              ), //i
    .io_slaves_2_awaddr    (xbar_io_slaves_2_awaddr[31:0]                ), //o
    .io_slaves_2_awid      (xbar_io_slaves_2_awid[1:0]                   ), //o
    .io_slaves_2_awregion  (xbar_io_slaves_2_awregion[3:0]               ), //o
    .io_slaves_2_awlen     (xbar_io_slaves_2_awlen[7:0]                  ), //o
    .io_slaves_2_awsize    (xbar_io_slaves_2_awsize[2:0]                 ), //o
    .io_slaves_2_awburst   (xbar_io_slaves_2_awburst[1:0]                ), //o
    .io_slaves_2_awlock    (xbar_io_slaves_2_awlock                      ), //o
    .io_slaves_2_awcache   (xbar_io_slaves_2_awcache[3:0]                ), //o
    .io_slaves_2_awqos     (xbar_io_slaves_2_awqos[3:0]                  ), //o
    .io_slaves_2_awprot    (xbar_io_slaves_2_awprot[2:0]                 ), //o
    .io_slaves_2_wvalid            (xbar_io_slaves_2_wvalid                              ), //o
    .io_slaves_2_wready            (axi4FullToLiteAdapter_2_io_full_wready               ), //i
    .io_slaves_2_wdata     (xbar_io_slaves_2_wdata[31:0]                 ), //o
    .io_slaves_2_wstrb     (xbar_io_slaves_2_wstrb[3:0]                  ), //o
    .io_slaves_2_wlast     (xbar_io_slaves_2_wlast                       ), //o
    .io_slaves_2_bvalid            (axi4FullToLiteAdapter_2_io_full_bvalid               ), //i
    .io_slaves_2_bready            (xbar_io_slaves_2_bready                              ), //o
    .io_slaves_2_bid       (axi4FullToLiteAdapter_2_io_full_bid[1:0]     ), //i
    .io_slaves_2_bresp     (axi4FullToLiteAdapter_2_io_full_bresp[1:0]   ), //i
    .io_slaves_2_arvalid           (xbar_io_slaves_2_arvalid                             ), //o
    .io_slaves_2_arready           (axi4FullToLiteAdapter_2_io_full_arready              ), //i
    .io_slaves_2_araddr    (xbar_io_slaves_2_araddr[31:0]                ), //o
    .io_slaves_2_arid      (xbar_io_slaves_2_arid[1:0]                   ), //o
    .io_slaves_2_arregion  (xbar_io_slaves_2_arregion[3:0]               ), //o
    .io_slaves_2_arlen     (xbar_io_slaves_2_arlen[7:0]                  ), //o
    .io_slaves_2_arsize    (xbar_io_slaves_2_arsize[2:0]                 ), //o
    .io_slaves_2_arburst   (xbar_io_slaves_2_arburst[1:0]                ), //o
    .io_slaves_2_arlock    (xbar_io_slaves_2_arlock                      ), //o
    .io_slaves_2_arcache   (xbar_io_slaves_2_arcache[3:0]                ), //o
    .io_slaves_2_arqos     (xbar_io_slaves_2_arqos[3:0]                  ), //o
    .io_slaves_2_arprot    (xbar_io_slaves_2_arprot[2:0]                 ), //o
    .io_slaves_2_rvalid            (axi4FullToLiteAdapter_2_io_full_rvalid               ), //i
    .io_slaves_2_rready            (xbar_io_slaves_2_rready                              ), //o
    .io_slaves_2_rdata     (axi4FullToLiteAdapter_2_io_full_rdata[31:0]  ), //i
    .io_slaves_2_rid       (axi4FullToLiteAdapter_2_io_full_rid[1:0]     ), //i
    .io_slaves_2_rresp     (axi4FullToLiteAdapter_2_io_full_rresp[1:0]   ), //i
    .io_slaves_2_rlast     (axi4FullToLiteAdapter_2_io_full_rlast        ), //i
    .io_slaves_3_awvalid           (xbar_io_slaves_3_awvalid                             ), //o
    .io_slaves_3_awready           (axi4FullToLiteAdapter_3_io_full_awready              ), //i
    .io_slaves_3_awaddr    (xbar_io_slaves_3_awaddr[31:0]                ), //o
    .io_slaves_3_awid      (xbar_io_slaves_3_awid[1:0]                   ), //o
    .io_slaves_3_awregion  (xbar_io_slaves_3_awregion[3:0]               ), //o
    .io_slaves_3_awlen     (xbar_io_slaves_3_awlen[7:0]                  ), //o
    .io_slaves_3_awsize    (xbar_io_slaves_3_awsize[2:0]                 ), //o
    .io_slaves_3_awburst   (xbar_io_slaves_3_awburst[1:0]                ), //o
    .io_slaves_3_awlock    (xbar_io_slaves_3_awlock                      ), //o
    .io_slaves_3_awcache   (xbar_io_slaves_3_awcache[3:0]                ), //o
    .io_slaves_3_awqos     (xbar_io_slaves_3_awqos[3:0]                  ), //o
    .io_slaves_3_awprot    (xbar_io_slaves_3_awprot[2:0]                 ), //o
    .io_slaves_3_wvalid            (xbar_io_slaves_3_wvalid                              ), //o
    .io_slaves_3_wready            (axi4FullToLiteAdapter_3_io_full_wready               ), //i
    .io_slaves_3_wdata     (xbar_io_slaves_3_wdata[31:0]                 ), //o
    .io_slaves_3_wstrb     (xbar_io_slaves_3_wstrb[3:0]                  ), //o
    .io_slaves_3_wlast     (xbar_io_slaves_3_wlast                       ), //o
    .io_slaves_3_bvalid            (axi4FullToLiteAdapter_3_io_full_bvalid               ), //i
    .io_slaves_3_bready            (xbar_io_slaves_3_bready                              ), //o
    .io_slaves_3_bid       (axi4FullToLiteAdapter_3_io_full_bid[1:0]     ), //i
    .io_slaves_3_bresp     (axi4FullToLiteAdapter_3_io_full_bresp[1:0]   ), //i
    .io_slaves_3_arvalid           (xbar_io_slaves_3_arvalid                             ), //o
    .io_slaves_3_arready           (axi4FullToLiteAdapter_3_io_full_arready              ), //i
    .io_slaves_3_araddr    (xbar_io_slaves_3_araddr[31:0]                ), //o
    .io_slaves_3_arid      (xbar_io_slaves_3_arid[1:0]                   ), //o
    .io_slaves_3_arregion  (xbar_io_slaves_3_arregion[3:0]               ), //o
    .io_slaves_3_arlen     (xbar_io_slaves_3_arlen[7:0]                  ), //o
    .io_slaves_3_arsize    (xbar_io_slaves_3_arsize[2:0]                 ), //o
    .io_slaves_3_arburst   (xbar_io_slaves_3_arburst[1:0]                ), //o
    .io_slaves_3_arlock    (xbar_io_slaves_3_arlock                      ), //o
    .io_slaves_3_arcache   (xbar_io_slaves_3_arcache[3:0]                ), //o
    .io_slaves_3_arqos     (xbar_io_slaves_3_arqos[3:0]                  ), //o
    .io_slaves_3_arprot    (xbar_io_slaves_3_arprot[2:0]                 ), //o
    .io_slaves_3_rvalid            (axi4FullToLiteAdapter_3_io_full_rvalid               ), //i
    .io_slaves_3_rready            (xbar_io_slaves_3_rready                              ), //o
    .io_slaves_3_rdata     (axi4FullToLiteAdapter_3_io_full_rdata[31:0]  ), //i
    .io_slaves_3_rid       (axi4FullToLiteAdapter_3_io_full_rid[1:0]     ), //i
    .io_slaves_3_rresp     (axi4FullToLiteAdapter_3_io_full_rresp[1:0]   ), //i
    .io_slaves_3_rlast     (axi4FullToLiteAdapter_3_io_full_rlast        ), //i
    .clk                            (clk                                                   ), //i
    .resetn                         (resetn                                                )  //i
  );
  Axi4LiteToFullAdapter axi4LiteToFullAdapter_1 (
    .io_lite_awvalid          (io_masters_1_awvalid                                 ), //i
    .io_lite_awready          (axi4LiteToFullAdapter_1_io_lite_awready              ), //o
    .io_lite_awaddr   (io_masters_1_awaddr[31:0]                    ), //i
    .io_lite_awprot   (io_masters_1_awprot[2:0]                     ), //i
    .io_lite_wvalid           (io_masters_1_wvalid                                  ), //i
    .io_lite_wready           (axi4LiteToFullAdapter_1_io_lite_wready               ), //o
    .io_lite_wdata    (io_masters_1_wdata[31:0]                     ), //i
    .io_lite_wstrb    (io_masters_1_wstrb[3:0]                      ), //i
    .io_lite_bvalid           (axi4LiteToFullAdapter_1_io_lite_bvalid               ), //o
    .io_lite_bready           (io_masters_1_bready                                  ), //i
    .io_lite_bresp    (axi4LiteToFullAdapter_1_io_lite_bresp[1:0]   ), //o
    .io_lite_arvalid          (io_masters_1_arvalid                                 ), //i
    .io_lite_arready          (axi4LiteToFullAdapter_1_io_lite_arready              ), //o
    .io_lite_araddr   (io_masters_1_araddr[31:0]                    ), //i
    .io_lite_arprot   (io_masters_1_arprot[2:0]                     ), //i
    .io_lite_rvalid           (axi4LiteToFullAdapter_1_io_lite_rvalid               ), //o
    .io_lite_rready           (io_masters_1_rready                                  ), //i
    .io_lite_rdata    (axi4LiteToFullAdapter_1_io_lite_rdata[31:0]  ), //o
    .io_lite_rresp    (axi4LiteToFullAdapter_1_io_lite_rresp[1:0]   ), //o
    .io_full_awvalid          (axi4LiteToFullAdapter_1_io_full_awvalid              ), //o
    .io_full_awready          (xbar_io_masters_1_awready                            ), //i
    .io_full_awaddr   (axi4LiteToFullAdapter_1_io_full_awaddr[31:0] ), //o
    .io_full_awid     (axi4LiteToFullAdapter_1_io_full_awid         ), //o
    .io_full_awregion (axi4LiteToFullAdapter_1_io_full_awregion[3:0]), //o
    .io_full_awlen    (axi4LiteToFullAdapter_1_io_full_awlen[7:0]   ), //o
    .io_full_awsize   (axi4LiteToFullAdapter_1_io_full_awsize[2:0]  ), //o
    .io_full_awburst  (axi4LiteToFullAdapter_1_io_full_awburst[1:0] ), //o
    .io_full_awlock   (axi4LiteToFullAdapter_1_io_full_awlock       ), //o
    .io_full_awcache  (axi4LiteToFullAdapter_1_io_full_awcache[3:0] ), //o
    .io_full_awqos    (axi4LiteToFullAdapter_1_io_full_awqos[3:0]   ), //o
    .io_full_awprot   (axi4LiteToFullAdapter_1_io_full_awprot[2:0]  ), //o
    .io_full_wvalid           (axi4LiteToFullAdapter_1_io_full_wvalid               ), //o
    .io_full_wready           (xbar_io_masters_1_wready                             ), //i
    .io_full_wdata    (axi4LiteToFullAdapter_1_io_full_wdata[31:0]  ), //o
    .io_full_wstrb    (axi4LiteToFullAdapter_1_io_full_wstrb[3:0]   ), //o
    .io_full_wlast    (axi4LiteToFullAdapter_1_io_full_wlast        ), //o
    .io_full_bvalid           (xbar_io_masters_1_bvalid                             ), //i
    .io_full_bready           (axi4LiteToFullAdapter_1_io_full_bready               ), //o
    .io_full_bid      (xbar_io_masters_1_bid                        ), //i
    .io_full_bresp    (xbar_io_masters_1_bresp[1:0]                 ), //i
    .io_full_arvalid          (axi4LiteToFullAdapter_1_io_full_arvalid              ), //o
    .io_full_arready          (xbar_io_masters_1_arready                            ), //i
    .io_full_araddr   (axi4LiteToFullAdapter_1_io_full_araddr[31:0] ), //o
    .io_full_arid     (axi4LiteToFullAdapter_1_io_full_arid         ), //o
    .io_full_arregion (axi4LiteToFullAdapter_1_io_full_arregion[3:0]), //o
    .io_full_arlen    (axi4LiteToFullAdapter_1_io_full_arlen[7:0]   ), //o
    .io_full_arsize   (axi4LiteToFullAdapter_1_io_full_arsize[2:0]  ), //o
    .io_full_arburst  (axi4LiteToFullAdapter_1_io_full_arburst[1:0] ), //o
    .io_full_arlock   (axi4LiteToFullAdapter_1_io_full_arlock       ), //o
    .io_full_arcache  (axi4LiteToFullAdapter_1_io_full_arcache[3:0] ), //o
    .io_full_arqos    (axi4LiteToFullAdapter_1_io_full_arqos[3:0]   ), //o
    .io_full_arprot   (axi4LiteToFullAdapter_1_io_full_arprot[2:0]  ), //o
    .io_full_rvalid           (xbar_io_masters_1_rvalid                             ), //i
    .io_full_rready           (axi4LiteToFullAdapter_1_io_full_rready               ), //o
    .io_full_rdata    (xbar_io_masters_1_rdata[31:0]                ), //i
    .io_full_rid      (xbar_io_masters_1_rid                        ), //i
    .io_full_rresp    (xbar_io_masters_1_rresp[1:0]                 ), //i
    .io_full_rlast    (xbar_io_masters_1_rlast                      )  //i
  );
  Axi4FullToLiteAdapter axi4FullToLiteAdapter_2 (
    .io_full_awvalid          (xbar_io_slaves_2_awvalid                            ), //i
    .io_full_awready          (axi4FullToLiteAdapter_2_io_full_awready             ), //o
    .io_full_awaddr   (xbar_io_slaves_2_awaddr[31:0]               ), //i
    .io_full_awid     (xbar_io_slaves_2_awid[1:0]                  ), //i
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
    .io_full_bid      (axi4FullToLiteAdapter_2_io_full_bid[1:0]    ), //o
    .io_full_bresp    (axi4FullToLiteAdapter_2_io_full_bresp[1:0]  ), //o
    .io_full_arvalid          (xbar_io_slaves_2_arvalid                            ), //i
    .io_full_arready          (axi4FullToLiteAdapter_2_io_full_arready             ), //o
    .io_full_araddr   (xbar_io_slaves_2_araddr[31:0]               ), //i
    .io_full_arid     (xbar_io_slaves_2_arid[1:0]                  ), //i
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
    .io_full_rid      (axi4FullToLiteAdapter_2_io_full_rid[1:0]    ), //o
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
    .io_full_awid     (xbar_io_slaves_3_awid[1:0]                  ), //i
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
    .io_full_bid      (axi4FullToLiteAdapter_3_io_full_bid[1:0]    ), //o
    .io_full_bresp    (axi4FullToLiteAdapter_3_io_full_bresp[1:0]  ), //o
    .io_full_arvalid          (xbar_io_slaves_3_arvalid                            ), //i
    .io_full_arready          (axi4FullToLiteAdapter_3_io_full_arready             ), //o
    .io_full_araddr   (xbar_io_slaves_3_araddr[31:0]               ), //i
    .io_full_arid     (xbar_io_slaves_3_arid[1:0]                  ), //i
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
    .io_full_rid      (axi4FullToLiteAdapter_3_io_full_rid[1:0]    ), //o
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
  assign io_masters_1_awready = axi4LiteToFullAdapter_1_io_lite_awready;
  assign io_masters_1_wready = axi4LiteToFullAdapter_1_io_lite_wready;
  assign io_masters_1_bvalid = axi4LiteToFullAdapter_1_io_lite_bvalid;
  assign io_masters_1_bresp = axi4LiteToFullAdapter_1_io_lite_bresp;
  assign io_masters_1_arready = axi4LiteToFullAdapter_1_io_lite_arready;
  assign io_masters_1_rvalid = axi4LiteToFullAdapter_1_io_lite_rvalid;
  assign io_masters_1_rdata = axi4LiteToFullAdapter_1_io_lite_rdata;
  assign io_masters_1_rresp = axi4LiteToFullAdapter_1_io_lite_rresp;
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
  wire                wSlots_0_io_push_valid;
  reg                 wSlots_0_io_pop_ready;
  wire                wSlots_1_io_push_valid;
  reg                 wSlots_1_io_pop_ready;
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
  wire                when_Axi3ToAxi4Adapter_l208;
  wire                when_Axi3ToAxi4Adapter_l208_1;
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
  wire                when_Axi3ToAxi4Adapter_l253;
  wire                when_Axi3ToAxi4Adapter_l253_1;
  wire                io_axi4_w_fire;
  wire                when_Axi3ToAxi4Adapter_l294;
  wire                when_Axi3ToAxi4Adapter_l313;
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
    .io_flush               (1'b0                               ), //i
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
    .io_flush             (1'b0                              ), //i
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
    .io_flush             (1'b0                              ), //i
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
  assign _zz_io_axi4_araddr = 62'h0;
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
    if(when_Axi3ToAxi4Adapter_l208) begin
      io_axi3_wready = wSlots_0_io_push_ready;
    end
    if(when_Axi3ToAxi4Adapter_l208_1) begin
      io_axi3_wready = wSlots_1_io_push_ready;
    end
  end

  assign when_Axi3ToAxi4Adapter_l208 = (io_axi3_wid == 1'b0);
  assign when_Axi3ToAxi4Adapter_l208_1 = (io_axi3_wid == 1'b1);
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

  assign _zz_io_axi4_awaddr = 62'h0;
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

  assign _zz_io_axi4_wdata = 37'h0;
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
    drainBeat_data = 32'h0;
    if(when_Axi3ToAxi4Adapter_l253) begin
      drainBeat_data = wSlots_0_io_popdata;
    end
    if(when_Axi3ToAxi4Adapter_l253_1) begin
      drainBeat_data = wSlots_1_io_popdata;
    end
  end

  always @(*) begin
    drainBeat_strb = 4'b0000;
    if(when_Axi3ToAxi4Adapter_l253) begin
      drainBeat_strb = wSlots_0_io_popstrb;
    end
    if(when_Axi3ToAxi4Adapter_l253_1) begin
      drainBeat_strb = wSlots_1_io_popstrb;
    end
  end

  always @(*) begin
    drainBeat_last = 1'b0;
    if(when_Axi3ToAxi4Adapter_l253) begin
      drainBeat_last = wSlots_0_io_poplast;
    end
    if(when_Axi3ToAxi4Adapter_l253_1) begin
      drainBeat_last = wSlots_1_io_poplast;
    end
  end

  always @(*) begin
    slotValid = 1'b0;
    if(when_Axi3ToAxi4Adapter_l253) begin
      slotValid = wSlots_0_io_pop_valid;
    end
    if(when_Axi3ToAxi4Adapter_l253_1) begin
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
    if(when_Axi3ToAxi4Adapter_l253) begin
      wSlots_0_io_pop_ready = drainReady;
    end
  end

  assign when_Axi3ToAxi4Adapter_l253 = (curCmd_id == 1'b0);
  always @(*) begin
    wSlots_1_io_pop_ready = 1'b0;
    if(when_Axi3ToAxi4Adapter_l253_1) begin
      wSlots_1_io_pop_ready = drainReady;
    end
  end

  assign when_Axi3ToAxi4Adapter_l253_1 = (curCmd_id == 1'b1);
  assign io_axi4_w_fire = (io_axi4_wvalid && io_axi4_wready);
  assign when_Axi3ToAxi4Adapter_l294 = (io_axi4_w_fire && drainBeat_last);
  assign when_Axi3ToAxi4Adapter_l313 = (io_axi4_w_fire && drainBeat_last);
  assign io_axi3_b_fire = (io_axi3_bvalid && io_axi3_bready);
  assign io_axi3_bvalid = (io_axi4_bvalid && (state == FsmState_WAIT_B));
  assign io_axi4_bready = (io_axi3_bready && (state == FsmState_WAIT_B));
  assign io_axi3_bid = io_axi4_bid;
  assign io_axi3_bresp = (curCmd_locked ? 2'b10 : io_axi4_bresp);
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
            if(when_Axi3ToAxi4Adapter_l294) begin
              state <= FsmState_WAIT_B;
            end else begin
              state <= FsmState_DRAIN_W;
            end
          end
        end
        FsmState_DRAIN_W : begin
          if(when_Axi3ToAxi4Adapter_l313) begin
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
  input  wire [1:0]    io_full_awid,
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
  output reg  [1:0]    io_full_bid,
  output reg  [1:0]    io_full_bresp,
  input  wire          io_full_arvalid,
  output wire          io_full_arready,
  input  wire [31:0]   io_full_araddr,
  input  wire [1:0]    io_full_arid,
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
  output reg  [1:0]    io_full_rid,
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
  reg        [1:0]    _zz_io_full_bid;
  reg                 _zz_1;
  wire                io_full_aw_fire;
  wire                io_full_b_fire;
  wire       [3:0]    _zz_io_full_bid_1;
  wire       [35:0]   _zz_io_lite_wdata;
  wire       [34:0]   _zz_io_lite_araddr;
  reg        [1:0]    _zz_io_full_rid;
  reg                 _zz_2;
  wire                io_full_ar_fire;
  wire                io_full_r_fire;
  wire                when_Axi4FullToLiteAdapter_l96;
  wire       [36:0]   _zz_io_full_rdata;

  assign io_lite_awvalid = io_full_awvalid;
  assign _zz_io_lite_awaddr = 35'h0;
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
  assign io_full_b_fire = (io_full_bvalid && io_full_bready);
  assign io_full_bvalid = io_lite_bvalid;
  assign _zz_io_full_bid_1 = 4'b0000;
  always @(*) begin
    io_full_bid = _zz_io_full_bid_1[1 : 0];
    io_full_bid = (io_full_aw_fire ? io_full_awid : _zz_io_full_bid);
  end

  always @(*) begin
    io_full_bresp = _zz_io_full_bid_1[3 : 2];
    io_full_bresp = io_lite_bresp;
  end

  assign io_lite_bready = io_full_bready;
  assign io_lite_wvalid = io_full_wvalid;
  assign _zz_io_lite_wdata = 36'h0;
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
  assign _zz_io_lite_araddr = 35'h0;
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
  assign io_full_r_fire = (io_full_rvalid && io_full_rready);
  assign when_Axi4FullToLiteAdapter_l96 = (io_full_r_fire && io_full_rlast);
  assign io_full_rvalid = io_lite_rvalid;
  assign _zz_io_full_rdata = 37'h0;
  always @(*) begin
    io_full_rdata = _zz_io_full_rdata[31 : 0];
    io_full_rdata = io_lite_rdata;
  end

  always @(*) begin
    io_full_rid = _zz_io_full_rdata[33 : 32];
    io_full_rid = (io_full_ar_fire ? io_full_arid : _zz_io_full_rid);
  end

  always @(*) begin
    io_full_rresp = _zz_io_full_rdata[35 : 34];
    io_full_rresp = io_lite_rresp;
  end

  always @(*) begin
    io_full_rlast = _zz_io_full_rdata[36];
    io_full_rlast = 1'b1;
  end

  assign io_lite_rready = io_full_rready;
  always @(posedge clk) begin
    if(!resetn) begin
      _zz_io_full_bid <= 2'b00;
      _zz_1 <= 1'b0;
      _zz_io_full_rid <= 2'b00;
      _zz_2 <= 1'b0;
    end else begin
      if(io_full_aw_fire) begin
        _zz_io_full_bid <= io_full_awid;
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
        _zz_io_full_rid <= io_full_arid;
        _zz_2 <= 1'b1;
      end
      if(when_Axi4FullToLiteAdapter_l96) begin
        _zz_2 <= 1'b0;
      end
      `ifndef SYNTHESIS
        `ifdef FORMAL
          assert((! (_zz_2 && io_full_ar_fire))); // Axi4FullToLiteAdapter.scala:L97
        `else
          if(!(! (_zz_2 && io_full_ar_fire))) begin
            $display("FAILURE Axi4FullToLiteAdapter: new AR while previous read still in-flight"); // Axi4FullToLiteAdapter.scala:L97
            $finish;
          end
        `endif
      `endif
    end
  end


endmodule

module Axi4LiteToFullAdapter (
  input  wire          io_lite_awvalid,
  output wire          io_lite_awready,
  input  wire [31:0]   io_lite_awaddr,
  input  wire [2:0]    io_lite_awprot,
  input  wire          io_lite_wvalid,
  output wire          io_lite_wready,
  input  wire [31:0]   io_lite_wdata,
  input  wire [3:0]    io_lite_wstrb,
  output wire          io_lite_bvalid,
  input  wire          io_lite_bready,
  output reg  [1:0]    io_lite_bresp,
  input  wire          io_lite_arvalid,
  output wire          io_lite_arready,
  input  wire [31:0]   io_lite_araddr,
  input  wire [2:0]    io_lite_arprot,
  output wire          io_lite_rvalid,
  input  wire          io_lite_rready,
  output reg  [31:0]   io_lite_rdata,
  output reg  [1:0]    io_lite_rresp,
  output wire          io_full_awvalid,
  input  wire          io_full_awready,
  output reg  [31:0]   io_full_awaddr,
  output reg  [0:0]    io_full_awid,
  output wire [3:0]    io_full_awregion,
  output reg  [7:0]    io_full_awlen,
  output reg  [2:0]    io_full_awsize,
  output reg  [1:0]    io_full_awburst,
  output wire [0:0]    io_full_awlock,
  output wire [3:0]    io_full_awcache,
  output wire [3:0]    io_full_awqos,
  output reg  [2:0]    io_full_awprot,
  output wire          io_full_wvalid,
  input  wire          io_full_wready,
  output reg  [31:0]   io_full_wdata,
  output reg  [3:0]    io_full_wstrb,
  output reg           io_full_wlast,
  input  wire          io_full_bvalid,
  output wire          io_full_bready,
  input  wire [0:0]    io_full_bid,
  input  wire [1:0]    io_full_bresp,
  output wire          io_full_arvalid,
  input  wire          io_full_arready,
  output reg  [31:0]   io_full_araddr,
  output reg  [0:0]    io_full_arid,
  output wire [3:0]    io_full_arregion,
  output reg  [7:0]    io_full_arlen,
  output reg  [2:0]    io_full_arsize,
  output reg  [1:0]    io_full_arburst,
  output wire [0:0]    io_full_arlock,
  output wire [3:0]    io_full_arcache,
  output wire [3:0]    io_full_arqos,
  output reg  [2:0]    io_full_arprot,
  input  wire          io_full_rvalid,
  output wire          io_full_rready,
  input  wire [31:0]   io_full_rdata,
  input  wire [0:0]    io_full_rid,
  input  wire [1:0]    io_full_rresp,
  input  wire          io_full_rlast
);

  wire       [1:0]    _zz_io_lite_bresp;
  wire       [61:0]   _zz_io_full_awaddr;
  wire       [36:0]   _zz_io_full_wdata;
  wire       [61:0]   _zz_io_full_araddr;
  wire       [33:0]   _zz_io_lite_rdata;

  assign _zz_io_lite_bresp = 2'b00;
  assign io_full_awvalid = io_lite_awvalid;
  assign _zz_io_full_awaddr = 62'h0;
  always @(*) begin
    io_full_awaddr = _zz_io_full_awaddr[31 : 0];
    io_full_awaddr = io_lite_awaddr;
  end

  always @(*) begin
    io_full_awid = _zz_io_full_awaddr[32 : 32];
    io_full_awid = 1'b0;
  end

  assign io_full_awregion = _zz_io_full_awaddr[36 : 33];
  always @(*) begin
    io_full_awlen = _zz_io_full_awaddr[44 : 37];
    io_full_awlen = 8'h0;
  end

  always @(*) begin
    io_full_awsize = _zz_io_full_awaddr[47 : 45];
    io_full_awsize = 3'b010;
  end

  always @(*) begin
    io_full_awburst = _zz_io_full_awaddr[49 : 48];
    io_full_awburst = 2'b01;
  end

  assign io_full_awlock = _zz_io_full_awaddr[50 : 50];
  assign io_full_awcache = _zz_io_full_awaddr[54 : 51];
  assign io_full_awqos = _zz_io_full_awaddr[58 : 55];
  always @(*) begin
    io_full_awprot = _zz_io_full_awaddr[61 : 59];
    io_full_awprot = io_lite_awprot;
  end

  assign io_lite_awready = io_full_awready;
  assign io_full_wvalid = io_lite_wvalid;
  assign _zz_io_full_wdata = 37'h0;
  always @(*) begin
    io_full_wdata = _zz_io_full_wdata[31 : 0];
    io_full_wdata = io_lite_wdata;
  end

  always @(*) begin
    io_full_wstrb = _zz_io_full_wdata[35 : 32];
    io_full_wstrb = io_lite_wstrb;
  end

  always @(*) begin
    io_full_wlast = _zz_io_full_wdata[36];
    io_full_wlast = 1'b1;
  end

  assign io_lite_wready = io_full_wready;
  assign io_lite_bvalid = io_full_bvalid;
  always @(*) begin
    io_lite_bresp = _zz_io_lite_bresp[1 : 0];
    io_lite_bresp = io_full_bresp;
  end

  assign io_full_bready = io_lite_bready;
  assign io_full_arvalid = io_lite_arvalid;
  assign _zz_io_full_araddr = 62'h0;
  always @(*) begin
    io_full_araddr = _zz_io_full_araddr[31 : 0];
    io_full_araddr = io_lite_araddr;
  end

  always @(*) begin
    io_full_arid = _zz_io_full_araddr[32 : 32];
    io_full_arid = 1'b0;
  end

  assign io_full_arregion = _zz_io_full_araddr[36 : 33];
  always @(*) begin
    io_full_arlen = _zz_io_full_araddr[44 : 37];
    io_full_arlen = 8'h0;
  end

  always @(*) begin
    io_full_arsize = _zz_io_full_araddr[47 : 45];
    io_full_arsize = 3'b010;
  end

  always @(*) begin
    io_full_arburst = _zz_io_full_araddr[49 : 48];
    io_full_arburst = 2'b01;
  end

  assign io_full_arlock = _zz_io_full_araddr[50 : 50];
  assign io_full_arcache = _zz_io_full_araddr[54 : 51];
  assign io_full_arqos = _zz_io_full_araddr[58 : 55];
  always @(*) begin
    io_full_arprot = _zz_io_full_araddr[61 : 59];
    io_full_arprot = io_lite_arprot;
  end

  assign io_lite_arready = io_full_arready;
  assign io_lite_rvalid = io_full_rvalid;
  assign _zz_io_lite_rdata = 34'h0;
  always @(*) begin
    io_lite_rdata = _zz_io_lite_rdata[31 : 0];
    io_lite_rdata = io_full_rdata;
  end

  always @(*) begin
    io_lite_rresp = _zz_io_lite_rdata[33 : 32];
    io_lite_rresp = io_full_rresp;
  end

  assign io_full_rready = io_lite_rready;

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
  input  wire          io_masters_1_awvalid,
  output reg           io_masters_1_awready,
  input  wire [31:0]   io_masters_1_awaddr,
  input  wire [0:0]    io_masters_1_awid,
  input  wire [3:0]    io_masters_1_awregion,
  input  wire [7:0]    io_masters_1_awlen,
  input  wire [2:0]    io_masters_1_awsize,
  input  wire [1:0]    io_masters_1_awburst,
  input  wire [0:0]    io_masters_1_awlock,
  input  wire [3:0]    io_masters_1_awcache,
  input  wire [3:0]    io_masters_1_awqos,
  input  wire [2:0]    io_masters_1_awprot,
  input  wire          io_masters_1_wvalid,
  output reg           io_masters_1_wready,
  input  wire [31:0]   io_masters_1_wdata,
  input  wire [3:0]    io_masters_1_wstrb,
  input  wire          io_masters_1_wlast,
  output reg           io_masters_1_bvalid,
  input  wire          io_masters_1_bready,
  output reg  [0:0]    io_masters_1_bid,
  output reg  [1:0]    io_masters_1_bresp,
  input  wire          io_masters_1_arvalid,
  output reg           io_masters_1_arready,
  input  wire [31:0]   io_masters_1_araddr,
  input  wire [0:0]    io_masters_1_arid,
  input  wire [3:0]    io_masters_1_arregion,
  input  wire [7:0]    io_masters_1_arlen,
  input  wire [2:0]    io_masters_1_arsize,
  input  wire [1:0]    io_masters_1_arburst,
  input  wire [0:0]    io_masters_1_arlock,
  input  wire [3:0]    io_masters_1_arcache,
  input  wire [3:0]    io_masters_1_arqos,
  input  wire [2:0]    io_masters_1_arprot,
  output reg           io_masters_1_rvalid,
  input  wire          io_masters_1_rready,
  output reg  [31:0]   io_masters_1_rdata,
  output reg  [0:0]    io_masters_1_rid,
  output reg  [1:0]    io_masters_1_rresp,
  output reg           io_masters_1_rlast,
  output reg           io_slaves_0_awvalid,
  input  wire          io_slaves_0_awready,
  output reg  [31:0]   io_slaves_0_awaddr,
  output reg  [1:0]    io_slaves_0_awid,
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
  input  wire [1:0]    io_slaves_0_bid,
  input  wire [1:0]    io_slaves_0_bresp,
  output reg           io_slaves_0_arvalid,
  input  wire          io_slaves_0_arready,
  output reg  [31:0]   io_slaves_0_araddr,
  output reg  [1:0]    io_slaves_0_arid,
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
  input  wire [1:0]    io_slaves_0_rid,
  input  wire [1:0]    io_slaves_0_rresp,
  input  wire          io_slaves_0_rlast,
  output reg           io_slaves_1_awvalid,
  input  wire          io_slaves_1_awready,
  output reg  [31:0]   io_slaves_1_awaddr,
  output reg  [1:0]    io_slaves_1_awid,
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
  input  wire [1:0]    io_slaves_1_bid,
  input  wire [1:0]    io_slaves_1_bresp,
  output reg           io_slaves_1_arvalid,
  input  wire          io_slaves_1_arready,
  output reg  [31:0]   io_slaves_1_araddr,
  output reg  [1:0]    io_slaves_1_arid,
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
  input  wire [1:0]    io_slaves_1_rid,
  input  wire [1:0]    io_slaves_1_rresp,
  input  wire          io_slaves_1_rlast,
  output reg           io_slaves_2_awvalid,
  input  wire          io_slaves_2_awready,
  output reg  [31:0]   io_slaves_2_awaddr,
  output reg  [1:0]    io_slaves_2_awid,
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
  input  wire [1:0]    io_slaves_2_bid,
  input  wire [1:0]    io_slaves_2_bresp,
  output reg           io_slaves_2_arvalid,
  input  wire          io_slaves_2_arready,
  output reg  [31:0]   io_slaves_2_araddr,
  output reg  [1:0]    io_slaves_2_arid,
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
  input  wire [1:0]    io_slaves_2_rid,
  input  wire [1:0]    io_slaves_2_rresp,
  input  wire          io_slaves_2_rlast,
  output reg           io_slaves_3_awvalid,
  input  wire          io_slaves_3_awready,
  output reg  [31:0]   io_slaves_3_awaddr,
  output reg  [1:0]    io_slaves_3_awid,
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
  input  wire [1:0]    io_slaves_3_bid,
  input  wire [1:0]    io_slaves_3_bresp,
  output reg           io_slaves_3_arvalid,
  input  wire          io_slaves_3_arready,
  output reg  [31:0]   io_slaves_3_araddr,
  output reg  [1:0]    io_slaves_3_arid,
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
  input  wire [1:0]    io_slaves_3_rid,
  input  wire [1:0]    io_slaves_3_rresp,
  input  wire          io_slaves_3_rlast,
  input  wire          clk,
  input  wire          resetn
);

  reg                 decErr_io_axi_awvalid;
  reg        [31:0]   decErr_io_axi_awaddr;
  reg        [1:0]    decErr_io_axi_awid;
  wire       [3:0]    decErr_io_axi_awregion;
  reg        [7:0]    decErr_io_axi_awlen;
  reg        [2:0]    decErr_io_axi_awsize;
  reg        [1:0]    decErr_io_axi_awburst;
  reg        [0:0]    decErr_io_axi_awlock;
  reg        [3:0]    decErr_io_axi_awcache;
  reg        [3:0]    decErr_io_axi_awqos;
  reg        [2:0]    decErr_io_axi_awprot;
  reg                 decErr_io_axi_wvalid;
  reg        [31:0]   decErr_io_axi_wdata;
  reg        [3:0]    decErr_io_axi_wstrb;
  reg                 decErr_io_axi_wlast;
  reg                 decErr_io_axi_bready;
  reg                 decErr_io_axi_arvalid;
  reg        [31:0]   decErr_io_axi_araddr;
  reg        [1:0]    decErr_io_axi_arid;
  wire       [3:0]    decErr_io_axi_arregion;
  reg        [7:0]    decErr_io_axi_arlen;
  reg        [2:0]    decErr_io_axi_arsize;
  reg        [1:0]    decErr_io_axi_arburst;
  reg        [0:0]    decErr_io_axi_arlock;
  reg        [3:0]    decErr_io_axi_arcache;
  reg        [3:0]    decErr_io_axi_arqos;
  reg        [2:0]    decErr_io_axi_arprot;
  reg                 decErr_io_axi_rready;
  wire       [0:0]    _zz_6_spinal_port0;
  wire       [0:0]    _zz_7_spinal_port0;
  wire       [0:0]    _zz_8_spinal_port0;
  wire       [0:0]    _zz_9_spinal_port0;
  wire       [0:0]    _zz_10_spinal_port0;
  wire                decErr_io_axi_arready;
  wire                decErr_io_axi_awready;
  wire                decErr_io_axi_wready;
  wire                decErr_io_axi_rvalid;
  wire       [31:0]   decErr_io_axi_rdata;
  wire       [1:0]    decErr_io_axi_rid;
  wire       [1:0]    decErr_io_axi_rresp;
  wire                decErr_io_axi_rlast;
  wire                decErr_io_axi_bvalid;
  wire       [1:0]    decErr_io_axi_bid;
  wire       [1:0]    decErr_io_axi_bresp;
  wire       [4:0]    _zz__zz_when_Axi4Crossbar_l500_5;
  wire       [4:0]    _zz__zz_when_Axi4Crossbar_l500_5_1;
  wire       [1:0]    _zz__zz_when_Axi4Crossbar_l203_4;
  wire       [1:0]    _zz__zz_when_Axi4Crossbar_l203_4_1;
  wire       [1:0]    _zz__zz_11;
  wire       [0:0]    _zz__zz_6_port;
  wire       [1:0]    _zz__zz_when_Axi4Crossbar_l532;
  wire       [4:0]    _zz__zz_when_Axi4Crossbar_l500_8;
  wire       [4:0]    _zz__zz_when_Axi4Crossbar_l500_8_1;
  wire       [1:0]    _zz__zz_when_Axi4Crossbar_l203_9;
  wire       [1:0]    _zz__zz_when_Axi4Crossbar_l203_9_1;
  wire       [1:0]    _zz__zz_12;
  wire       [0:0]    _zz__zz_7_port;
  wire       [1:0]    _zz__zz_when_Axi4Crossbar_l532_1;
  wire       [4:0]    _zz__zz_when_Axi4Crossbar_l500_11;
  wire       [4:0]    _zz__zz_when_Axi4Crossbar_l500_11_1;
  wire       [1:0]    _zz__zz_when_Axi4Crossbar_l203_14;
  wire       [1:0]    _zz__zz_when_Axi4Crossbar_l203_14_1;
  wire       [1:0]    _zz__zz_13;
  wire       [0:0]    _zz__zz_8_port;
  wire       [1:0]    _zz__zz_when_Axi4Crossbar_l532_2;
  wire       [4:0]    _zz__zz_when_Axi4Crossbar_l500_14;
  wire       [4:0]    _zz__zz_when_Axi4Crossbar_l500_14_1;
  wire       [1:0]    _zz__zz_when_Axi4Crossbar_l203_19;
  wire       [1:0]    _zz__zz_when_Axi4Crossbar_l203_19_1;
  wire       [1:0]    _zz__zz_14;
  wire       [0:0]    _zz__zz_9_port;
  wire       [1:0]    _zz__zz_when_Axi4Crossbar_l532_3;
  wire       [4:0]    _zz__zz_when_Axi4Crossbar_l500_17;
  wire       [4:0]    _zz__zz_when_Axi4Crossbar_l500_17_1;
  wire       [1:0]    _zz__zz_when_Axi4Crossbar_l203_24;
  wire       [1:0]    _zz__zz_when_Axi4Crossbar_l203_24_1;
  wire       [1:0]    _zz__zz_15;
  wire       [0:0]    _zz__zz_10_port;
  wire       [1:0]    _zz__zz_when_Axi4Crossbar_l532_4;
  wire       [0:0]    _zz__zz_when_Axi4Crossbar_l584;
  wire       [0:0]    _zz__zz_when_Axi4Crossbar_l584_1;
  wire       [0:0]    _zz__zz_when_Axi4Crossbar_l584_2;
  wire       [0:0]    _zz__zz_when_Axi4Crossbar_l584_3;
  wire       [0:0]    _zz__zz_when_Axi4Crossbar_l584_4;
  wire       [4:0]    _zz__zz_when_Axi4Crossbar_l584_2_1;
  wire       [0:0]    _zz__zz_when_Axi4Crossbar_l584_3_1;
  wire       [0:0]    _zz__zz_when_Axi4Crossbar_l584_3_2;
  wire       [0:0]    _zz__zz_when_Axi4Crossbar_l584_3_3;
  wire       [0:0]    _zz__zz_when_Axi4Crossbar_l584_3_4;
  wire       [0:0]    _zz__zz_when_Axi4Crossbar_l584_3_5;
  wire       [4:0]    _zz__zz_when_Axi4Crossbar_l584_5;
  wire       [4:0]    _zz__zz_when_Axi4Crossbar_l615_5;
  wire       [4:0]    _zz__zz_when_Axi4Crossbar_l615_5_1;
  wire       [1:0]    _zz__zz_when_Axi4Crossbar_l203_29;
  wire       [1:0]    _zz__zz_when_Axi4Crossbar_l203_29_1;
  wire       [4:0]    _zz__zz_when_Axi4Crossbar_l615_8;
  wire       [4:0]    _zz__zz_when_Axi4Crossbar_l615_8_1;
  wire       [1:0]    _zz__zz_when_Axi4Crossbar_l203_34;
  wire       [1:0]    _zz__zz_when_Axi4Crossbar_l203_34_1;
  wire       [4:0]    _zz__zz_when_Axi4Crossbar_l615_11;
  wire       [4:0]    _zz__zz_when_Axi4Crossbar_l615_11_1;
  wire       [1:0]    _zz__zz_when_Axi4Crossbar_l203_39;
  wire       [1:0]    _zz__zz_when_Axi4Crossbar_l203_39_1;
  wire       [4:0]    _zz__zz_when_Axi4Crossbar_l615_14;
  wire       [4:0]    _zz__zz_when_Axi4Crossbar_l615_14_1;
  wire       [1:0]    _zz__zz_when_Axi4Crossbar_l203_44;
  wire       [1:0]    _zz__zz_when_Axi4Crossbar_l203_44_1;
  wire       [4:0]    _zz__zz_when_Axi4Crossbar_l615_17;
  wire       [4:0]    _zz__zz_when_Axi4Crossbar_l615_17_1;
  wire       [1:0]    _zz__zz_when_Axi4Crossbar_l203_49;
  wire       [1:0]    _zz__zz_when_Axi4Crossbar_l203_49_1;
  wire       [0:0]    _zz__zz_when_Axi4Crossbar_l656;
  wire       [0:0]    _zz__zz_when_Axi4Crossbar_l656_1;
  wire       [0:0]    _zz__zz_when_Axi4Crossbar_l656_2;
  wire       [0:0]    _zz__zz_when_Axi4Crossbar_l656_3;
  wire       [0:0]    _zz__zz_when_Axi4Crossbar_l656_4;
  wire       [4:0]    _zz__zz_when_Axi4Crossbar_l656_2_1;
  wire       [0:0]    _zz__zz_when_Axi4Crossbar_l656_3_1;
  wire       [0:0]    _zz__zz_when_Axi4Crossbar_l656_3_2;
  wire       [0:0]    _zz__zz_when_Axi4Crossbar_l656_3_3;
  wire       [0:0]    _zz__zz_when_Axi4Crossbar_l656_3_4;
  wire       [0:0]    _zz__zz_when_Axi4Crossbar_l656_3_5;
  wire       [4:0]    _zz__zz_when_Axi4Crossbar_l656_5;
  reg                 _zz_1;
  reg                 _zz_2;
  reg                 _zz_3;
  reg                 _zz_4;
  reg                 _zz_5;
  reg        [0:0]    wrRrPtr_0;
  reg        [0:0]    wrRrPtr_1;
  reg        [0:0]    wrRrPtr_2;
  reg        [0:0]    wrRrPtr_3;
  reg        [0:0]    wrRrPtr_4;
  reg        [0:0]    rdRrPtr_0;
  reg        [0:0]    rdRrPtr_1;
  reg        [0:0]    rdRrPtr_2;
  reg        [0:0]    rdRrPtr_3;
  reg        [0:0]    rdRrPtr_4;
  wire       [2:0]    _zz_io_masters_0_bid;
  wire       [35:0]   _zz_io_masters_0_rdata;
  wire       [2:0]    _zz_io_masters_1_bid;
  wire       [35:0]   _zz_io_masters_1_rdata;
  wire       [62:0]   _zz_io_slaves_0_awaddr;
  wire       [36:0]   _zz_io_slaves_0_wdata;
  wire       [62:0]   _zz_io_slaves_0_araddr;
  wire       [62:0]   _zz_io_slaves_1_awaddr;
  wire       [36:0]   _zz_io_slaves_1_wdata;
  wire       [62:0]   _zz_io_slaves_1_araddr;
  wire       [62:0]   _zz_io_slaves_2_awaddr;
  wire       [36:0]   _zz_io_slaves_2_wdata;
  wire       [62:0]   _zz_io_slaves_2_araddr;
  wire       [62:0]   _zz_io_slaves_3_awaddr;
  wire       [36:0]   _zz_io_slaves_3_wdata;
  wire       [62:0]   _zz_io_slaves_3_araddr;
  wire       [62:0]   _zz_io_axi_awaddr;
  wire       [36:0]   _zz_io_axi_wdata;
  wire       [62:0]   _zz_io_axi_araddr;
  reg        [2:0]    _zz_when_Axi4Crossbar_l500;
  reg        [2:0]    _zz_when_Axi4Crossbar_l500_1;
  reg        [2:0]    _zz_when_Axi4Crossbar_l500_2;
  reg        [2:0]    _zz_when_Axi4Crossbar_l500_3;
  reg        [2:0]    _zz_when_Axi4Crossbar_l500_4;
  reg        [1:0]    _zz_11;
  reg        [1:0]    _zz_12;
  reg        [1:0]    _zz_13;
  reg        [1:0]    _zz_14;
  reg        [1:0]    _zz_15;
  reg        [1:0]    _zz_when_Axi4Crossbar_l532;
  reg        [1:0]    _zz_when_Axi4Crossbar_l532_1;
  reg        [1:0]    _zz_when_Axi4Crossbar_l532_2;
  reg        [1:0]    _zz_when_Axi4Crossbar_l532_3;
  reg        [1:0]    _zz_when_Axi4Crossbar_l532_4;
  reg        [2:0]    _zz_when_Axi4Crossbar_l509;
  reg        [2:0]    _zz_when_Axi4Crossbar_l509_1;
  reg        [2:0]    _zz_when_Axi4Crossbar_l509_2;
  reg        [2:0]    _zz_when_Axi4Crossbar_l509_3;
  reg        [2:0]    _zz_when_Axi4Crossbar_l509_4;
  reg        [2:0]    _zz_when_Axi4Crossbar_l615;
  reg        [2:0]    _zz_when_Axi4Crossbar_l615_1;
  reg        [2:0]    _zz_when_Axi4Crossbar_l615_2;
  reg        [2:0]    _zz_when_Axi4Crossbar_l615_3;
  reg        [2:0]    _zz_when_Axi4Crossbar_l615_4;
  reg        [1:0]    _zz_when_Axi4Crossbar_l500_5;
  reg        [3:0]    _zz_when_Axi4Crossbar_l500_6;
  reg        [3:0]    _zz_when_Axi4Crossbar_l500_7;
  reg        [1:0]    _zz_when_Axi4Crossbar_l203;
  wire       [1:0]    _zz_when_Axi4Crossbar_l203_1;
  wire       [1:0]    _zz_when_Axi4Crossbar_l203_2;
  wire       [1:0]    _zz_when_Axi4Crossbar_l203_3;
  wire       [1:0]    _zz_when_Axi4Crossbar_l203_4;
  reg        [0:0]    _zz_io_slaves_0_awid;
  wire                when_Axi4Crossbar_l203;
  wire                when_Axi4Crossbar_l203_1;
  wire                when_Axi4Crossbar_l509;
  wire       [0:0]    _zz_when_Axi4Crossbar_l532_5;
  wire                when_Axi4Crossbar_l500;
  wire                when_Axi4Crossbar_l503;
  wire                when_Axi4Crossbar_l503_1;
  wire                io_slaves_0_aw_fire;
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
  reg        [1:0]    _zz_when_Axi4Crossbar_l500_8;
  reg        [3:0]    _zz_when_Axi4Crossbar_l500_9;
  reg        [3:0]    _zz_when_Axi4Crossbar_l500_10;
  reg        [1:0]    _zz_when_Axi4Crossbar_l203_5;
  wire       [1:0]    _zz_when_Axi4Crossbar_l203_6;
  wire       [1:0]    _zz_when_Axi4Crossbar_l203_7;
  wire       [1:0]    _zz_when_Axi4Crossbar_l203_8;
  wire       [1:0]    _zz_when_Axi4Crossbar_l203_9;
  reg        [0:0]    _zz_io_slaves_1_awid;
  wire                when_Axi4Crossbar_l203_2;
  wire                when_Axi4Crossbar_l203_3;
  wire                when_Axi4Crossbar_l509_1;
  wire       [0:0]    _zz_when_Axi4Crossbar_l532_6;
  wire                when_Axi4Crossbar_l500_1;
  wire                when_Axi4Crossbar_l503_2;
  wire                when_Axi4Crossbar_l503_3;
  wire                io_slaves_1_aw_fire;
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
  reg        [1:0]    _zz_when_Axi4Crossbar_l500_11;
  reg        [3:0]    _zz_when_Axi4Crossbar_l500_12;
  reg        [3:0]    _zz_when_Axi4Crossbar_l500_13;
  reg        [1:0]    _zz_when_Axi4Crossbar_l203_10;
  wire       [1:0]    _zz_when_Axi4Crossbar_l203_11;
  wire       [1:0]    _zz_when_Axi4Crossbar_l203_12;
  wire       [1:0]    _zz_when_Axi4Crossbar_l203_13;
  wire       [1:0]    _zz_when_Axi4Crossbar_l203_14;
  reg        [0:0]    _zz_io_slaves_2_awid;
  wire                when_Axi4Crossbar_l203_4;
  wire                when_Axi4Crossbar_l203_5;
  wire                when_Axi4Crossbar_l509_2;
  wire       [0:0]    _zz_when_Axi4Crossbar_l532_7;
  wire                when_Axi4Crossbar_l500_2;
  wire                when_Axi4Crossbar_l503_4;
  wire                when_Axi4Crossbar_l503_5;
  wire                io_slaves_2_aw_fire;
  wire                when_Axi4Crossbar_l530_2;
  wire                when_Axi4Crossbar_l532_4;
  wire                when_Axi4Crossbar_l532_5;
  wire                when_Axi4Crossbar_l547_2;
  wire                io_slaves_2_w_fire;
  wire                when_Axi4Crossbar_l553_2;
  wire                when_Axi4Crossbar_l555_2;
  wire                io_slaves_2_b_fire;
  wire                when_Axi4Crossbar_l562_2;
  wire                when_Axi4Crossbar_l564_2;
  reg        [1:0]    _zz_when_Axi4Crossbar_l500_14;
  reg        [3:0]    _zz_when_Axi4Crossbar_l500_15;
  reg        [3:0]    _zz_when_Axi4Crossbar_l500_16;
  reg        [1:0]    _zz_when_Axi4Crossbar_l203_15;
  wire       [1:0]    _zz_when_Axi4Crossbar_l203_16;
  wire       [1:0]    _zz_when_Axi4Crossbar_l203_17;
  wire       [1:0]    _zz_when_Axi4Crossbar_l203_18;
  wire       [1:0]    _zz_when_Axi4Crossbar_l203_19;
  reg        [0:0]    _zz_io_slaves_3_awid;
  wire                when_Axi4Crossbar_l203_6;
  wire                when_Axi4Crossbar_l203_7;
  wire                when_Axi4Crossbar_l509_3;
  wire       [0:0]    _zz_when_Axi4Crossbar_l532_8;
  wire                when_Axi4Crossbar_l500_3;
  wire                when_Axi4Crossbar_l503_6;
  wire                when_Axi4Crossbar_l503_7;
  wire                io_slaves_3_aw_fire;
  wire                when_Axi4Crossbar_l530_3;
  wire                when_Axi4Crossbar_l532_6;
  wire                when_Axi4Crossbar_l532_7;
  wire                when_Axi4Crossbar_l547_3;
  wire                io_slaves_3_w_fire;
  wire                when_Axi4Crossbar_l553_3;
  wire                when_Axi4Crossbar_l555_3;
  wire                io_slaves_3_b_fire;
  wire                when_Axi4Crossbar_l562_3;
  wire                when_Axi4Crossbar_l564_3;
  reg        [1:0]    _zz_when_Axi4Crossbar_l500_17;
  reg        [3:0]    _zz_when_Axi4Crossbar_l500_18;
  reg        [3:0]    _zz_when_Axi4Crossbar_l500_19;
  reg        [1:0]    _zz_when_Axi4Crossbar_l203_20;
  wire       [1:0]    _zz_when_Axi4Crossbar_l203_21;
  wire       [1:0]    _zz_when_Axi4Crossbar_l203_22;
  wire       [1:0]    _zz_when_Axi4Crossbar_l203_23;
  wire       [1:0]    _zz_when_Axi4Crossbar_l203_24;
  reg        [0:0]    _zz_wrRrPtr_4;
  wire                when_Axi4Crossbar_l203_8;
  wire                when_Axi4Crossbar_l203_9;
  wire                when_Axi4Crossbar_l509_4;
  wire       [0:0]    _zz_when_Axi4Crossbar_l532_9;
  wire                when_Axi4Crossbar_l500_4;
  wire                when_Axi4Crossbar_l503_8;
  wire                when_Axi4Crossbar_l503_9;
  wire                decErr_io_axi_aw_fire;
  wire                when_Axi4Crossbar_l530_4;
  wire                when_Axi4Crossbar_l532_8;
  wire                when_Axi4Crossbar_l532_9;
  wire                when_Axi4Crossbar_l547_4;
  wire                decErr_io_axi_w_fire;
  wire                when_Axi4Crossbar_l553_4;
  wire                when_Axi4Crossbar_l555_4;
  wire                decErr_io_axi_b_fire;
  wire                when_Axi4Crossbar_l562_4;
  wire                when_Axi4Crossbar_l564_4;
  reg        [4:0]    _zz_when_Axi4Crossbar_l584;
  wire       [4:0]    _zz_when_Axi4Crossbar_l584_1;
  wire       [4:0]    _zz_when_Axi4Crossbar_l584_2;
  wire                when_Axi4Crossbar_l584;
  wire                when_Axi4Crossbar_l584_1;
  wire                when_Axi4Crossbar_l584_2;
  wire                when_Axi4Crossbar_l584_3;
  wire                when_Axi4Crossbar_l584_4;
  reg        [4:0]    _zz_when_Axi4Crossbar_l584_3;
  wire       [4:0]    _zz_when_Axi4Crossbar_l584_4;
  wire       [4:0]    _zz_when_Axi4Crossbar_l584_5;
  wire                when_Axi4Crossbar_l584_5;
  wire                when_Axi4Crossbar_l584_6;
  wire                when_Axi4Crossbar_l584_7;
  wire                when_Axi4Crossbar_l584_8;
  wire                when_Axi4Crossbar_l584_9;
  reg        [1:0]    _zz_when_Axi4Crossbar_l615_5;
  reg        [3:0]    _zz_when_Axi4Crossbar_l615_6;
  reg        [3:0]    _zz_when_Axi4Crossbar_l615_7;
  reg        [1:0]    _zz_when_Axi4Crossbar_l203_25;
  wire       [1:0]    _zz_when_Axi4Crossbar_l203_26;
  wire       [1:0]    _zz_when_Axi4Crossbar_l203_27;
  wire       [1:0]    _zz_when_Axi4Crossbar_l203_28;
  wire       [1:0]    _zz_when_Axi4Crossbar_l203_29;
  reg        [0:0]    _zz_io_slaves_0_arid;
  wire                when_Axi4Crossbar_l203_10;
  wire                when_Axi4Crossbar_l203_11;
  wire                when_Axi4Crossbar_l615;
  wire                when_Axi4Crossbar_l618;
  wire                when_Axi4Crossbar_l618_1;
  wire                io_slaves_0_ar_fire;
  wire                _zz_when_Axi4Crossbar_l636;
  wire                io_slaves_0_r_fire;
  wire                when_Axi4Crossbar_l636;
  wire                when_Axi4Crossbar_l638;
  reg        [1:0]    _zz_when_Axi4Crossbar_l615_8;
  reg        [3:0]    _zz_when_Axi4Crossbar_l615_9;
  reg        [3:0]    _zz_when_Axi4Crossbar_l615_10;
  reg        [1:0]    _zz_when_Axi4Crossbar_l203_30;
  wire       [1:0]    _zz_when_Axi4Crossbar_l203_31;
  wire       [1:0]    _zz_when_Axi4Crossbar_l203_32;
  wire       [1:0]    _zz_when_Axi4Crossbar_l203_33;
  wire       [1:0]    _zz_when_Axi4Crossbar_l203_34;
  reg        [0:0]    _zz_io_slaves_1_arid;
  wire                when_Axi4Crossbar_l203_12;
  wire                when_Axi4Crossbar_l203_13;
  wire                when_Axi4Crossbar_l615_1;
  wire                when_Axi4Crossbar_l618_2;
  wire                when_Axi4Crossbar_l618_3;
  wire                io_slaves_1_ar_fire;
  wire                _zz_when_Axi4Crossbar_l636_1;
  wire                io_slaves_1_r_fire;
  wire                when_Axi4Crossbar_l636_1;
  wire                when_Axi4Crossbar_l638_1;
  reg        [1:0]    _zz_when_Axi4Crossbar_l615_11;
  reg        [3:0]    _zz_when_Axi4Crossbar_l615_12;
  reg        [3:0]    _zz_when_Axi4Crossbar_l615_13;
  reg        [1:0]    _zz_when_Axi4Crossbar_l203_35;
  wire       [1:0]    _zz_when_Axi4Crossbar_l203_36;
  wire       [1:0]    _zz_when_Axi4Crossbar_l203_37;
  wire       [1:0]    _zz_when_Axi4Crossbar_l203_38;
  wire       [1:0]    _zz_when_Axi4Crossbar_l203_39;
  reg        [0:0]    _zz_io_slaves_2_arid;
  wire                when_Axi4Crossbar_l203_14;
  wire                when_Axi4Crossbar_l203_15;
  wire                when_Axi4Crossbar_l615_2;
  wire                when_Axi4Crossbar_l618_4;
  wire                when_Axi4Crossbar_l618_5;
  wire                io_slaves_2_ar_fire;
  wire                _zz_when_Axi4Crossbar_l636_2;
  wire                io_slaves_2_r_fire;
  wire                when_Axi4Crossbar_l636_2;
  wire                when_Axi4Crossbar_l638_2;
  reg        [1:0]    _zz_when_Axi4Crossbar_l615_14;
  reg        [3:0]    _zz_when_Axi4Crossbar_l615_15;
  reg        [3:0]    _zz_when_Axi4Crossbar_l615_16;
  reg        [1:0]    _zz_when_Axi4Crossbar_l203_40;
  wire       [1:0]    _zz_when_Axi4Crossbar_l203_41;
  wire       [1:0]    _zz_when_Axi4Crossbar_l203_42;
  wire       [1:0]    _zz_when_Axi4Crossbar_l203_43;
  wire       [1:0]    _zz_when_Axi4Crossbar_l203_44;
  reg        [0:0]    _zz_io_slaves_3_arid;
  wire                when_Axi4Crossbar_l203_16;
  wire                when_Axi4Crossbar_l203_17;
  wire                when_Axi4Crossbar_l615_3;
  wire                when_Axi4Crossbar_l618_6;
  wire                when_Axi4Crossbar_l618_7;
  wire                io_slaves_3_ar_fire;
  wire                _zz_when_Axi4Crossbar_l636_3;
  wire                io_slaves_3_r_fire;
  wire                when_Axi4Crossbar_l636_3;
  wire                when_Axi4Crossbar_l638_3;
  reg        [1:0]    _zz_when_Axi4Crossbar_l615_17;
  reg        [3:0]    _zz_when_Axi4Crossbar_l615_18;
  reg        [3:0]    _zz_when_Axi4Crossbar_l615_19;
  reg        [1:0]    _zz_when_Axi4Crossbar_l203_45;
  wire       [1:0]    _zz_when_Axi4Crossbar_l203_46;
  wire       [1:0]    _zz_when_Axi4Crossbar_l203_47;
  wire       [1:0]    _zz_when_Axi4Crossbar_l203_48;
  wire       [1:0]    _zz_when_Axi4Crossbar_l203_49;
  reg        [0:0]    _zz_rdRrPtr_4;
  wire                when_Axi4Crossbar_l203_18;
  wire                when_Axi4Crossbar_l203_19;
  wire                when_Axi4Crossbar_l615_4;
  wire                when_Axi4Crossbar_l618_8;
  wire                when_Axi4Crossbar_l618_9;
  wire                decErr_io_axi_ar_fire;
  wire                _zz_when_Axi4Crossbar_l636_4;
  wire                decErr_io_axi_r_fire;
  wire                when_Axi4Crossbar_l636_4;
  wire                when_Axi4Crossbar_l638_4;
  reg        [4:0]    _zz_when_Axi4Crossbar_l656;
  wire       [4:0]    _zz_when_Axi4Crossbar_l656_1;
  wire       [4:0]    _zz_when_Axi4Crossbar_l656_2;
  wire                when_Axi4Crossbar_l656;
  wire                when_Axi4Crossbar_l656_1;
  wire                when_Axi4Crossbar_l656_2;
  wire                when_Axi4Crossbar_l656_3;
  wire                when_Axi4Crossbar_l656_4;
  reg        [4:0]    _zz_when_Axi4Crossbar_l656_3;
  wire       [4:0]    _zz_when_Axi4Crossbar_l656_4;
  wire       [4:0]    _zz_when_Axi4Crossbar_l656_5;
  wire                when_Axi4Crossbar_l656_5;
  wire                when_Axi4Crossbar_l656_6;
  wire                when_Axi4Crossbar_l656_7;
  wire                when_Axi4Crossbar_l656_8;
  wire                when_Axi4Crossbar_l656_9;
  (* ram_style = "distributed" *) reg [0:0] _zz_6 [0:3];
  (* ram_style = "distributed" *) reg [0:0] _zz_7 [0:3];
  (* ram_style = "distributed" *) reg [0:0] _zz_8 [0:3];
  (* ram_style = "distributed" *) reg [0:0] _zz_9 [0:3];
  (* ram_style = "distributed" *) reg [0:0] _zz_10 [0:3];

  assign _zz__zz_when_Axi4Crossbar_l500_5 = {(! (|_zz_when_Axi4Crossbar_l500_6)),_zz_when_Axi4Crossbar_l500_6};
  assign _zz__zz_when_Axi4Crossbar_l500_5_1 = {(! (|_zz_when_Axi4Crossbar_l500_7)),_zz_when_Axi4Crossbar_l500_7};
  assign _zz__zz_when_Axi4Crossbar_l203_4 = (_zz_when_Axi4Crossbar_l203_2 - 2'b01);
  assign _zz__zz_when_Axi4Crossbar_l203_4_1 = (_zz_when_Axi4Crossbar_l203_3 - 2'b01);
  assign _zz__zz_11 = (_zz_11 + 2'b01);
  assign _zz__zz_when_Axi4Crossbar_l532 = (_zz_when_Axi4Crossbar_l532 + 2'b01);
  assign _zz__zz_when_Axi4Crossbar_l500_8 = {(! (|_zz_when_Axi4Crossbar_l500_9)),_zz_when_Axi4Crossbar_l500_9};
  assign _zz__zz_when_Axi4Crossbar_l500_8_1 = {(! (|_zz_when_Axi4Crossbar_l500_10)),_zz_when_Axi4Crossbar_l500_10};
  assign _zz__zz_when_Axi4Crossbar_l203_9 = (_zz_when_Axi4Crossbar_l203_7 - 2'b01);
  assign _zz__zz_when_Axi4Crossbar_l203_9_1 = (_zz_when_Axi4Crossbar_l203_8 - 2'b01);
  assign _zz__zz_12 = (_zz_12 + 2'b01);
  assign _zz__zz_when_Axi4Crossbar_l532_1 = (_zz_when_Axi4Crossbar_l532_1 + 2'b01);
  assign _zz__zz_when_Axi4Crossbar_l500_11 = {(! (|_zz_when_Axi4Crossbar_l500_12)),_zz_when_Axi4Crossbar_l500_12};
  assign _zz__zz_when_Axi4Crossbar_l500_11_1 = {(! (|_zz_when_Axi4Crossbar_l500_13)),_zz_when_Axi4Crossbar_l500_13};
  assign _zz__zz_when_Axi4Crossbar_l203_14 = (_zz_when_Axi4Crossbar_l203_12 - 2'b01);
  assign _zz__zz_when_Axi4Crossbar_l203_14_1 = (_zz_when_Axi4Crossbar_l203_13 - 2'b01);
  assign _zz__zz_13 = (_zz_13 + 2'b01);
  assign _zz__zz_when_Axi4Crossbar_l532_2 = (_zz_when_Axi4Crossbar_l532_2 + 2'b01);
  assign _zz__zz_when_Axi4Crossbar_l500_14 = {(! (|_zz_when_Axi4Crossbar_l500_15)),_zz_when_Axi4Crossbar_l500_15};
  assign _zz__zz_when_Axi4Crossbar_l500_14_1 = {(! (|_zz_when_Axi4Crossbar_l500_16)),_zz_when_Axi4Crossbar_l500_16};
  assign _zz__zz_when_Axi4Crossbar_l203_19 = (_zz_when_Axi4Crossbar_l203_17 - 2'b01);
  assign _zz__zz_when_Axi4Crossbar_l203_19_1 = (_zz_when_Axi4Crossbar_l203_18 - 2'b01);
  assign _zz__zz_14 = (_zz_14 + 2'b01);
  assign _zz__zz_when_Axi4Crossbar_l532_3 = (_zz_when_Axi4Crossbar_l532_3 + 2'b01);
  assign _zz__zz_when_Axi4Crossbar_l500_17 = {(! (|_zz_when_Axi4Crossbar_l500_18)),_zz_when_Axi4Crossbar_l500_18};
  assign _zz__zz_when_Axi4Crossbar_l500_17_1 = {(! (|_zz_when_Axi4Crossbar_l500_19)),_zz_when_Axi4Crossbar_l500_19};
  assign _zz__zz_when_Axi4Crossbar_l203_24 = (_zz_when_Axi4Crossbar_l203_22 - 2'b01);
  assign _zz__zz_when_Axi4Crossbar_l203_24_1 = (_zz_when_Axi4Crossbar_l203_23 - 2'b01);
  assign _zz__zz_15 = (_zz_15 + 2'b01);
  assign _zz__zz_when_Axi4Crossbar_l532_4 = (_zz_when_Axi4Crossbar_l532_4 + 2'b01);
  assign _zz__zz_when_Axi4Crossbar_l584 = (io_slaves_0_bid >>> 1'd1);
  assign _zz__zz_when_Axi4Crossbar_l584_1 = (io_slaves_1_bid >>> 1'd1);
  assign _zz__zz_when_Axi4Crossbar_l584_2 = (io_slaves_2_bid >>> 1'd1);
  assign _zz__zz_when_Axi4Crossbar_l584_3 = (io_slaves_3_bid >>> 1'd1);
  assign _zz__zz_when_Axi4Crossbar_l584_4 = (decErr_io_axi_bid >>> 1'd1);
  assign _zz__zz_when_Axi4Crossbar_l584_2_1 = (_zz_when_Axi4Crossbar_l584_1 - 5'h01);
  assign _zz__zz_when_Axi4Crossbar_l584_3_1 = (io_slaves_0_bid >>> 1'd1);
  assign _zz__zz_when_Axi4Crossbar_l584_3_2 = (io_slaves_1_bid >>> 1'd1);
  assign _zz__zz_when_Axi4Crossbar_l584_3_3 = (io_slaves_2_bid >>> 1'd1);
  assign _zz__zz_when_Axi4Crossbar_l584_3_4 = (io_slaves_3_bid >>> 1'd1);
  assign _zz__zz_when_Axi4Crossbar_l584_3_5 = (decErr_io_axi_bid >>> 1'd1);
  assign _zz__zz_when_Axi4Crossbar_l584_5 = (_zz_when_Axi4Crossbar_l584_4 - 5'h01);
  assign _zz__zz_when_Axi4Crossbar_l615_5 = {(! (|_zz_when_Axi4Crossbar_l615_6)),_zz_when_Axi4Crossbar_l615_6};
  assign _zz__zz_when_Axi4Crossbar_l615_5_1 = {(! (|_zz_when_Axi4Crossbar_l615_7)),_zz_when_Axi4Crossbar_l615_7};
  assign _zz__zz_when_Axi4Crossbar_l203_29 = (_zz_when_Axi4Crossbar_l203_27 - 2'b01);
  assign _zz__zz_when_Axi4Crossbar_l203_29_1 = (_zz_when_Axi4Crossbar_l203_28 - 2'b01);
  assign _zz__zz_when_Axi4Crossbar_l615_8 = {(! (|_zz_when_Axi4Crossbar_l615_9)),_zz_when_Axi4Crossbar_l615_9};
  assign _zz__zz_when_Axi4Crossbar_l615_8_1 = {(! (|_zz_when_Axi4Crossbar_l615_10)),_zz_when_Axi4Crossbar_l615_10};
  assign _zz__zz_when_Axi4Crossbar_l203_34 = (_zz_when_Axi4Crossbar_l203_32 - 2'b01);
  assign _zz__zz_when_Axi4Crossbar_l203_34_1 = (_zz_when_Axi4Crossbar_l203_33 - 2'b01);
  assign _zz__zz_when_Axi4Crossbar_l615_11 = {(! (|_zz_when_Axi4Crossbar_l615_12)),_zz_when_Axi4Crossbar_l615_12};
  assign _zz__zz_when_Axi4Crossbar_l615_11_1 = {(! (|_zz_when_Axi4Crossbar_l615_13)),_zz_when_Axi4Crossbar_l615_13};
  assign _zz__zz_when_Axi4Crossbar_l203_39 = (_zz_when_Axi4Crossbar_l203_37 - 2'b01);
  assign _zz__zz_when_Axi4Crossbar_l203_39_1 = (_zz_when_Axi4Crossbar_l203_38 - 2'b01);
  assign _zz__zz_when_Axi4Crossbar_l615_14 = {(! (|_zz_when_Axi4Crossbar_l615_15)),_zz_when_Axi4Crossbar_l615_15};
  assign _zz__zz_when_Axi4Crossbar_l615_14_1 = {(! (|_zz_when_Axi4Crossbar_l615_16)),_zz_when_Axi4Crossbar_l615_16};
  assign _zz__zz_when_Axi4Crossbar_l203_44 = (_zz_when_Axi4Crossbar_l203_42 - 2'b01);
  assign _zz__zz_when_Axi4Crossbar_l203_44_1 = (_zz_when_Axi4Crossbar_l203_43 - 2'b01);
  assign _zz__zz_when_Axi4Crossbar_l615_17 = {(! (|_zz_when_Axi4Crossbar_l615_18)),_zz_when_Axi4Crossbar_l615_18};
  assign _zz__zz_when_Axi4Crossbar_l615_17_1 = {(! (|_zz_when_Axi4Crossbar_l615_19)),_zz_when_Axi4Crossbar_l615_19};
  assign _zz__zz_when_Axi4Crossbar_l203_49 = (_zz_when_Axi4Crossbar_l203_47 - 2'b01);
  assign _zz__zz_when_Axi4Crossbar_l203_49_1 = (_zz_when_Axi4Crossbar_l203_48 - 2'b01);
  assign _zz__zz_when_Axi4Crossbar_l656 = (io_slaves_0_rid >>> 1'd1);
  assign _zz__zz_when_Axi4Crossbar_l656_1 = (io_slaves_1_rid >>> 1'd1);
  assign _zz__zz_when_Axi4Crossbar_l656_2 = (io_slaves_2_rid >>> 1'd1);
  assign _zz__zz_when_Axi4Crossbar_l656_3 = (io_slaves_3_rid >>> 1'd1);
  assign _zz__zz_when_Axi4Crossbar_l656_4 = (decErr_io_axi_rid >>> 1'd1);
  assign _zz__zz_when_Axi4Crossbar_l656_2_1 = (_zz_when_Axi4Crossbar_l656_1 - 5'h01);
  assign _zz__zz_when_Axi4Crossbar_l656_3_1 = (io_slaves_0_rid >>> 1'd1);
  assign _zz__zz_when_Axi4Crossbar_l656_3_2 = (io_slaves_1_rid >>> 1'd1);
  assign _zz__zz_when_Axi4Crossbar_l656_3_3 = (io_slaves_2_rid >>> 1'd1);
  assign _zz__zz_when_Axi4Crossbar_l656_3_4 = (io_slaves_3_rid >>> 1'd1);
  assign _zz__zz_when_Axi4Crossbar_l656_3_5 = (decErr_io_axi_rid >>> 1'd1);
  assign _zz__zz_when_Axi4Crossbar_l656_5 = (_zz_when_Axi4Crossbar_l656_4 - 5'h01);
  assign _zz__zz_6_port = _zz_io_slaves_0_awid;
  assign _zz__zz_7_port = _zz_io_slaves_1_awid;
  assign _zz__zz_8_port = _zz_io_slaves_2_awid;
  assign _zz__zz_9_port = _zz_io_slaves_3_awid;
  assign _zz__zz_10_port = _zz_wrRrPtr_4;
  assign _zz_6_spinal_port0 = _zz_6[_zz_when_Axi4Crossbar_l532];
  always @(posedge clk) begin
    if(_zz_5) begin
      _zz_6[_zz_11] <= _zz__zz_6_port;
    end
  end

  assign _zz_7_spinal_port0 = _zz_7[_zz_when_Axi4Crossbar_l532_1];
  always @(posedge clk) begin
    if(_zz_4) begin
      _zz_7[_zz_12] <= _zz__zz_7_port;
    end
  end

  assign _zz_8_spinal_port0 = _zz_8[_zz_when_Axi4Crossbar_l532_2];
  always @(posedge clk) begin
    if(_zz_3) begin
      _zz_8[_zz_13] <= _zz__zz_8_port;
    end
  end

  assign _zz_9_spinal_port0 = _zz_9[_zz_when_Axi4Crossbar_l532_3];
  always @(posedge clk) begin
    if(_zz_2) begin
      _zz_9[_zz_14] <= _zz__zz_9_port;
    end
  end

  assign _zz_10_spinal_port0 = _zz_10[_zz_when_Axi4Crossbar_l532_4];
  always @(posedge clk) begin
    if(_zz_1) begin
      _zz_10[_zz_15] <= _zz__zz_10_port;
    end
  end

  Axi4DecErrSlave decErr (
    .io_axi_awvalid          (decErr_io_axi_awvalid              ), //i
    .io_axi_awready          (decErr_io_axi_awready              ), //o
    .io_axi_awaddr   (decErr_io_axi_awaddr[31:0] ), //i
    .io_axi_awid     (decErr_io_axi_awid[1:0]    ), //i
    .io_axi_awregion (decErr_io_axi_awregion[3:0]), //i
    .io_axi_awlen    (decErr_io_axi_awlen[7:0]   ), //i
    .io_axi_awsize   (decErr_io_axi_awsize[2:0]  ), //i
    .io_axi_awburst  (decErr_io_axi_awburst[1:0] ), //i
    .io_axi_awlock   (decErr_io_axi_awlock       ), //i
    .io_axi_awcache  (decErr_io_axi_awcache[3:0] ), //i
    .io_axi_awqos    (decErr_io_axi_awqos[3:0]   ), //i
    .io_axi_awprot   (decErr_io_axi_awprot[2:0]  ), //i
    .io_axi_wvalid           (decErr_io_axi_wvalid               ), //i
    .io_axi_wready           (decErr_io_axi_wready               ), //o
    .io_axi_wdata    (decErr_io_axi_wdata[31:0]  ), //i
    .io_axi_wstrb    (decErr_io_axi_wstrb[3:0]   ), //i
    .io_axi_wlast    (decErr_io_axi_wlast        ), //i
    .io_axi_bvalid           (decErr_io_axi_bvalid               ), //o
    .io_axi_bready           (decErr_io_axi_bready               ), //i
    .io_axi_bid      (decErr_io_axi_bid[1:0]     ), //o
    .io_axi_bresp    (decErr_io_axi_bresp[1:0]   ), //o
    .io_axi_arvalid          (decErr_io_axi_arvalid              ), //i
    .io_axi_arready          (decErr_io_axi_arready              ), //o
    .io_axi_araddr   (decErr_io_axi_araddr[31:0] ), //i
    .io_axi_arid     (decErr_io_axi_arid[1:0]    ), //i
    .io_axi_arregion (decErr_io_axi_arregion[3:0]), //i
    .io_axi_arlen    (decErr_io_axi_arlen[7:0]   ), //i
    .io_axi_arsize   (decErr_io_axi_arsize[2:0]  ), //i
    .io_axi_arburst  (decErr_io_axi_arburst[1:0] ), //i
    .io_axi_arlock   (decErr_io_axi_arlock       ), //i
    .io_axi_arcache  (decErr_io_axi_arcache[3:0] ), //i
    .io_axi_arqos    (decErr_io_axi_arqos[3:0]   ), //i
    .io_axi_arprot   (decErr_io_axi_arprot[2:0]  ), //i
    .io_axi_rvalid           (decErr_io_axi_rvalid               ), //o
    .io_axi_rready           (decErr_io_axi_rready               ), //i
    .io_axi_rdata    (decErr_io_axi_rdata[31:0]  ), //o
    .io_axi_rid      (decErr_io_axi_rid[1:0]     ), //o
    .io_axi_rresp    (decErr_io_axi_rresp[1:0]   ), //o
    .io_axi_rlast    (decErr_io_axi_rlast        ), //o
    .clk                      (clk                                 ), //i
    .resetn                   (resetn                              )  //i
  );
  always @(*) begin
    _zz_1 = 1'b0;
    if(decErr_io_axi_aw_fire) begin
      _zz_1 = 1'b1;
    end
  end

  always @(*) begin
    _zz_2 = 1'b0;
    if(io_slaves_3_aw_fire) begin
      _zz_2 = 1'b1;
    end
  end

  always @(*) begin
    _zz_3 = 1'b0;
    if(io_slaves_2_aw_fire) begin
      _zz_3 = 1'b1;
    end
  end

  always @(*) begin
    _zz_4 = 1'b0;
    if(io_slaves_1_aw_fire) begin
      _zz_4 = 1'b1;
    end
  end

  always @(*) begin
    _zz_5 = 1'b0;
    if(io_slaves_0_aw_fire) begin
      _zz_5 = 1'b1;
    end
  end

  always @(*) begin
    io_masters_0_awready = 1'b0;
    if(when_Axi4Crossbar_l500) begin
      if(when_Axi4Crossbar_l503) begin
        io_masters_0_awready = io_slaves_0_awready;
      end
    end
    if(when_Axi4Crossbar_l500_1) begin
      if(when_Axi4Crossbar_l503_2) begin
        io_masters_0_awready = io_slaves_1_awready;
      end
    end
    if(when_Axi4Crossbar_l500_2) begin
      if(when_Axi4Crossbar_l503_4) begin
        io_masters_0_awready = io_slaves_2_awready;
      end
    end
    if(when_Axi4Crossbar_l500_3) begin
      if(when_Axi4Crossbar_l503_6) begin
        io_masters_0_awready = io_slaves_3_awready;
      end
    end
    if(when_Axi4Crossbar_l500_4) begin
      if(when_Axi4Crossbar_l503_8) begin
        io_masters_0_awready = decErr_io_axi_awready;
      end
    end
  end

  always @(*) begin
    io_masters_0_wready = 1'b0;
    if(when_Axi4Crossbar_l500) begin
      if(when_Axi4Crossbar_l503) begin
        if(when_Axi4Crossbar_l509) begin
          io_masters_0_wready = io_slaves_0_wready;
        end
      end
    end
    if(when_Axi4Crossbar_l530) begin
      if(when_Axi4Crossbar_l532) begin
        io_masters_0_wready = io_slaves_0_wready;
      end
    end
    if(when_Axi4Crossbar_l500_1) begin
      if(when_Axi4Crossbar_l503_2) begin
        if(when_Axi4Crossbar_l509_1) begin
          io_masters_0_wready = io_slaves_1_wready;
        end
      end
    end
    if(when_Axi4Crossbar_l530_1) begin
      if(when_Axi4Crossbar_l532_2) begin
        io_masters_0_wready = io_slaves_1_wready;
      end
    end
    if(when_Axi4Crossbar_l500_2) begin
      if(when_Axi4Crossbar_l503_4) begin
        if(when_Axi4Crossbar_l509_2) begin
          io_masters_0_wready = io_slaves_2_wready;
        end
      end
    end
    if(when_Axi4Crossbar_l530_2) begin
      if(when_Axi4Crossbar_l532_4) begin
        io_masters_0_wready = io_slaves_2_wready;
      end
    end
    if(when_Axi4Crossbar_l500_3) begin
      if(when_Axi4Crossbar_l503_6) begin
        if(when_Axi4Crossbar_l509_3) begin
          io_masters_0_wready = io_slaves_3_wready;
        end
      end
    end
    if(when_Axi4Crossbar_l530_3) begin
      if(when_Axi4Crossbar_l532_6) begin
        io_masters_0_wready = io_slaves_3_wready;
      end
    end
    if(when_Axi4Crossbar_l500_4) begin
      if(when_Axi4Crossbar_l503_8) begin
        if(when_Axi4Crossbar_l509_4) begin
          io_masters_0_wready = decErr_io_axi_wready;
        end
      end
    end
    if(when_Axi4Crossbar_l530_4) begin
      if(when_Axi4Crossbar_l532_8) begin
        io_masters_0_wready = decErr_io_axi_wready;
      end
    end
  end

  always @(*) begin
    io_masters_0_bvalid = 1'b0;
    if(when_Axi4Crossbar_l584) begin
      io_masters_0_bvalid = 1'b1;
    end
    if(when_Axi4Crossbar_l584_1) begin
      io_masters_0_bvalid = 1'b1;
    end
    if(when_Axi4Crossbar_l584_2) begin
      io_masters_0_bvalid = 1'b1;
    end
    if(when_Axi4Crossbar_l584_3) begin
      io_masters_0_bvalid = 1'b1;
    end
    if(when_Axi4Crossbar_l584_4) begin
      io_masters_0_bvalid = 1'b1;
    end
  end

  assign _zz_io_masters_0_bid = 3'b000;
  always @(*) begin
    io_masters_0_bid = _zz_io_masters_0_bid[0 : 0];
    if(when_Axi4Crossbar_l584) begin
      io_masters_0_bid = io_slaves_0_bid[0 : 0];
    end
    if(when_Axi4Crossbar_l584_1) begin
      io_masters_0_bid = io_slaves_1_bid[0 : 0];
    end
    if(when_Axi4Crossbar_l584_2) begin
      io_masters_0_bid = io_slaves_2_bid[0 : 0];
    end
    if(when_Axi4Crossbar_l584_3) begin
      io_masters_0_bid = io_slaves_3_bid[0 : 0];
    end
    if(when_Axi4Crossbar_l584_4) begin
      io_masters_0_bid = decErr_io_axi_bid[0 : 0];
    end
  end

  always @(*) begin
    io_masters_0_bresp = _zz_io_masters_0_bid[2 : 1];
    if(when_Axi4Crossbar_l584) begin
      io_masters_0_bresp = io_slaves_0_bresp;
    end
    if(when_Axi4Crossbar_l584_1) begin
      io_masters_0_bresp = io_slaves_1_bresp;
    end
    if(when_Axi4Crossbar_l584_2) begin
      io_masters_0_bresp = io_slaves_2_bresp;
    end
    if(when_Axi4Crossbar_l584_3) begin
      io_masters_0_bresp = io_slaves_3_bresp;
    end
    if(when_Axi4Crossbar_l584_4) begin
      io_masters_0_bresp = decErr_io_axi_bresp;
    end
  end

  always @(*) begin
    io_masters_0_arready = 1'b0;
    if(when_Axi4Crossbar_l615) begin
      if(when_Axi4Crossbar_l618) begin
        io_masters_0_arready = io_slaves_0_arready;
      end
    end
    if(when_Axi4Crossbar_l615_1) begin
      if(when_Axi4Crossbar_l618_2) begin
        io_masters_0_arready = io_slaves_1_arready;
      end
    end
    if(when_Axi4Crossbar_l615_2) begin
      if(when_Axi4Crossbar_l618_4) begin
        io_masters_0_arready = io_slaves_2_arready;
      end
    end
    if(when_Axi4Crossbar_l615_3) begin
      if(when_Axi4Crossbar_l618_6) begin
        io_masters_0_arready = io_slaves_3_arready;
      end
    end
    if(when_Axi4Crossbar_l615_4) begin
      if(when_Axi4Crossbar_l618_8) begin
        io_masters_0_arready = decErr_io_axi_arready;
      end
    end
  end

  always @(*) begin
    io_masters_0_rvalid = 1'b0;
    if(when_Axi4Crossbar_l656) begin
      io_masters_0_rvalid = 1'b1;
    end
    if(when_Axi4Crossbar_l656_1) begin
      io_masters_0_rvalid = 1'b1;
    end
    if(when_Axi4Crossbar_l656_2) begin
      io_masters_0_rvalid = 1'b1;
    end
    if(when_Axi4Crossbar_l656_3) begin
      io_masters_0_rvalid = 1'b1;
    end
    if(when_Axi4Crossbar_l656_4) begin
      io_masters_0_rvalid = 1'b1;
    end
  end

  assign _zz_io_masters_0_rdata = 36'h0;
  always @(*) begin
    io_masters_0_rdata = _zz_io_masters_0_rdata[31 : 0];
    if(when_Axi4Crossbar_l656) begin
      io_masters_0_rdata = io_slaves_0_rdata;
    end
    if(when_Axi4Crossbar_l656_1) begin
      io_masters_0_rdata = io_slaves_1_rdata;
    end
    if(when_Axi4Crossbar_l656_2) begin
      io_masters_0_rdata = io_slaves_2_rdata;
    end
    if(when_Axi4Crossbar_l656_3) begin
      io_masters_0_rdata = io_slaves_3_rdata;
    end
    if(when_Axi4Crossbar_l656_4) begin
      io_masters_0_rdata = decErr_io_axi_rdata;
    end
  end

  always @(*) begin
    io_masters_0_rid = _zz_io_masters_0_rdata[32 : 32];
    if(when_Axi4Crossbar_l656) begin
      io_masters_0_rid = io_slaves_0_rid[0 : 0];
    end
    if(when_Axi4Crossbar_l656_1) begin
      io_masters_0_rid = io_slaves_1_rid[0 : 0];
    end
    if(when_Axi4Crossbar_l656_2) begin
      io_masters_0_rid = io_slaves_2_rid[0 : 0];
    end
    if(when_Axi4Crossbar_l656_3) begin
      io_masters_0_rid = io_slaves_3_rid[0 : 0];
    end
    if(when_Axi4Crossbar_l656_4) begin
      io_masters_0_rid = decErr_io_axi_rid[0 : 0];
    end
  end

  always @(*) begin
    io_masters_0_rresp = _zz_io_masters_0_rdata[34 : 33];
    if(when_Axi4Crossbar_l656) begin
      io_masters_0_rresp = io_slaves_0_rresp;
    end
    if(when_Axi4Crossbar_l656_1) begin
      io_masters_0_rresp = io_slaves_1_rresp;
    end
    if(when_Axi4Crossbar_l656_2) begin
      io_masters_0_rresp = io_slaves_2_rresp;
    end
    if(when_Axi4Crossbar_l656_3) begin
      io_masters_0_rresp = io_slaves_3_rresp;
    end
    if(when_Axi4Crossbar_l656_4) begin
      io_masters_0_rresp = decErr_io_axi_rresp;
    end
  end

  always @(*) begin
    io_masters_0_rlast = _zz_io_masters_0_rdata[35];
    if(when_Axi4Crossbar_l656) begin
      io_masters_0_rlast = io_slaves_0_rlast;
    end
    if(when_Axi4Crossbar_l656_1) begin
      io_masters_0_rlast = io_slaves_1_rlast;
    end
    if(when_Axi4Crossbar_l656_2) begin
      io_masters_0_rlast = io_slaves_2_rlast;
    end
    if(when_Axi4Crossbar_l656_3) begin
      io_masters_0_rlast = io_slaves_3_rlast;
    end
    if(when_Axi4Crossbar_l656_4) begin
      io_masters_0_rlast = decErr_io_axi_rlast;
    end
  end

  always @(*) begin
    io_masters_1_awready = 1'b0;
    if(when_Axi4Crossbar_l500) begin
      if(when_Axi4Crossbar_l503_1) begin
        io_masters_1_awready = io_slaves_0_awready;
      end
    end
    if(when_Axi4Crossbar_l500_1) begin
      if(when_Axi4Crossbar_l503_3) begin
        io_masters_1_awready = io_slaves_1_awready;
      end
    end
    if(when_Axi4Crossbar_l500_2) begin
      if(when_Axi4Crossbar_l503_5) begin
        io_masters_1_awready = io_slaves_2_awready;
      end
    end
    if(when_Axi4Crossbar_l500_3) begin
      if(when_Axi4Crossbar_l503_7) begin
        io_masters_1_awready = io_slaves_3_awready;
      end
    end
    if(when_Axi4Crossbar_l500_4) begin
      if(when_Axi4Crossbar_l503_9) begin
        io_masters_1_awready = decErr_io_axi_awready;
      end
    end
  end

  always @(*) begin
    io_masters_1_wready = 1'b0;
    if(when_Axi4Crossbar_l500) begin
      if(when_Axi4Crossbar_l503_1) begin
        if(when_Axi4Crossbar_l509) begin
          io_masters_1_wready = io_slaves_0_wready;
        end
      end
    end
    if(when_Axi4Crossbar_l530) begin
      if(when_Axi4Crossbar_l532_1) begin
        io_masters_1_wready = io_slaves_0_wready;
      end
    end
    if(when_Axi4Crossbar_l500_1) begin
      if(when_Axi4Crossbar_l503_3) begin
        if(when_Axi4Crossbar_l509_1) begin
          io_masters_1_wready = io_slaves_1_wready;
        end
      end
    end
    if(when_Axi4Crossbar_l530_1) begin
      if(when_Axi4Crossbar_l532_3) begin
        io_masters_1_wready = io_slaves_1_wready;
      end
    end
    if(when_Axi4Crossbar_l500_2) begin
      if(when_Axi4Crossbar_l503_5) begin
        if(when_Axi4Crossbar_l509_2) begin
          io_masters_1_wready = io_slaves_2_wready;
        end
      end
    end
    if(when_Axi4Crossbar_l530_2) begin
      if(when_Axi4Crossbar_l532_5) begin
        io_masters_1_wready = io_slaves_2_wready;
      end
    end
    if(when_Axi4Crossbar_l500_3) begin
      if(when_Axi4Crossbar_l503_7) begin
        if(when_Axi4Crossbar_l509_3) begin
          io_masters_1_wready = io_slaves_3_wready;
        end
      end
    end
    if(when_Axi4Crossbar_l530_3) begin
      if(when_Axi4Crossbar_l532_7) begin
        io_masters_1_wready = io_slaves_3_wready;
      end
    end
    if(when_Axi4Crossbar_l500_4) begin
      if(when_Axi4Crossbar_l503_9) begin
        if(when_Axi4Crossbar_l509_4) begin
          io_masters_1_wready = decErr_io_axi_wready;
        end
      end
    end
    if(when_Axi4Crossbar_l530_4) begin
      if(when_Axi4Crossbar_l532_9) begin
        io_masters_1_wready = decErr_io_axi_wready;
      end
    end
  end

  always @(*) begin
    io_masters_1_bvalid = 1'b0;
    if(when_Axi4Crossbar_l584_5) begin
      io_masters_1_bvalid = 1'b1;
    end
    if(when_Axi4Crossbar_l584_6) begin
      io_masters_1_bvalid = 1'b1;
    end
    if(when_Axi4Crossbar_l584_7) begin
      io_masters_1_bvalid = 1'b1;
    end
    if(when_Axi4Crossbar_l584_8) begin
      io_masters_1_bvalid = 1'b1;
    end
    if(when_Axi4Crossbar_l584_9) begin
      io_masters_1_bvalid = 1'b1;
    end
  end

  assign _zz_io_masters_1_bid = 3'b000;
  always @(*) begin
    io_masters_1_bid = _zz_io_masters_1_bid[0 : 0];
    if(when_Axi4Crossbar_l584_5) begin
      io_masters_1_bid = io_slaves_0_bid[0 : 0];
    end
    if(when_Axi4Crossbar_l584_6) begin
      io_masters_1_bid = io_slaves_1_bid[0 : 0];
    end
    if(when_Axi4Crossbar_l584_7) begin
      io_masters_1_bid = io_slaves_2_bid[0 : 0];
    end
    if(when_Axi4Crossbar_l584_8) begin
      io_masters_1_bid = io_slaves_3_bid[0 : 0];
    end
    if(when_Axi4Crossbar_l584_9) begin
      io_masters_1_bid = decErr_io_axi_bid[0 : 0];
    end
  end

  always @(*) begin
    io_masters_1_bresp = _zz_io_masters_1_bid[2 : 1];
    if(when_Axi4Crossbar_l584_5) begin
      io_masters_1_bresp = io_slaves_0_bresp;
    end
    if(when_Axi4Crossbar_l584_6) begin
      io_masters_1_bresp = io_slaves_1_bresp;
    end
    if(when_Axi4Crossbar_l584_7) begin
      io_masters_1_bresp = io_slaves_2_bresp;
    end
    if(when_Axi4Crossbar_l584_8) begin
      io_masters_1_bresp = io_slaves_3_bresp;
    end
    if(when_Axi4Crossbar_l584_9) begin
      io_masters_1_bresp = decErr_io_axi_bresp;
    end
  end

  always @(*) begin
    io_masters_1_arready = 1'b0;
    if(when_Axi4Crossbar_l615) begin
      if(when_Axi4Crossbar_l618_1) begin
        io_masters_1_arready = io_slaves_0_arready;
      end
    end
    if(when_Axi4Crossbar_l615_1) begin
      if(when_Axi4Crossbar_l618_3) begin
        io_masters_1_arready = io_slaves_1_arready;
      end
    end
    if(when_Axi4Crossbar_l615_2) begin
      if(when_Axi4Crossbar_l618_5) begin
        io_masters_1_arready = io_slaves_2_arready;
      end
    end
    if(when_Axi4Crossbar_l615_3) begin
      if(when_Axi4Crossbar_l618_7) begin
        io_masters_1_arready = io_slaves_3_arready;
      end
    end
    if(when_Axi4Crossbar_l615_4) begin
      if(when_Axi4Crossbar_l618_9) begin
        io_masters_1_arready = decErr_io_axi_arready;
      end
    end
  end

  always @(*) begin
    io_masters_1_rvalid = 1'b0;
    if(when_Axi4Crossbar_l656_5) begin
      io_masters_1_rvalid = 1'b1;
    end
    if(when_Axi4Crossbar_l656_6) begin
      io_masters_1_rvalid = 1'b1;
    end
    if(when_Axi4Crossbar_l656_7) begin
      io_masters_1_rvalid = 1'b1;
    end
    if(when_Axi4Crossbar_l656_8) begin
      io_masters_1_rvalid = 1'b1;
    end
    if(when_Axi4Crossbar_l656_9) begin
      io_masters_1_rvalid = 1'b1;
    end
  end

  assign _zz_io_masters_1_rdata = 36'h0;
  always @(*) begin
    io_masters_1_rdata = _zz_io_masters_1_rdata[31 : 0];
    if(when_Axi4Crossbar_l656_5) begin
      io_masters_1_rdata = io_slaves_0_rdata;
    end
    if(when_Axi4Crossbar_l656_6) begin
      io_masters_1_rdata = io_slaves_1_rdata;
    end
    if(when_Axi4Crossbar_l656_7) begin
      io_masters_1_rdata = io_slaves_2_rdata;
    end
    if(when_Axi4Crossbar_l656_8) begin
      io_masters_1_rdata = io_slaves_3_rdata;
    end
    if(when_Axi4Crossbar_l656_9) begin
      io_masters_1_rdata = decErr_io_axi_rdata;
    end
  end

  always @(*) begin
    io_masters_1_rid = _zz_io_masters_1_rdata[32 : 32];
    if(when_Axi4Crossbar_l656_5) begin
      io_masters_1_rid = io_slaves_0_rid[0 : 0];
    end
    if(when_Axi4Crossbar_l656_6) begin
      io_masters_1_rid = io_slaves_1_rid[0 : 0];
    end
    if(when_Axi4Crossbar_l656_7) begin
      io_masters_1_rid = io_slaves_2_rid[0 : 0];
    end
    if(when_Axi4Crossbar_l656_8) begin
      io_masters_1_rid = io_slaves_3_rid[0 : 0];
    end
    if(when_Axi4Crossbar_l656_9) begin
      io_masters_1_rid = decErr_io_axi_rid[0 : 0];
    end
  end

  always @(*) begin
    io_masters_1_rresp = _zz_io_masters_1_rdata[34 : 33];
    if(when_Axi4Crossbar_l656_5) begin
      io_masters_1_rresp = io_slaves_0_rresp;
    end
    if(when_Axi4Crossbar_l656_6) begin
      io_masters_1_rresp = io_slaves_1_rresp;
    end
    if(when_Axi4Crossbar_l656_7) begin
      io_masters_1_rresp = io_slaves_2_rresp;
    end
    if(when_Axi4Crossbar_l656_8) begin
      io_masters_1_rresp = io_slaves_3_rresp;
    end
    if(when_Axi4Crossbar_l656_9) begin
      io_masters_1_rresp = decErr_io_axi_rresp;
    end
  end

  always @(*) begin
    io_masters_1_rlast = _zz_io_masters_1_rdata[35];
    if(when_Axi4Crossbar_l656_5) begin
      io_masters_1_rlast = io_slaves_0_rlast;
    end
    if(when_Axi4Crossbar_l656_6) begin
      io_masters_1_rlast = io_slaves_1_rlast;
    end
    if(when_Axi4Crossbar_l656_7) begin
      io_masters_1_rlast = io_slaves_2_rlast;
    end
    if(when_Axi4Crossbar_l656_8) begin
      io_masters_1_rlast = io_slaves_3_rlast;
    end
    if(when_Axi4Crossbar_l656_9) begin
      io_masters_1_rlast = decErr_io_axi_rlast;
    end
  end

  always @(*) begin
    io_slaves_0_awvalid = 1'b0;
    if(when_Axi4Crossbar_l500) begin
      io_slaves_0_awvalid = 1'b1;
    end
  end

  assign _zz_io_slaves_0_awaddr = 63'h0;
  always @(*) begin
    io_slaves_0_awaddr = _zz_io_slaves_0_awaddr[31 : 0];
    if(when_Axi4Crossbar_l500) begin
      if(when_Axi4Crossbar_l503) begin
        io_slaves_0_awaddr = io_masters_0_awaddr;
      end
      if(when_Axi4Crossbar_l503_1) begin
        io_slaves_0_awaddr = io_masters_1_awaddr;
      end
    end
  end

  always @(*) begin
    io_slaves_0_awid = _zz_io_slaves_0_awaddr[33 : 32];
    if(when_Axi4Crossbar_l500) begin
      if(when_Axi4Crossbar_l503) begin
        io_slaves_0_awid = {_zz_io_slaves_0_awid,io_masters_0_awid};
      end
      if(when_Axi4Crossbar_l503_1) begin
        io_slaves_0_awid = {_zz_io_slaves_0_awid,io_masters_1_awid};
      end
    end
  end

  assign io_slaves_0_awregion = _zz_io_slaves_0_awaddr[37 : 34];
  always @(*) begin
    io_slaves_0_awlen = _zz_io_slaves_0_awaddr[45 : 38];
    if(when_Axi4Crossbar_l500) begin
      if(when_Axi4Crossbar_l503) begin
        io_slaves_0_awlen = io_masters_0_awlen;
      end
      if(when_Axi4Crossbar_l503_1) begin
        io_slaves_0_awlen = io_masters_1_awlen;
      end
    end
  end

  always @(*) begin
    io_slaves_0_awsize = _zz_io_slaves_0_awaddr[48 : 46];
    if(when_Axi4Crossbar_l500) begin
      if(when_Axi4Crossbar_l503) begin
        io_slaves_0_awsize = io_masters_0_awsize;
      end
      if(when_Axi4Crossbar_l503_1) begin
        io_slaves_0_awsize = io_masters_1_awsize;
      end
    end
  end

  always @(*) begin
    io_slaves_0_awburst = _zz_io_slaves_0_awaddr[50 : 49];
    if(when_Axi4Crossbar_l500) begin
      if(when_Axi4Crossbar_l503) begin
        io_slaves_0_awburst = io_masters_0_awburst;
      end
      if(when_Axi4Crossbar_l503_1) begin
        io_slaves_0_awburst = io_masters_1_awburst;
      end
    end
  end

  always @(*) begin
    io_slaves_0_awlock = _zz_io_slaves_0_awaddr[51 : 51];
    if(when_Axi4Crossbar_l500) begin
      if(when_Axi4Crossbar_l503) begin
        io_slaves_0_awlock = io_masters_0_awlock;
      end
      if(when_Axi4Crossbar_l503_1) begin
        io_slaves_0_awlock = io_masters_1_awlock;
      end
    end
  end

  always @(*) begin
    io_slaves_0_awcache = _zz_io_slaves_0_awaddr[55 : 52];
    if(when_Axi4Crossbar_l500) begin
      if(when_Axi4Crossbar_l503) begin
        io_slaves_0_awcache = io_masters_0_awcache;
      end
      if(when_Axi4Crossbar_l503_1) begin
        io_slaves_0_awcache = io_masters_1_awcache;
      end
    end
  end

  always @(*) begin
    io_slaves_0_awqos = _zz_io_slaves_0_awaddr[59 : 56];
    if(when_Axi4Crossbar_l500) begin
      if(when_Axi4Crossbar_l503) begin
        io_slaves_0_awqos = io_masters_0_awqos;
      end
      if(when_Axi4Crossbar_l503_1) begin
        io_slaves_0_awqos = io_masters_1_awqos;
      end
    end
  end

  always @(*) begin
    io_slaves_0_awprot = _zz_io_slaves_0_awaddr[62 : 60];
    if(when_Axi4Crossbar_l500) begin
      if(when_Axi4Crossbar_l503) begin
        io_slaves_0_awprot = io_masters_0_awprot;
      end
      if(when_Axi4Crossbar_l503_1) begin
        io_slaves_0_awprot = io_masters_1_awprot;
      end
    end
  end

  always @(*) begin
    io_slaves_0_wvalid = 1'b0;
    if(when_Axi4Crossbar_l500) begin
      if(when_Axi4Crossbar_l503) begin
        if(when_Axi4Crossbar_l509) begin
          io_slaves_0_wvalid = io_masters_0_wvalid;
        end
      end
      if(when_Axi4Crossbar_l503_1) begin
        if(when_Axi4Crossbar_l509) begin
          io_slaves_0_wvalid = io_masters_1_wvalid;
        end
      end
    end
    if(when_Axi4Crossbar_l530) begin
      if(when_Axi4Crossbar_l532) begin
        io_slaves_0_wvalid = io_masters_0_wvalid;
      end
      if(when_Axi4Crossbar_l532_1) begin
        io_slaves_0_wvalid = io_masters_1_wvalid;
      end
    end
  end

  assign _zz_io_slaves_0_wdata = 37'h0;
  always @(*) begin
    io_slaves_0_wdata = _zz_io_slaves_0_wdata[31 : 0];
    if(when_Axi4Crossbar_l500) begin
      if(when_Axi4Crossbar_l503) begin
        if(when_Axi4Crossbar_l509) begin
          io_slaves_0_wdata = io_masters_0_wdata;
        end
      end
      if(when_Axi4Crossbar_l503_1) begin
        if(when_Axi4Crossbar_l509) begin
          io_slaves_0_wdata = io_masters_1_wdata;
        end
      end
    end
    if(when_Axi4Crossbar_l530) begin
      if(when_Axi4Crossbar_l532) begin
        io_slaves_0_wdata = io_masters_0_wdata;
      end
      if(when_Axi4Crossbar_l532_1) begin
        io_slaves_0_wdata = io_masters_1_wdata;
      end
    end
  end

  always @(*) begin
    io_slaves_0_wstrb = _zz_io_slaves_0_wdata[35 : 32];
    if(when_Axi4Crossbar_l500) begin
      if(when_Axi4Crossbar_l503) begin
        if(when_Axi4Crossbar_l509) begin
          io_slaves_0_wstrb = io_masters_0_wstrb;
        end
      end
      if(when_Axi4Crossbar_l503_1) begin
        if(when_Axi4Crossbar_l509) begin
          io_slaves_0_wstrb = io_masters_1_wstrb;
        end
      end
    end
    if(when_Axi4Crossbar_l530) begin
      if(when_Axi4Crossbar_l532) begin
        io_slaves_0_wstrb = io_masters_0_wstrb;
      end
      if(when_Axi4Crossbar_l532_1) begin
        io_slaves_0_wstrb = io_masters_1_wstrb;
      end
    end
  end

  always @(*) begin
    io_slaves_0_wlast = _zz_io_slaves_0_wdata[36];
    if(when_Axi4Crossbar_l500) begin
      if(when_Axi4Crossbar_l503) begin
        if(when_Axi4Crossbar_l509) begin
          io_slaves_0_wlast = io_masters_0_wlast;
        end
      end
      if(when_Axi4Crossbar_l503_1) begin
        if(when_Axi4Crossbar_l509) begin
          io_slaves_0_wlast = io_masters_1_wlast;
        end
      end
    end
    if(when_Axi4Crossbar_l530) begin
      if(when_Axi4Crossbar_l532) begin
        io_slaves_0_wlast = io_masters_0_wlast;
      end
      if(when_Axi4Crossbar_l532_1) begin
        io_slaves_0_wlast = io_masters_1_wlast;
      end
    end
  end

  always @(*) begin
    io_slaves_0_bready = 1'b0;
    if(when_Axi4Crossbar_l584) begin
      io_slaves_0_bready = io_masters_0_bready;
    end
    if(when_Axi4Crossbar_l584_5) begin
      io_slaves_0_bready = io_masters_1_bready;
    end
  end

  always @(*) begin
    io_slaves_0_arvalid = 1'b0;
    if(when_Axi4Crossbar_l615) begin
      io_slaves_0_arvalid = 1'b1;
    end
  end

  assign _zz_io_slaves_0_araddr = 63'h0;
  always @(*) begin
    io_slaves_0_araddr = _zz_io_slaves_0_araddr[31 : 0];
    if(when_Axi4Crossbar_l615) begin
      if(when_Axi4Crossbar_l618) begin
        io_slaves_0_araddr = io_masters_0_araddr;
      end
      if(when_Axi4Crossbar_l618_1) begin
        io_slaves_0_araddr = io_masters_1_araddr;
      end
    end
  end

  always @(*) begin
    io_slaves_0_arid = _zz_io_slaves_0_araddr[33 : 32];
    if(when_Axi4Crossbar_l615) begin
      if(when_Axi4Crossbar_l618) begin
        io_slaves_0_arid = {_zz_io_slaves_0_arid,io_masters_0_arid};
      end
      if(when_Axi4Crossbar_l618_1) begin
        io_slaves_0_arid = {_zz_io_slaves_0_arid,io_masters_1_arid};
      end
    end
  end

  assign io_slaves_0_arregion = _zz_io_slaves_0_araddr[37 : 34];
  always @(*) begin
    io_slaves_0_arlen = _zz_io_slaves_0_araddr[45 : 38];
    if(when_Axi4Crossbar_l615) begin
      if(when_Axi4Crossbar_l618) begin
        io_slaves_0_arlen = io_masters_0_arlen;
      end
      if(when_Axi4Crossbar_l618_1) begin
        io_slaves_0_arlen = io_masters_1_arlen;
      end
    end
  end

  always @(*) begin
    io_slaves_0_arsize = _zz_io_slaves_0_araddr[48 : 46];
    if(when_Axi4Crossbar_l615) begin
      if(when_Axi4Crossbar_l618) begin
        io_slaves_0_arsize = io_masters_0_arsize;
      end
      if(when_Axi4Crossbar_l618_1) begin
        io_slaves_0_arsize = io_masters_1_arsize;
      end
    end
  end

  always @(*) begin
    io_slaves_0_arburst = _zz_io_slaves_0_araddr[50 : 49];
    if(when_Axi4Crossbar_l615) begin
      if(when_Axi4Crossbar_l618) begin
        io_slaves_0_arburst = io_masters_0_arburst;
      end
      if(when_Axi4Crossbar_l618_1) begin
        io_slaves_0_arburst = io_masters_1_arburst;
      end
    end
  end

  always @(*) begin
    io_slaves_0_arlock = _zz_io_slaves_0_araddr[51 : 51];
    if(when_Axi4Crossbar_l615) begin
      if(when_Axi4Crossbar_l618) begin
        io_slaves_0_arlock = io_masters_0_arlock;
      end
      if(when_Axi4Crossbar_l618_1) begin
        io_slaves_0_arlock = io_masters_1_arlock;
      end
    end
  end

  always @(*) begin
    io_slaves_0_arcache = _zz_io_slaves_0_araddr[55 : 52];
    if(when_Axi4Crossbar_l615) begin
      if(when_Axi4Crossbar_l618) begin
        io_slaves_0_arcache = io_masters_0_arcache;
      end
      if(when_Axi4Crossbar_l618_1) begin
        io_slaves_0_arcache = io_masters_1_arcache;
      end
    end
  end

  always @(*) begin
    io_slaves_0_arqos = _zz_io_slaves_0_araddr[59 : 56];
    if(when_Axi4Crossbar_l615) begin
      if(when_Axi4Crossbar_l618) begin
        io_slaves_0_arqos = io_masters_0_arqos;
      end
      if(when_Axi4Crossbar_l618_1) begin
        io_slaves_0_arqos = io_masters_1_arqos;
      end
    end
  end

  always @(*) begin
    io_slaves_0_arprot = _zz_io_slaves_0_araddr[62 : 60];
    if(when_Axi4Crossbar_l615) begin
      if(when_Axi4Crossbar_l618) begin
        io_slaves_0_arprot = io_masters_0_arprot;
      end
      if(when_Axi4Crossbar_l618_1) begin
        io_slaves_0_arprot = io_masters_1_arprot;
      end
    end
  end

  always @(*) begin
    io_slaves_0_rready = 1'b0;
    if(when_Axi4Crossbar_l656) begin
      io_slaves_0_rready = io_masters_0_rready;
    end
    if(when_Axi4Crossbar_l656_5) begin
      io_slaves_0_rready = io_masters_1_rready;
    end
  end

  always @(*) begin
    io_slaves_1_awvalid = 1'b0;
    if(when_Axi4Crossbar_l500_1) begin
      io_slaves_1_awvalid = 1'b1;
    end
  end

  assign _zz_io_slaves_1_awaddr = 63'h0;
  always @(*) begin
    io_slaves_1_awaddr = _zz_io_slaves_1_awaddr[31 : 0];
    if(when_Axi4Crossbar_l500_1) begin
      if(when_Axi4Crossbar_l503_2) begin
        io_slaves_1_awaddr = io_masters_0_awaddr;
      end
      if(when_Axi4Crossbar_l503_3) begin
        io_slaves_1_awaddr = io_masters_1_awaddr;
      end
    end
  end

  always @(*) begin
    io_slaves_1_awid = _zz_io_slaves_1_awaddr[33 : 32];
    if(when_Axi4Crossbar_l500_1) begin
      if(when_Axi4Crossbar_l503_2) begin
        io_slaves_1_awid = {_zz_io_slaves_1_awid,io_masters_0_awid};
      end
      if(when_Axi4Crossbar_l503_3) begin
        io_slaves_1_awid = {_zz_io_slaves_1_awid,io_masters_1_awid};
      end
    end
  end

  assign io_slaves_1_awregion = _zz_io_slaves_1_awaddr[37 : 34];
  always @(*) begin
    io_slaves_1_awlen = _zz_io_slaves_1_awaddr[45 : 38];
    if(when_Axi4Crossbar_l500_1) begin
      if(when_Axi4Crossbar_l503_2) begin
        io_slaves_1_awlen = io_masters_0_awlen;
      end
      if(when_Axi4Crossbar_l503_3) begin
        io_slaves_1_awlen = io_masters_1_awlen;
      end
    end
  end

  always @(*) begin
    io_slaves_1_awsize = _zz_io_slaves_1_awaddr[48 : 46];
    if(when_Axi4Crossbar_l500_1) begin
      if(when_Axi4Crossbar_l503_2) begin
        io_slaves_1_awsize = io_masters_0_awsize;
      end
      if(when_Axi4Crossbar_l503_3) begin
        io_slaves_1_awsize = io_masters_1_awsize;
      end
    end
  end

  always @(*) begin
    io_slaves_1_awburst = _zz_io_slaves_1_awaddr[50 : 49];
    if(when_Axi4Crossbar_l500_1) begin
      if(when_Axi4Crossbar_l503_2) begin
        io_slaves_1_awburst = io_masters_0_awburst;
      end
      if(when_Axi4Crossbar_l503_3) begin
        io_slaves_1_awburst = io_masters_1_awburst;
      end
    end
  end

  always @(*) begin
    io_slaves_1_awlock = _zz_io_slaves_1_awaddr[51 : 51];
    if(when_Axi4Crossbar_l500_1) begin
      if(when_Axi4Crossbar_l503_2) begin
        io_slaves_1_awlock = io_masters_0_awlock;
      end
      if(when_Axi4Crossbar_l503_3) begin
        io_slaves_1_awlock = io_masters_1_awlock;
      end
    end
  end

  always @(*) begin
    io_slaves_1_awcache = _zz_io_slaves_1_awaddr[55 : 52];
    if(when_Axi4Crossbar_l500_1) begin
      if(when_Axi4Crossbar_l503_2) begin
        io_slaves_1_awcache = io_masters_0_awcache;
      end
      if(when_Axi4Crossbar_l503_3) begin
        io_slaves_1_awcache = io_masters_1_awcache;
      end
    end
  end

  always @(*) begin
    io_slaves_1_awqos = _zz_io_slaves_1_awaddr[59 : 56];
    if(when_Axi4Crossbar_l500_1) begin
      if(when_Axi4Crossbar_l503_2) begin
        io_slaves_1_awqos = io_masters_0_awqos;
      end
      if(when_Axi4Crossbar_l503_3) begin
        io_slaves_1_awqos = io_masters_1_awqos;
      end
    end
  end

  always @(*) begin
    io_slaves_1_awprot = _zz_io_slaves_1_awaddr[62 : 60];
    if(when_Axi4Crossbar_l500_1) begin
      if(when_Axi4Crossbar_l503_2) begin
        io_slaves_1_awprot = io_masters_0_awprot;
      end
      if(when_Axi4Crossbar_l503_3) begin
        io_slaves_1_awprot = io_masters_1_awprot;
      end
    end
  end

  always @(*) begin
    io_slaves_1_wvalid = 1'b0;
    if(when_Axi4Crossbar_l500_1) begin
      if(when_Axi4Crossbar_l503_2) begin
        if(when_Axi4Crossbar_l509_1) begin
          io_slaves_1_wvalid = io_masters_0_wvalid;
        end
      end
      if(when_Axi4Crossbar_l503_3) begin
        if(when_Axi4Crossbar_l509_1) begin
          io_slaves_1_wvalid = io_masters_1_wvalid;
        end
      end
    end
    if(when_Axi4Crossbar_l530_1) begin
      if(when_Axi4Crossbar_l532_2) begin
        io_slaves_1_wvalid = io_masters_0_wvalid;
      end
      if(when_Axi4Crossbar_l532_3) begin
        io_slaves_1_wvalid = io_masters_1_wvalid;
      end
    end
  end

  assign _zz_io_slaves_1_wdata = 37'h0;
  always @(*) begin
    io_slaves_1_wdata = _zz_io_slaves_1_wdata[31 : 0];
    if(when_Axi4Crossbar_l500_1) begin
      if(when_Axi4Crossbar_l503_2) begin
        if(when_Axi4Crossbar_l509_1) begin
          io_slaves_1_wdata = io_masters_0_wdata;
        end
      end
      if(when_Axi4Crossbar_l503_3) begin
        if(when_Axi4Crossbar_l509_1) begin
          io_slaves_1_wdata = io_masters_1_wdata;
        end
      end
    end
    if(when_Axi4Crossbar_l530_1) begin
      if(when_Axi4Crossbar_l532_2) begin
        io_slaves_1_wdata = io_masters_0_wdata;
      end
      if(when_Axi4Crossbar_l532_3) begin
        io_slaves_1_wdata = io_masters_1_wdata;
      end
    end
  end

  always @(*) begin
    io_slaves_1_wstrb = _zz_io_slaves_1_wdata[35 : 32];
    if(when_Axi4Crossbar_l500_1) begin
      if(when_Axi4Crossbar_l503_2) begin
        if(when_Axi4Crossbar_l509_1) begin
          io_slaves_1_wstrb = io_masters_0_wstrb;
        end
      end
      if(when_Axi4Crossbar_l503_3) begin
        if(when_Axi4Crossbar_l509_1) begin
          io_slaves_1_wstrb = io_masters_1_wstrb;
        end
      end
    end
    if(when_Axi4Crossbar_l530_1) begin
      if(when_Axi4Crossbar_l532_2) begin
        io_slaves_1_wstrb = io_masters_0_wstrb;
      end
      if(when_Axi4Crossbar_l532_3) begin
        io_slaves_1_wstrb = io_masters_1_wstrb;
      end
    end
  end

  always @(*) begin
    io_slaves_1_wlast = _zz_io_slaves_1_wdata[36];
    if(when_Axi4Crossbar_l500_1) begin
      if(when_Axi4Crossbar_l503_2) begin
        if(when_Axi4Crossbar_l509_1) begin
          io_slaves_1_wlast = io_masters_0_wlast;
        end
      end
      if(when_Axi4Crossbar_l503_3) begin
        if(when_Axi4Crossbar_l509_1) begin
          io_slaves_1_wlast = io_masters_1_wlast;
        end
      end
    end
    if(when_Axi4Crossbar_l530_1) begin
      if(when_Axi4Crossbar_l532_2) begin
        io_slaves_1_wlast = io_masters_0_wlast;
      end
      if(when_Axi4Crossbar_l532_3) begin
        io_slaves_1_wlast = io_masters_1_wlast;
      end
    end
  end

  always @(*) begin
    io_slaves_1_bready = 1'b0;
    if(when_Axi4Crossbar_l584_1) begin
      io_slaves_1_bready = io_masters_0_bready;
    end
    if(when_Axi4Crossbar_l584_6) begin
      io_slaves_1_bready = io_masters_1_bready;
    end
  end

  always @(*) begin
    io_slaves_1_arvalid = 1'b0;
    if(when_Axi4Crossbar_l615_1) begin
      io_slaves_1_arvalid = 1'b1;
    end
  end

  assign _zz_io_slaves_1_araddr = 63'h0;
  always @(*) begin
    io_slaves_1_araddr = _zz_io_slaves_1_araddr[31 : 0];
    if(when_Axi4Crossbar_l615_1) begin
      if(when_Axi4Crossbar_l618_2) begin
        io_slaves_1_araddr = io_masters_0_araddr;
      end
      if(when_Axi4Crossbar_l618_3) begin
        io_slaves_1_araddr = io_masters_1_araddr;
      end
    end
  end

  always @(*) begin
    io_slaves_1_arid = _zz_io_slaves_1_araddr[33 : 32];
    if(when_Axi4Crossbar_l615_1) begin
      if(when_Axi4Crossbar_l618_2) begin
        io_slaves_1_arid = {_zz_io_slaves_1_arid,io_masters_0_arid};
      end
      if(when_Axi4Crossbar_l618_3) begin
        io_slaves_1_arid = {_zz_io_slaves_1_arid,io_masters_1_arid};
      end
    end
  end

  assign io_slaves_1_arregion = _zz_io_slaves_1_araddr[37 : 34];
  always @(*) begin
    io_slaves_1_arlen = _zz_io_slaves_1_araddr[45 : 38];
    if(when_Axi4Crossbar_l615_1) begin
      if(when_Axi4Crossbar_l618_2) begin
        io_slaves_1_arlen = io_masters_0_arlen;
      end
      if(when_Axi4Crossbar_l618_3) begin
        io_slaves_1_arlen = io_masters_1_arlen;
      end
    end
  end

  always @(*) begin
    io_slaves_1_arsize = _zz_io_slaves_1_araddr[48 : 46];
    if(when_Axi4Crossbar_l615_1) begin
      if(when_Axi4Crossbar_l618_2) begin
        io_slaves_1_arsize = io_masters_0_arsize;
      end
      if(when_Axi4Crossbar_l618_3) begin
        io_slaves_1_arsize = io_masters_1_arsize;
      end
    end
  end

  always @(*) begin
    io_slaves_1_arburst = _zz_io_slaves_1_araddr[50 : 49];
    if(when_Axi4Crossbar_l615_1) begin
      if(when_Axi4Crossbar_l618_2) begin
        io_slaves_1_arburst = io_masters_0_arburst;
      end
      if(when_Axi4Crossbar_l618_3) begin
        io_slaves_1_arburst = io_masters_1_arburst;
      end
    end
  end

  always @(*) begin
    io_slaves_1_arlock = _zz_io_slaves_1_araddr[51 : 51];
    if(when_Axi4Crossbar_l615_1) begin
      if(when_Axi4Crossbar_l618_2) begin
        io_slaves_1_arlock = io_masters_0_arlock;
      end
      if(when_Axi4Crossbar_l618_3) begin
        io_slaves_1_arlock = io_masters_1_arlock;
      end
    end
  end

  always @(*) begin
    io_slaves_1_arcache = _zz_io_slaves_1_araddr[55 : 52];
    if(when_Axi4Crossbar_l615_1) begin
      if(when_Axi4Crossbar_l618_2) begin
        io_slaves_1_arcache = io_masters_0_arcache;
      end
      if(when_Axi4Crossbar_l618_3) begin
        io_slaves_1_arcache = io_masters_1_arcache;
      end
    end
  end

  always @(*) begin
    io_slaves_1_arqos = _zz_io_slaves_1_araddr[59 : 56];
    if(when_Axi4Crossbar_l615_1) begin
      if(when_Axi4Crossbar_l618_2) begin
        io_slaves_1_arqos = io_masters_0_arqos;
      end
      if(when_Axi4Crossbar_l618_3) begin
        io_slaves_1_arqos = io_masters_1_arqos;
      end
    end
  end

  always @(*) begin
    io_slaves_1_arprot = _zz_io_slaves_1_araddr[62 : 60];
    if(when_Axi4Crossbar_l615_1) begin
      if(when_Axi4Crossbar_l618_2) begin
        io_slaves_1_arprot = io_masters_0_arprot;
      end
      if(when_Axi4Crossbar_l618_3) begin
        io_slaves_1_arprot = io_masters_1_arprot;
      end
    end
  end

  always @(*) begin
    io_slaves_1_rready = 1'b0;
    if(when_Axi4Crossbar_l656_1) begin
      io_slaves_1_rready = io_masters_0_rready;
    end
    if(when_Axi4Crossbar_l656_6) begin
      io_slaves_1_rready = io_masters_1_rready;
    end
  end

  always @(*) begin
    io_slaves_2_awvalid = 1'b0;
    if(when_Axi4Crossbar_l500_2) begin
      io_slaves_2_awvalid = 1'b1;
    end
  end

  assign _zz_io_slaves_2_awaddr = 63'h0;
  always @(*) begin
    io_slaves_2_awaddr = _zz_io_slaves_2_awaddr[31 : 0];
    if(when_Axi4Crossbar_l500_2) begin
      if(when_Axi4Crossbar_l503_4) begin
        io_slaves_2_awaddr = io_masters_0_awaddr;
      end
      if(when_Axi4Crossbar_l503_5) begin
        io_slaves_2_awaddr = io_masters_1_awaddr;
      end
    end
  end

  always @(*) begin
    io_slaves_2_awid = _zz_io_slaves_2_awaddr[33 : 32];
    if(when_Axi4Crossbar_l500_2) begin
      if(when_Axi4Crossbar_l503_4) begin
        io_slaves_2_awid = {_zz_io_slaves_2_awid,io_masters_0_awid};
      end
      if(when_Axi4Crossbar_l503_5) begin
        io_slaves_2_awid = {_zz_io_slaves_2_awid,io_masters_1_awid};
      end
    end
  end

  assign io_slaves_2_awregion = _zz_io_slaves_2_awaddr[37 : 34];
  always @(*) begin
    io_slaves_2_awlen = _zz_io_slaves_2_awaddr[45 : 38];
    if(when_Axi4Crossbar_l500_2) begin
      if(when_Axi4Crossbar_l503_4) begin
        io_slaves_2_awlen = io_masters_0_awlen;
      end
      if(when_Axi4Crossbar_l503_5) begin
        io_slaves_2_awlen = io_masters_1_awlen;
      end
    end
  end

  always @(*) begin
    io_slaves_2_awsize = _zz_io_slaves_2_awaddr[48 : 46];
    if(when_Axi4Crossbar_l500_2) begin
      if(when_Axi4Crossbar_l503_4) begin
        io_slaves_2_awsize = io_masters_0_awsize;
      end
      if(when_Axi4Crossbar_l503_5) begin
        io_slaves_2_awsize = io_masters_1_awsize;
      end
    end
  end

  always @(*) begin
    io_slaves_2_awburst = _zz_io_slaves_2_awaddr[50 : 49];
    if(when_Axi4Crossbar_l500_2) begin
      if(when_Axi4Crossbar_l503_4) begin
        io_slaves_2_awburst = io_masters_0_awburst;
      end
      if(when_Axi4Crossbar_l503_5) begin
        io_slaves_2_awburst = io_masters_1_awburst;
      end
    end
  end

  always @(*) begin
    io_slaves_2_awlock = _zz_io_slaves_2_awaddr[51 : 51];
    if(when_Axi4Crossbar_l500_2) begin
      if(when_Axi4Crossbar_l503_4) begin
        io_slaves_2_awlock = io_masters_0_awlock;
      end
      if(when_Axi4Crossbar_l503_5) begin
        io_slaves_2_awlock = io_masters_1_awlock;
      end
    end
  end

  always @(*) begin
    io_slaves_2_awcache = _zz_io_slaves_2_awaddr[55 : 52];
    if(when_Axi4Crossbar_l500_2) begin
      if(when_Axi4Crossbar_l503_4) begin
        io_slaves_2_awcache = io_masters_0_awcache;
      end
      if(when_Axi4Crossbar_l503_5) begin
        io_slaves_2_awcache = io_masters_1_awcache;
      end
    end
  end

  always @(*) begin
    io_slaves_2_awqos = _zz_io_slaves_2_awaddr[59 : 56];
    if(when_Axi4Crossbar_l500_2) begin
      if(when_Axi4Crossbar_l503_4) begin
        io_slaves_2_awqos = io_masters_0_awqos;
      end
      if(when_Axi4Crossbar_l503_5) begin
        io_slaves_2_awqos = io_masters_1_awqos;
      end
    end
  end

  always @(*) begin
    io_slaves_2_awprot = _zz_io_slaves_2_awaddr[62 : 60];
    if(when_Axi4Crossbar_l500_2) begin
      if(when_Axi4Crossbar_l503_4) begin
        io_slaves_2_awprot = io_masters_0_awprot;
      end
      if(when_Axi4Crossbar_l503_5) begin
        io_slaves_2_awprot = io_masters_1_awprot;
      end
    end
  end

  always @(*) begin
    io_slaves_2_wvalid = 1'b0;
    if(when_Axi4Crossbar_l500_2) begin
      if(when_Axi4Crossbar_l503_4) begin
        if(when_Axi4Crossbar_l509_2) begin
          io_slaves_2_wvalid = io_masters_0_wvalid;
        end
      end
      if(when_Axi4Crossbar_l503_5) begin
        if(when_Axi4Crossbar_l509_2) begin
          io_slaves_2_wvalid = io_masters_1_wvalid;
        end
      end
    end
    if(when_Axi4Crossbar_l530_2) begin
      if(when_Axi4Crossbar_l532_4) begin
        io_slaves_2_wvalid = io_masters_0_wvalid;
      end
      if(when_Axi4Crossbar_l532_5) begin
        io_slaves_2_wvalid = io_masters_1_wvalid;
      end
    end
  end

  assign _zz_io_slaves_2_wdata = 37'h0;
  always @(*) begin
    io_slaves_2_wdata = _zz_io_slaves_2_wdata[31 : 0];
    if(when_Axi4Crossbar_l500_2) begin
      if(when_Axi4Crossbar_l503_4) begin
        if(when_Axi4Crossbar_l509_2) begin
          io_slaves_2_wdata = io_masters_0_wdata;
        end
      end
      if(when_Axi4Crossbar_l503_5) begin
        if(when_Axi4Crossbar_l509_2) begin
          io_slaves_2_wdata = io_masters_1_wdata;
        end
      end
    end
    if(when_Axi4Crossbar_l530_2) begin
      if(when_Axi4Crossbar_l532_4) begin
        io_slaves_2_wdata = io_masters_0_wdata;
      end
      if(when_Axi4Crossbar_l532_5) begin
        io_slaves_2_wdata = io_masters_1_wdata;
      end
    end
  end

  always @(*) begin
    io_slaves_2_wstrb = _zz_io_slaves_2_wdata[35 : 32];
    if(when_Axi4Crossbar_l500_2) begin
      if(when_Axi4Crossbar_l503_4) begin
        if(when_Axi4Crossbar_l509_2) begin
          io_slaves_2_wstrb = io_masters_0_wstrb;
        end
      end
      if(when_Axi4Crossbar_l503_5) begin
        if(when_Axi4Crossbar_l509_2) begin
          io_slaves_2_wstrb = io_masters_1_wstrb;
        end
      end
    end
    if(when_Axi4Crossbar_l530_2) begin
      if(when_Axi4Crossbar_l532_4) begin
        io_slaves_2_wstrb = io_masters_0_wstrb;
      end
      if(when_Axi4Crossbar_l532_5) begin
        io_slaves_2_wstrb = io_masters_1_wstrb;
      end
    end
  end

  always @(*) begin
    io_slaves_2_wlast = _zz_io_slaves_2_wdata[36];
    if(when_Axi4Crossbar_l500_2) begin
      if(when_Axi4Crossbar_l503_4) begin
        if(when_Axi4Crossbar_l509_2) begin
          io_slaves_2_wlast = io_masters_0_wlast;
        end
      end
      if(when_Axi4Crossbar_l503_5) begin
        if(when_Axi4Crossbar_l509_2) begin
          io_slaves_2_wlast = io_masters_1_wlast;
        end
      end
    end
    if(when_Axi4Crossbar_l530_2) begin
      if(when_Axi4Crossbar_l532_4) begin
        io_slaves_2_wlast = io_masters_0_wlast;
      end
      if(when_Axi4Crossbar_l532_5) begin
        io_slaves_2_wlast = io_masters_1_wlast;
      end
    end
  end

  always @(*) begin
    io_slaves_2_bready = 1'b0;
    if(when_Axi4Crossbar_l584_2) begin
      io_slaves_2_bready = io_masters_0_bready;
    end
    if(when_Axi4Crossbar_l584_7) begin
      io_slaves_2_bready = io_masters_1_bready;
    end
  end

  always @(*) begin
    io_slaves_2_arvalid = 1'b0;
    if(when_Axi4Crossbar_l615_2) begin
      io_slaves_2_arvalid = 1'b1;
    end
  end

  assign _zz_io_slaves_2_araddr = 63'h0;
  always @(*) begin
    io_slaves_2_araddr = _zz_io_slaves_2_araddr[31 : 0];
    if(when_Axi4Crossbar_l615_2) begin
      if(when_Axi4Crossbar_l618_4) begin
        io_slaves_2_araddr = io_masters_0_araddr;
      end
      if(when_Axi4Crossbar_l618_5) begin
        io_slaves_2_araddr = io_masters_1_araddr;
      end
    end
  end

  always @(*) begin
    io_slaves_2_arid = _zz_io_slaves_2_araddr[33 : 32];
    if(when_Axi4Crossbar_l615_2) begin
      if(when_Axi4Crossbar_l618_4) begin
        io_slaves_2_arid = {_zz_io_slaves_2_arid,io_masters_0_arid};
      end
      if(when_Axi4Crossbar_l618_5) begin
        io_slaves_2_arid = {_zz_io_slaves_2_arid,io_masters_1_arid};
      end
    end
  end

  assign io_slaves_2_arregion = _zz_io_slaves_2_araddr[37 : 34];
  always @(*) begin
    io_slaves_2_arlen = _zz_io_slaves_2_araddr[45 : 38];
    if(when_Axi4Crossbar_l615_2) begin
      if(when_Axi4Crossbar_l618_4) begin
        io_slaves_2_arlen = io_masters_0_arlen;
      end
      if(when_Axi4Crossbar_l618_5) begin
        io_slaves_2_arlen = io_masters_1_arlen;
      end
    end
  end

  always @(*) begin
    io_slaves_2_arsize = _zz_io_slaves_2_araddr[48 : 46];
    if(when_Axi4Crossbar_l615_2) begin
      if(when_Axi4Crossbar_l618_4) begin
        io_slaves_2_arsize = io_masters_0_arsize;
      end
      if(when_Axi4Crossbar_l618_5) begin
        io_slaves_2_arsize = io_masters_1_arsize;
      end
    end
  end

  always @(*) begin
    io_slaves_2_arburst = _zz_io_slaves_2_araddr[50 : 49];
    if(when_Axi4Crossbar_l615_2) begin
      if(when_Axi4Crossbar_l618_4) begin
        io_slaves_2_arburst = io_masters_0_arburst;
      end
      if(when_Axi4Crossbar_l618_5) begin
        io_slaves_2_arburst = io_masters_1_arburst;
      end
    end
  end

  always @(*) begin
    io_slaves_2_arlock = _zz_io_slaves_2_araddr[51 : 51];
    if(when_Axi4Crossbar_l615_2) begin
      if(when_Axi4Crossbar_l618_4) begin
        io_slaves_2_arlock = io_masters_0_arlock;
      end
      if(when_Axi4Crossbar_l618_5) begin
        io_slaves_2_arlock = io_masters_1_arlock;
      end
    end
  end

  always @(*) begin
    io_slaves_2_arcache = _zz_io_slaves_2_araddr[55 : 52];
    if(when_Axi4Crossbar_l615_2) begin
      if(when_Axi4Crossbar_l618_4) begin
        io_slaves_2_arcache = io_masters_0_arcache;
      end
      if(when_Axi4Crossbar_l618_5) begin
        io_slaves_2_arcache = io_masters_1_arcache;
      end
    end
  end

  always @(*) begin
    io_slaves_2_arqos = _zz_io_slaves_2_araddr[59 : 56];
    if(when_Axi4Crossbar_l615_2) begin
      if(when_Axi4Crossbar_l618_4) begin
        io_slaves_2_arqos = io_masters_0_arqos;
      end
      if(when_Axi4Crossbar_l618_5) begin
        io_slaves_2_arqos = io_masters_1_arqos;
      end
    end
  end

  always @(*) begin
    io_slaves_2_arprot = _zz_io_slaves_2_araddr[62 : 60];
    if(when_Axi4Crossbar_l615_2) begin
      if(when_Axi4Crossbar_l618_4) begin
        io_slaves_2_arprot = io_masters_0_arprot;
      end
      if(when_Axi4Crossbar_l618_5) begin
        io_slaves_2_arprot = io_masters_1_arprot;
      end
    end
  end

  always @(*) begin
    io_slaves_2_rready = 1'b0;
    if(when_Axi4Crossbar_l656_2) begin
      io_slaves_2_rready = io_masters_0_rready;
    end
    if(when_Axi4Crossbar_l656_7) begin
      io_slaves_2_rready = io_masters_1_rready;
    end
  end

  always @(*) begin
    io_slaves_3_awvalid = 1'b0;
    if(when_Axi4Crossbar_l500_3) begin
      io_slaves_3_awvalid = 1'b1;
    end
  end

  assign _zz_io_slaves_3_awaddr = 63'h0;
  always @(*) begin
    io_slaves_3_awaddr = _zz_io_slaves_3_awaddr[31 : 0];
    if(when_Axi4Crossbar_l500_3) begin
      if(when_Axi4Crossbar_l503_6) begin
        io_slaves_3_awaddr = io_masters_0_awaddr;
      end
      if(when_Axi4Crossbar_l503_7) begin
        io_slaves_3_awaddr = io_masters_1_awaddr;
      end
    end
  end

  always @(*) begin
    io_slaves_3_awid = _zz_io_slaves_3_awaddr[33 : 32];
    if(when_Axi4Crossbar_l500_3) begin
      if(when_Axi4Crossbar_l503_6) begin
        io_slaves_3_awid = {_zz_io_slaves_3_awid,io_masters_0_awid};
      end
      if(when_Axi4Crossbar_l503_7) begin
        io_slaves_3_awid = {_zz_io_slaves_3_awid,io_masters_1_awid};
      end
    end
  end

  assign io_slaves_3_awregion = _zz_io_slaves_3_awaddr[37 : 34];
  always @(*) begin
    io_slaves_3_awlen = _zz_io_slaves_3_awaddr[45 : 38];
    if(when_Axi4Crossbar_l500_3) begin
      if(when_Axi4Crossbar_l503_6) begin
        io_slaves_3_awlen = io_masters_0_awlen;
      end
      if(when_Axi4Crossbar_l503_7) begin
        io_slaves_3_awlen = io_masters_1_awlen;
      end
    end
  end

  always @(*) begin
    io_slaves_3_awsize = _zz_io_slaves_3_awaddr[48 : 46];
    if(when_Axi4Crossbar_l500_3) begin
      if(when_Axi4Crossbar_l503_6) begin
        io_slaves_3_awsize = io_masters_0_awsize;
      end
      if(when_Axi4Crossbar_l503_7) begin
        io_slaves_3_awsize = io_masters_1_awsize;
      end
    end
  end

  always @(*) begin
    io_slaves_3_awburst = _zz_io_slaves_3_awaddr[50 : 49];
    if(when_Axi4Crossbar_l500_3) begin
      if(when_Axi4Crossbar_l503_6) begin
        io_slaves_3_awburst = io_masters_0_awburst;
      end
      if(when_Axi4Crossbar_l503_7) begin
        io_slaves_3_awburst = io_masters_1_awburst;
      end
    end
  end

  always @(*) begin
    io_slaves_3_awlock = _zz_io_slaves_3_awaddr[51 : 51];
    if(when_Axi4Crossbar_l500_3) begin
      if(when_Axi4Crossbar_l503_6) begin
        io_slaves_3_awlock = io_masters_0_awlock;
      end
      if(when_Axi4Crossbar_l503_7) begin
        io_slaves_3_awlock = io_masters_1_awlock;
      end
    end
  end

  always @(*) begin
    io_slaves_3_awcache = _zz_io_slaves_3_awaddr[55 : 52];
    if(when_Axi4Crossbar_l500_3) begin
      if(when_Axi4Crossbar_l503_6) begin
        io_slaves_3_awcache = io_masters_0_awcache;
      end
      if(when_Axi4Crossbar_l503_7) begin
        io_slaves_3_awcache = io_masters_1_awcache;
      end
    end
  end

  always @(*) begin
    io_slaves_3_awqos = _zz_io_slaves_3_awaddr[59 : 56];
    if(when_Axi4Crossbar_l500_3) begin
      if(when_Axi4Crossbar_l503_6) begin
        io_slaves_3_awqos = io_masters_0_awqos;
      end
      if(when_Axi4Crossbar_l503_7) begin
        io_slaves_3_awqos = io_masters_1_awqos;
      end
    end
  end

  always @(*) begin
    io_slaves_3_awprot = _zz_io_slaves_3_awaddr[62 : 60];
    if(when_Axi4Crossbar_l500_3) begin
      if(when_Axi4Crossbar_l503_6) begin
        io_slaves_3_awprot = io_masters_0_awprot;
      end
      if(when_Axi4Crossbar_l503_7) begin
        io_slaves_3_awprot = io_masters_1_awprot;
      end
    end
  end

  always @(*) begin
    io_slaves_3_wvalid = 1'b0;
    if(when_Axi4Crossbar_l500_3) begin
      if(when_Axi4Crossbar_l503_6) begin
        if(when_Axi4Crossbar_l509_3) begin
          io_slaves_3_wvalid = io_masters_0_wvalid;
        end
      end
      if(when_Axi4Crossbar_l503_7) begin
        if(when_Axi4Crossbar_l509_3) begin
          io_slaves_3_wvalid = io_masters_1_wvalid;
        end
      end
    end
    if(when_Axi4Crossbar_l530_3) begin
      if(when_Axi4Crossbar_l532_6) begin
        io_slaves_3_wvalid = io_masters_0_wvalid;
      end
      if(when_Axi4Crossbar_l532_7) begin
        io_slaves_3_wvalid = io_masters_1_wvalid;
      end
    end
  end

  assign _zz_io_slaves_3_wdata = 37'h0;
  always @(*) begin
    io_slaves_3_wdata = _zz_io_slaves_3_wdata[31 : 0];
    if(when_Axi4Crossbar_l500_3) begin
      if(when_Axi4Crossbar_l503_6) begin
        if(when_Axi4Crossbar_l509_3) begin
          io_slaves_3_wdata = io_masters_0_wdata;
        end
      end
      if(when_Axi4Crossbar_l503_7) begin
        if(when_Axi4Crossbar_l509_3) begin
          io_slaves_3_wdata = io_masters_1_wdata;
        end
      end
    end
    if(when_Axi4Crossbar_l530_3) begin
      if(when_Axi4Crossbar_l532_6) begin
        io_slaves_3_wdata = io_masters_0_wdata;
      end
      if(when_Axi4Crossbar_l532_7) begin
        io_slaves_3_wdata = io_masters_1_wdata;
      end
    end
  end

  always @(*) begin
    io_slaves_3_wstrb = _zz_io_slaves_3_wdata[35 : 32];
    if(when_Axi4Crossbar_l500_3) begin
      if(when_Axi4Crossbar_l503_6) begin
        if(when_Axi4Crossbar_l509_3) begin
          io_slaves_3_wstrb = io_masters_0_wstrb;
        end
      end
      if(when_Axi4Crossbar_l503_7) begin
        if(when_Axi4Crossbar_l509_3) begin
          io_slaves_3_wstrb = io_masters_1_wstrb;
        end
      end
    end
    if(when_Axi4Crossbar_l530_3) begin
      if(when_Axi4Crossbar_l532_6) begin
        io_slaves_3_wstrb = io_masters_0_wstrb;
      end
      if(when_Axi4Crossbar_l532_7) begin
        io_slaves_3_wstrb = io_masters_1_wstrb;
      end
    end
  end

  always @(*) begin
    io_slaves_3_wlast = _zz_io_slaves_3_wdata[36];
    if(when_Axi4Crossbar_l500_3) begin
      if(when_Axi4Crossbar_l503_6) begin
        if(when_Axi4Crossbar_l509_3) begin
          io_slaves_3_wlast = io_masters_0_wlast;
        end
      end
      if(when_Axi4Crossbar_l503_7) begin
        if(when_Axi4Crossbar_l509_3) begin
          io_slaves_3_wlast = io_masters_1_wlast;
        end
      end
    end
    if(when_Axi4Crossbar_l530_3) begin
      if(when_Axi4Crossbar_l532_6) begin
        io_slaves_3_wlast = io_masters_0_wlast;
      end
      if(when_Axi4Crossbar_l532_7) begin
        io_slaves_3_wlast = io_masters_1_wlast;
      end
    end
  end

  always @(*) begin
    io_slaves_3_bready = 1'b0;
    if(when_Axi4Crossbar_l584_3) begin
      io_slaves_3_bready = io_masters_0_bready;
    end
    if(when_Axi4Crossbar_l584_8) begin
      io_slaves_3_bready = io_masters_1_bready;
    end
  end

  always @(*) begin
    io_slaves_3_arvalid = 1'b0;
    if(when_Axi4Crossbar_l615_3) begin
      io_slaves_3_arvalid = 1'b1;
    end
  end

  assign _zz_io_slaves_3_araddr = 63'h0;
  always @(*) begin
    io_slaves_3_araddr = _zz_io_slaves_3_araddr[31 : 0];
    if(when_Axi4Crossbar_l615_3) begin
      if(when_Axi4Crossbar_l618_6) begin
        io_slaves_3_araddr = io_masters_0_araddr;
      end
      if(when_Axi4Crossbar_l618_7) begin
        io_slaves_3_araddr = io_masters_1_araddr;
      end
    end
  end

  always @(*) begin
    io_slaves_3_arid = _zz_io_slaves_3_araddr[33 : 32];
    if(when_Axi4Crossbar_l615_3) begin
      if(when_Axi4Crossbar_l618_6) begin
        io_slaves_3_arid = {_zz_io_slaves_3_arid,io_masters_0_arid};
      end
      if(when_Axi4Crossbar_l618_7) begin
        io_slaves_3_arid = {_zz_io_slaves_3_arid,io_masters_1_arid};
      end
    end
  end

  assign io_slaves_3_arregion = _zz_io_slaves_3_araddr[37 : 34];
  always @(*) begin
    io_slaves_3_arlen = _zz_io_slaves_3_araddr[45 : 38];
    if(when_Axi4Crossbar_l615_3) begin
      if(when_Axi4Crossbar_l618_6) begin
        io_slaves_3_arlen = io_masters_0_arlen;
      end
      if(when_Axi4Crossbar_l618_7) begin
        io_slaves_3_arlen = io_masters_1_arlen;
      end
    end
  end

  always @(*) begin
    io_slaves_3_arsize = _zz_io_slaves_3_araddr[48 : 46];
    if(when_Axi4Crossbar_l615_3) begin
      if(when_Axi4Crossbar_l618_6) begin
        io_slaves_3_arsize = io_masters_0_arsize;
      end
      if(when_Axi4Crossbar_l618_7) begin
        io_slaves_3_arsize = io_masters_1_arsize;
      end
    end
  end

  always @(*) begin
    io_slaves_3_arburst = _zz_io_slaves_3_araddr[50 : 49];
    if(when_Axi4Crossbar_l615_3) begin
      if(when_Axi4Crossbar_l618_6) begin
        io_slaves_3_arburst = io_masters_0_arburst;
      end
      if(when_Axi4Crossbar_l618_7) begin
        io_slaves_3_arburst = io_masters_1_arburst;
      end
    end
  end

  always @(*) begin
    io_slaves_3_arlock = _zz_io_slaves_3_araddr[51 : 51];
    if(when_Axi4Crossbar_l615_3) begin
      if(when_Axi4Crossbar_l618_6) begin
        io_slaves_3_arlock = io_masters_0_arlock;
      end
      if(when_Axi4Crossbar_l618_7) begin
        io_slaves_3_arlock = io_masters_1_arlock;
      end
    end
  end

  always @(*) begin
    io_slaves_3_arcache = _zz_io_slaves_3_araddr[55 : 52];
    if(when_Axi4Crossbar_l615_3) begin
      if(when_Axi4Crossbar_l618_6) begin
        io_slaves_3_arcache = io_masters_0_arcache;
      end
      if(when_Axi4Crossbar_l618_7) begin
        io_slaves_3_arcache = io_masters_1_arcache;
      end
    end
  end

  always @(*) begin
    io_slaves_3_arqos = _zz_io_slaves_3_araddr[59 : 56];
    if(when_Axi4Crossbar_l615_3) begin
      if(when_Axi4Crossbar_l618_6) begin
        io_slaves_3_arqos = io_masters_0_arqos;
      end
      if(when_Axi4Crossbar_l618_7) begin
        io_slaves_3_arqos = io_masters_1_arqos;
      end
    end
  end

  always @(*) begin
    io_slaves_3_arprot = _zz_io_slaves_3_araddr[62 : 60];
    if(when_Axi4Crossbar_l615_3) begin
      if(when_Axi4Crossbar_l618_6) begin
        io_slaves_3_arprot = io_masters_0_arprot;
      end
      if(when_Axi4Crossbar_l618_7) begin
        io_slaves_3_arprot = io_masters_1_arprot;
      end
    end
  end

  always @(*) begin
    io_slaves_3_rready = 1'b0;
    if(when_Axi4Crossbar_l656_3) begin
      io_slaves_3_rready = io_masters_0_rready;
    end
    if(when_Axi4Crossbar_l656_8) begin
      io_slaves_3_rready = io_masters_1_rready;
    end
  end

  always @(*) begin
    decErr_io_axi_awvalid = 1'b0;
    if(when_Axi4Crossbar_l500_4) begin
      decErr_io_axi_awvalid = 1'b1;
    end
  end

  assign _zz_io_axi_awaddr = 63'h0;
  always @(*) begin
    decErr_io_axi_awaddr = _zz_io_axi_awaddr[31 : 0];
    if(when_Axi4Crossbar_l500_4) begin
      if(when_Axi4Crossbar_l503_8) begin
        decErr_io_axi_awaddr = io_masters_0_awaddr;
      end
      if(when_Axi4Crossbar_l503_9) begin
        decErr_io_axi_awaddr = io_masters_1_awaddr;
      end
    end
  end

  always @(*) begin
    decErr_io_axi_awid = _zz_io_axi_awaddr[33 : 32];
    if(when_Axi4Crossbar_l500_4) begin
      if(when_Axi4Crossbar_l503_8) begin
        decErr_io_axi_awid = {_zz_wrRrPtr_4,io_masters_0_awid};
      end
      if(when_Axi4Crossbar_l503_9) begin
        decErr_io_axi_awid = {_zz_wrRrPtr_4,io_masters_1_awid};
      end
    end
  end

  assign decErr_io_axi_awregion = _zz_io_axi_awaddr[37 : 34];
  always @(*) begin
    decErr_io_axi_awlen = _zz_io_axi_awaddr[45 : 38];
    if(when_Axi4Crossbar_l500_4) begin
      if(when_Axi4Crossbar_l503_8) begin
        decErr_io_axi_awlen = io_masters_0_awlen;
      end
      if(when_Axi4Crossbar_l503_9) begin
        decErr_io_axi_awlen = io_masters_1_awlen;
      end
    end
  end

  always @(*) begin
    decErr_io_axi_awsize = _zz_io_axi_awaddr[48 : 46];
    if(when_Axi4Crossbar_l500_4) begin
      if(when_Axi4Crossbar_l503_8) begin
        decErr_io_axi_awsize = io_masters_0_awsize;
      end
      if(when_Axi4Crossbar_l503_9) begin
        decErr_io_axi_awsize = io_masters_1_awsize;
      end
    end
  end

  always @(*) begin
    decErr_io_axi_awburst = _zz_io_axi_awaddr[50 : 49];
    if(when_Axi4Crossbar_l500_4) begin
      if(when_Axi4Crossbar_l503_8) begin
        decErr_io_axi_awburst = io_masters_0_awburst;
      end
      if(when_Axi4Crossbar_l503_9) begin
        decErr_io_axi_awburst = io_masters_1_awburst;
      end
    end
  end

  always @(*) begin
    decErr_io_axi_awlock = _zz_io_axi_awaddr[51 : 51];
    if(when_Axi4Crossbar_l500_4) begin
      if(when_Axi4Crossbar_l503_8) begin
        decErr_io_axi_awlock = io_masters_0_awlock;
      end
      if(when_Axi4Crossbar_l503_9) begin
        decErr_io_axi_awlock = io_masters_1_awlock;
      end
    end
  end

  always @(*) begin
    decErr_io_axi_awcache = _zz_io_axi_awaddr[55 : 52];
    if(when_Axi4Crossbar_l500_4) begin
      if(when_Axi4Crossbar_l503_8) begin
        decErr_io_axi_awcache = io_masters_0_awcache;
      end
      if(when_Axi4Crossbar_l503_9) begin
        decErr_io_axi_awcache = io_masters_1_awcache;
      end
    end
  end

  always @(*) begin
    decErr_io_axi_awqos = _zz_io_axi_awaddr[59 : 56];
    if(when_Axi4Crossbar_l500_4) begin
      if(when_Axi4Crossbar_l503_8) begin
        decErr_io_axi_awqos = io_masters_0_awqos;
      end
      if(when_Axi4Crossbar_l503_9) begin
        decErr_io_axi_awqos = io_masters_1_awqos;
      end
    end
  end

  always @(*) begin
    decErr_io_axi_awprot = _zz_io_axi_awaddr[62 : 60];
    if(when_Axi4Crossbar_l500_4) begin
      if(when_Axi4Crossbar_l503_8) begin
        decErr_io_axi_awprot = io_masters_0_awprot;
      end
      if(when_Axi4Crossbar_l503_9) begin
        decErr_io_axi_awprot = io_masters_1_awprot;
      end
    end
  end

  always @(*) begin
    decErr_io_axi_wvalid = 1'b0;
    if(when_Axi4Crossbar_l500_4) begin
      if(when_Axi4Crossbar_l503_8) begin
        if(when_Axi4Crossbar_l509_4) begin
          decErr_io_axi_wvalid = io_masters_0_wvalid;
        end
      end
      if(when_Axi4Crossbar_l503_9) begin
        if(when_Axi4Crossbar_l509_4) begin
          decErr_io_axi_wvalid = io_masters_1_wvalid;
        end
      end
    end
    if(when_Axi4Crossbar_l530_4) begin
      if(when_Axi4Crossbar_l532_8) begin
        decErr_io_axi_wvalid = io_masters_0_wvalid;
      end
      if(when_Axi4Crossbar_l532_9) begin
        decErr_io_axi_wvalid = io_masters_1_wvalid;
      end
    end
  end

  assign _zz_io_axi_wdata = 37'h0;
  always @(*) begin
    decErr_io_axi_wdata = _zz_io_axi_wdata[31 : 0];
    if(when_Axi4Crossbar_l500_4) begin
      if(when_Axi4Crossbar_l503_8) begin
        if(when_Axi4Crossbar_l509_4) begin
          decErr_io_axi_wdata = io_masters_0_wdata;
        end
      end
      if(when_Axi4Crossbar_l503_9) begin
        if(when_Axi4Crossbar_l509_4) begin
          decErr_io_axi_wdata = io_masters_1_wdata;
        end
      end
    end
    if(when_Axi4Crossbar_l530_4) begin
      if(when_Axi4Crossbar_l532_8) begin
        decErr_io_axi_wdata = io_masters_0_wdata;
      end
      if(when_Axi4Crossbar_l532_9) begin
        decErr_io_axi_wdata = io_masters_1_wdata;
      end
    end
  end

  always @(*) begin
    decErr_io_axi_wstrb = _zz_io_axi_wdata[35 : 32];
    if(when_Axi4Crossbar_l500_4) begin
      if(when_Axi4Crossbar_l503_8) begin
        if(when_Axi4Crossbar_l509_4) begin
          decErr_io_axi_wstrb = io_masters_0_wstrb;
        end
      end
      if(when_Axi4Crossbar_l503_9) begin
        if(when_Axi4Crossbar_l509_4) begin
          decErr_io_axi_wstrb = io_masters_1_wstrb;
        end
      end
    end
    if(when_Axi4Crossbar_l530_4) begin
      if(when_Axi4Crossbar_l532_8) begin
        decErr_io_axi_wstrb = io_masters_0_wstrb;
      end
      if(when_Axi4Crossbar_l532_9) begin
        decErr_io_axi_wstrb = io_masters_1_wstrb;
      end
    end
  end

  always @(*) begin
    decErr_io_axi_wlast = _zz_io_axi_wdata[36];
    if(when_Axi4Crossbar_l500_4) begin
      if(when_Axi4Crossbar_l503_8) begin
        if(when_Axi4Crossbar_l509_4) begin
          decErr_io_axi_wlast = io_masters_0_wlast;
        end
      end
      if(when_Axi4Crossbar_l503_9) begin
        if(when_Axi4Crossbar_l509_4) begin
          decErr_io_axi_wlast = io_masters_1_wlast;
        end
      end
    end
    if(when_Axi4Crossbar_l530_4) begin
      if(when_Axi4Crossbar_l532_8) begin
        decErr_io_axi_wlast = io_masters_0_wlast;
      end
      if(when_Axi4Crossbar_l532_9) begin
        decErr_io_axi_wlast = io_masters_1_wlast;
      end
    end
  end

  always @(*) begin
    decErr_io_axi_bready = 1'b0;
    if(when_Axi4Crossbar_l584_4) begin
      decErr_io_axi_bready = io_masters_0_bready;
    end
    if(when_Axi4Crossbar_l584_9) begin
      decErr_io_axi_bready = io_masters_1_bready;
    end
  end

  always @(*) begin
    decErr_io_axi_arvalid = 1'b0;
    if(when_Axi4Crossbar_l615_4) begin
      decErr_io_axi_arvalid = 1'b1;
    end
  end

  assign _zz_io_axi_araddr = 63'h0;
  always @(*) begin
    decErr_io_axi_araddr = _zz_io_axi_araddr[31 : 0];
    if(when_Axi4Crossbar_l615_4) begin
      if(when_Axi4Crossbar_l618_8) begin
        decErr_io_axi_araddr = io_masters_0_araddr;
      end
      if(when_Axi4Crossbar_l618_9) begin
        decErr_io_axi_araddr = io_masters_1_araddr;
      end
    end
  end

  always @(*) begin
    decErr_io_axi_arid = _zz_io_axi_araddr[33 : 32];
    if(when_Axi4Crossbar_l615_4) begin
      if(when_Axi4Crossbar_l618_8) begin
        decErr_io_axi_arid = {_zz_rdRrPtr_4,io_masters_0_arid};
      end
      if(when_Axi4Crossbar_l618_9) begin
        decErr_io_axi_arid = {_zz_rdRrPtr_4,io_masters_1_arid};
      end
    end
  end

  assign decErr_io_axi_arregion = _zz_io_axi_araddr[37 : 34];
  always @(*) begin
    decErr_io_axi_arlen = _zz_io_axi_araddr[45 : 38];
    if(when_Axi4Crossbar_l615_4) begin
      if(when_Axi4Crossbar_l618_8) begin
        decErr_io_axi_arlen = io_masters_0_arlen;
      end
      if(when_Axi4Crossbar_l618_9) begin
        decErr_io_axi_arlen = io_masters_1_arlen;
      end
    end
  end

  always @(*) begin
    decErr_io_axi_arsize = _zz_io_axi_araddr[48 : 46];
    if(when_Axi4Crossbar_l615_4) begin
      if(when_Axi4Crossbar_l618_8) begin
        decErr_io_axi_arsize = io_masters_0_arsize;
      end
      if(when_Axi4Crossbar_l618_9) begin
        decErr_io_axi_arsize = io_masters_1_arsize;
      end
    end
  end

  always @(*) begin
    decErr_io_axi_arburst = _zz_io_axi_araddr[50 : 49];
    if(when_Axi4Crossbar_l615_4) begin
      if(when_Axi4Crossbar_l618_8) begin
        decErr_io_axi_arburst = io_masters_0_arburst;
      end
      if(when_Axi4Crossbar_l618_9) begin
        decErr_io_axi_arburst = io_masters_1_arburst;
      end
    end
  end

  always @(*) begin
    decErr_io_axi_arlock = _zz_io_axi_araddr[51 : 51];
    if(when_Axi4Crossbar_l615_4) begin
      if(when_Axi4Crossbar_l618_8) begin
        decErr_io_axi_arlock = io_masters_0_arlock;
      end
      if(when_Axi4Crossbar_l618_9) begin
        decErr_io_axi_arlock = io_masters_1_arlock;
      end
    end
  end

  always @(*) begin
    decErr_io_axi_arcache = _zz_io_axi_araddr[55 : 52];
    if(when_Axi4Crossbar_l615_4) begin
      if(when_Axi4Crossbar_l618_8) begin
        decErr_io_axi_arcache = io_masters_0_arcache;
      end
      if(when_Axi4Crossbar_l618_9) begin
        decErr_io_axi_arcache = io_masters_1_arcache;
      end
    end
  end

  always @(*) begin
    decErr_io_axi_arqos = _zz_io_axi_araddr[59 : 56];
    if(when_Axi4Crossbar_l615_4) begin
      if(when_Axi4Crossbar_l618_8) begin
        decErr_io_axi_arqos = io_masters_0_arqos;
      end
      if(when_Axi4Crossbar_l618_9) begin
        decErr_io_axi_arqos = io_masters_1_arqos;
      end
    end
  end

  always @(*) begin
    decErr_io_axi_arprot = _zz_io_axi_araddr[62 : 60];
    if(when_Axi4Crossbar_l615_4) begin
      if(when_Axi4Crossbar_l618_8) begin
        decErr_io_axi_arprot = io_masters_0_arprot;
      end
      if(when_Axi4Crossbar_l618_9) begin
        decErr_io_axi_arprot = io_masters_1_arprot;
      end
    end
  end

  always @(*) begin
    decErr_io_axi_rready = 1'b0;
    if(when_Axi4Crossbar_l656_4) begin
      decErr_io_axi_rready = io_masters_0_rready;
    end
    if(when_Axi4Crossbar_l656_9) begin
      decErr_io_axi_rready = io_masters_1_rready;
    end
  end

  always @(*) begin
    _zz_when_Axi4Crossbar_l500_6[0] = ((32'hc0000000 <= io_masters_0_awaddr) && (io_masters_0_awaddr < 32'hc0010000));
    _zz_when_Axi4Crossbar_l500_6[1] = ((32'hc0010000 <= io_masters_0_awaddr) && (io_masters_0_awaddr < 32'hc0020000));
    _zz_when_Axi4Crossbar_l500_6[2] = ((32'hc0020000 <= io_masters_0_awaddr) && (io_masters_0_awaddr < 32'hc0021000));
    _zz_when_Axi4Crossbar_l500_6[3] = ((32'hc0030000 <= io_masters_0_awaddr) && (io_masters_0_awaddr < 32'hc0031000));
  end

  always @(*) begin
    _zz_when_Axi4Crossbar_l500_5[0] = (io_masters_0_awvalid && _zz__zz_when_Axi4Crossbar_l500_5[0]);
    _zz_when_Axi4Crossbar_l500_5[1] = (io_masters_1_awvalid && _zz__zz_when_Axi4Crossbar_l500_5_1[0]);
  end

  always @(*) begin
    _zz_when_Axi4Crossbar_l500_7[0] = ((32'hc0000000 <= io_masters_1_awaddr) && (io_masters_1_awaddr < 32'hc0010000));
    _zz_when_Axi4Crossbar_l500_7[1] = ((32'hc0010000 <= io_masters_1_awaddr) && (io_masters_1_awaddr < 32'hc0020000));
    _zz_when_Axi4Crossbar_l500_7[2] = ((32'hc0020000 <= io_masters_1_awaddr) && (io_masters_1_awaddr < 32'hc0021000));
    _zz_when_Axi4Crossbar_l500_7[3] = ((32'hc0030000 <= io_masters_1_awaddr) && (io_masters_1_awaddr < 32'hc0031000));
  end

  always @(*) begin
    _zz_when_Axi4Crossbar_l203[0] = (wrRrPtr_0 <= 1'b0);
    _zz_when_Axi4Crossbar_l203[1] = (wrRrPtr_0 <= 1'b1);
  end

  assign _zz_when_Axi4Crossbar_l203_1 = (_zz_when_Axi4Crossbar_l500_5 & _zz_when_Axi4Crossbar_l203);
  assign _zz_when_Axi4Crossbar_l203_2 = _zz_when_Axi4Crossbar_l203_1;
  assign _zz_when_Axi4Crossbar_l203_3 = _zz_when_Axi4Crossbar_l500_5;
  assign _zz_when_Axi4Crossbar_l203_4 = ((|_zz_when_Axi4Crossbar_l203_1) ? (_zz_when_Axi4Crossbar_l203_2 & (~ _zz__zz_when_Axi4Crossbar_l203_4)) : (_zz_when_Axi4Crossbar_l203_3 & (~ _zz__zz_when_Axi4Crossbar_l203_4_1)));
  always @(*) begin
    _zz_io_slaves_0_awid = 1'b0;
    if(when_Axi4Crossbar_l203) begin
      _zz_io_slaves_0_awid = 1'b0;
    end
    if(when_Axi4Crossbar_l203_1) begin
      _zz_io_slaves_0_awid = 1'b1;
    end
  end

  assign when_Axi4Crossbar_l203 = _zz_when_Axi4Crossbar_l203_4[0];
  assign when_Axi4Crossbar_l203_1 = _zz_when_Axi4Crossbar_l203_4[1];
  assign when_Axi4Crossbar_l509 = (_zz_when_Axi4Crossbar_l509 == 3'b000);
  assign _zz_when_Axi4Crossbar_l532_5 = _zz_6_spinal_port0;
  assign when_Axi4Crossbar_l500 = ((_zz_when_Axi4Crossbar_l500 < 3'b100) && (|_zz_when_Axi4Crossbar_l500_5));
  assign when_Axi4Crossbar_l503 = (_zz_io_slaves_0_awid == 1'b0);
  assign when_Axi4Crossbar_l503_1 = (_zz_io_slaves_0_awid == 1'b1);
  assign io_slaves_0_aw_fire = (io_slaves_0_awvalid && io_slaves_0_awready);
  assign when_Axi4Crossbar_l530 = (! when_Axi4Crossbar_l509);
  assign when_Axi4Crossbar_l532 = (_zz_when_Axi4Crossbar_l532_5 == 1'b0);
  assign when_Axi4Crossbar_l532_1 = (_zz_when_Axi4Crossbar_l532_5 == 1'b1);
  assign io_slaves_0_w_fire = (io_slaves_0_wvalid && io_slaves_0_wready);
  assign when_Axi4Crossbar_l547 = (io_slaves_0_w_fire && io_slaves_0_wlast);
  assign when_Axi4Crossbar_l553 = (io_slaves_0_aw_fire && (! when_Axi4Crossbar_l547));
  assign when_Axi4Crossbar_l555 = ((! io_slaves_0_aw_fire) && when_Axi4Crossbar_l547);
  assign io_slaves_0_b_fire = (io_slaves_0_bvalid && io_slaves_0_bready);
  assign when_Axi4Crossbar_l562 = (io_slaves_0_aw_fire && (! io_slaves_0_b_fire));
  assign when_Axi4Crossbar_l564 = ((! io_slaves_0_aw_fire) && io_slaves_0_b_fire);
  always @(*) begin
    _zz_when_Axi4Crossbar_l500_9[0] = ((32'hc0000000 <= io_masters_0_awaddr) && (io_masters_0_awaddr < 32'hc0010000));
    _zz_when_Axi4Crossbar_l500_9[1] = ((32'hc0010000 <= io_masters_0_awaddr) && (io_masters_0_awaddr < 32'hc0020000));
    _zz_when_Axi4Crossbar_l500_9[2] = ((32'hc0020000 <= io_masters_0_awaddr) && (io_masters_0_awaddr < 32'hc0021000));
    _zz_when_Axi4Crossbar_l500_9[3] = ((32'hc0030000 <= io_masters_0_awaddr) && (io_masters_0_awaddr < 32'hc0031000));
  end

  always @(*) begin
    _zz_when_Axi4Crossbar_l500_8[0] = (io_masters_0_awvalid && _zz__zz_when_Axi4Crossbar_l500_8[1]);
    _zz_when_Axi4Crossbar_l500_8[1] = (io_masters_1_awvalid && _zz__zz_when_Axi4Crossbar_l500_8_1[1]);
  end

  always @(*) begin
    _zz_when_Axi4Crossbar_l500_10[0] = ((32'hc0000000 <= io_masters_1_awaddr) && (io_masters_1_awaddr < 32'hc0010000));
    _zz_when_Axi4Crossbar_l500_10[1] = ((32'hc0010000 <= io_masters_1_awaddr) && (io_masters_1_awaddr < 32'hc0020000));
    _zz_when_Axi4Crossbar_l500_10[2] = ((32'hc0020000 <= io_masters_1_awaddr) && (io_masters_1_awaddr < 32'hc0021000));
    _zz_when_Axi4Crossbar_l500_10[3] = ((32'hc0030000 <= io_masters_1_awaddr) && (io_masters_1_awaddr < 32'hc0031000));
  end

  always @(*) begin
    _zz_when_Axi4Crossbar_l203_5[0] = (wrRrPtr_1 <= 1'b0);
    _zz_when_Axi4Crossbar_l203_5[1] = (wrRrPtr_1 <= 1'b1);
  end

  assign _zz_when_Axi4Crossbar_l203_6 = (_zz_when_Axi4Crossbar_l500_8 & _zz_when_Axi4Crossbar_l203_5);
  assign _zz_when_Axi4Crossbar_l203_7 = _zz_when_Axi4Crossbar_l203_6;
  assign _zz_when_Axi4Crossbar_l203_8 = _zz_when_Axi4Crossbar_l500_8;
  assign _zz_when_Axi4Crossbar_l203_9 = ((|_zz_when_Axi4Crossbar_l203_6) ? (_zz_when_Axi4Crossbar_l203_7 & (~ _zz__zz_when_Axi4Crossbar_l203_9)) : (_zz_when_Axi4Crossbar_l203_8 & (~ _zz__zz_when_Axi4Crossbar_l203_9_1)));
  always @(*) begin
    _zz_io_slaves_1_awid = 1'b0;
    if(when_Axi4Crossbar_l203_2) begin
      _zz_io_slaves_1_awid = 1'b0;
    end
    if(when_Axi4Crossbar_l203_3) begin
      _zz_io_slaves_1_awid = 1'b1;
    end
  end

  assign when_Axi4Crossbar_l203_2 = _zz_when_Axi4Crossbar_l203_9[0];
  assign when_Axi4Crossbar_l203_3 = _zz_when_Axi4Crossbar_l203_9[1];
  assign when_Axi4Crossbar_l509_1 = (_zz_when_Axi4Crossbar_l509_1 == 3'b000);
  assign _zz_when_Axi4Crossbar_l532_6 = _zz_7_spinal_port0;
  assign when_Axi4Crossbar_l500_1 = ((_zz_when_Axi4Crossbar_l500_1 < 3'b100) && (|_zz_when_Axi4Crossbar_l500_8));
  assign when_Axi4Crossbar_l503_2 = (_zz_io_slaves_1_awid == 1'b0);
  assign when_Axi4Crossbar_l503_3 = (_zz_io_slaves_1_awid == 1'b1);
  assign io_slaves_1_aw_fire = (io_slaves_1_awvalid && io_slaves_1_awready);
  assign when_Axi4Crossbar_l530_1 = (! when_Axi4Crossbar_l509_1);
  assign when_Axi4Crossbar_l532_2 = (_zz_when_Axi4Crossbar_l532_6 == 1'b0);
  assign when_Axi4Crossbar_l532_3 = (_zz_when_Axi4Crossbar_l532_6 == 1'b1);
  assign io_slaves_1_w_fire = (io_slaves_1_wvalid && io_slaves_1_wready);
  assign when_Axi4Crossbar_l547_1 = (io_slaves_1_w_fire && io_slaves_1_wlast);
  assign when_Axi4Crossbar_l553_1 = (io_slaves_1_aw_fire && (! when_Axi4Crossbar_l547_1));
  assign when_Axi4Crossbar_l555_1 = ((! io_slaves_1_aw_fire) && when_Axi4Crossbar_l547_1);
  assign io_slaves_1_b_fire = (io_slaves_1_bvalid && io_slaves_1_bready);
  assign when_Axi4Crossbar_l562_1 = (io_slaves_1_aw_fire && (! io_slaves_1_b_fire));
  assign when_Axi4Crossbar_l564_1 = ((! io_slaves_1_aw_fire) && io_slaves_1_b_fire);
  always @(*) begin
    _zz_when_Axi4Crossbar_l500_12[0] = ((32'hc0000000 <= io_masters_0_awaddr) && (io_masters_0_awaddr < 32'hc0010000));
    _zz_when_Axi4Crossbar_l500_12[1] = ((32'hc0010000 <= io_masters_0_awaddr) && (io_masters_0_awaddr < 32'hc0020000));
    _zz_when_Axi4Crossbar_l500_12[2] = ((32'hc0020000 <= io_masters_0_awaddr) && (io_masters_0_awaddr < 32'hc0021000));
    _zz_when_Axi4Crossbar_l500_12[3] = ((32'hc0030000 <= io_masters_0_awaddr) && (io_masters_0_awaddr < 32'hc0031000));
  end

  always @(*) begin
    _zz_when_Axi4Crossbar_l500_11[0] = (io_masters_0_awvalid && _zz__zz_when_Axi4Crossbar_l500_11[2]);
    _zz_when_Axi4Crossbar_l500_11[1] = (io_masters_1_awvalid && _zz__zz_when_Axi4Crossbar_l500_11_1[2]);
  end

  always @(*) begin
    _zz_when_Axi4Crossbar_l500_13[0] = ((32'hc0000000 <= io_masters_1_awaddr) && (io_masters_1_awaddr < 32'hc0010000));
    _zz_when_Axi4Crossbar_l500_13[1] = ((32'hc0010000 <= io_masters_1_awaddr) && (io_masters_1_awaddr < 32'hc0020000));
    _zz_when_Axi4Crossbar_l500_13[2] = ((32'hc0020000 <= io_masters_1_awaddr) && (io_masters_1_awaddr < 32'hc0021000));
    _zz_when_Axi4Crossbar_l500_13[3] = ((32'hc0030000 <= io_masters_1_awaddr) && (io_masters_1_awaddr < 32'hc0031000));
  end

  always @(*) begin
    _zz_when_Axi4Crossbar_l203_10[0] = (wrRrPtr_2 <= 1'b0);
    _zz_when_Axi4Crossbar_l203_10[1] = (wrRrPtr_2 <= 1'b1);
  end

  assign _zz_when_Axi4Crossbar_l203_11 = (_zz_when_Axi4Crossbar_l500_11 & _zz_when_Axi4Crossbar_l203_10);
  assign _zz_when_Axi4Crossbar_l203_12 = _zz_when_Axi4Crossbar_l203_11;
  assign _zz_when_Axi4Crossbar_l203_13 = _zz_when_Axi4Crossbar_l500_11;
  assign _zz_when_Axi4Crossbar_l203_14 = ((|_zz_when_Axi4Crossbar_l203_11) ? (_zz_when_Axi4Crossbar_l203_12 & (~ _zz__zz_when_Axi4Crossbar_l203_14)) : (_zz_when_Axi4Crossbar_l203_13 & (~ _zz__zz_when_Axi4Crossbar_l203_14_1)));
  always @(*) begin
    _zz_io_slaves_2_awid = 1'b0;
    if(when_Axi4Crossbar_l203_4) begin
      _zz_io_slaves_2_awid = 1'b0;
    end
    if(when_Axi4Crossbar_l203_5) begin
      _zz_io_slaves_2_awid = 1'b1;
    end
  end

  assign when_Axi4Crossbar_l203_4 = _zz_when_Axi4Crossbar_l203_14[0];
  assign when_Axi4Crossbar_l203_5 = _zz_when_Axi4Crossbar_l203_14[1];
  assign when_Axi4Crossbar_l509_2 = (_zz_when_Axi4Crossbar_l509_2 == 3'b000);
  assign _zz_when_Axi4Crossbar_l532_7 = _zz_8_spinal_port0;
  assign when_Axi4Crossbar_l500_2 = ((_zz_when_Axi4Crossbar_l500_2 < 3'b100) && (|_zz_when_Axi4Crossbar_l500_11));
  assign when_Axi4Crossbar_l503_4 = (_zz_io_slaves_2_awid == 1'b0);
  assign when_Axi4Crossbar_l503_5 = (_zz_io_slaves_2_awid == 1'b1);
  assign io_slaves_2_aw_fire = (io_slaves_2_awvalid && io_slaves_2_awready);
  assign when_Axi4Crossbar_l530_2 = (! when_Axi4Crossbar_l509_2);
  assign when_Axi4Crossbar_l532_4 = (_zz_when_Axi4Crossbar_l532_7 == 1'b0);
  assign when_Axi4Crossbar_l532_5 = (_zz_when_Axi4Crossbar_l532_7 == 1'b1);
  assign io_slaves_2_w_fire = (io_slaves_2_wvalid && io_slaves_2_wready);
  assign when_Axi4Crossbar_l547_2 = (io_slaves_2_w_fire && io_slaves_2_wlast);
  assign when_Axi4Crossbar_l553_2 = (io_slaves_2_aw_fire && (! when_Axi4Crossbar_l547_2));
  assign when_Axi4Crossbar_l555_2 = ((! io_slaves_2_aw_fire) && when_Axi4Crossbar_l547_2);
  assign io_slaves_2_b_fire = (io_slaves_2_bvalid && io_slaves_2_bready);
  assign when_Axi4Crossbar_l562_2 = (io_slaves_2_aw_fire && (! io_slaves_2_b_fire));
  assign when_Axi4Crossbar_l564_2 = ((! io_slaves_2_aw_fire) && io_slaves_2_b_fire);
  always @(*) begin
    _zz_when_Axi4Crossbar_l500_15[0] = ((32'hc0000000 <= io_masters_0_awaddr) && (io_masters_0_awaddr < 32'hc0010000));
    _zz_when_Axi4Crossbar_l500_15[1] = ((32'hc0010000 <= io_masters_0_awaddr) && (io_masters_0_awaddr < 32'hc0020000));
    _zz_when_Axi4Crossbar_l500_15[2] = ((32'hc0020000 <= io_masters_0_awaddr) && (io_masters_0_awaddr < 32'hc0021000));
    _zz_when_Axi4Crossbar_l500_15[3] = ((32'hc0030000 <= io_masters_0_awaddr) && (io_masters_0_awaddr < 32'hc0031000));
  end

  always @(*) begin
    _zz_when_Axi4Crossbar_l500_14[0] = (io_masters_0_awvalid && _zz__zz_when_Axi4Crossbar_l500_14[3]);
    _zz_when_Axi4Crossbar_l500_14[1] = (io_masters_1_awvalid && _zz__zz_when_Axi4Crossbar_l500_14_1[3]);
  end

  always @(*) begin
    _zz_when_Axi4Crossbar_l500_16[0] = ((32'hc0000000 <= io_masters_1_awaddr) && (io_masters_1_awaddr < 32'hc0010000));
    _zz_when_Axi4Crossbar_l500_16[1] = ((32'hc0010000 <= io_masters_1_awaddr) && (io_masters_1_awaddr < 32'hc0020000));
    _zz_when_Axi4Crossbar_l500_16[2] = ((32'hc0020000 <= io_masters_1_awaddr) && (io_masters_1_awaddr < 32'hc0021000));
    _zz_when_Axi4Crossbar_l500_16[3] = ((32'hc0030000 <= io_masters_1_awaddr) && (io_masters_1_awaddr < 32'hc0031000));
  end

  always @(*) begin
    _zz_when_Axi4Crossbar_l203_15[0] = (wrRrPtr_3 <= 1'b0);
    _zz_when_Axi4Crossbar_l203_15[1] = (wrRrPtr_3 <= 1'b1);
  end

  assign _zz_when_Axi4Crossbar_l203_16 = (_zz_when_Axi4Crossbar_l500_14 & _zz_when_Axi4Crossbar_l203_15);
  assign _zz_when_Axi4Crossbar_l203_17 = _zz_when_Axi4Crossbar_l203_16;
  assign _zz_when_Axi4Crossbar_l203_18 = _zz_when_Axi4Crossbar_l500_14;
  assign _zz_when_Axi4Crossbar_l203_19 = ((|_zz_when_Axi4Crossbar_l203_16) ? (_zz_when_Axi4Crossbar_l203_17 & (~ _zz__zz_when_Axi4Crossbar_l203_19)) : (_zz_when_Axi4Crossbar_l203_18 & (~ _zz__zz_when_Axi4Crossbar_l203_19_1)));
  always @(*) begin
    _zz_io_slaves_3_awid = 1'b0;
    if(when_Axi4Crossbar_l203_6) begin
      _zz_io_slaves_3_awid = 1'b0;
    end
    if(when_Axi4Crossbar_l203_7) begin
      _zz_io_slaves_3_awid = 1'b1;
    end
  end

  assign when_Axi4Crossbar_l203_6 = _zz_when_Axi4Crossbar_l203_19[0];
  assign when_Axi4Crossbar_l203_7 = _zz_when_Axi4Crossbar_l203_19[1];
  assign when_Axi4Crossbar_l509_3 = (_zz_when_Axi4Crossbar_l509_3 == 3'b000);
  assign _zz_when_Axi4Crossbar_l532_8 = _zz_9_spinal_port0;
  assign when_Axi4Crossbar_l500_3 = ((_zz_when_Axi4Crossbar_l500_3 < 3'b100) && (|_zz_when_Axi4Crossbar_l500_14));
  assign when_Axi4Crossbar_l503_6 = (_zz_io_slaves_3_awid == 1'b0);
  assign when_Axi4Crossbar_l503_7 = (_zz_io_slaves_3_awid == 1'b1);
  assign io_slaves_3_aw_fire = (io_slaves_3_awvalid && io_slaves_3_awready);
  assign when_Axi4Crossbar_l530_3 = (! when_Axi4Crossbar_l509_3);
  assign when_Axi4Crossbar_l532_6 = (_zz_when_Axi4Crossbar_l532_8 == 1'b0);
  assign when_Axi4Crossbar_l532_7 = (_zz_when_Axi4Crossbar_l532_8 == 1'b1);
  assign io_slaves_3_w_fire = (io_slaves_3_wvalid && io_slaves_3_wready);
  assign when_Axi4Crossbar_l547_3 = (io_slaves_3_w_fire && io_slaves_3_wlast);
  assign when_Axi4Crossbar_l553_3 = (io_slaves_3_aw_fire && (! when_Axi4Crossbar_l547_3));
  assign when_Axi4Crossbar_l555_3 = ((! io_slaves_3_aw_fire) && when_Axi4Crossbar_l547_3);
  assign io_slaves_3_b_fire = (io_slaves_3_bvalid && io_slaves_3_bready);
  assign when_Axi4Crossbar_l562_3 = (io_slaves_3_aw_fire && (! io_slaves_3_b_fire));
  assign when_Axi4Crossbar_l564_3 = ((! io_slaves_3_aw_fire) && io_slaves_3_b_fire);
  always @(*) begin
    _zz_when_Axi4Crossbar_l500_18[0] = ((32'hc0000000 <= io_masters_0_awaddr) && (io_masters_0_awaddr < 32'hc0010000));
    _zz_when_Axi4Crossbar_l500_18[1] = ((32'hc0010000 <= io_masters_0_awaddr) && (io_masters_0_awaddr < 32'hc0020000));
    _zz_when_Axi4Crossbar_l500_18[2] = ((32'hc0020000 <= io_masters_0_awaddr) && (io_masters_0_awaddr < 32'hc0021000));
    _zz_when_Axi4Crossbar_l500_18[3] = ((32'hc0030000 <= io_masters_0_awaddr) && (io_masters_0_awaddr < 32'hc0031000));
  end

  always @(*) begin
    _zz_when_Axi4Crossbar_l500_17[0] = (io_masters_0_awvalid && _zz__zz_when_Axi4Crossbar_l500_17[4]);
    _zz_when_Axi4Crossbar_l500_17[1] = (io_masters_1_awvalid && _zz__zz_when_Axi4Crossbar_l500_17_1[4]);
  end

  always @(*) begin
    _zz_when_Axi4Crossbar_l500_19[0] = ((32'hc0000000 <= io_masters_1_awaddr) && (io_masters_1_awaddr < 32'hc0010000));
    _zz_when_Axi4Crossbar_l500_19[1] = ((32'hc0010000 <= io_masters_1_awaddr) && (io_masters_1_awaddr < 32'hc0020000));
    _zz_when_Axi4Crossbar_l500_19[2] = ((32'hc0020000 <= io_masters_1_awaddr) && (io_masters_1_awaddr < 32'hc0021000));
    _zz_when_Axi4Crossbar_l500_19[3] = ((32'hc0030000 <= io_masters_1_awaddr) && (io_masters_1_awaddr < 32'hc0031000));
  end

  always @(*) begin
    _zz_when_Axi4Crossbar_l203_20[0] = (wrRrPtr_4 <= 1'b0);
    _zz_when_Axi4Crossbar_l203_20[1] = (wrRrPtr_4 <= 1'b1);
  end

  assign _zz_when_Axi4Crossbar_l203_21 = (_zz_when_Axi4Crossbar_l500_17 & _zz_when_Axi4Crossbar_l203_20);
  assign _zz_when_Axi4Crossbar_l203_22 = _zz_when_Axi4Crossbar_l203_21;
  assign _zz_when_Axi4Crossbar_l203_23 = _zz_when_Axi4Crossbar_l500_17;
  assign _zz_when_Axi4Crossbar_l203_24 = ((|_zz_when_Axi4Crossbar_l203_21) ? (_zz_when_Axi4Crossbar_l203_22 & (~ _zz__zz_when_Axi4Crossbar_l203_24)) : (_zz_when_Axi4Crossbar_l203_23 & (~ _zz__zz_when_Axi4Crossbar_l203_24_1)));
  always @(*) begin
    _zz_wrRrPtr_4 = 1'b0;
    if(when_Axi4Crossbar_l203_8) begin
      _zz_wrRrPtr_4 = 1'b0;
    end
    if(when_Axi4Crossbar_l203_9) begin
      _zz_wrRrPtr_4 = 1'b1;
    end
  end

  assign when_Axi4Crossbar_l203_8 = _zz_when_Axi4Crossbar_l203_24[0];
  assign when_Axi4Crossbar_l203_9 = _zz_when_Axi4Crossbar_l203_24[1];
  assign when_Axi4Crossbar_l509_4 = (_zz_when_Axi4Crossbar_l509_4 == 3'b000);
  assign _zz_when_Axi4Crossbar_l532_9 = _zz_10_spinal_port0;
  assign when_Axi4Crossbar_l500_4 = ((_zz_when_Axi4Crossbar_l500_4 < 3'b100) && (|_zz_when_Axi4Crossbar_l500_17));
  assign when_Axi4Crossbar_l503_8 = (_zz_wrRrPtr_4 == 1'b0);
  assign when_Axi4Crossbar_l503_9 = (_zz_wrRrPtr_4 == 1'b1);
  assign decErr_io_axi_aw_fire = (decErr_io_axi_awvalid && decErr_io_axi_awready);
  assign when_Axi4Crossbar_l530_4 = (! when_Axi4Crossbar_l509_4);
  assign when_Axi4Crossbar_l532_8 = (_zz_when_Axi4Crossbar_l532_9 == 1'b0);
  assign when_Axi4Crossbar_l532_9 = (_zz_when_Axi4Crossbar_l532_9 == 1'b1);
  assign decErr_io_axi_w_fire = (decErr_io_axi_wvalid && decErr_io_axi_wready);
  assign when_Axi4Crossbar_l547_4 = (decErr_io_axi_w_fire && decErr_io_axi_wlast);
  assign when_Axi4Crossbar_l553_4 = (decErr_io_axi_aw_fire && (! when_Axi4Crossbar_l547_4));
  assign when_Axi4Crossbar_l555_4 = ((! decErr_io_axi_aw_fire) && when_Axi4Crossbar_l547_4);
  assign decErr_io_axi_b_fire = (decErr_io_axi_bvalid && decErr_io_axi_bready);
  assign when_Axi4Crossbar_l562_4 = (decErr_io_axi_aw_fire && (! decErr_io_axi_b_fire));
  assign when_Axi4Crossbar_l564_4 = ((! decErr_io_axi_aw_fire) && decErr_io_axi_b_fire);
  always @(*) begin
    _zz_when_Axi4Crossbar_l584[0] = (io_slaves_0_bvalid && (_zz__zz_when_Axi4Crossbar_l584 == 1'b0));
    _zz_when_Axi4Crossbar_l584[1] = (io_slaves_1_bvalid && (_zz__zz_when_Axi4Crossbar_l584_1 == 1'b0));
    _zz_when_Axi4Crossbar_l584[2] = (io_slaves_2_bvalid && (_zz__zz_when_Axi4Crossbar_l584_2 == 1'b0));
    _zz_when_Axi4Crossbar_l584[3] = (io_slaves_3_bvalid && (_zz__zz_when_Axi4Crossbar_l584_3 == 1'b0));
    _zz_when_Axi4Crossbar_l584[4] = (decErr_io_axi_bvalid && (_zz__zz_when_Axi4Crossbar_l584_4 == 1'b0));
  end

  assign _zz_when_Axi4Crossbar_l584_1 = _zz_when_Axi4Crossbar_l584;
  assign _zz_when_Axi4Crossbar_l584_2 = (_zz_when_Axi4Crossbar_l584_1 & (~ _zz__zz_when_Axi4Crossbar_l584_2_1));
  assign when_Axi4Crossbar_l584 = _zz_when_Axi4Crossbar_l584_2[0];
  assign when_Axi4Crossbar_l584_1 = _zz_when_Axi4Crossbar_l584_2[1];
  assign when_Axi4Crossbar_l584_2 = _zz_when_Axi4Crossbar_l584_2[2];
  assign when_Axi4Crossbar_l584_3 = _zz_when_Axi4Crossbar_l584_2[3];
  assign when_Axi4Crossbar_l584_4 = _zz_when_Axi4Crossbar_l584_2[4];
  always @(*) begin
    _zz_when_Axi4Crossbar_l584_3[0] = (io_slaves_0_bvalid && (_zz__zz_when_Axi4Crossbar_l584_3_1 == 1'b1));
    _zz_when_Axi4Crossbar_l584_3[1] = (io_slaves_1_bvalid && (_zz__zz_when_Axi4Crossbar_l584_3_2 == 1'b1));
    _zz_when_Axi4Crossbar_l584_3[2] = (io_slaves_2_bvalid && (_zz__zz_when_Axi4Crossbar_l584_3_3 == 1'b1));
    _zz_when_Axi4Crossbar_l584_3[3] = (io_slaves_3_bvalid && (_zz__zz_when_Axi4Crossbar_l584_3_4 == 1'b1));
    _zz_when_Axi4Crossbar_l584_3[4] = (decErr_io_axi_bvalid && (_zz__zz_when_Axi4Crossbar_l584_3_5 == 1'b1));
  end

  assign _zz_when_Axi4Crossbar_l584_4 = _zz_when_Axi4Crossbar_l584_3;
  assign _zz_when_Axi4Crossbar_l584_5 = (_zz_when_Axi4Crossbar_l584_4 & (~ _zz__zz_when_Axi4Crossbar_l584_5));
  assign when_Axi4Crossbar_l584_5 = _zz_when_Axi4Crossbar_l584_5[0];
  assign when_Axi4Crossbar_l584_6 = _zz_when_Axi4Crossbar_l584_5[1];
  assign when_Axi4Crossbar_l584_7 = _zz_when_Axi4Crossbar_l584_5[2];
  assign when_Axi4Crossbar_l584_8 = _zz_when_Axi4Crossbar_l584_5[3];
  assign when_Axi4Crossbar_l584_9 = _zz_when_Axi4Crossbar_l584_5[4];
  always @(*) begin
    _zz_when_Axi4Crossbar_l615_6[0] = ((32'hc0000000 <= io_masters_0_araddr) && (io_masters_0_araddr < 32'hc0010000));
    _zz_when_Axi4Crossbar_l615_6[1] = ((32'hc0010000 <= io_masters_0_araddr) && (io_masters_0_araddr < 32'hc0020000));
    _zz_when_Axi4Crossbar_l615_6[2] = ((32'hc0020000 <= io_masters_0_araddr) && (io_masters_0_araddr < 32'hc0021000));
    _zz_when_Axi4Crossbar_l615_6[3] = ((32'hc0030000 <= io_masters_0_araddr) && (io_masters_0_araddr < 32'hc0031000));
  end

  always @(*) begin
    _zz_when_Axi4Crossbar_l615_5[0] = (io_masters_0_arvalid && _zz__zz_when_Axi4Crossbar_l615_5[0]);
    _zz_when_Axi4Crossbar_l615_5[1] = (io_masters_1_arvalid && _zz__zz_when_Axi4Crossbar_l615_5_1[0]);
  end

  always @(*) begin
    _zz_when_Axi4Crossbar_l615_7[0] = ((32'hc0000000 <= io_masters_1_araddr) && (io_masters_1_araddr < 32'hc0010000));
    _zz_when_Axi4Crossbar_l615_7[1] = ((32'hc0010000 <= io_masters_1_araddr) && (io_masters_1_araddr < 32'hc0020000));
    _zz_when_Axi4Crossbar_l615_7[2] = ((32'hc0020000 <= io_masters_1_araddr) && (io_masters_1_araddr < 32'hc0021000));
    _zz_when_Axi4Crossbar_l615_7[3] = ((32'hc0030000 <= io_masters_1_araddr) && (io_masters_1_araddr < 32'hc0031000));
  end

  always @(*) begin
    _zz_when_Axi4Crossbar_l203_25[0] = (rdRrPtr_0 <= 1'b0);
    _zz_when_Axi4Crossbar_l203_25[1] = (rdRrPtr_0 <= 1'b1);
  end

  assign _zz_when_Axi4Crossbar_l203_26 = (_zz_when_Axi4Crossbar_l615_5 & _zz_when_Axi4Crossbar_l203_25);
  assign _zz_when_Axi4Crossbar_l203_27 = _zz_when_Axi4Crossbar_l203_26;
  assign _zz_when_Axi4Crossbar_l203_28 = _zz_when_Axi4Crossbar_l615_5;
  assign _zz_when_Axi4Crossbar_l203_29 = ((|_zz_when_Axi4Crossbar_l203_26) ? (_zz_when_Axi4Crossbar_l203_27 & (~ _zz__zz_when_Axi4Crossbar_l203_29)) : (_zz_when_Axi4Crossbar_l203_28 & (~ _zz__zz_when_Axi4Crossbar_l203_29_1)));
  always @(*) begin
    _zz_io_slaves_0_arid = 1'b0;
    if(when_Axi4Crossbar_l203_10) begin
      _zz_io_slaves_0_arid = 1'b0;
    end
    if(when_Axi4Crossbar_l203_11) begin
      _zz_io_slaves_0_arid = 1'b1;
    end
  end

  assign when_Axi4Crossbar_l203_10 = _zz_when_Axi4Crossbar_l203_29[0];
  assign when_Axi4Crossbar_l203_11 = _zz_when_Axi4Crossbar_l203_29[1];
  assign when_Axi4Crossbar_l615 = ((_zz_when_Axi4Crossbar_l615 < 3'b100) && (|_zz_when_Axi4Crossbar_l615_5));
  assign when_Axi4Crossbar_l618 = (_zz_io_slaves_0_arid == 1'b0);
  assign when_Axi4Crossbar_l618_1 = (_zz_io_slaves_0_arid == 1'b1);
  assign io_slaves_0_ar_fire = (io_slaves_0_arvalid && io_slaves_0_arready);
  assign io_slaves_0_r_fire = (io_slaves_0_rvalid && io_slaves_0_rready);
  assign _zz_when_Axi4Crossbar_l636 = (io_slaves_0_r_fire && io_slaves_0_rlast);
  assign when_Axi4Crossbar_l636 = (io_slaves_0_ar_fire && (! _zz_when_Axi4Crossbar_l636));
  assign when_Axi4Crossbar_l638 = ((! io_slaves_0_ar_fire) && _zz_when_Axi4Crossbar_l636);
  always @(*) begin
    _zz_when_Axi4Crossbar_l615_9[0] = ((32'hc0000000 <= io_masters_0_araddr) && (io_masters_0_araddr < 32'hc0010000));
    _zz_when_Axi4Crossbar_l615_9[1] = ((32'hc0010000 <= io_masters_0_araddr) && (io_masters_0_araddr < 32'hc0020000));
    _zz_when_Axi4Crossbar_l615_9[2] = ((32'hc0020000 <= io_masters_0_araddr) && (io_masters_0_araddr < 32'hc0021000));
    _zz_when_Axi4Crossbar_l615_9[3] = ((32'hc0030000 <= io_masters_0_araddr) && (io_masters_0_araddr < 32'hc0031000));
  end

  always @(*) begin
    _zz_when_Axi4Crossbar_l615_8[0] = (io_masters_0_arvalid && _zz__zz_when_Axi4Crossbar_l615_8[1]);
    _zz_when_Axi4Crossbar_l615_8[1] = (io_masters_1_arvalid && _zz__zz_when_Axi4Crossbar_l615_8_1[1]);
  end

  always @(*) begin
    _zz_when_Axi4Crossbar_l615_10[0] = ((32'hc0000000 <= io_masters_1_araddr) && (io_masters_1_araddr < 32'hc0010000));
    _zz_when_Axi4Crossbar_l615_10[1] = ((32'hc0010000 <= io_masters_1_araddr) && (io_masters_1_araddr < 32'hc0020000));
    _zz_when_Axi4Crossbar_l615_10[2] = ((32'hc0020000 <= io_masters_1_araddr) && (io_masters_1_araddr < 32'hc0021000));
    _zz_when_Axi4Crossbar_l615_10[3] = ((32'hc0030000 <= io_masters_1_araddr) && (io_masters_1_araddr < 32'hc0031000));
  end

  always @(*) begin
    _zz_when_Axi4Crossbar_l203_30[0] = (rdRrPtr_1 <= 1'b0);
    _zz_when_Axi4Crossbar_l203_30[1] = (rdRrPtr_1 <= 1'b1);
  end

  assign _zz_when_Axi4Crossbar_l203_31 = (_zz_when_Axi4Crossbar_l615_8 & _zz_when_Axi4Crossbar_l203_30);
  assign _zz_when_Axi4Crossbar_l203_32 = _zz_when_Axi4Crossbar_l203_31;
  assign _zz_when_Axi4Crossbar_l203_33 = _zz_when_Axi4Crossbar_l615_8;
  assign _zz_when_Axi4Crossbar_l203_34 = ((|_zz_when_Axi4Crossbar_l203_31) ? (_zz_when_Axi4Crossbar_l203_32 & (~ _zz__zz_when_Axi4Crossbar_l203_34)) : (_zz_when_Axi4Crossbar_l203_33 & (~ _zz__zz_when_Axi4Crossbar_l203_34_1)));
  always @(*) begin
    _zz_io_slaves_1_arid = 1'b0;
    if(when_Axi4Crossbar_l203_12) begin
      _zz_io_slaves_1_arid = 1'b0;
    end
    if(when_Axi4Crossbar_l203_13) begin
      _zz_io_slaves_1_arid = 1'b1;
    end
  end

  assign when_Axi4Crossbar_l203_12 = _zz_when_Axi4Crossbar_l203_34[0];
  assign when_Axi4Crossbar_l203_13 = _zz_when_Axi4Crossbar_l203_34[1];
  assign when_Axi4Crossbar_l615_1 = ((_zz_when_Axi4Crossbar_l615_1 < 3'b100) && (|_zz_when_Axi4Crossbar_l615_8));
  assign when_Axi4Crossbar_l618_2 = (_zz_io_slaves_1_arid == 1'b0);
  assign when_Axi4Crossbar_l618_3 = (_zz_io_slaves_1_arid == 1'b1);
  assign io_slaves_1_ar_fire = (io_slaves_1_arvalid && io_slaves_1_arready);
  assign io_slaves_1_r_fire = (io_slaves_1_rvalid && io_slaves_1_rready);
  assign _zz_when_Axi4Crossbar_l636_1 = (io_slaves_1_r_fire && io_slaves_1_rlast);
  assign when_Axi4Crossbar_l636_1 = (io_slaves_1_ar_fire && (! _zz_when_Axi4Crossbar_l636_1));
  assign when_Axi4Crossbar_l638_1 = ((! io_slaves_1_ar_fire) && _zz_when_Axi4Crossbar_l636_1);
  always @(*) begin
    _zz_when_Axi4Crossbar_l615_12[0] = ((32'hc0000000 <= io_masters_0_araddr) && (io_masters_0_araddr < 32'hc0010000));
    _zz_when_Axi4Crossbar_l615_12[1] = ((32'hc0010000 <= io_masters_0_araddr) && (io_masters_0_araddr < 32'hc0020000));
    _zz_when_Axi4Crossbar_l615_12[2] = ((32'hc0020000 <= io_masters_0_araddr) && (io_masters_0_araddr < 32'hc0021000));
    _zz_when_Axi4Crossbar_l615_12[3] = ((32'hc0030000 <= io_masters_0_araddr) && (io_masters_0_araddr < 32'hc0031000));
  end

  always @(*) begin
    _zz_when_Axi4Crossbar_l615_11[0] = (io_masters_0_arvalid && _zz__zz_when_Axi4Crossbar_l615_11[2]);
    _zz_when_Axi4Crossbar_l615_11[1] = (io_masters_1_arvalid && _zz__zz_when_Axi4Crossbar_l615_11_1[2]);
  end

  always @(*) begin
    _zz_when_Axi4Crossbar_l615_13[0] = ((32'hc0000000 <= io_masters_1_araddr) && (io_masters_1_araddr < 32'hc0010000));
    _zz_when_Axi4Crossbar_l615_13[1] = ((32'hc0010000 <= io_masters_1_araddr) && (io_masters_1_araddr < 32'hc0020000));
    _zz_when_Axi4Crossbar_l615_13[2] = ((32'hc0020000 <= io_masters_1_araddr) && (io_masters_1_araddr < 32'hc0021000));
    _zz_when_Axi4Crossbar_l615_13[3] = ((32'hc0030000 <= io_masters_1_araddr) && (io_masters_1_araddr < 32'hc0031000));
  end

  always @(*) begin
    _zz_when_Axi4Crossbar_l203_35[0] = (rdRrPtr_2 <= 1'b0);
    _zz_when_Axi4Crossbar_l203_35[1] = (rdRrPtr_2 <= 1'b1);
  end

  assign _zz_when_Axi4Crossbar_l203_36 = (_zz_when_Axi4Crossbar_l615_11 & _zz_when_Axi4Crossbar_l203_35);
  assign _zz_when_Axi4Crossbar_l203_37 = _zz_when_Axi4Crossbar_l203_36;
  assign _zz_when_Axi4Crossbar_l203_38 = _zz_when_Axi4Crossbar_l615_11;
  assign _zz_when_Axi4Crossbar_l203_39 = ((|_zz_when_Axi4Crossbar_l203_36) ? (_zz_when_Axi4Crossbar_l203_37 & (~ _zz__zz_when_Axi4Crossbar_l203_39)) : (_zz_when_Axi4Crossbar_l203_38 & (~ _zz__zz_when_Axi4Crossbar_l203_39_1)));
  always @(*) begin
    _zz_io_slaves_2_arid = 1'b0;
    if(when_Axi4Crossbar_l203_14) begin
      _zz_io_slaves_2_arid = 1'b0;
    end
    if(when_Axi4Crossbar_l203_15) begin
      _zz_io_slaves_2_arid = 1'b1;
    end
  end

  assign when_Axi4Crossbar_l203_14 = _zz_when_Axi4Crossbar_l203_39[0];
  assign when_Axi4Crossbar_l203_15 = _zz_when_Axi4Crossbar_l203_39[1];
  assign when_Axi4Crossbar_l615_2 = ((_zz_when_Axi4Crossbar_l615_2 < 3'b100) && (|_zz_when_Axi4Crossbar_l615_11));
  assign when_Axi4Crossbar_l618_4 = (_zz_io_slaves_2_arid == 1'b0);
  assign when_Axi4Crossbar_l618_5 = (_zz_io_slaves_2_arid == 1'b1);
  assign io_slaves_2_ar_fire = (io_slaves_2_arvalid && io_slaves_2_arready);
  assign io_slaves_2_r_fire = (io_slaves_2_rvalid && io_slaves_2_rready);
  assign _zz_when_Axi4Crossbar_l636_2 = (io_slaves_2_r_fire && io_slaves_2_rlast);
  assign when_Axi4Crossbar_l636_2 = (io_slaves_2_ar_fire && (! _zz_when_Axi4Crossbar_l636_2));
  assign when_Axi4Crossbar_l638_2 = ((! io_slaves_2_ar_fire) && _zz_when_Axi4Crossbar_l636_2);
  always @(*) begin
    _zz_when_Axi4Crossbar_l615_15[0] = ((32'hc0000000 <= io_masters_0_araddr) && (io_masters_0_araddr < 32'hc0010000));
    _zz_when_Axi4Crossbar_l615_15[1] = ((32'hc0010000 <= io_masters_0_araddr) && (io_masters_0_araddr < 32'hc0020000));
    _zz_when_Axi4Crossbar_l615_15[2] = ((32'hc0020000 <= io_masters_0_araddr) && (io_masters_0_araddr < 32'hc0021000));
    _zz_when_Axi4Crossbar_l615_15[3] = ((32'hc0030000 <= io_masters_0_araddr) && (io_masters_0_araddr < 32'hc0031000));
  end

  always @(*) begin
    _zz_when_Axi4Crossbar_l615_14[0] = (io_masters_0_arvalid && _zz__zz_when_Axi4Crossbar_l615_14[3]);
    _zz_when_Axi4Crossbar_l615_14[1] = (io_masters_1_arvalid && _zz__zz_when_Axi4Crossbar_l615_14_1[3]);
  end

  always @(*) begin
    _zz_when_Axi4Crossbar_l615_16[0] = ((32'hc0000000 <= io_masters_1_araddr) && (io_masters_1_araddr < 32'hc0010000));
    _zz_when_Axi4Crossbar_l615_16[1] = ((32'hc0010000 <= io_masters_1_araddr) && (io_masters_1_araddr < 32'hc0020000));
    _zz_when_Axi4Crossbar_l615_16[2] = ((32'hc0020000 <= io_masters_1_araddr) && (io_masters_1_araddr < 32'hc0021000));
    _zz_when_Axi4Crossbar_l615_16[3] = ((32'hc0030000 <= io_masters_1_araddr) && (io_masters_1_araddr < 32'hc0031000));
  end

  always @(*) begin
    _zz_when_Axi4Crossbar_l203_40[0] = (rdRrPtr_3 <= 1'b0);
    _zz_when_Axi4Crossbar_l203_40[1] = (rdRrPtr_3 <= 1'b1);
  end

  assign _zz_when_Axi4Crossbar_l203_41 = (_zz_when_Axi4Crossbar_l615_14 & _zz_when_Axi4Crossbar_l203_40);
  assign _zz_when_Axi4Crossbar_l203_42 = _zz_when_Axi4Crossbar_l203_41;
  assign _zz_when_Axi4Crossbar_l203_43 = _zz_when_Axi4Crossbar_l615_14;
  assign _zz_when_Axi4Crossbar_l203_44 = ((|_zz_when_Axi4Crossbar_l203_41) ? (_zz_when_Axi4Crossbar_l203_42 & (~ _zz__zz_when_Axi4Crossbar_l203_44)) : (_zz_when_Axi4Crossbar_l203_43 & (~ _zz__zz_when_Axi4Crossbar_l203_44_1)));
  always @(*) begin
    _zz_io_slaves_3_arid = 1'b0;
    if(when_Axi4Crossbar_l203_16) begin
      _zz_io_slaves_3_arid = 1'b0;
    end
    if(when_Axi4Crossbar_l203_17) begin
      _zz_io_slaves_3_arid = 1'b1;
    end
  end

  assign when_Axi4Crossbar_l203_16 = _zz_when_Axi4Crossbar_l203_44[0];
  assign when_Axi4Crossbar_l203_17 = _zz_when_Axi4Crossbar_l203_44[1];
  assign when_Axi4Crossbar_l615_3 = ((_zz_when_Axi4Crossbar_l615_3 < 3'b100) && (|_zz_when_Axi4Crossbar_l615_14));
  assign when_Axi4Crossbar_l618_6 = (_zz_io_slaves_3_arid == 1'b0);
  assign when_Axi4Crossbar_l618_7 = (_zz_io_slaves_3_arid == 1'b1);
  assign io_slaves_3_ar_fire = (io_slaves_3_arvalid && io_slaves_3_arready);
  assign io_slaves_3_r_fire = (io_slaves_3_rvalid && io_slaves_3_rready);
  assign _zz_when_Axi4Crossbar_l636_3 = (io_slaves_3_r_fire && io_slaves_3_rlast);
  assign when_Axi4Crossbar_l636_3 = (io_slaves_3_ar_fire && (! _zz_when_Axi4Crossbar_l636_3));
  assign when_Axi4Crossbar_l638_3 = ((! io_slaves_3_ar_fire) && _zz_when_Axi4Crossbar_l636_3);
  always @(*) begin
    _zz_when_Axi4Crossbar_l615_18[0] = ((32'hc0000000 <= io_masters_0_araddr) && (io_masters_0_araddr < 32'hc0010000));
    _zz_when_Axi4Crossbar_l615_18[1] = ((32'hc0010000 <= io_masters_0_araddr) && (io_masters_0_araddr < 32'hc0020000));
    _zz_when_Axi4Crossbar_l615_18[2] = ((32'hc0020000 <= io_masters_0_araddr) && (io_masters_0_araddr < 32'hc0021000));
    _zz_when_Axi4Crossbar_l615_18[3] = ((32'hc0030000 <= io_masters_0_araddr) && (io_masters_0_araddr < 32'hc0031000));
  end

  always @(*) begin
    _zz_when_Axi4Crossbar_l615_17[0] = (io_masters_0_arvalid && _zz__zz_when_Axi4Crossbar_l615_17[4]);
    _zz_when_Axi4Crossbar_l615_17[1] = (io_masters_1_arvalid && _zz__zz_when_Axi4Crossbar_l615_17_1[4]);
  end

  always @(*) begin
    _zz_when_Axi4Crossbar_l615_19[0] = ((32'hc0000000 <= io_masters_1_araddr) && (io_masters_1_araddr < 32'hc0010000));
    _zz_when_Axi4Crossbar_l615_19[1] = ((32'hc0010000 <= io_masters_1_araddr) && (io_masters_1_araddr < 32'hc0020000));
    _zz_when_Axi4Crossbar_l615_19[2] = ((32'hc0020000 <= io_masters_1_araddr) && (io_masters_1_araddr < 32'hc0021000));
    _zz_when_Axi4Crossbar_l615_19[3] = ((32'hc0030000 <= io_masters_1_araddr) && (io_masters_1_araddr < 32'hc0031000));
  end

  always @(*) begin
    _zz_when_Axi4Crossbar_l203_45[0] = (rdRrPtr_4 <= 1'b0);
    _zz_when_Axi4Crossbar_l203_45[1] = (rdRrPtr_4 <= 1'b1);
  end

  assign _zz_when_Axi4Crossbar_l203_46 = (_zz_when_Axi4Crossbar_l615_17 & _zz_when_Axi4Crossbar_l203_45);
  assign _zz_when_Axi4Crossbar_l203_47 = _zz_when_Axi4Crossbar_l203_46;
  assign _zz_when_Axi4Crossbar_l203_48 = _zz_when_Axi4Crossbar_l615_17;
  assign _zz_when_Axi4Crossbar_l203_49 = ((|_zz_when_Axi4Crossbar_l203_46) ? (_zz_when_Axi4Crossbar_l203_47 & (~ _zz__zz_when_Axi4Crossbar_l203_49)) : (_zz_when_Axi4Crossbar_l203_48 & (~ _zz__zz_when_Axi4Crossbar_l203_49_1)));
  always @(*) begin
    _zz_rdRrPtr_4 = 1'b0;
    if(when_Axi4Crossbar_l203_18) begin
      _zz_rdRrPtr_4 = 1'b0;
    end
    if(when_Axi4Crossbar_l203_19) begin
      _zz_rdRrPtr_4 = 1'b1;
    end
  end

  assign when_Axi4Crossbar_l203_18 = _zz_when_Axi4Crossbar_l203_49[0];
  assign when_Axi4Crossbar_l203_19 = _zz_when_Axi4Crossbar_l203_49[1];
  assign when_Axi4Crossbar_l615_4 = ((_zz_when_Axi4Crossbar_l615_4 < 3'b100) && (|_zz_when_Axi4Crossbar_l615_17));
  assign when_Axi4Crossbar_l618_8 = (_zz_rdRrPtr_4 == 1'b0);
  assign when_Axi4Crossbar_l618_9 = (_zz_rdRrPtr_4 == 1'b1);
  assign decErr_io_axi_ar_fire = (decErr_io_axi_arvalid && decErr_io_axi_arready);
  assign decErr_io_axi_r_fire = (decErr_io_axi_rvalid && decErr_io_axi_rready);
  assign _zz_when_Axi4Crossbar_l636_4 = (decErr_io_axi_r_fire && decErr_io_axi_rlast);
  assign when_Axi4Crossbar_l636_4 = (decErr_io_axi_ar_fire && (! _zz_when_Axi4Crossbar_l636_4));
  assign when_Axi4Crossbar_l638_4 = ((! decErr_io_axi_ar_fire) && _zz_when_Axi4Crossbar_l636_4);
  always @(*) begin
    _zz_when_Axi4Crossbar_l656[0] = (io_slaves_0_rvalid && (_zz__zz_when_Axi4Crossbar_l656 == 1'b0));
    _zz_when_Axi4Crossbar_l656[1] = (io_slaves_1_rvalid && (_zz__zz_when_Axi4Crossbar_l656_1 == 1'b0));
    _zz_when_Axi4Crossbar_l656[2] = (io_slaves_2_rvalid && (_zz__zz_when_Axi4Crossbar_l656_2 == 1'b0));
    _zz_when_Axi4Crossbar_l656[3] = (io_slaves_3_rvalid && (_zz__zz_when_Axi4Crossbar_l656_3 == 1'b0));
    _zz_when_Axi4Crossbar_l656[4] = (decErr_io_axi_rvalid && (_zz__zz_when_Axi4Crossbar_l656_4 == 1'b0));
  end

  assign _zz_when_Axi4Crossbar_l656_1 = _zz_when_Axi4Crossbar_l656;
  assign _zz_when_Axi4Crossbar_l656_2 = (_zz_when_Axi4Crossbar_l656_1 & (~ _zz__zz_when_Axi4Crossbar_l656_2_1));
  assign when_Axi4Crossbar_l656 = _zz_when_Axi4Crossbar_l656_2[0];
  assign when_Axi4Crossbar_l656_1 = _zz_when_Axi4Crossbar_l656_2[1];
  assign when_Axi4Crossbar_l656_2 = _zz_when_Axi4Crossbar_l656_2[2];
  assign when_Axi4Crossbar_l656_3 = _zz_when_Axi4Crossbar_l656_2[3];
  assign when_Axi4Crossbar_l656_4 = _zz_when_Axi4Crossbar_l656_2[4];
  always @(*) begin
    _zz_when_Axi4Crossbar_l656_3[0] = (io_slaves_0_rvalid && (_zz__zz_when_Axi4Crossbar_l656_3_1 == 1'b1));
    _zz_when_Axi4Crossbar_l656_3[1] = (io_slaves_1_rvalid && (_zz__zz_when_Axi4Crossbar_l656_3_2 == 1'b1));
    _zz_when_Axi4Crossbar_l656_3[2] = (io_slaves_2_rvalid && (_zz__zz_when_Axi4Crossbar_l656_3_3 == 1'b1));
    _zz_when_Axi4Crossbar_l656_3[3] = (io_slaves_3_rvalid && (_zz__zz_when_Axi4Crossbar_l656_3_4 == 1'b1));
    _zz_when_Axi4Crossbar_l656_3[4] = (decErr_io_axi_rvalid && (_zz__zz_when_Axi4Crossbar_l656_3_5 == 1'b1));
  end

  assign _zz_when_Axi4Crossbar_l656_4 = _zz_when_Axi4Crossbar_l656_3;
  assign _zz_when_Axi4Crossbar_l656_5 = (_zz_when_Axi4Crossbar_l656_4 & (~ _zz__zz_when_Axi4Crossbar_l656_5));
  assign when_Axi4Crossbar_l656_5 = _zz_when_Axi4Crossbar_l656_5[0];
  assign when_Axi4Crossbar_l656_6 = _zz_when_Axi4Crossbar_l656_5[1];
  assign when_Axi4Crossbar_l656_7 = _zz_when_Axi4Crossbar_l656_5[2];
  assign when_Axi4Crossbar_l656_8 = _zz_when_Axi4Crossbar_l656_5[3];
  assign when_Axi4Crossbar_l656_9 = _zz_when_Axi4Crossbar_l656_5[4];
  always @(posedge clk) begin
    if(!resetn) begin
      wrRrPtr_0 <= 1'b0;
      wrRrPtr_1 <= 1'b0;
      wrRrPtr_2 <= 1'b0;
      wrRrPtr_3 <= 1'b0;
      wrRrPtr_4 <= 1'b0;
      rdRrPtr_0 <= 1'b0;
      rdRrPtr_1 <= 1'b0;
      rdRrPtr_2 <= 1'b0;
      rdRrPtr_3 <= 1'b0;
      rdRrPtr_4 <= 1'b0;
      _zz_when_Axi4Crossbar_l500 <= 3'b000;
      _zz_when_Axi4Crossbar_l500_1 <= 3'b000;
      _zz_when_Axi4Crossbar_l500_2 <= 3'b000;
      _zz_when_Axi4Crossbar_l500_3 <= 3'b000;
      _zz_when_Axi4Crossbar_l500_4 <= 3'b000;
      _zz_11 <= 2'b00;
      _zz_12 <= 2'b00;
      _zz_13 <= 2'b00;
      _zz_14 <= 2'b00;
      _zz_15 <= 2'b00;
      _zz_when_Axi4Crossbar_l532 <= 2'b00;
      _zz_when_Axi4Crossbar_l532_1 <= 2'b00;
      _zz_when_Axi4Crossbar_l532_2 <= 2'b00;
      _zz_when_Axi4Crossbar_l532_3 <= 2'b00;
      _zz_when_Axi4Crossbar_l532_4 <= 2'b00;
      _zz_when_Axi4Crossbar_l509 <= 3'b000;
      _zz_when_Axi4Crossbar_l509_1 <= 3'b000;
      _zz_when_Axi4Crossbar_l509_2 <= 3'b000;
      _zz_when_Axi4Crossbar_l509_3 <= 3'b000;
      _zz_when_Axi4Crossbar_l509_4 <= 3'b000;
      _zz_when_Axi4Crossbar_l615 <= 3'b000;
      _zz_when_Axi4Crossbar_l615_1 <= 3'b000;
      _zz_when_Axi4Crossbar_l615_2 <= 3'b000;
      _zz_when_Axi4Crossbar_l615_3 <= 3'b000;
      _zz_when_Axi4Crossbar_l615_4 <= 3'b000;
    end else begin
      if(io_slaves_0_aw_fire) begin
        _zz_11 <= ((_zz_11 == 2'b11) ? 2'b00 : _zz__zz_11);
        wrRrPtr_0 <= (_zz_io_slaves_0_awid + 1'b1);
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
        _zz_12 <= ((_zz_12 == 2'b11) ? 2'b00 : _zz__zz_12);
        wrRrPtr_1 <= (_zz_io_slaves_1_awid + 1'b1);
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
      if(io_slaves_2_aw_fire) begin
        _zz_13 <= ((_zz_13 == 2'b11) ? 2'b00 : _zz__zz_13);
        wrRrPtr_2 <= (_zz_io_slaves_2_awid + 1'b1);
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
      if(io_slaves_3_aw_fire) begin
        _zz_14 <= ((_zz_14 == 2'b11) ? 2'b00 : _zz__zz_14);
        wrRrPtr_3 <= (_zz_io_slaves_3_awid + 1'b1);
      end
      if(when_Axi4Crossbar_l547_3) begin
        _zz_when_Axi4Crossbar_l532_3 <= ((_zz_when_Axi4Crossbar_l532_3 == 2'b11) ? 2'b00 : _zz__zz_when_Axi4Crossbar_l532_3);
      end
      if(when_Axi4Crossbar_l553_3) begin
        _zz_when_Axi4Crossbar_l509_3 <= (_zz_when_Axi4Crossbar_l509_3 + 3'b001);
      end else begin
        if(when_Axi4Crossbar_l555_3) begin
          _zz_when_Axi4Crossbar_l509_3 <= (_zz_when_Axi4Crossbar_l509_3 - 3'b001);
        end
      end
      if(when_Axi4Crossbar_l562_3) begin
        _zz_when_Axi4Crossbar_l500_3 <= (_zz_when_Axi4Crossbar_l500_3 + 3'b001);
      end else begin
        if(when_Axi4Crossbar_l564_3) begin
          _zz_when_Axi4Crossbar_l500_3 <= (_zz_when_Axi4Crossbar_l500_3 - 3'b001);
        end
      end
      if(decErr_io_axi_aw_fire) begin
        _zz_15 <= ((_zz_15 == 2'b11) ? 2'b00 : _zz__zz_15);
        wrRrPtr_4 <= (_zz_wrRrPtr_4 + 1'b1);
      end
      if(when_Axi4Crossbar_l547_4) begin
        _zz_when_Axi4Crossbar_l532_4 <= ((_zz_when_Axi4Crossbar_l532_4 == 2'b11) ? 2'b00 : _zz__zz_when_Axi4Crossbar_l532_4);
      end
      if(when_Axi4Crossbar_l553_4) begin
        _zz_when_Axi4Crossbar_l509_4 <= (_zz_when_Axi4Crossbar_l509_4 + 3'b001);
      end else begin
        if(when_Axi4Crossbar_l555_4) begin
          _zz_when_Axi4Crossbar_l509_4 <= (_zz_when_Axi4Crossbar_l509_4 - 3'b001);
        end
      end
      if(when_Axi4Crossbar_l562_4) begin
        _zz_when_Axi4Crossbar_l500_4 <= (_zz_when_Axi4Crossbar_l500_4 + 3'b001);
      end else begin
        if(when_Axi4Crossbar_l564_4) begin
          _zz_when_Axi4Crossbar_l500_4 <= (_zz_when_Axi4Crossbar_l500_4 - 3'b001);
        end
      end
      if(io_slaves_0_ar_fire) begin
        rdRrPtr_0 <= (_zz_io_slaves_0_arid + 1'b1);
      end
      if(when_Axi4Crossbar_l636) begin
        _zz_when_Axi4Crossbar_l615 <= (_zz_when_Axi4Crossbar_l615 + 3'b001);
      end else begin
        if(when_Axi4Crossbar_l638) begin
          _zz_when_Axi4Crossbar_l615 <= (_zz_when_Axi4Crossbar_l615 - 3'b001);
        end
      end
      if(io_slaves_1_ar_fire) begin
        rdRrPtr_1 <= (_zz_io_slaves_1_arid + 1'b1);
      end
      if(when_Axi4Crossbar_l636_1) begin
        _zz_when_Axi4Crossbar_l615_1 <= (_zz_when_Axi4Crossbar_l615_1 + 3'b001);
      end else begin
        if(when_Axi4Crossbar_l638_1) begin
          _zz_when_Axi4Crossbar_l615_1 <= (_zz_when_Axi4Crossbar_l615_1 - 3'b001);
        end
      end
      if(io_slaves_2_ar_fire) begin
        rdRrPtr_2 <= (_zz_io_slaves_2_arid + 1'b1);
      end
      if(when_Axi4Crossbar_l636_2) begin
        _zz_when_Axi4Crossbar_l615_2 <= (_zz_when_Axi4Crossbar_l615_2 + 3'b001);
      end else begin
        if(when_Axi4Crossbar_l638_2) begin
          _zz_when_Axi4Crossbar_l615_2 <= (_zz_when_Axi4Crossbar_l615_2 - 3'b001);
        end
      end
      if(io_slaves_3_ar_fire) begin
        rdRrPtr_3 <= (_zz_io_slaves_3_arid + 1'b1);
      end
      if(when_Axi4Crossbar_l636_3) begin
        _zz_when_Axi4Crossbar_l615_3 <= (_zz_when_Axi4Crossbar_l615_3 + 3'b001);
      end else begin
        if(when_Axi4Crossbar_l638_3) begin
          _zz_when_Axi4Crossbar_l615_3 <= (_zz_when_Axi4Crossbar_l615_3 - 3'b001);
        end
      end
      if(decErr_io_axi_ar_fire) begin
        rdRrPtr_4 <= (_zz_rdRrPtr_4 + 1'b1);
      end
      if(when_Axi4Crossbar_l636_4) begin
        _zz_when_Axi4Crossbar_l615_4 <= (_zz_when_Axi4Crossbar_l615_4 + 3'b001);
      end else begin
        if(when_Axi4Crossbar_l638_4) begin
          _zz_when_Axi4Crossbar_l615_4 <= (_zz_when_Axi4Crossbar_l615_4 - 3'b001);
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

  reg        [36:0]   logic_ram_spinal_port1;
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
  wire                when_Stream_l1557;
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
  wire                logic_pop_sync_readArbitration_valid;
  wire                logic_pop_sync_readArbitration_ready;
  wire       [3:0]    logic_pop_sync_readArbitration_payload;
  reg                 logic_pop_addressGen_rValid;
  reg        [3:0]    logic_pop_addressGen_rData;
  wire                when_Stream_l477;
  wire                logic_pop_sync_readPort_cmd_valid;
  wire       [3:0]    logic_pop_sync_readPort_cmd_payload;
  wire       [31:0]   logic_pop_sync_readPort_rsp_data;
  wire       [3:0]    logic_pop_sync_readPort_rsp_strb;
  wire                logic_pop_sync_readPort_rsp_last;
  wire       [36:0]   _zz_logic_pop_sync_readPort_rsp_data;
  wire                logic_pop_addressGen_toFlowFire_valid;
  wire       [3:0]    logic_pop_addressGen_toFlowFire_payload;
  wire                logic_pop_sync_readArbitration_translated_valid;
  wire                logic_pop_sync_readArbitration_translated_ready;
  wire       [31:0]   logic_pop_sync_readArbitration_translateddata;
  wire       [3:0]    logic_pop_sync_readArbitration_translatedstrb;
  wire                logic_pop_sync_readArbitration_translatedlast;
  wire                logic_pop_sync_readArbitration_fire;
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
      logic_ram_spinal_port1 <= logic_ram[logic_pop_sync_readPort_cmd_payload];
    end
  end

  always @(*) begin
    _zz_1 = 1'b0;
    if(logic_push_onRam_write_valid) begin
      _zz_1 = 1'b1;
    end
  end

  assign when_Stream_l1557 = (logic_ptr_doPush != logic_ptr_doPop);
  assign logic_ptr_full = (((logic_ptr_push ^ logic_ptr_popOnIo) ^ 5'h10) == 5'h0);
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
    logic_pop_addressGen_ready = logic_pop_sync_readArbitration_ready;
    if(when_Stream_l477) begin
      logic_pop_addressGen_ready = 1'b1;
    end
  end

  assign when_Stream_l477 = (! logic_pop_sync_readArbitration_valid);
  assign logic_pop_sync_readArbitration_valid = logic_pop_addressGen_rValid;
  assign logic_pop_sync_readArbitration_payload = logic_pop_addressGen_rData;
  assign _zz_logic_pop_sync_readPort_rsp_data = logic_ram_spinal_port1;
  assign logic_pop_sync_readPort_rsp_data = _zz_logic_pop_sync_readPort_rsp_data[31 : 0];
  assign logic_pop_sync_readPort_rsp_strb = _zz_logic_pop_sync_readPort_rsp_data[35 : 32];
  assign logic_pop_sync_readPort_rsp_last = _zz_logic_pop_sync_readPort_rsp_data[36];
  assign logic_pop_addressGen_toFlowFire_valid = logic_pop_addressGen_fire;
  assign logic_pop_addressGen_toFlowFire_payload = logic_pop_addressGen_payload;
  assign logic_pop_sync_readPort_cmd_valid = logic_pop_addressGen_toFlowFire_valid;
  assign logic_pop_sync_readPort_cmd_payload = logic_pop_addressGen_toFlowFire_payload;
  assign logic_pop_sync_readArbitration_translated_valid = logic_pop_sync_readArbitration_valid;
  assign logic_pop_sync_readArbitration_ready = logic_pop_sync_readArbitration_translated_ready;
  assign logic_pop_sync_readArbitration_translateddata = logic_pop_sync_readPort_rsp_data;
  assign logic_pop_sync_readArbitration_translatedstrb = logic_pop_sync_readPort_rsp_strb;
  assign logic_pop_sync_readArbitration_translatedlast = logic_pop_sync_readPort_rsp_last;
  assign io_pop_valid = logic_pop_sync_readArbitration_translated_valid;
  assign logic_pop_sync_readArbitration_translated_ready = io_pop_ready;
  assign io_popdata = logic_pop_sync_readArbitration_translateddata;
  assign io_popstrb = logic_pop_sync_readArbitration_translatedstrb;
  assign io_poplast = logic_pop_sync_readArbitration_translatedlast;
  assign logic_pop_sync_readArbitration_fire = (logic_pop_sync_readArbitration_valid && logic_pop_sync_readArbitration_ready);
  assign logic_ptr_popOnIo = logic_pop_sync_popReg;
  assign io_occupancy = logic_ptr_occupancy;
  assign io_availability = (5'h10 - logic_ptr_occupancy);
  always @(posedge clk) begin
    if(!resetn) begin
      logic_ptr_push <= 5'h0;
      logic_ptr_pop <= 5'h0;
      logic_ptr_wentUp <= 1'b0;
      logic_pop_addressGen_rValid <= 1'b0;
      logic_pop_sync_popReg <= 5'h0;
    end else begin
      if(when_Stream_l1557) begin
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
        logic_ptr_push <= 5'h0;
        logic_ptr_pop <= 5'h0;
      end
      if(logic_pop_addressGen_ready) begin
        logic_pop_addressGen_rValid <= logic_pop_addressGen_valid;
      end
      if(io_flush) begin
        logic_pop_addressGen_rValid <= 1'b0;
      end
      if(logic_pop_sync_readArbitration_fire) begin
        logic_pop_sync_popReg <= logic_ptr_pop;
      end
      if(io_flush) begin
        logic_pop_sync_popReg <= 5'h0;
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

  reg        [51:0]   logic_ram_spinal_port1;
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
  wire                when_Stream_l1557;
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
  wire                logic_pop_sync_readArbitration_valid;
  wire                logic_pop_sync_readArbitration_ready;
  wire       [1:0]    logic_pop_sync_readArbitration_payload;
  reg                 logic_pop_addressGen_rValid;
  reg        [1:0]    logic_pop_addressGen_rData;
  wire                when_Stream_l477;
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
  wire                logic_pop_addressGen_toFlowFire_valid;
  wire       [1:0]    logic_pop_addressGen_toFlowFire_payload;
  wire                logic_pop_sync_readArbitration_translated_valid;
  wire                logic_pop_sync_readArbitration_translated_ready;
  wire       [0:0]    logic_pop_sync_readArbitration_translatedid;
  wire       [31:0]   logic_pop_sync_readArbitration_translatedaddr;
  wire       [3:0]    logic_pop_sync_readArbitration_translatedlen;
  wire       [2:0]    logic_pop_sync_readArbitration_translatedsize;
  wire       [1:0]    logic_pop_sync_readArbitration_translatedburst;
  wire       [1:0]    logic_pop_sync_readArbitration_translatedlock;
  wire       [3:0]    logic_pop_sync_readArbitration_translatedcache;
  wire       [2:0]    logic_pop_sync_readArbitration_translatedprot;
  wire                logic_pop_sync_readArbitration_translatedlocked;
  wire                logic_pop_sync_readArbitration_fire;
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
      logic_ram_spinal_port1 <= logic_ram[logic_pop_sync_readPort_cmd_payload];
    end
  end

  always @(*) begin
    _zz_1 = 1'b0;
    if(logic_push_onRam_write_valid) begin
      _zz_1 = 1'b1;
    end
  end

  assign when_Stream_l1557 = (logic_ptr_doPush != logic_ptr_doPop);
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
    logic_pop_addressGen_ready = logic_pop_sync_readArbitration_ready;
    if(when_Stream_l477) begin
      logic_pop_addressGen_ready = 1'b1;
    end
  end

  assign when_Stream_l477 = (! logic_pop_sync_readArbitration_valid);
  assign logic_pop_sync_readArbitration_valid = logic_pop_addressGen_rValid;
  assign logic_pop_sync_readArbitration_payload = logic_pop_addressGen_rData;
  assign _zz_logic_pop_sync_readPort_rsp_id = logic_ram_spinal_port1;
  assign logic_pop_sync_readPort_rsp_id = _zz_logic_pop_sync_readPort_rsp_id[0 : 0];
  assign logic_pop_sync_readPort_rsp_addr = _zz_logic_pop_sync_readPort_rsp_id[32 : 1];
  assign logic_pop_sync_readPort_rsp_len = _zz_logic_pop_sync_readPort_rsp_id[36 : 33];
  assign logic_pop_sync_readPort_rsp_size = _zz_logic_pop_sync_readPort_rsp_id[39 : 37];
  assign logic_pop_sync_readPort_rsp_burst = _zz_logic_pop_sync_readPort_rsp_id[41 : 40];
  assign logic_pop_sync_readPort_rsp_lock = _zz_logic_pop_sync_readPort_rsp_id[43 : 42];
  assign logic_pop_sync_readPort_rsp_cache = _zz_logic_pop_sync_readPort_rsp_id[47 : 44];
  assign logic_pop_sync_readPort_rsp_prot = _zz_logic_pop_sync_readPort_rsp_id[50 : 48];
  assign logic_pop_sync_readPort_rsp_locked = _zz_logic_pop_sync_readPort_rsp_id[51];
  assign logic_pop_addressGen_toFlowFire_valid = logic_pop_addressGen_fire;
  assign logic_pop_addressGen_toFlowFire_payload = logic_pop_addressGen_payload;
  assign logic_pop_sync_readPort_cmd_valid = logic_pop_addressGen_toFlowFire_valid;
  assign logic_pop_sync_readPort_cmd_payload = logic_pop_addressGen_toFlowFire_payload;
  assign logic_pop_sync_readArbitration_translated_valid = logic_pop_sync_readArbitration_valid;
  assign logic_pop_sync_readArbitration_ready = logic_pop_sync_readArbitration_translated_ready;
  assign logic_pop_sync_readArbitration_translatedid = logic_pop_sync_readPort_rsp_id;
  assign logic_pop_sync_readArbitration_translatedaddr = logic_pop_sync_readPort_rsp_addr;
  assign logic_pop_sync_readArbitration_translatedlen = logic_pop_sync_readPort_rsp_len;
  assign logic_pop_sync_readArbitration_translatedsize = logic_pop_sync_readPort_rsp_size;
  assign logic_pop_sync_readArbitration_translatedburst = logic_pop_sync_readPort_rsp_burst;
  assign logic_pop_sync_readArbitration_translatedlock = logic_pop_sync_readPort_rsp_lock;
  assign logic_pop_sync_readArbitration_translatedcache = logic_pop_sync_readPort_rsp_cache;
  assign logic_pop_sync_readArbitration_translatedprot = logic_pop_sync_readPort_rsp_prot;
  assign logic_pop_sync_readArbitration_translatedlocked = logic_pop_sync_readPort_rsp_locked;
  assign io_pop_valid = logic_pop_sync_readArbitration_translated_valid;
  assign logic_pop_sync_readArbitration_translated_ready = io_pop_ready;
  assign io_popid = logic_pop_sync_readArbitration_translatedid;
  assign io_popaddr = logic_pop_sync_readArbitration_translatedaddr;
  assign io_poplen = logic_pop_sync_readArbitration_translatedlen;
  assign io_popsize = logic_pop_sync_readArbitration_translatedsize;
  assign io_popburst = logic_pop_sync_readArbitration_translatedburst;
  assign io_poplock = logic_pop_sync_readArbitration_translatedlock;
  assign io_popcache = logic_pop_sync_readArbitration_translatedcache;
  assign io_popprot = logic_pop_sync_readArbitration_translatedprot;
  assign io_poplocked = logic_pop_sync_readArbitration_translatedlocked;
  assign logic_pop_sync_readArbitration_fire = (logic_pop_sync_readArbitration_valid && logic_pop_sync_readArbitration_ready);
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
      if(when_Stream_l1557) begin
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
      if(logic_pop_sync_readArbitration_fire) begin
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

module Axi4DecErrSlave (
  input  wire          io_axi_awvalid,
  output wire          io_axi_awready,
  input  wire [31:0]   io_axi_awaddr,
  input  wire [1:0]    io_axi_awid,
  input  wire [3:0]    io_axi_awregion,
  input  wire [7:0]    io_axi_awlen,
  input  wire [2:0]    io_axi_awsize,
  input  wire [1:0]    io_axi_awburst,
  input  wire [0:0]    io_axi_awlock,
  input  wire [3:0]    io_axi_awcache,
  input  wire [3:0]    io_axi_awqos,
  input  wire [2:0]    io_axi_awprot,
  input  wire          io_axi_wvalid,
  output wire          io_axi_wready,
  input  wire [31:0]   io_axi_wdata,
  input  wire [3:0]    io_axi_wstrb,
  input  wire          io_axi_wlast,
  output wire          io_axi_bvalid,
  input  wire          io_axi_bready,
  output reg  [1:0]    io_axi_bid,
  output reg  [1:0]    io_axi_bresp,
  input  wire          io_axi_arvalid,
  output wire          io_axi_arready,
  input  wire [31:0]   io_axi_araddr,
  input  wire [1:0]    io_axi_arid,
  input  wire [3:0]    io_axi_arregion,
  input  wire [7:0]    io_axi_arlen,
  input  wire [2:0]    io_axi_arsize,
  input  wire [1:0]    io_axi_arburst,
  input  wire [0:0]    io_axi_arlock,
  input  wire [3:0]    io_axi_arcache,
  input  wire [3:0]    io_axi_arqos,
  input  wire [2:0]    io_axi_arprot,
  output wire          io_axi_rvalid,
  input  wire          io_axi_rready,
  output reg  [31:0]   io_axi_rdata,
  output reg  [1:0]    io_axi_rid,
  output reg  [1:0]    io_axi_rresp,
  output reg           io_axi_rlast,
  input  wire          clk,
  input  wire          resetn
);

  reg                 write_sinking;
  reg                 write_answering;
  reg        [1:0]    write_id;
  wire                io_axi_aw_fire;
  wire                io_axi_w_fire;
  wire                when_Axi4DecErrSlave_l59;
  wire       [3:0]    _zz_io_axi_bid;
  wire                io_axi_b_fire;
  reg                 read_busy;
  reg        [1:0]    read_id;
  reg        [7:0]    read_beatsLeft;
  wire                io_axi_ar_fire;
  wire       [36:0]   _zz_io_axi_rdata;
  wire                io_axi_r_fire;
  wire                when_Axi4DecErrSlave_l97;

  assign io_axi_awready = ((! write_sinking) && (! write_answering));
  assign io_axi_aw_fire = (io_axi_awvalid && io_axi_awready);
  assign io_axi_wready = write_sinking;
  assign io_axi_w_fire = (io_axi_wvalid && io_axi_wready);
  assign when_Axi4DecErrSlave_l59 = ((write_sinking && io_axi_w_fire) && io_axi_wlast);
  assign io_axi_bvalid = write_answering;
  assign _zz_io_axi_bid = 4'b0000;
  always @(*) begin
    io_axi_bid = _zz_io_axi_bid[1 : 0];
    io_axi_bid = write_id;
  end

  always @(*) begin
    io_axi_bresp = _zz_io_axi_bid[3 : 2];
    io_axi_bresp = 2'b11;
  end

  assign io_axi_b_fire = (io_axi_bvalid && io_axi_bready);
  assign io_axi_arready = (! read_busy);
  assign io_axi_ar_fire = (io_axi_arvalid && io_axi_arready);
  assign io_axi_rvalid = read_busy;
  assign _zz_io_axi_rdata = 37'h0;
  always @(*) begin
    io_axi_rdata = _zz_io_axi_rdata[31 : 0];
    io_axi_rdata = 32'h0;
  end

  always @(*) begin
    io_axi_rid = _zz_io_axi_rdata[33 : 32];
    io_axi_rid = read_id;
  end

  always @(*) begin
    io_axi_rresp = _zz_io_axi_rdata[35 : 34];
    io_axi_rresp = 2'b11;
  end

  always @(*) begin
    io_axi_rlast = _zz_io_axi_rdata[36];
    io_axi_rlast = (read_beatsLeft == 8'h0);
  end

  assign io_axi_r_fire = (io_axi_rvalid && io_axi_rready);
  assign when_Axi4DecErrSlave_l97 = (read_beatsLeft == 8'h0);
  always @(posedge clk) begin
    if(!resetn) begin
      write_sinking <= 1'b0;
      write_answering <= 1'b0;
      write_id <= 2'b00;
      read_busy <= 1'b0;
      read_id <= 2'b00;
      read_beatsLeft <= 8'h0;
    end else begin
      if(io_axi_aw_fire) begin
        write_sinking <= 1'b1;
        write_id <= io_axi_awid;
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
        read_id <= io_axi_arid;
        read_beatsLeft <= io_axi_arlen;
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
