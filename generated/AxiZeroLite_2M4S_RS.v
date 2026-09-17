// Copyright (c) 2026 Leonardo Capossio - bard0 design  hello@bard0.com
// SPDX-License-Identifier: MIT
// Generator : SpinalHDL v1.14.2    git head : 78f29dc66110fc099a777992b6daa2f803ab445e
// Component : AxiZeroLiteTop
// Git hash  : c6d64bdbe97ed88201bad5226e4588a445011965

`timescale 1ns/1ps

module AxiZeroLiteTop (
  input  wire          io_masters_0_aw_valid,
  output wire          io_masters_0_aw_ready,
  input  wire [31:0]   io_masters_0_aw_payload_addr,
  input  wire [2:0]    io_masters_0_aw_payload_prot,
  input  wire          io_masters_0_w_valid,
  output wire          io_masters_0_w_ready,
  input  wire [31:0]   io_masters_0_w_payload_data,
  input  wire [3:0]    io_masters_0_w_payload_strb,
  output wire          io_masters_0_b_valid,
  input  wire          io_masters_0_b_ready,
  output wire [1:0]    io_masters_0_b_payload_resp,
  input  wire          io_masters_0_ar_valid,
  output wire          io_masters_0_ar_ready,
  input  wire [31:0]   io_masters_0_ar_payload_addr,
  input  wire [2:0]    io_masters_0_ar_payload_prot,
  output wire          io_masters_0_r_valid,
  input  wire          io_masters_0_r_ready,
  output wire [31:0]   io_masters_0_r_payload_data,
  output wire [1:0]    io_masters_0_r_payload_resp,
  input  wire          io_masters_1_aw_valid,
  output wire          io_masters_1_aw_ready,
  input  wire [31:0]   io_masters_1_aw_payload_addr,
  input  wire [2:0]    io_masters_1_aw_payload_prot,
  input  wire          io_masters_1_w_valid,
  output wire          io_masters_1_w_ready,
  input  wire [31:0]   io_masters_1_w_payload_data,
  input  wire [3:0]    io_masters_1_w_payload_strb,
  output wire          io_masters_1_b_valid,
  input  wire          io_masters_1_b_ready,
  output wire [1:0]    io_masters_1_b_payload_resp,
  input  wire          io_masters_1_ar_valid,
  output wire          io_masters_1_ar_ready,
  input  wire [31:0]   io_masters_1_ar_payload_addr,
  input  wire [2:0]    io_masters_1_ar_payload_prot,
  output wire          io_masters_1_r_valid,
  input  wire          io_masters_1_r_ready,
  output wire [31:0]   io_masters_1_r_payload_data,
  output wire [1:0]    io_masters_1_r_payload_resp,
  output wire          io_slaves_0_aw_valid,
  input  wire          io_slaves_0_aw_ready,
  output wire [31:0]   io_slaves_0_aw_payload_addr,
  output wire [2:0]    io_slaves_0_aw_payload_prot,
  output wire          io_slaves_0_w_valid,
  input  wire          io_slaves_0_w_ready,
  output wire [31:0]   io_slaves_0_w_payload_data,
  output wire [3:0]    io_slaves_0_w_payload_strb,
  input  wire          io_slaves_0_b_valid,
  output wire          io_slaves_0_b_ready,
  input  wire [1:0]    io_slaves_0_b_payload_resp,
  output wire          io_slaves_0_ar_valid,
  input  wire          io_slaves_0_ar_ready,
  output wire [31:0]   io_slaves_0_ar_payload_addr,
  output wire [2:0]    io_slaves_0_ar_payload_prot,
  input  wire          io_slaves_0_r_valid,
  output wire          io_slaves_0_r_ready,
  input  wire [31:0]   io_slaves_0_r_payload_data,
  input  wire [1:0]    io_slaves_0_r_payload_resp,
  output wire          io_slaves_1_aw_valid,
  input  wire          io_slaves_1_aw_ready,
  output wire [31:0]   io_slaves_1_aw_payload_addr,
  output wire [2:0]    io_slaves_1_aw_payload_prot,
  output wire          io_slaves_1_w_valid,
  input  wire          io_slaves_1_w_ready,
  output wire [31:0]   io_slaves_1_w_payload_data,
  output wire [3:0]    io_slaves_1_w_payload_strb,
  input  wire          io_slaves_1_b_valid,
  output wire          io_slaves_1_b_ready,
  input  wire [1:0]    io_slaves_1_b_payload_resp,
  output wire          io_slaves_1_ar_valid,
  input  wire          io_slaves_1_ar_ready,
  output wire [31:0]   io_slaves_1_ar_payload_addr,
  output wire [2:0]    io_slaves_1_ar_payload_prot,
  input  wire          io_slaves_1_r_valid,
  output wire          io_slaves_1_r_ready,
  input  wire [31:0]   io_slaves_1_r_payload_data,
  input  wire [1:0]    io_slaves_1_r_payload_resp,
  output wire          io_slaves_2_aw_valid,
  input  wire          io_slaves_2_aw_ready,
  output wire [31:0]   io_slaves_2_aw_payload_addr,
  output wire [2:0]    io_slaves_2_aw_payload_prot,
  output wire          io_slaves_2_w_valid,
  input  wire          io_slaves_2_w_ready,
  output wire [31:0]   io_slaves_2_w_payload_data,
  output wire [3:0]    io_slaves_2_w_payload_strb,
  input  wire          io_slaves_2_b_valid,
  output wire          io_slaves_2_b_ready,
  input  wire [1:0]    io_slaves_2_b_payload_resp,
  output wire          io_slaves_2_ar_valid,
  input  wire          io_slaves_2_ar_ready,
  output wire [31:0]   io_slaves_2_ar_payload_addr,
  output wire [2:0]    io_slaves_2_ar_payload_prot,
  input  wire          io_slaves_2_r_valid,
  output wire          io_slaves_2_r_ready,
  input  wire [31:0]   io_slaves_2_r_payload_data,
  input  wire [1:0]    io_slaves_2_r_payload_resp,
  output wire          io_slaves_3_aw_valid,
  input  wire          io_slaves_3_aw_ready,
  output wire [31:0]   io_slaves_3_aw_payload_addr,
  output wire [2:0]    io_slaves_3_aw_payload_prot,
  output wire          io_slaves_3_w_valid,
  input  wire          io_slaves_3_w_ready,
  output wire [31:0]   io_slaves_3_w_payload_data,
  output wire [3:0]    io_slaves_3_w_payload_strb,
  input  wire          io_slaves_3_b_valid,
  output wire          io_slaves_3_b_ready,
  input  wire [1:0]    io_slaves_3_b_payload_resp,
  output wire          io_slaves_3_ar_valid,
  input  wire          io_slaves_3_ar_ready,
  output wire [31:0]   io_slaves_3_ar_payload_addr,
  output wire [2:0]    io_slaves_3_ar_payload_prot,
  input  wire          io_slaves_3_r_valid,
  output wire          io_slaves_3_r_ready,
  input  wire [31:0]   io_slaves_3_r_payload_data,
  input  wire [1:0]    io_slaves_3_r_payload_resp,
  input  wire          clk,
  input  wire          resetn
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
  wire                axi4LiteRegSlice_6_io_upstream_ar_ready;
  wire                axi4LiteRegSlice_6_io_upstream_aw_ready;
  wire                axi4LiteRegSlice_6_io_upstream_w_ready;
  wire                axi4LiteRegSlice_6_io_upstream_r_valid;
  wire       [31:0]   axi4LiteRegSlice_6_io_upstream_r_payload_data;
  wire       [1:0]    axi4LiteRegSlice_6_io_upstream_r_payload_resp;
  wire                axi4LiteRegSlice_6_io_upstream_b_valid;
  wire       [1:0]    axi4LiteRegSlice_6_io_upstream_b_payload_resp;
  wire                axi4LiteRegSlice_6_io_downstream_ar_valid;
  wire       [31:0]   axi4LiteRegSlice_6_io_downstream_ar_payload_addr;
  wire       [2:0]    axi4LiteRegSlice_6_io_downstream_ar_payload_prot;
  wire                axi4LiteRegSlice_6_io_downstream_aw_valid;
  wire       [31:0]   axi4LiteRegSlice_6_io_downstream_aw_payload_addr;
  wire       [2:0]    axi4LiteRegSlice_6_io_downstream_aw_payload_prot;
  wire                axi4LiteRegSlice_6_io_downstream_w_valid;
  wire       [31:0]   axi4LiteRegSlice_6_io_downstream_w_payload_data;
  wire       [3:0]    axi4LiteRegSlice_6_io_downstream_w_payload_strb;
  wire                axi4LiteRegSlice_6_io_downstream_r_ready;
  wire                axi4LiteRegSlice_6_io_downstream_b_ready;
  wire                axi4LiteRegSlice_7_io_upstream_ar_ready;
  wire                axi4LiteRegSlice_7_io_upstream_aw_ready;
  wire                axi4LiteRegSlice_7_io_upstream_w_ready;
  wire                axi4LiteRegSlice_7_io_upstream_r_valid;
  wire       [31:0]   axi4LiteRegSlice_7_io_upstream_r_payload_data;
  wire       [1:0]    axi4LiteRegSlice_7_io_upstream_r_payload_resp;
  wire                axi4LiteRegSlice_7_io_upstream_b_valid;
  wire       [1:0]    axi4LiteRegSlice_7_io_upstream_b_payload_resp;
  wire                axi4LiteRegSlice_7_io_downstream_ar_valid;
  wire       [31:0]   axi4LiteRegSlice_7_io_downstream_ar_payload_addr;
  wire       [2:0]    axi4LiteRegSlice_7_io_downstream_ar_payload_prot;
  wire                axi4LiteRegSlice_7_io_downstream_aw_valid;
  wire       [31:0]   axi4LiteRegSlice_7_io_downstream_aw_payload_addr;
  wire       [2:0]    axi4LiteRegSlice_7_io_downstream_aw_payload_prot;
  wire                axi4LiteRegSlice_7_io_downstream_w_valid;
  wire       [31:0]   axi4LiteRegSlice_7_io_downstream_w_payload_data;
  wire       [3:0]    axi4LiteRegSlice_7_io_downstream_w_payload_strb;
  wire                axi4LiteRegSlice_7_io_downstream_r_ready;
  wire                axi4LiteRegSlice_7_io_downstream_b_ready;
  wire                axi4LiteRegSlice_8_io_upstream_ar_ready;
  wire                axi4LiteRegSlice_8_io_upstream_aw_ready;
  wire                axi4LiteRegSlice_8_io_upstream_w_ready;
  wire                axi4LiteRegSlice_8_io_upstream_r_valid;
  wire       [31:0]   axi4LiteRegSlice_8_io_upstream_r_payload_data;
  wire       [1:0]    axi4LiteRegSlice_8_io_upstream_r_payload_resp;
  wire                axi4LiteRegSlice_8_io_upstream_b_valid;
  wire       [1:0]    axi4LiteRegSlice_8_io_upstream_b_payload_resp;
  wire                axi4LiteRegSlice_8_io_downstream_ar_valid;
  wire       [31:0]   axi4LiteRegSlice_8_io_downstream_ar_payload_addr;
  wire       [2:0]    axi4LiteRegSlice_8_io_downstream_ar_payload_prot;
  wire                axi4LiteRegSlice_8_io_downstream_aw_valid;
  wire       [31:0]   axi4LiteRegSlice_8_io_downstream_aw_payload_addr;
  wire       [2:0]    axi4LiteRegSlice_8_io_downstream_aw_payload_prot;
  wire                axi4LiteRegSlice_8_io_downstream_w_valid;
  wire       [31:0]   axi4LiteRegSlice_8_io_downstream_w_payload_data;
  wire       [3:0]    axi4LiteRegSlice_8_io_downstream_w_payload_strb;
  wire                axi4LiteRegSlice_8_io_downstream_r_ready;
  wire                axi4LiteRegSlice_8_io_downstream_b_ready;
  wire                axi4LiteRegSlice_9_io_upstream_ar_ready;
  wire                axi4LiteRegSlice_9_io_upstream_aw_ready;
  wire                axi4LiteRegSlice_9_io_upstream_w_ready;
  wire                axi4LiteRegSlice_9_io_upstream_r_valid;
  wire       [31:0]   axi4LiteRegSlice_9_io_upstream_r_payload_data;
  wire       [1:0]    axi4LiteRegSlice_9_io_upstream_r_payload_resp;
  wire                axi4LiteRegSlice_9_io_upstream_b_valid;
  wire       [1:0]    axi4LiteRegSlice_9_io_upstream_b_payload_resp;
  wire                axi4LiteRegSlice_9_io_downstream_ar_valid;
  wire       [31:0]   axi4LiteRegSlice_9_io_downstream_ar_payload_addr;
  wire       [2:0]    axi4LiteRegSlice_9_io_downstream_ar_payload_prot;
  wire                axi4LiteRegSlice_9_io_downstream_aw_valid;
  wire       [31:0]   axi4LiteRegSlice_9_io_downstream_aw_payload_addr;
  wire       [2:0]    axi4LiteRegSlice_9_io_downstream_aw_payload_prot;
  wire                axi4LiteRegSlice_9_io_downstream_w_valid;
  wire       [31:0]   axi4LiteRegSlice_9_io_downstream_w_payload_data;
  wire       [3:0]    axi4LiteRegSlice_9_io_downstream_w_payload_strb;
  wire                axi4LiteRegSlice_9_io_downstream_r_ready;
  wire                axi4LiteRegSlice_9_io_downstream_b_ready;
  wire                axi4LiteRegSlice_10_io_upstream_ar_ready;
  wire                axi4LiteRegSlice_10_io_upstream_aw_ready;
  wire                axi4LiteRegSlice_10_io_upstream_w_ready;
  wire                axi4LiteRegSlice_10_io_upstream_r_valid;
  wire       [31:0]   axi4LiteRegSlice_10_io_upstream_r_payload_data;
  wire       [1:0]    axi4LiteRegSlice_10_io_upstream_r_payload_resp;
  wire                axi4LiteRegSlice_10_io_upstream_b_valid;
  wire       [1:0]    axi4LiteRegSlice_10_io_upstream_b_payload_resp;
  wire                axi4LiteRegSlice_10_io_downstream_ar_valid;
  wire       [31:0]   axi4LiteRegSlice_10_io_downstream_ar_payload_addr;
  wire       [2:0]    axi4LiteRegSlice_10_io_downstream_ar_payload_prot;
  wire                axi4LiteRegSlice_10_io_downstream_aw_valid;
  wire       [31:0]   axi4LiteRegSlice_10_io_downstream_aw_payload_addr;
  wire       [2:0]    axi4LiteRegSlice_10_io_downstream_aw_payload_prot;
  wire                axi4LiteRegSlice_10_io_downstream_w_valid;
  wire       [31:0]   axi4LiteRegSlice_10_io_downstream_w_payload_data;
  wire       [3:0]    axi4LiteRegSlice_10_io_downstream_w_payload_strb;
  wire                axi4LiteRegSlice_10_io_downstream_r_ready;
  wire                axi4LiteRegSlice_10_io_downstream_b_ready;
  wire                axi4LiteRegSlice_11_io_upstream_ar_ready;
  wire                axi4LiteRegSlice_11_io_upstream_aw_ready;
  wire                axi4LiteRegSlice_11_io_upstream_w_ready;
  wire                axi4LiteRegSlice_11_io_upstream_r_valid;
  wire       [31:0]   axi4LiteRegSlice_11_io_upstream_r_payload_data;
  wire       [1:0]    axi4LiteRegSlice_11_io_upstream_r_payload_resp;
  wire                axi4LiteRegSlice_11_io_upstream_b_valid;
  wire       [1:0]    axi4LiteRegSlice_11_io_upstream_b_payload_resp;
  wire                axi4LiteRegSlice_11_io_downstream_ar_valid;
  wire       [31:0]   axi4LiteRegSlice_11_io_downstream_ar_payload_addr;
  wire       [2:0]    axi4LiteRegSlice_11_io_downstream_ar_payload_prot;
  wire                axi4LiteRegSlice_11_io_downstream_aw_valid;
  wire       [31:0]   axi4LiteRegSlice_11_io_downstream_aw_payload_addr;
  wire       [2:0]    axi4LiteRegSlice_11_io_downstream_aw_payload_prot;
  wire                axi4LiteRegSlice_11_io_downstream_w_valid;
  wire       [31:0]   axi4LiteRegSlice_11_io_downstream_w_payload_data;
  wire       [3:0]    axi4LiteRegSlice_11_io_downstream_w_payload_strb;
  wire                axi4LiteRegSlice_11_io_downstream_r_ready;
  wire                axi4LiteRegSlice_11_io_downstream_b_ready;

  Axi4LiteCrossbar xbar (
    .io_masters_0_aw_valid        (axi4LiteRegSlice_6_io_downstream_aw_valid             ), //i
    .io_masters_0_aw_ready        (xbar_io_masters_0_aw_ready                            ), //o
    .io_masters_0_aw_payload_addr (axi4LiteRegSlice_6_io_downstream_aw_payload_addr[31:0]), //i
    .io_masters_0_aw_payload_prot (axi4LiteRegSlice_6_io_downstream_aw_payload_prot[2:0] ), //i
    .io_masters_0_w_valid         (axi4LiteRegSlice_6_io_downstream_w_valid              ), //i
    .io_masters_0_w_ready         (xbar_io_masters_0_w_ready                             ), //o
    .io_masters_0_w_payload_data  (axi4LiteRegSlice_6_io_downstream_w_payload_data[31:0] ), //i
    .io_masters_0_w_payload_strb  (axi4LiteRegSlice_6_io_downstream_w_payload_strb[3:0]  ), //i
    .io_masters_0_b_valid         (xbar_io_masters_0_b_valid                             ), //o
    .io_masters_0_b_ready         (axi4LiteRegSlice_6_io_downstream_b_ready              ), //i
    .io_masters_0_b_payload_resp  (xbar_io_masters_0_b_payload_resp[1:0]                 ), //o
    .io_masters_0_ar_valid        (axi4LiteRegSlice_6_io_downstream_ar_valid             ), //i
    .io_masters_0_ar_ready        (xbar_io_masters_0_ar_ready                            ), //o
    .io_masters_0_ar_payload_addr (axi4LiteRegSlice_6_io_downstream_ar_payload_addr[31:0]), //i
    .io_masters_0_ar_payload_prot (axi4LiteRegSlice_6_io_downstream_ar_payload_prot[2:0] ), //i
    .io_masters_0_r_valid         (xbar_io_masters_0_r_valid                             ), //o
    .io_masters_0_r_ready         (axi4LiteRegSlice_6_io_downstream_r_ready              ), //i
    .io_masters_0_r_payload_data  (xbar_io_masters_0_r_payload_data[31:0]                ), //o
    .io_masters_0_r_payload_resp  (xbar_io_masters_0_r_payload_resp[1:0]                 ), //o
    .io_masters_1_aw_valid        (axi4LiteRegSlice_7_io_downstream_aw_valid             ), //i
    .io_masters_1_aw_ready        (xbar_io_masters_1_aw_ready                            ), //o
    .io_masters_1_aw_payload_addr (axi4LiteRegSlice_7_io_downstream_aw_payload_addr[31:0]), //i
    .io_masters_1_aw_payload_prot (axi4LiteRegSlice_7_io_downstream_aw_payload_prot[2:0] ), //i
    .io_masters_1_w_valid         (axi4LiteRegSlice_7_io_downstream_w_valid              ), //i
    .io_masters_1_w_ready         (xbar_io_masters_1_w_ready                             ), //o
    .io_masters_1_w_payload_data  (axi4LiteRegSlice_7_io_downstream_w_payload_data[31:0] ), //i
    .io_masters_1_w_payload_strb  (axi4LiteRegSlice_7_io_downstream_w_payload_strb[3:0]  ), //i
    .io_masters_1_b_valid         (xbar_io_masters_1_b_valid                             ), //o
    .io_masters_1_b_ready         (axi4LiteRegSlice_7_io_downstream_b_ready              ), //i
    .io_masters_1_b_payload_resp  (xbar_io_masters_1_b_payload_resp[1:0]                 ), //o
    .io_masters_1_ar_valid        (axi4LiteRegSlice_7_io_downstream_ar_valid             ), //i
    .io_masters_1_ar_ready        (xbar_io_masters_1_ar_ready                            ), //o
    .io_masters_1_ar_payload_addr (axi4LiteRegSlice_7_io_downstream_ar_payload_addr[31:0]), //i
    .io_masters_1_ar_payload_prot (axi4LiteRegSlice_7_io_downstream_ar_payload_prot[2:0] ), //i
    .io_masters_1_r_valid         (xbar_io_masters_1_r_valid                             ), //o
    .io_masters_1_r_ready         (axi4LiteRegSlice_7_io_downstream_r_ready              ), //i
    .io_masters_1_r_payload_data  (xbar_io_masters_1_r_payload_data[31:0]                ), //o
    .io_masters_1_r_payload_resp  (xbar_io_masters_1_r_payload_resp[1:0]                 ), //o
    .io_slaves_0_aw_valid         (xbar_io_slaves_0_aw_valid                             ), //o
    .io_slaves_0_aw_ready         (axi4LiteRegSlice_8_io_upstream_aw_ready               ), //i
    .io_slaves_0_aw_payload_addr  (xbar_io_slaves_0_aw_payload_addr[31:0]                ), //o
    .io_slaves_0_aw_payload_prot  (xbar_io_slaves_0_aw_payload_prot[2:0]                 ), //o
    .io_slaves_0_w_valid          (xbar_io_slaves_0_w_valid                              ), //o
    .io_slaves_0_w_ready          (axi4LiteRegSlice_8_io_upstream_w_ready                ), //i
    .io_slaves_0_w_payload_data   (xbar_io_slaves_0_w_payload_data[31:0]                 ), //o
    .io_slaves_0_w_payload_strb   (xbar_io_slaves_0_w_payload_strb[3:0]                  ), //o
    .io_slaves_0_b_valid          (axi4LiteRegSlice_8_io_upstream_b_valid                ), //i
    .io_slaves_0_b_ready          (xbar_io_slaves_0_b_ready                              ), //o
    .io_slaves_0_b_payload_resp   (axi4LiteRegSlice_8_io_upstream_b_payload_resp[1:0]    ), //i
    .io_slaves_0_ar_valid         (xbar_io_slaves_0_ar_valid                             ), //o
    .io_slaves_0_ar_ready         (axi4LiteRegSlice_8_io_upstream_ar_ready               ), //i
    .io_slaves_0_ar_payload_addr  (xbar_io_slaves_0_ar_payload_addr[31:0]                ), //o
    .io_slaves_0_ar_payload_prot  (xbar_io_slaves_0_ar_payload_prot[2:0]                 ), //o
    .io_slaves_0_r_valid          (axi4LiteRegSlice_8_io_upstream_r_valid                ), //i
    .io_slaves_0_r_ready          (xbar_io_slaves_0_r_ready                              ), //o
    .io_slaves_0_r_payload_data   (axi4LiteRegSlice_8_io_upstream_r_payload_data[31:0]   ), //i
    .io_slaves_0_r_payload_resp   (axi4LiteRegSlice_8_io_upstream_r_payload_resp[1:0]    ), //i
    .io_slaves_1_aw_valid         (xbar_io_slaves_1_aw_valid                             ), //o
    .io_slaves_1_aw_ready         (axi4LiteRegSlice_9_io_upstream_aw_ready               ), //i
    .io_slaves_1_aw_payload_addr  (xbar_io_slaves_1_aw_payload_addr[31:0]                ), //o
    .io_slaves_1_aw_payload_prot  (xbar_io_slaves_1_aw_payload_prot[2:0]                 ), //o
    .io_slaves_1_w_valid          (xbar_io_slaves_1_w_valid                              ), //o
    .io_slaves_1_w_ready          (axi4LiteRegSlice_9_io_upstream_w_ready                ), //i
    .io_slaves_1_w_payload_data   (xbar_io_slaves_1_w_payload_data[31:0]                 ), //o
    .io_slaves_1_w_payload_strb   (xbar_io_slaves_1_w_payload_strb[3:0]                  ), //o
    .io_slaves_1_b_valid          (axi4LiteRegSlice_9_io_upstream_b_valid                ), //i
    .io_slaves_1_b_ready          (xbar_io_slaves_1_b_ready                              ), //o
    .io_slaves_1_b_payload_resp   (axi4LiteRegSlice_9_io_upstream_b_payload_resp[1:0]    ), //i
    .io_slaves_1_ar_valid         (xbar_io_slaves_1_ar_valid                             ), //o
    .io_slaves_1_ar_ready         (axi4LiteRegSlice_9_io_upstream_ar_ready               ), //i
    .io_slaves_1_ar_payload_addr  (xbar_io_slaves_1_ar_payload_addr[31:0]                ), //o
    .io_slaves_1_ar_payload_prot  (xbar_io_slaves_1_ar_payload_prot[2:0]                 ), //o
    .io_slaves_1_r_valid          (axi4LiteRegSlice_9_io_upstream_r_valid                ), //i
    .io_slaves_1_r_ready          (xbar_io_slaves_1_r_ready                              ), //o
    .io_slaves_1_r_payload_data   (axi4LiteRegSlice_9_io_upstream_r_payload_data[31:0]   ), //i
    .io_slaves_1_r_payload_resp   (axi4LiteRegSlice_9_io_upstream_r_payload_resp[1:0]    ), //i
    .io_slaves_2_aw_valid         (xbar_io_slaves_2_aw_valid                             ), //o
    .io_slaves_2_aw_ready         (axi4LiteRegSlice_10_io_upstream_aw_ready              ), //i
    .io_slaves_2_aw_payload_addr  (xbar_io_slaves_2_aw_payload_addr[31:0]                ), //o
    .io_slaves_2_aw_payload_prot  (xbar_io_slaves_2_aw_payload_prot[2:0]                 ), //o
    .io_slaves_2_w_valid          (xbar_io_slaves_2_w_valid                              ), //o
    .io_slaves_2_w_ready          (axi4LiteRegSlice_10_io_upstream_w_ready               ), //i
    .io_slaves_2_w_payload_data   (xbar_io_slaves_2_w_payload_data[31:0]                 ), //o
    .io_slaves_2_w_payload_strb   (xbar_io_slaves_2_w_payload_strb[3:0]                  ), //o
    .io_slaves_2_b_valid          (axi4LiteRegSlice_10_io_upstream_b_valid               ), //i
    .io_slaves_2_b_ready          (xbar_io_slaves_2_b_ready                              ), //o
    .io_slaves_2_b_payload_resp   (axi4LiteRegSlice_10_io_upstream_b_payload_resp[1:0]   ), //i
    .io_slaves_2_ar_valid         (xbar_io_slaves_2_ar_valid                             ), //o
    .io_slaves_2_ar_ready         (axi4LiteRegSlice_10_io_upstream_ar_ready              ), //i
    .io_slaves_2_ar_payload_addr  (xbar_io_slaves_2_ar_payload_addr[31:0]                ), //o
    .io_slaves_2_ar_payload_prot  (xbar_io_slaves_2_ar_payload_prot[2:0]                 ), //o
    .io_slaves_2_r_valid          (axi4LiteRegSlice_10_io_upstream_r_valid               ), //i
    .io_slaves_2_r_ready          (xbar_io_slaves_2_r_ready                              ), //o
    .io_slaves_2_r_payload_data   (axi4LiteRegSlice_10_io_upstream_r_payload_data[31:0]  ), //i
    .io_slaves_2_r_payload_resp   (axi4LiteRegSlice_10_io_upstream_r_payload_resp[1:0]   ), //i
    .io_slaves_3_aw_valid         (xbar_io_slaves_3_aw_valid                             ), //o
    .io_slaves_3_aw_ready         (axi4LiteRegSlice_11_io_upstream_aw_ready              ), //i
    .io_slaves_3_aw_payload_addr  (xbar_io_slaves_3_aw_payload_addr[31:0]                ), //o
    .io_slaves_3_aw_payload_prot  (xbar_io_slaves_3_aw_payload_prot[2:0]                 ), //o
    .io_slaves_3_w_valid          (xbar_io_slaves_3_w_valid                              ), //o
    .io_slaves_3_w_ready          (axi4LiteRegSlice_11_io_upstream_w_ready               ), //i
    .io_slaves_3_w_payload_data   (xbar_io_slaves_3_w_payload_data[31:0]                 ), //o
    .io_slaves_3_w_payload_strb   (xbar_io_slaves_3_w_payload_strb[3:0]                  ), //o
    .io_slaves_3_b_valid          (axi4LiteRegSlice_11_io_upstream_b_valid               ), //i
    .io_slaves_3_b_ready          (xbar_io_slaves_3_b_ready                              ), //o
    .io_slaves_3_b_payload_resp   (axi4LiteRegSlice_11_io_upstream_b_payload_resp[1:0]   ), //i
    .io_slaves_3_ar_valid         (xbar_io_slaves_3_ar_valid                             ), //o
    .io_slaves_3_ar_ready         (axi4LiteRegSlice_11_io_upstream_ar_ready              ), //i
    .io_slaves_3_ar_payload_addr  (xbar_io_slaves_3_ar_payload_addr[31:0]                ), //o
    .io_slaves_3_ar_payload_prot  (xbar_io_slaves_3_ar_payload_prot[2:0]                 ), //o
    .io_slaves_3_r_valid          (axi4LiteRegSlice_11_io_upstream_r_valid               ), //i
    .io_slaves_3_r_ready          (xbar_io_slaves_3_r_ready                              ), //o
    .io_slaves_3_r_payload_data   (axi4LiteRegSlice_11_io_upstream_r_payload_data[31:0]  ), //i
    .io_slaves_3_r_payload_resp   (axi4LiteRegSlice_11_io_upstream_r_payload_resp[1:0]   ), //i
    .clk                          (clk                                                   ), //i
    .resetn                       (resetn                                                )  //i
  );
  Axi4LiteRegSlice axi4LiteRegSlice_6 (
    .io_upstream_aw_valid          (io_masters_0_aw_valid                                 ), //i
    .io_upstream_aw_ready          (axi4LiteRegSlice_6_io_upstream_aw_ready               ), //o
    .io_upstream_aw_payload_addr   (io_masters_0_aw_payload_addr[31:0]                    ), //i
    .io_upstream_aw_payload_prot   (io_masters_0_aw_payload_prot[2:0]                     ), //i
    .io_upstream_w_valid           (io_masters_0_w_valid                                  ), //i
    .io_upstream_w_ready           (axi4LiteRegSlice_6_io_upstream_w_ready                ), //o
    .io_upstream_w_payload_data    (io_masters_0_w_payload_data[31:0]                     ), //i
    .io_upstream_w_payload_strb    (io_masters_0_w_payload_strb[3:0]                      ), //i
    .io_upstream_b_valid           (axi4LiteRegSlice_6_io_upstream_b_valid                ), //o
    .io_upstream_b_ready           (io_masters_0_b_ready                                  ), //i
    .io_upstream_b_payload_resp    (axi4LiteRegSlice_6_io_upstream_b_payload_resp[1:0]    ), //o
    .io_upstream_ar_valid          (io_masters_0_ar_valid                                 ), //i
    .io_upstream_ar_ready          (axi4LiteRegSlice_6_io_upstream_ar_ready               ), //o
    .io_upstream_ar_payload_addr   (io_masters_0_ar_payload_addr[31:0]                    ), //i
    .io_upstream_ar_payload_prot   (io_masters_0_ar_payload_prot[2:0]                     ), //i
    .io_upstream_r_valid           (axi4LiteRegSlice_6_io_upstream_r_valid                ), //o
    .io_upstream_r_ready           (io_masters_0_r_ready                                  ), //i
    .io_upstream_r_payload_data    (axi4LiteRegSlice_6_io_upstream_r_payload_data[31:0]   ), //o
    .io_upstream_r_payload_resp    (axi4LiteRegSlice_6_io_upstream_r_payload_resp[1:0]    ), //o
    .io_downstream_aw_valid        (axi4LiteRegSlice_6_io_downstream_aw_valid             ), //o
    .io_downstream_aw_ready        (xbar_io_masters_0_aw_ready                            ), //i
    .io_downstream_aw_payload_addr (axi4LiteRegSlice_6_io_downstream_aw_payload_addr[31:0]), //o
    .io_downstream_aw_payload_prot (axi4LiteRegSlice_6_io_downstream_aw_payload_prot[2:0] ), //o
    .io_downstream_w_valid         (axi4LiteRegSlice_6_io_downstream_w_valid              ), //o
    .io_downstream_w_ready         (xbar_io_masters_0_w_ready                             ), //i
    .io_downstream_w_payload_data  (axi4LiteRegSlice_6_io_downstream_w_payload_data[31:0] ), //o
    .io_downstream_w_payload_strb  (axi4LiteRegSlice_6_io_downstream_w_payload_strb[3:0]  ), //o
    .io_downstream_b_valid         (xbar_io_masters_0_b_valid                             ), //i
    .io_downstream_b_ready         (axi4LiteRegSlice_6_io_downstream_b_ready              ), //o
    .io_downstream_b_payload_resp  (xbar_io_masters_0_b_payload_resp[1:0]                 ), //i
    .io_downstream_ar_valid        (axi4LiteRegSlice_6_io_downstream_ar_valid             ), //o
    .io_downstream_ar_ready        (xbar_io_masters_0_ar_ready                            ), //i
    .io_downstream_ar_payload_addr (axi4LiteRegSlice_6_io_downstream_ar_payload_addr[31:0]), //o
    .io_downstream_ar_payload_prot (axi4LiteRegSlice_6_io_downstream_ar_payload_prot[2:0] ), //o
    .io_downstream_r_valid         (xbar_io_masters_0_r_valid                             ), //i
    .io_downstream_r_ready         (axi4LiteRegSlice_6_io_downstream_r_ready              ), //o
    .io_downstream_r_payload_data  (xbar_io_masters_0_r_payload_data[31:0]                ), //i
    .io_downstream_r_payload_resp  (xbar_io_masters_0_r_payload_resp[1:0]                 ), //i
    .clk                           (clk                                                   ), //i
    .resetn                        (resetn                                                )  //i
  );
  Axi4LiteRegSlice axi4LiteRegSlice_7 (
    .io_upstream_aw_valid          (io_masters_1_aw_valid                                 ), //i
    .io_upstream_aw_ready          (axi4LiteRegSlice_7_io_upstream_aw_ready               ), //o
    .io_upstream_aw_payload_addr   (io_masters_1_aw_payload_addr[31:0]                    ), //i
    .io_upstream_aw_payload_prot   (io_masters_1_aw_payload_prot[2:0]                     ), //i
    .io_upstream_w_valid           (io_masters_1_w_valid                                  ), //i
    .io_upstream_w_ready           (axi4LiteRegSlice_7_io_upstream_w_ready                ), //o
    .io_upstream_w_payload_data    (io_masters_1_w_payload_data[31:0]                     ), //i
    .io_upstream_w_payload_strb    (io_masters_1_w_payload_strb[3:0]                      ), //i
    .io_upstream_b_valid           (axi4LiteRegSlice_7_io_upstream_b_valid                ), //o
    .io_upstream_b_ready           (io_masters_1_b_ready                                  ), //i
    .io_upstream_b_payload_resp    (axi4LiteRegSlice_7_io_upstream_b_payload_resp[1:0]    ), //o
    .io_upstream_ar_valid          (io_masters_1_ar_valid                                 ), //i
    .io_upstream_ar_ready          (axi4LiteRegSlice_7_io_upstream_ar_ready               ), //o
    .io_upstream_ar_payload_addr   (io_masters_1_ar_payload_addr[31:0]                    ), //i
    .io_upstream_ar_payload_prot   (io_masters_1_ar_payload_prot[2:0]                     ), //i
    .io_upstream_r_valid           (axi4LiteRegSlice_7_io_upstream_r_valid                ), //o
    .io_upstream_r_ready           (io_masters_1_r_ready                                  ), //i
    .io_upstream_r_payload_data    (axi4LiteRegSlice_7_io_upstream_r_payload_data[31:0]   ), //o
    .io_upstream_r_payload_resp    (axi4LiteRegSlice_7_io_upstream_r_payload_resp[1:0]    ), //o
    .io_downstream_aw_valid        (axi4LiteRegSlice_7_io_downstream_aw_valid             ), //o
    .io_downstream_aw_ready        (xbar_io_masters_1_aw_ready                            ), //i
    .io_downstream_aw_payload_addr (axi4LiteRegSlice_7_io_downstream_aw_payload_addr[31:0]), //o
    .io_downstream_aw_payload_prot (axi4LiteRegSlice_7_io_downstream_aw_payload_prot[2:0] ), //o
    .io_downstream_w_valid         (axi4LiteRegSlice_7_io_downstream_w_valid              ), //o
    .io_downstream_w_ready         (xbar_io_masters_1_w_ready                             ), //i
    .io_downstream_w_payload_data  (axi4LiteRegSlice_7_io_downstream_w_payload_data[31:0] ), //o
    .io_downstream_w_payload_strb  (axi4LiteRegSlice_7_io_downstream_w_payload_strb[3:0]  ), //o
    .io_downstream_b_valid         (xbar_io_masters_1_b_valid                             ), //i
    .io_downstream_b_ready         (axi4LiteRegSlice_7_io_downstream_b_ready              ), //o
    .io_downstream_b_payload_resp  (xbar_io_masters_1_b_payload_resp[1:0]                 ), //i
    .io_downstream_ar_valid        (axi4LiteRegSlice_7_io_downstream_ar_valid             ), //o
    .io_downstream_ar_ready        (xbar_io_masters_1_ar_ready                            ), //i
    .io_downstream_ar_payload_addr (axi4LiteRegSlice_7_io_downstream_ar_payload_addr[31:0]), //o
    .io_downstream_ar_payload_prot (axi4LiteRegSlice_7_io_downstream_ar_payload_prot[2:0] ), //o
    .io_downstream_r_valid         (xbar_io_masters_1_r_valid                             ), //i
    .io_downstream_r_ready         (axi4LiteRegSlice_7_io_downstream_r_ready              ), //o
    .io_downstream_r_payload_data  (xbar_io_masters_1_r_payload_data[31:0]                ), //i
    .io_downstream_r_payload_resp  (xbar_io_masters_1_r_payload_resp[1:0]                 ), //i
    .clk                           (clk                                                   ), //i
    .resetn                        (resetn                                                )  //i
  );
  Axi4LiteRegSlice axi4LiteRegSlice_8 (
    .io_upstream_aw_valid          (xbar_io_slaves_0_aw_valid                             ), //i
    .io_upstream_aw_ready          (axi4LiteRegSlice_8_io_upstream_aw_ready               ), //o
    .io_upstream_aw_payload_addr   (xbar_io_slaves_0_aw_payload_addr[31:0]                ), //i
    .io_upstream_aw_payload_prot   (xbar_io_slaves_0_aw_payload_prot[2:0]                 ), //i
    .io_upstream_w_valid           (xbar_io_slaves_0_w_valid                              ), //i
    .io_upstream_w_ready           (axi4LiteRegSlice_8_io_upstream_w_ready                ), //o
    .io_upstream_w_payload_data    (xbar_io_slaves_0_w_payload_data[31:0]                 ), //i
    .io_upstream_w_payload_strb    (xbar_io_slaves_0_w_payload_strb[3:0]                  ), //i
    .io_upstream_b_valid           (axi4LiteRegSlice_8_io_upstream_b_valid                ), //o
    .io_upstream_b_ready           (xbar_io_slaves_0_b_ready                              ), //i
    .io_upstream_b_payload_resp    (axi4LiteRegSlice_8_io_upstream_b_payload_resp[1:0]    ), //o
    .io_upstream_ar_valid          (xbar_io_slaves_0_ar_valid                             ), //i
    .io_upstream_ar_ready          (axi4LiteRegSlice_8_io_upstream_ar_ready               ), //o
    .io_upstream_ar_payload_addr   (xbar_io_slaves_0_ar_payload_addr[31:0]                ), //i
    .io_upstream_ar_payload_prot   (xbar_io_slaves_0_ar_payload_prot[2:0]                 ), //i
    .io_upstream_r_valid           (axi4LiteRegSlice_8_io_upstream_r_valid                ), //o
    .io_upstream_r_ready           (xbar_io_slaves_0_r_ready                              ), //i
    .io_upstream_r_payload_data    (axi4LiteRegSlice_8_io_upstream_r_payload_data[31:0]   ), //o
    .io_upstream_r_payload_resp    (axi4LiteRegSlice_8_io_upstream_r_payload_resp[1:0]    ), //o
    .io_downstream_aw_valid        (axi4LiteRegSlice_8_io_downstream_aw_valid             ), //o
    .io_downstream_aw_ready        (io_slaves_0_aw_ready                                  ), //i
    .io_downstream_aw_payload_addr (axi4LiteRegSlice_8_io_downstream_aw_payload_addr[31:0]), //o
    .io_downstream_aw_payload_prot (axi4LiteRegSlice_8_io_downstream_aw_payload_prot[2:0] ), //o
    .io_downstream_w_valid         (axi4LiteRegSlice_8_io_downstream_w_valid              ), //o
    .io_downstream_w_ready         (io_slaves_0_w_ready                                   ), //i
    .io_downstream_w_payload_data  (axi4LiteRegSlice_8_io_downstream_w_payload_data[31:0] ), //o
    .io_downstream_w_payload_strb  (axi4LiteRegSlice_8_io_downstream_w_payload_strb[3:0]  ), //o
    .io_downstream_b_valid         (io_slaves_0_b_valid                                   ), //i
    .io_downstream_b_ready         (axi4LiteRegSlice_8_io_downstream_b_ready              ), //o
    .io_downstream_b_payload_resp  (io_slaves_0_b_payload_resp[1:0]                       ), //i
    .io_downstream_ar_valid        (axi4LiteRegSlice_8_io_downstream_ar_valid             ), //o
    .io_downstream_ar_ready        (io_slaves_0_ar_ready                                  ), //i
    .io_downstream_ar_payload_addr (axi4LiteRegSlice_8_io_downstream_ar_payload_addr[31:0]), //o
    .io_downstream_ar_payload_prot (axi4LiteRegSlice_8_io_downstream_ar_payload_prot[2:0] ), //o
    .io_downstream_r_valid         (io_slaves_0_r_valid                                   ), //i
    .io_downstream_r_ready         (axi4LiteRegSlice_8_io_downstream_r_ready              ), //o
    .io_downstream_r_payload_data  (io_slaves_0_r_payload_data[31:0]                      ), //i
    .io_downstream_r_payload_resp  (io_slaves_0_r_payload_resp[1:0]                       ), //i
    .clk                           (clk                                                   ), //i
    .resetn                        (resetn                                                )  //i
  );
  Axi4LiteRegSlice axi4LiteRegSlice_9 (
    .io_upstream_aw_valid          (xbar_io_slaves_1_aw_valid                             ), //i
    .io_upstream_aw_ready          (axi4LiteRegSlice_9_io_upstream_aw_ready               ), //o
    .io_upstream_aw_payload_addr   (xbar_io_slaves_1_aw_payload_addr[31:0]                ), //i
    .io_upstream_aw_payload_prot   (xbar_io_slaves_1_aw_payload_prot[2:0]                 ), //i
    .io_upstream_w_valid           (xbar_io_slaves_1_w_valid                              ), //i
    .io_upstream_w_ready           (axi4LiteRegSlice_9_io_upstream_w_ready                ), //o
    .io_upstream_w_payload_data    (xbar_io_slaves_1_w_payload_data[31:0]                 ), //i
    .io_upstream_w_payload_strb    (xbar_io_slaves_1_w_payload_strb[3:0]                  ), //i
    .io_upstream_b_valid           (axi4LiteRegSlice_9_io_upstream_b_valid                ), //o
    .io_upstream_b_ready           (xbar_io_slaves_1_b_ready                              ), //i
    .io_upstream_b_payload_resp    (axi4LiteRegSlice_9_io_upstream_b_payload_resp[1:0]    ), //o
    .io_upstream_ar_valid          (xbar_io_slaves_1_ar_valid                             ), //i
    .io_upstream_ar_ready          (axi4LiteRegSlice_9_io_upstream_ar_ready               ), //o
    .io_upstream_ar_payload_addr   (xbar_io_slaves_1_ar_payload_addr[31:0]                ), //i
    .io_upstream_ar_payload_prot   (xbar_io_slaves_1_ar_payload_prot[2:0]                 ), //i
    .io_upstream_r_valid           (axi4LiteRegSlice_9_io_upstream_r_valid                ), //o
    .io_upstream_r_ready           (xbar_io_slaves_1_r_ready                              ), //i
    .io_upstream_r_payload_data    (axi4LiteRegSlice_9_io_upstream_r_payload_data[31:0]   ), //o
    .io_upstream_r_payload_resp    (axi4LiteRegSlice_9_io_upstream_r_payload_resp[1:0]    ), //o
    .io_downstream_aw_valid        (axi4LiteRegSlice_9_io_downstream_aw_valid             ), //o
    .io_downstream_aw_ready        (io_slaves_1_aw_ready                                  ), //i
    .io_downstream_aw_payload_addr (axi4LiteRegSlice_9_io_downstream_aw_payload_addr[31:0]), //o
    .io_downstream_aw_payload_prot (axi4LiteRegSlice_9_io_downstream_aw_payload_prot[2:0] ), //o
    .io_downstream_w_valid         (axi4LiteRegSlice_9_io_downstream_w_valid              ), //o
    .io_downstream_w_ready         (io_slaves_1_w_ready                                   ), //i
    .io_downstream_w_payload_data  (axi4LiteRegSlice_9_io_downstream_w_payload_data[31:0] ), //o
    .io_downstream_w_payload_strb  (axi4LiteRegSlice_9_io_downstream_w_payload_strb[3:0]  ), //o
    .io_downstream_b_valid         (io_slaves_1_b_valid                                   ), //i
    .io_downstream_b_ready         (axi4LiteRegSlice_9_io_downstream_b_ready              ), //o
    .io_downstream_b_payload_resp  (io_slaves_1_b_payload_resp[1:0]                       ), //i
    .io_downstream_ar_valid        (axi4LiteRegSlice_9_io_downstream_ar_valid             ), //o
    .io_downstream_ar_ready        (io_slaves_1_ar_ready                                  ), //i
    .io_downstream_ar_payload_addr (axi4LiteRegSlice_9_io_downstream_ar_payload_addr[31:0]), //o
    .io_downstream_ar_payload_prot (axi4LiteRegSlice_9_io_downstream_ar_payload_prot[2:0] ), //o
    .io_downstream_r_valid         (io_slaves_1_r_valid                                   ), //i
    .io_downstream_r_ready         (axi4LiteRegSlice_9_io_downstream_r_ready              ), //o
    .io_downstream_r_payload_data  (io_slaves_1_r_payload_data[31:0]                      ), //i
    .io_downstream_r_payload_resp  (io_slaves_1_r_payload_resp[1:0]                       ), //i
    .clk                           (clk                                                   ), //i
    .resetn                        (resetn                                                )  //i
  );
  Axi4LiteRegSlice axi4LiteRegSlice_10 (
    .io_upstream_aw_valid          (xbar_io_slaves_2_aw_valid                              ), //i
    .io_upstream_aw_ready          (axi4LiteRegSlice_10_io_upstream_aw_ready               ), //o
    .io_upstream_aw_payload_addr   (xbar_io_slaves_2_aw_payload_addr[31:0]                 ), //i
    .io_upstream_aw_payload_prot   (xbar_io_slaves_2_aw_payload_prot[2:0]                  ), //i
    .io_upstream_w_valid           (xbar_io_slaves_2_w_valid                               ), //i
    .io_upstream_w_ready           (axi4LiteRegSlice_10_io_upstream_w_ready                ), //o
    .io_upstream_w_payload_data    (xbar_io_slaves_2_w_payload_data[31:0]                  ), //i
    .io_upstream_w_payload_strb    (xbar_io_slaves_2_w_payload_strb[3:0]                   ), //i
    .io_upstream_b_valid           (axi4LiteRegSlice_10_io_upstream_b_valid                ), //o
    .io_upstream_b_ready           (xbar_io_slaves_2_b_ready                               ), //i
    .io_upstream_b_payload_resp    (axi4LiteRegSlice_10_io_upstream_b_payload_resp[1:0]    ), //o
    .io_upstream_ar_valid          (xbar_io_slaves_2_ar_valid                              ), //i
    .io_upstream_ar_ready          (axi4LiteRegSlice_10_io_upstream_ar_ready               ), //o
    .io_upstream_ar_payload_addr   (xbar_io_slaves_2_ar_payload_addr[31:0]                 ), //i
    .io_upstream_ar_payload_prot   (xbar_io_slaves_2_ar_payload_prot[2:0]                  ), //i
    .io_upstream_r_valid           (axi4LiteRegSlice_10_io_upstream_r_valid                ), //o
    .io_upstream_r_ready           (xbar_io_slaves_2_r_ready                               ), //i
    .io_upstream_r_payload_data    (axi4LiteRegSlice_10_io_upstream_r_payload_data[31:0]   ), //o
    .io_upstream_r_payload_resp    (axi4LiteRegSlice_10_io_upstream_r_payload_resp[1:0]    ), //o
    .io_downstream_aw_valid        (axi4LiteRegSlice_10_io_downstream_aw_valid             ), //o
    .io_downstream_aw_ready        (io_slaves_2_aw_ready                                   ), //i
    .io_downstream_aw_payload_addr (axi4LiteRegSlice_10_io_downstream_aw_payload_addr[31:0]), //o
    .io_downstream_aw_payload_prot (axi4LiteRegSlice_10_io_downstream_aw_payload_prot[2:0] ), //o
    .io_downstream_w_valid         (axi4LiteRegSlice_10_io_downstream_w_valid              ), //o
    .io_downstream_w_ready         (io_slaves_2_w_ready                                    ), //i
    .io_downstream_w_payload_data  (axi4LiteRegSlice_10_io_downstream_w_payload_data[31:0] ), //o
    .io_downstream_w_payload_strb  (axi4LiteRegSlice_10_io_downstream_w_payload_strb[3:0]  ), //o
    .io_downstream_b_valid         (io_slaves_2_b_valid                                    ), //i
    .io_downstream_b_ready         (axi4LiteRegSlice_10_io_downstream_b_ready              ), //o
    .io_downstream_b_payload_resp  (io_slaves_2_b_payload_resp[1:0]                        ), //i
    .io_downstream_ar_valid        (axi4LiteRegSlice_10_io_downstream_ar_valid             ), //o
    .io_downstream_ar_ready        (io_slaves_2_ar_ready                                   ), //i
    .io_downstream_ar_payload_addr (axi4LiteRegSlice_10_io_downstream_ar_payload_addr[31:0]), //o
    .io_downstream_ar_payload_prot (axi4LiteRegSlice_10_io_downstream_ar_payload_prot[2:0] ), //o
    .io_downstream_r_valid         (io_slaves_2_r_valid                                    ), //i
    .io_downstream_r_ready         (axi4LiteRegSlice_10_io_downstream_r_ready              ), //o
    .io_downstream_r_payload_data  (io_slaves_2_r_payload_data[31:0]                       ), //i
    .io_downstream_r_payload_resp  (io_slaves_2_r_payload_resp[1:0]                        ), //i
    .clk                           (clk                                                    ), //i
    .resetn                        (resetn                                                 )  //i
  );
  Axi4LiteRegSlice axi4LiteRegSlice_11 (
    .io_upstream_aw_valid          (xbar_io_slaves_3_aw_valid                              ), //i
    .io_upstream_aw_ready          (axi4LiteRegSlice_11_io_upstream_aw_ready               ), //o
    .io_upstream_aw_payload_addr   (xbar_io_slaves_3_aw_payload_addr[31:0]                 ), //i
    .io_upstream_aw_payload_prot   (xbar_io_slaves_3_aw_payload_prot[2:0]                  ), //i
    .io_upstream_w_valid           (xbar_io_slaves_3_w_valid                               ), //i
    .io_upstream_w_ready           (axi4LiteRegSlice_11_io_upstream_w_ready                ), //o
    .io_upstream_w_payload_data    (xbar_io_slaves_3_w_payload_data[31:0]                  ), //i
    .io_upstream_w_payload_strb    (xbar_io_slaves_3_w_payload_strb[3:0]                   ), //i
    .io_upstream_b_valid           (axi4LiteRegSlice_11_io_upstream_b_valid                ), //o
    .io_upstream_b_ready           (xbar_io_slaves_3_b_ready                               ), //i
    .io_upstream_b_payload_resp    (axi4LiteRegSlice_11_io_upstream_b_payload_resp[1:0]    ), //o
    .io_upstream_ar_valid          (xbar_io_slaves_3_ar_valid                              ), //i
    .io_upstream_ar_ready          (axi4LiteRegSlice_11_io_upstream_ar_ready               ), //o
    .io_upstream_ar_payload_addr   (xbar_io_slaves_3_ar_payload_addr[31:0]                 ), //i
    .io_upstream_ar_payload_prot   (xbar_io_slaves_3_ar_payload_prot[2:0]                  ), //i
    .io_upstream_r_valid           (axi4LiteRegSlice_11_io_upstream_r_valid                ), //o
    .io_upstream_r_ready           (xbar_io_slaves_3_r_ready                               ), //i
    .io_upstream_r_payload_data    (axi4LiteRegSlice_11_io_upstream_r_payload_data[31:0]   ), //o
    .io_upstream_r_payload_resp    (axi4LiteRegSlice_11_io_upstream_r_payload_resp[1:0]    ), //o
    .io_downstream_aw_valid        (axi4LiteRegSlice_11_io_downstream_aw_valid             ), //o
    .io_downstream_aw_ready        (io_slaves_3_aw_ready                                   ), //i
    .io_downstream_aw_payload_addr (axi4LiteRegSlice_11_io_downstream_aw_payload_addr[31:0]), //o
    .io_downstream_aw_payload_prot (axi4LiteRegSlice_11_io_downstream_aw_payload_prot[2:0] ), //o
    .io_downstream_w_valid         (axi4LiteRegSlice_11_io_downstream_w_valid              ), //o
    .io_downstream_w_ready         (io_slaves_3_w_ready                                    ), //i
    .io_downstream_w_payload_data  (axi4LiteRegSlice_11_io_downstream_w_payload_data[31:0] ), //o
    .io_downstream_w_payload_strb  (axi4LiteRegSlice_11_io_downstream_w_payload_strb[3:0]  ), //o
    .io_downstream_b_valid         (io_slaves_3_b_valid                                    ), //i
    .io_downstream_b_ready         (axi4LiteRegSlice_11_io_downstream_b_ready              ), //o
    .io_downstream_b_payload_resp  (io_slaves_3_b_payload_resp[1:0]                        ), //i
    .io_downstream_ar_valid        (axi4LiteRegSlice_11_io_downstream_ar_valid             ), //o
    .io_downstream_ar_ready        (io_slaves_3_ar_ready                                   ), //i
    .io_downstream_ar_payload_addr (axi4LiteRegSlice_11_io_downstream_ar_payload_addr[31:0]), //o
    .io_downstream_ar_payload_prot (axi4LiteRegSlice_11_io_downstream_ar_payload_prot[2:0] ), //o
    .io_downstream_r_valid         (io_slaves_3_r_valid                                    ), //i
    .io_downstream_r_ready         (axi4LiteRegSlice_11_io_downstream_r_ready              ), //o
    .io_downstream_r_payload_data  (io_slaves_3_r_payload_data[31:0]                       ), //i
    .io_downstream_r_payload_resp  (io_slaves_3_r_payload_resp[1:0]                        ), //i
    .clk                           (clk                                                    ), //i
    .resetn                        (resetn                                                 )  //i
  );
  assign io_masters_0_aw_ready = axi4LiteRegSlice_6_io_upstream_aw_ready;
  assign io_masters_0_w_ready = axi4LiteRegSlice_6_io_upstream_w_ready;
  assign io_masters_0_b_valid = axi4LiteRegSlice_6_io_upstream_b_valid;
  assign io_masters_0_b_payload_resp = axi4LiteRegSlice_6_io_upstream_b_payload_resp;
  assign io_masters_0_ar_ready = axi4LiteRegSlice_6_io_upstream_ar_ready;
  assign io_masters_0_r_valid = axi4LiteRegSlice_6_io_upstream_r_valid;
  assign io_masters_0_r_payload_data = axi4LiteRegSlice_6_io_upstream_r_payload_data;
  assign io_masters_0_r_payload_resp = axi4LiteRegSlice_6_io_upstream_r_payload_resp;
  assign io_masters_1_aw_ready = axi4LiteRegSlice_7_io_upstream_aw_ready;
  assign io_masters_1_w_ready = axi4LiteRegSlice_7_io_upstream_w_ready;
  assign io_masters_1_b_valid = axi4LiteRegSlice_7_io_upstream_b_valid;
  assign io_masters_1_b_payload_resp = axi4LiteRegSlice_7_io_upstream_b_payload_resp;
  assign io_masters_1_ar_ready = axi4LiteRegSlice_7_io_upstream_ar_ready;
  assign io_masters_1_r_valid = axi4LiteRegSlice_7_io_upstream_r_valid;
  assign io_masters_1_r_payload_data = axi4LiteRegSlice_7_io_upstream_r_payload_data;
  assign io_masters_1_r_payload_resp = axi4LiteRegSlice_7_io_upstream_r_payload_resp;
  assign io_slaves_0_aw_valid = axi4LiteRegSlice_8_io_downstream_aw_valid;
  assign io_slaves_0_aw_payload_addr = axi4LiteRegSlice_8_io_downstream_aw_payload_addr;
  assign io_slaves_0_aw_payload_prot = axi4LiteRegSlice_8_io_downstream_aw_payload_prot;
  assign io_slaves_0_w_valid = axi4LiteRegSlice_8_io_downstream_w_valid;
  assign io_slaves_0_w_payload_data = axi4LiteRegSlice_8_io_downstream_w_payload_data;
  assign io_slaves_0_w_payload_strb = axi4LiteRegSlice_8_io_downstream_w_payload_strb;
  assign io_slaves_0_b_ready = axi4LiteRegSlice_8_io_downstream_b_ready;
  assign io_slaves_0_ar_valid = axi4LiteRegSlice_8_io_downstream_ar_valid;
  assign io_slaves_0_ar_payload_addr = axi4LiteRegSlice_8_io_downstream_ar_payload_addr;
  assign io_slaves_0_ar_payload_prot = axi4LiteRegSlice_8_io_downstream_ar_payload_prot;
  assign io_slaves_0_r_ready = axi4LiteRegSlice_8_io_downstream_r_ready;
  assign io_slaves_1_aw_valid = axi4LiteRegSlice_9_io_downstream_aw_valid;
  assign io_slaves_1_aw_payload_addr = axi4LiteRegSlice_9_io_downstream_aw_payload_addr;
  assign io_slaves_1_aw_payload_prot = axi4LiteRegSlice_9_io_downstream_aw_payload_prot;
  assign io_slaves_1_w_valid = axi4LiteRegSlice_9_io_downstream_w_valid;
  assign io_slaves_1_w_payload_data = axi4LiteRegSlice_9_io_downstream_w_payload_data;
  assign io_slaves_1_w_payload_strb = axi4LiteRegSlice_9_io_downstream_w_payload_strb;
  assign io_slaves_1_b_ready = axi4LiteRegSlice_9_io_downstream_b_ready;
  assign io_slaves_1_ar_valid = axi4LiteRegSlice_9_io_downstream_ar_valid;
  assign io_slaves_1_ar_payload_addr = axi4LiteRegSlice_9_io_downstream_ar_payload_addr;
  assign io_slaves_1_ar_payload_prot = axi4LiteRegSlice_9_io_downstream_ar_payload_prot;
  assign io_slaves_1_r_ready = axi4LiteRegSlice_9_io_downstream_r_ready;
  assign io_slaves_2_aw_valid = axi4LiteRegSlice_10_io_downstream_aw_valid;
  assign io_slaves_2_aw_payload_addr = axi4LiteRegSlice_10_io_downstream_aw_payload_addr;
  assign io_slaves_2_aw_payload_prot = axi4LiteRegSlice_10_io_downstream_aw_payload_prot;
  assign io_slaves_2_w_valid = axi4LiteRegSlice_10_io_downstream_w_valid;
  assign io_slaves_2_w_payload_data = axi4LiteRegSlice_10_io_downstream_w_payload_data;
  assign io_slaves_2_w_payload_strb = axi4LiteRegSlice_10_io_downstream_w_payload_strb;
  assign io_slaves_2_b_ready = axi4LiteRegSlice_10_io_downstream_b_ready;
  assign io_slaves_2_ar_valid = axi4LiteRegSlice_10_io_downstream_ar_valid;
  assign io_slaves_2_ar_payload_addr = axi4LiteRegSlice_10_io_downstream_ar_payload_addr;
  assign io_slaves_2_ar_payload_prot = axi4LiteRegSlice_10_io_downstream_ar_payload_prot;
  assign io_slaves_2_r_ready = axi4LiteRegSlice_10_io_downstream_r_ready;
  assign io_slaves_3_aw_valid = axi4LiteRegSlice_11_io_downstream_aw_valid;
  assign io_slaves_3_aw_payload_addr = axi4LiteRegSlice_11_io_downstream_aw_payload_addr;
  assign io_slaves_3_aw_payload_prot = axi4LiteRegSlice_11_io_downstream_aw_payload_prot;
  assign io_slaves_3_w_valid = axi4LiteRegSlice_11_io_downstream_w_valid;
  assign io_slaves_3_w_payload_data = axi4LiteRegSlice_11_io_downstream_w_payload_data;
  assign io_slaves_3_w_payload_strb = axi4LiteRegSlice_11_io_downstream_w_payload_strb;
  assign io_slaves_3_b_ready = axi4LiteRegSlice_11_io_downstream_b_ready;
  assign io_slaves_3_ar_valid = axi4LiteRegSlice_11_io_downstream_ar_valid;
  assign io_slaves_3_ar_payload_addr = axi4LiteRegSlice_11_io_downstream_ar_payload_addr;
  assign io_slaves_3_ar_payload_prot = axi4LiteRegSlice_11_io_downstream_ar_payload_prot;
  assign io_slaves_3_r_ready = axi4LiteRegSlice_11_io_downstream_r_ready;

endmodule

//Axi4LiteRegSlice_5 replaced by Axi4LiteRegSlice

//Axi4LiteRegSlice_4 replaced by Axi4LiteRegSlice

//Axi4LiteRegSlice_3 replaced by Axi4LiteRegSlice

//Axi4LiteRegSlice_2 replaced by Axi4LiteRegSlice

//Axi4LiteRegSlice_1 replaced by Axi4LiteRegSlice

module Axi4LiteRegSlice (
  input  wire          io_upstream_aw_valid,
  output reg           io_upstream_aw_ready,
  input  wire [31:0]   io_upstream_aw_payload_addr,
  input  wire [2:0]    io_upstream_aw_payload_prot,
  input  wire          io_upstream_w_valid,
  output reg           io_upstream_w_ready,
  input  wire [31:0]   io_upstream_w_payload_data,
  input  wire [3:0]    io_upstream_w_payload_strb,
  output wire          io_upstream_b_valid,
  input  wire          io_upstream_b_ready,
  output wire [1:0]    io_upstream_b_payload_resp,
  input  wire          io_upstream_ar_valid,
  output reg           io_upstream_ar_ready,
  input  wire [31:0]   io_upstream_ar_payload_addr,
  input  wire [2:0]    io_upstream_ar_payload_prot,
  output wire          io_upstream_r_valid,
  input  wire          io_upstream_r_ready,
  output wire [31:0]   io_upstream_r_payload_data,
  output wire [1:0]    io_upstream_r_payload_resp,
  output wire          io_downstream_aw_valid,
  input  wire          io_downstream_aw_ready,
  output wire [31:0]   io_downstream_aw_payload_addr,
  output wire [2:0]    io_downstream_aw_payload_prot,
  output wire          io_downstream_w_valid,
  input  wire          io_downstream_w_ready,
  output wire [31:0]   io_downstream_w_payload_data,
  output wire [3:0]    io_downstream_w_payload_strb,
  input  wire          io_downstream_b_valid,
  output reg           io_downstream_b_ready,
  input  wire [1:0]    io_downstream_b_payload_resp,
  output wire          io_downstream_ar_valid,
  input  wire          io_downstream_ar_ready,
  output wire [31:0]   io_downstream_ar_payload_addr,
  output wire [2:0]    io_downstream_ar_payload_prot,
  input  wire          io_downstream_r_valid,
  output reg           io_downstream_r_ready,
  input  wire [31:0]   io_downstream_r_payload_data,
  input  wire [1:0]    io_downstream_r_payload_resp,
  input  wire          clk,
  input  wire          resetn
);

  wire                io_upstream_aw_stage_valid;
  wire                io_upstream_aw_stage_ready;
  wire       [31:0]   io_upstream_aw_stage_payload_addr;
  wire       [2:0]    io_upstream_aw_stage_payload_prot;
  reg                 io_upstream_aw_rValid;
  reg        [31:0]   io_upstream_aw_rData_addr;
  reg        [2:0]    io_upstream_aw_rData_prot;
  wire                when_Stream_l477;
  wire                io_upstream_w_stage_valid;
  wire                io_upstream_w_stage_ready;
  wire       [31:0]   io_upstream_w_stage_payload_data;
  wire       [3:0]    io_upstream_w_stage_payload_strb;
  reg                 io_upstream_w_rValid;
  reg        [31:0]   io_upstream_w_rData_data;
  reg        [3:0]    io_upstream_w_rData_strb;
  wire                when_Stream_l477_1;
  wire                io_upstream_ar_stage_valid;
  wire                io_upstream_ar_stage_ready;
  wire       [31:0]   io_upstream_ar_stage_payload_addr;
  wire       [2:0]    io_upstream_ar_stage_payload_prot;
  reg                 io_upstream_ar_rValid;
  reg        [31:0]   io_upstream_ar_rData_addr;
  reg        [2:0]    io_upstream_ar_rData_prot;
  wire                when_Stream_l477_2;
  wire                io_downstream_b_stage_valid;
  wire                io_downstream_b_stage_ready;
  wire       [1:0]    io_downstream_b_stage_payload_resp;
  reg                 io_downstream_b_rValid;
  reg        [1:0]    io_downstream_b_rData_resp;
  wire                when_Stream_l477_3;
  wire                io_downstream_r_stage_valid;
  wire                io_downstream_r_stage_ready;
  wire       [31:0]   io_downstream_r_stage_payload_data;
  wire       [1:0]    io_downstream_r_stage_payload_resp;
  reg                 io_downstream_r_rValid;
  reg        [31:0]   io_downstream_r_rData_data;
  reg        [1:0]    io_downstream_r_rData_resp;
  wire                when_Stream_l477_4;

  always @(*) begin
    io_upstream_aw_ready = io_upstream_aw_stage_ready;
    if(when_Stream_l477) begin
      io_upstream_aw_ready = 1'b1;
    end
  end

  assign when_Stream_l477 = (! io_upstream_aw_stage_valid);
  assign io_upstream_aw_stage_valid = io_upstream_aw_rValid;
  assign io_upstream_aw_stage_payload_addr = io_upstream_aw_rData_addr;
  assign io_upstream_aw_stage_payload_prot = io_upstream_aw_rData_prot;
  assign io_downstream_aw_valid = io_upstream_aw_stage_valid;
  assign io_upstream_aw_stage_ready = io_downstream_aw_ready;
  assign io_downstream_aw_payload_addr = io_upstream_aw_stage_payload_addr;
  assign io_downstream_aw_payload_prot = io_upstream_aw_stage_payload_prot;
  always @(*) begin
    io_upstream_w_ready = io_upstream_w_stage_ready;
    if(when_Stream_l477_1) begin
      io_upstream_w_ready = 1'b1;
    end
  end

  assign when_Stream_l477_1 = (! io_upstream_w_stage_valid);
  assign io_upstream_w_stage_valid = io_upstream_w_rValid;
  assign io_upstream_w_stage_payload_data = io_upstream_w_rData_data;
  assign io_upstream_w_stage_payload_strb = io_upstream_w_rData_strb;
  assign io_downstream_w_valid = io_upstream_w_stage_valid;
  assign io_upstream_w_stage_ready = io_downstream_w_ready;
  assign io_downstream_w_payload_data = io_upstream_w_stage_payload_data;
  assign io_downstream_w_payload_strb = io_upstream_w_stage_payload_strb;
  always @(*) begin
    io_upstream_ar_ready = io_upstream_ar_stage_ready;
    if(when_Stream_l477_2) begin
      io_upstream_ar_ready = 1'b1;
    end
  end

  assign when_Stream_l477_2 = (! io_upstream_ar_stage_valid);
  assign io_upstream_ar_stage_valid = io_upstream_ar_rValid;
  assign io_upstream_ar_stage_payload_addr = io_upstream_ar_rData_addr;
  assign io_upstream_ar_stage_payload_prot = io_upstream_ar_rData_prot;
  assign io_downstream_ar_valid = io_upstream_ar_stage_valid;
  assign io_upstream_ar_stage_ready = io_downstream_ar_ready;
  assign io_downstream_ar_payload_addr = io_upstream_ar_stage_payload_addr;
  assign io_downstream_ar_payload_prot = io_upstream_ar_stage_payload_prot;
  always @(*) begin
    io_downstream_b_ready = io_downstream_b_stage_ready;
    if(when_Stream_l477_3) begin
      io_downstream_b_ready = 1'b1;
    end
  end

  assign when_Stream_l477_3 = (! io_downstream_b_stage_valid);
  assign io_downstream_b_stage_valid = io_downstream_b_rValid;
  assign io_downstream_b_stage_payload_resp = io_downstream_b_rData_resp;
  assign io_upstream_b_valid = io_downstream_b_stage_valid;
  assign io_downstream_b_stage_ready = io_upstream_b_ready;
  assign io_upstream_b_payload_resp = io_downstream_b_stage_payload_resp;
  always @(*) begin
    io_downstream_r_ready = io_downstream_r_stage_ready;
    if(when_Stream_l477_4) begin
      io_downstream_r_ready = 1'b1;
    end
  end

  assign when_Stream_l477_4 = (! io_downstream_r_stage_valid);
  assign io_downstream_r_stage_valid = io_downstream_r_rValid;
  assign io_downstream_r_stage_payload_data = io_downstream_r_rData_data;
  assign io_downstream_r_stage_payload_resp = io_downstream_r_rData_resp;
  assign io_upstream_r_valid = io_downstream_r_stage_valid;
  assign io_downstream_r_stage_ready = io_upstream_r_ready;
  assign io_upstream_r_payload_data = io_downstream_r_stage_payload_data;
  assign io_upstream_r_payload_resp = io_downstream_r_stage_payload_resp;
  always @(posedge clk) begin
    if(!resetn) begin
      io_upstream_aw_rValid <= 1'b0;
      io_upstream_w_rValid <= 1'b0;
      io_upstream_ar_rValid <= 1'b0;
      io_downstream_b_rValid <= 1'b0;
      io_downstream_r_rValid <= 1'b0;
    end else begin
      if(io_upstream_aw_ready) begin
        io_upstream_aw_rValid <= io_upstream_aw_valid;
      end
      if(io_upstream_w_ready) begin
        io_upstream_w_rValid <= io_upstream_w_valid;
      end
      if(io_upstream_ar_ready) begin
        io_upstream_ar_rValid <= io_upstream_ar_valid;
      end
      if(io_downstream_b_ready) begin
        io_downstream_b_rValid <= io_downstream_b_valid;
      end
      if(io_downstream_r_ready) begin
        io_downstream_r_rValid <= io_downstream_r_valid;
      end
    end
  end

  always @(posedge clk) begin
    if(io_upstream_aw_ready) begin
      io_upstream_aw_rData_addr <= io_upstream_aw_payload_addr;
      io_upstream_aw_rData_prot <= io_upstream_aw_payload_prot;
    end
    if(io_upstream_w_ready) begin
      io_upstream_w_rData_data <= io_upstream_w_payload_data;
      io_upstream_w_rData_strb <= io_upstream_w_payload_strb;
    end
    if(io_upstream_ar_ready) begin
      io_upstream_ar_rData_addr <= io_upstream_ar_payload_addr;
      io_upstream_ar_rData_prot <= io_upstream_ar_payload_prot;
    end
    if(io_downstream_b_ready) begin
      io_downstream_b_rData_resp <= io_downstream_b_payload_resp;
    end
    if(io_downstream_r_ready) begin
      io_downstream_r_rData_data <= io_downstream_r_payload_data;
      io_downstream_r_rData_resp <= io_downstream_r_payload_resp;
    end
  end


endmodule

module Axi4LiteCrossbar (
  input  wire          io_masters_0_aw_valid,
  output reg           io_masters_0_aw_ready,
  input  wire [31:0]   io_masters_0_aw_payload_addr,
  input  wire [2:0]    io_masters_0_aw_payload_prot,
  input  wire          io_masters_0_w_valid,
  output reg           io_masters_0_w_ready,
  input  wire [31:0]   io_masters_0_w_payload_data,
  input  wire [3:0]    io_masters_0_w_payload_strb,
  output reg           io_masters_0_b_valid,
  input  wire          io_masters_0_b_ready,
  output reg  [1:0]    io_masters_0_b_payload_resp,
  input  wire          io_masters_0_ar_valid,
  output reg           io_masters_0_ar_ready,
  input  wire [31:0]   io_masters_0_ar_payload_addr,
  input  wire [2:0]    io_masters_0_ar_payload_prot,
  output reg           io_masters_0_r_valid,
  input  wire          io_masters_0_r_ready,
  output reg  [31:0]   io_masters_0_r_payload_data,
  output reg  [1:0]    io_masters_0_r_payload_resp,
  input  wire          io_masters_1_aw_valid,
  output reg           io_masters_1_aw_ready,
  input  wire [31:0]   io_masters_1_aw_payload_addr,
  input  wire [2:0]    io_masters_1_aw_payload_prot,
  input  wire          io_masters_1_w_valid,
  output reg           io_masters_1_w_ready,
  input  wire [31:0]   io_masters_1_w_payload_data,
  input  wire [3:0]    io_masters_1_w_payload_strb,
  output reg           io_masters_1_b_valid,
  input  wire          io_masters_1_b_ready,
  output reg  [1:0]    io_masters_1_b_payload_resp,
  input  wire          io_masters_1_ar_valid,
  output reg           io_masters_1_ar_ready,
  input  wire [31:0]   io_masters_1_ar_payload_addr,
  input  wire [2:0]    io_masters_1_ar_payload_prot,
  output reg           io_masters_1_r_valid,
  input  wire          io_masters_1_r_ready,
  output reg  [31:0]   io_masters_1_r_payload_data,
  output reg  [1:0]    io_masters_1_r_payload_resp,
  output reg           io_slaves_0_aw_valid,
  input  wire          io_slaves_0_aw_ready,
  output reg  [31:0]   io_slaves_0_aw_payload_addr,
  output reg  [2:0]    io_slaves_0_aw_payload_prot,
  output reg           io_slaves_0_w_valid,
  input  wire          io_slaves_0_w_ready,
  output reg  [31:0]   io_slaves_0_w_payload_data,
  output reg  [3:0]    io_slaves_0_w_payload_strb,
  input  wire          io_slaves_0_b_valid,
  output reg           io_slaves_0_b_ready,
  input  wire [1:0]    io_slaves_0_b_payload_resp,
  output reg           io_slaves_0_ar_valid,
  input  wire          io_slaves_0_ar_ready,
  output reg  [31:0]   io_slaves_0_ar_payload_addr,
  output reg  [2:0]    io_slaves_0_ar_payload_prot,
  input  wire          io_slaves_0_r_valid,
  output reg           io_slaves_0_r_ready,
  input  wire [31:0]   io_slaves_0_r_payload_data,
  input  wire [1:0]    io_slaves_0_r_payload_resp,
  output reg           io_slaves_1_aw_valid,
  input  wire          io_slaves_1_aw_ready,
  output reg  [31:0]   io_slaves_1_aw_payload_addr,
  output reg  [2:0]    io_slaves_1_aw_payload_prot,
  output reg           io_slaves_1_w_valid,
  input  wire          io_slaves_1_w_ready,
  output reg  [31:0]   io_slaves_1_w_payload_data,
  output reg  [3:0]    io_slaves_1_w_payload_strb,
  input  wire          io_slaves_1_b_valid,
  output reg           io_slaves_1_b_ready,
  input  wire [1:0]    io_slaves_1_b_payload_resp,
  output reg           io_slaves_1_ar_valid,
  input  wire          io_slaves_1_ar_ready,
  output reg  [31:0]   io_slaves_1_ar_payload_addr,
  output reg  [2:0]    io_slaves_1_ar_payload_prot,
  input  wire          io_slaves_1_r_valid,
  output reg           io_slaves_1_r_ready,
  input  wire [31:0]   io_slaves_1_r_payload_data,
  input  wire [1:0]    io_slaves_1_r_payload_resp,
  output reg           io_slaves_2_aw_valid,
  input  wire          io_slaves_2_aw_ready,
  output reg  [31:0]   io_slaves_2_aw_payload_addr,
  output reg  [2:0]    io_slaves_2_aw_payload_prot,
  output reg           io_slaves_2_w_valid,
  input  wire          io_slaves_2_w_ready,
  output reg  [31:0]   io_slaves_2_w_payload_data,
  output reg  [3:0]    io_slaves_2_w_payload_strb,
  input  wire          io_slaves_2_b_valid,
  output reg           io_slaves_2_b_ready,
  input  wire [1:0]    io_slaves_2_b_payload_resp,
  output reg           io_slaves_2_ar_valid,
  input  wire          io_slaves_2_ar_ready,
  output reg  [31:0]   io_slaves_2_ar_payload_addr,
  output reg  [2:0]    io_slaves_2_ar_payload_prot,
  input  wire          io_slaves_2_r_valid,
  output reg           io_slaves_2_r_ready,
  input  wire [31:0]   io_slaves_2_r_payload_data,
  input  wire [1:0]    io_slaves_2_r_payload_resp,
  output reg           io_slaves_3_aw_valid,
  input  wire          io_slaves_3_aw_ready,
  output reg  [31:0]   io_slaves_3_aw_payload_addr,
  output reg  [2:0]    io_slaves_3_aw_payload_prot,
  output reg           io_slaves_3_w_valid,
  input  wire          io_slaves_3_w_ready,
  output reg  [31:0]   io_slaves_3_w_payload_data,
  output reg  [3:0]    io_slaves_3_w_payload_strb,
  input  wire          io_slaves_3_b_valid,
  output reg           io_slaves_3_b_ready,
  input  wire [1:0]    io_slaves_3_b_payload_resp,
  output reg           io_slaves_3_ar_valid,
  input  wire          io_slaves_3_ar_ready,
  output reg  [31:0]   io_slaves_3_ar_payload_addr,
  output reg  [2:0]    io_slaves_3_ar_payload_prot,
  input  wire          io_slaves_3_r_valid,
  output reg           io_slaves_3_r_ready,
  input  wire [31:0]   io_slaves_3_r_payload_data,
  input  wire [1:0]    io_slaves_3_r_payload_resp,
  input  wire          clk,
  input  wire          resetn
);

  reg                 decErr_io_axi_aw_valid;
  reg        [31:0]   decErr_io_axi_aw_payload_addr;
  reg        [2:0]    decErr_io_axi_aw_payload_prot;
  reg                 decErr_io_axi_w_valid;
  reg        [31:0]   decErr_io_axi_w_payload_data;
  reg        [3:0]    decErr_io_axi_w_payload_strb;
  reg                 decErr_io_axi_b_ready;
  reg                 decErr_io_axi_ar_valid;
  reg        [31:0]   decErr_io_axi_ar_payload_addr;
  reg        [2:0]    decErr_io_axi_ar_payload_prot;
  reg                 decErr_io_axi_r_ready;
  wire                decErr_io_axi_ar_ready;
  wire                decErr_io_axi_aw_ready;
  wire                decErr_io_axi_w_ready;
  wire                decErr_io_axi_r_valid;
  wire       [31:0]   decErr_io_axi_r_payload_data;
  wire       [1:0]    decErr_io_axi_r_payload_resp;
  wire                decErr_io_axi_b_valid;
  wire       [1:0]    decErr_io_axi_b_payload_resp;
  wire       [1:0]    _zz_io_masters_0_b_payload_resp;
  wire       [1:0]    _zz_io_masters_1_b_payload_resp;
  wire       [4:0]    _zz__zz_when_Axi4LiteCrossbar_l297;
  wire       [0:0]    _zz__zz_when_Axi4LiteCrossbar_l297_1;
  wire       [0:0]    _zz__zz_when_Axi4LiteCrossbar_l297_2;
  wire       [0:0]    _zz__zz_when_Axi4LiteCrossbar_l297_3;
  wire       [0:0]    _zz__zz_when_Axi4LiteCrossbar_l297_4;
  wire       [4:0]    _zz__zz_when_Axi4LiteCrossbar_l297_5;
  wire       [1:0]    _zz__zz_when_Axi4LiteCrossbar_l149_4;
  wire       [1:0]    _zz__zz_when_Axi4LiteCrossbar_l149_4_1;
  wire       [4:0]    _zz__zz_when_Axi4LiteCrossbar_l297_3_1;
  wire       [4:0]    _zz__zz_when_Axi4LiteCrossbar_l297_3_2;
  wire       [1:0]    _zz__zz_when_Axi4LiteCrossbar_l149_9;
  wire       [1:0]    _zz__zz_when_Axi4LiteCrossbar_l149_9_1;
  wire       [4:0]    _zz__zz_when_Axi4LiteCrossbar_l297_6;
  wire       [4:0]    _zz__zz_when_Axi4LiteCrossbar_l297_6_1;
  wire       [1:0]    _zz__zz_when_Axi4LiteCrossbar_l149_14;
  wire       [1:0]    _zz__zz_when_Axi4LiteCrossbar_l149_14_1;
  wire       [4:0]    _zz__zz_when_Axi4LiteCrossbar_l297_9;
  wire       [4:0]    _zz__zz_when_Axi4LiteCrossbar_l297_9_1;
  wire       [1:0]    _zz__zz_when_Axi4LiteCrossbar_l149_19;
  wire       [1:0]    _zz__zz_when_Axi4LiteCrossbar_l149_19_1;
  wire       [4:0]    _zz__zz_when_Axi4LiteCrossbar_l297_12;
  wire       [4:0]    _zz__zz_when_Axi4LiteCrossbar_l297_12_1;
  wire       [1:0]    _zz__zz_when_Axi4LiteCrossbar_l149_24;
  wire       [1:0]    _zz__zz_when_Axi4LiteCrossbar_l149_24_1;
  wire       [4:0]    _zz__zz_when_Axi4LiteCrossbar_l400;
  wire       [0:0]    _zz__zz_when_Axi4LiteCrossbar_l400_1;
  wire       [0:0]    _zz__zz_when_Axi4LiteCrossbar_l400_2;
  wire       [0:0]    _zz__zz_when_Axi4LiteCrossbar_l400_3;
  wire       [0:0]    _zz__zz_when_Axi4LiteCrossbar_l400_4;
  wire       [4:0]    _zz__zz_when_Axi4LiteCrossbar_l400_5;
  wire       [1:0]    _zz__zz_when_Axi4LiteCrossbar_l149_29;
  wire       [1:0]    _zz__zz_when_Axi4LiteCrossbar_l149_29_1;
  wire       [4:0]    _zz__zz_when_Axi4LiteCrossbar_l400_3_1;
  wire       [4:0]    _zz__zz_when_Axi4LiteCrossbar_l400_3_2;
  wire       [1:0]    _zz__zz_when_Axi4LiteCrossbar_l149_34;
  wire       [1:0]    _zz__zz_when_Axi4LiteCrossbar_l149_34_1;
  wire       [4:0]    _zz__zz_when_Axi4LiteCrossbar_l400_6;
  wire       [4:0]    _zz__zz_when_Axi4LiteCrossbar_l400_6_1;
  wire       [1:0]    _zz__zz_when_Axi4LiteCrossbar_l149_39;
  wire       [1:0]    _zz__zz_when_Axi4LiteCrossbar_l149_39_1;
  wire       [4:0]    _zz__zz_when_Axi4LiteCrossbar_l400_9;
  wire       [4:0]    _zz__zz_when_Axi4LiteCrossbar_l400_9_1;
  wire       [1:0]    _zz__zz_when_Axi4LiteCrossbar_l149_44;
  wire       [1:0]    _zz__zz_when_Axi4LiteCrossbar_l149_44_1;
  wire       [4:0]    _zz__zz_when_Axi4LiteCrossbar_l400_12;
  wire       [4:0]    _zz__zz_when_Axi4LiteCrossbar_l400_12_1;
  wire       [1:0]    _zz__zz_when_Axi4LiteCrossbar_l149_49;
  wire       [1:0]    _zz__zz_when_Axi4LiteCrossbar_l149_49_1;
  reg                 wrActive_0;
  reg                 wrActive_1;
  reg                 wrActive_2;
  reg                 wrActive_3;
  reg                 wrActive_4;
  reg        [0:0]    wrGranted_0;
  reg        [0:0]    wrGranted_1;
  reg        [0:0]    wrGranted_2;
  reg        [0:0]    wrGranted_3;
  reg        [0:0]    wrGranted_4;
  reg                 wrDataDone_0;
  reg                 wrDataDone_1;
  reg                 wrDataDone_2;
  reg                 wrDataDone_3;
  reg                 wrDataDone_4;
  reg        [0:0]    wrRrPtr_0;
  reg        [0:0]    wrRrPtr_1;
  reg        [0:0]    wrRrPtr_2;
  reg        [0:0]    wrRrPtr_3;
  reg        [0:0]    wrRrPtr_4;
  reg                 rdActive_0;
  reg                 rdActive_1;
  reg                 rdActive_2;
  reg                 rdActive_3;
  reg                 rdActive_4;
  reg        [0:0]    rdGranted_0;
  reg        [0:0]    rdGranted_1;
  reg        [0:0]    rdGranted_2;
  reg        [0:0]    rdGranted_3;
  reg        [0:0]    rdGranted_4;
  reg        [0:0]    rdRrPtr_0;
  reg        [0:0]    rdRrPtr_1;
  reg        [0:0]    rdRrPtr_2;
  reg        [0:0]    rdRrPtr_3;
  reg        [0:0]    rdRrPtr_4;
  wire       [33:0]   _zz_io_masters_0_r_payload_data;
  wire       [33:0]   _zz_io_masters_1_r_payload_data;
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
  wire       [34:0]   _zz_io_axi_aw_payload_addr;
  wire       [35:0]   _zz_io_axi_w_payload_data;
  wire       [34:0]   _zz_io_axi_ar_payload_addr;
  wire                when_Axi4LiteCrossbar_l284;
  reg        [1:0]    _zz_when_Axi4LiteCrossbar_l297;
  reg        [3:0]    _zz_when_Axi4LiteCrossbar_l297_1;
  reg        [3:0]    _zz_when_Axi4LiteCrossbar_l297_2;
  reg        [1:0]    _zz_when_Axi4LiteCrossbar_l149;
  wire                when_Axi4LiteCrossbar_l106;
  wire       [1:0]    _zz_when_Axi4LiteCrossbar_l149_1;
  wire       [1:0]    _zz_when_Axi4LiteCrossbar_l149_2;
  wire       [1:0]    _zz_when_Axi4LiteCrossbar_l149_3;
  wire       [1:0]    _zz_when_Axi4LiteCrossbar_l149_4;
  reg        [0:0]    _zz_wrGranted_0;
  wire                when_Axi4LiteCrossbar_l149;
  wire                when_Axi4LiteCrossbar_l149_1;
  reg                 grantLock;
  reg        [0:0]    grantLockIdx;
  wire       [0:0]    _zz_wrGranted_0_1;
  wire                when_Axi4LiteCrossbar_l184;
  wire                when_Axi4LiteCrossbar_l297;
  wire                when_Axi4LiteCrossbar_l301;
  wire                when_Axi4LiteCrossbar_l308;
  wire                when_Axi4LiteCrossbar_l301_1;
  wire                when_Axi4LiteCrossbar_l308_1;
  wire                io_slaves_0_aw_fire;
  wire                when_Axi4LiteCrossbar_l357;
  wire                when_Axi4LiteCrossbar_l358;
  wire                when_Axi4LiteCrossbar_l357_1;
  wire                when_Axi4LiteCrossbar_l358_1;
  wire                io_slaves_0_b_fire;
  wire                io_slaves_0_w_fire;
  wire                when_Axi4LiteCrossbar_l284_1;
  reg        [1:0]    _zz_when_Axi4LiteCrossbar_l297_3;
  reg        [3:0]    _zz_when_Axi4LiteCrossbar_l297_4;
  reg        [3:0]    _zz_when_Axi4LiteCrossbar_l297_5;
  reg        [1:0]    _zz_when_Axi4LiteCrossbar_l149_5;
  wire                when_Axi4LiteCrossbar_l106_1;
  wire       [1:0]    _zz_when_Axi4LiteCrossbar_l149_6;
  wire       [1:0]    _zz_when_Axi4LiteCrossbar_l149_7;
  wire       [1:0]    _zz_when_Axi4LiteCrossbar_l149_8;
  wire       [1:0]    _zz_when_Axi4LiteCrossbar_l149_9;
  reg        [0:0]    _zz_wrGranted_1;
  wire                when_Axi4LiteCrossbar_l149_2;
  wire                when_Axi4LiteCrossbar_l149_3;
  reg                 grantLock_1;
  reg        [0:0]    grantLockIdx_1;
  wire       [0:0]    _zz_wrGranted_1_1;
  wire                when_Axi4LiteCrossbar_l184_1;
  wire                when_Axi4LiteCrossbar_l297_1;
  wire                when_Axi4LiteCrossbar_l301_2;
  wire                when_Axi4LiteCrossbar_l308_2;
  wire                when_Axi4LiteCrossbar_l301_3;
  wire                when_Axi4LiteCrossbar_l308_3;
  wire                io_slaves_1_aw_fire;
  wire                when_Axi4LiteCrossbar_l357_2;
  wire                when_Axi4LiteCrossbar_l358_2;
  wire                when_Axi4LiteCrossbar_l357_3;
  wire                when_Axi4LiteCrossbar_l358_3;
  wire                io_slaves_1_b_fire;
  wire                io_slaves_1_w_fire;
  wire                when_Axi4LiteCrossbar_l284_2;
  reg        [1:0]    _zz_when_Axi4LiteCrossbar_l297_6;
  reg        [3:0]    _zz_when_Axi4LiteCrossbar_l297_7;
  reg        [3:0]    _zz_when_Axi4LiteCrossbar_l297_8;
  reg        [1:0]    _zz_when_Axi4LiteCrossbar_l149_10;
  wire                when_Axi4LiteCrossbar_l106_2;
  wire       [1:0]    _zz_when_Axi4LiteCrossbar_l149_11;
  wire       [1:0]    _zz_when_Axi4LiteCrossbar_l149_12;
  wire       [1:0]    _zz_when_Axi4LiteCrossbar_l149_13;
  wire       [1:0]    _zz_when_Axi4LiteCrossbar_l149_14;
  reg        [0:0]    _zz_wrGranted_2;
  wire                when_Axi4LiteCrossbar_l149_4;
  wire                when_Axi4LiteCrossbar_l149_5;
  reg                 grantLock_2;
  reg        [0:0]    grantLockIdx_2;
  wire       [0:0]    _zz_wrGranted_2_1;
  wire                when_Axi4LiteCrossbar_l184_2;
  wire                when_Axi4LiteCrossbar_l297_2;
  wire                when_Axi4LiteCrossbar_l301_4;
  wire                when_Axi4LiteCrossbar_l308_4;
  wire                when_Axi4LiteCrossbar_l301_5;
  wire                when_Axi4LiteCrossbar_l308_5;
  wire                io_slaves_2_aw_fire;
  wire                when_Axi4LiteCrossbar_l357_4;
  wire                when_Axi4LiteCrossbar_l358_4;
  wire                when_Axi4LiteCrossbar_l357_5;
  wire                when_Axi4LiteCrossbar_l358_5;
  wire                io_slaves_2_b_fire;
  wire                io_slaves_2_w_fire;
  wire                when_Axi4LiteCrossbar_l284_3;
  reg        [1:0]    _zz_when_Axi4LiteCrossbar_l297_9;
  reg        [3:0]    _zz_when_Axi4LiteCrossbar_l297_10;
  reg        [3:0]    _zz_when_Axi4LiteCrossbar_l297_11;
  reg        [1:0]    _zz_when_Axi4LiteCrossbar_l149_15;
  wire                when_Axi4LiteCrossbar_l106_3;
  wire       [1:0]    _zz_when_Axi4LiteCrossbar_l149_16;
  wire       [1:0]    _zz_when_Axi4LiteCrossbar_l149_17;
  wire       [1:0]    _zz_when_Axi4LiteCrossbar_l149_18;
  wire       [1:0]    _zz_when_Axi4LiteCrossbar_l149_19;
  reg        [0:0]    _zz_wrGranted_3;
  wire                when_Axi4LiteCrossbar_l149_6;
  wire                when_Axi4LiteCrossbar_l149_7;
  reg                 grantLock_3;
  reg        [0:0]    grantLockIdx_3;
  wire       [0:0]    _zz_wrGranted_3_1;
  wire                when_Axi4LiteCrossbar_l184_3;
  wire                when_Axi4LiteCrossbar_l297_3;
  wire                when_Axi4LiteCrossbar_l301_6;
  wire                when_Axi4LiteCrossbar_l308_6;
  wire                when_Axi4LiteCrossbar_l301_7;
  wire                when_Axi4LiteCrossbar_l308_7;
  wire                io_slaves_3_aw_fire;
  wire                when_Axi4LiteCrossbar_l357_6;
  wire                when_Axi4LiteCrossbar_l358_6;
  wire                when_Axi4LiteCrossbar_l357_7;
  wire                when_Axi4LiteCrossbar_l358_7;
  wire                io_slaves_3_b_fire;
  wire                io_slaves_3_w_fire;
  wire                when_Axi4LiteCrossbar_l284_4;
  reg        [1:0]    _zz_when_Axi4LiteCrossbar_l297_12;
  reg        [3:0]    _zz_when_Axi4LiteCrossbar_l297_13;
  reg        [3:0]    _zz_when_Axi4LiteCrossbar_l297_14;
  reg        [1:0]    _zz_when_Axi4LiteCrossbar_l149_20;
  wire                when_Axi4LiteCrossbar_l106_4;
  wire       [1:0]    _zz_when_Axi4LiteCrossbar_l149_21;
  wire       [1:0]    _zz_when_Axi4LiteCrossbar_l149_22;
  wire       [1:0]    _zz_when_Axi4LiteCrossbar_l149_23;
  wire       [1:0]    _zz_when_Axi4LiteCrossbar_l149_24;
  reg        [0:0]    _zz_wrGranted_4;
  wire                when_Axi4LiteCrossbar_l149_8;
  wire                when_Axi4LiteCrossbar_l149_9;
  reg                 grantLock_4;
  reg        [0:0]    grantLockIdx_4;
  wire       [0:0]    _zz_wrGranted_4_1;
  wire                when_Axi4LiteCrossbar_l184_4;
  wire                when_Axi4LiteCrossbar_l297_4;
  wire                when_Axi4LiteCrossbar_l301_8;
  wire                when_Axi4LiteCrossbar_l308_8;
  wire                when_Axi4LiteCrossbar_l301_9;
  wire                when_Axi4LiteCrossbar_l308_9;
  wire                decErr_io_axi_aw_fire;
  wire                when_Axi4LiteCrossbar_l357_8;
  wire                when_Axi4LiteCrossbar_l358_8;
  wire                when_Axi4LiteCrossbar_l357_9;
  wire                when_Axi4LiteCrossbar_l358_9;
  wire                decErr_io_axi_b_fire;
  wire                decErr_io_axi_w_fire;
  wire                when_Axi4LiteCrossbar_l388;
  reg        [1:0]    _zz_when_Axi4LiteCrossbar_l400;
  reg        [3:0]    _zz_when_Axi4LiteCrossbar_l400_1;
  reg        [3:0]    _zz_when_Axi4LiteCrossbar_l400_2;
  reg        [1:0]    _zz_when_Axi4LiteCrossbar_l149_25;
  wire                when_Axi4LiteCrossbar_l106_5;
  wire       [1:0]    _zz_when_Axi4LiteCrossbar_l149_26;
  wire       [1:0]    _zz_when_Axi4LiteCrossbar_l149_27;
  wire       [1:0]    _zz_when_Axi4LiteCrossbar_l149_28;
  wire       [1:0]    _zz_when_Axi4LiteCrossbar_l149_29;
  reg        [0:0]    _zz_rdGranted_0;
  wire                when_Axi4LiteCrossbar_l149_10;
  wire                when_Axi4LiteCrossbar_l149_11;
  reg                 grantLock_5;
  reg        [0:0]    grantLockIdx_5;
  wire       [0:0]    _zz_rdGranted_0_1;
  wire                when_Axi4LiteCrossbar_l184_5;
  wire                when_Axi4LiteCrossbar_l400;
  wire                when_Axi4LiteCrossbar_l403;
  wire                when_Axi4LiteCrossbar_l403_1;
  wire                io_slaves_0_ar_fire;
  wire                when_Axi4LiteCrossbar_l446;
  wire                when_Axi4LiteCrossbar_l446_1;
  wire                io_slaves_0_r_fire;
  wire                when_Axi4LiteCrossbar_l388_1;
  reg        [1:0]    _zz_when_Axi4LiteCrossbar_l400_3;
  reg        [3:0]    _zz_when_Axi4LiteCrossbar_l400_4;
  reg        [3:0]    _zz_when_Axi4LiteCrossbar_l400_5;
  reg        [1:0]    _zz_when_Axi4LiteCrossbar_l149_30;
  wire                when_Axi4LiteCrossbar_l106_6;
  wire       [1:0]    _zz_when_Axi4LiteCrossbar_l149_31;
  wire       [1:0]    _zz_when_Axi4LiteCrossbar_l149_32;
  wire       [1:0]    _zz_when_Axi4LiteCrossbar_l149_33;
  wire       [1:0]    _zz_when_Axi4LiteCrossbar_l149_34;
  reg        [0:0]    _zz_rdGranted_1;
  wire                when_Axi4LiteCrossbar_l149_12;
  wire                when_Axi4LiteCrossbar_l149_13;
  reg                 grantLock_6;
  reg        [0:0]    grantLockIdx_6;
  wire       [0:0]    _zz_rdGranted_1_1;
  wire                when_Axi4LiteCrossbar_l184_6;
  wire                when_Axi4LiteCrossbar_l400_1;
  wire                when_Axi4LiteCrossbar_l403_2;
  wire                when_Axi4LiteCrossbar_l403_3;
  wire                io_slaves_1_ar_fire;
  wire                when_Axi4LiteCrossbar_l446_2;
  wire                when_Axi4LiteCrossbar_l446_3;
  wire                io_slaves_1_r_fire;
  wire                when_Axi4LiteCrossbar_l388_2;
  reg        [1:0]    _zz_when_Axi4LiteCrossbar_l400_6;
  reg        [3:0]    _zz_when_Axi4LiteCrossbar_l400_7;
  reg        [3:0]    _zz_when_Axi4LiteCrossbar_l400_8;
  reg        [1:0]    _zz_when_Axi4LiteCrossbar_l149_35;
  wire                when_Axi4LiteCrossbar_l106_7;
  wire       [1:0]    _zz_when_Axi4LiteCrossbar_l149_36;
  wire       [1:0]    _zz_when_Axi4LiteCrossbar_l149_37;
  wire       [1:0]    _zz_when_Axi4LiteCrossbar_l149_38;
  wire       [1:0]    _zz_when_Axi4LiteCrossbar_l149_39;
  reg        [0:0]    _zz_rdGranted_2;
  wire                when_Axi4LiteCrossbar_l149_14;
  wire                when_Axi4LiteCrossbar_l149_15;
  reg                 grantLock_7;
  reg        [0:0]    grantLockIdx_7;
  wire       [0:0]    _zz_rdGranted_2_1;
  wire                when_Axi4LiteCrossbar_l184_7;
  wire                when_Axi4LiteCrossbar_l400_2;
  wire                when_Axi4LiteCrossbar_l403_4;
  wire                when_Axi4LiteCrossbar_l403_5;
  wire                io_slaves_2_ar_fire;
  wire                when_Axi4LiteCrossbar_l446_4;
  wire                when_Axi4LiteCrossbar_l446_5;
  wire                io_slaves_2_r_fire;
  wire                when_Axi4LiteCrossbar_l388_3;
  reg        [1:0]    _zz_when_Axi4LiteCrossbar_l400_9;
  reg        [3:0]    _zz_when_Axi4LiteCrossbar_l400_10;
  reg        [3:0]    _zz_when_Axi4LiteCrossbar_l400_11;
  reg        [1:0]    _zz_when_Axi4LiteCrossbar_l149_40;
  wire                when_Axi4LiteCrossbar_l106_8;
  wire       [1:0]    _zz_when_Axi4LiteCrossbar_l149_41;
  wire       [1:0]    _zz_when_Axi4LiteCrossbar_l149_42;
  wire       [1:0]    _zz_when_Axi4LiteCrossbar_l149_43;
  wire       [1:0]    _zz_when_Axi4LiteCrossbar_l149_44;
  reg        [0:0]    _zz_rdGranted_3;
  wire                when_Axi4LiteCrossbar_l149_16;
  wire                when_Axi4LiteCrossbar_l149_17;
  reg                 grantLock_8;
  reg        [0:0]    grantLockIdx_8;
  wire       [0:0]    _zz_rdGranted_3_1;
  wire                when_Axi4LiteCrossbar_l184_8;
  wire                when_Axi4LiteCrossbar_l400_3;
  wire                when_Axi4LiteCrossbar_l403_6;
  wire                when_Axi4LiteCrossbar_l403_7;
  wire                io_slaves_3_ar_fire;
  wire                when_Axi4LiteCrossbar_l446_6;
  wire                when_Axi4LiteCrossbar_l446_7;
  wire                io_slaves_3_r_fire;
  wire                when_Axi4LiteCrossbar_l388_4;
  reg        [1:0]    _zz_when_Axi4LiteCrossbar_l400_12;
  reg        [3:0]    _zz_when_Axi4LiteCrossbar_l400_13;
  reg        [3:0]    _zz_when_Axi4LiteCrossbar_l400_14;
  reg        [1:0]    _zz_when_Axi4LiteCrossbar_l149_45;
  wire                when_Axi4LiteCrossbar_l106_9;
  wire       [1:0]    _zz_when_Axi4LiteCrossbar_l149_46;
  wire       [1:0]    _zz_when_Axi4LiteCrossbar_l149_47;
  wire       [1:0]    _zz_when_Axi4LiteCrossbar_l149_48;
  wire       [1:0]    _zz_when_Axi4LiteCrossbar_l149_49;
  reg        [0:0]    _zz_rdGranted_4;
  wire                when_Axi4LiteCrossbar_l149_18;
  wire                when_Axi4LiteCrossbar_l149_19;
  reg                 grantLock_9;
  reg        [0:0]    grantLockIdx_9;
  wire       [0:0]    _zz_rdGranted_4_1;
  wire                when_Axi4LiteCrossbar_l184_9;
  wire                when_Axi4LiteCrossbar_l400_4;
  wire                when_Axi4LiteCrossbar_l403_8;
  wire                when_Axi4LiteCrossbar_l403_9;
  wire                decErr_io_axi_ar_fire;
  wire                when_Axi4LiteCrossbar_l446_8;
  wire                when_Axi4LiteCrossbar_l446_9;
  wire                decErr_io_axi_r_fire;

  assign _zz_io_masters_0_b_payload_resp = 2'b00;
  assign _zz_io_masters_1_b_payload_resp = 2'b00;
  assign _zz__zz_when_Axi4LiteCrossbar_l297 = {(! (|_zz_when_Axi4LiteCrossbar_l297_1)),_zz_when_Axi4LiteCrossbar_l297_1};
  assign _zz__zz_when_Axi4LiteCrossbar_l297_5 = {(! (|_zz_when_Axi4LiteCrossbar_l297_2)),_zz_when_Axi4LiteCrossbar_l297_2};
  assign _zz__zz_when_Axi4LiteCrossbar_l149_4 = (_zz_when_Axi4LiteCrossbar_l149_2 - 2'b01);
  assign _zz__zz_when_Axi4LiteCrossbar_l149_4_1 = (_zz_when_Axi4LiteCrossbar_l149_3 - 2'b01);
  assign _zz__zz_when_Axi4LiteCrossbar_l297_3_1 = {(! (|_zz_when_Axi4LiteCrossbar_l297_4)),_zz_when_Axi4LiteCrossbar_l297_4};
  assign _zz__zz_when_Axi4LiteCrossbar_l297_3_2 = {(! (|_zz_when_Axi4LiteCrossbar_l297_5)),_zz_when_Axi4LiteCrossbar_l297_5};
  assign _zz__zz_when_Axi4LiteCrossbar_l149_9 = (_zz_when_Axi4LiteCrossbar_l149_7 - 2'b01);
  assign _zz__zz_when_Axi4LiteCrossbar_l149_9_1 = (_zz_when_Axi4LiteCrossbar_l149_8 - 2'b01);
  assign _zz__zz_when_Axi4LiteCrossbar_l297_6 = {(! (|_zz_when_Axi4LiteCrossbar_l297_7)),_zz_when_Axi4LiteCrossbar_l297_7};
  assign _zz__zz_when_Axi4LiteCrossbar_l297_6_1 = {(! (|_zz_when_Axi4LiteCrossbar_l297_8)),_zz_when_Axi4LiteCrossbar_l297_8};
  assign _zz__zz_when_Axi4LiteCrossbar_l149_14 = (_zz_when_Axi4LiteCrossbar_l149_12 - 2'b01);
  assign _zz__zz_when_Axi4LiteCrossbar_l149_14_1 = (_zz_when_Axi4LiteCrossbar_l149_13 - 2'b01);
  assign _zz__zz_when_Axi4LiteCrossbar_l297_9 = {(! (|_zz_when_Axi4LiteCrossbar_l297_10)),_zz_when_Axi4LiteCrossbar_l297_10};
  assign _zz__zz_when_Axi4LiteCrossbar_l297_9_1 = {(! (|_zz_when_Axi4LiteCrossbar_l297_11)),_zz_when_Axi4LiteCrossbar_l297_11};
  assign _zz__zz_when_Axi4LiteCrossbar_l149_19 = (_zz_when_Axi4LiteCrossbar_l149_17 - 2'b01);
  assign _zz__zz_when_Axi4LiteCrossbar_l149_19_1 = (_zz_when_Axi4LiteCrossbar_l149_18 - 2'b01);
  assign _zz__zz_when_Axi4LiteCrossbar_l297_12 = {(! (|_zz_when_Axi4LiteCrossbar_l297_13)),_zz_when_Axi4LiteCrossbar_l297_13};
  assign _zz__zz_when_Axi4LiteCrossbar_l297_12_1 = {(! (|_zz_when_Axi4LiteCrossbar_l297_14)),_zz_when_Axi4LiteCrossbar_l297_14};
  assign _zz__zz_when_Axi4LiteCrossbar_l149_24 = (_zz_when_Axi4LiteCrossbar_l149_22 - 2'b01);
  assign _zz__zz_when_Axi4LiteCrossbar_l149_24_1 = (_zz_when_Axi4LiteCrossbar_l149_23 - 2'b01);
  assign _zz__zz_when_Axi4LiteCrossbar_l400 = {(! (|_zz_when_Axi4LiteCrossbar_l400_1)),_zz_when_Axi4LiteCrossbar_l400_1};
  assign _zz__zz_when_Axi4LiteCrossbar_l400_5 = {(! (|_zz_when_Axi4LiteCrossbar_l400_2)),_zz_when_Axi4LiteCrossbar_l400_2};
  assign _zz__zz_when_Axi4LiteCrossbar_l149_29 = (_zz_when_Axi4LiteCrossbar_l149_27 - 2'b01);
  assign _zz__zz_when_Axi4LiteCrossbar_l149_29_1 = (_zz_when_Axi4LiteCrossbar_l149_28 - 2'b01);
  assign _zz__zz_when_Axi4LiteCrossbar_l400_3_1 = {(! (|_zz_when_Axi4LiteCrossbar_l400_4)),_zz_when_Axi4LiteCrossbar_l400_4};
  assign _zz__zz_when_Axi4LiteCrossbar_l400_3_2 = {(! (|_zz_when_Axi4LiteCrossbar_l400_5)),_zz_when_Axi4LiteCrossbar_l400_5};
  assign _zz__zz_when_Axi4LiteCrossbar_l149_34 = (_zz_when_Axi4LiteCrossbar_l149_32 - 2'b01);
  assign _zz__zz_when_Axi4LiteCrossbar_l149_34_1 = (_zz_when_Axi4LiteCrossbar_l149_33 - 2'b01);
  assign _zz__zz_when_Axi4LiteCrossbar_l400_6 = {(! (|_zz_when_Axi4LiteCrossbar_l400_7)),_zz_when_Axi4LiteCrossbar_l400_7};
  assign _zz__zz_when_Axi4LiteCrossbar_l400_6_1 = {(! (|_zz_when_Axi4LiteCrossbar_l400_8)),_zz_when_Axi4LiteCrossbar_l400_8};
  assign _zz__zz_when_Axi4LiteCrossbar_l149_39 = (_zz_when_Axi4LiteCrossbar_l149_37 - 2'b01);
  assign _zz__zz_when_Axi4LiteCrossbar_l149_39_1 = (_zz_when_Axi4LiteCrossbar_l149_38 - 2'b01);
  assign _zz__zz_when_Axi4LiteCrossbar_l400_9 = {(! (|_zz_when_Axi4LiteCrossbar_l400_10)),_zz_when_Axi4LiteCrossbar_l400_10};
  assign _zz__zz_when_Axi4LiteCrossbar_l400_9_1 = {(! (|_zz_when_Axi4LiteCrossbar_l400_11)),_zz_when_Axi4LiteCrossbar_l400_11};
  assign _zz__zz_when_Axi4LiteCrossbar_l149_44 = (_zz_when_Axi4LiteCrossbar_l149_42 - 2'b01);
  assign _zz__zz_when_Axi4LiteCrossbar_l149_44_1 = (_zz_when_Axi4LiteCrossbar_l149_43 - 2'b01);
  assign _zz__zz_when_Axi4LiteCrossbar_l400_12 = {(! (|_zz_when_Axi4LiteCrossbar_l400_13)),_zz_when_Axi4LiteCrossbar_l400_13};
  assign _zz__zz_when_Axi4LiteCrossbar_l400_12_1 = {(! (|_zz_when_Axi4LiteCrossbar_l400_14)),_zz_when_Axi4LiteCrossbar_l400_14};
  assign _zz__zz_when_Axi4LiteCrossbar_l149_49 = (_zz_when_Axi4LiteCrossbar_l149_47 - 2'b01);
  assign _zz__zz_when_Axi4LiteCrossbar_l149_49_1 = (_zz_when_Axi4LiteCrossbar_l149_48 - 2'b01);
  assign _zz__zz_when_Axi4LiteCrossbar_l297_1 = 1'b0;
  assign _zz__zz_when_Axi4LiteCrossbar_l297_2 = 1'b0;
  assign _zz__zz_when_Axi4LiteCrossbar_l297_3 = 1'b0;
  assign _zz__zz_when_Axi4LiteCrossbar_l297_4 = 1'b0;
  assign _zz__zz_when_Axi4LiteCrossbar_l400_1 = 1'b0;
  assign _zz__zz_when_Axi4LiteCrossbar_l400_2 = 1'b0;
  assign _zz__zz_when_Axi4LiteCrossbar_l400_3 = 1'b0;
  assign _zz__zz_when_Axi4LiteCrossbar_l400_4 = 1'b0;
  Axi4DecErrSlave decErr (
    .io_axi_aw_valid        (decErr_io_axi_aw_valid             ), //i
    .io_axi_aw_ready        (decErr_io_axi_aw_ready             ), //o
    .io_axi_aw_payload_addr (decErr_io_axi_aw_payload_addr[31:0]), //i
    .io_axi_aw_payload_prot (decErr_io_axi_aw_payload_prot[2:0] ), //i
    .io_axi_w_valid         (decErr_io_axi_w_valid              ), //i
    .io_axi_w_ready         (decErr_io_axi_w_ready              ), //o
    .io_axi_w_payload_data  (decErr_io_axi_w_payload_data[31:0] ), //i
    .io_axi_w_payload_strb  (decErr_io_axi_w_payload_strb[3:0]  ), //i
    .io_axi_b_valid         (decErr_io_axi_b_valid              ), //o
    .io_axi_b_ready         (decErr_io_axi_b_ready              ), //i
    .io_axi_b_payload_resp  (decErr_io_axi_b_payload_resp[1:0]  ), //o
    .io_axi_ar_valid        (decErr_io_axi_ar_valid             ), //i
    .io_axi_ar_ready        (decErr_io_axi_ar_ready             ), //o
    .io_axi_ar_payload_addr (decErr_io_axi_ar_payload_addr[31:0]), //i
    .io_axi_ar_payload_prot (decErr_io_axi_ar_payload_prot[2:0] ), //i
    .io_axi_r_valid         (decErr_io_axi_r_valid              ), //o
    .io_axi_r_ready         (decErr_io_axi_r_ready              ), //i
    .io_axi_r_payload_data  (decErr_io_axi_r_payload_data[31:0] ), //o
    .io_axi_r_payload_resp  (decErr_io_axi_r_payload_resp[1:0]  ), //o
    .clk                    (clk                                ), //i
    .resetn                 (resetn                             )  //i
  );
  always @(*) begin
    io_masters_0_aw_ready = 1'b0;
    if(when_Axi4LiteCrossbar_l284) begin
      if(when_Axi4LiteCrossbar_l297) begin
        if(when_Axi4LiteCrossbar_l301) begin
          io_masters_0_aw_ready = io_slaves_0_aw_ready;
        end
      end
    end
    if(when_Axi4LiteCrossbar_l284_1) begin
      if(when_Axi4LiteCrossbar_l297_1) begin
        if(when_Axi4LiteCrossbar_l301_2) begin
          io_masters_0_aw_ready = io_slaves_1_aw_ready;
        end
      end
    end
    if(when_Axi4LiteCrossbar_l284_2) begin
      if(when_Axi4LiteCrossbar_l297_2) begin
        if(when_Axi4LiteCrossbar_l301_4) begin
          io_masters_0_aw_ready = io_slaves_2_aw_ready;
        end
      end
    end
    if(when_Axi4LiteCrossbar_l284_3) begin
      if(when_Axi4LiteCrossbar_l297_3) begin
        if(when_Axi4LiteCrossbar_l301_6) begin
          io_masters_0_aw_ready = io_slaves_3_aw_ready;
        end
      end
    end
    if(when_Axi4LiteCrossbar_l284_4) begin
      if(when_Axi4LiteCrossbar_l297_4) begin
        if(when_Axi4LiteCrossbar_l301_8) begin
          io_masters_0_aw_ready = decErr_io_axi_aw_ready;
        end
      end
    end
  end

  always @(*) begin
    io_masters_0_w_ready = 1'b0;
    if(when_Axi4LiteCrossbar_l284) begin
      if(when_Axi4LiteCrossbar_l297) begin
        if(when_Axi4LiteCrossbar_l301) begin
          if(when_Axi4LiteCrossbar_l308) begin
            io_masters_0_w_ready = io_slaves_0_w_ready;
          end
        end
      end
    end else begin
      if(when_Axi4LiteCrossbar_l357) begin
        if(when_Axi4LiteCrossbar_l358) begin
          io_masters_0_w_ready = io_slaves_0_w_ready;
        end
      end
    end
    if(when_Axi4LiteCrossbar_l284_1) begin
      if(when_Axi4LiteCrossbar_l297_1) begin
        if(when_Axi4LiteCrossbar_l301_2) begin
          if(when_Axi4LiteCrossbar_l308_2) begin
            io_masters_0_w_ready = io_slaves_1_w_ready;
          end
        end
      end
    end else begin
      if(when_Axi4LiteCrossbar_l357_2) begin
        if(when_Axi4LiteCrossbar_l358_2) begin
          io_masters_0_w_ready = io_slaves_1_w_ready;
        end
      end
    end
    if(when_Axi4LiteCrossbar_l284_2) begin
      if(when_Axi4LiteCrossbar_l297_2) begin
        if(when_Axi4LiteCrossbar_l301_4) begin
          if(when_Axi4LiteCrossbar_l308_4) begin
            io_masters_0_w_ready = io_slaves_2_w_ready;
          end
        end
      end
    end else begin
      if(when_Axi4LiteCrossbar_l357_4) begin
        if(when_Axi4LiteCrossbar_l358_4) begin
          io_masters_0_w_ready = io_slaves_2_w_ready;
        end
      end
    end
    if(when_Axi4LiteCrossbar_l284_3) begin
      if(when_Axi4LiteCrossbar_l297_3) begin
        if(when_Axi4LiteCrossbar_l301_6) begin
          if(when_Axi4LiteCrossbar_l308_6) begin
            io_masters_0_w_ready = io_slaves_3_w_ready;
          end
        end
      end
    end else begin
      if(when_Axi4LiteCrossbar_l357_6) begin
        if(when_Axi4LiteCrossbar_l358_6) begin
          io_masters_0_w_ready = io_slaves_3_w_ready;
        end
      end
    end
    if(when_Axi4LiteCrossbar_l284_4) begin
      if(when_Axi4LiteCrossbar_l297_4) begin
        if(when_Axi4LiteCrossbar_l301_8) begin
          if(when_Axi4LiteCrossbar_l308_8) begin
            io_masters_0_w_ready = decErr_io_axi_w_ready;
          end
        end
      end
    end else begin
      if(when_Axi4LiteCrossbar_l357_8) begin
        if(when_Axi4LiteCrossbar_l358_8) begin
          io_masters_0_w_ready = decErr_io_axi_w_ready;
        end
      end
    end
  end

  always @(*) begin
    io_masters_0_b_valid = 1'b0;
    if(!when_Axi4LiteCrossbar_l284) begin
      if(when_Axi4LiteCrossbar_l357) begin
        io_masters_0_b_valid = io_slaves_0_b_valid;
      end
    end
    if(!when_Axi4LiteCrossbar_l284_1) begin
      if(when_Axi4LiteCrossbar_l357_2) begin
        io_masters_0_b_valid = io_slaves_1_b_valid;
      end
    end
    if(!when_Axi4LiteCrossbar_l284_2) begin
      if(when_Axi4LiteCrossbar_l357_4) begin
        io_masters_0_b_valid = io_slaves_2_b_valid;
      end
    end
    if(!when_Axi4LiteCrossbar_l284_3) begin
      if(when_Axi4LiteCrossbar_l357_6) begin
        io_masters_0_b_valid = io_slaves_3_b_valid;
      end
    end
    if(!when_Axi4LiteCrossbar_l284_4) begin
      if(when_Axi4LiteCrossbar_l357_8) begin
        io_masters_0_b_valid = decErr_io_axi_b_valid;
      end
    end
  end

  always @(*) begin
    io_masters_0_b_payload_resp = _zz_io_masters_0_b_payload_resp[1 : 0];
    if(!when_Axi4LiteCrossbar_l284) begin
      if(when_Axi4LiteCrossbar_l357) begin
        io_masters_0_b_payload_resp = io_slaves_0_b_payload_resp;
      end
    end
    if(!when_Axi4LiteCrossbar_l284_1) begin
      if(when_Axi4LiteCrossbar_l357_2) begin
        io_masters_0_b_payload_resp = io_slaves_1_b_payload_resp;
      end
    end
    if(!when_Axi4LiteCrossbar_l284_2) begin
      if(when_Axi4LiteCrossbar_l357_4) begin
        io_masters_0_b_payload_resp = io_slaves_2_b_payload_resp;
      end
    end
    if(!when_Axi4LiteCrossbar_l284_3) begin
      if(when_Axi4LiteCrossbar_l357_6) begin
        io_masters_0_b_payload_resp = io_slaves_3_b_payload_resp;
      end
    end
    if(!when_Axi4LiteCrossbar_l284_4) begin
      if(when_Axi4LiteCrossbar_l357_8) begin
        io_masters_0_b_payload_resp = decErr_io_axi_b_payload_resp;
      end
    end
  end

  always @(*) begin
    io_masters_0_ar_ready = 1'b0;
    if(when_Axi4LiteCrossbar_l388) begin
      if(when_Axi4LiteCrossbar_l400) begin
        if(when_Axi4LiteCrossbar_l403) begin
          io_masters_0_ar_ready = io_slaves_0_ar_ready;
        end
      end
    end
    if(when_Axi4LiteCrossbar_l388_1) begin
      if(when_Axi4LiteCrossbar_l400_1) begin
        if(when_Axi4LiteCrossbar_l403_2) begin
          io_masters_0_ar_ready = io_slaves_1_ar_ready;
        end
      end
    end
    if(when_Axi4LiteCrossbar_l388_2) begin
      if(when_Axi4LiteCrossbar_l400_2) begin
        if(when_Axi4LiteCrossbar_l403_4) begin
          io_masters_0_ar_ready = io_slaves_2_ar_ready;
        end
      end
    end
    if(when_Axi4LiteCrossbar_l388_3) begin
      if(when_Axi4LiteCrossbar_l400_3) begin
        if(when_Axi4LiteCrossbar_l403_6) begin
          io_masters_0_ar_ready = io_slaves_3_ar_ready;
        end
      end
    end
    if(when_Axi4LiteCrossbar_l388_4) begin
      if(when_Axi4LiteCrossbar_l400_4) begin
        if(when_Axi4LiteCrossbar_l403_8) begin
          io_masters_0_ar_ready = decErr_io_axi_ar_ready;
        end
      end
    end
  end

  always @(*) begin
    io_masters_0_r_valid = 1'b0;
    if(!when_Axi4LiteCrossbar_l388) begin
      if(when_Axi4LiteCrossbar_l446) begin
        io_masters_0_r_valid = io_slaves_0_r_valid;
      end
    end
    if(!when_Axi4LiteCrossbar_l388_1) begin
      if(when_Axi4LiteCrossbar_l446_2) begin
        io_masters_0_r_valid = io_slaves_1_r_valid;
      end
    end
    if(!when_Axi4LiteCrossbar_l388_2) begin
      if(when_Axi4LiteCrossbar_l446_4) begin
        io_masters_0_r_valid = io_slaves_2_r_valid;
      end
    end
    if(!when_Axi4LiteCrossbar_l388_3) begin
      if(when_Axi4LiteCrossbar_l446_6) begin
        io_masters_0_r_valid = io_slaves_3_r_valid;
      end
    end
    if(!when_Axi4LiteCrossbar_l388_4) begin
      if(when_Axi4LiteCrossbar_l446_8) begin
        io_masters_0_r_valid = decErr_io_axi_r_valid;
      end
    end
  end

  assign _zz_io_masters_0_r_payload_data = 34'h0;
  always @(*) begin
    io_masters_0_r_payload_data = _zz_io_masters_0_r_payload_data[31 : 0];
    if(!when_Axi4LiteCrossbar_l388) begin
      if(when_Axi4LiteCrossbar_l446) begin
        io_masters_0_r_payload_data = io_slaves_0_r_payload_data;
      end
    end
    if(!when_Axi4LiteCrossbar_l388_1) begin
      if(when_Axi4LiteCrossbar_l446_2) begin
        io_masters_0_r_payload_data = io_slaves_1_r_payload_data;
      end
    end
    if(!when_Axi4LiteCrossbar_l388_2) begin
      if(when_Axi4LiteCrossbar_l446_4) begin
        io_masters_0_r_payload_data = io_slaves_2_r_payload_data;
      end
    end
    if(!when_Axi4LiteCrossbar_l388_3) begin
      if(when_Axi4LiteCrossbar_l446_6) begin
        io_masters_0_r_payload_data = io_slaves_3_r_payload_data;
      end
    end
    if(!when_Axi4LiteCrossbar_l388_4) begin
      if(when_Axi4LiteCrossbar_l446_8) begin
        io_masters_0_r_payload_data = decErr_io_axi_r_payload_data;
      end
    end
  end

  always @(*) begin
    io_masters_0_r_payload_resp = _zz_io_masters_0_r_payload_data[33 : 32];
    if(!when_Axi4LiteCrossbar_l388) begin
      if(when_Axi4LiteCrossbar_l446) begin
        io_masters_0_r_payload_resp = io_slaves_0_r_payload_resp;
      end
    end
    if(!when_Axi4LiteCrossbar_l388_1) begin
      if(when_Axi4LiteCrossbar_l446_2) begin
        io_masters_0_r_payload_resp = io_slaves_1_r_payload_resp;
      end
    end
    if(!when_Axi4LiteCrossbar_l388_2) begin
      if(when_Axi4LiteCrossbar_l446_4) begin
        io_masters_0_r_payload_resp = io_slaves_2_r_payload_resp;
      end
    end
    if(!when_Axi4LiteCrossbar_l388_3) begin
      if(when_Axi4LiteCrossbar_l446_6) begin
        io_masters_0_r_payload_resp = io_slaves_3_r_payload_resp;
      end
    end
    if(!when_Axi4LiteCrossbar_l388_4) begin
      if(when_Axi4LiteCrossbar_l446_8) begin
        io_masters_0_r_payload_resp = decErr_io_axi_r_payload_resp;
      end
    end
  end

  always @(*) begin
    io_masters_1_aw_ready = 1'b0;
    if(when_Axi4LiteCrossbar_l284) begin
      if(when_Axi4LiteCrossbar_l297) begin
        if(when_Axi4LiteCrossbar_l301_1) begin
          io_masters_1_aw_ready = io_slaves_0_aw_ready;
        end
      end
    end
    if(when_Axi4LiteCrossbar_l284_1) begin
      if(when_Axi4LiteCrossbar_l297_1) begin
        if(when_Axi4LiteCrossbar_l301_3) begin
          io_masters_1_aw_ready = io_slaves_1_aw_ready;
        end
      end
    end
    if(when_Axi4LiteCrossbar_l284_2) begin
      if(when_Axi4LiteCrossbar_l297_2) begin
        if(when_Axi4LiteCrossbar_l301_5) begin
          io_masters_1_aw_ready = io_slaves_2_aw_ready;
        end
      end
    end
    if(when_Axi4LiteCrossbar_l284_3) begin
      if(when_Axi4LiteCrossbar_l297_3) begin
        if(when_Axi4LiteCrossbar_l301_7) begin
          io_masters_1_aw_ready = io_slaves_3_aw_ready;
        end
      end
    end
    if(when_Axi4LiteCrossbar_l284_4) begin
      if(when_Axi4LiteCrossbar_l297_4) begin
        if(when_Axi4LiteCrossbar_l301_9) begin
          io_masters_1_aw_ready = decErr_io_axi_aw_ready;
        end
      end
    end
  end

  always @(*) begin
    io_masters_1_w_ready = 1'b0;
    if(when_Axi4LiteCrossbar_l284) begin
      if(when_Axi4LiteCrossbar_l297) begin
        if(when_Axi4LiteCrossbar_l301_1) begin
          if(when_Axi4LiteCrossbar_l308_1) begin
            io_masters_1_w_ready = io_slaves_0_w_ready;
          end
        end
      end
    end else begin
      if(when_Axi4LiteCrossbar_l357_1) begin
        if(when_Axi4LiteCrossbar_l358_1) begin
          io_masters_1_w_ready = io_slaves_0_w_ready;
        end
      end
    end
    if(when_Axi4LiteCrossbar_l284_1) begin
      if(when_Axi4LiteCrossbar_l297_1) begin
        if(when_Axi4LiteCrossbar_l301_3) begin
          if(when_Axi4LiteCrossbar_l308_3) begin
            io_masters_1_w_ready = io_slaves_1_w_ready;
          end
        end
      end
    end else begin
      if(when_Axi4LiteCrossbar_l357_3) begin
        if(when_Axi4LiteCrossbar_l358_3) begin
          io_masters_1_w_ready = io_slaves_1_w_ready;
        end
      end
    end
    if(when_Axi4LiteCrossbar_l284_2) begin
      if(when_Axi4LiteCrossbar_l297_2) begin
        if(when_Axi4LiteCrossbar_l301_5) begin
          if(when_Axi4LiteCrossbar_l308_5) begin
            io_masters_1_w_ready = io_slaves_2_w_ready;
          end
        end
      end
    end else begin
      if(when_Axi4LiteCrossbar_l357_5) begin
        if(when_Axi4LiteCrossbar_l358_5) begin
          io_masters_1_w_ready = io_slaves_2_w_ready;
        end
      end
    end
    if(when_Axi4LiteCrossbar_l284_3) begin
      if(when_Axi4LiteCrossbar_l297_3) begin
        if(when_Axi4LiteCrossbar_l301_7) begin
          if(when_Axi4LiteCrossbar_l308_7) begin
            io_masters_1_w_ready = io_slaves_3_w_ready;
          end
        end
      end
    end else begin
      if(when_Axi4LiteCrossbar_l357_7) begin
        if(when_Axi4LiteCrossbar_l358_7) begin
          io_masters_1_w_ready = io_slaves_3_w_ready;
        end
      end
    end
    if(when_Axi4LiteCrossbar_l284_4) begin
      if(when_Axi4LiteCrossbar_l297_4) begin
        if(when_Axi4LiteCrossbar_l301_9) begin
          if(when_Axi4LiteCrossbar_l308_9) begin
            io_masters_1_w_ready = decErr_io_axi_w_ready;
          end
        end
      end
    end else begin
      if(when_Axi4LiteCrossbar_l357_9) begin
        if(when_Axi4LiteCrossbar_l358_9) begin
          io_masters_1_w_ready = decErr_io_axi_w_ready;
        end
      end
    end
  end

  always @(*) begin
    io_masters_1_b_valid = 1'b0;
    if(!when_Axi4LiteCrossbar_l284) begin
      if(when_Axi4LiteCrossbar_l357_1) begin
        io_masters_1_b_valid = io_slaves_0_b_valid;
      end
    end
    if(!when_Axi4LiteCrossbar_l284_1) begin
      if(when_Axi4LiteCrossbar_l357_3) begin
        io_masters_1_b_valid = io_slaves_1_b_valid;
      end
    end
    if(!when_Axi4LiteCrossbar_l284_2) begin
      if(when_Axi4LiteCrossbar_l357_5) begin
        io_masters_1_b_valid = io_slaves_2_b_valid;
      end
    end
    if(!when_Axi4LiteCrossbar_l284_3) begin
      if(when_Axi4LiteCrossbar_l357_7) begin
        io_masters_1_b_valid = io_slaves_3_b_valid;
      end
    end
    if(!when_Axi4LiteCrossbar_l284_4) begin
      if(when_Axi4LiteCrossbar_l357_9) begin
        io_masters_1_b_valid = decErr_io_axi_b_valid;
      end
    end
  end

  always @(*) begin
    io_masters_1_b_payload_resp = _zz_io_masters_1_b_payload_resp[1 : 0];
    if(!when_Axi4LiteCrossbar_l284) begin
      if(when_Axi4LiteCrossbar_l357_1) begin
        io_masters_1_b_payload_resp = io_slaves_0_b_payload_resp;
      end
    end
    if(!when_Axi4LiteCrossbar_l284_1) begin
      if(when_Axi4LiteCrossbar_l357_3) begin
        io_masters_1_b_payload_resp = io_slaves_1_b_payload_resp;
      end
    end
    if(!when_Axi4LiteCrossbar_l284_2) begin
      if(when_Axi4LiteCrossbar_l357_5) begin
        io_masters_1_b_payload_resp = io_slaves_2_b_payload_resp;
      end
    end
    if(!when_Axi4LiteCrossbar_l284_3) begin
      if(when_Axi4LiteCrossbar_l357_7) begin
        io_masters_1_b_payload_resp = io_slaves_3_b_payload_resp;
      end
    end
    if(!when_Axi4LiteCrossbar_l284_4) begin
      if(when_Axi4LiteCrossbar_l357_9) begin
        io_masters_1_b_payload_resp = decErr_io_axi_b_payload_resp;
      end
    end
  end

  always @(*) begin
    io_masters_1_ar_ready = 1'b0;
    if(when_Axi4LiteCrossbar_l388) begin
      if(when_Axi4LiteCrossbar_l400) begin
        if(when_Axi4LiteCrossbar_l403_1) begin
          io_masters_1_ar_ready = io_slaves_0_ar_ready;
        end
      end
    end
    if(when_Axi4LiteCrossbar_l388_1) begin
      if(when_Axi4LiteCrossbar_l400_1) begin
        if(when_Axi4LiteCrossbar_l403_3) begin
          io_masters_1_ar_ready = io_slaves_1_ar_ready;
        end
      end
    end
    if(when_Axi4LiteCrossbar_l388_2) begin
      if(when_Axi4LiteCrossbar_l400_2) begin
        if(when_Axi4LiteCrossbar_l403_5) begin
          io_masters_1_ar_ready = io_slaves_2_ar_ready;
        end
      end
    end
    if(when_Axi4LiteCrossbar_l388_3) begin
      if(when_Axi4LiteCrossbar_l400_3) begin
        if(when_Axi4LiteCrossbar_l403_7) begin
          io_masters_1_ar_ready = io_slaves_3_ar_ready;
        end
      end
    end
    if(when_Axi4LiteCrossbar_l388_4) begin
      if(when_Axi4LiteCrossbar_l400_4) begin
        if(when_Axi4LiteCrossbar_l403_9) begin
          io_masters_1_ar_ready = decErr_io_axi_ar_ready;
        end
      end
    end
  end

  always @(*) begin
    io_masters_1_r_valid = 1'b0;
    if(!when_Axi4LiteCrossbar_l388) begin
      if(when_Axi4LiteCrossbar_l446_1) begin
        io_masters_1_r_valid = io_slaves_0_r_valid;
      end
    end
    if(!when_Axi4LiteCrossbar_l388_1) begin
      if(when_Axi4LiteCrossbar_l446_3) begin
        io_masters_1_r_valid = io_slaves_1_r_valid;
      end
    end
    if(!when_Axi4LiteCrossbar_l388_2) begin
      if(when_Axi4LiteCrossbar_l446_5) begin
        io_masters_1_r_valid = io_slaves_2_r_valid;
      end
    end
    if(!when_Axi4LiteCrossbar_l388_3) begin
      if(when_Axi4LiteCrossbar_l446_7) begin
        io_masters_1_r_valid = io_slaves_3_r_valid;
      end
    end
    if(!when_Axi4LiteCrossbar_l388_4) begin
      if(when_Axi4LiteCrossbar_l446_9) begin
        io_masters_1_r_valid = decErr_io_axi_r_valid;
      end
    end
  end

  assign _zz_io_masters_1_r_payload_data = 34'h0;
  always @(*) begin
    io_masters_1_r_payload_data = _zz_io_masters_1_r_payload_data[31 : 0];
    if(!when_Axi4LiteCrossbar_l388) begin
      if(when_Axi4LiteCrossbar_l446_1) begin
        io_masters_1_r_payload_data = io_slaves_0_r_payload_data;
      end
    end
    if(!when_Axi4LiteCrossbar_l388_1) begin
      if(when_Axi4LiteCrossbar_l446_3) begin
        io_masters_1_r_payload_data = io_slaves_1_r_payload_data;
      end
    end
    if(!when_Axi4LiteCrossbar_l388_2) begin
      if(when_Axi4LiteCrossbar_l446_5) begin
        io_masters_1_r_payload_data = io_slaves_2_r_payload_data;
      end
    end
    if(!when_Axi4LiteCrossbar_l388_3) begin
      if(when_Axi4LiteCrossbar_l446_7) begin
        io_masters_1_r_payload_data = io_slaves_3_r_payload_data;
      end
    end
    if(!when_Axi4LiteCrossbar_l388_4) begin
      if(when_Axi4LiteCrossbar_l446_9) begin
        io_masters_1_r_payload_data = decErr_io_axi_r_payload_data;
      end
    end
  end

  always @(*) begin
    io_masters_1_r_payload_resp = _zz_io_masters_1_r_payload_data[33 : 32];
    if(!when_Axi4LiteCrossbar_l388) begin
      if(when_Axi4LiteCrossbar_l446_1) begin
        io_masters_1_r_payload_resp = io_slaves_0_r_payload_resp;
      end
    end
    if(!when_Axi4LiteCrossbar_l388_1) begin
      if(when_Axi4LiteCrossbar_l446_3) begin
        io_masters_1_r_payload_resp = io_slaves_1_r_payload_resp;
      end
    end
    if(!when_Axi4LiteCrossbar_l388_2) begin
      if(when_Axi4LiteCrossbar_l446_5) begin
        io_masters_1_r_payload_resp = io_slaves_2_r_payload_resp;
      end
    end
    if(!when_Axi4LiteCrossbar_l388_3) begin
      if(when_Axi4LiteCrossbar_l446_7) begin
        io_masters_1_r_payload_resp = io_slaves_3_r_payload_resp;
      end
    end
    if(!when_Axi4LiteCrossbar_l388_4) begin
      if(when_Axi4LiteCrossbar_l446_9) begin
        io_masters_1_r_payload_resp = decErr_io_axi_r_payload_resp;
      end
    end
  end

  always @(*) begin
    io_slaves_0_aw_valid = 1'b0;
    if(when_Axi4LiteCrossbar_l284) begin
      if(when_Axi4LiteCrossbar_l297) begin
        io_slaves_0_aw_valid = 1'b1;
      end
    end
  end

  assign _zz_io_slaves_0_aw_payload_addr = 35'h0;
  always @(*) begin
    io_slaves_0_aw_payload_addr = _zz_io_slaves_0_aw_payload_addr[31 : 0];
    if(when_Axi4LiteCrossbar_l284) begin
      if(when_Axi4LiteCrossbar_l297) begin
        if(when_Axi4LiteCrossbar_l301) begin
          io_slaves_0_aw_payload_addr = io_masters_0_aw_payload_addr;
        end
        if(when_Axi4LiteCrossbar_l301_1) begin
          io_slaves_0_aw_payload_addr = io_masters_1_aw_payload_addr;
        end
      end
    end
  end

  always @(*) begin
    io_slaves_0_aw_payload_prot = _zz_io_slaves_0_aw_payload_addr[34 : 32];
    if(when_Axi4LiteCrossbar_l284) begin
      if(when_Axi4LiteCrossbar_l297) begin
        if(when_Axi4LiteCrossbar_l301) begin
          io_slaves_0_aw_payload_prot = io_masters_0_aw_payload_prot;
        end
        if(when_Axi4LiteCrossbar_l301_1) begin
          io_slaves_0_aw_payload_prot = io_masters_1_aw_payload_prot;
        end
      end
    end
  end

  always @(*) begin
    io_slaves_0_w_valid = 1'b0;
    if(when_Axi4LiteCrossbar_l284) begin
      if(when_Axi4LiteCrossbar_l297) begin
        if(when_Axi4LiteCrossbar_l301) begin
          if(when_Axi4LiteCrossbar_l308) begin
            io_slaves_0_w_valid = io_masters_0_w_valid;
          end
        end
        if(when_Axi4LiteCrossbar_l301_1) begin
          if(when_Axi4LiteCrossbar_l308_1) begin
            io_slaves_0_w_valid = io_masters_1_w_valid;
          end
        end
      end
    end else begin
      if(when_Axi4LiteCrossbar_l357) begin
        if(when_Axi4LiteCrossbar_l358) begin
          io_slaves_0_w_valid = io_masters_0_w_valid;
        end
      end
      if(when_Axi4LiteCrossbar_l357_1) begin
        if(when_Axi4LiteCrossbar_l358_1) begin
          io_slaves_0_w_valid = io_masters_1_w_valid;
        end
      end
    end
  end

  assign _zz_io_slaves_0_w_payload_data = 36'h0;
  always @(*) begin
    io_slaves_0_w_payload_data = _zz_io_slaves_0_w_payload_data[31 : 0];
    if(when_Axi4LiteCrossbar_l284) begin
      if(when_Axi4LiteCrossbar_l297) begin
        if(when_Axi4LiteCrossbar_l301) begin
          if(when_Axi4LiteCrossbar_l308) begin
            io_slaves_0_w_payload_data = io_masters_0_w_payload_data;
          end
        end
        if(when_Axi4LiteCrossbar_l301_1) begin
          if(when_Axi4LiteCrossbar_l308_1) begin
            io_slaves_0_w_payload_data = io_masters_1_w_payload_data;
          end
        end
      end
    end else begin
      if(when_Axi4LiteCrossbar_l357) begin
        if(when_Axi4LiteCrossbar_l358) begin
          io_slaves_0_w_payload_data = io_masters_0_w_payload_data;
        end
      end
      if(when_Axi4LiteCrossbar_l357_1) begin
        if(when_Axi4LiteCrossbar_l358_1) begin
          io_slaves_0_w_payload_data = io_masters_1_w_payload_data;
        end
      end
    end
  end

  always @(*) begin
    io_slaves_0_w_payload_strb = _zz_io_slaves_0_w_payload_data[35 : 32];
    if(when_Axi4LiteCrossbar_l284) begin
      if(when_Axi4LiteCrossbar_l297) begin
        if(when_Axi4LiteCrossbar_l301) begin
          if(when_Axi4LiteCrossbar_l308) begin
            io_slaves_0_w_payload_strb = io_masters_0_w_payload_strb;
          end
        end
        if(when_Axi4LiteCrossbar_l301_1) begin
          if(when_Axi4LiteCrossbar_l308_1) begin
            io_slaves_0_w_payload_strb = io_masters_1_w_payload_strb;
          end
        end
      end
    end else begin
      if(when_Axi4LiteCrossbar_l357) begin
        if(when_Axi4LiteCrossbar_l358) begin
          io_slaves_0_w_payload_strb = io_masters_0_w_payload_strb;
        end
      end
      if(when_Axi4LiteCrossbar_l357_1) begin
        if(when_Axi4LiteCrossbar_l358_1) begin
          io_slaves_0_w_payload_strb = io_masters_1_w_payload_strb;
        end
      end
    end
  end

  always @(*) begin
    io_slaves_0_b_ready = 1'b0;
    if(!when_Axi4LiteCrossbar_l284) begin
      if(when_Axi4LiteCrossbar_l357) begin
        io_slaves_0_b_ready = io_masters_0_b_ready;
      end
      if(when_Axi4LiteCrossbar_l357_1) begin
        io_slaves_0_b_ready = io_masters_1_b_ready;
      end
    end
  end

  always @(*) begin
    io_slaves_0_ar_valid = 1'b0;
    if(when_Axi4LiteCrossbar_l388) begin
      if(when_Axi4LiteCrossbar_l400) begin
        io_slaves_0_ar_valid = 1'b1;
      end
    end
  end

  assign _zz_io_slaves_0_ar_payload_addr = 35'h0;
  always @(*) begin
    io_slaves_0_ar_payload_addr = _zz_io_slaves_0_ar_payload_addr[31 : 0];
    if(when_Axi4LiteCrossbar_l388) begin
      if(when_Axi4LiteCrossbar_l400) begin
        if(when_Axi4LiteCrossbar_l403) begin
          io_slaves_0_ar_payload_addr = io_masters_0_ar_payload_addr;
        end
        if(when_Axi4LiteCrossbar_l403_1) begin
          io_slaves_0_ar_payload_addr = io_masters_1_ar_payload_addr;
        end
      end
    end
  end

  always @(*) begin
    io_slaves_0_ar_payload_prot = _zz_io_slaves_0_ar_payload_addr[34 : 32];
    if(when_Axi4LiteCrossbar_l388) begin
      if(when_Axi4LiteCrossbar_l400) begin
        if(when_Axi4LiteCrossbar_l403) begin
          io_slaves_0_ar_payload_prot = io_masters_0_ar_payload_prot;
        end
        if(when_Axi4LiteCrossbar_l403_1) begin
          io_slaves_0_ar_payload_prot = io_masters_1_ar_payload_prot;
        end
      end
    end
  end

  always @(*) begin
    io_slaves_0_r_ready = 1'b0;
    if(!when_Axi4LiteCrossbar_l388) begin
      if(when_Axi4LiteCrossbar_l446) begin
        io_slaves_0_r_ready = io_masters_0_r_ready;
      end
      if(when_Axi4LiteCrossbar_l446_1) begin
        io_slaves_0_r_ready = io_masters_1_r_ready;
      end
    end
  end

  always @(*) begin
    io_slaves_1_aw_valid = 1'b0;
    if(when_Axi4LiteCrossbar_l284_1) begin
      if(when_Axi4LiteCrossbar_l297_1) begin
        io_slaves_1_aw_valid = 1'b1;
      end
    end
  end

  assign _zz_io_slaves_1_aw_payload_addr = 35'h0;
  always @(*) begin
    io_slaves_1_aw_payload_addr = _zz_io_slaves_1_aw_payload_addr[31 : 0];
    if(when_Axi4LiteCrossbar_l284_1) begin
      if(when_Axi4LiteCrossbar_l297_1) begin
        if(when_Axi4LiteCrossbar_l301_2) begin
          io_slaves_1_aw_payload_addr = io_masters_0_aw_payload_addr;
        end
        if(when_Axi4LiteCrossbar_l301_3) begin
          io_slaves_1_aw_payload_addr = io_masters_1_aw_payload_addr;
        end
      end
    end
  end

  always @(*) begin
    io_slaves_1_aw_payload_prot = _zz_io_slaves_1_aw_payload_addr[34 : 32];
    if(when_Axi4LiteCrossbar_l284_1) begin
      if(when_Axi4LiteCrossbar_l297_1) begin
        if(when_Axi4LiteCrossbar_l301_2) begin
          io_slaves_1_aw_payload_prot = io_masters_0_aw_payload_prot;
        end
        if(when_Axi4LiteCrossbar_l301_3) begin
          io_slaves_1_aw_payload_prot = io_masters_1_aw_payload_prot;
        end
      end
    end
  end

  always @(*) begin
    io_slaves_1_w_valid = 1'b0;
    if(when_Axi4LiteCrossbar_l284_1) begin
      if(when_Axi4LiteCrossbar_l297_1) begin
        if(when_Axi4LiteCrossbar_l301_2) begin
          if(when_Axi4LiteCrossbar_l308_2) begin
            io_slaves_1_w_valid = io_masters_0_w_valid;
          end
        end
        if(when_Axi4LiteCrossbar_l301_3) begin
          if(when_Axi4LiteCrossbar_l308_3) begin
            io_slaves_1_w_valid = io_masters_1_w_valid;
          end
        end
      end
    end else begin
      if(when_Axi4LiteCrossbar_l357_2) begin
        if(when_Axi4LiteCrossbar_l358_2) begin
          io_slaves_1_w_valid = io_masters_0_w_valid;
        end
      end
      if(when_Axi4LiteCrossbar_l357_3) begin
        if(when_Axi4LiteCrossbar_l358_3) begin
          io_slaves_1_w_valid = io_masters_1_w_valid;
        end
      end
    end
  end

  assign _zz_io_slaves_1_w_payload_data = 36'h0;
  always @(*) begin
    io_slaves_1_w_payload_data = _zz_io_slaves_1_w_payload_data[31 : 0];
    if(when_Axi4LiteCrossbar_l284_1) begin
      if(when_Axi4LiteCrossbar_l297_1) begin
        if(when_Axi4LiteCrossbar_l301_2) begin
          if(when_Axi4LiteCrossbar_l308_2) begin
            io_slaves_1_w_payload_data = io_masters_0_w_payload_data;
          end
        end
        if(when_Axi4LiteCrossbar_l301_3) begin
          if(when_Axi4LiteCrossbar_l308_3) begin
            io_slaves_1_w_payload_data = io_masters_1_w_payload_data;
          end
        end
      end
    end else begin
      if(when_Axi4LiteCrossbar_l357_2) begin
        if(when_Axi4LiteCrossbar_l358_2) begin
          io_slaves_1_w_payload_data = io_masters_0_w_payload_data;
        end
      end
      if(when_Axi4LiteCrossbar_l357_3) begin
        if(when_Axi4LiteCrossbar_l358_3) begin
          io_slaves_1_w_payload_data = io_masters_1_w_payload_data;
        end
      end
    end
  end

  always @(*) begin
    io_slaves_1_w_payload_strb = _zz_io_slaves_1_w_payload_data[35 : 32];
    if(when_Axi4LiteCrossbar_l284_1) begin
      if(when_Axi4LiteCrossbar_l297_1) begin
        if(when_Axi4LiteCrossbar_l301_2) begin
          if(when_Axi4LiteCrossbar_l308_2) begin
            io_slaves_1_w_payload_strb = io_masters_0_w_payload_strb;
          end
        end
        if(when_Axi4LiteCrossbar_l301_3) begin
          if(when_Axi4LiteCrossbar_l308_3) begin
            io_slaves_1_w_payload_strb = io_masters_1_w_payload_strb;
          end
        end
      end
    end else begin
      if(when_Axi4LiteCrossbar_l357_2) begin
        if(when_Axi4LiteCrossbar_l358_2) begin
          io_slaves_1_w_payload_strb = io_masters_0_w_payload_strb;
        end
      end
      if(when_Axi4LiteCrossbar_l357_3) begin
        if(when_Axi4LiteCrossbar_l358_3) begin
          io_slaves_1_w_payload_strb = io_masters_1_w_payload_strb;
        end
      end
    end
  end

  always @(*) begin
    io_slaves_1_b_ready = 1'b0;
    if(!when_Axi4LiteCrossbar_l284_1) begin
      if(when_Axi4LiteCrossbar_l357_2) begin
        io_slaves_1_b_ready = io_masters_0_b_ready;
      end
      if(when_Axi4LiteCrossbar_l357_3) begin
        io_slaves_1_b_ready = io_masters_1_b_ready;
      end
    end
  end

  always @(*) begin
    io_slaves_1_ar_valid = 1'b0;
    if(when_Axi4LiteCrossbar_l388_1) begin
      if(when_Axi4LiteCrossbar_l400_1) begin
        io_slaves_1_ar_valid = 1'b1;
      end
    end
  end

  assign _zz_io_slaves_1_ar_payload_addr = 35'h0;
  always @(*) begin
    io_slaves_1_ar_payload_addr = _zz_io_slaves_1_ar_payload_addr[31 : 0];
    if(when_Axi4LiteCrossbar_l388_1) begin
      if(when_Axi4LiteCrossbar_l400_1) begin
        if(when_Axi4LiteCrossbar_l403_2) begin
          io_slaves_1_ar_payload_addr = io_masters_0_ar_payload_addr;
        end
        if(when_Axi4LiteCrossbar_l403_3) begin
          io_slaves_1_ar_payload_addr = io_masters_1_ar_payload_addr;
        end
      end
    end
  end

  always @(*) begin
    io_slaves_1_ar_payload_prot = _zz_io_slaves_1_ar_payload_addr[34 : 32];
    if(when_Axi4LiteCrossbar_l388_1) begin
      if(when_Axi4LiteCrossbar_l400_1) begin
        if(when_Axi4LiteCrossbar_l403_2) begin
          io_slaves_1_ar_payload_prot = io_masters_0_ar_payload_prot;
        end
        if(when_Axi4LiteCrossbar_l403_3) begin
          io_slaves_1_ar_payload_prot = io_masters_1_ar_payload_prot;
        end
      end
    end
  end

  always @(*) begin
    io_slaves_1_r_ready = 1'b0;
    if(!when_Axi4LiteCrossbar_l388_1) begin
      if(when_Axi4LiteCrossbar_l446_2) begin
        io_slaves_1_r_ready = io_masters_0_r_ready;
      end
      if(when_Axi4LiteCrossbar_l446_3) begin
        io_slaves_1_r_ready = io_masters_1_r_ready;
      end
    end
  end

  always @(*) begin
    io_slaves_2_aw_valid = 1'b0;
    if(when_Axi4LiteCrossbar_l284_2) begin
      if(when_Axi4LiteCrossbar_l297_2) begin
        io_slaves_2_aw_valid = 1'b1;
      end
    end
  end

  assign _zz_io_slaves_2_aw_payload_addr = 35'h0;
  always @(*) begin
    io_slaves_2_aw_payload_addr = _zz_io_slaves_2_aw_payload_addr[31 : 0];
    if(when_Axi4LiteCrossbar_l284_2) begin
      if(when_Axi4LiteCrossbar_l297_2) begin
        if(when_Axi4LiteCrossbar_l301_4) begin
          io_slaves_2_aw_payload_addr = io_masters_0_aw_payload_addr;
        end
        if(when_Axi4LiteCrossbar_l301_5) begin
          io_slaves_2_aw_payload_addr = io_masters_1_aw_payload_addr;
        end
      end
    end
  end

  always @(*) begin
    io_slaves_2_aw_payload_prot = _zz_io_slaves_2_aw_payload_addr[34 : 32];
    if(when_Axi4LiteCrossbar_l284_2) begin
      if(when_Axi4LiteCrossbar_l297_2) begin
        if(when_Axi4LiteCrossbar_l301_4) begin
          io_slaves_2_aw_payload_prot = io_masters_0_aw_payload_prot;
        end
        if(when_Axi4LiteCrossbar_l301_5) begin
          io_slaves_2_aw_payload_prot = io_masters_1_aw_payload_prot;
        end
      end
    end
  end

  always @(*) begin
    io_slaves_2_w_valid = 1'b0;
    if(when_Axi4LiteCrossbar_l284_2) begin
      if(when_Axi4LiteCrossbar_l297_2) begin
        if(when_Axi4LiteCrossbar_l301_4) begin
          if(when_Axi4LiteCrossbar_l308_4) begin
            io_slaves_2_w_valid = io_masters_0_w_valid;
          end
        end
        if(when_Axi4LiteCrossbar_l301_5) begin
          if(when_Axi4LiteCrossbar_l308_5) begin
            io_slaves_2_w_valid = io_masters_1_w_valid;
          end
        end
      end
    end else begin
      if(when_Axi4LiteCrossbar_l357_4) begin
        if(when_Axi4LiteCrossbar_l358_4) begin
          io_slaves_2_w_valid = io_masters_0_w_valid;
        end
      end
      if(when_Axi4LiteCrossbar_l357_5) begin
        if(when_Axi4LiteCrossbar_l358_5) begin
          io_slaves_2_w_valid = io_masters_1_w_valid;
        end
      end
    end
  end

  assign _zz_io_slaves_2_w_payload_data = 36'h0;
  always @(*) begin
    io_slaves_2_w_payload_data = _zz_io_slaves_2_w_payload_data[31 : 0];
    if(when_Axi4LiteCrossbar_l284_2) begin
      if(when_Axi4LiteCrossbar_l297_2) begin
        if(when_Axi4LiteCrossbar_l301_4) begin
          if(when_Axi4LiteCrossbar_l308_4) begin
            io_slaves_2_w_payload_data = io_masters_0_w_payload_data;
          end
        end
        if(when_Axi4LiteCrossbar_l301_5) begin
          if(when_Axi4LiteCrossbar_l308_5) begin
            io_slaves_2_w_payload_data = io_masters_1_w_payload_data;
          end
        end
      end
    end else begin
      if(when_Axi4LiteCrossbar_l357_4) begin
        if(when_Axi4LiteCrossbar_l358_4) begin
          io_slaves_2_w_payload_data = io_masters_0_w_payload_data;
        end
      end
      if(when_Axi4LiteCrossbar_l357_5) begin
        if(when_Axi4LiteCrossbar_l358_5) begin
          io_slaves_2_w_payload_data = io_masters_1_w_payload_data;
        end
      end
    end
  end

  always @(*) begin
    io_slaves_2_w_payload_strb = _zz_io_slaves_2_w_payload_data[35 : 32];
    if(when_Axi4LiteCrossbar_l284_2) begin
      if(when_Axi4LiteCrossbar_l297_2) begin
        if(when_Axi4LiteCrossbar_l301_4) begin
          if(when_Axi4LiteCrossbar_l308_4) begin
            io_slaves_2_w_payload_strb = io_masters_0_w_payload_strb;
          end
        end
        if(when_Axi4LiteCrossbar_l301_5) begin
          if(when_Axi4LiteCrossbar_l308_5) begin
            io_slaves_2_w_payload_strb = io_masters_1_w_payload_strb;
          end
        end
      end
    end else begin
      if(when_Axi4LiteCrossbar_l357_4) begin
        if(when_Axi4LiteCrossbar_l358_4) begin
          io_slaves_2_w_payload_strb = io_masters_0_w_payload_strb;
        end
      end
      if(when_Axi4LiteCrossbar_l357_5) begin
        if(when_Axi4LiteCrossbar_l358_5) begin
          io_slaves_2_w_payload_strb = io_masters_1_w_payload_strb;
        end
      end
    end
  end

  always @(*) begin
    io_slaves_2_b_ready = 1'b0;
    if(!when_Axi4LiteCrossbar_l284_2) begin
      if(when_Axi4LiteCrossbar_l357_4) begin
        io_slaves_2_b_ready = io_masters_0_b_ready;
      end
      if(when_Axi4LiteCrossbar_l357_5) begin
        io_slaves_2_b_ready = io_masters_1_b_ready;
      end
    end
  end

  always @(*) begin
    io_slaves_2_ar_valid = 1'b0;
    if(when_Axi4LiteCrossbar_l388_2) begin
      if(when_Axi4LiteCrossbar_l400_2) begin
        io_slaves_2_ar_valid = 1'b1;
      end
    end
  end

  assign _zz_io_slaves_2_ar_payload_addr = 35'h0;
  always @(*) begin
    io_slaves_2_ar_payload_addr = _zz_io_slaves_2_ar_payload_addr[31 : 0];
    if(when_Axi4LiteCrossbar_l388_2) begin
      if(when_Axi4LiteCrossbar_l400_2) begin
        if(when_Axi4LiteCrossbar_l403_4) begin
          io_slaves_2_ar_payload_addr = io_masters_0_ar_payload_addr;
        end
        if(when_Axi4LiteCrossbar_l403_5) begin
          io_slaves_2_ar_payload_addr = io_masters_1_ar_payload_addr;
        end
      end
    end
  end

  always @(*) begin
    io_slaves_2_ar_payload_prot = _zz_io_slaves_2_ar_payload_addr[34 : 32];
    if(when_Axi4LiteCrossbar_l388_2) begin
      if(when_Axi4LiteCrossbar_l400_2) begin
        if(when_Axi4LiteCrossbar_l403_4) begin
          io_slaves_2_ar_payload_prot = io_masters_0_ar_payload_prot;
        end
        if(when_Axi4LiteCrossbar_l403_5) begin
          io_slaves_2_ar_payload_prot = io_masters_1_ar_payload_prot;
        end
      end
    end
  end

  always @(*) begin
    io_slaves_2_r_ready = 1'b0;
    if(!when_Axi4LiteCrossbar_l388_2) begin
      if(when_Axi4LiteCrossbar_l446_4) begin
        io_slaves_2_r_ready = io_masters_0_r_ready;
      end
      if(when_Axi4LiteCrossbar_l446_5) begin
        io_slaves_2_r_ready = io_masters_1_r_ready;
      end
    end
  end

  always @(*) begin
    io_slaves_3_aw_valid = 1'b0;
    if(when_Axi4LiteCrossbar_l284_3) begin
      if(when_Axi4LiteCrossbar_l297_3) begin
        io_slaves_3_aw_valid = 1'b1;
      end
    end
  end

  assign _zz_io_slaves_3_aw_payload_addr = 35'h0;
  always @(*) begin
    io_slaves_3_aw_payload_addr = _zz_io_slaves_3_aw_payload_addr[31 : 0];
    if(when_Axi4LiteCrossbar_l284_3) begin
      if(when_Axi4LiteCrossbar_l297_3) begin
        if(when_Axi4LiteCrossbar_l301_6) begin
          io_slaves_3_aw_payload_addr = io_masters_0_aw_payload_addr;
        end
        if(when_Axi4LiteCrossbar_l301_7) begin
          io_slaves_3_aw_payload_addr = io_masters_1_aw_payload_addr;
        end
      end
    end
  end

  always @(*) begin
    io_slaves_3_aw_payload_prot = _zz_io_slaves_3_aw_payload_addr[34 : 32];
    if(when_Axi4LiteCrossbar_l284_3) begin
      if(when_Axi4LiteCrossbar_l297_3) begin
        if(when_Axi4LiteCrossbar_l301_6) begin
          io_slaves_3_aw_payload_prot = io_masters_0_aw_payload_prot;
        end
        if(when_Axi4LiteCrossbar_l301_7) begin
          io_slaves_3_aw_payload_prot = io_masters_1_aw_payload_prot;
        end
      end
    end
  end

  always @(*) begin
    io_slaves_3_w_valid = 1'b0;
    if(when_Axi4LiteCrossbar_l284_3) begin
      if(when_Axi4LiteCrossbar_l297_3) begin
        if(when_Axi4LiteCrossbar_l301_6) begin
          if(when_Axi4LiteCrossbar_l308_6) begin
            io_slaves_3_w_valid = io_masters_0_w_valid;
          end
        end
        if(when_Axi4LiteCrossbar_l301_7) begin
          if(when_Axi4LiteCrossbar_l308_7) begin
            io_slaves_3_w_valid = io_masters_1_w_valid;
          end
        end
      end
    end else begin
      if(when_Axi4LiteCrossbar_l357_6) begin
        if(when_Axi4LiteCrossbar_l358_6) begin
          io_slaves_3_w_valid = io_masters_0_w_valid;
        end
      end
      if(when_Axi4LiteCrossbar_l357_7) begin
        if(when_Axi4LiteCrossbar_l358_7) begin
          io_slaves_3_w_valid = io_masters_1_w_valid;
        end
      end
    end
  end

  assign _zz_io_slaves_3_w_payload_data = 36'h0;
  always @(*) begin
    io_slaves_3_w_payload_data = _zz_io_slaves_3_w_payload_data[31 : 0];
    if(when_Axi4LiteCrossbar_l284_3) begin
      if(when_Axi4LiteCrossbar_l297_3) begin
        if(when_Axi4LiteCrossbar_l301_6) begin
          if(when_Axi4LiteCrossbar_l308_6) begin
            io_slaves_3_w_payload_data = io_masters_0_w_payload_data;
          end
        end
        if(when_Axi4LiteCrossbar_l301_7) begin
          if(when_Axi4LiteCrossbar_l308_7) begin
            io_slaves_3_w_payload_data = io_masters_1_w_payload_data;
          end
        end
      end
    end else begin
      if(when_Axi4LiteCrossbar_l357_6) begin
        if(when_Axi4LiteCrossbar_l358_6) begin
          io_slaves_3_w_payload_data = io_masters_0_w_payload_data;
        end
      end
      if(when_Axi4LiteCrossbar_l357_7) begin
        if(when_Axi4LiteCrossbar_l358_7) begin
          io_slaves_3_w_payload_data = io_masters_1_w_payload_data;
        end
      end
    end
  end

  always @(*) begin
    io_slaves_3_w_payload_strb = _zz_io_slaves_3_w_payload_data[35 : 32];
    if(when_Axi4LiteCrossbar_l284_3) begin
      if(when_Axi4LiteCrossbar_l297_3) begin
        if(when_Axi4LiteCrossbar_l301_6) begin
          if(when_Axi4LiteCrossbar_l308_6) begin
            io_slaves_3_w_payload_strb = io_masters_0_w_payload_strb;
          end
        end
        if(when_Axi4LiteCrossbar_l301_7) begin
          if(when_Axi4LiteCrossbar_l308_7) begin
            io_slaves_3_w_payload_strb = io_masters_1_w_payload_strb;
          end
        end
      end
    end else begin
      if(when_Axi4LiteCrossbar_l357_6) begin
        if(when_Axi4LiteCrossbar_l358_6) begin
          io_slaves_3_w_payload_strb = io_masters_0_w_payload_strb;
        end
      end
      if(when_Axi4LiteCrossbar_l357_7) begin
        if(when_Axi4LiteCrossbar_l358_7) begin
          io_slaves_3_w_payload_strb = io_masters_1_w_payload_strb;
        end
      end
    end
  end

  always @(*) begin
    io_slaves_3_b_ready = 1'b0;
    if(!when_Axi4LiteCrossbar_l284_3) begin
      if(when_Axi4LiteCrossbar_l357_6) begin
        io_slaves_3_b_ready = io_masters_0_b_ready;
      end
      if(when_Axi4LiteCrossbar_l357_7) begin
        io_slaves_3_b_ready = io_masters_1_b_ready;
      end
    end
  end

  always @(*) begin
    io_slaves_3_ar_valid = 1'b0;
    if(when_Axi4LiteCrossbar_l388_3) begin
      if(when_Axi4LiteCrossbar_l400_3) begin
        io_slaves_3_ar_valid = 1'b1;
      end
    end
  end

  assign _zz_io_slaves_3_ar_payload_addr = 35'h0;
  always @(*) begin
    io_slaves_3_ar_payload_addr = _zz_io_slaves_3_ar_payload_addr[31 : 0];
    if(when_Axi4LiteCrossbar_l388_3) begin
      if(when_Axi4LiteCrossbar_l400_3) begin
        if(when_Axi4LiteCrossbar_l403_6) begin
          io_slaves_3_ar_payload_addr = io_masters_0_ar_payload_addr;
        end
        if(when_Axi4LiteCrossbar_l403_7) begin
          io_slaves_3_ar_payload_addr = io_masters_1_ar_payload_addr;
        end
      end
    end
  end

  always @(*) begin
    io_slaves_3_ar_payload_prot = _zz_io_slaves_3_ar_payload_addr[34 : 32];
    if(when_Axi4LiteCrossbar_l388_3) begin
      if(when_Axi4LiteCrossbar_l400_3) begin
        if(when_Axi4LiteCrossbar_l403_6) begin
          io_slaves_3_ar_payload_prot = io_masters_0_ar_payload_prot;
        end
        if(when_Axi4LiteCrossbar_l403_7) begin
          io_slaves_3_ar_payload_prot = io_masters_1_ar_payload_prot;
        end
      end
    end
  end

  always @(*) begin
    io_slaves_3_r_ready = 1'b0;
    if(!when_Axi4LiteCrossbar_l388_3) begin
      if(when_Axi4LiteCrossbar_l446_6) begin
        io_slaves_3_r_ready = io_masters_0_r_ready;
      end
      if(when_Axi4LiteCrossbar_l446_7) begin
        io_slaves_3_r_ready = io_masters_1_r_ready;
      end
    end
  end

  always @(*) begin
    decErr_io_axi_aw_valid = 1'b0;
    if(when_Axi4LiteCrossbar_l284_4) begin
      if(when_Axi4LiteCrossbar_l297_4) begin
        decErr_io_axi_aw_valid = 1'b1;
      end
    end
  end

  assign _zz_io_axi_aw_payload_addr = 35'h0;
  always @(*) begin
    decErr_io_axi_aw_payload_addr = _zz_io_axi_aw_payload_addr[31 : 0];
    if(when_Axi4LiteCrossbar_l284_4) begin
      if(when_Axi4LiteCrossbar_l297_4) begin
        if(when_Axi4LiteCrossbar_l301_8) begin
          decErr_io_axi_aw_payload_addr = io_masters_0_aw_payload_addr;
        end
        if(when_Axi4LiteCrossbar_l301_9) begin
          decErr_io_axi_aw_payload_addr = io_masters_1_aw_payload_addr;
        end
      end
    end
  end

  always @(*) begin
    decErr_io_axi_aw_payload_prot = _zz_io_axi_aw_payload_addr[34 : 32];
    if(when_Axi4LiteCrossbar_l284_4) begin
      if(when_Axi4LiteCrossbar_l297_4) begin
        if(when_Axi4LiteCrossbar_l301_8) begin
          decErr_io_axi_aw_payload_prot = io_masters_0_aw_payload_prot;
        end
        if(when_Axi4LiteCrossbar_l301_9) begin
          decErr_io_axi_aw_payload_prot = io_masters_1_aw_payload_prot;
        end
      end
    end
  end

  always @(*) begin
    decErr_io_axi_w_valid = 1'b0;
    if(when_Axi4LiteCrossbar_l284_4) begin
      if(when_Axi4LiteCrossbar_l297_4) begin
        if(when_Axi4LiteCrossbar_l301_8) begin
          if(when_Axi4LiteCrossbar_l308_8) begin
            decErr_io_axi_w_valid = io_masters_0_w_valid;
          end
        end
        if(when_Axi4LiteCrossbar_l301_9) begin
          if(when_Axi4LiteCrossbar_l308_9) begin
            decErr_io_axi_w_valid = io_masters_1_w_valid;
          end
        end
      end
    end else begin
      if(when_Axi4LiteCrossbar_l357_8) begin
        if(when_Axi4LiteCrossbar_l358_8) begin
          decErr_io_axi_w_valid = io_masters_0_w_valid;
        end
      end
      if(when_Axi4LiteCrossbar_l357_9) begin
        if(when_Axi4LiteCrossbar_l358_9) begin
          decErr_io_axi_w_valid = io_masters_1_w_valid;
        end
      end
    end
  end

  assign _zz_io_axi_w_payload_data = 36'h0;
  always @(*) begin
    decErr_io_axi_w_payload_data = _zz_io_axi_w_payload_data[31 : 0];
    if(when_Axi4LiteCrossbar_l284_4) begin
      if(when_Axi4LiteCrossbar_l297_4) begin
        if(when_Axi4LiteCrossbar_l301_8) begin
          if(when_Axi4LiteCrossbar_l308_8) begin
            decErr_io_axi_w_payload_data = io_masters_0_w_payload_data;
          end
        end
        if(when_Axi4LiteCrossbar_l301_9) begin
          if(when_Axi4LiteCrossbar_l308_9) begin
            decErr_io_axi_w_payload_data = io_masters_1_w_payload_data;
          end
        end
      end
    end else begin
      if(when_Axi4LiteCrossbar_l357_8) begin
        if(when_Axi4LiteCrossbar_l358_8) begin
          decErr_io_axi_w_payload_data = io_masters_0_w_payload_data;
        end
      end
      if(when_Axi4LiteCrossbar_l357_9) begin
        if(when_Axi4LiteCrossbar_l358_9) begin
          decErr_io_axi_w_payload_data = io_masters_1_w_payload_data;
        end
      end
    end
  end

  always @(*) begin
    decErr_io_axi_w_payload_strb = _zz_io_axi_w_payload_data[35 : 32];
    if(when_Axi4LiteCrossbar_l284_4) begin
      if(when_Axi4LiteCrossbar_l297_4) begin
        if(when_Axi4LiteCrossbar_l301_8) begin
          if(when_Axi4LiteCrossbar_l308_8) begin
            decErr_io_axi_w_payload_strb = io_masters_0_w_payload_strb;
          end
        end
        if(when_Axi4LiteCrossbar_l301_9) begin
          if(when_Axi4LiteCrossbar_l308_9) begin
            decErr_io_axi_w_payload_strb = io_masters_1_w_payload_strb;
          end
        end
      end
    end else begin
      if(when_Axi4LiteCrossbar_l357_8) begin
        if(when_Axi4LiteCrossbar_l358_8) begin
          decErr_io_axi_w_payload_strb = io_masters_0_w_payload_strb;
        end
      end
      if(when_Axi4LiteCrossbar_l357_9) begin
        if(when_Axi4LiteCrossbar_l358_9) begin
          decErr_io_axi_w_payload_strb = io_masters_1_w_payload_strb;
        end
      end
    end
  end

  always @(*) begin
    decErr_io_axi_b_ready = 1'b0;
    if(!when_Axi4LiteCrossbar_l284_4) begin
      if(when_Axi4LiteCrossbar_l357_8) begin
        decErr_io_axi_b_ready = io_masters_0_b_ready;
      end
      if(when_Axi4LiteCrossbar_l357_9) begin
        decErr_io_axi_b_ready = io_masters_1_b_ready;
      end
    end
  end

  always @(*) begin
    decErr_io_axi_ar_valid = 1'b0;
    if(when_Axi4LiteCrossbar_l388_4) begin
      if(when_Axi4LiteCrossbar_l400_4) begin
        decErr_io_axi_ar_valid = 1'b1;
      end
    end
  end

  assign _zz_io_axi_ar_payload_addr = 35'h0;
  always @(*) begin
    decErr_io_axi_ar_payload_addr = _zz_io_axi_ar_payload_addr[31 : 0];
    if(when_Axi4LiteCrossbar_l388_4) begin
      if(when_Axi4LiteCrossbar_l400_4) begin
        if(when_Axi4LiteCrossbar_l403_8) begin
          decErr_io_axi_ar_payload_addr = io_masters_0_ar_payload_addr;
        end
        if(when_Axi4LiteCrossbar_l403_9) begin
          decErr_io_axi_ar_payload_addr = io_masters_1_ar_payload_addr;
        end
      end
    end
  end

  always @(*) begin
    decErr_io_axi_ar_payload_prot = _zz_io_axi_ar_payload_addr[34 : 32];
    if(when_Axi4LiteCrossbar_l388_4) begin
      if(when_Axi4LiteCrossbar_l400_4) begin
        if(when_Axi4LiteCrossbar_l403_8) begin
          decErr_io_axi_ar_payload_prot = io_masters_0_ar_payload_prot;
        end
        if(when_Axi4LiteCrossbar_l403_9) begin
          decErr_io_axi_ar_payload_prot = io_masters_1_ar_payload_prot;
        end
      end
    end
  end

  always @(*) begin
    decErr_io_axi_r_ready = 1'b0;
    if(!when_Axi4LiteCrossbar_l388_4) begin
      if(when_Axi4LiteCrossbar_l446_8) begin
        decErr_io_axi_r_ready = io_masters_0_r_ready;
      end
      if(when_Axi4LiteCrossbar_l446_9) begin
        decErr_io_axi_r_ready = io_masters_1_r_ready;
      end
    end
  end

  assign when_Axi4LiteCrossbar_l284 = (! wrActive_0);
  always @(*) begin
    _zz_when_Axi4LiteCrossbar_l297_1[0] = (io_masters_0_aw_payload_addr[31 : 16] == 16'h0);
    _zz_when_Axi4LiteCrossbar_l297_1[1] = (io_masters_0_aw_payload_addr[31 : 16] == 16'h0001);
    _zz_when_Axi4LiteCrossbar_l297_1[2] = (io_masters_0_aw_payload_addr[31 : 16] == 16'h0002);
    _zz_when_Axi4LiteCrossbar_l297_1[3] = (io_masters_0_aw_payload_addr[31 : 16] == 16'h0003);
  end

  always @(*) begin
    _zz_when_Axi4LiteCrossbar_l297[0] = ((io_masters_0_aw_valid && _zz__zz_when_Axi4LiteCrossbar_l297[0]) && (! ((((wrActive_0 && (wrGranted_0 == _zz__zz_when_Axi4LiteCrossbar_l297_1)) || (wrActive_1 && (wrGranted_1 == _zz__zz_when_Axi4LiteCrossbar_l297_2))) || ((wrActive_2 && (wrGranted_2 == _zz__zz_when_Axi4LiteCrossbar_l297_3)) || (wrActive_3 && (wrGranted_3 == _zz__zz_when_Axi4LiteCrossbar_l297_4)))) || (wrActive_4 && (wrGranted_4 == 1'b0)))));
    _zz_when_Axi4LiteCrossbar_l297[1] = ((io_masters_1_aw_valid && _zz__zz_when_Axi4LiteCrossbar_l297_5[0]) && (! ((((wrActive_0 && (wrGranted_0 == 1'b1)) || (wrActive_1 && (wrGranted_1 == 1'b1))) || ((wrActive_2 && (wrGranted_2 == 1'b1)) || (wrActive_3 && (wrGranted_3 == 1'b1)))) || (wrActive_4 && (wrGranted_4 == 1'b1)))));
  end

  always @(*) begin
    _zz_when_Axi4LiteCrossbar_l297_2[0] = (io_masters_1_aw_payload_addr[31 : 16] == 16'h0);
    _zz_when_Axi4LiteCrossbar_l297_2[1] = (io_masters_1_aw_payload_addr[31 : 16] == 16'h0001);
    _zz_when_Axi4LiteCrossbar_l297_2[2] = (io_masters_1_aw_payload_addr[31 : 16] == 16'h0002);
    _zz_when_Axi4LiteCrossbar_l297_2[3] = (io_masters_1_aw_payload_addr[31 : 16] == 16'h0003);
  end

  always @(*) begin
    _zz_when_Axi4LiteCrossbar_l149 = 2'b00;
    if(when_Axi4LiteCrossbar_l106) begin
      _zz_when_Axi4LiteCrossbar_l149 = 2'b01;
    end
  end

  assign when_Axi4LiteCrossbar_l106 = (1'b1 <= wrRrPtr_0);
  assign _zz_when_Axi4LiteCrossbar_l149_1 = (_zz_when_Axi4LiteCrossbar_l297 & (~ _zz_when_Axi4LiteCrossbar_l149));
  assign _zz_when_Axi4LiteCrossbar_l149_2 = _zz_when_Axi4LiteCrossbar_l149_1;
  assign _zz_when_Axi4LiteCrossbar_l149_3 = _zz_when_Axi4LiteCrossbar_l297;
  assign _zz_when_Axi4LiteCrossbar_l149_4 = ((|_zz_when_Axi4LiteCrossbar_l149_1) ? (_zz_when_Axi4LiteCrossbar_l149_2 & (~ _zz__zz_when_Axi4LiteCrossbar_l149_4)) : (_zz_when_Axi4LiteCrossbar_l149_3 & (~ _zz__zz_when_Axi4LiteCrossbar_l149_4_1)));
  always @(*) begin
    _zz_wrGranted_0 = 1'b0;
    if(when_Axi4LiteCrossbar_l149) begin
      _zz_wrGranted_0 = 1'b0;
    end
    if(when_Axi4LiteCrossbar_l149_1) begin
      _zz_wrGranted_0 = 1'b1;
    end
  end

  assign when_Axi4LiteCrossbar_l149 = _zz_when_Axi4LiteCrossbar_l149_4[0];
  assign when_Axi4LiteCrossbar_l149_1 = _zz_when_Axi4LiteCrossbar_l149_4[1];
  assign _zz_wrGranted_0_1 = (grantLock ? grantLockIdx : _zz_wrGranted_0);
  assign when_Axi4LiteCrossbar_l184 = (io_slaves_0_aw_valid && (! io_slaves_0_aw_ready));
  assign when_Axi4LiteCrossbar_l297 = (|_zz_when_Axi4LiteCrossbar_l297);
  assign when_Axi4LiteCrossbar_l301 = (_zz_wrGranted_0_1 == 1'b0);
  assign when_Axi4LiteCrossbar_l308 = (! wrDataDone_0);
  assign when_Axi4LiteCrossbar_l301_1 = (_zz_wrGranted_0_1 == 1'b1);
  assign when_Axi4LiteCrossbar_l308_1 = (! wrDataDone_0);
  assign io_slaves_0_aw_fire = (io_slaves_0_aw_valid && io_slaves_0_aw_ready);
  assign when_Axi4LiteCrossbar_l357 = (wrGranted_0 == 1'b0);
  assign when_Axi4LiteCrossbar_l358 = (! wrDataDone_0);
  assign when_Axi4LiteCrossbar_l357_1 = (wrGranted_0 == 1'b1);
  assign when_Axi4LiteCrossbar_l358_1 = (! wrDataDone_0);
  assign io_slaves_0_b_fire = (io_slaves_0_b_valid && io_slaves_0_b_ready);
  assign io_slaves_0_w_fire = (io_slaves_0_w_valid && io_slaves_0_w_ready);
  assign when_Axi4LiteCrossbar_l284_1 = (! wrActive_1);
  always @(*) begin
    _zz_when_Axi4LiteCrossbar_l297_4[0] = (io_masters_0_aw_payload_addr[31 : 16] == 16'h0);
    _zz_when_Axi4LiteCrossbar_l297_4[1] = (io_masters_0_aw_payload_addr[31 : 16] == 16'h0001);
    _zz_when_Axi4LiteCrossbar_l297_4[2] = (io_masters_0_aw_payload_addr[31 : 16] == 16'h0002);
    _zz_when_Axi4LiteCrossbar_l297_4[3] = (io_masters_0_aw_payload_addr[31 : 16] == 16'h0003);
  end

  always @(*) begin
    _zz_when_Axi4LiteCrossbar_l297_3[0] = ((io_masters_0_aw_valid && _zz__zz_when_Axi4LiteCrossbar_l297_3_1[1]) && (! ((((wrActive_0 && (wrGranted_0 == 1'b0)) || (wrActive_1 && (wrGranted_1 == 1'b0))) || ((wrActive_2 && (wrGranted_2 == 1'b0)) || (wrActive_3 && (wrGranted_3 == 1'b0)))) || (wrActive_4 && (wrGranted_4 == 1'b0)))));
    _zz_when_Axi4LiteCrossbar_l297_3[1] = ((io_masters_1_aw_valid && _zz__zz_when_Axi4LiteCrossbar_l297_3_2[1]) && (! ((((wrActive_0 && (wrGranted_0 == 1'b1)) || (wrActive_1 && (wrGranted_1 == 1'b1))) || ((wrActive_2 && (wrGranted_2 == 1'b1)) || (wrActive_3 && (wrGranted_3 == 1'b1)))) || (wrActive_4 && (wrGranted_4 == 1'b1)))));
  end

  always @(*) begin
    _zz_when_Axi4LiteCrossbar_l297_5[0] = (io_masters_1_aw_payload_addr[31 : 16] == 16'h0);
    _zz_when_Axi4LiteCrossbar_l297_5[1] = (io_masters_1_aw_payload_addr[31 : 16] == 16'h0001);
    _zz_when_Axi4LiteCrossbar_l297_5[2] = (io_masters_1_aw_payload_addr[31 : 16] == 16'h0002);
    _zz_when_Axi4LiteCrossbar_l297_5[3] = (io_masters_1_aw_payload_addr[31 : 16] == 16'h0003);
  end

  always @(*) begin
    _zz_when_Axi4LiteCrossbar_l149_5 = 2'b00;
    if(when_Axi4LiteCrossbar_l106_1) begin
      _zz_when_Axi4LiteCrossbar_l149_5 = 2'b01;
    end
  end

  assign when_Axi4LiteCrossbar_l106_1 = (1'b1 <= wrRrPtr_1);
  assign _zz_when_Axi4LiteCrossbar_l149_6 = (_zz_when_Axi4LiteCrossbar_l297_3 & (~ _zz_when_Axi4LiteCrossbar_l149_5));
  assign _zz_when_Axi4LiteCrossbar_l149_7 = _zz_when_Axi4LiteCrossbar_l149_6;
  assign _zz_when_Axi4LiteCrossbar_l149_8 = _zz_when_Axi4LiteCrossbar_l297_3;
  assign _zz_when_Axi4LiteCrossbar_l149_9 = ((|_zz_when_Axi4LiteCrossbar_l149_6) ? (_zz_when_Axi4LiteCrossbar_l149_7 & (~ _zz__zz_when_Axi4LiteCrossbar_l149_9)) : (_zz_when_Axi4LiteCrossbar_l149_8 & (~ _zz__zz_when_Axi4LiteCrossbar_l149_9_1)));
  always @(*) begin
    _zz_wrGranted_1 = 1'b0;
    if(when_Axi4LiteCrossbar_l149_2) begin
      _zz_wrGranted_1 = 1'b0;
    end
    if(when_Axi4LiteCrossbar_l149_3) begin
      _zz_wrGranted_1 = 1'b1;
    end
  end

  assign when_Axi4LiteCrossbar_l149_2 = _zz_when_Axi4LiteCrossbar_l149_9[0];
  assign when_Axi4LiteCrossbar_l149_3 = _zz_when_Axi4LiteCrossbar_l149_9[1];
  assign _zz_wrGranted_1_1 = (grantLock_1 ? grantLockIdx_1 : _zz_wrGranted_1);
  assign when_Axi4LiteCrossbar_l184_1 = (io_slaves_1_aw_valid && (! io_slaves_1_aw_ready));
  assign when_Axi4LiteCrossbar_l297_1 = (|_zz_when_Axi4LiteCrossbar_l297_3);
  assign when_Axi4LiteCrossbar_l301_2 = (_zz_wrGranted_1_1 == 1'b0);
  assign when_Axi4LiteCrossbar_l308_2 = (! wrDataDone_1);
  assign when_Axi4LiteCrossbar_l301_3 = (_zz_wrGranted_1_1 == 1'b1);
  assign when_Axi4LiteCrossbar_l308_3 = (! wrDataDone_1);
  assign io_slaves_1_aw_fire = (io_slaves_1_aw_valid && io_slaves_1_aw_ready);
  assign when_Axi4LiteCrossbar_l357_2 = (wrGranted_1 == 1'b0);
  assign when_Axi4LiteCrossbar_l358_2 = (! wrDataDone_1);
  assign when_Axi4LiteCrossbar_l357_3 = (wrGranted_1 == 1'b1);
  assign when_Axi4LiteCrossbar_l358_3 = (! wrDataDone_1);
  assign io_slaves_1_b_fire = (io_slaves_1_b_valid && io_slaves_1_b_ready);
  assign io_slaves_1_w_fire = (io_slaves_1_w_valid && io_slaves_1_w_ready);
  assign when_Axi4LiteCrossbar_l284_2 = (! wrActive_2);
  always @(*) begin
    _zz_when_Axi4LiteCrossbar_l297_7[0] = (io_masters_0_aw_payload_addr[31 : 16] == 16'h0);
    _zz_when_Axi4LiteCrossbar_l297_7[1] = (io_masters_0_aw_payload_addr[31 : 16] == 16'h0001);
    _zz_when_Axi4LiteCrossbar_l297_7[2] = (io_masters_0_aw_payload_addr[31 : 16] == 16'h0002);
    _zz_when_Axi4LiteCrossbar_l297_7[3] = (io_masters_0_aw_payload_addr[31 : 16] == 16'h0003);
  end

  always @(*) begin
    _zz_when_Axi4LiteCrossbar_l297_6[0] = ((io_masters_0_aw_valid && _zz__zz_when_Axi4LiteCrossbar_l297_6[2]) && (! ((((wrActive_0 && (wrGranted_0 == 1'b0)) || (wrActive_1 && (wrGranted_1 == 1'b0))) || ((wrActive_2 && (wrGranted_2 == 1'b0)) || (wrActive_3 && (wrGranted_3 == 1'b0)))) || (wrActive_4 && (wrGranted_4 == 1'b0)))));
    _zz_when_Axi4LiteCrossbar_l297_6[1] = ((io_masters_1_aw_valid && _zz__zz_when_Axi4LiteCrossbar_l297_6_1[2]) && (! ((((wrActive_0 && (wrGranted_0 == 1'b1)) || (wrActive_1 && (wrGranted_1 == 1'b1))) || ((wrActive_2 && (wrGranted_2 == 1'b1)) || (wrActive_3 && (wrGranted_3 == 1'b1)))) || (wrActive_4 && (wrGranted_4 == 1'b1)))));
  end

  always @(*) begin
    _zz_when_Axi4LiteCrossbar_l297_8[0] = (io_masters_1_aw_payload_addr[31 : 16] == 16'h0);
    _zz_when_Axi4LiteCrossbar_l297_8[1] = (io_masters_1_aw_payload_addr[31 : 16] == 16'h0001);
    _zz_when_Axi4LiteCrossbar_l297_8[2] = (io_masters_1_aw_payload_addr[31 : 16] == 16'h0002);
    _zz_when_Axi4LiteCrossbar_l297_8[3] = (io_masters_1_aw_payload_addr[31 : 16] == 16'h0003);
  end

  always @(*) begin
    _zz_when_Axi4LiteCrossbar_l149_10 = 2'b00;
    if(when_Axi4LiteCrossbar_l106_2) begin
      _zz_when_Axi4LiteCrossbar_l149_10 = 2'b01;
    end
  end

  assign when_Axi4LiteCrossbar_l106_2 = (1'b1 <= wrRrPtr_2);
  assign _zz_when_Axi4LiteCrossbar_l149_11 = (_zz_when_Axi4LiteCrossbar_l297_6 & (~ _zz_when_Axi4LiteCrossbar_l149_10));
  assign _zz_when_Axi4LiteCrossbar_l149_12 = _zz_when_Axi4LiteCrossbar_l149_11;
  assign _zz_when_Axi4LiteCrossbar_l149_13 = _zz_when_Axi4LiteCrossbar_l297_6;
  assign _zz_when_Axi4LiteCrossbar_l149_14 = ((|_zz_when_Axi4LiteCrossbar_l149_11) ? (_zz_when_Axi4LiteCrossbar_l149_12 & (~ _zz__zz_when_Axi4LiteCrossbar_l149_14)) : (_zz_when_Axi4LiteCrossbar_l149_13 & (~ _zz__zz_when_Axi4LiteCrossbar_l149_14_1)));
  always @(*) begin
    _zz_wrGranted_2 = 1'b0;
    if(when_Axi4LiteCrossbar_l149_4) begin
      _zz_wrGranted_2 = 1'b0;
    end
    if(when_Axi4LiteCrossbar_l149_5) begin
      _zz_wrGranted_2 = 1'b1;
    end
  end

  assign when_Axi4LiteCrossbar_l149_4 = _zz_when_Axi4LiteCrossbar_l149_14[0];
  assign when_Axi4LiteCrossbar_l149_5 = _zz_when_Axi4LiteCrossbar_l149_14[1];
  assign _zz_wrGranted_2_1 = (grantLock_2 ? grantLockIdx_2 : _zz_wrGranted_2);
  assign when_Axi4LiteCrossbar_l184_2 = (io_slaves_2_aw_valid && (! io_slaves_2_aw_ready));
  assign when_Axi4LiteCrossbar_l297_2 = (|_zz_when_Axi4LiteCrossbar_l297_6);
  assign when_Axi4LiteCrossbar_l301_4 = (_zz_wrGranted_2_1 == 1'b0);
  assign when_Axi4LiteCrossbar_l308_4 = (! wrDataDone_2);
  assign when_Axi4LiteCrossbar_l301_5 = (_zz_wrGranted_2_1 == 1'b1);
  assign when_Axi4LiteCrossbar_l308_5 = (! wrDataDone_2);
  assign io_slaves_2_aw_fire = (io_slaves_2_aw_valid && io_slaves_2_aw_ready);
  assign when_Axi4LiteCrossbar_l357_4 = (wrGranted_2 == 1'b0);
  assign when_Axi4LiteCrossbar_l358_4 = (! wrDataDone_2);
  assign when_Axi4LiteCrossbar_l357_5 = (wrGranted_2 == 1'b1);
  assign when_Axi4LiteCrossbar_l358_5 = (! wrDataDone_2);
  assign io_slaves_2_b_fire = (io_slaves_2_b_valid && io_slaves_2_b_ready);
  assign io_slaves_2_w_fire = (io_slaves_2_w_valid && io_slaves_2_w_ready);
  assign when_Axi4LiteCrossbar_l284_3 = (! wrActive_3);
  always @(*) begin
    _zz_when_Axi4LiteCrossbar_l297_10[0] = (io_masters_0_aw_payload_addr[31 : 16] == 16'h0);
    _zz_when_Axi4LiteCrossbar_l297_10[1] = (io_masters_0_aw_payload_addr[31 : 16] == 16'h0001);
    _zz_when_Axi4LiteCrossbar_l297_10[2] = (io_masters_0_aw_payload_addr[31 : 16] == 16'h0002);
    _zz_when_Axi4LiteCrossbar_l297_10[3] = (io_masters_0_aw_payload_addr[31 : 16] == 16'h0003);
  end

  always @(*) begin
    _zz_when_Axi4LiteCrossbar_l297_9[0] = ((io_masters_0_aw_valid && _zz__zz_when_Axi4LiteCrossbar_l297_9[3]) && (! ((((wrActive_0 && (wrGranted_0 == 1'b0)) || (wrActive_1 && (wrGranted_1 == 1'b0))) || ((wrActive_2 && (wrGranted_2 == 1'b0)) || (wrActive_3 && (wrGranted_3 == 1'b0)))) || (wrActive_4 && (wrGranted_4 == 1'b0)))));
    _zz_when_Axi4LiteCrossbar_l297_9[1] = ((io_masters_1_aw_valid && _zz__zz_when_Axi4LiteCrossbar_l297_9_1[3]) && (! ((((wrActive_0 && (wrGranted_0 == 1'b1)) || (wrActive_1 && (wrGranted_1 == 1'b1))) || ((wrActive_2 && (wrGranted_2 == 1'b1)) || (wrActive_3 && (wrGranted_3 == 1'b1)))) || (wrActive_4 && (wrGranted_4 == 1'b1)))));
  end

  always @(*) begin
    _zz_when_Axi4LiteCrossbar_l297_11[0] = (io_masters_1_aw_payload_addr[31 : 16] == 16'h0);
    _zz_when_Axi4LiteCrossbar_l297_11[1] = (io_masters_1_aw_payload_addr[31 : 16] == 16'h0001);
    _zz_when_Axi4LiteCrossbar_l297_11[2] = (io_masters_1_aw_payload_addr[31 : 16] == 16'h0002);
    _zz_when_Axi4LiteCrossbar_l297_11[3] = (io_masters_1_aw_payload_addr[31 : 16] == 16'h0003);
  end

  always @(*) begin
    _zz_when_Axi4LiteCrossbar_l149_15 = 2'b00;
    if(when_Axi4LiteCrossbar_l106_3) begin
      _zz_when_Axi4LiteCrossbar_l149_15 = 2'b01;
    end
  end

  assign when_Axi4LiteCrossbar_l106_3 = (1'b1 <= wrRrPtr_3);
  assign _zz_when_Axi4LiteCrossbar_l149_16 = (_zz_when_Axi4LiteCrossbar_l297_9 & (~ _zz_when_Axi4LiteCrossbar_l149_15));
  assign _zz_when_Axi4LiteCrossbar_l149_17 = _zz_when_Axi4LiteCrossbar_l149_16;
  assign _zz_when_Axi4LiteCrossbar_l149_18 = _zz_when_Axi4LiteCrossbar_l297_9;
  assign _zz_when_Axi4LiteCrossbar_l149_19 = ((|_zz_when_Axi4LiteCrossbar_l149_16) ? (_zz_when_Axi4LiteCrossbar_l149_17 & (~ _zz__zz_when_Axi4LiteCrossbar_l149_19)) : (_zz_when_Axi4LiteCrossbar_l149_18 & (~ _zz__zz_when_Axi4LiteCrossbar_l149_19_1)));
  always @(*) begin
    _zz_wrGranted_3 = 1'b0;
    if(when_Axi4LiteCrossbar_l149_6) begin
      _zz_wrGranted_3 = 1'b0;
    end
    if(when_Axi4LiteCrossbar_l149_7) begin
      _zz_wrGranted_3 = 1'b1;
    end
  end

  assign when_Axi4LiteCrossbar_l149_6 = _zz_when_Axi4LiteCrossbar_l149_19[0];
  assign when_Axi4LiteCrossbar_l149_7 = _zz_when_Axi4LiteCrossbar_l149_19[1];
  assign _zz_wrGranted_3_1 = (grantLock_3 ? grantLockIdx_3 : _zz_wrGranted_3);
  assign when_Axi4LiteCrossbar_l184_3 = (io_slaves_3_aw_valid && (! io_slaves_3_aw_ready));
  assign when_Axi4LiteCrossbar_l297_3 = (|_zz_when_Axi4LiteCrossbar_l297_9);
  assign when_Axi4LiteCrossbar_l301_6 = (_zz_wrGranted_3_1 == 1'b0);
  assign when_Axi4LiteCrossbar_l308_6 = (! wrDataDone_3);
  assign when_Axi4LiteCrossbar_l301_7 = (_zz_wrGranted_3_1 == 1'b1);
  assign when_Axi4LiteCrossbar_l308_7 = (! wrDataDone_3);
  assign io_slaves_3_aw_fire = (io_slaves_3_aw_valid && io_slaves_3_aw_ready);
  assign when_Axi4LiteCrossbar_l357_6 = (wrGranted_3 == 1'b0);
  assign when_Axi4LiteCrossbar_l358_6 = (! wrDataDone_3);
  assign when_Axi4LiteCrossbar_l357_7 = (wrGranted_3 == 1'b1);
  assign when_Axi4LiteCrossbar_l358_7 = (! wrDataDone_3);
  assign io_slaves_3_b_fire = (io_slaves_3_b_valid && io_slaves_3_b_ready);
  assign io_slaves_3_w_fire = (io_slaves_3_w_valid && io_slaves_3_w_ready);
  assign when_Axi4LiteCrossbar_l284_4 = (! wrActive_4);
  always @(*) begin
    _zz_when_Axi4LiteCrossbar_l297_13[0] = (io_masters_0_aw_payload_addr[31 : 16] == 16'h0);
    _zz_when_Axi4LiteCrossbar_l297_13[1] = (io_masters_0_aw_payload_addr[31 : 16] == 16'h0001);
    _zz_when_Axi4LiteCrossbar_l297_13[2] = (io_masters_0_aw_payload_addr[31 : 16] == 16'h0002);
    _zz_when_Axi4LiteCrossbar_l297_13[3] = (io_masters_0_aw_payload_addr[31 : 16] == 16'h0003);
  end

  always @(*) begin
    _zz_when_Axi4LiteCrossbar_l297_12[0] = ((io_masters_0_aw_valid && _zz__zz_when_Axi4LiteCrossbar_l297_12[4]) && (! ((((wrActive_0 && (wrGranted_0 == 1'b0)) || (wrActive_1 && (wrGranted_1 == 1'b0))) || ((wrActive_2 && (wrGranted_2 == 1'b0)) || (wrActive_3 && (wrGranted_3 == 1'b0)))) || (wrActive_4 && (wrGranted_4 == 1'b0)))));
    _zz_when_Axi4LiteCrossbar_l297_12[1] = ((io_masters_1_aw_valid && _zz__zz_when_Axi4LiteCrossbar_l297_12_1[4]) && (! ((((wrActive_0 && (wrGranted_0 == 1'b1)) || (wrActive_1 && (wrGranted_1 == 1'b1))) || ((wrActive_2 && (wrGranted_2 == 1'b1)) || (wrActive_3 && (wrGranted_3 == 1'b1)))) || (wrActive_4 && (wrGranted_4 == 1'b1)))));
  end

  always @(*) begin
    _zz_when_Axi4LiteCrossbar_l297_14[0] = (io_masters_1_aw_payload_addr[31 : 16] == 16'h0);
    _zz_when_Axi4LiteCrossbar_l297_14[1] = (io_masters_1_aw_payload_addr[31 : 16] == 16'h0001);
    _zz_when_Axi4LiteCrossbar_l297_14[2] = (io_masters_1_aw_payload_addr[31 : 16] == 16'h0002);
    _zz_when_Axi4LiteCrossbar_l297_14[3] = (io_masters_1_aw_payload_addr[31 : 16] == 16'h0003);
  end

  always @(*) begin
    _zz_when_Axi4LiteCrossbar_l149_20 = 2'b00;
    if(when_Axi4LiteCrossbar_l106_4) begin
      _zz_when_Axi4LiteCrossbar_l149_20 = 2'b01;
    end
  end

  assign when_Axi4LiteCrossbar_l106_4 = (1'b1 <= wrRrPtr_4);
  assign _zz_when_Axi4LiteCrossbar_l149_21 = (_zz_when_Axi4LiteCrossbar_l297_12 & (~ _zz_when_Axi4LiteCrossbar_l149_20));
  assign _zz_when_Axi4LiteCrossbar_l149_22 = _zz_when_Axi4LiteCrossbar_l149_21;
  assign _zz_when_Axi4LiteCrossbar_l149_23 = _zz_when_Axi4LiteCrossbar_l297_12;
  assign _zz_when_Axi4LiteCrossbar_l149_24 = ((|_zz_when_Axi4LiteCrossbar_l149_21) ? (_zz_when_Axi4LiteCrossbar_l149_22 & (~ _zz__zz_when_Axi4LiteCrossbar_l149_24)) : (_zz_when_Axi4LiteCrossbar_l149_23 & (~ _zz__zz_when_Axi4LiteCrossbar_l149_24_1)));
  always @(*) begin
    _zz_wrGranted_4 = 1'b0;
    if(when_Axi4LiteCrossbar_l149_8) begin
      _zz_wrGranted_4 = 1'b0;
    end
    if(when_Axi4LiteCrossbar_l149_9) begin
      _zz_wrGranted_4 = 1'b1;
    end
  end

  assign when_Axi4LiteCrossbar_l149_8 = _zz_when_Axi4LiteCrossbar_l149_24[0];
  assign when_Axi4LiteCrossbar_l149_9 = _zz_when_Axi4LiteCrossbar_l149_24[1];
  assign _zz_wrGranted_4_1 = (grantLock_4 ? grantLockIdx_4 : _zz_wrGranted_4);
  assign when_Axi4LiteCrossbar_l184_4 = (decErr_io_axi_aw_valid && (! decErr_io_axi_aw_ready));
  assign when_Axi4LiteCrossbar_l297_4 = (|_zz_when_Axi4LiteCrossbar_l297_12);
  assign when_Axi4LiteCrossbar_l301_8 = (_zz_wrGranted_4_1 == 1'b0);
  assign when_Axi4LiteCrossbar_l308_8 = (! wrDataDone_4);
  assign when_Axi4LiteCrossbar_l301_9 = (_zz_wrGranted_4_1 == 1'b1);
  assign when_Axi4LiteCrossbar_l308_9 = (! wrDataDone_4);
  assign decErr_io_axi_aw_fire = (decErr_io_axi_aw_valid && decErr_io_axi_aw_ready);
  assign when_Axi4LiteCrossbar_l357_8 = (wrGranted_4 == 1'b0);
  assign when_Axi4LiteCrossbar_l358_8 = (! wrDataDone_4);
  assign when_Axi4LiteCrossbar_l357_9 = (wrGranted_4 == 1'b1);
  assign when_Axi4LiteCrossbar_l358_9 = (! wrDataDone_4);
  assign decErr_io_axi_b_fire = (decErr_io_axi_b_valid && decErr_io_axi_b_ready);
  assign decErr_io_axi_w_fire = (decErr_io_axi_w_valid && decErr_io_axi_w_ready);
  assign when_Axi4LiteCrossbar_l388 = (! rdActive_0);
  always @(*) begin
    _zz_when_Axi4LiteCrossbar_l400_1[0] = (io_masters_0_ar_payload_addr[31 : 16] == 16'h0);
    _zz_when_Axi4LiteCrossbar_l400_1[1] = (io_masters_0_ar_payload_addr[31 : 16] == 16'h0001);
    _zz_when_Axi4LiteCrossbar_l400_1[2] = (io_masters_0_ar_payload_addr[31 : 16] == 16'h0002);
    _zz_when_Axi4LiteCrossbar_l400_1[3] = (io_masters_0_ar_payload_addr[31 : 16] == 16'h0003);
  end

  always @(*) begin
    _zz_when_Axi4LiteCrossbar_l400[0] = ((io_masters_0_ar_valid && _zz__zz_when_Axi4LiteCrossbar_l400[0]) && (! ((((rdActive_0 && (rdGranted_0 == _zz__zz_when_Axi4LiteCrossbar_l400_1)) || (rdActive_1 && (rdGranted_1 == _zz__zz_when_Axi4LiteCrossbar_l400_2))) || ((rdActive_2 && (rdGranted_2 == _zz__zz_when_Axi4LiteCrossbar_l400_3)) || (rdActive_3 && (rdGranted_3 == _zz__zz_when_Axi4LiteCrossbar_l400_4)))) || (rdActive_4 && (rdGranted_4 == 1'b0)))));
    _zz_when_Axi4LiteCrossbar_l400[1] = ((io_masters_1_ar_valid && _zz__zz_when_Axi4LiteCrossbar_l400_5[0]) && (! ((((rdActive_0 && (rdGranted_0 == 1'b1)) || (rdActive_1 && (rdGranted_1 == 1'b1))) || ((rdActive_2 && (rdGranted_2 == 1'b1)) || (rdActive_3 && (rdGranted_3 == 1'b1)))) || (rdActive_4 && (rdGranted_4 == 1'b1)))));
  end

  always @(*) begin
    _zz_when_Axi4LiteCrossbar_l400_2[0] = (io_masters_1_ar_payload_addr[31 : 16] == 16'h0);
    _zz_when_Axi4LiteCrossbar_l400_2[1] = (io_masters_1_ar_payload_addr[31 : 16] == 16'h0001);
    _zz_when_Axi4LiteCrossbar_l400_2[2] = (io_masters_1_ar_payload_addr[31 : 16] == 16'h0002);
    _zz_when_Axi4LiteCrossbar_l400_2[3] = (io_masters_1_ar_payload_addr[31 : 16] == 16'h0003);
  end

  always @(*) begin
    _zz_when_Axi4LiteCrossbar_l149_25 = 2'b00;
    if(when_Axi4LiteCrossbar_l106_5) begin
      _zz_when_Axi4LiteCrossbar_l149_25 = 2'b01;
    end
  end

  assign when_Axi4LiteCrossbar_l106_5 = (1'b1 <= rdRrPtr_0);
  assign _zz_when_Axi4LiteCrossbar_l149_26 = (_zz_when_Axi4LiteCrossbar_l400 & (~ _zz_when_Axi4LiteCrossbar_l149_25));
  assign _zz_when_Axi4LiteCrossbar_l149_27 = _zz_when_Axi4LiteCrossbar_l149_26;
  assign _zz_when_Axi4LiteCrossbar_l149_28 = _zz_when_Axi4LiteCrossbar_l400;
  assign _zz_when_Axi4LiteCrossbar_l149_29 = ((|_zz_when_Axi4LiteCrossbar_l149_26) ? (_zz_when_Axi4LiteCrossbar_l149_27 & (~ _zz__zz_when_Axi4LiteCrossbar_l149_29)) : (_zz_when_Axi4LiteCrossbar_l149_28 & (~ _zz__zz_when_Axi4LiteCrossbar_l149_29_1)));
  always @(*) begin
    _zz_rdGranted_0 = 1'b0;
    if(when_Axi4LiteCrossbar_l149_10) begin
      _zz_rdGranted_0 = 1'b0;
    end
    if(when_Axi4LiteCrossbar_l149_11) begin
      _zz_rdGranted_0 = 1'b1;
    end
  end

  assign when_Axi4LiteCrossbar_l149_10 = _zz_when_Axi4LiteCrossbar_l149_29[0];
  assign when_Axi4LiteCrossbar_l149_11 = _zz_when_Axi4LiteCrossbar_l149_29[1];
  assign _zz_rdGranted_0_1 = (grantLock_5 ? grantLockIdx_5 : _zz_rdGranted_0);
  assign when_Axi4LiteCrossbar_l184_5 = (io_slaves_0_ar_valid && (! io_slaves_0_ar_ready));
  assign when_Axi4LiteCrossbar_l400 = (|_zz_when_Axi4LiteCrossbar_l400);
  assign when_Axi4LiteCrossbar_l403 = (_zz_rdGranted_0_1 == 1'b0);
  assign when_Axi4LiteCrossbar_l403_1 = (_zz_rdGranted_0_1 == 1'b1);
  assign io_slaves_0_ar_fire = (io_slaves_0_ar_valid && io_slaves_0_ar_ready);
  assign when_Axi4LiteCrossbar_l446 = (rdGranted_0 == 1'b0);
  assign when_Axi4LiteCrossbar_l446_1 = (rdGranted_0 == 1'b1);
  assign io_slaves_0_r_fire = (io_slaves_0_r_valid && io_slaves_0_r_ready);
  assign when_Axi4LiteCrossbar_l388_1 = (! rdActive_1);
  always @(*) begin
    _zz_when_Axi4LiteCrossbar_l400_4[0] = (io_masters_0_ar_payload_addr[31 : 16] == 16'h0);
    _zz_when_Axi4LiteCrossbar_l400_4[1] = (io_masters_0_ar_payload_addr[31 : 16] == 16'h0001);
    _zz_when_Axi4LiteCrossbar_l400_4[2] = (io_masters_0_ar_payload_addr[31 : 16] == 16'h0002);
    _zz_when_Axi4LiteCrossbar_l400_4[3] = (io_masters_0_ar_payload_addr[31 : 16] == 16'h0003);
  end

  always @(*) begin
    _zz_when_Axi4LiteCrossbar_l400_3[0] = ((io_masters_0_ar_valid && _zz__zz_when_Axi4LiteCrossbar_l400_3_1[1]) && (! ((((rdActive_0 && (rdGranted_0 == 1'b0)) || (rdActive_1 && (rdGranted_1 == 1'b0))) || ((rdActive_2 && (rdGranted_2 == 1'b0)) || (rdActive_3 && (rdGranted_3 == 1'b0)))) || (rdActive_4 && (rdGranted_4 == 1'b0)))));
    _zz_when_Axi4LiteCrossbar_l400_3[1] = ((io_masters_1_ar_valid && _zz__zz_when_Axi4LiteCrossbar_l400_3_2[1]) && (! ((((rdActive_0 && (rdGranted_0 == 1'b1)) || (rdActive_1 && (rdGranted_1 == 1'b1))) || ((rdActive_2 && (rdGranted_2 == 1'b1)) || (rdActive_3 && (rdGranted_3 == 1'b1)))) || (rdActive_4 && (rdGranted_4 == 1'b1)))));
  end

  always @(*) begin
    _zz_when_Axi4LiteCrossbar_l400_5[0] = (io_masters_1_ar_payload_addr[31 : 16] == 16'h0);
    _zz_when_Axi4LiteCrossbar_l400_5[1] = (io_masters_1_ar_payload_addr[31 : 16] == 16'h0001);
    _zz_when_Axi4LiteCrossbar_l400_5[2] = (io_masters_1_ar_payload_addr[31 : 16] == 16'h0002);
    _zz_when_Axi4LiteCrossbar_l400_5[3] = (io_masters_1_ar_payload_addr[31 : 16] == 16'h0003);
  end

  always @(*) begin
    _zz_when_Axi4LiteCrossbar_l149_30 = 2'b00;
    if(when_Axi4LiteCrossbar_l106_6) begin
      _zz_when_Axi4LiteCrossbar_l149_30 = 2'b01;
    end
  end

  assign when_Axi4LiteCrossbar_l106_6 = (1'b1 <= rdRrPtr_1);
  assign _zz_when_Axi4LiteCrossbar_l149_31 = (_zz_when_Axi4LiteCrossbar_l400_3 & (~ _zz_when_Axi4LiteCrossbar_l149_30));
  assign _zz_when_Axi4LiteCrossbar_l149_32 = _zz_when_Axi4LiteCrossbar_l149_31;
  assign _zz_when_Axi4LiteCrossbar_l149_33 = _zz_when_Axi4LiteCrossbar_l400_3;
  assign _zz_when_Axi4LiteCrossbar_l149_34 = ((|_zz_when_Axi4LiteCrossbar_l149_31) ? (_zz_when_Axi4LiteCrossbar_l149_32 & (~ _zz__zz_when_Axi4LiteCrossbar_l149_34)) : (_zz_when_Axi4LiteCrossbar_l149_33 & (~ _zz__zz_when_Axi4LiteCrossbar_l149_34_1)));
  always @(*) begin
    _zz_rdGranted_1 = 1'b0;
    if(when_Axi4LiteCrossbar_l149_12) begin
      _zz_rdGranted_1 = 1'b0;
    end
    if(when_Axi4LiteCrossbar_l149_13) begin
      _zz_rdGranted_1 = 1'b1;
    end
  end

  assign when_Axi4LiteCrossbar_l149_12 = _zz_when_Axi4LiteCrossbar_l149_34[0];
  assign when_Axi4LiteCrossbar_l149_13 = _zz_when_Axi4LiteCrossbar_l149_34[1];
  assign _zz_rdGranted_1_1 = (grantLock_6 ? grantLockIdx_6 : _zz_rdGranted_1);
  assign when_Axi4LiteCrossbar_l184_6 = (io_slaves_1_ar_valid && (! io_slaves_1_ar_ready));
  assign when_Axi4LiteCrossbar_l400_1 = (|_zz_when_Axi4LiteCrossbar_l400_3);
  assign when_Axi4LiteCrossbar_l403_2 = (_zz_rdGranted_1_1 == 1'b0);
  assign when_Axi4LiteCrossbar_l403_3 = (_zz_rdGranted_1_1 == 1'b1);
  assign io_slaves_1_ar_fire = (io_slaves_1_ar_valid && io_slaves_1_ar_ready);
  assign when_Axi4LiteCrossbar_l446_2 = (rdGranted_1 == 1'b0);
  assign when_Axi4LiteCrossbar_l446_3 = (rdGranted_1 == 1'b1);
  assign io_slaves_1_r_fire = (io_slaves_1_r_valid && io_slaves_1_r_ready);
  assign when_Axi4LiteCrossbar_l388_2 = (! rdActive_2);
  always @(*) begin
    _zz_when_Axi4LiteCrossbar_l400_7[0] = (io_masters_0_ar_payload_addr[31 : 16] == 16'h0);
    _zz_when_Axi4LiteCrossbar_l400_7[1] = (io_masters_0_ar_payload_addr[31 : 16] == 16'h0001);
    _zz_when_Axi4LiteCrossbar_l400_7[2] = (io_masters_0_ar_payload_addr[31 : 16] == 16'h0002);
    _zz_when_Axi4LiteCrossbar_l400_7[3] = (io_masters_0_ar_payload_addr[31 : 16] == 16'h0003);
  end

  always @(*) begin
    _zz_when_Axi4LiteCrossbar_l400_6[0] = ((io_masters_0_ar_valid && _zz__zz_when_Axi4LiteCrossbar_l400_6[2]) && (! ((((rdActive_0 && (rdGranted_0 == 1'b0)) || (rdActive_1 && (rdGranted_1 == 1'b0))) || ((rdActive_2 && (rdGranted_2 == 1'b0)) || (rdActive_3 && (rdGranted_3 == 1'b0)))) || (rdActive_4 && (rdGranted_4 == 1'b0)))));
    _zz_when_Axi4LiteCrossbar_l400_6[1] = ((io_masters_1_ar_valid && _zz__zz_when_Axi4LiteCrossbar_l400_6_1[2]) && (! ((((rdActive_0 && (rdGranted_0 == 1'b1)) || (rdActive_1 && (rdGranted_1 == 1'b1))) || ((rdActive_2 && (rdGranted_2 == 1'b1)) || (rdActive_3 && (rdGranted_3 == 1'b1)))) || (rdActive_4 && (rdGranted_4 == 1'b1)))));
  end

  always @(*) begin
    _zz_when_Axi4LiteCrossbar_l400_8[0] = (io_masters_1_ar_payload_addr[31 : 16] == 16'h0);
    _zz_when_Axi4LiteCrossbar_l400_8[1] = (io_masters_1_ar_payload_addr[31 : 16] == 16'h0001);
    _zz_when_Axi4LiteCrossbar_l400_8[2] = (io_masters_1_ar_payload_addr[31 : 16] == 16'h0002);
    _zz_when_Axi4LiteCrossbar_l400_8[3] = (io_masters_1_ar_payload_addr[31 : 16] == 16'h0003);
  end

  always @(*) begin
    _zz_when_Axi4LiteCrossbar_l149_35 = 2'b00;
    if(when_Axi4LiteCrossbar_l106_7) begin
      _zz_when_Axi4LiteCrossbar_l149_35 = 2'b01;
    end
  end

  assign when_Axi4LiteCrossbar_l106_7 = (1'b1 <= rdRrPtr_2);
  assign _zz_when_Axi4LiteCrossbar_l149_36 = (_zz_when_Axi4LiteCrossbar_l400_6 & (~ _zz_when_Axi4LiteCrossbar_l149_35));
  assign _zz_when_Axi4LiteCrossbar_l149_37 = _zz_when_Axi4LiteCrossbar_l149_36;
  assign _zz_when_Axi4LiteCrossbar_l149_38 = _zz_when_Axi4LiteCrossbar_l400_6;
  assign _zz_when_Axi4LiteCrossbar_l149_39 = ((|_zz_when_Axi4LiteCrossbar_l149_36) ? (_zz_when_Axi4LiteCrossbar_l149_37 & (~ _zz__zz_when_Axi4LiteCrossbar_l149_39)) : (_zz_when_Axi4LiteCrossbar_l149_38 & (~ _zz__zz_when_Axi4LiteCrossbar_l149_39_1)));
  always @(*) begin
    _zz_rdGranted_2 = 1'b0;
    if(when_Axi4LiteCrossbar_l149_14) begin
      _zz_rdGranted_2 = 1'b0;
    end
    if(when_Axi4LiteCrossbar_l149_15) begin
      _zz_rdGranted_2 = 1'b1;
    end
  end

  assign when_Axi4LiteCrossbar_l149_14 = _zz_when_Axi4LiteCrossbar_l149_39[0];
  assign when_Axi4LiteCrossbar_l149_15 = _zz_when_Axi4LiteCrossbar_l149_39[1];
  assign _zz_rdGranted_2_1 = (grantLock_7 ? grantLockIdx_7 : _zz_rdGranted_2);
  assign when_Axi4LiteCrossbar_l184_7 = (io_slaves_2_ar_valid && (! io_slaves_2_ar_ready));
  assign when_Axi4LiteCrossbar_l400_2 = (|_zz_when_Axi4LiteCrossbar_l400_6);
  assign when_Axi4LiteCrossbar_l403_4 = (_zz_rdGranted_2_1 == 1'b0);
  assign when_Axi4LiteCrossbar_l403_5 = (_zz_rdGranted_2_1 == 1'b1);
  assign io_slaves_2_ar_fire = (io_slaves_2_ar_valid && io_slaves_2_ar_ready);
  assign when_Axi4LiteCrossbar_l446_4 = (rdGranted_2 == 1'b0);
  assign when_Axi4LiteCrossbar_l446_5 = (rdGranted_2 == 1'b1);
  assign io_slaves_2_r_fire = (io_slaves_2_r_valid && io_slaves_2_r_ready);
  assign when_Axi4LiteCrossbar_l388_3 = (! rdActive_3);
  always @(*) begin
    _zz_when_Axi4LiteCrossbar_l400_10[0] = (io_masters_0_ar_payload_addr[31 : 16] == 16'h0);
    _zz_when_Axi4LiteCrossbar_l400_10[1] = (io_masters_0_ar_payload_addr[31 : 16] == 16'h0001);
    _zz_when_Axi4LiteCrossbar_l400_10[2] = (io_masters_0_ar_payload_addr[31 : 16] == 16'h0002);
    _zz_when_Axi4LiteCrossbar_l400_10[3] = (io_masters_0_ar_payload_addr[31 : 16] == 16'h0003);
  end

  always @(*) begin
    _zz_when_Axi4LiteCrossbar_l400_9[0] = ((io_masters_0_ar_valid && _zz__zz_when_Axi4LiteCrossbar_l400_9[3]) && (! ((((rdActive_0 && (rdGranted_0 == 1'b0)) || (rdActive_1 && (rdGranted_1 == 1'b0))) || ((rdActive_2 && (rdGranted_2 == 1'b0)) || (rdActive_3 && (rdGranted_3 == 1'b0)))) || (rdActive_4 && (rdGranted_4 == 1'b0)))));
    _zz_when_Axi4LiteCrossbar_l400_9[1] = ((io_masters_1_ar_valid && _zz__zz_when_Axi4LiteCrossbar_l400_9_1[3]) && (! ((((rdActive_0 && (rdGranted_0 == 1'b1)) || (rdActive_1 && (rdGranted_1 == 1'b1))) || ((rdActive_2 && (rdGranted_2 == 1'b1)) || (rdActive_3 && (rdGranted_3 == 1'b1)))) || (rdActive_4 && (rdGranted_4 == 1'b1)))));
  end

  always @(*) begin
    _zz_when_Axi4LiteCrossbar_l400_11[0] = (io_masters_1_ar_payload_addr[31 : 16] == 16'h0);
    _zz_when_Axi4LiteCrossbar_l400_11[1] = (io_masters_1_ar_payload_addr[31 : 16] == 16'h0001);
    _zz_when_Axi4LiteCrossbar_l400_11[2] = (io_masters_1_ar_payload_addr[31 : 16] == 16'h0002);
    _zz_when_Axi4LiteCrossbar_l400_11[3] = (io_masters_1_ar_payload_addr[31 : 16] == 16'h0003);
  end

  always @(*) begin
    _zz_when_Axi4LiteCrossbar_l149_40 = 2'b00;
    if(when_Axi4LiteCrossbar_l106_8) begin
      _zz_when_Axi4LiteCrossbar_l149_40 = 2'b01;
    end
  end

  assign when_Axi4LiteCrossbar_l106_8 = (1'b1 <= rdRrPtr_3);
  assign _zz_when_Axi4LiteCrossbar_l149_41 = (_zz_when_Axi4LiteCrossbar_l400_9 & (~ _zz_when_Axi4LiteCrossbar_l149_40));
  assign _zz_when_Axi4LiteCrossbar_l149_42 = _zz_when_Axi4LiteCrossbar_l149_41;
  assign _zz_when_Axi4LiteCrossbar_l149_43 = _zz_when_Axi4LiteCrossbar_l400_9;
  assign _zz_when_Axi4LiteCrossbar_l149_44 = ((|_zz_when_Axi4LiteCrossbar_l149_41) ? (_zz_when_Axi4LiteCrossbar_l149_42 & (~ _zz__zz_when_Axi4LiteCrossbar_l149_44)) : (_zz_when_Axi4LiteCrossbar_l149_43 & (~ _zz__zz_when_Axi4LiteCrossbar_l149_44_1)));
  always @(*) begin
    _zz_rdGranted_3 = 1'b0;
    if(when_Axi4LiteCrossbar_l149_16) begin
      _zz_rdGranted_3 = 1'b0;
    end
    if(when_Axi4LiteCrossbar_l149_17) begin
      _zz_rdGranted_3 = 1'b1;
    end
  end

  assign when_Axi4LiteCrossbar_l149_16 = _zz_when_Axi4LiteCrossbar_l149_44[0];
  assign when_Axi4LiteCrossbar_l149_17 = _zz_when_Axi4LiteCrossbar_l149_44[1];
  assign _zz_rdGranted_3_1 = (grantLock_8 ? grantLockIdx_8 : _zz_rdGranted_3);
  assign when_Axi4LiteCrossbar_l184_8 = (io_slaves_3_ar_valid && (! io_slaves_3_ar_ready));
  assign when_Axi4LiteCrossbar_l400_3 = (|_zz_when_Axi4LiteCrossbar_l400_9);
  assign when_Axi4LiteCrossbar_l403_6 = (_zz_rdGranted_3_1 == 1'b0);
  assign when_Axi4LiteCrossbar_l403_7 = (_zz_rdGranted_3_1 == 1'b1);
  assign io_slaves_3_ar_fire = (io_slaves_3_ar_valid && io_slaves_3_ar_ready);
  assign when_Axi4LiteCrossbar_l446_6 = (rdGranted_3 == 1'b0);
  assign when_Axi4LiteCrossbar_l446_7 = (rdGranted_3 == 1'b1);
  assign io_slaves_3_r_fire = (io_slaves_3_r_valid && io_slaves_3_r_ready);
  assign when_Axi4LiteCrossbar_l388_4 = (! rdActive_4);
  always @(*) begin
    _zz_when_Axi4LiteCrossbar_l400_13[0] = (io_masters_0_ar_payload_addr[31 : 16] == 16'h0);
    _zz_when_Axi4LiteCrossbar_l400_13[1] = (io_masters_0_ar_payload_addr[31 : 16] == 16'h0001);
    _zz_when_Axi4LiteCrossbar_l400_13[2] = (io_masters_0_ar_payload_addr[31 : 16] == 16'h0002);
    _zz_when_Axi4LiteCrossbar_l400_13[3] = (io_masters_0_ar_payload_addr[31 : 16] == 16'h0003);
  end

  always @(*) begin
    _zz_when_Axi4LiteCrossbar_l400_12[0] = ((io_masters_0_ar_valid && _zz__zz_when_Axi4LiteCrossbar_l400_12[4]) && (! ((((rdActive_0 && (rdGranted_0 == 1'b0)) || (rdActive_1 && (rdGranted_1 == 1'b0))) || ((rdActive_2 && (rdGranted_2 == 1'b0)) || (rdActive_3 && (rdGranted_3 == 1'b0)))) || (rdActive_4 && (rdGranted_4 == 1'b0)))));
    _zz_when_Axi4LiteCrossbar_l400_12[1] = ((io_masters_1_ar_valid && _zz__zz_when_Axi4LiteCrossbar_l400_12_1[4]) && (! ((((rdActive_0 && (rdGranted_0 == 1'b1)) || (rdActive_1 && (rdGranted_1 == 1'b1))) || ((rdActive_2 && (rdGranted_2 == 1'b1)) || (rdActive_3 && (rdGranted_3 == 1'b1)))) || (rdActive_4 && (rdGranted_4 == 1'b1)))));
  end

  always @(*) begin
    _zz_when_Axi4LiteCrossbar_l400_14[0] = (io_masters_1_ar_payload_addr[31 : 16] == 16'h0);
    _zz_when_Axi4LiteCrossbar_l400_14[1] = (io_masters_1_ar_payload_addr[31 : 16] == 16'h0001);
    _zz_when_Axi4LiteCrossbar_l400_14[2] = (io_masters_1_ar_payload_addr[31 : 16] == 16'h0002);
    _zz_when_Axi4LiteCrossbar_l400_14[3] = (io_masters_1_ar_payload_addr[31 : 16] == 16'h0003);
  end

  always @(*) begin
    _zz_when_Axi4LiteCrossbar_l149_45 = 2'b00;
    if(when_Axi4LiteCrossbar_l106_9) begin
      _zz_when_Axi4LiteCrossbar_l149_45 = 2'b01;
    end
  end

  assign when_Axi4LiteCrossbar_l106_9 = (1'b1 <= rdRrPtr_4);
  assign _zz_when_Axi4LiteCrossbar_l149_46 = (_zz_when_Axi4LiteCrossbar_l400_12 & (~ _zz_when_Axi4LiteCrossbar_l149_45));
  assign _zz_when_Axi4LiteCrossbar_l149_47 = _zz_when_Axi4LiteCrossbar_l149_46;
  assign _zz_when_Axi4LiteCrossbar_l149_48 = _zz_when_Axi4LiteCrossbar_l400_12;
  assign _zz_when_Axi4LiteCrossbar_l149_49 = ((|_zz_when_Axi4LiteCrossbar_l149_46) ? (_zz_when_Axi4LiteCrossbar_l149_47 & (~ _zz__zz_when_Axi4LiteCrossbar_l149_49)) : (_zz_when_Axi4LiteCrossbar_l149_48 & (~ _zz__zz_when_Axi4LiteCrossbar_l149_49_1)));
  always @(*) begin
    _zz_rdGranted_4 = 1'b0;
    if(when_Axi4LiteCrossbar_l149_18) begin
      _zz_rdGranted_4 = 1'b0;
    end
    if(when_Axi4LiteCrossbar_l149_19) begin
      _zz_rdGranted_4 = 1'b1;
    end
  end

  assign when_Axi4LiteCrossbar_l149_18 = _zz_when_Axi4LiteCrossbar_l149_49[0];
  assign when_Axi4LiteCrossbar_l149_19 = _zz_when_Axi4LiteCrossbar_l149_49[1];
  assign _zz_rdGranted_4_1 = (grantLock_9 ? grantLockIdx_9 : _zz_rdGranted_4);
  assign when_Axi4LiteCrossbar_l184_9 = (decErr_io_axi_ar_valid && (! decErr_io_axi_ar_ready));
  assign when_Axi4LiteCrossbar_l400_4 = (|_zz_when_Axi4LiteCrossbar_l400_12);
  assign when_Axi4LiteCrossbar_l403_8 = (_zz_rdGranted_4_1 == 1'b0);
  assign when_Axi4LiteCrossbar_l403_9 = (_zz_rdGranted_4_1 == 1'b1);
  assign decErr_io_axi_ar_fire = (decErr_io_axi_ar_valid && decErr_io_axi_ar_ready);
  assign when_Axi4LiteCrossbar_l446_8 = (rdGranted_4 == 1'b0);
  assign when_Axi4LiteCrossbar_l446_9 = (rdGranted_4 == 1'b1);
  assign decErr_io_axi_r_fire = (decErr_io_axi_r_valid && decErr_io_axi_r_ready);
  always @(posedge clk) begin
    if(!resetn) begin
      wrActive_0 <= 1'b0;
      wrActive_1 <= 1'b0;
      wrActive_2 <= 1'b0;
      wrActive_3 <= 1'b0;
      wrActive_4 <= 1'b0;
      wrGranted_0 <= 1'b0;
      wrGranted_1 <= 1'b0;
      wrGranted_2 <= 1'b0;
      wrGranted_3 <= 1'b0;
      wrGranted_4 <= 1'b0;
      wrDataDone_0 <= 1'b0;
      wrDataDone_1 <= 1'b0;
      wrDataDone_2 <= 1'b0;
      wrDataDone_3 <= 1'b0;
      wrDataDone_4 <= 1'b0;
      wrRrPtr_0 <= 1'b0;
      wrRrPtr_1 <= 1'b0;
      wrRrPtr_2 <= 1'b0;
      wrRrPtr_3 <= 1'b0;
      wrRrPtr_4 <= 1'b0;
      rdActive_0 <= 1'b0;
      rdActive_1 <= 1'b0;
      rdActive_2 <= 1'b0;
      rdActive_3 <= 1'b0;
      rdActive_4 <= 1'b0;
      rdGranted_0 <= 1'b0;
      rdGranted_1 <= 1'b0;
      rdGranted_2 <= 1'b0;
      rdGranted_3 <= 1'b0;
      rdGranted_4 <= 1'b0;
      rdRrPtr_0 <= 1'b0;
      rdRrPtr_1 <= 1'b0;
      rdRrPtr_2 <= 1'b0;
      rdRrPtr_3 <= 1'b0;
      rdRrPtr_4 <= 1'b0;
    end else begin
      if(when_Axi4LiteCrossbar_l284) begin
        if(when_Axi4LiteCrossbar_l297) begin
          if(io_slaves_0_aw_fire) begin
            wrActive_0 <= 1'b1;
            wrGranted_0 <= _zz_wrGranted_0_1;
            wrRrPtr_0 <= (_zz_wrGranted_0_1 + 1'b1);
          end
        end
      end else begin
        if(io_slaves_0_b_fire) begin
          wrActive_0 <= 1'b0;
        end
      end
      if(io_slaves_0_b_fire) begin
        wrDataDone_0 <= 1'b0;
      end else begin
        if(io_slaves_0_w_fire) begin
          wrDataDone_0 <= 1'b1;
        end
      end
      if(when_Axi4LiteCrossbar_l284_1) begin
        if(when_Axi4LiteCrossbar_l297_1) begin
          if(io_slaves_1_aw_fire) begin
            wrActive_1 <= 1'b1;
            wrGranted_1 <= _zz_wrGranted_1_1;
            wrRrPtr_1 <= (_zz_wrGranted_1_1 + 1'b1);
          end
        end
      end else begin
        if(io_slaves_1_b_fire) begin
          wrActive_1 <= 1'b0;
        end
      end
      if(io_slaves_1_b_fire) begin
        wrDataDone_1 <= 1'b0;
      end else begin
        if(io_slaves_1_w_fire) begin
          wrDataDone_1 <= 1'b1;
        end
      end
      if(when_Axi4LiteCrossbar_l284_2) begin
        if(when_Axi4LiteCrossbar_l297_2) begin
          if(io_slaves_2_aw_fire) begin
            wrActive_2 <= 1'b1;
            wrGranted_2 <= _zz_wrGranted_2_1;
            wrRrPtr_2 <= (_zz_wrGranted_2_1 + 1'b1);
          end
        end
      end else begin
        if(io_slaves_2_b_fire) begin
          wrActive_2 <= 1'b0;
        end
      end
      if(io_slaves_2_b_fire) begin
        wrDataDone_2 <= 1'b0;
      end else begin
        if(io_slaves_2_w_fire) begin
          wrDataDone_2 <= 1'b1;
        end
      end
      if(when_Axi4LiteCrossbar_l284_3) begin
        if(when_Axi4LiteCrossbar_l297_3) begin
          if(io_slaves_3_aw_fire) begin
            wrActive_3 <= 1'b1;
            wrGranted_3 <= _zz_wrGranted_3_1;
            wrRrPtr_3 <= (_zz_wrGranted_3_1 + 1'b1);
          end
        end
      end else begin
        if(io_slaves_3_b_fire) begin
          wrActive_3 <= 1'b0;
        end
      end
      if(io_slaves_3_b_fire) begin
        wrDataDone_3 <= 1'b0;
      end else begin
        if(io_slaves_3_w_fire) begin
          wrDataDone_3 <= 1'b1;
        end
      end
      if(when_Axi4LiteCrossbar_l284_4) begin
        if(when_Axi4LiteCrossbar_l297_4) begin
          if(decErr_io_axi_aw_fire) begin
            wrActive_4 <= 1'b1;
            wrGranted_4 <= _zz_wrGranted_4_1;
            wrRrPtr_4 <= (_zz_wrGranted_4_1 + 1'b1);
          end
        end
      end else begin
        if(decErr_io_axi_b_fire) begin
          wrActive_4 <= 1'b0;
        end
      end
      if(decErr_io_axi_b_fire) begin
        wrDataDone_4 <= 1'b0;
      end else begin
        if(decErr_io_axi_w_fire) begin
          wrDataDone_4 <= 1'b1;
        end
      end
      if(when_Axi4LiteCrossbar_l388) begin
        if(when_Axi4LiteCrossbar_l400) begin
          if(io_slaves_0_ar_fire) begin
            rdActive_0 <= 1'b1;
            rdGranted_0 <= _zz_rdGranted_0_1;
            rdRrPtr_0 <= (_zz_rdGranted_0_1 + 1'b1);
          end
        end
      end else begin
        if(io_slaves_0_r_fire) begin
          rdActive_0 <= 1'b0;
        end
      end
      if(when_Axi4LiteCrossbar_l388_1) begin
        if(when_Axi4LiteCrossbar_l400_1) begin
          if(io_slaves_1_ar_fire) begin
            rdActive_1 <= 1'b1;
            rdGranted_1 <= _zz_rdGranted_1_1;
            rdRrPtr_1 <= (_zz_rdGranted_1_1 + 1'b1);
          end
        end
      end else begin
        if(io_slaves_1_r_fire) begin
          rdActive_1 <= 1'b0;
        end
      end
      if(when_Axi4LiteCrossbar_l388_2) begin
        if(when_Axi4LiteCrossbar_l400_2) begin
          if(io_slaves_2_ar_fire) begin
            rdActive_2 <= 1'b1;
            rdGranted_2 <= _zz_rdGranted_2_1;
            rdRrPtr_2 <= (_zz_rdGranted_2_1 + 1'b1);
          end
        end
      end else begin
        if(io_slaves_2_r_fire) begin
          rdActive_2 <= 1'b0;
        end
      end
      if(when_Axi4LiteCrossbar_l388_3) begin
        if(when_Axi4LiteCrossbar_l400_3) begin
          if(io_slaves_3_ar_fire) begin
            rdActive_3 <= 1'b1;
            rdGranted_3 <= _zz_rdGranted_3_1;
            rdRrPtr_3 <= (_zz_rdGranted_3_1 + 1'b1);
          end
        end
      end else begin
        if(io_slaves_3_r_fire) begin
          rdActive_3 <= 1'b0;
        end
      end
      if(when_Axi4LiteCrossbar_l388_4) begin
        if(when_Axi4LiteCrossbar_l400_4) begin
          if(decErr_io_axi_ar_fire) begin
            rdActive_4 <= 1'b1;
            rdGranted_4 <= _zz_rdGranted_4_1;
            rdRrPtr_4 <= (_zz_rdGranted_4_1 + 1'b1);
          end
        end
      end else begin
        if(decErr_io_axi_r_fire) begin
          rdActive_4 <= 1'b0;
        end
      end
    end
  end

  always @(posedge clk) begin
    if(!resetn) begin
      grantLock <= 1'b0;
      grantLockIdx <= 1'b0;
    end else begin
      if(when_Axi4LiteCrossbar_l184) begin
        grantLock <= 1'b1;
        grantLockIdx <= _zz_wrGranted_0_1;
      end else begin
        grantLock <= 1'b0;
      end
    end
  end

  always @(posedge clk) begin
    if(!resetn) begin
      grantLock_1 <= 1'b0;
      grantLockIdx_1 <= 1'b0;
    end else begin
      if(when_Axi4LiteCrossbar_l184_1) begin
        grantLock_1 <= 1'b1;
        grantLockIdx_1 <= _zz_wrGranted_1_1;
      end else begin
        grantLock_1 <= 1'b0;
      end
    end
  end

  always @(posedge clk) begin
    if(!resetn) begin
      grantLock_2 <= 1'b0;
      grantLockIdx_2 <= 1'b0;
    end else begin
      if(when_Axi4LiteCrossbar_l184_2) begin
        grantLock_2 <= 1'b1;
        grantLockIdx_2 <= _zz_wrGranted_2_1;
      end else begin
        grantLock_2 <= 1'b0;
      end
    end
  end

  always @(posedge clk) begin
    if(!resetn) begin
      grantLock_3 <= 1'b0;
      grantLockIdx_3 <= 1'b0;
    end else begin
      if(when_Axi4LiteCrossbar_l184_3) begin
        grantLock_3 <= 1'b1;
        grantLockIdx_3 <= _zz_wrGranted_3_1;
      end else begin
        grantLock_3 <= 1'b0;
      end
    end
  end

  always @(posedge clk) begin
    if(!resetn) begin
      grantLock_4 <= 1'b0;
      grantLockIdx_4 <= 1'b0;
    end else begin
      if(when_Axi4LiteCrossbar_l184_4) begin
        grantLock_4 <= 1'b1;
        grantLockIdx_4 <= _zz_wrGranted_4_1;
      end else begin
        grantLock_4 <= 1'b0;
      end
    end
  end

  always @(posedge clk) begin
    if(!resetn) begin
      grantLock_5 <= 1'b0;
      grantLockIdx_5 <= 1'b0;
    end else begin
      if(when_Axi4LiteCrossbar_l184_5) begin
        grantLock_5 <= 1'b1;
        grantLockIdx_5 <= _zz_rdGranted_0_1;
      end else begin
        grantLock_5 <= 1'b0;
      end
    end
  end

  always @(posedge clk) begin
    if(!resetn) begin
      grantLock_6 <= 1'b0;
      grantLockIdx_6 <= 1'b0;
    end else begin
      if(when_Axi4LiteCrossbar_l184_6) begin
        grantLock_6 <= 1'b1;
        grantLockIdx_6 <= _zz_rdGranted_1_1;
      end else begin
        grantLock_6 <= 1'b0;
      end
    end
  end

  always @(posedge clk) begin
    if(!resetn) begin
      grantLock_7 <= 1'b0;
      grantLockIdx_7 <= 1'b0;
    end else begin
      if(when_Axi4LiteCrossbar_l184_7) begin
        grantLock_7 <= 1'b1;
        grantLockIdx_7 <= _zz_rdGranted_2_1;
      end else begin
        grantLock_7 <= 1'b0;
      end
    end
  end

  always @(posedge clk) begin
    if(!resetn) begin
      grantLock_8 <= 1'b0;
      grantLockIdx_8 <= 1'b0;
    end else begin
      if(when_Axi4LiteCrossbar_l184_8) begin
        grantLock_8 <= 1'b1;
        grantLockIdx_8 <= _zz_rdGranted_3_1;
      end else begin
        grantLock_8 <= 1'b0;
      end
    end
  end

  always @(posedge clk) begin
    if(!resetn) begin
      grantLock_9 <= 1'b0;
      grantLockIdx_9 <= 1'b0;
    end else begin
      if(when_Axi4LiteCrossbar_l184_9) begin
        grantLock_9 <= 1'b1;
        grantLockIdx_9 <= _zz_rdGranted_4_1;
      end else begin
        grantLock_9 <= 1'b0;
      end
    end
  end


endmodule

module Axi4DecErrSlave (
  input  wire          io_axi_aw_valid,
  output wire          io_axi_aw_ready,
  input  wire [31:0]   io_axi_aw_payload_addr,
  input  wire [2:0]    io_axi_aw_payload_prot,
  input  wire          io_axi_w_valid,
  output wire          io_axi_w_ready,
  input  wire [31:0]   io_axi_w_payload_data,
  input  wire [3:0]    io_axi_w_payload_strb,
  output wire          io_axi_b_valid,
  input  wire          io_axi_b_ready,
  output reg  [1:0]    io_axi_b_payload_resp,
  input  wire          io_axi_ar_valid,
  output wire          io_axi_ar_ready,
  input  wire [31:0]   io_axi_ar_payload_addr,
  input  wire [2:0]    io_axi_ar_payload_prot,
  output wire          io_axi_r_valid,
  input  wire          io_axi_r_ready,
  output reg  [31:0]   io_axi_r_payload_data,
  output reg  [1:0]    io_axi_r_payload_resp,
  input  wire          clk,
  input  wire          resetn
);

  wire       [1:0]    _zz_io_axi_b_payload_resp;
  reg                 write_sinking;
  reg                 write_answering;
  wire                io_axi_aw_fire;
  wire                write_lastBeat;
  wire                io_axi_w_fire;
  wire                when_Axi4DecErrSlave_l78;
  wire                io_axi_b_fire;
  reg                 read_busy;
  reg        [7:0]    read_beatsLeft;
  wire                io_axi_ar_fire;
  wire       [33:0]   _zz_io_axi_r_payload_data;
  wire                io_axi_r_fire;
  wire                when_Axi4DecErrSlave_l116;

  assign _zz_io_axi_b_payload_resp = 2'b00;
  assign io_axi_aw_ready = ((! write_sinking) && (! write_answering));
  assign io_axi_aw_fire = (io_axi_aw_valid && io_axi_aw_ready);
  assign io_axi_w_ready = write_sinking;
  assign write_lastBeat = 1'b1;
  assign io_axi_w_fire = (io_axi_w_valid && io_axi_w_ready);
  assign when_Axi4DecErrSlave_l78 = ((write_sinking && io_axi_w_fire) && write_lastBeat);
  assign io_axi_b_valid = write_answering;
  always @(*) begin
    io_axi_b_payload_resp = _zz_io_axi_b_payload_resp[1 : 0];
    io_axi_b_payload_resp = 2'b11;
  end

  assign io_axi_b_fire = (io_axi_b_valid && io_axi_b_ready);
  assign io_axi_ar_ready = (! read_busy);
  assign io_axi_ar_fire = (io_axi_ar_valid && io_axi_ar_ready);
  assign io_axi_r_valid = read_busy;
  assign _zz_io_axi_r_payload_data = 34'h0;
  always @(*) begin
    io_axi_r_payload_data = _zz_io_axi_r_payload_data[31 : 0];
    io_axi_r_payload_data = 32'h0;
  end

  always @(*) begin
    io_axi_r_payload_resp = _zz_io_axi_r_payload_data[33 : 32];
    io_axi_r_payload_resp = 2'b11;
  end

  assign io_axi_r_fire = (io_axi_r_valid && io_axi_r_ready);
  assign when_Axi4DecErrSlave_l116 = (read_beatsLeft == 8'h0);
  always @(posedge clk) begin
    if(!resetn) begin
      write_sinking <= 1'b0;
      write_answering <= 1'b0;
      read_busy <= 1'b0;
      read_beatsLeft <= 8'h0;
    end else begin
      if(io_axi_aw_fire) begin
        write_sinking <= 1'b1;
      end
      if(when_Axi4DecErrSlave_l78) begin
        write_sinking <= 1'b0;
        write_answering <= 1'b1;
      end
      if(io_axi_b_fire) begin
        write_answering <= 1'b0;
      end
      if(io_axi_ar_fire) begin
        read_busy <= 1'b1;
        read_beatsLeft <= 8'h0;
      end
      if(io_axi_r_fire) begin
        if(when_Axi4DecErrSlave_l116) begin
          read_busy <= 1'b0;
        end else begin
          read_beatsLeft <= (read_beatsLeft - 8'h01);
        end
      end
    end
  end


endmodule
