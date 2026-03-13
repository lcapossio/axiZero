// Copyright (c) 2026 Leonardo Capossio — bard0 design  hello@bard0.com
// SPDX-License-Identifier: MIT
// Generator : SpinalHDL v1.10.1    git head : 2527c7c6b0fb0f95e5e1a5722a0be732b364ce43
// Component : AxiZeroLiteTop
// Git hash  : 119aa951c834b0daa7ec12b6877406150b57d596

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

  wire       [1:0]    _zz_io_masters_0_b_payload_resp;
  wire       [0:0]    _zz_when_Axi4LiteCrossbar_l131_24;
  wire       [0:0]    _zz_when_Axi4LiteCrossbar_l131_25;
  wire       [0:0]    _zz_when_Axi4LiteCrossbar_l131_26;
  wire       [0:0]    _zz_when_Axi4LiteCrossbar_l131_1_1;
  wire       [0:0]    _zz_when_Axi4LiteCrossbar_l131_1_2;
  wire       [0:0]    _zz_when_Axi4LiteCrossbar_l131_1_3;
  wire       [0:0]    _zz_when_Axi4LiteCrossbar_l131_2_1;
  wire       [0:0]    _zz_when_Axi4LiteCrossbar_l131_2_2;
  wire       [0:0]    _zz_when_Axi4LiteCrossbar_l131_2_3;
  wire       [0:0]    _zz_when_Axi4LiteCrossbar_l131_3_1;
  wire       [0:0]    _zz_when_Axi4LiteCrossbar_l131_3_2;
  wire       [0:0]    _zz_when_Axi4LiteCrossbar_l131_3_3;
  wire       [0:0]    _zz_when_Axi4LiteCrossbar_l131_4_1;
  wire       [0:0]    _zz_when_Axi4LiteCrossbar_l131_4_2;
  wire       [0:0]    _zz_when_Axi4LiteCrossbar_l131_4_3;
  wire       [0:0]    _zz_when_Axi4LiteCrossbar_l131_5_1;
  wire       [0:0]    _zz_when_Axi4LiteCrossbar_l131_5_2;
  wire       [0:0]    _zz_when_Axi4LiteCrossbar_l131_5_3;
  wire       [0:0]    _zz_when_Axi4LiteCrossbar_l131_6_1;
  wire       [0:0]    _zz_when_Axi4LiteCrossbar_l131_6_2;
  wire       [0:0]    _zz_when_Axi4LiteCrossbar_l131_6_3;
  wire       [0:0]    _zz_when_Axi4LiteCrossbar_l131_7_1;
  wire       [0:0]    _zz_when_Axi4LiteCrossbar_l131_7_2;
  wire       [0:0]    _zz_when_Axi4LiteCrossbar_l131_7_3;
  reg                 wrActive_0;
  reg                 wrActive_1;
  reg                 wrActive_2;
  reg                 wrActive_3;
  reg        [0:0]    wrGranted_0;
  reg        [0:0]    wrGranted_1;
  reg        [0:0]    wrGranted_2;
  reg        [0:0]    wrGranted_3;
  reg        [0:0]    wrRrPtr_0;
  reg        [0:0]    wrRrPtr_1;
  reg        [0:0]    wrRrPtr_2;
  reg        [0:0]    wrRrPtr_3;
  reg                 rdActive_0;
  reg                 rdActive_1;
  reg                 rdActive_2;
  reg                 rdActive_3;
  reg        [0:0]    rdGranted_0;
  reg        [0:0]    rdGranted_1;
  reg        [0:0]    rdGranted_2;
  reg        [0:0]    rdGranted_3;
  reg        [0:0]    rdRrPtr_0;
  reg        [0:0]    rdRrPtr_1;
  reg        [0:0]    rdRrPtr_2;
  reg        [0:0]    rdRrPtr_3;
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
  wire                when_Axi4LiteCrossbar_l194;
  wire       [0:0]    _zz_when_Axi4LiteCrossbar_l206;
  reg        [3:0]    _zz_when_Axi4LiteCrossbar_l206_1;
  wire       [0:0]    _zz_when_Axi4LiteCrossbar_l131;
  wire       [0:0]    _zz_when_Axi4LiteCrossbar_l131_1;
  wire       [0:0]    _zz_when_Axi4LiteCrossbar_l131_2;
  reg        [0:0]    _zz_wrGranted_0;
  wire                when_Axi4LiteCrossbar_l131;
  wire                when_Axi4LiteCrossbar_l206;
  wire                when_Axi4LiteCrossbar_l210;
  wire                io_slaves_0_aw_fire;
  wire                when_Axi4LiteCrossbar_l262;
  wire                io_slaves_0_b_fire;
  wire                when_Axi4LiteCrossbar_l194_1;
  wire       [0:0]    _zz_when_Axi4LiteCrossbar_l206_2;
  reg        [3:0]    _zz_when_Axi4LiteCrossbar_l206_3;
  wire       [0:0]    _zz_when_Axi4LiteCrossbar_l131_3;
  wire       [0:0]    _zz_when_Axi4LiteCrossbar_l131_4;
  wire       [0:0]    _zz_when_Axi4LiteCrossbar_l131_5;
  reg        [0:0]    _zz_wrGranted_1;
  wire                when_Axi4LiteCrossbar_l131_1;
  wire                when_Axi4LiteCrossbar_l206_1;
  wire                when_Axi4LiteCrossbar_l210_1;
  wire                io_slaves_1_aw_fire;
  wire                when_Axi4LiteCrossbar_l262_1;
  wire                io_slaves_1_b_fire;
  wire                when_Axi4LiteCrossbar_l194_2;
  wire       [0:0]    _zz_when_Axi4LiteCrossbar_l206_4;
  reg        [3:0]    _zz_when_Axi4LiteCrossbar_l206_5;
  wire       [0:0]    _zz_when_Axi4LiteCrossbar_l131_6;
  wire       [0:0]    _zz_when_Axi4LiteCrossbar_l131_7;
  wire       [0:0]    _zz_when_Axi4LiteCrossbar_l131_8;
  reg        [0:0]    _zz_wrGranted_2;
  wire                when_Axi4LiteCrossbar_l131_2;
  wire                when_Axi4LiteCrossbar_l206_2;
  wire                when_Axi4LiteCrossbar_l210_2;
  wire                io_slaves_2_aw_fire;
  wire                when_Axi4LiteCrossbar_l262_2;
  wire                io_slaves_2_b_fire;
  wire                when_Axi4LiteCrossbar_l194_3;
  wire       [0:0]    _zz_when_Axi4LiteCrossbar_l206_6;
  reg        [3:0]    _zz_when_Axi4LiteCrossbar_l206_7;
  wire       [0:0]    _zz_when_Axi4LiteCrossbar_l131_9;
  wire       [0:0]    _zz_when_Axi4LiteCrossbar_l131_10;
  wire       [0:0]    _zz_when_Axi4LiteCrossbar_l131_11;
  reg        [0:0]    _zz_wrGranted_3;
  wire                when_Axi4LiteCrossbar_l131_3;
  wire                when_Axi4LiteCrossbar_l206_3;
  wire                when_Axi4LiteCrossbar_l210_3;
  wire                io_slaves_3_aw_fire;
  wire                when_Axi4LiteCrossbar_l262_3;
  wire                io_slaves_3_b_fire;
  wire                when_Axi4LiteCrossbar_l283;
  wire       [0:0]    _zz_when_Axi4LiteCrossbar_l294;
  reg        [3:0]    _zz_when_Axi4LiteCrossbar_l294_1;
  wire       [0:0]    _zz_when_Axi4LiteCrossbar_l131_12;
  wire       [0:0]    _zz_when_Axi4LiteCrossbar_l131_13;
  wire       [0:0]    _zz_when_Axi4LiteCrossbar_l131_14;
  reg        [0:0]    _zz_rdGranted_0;
  wire                when_Axi4LiteCrossbar_l131_4;
  wire                when_Axi4LiteCrossbar_l294;
  wire                when_Axi4LiteCrossbar_l297;
  wire                io_slaves_0_ar_fire;
  wire                when_Axi4LiteCrossbar_l340;
  wire                io_slaves_0_r_fire;
  wire                when_Axi4LiteCrossbar_l283_1;
  wire       [0:0]    _zz_when_Axi4LiteCrossbar_l294_2;
  reg        [3:0]    _zz_when_Axi4LiteCrossbar_l294_3;
  wire       [0:0]    _zz_when_Axi4LiteCrossbar_l131_15;
  wire       [0:0]    _zz_when_Axi4LiteCrossbar_l131_16;
  wire       [0:0]    _zz_when_Axi4LiteCrossbar_l131_17;
  reg        [0:0]    _zz_rdGranted_1;
  wire                when_Axi4LiteCrossbar_l131_5;
  wire                when_Axi4LiteCrossbar_l294_1;
  wire                when_Axi4LiteCrossbar_l297_1;
  wire                io_slaves_1_ar_fire;
  wire                when_Axi4LiteCrossbar_l340_1;
  wire                io_slaves_1_r_fire;
  wire                when_Axi4LiteCrossbar_l283_2;
  wire       [0:0]    _zz_when_Axi4LiteCrossbar_l294_4;
  reg        [3:0]    _zz_when_Axi4LiteCrossbar_l294_5;
  wire       [0:0]    _zz_when_Axi4LiteCrossbar_l131_18;
  wire       [0:0]    _zz_when_Axi4LiteCrossbar_l131_19;
  wire       [0:0]    _zz_when_Axi4LiteCrossbar_l131_20;
  reg        [0:0]    _zz_rdGranted_2;
  wire                when_Axi4LiteCrossbar_l131_6;
  wire                when_Axi4LiteCrossbar_l294_2;
  wire                when_Axi4LiteCrossbar_l297_2;
  wire                io_slaves_2_ar_fire;
  wire                when_Axi4LiteCrossbar_l340_2;
  wire                io_slaves_2_r_fire;
  wire                when_Axi4LiteCrossbar_l283_3;
  wire       [0:0]    _zz_when_Axi4LiteCrossbar_l294_6;
  reg        [3:0]    _zz_when_Axi4LiteCrossbar_l294_7;
  wire       [0:0]    _zz_when_Axi4LiteCrossbar_l131_21;
  wire       [0:0]    _zz_when_Axi4LiteCrossbar_l131_22;
  wire       [0:0]    _zz_when_Axi4LiteCrossbar_l131_23;
  reg        [0:0]    _zz_rdGranted_3;
  wire                when_Axi4LiteCrossbar_l131_7;
  wire                when_Axi4LiteCrossbar_l294_3;
  wire                when_Axi4LiteCrossbar_l297_3;
  wire                io_slaves_3_ar_fire;
  wire                when_Axi4LiteCrossbar_l340_3;
  wire                io_slaves_3_r_fire;

  assign _zz_io_masters_0_b_payload_resp = 2'b00;
  assign _zz_when_Axi4LiteCrossbar_l131_24 = ((|_zz_when_Axi4LiteCrossbar_l131) ? (_zz_when_Axi4LiteCrossbar_l131_1 & (~ _zz_when_Axi4LiteCrossbar_l131_25)) : (_zz_when_Axi4LiteCrossbar_l131_2 & (~ _zz_when_Axi4LiteCrossbar_l131_26)));
  assign _zz_when_Axi4LiteCrossbar_l131_25 = (_zz_when_Axi4LiteCrossbar_l131_1 - 1'b1);
  assign _zz_when_Axi4LiteCrossbar_l131_26 = (_zz_when_Axi4LiteCrossbar_l131_2 - 1'b1);
  assign _zz_when_Axi4LiteCrossbar_l131_1_1 = ((|_zz_when_Axi4LiteCrossbar_l131_3) ? (_zz_when_Axi4LiteCrossbar_l131_4 & (~ _zz_when_Axi4LiteCrossbar_l131_1_2)) : (_zz_when_Axi4LiteCrossbar_l131_5 & (~ _zz_when_Axi4LiteCrossbar_l131_1_3)));
  assign _zz_when_Axi4LiteCrossbar_l131_1_2 = (_zz_when_Axi4LiteCrossbar_l131_4 - 1'b1);
  assign _zz_when_Axi4LiteCrossbar_l131_1_3 = (_zz_when_Axi4LiteCrossbar_l131_5 - 1'b1);
  assign _zz_when_Axi4LiteCrossbar_l131_2_1 = ((|_zz_when_Axi4LiteCrossbar_l131_6) ? (_zz_when_Axi4LiteCrossbar_l131_7 & (~ _zz_when_Axi4LiteCrossbar_l131_2_2)) : (_zz_when_Axi4LiteCrossbar_l131_8 & (~ _zz_when_Axi4LiteCrossbar_l131_2_3)));
  assign _zz_when_Axi4LiteCrossbar_l131_2_2 = (_zz_when_Axi4LiteCrossbar_l131_7 - 1'b1);
  assign _zz_when_Axi4LiteCrossbar_l131_2_3 = (_zz_when_Axi4LiteCrossbar_l131_8 - 1'b1);
  assign _zz_when_Axi4LiteCrossbar_l131_3_1 = ((|_zz_when_Axi4LiteCrossbar_l131_9) ? (_zz_when_Axi4LiteCrossbar_l131_10 & (~ _zz_when_Axi4LiteCrossbar_l131_3_2)) : (_zz_when_Axi4LiteCrossbar_l131_11 & (~ _zz_when_Axi4LiteCrossbar_l131_3_3)));
  assign _zz_when_Axi4LiteCrossbar_l131_3_2 = (_zz_when_Axi4LiteCrossbar_l131_10 - 1'b1);
  assign _zz_when_Axi4LiteCrossbar_l131_3_3 = (_zz_when_Axi4LiteCrossbar_l131_11 - 1'b1);
  assign _zz_when_Axi4LiteCrossbar_l131_4_1 = ((|_zz_when_Axi4LiteCrossbar_l131_12) ? (_zz_when_Axi4LiteCrossbar_l131_13 & (~ _zz_when_Axi4LiteCrossbar_l131_4_2)) : (_zz_when_Axi4LiteCrossbar_l131_14 & (~ _zz_when_Axi4LiteCrossbar_l131_4_3)));
  assign _zz_when_Axi4LiteCrossbar_l131_4_2 = (_zz_when_Axi4LiteCrossbar_l131_13 - 1'b1);
  assign _zz_when_Axi4LiteCrossbar_l131_4_3 = (_zz_when_Axi4LiteCrossbar_l131_14 - 1'b1);
  assign _zz_when_Axi4LiteCrossbar_l131_5_1 = ((|_zz_when_Axi4LiteCrossbar_l131_15) ? (_zz_when_Axi4LiteCrossbar_l131_16 & (~ _zz_when_Axi4LiteCrossbar_l131_5_2)) : (_zz_when_Axi4LiteCrossbar_l131_17 & (~ _zz_when_Axi4LiteCrossbar_l131_5_3)));
  assign _zz_when_Axi4LiteCrossbar_l131_5_2 = (_zz_when_Axi4LiteCrossbar_l131_16 - 1'b1);
  assign _zz_when_Axi4LiteCrossbar_l131_5_3 = (_zz_when_Axi4LiteCrossbar_l131_17 - 1'b1);
  assign _zz_when_Axi4LiteCrossbar_l131_6_1 = ((|_zz_when_Axi4LiteCrossbar_l131_18) ? (_zz_when_Axi4LiteCrossbar_l131_19 & (~ _zz_when_Axi4LiteCrossbar_l131_6_2)) : (_zz_when_Axi4LiteCrossbar_l131_20 & (~ _zz_when_Axi4LiteCrossbar_l131_6_3)));
  assign _zz_when_Axi4LiteCrossbar_l131_6_2 = (_zz_when_Axi4LiteCrossbar_l131_19 - 1'b1);
  assign _zz_when_Axi4LiteCrossbar_l131_6_3 = (_zz_when_Axi4LiteCrossbar_l131_20 - 1'b1);
  assign _zz_when_Axi4LiteCrossbar_l131_7_1 = ((|_zz_when_Axi4LiteCrossbar_l131_21) ? (_zz_when_Axi4LiteCrossbar_l131_22 & (~ _zz_when_Axi4LiteCrossbar_l131_7_2)) : (_zz_when_Axi4LiteCrossbar_l131_23 & (~ _zz_when_Axi4LiteCrossbar_l131_7_3)));
  assign _zz_when_Axi4LiteCrossbar_l131_7_2 = (_zz_when_Axi4LiteCrossbar_l131_22 - 1'b1);
  assign _zz_when_Axi4LiteCrossbar_l131_7_3 = (_zz_when_Axi4LiteCrossbar_l131_23 - 1'b1);
  always @(*) begin
    io_masters_0_aw_ready = 1'b0;
    if(when_Axi4LiteCrossbar_l194) begin
      if(when_Axi4LiteCrossbar_l206) begin
        if(when_Axi4LiteCrossbar_l210) begin
          io_masters_0_aw_ready = io_slaves_0_aw_ready;
        end
      end
    end
    if(when_Axi4LiteCrossbar_l194_1) begin
      if(when_Axi4LiteCrossbar_l206_1) begin
        if(when_Axi4LiteCrossbar_l210_1) begin
          io_masters_0_aw_ready = io_slaves_1_aw_ready;
        end
      end
    end
    if(when_Axi4LiteCrossbar_l194_2) begin
      if(when_Axi4LiteCrossbar_l206_2) begin
        if(when_Axi4LiteCrossbar_l210_2) begin
          io_masters_0_aw_ready = io_slaves_2_aw_ready;
        end
      end
    end
    if(when_Axi4LiteCrossbar_l194_3) begin
      if(when_Axi4LiteCrossbar_l206_3) begin
        if(when_Axi4LiteCrossbar_l210_3) begin
          io_masters_0_aw_ready = io_slaves_3_aw_ready;
        end
      end
    end
  end

  always @(*) begin
    io_masters_0_w_ready = 1'b0;
    if(when_Axi4LiteCrossbar_l194) begin
      if(when_Axi4LiteCrossbar_l206) begin
        if(when_Axi4LiteCrossbar_l210) begin
          io_masters_0_w_ready = io_slaves_0_w_ready;
        end
      end
    end else begin
      if(when_Axi4LiteCrossbar_l262) begin
        io_masters_0_w_ready = io_slaves_0_w_ready;
      end
    end
    if(when_Axi4LiteCrossbar_l194_1) begin
      if(when_Axi4LiteCrossbar_l206_1) begin
        if(when_Axi4LiteCrossbar_l210_1) begin
          io_masters_0_w_ready = io_slaves_1_w_ready;
        end
      end
    end else begin
      if(when_Axi4LiteCrossbar_l262_1) begin
        io_masters_0_w_ready = io_slaves_1_w_ready;
      end
    end
    if(when_Axi4LiteCrossbar_l194_2) begin
      if(when_Axi4LiteCrossbar_l206_2) begin
        if(when_Axi4LiteCrossbar_l210_2) begin
          io_masters_0_w_ready = io_slaves_2_w_ready;
        end
      end
    end else begin
      if(when_Axi4LiteCrossbar_l262_2) begin
        io_masters_0_w_ready = io_slaves_2_w_ready;
      end
    end
    if(when_Axi4LiteCrossbar_l194_3) begin
      if(when_Axi4LiteCrossbar_l206_3) begin
        if(when_Axi4LiteCrossbar_l210_3) begin
          io_masters_0_w_ready = io_slaves_3_w_ready;
        end
      end
    end else begin
      if(when_Axi4LiteCrossbar_l262_3) begin
        io_masters_0_w_ready = io_slaves_3_w_ready;
      end
    end
  end

  always @(*) begin
    io_masters_0_b_valid = 1'b0;
    if(!when_Axi4LiteCrossbar_l194) begin
      if(when_Axi4LiteCrossbar_l262) begin
        io_masters_0_b_valid = io_slaves_0_b_valid;
      end
    end
    if(!when_Axi4LiteCrossbar_l194_1) begin
      if(when_Axi4LiteCrossbar_l262_1) begin
        io_masters_0_b_valid = io_slaves_1_b_valid;
      end
    end
    if(!when_Axi4LiteCrossbar_l194_2) begin
      if(when_Axi4LiteCrossbar_l262_2) begin
        io_masters_0_b_valid = io_slaves_2_b_valid;
      end
    end
    if(!when_Axi4LiteCrossbar_l194_3) begin
      if(when_Axi4LiteCrossbar_l262_3) begin
        io_masters_0_b_valid = io_slaves_3_b_valid;
      end
    end
  end

  always @(*) begin
    io_masters_0_b_payload_resp = _zz_io_masters_0_b_payload_resp[1 : 0];
    if(!when_Axi4LiteCrossbar_l194) begin
      if(when_Axi4LiteCrossbar_l262) begin
        io_masters_0_b_payload_resp = io_slaves_0_b_payload_resp;
      end
    end
    if(!when_Axi4LiteCrossbar_l194_1) begin
      if(when_Axi4LiteCrossbar_l262_1) begin
        io_masters_0_b_payload_resp = io_slaves_1_b_payload_resp;
      end
    end
    if(!when_Axi4LiteCrossbar_l194_2) begin
      if(when_Axi4LiteCrossbar_l262_2) begin
        io_masters_0_b_payload_resp = io_slaves_2_b_payload_resp;
      end
    end
    if(!when_Axi4LiteCrossbar_l194_3) begin
      if(when_Axi4LiteCrossbar_l262_3) begin
        io_masters_0_b_payload_resp = io_slaves_3_b_payload_resp;
      end
    end
  end

  always @(*) begin
    io_masters_0_ar_ready = 1'b0;
    if(when_Axi4LiteCrossbar_l283) begin
      if(when_Axi4LiteCrossbar_l294) begin
        if(when_Axi4LiteCrossbar_l297) begin
          io_masters_0_ar_ready = io_slaves_0_ar_ready;
        end
      end
    end
    if(when_Axi4LiteCrossbar_l283_1) begin
      if(when_Axi4LiteCrossbar_l294_1) begin
        if(when_Axi4LiteCrossbar_l297_1) begin
          io_masters_0_ar_ready = io_slaves_1_ar_ready;
        end
      end
    end
    if(when_Axi4LiteCrossbar_l283_2) begin
      if(when_Axi4LiteCrossbar_l294_2) begin
        if(when_Axi4LiteCrossbar_l297_2) begin
          io_masters_0_ar_ready = io_slaves_2_ar_ready;
        end
      end
    end
    if(when_Axi4LiteCrossbar_l283_3) begin
      if(when_Axi4LiteCrossbar_l294_3) begin
        if(when_Axi4LiteCrossbar_l297_3) begin
          io_masters_0_ar_ready = io_slaves_3_ar_ready;
        end
      end
    end
  end

  always @(*) begin
    io_masters_0_r_valid = 1'b0;
    if(!when_Axi4LiteCrossbar_l283) begin
      if(when_Axi4LiteCrossbar_l340) begin
        io_masters_0_r_valid = io_slaves_0_r_valid;
      end
    end
    if(!when_Axi4LiteCrossbar_l283_1) begin
      if(when_Axi4LiteCrossbar_l340_1) begin
        io_masters_0_r_valid = io_slaves_1_r_valid;
      end
    end
    if(!when_Axi4LiteCrossbar_l283_2) begin
      if(when_Axi4LiteCrossbar_l340_2) begin
        io_masters_0_r_valid = io_slaves_2_r_valid;
      end
    end
    if(!when_Axi4LiteCrossbar_l283_3) begin
      if(when_Axi4LiteCrossbar_l340_3) begin
        io_masters_0_r_valid = io_slaves_3_r_valid;
      end
    end
  end

  assign _zz_io_masters_0_r_payload_data = 34'h000000000;
  always @(*) begin
    io_masters_0_r_payload_data = _zz_io_masters_0_r_payload_data[31 : 0];
    if(!when_Axi4LiteCrossbar_l283) begin
      if(when_Axi4LiteCrossbar_l340) begin
        io_masters_0_r_payload_data = io_slaves_0_r_payload_data;
      end
    end
    if(!when_Axi4LiteCrossbar_l283_1) begin
      if(when_Axi4LiteCrossbar_l340_1) begin
        io_masters_0_r_payload_data = io_slaves_1_r_payload_data;
      end
    end
    if(!when_Axi4LiteCrossbar_l283_2) begin
      if(when_Axi4LiteCrossbar_l340_2) begin
        io_masters_0_r_payload_data = io_slaves_2_r_payload_data;
      end
    end
    if(!when_Axi4LiteCrossbar_l283_3) begin
      if(when_Axi4LiteCrossbar_l340_3) begin
        io_masters_0_r_payload_data = io_slaves_3_r_payload_data;
      end
    end
  end

  always @(*) begin
    io_masters_0_r_payload_resp = _zz_io_masters_0_r_payload_data[33 : 32];
    if(!when_Axi4LiteCrossbar_l283) begin
      if(when_Axi4LiteCrossbar_l340) begin
        io_masters_0_r_payload_resp = io_slaves_0_r_payload_resp;
      end
    end
    if(!when_Axi4LiteCrossbar_l283_1) begin
      if(when_Axi4LiteCrossbar_l340_1) begin
        io_masters_0_r_payload_resp = io_slaves_1_r_payload_resp;
      end
    end
    if(!when_Axi4LiteCrossbar_l283_2) begin
      if(when_Axi4LiteCrossbar_l340_2) begin
        io_masters_0_r_payload_resp = io_slaves_2_r_payload_resp;
      end
    end
    if(!when_Axi4LiteCrossbar_l283_3) begin
      if(when_Axi4LiteCrossbar_l340_3) begin
        io_masters_0_r_payload_resp = io_slaves_3_r_payload_resp;
      end
    end
  end

  always @(*) begin
    io_slaves_0_aw_valid = 1'b0;
    if(when_Axi4LiteCrossbar_l194) begin
      if(when_Axi4LiteCrossbar_l206) begin
        io_slaves_0_aw_valid = 1'b1;
      end
    end
  end

  assign _zz_io_slaves_0_aw_payload_addr = 35'h000000000;
  always @(*) begin
    io_slaves_0_aw_payload_addr = _zz_io_slaves_0_aw_payload_addr[31 : 0];
    if(when_Axi4LiteCrossbar_l194) begin
      if(when_Axi4LiteCrossbar_l206) begin
        if(when_Axi4LiteCrossbar_l210) begin
          io_slaves_0_aw_payload_addr = io_masters_0_aw_payload_addr;
        end
      end
    end
  end

  always @(*) begin
    io_slaves_0_aw_payload_prot = _zz_io_slaves_0_aw_payload_addr[34 : 32];
    if(when_Axi4LiteCrossbar_l194) begin
      if(when_Axi4LiteCrossbar_l206) begin
        if(when_Axi4LiteCrossbar_l210) begin
          io_slaves_0_aw_payload_prot = io_masters_0_aw_payload_prot;
        end
      end
    end
  end

  always @(*) begin
    io_slaves_0_w_valid = 1'b0;
    if(when_Axi4LiteCrossbar_l194) begin
      if(when_Axi4LiteCrossbar_l206) begin
        if(when_Axi4LiteCrossbar_l210) begin
          io_slaves_0_w_valid = io_masters_0_w_valid;
        end
      end
    end else begin
      if(when_Axi4LiteCrossbar_l262) begin
        io_slaves_0_w_valid = io_masters_0_w_valid;
      end
    end
  end

  assign _zz_io_slaves_0_w_payload_data = 36'h000000000;
  always @(*) begin
    io_slaves_0_w_payload_data = _zz_io_slaves_0_w_payload_data[31 : 0];
    if(when_Axi4LiteCrossbar_l194) begin
      if(when_Axi4LiteCrossbar_l206) begin
        if(when_Axi4LiteCrossbar_l210) begin
          io_slaves_0_w_payload_data = io_masters_0_w_payload_data;
        end
      end
    end else begin
      if(when_Axi4LiteCrossbar_l262) begin
        io_slaves_0_w_payload_data = io_masters_0_w_payload_data;
      end
    end
  end

  always @(*) begin
    io_slaves_0_w_payload_strb = _zz_io_slaves_0_w_payload_data[35 : 32];
    if(when_Axi4LiteCrossbar_l194) begin
      if(when_Axi4LiteCrossbar_l206) begin
        if(when_Axi4LiteCrossbar_l210) begin
          io_slaves_0_w_payload_strb = io_masters_0_w_payload_strb;
        end
      end
    end else begin
      if(when_Axi4LiteCrossbar_l262) begin
        io_slaves_0_w_payload_strb = io_masters_0_w_payload_strb;
      end
    end
  end

  always @(*) begin
    io_slaves_0_b_ready = 1'b0;
    if(!when_Axi4LiteCrossbar_l194) begin
      if(when_Axi4LiteCrossbar_l262) begin
        io_slaves_0_b_ready = io_masters_0_b_ready;
      end
    end
  end

  always @(*) begin
    io_slaves_0_ar_valid = 1'b0;
    if(when_Axi4LiteCrossbar_l283) begin
      if(when_Axi4LiteCrossbar_l294) begin
        io_slaves_0_ar_valid = 1'b1;
      end
    end
  end

  assign _zz_io_slaves_0_ar_payload_addr = 35'h000000000;
  always @(*) begin
    io_slaves_0_ar_payload_addr = _zz_io_slaves_0_ar_payload_addr[31 : 0];
    if(when_Axi4LiteCrossbar_l283) begin
      if(when_Axi4LiteCrossbar_l294) begin
        if(when_Axi4LiteCrossbar_l297) begin
          io_slaves_0_ar_payload_addr = io_masters_0_ar_payload_addr;
        end
      end
    end
  end

  always @(*) begin
    io_slaves_0_ar_payload_prot = _zz_io_slaves_0_ar_payload_addr[34 : 32];
    if(when_Axi4LiteCrossbar_l283) begin
      if(when_Axi4LiteCrossbar_l294) begin
        if(when_Axi4LiteCrossbar_l297) begin
          io_slaves_0_ar_payload_prot = io_masters_0_ar_payload_prot;
        end
      end
    end
  end

  always @(*) begin
    io_slaves_0_r_ready = 1'b0;
    if(!when_Axi4LiteCrossbar_l283) begin
      if(when_Axi4LiteCrossbar_l340) begin
        io_slaves_0_r_ready = io_masters_0_r_ready;
      end
    end
  end

  always @(*) begin
    io_slaves_1_aw_valid = 1'b0;
    if(when_Axi4LiteCrossbar_l194_1) begin
      if(when_Axi4LiteCrossbar_l206_1) begin
        io_slaves_1_aw_valid = 1'b1;
      end
    end
  end

  assign _zz_io_slaves_1_aw_payload_addr = 35'h000000000;
  always @(*) begin
    io_slaves_1_aw_payload_addr = _zz_io_slaves_1_aw_payload_addr[31 : 0];
    if(when_Axi4LiteCrossbar_l194_1) begin
      if(when_Axi4LiteCrossbar_l206_1) begin
        if(when_Axi4LiteCrossbar_l210_1) begin
          io_slaves_1_aw_payload_addr = io_masters_0_aw_payload_addr;
        end
      end
    end
  end

  always @(*) begin
    io_slaves_1_aw_payload_prot = _zz_io_slaves_1_aw_payload_addr[34 : 32];
    if(when_Axi4LiteCrossbar_l194_1) begin
      if(when_Axi4LiteCrossbar_l206_1) begin
        if(when_Axi4LiteCrossbar_l210_1) begin
          io_slaves_1_aw_payload_prot = io_masters_0_aw_payload_prot;
        end
      end
    end
  end

  always @(*) begin
    io_slaves_1_w_valid = 1'b0;
    if(when_Axi4LiteCrossbar_l194_1) begin
      if(when_Axi4LiteCrossbar_l206_1) begin
        if(when_Axi4LiteCrossbar_l210_1) begin
          io_slaves_1_w_valid = io_masters_0_w_valid;
        end
      end
    end else begin
      if(when_Axi4LiteCrossbar_l262_1) begin
        io_slaves_1_w_valid = io_masters_0_w_valid;
      end
    end
  end

  assign _zz_io_slaves_1_w_payload_data = 36'h000000000;
  always @(*) begin
    io_slaves_1_w_payload_data = _zz_io_slaves_1_w_payload_data[31 : 0];
    if(when_Axi4LiteCrossbar_l194_1) begin
      if(when_Axi4LiteCrossbar_l206_1) begin
        if(when_Axi4LiteCrossbar_l210_1) begin
          io_slaves_1_w_payload_data = io_masters_0_w_payload_data;
        end
      end
    end else begin
      if(when_Axi4LiteCrossbar_l262_1) begin
        io_slaves_1_w_payload_data = io_masters_0_w_payload_data;
      end
    end
  end

  always @(*) begin
    io_slaves_1_w_payload_strb = _zz_io_slaves_1_w_payload_data[35 : 32];
    if(when_Axi4LiteCrossbar_l194_1) begin
      if(when_Axi4LiteCrossbar_l206_1) begin
        if(when_Axi4LiteCrossbar_l210_1) begin
          io_slaves_1_w_payload_strb = io_masters_0_w_payload_strb;
        end
      end
    end else begin
      if(when_Axi4LiteCrossbar_l262_1) begin
        io_slaves_1_w_payload_strb = io_masters_0_w_payload_strb;
      end
    end
  end

  always @(*) begin
    io_slaves_1_b_ready = 1'b0;
    if(!when_Axi4LiteCrossbar_l194_1) begin
      if(when_Axi4LiteCrossbar_l262_1) begin
        io_slaves_1_b_ready = io_masters_0_b_ready;
      end
    end
  end

  always @(*) begin
    io_slaves_1_ar_valid = 1'b0;
    if(when_Axi4LiteCrossbar_l283_1) begin
      if(when_Axi4LiteCrossbar_l294_1) begin
        io_slaves_1_ar_valid = 1'b1;
      end
    end
  end

  assign _zz_io_slaves_1_ar_payload_addr = 35'h000000000;
  always @(*) begin
    io_slaves_1_ar_payload_addr = _zz_io_slaves_1_ar_payload_addr[31 : 0];
    if(when_Axi4LiteCrossbar_l283_1) begin
      if(when_Axi4LiteCrossbar_l294_1) begin
        if(when_Axi4LiteCrossbar_l297_1) begin
          io_slaves_1_ar_payload_addr = io_masters_0_ar_payload_addr;
        end
      end
    end
  end

  always @(*) begin
    io_slaves_1_ar_payload_prot = _zz_io_slaves_1_ar_payload_addr[34 : 32];
    if(when_Axi4LiteCrossbar_l283_1) begin
      if(when_Axi4LiteCrossbar_l294_1) begin
        if(when_Axi4LiteCrossbar_l297_1) begin
          io_slaves_1_ar_payload_prot = io_masters_0_ar_payload_prot;
        end
      end
    end
  end

  always @(*) begin
    io_slaves_1_r_ready = 1'b0;
    if(!when_Axi4LiteCrossbar_l283_1) begin
      if(when_Axi4LiteCrossbar_l340_1) begin
        io_slaves_1_r_ready = io_masters_0_r_ready;
      end
    end
  end

  always @(*) begin
    io_slaves_2_aw_valid = 1'b0;
    if(when_Axi4LiteCrossbar_l194_2) begin
      if(when_Axi4LiteCrossbar_l206_2) begin
        io_slaves_2_aw_valid = 1'b1;
      end
    end
  end

  assign _zz_io_slaves_2_aw_payload_addr = 35'h000000000;
  always @(*) begin
    io_slaves_2_aw_payload_addr = _zz_io_slaves_2_aw_payload_addr[31 : 0];
    if(when_Axi4LiteCrossbar_l194_2) begin
      if(when_Axi4LiteCrossbar_l206_2) begin
        if(when_Axi4LiteCrossbar_l210_2) begin
          io_slaves_2_aw_payload_addr = io_masters_0_aw_payload_addr;
        end
      end
    end
  end

  always @(*) begin
    io_slaves_2_aw_payload_prot = _zz_io_slaves_2_aw_payload_addr[34 : 32];
    if(when_Axi4LiteCrossbar_l194_2) begin
      if(when_Axi4LiteCrossbar_l206_2) begin
        if(when_Axi4LiteCrossbar_l210_2) begin
          io_slaves_2_aw_payload_prot = io_masters_0_aw_payload_prot;
        end
      end
    end
  end

  always @(*) begin
    io_slaves_2_w_valid = 1'b0;
    if(when_Axi4LiteCrossbar_l194_2) begin
      if(when_Axi4LiteCrossbar_l206_2) begin
        if(when_Axi4LiteCrossbar_l210_2) begin
          io_slaves_2_w_valid = io_masters_0_w_valid;
        end
      end
    end else begin
      if(when_Axi4LiteCrossbar_l262_2) begin
        io_slaves_2_w_valid = io_masters_0_w_valid;
      end
    end
  end

  assign _zz_io_slaves_2_w_payload_data = 36'h000000000;
  always @(*) begin
    io_slaves_2_w_payload_data = _zz_io_slaves_2_w_payload_data[31 : 0];
    if(when_Axi4LiteCrossbar_l194_2) begin
      if(when_Axi4LiteCrossbar_l206_2) begin
        if(when_Axi4LiteCrossbar_l210_2) begin
          io_slaves_2_w_payload_data = io_masters_0_w_payload_data;
        end
      end
    end else begin
      if(when_Axi4LiteCrossbar_l262_2) begin
        io_slaves_2_w_payload_data = io_masters_0_w_payload_data;
      end
    end
  end

  always @(*) begin
    io_slaves_2_w_payload_strb = _zz_io_slaves_2_w_payload_data[35 : 32];
    if(when_Axi4LiteCrossbar_l194_2) begin
      if(when_Axi4LiteCrossbar_l206_2) begin
        if(when_Axi4LiteCrossbar_l210_2) begin
          io_slaves_2_w_payload_strb = io_masters_0_w_payload_strb;
        end
      end
    end else begin
      if(when_Axi4LiteCrossbar_l262_2) begin
        io_slaves_2_w_payload_strb = io_masters_0_w_payload_strb;
      end
    end
  end

  always @(*) begin
    io_slaves_2_b_ready = 1'b0;
    if(!when_Axi4LiteCrossbar_l194_2) begin
      if(when_Axi4LiteCrossbar_l262_2) begin
        io_slaves_2_b_ready = io_masters_0_b_ready;
      end
    end
  end

  always @(*) begin
    io_slaves_2_ar_valid = 1'b0;
    if(when_Axi4LiteCrossbar_l283_2) begin
      if(when_Axi4LiteCrossbar_l294_2) begin
        io_slaves_2_ar_valid = 1'b1;
      end
    end
  end

  assign _zz_io_slaves_2_ar_payload_addr = 35'h000000000;
  always @(*) begin
    io_slaves_2_ar_payload_addr = _zz_io_slaves_2_ar_payload_addr[31 : 0];
    if(when_Axi4LiteCrossbar_l283_2) begin
      if(when_Axi4LiteCrossbar_l294_2) begin
        if(when_Axi4LiteCrossbar_l297_2) begin
          io_slaves_2_ar_payload_addr = io_masters_0_ar_payload_addr;
        end
      end
    end
  end

  always @(*) begin
    io_slaves_2_ar_payload_prot = _zz_io_slaves_2_ar_payload_addr[34 : 32];
    if(when_Axi4LiteCrossbar_l283_2) begin
      if(when_Axi4LiteCrossbar_l294_2) begin
        if(when_Axi4LiteCrossbar_l297_2) begin
          io_slaves_2_ar_payload_prot = io_masters_0_ar_payload_prot;
        end
      end
    end
  end

  always @(*) begin
    io_slaves_2_r_ready = 1'b0;
    if(!when_Axi4LiteCrossbar_l283_2) begin
      if(when_Axi4LiteCrossbar_l340_2) begin
        io_slaves_2_r_ready = io_masters_0_r_ready;
      end
    end
  end

  always @(*) begin
    io_slaves_3_aw_valid = 1'b0;
    if(when_Axi4LiteCrossbar_l194_3) begin
      if(when_Axi4LiteCrossbar_l206_3) begin
        io_slaves_3_aw_valid = 1'b1;
      end
    end
  end

  assign _zz_io_slaves_3_aw_payload_addr = 35'h000000000;
  always @(*) begin
    io_slaves_3_aw_payload_addr = _zz_io_slaves_3_aw_payload_addr[31 : 0];
    if(when_Axi4LiteCrossbar_l194_3) begin
      if(when_Axi4LiteCrossbar_l206_3) begin
        if(when_Axi4LiteCrossbar_l210_3) begin
          io_slaves_3_aw_payload_addr = io_masters_0_aw_payload_addr;
        end
      end
    end
  end

  always @(*) begin
    io_slaves_3_aw_payload_prot = _zz_io_slaves_3_aw_payload_addr[34 : 32];
    if(when_Axi4LiteCrossbar_l194_3) begin
      if(when_Axi4LiteCrossbar_l206_3) begin
        if(when_Axi4LiteCrossbar_l210_3) begin
          io_slaves_3_aw_payload_prot = io_masters_0_aw_payload_prot;
        end
      end
    end
  end

  always @(*) begin
    io_slaves_3_w_valid = 1'b0;
    if(when_Axi4LiteCrossbar_l194_3) begin
      if(when_Axi4LiteCrossbar_l206_3) begin
        if(when_Axi4LiteCrossbar_l210_3) begin
          io_slaves_3_w_valid = io_masters_0_w_valid;
        end
      end
    end else begin
      if(when_Axi4LiteCrossbar_l262_3) begin
        io_slaves_3_w_valid = io_masters_0_w_valid;
      end
    end
  end

  assign _zz_io_slaves_3_w_payload_data = 36'h000000000;
  always @(*) begin
    io_slaves_3_w_payload_data = _zz_io_slaves_3_w_payload_data[31 : 0];
    if(when_Axi4LiteCrossbar_l194_3) begin
      if(when_Axi4LiteCrossbar_l206_3) begin
        if(when_Axi4LiteCrossbar_l210_3) begin
          io_slaves_3_w_payload_data = io_masters_0_w_payload_data;
        end
      end
    end else begin
      if(when_Axi4LiteCrossbar_l262_3) begin
        io_slaves_3_w_payload_data = io_masters_0_w_payload_data;
      end
    end
  end

  always @(*) begin
    io_slaves_3_w_payload_strb = _zz_io_slaves_3_w_payload_data[35 : 32];
    if(when_Axi4LiteCrossbar_l194_3) begin
      if(when_Axi4LiteCrossbar_l206_3) begin
        if(when_Axi4LiteCrossbar_l210_3) begin
          io_slaves_3_w_payload_strb = io_masters_0_w_payload_strb;
        end
      end
    end else begin
      if(when_Axi4LiteCrossbar_l262_3) begin
        io_slaves_3_w_payload_strb = io_masters_0_w_payload_strb;
      end
    end
  end

  always @(*) begin
    io_slaves_3_b_ready = 1'b0;
    if(!when_Axi4LiteCrossbar_l194_3) begin
      if(when_Axi4LiteCrossbar_l262_3) begin
        io_slaves_3_b_ready = io_masters_0_b_ready;
      end
    end
  end

  always @(*) begin
    io_slaves_3_ar_valid = 1'b0;
    if(when_Axi4LiteCrossbar_l283_3) begin
      if(when_Axi4LiteCrossbar_l294_3) begin
        io_slaves_3_ar_valid = 1'b1;
      end
    end
  end

  assign _zz_io_slaves_3_ar_payload_addr = 35'h000000000;
  always @(*) begin
    io_slaves_3_ar_payload_addr = _zz_io_slaves_3_ar_payload_addr[31 : 0];
    if(when_Axi4LiteCrossbar_l283_3) begin
      if(when_Axi4LiteCrossbar_l294_3) begin
        if(when_Axi4LiteCrossbar_l297_3) begin
          io_slaves_3_ar_payload_addr = io_masters_0_ar_payload_addr;
        end
      end
    end
  end

  always @(*) begin
    io_slaves_3_ar_payload_prot = _zz_io_slaves_3_ar_payload_addr[34 : 32];
    if(when_Axi4LiteCrossbar_l283_3) begin
      if(when_Axi4LiteCrossbar_l294_3) begin
        if(when_Axi4LiteCrossbar_l297_3) begin
          io_slaves_3_ar_payload_prot = io_masters_0_ar_payload_prot;
        end
      end
    end
  end

  always @(*) begin
    io_slaves_3_r_ready = 1'b0;
    if(!when_Axi4LiteCrossbar_l283_3) begin
      if(when_Axi4LiteCrossbar_l340_3) begin
        io_slaves_3_r_ready = io_masters_0_r_ready;
      end
    end
  end

  assign when_Axi4LiteCrossbar_l194 = (! wrActive_0);
  always @(*) begin
    _zz_when_Axi4LiteCrossbar_l206_1[0] = ((32'h00000000 <= io_masters_0_aw_payload_addr) && (io_masters_0_aw_payload_addr < 32'h00001000));
    _zz_when_Axi4LiteCrossbar_l206_1[1] = ((32'h00010000 <= io_masters_0_aw_payload_addr) && (io_masters_0_aw_payload_addr < 32'h00011000));
    _zz_when_Axi4LiteCrossbar_l206_1[2] = ((32'h00020000 <= io_masters_0_aw_payload_addr) && (io_masters_0_aw_payload_addr < 32'h00021000));
    _zz_when_Axi4LiteCrossbar_l206_1[3] = ((32'h00030000 <= io_masters_0_aw_payload_addr) && (io_masters_0_aw_payload_addr < 32'h00031000));
  end

  assign _zz_when_Axi4LiteCrossbar_l206[0] = (io_masters_0_aw_valid && _zz_when_Axi4LiteCrossbar_l206_1[0]);
  assign _zz_when_Axi4LiteCrossbar_l131 = (_zz_when_Axi4LiteCrossbar_l206 & (~ 1'b0));
  assign _zz_when_Axi4LiteCrossbar_l131_1 = _zz_when_Axi4LiteCrossbar_l131;
  assign _zz_when_Axi4LiteCrossbar_l131_2 = _zz_when_Axi4LiteCrossbar_l206;
  always @(*) begin
    _zz_wrGranted_0 = 1'b0;
    if(when_Axi4LiteCrossbar_l131) begin
      _zz_wrGranted_0 = 1'b0;
    end
  end

  assign when_Axi4LiteCrossbar_l131 = _zz_when_Axi4LiteCrossbar_l131_24[0];
  assign when_Axi4LiteCrossbar_l206 = (|_zz_when_Axi4LiteCrossbar_l206);
  assign when_Axi4LiteCrossbar_l210 = (_zz_wrGranted_0 == 1'b0);
  assign io_slaves_0_aw_fire = (io_slaves_0_aw_valid && io_slaves_0_aw_ready);
  assign when_Axi4LiteCrossbar_l262 = (wrGranted_0 == 1'b0);
  assign io_slaves_0_b_fire = (io_slaves_0_b_valid && io_slaves_0_b_ready);
  assign when_Axi4LiteCrossbar_l194_1 = (! wrActive_1);
  always @(*) begin
    _zz_when_Axi4LiteCrossbar_l206_3[0] = ((32'h00000000 <= io_masters_0_aw_payload_addr) && (io_masters_0_aw_payload_addr < 32'h00001000));
    _zz_when_Axi4LiteCrossbar_l206_3[1] = ((32'h00010000 <= io_masters_0_aw_payload_addr) && (io_masters_0_aw_payload_addr < 32'h00011000));
    _zz_when_Axi4LiteCrossbar_l206_3[2] = ((32'h00020000 <= io_masters_0_aw_payload_addr) && (io_masters_0_aw_payload_addr < 32'h00021000));
    _zz_when_Axi4LiteCrossbar_l206_3[3] = ((32'h00030000 <= io_masters_0_aw_payload_addr) && (io_masters_0_aw_payload_addr < 32'h00031000));
  end

  assign _zz_when_Axi4LiteCrossbar_l206_2[0] = (io_masters_0_aw_valid && _zz_when_Axi4LiteCrossbar_l206_3[1]);
  assign _zz_when_Axi4LiteCrossbar_l131_3 = (_zz_when_Axi4LiteCrossbar_l206_2 & (~ 1'b0));
  assign _zz_when_Axi4LiteCrossbar_l131_4 = _zz_when_Axi4LiteCrossbar_l131_3;
  assign _zz_when_Axi4LiteCrossbar_l131_5 = _zz_when_Axi4LiteCrossbar_l206_2;
  always @(*) begin
    _zz_wrGranted_1 = 1'b0;
    if(when_Axi4LiteCrossbar_l131_1) begin
      _zz_wrGranted_1 = 1'b0;
    end
  end

  assign when_Axi4LiteCrossbar_l131_1 = _zz_when_Axi4LiteCrossbar_l131_1_1[0];
  assign when_Axi4LiteCrossbar_l206_1 = (|_zz_when_Axi4LiteCrossbar_l206_2);
  assign when_Axi4LiteCrossbar_l210_1 = (_zz_wrGranted_1 == 1'b0);
  assign io_slaves_1_aw_fire = (io_slaves_1_aw_valid && io_slaves_1_aw_ready);
  assign when_Axi4LiteCrossbar_l262_1 = (wrGranted_1 == 1'b0);
  assign io_slaves_1_b_fire = (io_slaves_1_b_valid && io_slaves_1_b_ready);
  assign when_Axi4LiteCrossbar_l194_2 = (! wrActive_2);
  always @(*) begin
    _zz_when_Axi4LiteCrossbar_l206_5[0] = ((32'h00000000 <= io_masters_0_aw_payload_addr) && (io_masters_0_aw_payload_addr < 32'h00001000));
    _zz_when_Axi4LiteCrossbar_l206_5[1] = ((32'h00010000 <= io_masters_0_aw_payload_addr) && (io_masters_0_aw_payload_addr < 32'h00011000));
    _zz_when_Axi4LiteCrossbar_l206_5[2] = ((32'h00020000 <= io_masters_0_aw_payload_addr) && (io_masters_0_aw_payload_addr < 32'h00021000));
    _zz_when_Axi4LiteCrossbar_l206_5[3] = ((32'h00030000 <= io_masters_0_aw_payload_addr) && (io_masters_0_aw_payload_addr < 32'h00031000));
  end

  assign _zz_when_Axi4LiteCrossbar_l206_4[0] = (io_masters_0_aw_valid && _zz_when_Axi4LiteCrossbar_l206_5[2]);
  assign _zz_when_Axi4LiteCrossbar_l131_6 = (_zz_when_Axi4LiteCrossbar_l206_4 & (~ 1'b0));
  assign _zz_when_Axi4LiteCrossbar_l131_7 = _zz_when_Axi4LiteCrossbar_l131_6;
  assign _zz_when_Axi4LiteCrossbar_l131_8 = _zz_when_Axi4LiteCrossbar_l206_4;
  always @(*) begin
    _zz_wrGranted_2 = 1'b0;
    if(when_Axi4LiteCrossbar_l131_2) begin
      _zz_wrGranted_2 = 1'b0;
    end
  end

  assign when_Axi4LiteCrossbar_l131_2 = _zz_when_Axi4LiteCrossbar_l131_2_1[0];
  assign when_Axi4LiteCrossbar_l206_2 = (|_zz_when_Axi4LiteCrossbar_l206_4);
  assign when_Axi4LiteCrossbar_l210_2 = (_zz_wrGranted_2 == 1'b0);
  assign io_slaves_2_aw_fire = (io_slaves_2_aw_valid && io_slaves_2_aw_ready);
  assign when_Axi4LiteCrossbar_l262_2 = (wrGranted_2 == 1'b0);
  assign io_slaves_2_b_fire = (io_slaves_2_b_valid && io_slaves_2_b_ready);
  assign when_Axi4LiteCrossbar_l194_3 = (! wrActive_3);
  always @(*) begin
    _zz_when_Axi4LiteCrossbar_l206_7[0] = ((32'h00000000 <= io_masters_0_aw_payload_addr) && (io_masters_0_aw_payload_addr < 32'h00001000));
    _zz_when_Axi4LiteCrossbar_l206_7[1] = ((32'h00010000 <= io_masters_0_aw_payload_addr) && (io_masters_0_aw_payload_addr < 32'h00011000));
    _zz_when_Axi4LiteCrossbar_l206_7[2] = ((32'h00020000 <= io_masters_0_aw_payload_addr) && (io_masters_0_aw_payload_addr < 32'h00021000));
    _zz_when_Axi4LiteCrossbar_l206_7[3] = ((32'h00030000 <= io_masters_0_aw_payload_addr) && (io_masters_0_aw_payload_addr < 32'h00031000));
  end

  assign _zz_when_Axi4LiteCrossbar_l206_6[0] = (io_masters_0_aw_valid && _zz_when_Axi4LiteCrossbar_l206_7[3]);
  assign _zz_when_Axi4LiteCrossbar_l131_9 = (_zz_when_Axi4LiteCrossbar_l206_6 & (~ 1'b0));
  assign _zz_when_Axi4LiteCrossbar_l131_10 = _zz_when_Axi4LiteCrossbar_l131_9;
  assign _zz_when_Axi4LiteCrossbar_l131_11 = _zz_when_Axi4LiteCrossbar_l206_6;
  always @(*) begin
    _zz_wrGranted_3 = 1'b0;
    if(when_Axi4LiteCrossbar_l131_3) begin
      _zz_wrGranted_3 = 1'b0;
    end
  end

  assign when_Axi4LiteCrossbar_l131_3 = _zz_when_Axi4LiteCrossbar_l131_3_1[0];
  assign when_Axi4LiteCrossbar_l206_3 = (|_zz_when_Axi4LiteCrossbar_l206_6);
  assign when_Axi4LiteCrossbar_l210_3 = (_zz_wrGranted_3 == 1'b0);
  assign io_slaves_3_aw_fire = (io_slaves_3_aw_valid && io_slaves_3_aw_ready);
  assign when_Axi4LiteCrossbar_l262_3 = (wrGranted_3 == 1'b0);
  assign io_slaves_3_b_fire = (io_slaves_3_b_valid && io_slaves_3_b_ready);
  assign when_Axi4LiteCrossbar_l283 = (! rdActive_0);
  always @(*) begin
    _zz_when_Axi4LiteCrossbar_l294_1[0] = ((32'h00000000 <= io_masters_0_ar_payload_addr) && (io_masters_0_ar_payload_addr < 32'h00001000));
    _zz_when_Axi4LiteCrossbar_l294_1[1] = ((32'h00010000 <= io_masters_0_ar_payload_addr) && (io_masters_0_ar_payload_addr < 32'h00011000));
    _zz_when_Axi4LiteCrossbar_l294_1[2] = ((32'h00020000 <= io_masters_0_ar_payload_addr) && (io_masters_0_ar_payload_addr < 32'h00021000));
    _zz_when_Axi4LiteCrossbar_l294_1[3] = ((32'h00030000 <= io_masters_0_ar_payload_addr) && (io_masters_0_ar_payload_addr < 32'h00031000));
  end

  assign _zz_when_Axi4LiteCrossbar_l294[0] = (io_masters_0_ar_valid && _zz_when_Axi4LiteCrossbar_l294_1[0]);
  assign _zz_when_Axi4LiteCrossbar_l131_12 = (_zz_when_Axi4LiteCrossbar_l294 & (~ 1'b0));
  assign _zz_when_Axi4LiteCrossbar_l131_13 = _zz_when_Axi4LiteCrossbar_l131_12;
  assign _zz_when_Axi4LiteCrossbar_l131_14 = _zz_when_Axi4LiteCrossbar_l294;
  always @(*) begin
    _zz_rdGranted_0 = 1'b0;
    if(when_Axi4LiteCrossbar_l131_4) begin
      _zz_rdGranted_0 = 1'b0;
    end
  end

  assign when_Axi4LiteCrossbar_l131_4 = _zz_when_Axi4LiteCrossbar_l131_4_1[0];
  assign when_Axi4LiteCrossbar_l294 = (|_zz_when_Axi4LiteCrossbar_l294);
  assign when_Axi4LiteCrossbar_l297 = (_zz_rdGranted_0 == 1'b0);
  assign io_slaves_0_ar_fire = (io_slaves_0_ar_valid && io_slaves_0_ar_ready);
  assign when_Axi4LiteCrossbar_l340 = (rdGranted_0 == 1'b0);
  assign io_slaves_0_r_fire = (io_slaves_0_r_valid && io_slaves_0_r_ready);
  assign when_Axi4LiteCrossbar_l283_1 = (! rdActive_1);
  always @(*) begin
    _zz_when_Axi4LiteCrossbar_l294_3[0] = ((32'h00000000 <= io_masters_0_ar_payload_addr) && (io_masters_0_ar_payload_addr < 32'h00001000));
    _zz_when_Axi4LiteCrossbar_l294_3[1] = ((32'h00010000 <= io_masters_0_ar_payload_addr) && (io_masters_0_ar_payload_addr < 32'h00011000));
    _zz_when_Axi4LiteCrossbar_l294_3[2] = ((32'h00020000 <= io_masters_0_ar_payload_addr) && (io_masters_0_ar_payload_addr < 32'h00021000));
    _zz_when_Axi4LiteCrossbar_l294_3[3] = ((32'h00030000 <= io_masters_0_ar_payload_addr) && (io_masters_0_ar_payload_addr < 32'h00031000));
  end

  assign _zz_when_Axi4LiteCrossbar_l294_2[0] = (io_masters_0_ar_valid && _zz_when_Axi4LiteCrossbar_l294_3[1]);
  assign _zz_when_Axi4LiteCrossbar_l131_15 = (_zz_when_Axi4LiteCrossbar_l294_2 & (~ 1'b0));
  assign _zz_when_Axi4LiteCrossbar_l131_16 = _zz_when_Axi4LiteCrossbar_l131_15;
  assign _zz_when_Axi4LiteCrossbar_l131_17 = _zz_when_Axi4LiteCrossbar_l294_2;
  always @(*) begin
    _zz_rdGranted_1 = 1'b0;
    if(when_Axi4LiteCrossbar_l131_5) begin
      _zz_rdGranted_1 = 1'b0;
    end
  end

  assign when_Axi4LiteCrossbar_l131_5 = _zz_when_Axi4LiteCrossbar_l131_5_1[0];
  assign when_Axi4LiteCrossbar_l294_1 = (|_zz_when_Axi4LiteCrossbar_l294_2);
  assign when_Axi4LiteCrossbar_l297_1 = (_zz_rdGranted_1 == 1'b0);
  assign io_slaves_1_ar_fire = (io_slaves_1_ar_valid && io_slaves_1_ar_ready);
  assign when_Axi4LiteCrossbar_l340_1 = (rdGranted_1 == 1'b0);
  assign io_slaves_1_r_fire = (io_slaves_1_r_valid && io_slaves_1_r_ready);
  assign when_Axi4LiteCrossbar_l283_2 = (! rdActive_2);
  always @(*) begin
    _zz_when_Axi4LiteCrossbar_l294_5[0] = ((32'h00000000 <= io_masters_0_ar_payload_addr) && (io_masters_0_ar_payload_addr < 32'h00001000));
    _zz_when_Axi4LiteCrossbar_l294_5[1] = ((32'h00010000 <= io_masters_0_ar_payload_addr) && (io_masters_0_ar_payload_addr < 32'h00011000));
    _zz_when_Axi4LiteCrossbar_l294_5[2] = ((32'h00020000 <= io_masters_0_ar_payload_addr) && (io_masters_0_ar_payload_addr < 32'h00021000));
    _zz_when_Axi4LiteCrossbar_l294_5[3] = ((32'h00030000 <= io_masters_0_ar_payload_addr) && (io_masters_0_ar_payload_addr < 32'h00031000));
  end

  assign _zz_when_Axi4LiteCrossbar_l294_4[0] = (io_masters_0_ar_valid && _zz_when_Axi4LiteCrossbar_l294_5[2]);
  assign _zz_when_Axi4LiteCrossbar_l131_18 = (_zz_when_Axi4LiteCrossbar_l294_4 & (~ 1'b0));
  assign _zz_when_Axi4LiteCrossbar_l131_19 = _zz_when_Axi4LiteCrossbar_l131_18;
  assign _zz_when_Axi4LiteCrossbar_l131_20 = _zz_when_Axi4LiteCrossbar_l294_4;
  always @(*) begin
    _zz_rdGranted_2 = 1'b0;
    if(when_Axi4LiteCrossbar_l131_6) begin
      _zz_rdGranted_2 = 1'b0;
    end
  end

  assign when_Axi4LiteCrossbar_l131_6 = _zz_when_Axi4LiteCrossbar_l131_6_1[0];
  assign when_Axi4LiteCrossbar_l294_2 = (|_zz_when_Axi4LiteCrossbar_l294_4);
  assign when_Axi4LiteCrossbar_l297_2 = (_zz_rdGranted_2 == 1'b0);
  assign io_slaves_2_ar_fire = (io_slaves_2_ar_valid && io_slaves_2_ar_ready);
  assign when_Axi4LiteCrossbar_l340_2 = (rdGranted_2 == 1'b0);
  assign io_slaves_2_r_fire = (io_slaves_2_r_valid && io_slaves_2_r_ready);
  assign when_Axi4LiteCrossbar_l283_3 = (! rdActive_3);
  always @(*) begin
    _zz_when_Axi4LiteCrossbar_l294_7[0] = ((32'h00000000 <= io_masters_0_ar_payload_addr) && (io_masters_0_ar_payload_addr < 32'h00001000));
    _zz_when_Axi4LiteCrossbar_l294_7[1] = ((32'h00010000 <= io_masters_0_ar_payload_addr) && (io_masters_0_ar_payload_addr < 32'h00011000));
    _zz_when_Axi4LiteCrossbar_l294_7[2] = ((32'h00020000 <= io_masters_0_ar_payload_addr) && (io_masters_0_ar_payload_addr < 32'h00021000));
    _zz_when_Axi4LiteCrossbar_l294_7[3] = ((32'h00030000 <= io_masters_0_ar_payload_addr) && (io_masters_0_ar_payload_addr < 32'h00031000));
  end

  assign _zz_when_Axi4LiteCrossbar_l294_6[0] = (io_masters_0_ar_valid && _zz_when_Axi4LiteCrossbar_l294_7[3]);
  assign _zz_when_Axi4LiteCrossbar_l131_21 = (_zz_when_Axi4LiteCrossbar_l294_6 & (~ 1'b0));
  assign _zz_when_Axi4LiteCrossbar_l131_22 = _zz_when_Axi4LiteCrossbar_l131_21;
  assign _zz_when_Axi4LiteCrossbar_l131_23 = _zz_when_Axi4LiteCrossbar_l294_6;
  always @(*) begin
    _zz_rdGranted_3 = 1'b0;
    if(when_Axi4LiteCrossbar_l131_7) begin
      _zz_rdGranted_3 = 1'b0;
    end
  end

  assign when_Axi4LiteCrossbar_l131_7 = _zz_when_Axi4LiteCrossbar_l131_7_1[0];
  assign when_Axi4LiteCrossbar_l294_3 = (|_zz_when_Axi4LiteCrossbar_l294_6);
  assign when_Axi4LiteCrossbar_l297_3 = (_zz_rdGranted_3 == 1'b0);
  assign io_slaves_3_ar_fire = (io_slaves_3_ar_valid && io_slaves_3_ar_ready);
  assign when_Axi4LiteCrossbar_l340_3 = (rdGranted_3 == 1'b0);
  assign io_slaves_3_r_fire = (io_slaves_3_r_valid && io_slaves_3_r_ready);
  always @(posedge clk) begin
    if(!resetn) begin
      wrActive_0 <= 1'b0;
      wrActive_1 <= 1'b0;
      wrActive_2 <= 1'b0;
      wrActive_3 <= 1'b0;
      wrGranted_0 <= 1'b0;
      wrGranted_1 <= 1'b0;
      wrGranted_2 <= 1'b0;
      wrGranted_3 <= 1'b0;
      wrRrPtr_0 <= 1'b0;
      wrRrPtr_1 <= 1'b0;
      wrRrPtr_2 <= 1'b0;
      wrRrPtr_3 <= 1'b0;
      rdActive_0 <= 1'b0;
      rdActive_1 <= 1'b0;
      rdActive_2 <= 1'b0;
      rdActive_3 <= 1'b0;
      rdGranted_0 <= 1'b0;
      rdGranted_1 <= 1'b0;
      rdGranted_2 <= 1'b0;
      rdGranted_3 <= 1'b0;
      rdRrPtr_0 <= 1'b0;
      rdRrPtr_1 <= 1'b0;
      rdRrPtr_2 <= 1'b0;
      rdRrPtr_3 <= 1'b0;
    end else begin
      if(when_Axi4LiteCrossbar_l194) begin
        if(when_Axi4LiteCrossbar_l206) begin
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
      if(when_Axi4LiteCrossbar_l194_1) begin
        if(when_Axi4LiteCrossbar_l206_1) begin
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
      if(when_Axi4LiteCrossbar_l194_2) begin
        if(when_Axi4LiteCrossbar_l206_2) begin
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
      if(when_Axi4LiteCrossbar_l194_3) begin
        if(when_Axi4LiteCrossbar_l206_3) begin
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
      if(when_Axi4LiteCrossbar_l283) begin
        if(when_Axi4LiteCrossbar_l294) begin
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
      if(when_Axi4LiteCrossbar_l283_1) begin
        if(when_Axi4LiteCrossbar_l294_1) begin
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
      if(when_Axi4LiteCrossbar_l283_2) begin
        if(when_Axi4LiteCrossbar_l294_2) begin
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
      if(when_Axi4LiteCrossbar_l283_3) begin
        if(when_Axi4LiteCrossbar_l294_3) begin
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
    end
  end


endmodule
