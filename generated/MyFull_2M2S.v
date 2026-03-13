// Copyright (c) 2026 Leonardo Capossio — bard0 design  hello@bard0.com
// SPDX-License-Identifier: MIT
// Generator : SpinalHDL v1.10.1    git head : 2527c7c6b0fb0f95e5e1a5722a0be732b364ce43
// Component : AxiZeroMixedTop
// Git hash  : 119aa951c834b0daa7ec12b6877406150b57d596

`timescale 1ns/1ps

module AxiZeroMixedTop (
  input  wire          io_masters_0_aw_valid,
  output wire          io_masters_0_aw_ready,
  input  wire [31:0]   io_masters_0_aw_payload_addr,
  input  wire [3:0]    io_masters_0_aw_payload_id,
  input  wire [3:0]    io_masters_0_aw_payload_region,
  input  wire [7:0]    io_masters_0_aw_payload_len,
  input  wire [2:0]    io_masters_0_aw_payload_size,
  input  wire [1:0]    io_masters_0_aw_payload_burst,
  input  wire [0:0]    io_masters_0_aw_payload_lock,
  input  wire [3:0]    io_masters_0_aw_payload_cache,
  input  wire [3:0]    io_masters_0_aw_payload_qos,
  input  wire [2:0]    io_masters_0_aw_payload_prot,
  input  wire          io_masters_0_w_valid,
  output wire          io_masters_0_w_ready,
  input  wire [63:0]   io_masters_0_w_payload_data,
  input  wire [7:0]    io_masters_0_w_payload_strb,
  input  wire          io_masters_0_w_payload_last,
  output wire          io_masters_0_b_valid,
  input  wire          io_masters_0_b_ready,
  output wire [3:0]    io_masters_0_b_payload_id,
  output wire [1:0]    io_masters_0_b_payload_resp,
  input  wire          io_masters_0_ar_valid,
  output wire          io_masters_0_ar_ready,
  input  wire [31:0]   io_masters_0_ar_payload_addr,
  input  wire [3:0]    io_masters_0_ar_payload_id,
  input  wire [3:0]    io_masters_0_ar_payload_region,
  input  wire [7:0]    io_masters_0_ar_payload_len,
  input  wire [2:0]    io_masters_0_ar_payload_size,
  input  wire [1:0]    io_masters_0_ar_payload_burst,
  input  wire [0:0]    io_masters_0_ar_payload_lock,
  input  wire [3:0]    io_masters_0_ar_payload_cache,
  input  wire [3:0]    io_masters_0_ar_payload_qos,
  input  wire [2:0]    io_masters_0_ar_payload_prot,
  output wire          io_masters_0_r_valid,
  input  wire          io_masters_0_r_ready,
  output wire [63:0]   io_masters_0_r_payload_data,
  output wire [3:0]    io_masters_0_r_payload_id,
  output wire [1:0]    io_masters_0_r_payload_resp,
  output wire          io_masters_0_r_payload_last,
  output wire          io_slaves_0_aw_valid,
  input  wire          io_slaves_0_aw_ready,
  output wire [31:0]   io_slaves_0_aw_payload_addr,
  output wire [3:0]    io_slaves_0_aw_payload_id,
  output wire [3:0]    io_slaves_0_aw_payload_region,
  output wire [7:0]    io_slaves_0_aw_payload_len,
  output wire [2:0]    io_slaves_0_aw_payload_size,
  output wire [1:0]    io_slaves_0_aw_payload_burst,
  output wire [0:0]    io_slaves_0_aw_payload_lock,
  output wire [3:0]    io_slaves_0_aw_payload_cache,
  output wire [3:0]    io_slaves_0_aw_payload_qos,
  output wire [2:0]    io_slaves_0_aw_payload_prot,
  output wire          io_slaves_0_w_valid,
  input  wire          io_slaves_0_w_ready,
  output wire [63:0]   io_slaves_0_w_payload_data,
  output wire [7:0]    io_slaves_0_w_payload_strb,
  output wire          io_slaves_0_w_payload_last,
  input  wire          io_slaves_0_b_valid,
  output wire          io_slaves_0_b_ready,
  input  wire [3:0]    io_slaves_0_b_payload_id,
  input  wire [1:0]    io_slaves_0_b_payload_resp,
  output wire          io_slaves_0_ar_valid,
  input  wire          io_slaves_0_ar_ready,
  output wire [31:0]   io_slaves_0_ar_payload_addr,
  output wire [3:0]    io_slaves_0_ar_payload_id,
  output wire [3:0]    io_slaves_0_ar_payload_region,
  output wire [7:0]    io_slaves_0_ar_payload_len,
  output wire [2:0]    io_slaves_0_ar_payload_size,
  output wire [1:0]    io_slaves_0_ar_payload_burst,
  output wire [0:0]    io_slaves_0_ar_payload_lock,
  output wire [3:0]    io_slaves_0_ar_payload_cache,
  output wire [3:0]    io_slaves_0_ar_payload_qos,
  output wire [2:0]    io_slaves_0_ar_payload_prot,
  input  wire          io_slaves_0_r_valid,
  output wire          io_slaves_0_r_ready,
  input  wire [63:0]   io_slaves_0_r_payload_data,
  input  wire [3:0]    io_slaves_0_r_payload_id,
  input  wire [1:0]    io_slaves_0_r_payload_resp,
  input  wire          io_slaves_0_r_payload_last,
  output wire          io_slaves_1_aw_valid,
  input  wire          io_slaves_1_aw_ready,
  output wire [31:0]   io_slaves_1_aw_payload_addr,
  output wire [3:0]    io_slaves_1_aw_payload_id,
  output wire [3:0]    io_slaves_1_aw_payload_region,
  output wire [7:0]    io_slaves_1_aw_payload_len,
  output wire [2:0]    io_slaves_1_aw_payload_size,
  output wire [1:0]    io_slaves_1_aw_payload_burst,
  output wire [0:0]    io_slaves_1_aw_payload_lock,
  output wire [3:0]    io_slaves_1_aw_payload_cache,
  output wire [3:0]    io_slaves_1_aw_payload_qos,
  output wire [2:0]    io_slaves_1_aw_payload_prot,
  output wire          io_slaves_1_w_valid,
  input  wire          io_slaves_1_w_ready,
  output wire [63:0]   io_slaves_1_w_payload_data,
  output wire [7:0]    io_slaves_1_w_payload_strb,
  output wire          io_slaves_1_w_payload_last,
  input  wire          io_slaves_1_b_valid,
  output wire          io_slaves_1_b_ready,
  input  wire [3:0]    io_slaves_1_b_payload_id,
  input  wire [1:0]    io_slaves_1_b_payload_resp,
  output wire          io_slaves_1_ar_valid,
  input  wire          io_slaves_1_ar_ready,
  output wire [31:0]   io_slaves_1_ar_payload_addr,
  output wire [3:0]    io_slaves_1_ar_payload_id,
  output wire [3:0]    io_slaves_1_ar_payload_region,
  output wire [7:0]    io_slaves_1_ar_payload_len,
  output wire [2:0]    io_slaves_1_ar_payload_size,
  output wire [1:0]    io_slaves_1_ar_payload_burst,
  output wire [0:0]    io_slaves_1_ar_payload_lock,
  output wire [3:0]    io_slaves_1_ar_payload_cache,
  output wire [3:0]    io_slaves_1_ar_payload_qos,
  output wire [2:0]    io_slaves_1_ar_payload_prot,
  input  wire          io_slaves_1_r_valid,
  output wire          io_slaves_1_r_ready,
  input  wire [63:0]   io_slaves_1_r_payload_data,
  input  wire [3:0]    io_slaves_1_r_payload_id,
  input  wire [1:0]    io_slaves_1_r_payload_resp,
  input  wire          io_slaves_1_r_payload_last,
  input  wire          clk,
  input  wire          resetn
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
    .io_masters_0_aw_valid          (io_masters_0_aw_valid                  ), //i
    .io_masters_0_aw_ready          (xbar_io_masters_0_aw_ready             ), //o
    .io_masters_0_aw_payload_addr   (io_masters_0_aw_payload_addr[31:0]     ), //i
    .io_masters_0_aw_payload_id     (io_masters_0_aw_payload_id[3:0]        ), //i
    .io_masters_0_aw_payload_region (io_masters_0_aw_payload_region[3:0]    ), //i
    .io_masters_0_aw_payload_len    (io_masters_0_aw_payload_len[7:0]       ), //i
    .io_masters_0_aw_payload_size   (io_masters_0_aw_payload_size[2:0]      ), //i
    .io_masters_0_aw_payload_burst  (io_masters_0_aw_payload_burst[1:0]     ), //i
    .io_masters_0_aw_payload_lock   (io_masters_0_aw_payload_lock           ), //i
    .io_masters_0_aw_payload_cache  (io_masters_0_aw_payload_cache[3:0]     ), //i
    .io_masters_0_aw_payload_qos    (io_masters_0_aw_payload_qos[3:0]       ), //i
    .io_masters_0_aw_payload_prot   (io_masters_0_aw_payload_prot[2:0]      ), //i
    .io_masters_0_w_valid           (io_masters_0_w_valid                   ), //i
    .io_masters_0_w_ready           (xbar_io_masters_0_w_ready              ), //o
    .io_masters_0_w_payload_data    (io_masters_0_w_payload_data[63:0]      ), //i
    .io_masters_0_w_payload_strb    (io_masters_0_w_payload_strb[7:0]       ), //i
    .io_masters_0_w_payload_last    (io_masters_0_w_payload_last            ), //i
    .io_masters_0_b_valid           (xbar_io_masters_0_b_valid              ), //o
    .io_masters_0_b_ready           (io_masters_0_b_ready                   ), //i
    .io_masters_0_b_payload_id      (xbar_io_masters_0_b_payload_id[3:0]    ), //o
    .io_masters_0_b_payload_resp    (xbar_io_masters_0_b_payload_resp[1:0]  ), //o
    .io_masters_0_ar_valid          (io_masters_0_ar_valid                  ), //i
    .io_masters_0_ar_ready          (xbar_io_masters_0_ar_ready             ), //o
    .io_masters_0_ar_payload_addr   (io_masters_0_ar_payload_addr[31:0]     ), //i
    .io_masters_0_ar_payload_id     (io_masters_0_ar_payload_id[3:0]        ), //i
    .io_masters_0_ar_payload_region (io_masters_0_ar_payload_region[3:0]    ), //i
    .io_masters_0_ar_payload_len    (io_masters_0_ar_payload_len[7:0]       ), //i
    .io_masters_0_ar_payload_size   (io_masters_0_ar_payload_size[2:0]      ), //i
    .io_masters_0_ar_payload_burst  (io_masters_0_ar_payload_burst[1:0]     ), //i
    .io_masters_0_ar_payload_lock   (io_masters_0_ar_payload_lock           ), //i
    .io_masters_0_ar_payload_cache  (io_masters_0_ar_payload_cache[3:0]     ), //i
    .io_masters_0_ar_payload_qos    (io_masters_0_ar_payload_qos[3:0]       ), //i
    .io_masters_0_ar_payload_prot   (io_masters_0_ar_payload_prot[2:0]      ), //i
    .io_masters_0_r_valid           (xbar_io_masters_0_r_valid              ), //o
    .io_masters_0_r_ready           (io_masters_0_r_ready                   ), //i
    .io_masters_0_r_payload_data    (xbar_io_masters_0_r_payload_data[63:0] ), //o
    .io_masters_0_r_payload_id      (xbar_io_masters_0_r_payload_id[3:0]    ), //o
    .io_masters_0_r_payload_resp    (xbar_io_masters_0_r_payload_resp[1:0]  ), //o
    .io_masters_0_r_payload_last    (xbar_io_masters_0_r_payload_last       ), //o
    .io_slaves_0_aw_valid           (xbar_io_slaves_0_aw_valid              ), //o
    .io_slaves_0_aw_ready           (io_slaves_0_aw_ready                   ), //i
    .io_slaves_0_aw_payload_addr    (xbar_io_slaves_0_aw_payload_addr[31:0] ), //o
    .io_slaves_0_aw_payload_id      (xbar_io_slaves_0_aw_payload_id[3:0]    ), //o
    .io_slaves_0_aw_payload_region  (xbar_io_slaves_0_aw_payload_region[3:0]), //o
    .io_slaves_0_aw_payload_len     (xbar_io_slaves_0_aw_payload_len[7:0]   ), //o
    .io_slaves_0_aw_payload_size    (xbar_io_slaves_0_aw_payload_size[2:0]  ), //o
    .io_slaves_0_aw_payload_burst   (xbar_io_slaves_0_aw_payload_burst[1:0] ), //o
    .io_slaves_0_aw_payload_lock    (xbar_io_slaves_0_aw_payload_lock       ), //o
    .io_slaves_0_aw_payload_cache   (xbar_io_slaves_0_aw_payload_cache[3:0] ), //o
    .io_slaves_0_aw_payload_qos     (xbar_io_slaves_0_aw_payload_qos[3:0]   ), //o
    .io_slaves_0_aw_payload_prot    (xbar_io_slaves_0_aw_payload_prot[2:0]  ), //o
    .io_slaves_0_w_valid            (xbar_io_slaves_0_w_valid               ), //o
    .io_slaves_0_w_ready            (io_slaves_0_w_ready                    ), //i
    .io_slaves_0_w_payload_data     (xbar_io_slaves_0_w_payload_data[63:0]  ), //o
    .io_slaves_0_w_payload_strb     (xbar_io_slaves_0_w_payload_strb[7:0]   ), //o
    .io_slaves_0_w_payload_last     (xbar_io_slaves_0_w_payload_last        ), //o
    .io_slaves_0_b_valid            (io_slaves_0_b_valid                    ), //i
    .io_slaves_0_b_ready            (xbar_io_slaves_0_b_ready               ), //o
    .io_slaves_0_b_payload_id       (io_slaves_0_b_payload_id[3:0]          ), //i
    .io_slaves_0_b_payload_resp     (io_slaves_0_b_payload_resp[1:0]        ), //i
    .io_slaves_0_ar_valid           (xbar_io_slaves_0_ar_valid              ), //o
    .io_slaves_0_ar_ready           (io_slaves_0_ar_ready                   ), //i
    .io_slaves_0_ar_payload_addr    (xbar_io_slaves_0_ar_payload_addr[31:0] ), //o
    .io_slaves_0_ar_payload_id      (xbar_io_slaves_0_ar_payload_id[3:0]    ), //o
    .io_slaves_0_ar_payload_region  (xbar_io_slaves_0_ar_payload_region[3:0]), //o
    .io_slaves_0_ar_payload_len     (xbar_io_slaves_0_ar_payload_len[7:0]   ), //o
    .io_slaves_0_ar_payload_size    (xbar_io_slaves_0_ar_payload_size[2:0]  ), //o
    .io_slaves_0_ar_payload_burst   (xbar_io_slaves_0_ar_payload_burst[1:0] ), //o
    .io_slaves_0_ar_payload_lock    (xbar_io_slaves_0_ar_payload_lock       ), //o
    .io_slaves_0_ar_payload_cache   (xbar_io_slaves_0_ar_payload_cache[3:0] ), //o
    .io_slaves_0_ar_payload_qos     (xbar_io_slaves_0_ar_payload_qos[3:0]   ), //o
    .io_slaves_0_ar_payload_prot    (xbar_io_slaves_0_ar_payload_prot[2:0]  ), //o
    .io_slaves_0_r_valid            (io_slaves_0_r_valid                    ), //i
    .io_slaves_0_r_ready            (xbar_io_slaves_0_r_ready               ), //o
    .io_slaves_0_r_payload_data     (io_slaves_0_r_payload_data[63:0]       ), //i
    .io_slaves_0_r_payload_id       (io_slaves_0_r_payload_id[3:0]          ), //i
    .io_slaves_0_r_payload_resp     (io_slaves_0_r_payload_resp[1:0]        ), //i
    .io_slaves_0_r_payload_last     (io_slaves_0_r_payload_last             ), //i
    .io_slaves_1_aw_valid           (xbar_io_slaves_1_aw_valid              ), //o
    .io_slaves_1_aw_ready           (io_slaves_1_aw_ready                   ), //i
    .io_slaves_1_aw_payload_addr    (xbar_io_slaves_1_aw_payload_addr[31:0] ), //o
    .io_slaves_1_aw_payload_id      (xbar_io_slaves_1_aw_payload_id[3:0]    ), //o
    .io_slaves_1_aw_payload_region  (xbar_io_slaves_1_aw_payload_region[3:0]), //o
    .io_slaves_1_aw_payload_len     (xbar_io_slaves_1_aw_payload_len[7:0]   ), //o
    .io_slaves_1_aw_payload_size    (xbar_io_slaves_1_aw_payload_size[2:0]  ), //o
    .io_slaves_1_aw_payload_burst   (xbar_io_slaves_1_aw_payload_burst[1:0] ), //o
    .io_slaves_1_aw_payload_lock    (xbar_io_slaves_1_aw_payload_lock       ), //o
    .io_slaves_1_aw_payload_cache   (xbar_io_slaves_1_aw_payload_cache[3:0] ), //o
    .io_slaves_1_aw_payload_qos     (xbar_io_slaves_1_aw_payload_qos[3:0]   ), //o
    .io_slaves_1_aw_payload_prot    (xbar_io_slaves_1_aw_payload_prot[2:0]  ), //o
    .io_slaves_1_w_valid            (xbar_io_slaves_1_w_valid               ), //o
    .io_slaves_1_w_ready            (io_slaves_1_w_ready                    ), //i
    .io_slaves_1_w_payload_data     (xbar_io_slaves_1_w_payload_data[63:0]  ), //o
    .io_slaves_1_w_payload_strb     (xbar_io_slaves_1_w_payload_strb[7:0]   ), //o
    .io_slaves_1_w_payload_last     (xbar_io_slaves_1_w_payload_last        ), //o
    .io_slaves_1_b_valid            (io_slaves_1_b_valid                    ), //i
    .io_slaves_1_b_ready            (xbar_io_slaves_1_b_ready               ), //o
    .io_slaves_1_b_payload_id       (io_slaves_1_b_payload_id[3:0]          ), //i
    .io_slaves_1_b_payload_resp     (io_slaves_1_b_payload_resp[1:0]        ), //i
    .io_slaves_1_ar_valid           (xbar_io_slaves_1_ar_valid              ), //o
    .io_slaves_1_ar_ready           (io_slaves_1_ar_ready                   ), //i
    .io_slaves_1_ar_payload_addr    (xbar_io_slaves_1_ar_payload_addr[31:0] ), //o
    .io_slaves_1_ar_payload_id      (xbar_io_slaves_1_ar_payload_id[3:0]    ), //o
    .io_slaves_1_ar_payload_region  (xbar_io_slaves_1_ar_payload_region[3:0]), //o
    .io_slaves_1_ar_payload_len     (xbar_io_slaves_1_ar_payload_len[7:0]   ), //o
    .io_slaves_1_ar_payload_size    (xbar_io_slaves_1_ar_payload_size[2:0]  ), //o
    .io_slaves_1_ar_payload_burst   (xbar_io_slaves_1_ar_payload_burst[1:0] ), //o
    .io_slaves_1_ar_payload_lock    (xbar_io_slaves_1_ar_payload_lock       ), //o
    .io_slaves_1_ar_payload_cache   (xbar_io_slaves_1_ar_payload_cache[3:0] ), //o
    .io_slaves_1_ar_payload_qos     (xbar_io_slaves_1_ar_payload_qos[3:0]   ), //o
    .io_slaves_1_ar_payload_prot    (xbar_io_slaves_1_ar_payload_prot[2:0]  ), //o
    .io_slaves_1_r_valid            (io_slaves_1_r_valid                    ), //i
    .io_slaves_1_r_ready            (xbar_io_slaves_1_r_ready               ), //o
    .io_slaves_1_r_payload_data     (io_slaves_1_r_payload_data[63:0]       ), //i
    .io_slaves_1_r_payload_id       (io_slaves_1_r_payload_id[3:0]          ), //i
    .io_slaves_1_r_payload_resp     (io_slaves_1_r_payload_resp[1:0]        ), //i
    .io_slaves_1_r_payload_last     (io_slaves_1_r_payload_last             ), //i
    .clk                            (clk                                    ), //i
    .resetn                         (resetn                                 )  //i
  );
  assign io_masters_0_aw_ready = xbar_io_masters_0_aw_ready;
  assign io_masters_0_w_ready = xbar_io_masters_0_w_ready;
  assign io_masters_0_b_valid = xbar_io_masters_0_b_valid;
  assign io_masters_0_b_payload_id = xbar_io_masters_0_b_payload_id;
  assign io_masters_0_b_payload_resp = xbar_io_masters_0_b_payload_resp;
  assign io_masters_0_ar_ready = xbar_io_masters_0_ar_ready;
  assign io_masters_0_r_valid = xbar_io_masters_0_r_valid;
  assign io_masters_0_r_payload_data = xbar_io_masters_0_r_payload_data;
  assign io_masters_0_r_payload_id = xbar_io_masters_0_r_payload_id;
  assign io_masters_0_r_payload_resp = xbar_io_masters_0_r_payload_resp;
  assign io_masters_0_r_payload_last = xbar_io_masters_0_r_payload_last;
  assign io_slaves_0_aw_valid = xbar_io_slaves_0_aw_valid;
  assign io_slaves_0_aw_payload_addr = xbar_io_slaves_0_aw_payload_addr;
  assign io_slaves_0_aw_payload_id = xbar_io_slaves_0_aw_payload_id;
  assign io_slaves_0_aw_payload_region = xbar_io_slaves_0_aw_payload_region;
  assign io_slaves_0_aw_payload_len = xbar_io_slaves_0_aw_payload_len;
  assign io_slaves_0_aw_payload_size = xbar_io_slaves_0_aw_payload_size;
  assign io_slaves_0_aw_payload_burst = xbar_io_slaves_0_aw_payload_burst;
  assign io_slaves_0_aw_payload_lock = xbar_io_slaves_0_aw_payload_lock;
  assign io_slaves_0_aw_payload_cache = xbar_io_slaves_0_aw_payload_cache;
  assign io_slaves_0_aw_payload_qos = xbar_io_slaves_0_aw_payload_qos;
  assign io_slaves_0_aw_payload_prot = xbar_io_slaves_0_aw_payload_prot;
  assign io_slaves_0_w_valid = xbar_io_slaves_0_w_valid;
  assign io_slaves_0_w_payload_data = xbar_io_slaves_0_w_payload_data;
  assign io_slaves_0_w_payload_strb = xbar_io_slaves_0_w_payload_strb;
  assign io_slaves_0_w_payload_last = xbar_io_slaves_0_w_payload_last;
  assign io_slaves_0_b_ready = xbar_io_slaves_0_b_ready;
  assign io_slaves_0_ar_valid = xbar_io_slaves_0_ar_valid;
  assign io_slaves_0_ar_payload_addr = xbar_io_slaves_0_ar_payload_addr;
  assign io_slaves_0_ar_payload_id = xbar_io_slaves_0_ar_payload_id;
  assign io_slaves_0_ar_payload_region = xbar_io_slaves_0_ar_payload_region;
  assign io_slaves_0_ar_payload_len = xbar_io_slaves_0_ar_payload_len;
  assign io_slaves_0_ar_payload_size = xbar_io_slaves_0_ar_payload_size;
  assign io_slaves_0_ar_payload_burst = xbar_io_slaves_0_ar_payload_burst;
  assign io_slaves_0_ar_payload_lock = xbar_io_slaves_0_ar_payload_lock;
  assign io_slaves_0_ar_payload_cache = xbar_io_slaves_0_ar_payload_cache;
  assign io_slaves_0_ar_payload_qos = xbar_io_slaves_0_ar_payload_qos;
  assign io_slaves_0_ar_payload_prot = xbar_io_slaves_0_ar_payload_prot;
  assign io_slaves_0_r_ready = xbar_io_slaves_0_r_ready;
  assign io_slaves_1_aw_valid = xbar_io_slaves_1_aw_valid;
  assign io_slaves_1_aw_payload_addr = xbar_io_slaves_1_aw_payload_addr;
  assign io_slaves_1_aw_payload_id = xbar_io_slaves_1_aw_payload_id;
  assign io_slaves_1_aw_payload_region = xbar_io_slaves_1_aw_payload_region;
  assign io_slaves_1_aw_payload_len = xbar_io_slaves_1_aw_payload_len;
  assign io_slaves_1_aw_payload_size = xbar_io_slaves_1_aw_payload_size;
  assign io_slaves_1_aw_payload_burst = xbar_io_slaves_1_aw_payload_burst;
  assign io_slaves_1_aw_payload_lock = xbar_io_slaves_1_aw_payload_lock;
  assign io_slaves_1_aw_payload_cache = xbar_io_slaves_1_aw_payload_cache;
  assign io_slaves_1_aw_payload_qos = xbar_io_slaves_1_aw_payload_qos;
  assign io_slaves_1_aw_payload_prot = xbar_io_slaves_1_aw_payload_prot;
  assign io_slaves_1_w_valid = xbar_io_slaves_1_w_valid;
  assign io_slaves_1_w_payload_data = xbar_io_slaves_1_w_payload_data;
  assign io_slaves_1_w_payload_strb = xbar_io_slaves_1_w_payload_strb;
  assign io_slaves_1_w_payload_last = xbar_io_slaves_1_w_payload_last;
  assign io_slaves_1_b_ready = xbar_io_slaves_1_b_ready;
  assign io_slaves_1_ar_valid = xbar_io_slaves_1_ar_valid;
  assign io_slaves_1_ar_payload_addr = xbar_io_slaves_1_ar_payload_addr;
  assign io_slaves_1_ar_payload_id = xbar_io_slaves_1_ar_payload_id;
  assign io_slaves_1_ar_payload_region = xbar_io_slaves_1_ar_payload_region;
  assign io_slaves_1_ar_payload_len = xbar_io_slaves_1_ar_payload_len;
  assign io_slaves_1_ar_payload_size = xbar_io_slaves_1_ar_payload_size;
  assign io_slaves_1_ar_payload_burst = xbar_io_slaves_1_ar_payload_burst;
  assign io_slaves_1_ar_payload_lock = xbar_io_slaves_1_ar_payload_lock;
  assign io_slaves_1_ar_payload_cache = xbar_io_slaves_1_ar_payload_cache;
  assign io_slaves_1_ar_payload_qos = xbar_io_slaves_1_ar_payload_qos;
  assign io_slaves_1_ar_payload_prot = xbar_io_slaves_1_ar_payload_prot;
  assign io_slaves_1_r_ready = xbar_io_slaves_1_r_ready;

endmodule

module Axi4Crossbar (
  input  wire          io_masters_0_aw_valid,
  output reg           io_masters_0_aw_ready,
  input  wire [31:0]   io_masters_0_aw_payload_addr,
  input  wire [3:0]    io_masters_0_aw_payload_id,
  input  wire [3:0]    io_masters_0_aw_payload_region,
  input  wire [7:0]    io_masters_0_aw_payload_len,
  input  wire [2:0]    io_masters_0_aw_payload_size,
  input  wire [1:0]    io_masters_0_aw_payload_burst,
  input  wire [0:0]    io_masters_0_aw_payload_lock,
  input  wire [3:0]    io_masters_0_aw_payload_cache,
  input  wire [3:0]    io_masters_0_aw_payload_qos,
  input  wire [2:0]    io_masters_0_aw_payload_prot,
  input  wire          io_masters_0_w_valid,
  output reg           io_masters_0_w_ready,
  input  wire [63:0]   io_masters_0_w_payload_data,
  input  wire [7:0]    io_masters_0_w_payload_strb,
  input  wire          io_masters_0_w_payload_last,
  output reg           io_masters_0_b_valid,
  input  wire          io_masters_0_b_ready,
  output reg  [3:0]    io_masters_0_b_payload_id,
  output reg  [1:0]    io_masters_0_b_payload_resp,
  input  wire          io_masters_0_ar_valid,
  output reg           io_masters_0_ar_ready,
  input  wire [31:0]   io_masters_0_ar_payload_addr,
  input  wire [3:0]    io_masters_0_ar_payload_id,
  input  wire [3:0]    io_masters_0_ar_payload_region,
  input  wire [7:0]    io_masters_0_ar_payload_len,
  input  wire [2:0]    io_masters_0_ar_payload_size,
  input  wire [1:0]    io_masters_0_ar_payload_burst,
  input  wire [0:0]    io_masters_0_ar_payload_lock,
  input  wire [3:0]    io_masters_0_ar_payload_cache,
  input  wire [3:0]    io_masters_0_ar_payload_qos,
  input  wire [2:0]    io_masters_0_ar_payload_prot,
  output reg           io_masters_0_r_valid,
  input  wire          io_masters_0_r_ready,
  output reg  [63:0]   io_masters_0_r_payload_data,
  output reg  [3:0]    io_masters_0_r_payload_id,
  output reg  [1:0]    io_masters_0_r_payload_resp,
  output reg           io_masters_0_r_payload_last,
  output reg           io_slaves_0_aw_valid,
  input  wire          io_slaves_0_aw_ready,
  output reg  [31:0]   io_slaves_0_aw_payload_addr,
  output reg  [3:0]    io_slaves_0_aw_payload_id,
  output wire [3:0]    io_slaves_0_aw_payload_region,
  output reg  [7:0]    io_slaves_0_aw_payload_len,
  output reg  [2:0]    io_slaves_0_aw_payload_size,
  output reg  [1:0]    io_slaves_0_aw_payload_burst,
  output reg  [0:0]    io_slaves_0_aw_payload_lock,
  output reg  [3:0]    io_slaves_0_aw_payload_cache,
  output reg  [3:0]    io_slaves_0_aw_payload_qos,
  output reg  [2:0]    io_slaves_0_aw_payload_prot,
  output reg           io_slaves_0_w_valid,
  input  wire          io_slaves_0_w_ready,
  output reg  [63:0]   io_slaves_0_w_payload_data,
  output reg  [7:0]    io_slaves_0_w_payload_strb,
  output reg           io_slaves_0_w_payload_last,
  input  wire          io_slaves_0_b_valid,
  output reg           io_slaves_0_b_ready,
  input  wire [3:0]    io_slaves_0_b_payload_id,
  input  wire [1:0]    io_slaves_0_b_payload_resp,
  output reg           io_slaves_0_ar_valid,
  input  wire          io_slaves_0_ar_ready,
  output reg  [31:0]   io_slaves_0_ar_payload_addr,
  output reg  [3:0]    io_slaves_0_ar_payload_id,
  output wire [3:0]    io_slaves_0_ar_payload_region,
  output reg  [7:0]    io_slaves_0_ar_payload_len,
  output reg  [2:0]    io_slaves_0_ar_payload_size,
  output reg  [1:0]    io_slaves_0_ar_payload_burst,
  output reg  [0:0]    io_slaves_0_ar_payload_lock,
  output reg  [3:0]    io_slaves_0_ar_payload_cache,
  output reg  [3:0]    io_slaves_0_ar_payload_qos,
  output reg  [2:0]    io_slaves_0_ar_payload_prot,
  input  wire          io_slaves_0_r_valid,
  output reg           io_slaves_0_r_ready,
  input  wire [63:0]   io_slaves_0_r_payload_data,
  input  wire [3:0]    io_slaves_0_r_payload_id,
  input  wire [1:0]    io_slaves_0_r_payload_resp,
  input  wire          io_slaves_0_r_payload_last,
  output reg           io_slaves_1_aw_valid,
  input  wire          io_slaves_1_aw_ready,
  output reg  [31:0]   io_slaves_1_aw_payload_addr,
  output reg  [3:0]    io_slaves_1_aw_payload_id,
  output wire [3:0]    io_slaves_1_aw_payload_region,
  output reg  [7:0]    io_slaves_1_aw_payload_len,
  output reg  [2:0]    io_slaves_1_aw_payload_size,
  output reg  [1:0]    io_slaves_1_aw_payload_burst,
  output reg  [0:0]    io_slaves_1_aw_payload_lock,
  output reg  [3:0]    io_slaves_1_aw_payload_cache,
  output reg  [3:0]    io_slaves_1_aw_payload_qos,
  output reg  [2:0]    io_slaves_1_aw_payload_prot,
  output reg           io_slaves_1_w_valid,
  input  wire          io_slaves_1_w_ready,
  output reg  [63:0]   io_slaves_1_w_payload_data,
  output reg  [7:0]    io_slaves_1_w_payload_strb,
  output reg           io_slaves_1_w_payload_last,
  input  wire          io_slaves_1_b_valid,
  output reg           io_slaves_1_b_ready,
  input  wire [3:0]    io_slaves_1_b_payload_id,
  input  wire [1:0]    io_slaves_1_b_payload_resp,
  output reg           io_slaves_1_ar_valid,
  input  wire          io_slaves_1_ar_ready,
  output reg  [31:0]   io_slaves_1_ar_payload_addr,
  output reg  [3:0]    io_slaves_1_ar_payload_id,
  output wire [3:0]    io_slaves_1_ar_payload_region,
  output reg  [7:0]    io_slaves_1_ar_payload_len,
  output reg  [2:0]    io_slaves_1_ar_payload_size,
  output reg  [1:0]    io_slaves_1_ar_payload_burst,
  output reg  [0:0]    io_slaves_1_ar_payload_lock,
  output reg  [3:0]    io_slaves_1_ar_payload_cache,
  output reg  [3:0]    io_slaves_1_ar_payload_qos,
  output reg  [2:0]    io_slaves_1_ar_payload_prot,
  input  wire          io_slaves_1_r_valid,
  output reg           io_slaves_1_r_ready,
  input  wire [63:0]   io_slaves_1_r_payload_data,
  input  wire [3:0]    io_slaves_1_r_payload_id,
  input  wire [1:0]    io_slaves_1_r_payload_resp,
  input  wire          io_slaves_1_r_payload_last,
  input  wire          clk,
  input  wire          resetn
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
    io_masters_0_aw_ready = 1'b0;
    if(when_Axi4Crossbar_l303) begin
      if(when_Axi4Crossbar_l316) begin
        if(when_Axi4Crossbar_l319) begin
          io_masters_0_aw_ready = io_slaves_0_aw_ready;
        end
      end
    end
    if(when_Axi4Crossbar_l303_1) begin
      if(when_Axi4Crossbar_l316_1) begin
        if(when_Axi4Crossbar_l319_1) begin
          io_masters_0_aw_ready = io_slaves_1_aw_ready;
        end
      end
    end
  end

  always @(*) begin
    io_masters_0_w_ready = 1'b0;
    if(when_Axi4Crossbar_l303) begin
      if(when_Axi4Crossbar_l316) begin
        if(when_Axi4Crossbar_l319) begin
          io_masters_0_w_ready = io_slaves_0_w_ready;
        end
      end
    end else begin
      if(when_Axi4Crossbar_l342) begin
        io_masters_0_w_ready = io_slaves_0_w_ready;
      end
    end
    if(when_Axi4Crossbar_l303_1) begin
      if(when_Axi4Crossbar_l316_1) begin
        if(when_Axi4Crossbar_l319_1) begin
          io_masters_0_w_ready = io_slaves_1_w_ready;
        end
      end
    end else begin
      if(when_Axi4Crossbar_l342_1) begin
        io_masters_0_w_ready = io_slaves_1_w_ready;
      end
    end
  end

  always @(*) begin
    io_masters_0_b_valid = 1'b0;
    if(!when_Axi4Crossbar_l303) begin
      if(when_Axi4Crossbar_l342) begin
        io_masters_0_b_valid = io_slaves_0_b_valid;
      end
    end
    if(!when_Axi4Crossbar_l303_1) begin
      if(when_Axi4Crossbar_l342_1) begin
        io_masters_0_b_valid = io_slaves_1_b_valid;
      end
    end
  end

  assign _zz_io_masters_0_b_payload_id = 6'h00;
  always @(*) begin
    io_masters_0_b_payload_id = _zz_io_masters_0_b_payload_id[3 : 0];
    if(!when_Axi4Crossbar_l303) begin
      if(when_Axi4Crossbar_l342) begin
        io_masters_0_b_payload_id = io_slaves_0_b_payload_id[3 : 0];
      end
    end
    if(!when_Axi4Crossbar_l303_1) begin
      if(when_Axi4Crossbar_l342_1) begin
        io_masters_0_b_payload_id = io_slaves_1_b_payload_id[3 : 0];
      end
    end
  end

  always @(*) begin
    io_masters_0_b_payload_resp = _zz_io_masters_0_b_payload_id[5 : 4];
    if(!when_Axi4Crossbar_l303) begin
      if(when_Axi4Crossbar_l342) begin
        io_masters_0_b_payload_resp = io_slaves_0_b_payload_resp;
      end
    end
    if(!when_Axi4Crossbar_l303_1) begin
      if(when_Axi4Crossbar_l342_1) begin
        io_masters_0_b_payload_resp = io_slaves_1_b_payload_resp;
      end
    end
  end

  always @(*) begin
    io_masters_0_ar_ready = 1'b0;
    if(when_Axi4Crossbar_l361) begin
      if(when_Axi4Crossbar_l374) begin
        if(when_Axi4Crossbar_l377) begin
          io_masters_0_ar_ready = io_slaves_0_ar_ready;
        end
      end
    end
    if(when_Axi4Crossbar_l361_1) begin
      if(when_Axi4Crossbar_l374_1) begin
        if(when_Axi4Crossbar_l377_1) begin
          io_masters_0_ar_ready = io_slaves_1_ar_ready;
        end
      end
    end
  end

  always @(*) begin
    io_masters_0_r_valid = 1'b0;
    if(!when_Axi4Crossbar_l361) begin
      if(when_Axi4Crossbar_l391) begin
        io_masters_0_r_valid = io_slaves_0_r_valid;
      end
    end
    if(!when_Axi4Crossbar_l361_1) begin
      if(when_Axi4Crossbar_l391_1) begin
        io_masters_0_r_valid = io_slaves_1_r_valid;
      end
    end
  end

  assign _zz_io_masters_0_r_payload_data = 71'h000000000000000000;
  always @(*) begin
    io_masters_0_r_payload_data = _zz_io_masters_0_r_payload_data[63 : 0];
    if(!when_Axi4Crossbar_l361) begin
      if(when_Axi4Crossbar_l391) begin
        io_masters_0_r_payload_data = io_slaves_0_r_payload_data;
      end
    end
    if(!when_Axi4Crossbar_l361_1) begin
      if(when_Axi4Crossbar_l391_1) begin
        io_masters_0_r_payload_data = io_slaves_1_r_payload_data;
      end
    end
  end

  always @(*) begin
    io_masters_0_r_payload_id = _zz_io_masters_0_r_payload_data[67 : 64];
    if(!when_Axi4Crossbar_l361) begin
      if(when_Axi4Crossbar_l391) begin
        io_masters_0_r_payload_id = io_slaves_0_r_payload_id[3 : 0];
      end
    end
    if(!when_Axi4Crossbar_l361_1) begin
      if(when_Axi4Crossbar_l391_1) begin
        io_masters_0_r_payload_id = io_slaves_1_r_payload_id[3 : 0];
      end
    end
  end

  always @(*) begin
    io_masters_0_r_payload_resp = _zz_io_masters_0_r_payload_data[69 : 68];
    if(!when_Axi4Crossbar_l361) begin
      if(when_Axi4Crossbar_l391) begin
        io_masters_0_r_payload_resp = io_slaves_0_r_payload_resp;
      end
    end
    if(!when_Axi4Crossbar_l361_1) begin
      if(when_Axi4Crossbar_l391_1) begin
        io_masters_0_r_payload_resp = io_slaves_1_r_payload_resp;
      end
    end
  end

  always @(*) begin
    io_masters_0_r_payload_last = _zz_io_masters_0_r_payload_data[70];
    if(!when_Axi4Crossbar_l361) begin
      if(when_Axi4Crossbar_l391) begin
        io_masters_0_r_payload_last = io_slaves_0_r_payload_last;
      end
    end
    if(!when_Axi4Crossbar_l361_1) begin
      if(when_Axi4Crossbar_l391_1) begin
        io_masters_0_r_payload_last = io_slaves_1_r_payload_last;
      end
    end
  end

  always @(*) begin
    io_slaves_0_aw_valid = 1'b0;
    if(when_Axi4Crossbar_l303) begin
      if(when_Axi4Crossbar_l316) begin
        io_slaves_0_aw_valid = 1'b1;
      end
    end
  end

  assign _zz_io_slaves_0_aw_payload_addr = 65'h00000000000000000;
  always @(*) begin
    io_slaves_0_aw_payload_addr = _zz_io_slaves_0_aw_payload_addr[31 : 0];
    if(when_Axi4Crossbar_l303) begin
      if(when_Axi4Crossbar_l316) begin
        if(when_Axi4Crossbar_l319) begin
          io_slaves_0_aw_payload_addr = io_masters_0_aw_payload_addr;
        end
      end
    end
  end

  always @(*) begin
    io_slaves_0_aw_payload_id = _zz_io_slaves_0_aw_payload_addr[35 : 32];
    if(when_Axi4Crossbar_l303) begin
      if(when_Axi4Crossbar_l316) begin
        if(when_Axi4Crossbar_l319) begin
          io_slaves_0_aw_payload_id = io_masters_0_aw_payload_id;
        end
      end
    end
  end

  assign io_slaves_0_aw_payload_region = _zz_io_slaves_0_aw_payload_addr[39 : 36];
  always @(*) begin
    io_slaves_0_aw_payload_len = _zz_io_slaves_0_aw_payload_addr[47 : 40];
    if(when_Axi4Crossbar_l303) begin
      if(when_Axi4Crossbar_l316) begin
        if(when_Axi4Crossbar_l319) begin
          io_slaves_0_aw_payload_len = io_masters_0_aw_payload_len;
        end
      end
    end
  end

  always @(*) begin
    io_slaves_0_aw_payload_size = _zz_io_slaves_0_aw_payload_addr[50 : 48];
    if(when_Axi4Crossbar_l303) begin
      if(when_Axi4Crossbar_l316) begin
        if(when_Axi4Crossbar_l319) begin
          io_slaves_0_aw_payload_size = io_masters_0_aw_payload_size;
        end
      end
    end
  end

  always @(*) begin
    io_slaves_0_aw_payload_burst = _zz_io_slaves_0_aw_payload_addr[52 : 51];
    if(when_Axi4Crossbar_l303) begin
      if(when_Axi4Crossbar_l316) begin
        if(when_Axi4Crossbar_l319) begin
          io_slaves_0_aw_payload_burst = io_masters_0_aw_payload_burst;
        end
      end
    end
  end

  always @(*) begin
    io_slaves_0_aw_payload_lock = _zz_io_slaves_0_aw_payload_addr[53 : 53];
    if(when_Axi4Crossbar_l303) begin
      if(when_Axi4Crossbar_l316) begin
        if(when_Axi4Crossbar_l319) begin
          io_slaves_0_aw_payload_lock = io_masters_0_aw_payload_lock;
        end
      end
    end
  end

  always @(*) begin
    io_slaves_0_aw_payload_cache = _zz_io_slaves_0_aw_payload_addr[57 : 54];
    if(when_Axi4Crossbar_l303) begin
      if(when_Axi4Crossbar_l316) begin
        if(when_Axi4Crossbar_l319) begin
          io_slaves_0_aw_payload_cache = io_masters_0_aw_payload_cache;
        end
      end
    end
  end

  always @(*) begin
    io_slaves_0_aw_payload_qos = _zz_io_slaves_0_aw_payload_addr[61 : 58];
    if(when_Axi4Crossbar_l303) begin
      if(when_Axi4Crossbar_l316) begin
        if(when_Axi4Crossbar_l319) begin
          io_slaves_0_aw_payload_qos = io_masters_0_aw_payload_qos;
        end
      end
    end
  end

  always @(*) begin
    io_slaves_0_aw_payload_prot = _zz_io_slaves_0_aw_payload_addr[64 : 62];
    if(when_Axi4Crossbar_l303) begin
      if(when_Axi4Crossbar_l316) begin
        if(when_Axi4Crossbar_l319) begin
          io_slaves_0_aw_payload_prot = io_masters_0_aw_payload_prot;
        end
      end
    end
  end

  always @(*) begin
    io_slaves_0_w_valid = 1'b0;
    if(when_Axi4Crossbar_l303) begin
      if(when_Axi4Crossbar_l316) begin
        if(when_Axi4Crossbar_l319) begin
          io_slaves_0_w_valid = io_masters_0_w_valid;
        end
      end
    end else begin
      if(when_Axi4Crossbar_l342) begin
        io_slaves_0_w_valid = io_masters_0_w_valid;
      end
    end
  end

  assign _zz_io_slaves_0_w_payload_data = 73'h0000000000000000000;
  always @(*) begin
    io_slaves_0_w_payload_data = _zz_io_slaves_0_w_payload_data[63 : 0];
    if(when_Axi4Crossbar_l303) begin
      if(when_Axi4Crossbar_l316) begin
        if(when_Axi4Crossbar_l319) begin
          io_slaves_0_w_payload_data = io_masters_0_w_payload_data;
        end
      end
    end else begin
      if(when_Axi4Crossbar_l342) begin
        io_slaves_0_w_payload_data = io_masters_0_w_payload_data;
      end
    end
  end

  always @(*) begin
    io_slaves_0_w_payload_strb = _zz_io_slaves_0_w_payload_data[71 : 64];
    if(when_Axi4Crossbar_l303) begin
      if(when_Axi4Crossbar_l316) begin
        if(when_Axi4Crossbar_l319) begin
          io_slaves_0_w_payload_strb = io_masters_0_w_payload_strb;
        end
      end
    end else begin
      if(when_Axi4Crossbar_l342) begin
        io_slaves_0_w_payload_strb = io_masters_0_w_payload_strb;
      end
    end
  end

  always @(*) begin
    io_slaves_0_w_payload_last = _zz_io_slaves_0_w_payload_data[72];
    if(when_Axi4Crossbar_l303) begin
      if(when_Axi4Crossbar_l316) begin
        if(when_Axi4Crossbar_l319) begin
          io_slaves_0_w_payload_last = io_masters_0_w_payload_last;
        end
      end
    end else begin
      if(when_Axi4Crossbar_l342) begin
        io_slaves_0_w_payload_last = io_masters_0_w_payload_last;
      end
    end
  end

  always @(*) begin
    io_slaves_0_b_ready = 1'b0;
    if(!when_Axi4Crossbar_l303) begin
      if(when_Axi4Crossbar_l342) begin
        io_slaves_0_b_ready = io_masters_0_b_ready;
      end
    end
  end

  always @(*) begin
    io_slaves_0_ar_valid = 1'b0;
    if(when_Axi4Crossbar_l361) begin
      if(when_Axi4Crossbar_l374) begin
        io_slaves_0_ar_valid = 1'b1;
      end
    end
  end

  assign _zz_io_slaves_0_ar_payload_addr = 65'h00000000000000000;
  always @(*) begin
    io_slaves_0_ar_payload_addr = _zz_io_slaves_0_ar_payload_addr[31 : 0];
    if(when_Axi4Crossbar_l361) begin
      if(when_Axi4Crossbar_l374) begin
        if(when_Axi4Crossbar_l377) begin
          io_slaves_0_ar_payload_addr = io_masters_0_ar_payload_addr;
        end
      end
    end
  end

  always @(*) begin
    io_slaves_0_ar_payload_id = _zz_io_slaves_0_ar_payload_addr[35 : 32];
    if(when_Axi4Crossbar_l361) begin
      if(when_Axi4Crossbar_l374) begin
        if(when_Axi4Crossbar_l377) begin
          io_slaves_0_ar_payload_id = io_masters_0_ar_payload_id;
        end
      end
    end
  end

  assign io_slaves_0_ar_payload_region = _zz_io_slaves_0_ar_payload_addr[39 : 36];
  always @(*) begin
    io_slaves_0_ar_payload_len = _zz_io_slaves_0_ar_payload_addr[47 : 40];
    if(when_Axi4Crossbar_l361) begin
      if(when_Axi4Crossbar_l374) begin
        if(when_Axi4Crossbar_l377) begin
          io_slaves_0_ar_payload_len = io_masters_0_ar_payload_len;
        end
      end
    end
  end

  always @(*) begin
    io_slaves_0_ar_payload_size = _zz_io_slaves_0_ar_payload_addr[50 : 48];
    if(when_Axi4Crossbar_l361) begin
      if(when_Axi4Crossbar_l374) begin
        if(when_Axi4Crossbar_l377) begin
          io_slaves_0_ar_payload_size = io_masters_0_ar_payload_size;
        end
      end
    end
  end

  always @(*) begin
    io_slaves_0_ar_payload_burst = _zz_io_slaves_0_ar_payload_addr[52 : 51];
    if(when_Axi4Crossbar_l361) begin
      if(when_Axi4Crossbar_l374) begin
        if(when_Axi4Crossbar_l377) begin
          io_slaves_0_ar_payload_burst = io_masters_0_ar_payload_burst;
        end
      end
    end
  end

  always @(*) begin
    io_slaves_0_ar_payload_lock = _zz_io_slaves_0_ar_payload_addr[53 : 53];
    if(when_Axi4Crossbar_l361) begin
      if(when_Axi4Crossbar_l374) begin
        if(when_Axi4Crossbar_l377) begin
          io_slaves_0_ar_payload_lock = io_masters_0_ar_payload_lock;
        end
      end
    end
  end

  always @(*) begin
    io_slaves_0_ar_payload_cache = _zz_io_slaves_0_ar_payload_addr[57 : 54];
    if(when_Axi4Crossbar_l361) begin
      if(when_Axi4Crossbar_l374) begin
        if(when_Axi4Crossbar_l377) begin
          io_slaves_0_ar_payload_cache = io_masters_0_ar_payload_cache;
        end
      end
    end
  end

  always @(*) begin
    io_slaves_0_ar_payload_qos = _zz_io_slaves_0_ar_payload_addr[61 : 58];
    if(when_Axi4Crossbar_l361) begin
      if(when_Axi4Crossbar_l374) begin
        if(when_Axi4Crossbar_l377) begin
          io_slaves_0_ar_payload_qos = io_masters_0_ar_payload_qos;
        end
      end
    end
  end

  always @(*) begin
    io_slaves_0_ar_payload_prot = _zz_io_slaves_0_ar_payload_addr[64 : 62];
    if(when_Axi4Crossbar_l361) begin
      if(when_Axi4Crossbar_l374) begin
        if(when_Axi4Crossbar_l377) begin
          io_slaves_0_ar_payload_prot = io_masters_0_ar_payload_prot;
        end
      end
    end
  end

  always @(*) begin
    io_slaves_0_r_ready = 1'b0;
    if(!when_Axi4Crossbar_l361) begin
      if(when_Axi4Crossbar_l391) begin
        io_slaves_0_r_ready = io_masters_0_r_ready;
      end
    end
  end

  always @(*) begin
    io_slaves_1_aw_valid = 1'b0;
    if(when_Axi4Crossbar_l303_1) begin
      if(when_Axi4Crossbar_l316_1) begin
        io_slaves_1_aw_valid = 1'b1;
      end
    end
  end

  assign _zz_io_slaves_1_aw_payload_addr = 65'h00000000000000000;
  always @(*) begin
    io_slaves_1_aw_payload_addr = _zz_io_slaves_1_aw_payload_addr[31 : 0];
    if(when_Axi4Crossbar_l303_1) begin
      if(when_Axi4Crossbar_l316_1) begin
        if(when_Axi4Crossbar_l319_1) begin
          io_slaves_1_aw_payload_addr = io_masters_0_aw_payload_addr;
        end
      end
    end
  end

  always @(*) begin
    io_slaves_1_aw_payload_id = _zz_io_slaves_1_aw_payload_addr[35 : 32];
    if(when_Axi4Crossbar_l303_1) begin
      if(when_Axi4Crossbar_l316_1) begin
        if(when_Axi4Crossbar_l319_1) begin
          io_slaves_1_aw_payload_id = io_masters_0_aw_payload_id;
        end
      end
    end
  end

  assign io_slaves_1_aw_payload_region = _zz_io_slaves_1_aw_payload_addr[39 : 36];
  always @(*) begin
    io_slaves_1_aw_payload_len = _zz_io_slaves_1_aw_payload_addr[47 : 40];
    if(when_Axi4Crossbar_l303_1) begin
      if(when_Axi4Crossbar_l316_1) begin
        if(when_Axi4Crossbar_l319_1) begin
          io_slaves_1_aw_payload_len = io_masters_0_aw_payload_len;
        end
      end
    end
  end

  always @(*) begin
    io_slaves_1_aw_payload_size = _zz_io_slaves_1_aw_payload_addr[50 : 48];
    if(when_Axi4Crossbar_l303_1) begin
      if(when_Axi4Crossbar_l316_1) begin
        if(when_Axi4Crossbar_l319_1) begin
          io_slaves_1_aw_payload_size = io_masters_0_aw_payload_size;
        end
      end
    end
  end

  always @(*) begin
    io_slaves_1_aw_payload_burst = _zz_io_slaves_1_aw_payload_addr[52 : 51];
    if(when_Axi4Crossbar_l303_1) begin
      if(when_Axi4Crossbar_l316_1) begin
        if(when_Axi4Crossbar_l319_1) begin
          io_slaves_1_aw_payload_burst = io_masters_0_aw_payload_burst;
        end
      end
    end
  end

  always @(*) begin
    io_slaves_1_aw_payload_lock = _zz_io_slaves_1_aw_payload_addr[53 : 53];
    if(when_Axi4Crossbar_l303_1) begin
      if(when_Axi4Crossbar_l316_1) begin
        if(when_Axi4Crossbar_l319_1) begin
          io_slaves_1_aw_payload_lock = io_masters_0_aw_payload_lock;
        end
      end
    end
  end

  always @(*) begin
    io_slaves_1_aw_payload_cache = _zz_io_slaves_1_aw_payload_addr[57 : 54];
    if(when_Axi4Crossbar_l303_1) begin
      if(when_Axi4Crossbar_l316_1) begin
        if(when_Axi4Crossbar_l319_1) begin
          io_slaves_1_aw_payload_cache = io_masters_0_aw_payload_cache;
        end
      end
    end
  end

  always @(*) begin
    io_slaves_1_aw_payload_qos = _zz_io_slaves_1_aw_payload_addr[61 : 58];
    if(when_Axi4Crossbar_l303_1) begin
      if(when_Axi4Crossbar_l316_1) begin
        if(when_Axi4Crossbar_l319_1) begin
          io_slaves_1_aw_payload_qos = io_masters_0_aw_payload_qos;
        end
      end
    end
  end

  always @(*) begin
    io_slaves_1_aw_payload_prot = _zz_io_slaves_1_aw_payload_addr[64 : 62];
    if(when_Axi4Crossbar_l303_1) begin
      if(when_Axi4Crossbar_l316_1) begin
        if(when_Axi4Crossbar_l319_1) begin
          io_slaves_1_aw_payload_prot = io_masters_0_aw_payload_prot;
        end
      end
    end
  end

  always @(*) begin
    io_slaves_1_w_valid = 1'b0;
    if(when_Axi4Crossbar_l303_1) begin
      if(when_Axi4Crossbar_l316_1) begin
        if(when_Axi4Crossbar_l319_1) begin
          io_slaves_1_w_valid = io_masters_0_w_valid;
        end
      end
    end else begin
      if(when_Axi4Crossbar_l342_1) begin
        io_slaves_1_w_valid = io_masters_0_w_valid;
      end
    end
  end

  assign _zz_io_slaves_1_w_payload_data = 73'h0000000000000000000;
  always @(*) begin
    io_slaves_1_w_payload_data = _zz_io_slaves_1_w_payload_data[63 : 0];
    if(when_Axi4Crossbar_l303_1) begin
      if(when_Axi4Crossbar_l316_1) begin
        if(when_Axi4Crossbar_l319_1) begin
          io_slaves_1_w_payload_data = io_masters_0_w_payload_data;
        end
      end
    end else begin
      if(when_Axi4Crossbar_l342_1) begin
        io_slaves_1_w_payload_data = io_masters_0_w_payload_data;
      end
    end
  end

  always @(*) begin
    io_slaves_1_w_payload_strb = _zz_io_slaves_1_w_payload_data[71 : 64];
    if(when_Axi4Crossbar_l303_1) begin
      if(when_Axi4Crossbar_l316_1) begin
        if(when_Axi4Crossbar_l319_1) begin
          io_slaves_1_w_payload_strb = io_masters_0_w_payload_strb;
        end
      end
    end else begin
      if(when_Axi4Crossbar_l342_1) begin
        io_slaves_1_w_payload_strb = io_masters_0_w_payload_strb;
      end
    end
  end

  always @(*) begin
    io_slaves_1_w_payload_last = _zz_io_slaves_1_w_payload_data[72];
    if(when_Axi4Crossbar_l303_1) begin
      if(when_Axi4Crossbar_l316_1) begin
        if(when_Axi4Crossbar_l319_1) begin
          io_slaves_1_w_payload_last = io_masters_0_w_payload_last;
        end
      end
    end else begin
      if(when_Axi4Crossbar_l342_1) begin
        io_slaves_1_w_payload_last = io_masters_0_w_payload_last;
      end
    end
  end

  always @(*) begin
    io_slaves_1_b_ready = 1'b0;
    if(!when_Axi4Crossbar_l303_1) begin
      if(when_Axi4Crossbar_l342_1) begin
        io_slaves_1_b_ready = io_masters_0_b_ready;
      end
    end
  end

  always @(*) begin
    io_slaves_1_ar_valid = 1'b0;
    if(when_Axi4Crossbar_l361_1) begin
      if(when_Axi4Crossbar_l374_1) begin
        io_slaves_1_ar_valid = 1'b1;
      end
    end
  end

  assign _zz_io_slaves_1_ar_payload_addr = 65'h00000000000000000;
  always @(*) begin
    io_slaves_1_ar_payload_addr = _zz_io_slaves_1_ar_payload_addr[31 : 0];
    if(when_Axi4Crossbar_l361_1) begin
      if(when_Axi4Crossbar_l374_1) begin
        if(when_Axi4Crossbar_l377_1) begin
          io_slaves_1_ar_payload_addr = io_masters_0_ar_payload_addr;
        end
      end
    end
  end

  always @(*) begin
    io_slaves_1_ar_payload_id = _zz_io_slaves_1_ar_payload_addr[35 : 32];
    if(when_Axi4Crossbar_l361_1) begin
      if(when_Axi4Crossbar_l374_1) begin
        if(when_Axi4Crossbar_l377_1) begin
          io_slaves_1_ar_payload_id = io_masters_0_ar_payload_id;
        end
      end
    end
  end

  assign io_slaves_1_ar_payload_region = _zz_io_slaves_1_ar_payload_addr[39 : 36];
  always @(*) begin
    io_slaves_1_ar_payload_len = _zz_io_slaves_1_ar_payload_addr[47 : 40];
    if(when_Axi4Crossbar_l361_1) begin
      if(when_Axi4Crossbar_l374_1) begin
        if(when_Axi4Crossbar_l377_1) begin
          io_slaves_1_ar_payload_len = io_masters_0_ar_payload_len;
        end
      end
    end
  end

  always @(*) begin
    io_slaves_1_ar_payload_size = _zz_io_slaves_1_ar_payload_addr[50 : 48];
    if(when_Axi4Crossbar_l361_1) begin
      if(when_Axi4Crossbar_l374_1) begin
        if(when_Axi4Crossbar_l377_1) begin
          io_slaves_1_ar_payload_size = io_masters_0_ar_payload_size;
        end
      end
    end
  end

  always @(*) begin
    io_slaves_1_ar_payload_burst = _zz_io_slaves_1_ar_payload_addr[52 : 51];
    if(when_Axi4Crossbar_l361_1) begin
      if(when_Axi4Crossbar_l374_1) begin
        if(when_Axi4Crossbar_l377_1) begin
          io_slaves_1_ar_payload_burst = io_masters_0_ar_payload_burst;
        end
      end
    end
  end

  always @(*) begin
    io_slaves_1_ar_payload_lock = _zz_io_slaves_1_ar_payload_addr[53 : 53];
    if(when_Axi4Crossbar_l361_1) begin
      if(when_Axi4Crossbar_l374_1) begin
        if(when_Axi4Crossbar_l377_1) begin
          io_slaves_1_ar_payload_lock = io_masters_0_ar_payload_lock;
        end
      end
    end
  end

  always @(*) begin
    io_slaves_1_ar_payload_cache = _zz_io_slaves_1_ar_payload_addr[57 : 54];
    if(when_Axi4Crossbar_l361_1) begin
      if(when_Axi4Crossbar_l374_1) begin
        if(when_Axi4Crossbar_l377_1) begin
          io_slaves_1_ar_payload_cache = io_masters_0_ar_payload_cache;
        end
      end
    end
  end

  always @(*) begin
    io_slaves_1_ar_payload_qos = _zz_io_slaves_1_ar_payload_addr[61 : 58];
    if(when_Axi4Crossbar_l361_1) begin
      if(when_Axi4Crossbar_l374_1) begin
        if(when_Axi4Crossbar_l377_1) begin
          io_slaves_1_ar_payload_qos = io_masters_0_ar_payload_qos;
        end
      end
    end
  end

  always @(*) begin
    io_slaves_1_ar_payload_prot = _zz_io_slaves_1_ar_payload_addr[64 : 62];
    if(when_Axi4Crossbar_l361_1) begin
      if(when_Axi4Crossbar_l374_1) begin
        if(when_Axi4Crossbar_l377_1) begin
          io_slaves_1_ar_payload_prot = io_masters_0_ar_payload_prot;
        end
      end
    end
  end

  always @(*) begin
    io_slaves_1_r_ready = 1'b0;
    if(!when_Axi4Crossbar_l361_1) begin
      if(when_Axi4Crossbar_l391_1) begin
        io_slaves_1_r_ready = io_masters_0_r_ready;
      end
    end
  end

  assign when_Axi4Crossbar_l303 = (! _zz_when_Axi4Crossbar_l303);
  always @(*) begin
    _zz_when_Axi4Crossbar_l316_1[0] = ((32'h00000000 <= io_masters_0_aw_payload_addr) && (io_masters_0_aw_payload_addr < 32'h80000000));
    _zz_when_Axi4Crossbar_l316_1[1] = ((32'h80000000 <= io_masters_0_aw_payload_addr) && (io_masters_0_aw_payload_addr < 32'ha0000000));
  end

  assign _zz_when_Axi4Crossbar_l316[0] = (io_masters_0_aw_valid && _zz_when_Axi4Crossbar_l316_1[0]);
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
  assign io_slaves_0_aw_fire = (io_slaves_0_aw_valid && io_slaves_0_aw_ready);
  assign when_Axi4Crossbar_l342 = (_zz_when_Axi4Crossbar_l342 == 1'b0);
  assign io_slaves_0_b_fire = (io_slaves_0_b_valid && io_slaves_0_b_ready);
  assign when_Axi4Crossbar_l303_1 = (! _zz_when_Axi4Crossbar_l303_1);
  always @(*) begin
    _zz_when_Axi4Crossbar_l316_3[0] = ((32'h00000000 <= io_masters_0_aw_payload_addr) && (io_masters_0_aw_payload_addr < 32'h80000000));
    _zz_when_Axi4Crossbar_l316_3[1] = ((32'h80000000 <= io_masters_0_aw_payload_addr) && (io_masters_0_aw_payload_addr < 32'ha0000000));
  end

  assign _zz_when_Axi4Crossbar_l316_2[0] = (io_masters_0_aw_valid && _zz_when_Axi4Crossbar_l316_3[1]);
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
  assign io_slaves_1_aw_fire = (io_slaves_1_aw_valid && io_slaves_1_aw_ready);
  assign when_Axi4Crossbar_l342_1 = (_zz_when_Axi4Crossbar_l342_1 == 1'b0);
  assign io_slaves_1_b_fire = (io_slaves_1_b_valid && io_slaves_1_b_ready);
  assign when_Axi4Crossbar_l361 = (! _zz_when_Axi4Crossbar_l361);
  always @(*) begin
    _zz_when_Axi4Crossbar_l374_1[0] = ((32'h00000000 <= io_masters_0_ar_payload_addr) && (io_masters_0_ar_payload_addr < 32'h80000000));
    _zz_when_Axi4Crossbar_l374_1[1] = ((32'h80000000 <= io_masters_0_ar_payload_addr) && (io_masters_0_ar_payload_addr < 32'ha0000000));
  end

  assign _zz_when_Axi4Crossbar_l374[0] = (io_masters_0_ar_valid && _zz_when_Axi4Crossbar_l374_1[0]);
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
  assign io_slaves_0_ar_fire = (io_slaves_0_ar_valid && io_slaves_0_ar_ready);
  assign when_Axi4Crossbar_l391 = (_zz_when_Axi4Crossbar_l391 == 1'b0);
  assign io_slaves_0_r_fire = (io_slaves_0_r_valid && io_slaves_0_r_ready);
  assign when_Axi4Crossbar_l401 = (io_slaves_0_r_fire && io_slaves_0_r_payload_last);
  assign when_Axi4Crossbar_l361_1 = (! _zz_when_Axi4Crossbar_l361_1);
  always @(*) begin
    _zz_when_Axi4Crossbar_l374_3[0] = ((32'h00000000 <= io_masters_0_ar_payload_addr) && (io_masters_0_ar_payload_addr < 32'h80000000));
    _zz_when_Axi4Crossbar_l374_3[1] = ((32'h80000000 <= io_masters_0_ar_payload_addr) && (io_masters_0_ar_payload_addr < 32'ha0000000));
  end

  assign _zz_when_Axi4Crossbar_l374_2[0] = (io_masters_0_ar_valid && _zz_when_Axi4Crossbar_l374_3[1]);
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
  assign io_slaves_1_ar_fire = (io_slaves_1_ar_valid && io_slaves_1_ar_ready);
  assign when_Axi4Crossbar_l391_1 = (_zz_when_Axi4Crossbar_l391_1 == 1'b0);
  assign io_slaves_1_r_fire = (io_slaves_1_r_valid && io_slaves_1_r_ready);
  assign when_Axi4Crossbar_l401_1 = (io_slaves_1_r_fire && io_slaves_1_r_payload_last);
  always @(posedge clk) begin
    if(!resetn) begin
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
