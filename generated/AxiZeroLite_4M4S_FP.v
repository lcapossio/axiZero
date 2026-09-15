// Copyright (c) 2026 Leonardo Capossio - bard0 design  hello@bard0.com
// SPDX-License-Identifier: MIT
// Generator : SpinalHDL v1.14.2    git head : 78f29dc66110fc099a777992b6daa2f803ab445e
// Component : AxiZeroLiteTop
// Git hash  : 9f297c0f02f4e19b441aa2192b016cd3de916891

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
  wire       [1:0]    _zz_io_masters_2_b_payload_resp;
  wire       [1:0]    _zz_io_masters_3_b_payload_resp;
  wire       [4:0]    _zz__zz_when_Axi4LiteCrossbar_l297;
  wire       [1:0]    _zz__zz_when_Axi4LiteCrossbar_l297_1;
  wire       [1:0]    _zz__zz_when_Axi4LiteCrossbar_l297_2;
  wire       [1:0]    _zz__zz_when_Axi4LiteCrossbar_l297_3;
  wire       [1:0]    _zz__zz_when_Axi4LiteCrossbar_l297_4;
  wire       [4:0]    _zz__zz_when_Axi4LiteCrossbar_l297_5;
  wire       [4:0]    _zz__zz_when_Axi4LiteCrossbar_l297_6;
  wire       [4:0]    _zz__zz_when_Axi4LiteCrossbar_l297_7;
  wire       [3:0]    _zz__zz_when_Axi4LiteCrossbar_l149_1;
  wire       [4:0]    _zz__zz_when_Axi4LiteCrossbar_l297_5_1;
  wire       [4:0]    _zz__zz_when_Axi4LiteCrossbar_l297_5_2;
  wire       [4:0]    _zz__zz_when_Axi4LiteCrossbar_l297_5_3;
  wire       [4:0]    _zz__zz_when_Axi4LiteCrossbar_l297_5_4;
  wire       [3:0]    _zz__zz_when_Axi4LiteCrossbar_l149_3;
  wire       [4:0]    _zz__zz_when_Axi4LiteCrossbar_l297_10;
  wire       [4:0]    _zz__zz_when_Axi4LiteCrossbar_l297_10_1;
  wire       [4:0]    _zz__zz_when_Axi4LiteCrossbar_l297_10_2;
  wire       [4:0]    _zz__zz_when_Axi4LiteCrossbar_l297_10_3;
  wire       [3:0]    _zz__zz_when_Axi4LiteCrossbar_l149_5;
  wire       [4:0]    _zz__zz_when_Axi4LiteCrossbar_l297_15;
  wire       [4:0]    _zz__zz_when_Axi4LiteCrossbar_l297_15_1;
  wire       [4:0]    _zz__zz_when_Axi4LiteCrossbar_l297_15_2;
  wire       [4:0]    _zz__zz_when_Axi4LiteCrossbar_l297_15_3;
  wire       [3:0]    _zz__zz_when_Axi4LiteCrossbar_l149_7;
  wire       [4:0]    _zz__zz_when_Axi4LiteCrossbar_l297_20;
  wire       [4:0]    _zz__zz_when_Axi4LiteCrossbar_l297_20_1;
  wire       [4:0]    _zz__zz_when_Axi4LiteCrossbar_l297_20_2;
  wire       [4:0]    _zz__zz_when_Axi4LiteCrossbar_l297_20_3;
  wire       [3:0]    _zz__zz_when_Axi4LiteCrossbar_l149_9;
  wire       [4:0]    _zz__zz_when_Axi4LiteCrossbar_l400;
  wire       [1:0]    _zz__zz_when_Axi4LiteCrossbar_l400_1;
  wire       [1:0]    _zz__zz_when_Axi4LiteCrossbar_l400_2;
  wire       [1:0]    _zz__zz_when_Axi4LiteCrossbar_l400_3;
  wire       [1:0]    _zz__zz_when_Axi4LiteCrossbar_l400_4;
  wire       [4:0]    _zz__zz_when_Axi4LiteCrossbar_l400_5;
  wire       [4:0]    _zz__zz_when_Axi4LiteCrossbar_l400_6;
  wire       [4:0]    _zz__zz_when_Axi4LiteCrossbar_l400_7;
  wire       [3:0]    _zz__zz_when_Axi4LiteCrossbar_l149_11;
  wire       [4:0]    _zz__zz_when_Axi4LiteCrossbar_l400_5_1;
  wire       [4:0]    _zz__zz_when_Axi4LiteCrossbar_l400_5_2;
  wire       [4:0]    _zz__zz_when_Axi4LiteCrossbar_l400_5_3;
  wire       [4:0]    _zz__zz_when_Axi4LiteCrossbar_l400_5_4;
  wire       [3:0]    _zz__zz_when_Axi4LiteCrossbar_l149_13;
  wire       [4:0]    _zz__zz_when_Axi4LiteCrossbar_l400_10;
  wire       [4:0]    _zz__zz_when_Axi4LiteCrossbar_l400_10_1;
  wire       [4:0]    _zz__zz_when_Axi4LiteCrossbar_l400_10_2;
  wire       [4:0]    _zz__zz_when_Axi4LiteCrossbar_l400_10_3;
  wire       [3:0]    _zz__zz_when_Axi4LiteCrossbar_l149_15;
  wire       [4:0]    _zz__zz_when_Axi4LiteCrossbar_l400_15;
  wire       [4:0]    _zz__zz_when_Axi4LiteCrossbar_l400_15_1;
  wire       [4:0]    _zz__zz_when_Axi4LiteCrossbar_l400_15_2;
  wire       [4:0]    _zz__zz_when_Axi4LiteCrossbar_l400_15_3;
  wire       [3:0]    _zz__zz_when_Axi4LiteCrossbar_l149_17;
  wire       [4:0]    _zz__zz_when_Axi4LiteCrossbar_l400_20;
  wire       [4:0]    _zz__zz_when_Axi4LiteCrossbar_l400_20_1;
  wire       [4:0]    _zz__zz_when_Axi4LiteCrossbar_l400_20_2;
  wire       [4:0]    _zz__zz_when_Axi4LiteCrossbar_l400_20_3;
  wire       [3:0]    _zz__zz_when_Axi4LiteCrossbar_l149_19;
  reg                 wrActive_0;
  reg                 wrActive_1;
  reg                 wrActive_2;
  reg                 wrActive_3;
  reg                 wrActive_4;
  reg        [1:0]    wrGranted_0;
  reg        [1:0]    wrGranted_1;
  reg        [1:0]    wrGranted_2;
  reg        [1:0]    wrGranted_3;
  reg        [1:0]    wrGranted_4;
  reg                 wrDataDone_0;
  reg                 wrDataDone_1;
  reg                 wrDataDone_2;
  reg                 wrDataDone_3;
  reg                 wrDataDone_4;
  reg        [1:0]    wrRrPtr_0;
  reg        [1:0]    wrRrPtr_1;
  reg        [1:0]    wrRrPtr_2;
  reg        [1:0]    wrRrPtr_3;
  reg        [1:0]    wrRrPtr_4;
  reg                 rdActive_0;
  reg                 rdActive_1;
  reg                 rdActive_2;
  reg                 rdActive_3;
  reg                 rdActive_4;
  reg        [1:0]    rdGranted_0;
  reg        [1:0]    rdGranted_1;
  reg        [1:0]    rdGranted_2;
  reg        [1:0]    rdGranted_3;
  reg        [1:0]    rdGranted_4;
  reg        [1:0]    rdRrPtr_0;
  reg        [1:0]    rdRrPtr_1;
  reg        [1:0]    rdRrPtr_2;
  reg        [1:0]    rdRrPtr_3;
  reg        [1:0]    rdRrPtr_4;
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
  wire       [34:0]   _zz_io_axi_aw_payload_addr;
  wire       [35:0]   _zz_io_axi_w_payload_data;
  wire       [34:0]   _zz_io_axi_ar_payload_addr;
  wire                when_Axi4LiteCrossbar_l284;
  reg        [3:0]    _zz_when_Axi4LiteCrossbar_l297;
  reg        [3:0]    _zz_when_Axi4LiteCrossbar_l297_1;
  reg        [3:0]    _zz_when_Axi4LiteCrossbar_l297_2;
  reg        [3:0]    _zz_when_Axi4LiteCrossbar_l297_3;
  reg        [3:0]    _zz_when_Axi4LiteCrossbar_l297_4;
  wire       [3:0]    _zz_when_Axi4LiteCrossbar_l149;
  wire       [3:0]    _zz_when_Axi4LiteCrossbar_l149_1;
  reg        [1:0]    _zz_wrGranted_0;
  wire                when_Axi4LiteCrossbar_l149;
  wire                when_Axi4LiteCrossbar_l149_1;
  wire                when_Axi4LiteCrossbar_l149_2;
  wire                when_Axi4LiteCrossbar_l149_3;
  reg                 grantLock;
  reg        [1:0]    grantLockIdx;
  wire       [1:0]    _zz_wrGranted_0_1;
  wire                when_Axi4LiteCrossbar_l184;
  wire                when_Axi4LiteCrossbar_l297;
  wire                when_Axi4LiteCrossbar_l301;
  wire                when_Axi4LiteCrossbar_l308;
  wire                when_Axi4LiteCrossbar_l301_1;
  wire                when_Axi4LiteCrossbar_l308_1;
  wire                when_Axi4LiteCrossbar_l301_2;
  wire                when_Axi4LiteCrossbar_l308_2;
  wire                when_Axi4LiteCrossbar_l301_3;
  wire                when_Axi4LiteCrossbar_l308_3;
  wire                io_slaves_0_aw_fire;
  wire                when_Axi4LiteCrossbar_l357;
  wire                when_Axi4LiteCrossbar_l358;
  wire                when_Axi4LiteCrossbar_l357_1;
  wire                when_Axi4LiteCrossbar_l358_1;
  wire                when_Axi4LiteCrossbar_l357_2;
  wire                when_Axi4LiteCrossbar_l358_2;
  wire                when_Axi4LiteCrossbar_l357_3;
  wire                when_Axi4LiteCrossbar_l358_3;
  wire                io_slaves_0_b_fire;
  wire                io_slaves_0_w_fire;
  wire                when_Axi4LiteCrossbar_l284_1;
  reg        [3:0]    _zz_when_Axi4LiteCrossbar_l297_5;
  reg        [3:0]    _zz_when_Axi4LiteCrossbar_l297_6;
  reg        [3:0]    _zz_when_Axi4LiteCrossbar_l297_7;
  reg        [3:0]    _zz_when_Axi4LiteCrossbar_l297_8;
  reg        [3:0]    _zz_when_Axi4LiteCrossbar_l297_9;
  wire       [3:0]    _zz_when_Axi4LiteCrossbar_l149_2;
  wire       [3:0]    _zz_when_Axi4LiteCrossbar_l149_3;
  reg        [1:0]    _zz_wrGranted_1;
  wire                when_Axi4LiteCrossbar_l149_4;
  wire                when_Axi4LiteCrossbar_l149_5;
  wire                when_Axi4LiteCrossbar_l149_6;
  wire                when_Axi4LiteCrossbar_l149_7;
  reg                 grantLock_1;
  reg        [1:0]    grantLockIdx_1;
  wire       [1:0]    _zz_wrGranted_1_1;
  wire                when_Axi4LiteCrossbar_l184_1;
  wire                when_Axi4LiteCrossbar_l297_1;
  wire                when_Axi4LiteCrossbar_l301_4;
  wire                when_Axi4LiteCrossbar_l308_4;
  wire                when_Axi4LiteCrossbar_l301_5;
  wire                when_Axi4LiteCrossbar_l308_5;
  wire                when_Axi4LiteCrossbar_l301_6;
  wire                when_Axi4LiteCrossbar_l308_6;
  wire                when_Axi4LiteCrossbar_l301_7;
  wire                when_Axi4LiteCrossbar_l308_7;
  wire                io_slaves_1_aw_fire;
  wire                when_Axi4LiteCrossbar_l357_4;
  wire                when_Axi4LiteCrossbar_l358_4;
  wire                when_Axi4LiteCrossbar_l357_5;
  wire                when_Axi4LiteCrossbar_l358_5;
  wire                when_Axi4LiteCrossbar_l357_6;
  wire                when_Axi4LiteCrossbar_l358_6;
  wire                when_Axi4LiteCrossbar_l357_7;
  wire                when_Axi4LiteCrossbar_l358_7;
  wire                io_slaves_1_b_fire;
  wire                io_slaves_1_w_fire;
  wire                when_Axi4LiteCrossbar_l284_2;
  reg        [3:0]    _zz_when_Axi4LiteCrossbar_l297_10;
  reg        [3:0]    _zz_when_Axi4LiteCrossbar_l297_11;
  reg        [3:0]    _zz_when_Axi4LiteCrossbar_l297_12;
  reg        [3:0]    _zz_when_Axi4LiteCrossbar_l297_13;
  reg        [3:0]    _zz_when_Axi4LiteCrossbar_l297_14;
  wire       [3:0]    _zz_when_Axi4LiteCrossbar_l149_4;
  wire       [3:0]    _zz_when_Axi4LiteCrossbar_l149_5;
  reg        [1:0]    _zz_wrGranted_2;
  wire                when_Axi4LiteCrossbar_l149_8;
  wire                when_Axi4LiteCrossbar_l149_9;
  wire                when_Axi4LiteCrossbar_l149_10;
  wire                when_Axi4LiteCrossbar_l149_11;
  reg                 grantLock_2;
  reg        [1:0]    grantLockIdx_2;
  wire       [1:0]    _zz_wrGranted_2_1;
  wire                when_Axi4LiteCrossbar_l184_2;
  wire                when_Axi4LiteCrossbar_l297_2;
  wire                when_Axi4LiteCrossbar_l301_8;
  wire                when_Axi4LiteCrossbar_l308_8;
  wire                when_Axi4LiteCrossbar_l301_9;
  wire                when_Axi4LiteCrossbar_l308_9;
  wire                when_Axi4LiteCrossbar_l301_10;
  wire                when_Axi4LiteCrossbar_l308_10;
  wire                when_Axi4LiteCrossbar_l301_11;
  wire                when_Axi4LiteCrossbar_l308_11;
  wire                io_slaves_2_aw_fire;
  wire                when_Axi4LiteCrossbar_l357_8;
  wire                when_Axi4LiteCrossbar_l358_8;
  wire                when_Axi4LiteCrossbar_l357_9;
  wire                when_Axi4LiteCrossbar_l358_9;
  wire                when_Axi4LiteCrossbar_l357_10;
  wire                when_Axi4LiteCrossbar_l358_10;
  wire                when_Axi4LiteCrossbar_l357_11;
  wire                when_Axi4LiteCrossbar_l358_11;
  wire                io_slaves_2_b_fire;
  wire                io_slaves_2_w_fire;
  wire                when_Axi4LiteCrossbar_l284_3;
  reg        [3:0]    _zz_when_Axi4LiteCrossbar_l297_15;
  reg        [3:0]    _zz_when_Axi4LiteCrossbar_l297_16;
  reg        [3:0]    _zz_when_Axi4LiteCrossbar_l297_17;
  reg        [3:0]    _zz_when_Axi4LiteCrossbar_l297_18;
  reg        [3:0]    _zz_when_Axi4LiteCrossbar_l297_19;
  wire       [3:0]    _zz_when_Axi4LiteCrossbar_l149_6;
  wire       [3:0]    _zz_when_Axi4LiteCrossbar_l149_7;
  reg        [1:0]    _zz_wrGranted_3;
  wire                when_Axi4LiteCrossbar_l149_12;
  wire                when_Axi4LiteCrossbar_l149_13;
  wire                when_Axi4LiteCrossbar_l149_14;
  wire                when_Axi4LiteCrossbar_l149_15;
  reg                 grantLock_3;
  reg        [1:0]    grantLockIdx_3;
  wire       [1:0]    _zz_wrGranted_3_1;
  wire                when_Axi4LiteCrossbar_l184_3;
  wire                when_Axi4LiteCrossbar_l297_3;
  wire                when_Axi4LiteCrossbar_l301_12;
  wire                when_Axi4LiteCrossbar_l308_12;
  wire                when_Axi4LiteCrossbar_l301_13;
  wire                when_Axi4LiteCrossbar_l308_13;
  wire                when_Axi4LiteCrossbar_l301_14;
  wire                when_Axi4LiteCrossbar_l308_14;
  wire                when_Axi4LiteCrossbar_l301_15;
  wire                when_Axi4LiteCrossbar_l308_15;
  wire                io_slaves_3_aw_fire;
  wire                when_Axi4LiteCrossbar_l357_12;
  wire                when_Axi4LiteCrossbar_l358_12;
  wire                when_Axi4LiteCrossbar_l357_13;
  wire                when_Axi4LiteCrossbar_l358_13;
  wire                when_Axi4LiteCrossbar_l357_14;
  wire                when_Axi4LiteCrossbar_l358_14;
  wire                when_Axi4LiteCrossbar_l357_15;
  wire                when_Axi4LiteCrossbar_l358_15;
  wire                io_slaves_3_b_fire;
  wire                io_slaves_3_w_fire;
  wire                when_Axi4LiteCrossbar_l284_4;
  reg        [3:0]    _zz_when_Axi4LiteCrossbar_l297_20;
  reg        [3:0]    _zz_when_Axi4LiteCrossbar_l297_21;
  reg        [3:0]    _zz_when_Axi4LiteCrossbar_l297_22;
  reg        [3:0]    _zz_when_Axi4LiteCrossbar_l297_23;
  reg        [3:0]    _zz_when_Axi4LiteCrossbar_l297_24;
  wire       [3:0]    _zz_when_Axi4LiteCrossbar_l149_8;
  wire       [3:0]    _zz_when_Axi4LiteCrossbar_l149_9;
  reg        [1:0]    _zz_wrGranted_4;
  wire                when_Axi4LiteCrossbar_l149_16;
  wire                when_Axi4LiteCrossbar_l149_17;
  wire                when_Axi4LiteCrossbar_l149_18;
  wire                when_Axi4LiteCrossbar_l149_19;
  reg                 grantLock_4;
  reg        [1:0]    grantLockIdx_4;
  wire       [1:0]    _zz_wrGranted_4_1;
  wire                when_Axi4LiteCrossbar_l184_4;
  wire                when_Axi4LiteCrossbar_l297_4;
  wire                when_Axi4LiteCrossbar_l301_16;
  wire                when_Axi4LiteCrossbar_l308_16;
  wire                when_Axi4LiteCrossbar_l301_17;
  wire                when_Axi4LiteCrossbar_l308_17;
  wire                when_Axi4LiteCrossbar_l301_18;
  wire                when_Axi4LiteCrossbar_l308_18;
  wire                when_Axi4LiteCrossbar_l301_19;
  wire                when_Axi4LiteCrossbar_l308_19;
  wire                decErr_io_axi_aw_fire;
  wire                when_Axi4LiteCrossbar_l357_16;
  wire                when_Axi4LiteCrossbar_l358_16;
  wire                when_Axi4LiteCrossbar_l357_17;
  wire                when_Axi4LiteCrossbar_l358_17;
  wire                when_Axi4LiteCrossbar_l357_18;
  wire                when_Axi4LiteCrossbar_l358_18;
  wire                when_Axi4LiteCrossbar_l357_19;
  wire                when_Axi4LiteCrossbar_l358_19;
  wire                decErr_io_axi_b_fire;
  wire                decErr_io_axi_w_fire;
  wire                when_Axi4LiteCrossbar_l388;
  reg        [3:0]    _zz_when_Axi4LiteCrossbar_l400;
  reg        [3:0]    _zz_when_Axi4LiteCrossbar_l400_1;
  reg        [3:0]    _zz_when_Axi4LiteCrossbar_l400_2;
  reg        [3:0]    _zz_when_Axi4LiteCrossbar_l400_3;
  reg        [3:0]    _zz_when_Axi4LiteCrossbar_l400_4;
  wire       [3:0]    _zz_when_Axi4LiteCrossbar_l149_10;
  wire       [3:0]    _zz_when_Axi4LiteCrossbar_l149_11;
  reg        [1:0]    _zz_rdGranted_0;
  wire                when_Axi4LiteCrossbar_l149_20;
  wire                when_Axi4LiteCrossbar_l149_21;
  wire                when_Axi4LiteCrossbar_l149_22;
  wire                when_Axi4LiteCrossbar_l149_23;
  reg                 grantLock_5;
  reg        [1:0]    grantLockIdx_5;
  wire       [1:0]    _zz_rdGranted_0_1;
  wire                when_Axi4LiteCrossbar_l184_5;
  wire                when_Axi4LiteCrossbar_l400;
  wire                when_Axi4LiteCrossbar_l403;
  wire                when_Axi4LiteCrossbar_l403_1;
  wire                when_Axi4LiteCrossbar_l403_2;
  wire                when_Axi4LiteCrossbar_l403_3;
  wire                io_slaves_0_ar_fire;
  wire                when_Axi4LiteCrossbar_l446;
  wire                when_Axi4LiteCrossbar_l446_1;
  wire                when_Axi4LiteCrossbar_l446_2;
  wire                when_Axi4LiteCrossbar_l446_3;
  wire                io_slaves_0_r_fire;
  wire                when_Axi4LiteCrossbar_l388_1;
  reg        [3:0]    _zz_when_Axi4LiteCrossbar_l400_5;
  reg        [3:0]    _zz_when_Axi4LiteCrossbar_l400_6;
  reg        [3:0]    _zz_when_Axi4LiteCrossbar_l400_7;
  reg        [3:0]    _zz_when_Axi4LiteCrossbar_l400_8;
  reg        [3:0]    _zz_when_Axi4LiteCrossbar_l400_9;
  wire       [3:0]    _zz_when_Axi4LiteCrossbar_l149_12;
  wire       [3:0]    _zz_when_Axi4LiteCrossbar_l149_13;
  reg        [1:0]    _zz_rdGranted_1;
  wire                when_Axi4LiteCrossbar_l149_24;
  wire                when_Axi4LiteCrossbar_l149_25;
  wire                when_Axi4LiteCrossbar_l149_26;
  wire                when_Axi4LiteCrossbar_l149_27;
  reg                 grantLock_6;
  reg        [1:0]    grantLockIdx_6;
  wire       [1:0]    _zz_rdGranted_1_1;
  wire                when_Axi4LiteCrossbar_l184_6;
  wire                when_Axi4LiteCrossbar_l400_1;
  wire                when_Axi4LiteCrossbar_l403_4;
  wire                when_Axi4LiteCrossbar_l403_5;
  wire                when_Axi4LiteCrossbar_l403_6;
  wire                when_Axi4LiteCrossbar_l403_7;
  wire                io_slaves_1_ar_fire;
  wire                when_Axi4LiteCrossbar_l446_4;
  wire                when_Axi4LiteCrossbar_l446_5;
  wire                when_Axi4LiteCrossbar_l446_6;
  wire                when_Axi4LiteCrossbar_l446_7;
  wire                io_slaves_1_r_fire;
  wire                when_Axi4LiteCrossbar_l388_2;
  reg        [3:0]    _zz_when_Axi4LiteCrossbar_l400_10;
  reg        [3:0]    _zz_when_Axi4LiteCrossbar_l400_11;
  reg        [3:0]    _zz_when_Axi4LiteCrossbar_l400_12;
  reg        [3:0]    _zz_when_Axi4LiteCrossbar_l400_13;
  reg        [3:0]    _zz_when_Axi4LiteCrossbar_l400_14;
  wire       [3:0]    _zz_when_Axi4LiteCrossbar_l149_14;
  wire       [3:0]    _zz_when_Axi4LiteCrossbar_l149_15;
  reg        [1:0]    _zz_rdGranted_2;
  wire                when_Axi4LiteCrossbar_l149_28;
  wire                when_Axi4LiteCrossbar_l149_29;
  wire                when_Axi4LiteCrossbar_l149_30;
  wire                when_Axi4LiteCrossbar_l149_31;
  reg                 grantLock_7;
  reg        [1:0]    grantLockIdx_7;
  wire       [1:0]    _zz_rdGranted_2_1;
  wire                when_Axi4LiteCrossbar_l184_7;
  wire                when_Axi4LiteCrossbar_l400_2;
  wire                when_Axi4LiteCrossbar_l403_8;
  wire                when_Axi4LiteCrossbar_l403_9;
  wire                when_Axi4LiteCrossbar_l403_10;
  wire                when_Axi4LiteCrossbar_l403_11;
  wire                io_slaves_2_ar_fire;
  wire                when_Axi4LiteCrossbar_l446_8;
  wire                when_Axi4LiteCrossbar_l446_9;
  wire                when_Axi4LiteCrossbar_l446_10;
  wire                when_Axi4LiteCrossbar_l446_11;
  wire                io_slaves_2_r_fire;
  wire                when_Axi4LiteCrossbar_l388_3;
  reg        [3:0]    _zz_when_Axi4LiteCrossbar_l400_15;
  reg        [3:0]    _zz_when_Axi4LiteCrossbar_l400_16;
  reg        [3:0]    _zz_when_Axi4LiteCrossbar_l400_17;
  reg        [3:0]    _zz_when_Axi4LiteCrossbar_l400_18;
  reg        [3:0]    _zz_when_Axi4LiteCrossbar_l400_19;
  wire       [3:0]    _zz_when_Axi4LiteCrossbar_l149_16;
  wire       [3:0]    _zz_when_Axi4LiteCrossbar_l149_17;
  reg        [1:0]    _zz_rdGranted_3;
  wire                when_Axi4LiteCrossbar_l149_32;
  wire                when_Axi4LiteCrossbar_l149_33;
  wire                when_Axi4LiteCrossbar_l149_34;
  wire                when_Axi4LiteCrossbar_l149_35;
  reg                 grantLock_8;
  reg        [1:0]    grantLockIdx_8;
  wire       [1:0]    _zz_rdGranted_3_1;
  wire                when_Axi4LiteCrossbar_l184_8;
  wire                when_Axi4LiteCrossbar_l400_3;
  wire                when_Axi4LiteCrossbar_l403_12;
  wire                when_Axi4LiteCrossbar_l403_13;
  wire                when_Axi4LiteCrossbar_l403_14;
  wire                when_Axi4LiteCrossbar_l403_15;
  wire                io_slaves_3_ar_fire;
  wire                when_Axi4LiteCrossbar_l446_12;
  wire                when_Axi4LiteCrossbar_l446_13;
  wire                when_Axi4LiteCrossbar_l446_14;
  wire                when_Axi4LiteCrossbar_l446_15;
  wire                io_slaves_3_r_fire;
  wire                when_Axi4LiteCrossbar_l388_4;
  reg        [3:0]    _zz_when_Axi4LiteCrossbar_l400_20;
  reg        [3:0]    _zz_when_Axi4LiteCrossbar_l400_21;
  reg        [3:0]    _zz_when_Axi4LiteCrossbar_l400_22;
  reg        [3:0]    _zz_when_Axi4LiteCrossbar_l400_23;
  reg        [3:0]    _zz_when_Axi4LiteCrossbar_l400_24;
  wire       [3:0]    _zz_when_Axi4LiteCrossbar_l149_18;
  wire       [3:0]    _zz_when_Axi4LiteCrossbar_l149_19;
  reg        [1:0]    _zz_rdGranted_4;
  wire                when_Axi4LiteCrossbar_l149_36;
  wire                when_Axi4LiteCrossbar_l149_37;
  wire                when_Axi4LiteCrossbar_l149_38;
  wire                when_Axi4LiteCrossbar_l149_39;
  reg                 grantLock_9;
  reg        [1:0]    grantLockIdx_9;
  wire       [1:0]    _zz_rdGranted_4_1;
  wire                when_Axi4LiteCrossbar_l184_9;
  wire                when_Axi4LiteCrossbar_l400_4;
  wire                when_Axi4LiteCrossbar_l403_16;
  wire                when_Axi4LiteCrossbar_l403_17;
  wire                when_Axi4LiteCrossbar_l403_18;
  wire                when_Axi4LiteCrossbar_l403_19;
  wire                decErr_io_axi_ar_fire;
  wire                when_Axi4LiteCrossbar_l446_16;
  wire                when_Axi4LiteCrossbar_l446_17;
  wire                when_Axi4LiteCrossbar_l446_18;
  wire                when_Axi4LiteCrossbar_l446_19;
  wire                decErr_io_axi_r_fire;

  assign _zz_io_masters_0_b_payload_resp = 2'b00;
  assign _zz_io_masters_1_b_payload_resp = 2'b00;
  assign _zz_io_masters_2_b_payload_resp = 2'b00;
  assign _zz_io_masters_3_b_payload_resp = 2'b00;
  assign _zz__zz_when_Axi4LiteCrossbar_l297 = {(! (|_zz_when_Axi4LiteCrossbar_l297_1)),_zz_when_Axi4LiteCrossbar_l297_1};
  assign _zz__zz_when_Axi4LiteCrossbar_l297_5 = {(! (|_zz_when_Axi4LiteCrossbar_l297_2)),_zz_when_Axi4LiteCrossbar_l297_2};
  assign _zz__zz_when_Axi4LiteCrossbar_l297_6 = {(! (|_zz_when_Axi4LiteCrossbar_l297_3)),_zz_when_Axi4LiteCrossbar_l297_3};
  assign _zz__zz_when_Axi4LiteCrossbar_l297_7 = {(! (|_zz_when_Axi4LiteCrossbar_l297_4)),_zz_when_Axi4LiteCrossbar_l297_4};
  assign _zz__zz_when_Axi4LiteCrossbar_l149_1 = (_zz_when_Axi4LiteCrossbar_l149 - 4'b0001);
  assign _zz__zz_when_Axi4LiteCrossbar_l297_5_1 = {(! (|_zz_when_Axi4LiteCrossbar_l297_6)),_zz_when_Axi4LiteCrossbar_l297_6};
  assign _zz__zz_when_Axi4LiteCrossbar_l297_5_2 = {(! (|_zz_when_Axi4LiteCrossbar_l297_7)),_zz_when_Axi4LiteCrossbar_l297_7};
  assign _zz__zz_when_Axi4LiteCrossbar_l297_5_3 = {(! (|_zz_when_Axi4LiteCrossbar_l297_8)),_zz_when_Axi4LiteCrossbar_l297_8};
  assign _zz__zz_when_Axi4LiteCrossbar_l297_5_4 = {(! (|_zz_when_Axi4LiteCrossbar_l297_9)),_zz_when_Axi4LiteCrossbar_l297_9};
  assign _zz__zz_when_Axi4LiteCrossbar_l149_3 = (_zz_when_Axi4LiteCrossbar_l149_2 - 4'b0001);
  assign _zz__zz_when_Axi4LiteCrossbar_l297_10 = {(! (|_zz_when_Axi4LiteCrossbar_l297_11)),_zz_when_Axi4LiteCrossbar_l297_11};
  assign _zz__zz_when_Axi4LiteCrossbar_l297_10_1 = {(! (|_zz_when_Axi4LiteCrossbar_l297_12)),_zz_when_Axi4LiteCrossbar_l297_12};
  assign _zz__zz_when_Axi4LiteCrossbar_l297_10_2 = {(! (|_zz_when_Axi4LiteCrossbar_l297_13)),_zz_when_Axi4LiteCrossbar_l297_13};
  assign _zz__zz_when_Axi4LiteCrossbar_l297_10_3 = {(! (|_zz_when_Axi4LiteCrossbar_l297_14)),_zz_when_Axi4LiteCrossbar_l297_14};
  assign _zz__zz_when_Axi4LiteCrossbar_l149_5 = (_zz_when_Axi4LiteCrossbar_l149_4 - 4'b0001);
  assign _zz__zz_when_Axi4LiteCrossbar_l297_15 = {(! (|_zz_when_Axi4LiteCrossbar_l297_16)),_zz_when_Axi4LiteCrossbar_l297_16};
  assign _zz__zz_when_Axi4LiteCrossbar_l297_15_1 = {(! (|_zz_when_Axi4LiteCrossbar_l297_17)),_zz_when_Axi4LiteCrossbar_l297_17};
  assign _zz__zz_when_Axi4LiteCrossbar_l297_15_2 = {(! (|_zz_when_Axi4LiteCrossbar_l297_18)),_zz_when_Axi4LiteCrossbar_l297_18};
  assign _zz__zz_when_Axi4LiteCrossbar_l297_15_3 = {(! (|_zz_when_Axi4LiteCrossbar_l297_19)),_zz_when_Axi4LiteCrossbar_l297_19};
  assign _zz__zz_when_Axi4LiteCrossbar_l149_7 = (_zz_when_Axi4LiteCrossbar_l149_6 - 4'b0001);
  assign _zz__zz_when_Axi4LiteCrossbar_l297_20 = {(! (|_zz_when_Axi4LiteCrossbar_l297_21)),_zz_when_Axi4LiteCrossbar_l297_21};
  assign _zz__zz_when_Axi4LiteCrossbar_l297_20_1 = {(! (|_zz_when_Axi4LiteCrossbar_l297_22)),_zz_when_Axi4LiteCrossbar_l297_22};
  assign _zz__zz_when_Axi4LiteCrossbar_l297_20_2 = {(! (|_zz_when_Axi4LiteCrossbar_l297_23)),_zz_when_Axi4LiteCrossbar_l297_23};
  assign _zz__zz_when_Axi4LiteCrossbar_l297_20_3 = {(! (|_zz_when_Axi4LiteCrossbar_l297_24)),_zz_when_Axi4LiteCrossbar_l297_24};
  assign _zz__zz_when_Axi4LiteCrossbar_l149_9 = (_zz_when_Axi4LiteCrossbar_l149_8 - 4'b0001);
  assign _zz__zz_when_Axi4LiteCrossbar_l400 = {(! (|_zz_when_Axi4LiteCrossbar_l400_1)),_zz_when_Axi4LiteCrossbar_l400_1};
  assign _zz__zz_when_Axi4LiteCrossbar_l400_5 = {(! (|_zz_when_Axi4LiteCrossbar_l400_2)),_zz_when_Axi4LiteCrossbar_l400_2};
  assign _zz__zz_when_Axi4LiteCrossbar_l400_6 = {(! (|_zz_when_Axi4LiteCrossbar_l400_3)),_zz_when_Axi4LiteCrossbar_l400_3};
  assign _zz__zz_when_Axi4LiteCrossbar_l400_7 = {(! (|_zz_when_Axi4LiteCrossbar_l400_4)),_zz_when_Axi4LiteCrossbar_l400_4};
  assign _zz__zz_when_Axi4LiteCrossbar_l149_11 = (_zz_when_Axi4LiteCrossbar_l149_10 - 4'b0001);
  assign _zz__zz_when_Axi4LiteCrossbar_l400_5_1 = {(! (|_zz_when_Axi4LiteCrossbar_l400_6)),_zz_when_Axi4LiteCrossbar_l400_6};
  assign _zz__zz_when_Axi4LiteCrossbar_l400_5_2 = {(! (|_zz_when_Axi4LiteCrossbar_l400_7)),_zz_when_Axi4LiteCrossbar_l400_7};
  assign _zz__zz_when_Axi4LiteCrossbar_l400_5_3 = {(! (|_zz_when_Axi4LiteCrossbar_l400_8)),_zz_when_Axi4LiteCrossbar_l400_8};
  assign _zz__zz_when_Axi4LiteCrossbar_l400_5_4 = {(! (|_zz_when_Axi4LiteCrossbar_l400_9)),_zz_when_Axi4LiteCrossbar_l400_9};
  assign _zz__zz_when_Axi4LiteCrossbar_l149_13 = (_zz_when_Axi4LiteCrossbar_l149_12 - 4'b0001);
  assign _zz__zz_when_Axi4LiteCrossbar_l400_10 = {(! (|_zz_when_Axi4LiteCrossbar_l400_11)),_zz_when_Axi4LiteCrossbar_l400_11};
  assign _zz__zz_when_Axi4LiteCrossbar_l400_10_1 = {(! (|_zz_when_Axi4LiteCrossbar_l400_12)),_zz_when_Axi4LiteCrossbar_l400_12};
  assign _zz__zz_when_Axi4LiteCrossbar_l400_10_2 = {(! (|_zz_when_Axi4LiteCrossbar_l400_13)),_zz_when_Axi4LiteCrossbar_l400_13};
  assign _zz__zz_when_Axi4LiteCrossbar_l400_10_3 = {(! (|_zz_when_Axi4LiteCrossbar_l400_14)),_zz_when_Axi4LiteCrossbar_l400_14};
  assign _zz__zz_when_Axi4LiteCrossbar_l149_15 = (_zz_when_Axi4LiteCrossbar_l149_14 - 4'b0001);
  assign _zz__zz_when_Axi4LiteCrossbar_l400_15 = {(! (|_zz_when_Axi4LiteCrossbar_l400_16)),_zz_when_Axi4LiteCrossbar_l400_16};
  assign _zz__zz_when_Axi4LiteCrossbar_l400_15_1 = {(! (|_zz_when_Axi4LiteCrossbar_l400_17)),_zz_when_Axi4LiteCrossbar_l400_17};
  assign _zz__zz_when_Axi4LiteCrossbar_l400_15_2 = {(! (|_zz_when_Axi4LiteCrossbar_l400_18)),_zz_when_Axi4LiteCrossbar_l400_18};
  assign _zz__zz_when_Axi4LiteCrossbar_l400_15_3 = {(! (|_zz_when_Axi4LiteCrossbar_l400_19)),_zz_when_Axi4LiteCrossbar_l400_19};
  assign _zz__zz_when_Axi4LiteCrossbar_l149_17 = (_zz_when_Axi4LiteCrossbar_l149_16 - 4'b0001);
  assign _zz__zz_when_Axi4LiteCrossbar_l400_20 = {(! (|_zz_when_Axi4LiteCrossbar_l400_21)),_zz_when_Axi4LiteCrossbar_l400_21};
  assign _zz__zz_when_Axi4LiteCrossbar_l400_20_1 = {(! (|_zz_when_Axi4LiteCrossbar_l400_22)),_zz_when_Axi4LiteCrossbar_l400_22};
  assign _zz__zz_when_Axi4LiteCrossbar_l400_20_2 = {(! (|_zz_when_Axi4LiteCrossbar_l400_23)),_zz_when_Axi4LiteCrossbar_l400_23};
  assign _zz__zz_when_Axi4LiteCrossbar_l400_20_3 = {(! (|_zz_when_Axi4LiteCrossbar_l400_24)),_zz_when_Axi4LiteCrossbar_l400_24};
  assign _zz__zz_when_Axi4LiteCrossbar_l149_19 = (_zz_when_Axi4LiteCrossbar_l149_18 - 4'b0001);
  assign _zz__zz_when_Axi4LiteCrossbar_l297_1 = 2'b00;
  assign _zz__zz_when_Axi4LiteCrossbar_l297_2 = 2'b00;
  assign _zz__zz_when_Axi4LiteCrossbar_l297_3 = 2'b00;
  assign _zz__zz_when_Axi4LiteCrossbar_l297_4 = 2'b00;
  assign _zz__zz_when_Axi4LiteCrossbar_l400_1 = 2'b00;
  assign _zz__zz_when_Axi4LiteCrossbar_l400_2 = 2'b00;
  assign _zz__zz_when_Axi4LiteCrossbar_l400_3 = 2'b00;
  assign _zz__zz_when_Axi4LiteCrossbar_l400_4 = 2'b00;
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
        if(when_Axi4LiteCrossbar_l301_4) begin
          io_masters_0_aw_ready = io_slaves_1_aw_ready;
        end
      end
    end
    if(when_Axi4LiteCrossbar_l284_2) begin
      if(when_Axi4LiteCrossbar_l297_2) begin
        if(when_Axi4LiteCrossbar_l301_8) begin
          io_masters_0_aw_ready = io_slaves_2_aw_ready;
        end
      end
    end
    if(when_Axi4LiteCrossbar_l284_3) begin
      if(when_Axi4LiteCrossbar_l297_3) begin
        if(when_Axi4LiteCrossbar_l301_12) begin
          io_masters_0_aw_ready = io_slaves_3_aw_ready;
        end
      end
    end
    if(when_Axi4LiteCrossbar_l284_4) begin
      if(when_Axi4LiteCrossbar_l297_4) begin
        if(when_Axi4LiteCrossbar_l301_16) begin
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
        if(when_Axi4LiteCrossbar_l301_4) begin
          if(when_Axi4LiteCrossbar_l308_4) begin
            io_masters_0_w_ready = io_slaves_1_w_ready;
          end
        end
      end
    end else begin
      if(when_Axi4LiteCrossbar_l357_4) begin
        if(when_Axi4LiteCrossbar_l358_4) begin
          io_masters_0_w_ready = io_slaves_1_w_ready;
        end
      end
    end
    if(when_Axi4LiteCrossbar_l284_2) begin
      if(when_Axi4LiteCrossbar_l297_2) begin
        if(when_Axi4LiteCrossbar_l301_8) begin
          if(when_Axi4LiteCrossbar_l308_8) begin
            io_masters_0_w_ready = io_slaves_2_w_ready;
          end
        end
      end
    end else begin
      if(when_Axi4LiteCrossbar_l357_8) begin
        if(when_Axi4LiteCrossbar_l358_8) begin
          io_masters_0_w_ready = io_slaves_2_w_ready;
        end
      end
    end
    if(when_Axi4LiteCrossbar_l284_3) begin
      if(when_Axi4LiteCrossbar_l297_3) begin
        if(when_Axi4LiteCrossbar_l301_12) begin
          if(when_Axi4LiteCrossbar_l308_12) begin
            io_masters_0_w_ready = io_slaves_3_w_ready;
          end
        end
      end
    end else begin
      if(when_Axi4LiteCrossbar_l357_12) begin
        if(when_Axi4LiteCrossbar_l358_12) begin
          io_masters_0_w_ready = io_slaves_3_w_ready;
        end
      end
    end
    if(when_Axi4LiteCrossbar_l284_4) begin
      if(when_Axi4LiteCrossbar_l297_4) begin
        if(when_Axi4LiteCrossbar_l301_16) begin
          if(when_Axi4LiteCrossbar_l308_16) begin
            io_masters_0_w_ready = decErr_io_axi_w_ready;
          end
        end
      end
    end else begin
      if(when_Axi4LiteCrossbar_l357_16) begin
        if(when_Axi4LiteCrossbar_l358_16) begin
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
      if(when_Axi4LiteCrossbar_l357_4) begin
        io_masters_0_b_valid = io_slaves_1_b_valid;
      end
    end
    if(!when_Axi4LiteCrossbar_l284_2) begin
      if(when_Axi4LiteCrossbar_l357_8) begin
        io_masters_0_b_valid = io_slaves_2_b_valid;
      end
    end
    if(!when_Axi4LiteCrossbar_l284_3) begin
      if(when_Axi4LiteCrossbar_l357_12) begin
        io_masters_0_b_valid = io_slaves_3_b_valid;
      end
    end
    if(!when_Axi4LiteCrossbar_l284_4) begin
      if(when_Axi4LiteCrossbar_l357_16) begin
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
      if(when_Axi4LiteCrossbar_l357_4) begin
        io_masters_0_b_payload_resp = io_slaves_1_b_payload_resp;
      end
    end
    if(!when_Axi4LiteCrossbar_l284_2) begin
      if(when_Axi4LiteCrossbar_l357_8) begin
        io_masters_0_b_payload_resp = io_slaves_2_b_payload_resp;
      end
    end
    if(!when_Axi4LiteCrossbar_l284_3) begin
      if(when_Axi4LiteCrossbar_l357_12) begin
        io_masters_0_b_payload_resp = io_slaves_3_b_payload_resp;
      end
    end
    if(!when_Axi4LiteCrossbar_l284_4) begin
      if(when_Axi4LiteCrossbar_l357_16) begin
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
        if(when_Axi4LiteCrossbar_l403_4) begin
          io_masters_0_ar_ready = io_slaves_1_ar_ready;
        end
      end
    end
    if(when_Axi4LiteCrossbar_l388_2) begin
      if(when_Axi4LiteCrossbar_l400_2) begin
        if(when_Axi4LiteCrossbar_l403_8) begin
          io_masters_0_ar_ready = io_slaves_2_ar_ready;
        end
      end
    end
    if(when_Axi4LiteCrossbar_l388_3) begin
      if(when_Axi4LiteCrossbar_l400_3) begin
        if(when_Axi4LiteCrossbar_l403_12) begin
          io_masters_0_ar_ready = io_slaves_3_ar_ready;
        end
      end
    end
    if(when_Axi4LiteCrossbar_l388_4) begin
      if(when_Axi4LiteCrossbar_l400_4) begin
        if(when_Axi4LiteCrossbar_l403_16) begin
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
      if(when_Axi4LiteCrossbar_l446_4) begin
        io_masters_0_r_valid = io_slaves_1_r_valid;
      end
    end
    if(!when_Axi4LiteCrossbar_l388_2) begin
      if(when_Axi4LiteCrossbar_l446_8) begin
        io_masters_0_r_valid = io_slaves_2_r_valid;
      end
    end
    if(!when_Axi4LiteCrossbar_l388_3) begin
      if(when_Axi4LiteCrossbar_l446_12) begin
        io_masters_0_r_valid = io_slaves_3_r_valid;
      end
    end
    if(!when_Axi4LiteCrossbar_l388_4) begin
      if(when_Axi4LiteCrossbar_l446_16) begin
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
      if(when_Axi4LiteCrossbar_l446_4) begin
        io_masters_0_r_payload_data = io_slaves_1_r_payload_data;
      end
    end
    if(!when_Axi4LiteCrossbar_l388_2) begin
      if(when_Axi4LiteCrossbar_l446_8) begin
        io_masters_0_r_payload_data = io_slaves_2_r_payload_data;
      end
    end
    if(!when_Axi4LiteCrossbar_l388_3) begin
      if(when_Axi4LiteCrossbar_l446_12) begin
        io_masters_0_r_payload_data = io_slaves_3_r_payload_data;
      end
    end
    if(!when_Axi4LiteCrossbar_l388_4) begin
      if(when_Axi4LiteCrossbar_l446_16) begin
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
      if(when_Axi4LiteCrossbar_l446_4) begin
        io_masters_0_r_payload_resp = io_slaves_1_r_payload_resp;
      end
    end
    if(!when_Axi4LiteCrossbar_l388_2) begin
      if(when_Axi4LiteCrossbar_l446_8) begin
        io_masters_0_r_payload_resp = io_slaves_2_r_payload_resp;
      end
    end
    if(!when_Axi4LiteCrossbar_l388_3) begin
      if(when_Axi4LiteCrossbar_l446_12) begin
        io_masters_0_r_payload_resp = io_slaves_3_r_payload_resp;
      end
    end
    if(!when_Axi4LiteCrossbar_l388_4) begin
      if(when_Axi4LiteCrossbar_l446_16) begin
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
        if(when_Axi4LiteCrossbar_l301_5) begin
          io_masters_1_aw_ready = io_slaves_1_aw_ready;
        end
      end
    end
    if(when_Axi4LiteCrossbar_l284_2) begin
      if(when_Axi4LiteCrossbar_l297_2) begin
        if(when_Axi4LiteCrossbar_l301_9) begin
          io_masters_1_aw_ready = io_slaves_2_aw_ready;
        end
      end
    end
    if(when_Axi4LiteCrossbar_l284_3) begin
      if(when_Axi4LiteCrossbar_l297_3) begin
        if(when_Axi4LiteCrossbar_l301_13) begin
          io_masters_1_aw_ready = io_slaves_3_aw_ready;
        end
      end
    end
    if(when_Axi4LiteCrossbar_l284_4) begin
      if(when_Axi4LiteCrossbar_l297_4) begin
        if(when_Axi4LiteCrossbar_l301_17) begin
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
        if(when_Axi4LiteCrossbar_l301_5) begin
          if(when_Axi4LiteCrossbar_l308_5) begin
            io_masters_1_w_ready = io_slaves_1_w_ready;
          end
        end
      end
    end else begin
      if(when_Axi4LiteCrossbar_l357_5) begin
        if(when_Axi4LiteCrossbar_l358_5) begin
          io_masters_1_w_ready = io_slaves_1_w_ready;
        end
      end
    end
    if(when_Axi4LiteCrossbar_l284_2) begin
      if(when_Axi4LiteCrossbar_l297_2) begin
        if(when_Axi4LiteCrossbar_l301_9) begin
          if(when_Axi4LiteCrossbar_l308_9) begin
            io_masters_1_w_ready = io_slaves_2_w_ready;
          end
        end
      end
    end else begin
      if(when_Axi4LiteCrossbar_l357_9) begin
        if(when_Axi4LiteCrossbar_l358_9) begin
          io_masters_1_w_ready = io_slaves_2_w_ready;
        end
      end
    end
    if(when_Axi4LiteCrossbar_l284_3) begin
      if(when_Axi4LiteCrossbar_l297_3) begin
        if(when_Axi4LiteCrossbar_l301_13) begin
          if(when_Axi4LiteCrossbar_l308_13) begin
            io_masters_1_w_ready = io_slaves_3_w_ready;
          end
        end
      end
    end else begin
      if(when_Axi4LiteCrossbar_l357_13) begin
        if(when_Axi4LiteCrossbar_l358_13) begin
          io_masters_1_w_ready = io_slaves_3_w_ready;
        end
      end
    end
    if(when_Axi4LiteCrossbar_l284_4) begin
      if(when_Axi4LiteCrossbar_l297_4) begin
        if(when_Axi4LiteCrossbar_l301_17) begin
          if(when_Axi4LiteCrossbar_l308_17) begin
            io_masters_1_w_ready = decErr_io_axi_w_ready;
          end
        end
      end
    end else begin
      if(when_Axi4LiteCrossbar_l357_17) begin
        if(when_Axi4LiteCrossbar_l358_17) begin
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
      if(when_Axi4LiteCrossbar_l357_5) begin
        io_masters_1_b_valid = io_slaves_1_b_valid;
      end
    end
    if(!when_Axi4LiteCrossbar_l284_2) begin
      if(when_Axi4LiteCrossbar_l357_9) begin
        io_masters_1_b_valid = io_slaves_2_b_valid;
      end
    end
    if(!when_Axi4LiteCrossbar_l284_3) begin
      if(when_Axi4LiteCrossbar_l357_13) begin
        io_masters_1_b_valid = io_slaves_3_b_valid;
      end
    end
    if(!when_Axi4LiteCrossbar_l284_4) begin
      if(when_Axi4LiteCrossbar_l357_17) begin
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
      if(when_Axi4LiteCrossbar_l357_5) begin
        io_masters_1_b_payload_resp = io_slaves_1_b_payload_resp;
      end
    end
    if(!when_Axi4LiteCrossbar_l284_2) begin
      if(when_Axi4LiteCrossbar_l357_9) begin
        io_masters_1_b_payload_resp = io_slaves_2_b_payload_resp;
      end
    end
    if(!when_Axi4LiteCrossbar_l284_3) begin
      if(when_Axi4LiteCrossbar_l357_13) begin
        io_masters_1_b_payload_resp = io_slaves_3_b_payload_resp;
      end
    end
    if(!when_Axi4LiteCrossbar_l284_4) begin
      if(when_Axi4LiteCrossbar_l357_17) begin
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
        if(when_Axi4LiteCrossbar_l403_5) begin
          io_masters_1_ar_ready = io_slaves_1_ar_ready;
        end
      end
    end
    if(when_Axi4LiteCrossbar_l388_2) begin
      if(when_Axi4LiteCrossbar_l400_2) begin
        if(when_Axi4LiteCrossbar_l403_9) begin
          io_masters_1_ar_ready = io_slaves_2_ar_ready;
        end
      end
    end
    if(when_Axi4LiteCrossbar_l388_3) begin
      if(when_Axi4LiteCrossbar_l400_3) begin
        if(when_Axi4LiteCrossbar_l403_13) begin
          io_masters_1_ar_ready = io_slaves_3_ar_ready;
        end
      end
    end
    if(when_Axi4LiteCrossbar_l388_4) begin
      if(when_Axi4LiteCrossbar_l400_4) begin
        if(when_Axi4LiteCrossbar_l403_17) begin
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
      if(when_Axi4LiteCrossbar_l446_5) begin
        io_masters_1_r_valid = io_slaves_1_r_valid;
      end
    end
    if(!when_Axi4LiteCrossbar_l388_2) begin
      if(when_Axi4LiteCrossbar_l446_9) begin
        io_masters_1_r_valid = io_slaves_2_r_valid;
      end
    end
    if(!when_Axi4LiteCrossbar_l388_3) begin
      if(when_Axi4LiteCrossbar_l446_13) begin
        io_masters_1_r_valid = io_slaves_3_r_valid;
      end
    end
    if(!when_Axi4LiteCrossbar_l388_4) begin
      if(when_Axi4LiteCrossbar_l446_17) begin
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
      if(when_Axi4LiteCrossbar_l446_5) begin
        io_masters_1_r_payload_data = io_slaves_1_r_payload_data;
      end
    end
    if(!when_Axi4LiteCrossbar_l388_2) begin
      if(when_Axi4LiteCrossbar_l446_9) begin
        io_masters_1_r_payload_data = io_slaves_2_r_payload_data;
      end
    end
    if(!when_Axi4LiteCrossbar_l388_3) begin
      if(when_Axi4LiteCrossbar_l446_13) begin
        io_masters_1_r_payload_data = io_slaves_3_r_payload_data;
      end
    end
    if(!when_Axi4LiteCrossbar_l388_4) begin
      if(when_Axi4LiteCrossbar_l446_17) begin
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
      if(when_Axi4LiteCrossbar_l446_5) begin
        io_masters_1_r_payload_resp = io_slaves_1_r_payload_resp;
      end
    end
    if(!when_Axi4LiteCrossbar_l388_2) begin
      if(when_Axi4LiteCrossbar_l446_9) begin
        io_masters_1_r_payload_resp = io_slaves_2_r_payload_resp;
      end
    end
    if(!when_Axi4LiteCrossbar_l388_3) begin
      if(when_Axi4LiteCrossbar_l446_13) begin
        io_masters_1_r_payload_resp = io_slaves_3_r_payload_resp;
      end
    end
    if(!when_Axi4LiteCrossbar_l388_4) begin
      if(when_Axi4LiteCrossbar_l446_17) begin
        io_masters_1_r_payload_resp = decErr_io_axi_r_payload_resp;
      end
    end
  end

  always @(*) begin
    io_masters_2_aw_ready = 1'b0;
    if(when_Axi4LiteCrossbar_l284) begin
      if(when_Axi4LiteCrossbar_l297) begin
        if(when_Axi4LiteCrossbar_l301_2) begin
          io_masters_2_aw_ready = io_slaves_0_aw_ready;
        end
      end
    end
    if(when_Axi4LiteCrossbar_l284_1) begin
      if(when_Axi4LiteCrossbar_l297_1) begin
        if(when_Axi4LiteCrossbar_l301_6) begin
          io_masters_2_aw_ready = io_slaves_1_aw_ready;
        end
      end
    end
    if(when_Axi4LiteCrossbar_l284_2) begin
      if(when_Axi4LiteCrossbar_l297_2) begin
        if(when_Axi4LiteCrossbar_l301_10) begin
          io_masters_2_aw_ready = io_slaves_2_aw_ready;
        end
      end
    end
    if(when_Axi4LiteCrossbar_l284_3) begin
      if(when_Axi4LiteCrossbar_l297_3) begin
        if(when_Axi4LiteCrossbar_l301_14) begin
          io_masters_2_aw_ready = io_slaves_3_aw_ready;
        end
      end
    end
    if(when_Axi4LiteCrossbar_l284_4) begin
      if(when_Axi4LiteCrossbar_l297_4) begin
        if(when_Axi4LiteCrossbar_l301_18) begin
          io_masters_2_aw_ready = decErr_io_axi_aw_ready;
        end
      end
    end
  end

  always @(*) begin
    io_masters_2_w_ready = 1'b0;
    if(when_Axi4LiteCrossbar_l284) begin
      if(when_Axi4LiteCrossbar_l297) begin
        if(when_Axi4LiteCrossbar_l301_2) begin
          if(when_Axi4LiteCrossbar_l308_2) begin
            io_masters_2_w_ready = io_slaves_0_w_ready;
          end
        end
      end
    end else begin
      if(when_Axi4LiteCrossbar_l357_2) begin
        if(when_Axi4LiteCrossbar_l358_2) begin
          io_masters_2_w_ready = io_slaves_0_w_ready;
        end
      end
    end
    if(when_Axi4LiteCrossbar_l284_1) begin
      if(when_Axi4LiteCrossbar_l297_1) begin
        if(when_Axi4LiteCrossbar_l301_6) begin
          if(when_Axi4LiteCrossbar_l308_6) begin
            io_masters_2_w_ready = io_slaves_1_w_ready;
          end
        end
      end
    end else begin
      if(when_Axi4LiteCrossbar_l357_6) begin
        if(when_Axi4LiteCrossbar_l358_6) begin
          io_masters_2_w_ready = io_slaves_1_w_ready;
        end
      end
    end
    if(when_Axi4LiteCrossbar_l284_2) begin
      if(when_Axi4LiteCrossbar_l297_2) begin
        if(when_Axi4LiteCrossbar_l301_10) begin
          if(when_Axi4LiteCrossbar_l308_10) begin
            io_masters_2_w_ready = io_slaves_2_w_ready;
          end
        end
      end
    end else begin
      if(when_Axi4LiteCrossbar_l357_10) begin
        if(when_Axi4LiteCrossbar_l358_10) begin
          io_masters_2_w_ready = io_slaves_2_w_ready;
        end
      end
    end
    if(when_Axi4LiteCrossbar_l284_3) begin
      if(when_Axi4LiteCrossbar_l297_3) begin
        if(when_Axi4LiteCrossbar_l301_14) begin
          if(when_Axi4LiteCrossbar_l308_14) begin
            io_masters_2_w_ready = io_slaves_3_w_ready;
          end
        end
      end
    end else begin
      if(when_Axi4LiteCrossbar_l357_14) begin
        if(when_Axi4LiteCrossbar_l358_14) begin
          io_masters_2_w_ready = io_slaves_3_w_ready;
        end
      end
    end
    if(when_Axi4LiteCrossbar_l284_4) begin
      if(when_Axi4LiteCrossbar_l297_4) begin
        if(when_Axi4LiteCrossbar_l301_18) begin
          if(when_Axi4LiteCrossbar_l308_18) begin
            io_masters_2_w_ready = decErr_io_axi_w_ready;
          end
        end
      end
    end else begin
      if(when_Axi4LiteCrossbar_l357_18) begin
        if(when_Axi4LiteCrossbar_l358_18) begin
          io_masters_2_w_ready = decErr_io_axi_w_ready;
        end
      end
    end
  end

  always @(*) begin
    io_masters_2_b_valid = 1'b0;
    if(!when_Axi4LiteCrossbar_l284) begin
      if(when_Axi4LiteCrossbar_l357_2) begin
        io_masters_2_b_valid = io_slaves_0_b_valid;
      end
    end
    if(!when_Axi4LiteCrossbar_l284_1) begin
      if(when_Axi4LiteCrossbar_l357_6) begin
        io_masters_2_b_valid = io_slaves_1_b_valid;
      end
    end
    if(!when_Axi4LiteCrossbar_l284_2) begin
      if(when_Axi4LiteCrossbar_l357_10) begin
        io_masters_2_b_valid = io_slaves_2_b_valid;
      end
    end
    if(!when_Axi4LiteCrossbar_l284_3) begin
      if(when_Axi4LiteCrossbar_l357_14) begin
        io_masters_2_b_valid = io_slaves_3_b_valid;
      end
    end
    if(!when_Axi4LiteCrossbar_l284_4) begin
      if(when_Axi4LiteCrossbar_l357_18) begin
        io_masters_2_b_valid = decErr_io_axi_b_valid;
      end
    end
  end

  always @(*) begin
    io_masters_2_b_payload_resp = _zz_io_masters_2_b_payload_resp[1 : 0];
    if(!when_Axi4LiteCrossbar_l284) begin
      if(when_Axi4LiteCrossbar_l357_2) begin
        io_masters_2_b_payload_resp = io_slaves_0_b_payload_resp;
      end
    end
    if(!when_Axi4LiteCrossbar_l284_1) begin
      if(when_Axi4LiteCrossbar_l357_6) begin
        io_masters_2_b_payload_resp = io_slaves_1_b_payload_resp;
      end
    end
    if(!when_Axi4LiteCrossbar_l284_2) begin
      if(when_Axi4LiteCrossbar_l357_10) begin
        io_masters_2_b_payload_resp = io_slaves_2_b_payload_resp;
      end
    end
    if(!when_Axi4LiteCrossbar_l284_3) begin
      if(when_Axi4LiteCrossbar_l357_14) begin
        io_masters_2_b_payload_resp = io_slaves_3_b_payload_resp;
      end
    end
    if(!when_Axi4LiteCrossbar_l284_4) begin
      if(when_Axi4LiteCrossbar_l357_18) begin
        io_masters_2_b_payload_resp = decErr_io_axi_b_payload_resp;
      end
    end
  end

  always @(*) begin
    io_masters_2_ar_ready = 1'b0;
    if(when_Axi4LiteCrossbar_l388) begin
      if(when_Axi4LiteCrossbar_l400) begin
        if(when_Axi4LiteCrossbar_l403_2) begin
          io_masters_2_ar_ready = io_slaves_0_ar_ready;
        end
      end
    end
    if(when_Axi4LiteCrossbar_l388_1) begin
      if(when_Axi4LiteCrossbar_l400_1) begin
        if(when_Axi4LiteCrossbar_l403_6) begin
          io_masters_2_ar_ready = io_slaves_1_ar_ready;
        end
      end
    end
    if(when_Axi4LiteCrossbar_l388_2) begin
      if(when_Axi4LiteCrossbar_l400_2) begin
        if(when_Axi4LiteCrossbar_l403_10) begin
          io_masters_2_ar_ready = io_slaves_2_ar_ready;
        end
      end
    end
    if(when_Axi4LiteCrossbar_l388_3) begin
      if(when_Axi4LiteCrossbar_l400_3) begin
        if(when_Axi4LiteCrossbar_l403_14) begin
          io_masters_2_ar_ready = io_slaves_3_ar_ready;
        end
      end
    end
    if(when_Axi4LiteCrossbar_l388_4) begin
      if(when_Axi4LiteCrossbar_l400_4) begin
        if(when_Axi4LiteCrossbar_l403_18) begin
          io_masters_2_ar_ready = decErr_io_axi_ar_ready;
        end
      end
    end
  end

  always @(*) begin
    io_masters_2_r_valid = 1'b0;
    if(!when_Axi4LiteCrossbar_l388) begin
      if(when_Axi4LiteCrossbar_l446_2) begin
        io_masters_2_r_valid = io_slaves_0_r_valid;
      end
    end
    if(!when_Axi4LiteCrossbar_l388_1) begin
      if(when_Axi4LiteCrossbar_l446_6) begin
        io_masters_2_r_valid = io_slaves_1_r_valid;
      end
    end
    if(!when_Axi4LiteCrossbar_l388_2) begin
      if(when_Axi4LiteCrossbar_l446_10) begin
        io_masters_2_r_valid = io_slaves_2_r_valid;
      end
    end
    if(!when_Axi4LiteCrossbar_l388_3) begin
      if(when_Axi4LiteCrossbar_l446_14) begin
        io_masters_2_r_valid = io_slaves_3_r_valid;
      end
    end
    if(!when_Axi4LiteCrossbar_l388_4) begin
      if(when_Axi4LiteCrossbar_l446_18) begin
        io_masters_2_r_valid = decErr_io_axi_r_valid;
      end
    end
  end

  assign _zz_io_masters_2_r_payload_data = 34'h0;
  always @(*) begin
    io_masters_2_r_payload_data = _zz_io_masters_2_r_payload_data[31 : 0];
    if(!when_Axi4LiteCrossbar_l388) begin
      if(when_Axi4LiteCrossbar_l446_2) begin
        io_masters_2_r_payload_data = io_slaves_0_r_payload_data;
      end
    end
    if(!when_Axi4LiteCrossbar_l388_1) begin
      if(when_Axi4LiteCrossbar_l446_6) begin
        io_masters_2_r_payload_data = io_slaves_1_r_payload_data;
      end
    end
    if(!when_Axi4LiteCrossbar_l388_2) begin
      if(when_Axi4LiteCrossbar_l446_10) begin
        io_masters_2_r_payload_data = io_slaves_2_r_payload_data;
      end
    end
    if(!when_Axi4LiteCrossbar_l388_3) begin
      if(when_Axi4LiteCrossbar_l446_14) begin
        io_masters_2_r_payload_data = io_slaves_3_r_payload_data;
      end
    end
    if(!when_Axi4LiteCrossbar_l388_4) begin
      if(when_Axi4LiteCrossbar_l446_18) begin
        io_masters_2_r_payload_data = decErr_io_axi_r_payload_data;
      end
    end
  end

  always @(*) begin
    io_masters_2_r_payload_resp = _zz_io_masters_2_r_payload_data[33 : 32];
    if(!when_Axi4LiteCrossbar_l388) begin
      if(when_Axi4LiteCrossbar_l446_2) begin
        io_masters_2_r_payload_resp = io_slaves_0_r_payload_resp;
      end
    end
    if(!when_Axi4LiteCrossbar_l388_1) begin
      if(when_Axi4LiteCrossbar_l446_6) begin
        io_masters_2_r_payload_resp = io_slaves_1_r_payload_resp;
      end
    end
    if(!when_Axi4LiteCrossbar_l388_2) begin
      if(when_Axi4LiteCrossbar_l446_10) begin
        io_masters_2_r_payload_resp = io_slaves_2_r_payload_resp;
      end
    end
    if(!when_Axi4LiteCrossbar_l388_3) begin
      if(when_Axi4LiteCrossbar_l446_14) begin
        io_masters_2_r_payload_resp = io_slaves_3_r_payload_resp;
      end
    end
    if(!when_Axi4LiteCrossbar_l388_4) begin
      if(when_Axi4LiteCrossbar_l446_18) begin
        io_masters_2_r_payload_resp = decErr_io_axi_r_payload_resp;
      end
    end
  end

  always @(*) begin
    io_masters_3_aw_ready = 1'b0;
    if(when_Axi4LiteCrossbar_l284) begin
      if(when_Axi4LiteCrossbar_l297) begin
        if(when_Axi4LiteCrossbar_l301_3) begin
          io_masters_3_aw_ready = io_slaves_0_aw_ready;
        end
      end
    end
    if(when_Axi4LiteCrossbar_l284_1) begin
      if(when_Axi4LiteCrossbar_l297_1) begin
        if(when_Axi4LiteCrossbar_l301_7) begin
          io_masters_3_aw_ready = io_slaves_1_aw_ready;
        end
      end
    end
    if(when_Axi4LiteCrossbar_l284_2) begin
      if(when_Axi4LiteCrossbar_l297_2) begin
        if(when_Axi4LiteCrossbar_l301_11) begin
          io_masters_3_aw_ready = io_slaves_2_aw_ready;
        end
      end
    end
    if(when_Axi4LiteCrossbar_l284_3) begin
      if(when_Axi4LiteCrossbar_l297_3) begin
        if(when_Axi4LiteCrossbar_l301_15) begin
          io_masters_3_aw_ready = io_slaves_3_aw_ready;
        end
      end
    end
    if(when_Axi4LiteCrossbar_l284_4) begin
      if(when_Axi4LiteCrossbar_l297_4) begin
        if(when_Axi4LiteCrossbar_l301_19) begin
          io_masters_3_aw_ready = decErr_io_axi_aw_ready;
        end
      end
    end
  end

  always @(*) begin
    io_masters_3_w_ready = 1'b0;
    if(when_Axi4LiteCrossbar_l284) begin
      if(when_Axi4LiteCrossbar_l297) begin
        if(when_Axi4LiteCrossbar_l301_3) begin
          if(when_Axi4LiteCrossbar_l308_3) begin
            io_masters_3_w_ready = io_slaves_0_w_ready;
          end
        end
      end
    end else begin
      if(when_Axi4LiteCrossbar_l357_3) begin
        if(when_Axi4LiteCrossbar_l358_3) begin
          io_masters_3_w_ready = io_slaves_0_w_ready;
        end
      end
    end
    if(when_Axi4LiteCrossbar_l284_1) begin
      if(when_Axi4LiteCrossbar_l297_1) begin
        if(when_Axi4LiteCrossbar_l301_7) begin
          if(when_Axi4LiteCrossbar_l308_7) begin
            io_masters_3_w_ready = io_slaves_1_w_ready;
          end
        end
      end
    end else begin
      if(when_Axi4LiteCrossbar_l357_7) begin
        if(when_Axi4LiteCrossbar_l358_7) begin
          io_masters_3_w_ready = io_slaves_1_w_ready;
        end
      end
    end
    if(when_Axi4LiteCrossbar_l284_2) begin
      if(when_Axi4LiteCrossbar_l297_2) begin
        if(when_Axi4LiteCrossbar_l301_11) begin
          if(when_Axi4LiteCrossbar_l308_11) begin
            io_masters_3_w_ready = io_slaves_2_w_ready;
          end
        end
      end
    end else begin
      if(when_Axi4LiteCrossbar_l357_11) begin
        if(when_Axi4LiteCrossbar_l358_11) begin
          io_masters_3_w_ready = io_slaves_2_w_ready;
        end
      end
    end
    if(when_Axi4LiteCrossbar_l284_3) begin
      if(when_Axi4LiteCrossbar_l297_3) begin
        if(when_Axi4LiteCrossbar_l301_15) begin
          if(when_Axi4LiteCrossbar_l308_15) begin
            io_masters_3_w_ready = io_slaves_3_w_ready;
          end
        end
      end
    end else begin
      if(when_Axi4LiteCrossbar_l357_15) begin
        if(when_Axi4LiteCrossbar_l358_15) begin
          io_masters_3_w_ready = io_slaves_3_w_ready;
        end
      end
    end
    if(when_Axi4LiteCrossbar_l284_4) begin
      if(when_Axi4LiteCrossbar_l297_4) begin
        if(when_Axi4LiteCrossbar_l301_19) begin
          if(when_Axi4LiteCrossbar_l308_19) begin
            io_masters_3_w_ready = decErr_io_axi_w_ready;
          end
        end
      end
    end else begin
      if(when_Axi4LiteCrossbar_l357_19) begin
        if(when_Axi4LiteCrossbar_l358_19) begin
          io_masters_3_w_ready = decErr_io_axi_w_ready;
        end
      end
    end
  end

  always @(*) begin
    io_masters_3_b_valid = 1'b0;
    if(!when_Axi4LiteCrossbar_l284) begin
      if(when_Axi4LiteCrossbar_l357_3) begin
        io_masters_3_b_valid = io_slaves_0_b_valid;
      end
    end
    if(!when_Axi4LiteCrossbar_l284_1) begin
      if(when_Axi4LiteCrossbar_l357_7) begin
        io_masters_3_b_valid = io_slaves_1_b_valid;
      end
    end
    if(!when_Axi4LiteCrossbar_l284_2) begin
      if(when_Axi4LiteCrossbar_l357_11) begin
        io_masters_3_b_valid = io_slaves_2_b_valid;
      end
    end
    if(!when_Axi4LiteCrossbar_l284_3) begin
      if(when_Axi4LiteCrossbar_l357_15) begin
        io_masters_3_b_valid = io_slaves_3_b_valid;
      end
    end
    if(!when_Axi4LiteCrossbar_l284_4) begin
      if(when_Axi4LiteCrossbar_l357_19) begin
        io_masters_3_b_valid = decErr_io_axi_b_valid;
      end
    end
  end

  always @(*) begin
    io_masters_3_b_payload_resp = _zz_io_masters_3_b_payload_resp[1 : 0];
    if(!when_Axi4LiteCrossbar_l284) begin
      if(when_Axi4LiteCrossbar_l357_3) begin
        io_masters_3_b_payload_resp = io_slaves_0_b_payload_resp;
      end
    end
    if(!when_Axi4LiteCrossbar_l284_1) begin
      if(when_Axi4LiteCrossbar_l357_7) begin
        io_masters_3_b_payload_resp = io_slaves_1_b_payload_resp;
      end
    end
    if(!when_Axi4LiteCrossbar_l284_2) begin
      if(when_Axi4LiteCrossbar_l357_11) begin
        io_masters_3_b_payload_resp = io_slaves_2_b_payload_resp;
      end
    end
    if(!when_Axi4LiteCrossbar_l284_3) begin
      if(when_Axi4LiteCrossbar_l357_15) begin
        io_masters_3_b_payload_resp = io_slaves_3_b_payload_resp;
      end
    end
    if(!when_Axi4LiteCrossbar_l284_4) begin
      if(when_Axi4LiteCrossbar_l357_19) begin
        io_masters_3_b_payload_resp = decErr_io_axi_b_payload_resp;
      end
    end
  end

  always @(*) begin
    io_masters_3_ar_ready = 1'b0;
    if(when_Axi4LiteCrossbar_l388) begin
      if(when_Axi4LiteCrossbar_l400) begin
        if(when_Axi4LiteCrossbar_l403_3) begin
          io_masters_3_ar_ready = io_slaves_0_ar_ready;
        end
      end
    end
    if(when_Axi4LiteCrossbar_l388_1) begin
      if(when_Axi4LiteCrossbar_l400_1) begin
        if(when_Axi4LiteCrossbar_l403_7) begin
          io_masters_3_ar_ready = io_slaves_1_ar_ready;
        end
      end
    end
    if(when_Axi4LiteCrossbar_l388_2) begin
      if(when_Axi4LiteCrossbar_l400_2) begin
        if(when_Axi4LiteCrossbar_l403_11) begin
          io_masters_3_ar_ready = io_slaves_2_ar_ready;
        end
      end
    end
    if(when_Axi4LiteCrossbar_l388_3) begin
      if(when_Axi4LiteCrossbar_l400_3) begin
        if(when_Axi4LiteCrossbar_l403_15) begin
          io_masters_3_ar_ready = io_slaves_3_ar_ready;
        end
      end
    end
    if(when_Axi4LiteCrossbar_l388_4) begin
      if(when_Axi4LiteCrossbar_l400_4) begin
        if(when_Axi4LiteCrossbar_l403_19) begin
          io_masters_3_ar_ready = decErr_io_axi_ar_ready;
        end
      end
    end
  end

  always @(*) begin
    io_masters_3_r_valid = 1'b0;
    if(!when_Axi4LiteCrossbar_l388) begin
      if(when_Axi4LiteCrossbar_l446_3) begin
        io_masters_3_r_valid = io_slaves_0_r_valid;
      end
    end
    if(!when_Axi4LiteCrossbar_l388_1) begin
      if(when_Axi4LiteCrossbar_l446_7) begin
        io_masters_3_r_valid = io_slaves_1_r_valid;
      end
    end
    if(!when_Axi4LiteCrossbar_l388_2) begin
      if(when_Axi4LiteCrossbar_l446_11) begin
        io_masters_3_r_valid = io_slaves_2_r_valid;
      end
    end
    if(!when_Axi4LiteCrossbar_l388_3) begin
      if(when_Axi4LiteCrossbar_l446_15) begin
        io_masters_3_r_valid = io_slaves_3_r_valid;
      end
    end
    if(!when_Axi4LiteCrossbar_l388_4) begin
      if(when_Axi4LiteCrossbar_l446_19) begin
        io_masters_3_r_valid = decErr_io_axi_r_valid;
      end
    end
  end

  assign _zz_io_masters_3_r_payload_data = 34'h0;
  always @(*) begin
    io_masters_3_r_payload_data = _zz_io_masters_3_r_payload_data[31 : 0];
    if(!when_Axi4LiteCrossbar_l388) begin
      if(when_Axi4LiteCrossbar_l446_3) begin
        io_masters_3_r_payload_data = io_slaves_0_r_payload_data;
      end
    end
    if(!when_Axi4LiteCrossbar_l388_1) begin
      if(when_Axi4LiteCrossbar_l446_7) begin
        io_masters_3_r_payload_data = io_slaves_1_r_payload_data;
      end
    end
    if(!when_Axi4LiteCrossbar_l388_2) begin
      if(when_Axi4LiteCrossbar_l446_11) begin
        io_masters_3_r_payload_data = io_slaves_2_r_payload_data;
      end
    end
    if(!when_Axi4LiteCrossbar_l388_3) begin
      if(when_Axi4LiteCrossbar_l446_15) begin
        io_masters_3_r_payload_data = io_slaves_3_r_payload_data;
      end
    end
    if(!when_Axi4LiteCrossbar_l388_4) begin
      if(when_Axi4LiteCrossbar_l446_19) begin
        io_masters_3_r_payload_data = decErr_io_axi_r_payload_data;
      end
    end
  end

  always @(*) begin
    io_masters_3_r_payload_resp = _zz_io_masters_3_r_payload_data[33 : 32];
    if(!when_Axi4LiteCrossbar_l388) begin
      if(when_Axi4LiteCrossbar_l446_3) begin
        io_masters_3_r_payload_resp = io_slaves_0_r_payload_resp;
      end
    end
    if(!when_Axi4LiteCrossbar_l388_1) begin
      if(when_Axi4LiteCrossbar_l446_7) begin
        io_masters_3_r_payload_resp = io_slaves_1_r_payload_resp;
      end
    end
    if(!when_Axi4LiteCrossbar_l388_2) begin
      if(when_Axi4LiteCrossbar_l446_11) begin
        io_masters_3_r_payload_resp = io_slaves_2_r_payload_resp;
      end
    end
    if(!when_Axi4LiteCrossbar_l388_3) begin
      if(when_Axi4LiteCrossbar_l446_15) begin
        io_masters_3_r_payload_resp = io_slaves_3_r_payload_resp;
      end
    end
    if(!when_Axi4LiteCrossbar_l388_4) begin
      if(when_Axi4LiteCrossbar_l446_19) begin
        io_masters_3_r_payload_resp = decErr_io_axi_r_payload_resp;
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
        if(when_Axi4LiteCrossbar_l301_2) begin
          io_slaves_0_aw_payload_addr = io_masters_2_aw_payload_addr;
        end
        if(when_Axi4LiteCrossbar_l301_3) begin
          io_slaves_0_aw_payload_addr = io_masters_3_aw_payload_addr;
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
        if(when_Axi4LiteCrossbar_l301_2) begin
          io_slaves_0_aw_payload_prot = io_masters_2_aw_payload_prot;
        end
        if(when_Axi4LiteCrossbar_l301_3) begin
          io_slaves_0_aw_payload_prot = io_masters_3_aw_payload_prot;
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
        if(when_Axi4LiteCrossbar_l301_2) begin
          if(when_Axi4LiteCrossbar_l308_2) begin
            io_slaves_0_w_valid = io_masters_2_w_valid;
          end
        end
        if(when_Axi4LiteCrossbar_l301_3) begin
          if(when_Axi4LiteCrossbar_l308_3) begin
            io_slaves_0_w_valid = io_masters_3_w_valid;
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
      if(when_Axi4LiteCrossbar_l357_2) begin
        if(when_Axi4LiteCrossbar_l358_2) begin
          io_slaves_0_w_valid = io_masters_2_w_valid;
        end
      end
      if(when_Axi4LiteCrossbar_l357_3) begin
        if(when_Axi4LiteCrossbar_l358_3) begin
          io_slaves_0_w_valid = io_masters_3_w_valid;
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
        if(when_Axi4LiteCrossbar_l301_2) begin
          if(when_Axi4LiteCrossbar_l308_2) begin
            io_slaves_0_w_payload_data = io_masters_2_w_payload_data;
          end
        end
        if(when_Axi4LiteCrossbar_l301_3) begin
          if(when_Axi4LiteCrossbar_l308_3) begin
            io_slaves_0_w_payload_data = io_masters_3_w_payload_data;
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
      if(when_Axi4LiteCrossbar_l357_2) begin
        if(when_Axi4LiteCrossbar_l358_2) begin
          io_slaves_0_w_payload_data = io_masters_2_w_payload_data;
        end
      end
      if(when_Axi4LiteCrossbar_l357_3) begin
        if(when_Axi4LiteCrossbar_l358_3) begin
          io_slaves_0_w_payload_data = io_masters_3_w_payload_data;
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
        if(when_Axi4LiteCrossbar_l301_2) begin
          if(when_Axi4LiteCrossbar_l308_2) begin
            io_slaves_0_w_payload_strb = io_masters_2_w_payload_strb;
          end
        end
        if(when_Axi4LiteCrossbar_l301_3) begin
          if(when_Axi4LiteCrossbar_l308_3) begin
            io_slaves_0_w_payload_strb = io_masters_3_w_payload_strb;
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
      if(when_Axi4LiteCrossbar_l357_2) begin
        if(when_Axi4LiteCrossbar_l358_2) begin
          io_slaves_0_w_payload_strb = io_masters_2_w_payload_strb;
        end
      end
      if(when_Axi4LiteCrossbar_l357_3) begin
        if(when_Axi4LiteCrossbar_l358_3) begin
          io_slaves_0_w_payload_strb = io_masters_3_w_payload_strb;
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
      if(when_Axi4LiteCrossbar_l357_2) begin
        io_slaves_0_b_ready = io_masters_2_b_ready;
      end
      if(when_Axi4LiteCrossbar_l357_3) begin
        io_slaves_0_b_ready = io_masters_3_b_ready;
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
        if(when_Axi4LiteCrossbar_l403_2) begin
          io_slaves_0_ar_payload_addr = io_masters_2_ar_payload_addr;
        end
        if(when_Axi4LiteCrossbar_l403_3) begin
          io_slaves_0_ar_payload_addr = io_masters_3_ar_payload_addr;
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
        if(when_Axi4LiteCrossbar_l403_2) begin
          io_slaves_0_ar_payload_prot = io_masters_2_ar_payload_prot;
        end
        if(when_Axi4LiteCrossbar_l403_3) begin
          io_slaves_0_ar_payload_prot = io_masters_3_ar_payload_prot;
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
      if(when_Axi4LiteCrossbar_l446_2) begin
        io_slaves_0_r_ready = io_masters_2_r_ready;
      end
      if(when_Axi4LiteCrossbar_l446_3) begin
        io_slaves_0_r_ready = io_masters_3_r_ready;
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
        if(when_Axi4LiteCrossbar_l301_4) begin
          io_slaves_1_aw_payload_addr = io_masters_0_aw_payload_addr;
        end
        if(when_Axi4LiteCrossbar_l301_5) begin
          io_slaves_1_aw_payload_addr = io_masters_1_aw_payload_addr;
        end
        if(when_Axi4LiteCrossbar_l301_6) begin
          io_slaves_1_aw_payload_addr = io_masters_2_aw_payload_addr;
        end
        if(when_Axi4LiteCrossbar_l301_7) begin
          io_slaves_1_aw_payload_addr = io_masters_3_aw_payload_addr;
        end
      end
    end
  end

  always @(*) begin
    io_slaves_1_aw_payload_prot = _zz_io_slaves_1_aw_payload_addr[34 : 32];
    if(when_Axi4LiteCrossbar_l284_1) begin
      if(when_Axi4LiteCrossbar_l297_1) begin
        if(when_Axi4LiteCrossbar_l301_4) begin
          io_slaves_1_aw_payload_prot = io_masters_0_aw_payload_prot;
        end
        if(when_Axi4LiteCrossbar_l301_5) begin
          io_slaves_1_aw_payload_prot = io_masters_1_aw_payload_prot;
        end
        if(when_Axi4LiteCrossbar_l301_6) begin
          io_slaves_1_aw_payload_prot = io_masters_2_aw_payload_prot;
        end
        if(when_Axi4LiteCrossbar_l301_7) begin
          io_slaves_1_aw_payload_prot = io_masters_3_aw_payload_prot;
        end
      end
    end
  end

  always @(*) begin
    io_slaves_1_w_valid = 1'b0;
    if(when_Axi4LiteCrossbar_l284_1) begin
      if(when_Axi4LiteCrossbar_l297_1) begin
        if(when_Axi4LiteCrossbar_l301_4) begin
          if(when_Axi4LiteCrossbar_l308_4) begin
            io_slaves_1_w_valid = io_masters_0_w_valid;
          end
        end
        if(when_Axi4LiteCrossbar_l301_5) begin
          if(when_Axi4LiteCrossbar_l308_5) begin
            io_slaves_1_w_valid = io_masters_1_w_valid;
          end
        end
        if(when_Axi4LiteCrossbar_l301_6) begin
          if(when_Axi4LiteCrossbar_l308_6) begin
            io_slaves_1_w_valid = io_masters_2_w_valid;
          end
        end
        if(when_Axi4LiteCrossbar_l301_7) begin
          if(when_Axi4LiteCrossbar_l308_7) begin
            io_slaves_1_w_valid = io_masters_3_w_valid;
          end
        end
      end
    end else begin
      if(when_Axi4LiteCrossbar_l357_4) begin
        if(when_Axi4LiteCrossbar_l358_4) begin
          io_slaves_1_w_valid = io_masters_0_w_valid;
        end
      end
      if(when_Axi4LiteCrossbar_l357_5) begin
        if(when_Axi4LiteCrossbar_l358_5) begin
          io_slaves_1_w_valid = io_masters_1_w_valid;
        end
      end
      if(when_Axi4LiteCrossbar_l357_6) begin
        if(when_Axi4LiteCrossbar_l358_6) begin
          io_slaves_1_w_valid = io_masters_2_w_valid;
        end
      end
      if(when_Axi4LiteCrossbar_l357_7) begin
        if(when_Axi4LiteCrossbar_l358_7) begin
          io_slaves_1_w_valid = io_masters_3_w_valid;
        end
      end
    end
  end

  assign _zz_io_slaves_1_w_payload_data = 36'h0;
  always @(*) begin
    io_slaves_1_w_payload_data = _zz_io_slaves_1_w_payload_data[31 : 0];
    if(when_Axi4LiteCrossbar_l284_1) begin
      if(when_Axi4LiteCrossbar_l297_1) begin
        if(when_Axi4LiteCrossbar_l301_4) begin
          if(when_Axi4LiteCrossbar_l308_4) begin
            io_slaves_1_w_payload_data = io_masters_0_w_payload_data;
          end
        end
        if(when_Axi4LiteCrossbar_l301_5) begin
          if(when_Axi4LiteCrossbar_l308_5) begin
            io_slaves_1_w_payload_data = io_masters_1_w_payload_data;
          end
        end
        if(when_Axi4LiteCrossbar_l301_6) begin
          if(when_Axi4LiteCrossbar_l308_6) begin
            io_slaves_1_w_payload_data = io_masters_2_w_payload_data;
          end
        end
        if(when_Axi4LiteCrossbar_l301_7) begin
          if(when_Axi4LiteCrossbar_l308_7) begin
            io_slaves_1_w_payload_data = io_masters_3_w_payload_data;
          end
        end
      end
    end else begin
      if(when_Axi4LiteCrossbar_l357_4) begin
        if(when_Axi4LiteCrossbar_l358_4) begin
          io_slaves_1_w_payload_data = io_masters_0_w_payload_data;
        end
      end
      if(when_Axi4LiteCrossbar_l357_5) begin
        if(when_Axi4LiteCrossbar_l358_5) begin
          io_slaves_1_w_payload_data = io_masters_1_w_payload_data;
        end
      end
      if(when_Axi4LiteCrossbar_l357_6) begin
        if(when_Axi4LiteCrossbar_l358_6) begin
          io_slaves_1_w_payload_data = io_masters_2_w_payload_data;
        end
      end
      if(when_Axi4LiteCrossbar_l357_7) begin
        if(when_Axi4LiteCrossbar_l358_7) begin
          io_slaves_1_w_payload_data = io_masters_3_w_payload_data;
        end
      end
    end
  end

  always @(*) begin
    io_slaves_1_w_payload_strb = _zz_io_slaves_1_w_payload_data[35 : 32];
    if(when_Axi4LiteCrossbar_l284_1) begin
      if(when_Axi4LiteCrossbar_l297_1) begin
        if(when_Axi4LiteCrossbar_l301_4) begin
          if(when_Axi4LiteCrossbar_l308_4) begin
            io_slaves_1_w_payload_strb = io_masters_0_w_payload_strb;
          end
        end
        if(when_Axi4LiteCrossbar_l301_5) begin
          if(when_Axi4LiteCrossbar_l308_5) begin
            io_slaves_1_w_payload_strb = io_masters_1_w_payload_strb;
          end
        end
        if(when_Axi4LiteCrossbar_l301_6) begin
          if(when_Axi4LiteCrossbar_l308_6) begin
            io_slaves_1_w_payload_strb = io_masters_2_w_payload_strb;
          end
        end
        if(when_Axi4LiteCrossbar_l301_7) begin
          if(when_Axi4LiteCrossbar_l308_7) begin
            io_slaves_1_w_payload_strb = io_masters_3_w_payload_strb;
          end
        end
      end
    end else begin
      if(when_Axi4LiteCrossbar_l357_4) begin
        if(when_Axi4LiteCrossbar_l358_4) begin
          io_slaves_1_w_payload_strb = io_masters_0_w_payload_strb;
        end
      end
      if(when_Axi4LiteCrossbar_l357_5) begin
        if(when_Axi4LiteCrossbar_l358_5) begin
          io_slaves_1_w_payload_strb = io_masters_1_w_payload_strb;
        end
      end
      if(when_Axi4LiteCrossbar_l357_6) begin
        if(when_Axi4LiteCrossbar_l358_6) begin
          io_slaves_1_w_payload_strb = io_masters_2_w_payload_strb;
        end
      end
      if(when_Axi4LiteCrossbar_l357_7) begin
        if(when_Axi4LiteCrossbar_l358_7) begin
          io_slaves_1_w_payload_strb = io_masters_3_w_payload_strb;
        end
      end
    end
  end

  always @(*) begin
    io_slaves_1_b_ready = 1'b0;
    if(!when_Axi4LiteCrossbar_l284_1) begin
      if(when_Axi4LiteCrossbar_l357_4) begin
        io_slaves_1_b_ready = io_masters_0_b_ready;
      end
      if(when_Axi4LiteCrossbar_l357_5) begin
        io_slaves_1_b_ready = io_masters_1_b_ready;
      end
      if(when_Axi4LiteCrossbar_l357_6) begin
        io_slaves_1_b_ready = io_masters_2_b_ready;
      end
      if(when_Axi4LiteCrossbar_l357_7) begin
        io_slaves_1_b_ready = io_masters_3_b_ready;
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
        if(when_Axi4LiteCrossbar_l403_4) begin
          io_slaves_1_ar_payload_addr = io_masters_0_ar_payload_addr;
        end
        if(when_Axi4LiteCrossbar_l403_5) begin
          io_slaves_1_ar_payload_addr = io_masters_1_ar_payload_addr;
        end
        if(when_Axi4LiteCrossbar_l403_6) begin
          io_slaves_1_ar_payload_addr = io_masters_2_ar_payload_addr;
        end
        if(when_Axi4LiteCrossbar_l403_7) begin
          io_slaves_1_ar_payload_addr = io_masters_3_ar_payload_addr;
        end
      end
    end
  end

  always @(*) begin
    io_slaves_1_ar_payload_prot = _zz_io_slaves_1_ar_payload_addr[34 : 32];
    if(when_Axi4LiteCrossbar_l388_1) begin
      if(when_Axi4LiteCrossbar_l400_1) begin
        if(when_Axi4LiteCrossbar_l403_4) begin
          io_slaves_1_ar_payload_prot = io_masters_0_ar_payload_prot;
        end
        if(when_Axi4LiteCrossbar_l403_5) begin
          io_slaves_1_ar_payload_prot = io_masters_1_ar_payload_prot;
        end
        if(when_Axi4LiteCrossbar_l403_6) begin
          io_slaves_1_ar_payload_prot = io_masters_2_ar_payload_prot;
        end
        if(when_Axi4LiteCrossbar_l403_7) begin
          io_slaves_1_ar_payload_prot = io_masters_3_ar_payload_prot;
        end
      end
    end
  end

  always @(*) begin
    io_slaves_1_r_ready = 1'b0;
    if(!when_Axi4LiteCrossbar_l388_1) begin
      if(when_Axi4LiteCrossbar_l446_4) begin
        io_slaves_1_r_ready = io_masters_0_r_ready;
      end
      if(when_Axi4LiteCrossbar_l446_5) begin
        io_slaves_1_r_ready = io_masters_1_r_ready;
      end
      if(when_Axi4LiteCrossbar_l446_6) begin
        io_slaves_1_r_ready = io_masters_2_r_ready;
      end
      if(when_Axi4LiteCrossbar_l446_7) begin
        io_slaves_1_r_ready = io_masters_3_r_ready;
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
        if(when_Axi4LiteCrossbar_l301_8) begin
          io_slaves_2_aw_payload_addr = io_masters_0_aw_payload_addr;
        end
        if(when_Axi4LiteCrossbar_l301_9) begin
          io_slaves_2_aw_payload_addr = io_masters_1_aw_payload_addr;
        end
        if(when_Axi4LiteCrossbar_l301_10) begin
          io_slaves_2_aw_payload_addr = io_masters_2_aw_payload_addr;
        end
        if(when_Axi4LiteCrossbar_l301_11) begin
          io_slaves_2_aw_payload_addr = io_masters_3_aw_payload_addr;
        end
      end
    end
  end

  always @(*) begin
    io_slaves_2_aw_payload_prot = _zz_io_slaves_2_aw_payload_addr[34 : 32];
    if(when_Axi4LiteCrossbar_l284_2) begin
      if(when_Axi4LiteCrossbar_l297_2) begin
        if(when_Axi4LiteCrossbar_l301_8) begin
          io_slaves_2_aw_payload_prot = io_masters_0_aw_payload_prot;
        end
        if(when_Axi4LiteCrossbar_l301_9) begin
          io_slaves_2_aw_payload_prot = io_masters_1_aw_payload_prot;
        end
        if(when_Axi4LiteCrossbar_l301_10) begin
          io_slaves_2_aw_payload_prot = io_masters_2_aw_payload_prot;
        end
        if(when_Axi4LiteCrossbar_l301_11) begin
          io_slaves_2_aw_payload_prot = io_masters_3_aw_payload_prot;
        end
      end
    end
  end

  always @(*) begin
    io_slaves_2_w_valid = 1'b0;
    if(when_Axi4LiteCrossbar_l284_2) begin
      if(when_Axi4LiteCrossbar_l297_2) begin
        if(when_Axi4LiteCrossbar_l301_8) begin
          if(when_Axi4LiteCrossbar_l308_8) begin
            io_slaves_2_w_valid = io_masters_0_w_valid;
          end
        end
        if(when_Axi4LiteCrossbar_l301_9) begin
          if(when_Axi4LiteCrossbar_l308_9) begin
            io_slaves_2_w_valid = io_masters_1_w_valid;
          end
        end
        if(when_Axi4LiteCrossbar_l301_10) begin
          if(when_Axi4LiteCrossbar_l308_10) begin
            io_slaves_2_w_valid = io_masters_2_w_valid;
          end
        end
        if(when_Axi4LiteCrossbar_l301_11) begin
          if(when_Axi4LiteCrossbar_l308_11) begin
            io_slaves_2_w_valid = io_masters_3_w_valid;
          end
        end
      end
    end else begin
      if(when_Axi4LiteCrossbar_l357_8) begin
        if(when_Axi4LiteCrossbar_l358_8) begin
          io_slaves_2_w_valid = io_masters_0_w_valid;
        end
      end
      if(when_Axi4LiteCrossbar_l357_9) begin
        if(when_Axi4LiteCrossbar_l358_9) begin
          io_slaves_2_w_valid = io_masters_1_w_valid;
        end
      end
      if(when_Axi4LiteCrossbar_l357_10) begin
        if(when_Axi4LiteCrossbar_l358_10) begin
          io_slaves_2_w_valid = io_masters_2_w_valid;
        end
      end
      if(when_Axi4LiteCrossbar_l357_11) begin
        if(when_Axi4LiteCrossbar_l358_11) begin
          io_slaves_2_w_valid = io_masters_3_w_valid;
        end
      end
    end
  end

  assign _zz_io_slaves_2_w_payload_data = 36'h0;
  always @(*) begin
    io_slaves_2_w_payload_data = _zz_io_slaves_2_w_payload_data[31 : 0];
    if(when_Axi4LiteCrossbar_l284_2) begin
      if(when_Axi4LiteCrossbar_l297_2) begin
        if(when_Axi4LiteCrossbar_l301_8) begin
          if(when_Axi4LiteCrossbar_l308_8) begin
            io_slaves_2_w_payload_data = io_masters_0_w_payload_data;
          end
        end
        if(when_Axi4LiteCrossbar_l301_9) begin
          if(when_Axi4LiteCrossbar_l308_9) begin
            io_slaves_2_w_payload_data = io_masters_1_w_payload_data;
          end
        end
        if(when_Axi4LiteCrossbar_l301_10) begin
          if(when_Axi4LiteCrossbar_l308_10) begin
            io_slaves_2_w_payload_data = io_masters_2_w_payload_data;
          end
        end
        if(when_Axi4LiteCrossbar_l301_11) begin
          if(when_Axi4LiteCrossbar_l308_11) begin
            io_slaves_2_w_payload_data = io_masters_3_w_payload_data;
          end
        end
      end
    end else begin
      if(when_Axi4LiteCrossbar_l357_8) begin
        if(when_Axi4LiteCrossbar_l358_8) begin
          io_slaves_2_w_payload_data = io_masters_0_w_payload_data;
        end
      end
      if(when_Axi4LiteCrossbar_l357_9) begin
        if(when_Axi4LiteCrossbar_l358_9) begin
          io_slaves_2_w_payload_data = io_masters_1_w_payload_data;
        end
      end
      if(when_Axi4LiteCrossbar_l357_10) begin
        if(when_Axi4LiteCrossbar_l358_10) begin
          io_slaves_2_w_payload_data = io_masters_2_w_payload_data;
        end
      end
      if(when_Axi4LiteCrossbar_l357_11) begin
        if(when_Axi4LiteCrossbar_l358_11) begin
          io_slaves_2_w_payload_data = io_masters_3_w_payload_data;
        end
      end
    end
  end

  always @(*) begin
    io_slaves_2_w_payload_strb = _zz_io_slaves_2_w_payload_data[35 : 32];
    if(when_Axi4LiteCrossbar_l284_2) begin
      if(when_Axi4LiteCrossbar_l297_2) begin
        if(when_Axi4LiteCrossbar_l301_8) begin
          if(when_Axi4LiteCrossbar_l308_8) begin
            io_slaves_2_w_payload_strb = io_masters_0_w_payload_strb;
          end
        end
        if(when_Axi4LiteCrossbar_l301_9) begin
          if(when_Axi4LiteCrossbar_l308_9) begin
            io_slaves_2_w_payload_strb = io_masters_1_w_payload_strb;
          end
        end
        if(when_Axi4LiteCrossbar_l301_10) begin
          if(when_Axi4LiteCrossbar_l308_10) begin
            io_slaves_2_w_payload_strb = io_masters_2_w_payload_strb;
          end
        end
        if(when_Axi4LiteCrossbar_l301_11) begin
          if(when_Axi4LiteCrossbar_l308_11) begin
            io_slaves_2_w_payload_strb = io_masters_3_w_payload_strb;
          end
        end
      end
    end else begin
      if(when_Axi4LiteCrossbar_l357_8) begin
        if(when_Axi4LiteCrossbar_l358_8) begin
          io_slaves_2_w_payload_strb = io_masters_0_w_payload_strb;
        end
      end
      if(when_Axi4LiteCrossbar_l357_9) begin
        if(when_Axi4LiteCrossbar_l358_9) begin
          io_slaves_2_w_payload_strb = io_masters_1_w_payload_strb;
        end
      end
      if(when_Axi4LiteCrossbar_l357_10) begin
        if(when_Axi4LiteCrossbar_l358_10) begin
          io_slaves_2_w_payload_strb = io_masters_2_w_payload_strb;
        end
      end
      if(when_Axi4LiteCrossbar_l357_11) begin
        if(when_Axi4LiteCrossbar_l358_11) begin
          io_slaves_2_w_payload_strb = io_masters_3_w_payload_strb;
        end
      end
    end
  end

  always @(*) begin
    io_slaves_2_b_ready = 1'b0;
    if(!when_Axi4LiteCrossbar_l284_2) begin
      if(when_Axi4LiteCrossbar_l357_8) begin
        io_slaves_2_b_ready = io_masters_0_b_ready;
      end
      if(when_Axi4LiteCrossbar_l357_9) begin
        io_slaves_2_b_ready = io_masters_1_b_ready;
      end
      if(when_Axi4LiteCrossbar_l357_10) begin
        io_slaves_2_b_ready = io_masters_2_b_ready;
      end
      if(when_Axi4LiteCrossbar_l357_11) begin
        io_slaves_2_b_ready = io_masters_3_b_ready;
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
        if(when_Axi4LiteCrossbar_l403_8) begin
          io_slaves_2_ar_payload_addr = io_masters_0_ar_payload_addr;
        end
        if(when_Axi4LiteCrossbar_l403_9) begin
          io_slaves_2_ar_payload_addr = io_masters_1_ar_payload_addr;
        end
        if(when_Axi4LiteCrossbar_l403_10) begin
          io_slaves_2_ar_payload_addr = io_masters_2_ar_payload_addr;
        end
        if(when_Axi4LiteCrossbar_l403_11) begin
          io_slaves_2_ar_payload_addr = io_masters_3_ar_payload_addr;
        end
      end
    end
  end

  always @(*) begin
    io_slaves_2_ar_payload_prot = _zz_io_slaves_2_ar_payload_addr[34 : 32];
    if(when_Axi4LiteCrossbar_l388_2) begin
      if(when_Axi4LiteCrossbar_l400_2) begin
        if(when_Axi4LiteCrossbar_l403_8) begin
          io_slaves_2_ar_payload_prot = io_masters_0_ar_payload_prot;
        end
        if(when_Axi4LiteCrossbar_l403_9) begin
          io_slaves_2_ar_payload_prot = io_masters_1_ar_payload_prot;
        end
        if(when_Axi4LiteCrossbar_l403_10) begin
          io_slaves_2_ar_payload_prot = io_masters_2_ar_payload_prot;
        end
        if(when_Axi4LiteCrossbar_l403_11) begin
          io_slaves_2_ar_payload_prot = io_masters_3_ar_payload_prot;
        end
      end
    end
  end

  always @(*) begin
    io_slaves_2_r_ready = 1'b0;
    if(!when_Axi4LiteCrossbar_l388_2) begin
      if(when_Axi4LiteCrossbar_l446_8) begin
        io_slaves_2_r_ready = io_masters_0_r_ready;
      end
      if(when_Axi4LiteCrossbar_l446_9) begin
        io_slaves_2_r_ready = io_masters_1_r_ready;
      end
      if(when_Axi4LiteCrossbar_l446_10) begin
        io_slaves_2_r_ready = io_masters_2_r_ready;
      end
      if(when_Axi4LiteCrossbar_l446_11) begin
        io_slaves_2_r_ready = io_masters_3_r_ready;
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
        if(when_Axi4LiteCrossbar_l301_12) begin
          io_slaves_3_aw_payload_addr = io_masters_0_aw_payload_addr;
        end
        if(when_Axi4LiteCrossbar_l301_13) begin
          io_slaves_3_aw_payload_addr = io_masters_1_aw_payload_addr;
        end
        if(when_Axi4LiteCrossbar_l301_14) begin
          io_slaves_3_aw_payload_addr = io_masters_2_aw_payload_addr;
        end
        if(when_Axi4LiteCrossbar_l301_15) begin
          io_slaves_3_aw_payload_addr = io_masters_3_aw_payload_addr;
        end
      end
    end
  end

  always @(*) begin
    io_slaves_3_aw_payload_prot = _zz_io_slaves_3_aw_payload_addr[34 : 32];
    if(when_Axi4LiteCrossbar_l284_3) begin
      if(when_Axi4LiteCrossbar_l297_3) begin
        if(when_Axi4LiteCrossbar_l301_12) begin
          io_slaves_3_aw_payload_prot = io_masters_0_aw_payload_prot;
        end
        if(when_Axi4LiteCrossbar_l301_13) begin
          io_slaves_3_aw_payload_prot = io_masters_1_aw_payload_prot;
        end
        if(when_Axi4LiteCrossbar_l301_14) begin
          io_slaves_3_aw_payload_prot = io_masters_2_aw_payload_prot;
        end
        if(when_Axi4LiteCrossbar_l301_15) begin
          io_slaves_3_aw_payload_prot = io_masters_3_aw_payload_prot;
        end
      end
    end
  end

  always @(*) begin
    io_slaves_3_w_valid = 1'b0;
    if(when_Axi4LiteCrossbar_l284_3) begin
      if(when_Axi4LiteCrossbar_l297_3) begin
        if(when_Axi4LiteCrossbar_l301_12) begin
          if(when_Axi4LiteCrossbar_l308_12) begin
            io_slaves_3_w_valid = io_masters_0_w_valid;
          end
        end
        if(when_Axi4LiteCrossbar_l301_13) begin
          if(when_Axi4LiteCrossbar_l308_13) begin
            io_slaves_3_w_valid = io_masters_1_w_valid;
          end
        end
        if(when_Axi4LiteCrossbar_l301_14) begin
          if(when_Axi4LiteCrossbar_l308_14) begin
            io_slaves_3_w_valid = io_masters_2_w_valid;
          end
        end
        if(when_Axi4LiteCrossbar_l301_15) begin
          if(when_Axi4LiteCrossbar_l308_15) begin
            io_slaves_3_w_valid = io_masters_3_w_valid;
          end
        end
      end
    end else begin
      if(when_Axi4LiteCrossbar_l357_12) begin
        if(when_Axi4LiteCrossbar_l358_12) begin
          io_slaves_3_w_valid = io_masters_0_w_valid;
        end
      end
      if(when_Axi4LiteCrossbar_l357_13) begin
        if(when_Axi4LiteCrossbar_l358_13) begin
          io_slaves_3_w_valid = io_masters_1_w_valid;
        end
      end
      if(when_Axi4LiteCrossbar_l357_14) begin
        if(when_Axi4LiteCrossbar_l358_14) begin
          io_slaves_3_w_valid = io_masters_2_w_valid;
        end
      end
      if(when_Axi4LiteCrossbar_l357_15) begin
        if(when_Axi4LiteCrossbar_l358_15) begin
          io_slaves_3_w_valid = io_masters_3_w_valid;
        end
      end
    end
  end

  assign _zz_io_slaves_3_w_payload_data = 36'h0;
  always @(*) begin
    io_slaves_3_w_payload_data = _zz_io_slaves_3_w_payload_data[31 : 0];
    if(when_Axi4LiteCrossbar_l284_3) begin
      if(when_Axi4LiteCrossbar_l297_3) begin
        if(when_Axi4LiteCrossbar_l301_12) begin
          if(when_Axi4LiteCrossbar_l308_12) begin
            io_slaves_3_w_payload_data = io_masters_0_w_payload_data;
          end
        end
        if(when_Axi4LiteCrossbar_l301_13) begin
          if(when_Axi4LiteCrossbar_l308_13) begin
            io_slaves_3_w_payload_data = io_masters_1_w_payload_data;
          end
        end
        if(when_Axi4LiteCrossbar_l301_14) begin
          if(when_Axi4LiteCrossbar_l308_14) begin
            io_slaves_3_w_payload_data = io_masters_2_w_payload_data;
          end
        end
        if(when_Axi4LiteCrossbar_l301_15) begin
          if(when_Axi4LiteCrossbar_l308_15) begin
            io_slaves_3_w_payload_data = io_masters_3_w_payload_data;
          end
        end
      end
    end else begin
      if(when_Axi4LiteCrossbar_l357_12) begin
        if(when_Axi4LiteCrossbar_l358_12) begin
          io_slaves_3_w_payload_data = io_masters_0_w_payload_data;
        end
      end
      if(when_Axi4LiteCrossbar_l357_13) begin
        if(when_Axi4LiteCrossbar_l358_13) begin
          io_slaves_3_w_payload_data = io_masters_1_w_payload_data;
        end
      end
      if(when_Axi4LiteCrossbar_l357_14) begin
        if(when_Axi4LiteCrossbar_l358_14) begin
          io_slaves_3_w_payload_data = io_masters_2_w_payload_data;
        end
      end
      if(when_Axi4LiteCrossbar_l357_15) begin
        if(when_Axi4LiteCrossbar_l358_15) begin
          io_slaves_3_w_payload_data = io_masters_3_w_payload_data;
        end
      end
    end
  end

  always @(*) begin
    io_slaves_3_w_payload_strb = _zz_io_slaves_3_w_payload_data[35 : 32];
    if(when_Axi4LiteCrossbar_l284_3) begin
      if(when_Axi4LiteCrossbar_l297_3) begin
        if(when_Axi4LiteCrossbar_l301_12) begin
          if(when_Axi4LiteCrossbar_l308_12) begin
            io_slaves_3_w_payload_strb = io_masters_0_w_payload_strb;
          end
        end
        if(when_Axi4LiteCrossbar_l301_13) begin
          if(when_Axi4LiteCrossbar_l308_13) begin
            io_slaves_3_w_payload_strb = io_masters_1_w_payload_strb;
          end
        end
        if(when_Axi4LiteCrossbar_l301_14) begin
          if(when_Axi4LiteCrossbar_l308_14) begin
            io_slaves_3_w_payload_strb = io_masters_2_w_payload_strb;
          end
        end
        if(when_Axi4LiteCrossbar_l301_15) begin
          if(when_Axi4LiteCrossbar_l308_15) begin
            io_slaves_3_w_payload_strb = io_masters_3_w_payload_strb;
          end
        end
      end
    end else begin
      if(when_Axi4LiteCrossbar_l357_12) begin
        if(when_Axi4LiteCrossbar_l358_12) begin
          io_slaves_3_w_payload_strb = io_masters_0_w_payload_strb;
        end
      end
      if(when_Axi4LiteCrossbar_l357_13) begin
        if(when_Axi4LiteCrossbar_l358_13) begin
          io_slaves_3_w_payload_strb = io_masters_1_w_payload_strb;
        end
      end
      if(when_Axi4LiteCrossbar_l357_14) begin
        if(when_Axi4LiteCrossbar_l358_14) begin
          io_slaves_3_w_payload_strb = io_masters_2_w_payload_strb;
        end
      end
      if(when_Axi4LiteCrossbar_l357_15) begin
        if(when_Axi4LiteCrossbar_l358_15) begin
          io_slaves_3_w_payload_strb = io_masters_3_w_payload_strb;
        end
      end
    end
  end

  always @(*) begin
    io_slaves_3_b_ready = 1'b0;
    if(!when_Axi4LiteCrossbar_l284_3) begin
      if(when_Axi4LiteCrossbar_l357_12) begin
        io_slaves_3_b_ready = io_masters_0_b_ready;
      end
      if(when_Axi4LiteCrossbar_l357_13) begin
        io_slaves_3_b_ready = io_masters_1_b_ready;
      end
      if(when_Axi4LiteCrossbar_l357_14) begin
        io_slaves_3_b_ready = io_masters_2_b_ready;
      end
      if(when_Axi4LiteCrossbar_l357_15) begin
        io_slaves_3_b_ready = io_masters_3_b_ready;
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
        if(when_Axi4LiteCrossbar_l403_12) begin
          io_slaves_3_ar_payload_addr = io_masters_0_ar_payload_addr;
        end
        if(when_Axi4LiteCrossbar_l403_13) begin
          io_slaves_3_ar_payload_addr = io_masters_1_ar_payload_addr;
        end
        if(when_Axi4LiteCrossbar_l403_14) begin
          io_slaves_3_ar_payload_addr = io_masters_2_ar_payload_addr;
        end
        if(when_Axi4LiteCrossbar_l403_15) begin
          io_slaves_3_ar_payload_addr = io_masters_3_ar_payload_addr;
        end
      end
    end
  end

  always @(*) begin
    io_slaves_3_ar_payload_prot = _zz_io_slaves_3_ar_payload_addr[34 : 32];
    if(when_Axi4LiteCrossbar_l388_3) begin
      if(when_Axi4LiteCrossbar_l400_3) begin
        if(when_Axi4LiteCrossbar_l403_12) begin
          io_slaves_3_ar_payload_prot = io_masters_0_ar_payload_prot;
        end
        if(when_Axi4LiteCrossbar_l403_13) begin
          io_slaves_3_ar_payload_prot = io_masters_1_ar_payload_prot;
        end
        if(when_Axi4LiteCrossbar_l403_14) begin
          io_slaves_3_ar_payload_prot = io_masters_2_ar_payload_prot;
        end
        if(when_Axi4LiteCrossbar_l403_15) begin
          io_slaves_3_ar_payload_prot = io_masters_3_ar_payload_prot;
        end
      end
    end
  end

  always @(*) begin
    io_slaves_3_r_ready = 1'b0;
    if(!when_Axi4LiteCrossbar_l388_3) begin
      if(when_Axi4LiteCrossbar_l446_12) begin
        io_slaves_3_r_ready = io_masters_0_r_ready;
      end
      if(when_Axi4LiteCrossbar_l446_13) begin
        io_slaves_3_r_ready = io_masters_1_r_ready;
      end
      if(when_Axi4LiteCrossbar_l446_14) begin
        io_slaves_3_r_ready = io_masters_2_r_ready;
      end
      if(when_Axi4LiteCrossbar_l446_15) begin
        io_slaves_3_r_ready = io_masters_3_r_ready;
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
        if(when_Axi4LiteCrossbar_l301_16) begin
          decErr_io_axi_aw_payload_addr = io_masters_0_aw_payload_addr;
        end
        if(when_Axi4LiteCrossbar_l301_17) begin
          decErr_io_axi_aw_payload_addr = io_masters_1_aw_payload_addr;
        end
        if(when_Axi4LiteCrossbar_l301_18) begin
          decErr_io_axi_aw_payload_addr = io_masters_2_aw_payload_addr;
        end
        if(when_Axi4LiteCrossbar_l301_19) begin
          decErr_io_axi_aw_payload_addr = io_masters_3_aw_payload_addr;
        end
      end
    end
  end

  always @(*) begin
    decErr_io_axi_aw_payload_prot = _zz_io_axi_aw_payload_addr[34 : 32];
    if(when_Axi4LiteCrossbar_l284_4) begin
      if(when_Axi4LiteCrossbar_l297_4) begin
        if(when_Axi4LiteCrossbar_l301_16) begin
          decErr_io_axi_aw_payload_prot = io_masters_0_aw_payload_prot;
        end
        if(when_Axi4LiteCrossbar_l301_17) begin
          decErr_io_axi_aw_payload_prot = io_masters_1_aw_payload_prot;
        end
        if(when_Axi4LiteCrossbar_l301_18) begin
          decErr_io_axi_aw_payload_prot = io_masters_2_aw_payload_prot;
        end
        if(when_Axi4LiteCrossbar_l301_19) begin
          decErr_io_axi_aw_payload_prot = io_masters_3_aw_payload_prot;
        end
      end
    end
  end

  always @(*) begin
    decErr_io_axi_w_valid = 1'b0;
    if(when_Axi4LiteCrossbar_l284_4) begin
      if(when_Axi4LiteCrossbar_l297_4) begin
        if(when_Axi4LiteCrossbar_l301_16) begin
          if(when_Axi4LiteCrossbar_l308_16) begin
            decErr_io_axi_w_valid = io_masters_0_w_valid;
          end
        end
        if(when_Axi4LiteCrossbar_l301_17) begin
          if(when_Axi4LiteCrossbar_l308_17) begin
            decErr_io_axi_w_valid = io_masters_1_w_valid;
          end
        end
        if(when_Axi4LiteCrossbar_l301_18) begin
          if(when_Axi4LiteCrossbar_l308_18) begin
            decErr_io_axi_w_valid = io_masters_2_w_valid;
          end
        end
        if(when_Axi4LiteCrossbar_l301_19) begin
          if(when_Axi4LiteCrossbar_l308_19) begin
            decErr_io_axi_w_valid = io_masters_3_w_valid;
          end
        end
      end
    end else begin
      if(when_Axi4LiteCrossbar_l357_16) begin
        if(when_Axi4LiteCrossbar_l358_16) begin
          decErr_io_axi_w_valid = io_masters_0_w_valid;
        end
      end
      if(when_Axi4LiteCrossbar_l357_17) begin
        if(when_Axi4LiteCrossbar_l358_17) begin
          decErr_io_axi_w_valid = io_masters_1_w_valid;
        end
      end
      if(when_Axi4LiteCrossbar_l357_18) begin
        if(when_Axi4LiteCrossbar_l358_18) begin
          decErr_io_axi_w_valid = io_masters_2_w_valid;
        end
      end
      if(when_Axi4LiteCrossbar_l357_19) begin
        if(when_Axi4LiteCrossbar_l358_19) begin
          decErr_io_axi_w_valid = io_masters_3_w_valid;
        end
      end
    end
  end

  assign _zz_io_axi_w_payload_data = 36'h0;
  always @(*) begin
    decErr_io_axi_w_payload_data = _zz_io_axi_w_payload_data[31 : 0];
    if(when_Axi4LiteCrossbar_l284_4) begin
      if(when_Axi4LiteCrossbar_l297_4) begin
        if(when_Axi4LiteCrossbar_l301_16) begin
          if(when_Axi4LiteCrossbar_l308_16) begin
            decErr_io_axi_w_payload_data = io_masters_0_w_payload_data;
          end
        end
        if(when_Axi4LiteCrossbar_l301_17) begin
          if(when_Axi4LiteCrossbar_l308_17) begin
            decErr_io_axi_w_payload_data = io_masters_1_w_payload_data;
          end
        end
        if(when_Axi4LiteCrossbar_l301_18) begin
          if(when_Axi4LiteCrossbar_l308_18) begin
            decErr_io_axi_w_payload_data = io_masters_2_w_payload_data;
          end
        end
        if(when_Axi4LiteCrossbar_l301_19) begin
          if(when_Axi4LiteCrossbar_l308_19) begin
            decErr_io_axi_w_payload_data = io_masters_3_w_payload_data;
          end
        end
      end
    end else begin
      if(when_Axi4LiteCrossbar_l357_16) begin
        if(when_Axi4LiteCrossbar_l358_16) begin
          decErr_io_axi_w_payload_data = io_masters_0_w_payload_data;
        end
      end
      if(when_Axi4LiteCrossbar_l357_17) begin
        if(when_Axi4LiteCrossbar_l358_17) begin
          decErr_io_axi_w_payload_data = io_masters_1_w_payload_data;
        end
      end
      if(when_Axi4LiteCrossbar_l357_18) begin
        if(when_Axi4LiteCrossbar_l358_18) begin
          decErr_io_axi_w_payload_data = io_masters_2_w_payload_data;
        end
      end
      if(when_Axi4LiteCrossbar_l357_19) begin
        if(when_Axi4LiteCrossbar_l358_19) begin
          decErr_io_axi_w_payload_data = io_masters_3_w_payload_data;
        end
      end
    end
  end

  always @(*) begin
    decErr_io_axi_w_payload_strb = _zz_io_axi_w_payload_data[35 : 32];
    if(when_Axi4LiteCrossbar_l284_4) begin
      if(when_Axi4LiteCrossbar_l297_4) begin
        if(when_Axi4LiteCrossbar_l301_16) begin
          if(when_Axi4LiteCrossbar_l308_16) begin
            decErr_io_axi_w_payload_strb = io_masters_0_w_payload_strb;
          end
        end
        if(when_Axi4LiteCrossbar_l301_17) begin
          if(when_Axi4LiteCrossbar_l308_17) begin
            decErr_io_axi_w_payload_strb = io_masters_1_w_payload_strb;
          end
        end
        if(when_Axi4LiteCrossbar_l301_18) begin
          if(when_Axi4LiteCrossbar_l308_18) begin
            decErr_io_axi_w_payload_strb = io_masters_2_w_payload_strb;
          end
        end
        if(when_Axi4LiteCrossbar_l301_19) begin
          if(when_Axi4LiteCrossbar_l308_19) begin
            decErr_io_axi_w_payload_strb = io_masters_3_w_payload_strb;
          end
        end
      end
    end else begin
      if(when_Axi4LiteCrossbar_l357_16) begin
        if(when_Axi4LiteCrossbar_l358_16) begin
          decErr_io_axi_w_payload_strb = io_masters_0_w_payload_strb;
        end
      end
      if(when_Axi4LiteCrossbar_l357_17) begin
        if(when_Axi4LiteCrossbar_l358_17) begin
          decErr_io_axi_w_payload_strb = io_masters_1_w_payload_strb;
        end
      end
      if(when_Axi4LiteCrossbar_l357_18) begin
        if(when_Axi4LiteCrossbar_l358_18) begin
          decErr_io_axi_w_payload_strb = io_masters_2_w_payload_strb;
        end
      end
      if(when_Axi4LiteCrossbar_l357_19) begin
        if(when_Axi4LiteCrossbar_l358_19) begin
          decErr_io_axi_w_payload_strb = io_masters_3_w_payload_strb;
        end
      end
    end
  end

  always @(*) begin
    decErr_io_axi_b_ready = 1'b0;
    if(!when_Axi4LiteCrossbar_l284_4) begin
      if(when_Axi4LiteCrossbar_l357_16) begin
        decErr_io_axi_b_ready = io_masters_0_b_ready;
      end
      if(when_Axi4LiteCrossbar_l357_17) begin
        decErr_io_axi_b_ready = io_masters_1_b_ready;
      end
      if(when_Axi4LiteCrossbar_l357_18) begin
        decErr_io_axi_b_ready = io_masters_2_b_ready;
      end
      if(when_Axi4LiteCrossbar_l357_19) begin
        decErr_io_axi_b_ready = io_masters_3_b_ready;
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
        if(when_Axi4LiteCrossbar_l403_16) begin
          decErr_io_axi_ar_payload_addr = io_masters_0_ar_payload_addr;
        end
        if(when_Axi4LiteCrossbar_l403_17) begin
          decErr_io_axi_ar_payload_addr = io_masters_1_ar_payload_addr;
        end
        if(when_Axi4LiteCrossbar_l403_18) begin
          decErr_io_axi_ar_payload_addr = io_masters_2_ar_payload_addr;
        end
        if(when_Axi4LiteCrossbar_l403_19) begin
          decErr_io_axi_ar_payload_addr = io_masters_3_ar_payload_addr;
        end
      end
    end
  end

  always @(*) begin
    decErr_io_axi_ar_payload_prot = _zz_io_axi_ar_payload_addr[34 : 32];
    if(when_Axi4LiteCrossbar_l388_4) begin
      if(when_Axi4LiteCrossbar_l400_4) begin
        if(when_Axi4LiteCrossbar_l403_16) begin
          decErr_io_axi_ar_payload_prot = io_masters_0_ar_payload_prot;
        end
        if(when_Axi4LiteCrossbar_l403_17) begin
          decErr_io_axi_ar_payload_prot = io_masters_1_ar_payload_prot;
        end
        if(when_Axi4LiteCrossbar_l403_18) begin
          decErr_io_axi_ar_payload_prot = io_masters_2_ar_payload_prot;
        end
        if(when_Axi4LiteCrossbar_l403_19) begin
          decErr_io_axi_ar_payload_prot = io_masters_3_ar_payload_prot;
        end
      end
    end
  end

  always @(*) begin
    decErr_io_axi_r_ready = 1'b0;
    if(!when_Axi4LiteCrossbar_l388_4) begin
      if(when_Axi4LiteCrossbar_l446_16) begin
        decErr_io_axi_r_ready = io_masters_0_r_ready;
      end
      if(when_Axi4LiteCrossbar_l446_17) begin
        decErr_io_axi_r_ready = io_masters_1_r_ready;
      end
      if(when_Axi4LiteCrossbar_l446_18) begin
        decErr_io_axi_r_ready = io_masters_2_r_ready;
      end
      if(when_Axi4LiteCrossbar_l446_19) begin
        decErr_io_axi_r_ready = io_masters_3_r_ready;
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
    _zz_when_Axi4LiteCrossbar_l297[0] = ((io_masters_0_aw_valid && _zz__zz_when_Axi4LiteCrossbar_l297[0]) && (! ((((wrActive_0 && (wrGranted_0 == _zz__zz_when_Axi4LiteCrossbar_l297_1)) || (wrActive_1 && (wrGranted_1 == _zz__zz_when_Axi4LiteCrossbar_l297_2))) || ((wrActive_2 && (wrGranted_2 == _zz__zz_when_Axi4LiteCrossbar_l297_3)) || (wrActive_3 && (wrGranted_3 == _zz__zz_when_Axi4LiteCrossbar_l297_4)))) || (wrActive_4 && (wrGranted_4 == 2'b00)))));
    _zz_when_Axi4LiteCrossbar_l297[1] = ((io_masters_1_aw_valid && _zz__zz_when_Axi4LiteCrossbar_l297_5[0]) && (! ((((wrActive_0 && (wrGranted_0 == 2'b01)) || (wrActive_1 && (wrGranted_1 == 2'b01))) || ((wrActive_2 && (wrGranted_2 == 2'b01)) || (wrActive_3 && (wrGranted_3 == 2'b01)))) || (wrActive_4 && (wrGranted_4 == 2'b01)))));
    _zz_when_Axi4LiteCrossbar_l297[2] = ((io_masters_2_aw_valid && _zz__zz_when_Axi4LiteCrossbar_l297_6[0]) && (! ((((wrActive_0 && (wrGranted_0 == 2'b10)) || (wrActive_1 && (wrGranted_1 == 2'b10))) || ((wrActive_2 && (wrGranted_2 == 2'b10)) || (wrActive_3 && (wrGranted_3 == 2'b10)))) || (wrActive_4 && (wrGranted_4 == 2'b10)))));
    _zz_when_Axi4LiteCrossbar_l297[3] = ((io_masters_3_aw_valid && _zz__zz_when_Axi4LiteCrossbar_l297_7[0]) && (! ((((wrActive_0 && (wrGranted_0 == 2'b11)) || (wrActive_1 && (wrGranted_1 == 2'b11))) || ((wrActive_2 && (wrGranted_2 == 2'b11)) || (wrActive_3 && (wrGranted_3 == 2'b11)))) || (wrActive_4 && (wrGranted_4 == 2'b11)))));
  end

  always @(*) begin
    _zz_when_Axi4LiteCrossbar_l297_2[0] = (io_masters_1_aw_payload_addr[31 : 16] == 16'h0);
    _zz_when_Axi4LiteCrossbar_l297_2[1] = (io_masters_1_aw_payload_addr[31 : 16] == 16'h0001);
    _zz_when_Axi4LiteCrossbar_l297_2[2] = (io_masters_1_aw_payload_addr[31 : 16] == 16'h0002);
    _zz_when_Axi4LiteCrossbar_l297_2[3] = (io_masters_1_aw_payload_addr[31 : 16] == 16'h0003);
  end

  always @(*) begin
    _zz_when_Axi4LiteCrossbar_l297_3[0] = (io_masters_2_aw_payload_addr[31 : 16] == 16'h0);
    _zz_when_Axi4LiteCrossbar_l297_3[1] = (io_masters_2_aw_payload_addr[31 : 16] == 16'h0001);
    _zz_when_Axi4LiteCrossbar_l297_3[2] = (io_masters_2_aw_payload_addr[31 : 16] == 16'h0002);
    _zz_when_Axi4LiteCrossbar_l297_3[3] = (io_masters_2_aw_payload_addr[31 : 16] == 16'h0003);
  end

  always @(*) begin
    _zz_when_Axi4LiteCrossbar_l297_4[0] = (io_masters_3_aw_payload_addr[31 : 16] == 16'h0);
    _zz_when_Axi4LiteCrossbar_l297_4[1] = (io_masters_3_aw_payload_addr[31 : 16] == 16'h0001);
    _zz_when_Axi4LiteCrossbar_l297_4[2] = (io_masters_3_aw_payload_addr[31 : 16] == 16'h0002);
    _zz_when_Axi4LiteCrossbar_l297_4[3] = (io_masters_3_aw_payload_addr[31 : 16] == 16'h0003);
  end

  assign _zz_when_Axi4LiteCrossbar_l149 = _zz_when_Axi4LiteCrossbar_l297;
  assign _zz_when_Axi4LiteCrossbar_l149_1 = (_zz_when_Axi4LiteCrossbar_l149 & (~ _zz__zz_when_Axi4LiteCrossbar_l149_1));
  always @(*) begin
    _zz_wrGranted_0 = 2'b00;
    if(when_Axi4LiteCrossbar_l149) begin
      _zz_wrGranted_0 = 2'b00;
    end
    if(when_Axi4LiteCrossbar_l149_1) begin
      _zz_wrGranted_0 = 2'b01;
    end
    if(when_Axi4LiteCrossbar_l149_2) begin
      _zz_wrGranted_0 = 2'b10;
    end
    if(when_Axi4LiteCrossbar_l149_3) begin
      _zz_wrGranted_0 = 2'b11;
    end
  end

  assign when_Axi4LiteCrossbar_l149 = _zz_when_Axi4LiteCrossbar_l149_1[0];
  assign when_Axi4LiteCrossbar_l149_1 = _zz_when_Axi4LiteCrossbar_l149_1[1];
  assign when_Axi4LiteCrossbar_l149_2 = _zz_when_Axi4LiteCrossbar_l149_1[2];
  assign when_Axi4LiteCrossbar_l149_3 = _zz_when_Axi4LiteCrossbar_l149_1[3];
  assign _zz_wrGranted_0_1 = (grantLock ? grantLockIdx : _zz_wrGranted_0);
  assign when_Axi4LiteCrossbar_l184 = (io_slaves_0_aw_valid && (! io_slaves_0_aw_ready));
  assign when_Axi4LiteCrossbar_l297 = (|_zz_when_Axi4LiteCrossbar_l297);
  assign when_Axi4LiteCrossbar_l301 = (_zz_wrGranted_0_1 == 2'b00);
  assign when_Axi4LiteCrossbar_l308 = (! wrDataDone_0);
  assign when_Axi4LiteCrossbar_l301_1 = (_zz_wrGranted_0_1 == 2'b01);
  assign when_Axi4LiteCrossbar_l308_1 = (! wrDataDone_0);
  assign when_Axi4LiteCrossbar_l301_2 = (_zz_wrGranted_0_1 == 2'b10);
  assign when_Axi4LiteCrossbar_l308_2 = (! wrDataDone_0);
  assign when_Axi4LiteCrossbar_l301_3 = (_zz_wrGranted_0_1 == 2'b11);
  assign when_Axi4LiteCrossbar_l308_3 = (! wrDataDone_0);
  assign io_slaves_0_aw_fire = (io_slaves_0_aw_valid && io_slaves_0_aw_ready);
  assign when_Axi4LiteCrossbar_l357 = (wrGranted_0 == 2'b00);
  assign when_Axi4LiteCrossbar_l358 = (! wrDataDone_0);
  assign when_Axi4LiteCrossbar_l357_1 = (wrGranted_0 == 2'b01);
  assign when_Axi4LiteCrossbar_l358_1 = (! wrDataDone_0);
  assign when_Axi4LiteCrossbar_l357_2 = (wrGranted_0 == 2'b10);
  assign when_Axi4LiteCrossbar_l358_2 = (! wrDataDone_0);
  assign when_Axi4LiteCrossbar_l357_3 = (wrGranted_0 == 2'b11);
  assign when_Axi4LiteCrossbar_l358_3 = (! wrDataDone_0);
  assign io_slaves_0_b_fire = (io_slaves_0_b_valid && io_slaves_0_b_ready);
  assign io_slaves_0_w_fire = (io_slaves_0_w_valid && io_slaves_0_w_ready);
  assign when_Axi4LiteCrossbar_l284_1 = (! wrActive_1);
  always @(*) begin
    _zz_when_Axi4LiteCrossbar_l297_6[0] = (io_masters_0_aw_payload_addr[31 : 16] == 16'h0);
    _zz_when_Axi4LiteCrossbar_l297_6[1] = (io_masters_0_aw_payload_addr[31 : 16] == 16'h0001);
    _zz_when_Axi4LiteCrossbar_l297_6[2] = (io_masters_0_aw_payload_addr[31 : 16] == 16'h0002);
    _zz_when_Axi4LiteCrossbar_l297_6[3] = (io_masters_0_aw_payload_addr[31 : 16] == 16'h0003);
  end

  always @(*) begin
    _zz_when_Axi4LiteCrossbar_l297_5[0] = ((io_masters_0_aw_valid && _zz__zz_when_Axi4LiteCrossbar_l297_5_1[1]) && (! ((((wrActive_0 && (wrGranted_0 == 2'b00)) || (wrActive_1 && (wrGranted_1 == 2'b00))) || ((wrActive_2 && (wrGranted_2 == 2'b00)) || (wrActive_3 && (wrGranted_3 == 2'b00)))) || (wrActive_4 && (wrGranted_4 == 2'b00)))));
    _zz_when_Axi4LiteCrossbar_l297_5[1] = ((io_masters_1_aw_valid && _zz__zz_when_Axi4LiteCrossbar_l297_5_2[1]) && (! ((((wrActive_0 && (wrGranted_0 == 2'b01)) || (wrActive_1 && (wrGranted_1 == 2'b01))) || ((wrActive_2 && (wrGranted_2 == 2'b01)) || (wrActive_3 && (wrGranted_3 == 2'b01)))) || (wrActive_4 && (wrGranted_4 == 2'b01)))));
    _zz_when_Axi4LiteCrossbar_l297_5[2] = ((io_masters_2_aw_valid && _zz__zz_when_Axi4LiteCrossbar_l297_5_3[1]) && (! ((((wrActive_0 && (wrGranted_0 == 2'b10)) || (wrActive_1 && (wrGranted_1 == 2'b10))) || ((wrActive_2 && (wrGranted_2 == 2'b10)) || (wrActive_3 && (wrGranted_3 == 2'b10)))) || (wrActive_4 && (wrGranted_4 == 2'b10)))));
    _zz_when_Axi4LiteCrossbar_l297_5[3] = ((io_masters_3_aw_valid && _zz__zz_when_Axi4LiteCrossbar_l297_5_4[1]) && (! ((((wrActive_0 && (wrGranted_0 == 2'b11)) || (wrActive_1 && (wrGranted_1 == 2'b11))) || ((wrActive_2 && (wrGranted_2 == 2'b11)) || (wrActive_3 && (wrGranted_3 == 2'b11)))) || (wrActive_4 && (wrGranted_4 == 2'b11)))));
  end

  always @(*) begin
    _zz_when_Axi4LiteCrossbar_l297_7[0] = (io_masters_1_aw_payload_addr[31 : 16] == 16'h0);
    _zz_when_Axi4LiteCrossbar_l297_7[1] = (io_masters_1_aw_payload_addr[31 : 16] == 16'h0001);
    _zz_when_Axi4LiteCrossbar_l297_7[2] = (io_masters_1_aw_payload_addr[31 : 16] == 16'h0002);
    _zz_when_Axi4LiteCrossbar_l297_7[3] = (io_masters_1_aw_payload_addr[31 : 16] == 16'h0003);
  end

  always @(*) begin
    _zz_when_Axi4LiteCrossbar_l297_8[0] = (io_masters_2_aw_payload_addr[31 : 16] == 16'h0);
    _zz_when_Axi4LiteCrossbar_l297_8[1] = (io_masters_2_aw_payload_addr[31 : 16] == 16'h0001);
    _zz_when_Axi4LiteCrossbar_l297_8[2] = (io_masters_2_aw_payload_addr[31 : 16] == 16'h0002);
    _zz_when_Axi4LiteCrossbar_l297_8[3] = (io_masters_2_aw_payload_addr[31 : 16] == 16'h0003);
  end

  always @(*) begin
    _zz_when_Axi4LiteCrossbar_l297_9[0] = (io_masters_3_aw_payload_addr[31 : 16] == 16'h0);
    _zz_when_Axi4LiteCrossbar_l297_9[1] = (io_masters_3_aw_payload_addr[31 : 16] == 16'h0001);
    _zz_when_Axi4LiteCrossbar_l297_9[2] = (io_masters_3_aw_payload_addr[31 : 16] == 16'h0002);
    _zz_when_Axi4LiteCrossbar_l297_9[3] = (io_masters_3_aw_payload_addr[31 : 16] == 16'h0003);
  end

  assign _zz_when_Axi4LiteCrossbar_l149_2 = _zz_when_Axi4LiteCrossbar_l297_5;
  assign _zz_when_Axi4LiteCrossbar_l149_3 = (_zz_when_Axi4LiteCrossbar_l149_2 & (~ _zz__zz_when_Axi4LiteCrossbar_l149_3));
  always @(*) begin
    _zz_wrGranted_1 = 2'b00;
    if(when_Axi4LiteCrossbar_l149_4) begin
      _zz_wrGranted_1 = 2'b00;
    end
    if(when_Axi4LiteCrossbar_l149_5) begin
      _zz_wrGranted_1 = 2'b01;
    end
    if(when_Axi4LiteCrossbar_l149_6) begin
      _zz_wrGranted_1 = 2'b10;
    end
    if(when_Axi4LiteCrossbar_l149_7) begin
      _zz_wrGranted_1 = 2'b11;
    end
  end

  assign when_Axi4LiteCrossbar_l149_4 = _zz_when_Axi4LiteCrossbar_l149_3[0];
  assign when_Axi4LiteCrossbar_l149_5 = _zz_when_Axi4LiteCrossbar_l149_3[1];
  assign when_Axi4LiteCrossbar_l149_6 = _zz_when_Axi4LiteCrossbar_l149_3[2];
  assign when_Axi4LiteCrossbar_l149_7 = _zz_when_Axi4LiteCrossbar_l149_3[3];
  assign _zz_wrGranted_1_1 = (grantLock_1 ? grantLockIdx_1 : _zz_wrGranted_1);
  assign when_Axi4LiteCrossbar_l184_1 = (io_slaves_1_aw_valid && (! io_slaves_1_aw_ready));
  assign when_Axi4LiteCrossbar_l297_1 = (|_zz_when_Axi4LiteCrossbar_l297_5);
  assign when_Axi4LiteCrossbar_l301_4 = (_zz_wrGranted_1_1 == 2'b00);
  assign when_Axi4LiteCrossbar_l308_4 = (! wrDataDone_1);
  assign when_Axi4LiteCrossbar_l301_5 = (_zz_wrGranted_1_1 == 2'b01);
  assign when_Axi4LiteCrossbar_l308_5 = (! wrDataDone_1);
  assign when_Axi4LiteCrossbar_l301_6 = (_zz_wrGranted_1_1 == 2'b10);
  assign when_Axi4LiteCrossbar_l308_6 = (! wrDataDone_1);
  assign when_Axi4LiteCrossbar_l301_7 = (_zz_wrGranted_1_1 == 2'b11);
  assign when_Axi4LiteCrossbar_l308_7 = (! wrDataDone_1);
  assign io_slaves_1_aw_fire = (io_slaves_1_aw_valid && io_slaves_1_aw_ready);
  assign when_Axi4LiteCrossbar_l357_4 = (wrGranted_1 == 2'b00);
  assign when_Axi4LiteCrossbar_l358_4 = (! wrDataDone_1);
  assign when_Axi4LiteCrossbar_l357_5 = (wrGranted_1 == 2'b01);
  assign when_Axi4LiteCrossbar_l358_5 = (! wrDataDone_1);
  assign when_Axi4LiteCrossbar_l357_6 = (wrGranted_1 == 2'b10);
  assign when_Axi4LiteCrossbar_l358_6 = (! wrDataDone_1);
  assign when_Axi4LiteCrossbar_l357_7 = (wrGranted_1 == 2'b11);
  assign when_Axi4LiteCrossbar_l358_7 = (! wrDataDone_1);
  assign io_slaves_1_b_fire = (io_slaves_1_b_valid && io_slaves_1_b_ready);
  assign io_slaves_1_w_fire = (io_slaves_1_w_valid && io_slaves_1_w_ready);
  assign when_Axi4LiteCrossbar_l284_2 = (! wrActive_2);
  always @(*) begin
    _zz_when_Axi4LiteCrossbar_l297_11[0] = (io_masters_0_aw_payload_addr[31 : 16] == 16'h0);
    _zz_when_Axi4LiteCrossbar_l297_11[1] = (io_masters_0_aw_payload_addr[31 : 16] == 16'h0001);
    _zz_when_Axi4LiteCrossbar_l297_11[2] = (io_masters_0_aw_payload_addr[31 : 16] == 16'h0002);
    _zz_when_Axi4LiteCrossbar_l297_11[3] = (io_masters_0_aw_payload_addr[31 : 16] == 16'h0003);
  end

  always @(*) begin
    _zz_when_Axi4LiteCrossbar_l297_10[0] = ((io_masters_0_aw_valid && _zz__zz_when_Axi4LiteCrossbar_l297_10[2]) && (! ((((wrActive_0 && (wrGranted_0 == 2'b00)) || (wrActive_1 && (wrGranted_1 == 2'b00))) || ((wrActive_2 && (wrGranted_2 == 2'b00)) || (wrActive_3 && (wrGranted_3 == 2'b00)))) || (wrActive_4 && (wrGranted_4 == 2'b00)))));
    _zz_when_Axi4LiteCrossbar_l297_10[1] = ((io_masters_1_aw_valid && _zz__zz_when_Axi4LiteCrossbar_l297_10_1[2]) && (! ((((wrActive_0 && (wrGranted_0 == 2'b01)) || (wrActive_1 && (wrGranted_1 == 2'b01))) || ((wrActive_2 && (wrGranted_2 == 2'b01)) || (wrActive_3 && (wrGranted_3 == 2'b01)))) || (wrActive_4 && (wrGranted_4 == 2'b01)))));
    _zz_when_Axi4LiteCrossbar_l297_10[2] = ((io_masters_2_aw_valid && _zz__zz_when_Axi4LiteCrossbar_l297_10_2[2]) && (! ((((wrActive_0 && (wrGranted_0 == 2'b10)) || (wrActive_1 && (wrGranted_1 == 2'b10))) || ((wrActive_2 && (wrGranted_2 == 2'b10)) || (wrActive_3 && (wrGranted_3 == 2'b10)))) || (wrActive_4 && (wrGranted_4 == 2'b10)))));
    _zz_when_Axi4LiteCrossbar_l297_10[3] = ((io_masters_3_aw_valid && _zz__zz_when_Axi4LiteCrossbar_l297_10_3[2]) && (! ((((wrActive_0 && (wrGranted_0 == 2'b11)) || (wrActive_1 && (wrGranted_1 == 2'b11))) || ((wrActive_2 && (wrGranted_2 == 2'b11)) || (wrActive_3 && (wrGranted_3 == 2'b11)))) || (wrActive_4 && (wrGranted_4 == 2'b11)))));
  end

  always @(*) begin
    _zz_when_Axi4LiteCrossbar_l297_12[0] = (io_masters_1_aw_payload_addr[31 : 16] == 16'h0);
    _zz_when_Axi4LiteCrossbar_l297_12[1] = (io_masters_1_aw_payload_addr[31 : 16] == 16'h0001);
    _zz_when_Axi4LiteCrossbar_l297_12[2] = (io_masters_1_aw_payload_addr[31 : 16] == 16'h0002);
    _zz_when_Axi4LiteCrossbar_l297_12[3] = (io_masters_1_aw_payload_addr[31 : 16] == 16'h0003);
  end

  always @(*) begin
    _zz_when_Axi4LiteCrossbar_l297_13[0] = (io_masters_2_aw_payload_addr[31 : 16] == 16'h0);
    _zz_when_Axi4LiteCrossbar_l297_13[1] = (io_masters_2_aw_payload_addr[31 : 16] == 16'h0001);
    _zz_when_Axi4LiteCrossbar_l297_13[2] = (io_masters_2_aw_payload_addr[31 : 16] == 16'h0002);
    _zz_when_Axi4LiteCrossbar_l297_13[3] = (io_masters_2_aw_payload_addr[31 : 16] == 16'h0003);
  end

  always @(*) begin
    _zz_when_Axi4LiteCrossbar_l297_14[0] = (io_masters_3_aw_payload_addr[31 : 16] == 16'h0);
    _zz_when_Axi4LiteCrossbar_l297_14[1] = (io_masters_3_aw_payload_addr[31 : 16] == 16'h0001);
    _zz_when_Axi4LiteCrossbar_l297_14[2] = (io_masters_3_aw_payload_addr[31 : 16] == 16'h0002);
    _zz_when_Axi4LiteCrossbar_l297_14[3] = (io_masters_3_aw_payload_addr[31 : 16] == 16'h0003);
  end

  assign _zz_when_Axi4LiteCrossbar_l149_4 = _zz_when_Axi4LiteCrossbar_l297_10;
  assign _zz_when_Axi4LiteCrossbar_l149_5 = (_zz_when_Axi4LiteCrossbar_l149_4 & (~ _zz__zz_when_Axi4LiteCrossbar_l149_5));
  always @(*) begin
    _zz_wrGranted_2 = 2'b00;
    if(when_Axi4LiteCrossbar_l149_8) begin
      _zz_wrGranted_2 = 2'b00;
    end
    if(when_Axi4LiteCrossbar_l149_9) begin
      _zz_wrGranted_2 = 2'b01;
    end
    if(when_Axi4LiteCrossbar_l149_10) begin
      _zz_wrGranted_2 = 2'b10;
    end
    if(when_Axi4LiteCrossbar_l149_11) begin
      _zz_wrGranted_2 = 2'b11;
    end
  end

  assign when_Axi4LiteCrossbar_l149_8 = _zz_when_Axi4LiteCrossbar_l149_5[0];
  assign when_Axi4LiteCrossbar_l149_9 = _zz_when_Axi4LiteCrossbar_l149_5[1];
  assign when_Axi4LiteCrossbar_l149_10 = _zz_when_Axi4LiteCrossbar_l149_5[2];
  assign when_Axi4LiteCrossbar_l149_11 = _zz_when_Axi4LiteCrossbar_l149_5[3];
  assign _zz_wrGranted_2_1 = (grantLock_2 ? grantLockIdx_2 : _zz_wrGranted_2);
  assign when_Axi4LiteCrossbar_l184_2 = (io_slaves_2_aw_valid && (! io_slaves_2_aw_ready));
  assign when_Axi4LiteCrossbar_l297_2 = (|_zz_when_Axi4LiteCrossbar_l297_10);
  assign when_Axi4LiteCrossbar_l301_8 = (_zz_wrGranted_2_1 == 2'b00);
  assign when_Axi4LiteCrossbar_l308_8 = (! wrDataDone_2);
  assign when_Axi4LiteCrossbar_l301_9 = (_zz_wrGranted_2_1 == 2'b01);
  assign when_Axi4LiteCrossbar_l308_9 = (! wrDataDone_2);
  assign when_Axi4LiteCrossbar_l301_10 = (_zz_wrGranted_2_1 == 2'b10);
  assign when_Axi4LiteCrossbar_l308_10 = (! wrDataDone_2);
  assign when_Axi4LiteCrossbar_l301_11 = (_zz_wrGranted_2_1 == 2'b11);
  assign when_Axi4LiteCrossbar_l308_11 = (! wrDataDone_2);
  assign io_slaves_2_aw_fire = (io_slaves_2_aw_valid && io_slaves_2_aw_ready);
  assign when_Axi4LiteCrossbar_l357_8 = (wrGranted_2 == 2'b00);
  assign when_Axi4LiteCrossbar_l358_8 = (! wrDataDone_2);
  assign when_Axi4LiteCrossbar_l357_9 = (wrGranted_2 == 2'b01);
  assign when_Axi4LiteCrossbar_l358_9 = (! wrDataDone_2);
  assign when_Axi4LiteCrossbar_l357_10 = (wrGranted_2 == 2'b10);
  assign when_Axi4LiteCrossbar_l358_10 = (! wrDataDone_2);
  assign when_Axi4LiteCrossbar_l357_11 = (wrGranted_2 == 2'b11);
  assign when_Axi4LiteCrossbar_l358_11 = (! wrDataDone_2);
  assign io_slaves_2_b_fire = (io_slaves_2_b_valid && io_slaves_2_b_ready);
  assign io_slaves_2_w_fire = (io_slaves_2_w_valid && io_slaves_2_w_ready);
  assign when_Axi4LiteCrossbar_l284_3 = (! wrActive_3);
  always @(*) begin
    _zz_when_Axi4LiteCrossbar_l297_16[0] = (io_masters_0_aw_payload_addr[31 : 16] == 16'h0);
    _zz_when_Axi4LiteCrossbar_l297_16[1] = (io_masters_0_aw_payload_addr[31 : 16] == 16'h0001);
    _zz_when_Axi4LiteCrossbar_l297_16[2] = (io_masters_0_aw_payload_addr[31 : 16] == 16'h0002);
    _zz_when_Axi4LiteCrossbar_l297_16[3] = (io_masters_0_aw_payload_addr[31 : 16] == 16'h0003);
  end

  always @(*) begin
    _zz_when_Axi4LiteCrossbar_l297_15[0] = ((io_masters_0_aw_valid && _zz__zz_when_Axi4LiteCrossbar_l297_15[3]) && (! ((((wrActive_0 && (wrGranted_0 == 2'b00)) || (wrActive_1 && (wrGranted_1 == 2'b00))) || ((wrActive_2 && (wrGranted_2 == 2'b00)) || (wrActive_3 && (wrGranted_3 == 2'b00)))) || (wrActive_4 && (wrGranted_4 == 2'b00)))));
    _zz_when_Axi4LiteCrossbar_l297_15[1] = ((io_masters_1_aw_valid && _zz__zz_when_Axi4LiteCrossbar_l297_15_1[3]) && (! ((((wrActive_0 && (wrGranted_0 == 2'b01)) || (wrActive_1 && (wrGranted_1 == 2'b01))) || ((wrActive_2 && (wrGranted_2 == 2'b01)) || (wrActive_3 && (wrGranted_3 == 2'b01)))) || (wrActive_4 && (wrGranted_4 == 2'b01)))));
    _zz_when_Axi4LiteCrossbar_l297_15[2] = ((io_masters_2_aw_valid && _zz__zz_when_Axi4LiteCrossbar_l297_15_2[3]) && (! ((((wrActive_0 && (wrGranted_0 == 2'b10)) || (wrActive_1 && (wrGranted_1 == 2'b10))) || ((wrActive_2 && (wrGranted_2 == 2'b10)) || (wrActive_3 && (wrGranted_3 == 2'b10)))) || (wrActive_4 && (wrGranted_4 == 2'b10)))));
    _zz_when_Axi4LiteCrossbar_l297_15[3] = ((io_masters_3_aw_valid && _zz__zz_when_Axi4LiteCrossbar_l297_15_3[3]) && (! ((((wrActive_0 && (wrGranted_0 == 2'b11)) || (wrActive_1 && (wrGranted_1 == 2'b11))) || ((wrActive_2 && (wrGranted_2 == 2'b11)) || (wrActive_3 && (wrGranted_3 == 2'b11)))) || (wrActive_4 && (wrGranted_4 == 2'b11)))));
  end

  always @(*) begin
    _zz_when_Axi4LiteCrossbar_l297_17[0] = (io_masters_1_aw_payload_addr[31 : 16] == 16'h0);
    _zz_when_Axi4LiteCrossbar_l297_17[1] = (io_masters_1_aw_payload_addr[31 : 16] == 16'h0001);
    _zz_when_Axi4LiteCrossbar_l297_17[2] = (io_masters_1_aw_payload_addr[31 : 16] == 16'h0002);
    _zz_when_Axi4LiteCrossbar_l297_17[3] = (io_masters_1_aw_payload_addr[31 : 16] == 16'h0003);
  end

  always @(*) begin
    _zz_when_Axi4LiteCrossbar_l297_18[0] = (io_masters_2_aw_payload_addr[31 : 16] == 16'h0);
    _zz_when_Axi4LiteCrossbar_l297_18[1] = (io_masters_2_aw_payload_addr[31 : 16] == 16'h0001);
    _zz_when_Axi4LiteCrossbar_l297_18[2] = (io_masters_2_aw_payload_addr[31 : 16] == 16'h0002);
    _zz_when_Axi4LiteCrossbar_l297_18[3] = (io_masters_2_aw_payload_addr[31 : 16] == 16'h0003);
  end

  always @(*) begin
    _zz_when_Axi4LiteCrossbar_l297_19[0] = (io_masters_3_aw_payload_addr[31 : 16] == 16'h0);
    _zz_when_Axi4LiteCrossbar_l297_19[1] = (io_masters_3_aw_payload_addr[31 : 16] == 16'h0001);
    _zz_when_Axi4LiteCrossbar_l297_19[2] = (io_masters_3_aw_payload_addr[31 : 16] == 16'h0002);
    _zz_when_Axi4LiteCrossbar_l297_19[3] = (io_masters_3_aw_payload_addr[31 : 16] == 16'h0003);
  end

  assign _zz_when_Axi4LiteCrossbar_l149_6 = _zz_when_Axi4LiteCrossbar_l297_15;
  assign _zz_when_Axi4LiteCrossbar_l149_7 = (_zz_when_Axi4LiteCrossbar_l149_6 & (~ _zz__zz_when_Axi4LiteCrossbar_l149_7));
  always @(*) begin
    _zz_wrGranted_3 = 2'b00;
    if(when_Axi4LiteCrossbar_l149_12) begin
      _zz_wrGranted_3 = 2'b00;
    end
    if(when_Axi4LiteCrossbar_l149_13) begin
      _zz_wrGranted_3 = 2'b01;
    end
    if(when_Axi4LiteCrossbar_l149_14) begin
      _zz_wrGranted_3 = 2'b10;
    end
    if(when_Axi4LiteCrossbar_l149_15) begin
      _zz_wrGranted_3 = 2'b11;
    end
  end

  assign when_Axi4LiteCrossbar_l149_12 = _zz_when_Axi4LiteCrossbar_l149_7[0];
  assign when_Axi4LiteCrossbar_l149_13 = _zz_when_Axi4LiteCrossbar_l149_7[1];
  assign when_Axi4LiteCrossbar_l149_14 = _zz_when_Axi4LiteCrossbar_l149_7[2];
  assign when_Axi4LiteCrossbar_l149_15 = _zz_when_Axi4LiteCrossbar_l149_7[3];
  assign _zz_wrGranted_3_1 = (grantLock_3 ? grantLockIdx_3 : _zz_wrGranted_3);
  assign when_Axi4LiteCrossbar_l184_3 = (io_slaves_3_aw_valid && (! io_slaves_3_aw_ready));
  assign when_Axi4LiteCrossbar_l297_3 = (|_zz_when_Axi4LiteCrossbar_l297_15);
  assign when_Axi4LiteCrossbar_l301_12 = (_zz_wrGranted_3_1 == 2'b00);
  assign when_Axi4LiteCrossbar_l308_12 = (! wrDataDone_3);
  assign when_Axi4LiteCrossbar_l301_13 = (_zz_wrGranted_3_1 == 2'b01);
  assign when_Axi4LiteCrossbar_l308_13 = (! wrDataDone_3);
  assign when_Axi4LiteCrossbar_l301_14 = (_zz_wrGranted_3_1 == 2'b10);
  assign when_Axi4LiteCrossbar_l308_14 = (! wrDataDone_3);
  assign when_Axi4LiteCrossbar_l301_15 = (_zz_wrGranted_3_1 == 2'b11);
  assign when_Axi4LiteCrossbar_l308_15 = (! wrDataDone_3);
  assign io_slaves_3_aw_fire = (io_slaves_3_aw_valid && io_slaves_3_aw_ready);
  assign when_Axi4LiteCrossbar_l357_12 = (wrGranted_3 == 2'b00);
  assign when_Axi4LiteCrossbar_l358_12 = (! wrDataDone_3);
  assign when_Axi4LiteCrossbar_l357_13 = (wrGranted_3 == 2'b01);
  assign when_Axi4LiteCrossbar_l358_13 = (! wrDataDone_3);
  assign when_Axi4LiteCrossbar_l357_14 = (wrGranted_3 == 2'b10);
  assign when_Axi4LiteCrossbar_l358_14 = (! wrDataDone_3);
  assign when_Axi4LiteCrossbar_l357_15 = (wrGranted_3 == 2'b11);
  assign when_Axi4LiteCrossbar_l358_15 = (! wrDataDone_3);
  assign io_slaves_3_b_fire = (io_slaves_3_b_valid && io_slaves_3_b_ready);
  assign io_slaves_3_w_fire = (io_slaves_3_w_valid && io_slaves_3_w_ready);
  assign when_Axi4LiteCrossbar_l284_4 = (! wrActive_4);
  always @(*) begin
    _zz_when_Axi4LiteCrossbar_l297_21[0] = (io_masters_0_aw_payload_addr[31 : 16] == 16'h0);
    _zz_when_Axi4LiteCrossbar_l297_21[1] = (io_masters_0_aw_payload_addr[31 : 16] == 16'h0001);
    _zz_when_Axi4LiteCrossbar_l297_21[2] = (io_masters_0_aw_payload_addr[31 : 16] == 16'h0002);
    _zz_when_Axi4LiteCrossbar_l297_21[3] = (io_masters_0_aw_payload_addr[31 : 16] == 16'h0003);
  end

  always @(*) begin
    _zz_when_Axi4LiteCrossbar_l297_20[0] = ((io_masters_0_aw_valid && _zz__zz_when_Axi4LiteCrossbar_l297_20[4]) && (! ((((wrActive_0 && (wrGranted_0 == 2'b00)) || (wrActive_1 && (wrGranted_1 == 2'b00))) || ((wrActive_2 && (wrGranted_2 == 2'b00)) || (wrActive_3 && (wrGranted_3 == 2'b00)))) || (wrActive_4 && (wrGranted_4 == 2'b00)))));
    _zz_when_Axi4LiteCrossbar_l297_20[1] = ((io_masters_1_aw_valid && _zz__zz_when_Axi4LiteCrossbar_l297_20_1[4]) && (! ((((wrActive_0 && (wrGranted_0 == 2'b01)) || (wrActive_1 && (wrGranted_1 == 2'b01))) || ((wrActive_2 && (wrGranted_2 == 2'b01)) || (wrActive_3 && (wrGranted_3 == 2'b01)))) || (wrActive_4 && (wrGranted_4 == 2'b01)))));
    _zz_when_Axi4LiteCrossbar_l297_20[2] = ((io_masters_2_aw_valid && _zz__zz_when_Axi4LiteCrossbar_l297_20_2[4]) && (! ((((wrActive_0 && (wrGranted_0 == 2'b10)) || (wrActive_1 && (wrGranted_1 == 2'b10))) || ((wrActive_2 && (wrGranted_2 == 2'b10)) || (wrActive_3 && (wrGranted_3 == 2'b10)))) || (wrActive_4 && (wrGranted_4 == 2'b10)))));
    _zz_when_Axi4LiteCrossbar_l297_20[3] = ((io_masters_3_aw_valid && _zz__zz_when_Axi4LiteCrossbar_l297_20_3[4]) && (! ((((wrActive_0 && (wrGranted_0 == 2'b11)) || (wrActive_1 && (wrGranted_1 == 2'b11))) || ((wrActive_2 && (wrGranted_2 == 2'b11)) || (wrActive_3 && (wrGranted_3 == 2'b11)))) || (wrActive_4 && (wrGranted_4 == 2'b11)))));
  end

  always @(*) begin
    _zz_when_Axi4LiteCrossbar_l297_22[0] = (io_masters_1_aw_payload_addr[31 : 16] == 16'h0);
    _zz_when_Axi4LiteCrossbar_l297_22[1] = (io_masters_1_aw_payload_addr[31 : 16] == 16'h0001);
    _zz_when_Axi4LiteCrossbar_l297_22[2] = (io_masters_1_aw_payload_addr[31 : 16] == 16'h0002);
    _zz_when_Axi4LiteCrossbar_l297_22[3] = (io_masters_1_aw_payload_addr[31 : 16] == 16'h0003);
  end

  always @(*) begin
    _zz_when_Axi4LiteCrossbar_l297_23[0] = (io_masters_2_aw_payload_addr[31 : 16] == 16'h0);
    _zz_when_Axi4LiteCrossbar_l297_23[1] = (io_masters_2_aw_payload_addr[31 : 16] == 16'h0001);
    _zz_when_Axi4LiteCrossbar_l297_23[2] = (io_masters_2_aw_payload_addr[31 : 16] == 16'h0002);
    _zz_when_Axi4LiteCrossbar_l297_23[3] = (io_masters_2_aw_payload_addr[31 : 16] == 16'h0003);
  end

  always @(*) begin
    _zz_when_Axi4LiteCrossbar_l297_24[0] = (io_masters_3_aw_payload_addr[31 : 16] == 16'h0);
    _zz_when_Axi4LiteCrossbar_l297_24[1] = (io_masters_3_aw_payload_addr[31 : 16] == 16'h0001);
    _zz_when_Axi4LiteCrossbar_l297_24[2] = (io_masters_3_aw_payload_addr[31 : 16] == 16'h0002);
    _zz_when_Axi4LiteCrossbar_l297_24[3] = (io_masters_3_aw_payload_addr[31 : 16] == 16'h0003);
  end

  assign _zz_when_Axi4LiteCrossbar_l149_8 = _zz_when_Axi4LiteCrossbar_l297_20;
  assign _zz_when_Axi4LiteCrossbar_l149_9 = (_zz_when_Axi4LiteCrossbar_l149_8 & (~ _zz__zz_when_Axi4LiteCrossbar_l149_9));
  always @(*) begin
    _zz_wrGranted_4 = 2'b00;
    if(when_Axi4LiteCrossbar_l149_16) begin
      _zz_wrGranted_4 = 2'b00;
    end
    if(when_Axi4LiteCrossbar_l149_17) begin
      _zz_wrGranted_4 = 2'b01;
    end
    if(when_Axi4LiteCrossbar_l149_18) begin
      _zz_wrGranted_4 = 2'b10;
    end
    if(when_Axi4LiteCrossbar_l149_19) begin
      _zz_wrGranted_4 = 2'b11;
    end
  end

  assign when_Axi4LiteCrossbar_l149_16 = _zz_when_Axi4LiteCrossbar_l149_9[0];
  assign when_Axi4LiteCrossbar_l149_17 = _zz_when_Axi4LiteCrossbar_l149_9[1];
  assign when_Axi4LiteCrossbar_l149_18 = _zz_when_Axi4LiteCrossbar_l149_9[2];
  assign when_Axi4LiteCrossbar_l149_19 = _zz_when_Axi4LiteCrossbar_l149_9[3];
  assign _zz_wrGranted_4_1 = (grantLock_4 ? grantLockIdx_4 : _zz_wrGranted_4);
  assign when_Axi4LiteCrossbar_l184_4 = (decErr_io_axi_aw_valid && (! decErr_io_axi_aw_ready));
  assign when_Axi4LiteCrossbar_l297_4 = (|_zz_when_Axi4LiteCrossbar_l297_20);
  assign when_Axi4LiteCrossbar_l301_16 = (_zz_wrGranted_4_1 == 2'b00);
  assign when_Axi4LiteCrossbar_l308_16 = (! wrDataDone_4);
  assign when_Axi4LiteCrossbar_l301_17 = (_zz_wrGranted_4_1 == 2'b01);
  assign when_Axi4LiteCrossbar_l308_17 = (! wrDataDone_4);
  assign when_Axi4LiteCrossbar_l301_18 = (_zz_wrGranted_4_1 == 2'b10);
  assign when_Axi4LiteCrossbar_l308_18 = (! wrDataDone_4);
  assign when_Axi4LiteCrossbar_l301_19 = (_zz_wrGranted_4_1 == 2'b11);
  assign when_Axi4LiteCrossbar_l308_19 = (! wrDataDone_4);
  assign decErr_io_axi_aw_fire = (decErr_io_axi_aw_valid && decErr_io_axi_aw_ready);
  assign when_Axi4LiteCrossbar_l357_16 = (wrGranted_4 == 2'b00);
  assign when_Axi4LiteCrossbar_l358_16 = (! wrDataDone_4);
  assign when_Axi4LiteCrossbar_l357_17 = (wrGranted_4 == 2'b01);
  assign when_Axi4LiteCrossbar_l358_17 = (! wrDataDone_4);
  assign when_Axi4LiteCrossbar_l357_18 = (wrGranted_4 == 2'b10);
  assign when_Axi4LiteCrossbar_l358_18 = (! wrDataDone_4);
  assign when_Axi4LiteCrossbar_l357_19 = (wrGranted_4 == 2'b11);
  assign when_Axi4LiteCrossbar_l358_19 = (! wrDataDone_4);
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
    _zz_when_Axi4LiteCrossbar_l400[0] = ((io_masters_0_ar_valid && _zz__zz_when_Axi4LiteCrossbar_l400[0]) && (! ((((rdActive_0 && (rdGranted_0 == _zz__zz_when_Axi4LiteCrossbar_l400_1)) || (rdActive_1 && (rdGranted_1 == _zz__zz_when_Axi4LiteCrossbar_l400_2))) || ((rdActive_2 && (rdGranted_2 == _zz__zz_when_Axi4LiteCrossbar_l400_3)) || (rdActive_3 && (rdGranted_3 == _zz__zz_when_Axi4LiteCrossbar_l400_4)))) || (rdActive_4 && (rdGranted_4 == 2'b00)))));
    _zz_when_Axi4LiteCrossbar_l400[1] = ((io_masters_1_ar_valid && _zz__zz_when_Axi4LiteCrossbar_l400_5[0]) && (! ((((rdActive_0 && (rdGranted_0 == 2'b01)) || (rdActive_1 && (rdGranted_1 == 2'b01))) || ((rdActive_2 && (rdGranted_2 == 2'b01)) || (rdActive_3 && (rdGranted_3 == 2'b01)))) || (rdActive_4 && (rdGranted_4 == 2'b01)))));
    _zz_when_Axi4LiteCrossbar_l400[2] = ((io_masters_2_ar_valid && _zz__zz_when_Axi4LiteCrossbar_l400_6[0]) && (! ((((rdActive_0 && (rdGranted_0 == 2'b10)) || (rdActive_1 && (rdGranted_1 == 2'b10))) || ((rdActive_2 && (rdGranted_2 == 2'b10)) || (rdActive_3 && (rdGranted_3 == 2'b10)))) || (rdActive_4 && (rdGranted_4 == 2'b10)))));
    _zz_when_Axi4LiteCrossbar_l400[3] = ((io_masters_3_ar_valid && _zz__zz_when_Axi4LiteCrossbar_l400_7[0]) && (! ((((rdActive_0 && (rdGranted_0 == 2'b11)) || (rdActive_1 && (rdGranted_1 == 2'b11))) || ((rdActive_2 && (rdGranted_2 == 2'b11)) || (rdActive_3 && (rdGranted_3 == 2'b11)))) || (rdActive_4 && (rdGranted_4 == 2'b11)))));
  end

  always @(*) begin
    _zz_when_Axi4LiteCrossbar_l400_2[0] = (io_masters_1_ar_payload_addr[31 : 16] == 16'h0);
    _zz_when_Axi4LiteCrossbar_l400_2[1] = (io_masters_1_ar_payload_addr[31 : 16] == 16'h0001);
    _zz_when_Axi4LiteCrossbar_l400_2[2] = (io_masters_1_ar_payload_addr[31 : 16] == 16'h0002);
    _zz_when_Axi4LiteCrossbar_l400_2[3] = (io_masters_1_ar_payload_addr[31 : 16] == 16'h0003);
  end

  always @(*) begin
    _zz_when_Axi4LiteCrossbar_l400_3[0] = (io_masters_2_ar_payload_addr[31 : 16] == 16'h0);
    _zz_when_Axi4LiteCrossbar_l400_3[1] = (io_masters_2_ar_payload_addr[31 : 16] == 16'h0001);
    _zz_when_Axi4LiteCrossbar_l400_3[2] = (io_masters_2_ar_payload_addr[31 : 16] == 16'h0002);
    _zz_when_Axi4LiteCrossbar_l400_3[3] = (io_masters_2_ar_payload_addr[31 : 16] == 16'h0003);
  end

  always @(*) begin
    _zz_when_Axi4LiteCrossbar_l400_4[0] = (io_masters_3_ar_payload_addr[31 : 16] == 16'h0);
    _zz_when_Axi4LiteCrossbar_l400_4[1] = (io_masters_3_ar_payload_addr[31 : 16] == 16'h0001);
    _zz_when_Axi4LiteCrossbar_l400_4[2] = (io_masters_3_ar_payload_addr[31 : 16] == 16'h0002);
    _zz_when_Axi4LiteCrossbar_l400_4[3] = (io_masters_3_ar_payload_addr[31 : 16] == 16'h0003);
  end

  assign _zz_when_Axi4LiteCrossbar_l149_10 = _zz_when_Axi4LiteCrossbar_l400;
  assign _zz_when_Axi4LiteCrossbar_l149_11 = (_zz_when_Axi4LiteCrossbar_l149_10 & (~ _zz__zz_when_Axi4LiteCrossbar_l149_11));
  always @(*) begin
    _zz_rdGranted_0 = 2'b00;
    if(when_Axi4LiteCrossbar_l149_20) begin
      _zz_rdGranted_0 = 2'b00;
    end
    if(when_Axi4LiteCrossbar_l149_21) begin
      _zz_rdGranted_0 = 2'b01;
    end
    if(when_Axi4LiteCrossbar_l149_22) begin
      _zz_rdGranted_0 = 2'b10;
    end
    if(when_Axi4LiteCrossbar_l149_23) begin
      _zz_rdGranted_0 = 2'b11;
    end
  end

  assign when_Axi4LiteCrossbar_l149_20 = _zz_when_Axi4LiteCrossbar_l149_11[0];
  assign when_Axi4LiteCrossbar_l149_21 = _zz_when_Axi4LiteCrossbar_l149_11[1];
  assign when_Axi4LiteCrossbar_l149_22 = _zz_when_Axi4LiteCrossbar_l149_11[2];
  assign when_Axi4LiteCrossbar_l149_23 = _zz_when_Axi4LiteCrossbar_l149_11[3];
  assign _zz_rdGranted_0_1 = (grantLock_5 ? grantLockIdx_5 : _zz_rdGranted_0);
  assign when_Axi4LiteCrossbar_l184_5 = (io_slaves_0_ar_valid && (! io_slaves_0_ar_ready));
  assign when_Axi4LiteCrossbar_l400 = (|_zz_when_Axi4LiteCrossbar_l400);
  assign when_Axi4LiteCrossbar_l403 = (_zz_rdGranted_0_1 == 2'b00);
  assign when_Axi4LiteCrossbar_l403_1 = (_zz_rdGranted_0_1 == 2'b01);
  assign when_Axi4LiteCrossbar_l403_2 = (_zz_rdGranted_0_1 == 2'b10);
  assign when_Axi4LiteCrossbar_l403_3 = (_zz_rdGranted_0_1 == 2'b11);
  assign io_slaves_0_ar_fire = (io_slaves_0_ar_valid && io_slaves_0_ar_ready);
  assign when_Axi4LiteCrossbar_l446 = (rdGranted_0 == 2'b00);
  assign when_Axi4LiteCrossbar_l446_1 = (rdGranted_0 == 2'b01);
  assign when_Axi4LiteCrossbar_l446_2 = (rdGranted_0 == 2'b10);
  assign when_Axi4LiteCrossbar_l446_3 = (rdGranted_0 == 2'b11);
  assign io_slaves_0_r_fire = (io_slaves_0_r_valid && io_slaves_0_r_ready);
  assign when_Axi4LiteCrossbar_l388_1 = (! rdActive_1);
  always @(*) begin
    _zz_when_Axi4LiteCrossbar_l400_6[0] = (io_masters_0_ar_payload_addr[31 : 16] == 16'h0);
    _zz_when_Axi4LiteCrossbar_l400_6[1] = (io_masters_0_ar_payload_addr[31 : 16] == 16'h0001);
    _zz_when_Axi4LiteCrossbar_l400_6[2] = (io_masters_0_ar_payload_addr[31 : 16] == 16'h0002);
    _zz_when_Axi4LiteCrossbar_l400_6[3] = (io_masters_0_ar_payload_addr[31 : 16] == 16'h0003);
  end

  always @(*) begin
    _zz_when_Axi4LiteCrossbar_l400_5[0] = ((io_masters_0_ar_valid && _zz__zz_when_Axi4LiteCrossbar_l400_5_1[1]) && (! ((((rdActive_0 && (rdGranted_0 == 2'b00)) || (rdActive_1 && (rdGranted_1 == 2'b00))) || ((rdActive_2 && (rdGranted_2 == 2'b00)) || (rdActive_3 && (rdGranted_3 == 2'b00)))) || (rdActive_4 && (rdGranted_4 == 2'b00)))));
    _zz_when_Axi4LiteCrossbar_l400_5[1] = ((io_masters_1_ar_valid && _zz__zz_when_Axi4LiteCrossbar_l400_5_2[1]) && (! ((((rdActive_0 && (rdGranted_0 == 2'b01)) || (rdActive_1 && (rdGranted_1 == 2'b01))) || ((rdActive_2 && (rdGranted_2 == 2'b01)) || (rdActive_3 && (rdGranted_3 == 2'b01)))) || (rdActive_4 && (rdGranted_4 == 2'b01)))));
    _zz_when_Axi4LiteCrossbar_l400_5[2] = ((io_masters_2_ar_valid && _zz__zz_when_Axi4LiteCrossbar_l400_5_3[1]) && (! ((((rdActive_0 && (rdGranted_0 == 2'b10)) || (rdActive_1 && (rdGranted_1 == 2'b10))) || ((rdActive_2 && (rdGranted_2 == 2'b10)) || (rdActive_3 && (rdGranted_3 == 2'b10)))) || (rdActive_4 && (rdGranted_4 == 2'b10)))));
    _zz_when_Axi4LiteCrossbar_l400_5[3] = ((io_masters_3_ar_valid && _zz__zz_when_Axi4LiteCrossbar_l400_5_4[1]) && (! ((((rdActive_0 && (rdGranted_0 == 2'b11)) || (rdActive_1 && (rdGranted_1 == 2'b11))) || ((rdActive_2 && (rdGranted_2 == 2'b11)) || (rdActive_3 && (rdGranted_3 == 2'b11)))) || (rdActive_4 && (rdGranted_4 == 2'b11)))));
  end

  always @(*) begin
    _zz_when_Axi4LiteCrossbar_l400_7[0] = (io_masters_1_ar_payload_addr[31 : 16] == 16'h0);
    _zz_when_Axi4LiteCrossbar_l400_7[1] = (io_masters_1_ar_payload_addr[31 : 16] == 16'h0001);
    _zz_when_Axi4LiteCrossbar_l400_7[2] = (io_masters_1_ar_payload_addr[31 : 16] == 16'h0002);
    _zz_when_Axi4LiteCrossbar_l400_7[3] = (io_masters_1_ar_payload_addr[31 : 16] == 16'h0003);
  end

  always @(*) begin
    _zz_when_Axi4LiteCrossbar_l400_8[0] = (io_masters_2_ar_payload_addr[31 : 16] == 16'h0);
    _zz_when_Axi4LiteCrossbar_l400_8[1] = (io_masters_2_ar_payload_addr[31 : 16] == 16'h0001);
    _zz_when_Axi4LiteCrossbar_l400_8[2] = (io_masters_2_ar_payload_addr[31 : 16] == 16'h0002);
    _zz_when_Axi4LiteCrossbar_l400_8[3] = (io_masters_2_ar_payload_addr[31 : 16] == 16'h0003);
  end

  always @(*) begin
    _zz_when_Axi4LiteCrossbar_l400_9[0] = (io_masters_3_ar_payload_addr[31 : 16] == 16'h0);
    _zz_when_Axi4LiteCrossbar_l400_9[1] = (io_masters_3_ar_payload_addr[31 : 16] == 16'h0001);
    _zz_when_Axi4LiteCrossbar_l400_9[2] = (io_masters_3_ar_payload_addr[31 : 16] == 16'h0002);
    _zz_when_Axi4LiteCrossbar_l400_9[3] = (io_masters_3_ar_payload_addr[31 : 16] == 16'h0003);
  end

  assign _zz_when_Axi4LiteCrossbar_l149_12 = _zz_when_Axi4LiteCrossbar_l400_5;
  assign _zz_when_Axi4LiteCrossbar_l149_13 = (_zz_when_Axi4LiteCrossbar_l149_12 & (~ _zz__zz_when_Axi4LiteCrossbar_l149_13));
  always @(*) begin
    _zz_rdGranted_1 = 2'b00;
    if(when_Axi4LiteCrossbar_l149_24) begin
      _zz_rdGranted_1 = 2'b00;
    end
    if(when_Axi4LiteCrossbar_l149_25) begin
      _zz_rdGranted_1 = 2'b01;
    end
    if(when_Axi4LiteCrossbar_l149_26) begin
      _zz_rdGranted_1 = 2'b10;
    end
    if(when_Axi4LiteCrossbar_l149_27) begin
      _zz_rdGranted_1 = 2'b11;
    end
  end

  assign when_Axi4LiteCrossbar_l149_24 = _zz_when_Axi4LiteCrossbar_l149_13[0];
  assign when_Axi4LiteCrossbar_l149_25 = _zz_when_Axi4LiteCrossbar_l149_13[1];
  assign when_Axi4LiteCrossbar_l149_26 = _zz_when_Axi4LiteCrossbar_l149_13[2];
  assign when_Axi4LiteCrossbar_l149_27 = _zz_when_Axi4LiteCrossbar_l149_13[3];
  assign _zz_rdGranted_1_1 = (grantLock_6 ? grantLockIdx_6 : _zz_rdGranted_1);
  assign when_Axi4LiteCrossbar_l184_6 = (io_slaves_1_ar_valid && (! io_slaves_1_ar_ready));
  assign when_Axi4LiteCrossbar_l400_1 = (|_zz_when_Axi4LiteCrossbar_l400_5);
  assign when_Axi4LiteCrossbar_l403_4 = (_zz_rdGranted_1_1 == 2'b00);
  assign when_Axi4LiteCrossbar_l403_5 = (_zz_rdGranted_1_1 == 2'b01);
  assign when_Axi4LiteCrossbar_l403_6 = (_zz_rdGranted_1_1 == 2'b10);
  assign when_Axi4LiteCrossbar_l403_7 = (_zz_rdGranted_1_1 == 2'b11);
  assign io_slaves_1_ar_fire = (io_slaves_1_ar_valid && io_slaves_1_ar_ready);
  assign when_Axi4LiteCrossbar_l446_4 = (rdGranted_1 == 2'b00);
  assign when_Axi4LiteCrossbar_l446_5 = (rdGranted_1 == 2'b01);
  assign when_Axi4LiteCrossbar_l446_6 = (rdGranted_1 == 2'b10);
  assign when_Axi4LiteCrossbar_l446_7 = (rdGranted_1 == 2'b11);
  assign io_slaves_1_r_fire = (io_slaves_1_r_valid && io_slaves_1_r_ready);
  assign when_Axi4LiteCrossbar_l388_2 = (! rdActive_2);
  always @(*) begin
    _zz_when_Axi4LiteCrossbar_l400_11[0] = (io_masters_0_ar_payload_addr[31 : 16] == 16'h0);
    _zz_when_Axi4LiteCrossbar_l400_11[1] = (io_masters_0_ar_payload_addr[31 : 16] == 16'h0001);
    _zz_when_Axi4LiteCrossbar_l400_11[2] = (io_masters_0_ar_payload_addr[31 : 16] == 16'h0002);
    _zz_when_Axi4LiteCrossbar_l400_11[3] = (io_masters_0_ar_payload_addr[31 : 16] == 16'h0003);
  end

  always @(*) begin
    _zz_when_Axi4LiteCrossbar_l400_10[0] = ((io_masters_0_ar_valid && _zz__zz_when_Axi4LiteCrossbar_l400_10[2]) && (! ((((rdActive_0 && (rdGranted_0 == 2'b00)) || (rdActive_1 && (rdGranted_1 == 2'b00))) || ((rdActive_2 && (rdGranted_2 == 2'b00)) || (rdActive_3 && (rdGranted_3 == 2'b00)))) || (rdActive_4 && (rdGranted_4 == 2'b00)))));
    _zz_when_Axi4LiteCrossbar_l400_10[1] = ((io_masters_1_ar_valid && _zz__zz_when_Axi4LiteCrossbar_l400_10_1[2]) && (! ((((rdActive_0 && (rdGranted_0 == 2'b01)) || (rdActive_1 && (rdGranted_1 == 2'b01))) || ((rdActive_2 && (rdGranted_2 == 2'b01)) || (rdActive_3 && (rdGranted_3 == 2'b01)))) || (rdActive_4 && (rdGranted_4 == 2'b01)))));
    _zz_when_Axi4LiteCrossbar_l400_10[2] = ((io_masters_2_ar_valid && _zz__zz_when_Axi4LiteCrossbar_l400_10_2[2]) && (! ((((rdActive_0 && (rdGranted_0 == 2'b10)) || (rdActive_1 && (rdGranted_1 == 2'b10))) || ((rdActive_2 && (rdGranted_2 == 2'b10)) || (rdActive_3 && (rdGranted_3 == 2'b10)))) || (rdActive_4 && (rdGranted_4 == 2'b10)))));
    _zz_when_Axi4LiteCrossbar_l400_10[3] = ((io_masters_3_ar_valid && _zz__zz_when_Axi4LiteCrossbar_l400_10_3[2]) && (! ((((rdActive_0 && (rdGranted_0 == 2'b11)) || (rdActive_1 && (rdGranted_1 == 2'b11))) || ((rdActive_2 && (rdGranted_2 == 2'b11)) || (rdActive_3 && (rdGranted_3 == 2'b11)))) || (rdActive_4 && (rdGranted_4 == 2'b11)))));
  end

  always @(*) begin
    _zz_when_Axi4LiteCrossbar_l400_12[0] = (io_masters_1_ar_payload_addr[31 : 16] == 16'h0);
    _zz_when_Axi4LiteCrossbar_l400_12[1] = (io_masters_1_ar_payload_addr[31 : 16] == 16'h0001);
    _zz_when_Axi4LiteCrossbar_l400_12[2] = (io_masters_1_ar_payload_addr[31 : 16] == 16'h0002);
    _zz_when_Axi4LiteCrossbar_l400_12[3] = (io_masters_1_ar_payload_addr[31 : 16] == 16'h0003);
  end

  always @(*) begin
    _zz_when_Axi4LiteCrossbar_l400_13[0] = (io_masters_2_ar_payload_addr[31 : 16] == 16'h0);
    _zz_when_Axi4LiteCrossbar_l400_13[1] = (io_masters_2_ar_payload_addr[31 : 16] == 16'h0001);
    _zz_when_Axi4LiteCrossbar_l400_13[2] = (io_masters_2_ar_payload_addr[31 : 16] == 16'h0002);
    _zz_when_Axi4LiteCrossbar_l400_13[3] = (io_masters_2_ar_payload_addr[31 : 16] == 16'h0003);
  end

  always @(*) begin
    _zz_when_Axi4LiteCrossbar_l400_14[0] = (io_masters_3_ar_payload_addr[31 : 16] == 16'h0);
    _zz_when_Axi4LiteCrossbar_l400_14[1] = (io_masters_3_ar_payload_addr[31 : 16] == 16'h0001);
    _zz_when_Axi4LiteCrossbar_l400_14[2] = (io_masters_3_ar_payload_addr[31 : 16] == 16'h0002);
    _zz_when_Axi4LiteCrossbar_l400_14[3] = (io_masters_3_ar_payload_addr[31 : 16] == 16'h0003);
  end

  assign _zz_when_Axi4LiteCrossbar_l149_14 = _zz_when_Axi4LiteCrossbar_l400_10;
  assign _zz_when_Axi4LiteCrossbar_l149_15 = (_zz_when_Axi4LiteCrossbar_l149_14 & (~ _zz__zz_when_Axi4LiteCrossbar_l149_15));
  always @(*) begin
    _zz_rdGranted_2 = 2'b00;
    if(when_Axi4LiteCrossbar_l149_28) begin
      _zz_rdGranted_2 = 2'b00;
    end
    if(when_Axi4LiteCrossbar_l149_29) begin
      _zz_rdGranted_2 = 2'b01;
    end
    if(when_Axi4LiteCrossbar_l149_30) begin
      _zz_rdGranted_2 = 2'b10;
    end
    if(when_Axi4LiteCrossbar_l149_31) begin
      _zz_rdGranted_2 = 2'b11;
    end
  end

  assign when_Axi4LiteCrossbar_l149_28 = _zz_when_Axi4LiteCrossbar_l149_15[0];
  assign when_Axi4LiteCrossbar_l149_29 = _zz_when_Axi4LiteCrossbar_l149_15[1];
  assign when_Axi4LiteCrossbar_l149_30 = _zz_when_Axi4LiteCrossbar_l149_15[2];
  assign when_Axi4LiteCrossbar_l149_31 = _zz_when_Axi4LiteCrossbar_l149_15[3];
  assign _zz_rdGranted_2_1 = (grantLock_7 ? grantLockIdx_7 : _zz_rdGranted_2);
  assign when_Axi4LiteCrossbar_l184_7 = (io_slaves_2_ar_valid && (! io_slaves_2_ar_ready));
  assign when_Axi4LiteCrossbar_l400_2 = (|_zz_when_Axi4LiteCrossbar_l400_10);
  assign when_Axi4LiteCrossbar_l403_8 = (_zz_rdGranted_2_1 == 2'b00);
  assign when_Axi4LiteCrossbar_l403_9 = (_zz_rdGranted_2_1 == 2'b01);
  assign when_Axi4LiteCrossbar_l403_10 = (_zz_rdGranted_2_1 == 2'b10);
  assign when_Axi4LiteCrossbar_l403_11 = (_zz_rdGranted_2_1 == 2'b11);
  assign io_slaves_2_ar_fire = (io_slaves_2_ar_valid && io_slaves_2_ar_ready);
  assign when_Axi4LiteCrossbar_l446_8 = (rdGranted_2 == 2'b00);
  assign when_Axi4LiteCrossbar_l446_9 = (rdGranted_2 == 2'b01);
  assign when_Axi4LiteCrossbar_l446_10 = (rdGranted_2 == 2'b10);
  assign when_Axi4LiteCrossbar_l446_11 = (rdGranted_2 == 2'b11);
  assign io_slaves_2_r_fire = (io_slaves_2_r_valid && io_slaves_2_r_ready);
  assign when_Axi4LiteCrossbar_l388_3 = (! rdActive_3);
  always @(*) begin
    _zz_when_Axi4LiteCrossbar_l400_16[0] = (io_masters_0_ar_payload_addr[31 : 16] == 16'h0);
    _zz_when_Axi4LiteCrossbar_l400_16[1] = (io_masters_0_ar_payload_addr[31 : 16] == 16'h0001);
    _zz_when_Axi4LiteCrossbar_l400_16[2] = (io_masters_0_ar_payload_addr[31 : 16] == 16'h0002);
    _zz_when_Axi4LiteCrossbar_l400_16[3] = (io_masters_0_ar_payload_addr[31 : 16] == 16'h0003);
  end

  always @(*) begin
    _zz_when_Axi4LiteCrossbar_l400_15[0] = ((io_masters_0_ar_valid && _zz__zz_when_Axi4LiteCrossbar_l400_15[3]) && (! ((((rdActive_0 && (rdGranted_0 == 2'b00)) || (rdActive_1 && (rdGranted_1 == 2'b00))) || ((rdActive_2 && (rdGranted_2 == 2'b00)) || (rdActive_3 && (rdGranted_3 == 2'b00)))) || (rdActive_4 && (rdGranted_4 == 2'b00)))));
    _zz_when_Axi4LiteCrossbar_l400_15[1] = ((io_masters_1_ar_valid && _zz__zz_when_Axi4LiteCrossbar_l400_15_1[3]) && (! ((((rdActive_0 && (rdGranted_0 == 2'b01)) || (rdActive_1 && (rdGranted_1 == 2'b01))) || ((rdActive_2 && (rdGranted_2 == 2'b01)) || (rdActive_3 && (rdGranted_3 == 2'b01)))) || (rdActive_4 && (rdGranted_4 == 2'b01)))));
    _zz_when_Axi4LiteCrossbar_l400_15[2] = ((io_masters_2_ar_valid && _zz__zz_when_Axi4LiteCrossbar_l400_15_2[3]) && (! ((((rdActive_0 && (rdGranted_0 == 2'b10)) || (rdActive_1 && (rdGranted_1 == 2'b10))) || ((rdActive_2 && (rdGranted_2 == 2'b10)) || (rdActive_3 && (rdGranted_3 == 2'b10)))) || (rdActive_4 && (rdGranted_4 == 2'b10)))));
    _zz_when_Axi4LiteCrossbar_l400_15[3] = ((io_masters_3_ar_valid && _zz__zz_when_Axi4LiteCrossbar_l400_15_3[3]) && (! ((((rdActive_0 && (rdGranted_0 == 2'b11)) || (rdActive_1 && (rdGranted_1 == 2'b11))) || ((rdActive_2 && (rdGranted_2 == 2'b11)) || (rdActive_3 && (rdGranted_3 == 2'b11)))) || (rdActive_4 && (rdGranted_4 == 2'b11)))));
  end

  always @(*) begin
    _zz_when_Axi4LiteCrossbar_l400_17[0] = (io_masters_1_ar_payload_addr[31 : 16] == 16'h0);
    _zz_when_Axi4LiteCrossbar_l400_17[1] = (io_masters_1_ar_payload_addr[31 : 16] == 16'h0001);
    _zz_when_Axi4LiteCrossbar_l400_17[2] = (io_masters_1_ar_payload_addr[31 : 16] == 16'h0002);
    _zz_when_Axi4LiteCrossbar_l400_17[3] = (io_masters_1_ar_payload_addr[31 : 16] == 16'h0003);
  end

  always @(*) begin
    _zz_when_Axi4LiteCrossbar_l400_18[0] = (io_masters_2_ar_payload_addr[31 : 16] == 16'h0);
    _zz_when_Axi4LiteCrossbar_l400_18[1] = (io_masters_2_ar_payload_addr[31 : 16] == 16'h0001);
    _zz_when_Axi4LiteCrossbar_l400_18[2] = (io_masters_2_ar_payload_addr[31 : 16] == 16'h0002);
    _zz_when_Axi4LiteCrossbar_l400_18[3] = (io_masters_2_ar_payload_addr[31 : 16] == 16'h0003);
  end

  always @(*) begin
    _zz_when_Axi4LiteCrossbar_l400_19[0] = (io_masters_3_ar_payload_addr[31 : 16] == 16'h0);
    _zz_when_Axi4LiteCrossbar_l400_19[1] = (io_masters_3_ar_payload_addr[31 : 16] == 16'h0001);
    _zz_when_Axi4LiteCrossbar_l400_19[2] = (io_masters_3_ar_payload_addr[31 : 16] == 16'h0002);
    _zz_when_Axi4LiteCrossbar_l400_19[3] = (io_masters_3_ar_payload_addr[31 : 16] == 16'h0003);
  end

  assign _zz_when_Axi4LiteCrossbar_l149_16 = _zz_when_Axi4LiteCrossbar_l400_15;
  assign _zz_when_Axi4LiteCrossbar_l149_17 = (_zz_when_Axi4LiteCrossbar_l149_16 & (~ _zz__zz_when_Axi4LiteCrossbar_l149_17));
  always @(*) begin
    _zz_rdGranted_3 = 2'b00;
    if(when_Axi4LiteCrossbar_l149_32) begin
      _zz_rdGranted_3 = 2'b00;
    end
    if(when_Axi4LiteCrossbar_l149_33) begin
      _zz_rdGranted_3 = 2'b01;
    end
    if(when_Axi4LiteCrossbar_l149_34) begin
      _zz_rdGranted_3 = 2'b10;
    end
    if(when_Axi4LiteCrossbar_l149_35) begin
      _zz_rdGranted_3 = 2'b11;
    end
  end

  assign when_Axi4LiteCrossbar_l149_32 = _zz_when_Axi4LiteCrossbar_l149_17[0];
  assign when_Axi4LiteCrossbar_l149_33 = _zz_when_Axi4LiteCrossbar_l149_17[1];
  assign when_Axi4LiteCrossbar_l149_34 = _zz_when_Axi4LiteCrossbar_l149_17[2];
  assign when_Axi4LiteCrossbar_l149_35 = _zz_when_Axi4LiteCrossbar_l149_17[3];
  assign _zz_rdGranted_3_1 = (grantLock_8 ? grantLockIdx_8 : _zz_rdGranted_3);
  assign when_Axi4LiteCrossbar_l184_8 = (io_slaves_3_ar_valid && (! io_slaves_3_ar_ready));
  assign when_Axi4LiteCrossbar_l400_3 = (|_zz_when_Axi4LiteCrossbar_l400_15);
  assign when_Axi4LiteCrossbar_l403_12 = (_zz_rdGranted_3_1 == 2'b00);
  assign when_Axi4LiteCrossbar_l403_13 = (_zz_rdGranted_3_1 == 2'b01);
  assign when_Axi4LiteCrossbar_l403_14 = (_zz_rdGranted_3_1 == 2'b10);
  assign when_Axi4LiteCrossbar_l403_15 = (_zz_rdGranted_3_1 == 2'b11);
  assign io_slaves_3_ar_fire = (io_slaves_3_ar_valid && io_slaves_3_ar_ready);
  assign when_Axi4LiteCrossbar_l446_12 = (rdGranted_3 == 2'b00);
  assign when_Axi4LiteCrossbar_l446_13 = (rdGranted_3 == 2'b01);
  assign when_Axi4LiteCrossbar_l446_14 = (rdGranted_3 == 2'b10);
  assign when_Axi4LiteCrossbar_l446_15 = (rdGranted_3 == 2'b11);
  assign io_slaves_3_r_fire = (io_slaves_3_r_valid && io_slaves_3_r_ready);
  assign when_Axi4LiteCrossbar_l388_4 = (! rdActive_4);
  always @(*) begin
    _zz_when_Axi4LiteCrossbar_l400_21[0] = (io_masters_0_ar_payload_addr[31 : 16] == 16'h0);
    _zz_when_Axi4LiteCrossbar_l400_21[1] = (io_masters_0_ar_payload_addr[31 : 16] == 16'h0001);
    _zz_when_Axi4LiteCrossbar_l400_21[2] = (io_masters_0_ar_payload_addr[31 : 16] == 16'h0002);
    _zz_when_Axi4LiteCrossbar_l400_21[3] = (io_masters_0_ar_payload_addr[31 : 16] == 16'h0003);
  end

  always @(*) begin
    _zz_when_Axi4LiteCrossbar_l400_20[0] = ((io_masters_0_ar_valid && _zz__zz_when_Axi4LiteCrossbar_l400_20[4]) && (! ((((rdActive_0 && (rdGranted_0 == 2'b00)) || (rdActive_1 && (rdGranted_1 == 2'b00))) || ((rdActive_2 && (rdGranted_2 == 2'b00)) || (rdActive_3 && (rdGranted_3 == 2'b00)))) || (rdActive_4 && (rdGranted_4 == 2'b00)))));
    _zz_when_Axi4LiteCrossbar_l400_20[1] = ((io_masters_1_ar_valid && _zz__zz_when_Axi4LiteCrossbar_l400_20_1[4]) && (! ((((rdActive_0 && (rdGranted_0 == 2'b01)) || (rdActive_1 && (rdGranted_1 == 2'b01))) || ((rdActive_2 && (rdGranted_2 == 2'b01)) || (rdActive_3 && (rdGranted_3 == 2'b01)))) || (rdActive_4 && (rdGranted_4 == 2'b01)))));
    _zz_when_Axi4LiteCrossbar_l400_20[2] = ((io_masters_2_ar_valid && _zz__zz_when_Axi4LiteCrossbar_l400_20_2[4]) && (! ((((rdActive_0 && (rdGranted_0 == 2'b10)) || (rdActive_1 && (rdGranted_1 == 2'b10))) || ((rdActive_2 && (rdGranted_2 == 2'b10)) || (rdActive_3 && (rdGranted_3 == 2'b10)))) || (rdActive_4 && (rdGranted_4 == 2'b10)))));
    _zz_when_Axi4LiteCrossbar_l400_20[3] = ((io_masters_3_ar_valid && _zz__zz_when_Axi4LiteCrossbar_l400_20_3[4]) && (! ((((rdActive_0 && (rdGranted_0 == 2'b11)) || (rdActive_1 && (rdGranted_1 == 2'b11))) || ((rdActive_2 && (rdGranted_2 == 2'b11)) || (rdActive_3 && (rdGranted_3 == 2'b11)))) || (rdActive_4 && (rdGranted_4 == 2'b11)))));
  end

  always @(*) begin
    _zz_when_Axi4LiteCrossbar_l400_22[0] = (io_masters_1_ar_payload_addr[31 : 16] == 16'h0);
    _zz_when_Axi4LiteCrossbar_l400_22[1] = (io_masters_1_ar_payload_addr[31 : 16] == 16'h0001);
    _zz_when_Axi4LiteCrossbar_l400_22[2] = (io_masters_1_ar_payload_addr[31 : 16] == 16'h0002);
    _zz_when_Axi4LiteCrossbar_l400_22[3] = (io_masters_1_ar_payload_addr[31 : 16] == 16'h0003);
  end

  always @(*) begin
    _zz_when_Axi4LiteCrossbar_l400_23[0] = (io_masters_2_ar_payload_addr[31 : 16] == 16'h0);
    _zz_when_Axi4LiteCrossbar_l400_23[1] = (io_masters_2_ar_payload_addr[31 : 16] == 16'h0001);
    _zz_when_Axi4LiteCrossbar_l400_23[2] = (io_masters_2_ar_payload_addr[31 : 16] == 16'h0002);
    _zz_when_Axi4LiteCrossbar_l400_23[3] = (io_masters_2_ar_payload_addr[31 : 16] == 16'h0003);
  end

  always @(*) begin
    _zz_when_Axi4LiteCrossbar_l400_24[0] = (io_masters_3_ar_payload_addr[31 : 16] == 16'h0);
    _zz_when_Axi4LiteCrossbar_l400_24[1] = (io_masters_3_ar_payload_addr[31 : 16] == 16'h0001);
    _zz_when_Axi4LiteCrossbar_l400_24[2] = (io_masters_3_ar_payload_addr[31 : 16] == 16'h0002);
    _zz_when_Axi4LiteCrossbar_l400_24[3] = (io_masters_3_ar_payload_addr[31 : 16] == 16'h0003);
  end

  assign _zz_when_Axi4LiteCrossbar_l149_18 = _zz_when_Axi4LiteCrossbar_l400_20;
  assign _zz_when_Axi4LiteCrossbar_l149_19 = (_zz_when_Axi4LiteCrossbar_l149_18 & (~ _zz__zz_when_Axi4LiteCrossbar_l149_19));
  always @(*) begin
    _zz_rdGranted_4 = 2'b00;
    if(when_Axi4LiteCrossbar_l149_36) begin
      _zz_rdGranted_4 = 2'b00;
    end
    if(when_Axi4LiteCrossbar_l149_37) begin
      _zz_rdGranted_4 = 2'b01;
    end
    if(when_Axi4LiteCrossbar_l149_38) begin
      _zz_rdGranted_4 = 2'b10;
    end
    if(when_Axi4LiteCrossbar_l149_39) begin
      _zz_rdGranted_4 = 2'b11;
    end
  end

  assign when_Axi4LiteCrossbar_l149_36 = _zz_when_Axi4LiteCrossbar_l149_19[0];
  assign when_Axi4LiteCrossbar_l149_37 = _zz_when_Axi4LiteCrossbar_l149_19[1];
  assign when_Axi4LiteCrossbar_l149_38 = _zz_when_Axi4LiteCrossbar_l149_19[2];
  assign when_Axi4LiteCrossbar_l149_39 = _zz_when_Axi4LiteCrossbar_l149_19[3];
  assign _zz_rdGranted_4_1 = (grantLock_9 ? grantLockIdx_9 : _zz_rdGranted_4);
  assign when_Axi4LiteCrossbar_l184_9 = (decErr_io_axi_ar_valid && (! decErr_io_axi_ar_ready));
  assign when_Axi4LiteCrossbar_l400_4 = (|_zz_when_Axi4LiteCrossbar_l400_20);
  assign when_Axi4LiteCrossbar_l403_16 = (_zz_rdGranted_4_1 == 2'b00);
  assign when_Axi4LiteCrossbar_l403_17 = (_zz_rdGranted_4_1 == 2'b01);
  assign when_Axi4LiteCrossbar_l403_18 = (_zz_rdGranted_4_1 == 2'b10);
  assign when_Axi4LiteCrossbar_l403_19 = (_zz_rdGranted_4_1 == 2'b11);
  assign decErr_io_axi_ar_fire = (decErr_io_axi_ar_valid && decErr_io_axi_ar_ready);
  assign when_Axi4LiteCrossbar_l446_16 = (rdGranted_4 == 2'b00);
  assign when_Axi4LiteCrossbar_l446_17 = (rdGranted_4 == 2'b01);
  assign when_Axi4LiteCrossbar_l446_18 = (rdGranted_4 == 2'b10);
  assign when_Axi4LiteCrossbar_l446_19 = (rdGranted_4 == 2'b11);
  assign decErr_io_axi_r_fire = (decErr_io_axi_r_valid && decErr_io_axi_r_ready);
  always @(posedge clk) begin
    if(!resetn) begin
      wrActive_0 <= 1'b0;
      wrActive_1 <= 1'b0;
      wrActive_2 <= 1'b0;
      wrActive_3 <= 1'b0;
      wrActive_4 <= 1'b0;
      wrGranted_0 <= 2'b00;
      wrGranted_1 <= 2'b00;
      wrGranted_2 <= 2'b00;
      wrGranted_3 <= 2'b00;
      wrGranted_4 <= 2'b00;
      wrDataDone_0 <= 1'b0;
      wrDataDone_1 <= 1'b0;
      wrDataDone_2 <= 1'b0;
      wrDataDone_3 <= 1'b0;
      wrDataDone_4 <= 1'b0;
      wrRrPtr_0 <= 2'b00;
      wrRrPtr_1 <= 2'b00;
      wrRrPtr_2 <= 2'b00;
      wrRrPtr_3 <= 2'b00;
      wrRrPtr_4 <= 2'b00;
      rdActive_0 <= 1'b0;
      rdActive_1 <= 1'b0;
      rdActive_2 <= 1'b0;
      rdActive_3 <= 1'b0;
      rdActive_4 <= 1'b0;
      rdGranted_0 <= 2'b00;
      rdGranted_1 <= 2'b00;
      rdGranted_2 <= 2'b00;
      rdGranted_3 <= 2'b00;
      rdGranted_4 <= 2'b00;
      rdRrPtr_0 <= 2'b00;
      rdRrPtr_1 <= 2'b00;
      rdRrPtr_2 <= 2'b00;
      rdRrPtr_3 <= 2'b00;
      rdRrPtr_4 <= 2'b00;
    end else begin
      if(when_Axi4LiteCrossbar_l284) begin
        if(when_Axi4LiteCrossbar_l297) begin
          if(io_slaves_0_aw_fire) begin
            wrActive_0 <= 1'b1;
            wrGranted_0 <= _zz_wrGranted_0_1;
            wrRrPtr_0 <= (_zz_wrGranted_0_1 + 2'b01);
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
            wrRrPtr_1 <= (_zz_wrGranted_1_1 + 2'b01);
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
            wrRrPtr_2 <= (_zz_wrGranted_2_1 + 2'b01);
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
            wrRrPtr_3 <= (_zz_wrGranted_3_1 + 2'b01);
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
            wrRrPtr_4 <= (_zz_wrGranted_4_1 + 2'b01);
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
            rdRrPtr_0 <= (_zz_rdGranted_0_1 + 2'b01);
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
            rdRrPtr_1 <= (_zz_rdGranted_1_1 + 2'b01);
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
            rdRrPtr_2 <= (_zz_rdGranted_2_1 + 2'b01);
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
            rdRrPtr_3 <= (_zz_rdGranted_3_1 + 2'b01);
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
            rdRrPtr_4 <= (_zz_rdGranted_4_1 + 2'b01);
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
      grantLockIdx <= 2'b00;
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
      grantLockIdx_1 <= 2'b00;
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
      grantLockIdx_2 <= 2'b00;
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
      grantLockIdx_3 <= 2'b00;
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
      grantLockIdx_4 <= 2'b00;
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
      grantLockIdx_5 <= 2'b00;
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
      grantLockIdx_6 <= 2'b00;
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
      grantLockIdx_7 <= 2'b00;
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
      grantLockIdx_8 <= 2'b00;
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
      grantLockIdx_9 <= 2'b00;
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
