// Copyright (c) 2026 Leonardo Capossio - bard0 design  hello@bard0.com
// SPDX-License-Identifier: MIT
// Generator : SpinalHDL v1.14.2    git head : 78f29dc66110fc099a777992b6daa2f803ab445e
// Component : AxiZeroLiteTop
// Git hash  : c7f02aefbe00cd12f17e50e87e7cc6a26db8edf3

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
  input  wire          io_masters_2_aw_valid,
  output wire          io_masters_2_aw_ready,
  input  wire [31:0]   io_masters_2_aw_payload_addr,
  input  wire [2:0]    io_masters_2_aw_payload_prot,
  input  wire          io_masters_2_w_valid,
  output wire          io_masters_2_w_ready,
  input  wire [31:0]   io_masters_2_w_payload_data,
  input  wire [3:0]    io_masters_2_w_payload_strb,
  output wire          io_masters_2_b_valid,
  input  wire          io_masters_2_b_ready,
  output wire [1:0]    io_masters_2_b_payload_resp,
  input  wire          io_masters_2_ar_valid,
  output wire          io_masters_2_ar_ready,
  input  wire [31:0]   io_masters_2_ar_payload_addr,
  input  wire [2:0]    io_masters_2_ar_payload_prot,
  output wire          io_masters_2_r_valid,
  input  wire          io_masters_2_r_ready,
  output wire [31:0]   io_masters_2_r_payload_data,
  output wire [1:0]    io_masters_2_r_payload_resp,
  input  wire          io_masters_3_aw_valid,
  output wire          io_masters_3_aw_ready,
  input  wire [31:0]   io_masters_3_aw_payload_addr,
  input  wire [2:0]    io_masters_3_aw_payload_prot,
  input  wire          io_masters_3_w_valid,
  output wire          io_masters_3_w_ready,
  input  wire [31:0]   io_masters_3_w_payload_data,
  input  wire [3:0]    io_masters_3_w_payload_strb,
  output wire          io_masters_3_b_valid,
  input  wire          io_masters_3_b_ready,
  output wire [1:0]    io_masters_3_b_payload_resp,
  input  wire          io_masters_3_ar_valid,
  output wire          io_masters_3_ar_ready,
  input  wire [31:0]   io_masters_3_ar_payload_addr,
  input  wire [2:0]    io_masters_3_ar_payload_prot,
  output wire          io_masters_3_r_valid,
  input  wire          io_masters_3_r_ready,
  output wire [31:0]   io_masters_3_r_payload_data,
  output wire [1:0]    io_masters_3_r_payload_resp,
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
  wire                xbar_io_masters_2_ar_ready;
  wire                xbar_io_masters_2_aw_ready;
  wire                xbar_io_masters_2_w_ready;
  wire                xbar_io_masters_2_r_valid;
  wire       [31:0]   xbar_io_masters_2_r_payload_data;
  wire       [1:0]    xbar_io_masters_2_r_payload_resp;
  wire                xbar_io_masters_2_b_valid;
  wire       [1:0]    xbar_io_masters_2_b_payload_resp;
  wire                xbar_io_masters_3_ar_ready;
  wire                xbar_io_masters_3_aw_ready;
  wire                xbar_io_masters_3_w_ready;
  wire                xbar_io_masters_3_r_valid;
  wire       [31:0]   xbar_io_masters_3_r_payload_data;
  wire       [1:0]    xbar_io_masters_3_r_payload_resp;
  wire                xbar_io_masters_3_b_valid;
  wire       [1:0]    xbar_io_masters_3_b_payload_resp;
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

  Axi4LiteCrossbar xbar (
    .io_masters_0_aw_valid        (io_masters_0_aw_valid                 ), //i
    .io_masters_0_aw_ready        (xbar_io_masters_0_aw_ready            ), //o
    .io_masters_0_aw_payload_addr (io_masters_0_aw_payload_addr[31:0]    ), //i
    .io_masters_0_aw_payload_prot (io_masters_0_aw_payload_prot[2:0]     ), //i
    .io_masters_0_w_valid         (io_masters_0_w_valid                  ), //i
    .io_masters_0_w_ready         (xbar_io_masters_0_w_ready             ), //o
    .io_masters_0_w_payload_data  (io_masters_0_w_payload_data[31:0]     ), //i
    .io_masters_0_w_payload_strb  (io_masters_0_w_payload_strb[3:0]      ), //i
    .io_masters_0_b_valid         (xbar_io_masters_0_b_valid             ), //o
    .io_masters_0_b_ready         (io_masters_0_b_ready                  ), //i
    .io_masters_0_b_payload_resp  (xbar_io_masters_0_b_payload_resp[1:0] ), //o
    .io_masters_0_ar_valid        (io_masters_0_ar_valid                 ), //i
    .io_masters_0_ar_ready        (xbar_io_masters_0_ar_ready            ), //o
    .io_masters_0_ar_payload_addr (io_masters_0_ar_payload_addr[31:0]    ), //i
    .io_masters_0_ar_payload_prot (io_masters_0_ar_payload_prot[2:0]     ), //i
    .io_masters_0_r_valid         (xbar_io_masters_0_r_valid             ), //o
    .io_masters_0_r_ready         (io_masters_0_r_ready                  ), //i
    .io_masters_0_r_payload_data  (xbar_io_masters_0_r_payload_data[31:0]), //o
    .io_masters_0_r_payload_resp  (xbar_io_masters_0_r_payload_resp[1:0] ), //o
    .io_masters_1_aw_valid        (io_masters_1_aw_valid                 ), //i
    .io_masters_1_aw_ready        (xbar_io_masters_1_aw_ready            ), //o
    .io_masters_1_aw_payload_addr (io_masters_1_aw_payload_addr[31:0]    ), //i
    .io_masters_1_aw_payload_prot (io_masters_1_aw_payload_prot[2:0]     ), //i
    .io_masters_1_w_valid         (io_masters_1_w_valid                  ), //i
    .io_masters_1_w_ready         (xbar_io_masters_1_w_ready             ), //o
    .io_masters_1_w_payload_data  (io_masters_1_w_payload_data[31:0]     ), //i
    .io_masters_1_w_payload_strb  (io_masters_1_w_payload_strb[3:0]      ), //i
    .io_masters_1_b_valid         (xbar_io_masters_1_b_valid             ), //o
    .io_masters_1_b_ready         (io_masters_1_b_ready                  ), //i
    .io_masters_1_b_payload_resp  (xbar_io_masters_1_b_payload_resp[1:0] ), //o
    .io_masters_1_ar_valid        (io_masters_1_ar_valid                 ), //i
    .io_masters_1_ar_ready        (xbar_io_masters_1_ar_ready            ), //o
    .io_masters_1_ar_payload_addr (io_masters_1_ar_payload_addr[31:0]    ), //i
    .io_masters_1_ar_payload_prot (io_masters_1_ar_payload_prot[2:0]     ), //i
    .io_masters_1_r_valid         (xbar_io_masters_1_r_valid             ), //o
    .io_masters_1_r_ready         (io_masters_1_r_ready                  ), //i
    .io_masters_1_r_payload_data  (xbar_io_masters_1_r_payload_data[31:0]), //o
    .io_masters_1_r_payload_resp  (xbar_io_masters_1_r_payload_resp[1:0] ), //o
    .io_masters_2_aw_valid        (io_masters_2_aw_valid                 ), //i
    .io_masters_2_aw_ready        (xbar_io_masters_2_aw_ready            ), //o
    .io_masters_2_aw_payload_addr (io_masters_2_aw_payload_addr[31:0]    ), //i
    .io_masters_2_aw_payload_prot (io_masters_2_aw_payload_prot[2:0]     ), //i
    .io_masters_2_w_valid         (io_masters_2_w_valid                  ), //i
    .io_masters_2_w_ready         (xbar_io_masters_2_w_ready             ), //o
    .io_masters_2_w_payload_data  (io_masters_2_w_payload_data[31:0]     ), //i
    .io_masters_2_w_payload_strb  (io_masters_2_w_payload_strb[3:0]      ), //i
    .io_masters_2_b_valid         (xbar_io_masters_2_b_valid             ), //o
    .io_masters_2_b_ready         (io_masters_2_b_ready                  ), //i
    .io_masters_2_b_payload_resp  (xbar_io_masters_2_b_payload_resp[1:0] ), //o
    .io_masters_2_ar_valid        (io_masters_2_ar_valid                 ), //i
    .io_masters_2_ar_ready        (xbar_io_masters_2_ar_ready            ), //o
    .io_masters_2_ar_payload_addr (io_masters_2_ar_payload_addr[31:0]    ), //i
    .io_masters_2_ar_payload_prot (io_masters_2_ar_payload_prot[2:0]     ), //i
    .io_masters_2_r_valid         (xbar_io_masters_2_r_valid             ), //o
    .io_masters_2_r_ready         (io_masters_2_r_ready                  ), //i
    .io_masters_2_r_payload_data  (xbar_io_masters_2_r_payload_data[31:0]), //o
    .io_masters_2_r_payload_resp  (xbar_io_masters_2_r_payload_resp[1:0] ), //o
    .io_masters_3_aw_valid        (io_masters_3_aw_valid                 ), //i
    .io_masters_3_aw_ready        (xbar_io_masters_3_aw_ready            ), //o
    .io_masters_3_aw_payload_addr (io_masters_3_aw_payload_addr[31:0]    ), //i
    .io_masters_3_aw_payload_prot (io_masters_3_aw_payload_prot[2:0]     ), //i
    .io_masters_3_w_valid         (io_masters_3_w_valid                  ), //i
    .io_masters_3_w_ready         (xbar_io_masters_3_w_ready             ), //o
    .io_masters_3_w_payload_data  (io_masters_3_w_payload_data[31:0]     ), //i
    .io_masters_3_w_payload_strb  (io_masters_3_w_payload_strb[3:0]      ), //i
    .io_masters_3_b_valid         (xbar_io_masters_3_b_valid             ), //o
    .io_masters_3_b_ready         (io_masters_3_b_ready                  ), //i
    .io_masters_3_b_payload_resp  (xbar_io_masters_3_b_payload_resp[1:0] ), //o
    .io_masters_3_ar_valid        (io_masters_3_ar_valid                 ), //i
    .io_masters_3_ar_ready        (xbar_io_masters_3_ar_ready            ), //o
    .io_masters_3_ar_payload_addr (io_masters_3_ar_payload_addr[31:0]    ), //i
    .io_masters_3_ar_payload_prot (io_masters_3_ar_payload_prot[2:0]     ), //i
    .io_masters_3_r_valid         (xbar_io_masters_3_r_valid             ), //o
    .io_masters_3_r_ready         (io_masters_3_r_ready                  ), //i
    .io_masters_3_r_payload_data  (xbar_io_masters_3_r_payload_data[31:0]), //o
    .io_masters_3_r_payload_resp  (xbar_io_masters_3_r_payload_resp[1:0] ), //o
    .io_slaves_0_aw_valid         (xbar_io_slaves_0_aw_valid             ), //o
    .io_slaves_0_aw_ready         (io_slaves_0_aw_ready                  ), //i
    .io_slaves_0_aw_payload_addr  (xbar_io_slaves_0_aw_payload_addr[31:0]), //o
    .io_slaves_0_aw_payload_prot  (xbar_io_slaves_0_aw_payload_prot[2:0] ), //o
    .io_slaves_0_w_valid          (xbar_io_slaves_0_w_valid              ), //o
    .io_slaves_0_w_ready          (io_slaves_0_w_ready                   ), //i
    .io_slaves_0_w_payload_data   (xbar_io_slaves_0_w_payload_data[31:0] ), //o
    .io_slaves_0_w_payload_strb   (xbar_io_slaves_0_w_payload_strb[3:0]  ), //o
    .io_slaves_0_b_valid          (io_slaves_0_b_valid                   ), //i
    .io_slaves_0_b_ready          (xbar_io_slaves_0_b_ready              ), //o
    .io_slaves_0_b_payload_resp   (io_slaves_0_b_payload_resp[1:0]       ), //i
    .io_slaves_0_ar_valid         (xbar_io_slaves_0_ar_valid             ), //o
    .io_slaves_0_ar_ready         (io_slaves_0_ar_ready                  ), //i
    .io_slaves_0_ar_payload_addr  (xbar_io_slaves_0_ar_payload_addr[31:0]), //o
    .io_slaves_0_ar_payload_prot  (xbar_io_slaves_0_ar_payload_prot[2:0] ), //o
    .io_slaves_0_r_valid          (io_slaves_0_r_valid                   ), //i
    .io_slaves_0_r_ready          (xbar_io_slaves_0_r_ready              ), //o
    .io_slaves_0_r_payload_data   (io_slaves_0_r_payload_data[31:0]      ), //i
    .io_slaves_0_r_payload_resp   (io_slaves_0_r_payload_resp[1:0]       ), //i
    .io_slaves_1_aw_valid         (xbar_io_slaves_1_aw_valid             ), //o
    .io_slaves_1_aw_ready         (io_slaves_1_aw_ready                  ), //i
    .io_slaves_1_aw_payload_addr  (xbar_io_slaves_1_aw_payload_addr[31:0]), //o
    .io_slaves_1_aw_payload_prot  (xbar_io_slaves_1_aw_payload_prot[2:0] ), //o
    .io_slaves_1_w_valid          (xbar_io_slaves_1_w_valid              ), //o
    .io_slaves_1_w_ready          (io_slaves_1_w_ready                   ), //i
    .io_slaves_1_w_payload_data   (xbar_io_slaves_1_w_payload_data[31:0] ), //o
    .io_slaves_1_w_payload_strb   (xbar_io_slaves_1_w_payload_strb[3:0]  ), //o
    .io_slaves_1_b_valid          (io_slaves_1_b_valid                   ), //i
    .io_slaves_1_b_ready          (xbar_io_slaves_1_b_ready              ), //o
    .io_slaves_1_b_payload_resp   (io_slaves_1_b_payload_resp[1:0]       ), //i
    .io_slaves_1_ar_valid         (xbar_io_slaves_1_ar_valid             ), //o
    .io_slaves_1_ar_ready         (io_slaves_1_ar_ready                  ), //i
    .io_slaves_1_ar_payload_addr  (xbar_io_slaves_1_ar_payload_addr[31:0]), //o
    .io_slaves_1_ar_payload_prot  (xbar_io_slaves_1_ar_payload_prot[2:0] ), //o
    .io_slaves_1_r_valid          (io_slaves_1_r_valid                   ), //i
    .io_slaves_1_r_ready          (xbar_io_slaves_1_r_ready              ), //o
    .io_slaves_1_r_payload_data   (io_slaves_1_r_payload_data[31:0]      ), //i
    .io_slaves_1_r_payload_resp   (io_slaves_1_r_payload_resp[1:0]       ), //i
    .io_slaves_2_aw_valid         (xbar_io_slaves_2_aw_valid             ), //o
    .io_slaves_2_aw_ready         (io_slaves_2_aw_ready                  ), //i
    .io_slaves_2_aw_payload_addr  (xbar_io_slaves_2_aw_payload_addr[31:0]), //o
    .io_slaves_2_aw_payload_prot  (xbar_io_slaves_2_aw_payload_prot[2:0] ), //o
    .io_slaves_2_w_valid          (xbar_io_slaves_2_w_valid              ), //o
    .io_slaves_2_w_ready          (io_slaves_2_w_ready                   ), //i
    .io_slaves_2_w_payload_data   (xbar_io_slaves_2_w_payload_data[31:0] ), //o
    .io_slaves_2_w_payload_strb   (xbar_io_slaves_2_w_payload_strb[3:0]  ), //o
    .io_slaves_2_b_valid          (io_slaves_2_b_valid                   ), //i
    .io_slaves_2_b_ready          (xbar_io_slaves_2_b_ready              ), //o
    .io_slaves_2_b_payload_resp   (io_slaves_2_b_payload_resp[1:0]       ), //i
    .io_slaves_2_ar_valid         (xbar_io_slaves_2_ar_valid             ), //o
    .io_slaves_2_ar_ready         (io_slaves_2_ar_ready                  ), //i
    .io_slaves_2_ar_payload_addr  (xbar_io_slaves_2_ar_payload_addr[31:0]), //o
    .io_slaves_2_ar_payload_prot  (xbar_io_slaves_2_ar_payload_prot[2:0] ), //o
    .io_slaves_2_r_valid          (io_slaves_2_r_valid                   ), //i
    .io_slaves_2_r_ready          (xbar_io_slaves_2_r_ready              ), //o
    .io_slaves_2_r_payload_data   (io_slaves_2_r_payload_data[31:0]      ), //i
    .io_slaves_2_r_payload_resp   (io_slaves_2_r_payload_resp[1:0]       ), //i
    .io_slaves_3_aw_valid         (xbar_io_slaves_3_aw_valid             ), //o
    .io_slaves_3_aw_ready         (io_slaves_3_aw_ready                  ), //i
    .io_slaves_3_aw_payload_addr  (xbar_io_slaves_3_aw_payload_addr[31:0]), //o
    .io_slaves_3_aw_payload_prot  (xbar_io_slaves_3_aw_payload_prot[2:0] ), //o
    .io_slaves_3_w_valid          (xbar_io_slaves_3_w_valid              ), //o
    .io_slaves_3_w_ready          (io_slaves_3_w_ready                   ), //i
    .io_slaves_3_w_payload_data   (xbar_io_slaves_3_w_payload_data[31:0] ), //o
    .io_slaves_3_w_payload_strb   (xbar_io_slaves_3_w_payload_strb[3:0]  ), //o
    .io_slaves_3_b_valid          (io_slaves_3_b_valid                   ), //i
    .io_slaves_3_b_ready          (xbar_io_slaves_3_b_ready              ), //o
    .io_slaves_3_b_payload_resp   (io_slaves_3_b_payload_resp[1:0]       ), //i
    .io_slaves_3_ar_valid         (xbar_io_slaves_3_ar_valid             ), //o
    .io_slaves_3_ar_ready         (io_slaves_3_ar_ready                  ), //i
    .io_slaves_3_ar_payload_addr  (xbar_io_slaves_3_ar_payload_addr[31:0]), //o
    .io_slaves_3_ar_payload_prot  (xbar_io_slaves_3_ar_payload_prot[2:0] ), //o
    .io_slaves_3_r_valid          (io_slaves_3_r_valid                   ), //i
    .io_slaves_3_r_ready          (xbar_io_slaves_3_r_ready              ), //o
    .io_slaves_3_r_payload_data   (io_slaves_3_r_payload_data[31:0]      ), //i
    .io_slaves_3_r_payload_resp   (io_slaves_3_r_payload_resp[1:0]       ), //i
    .clk                          (clk                                   ), //i
    .resetn                       (resetn                                )  //i
  );
  assign io_masters_0_aw_ready = xbar_io_masters_0_aw_ready;
  assign io_masters_0_w_ready = xbar_io_masters_0_w_ready;
  assign io_masters_0_b_valid = xbar_io_masters_0_b_valid;
  assign io_masters_0_b_payload_resp = xbar_io_masters_0_b_payload_resp;
  assign io_masters_0_ar_ready = xbar_io_masters_0_ar_ready;
  assign io_masters_0_r_valid = xbar_io_masters_0_r_valid;
  assign io_masters_0_r_payload_data = xbar_io_masters_0_r_payload_data;
  assign io_masters_0_r_payload_resp = xbar_io_masters_0_r_payload_resp;
  assign io_masters_1_aw_ready = xbar_io_masters_1_aw_ready;
  assign io_masters_1_w_ready = xbar_io_masters_1_w_ready;
  assign io_masters_1_b_valid = xbar_io_masters_1_b_valid;
  assign io_masters_1_b_payload_resp = xbar_io_masters_1_b_payload_resp;
  assign io_masters_1_ar_ready = xbar_io_masters_1_ar_ready;
  assign io_masters_1_r_valid = xbar_io_masters_1_r_valid;
  assign io_masters_1_r_payload_data = xbar_io_masters_1_r_payload_data;
  assign io_masters_1_r_payload_resp = xbar_io_masters_1_r_payload_resp;
  assign io_masters_2_aw_ready = xbar_io_masters_2_aw_ready;
  assign io_masters_2_w_ready = xbar_io_masters_2_w_ready;
  assign io_masters_2_b_valid = xbar_io_masters_2_b_valid;
  assign io_masters_2_b_payload_resp = xbar_io_masters_2_b_payload_resp;
  assign io_masters_2_ar_ready = xbar_io_masters_2_ar_ready;
  assign io_masters_2_r_valid = xbar_io_masters_2_r_valid;
  assign io_masters_2_r_payload_data = xbar_io_masters_2_r_payload_data;
  assign io_masters_2_r_payload_resp = xbar_io_masters_2_r_payload_resp;
  assign io_masters_3_aw_ready = xbar_io_masters_3_aw_ready;
  assign io_masters_3_w_ready = xbar_io_masters_3_w_ready;
  assign io_masters_3_b_valid = xbar_io_masters_3_b_valid;
  assign io_masters_3_b_payload_resp = xbar_io_masters_3_b_payload_resp;
  assign io_masters_3_ar_ready = xbar_io_masters_3_ar_ready;
  assign io_masters_3_r_valid = xbar_io_masters_3_r_valid;
  assign io_masters_3_r_payload_data = xbar_io_masters_3_r_payload_data;
  assign io_masters_3_r_payload_resp = xbar_io_masters_3_r_payload_resp;
  assign io_slaves_0_aw_valid = xbar_io_slaves_0_aw_valid;
  assign io_slaves_0_aw_payload_addr = xbar_io_slaves_0_aw_payload_addr;
  assign io_slaves_0_aw_payload_prot = xbar_io_slaves_0_aw_payload_prot;
  assign io_slaves_0_w_valid = xbar_io_slaves_0_w_valid;
  assign io_slaves_0_w_payload_data = xbar_io_slaves_0_w_payload_data;
  assign io_slaves_0_w_payload_strb = xbar_io_slaves_0_w_payload_strb;
  assign io_slaves_0_b_ready = xbar_io_slaves_0_b_ready;
  assign io_slaves_0_ar_valid = xbar_io_slaves_0_ar_valid;
  assign io_slaves_0_ar_payload_addr = xbar_io_slaves_0_ar_payload_addr;
  assign io_slaves_0_ar_payload_prot = xbar_io_slaves_0_ar_payload_prot;
  assign io_slaves_0_r_ready = xbar_io_slaves_0_r_ready;
  assign io_slaves_1_aw_valid = xbar_io_slaves_1_aw_valid;
  assign io_slaves_1_aw_payload_addr = xbar_io_slaves_1_aw_payload_addr;
  assign io_slaves_1_aw_payload_prot = xbar_io_slaves_1_aw_payload_prot;
  assign io_slaves_1_w_valid = xbar_io_slaves_1_w_valid;
  assign io_slaves_1_w_payload_data = xbar_io_slaves_1_w_payload_data;
  assign io_slaves_1_w_payload_strb = xbar_io_slaves_1_w_payload_strb;
  assign io_slaves_1_b_ready = xbar_io_slaves_1_b_ready;
  assign io_slaves_1_ar_valid = xbar_io_slaves_1_ar_valid;
  assign io_slaves_1_ar_payload_addr = xbar_io_slaves_1_ar_payload_addr;
  assign io_slaves_1_ar_payload_prot = xbar_io_slaves_1_ar_payload_prot;
  assign io_slaves_1_r_ready = xbar_io_slaves_1_r_ready;
  assign io_slaves_2_aw_valid = xbar_io_slaves_2_aw_valid;
  assign io_slaves_2_aw_payload_addr = xbar_io_slaves_2_aw_payload_addr;
  assign io_slaves_2_aw_payload_prot = xbar_io_slaves_2_aw_payload_prot;
  assign io_slaves_2_w_valid = xbar_io_slaves_2_w_valid;
  assign io_slaves_2_w_payload_data = xbar_io_slaves_2_w_payload_data;
  assign io_slaves_2_w_payload_strb = xbar_io_slaves_2_w_payload_strb;
  assign io_slaves_2_b_ready = xbar_io_slaves_2_b_ready;
  assign io_slaves_2_ar_valid = xbar_io_slaves_2_ar_valid;
  assign io_slaves_2_ar_payload_addr = xbar_io_slaves_2_ar_payload_addr;
  assign io_slaves_2_ar_payload_prot = xbar_io_slaves_2_ar_payload_prot;
  assign io_slaves_2_r_ready = xbar_io_slaves_2_r_ready;
  assign io_slaves_3_aw_valid = xbar_io_slaves_3_aw_valid;
  assign io_slaves_3_aw_payload_addr = xbar_io_slaves_3_aw_payload_addr;
  assign io_slaves_3_aw_payload_prot = xbar_io_slaves_3_aw_payload_prot;
  assign io_slaves_3_w_valid = xbar_io_slaves_3_w_valid;
  assign io_slaves_3_w_payload_data = xbar_io_slaves_3_w_payload_data;
  assign io_slaves_3_w_payload_strb = xbar_io_slaves_3_w_payload_strb;
  assign io_slaves_3_b_ready = xbar_io_slaves_3_b_ready;
  assign io_slaves_3_ar_valid = xbar_io_slaves_3_ar_valid;
  assign io_slaves_3_ar_payload_addr = xbar_io_slaves_3_ar_payload_addr;
  assign io_slaves_3_ar_payload_prot = xbar_io_slaves_3_ar_payload_prot;
  assign io_slaves_3_r_ready = xbar_io_slaves_3_r_ready;

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
  input  wire          io_masters_2_aw_valid,
  output reg           io_masters_2_aw_ready,
  input  wire [31:0]   io_masters_2_aw_payload_addr,
  input  wire [2:0]    io_masters_2_aw_payload_prot,
  input  wire          io_masters_2_w_valid,
  output reg           io_masters_2_w_ready,
  input  wire [31:0]   io_masters_2_w_payload_data,
  input  wire [3:0]    io_masters_2_w_payload_strb,
  output reg           io_masters_2_b_valid,
  input  wire          io_masters_2_b_ready,
  output reg  [1:0]    io_masters_2_b_payload_resp,
  input  wire          io_masters_2_ar_valid,
  output reg           io_masters_2_ar_ready,
  input  wire [31:0]   io_masters_2_ar_payload_addr,
  input  wire [2:0]    io_masters_2_ar_payload_prot,
  output reg           io_masters_2_r_valid,
  input  wire          io_masters_2_r_ready,
  output reg  [31:0]   io_masters_2_r_payload_data,
  output reg  [1:0]    io_masters_2_r_payload_resp,
  input  wire          io_masters_3_aw_valid,
  output reg           io_masters_3_aw_ready,
  input  wire [31:0]   io_masters_3_aw_payload_addr,
  input  wire [2:0]    io_masters_3_aw_payload_prot,
  input  wire          io_masters_3_w_valid,
  output reg           io_masters_3_w_ready,
  input  wire [31:0]   io_masters_3_w_payload_data,
  input  wire [3:0]    io_masters_3_w_payload_strb,
  output reg           io_masters_3_b_valid,
  input  wire          io_masters_3_b_ready,
  output reg  [1:0]    io_masters_3_b_payload_resp,
  input  wire          io_masters_3_ar_valid,
  output reg           io_masters_3_ar_ready,
  input  wire [31:0]   io_masters_3_ar_payload_addr,
  input  wire [2:0]    io_masters_3_ar_payload_prot,
  output reg           io_masters_3_r_valid,
  input  wire          io_masters_3_r_ready,
  output reg  [31:0]   io_masters_3_r_payload_data,
  output reg  [1:0]    io_masters_3_r_payload_resp,
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

  wire       [1:0]    _zz_io_masters_0_b_payload_resp;
  wire       [1:0]    _zz_io_masters_1_b_payload_resp;
  wire       [1:0]    _zz_io_masters_2_b_payload_resp;
  wire       [1:0]    _zz_io_masters_3_b_payload_resp;
  wire       [3:0]    _zz__zz_when_Axi4LiteCrossbar_l131_1;
  wire       [3:0]    _zz__zz_when_Axi4LiteCrossbar_l131_3;
  wire       [3:0]    _zz__zz_when_Axi4LiteCrossbar_l131_5;
  wire       [3:0]    _zz__zz_when_Axi4LiteCrossbar_l131_7;
  wire       [3:0]    _zz__zz_when_Axi4LiteCrossbar_l131_9;
  wire       [3:0]    _zz__zz_when_Axi4LiteCrossbar_l131_11;
  wire       [3:0]    _zz__zz_when_Axi4LiteCrossbar_l131_13;
  wire       [3:0]    _zz__zz_when_Axi4LiteCrossbar_l131_15;
  reg                 wrActive_0;
  reg                 wrActive_1;
  reg                 wrActive_2;
  reg                 wrActive_3;
  reg        [1:0]    wrGranted_0;
  reg        [1:0]    wrGranted_1;
  reg        [1:0]    wrGranted_2;
  reg        [1:0]    wrGranted_3;
  reg        [1:0]    wrRrPtr_0;
  reg        [1:0]    wrRrPtr_1;
  reg        [1:0]    wrRrPtr_2;
  reg        [1:0]    wrRrPtr_3;
  reg                 rdActive_0;
  reg                 rdActive_1;
  reg                 rdActive_2;
  reg                 rdActive_3;
  reg        [1:0]    rdGranted_0;
  reg        [1:0]    rdGranted_1;
  reg        [1:0]    rdGranted_2;
  reg        [1:0]    rdGranted_3;
  reg        [1:0]    rdRrPtr_0;
  reg        [1:0]    rdRrPtr_1;
  reg        [1:0]    rdRrPtr_2;
  reg        [1:0]    rdRrPtr_3;
  wire       [33:0]   _zz_io_masters_0_r_payload_data;
  wire       [33:0]   _zz_io_masters_1_r_payload_data;
  wire       [33:0]   _zz_io_masters_2_r_payload_data;
  wire       [33:0]   _zz_io_masters_3_r_payload_data;
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
  wire                when_Axi4LiteCrossbar_l196;
  reg        [3:0]    _zz_when_Axi4LiteCrossbar_l208;
  reg        [3:0]    _zz_when_Axi4LiteCrossbar_l208_1;
  reg        [3:0]    _zz_when_Axi4LiteCrossbar_l208_2;
  reg        [3:0]    _zz_when_Axi4LiteCrossbar_l208_3;
  reg        [3:0]    _zz_when_Axi4LiteCrossbar_l208_4;
  wire       [3:0]    _zz_when_Axi4LiteCrossbar_l131;
  wire       [3:0]    _zz_when_Axi4LiteCrossbar_l131_1;
  reg        [1:0]    _zz_wrGranted_0;
  wire                when_Axi4LiteCrossbar_l131;
  wire                when_Axi4LiteCrossbar_l131_1;
  wire                when_Axi4LiteCrossbar_l131_2;
  wire                when_Axi4LiteCrossbar_l131_3;
  wire                when_Axi4LiteCrossbar_l208;
  wire                when_Axi4LiteCrossbar_l212;
  wire                when_Axi4LiteCrossbar_l212_1;
  wire                when_Axi4LiteCrossbar_l212_2;
  wire                when_Axi4LiteCrossbar_l212_3;
  wire                io_slaves_0_aw_fire;
  wire                when_Axi4LiteCrossbar_l264;
  wire                when_Axi4LiteCrossbar_l264_1;
  wire                when_Axi4LiteCrossbar_l264_2;
  wire                when_Axi4LiteCrossbar_l264_3;
  wire                io_slaves_0_b_fire;
  wire                when_Axi4LiteCrossbar_l196_1;
  reg        [3:0]    _zz_when_Axi4LiteCrossbar_l208_5;
  reg        [3:0]    _zz_when_Axi4LiteCrossbar_l208_6;
  reg        [3:0]    _zz_when_Axi4LiteCrossbar_l208_7;
  reg        [3:0]    _zz_when_Axi4LiteCrossbar_l208_8;
  reg        [3:0]    _zz_when_Axi4LiteCrossbar_l208_9;
  wire       [3:0]    _zz_when_Axi4LiteCrossbar_l131_2;
  wire       [3:0]    _zz_when_Axi4LiteCrossbar_l131_3;
  reg        [1:0]    _zz_wrGranted_1;
  wire                when_Axi4LiteCrossbar_l131_4;
  wire                when_Axi4LiteCrossbar_l131_5;
  wire                when_Axi4LiteCrossbar_l131_6;
  wire                when_Axi4LiteCrossbar_l131_7;
  wire                when_Axi4LiteCrossbar_l208_1;
  wire                when_Axi4LiteCrossbar_l212_4;
  wire                when_Axi4LiteCrossbar_l212_5;
  wire                when_Axi4LiteCrossbar_l212_6;
  wire                when_Axi4LiteCrossbar_l212_7;
  wire                io_slaves_1_aw_fire;
  wire                when_Axi4LiteCrossbar_l264_4;
  wire                when_Axi4LiteCrossbar_l264_5;
  wire                when_Axi4LiteCrossbar_l264_6;
  wire                when_Axi4LiteCrossbar_l264_7;
  wire                io_slaves_1_b_fire;
  wire                when_Axi4LiteCrossbar_l196_2;
  reg        [3:0]    _zz_when_Axi4LiteCrossbar_l208_10;
  reg        [3:0]    _zz_when_Axi4LiteCrossbar_l208_11;
  reg        [3:0]    _zz_when_Axi4LiteCrossbar_l208_12;
  reg        [3:0]    _zz_when_Axi4LiteCrossbar_l208_13;
  reg        [3:0]    _zz_when_Axi4LiteCrossbar_l208_14;
  wire       [3:0]    _zz_when_Axi4LiteCrossbar_l131_4;
  wire       [3:0]    _zz_when_Axi4LiteCrossbar_l131_5;
  reg        [1:0]    _zz_wrGranted_2;
  wire                when_Axi4LiteCrossbar_l131_8;
  wire                when_Axi4LiteCrossbar_l131_9;
  wire                when_Axi4LiteCrossbar_l131_10;
  wire                when_Axi4LiteCrossbar_l131_11;
  wire                when_Axi4LiteCrossbar_l208_2;
  wire                when_Axi4LiteCrossbar_l212_8;
  wire                when_Axi4LiteCrossbar_l212_9;
  wire                when_Axi4LiteCrossbar_l212_10;
  wire                when_Axi4LiteCrossbar_l212_11;
  wire                io_slaves_2_aw_fire;
  wire                when_Axi4LiteCrossbar_l264_8;
  wire                when_Axi4LiteCrossbar_l264_9;
  wire                when_Axi4LiteCrossbar_l264_10;
  wire                when_Axi4LiteCrossbar_l264_11;
  wire                io_slaves_2_b_fire;
  wire                when_Axi4LiteCrossbar_l196_3;
  reg        [3:0]    _zz_when_Axi4LiteCrossbar_l208_15;
  reg        [3:0]    _zz_when_Axi4LiteCrossbar_l208_16;
  reg        [3:0]    _zz_when_Axi4LiteCrossbar_l208_17;
  reg        [3:0]    _zz_when_Axi4LiteCrossbar_l208_18;
  reg        [3:0]    _zz_when_Axi4LiteCrossbar_l208_19;
  wire       [3:0]    _zz_when_Axi4LiteCrossbar_l131_6;
  wire       [3:0]    _zz_when_Axi4LiteCrossbar_l131_7;
  reg        [1:0]    _zz_wrGranted_3;
  wire                when_Axi4LiteCrossbar_l131_12;
  wire                when_Axi4LiteCrossbar_l131_13;
  wire                when_Axi4LiteCrossbar_l131_14;
  wire                when_Axi4LiteCrossbar_l131_15;
  wire                when_Axi4LiteCrossbar_l208_3;
  wire                when_Axi4LiteCrossbar_l212_12;
  wire                when_Axi4LiteCrossbar_l212_13;
  wire                when_Axi4LiteCrossbar_l212_14;
  wire                when_Axi4LiteCrossbar_l212_15;
  wire                io_slaves_3_aw_fire;
  wire                when_Axi4LiteCrossbar_l264_12;
  wire                when_Axi4LiteCrossbar_l264_13;
  wire                when_Axi4LiteCrossbar_l264_14;
  wire                when_Axi4LiteCrossbar_l264_15;
  wire                io_slaves_3_b_fire;
  wire                when_Axi4LiteCrossbar_l285;
  reg        [3:0]    _zz_when_Axi4LiteCrossbar_l296;
  reg        [3:0]    _zz_when_Axi4LiteCrossbar_l296_1;
  reg        [3:0]    _zz_when_Axi4LiteCrossbar_l296_2;
  reg        [3:0]    _zz_when_Axi4LiteCrossbar_l296_3;
  reg        [3:0]    _zz_when_Axi4LiteCrossbar_l296_4;
  wire       [3:0]    _zz_when_Axi4LiteCrossbar_l131_8;
  wire       [3:0]    _zz_when_Axi4LiteCrossbar_l131_9;
  reg        [1:0]    _zz_rdGranted_0;
  wire                when_Axi4LiteCrossbar_l131_16;
  wire                when_Axi4LiteCrossbar_l131_17;
  wire                when_Axi4LiteCrossbar_l131_18;
  wire                when_Axi4LiteCrossbar_l131_19;
  wire                when_Axi4LiteCrossbar_l296;
  wire                when_Axi4LiteCrossbar_l299;
  wire                when_Axi4LiteCrossbar_l299_1;
  wire                when_Axi4LiteCrossbar_l299_2;
  wire                when_Axi4LiteCrossbar_l299_3;
  wire                io_slaves_0_ar_fire;
  wire                when_Axi4LiteCrossbar_l342;
  wire                when_Axi4LiteCrossbar_l342_1;
  wire                when_Axi4LiteCrossbar_l342_2;
  wire                when_Axi4LiteCrossbar_l342_3;
  wire                io_slaves_0_r_fire;
  wire                when_Axi4LiteCrossbar_l285_1;
  reg        [3:0]    _zz_when_Axi4LiteCrossbar_l296_5;
  reg        [3:0]    _zz_when_Axi4LiteCrossbar_l296_6;
  reg        [3:0]    _zz_when_Axi4LiteCrossbar_l296_7;
  reg        [3:0]    _zz_when_Axi4LiteCrossbar_l296_8;
  reg        [3:0]    _zz_when_Axi4LiteCrossbar_l296_9;
  wire       [3:0]    _zz_when_Axi4LiteCrossbar_l131_10;
  wire       [3:0]    _zz_when_Axi4LiteCrossbar_l131_11;
  reg        [1:0]    _zz_rdGranted_1;
  wire                when_Axi4LiteCrossbar_l131_20;
  wire                when_Axi4LiteCrossbar_l131_21;
  wire                when_Axi4LiteCrossbar_l131_22;
  wire                when_Axi4LiteCrossbar_l131_23;
  wire                when_Axi4LiteCrossbar_l296_1;
  wire                when_Axi4LiteCrossbar_l299_4;
  wire                when_Axi4LiteCrossbar_l299_5;
  wire                when_Axi4LiteCrossbar_l299_6;
  wire                when_Axi4LiteCrossbar_l299_7;
  wire                io_slaves_1_ar_fire;
  wire                when_Axi4LiteCrossbar_l342_4;
  wire                when_Axi4LiteCrossbar_l342_5;
  wire                when_Axi4LiteCrossbar_l342_6;
  wire                when_Axi4LiteCrossbar_l342_7;
  wire                io_slaves_1_r_fire;
  wire                when_Axi4LiteCrossbar_l285_2;
  reg        [3:0]    _zz_when_Axi4LiteCrossbar_l296_10;
  reg        [3:0]    _zz_when_Axi4LiteCrossbar_l296_11;
  reg        [3:0]    _zz_when_Axi4LiteCrossbar_l296_12;
  reg        [3:0]    _zz_when_Axi4LiteCrossbar_l296_13;
  reg        [3:0]    _zz_when_Axi4LiteCrossbar_l296_14;
  wire       [3:0]    _zz_when_Axi4LiteCrossbar_l131_12;
  wire       [3:0]    _zz_when_Axi4LiteCrossbar_l131_13;
  reg        [1:0]    _zz_rdGranted_2;
  wire                when_Axi4LiteCrossbar_l131_24;
  wire                when_Axi4LiteCrossbar_l131_25;
  wire                when_Axi4LiteCrossbar_l131_26;
  wire                when_Axi4LiteCrossbar_l131_27;
  wire                when_Axi4LiteCrossbar_l296_2;
  wire                when_Axi4LiteCrossbar_l299_8;
  wire                when_Axi4LiteCrossbar_l299_9;
  wire                when_Axi4LiteCrossbar_l299_10;
  wire                when_Axi4LiteCrossbar_l299_11;
  wire                io_slaves_2_ar_fire;
  wire                when_Axi4LiteCrossbar_l342_8;
  wire                when_Axi4LiteCrossbar_l342_9;
  wire                when_Axi4LiteCrossbar_l342_10;
  wire                when_Axi4LiteCrossbar_l342_11;
  wire                io_slaves_2_r_fire;
  wire                when_Axi4LiteCrossbar_l285_3;
  reg        [3:0]    _zz_when_Axi4LiteCrossbar_l296_15;
  reg        [3:0]    _zz_when_Axi4LiteCrossbar_l296_16;
  reg        [3:0]    _zz_when_Axi4LiteCrossbar_l296_17;
  reg        [3:0]    _zz_when_Axi4LiteCrossbar_l296_18;
  reg        [3:0]    _zz_when_Axi4LiteCrossbar_l296_19;
  wire       [3:0]    _zz_when_Axi4LiteCrossbar_l131_14;
  wire       [3:0]    _zz_when_Axi4LiteCrossbar_l131_15;
  reg        [1:0]    _zz_rdGranted_3;
  wire                when_Axi4LiteCrossbar_l131_28;
  wire                when_Axi4LiteCrossbar_l131_29;
  wire                when_Axi4LiteCrossbar_l131_30;
  wire                when_Axi4LiteCrossbar_l131_31;
  wire                when_Axi4LiteCrossbar_l296_3;
  wire                when_Axi4LiteCrossbar_l299_12;
  wire                when_Axi4LiteCrossbar_l299_13;
  wire                when_Axi4LiteCrossbar_l299_14;
  wire                when_Axi4LiteCrossbar_l299_15;
  wire                io_slaves_3_ar_fire;
  wire                when_Axi4LiteCrossbar_l342_12;
  wire                when_Axi4LiteCrossbar_l342_13;
  wire                when_Axi4LiteCrossbar_l342_14;
  wire                when_Axi4LiteCrossbar_l342_15;
  wire                io_slaves_3_r_fire;

  assign _zz_io_masters_0_b_payload_resp = 2'b00;
  assign _zz_io_masters_1_b_payload_resp = 2'b00;
  assign _zz_io_masters_2_b_payload_resp = 2'b00;
  assign _zz_io_masters_3_b_payload_resp = 2'b00;
  assign _zz__zz_when_Axi4LiteCrossbar_l131_1 = (_zz_when_Axi4LiteCrossbar_l131 - 4'b0001);
  assign _zz__zz_when_Axi4LiteCrossbar_l131_3 = (_zz_when_Axi4LiteCrossbar_l131_2 - 4'b0001);
  assign _zz__zz_when_Axi4LiteCrossbar_l131_5 = (_zz_when_Axi4LiteCrossbar_l131_4 - 4'b0001);
  assign _zz__zz_when_Axi4LiteCrossbar_l131_7 = (_zz_when_Axi4LiteCrossbar_l131_6 - 4'b0001);
  assign _zz__zz_when_Axi4LiteCrossbar_l131_9 = (_zz_when_Axi4LiteCrossbar_l131_8 - 4'b0001);
  assign _zz__zz_when_Axi4LiteCrossbar_l131_11 = (_zz_when_Axi4LiteCrossbar_l131_10 - 4'b0001);
  assign _zz__zz_when_Axi4LiteCrossbar_l131_13 = (_zz_when_Axi4LiteCrossbar_l131_12 - 4'b0001);
  assign _zz__zz_when_Axi4LiteCrossbar_l131_15 = (_zz_when_Axi4LiteCrossbar_l131_14 - 4'b0001);
  always @(*) begin
    io_masters_0_aw_ready = 1'b0;
    if(when_Axi4LiteCrossbar_l196) begin
      if(when_Axi4LiteCrossbar_l208) begin
        if(when_Axi4LiteCrossbar_l212) begin
          io_masters_0_aw_ready = io_slaves_0_aw_ready;
        end
      end
    end
    if(when_Axi4LiteCrossbar_l196_1) begin
      if(when_Axi4LiteCrossbar_l208_1) begin
        if(when_Axi4LiteCrossbar_l212_4) begin
          io_masters_0_aw_ready = io_slaves_1_aw_ready;
        end
      end
    end
    if(when_Axi4LiteCrossbar_l196_2) begin
      if(when_Axi4LiteCrossbar_l208_2) begin
        if(when_Axi4LiteCrossbar_l212_8) begin
          io_masters_0_aw_ready = io_slaves_2_aw_ready;
        end
      end
    end
    if(when_Axi4LiteCrossbar_l196_3) begin
      if(when_Axi4LiteCrossbar_l208_3) begin
        if(when_Axi4LiteCrossbar_l212_12) begin
          io_masters_0_aw_ready = io_slaves_3_aw_ready;
        end
      end
    end
  end

  always @(*) begin
    io_masters_0_w_ready = 1'b0;
    if(when_Axi4LiteCrossbar_l196) begin
      if(when_Axi4LiteCrossbar_l208) begin
        if(when_Axi4LiteCrossbar_l212) begin
          io_masters_0_w_ready = io_slaves_0_w_ready;
        end
      end
    end else begin
      if(when_Axi4LiteCrossbar_l264) begin
        io_masters_0_w_ready = io_slaves_0_w_ready;
      end
    end
    if(when_Axi4LiteCrossbar_l196_1) begin
      if(when_Axi4LiteCrossbar_l208_1) begin
        if(when_Axi4LiteCrossbar_l212_4) begin
          io_masters_0_w_ready = io_slaves_1_w_ready;
        end
      end
    end else begin
      if(when_Axi4LiteCrossbar_l264_4) begin
        io_masters_0_w_ready = io_slaves_1_w_ready;
      end
    end
    if(when_Axi4LiteCrossbar_l196_2) begin
      if(when_Axi4LiteCrossbar_l208_2) begin
        if(when_Axi4LiteCrossbar_l212_8) begin
          io_masters_0_w_ready = io_slaves_2_w_ready;
        end
      end
    end else begin
      if(when_Axi4LiteCrossbar_l264_8) begin
        io_masters_0_w_ready = io_slaves_2_w_ready;
      end
    end
    if(when_Axi4LiteCrossbar_l196_3) begin
      if(when_Axi4LiteCrossbar_l208_3) begin
        if(when_Axi4LiteCrossbar_l212_12) begin
          io_masters_0_w_ready = io_slaves_3_w_ready;
        end
      end
    end else begin
      if(when_Axi4LiteCrossbar_l264_12) begin
        io_masters_0_w_ready = io_slaves_3_w_ready;
      end
    end
  end

  always @(*) begin
    io_masters_0_b_valid = 1'b0;
    if(!when_Axi4LiteCrossbar_l196) begin
      if(when_Axi4LiteCrossbar_l264) begin
        io_masters_0_b_valid = io_slaves_0_b_valid;
      end
    end
    if(!when_Axi4LiteCrossbar_l196_1) begin
      if(when_Axi4LiteCrossbar_l264_4) begin
        io_masters_0_b_valid = io_slaves_1_b_valid;
      end
    end
    if(!when_Axi4LiteCrossbar_l196_2) begin
      if(when_Axi4LiteCrossbar_l264_8) begin
        io_masters_0_b_valid = io_slaves_2_b_valid;
      end
    end
    if(!when_Axi4LiteCrossbar_l196_3) begin
      if(when_Axi4LiteCrossbar_l264_12) begin
        io_masters_0_b_valid = io_slaves_3_b_valid;
      end
    end
  end

  always @(*) begin
    io_masters_0_b_payload_resp = _zz_io_masters_0_b_payload_resp[1 : 0];
    if(!when_Axi4LiteCrossbar_l196) begin
      if(when_Axi4LiteCrossbar_l264) begin
        io_masters_0_b_payload_resp = io_slaves_0_b_payload_resp;
      end
    end
    if(!when_Axi4LiteCrossbar_l196_1) begin
      if(when_Axi4LiteCrossbar_l264_4) begin
        io_masters_0_b_payload_resp = io_slaves_1_b_payload_resp;
      end
    end
    if(!when_Axi4LiteCrossbar_l196_2) begin
      if(when_Axi4LiteCrossbar_l264_8) begin
        io_masters_0_b_payload_resp = io_slaves_2_b_payload_resp;
      end
    end
    if(!when_Axi4LiteCrossbar_l196_3) begin
      if(when_Axi4LiteCrossbar_l264_12) begin
        io_masters_0_b_payload_resp = io_slaves_3_b_payload_resp;
      end
    end
  end

  always @(*) begin
    io_masters_0_ar_ready = 1'b0;
    if(when_Axi4LiteCrossbar_l285) begin
      if(when_Axi4LiteCrossbar_l296) begin
        if(when_Axi4LiteCrossbar_l299) begin
          io_masters_0_ar_ready = io_slaves_0_ar_ready;
        end
      end
    end
    if(when_Axi4LiteCrossbar_l285_1) begin
      if(when_Axi4LiteCrossbar_l296_1) begin
        if(when_Axi4LiteCrossbar_l299_4) begin
          io_masters_0_ar_ready = io_slaves_1_ar_ready;
        end
      end
    end
    if(when_Axi4LiteCrossbar_l285_2) begin
      if(when_Axi4LiteCrossbar_l296_2) begin
        if(when_Axi4LiteCrossbar_l299_8) begin
          io_masters_0_ar_ready = io_slaves_2_ar_ready;
        end
      end
    end
    if(when_Axi4LiteCrossbar_l285_3) begin
      if(when_Axi4LiteCrossbar_l296_3) begin
        if(when_Axi4LiteCrossbar_l299_12) begin
          io_masters_0_ar_ready = io_slaves_3_ar_ready;
        end
      end
    end
  end

  always @(*) begin
    io_masters_0_r_valid = 1'b0;
    if(!when_Axi4LiteCrossbar_l285) begin
      if(when_Axi4LiteCrossbar_l342) begin
        io_masters_0_r_valid = io_slaves_0_r_valid;
      end
    end
    if(!when_Axi4LiteCrossbar_l285_1) begin
      if(when_Axi4LiteCrossbar_l342_4) begin
        io_masters_0_r_valid = io_slaves_1_r_valid;
      end
    end
    if(!when_Axi4LiteCrossbar_l285_2) begin
      if(when_Axi4LiteCrossbar_l342_8) begin
        io_masters_0_r_valid = io_slaves_2_r_valid;
      end
    end
    if(!when_Axi4LiteCrossbar_l285_3) begin
      if(when_Axi4LiteCrossbar_l342_12) begin
        io_masters_0_r_valid = io_slaves_3_r_valid;
      end
    end
  end

  assign _zz_io_masters_0_r_payload_data = 34'h0;
  always @(*) begin
    io_masters_0_r_payload_data = _zz_io_masters_0_r_payload_data[31 : 0];
    if(!when_Axi4LiteCrossbar_l285) begin
      if(when_Axi4LiteCrossbar_l342) begin
        io_masters_0_r_payload_data = io_slaves_0_r_payload_data;
      end
    end
    if(!when_Axi4LiteCrossbar_l285_1) begin
      if(when_Axi4LiteCrossbar_l342_4) begin
        io_masters_0_r_payload_data = io_slaves_1_r_payload_data;
      end
    end
    if(!when_Axi4LiteCrossbar_l285_2) begin
      if(when_Axi4LiteCrossbar_l342_8) begin
        io_masters_0_r_payload_data = io_slaves_2_r_payload_data;
      end
    end
    if(!when_Axi4LiteCrossbar_l285_3) begin
      if(when_Axi4LiteCrossbar_l342_12) begin
        io_masters_0_r_payload_data = io_slaves_3_r_payload_data;
      end
    end
  end

  always @(*) begin
    io_masters_0_r_payload_resp = _zz_io_masters_0_r_payload_data[33 : 32];
    if(!when_Axi4LiteCrossbar_l285) begin
      if(when_Axi4LiteCrossbar_l342) begin
        io_masters_0_r_payload_resp = io_slaves_0_r_payload_resp;
      end
    end
    if(!when_Axi4LiteCrossbar_l285_1) begin
      if(when_Axi4LiteCrossbar_l342_4) begin
        io_masters_0_r_payload_resp = io_slaves_1_r_payload_resp;
      end
    end
    if(!when_Axi4LiteCrossbar_l285_2) begin
      if(when_Axi4LiteCrossbar_l342_8) begin
        io_masters_0_r_payload_resp = io_slaves_2_r_payload_resp;
      end
    end
    if(!when_Axi4LiteCrossbar_l285_3) begin
      if(when_Axi4LiteCrossbar_l342_12) begin
        io_masters_0_r_payload_resp = io_slaves_3_r_payload_resp;
      end
    end
  end

  always @(*) begin
    io_masters_1_aw_ready = 1'b0;
    if(when_Axi4LiteCrossbar_l196) begin
      if(when_Axi4LiteCrossbar_l208) begin
        if(when_Axi4LiteCrossbar_l212_1) begin
          io_masters_1_aw_ready = io_slaves_0_aw_ready;
        end
      end
    end
    if(when_Axi4LiteCrossbar_l196_1) begin
      if(when_Axi4LiteCrossbar_l208_1) begin
        if(when_Axi4LiteCrossbar_l212_5) begin
          io_masters_1_aw_ready = io_slaves_1_aw_ready;
        end
      end
    end
    if(when_Axi4LiteCrossbar_l196_2) begin
      if(when_Axi4LiteCrossbar_l208_2) begin
        if(when_Axi4LiteCrossbar_l212_9) begin
          io_masters_1_aw_ready = io_slaves_2_aw_ready;
        end
      end
    end
    if(when_Axi4LiteCrossbar_l196_3) begin
      if(when_Axi4LiteCrossbar_l208_3) begin
        if(when_Axi4LiteCrossbar_l212_13) begin
          io_masters_1_aw_ready = io_slaves_3_aw_ready;
        end
      end
    end
  end

  always @(*) begin
    io_masters_1_w_ready = 1'b0;
    if(when_Axi4LiteCrossbar_l196) begin
      if(when_Axi4LiteCrossbar_l208) begin
        if(when_Axi4LiteCrossbar_l212_1) begin
          io_masters_1_w_ready = io_slaves_0_w_ready;
        end
      end
    end else begin
      if(when_Axi4LiteCrossbar_l264_1) begin
        io_masters_1_w_ready = io_slaves_0_w_ready;
      end
    end
    if(when_Axi4LiteCrossbar_l196_1) begin
      if(when_Axi4LiteCrossbar_l208_1) begin
        if(when_Axi4LiteCrossbar_l212_5) begin
          io_masters_1_w_ready = io_slaves_1_w_ready;
        end
      end
    end else begin
      if(when_Axi4LiteCrossbar_l264_5) begin
        io_masters_1_w_ready = io_slaves_1_w_ready;
      end
    end
    if(when_Axi4LiteCrossbar_l196_2) begin
      if(when_Axi4LiteCrossbar_l208_2) begin
        if(when_Axi4LiteCrossbar_l212_9) begin
          io_masters_1_w_ready = io_slaves_2_w_ready;
        end
      end
    end else begin
      if(when_Axi4LiteCrossbar_l264_9) begin
        io_masters_1_w_ready = io_slaves_2_w_ready;
      end
    end
    if(when_Axi4LiteCrossbar_l196_3) begin
      if(when_Axi4LiteCrossbar_l208_3) begin
        if(when_Axi4LiteCrossbar_l212_13) begin
          io_masters_1_w_ready = io_slaves_3_w_ready;
        end
      end
    end else begin
      if(when_Axi4LiteCrossbar_l264_13) begin
        io_masters_1_w_ready = io_slaves_3_w_ready;
      end
    end
  end

  always @(*) begin
    io_masters_1_b_valid = 1'b0;
    if(!when_Axi4LiteCrossbar_l196) begin
      if(when_Axi4LiteCrossbar_l264_1) begin
        io_masters_1_b_valid = io_slaves_0_b_valid;
      end
    end
    if(!when_Axi4LiteCrossbar_l196_1) begin
      if(when_Axi4LiteCrossbar_l264_5) begin
        io_masters_1_b_valid = io_slaves_1_b_valid;
      end
    end
    if(!when_Axi4LiteCrossbar_l196_2) begin
      if(when_Axi4LiteCrossbar_l264_9) begin
        io_masters_1_b_valid = io_slaves_2_b_valid;
      end
    end
    if(!when_Axi4LiteCrossbar_l196_3) begin
      if(when_Axi4LiteCrossbar_l264_13) begin
        io_masters_1_b_valid = io_slaves_3_b_valid;
      end
    end
  end

  always @(*) begin
    io_masters_1_b_payload_resp = _zz_io_masters_1_b_payload_resp[1 : 0];
    if(!when_Axi4LiteCrossbar_l196) begin
      if(when_Axi4LiteCrossbar_l264_1) begin
        io_masters_1_b_payload_resp = io_slaves_0_b_payload_resp;
      end
    end
    if(!when_Axi4LiteCrossbar_l196_1) begin
      if(when_Axi4LiteCrossbar_l264_5) begin
        io_masters_1_b_payload_resp = io_slaves_1_b_payload_resp;
      end
    end
    if(!when_Axi4LiteCrossbar_l196_2) begin
      if(when_Axi4LiteCrossbar_l264_9) begin
        io_masters_1_b_payload_resp = io_slaves_2_b_payload_resp;
      end
    end
    if(!when_Axi4LiteCrossbar_l196_3) begin
      if(when_Axi4LiteCrossbar_l264_13) begin
        io_masters_1_b_payload_resp = io_slaves_3_b_payload_resp;
      end
    end
  end

  always @(*) begin
    io_masters_1_ar_ready = 1'b0;
    if(when_Axi4LiteCrossbar_l285) begin
      if(when_Axi4LiteCrossbar_l296) begin
        if(when_Axi4LiteCrossbar_l299_1) begin
          io_masters_1_ar_ready = io_slaves_0_ar_ready;
        end
      end
    end
    if(when_Axi4LiteCrossbar_l285_1) begin
      if(when_Axi4LiteCrossbar_l296_1) begin
        if(when_Axi4LiteCrossbar_l299_5) begin
          io_masters_1_ar_ready = io_slaves_1_ar_ready;
        end
      end
    end
    if(when_Axi4LiteCrossbar_l285_2) begin
      if(when_Axi4LiteCrossbar_l296_2) begin
        if(when_Axi4LiteCrossbar_l299_9) begin
          io_masters_1_ar_ready = io_slaves_2_ar_ready;
        end
      end
    end
    if(when_Axi4LiteCrossbar_l285_3) begin
      if(when_Axi4LiteCrossbar_l296_3) begin
        if(when_Axi4LiteCrossbar_l299_13) begin
          io_masters_1_ar_ready = io_slaves_3_ar_ready;
        end
      end
    end
  end

  always @(*) begin
    io_masters_1_r_valid = 1'b0;
    if(!when_Axi4LiteCrossbar_l285) begin
      if(when_Axi4LiteCrossbar_l342_1) begin
        io_masters_1_r_valid = io_slaves_0_r_valid;
      end
    end
    if(!when_Axi4LiteCrossbar_l285_1) begin
      if(when_Axi4LiteCrossbar_l342_5) begin
        io_masters_1_r_valid = io_slaves_1_r_valid;
      end
    end
    if(!when_Axi4LiteCrossbar_l285_2) begin
      if(when_Axi4LiteCrossbar_l342_9) begin
        io_masters_1_r_valid = io_slaves_2_r_valid;
      end
    end
    if(!when_Axi4LiteCrossbar_l285_3) begin
      if(when_Axi4LiteCrossbar_l342_13) begin
        io_masters_1_r_valid = io_slaves_3_r_valid;
      end
    end
  end

  assign _zz_io_masters_1_r_payload_data = 34'h0;
  always @(*) begin
    io_masters_1_r_payload_data = _zz_io_masters_1_r_payload_data[31 : 0];
    if(!when_Axi4LiteCrossbar_l285) begin
      if(when_Axi4LiteCrossbar_l342_1) begin
        io_masters_1_r_payload_data = io_slaves_0_r_payload_data;
      end
    end
    if(!when_Axi4LiteCrossbar_l285_1) begin
      if(when_Axi4LiteCrossbar_l342_5) begin
        io_masters_1_r_payload_data = io_slaves_1_r_payload_data;
      end
    end
    if(!when_Axi4LiteCrossbar_l285_2) begin
      if(when_Axi4LiteCrossbar_l342_9) begin
        io_masters_1_r_payload_data = io_slaves_2_r_payload_data;
      end
    end
    if(!when_Axi4LiteCrossbar_l285_3) begin
      if(when_Axi4LiteCrossbar_l342_13) begin
        io_masters_1_r_payload_data = io_slaves_3_r_payload_data;
      end
    end
  end

  always @(*) begin
    io_masters_1_r_payload_resp = _zz_io_masters_1_r_payload_data[33 : 32];
    if(!when_Axi4LiteCrossbar_l285) begin
      if(when_Axi4LiteCrossbar_l342_1) begin
        io_masters_1_r_payload_resp = io_slaves_0_r_payload_resp;
      end
    end
    if(!when_Axi4LiteCrossbar_l285_1) begin
      if(when_Axi4LiteCrossbar_l342_5) begin
        io_masters_1_r_payload_resp = io_slaves_1_r_payload_resp;
      end
    end
    if(!when_Axi4LiteCrossbar_l285_2) begin
      if(when_Axi4LiteCrossbar_l342_9) begin
        io_masters_1_r_payload_resp = io_slaves_2_r_payload_resp;
      end
    end
    if(!when_Axi4LiteCrossbar_l285_3) begin
      if(when_Axi4LiteCrossbar_l342_13) begin
        io_masters_1_r_payload_resp = io_slaves_3_r_payload_resp;
      end
    end
  end

  always @(*) begin
    io_masters_2_aw_ready = 1'b0;
    if(when_Axi4LiteCrossbar_l196) begin
      if(when_Axi4LiteCrossbar_l208) begin
        if(when_Axi4LiteCrossbar_l212_2) begin
          io_masters_2_aw_ready = io_slaves_0_aw_ready;
        end
      end
    end
    if(when_Axi4LiteCrossbar_l196_1) begin
      if(when_Axi4LiteCrossbar_l208_1) begin
        if(when_Axi4LiteCrossbar_l212_6) begin
          io_masters_2_aw_ready = io_slaves_1_aw_ready;
        end
      end
    end
    if(when_Axi4LiteCrossbar_l196_2) begin
      if(when_Axi4LiteCrossbar_l208_2) begin
        if(when_Axi4LiteCrossbar_l212_10) begin
          io_masters_2_aw_ready = io_slaves_2_aw_ready;
        end
      end
    end
    if(when_Axi4LiteCrossbar_l196_3) begin
      if(when_Axi4LiteCrossbar_l208_3) begin
        if(when_Axi4LiteCrossbar_l212_14) begin
          io_masters_2_aw_ready = io_slaves_3_aw_ready;
        end
      end
    end
  end

  always @(*) begin
    io_masters_2_w_ready = 1'b0;
    if(when_Axi4LiteCrossbar_l196) begin
      if(when_Axi4LiteCrossbar_l208) begin
        if(when_Axi4LiteCrossbar_l212_2) begin
          io_masters_2_w_ready = io_slaves_0_w_ready;
        end
      end
    end else begin
      if(when_Axi4LiteCrossbar_l264_2) begin
        io_masters_2_w_ready = io_slaves_0_w_ready;
      end
    end
    if(when_Axi4LiteCrossbar_l196_1) begin
      if(when_Axi4LiteCrossbar_l208_1) begin
        if(when_Axi4LiteCrossbar_l212_6) begin
          io_masters_2_w_ready = io_slaves_1_w_ready;
        end
      end
    end else begin
      if(when_Axi4LiteCrossbar_l264_6) begin
        io_masters_2_w_ready = io_slaves_1_w_ready;
      end
    end
    if(when_Axi4LiteCrossbar_l196_2) begin
      if(when_Axi4LiteCrossbar_l208_2) begin
        if(when_Axi4LiteCrossbar_l212_10) begin
          io_masters_2_w_ready = io_slaves_2_w_ready;
        end
      end
    end else begin
      if(when_Axi4LiteCrossbar_l264_10) begin
        io_masters_2_w_ready = io_slaves_2_w_ready;
      end
    end
    if(when_Axi4LiteCrossbar_l196_3) begin
      if(when_Axi4LiteCrossbar_l208_3) begin
        if(when_Axi4LiteCrossbar_l212_14) begin
          io_masters_2_w_ready = io_slaves_3_w_ready;
        end
      end
    end else begin
      if(when_Axi4LiteCrossbar_l264_14) begin
        io_masters_2_w_ready = io_slaves_3_w_ready;
      end
    end
  end

  always @(*) begin
    io_masters_2_b_valid = 1'b0;
    if(!when_Axi4LiteCrossbar_l196) begin
      if(when_Axi4LiteCrossbar_l264_2) begin
        io_masters_2_b_valid = io_slaves_0_b_valid;
      end
    end
    if(!when_Axi4LiteCrossbar_l196_1) begin
      if(when_Axi4LiteCrossbar_l264_6) begin
        io_masters_2_b_valid = io_slaves_1_b_valid;
      end
    end
    if(!when_Axi4LiteCrossbar_l196_2) begin
      if(when_Axi4LiteCrossbar_l264_10) begin
        io_masters_2_b_valid = io_slaves_2_b_valid;
      end
    end
    if(!when_Axi4LiteCrossbar_l196_3) begin
      if(when_Axi4LiteCrossbar_l264_14) begin
        io_masters_2_b_valid = io_slaves_3_b_valid;
      end
    end
  end

  always @(*) begin
    io_masters_2_b_payload_resp = _zz_io_masters_2_b_payload_resp[1 : 0];
    if(!when_Axi4LiteCrossbar_l196) begin
      if(when_Axi4LiteCrossbar_l264_2) begin
        io_masters_2_b_payload_resp = io_slaves_0_b_payload_resp;
      end
    end
    if(!when_Axi4LiteCrossbar_l196_1) begin
      if(when_Axi4LiteCrossbar_l264_6) begin
        io_masters_2_b_payload_resp = io_slaves_1_b_payload_resp;
      end
    end
    if(!when_Axi4LiteCrossbar_l196_2) begin
      if(when_Axi4LiteCrossbar_l264_10) begin
        io_masters_2_b_payload_resp = io_slaves_2_b_payload_resp;
      end
    end
    if(!when_Axi4LiteCrossbar_l196_3) begin
      if(when_Axi4LiteCrossbar_l264_14) begin
        io_masters_2_b_payload_resp = io_slaves_3_b_payload_resp;
      end
    end
  end

  always @(*) begin
    io_masters_2_ar_ready = 1'b0;
    if(when_Axi4LiteCrossbar_l285) begin
      if(when_Axi4LiteCrossbar_l296) begin
        if(when_Axi4LiteCrossbar_l299_2) begin
          io_masters_2_ar_ready = io_slaves_0_ar_ready;
        end
      end
    end
    if(when_Axi4LiteCrossbar_l285_1) begin
      if(when_Axi4LiteCrossbar_l296_1) begin
        if(when_Axi4LiteCrossbar_l299_6) begin
          io_masters_2_ar_ready = io_slaves_1_ar_ready;
        end
      end
    end
    if(when_Axi4LiteCrossbar_l285_2) begin
      if(when_Axi4LiteCrossbar_l296_2) begin
        if(when_Axi4LiteCrossbar_l299_10) begin
          io_masters_2_ar_ready = io_slaves_2_ar_ready;
        end
      end
    end
    if(when_Axi4LiteCrossbar_l285_3) begin
      if(when_Axi4LiteCrossbar_l296_3) begin
        if(when_Axi4LiteCrossbar_l299_14) begin
          io_masters_2_ar_ready = io_slaves_3_ar_ready;
        end
      end
    end
  end

  always @(*) begin
    io_masters_2_r_valid = 1'b0;
    if(!when_Axi4LiteCrossbar_l285) begin
      if(when_Axi4LiteCrossbar_l342_2) begin
        io_masters_2_r_valid = io_slaves_0_r_valid;
      end
    end
    if(!when_Axi4LiteCrossbar_l285_1) begin
      if(when_Axi4LiteCrossbar_l342_6) begin
        io_masters_2_r_valid = io_slaves_1_r_valid;
      end
    end
    if(!when_Axi4LiteCrossbar_l285_2) begin
      if(when_Axi4LiteCrossbar_l342_10) begin
        io_masters_2_r_valid = io_slaves_2_r_valid;
      end
    end
    if(!when_Axi4LiteCrossbar_l285_3) begin
      if(when_Axi4LiteCrossbar_l342_14) begin
        io_masters_2_r_valid = io_slaves_3_r_valid;
      end
    end
  end

  assign _zz_io_masters_2_r_payload_data = 34'h0;
  always @(*) begin
    io_masters_2_r_payload_data = _zz_io_masters_2_r_payload_data[31 : 0];
    if(!when_Axi4LiteCrossbar_l285) begin
      if(when_Axi4LiteCrossbar_l342_2) begin
        io_masters_2_r_payload_data = io_slaves_0_r_payload_data;
      end
    end
    if(!when_Axi4LiteCrossbar_l285_1) begin
      if(when_Axi4LiteCrossbar_l342_6) begin
        io_masters_2_r_payload_data = io_slaves_1_r_payload_data;
      end
    end
    if(!when_Axi4LiteCrossbar_l285_2) begin
      if(when_Axi4LiteCrossbar_l342_10) begin
        io_masters_2_r_payload_data = io_slaves_2_r_payload_data;
      end
    end
    if(!when_Axi4LiteCrossbar_l285_3) begin
      if(when_Axi4LiteCrossbar_l342_14) begin
        io_masters_2_r_payload_data = io_slaves_3_r_payload_data;
      end
    end
  end

  always @(*) begin
    io_masters_2_r_payload_resp = _zz_io_masters_2_r_payload_data[33 : 32];
    if(!when_Axi4LiteCrossbar_l285) begin
      if(when_Axi4LiteCrossbar_l342_2) begin
        io_masters_2_r_payload_resp = io_slaves_0_r_payload_resp;
      end
    end
    if(!when_Axi4LiteCrossbar_l285_1) begin
      if(when_Axi4LiteCrossbar_l342_6) begin
        io_masters_2_r_payload_resp = io_slaves_1_r_payload_resp;
      end
    end
    if(!when_Axi4LiteCrossbar_l285_2) begin
      if(when_Axi4LiteCrossbar_l342_10) begin
        io_masters_2_r_payload_resp = io_slaves_2_r_payload_resp;
      end
    end
    if(!when_Axi4LiteCrossbar_l285_3) begin
      if(when_Axi4LiteCrossbar_l342_14) begin
        io_masters_2_r_payload_resp = io_slaves_3_r_payload_resp;
      end
    end
  end

  always @(*) begin
    io_masters_3_aw_ready = 1'b0;
    if(when_Axi4LiteCrossbar_l196) begin
      if(when_Axi4LiteCrossbar_l208) begin
        if(when_Axi4LiteCrossbar_l212_3) begin
          io_masters_3_aw_ready = io_slaves_0_aw_ready;
        end
      end
    end
    if(when_Axi4LiteCrossbar_l196_1) begin
      if(when_Axi4LiteCrossbar_l208_1) begin
        if(when_Axi4LiteCrossbar_l212_7) begin
          io_masters_3_aw_ready = io_slaves_1_aw_ready;
        end
      end
    end
    if(when_Axi4LiteCrossbar_l196_2) begin
      if(when_Axi4LiteCrossbar_l208_2) begin
        if(when_Axi4LiteCrossbar_l212_11) begin
          io_masters_3_aw_ready = io_slaves_2_aw_ready;
        end
      end
    end
    if(when_Axi4LiteCrossbar_l196_3) begin
      if(when_Axi4LiteCrossbar_l208_3) begin
        if(when_Axi4LiteCrossbar_l212_15) begin
          io_masters_3_aw_ready = io_slaves_3_aw_ready;
        end
      end
    end
  end

  always @(*) begin
    io_masters_3_w_ready = 1'b0;
    if(when_Axi4LiteCrossbar_l196) begin
      if(when_Axi4LiteCrossbar_l208) begin
        if(when_Axi4LiteCrossbar_l212_3) begin
          io_masters_3_w_ready = io_slaves_0_w_ready;
        end
      end
    end else begin
      if(when_Axi4LiteCrossbar_l264_3) begin
        io_masters_3_w_ready = io_slaves_0_w_ready;
      end
    end
    if(when_Axi4LiteCrossbar_l196_1) begin
      if(when_Axi4LiteCrossbar_l208_1) begin
        if(when_Axi4LiteCrossbar_l212_7) begin
          io_masters_3_w_ready = io_slaves_1_w_ready;
        end
      end
    end else begin
      if(when_Axi4LiteCrossbar_l264_7) begin
        io_masters_3_w_ready = io_slaves_1_w_ready;
      end
    end
    if(when_Axi4LiteCrossbar_l196_2) begin
      if(when_Axi4LiteCrossbar_l208_2) begin
        if(when_Axi4LiteCrossbar_l212_11) begin
          io_masters_3_w_ready = io_slaves_2_w_ready;
        end
      end
    end else begin
      if(when_Axi4LiteCrossbar_l264_11) begin
        io_masters_3_w_ready = io_slaves_2_w_ready;
      end
    end
    if(when_Axi4LiteCrossbar_l196_3) begin
      if(when_Axi4LiteCrossbar_l208_3) begin
        if(when_Axi4LiteCrossbar_l212_15) begin
          io_masters_3_w_ready = io_slaves_3_w_ready;
        end
      end
    end else begin
      if(when_Axi4LiteCrossbar_l264_15) begin
        io_masters_3_w_ready = io_slaves_3_w_ready;
      end
    end
  end

  always @(*) begin
    io_masters_3_b_valid = 1'b0;
    if(!when_Axi4LiteCrossbar_l196) begin
      if(when_Axi4LiteCrossbar_l264_3) begin
        io_masters_3_b_valid = io_slaves_0_b_valid;
      end
    end
    if(!when_Axi4LiteCrossbar_l196_1) begin
      if(when_Axi4LiteCrossbar_l264_7) begin
        io_masters_3_b_valid = io_slaves_1_b_valid;
      end
    end
    if(!when_Axi4LiteCrossbar_l196_2) begin
      if(when_Axi4LiteCrossbar_l264_11) begin
        io_masters_3_b_valid = io_slaves_2_b_valid;
      end
    end
    if(!when_Axi4LiteCrossbar_l196_3) begin
      if(when_Axi4LiteCrossbar_l264_15) begin
        io_masters_3_b_valid = io_slaves_3_b_valid;
      end
    end
  end

  always @(*) begin
    io_masters_3_b_payload_resp = _zz_io_masters_3_b_payload_resp[1 : 0];
    if(!when_Axi4LiteCrossbar_l196) begin
      if(when_Axi4LiteCrossbar_l264_3) begin
        io_masters_3_b_payload_resp = io_slaves_0_b_payload_resp;
      end
    end
    if(!when_Axi4LiteCrossbar_l196_1) begin
      if(when_Axi4LiteCrossbar_l264_7) begin
        io_masters_3_b_payload_resp = io_slaves_1_b_payload_resp;
      end
    end
    if(!when_Axi4LiteCrossbar_l196_2) begin
      if(when_Axi4LiteCrossbar_l264_11) begin
        io_masters_3_b_payload_resp = io_slaves_2_b_payload_resp;
      end
    end
    if(!when_Axi4LiteCrossbar_l196_3) begin
      if(when_Axi4LiteCrossbar_l264_15) begin
        io_masters_3_b_payload_resp = io_slaves_3_b_payload_resp;
      end
    end
  end

  always @(*) begin
    io_masters_3_ar_ready = 1'b0;
    if(when_Axi4LiteCrossbar_l285) begin
      if(when_Axi4LiteCrossbar_l296) begin
        if(when_Axi4LiteCrossbar_l299_3) begin
          io_masters_3_ar_ready = io_slaves_0_ar_ready;
        end
      end
    end
    if(when_Axi4LiteCrossbar_l285_1) begin
      if(when_Axi4LiteCrossbar_l296_1) begin
        if(when_Axi4LiteCrossbar_l299_7) begin
          io_masters_3_ar_ready = io_slaves_1_ar_ready;
        end
      end
    end
    if(when_Axi4LiteCrossbar_l285_2) begin
      if(when_Axi4LiteCrossbar_l296_2) begin
        if(when_Axi4LiteCrossbar_l299_11) begin
          io_masters_3_ar_ready = io_slaves_2_ar_ready;
        end
      end
    end
    if(when_Axi4LiteCrossbar_l285_3) begin
      if(when_Axi4LiteCrossbar_l296_3) begin
        if(when_Axi4LiteCrossbar_l299_15) begin
          io_masters_3_ar_ready = io_slaves_3_ar_ready;
        end
      end
    end
  end

  always @(*) begin
    io_masters_3_r_valid = 1'b0;
    if(!when_Axi4LiteCrossbar_l285) begin
      if(when_Axi4LiteCrossbar_l342_3) begin
        io_masters_3_r_valid = io_slaves_0_r_valid;
      end
    end
    if(!when_Axi4LiteCrossbar_l285_1) begin
      if(when_Axi4LiteCrossbar_l342_7) begin
        io_masters_3_r_valid = io_slaves_1_r_valid;
      end
    end
    if(!when_Axi4LiteCrossbar_l285_2) begin
      if(when_Axi4LiteCrossbar_l342_11) begin
        io_masters_3_r_valid = io_slaves_2_r_valid;
      end
    end
    if(!when_Axi4LiteCrossbar_l285_3) begin
      if(when_Axi4LiteCrossbar_l342_15) begin
        io_masters_3_r_valid = io_slaves_3_r_valid;
      end
    end
  end

  assign _zz_io_masters_3_r_payload_data = 34'h0;
  always @(*) begin
    io_masters_3_r_payload_data = _zz_io_masters_3_r_payload_data[31 : 0];
    if(!when_Axi4LiteCrossbar_l285) begin
      if(when_Axi4LiteCrossbar_l342_3) begin
        io_masters_3_r_payload_data = io_slaves_0_r_payload_data;
      end
    end
    if(!when_Axi4LiteCrossbar_l285_1) begin
      if(when_Axi4LiteCrossbar_l342_7) begin
        io_masters_3_r_payload_data = io_slaves_1_r_payload_data;
      end
    end
    if(!when_Axi4LiteCrossbar_l285_2) begin
      if(when_Axi4LiteCrossbar_l342_11) begin
        io_masters_3_r_payload_data = io_slaves_2_r_payload_data;
      end
    end
    if(!when_Axi4LiteCrossbar_l285_3) begin
      if(when_Axi4LiteCrossbar_l342_15) begin
        io_masters_3_r_payload_data = io_slaves_3_r_payload_data;
      end
    end
  end

  always @(*) begin
    io_masters_3_r_payload_resp = _zz_io_masters_3_r_payload_data[33 : 32];
    if(!when_Axi4LiteCrossbar_l285) begin
      if(when_Axi4LiteCrossbar_l342_3) begin
        io_masters_3_r_payload_resp = io_slaves_0_r_payload_resp;
      end
    end
    if(!when_Axi4LiteCrossbar_l285_1) begin
      if(when_Axi4LiteCrossbar_l342_7) begin
        io_masters_3_r_payload_resp = io_slaves_1_r_payload_resp;
      end
    end
    if(!when_Axi4LiteCrossbar_l285_2) begin
      if(when_Axi4LiteCrossbar_l342_11) begin
        io_masters_3_r_payload_resp = io_slaves_2_r_payload_resp;
      end
    end
    if(!when_Axi4LiteCrossbar_l285_3) begin
      if(when_Axi4LiteCrossbar_l342_15) begin
        io_masters_3_r_payload_resp = io_slaves_3_r_payload_resp;
      end
    end
  end

  always @(*) begin
    io_slaves_0_aw_valid = 1'b0;
    if(when_Axi4LiteCrossbar_l196) begin
      if(when_Axi4LiteCrossbar_l208) begin
        io_slaves_0_aw_valid = 1'b1;
      end
    end
  end

  assign _zz_io_slaves_0_aw_payload_addr = 35'h0;
  always @(*) begin
    io_slaves_0_aw_payload_addr = _zz_io_slaves_0_aw_payload_addr[31 : 0];
    if(when_Axi4LiteCrossbar_l196) begin
      if(when_Axi4LiteCrossbar_l208) begin
        if(when_Axi4LiteCrossbar_l212) begin
          io_slaves_0_aw_payload_addr = io_masters_0_aw_payload_addr;
        end
        if(when_Axi4LiteCrossbar_l212_1) begin
          io_slaves_0_aw_payload_addr = io_masters_1_aw_payload_addr;
        end
        if(when_Axi4LiteCrossbar_l212_2) begin
          io_slaves_0_aw_payload_addr = io_masters_2_aw_payload_addr;
        end
        if(when_Axi4LiteCrossbar_l212_3) begin
          io_slaves_0_aw_payload_addr = io_masters_3_aw_payload_addr;
        end
      end
    end
  end

  always @(*) begin
    io_slaves_0_aw_payload_prot = _zz_io_slaves_0_aw_payload_addr[34 : 32];
    if(when_Axi4LiteCrossbar_l196) begin
      if(when_Axi4LiteCrossbar_l208) begin
        if(when_Axi4LiteCrossbar_l212) begin
          io_slaves_0_aw_payload_prot = io_masters_0_aw_payload_prot;
        end
        if(when_Axi4LiteCrossbar_l212_1) begin
          io_slaves_0_aw_payload_prot = io_masters_1_aw_payload_prot;
        end
        if(when_Axi4LiteCrossbar_l212_2) begin
          io_slaves_0_aw_payload_prot = io_masters_2_aw_payload_prot;
        end
        if(when_Axi4LiteCrossbar_l212_3) begin
          io_slaves_0_aw_payload_prot = io_masters_3_aw_payload_prot;
        end
      end
    end
  end

  always @(*) begin
    io_slaves_0_w_valid = 1'b0;
    if(when_Axi4LiteCrossbar_l196) begin
      if(when_Axi4LiteCrossbar_l208) begin
        if(when_Axi4LiteCrossbar_l212) begin
          io_slaves_0_w_valid = io_masters_0_w_valid;
        end
        if(when_Axi4LiteCrossbar_l212_1) begin
          io_slaves_0_w_valid = io_masters_1_w_valid;
        end
        if(when_Axi4LiteCrossbar_l212_2) begin
          io_slaves_0_w_valid = io_masters_2_w_valid;
        end
        if(when_Axi4LiteCrossbar_l212_3) begin
          io_slaves_0_w_valid = io_masters_3_w_valid;
        end
      end
    end else begin
      if(when_Axi4LiteCrossbar_l264) begin
        io_slaves_0_w_valid = io_masters_0_w_valid;
      end
      if(when_Axi4LiteCrossbar_l264_1) begin
        io_slaves_0_w_valid = io_masters_1_w_valid;
      end
      if(when_Axi4LiteCrossbar_l264_2) begin
        io_slaves_0_w_valid = io_masters_2_w_valid;
      end
      if(when_Axi4LiteCrossbar_l264_3) begin
        io_slaves_0_w_valid = io_masters_3_w_valid;
      end
    end
  end

  assign _zz_io_slaves_0_w_payload_data = 36'h0;
  always @(*) begin
    io_slaves_0_w_payload_data = _zz_io_slaves_0_w_payload_data[31 : 0];
    if(when_Axi4LiteCrossbar_l196) begin
      if(when_Axi4LiteCrossbar_l208) begin
        if(when_Axi4LiteCrossbar_l212) begin
          io_slaves_0_w_payload_data = io_masters_0_w_payload_data;
        end
        if(when_Axi4LiteCrossbar_l212_1) begin
          io_slaves_0_w_payload_data = io_masters_1_w_payload_data;
        end
        if(when_Axi4LiteCrossbar_l212_2) begin
          io_slaves_0_w_payload_data = io_masters_2_w_payload_data;
        end
        if(when_Axi4LiteCrossbar_l212_3) begin
          io_slaves_0_w_payload_data = io_masters_3_w_payload_data;
        end
      end
    end else begin
      if(when_Axi4LiteCrossbar_l264) begin
        io_slaves_0_w_payload_data = io_masters_0_w_payload_data;
      end
      if(when_Axi4LiteCrossbar_l264_1) begin
        io_slaves_0_w_payload_data = io_masters_1_w_payload_data;
      end
      if(when_Axi4LiteCrossbar_l264_2) begin
        io_slaves_0_w_payload_data = io_masters_2_w_payload_data;
      end
      if(when_Axi4LiteCrossbar_l264_3) begin
        io_slaves_0_w_payload_data = io_masters_3_w_payload_data;
      end
    end
  end

  always @(*) begin
    io_slaves_0_w_payload_strb = _zz_io_slaves_0_w_payload_data[35 : 32];
    if(when_Axi4LiteCrossbar_l196) begin
      if(when_Axi4LiteCrossbar_l208) begin
        if(when_Axi4LiteCrossbar_l212) begin
          io_slaves_0_w_payload_strb = io_masters_0_w_payload_strb;
        end
        if(when_Axi4LiteCrossbar_l212_1) begin
          io_slaves_0_w_payload_strb = io_masters_1_w_payload_strb;
        end
        if(when_Axi4LiteCrossbar_l212_2) begin
          io_slaves_0_w_payload_strb = io_masters_2_w_payload_strb;
        end
        if(when_Axi4LiteCrossbar_l212_3) begin
          io_slaves_0_w_payload_strb = io_masters_3_w_payload_strb;
        end
      end
    end else begin
      if(when_Axi4LiteCrossbar_l264) begin
        io_slaves_0_w_payload_strb = io_masters_0_w_payload_strb;
      end
      if(when_Axi4LiteCrossbar_l264_1) begin
        io_slaves_0_w_payload_strb = io_masters_1_w_payload_strb;
      end
      if(when_Axi4LiteCrossbar_l264_2) begin
        io_slaves_0_w_payload_strb = io_masters_2_w_payload_strb;
      end
      if(when_Axi4LiteCrossbar_l264_3) begin
        io_slaves_0_w_payload_strb = io_masters_3_w_payload_strb;
      end
    end
  end

  always @(*) begin
    io_slaves_0_b_ready = 1'b0;
    if(!when_Axi4LiteCrossbar_l196) begin
      if(when_Axi4LiteCrossbar_l264) begin
        io_slaves_0_b_ready = io_masters_0_b_ready;
      end
      if(when_Axi4LiteCrossbar_l264_1) begin
        io_slaves_0_b_ready = io_masters_1_b_ready;
      end
      if(when_Axi4LiteCrossbar_l264_2) begin
        io_slaves_0_b_ready = io_masters_2_b_ready;
      end
      if(when_Axi4LiteCrossbar_l264_3) begin
        io_slaves_0_b_ready = io_masters_3_b_ready;
      end
    end
  end

  always @(*) begin
    io_slaves_0_ar_valid = 1'b0;
    if(when_Axi4LiteCrossbar_l285) begin
      if(when_Axi4LiteCrossbar_l296) begin
        io_slaves_0_ar_valid = 1'b1;
      end
    end
  end

  assign _zz_io_slaves_0_ar_payload_addr = 35'h0;
  always @(*) begin
    io_slaves_0_ar_payload_addr = _zz_io_slaves_0_ar_payload_addr[31 : 0];
    if(when_Axi4LiteCrossbar_l285) begin
      if(when_Axi4LiteCrossbar_l296) begin
        if(when_Axi4LiteCrossbar_l299) begin
          io_slaves_0_ar_payload_addr = io_masters_0_ar_payload_addr;
        end
        if(when_Axi4LiteCrossbar_l299_1) begin
          io_slaves_0_ar_payload_addr = io_masters_1_ar_payload_addr;
        end
        if(when_Axi4LiteCrossbar_l299_2) begin
          io_slaves_0_ar_payload_addr = io_masters_2_ar_payload_addr;
        end
        if(when_Axi4LiteCrossbar_l299_3) begin
          io_slaves_0_ar_payload_addr = io_masters_3_ar_payload_addr;
        end
      end
    end
  end

  always @(*) begin
    io_slaves_0_ar_payload_prot = _zz_io_slaves_0_ar_payload_addr[34 : 32];
    if(when_Axi4LiteCrossbar_l285) begin
      if(when_Axi4LiteCrossbar_l296) begin
        if(when_Axi4LiteCrossbar_l299) begin
          io_slaves_0_ar_payload_prot = io_masters_0_ar_payload_prot;
        end
        if(when_Axi4LiteCrossbar_l299_1) begin
          io_slaves_0_ar_payload_prot = io_masters_1_ar_payload_prot;
        end
        if(when_Axi4LiteCrossbar_l299_2) begin
          io_slaves_0_ar_payload_prot = io_masters_2_ar_payload_prot;
        end
        if(when_Axi4LiteCrossbar_l299_3) begin
          io_slaves_0_ar_payload_prot = io_masters_3_ar_payload_prot;
        end
      end
    end
  end

  always @(*) begin
    io_slaves_0_r_ready = 1'b0;
    if(!when_Axi4LiteCrossbar_l285) begin
      if(when_Axi4LiteCrossbar_l342) begin
        io_slaves_0_r_ready = io_masters_0_r_ready;
      end
      if(when_Axi4LiteCrossbar_l342_1) begin
        io_slaves_0_r_ready = io_masters_1_r_ready;
      end
      if(when_Axi4LiteCrossbar_l342_2) begin
        io_slaves_0_r_ready = io_masters_2_r_ready;
      end
      if(when_Axi4LiteCrossbar_l342_3) begin
        io_slaves_0_r_ready = io_masters_3_r_ready;
      end
    end
  end

  always @(*) begin
    io_slaves_1_aw_valid = 1'b0;
    if(when_Axi4LiteCrossbar_l196_1) begin
      if(when_Axi4LiteCrossbar_l208_1) begin
        io_slaves_1_aw_valid = 1'b1;
      end
    end
  end

  assign _zz_io_slaves_1_aw_payload_addr = 35'h0;
  always @(*) begin
    io_slaves_1_aw_payload_addr = _zz_io_slaves_1_aw_payload_addr[31 : 0];
    if(when_Axi4LiteCrossbar_l196_1) begin
      if(when_Axi4LiteCrossbar_l208_1) begin
        if(when_Axi4LiteCrossbar_l212_4) begin
          io_slaves_1_aw_payload_addr = io_masters_0_aw_payload_addr;
        end
        if(when_Axi4LiteCrossbar_l212_5) begin
          io_slaves_1_aw_payload_addr = io_masters_1_aw_payload_addr;
        end
        if(when_Axi4LiteCrossbar_l212_6) begin
          io_slaves_1_aw_payload_addr = io_masters_2_aw_payload_addr;
        end
        if(when_Axi4LiteCrossbar_l212_7) begin
          io_slaves_1_aw_payload_addr = io_masters_3_aw_payload_addr;
        end
      end
    end
  end

  always @(*) begin
    io_slaves_1_aw_payload_prot = _zz_io_slaves_1_aw_payload_addr[34 : 32];
    if(when_Axi4LiteCrossbar_l196_1) begin
      if(when_Axi4LiteCrossbar_l208_1) begin
        if(when_Axi4LiteCrossbar_l212_4) begin
          io_slaves_1_aw_payload_prot = io_masters_0_aw_payload_prot;
        end
        if(when_Axi4LiteCrossbar_l212_5) begin
          io_slaves_1_aw_payload_prot = io_masters_1_aw_payload_prot;
        end
        if(when_Axi4LiteCrossbar_l212_6) begin
          io_slaves_1_aw_payload_prot = io_masters_2_aw_payload_prot;
        end
        if(when_Axi4LiteCrossbar_l212_7) begin
          io_slaves_1_aw_payload_prot = io_masters_3_aw_payload_prot;
        end
      end
    end
  end

  always @(*) begin
    io_slaves_1_w_valid = 1'b0;
    if(when_Axi4LiteCrossbar_l196_1) begin
      if(when_Axi4LiteCrossbar_l208_1) begin
        if(when_Axi4LiteCrossbar_l212_4) begin
          io_slaves_1_w_valid = io_masters_0_w_valid;
        end
        if(when_Axi4LiteCrossbar_l212_5) begin
          io_slaves_1_w_valid = io_masters_1_w_valid;
        end
        if(when_Axi4LiteCrossbar_l212_6) begin
          io_slaves_1_w_valid = io_masters_2_w_valid;
        end
        if(when_Axi4LiteCrossbar_l212_7) begin
          io_slaves_1_w_valid = io_masters_3_w_valid;
        end
      end
    end else begin
      if(when_Axi4LiteCrossbar_l264_4) begin
        io_slaves_1_w_valid = io_masters_0_w_valid;
      end
      if(when_Axi4LiteCrossbar_l264_5) begin
        io_slaves_1_w_valid = io_masters_1_w_valid;
      end
      if(when_Axi4LiteCrossbar_l264_6) begin
        io_slaves_1_w_valid = io_masters_2_w_valid;
      end
      if(when_Axi4LiteCrossbar_l264_7) begin
        io_slaves_1_w_valid = io_masters_3_w_valid;
      end
    end
  end

  assign _zz_io_slaves_1_w_payload_data = 36'h0;
  always @(*) begin
    io_slaves_1_w_payload_data = _zz_io_slaves_1_w_payload_data[31 : 0];
    if(when_Axi4LiteCrossbar_l196_1) begin
      if(when_Axi4LiteCrossbar_l208_1) begin
        if(when_Axi4LiteCrossbar_l212_4) begin
          io_slaves_1_w_payload_data = io_masters_0_w_payload_data;
        end
        if(when_Axi4LiteCrossbar_l212_5) begin
          io_slaves_1_w_payload_data = io_masters_1_w_payload_data;
        end
        if(when_Axi4LiteCrossbar_l212_6) begin
          io_slaves_1_w_payload_data = io_masters_2_w_payload_data;
        end
        if(when_Axi4LiteCrossbar_l212_7) begin
          io_slaves_1_w_payload_data = io_masters_3_w_payload_data;
        end
      end
    end else begin
      if(when_Axi4LiteCrossbar_l264_4) begin
        io_slaves_1_w_payload_data = io_masters_0_w_payload_data;
      end
      if(when_Axi4LiteCrossbar_l264_5) begin
        io_slaves_1_w_payload_data = io_masters_1_w_payload_data;
      end
      if(when_Axi4LiteCrossbar_l264_6) begin
        io_slaves_1_w_payload_data = io_masters_2_w_payload_data;
      end
      if(when_Axi4LiteCrossbar_l264_7) begin
        io_slaves_1_w_payload_data = io_masters_3_w_payload_data;
      end
    end
  end

  always @(*) begin
    io_slaves_1_w_payload_strb = _zz_io_slaves_1_w_payload_data[35 : 32];
    if(when_Axi4LiteCrossbar_l196_1) begin
      if(when_Axi4LiteCrossbar_l208_1) begin
        if(when_Axi4LiteCrossbar_l212_4) begin
          io_slaves_1_w_payload_strb = io_masters_0_w_payload_strb;
        end
        if(when_Axi4LiteCrossbar_l212_5) begin
          io_slaves_1_w_payload_strb = io_masters_1_w_payload_strb;
        end
        if(when_Axi4LiteCrossbar_l212_6) begin
          io_slaves_1_w_payload_strb = io_masters_2_w_payload_strb;
        end
        if(when_Axi4LiteCrossbar_l212_7) begin
          io_slaves_1_w_payload_strb = io_masters_3_w_payload_strb;
        end
      end
    end else begin
      if(when_Axi4LiteCrossbar_l264_4) begin
        io_slaves_1_w_payload_strb = io_masters_0_w_payload_strb;
      end
      if(when_Axi4LiteCrossbar_l264_5) begin
        io_slaves_1_w_payload_strb = io_masters_1_w_payload_strb;
      end
      if(when_Axi4LiteCrossbar_l264_6) begin
        io_slaves_1_w_payload_strb = io_masters_2_w_payload_strb;
      end
      if(when_Axi4LiteCrossbar_l264_7) begin
        io_slaves_1_w_payload_strb = io_masters_3_w_payload_strb;
      end
    end
  end

  always @(*) begin
    io_slaves_1_b_ready = 1'b0;
    if(!when_Axi4LiteCrossbar_l196_1) begin
      if(when_Axi4LiteCrossbar_l264_4) begin
        io_slaves_1_b_ready = io_masters_0_b_ready;
      end
      if(when_Axi4LiteCrossbar_l264_5) begin
        io_slaves_1_b_ready = io_masters_1_b_ready;
      end
      if(when_Axi4LiteCrossbar_l264_6) begin
        io_slaves_1_b_ready = io_masters_2_b_ready;
      end
      if(when_Axi4LiteCrossbar_l264_7) begin
        io_slaves_1_b_ready = io_masters_3_b_ready;
      end
    end
  end

  always @(*) begin
    io_slaves_1_ar_valid = 1'b0;
    if(when_Axi4LiteCrossbar_l285_1) begin
      if(when_Axi4LiteCrossbar_l296_1) begin
        io_slaves_1_ar_valid = 1'b1;
      end
    end
  end

  assign _zz_io_slaves_1_ar_payload_addr = 35'h0;
  always @(*) begin
    io_slaves_1_ar_payload_addr = _zz_io_slaves_1_ar_payload_addr[31 : 0];
    if(when_Axi4LiteCrossbar_l285_1) begin
      if(when_Axi4LiteCrossbar_l296_1) begin
        if(when_Axi4LiteCrossbar_l299_4) begin
          io_slaves_1_ar_payload_addr = io_masters_0_ar_payload_addr;
        end
        if(when_Axi4LiteCrossbar_l299_5) begin
          io_slaves_1_ar_payload_addr = io_masters_1_ar_payload_addr;
        end
        if(when_Axi4LiteCrossbar_l299_6) begin
          io_slaves_1_ar_payload_addr = io_masters_2_ar_payload_addr;
        end
        if(when_Axi4LiteCrossbar_l299_7) begin
          io_slaves_1_ar_payload_addr = io_masters_3_ar_payload_addr;
        end
      end
    end
  end

  always @(*) begin
    io_slaves_1_ar_payload_prot = _zz_io_slaves_1_ar_payload_addr[34 : 32];
    if(when_Axi4LiteCrossbar_l285_1) begin
      if(when_Axi4LiteCrossbar_l296_1) begin
        if(when_Axi4LiteCrossbar_l299_4) begin
          io_slaves_1_ar_payload_prot = io_masters_0_ar_payload_prot;
        end
        if(when_Axi4LiteCrossbar_l299_5) begin
          io_slaves_1_ar_payload_prot = io_masters_1_ar_payload_prot;
        end
        if(when_Axi4LiteCrossbar_l299_6) begin
          io_slaves_1_ar_payload_prot = io_masters_2_ar_payload_prot;
        end
        if(when_Axi4LiteCrossbar_l299_7) begin
          io_slaves_1_ar_payload_prot = io_masters_3_ar_payload_prot;
        end
      end
    end
  end

  always @(*) begin
    io_slaves_1_r_ready = 1'b0;
    if(!when_Axi4LiteCrossbar_l285_1) begin
      if(when_Axi4LiteCrossbar_l342_4) begin
        io_slaves_1_r_ready = io_masters_0_r_ready;
      end
      if(when_Axi4LiteCrossbar_l342_5) begin
        io_slaves_1_r_ready = io_masters_1_r_ready;
      end
      if(when_Axi4LiteCrossbar_l342_6) begin
        io_slaves_1_r_ready = io_masters_2_r_ready;
      end
      if(when_Axi4LiteCrossbar_l342_7) begin
        io_slaves_1_r_ready = io_masters_3_r_ready;
      end
    end
  end

  always @(*) begin
    io_slaves_2_aw_valid = 1'b0;
    if(when_Axi4LiteCrossbar_l196_2) begin
      if(when_Axi4LiteCrossbar_l208_2) begin
        io_slaves_2_aw_valid = 1'b1;
      end
    end
  end

  assign _zz_io_slaves_2_aw_payload_addr = 35'h0;
  always @(*) begin
    io_slaves_2_aw_payload_addr = _zz_io_slaves_2_aw_payload_addr[31 : 0];
    if(when_Axi4LiteCrossbar_l196_2) begin
      if(when_Axi4LiteCrossbar_l208_2) begin
        if(when_Axi4LiteCrossbar_l212_8) begin
          io_slaves_2_aw_payload_addr = io_masters_0_aw_payload_addr;
        end
        if(when_Axi4LiteCrossbar_l212_9) begin
          io_slaves_2_aw_payload_addr = io_masters_1_aw_payload_addr;
        end
        if(when_Axi4LiteCrossbar_l212_10) begin
          io_slaves_2_aw_payload_addr = io_masters_2_aw_payload_addr;
        end
        if(when_Axi4LiteCrossbar_l212_11) begin
          io_slaves_2_aw_payload_addr = io_masters_3_aw_payload_addr;
        end
      end
    end
  end

  always @(*) begin
    io_slaves_2_aw_payload_prot = _zz_io_slaves_2_aw_payload_addr[34 : 32];
    if(when_Axi4LiteCrossbar_l196_2) begin
      if(when_Axi4LiteCrossbar_l208_2) begin
        if(when_Axi4LiteCrossbar_l212_8) begin
          io_slaves_2_aw_payload_prot = io_masters_0_aw_payload_prot;
        end
        if(when_Axi4LiteCrossbar_l212_9) begin
          io_slaves_2_aw_payload_prot = io_masters_1_aw_payload_prot;
        end
        if(when_Axi4LiteCrossbar_l212_10) begin
          io_slaves_2_aw_payload_prot = io_masters_2_aw_payload_prot;
        end
        if(when_Axi4LiteCrossbar_l212_11) begin
          io_slaves_2_aw_payload_prot = io_masters_3_aw_payload_prot;
        end
      end
    end
  end

  always @(*) begin
    io_slaves_2_w_valid = 1'b0;
    if(when_Axi4LiteCrossbar_l196_2) begin
      if(when_Axi4LiteCrossbar_l208_2) begin
        if(when_Axi4LiteCrossbar_l212_8) begin
          io_slaves_2_w_valid = io_masters_0_w_valid;
        end
        if(when_Axi4LiteCrossbar_l212_9) begin
          io_slaves_2_w_valid = io_masters_1_w_valid;
        end
        if(when_Axi4LiteCrossbar_l212_10) begin
          io_slaves_2_w_valid = io_masters_2_w_valid;
        end
        if(when_Axi4LiteCrossbar_l212_11) begin
          io_slaves_2_w_valid = io_masters_3_w_valid;
        end
      end
    end else begin
      if(when_Axi4LiteCrossbar_l264_8) begin
        io_slaves_2_w_valid = io_masters_0_w_valid;
      end
      if(when_Axi4LiteCrossbar_l264_9) begin
        io_slaves_2_w_valid = io_masters_1_w_valid;
      end
      if(when_Axi4LiteCrossbar_l264_10) begin
        io_slaves_2_w_valid = io_masters_2_w_valid;
      end
      if(when_Axi4LiteCrossbar_l264_11) begin
        io_slaves_2_w_valid = io_masters_3_w_valid;
      end
    end
  end

  assign _zz_io_slaves_2_w_payload_data = 36'h0;
  always @(*) begin
    io_slaves_2_w_payload_data = _zz_io_slaves_2_w_payload_data[31 : 0];
    if(when_Axi4LiteCrossbar_l196_2) begin
      if(when_Axi4LiteCrossbar_l208_2) begin
        if(when_Axi4LiteCrossbar_l212_8) begin
          io_slaves_2_w_payload_data = io_masters_0_w_payload_data;
        end
        if(when_Axi4LiteCrossbar_l212_9) begin
          io_slaves_2_w_payload_data = io_masters_1_w_payload_data;
        end
        if(when_Axi4LiteCrossbar_l212_10) begin
          io_slaves_2_w_payload_data = io_masters_2_w_payload_data;
        end
        if(when_Axi4LiteCrossbar_l212_11) begin
          io_slaves_2_w_payload_data = io_masters_3_w_payload_data;
        end
      end
    end else begin
      if(when_Axi4LiteCrossbar_l264_8) begin
        io_slaves_2_w_payload_data = io_masters_0_w_payload_data;
      end
      if(when_Axi4LiteCrossbar_l264_9) begin
        io_slaves_2_w_payload_data = io_masters_1_w_payload_data;
      end
      if(when_Axi4LiteCrossbar_l264_10) begin
        io_slaves_2_w_payload_data = io_masters_2_w_payload_data;
      end
      if(when_Axi4LiteCrossbar_l264_11) begin
        io_slaves_2_w_payload_data = io_masters_3_w_payload_data;
      end
    end
  end

  always @(*) begin
    io_slaves_2_w_payload_strb = _zz_io_slaves_2_w_payload_data[35 : 32];
    if(when_Axi4LiteCrossbar_l196_2) begin
      if(when_Axi4LiteCrossbar_l208_2) begin
        if(when_Axi4LiteCrossbar_l212_8) begin
          io_slaves_2_w_payload_strb = io_masters_0_w_payload_strb;
        end
        if(when_Axi4LiteCrossbar_l212_9) begin
          io_slaves_2_w_payload_strb = io_masters_1_w_payload_strb;
        end
        if(when_Axi4LiteCrossbar_l212_10) begin
          io_slaves_2_w_payload_strb = io_masters_2_w_payload_strb;
        end
        if(when_Axi4LiteCrossbar_l212_11) begin
          io_slaves_2_w_payload_strb = io_masters_3_w_payload_strb;
        end
      end
    end else begin
      if(when_Axi4LiteCrossbar_l264_8) begin
        io_slaves_2_w_payload_strb = io_masters_0_w_payload_strb;
      end
      if(when_Axi4LiteCrossbar_l264_9) begin
        io_slaves_2_w_payload_strb = io_masters_1_w_payload_strb;
      end
      if(when_Axi4LiteCrossbar_l264_10) begin
        io_slaves_2_w_payload_strb = io_masters_2_w_payload_strb;
      end
      if(when_Axi4LiteCrossbar_l264_11) begin
        io_slaves_2_w_payload_strb = io_masters_3_w_payload_strb;
      end
    end
  end

  always @(*) begin
    io_slaves_2_b_ready = 1'b0;
    if(!when_Axi4LiteCrossbar_l196_2) begin
      if(when_Axi4LiteCrossbar_l264_8) begin
        io_slaves_2_b_ready = io_masters_0_b_ready;
      end
      if(when_Axi4LiteCrossbar_l264_9) begin
        io_slaves_2_b_ready = io_masters_1_b_ready;
      end
      if(when_Axi4LiteCrossbar_l264_10) begin
        io_slaves_2_b_ready = io_masters_2_b_ready;
      end
      if(when_Axi4LiteCrossbar_l264_11) begin
        io_slaves_2_b_ready = io_masters_3_b_ready;
      end
    end
  end

  always @(*) begin
    io_slaves_2_ar_valid = 1'b0;
    if(when_Axi4LiteCrossbar_l285_2) begin
      if(when_Axi4LiteCrossbar_l296_2) begin
        io_slaves_2_ar_valid = 1'b1;
      end
    end
  end

  assign _zz_io_slaves_2_ar_payload_addr = 35'h0;
  always @(*) begin
    io_slaves_2_ar_payload_addr = _zz_io_slaves_2_ar_payload_addr[31 : 0];
    if(when_Axi4LiteCrossbar_l285_2) begin
      if(when_Axi4LiteCrossbar_l296_2) begin
        if(when_Axi4LiteCrossbar_l299_8) begin
          io_slaves_2_ar_payload_addr = io_masters_0_ar_payload_addr;
        end
        if(when_Axi4LiteCrossbar_l299_9) begin
          io_slaves_2_ar_payload_addr = io_masters_1_ar_payload_addr;
        end
        if(when_Axi4LiteCrossbar_l299_10) begin
          io_slaves_2_ar_payload_addr = io_masters_2_ar_payload_addr;
        end
        if(when_Axi4LiteCrossbar_l299_11) begin
          io_slaves_2_ar_payload_addr = io_masters_3_ar_payload_addr;
        end
      end
    end
  end

  always @(*) begin
    io_slaves_2_ar_payload_prot = _zz_io_slaves_2_ar_payload_addr[34 : 32];
    if(when_Axi4LiteCrossbar_l285_2) begin
      if(when_Axi4LiteCrossbar_l296_2) begin
        if(when_Axi4LiteCrossbar_l299_8) begin
          io_slaves_2_ar_payload_prot = io_masters_0_ar_payload_prot;
        end
        if(when_Axi4LiteCrossbar_l299_9) begin
          io_slaves_2_ar_payload_prot = io_masters_1_ar_payload_prot;
        end
        if(when_Axi4LiteCrossbar_l299_10) begin
          io_slaves_2_ar_payload_prot = io_masters_2_ar_payload_prot;
        end
        if(when_Axi4LiteCrossbar_l299_11) begin
          io_slaves_2_ar_payload_prot = io_masters_3_ar_payload_prot;
        end
      end
    end
  end

  always @(*) begin
    io_slaves_2_r_ready = 1'b0;
    if(!when_Axi4LiteCrossbar_l285_2) begin
      if(when_Axi4LiteCrossbar_l342_8) begin
        io_slaves_2_r_ready = io_masters_0_r_ready;
      end
      if(when_Axi4LiteCrossbar_l342_9) begin
        io_slaves_2_r_ready = io_masters_1_r_ready;
      end
      if(when_Axi4LiteCrossbar_l342_10) begin
        io_slaves_2_r_ready = io_masters_2_r_ready;
      end
      if(when_Axi4LiteCrossbar_l342_11) begin
        io_slaves_2_r_ready = io_masters_3_r_ready;
      end
    end
  end

  always @(*) begin
    io_slaves_3_aw_valid = 1'b0;
    if(when_Axi4LiteCrossbar_l196_3) begin
      if(when_Axi4LiteCrossbar_l208_3) begin
        io_slaves_3_aw_valid = 1'b1;
      end
    end
  end

  assign _zz_io_slaves_3_aw_payload_addr = 35'h0;
  always @(*) begin
    io_slaves_3_aw_payload_addr = _zz_io_slaves_3_aw_payload_addr[31 : 0];
    if(when_Axi4LiteCrossbar_l196_3) begin
      if(when_Axi4LiteCrossbar_l208_3) begin
        if(when_Axi4LiteCrossbar_l212_12) begin
          io_slaves_3_aw_payload_addr = io_masters_0_aw_payload_addr;
        end
        if(when_Axi4LiteCrossbar_l212_13) begin
          io_slaves_3_aw_payload_addr = io_masters_1_aw_payload_addr;
        end
        if(when_Axi4LiteCrossbar_l212_14) begin
          io_slaves_3_aw_payload_addr = io_masters_2_aw_payload_addr;
        end
        if(when_Axi4LiteCrossbar_l212_15) begin
          io_slaves_3_aw_payload_addr = io_masters_3_aw_payload_addr;
        end
      end
    end
  end

  always @(*) begin
    io_slaves_3_aw_payload_prot = _zz_io_slaves_3_aw_payload_addr[34 : 32];
    if(when_Axi4LiteCrossbar_l196_3) begin
      if(when_Axi4LiteCrossbar_l208_3) begin
        if(when_Axi4LiteCrossbar_l212_12) begin
          io_slaves_3_aw_payload_prot = io_masters_0_aw_payload_prot;
        end
        if(when_Axi4LiteCrossbar_l212_13) begin
          io_slaves_3_aw_payload_prot = io_masters_1_aw_payload_prot;
        end
        if(when_Axi4LiteCrossbar_l212_14) begin
          io_slaves_3_aw_payload_prot = io_masters_2_aw_payload_prot;
        end
        if(when_Axi4LiteCrossbar_l212_15) begin
          io_slaves_3_aw_payload_prot = io_masters_3_aw_payload_prot;
        end
      end
    end
  end

  always @(*) begin
    io_slaves_3_w_valid = 1'b0;
    if(when_Axi4LiteCrossbar_l196_3) begin
      if(when_Axi4LiteCrossbar_l208_3) begin
        if(when_Axi4LiteCrossbar_l212_12) begin
          io_slaves_3_w_valid = io_masters_0_w_valid;
        end
        if(when_Axi4LiteCrossbar_l212_13) begin
          io_slaves_3_w_valid = io_masters_1_w_valid;
        end
        if(when_Axi4LiteCrossbar_l212_14) begin
          io_slaves_3_w_valid = io_masters_2_w_valid;
        end
        if(when_Axi4LiteCrossbar_l212_15) begin
          io_slaves_3_w_valid = io_masters_3_w_valid;
        end
      end
    end else begin
      if(when_Axi4LiteCrossbar_l264_12) begin
        io_slaves_3_w_valid = io_masters_0_w_valid;
      end
      if(when_Axi4LiteCrossbar_l264_13) begin
        io_slaves_3_w_valid = io_masters_1_w_valid;
      end
      if(when_Axi4LiteCrossbar_l264_14) begin
        io_slaves_3_w_valid = io_masters_2_w_valid;
      end
      if(when_Axi4LiteCrossbar_l264_15) begin
        io_slaves_3_w_valid = io_masters_3_w_valid;
      end
    end
  end

  assign _zz_io_slaves_3_w_payload_data = 36'h0;
  always @(*) begin
    io_slaves_3_w_payload_data = _zz_io_slaves_3_w_payload_data[31 : 0];
    if(when_Axi4LiteCrossbar_l196_3) begin
      if(when_Axi4LiteCrossbar_l208_3) begin
        if(when_Axi4LiteCrossbar_l212_12) begin
          io_slaves_3_w_payload_data = io_masters_0_w_payload_data;
        end
        if(when_Axi4LiteCrossbar_l212_13) begin
          io_slaves_3_w_payload_data = io_masters_1_w_payload_data;
        end
        if(when_Axi4LiteCrossbar_l212_14) begin
          io_slaves_3_w_payload_data = io_masters_2_w_payload_data;
        end
        if(when_Axi4LiteCrossbar_l212_15) begin
          io_slaves_3_w_payload_data = io_masters_3_w_payload_data;
        end
      end
    end else begin
      if(when_Axi4LiteCrossbar_l264_12) begin
        io_slaves_3_w_payload_data = io_masters_0_w_payload_data;
      end
      if(when_Axi4LiteCrossbar_l264_13) begin
        io_slaves_3_w_payload_data = io_masters_1_w_payload_data;
      end
      if(when_Axi4LiteCrossbar_l264_14) begin
        io_slaves_3_w_payload_data = io_masters_2_w_payload_data;
      end
      if(when_Axi4LiteCrossbar_l264_15) begin
        io_slaves_3_w_payload_data = io_masters_3_w_payload_data;
      end
    end
  end

  always @(*) begin
    io_slaves_3_w_payload_strb = _zz_io_slaves_3_w_payload_data[35 : 32];
    if(when_Axi4LiteCrossbar_l196_3) begin
      if(when_Axi4LiteCrossbar_l208_3) begin
        if(when_Axi4LiteCrossbar_l212_12) begin
          io_slaves_3_w_payload_strb = io_masters_0_w_payload_strb;
        end
        if(when_Axi4LiteCrossbar_l212_13) begin
          io_slaves_3_w_payload_strb = io_masters_1_w_payload_strb;
        end
        if(when_Axi4LiteCrossbar_l212_14) begin
          io_slaves_3_w_payload_strb = io_masters_2_w_payload_strb;
        end
        if(when_Axi4LiteCrossbar_l212_15) begin
          io_slaves_3_w_payload_strb = io_masters_3_w_payload_strb;
        end
      end
    end else begin
      if(when_Axi4LiteCrossbar_l264_12) begin
        io_slaves_3_w_payload_strb = io_masters_0_w_payload_strb;
      end
      if(when_Axi4LiteCrossbar_l264_13) begin
        io_slaves_3_w_payload_strb = io_masters_1_w_payload_strb;
      end
      if(when_Axi4LiteCrossbar_l264_14) begin
        io_slaves_3_w_payload_strb = io_masters_2_w_payload_strb;
      end
      if(when_Axi4LiteCrossbar_l264_15) begin
        io_slaves_3_w_payload_strb = io_masters_3_w_payload_strb;
      end
    end
  end

  always @(*) begin
    io_slaves_3_b_ready = 1'b0;
    if(!when_Axi4LiteCrossbar_l196_3) begin
      if(when_Axi4LiteCrossbar_l264_12) begin
        io_slaves_3_b_ready = io_masters_0_b_ready;
      end
      if(when_Axi4LiteCrossbar_l264_13) begin
        io_slaves_3_b_ready = io_masters_1_b_ready;
      end
      if(when_Axi4LiteCrossbar_l264_14) begin
        io_slaves_3_b_ready = io_masters_2_b_ready;
      end
      if(when_Axi4LiteCrossbar_l264_15) begin
        io_slaves_3_b_ready = io_masters_3_b_ready;
      end
    end
  end

  always @(*) begin
    io_slaves_3_ar_valid = 1'b0;
    if(when_Axi4LiteCrossbar_l285_3) begin
      if(when_Axi4LiteCrossbar_l296_3) begin
        io_slaves_3_ar_valid = 1'b1;
      end
    end
  end

  assign _zz_io_slaves_3_ar_payload_addr = 35'h0;
  always @(*) begin
    io_slaves_3_ar_payload_addr = _zz_io_slaves_3_ar_payload_addr[31 : 0];
    if(when_Axi4LiteCrossbar_l285_3) begin
      if(when_Axi4LiteCrossbar_l296_3) begin
        if(when_Axi4LiteCrossbar_l299_12) begin
          io_slaves_3_ar_payload_addr = io_masters_0_ar_payload_addr;
        end
        if(when_Axi4LiteCrossbar_l299_13) begin
          io_slaves_3_ar_payload_addr = io_masters_1_ar_payload_addr;
        end
        if(when_Axi4LiteCrossbar_l299_14) begin
          io_slaves_3_ar_payload_addr = io_masters_2_ar_payload_addr;
        end
        if(when_Axi4LiteCrossbar_l299_15) begin
          io_slaves_3_ar_payload_addr = io_masters_3_ar_payload_addr;
        end
      end
    end
  end

  always @(*) begin
    io_slaves_3_ar_payload_prot = _zz_io_slaves_3_ar_payload_addr[34 : 32];
    if(when_Axi4LiteCrossbar_l285_3) begin
      if(when_Axi4LiteCrossbar_l296_3) begin
        if(when_Axi4LiteCrossbar_l299_12) begin
          io_slaves_3_ar_payload_prot = io_masters_0_ar_payload_prot;
        end
        if(when_Axi4LiteCrossbar_l299_13) begin
          io_slaves_3_ar_payload_prot = io_masters_1_ar_payload_prot;
        end
        if(when_Axi4LiteCrossbar_l299_14) begin
          io_slaves_3_ar_payload_prot = io_masters_2_ar_payload_prot;
        end
        if(when_Axi4LiteCrossbar_l299_15) begin
          io_slaves_3_ar_payload_prot = io_masters_3_ar_payload_prot;
        end
      end
    end
  end

  always @(*) begin
    io_slaves_3_r_ready = 1'b0;
    if(!when_Axi4LiteCrossbar_l285_3) begin
      if(when_Axi4LiteCrossbar_l342_12) begin
        io_slaves_3_r_ready = io_masters_0_r_ready;
      end
      if(when_Axi4LiteCrossbar_l342_13) begin
        io_slaves_3_r_ready = io_masters_1_r_ready;
      end
      if(when_Axi4LiteCrossbar_l342_14) begin
        io_slaves_3_r_ready = io_masters_2_r_ready;
      end
      if(when_Axi4LiteCrossbar_l342_15) begin
        io_slaves_3_r_ready = io_masters_3_r_ready;
      end
    end
  end

  assign when_Axi4LiteCrossbar_l196 = (! wrActive_0);
  always @(*) begin
    _zz_when_Axi4LiteCrossbar_l208_1[0] = ((32'h0 <= io_masters_0_aw_payload_addr) && (io_masters_0_aw_payload_addr < 32'h00010000));
    _zz_when_Axi4LiteCrossbar_l208_1[1] = ((32'h00010000 <= io_masters_0_aw_payload_addr) && (io_masters_0_aw_payload_addr < 32'h00020000));
    _zz_when_Axi4LiteCrossbar_l208_1[2] = ((32'h00020000 <= io_masters_0_aw_payload_addr) && (io_masters_0_aw_payload_addr < 32'h00030000));
    _zz_when_Axi4LiteCrossbar_l208_1[3] = ((32'h00030000 <= io_masters_0_aw_payload_addr) && (io_masters_0_aw_payload_addr < 32'h00040000));
  end

  always @(*) begin
    _zz_when_Axi4LiteCrossbar_l208[0] = (io_masters_0_aw_valid && _zz_when_Axi4LiteCrossbar_l208_1[0]);
    _zz_when_Axi4LiteCrossbar_l208[1] = (io_masters_1_aw_valid && _zz_when_Axi4LiteCrossbar_l208_2[0]);
    _zz_when_Axi4LiteCrossbar_l208[2] = (io_masters_2_aw_valid && _zz_when_Axi4LiteCrossbar_l208_3[0]);
    _zz_when_Axi4LiteCrossbar_l208[3] = (io_masters_3_aw_valid && _zz_when_Axi4LiteCrossbar_l208_4[0]);
  end

  always @(*) begin
    _zz_when_Axi4LiteCrossbar_l208_2[0] = ((32'h0 <= io_masters_1_aw_payload_addr) && (io_masters_1_aw_payload_addr < 32'h00010000));
    _zz_when_Axi4LiteCrossbar_l208_2[1] = ((32'h00010000 <= io_masters_1_aw_payload_addr) && (io_masters_1_aw_payload_addr < 32'h00020000));
    _zz_when_Axi4LiteCrossbar_l208_2[2] = ((32'h00020000 <= io_masters_1_aw_payload_addr) && (io_masters_1_aw_payload_addr < 32'h00030000));
    _zz_when_Axi4LiteCrossbar_l208_2[3] = ((32'h00030000 <= io_masters_1_aw_payload_addr) && (io_masters_1_aw_payload_addr < 32'h00040000));
  end

  always @(*) begin
    _zz_when_Axi4LiteCrossbar_l208_3[0] = ((32'h0 <= io_masters_2_aw_payload_addr) && (io_masters_2_aw_payload_addr < 32'h00010000));
    _zz_when_Axi4LiteCrossbar_l208_3[1] = ((32'h00010000 <= io_masters_2_aw_payload_addr) && (io_masters_2_aw_payload_addr < 32'h00020000));
    _zz_when_Axi4LiteCrossbar_l208_3[2] = ((32'h00020000 <= io_masters_2_aw_payload_addr) && (io_masters_2_aw_payload_addr < 32'h00030000));
    _zz_when_Axi4LiteCrossbar_l208_3[3] = ((32'h00030000 <= io_masters_2_aw_payload_addr) && (io_masters_2_aw_payload_addr < 32'h00040000));
  end

  always @(*) begin
    _zz_when_Axi4LiteCrossbar_l208_4[0] = ((32'h0 <= io_masters_3_aw_payload_addr) && (io_masters_3_aw_payload_addr < 32'h00010000));
    _zz_when_Axi4LiteCrossbar_l208_4[1] = ((32'h00010000 <= io_masters_3_aw_payload_addr) && (io_masters_3_aw_payload_addr < 32'h00020000));
    _zz_when_Axi4LiteCrossbar_l208_4[2] = ((32'h00020000 <= io_masters_3_aw_payload_addr) && (io_masters_3_aw_payload_addr < 32'h00030000));
    _zz_when_Axi4LiteCrossbar_l208_4[3] = ((32'h00030000 <= io_masters_3_aw_payload_addr) && (io_masters_3_aw_payload_addr < 32'h00040000));
  end

  assign _zz_when_Axi4LiteCrossbar_l131 = _zz_when_Axi4LiteCrossbar_l208;
  assign _zz_when_Axi4LiteCrossbar_l131_1 = (_zz_when_Axi4LiteCrossbar_l131 & (~ _zz__zz_when_Axi4LiteCrossbar_l131_1));
  always @(*) begin
    _zz_wrGranted_0 = 2'b00;
    if(when_Axi4LiteCrossbar_l131) begin
      _zz_wrGranted_0 = 2'b00;
    end
    if(when_Axi4LiteCrossbar_l131_1) begin
      _zz_wrGranted_0 = 2'b01;
    end
    if(when_Axi4LiteCrossbar_l131_2) begin
      _zz_wrGranted_0 = 2'b10;
    end
    if(when_Axi4LiteCrossbar_l131_3) begin
      _zz_wrGranted_0 = 2'b11;
    end
  end

  assign when_Axi4LiteCrossbar_l131 = _zz_when_Axi4LiteCrossbar_l131_1[0];
  assign when_Axi4LiteCrossbar_l131_1 = _zz_when_Axi4LiteCrossbar_l131_1[1];
  assign when_Axi4LiteCrossbar_l131_2 = _zz_when_Axi4LiteCrossbar_l131_1[2];
  assign when_Axi4LiteCrossbar_l131_3 = _zz_when_Axi4LiteCrossbar_l131_1[3];
  assign when_Axi4LiteCrossbar_l208 = (|_zz_when_Axi4LiteCrossbar_l208);
  assign when_Axi4LiteCrossbar_l212 = (_zz_wrGranted_0 == 2'b00);
  assign when_Axi4LiteCrossbar_l212_1 = (_zz_wrGranted_0 == 2'b01);
  assign when_Axi4LiteCrossbar_l212_2 = (_zz_wrGranted_0 == 2'b10);
  assign when_Axi4LiteCrossbar_l212_3 = (_zz_wrGranted_0 == 2'b11);
  assign io_slaves_0_aw_fire = (io_slaves_0_aw_valid && io_slaves_0_aw_ready);
  assign when_Axi4LiteCrossbar_l264 = (wrGranted_0 == 2'b00);
  assign when_Axi4LiteCrossbar_l264_1 = (wrGranted_0 == 2'b01);
  assign when_Axi4LiteCrossbar_l264_2 = (wrGranted_0 == 2'b10);
  assign when_Axi4LiteCrossbar_l264_3 = (wrGranted_0 == 2'b11);
  assign io_slaves_0_b_fire = (io_slaves_0_b_valid && io_slaves_0_b_ready);
  assign when_Axi4LiteCrossbar_l196_1 = (! wrActive_1);
  always @(*) begin
    _zz_when_Axi4LiteCrossbar_l208_6[0] = ((32'h0 <= io_masters_0_aw_payload_addr) && (io_masters_0_aw_payload_addr < 32'h00010000));
    _zz_when_Axi4LiteCrossbar_l208_6[1] = ((32'h00010000 <= io_masters_0_aw_payload_addr) && (io_masters_0_aw_payload_addr < 32'h00020000));
    _zz_when_Axi4LiteCrossbar_l208_6[2] = ((32'h00020000 <= io_masters_0_aw_payload_addr) && (io_masters_0_aw_payload_addr < 32'h00030000));
    _zz_when_Axi4LiteCrossbar_l208_6[3] = ((32'h00030000 <= io_masters_0_aw_payload_addr) && (io_masters_0_aw_payload_addr < 32'h00040000));
  end

  always @(*) begin
    _zz_when_Axi4LiteCrossbar_l208_5[0] = (io_masters_0_aw_valid && _zz_when_Axi4LiteCrossbar_l208_6[1]);
    _zz_when_Axi4LiteCrossbar_l208_5[1] = (io_masters_1_aw_valid && _zz_when_Axi4LiteCrossbar_l208_7[1]);
    _zz_when_Axi4LiteCrossbar_l208_5[2] = (io_masters_2_aw_valid && _zz_when_Axi4LiteCrossbar_l208_8[1]);
    _zz_when_Axi4LiteCrossbar_l208_5[3] = (io_masters_3_aw_valid && _zz_when_Axi4LiteCrossbar_l208_9[1]);
  end

  always @(*) begin
    _zz_when_Axi4LiteCrossbar_l208_7[0] = ((32'h0 <= io_masters_1_aw_payload_addr) && (io_masters_1_aw_payload_addr < 32'h00010000));
    _zz_when_Axi4LiteCrossbar_l208_7[1] = ((32'h00010000 <= io_masters_1_aw_payload_addr) && (io_masters_1_aw_payload_addr < 32'h00020000));
    _zz_when_Axi4LiteCrossbar_l208_7[2] = ((32'h00020000 <= io_masters_1_aw_payload_addr) && (io_masters_1_aw_payload_addr < 32'h00030000));
    _zz_when_Axi4LiteCrossbar_l208_7[3] = ((32'h00030000 <= io_masters_1_aw_payload_addr) && (io_masters_1_aw_payload_addr < 32'h00040000));
  end

  always @(*) begin
    _zz_when_Axi4LiteCrossbar_l208_8[0] = ((32'h0 <= io_masters_2_aw_payload_addr) && (io_masters_2_aw_payload_addr < 32'h00010000));
    _zz_when_Axi4LiteCrossbar_l208_8[1] = ((32'h00010000 <= io_masters_2_aw_payload_addr) && (io_masters_2_aw_payload_addr < 32'h00020000));
    _zz_when_Axi4LiteCrossbar_l208_8[2] = ((32'h00020000 <= io_masters_2_aw_payload_addr) && (io_masters_2_aw_payload_addr < 32'h00030000));
    _zz_when_Axi4LiteCrossbar_l208_8[3] = ((32'h00030000 <= io_masters_2_aw_payload_addr) && (io_masters_2_aw_payload_addr < 32'h00040000));
  end

  always @(*) begin
    _zz_when_Axi4LiteCrossbar_l208_9[0] = ((32'h0 <= io_masters_3_aw_payload_addr) && (io_masters_3_aw_payload_addr < 32'h00010000));
    _zz_when_Axi4LiteCrossbar_l208_9[1] = ((32'h00010000 <= io_masters_3_aw_payload_addr) && (io_masters_3_aw_payload_addr < 32'h00020000));
    _zz_when_Axi4LiteCrossbar_l208_9[2] = ((32'h00020000 <= io_masters_3_aw_payload_addr) && (io_masters_3_aw_payload_addr < 32'h00030000));
    _zz_when_Axi4LiteCrossbar_l208_9[3] = ((32'h00030000 <= io_masters_3_aw_payload_addr) && (io_masters_3_aw_payload_addr < 32'h00040000));
  end

  assign _zz_when_Axi4LiteCrossbar_l131_2 = _zz_when_Axi4LiteCrossbar_l208_5;
  assign _zz_when_Axi4LiteCrossbar_l131_3 = (_zz_when_Axi4LiteCrossbar_l131_2 & (~ _zz__zz_when_Axi4LiteCrossbar_l131_3));
  always @(*) begin
    _zz_wrGranted_1 = 2'b00;
    if(when_Axi4LiteCrossbar_l131_4) begin
      _zz_wrGranted_1 = 2'b00;
    end
    if(when_Axi4LiteCrossbar_l131_5) begin
      _zz_wrGranted_1 = 2'b01;
    end
    if(when_Axi4LiteCrossbar_l131_6) begin
      _zz_wrGranted_1 = 2'b10;
    end
    if(when_Axi4LiteCrossbar_l131_7) begin
      _zz_wrGranted_1 = 2'b11;
    end
  end

  assign when_Axi4LiteCrossbar_l131_4 = _zz_when_Axi4LiteCrossbar_l131_3[0];
  assign when_Axi4LiteCrossbar_l131_5 = _zz_when_Axi4LiteCrossbar_l131_3[1];
  assign when_Axi4LiteCrossbar_l131_6 = _zz_when_Axi4LiteCrossbar_l131_3[2];
  assign when_Axi4LiteCrossbar_l131_7 = _zz_when_Axi4LiteCrossbar_l131_3[3];
  assign when_Axi4LiteCrossbar_l208_1 = (|_zz_when_Axi4LiteCrossbar_l208_5);
  assign when_Axi4LiteCrossbar_l212_4 = (_zz_wrGranted_1 == 2'b00);
  assign when_Axi4LiteCrossbar_l212_5 = (_zz_wrGranted_1 == 2'b01);
  assign when_Axi4LiteCrossbar_l212_6 = (_zz_wrGranted_1 == 2'b10);
  assign when_Axi4LiteCrossbar_l212_7 = (_zz_wrGranted_1 == 2'b11);
  assign io_slaves_1_aw_fire = (io_slaves_1_aw_valid && io_slaves_1_aw_ready);
  assign when_Axi4LiteCrossbar_l264_4 = (wrGranted_1 == 2'b00);
  assign when_Axi4LiteCrossbar_l264_5 = (wrGranted_1 == 2'b01);
  assign when_Axi4LiteCrossbar_l264_6 = (wrGranted_1 == 2'b10);
  assign when_Axi4LiteCrossbar_l264_7 = (wrGranted_1 == 2'b11);
  assign io_slaves_1_b_fire = (io_slaves_1_b_valid && io_slaves_1_b_ready);
  assign when_Axi4LiteCrossbar_l196_2 = (! wrActive_2);
  always @(*) begin
    _zz_when_Axi4LiteCrossbar_l208_11[0] = ((32'h0 <= io_masters_0_aw_payload_addr) && (io_masters_0_aw_payload_addr < 32'h00010000));
    _zz_when_Axi4LiteCrossbar_l208_11[1] = ((32'h00010000 <= io_masters_0_aw_payload_addr) && (io_masters_0_aw_payload_addr < 32'h00020000));
    _zz_when_Axi4LiteCrossbar_l208_11[2] = ((32'h00020000 <= io_masters_0_aw_payload_addr) && (io_masters_0_aw_payload_addr < 32'h00030000));
    _zz_when_Axi4LiteCrossbar_l208_11[3] = ((32'h00030000 <= io_masters_0_aw_payload_addr) && (io_masters_0_aw_payload_addr < 32'h00040000));
  end

  always @(*) begin
    _zz_when_Axi4LiteCrossbar_l208_10[0] = (io_masters_0_aw_valid && _zz_when_Axi4LiteCrossbar_l208_11[2]);
    _zz_when_Axi4LiteCrossbar_l208_10[1] = (io_masters_1_aw_valid && _zz_when_Axi4LiteCrossbar_l208_12[2]);
    _zz_when_Axi4LiteCrossbar_l208_10[2] = (io_masters_2_aw_valid && _zz_when_Axi4LiteCrossbar_l208_13[2]);
    _zz_when_Axi4LiteCrossbar_l208_10[3] = (io_masters_3_aw_valid && _zz_when_Axi4LiteCrossbar_l208_14[2]);
  end

  always @(*) begin
    _zz_when_Axi4LiteCrossbar_l208_12[0] = ((32'h0 <= io_masters_1_aw_payload_addr) && (io_masters_1_aw_payload_addr < 32'h00010000));
    _zz_when_Axi4LiteCrossbar_l208_12[1] = ((32'h00010000 <= io_masters_1_aw_payload_addr) && (io_masters_1_aw_payload_addr < 32'h00020000));
    _zz_when_Axi4LiteCrossbar_l208_12[2] = ((32'h00020000 <= io_masters_1_aw_payload_addr) && (io_masters_1_aw_payload_addr < 32'h00030000));
    _zz_when_Axi4LiteCrossbar_l208_12[3] = ((32'h00030000 <= io_masters_1_aw_payload_addr) && (io_masters_1_aw_payload_addr < 32'h00040000));
  end

  always @(*) begin
    _zz_when_Axi4LiteCrossbar_l208_13[0] = ((32'h0 <= io_masters_2_aw_payload_addr) && (io_masters_2_aw_payload_addr < 32'h00010000));
    _zz_when_Axi4LiteCrossbar_l208_13[1] = ((32'h00010000 <= io_masters_2_aw_payload_addr) && (io_masters_2_aw_payload_addr < 32'h00020000));
    _zz_when_Axi4LiteCrossbar_l208_13[2] = ((32'h00020000 <= io_masters_2_aw_payload_addr) && (io_masters_2_aw_payload_addr < 32'h00030000));
    _zz_when_Axi4LiteCrossbar_l208_13[3] = ((32'h00030000 <= io_masters_2_aw_payload_addr) && (io_masters_2_aw_payload_addr < 32'h00040000));
  end

  always @(*) begin
    _zz_when_Axi4LiteCrossbar_l208_14[0] = ((32'h0 <= io_masters_3_aw_payload_addr) && (io_masters_3_aw_payload_addr < 32'h00010000));
    _zz_when_Axi4LiteCrossbar_l208_14[1] = ((32'h00010000 <= io_masters_3_aw_payload_addr) && (io_masters_3_aw_payload_addr < 32'h00020000));
    _zz_when_Axi4LiteCrossbar_l208_14[2] = ((32'h00020000 <= io_masters_3_aw_payload_addr) && (io_masters_3_aw_payload_addr < 32'h00030000));
    _zz_when_Axi4LiteCrossbar_l208_14[3] = ((32'h00030000 <= io_masters_3_aw_payload_addr) && (io_masters_3_aw_payload_addr < 32'h00040000));
  end

  assign _zz_when_Axi4LiteCrossbar_l131_4 = _zz_when_Axi4LiteCrossbar_l208_10;
  assign _zz_when_Axi4LiteCrossbar_l131_5 = (_zz_when_Axi4LiteCrossbar_l131_4 & (~ _zz__zz_when_Axi4LiteCrossbar_l131_5));
  always @(*) begin
    _zz_wrGranted_2 = 2'b00;
    if(when_Axi4LiteCrossbar_l131_8) begin
      _zz_wrGranted_2 = 2'b00;
    end
    if(when_Axi4LiteCrossbar_l131_9) begin
      _zz_wrGranted_2 = 2'b01;
    end
    if(when_Axi4LiteCrossbar_l131_10) begin
      _zz_wrGranted_2 = 2'b10;
    end
    if(when_Axi4LiteCrossbar_l131_11) begin
      _zz_wrGranted_2 = 2'b11;
    end
  end

  assign when_Axi4LiteCrossbar_l131_8 = _zz_when_Axi4LiteCrossbar_l131_5[0];
  assign when_Axi4LiteCrossbar_l131_9 = _zz_when_Axi4LiteCrossbar_l131_5[1];
  assign when_Axi4LiteCrossbar_l131_10 = _zz_when_Axi4LiteCrossbar_l131_5[2];
  assign when_Axi4LiteCrossbar_l131_11 = _zz_when_Axi4LiteCrossbar_l131_5[3];
  assign when_Axi4LiteCrossbar_l208_2 = (|_zz_when_Axi4LiteCrossbar_l208_10);
  assign when_Axi4LiteCrossbar_l212_8 = (_zz_wrGranted_2 == 2'b00);
  assign when_Axi4LiteCrossbar_l212_9 = (_zz_wrGranted_2 == 2'b01);
  assign when_Axi4LiteCrossbar_l212_10 = (_zz_wrGranted_2 == 2'b10);
  assign when_Axi4LiteCrossbar_l212_11 = (_zz_wrGranted_2 == 2'b11);
  assign io_slaves_2_aw_fire = (io_slaves_2_aw_valid && io_slaves_2_aw_ready);
  assign when_Axi4LiteCrossbar_l264_8 = (wrGranted_2 == 2'b00);
  assign when_Axi4LiteCrossbar_l264_9 = (wrGranted_2 == 2'b01);
  assign when_Axi4LiteCrossbar_l264_10 = (wrGranted_2 == 2'b10);
  assign when_Axi4LiteCrossbar_l264_11 = (wrGranted_2 == 2'b11);
  assign io_slaves_2_b_fire = (io_slaves_2_b_valid && io_slaves_2_b_ready);
  assign when_Axi4LiteCrossbar_l196_3 = (! wrActive_3);
  always @(*) begin
    _zz_when_Axi4LiteCrossbar_l208_16[0] = ((32'h0 <= io_masters_0_aw_payload_addr) && (io_masters_0_aw_payload_addr < 32'h00010000));
    _zz_when_Axi4LiteCrossbar_l208_16[1] = ((32'h00010000 <= io_masters_0_aw_payload_addr) && (io_masters_0_aw_payload_addr < 32'h00020000));
    _zz_when_Axi4LiteCrossbar_l208_16[2] = ((32'h00020000 <= io_masters_0_aw_payload_addr) && (io_masters_0_aw_payload_addr < 32'h00030000));
    _zz_when_Axi4LiteCrossbar_l208_16[3] = ((32'h00030000 <= io_masters_0_aw_payload_addr) && (io_masters_0_aw_payload_addr < 32'h00040000));
  end

  always @(*) begin
    _zz_when_Axi4LiteCrossbar_l208_15[0] = (io_masters_0_aw_valid && _zz_when_Axi4LiteCrossbar_l208_16[3]);
    _zz_when_Axi4LiteCrossbar_l208_15[1] = (io_masters_1_aw_valid && _zz_when_Axi4LiteCrossbar_l208_17[3]);
    _zz_when_Axi4LiteCrossbar_l208_15[2] = (io_masters_2_aw_valid && _zz_when_Axi4LiteCrossbar_l208_18[3]);
    _zz_when_Axi4LiteCrossbar_l208_15[3] = (io_masters_3_aw_valid && _zz_when_Axi4LiteCrossbar_l208_19[3]);
  end

  always @(*) begin
    _zz_when_Axi4LiteCrossbar_l208_17[0] = ((32'h0 <= io_masters_1_aw_payload_addr) && (io_masters_1_aw_payload_addr < 32'h00010000));
    _zz_when_Axi4LiteCrossbar_l208_17[1] = ((32'h00010000 <= io_masters_1_aw_payload_addr) && (io_masters_1_aw_payload_addr < 32'h00020000));
    _zz_when_Axi4LiteCrossbar_l208_17[2] = ((32'h00020000 <= io_masters_1_aw_payload_addr) && (io_masters_1_aw_payload_addr < 32'h00030000));
    _zz_when_Axi4LiteCrossbar_l208_17[3] = ((32'h00030000 <= io_masters_1_aw_payload_addr) && (io_masters_1_aw_payload_addr < 32'h00040000));
  end

  always @(*) begin
    _zz_when_Axi4LiteCrossbar_l208_18[0] = ((32'h0 <= io_masters_2_aw_payload_addr) && (io_masters_2_aw_payload_addr < 32'h00010000));
    _zz_when_Axi4LiteCrossbar_l208_18[1] = ((32'h00010000 <= io_masters_2_aw_payload_addr) && (io_masters_2_aw_payload_addr < 32'h00020000));
    _zz_when_Axi4LiteCrossbar_l208_18[2] = ((32'h00020000 <= io_masters_2_aw_payload_addr) && (io_masters_2_aw_payload_addr < 32'h00030000));
    _zz_when_Axi4LiteCrossbar_l208_18[3] = ((32'h00030000 <= io_masters_2_aw_payload_addr) && (io_masters_2_aw_payload_addr < 32'h00040000));
  end

  always @(*) begin
    _zz_when_Axi4LiteCrossbar_l208_19[0] = ((32'h0 <= io_masters_3_aw_payload_addr) && (io_masters_3_aw_payload_addr < 32'h00010000));
    _zz_when_Axi4LiteCrossbar_l208_19[1] = ((32'h00010000 <= io_masters_3_aw_payload_addr) && (io_masters_3_aw_payload_addr < 32'h00020000));
    _zz_when_Axi4LiteCrossbar_l208_19[2] = ((32'h00020000 <= io_masters_3_aw_payload_addr) && (io_masters_3_aw_payload_addr < 32'h00030000));
    _zz_when_Axi4LiteCrossbar_l208_19[3] = ((32'h00030000 <= io_masters_3_aw_payload_addr) && (io_masters_3_aw_payload_addr < 32'h00040000));
  end

  assign _zz_when_Axi4LiteCrossbar_l131_6 = _zz_when_Axi4LiteCrossbar_l208_15;
  assign _zz_when_Axi4LiteCrossbar_l131_7 = (_zz_when_Axi4LiteCrossbar_l131_6 & (~ _zz__zz_when_Axi4LiteCrossbar_l131_7));
  always @(*) begin
    _zz_wrGranted_3 = 2'b00;
    if(when_Axi4LiteCrossbar_l131_12) begin
      _zz_wrGranted_3 = 2'b00;
    end
    if(when_Axi4LiteCrossbar_l131_13) begin
      _zz_wrGranted_3 = 2'b01;
    end
    if(when_Axi4LiteCrossbar_l131_14) begin
      _zz_wrGranted_3 = 2'b10;
    end
    if(when_Axi4LiteCrossbar_l131_15) begin
      _zz_wrGranted_3 = 2'b11;
    end
  end

  assign when_Axi4LiteCrossbar_l131_12 = _zz_when_Axi4LiteCrossbar_l131_7[0];
  assign when_Axi4LiteCrossbar_l131_13 = _zz_when_Axi4LiteCrossbar_l131_7[1];
  assign when_Axi4LiteCrossbar_l131_14 = _zz_when_Axi4LiteCrossbar_l131_7[2];
  assign when_Axi4LiteCrossbar_l131_15 = _zz_when_Axi4LiteCrossbar_l131_7[3];
  assign when_Axi4LiteCrossbar_l208_3 = (|_zz_when_Axi4LiteCrossbar_l208_15);
  assign when_Axi4LiteCrossbar_l212_12 = (_zz_wrGranted_3 == 2'b00);
  assign when_Axi4LiteCrossbar_l212_13 = (_zz_wrGranted_3 == 2'b01);
  assign when_Axi4LiteCrossbar_l212_14 = (_zz_wrGranted_3 == 2'b10);
  assign when_Axi4LiteCrossbar_l212_15 = (_zz_wrGranted_3 == 2'b11);
  assign io_slaves_3_aw_fire = (io_slaves_3_aw_valid && io_slaves_3_aw_ready);
  assign when_Axi4LiteCrossbar_l264_12 = (wrGranted_3 == 2'b00);
  assign when_Axi4LiteCrossbar_l264_13 = (wrGranted_3 == 2'b01);
  assign when_Axi4LiteCrossbar_l264_14 = (wrGranted_3 == 2'b10);
  assign when_Axi4LiteCrossbar_l264_15 = (wrGranted_3 == 2'b11);
  assign io_slaves_3_b_fire = (io_slaves_3_b_valid && io_slaves_3_b_ready);
  assign when_Axi4LiteCrossbar_l285 = (! rdActive_0);
  always @(*) begin
    _zz_when_Axi4LiteCrossbar_l296_1[0] = ((32'h0 <= io_masters_0_ar_payload_addr) && (io_masters_0_ar_payload_addr < 32'h00010000));
    _zz_when_Axi4LiteCrossbar_l296_1[1] = ((32'h00010000 <= io_masters_0_ar_payload_addr) && (io_masters_0_ar_payload_addr < 32'h00020000));
    _zz_when_Axi4LiteCrossbar_l296_1[2] = ((32'h00020000 <= io_masters_0_ar_payload_addr) && (io_masters_0_ar_payload_addr < 32'h00030000));
    _zz_when_Axi4LiteCrossbar_l296_1[3] = ((32'h00030000 <= io_masters_0_ar_payload_addr) && (io_masters_0_ar_payload_addr < 32'h00040000));
  end

  always @(*) begin
    _zz_when_Axi4LiteCrossbar_l296[0] = (io_masters_0_ar_valid && _zz_when_Axi4LiteCrossbar_l296_1[0]);
    _zz_when_Axi4LiteCrossbar_l296[1] = (io_masters_1_ar_valid && _zz_when_Axi4LiteCrossbar_l296_2[0]);
    _zz_when_Axi4LiteCrossbar_l296[2] = (io_masters_2_ar_valid && _zz_when_Axi4LiteCrossbar_l296_3[0]);
    _zz_when_Axi4LiteCrossbar_l296[3] = (io_masters_3_ar_valid && _zz_when_Axi4LiteCrossbar_l296_4[0]);
  end

  always @(*) begin
    _zz_when_Axi4LiteCrossbar_l296_2[0] = ((32'h0 <= io_masters_1_ar_payload_addr) && (io_masters_1_ar_payload_addr < 32'h00010000));
    _zz_when_Axi4LiteCrossbar_l296_2[1] = ((32'h00010000 <= io_masters_1_ar_payload_addr) && (io_masters_1_ar_payload_addr < 32'h00020000));
    _zz_when_Axi4LiteCrossbar_l296_2[2] = ((32'h00020000 <= io_masters_1_ar_payload_addr) && (io_masters_1_ar_payload_addr < 32'h00030000));
    _zz_when_Axi4LiteCrossbar_l296_2[3] = ((32'h00030000 <= io_masters_1_ar_payload_addr) && (io_masters_1_ar_payload_addr < 32'h00040000));
  end

  always @(*) begin
    _zz_when_Axi4LiteCrossbar_l296_3[0] = ((32'h0 <= io_masters_2_ar_payload_addr) && (io_masters_2_ar_payload_addr < 32'h00010000));
    _zz_when_Axi4LiteCrossbar_l296_3[1] = ((32'h00010000 <= io_masters_2_ar_payload_addr) && (io_masters_2_ar_payload_addr < 32'h00020000));
    _zz_when_Axi4LiteCrossbar_l296_3[2] = ((32'h00020000 <= io_masters_2_ar_payload_addr) && (io_masters_2_ar_payload_addr < 32'h00030000));
    _zz_when_Axi4LiteCrossbar_l296_3[3] = ((32'h00030000 <= io_masters_2_ar_payload_addr) && (io_masters_2_ar_payload_addr < 32'h00040000));
  end

  always @(*) begin
    _zz_when_Axi4LiteCrossbar_l296_4[0] = ((32'h0 <= io_masters_3_ar_payload_addr) && (io_masters_3_ar_payload_addr < 32'h00010000));
    _zz_when_Axi4LiteCrossbar_l296_4[1] = ((32'h00010000 <= io_masters_3_ar_payload_addr) && (io_masters_3_ar_payload_addr < 32'h00020000));
    _zz_when_Axi4LiteCrossbar_l296_4[2] = ((32'h00020000 <= io_masters_3_ar_payload_addr) && (io_masters_3_ar_payload_addr < 32'h00030000));
    _zz_when_Axi4LiteCrossbar_l296_4[3] = ((32'h00030000 <= io_masters_3_ar_payload_addr) && (io_masters_3_ar_payload_addr < 32'h00040000));
  end

  assign _zz_when_Axi4LiteCrossbar_l131_8 = _zz_when_Axi4LiteCrossbar_l296;
  assign _zz_when_Axi4LiteCrossbar_l131_9 = (_zz_when_Axi4LiteCrossbar_l131_8 & (~ _zz__zz_when_Axi4LiteCrossbar_l131_9));
  always @(*) begin
    _zz_rdGranted_0 = 2'b00;
    if(when_Axi4LiteCrossbar_l131_16) begin
      _zz_rdGranted_0 = 2'b00;
    end
    if(when_Axi4LiteCrossbar_l131_17) begin
      _zz_rdGranted_0 = 2'b01;
    end
    if(when_Axi4LiteCrossbar_l131_18) begin
      _zz_rdGranted_0 = 2'b10;
    end
    if(when_Axi4LiteCrossbar_l131_19) begin
      _zz_rdGranted_0 = 2'b11;
    end
  end

  assign when_Axi4LiteCrossbar_l131_16 = _zz_when_Axi4LiteCrossbar_l131_9[0];
  assign when_Axi4LiteCrossbar_l131_17 = _zz_when_Axi4LiteCrossbar_l131_9[1];
  assign when_Axi4LiteCrossbar_l131_18 = _zz_when_Axi4LiteCrossbar_l131_9[2];
  assign when_Axi4LiteCrossbar_l131_19 = _zz_when_Axi4LiteCrossbar_l131_9[3];
  assign when_Axi4LiteCrossbar_l296 = (|_zz_when_Axi4LiteCrossbar_l296);
  assign when_Axi4LiteCrossbar_l299 = (_zz_rdGranted_0 == 2'b00);
  assign when_Axi4LiteCrossbar_l299_1 = (_zz_rdGranted_0 == 2'b01);
  assign when_Axi4LiteCrossbar_l299_2 = (_zz_rdGranted_0 == 2'b10);
  assign when_Axi4LiteCrossbar_l299_3 = (_zz_rdGranted_0 == 2'b11);
  assign io_slaves_0_ar_fire = (io_slaves_0_ar_valid && io_slaves_0_ar_ready);
  assign when_Axi4LiteCrossbar_l342 = (rdGranted_0 == 2'b00);
  assign when_Axi4LiteCrossbar_l342_1 = (rdGranted_0 == 2'b01);
  assign when_Axi4LiteCrossbar_l342_2 = (rdGranted_0 == 2'b10);
  assign when_Axi4LiteCrossbar_l342_3 = (rdGranted_0 == 2'b11);
  assign io_slaves_0_r_fire = (io_slaves_0_r_valid && io_slaves_0_r_ready);
  assign when_Axi4LiteCrossbar_l285_1 = (! rdActive_1);
  always @(*) begin
    _zz_when_Axi4LiteCrossbar_l296_6[0] = ((32'h0 <= io_masters_0_ar_payload_addr) && (io_masters_0_ar_payload_addr < 32'h00010000));
    _zz_when_Axi4LiteCrossbar_l296_6[1] = ((32'h00010000 <= io_masters_0_ar_payload_addr) && (io_masters_0_ar_payload_addr < 32'h00020000));
    _zz_when_Axi4LiteCrossbar_l296_6[2] = ((32'h00020000 <= io_masters_0_ar_payload_addr) && (io_masters_0_ar_payload_addr < 32'h00030000));
    _zz_when_Axi4LiteCrossbar_l296_6[3] = ((32'h00030000 <= io_masters_0_ar_payload_addr) && (io_masters_0_ar_payload_addr < 32'h00040000));
  end

  always @(*) begin
    _zz_when_Axi4LiteCrossbar_l296_5[0] = (io_masters_0_ar_valid && _zz_when_Axi4LiteCrossbar_l296_6[1]);
    _zz_when_Axi4LiteCrossbar_l296_5[1] = (io_masters_1_ar_valid && _zz_when_Axi4LiteCrossbar_l296_7[1]);
    _zz_when_Axi4LiteCrossbar_l296_5[2] = (io_masters_2_ar_valid && _zz_when_Axi4LiteCrossbar_l296_8[1]);
    _zz_when_Axi4LiteCrossbar_l296_5[3] = (io_masters_3_ar_valid && _zz_when_Axi4LiteCrossbar_l296_9[1]);
  end

  always @(*) begin
    _zz_when_Axi4LiteCrossbar_l296_7[0] = ((32'h0 <= io_masters_1_ar_payload_addr) && (io_masters_1_ar_payload_addr < 32'h00010000));
    _zz_when_Axi4LiteCrossbar_l296_7[1] = ((32'h00010000 <= io_masters_1_ar_payload_addr) && (io_masters_1_ar_payload_addr < 32'h00020000));
    _zz_when_Axi4LiteCrossbar_l296_7[2] = ((32'h00020000 <= io_masters_1_ar_payload_addr) && (io_masters_1_ar_payload_addr < 32'h00030000));
    _zz_when_Axi4LiteCrossbar_l296_7[3] = ((32'h00030000 <= io_masters_1_ar_payload_addr) && (io_masters_1_ar_payload_addr < 32'h00040000));
  end

  always @(*) begin
    _zz_when_Axi4LiteCrossbar_l296_8[0] = ((32'h0 <= io_masters_2_ar_payload_addr) && (io_masters_2_ar_payload_addr < 32'h00010000));
    _zz_when_Axi4LiteCrossbar_l296_8[1] = ((32'h00010000 <= io_masters_2_ar_payload_addr) && (io_masters_2_ar_payload_addr < 32'h00020000));
    _zz_when_Axi4LiteCrossbar_l296_8[2] = ((32'h00020000 <= io_masters_2_ar_payload_addr) && (io_masters_2_ar_payload_addr < 32'h00030000));
    _zz_when_Axi4LiteCrossbar_l296_8[3] = ((32'h00030000 <= io_masters_2_ar_payload_addr) && (io_masters_2_ar_payload_addr < 32'h00040000));
  end

  always @(*) begin
    _zz_when_Axi4LiteCrossbar_l296_9[0] = ((32'h0 <= io_masters_3_ar_payload_addr) && (io_masters_3_ar_payload_addr < 32'h00010000));
    _zz_when_Axi4LiteCrossbar_l296_9[1] = ((32'h00010000 <= io_masters_3_ar_payload_addr) && (io_masters_3_ar_payload_addr < 32'h00020000));
    _zz_when_Axi4LiteCrossbar_l296_9[2] = ((32'h00020000 <= io_masters_3_ar_payload_addr) && (io_masters_3_ar_payload_addr < 32'h00030000));
    _zz_when_Axi4LiteCrossbar_l296_9[3] = ((32'h00030000 <= io_masters_3_ar_payload_addr) && (io_masters_3_ar_payload_addr < 32'h00040000));
  end

  assign _zz_when_Axi4LiteCrossbar_l131_10 = _zz_when_Axi4LiteCrossbar_l296_5;
  assign _zz_when_Axi4LiteCrossbar_l131_11 = (_zz_when_Axi4LiteCrossbar_l131_10 & (~ _zz__zz_when_Axi4LiteCrossbar_l131_11));
  always @(*) begin
    _zz_rdGranted_1 = 2'b00;
    if(when_Axi4LiteCrossbar_l131_20) begin
      _zz_rdGranted_1 = 2'b00;
    end
    if(when_Axi4LiteCrossbar_l131_21) begin
      _zz_rdGranted_1 = 2'b01;
    end
    if(when_Axi4LiteCrossbar_l131_22) begin
      _zz_rdGranted_1 = 2'b10;
    end
    if(when_Axi4LiteCrossbar_l131_23) begin
      _zz_rdGranted_1 = 2'b11;
    end
  end

  assign when_Axi4LiteCrossbar_l131_20 = _zz_when_Axi4LiteCrossbar_l131_11[0];
  assign when_Axi4LiteCrossbar_l131_21 = _zz_when_Axi4LiteCrossbar_l131_11[1];
  assign when_Axi4LiteCrossbar_l131_22 = _zz_when_Axi4LiteCrossbar_l131_11[2];
  assign when_Axi4LiteCrossbar_l131_23 = _zz_when_Axi4LiteCrossbar_l131_11[3];
  assign when_Axi4LiteCrossbar_l296_1 = (|_zz_when_Axi4LiteCrossbar_l296_5);
  assign when_Axi4LiteCrossbar_l299_4 = (_zz_rdGranted_1 == 2'b00);
  assign when_Axi4LiteCrossbar_l299_5 = (_zz_rdGranted_1 == 2'b01);
  assign when_Axi4LiteCrossbar_l299_6 = (_zz_rdGranted_1 == 2'b10);
  assign when_Axi4LiteCrossbar_l299_7 = (_zz_rdGranted_1 == 2'b11);
  assign io_slaves_1_ar_fire = (io_slaves_1_ar_valid && io_slaves_1_ar_ready);
  assign when_Axi4LiteCrossbar_l342_4 = (rdGranted_1 == 2'b00);
  assign when_Axi4LiteCrossbar_l342_5 = (rdGranted_1 == 2'b01);
  assign when_Axi4LiteCrossbar_l342_6 = (rdGranted_1 == 2'b10);
  assign when_Axi4LiteCrossbar_l342_7 = (rdGranted_1 == 2'b11);
  assign io_slaves_1_r_fire = (io_slaves_1_r_valid && io_slaves_1_r_ready);
  assign when_Axi4LiteCrossbar_l285_2 = (! rdActive_2);
  always @(*) begin
    _zz_when_Axi4LiteCrossbar_l296_11[0] = ((32'h0 <= io_masters_0_ar_payload_addr) && (io_masters_0_ar_payload_addr < 32'h00010000));
    _zz_when_Axi4LiteCrossbar_l296_11[1] = ((32'h00010000 <= io_masters_0_ar_payload_addr) && (io_masters_0_ar_payload_addr < 32'h00020000));
    _zz_when_Axi4LiteCrossbar_l296_11[2] = ((32'h00020000 <= io_masters_0_ar_payload_addr) && (io_masters_0_ar_payload_addr < 32'h00030000));
    _zz_when_Axi4LiteCrossbar_l296_11[3] = ((32'h00030000 <= io_masters_0_ar_payload_addr) && (io_masters_0_ar_payload_addr < 32'h00040000));
  end

  always @(*) begin
    _zz_when_Axi4LiteCrossbar_l296_10[0] = (io_masters_0_ar_valid && _zz_when_Axi4LiteCrossbar_l296_11[2]);
    _zz_when_Axi4LiteCrossbar_l296_10[1] = (io_masters_1_ar_valid && _zz_when_Axi4LiteCrossbar_l296_12[2]);
    _zz_when_Axi4LiteCrossbar_l296_10[2] = (io_masters_2_ar_valid && _zz_when_Axi4LiteCrossbar_l296_13[2]);
    _zz_when_Axi4LiteCrossbar_l296_10[3] = (io_masters_3_ar_valid && _zz_when_Axi4LiteCrossbar_l296_14[2]);
  end

  always @(*) begin
    _zz_when_Axi4LiteCrossbar_l296_12[0] = ((32'h0 <= io_masters_1_ar_payload_addr) && (io_masters_1_ar_payload_addr < 32'h00010000));
    _zz_when_Axi4LiteCrossbar_l296_12[1] = ((32'h00010000 <= io_masters_1_ar_payload_addr) && (io_masters_1_ar_payload_addr < 32'h00020000));
    _zz_when_Axi4LiteCrossbar_l296_12[2] = ((32'h00020000 <= io_masters_1_ar_payload_addr) && (io_masters_1_ar_payload_addr < 32'h00030000));
    _zz_when_Axi4LiteCrossbar_l296_12[3] = ((32'h00030000 <= io_masters_1_ar_payload_addr) && (io_masters_1_ar_payload_addr < 32'h00040000));
  end

  always @(*) begin
    _zz_when_Axi4LiteCrossbar_l296_13[0] = ((32'h0 <= io_masters_2_ar_payload_addr) && (io_masters_2_ar_payload_addr < 32'h00010000));
    _zz_when_Axi4LiteCrossbar_l296_13[1] = ((32'h00010000 <= io_masters_2_ar_payload_addr) && (io_masters_2_ar_payload_addr < 32'h00020000));
    _zz_when_Axi4LiteCrossbar_l296_13[2] = ((32'h00020000 <= io_masters_2_ar_payload_addr) && (io_masters_2_ar_payload_addr < 32'h00030000));
    _zz_when_Axi4LiteCrossbar_l296_13[3] = ((32'h00030000 <= io_masters_2_ar_payload_addr) && (io_masters_2_ar_payload_addr < 32'h00040000));
  end

  always @(*) begin
    _zz_when_Axi4LiteCrossbar_l296_14[0] = ((32'h0 <= io_masters_3_ar_payload_addr) && (io_masters_3_ar_payload_addr < 32'h00010000));
    _zz_when_Axi4LiteCrossbar_l296_14[1] = ((32'h00010000 <= io_masters_3_ar_payload_addr) && (io_masters_3_ar_payload_addr < 32'h00020000));
    _zz_when_Axi4LiteCrossbar_l296_14[2] = ((32'h00020000 <= io_masters_3_ar_payload_addr) && (io_masters_3_ar_payload_addr < 32'h00030000));
    _zz_when_Axi4LiteCrossbar_l296_14[3] = ((32'h00030000 <= io_masters_3_ar_payload_addr) && (io_masters_3_ar_payload_addr < 32'h00040000));
  end

  assign _zz_when_Axi4LiteCrossbar_l131_12 = _zz_when_Axi4LiteCrossbar_l296_10;
  assign _zz_when_Axi4LiteCrossbar_l131_13 = (_zz_when_Axi4LiteCrossbar_l131_12 & (~ _zz__zz_when_Axi4LiteCrossbar_l131_13));
  always @(*) begin
    _zz_rdGranted_2 = 2'b00;
    if(when_Axi4LiteCrossbar_l131_24) begin
      _zz_rdGranted_2 = 2'b00;
    end
    if(when_Axi4LiteCrossbar_l131_25) begin
      _zz_rdGranted_2 = 2'b01;
    end
    if(when_Axi4LiteCrossbar_l131_26) begin
      _zz_rdGranted_2 = 2'b10;
    end
    if(when_Axi4LiteCrossbar_l131_27) begin
      _zz_rdGranted_2 = 2'b11;
    end
  end

  assign when_Axi4LiteCrossbar_l131_24 = _zz_when_Axi4LiteCrossbar_l131_13[0];
  assign when_Axi4LiteCrossbar_l131_25 = _zz_when_Axi4LiteCrossbar_l131_13[1];
  assign when_Axi4LiteCrossbar_l131_26 = _zz_when_Axi4LiteCrossbar_l131_13[2];
  assign when_Axi4LiteCrossbar_l131_27 = _zz_when_Axi4LiteCrossbar_l131_13[3];
  assign when_Axi4LiteCrossbar_l296_2 = (|_zz_when_Axi4LiteCrossbar_l296_10);
  assign when_Axi4LiteCrossbar_l299_8 = (_zz_rdGranted_2 == 2'b00);
  assign when_Axi4LiteCrossbar_l299_9 = (_zz_rdGranted_2 == 2'b01);
  assign when_Axi4LiteCrossbar_l299_10 = (_zz_rdGranted_2 == 2'b10);
  assign when_Axi4LiteCrossbar_l299_11 = (_zz_rdGranted_2 == 2'b11);
  assign io_slaves_2_ar_fire = (io_slaves_2_ar_valid && io_slaves_2_ar_ready);
  assign when_Axi4LiteCrossbar_l342_8 = (rdGranted_2 == 2'b00);
  assign when_Axi4LiteCrossbar_l342_9 = (rdGranted_2 == 2'b01);
  assign when_Axi4LiteCrossbar_l342_10 = (rdGranted_2 == 2'b10);
  assign when_Axi4LiteCrossbar_l342_11 = (rdGranted_2 == 2'b11);
  assign io_slaves_2_r_fire = (io_slaves_2_r_valid && io_slaves_2_r_ready);
  assign when_Axi4LiteCrossbar_l285_3 = (! rdActive_3);
  always @(*) begin
    _zz_when_Axi4LiteCrossbar_l296_16[0] = ((32'h0 <= io_masters_0_ar_payload_addr) && (io_masters_0_ar_payload_addr < 32'h00010000));
    _zz_when_Axi4LiteCrossbar_l296_16[1] = ((32'h00010000 <= io_masters_0_ar_payload_addr) && (io_masters_0_ar_payload_addr < 32'h00020000));
    _zz_when_Axi4LiteCrossbar_l296_16[2] = ((32'h00020000 <= io_masters_0_ar_payload_addr) && (io_masters_0_ar_payload_addr < 32'h00030000));
    _zz_when_Axi4LiteCrossbar_l296_16[3] = ((32'h00030000 <= io_masters_0_ar_payload_addr) && (io_masters_0_ar_payload_addr < 32'h00040000));
  end

  always @(*) begin
    _zz_when_Axi4LiteCrossbar_l296_15[0] = (io_masters_0_ar_valid && _zz_when_Axi4LiteCrossbar_l296_16[3]);
    _zz_when_Axi4LiteCrossbar_l296_15[1] = (io_masters_1_ar_valid && _zz_when_Axi4LiteCrossbar_l296_17[3]);
    _zz_when_Axi4LiteCrossbar_l296_15[2] = (io_masters_2_ar_valid && _zz_when_Axi4LiteCrossbar_l296_18[3]);
    _zz_when_Axi4LiteCrossbar_l296_15[3] = (io_masters_3_ar_valid && _zz_when_Axi4LiteCrossbar_l296_19[3]);
  end

  always @(*) begin
    _zz_when_Axi4LiteCrossbar_l296_17[0] = ((32'h0 <= io_masters_1_ar_payload_addr) && (io_masters_1_ar_payload_addr < 32'h00010000));
    _zz_when_Axi4LiteCrossbar_l296_17[1] = ((32'h00010000 <= io_masters_1_ar_payload_addr) && (io_masters_1_ar_payload_addr < 32'h00020000));
    _zz_when_Axi4LiteCrossbar_l296_17[2] = ((32'h00020000 <= io_masters_1_ar_payload_addr) && (io_masters_1_ar_payload_addr < 32'h00030000));
    _zz_when_Axi4LiteCrossbar_l296_17[3] = ((32'h00030000 <= io_masters_1_ar_payload_addr) && (io_masters_1_ar_payload_addr < 32'h00040000));
  end

  always @(*) begin
    _zz_when_Axi4LiteCrossbar_l296_18[0] = ((32'h0 <= io_masters_2_ar_payload_addr) && (io_masters_2_ar_payload_addr < 32'h00010000));
    _zz_when_Axi4LiteCrossbar_l296_18[1] = ((32'h00010000 <= io_masters_2_ar_payload_addr) && (io_masters_2_ar_payload_addr < 32'h00020000));
    _zz_when_Axi4LiteCrossbar_l296_18[2] = ((32'h00020000 <= io_masters_2_ar_payload_addr) && (io_masters_2_ar_payload_addr < 32'h00030000));
    _zz_when_Axi4LiteCrossbar_l296_18[3] = ((32'h00030000 <= io_masters_2_ar_payload_addr) && (io_masters_2_ar_payload_addr < 32'h00040000));
  end

  always @(*) begin
    _zz_when_Axi4LiteCrossbar_l296_19[0] = ((32'h0 <= io_masters_3_ar_payload_addr) && (io_masters_3_ar_payload_addr < 32'h00010000));
    _zz_when_Axi4LiteCrossbar_l296_19[1] = ((32'h00010000 <= io_masters_3_ar_payload_addr) && (io_masters_3_ar_payload_addr < 32'h00020000));
    _zz_when_Axi4LiteCrossbar_l296_19[2] = ((32'h00020000 <= io_masters_3_ar_payload_addr) && (io_masters_3_ar_payload_addr < 32'h00030000));
    _zz_when_Axi4LiteCrossbar_l296_19[3] = ((32'h00030000 <= io_masters_3_ar_payload_addr) && (io_masters_3_ar_payload_addr < 32'h00040000));
  end

  assign _zz_when_Axi4LiteCrossbar_l131_14 = _zz_when_Axi4LiteCrossbar_l296_15;
  assign _zz_when_Axi4LiteCrossbar_l131_15 = (_zz_when_Axi4LiteCrossbar_l131_14 & (~ _zz__zz_when_Axi4LiteCrossbar_l131_15));
  always @(*) begin
    _zz_rdGranted_3 = 2'b00;
    if(when_Axi4LiteCrossbar_l131_28) begin
      _zz_rdGranted_3 = 2'b00;
    end
    if(when_Axi4LiteCrossbar_l131_29) begin
      _zz_rdGranted_3 = 2'b01;
    end
    if(when_Axi4LiteCrossbar_l131_30) begin
      _zz_rdGranted_3 = 2'b10;
    end
    if(when_Axi4LiteCrossbar_l131_31) begin
      _zz_rdGranted_3 = 2'b11;
    end
  end

  assign when_Axi4LiteCrossbar_l131_28 = _zz_when_Axi4LiteCrossbar_l131_15[0];
  assign when_Axi4LiteCrossbar_l131_29 = _zz_when_Axi4LiteCrossbar_l131_15[1];
  assign when_Axi4LiteCrossbar_l131_30 = _zz_when_Axi4LiteCrossbar_l131_15[2];
  assign when_Axi4LiteCrossbar_l131_31 = _zz_when_Axi4LiteCrossbar_l131_15[3];
  assign when_Axi4LiteCrossbar_l296_3 = (|_zz_when_Axi4LiteCrossbar_l296_15);
  assign when_Axi4LiteCrossbar_l299_12 = (_zz_rdGranted_3 == 2'b00);
  assign when_Axi4LiteCrossbar_l299_13 = (_zz_rdGranted_3 == 2'b01);
  assign when_Axi4LiteCrossbar_l299_14 = (_zz_rdGranted_3 == 2'b10);
  assign when_Axi4LiteCrossbar_l299_15 = (_zz_rdGranted_3 == 2'b11);
  assign io_slaves_3_ar_fire = (io_slaves_3_ar_valid && io_slaves_3_ar_ready);
  assign when_Axi4LiteCrossbar_l342_12 = (rdGranted_3 == 2'b00);
  assign when_Axi4LiteCrossbar_l342_13 = (rdGranted_3 == 2'b01);
  assign when_Axi4LiteCrossbar_l342_14 = (rdGranted_3 == 2'b10);
  assign when_Axi4LiteCrossbar_l342_15 = (rdGranted_3 == 2'b11);
  assign io_slaves_3_r_fire = (io_slaves_3_r_valid && io_slaves_3_r_ready);
  always @(posedge clk) begin
    if(!resetn) begin
      wrActive_0 <= 1'b0;
      wrActive_1 <= 1'b0;
      wrActive_2 <= 1'b0;
      wrActive_3 <= 1'b0;
      wrGranted_0 <= 2'b00;
      wrGranted_1 <= 2'b00;
      wrGranted_2 <= 2'b00;
      wrGranted_3 <= 2'b00;
      wrRrPtr_0 <= 2'b00;
      wrRrPtr_1 <= 2'b00;
      wrRrPtr_2 <= 2'b00;
      wrRrPtr_3 <= 2'b00;
      rdActive_0 <= 1'b0;
      rdActive_1 <= 1'b0;
      rdActive_2 <= 1'b0;
      rdActive_3 <= 1'b0;
      rdGranted_0 <= 2'b00;
      rdGranted_1 <= 2'b00;
      rdGranted_2 <= 2'b00;
      rdGranted_3 <= 2'b00;
      rdRrPtr_0 <= 2'b00;
      rdRrPtr_1 <= 2'b00;
      rdRrPtr_2 <= 2'b00;
      rdRrPtr_3 <= 2'b00;
    end else begin
      if(when_Axi4LiteCrossbar_l196) begin
        if(when_Axi4LiteCrossbar_l208) begin
          if(io_slaves_0_aw_fire) begin
            wrActive_0 <= 1'b1;
            wrGranted_0 <= _zz_wrGranted_0;
            wrRrPtr_0 <= (_zz_wrGranted_0 + 2'b01);
          end
        end
      end else begin
        if(io_slaves_0_b_fire) begin
          wrActive_0 <= 1'b0;
        end
      end
      if(when_Axi4LiteCrossbar_l196_1) begin
        if(when_Axi4LiteCrossbar_l208_1) begin
          if(io_slaves_1_aw_fire) begin
            wrActive_1 <= 1'b1;
            wrGranted_1 <= _zz_wrGranted_1;
            wrRrPtr_1 <= (_zz_wrGranted_1 + 2'b01);
          end
        end
      end else begin
        if(io_slaves_1_b_fire) begin
          wrActive_1 <= 1'b0;
        end
      end
      if(when_Axi4LiteCrossbar_l196_2) begin
        if(when_Axi4LiteCrossbar_l208_2) begin
          if(io_slaves_2_aw_fire) begin
            wrActive_2 <= 1'b1;
            wrGranted_2 <= _zz_wrGranted_2;
            wrRrPtr_2 <= (_zz_wrGranted_2 + 2'b01);
          end
        end
      end else begin
        if(io_slaves_2_b_fire) begin
          wrActive_2 <= 1'b0;
        end
      end
      if(when_Axi4LiteCrossbar_l196_3) begin
        if(when_Axi4LiteCrossbar_l208_3) begin
          if(io_slaves_3_aw_fire) begin
            wrActive_3 <= 1'b1;
            wrGranted_3 <= _zz_wrGranted_3;
            wrRrPtr_3 <= (_zz_wrGranted_3 + 2'b01);
          end
        end
      end else begin
        if(io_slaves_3_b_fire) begin
          wrActive_3 <= 1'b0;
        end
      end
      if(when_Axi4LiteCrossbar_l285) begin
        if(when_Axi4LiteCrossbar_l296) begin
          if(io_slaves_0_ar_fire) begin
            rdActive_0 <= 1'b1;
            rdGranted_0 <= _zz_rdGranted_0;
            rdRrPtr_0 <= (_zz_rdGranted_0 + 2'b01);
          end
        end
      end else begin
        if(io_slaves_0_r_fire) begin
          rdActive_0 <= 1'b0;
        end
      end
      if(when_Axi4LiteCrossbar_l285_1) begin
        if(when_Axi4LiteCrossbar_l296_1) begin
          if(io_slaves_1_ar_fire) begin
            rdActive_1 <= 1'b1;
            rdGranted_1 <= _zz_rdGranted_1;
            rdRrPtr_1 <= (_zz_rdGranted_1 + 2'b01);
          end
        end
      end else begin
        if(io_slaves_1_r_fire) begin
          rdActive_1 <= 1'b0;
        end
      end
      if(when_Axi4LiteCrossbar_l285_2) begin
        if(when_Axi4LiteCrossbar_l296_2) begin
          if(io_slaves_2_ar_fire) begin
            rdActive_2 <= 1'b1;
            rdGranted_2 <= _zz_rdGranted_2;
            rdRrPtr_2 <= (_zz_rdGranted_2 + 2'b01);
          end
        end
      end else begin
        if(io_slaves_2_r_fire) begin
          rdActive_2 <= 1'b0;
        end
      end
      if(when_Axi4LiteCrossbar_l285_3) begin
        if(when_Axi4LiteCrossbar_l296_3) begin
          if(io_slaves_3_ar_fire) begin
            rdActive_3 <= 1'b1;
            rdGranted_3 <= _zz_rdGranted_3;
            rdRrPtr_3 <= (_zz_rdGranted_3 + 2'b01);
          end
        end
      end else begin
        if(io_slaves_3_r_fire) begin
          rdActive_3 <= 1'b0;
        end
      end
    end
  end


endmodule
