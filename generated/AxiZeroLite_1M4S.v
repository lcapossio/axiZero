// Copyright (c) 2026 Leonardo Capossio - bard0 design  hello@bard0.com
// SPDX-License-Identifier: MIT
// Generator : SpinalHDL v1.14.2    git head : 78f29dc66110fc099a777992b6daa2f803ab445e
// Component : AxiZeroLiteTop
// Git hash  : 3e8059ccc21b9a6bda55f1f4b6741f370017686c

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
  wire       [4:0]    _zz__zz_when_Axi4LiteCrossbar_l285;
  wire       [0:0]    _zz__zz_when_Axi4LiteCrossbar_l285_1;
  wire       [0:0]    _zz__zz_when_Axi4LiteCrossbar_l285_2;
  wire       [0:0]    _zz__zz_when_Axi4LiteCrossbar_l285_3;
  wire       [0:0]    _zz__zz_when_Axi4LiteCrossbar_l285_4;
  wire       [0:0]    _zz_when_Axi4LiteCrossbar_l149_30;
  wire       [0:0]    _zz_when_Axi4LiteCrossbar_l149_31;
  wire       [0:0]    _zz_when_Axi4LiteCrossbar_l149_32;
  wire       [4:0]    _zz__zz_when_Axi4LiteCrossbar_l285_2_1;
  wire       [0:0]    _zz_when_Axi4LiteCrossbar_l149_1_1;
  wire       [0:0]    _zz_when_Axi4LiteCrossbar_l149_1_2;
  wire       [0:0]    _zz_when_Axi4LiteCrossbar_l149_1_3;
  wire       [4:0]    _zz__zz_when_Axi4LiteCrossbar_l285_4_1;
  wire       [0:0]    _zz_when_Axi4LiteCrossbar_l149_2_1;
  wire       [0:0]    _zz_when_Axi4LiteCrossbar_l149_2_2;
  wire       [0:0]    _zz_when_Axi4LiteCrossbar_l149_2_3;
  wire       [4:0]    _zz__zz_when_Axi4LiteCrossbar_l285_6;
  wire       [0:0]    _zz_when_Axi4LiteCrossbar_l149_3_1;
  wire       [0:0]    _zz_when_Axi4LiteCrossbar_l149_3_2;
  wire       [0:0]    _zz_when_Axi4LiteCrossbar_l149_3_3;
  wire       [4:0]    _zz__zz_when_Axi4LiteCrossbar_l285_8;
  wire       [0:0]    _zz_when_Axi4LiteCrossbar_l149_4_1;
  wire       [0:0]    _zz_when_Axi4LiteCrossbar_l149_4_2;
  wire       [0:0]    _zz_when_Axi4LiteCrossbar_l149_4_3;
  wire       [4:0]    _zz__zz_when_Axi4LiteCrossbar_l374;
  wire       [0:0]    _zz__zz_when_Axi4LiteCrossbar_l374_1;
  wire       [0:0]    _zz__zz_when_Axi4LiteCrossbar_l374_2;
  wire       [0:0]    _zz__zz_when_Axi4LiteCrossbar_l374_3;
  wire       [0:0]    _zz__zz_when_Axi4LiteCrossbar_l374_4;
  wire       [0:0]    _zz_when_Axi4LiteCrossbar_l149_5_1;
  wire       [0:0]    _zz_when_Axi4LiteCrossbar_l149_5_2;
  wire       [0:0]    _zz_when_Axi4LiteCrossbar_l149_5_3;
  wire       [4:0]    _zz__zz_when_Axi4LiteCrossbar_l374_2_1;
  wire       [0:0]    _zz_when_Axi4LiteCrossbar_l149_6_1;
  wire       [0:0]    _zz_when_Axi4LiteCrossbar_l149_6_2;
  wire       [0:0]    _zz_when_Axi4LiteCrossbar_l149_6_3;
  wire       [4:0]    _zz__zz_when_Axi4LiteCrossbar_l374_4_1;
  wire       [0:0]    _zz_when_Axi4LiteCrossbar_l149_7_1;
  wire       [0:0]    _zz_when_Axi4LiteCrossbar_l149_7_2;
  wire       [0:0]    _zz_when_Axi4LiteCrossbar_l149_7_3;
  wire       [4:0]    _zz__zz_when_Axi4LiteCrossbar_l374_6;
  wire       [0:0]    _zz_when_Axi4LiteCrossbar_l149_8_1;
  wire       [0:0]    _zz_when_Axi4LiteCrossbar_l149_8_2;
  wire       [0:0]    _zz_when_Axi4LiteCrossbar_l149_8_3;
  wire       [4:0]    _zz__zz_when_Axi4LiteCrossbar_l374_8;
  wire       [0:0]    _zz_when_Axi4LiteCrossbar_l149_9_1;
  wire       [0:0]    _zz_when_Axi4LiteCrossbar_l149_9_2;
  wire       [0:0]    _zz_when_Axi4LiteCrossbar_l149_9_3;
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
  wire                when_Axi4LiteCrossbar_l272;
  wire       [0:0]    _zz_when_Axi4LiteCrossbar_l285;
  reg        [3:0]    _zz_when_Axi4LiteCrossbar_l285_1;
  wire       [0:0]    _zz_when_Axi4LiteCrossbar_l149;
  wire       [0:0]    _zz_when_Axi4LiteCrossbar_l149_1;
  wire       [0:0]    _zz_when_Axi4LiteCrossbar_l149_2;
  reg        [0:0]    _zz_wrGranted_0;
  wire                when_Axi4LiteCrossbar_l149;
  reg                 grantLock;
  reg        [0:0]    grantLockIdx;
  wire       [0:0]    _zz_wrGranted_0_1;
  wire                when_Axi4LiteCrossbar_l184;
  wire                when_Axi4LiteCrossbar_l285;
  wire                when_Axi4LiteCrossbar_l289;
  wire                io_slaves_0_aw_fire;
  wire                when_Axi4LiteCrossbar_l341;
  wire                io_slaves_0_b_fire;
  wire                when_Axi4LiteCrossbar_l272_1;
  wire       [0:0]    _zz_when_Axi4LiteCrossbar_l285_2;
  reg        [3:0]    _zz_when_Axi4LiteCrossbar_l285_3;
  wire       [0:0]    _zz_when_Axi4LiteCrossbar_l149_3;
  wire       [0:0]    _zz_when_Axi4LiteCrossbar_l149_4;
  wire       [0:0]    _zz_when_Axi4LiteCrossbar_l149_5;
  reg        [0:0]    _zz_wrGranted_1;
  wire                when_Axi4LiteCrossbar_l149_1;
  reg                 grantLock_1;
  reg        [0:0]    grantLockIdx_1;
  wire       [0:0]    _zz_wrGranted_1_1;
  wire                when_Axi4LiteCrossbar_l184_1;
  wire                when_Axi4LiteCrossbar_l285_1;
  wire                when_Axi4LiteCrossbar_l289_1;
  wire                io_slaves_1_aw_fire;
  wire                when_Axi4LiteCrossbar_l341_1;
  wire                io_slaves_1_b_fire;
  wire                when_Axi4LiteCrossbar_l272_2;
  wire       [0:0]    _zz_when_Axi4LiteCrossbar_l285_4;
  reg        [3:0]    _zz_when_Axi4LiteCrossbar_l285_5;
  wire       [0:0]    _zz_when_Axi4LiteCrossbar_l149_6;
  wire       [0:0]    _zz_when_Axi4LiteCrossbar_l149_7;
  wire       [0:0]    _zz_when_Axi4LiteCrossbar_l149_8;
  reg        [0:0]    _zz_wrGranted_2;
  wire                when_Axi4LiteCrossbar_l149_2;
  reg                 grantLock_2;
  reg        [0:0]    grantLockIdx_2;
  wire       [0:0]    _zz_wrGranted_2_1;
  wire                when_Axi4LiteCrossbar_l184_2;
  wire                when_Axi4LiteCrossbar_l285_2;
  wire                when_Axi4LiteCrossbar_l289_2;
  wire                io_slaves_2_aw_fire;
  wire                when_Axi4LiteCrossbar_l341_2;
  wire                io_slaves_2_b_fire;
  wire                when_Axi4LiteCrossbar_l272_3;
  wire       [0:0]    _zz_when_Axi4LiteCrossbar_l285_6;
  reg        [3:0]    _zz_when_Axi4LiteCrossbar_l285_7;
  wire       [0:0]    _zz_when_Axi4LiteCrossbar_l149_9;
  wire       [0:0]    _zz_when_Axi4LiteCrossbar_l149_10;
  wire       [0:0]    _zz_when_Axi4LiteCrossbar_l149_11;
  reg        [0:0]    _zz_wrGranted_3;
  wire                when_Axi4LiteCrossbar_l149_3;
  reg                 grantLock_3;
  reg        [0:0]    grantLockIdx_3;
  wire       [0:0]    _zz_wrGranted_3_1;
  wire                when_Axi4LiteCrossbar_l184_3;
  wire                when_Axi4LiteCrossbar_l285_3;
  wire                when_Axi4LiteCrossbar_l289_3;
  wire                io_slaves_3_aw_fire;
  wire                when_Axi4LiteCrossbar_l341_3;
  wire                io_slaves_3_b_fire;
  wire                when_Axi4LiteCrossbar_l272_4;
  wire       [0:0]    _zz_when_Axi4LiteCrossbar_l285_8;
  reg        [3:0]    _zz_when_Axi4LiteCrossbar_l285_9;
  wire       [0:0]    _zz_when_Axi4LiteCrossbar_l149_12;
  wire       [0:0]    _zz_when_Axi4LiteCrossbar_l149_13;
  wire       [0:0]    _zz_when_Axi4LiteCrossbar_l149_14;
  reg        [0:0]    _zz_wrGranted_4;
  wire                when_Axi4LiteCrossbar_l149_4;
  reg                 grantLock_4;
  reg        [0:0]    grantLockIdx_4;
  wire       [0:0]    _zz_wrGranted_4_1;
  wire                when_Axi4LiteCrossbar_l184_4;
  wire                when_Axi4LiteCrossbar_l285_4;
  wire                when_Axi4LiteCrossbar_l289_4;
  wire                decErr_io_axi_aw_fire;
  wire                when_Axi4LiteCrossbar_l341_4;
  wire                decErr_io_axi_b_fire;
  wire                when_Axi4LiteCrossbar_l362;
  wire       [0:0]    _zz_when_Axi4LiteCrossbar_l374;
  reg        [3:0]    _zz_when_Axi4LiteCrossbar_l374_1;
  wire       [0:0]    _zz_when_Axi4LiteCrossbar_l149_15;
  wire       [0:0]    _zz_when_Axi4LiteCrossbar_l149_16;
  wire       [0:0]    _zz_when_Axi4LiteCrossbar_l149_17;
  reg        [0:0]    _zz_rdGranted_0;
  wire                when_Axi4LiteCrossbar_l149_5;
  reg                 grantLock_5;
  reg        [0:0]    grantLockIdx_5;
  wire       [0:0]    _zz_rdGranted_0_1;
  wire                when_Axi4LiteCrossbar_l184_5;
  wire                when_Axi4LiteCrossbar_l374;
  wire                when_Axi4LiteCrossbar_l377;
  wire                io_slaves_0_ar_fire;
  wire                when_Axi4LiteCrossbar_l420;
  wire                io_slaves_0_r_fire;
  wire                when_Axi4LiteCrossbar_l362_1;
  wire       [0:0]    _zz_when_Axi4LiteCrossbar_l374_2;
  reg        [3:0]    _zz_when_Axi4LiteCrossbar_l374_3;
  wire       [0:0]    _zz_when_Axi4LiteCrossbar_l149_18;
  wire       [0:0]    _zz_when_Axi4LiteCrossbar_l149_19;
  wire       [0:0]    _zz_when_Axi4LiteCrossbar_l149_20;
  reg        [0:0]    _zz_rdGranted_1;
  wire                when_Axi4LiteCrossbar_l149_6;
  reg                 grantLock_6;
  reg        [0:0]    grantLockIdx_6;
  wire       [0:0]    _zz_rdGranted_1_1;
  wire                when_Axi4LiteCrossbar_l184_6;
  wire                when_Axi4LiteCrossbar_l374_1;
  wire                when_Axi4LiteCrossbar_l377_1;
  wire                io_slaves_1_ar_fire;
  wire                when_Axi4LiteCrossbar_l420_1;
  wire                io_slaves_1_r_fire;
  wire                when_Axi4LiteCrossbar_l362_2;
  wire       [0:0]    _zz_when_Axi4LiteCrossbar_l374_4;
  reg        [3:0]    _zz_when_Axi4LiteCrossbar_l374_5;
  wire       [0:0]    _zz_when_Axi4LiteCrossbar_l149_21;
  wire       [0:0]    _zz_when_Axi4LiteCrossbar_l149_22;
  wire       [0:0]    _zz_when_Axi4LiteCrossbar_l149_23;
  reg        [0:0]    _zz_rdGranted_2;
  wire                when_Axi4LiteCrossbar_l149_7;
  reg                 grantLock_7;
  reg        [0:0]    grantLockIdx_7;
  wire       [0:0]    _zz_rdGranted_2_1;
  wire                when_Axi4LiteCrossbar_l184_7;
  wire                when_Axi4LiteCrossbar_l374_2;
  wire                when_Axi4LiteCrossbar_l377_2;
  wire                io_slaves_2_ar_fire;
  wire                when_Axi4LiteCrossbar_l420_2;
  wire                io_slaves_2_r_fire;
  wire                when_Axi4LiteCrossbar_l362_3;
  wire       [0:0]    _zz_when_Axi4LiteCrossbar_l374_6;
  reg        [3:0]    _zz_when_Axi4LiteCrossbar_l374_7;
  wire       [0:0]    _zz_when_Axi4LiteCrossbar_l149_24;
  wire       [0:0]    _zz_when_Axi4LiteCrossbar_l149_25;
  wire       [0:0]    _zz_when_Axi4LiteCrossbar_l149_26;
  reg        [0:0]    _zz_rdGranted_3;
  wire                when_Axi4LiteCrossbar_l149_8;
  reg                 grantLock_8;
  reg        [0:0]    grantLockIdx_8;
  wire       [0:0]    _zz_rdGranted_3_1;
  wire                when_Axi4LiteCrossbar_l184_8;
  wire                when_Axi4LiteCrossbar_l374_3;
  wire                when_Axi4LiteCrossbar_l377_3;
  wire                io_slaves_3_ar_fire;
  wire                when_Axi4LiteCrossbar_l420_3;
  wire                io_slaves_3_r_fire;
  wire                when_Axi4LiteCrossbar_l362_4;
  wire       [0:0]    _zz_when_Axi4LiteCrossbar_l374_8;
  reg        [3:0]    _zz_when_Axi4LiteCrossbar_l374_9;
  wire       [0:0]    _zz_when_Axi4LiteCrossbar_l149_27;
  wire       [0:0]    _zz_when_Axi4LiteCrossbar_l149_28;
  wire       [0:0]    _zz_when_Axi4LiteCrossbar_l149_29;
  reg        [0:0]    _zz_rdGranted_4;
  wire                when_Axi4LiteCrossbar_l149_9;
  reg                 grantLock_9;
  reg        [0:0]    grantLockIdx_9;
  wire       [0:0]    _zz_rdGranted_4_1;
  wire                when_Axi4LiteCrossbar_l184_9;
  wire                when_Axi4LiteCrossbar_l374_4;
  wire                when_Axi4LiteCrossbar_l377_4;
  wire                decErr_io_axi_ar_fire;
  wire                when_Axi4LiteCrossbar_l420_4;
  wire                decErr_io_axi_r_fire;

  assign _zz_io_masters_0_b_payload_resp = 2'b00;
  assign _zz__zz_when_Axi4LiteCrossbar_l285 = {(! (|_zz_when_Axi4LiteCrossbar_l285_1)),_zz_when_Axi4LiteCrossbar_l285_1};
  assign _zz_when_Axi4LiteCrossbar_l149_30 = ((|_zz_when_Axi4LiteCrossbar_l149) ? (_zz_when_Axi4LiteCrossbar_l149_1 & (~ _zz_when_Axi4LiteCrossbar_l149_31)) : (_zz_when_Axi4LiteCrossbar_l149_2 & (~ _zz_when_Axi4LiteCrossbar_l149_32)));
  assign _zz_when_Axi4LiteCrossbar_l149_31 = (_zz_when_Axi4LiteCrossbar_l149_1 - 1'b1);
  assign _zz_when_Axi4LiteCrossbar_l149_32 = (_zz_when_Axi4LiteCrossbar_l149_2 - 1'b1);
  assign _zz__zz_when_Axi4LiteCrossbar_l285_2_1 = {(! (|_zz_when_Axi4LiteCrossbar_l285_3)),_zz_when_Axi4LiteCrossbar_l285_3};
  assign _zz_when_Axi4LiteCrossbar_l149_1_1 = ((|_zz_when_Axi4LiteCrossbar_l149_3) ? (_zz_when_Axi4LiteCrossbar_l149_4 & (~ _zz_when_Axi4LiteCrossbar_l149_1_2)) : (_zz_when_Axi4LiteCrossbar_l149_5 & (~ _zz_when_Axi4LiteCrossbar_l149_1_3)));
  assign _zz_when_Axi4LiteCrossbar_l149_1_2 = (_zz_when_Axi4LiteCrossbar_l149_4 - 1'b1);
  assign _zz_when_Axi4LiteCrossbar_l149_1_3 = (_zz_when_Axi4LiteCrossbar_l149_5 - 1'b1);
  assign _zz__zz_when_Axi4LiteCrossbar_l285_4_1 = {(! (|_zz_when_Axi4LiteCrossbar_l285_5)),_zz_when_Axi4LiteCrossbar_l285_5};
  assign _zz_when_Axi4LiteCrossbar_l149_2_1 = ((|_zz_when_Axi4LiteCrossbar_l149_6) ? (_zz_when_Axi4LiteCrossbar_l149_7 & (~ _zz_when_Axi4LiteCrossbar_l149_2_2)) : (_zz_when_Axi4LiteCrossbar_l149_8 & (~ _zz_when_Axi4LiteCrossbar_l149_2_3)));
  assign _zz_when_Axi4LiteCrossbar_l149_2_2 = (_zz_when_Axi4LiteCrossbar_l149_7 - 1'b1);
  assign _zz_when_Axi4LiteCrossbar_l149_2_3 = (_zz_when_Axi4LiteCrossbar_l149_8 - 1'b1);
  assign _zz__zz_when_Axi4LiteCrossbar_l285_6 = {(! (|_zz_when_Axi4LiteCrossbar_l285_7)),_zz_when_Axi4LiteCrossbar_l285_7};
  assign _zz_when_Axi4LiteCrossbar_l149_3_1 = ((|_zz_when_Axi4LiteCrossbar_l149_9) ? (_zz_when_Axi4LiteCrossbar_l149_10 & (~ _zz_when_Axi4LiteCrossbar_l149_3_2)) : (_zz_when_Axi4LiteCrossbar_l149_11 & (~ _zz_when_Axi4LiteCrossbar_l149_3_3)));
  assign _zz_when_Axi4LiteCrossbar_l149_3_2 = (_zz_when_Axi4LiteCrossbar_l149_10 - 1'b1);
  assign _zz_when_Axi4LiteCrossbar_l149_3_3 = (_zz_when_Axi4LiteCrossbar_l149_11 - 1'b1);
  assign _zz__zz_when_Axi4LiteCrossbar_l285_8 = {(! (|_zz_when_Axi4LiteCrossbar_l285_9)),_zz_when_Axi4LiteCrossbar_l285_9};
  assign _zz_when_Axi4LiteCrossbar_l149_4_1 = ((|_zz_when_Axi4LiteCrossbar_l149_12) ? (_zz_when_Axi4LiteCrossbar_l149_13 & (~ _zz_when_Axi4LiteCrossbar_l149_4_2)) : (_zz_when_Axi4LiteCrossbar_l149_14 & (~ _zz_when_Axi4LiteCrossbar_l149_4_3)));
  assign _zz_when_Axi4LiteCrossbar_l149_4_2 = (_zz_when_Axi4LiteCrossbar_l149_13 - 1'b1);
  assign _zz_when_Axi4LiteCrossbar_l149_4_3 = (_zz_when_Axi4LiteCrossbar_l149_14 - 1'b1);
  assign _zz__zz_when_Axi4LiteCrossbar_l374 = {(! (|_zz_when_Axi4LiteCrossbar_l374_1)),_zz_when_Axi4LiteCrossbar_l374_1};
  assign _zz_when_Axi4LiteCrossbar_l149_5_1 = ((|_zz_when_Axi4LiteCrossbar_l149_15) ? (_zz_when_Axi4LiteCrossbar_l149_16 & (~ _zz_when_Axi4LiteCrossbar_l149_5_2)) : (_zz_when_Axi4LiteCrossbar_l149_17 & (~ _zz_when_Axi4LiteCrossbar_l149_5_3)));
  assign _zz_when_Axi4LiteCrossbar_l149_5_2 = (_zz_when_Axi4LiteCrossbar_l149_16 - 1'b1);
  assign _zz_when_Axi4LiteCrossbar_l149_5_3 = (_zz_when_Axi4LiteCrossbar_l149_17 - 1'b1);
  assign _zz__zz_when_Axi4LiteCrossbar_l374_2_1 = {(! (|_zz_when_Axi4LiteCrossbar_l374_3)),_zz_when_Axi4LiteCrossbar_l374_3};
  assign _zz_when_Axi4LiteCrossbar_l149_6_1 = ((|_zz_when_Axi4LiteCrossbar_l149_18) ? (_zz_when_Axi4LiteCrossbar_l149_19 & (~ _zz_when_Axi4LiteCrossbar_l149_6_2)) : (_zz_when_Axi4LiteCrossbar_l149_20 & (~ _zz_when_Axi4LiteCrossbar_l149_6_3)));
  assign _zz_when_Axi4LiteCrossbar_l149_6_2 = (_zz_when_Axi4LiteCrossbar_l149_19 - 1'b1);
  assign _zz_when_Axi4LiteCrossbar_l149_6_3 = (_zz_when_Axi4LiteCrossbar_l149_20 - 1'b1);
  assign _zz__zz_when_Axi4LiteCrossbar_l374_4_1 = {(! (|_zz_when_Axi4LiteCrossbar_l374_5)),_zz_when_Axi4LiteCrossbar_l374_5};
  assign _zz_when_Axi4LiteCrossbar_l149_7_1 = ((|_zz_when_Axi4LiteCrossbar_l149_21) ? (_zz_when_Axi4LiteCrossbar_l149_22 & (~ _zz_when_Axi4LiteCrossbar_l149_7_2)) : (_zz_when_Axi4LiteCrossbar_l149_23 & (~ _zz_when_Axi4LiteCrossbar_l149_7_3)));
  assign _zz_when_Axi4LiteCrossbar_l149_7_2 = (_zz_when_Axi4LiteCrossbar_l149_22 - 1'b1);
  assign _zz_when_Axi4LiteCrossbar_l149_7_3 = (_zz_when_Axi4LiteCrossbar_l149_23 - 1'b1);
  assign _zz__zz_when_Axi4LiteCrossbar_l374_6 = {(! (|_zz_when_Axi4LiteCrossbar_l374_7)),_zz_when_Axi4LiteCrossbar_l374_7};
  assign _zz_when_Axi4LiteCrossbar_l149_8_1 = ((|_zz_when_Axi4LiteCrossbar_l149_24) ? (_zz_when_Axi4LiteCrossbar_l149_25 & (~ _zz_when_Axi4LiteCrossbar_l149_8_2)) : (_zz_when_Axi4LiteCrossbar_l149_26 & (~ _zz_when_Axi4LiteCrossbar_l149_8_3)));
  assign _zz_when_Axi4LiteCrossbar_l149_8_2 = (_zz_when_Axi4LiteCrossbar_l149_25 - 1'b1);
  assign _zz_when_Axi4LiteCrossbar_l149_8_3 = (_zz_when_Axi4LiteCrossbar_l149_26 - 1'b1);
  assign _zz__zz_when_Axi4LiteCrossbar_l374_8 = {(! (|_zz_when_Axi4LiteCrossbar_l374_9)),_zz_when_Axi4LiteCrossbar_l374_9};
  assign _zz_when_Axi4LiteCrossbar_l149_9_1 = ((|_zz_when_Axi4LiteCrossbar_l149_27) ? (_zz_when_Axi4LiteCrossbar_l149_28 & (~ _zz_when_Axi4LiteCrossbar_l149_9_2)) : (_zz_when_Axi4LiteCrossbar_l149_29 & (~ _zz_when_Axi4LiteCrossbar_l149_9_3)));
  assign _zz_when_Axi4LiteCrossbar_l149_9_2 = (_zz_when_Axi4LiteCrossbar_l149_28 - 1'b1);
  assign _zz_when_Axi4LiteCrossbar_l149_9_3 = (_zz_when_Axi4LiteCrossbar_l149_29 - 1'b1);
  assign _zz__zz_when_Axi4LiteCrossbar_l285_1 = 1'b0;
  assign _zz__zz_when_Axi4LiteCrossbar_l285_2 = 1'b0;
  assign _zz__zz_when_Axi4LiteCrossbar_l285_3 = 1'b0;
  assign _zz__zz_when_Axi4LiteCrossbar_l285_4 = 1'b0;
  assign _zz__zz_when_Axi4LiteCrossbar_l374_1 = 1'b0;
  assign _zz__zz_when_Axi4LiteCrossbar_l374_2 = 1'b0;
  assign _zz__zz_when_Axi4LiteCrossbar_l374_3 = 1'b0;
  assign _zz__zz_when_Axi4LiteCrossbar_l374_4 = 1'b0;
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
    if(when_Axi4LiteCrossbar_l272) begin
      if(when_Axi4LiteCrossbar_l285) begin
        if(when_Axi4LiteCrossbar_l289) begin
          io_masters_0_aw_ready = io_slaves_0_aw_ready;
        end
      end
    end
    if(when_Axi4LiteCrossbar_l272_1) begin
      if(when_Axi4LiteCrossbar_l285_1) begin
        if(when_Axi4LiteCrossbar_l289_1) begin
          io_masters_0_aw_ready = io_slaves_1_aw_ready;
        end
      end
    end
    if(when_Axi4LiteCrossbar_l272_2) begin
      if(when_Axi4LiteCrossbar_l285_2) begin
        if(when_Axi4LiteCrossbar_l289_2) begin
          io_masters_0_aw_ready = io_slaves_2_aw_ready;
        end
      end
    end
    if(when_Axi4LiteCrossbar_l272_3) begin
      if(when_Axi4LiteCrossbar_l285_3) begin
        if(when_Axi4LiteCrossbar_l289_3) begin
          io_masters_0_aw_ready = io_slaves_3_aw_ready;
        end
      end
    end
    if(when_Axi4LiteCrossbar_l272_4) begin
      if(when_Axi4LiteCrossbar_l285_4) begin
        if(when_Axi4LiteCrossbar_l289_4) begin
          io_masters_0_aw_ready = decErr_io_axi_aw_ready;
        end
      end
    end
  end

  always @(*) begin
    io_masters_0_w_ready = 1'b0;
    if(when_Axi4LiteCrossbar_l272) begin
      if(when_Axi4LiteCrossbar_l285) begin
        if(when_Axi4LiteCrossbar_l289) begin
          io_masters_0_w_ready = io_slaves_0_w_ready;
        end
      end
    end else begin
      if(when_Axi4LiteCrossbar_l341) begin
        io_masters_0_w_ready = io_slaves_0_w_ready;
      end
    end
    if(when_Axi4LiteCrossbar_l272_1) begin
      if(when_Axi4LiteCrossbar_l285_1) begin
        if(when_Axi4LiteCrossbar_l289_1) begin
          io_masters_0_w_ready = io_slaves_1_w_ready;
        end
      end
    end else begin
      if(when_Axi4LiteCrossbar_l341_1) begin
        io_masters_0_w_ready = io_slaves_1_w_ready;
      end
    end
    if(when_Axi4LiteCrossbar_l272_2) begin
      if(when_Axi4LiteCrossbar_l285_2) begin
        if(when_Axi4LiteCrossbar_l289_2) begin
          io_masters_0_w_ready = io_slaves_2_w_ready;
        end
      end
    end else begin
      if(when_Axi4LiteCrossbar_l341_2) begin
        io_masters_0_w_ready = io_slaves_2_w_ready;
      end
    end
    if(when_Axi4LiteCrossbar_l272_3) begin
      if(when_Axi4LiteCrossbar_l285_3) begin
        if(when_Axi4LiteCrossbar_l289_3) begin
          io_masters_0_w_ready = io_slaves_3_w_ready;
        end
      end
    end else begin
      if(when_Axi4LiteCrossbar_l341_3) begin
        io_masters_0_w_ready = io_slaves_3_w_ready;
      end
    end
    if(when_Axi4LiteCrossbar_l272_4) begin
      if(when_Axi4LiteCrossbar_l285_4) begin
        if(when_Axi4LiteCrossbar_l289_4) begin
          io_masters_0_w_ready = decErr_io_axi_w_ready;
        end
      end
    end else begin
      if(when_Axi4LiteCrossbar_l341_4) begin
        io_masters_0_w_ready = decErr_io_axi_w_ready;
      end
    end
  end

  always @(*) begin
    io_masters_0_b_valid = 1'b0;
    if(!when_Axi4LiteCrossbar_l272) begin
      if(when_Axi4LiteCrossbar_l341) begin
        io_masters_0_b_valid = io_slaves_0_b_valid;
      end
    end
    if(!when_Axi4LiteCrossbar_l272_1) begin
      if(when_Axi4LiteCrossbar_l341_1) begin
        io_masters_0_b_valid = io_slaves_1_b_valid;
      end
    end
    if(!when_Axi4LiteCrossbar_l272_2) begin
      if(when_Axi4LiteCrossbar_l341_2) begin
        io_masters_0_b_valid = io_slaves_2_b_valid;
      end
    end
    if(!when_Axi4LiteCrossbar_l272_3) begin
      if(when_Axi4LiteCrossbar_l341_3) begin
        io_masters_0_b_valid = io_slaves_3_b_valid;
      end
    end
    if(!when_Axi4LiteCrossbar_l272_4) begin
      if(when_Axi4LiteCrossbar_l341_4) begin
        io_masters_0_b_valid = decErr_io_axi_b_valid;
      end
    end
  end

  always @(*) begin
    io_masters_0_b_payload_resp = _zz_io_masters_0_b_payload_resp[1 : 0];
    if(!when_Axi4LiteCrossbar_l272) begin
      if(when_Axi4LiteCrossbar_l341) begin
        io_masters_0_b_payload_resp = io_slaves_0_b_payload_resp;
      end
    end
    if(!when_Axi4LiteCrossbar_l272_1) begin
      if(when_Axi4LiteCrossbar_l341_1) begin
        io_masters_0_b_payload_resp = io_slaves_1_b_payload_resp;
      end
    end
    if(!when_Axi4LiteCrossbar_l272_2) begin
      if(when_Axi4LiteCrossbar_l341_2) begin
        io_masters_0_b_payload_resp = io_slaves_2_b_payload_resp;
      end
    end
    if(!when_Axi4LiteCrossbar_l272_3) begin
      if(when_Axi4LiteCrossbar_l341_3) begin
        io_masters_0_b_payload_resp = io_slaves_3_b_payload_resp;
      end
    end
    if(!when_Axi4LiteCrossbar_l272_4) begin
      if(when_Axi4LiteCrossbar_l341_4) begin
        io_masters_0_b_payload_resp = decErr_io_axi_b_payload_resp;
      end
    end
  end

  always @(*) begin
    io_masters_0_ar_ready = 1'b0;
    if(when_Axi4LiteCrossbar_l362) begin
      if(when_Axi4LiteCrossbar_l374) begin
        if(when_Axi4LiteCrossbar_l377) begin
          io_masters_0_ar_ready = io_slaves_0_ar_ready;
        end
      end
    end
    if(when_Axi4LiteCrossbar_l362_1) begin
      if(when_Axi4LiteCrossbar_l374_1) begin
        if(when_Axi4LiteCrossbar_l377_1) begin
          io_masters_0_ar_ready = io_slaves_1_ar_ready;
        end
      end
    end
    if(when_Axi4LiteCrossbar_l362_2) begin
      if(when_Axi4LiteCrossbar_l374_2) begin
        if(when_Axi4LiteCrossbar_l377_2) begin
          io_masters_0_ar_ready = io_slaves_2_ar_ready;
        end
      end
    end
    if(when_Axi4LiteCrossbar_l362_3) begin
      if(when_Axi4LiteCrossbar_l374_3) begin
        if(when_Axi4LiteCrossbar_l377_3) begin
          io_masters_0_ar_ready = io_slaves_3_ar_ready;
        end
      end
    end
    if(when_Axi4LiteCrossbar_l362_4) begin
      if(when_Axi4LiteCrossbar_l374_4) begin
        if(when_Axi4LiteCrossbar_l377_4) begin
          io_masters_0_ar_ready = decErr_io_axi_ar_ready;
        end
      end
    end
  end

  always @(*) begin
    io_masters_0_r_valid = 1'b0;
    if(!when_Axi4LiteCrossbar_l362) begin
      if(when_Axi4LiteCrossbar_l420) begin
        io_masters_0_r_valid = io_slaves_0_r_valid;
      end
    end
    if(!when_Axi4LiteCrossbar_l362_1) begin
      if(when_Axi4LiteCrossbar_l420_1) begin
        io_masters_0_r_valid = io_slaves_1_r_valid;
      end
    end
    if(!when_Axi4LiteCrossbar_l362_2) begin
      if(when_Axi4LiteCrossbar_l420_2) begin
        io_masters_0_r_valid = io_slaves_2_r_valid;
      end
    end
    if(!when_Axi4LiteCrossbar_l362_3) begin
      if(when_Axi4LiteCrossbar_l420_3) begin
        io_masters_0_r_valid = io_slaves_3_r_valid;
      end
    end
    if(!when_Axi4LiteCrossbar_l362_4) begin
      if(when_Axi4LiteCrossbar_l420_4) begin
        io_masters_0_r_valid = decErr_io_axi_r_valid;
      end
    end
  end

  assign _zz_io_masters_0_r_payload_data = 34'h0;
  always @(*) begin
    io_masters_0_r_payload_data = _zz_io_masters_0_r_payload_data[31 : 0];
    if(!when_Axi4LiteCrossbar_l362) begin
      if(when_Axi4LiteCrossbar_l420) begin
        io_masters_0_r_payload_data = io_slaves_0_r_payload_data;
      end
    end
    if(!when_Axi4LiteCrossbar_l362_1) begin
      if(when_Axi4LiteCrossbar_l420_1) begin
        io_masters_0_r_payload_data = io_slaves_1_r_payload_data;
      end
    end
    if(!when_Axi4LiteCrossbar_l362_2) begin
      if(when_Axi4LiteCrossbar_l420_2) begin
        io_masters_0_r_payload_data = io_slaves_2_r_payload_data;
      end
    end
    if(!when_Axi4LiteCrossbar_l362_3) begin
      if(when_Axi4LiteCrossbar_l420_3) begin
        io_masters_0_r_payload_data = io_slaves_3_r_payload_data;
      end
    end
    if(!when_Axi4LiteCrossbar_l362_4) begin
      if(when_Axi4LiteCrossbar_l420_4) begin
        io_masters_0_r_payload_data = decErr_io_axi_r_payload_data;
      end
    end
  end

  always @(*) begin
    io_masters_0_r_payload_resp = _zz_io_masters_0_r_payload_data[33 : 32];
    if(!when_Axi4LiteCrossbar_l362) begin
      if(when_Axi4LiteCrossbar_l420) begin
        io_masters_0_r_payload_resp = io_slaves_0_r_payload_resp;
      end
    end
    if(!when_Axi4LiteCrossbar_l362_1) begin
      if(when_Axi4LiteCrossbar_l420_1) begin
        io_masters_0_r_payload_resp = io_slaves_1_r_payload_resp;
      end
    end
    if(!when_Axi4LiteCrossbar_l362_2) begin
      if(when_Axi4LiteCrossbar_l420_2) begin
        io_masters_0_r_payload_resp = io_slaves_2_r_payload_resp;
      end
    end
    if(!when_Axi4LiteCrossbar_l362_3) begin
      if(when_Axi4LiteCrossbar_l420_3) begin
        io_masters_0_r_payload_resp = io_slaves_3_r_payload_resp;
      end
    end
    if(!when_Axi4LiteCrossbar_l362_4) begin
      if(when_Axi4LiteCrossbar_l420_4) begin
        io_masters_0_r_payload_resp = decErr_io_axi_r_payload_resp;
      end
    end
  end

  always @(*) begin
    io_slaves_0_aw_valid = 1'b0;
    if(when_Axi4LiteCrossbar_l272) begin
      if(when_Axi4LiteCrossbar_l285) begin
        io_slaves_0_aw_valid = 1'b1;
      end
    end
  end

  assign _zz_io_slaves_0_aw_payload_addr = 35'h0;
  always @(*) begin
    io_slaves_0_aw_payload_addr = _zz_io_slaves_0_aw_payload_addr[31 : 0];
    if(when_Axi4LiteCrossbar_l272) begin
      if(when_Axi4LiteCrossbar_l285) begin
        if(when_Axi4LiteCrossbar_l289) begin
          io_slaves_0_aw_payload_addr = io_masters_0_aw_payload_addr;
        end
      end
    end
  end

  always @(*) begin
    io_slaves_0_aw_payload_prot = _zz_io_slaves_0_aw_payload_addr[34 : 32];
    if(when_Axi4LiteCrossbar_l272) begin
      if(when_Axi4LiteCrossbar_l285) begin
        if(when_Axi4LiteCrossbar_l289) begin
          io_slaves_0_aw_payload_prot = io_masters_0_aw_payload_prot;
        end
      end
    end
  end

  always @(*) begin
    io_slaves_0_w_valid = 1'b0;
    if(when_Axi4LiteCrossbar_l272) begin
      if(when_Axi4LiteCrossbar_l285) begin
        if(when_Axi4LiteCrossbar_l289) begin
          io_slaves_0_w_valid = io_masters_0_w_valid;
        end
      end
    end else begin
      if(when_Axi4LiteCrossbar_l341) begin
        io_slaves_0_w_valid = io_masters_0_w_valid;
      end
    end
  end

  assign _zz_io_slaves_0_w_payload_data = 36'h0;
  always @(*) begin
    io_slaves_0_w_payload_data = _zz_io_slaves_0_w_payload_data[31 : 0];
    if(when_Axi4LiteCrossbar_l272) begin
      if(when_Axi4LiteCrossbar_l285) begin
        if(when_Axi4LiteCrossbar_l289) begin
          io_slaves_0_w_payload_data = io_masters_0_w_payload_data;
        end
      end
    end else begin
      if(when_Axi4LiteCrossbar_l341) begin
        io_slaves_0_w_payload_data = io_masters_0_w_payload_data;
      end
    end
  end

  always @(*) begin
    io_slaves_0_w_payload_strb = _zz_io_slaves_0_w_payload_data[35 : 32];
    if(when_Axi4LiteCrossbar_l272) begin
      if(when_Axi4LiteCrossbar_l285) begin
        if(when_Axi4LiteCrossbar_l289) begin
          io_slaves_0_w_payload_strb = io_masters_0_w_payload_strb;
        end
      end
    end else begin
      if(when_Axi4LiteCrossbar_l341) begin
        io_slaves_0_w_payload_strb = io_masters_0_w_payload_strb;
      end
    end
  end

  always @(*) begin
    io_slaves_0_b_ready = 1'b0;
    if(!when_Axi4LiteCrossbar_l272) begin
      if(when_Axi4LiteCrossbar_l341) begin
        io_slaves_0_b_ready = io_masters_0_b_ready;
      end
    end
  end

  always @(*) begin
    io_slaves_0_ar_valid = 1'b0;
    if(when_Axi4LiteCrossbar_l362) begin
      if(when_Axi4LiteCrossbar_l374) begin
        io_slaves_0_ar_valid = 1'b1;
      end
    end
  end

  assign _zz_io_slaves_0_ar_payload_addr = 35'h0;
  always @(*) begin
    io_slaves_0_ar_payload_addr = _zz_io_slaves_0_ar_payload_addr[31 : 0];
    if(when_Axi4LiteCrossbar_l362) begin
      if(when_Axi4LiteCrossbar_l374) begin
        if(when_Axi4LiteCrossbar_l377) begin
          io_slaves_0_ar_payload_addr = io_masters_0_ar_payload_addr;
        end
      end
    end
  end

  always @(*) begin
    io_slaves_0_ar_payload_prot = _zz_io_slaves_0_ar_payload_addr[34 : 32];
    if(when_Axi4LiteCrossbar_l362) begin
      if(when_Axi4LiteCrossbar_l374) begin
        if(when_Axi4LiteCrossbar_l377) begin
          io_slaves_0_ar_payload_prot = io_masters_0_ar_payload_prot;
        end
      end
    end
  end

  always @(*) begin
    io_slaves_0_r_ready = 1'b0;
    if(!when_Axi4LiteCrossbar_l362) begin
      if(when_Axi4LiteCrossbar_l420) begin
        io_slaves_0_r_ready = io_masters_0_r_ready;
      end
    end
  end

  always @(*) begin
    io_slaves_1_aw_valid = 1'b0;
    if(when_Axi4LiteCrossbar_l272_1) begin
      if(when_Axi4LiteCrossbar_l285_1) begin
        io_slaves_1_aw_valid = 1'b1;
      end
    end
  end

  assign _zz_io_slaves_1_aw_payload_addr = 35'h0;
  always @(*) begin
    io_slaves_1_aw_payload_addr = _zz_io_slaves_1_aw_payload_addr[31 : 0];
    if(when_Axi4LiteCrossbar_l272_1) begin
      if(when_Axi4LiteCrossbar_l285_1) begin
        if(when_Axi4LiteCrossbar_l289_1) begin
          io_slaves_1_aw_payload_addr = io_masters_0_aw_payload_addr;
        end
      end
    end
  end

  always @(*) begin
    io_slaves_1_aw_payload_prot = _zz_io_slaves_1_aw_payload_addr[34 : 32];
    if(when_Axi4LiteCrossbar_l272_1) begin
      if(when_Axi4LiteCrossbar_l285_1) begin
        if(when_Axi4LiteCrossbar_l289_1) begin
          io_slaves_1_aw_payload_prot = io_masters_0_aw_payload_prot;
        end
      end
    end
  end

  always @(*) begin
    io_slaves_1_w_valid = 1'b0;
    if(when_Axi4LiteCrossbar_l272_1) begin
      if(when_Axi4LiteCrossbar_l285_1) begin
        if(when_Axi4LiteCrossbar_l289_1) begin
          io_slaves_1_w_valid = io_masters_0_w_valid;
        end
      end
    end else begin
      if(when_Axi4LiteCrossbar_l341_1) begin
        io_slaves_1_w_valid = io_masters_0_w_valid;
      end
    end
  end

  assign _zz_io_slaves_1_w_payload_data = 36'h0;
  always @(*) begin
    io_slaves_1_w_payload_data = _zz_io_slaves_1_w_payload_data[31 : 0];
    if(when_Axi4LiteCrossbar_l272_1) begin
      if(when_Axi4LiteCrossbar_l285_1) begin
        if(when_Axi4LiteCrossbar_l289_1) begin
          io_slaves_1_w_payload_data = io_masters_0_w_payload_data;
        end
      end
    end else begin
      if(when_Axi4LiteCrossbar_l341_1) begin
        io_slaves_1_w_payload_data = io_masters_0_w_payload_data;
      end
    end
  end

  always @(*) begin
    io_slaves_1_w_payload_strb = _zz_io_slaves_1_w_payload_data[35 : 32];
    if(when_Axi4LiteCrossbar_l272_1) begin
      if(when_Axi4LiteCrossbar_l285_1) begin
        if(when_Axi4LiteCrossbar_l289_1) begin
          io_slaves_1_w_payload_strb = io_masters_0_w_payload_strb;
        end
      end
    end else begin
      if(when_Axi4LiteCrossbar_l341_1) begin
        io_slaves_1_w_payload_strb = io_masters_0_w_payload_strb;
      end
    end
  end

  always @(*) begin
    io_slaves_1_b_ready = 1'b0;
    if(!when_Axi4LiteCrossbar_l272_1) begin
      if(when_Axi4LiteCrossbar_l341_1) begin
        io_slaves_1_b_ready = io_masters_0_b_ready;
      end
    end
  end

  always @(*) begin
    io_slaves_1_ar_valid = 1'b0;
    if(when_Axi4LiteCrossbar_l362_1) begin
      if(when_Axi4LiteCrossbar_l374_1) begin
        io_slaves_1_ar_valid = 1'b1;
      end
    end
  end

  assign _zz_io_slaves_1_ar_payload_addr = 35'h0;
  always @(*) begin
    io_slaves_1_ar_payload_addr = _zz_io_slaves_1_ar_payload_addr[31 : 0];
    if(when_Axi4LiteCrossbar_l362_1) begin
      if(when_Axi4LiteCrossbar_l374_1) begin
        if(when_Axi4LiteCrossbar_l377_1) begin
          io_slaves_1_ar_payload_addr = io_masters_0_ar_payload_addr;
        end
      end
    end
  end

  always @(*) begin
    io_slaves_1_ar_payload_prot = _zz_io_slaves_1_ar_payload_addr[34 : 32];
    if(when_Axi4LiteCrossbar_l362_1) begin
      if(when_Axi4LiteCrossbar_l374_1) begin
        if(when_Axi4LiteCrossbar_l377_1) begin
          io_slaves_1_ar_payload_prot = io_masters_0_ar_payload_prot;
        end
      end
    end
  end

  always @(*) begin
    io_slaves_1_r_ready = 1'b0;
    if(!when_Axi4LiteCrossbar_l362_1) begin
      if(when_Axi4LiteCrossbar_l420_1) begin
        io_slaves_1_r_ready = io_masters_0_r_ready;
      end
    end
  end

  always @(*) begin
    io_slaves_2_aw_valid = 1'b0;
    if(when_Axi4LiteCrossbar_l272_2) begin
      if(when_Axi4LiteCrossbar_l285_2) begin
        io_slaves_2_aw_valid = 1'b1;
      end
    end
  end

  assign _zz_io_slaves_2_aw_payload_addr = 35'h0;
  always @(*) begin
    io_slaves_2_aw_payload_addr = _zz_io_slaves_2_aw_payload_addr[31 : 0];
    if(when_Axi4LiteCrossbar_l272_2) begin
      if(when_Axi4LiteCrossbar_l285_2) begin
        if(when_Axi4LiteCrossbar_l289_2) begin
          io_slaves_2_aw_payload_addr = io_masters_0_aw_payload_addr;
        end
      end
    end
  end

  always @(*) begin
    io_slaves_2_aw_payload_prot = _zz_io_slaves_2_aw_payload_addr[34 : 32];
    if(when_Axi4LiteCrossbar_l272_2) begin
      if(when_Axi4LiteCrossbar_l285_2) begin
        if(when_Axi4LiteCrossbar_l289_2) begin
          io_slaves_2_aw_payload_prot = io_masters_0_aw_payload_prot;
        end
      end
    end
  end

  always @(*) begin
    io_slaves_2_w_valid = 1'b0;
    if(when_Axi4LiteCrossbar_l272_2) begin
      if(when_Axi4LiteCrossbar_l285_2) begin
        if(when_Axi4LiteCrossbar_l289_2) begin
          io_slaves_2_w_valid = io_masters_0_w_valid;
        end
      end
    end else begin
      if(when_Axi4LiteCrossbar_l341_2) begin
        io_slaves_2_w_valid = io_masters_0_w_valid;
      end
    end
  end

  assign _zz_io_slaves_2_w_payload_data = 36'h0;
  always @(*) begin
    io_slaves_2_w_payload_data = _zz_io_slaves_2_w_payload_data[31 : 0];
    if(when_Axi4LiteCrossbar_l272_2) begin
      if(when_Axi4LiteCrossbar_l285_2) begin
        if(when_Axi4LiteCrossbar_l289_2) begin
          io_slaves_2_w_payload_data = io_masters_0_w_payload_data;
        end
      end
    end else begin
      if(when_Axi4LiteCrossbar_l341_2) begin
        io_slaves_2_w_payload_data = io_masters_0_w_payload_data;
      end
    end
  end

  always @(*) begin
    io_slaves_2_w_payload_strb = _zz_io_slaves_2_w_payload_data[35 : 32];
    if(when_Axi4LiteCrossbar_l272_2) begin
      if(when_Axi4LiteCrossbar_l285_2) begin
        if(when_Axi4LiteCrossbar_l289_2) begin
          io_slaves_2_w_payload_strb = io_masters_0_w_payload_strb;
        end
      end
    end else begin
      if(when_Axi4LiteCrossbar_l341_2) begin
        io_slaves_2_w_payload_strb = io_masters_0_w_payload_strb;
      end
    end
  end

  always @(*) begin
    io_slaves_2_b_ready = 1'b0;
    if(!when_Axi4LiteCrossbar_l272_2) begin
      if(when_Axi4LiteCrossbar_l341_2) begin
        io_slaves_2_b_ready = io_masters_0_b_ready;
      end
    end
  end

  always @(*) begin
    io_slaves_2_ar_valid = 1'b0;
    if(when_Axi4LiteCrossbar_l362_2) begin
      if(when_Axi4LiteCrossbar_l374_2) begin
        io_slaves_2_ar_valid = 1'b1;
      end
    end
  end

  assign _zz_io_slaves_2_ar_payload_addr = 35'h0;
  always @(*) begin
    io_slaves_2_ar_payload_addr = _zz_io_slaves_2_ar_payload_addr[31 : 0];
    if(when_Axi4LiteCrossbar_l362_2) begin
      if(when_Axi4LiteCrossbar_l374_2) begin
        if(when_Axi4LiteCrossbar_l377_2) begin
          io_slaves_2_ar_payload_addr = io_masters_0_ar_payload_addr;
        end
      end
    end
  end

  always @(*) begin
    io_slaves_2_ar_payload_prot = _zz_io_slaves_2_ar_payload_addr[34 : 32];
    if(when_Axi4LiteCrossbar_l362_2) begin
      if(when_Axi4LiteCrossbar_l374_2) begin
        if(when_Axi4LiteCrossbar_l377_2) begin
          io_slaves_2_ar_payload_prot = io_masters_0_ar_payload_prot;
        end
      end
    end
  end

  always @(*) begin
    io_slaves_2_r_ready = 1'b0;
    if(!when_Axi4LiteCrossbar_l362_2) begin
      if(when_Axi4LiteCrossbar_l420_2) begin
        io_slaves_2_r_ready = io_masters_0_r_ready;
      end
    end
  end

  always @(*) begin
    io_slaves_3_aw_valid = 1'b0;
    if(when_Axi4LiteCrossbar_l272_3) begin
      if(when_Axi4LiteCrossbar_l285_3) begin
        io_slaves_3_aw_valid = 1'b1;
      end
    end
  end

  assign _zz_io_slaves_3_aw_payload_addr = 35'h0;
  always @(*) begin
    io_slaves_3_aw_payload_addr = _zz_io_slaves_3_aw_payload_addr[31 : 0];
    if(when_Axi4LiteCrossbar_l272_3) begin
      if(when_Axi4LiteCrossbar_l285_3) begin
        if(when_Axi4LiteCrossbar_l289_3) begin
          io_slaves_3_aw_payload_addr = io_masters_0_aw_payload_addr;
        end
      end
    end
  end

  always @(*) begin
    io_slaves_3_aw_payload_prot = _zz_io_slaves_3_aw_payload_addr[34 : 32];
    if(when_Axi4LiteCrossbar_l272_3) begin
      if(when_Axi4LiteCrossbar_l285_3) begin
        if(when_Axi4LiteCrossbar_l289_3) begin
          io_slaves_3_aw_payload_prot = io_masters_0_aw_payload_prot;
        end
      end
    end
  end

  always @(*) begin
    io_slaves_3_w_valid = 1'b0;
    if(when_Axi4LiteCrossbar_l272_3) begin
      if(when_Axi4LiteCrossbar_l285_3) begin
        if(when_Axi4LiteCrossbar_l289_3) begin
          io_slaves_3_w_valid = io_masters_0_w_valid;
        end
      end
    end else begin
      if(when_Axi4LiteCrossbar_l341_3) begin
        io_slaves_3_w_valid = io_masters_0_w_valid;
      end
    end
  end

  assign _zz_io_slaves_3_w_payload_data = 36'h0;
  always @(*) begin
    io_slaves_3_w_payload_data = _zz_io_slaves_3_w_payload_data[31 : 0];
    if(when_Axi4LiteCrossbar_l272_3) begin
      if(when_Axi4LiteCrossbar_l285_3) begin
        if(when_Axi4LiteCrossbar_l289_3) begin
          io_slaves_3_w_payload_data = io_masters_0_w_payload_data;
        end
      end
    end else begin
      if(when_Axi4LiteCrossbar_l341_3) begin
        io_slaves_3_w_payload_data = io_masters_0_w_payload_data;
      end
    end
  end

  always @(*) begin
    io_slaves_3_w_payload_strb = _zz_io_slaves_3_w_payload_data[35 : 32];
    if(when_Axi4LiteCrossbar_l272_3) begin
      if(when_Axi4LiteCrossbar_l285_3) begin
        if(when_Axi4LiteCrossbar_l289_3) begin
          io_slaves_3_w_payload_strb = io_masters_0_w_payload_strb;
        end
      end
    end else begin
      if(when_Axi4LiteCrossbar_l341_3) begin
        io_slaves_3_w_payload_strb = io_masters_0_w_payload_strb;
      end
    end
  end

  always @(*) begin
    io_slaves_3_b_ready = 1'b0;
    if(!when_Axi4LiteCrossbar_l272_3) begin
      if(when_Axi4LiteCrossbar_l341_3) begin
        io_slaves_3_b_ready = io_masters_0_b_ready;
      end
    end
  end

  always @(*) begin
    io_slaves_3_ar_valid = 1'b0;
    if(when_Axi4LiteCrossbar_l362_3) begin
      if(when_Axi4LiteCrossbar_l374_3) begin
        io_slaves_3_ar_valid = 1'b1;
      end
    end
  end

  assign _zz_io_slaves_3_ar_payload_addr = 35'h0;
  always @(*) begin
    io_slaves_3_ar_payload_addr = _zz_io_slaves_3_ar_payload_addr[31 : 0];
    if(when_Axi4LiteCrossbar_l362_3) begin
      if(when_Axi4LiteCrossbar_l374_3) begin
        if(when_Axi4LiteCrossbar_l377_3) begin
          io_slaves_3_ar_payload_addr = io_masters_0_ar_payload_addr;
        end
      end
    end
  end

  always @(*) begin
    io_slaves_3_ar_payload_prot = _zz_io_slaves_3_ar_payload_addr[34 : 32];
    if(when_Axi4LiteCrossbar_l362_3) begin
      if(when_Axi4LiteCrossbar_l374_3) begin
        if(when_Axi4LiteCrossbar_l377_3) begin
          io_slaves_3_ar_payload_prot = io_masters_0_ar_payload_prot;
        end
      end
    end
  end

  always @(*) begin
    io_slaves_3_r_ready = 1'b0;
    if(!when_Axi4LiteCrossbar_l362_3) begin
      if(when_Axi4LiteCrossbar_l420_3) begin
        io_slaves_3_r_ready = io_masters_0_r_ready;
      end
    end
  end

  always @(*) begin
    decErr_io_axi_aw_valid = 1'b0;
    if(when_Axi4LiteCrossbar_l272_4) begin
      if(when_Axi4LiteCrossbar_l285_4) begin
        decErr_io_axi_aw_valid = 1'b1;
      end
    end
  end

  assign _zz_io_axi_aw_payload_addr = 35'h0;
  always @(*) begin
    decErr_io_axi_aw_payload_addr = _zz_io_axi_aw_payload_addr[31 : 0];
    if(when_Axi4LiteCrossbar_l272_4) begin
      if(when_Axi4LiteCrossbar_l285_4) begin
        if(when_Axi4LiteCrossbar_l289_4) begin
          decErr_io_axi_aw_payload_addr = io_masters_0_aw_payload_addr;
        end
      end
    end
  end

  always @(*) begin
    decErr_io_axi_aw_payload_prot = _zz_io_axi_aw_payload_addr[34 : 32];
    if(when_Axi4LiteCrossbar_l272_4) begin
      if(when_Axi4LiteCrossbar_l285_4) begin
        if(when_Axi4LiteCrossbar_l289_4) begin
          decErr_io_axi_aw_payload_prot = io_masters_0_aw_payload_prot;
        end
      end
    end
  end

  always @(*) begin
    decErr_io_axi_w_valid = 1'b0;
    if(when_Axi4LiteCrossbar_l272_4) begin
      if(when_Axi4LiteCrossbar_l285_4) begin
        if(when_Axi4LiteCrossbar_l289_4) begin
          decErr_io_axi_w_valid = io_masters_0_w_valid;
        end
      end
    end else begin
      if(when_Axi4LiteCrossbar_l341_4) begin
        decErr_io_axi_w_valid = io_masters_0_w_valid;
      end
    end
  end

  assign _zz_io_axi_w_payload_data = 36'h0;
  always @(*) begin
    decErr_io_axi_w_payload_data = _zz_io_axi_w_payload_data[31 : 0];
    if(when_Axi4LiteCrossbar_l272_4) begin
      if(when_Axi4LiteCrossbar_l285_4) begin
        if(when_Axi4LiteCrossbar_l289_4) begin
          decErr_io_axi_w_payload_data = io_masters_0_w_payload_data;
        end
      end
    end else begin
      if(when_Axi4LiteCrossbar_l341_4) begin
        decErr_io_axi_w_payload_data = io_masters_0_w_payload_data;
      end
    end
  end

  always @(*) begin
    decErr_io_axi_w_payload_strb = _zz_io_axi_w_payload_data[35 : 32];
    if(when_Axi4LiteCrossbar_l272_4) begin
      if(when_Axi4LiteCrossbar_l285_4) begin
        if(when_Axi4LiteCrossbar_l289_4) begin
          decErr_io_axi_w_payload_strb = io_masters_0_w_payload_strb;
        end
      end
    end else begin
      if(when_Axi4LiteCrossbar_l341_4) begin
        decErr_io_axi_w_payload_strb = io_masters_0_w_payload_strb;
      end
    end
  end

  always @(*) begin
    decErr_io_axi_b_ready = 1'b0;
    if(!when_Axi4LiteCrossbar_l272_4) begin
      if(when_Axi4LiteCrossbar_l341_4) begin
        decErr_io_axi_b_ready = io_masters_0_b_ready;
      end
    end
  end

  always @(*) begin
    decErr_io_axi_ar_valid = 1'b0;
    if(when_Axi4LiteCrossbar_l362_4) begin
      if(when_Axi4LiteCrossbar_l374_4) begin
        decErr_io_axi_ar_valid = 1'b1;
      end
    end
  end

  assign _zz_io_axi_ar_payload_addr = 35'h0;
  always @(*) begin
    decErr_io_axi_ar_payload_addr = _zz_io_axi_ar_payload_addr[31 : 0];
    if(when_Axi4LiteCrossbar_l362_4) begin
      if(when_Axi4LiteCrossbar_l374_4) begin
        if(when_Axi4LiteCrossbar_l377_4) begin
          decErr_io_axi_ar_payload_addr = io_masters_0_ar_payload_addr;
        end
      end
    end
  end

  always @(*) begin
    decErr_io_axi_ar_payload_prot = _zz_io_axi_ar_payload_addr[34 : 32];
    if(when_Axi4LiteCrossbar_l362_4) begin
      if(when_Axi4LiteCrossbar_l374_4) begin
        if(when_Axi4LiteCrossbar_l377_4) begin
          decErr_io_axi_ar_payload_prot = io_masters_0_ar_payload_prot;
        end
      end
    end
  end

  always @(*) begin
    decErr_io_axi_r_ready = 1'b0;
    if(!when_Axi4LiteCrossbar_l362_4) begin
      if(when_Axi4LiteCrossbar_l420_4) begin
        decErr_io_axi_r_ready = io_masters_0_r_ready;
      end
    end
  end

  assign when_Axi4LiteCrossbar_l272 = (! wrActive_0);
  always @(*) begin
    _zz_when_Axi4LiteCrossbar_l285_1[0] = (io_masters_0_aw_payload_addr[31 : 12] == 20'h0);
    _zz_when_Axi4LiteCrossbar_l285_1[1] = (io_masters_0_aw_payload_addr[31 : 12] == 20'h00010);
    _zz_when_Axi4LiteCrossbar_l285_1[2] = (io_masters_0_aw_payload_addr[31 : 12] == 20'h00020);
    _zz_when_Axi4LiteCrossbar_l285_1[3] = (io_masters_0_aw_payload_addr[31 : 12] == 20'h00030);
  end

  assign _zz_when_Axi4LiteCrossbar_l285[0] = ((io_masters_0_aw_valid && _zz__zz_when_Axi4LiteCrossbar_l285[0]) && (! ((((wrActive_0 && (wrGranted_0 == _zz__zz_when_Axi4LiteCrossbar_l285_1)) || (wrActive_1 && (wrGranted_1 == _zz__zz_when_Axi4LiteCrossbar_l285_2))) || ((wrActive_2 && (wrGranted_2 == _zz__zz_when_Axi4LiteCrossbar_l285_3)) || (wrActive_3 && (wrGranted_3 == _zz__zz_when_Axi4LiteCrossbar_l285_4)))) || (wrActive_4 && (wrGranted_4 == 1'b0)))));
  assign _zz_when_Axi4LiteCrossbar_l149 = (_zz_when_Axi4LiteCrossbar_l285 & (~ 1'b0));
  assign _zz_when_Axi4LiteCrossbar_l149_1 = _zz_when_Axi4LiteCrossbar_l149;
  assign _zz_when_Axi4LiteCrossbar_l149_2 = _zz_when_Axi4LiteCrossbar_l285;
  always @(*) begin
    _zz_wrGranted_0 = 1'b0;
    if(when_Axi4LiteCrossbar_l149) begin
      _zz_wrGranted_0 = 1'b0;
    end
  end

  assign when_Axi4LiteCrossbar_l149 = _zz_when_Axi4LiteCrossbar_l149_30[0];
  assign _zz_wrGranted_0_1 = (grantLock ? grantLockIdx : _zz_wrGranted_0);
  assign when_Axi4LiteCrossbar_l184 = (io_slaves_0_aw_valid && (! io_slaves_0_aw_ready));
  assign when_Axi4LiteCrossbar_l285 = (|_zz_when_Axi4LiteCrossbar_l285);
  assign when_Axi4LiteCrossbar_l289 = (_zz_wrGranted_0_1 == 1'b0);
  assign io_slaves_0_aw_fire = (io_slaves_0_aw_valid && io_slaves_0_aw_ready);
  assign when_Axi4LiteCrossbar_l341 = (wrGranted_0 == 1'b0);
  assign io_slaves_0_b_fire = (io_slaves_0_b_valid && io_slaves_0_b_ready);
  assign when_Axi4LiteCrossbar_l272_1 = (! wrActive_1);
  always @(*) begin
    _zz_when_Axi4LiteCrossbar_l285_3[0] = (io_masters_0_aw_payload_addr[31 : 12] == 20'h0);
    _zz_when_Axi4LiteCrossbar_l285_3[1] = (io_masters_0_aw_payload_addr[31 : 12] == 20'h00010);
    _zz_when_Axi4LiteCrossbar_l285_3[2] = (io_masters_0_aw_payload_addr[31 : 12] == 20'h00020);
    _zz_when_Axi4LiteCrossbar_l285_3[3] = (io_masters_0_aw_payload_addr[31 : 12] == 20'h00030);
  end

  assign _zz_when_Axi4LiteCrossbar_l285_2[0] = ((io_masters_0_aw_valid && _zz__zz_when_Axi4LiteCrossbar_l285_2_1[1]) && (! ((((wrActive_0 && (wrGranted_0 == 1'b0)) || (wrActive_1 && (wrGranted_1 == 1'b0))) || ((wrActive_2 && (wrGranted_2 == 1'b0)) || (wrActive_3 && (wrGranted_3 == 1'b0)))) || (wrActive_4 && (wrGranted_4 == 1'b0)))));
  assign _zz_when_Axi4LiteCrossbar_l149_3 = (_zz_when_Axi4LiteCrossbar_l285_2 & (~ 1'b0));
  assign _zz_when_Axi4LiteCrossbar_l149_4 = _zz_when_Axi4LiteCrossbar_l149_3;
  assign _zz_when_Axi4LiteCrossbar_l149_5 = _zz_when_Axi4LiteCrossbar_l285_2;
  always @(*) begin
    _zz_wrGranted_1 = 1'b0;
    if(when_Axi4LiteCrossbar_l149_1) begin
      _zz_wrGranted_1 = 1'b0;
    end
  end

  assign when_Axi4LiteCrossbar_l149_1 = _zz_when_Axi4LiteCrossbar_l149_1_1[0];
  assign _zz_wrGranted_1_1 = (grantLock_1 ? grantLockIdx_1 : _zz_wrGranted_1);
  assign when_Axi4LiteCrossbar_l184_1 = (io_slaves_1_aw_valid && (! io_slaves_1_aw_ready));
  assign when_Axi4LiteCrossbar_l285_1 = (|_zz_when_Axi4LiteCrossbar_l285_2);
  assign when_Axi4LiteCrossbar_l289_1 = (_zz_wrGranted_1_1 == 1'b0);
  assign io_slaves_1_aw_fire = (io_slaves_1_aw_valid && io_slaves_1_aw_ready);
  assign when_Axi4LiteCrossbar_l341_1 = (wrGranted_1 == 1'b0);
  assign io_slaves_1_b_fire = (io_slaves_1_b_valid && io_slaves_1_b_ready);
  assign when_Axi4LiteCrossbar_l272_2 = (! wrActive_2);
  always @(*) begin
    _zz_when_Axi4LiteCrossbar_l285_5[0] = (io_masters_0_aw_payload_addr[31 : 12] == 20'h0);
    _zz_when_Axi4LiteCrossbar_l285_5[1] = (io_masters_0_aw_payload_addr[31 : 12] == 20'h00010);
    _zz_when_Axi4LiteCrossbar_l285_5[2] = (io_masters_0_aw_payload_addr[31 : 12] == 20'h00020);
    _zz_when_Axi4LiteCrossbar_l285_5[3] = (io_masters_0_aw_payload_addr[31 : 12] == 20'h00030);
  end

  assign _zz_when_Axi4LiteCrossbar_l285_4[0] = ((io_masters_0_aw_valid && _zz__zz_when_Axi4LiteCrossbar_l285_4_1[2]) && (! ((((wrActive_0 && (wrGranted_0 == 1'b0)) || (wrActive_1 && (wrGranted_1 == 1'b0))) || ((wrActive_2 && (wrGranted_2 == 1'b0)) || (wrActive_3 && (wrGranted_3 == 1'b0)))) || (wrActive_4 && (wrGranted_4 == 1'b0)))));
  assign _zz_when_Axi4LiteCrossbar_l149_6 = (_zz_when_Axi4LiteCrossbar_l285_4 & (~ 1'b0));
  assign _zz_when_Axi4LiteCrossbar_l149_7 = _zz_when_Axi4LiteCrossbar_l149_6;
  assign _zz_when_Axi4LiteCrossbar_l149_8 = _zz_when_Axi4LiteCrossbar_l285_4;
  always @(*) begin
    _zz_wrGranted_2 = 1'b0;
    if(when_Axi4LiteCrossbar_l149_2) begin
      _zz_wrGranted_2 = 1'b0;
    end
  end

  assign when_Axi4LiteCrossbar_l149_2 = _zz_when_Axi4LiteCrossbar_l149_2_1[0];
  assign _zz_wrGranted_2_1 = (grantLock_2 ? grantLockIdx_2 : _zz_wrGranted_2);
  assign when_Axi4LiteCrossbar_l184_2 = (io_slaves_2_aw_valid && (! io_slaves_2_aw_ready));
  assign when_Axi4LiteCrossbar_l285_2 = (|_zz_when_Axi4LiteCrossbar_l285_4);
  assign when_Axi4LiteCrossbar_l289_2 = (_zz_wrGranted_2_1 == 1'b0);
  assign io_slaves_2_aw_fire = (io_slaves_2_aw_valid && io_slaves_2_aw_ready);
  assign when_Axi4LiteCrossbar_l341_2 = (wrGranted_2 == 1'b0);
  assign io_slaves_2_b_fire = (io_slaves_2_b_valid && io_slaves_2_b_ready);
  assign when_Axi4LiteCrossbar_l272_3 = (! wrActive_3);
  always @(*) begin
    _zz_when_Axi4LiteCrossbar_l285_7[0] = (io_masters_0_aw_payload_addr[31 : 12] == 20'h0);
    _zz_when_Axi4LiteCrossbar_l285_7[1] = (io_masters_0_aw_payload_addr[31 : 12] == 20'h00010);
    _zz_when_Axi4LiteCrossbar_l285_7[2] = (io_masters_0_aw_payload_addr[31 : 12] == 20'h00020);
    _zz_when_Axi4LiteCrossbar_l285_7[3] = (io_masters_0_aw_payload_addr[31 : 12] == 20'h00030);
  end

  assign _zz_when_Axi4LiteCrossbar_l285_6[0] = ((io_masters_0_aw_valid && _zz__zz_when_Axi4LiteCrossbar_l285_6[3]) && (! ((((wrActive_0 && (wrGranted_0 == 1'b0)) || (wrActive_1 && (wrGranted_1 == 1'b0))) || ((wrActive_2 && (wrGranted_2 == 1'b0)) || (wrActive_3 && (wrGranted_3 == 1'b0)))) || (wrActive_4 && (wrGranted_4 == 1'b0)))));
  assign _zz_when_Axi4LiteCrossbar_l149_9 = (_zz_when_Axi4LiteCrossbar_l285_6 & (~ 1'b0));
  assign _zz_when_Axi4LiteCrossbar_l149_10 = _zz_when_Axi4LiteCrossbar_l149_9;
  assign _zz_when_Axi4LiteCrossbar_l149_11 = _zz_when_Axi4LiteCrossbar_l285_6;
  always @(*) begin
    _zz_wrGranted_3 = 1'b0;
    if(when_Axi4LiteCrossbar_l149_3) begin
      _zz_wrGranted_3 = 1'b0;
    end
  end

  assign when_Axi4LiteCrossbar_l149_3 = _zz_when_Axi4LiteCrossbar_l149_3_1[0];
  assign _zz_wrGranted_3_1 = (grantLock_3 ? grantLockIdx_3 : _zz_wrGranted_3);
  assign when_Axi4LiteCrossbar_l184_3 = (io_slaves_3_aw_valid && (! io_slaves_3_aw_ready));
  assign when_Axi4LiteCrossbar_l285_3 = (|_zz_when_Axi4LiteCrossbar_l285_6);
  assign when_Axi4LiteCrossbar_l289_3 = (_zz_wrGranted_3_1 == 1'b0);
  assign io_slaves_3_aw_fire = (io_slaves_3_aw_valid && io_slaves_3_aw_ready);
  assign when_Axi4LiteCrossbar_l341_3 = (wrGranted_3 == 1'b0);
  assign io_slaves_3_b_fire = (io_slaves_3_b_valid && io_slaves_3_b_ready);
  assign when_Axi4LiteCrossbar_l272_4 = (! wrActive_4);
  always @(*) begin
    _zz_when_Axi4LiteCrossbar_l285_9[0] = (io_masters_0_aw_payload_addr[31 : 12] == 20'h0);
    _zz_when_Axi4LiteCrossbar_l285_9[1] = (io_masters_0_aw_payload_addr[31 : 12] == 20'h00010);
    _zz_when_Axi4LiteCrossbar_l285_9[2] = (io_masters_0_aw_payload_addr[31 : 12] == 20'h00020);
    _zz_when_Axi4LiteCrossbar_l285_9[3] = (io_masters_0_aw_payload_addr[31 : 12] == 20'h00030);
  end

  assign _zz_when_Axi4LiteCrossbar_l285_8[0] = ((io_masters_0_aw_valid && _zz__zz_when_Axi4LiteCrossbar_l285_8[4]) && (! ((((wrActive_0 && (wrGranted_0 == 1'b0)) || (wrActive_1 && (wrGranted_1 == 1'b0))) || ((wrActive_2 && (wrGranted_2 == 1'b0)) || (wrActive_3 && (wrGranted_3 == 1'b0)))) || (wrActive_4 && (wrGranted_4 == 1'b0)))));
  assign _zz_when_Axi4LiteCrossbar_l149_12 = (_zz_when_Axi4LiteCrossbar_l285_8 & (~ 1'b0));
  assign _zz_when_Axi4LiteCrossbar_l149_13 = _zz_when_Axi4LiteCrossbar_l149_12;
  assign _zz_when_Axi4LiteCrossbar_l149_14 = _zz_when_Axi4LiteCrossbar_l285_8;
  always @(*) begin
    _zz_wrGranted_4 = 1'b0;
    if(when_Axi4LiteCrossbar_l149_4) begin
      _zz_wrGranted_4 = 1'b0;
    end
  end

  assign when_Axi4LiteCrossbar_l149_4 = _zz_when_Axi4LiteCrossbar_l149_4_1[0];
  assign _zz_wrGranted_4_1 = (grantLock_4 ? grantLockIdx_4 : _zz_wrGranted_4);
  assign when_Axi4LiteCrossbar_l184_4 = (decErr_io_axi_aw_valid && (! decErr_io_axi_aw_ready));
  assign when_Axi4LiteCrossbar_l285_4 = (|_zz_when_Axi4LiteCrossbar_l285_8);
  assign when_Axi4LiteCrossbar_l289_4 = (_zz_wrGranted_4_1 == 1'b0);
  assign decErr_io_axi_aw_fire = (decErr_io_axi_aw_valid && decErr_io_axi_aw_ready);
  assign when_Axi4LiteCrossbar_l341_4 = (wrGranted_4 == 1'b0);
  assign decErr_io_axi_b_fire = (decErr_io_axi_b_valid && decErr_io_axi_b_ready);
  assign when_Axi4LiteCrossbar_l362 = (! rdActive_0);
  always @(*) begin
    _zz_when_Axi4LiteCrossbar_l374_1[0] = (io_masters_0_ar_payload_addr[31 : 12] == 20'h0);
    _zz_when_Axi4LiteCrossbar_l374_1[1] = (io_masters_0_ar_payload_addr[31 : 12] == 20'h00010);
    _zz_when_Axi4LiteCrossbar_l374_1[2] = (io_masters_0_ar_payload_addr[31 : 12] == 20'h00020);
    _zz_when_Axi4LiteCrossbar_l374_1[3] = (io_masters_0_ar_payload_addr[31 : 12] == 20'h00030);
  end

  assign _zz_when_Axi4LiteCrossbar_l374[0] = ((io_masters_0_ar_valid && _zz__zz_when_Axi4LiteCrossbar_l374[0]) && (! ((((rdActive_0 && (rdGranted_0 == _zz__zz_when_Axi4LiteCrossbar_l374_1)) || (rdActive_1 && (rdGranted_1 == _zz__zz_when_Axi4LiteCrossbar_l374_2))) || ((rdActive_2 && (rdGranted_2 == _zz__zz_when_Axi4LiteCrossbar_l374_3)) || (rdActive_3 && (rdGranted_3 == _zz__zz_when_Axi4LiteCrossbar_l374_4)))) || (rdActive_4 && (rdGranted_4 == 1'b0)))));
  assign _zz_when_Axi4LiteCrossbar_l149_15 = (_zz_when_Axi4LiteCrossbar_l374 & (~ 1'b0));
  assign _zz_when_Axi4LiteCrossbar_l149_16 = _zz_when_Axi4LiteCrossbar_l149_15;
  assign _zz_when_Axi4LiteCrossbar_l149_17 = _zz_when_Axi4LiteCrossbar_l374;
  always @(*) begin
    _zz_rdGranted_0 = 1'b0;
    if(when_Axi4LiteCrossbar_l149_5) begin
      _zz_rdGranted_0 = 1'b0;
    end
  end

  assign when_Axi4LiteCrossbar_l149_5 = _zz_when_Axi4LiteCrossbar_l149_5_1[0];
  assign _zz_rdGranted_0_1 = (grantLock_5 ? grantLockIdx_5 : _zz_rdGranted_0);
  assign when_Axi4LiteCrossbar_l184_5 = (io_slaves_0_ar_valid && (! io_slaves_0_ar_ready));
  assign when_Axi4LiteCrossbar_l374 = (|_zz_when_Axi4LiteCrossbar_l374);
  assign when_Axi4LiteCrossbar_l377 = (_zz_rdGranted_0_1 == 1'b0);
  assign io_slaves_0_ar_fire = (io_slaves_0_ar_valid && io_slaves_0_ar_ready);
  assign when_Axi4LiteCrossbar_l420 = (rdGranted_0 == 1'b0);
  assign io_slaves_0_r_fire = (io_slaves_0_r_valid && io_slaves_0_r_ready);
  assign when_Axi4LiteCrossbar_l362_1 = (! rdActive_1);
  always @(*) begin
    _zz_when_Axi4LiteCrossbar_l374_3[0] = (io_masters_0_ar_payload_addr[31 : 12] == 20'h0);
    _zz_when_Axi4LiteCrossbar_l374_3[1] = (io_masters_0_ar_payload_addr[31 : 12] == 20'h00010);
    _zz_when_Axi4LiteCrossbar_l374_3[2] = (io_masters_0_ar_payload_addr[31 : 12] == 20'h00020);
    _zz_when_Axi4LiteCrossbar_l374_3[3] = (io_masters_0_ar_payload_addr[31 : 12] == 20'h00030);
  end

  assign _zz_when_Axi4LiteCrossbar_l374_2[0] = ((io_masters_0_ar_valid && _zz__zz_when_Axi4LiteCrossbar_l374_2_1[1]) && (! ((((rdActive_0 && (rdGranted_0 == 1'b0)) || (rdActive_1 && (rdGranted_1 == 1'b0))) || ((rdActive_2 && (rdGranted_2 == 1'b0)) || (rdActive_3 && (rdGranted_3 == 1'b0)))) || (rdActive_4 && (rdGranted_4 == 1'b0)))));
  assign _zz_when_Axi4LiteCrossbar_l149_18 = (_zz_when_Axi4LiteCrossbar_l374_2 & (~ 1'b0));
  assign _zz_when_Axi4LiteCrossbar_l149_19 = _zz_when_Axi4LiteCrossbar_l149_18;
  assign _zz_when_Axi4LiteCrossbar_l149_20 = _zz_when_Axi4LiteCrossbar_l374_2;
  always @(*) begin
    _zz_rdGranted_1 = 1'b0;
    if(when_Axi4LiteCrossbar_l149_6) begin
      _zz_rdGranted_1 = 1'b0;
    end
  end

  assign when_Axi4LiteCrossbar_l149_6 = _zz_when_Axi4LiteCrossbar_l149_6_1[0];
  assign _zz_rdGranted_1_1 = (grantLock_6 ? grantLockIdx_6 : _zz_rdGranted_1);
  assign when_Axi4LiteCrossbar_l184_6 = (io_slaves_1_ar_valid && (! io_slaves_1_ar_ready));
  assign when_Axi4LiteCrossbar_l374_1 = (|_zz_when_Axi4LiteCrossbar_l374_2);
  assign when_Axi4LiteCrossbar_l377_1 = (_zz_rdGranted_1_1 == 1'b0);
  assign io_slaves_1_ar_fire = (io_slaves_1_ar_valid && io_slaves_1_ar_ready);
  assign when_Axi4LiteCrossbar_l420_1 = (rdGranted_1 == 1'b0);
  assign io_slaves_1_r_fire = (io_slaves_1_r_valid && io_slaves_1_r_ready);
  assign when_Axi4LiteCrossbar_l362_2 = (! rdActive_2);
  always @(*) begin
    _zz_when_Axi4LiteCrossbar_l374_5[0] = (io_masters_0_ar_payload_addr[31 : 12] == 20'h0);
    _zz_when_Axi4LiteCrossbar_l374_5[1] = (io_masters_0_ar_payload_addr[31 : 12] == 20'h00010);
    _zz_when_Axi4LiteCrossbar_l374_5[2] = (io_masters_0_ar_payload_addr[31 : 12] == 20'h00020);
    _zz_when_Axi4LiteCrossbar_l374_5[3] = (io_masters_0_ar_payload_addr[31 : 12] == 20'h00030);
  end

  assign _zz_when_Axi4LiteCrossbar_l374_4[0] = ((io_masters_0_ar_valid && _zz__zz_when_Axi4LiteCrossbar_l374_4_1[2]) && (! ((((rdActive_0 && (rdGranted_0 == 1'b0)) || (rdActive_1 && (rdGranted_1 == 1'b0))) || ((rdActive_2 && (rdGranted_2 == 1'b0)) || (rdActive_3 && (rdGranted_3 == 1'b0)))) || (rdActive_4 && (rdGranted_4 == 1'b0)))));
  assign _zz_when_Axi4LiteCrossbar_l149_21 = (_zz_when_Axi4LiteCrossbar_l374_4 & (~ 1'b0));
  assign _zz_when_Axi4LiteCrossbar_l149_22 = _zz_when_Axi4LiteCrossbar_l149_21;
  assign _zz_when_Axi4LiteCrossbar_l149_23 = _zz_when_Axi4LiteCrossbar_l374_4;
  always @(*) begin
    _zz_rdGranted_2 = 1'b0;
    if(when_Axi4LiteCrossbar_l149_7) begin
      _zz_rdGranted_2 = 1'b0;
    end
  end

  assign when_Axi4LiteCrossbar_l149_7 = _zz_when_Axi4LiteCrossbar_l149_7_1[0];
  assign _zz_rdGranted_2_1 = (grantLock_7 ? grantLockIdx_7 : _zz_rdGranted_2);
  assign when_Axi4LiteCrossbar_l184_7 = (io_slaves_2_ar_valid && (! io_slaves_2_ar_ready));
  assign when_Axi4LiteCrossbar_l374_2 = (|_zz_when_Axi4LiteCrossbar_l374_4);
  assign when_Axi4LiteCrossbar_l377_2 = (_zz_rdGranted_2_1 == 1'b0);
  assign io_slaves_2_ar_fire = (io_slaves_2_ar_valid && io_slaves_2_ar_ready);
  assign when_Axi4LiteCrossbar_l420_2 = (rdGranted_2 == 1'b0);
  assign io_slaves_2_r_fire = (io_slaves_2_r_valid && io_slaves_2_r_ready);
  assign when_Axi4LiteCrossbar_l362_3 = (! rdActive_3);
  always @(*) begin
    _zz_when_Axi4LiteCrossbar_l374_7[0] = (io_masters_0_ar_payload_addr[31 : 12] == 20'h0);
    _zz_when_Axi4LiteCrossbar_l374_7[1] = (io_masters_0_ar_payload_addr[31 : 12] == 20'h00010);
    _zz_when_Axi4LiteCrossbar_l374_7[2] = (io_masters_0_ar_payload_addr[31 : 12] == 20'h00020);
    _zz_when_Axi4LiteCrossbar_l374_7[3] = (io_masters_0_ar_payload_addr[31 : 12] == 20'h00030);
  end

  assign _zz_when_Axi4LiteCrossbar_l374_6[0] = ((io_masters_0_ar_valid && _zz__zz_when_Axi4LiteCrossbar_l374_6[3]) && (! ((((rdActive_0 && (rdGranted_0 == 1'b0)) || (rdActive_1 && (rdGranted_1 == 1'b0))) || ((rdActive_2 && (rdGranted_2 == 1'b0)) || (rdActive_3 && (rdGranted_3 == 1'b0)))) || (rdActive_4 && (rdGranted_4 == 1'b0)))));
  assign _zz_when_Axi4LiteCrossbar_l149_24 = (_zz_when_Axi4LiteCrossbar_l374_6 & (~ 1'b0));
  assign _zz_when_Axi4LiteCrossbar_l149_25 = _zz_when_Axi4LiteCrossbar_l149_24;
  assign _zz_when_Axi4LiteCrossbar_l149_26 = _zz_when_Axi4LiteCrossbar_l374_6;
  always @(*) begin
    _zz_rdGranted_3 = 1'b0;
    if(when_Axi4LiteCrossbar_l149_8) begin
      _zz_rdGranted_3 = 1'b0;
    end
  end

  assign when_Axi4LiteCrossbar_l149_8 = _zz_when_Axi4LiteCrossbar_l149_8_1[0];
  assign _zz_rdGranted_3_1 = (grantLock_8 ? grantLockIdx_8 : _zz_rdGranted_3);
  assign when_Axi4LiteCrossbar_l184_8 = (io_slaves_3_ar_valid && (! io_slaves_3_ar_ready));
  assign when_Axi4LiteCrossbar_l374_3 = (|_zz_when_Axi4LiteCrossbar_l374_6);
  assign when_Axi4LiteCrossbar_l377_3 = (_zz_rdGranted_3_1 == 1'b0);
  assign io_slaves_3_ar_fire = (io_slaves_3_ar_valid && io_slaves_3_ar_ready);
  assign when_Axi4LiteCrossbar_l420_3 = (rdGranted_3 == 1'b0);
  assign io_slaves_3_r_fire = (io_slaves_3_r_valid && io_slaves_3_r_ready);
  assign when_Axi4LiteCrossbar_l362_4 = (! rdActive_4);
  always @(*) begin
    _zz_when_Axi4LiteCrossbar_l374_9[0] = (io_masters_0_ar_payload_addr[31 : 12] == 20'h0);
    _zz_when_Axi4LiteCrossbar_l374_9[1] = (io_masters_0_ar_payload_addr[31 : 12] == 20'h00010);
    _zz_when_Axi4LiteCrossbar_l374_9[2] = (io_masters_0_ar_payload_addr[31 : 12] == 20'h00020);
    _zz_when_Axi4LiteCrossbar_l374_9[3] = (io_masters_0_ar_payload_addr[31 : 12] == 20'h00030);
  end

  assign _zz_when_Axi4LiteCrossbar_l374_8[0] = ((io_masters_0_ar_valid && _zz__zz_when_Axi4LiteCrossbar_l374_8[4]) && (! ((((rdActive_0 && (rdGranted_0 == 1'b0)) || (rdActive_1 && (rdGranted_1 == 1'b0))) || ((rdActive_2 && (rdGranted_2 == 1'b0)) || (rdActive_3 && (rdGranted_3 == 1'b0)))) || (rdActive_4 && (rdGranted_4 == 1'b0)))));
  assign _zz_when_Axi4LiteCrossbar_l149_27 = (_zz_when_Axi4LiteCrossbar_l374_8 & (~ 1'b0));
  assign _zz_when_Axi4LiteCrossbar_l149_28 = _zz_when_Axi4LiteCrossbar_l149_27;
  assign _zz_when_Axi4LiteCrossbar_l149_29 = _zz_when_Axi4LiteCrossbar_l374_8;
  always @(*) begin
    _zz_rdGranted_4 = 1'b0;
    if(when_Axi4LiteCrossbar_l149_9) begin
      _zz_rdGranted_4 = 1'b0;
    end
  end

  assign when_Axi4LiteCrossbar_l149_9 = _zz_when_Axi4LiteCrossbar_l149_9_1[0];
  assign _zz_rdGranted_4_1 = (grantLock_9 ? grantLockIdx_9 : _zz_rdGranted_4);
  assign when_Axi4LiteCrossbar_l184_9 = (decErr_io_axi_ar_valid && (! decErr_io_axi_ar_ready));
  assign when_Axi4LiteCrossbar_l374_4 = (|_zz_when_Axi4LiteCrossbar_l374_8);
  assign when_Axi4LiteCrossbar_l377_4 = (_zz_rdGranted_4_1 == 1'b0);
  assign decErr_io_axi_ar_fire = (decErr_io_axi_ar_valid && decErr_io_axi_ar_ready);
  assign when_Axi4LiteCrossbar_l420_4 = (rdGranted_4 == 1'b0);
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
      if(when_Axi4LiteCrossbar_l272) begin
        if(when_Axi4LiteCrossbar_l285) begin
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
      if(when_Axi4LiteCrossbar_l272_1) begin
        if(when_Axi4LiteCrossbar_l285_1) begin
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
      if(when_Axi4LiteCrossbar_l272_2) begin
        if(when_Axi4LiteCrossbar_l285_2) begin
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
      if(when_Axi4LiteCrossbar_l272_3) begin
        if(when_Axi4LiteCrossbar_l285_3) begin
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
      if(when_Axi4LiteCrossbar_l272_4) begin
        if(when_Axi4LiteCrossbar_l285_4) begin
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
      if(when_Axi4LiteCrossbar_l362) begin
        if(when_Axi4LiteCrossbar_l374) begin
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
      if(when_Axi4LiteCrossbar_l362_1) begin
        if(when_Axi4LiteCrossbar_l374_1) begin
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
      if(when_Axi4LiteCrossbar_l362_2) begin
        if(when_Axi4LiteCrossbar_l374_2) begin
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
      if(when_Axi4LiteCrossbar_l362_3) begin
        if(when_Axi4LiteCrossbar_l374_3) begin
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
      if(when_Axi4LiteCrossbar_l362_4) begin
        if(when_Axi4LiteCrossbar_l374_4) begin
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
