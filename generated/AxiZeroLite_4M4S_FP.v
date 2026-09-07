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
  wire       [4:0]    _zz__zz_when_Axi4LiteCrossbar_l229;
  wire       [4:0]    _zz__zz_when_Axi4LiteCrossbar_l229_1;
  wire       [4:0]    _zz__zz_when_Axi4LiteCrossbar_l229_2;
  wire       [4:0]    _zz__zz_when_Axi4LiteCrossbar_l229_3;
  wire       [3:0]    _zz__zz_when_Axi4LiteCrossbar_l152_1;
  wire       [4:0]    _zz__zz_when_Axi4LiteCrossbar_l229_5;
  wire       [4:0]    _zz__zz_when_Axi4LiteCrossbar_l229_5_1;
  wire       [4:0]    _zz__zz_when_Axi4LiteCrossbar_l229_5_2;
  wire       [4:0]    _zz__zz_when_Axi4LiteCrossbar_l229_5_3;
  wire       [3:0]    _zz__zz_when_Axi4LiteCrossbar_l152_3;
  wire       [4:0]    _zz__zz_when_Axi4LiteCrossbar_l229_10;
  wire       [4:0]    _zz__zz_when_Axi4LiteCrossbar_l229_10_1;
  wire       [4:0]    _zz__zz_when_Axi4LiteCrossbar_l229_10_2;
  wire       [4:0]    _zz__zz_when_Axi4LiteCrossbar_l229_10_3;
  wire       [3:0]    _zz__zz_when_Axi4LiteCrossbar_l152_5;
  wire       [4:0]    _zz__zz_when_Axi4LiteCrossbar_l229_15;
  wire       [4:0]    _zz__zz_when_Axi4LiteCrossbar_l229_15_1;
  wire       [4:0]    _zz__zz_when_Axi4LiteCrossbar_l229_15_2;
  wire       [4:0]    _zz__zz_when_Axi4LiteCrossbar_l229_15_3;
  wire       [3:0]    _zz__zz_when_Axi4LiteCrossbar_l152_7;
  wire       [4:0]    _zz__zz_when_Axi4LiteCrossbar_l229_20;
  wire       [4:0]    _zz__zz_when_Axi4LiteCrossbar_l229_20_1;
  wire       [4:0]    _zz__zz_when_Axi4LiteCrossbar_l229_20_2;
  wire       [4:0]    _zz__zz_when_Axi4LiteCrossbar_l229_20_3;
  wire       [3:0]    _zz__zz_when_Axi4LiteCrossbar_l152_9;
  wire       [4:0]    _zz__zz_when_Axi4LiteCrossbar_l317;
  wire       [4:0]    _zz__zz_when_Axi4LiteCrossbar_l317_1;
  wire       [4:0]    _zz__zz_when_Axi4LiteCrossbar_l317_2;
  wire       [4:0]    _zz__zz_when_Axi4LiteCrossbar_l317_3;
  wire       [3:0]    _zz__zz_when_Axi4LiteCrossbar_l152_11;
  wire       [4:0]    _zz__zz_when_Axi4LiteCrossbar_l317_5;
  wire       [4:0]    _zz__zz_when_Axi4LiteCrossbar_l317_5_1;
  wire       [4:0]    _zz__zz_when_Axi4LiteCrossbar_l317_5_2;
  wire       [4:0]    _zz__zz_when_Axi4LiteCrossbar_l317_5_3;
  wire       [3:0]    _zz__zz_when_Axi4LiteCrossbar_l152_13;
  wire       [4:0]    _zz__zz_when_Axi4LiteCrossbar_l317_10;
  wire       [4:0]    _zz__zz_when_Axi4LiteCrossbar_l317_10_1;
  wire       [4:0]    _zz__zz_when_Axi4LiteCrossbar_l317_10_2;
  wire       [4:0]    _zz__zz_when_Axi4LiteCrossbar_l317_10_3;
  wire       [3:0]    _zz__zz_when_Axi4LiteCrossbar_l152_15;
  wire       [4:0]    _zz__zz_when_Axi4LiteCrossbar_l317_15;
  wire       [4:0]    _zz__zz_when_Axi4LiteCrossbar_l317_15_1;
  wire       [4:0]    _zz__zz_when_Axi4LiteCrossbar_l317_15_2;
  wire       [4:0]    _zz__zz_when_Axi4LiteCrossbar_l317_15_3;
  wire       [3:0]    _zz__zz_when_Axi4LiteCrossbar_l152_17;
  wire       [4:0]    _zz__zz_when_Axi4LiteCrossbar_l317_20;
  wire       [4:0]    _zz__zz_when_Axi4LiteCrossbar_l317_20_1;
  wire       [4:0]    _zz__zz_when_Axi4LiteCrossbar_l317_20_2;
  wire       [4:0]    _zz__zz_when_Axi4LiteCrossbar_l317_20_3;
  wire       [3:0]    _zz__zz_when_Axi4LiteCrossbar_l152_19;
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
  wire                when_Axi4LiteCrossbar_l217;
  reg        [3:0]    _zz_when_Axi4LiteCrossbar_l229;
  reg        [3:0]    _zz_when_Axi4LiteCrossbar_l229_1;
  reg        [3:0]    _zz_when_Axi4LiteCrossbar_l229_2;
  reg        [3:0]    _zz_when_Axi4LiteCrossbar_l229_3;
  reg        [3:0]    _zz_when_Axi4LiteCrossbar_l229_4;
  wire       [3:0]    _zz_when_Axi4LiteCrossbar_l152;
  wire       [3:0]    _zz_when_Axi4LiteCrossbar_l152_1;
  reg        [1:0]    _zz_wrGranted_0;
  wire                when_Axi4LiteCrossbar_l152;
  wire                when_Axi4LiteCrossbar_l152_1;
  wire                when_Axi4LiteCrossbar_l152_2;
  wire                when_Axi4LiteCrossbar_l152_3;
  wire                when_Axi4LiteCrossbar_l229;
  wire                when_Axi4LiteCrossbar_l233;
  wire                when_Axi4LiteCrossbar_l233_1;
  wire                when_Axi4LiteCrossbar_l233_2;
  wire                when_Axi4LiteCrossbar_l233_3;
  wire                io_slaves_0_aw_fire;
  wire                when_Axi4LiteCrossbar_l285;
  wire                when_Axi4LiteCrossbar_l285_1;
  wire                when_Axi4LiteCrossbar_l285_2;
  wire                when_Axi4LiteCrossbar_l285_3;
  wire                io_slaves_0_b_fire;
  wire                when_Axi4LiteCrossbar_l217_1;
  reg        [3:0]    _zz_when_Axi4LiteCrossbar_l229_5;
  reg        [3:0]    _zz_when_Axi4LiteCrossbar_l229_6;
  reg        [3:0]    _zz_when_Axi4LiteCrossbar_l229_7;
  reg        [3:0]    _zz_when_Axi4LiteCrossbar_l229_8;
  reg        [3:0]    _zz_when_Axi4LiteCrossbar_l229_9;
  wire       [3:0]    _zz_when_Axi4LiteCrossbar_l152_2;
  wire       [3:0]    _zz_when_Axi4LiteCrossbar_l152_3;
  reg        [1:0]    _zz_wrGranted_1;
  wire                when_Axi4LiteCrossbar_l152_4;
  wire                when_Axi4LiteCrossbar_l152_5;
  wire                when_Axi4LiteCrossbar_l152_6;
  wire                when_Axi4LiteCrossbar_l152_7;
  wire                when_Axi4LiteCrossbar_l229_1;
  wire                when_Axi4LiteCrossbar_l233_4;
  wire                when_Axi4LiteCrossbar_l233_5;
  wire                when_Axi4LiteCrossbar_l233_6;
  wire                when_Axi4LiteCrossbar_l233_7;
  wire                io_slaves_1_aw_fire;
  wire                when_Axi4LiteCrossbar_l285_4;
  wire                when_Axi4LiteCrossbar_l285_5;
  wire                when_Axi4LiteCrossbar_l285_6;
  wire                when_Axi4LiteCrossbar_l285_7;
  wire                io_slaves_1_b_fire;
  wire                when_Axi4LiteCrossbar_l217_2;
  reg        [3:0]    _zz_when_Axi4LiteCrossbar_l229_10;
  reg        [3:0]    _zz_when_Axi4LiteCrossbar_l229_11;
  reg        [3:0]    _zz_when_Axi4LiteCrossbar_l229_12;
  reg        [3:0]    _zz_when_Axi4LiteCrossbar_l229_13;
  reg        [3:0]    _zz_when_Axi4LiteCrossbar_l229_14;
  wire       [3:0]    _zz_when_Axi4LiteCrossbar_l152_4;
  wire       [3:0]    _zz_when_Axi4LiteCrossbar_l152_5;
  reg        [1:0]    _zz_wrGranted_2;
  wire                when_Axi4LiteCrossbar_l152_8;
  wire                when_Axi4LiteCrossbar_l152_9;
  wire                when_Axi4LiteCrossbar_l152_10;
  wire                when_Axi4LiteCrossbar_l152_11;
  wire                when_Axi4LiteCrossbar_l229_2;
  wire                when_Axi4LiteCrossbar_l233_8;
  wire                when_Axi4LiteCrossbar_l233_9;
  wire                when_Axi4LiteCrossbar_l233_10;
  wire                when_Axi4LiteCrossbar_l233_11;
  wire                io_slaves_2_aw_fire;
  wire                when_Axi4LiteCrossbar_l285_8;
  wire                when_Axi4LiteCrossbar_l285_9;
  wire                when_Axi4LiteCrossbar_l285_10;
  wire                when_Axi4LiteCrossbar_l285_11;
  wire                io_slaves_2_b_fire;
  wire                when_Axi4LiteCrossbar_l217_3;
  reg        [3:0]    _zz_when_Axi4LiteCrossbar_l229_15;
  reg        [3:0]    _zz_when_Axi4LiteCrossbar_l229_16;
  reg        [3:0]    _zz_when_Axi4LiteCrossbar_l229_17;
  reg        [3:0]    _zz_when_Axi4LiteCrossbar_l229_18;
  reg        [3:0]    _zz_when_Axi4LiteCrossbar_l229_19;
  wire       [3:0]    _zz_when_Axi4LiteCrossbar_l152_6;
  wire       [3:0]    _zz_when_Axi4LiteCrossbar_l152_7;
  reg        [1:0]    _zz_wrGranted_3;
  wire                when_Axi4LiteCrossbar_l152_12;
  wire                when_Axi4LiteCrossbar_l152_13;
  wire                when_Axi4LiteCrossbar_l152_14;
  wire                when_Axi4LiteCrossbar_l152_15;
  wire                when_Axi4LiteCrossbar_l229_3;
  wire                when_Axi4LiteCrossbar_l233_12;
  wire                when_Axi4LiteCrossbar_l233_13;
  wire                when_Axi4LiteCrossbar_l233_14;
  wire                when_Axi4LiteCrossbar_l233_15;
  wire                io_slaves_3_aw_fire;
  wire                when_Axi4LiteCrossbar_l285_12;
  wire                when_Axi4LiteCrossbar_l285_13;
  wire                when_Axi4LiteCrossbar_l285_14;
  wire                when_Axi4LiteCrossbar_l285_15;
  wire                io_slaves_3_b_fire;
  wire                when_Axi4LiteCrossbar_l217_4;
  reg        [3:0]    _zz_when_Axi4LiteCrossbar_l229_20;
  reg        [3:0]    _zz_when_Axi4LiteCrossbar_l229_21;
  reg        [3:0]    _zz_when_Axi4LiteCrossbar_l229_22;
  reg        [3:0]    _zz_when_Axi4LiteCrossbar_l229_23;
  reg        [3:0]    _zz_when_Axi4LiteCrossbar_l229_24;
  wire       [3:0]    _zz_when_Axi4LiteCrossbar_l152_8;
  wire       [3:0]    _zz_when_Axi4LiteCrossbar_l152_9;
  reg        [1:0]    _zz_wrGranted_4;
  wire                when_Axi4LiteCrossbar_l152_16;
  wire                when_Axi4LiteCrossbar_l152_17;
  wire                when_Axi4LiteCrossbar_l152_18;
  wire                when_Axi4LiteCrossbar_l152_19;
  wire                when_Axi4LiteCrossbar_l229_4;
  wire                when_Axi4LiteCrossbar_l233_16;
  wire                when_Axi4LiteCrossbar_l233_17;
  wire                when_Axi4LiteCrossbar_l233_18;
  wire                when_Axi4LiteCrossbar_l233_19;
  wire                decErr_io_axi_aw_fire;
  wire                when_Axi4LiteCrossbar_l285_16;
  wire                when_Axi4LiteCrossbar_l285_17;
  wire                when_Axi4LiteCrossbar_l285_18;
  wire                when_Axi4LiteCrossbar_l285_19;
  wire                decErr_io_axi_b_fire;
  wire                when_Axi4LiteCrossbar_l306;
  reg        [3:0]    _zz_when_Axi4LiteCrossbar_l317;
  reg        [3:0]    _zz_when_Axi4LiteCrossbar_l317_1;
  reg        [3:0]    _zz_when_Axi4LiteCrossbar_l317_2;
  reg        [3:0]    _zz_when_Axi4LiteCrossbar_l317_3;
  reg        [3:0]    _zz_when_Axi4LiteCrossbar_l317_4;
  wire       [3:0]    _zz_when_Axi4LiteCrossbar_l152_10;
  wire       [3:0]    _zz_when_Axi4LiteCrossbar_l152_11;
  reg        [1:0]    _zz_rdGranted_0;
  wire                when_Axi4LiteCrossbar_l152_20;
  wire                when_Axi4LiteCrossbar_l152_21;
  wire                when_Axi4LiteCrossbar_l152_22;
  wire                when_Axi4LiteCrossbar_l152_23;
  wire                when_Axi4LiteCrossbar_l317;
  wire                when_Axi4LiteCrossbar_l320;
  wire                when_Axi4LiteCrossbar_l320_1;
  wire                when_Axi4LiteCrossbar_l320_2;
  wire                when_Axi4LiteCrossbar_l320_3;
  wire                io_slaves_0_ar_fire;
  wire                when_Axi4LiteCrossbar_l363;
  wire                when_Axi4LiteCrossbar_l363_1;
  wire                when_Axi4LiteCrossbar_l363_2;
  wire                when_Axi4LiteCrossbar_l363_3;
  wire                io_slaves_0_r_fire;
  wire                when_Axi4LiteCrossbar_l306_1;
  reg        [3:0]    _zz_when_Axi4LiteCrossbar_l317_5;
  reg        [3:0]    _zz_when_Axi4LiteCrossbar_l317_6;
  reg        [3:0]    _zz_when_Axi4LiteCrossbar_l317_7;
  reg        [3:0]    _zz_when_Axi4LiteCrossbar_l317_8;
  reg        [3:0]    _zz_when_Axi4LiteCrossbar_l317_9;
  wire       [3:0]    _zz_when_Axi4LiteCrossbar_l152_12;
  wire       [3:0]    _zz_when_Axi4LiteCrossbar_l152_13;
  reg        [1:0]    _zz_rdGranted_1;
  wire                when_Axi4LiteCrossbar_l152_24;
  wire                when_Axi4LiteCrossbar_l152_25;
  wire                when_Axi4LiteCrossbar_l152_26;
  wire                when_Axi4LiteCrossbar_l152_27;
  wire                when_Axi4LiteCrossbar_l317_1;
  wire                when_Axi4LiteCrossbar_l320_4;
  wire                when_Axi4LiteCrossbar_l320_5;
  wire                when_Axi4LiteCrossbar_l320_6;
  wire                when_Axi4LiteCrossbar_l320_7;
  wire                io_slaves_1_ar_fire;
  wire                when_Axi4LiteCrossbar_l363_4;
  wire                when_Axi4LiteCrossbar_l363_5;
  wire                when_Axi4LiteCrossbar_l363_6;
  wire                when_Axi4LiteCrossbar_l363_7;
  wire                io_slaves_1_r_fire;
  wire                when_Axi4LiteCrossbar_l306_2;
  reg        [3:0]    _zz_when_Axi4LiteCrossbar_l317_10;
  reg        [3:0]    _zz_when_Axi4LiteCrossbar_l317_11;
  reg        [3:0]    _zz_when_Axi4LiteCrossbar_l317_12;
  reg        [3:0]    _zz_when_Axi4LiteCrossbar_l317_13;
  reg        [3:0]    _zz_when_Axi4LiteCrossbar_l317_14;
  wire       [3:0]    _zz_when_Axi4LiteCrossbar_l152_14;
  wire       [3:0]    _zz_when_Axi4LiteCrossbar_l152_15;
  reg        [1:0]    _zz_rdGranted_2;
  wire                when_Axi4LiteCrossbar_l152_28;
  wire                when_Axi4LiteCrossbar_l152_29;
  wire                when_Axi4LiteCrossbar_l152_30;
  wire                when_Axi4LiteCrossbar_l152_31;
  wire                when_Axi4LiteCrossbar_l317_2;
  wire                when_Axi4LiteCrossbar_l320_8;
  wire                when_Axi4LiteCrossbar_l320_9;
  wire                when_Axi4LiteCrossbar_l320_10;
  wire                when_Axi4LiteCrossbar_l320_11;
  wire                io_slaves_2_ar_fire;
  wire                when_Axi4LiteCrossbar_l363_8;
  wire                when_Axi4LiteCrossbar_l363_9;
  wire                when_Axi4LiteCrossbar_l363_10;
  wire                when_Axi4LiteCrossbar_l363_11;
  wire                io_slaves_2_r_fire;
  wire                when_Axi4LiteCrossbar_l306_3;
  reg        [3:0]    _zz_when_Axi4LiteCrossbar_l317_15;
  reg        [3:0]    _zz_when_Axi4LiteCrossbar_l317_16;
  reg        [3:0]    _zz_when_Axi4LiteCrossbar_l317_17;
  reg        [3:0]    _zz_when_Axi4LiteCrossbar_l317_18;
  reg        [3:0]    _zz_when_Axi4LiteCrossbar_l317_19;
  wire       [3:0]    _zz_when_Axi4LiteCrossbar_l152_16;
  wire       [3:0]    _zz_when_Axi4LiteCrossbar_l152_17;
  reg        [1:0]    _zz_rdGranted_3;
  wire                when_Axi4LiteCrossbar_l152_32;
  wire                when_Axi4LiteCrossbar_l152_33;
  wire                when_Axi4LiteCrossbar_l152_34;
  wire                when_Axi4LiteCrossbar_l152_35;
  wire                when_Axi4LiteCrossbar_l317_3;
  wire                when_Axi4LiteCrossbar_l320_12;
  wire                when_Axi4LiteCrossbar_l320_13;
  wire                when_Axi4LiteCrossbar_l320_14;
  wire                when_Axi4LiteCrossbar_l320_15;
  wire                io_slaves_3_ar_fire;
  wire                when_Axi4LiteCrossbar_l363_12;
  wire                when_Axi4LiteCrossbar_l363_13;
  wire                when_Axi4LiteCrossbar_l363_14;
  wire                when_Axi4LiteCrossbar_l363_15;
  wire                io_slaves_3_r_fire;
  wire                when_Axi4LiteCrossbar_l306_4;
  reg        [3:0]    _zz_when_Axi4LiteCrossbar_l317_20;
  reg        [3:0]    _zz_when_Axi4LiteCrossbar_l317_21;
  reg        [3:0]    _zz_when_Axi4LiteCrossbar_l317_22;
  reg        [3:0]    _zz_when_Axi4LiteCrossbar_l317_23;
  reg        [3:0]    _zz_when_Axi4LiteCrossbar_l317_24;
  wire       [3:0]    _zz_when_Axi4LiteCrossbar_l152_18;
  wire       [3:0]    _zz_when_Axi4LiteCrossbar_l152_19;
  reg        [1:0]    _zz_rdGranted_4;
  wire                when_Axi4LiteCrossbar_l152_36;
  wire                when_Axi4LiteCrossbar_l152_37;
  wire                when_Axi4LiteCrossbar_l152_38;
  wire                when_Axi4LiteCrossbar_l152_39;
  wire                when_Axi4LiteCrossbar_l317_4;
  wire                when_Axi4LiteCrossbar_l320_16;
  wire                when_Axi4LiteCrossbar_l320_17;
  wire                when_Axi4LiteCrossbar_l320_18;
  wire                when_Axi4LiteCrossbar_l320_19;
  wire                decErr_io_axi_ar_fire;
  wire                when_Axi4LiteCrossbar_l363_16;
  wire                when_Axi4LiteCrossbar_l363_17;
  wire                when_Axi4LiteCrossbar_l363_18;
  wire                when_Axi4LiteCrossbar_l363_19;
  wire                decErr_io_axi_r_fire;

  assign _zz_io_masters_0_b_payload_resp = 2'b00;
  assign _zz_io_masters_1_b_payload_resp = 2'b00;
  assign _zz_io_masters_2_b_payload_resp = 2'b00;
  assign _zz_io_masters_3_b_payload_resp = 2'b00;
  assign _zz__zz_when_Axi4LiteCrossbar_l229 = {(! (|_zz_when_Axi4LiteCrossbar_l229_1)),_zz_when_Axi4LiteCrossbar_l229_1};
  assign _zz__zz_when_Axi4LiteCrossbar_l229_1 = {(! (|_zz_when_Axi4LiteCrossbar_l229_2)),_zz_when_Axi4LiteCrossbar_l229_2};
  assign _zz__zz_when_Axi4LiteCrossbar_l229_2 = {(! (|_zz_when_Axi4LiteCrossbar_l229_3)),_zz_when_Axi4LiteCrossbar_l229_3};
  assign _zz__zz_when_Axi4LiteCrossbar_l229_3 = {(! (|_zz_when_Axi4LiteCrossbar_l229_4)),_zz_when_Axi4LiteCrossbar_l229_4};
  assign _zz__zz_when_Axi4LiteCrossbar_l152_1 = (_zz_when_Axi4LiteCrossbar_l152 - 4'b0001);
  assign _zz__zz_when_Axi4LiteCrossbar_l229_5 = {(! (|_zz_when_Axi4LiteCrossbar_l229_6)),_zz_when_Axi4LiteCrossbar_l229_6};
  assign _zz__zz_when_Axi4LiteCrossbar_l229_5_1 = {(! (|_zz_when_Axi4LiteCrossbar_l229_7)),_zz_when_Axi4LiteCrossbar_l229_7};
  assign _zz__zz_when_Axi4LiteCrossbar_l229_5_2 = {(! (|_zz_when_Axi4LiteCrossbar_l229_8)),_zz_when_Axi4LiteCrossbar_l229_8};
  assign _zz__zz_when_Axi4LiteCrossbar_l229_5_3 = {(! (|_zz_when_Axi4LiteCrossbar_l229_9)),_zz_when_Axi4LiteCrossbar_l229_9};
  assign _zz__zz_when_Axi4LiteCrossbar_l152_3 = (_zz_when_Axi4LiteCrossbar_l152_2 - 4'b0001);
  assign _zz__zz_when_Axi4LiteCrossbar_l229_10 = {(! (|_zz_when_Axi4LiteCrossbar_l229_11)),_zz_when_Axi4LiteCrossbar_l229_11};
  assign _zz__zz_when_Axi4LiteCrossbar_l229_10_1 = {(! (|_zz_when_Axi4LiteCrossbar_l229_12)),_zz_when_Axi4LiteCrossbar_l229_12};
  assign _zz__zz_when_Axi4LiteCrossbar_l229_10_2 = {(! (|_zz_when_Axi4LiteCrossbar_l229_13)),_zz_when_Axi4LiteCrossbar_l229_13};
  assign _zz__zz_when_Axi4LiteCrossbar_l229_10_3 = {(! (|_zz_when_Axi4LiteCrossbar_l229_14)),_zz_when_Axi4LiteCrossbar_l229_14};
  assign _zz__zz_when_Axi4LiteCrossbar_l152_5 = (_zz_when_Axi4LiteCrossbar_l152_4 - 4'b0001);
  assign _zz__zz_when_Axi4LiteCrossbar_l229_15 = {(! (|_zz_when_Axi4LiteCrossbar_l229_16)),_zz_when_Axi4LiteCrossbar_l229_16};
  assign _zz__zz_when_Axi4LiteCrossbar_l229_15_1 = {(! (|_zz_when_Axi4LiteCrossbar_l229_17)),_zz_when_Axi4LiteCrossbar_l229_17};
  assign _zz__zz_when_Axi4LiteCrossbar_l229_15_2 = {(! (|_zz_when_Axi4LiteCrossbar_l229_18)),_zz_when_Axi4LiteCrossbar_l229_18};
  assign _zz__zz_when_Axi4LiteCrossbar_l229_15_3 = {(! (|_zz_when_Axi4LiteCrossbar_l229_19)),_zz_when_Axi4LiteCrossbar_l229_19};
  assign _zz__zz_when_Axi4LiteCrossbar_l152_7 = (_zz_when_Axi4LiteCrossbar_l152_6 - 4'b0001);
  assign _zz__zz_when_Axi4LiteCrossbar_l229_20 = {(! (|_zz_when_Axi4LiteCrossbar_l229_21)),_zz_when_Axi4LiteCrossbar_l229_21};
  assign _zz__zz_when_Axi4LiteCrossbar_l229_20_1 = {(! (|_zz_when_Axi4LiteCrossbar_l229_22)),_zz_when_Axi4LiteCrossbar_l229_22};
  assign _zz__zz_when_Axi4LiteCrossbar_l229_20_2 = {(! (|_zz_when_Axi4LiteCrossbar_l229_23)),_zz_when_Axi4LiteCrossbar_l229_23};
  assign _zz__zz_when_Axi4LiteCrossbar_l229_20_3 = {(! (|_zz_when_Axi4LiteCrossbar_l229_24)),_zz_when_Axi4LiteCrossbar_l229_24};
  assign _zz__zz_when_Axi4LiteCrossbar_l152_9 = (_zz_when_Axi4LiteCrossbar_l152_8 - 4'b0001);
  assign _zz__zz_when_Axi4LiteCrossbar_l317 = {(! (|_zz_when_Axi4LiteCrossbar_l317_1)),_zz_when_Axi4LiteCrossbar_l317_1};
  assign _zz__zz_when_Axi4LiteCrossbar_l317_1 = {(! (|_zz_when_Axi4LiteCrossbar_l317_2)),_zz_when_Axi4LiteCrossbar_l317_2};
  assign _zz__zz_when_Axi4LiteCrossbar_l317_2 = {(! (|_zz_when_Axi4LiteCrossbar_l317_3)),_zz_when_Axi4LiteCrossbar_l317_3};
  assign _zz__zz_when_Axi4LiteCrossbar_l317_3 = {(! (|_zz_when_Axi4LiteCrossbar_l317_4)),_zz_when_Axi4LiteCrossbar_l317_4};
  assign _zz__zz_when_Axi4LiteCrossbar_l152_11 = (_zz_when_Axi4LiteCrossbar_l152_10 - 4'b0001);
  assign _zz__zz_when_Axi4LiteCrossbar_l317_5 = {(! (|_zz_when_Axi4LiteCrossbar_l317_6)),_zz_when_Axi4LiteCrossbar_l317_6};
  assign _zz__zz_when_Axi4LiteCrossbar_l317_5_1 = {(! (|_zz_when_Axi4LiteCrossbar_l317_7)),_zz_when_Axi4LiteCrossbar_l317_7};
  assign _zz__zz_when_Axi4LiteCrossbar_l317_5_2 = {(! (|_zz_when_Axi4LiteCrossbar_l317_8)),_zz_when_Axi4LiteCrossbar_l317_8};
  assign _zz__zz_when_Axi4LiteCrossbar_l317_5_3 = {(! (|_zz_when_Axi4LiteCrossbar_l317_9)),_zz_when_Axi4LiteCrossbar_l317_9};
  assign _zz__zz_when_Axi4LiteCrossbar_l152_13 = (_zz_when_Axi4LiteCrossbar_l152_12 - 4'b0001);
  assign _zz__zz_when_Axi4LiteCrossbar_l317_10 = {(! (|_zz_when_Axi4LiteCrossbar_l317_11)),_zz_when_Axi4LiteCrossbar_l317_11};
  assign _zz__zz_when_Axi4LiteCrossbar_l317_10_1 = {(! (|_zz_when_Axi4LiteCrossbar_l317_12)),_zz_when_Axi4LiteCrossbar_l317_12};
  assign _zz__zz_when_Axi4LiteCrossbar_l317_10_2 = {(! (|_zz_when_Axi4LiteCrossbar_l317_13)),_zz_when_Axi4LiteCrossbar_l317_13};
  assign _zz__zz_when_Axi4LiteCrossbar_l317_10_3 = {(! (|_zz_when_Axi4LiteCrossbar_l317_14)),_zz_when_Axi4LiteCrossbar_l317_14};
  assign _zz__zz_when_Axi4LiteCrossbar_l152_15 = (_zz_when_Axi4LiteCrossbar_l152_14 - 4'b0001);
  assign _zz__zz_when_Axi4LiteCrossbar_l317_15 = {(! (|_zz_when_Axi4LiteCrossbar_l317_16)),_zz_when_Axi4LiteCrossbar_l317_16};
  assign _zz__zz_when_Axi4LiteCrossbar_l317_15_1 = {(! (|_zz_when_Axi4LiteCrossbar_l317_17)),_zz_when_Axi4LiteCrossbar_l317_17};
  assign _zz__zz_when_Axi4LiteCrossbar_l317_15_2 = {(! (|_zz_when_Axi4LiteCrossbar_l317_18)),_zz_when_Axi4LiteCrossbar_l317_18};
  assign _zz__zz_when_Axi4LiteCrossbar_l317_15_3 = {(! (|_zz_when_Axi4LiteCrossbar_l317_19)),_zz_when_Axi4LiteCrossbar_l317_19};
  assign _zz__zz_when_Axi4LiteCrossbar_l152_17 = (_zz_when_Axi4LiteCrossbar_l152_16 - 4'b0001);
  assign _zz__zz_when_Axi4LiteCrossbar_l317_20 = {(! (|_zz_when_Axi4LiteCrossbar_l317_21)),_zz_when_Axi4LiteCrossbar_l317_21};
  assign _zz__zz_when_Axi4LiteCrossbar_l317_20_1 = {(! (|_zz_when_Axi4LiteCrossbar_l317_22)),_zz_when_Axi4LiteCrossbar_l317_22};
  assign _zz__zz_when_Axi4LiteCrossbar_l317_20_2 = {(! (|_zz_when_Axi4LiteCrossbar_l317_23)),_zz_when_Axi4LiteCrossbar_l317_23};
  assign _zz__zz_when_Axi4LiteCrossbar_l317_20_3 = {(! (|_zz_when_Axi4LiteCrossbar_l317_24)),_zz_when_Axi4LiteCrossbar_l317_24};
  assign _zz__zz_when_Axi4LiteCrossbar_l152_19 = (_zz_when_Axi4LiteCrossbar_l152_18 - 4'b0001);
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
        if(when_Axi4LiteCrossbar_l233_4) begin
          io_masters_0_aw_ready = io_slaves_1_aw_ready;
        end
      end
    end
    if(when_Axi4LiteCrossbar_l217_2) begin
      if(when_Axi4LiteCrossbar_l229_2) begin
        if(when_Axi4LiteCrossbar_l233_8) begin
          io_masters_0_aw_ready = io_slaves_2_aw_ready;
        end
      end
    end
    if(when_Axi4LiteCrossbar_l217_3) begin
      if(when_Axi4LiteCrossbar_l229_3) begin
        if(when_Axi4LiteCrossbar_l233_12) begin
          io_masters_0_aw_ready = io_slaves_3_aw_ready;
        end
      end
    end
    if(when_Axi4LiteCrossbar_l217_4) begin
      if(when_Axi4LiteCrossbar_l229_4) begin
        if(when_Axi4LiteCrossbar_l233_16) begin
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
        if(when_Axi4LiteCrossbar_l233_4) begin
          io_masters_0_w_ready = io_slaves_1_w_ready;
        end
      end
    end else begin
      if(when_Axi4LiteCrossbar_l285_4) begin
        io_masters_0_w_ready = io_slaves_1_w_ready;
      end
    end
    if(when_Axi4LiteCrossbar_l217_2) begin
      if(when_Axi4LiteCrossbar_l229_2) begin
        if(when_Axi4LiteCrossbar_l233_8) begin
          io_masters_0_w_ready = io_slaves_2_w_ready;
        end
      end
    end else begin
      if(when_Axi4LiteCrossbar_l285_8) begin
        io_masters_0_w_ready = io_slaves_2_w_ready;
      end
    end
    if(when_Axi4LiteCrossbar_l217_3) begin
      if(when_Axi4LiteCrossbar_l229_3) begin
        if(when_Axi4LiteCrossbar_l233_12) begin
          io_masters_0_w_ready = io_slaves_3_w_ready;
        end
      end
    end else begin
      if(when_Axi4LiteCrossbar_l285_12) begin
        io_masters_0_w_ready = io_slaves_3_w_ready;
      end
    end
    if(when_Axi4LiteCrossbar_l217_4) begin
      if(when_Axi4LiteCrossbar_l229_4) begin
        if(when_Axi4LiteCrossbar_l233_16) begin
          io_masters_0_w_ready = decErr_io_axi_w_ready;
        end
      end
    end else begin
      if(when_Axi4LiteCrossbar_l285_16) begin
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
      if(when_Axi4LiteCrossbar_l285_4) begin
        io_masters_0_b_valid = io_slaves_1_b_valid;
      end
    end
    if(!when_Axi4LiteCrossbar_l217_2) begin
      if(when_Axi4LiteCrossbar_l285_8) begin
        io_masters_0_b_valid = io_slaves_2_b_valid;
      end
    end
    if(!when_Axi4LiteCrossbar_l217_3) begin
      if(when_Axi4LiteCrossbar_l285_12) begin
        io_masters_0_b_valid = io_slaves_3_b_valid;
      end
    end
    if(!when_Axi4LiteCrossbar_l217_4) begin
      if(when_Axi4LiteCrossbar_l285_16) begin
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
      if(when_Axi4LiteCrossbar_l285_4) begin
        io_masters_0_b_payload_resp = io_slaves_1_b_payload_resp;
      end
    end
    if(!when_Axi4LiteCrossbar_l217_2) begin
      if(when_Axi4LiteCrossbar_l285_8) begin
        io_masters_0_b_payload_resp = io_slaves_2_b_payload_resp;
      end
    end
    if(!when_Axi4LiteCrossbar_l217_3) begin
      if(when_Axi4LiteCrossbar_l285_12) begin
        io_masters_0_b_payload_resp = io_slaves_3_b_payload_resp;
      end
    end
    if(!when_Axi4LiteCrossbar_l217_4) begin
      if(when_Axi4LiteCrossbar_l285_16) begin
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
        if(when_Axi4LiteCrossbar_l320_4) begin
          io_masters_0_ar_ready = io_slaves_1_ar_ready;
        end
      end
    end
    if(when_Axi4LiteCrossbar_l306_2) begin
      if(when_Axi4LiteCrossbar_l317_2) begin
        if(when_Axi4LiteCrossbar_l320_8) begin
          io_masters_0_ar_ready = io_slaves_2_ar_ready;
        end
      end
    end
    if(when_Axi4LiteCrossbar_l306_3) begin
      if(when_Axi4LiteCrossbar_l317_3) begin
        if(when_Axi4LiteCrossbar_l320_12) begin
          io_masters_0_ar_ready = io_slaves_3_ar_ready;
        end
      end
    end
    if(when_Axi4LiteCrossbar_l306_4) begin
      if(when_Axi4LiteCrossbar_l317_4) begin
        if(when_Axi4LiteCrossbar_l320_16) begin
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
      if(when_Axi4LiteCrossbar_l363_4) begin
        io_masters_0_r_valid = io_slaves_1_r_valid;
      end
    end
    if(!when_Axi4LiteCrossbar_l306_2) begin
      if(when_Axi4LiteCrossbar_l363_8) begin
        io_masters_0_r_valid = io_slaves_2_r_valid;
      end
    end
    if(!when_Axi4LiteCrossbar_l306_3) begin
      if(when_Axi4LiteCrossbar_l363_12) begin
        io_masters_0_r_valid = io_slaves_3_r_valid;
      end
    end
    if(!when_Axi4LiteCrossbar_l306_4) begin
      if(when_Axi4LiteCrossbar_l363_16) begin
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
      if(when_Axi4LiteCrossbar_l363_4) begin
        io_masters_0_r_payload_data = io_slaves_1_r_payload_data;
      end
    end
    if(!when_Axi4LiteCrossbar_l306_2) begin
      if(when_Axi4LiteCrossbar_l363_8) begin
        io_masters_0_r_payload_data = io_slaves_2_r_payload_data;
      end
    end
    if(!when_Axi4LiteCrossbar_l306_3) begin
      if(when_Axi4LiteCrossbar_l363_12) begin
        io_masters_0_r_payload_data = io_slaves_3_r_payload_data;
      end
    end
    if(!when_Axi4LiteCrossbar_l306_4) begin
      if(when_Axi4LiteCrossbar_l363_16) begin
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
      if(when_Axi4LiteCrossbar_l363_4) begin
        io_masters_0_r_payload_resp = io_slaves_1_r_payload_resp;
      end
    end
    if(!when_Axi4LiteCrossbar_l306_2) begin
      if(when_Axi4LiteCrossbar_l363_8) begin
        io_masters_0_r_payload_resp = io_slaves_2_r_payload_resp;
      end
    end
    if(!when_Axi4LiteCrossbar_l306_3) begin
      if(when_Axi4LiteCrossbar_l363_12) begin
        io_masters_0_r_payload_resp = io_slaves_3_r_payload_resp;
      end
    end
    if(!when_Axi4LiteCrossbar_l306_4) begin
      if(when_Axi4LiteCrossbar_l363_16) begin
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
        if(when_Axi4LiteCrossbar_l233_5) begin
          io_masters_1_aw_ready = io_slaves_1_aw_ready;
        end
      end
    end
    if(when_Axi4LiteCrossbar_l217_2) begin
      if(when_Axi4LiteCrossbar_l229_2) begin
        if(when_Axi4LiteCrossbar_l233_9) begin
          io_masters_1_aw_ready = io_slaves_2_aw_ready;
        end
      end
    end
    if(when_Axi4LiteCrossbar_l217_3) begin
      if(when_Axi4LiteCrossbar_l229_3) begin
        if(when_Axi4LiteCrossbar_l233_13) begin
          io_masters_1_aw_ready = io_slaves_3_aw_ready;
        end
      end
    end
    if(when_Axi4LiteCrossbar_l217_4) begin
      if(when_Axi4LiteCrossbar_l229_4) begin
        if(when_Axi4LiteCrossbar_l233_17) begin
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
        if(when_Axi4LiteCrossbar_l233_5) begin
          io_masters_1_w_ready = io_slaves_1_w_ready;
        end
      end
    end else begin
      if(when_Axi4LiteCrossbar_l285_5) begin
        io_masters_1_w_ready = io_slaves_1_w_ready;
      end
    end
    if(when_Axi4LiteCrossbar_l217_2) begin
      if(when_Axi4LiteCrossbar_l229_2) begin
        if(when_Axi4LiteCrossbar_l233_9) begin
          io_masters_1_w_ready = io_slaves_2_w_ready;
        end
      end
    end else begin
      if(when_Axi4LiteCrossbar_l285_9) begin
        io_masters_1_w_ready = io_slaves_2_w_ready;
      end
    end
    if(when_Axi4LiteCrossbar_l217_3) begin
      if(when_Axi4LiteCrossbar_l229_3) begin
        if(when_Axi4LiteCrossbar_l233_13) begin
          io_masters_1_w_ready = io_slaves_3_w_ready;
        end
      end
    end else begin
      if(when_Axi4LiteCrossbar_l285_13) begin
        io_masters_1_w_ready = io_slaves_3_w_ready;
      end
    end
    if(when_Axi4LiteCrossbar_l217_4) begin
      if(when_Axi4LiteCrossbar_l229_4) begin
        if(when_Axi4LiteCrossbar_l233_17) begin
          io_masters_1_w_ready = decErr_io_axi_w_ready;
        end
      end
    end else begin
      if(when_Axi4LiteCrossbar_l285_17) begin
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
      if(when_Axi4LiteCrossbar_l285_5) begin
        io_masters_1_b_valid = io_slaves_1_b_valid;
      end
    end
    if(!when_Axi4LiteCrossbar_l217_2) begin
      if(when_Axi4LiteCrossbar_l285_9) begin
        io_masters_1_b_valid = io_slaves_2_b_valid;
      end
    end
    if(!when_Axi4LiteCrossbar_l217_3) begin
      if(when_Axi4LiteCrossbar_l285_13) begin
        io_masters_1_b_valid = io_slaves_3_b_valid;
      end
    end
    if(!when_Axi4LiteCrossbar_l217_4) begin
      if(when_Axi4LiteCrossbar_l285_17) begin
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
      if(when_Axi4LiteCrossbar_l285_5) begin
        io_masters_1_b_payload_resp = io_slaves_1_b_payload_resp;
      end
    end
    if(!when_Axi4LiteCrossbar_l217_2) begin
      if(when_Axi4LiteCrossbar_l285_9) begin
        io_masters_1_b_payload_resp = io_slaves_2_b_payload_resp;
      end
    end
    if(!when_Axi4LiteCrossbar_l217_3) begin
      if(when_Axi4LiteCrossbar_l285_13) begin
        io_masters_1_b_payload_resp = io_slaves_3_b_payload_resp;
      end
    end
    if(!when_Axi4LiteCrossbar_l217_4) begin
      if(when_Axi4LiteCrossbar_l285_17) begin
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
        if(when_Axi4LiteCrossbar_l320_5) begin
          io_masters_1_ar_ready = io_slaves_1_ar_ready;
        end
      end
    end
    if(when_Axi4LiteCrossbar_l306_2) begin
      if(when_Axi4LiteCrossbar_l317_2) begin
        if(when_Axi4LiteCrossbar_l320_9) begin
          io_masters_1_ar_ready = io_slaves_2_ar_ready;
        end
      end
    end
    if(when_Axi4LiteCrossbar_l306_3) begin
      if(when_Axi4LiteCrossbar_l317_3) begin
        if(when_Axi4LiteCrossbar_l320_13) begin
          io_masters_1_ar_ready = io_slaves_3_ar_ready;
        end
      end
    end
    if(when_Axi4LiteCrossbar_l306_4) begin
      if(when_Axi4LiteCrossbar_l317_4) begin
        if(when_Axi4LiteCrossbar_l320_17) begin
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
      if(when_Axi4LiteCrossbar_l363_5) begin
        io_masters_1_r_valid = io_slaves_1_r_valid;
      end
    end
    if(!when_Axi4LiteCrossbar_l306_2) begin
      if(when_Axi4LiteCrossbar_l363_9) begin
        io_masters_1_r_valid = io_slaves_2_r_valid;
      end
    end
    if(!when_Axi4LiteCrossbar_l306_3) begin
      if(when_Axi4LiteCrossbar_l363_13) begin
        io_masters_1_r_valid = io_slaves_3_r_valid;
      end
    end
    if(!when_Axi4LiteCrossbar_l306_4) begin
      if(when_Axi4LiteCrossbar_l363_17) begin
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
      if(when_Axi4LiteCrossbar_l363_5) begin
        io_masters_1_r_payload_data = io_slaves_1_r_payload_data;
      end
    end
    if(!when_Axi4LiteCrossbar_l306_2) begin
      if(when_Axi4LiteCrossbar_l363_9) begin
        io_masters_1_r_payload_data = io_slaves_2_r_payload_data;
      end
    end
    if(!when_Axi4LiteCrossbar_l306_3) begin
      if(when_Axi4LiteCrossbar_l363_13) begin
        io_masters_1_r_payload_data = io_slaves_3_r_payload_data;
      end
    end
    if(!when_Axi4LiteCrossbar_l306_4) begin
      if(when_Axi4LiteCrossbar_l363_17) begin
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
      if(when_Axi4LiteCrossbar_l363_5) begin
        io_masters_1_r_payload_resp = io_slaves_1_r_payload_resp;
      end
    end
    if(!when_Axi4LiteCrossbar_l306_2) begin
      if(when_Axi4LiteCrossbar_l363_9) begin
        io_masters_1_r_payload_resp = io_slaves_2_r_payload_resp;
      end
    end
    if(!when_Axi4LiteCrossbar_l306_3) begin
      if(when_Axi4LiteCrossbar_l363_13) begin
        io_masters_1_r_payload_resp = io_slaves_3_r_payload_resp;
      end
    end
    if(!when_Axi4LiteCrossbar_l306_4) begin
      if(when_Axi4LiteCrossbar_l363_17) begin
        io_masters_1_r_payload_resp = decErr_io_axi_r_payload_resp;
      end
    end
  end

  always @(*) begin
    io_masters_2_aw_ready = 1'b0;
    if(when_Axi4LiteCrossbar_l217) begin
      if(when_Axi4LiteCrossbar_l229) begin
        if(when_Axi4LiteCrossbar_l233_2) begin
          io_masters_2_aw_ready = io_slaves_0_aw_ready;
        end
      end
    end
    if(when_Axi4LiteCrossbar_l217_1) begin
      if(when_Axi4LiteCrossbar_l229_1) begin
        if(when_Axi4LiteCrossbar_l233_6) begin
          io_masters_2_aw_ready = io_slaves_1_aw_ready;
        end
      end
    end
    if(when_Axi4LiteCrossbar_l217_2) begin
      if(when_Axi4LiteCrossbar_l229_2) begin
        if(when_Axi4LiteCrossbar_l233_10) begin
          io_masters_2_aw_ready = io_slaves_2_aw_ready;
        end
      end
    end
    if(when_Axi4LiteCrossbar_l217_3) begin
      if(when_Axi4LiteCrossbar_l229_3) begin
        if(when_Axi4LiteCrossbar_l233_14) begin
          io_masters_2_aw_ready = io_slaves_3_aw_ready;
        end
      end
    end
    if(when_Axi4LiteCrossbar_l217_4) begin
      if(when_Axi4LiteCrossbar_l229_4) begin
        if(when_Axi4LiteCrossbar_l233_18) begin
          io_masters_2_aw_ready = decErr_io_axi_aw_ready;
        end
      end
    end
  end

  always @(*) begin
    io_masters_2_w_ready = 1'b0;
    if(when_Axi4LiteCrossbar_l217) begin
      if(when_Axi4LiteCrossbar_l229) begin
        if(when_Axi4LiteCrossbar_l233_2) begin
          io_masters_2_w_ready = io_slaves_0_w_ready;
        end
      end
    end else begin
      if(when_Axi4LiteCrossbar_l285_2) begin
        io_masters_2_w_ready = io_slaves_0_w_ready;
      end
    end
    if(when_Axi4LiteCrossbar_l217_1) begin
      if(when_Axi4LiteCrossbar_l229_1) begin
        if(when_Axi4LiteCrossbar_l233_6) begin
          io_masters_2_w_ready = io_slaves_1_w_ready;
        end
      end
    end else begin
      if(when_Axi4LiteCrossbar_l285_6) begin
        io_masters_2_w_ready = io_slaves_1_w_ready;
      end
    end
    if(when_Axi4LiteCrossbar_l217_2) begin
      if(when_Axi4LiteCrossbar_l229_2) begin
        if(when_Axi4LiteCrossbar_l233_10) begin
          io_masters_2_w_ready = io_slaves_2_w_ready;
        end
      end
    end else begin
      if(when_Axi4LiteCrossbar_l285_10) begin
        io_masters_2_w_ready = io_slaves_2_w_ready;
      end
    end
    if(when_Axi4LiteCrossbar_l217_3) begin
      if(when_Axi4LiteCrossbar_l229_3) begin
        if(when_Axi4LiteCrossbar_l233_14) begin
          io_masters_2_w_ready = io_slaves_3_w_ready;
        end
      end
    end else begin
      if(when_Axi4LiteCrossbar_l285_14) begin
        io_masters_2_w_ready = io_slaves_3_w_ready;
      end
    end
    if(when_Axi4LiteCrossbar_l217_4) begin
      if(when_Axi4LiteCrossbar_l229_4) begin
        if(when_Axi4LiteCrossbar_l233_18) begin
          io_masters_2_w_ready = decErr_io_axi_w_ready;
        end
      end
    end else begin
      if(when_Axi4LiteCrossbar_l285_18) begin
        io_masters_2_w_ready = decErr_io_axi_w_ready;
      end
    end
  end

  always @(*) begin
    io_masters_2_b_valid = 1'b0;
    if(!when_Axi4LiteCrossbar_l217) begin
      if(when_Axi4LiteCrossbar_l285_2) begin
        io_masters_2_b_valid = io_slaves_0_b_valid;
      end
    end
    if(!when_Axi4LiteCrossbar_l217_1) begin
      if(when_Axi4LiteCrossbar_l285_6) begin
        io_masters_2_b_valid = io_slaves_1_b_valid;
      end
    end
    if(!when_Axi4LiteCrossbar_l217_2) begin
      if(when_Axi4LiteCrossbar_l285_10) begin
        io_masters_2_b_valid = io_slaves_2_b_valid;
      end
    end
    if(!when_Axi4LiteCrossbar_l217_3) begin
      if(when_Axi4LiteCrossbar_l285_14) begin
        io_masters_2_b_valid = io_slaves_3_b_valid;
      end
    end
    if(!when_Axi4LiteCrossbar_l217_4) begin
      if(when_Axi4LiteCrossbar_l285_18) begin
        io_masters_2_b_valid = decErr_io_axi_b_valid;
      end
    end
  end

  always @(*) begin
    io_masters_2_b_payload_resp = _zz_io_masters_2_b_payload_resp[1 : 0];
    if(!when_Axi4LiteCrossbar_l217) begin
      if(when_Axi4LiteCrossbar_l285_2) begin
        io_masters_2_b_payload_resp = io_slaves_0_b_payload_resp;
      end
    end
    if(!when_Axi4LiteCrossbar_l217_1) begin
      if(when_Axi4LiteCrossbar_l285_6) begin
        io_masters_2_b_payload_resp = io_slaves_1_b_payload_resp;
      end
    end
    if(!when_Axi4LiteCrossbar_l217_2) begin
      if(when_Axi4LiteCrossbar_l285_10) begin
        io_masters_2_b_payload_resp = io_slaves_2_b_payload_resp;
      end
    end
    if(!when_Axi4LiteCrossbar_l217_3) begin
      if(when_Axi4LiteCrossbar_l285_14) begin
        io_masters_2_b_payload_resp = io_slaves_3_b_payload_resp;
      end
    end
    if(!when_Axi4LiteCrossbar_l217_4) begin
      if(when_Axi4LiteCrossbar_l285_18) begin
        io_masters_2_b_payload_resp = decErr_io_axi_b_payload_resp;
      end
    end
  end

  always @(*) begin
    io_masters_2_ar_ready = 1'b0;
    if(when_Axi4LiteCrossbar_l306) begin
      if(when_Axi4LiteCrossbar_l317) begin
        if(when_Axi4LiteCrossbar_l320_2) begin
          io_masters_2_ar_ready = io_slaves_0_ar_ready;
        end
      end
    end
    if(when_Axi4LiteCrossbar_l306_1) begin
      if(when_Axi4LiteCrossbar_l317_1) begin
        if(when_Axi4LiteCrossbar_l320_6) begin
          io_masters_2_ar_ready = io_slaves_1_ar_ready;
        end
      end
    end
    if(when_Axi4LiteCrossbar_l306_2) begin
      if(when_Axi4LiteCrossbar_l317_2) begin
        if(when_Axi4LiteCrossbar_l320_10) begin
          io_masters_2_ar_ready = io_slaves_2_ar_ready;
        end
      end
    end
    if(when_Axi4LiteCrossbar_l306_3) begin
      if(when_Axi4LiteCrossbar_l317_3) begin
        if(when_Axi4LiteCrossbar_l320_14) begin
          io_masters_2_ar_ready = io_slaves_3_ar_ready;
        end
      end
    end
    if(when_Axi4LiteCrossbar_l306_4) begin
      if(when_Axi4LiteCrossbar_l317_4) begin
        if(when_Axi4LiteCrossbar_l320_18) begin
          io_masters_2_ar_ready = decErr_io_axi_ar_ready;
        end
      end
    end
  end

  always @(*) begin
    io_masters_2_r_valid = 1'b0;
    if(!when_Axi4LiteCrossbar_l306) begin
      if(when_Axi4LiteCrossbar_l363_2) begin
        io_masters_2_r_valid = io_slaves_0_r_valid;
      end
    end
    if(!when_Axi4LiteCrossbar_l306_1) begin
      if(when_Axi4LiteCrossbar_l363_6) begin
        io_masters_2_r_valid = io_slaves_1_r_valid;
      end
    end
    if(!when_Axi4LiteCrossbar_l306_2) begin
      if(when_Axi4LiteCrossbar_l363_10) begin
        io_masters_2_r_valid = io_slaves_2_r_valid;
      end
    end
    if(!when_Axi4LiteCrossbar_l306_3) begin
      if(when_Axi4LiteCrossbar_l363_14) begin
        io_masters_2_r_valid = io_slaves_3_r_valid;
      end
    end
    if(!when_Axi4LiteCrossbar_l306_4) begin
      if(when_Axi4LiteCrossbar_l363_18) begin
        io_masters_2_r_valid = decErr_io_axi_r_valid;
      end
    end
  end

  assign _zz_io_masters_2_r_payload_data = 34'h0;
  always @(*) begin
    io_masters_2_r_payload_data = _zz_io_masters_2_r_payload_data[31 : 0];
    if(!when_Axi4LiteCrossbar_l306) begin
      if(when_Axi4LiteCrossbar_l363_2) begin
        io_masters_2_r_payload_data = io_slaves_0_r_payload_data;
      end
    end
    if(!when_Axi4LiteCrossbar_l306_1) begin
      if(when_Axi4LiteCrossbar_l363_6) begin
        io_masters_2_r_payload_data = io_slaves_1_r_payload_data;
      end
    end
    if(!when_Axi4LiteCrossbar_l306_2) begin
      if(when_Axi4LiteCrossbar_l363_10) begin
        io_masters_2_r_payload_data = io_slaves_2_r_payload_data;
      end
    end
    if(!when_Axi4LiteCrossbar_l306_3) begin
      if(when_Axi4LiteCrossbar_l363_14) begin
        io_masters_2_r_payload_data = io_slaves_3_r_payload_data;
      end
    end
    if(!when_Axi4LiteCrossbar_l306_4) begin
      if(when_Axi4LiteCrossbar_l363_18) begin
        io_masters_2_r_payload_data = decErr_io_axi_r_payload_data;
      end
    end
  end

  always @(*) begin
    io_masters_2_r_payload_resp = _zz_io_masters_2_r_payload_data[33 : 32];
    if(!when_Axi4LiteCrossbar_l306) begin
      if(when_Axi4LiteCrossbar_l363_2) begin
        io_masters_2_r_payload_resp = io_slaves_0_r_payload_resp;
      end
    end
    if(!when_Axi4LiteCrossbar_l306_1) begin
      if(when_Axi4LiteCrossbar_l363_6) begin
        io_masters_2_r_payload_resp = io_slaves_1_r_payload_resp;
      end
    end
    if(!when_Axi4LiteCrossbar_l306_2) begin
      if(when_Axi4LiteCrossbar_l363_10) begin
        io_masters_2_r_payload_resp = io_slaves_2_r_payload_resp;
      end
    end
    if(!when_Axi4LiteCrossbar_l306_3) begin
      if(when_Axi4LiteCrossbar_l363_14) begin
        io_masters_2_r_payload_resp = io_slaves_3_r_payload_resp;
      end
    end
    if(!when_Axi4LiteCrossbar_l306_4) begin
      if(when_Axi4LiteCrossbar_l363_18) begin
        io_masters_2_r_payload_resp = decErr_io_axi_r_payload_resp;
      end
    end
  end

  always @(*) begin
    io_masters_3_aw_ready = 1'b0;
    if(when_Axi4LiteCrossbar_l217) begin
      if(when_Axi4LiteCrossbar_l229) begin
        if(when_Axi4LiteCrossbar_l233_3) begin
          io_masters_3_aw_ready = io_slaves_0_aw_ready;
        end
      end
    end
    if(when_Axi4LiteCrossbar_l217_1) begin
      if(when_Axi4LiteCrossbar_l229_1) begin
        if(when_Axi4LiteCrossbar_l233_7) begin
          io_masters_3_aw_ready = io_slaves_1_aw_ready;
        end
      end
    end
    if(when_Axi4LiteCrossbar_l217_2) begin
      if(when_Axi4LiteCrossbar_l229_2) begin
        if(when_Axi4LiteCrossbar_l233_11) begin
          io_masters_3_aw_ready = io_slaves_2_aw_ready;
        end
      end
    end
    if(when_Axi4LiteCrossbar_l217_3) begin
      if(when_Axi4LiteCrossbar_l229_3) begin
        if(when_Axi4LiteCrossbar_l233_15) begin
          io_masters_3_aw_ready = io_slaves_3_aw_ready;
        end
      end
    end
    if(when_Axi4LiteCrossbar_l217_4) begin
      if(when_Axi4LiteCrossbar_l229_4) begin
        if(when_Axi4LiteCrossbar_l233_19) begin
          io_masters_3_aw_ready = decErr_io_axi_aw_ready;
        end
      end
    end
  end

  always @(*) begin
    io_masters_3_w_ready = 1'b0;
    if(when_Axi4LiteCrossbar_l217) begin
      if(when_Axi4LiteCrossbar_l229) begin
        if(when_Axi4LiteCrossbar_l233_3) begin
          io_masters_3_w_ready = io_slaves_0_w_ready;
        end
      end
    end else begin
      if(when_Axi4LiteCrossbar_l285_3) begin
        io_masters_3_w_ready = io_slaves_0_w_ready;
      end
    end
    if(when_Axi4LiteCrossbar_l217_1) begin
      if(when_Axi4LiteCrossbar_l229_1) begin
        if(when_Axi4LiteCrossbar_l233_7) begin
          io_masters_3_w_ready = io_slaves_1_w_ready;
        end
      end
    end else begin
      if(when_Axi4LiteCrossbar_l285_7) begin
        io_masters_3_w_ready = io_slaves_1_w_ready;
      end
    end
    if(when_Axi4LiteCrossbar_l217_2) begin
      if(when_Axi4LiteCrossbar_l229_2) begin
        if(when_Axi4LiteCrossbar_l233_11) begin
          io_masters_3_w_ready = io_slaves_2_w_ready;
        end
      end
    end else begin
      if(when_Axi4LiteCrossbar_l285_11) begin
        io_masters_3_w_ready = io_slaves_2_w_ready;
      end
    end
    if(when_Axi4LiteCrossbar_l217_3) begin
      if(when_Axi4LiteCrossbar_l229_3) begin
        if(when_Axi4LiteCrossbar_l233_15) begin
          io_masters_3_w_ready = io_slaves_3_w_ready;
        end
      end
    end else begin
      if(when_Axi4LiteCrossbar_l285_15) begin
        io_masters_3_w_ready = io_slaves_3_w_ready;
      end
    end
    if(when_Axi4LiteCrossbar_l217_4) begin
      if(when_Axi4LiteCrossbar_l229_4) begin
        if(when_Axi4LiteCrossbar_l233_19) begin
          io_masters_3_w_ready = decErr_io_axi_w_ready;
        end
      end
    end else begin
      if(when_Axi4LiteCrossbar_l285_19) begin
        io_masters_3_w_ready = decErr_io_axi_w_ready;
      end
    end
  end

  always @(*) begin
    io_masters_3_b_valid = 1'b0;
    if(!when_Axi4LiteCrossbar_l217) begin
      if(when_Axi4LiteCrossbar_l285_3) begin
        io_masters_3_b_valid = io_slaves_0_b_valid;
      end
    end
    if(!when_Axi4LiteCrossbar_l217_1) begin
      if(when_Axi4LiteCrossbar_l285_7) begin
        io_masters_3_b_valid = io_slaves_1_b_valid;
      end
    end
    if(!when_Axi4LiteCrossbar_l217_2) begin
      if(when_Axi4LiteCrossbar_l285_11) begin
        io_masters_3_b_valid = io_slaves_2_b_valid;
      end
    end
    if(!when_Axi4LiteCrossbar_l217_3) begin
      if(when_Axi4LiteCrossbar_l285_15) begin
        io_masters_3_b_valid = io_slaves_3_b_valid;
      end
    end
    if(!when_Axi4LiteCrossbar_l217_4) begin
      if(when_Axi4LiteCrossbar_l285_19) begin
        io_masters_3_b_valid = decErr_io_axi_b_valid;
      end
    end
  end

  always @(*) begin
    io_masters_3_b_payload_resp = _zz_io_masters_3_b_payload_resp[1 : 0];
    if(!when_Axi4LiteCrossbar_l217) begin
      if(when_Axi4LiteCrossbar_l285_3) begin
        io_masters_3_b_payload_resp = io_slaves_0_b_payload_resp;
      end
    end
    if(!when_Axi4LiteCrossbar_l217_1) begin
      if(when_Axi4LiteCrossbar_l285_7) begin
        io_masters_3_b_payload_resp = io_slaves_1_b_payload_resp;
      end
    end
    if(!when_Axi4LiteCrossbar_l217_2) begin
      if(when_Axi4LiteCrossbar_l285_11) begin
        io_masters_3_b_payload_resp = io_slaves_2_b_payload_resp;
      end
    end
    if(!when_Axi4LiteCrossbar_l217_3) begin
      if(when_Axi4LiteCrossbar_l285_15) begin
        io_masters_3_b_payload_resp = io_slaves_3_b_payload_resp;
      end
    end
    if(!when_Axi4LiteCrossbar_l217_4) begin
      if(when_Axi4LiteCrossbar_l285_19) begin
        io_masters_3_b_payload_resp = decErr_io_axi_b_payload_resp;
      end
    end
  end

  always @(*) begin
    io_masters_3_ar_ready = 1'b0;
    if(when_Axi4LiteCrossbar_l306) begin
      if(when_Axi4LiteCrossbar_l317) begin
        if(when_Axi4LiteCrossbar_l320_3) begin
          io_masters_3_ar_ready = io_slaves_0_ar_ready;
        end
      end
    end
    if(when_Axi4LiteCrossbar_l306_1) begin
      if(when_Axi4LiteCrossbar_l317_1) begin
        if(when_Axi4LiteCrossbar_l320_7) begin
          io_masters_3_ar_ready = io_slaves_1_ar_ready;
        end
      end
    end
    if(when_Axi4LiteCrossbar_l306_2) begin
      if(when_Axi4LiteCrossbar_l317_2) begin
        if(when_Axi4LiteCrossbar_l320_11) begin
          io_masters_3_ar_ready = io_slaves_2_ar_ready;
        end
      end
    end
    if(when_Axi4LiteCrossbar_l306_3) begin
      if(when_Axi4LiteCrossbar_l317_3) begin
        if(when_Axi4LiteCrossbar_l320_15) begin
          io_masters_3_ar_ready = io_slaves_3_ar_ready;
        end
      end
    end
    if(when_Axi4LiteCrossbar_l306_4) begin
      if(when_Axi4LiteCrossbar_l317_4) begin
        if(when_Axi4LiteCrossbar_l320_19) begin
          io_masters_3_ar_ready = decErr_io_axi_ar_ready;
        end
      end
    end
  end

  always @(*) begin
    io_masters_3_r_valid = 1'b0;
    if(!when_Axi4LiteCrossbar_l306) begin
      if(when_Axi4LiteCrossbar_l363_3) begin
        io_masters_3_r_valid = io_slaves_0_r_valid;
      end
    end
    if(!when_Axi4LiteCrossbar_l306_1) begin
      if(when_Axi4LiteCrossbar_l363_7) begin
        io_masters_3_r_valid = io_slaves_1_r_valid;
      end
    end
    if(!when_Axi4LiteCrossbar_l306_2) begin
      if(when_Axi4LiteCrossbar_l363_11) begin
        io_masters_3_r_valid = io_slaves_2_r_valid;
      end
    end
    if(!when_Axi4LiteCrossbar_l306_3) begin
      if(when_Axi4LiteCrossbar_l363_15) begin
        io_masters_3_r_valid = io_slaves_3_r_valid;
      end
    end
    if(!when_Axi4LiteCrossbar_l306_4) begin
      if(when_Axi4LiteCrossbar_l363_19) begin
        io_masters_3_r_valid = decErr_io_axi_r_valid;
      end
    end
  end

  assign _zz_io_masters_3_r_payload_data = 34'h0;
  always @(*) begin
    io_masters_3_r_payload_data = _zz_io_masters_3_r_payload_data[31 : 0];
    if(!when_Axi4LiteCrossbar_l306) begin
      if(when_Axi4LiteCrossbar_l363_3) begin
        io_masters_3_r_payload_data = io_slaves_0_r_payload_data;
      end
    end
    if(!when_Axi4LiteCrossbar_l306_1) begin
      if(when_Axi4LiteCrossbar_l363_7) begin
        io_masters_3_r_payload_data = io_slaves_1_r_payload_data;
      end
    end
    if(!when_Axi4LiteCrossbar_l306_2) begin
      if(when_Axi4LiteCrossbar_l363_11) begin
        io_masters_3_r_payload_data = io_slaves_2_r_payload_data;
      end
    end
    if(!when_Axi4LiteCrossbar_l306_3) begin
      if(when_Axi4LiteCrossbar_l363_15) begin
        io_masters_3_r_payload_data = io_slaves_3_r_payload_data;
      end
    end
    if(!when_Axi4LiteCrossbar_l306_4) begin
      if(when_Axi4LiteCrossbar_l363_19) begin
        io_masters_3_r_payload_data = decErr_io_axi_r_payload_data;
      end
    end
  end

  always @(*) begin
    io_masters_3_r_payload_resp = _zz_io_masters_3_r_payload_data[33 : 32];
    if(!when_Axi4LiteCrossbar_l306) begin
      if(when_Axi4LiteCrossbar_l363_3) begin
        io_masters_3_r_payload_resp = io_slaves_0_r_payload_resp;
      end
    end
    if(!when_Axi4LiteCrossbar_l306_1) begin
      if(when_Axi4LiteCrossbar_l363_7) begin
        io_masters_3_r_payload_resp = io_slaves_1_r_payload_resp;
      end
    end
    if(!when_Axi4LiteCrossbar_l306_2) begin
      if(when_Axi4LiteCrossbar_l363_11) begin
        io_masters_3_r_payload_resp = io_slaves_2_r_payload_resp;
      end
    end
    if(!when_Axi4LiteCrossbar_l306_3) begin
      if(when_Axi4LiteCrossbar_l363_15) begin
        io_masters_3_r_payload_resp = io_slaves_3_r_payload_resp;
      end
    end
    if(!when_Axi4LiteCrossbar_l306_4) begin
      if(when_Axi4LiteCrossbar_l363_19) begin
        io_masters_3_r_payload_resp = decErr_io_axi_r_payload_resp;
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
        if(when_Axi4LiteCrossbar_l233_2) begin
          io_slaves_0_aw_payload_addr = io_masters_2_aw_payload_addr;
        end
        if(when_Axi4LiteCrossbar_l233_3) begin
          io_slaves_0_aw_payload_addr = io_masters_3_aw_payload_addr;
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
        if(when_Axi4LiteCrossbar_l233_2) begin
          io_slaves_0_aw_payload_prot = io_masters_2_aw_payload_prot;
        end
        if(when_Axi4LiteCrossbar_l233_3) begin
          io_slaves_0_aw_payload_prot = io_masters_3_aw_payload_prot;
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
        if(when_Axi4LiteCrossbar_l233_2) begin
          io_slaves_0_w_valid = io_masters_2_w_valid;
        end
        if(when_Axi4LiteCrossbar_l233_3) begin
          io_slaves_0_w_valid = io_masters_3_w_valid;
        end
      end
    end else begin
      if(when_Axi4LiteCrossbar_l285) begin
        io_slaves_0_w_valid = io_masters_0_w_valid;
      end
      if(when_Axi4LiteCrossbar_l285_1) begin
        io_slaves_0_w_valid = io_masters_1_w_valid;
      end
      if(when_Axi4LiteCrossbar_l285_2) begin
        io_slaves_0_w_valid = io_masters_2_w_valid;
      end
      if(when_Axi4LiteCrossbar_l285_3) begin
        io_slaves_0_w_valid = io_masters_3_w_valid;
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
        if(when_Axi4LiteCrossbar_l233_2) begin
          io_slaves_0_w_payload_data = io_masters_2_w_payload_data;
        end
        if(when_Axi4LiteCrossbar_l233_3) begin
          io_slaves_0_w_payload_data = io_masters_3_w_payload_data;
        end
      end
    end else begin
      if(when_Axi4LiteCrossbar_l285) begin
        io_slaves_0_w_payload_data = io_masters_0_w_payload_data;
      end
      if(when_Axi4LiteCrossbar_l285_1) begin
        io_slaves_0_w_payload_data = io_masters_1_w_payload_data;
      end
      if(when_Axi4LiteCrossbar_l285_2) begin
        io_slaves_0_w_payload_data = io_masters_2_w_payload_data;
      end
      if(when_Axi4LiteCrossbar_l285_3) begin
        io_slaves_0_w_payload_data = io_masters_3_w_payload_data;
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
        if(when_Axi4LiteCrossbar_l233_2) begin
          io_slaves_0_w_payload_strb = io_masters_2_w_payload_strb;
        end
        if(when_Axi4LiteCrossbar_l233_3) begin
          io_slaves_0_w_payload_strb = io_masters_3_w_payload_strb;
        end
      end
    end else begin
      if(when_Axi4LiteCrossbar_l285) begin
        io_slaves_0_w_payload_strb = io_masters_0_w_payload_strb;
      end
      if(when_Axi4LiteCrossbar_l285_1) begin
        io_slaves_0_w_payload_strb = io_masters_1_w_payload_strb;
      end
      if(when_Axi4LiteCrossbar_l285_2) begin
        io_slaves_0_w_payload_strb = io_masters_2_w_payload_strb;
      end
      if(when_Axi4LiteCrossbar_l285_3) begin
        io_slaves_0_w_payload_strb = io_masters_3_w_payload_strb;
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
      if(when_Axi4LiteCrossbar_l285_2) begin
        io_slaves_0_b_ready = io_masters_2_b_ready;
      end
      if(when_Axi4LiteCrossbar_l285_3) begin
        io_slaves_0_b_ready = io_masters_3_b_ready;
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
        if(when_Axi4LiteCrossbar_l320_2) begin
          io_slaves_0_ar_payload_addr = io_masters_2_ar_payload_addr;
        end
        if(when_Axi4LiteCrossbar_l320_3) begin
          io_slaves_0_ar_payload_addr = io_masters_3_ar_payload_addr;
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
        if(when_Axi4LiteCrossbar_l320_2) begin
          io_slaves_0_ar_payload_prot = io_masters_2_ar_payload_prot;
        end
        if(when_Axi4LiteCrossbar_l320_3) begin
          io_slaves_0_ar_payload_prot = io_masters_3_ar_payload_prot;
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
      if(when_Axi4LiteCrossbar_l363_2) begin
        io_slaves_0_r_ready = io_masters_2_r_ready;
      end
      if(when_Axi4LiteCrossbar_l363_3) begin
        io_slaves_0_r_ready = io_masters_3_r_ready;
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
        if(when_Axi4LiteCrossbar_l233_4) begin
          io_slaves_1_aw_payload_addr = io_masters_0_aw_payload_addr;
        end
        if(when_Axi4LiteCrossbar_l233_5) begin
          io_slaves_1_aw_payload_addr = io_masters_1_aw_payload_addr;
        end
        if(when_Axi4LiteCrossbar_l233_6) begin
          io_slaves_1_aw_payload_addr = io_masters_2_aw_payload_addr;
        end
        if(when_Axi4LiteCrossbar_l233_7) begin
          io_slaves_1_aw_payload_addr = io_masters_3_aw_payload_addr;
        end
      end
    end
  end

  always @(*) begin
    io_slaves_1_aw_payload_prot = _zz_io_slaves_1_aw_payload_addr[34 : 32];
    if(when_Axi4LiteCrossbar_l217_1) begin
      if(when_Axi4LiteCrossbar_l229_1) begin
        if(when_Axi4LiteCrossbar_l233_4) begin
          io_slaves_1_aw_payload_prot = io_masters_0_aw_payload_prot;
        end
        if(when_Axi4LiteCrossbar_l233_5) begin
          io_slaves_1_aw_payload_prot = io_masters_1_aw_payload_prot;
        end
        if(when_Axi4LiteCrossbar_l233_6) begin
          io_slaves_1_aw_payload_prot = io_masters_2_aw_payload_prot;
        end
        if(when_Axi4LiteCrossbar_l233_7) begin
          io_slaves_1_aw_payload_prot = io_masters_3_aw_payload_prot;
        end
      end
    end
  end

  always @(*) begin
    io_slaves_1_w_valid = 1'b0;
    if(when_Axi4LiteCrossbar_l217_1) begin
      if(when_Axi4LiteCrossbar_l229_1) begin
        if(when_Axi4LiteCrossbar_l233_4) begin
          io_slaves_1_w_valid = io_masters_0_w_valid;
        end
        if(when_Axi4LiteCrossbar_l233_5) begin
          io_slaves_1_w_valid = io_masters_1_w_valid;
        end
        if(when_Axi4LiteCrossbar_l233_6) begin
          io_slaves_1_w_valid = io_masters_2_w_valid;
        end
        if(when_Axi4LiteCrossbar_l233_7) begin
          io_slaves_1_w_valid = io_masters_3_w_valid;
        end
      end
    end else begin
      if(when_Axi4LiteCrossbar_l285_4) begin
        io_slaves_1_w_valid = io_masters_0_w_valid;
      end
      if(when_Axi4LiteCrossbar_l285_5) begin
        io_slaves_1_w_valid = io_masters_1_w_valid;
      end
      if(when_Axi4LiteCrossbar_l285_6) begin
        io_slaves_1_w_valid = io_masters_2_w_valid;
      end
      if(when_Axi4LiteCrossbar_l285_7) begin
        io_slaves_1_w_valid = io_masters_3_w_valid;
      end
    end
  end

  assign _zz_io_slaves_1_w_payload_data = 36'h0;
  always @(*) begin
    io_slaves_1_w_payload_data = _zz_io_slaves_1_w_payload_data[31 : 0];
    if(when_Axi4LiteCrossbar_l217_1) begin
      if(when_Axi4LiteCrossbar_l229_1) begin
        if(when_Axi4LiteCrossbar_l233_4) begin
          io_slaves_1_w_payload_data = io_masters_0_w_payload_data;
        end
        if(when_Axi4LiteCrossbar_l233_5) begin
          io_slaves_1_w_payload_data = io_masters_1_w_payload_data;
        end
        if(when_Axi4LiteCrossbar_l233_6) begin
          io_slaves_1_w_payload_data = io_masters_2_w_payload_data;
        end
        if(when_Axi4LiteCrossbar_l233_7) begin
          io_slaves_1_w_payload_data = io_masters_3_w_payload_data;
        end
      end
    end else begin
      if(when_Axi4LiteCrossbar_l285_4) begin
        io_slaves_1_w_payload_data = io_masters_0_w_payload_data;
      end
      if(when_Axi4LiteCrossbar_l285_5) begin
        io_slaves_1_w_payload_data = io_masters_1_w_payload_data;
      end
      if(when_Axi4LiteCrossbar_l285_6) begin
        io_slaves_1_w_payload_data = io_masters_2_w_payload_data;
      end
      if(when_Axi4LiteCrossbar_l285_7) begin
        io_slaves_1_w_payload_data = io_masters_3_w_payload_data;
      end
    end
  end

  always @(*) begin
    io_slaves_1_w_payload_strb = _zz_io_slaves_1_w_payload_data[35 : 32];
    if(when_Axi4LiteCrossbar_l217_1) begin
      if(when_Axi4LiteCrossbar_l229_1) begin
        if(when_Axi4LiteCrossbar_l233_4) begin
          io_slaves_1_w_payload_strb = io_masters_0_w_payload_strb;
        end
        if(when_Axi4LiteCrossbar_l233_5) begin
          io_slaves_1_w_payload_strb = io_masters_1_w_payload_strb;
        end
        if(when_Axi4LiteCrossbar_l233_6) begin
          io_slaves_1_w_payload_strb = io_masters_2_w_payload_strb;
        end
        if(when_Axi4LiteCrossbar_l233_7) begin
          io_slaves_1_w_payload_strb = io_masters_3_w_payload_strb;
        end
      end
    end else begin
      if(when_Axi4LiteCrossbar_l285_4) begin
        io_slaves_1_w_payload_strb = io_masters_0_w_payload_strb;
      end
      if(when_Axi4LiteCrossbar_l285_5) begin
        io_slaves_1_w_payload_strb = io_masters_1_w_payload_strb;
      end
      if(when_Axi4LiteCrossbar_l285_6) begin
        io_slaves_1_w_payload_strb = io_masters_2_w_payload_strb;
      end
      if(when_Axi4LiteCrossbar_l285_7) begin
        io_slaves_1_w_payload_strb = io_masters_3_w_payload_strb;
      end
    end
  end

  always @(*) begin
    io_slaves_1_b_ready = 1'b0;
    if(!when_Axi4LiteCrossbar_l217_1) begin
      if(when_Axi4LiteCrossbar_l285_4) begin
        io_slaves_1_b_ready = io_masters_0_b_ready;
      end
      if(when_Axi4LiteCrossbar_l285_5) begin
        io_slaves_1_b_ready = io_masters_1_b_ready;
      end
      if(when_Axi4LiteCrossbar_l285_6) begin
        io_slaves_1_b_ready = io_masters_2_b_ready;
      end
      if(when_Axi4LiteCrossbar_l285_7) begin
        io_slaves_1_b_ready = io_masters_3_b_ready;
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
        if(when_Axi4LiteCrossbar_l320_4) begin
          io_slaves_1_ar_payload_addr = io_masters_0_ar_payload_addr;
        end
        if(when_Axi4LiteCrossbar_l320_5) begin
          io_slaves_1_ar_payload_addr = io_masters_1_ar_payload_addr;
        end
        if(when_Axi4LiteCrossbar_l320_6) begin
          io_slaves_1_ar_payload_addr = io_masters_2_ar_payload_addr;
        end
        if(when_Axi4LiteCrossbar_l320_7) begin
          io_slaves_1_ar_payload_addr = io_masters_3_ar_payload_addr;
        end
      end
    end
  end

  always @(*) begin
    io_slaves_1_ar_payload_prot = _zz_io_slaves_1_ar_payload_addr[34 : 32];
    if(when_Axi4LiteCrossbar_l306_1) begin
      if(when_Axi4LiteCrossbar_l317_1) begin
        if(when_Axi4LiteCrossbar_l320_4) begin
          io_slaves_1_ar_payload_prot = io_masters_0_ar_payload_prot;
        end
        if(when_Axi4LiteCrossbar_l320_5) begin
          io_slaves_1_ar_payload_prot = io_masters_1_ar_payload_prot;
        end
        if(when_Axi4LiteCrossbar_l320_6) begin
          io_slaves_1_ar_payload_prot = io_masters_2_ar_payload_prot;
        end
        if(when_Axi4LiteCrossbar_l320_7) begin
          io_slaves_1_ar_payload_prot = io_masters_3_ar_payload_prot;
        end
      end
    end
  end

  always @(*) begin
    io_slaves_1_r_ready = 1'b0;
    if(!when_Axi4LiteCrossbar_l306_1) begin
      if(when_Axi4LiteCrossbar_l363_4) begin
        io_slaves_1_r_ready = io_masters_0_r_ready;
      end
      if(when_Axi4LiteCrossbar_l363_5) begin
        io_slaves_1_r_ready = io_masters_1_r_ready;
      end
      if(when_Axi4LiteCrossbar_l363_6) begin
        io_slaves_1_r_ready = io_masters_2_r_ready;
      end
      if(when_Axi4LiteCrossbar_l363_7) begin
        io_slaves_1_r_ready = io_masters_3_r_ready;
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
        if(when_Axi4LiteCrossbar_l233_8) begin
          io_slaves_2_aw_payload_addr = io_masters_0_aw_payload_addr;
        end
        if(when_Axi4LiteCrossbar_l233_9) begin
          io_slaves_2_aw_payload_addr = io_masters_1_aw_payload_addr;
        end
        if(when_Axi4LiteCrossbar_l233_10) begin
          io_slaves_2_aw_payload_addr = io_masters_2_aw_payload_addr;
        end
        if(when_Axi4LiteCrossbar_l233_11) begin
          io_slaves_2_aw_payload_addr = io_masters_3_aw_payload_addr;
        end
      end
    end
  end

  always @(*) begin
    io_slaves_2_aw_payload_prot = _zz_io_slaves_2_aw_payload_addr[34 : 32];
    if(when_Axi4LiteCrossbar_l217_2) begin
      if(when_Axi4LiteCrossbar_l229_2) begin
        if(when_Axi4LiteCrossbar_l233_8) begin
          io_slaves_2_aw_payload_prot = io_masters_0_aw_payload_prot;
        end
        if(when_Axi4LiteCrossbar_l233_9) begin
          io_slaves_2_aw_payload_prot = io_masters_1_aw_payload_prot;
        end
        if(when_Axi4LiteCrossbar_l233_10) begin
          io_slaves_2_aw_payload_prot = io_masters_2_aw_payload_prot;
        end
        if(when_Axi4LiteCrossbar_l233_11) begin
          io_slaves_2_aw_payload_prot = io_masters_3_aw_payload_prot;
        end
      end
    end
  end

  always @(*) begin
    io_slaves_2_w_valid = 1'b0;
    if(when_Axi4LiteCrossbar_l217_2) begin
      if(when_Axi4LiteCrossbar_l229_2) begin
        if(when_Axi4LiteCrossbar_l233_8) begin
          io_slaves_2_w_valid = io_masters_0_w_valid;
        end
        if(when_Axi4LiteCrossbar_l233_9) begin
          io_slaves_2_w_valid = io_masters_1_w_valid;
        end
        if(when_Axi4LiteCrossbar_l233_10) begin
          io_slaves_2_w_valid = io_masters_2_w_valid;
        end
        if(when_Axi4LiteCrossbar_l233_11) begin
          io_slaves_2_w_valid = io_masters_3_w_valid;
        end
      end
    end else begin
      if(when_Axi4LiteCrossbar_l285_8) begin
        io_slaves_2_w_valid = io_masters_0_w_valid;
      end
      if(when_Axi4LiteCrossbar_l285_9) begin
        io_slaves_2_w_valid = io_masters_1_w_valid;
      end
      if(when_Axi4LiteCrossbar_l285_10) begin
        io_slaves_2_w_valid = io_masters_2_w_valid;
      end
      if(when_Axi4LiteCrossbar_l285_11) begin
        io_slaves_2_w_valid = io_masters_3_w_valid;
      end
    end
  end

  assign _zz_io_slaves_2_w_payload_data = 36'h0;
  always @(*) begin
    io_slaves_2_w_payload_data = _zz_io_slaves_2_w_payload_data[31 : 0];
    if(when_Axi4LiteCrossbar_l217_2) begin
      if(when_Axi4LiteCrossbar_l229_2) begin
        if(when_Axi4LiteCrossbar_l233_8) begin
          io_slaves_2_w_payload_data = io_masters_0_w_payload_data;
        end
        if(when_Axi4LiteCrossbar_l233_9) begin
          io_slaves_2_w_payload_data = io_masters_1_w_payload_data;
        end
        if(when_Axi4LiteCrossbar_l233_10) begin
          io_slaves_2_w_payload_data = io_masters_2_w_payload_data;
        end
        if(when_Axi4LiteCrossbar_l233_11) begin
          io_slaves_2_w_payload_data = io_masters_3_w_payload_data;
        end
      end
    end else begin
      if(when_Axi4LiteCrossbar_l285_8) begin
        io_slaves_2_w_payload_data = io_masters_0_w_payload_data;
      end
      if(when_Axi4LiteCrossbar_l285_9) begin
        io_slaves_2_w_payload_data = io_masters_1_w_payload_data;
      end
      if(when_Axi4LiteCrossbar_l285_10) begin
        io_slaves_2_w_payload_data = io_masters_2_w_payload_data;
      end
      if(when_Axi4LiteCrossbar_l285_11) begin
        io_slaves_2_w_payload_data = io_masters_3_w_payload_data;
      end
    end
  end

  always @(*) begin
    io_slaves_2_w_payload_strb = _zz_io_slaves_2_w_payload_data[35 : 32];
    if(when_Axi4LiteCrossbar_l217_2) begin
      if(when_Axi4LiteCrossbar_l229_2) begin
        if(when_Axi4LiteCrossbar_l233_8) begin
          io_slaves_2_w_payload_strb = io_masters_0_w_payload_strb;
        end
        if(when_Axi4LiteCrossbar_l233_9) begin
          io_slaves_2_w_payload_strb = io_masters_1_w_payload_strb;
        end
        if(when_Axi4LiteCrossbar_l233_10) begin
          io_slaves_2_w_payload_strb = io_masters_2_w_payload_strb;
        end
        if(when_Axi4LiteCrossbar_l233_11) begin
          io_slaves_2_w_payload_strb = io_masters_3_w_payload_strb;
        end
      end
    end else begin
      if(when_Axi4LiteCrossbar_l285_8) begin
        io_slaves_2_w_payload_strb = io_masters_0_w_payload_strb;
      end
      if(when_Axi4LiteCrossbar_l285_9) begin
        io_slaves_2_w_payload_strb = io_masters_1_w_payload_strb;
      end
      if(when_Axi4LiteCrossbar_l285_10) begin
        io_slaves_2_w_payload_strb = io_masters_2_w_payload_strb;
      end
      if(when_Axi4LiteCrossbar_l285_11) begin
        io_slaves_2_w_payload_strb = io_masters_3_w_payload_strb;
      end
    end
  end

  always @(*) begin
    io_slaves_2_b_ready = 1'b0;
    if(!when_Axi4LiteCrossbar_l217_2) begin
      if(when_Axi4LiteCrossbar_l285_8) begin
        io_slaves_2_b_ready = io_masters_0_b_ready;
      end
      if(when_Axi4LiteCrossbar_l285_9) begin
        io_slaves_2_b_ready = io_masters_1_b_ready;
      end
      if(when_Axi4LiteCrossbar_l285_10) begin
        io_slaves_2_b_ready = io_masters_2_b_ready;
      end
      if(when_Axi4LiteCrossbar_l285_11) begin
        io_slaves_2_b_ready = io_masters_3_b_ready;
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
        if(when_Axi4LiteCrossbar_l320_8) begin
          io_slaves_2_ar_payload_addr = io_masters_0_ar_payload_addr;
        end
        if(when_Axi4LiteCrossbar_l320_9) begin
          io_slaves_2_ar_payload_addr = io_masters_1_ar_payload_addr;
        end
        if(when_Axi4LiteCrossbar_l320_10) begin
          io_slaves_2_ar_payload_addr = io_masters_2_ar_payload_addr;
        end
        if(when_Axi4LiteCrossbar_l320_11) begin
          io_slaves_2_ar_payload_addr = io_masters_3_ar_payload_addr;
        end
      end
    end
  end

  always @(*) begin
    io_slaves_2_ar_payload_prot = _zz_io_slaves_2_ar_payload_addr[34 : 32];
    if(when_Axi4LiteCrossbar_l306_2) begin
      if(when_Axi4LiteCrossbar_l317_2) begin
        if(when_Axi4LiteCrossbar_l320_8) begin
          io_slaves_2_ar_payload_prot = io_masters_0_ar_payload_prot;
        end
        if(when_Axi4LiteCrossbar_l320_9) begin
          io_slaves_2_ar_payload_prot = io_masters_1_ar_payload_prot;
        end
        if(when_Axi4LiteCrossbar_l320_10) begin
          io_slaves_2_ar_payload_prot = io_masters_2_ar_payload_prot;
        end
        if(when_Axi4LiteCrossbar_l320_11) begin
          io_slaves_2_ar_payload_prot = io_masters_3_ar_payload_prot;
        end
      end
    end
  end

  always @(*) begin
    io_slaves_2_r_ready = 1'b0;
    if(!when_Axi4LiteCrossbar_l306_2) begin
      if(when_Axi4LiteCrossbar_l363_8) begin
        io_slaves_2_r_ready = io_masters_0_r_ready;
      end
      if(when_Axi4LiteCrossbar_l363_9) begin
        io_slaves_2_r_ready = io_masters_1_r_ready;
      end
      if(when_Axi4LiteCrossbar_l363_10) begin
        io_slaves_2_r_ready = io_masters_2_r_ready;
      end
      if(when_Axi4LiteCrossbar_l363_11) begin
        io_slaves_2_r_ready = io_masters_3_r_ready;
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
        if(when_Axi4LiteCrossbar_l233_12) begin
          io_slaves_3_aw_payload_addr = io_masters_0_aw_payload_addr;
        end
        if(when_Axi4LiteCrossbar_l233_13) begin
          io_slaves_3_aw_payload_addr = io_masters_1_aw_payload_addr;
        end
        if(when_Axi4LiteCrossbar_l233_14) begin
          io_slaves_3_aw_payload_addr = io_masters_2_aw_payload_addr;
        end
        if(when_Axi4LiteCrossbar_l233_15) begin
          io_slaves_3_aw_payload_addr = io_masters_3_aw_payload_addr;
        end
      end
    end
  end

  always @(*) begin
    io_slaves_3_aw_payload_prot = _zz_io_slaves_3_aw_payload_addr[34 : 32];
    if(when_Axi4LiteCrossbar_l217_3) begin
      if(when_Axi4LiteCrossbar_l229_3) begin
        if(when_Axi4LiteCrossbar_l233_12) begin
          io_slaves_3_aw_payload_prot = io_masters_0_aw_payload_prot;
        end
        if(when_Axi4LiteCrossbar_l233_13) begin
          io_slaves_3_aw_payload_prot = io_masters_1_aw_payload_prot;
        end
        if(when_Axi4LiteCrossbar_l233_14) begin
          io_slaves_3_aw_payload_prot = io_masters_2_aw_payload_prot;
        end
        if(when_Axi4LiteCrossbar_l233_15) begin
          io_slaves_3_aw_payload_prot = io_masters_3_aw_payload_prot;
        end
      end
    end
  end

  always @(*) begin
    io_slaves_3_w_valid = 1'b0;
    if(when_Axi4LiteCrossbar_l217_3) begin
      if(when_Axi4LiteCrossbar_l229_3) begin
        if(when_Axi4LiteCrossbar_l233_12) begin
          io_slaves_3_w_valid = io_masters_0_w_valid;
        end
        if(when_Axi4LiteCrossbar_l233_13) begin
          io_slaves_3_w_valid = io_masters_1_w_valid;
        end
        if(when_Axi4LiteCrossbar_l233_14) begin
          io_slaves_3_w_valid = io_masters_2_w_valid;
        end
        if(when_Axi4LiteCrossbar_l233_15) begin
          io_slaves_3_w_valid = io_masters_3_w_valid;
        end
      end
    end else begin
      if(when_Axi4LiteCrossbar_l285_12) begin
        io_slaves_3_w_valid = io_masters_0_w_valid;
      end
      if(when_Axi4LiteCrossbar_l285_13) begin
        io_slaves_3_w_valid = io_masters_1_w_valid;
      end
      if(when_Axi4LiteCrossbar_l285_14) begin
        io_slaves_3_w_valid = io_masters_2_w_valid;
      end
      if(when_Axi4LiteCrossbar_l285_15) begin
        io_slaves_3_w_valid = io_masters_3_w_valid;
      end
    end
  end

  assign _zz_io_slaves_3_w_payload_data = 36'h0;
  always @(*) begin
    io_slaves_3_w_payload_data = _zz_io_slaves_3_w_payload_data[31 : 0];
    if(when_Axi4LiteCrossbar_l217_3) begin
      if(when_Axi4LiteCrossbar_l229_3) begin
        if(when_Axi4LiteCrossbar_l233_12) begin
          io_slaves_3_w_payload_data = io_masters_0_w_payload_data;
        end
        if(when_Axi4LiteCrossbar_l233_13) begin
          io_slaves_3_w_payload_data = io_masters_1_w_payload_data;
        end
        if(when_Axi4LiteCrossbar_l233_14) begin
          io_slaves_3_w_payload_data = io_masters_2_w_payload_data;
        end
        if(when_Axi4LiteCrossbar_l233_15) begin
          io_slaves_3_w_payload_data = io_masters_3_w_payload_data;
        end
      end
    end else begin
      if(when_Axi4LiteCrossbar_l285_12) begin
        io_slaves_3_w_payload_data = io_masters_0_w_payload_data;
      end
      if(when_Axi4LiteCrossbar_l285_13) begin
        io_slaves_3_w_payload_data = io_masters_1_w_payload_data;
      end
      if(when_Axi4LiteCrossbar_l285_14) begin
        io_slaves_3_w_payload_data = io_masters_2_w_payload_data;
      end
      if(when_Axi4LiteCrossbar_l285_15) begin
        io_slaves_3_w_payload_data = io_masters_3_w_payload_data;
      end
    end
  end

  always @(*) begin
    io_slaves_3_w_payload_strb = _zz_io_slaves_3_w_payload_data[35 : 32];
    if(when_Axi4LiteCrossbar_l217_3) begin
      if(when_Axi4LiteCrossbar_l229_3) begin
        if(when_Axi4LiteCrossbar_l233_12) begin
          io_slaves_3_w_payload_strb = io_masters_0_w_payload_strb;
        end
        if(when_Axi4LiteCrossbar_l233_13) begin
          io_slaves_3_w_payload_strb = io_masters_1_w_payload_strb;
        end
        if(when_Axi4LiteCrossbar_l233_14) begin
          io_slaves_3_w_payload_strb = io_masters_2_w_payload_strb;
        end
        if(when_Axi4LiteCrossbar_l233_15) begin
          io_slaves_3_w_payload_strb = io_masters_3_w_payload_strb;
        end
      end
    end else begin
      if(when_Axi4LiteCrossbar_l285_12) begin
        io_slaves_3_w_payload_strb = io_masters_0_w_payload_strb;
      end
      if(when_Axi4LiteCrossbar_l285_13) begin
        io_slaves_3_w_payload_strb = io_masters_1_w_payload_strb;
      end
      if(when_Axi4LiteCrossbar_l285_14) begin
        io_slaves_3_w_payload_strb = io_masters_2_w_payload_strb;
      end
      if(when_Axi4LiteCrossbar_l285_15) begin
        io_slaves_3_w_payload_strb = io_masters_3_w_payload_strb;
      end
    end
  end

  always @(*) begin
    io_slaves_3_b_ready = 1'b0;
    if(!when_Axi4LiteCrossbar_l217_3) begin
      if(when_Axi4LiteCrossbar_l285_12) begin
        io_slaves_3_b_ready = io_masters_0_b_ready;
      end
      if(when_Axi4LiteCrossbar_l285_13) begin
        io_slaves_3_b_ready = io_masters_1_b_ready;
      end
      if(when_Axi4LiteCrossbar_l285_14) begin
        io_slaves_3_b_ready = io_masters_2_b_ready;
      end
      if(when_Axi4LiteCrossbar_l285_15) begin
        io_slaves_3_b_ready = io_masters_3_b_ready;
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
        if(when_Axi4LiteCrossbar_l320_12) begin
          io_slaves_3_ar_payload_addr = io_masters_0_ar_payload_addr;
        end
        if(when_Axi4LiteCrossbar_l320_13) begin
          io_slaves_3_ar_payload_addr = io_masters_1_ar_payload_addr;
        end
        if(when_Axi4LiteCrossbar_l320_14) begin
          io_slaves_3_ar_payload_addr = io_masters_2_ar_payload_addr;
        end
        if(when_Axi4LiteCrossbar_l320_15) begin
          io_slaves_3_ar_payload_addr = io_masters_3_ar_payload_addr;
        end
      end
    end
  end

  always @(*) begin
    io_slaves_3_ar_payload_prot = _zz_io_slaves_3_ar_payload_addr[34 : 32];
    if(when_Axi4LiteCrossbar_l306_3) begin
      if(when_Axi4LiteCrossbar_l317_3) begin
        if(when_Axi4LiteCrossbar_l320_12) begin
          io_slaves_3_ar_payload_prot = io_masters_0_ar_payload_prot;
        end
        if(when_Axi4LiteCrossbar_l320_13) begin
          io_slaves_3_ar_payload_prot = io_masters_1_ar_payload_prot;
        end
        if(when_Axi4LiteCrossbar_l320_14) begin
          io_slaves_3_ar_payload_prot = io_masters_2_ar_payload_prot;
        end
        if(when_Axi4LiteCrossbar_l320_15) begin
          io_slaves_3_ar_payload_prot = io_masters_3_ar_payload_prot;
        end
      end
    end
  end

  always @(*) begin
    io_slaves_3_r_ready = 1'b0;
    if(!when_Axi4LiteCrossbar_l306_3) begin
      if(when_Axi4LiteCrossbar_l363_12) begin
        io_slaves_3_r_ready = io_masters_0_r_ready;
      end
      if(when_Axi4LiteCrossbar_l363_13) begin
        io_slaves_3_r_ready = io_masters_1_r_ready;
      end
      if(when_Axi4LiteCrossbar_l363_14) begin
        io_slaves_3_r_ready = io_masters_2_r_ready;
      end
      if(when_Axi4LiteCrossbar_l363_15) begin
        io_slaves_3_r_ready = io_masters_3_r_ready;
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
        if(when_Axi4LiteCrossbar_l233_16) begin
          decErr_io_axi_aw_payload_addr = io_masters_0_aw_payload_addr;
        end
        if(when_Axi4LiteCrossbar_l233_17) begin
          decErr_io_axi_aw_payload_addr = io_masters_1_aw_payload_addr;
        end
        if(when_Axi4LiteCrossbar_l233_18) begin
          decErr_io_axi_aw_payload_addr = io_masters_2_aw_payload_addr;
        end
        if(when_Axi4LiteCrossbar_l233_19) begin
          decErr_io_axi_aw_payload_addr = io_masters_3_aw_payload_addr;
        end
      end
    end
  end

  always @(*) begin
    decErr_io_axi_aw_payload_prot = _zz_io_axi_aw_payload_addr[34 : 32];
    if(when_Axi4LiteCrossbar_l217_4) begin
      if(when_Axi4LiteCrossbar_l229_4) begin
        if(when_Axi4LiteCrossbar_l233_16) begin
          decErr_io_axi_aw_payload_prot = io_masters_0_aw_payload_prot;
        end
        if(when_Axi4LiteCrossbar_l233_17) begin
          decErr_io_axi_aw_payload_prot = io_masters_1_aw_payload_prot;
        end
        if(when_Axi4LiteCrossbar_l233_18) begin
          decErr_io_axi_aw_payload_prot = io_masters_2_aw_payload_prot;
        end
        if(when_Axi4LiteCrossbar_l233_19) begin
          decErr_io_axi_aw_payload_prot = io_masters_3_aw_payload_prot;
        end
      end
    end
  end

  always @(*) begin
    decErr_io_axi_w_valid = 1'b0;
    if(when_Axi4LiteCrossbar_l217_4) begin
      if(when_Axi4LiteCrossbar_l229_4) begin
        if(when_Axi4LiteCrossbar_l233_16) begin
          decErr_io_axi_w_valid = io_masters_0_w_valid;
        end
        if(when_Axi4LiteCrossbar_l233_17) begin
          decErr_io_axi_w_valid = io_masters_1_w_valid;
        end
        if(when_Axi4LiteCrossbar_l233_18) begin
          decErr_io_axi_w_valid = io_masters_2_w_valid;
        end
        if(when_Axi4LiteCrossbar_l233_19) begin
          decErr_io_axi_w_valid = io_masters_3_w_valid;
        end
      end
    end else begin
      if(when_Axi4LiteCrossbar_l285_16) begin
        decErr_io_axi_w_valid = io_masters_0_w_valid;
      end
      if(when_Axi4LiteCrossbar_l285_17) begin
        decErr_io_axi_w_valid = io_masters_1_w_valid;
      end
      if(when_Axi4LiteCrossbar_l285_18) begin
        decErr_io_axi_w_valid = io_masters_2_w_valid;
      end
      if(when_Axi4LiteCrossbar_l285_19) begin
        decErr_io_axi_w_valid = io_masters_3_w_valid;
      end
    end
  end

  assign _zz_io_axi_w_payload_data = 36'h0;
  always @(*) begin
    decErr_io_axi_w_payload_data = _zz_io_axi_w_payload_data[31 : 0];
    if(when_Axi4LiteCrossbar_l217_4) begin
      if(when_Axi4LiteCrossbar_l229_4) begin
        if(when_Axi4LiteCrossbar_l233_16) begin
          decErr_io_axi_w_payload_data = io_masters_0_w_payload_data;
        end
        if(when_Axi4LiteCrossbar_l233_17) begin
          decErr_io_axi_w_payload_data = io_masters_1_w_payload_data;
        end
        if(when_Axi4LiteCrossbar_l233_18) begin
          decErr_io_axi_w_payload_data = io_masters_2_w_payload_data;
        end
        if(when_Axi4LiteCrossbar_l233_19) begin
          decErr_io_axi_w_payload_data = io_masters_3_w_payload_data;
        end
      end
    end else begin
      if(when_Axi4LiteCrossbar_l285_16) begin
        decErr_io_axi_w_payload_data = io_masters_0_w_payload_data;
      end
      if(when_Axi4LiteCrossbar_l285_17) begin
        decErr_io_axi_w_payload_data = io_masters_1_w_payload_data;
      end
      if(when_Axi4LiteCrossbar_l285_18) begin
        decErr_io_axi_w_payload_data = io_masters_2_w_payload_data;
      end
      if(when_Axi4LiteCrossbar_l285_19) begin
        decErr_io_axi_w_payload_data = io_masters_3_w_payload_data;
      end
    end
  end

  always @(*) begin
    decErr_io_axi_w_payload_strb = _zz_io_axi_w_payload_data[35 : 32];
    if(when_Axi4LiteCrossbar_l217_4) begin
      if(when_Axi4LiteCrossbar_l229_4) begin
        if(when_Axi4LiteCrossbar_l233_16) begin
          decErr_io_axi_w_payload_strb = io_masters_0_w_payload_strb;
        end
        if(when_Axi4LiteCrossbar_l233_17) begin
          decErr_io_axi_w_payload_strb = io_masters_1_w_payload_strb;
        end
        if(when_Axi4LiteCrossbar_l233_18) begin
          decErr_io_axi_w_payload_strb = io_masters_2_w_payload_strb;
        end
        if(when_Axi4LiteCrossbar_l233_19) begin
          decErr_io_axi_w_payload_strb = io_masters_3_w_payload_strb;
        end
      end
    end else begin
      if(when_Axi4LiteCrossbar_l285_16) begin
        decErr_io_axi_w_payload_strb = io_masters_0_w_payload_strb;
      end
      if(when_Axi4LiteCrossbar_l285_17) begin
        decErr_io_axi_w_payload_strb = io_masters_1_w_payload_strb;
      end
      if(when_Axi4LiteCrossbar_l285_18) begin
        decErr_io_axi_w_payload_strb = io_masters_2_w_payload_strb;
      end
      if(when_Axi4LiteCrossbar_l285_19) begin
        decErr_io_axi_w_payload_strb = io_masters_3_w_payload_strb;
      end
    end
  end

  always @(*) begin
    decErr_io_axi_b_ready = 1'b0;
    if(!when_Axi4LiteCrossbar_l217_4) begin
      if(when_Axi4LiteCrossbar_l285_16) begin
        decErr_io_axi_b_ready = io_masters_0_b_ready;
      end
      if(when_Axi4LiteCrossbar_l285_17) begin
        decErr_io_axi_b_ready = io_masters_1_b_ready;
      end
      if(when_Axi4LiteCrossbar_l285_18) begin
        decErr_io_axi_b_ready = io_masters_2_b_ready;
      end
      if(when_Axi4LiteCrossbar_l285_19) begin
        decErr_io_axi_b_ready = io_masters_3_b_ready;
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
        if(when_Axi4LiteCrossbar_l320_16) begin
          decErr_io_axi_ar_payload_addr = io_masters_0_ar_payload_addr;
        end
        if(when_Axi4LiteCrossbar_l320_17) begin
          decErr_io_axi_ar_payload_addr = io_masters_1_ar_payload_addr;
        end
        if(when_Axi4LiteCrossbar_l320_18) begin
          decErr_io_axi_ar_payload_addr = io_masters_2_ar_payload_addr;
        end
        if(when_Axi4LiteCrossbar_l320_19) begin
          decErr_io_axi_ar_payload_addr = io_masters_3_ar_payload_addr;
        end
      end
    end
  end

  always @(*) begin
    decErr_io_axi_ar_payload_prot = _zz_io_axi_ar_payload_addr[34 : 32];
    if(when_Axi4LiteCrossbar_l306_4) begin
      if(when_Axi4LiteCrossbar_l317_4) begin
        if(when_Axi4LiteCrossbar_l320_16) begin
          decErr_io_axi_ar_payload_prot = io_masters_0_ar_payload_prot;
        end
        if(when_Axi4LiteCrossbar_l320_17) begin
          decErr_io_axi_ar_payload_prot = io_masters_1_ar_payload_prot;
        end
        if(when_Axi4LiteCrossbar_l320_18) begin
          decErr_io_axi_ar_payload_prot = io_masters_2_ar_payload_prot;
        end
        if(when_Axi4LiteCrossbar_l320_19) begin
          decErr_io_axi_ar_payload_prot = io_masters_3_ar_payload_prot;
        end
      end
    end
  end

  always @(*) begin
    decErr_io_axi_r_ready = 1'b0;
    if(!when_Axi4LiteCrossbar_l306_4) begin
      if(when_Axi4LiteCrossbar_l363_16) begin
        decErr_io_axi_r_ready = io_masters_0_r_ready;
      end
      if(when_Axi4LiteCrossbar_l363_17) begin
        decErr_io_axi_r_ready = io_masters_1_r_ready;
      end
      if(when_Axi4LiteCrossbar_l363_18) begin
        decErr_io_axi_r_ready = io_masters_2_r_ready;
      end
      if(when_Axi4LiteCrossbar_l363_19) begin
        decErr_io_axi_r_ready = io_masters_3_r_ready;
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
    _zz_when_Axi4LiteCrossbar_l229[2] = (io_masters_2_aw_valid && _zz__zz_when_Axi4LiteCrossbar_l229_2[0]);
    _zz_when_Axi4LiteCrossbar_l229[3] = (io_masters_3_aw_valid && _zz__zz_when_Axi4LiteCrossbar_l229_3[0]);
  end

  always @(*) begin
    _zz_when_Axi4LiteCrossbar_l229_2[0] = ((32'h0 <= io_masters_1_aw_payload_addr) && (io_masters_1_aw_payload_addr < 32'h00010000));
    _zz_when_Axi4LiteCrossbar_l229_2[1] = ((32'h00010000 <= io_masters_1_aw_payload_addr) && (io_masters_1_aw_payload_addr < 32'h00020000));
    _zz_when_Axi4LiteCrossbar_l229_2[2] = ((32'h00020000 <= io_masters_1_aw_payload_addr) && (io_masters_1_aw_payload_addr < 32'h00030000));
    _zz_when_Axi4LiteCrossbar_l229_2[3] = ((32'h00030000 <= io_masters_1_aw_payload_addr) && (io_masters_1_aw_payload_addr < 32'h00040000));
  end

  always @(*) begin
    _zz_when_Axi4LiteCrossbar_l229_3[0] = ((32'h0 <= io_masters_2_aw_payload_addr) && (io_masters_2_aw_payload_addr < 32'h00010000));
    _zz_when_Axi4LiteCrossbar_l229_3[1] = ((32'h00010000 <= io_masters_2_aw_payload_addr) && (io_masters_2_aw_payload_addr < 32'h00020000));
    _zz_when_Axi4LiteCrossbar_l229_3[2] = ((32'h00020000 <= io_masters_2_aw_payload_addr) && (io_masters_2_aw_payload_addr < 32'h00030000));
    _zz_when_Axi4LiteCrossbar_l229_3[3] = ((32'h00030000 <= io_masters_2_aw_payload_addr) && (io_masters_2_aw_payload_addr < 32'h00040000));
  end

  always @(*) begin
    _zz_when_Axi4LiteCrossbar_l229_4[0] = ((32'h0 <= io_masters_3_aw_payload_addr) && (io_masters_3_aw_payload_addr < 32'h00010000));
    _zz_when_Axi4LiteCrossbar_l229_4[1] = ((32'h00010000 <= io_masters_3_aw_payload_addr) && (io_masters_3_aw_payload_addr < 32'h00020000));
    _zz_when_Axi4LiteCrossbar_l229_4[2] = ((32'h00020000 <= io_masters_3_aw_payload_addr) && (io_masters_3_aw_payload_addr < 32'h00030000));
    _zz_when_Axi4LiteCrossbar_l229_4[3] = ((32'h00030000 <= io_masters_3_aw_payload_addr) && (io_masters_3_aw_payload_addr < 32'h00040000));
  end

  assign _zz_when_Axi4LiteCrossbar_l152 = _zz_when_Axi4LiteCrossbar_l229;
  assign _zz_when_Axi4LiteCrossbar_l152_1 = (_zz_when_Axi4LiteCrossbar_l152 & (~ _zz__zz_when_Axi4LiteCrossbar_l152_1));
  always @(*) begin
    _zz_wrGranted_0 = 2'b00;
    if(when_Axi4LiteCrossbar_l152) begin
      _zz_wrGranted_0 = 2'b00;
    end
    if(when_Axi4LiteCrossbar_l152_1) begin
      _zz_wrGranted_0 = 2'b01;
    end
    if(when_Axi4LiteCrossbar_l152_2) begin
      _zz_wrGranted_0 = 2'b10;
    end
    if(when_Axi4LiteCrossbar_l152_3) begin
      _zz_wrGranted_0 = 2'b11;
    end
  end

  assign when_Axi4LiteCrossbar_l152 = _zz_when_Axi4LiteCrossbar_l152_1[0];
  assign when_Axi4LiteCrossbar_l152_1 = _zz_when_Axi4LiteCrossbar_l152_1[1];
  assign when_Axi4LiteCrossbar_l152_2 = _zz_when_Axi4LiteCrossbar_l152_1[2];
  assign when_Axi4LiteCrossbar_l152_3 = _zz_when_Axi4LiteCrossbar_l152_1[3];
  assign when_Axi4LiteCrossbar_l229 = (|_zz_when_Axi4LiteCrossbar_l229);
  assign when_Axi4LiteCrossbar_l233 = (_zz_wrGranted_0 == 2'b00);
  assign when_Axi4LiteCrossbar_l233_1 = (_zz_wrGranted_0 == 2'b01);
  assign when_Axi4LiteCrossbar_l233_2 = (_zz_wrGranted_0 == 2'b10);
  assign when_Axi4LiteCrossbar_l233_3 = (_zz_wrGranted_0 == 2'b11);
  assign io_slaves_0_aw_fire = (io_slaves_0_aw_valid && io_slaves_0_aw_ready);
  assign when_Axi4LiteCrossbar_l285 = (wrGranted_0 == 2'b00);
  assign when_Axi4LiteCrossbar_l285_1 = (wrGranted_0 == 2'b01);
  assign when_Axi4LiteCrossbar_l285_2 = (wrGranted_0 == 2'b10);
  assign when_Axi4LiteCrossbar_l285_3 = (wrGranted_0 == 2'b11);
  assign io_slaves_0_b_fire = (io_slaves_0_b_valid && io_slaves_0_b_ready);
  assign when_Axi4LiteCrossbar_l217_1 = (! wrActive_1);
  always @(*) begin
    _zz_when_Axi4LiteCrossbar_l229_6[0] = ((32'h0 <= io_masters_0_aw_payload_addr) && (io_masters_0_aw_payload_addr < 32'h00010000));
    _zz_when_Axi4LiteCrossbar_l229_6[1] = ((32'h00010000 <= io_masters_0_aw_payload_addr) && (io_masters_0_aw_payload_addr < 32'h00020000));
    _zz_when_Axi4LiteCrossbar_l229_6[2] = ((32'h00020000 <= io_masters_0_aw_payload_addr) && (io_masters_0_aw_payload_addr < 32'h00030000));
    _zz_when_Axi4LiteCrossbar_l229_6[3] = ((32'h00030000 <= io_masters_0_aw_payload_addr) && (io_masters_0_aw_payload_addr < 32'h00040000));
  end

  always @(*) begin
    _zz_when_Axi4LiteCrossbar_l229_5[0] = (io_masters_0_aw_valid && _zz__zz_when_Axi4LiteCrossbar_l229_5[1]);
    _zz_when_Axi4LiteCrossbar_l229_5[1] = (io_masters_1_aw_valid && _zz__zz_when_Axi4LiteCrossbar_l229_5_1[1]);
    _zz_when_Axi4LiteCrossbar_l229_5[2] = (io_masters_2_aw_valid && _zz__zz_when_Axi4LiteCrossbar_l229_5_2[1]);
    _zz_when_Axi4LiteCrossbar_l229_5[3] = (io_masters_3_aw_valid && _zz__zz_when_Axi4LiteCrossbar_l229_5_3[1]);
  end

  always @(*) begin
    _zz_when_Axi4LiteCrossbar_l229_7[0] = ((32'h0 <= io_masters_1_aw_payload_addr) && (io_masters_1_aw_payload_addr < 32'h00010000));
    _zz_when_Axi4LiteCrossbar_l229_7[1] = ((32'h00010000 <= io_masters_1_aw_payload_addr) && (io_masters_1_aw_payload_addr < 32'h00020000));
    _zz_when_Axi4LiteCrossbar_l229_7[2] = ((32'h00020000 <= io_masters_1_aw_payload_addr) && (io_masters_1_aw_payload_addr < 32'h00030000));
    _zz_when_Axi4LiteCrossbar_l229_7[3] = ((32'h00030000 <= io_masters_1_aw_payload_addr) && (io_masters_1_aw_payload_addr < 32'h00040000));
  end

  always @(*) begin
    _zz_when_Axi4LiteCrossbar_l229_8[0] = ((32'h0 <= io_masters_2_aw_payload_addr) && (io_masters_2_aw_payload_addr < 32'h00010000));
    _zz_when_Axi4LiteCrossbar_l229_8[1] = ((32'h00010000 <= io_masters_2_aw_payload_addr) && (io_masters_2_aw_payload_addr < 32'h00020000));
    _zz_when_Axi4LiteCrossbar_l229_8[2] = ((32'h00020000 <= io_masters_2_aw_payload_addr) && (io_masters_2_aw_payload_addr < 32'h00030000));
    _zz_when_Axi4LiteCrossbar_l229_8[3] = ((32'h00030000 <= io_masters_2_aw_payload_addr) && (io_masters_2_aw_payload_addr < 32'h00040000));
  end

  always @(*) begin
    _zz_when_Axi4LiteCrossbar_l229_9[0] = ((32'h0 <= io_masters_3_aw_payload_addr) && (io_masters_3_aw_payload_addr < 32'h00010000));
    _zz_when_Axi4LiteCrossbar_l229_9[1] = ((32'h00010000 <= io_masters_3_aw_payload_addr) && (io_masters_3_aw_payload_addr < 32'h00020000));
    _zz_when_Axi4LiteCrossbar_l229_9[2] = ((32'h00020000 <= io_masters_3_aw_payload_addr) && (io_masters_3_aw_payload_addr < 32'h00030000));
    _zz_when_Axi4LiteCrossbar_l229_9[3] = ((32'h00030000 <= io_masters_3_aw_payload_addr) && (io_masters_3_aw_payload_addr < 32'h00040000));
  end

  assign _zz_when_Axi4LiteCrossbar_l152_2 = _zz_when_Axi4LiteCrossbar_l229_5;
  assign _zz_when_Axi4LiteCrossbar_l152_3 = (_zz_when_Axi4LiteCrossbar_l152_2 & (~ _zz__zz_when_Axi4LiteCrossbar_l152_3));
  always @(*) begin
    _zz_wrGranted_1 = 2'b00;
    if(when_Axi4LiteCrossbar_l152_4) begin
      _zz_wrGranted_1 = 2'b00;
    end
    if(when_Axi4LiteCrossbar_l152_5) begin
      _zz_wrGranted_1 = 2'b01;
    end
    if(when_Axi4LiteCrossbar_l152_6) begin
      _zz_wrGranted_1 = 2'b10;
    end
    if(when_Axi4LiteCrossbar_l152_7) begin
      _zz_wrGranted_1 = 2'b11;
    end
  end

  assign when_Axi4LiteCrossbar_l152_4 = _zz_when_Axi4LiteCrossbar_l152_3[0];
  assign when_Axi4LiteCrossbar_l152_5 = _zz_when_Axi4LiteCrossbar_l152_3[1];
  assign when_Axi4LiteCrossbar_l152_6 = _zz_when_Axi4LiteCrossbar_l152_3[2];
  assign when_Axi4LiteCrossbar_l152_7 = _zz_when_Axi4LiteCrossbar_l152_3[3];
  assign when_Axi4LiteCrossbar_l229_1 = (|_zz_when_Axi4LiteCrossbar_l229_5);
  assign when_Axi4LiteCrossbar_l233_4 = (_zz_wrGranted_1 == 2'b00);
  assign when_Axi4LiteCrossbar_l233_5 = (_zz_wrGranted_1 == 2'b01);
  assign when_Axi4LiteCrossbar_l233_6 = (_zz_wrGranted_1 == 2'b10);
  assign when_Axi4LiteCrossbar_l233_7 = (_zz_wrGranted_1 == 2'b11);
  assign io_slaves_1_aw_fire = (io_slaves_1_aw_valid && io_slaves_1_aw_ready);
  assign when_Axi4LiteCrossbar_l285_4 = (wrGranted_1 == 2'b00);
  assign when_Axi4LiteCrossbar_l285_5 = (wrGranted_1 == 2'b01);
  assign when_Axi4LiteCrossbar_l285_6 = (wrGranted_1 == 2'b10);
  assign when_Axi4LiteCrossbar_l285_7 = (wrGranted_1 == 2'b11);
  assign io_slaves_1_b_fire = (io_slaves_1_b_valid && io_slaves_1_b_ready);
  assign when_Axi4LiteCrossbar_l217_2 = (! wrActive_2);
  always @(*) begin
    _zz_when_Axi4LiteCrossbar_l229_11[0] = ((32'h0 <= io_masters_0_aw_payload_addr) && (io_masters_0_aw_payload_addr < 32'h00010000));
    _zz_when_Axi4LiteCrossbar_l229_11[1] = ((32'h00010000 <= io_masters_0_aw_payload_addr) && (io_masters_0_aw_payload_addr < 32'h00020000));
    _zz_when_Axi4LiteCrossbar_l229_11[2] = ((32'h00020000 <= io_masters_0_aw_payload_addr) && (io_masters_0_aw_payload_addr < 32'h00030000));
    _zz_when_Axi4LiteCrossbar_l229_11[3] = ((32'h00030000 <= io_masters_0_aw_payload_addr) && (io_masters_0_aw_payload_addr < 32'h00040000));
  end

  always @(*) begin
    _zz_when_Axi4LiteCrossbar_l229_10[0] = (io_masters_0_aw_valid && _zz__zz_when_Axi4LiteCrossbar_l229_10[2]);
    _zz_when_Axi4LiteCrossbar_l229_10[1] = (io_masters_1_aw_valid && _zz__zz_when_Axi4LiteCrossbar_l229_10_1[2]);
    _zz_when_Axi4LiteCrossbar_l229_10[2] = (io_masters_2_aw_valid && _zz__zz_when_Axi4LiteCrossbar_l229_10_2[2]);
    _zz_when_Axi4LiteCrossbar_l229_10[3] = (io_masters_3_aw_valid && _zz__zz_when_Axi4LiteCrossbar_l229_10_3[2]);
  end

  always @(*) begin
    _zz_when_Axi4LiteCrossbar_l229_12[0] = ((32'h0 <= io_masters_1_aw_payload_addr) && (io_masters_1_aw_payload_addr < 32'h00010000));
    _zz_when_Axi4LiteCrossbar_l229_12[1] = ((32'h00010000 <= io_masters_1_aw_payload_addr) && (io_masters_1_aw_payload_addr < 32'h00020000));
    _zz_when_Axi4LiteCrossbar_l229_12[2] = ((32'h00020000 <= io_masters_1_aw_payload_addr) && (io_masters_1_aw_payload_addr < 32'h00030000));
    _zz_when_Axi4LiteCrossbar_l229_12[3] = ((32'h00030000 <= io_masters_1_aw_payload_addr) && (io_masters_1_aw_payload_addr < 32'h00040000));
  end

  always @(*) begin
    _zz_when_Axi4LiteCrossbar_l229_13[0] = ((32'h0 <= io_masters_2_aw_payload_addr) && (io_masters_2_aw_payload_addr < 32'h00010000));
    _zz_when_Axi4LiteCrossbar_l229_13[1] = ((32'h00010000 <= io_masters_2_aw_payload_addr) && (io_masters_2_aw_payload_addr < 32'h00020000));
    _zz_when_Axi4LiteCrossbar_l229_13[2] = ((32'h00020000 <= io_masters_2_aw_payload_addr) && (io_masters_2_aw_payload_addr < 32'h00030000));
    _zz_when_Axi4LiteCrossbar_l229_13[3] = ((32'h00030000 <= io_masters_2_aw_payload_addr) && (io_masters_2_aw_payload_addr < 32'h00040000));
  end

  always @(*) begin
    _zz_when_Axi4LiteCrossbar_l229_14[0] = ((32'h0 <= io_masters_3_aw_payload_addr) && (io_masters_3_aw_payload_addr < 32'h00010000));
    _zz_when_Axi4LiteCrossbar_l229_14[1] = ((32'h00010000 <= io_masters_3_aw_payload_addr) && (io_masters_3_aw_payload_addr < 32'h00020000));
    _zz_when_Axi4LiteCrossbar_l229_14[2] = ((32'h00020000 <= io_masters_3_aw_payload_addr) && (io_masters_3_aw_payload_addr < 32'h00030000));
    _zz_when_Axi4LiteCrossbar_l229_14[3] = ((32'h00030000 <= io_masters_3_aw_payload_addr) && (io_masters_3_aw_payload_addr < 32'h00040000));
  end

  assign _zz_when_Axi4LiteCrossbar_l152_4 = _zz_when_Axi4LiteCrossbar_l229_10;
  assign _zz_when_Axi4LiteCrossbar_l152_5 = (_zz_when_Axi4LiteCrossbar_l152_4 & (~ _zz__zz_when_Axi4LiteCrossbar_l152_5));
  always @(*) begin
    _zz_wrGranted_2 = 2'b00;
    if(when_Axi4LiteCrossbar_l152_8) begin
      _zz_wrGranted_2 = 2'b00;
    end
    if(when_Axi4LiteCrossbar_l152_9) begin
      _zz_wrGranted_2 = 2'b01;
    end
    if(when_Axi4LiteCrossbar_l152_10) begin
      _zz_wrGranted_2 = 2'b10;
    end
    if(when_Axi4LiteCrossbar_l152_11) begin
      _zz_wrGranted_2 = 2'b11;
    end
  end

  assign when_Axi4LiteCrossbar_l152_8 = _zz_when_Axi4LiteCrossbar_l152_5[0];
  assign when_Axi4LiteCrossbar_l152_9 = _zz_when_Axi4LiteCrossbar_l152_5[1];
  assign when_Axi4LiteCrossbar_l152_10 = _zz_when_Axi4LiteCrossbar_l152_5[2];
  assign when_Axi4LiteCrossbar_l152_11 = _zz_when_Axi4LiteCrossbar_l152_5[3];
  assign when_Axi4LiteCrossbar_l229_2 = (|_zz_when_Axi4LiteCrossbar_l229_10);
  assign when_Axi4LiteCrossbar_l233_8 = (_zz_wrGranted_2 == 2'b00);
  assign when_Axi4LiteCrossbar_l233_9 = (_zz_wrGranted_2 == 2'b01);
  assign when_Axi4LiteCrossbar_l233_10 = (_zz_wrGranted_2 == 2'b10);
  assign when_Axi4LiteCrossbar_l233_11 = (_zz_wrGranted_2 == 2'b11);
  assign io_slaves_2_aw_fire = (io_slaves_2_aw_valid && io_slaves_2_aw_ready);
  assign when_Axi4LiteCrossbar_l285_8 = (wrGranted_2 == 2'b00);
  assign when_Axi4LiteCrossbar_l285_9 = (wrGranted_2 == 2'b01);
  assign when_Axi4LiteCrossbar_l285_10 = (wrGranted_2 == 2'b10);
  assign when_Axi4LiteCrossbar_l285_11 = (wrGranted_2 == 2'b11);
  assign io_slaves_2_b_fire = (io_slaves_2_b_valid && io_slaves_2_b_ready);
  assign when_Axi4LiteCrossbar_l217_3 = (! wrActive_3);
  always @(*) begin
    _zz_when_Axi4LiteCrossbar_l229_16[0] = ((32'h0 <= io_masters_0_aw_payload_addr) && (io_masters_0_aw_payload_addr < 32'h00010000));
    _zz_when_Axi4LiteCrossbar_l229_16[1] = ((32'h00010000 <= io_masters_0_aw_payload_addr) && (io_masters_0_aw_payload_addr < 32'h00020000));
    _zz_when_Axi4LiteCrossbar_l229_16[2] = ((32'h00020000 <= io_masters_0_aw_payload_addr) && (io_masters_0_aw_payload_addr < 32'h00030000));
    _zz_when_Axi4LiteCrossbar_l229_16[3] = ((32'h00030000 <= io_masters_0_aw_payload_addr) && (io_masters_0_aw_payload_addr < 32'h00040000));
  end

  always @(*) begin
    _zz_when_Axi4LiteCrossbar_l229_15[0] = (io_masters_0_aw_valid && _zz__zz_when_Axi4LiteCrossbar_l229_15[3]);
    _zz_when_Axi4LiteCrossbar_l229_15[1] = (io_masters_1_aw_valid && _zz__zz_when_Axi4LiteCrossbar_l229_15_1[3]);
    _zz_when_Axi4LiteCrossbar_l229_15[2] = (io_masters_2_aw_valid && _zz__zz_when_Axi4LiteCrossbar_l229_15_2[3]);
    _zz_when_Axi4LiteCrossbar_l229_15[3] = (io_masters_3_aw_valid && _zz__zz_when_Axi4LiteCrossbar_l229_15_3[3]);
  end

  always @(*) begin
    _zz_when_Axi4LiteCrossbar_l229_17[0] = ((32'h0 <= io_masters_1_aw_payload_addr) && (io_masters_1_aw_payload_addr < 32'h00010000));
    _zz_when_Axi4LiteCrossbar_l229_17[1] = ((32'h00010000 <= io_masters_1_aw_payload_addr) && (io_masters_1_aw_payload_addr < 32'h00020000));
    _zz_when_Axi4LiteCrossbar_l229_17[2] = ((32'h00020000 <= io_masters_1_aw_payload_addr) && (io_masters_1_aw_payload_addr < 32'h00030000));
    _zz_when_Axi4LiteCrossbar_l229_17[3] = ((32'h00030000 <= io_masters_1_aw_payload_addr) && (io_masters_1_aw_payload_addr < 32'h00040000));
  end

  always @(*) begin
    _zz_when_Axi4LiteCrossbar_l229_18[0] = ((32'h0 <= io_masters_2_aw_payload_addr) && (io_masters_2_aw_payload_addr < 32'h00010000));
    _zz_when_Axi4LiteCrossbar_l229_18[1] = ((32'h00010000 <= io_masters_2_aw_payload_addr) && (io_masters_2_aw_payload_addr < 32'h00020000));
    _zz_when_Axi4LiteCrossbar_l229_18[2] = ((32'h00020000 <= io_masters_2_aw_payload_addr) && (io_masters_2_aw_payload_addr < 32'h00030000));
    _zz_when_Axi4LiteCrossbar_l229_18[3] = ((32'h00030000 <= io_masters_2_aw_payload_addr) && (io_masters_2_aw_payload_addr < 32'h00040000));
  end

  always @(*) begin
    _zz_when_Axi4LiteCrossbar_l229_19[0] = ((32'h0 <= io_masters_3_aw_payload_addr) && (io_masters_3_aw_payload_addr < 32'h00010000));
    _zz_when_Axi4LiteCrossbar_l229_19[1] = ((32'h00010000 <= io_masters_3_aw_payload_addr) && (io_masters_3_aw_payload_addr < 32'h00020000));
    _zz_when_Axi4LiteCrossbar_l229_19[2] = ((32'h00020000 <= io_masters_3_aw_payload_addr) && (io_masters_3_aw_payload_addr < 32'h00030000));
    _zz_when_Axi4LiteCrossbar_l229_19[3] = ((32'h00030000 <= io_masters_3_aw_payload_addr) && (io_masters_3_aw_payload_addr < 32'h00040000));
  end

  assign _zz_when_Axi4LiteCrossbar_l152_6 = _zz_when_Axi4LiteCrossbar_l229_15;
  assign _zz_when_Axi4LiteCrossbar_l152_7 = (_zz_when_Axi4LiteCrossbar_l152_6 & (~ _zz__zz_when_Axi4LiteCrossbar_l152_7));
  always @(*) begin
    _zz_wrGranted_3 = 2'b00;
    if(when_Axi4LiteCrossbar_l152_12) begin
      _zz_wrGranted_3 = 2'b00;
    end
    if(when_Axi4LiteCrossbar_l152_13) begin
      _zz_wrGranted_3 = 2'b01;
    end
    if(when_Axi4LiteCrossbar_l152_14) begin
      _zz_wrGranted_3 = 2'b10;
    end
    if(when_Axi4LiteCrossbar_l152_15) begin
      _zz_wrGranted_3 = 2'b11;
    end
  end

  assign when_Axi4LiteCrossbar_l152_12 = _zz_when_Axi4LiteCrossbar_l152_7[0];
  assign when_Axi4LiteCrossbar_l152_13 = _zz_when_Axi4LiteCrossbar_l152_7[1];
  assign when_Axi4LiteCrossbar_l152_14 = _zz_when_Axi4LiteCrossbar_l152_7[2];
  assign when_Axi4LiteCrossbar_l152_15 = _zz_when_Axi4LiteCrossbar_l152_7[3];
  assign when_Axi4LiteCrossbar_l229_3 = (|_zz_when_Axi4LiteCrossbar_l229_15);
  assign when_Axi4LiteCrossbar_l233_12 = (_zz_wrGranted_3 == 2'b00);
  assign when_Axi4LiteCrossbar_l233_13 = (_zz_wrGranted_3 == 2'b01);
  assign when_Axi4LiteCrossbar_l233_14 = (_zz_wrGranted_3 == 2'b10);
  assign when_Axi4LiteCrossbar_l233_15 = (_zz_wrGranted_3 == 2'b11);
  assign io_slaves_3_aw_fire = (io_slaves_3_aw_valid && io_slaves_3_aw_ready);
  assign when_Axi4LiteCrossbar_l285_12 = (wrGranted_3 == 2'b00);
  assign when_Axi4LiteCrossbar_l285_13 = (wrGranted_3 == 2'b01);
  assign when_Axi4LiteCrossbar_l285_14 = (wrGranted_3 == 2'b10);
  assign when_Axi4LiteCrossbar_l285_15 = (wrGranted_3 == 2'b11);
  assign io_slaves_3_b_fire = (io_slaves_3_b_valid && io_slaves_3_b_ready);
  assign when_Axi4LiteCrossbar_l217_4 = (! wrActive_4);
  always @(*) begin
    _zz_when_Axi4LiteCrossbar_l229_21[0] = ((32'h0 <= io_masters_0_aw_payload_addr) && (io_masters_0_aw_payload_addr < 32'h00010000));
    _zz_when_Axi4LiteCrossbar_l229_21[1] = ((32'h00010000 <= io_masters_0_aw_payload_addr) && (io_masters_0_aw_payload_addr < 32'h00020000));
    _zz_when_Axi4LiteCrossbar_l229_21[2] = ((32'h00020000 <= io_masters_0_aw_payload_addr) && (io_masters_0_aw_payload_addr < 32'h00030000));
    _zz_when_Axi4LiteCrossbar_l229_21[3] = ((32'h00030000 <= io_masters_0_aw_payload_addr) && (io_masters_0_aw_payload_addr < 32'h00040000));
  end

  always @(*) begin
    _zz_when_Axi4LiteCrossbar_l229_20[0] = (io_masters_0_aw_valid && _zz__zz_when_Axi4LiteCrossbar_l229_20[4]);
    _zz_when_Axi4LiteCrossbar_l229_20[1] = (io_masters_1_aw_valid && _zz__zz_when_Axi4LiteCrossbar_l229_20_1[4]);
    _zz_when_Axi4LiteCrossbar_l229_20[2] = (io_masters_2_aw_valid && _zz__zz_when_Axi4LiteCrossbar_l229_20_2[4]);
    _zz_when_Axi4LiteCrossbar_l229_20[3] = (io_masters_3_aw_valid && _zz__zz_when_Axi4LiteCrossbar_l229_20_3[4]);
  end

  always @(*) begin
    _zz_when_Axi4LiteCrossbar_l229_22[0] = ((32'h0 <= io_masters_1_aw_payload_addr) && (io_masters_1_aw_payload_addr < 32'h00010000));
    _zz_when_Axi4LiteCrossbar_l229_22[1] = ((32'h00010000 <= io_masters_1_aw_payload_addr) && (io_masters_1_aw_payload_addr < 32'h00020000));
    _zz_when_Axi4LiteCrossbar_l229_22[2] = ((32'h00020000 <= io_masters_1_aw_payload_addr) && (io_masters_1_aw_payload_addr < 32'h00030000));
    _zz_when_Axi4LiteCrossbar_l229_22[3] = ((32'h00030000 <= io_masters_1_aw_payload_addr) && (io_masters_1_aw_payload_addr < 32'h00040000));
  end

  always @(*) begin
    _zz_when_Axi4LiteCrossbar_l229_23[0] = ((32'h0 <= io_masters_2_aw_payload_addr) && (io_masters_2_aw_payload_addr < 32'h00010000));
    _zz_when_Axi4LiteCrossbar_l229_23[1] = ((32'h00010000 <= io_masters_2_aw_payload_addr) && (io_masters_2_aw_payload_addr < 32'h00020000));
    _zz_when_Axi4LiteCrossbar_l229_23[2] = ((32'h00020000 <= io_masters_2_aw_payload_addr) && (io_masters_2_aw_payload_addr < 32'h00030000));
    _zz_when_Axi4LiteCrossbar_l229_23[3] = ((32'h00030000 <= io_masters_2_aw_payload_addr) && (io_masters_2_aw_payload_addr < 32'h00040000));
  end

  always @(*) begin
    _zz_when_Axi4LiteCrossbar_l229_24[0] = ((32'h0 <= io_masters_3_aw_payload_addr) && (io_masters_3_aw_payload_addr < 32'h00010000));
    _zz_when_Axi4LiteCrossbar_l229_24[1] = ((32'h00010000 <= io_masters_3_aw_payload_addr) && (io_masters_3_aw_payload_addr < 32'h00020000));
    _zz_when_Axi4LiteCrossbar_l229_24[2] = ((32'h00020000 <= io_masters_3_aw_payload_addr) && (io_masters_3_aw_payload_addr < 32'h00030000));
    _zz_when_Axi4LiteCrossbar_l229_24[3] = ((32'h00030000 <= io_masters_3_aw_payload_addr) && (io_masters_3_aw_payload_addr < 32'h00040000));
  end

  assign _zz_when_Axi4LiteCrossbar_l152_8 = _zz_when_Axi4LiteCrossbar_l229_20;
  assign _zz_when_Axi4LiteCrossbar_l152_9 = (_zz_when_Axi4LiteCrossbar_l152_8 & (~ _zz__zz_when_Axi4LiteCrossbar_l152_9));
  always @(*) begin
    _zz_wrGranted_4 = 2'b00;
    if(when_Axi4LiteCrossbar_l152_16) begin
      _zz_wrGranted_4 = 2'b00;
    end
    if(when_Axi4LiteCrossbar_l152_17) begin
      _zz_wrGranted_4 = 2'b01;
    end
    if(when_Axi4LiteCrossbar_l152_18) begin
      _zz_wrGranted_4 = 2'b10;
    end
    if(when_Axi4LiteCrossbar_l152_19) begin
      _zz_wrGranted_4 = 2'b11;
    end
  end

  assign when_Axi4LiteCrossbar_l152_16 = _zz_when_Axi4LiteCrossbar_l152_9[0];
  assign when_Axi4LiteCrossbar_l152_17 = _zz_when_Axi4LiteCrossbar_l152_9[1];
  assign when_Axi4LiteCrossbar_l152_18 = _zz_when_Axi4LiteCrossbar_l152_9[2];
  assign when_Axi4LiteCrossbar_l152_19 = _zz_when_Axi4LiteCrossbar_l152_9[3];
  assign when_Axi4LiteCrossbar_l229_4 = (|_zz_when_Axi4LiteCrossbar_l229_20);
  assign when_Axi4LiteCrossbar_l233_16 = (_zz_wrGranted_4 == 2'b00);
  assign when_Axi4LiteCrossbar_l233_17 = (_zz_wrGranted_4 == 2'b01);
  assign when_Axi4LiteCrossbar_l233_18 = (_zz_wrGranted_4 == 2'b10);
  assign when_Axi4LiteCrossbar_l233_19 = (_zz_wrGranted_4 == 2'b11);
  assign decErr_io_axi_aw_fire = (decErr_io_axi_aw_valid && decErr_io_axi_aw_ready);
  assign when_Axi4LiteCrossbar_l285_16 = (wrGranted_4 == 2'b00);
  assign when_Axi4LiteCrossbar_l285_17 = (wrGranted_4 == 2'b01);
  assign when_Axi4LiteCrossbar_l285_18 = (wrGranted_4 == 2'b10);
  assign when_Axi4LiteCrossbar_l285_19 = (wrGranted_4 == 2'b11);
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
    _zz_when_Axi4LiteCrossbar_l317[2] = (io_masters_2_ar_valid && _zz__zz_when_Axi4LiteCrossbar_l317_2[0]);
    _zz_when_Axi4LiteCrossbar_l317[3] = (io_masters_3_ar_valid && _zz__zz_when_Axi4LiteCrossbar_l317_3[0]);
  end

  always @(*) begin
    _zz_when_Axi4LiteCrossbar_l317_2[0] = ((32'h0 <= io_masters_1_ar_payload_addr) && (io_masters_1_ar_payload_addr < 32'h00010000));
    _zz_when_Axi4LiteCrossbar_l317_2[1] = ((32'h00010000 <= io_masters_1_ar_payload_addr) && (io_masters_1_ar_payload_addr < 32'h00020000));
    _zz_when_Axi4LiteCrossbar_l317_2[2] = ((32'h00020000 <= io_masters_1_ar_payload_addr) && (io_masters_1_ar_payload_addr < 32'h00030000));
    _zz_when_Axi4LiteCrossbar_l317_2[3] = ((32'h00030000 <= io_masters_1_ar_payload_addr) && (io_masters_1_ar_payload_addr < 32'h00040000));
  end

  always @(*) begin
    _zz_when_Axi4LiteCrossbar_l317_3[0] = ((32'h0 <= io_masters_2_ar_payload_addr) && (io_masters_2_ar_payload_addr < 32'h00010000));
    _zz_when_Axi4LiteCrossbar_l317_3[1] = ((32'h00010000 <= io_masters_2_ar_payload_addr) && (io_masters_2_ar_payload_addr < 32'h00020000));
    _zz_when_Axi4LiteCrossbar_l317_3[2] = ((32'h00020000 <= io_masters_2_ar_payload_addr) && (io_masters_2_ar_payload_addr < 32'h00030000));
    _zz_when_Axi4LiteCrossbar_l317_3[3] = ((32'h00030000 <= io_masters_2_ar_payload_addr) && (io_masters_2_ar_payload_addr < 32'h00040000));
  end

  always @(*) begin
    _zz_when_Axi4LiteCrossbar_l317_4[0] = ((32'h0 <= io_masters_3_ar_payload_addr) && (io_masters_3_ar_payload_addr < 32'h00010000));
    _zz_when_Axi4LiteCrossbar_l317_4[1] = ((32'h00010000 <= io_masters_3_ar_payload_addr) && (io_masters_3_ar_payload_addr < 32'h00020000));
    _zz_when_Axi4LiteCrossbar_l317_4[2] = ((32'h00020000 <= io_masters_3_ar_payload_addr) && (io_masters_3_ar_payload_addr < 32'h00030000));
    _zz_when_Axi4LiteCrossbar_l317_4[3] = ((32'h00030000 <= io_masters_3_ar_payload_addr) && (io_masters_3_ar_payload_addr < 32'h00040000));
  end

  assign _zz_when_Axi4LiteCrossbar_l152_10 = _zz_when_Axi4LiteCrossbar_l317;
  assign _zz_when_Axi4LiteCrossbar_l152_11 = (_zz_when_Axi4LiteCrossbar_l152_10 & (~ _zz__zz_when_Axi4LiteCrossbar_l152_11));
  always @(*) begin
    _zz_rdGranted_0 = 2'b00;
    if(when_Axi4LiteCrossbar_l152_20) begin
      _zz_rdGranted_0 = 2'b00;
    end
    if(when_Axi4LiteCrossbar_l152_21) begin
      _zz_rdGranted_0 = 2'b01;
    end
    if(when_Axi4LiteCrossbar_l152_22) begin
      _zz_rdGranted_0 = 2'b10;
    end
    if(when_Axi4LiteCrossbar_l152_23) begin
      _zz_rdGranted_0 = 2'b11;
    end
  end

  assign when_Axi4LiteCrossbar_l152_20 = _zz_when_Axi4LiteCrossbar_l152_11[0];
  assign when_Axi4LiteCrossbar_l152_21 = _zz_when_Axi4LiteCrossbar_l152_11[1];
  assign when_Axi4LiteCrossbar_l152_22 = _zz_when_Axi4LiteCrossbar_l152_11[2];
  assign when_Axi4LiteCrossbar_l152_23 = _zz_when_Axi4LiteCrossbar_l152_11[3];
  assign when_Axi4LiteCrossbar_l317 = (|_zz_when_Axi4LiteCrossbar_l317);
  assign when_Axi4LiteCrossbar_l320 = (_zz_rdGranted_0 == 2'b00);
  assign when_Axi4LiteCrossbar_l320_1 = (_zz_rdGranted_0 == 2'b01);
  assign when_Axi4LiteCrossbar_l320_2 = (_zz_rdGranted_0 == 2'b10);
  assign when_Axi4LiteCrossbar_l320_3 = (_zz_rdGranted_0 == 2'b11);
  assign io_slaves_0_ar_fire = (io_slaves_0_ar_valid && io_slaves_0_ar_ready);
  assign when_Axi4LiteCrossbar_l363 = (rdGranted_0 == 2'b00);
  assign when_Axi4LiteCrossbar_l363_1 = (rdGranted_0 == 2'b01);
  assign when_Axi4LiteCrossbar_l363_2 = (rdGranted_0 == 2'b10);
  assign when_Axi4LiteCrossbar_l363_3 = (rdGranted_0 == 2'b11);
  assign io_slaves_0_r_fire = (io_slaves_0_r_valid && io_slaves_0_r_ready);
  assign when_Axi4LiteCrossbar_l306_1 = (! rdActive_1);
  always @(*) begin
    _zz_when_Axi4LiteCrossbar_l317_6[0] = ((32'h0 <= io_masters_0_ar_payload_addr) && (io_masters_0_ar_payload_addr < 32'h00010000));
    _zz_when_Axi4LiteCrossbar_l317_6[1] = ((32'h00010000 <= io_masters_0_ar_payload_addr) && (io_masters_0_ar_payload_addr < 32'h00020000));
    _zz_when_Axi4LiteCrossbar_l317_6[2] = ((32'h00020000 <= io_masters_0_ar_payload_addr) && (io_masters_0_ar_payload_addr < 32'h00030000));
    _zz_when_Axi4LiteCrossbar_l317_6[3] = ((32'h00030000 <= io_masters_0_ar_payload_addr) && (io_masters_0_ar_payload_addr < 32'h00040000));
  end

  always @(*) begin
    _zz_when_Axi4LiteCrossbar_l317_5[0] = (io_masters_0_ar_valid && _zz__zz_when_Axi4LiteCrossbar_l317_5[1]);
    _zz_when_Axi4LiteCrossbar_l317_5[1] = (io_masters_1_ar_valid && _zz__zz_when_Axi4LiteCrossbar_l317_5_1[1]);
    _zz_when_Axi4LiteCrossbar_l317_5[2] = (io_masters_2_ar_valid && _zz__zz_when_Axi4LiteCrossbar_l317_5_2[1]);
    _zz_when_Axi4LiteCrossbar_l317_5[3] = (io_masters_3_ar_valid && _zz__zz_when_Axi4LiteCrossbar_l317_5_3[1]);
  end

  always @(*) begin
    _zz_when_Axi4LiteCrossbar_l317_7[0] = ((32'h0 <= io_masters_1_ar_payload_addr) && (io_masters_1_ar_payload_addr < 32'h00010000));
    _zz_when_Axi4LiteCrossbar_l317_7[1] = ((32'h00010000 <= io_masters_1_ar_payload_addr) && (io_masters_1_ar_payload_addr < 32'h00020000));
    _zz_when_Axi4LiteCrossbar_l317_7[2] = ((32'h00020000 <= io_masters_1_ar_payload_addr) && (io_masters_1_ar_payload_addr < 32'h00030000));
    _zz_when_Axi4LiteCrossbar_l317_7[3] = ((32'h00030000 <= io_masters_1_ar_payload_addr) && (io_masters_1_ar_payload_addr < 32'h00040000));
  end

  always @(*) begin
    _zz_when_Axi4LiteCrossbar_l317_8[0] = ((32'h0 <= io_masters_2_ar_payload_addr) && (io_masters_2_ar_payload_addr < 32'h00010000));
    _zz_when_Axi4LiteCrossbar_l317_8[1] = ((32'h00010000 <= io_masters_2_ar_payload_addr) && (io_masters_2_ar_payload_addr < 32'h00020000));
    _zz_when_Axi4LiteCrossbar_l317_8[2] = ((32'h00020000 <= io_masters_2_ar_payload_addr) && (io_masters_2_ar_payload_addr < 32'h00030000));
    _zz_when_Axi4LiteCrossbar_l317_8[3] = ((32'h00030000 <= io_masters_2_ar_payload_addr) && (io_masters_2_ar_payload_addr < 32'h00040000));
  end

  always @(*) begin
    _zz_when_Axi4LiteCrossbar_l317_9[0] = ((32'h0 <= io_masters_3_ar_payload_addr) && (io_masters_3_ar_payload_addr < 32'h00010000));
    _zz_when_Axi4LiteCrossbar_l317_9[1] = ((32'h00010000 <= io_masters_3_ar_payload_addr) && (io_masters_3_ar_payload_addr < 32'h00020000));
    _zz_when_Axi4LiteCrossbar_l317_9[2] = ((32'h00020000 <= io_masters_3_ar_payload_addr) && (io_masters_3_ar_payload_addr < 32'h00030000));
    _zz_when_Axi4LiteCrossbar_l317_9[3] = ((32'h00030000 <= io_masters_3_ar_payload_addr) && (io_masters_3_ar_payload_addr < 32'h00040000));
  end

  assign _zz_when_Axi4LiteCrossbar_l152_12 = _zz_when_Axi4LiteCrossbar_l317_5;
  assign _zz_when_Axi4LiteCrossbar_l152_13 = (_zz_when_Axi4LiteCrossbar_l152_12 & (~ _zz__zz_when_Axi4LiteCrossbar_l152_13));
  always @(*) begin
    _zz_rdGranted_1 = 2'b00;
    if(when_Axi4LiteCrossbar_l152_24) begin
      _zz_rdGranted_1 = 2'b00;
    end
    if(when_Axi4LiteCrossbar_l152_25) begin
      _zz_rdGranted_1 = 2'b01;
    end
    if(when_Axi4LiteCrossbar_l152_26) begin
      _zz_rdGranted_1 = 2'b10;
    end
    if(when_Axi4LiteCrossbar_l152_27) begin
      _zz_rdGranted_1 = 2'b11;
    end
  end

  assign when_Axi4LiteCrossbar_l152_24 = _zz_when_Axi4LiteCrossbar_l152_13[0];
  assign when_Axi4LiteCrossbar_l152_25 = _zz_when_Axi4LiteCrossbar_l152_13[1];
  assign when_Axi4LiteCrossbar_l152_26 = _zz_when_Axi4LiteCrossbar_l152_13[2];
  assign when_Axi4LiteCrossbar_l152_27 = _zz_when_Axi4LiteCrossbar_l152_13[3];
  assign when_Axi4LiteCrossbar_l317_1 = (|_zz_when_Axi4LiteCrossbar_l317_5);
  assign when_Axi4LiteCrossbar_l320_4 = (_zz_rdGranted_1 == 2'b00);
  assign when_Axi4LiteCrossbar_l320_5 = (_zz_rdGranted_1 == 2'b01);
  assign when_Axi4LiteCrossbar_l320_6 = (_zz_rdGranted_1 == 2'b10);
  assign when_Axi4LiteCrossbar_l320_7 = (_zz_rdGranted_1 == 2'b11);
  assign io_slaves_1_ar_fire = (io_slaves_1_ar_valid && io_slaves_1_ar_ready);
  assign when_Axi4LiteCrossbar_l363_4 = (rdGranted_1 == 2'b00);
  assign when_Axi4LiteCrossbar_l363_5 = (rdGranted_1 == 2'b01);
  assign when_Axi4LiteCrossbar_l363_6 = (rdGranted_1 == 2'b10);
  assign when_Axi4LiteCrossbar_l363_7 = (rdGranted_1 == 2'b11);
  assign io_slaves_1_r_fire = (io_slaves_1_r_valid && io_slaves_1_r_ready);
  assign when_Axi4LiteCrossbar_l306_2 = (! rdActive_2);
  always @(*) begin
    _zz_when_Axi4LiteCrossbar_l317_11[0] = ((32'h0 <= io_masters_0_ar_payload_addr) && (io_masters_0_ar_payload_addr < 32'h00010000));
    _zz_when_Axi4LiteCrossbar_l317_11[1] = ((32'h00010000 <= io_masters_0_ar_payload_addr) && (io_masters_0_ar_payload_addr < 32'h00020000));
    _zz_when_Axi4LiteCrossbar_l317_11[2] = ((32'h00020000 <= io_masters_0_ar_payload_addr) && (io_masters_0_ar_payload_addr < 32'h00030000));
    _zz_when_Axi4LiteCrossbar_l317_11[3] = ((32'h00030000 <= io_masters_0_ar_payload_addr) && (io_masters_0_ar_payload_addr < 32'h00040000));
  end

  always @(*) begin
    _zz_when_Axi4LiteCrossbar_l317_10[0] = (io_masters_0_ar_valid && _zz__zz_when_Axi4LiteCrossbar_l317_10[2]);
    _zz_when_Axi4LiteCrossbar_l317_10[1] = (io_masters_1_ar_valid && _zz__zz_when_Axi4LiteCrossbar_l317_10_1[2]);
    _zz_when_Axi4LiteCrossbar_l317_10[2] = (io_masters_2_ar_valid && _zz__zz_when_Axi4LiteCrossbar_l317_10_2[2]);
    _zz_when_Axi4LiteCrossbar_l317_10[3] = (io_masters_3_ar_valid && _zz__zz_when_Axi4LiteCrossbar_l317_10_3[2]);
  end

  always @(*) begin
    _zz_when_Axi4LiteCrossbar_l317_12[0] = ((32'h0 <= io_masters_1_ar_payload_addr) && (io_masters_1_ar_payload_addr < 32'h00010000));
    _zz_when_Axi4LiteCrossbar_l317_12[1] = ((32'h00010000 <= io_masters_1_ar_payload_addr) && (io_masters_1_ar_payload_addr < 32'h00020000));
    _zz_when_Axi4LiteCrossbar_l317_12[2] = ((32'h00020000 <= io_masters_1_ar_payload_addr) && (io_masters_1_ar_payload_addr < 32'h00030000));
    _zz_when_Axi4LiteCrossbar_l317_12[3] = ((32'h00030000 <= io_masters_1_ar_payload_addr) && (io_masters_1_ar_payload_addr < 32'h00040000));
  end

  always @(*) begin
    _zz_when_Axi4LiteCrossbar_l317_13[0] = ((32'h0 <= io_masters_2_ar_payload_addr) && (io_masters_2_ar_payload_addr < 32'h00010000));
    _zz_when_Axi4LiteCrossbar_l317_13[1] = ((32'h00010000 <= io_masters_2_ar_payload_addr) && (io_masters_2_ar_payload_addr < 32'h00020000));
    _zz_when_Axi4LiteCrossbar_l317_13[2] = ((32'h00020000 <= io_masters_2_ar_payload_addr) && (io_masters_2_ar_payload_addr < 32'h00030000));
    _zz_when_Axi4LiteCrossbar_l317_13[3] = ((32'h00030000 <= io_masters_2_ar_payload_addr) && (io_masters_2_ar_payload_addr < 32'h00040000));
  end

  always @(*) begin
    _zz_when_Axi4LiteCrossbar_l317_14[0] = ((32'h0 <= io_masters_3_ar_payload_addr) && (io_masters_3_ar_payload_addr < 32'h00010000));
    _zz_when_Axi4LiteCrossbar_l317_14[1] = ((32'h00010000 <= io_masters_3_ar_payload_addr) && (io_masters_3_ar_payload_addr < 32'h00020000));
    _zz_when_Axi4LiteCrossbar_l317_14[2] = ((32'h00020000 <= io_masters_3_ar_payload_addr) && (io_masters_3_ar_payload_addr < 32'h00030000));
    _zz_when_Axi4LiteCrossbar_l317_14[3] = ((32'h00030000 <= io_masters_3_ar_payload_addr) && (io_masters_3_ar_payload_addr < 32'h00040000));
  end

  assign _zz_when_Axi4LiteCrossbar_l152_14 = _zz_when_Axi4LiteCrossbar_l317_10;
  assign _zz_when_Axi4LiteCrossbar_l152_15 = (_zz_when_Axi4LiteCrossbar_l152_14 & (~ _zz__zz_when_Axi4LiteCrossbar_l152_15));
  always @(*) begin
    _zz_rdGranted_2 = 2'b00;
    if(when_Axi4LiteCrossbar_l152_28) begin
      _zz_rdGranted_2 = 2'b00;
    end
    if(when_Axi4LiteCrossbar_l152_29) begin
      _zz_rdGranted_2 = 2'b01;
    end
    if(when_Axi4LiteCrossbar_l152_30) begin
      _zz_rdGranted_2 = 2'b10;
    end
    if(when_Axi4LiteCrossbar_l152_31) begin
      _zz_rdGranted_2 = 2'b11;
    end
  end

  assign when_Axi4LiteCrossbar_l152_28 = _zz_when_Axi4LiteCrossbar_l152_15[0];
  assign when_Axi4LiteCrossbar_l152_29 = _zz_when_Axi4LiteCrossbar_l152_15[1];
  assign when_Axi4LiteCrossbar_l152_30 = _zz_when_Axi4LiteCrossbar_l152_15[2];
  assign when_Axi4LiteCrossbar_l152_31 = _zz_when_Axi4LiteCrossbar_l152_15[3];
  assign when_Axi4LiteCrossbar_l317_2 = (|_zz_when_Axi4LiteCrossbar_l317_10);
  assign when_Axi4LiteCrossbar_l320_8 = (_zz_rdGranted_2 == 2'b00);
  assign when_Axi4LiteCrossbar_l320_9 = (_zz_rdGranted_2 == 2'b01);
  assign when_Axi4LiteCrossbar_l320_10 = (_zz_rdGranted_2 == 2'b10);
  assign when_Axi4LiteCrossbar_l320_11 = (_zz_rdGranted_2 == 2'b11);
  assign io_slaves_2_ar_fire = (io_slaves_2_ar_valid && io_slaves_2_ar_ready);
  assign when_Axi4LiteCrossbar_l363_8 = (rdGranted_2 == 2'b00);
  assign when_Axi4LiteCrossbar_l363_9 = (rdGranted_2 == 2'b01);
  assign when_Axi4LiteCrossbar_l363_10 = (rdGranted_2 == 2'b10);
  assign when_Axi4LiteCrossbar_l363_11 = (rdGranted_2 == 2'b11);
  assign io_slaves_2_r_fire = (io_slaves_2_r_valid && io_slaves_2_r_ready);
  assign when_Axi4LiteCrossbar_l306_3 = (! rdActive_3);
  always @(*) begin
    _zz_when_Axi4LiteCrossbar_l317_16[0] = ((32'h0 <= io_masters_0_ar_payload_addr) && (io_masters_0_ar_payload_addr < 32'h00010000));
    _zz_when_Axi4LiteCrossbar_l317_16[1] = ((32'h00010000 <= io_masters_0_ar_payload_addr) && (io_masters_0_ar_payload_addr < 32'h00020000));
    _zz_when_Axi4LiteCrossbar_l317_16[2] = ((32'h00020000 <= io_masters_0_ar_payload_addr) && (io_masters_0_ar_payload_addr < 32'h00030000));
    _zz_when_Axi4LiteCrossbar_l317_16[3] = ((32'h00030000 <= io_masters_0_ar_payload_addr) && (io_masters_0_ar_payload_addr < 32'h00040000));
  end

  always @(*) begin
    _zz_when_Axi4LiteCrossbar_l317_15[0] = (io_masters_0_ar_valid && _zz__zz_when_Axi4LiteCrossbar_l317_15[3]);
    _zz_when_Axi4LiteCrossbar_l317_15[1] = (io_masters_1_ar_valid && _zz__zz_when_Axi4LiteCrossbar_l317_15_1[3]);
    _zz_when_Axi4LiteCrossbar_l317_15[2] = (io_masters_2_ar_valid && _zz__zz_when_Axi4LiteCrossbar_l317_15_2[3]);
    _zz_when_Axi4LiteCrossbar_l317_15[3] = (io_masters_3_ar_valid && _zz__zz_when_Axi4LiteCrossbar_l317_15_3[3]);
  end

  always @(*) begin
    _zz_when_Axi4LiteCrossbar_l317_17[0] = ((32'h0 <= io_masters_1_ar_payload_addr) && (io_masters_1_ar_payload_addr < 32'h00010000));
    _zz_when_Axi4LiteCrossbar_l317_17[1] = ((32'h00010000 <= io_masters_1_ar_payload_addr) && (io_masters_1_ar_payload_addr < 32'h00020000));
    _zz_when_Axi4LiteCrossbar_l317_17[2] = ((32'h00020000 <= io_masters_1_ar_payload_addr) && (io_masters_1_ar_payload_addr < 32'h00030000));
    _zz_when_Axi4LiteCrossbar_l317_17[3] = ((32'h00030000 <= io_masters_1_ar_payload_addr) && (io_masters_1_ar_payload_addr < 32'h00040000));
  end

  always @(*) begin
    _zz_when_Axi4LiteCrossbar_l317_18[0] = ((32'h0 <= io_masters_2_ar_payload_addr) && (io_masters_2_ar_payload_addr < 32'h00010000));
    _zz_when_Axi4LiteCrossbar_l317_18[1] = ((32'h00010000 <= io_masters_2_ar_payload_addr) && (io_masters_2_ar_payload_addr < 32'h00020000));
    _zz_when_Axi4LiteCrossbar_l317_18[2] = ((32'h00020000 <= io_masters_2_ar_payload_addr) && (io_masters_2_ar_payload_addr < 32'h00030000));
    _zz_when_Axi4LiteCrossbar_l317_18[3] = ((32'h00030000 <= io_masters_2_ar_payload_addr) && (io_masters_2_ar_payload_addr < 32'h00040000));
  end

  always @(*) begin
    _zz_when_Axi4LiteCrossbar_l317_19[0] = ((32'h0 <= io_masters_3_ar_payload_addr) && (io_masters_3_ar_payload_addr < 32'h00010000));
    _zz_when_Axi4LiteCrossbar_l317_19[1] = ((32'h00010000 <= io_masters_3_ar_payload_addr) && (io_masters_3_ar_payload_addr < 32'h00020000));
    _zz_when_Axi4LiteCrossbar_l317_19[2] = ((32'h00020000 <= io_masters_3_ar_payload_addr) && (io_masters_3_ar_payload_addr < 32'h00030000));
    _zz_when_Axi4LiteCrossbar_l317_19[3] = ((32'h00030000 <= io_masters_3_ar_payload_addr) && (io_masters_3_ar_payload_addr < 32'h00040000));
  end

  assign _zz_when_Axi4LiteCrossbar_l152_16 = _zz_when_Axi4LiteCrossbar_l317_15;
  assign _zz_when_Axi4LiteCrossbar_l152_17 = (_zz_when_Axi4LiteCrossbar_l152_16 & (~ _zz__zz_when_Axi4LiteCrossbar_l152_17));
  always @(*) begin
    _zz_rdGranted_3 = 2'b00;
    if(when_Axi4LiteCrossbar_l152_32) begin
      _zz_rdGranted_3 = 2'b00;
    end
    if(when_Axi4LiteCrossbar_l152_33) begin
      _zz_rdGranted_3 = 2'b01;
    end
    if(when_Axi4LiteCrossbar_l152_34) begin
      _zz_rdGranted_3 = 2'b10;
    end
    if(when_Axi4LiteCrossbar_l152_35) begin
      _zz_rdGranted_3 = 2'b11;
    end
  end

  assign when_Axi4LiteCrossbar_l152_32 = _zz_when_Axi4LiteCrossbar_l152_17[0];
  assign when_Axi4LiteCrossbar_l152_33 = _zz_when_Axi4LiteCrossbar_l152_17[1];
  assign when_Axi4LiteCrossbar_l152_34 = _zz_when_Axi4LiteCrossbar_l152_17[2];
  assign when_Axi4LiteCrossbar_l152_35 = _zz_when_Axi4LiteCrossbar_l152_17[3];
  assign when_Axi4LiteCrossbar_l317_3 = (|_zz_when_Axi4LiteCrossbar_l317_15);
  assign when_Axi4LiteCrossbar_l320_12 = (_zz_rdGranted_3 == 2'b00);
  assign when_Axi4LiteCrossbar_l320_13 = (_zz_rdGranted_3 == 2'b01);
  assign when_Axi4LiteCrossbar_l320_14 = (_zz_rdGranted_3 == 2'b10);
  assign when_Axi4LiteCrossbar_l320_15 = (_zz_rdGranted_3 == 2'b11);
  assign io_slaves_3_ar_fire = (io_slaves_3_ar_valid && io_slaves_3_ar_ready);
  assign when_Axi4LiteCrossbar_l363_12 = (rdGranted_3 == 2'b00);
  assign when_Axi4LiteCrossbar_l363_13 = (rdGranted_3 == 2'b01);
  assign when_Axi4LiteCrossbar_l363_14 = (rdGranted_3 == 2'b10);
  assign when_Axi4LiteCrossbar_l363_15 = (rdGranted_3 == 2'b11);
  assign io_slaves_3_r_fire = (io_slaves_3_r_valid && io_slaves_3_r_ready);
  assign when_Axi4LiteCrossbar_l306_4 = (! rdActive_4);
  always @(*) begin
    _zz_when_Axi4LiteCrossbar_l317_21[0] = ((32'h0 <= io_masters_0_ar_payload_addr) && (io_masters_0_ar_payload_addr < 32'h00010000));
    _zz_when_Axi4LiteCrossbar_l317_21[1] = ((32'h00010000 <= io_masters_0_ar_payload_addr) && (io_masters_0_ar_payload_addr < 32'h00020000));
    _zz_when_Axi4LiteCrossbar_l317_21[2] = ((32'h00020000 <= io_masters_0_ar_payload_addr) && (io_masters_0_ar_payload_addr < 32'h00030000));
    _zz_when_Axi4LiteCrossbar_l317_21[3] = ((32'h00030000 <= io_masters_0_ar_payload_addr) && (io_masters_0_ar_payload_addr < 32'h00040000));
  end

  always @(*) begin
    _zz_when_Axi4LiteCrossbar_l317_20[0] = (io_masters_0_ar_valid && _zz__zz_when_Axi4LiteCrossbar_l317_20[4]);
    _zz_when_Axi4LiteCrossbar_l317_20[1] = (io_masters_1_ar_valid && _zz__zz_when_Axi4LiteCrossbar_l317_20_1[4]);
    _zz_when_Axi4LiteCrossbar_l317_20[2] = (io_masters_2_ar_valid && _zz__zz_when_Axi4LiteCrossbar_l317_20_2[4]);
    _zz_when_Axi4LiteCrossbar_l317_20[3] = (io_masters_3_ar_valid && _zz__zz_when_Axi4LiteCrossbar_l317_20_3[4]);
  end

  always @(*) begin
    _zz_when_Axi4LiteCrossbar_l317_22[0] = ((32'h0 <= io_masters_1_ar_payload_addr) && (io_masters_1_ar_payload_addr < 32'h00010000));
    _zz_when_Axi4LiteCrossbar_l317_22[1] = ((32'h00010000 <= io_masters_1_ar_payload_addr) && (io_masters_1_ar_payload_addr < 32'h00020000));
    _zz_when_Axi4LiteCrossbar_l317_22[2] = ((32'h00020000 <= io_masters_1_ar_payload_addr) && (io_masters_1_ar_payload_addr < 32'h00030000));
    _zz_when_Axi4LiteCrossbar_l317_22[3] = ((32'h00030000 <= io_masters_1_ar_payload_addr) && (io_masters_1_ar_payload_addr < 32'h00040000));
  end

  always @(*) begin
    _zz_when_Axi4LiteCrossbar_l317_23[0] = ((32'h0 <= io_masters_2_ar_payload_addr) && (io_masters_2_ar_payload_addr < 32'h00010000));
    _zz_when_Axi4LiteCrossbar_l317_23[1] = ((32'h00010000 <= io_masters_2_ar_payload_addr) && (io_masters_2_ar_payload_addr < 32'h00020000));
    _zz_when_Axi4LiteCrossbar_l317_23[2] = ((32'h00020000 <= io_masters_2_ar_payload_addr) && (io_masters_2_ar_payload_addr < 32'h00030000));
    _zz_when_Axi4LiteCrossbar_l317_23[3] = ((32'h00030000 <= io_masters_2_ar_payload_addr) && (io_masters_2_ar_payload_addr < 32'h00040000));
  end

  always @(*) begin
    _zz_when_Axi4LiteCrossbar_l317_24[0] = ((32'h0 <= io_masters_3_ar_payload_addr) && (io_masters_3_ar_payload_addr < 32'h00010000));
    _zz_when_Axi4LiteCrossbar_l317_24[1] = ((32'h00010000 <= io_masters_3_ar_payload_addr) && (io_masters_3_ar_payload_addr < 32'h00020000));
    _zz_when_Axi4LiteCrossbar_l317_24[2] = ((32'h00020000 <= io_masters_3_ar_payload_addr) && (io_masters_3_ar_payload_addr < 32'h00030000));
    _zz_when_Axi4LiteCrossbar_l317_24[3] = ((32'h00030000 <= io_masters_3_ar_payload_addr) && (io_masters_3_ar_payload_addr < 32'h00040000));
  end

  assign _zz_when_Axi4LiteCrossbar_l152_18 = _zz_when_Axi4LiteCrossbar_l317_20;
  assign _zz_when_Axi4LiteCrossbar_l152_19 = (_zz_when_Axi4LiteCrossbar_l152_18 & (~ _zz__zz_when_Axi4LiteCrossbar_l152_19));
  always @(*) begin
    _zz_rdGranted_4 = 2'b00;
    if(when_Axi4LiteCrossbar_l152_36) begin
      _zz_rdGranted_4 = 2'b00;
    end
    if(when_Axi4LiteCrossbar_l152_37) begin
      _zz_rdGranted_4 = 2'b01;
    end
    if(when_Axi4LiteCrossbar_l152_38) begin
      _zz_rdGranted_4 = 2'b10;
    end
    if(when_Axi4LiteCrossbar_l152_39) begin
      _zz_rdGranted_4 = 2'b11;
    end
  end

  assign when_Axi4LiteCrossbar_l152_36 = _zz_when_Axi4LiteCrossbar_l152_19[0];
  assign when_Axi4LiteCrossbar_l152_37 = _zz_when_Axi4LiteCrossbar_l152_19[1];
  assign when_Axi4LiteCrossbar_l152_38 = _zz_when_Axi4LiteCrossbar_l152_19[2];
  assign when_Axi4LiteCrossbar_l152_39 = _zz_when_Axi4LiteCrossbar_l152_19[3];
  assign when_Axi4LiteCrossbar_l317_4 = (|_zz_when_Axi4LiteCrossbar_l317_20);
  assign when_Axi4LiteCrossbar_l320_16 = (_zz_rdGranted_4 == 2'b00);
  assign when_Axi4LiteCrossbar_l320_17 = (_zz_rdGranted_4 == 2'b01);
  assign when_Axi4LiteCrossbar_l320_18 = (_zz_rdGranted_4 == 2'b10);
  assign when_Axi4LiteCrossbar_l320_19 = (_zz_rdGranted_4 == 2'b11);
  assign decErr_io_axi_ar_fire = (decErr_io_axi_ar_valid && decErr_io_axi_ar_ready);
  assign when_Axi4LiteCrossbar_l363_16 = (rdGranted_4 == 2'b00);
  assign when_Axi4LiteCrossbar_l363_17 = (rdGranted_4 == 2'b01);
  assign when_Axi4LiteCrossbar_l363_18 = (rdGranted_4 == 2'b10);
  assign when_Axi4LiteCrossbar_l363_19 = (rdGranted_4 == 2'b11);
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
      if(when_Axi4LiteCrossbar_l217) begin
        if(when_Axi4LiteCrossbar_l229) begin
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
      if(when_Axi4LiteCrossbar_l217_1) begin
        if(when_Axi4LiteCrossbar_l229_1) begin
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
      if(when_Axi4LiteCrossbar_l217_2) begin
        if(when_Axi4LiteCrossbar_l229_2) begin
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
      if(when_Axi4LiteCrossbar_l217_3) begin
        if(when_Axi4LiteCrossbar_l229_3) begin
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
      if(when_Axi4LiteCrossbar_l217_4) begin
        if(when_Axi4LiteCrossbar_l229_4) begin
          if(decErr_io_axi_aw_fire) begin
            wrActive_4 <= 1'b1;
            wrGranted_4 <= _zz_wrGranted_4;
            wrRrPtr_4 <= (_zz_wrGranted_4 + 2'b01);
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
            rdRrPtr_0 <= (_zz_rdGranted_0 + 2'b01);
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
            rdRrPtr_1 <= (_zz_rdGranted_1 + 2'b01);
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
            rdRrPtr_2 <= (_zz_rdGranted_2 + 2'b01);
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
            rdRrPtr_3 <= (_zz_rdGranted_3 + 2'b01);
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
            rdRrPtr_4 <= (_zz_rdGranted_4 + 2'b01);
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
