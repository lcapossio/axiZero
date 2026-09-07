// Copyright (c) 2026 Leonardo Capossio - bard0 design  hello@bard0.com
// SPDX-License-Identifier: MIT
// Generator : SpinalHDL v1.14.2    git head : 78f29dc66110fc099a777992b6daa2f803ab445e
// Component : AxiZeroLiteTop
// Git hash  : e4ae231ab45f2af93f68dbb509b855f6a8cb625a

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
  wire       [4:0]    _zz__zz_when_Axi4LiteCrossbar_l229;
  wire       [4:0]    _zz__zz_when_Axi4LiteCrossbar_l229_1;
  wire       [1:0]    _zz__zz_when_Axi4LiteCrossbar_l152_4;
  wire       [1:0]    _zz__zz_when_Axi4LiteCrossbar_l152_4_1;
  wire       [4:0]    _zz__zz_when_Axi4LiteCrossbar_l229_3;
  wire       [4:0]    _zz__zz_when_Axi4LiteCrossbar_l229_3_1;
  wire       [1:0]    _zz__zz_when_Axi4LiteCrossbar_l152_9;
  wire       [1:0]    _zz__zz_when_Axi4LiteCrossbar_l152_9_1;
  wire       [4:0]    _zz__zz_when_Axi4LiteCrossbar_l229_6;
  wire       [4:0]    _zz__zz_when_Axi4LiteCrossbar_l229_6_1;
  wire       [1:0]    _zz__zz_when_Axi4LiteCrossbar_l152_14;
  wire       [1:0]    _zz__zz_when_Axi4LiteCrossbar_l152_14_1;
  wire       [4:0]    _zz__zz_when_Axi4LiteCrossbar_l229_9;
  wire       [4:0]    _zz__zz_when_Axi4LiteCrossbar_l229_9_1;
  wire       [1:0]    _zz__zz_when_Axi4LiteCrossbar_l152_19;
  wire       [1:0]    _zz__zz_when_Axi4LiteCrossbar_l152_19_1;
  wire       [4:0]    _zz__zz_when_Axi4LiteCrossbar_l229_12;
  wire       [4:0]    _zz__zz_when_Axi4LiteCrossbar_l229_12_1;
  wire       [1:0]    _zz__zz_when_Axi4LiteCrossbar_l152_24;
  wire       [1:0]    _zz__zz_when_Axi4LiteCrossbar_l152_24_1;
  wire       [4:0]    _zz__zz_when_Axi4LiteCrossbar_l317;
  wire       [4:0]    _zz__zz_when_Axi4LiteCrossbar_l317_1;
  wire       [1:0]    _zz__zz_when_Axi4LiteCrossbar_l152_29;
  wire       [1:0]    _zz__zz_when_Axi4LiteCrossbar_l152_29_1;
  wire       [4:0]    _zz__zz_when_Axi4LiteCrossbar_l317_3;
  wire       [4:0]    _zz__zz_when_Axi4LiteCrossbar_l317_3_1;
  wire       [1:0]    _zz__zz_when_Axi4LiteCrossbar_l152_34;
  wire       [1:0]    _zz__zz_when_Axi4LiteCrossbar_l152_34_1;
  wire       [4:0]    _zz__zz_when_Axi4LiteCrossbar_l317_6;
  wire       [4:0]    _zz__zz_when_Axi4LiteCrossbar_l317_6_1;
  wire       [1:0]    _zz__zz_when_Axi4LiteCrossbar_l152_39;
  wire       [1:0]    _zz__zz_when_Axi4LiteCrossbar_l152_39_1;
  wire       [4:0]    _zz__zz_when_Axi4LiteCrossbar_l317_9;
  wire       [4:0]    _zz__zz_when_Axi4LiteCrossbar_l317_9_1;
  wire       [1:0]    _zz__zz_when_Axi4LiteCrossbar_l152_44;
  wire       [1:0]    _zz__zz_when_Axi4LiteCrossbar_l152_44_1;
  wire       [4:0]    _zz__zz_when_Axi4LiteCrossbar_l317_12;
  wire       [4:0]    _zz__zz_when_Axi4LiteCrossbar_l317_12_1;
  wire       [1:0]    _zz__zz_when_Axi4LiteCrossbar_l152_49;
  wire       [1:0]    _zz__zz_when_Axi4LiteCrossbar_l152_49_1;
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
  wire                when_Axi4LiteCrossbar_l217;
  reg        [1:0]    _zz_when_Axi4LiteCrossbar_l229;
  reg        [3:0]    _zz_when_Axi4LiteCrossbar_l229_1;
  reg        [3:0]    _zz_when_Axi4LiteCrossbar_l229_2;
  reg        [1:0]    _zz_when_Axi4LiteCrossbar_l152;
  wire                when_Axi4LiteCrossbar_l109;
  wire       [1:0]    _zz_when_Axi4LiteCrossbar_l152_1;
  wire       [1:0]    _zz_when_Axi4LiteCrossbar_l152_2;
  wire       [1:0]    _zz_when_Axi4LiteCrossbar_l152_3;
  wire       [1:0]    _zz_when_Axi4LiteCrossbar_l152_4;
  reg        [0:0]    _zz_wrGranted_0;
  wire                when_Axi4LiteCrossbar_l152;
  wire                when_Axi4LiteCrossbar_l152_1;
  wire                when_Axi4LiteCrossbar_l229;
  wire                when_Axi4LiteCrossbar_l233;
  wire                when_Axi4LiteCrossbar_l233_1;
  wire                io_slaves_0_aw_fire;
  wire                when_Axi4LiteCrossbar_l285;
  wire                when_Axi4LiteCrossbar_l285_1;
  wire                io_slaves_0_b_fire;
  wire                when_Axi4LiteCrossbar_l217_1;
  reg        [1:0]    _zz_when_Axi4LiteCrossbar_l229_3;
  reg        [3:0]    _zz_when_Axi4LiteCrossbar_l229_4;
  reg        [3:0]    _zz_when_Axi4LiteCrossbar_l229_5;
  reg        [1:0]    _zz_when_Axi4LiteCrossbar_l152_5;
  wire                when_Axi4LiteCrossbar_l109_1;
  wire       [1:0]    _zz_when_Axi4LiteCrossbar_l152_6;
  wire       [1:0]    _zz_when_Axi4LiteCrossbar_l152_7;
  wire       [1:0]    _zz_when_Axi4LiteCrossbar_l152_8;
  wire       [1:0]    _zz_when_Axi4LiteCrossbar_l152_9;
  reg        [0:0]    _zz_wrGranted_1;
  wire                when_Axi4LiteCrossbar_l152_2;
  wire                when_Axi4LiteCrossbar_l152_3;
  wire                when_Axi4LiteCrossbar_l229_1;
  wire                when_Axi4LiteCrossbar_l233_2;
  wire                when_Axi4LiteCrossbar_l233_3;
  wire                io_slaves_1_aw_fire;
  wire                when_Axi4LiteCrossbar_l285_2;
  wire                when_Axi4LiteCrossbar_l285_3;
  wire                io_slaves_1_b_fire;
  wire                when_Axi4LiteCrossbar_l217_2;
  reg        [1:0]    _zz_when_Axi4LiteCrossbar_l229_6;
  reg        [3:0]    _zz_when_Axi4LiteCrossbar_l229_7;
  reg        [3:0]    _zz_when_Axi4LiteCrossbar_l229_8;
  reg        [1:0]    _zz_when_Axi4LiteCrossbar_l152_10;
  wire                when_Axi4LiteCrossbar_l109_2;
  wire       [1:0]    _zz_when_Axi4LiteCrossbar_l152_11;
  wire       [1:0]    _zz_when_Axi4LiteCrossbar_l152_12;
  wire       [1:0]    _zz_when_Axi4LiteCrossbar_l152_13;
  wire       [1:0]    _zz_when_Axi4LiteCrossbar_l152_14;
  reg        [0:0]    _zz_wrGranted_2;
  wire                when_Axi4LiteCrossbar_l152_4;
  wire                when_Axi4LiteCrossbar_l152_5;
  wire                when_Axi4LiteCrossbar_l229_2;
  wire                when_Axi4LiteCrossbar_l233_4;
  wire                when_Axi4LiteCrossbar_l233_5;
  wire                io_slaves_2_aw_fire;
  wire                when_Axi4LiteCrossbar_l285_4;
  wire                when_Axi4LiteCrossbar_l285_5;
  wire                io_slaves_2_b_fire;
  wire                when_Axi4LiteCrossbar_l217_3;
  reg        [1:0]    _zz_when_Axi4LiteCrossbar_l229_9;
  reg        [3:0]    _zz_when_Axi4LiteCrossbar_l229_10;
  reg        [3:0]    _zz_when_Axi4LiteCrossbar_l229_11;
  reg        [1:0]    _zz_when_Axi4LiteCrossbar_l152_15;
  wire                when_Axi4LiteCrossbar_l109_3;
  wire       [1:0]    _zz_when_Axi4LiteCrossbar_l152_16;
  wire       [1:0]    _zz_when_Axi4LiteCrossbar_l152_17;
  wire       [1:0]    _zz_when_Axi4LiteCrossbar_l152_18;
  wire       [1:0]    _zz_when_Axi4LiteCrossbar_l152_19;
  reg        [0:0]    _zz_wrGranted_3;
  wire                when_Axi4LiteCrossbar_l152_6;
  wire                when_Axi4LiteCrossbar_l152_7;
  wire                when_Axi4LiteCrossbar_l229_3;
  wire                when_Axi4LiteCrossbar_l233_6;
  wire                when_Axi4LiteCrossbar_l233_7;
  wire                io_slaves_3_aw_fire;
  wire                when_Axi4LiteCrossbar_l285_6;
  wire                when_Axi4LiteCrossbar_l285_7;
  wire                io_slaves_3_b_fire;
  wire                when_Axi4LiteCrossbar_l217_4;
  reg        [1:0]    _zz_when_Axi4LiteCrossbar_l229_12;
  reg        [3:0]    _zz_when_Axi4LiteCrossbar_l229_13;
  reg        [3:0]    _zz_when_Axi4LiteCrossbar_l229_14;
  reg        [1:0]    _zz_when_Axi4LiteCrossbar_l152_20;
  wire                when_Axi4LiteCrossbar_l109_4;
  wire       [1:0]    _zz_when_Axi4LiteCrossbar_l152_21;
  wire       [1:0]    _zz_when_Axi4LiteCrossbar_l152_22;
  wire       [1:0]    _zz_when_Axi4LiteCrossbar_l152_23;
  wire       [1:0]    _zz_when_Axi4LiteCrossbar_l152_24;
  reg        [0:0]    _zz_wrGranted_4;
  wire                when_Axi4LiteCrossbar_l152_8;
  wire                when_Axi4LiteCrossbar_l152_9;
  wire                when_Axi4LiteCrossbar_l229_4;
  wire                when_Axi4LiteCrossbar_l233_8;
  wire                when_Axi4LiteCrossbar_l233_9;
  wire                decErr_io_axi_aw_fire;
  wire                when_Axi4LiteCrossbar_l285_8;
  wire                when_Axi4LiteCrossbar_l285_9;
  wire                decErr_io_axi_b_fire;
  wire                when_Axi4LiteCrossbar_l306;
  reg        [1:0]    _zz_when_Axi4LiteCrossbar_l317;
  reg        [3:0]    _zz_when_Axi4LiteCrossbar_l317_1;
  reg        [3:0]    _zz_when_Axi4LiteCrossbar_l317_2;
  reg        [1:0]    _zz_when_Axi4LiteCrossbar_l152_25;
  wire                when_Axi4LiteCrossbar_l109_5;
  wire       [1:0]    _zz_when_Axi4LiteCrossbar_l152_26;
  wire       [1:0]    _zz_when_Axi4LiteCrossbar_l152_27;
  wire       [1:0]    _zz_when_Axi4LiteCrossbar_l152_28;
  wire       [1:0]    _zz_when_Axi4LiteCrossbar_l152_29;
  reg        [0:0]    _zz_rdGranted_0;
  wire                when_Axi4LiteCrossbar_l152_10;
  wire                when_Axi4LiteCrossbar_l152_11;
  wire                when_Axi4LiteCrossbar_l317;
  wire                when_Axi4LiteCrossbar_l320;
  wire                when_Axi4LiteCrossbar_l320_1;
  wire                io_slaves_0_ar_fire;
  wire                when_Axi4LiteCrossbar_l363;
  wire                when_Axi4LiteCrossbar_l363_1;
  wire                io_slaves_0_r_fire;
  wire                when_Axi4LiteCrossbar_l306_1;
  reg        [1:0]    _zz_when_Axi4LiteCrossbar_l317_3;
  reg        [3:0]    _zz_when_Axi4LiteCrossbar_l317_4;
  reg        [3:0]    _zz_when_Axi4LiteCrossbar_l317_5;
  reg        [1:0]    _zz_when_Axi4LiteCrossbar_l152_30;
  wire                when_Axi4LiteCrossbar_l109_6;
  wire       [1:0]    _zz_when_Axi4LiteCrossbar_l152_31;
  wire       [1:0]    _zz_when_Axi4LiteCrossbar_l152_32;
  wire       [1:0]    _zz_when_Axi4LiteCrossbar_l152_33;
  wire       [1:0]    _zz_when_Axi4LiteCrossbar_l152_34;
  reg        [0:0]    _zz_rdGranted_1;
  wire                when_Axi4LiteCrossbar_l152_12;
  wire                when_Axi4LiteCrossbar_l152_13;
  wire                when_Axi4LiteCrossbar_l317_1;
  wire                when_Axi4LiteCrossbar_l320_2;
  wire                when_Axi4LiteCrossbar_l320_3;
  wire                io_slaves_1_ar_fire;
  wire                when_Axi4LiteCrossbar_l363_2;
  wire                when_Axi4LiteCrossbar_l363_3;
  wire                io_slaves_1_r_fire;
  wire                when_Axi4LiteCrossbar_l306_2;
  reg        [1:0]    _zz_when_Axi4LiteCrossbar_l317_6;
  reg        [3:0]    _zz_when_Axi4LiteCrossbar_l317_7;
  reg        [3:0]    _zz_when_Axi4LiteCrossbar_l317_8;
  reg        [1:0]    _zz_when_Axi4LiteCrossbar_l152_35;
  wire                when_Axi4LiteCrossbar_l109_7;
  wire       [1:0]    _zz_when_Axi4LiteCrossbar_l152_36;
  wire       [1:0]    _zz_when_Axi4LiteCrossbar_l152_37;
  wire       [1:0]    _zz_when_Axi4LiteCrossbar_l152_38;
  wire       [1:0]    _zz_when_Axi4LiteCrossbar_l152_39;
  reg        [0:0]    _zz_rdGranted_2;
  wire                when_Axi4LiteCrossbar_l152_14;
  wire                when_Axi4LiteCrossbar_l152_15;
  wire                when_Axi4LiteCrossbar_l317_2;
  wire                when_Axi4LiteCrossbar_l320_4;
  wire                when_Axi4LiteCrossbar_l320_5;
  wire                io_slaves_2_ar_fire;
  wire                when_Axi4LiteCrossbar_l363_4;
  wire                when_Axi4LiteCrossbar_l363_5;
  wire                io_slaves_2_r_fire;
  wire                when_Axi4LiteCrossbar_l306_3;
  reg        [1:0]    _zz_when_Axi4LiteCrossbar_l317_9;
  reg        [3:0]    _zz_when_Axi4LiteCrossbar_l317_10;
  reg        [3:0]    _zz_when_Axi4LiteCrossbar_l317_11;
  reg        [1:0]    _zz_when_Axi4LiteCrossbar_l152_40;
  wire                when_Axi4LiteCrossbar_l109_8;
  wire       [1:0]    _zz_when_Axi4LiteCrossbar_l152_41;
  wire       [1:0]    _zz_when_Axi4LiteCrossbar_l152_42;
  wire       [1:0]    _zz_when_Axi4LiteCrossbar_l152_43;
  wire       [1:0]    _zz_when_Axi4LiteCrossbar_l152_44;
  reg        [0:0]    _zz_rdGranted_3;
  wire                when_Axi4LiteCrossbar_l152_16;
  wire                when_Axi4LiteCrossbar_l152_17;
  wire                when_Axi4LiteCrossbar_l317_3;
  wire                when_Axi4LiteCrossbar_l320_6;
  wire                when_Axi4LiteCrossbar_l320_7;
  wire                io_slaves_3_ar_fire;
  wire                when_Axi4LiteCrossbar_l363_6;
  wire                when_Axi4LiteCrossbar_l363_7;
  wire                io_slaves_3_r_fire;
  wire                when_Axi4LiteCrossbar_l306_4;
  reg        [1:0]    _zz_when_Axi4LiteCrossbar_l317_12;
  reg        [3:0]    _zz_when_Axi4LiteCrossbar_l317_13;
  reg        [3:0]    _zz_when_Axi4LiteCrossbar_l317_14;
  reg        [1:0]    _zz_when_Axi4LiteCrossbar_l152_45;
  wire                when_Axi4LiteCrossbar_l109_9;
  wire       [1:0]    _zz_when_Axi4LiteCrossbar_l152_46;
  wire       [1:0]    _zz_when_Axi4LiteCrossbar_l152_47;
  wire       [1:0]    _zz_when_Axi4LiteCrossbar_l152_48;
  wire       [1:0]    _zz_when_Axi4LiteCrossbar_l152_49;
  reg        [0:0]    _zz_rdGranted_4;
  wire                when_Axi4LiteCrossbar_l152_18;
  wire                when_Axi4LiteCrossbar_l152_19;
  wire                when_Axi4LiteCrossbar_l317_4;
  wire                when_Axi4LiteCrossbar_l320_8;
  wire                when_Axi4LiteCrossbar_l320_9;
  wire                decErr_io_axi_ar_fire;
  wire                when_Axi4LiteCrossbar_l363_8;
  wire                when_Axi4LiteCrossbar_l363_9;
  wire                decErr_io_axi_r_fire;

  assign _zz_io_masters_0_b_payload_resp = 2'b00;
  assign _zz_io_masters_1_b_payload_resp = 2'b00;
  assign _zz__zz_when_Axi4LiteCrossbar_l229 = {(! (|_zz_when_Axi4LiteCrossbar_l229_1)),_zz_when_Axi4LiteCrossbar_l229_1};
  assign _zz__zz_when_Axi4LiteCrossbar_l229_1 = {(! (|_zz_when_Axi4LiteCrossbar_l229_2)),_zz_when_Axi4LiteCrossbar_l229_2};
  assign _zz__zz_when_Axi4LiteCrossbar_l152_4 = (_zz_when_Axi4LiteCrossbar_l152_2 - 2'b01);
  assign _zz__zz_when_Axi4LiteCrossbar_l152_4_1 = (_zz_when_Axi4LiteCrossbar_l152_3 - 2'b01);
  assign _zz__zz_when_Axi4LiteCrossbar_l229_3 = {(! (|_zz_when_Axi4LiteCrossbar_l229_4)),_zz_when_Axi4LiteCrossbar_l229_4};
  assign _zz__zz_when_Axi4LiteCrossbar_l229_3_1 = {(! (|_zz_when_Axi4LiteCrossbar_l229_5)),_zz_when_Axi4LiteCrossbar_l229_5};
  assign _zz__zz_when_Axi4LiteCrossbar_l152_9 = (_zz_when_Axi4LiteCrossbar_l152_7 - 2'b01);
  assign _zz__zz_when_Axi4LiteCrossbar_l152_9_1 = (_zz_when_Axi4LiteCrossbar_l152_8 - 2'b01);
  assign _zz__zz_when_Axi4LiteCrossbar_l229_6 = {(! (|_zz_when_Axi4LiteCrossbar_l229_7)),_zz_when_Axi4LiteCrossbar_l229_7};
  assign _zz__zz_when_Axi4LiteCrossbar_l229_6_1 = {(! (|_zz_when_Axi4LiteCrossbar_l229_8)),_zz_when_Axi4LiteCrossbar_l229_8};
  assign _zz__zz_when_Axi4LiteCrossbar_l152_14 = (_zz_when_Axi4LiteCrossbar_l152_12 - 2'b01);
  assign _zz__zz_when_Axi4LiteCrossbar_l152_14_1 = (_zz_when_Axi4LiteCrossbar_l152_13 - 2'b01);
  assign _zz__zz_when_Axi4LiteCrossbar_l229_9 = {(! (|_zz_when_Axi4LiteCrossbar_l229_10)),_zz_when_Axi4LiteCrossbar_l229_10};
  assign _zz__zz_when_Axi4LiteCrossbar_l229_9_1 = {(! (|_zz_when_Axi4LiteCrossbar_l229_11)),_zz_when_Axi4LiteCrossbar_l229_11};
  assign _zz__zz_when_Axi4LiteCrossbar_l152_19 = (_zz_when_Axi4LiteCrossbar_l152_17 - 2'b01);
  assign _zz__zz_when_Axi4LiteCrossbar_l152_19_1 = (_zz_when_Axi4LiteCrossbar_l152_18 - 2'b01);
  assign _zz__zz_when_Axi4LiteCrossbar_l229_12 = {(! (|_zz_when_Axi4LiteCrossbar_l229_13)),_zz_when_Axi4LiteCrossbar_l229_13};
  assign _zz__zz_when_Axi4LiteCrossbar_l229_12_1 = {(! (|_zz_when_Axi4LiteCrossbar_l229_14)),_zz_when_Axi4LiteCrossbar_l229_14};
  assign _zz__zz_when_Axi4LiteCrossbar_l152_24 = (_zz_when_Axi4LiteCrossbar_l152_22 - 2'b01);
  assign _zz__zz_when_Axi4LiteCrossbar_l152_24_1 = (_zz_when_Axi4LiteCrossbar_l152_23 - 2'b01);
  assign _zz__zz_when_Axi4LiteCrossbar_l317 = {(! (|_zz_when_Axi4LiteCrossbar_l317_1)),_zz_when_Axi4LiteCrossbar_l317_1};
  assign _zz__zz_when_Axi4LiteCrossbar_l317_1 = {(! (|_zz_when_Axi4LiteCrossbar_l317_2)),_zz_when_Axi4LiteCrossbar_l317_2};
  assign _zz__zz_when_Axi4LiteCrossbar_l152_29 = (_zz_when_Axi4LiteCrossbar_l152_27 - 2'b01);
  assign _zz__zz_when_Axi4LiteCrossbar_l152_29_1 = (_zz_when_Axi4LiteCrossbar_l152_28 - 2'b01);
  assign _zz__zz_when_Axi4LiteCrossbar_l317_3 = {(! (|_zz_when_Axi4LiteCrossbar_l317_4)),_zz_when_Axi4LiteCrossbar_l317_4};
  assign _zz__zz_when_Axi4LiteCrossbar_l317_3_1 = {(! (|_zz_when_Axi4LiteCrossbar_l317_5)),_zz_when_Axi4LiteCrossbar_l317_5};
  assign _zz__zz_when_Axi4LiteCrossbar_l152_34 = (_zz_when_Axi4LiteCrossbar_l152_32 - 2'b01);
  assign _zz__zz_when_Axi4LiteCrossbar_l152_34_1 = (_zz_when_Axi4LiteCrossbar_l152_33 - 2'b01);
  assign _zz__zz_when_Axi4LiteCrossbar_l317_6 = {(! (|_zz_when_Axi4LiteCrossbar_l317_7)),_zz_when_Axi4LiteCrossbar_l317_7};
  assign _zz__zz_when_Axi4LiteCrossbar_l317_6_1 = {(! (|_zz_when_Axi4LiteCrossbar_l317_8)),_zz_when_Axi4LiteCrossbar_l317_8};
  assign _zz__zz_when_Axi4LiteCrossbar_l152_39 = (_zz_when_Axi4LiteCrossbar_l152_37 - 2'b01);
  assign _zz__zz_when_Axi4LiteCrossbar_l152_39_1 = (_zz_when_Axi4LiteCrossbar_l152_38 - 2'b01);
  assign _zz__zz_when_Axi4LiteCrossbar_l317_9 = {(! (|_zz_when_Axi4LiteCrossbar_l317_10)),_zz_when_Axi4LiteCrossbar_l317_10};
  assign _zz__zz_when_Axi4LiteCrossbar_l317_9_1 = {(! (|_zz_when_Axi4LiteCrossbar_l317_11)),_zz_when_Axi4LiteCrossbar_l317_11};
  assign _zz__zz_when_Axi4LiteCrossbar_l152_44 = (_zz_when_Axi4LiteCrossbar_l152_42 - 2'b01);
  assign _zz__zz_when_Axi4LiteCrossbar_l152_44_1 = (_zz_when_Axi4LiteCrossbar_l152_43 - 2'b01);
  assign _zz__zz_when_Axi4LiteCrossbar_l317_12 = {(! (|_zz_when_Axi4LiteCrossbar_l317_13)),_zz_when_Axi4LiteCrossbar_l317_13};
  assign _zz__zz_when_Axi4LiteCrossbar_l317_12_1 = {(! (|_zz_when_Axi4LiteCrossbar_l317_14)),_zz_when_Axi4LiteCrossbar_l317_14};
  assign _zz__zz_when_Axi4LiteCrossbar_l152_49 = (_zz_when_Axi4LiteCrossbar_l152_47 - 2'b01);
  assign _zz__zz_when_Axi4LiteCrossbar_l152_49_1 = (_zz_when_Axi4LiteCrossbar_l152_48 - 2'b01);
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
    if(when_Axi4LiteCrossbar_l217) begin
      if(when_Axi4LiteCrossbar_l229) begin
        if(when_Axi4LiteCrossbar_l233) begin
          io_masters_0_aw_ready = io_slaves_0_aw_ready;
        end
      end
    end
    if(when_Axi4LiteCrossbar_l217_1) begin
      if(when_Axi4LiteCrossbar_l229_1) begin
        if(when_Axi4LiteCrossbar_l233_2) begin
          io_masters_0_aw_ready = io_slaves_1_aw_ready;
        end
      end
    end
    if(when_Axi4LiteCrossbar_l217_2) begin
      if(when_Axi4LiteCrossbar_l229_2) begin
        if(when_Axi4LiteCrossbar_l233_4) begin
          io_masters_0_aw_ready = io_slaves_2_aw_ready;
        end
      end
    end
    if(when_Axi4LiteCrossbar_l217_3) begin
      if(when_Axi4LiteCrossbar_l229_3) begin
        if(when_Axi4LiteCrossbar_l233_6) begin
          io_masters_0_aw_ready = io_slaves_3_aw_ready;
        end
      end
    end
    if(when_Axi4LiteCrossbar_l217_4) begin
      if(when_Axi4LiteCrossbar_l229_4) begin
        if(when_Axi4LiteCrossbar_l233_8) begin
          io_masters_0_aw_ready = decErr_io_axi_aw_ready;
        end
      end
    end
  end

  always @(*) begin
    io_masters_0_w_ready = 1'b0;
    if(when_Axi4LiteCrossbar_l217) begin
      if(when_Axi4LiteCrossbar_l229) begin
        if(when_Axi4LiteCrossbar_l233) begin
          io_masters_0_w_ready = io_slaves_0_w_ready;
        end
      end
    end else begin
      if(when_Axi4LiteCrossbar_l285) begin
        io_masters_0_w_ready = io_slaves_0_w_ready;
      end
    end
    if(when_Axi4LiteCrossbar_l217_1) begin
      if(when_Axi4LiteCrossbar_l229_1) begin
        if(when_Axi4LiteCrossbar_l233_2) begin
          io_masters_0_w_ready = io_slaves_1_w_ready;
        end
      end
    end else begin
      if(when_Axi4LiteCrossbar_l285_2) begin
        io_masters_0_w_ready = io_slaves_1_w_ready;
      end
    end
    if(when_Axi4LiteCrossbar_l217_2) begin
      if(when_Axi4LiteCrossbar_l229_2) begin
        if(when_Axi4LiteCrossbar_l233_4) begin
          io_masters_0_w_ready = io_slaves_2_w_ready;
        end
      end
    end else begin
      if(when_Axi4LiteCrossbar_l285_4) begin
        io_masters_0_w_ready = io_slaves_2_w_ready;
      end
    end
    if(when_Axi4LiteCrossbar_l217_3) begin
      if(when_Axi4LiteCrossbar_l229_3) begin
        if(when_Axi4LiteCrossbar_l233_6) begin
          io_masters_0_w_ready = io_slaves_3_w_ready;
        end
      end
    end else begin
      if(when_Axi4LiteCrossbar_l285_6) begin
        io_masters_0_w_ready = io_slaves_3_w_ready;
      end
    end
    if(when_Axi4LiteCrossbar_l217_4) begin
      if(when_Axi4LiteCrossbar_l229_4) begin
        if(when_Axi4LiteCrossbar_l233_8) begin
          io_masters_0_w_ready = decErr_io_axi_w_ready;
        end
      end
    end else begin
      if(when_Axi4LiteCrossbar_l285_8) begin
        io_masters_0_w_ready = decErr_io_axi_w_ready;
      end
    end
  end

  always @(*) begin
    io_masters_0_b_valid = 1'b0;
    if(!when_Axi4LiteCrossbar_l217) begin
      if(when_Axi4LiteCrossbar_l285) begin
        io_masters_0_b_valid = io_slaves_0_b_valid;
      end
    end
    if(!when_Axi4LiteCrossbar_l217_1) begin
      if(when_Axi4LiteCrossbar_l285_2) begin
        io_masters_0_b_valid = io_slaves_1_b_valid;
      end
    end
    if(!when_Axi4LiteCrossbar_l217_2) begin
      if(when_Axi4LiteCrossbar_l285_4) begin
        io_masters_0_b_valid = io_slaves_2_b_valid;
      end
    end
    if(!when_Axi4LiteCrossbar_l217_3) begin
      if(when_Axi4LiteCrossbar_l285_6) begin
        io_masters_0_b_valid = io_slaves_3_b_valid;
      end
    end
    if(!when_Axi4LiteCrossbar_l217_4) begin
      if(when_Axi4LiteCrossbar_l285_8) begin
        io_masters_0_b_valid = decErr_io_axi_b_valid;
      end
    end
  end

  always @(*) begin
    io_masters_0_b_payload_resp = _zz_io_masters_0_b_payload_resp[1 : 0];
    if(!when_Axi4LiteCrossbar_l217) begin
      if(when_Axi4LiteCrossbar_l285) begin
        io_masters_0_b_payload_resp = io_slaves_0_b_payload_resp;
      end
    end
    if(!when_Axi4LiteCrossbar_l217_1) begin
      if(when_Axi4LiteCrossbar_l285_2) begin
        io_masters_0_b_payload_resp = io_slaves_1_b_payload_resp;
      end
    end
    if(!when_Axi4LiteCrossbar_l217_2) begin
      if(when_Axi4LiteCrossbar_l285_4) begin
        io_masters_0_b_payload_resp = io_slaves_2_b_payload_resp;
      end
    end
    if(!when_Axi4LiteCrossbar_l217_3) begin
      if(when_Axi4LiteCrossbar_l285_6) begin
        io_masters_0_b_payload_resp = io_slaves_3_b_payload_resp;
      end
    end
    if(!when_Axi4LiteCrossbar_l217_4) begin
      if(when_Axi4LiteCrossbar_l285_8) begin
        io_masters_0_b_payload_resp = decErr_io_axi_b_payload_resp;
      end
    end
  end

  always @(*) begin
    io_masters_0_ar_ready = 1'b0;
    if(when_Axi4LiteCrossbar_l306) begin
      if(when_Axi4LiteCrossbar_l317) begin
        if(when_Axi4LiteCrossbar_l320) begin
          io_masters_0_ar_ready = io_slaves_0_ar_ready;
        end
      end
    end
    if(when_Axi4LiteCrossbar_l306_1) begin
      if(when_Axi4LiteCrossbar_l317_1) begin
        if(when_Axi4LiteCrossbar_l320_2) begin
          io_masters_0_ar_ready = io_slaves_1_ar_ready;
        end
      end
    end
    if(when_Axi4LiteCrossbar_l306_2) begin
      if(when_Axi4LiteCrossbar_l317_2) begin
        if(when_Axi4LiteCrossbar_l320_4) begin
          io_masters_0_ar_ready = io_slaves_2_ar_ready;
        end
      end
    end
    if(when_Axi4LiteCrossbar_l306_3) begin
      if(when_Axi4LiteCrossbar_l317_3) begin
        if(when_Axi4LiteCrossbar_l320_6) begin
          io_masters_0_ar_ready = io_slaves_3_ar_ready;
        end
      end
    end
    if(when_Axi4LiteCrossbar_l306_4) begin
      if(when_Axi4LiteCrossbar_l317_4) begin
        if(when_Axi4LiteCrossbar_l320_8) begin
          io_masters_0_ar_ready = decErr_io_axi_ar_ready;
        end
      end
    end
  end

  always @(*) begin
    io_masters_0_r_valid = 1'b0;
    if(!when_Axi4LiteCrossbar_l306) begin
      if(when_Axi4LiteCrossbar_l363) begin
        io_masters_0_r_valid = io_slaves_0_r_valid;
      end
    end
    if(!when_Axi4LiteCrossbar_l306_1) begin
      if(when_Axi4LiteCrossbar_l363_2) begin
        io_masters_0_r_valid = io_slaves_1_r_valid;
      end
    end
    if(!when_Axi4LiteCrossbar_l306_2) begin
      if(when_Axi4LiteCrossbar_l363_4) begin
        io_masters_0_r_valid = io_slaves_2_r_valid;
      end
    end
    if(!when_Axi4LiteCrossbar_l306_3) begin
      if(when_Axi4LiteCrossbar_l363_6) begin
        io_masters_0_r_valid = io_slaves_3_r_valid;
      end
    end
    if(!when_Axi4LiteCrossbar_l306_4) begin
      if(when_Axi4LiteCrossbar_l363_8) begin
        io_masters_0_r_valid = decErr_io_axi_r_valid;
      end
    end
  end

  assign _zz_io_masters_0_r_payload_data = 34'h0;
  always @(*) begin
    io_masters_0_r_payload_data = _zz_io_masters_0_r_payload_data[31 : 0];
    if(!when_Axi4LiteCrossbar_l306) begin
      if(when_Axi4LiteCrossbar_l363) begin
        io_masters_0_r_payload_data = io_slaves_0_r_payload_data;
      end
    end
    if(!when_Axi4LiteCrossbar_l306_1) begin
      if(when_Axi4LiteCrossbar_l363_2) begin
        io_masters_0_r_payload_data = io_slaves_1_r_payload_data;
      end
    end
    if(!when_Axi4LiteCrossbar_l306_2) begin
      if(when_Axi4LiteCrossbar_l363_4) begin
        io_masters_0_r_payload_data = io_slaves_2_r_payload_data;
      end
    end
    if(!when_Axi4LiteCrossbar_l306_3) begin
      if(when_Axi4LiteCrossbar_l363_6) begin
        io_masters_0_r_payload_data = io_slaves_3_r_payload_data;
      end
    end
    if(!when_Axi4LiteCrossbar_l306_4) begin
      if(when_Axi4LiteCrossbar_l363_8) begin
        io_masters_0_r_payload_data = decErr_io_axi_r_payload_data;
      end
    end
  end

  always @(*) begin
    io_masters_0_r_payload_resp = _zz_io_masters_0_r_payload_data[33 : 32];
    if(!when_Axi4LiteCrossbar_l306) begin
      if(when_Axi4LiteCrossbar_l363) begin
        io_masters_0_r_payload_resp = io_slaves_0_r_payload_resp;
      end
    end
    if(!when_Axi4LiteCrossbar_l306_1) begin
      if(when_Axi4LiteCrossbar_l363_2) begin
        io_masters_0_r_payload_resp = io_slaves_1_r_payload_resp;
      end
    end
    if(!when_Axi4LiteCrossbar_l306_2) begin
      if(when_Axi4LiteCrossbar_l363_4) begin
        io_masters_0_r_payload_resp = io_slaves_2_r_payload_resp;
      end
    end
    if(!when_Axi4LiteCrossbar_l306_3) begin
      if(when_Axi4LiteCrossbar_l363_6) begin
        io_masters_0_r_payload_resp = io_slaves_3_r_payload_resp;
      end
    end
    if(!when_Axi4LiteCrossbar_l306_4) begin
      if(when_Axi4LiteCrossbar_l363_8) begin
        io_masters_0_r_payload_resp = decErr_io_axi_r_payload_resp;
      end
    end
  end

  always @(*) begin
    io_masters_1_aw_ready = 1'b0;
    if(when_Axi4LiteCrossbar_l217) begin
      if(when_Axi4LiteCrossbar_l229) begin
        if(when_Axi4LiteCrossbar_l233_1) begin
          io_masters_1_aw_ready = io_slaves_0_aw_ready;
        end
      end
    end
    if(when_Axi4LiteCrossbar_l217_1) begin
      if(when_Axi4LiteCrossbar_l229_1) begin
        if(when_Axi4LiteCrossbar_l233_3) begin
          io_masters_1_aw_ready = io_slaves_1_aw_ready;
        end
      end
    end
    if(when_Axi4LiteCrossbar_l217_2) begin
      if(when_Axi4LiteCrossbar_l229_2) begin
        if(when_Axi4LiteCrossbar_l233_5) begin
          io_masters_1_aw_ready = io_slaves_2_aw_ready;
        end
      end
    end
    if(when_Axi4LiteCrossbar_l217_3) begin
      if(when_Axi4LiteCrossbar_l229_3) begin
        if(when_Axi4LiteCrossbar_l233_7) begin
          io_masters_1_aw_ready = io_slaves_3_aw_ready;
        end
      end
    end
    if(when_Axi4LiteCrossbar_l217_4) begin
      if(when_Axi4LiteCrossbar_l229_4) begin
        if(when_Axi4LiteCrossbar_l233_9) begin
          io_masters_1_aw_ready = decErr_io_axi_aw_ready;
        end
      end
    end
  end

  always @(*) begin
    io_masters_1_w_ready = 1'b0;
    if(when_Axi4LiteCrossbar_l217) begin
      if(when_Axi4LiteCrossbar_l229) begin
        if(when_Axi4LiteCrossbar_l233_1) begin
          io_masters_1_w_ready = io_slaves_0_w_ready;
        end
      end
    end else begin
      if(when_Axi4LiteCrossbar_l285_1) begin
        io_masters_1_w_ready = io_slaves_0_w_ready;
      end
    end
    if(when_Axi4LiteCrossbar_l217_1) begin
      if(when_Axi4LiteCrossbar_l229_1) begin
        if(when_Axi4LiteCrossbar_l233_3) begin
          io_masters_1_w_ready = io_slaves_1_w_ready;
        end
      end
    end else begin
      if(when_Axi4LiteCrossbar_l285_3) begin
        io_masters_1_w_ready = io_slaves_1_w_ready;
      end
    end
    if(when_Axi4LiteCrossbar_l217_2) begin
      if(when_Axi4LiteCrossbar_l229_2) begin
        if(when_Axi4LiteCrossbar_l233_5) begin
          io_masters_1_w_ready = io_slaves_2_w_ready;
        end
      end
    end else begin
      if(when_Axi4LiteCrossbar_l285_5) begin
        io_masters_1_w_ready = io_slaves_2_w_ready;
      end
    end
    if(when_Axi4LiteCrossbar_l217_3) begin
      if(when_Axi4LiteCrossbar_l229_3) begin
        if(when_Axi4LiteCrossbar_l233_7) begin
          io_masters_1_w_ready = io_slaves_3_w_ready;
        end
      end
    end else begin
      if(when_Axi4LiteCrossbar_l285_7) begin
        io_masters_1_w_ready = io_slaves_3_w_ready;
      end
    end
    if(when_Axi4LiteCrossbar_l217_4) begin
      if(when_Axi4LiteCrossbar_l229_4) begin
        if(when_Axi4LiteCrossbar_l233_9) begin
          io_masters_1_w_ready = decErr_io_axi_w_ready;
        end
      end
    end else begin
      if(when_Axi4LiteCrossbar_l285_9) begin
        io_masters_1_w_ready = decErr_io_axi_w_ready;
      end
    end
  end

  always @(*) begin
    io_masters_1_b_valid = 1'b0;
    if(!when_Axi4LiteCrossbar_l217) begin
      if(when_Axi4LiteCrossbar_l285_1) begin
        io_masters_1_b_valid = io_slaves_0_b_valid;
      end
    end
    if(!when_Axi4LiteCrossbar_l217_1) begin
      if(when_Axi4LiteCrossbar_l285_3) begin
        io_masters_1_b_valid = io_slaves_1_b_valid;
      end
    end
    if(!when_Axi4LiteCrossbar_l217_2) begin
      if(when_Axi4LiteCrossbar_l285_5) begin
        io_masters_1_b_valid = io_slaves_2_b_valid;
      end
    end
    if(!when_Axi4LiteCrossbar_l217_3) begin
      if(when_Axi4LiteCrossbar_l285_7) begin
        io_masters_1_b_valid = io_slaves_3_b_valid;
      end
    end
    if(!when_Axi4LiteCrossbar_l217_4) begin
      if(when_Axi4LiteCrossbar_l285_9) begin
        io_masters_1_b_valid = decErr_io_axi_b_valid;
      end
    end
  end

  always @(*) begin
    io_masters_1_b_payload_resp = _zz_io_masters_1_b_payload_resp[1 : 0];
    if(!when_Axi4LiteCrossbar_l217) begin
      if(when_Axi4LiteCrossbar_l285_1) begin
        io_masters_1_b_payload_resp = io_slaves_0_b_payload_resp;
      end
    end
    if(!when_Axi4LiteCrossbar_l217_1) begin
      if(when_Axi4LiteCrossbar_l285_3) begin
        io_masters_1_b_payload_resp = io_slaves_1_b_payload_resp;
      end
    end
    if(!when_Axi4LiteCrossbar_l217_2) begin
      if(when_Axi4LiteCrossbar_l285_5) begin
        io_masters_1_b_payload_resp = io_slaves_2_b_payload_resp;
      end
    end
    if(!when_Axi4LiteCrossbar_l217_3) begin
      if(when_Axi4LiteCrossbar_l285_7) begin
        io_masters_1_b_payload_resp = io_slaves_3_b_payload_resp;
      end
    end
    if(!when_Axi4LiteCrossbar_l217_4) begin
      if(when_Axi4LiteCrossbar_l285_9) begin
        io_masters_1_b_payload_resp = decErr_io_axi_b_payload_resp;
      end
    end
  end

  always @(*) begin
    io_masters_1_ar_ready = 1'b0;
    if(when_Axi4LiteCrossbar_l306) begin
      if(when_Axi4LiteCrossbar_l317) begin
        if(when_Axi4LiteCrossbar_l320_1) begin
          io_masters_1_ar_ready = io_slaves_0_ar_ready;
        end
      end
    end
    if(when_Axi4LiteCrossbar_l306_1) begin
      if(when_Axi4LiteCrossbar_l317_1) begin
        if(when_Axi4LiteCrossbar_l320_3) begin
          io_masters_1_ar_ready = io_slaves_1_ar_ready;
        end
      end
    end
    if(when_Axi4LiteCrossbar_l306_2) begin
      if(when_Axi4LiteCrossbar_l317_2) begin
        if(when_Axi4LiteCrossbar_l320_5) begin
          io_masters_1_ar_ready = io_slaves_2_ar_ready;
        end
      end
    end
    if(when_Axi4LiteCrossbar_l306_3) begin
      if(when_Axi4LiteCrossbar_l317_3) begin
        if(when_Axi4LiteCrossbar_l320_7) begin
          io_masters_1_ar_ready = io_slaves_3_ar_ready;
        end
      end
    end
    if(when_Axi4LiteCrossbar_l306_4) begin
      if(when_Axi4LiteCrossbar_l317_4) begin
        if(when_Axi4LiteCrossbar_l320_9) begin
          io_masters_1_ar_ready = decErr_io_axi_ar_ready;
        end
      end
    end
  end

  always @(*) begin
    io_masters_1_r_valid = 1'b0;
    if(!when_Axi4LiteCrossbar_l306) begin
      if(when_Axi4LiteCrossbar_l363_1) begin
        io_masters_1_r_valid = io_slaves_0_r_valid;
      end
    end
    if(!when_Axi4LiteCrossbar_l306_1) begin
      if(when_Axi4LiteCrossbar_l363_3) begin
        io_masters_1_r_valid = io_slaves_1_r_valid;
      end
    end
    if(!when_Axi4LiteCrossbar_l306_2) begin
      if(when_Axi4LiteCrossbar_l363_5) begin
        io_masters_1_r_valid = io_slaves_2_r_valid;
      end
    end
    if(!when_Axi4LiteCrossbar_l306_3) begin
      if(when_Axi4LiteCrossbar_l363_7) begin
        io_masters_1_r_valid = io_slaves_3_r_valid;
      end
    end
    if(!when_Axi4LiteCrossbar_l306_4) begin
      if(when_Axi4LiteCrossbar_l363_9) begin
        io_masters_1_r_valid = decErr_io_axi_r_valid;
      end
    end
  end

  assign _zz_io_masters_1_r_payload_data = 34'h0;
  always @(*) begin
    io_masters_1_r_payload_data = _zz_io_masters_1_r_payload_data[31 : 0];
    if(!when_Axi4LiteCrossbar_l306) begin
      if(when_Axi4LiteCrossbar_l363_1) begin
        io_masters_1_r_payload_data = io_slaves_0_r_payload_data;
      end
    end
    if(!when_Axi4LiteCrossbar_l306_1) begin
      if(when_Axi4LiteCrossbar_l363_3) begin
        io_masters_1_r_payload_data = io_slaves_1_r_payload_data;
      end
    end
    if(!when_Axi4LiteCrossbar_l306_2) begin
      if(when_Axi4LiteCrossbar_l363_5) begin
        io_masters_1_r_payload_data = io_slaves_2_r_payload_data;
      end
    end
    if(!when_Axi4LiteCrossbar_l306_3) begin
      if(when_Axi4LiteCrossbar_l363_7) begin
        io_masters_1_r_payload_data = io_slaves_3_r_payload_data;
      end
    end
    if(!when_Axi4LiteCrossbar_l306_4) begin
      if(when_Axi4LiteCrossbar_l363_9) begin
        io_masters_1_r_payload_data = decErr_io_axi_r_payload_data;
      end
    end
  end

  always @(*) begin
    io_masters_1_r_payload_resp = _zz_io_masters_1_r_payload_data[33 : 32];
    if(!when_Axi4LiteCrossbar_l306) begin
      if(when_Axi4LiteCrossbar_l363_1) begin
        io_masters_1_r_payload_resp = io_slaves_0_r_payload_resp;
      end
    end
    if(!when_Axi4LiteCrossbar_l306_1) begin
      if(when_Axi4LiteCrossbar_l363_3) begin
        io_masters_1_r_payload_resp = io_slaves_1_r_payload_resp;
      end
    end
    if(!when_Axi4LiteCrossbar_l306_2) begin
      if(when_Axi4LiteCrossbar_l363_5) begin
        io_masters_1_r_payload_resp = io_slaves_2_r_payload_resp;
      end
    end
    if(!when_Axi4LiteCrossbar_l306_3) begin
      if(when_Axi4LiteCrossbar_l363_7) begin
        io_masters_1_r_payload_resp = io_slaves_3_r_payload_resp;
      end
    end
    if(!when_Axi4LiteCrossbar_l306_4) begin
      if(when_Axi4LiteCrossbar_l363_9) begin
        io_masters_1_r_payload_resp = decErr_io_axi_r_payload_resp;
      end
    end
  end

  always @(*) begin
    io_slaves_0_aw_valid = 1'b0;
    if(when_Axi4LiteCrossbar_l217) begin
      if(when_Axi4LiteCrossbar_l229) begin
        io_slaves_0_aw_valid = 1'b1;
      end
    end
  end

  assign _zz_io_slaves_0_aw_payload_addr = 35'h0;
  always @(*) begin
    io_slaves_0_aw_payload_addr = _zz_io_slaves_0_aw_payload_addr[31 : 0];
    if(when_Axi4LiteCrossbar_l217) begin
      if(when_Axi4LiteCrossbar_l229) begin
        if(when_Axi4LiteCrossbar_l233) begin
          io_slaves_0_aw_payload_addr = io_masters_0_aw_payload_addr;
        end
        if(when_Axi4LiteCrossbar_l233_1) begin
          io_slaves_0_aw_payload_addr = io_masters_1_aw_payload_addr;
        end
      end
    end
  end

  always @(*) begin
    io_slaves_0_aw_payload_prot = _zz_io_slaves_0_aw_payload_addr[34 : 32];
    if(when_Axi4LiteCrossbar_l217) begin
      if(when_Axi4LiteCrossbar_l229) begin
        if(when_Axi4LiteCrossbar_l233) begin
          io_slaves_0_aw_payload_prot = io_masters_0_aw_payload_prot;
        end
        if(when_Axi4LiteCrossbar_l233_1) begin
          io_slaves_0_aw_payload_prot = io_masters_1_aw_payload_prot;
        end
      end
    end
  end

  always @(*) begin
    io_slaves_0_w_valid = 1'b0;
    if(when_Axi4LiteCrossbar_l217) begin
      if(when_Axi4LiteCrossbar_l229) begin
        if(when_Axi4LiteCrossbar_l233) begin
          io_slaves_0_w_valid = io_masters_0_w_valid;
        end
        if(when_Axi4LiteCrossbar_l233_1) begin
          io_slaves_0_w_valid = io_masters_1_w_valid;
        end
      end
    end else begin
      if(when_Axi4LiteCrossbar_l285) begin
        io_slaves_0_w_valid = io_masters_0_w_valid;
      end
      if(when_Axi4LiteCrossbar_l285_1) begin
        io_slaves_0_w_valid = io_masters_1_w_valid;
      end
    end
  end

  assign _zz_io_slaves_0_w_payload_data = 36'h0;
  always @(*) begin
    io_slaves_0_w_payload_data = _zz_io_slaves_0_w_payload_data[31 : 0];
    if(when_Axi4LiteCrossbar_l217) begin
      if(when_Axi4LiteCrossbar_l229) begin
        if(when_Axi4LiteCrossbar_l233) begin
          io_slaves_0_w_payload_data = io_masters_0_w_payload_data;
        end
        if(when_Axi4LiteCrossbar_l233_1) begin
          io_slaves_0_w_payload_data = io_masters_1_w_payload_data;
        end
      end
    end else begin
      if(when_Axi4LiteCrossbar_l285) begin
        io_slaves_0_w_payload_data = io_masters_0_w_payload_data;
      end
      if(when_Axi4LiteCrossbar_l285_1) begin
        io_slaves_0_w_payload_data = io_masters_1_w_payload_data;
      end
    end
  end

  always @(*) begin
    io_slaves_0_w_payload_strb = _zz_io_slaves_0_w_payload_data[35 : 32];
    if(when_Axi4LiteCrossbar_l217) begin
      if(when_Axi4LiteCrossbar_l229) begin
        if(when_Axi4LiteCrossbar_l233) begin
          io_slaves_0_w_payload_strb = io_masters_0_w_payload_strb;
        end
        if(when_Axi4LiteCrossbar_l233_1) begin
          io_slaves_0_w_payload_strb = io_masters_1_w_payload_strb;
        end
      end
    end else begin
      if(when_Axi4LiteCrossbar_l285) begin
        io_slaves_0_w_payload_strb = io_masters_0_w_payload_strb;
      end
      if(when_Axi4LiteCrossbar_l285_1) begin
        io_slaves_0_w_payload_strb = io_masters_1_w_payload_strb;
      end
    end
  end

  always @(*) begin
    io_slaves_0_b_ready = 1'b0;
    if(!when_Axi4LiteCrossbar_l217) begin
      if(when_Axi4LiteCrossbar_l285) begin
        io_slaves_0_b_ready = io_masters_0_b_ready;
      end
      if(when_Axi4LiteCrossbar_l285_1) begin
        io_slaves_0_b_ready = io_masters_1_b_ready;
      end
    end
  end

  always @(*) begin
    io_slaves_0_ar_valid = 1'b0;
    if(when_Axi4LiteCrossbar_l306) begin
      if(when_Axi4LiteCrossbar_l317) begin
        io_slaves_0_ar_valid = 1'b1;
      end
    end
  end

  assign _zz_io_slaves_0_ar_payload_addr = 35'h0;
  always @(*) begin
    io_slaves_0_ar_payload_addr = _zz_io_slaves_0_ar_payload_addr[31 : 0];
    if(when_Axi4LiteCrossbar_l306) begin
      if(when_Axi4LiteCrossbar_l317) begin
        if(when_Axi4LiteCrossbar_l320) begin
          io_slaves_0_ar_payload_addr = io_masters_0_ar_payload_addr;
        end
        if(when_Axi4LiteCrossbar_l320_1) begin
          io_slaves_0_ar_payload_addr = io_masters_1_ar_payload_addr;
        end
      end
    end
  end

  always @(*) begin
    io_slaves_0_ar_payload_prot = _zz_io_slaves_0_ar_payload_addr[34 : 32];
    if(when_Axi4LiteCrossbar_l306) begin
      if(when_Axi4LiteCrossbar_l317) begin
        if(when_Axi4LiteCrossbar_l320) begin
          io_slaves_0_ar_payload_prot = io_masters_0_ar_payload_prot;
        end
        if(when_Axi4LiteCrossbar_l320_1) begin
          io_slaves_0_ar_payload_prot = io_masters_1_ar_payload_prot;
        end
      end
    end
  end

  always @(*) begin
    io_slaves_0_r_ready = 1'b0;
    if(!when_Axi4LiteCrossbar_l306) begin
      if(when_Axi4LiteCrossbar_l363) begin
        io_slaves_0_r_ready = io_masters_0_r_ready;
      end
      if(when_Axi4LiteCrossbar_l363_1) begin
        io_slaves_0_r_ready = io_masters_1_r_ready;
      end
    end
  end

  always @(*) begin
    io_slaves_1_aw_valid = 1'b0;
    if(when_Axi4LiteCrossbar_l217_1) begin
      if(when_Axi4LiteCrossbar_l229_1) begin
        io_slaves_1_aw_valid = 1'b1;
      end
    end
  end

  assign _zz_io_slaves_1_aw_payload_addr = 35'h0;
  always @(*) begin
    io_slaves_1_aw_payload_addr = _zz_io_slaves_1_aw_payload_addr[31 : 0];
    if(when_Axi4LiteCrossbar_l217_1) begin
      if(when_Axi4LiteCrossbar_l229_1) begin
        if(when_Axi4LiteCrossbar_l233_2) begin
          io_slaves_1_aw_payload_addr = io_masters_0_aw_payload_addr;
        end
        if(when_Axi4LiteCrossbar_l233_3) begin
          io_slaves_1_aw_payload_addr = io_masters_1_aw_payload_addr;
        end
      end
    end
  end

  always @(*) begin
    io_slaves_1_aw_payload_prot = _zz_io_slaves_1_aw_payload_addr[34 : 32];
    if(when_Axi4LiteCrossbar_l217_1) begin
      if(when_Axi4LiteCrossbar_l229_1) begin
        if(when_Axi4LiteCrossbar_l233_2) begin
          io_slaves_1_aw_payload_prot = io_masters_0_aw_payload_prot;
        end
        if(when_Axi4LiteCrossbar_l233_3) begin
          io_slaves_1_aw_payload_prot = io_masters_1_aw_payload_prot;
        end
      end
    end
  end

  always @(*) begin
    io_slaves_1_w_valid = 1'b0;
    if(when_Axi4LiteCrossbar_l217_1) begin
      if(when_Axi4LiteCrossbar_l229_1) begin
        if(when_Axi4LiteCrossbar_l233_2) begin
          io_slaves_1_w_valid = io_masters_0_w_valid;
        end
        if(when_Axi4LiteCrossbar_l233_3) begin
          io_slaves_1_w_valid = io_masters_1_w_valid;
        end
      end
    end else begin
      if(when_Axi4LiteCrossbar_l285_2) begin
        io_slaves_1_w_valid = io_masters_0_w_valid;
      end
      if(when_Axi4LiteCrossbar_l285_3) begin
        io_slaves_1_w_valid = io_masters_1_w_valid;
      end
    end
  end

  assign _zz_io_slaves_1_w_payload_data = 36'h0;
  always @(*) begin
    io_slaves_1_w_payload_data = _zz_io_slaves_1_w_payload_data[31 : 0];
    if(when_Axi4LiteCrossbar_l217_1) begin
      if(when_Axi4LiteCrossbar_l229_1) begin
        if(when_Axi4LiteCrossbar_l233_2) begin
          io_slaves_1_w_payload_data = io_masters_0_w_payload_data;
        end
        if(when_Axi4LiteCrossbar_l233_3) begin
          io_slaves_1_w_payload_data = io_masters_1_w_payload_data;
        end
      end
    end else begin
      if(when_Axi4LiteCrossbar_l285_2) begin
        io_slaves_1_w_payload_data = io_masters_0_w_payload_data;
      end
      if(when_Axi4LiteCrossbar_l285_3) begin
        io_slaves_1_w_payload_data = io_masters_1_w_payload_data;
      end
    end
  end

  always @(*) begin
    io_slaves_1_w_payload_strb = _zz_io_slaves_1_w_payload_data[35 : 32];
    if(when_Axi4LiteCrossbar_l217_1) begin
      if(when_Axi4LiteCrossbar_l229_1) begin
        if(when_Axi4LiteCrossbar_l233_2) begin
          io_slaves_1_w_payload_strb = io_masters_0_w_payload_strb;
        end
        if(when_Axi4LiteCrossbar_l233_3) begin
          io_slaves_1_w_payload_strb = io_masters_1_w_payload_strb;
        end
      end
    end else begin
      if(when_Axi4LiteCrossbar_l285_2) begin
        io_slaves_1_w_payload_strb = io_masters_0_w_payload_strb;
      end
      if(when_Axi4LiteCrossbar_l285_3) begin
        io_slaves_1_w_payload_strb = io_masters_1_w_payload_strb;
      end
    end
  end

  always @(*) begin
    io_slaves_1_b_ready = 1'b0;
    if(!when_Axi4LiteCrossbar_l217_1) begin
      if(when_Axi4LiteCrossbar_l285_2) begin
        io_slaves_1_b_ready = io_masters_0_b_ready;
      end
      if(when_Axi4LiteCrossbar_l285_3) begin
        io_slaves_1_b_ready = io_masters_1_b_ready;
      end
    end
  end

  always @(*) begin
    io_slaves_1_ar_valid = 1'b0;
    if(when_Axi4LiteCrossbar_l306_1) begin
      if(when_Axi4LiteCrossbar_l317_1) begin
        io_slaves_1_ar_valid = 1'b1;
      end
    end
  end

  assign _zz_io_slaves_1_ar_payload_addr = 35'h0;
  always @(*) begin
    io_slaves_1_ar_payload_addr = _zz_io_slaves_1_ar_payload_addr[31 : 0];
    if(when_Axi4LiteCrossbar_l306_1) begin
      if(when_Axi4LiteCrossbar_l317_1) begin
        if(when_Axi4LiteCrossbar_l320_2) begin
          io_slaves_1_ar_payload_addr = io_masters_0_ar_payload_addr;
        end
        if(when_Axi4LiteCrossbar_l320_3) begin
          io_slaves_1_ar_payload_addr = io_masters_1_ar_payload_addr;
        end
      end
    end
  end

  always @(*) begin
    io_slaves_1_ar_payload_prot = _zz_io_slaves_1_ar_payload_addr[34 : 32];
    if(when_Axi4LiteCrossbar_l306_1) begin
      if(when_Axi4LiteCrossbar_l317_1) begin
        if(when_Axi4LiteCrossbar_l320_2) begin
          io_slaves_1_ar_payload_prot = io_masters_0_ar_payload_prot;
        end
        if(when_Axi4LiteCrossbar_l320_3) begin
          io_slaves_1_ar_payload_prot = io_masters_1_ar_payload_prot;
        end
      end
    end
  end

  always @(*) begin
    io_slaves_1_r_ready = 1'b0;
    if(!when_Axi4LiteCrossbar_l306_1) begin
      if(when_Axi4LiteCrossbar_l363_2) begin
        io_slaves_1_r_ready = io_masters_0_r_ready;
      end
      if(when_Axi4LiteCrossbar_l363_3) begin
        io_slaves_1_r_ready = io_masters_1_r_ready;
      end
    end
  end

  always @(*) begin
    io_slaves_2_aw_valid = 1'b0;
    if(when_Axi4LiteCrossbar_l217_2) begin
      if(when_Axi4LiteCrossbar_l229_2) begin
        io_slaves_2_aw_valid = 1'b1;
      end
    end
  end

  assign _zz_io_slaves_2_aw_payload_addr = 35'h0;
  always @(*) begin
    io_slaves_2_aw_payload_addr = _zz_io_slaves_2_aw_payload_addr[31 : 0];
    if(when_Axi4LiteCrossbar_l217_2) begin
      if(when_Axi4LiteCrossbar_l229_2) begin
        if(when_Axi4LiteCrossbar_l233_4) begin
          io_slaves_2_aw_payload_addr = io_masters_0_aw_payload_addr;
        end
        if(when_Axi4LiteCrossbar_l233_5) begin
          io_slaves_2_aw_payload_addr = io_masters_1_aw_payload_addr;
        end
      end
    end
  end

  always @(*) begin
    io_slaves_2_aw_payload_prot = _zz_io_slaves_2_aw_payload_addr[34 : 32];
    if(when_Axi4LiteCrossbar_l217_2) begin
      if(when_Axi4LiteCrossbar_l229_2) begin
        if(when_Axi4LiteCrossbar_l233_4) begin
          io_slaves_2_aw_payload_prot = io_masters_0_aw_payload_prot;
        end
        if(when_Axi4LiteCrossbar_l233_5) begin
          io_slaves_2_aw_payload_prot = io_masters_1_aw_payload_prot;
        end
      end
    end
  end

  always @(*) begin
    io_slaves_2_w_valid = 1'b0;
    if(when_Axi4LiteCrossbar_l217_2) begin
      if(when_Axi4LiteCrossbar_l229_2) begin
        if(when_Axi4LiteCrossbar_l233_4) begin
          io_slaves_2_w_valid = io_masters_0_w_valid;
        end
        if(when_Axi4LiteCrossbar_l233_5) begin
          io_slaves_2_w_valid = io_masters_1_w_valid;
        end
      end
    end else begin
      if(when_Axi4LiteCrossbar_l285_4) begin
        io_slaves_2_w_valid = io_masters_0_w_valid;
      end
      if(when_Axi4LiteCrossbar_l285_5) begin
        io_slaves_2_w_valid = io_masters_1_w_valid;
      end
    end
  end

  assign _zz_io_slaves_2_w_payload_data = 36'h0;
  always @(*) begin
    io_slaves_2_w_payload_data = _zz_io_slaves_2_w_payload_data[31 : 0];
    if(when_Axi4LiteCrossbar_l217_2) begin
      if(when_Axi4LiteCrossbar_l229_2) begin
        if(when_Axi4LiteCrossbar_l233_4) begin
          io_slaves_2_w_payload_data = io_masters_0_w_payload_data;
        end
        if(when_Axi4LiteCrossbar_l233_5) begin
          io_slaves_2_w_payload_data = io_masters_1_w_payload_data;
        end
      end
    end else begin
      if(when_Axi4LiteCrossbar_l285_4) begin
        io_slaves_2_w_payload_data = io_masters_0_w_payload_data;
      end
      if(when_Axi4LiteCrossbar_l285_5) begin
        io_slaves_2_w_payload_data = io_masters_1_w_payload_data;
      end
    end
  end

  always @(*) begin
    io_slaves_2_w_payload_strb = _zz_io_slaves_2_w_payload_data[35 : 32];
    if(when_Axi4LiteCrossbar_l217_2) begin
      if(when_Axi4LiteCrossbar_l229_2) begin
        if(when_Axi4LiteCrossbar_l233_4) begin
          io_slaves_2_w_payload_strb = io_masters_0_w_payload_strb;
        end
        if(when_Axi4LiteCrossbar_l233_5) begin
          io_slaves_2_w_payload_strb = io_masters_1_w_payload_strb;
        end
      end
    end else begin
      if(when_Axi4LiteCrossbar_l285_4) begin
        io_slaves_2_w_payload_strb = io_masters_0_w_payload_strb;
      end
      if(when_Axi4LiteCrossbar_l285_5) begin
        io_slaves_2_w_payload_strb = io_masters_1_w_payload_strb;
      end
    end
  end

  always @(*) begin
    io_slaves_2_b_ready = 1'b0;
    if(!when_Axi4LiteCrossbar_l217_2) begin
      if(when_Axi4LiteCrossbar_l285_4) begin
        io_slaves_2_b_ready = io_masters_0_b_ready;
      end
      if(when_Axi4LiteCrossbar_l285_5) begin
        io_slaves_2_b_ready = io_masters_1_b_ready;
      end
    end
  end

  always @(*) begin
    io_slaves_2_ar_valid = 1'b0;
    if(when_Axi4LiteCrossbar_l306_2) begin
      if(when_Axi4LiteCrossbar_l317_2) begin
        io_slaves_2_ar_valid = 1'b1;
      end
    end
  end

  assign _zz_io_slaves_2_ar_payload_addr = 35'h0;
  always @(*) begin
    io_slaves_2_ar_payload_addr = _zz_io_slaves_2_ar_payload_addr[31 : 0];
    if(when_Axi4LiteCrossbar_l306_2) begin
      if(when_Axi4LiteCrossbar_l317_2) begin
        if(when_Axi4LiteCrossbar_l320_4) begin
          io_slaves_2_ar_payload_addr = io_masters_0_ar_payload_addr;
        end
        if(when_Axi4LiteCrossbar_l320_5) begin
          io_slaves_2_ar_payload_addr = io_masters_1_ar_payload_addr;
        end
      end
    end
  end

  always @(*) begin
    io_slaves_2_ar_payload_prot = _zz_io_slaves_2_ar_payload_addr[34 : 32];
    if(when_Axi4LiteCrossbar_l306_2) begin
      if(when_Axi4LiteCrossbar_l317_2) begin
        if(when_Axi4LiteCrossbar_l320_4) begin
          io_slaves_2_ar_payload_prot = io_masters_0_ar_payload_prot;
        end
        if(when_Axi4LiteCrossbar_l320_5) begin
          io_slaves_2_ar_payload_prot = io_masters_1_ar_payload_prot;
        end
      end
    end
  end

  always @(*) begin
    io_slaves_2_r_ready = 1'b0;
    if(!when_Axi4LiteCrossbar_l306_2) begin
      if(when_Axi4LiteCrossbar_l363_4) begin
        io_slaves_2_r_ready = io_masters_0_r_ready;
      end
      if(when_Axi4LiteCrossbar_l363_5) begin
        io_slaves_2_r_ready = io_masters_1_r_ready;
      end
    end
  end

  always @(*) begin
    io_slaves_3_aw_valid = 1'b0;
    if(when_Axi4LiteCrossbar_l217_3) begin
      if(when_Axi4LiteCrossbar_l229_3) begin
        io_slaves_3_aw_valid = 1'b1;
      end
    end
  end

  assign _zz_io_slaves_3_aw_payload_addr = 35'h0;
  always @(*) begin
    io_slaves_3_aw_payload_addr = _zz_io_slaves_3_aw_payload_addr[31 : 0];
    if(when_Axi4LiteCrossbar_l217_3) begin
      if(when_Axi4LiteCrossbar_l229_3) begin
        if(when_Axi4LiteCrossbar_l233_6) begin
          io_slaves_3_aw_payload_addr = io_masters_0_aw_payload_addr;
        end
        if(when_Axi4LiteCrossbar_l233_7) begin
          io_slaves_3_aw_payload_addr = io_masters_1_aw_payload_addr;
        end
      end
    end
  end

  always @(*) begin
    io_slaves_3_aw_payload_prot = _zz_io_slaves_3_aw_payload_addr[34 : 32];
    if(when_Axi4LiteCrossbar_l217_3) begin
      if(when_Axi4LiteCrossbar_l229_3) begin
        if(when_Axi4LiteCrossbar_l233_6) begin
          io_slaves_3_aw_payload_prot = io_masters_0_aw_payload_prot;
        end
        if(when_Axi4LiteCrossbar_l233_7) begin
          io_slaves_3_aw_payload_prot = io_masters_1_aw_payload_prot;
        end
      end
    end
  end

  always @(*) begin
    io_slaves_3_w_valid = 1'b0;
    if(when_Axi4LiteCrossbar_l217_3) begin
      if(when_Axi4LiteCrossbar_l229_3) begin
        if(when_Axi4LiteCrossbar_l233_6) begin
          io_slaves_3_w_valid = io_masters_0_w_valid;
        end
        if(when_Axi4LiteCrossbar_l233_7) begin
          io_slaves_3_w_valid = io_masters_1_w_valid;
        end
      end
    end else begin
      if(when_Axi4LiteCrossbar_l285_6) begin
        io_slaves_3_w_valid = io_masters_0_w_valid;
      end
      if(when_Axi4LiteCrossbar_l285_7) begin
        io_slaves_3_w_valid = io_masters_1_w_valid;
      end
    end
  end

  assign _zz_io_slaves_3_w_payload_data = 36'h0;
  always @(*) begin
    io_slaves_3_w_payload_data = _zz_io_slaves_3_w_payload_data[31 : 0];
    if(when_Axi4LiteCrossbar_l217_3) begin
      if(when_Axi4LiteCrossbar_l229_3) begin
        if(when_Axi4LiteCrossbar_l233_6) begin
          io_slaves_3_w_payload_data = io_masters_0_w_payload_data;
        end
        if(when_Axi4LiteCrossbar_l233_7) begin
          io_slaves_3_w_payload_data = io_masters_1_w_payload_data;
        end
      end
    end else begin
      if(when_Axi4LiteCrossbar_l285_6) begin
        io_slaves_3_w_payload_data = io_masters_0_w_payload_data;
      end
      if(when_Axi4LiteCrossbar_l285_7) begin
        io_slaves_3_w_payload_data = io_masters_1_w_payload_data;
      end
    end
  end

  always @(*) begin
    io_slaves_3_w_payload_strb = _zz_io_slaves_3_w_payload_data[35 : 32];
    if(when_Axi4LiteCrossbar_l217_3) begin
      if(when_Axi4LiteCrossbar_l229_3) begin
        if(when_Axi4LiteCrossbar_l233_6) begin
          io_slaves_3_w_payload_strb = io_masters_0_w_payload_strb;
        end
        if(when_Axi4LiteCrossbar_l233_7) begin
          io_slaves_3_w_payload_strb = io_masters_1_w_payload_strb;
        end
      end
    end else begin
      if(when_Axi4LiteCrossbar_l285_6) begin
        io_slaves_3_w_payload_strb = io_masters_0_w_payload_strb;
      end
      if(when_Axi4LiteCrossbar_l285_7) begin
        io_slaves_3_w_payload_strb = io_masters_1_w_payload_strb;
      end
    end
  end

  always @(*) begin
    io_slaves_3_b_ready = 1'b0;
    if(!when_Axi4LiteCrossbar_l217_3) begin
      if(when_Axi4LiteCrossbar_l285_6) begin
        io_slaves_3_b_ready = io_masters_0_b_ready;
      end
      if(when_Axi4LiteCrossbar_l285_7) begin
        io_slaves_3_b_ready = io_masters_1_b_ready;
      end
    end
  end

  always @(*) begin
    io_slaves_3_ar_valid = 1'b0;
    if(when_Axi4LiteCrossbar_l306_3) begin
      if(when_Axi4LiteCrossbar_l317_3) begin
        io_slaves_3_ar_valid = 1'b1;
      end
    end
  end

  assign _zz_io_slaves_3_ar_payload_addr = 35'h0;
  always @(*) begin
    io_slaves_3_ar_payload_addr = _zz_io_slaves_3_ar_payload_addr[31 : 0];
    if(when_Axi4LiteCrossbar_l306_3) begin
      if(when_Axi4LiteCrossbar_l317_3) begin
        if(when_Axi4LiteCrossbar_l320_6) begin
          io_slaves_3_ar_payload_addr = io_masters_0_ar_payload_addr;
        end
        if(when_Axi4LiteCrossbar_l320_7) begin
          io_slaves_3_ar_payload_addr = io_masters_1_ar_payload_addr;
        end
      end
    end
  end

  always @(*) begin
    io_slaves_3_ar_payload_prot = _zz_io_slaves_3_ar_payload_addr[34 : 32];
    if(when_Axi4LiteCrossbar_l306_3) begin
      if(when_Axi4LiteCrossbar_l317_3) begin
        if(when_Axi4LiteCrossbar_l320_6) begin
          io_slaves_3_ar_payload_prot = io_masters_0_ar_payload_prot;
        end
        if(when_Axi4LiteCrossbar_l320_7) begin
          io_slaves_3_ar_payload_prot = io_masters_1_ar_payload_prot;
        end
      end
    end
  end

  always @(*) begin
    io_slaves_3_r_ready = 1'b0;
    if(!when_Axi4LiteCrossbar_l306_3) begin
      if(when_Axi4LiteCrossbar_l363_6) begin
        io_slaves_3_r_ready = io_masters_0_r_ready;
      end
      if(when_Axi4LiteCrossbar_l363_7) begin
        io_slaves_3_r_ready = io_masters_1_r_ready;
      end
    end
  end

  always @(*) begin
    decErr_io_axi_aw_valid = 1'b0;
    if(when_Axi4LiteCrossbar_l217_4) begin
      if(when_Axi4LiteCrossbar_l229_4) begin
        decErr_io_axi_aw_valid = 1'b1;
      end
    end
  end

  assign _zz_io_axi_aw_payload_addr = 35'h0;
  always @(*) begin
    decErr_io_axi_aw_payload_addr = _zz_io_axi_aw_payload_addr[31 : 0];
    if(when_Axi4LiteCrossbar_l217_4) begin
      if(when_Axi4LiteCrossbar_l229_4) begin
        if(when_Axi4LiteCrossbar_l233_8) begin
          decErr_io_axi_aw_payload_addr = io_masters_0_aw_payload_addr;
        end
        if(when_Axi4LiteCrossbar_l233_9) begin
          decErr_io_axi_aw_payload_addr = io_masters_1_aw_payload_addr;
        end
      end
    end
  end

  always @(*) begin
    decErr_io_axi_aw_payload_prot = _zz_io_axi_aw_payload_addr[34 : 32];
    if(when_Axi4LiteCrossbar_l217_4) begin
      if(when_Axi4LiteCrossbar_l229_4) begin
        if(when_Axi4LiteCrossbar_l233_8) begin
          decErr_io_axi_aw_payload_prot = io_masters_0_aw_payload_prot;
        end
        if(when_Axi4LiteCrossbar_l233_9) begin
          decErr_io_axi_aw_payload_prot = io_masters_1_aw_payload_prot;
        end
      end
    end
  end

  always @(*) begin
    decErr_io_axi_w_valid = 1'b0;
    if(when_Axi4LiteCrossbar_l217_4) begin
      if(when_Axi4LiteCrossbar_l229_4) begin
        if(when_Axi4LiteCrossbar_l233_8) begin
          decErr_io_axi_w_valid = io_masters_0_w_valid;
        end
        if(when_Axi4LiteCrossbar_l233_9) begin
          decErr_io_axi_w_valid = io_masters_1_w_valid;
        end
      end
    end else begin
      if(when_Axi4LiteCrossbar_l285_8) begin
        decErr_io_axi_w_valid = io_masters_0_w_valid;
      end
      if(when_Axi4LiteCrossbar_l285_9) begin
        decErr_io_axi_w_valid = io_masters_1_w_valid;
      end
    end
  end

  assign _zz_io_axi_w_payload_data = 36'h0;
  always @(*) begin
    decErr_io_axi_w_payload_data = _zz_io_axi_w_payload_data[31 : 0];
    if(when_Axi4LiteCrossbar_l217_4) begin
      if(when_Axi4LiteCrossbar_l229_4) begin
        if(when_Axi4LiteCrossbar_l233_8) begin
          decErr_io_axi_w_payload_data = io_masters_0_w_payload_data;
        end
        if(when_Axi4LiteCrossbar_l233_9) begin
          decErr_io_axi_w_payload_data = io_masters_1_w_payload_data;
        end
      end
    end else begin
      if(when_Axi4LiteCrossbar_l285_8) begin
        decErr_io_axi_w_payload_data = io_masters_0_w_payload_data;
      end
      if(when_Axi4LiteCrossbar_l285_9) begin
        decErr_io_axi_w_payload_data = io_masters_1_w_payload_data;
      end
    end
  end

  always @(*) begin
    decErr_io_axi_w_payload_strb = _zz_io_axi_w_payload_data[35 : 32];
    if(when_Axi4LiteCrossbar_l217_4) begin
      if(when_Axi4LiteCrossbar_l229_4) begin
        if(when_Axi4LiteCrossbar_l233_8) begin
          decErr_io_axi_w_payload_strb = io_masters_0_w_payload_strb;
        end
        if(when_Axi4LiteCrossbar_l233_9) begin
          decErr_io_axi_w_payload_strb = io_masters_1_w_payload_strb;
        end
      end
    end else begin
      if(when_Axi4LiteCrossbar_l285_8) begin
        decErr_io_axi_w_payload_strb = io_masters_0_w_payload_strb;
      end
      if(when_Axi4LiteCrossbar_l285_9) begin
        decErr_io_axi_w_payload_strb = io_masters_1_w_payload_strb;
      end
    end
  end

  always @(*) begin
    decErr_io_axi_b_ready = 1'b0;
    if(!when_Axi4LiteCrossbar_l217_4) begin
      if(when_Axi4LiteCrossbar_l285_8) begin
        decErr_io_axi_b_ready = io_masters_0_b_ready;
      end
      if(when_Axi4LiteCrossbar_l285_9) begin
        decErr_io_axi_b_ready = io_masters_1_b_ready;
      end
    end
  end

  always @(*) begin
    decErr_io_axi_ar_valid = 1'b0;
    if(when_Axi4LiteCrossbar_l306_4) begin
      if(when_Axi4LiteCrossbar_l317_4) begin
        decErr_io_axi_ar_valid = 1'b1;
      end
    end
  end

  assign _zz_io_axi_ar_payload_addr = 35'h0;
  always @(*) begin
    decErr_io_axi_ar_payload_addr = _zz_io_axi_ar_payload_addr[31 : 0];
    if(when_Axi4LiteCrossbar_l306_4) begin
      if(when_Axi4LiteCrossbar_l317_4) begin
        if(when_Axi4LiteCrossbar_l320_8) begin
          decErr_io_axi_ar_payload_addr = io_masters_0_ar_payload_addr;
        end
        if(when_Axi4LiteCrossbar_l320_9) begin
          decErr_io_axi_ar_payload_addr = io_masters_1_ar_payload_addr;
        end
      end
    end
  end

  always @(*) begin
    decErr_io_axi_ar_payload_prot = _zz_io_axi_ar_payload_addr[34 : 32];
    if(when_Axi4LiteCrossbar_l306_4) begin
      if(when_Axi4LiteCrossbar_l317_4) begin
        if(when_Axi4LiteCrossbar_l320_8) begin
          decErr_io_axi_ar_payload_prot = io_masters_0_ar_payload_prot;
        end
        if(when_Axi4LiteCrossbar_l320_9) begin
          decErr_io_axi_ar_payload_prot = io_masters_1_ar_payload_prot;
        end
      end
    end
  end

  always @(*) begin
    decErr_io_axi_r_ready = 1'b0;
    if(!when_Axi4LiteCrossbar_l306_4) begin
      if(when_Axi4LiteCrossbar_l363_8) begin
        decErr_io_axi_r_ready = io_masters_0_r_ready;
      end
      if(when_Axi4LiteCrossbar_l363_9) begin
        decErr_io_axi_r_ready = io_masters_1_r_ready;
      end
    end
  end

  assign when_Axi4LiteCrossbar_l217 = (! wrActive_0);
  always @(*) begin
    _zz_when_Axi4LiteCrossbar_l229_1[0] = ((32'h0 <= io_masters_0_aw_payload_addr) && (io_masters_0_aw_payload_addr < 32'h00010000));
    _zz_when_Axi4LiteCrossbar_l229_1[1] = ((32'h00010000 <= io_masters_0_aw_payload_addr) && (io_masters_0_aw_payload_addr < 32'h00020000));
    _zz_when_Axi4LiteCrossbar_l229_1[2] = ((32'h00020000 <= io_masters_0_aw_payload_addr) && (io_masters_0_aw_payload_addr < 32'h00030000));
    _zz_when_Axi4LiteCrossbar_l229_1[3] = ((32'h00030000 <= io_masters_0_aw_payload_addr) && (io_masters_0_aw_payload_addr < 32'h00040000));
  end

  always @(*) begin
    _zz_when_Axi4LiteCrossbar_l229[0] = (io_masters_0_aw_valid && _zz__zz_when_Axi4LiteCrossbar_l229[0]);
    _zz_when_Axi4LiteCrossbar_l229[1] = (io_masters_1_aw_valid && _zz__zz_when_Axi4LiteCrossbar_l229_1[0]);
  end

  always @(*) begin
    _zz_when_Axi4LiteCrossbar_l229_2[0] = ((32'h0 <= io_masters_1_aw_payload_addr) && (io_masters_1_aw_payload_addr < 32'h00010000));
    _zz_when_Axi4LiteCrossbar_l229_2[1] = ((32'h00010000 <= io_masters_1_aw_payload_addr) && (io_masters_1_aw_payload_addr < 32'h00020000));
    _zz_when_Axi4LiteCrossbar_l229_2[2] = ((32'h00020000 <= io_masters_1_aw_payload_addr) && (io_masters_1_aw_payload_addr < 32'h00030000));
    _zz_when_Axi4LiteCrossbar_l229_2[3] = ((32'h00030000 <= io_masters_1_aw_payload_addr) && (io_masters_1_aw_payload_addr < 32'h00040000));
  end

  always @(*) begin
    _zz_when_Axi4LiteCrossbar_l152 = 2'b00;
    if(when_Axi4LiteCrossbar_l109) begin
      _zz_when_Axi4LiteCrossbar_l152 = 2'b01;
    end
  end

  assign when_Axi4LiteCrossbar_l109 = (1'b1 <= wrRrPtr_0);
  assign _zz_when_Axi4LiteCrossbar_l152_1 = (_zz_when_Axi4LiteCrossbar_l229 & (~ _zz_when_Axi4LiteCrossbar_l152));
  assign _zz_when_Axi4LiteCrossbar_l152_2 = _zz_when_Axi4LiteCrossbar_l152_1;
  assign _zz_when_Axi4LiteCrossbar_l152_3 = _zz_when_Axi4LiteCrossbar_l229;
  assign _zz_when_Axi4LiteCrossbar_l152_4 = ((|_zz_when_Axi4LiteCrossbar_l152_1) ? (_zz_when_Axi4LiteCrossbar_l152_2 & (~ _zz__zz_when_Axi4LiteCrossbar_l152_4)) : (_zz_when_Axi4LiteCrossbar_l152_3 & (~ _zz__zz_when_Axi4LiteCrossbar_l152_4_1)));
  always @(*) begin
    _zz_wrGranted_0 = 1'b0;
    if(when_Axi4LiteCrossbar_l152) begin
      _zz_wrGranted_0 = 1'b0;
    end
    if(when_Axi4LiteCrossbar_l152_1) begin
      _zz_wrGranted_0 = 1'b1;
    end
  end

  assign when_Axi4LiteCrossbar_l152 = _zz_when_Axi4LiteCrossbar_l152_4[0];
  assign when_Axi4LiteCrossbar_l152_1 = _zz_when_Axi4LiteCrossbar_l152_4[1];
  assign when_Axi4LiteCrossbar_l229 = (|_zz_when_Axi4LiteCrossbar_l229);
  assign when_Axi4LiteCrossbar_l233 = (_zz_wrGranted_0 == 1'b0);
  assign when_Axi4LiteCrossbar_l233_1 = (_zz_wrGranted_0 == 1'b1);
  assign io_slaves_0_aw_fire = (io_slaves_0_aw_valid && io_slaves_0_aw_ready);
  assign when_Axi4LiteCrossbar_l285 = (wrGranted_0 == 1'b0);
  assign when_Axi4LiteCrossbar_l285_1 = (wrGranted_0 == 1'b1);
  assign io_slaves_0_b_fire = (io_slaves_0_b_valid && io_slaves_0_b_ready);
  assign when_Axi4LiteCrossbar_l217_1 = (! wrActive_1);
  always @(*) begin
    _zz_when_Axi4LiteCrossbar_l229_4[0] = ((32'h0 <= io_masters_0_aw_payload_addr) && (io_masters_0_aw_payload_addr < 32'h00010000));
    _zz_when_Axi4LiteCrossbar_l229_4[1] = ((32'h00010000 <= io_masters_0_aw_payload_addr) && (io_masters_0_aw_payload_addr < 32'h00020000));
    _zz_when_Axi4LiteCrossbar_l229_4[2] = ((32'h00020000 <= io_masters_0_aw_payload_addr) && (io_masters_0_aw_payload_addr < 32'h00030000));
    _zz_when_Axi4LiteCrossbar_l229_4[3] = ((32'h00030000 <= io_masters_0_aw_payload_addr) && (io_masters_0_aw_payload_addr < 32'h00040000));
  end

  always @(*) begin
    _zz_when_Axi4LiteCrossbar_l229_3[0] = (io_masters_0_aw_valid && _zz__zz_when_Axi4LiteCrossbar_l229_3[1]);
    _zz_when_Axi4LiteCrossbar_l229_3[1] = (io_masters_1_aw_valid && _zz__zz_when_Axi4LiteCrossbar_l229_3_1[1]);
  end

  always @(*) begin
    _zz_when_Axi4LiteCrossbar_l229_5[0] = ((32'h0 <= io_masters_1_aw_payload_addr) && (io_masters_1_aw_payload_addr < 32'h00010000));
    _zz_when_Axi4LiteCrossbar_l229_5[1] = ((32'h00010000 <= io_masters_1_aw_payload_addr) && (io_masters_1_aw_payload_addr < 32'h00020000));
    _zz_when_Axi4LiteCrossbar_l229_5[2] = ((32'h00020000 <= io_masters_1_aw_payload_addr) && (io_masters_1_aw_payload_addr < 32'h00030000));
    _zz_when_Axi4LiteCrossbar_l229_5[3] = ((32'h00030000 <= io_masters_1_aw_payload_addr) && (io_masters_1_aw_payload_addr < 32'h00040000));
  end

  always @(*) begin
    _zz_when_Axi4LiteCrossbar_l152_5 = 2'b00;
    if(when_Axi4LiteCrossbar_l109_1) begin
      _zz_when_Axi4LiteCrossbar_l152_5 = 2'b01;
    end
  end

  assign when_Axi4LiteCrossbar_l109_1 = (1'b1 <= wrRrPtr_1);
  assign _zz_when_Axi4LiteCrossbar_l152_6 = (_zz_when_Axi4LiteCrossbar_l229_3 & (~ _zz_when_Axi4LiteCrossbar_l152_5));
  assign _zz_when_Axi4LiteCrossbar_l152_7 = _zz_when_Axi4LiteCrossbar_l152_6;
  assign _zz_when_Axi4LiteCrossbar_l152_8 = _zz_when_Axi4LiteCrossbar_l229_3;
  assign _zz_when_Axi4LiteCrossbar_l152_9 = ((|_zz_when_Axi4LiteCrossbar_l152_6) ? (_zz_when_Axi4LiteCrossbar_l152_7 & (~ _zz__zz_when_Axi4LiteCrossbar_l152_9)) : (_zz_when_Axi4LiteCrossbar_l152_8 & (~ _zz__zz_when_Axi4LiteCrossbar_l152_9_1)));
  always @(*) begin
    _zz_wrGranted_1 = 1'b0;
    if(when_Axi4LiteCrossbar_l152_2) begin
      _zz_wrGranted_1 = 1'b0;
    end
    if(when_Axi4LiteCrossbar_l152_3) begin
      _zz_wrGranted_1 = 1'b1;
    end
  end

  assign when_Axi4LiteCrossbar_l152_2 = _zz_when_Axi4LiteCrossbar_l152_9[0];
  assign when_Axi4LiteCrossbar_l152_3 = _zz_when_Axi4LiteCrossbar_l152_9[1];
  assign when_Axi4LiteCrossbar_l229_1 = (|_zz_when_Axi4LiteCrossbar_l229_3);
  assign when_Axi4LiteCrossbar_l233_2 = (_zz_wrGranted_1 == 1'b0);
  assign when_Axi4LiteCrossbar_l233_3 = (_zz_wrGranted_1 == 1'b1);
  assign io_slaves_1_aw_fire = (io_slaves_1_aw_valid && io_slaves_1_aw_ready);
  assign when_Axi4LiteCrossbar_l285_2 = (wrGranted_1 == 1'b0);
  assign when_Axi4LiteCrossbar_l285_3 = (wrGranted_1 == 1'b1);
  assign io_slaves_1_b_fire = (io_slaves_1_b_valid && io_slaves_1_b_ready);
  assign when_Axi4LiteCrossbar_l217_2 = (! wrActive_2);
  always @(*) begin
    _zz_when_Axi4LiteCrossbar_l229_7[0] = ((32'h0 <= io_masters_0_aw_payload_addr) && (io_masters_0_aw_payload_addr < 32'h00010000));
    _zz_when_Axi4LiteCrossbar_l229_7[1] = ((32'h00010000 <= io_masters_0_aw_payload_addr) && (io_masters_0_aw_payload_addr < 32'h00020000));
    _zz_when_Axi4LiteCrossbar_l229_7[2] = ((32'h00020000 <= io_masters_0_aw_payload_addr) && (io_masters_0_aw_payload_addr < 32'h00030000));
    _zz_when_Axi4LiteCrossbar_l229_7[3] = ((32'h00030000 <= io_masters_0_aw_payload_addr) && (io_masters_0_aw_payload_addr < 32'h00040000));
  end

  always @(*) begin
    _zz_when_Axi4LiteCrossbar_l229_6[0] = (io_masters_0_aw_valid && _zz__zz_when_Axi4LiteCrossbar_l229_6[2]);
    _zz_when_Axi4LiteCrossbar_l229_6[1] = (io_masters_1_aw_valid && _zz__zz_when_Axi4LiteCrossbar_l229_6_1[2]);
  end

  always @(*) begin
    _zz_when_Axi4LiteCrossbar_l229_8[0] = ((32'h0 <= io_masters_1_aw_payload_addr) && (io_masters_1_aw_payload_addr < 32'h00010000));
    _zz_when_Axi4LiteCrossbar_l229_8[1] = ((32'h00010000 <= io_masters_1_aw_payload_addr) && (io_masters_1_aw_payload_addr < 32'h00020000));
    _zz_when_Axi4LiteCrossbar_l229_8[2] = ((32'h00020000 <= io_masters_1_aw_payload_addr) && (io_masters_1_aw_payload_addr < 32'h00030000));
    _zz_when_Axi4LiteCrossbar_l229_8[3] = ((32'h00030000 <= io_masters_1_aw_payload_addr) && (io_masters_1_aw_payload_addr < 32'h00040000));
  end

  always @(*) begin
    _zz_when_Axi4LiteCrossbar_l152_10 = 2'b00;
    if(when_Axi4LiteCrossbar_l109_2) begin
      _zz_when_Axi4LiteCrossbar_l152_10 = 2'b01;
    end
  end

  assign when_Axi4LiteCrossbar_l109_2 = (1'b1 <= wrRrPtr_2);
  assign _zz_when_Axi4LiteCrossbar_l152_11 = (_zz_when_Axi4LiteCrossbar_l229_6 & (~ _zz_when_Axi4LiteCrossbar_l152_10));
  assign _zz_when_Axi4LiteCrossbar_l152_12 = _zz_when_Axi4LiteCrossbar_l152_11;
  assign _zz_when_Axi4LiteCrossbar_l152_13 = _zz_when_Axi4LiteCrossbar_l229_6;
  assign _zz_when_Axi4LiteCrossbar_l152_14 = ((|_zz_when_Axi4LiteCrossbar_l152_11) ? (_zz_when_Axi4LiteCrossbar_l152_12 & (~ _zz__zz_when_Axi4LiteCrossbar_l152_14)) : (_zz_when_Axi4LiteCrossbar_l152_13 & (~ _zz__zz_when_Axi4LiteCrossbar_l152_14_1)));
  always @(*) begin
    _zz_wrGranted_2 = 1'b0;
    if(when_Axi4LiteCrossbar_l152_4) begin
      _zz_wrGranted_2 = 1'b0;
    end
    if(when_Axi4LiteCrossbar_l152_5) begin
      _zz_wrGranted_2 = 1'b1;
    end
  end

  assign when_Axi4LiteCrossbar_l152_4 = _zz_when_Axi4LiteCrossbar_l152_14[0];
  assign when_Axi4LiteCrossbar_l152_5 = _zz_when_Axi4LiteCrossbar_l152_14[1];
  assign when_Axi4LiteCrossbar_l229_2 = (|_zz_when_Axi4LiteCrossbar_l229_6);
  assign when_Axi4LiteCrossbar_l233_4 = (_zz_wrGranted_2 == 1'b0);
  assign when_Axi4LiteCrossbar_l233_5 = (_zz_wrGranted_2 == 1'b1);
  assign io_slaves_2_aw_fire = (io_slaves_2_aw_valid && io_slaves_2_aw_ready);
  assign when_Axi4LiteCrossbar_l285_4 = (wrGranted_2 == 1'b0);
  assign when_Axi4LiteCrossbar_l285_5 = (wrGranted_2 == 1'b1);
  assign io_slaves_2_b_fire = (io_slaves_2_b_valid && io_slaves_2_b_ready);
  assign when_Axi4LiteCrossbar_l217_3 = (! wrActive_3);
  always @(*) begin
    _zz_when_Axi4LiteCrossbar_l229_10[0] = ((32'h0 <= io_masters_0_aw_payload_addr) && (io_masters_0_aw_payload_addr < 32'h00010000));
    _zz_when_Axi4LiteCrossbar_l229_10[1] = ((32'h00010000 <= io_masters_0_aw_payload_addr) && (io_masters_0_aw_payload_addr < 32'h00020000));
    _zz_when_Axi4LiteCrossbar_l229_10[2] = ((32'h00020000 <= io_masters_0_aw_payload_addr) && (io_masters_0_aw_payload_addr < 32'h00030000));
    _zz_when_Axi4LiteCrossbar_l229_10[3] = ((32'h00030000 <= io_masters_0_aw_payload_addr) && (io_masters_0_aw_payload_addr < 32'h00040000));
  end

  always @(*) begin
    _zz_when_Axi4LiteCrossbar_l229_9[0] = (io_masters_0_aw_valid && _zz__zz_when_Axi4LiteCrossbar_l229_9[3]);
    _zz_when_Axi4LiteCrossbar_l229_9[1] = (io_masters_1_aw_valid && _zz__zz_when_Axi4LiteCrossbar_l229_9_1[3]);
  end

  always @(*) begin
    _zz_when_Axi4LiteCrossbar_l229_11[0] = ((32'h0 <= io_masters_1_aw_payload_addr) && (io_masters_1_aw_payload_addr < 32'h00010000));
    _zz_when_Axi4LiteCrossbar_l229_11[1] = ((32'h00010000 <= io_masters_1_aw_payload_addr) && (io_masters_1_aw_payload_addr < 32'h00020000));
    _zz_when_Axi4LiteCrossbar_l229_11[2] = ((32'h00020000 <= io_masters_1_aw_payload_addr) && (io_masters_1_aw_payload_addr < 32'h00030000));
    _zz_when_Axi4LiteCrossbar_l229_11[3] = ((32'h00030000 <= io_masters_1_aw_payload_addr) && (io_masters_1_aw_payload_addr < 32'h00040000));
  end

  always @(*) begin
    _zz_when_Axi4LiteCrossbar_l152_15 = 2'b00;
    if(when_Axi4LiteCrossbar_l109_3) begin
      _zz_when_Axi4LiteCrossbar_l152_15 = 2'b01;
    end
  end

  assign when_Axi4LiteCrossbar_l109_3 = (1'b1 <= wrRrPtr_3);
  assign _zz_when_Axi4LiteCrossbar_l152_16 = (_zz_when_Axi4LiteCrossbar_l229_9 & (~ _zz_when_Axi4LiteCrossbar_l152_15));
  assign _zz_when_Axi4LiteCrossbar_l152_17 = _zz_when_Axi4LiteCrossbar_l152_16;
  assign _zz_when_Axi4LiteCrossbar_l152_18 = _zz_when_Axi4LiteCrossbar_l229_9;
  assign _zz_when_Axi4LiteCrossbar_l152_19 = ((|_zz_when_Axi4LiteCrossbar_l152_16) ? (_zz_when_Axi4LiteCrossbar_l152_17 & (~ _zz__zz_when_Axi4LiteCrossbar_l152_19)) : (_zz_when_Axi4LiteCrossbar_l152_18 & (~ _zz__zz_when_Axi4LiteCrossbar_l152_19_1)));
  always @(*) begin
    _zz_wrGranted_3 = 1'b0;
    if(when_Axi4LiteCrossbar_l152_6) begin
      _zz_wrGranted_3 = 1'b0;
    end
    if(when_Axi4LiteCrossbar_l152_7) begin
      _zz_wrGranted_3 = 1'b1;
    end
  end

  assign when_Axi4LiteCrossbar_l152_6 = _zz_when_Axi4LiteCrossbar_l152_19[0];
  assign when_Axi4LiteCrossbar_l152_7 = _zz_when_Axi4LiteCrossbar_l152_19[1];
  assign when_Axi4LiteCrossbar_l229_3 = (|_zz_when_Axi4LiteCrossbar_l229_9);
  assign when_Axi4LiteCrossbar_l233_6 = (_zz_wrGranted_3 == 1'b0);
  assign when_Axi4LiteCrossbar_l233_7 = (_zz_wrGranted_3 == 1'b1);
  assign io_slaves_3_aw_fire = (io_slaves_3_aw_valid && io_slaves_3_aw_ready);
  assign when_Axi4LiteCrossbar_l285_6 = (wrGranted_3 == 1'b0);
  assign when_Axi4LiteCrossbar_l285_7 = (wrGranted_3 == 1'b1);
  assign io_slaves_3_b_fire = (io_slaves_3_b_valid && io_slaves_3_b_ready);
  assign when_Axi4LiteCrossbar_l217_4 = (! wrActive_4);
  always @(*) begin
    _zz_when_Axi4LiteCrossbar_l229_13[0] = ((32'h0 <= io_masters_0_aw_payload_addr) && (io_masters_0_aw_payload_addr < 32'h00010000));
    _zz_when_Axi4LiteCrossbar_l229_13[1] = ((32'h00010000 <= io_masters_0_aw_payload_addr) && (io_masters_0_aw_payload_addr < 32'h00020000));
    _zz_when_Axi4LiteCrossbar_l229_13[2] = ((32'h00020000 <= io_masters_0_aw_payload_addr) && (io_masters_0_aw_payload_addr < 32'h00030000));
    _zz_when_Axi4LiteCrossbar_l229_13[3] = ((32'h00030000 <= io_masters_0_aw_payload_addr) && (io_masters_0_aw_payload_addr < 32'h00040000));
  end

  always @(*) begin
    _zz_when_Axi4LiteCrossbar_l229_12[0] = (io_masters_0_aw_valid && _zz__zz_when_Axi4LiteCrossbar_l229_12[4]);
    _zz_when_Axi4LiteCrossbar_l229_12[1] = (io_masters_1_aw_valid && _zz__zz_when_Axi4LiteCrossbar_l229_12_1[4]);
  end

  always @(*) begin
    _zz_when_Axi4LiteCrossbar_l229_14[0] = ((32'h0 <= io_masters_1_aw_payload_addr) && (io_masters_1_aw_payload_addr < 32'h00010000));
    _zz_when_Axi4LiteCrossbar_l229_14[1] = ((32'h00010000 <= io_masters_1_aw_payload_addr) && (io_masters_1_aw_payload_addr < 32'h00020000));
    _zz_when_Axi4LiteCrossbar_l229_14[2] = ((32'h00020000 <= io_masters_1_aw_payload_addr) && (io_masters_1_aw_payload_addr < 32'h00030000));
    _zz_when_Axi4LiteCrossbar_l229_14[3] = ((32'h00030000 <= io_masters_1_aw_payload_addr) && (io_masters_1_aw_payload_addr < 32'h00040000));
  end

  always @(*) begin
    _zz_when_Axi4LiteCrossbar_l152_20 = 2'b00;
    if(when_Axi4LiteCrossbar_l109_4) begin
      _zz_when_Axi4LiteCrossbar_l152_20 = 2'b01;
    end
  end

  assign when_Axi4LiteCrossbar_l109_4 = (1'b1 <= wrRrPtr_4);
  assign _zz_when_Axi4LiteCrossbar_l152_21 = (_zz_when_Axi4LiteCrossbar_l229_12 & (~ _zz_when_Axi4LiteCrossbar_l152_20));
  assign _zz_when_Axi4LiteCrossbar_l152_22 = _zz_when_Axi4LiteCrossbar_l152_21;
  assign _zz_when_Axi4LiteCrossbar_l152_23 = _zz_when_Axi4LiteCrossbar_l229_12;
  assign _zz_when_Axi4LiteCrossbar_l152_24 = ((|_zz_when_Axi4LiteCrossbar_l152_21) ? (_zz_when_Axi4LiteCrossbar_l152_22 & (~ _zz__zz_when_Axi4LiteCrossbar_l152_24)) : (_zz_when_Axi4LiteCrossbar_l152_23 & (~ _zz__zz_when_Axi4LiteCrossbar_l152_24_1)));
  always @(*) begin
    _zz_wrGranted_4 = 1'b0;
    if(when_Axi4LiteCrossbar_l152_8) begin
      _zz_wrGranted_4 = 1'b0;
    end
    if(when_Axi4LiteCrossbar_l152_9) begin
      _zz_wrGranted_4 = 1'b1;
    end
  end

  assign when_Axi4LiteCrossbar_l152_8 = _zz_when_Axi4LiteCrossbar_l152_24[0];
  assign when_Axi4LiteCrossbar_l152_9 = _zz_when_Axi4LiteCrossbar_l152_24[1];
  assign when_Axi4LiteCrossbar_l229_4 = (|_zz_when_Axi4LiteCrossbar_l229_12);
  assign when_Axi4LiteCrossbar_l233_8 = (_zz_wrGranted_4 == 1'b0);
  assign when_Axi4LiteCrossbar_l233_9 = (_zz_wrGranted_4 == 1'b1);
  assign decErr_io_axi_aw_fire = (decErr_io_axi_aw_valid && decErr_io_axi_aw_ready);
  assign when_Axi4LiteCrossbar_l285_8 = (wrGranted_4 == 1'b0);
  assign when_Axi4LiteCrossbar_l285_9 = (wrGranted_4 == 1'b1);
  assign decErr_io_axi_b_fire = (decErr_io_axi_b_valid && decErr_io_axi_b_ready);
  assign when_Axi4LiteCrossbar_l306 = (! rdActive_0);
  always @(*) begin
    _zz_when_Axi4LiteCrossbar_l317_1[0] = ((32'h0 <= io_masters_0_ar_payload_addr) && (io_masters_0_ar_payload_addr < 32'h00010000));
    _zz_when_Axi4LiteCrossbar_l317_1[1] = ((32'h00010000 <= io_masters_0_ar_payload_addr) && (io_masters_0_ar_payload_addr < 32'h00020000));
    _zz_when_Axi4LiteCrossbar_l317_1[2] = ((32'h00020000 <= io_masters_0_ar_payload_addr) && (io_masters_0_ar_payload_addr < 32'h00030000));
    _zz_when_Axi4LiteCrossbar_l317_1[3] = ((32'h00030000 <= io_masters_0_ar_payload_addr) && (io_masters_0_ar_payload_addr < 32'h00040000));
  end

  always @(*) begin
    _zz_when_Axi4LiteCrossbar_l317[0] = (io_masters_0_ar_valid && _zz__zz_when_Axi4LiteCrossbar_l317[0]);
    _zz_when_Axi4LiteCrossbar_l317[1] = (io_masters_1_ar_valid && _zz__zz_when_Axi4LiteCrossbar_l317_1[0]);
  end

  always @(*) begin
    _zz_when_Axi4LiteCrossbar_l317_2[0] = ((32'h0 <= io_masters_1_ar_payload_addr) && (io_masters_1_ar_payload_addr < 32'h00010000));
    _zz_when_Axi4LiteCrossbar_l317_2[1] = ((32'h00010000 <= io_masters_1_ar_payload_addr) && (io_masters_1_ar_payload_addr < 32'h00020000));
    _zz_when_Axi4LiteCrossbar_l317_2[2] = ((32'h00020000 <= io_masters_1_ar_payload_addr) && (io_masters_1_ar_payload_addr < 32'h00030000));
    _zz_when_Axi4LiteCrossbar_l317_2[3] = ((32'h00030000 <= io_masters_1_ar_payload_addr) && (io_masters_1_ar_payload_addr < 32'h00040000));
  end

  always @(*) begin
    _zz_when_Axi4LiteCrossbar_l152_25 = 2'b00;
    if(when_Axi4LiteCrossbar_l109_5) begin
      _zz_when_Axi4LiteCrossbar_l152_25 = 2'b01;
    end
  end

  assign when_Axi4LiteCrossbar_l109_5 = (1'b1 <= rdRrPtr_0);
  assign _zz_when_Axi4LiteCrossbar_l152_26 = (_zz_when_Axi4LiteCrossbar_l317 & (~ _zz_when_Axi4LiteCrossbar_l152_25));
  assign _zz_when_Axi4LiteCrossbar_l152_27 = _zz_when_Axi4LiteCrossbar_l152_26;
  assign _zz_when_Axi4LiteCrossbar_l152_28 = _zz_when_Axi4LiteCrossbar_l317;
  assign _zz_when_Axi4LiteCrossbar_l152_29 = ((|_zz_when_Axi4LiteCrossbar_l152_26) ? (_zz_when_Axi4LiteCrossbar_l152_27 & (~ _zz__zz_when_Axi4LiteCrossbar_l152_29)) : (_zz_when_Axi4LiteCrossbar_l152_28 & (~ _zz__zz_when_Axi4LiteCrossbar_l152_29_1)));
  always @(*) begin
    _zz_rdGranted_0 = 1'b0;
    if(when_Axi4LiteCrossbar_l152_10) begin
      _zz_rdGranted_0 = 1'b0;
    end
    if(when_Axi4LiteCrossbar_l152_11) begin
      _zz_rdGranted_0 = 1'b1;
    end
  end

  assign when_Axi4LiteCrossbar_l152_10 = _zz_when_Axi4LiteCrossbar_l152_29[0];
  assign when_Axi4LiteCrossbar_l152_11 = _zz_when_Axi4LiteCrossbar_l152_29[1];
  assign when_Axi4LiteCrossbar_l317 = (|_zz_when_Axi4LiteCrossbar_l317);
  assign when_Axi4LiteCrossbar_l320 = (_zz_rdGranted_0 == 1'b0);
  assign when_Axi4LiteCrossbar_l320_1 = (_zz_rdGranted_0 == 1'b1);
  assign io_slaves_0_ar_fire = (io_slaves_0_ar_valid && io_slaves_0_ar_ready);
  assign when_Axi4LiteCrossbar_l363 = (rdGranted_0 == 1'b0);
  assign when_Axi4LiteCrossbar_l363_1 = (rdGranted_0 == 1'b1);
  assign io_slaves_0_r_fire = (io_slaves_0_r_valid && io_slaves_0_r_ready);
  assign when_Axi4LiteCrossbar_l306_1 = (! rdActive_1);
  always @(*) begin
    _zz_when_Axi4LiteCrossbar_l317_4[0] = ((32'h0 <= io_masters_0_ar_payload_addr) && (io_masters_0_ar_payload_addr < 32'h00010000));
    _zz_when_Axi4LiteCrossbar_l317_4[1] = ((32'h00010000 <= io_masters_0_ar_payload_addr) && (io_masters_0_ar_payload_addr < 32'h00020000));
    _zz_when_Axi4LiteCrossbar_l317_4[2] = ((32'h00020000 <= io_masters_0_ar_payload_addr) && (io_masters_0_ar_payload_addr < 32'h00030000));
    _zz_when_Axi4LiteCrossbar_l317_4[3] = ((32'h00030000 <= io_masters_0_ar_payload_addr) && (io_masters_0_ar_payload_addr < 32'h00040000));
  end

  always @(*) begin
    _zz_when_Axi4LiteCrossbar_l317_3[0] = (io_masters_0_ar_valid && _zz__zz_when_Axi4LiteCrossbar_l317_3[1]);
    _zz_when_Axi4LiteCrossbar_l317_3[1] = (io_masters_1_ar_valid && _zz__zz_when_Axi4LiteCrossbar_l317_3_1[1]);
  end

  always @(*) begin
    _zz_when_Axi4LiteCrossbar_l317_5[0] = ((32'h0 <= io_masters_1_ar_payload_addr) && (io_masters_1_ar_payload_addr < 32'h00010000));
    _zz_when_Axi4LiteCrossbar_l317_5[1] = ((32'h00010000 <= io_masters_1_ar_payload_addr) && (io_masters_1_ar_payload_addr < 32'h00020000));
    _zz_when_Axi4LiteCrossbar_l317_5[2] = ((32'h00020000 <= io_masters_1_ar_payload_addr) && (io_masters_1_ar_payload_addr < 32'h00030000));
    _zz_when_Axi4LiteCrossbar_l317_5[3] = ((32'h00030000 <= io_masters_1_ar_payload_addr) && (io_masters_1_ar_payload_addr < 32'h00040000));
  end

  always @(*) begin
    _zz_when_Axi4LiteCrossbar_l152_30 = 2'b00;
    if(when_Axi4LiteCrossbar_l109_6) begin
      _zz_when_Axi4LiteCrossbar_l152_30 = 2'b01;
    end
  end

  assign when_Axi4LiteCrossbar_l109_6 = (1'b1 <= rdRrPtr_1);
  assign _zz_when_Axi4LiteCrossbar_l152_31 = (_zz_when_Axi4LiteCrossbar_l317_3 & (~ _zz_when_Axi4LiteCrossbar_l152_30));
  assign _zz_when_Axi4LiteCrossbar_l152_32 = _zz_when_Axi4LiteCrossbar_l152_31;
  assign _zz_when_Axi4LiteCrossbar_l152_33 = _zz_when_Axi4LiteCrossbar_l317_3;
  assign _zz_when_Axi4LiteCrossbar_l152_34 = ((|_zz_when_Axi4LiteCrossbar_l152_31) ? (_zz_when_Axi4LiteCrossbar_l152_32 & (~ _zz__zz_when_Axi4LiteCrossbar_l152_34)) : (_zz_when_Axi4LiteCrossbar_l152_33 & (~ _zz__zz_when_Axi4LiteCrossbar_l152_34_1)));
  always @(*) begin
    _zz_rdGranted_1 = 1'b0;
    if(when_Axi4LiteCrossbar_l152_12) begin
      _zz_rdGranted_1 = 1'b0;
    end
    if(when_Axi4LiteCrossbar_l152_13) begin
      _zz_rdGranted_1 = 1'b1;
    end
  end

  assign when_Axi4LiteCrossbar_l152_12 = _zz_when_Axi4LiteCrossbar_l152_34[0];
  assign when_Axi4LiteCrossbar_l152_13 = _zz_when_Axi4LiteCrossbar_l152_34[1];
  assign when_Axi4LiteCrossbar_l317_1 = (|_zz_when_Axi4LiteCrossbar_l317_3);
  assign when_Axi4LiteCrossbar_l320_2 = (_zz_rdGranted_1 == 1'b0);
  assign when_Axi4LiteCrossbar_l320_3 = (_zz_rdGranted_1 == 1'b1);
  assign io_slaves_1_ar_fire = (io_slaves_1_ar_valid && io_slaves_1_ar_ready);
  assign when_Axi4LiteCrossbar_l363_2 = (rdGranted_1 == 1'b0);
  assign when_Axi4LiteCrossbar_l363_3 = (rdGranted_1 == 1'b1);
  assign io_slaves_1_r_fire = (io_slaves_1_r_valid && io_slaves_1_r_ready);
  assign when_Axi4LiteCrossbar_l306_2 = (! rdActive_2);
  always @(*) begin
    _zz_when_Axi4LiteCrossbar_l317_7[0] = ((32'h0 <= io_masters_0_ar_payload_addr) && (io_masters_0_ar_payload_addr < 32'h00010000));
    _zz_when_Axi4LiteCrossbar_l317_7[1] = ((32'h00010000 <= io_masters_0_ar_payload_addr) && (io_masters_0_ar_payload_addr < 32'h00020000));
    _zz_when_Axi4LiteCrossbar_l317_7[2] = ((32'h00020000 <= io_masters_0_ar_payload_addr) && (io_masters_0_ar_payload_addr < 32'h00030000));
    _zz_when_Axi4LiteCrossbar_l317_7[3] = ((32'h00030000 <= io_masters_0_ar_payload_addr) && (io_masters_0_ar_payload_addr < 32'h00040000));
  end

  always @(*) begin
    _zz_when_Axi4LiteCrossbar_l317_6[0] = (io_masters_0_ar_valid && _zz__zz_when_Axi4LiteCrossbar_l317_6[2]);
    _zz_when_Axi4LiteCrossbar_l317_6[1] = (io_masters_1_ar_valid && _zz__zz_when_Axi4LiteCrossbar_l317_6_1[2]);
  end

  always @(*) begin
    _zz_when_Axi4LiteCrossbar_l317_8[0] = ((32'h0 <= io_masters_1_ar_payload_addr) && (io_masters_1_ar_payload_addr < 32'h00010000));
    _zz_when_Axi4LiteCrossbar_l317_8[1] = ((32'h00010000 <= io_masters_1_ar_payload_addr) && (io_masters_1_ar_payload_addr < 32'h00020000));
    _zz_when_Axi4LiteCrossbar_l317_8[2] = ((32'h00020000 <= io_masters_1_ar_payload_addr) && (io_masters_1_ar_payload_addr < 32'h00030000));
    _zz_when_Axi4LiteCrossbar_l317_8[3] = ((32'h00030000 <= io_masters_1_ar_payload_addr) && (io_masters_1_ar_payload_addr < 32'h00040000));
  end

  always @(*) begin
    _zz_when_Axi4LiteCrossbar_l152_35 = 2'b00;
    if(when_Axi4LiteCrossbar_l109_7) begin
      _zz_when_Axi4LiteCrossbar_l152_35 = 2'b01;
    end
  end

  assign when_Axi4LiteCrossbar_l109_7 = (1'b1 <= rdRrPtr_2);
  assign _zz_when_Axi4LiteCrossbar_l152_36 = (_zz_when_Axi4LiteCrossbar_l317_6 & (~ _zz_when_Axi4LiteCrossbar_l152_35));
  assign _zz_when_Axi4LiteCrossbar_l152_37 = _zz_when_Axi4LiteCrossbar_l152_36;
  assign _zz_when_Axi4LiteCrossbar_l152_38 = _zz_when_Axi4LiteCrossbar_l317_6;
  assign _zz_when_Axi4LiteCrossbar_l152_39 = ((|_zz_when_Axi4LiteCrossbar_l152_36) ? (_zz_when_Axi4LiteCrossbar_l152_37 & (~ _zz__zz_when_Axi4LiteCrossbar_l152_39)) : (_zz_when_Axi4LiteCrossbar_l152_38 & (~ _zz__zz_when_Axi4LiteCrossbar_l152_39_1)));
  always @(*) begin
    _zz_rdGranted_2 = 1'b0;
    if(when_Axi4LiteCrossbar_l152_14) begin
      _zz_rdGranted_2 = 1'b0;
    end
    if(when_Axi4LiteCrossbar_l152_15) begin
      _zz_rdGranted_2 = 1'b1;
    end
  end

  assign when_Axi4LiteCrossbar_l152_14 = _zz_when_Axi4LiteCrossbar_l152_39[0];
  assign when_Axi4LiteCrossbar_l152_15 = _zz_when_Axi4LiteCrossbar_l152_39[1];
  assign when_Axi4LiteCrossbar_l317_2 = (|_zz_when_Axi4LiteCrossbar_l317_6);
  assign when_Axi4LiteCrossbar_l320_4 = (_zz_rdGranted_2 == 1'b0);
  assign when_Axi4LiteCrossbar_l320_5 = (_zz_rdGranted_2 == 1'b1);
  assign io_slaves_2_ar_fire = (io_slaves_2_ar_valid && io_slaves_2_ar_ready);
  assign when_Axi4LiteCrossbar_l363_4 = (rdGranted_2 == 1'b0);
  assign when_Axi4LiteCrossbar_l363_5 = (rdGranted_2 == 1'b1);
  assign io_slaves_2_r_fire = (io_slaves_2_r_valid && io_slaves_2_r_ready);
  assign when_Axi4LiteCrossbar_l306_3 = (! rdActive_3);
  always @(*) begin
    _zz_when_Axi4LiteCrossbar_l317_10[0] = ((32'h0 <= io_masters_0_ar_payload_addr) && (io_masters_0_ar_payload_addr < 32'h00010000));
    _zz_when_Axi4LiteCrossbar_l317_10[1] = ((32'h00010000 <= io_masters_0_ar_payload_addr) && (io_masters_0_ar_payload_addr < 32'h00020000));
    _zz_when_Axi4LiteCrossbar_l317_10[2] = ((32'h00020000 <= io_masters_0_ar_payload_addr) && (io_masters_0_ar_payload_addr < 32'h00030000));
    _zz_when_Axi4LiteCrossbar_l317_10[3] = ((32'h00030000 <= io_masters_0_ar_payload_addr) && (io_masters_0_ar_payload_addr < 32'h00040000));
  end

  always @(*) begin
    _zz_when_Axi4LiteCrossbar_l317_9[0] = (io_masters_0_ar_valid && _zz__zz_when_Axi4LiteCrossbar_l317_9[3]);
    _zz_when_Axi4LiteCrossbar_l317_9[1] = (io_masters_1_ar_valid && _zz__zz_when_Axi4LiteCrossbar_l317_9_1[3]);
  end

  always @(*) begin
    _zz_when_Axi4LiteCrossbar_l317_11[0] = ((32'h0 <= io_masters_1_ar_payload_addr) && (io_masters_1_ar_payload_addr < 32'h00010000));
    _zz_when_Axi4LiteCrossbar_l317_11[1] = ((32'h00010000 <= io_masters_1_ar_payload_addr) && (io_masters_1_ar_payload_addr < 32'h00020000));
    _zz_when_Axi4LiteCrossbar_l317_11[2] = ((32'h00020000 <= io_masters_1_ar_payload_addr) && (io_masters_1_ar_payload_addr < 32'h00030000));
    _zz_when_Axi4LiteCrossbar_l317_11[3] = ((32'h00030000 <= io_masters_1_ar_payload_addr) && (io_masters_1_ar_payload_addr < 32'h00040000));
  end

  always @(*) begin
    _zz_when_Axi4LiteCrossbar_l152_40 = 2'b00;
    if(when_Axi4LiteCrossbar_l109_8) begin
      _zz_when_Axi4LiteCrossbar_l152_40 = 2'b01;
    end
  end

  assign when_Axi4LiteCrossbar_l109_8 = (1'b1 <= rdRrPtr_3);
  assign _zz_when_Axi4LiteCrossbar_l152_41 = (_zz_when_Axi4LiteCrossbar_l317_9 & (~ _zz_when_Axi4LiteCrossbar_l152_40));
  assign _zz_when_Axi4LiteCrossbar_l152_42 = _zz_when_Axi4LiteCrossbar_l152_41;
  assign _zz_when_Axi4LiteCrossbar_l152_43 = _zz_when_Axi4LiteCrossbar_l317_9;
  assign _zz_when_Axi4LiteCrossbar_l152_44 = ((|_zz_when_Axi4LiteCrossbar_l152_41) ? (_zz_when_Axi4LiteCrossbar_l152_42 & (~ _zz__zz_when_Axi4LiteCrossbar_l152_44)) : (_zz_when_Axi4LiteCrossbar_l152_43 & (~ _zz__zz_when_Axi4LiteCrossbar_l152_44_1)));
  always @(*) begin
    _zz_rdGranted_3 = 1'b0;
    if(when_Axi4LiteCrossbar_l152_16) begin
      _zz_rdGranted_3 = 1'b0;
    end
    if(when_Axi4LiteCrossbar_l152_17) begin
      _zz_rdGranted_3 = 1'b1;
    end
  end

  assign when_Axi4LiteCrossbar_l152_16 = _zz_when_Axi4LiteCrossbar_l152_44[0];
  assign when_Axi4LiteCrossbar_l152_17 = _zz_when_Axi4LiteCrossbar_l152_44[1];
  assign when_Axi4LiteCrossbar_l317_3 = (|_zz_when_Axi4LiteCrossbar_l317_9);
  assign when_Axi4LiteCrossbar_l320_6 = (_zz_rdGranted_3 == 1'b0);
  assign when_Axi4LiteCrossbar_l320_7 = (_zz_rdGranted_3 == 1'b1);
  assign io_slaves_3_ar_fire = (io_slaves_3_ar_valid && io_slaves_3_ar_ready);
  assign when_Axi4LiteCrossbar_l363_6 = (rdGranted_3 == 1'b0);
  assign when_Axi4LiteCrossbar_l363_7 = (rdGranted_3 == 1'b1);
  assign io_slaves_3_r_fire = (io_slaves_3_r_valid && io_slaves_3_r_ready);
  assign when_Axi4LiteCrossbar_l306_4 = (! rdActive_4);
  always @(*) begin
    _zz_when_Axi4LiteCrossbar_l317_13[0] = ((32'h0 <= io_masters_0_ar_payload_addr) && (io_masters_0_ar_payload_addr < 32'h00010000));
    _zz_when_Axi4LiteCrossbar_l317_13[1] = ((32'h00010000 <= io_masters_0_ar_payload_addr) && (io_masters_0_ar_payload_addr < 32'h00020000));
    _zz_when_Axi4LiteCrossbar_l317_13[2] = ((32'h00020000 <= io_masters_0_ar_payload_addr) && (io_masters_0_ar_payload_addr < 32'h00030000));
    _zz_when_Axi4LiteCrossbar_l317_13[3] = ((32'h00030000 <= io_masters_0_ar_payload_addr) && (io_masters_0_ar_payload_addr < 32'h00040000));
  end

  always @(*) begin
    _zz_when_Axi4LiteCrossbar_l317_12[0] = (io_masters_0_ar_valid && _zz__zz_when_Axi4LiteCrossbar_l317_12[4]);
    _zz_when_Axi4LiteCrossbar_l317_12[1] = (io_masters_1_ar_valid && _zz__zz_when_Axi4LiteCrossbar_l317_12_1[4]);
  end

  always @(*) begin
    _zz_when_Axi4LiteCrossbar_l317_14[0] = ((32'h0 <= io_masters_1_ar_payload_addr) && (io_masters_1_ar_payload_addr < 32'h00010000));
    _zz_when_Axi4LiteCrossbar_l317_14[1] = ((32'h00010000 <= io_masters_1_ar_payload_addr) && (io_masters_1_ar_payload_addr < 32'h00020000));
    _zz_when_Axi4LiteCrossbar_l317_14[2] = ((32'h00020000 <= io_masters_1_ar_payload_addr) && (io_masters_1_ar_payload_addr < 32'h00030000));
    _zz_when_Axi4LiteCrossbar_l317_14[3] = ((32'h00030000 <= io_masters_1_ar_payload_addr) && (io_masters_1_ar_payload_addr < 32'h00040000));
  end

  always @(*) begin
    _zz_when_Axi4LiteCrossbar_l152_45 = 2'b00;
    if(when_Axi4LiteCrossbar_l109_9) begin
      _zz_when_Axi4LiteCrossbar_l152_45 = 2'b01;
    end
  end

  assign when_Axi4LiteCrossbar_l109_9 = (1'b1 <= rdRrPtr_4);
  assign _zz_when_Axi4LiteCrossbar_l152_46 = (_zz_when_Axi4LiteCrossbar_l317_12 & (~ _zz_when_Axi4LiteCrossbar_l152_45));
  assign _zz_when_Axi4LiteCrossbar_l152_47 = _zz_when_Axi4LiteCrossbar_l152_46;
  assign _zz_when_Axi4LiteCrossbar_l152_48 = _zz_when_Axi4LiteCrossbar_l317_12;
  assign _zz_when_Axi4LiteCrossbar_l152_49 = ((|_zz_when_Axi4LiteCrossbar_l152_46) ? (_zz_when_Axi4LiteCrossbar_l152_47 & (~ _zz__zz_when_Axi4LiteCrossbar_l152_49)) : (_zz_when_Axi4LiteCrossbar_l152_48 & (~ _zz__zz_when_Axi4LiteCrossbar_l152_49_1)));
  always @(*) begin
    _zz_rdGranted_4 = 1'b0;
    if(when_Axi4LiteCrossbar_l152_18) begin
      _zz_rdGranted_4 = 1'b0;
    end
    if(when_Axi4LiteCrossbar_l152_19) begin
      _zz_rdGranted_4 = 1'b1;
    end
  end

  assign when_Axi4LiteCrossbar_l152_18 = _zz_when_Axi4LiteCrossbar_l152_49[0];
  assign when_Axi4LiteCrossbar_l152_19 = _zz_when_Axi4LiteCrossbar_l152_49[1];
  assign when_Axi4LiteCrossbar_l317_4 = (|_zz_when_Axi4LiteCrossbar_l317_12);
  assign when_Axi4LiteCrossbar_l320_8 = (_zz_rdGranted_4 == 1'b0);
  assign when_Axi4LiteCrossbar_l320_9 = (_zz_rdGranted_4 == 1'b1);
  assign decErr_io_axi_ar_fire = (decErr_io_axi_ar_valid && decErr_io_axi_ar_ready);
  assign when_Axi4LiteCrossbar_l363_8 = (rdGranted_4 == 1'b0);
  assign when_Axi4LiteCrossbar_l363_9 = (rdGranted_4 == 1'b1);
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
      if(when_Axi4LiteCrossbar_l217) begin
        if(when_Axi4LiteCrossbar_l229) begin
          if(io_slaves_0_aw_fire) begin
            wrActive_0 <= 1'b1;
            wrGranted_0 <= _zz_wrGranted_0;
            wrRrPtr_0 <= (_zz_wrGranted_0 + 1'b1);
          end
        end
      end else begin
        if(io_slaves_0_b_fire) begin
          wrActive_0 <= 1'b0;
        end
      end
      if(when_Axi4LiteCrossbar_l217_1) begin
        if(when_Axi4LiteCrossbar_l229_1) begin
          if(io_slaves_1_aw_fire) begin
            wrActive_1 <= 1'b1;
            wrGranted_1 <= _zz_wrGranted_1;
            wrRrPtr_1 <= (_zz_wrGranted_1 + 1'b1);
          end
        end
      end else begin
        if(io_slaves_1_b_fire) begin
          wrActive_1 <= 1'b0;
        end
      end
      if(when_Axi4LiteCrossbar_l217_2) begin
        if(when_Axi4LiteCrossbar_l229_2) begin
          if(io_slaves_2_aw_fire) begin
            wrActive_2 <= 1'b1;
            wrGranted_2 <= _zz_wrGranted_2;
            wrRrPtr_2 <= (_zz_wrGranted_2 + 1'b1);
          end
        end
      end else begin
        if(io_slaves_2_b_fire) begin
          wrActive_2 <= 1'b0;
        end
      end
      if(when_Axi4LiteCrossbar_l217_3) begin
        if(when_Axi4LiteCrossbar_l229_3) begin
          if(io_slaves_3_aw_fire) begin
            wrActive_3 <= 1'b1;
            wrGranted_3 <= _zz_wrGranted_3;
            wrRrPtr_3 <= (_zz_wrGranted_3 + 1'b1);
          end
        end
      end else begin
        if(io_slaves_3_b_fire) begin
          wrActive_3 <= 1'b0;
        end
      end
      if(when_Axi4LiteCrossbar_l217_4) begin
        if(when_Axi4LiteCrossbar_l229_4) begin
          if(decErr_io_axi_aw_fire) begin
            wrActive_4 <= 1'b1;
            wrGranted_4 <= _zz_wrGranted_4;
            wrRrPtr_4 <= (_zz_wrGranted_4 + 1'b1);
          end
        end
      end else begin
        if(decErr_io_axi_b_fire) begin
          wrActive_4 <= 1'b0;
        end
      end
      if(when_Axi4LiteCrossbar_l306) begin
        if(when_Axi4LiteCrossbar_l317) begin
          if(io_slaves_0_ar_fire) begin
            rdActive_0 <= 1'b1;
            rdGranted_0 <= _zz_rdGranted_0;
            rdRrPtr_0 <= (_zz_rdGranted_0 + 1'b1);
          end
        end
      end else begin
        if(io_slaves_0_r_fire) begin
          rdActive_0 <= 1'b0;
        end
      end
      if(when_Axi4LiteCrossbar_l306_1) begin
        if(when_Axi4LiteCrossbar_l317_1) begin
          if(io_slaves_1_ar_fire) begin
            rdActive_1 <= 1'b1;
            rdGranted_1 <= _zz_rdGranted_1;
            rdRrPtr_1 <= (_zz_rdGranted_1 + 1'b1);
          end
        end
      end else begin
        if(io_slaves_1_r_fire) begin
          rdActive_1 <= 1'b0;
        end
      end
      if(when_Axi4LiteCrossbar_l306_2) begin
        if(when_Axi4LiteCrossbar_l317_2) begin
          if(io_slaves_2_ar_fire) begin
            rdActive_2 <= 1'b1;
            rdGranted_2 <= _zz_rdGranted_2;
            rdRrPtr_2 <= (_zz_rdGranted_2 + 1'b1);
          end
        end
      end else begin
        if(io_slaves_2_r_fire) begin
          rdActive_2 <= 1'b0;
        end
      end
      if(when_Axi4LiteCrossbar_l306_3) begin
        if(when_Axi4LiteCrossbar_l317_3) begin
          if(io_slaves_3_ar_fire) begin
            rdActive_3 <= 1'b1;
            rdGranted_3 <= _zz_rdGranted_3;
            rdRrPtr_3 <= (_zz_rdGranted_3 + 1'b1);
          end
        end
      end else begin
        if(io_slaves_3_r_fire) begin
          rdActive_3 <= 1'b0;
        end
      end
      if(when_Axi4LiteCrossbar_l306_4) begin
        if(when_Axi4LiteCrossbar_l317_4) begin
          if(decErr_io_axi_ar_fire) begin
            rdActive_4 <= 1'b1;
            rdGranted_4 <= _zz_rdGranted_4;
            rdRrPtr_4 <= (_zz_rdGranted_4 + 1'b1);
          end
        end
      end else begin
        if(decErr_io_axi_r_fire) begin
          rdActive_4 <= 1'b0;
        end
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
  wire                when_Axi4DecErrSlave_l59;
  wire                io_axi_b_fire;
  reg                 read_busy;
  reg        [7:0]    read_beatsLeft;
  wire                io_axi_ar_fire;
  wire       [33:0]   _zz_io_axi_r_payload_data;
  wire                io_axi_r_fire;
  wire                when_Axi4DecErrSlave_l97;

  assign _zz_io_axi_b_payload_resp = 2'b00;
  assign io_axi_aw_ready = ((! write_sinking) && (! write_answering));
  assign io_axi_aw_fire = (io_axi_aw_valid && io_axi_aw_ready);
  assign io_axi_w_ready = write_sinking;
  assign write_lastBeat = 1'b1;
  assign io_axi_w_fire = (io_axi_w_valid && io_axi_w_ready);
  assign when_Axi4DecErrSlave_l59 = ((write_sinking && io_axi_w_fire) && write_lastBeat);
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
  assign when_Axi4DecErrSlave_l97 = (read_beatsLeft == 8'h0);
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
      if(when_Axi4DecErrSlave_l59) begin
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
        if(when_Axi4DecErrSlave_l97) begin
          read_busy <= 1'b0;
        end else begin
          read_beatsLeft <= (read_beatsLeft - 8'h01);
        end
      end
    end
  end


endmodule
