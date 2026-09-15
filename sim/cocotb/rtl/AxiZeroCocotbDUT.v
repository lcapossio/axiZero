// Copyright (c) 2026 Leonardo Capossio - bard0 design  hello@bard0.com
// SPDX-License-Identifier: MIT
// Generator : SpinalHDL v1.14.2    git head : 78f29dc66110fc099a777992b6daa2f803ab445e
// Component : AxiZeroMixedTop
// Git hash  : a3c31314fb24f9764a30f8a1bf7990ac3591b363

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
  input  wire [31:0]   io_masters_0_w_payload_data,
  input  wire [3:0]    io_masters_0_w_payload_strb,
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
  output wire [31:0]   io_masters_0_r_payload_data,
  output wire [3:0]    io_masters_0_r_payload_id,
  output wire [1:0]    io_masters_0_r_payload_resp,
  output wire          io_masters_0_r_payload_last,
  input  wire          io_masters_1_aw_valid,
  output wire          io_masters_1_aw_ready,
  input  wire [31:0]   io_masters_1_aw_payload_addr,
  input  wire [3:0]    io_masters_1_aw_payload_id,
  input  wire [3:0]    io_masters_1_aw_payload_region,
  input  wire [7:0]    io_masters_1_aw_payload_len,
  input  wire [2:0]    io_masters_1_aw_payload_size,
  input  wire [1:0]    io_masters_1_aw_payload_burst,
  input  wire [0:0]    io_masters_1_aw_payload_lock,
  input  wire [3:0]    io_masters_1_aw_payload_cache,
  input  wire [3:0]    io_masters_1_aw_payload_qos,
  input  wire [2:0]    io_masters_1_aw_payload_prot,
  input  wire          io_masters_1_w_valid,
  output wire          io_masters_1_w_ready,
  input  wire [31:0]   io_masters_1_w_payload_data,
  input  wire [3:0]    io_masters_1_w_payload_strb,
  input  wire          io_masters_1_w_payload_last,
  output wire          io_masters_1_b_valid,
  input  wire          io_masters_1_b_ready,
  output wire [3:0]    io_masters_1_b_payload_id,
  output wire [1:0]    io_masters_1_b_payload_resp,
  input  wire          io_masters_1_ar_valid,
  output wire          io_masters_1_ar_ready,
  input  wire [31:0]   io_masters_1_ar_payload_addr,
  input  wire [3:0]    io_masters_1_ar_payload_id,
  input  wire [3:0]    io_masters_1_ar_payload_region,
  input  wire [7:0]    io_masters_1_ar_payload_len,
  input  wire [2:0]    io_masters_1_ar_payload_size,
  input  wire [1:0]    io_masters_1_ar_payload_burst,
  input  wire [0:0]    io_masters_1_ar_payload_lock,
  input  wire [3:0]    io_masters_1_ar_payload_cache,
  input  wire [3:0]    io_masters_1_ar_payload_qos,
  input  wire [2:0]    io_masters_1_ar_payload_prot,
  output wire          io_masters_1_r_valid,
  input  wire          io_masters_1_r_ready,
  output wire [31:0]   io_masters_1_r_payload_data,
  output wire [3:0]    io_masters_1_r_payload_id,
  output wire [1:0]    io_masters_1_r_payload_resp,
  output wire          io_masters_1_r_payload_last,
  output wire          io_slaves_0_aw_valid,
  input  wire          io_slaves_0_aw_ready,
  output wire [31:0]   io_slaves_0_aw_payload_addr,
  output wire [4:0]    io_slaves_0_aw_payload_id,
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
  output wire [31:0]   io_slaves_0_w_payload_data,
  output wire [3:0]    io_slaves_0_w_payload_strb,
  output wire          io_slaves_0_w_payload_last,
  input  wire          io_slaves_0_b_valid,
  output wire          io_slaves_0_b_ready,
  input  wire [4:0]    io_slaves_0_b_payload_id,
  input  wire [1:0]    io_slaves_0_b_payload_resp,
  output wire          io_slaves_0_ar_valid,
  input  wire          io_slaves_0_ar_ready,
  output wire [31:0]   io_slaves_0_ar_payload_addr,
  output wire [4:0]    io_slaves_0_ar_payload_id,
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
  input  wire [31:0]   io_slaves_0_r_payload_data,
  input  wire [4:0]    io_slaves_0_r_payload_id,
  input  wire [1:0]    io_slaves_0_r_payload_resp,
  input  wire          io_slaves_0_r_payload_last,
  output wire          io_slaves_1_aw_valid,
  input  wire          io_slaves_1_aw_ready,
  output wire [31:0]   io_slaves_1_aw_payload_addr,
  output wire [4:0]    io_slaves_1_aw_payload_id,
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
  output wire [31:0]   io_slaves_1_w_payload_data,
  output wire [3:0]    io_slaves_1_w_payload_strb,
  output wire          io_slaves_1_w_payload_last,
  input  wire          io_slaves_1_b_valid,
  output wire          io_slaves_1_b_ready,
  input  wire [4:0]    io_slaves_1_b_payload_id,
  input  wire [1:0]    io_slaves_1_b_payload_resp,
  output wire          io_slaves_1_ar_valid,
  input  wire          io_slaves_1_ar_ready,
  output wire [31:0]   io_slaves_1_ar_payload_addr,
  output wire [4:0]    io_slaves_1_ar_payload_id,
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
  input  wire [31:0]   io_slaves_1_r_payload_data,
  input  wire [4:0]    io_slaves_1_r_payload_id,
  input  wire [1:0]    io_slaves_1_r_payload_resp,
  input  wire          io_slaves_1_r_payload_last,
  input  wire          clk,
  input  wire          resetn
);

  wire                xbar_io_masters_0_ar_ready;
  wire                xbar_io_masters_0_aw_ready;
  wire                xbar_io_masters_0_w_ready;
  wire                xbar_io_masters_0_r_valid;
  wire       [31:0]   xbar_io_masters_0_r_payload_data;
  wire       [3:0]    xbar_io_masters_0_r_payload_id;
  wire       [1:0]    xbar_io_masters_0_r_payload_resp;
  wire                xbar_io_masters_0_r_payload_last;
  wire                xbar_io_masters_0_b_valid;
  wire       [3:0]    xbar_io_masters_0_b_payload_id;
  wire       [1:0]    xbar_io_masters_0_b_payload_resp;
  wire                xbar_io_masters_1_ar_ready;
  wire                xbar_io_masters_1_aw_ready;
  wire                xbar_io_masters_1_w_ready;
  wire                xbar_io_masters_1_r_valid;
  wire       [31:0]   xbar_io_masters_1_r_payload_data;
  wire       [3:0]    xbar_io_masters_1_r_payload_id;
  wire       [1:0]    xbar_io_masters_1_r_payload_resp;
  wire                xbar_io_masters_1_r_payload_last;
  wire                xbar_io_masters_1_b_valid;
  wire       [3:0]    xbar_io_masters_1_b_payload_id;
  wire       [1:0]    xbar_io_masters_1_b_payload_resp;
  wire                xbar_io_slaves_0_ar_valid;
  wire       [31:0]   xbar_io_slaves_0_ar_payload_addr;
  wire       [4:0]    xbar_io_slaves_0_ar_payload_id;
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
  wire       [4:0]    xbar_io_slaves_0_aw_payload_id;
  wire       [3:0]    xbar_io_slaves_0_aw_payload_region;
  wire       [7:0]    xbar_io_slaves_0_aw_payload_len;
  wire       [2:0]    xbar_io_slaves_0_aw_payload_size;
  wire       [1:0]    xbar_io_slaves_0_aw_payload_burst;
  wire       [0:0]    xbar_io_slaves_0_aw_payload_lock;
  wire       [3:0]    xbar_io_slaves_0_aw_payload_cache;
  wire       [3:0]    xbar_io_slaves_0_aw_payload_qos;
  wire       [2:0]    xbar_io_slaves_0_aw_payload_prot;
  wire                xbar_io_slaves_0_w_valid;
  wire       [31:0]   xbar_io_slaves_0_w_payload_data;
  wire       [3:0]    xbar_io_slaves_0_w_payload_strb;
  wire                xbar_io_slaves_0_w_payload_last;
  wire                xbar_io_slaves_0_r_ready;
  wire                xbar_io_slaves_0_b_ready;
  wire                xbar_io_slaves_1_ar_valid;
  wire       [31:0]   xbar_io_slaves_1_ar_payload_addr;
  wire       [4:0]    xbar_io_slaves_1_ar_payload_id;
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
  wire       [4:0]    xbar_io_slaves_1_aw_payload_id;
  wire       [3:0]    xbar_io_slaves_1_aw_payload_region;
  wire       [7:0]    xbar_io_slaves_1_aw_payload_len;
  wire       [2:0]    xbar_io_slaves_1_aw_payload_size;
  wire       [1:0]    xbar_io_slaves_1_aw_payload_burst;
  wire       [0:0]    xbar_io_slaves_1_aw_payload_lock;
  wire       [3:0]    xbar_io_slaves_1_aw_payload_cache;
  wire       [3:0]    xbar_io_slaves_1_aw_payload_qos;
  wire       [2:0]    xbar_io_slaves_1_aw_payload_prot;
  wire                xbar_io_slaves_1_w_valid;
  wire       [31:0]   xbar_io_slaves_1_w_payload_data;
  wire       [3:0]    xbar_io_slaves_1_w_payload_strb;
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
    .io_masters_0_w_payload_data    (io_masters_0_w_payload_data[31:0]      ), //i
    .io_masters_0_w_payload_strb    (io_masters_0_w_payload_strb[3:0]       ), //i
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
    .io_masters_0_r_payload_data    (xbar_io_masters_0_r_payload_data[31:0] ), //o
    .io_masters_0_r_payload_id      (xbar_io_masters_0_r_payload_id[3:0]    ), //o
    .io_masters_0_r_payload_resp    (xbar_io_masters_0_r_payload_resp[1:0]  ), //o
    .io_masters_0_r_payload_last    (xbar_io_masters_0_r_payload_last       ), //o
    .io_masters_1_aw_valid          (io_masters_1_aw_valid                  ), //i
    .io_masters_1_aw_ready          (xbar_io_masters_1_aw_ready             ), //o
    .io_masters_1_aw_payload_addr   (io_masters_1_aw_payload_addr[31:0]     ), //i
    .io_masters_1_aw_payload_id     (io_masters_1_aw_payload_id[3:0]        ), //i
    .io_masters_1_aw_payload_region (io_masters_1_aw_payload_region[3:0]    ), //i
    .io_masters_1_aw_payload_len    (io_masters_1_aw_payload_len[7:0]       ), //i
    .io_masters_1_aw_payload_size   (io_masters_1_aw_payload_size[2:0]      ), //i
    .io_masters_1_aw_payload_burst  (io_masters_1_aw_payload_burst[1:0]     ), //i
    .io_masters_1_aw_payload_lock   (io_masters_1_aw_payload_lock           ), //i
    .io_masters_1_aw_payload_cache  (io_masters_1_aw_payload_cache[3:0]     ), //i
    .io_masters_1_aw_payload_qos    (io_masters_1_aw_payload_qos[3:0]       ), //i
    .io_masters_1_aw_payload_prot   (io_masters_1_aw_payload_prot[2:0]      ), //i
    .io_masters_1_w_valid           (io_masters_1_w_valid                   ), //i
    .io_masters_1_w_ready           (xbar_io_masters_1_w_ready              ), //o
    .io_masters_1_w_payload_data    (io_masters_1_w_payload_data[31:0]      ), //i
    .io_masters_1_w_payload_strb    (io_masters_1_w_payload_strb[3:0]       ), //i
    .io_masters_1_w_payload_last    (io_masters_1_w_payload_last            ), //i
    .io_masters_1_b_valid           (xbar_io_masters_1_b_valid              ), //o
    .io_masters_1_b_ready           (io_masters_1_b_ready                   ), //i
    .io_masters_1_b_payload_id      (xbar_io_masters_1_b_payload_id[3:0]    ), //o
    .io_masters_1_b_payload_resp    (xbar_io_masters_1_b_payload_resp[1:0]  ), //o
    .io_masters_1_ar_valid          (io_masters_1_ar_valid                  ), //i
    .io_masters_1_ar_ready          (xbar_io_masters_1_ar_ready             ), //o
    .io_masters_1_ar_payload_addr   (io_masters_1_ar_payload_addr[31:0]     ), //i
    .io_masters_1_ar_payload_id     (io_masters_1_ar_payload_id[3:0]        ), //i
    .io_masters_1_ar_payload_region (io_masters_1_ar_payload_region[3:0]    ), //i
    .io_masters_1_ar_payload_len    (io_masters_1_ar_payload_len[7:0]       ), //i
    .io_masters_1_ar_payload_size   (io_masters_1_ar_payload_size[2:0]      ), //i
    .io_masters_1_ar_payload_burst  (io_masters_1_ar_payload_burst[1:0]     ), //i
    .io_masters_1_ar_payload_lock   (io_masters_1_ar_payload_lock           ), //i
    .io_masters_1_ar_payload_cache  (io_masters_1_ar_payload_cache[3:0]     ), //i
    .io_masters_1_ar_payload_qos    (io_masters_1_ar_payload_qos[3:0]       ), //i
    .io_masters_1_ar_payload_prot   (io_masters_1_ar_payload_prot[2:0]      ), //i
    .io_masters_1_r_valid           (xbar_io_masters_1_r_valid              ), //o
    .io_masters_1_r_ready           (io_masters_1_r_ready                   ), //i
    .io_masters_1_r_payload_data    (xbar_io_masters_1_r_payload_data[31:0] ), //o
    .io_masters_1_r_payload_id      (xbar_io_masters_1_r_payload_id[3:0]    ), //o
    .io_masters_1_r_payload_resp    (xbar_io_masters_1_r_payload_resp[1:0]  ), //o
    .io_masters_1_r_payload_last    (xbar_io_masters_1_r_payload_last       ), //o
    .io_slaves_0_aw_valid           (xbar_io_slaves_0_aw_valid              ), //o
    .io_slaves_0_aw_ready           (io_slaves_0_aw_ready                   ), //i
    .io_slaves_0_aw_payload_addr    (xbar_io_slaves_0_aw_payload_addr[31:0] ), //o
    .io_slaves_0_aw_payload_id      (xbar_io_slaves_0_aw_payload_id[4:0]    ), //o
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
    .io_slaves_0_w_payload_data     (xbar_io_slaves_0_w_payload_data[31:0]  ), //o
    .io_slaves_0_w_payload_strb     (xbar_io_slaves_0_w_payload_strb[3:0]   ), //o
    .io_slaves_0_w_payload_last     (xbar_io_slaves_0_w_payload_last        ), //o
    .io_slaves_0_b_valid            (io_slaves_0_b_valid                    ), //i
    .io_slaves_0_b_ready            (xbar_io_slaves_0_b_ready               ), //o
    .io_slaves_0_b_payload_id       (io_slaves_0_b_payload_id[4:0]          ), //i
    .io_slaves_0_b_payload_resp     (io_slaves_0_b_payload_resp[1:0]        ), //i
    .io_slaves_0_ar_valid           (xbar_io_slaves_0_ar_valid              ), //o
    .io_slaves_0_ar_ready           (io_slaves_0_ar_ready                   ), //i
    .io_slaves_0_ar_payload_addr    (xbar_io_slaves_0_ar_payload_addr[31:0] ), //o
    .io_slaves_0_ar_payload_id      (xbar_io_slaves_0_ar_payload_id[4:0]    ), //o
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
    .io_slaves_0_r_payload_data     (io_slaves_0_r_payload_data[31:0]       ), //i
    .io_slaves_0_r_payload_id       (io_slaves_0_r_payload_id[4:0]          ), //i
    .io_slaves_0_r_payload_resp     (io_slaves_0_r_payload_resp[1:0]        ), //i
    .io_slaves_0_r_payload_last     (io_slaves_0_r_payload_last             ), //i
    .io_slaves_1_aw_valid           (xbar_io_slaves_1_aw_valid              ), //o
    .io_slaves_1_aw_ready           (io_slaves_1_aw_ready                   ), //i
    .io_slaves_1_aw_payload_addr    (xbar_io_slaves_1_aw_payload_addr[31:0] ), //o
    .io_slaves_1_aw_payload_id      (xbar_io_slaves_1_aw_payload_id[4:0]    ), //o
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
    .io_slaves_1_w_payload_data     (xbar_io_slaves_1_w_payload_data[31:0]  ), //o
    .io_slaves_1_w_payload_strb     (xbar_io_slaves_1_w_payload_strb[3:0]   ), //o
    .io_slaves_1_w_payload_last     (xbar_io_slaves_1_w_payload_last        ), //o
    .io_slaves_1_b_valid            (io_slaves_1_b_valid                    ), //i
    .io_slaves_1_b_ready            (xbar_io_slaves_1_b_ready               ), //o
    .io_slaves_1_b_payload_id       (io_slaves_1_b_payload_id[4:0]          ), //i
    .io_slaves_1_b_payload_resp     (io_slaves_1_b_payload_resp[1:0]        ), //i
    .io_slaves_1_ar_valid           (xbar_io_slaves_1_ar_valid              ), //o
    .io_slaves_1_ar_ready           (io_slaves_1_ar_ready                   ), //i
    .io_slaves_1_ar_payload_addr    (xbar_io_slaves_1_ar_payload_addr[31:0] ), //o
    .io_slaves_1_ar_payload_id      (xbar_io_slaves_1_ar_payload_id[4:0]    ), //o
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
    .io_slaves_1_r_payload_data     (io_slaves_1_r_payload_data[31:0]       ), //i
    .io_slaves_1_r_payload_id       (io_slaves_1_r_payload_id[4:0]          ), //i
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
  assign io_masters_1_aw_ready = xbar_io_masters_1_aw_ready;
  assign io_masters_1_w_ready = xbar_io_masters_1_w_ready;
  assign io_masters_1_b_valid = xbar_io_masters_1_b_valid;
  assign io_masters_1_b_payload_id = xbar_io_masters_1_b_payload_id;
  assign io_masters_1_b_payload_resp = xbar_io_masters_1_b_payload_resp;
  assign io_masters_1_ar_ready = xbar_io_masters_1_ar_ready;
  assign io_masters_1_r_valid = xbar_io_masters_1_r_valid;
  assign io_masters_1_r_payload_data = xbar_io_masters_1_r_payload_data;
  assign io_masters_1_r_payload_id = xbar_io_masters_1_r_payload_id;
  assign io_masters_1_r_payload_resp = xbar_io_masters_1_r_payload_resp;
  assign io_masters_1_r_payload_last = xbar_io_masters_1_r_payload_last;
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
  input  wire [31:0]   io_masters_0_w_payload_data,
  input  wire [3:0]    io_masters_0_w_payload_strb,
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
  output reg  [31:0]   io_masters_0_r_payload_data,
  output reg  [3:0]    io_masters_0_r_payload_id,
  output reg  [1:0]    io_masters_0_r_payload_resp,
  output reg           io_masters_0_r_payload_last,
  input  wire          io_masters_1_aw_valid,
  output reg           io_masters_1_aw_ready,
  input  wire [31:0]   io_masters_1_aw_payload_addr,
  input  wire [3:0]    io_masters_1_aw_payload_id,
  input  wire [3:0]    io_masters_1_aw_payload_region,
  input  wire [7:0]    io_masters_1_aw_payload_len,
  input  wire [2:0]    io_masters_1_aw_payload_size,
  input  wire [1:0]    io_masters_1_aw_payload_burst,
  input  wire [0:0]    io_masters_1_aw_payload_lock,
  input  wire [3:0]    io_masters_1_aw_payload_cache,
  input  wire [3:0]    io_masters_1_aw_payload_qos,
  input  wire [2:0]    io_masters_1_aw_payload_prot,
  input  wire          io_masters_1_w_valid,
  output reg           io_masters_1_w_ready,
  input  wire [31:0]   io_masters_1_w_payload_data,
  input  wire [3:0]    io_masters_1_w_payload_strb,
  input  wire          io_masters_1_w_payload_last,
  output reg           io_masters_1_b_valid,
  input  wire          io_masters_1_b_ready,
  output reg  [3:0]    io_masters_1_b_payload_id,
  output reg  [1:0]    io_masters_1_b_payload_resp,
  input  wire          io_masters_1_ar_valid,
  output reg           io_masters_1_ar_ready,
  input  wire [31:0]   io_masters_1_ar_payload_addr,
  input  wire [3:0]    io_masters_1_ar_payload_id,
  input  wire [3:0]    io_masters_1_ar_payload_region,
  input  wire [7:0]    io_masters_1_ar_payload_len,
  input  wire [2:0]    io_masters_1_ar_payload_size,
  input  wire [1:0]    io_masters_1_ar_payload_burst,
  input  wire [0:0]    io_masters_1_ar_payload_lock,
  input  wire [3:0]    io_masters_1_ar_payload_cache,
  input  wire [3:0]    io_masters_1_ar_payload_qos,
  input  wire [2:0]    io_masters_1_ar_payload_prot,
  output reg           io_masters_1_r_valid,
  input  wire          io_masters_1_r_ready,
  output reg  [31:0]   io_masters_1_r_payload_data,
  output reg  [3:0]    io_masters_1_r_payload_id,
  output reg  [1:0]    io_masters_1_r_payload_resp,
  output reg           io_masters_1_r_payload_last,
  output reg           io_slaves_0_aw_valid,
  input  wire          io_slaves_0_aw_ready,
  output reg  [31:0]   io_slaves_0_aw_payload_addr,
  output reg  [4:0]    io_slaves_0_aw_payload_id,
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
  output reg  [31:0]   io_slaves_0_w_payload_data,
  output reg  [3:0]    io_slaves_0_w_payload_strb,
  output reg           io_slaves_0_w_payload_last,
  input  wire          io_slaves_0_b_valid,
  output reg           io_slaves_0_b_ready,
  input  wire [4:0]    io_slaves_0_b_payload_id,
  input  wire [1:0]    io_slaves_0_b_payload_resp,
  output reg           io_slaves_0_ar_valid,
  input  wire          io_slaves_0_ar_ready,
  output reg  [31:0]   io_slaves_0_ar_payload_addr,
  output reg  [4:0]    io_slaves_0_ar_payload_id,
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
  input  wire [31:0]   io_slaves_0_r_payload_data,
  input  wire [4:0]    io_slaves_0_r_payload_id,
  input  wire [1:0]    io_slaves_0_r_payload_resp,
  input  wire          io_slaves_0_r_payload_last,
  output reg           io_slaves_1_aw_valid,
  input  wire          io_slaves_1_aw_ready,
  output reg  [31:0]   io_slaves_1_aw_payload_addr,
  output reg  [4:0]    io_slaves_1_aw_payload_id,
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
  output reg  [31:0]   io_slaves_1_w_payload_data,
  output reg  [3:0]    io_slaves_1_w_payload_strb,
  output reg           io_slaves_1_w_payload_last,
  input  wire          io_slaves_1_b_valid,
  output reg           io_slaves_1_b_ready,
  input  wire [4:0]    io_slaves_1_b_payload_id,
  input  wire [1:0]    io_slaves_1_b_payload_resp,
  output reg           io_slaves_1_ar_valid,
  input  wire          io_slaves_1_ar_ready,
  output reg  [31:0]   io_slaves_1_ar_payload_addr,
  output reg  [4:0]    io_slaves_1_ar_payload_id,
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
  input  wire [31:0]   io_slaves_1_r_payload_data,
  input  wire [4:0]    io_slaves_1_r_payload_id,
  input  wire [1:0]    io_slaves_1_r_payload_resp,
  input  wire          io_slaves_1_r_payload_last,
  input  wire          clk,
  input  wire          resetn
);

  reg                 decErr_io_axi_aw_valid;
  reg        [31:0]   decErr_io_axi_aw_payload_addr;
  reg        [4:0]    decErr_io_axi_aw_payload_id;
  wire       [3:0]    decErr_io_axi_aw_payload_region;
  reg        [7:0]    decErr_io_axi_aw_payload_len;
  reg        [2:0]    decErr_io_axi_aw_payload_size;
  reg        [1:0]    decErr_io_axi_aw_payload_burst;
  reg        [0:0]    decErr_io_axi_aw_payload_lock;
  reg        [3:0]    decErr_io_axi_aw_payload_cache;
  reg        [3:0]    decErr_io_axi_aw_payload_qos;
  reg        [2:0]    decErr_io_axi_aw_payload_prot;
  reg                 decErr_io_axi_w_valid;
  reg        [31:0]   decErr_io_axi_w_payload_data;
  reg        [3:0]    decErr_io_axi_w_payload_strb;
  reg                 decErr_io_axi_w_payload_last;
  reg                 decErr_io_axi_b_ready;
  reg                 decErr_io_axi_ar_valid;
  reg        [31:0]   decErr_io_axi_ar_payload_addr;
  reg        [4:0]    decErr_io_axi_ar_payload_id;
  wire       [3:0]    decErr_io_axi_ar_payload_region;
  reg        [7:0]    decErr_io_axi_ar_payload_len;
  reg        [2:0]    decErr_io_axi_ar_payload_size;
  reg        [1:0]    decErr_io_axi_ar_payload_burst;
  reg        [0:0]    decErr_io_axi_ar_payload_lock;
  reg        [3:0]    decErr_io_axi_ar_payload_cache;
  reg        [3:0]    decErr_io_axi_ar_payload_qos;
  reg        [2:0]    decErr_io_axi_ar_payload_prot;
  reg                 decErr_io_axi_r_ready;
  wire       [0:0]    _zz_4_spinal_port0;
  wire       [0:0]    _zz_5_spinal_port0;
  wire       [0:0]    _zz_6_spinal_port0;
  wire                decErr_io_axi_ar_ready;
  wire                decErr_io_axi_aw_ready;
  wire                decErr_io_axi_w_ready;
  wire                decErr_io_axi_r_valid;
  wire       [31:0]   decErr_io_axi_r_payload_data;
  wire       [4:0]    decErr_io_axi_r_payload_id;
  wire       [1:0]    decErr_io_axi_r_payload_resp;
  wire                decErr_io_axi_r_payload_last;
  wire                decErr_io_axi_b_valid;
  wire       [4:0]    decErr_io_axi_b_payload_id;
  wire       [1:0]    decErr_io_axi_b_payload_resp;
  wire       [2:0]    _zz__zz_when_Axi4Crossbar_l878_26;
  wire       [2:0]    _zz__zz_when_Axi4Crossbar_l878_26_1;
  wire       [1:0]    _zz__zz_when_Axi4Crossbar_l340_4;
  wire       [1:0]    _zz__zz_when_Axi4Crossbar_l340_4_1;
  wire       [1:0]    _zz__zz_7;
  wire       [0:0]    _zz__zz_4_port;
  wire       [1:0]    _zz__zz_when_Axi4Crossbar_l942;
  wire       [2:0]    _zz__zz_when_Axi4Crossbar_l878_31;
  wire       [2:0]    _zz__zz_when_Axi4Crossbar_l878_31_1;
  wire       [1:0]    _zz__zz_when_Axi4Crossbar_l340_9;
  wire       [1:0]    _zz__zz_when_Axi4Crossbar_l340_9_1;
  wire       [1:0]    _zz__zz_8;
  wire       [0:0]    _zz__zz_5_port;
  wire       [1:0]    _zz__zz_when_Axi4Crossbar_l942_1;
  wire       [2:0]    _zz__zz_when_Axi4Crossbar_l878_36;
  wire       [2:0]    _zz__zz_when_Axi4Crossbar_l878_36_1;
  wire       [1:0]    _zz__zz_when_Axi4Crossbar_l340_14;
  wire       [1:0]    _zz__zz_when_Axi4Crossbar_l340_14_1;
  wire       [1:0]    _zz__zz_9;
  wire       [0:0]    _zz__zz_6_port;
  wire       [1:0]    _zz__zz_when_Axi4Crossbar_l942_2;
  wire       [1:0]    _zz__zz_when_Axi4Crossbar_l808_25;
  wire       [1:0]    _zz__zz_when_Axi4Crossbar_l808_41;
  wire       [1:0]    _zz__zz_when_Axi4Crossbar_l808_57;
  wire       [1:0]    _zz__zz_when_Axi4Crossbar_l808_73;
  wire       [0:0]    _zz__zz_respLockOH;
  wire       [0:0]    _zz__zz_respLockOH_1;
  wire       [0:0]    _zz__zz_respLockOH_2;
  wire       [2:0]    _zz__zz_respLockOH_2_1;
  wire       [0:0]    _zz__zz_respLockOH_3;
  wire       [0:0]    _zz__zz_respLockOH_3_1;
  wire       [0:0]    _zz__zz_respLockOH_3_2;
  wire       [2:0]    _zz__zz_respLockOH_5;
  wire       [2:0]    _zz__zz_when_Axi4Crossbar_l1081_23;
  wire       [2:0]    _zz__zz_when_Axi4Crossbar_l1081_23_1;
  wire       [1:0]    _zz__zz_when_Axi4Crossbar_l340_19;
  wire       [1:0]    _zz__zz_when_Axi4Crossbar_l340_19_1;
  wire       [2:0]    _zz__zz_when_Axi4Crossbar_l1081_26;
  wire       [2:0]    _zz__zz_when_Axi4Crossbar_l1081_26_1;
  wire       [1:0]    _zz__zz_when_Axi4Crossbar_l340_24;
  wire       [1:0]    _zz__zz_when_Axi4Crossbar_l340_24_1;
  wire       [2:0]    _zz__zz_when_Axi4Crossbar_l1081_29;
  wire       [2:0]    _zz__zz_when_Axi4Crossbar_l1081_29_1;
  wire       [1:0]    _zz__zz_when_Axi4Crossbar_l340_29;
  wire       [1:0]    _zz__zz_when_Axi4Crossbar_l340_29_1;
  wire       [0:0]    _zz__zz_respLockOH_6;
  wire       [0:0]    _zz__zz_respLockOH_6_1;
  wire       [0:0]    _zz__zz_respLockOH_6_2;
  wire       [2:0]    _zz__zz_respLockOH_8;
  wire       [0:0]    _zz__zz_respLockOH_9;
  wire       [0:0]    _zz__zz_respLockOH_9_1;
  wire       [0:0]    _zz__zz_respLockOH_9_2;
  wire       [2:0]    _zz__zz_respLockOH_11;
  reg                 _zz_1;
  reg                 _zz_2;
  reg                 _zz_3;
  reg        [0:0]    wrRrPtr_0;
  reg        [0:0]    wrRrPtr_1;
  reg        [0:0]    wrRrPtr_2;
  reg        [0:0]    rdRrPtr_0;
  reg        [0:0]    rdRrPtr_1;
  reg        [0:0]    rdRrPtr_2;
  wire       [5:0]    _zz_io_masters_0_b_payload_id;
  wire       [38:0]   _zz_io_masters_0_r_payload_data;
  wire       [5:0]    _zz_io_masters_1_b_payload_id;
  wire       [38:0]   _zz_io_masters_1_r_payload_data;
  wire       [65:0]   _zz_io_slaves_0_aw_payload_addr;
  wire       [36:0]   _zz_io_slaves_0_w_payload_data;
  wire       [65:0]   _zz_io_slaves_0_ar_payload_addr;
  wire       [65:0]   _zz_io_slaves_1_aw_payload_addr;
  wire       [36:0]   _zz_io_slaves_1_w_payload_data;
  wire       [65:0]   _zz_io_slaves_1_ar_payload_addr;
  wire       [65:0]   _zz_io_axi_aw_payload_addr;
  wire       [36:0]   _zz_io_axi_w_payload_data;
  wire       [65:0]   _zz_io_axi_ar_payload_addr;
  reg        [2:0]    _zz_when_Axi4Crossbar_l878;
  reg        [2:0]    _zz_when_Axi4Crossbar_l878_1;
  reg        [2:0]    _zz_when_Axi4Crossbar_l878_2;
  reg        [1:0]    _zz_7;
  reg        [1:0]    _zz_8;
  reg        [1:0]    _zz_9;
  reg        [1:0]    _zz_when_Axi4Crossbar_l942;
  reg        [1:0]    _zz_when_Axi4Crossbar_l942_1;
  reg        [1:0]    _zz_when_Axi4Crossbar_l942_2;
  reg        [2:0]    _zz_when_Axi4Crossbar_l895;
  reg        [2:0]    _zz_when_Axi4Crossbar_l895_1;
  reg        [2:0]    _zz_when_Axi4Crossbar_l895_2;
  reg        [2:0]    _zz_when_Axi4Crossbar_l1081;
  reg        [2:0]    _zz_when_Axi4Crossbar_l1081_1;
  reg        [2:0]    _zz_when_Axi4Crossbar_l1081_2;
  reg                 _zz_when_Axi4Crossbar_l808;
  reg                 _zz_when_Axi4Crossbar_l808_1;
  reg                 _zz_when_Axi4Crossbar_l808_2;
  reg                 _zz_when_Axi4Crossbar_l808_3;
  reg        [3:0]    _zz_when_Axi4Crossbar_l808_4;
  reg        [3:0]    _zz_when_Axi4Crossbar_l808_5;
  reg        [3:0]    _zz_when_Axi4Crossbar_l808_6;
  reg        [3:0]    _zz_when_Axi4Crossbar_l808_7;
  reg        [1:0]    _zz_when_Axi4Crossbar_l878_3;
  reg        [1:0]    _zz_when_Axi4Crossbar_l878_4;
  reg        [1:0]    _zz_when_Axi4Crossbar_l878_5;
  reg        [1:0]    _zz_when_Axi4Crossbar_l878_6;
  reg        [2:0]    _zz_when_Axi4Crossbar_l815;
  reg        [2:0]    _zz_when_Axi4Crossbar_l815_1;
  reg        [2:0]    _zz_when_Axi4Crossbar_l815_2;
  reg        [2:0]    _zz_when_Axi4Crossbar_l815_3;
  reg                 _zz_when_Axi4Crossbar_l808_8;
  reg                 _zz_when_Axi4Crossbar_l808_9;
  reg                 _zz_when_Axi4Crossbar_l808_10;
  reg                 _zz_when_Axi4Crossbar_l808_11;
  reg        [3:0]    _zz_when_Axi4Crossbar_l808_12;
  reg        [3:0]    _zz_when_Axi4Crossbar_l808_13;
  reg        [3:0]    _zz_when_Axi4Crossbar_l808_14;
  reg        [3:0]    _zz_when_Axi4Crossbar_l808_15;
  reg        [1:0]    _zz_when_Axi4Crossbar_l1081_3;
  reg        [1:0]    _zz_when_Axi4Crossbar_l1081_4;
  reg        [1:0]    _zz_when_Axi4Crossbar_l1081_5;
  reg        [1:0]    _zz_when_Axi4Crossbar_l1081_6;
  reg        [2:0]    _zz_when_Axi4Crossbar_l815_4;
  reg        [2:0]    _zz_when_Axi4Crossbar_l815_5;
  reg        [2:0]    _zz_when_Axi4Crossbar_l815_6;
  reg        [2:0]    _zz_when_Axi4Crossbar_l815_7;
  reg        [2:0]    _zz_when_Axi4Crossbar_l878_7;
  reg        [2:0]    _zz_when_Axi4Crossbar_l878_8;
  reg        [1:0]    _zz_when_Axi4Crossbar_l878_9;
  reg        [1:0]    _zz_when_Axi4Crossbar_l878_10;
  reg        [2:0]    _zz_when_Axi4Crossbar_l878_11;
  reg        [2:0]    _zz_when_Axi4Crossbar_l878_12;
  wire       [2:0]    _zz_when_Axi4Crossbar_l1081_7;
  wire       [2:0]    _zz_when_Axi4Crossbar_l1081_8;
  wire       [3:0]    _zz_when_Axi4Crossbar_l878_13;
  wire                _zz_when_Axi4Crossbar_l878_14;
  wire                _zz_when_Axi4Crossbar_l878_15;
  wire                _zz_when_Axi4Crossbar_l878_16;
  reg        [1:0]    _zz_when_Axi4Crossbar_l878_17;
  reg        [2:0]    _zz_when_Axi4Crossbar_l878_18;
  wire       [3:0]    _zz_when_Axi4Crossbar_l1081_9;
  wire                _zz_when_Axi4Crossbar_l1081_10;
  wire                _zz_when_Axi4Crossbar_l1081_11;
  wire                _zz_when_Axi4Crossbar_l1081_12;
  reg        [1:0]    _zz_when_Axi4Crossbar_l1081_13;
  reg        [2:0]    _zz_when_Axi4Crossbar_l1081_14;
  wire       [3:0]    _zz_when_Axi4Crossbar_l878_19;
  wire                _zz_when_Axi4Crossbar_l878_20;
  wire                _zz_when_Axi4Crossbar_l878_21;
  wire                _zz_when_Axi4Crossbar_l878_22;
  reg        [1:0]    _zz_when_Axi4Crossbar_l878_23;
  reg        [2:0]    _zz_when_Axi4Crossbar_l878_24;
  wire       [3:0]    _zz_when_Axi4Crossbar_l1081_15;
  wire                _zz_when_Axi4Crossbar_l1081_16;
  wire                _zz_when_Axi4Crossbar_l1081_17;
  wire                _zz_when_Axi4Crossbar_l1081_18;
  reg        [1:0]    _zz_when_Axi4Crossbar_l1081_19;
  reg        [2:0]    _zz_when_Axi4Crossbar_l1081_20;
  reg        [2:0]    _zz_when_Axi4Crossbar_l1021;
  reg        [2:0]    _zz_when_Axi4Crossbar_l1021_1;
  reg        [2:0]    _zz_when_Axi4Crossbar_l1026;
  reg        [2:0]    _zz_when_Axi4Crossbar_l1026_1;
  wire                _zz_when_Axi4Crossbar_l878_25;
  reg        [1:0]    _zz_when_Axi4Crossbar_l878_26;
  reg        [1:0]    _zz_when_Axi4Crossbar_l878_27;
  reg        [1:0]    _zz_when_Axi4Crossbar_l878_28;
  reg        [1:0]    _zz_when_Axi4Crossbar_l340;
  wire       [1:0]    _zz_when_Axi4Crossbar_l340_1;
  wire       [1:0]    _zz_when_Axi4Crossbar_l340_2;
  wire       [1:0]    _zz_when_Axi4Crossbar_l340_3;
  wire       [1:0]    _zz_when_Axi4Crossbar_l340_4;
  reg        [0:0]    _zz_io_slaves_0_aw_payload_id;
  wire                when_Axi4Crossbar_l340;
  wire                when_Axi4Crossbar_l340_1;
  reg                 grantLock;
  reg        [0:0]    grantLockIdx;
  wire       [0:0]    _zz_io_slaves_0_aw_payload_id_1;
  wire                when_Axi4Crossbar_l269;
  wire                _zz_when_Axi4Crossbar_l878_29;
  wire                _zz_when_Axi4Crossbar_l895_3;
  wire       [0:0]    _zz_when_Axi4Crossbar_l942_3;
  reg                 _zz_when_Axi4Crossbar_l895_4;
  wire                when_Axi4Crossbar_l878;
  wire                when_Axi4Crossbar_l881;
  wire                when_Axi4Crossbar_l895;
  wire                when_Axi4Crossbar_l881_1;
  wire                when_Axi4Crossbar_l895_1;
  wire                io_slaves_0_aw_fire;
  wire                io_slaves_0_w_fire;
  wire                _zz_when_Axi4Crossbar_l914;
  wire                _zz_when_Axi4Crossbar_l926;
  wire                when_Axi4Crossbar_l914;
  wire                when_Axi4Crossbar_l926;
  wire                when_Axi4Crossbar_l940;
  wire                when_Axi4Crossbar_l942;
  wire                when_Axi4Crossbar_l942_1;
  wire                when_Axi4Crossbar_l953;
  wire                when_Axi4Crossbar_l959;
  wire                when_Axi4Crossbar_l961;
  wire                io_slaves_0_b_fire;
  wire                when_Axi4Crossbar_l968;
  wire                when_Axi4Crossbar_l970;
  wire                _zz_when_Axi4Crossbar_l878_30;
  reg        [1:0]    _zz_when_Axi4Crossbar_l878_31;
  reg        [1:0]    _zz_when_Axi4Crossbar_l878_32;
  reg        [1:0]    _zz_when_Axi4Crossbar_l878_33;
  reg        [1:0]    _zz_when_Axi4Crossbar_l340_5;
  wire       [1:0]    _zz_when_Axi4Crossbar_l340_6;
  wire       [1:0]    _zz_when_Axi4Crossbar_l340_7;
  wire       [1:0]    _zz_when_Axi4Crossbar_l340_8;
  wire       [1:0]    _zz_when_Axi4Crossbar_l340_9;
  reg        [0:0]    _zz_io_slaves_1_aw_payload_id;
  wire                when_Axi4Crossbar_l340_2;
  wire                when_Axi4Crossbar_l340_3;
  reg                 grantLock_1;
  reg        [0:0]    grantLockIdx_1;
  wire       [0:0]    _zz_io_slaves_1_aw_payload_id_1;
  wire                when_Axi4Crossbar_l269_1;
  wire                _zz_when_Axi4Crossbar_l878_34;
  wire                _zz_when_Axi4Crossbar_l895_5;
  wire       [0:0]    _zz_when_Axi4Crossbar_l942_4;
  reg                 _zz_when_Axi4Crossbar_l895_6;
  wire                when_Axi4Crossbar_l878_1;
  wire                when_Axi4Crossbar_l881_2;
  wire                when_Axi4Crossbar_l895_2;
  wire                when_Axi4Crossbar_l881_3;
  wire                when_Axi4Crossbar_l895_3;
  wire                io_slaves_1_aw_fire;
  wire                io_slaves_1_w_fire;
  wire                _zz_when_Axi4Crossbar_l914_1;
  wire                _zz_when_Axi4Crossbar_l926_1;
  wire                when_Axi4Crossbar_l914_1;
  wire                when_Axi4Crossbar_l926_1;
  wire                when_Axi4Crossbar_l940_1;
  wire                when_Axi4Crossbar_l942_2;
  wire                when_Axi4Crossbar_l942_3;
  wire                when_Axi4Crossbar_l953_1;
  wire                when_Axi4Crossbar_l959_1;
  wire                when_Axi4Crossbar_l961_1;
  wire                io_slaves_1_b_fire;
  wire                when_Axi4Crossbar_l968_1;
  wire                when_Axi4Crossbar_l970_1;
  wire                _zz_when_Axi4Crossbar_l878_35;
  reg        [1:0]    _zz_when_Axi4Crossbar_l878_36;
  reg        [1:0]    _zz_when_Axi4Crossbar_l878_37;
  reg        [1:0]    _zz_when_Axi4Crossbar_l878_38;
  reg        [1:0]    _zz_when_Axi4Crossbar_l340_10;
  wire       [1:0]    _zz_when_Axi4Crossbar_l340_11;
  wire       [1:0]    _zz_when_Axi4Crossbar_l340_12;
  wire       [1:0]    _zz_when_Axi4Crossbar_l340_13;
  wire       [1:0]    _zz_when_Axi4Crossbar_l340_14;
  reg        [0:0]    _zz_wrRrPtr_2;
  wire                when_Axi4Crossbar_l340_4;
  wire                when_Axi4Crossbar_l340_5;
  reg                 grantLock_2;
  reg        [0:0]    grantLockIdx_2;
  wire       [0:0]    _zz_wrRrPtr_2_1;
  wire                when_Axi4Crossbar_l269_2;
  wire                _zz_when_Axi4Crossbar_l878_39;
  wire                _zz_when_Axi4Crossbar_l895_7;
  wire       [0:0]    _zz_when_Axi4Crossbar_l942_5;
  reg                 _zz_when_Axi4Crossbar_l895_8;
  wire                when_Axi4Crossbar_l878_2;
  wire                when_Axi4Crossbar_l881_4;
  wire                when_Axi4Crossbar_l895_4;
  wire                when_Axi4Crossbar_l881_5;
  wire                when_Axi4Crossbar_l895_5;
  wire                decErr_io_axi_aw_fire;
  wire                decErr_io_axi_w_fire;
  wire                _zz_when_Axi4Crossbar_l914_2;
  wire                _zz_when_Axi4Crossbar_l926_2;
  wire                when_Axi4Crossbar_l914_2;
  wire                when_Axi4Crossbar_l926_2;
  wire                when_Axi4Crossbar_l940_2;
  wire                when_Axi4Crossbar_l942_4;
  wire                when_Axi4Crossbar_l942_5;
  wire                when_Axi4Crossbar_l953_2;
  wire                when_Axi4Crossbar_l959_2;
  wire                when_Axi4Crossbar_l961_2;
  wire                decErr_io_axi_b_fire;
  wire                when_Axi4Crossbar_l968_2;
  wire                when_Axi4Crossbar_l970_2;
  wire                _zz_when_Axi4Crossbar_l808_16;
  wire       [3:0]    _zz_when_Axi4Crossbar_l808_17;
  reg        [1:0]    _zz_when_Axi4Crossbar_l728;
  wire       [2:0]    _zz_when_Axi4Crossbar_l728_1;
  reg        [1:0]    _zz_when_Axi4Crossbar_l878_40;
  wire                when_Axi4Crossbar_l728;
  wire                when_Axi4Crossbar_l728_1;
  wire                when_Axi4Crossbar_l728_2;
  wire                _zz_when_Axi4Crossbar_l808_18;
  wire       [3:0]    _zz_when_Axi4Crossbar_l808_19;
  wire                _zz_when_Axi4Crossbar_l808_20;
  wire                _zz_when_Axi4Crossbar_l808_21;
  wire                _zz_when_Axi4Crossbar_l808_22;
  reg        [1:0]    _zz_when_Axi4Crossbar_l808_23;
  wire       [1:0]    _zz_when_Axi4Crossbar_l808_24;
  wire       [1:0]    _zz_when_Axi4Crossbar_l808_25;
  wire                _zz_when_Axi4Crossbar_l808_26;
  wire                _zz_when_Axi4Crossbar_l808_27;
  wire                _zz_when_Axi4Crossbar_l808_28;
  wire                when_Axi4Crossbar_l808;
  wire                when_Axi4Crossbar_l815;
  wire                when_Axi4Crossbar_l813;
  wire                _zz_when_Axi4Crossbar_l808_29;
  wire                _zz_when_Axi4Crossbar_l808_30;
  wire                _zz_when_Axi4Crossbar_l808_31;
  wire                when_Axi4Crossbar_l808_1;
  wire                when_Axi4Crossbar_l815_1;
  wire                when_Axi4Crossbar_l813_1;
  wire                _zz_when_Axi4Crossbar_l808_32;
  wire       [3:0]    _zz_when_Axi4Crossbar_l808_33;
  reg        [1:0]    _zz_when_Axi4Crossbar_l728_2;
  wire       [2:0]    _zz_when_Axi4Crossbar_l728_3;
  reg        [1:0]    _zz_when_Axi4Crossbar_l1081_21;
  wire                when_Axi4Crossbar_l728_3;
  wire                when_Axi4Crossbar_l728_4;
  wire                when_Axi4Crossbar_l728_5;
  wire                _zz_when_Axi4Crossbar_l808_34;
  wire       [3:0]    _zz_when_Axi4Crossbar_l808_35;
  wire                _zz_when_Axi4Crossbar_l808_36;
  wire                _zz_when_Axi4Crossbar_l808_37;
  wire                _zz_when_Axi4Crossbar_l808_38;
  reg        [1:0]    _zz_when_Axi4Crossbar_l808_39;
  wire       [1:0]    _zz_when_Axi4Crossbar_l808_40;
  wire       [1:0]    _zz_when_Axi4Crossbar_l808_41;
  wire                _zz_when_Axi4Crossbar_l808_42;
  wire                _zz_when_Axi4Crossbar_l808_43;
  wire                _zz_when_Axi4Crossbar_l808_44;
  wire                when_Axi4Crossbar_l808_2;
  wire                when_Axi4Crossbar_l815_2;
  wire                when_Axi4Crossbar_l813_2;
  wire                _zz_when_Axi4Crossbar_l808_45;
  wire                _zz_when_Axi4Crossbar_l808_46;
  wire                _zz_when_Axi4Crossbar_l808_47;
  wire                when_Axi4Crossbar_l808_3;
  wire                when_Axi4Crossbar_l815_3;
  wire                when_Axi4Crossbar_l813_3;
  wire                when_Axi4Crossbar_l1026;
  wire                _zz_when_Axi4Crossbar_l1021_2;
  wire                when_Axi4Crossbar_l1021;
  wire                when_Axi4Crossbar_l1023;
  reg        [1:0]    _zz_when_Axi4Crossbar_l728_4;
  wire       [2:0]    _zz_when_Axi4Crossbar_l728_5;
  reg        [1:0]    _zz_when_Axi4Crossbar_l878_41;
  wire                when_Axi4Crossbar_l728_6;
  wire                when_Axi4Crossbar_l728_7;
  wire                when_Axi4Crossbar_l728_8;
  wire                _zz_when_Axi4Crossbar_l808_48;
  wire       [3:0]    _zz_when_Axi4Crossbar_l808_49;
  reg        [1:0]    _zz_when_Axi4Crossbar_l728_6;
  wire       [2:0]    _zz_when_Axi4Crossbar_l728_7;
  reg        [1:0]    _zz_when_Axi4Crossbar_l878_42;
  wire                when_Axi4Crossbar_l728_9;
  wire                when_Axi4Crossbar_l728_10;
  wire                when_Axi4Crossbar_l728_11;
  wire                _zz_when_Axi4Crossbar_l808_50;
  wire       [3:0]    _zz_when_Axi4Crossbar_l808_51;
  wire                _zz_when_Axi4Crossbar_l808_52;
  wire                _zz_when_Axi4Crossbar_l808_53;
  wire                _zz_when_Axi4Crossbar_l808_54;
  reg        [1:0]    _zz_when_Axi4Crossbar_l808_55;
  wire       [1:0]    _zz_when_Axi4Crossbar_l808_56;
  wire       [1:0]    _zz_when_Axi4Crossbar_l808_57;
  wire                _zz_when_Axi4Crossbar_l808_58;
  wire                _zz_when_Axi4Crossbar_l808_59;
  wire                _zz_when_Axi4Crossbar_l808_60;
  wire                when_Axi4Crossbar_l808_4;
  wire                when_Axi4Crossbar_l815_4;
  wire                when_Axi4Crossbar_l813_4;
  wire                _zz_when_Axi4Crossbar_l808_61;
  wire                _zz_when_Axi4Crossbar_l808_62;
  wire                _zz_when_Axi4Crossbar_l808_63;
  wire                when_Axi4Crossbar_l808_5;
  wire                when_Axi4Crossbar_l815_5;
  wire                when_Axi4Crossbar_l813_5;
  wire                _zz_when_Axi4Crossbar_l808_64;
  wire       [3:0]    _zz_when_Axi4Crossbar_l808_65;
  reg        [1:0]    _zz_when_Axi4Crossbar_l728_8;
  wire       [2:0]    _zz_when_Axi4Crossbar_l728_9;
  reg        [1:0]    _zz_when_Axi4Crossbar_l1081_22;
  wire                when_Axi4Crossbar_l728_12;
  wire                when_Axi4Crossbar_l728_13;
  wire                when_Axi4Crossbar_l728_14;
  wire                _zz_when_Axi4Crossbar_l808_66;
  wire       [3:0]    _zz_when_Axi4Crossbar_l808_67;
  wire                _zz_when_Axi4Crossbar_l808_68;
  wire                _zz_when_Axi4Crossbar_l808_69;
  wire                _zz_when_Axi4Crossbar_l808_70;
  reg        [1:0]    _zz_when_Axi4Crossbar_l808_71;
  wire       [1:0]    _zz_when_Axi4Crossbar_l808_72;
  wire       [1:0]    _zz_when_Axi4Crossbar_l808_73;
  wire                _zz_when_Axi4Crossbar_l808_74;
  wire                _zz_when_Axi4Crossbar_l808_75;
  wire                _zz_when_Axi4Crossbar_l808_76;
  wire                when_Axi4Crossbar_l808_6;
  wire                when_Axi4Crossbar_l815_6;
  wire                when_Axi4Crossbar_l813_6;
  wire                _zz_when_Axi4Crossbar_l808_77;
  wire                _zz_when_Axi4Crossbar_l808_78;
  wire                _zz_when_Axi4Crossbar_l808_79;
  wire                when_Axi4Crossbar_l808_7;
  wire                when_Axi4Crossbar_l815_7;
  wire                when_Axi4Crossbar_l813_7;
  wire                when_Axi4Crossbar_l1026_1;
  wire                _zz_when_Axi4Crossbar_l1021_3;
  wire                when_Axi4Crossbar_l1021_1;
  wire                when_Axi4Crossbar_l1023_1;
  reg        [1:0]    _zz_when_Axi4Crossbar_l728_10;
  wire       [2:0]    _zz_when_Axi4Crossbar_l728_11;
  reg        [1:0]    _zz_when_Axi4Crossbar_l878_43;
  wire                when_Axi4Crossbar_l728_15;
  wire                when_Axi4Crossbar_l728_16;
  wire                when_Axi4Crossbar_l728_17;
  reg        [2:0]    _zz_respLockOH;
  wire       [2:0]    _zz_respLockOH_1;
  reg                 respLock;
  reg        [2:0]    respLockOH;
  wire       [2:0]    _zz_respLockOH_2;
  wire                when_Axi4Crossbar_l311;
  wire                when_Axi4Crossbar_l1045;
  wire                when_Axi4Crossbar_l1045_1;
  wire                when_Axi4Crossbar_l1045_2;
  reg        [2:0]    _zz_respLockOH_3;
  wire       [2:0]    _zz_respLockOH_4;
  reg                 respLock_1;
  reg        [2:0]    respLockOH_1;
  wire       [2:0]    _zz_respLockOH_5;
  wire                when_Axi4Crossbar_l311_1;
  wire                when_Axi4Crossbar_l1045_3;
  wire                when_Axi4Crossbar_l1045_4;
  wire                when_Axi4Crossbar_l1045_5;
  reg        [1:0]    _zz_when_Axi4Crossbar_l1081_23;
  reg        [1:0]    _zz_when_Axi4Crossbar_l1081_24;
  reg        [1:0]    _zz_when_Axi4Crossbar_l1081_25;
  reg        [1:0]    _zz_when_Axi4Crossbar_l340_15;
  wire       [1:0]    _zz_when_Axi4Crossbar_l340_16;
  wire       [1:0]    _zz_when_Axi4Crossbar_l340_17;
  wire       [1:0]    _zz_when_Axi4Crossbar_l340_18;
  wire       [1:0]    _zz_when_Axi4Crossbar_l340_19;
  reg        [0:0]    _zz_io_slaves_0_ar_payload_id;
  wire                when_Axi4Crossbar_l340_6;
  wire                when_Axi4Crossbar_l340_7;
  reg                 grantLock_3;
  reg        [0:0]    grantLockIdx_3;
  wire       [0:0]    _zz_io_slaves_0_ar_payload_id_1;
  wire                when_Axi4Crossbar_l269_3;
  wire                when_Axi4Crossbar_l1081;
  wire                when_Axi4Crossbar_l1084;
  wire                when_Axi4Crossbar_l1084_1;
  wire                io_slaves_0_ar_fire;
  wire                _zz_when_Axi4Crossbar_l1102;
  wire                io_slaves_0_r_fire;
  wire                when_Axi4Crossbar_l1102;
  wire                when_Axi4Crossbar_l1104;
  reg        [1:0]    _zz_when_Axi4Crossbar_l1081_26;
  reg        [1:0]    _zz_when_Axi4Crossbar_l1081_27;
  reg        [1:0]    _zz_when_Axi4Crossbar_l1081_28;
  reg        [1:0]    _zz_when_Axi4Crossbar_l340_20;
  wire       [1:0]    _zz_when_Axi4Crossbar_l340_21;
  wire       [1:0]    _zz_when_Axi4Crossbar_l340_22;
  wire       [1:0]    _zz_when_Axi4Crossbar_l340_23;
  wire       [1:0]    _zz_when_Axi4Crossbar_l340_24;
  reg        [0:0]    _zz_io_slaves_1_ar_payload_id;
  wire                when_Axi4Crossbar_l340_8;
  wire                when_Axi4Crossbar_l340_9;
  reg                 grantLock_4;
  reg        [0:0]    grantLockIdx_4;
  wire       [0:0]    _zz_io_slaves_1_ar_payload_id_1;
  wire                when_Axi4Crossbar_l269_4;
  wire                when_Axi4Crossbar_l1081_1;
  wire                when_Axi4Crossbar_l1084_2;
  wire                when_Axi4Crossbar_l1084_3;
  wire                io_slaves_1_ar_fire;
  wire                _zz_when_Axi4Crossbar_l1102_1;
  wire                io_slaves_1_r_fire;
  wire                when_Axi4Crossbar_l1102_1;
  wire                when_Axi4Crossbar_l1104_1;
  reg        [1:0]    _zz_when_Axi4Crossbar_l1081_29;
  reg        [1:0]    _zz_when_Axi4Crossbar_l1081_30;
  reg        [1:0]    _zz_when_Axi4Crossbar_l1081_31;
  reg        [1:0]    _zz_when_Axi4Crossbar_l340_25;
  wire       [1:0]    _zz_when_Axi4Crossbar_l340_26;
  wire       [1:0]    _zz_when_Axi4Crossbar_l340_27;
  wire       [1:0]    _zz_when_Axi4Crossbar_l340_28;
  wire       [1:0]    _zz_when_Axi4Crossbar_l340_29;
  reg        [0:0]    _zz_rdRrPtr_2;
  wire                when_Axi4Crossbar_l340_10;
  wire                when_Axi4Crossbar_l340_11;
  reg                 grantLock_5;
  reg        [0:0]    grantLockIdx_5;
  wire       [0:0]    _zz_rdRrPtr_2_1;
  wire                when_Axi4Crossbar_l269_5;
  wire                when_Axi4Crossbar_l1081_2;
  wire                when_Axi4Crossbar_l1084_4;
  wire                when_Axi4Crossbar_l1084_5;
  wire                decErr_io_axi_ar_fire;
  wire                _zz_when_Axi4Crossbar_l1102_2;
  wire                decErr_io_axi_r_fire;
  wire                when_Axi4Crossbar_l1102_2;
  wire                when_Axi4Crossbar_l1104_2;
  reg        [2:0]    _zz_respLockOH_6;
  wire       [2:0]    _zz_respLockOH_7;
  reg                 respLock_2;
  reg        [2:0]    respLockOH_2;
  wire       [2:0]    _zz_respLockOH_8;
  wire                when_Axi4Crossbar_l311_2;
  wire                when_Axi4Crossbar_l1128;
  wire                when_Axi4Crossbar_l1128_1;
  wire                when_Axi4Crossbar_l1128_2;
  reg        [2:0]    _zz_respLockOH_9;
  wire       [2:0]    _zz_respLockOH_10;
  reg                 respLock_3;
  reg        [2:0]    respLockOH_3;
  wire       [2:0]    _zz_respLockOH_11;
  wire                when_Axi4Crossbar_l311_3;
  wire                when_Axi4Crossbar_l1128_3;
  wire                when_Axi4Crossbar_l1128_4;
  wire                when_Axi4Crossbar_l1128_5;
  (* ram_style = "distributed" *) reg [0:0] _zz_4 [0:3];
  (* ram_style = "distributed" *) reg [0:0] _zz_5 [0:3];
  (* ram_style = "distributed" *) reg [0:0] _zz_6 [0:3];

  assign _zz__zz_when_Axi4Crossbar_l878_26 = {(! (|_zz_when_Axi4Crossbar_l878_27)),_zz_when_Axi4Crossbar_l878_27};
  assign _zz__zz_when_Axi4Crossbar_l878_26_1 = {(! (|_zz_when_Axi4Crossbar_l878_28)),_zz_when_Axi4Crossbar_l878_28};
  assign _zz__zz_when_Axi4Crossbar_l340_4 = (_zz_when_Axi4Crossbar_l340_2 - 2'b01);
  assign _zz__zz_when_Axi4Crossbar_l340_4_1 = (_zz_when_Axi4Crossbar_l340_3 - 2'b01);
  assign _zz__zz_7 = (_zz_7 + 2'b01);
  assign _zz__zz_when_Axi4Crossbar_l942 = (_zz_when_Axi4Crossbar_l942 + 2'b01);
  assign _zz__zz_when_Axi4Crossbar_l878_31 = {(! (|_zz_when_Axi4Crossbar_l878_32)),_zz_when_Axi4Crossbar_l878_32};
  assign _zz__zz_when_Axi4Crossbar_l878_31_1 = {(! (|_zz_when_Axi4Crossbar_l878_33)),_zz_when_Axi4Crossbar_l878_33};
  assign _zz__zz_when_Axi4Crossbar_l340_9 = (_zz_when_Axi4Crossbar_l340_7 - 2'b01);
  assign _zz__zz_when_Axi4Crossbar_l340_9_1 = (_zz_when_Axi4Crossbar_l340_8 - 2'b01);
  assign _zz__zz_8 = (_zz_8 + 2'b01);
  assign _zz__zz_when_Axi4Crossbar_l942_1 = (_zz_when_Axi4Crossbar_l942_1 + 2'b01);
  assign _zz__zz_when_Axi4Crossbar_l878_36 = {(! (|_zz_when_Axi4Crossbar_l878_37)),_zz_when_Axi4Crossbar_l878_37};
  assign _zz__zz_when_Axi4Crossbar_l878_36_1 = {(! (|_zz_when_Axi4Crossbar_l878_38)),_zz_when_Axi4Crossbar_l878_38};
  assign _zz__zz_when_Axi4Crossbar_l340_14 = (_zz_when_Axi4Crossbar_l340_12 - 2'b01);
  assign _zz__zz_when_Axi4Crossbar_l340_14_1 = (_zz_when_Axi4Crossbar_l340_13 - 2'b01);
  assign _zz__zz_9 = (_zz_9 + 2'b01);
  assign _zz__zz_when_Axi4Crossbar_l942_2 = (_zz_when_Axi4Crossbar_l942_2 + 2'b01);
  assign _zz__zz_when_Axi4Crossbar_l808_25 = (_zz_when_Axi4Crossbar_l808_24 - 2'b01);
  assign _zz__zz_when_Axi4Crossbar_l808_41 = (_zz_when_Axi4Crossbar_l808_40 - 2'b01);
  assign _zz__zz_when_Axi4Crossbar_l808_57 = (_zz_when_Axi4Crossbar_l808_56 - 2'b01);
  assign _zz__zz_when_Axi4Crossbar_l808_73 = (_zz_when_Axi4Crossbar_l808_72 - 2'b01);
  assign _zz__zz_respLockOH = (io_slaves_0_b_payload_id >>> 3'd4);
  assign _zz__zz_respLockOH_1 = (io_slaves_1_b_payload_id >>> 3'd4);
  assign _zz__zz_respLockOH_2 = (decErr_io_axi_b_payload_id >>> 3'd4);
  assign _zz__zz_respLockOH_2_1 = (_zz_respLockOH_1 - 3'b001);
  assign _zz__zz_respLockOH_3 = (io_slaves_0_b_payload_id >>> 3'd4);
  assign _zz__zz_respLockOH_3_1 = (io_slaves_1_b_payload_id >>> 3'd4);
  assign _zz__zz_respLockOH_3_2 = (decErr_io_axi_b_payload_id >>> 3'd4);
  assign _zz__zz_respLockOH_5 = (_zz_respLockOH_4 - 3'b001);
  assign _zz__zz_when_Axi4Crossbar_l1081_23 = {(! (|_zz_when_Axi4Crossbar_l1081_24)),_zz_when_Axi4Crossbar_l1081_24};
  assign _zz__zz_when_Axi4Crossbar_l1081_23_1 = {(! (|_zz_when_Axi4Crossbar_l1081_25)),_zz_when_Axi4Crossbar_l1081_25};
  assign _zz__zz_when_Axi4Crossbar_l340_19 = (_zz_when_Axi4Crossbar_l340_17 - 2'b01);
  assign _zz__zz_when_Axi4Crossbar_l340_19_1 = (_zz_when_Axi4Crossbar_l340_18 - 2'b01);
  assign _zz__zz_when_Axi4Crossbar_l1081_26 = {(! (|_zz_when_Axi4Crossbar_l1081_27)),_zz_when_Axi4Crossbar_l1081_27};
  assign _zz__zz_when_Axi4Crossbar_l1081_26_1 = {(! (|_zz_when_Axi4Crossbar_l1081_28)),_zz_when_Axi4Crossbar_l1081_28};
  assign _zz__zz_when_Axi4Crossbar_l340_24 = (_zz_when_Axi4Crossbar_l340_22 - 2'b01);
  assign _zz__zz_when_Axi4Crossbar_l340_24_1 = (_zz_when_Axi4Crossbar_l340_23 - 2'b01);
  assign _zz__zz_when_Axi4Crossbar_l1081_29 = {(! (|_zz_when_Axi4Crossbar_l1081_30)),_zz_when_Axi4Crossbar_l1081_30};
  assign _zz__zz_when_Axi4Crossbar_l1081_29_1 = {(! (|_zz_when_Axi4Crossbar_l1081_31)),_zz_when_Axi4Crossbar_l1081_31};
  assign _zz__zz_when_Axi4Crossbar_l340_29 = (_zz_when_Axi4Crossbar_l340_27 - 2'b01);
  assign _zz__zz_when_Axi4Crossbar_l340_29_1 = (_zz_when_Axi4Crossbar_l340_28 - 2'b01);
  assign _zz__zz_respLockOH_6 = (io_slaves_0_r_payload_id >>> 3'd4);
  assign _zz__zz_respLockOH_6_1 = (io_slaves_1_r_payload_id >>> 3'd4);
  assign _zz__zz_respLockOH_6_2 = (decErr_io_axi_r_payload_id >>> 3'd4);
  assign _zz__zz_respLockOH_8 = (_zz_respLockOH_7 - 3'b001);
  assign _zz__zz_respLockOH_9 = (io_slaves_0_r_payload_id >>> 3'd4);
  assign _zz__zz_respLockOH_9_1 = (io_slaves_1_r_payload_id >>> 3'd4);
  assign _zz__zz_respLockOH_9_2 = (decErr_io_axi_r_payload_id >>> 3'd4);
  assign _zz__zz_respLockOH_11 = (_zz_respLockOH_10 - 3'b001);
  assign _zz__zz_4_port = _zz_io_slaves_0_aw_payload_id_1;
  assign _zz__zz_5_port = _zz_io_slaves_1_aw_payload_id_1;
  assign _zz__zz_6_port = _zz_wrRrPtr_2_1;
  assign _zz_4_spinal_port0 = _zz_4[_zz_when_Axi4Crossbar_l942];
  always @(posedge clk) begin
    if(_zz_3) begin
      _zz_4[_zz_7] <= _zz__zz_4_port;
    end
  end

  assign _zz_5_spinal_port0 = _zz_5[_zz_when_Axi4Crossbar_l942_1];
  always @(posedge clk) begin
    if(_zz_2) begin
      _zz_5[_zz_8] <= _zz__zz_5_port;
    end
  end

  assign _zz_6_spinal_port0 = _zz_6[_zz_when_Axi4Crossbar_l942_2];
  always @(posedge clk) begin
    if(_zz_1) begin
      _zz_6[_zz_9] <= _zz__zz_6_port;
    end
  end

  Axi4DecErrSlave decErr (
    .io_axi_aw_valid          (decErr_io_axi_aw_valid              ), //i
    .io_axi_aw_ready          (decErr_io_axi_aw_ready              ), //o
    .io_axi_aw_payload_addr   (decErr_io_axi_aw_payload_addr[31:0] ), //i
    .io_axi_aw_payload_id     (decErr_io_axi_aw_payload_id[4:0]    ), //i
    .io_axi_aw_payload_region (decErr_io_axi_aw_payload_region[3:0]), //i
    .io_axi_aw_payload_len    (decErr_io_axi_aw_payload_len[7:0]   ), //i
    .io_axi_aw_payload_size   (decErr_io_axi_aw_payload_size[2:0]  ), //i
    .io_axi_aw_payload_burst  (decErr_io_axi_aw_payload_burst[1:0] ), //i
    .io_axi_aw_payload_lock   (decErr_io_axi_aw_payload_lock       ), //i
    .io_axi_aw_payload_cache  (decErr_io_axi_aw_payload_cache[3:0] ), //i
    .io_axi_aw_payload_qos    (decErr_io_axi_aw_payload_qos[3:0]   ), //i
    .io_axi_aw_payload_prot   (decErr_io_axi_aw_payload_prot[2:0]  ), //i
    .io_axi_w_valid           (decErr_io_axi_w_valid               ), //i
    .io_axi_w_ready           (decErr_io_axi_w_ready               ), //o
    .io_axi_w_payload_data    (decErr_io_axi_w_payload_data[31:0]  ), //i
    .io_axi_w_payload_strb    (decErr_io_axi_w_payload_strb[3:0]   ), //i
    .io_axi_w_payload_last    (decErr_io_axi_w_payload_last        ), //i
    .io_axi_b_valid           (decErr_io_axi_b_valid               ), //o
    .io_axi_b_ready           (decErr_io_axi_b_ready               ), //i
    .io_axi_b_payload_id      (decErr_io_axi_b_payload_id[4:0]     ), //o
    .io_axi_b_payload_resp    (decErr_io_axi_b_payload_resp[1:0]   ), //o
    .io_axi_ar_valid          (decErr_io_axi_ar_valid              ), //i
    .io_axi_ar_ready          (decErr_io_axi_ar_ready              ), //o
    .io_axi_ar_payload_addr   (decErr_io_axi_ar_payload_addr[31:0] ), //i
    .io_axi_ar_payload_id     (decErr_io_axi_ar_payload_id[4:0]    ), //i
    .io_axi_ar_payload_region (decErr_io_axi_ar_payload_region[3:0]), //i
    .io_axi_ar_payload_len    (decErr_io_axi_ar_payload_len[7:0]   ), //i
    .io_axi_ar_payload_size   (decErr_io_axi_ar_payload_size[2:0]  ), //i
    .io_axi_ar_payload_burst  (decErr_io_axi_ar_payload_burst[1:0] ), //i
    .io_axi_ar_payload_lock   (decErr_io_axi_ar_payload_lock       ), //i
    .io_axi_ar_payload_cache  (decErr_io_axi_ar_payload_cache[3:0] ), //i
    .io_axi_ar_payload_qos    (decErr_io_axi_ar_payload_qos[3:0]   ), //i
    .io_axi_ar_payload_prot   (decErr_io_axi_ar_payload_prot[2:0]  ), //i
    .io_axi_r_valid           (decErr_io_axi_r_valid               ), //o
    .io_axi_r_ready           (decErr_io_axi_r_ready               ), //i
    .io_axi_r_payload_data    (decErr_io_axi_r_payload_data[31:0]  ), //o
    .io_axi_r_payload_id      (decErr_io_axi_r_payload_id[4:0]     ), //o
    .io_axi_r_payload_resp    (decErr_io_axi_r_payload_resp[1:0]   ), //o
    .io_axi_r_payload_last    (decErr_io_axi_r_payload_last        ), //o
    .clk                      (clk                                 ), //i
    .resetn                   (resetn                              )  //i
  );
  always @(*) begin
    _zz_1 = 1'b0;
    if(when_Axi4Crossbar_l926_2) begin
      _zz_1 = 1'b1;
    end
  end

  always @(*) begin
    _zz_2 = 1'b0;
    if(when_Axi4Crossbar_l926_1) begin
      _zz_2 = 1'b1;
    end
  end

  always @(*) begin
    _zz_3 = 1'b0;
    if(when_Axi4Crossbar_l926) begin
      _zz_3 = 1'b1;
    end
  end

  always @(*) begin
    io_masters_0_aw_ready = 1'b0;
    if(when_Axi4Crossbar_l878) begin
      if(when_Axi4Crossbar_l881) begin
        io_masters_0_aw_ready = io_slaves_0_aw_ready;
      end
    end
    if(when_Axi4Crossbar_l878_1) begin
      if(when_Axi4Crossbar_l881_2) begin
        io_masters_0_aw_ready = io_slaves_1_aw_ready;
      end
    end
    if(when_Axi4Crossbar_l878_2) begin
      if(when_Axi4Crossbar_l881_4) begin
        io_masters_0_aw_ready = decErr_io_axi_aw_ready;
      end
    end
  end

  always @(*) begin
    io_masters_0_w_ready = 1'b0;
    if(when_Axi4Crossbar_l878) begin
      if(when_Axi4Crossbar_l881) begin
        if(when_Axi4Crossbar_l895) begin
          io_masters_0_w_ready = io_slaves_0_w_ready;
        end
      end
    end
    if(when_Axi4Crossbar_l940) begin
      if(when_Axi4Crossbar_l942) begin
        io_masters_0_w_ready = io_slaves_0_w_ready;
      end
    end
    if(when_Axi4Crossbar_l878_1) begin
      if(when_Axi4Crossbar_l881_2) begin
        if(when_Axi4Crossbar_l895_2) begin
          io_masters_0_w_ready = io_slaves_1_w_ready;
        end
      end
    end
    if(when_Axi4Crossbar_l940_1) begin
      if(when_Axi4Crossbar_l942_2) begin
        io_masters_0_w_ready = io_slaves_1_w_ready;
      end
    end
    if(when_Axi4Crossbar_l878_2) begin
      if(when_Axi4Crossbar_l881_4) begin
        if(when_Axi4Crossbar_l895_4) begin
          io_masters_0_w_ready = decErr_io_axi_w_ready;
        end
      end
    end
    if(when_Axi4Crossbar_l940_2) begin
      if(when_Axi4Crossbar_l942_4) begin
        io_masters_0_w_ready = decErr_io_axi_w_ready;
      end
    end
  end

  always @(*) begin
    io_masters_0_b_valid = 1'b0;
    if(when_Axi4Crossbar_l1045) begin
      io_masters_0_b_valid = io_slaves_0_b_valid;
    end
    if(when_Axi4Crossbar_l1045_1) begin
      io_masters_0_b_valid = io_slaves_1_b_valid;
    end
    if(when_Axi4Crossbar_l1045_2) begin
      io_masters_0_b_valid = decErr_io_axi_b_valid;
    end
  end

  assign _zz_io_masters_0_b_payload_id = 6'h0;
  always @(*) begin
    io_masters_0_b_payload_id = _zz_io_masters_0_b_payload_id[3 : 0];
    if(when_Axi4Crossbar_l1045) begin
      io_masters_0_b_payload_id = io_slaves_0_b_payload_id[3 : 0];
    end
    if(when_Axi4Crossbar_l1045_1) begin
      io_masters_0_b_payload_id = io_slaves_1_b_payload_id[3 : 0];
    end
    if(when_Axi4Crossbar_l1045_2) begin
      io_masters_0_b_payload_id = decErr_io_axi_b_payload_id[3 : 0];
    end
  end

  always @(*) begin
    io_masters_0_b_payload_resp = _zz_io_masters_0_b_payload_id[5 : 4];
    if(when_Axi4Crossbar_l1045) begin
      io_masters_0_b_payload_resp = io_slaves_0_b_payload_resp;
    end
    if(when_Axi4Crossbar_l1045_1) begin
      io_masters_0_b_payload_resp = io_slaves_1_b_payload_resp;
    end
    if(when_Axi4Crossbar_l1045_2) begin
      io_masters_0_b_payload_resp = decErr_io_axi_b_payload_resp;
    end
  end

  always @(*) begin
    io_masters_0_ar_ready = 1'b0;
    if(when_Axi4Crossbar_l1081) begin
      if(when_Axi4Crossbar_l1084) begin
        io_masters_0_ar_ready = io_slaves_0_ar_ready;
      end
    end
    if(when_Axi4Crossbar_l1081_1) begin
      if(when_Axi4Crossbar_l1084_2) begin
        io_masters_0_ar_ready = io_slaves_1_ar_ready;
      end
    end
    if(when_Axi4Crossbar_l1081_2) begin
      if(when_Axi4Crossbar_l1084_4) begin
        io_masters_0_ar_ready = decErr_io_axi_ar_ready;
      end
    end
  end

  always @(*) begin
    io_masters_0_r_valid = 1'b0;
    if(when_Axi4Crossbar_l1128) begin
      io_masters_0_r_valid = io_slaves_0_r_valid;
    end
    if(when_Axi4Crossbar_l1128_1) begin
      io_masters_0_r_valid = io_slaves_1_r_valid;
    end
    if(when_Axi4Crossbar_l1128_2) begin
      io_masters_0_r_valid = decErr_io_axi_r_valid;
    end
  end

  assign _zz_io_masters_0_r_payload_data = 39'h0;
  always @(*) begin
    io_masters_0_r_payload_data = _zz_io_masters_0_r_payload_data[31 : 0];
    if(when_Axi4Crossbar_l1128) begin
      io_masters_0_r_payload_data = io_slaves_0_r_payload_data;
    end
    if(when_Axi4Crossbar_l1128_1) begin
      io_masters_0_r_payload_data = io_slaves_1_r_payload_data;
    end
    if(when_Axi4Crossbar_l1128_2) begin
      io_masters_0_r_payload_data = decErr_io_axi_r_payload_data;
    end
  end

  always @(*) begin
    io_masters_0_r_payload_id = _zz_io_masters_0_r_payload_data[35 : 32];
    if(when_Axi4Crossbar_l1128) begin
      io_masters_0_r_payload_id = io_slaves_0_r_payload_id[3 : 0];
    end
    if(when_Axi4Crossbar_l1128_1) begin
      io_masters_0_r_payload_id = io_slaves_1_r_payload_id[3 : 0];
    end
    if(when_Axi4Crossbar_l1128_2) begin
      io_masters_0_r_payload_id = decErr_io_axi_r_payload_id[3 : 0];
    end
  end

  always @(*) begin
    io_masters_0_r_payload_resp = _zz_io_masters_0_r_payload_data[37 : 36];
    if(when_Axi4Crossbar_l1128) begin
      io_masters_0_r_payload_resp = io_slaves_0_r_payload_resp;
    end
    if(when_Axi4Crossbar_l1128_1) begin
      io_masters_0_r_payload_resp = io_slaves_1_r_payload_resp;
    end
    if(when_Axi4Crossbar_l1128_2) begin
      io_masters_0_r_payload_resp = decErr_io_axi_r_payload_resp;
    end
  end

  always @(*) begin
    io_masters_0_r_payload_last = _zz_io_masters_0_r_payload_data[38];
    if(when_Axi4Crossbar_l1128) begin
      io_masters_0_r_payload_last = io_slaves_0_r_payload_last;
    end
    if(when_Axi4Crossbar_l1128_1) begin
      io_masters_0_r_payload_last = io_slaves_1_r_payload_last;
    end
    if(when_Axi4Crossbar_l1128_2) begin
      io_masters_0_r_payload_last = decErr_io_axi_r_payload_last;
    end
  end

  always @(*) begin
    io_masters_1_aw_ready = 1'b0;
    if(when_Axi4Crossbar_l878) begin
      if(when_Axi4Crossbar_l881_1) begin
        io_masters_1_aw_ready = io_slaves_0_aw_ready;
      end
    end
    if(when_Axi4Crossbar_l878_1) begin
      if(when_Axi4Crossbar_l881_3) begin
        io_masters_1_aw_ready = io_slaves_1_aw_ready;
      end
    end
    if(when_Axi4Crossbar_l878_2) begin
      if(when_Axi4Crossbar_l881_5) begin
        io_masters_1_aw_ready = decErr_io_axi_aw_ready;
      end
    end
  end

  always @(*) begin
    io_masters_1_w_ready = 1'b0;
    if(when_Axi4Crossbar_l878) begin
      if(when_Axi4Crossbar_l881_1) begin
        if(when_Axi4Crossbar_l895_1) begin
          io_masters_1_w_ready = io_slaves_0_w_ready;
        end
      end
    end
    if(when_Axi4Crossbar_l940) begin
      if(when_Axi4Crossbar_l942_1) begin
        io_masters_1_w_ready = io_slaves_0_w_ready;
      end
    end
    if(when_Axi4Crossbar_l878_1) begin
      if(when_Axi4Crossbar_l881_3) begin
        if(when_Axi4Crossbar_l895_3) begin
          io_masters_1_w_ready = io_slaves_1_w_ready;
        end
      end
    end
    if(when_Axi4Crossbar_l940_1) begin
      if(when_Axi4Crossbar_l942_3) begin
        io_masters_1_w_ready = io_slaves_1_w_ready;
      end
    end
    if(when_Axi4Crossbar_l878_2) begin
      if(when_Axi4Crossbar_l881_5) begin
        if(when_Axi4Crossbar_l895_5) begin
          io_masters_1_w_ready = decErr_io_axi_w_ready;
        end
      end
    end
    if(when_Axi4Crossbar_l940_2) begin
      if(when_Axi4Crossbar_l942_5) begin
        io_masters_1_w_ready = decErr_io_axi_w_ready;
      end
    end
  end

  always @(*) begin
    io_masters_1_b_valid = 1'b0;
    if(when_Axi4Crossbar_l1045_3) begin
      io_masters_1_b_valid = io_slaves_0_b_valid;
    end
    if(when_Axi4Crossbar_l1045_4) begin
      io_masters_1_b_valid = io_slaves_1_b_valid;
    end
    if(when_Axi4Crossbar_l1045_5) begin
      io_masters_1_b_valid = decErr_io_axi_b_valid;
    end
  end

  assign _zz_io_masters_1_b_payload_id = 6'h0;
  always @(*) begin
    io_masters_1_b_payload_id = _zz_io_masters_1_b_payload_id[3 : 0];
    if(when_Axi4Crossbar_l1045_3) begin
      io_masters_1_b_payload_id = io_slaves_0_b_payload_id[3 : 0];
    end
    if(when_Axi4Crossbar_l1045_4) begin
      io_masters_1_b_payload_id = io_slaves_1_b_payload_id[3 : 0];
    end
    if(when_Axi4Crossbar_l1045_5) begin
      io_masters_1_b_payload_id = decErr_io_axi_b_payload_id[3 : 0];
    end
  end

  always @(*) begin
    io_masters_1_b_payload_resp = _zz_io_masters_1_b_payload_id[5 : 4];
    if(when_Axi4Crossbar_l1045_3) begin
      io_masters_1_b_payload_resp = io_slaves_0_b_payload_resp;
    end
    if(when_Axi4Crossbar_l1045_4) begin
      io_masters_1_b_payload_resp = io_slaves_1_b_payload_resp;
    end
    if(when_Axi4Crossbar_l1045_5) begin
      io_masters_1_b_payload_resp = decErr_io_axi_b_payload_resp;
    end
  end

  always @(*) begin
    io_masters_1_ar_ready = 1'b0;
    if(when_Axi4Crossbar_l1081) begin
      if(when_Axi4Crossbar_l1084_1) begin
        io_masters_1_ar_ready = io_slaves_0_ar_ready;
      end
    end
    if(when_Axi4Crossbar_l1081_1) begin
      if(when_Axi4Crossbar_l1084_3) begin
        io_masters_1_ar_ready = io_slaves_1_ar_ready;
      end
    end
    if(when_Axi4Crossbar_l1081_2) begin
      if(when_Axi4Crossbar_l1084_5) begin
        io_masters_1_ar_ready = decErr_io_axi_ar_ready;
      end
    end
  end

  always @(*) begin
    io_masters_1_r_valid = 1'b0;
    if(when_Axi4Crossbar_l1128_3) begin
      io_masters_1_r_valid = io_slaves_0_r_valid;
    end
    if(when_Axi4Crossbar_l1128_4) begin
      io_masters_1_r_valid = io_slaves_1_r_valid;
    end
    if(when_Axi4Crossbar_l1128_5) begin
      io_masters_1_r_valid = decErr_io_axi_r_valid;
    end
  end

  assign _zz_io_masters_1_r_payload_data = 39'h0;
  always @(*) begin
    io_masters_1_r_payload_data = _zz_io_masters_1_r_payload_data[31 : 0];
    if(when_Axi4Crossbar_l1128_3) begin
      io_masters_1_r_payload_data = io_slaves_0_r_payload_data;
    end
    if(when_Axi4Crossbar_l1128_4) begin
      io_masters_1_r_payload_data = io_slaves_1_r_payload_data;
    end
    if(when_Axi4Crossbar_l1128_5) begin
      io_masters_1_r_payload_data = decErr_io_axi_r_payload_data;
    end
  end

  always @(*) begin
    io_masters_1_r_payload_id = _zz_io_masters_1_r_payload_data[35 : 32];
    if(when_Axi4Crossbar_l1128_3) begin
      io_masters_1_r_payload_id = io_slaves_0_r_payload_id[3 : 0];
    end
    if(when_Axi4Crossbar_l1128_4) begin
      io_masters_1_r_payload_id = io_slaves_1_r_payload_id[3 : 0];
    end
    if(when_Axi4Crossbar_l1128_5) begin
      io_masters_1_r_payload_id = decErr_io_axi_r_payload_id[3 : 0];
    end
  end

  always @(*) begin
    io_masters_1_r_payload_resp = _zz_io_masters_1_r_payload_data[37 : 36];
    if(when_Axi4Crossbar_l1128_3) begin
      io_masters_1_r_payload_resp = io_slaves_0_r_payload_resp;
    end
    if(when_Axi4Crossbar_l1128_4) begin
      io_masters_1_r_payload_resp = io_slaves_1_r_payload_resp;
    end
    if(when_Axi4Crossbar_l1128_5) begin
      io_masters_1_r_payload_resp = decErr_io_axi_r_payload_resp;
    end
  end

  always @(*) begin
    io_masters_1_r_payload_last = _zz_io_masters_1_r_payload_data[38];
    if(when_Axi4Crossbar_l1128_3) begin
      io_masters_1_r_payload_last = io_slaves_0_r_payload_last;
    end
    if(when_Axi4Crossbar_l1128_4) begin
      io_masters_1_r_payload_last = io_slaves_1_r_payload_last;
    end
    if(when_Axi4Crossbar_l1128_5) begin
      io_masters_1_r_payload_last = decErr_io_axi_r_payload_last;
    end
  end

  always @(*) begin
    io_slaves_0_aw_valid = 1'b0;
    if(when_Axi4Crossbar_l878) begin
      io_slaves_0_aw_valid = 1'b1;
    end
  end

  assign _zz_io_slaves_0_aw_payload_addr = 66'h0;
  always @(*) begin
    io_slaves_0_aw_payload_addr = _zz_io_slaves_0_aw_payload_addr[31 : 0];
    if(when_Axi4Crossbar_l878) begin
      if(when_Axi4Crossbar_l881) begin
        io_slaves_0_aw_payload_addr = io_masters_0_aw_payload_addr;
      end
      if(when_Axi4Crossbar_l881_1) begin
        io_slaves_0_aw_payload_addr = io_masters_1_aw_payload_addr;
      end
    end
  end

  always @(*) begin
    io_slaves_0_aw_payload_id = _zz_io_slaves_0_aw_payload_addr[36 : 32];
    if(when_Axi4Crossbar_l878) begin
      if(when_Axi4Crossbar_l881) begin
        io_slaves_0_aw_payload_id = {_zz_io_slaves_0_aw_payload_id_1,io_masters_0_aw_payload_id};
      end
      if(when_Axi4Crossbar_l881_1) begin
        io_slaves_0_aw_payload_id = {_zz_io_slaves_0_aw_payload_id_1,io_masters_1_aw_payload_id};
      end
    end
  end

  assign io_slaves_0_aw_payload_region = _zz_io_slaves_0_aw_payload_addr[40 : 37];
  always @(*) begin
    io_slaves_0_aw_payload_len = _zz_io_slaves_0_aw_payload_addr[48 : 41];
    if(when_Axi4Crossbar_l878) begin
      if(when_Axi4Crossbar_l881) begin
        io_slaves_0_aw_payload_len = io_masters_0_aw_payload_len;
      end
      if(when_Axi4Crossbar_l881_1) begin
        io_slaves_0_aw_payload_len = io_masters_1_aw_payload_len;
      end
    end
  end

  always @(*) begin
    io_slaves_0_aw_payload_size = _zz_io_slaves_0_aw_payload_addr[51 : 49];
    if(when_Axi4Crossbar_l878) begin
      if(when_Axi4Crossbar_l881) begin
        io_slaves_0_aw_payload_size = io_masters_0_aw_payload_size;
      end
      if(when_Axi4Crossbar_l881_1) begin
        io_slaves_0_aw_payload_size = io_masters_1_aw_payload_size;
      end
    end
  end

  always @(*) begin
    io_slaves_0_aw_payload_burst = _zz_io_slaves_0_aw_payload_addr[53 : 52];
    if(when_Axi4Crossbar_l878) begin
      if(when_Axi4Crossbar_l881) begin
        io_slaves_0_aw_payload_burst = io_masters_0_aw_payload_burst;
      end
      if(when_Axi4Crossbar_l881_1) begin
        io_slaves_0_aw_payload_burst = io_masters_1_aw_payload_burst;
      end
    end
  end

  always @(*) begin
    io_slaves_0_aw_payload_lock = _zz_io_slaves_0_aw_payload_addr[54 : 54];
    if(when_Axi4Crossbar_l878) begin
      if(when_Axi4Crossbar_l881) begin
        io_slaves_0_aw_payload_lock = io_masters_0_aw_payload_lock;
      end
      if(when_Axi4Crossbar_l881_1) begin
        io_slaves_0_aw_payload_lock = io_masters_1_aw_payload_lock;
      end
    end
  end

  always @(*) begin
    io_slaves_0_aw_payload_cache = _zz_io_slaves_0_aw_payload_addr[58 : 55];
    if(when_Axi4Crossbar_l878) begin
      if(when_Axi4Crossbar_l881) begin
        io_slaves_0_aw_payload_cache = io_masters_0_aw_payload_cache;
      end
      if(when_Axi4Crossbar_l881_1) begin
        io_slaves_0_aw_payload_cache = io_masters_1_aw_payload_cache;
      end
    end
  end

  always @(*) begin
    io_slaves_0_aw_payload_qos = _zz_io_slaves_0_aw_payload_addr[62 : 59];
    if(when_Axi4Crossbar_l878) begin
      if(when_Axi4Crossbar_l881) begin
        io_slaves_0_aw_payload_qos = io_masters_0_aw_payload_qos;
      end
      if(when_Axi4Crossbar_l881_1) begin
        io_slaves_0_aw_payload_qos = io_masters_1_aw_payload_qos;
      end
    end
  end

  always @(*) begin
    io_slaves_0_aw_payload_prot = _zz_io_slaves_0_aw_payload_addr[65 : 63];
    if(when_Axi4Crossbar_l878) begin
      if(when_Axi4Crossbar_l881) begin
        io_slaves_0_aw_payload_prot = io_masters_0_aw_payload_prot;
      end
      if(when_Axi4Crossbar_l881_1) begin
        io_slaves_0_aw_payload_prot = io_masters_1_aw_payload_prot;
      end
    end
  end

  always @(*) begin
    io_slaves_0_w_valid = 1'b0;
    if(when_Axi4Crossbar_l878) begin
      if(when_Axi4Crossbar_l881) begin
        if(when_Axi4Crossbar_l895) begin
          io_slaves_0_w_valid = io_masters_0_w_valid;
        end
      end
      if(when_Axi4Crossbar_l881_1) begin
        if(when_Axi4Crossbar_l895_1) begin
          io_slaves_0_w_valid = io_masters_1_w_valid;
        end
      end
    end
    if(when_Axi4Crossbar_l940) begin
      if(when_Axi4Crossbar_l942) begin
        io_slaves_0_w_valid = io_masters_0_w_valid;
      end
      if(when_Axi4Crossbar_l942_1) begin
        io_slaves_0_w_valid = io_masters_1_w_valid;
      end
    end
  end

  assign _zz_io_slaves_0_w_payload_data = 37'h0;
  always @(*) begin
    io_slaves_0_w_payload_data = _zz_io_slaves_0_w_payload_data[31 : 0];
    if(when_Axi4Crossbar_l878) begin
      if(when_Axi4Crossbar_l881) begin
        if(when_Axi4Crossbar_l895) begin
          io_slaves_0_w_payload_data = io_masters_0_w_payload_data;
        end
      end
      if(when_Axi4Crossbar_l881_1) begin
        if(when_Axi4Crossbar_l895_1) begin
          io_slaves_0_w_payload_data = io_masters_1_w_payload_data;
        end
      end
    end
    if(when_Axi4Crossbar_l940) begin
      if(when_Axi4Crossbar_l942) begin
        io_slaves_0_w_payload_data = io_masters_0_w_payload_data;
      end
      if(when_Axi4Crossbar_l942_1) begin
        io_slaves_0_w_payload_data = io_masters_1_w_payload_data;
      end
    end
  end

  always @(*) begin
    io_slaves_0_w_payload_strb = _zz_io_slaves_0_w_payload_data[35 : 32];
    if(when_Axi4Crossbar_l878) begin
      if(when_Axi4Crossbar_l881) begin
        if(when_Axi4Crossbar_l895) begin
          io_slaves_0_w_payload_strb = io_masters_0_w_payload_strb;
        end
      end
      if(when_Axi4Crossbar_l881_1) begin
        if(when_Axi4Crossbar_l895_1) begin
          io_slaves_0_w_payload_strb = io_masters_1_w_payload_strb;
        end
      end
    end
    if(when_Axi4Crossbar_l940) begin
      if(when_Axi4Crossbar_l942) begin
        io_slaves_0_w_payload_strb = io_masters_0_w_payload_strb;
      end
      if(when_Axi4Crossbar_l942_1) begin
        io_slaves_0_w_payload_strb = io_masters_1_w_payload_strb;
      end
    end
  end

  always @(*) begin
    io_slaves_0_w_payload_last = _zz_io_slaves_0_w_payload_data[36];
    if(when_Axi4Crossbar_l878) begin
      if(when_Axi4Crossbar_l881) begin
        if(when_Axi4Crossbar_l895) begin
          io_slaves_0_w_payload_last = io_masters_0_w_payload_last;
        end
      end
      if(when_Axi4Crossbar_l881_1) begin
        if(when_Axi4Crossbar_l895_1) begin
          io_slaves_0_w_payload_last = io_masters_1_w_payload_last;
        end
      end
    end
    if(when_Axi4Crossbar_l940) begin
      if(when_Axi4Crossbar_l942) begin
        io_slaves_0_w_payload_last = io_masters_0_w_payload_last;
      end
      if(when_Axi4Crossbar_l942_1) begin
        io_slaves_0_w_payload_last = io_masters_1_w_payload_last;
      end
    end
  end

  always @(*) begin
    io_slaves_0_b_ready = 1'b0;
    if(when_Axi4Crossbar_l1045) begin
      io_slaves_0_b_ready = io_masters_0_b_ready;
    end
    if(when_Axi4Crossbar_l1045_3) begin
      io_slaves_0_b_ready = io_masters_1_b_ready;
    end
  end

  always @(*) begin
    io_slaves_0_ar_valid = 1'b0;
    if(when_Axi4Crossbar_l1081) begin
      io_slaves_0_ar_valid = 1'b1;
    end
  end

  assign _zz_io_slaves_0_ar_payload_addr = 66'h0;
  always @(*) begin
    io_slaves_0_ar_payload_addr = _zz_io_slaves_0_ar_payload_addr[31 : 0];
    if(when_Axi4Crossbar_l1081) begin
      if(when_Axi4Crossbar_l1084) begin
        io_slaves_0_ar_payload_addr = io_masters_0_ar_payload_addr;
      end
      if(when_Axi4Crossbar_l1084_1) begin
        io_slaves_0_ar_payload_addr = io_masters_1_ar_payload_addr;
      end
    end
  end

  always @(*) begin
    io_slaves_0_ar_payload_id = _zz_io_slaves_0_ar_payload_addr[36 : 32];
    if(when_Axi4Crossbar_l1081) begin
      if(when_Axi4Crossbar_l1084) begin
        io_slaves_0_ar_payload_id = {_zz_io_slaves_0_ar_payload_id_1,io_masters_0_ar_payload_id};
      end
      if(when_Axi4Crossbar_l1084_1) begin
        io_slaves_0_ar_payload_id = {_zz_io_slaves_0_ar_payload_id_1,io_masters_1_ar_payload_id};
      end
    end
  end

  assign io_slaves_0_ar_payload_region = _zz_io_slaves_0_ar_payload_addr[40 : 37];
  always @(*) begin
    io_slaves_0_ar_payload_len = _zz_io_slaves_0_ar_payload_addr[48 : 41];
    if(when_Axi4Crossbar_l1081) begin
      if(when_Axi4Crossbar_l1084) begin
        io_slaves_0_ar_payload_len = io_masters_0_ar_payload_len;
      end
      if(when_Axi4Crossbar_l1084_1) begin
        io_slaves_0_ar_payload_len = io_masters_1_ar_payload_len;
      end
    end
  end

  always @(*) begin
    io_slaves_0_ar_payload_size = _zz_io_slaves_0_ar_payload_addr[51 : 49];
    if(when_Axi4Crossbar_l1081) begin
      if(when_Axi4Crossbar_l1084) begin
        io_slaves_0_ar_payload_size = io_masters_0_ar_payload_size;
      end
      if(when_Axi4Crossbar_l1084_1) begin
        io_slaves_0_ar_payload_size = io_masters_1_ar_payload_size;
      end
    end
  end

  always @(*) begin
    io_slaves_0_ar_payload_burst = _zz_io_slaves_0_ar_payload_addr[53 : 52];
    if(when_Axi4Crossbar_l1081) begin
      if(when_Axi4Crossbar_l1084) begin
        io_slaves_0_ar_payload_burst = io_masters_0_ar_payload_burst;
      end
      if(when_Axi4Crossbar_l1084_1) begin
        io_slaves_0_ar_payload_burst = io_masters_1_ar_payload_burst;
      end
    end
  end

  always @(*) begin
    io_slaves_0_ar_payload_lock = _zz_io_slaves_0_ar_payload_addr[54 : 54];
    if(when_Axi4Crossbar_l1081) begin
      if(when_Axi4Crossbar_l1084) begin
        io_slaves_0_ar_payload_lock = io_masters_0_ar_payload_lock;
      end
      if(when_Axi4Crossbar_l1084_1) begin
        io_slaves_0_ar_payload_lock = io_masters_1_ar_payload_lock;
      end
    end
  end

  always @(*) begin
    io_slaves_0_ar_payload_cache = _zz_io_slaves_0_ar_payload_addr[58 : 55];
    if(when_Axi4Crossbar_l1081) begin
      if(when_Axi4Crossbar_l1084) begin
        io_slaves_0_ar_payload_cache = io_masters_0_ar_payload_cache;
      end
      if(when_Axi4Crossbar_l1084_1) begin
        io_slaves_0_ar_payload_cache = io_masters_1_ar_payload_cache;
      end
    end
  end

  always @(*) begin
    io_slaves_0_ar_payload_qos = _zz_io_slaves_0_ar_payload_addr[62 : 59];
    if(when_Axi4Crossbar_l1081) begin
      if(when_Axi4Crossbar_l1084) begin
        io_slaves_0_ar_payload_qos = io_masters_0_ar_payload_qos;
      end
      if(when_Axi4Crossbar_l1084_1) begin
        io_slaves_0_ar_payload_qos = io_masters_1_ar_payload_qos;
      end
    end
  end

  always @(*) begin
    io_slaves_0_ar_payload_prot = _zz_io_slaves_0_ar_payload_addr[65 : 63];
    if(when_Axi4Crossbar_l1081) begin
      if(when_Axi4Crossbar_l1084) begin
        io_slaves_0_ar_payload_prot = io_masters_0_ar_payload_prot;
      end
      if(when_Axi4Crossbar_l1084_1) begin
        io_slaves_0_ar_payload_prot = io_masters_1_ar_payload_prot;
      end
    end
  end

  always @(*) begin
    io_slaves_0_r_ready = 1'b0;
    if(when_Axi4Crossbar_l1128) begin
      io_slaves_0_r_ready = io_masters_0_r_ready;
    end
    if(when_Axi4Crossbar_l1128_3) begin
      io_slaves_0_r_ready = io_masters_1_r_ready;
    end
  end

  always @(*) begin
    io_slaves_1_aw_valid = 1'b0;
    if(when_Axi4Crossbar_l878_1) begin
      io_slaves_1_aw_valid = 1'b1;
    end
  end

  assign _zz_io_slaves_1_aw_payload_addr = 66'h0;
  always @(*) begin
    io_slaves_1_aw_payload_addr = _zz_io_slaves_1_aw_payload_addr[31 : 0];
    if(when_Axi4Crossbar_l878_1) begin
      if(when_Axi4Crossbar_l881_2) begin
        io_slaves_1_aw_payload_addr = io_masters_0_aw_payload_addr;
      end
      if(when_Axi4Crossbar_l881_3) begin
        io_slaves_1_aw_payload_addr = io_masters_1_aw_payload_addr;
      end
    end
  end

  always @(*) begin
    io_slaves_1_aw_payload_id = _zz_io_slaves_1_aw_payload_addr[36 : 32];
    if(when_Axi4Crossbar_l878_1) begin
      if(when_Axi4Crossbar_l881_2) begin
        io_slaves_1_aw_payload_id = {_zz_io_slaves_1_aw_payload_id_1,io_masters_0_aw_payload_id};
      end
      if(when_Axi4Crossbar_l881_3) begin
        io_slaves_1_aw_payload_id = {_zz_io_slaves_1_aw_payload_id_1,io_masters_1_aw_payload_id};
      end
    end
  end

  assign io_slaves_1_aw_payload_region = _zz_io_slaves_1_aw_payload_addr[40 : 37];
  always @(*) begin
    io_slaves_1_aw_payload_len = _zz_io_slaves_1_aw_payload_addr[48 : 41];
    if(when_Axi4Crossbar_l878_1) begin
      if(when_Axi4Crossbar_l881_2) begin
        io_slaves_1_aw_payload_len = io_masters_0_aw_payload_len;
      end
      if(when_Axi4Crossbar_l881_3) begin
        io_slaves_1_aw_payload_len = io_masters_1_aw_payload_len;
      end
    end
  end

  always @(*) begin
    io_slaves_1_aw_payload_size = _zz_io_slaves_1_aw_payload_addr[51 : 49];
    if(when_Axi4Crossbar_l878_1) begin
      if(when_Axi4Crossbar_l881_2) begin
        io_slaves_1_aw_payload_size = io_masters_0_aw_payload_size;
      end
      if(when_Axi4Crossbar_l881_3) begin
        io_slaves_1_aw_payload_size = io_masters_1_aw_payload_size;
      end
    end
  end

  always @(*) begin
    io_slaves_1_aw_payload_burst = _zz_io_slaves_1_aw_payload_addr[53 : 52];
    if(when_Axi4Crossbar_l878_1) begin
      if(when_Axi4Crossbar_l881_2) begin
        io_slaves_1_aw_payload_burst = io_masters_0_aw_payload_burst;
      end
      if(when_Axi4Crossbar_l881_3) begin
        io_slaves_1_aw_payload_burst = io_masters_1_aw_payload_burst;
      end
    end
  end

  always @(*) begin
    io_slaves_1_aw_payload_lock = _zz_io_slaves_1_aw_payload_addr[54 : 54];
    if(when_Axi4Crossbar_l878_1) begin
      if(when_Axi4Crossbar_l881_2) begin
        io_slaves_1_aw_payload_lock = io_masters_0_aw_payload_lock;
      end
      if(when_Axi4Crossbar_l881_3) begin
        io_slaves_1_aw_payload_lock = io_masters_1_aw_payload_lock;
      end
    end
  end

  always @(*) begin
    io_slaves_1_aw_payload_cache = _zz_io_slaves_1_aw_payload_addr[58 : 55];
    if(when_Axi4Crossbar_l878_1) begin
      if(when_Axi4Crossbar_l881_2) begin
        io_slaves_1_aw_payload_cache = io_masters_0_aw_payload_cache;
      end
      if(when_Axi4Crossbar_l881_3) begin
        io_slaves_1_aw_payload_cache = io_masters_1_aw_payload_cache;
      end
    end
  end

  always @(*) begin
    io_slaves_1_aw_payload_qos = _zz_io_slaves_1_aw_payload_addr[62 : 59];
    if(when_Axi4Crossbar_l878_1) begin
      if(when_Axi4Crossbar_l881_2) begin
        io_slaves_1_aw_payload_qos = io_masters_0_aw_payload_qos;
      end
      if(when_Axi4Crossbar_l881_3) begin
        io_slaves_1_aw_payload_qos = io_masters_1_aw_payload_qos;
      end
    end
  end

  always @(*) begin
    io_slaves_1_aw_payload_prot = _zz_io_slaves_1_aw_payload_addr[65 : 63];
    if(when_Axi4Crossbar_l878_1) begin
      if(when_Axi4Crossbar_l881_2) begin
        io_slaves_1_aw_payload_prot = io_masters_0_aw_payload_prot;
      end
      if(when_Axi4Crossbar_l881_3) begin
        io_slaves_1_aw_payload_prot = io_masters_1_aw_payload_prot;
      end
    end
  end

  always @(*) begin
    io_slaves_1_w_valid = 1'b0;
    if(when_Axi4Crossbar_l878_1) begin
      if(when_Axi4Crossbar_l881_2) begin
        if(when_Axi4Crossbar_l895_2) begin
          io_slaves_1_w_valid = io_masters_0_w_valid;
        end
      end
      if(when_Axi4Crossbar_l881_3) begin
        if(when_Axi4Crossbar_l895_3) begin
          io_slaves_1_w_valid = io_masters_1_w_valid;
        end
      end
    end
    if(when_Axi4Crossbar_l940_1) begin
      if(when_Axi4Crossbar_l942_2) begin
        io_slaves_1_w_valid = io_masters_0_w_valid;
      end
      if(when_Axi4Crossbar_l942_3) begin
        io_slaves_1_w_valid = io_masters_1_w_valid;
      end
    end
  end

  assign _zz_io_slaves_1_w_payload_data = 37'h0;
  always @(*) begin
    io_slaves_1_w_payload_data = _zz_io_slaves_1_w_payload_data[31 : 0];
    if(when_Axi4Crossbar_l878_1) begin
      if(when_Axi4Crossbar_l881_2) begin
        if(when_Axi4Crossbar_l895_2) begin
          io_slaves_1_w_payload_data = io_masters_0_w_payload_data;
        end
      end
      if(when_Axi4Crossbar_l881_3) begin
        if(when_Axi4Crossbar_l895_3) begin
          io_slaves_1_w_payload_data = io_masters_1_w_payload_data;
        end
      end
    end
    if(when_Axi4Crossbar_l940_1) begin
      if(when_Axi4Crossbar_l942_2) begin
        io_slaves_1_w_payload_data = io_masters_0_w_payload_data;
      end
      if(when_Axi4Crossbar_l942_3) begin
        io_slaves_1_w_payload_data = io_masters_1_w_payload_data;
      end
    end
  end

  always @(*) begin
    io_slaves_1_w_payload_strb = _zz_io_slaves_1_w_payload_data[35 : 32];
    if(when_Axi4Crossbar_l878_1) begin
      if(when_Axi4Crossbar_l881_2) begin
        if(when_Axi4Crossbar_l895_2) begin
          io_slaves_1_w_payload_strb = io_masters_0_w_payload_strb;
        end
      end
      if(when_Axi4Crossbar_l881_3) begin
        if(when_Axi4Crossbar_l895_3) begin
          io_slaves_1_w_payload_strb = io_masters_1_w_payload_strb;
        end
      end
    end
    if(when_Axi4Crossbar_l940_1) begin
      if(when_Axi4Crossbar_l942_2) begin
        io_slaves_1_w_payload_strb = io_masters_0_w_payload_strb;
      end
      if(when_Axi4Crossbar_l942_3) begin
        io_slaves_1_w_payload_strb = io_masters_1_w_payload_strb;
      end
    end
  end

  always @(*) begin
    io_slaves_1_w_payload_last = _zz_io_slaves_1_w_payload_data[36];
    if(when_Axi4Crossbar_l878_1) begin
      if(when_Axi4Crossbar_l881_2) begin
        if(when_Axi4Crossbar_l895_2) begin
          io_slaves_1_w_payload_last = io_masters_0_w_payload_last;
        end
      end
      if(when_Axi4Crossbar_l881_3) begin
        if(when_Axi4Crossbar_l895_3) begin
          io_slaves_1_w_payload_last = io_masters_1_w_payload_last;
        end
      end
    end
    if(when_Axi4Crossbar_l940_1) begin
      if(when_Axi4Crossbar_l942_2) begin
        io_slaves_1_w_payload_last = io_masters_0_w_payload_last;
      end
      if(when_Axi4Crossbar_l942_3) begin
        io_slaves_1_w_payload_last = io_masters_1_w_payload_last;
      end
    end
  end

  always @(*) begin
    io_slaves_1_b_ready = 1'b0;
    if(when_Axi4Crossbar_l1045_1) begin
      io_slaves_1_b_ready = io_masters_0_b_ready;
    end
    if(when_Axi4Crossbar_l1045_4) begin
      io_slaves_1_b_ready = io_masters_1_b_ready;
    end
  end

  always @(*) begin
    io_slaves_1_ar_valid = 1'b0;
    if(when_Axi4Crossbar_l1081_1) begin
      io_slaves_1_ar_valid = 1'b1;
    end
  end

  assign _zz_io_slaves_1_ar_payload_addr = 66'h0;
  always @(*) begin
    io_slaves_1_ar_payload_addr = _zz_io_slaves_1_ar_payload_addr[31 : 0];
    if(when_Axi4Crossbar_l1081_1) begin
      if(when_Axi4Crossbar_l1084_2) begin
        io_slaves_1_ar_payload_addr = io_masters_0_ar_payload_addr;
      end
      if(when_Axi4Crossbar_l1084_3) begin
        io_slaves_1_ar_payload_addr = io_masters_1_ar_payload_addr;
      end
    end
  end

  always @(*) begin
    io_slaves_1_ar_payload_id = _zz_io_slaves_1_ar_payload_addr[36 : 32];
    if(when_Axi4Crossbar_l1081_1) begin
      if(when_Axi4Crossbar_l1084_2) begin
        io_slaves_1_ar_payload_id = {_zz_io_slaves_1_ar_payload_id_1,io_masters_0_ar_payload_id};
      end
      if(when_Axi4Crossbar_l1084_3) begin
        io_slaves_1_ar_payload_id = {_zz_io_slaves_1_ar_payload_id_1,io_masters_1_ar_payload_id};
      end
    end
  end

  assign io_slaves_1_ar_payload_region = _zz_io_slaves_1_ar_payload_addr[40 : 37];
  always @(*) begin
    io_slaves_1_ar_payload_len = _zz_io_slaves_1_ar_payload_addr[48 : 41];
    if(when_Axi4Crossbar_l1081_1) begin
      if(when_Axi4Crossbar_l1084_2) begin
        io_slaves_1_ar_payload_len = io_masters_0_ar_payload_len;
      end
      if(when_Axi4Crossbar_l1084_3) begin
        io_slaves_1_ar_payload_len = io_masters_1_ar_payload_len;
      end
    end
  end

  always @(*) begin
    io_slaves_1_ar_payload_size = _zz_io_slaves_1_ar_payload_addr[51 : 49];
    if(when_Axi4Crossbar_l1081_1) begin
      if(when_Axi4Crossbar_l1084_2) begin
        io_slaves_1_ar_payload_size = io_masters_0_ar_payload_size;
      end
      if(when_Axi4Crossbar_l1084_3) begin
        io_slaves_1_ar_payload_size = io_masters_1_ar_payload_size;
      end
    end
  end

  always @(*) begin
    io_slaves_1_ar_payload_burst = _zz_io_slaves_1_ar_payload_addr[53 : 52];
    if(when_Axi4Crossbar_l1081_1) begin
      if(when_Axi4Crossbar_l1084_2) begin
        io_slaves_1_ar_payload_burst = io_masters_0_ar_payload_burst;
      end
      if(when_Axi4Crossbar_l1084_3) begin
        io_slaves_1_ar_payload_burst = io_masters_1_ar_payload_burst;
      end
    end
  end

  always @(*) begin
    io_slaves_1_ar_payload_lock = _zz_io_slaves_1_ar_payload_addr[54 : 54];
    if(when_Axi4Crossbar_l1081_1) begin
      if(when_Axi4Crossbar_l1084_2) begin
        io_slaves_1_ar_payload_lock = io_masters_0_ar_payload_lock;
      end
      if(when_Axi4Crossbar_l1084_3) begin
        io_slaves_1_ar_payload_lock = io_masters_1_ar_payload_lock;
      end
    end
  end

  always @(*) begin
    io_slaves_1_ar_payload_cache = _zz_io_slaves_1_ar_payload_addr[58 : 55];
    if(when_Axi4Crossbar_l1081_1) begin
      if(when_Axi4Crossbar_l1084_2) begin
        io_slaves_1_ar_payload_cache = io_masters_0_ar_payload_cache;
      end
      if(when_Axi4Crossbar_l1084_3) begin
        io_slaves_1_ar_payload_cache = io_masters_1_ar_payload_cache;
      end
    end
  end

  always @(*) begin
    io_slaves_1_ar_payload_qos = _zz_io_slaves_1_ar_payload_addr[62 : 59];
    if(when_Axi4Crossbar_l1081_1) begin
      if(when_Axi4Crossbar_l1084_2) begin
        io_slaves_1_ar_payload_qos = io_masters_0_ar_payload_qos;
      end
      if(when_Axi4Crossbar_l1084_3) begin
        io_slaves_1_ar_payload_qos = io_masters_1_ar_payload_qos;
      end
    end
  end

  always @(*) begin
    io_slaves_1_ar_payload_prot = _zz_io_slaves_1_ar_payload_addr[65 : 63];
    if(when_Axi4Crossbar_l1081_1) begin
      if(when_Axi4Crossbar_l1084_2) begin
        io_slaves_1_ar_payload_prot = io_masters_0_ar_payload_prot;
      end
      if(when_Axi4Crossbar_l1084_3) begin
        io_slaves_1_ar_payload_prot = io_masters_1_ar_payload_prot;
      end
    end
  end

  always @(*) begin
    io_slaves_1_r_ready = 1'b0;
    if(when_Axi4Crossbar_l1128_1) begin
      io_slaves_1_r_ready = io_masters_0_r_ready;
    end
    if(when_Axi4Crossbar_l1128_4) begin
      io_slaves_1_r_ready = io_masters_1_r_ready;
    end
  end

  always @(*) begin
    decErr_io_axi_aw_valid = 1'b0;
    if(when_Axi4Crossbar_l878_2) begin
      decErr_io_axi_aw_valid = 1'b1;
    end
  end

  assign _zz_io_axi_aw_payload_addr = 66'h0;
  always @(*) begin
    decErr_io_axi_aw_payload_addr = _zz_io_axi_aw_payload_addr[31 : 0];
    if(when_Axi4Crossbar_l878_2) begin
      if(when_Axi4Crossbar_l881_4) begin
        decErr_io_axi_aw_payload_addr = io_masters_0_aw_payload_addr;
      end
      if(when_Axi4Crossbar_l881_5) begin
        decErr_io_axi_aw_payload_addr = io_masters_1_aw_payload_addr;
      end
    end
  end

  always @(*) begin
    decErr_io_axi_aw_payload_id = _zz_io_axi_aw_payload_addr[36 : 32];
    if(when_Axi4Crossbar_l878_2) begin
      if(when_Axi4Crossbar_l881_4) begin
        decErr_io_axi_aw_payload_id = {_zz_wrRrPtr_2_1,io_masters_0_aw_payload_id};
      end
      if(when_Axi4Crossbar_l881_5) begin
        decErr_io_axi_aw_payload_id = {_zz_wrRrPtr_2_1,io_masters_1_aw_payload_id};
      end
    end
  end

  assign decErr_io_axi_aw_payload_region = _zz_io_axi_aw_payload_addr[40 : 37];
  always @(*) begin
    decErr_io_axi_aw_payload_len = _zz_io_axi_aw_payload_addr[48 : 41];
    if(when_Axi4Crossbar_l878_2) begin
      if(when_Axi4Crossbar_l881_4) begin
        decErr_io_axi_aw_payload_len = io_masters_0_aw_payload_len;
      end
      if(when_Axi4Crossbar_l881_5) begin
        decErr_io_axi_aw_payload_len = io_masters_1_aw_payload_len;
      end
    end
  end

  always @(*) begin
    decErr_io_axi_aw_payload_size = _zz_io_axi_aw_payload_addr[51 : 49];
    if(when_Axi4Crossbar_l878_2) begin
      if(when_Axi4Crossbar_l881_4) begin
        decErr_io_axi_aw_payload_size = io_masters_0_aw_payload_size;
      end
      if(when_Axi4Crossbar_l881_5) begin
        decErr_io_axi_aw_payload_size = io_masters_1_aw_payload_size;
      end
    end
  end

  always @(*) begin
    decErr_io_axi_aw_payload_burst = _zz_io_axi_aw_payload_addr[53 : 52];
    if(when_Axi4Crossbar_l878_2) begin
      if(when_Axi4Crossbar_l881_4) begin
        decErr_io_axi_aw_payload_burst = io_masters_0_aw_payload_burst;
      end
      if(when_Axi4Crossbar_l881_5) begin
        decErr_io_axi_aw_payload_burst = io_masters_1_aw_payload_burst;
      end
    end
  end

  always @(*) begin
    decErr_io_axi_aw_payload_lock = _zz_io_axi_aw_payload_addr[54 : 54];
    if(when_Axi4Crossbar_l878_2) begin
      if(when_Axi4Crossbar_l881_4) begin
        decErr_io_axi_aw_payload_lock = io_masters_0_aw_payload_lock;
      end
      if(when_Axi4Crossbar_l881_5) begin
        decErr_io_axi_aw_payload_lock = io_masters_1_aw_payload_lock;
      end
    end
  end

  always @(*) begin
    decErr_io_axi_aw_payload_cache = _zz_io_axi_aw_payload_addr[58 : 55];
    if(when_Axi4Crossbar_l878_2) begin
      if(when_Axi4Crossbar_l881_4) begin
        decErr_io_axi_aw_payload_cache = io_masters_0_aw_payload_cache;
      end
      if(when_Axi4Crossbar_l881_5) begin
        decErr_io_axi_aw_payload_cache = io_masters_1_aw_payload_cache;
      end
    end
  end

  always @(*) begin
    decErr_io_axi_aw_payload_qos = _zz_io_axi_aw_payload_addr[62 : 59];
    if(when_Axi4Crossbar_l878_2) begin
      if(when_Axi4Crossbar_l881_4) begin
        decErr_io_axi_aw_payload_qos = io_masters_0_aw_payload_qos;
      end
      if(when_Axi4Crossbar_l881_5) begin
        decErr_io_axi_aw_payload_qos = io_masters_1_aw_payload_qos;
      end
    end
  end

  always @(*) begin
    decErr_io_axi_aw_payload_prot = _zz_io_axi_aw_payload_addr[65 : 63];
    if(when_Axi4Crossbar_l878_2) begin
      if(when_Axi4Crossbar_l881_4) begin
        decErr_io_axi_aw_payload_prot = io_masters_0_aw_payload_prot;
      end
      if(when_Axi4Crossbar_l881_5) begin
        decErr_io_axi_aw_payload_prot = io_masters_1_aw_payload_prot;
      end
    end
  end

  always @(*) begin
    decErr_io_axi_w_valid = 1'b0;
    if(when_Axi4Crossbar_l878_2) begin
      if(when_Axi4Crossbar_l881_4) begin
        if(when_Axi4Crossbar_l895_4) begin
          decErr_io_axi_w_valid = io_masters_0_w_valid;
        end
      end
      if(when_Axi4Crossbar_l881_5) begin
        if(when_Axi4Crossbar_l895_5) begin
          decErr_io_axi_w_valid = io_masters_1_w_valid;
        end
      end
    end
    if(when_Axi4Crossbar_l940_2) begin
      if(when_Axi4Crossbar_l942_4) begin
        decErr_io_axi_w_valid = io_masters_0_w_valid;
      end
      if(when_Axi4Crossbar_l942_5) begin
        decErr_io_axi_w_valid = io_masters_1_w_valid;
      end
    end
  end

  assign _zz_io_axi_w_payload_data = 37'h0;
  always @(*) begin
    decErr_io_axi_w_payload_data = _zz_io_axi_w_payload_data[31 : 0];
    if(when_Axi4Crossbar_l878_2) begin
      if(when_Axi4Crossbar_l881_4) begin
        if(when_Axi4Crossbar_l895_4) begin
          decErr_io_axi_w_payload_data = io_masters_0_w_payload_data;
        end
      end
      if(when_Axi4Crossbar_l881_5) begin
        if(when_Axi4Crossbar_l895_5) begin
          decErr_io_axi_w_payload_data = io_masters_1_w_payload_data;
        end
      end
    end
    if(when_Axi4Crossbar_l940_2) begin
      if(when_Axi4Crossbar_l942_4) begin
        decErr_io_axi_w_payload_data = io_masters_0_w_payload_data;
      end
      if(when_Axi4Crossbar_l942_5) begin
        decErr_io_axi_w_payload_data = io_masters_1_w_payload_data;
      end
    end
  end

  always @(*) begin
    decErr_io_axi_w_payload_strb = _zz_io_axi_w_payload_data[35 : 32];
    if(when_Axi4Crossbar_l878_2) begin
      if(when_Axi4Crossbar_l881_4) begin
        if(when_Axi4Crossbar_l895_4) begin
          decErr_io_axi_w_payload_strb = io_masters_0_w_payload_strb;
        end
      end
      if(when_Axi4Crossbar_l881_5) begin
        if(when_Axi4Crossbar_l895_5) begin
          decErr_io_axi_w_payload_strb = io_masters_1_w_payload_strb;
        end
      end
    end
    if(when_Axi4Crossbar_l940_2) begin
      if(when_Axi4Crossbar_l942_4) begin
        decErr_io_axi_w_payload_strb = io_masters_0_w_payload_strb;
      end
      if(when_Axi4Crossbar_l942_5) begin
        decErr_io_axi_w_payload_strb = io_masters_1_w_payload_strb;
      end
    end
  end

  always @(*) begin
    decErr_io_axi_w_payload_last = _zz_io_axi_w_payload_data[36];
    if(when_Axi4Crossbar_l878_2) begin
      if(when_Axi4Crossbar_l881_4) begin
        if(when_Axi4Crossbar_l895_4) begin
          decErr_io_axi_w_payload_last = io_masters_0_w_payload_last;
        end
      end
      if(when_Axi4Crossbar_l881_5) begin
        if(when_Axi4Crossbar_l895_5) begin
          decErr_io_axi_w_payload_last = io_masters_1_w_payload_last;
        end
      end
    end
    if(when_Axi4Crossbar_l940_2) begin
      if(when_Axi4Crossbar_l942_4) begin
        decErr_io_axi_w_payload_last = io_masters_0_w_payload_last;
      end
      if(when_Axi4Crossbar_l942_5) begin
        decErr_io_axi_w_payload_last = io_masters_1_w_payload_last;
      end
    end
  end

  always @(*) begin
    decErr_io_axi_b_ready = 1'b0;
    if(when_Axi4Crossbar_l1045_2) begin
      decErr_io_axi_b_ready = io_masters_0_b_ready;
    end
    if(when_Axi4Crossbar_l1045_5) begin
      decErr_io_axi_b_ready = io_masters_1_b_ready;
    end
  end

  always @(*) begin
    decErr_io_axi_ar_valid = 1'b0;
    if(when_Axi4Crossbar_l1081_2) begin
      decErr_io_axi_ar_valid = 1'b1;
    end
  end

  assign _zz_io_axi_ar_payload_addr = 66'h0;
  always @(*) begin
    decErr_io_axi_ar_payload_addr = _zz_io_axi_ar_payload_addr[31 : 0];
    if(when_Axi4Crossbar_l1081_2) begin
      if(when_Axi4Crossbar_l1084_4) begin
        decErr_io_axi_ar_payload_addr = io_masters_0_ar_payload_addr;
      end
      if(when_Axi4Crossbar_l1084_5) begin
        decErr_io_axi_ar_payload_addr = io_masters_1_ar_payload_addr;
      end
    end
  end

  always @(*) begin
    decErr_io_axi_ar_payload_id = _zz_io_axi_ar_payload_addr[36 : 32];
    if(when_Axi4Crossbar_l1081_2) begin
      if(when_Axi4Crossbar_l1084_4) begin
        decErr_io_axi_ar_payload_id = {_zz_rdRrPtr_2_1,io_masters_0_ar_payload_id};
      end
      if(when_Axi4Crossbar_l1084_5) begin
        decErr_io_axi_ar_payload_id = {_zz_rdRrPtr_2_1,io_masters_1_ar_payload_id};
      end
    end
  end

  assign decErr_io_axi_ar_payload_region = _zz_io_axi_ar_payload_addr[40 : 37];
  always @(*) begin
    decErr_io_axi_ar_payload_len = _zz_io_axi_ar_payload_addr[48 : 41];
    if(when_Axi4Crossbar_l1081_2) begin
      if(when_Axi4Crossbar_l1084_4) begin
        decErr_io_axi_ar_payload_len = io_masters_0_ar_payload_len;
      end
      if(when_Axi4Crossbar_l1084_5) begin
        decErr_io_axi_ar_payload_len = io_masters_1_ar_payload_len;
      end
    end
  end

  always @(*) begin
    decErr_io_axi_ar_payload_size = _zz_io_axi_ar_payload_addr[51 : 49];
    if(when_Axi4Crossbar_l1081_2) begin
      if(when_Axi4Crossbar_l1084_4) begin
        decErr_io_axi_ar_payload_size = io_masters_0_ar_payload_size;
      end
      if(when_Axi4Crossbar_l1084_5) begin
        decErr_io_axi_ar_payload_size = io_masters_1_ar_payload_size;
      end
    end
  end

  always @(*) begin
    decErr_io_axi_ar_payload_burst = _zz_io_axi_ar_payload_addr[53 : 52];
    if(when_Axi4Crossbar_l1081_2) begin
      if(when_Axi4Crossbar_l1084_4) begin
        decErr_io_axi_ar_payload_burst = io_masters_0_ar_payload_burst;
      end
      if(when_Axi4Crossbar_l1084_5) begin
        decErr_io_axi_ar_payload_burst = io_masters_1_ar_payload_burst;
      end
    end
  end

  always @(*) begin
    decErr_io_axi_ar_payload_lock = _zz_io_axi_ar_payload_addr[54 : 54];
    if(when_Axi4Crossbar_l1081_2) begin
      if(when_Axi4Crossbar_l1084_4) begin
        decErr_io_axi_ar_payload_lock = io_masters_0_ar_payload_lock;
      end
      if(when_Axi4Crossbar_l1084_5) begin
        decErr_io_axi_ar_payload_lock = io_masters_1_ar_payload_lock;
      end
    end
  end

  always @(*) begin
    decErr_io_axi_ar_payload_cache = _zz_io_axi_ar_payload_addr[58 : 55];
    if(when_Axi4Crossbar_l1081_2) begin
      if(when_Axi4Crossbar_l1084_4) begin
        decErr_io_axi_ar_payload_cache = io_masters_0_ar_payload_cache;
      end
      if(when_Axi4Crossbar_l1084_5) begin
        decErr_io_axi_ar_payload_cache = io_masters_1_ar_payload_cache;
      end
    end
  end

  always @(*) begin
    decErr_io_axi_ar_payload_qos = _zz_io_axi_ar_payload_addr[62 : 59];
    if(when_Axi4Crossbar_l1081_2) begin
      if(when_Axi4Crossbar_l1084_4) begin
        decErr_io_axi_ar_payload_qos = io_masters_0_ar_payload_qos;
      end
      if(when_Axi4Crossbar_l1084_5) begin
        decErr_io_axi_ar_payload_qos = io_masters_1_ar_payload_qos;
      end
    end
  end

  always @(*) begin
    decErr_io_axi_ar_payload_prot = _zz_io_axi_ar_payload_addr[65 : 63];
    if(when_Axi4Crossbar_l1081_2) begin
      if(when_Axi4Crossbar_l1084_4) begin
        decErr_io_axi_ar_payload_prot = io_masters_0_ar_payload_prot;
      end
      if(when_Axi4Crossbar_l1084_5) begin
        decErr_io_axi_ar_payload_prot = io_masters_1_ar_payload_prot;
      end
    end
  end

  always @(*) begin
    decErr_io_axi_r_ready = 1'b0;
    if(when_Axi4Crossbar_l1128_2) begin
      decErr_io_axi_r_ready = io_masters_0_r_ready;
    end
    if(when_Axi4Crossbar_l1128_5) begin
      decErr_io_axi_r_ready = io_masters_1_r_ready;
    end
  end

  assign _zz_when_Axi4Crossbar_l878_13 = io_masters_0_aw_payload_id;
  assign _zz_when_Axi4Crossbar_l878_14 = (_zz_when_Axi4Crossbar_l808 && (_zz_when_Axi4Crossbar_l808_4 == _zz_when_Axi4Crossbar_l878_13));
  assign _zz_when_Axi4Crossbar_l878_15 = (_zz_when_Axi4Crossbar_l808_1 && (_zz_when_Axi4Crossbar_l808_5 == _zz_when_Axi4Crossbar_l878_13));
  assign _zz_when_Axi4Crossbar_l878_16 = (_zz_when_Axi4Crossbar_l878_14 || _zz_when_Axi4Crossbar_l878_15);
  always @(*) begin
    _zz_when_Axi4Crossbar_l878_17[0] = (! _zz_when_Axi4Crossbar_l808);
    _zz_when_Axi4Crossbar_l878_17[1] = (! _zz_when_Axi4Crossbar_l808_1);
  end

  always @(*) begin
    _zz_when_Axi4Crossbar_l878_18[0] = ((((_zz_when_Axi4Crossbar_l878_14 && (_zz_when_Axi4Crossbar_l878_3 == 2'b00)) && (_zz_when_Axi4Crossbar_l815 != 3'b100)) || ((_zz_when_Axi4Crossbar_l878_15 && (_zz_when_Axi4Crossbar_l878_4 == 2'b00)) && (_zz_when_Axi4Crossbar_l815_1 != 3'b100))) || ((! _zz_when_Axi4Crossbar_l878_16) && (|_zz_when_Axi4Crossbar_l878_17)));
    _zz_when_Axi4Crossbar_l878_18[1] = ((((_zz_when_Axi4Crossbar_l878_14 && (_zz_when_Axi4Crossbar_l878_3 == 2'b01)) && (_zz_when_Axi4Crossbar_l815 != 3'b100)) || ((_zz_when_Axi4Crossbar_l878_15 && (_zz_when_Axi4Crossbar_l878_4 == 2'b01)) && (_zz_when_Axi4Crossbar_l815_1 != 3'b100))) || ((! _zz_when_Axi4Crossbar_l878_16) && (|_zz_when_Axi4Crossbar_l878_17)));
    _zz_when_Axi4Crossbar_l878_18[2] = ((((_zz_when_Axi4Crossbar_l878_14 && (_zz_when_Axi4Crossbar_l878_3 == 2'b10)) && (_zz_when_Axi4Crossbar_l815 != 3'b100)) || ((_zz_when_Axi4Crossbar_l878_15 && (_zz_when_Axi4Crossbar_l878_4 == 2'b10)) && (_zz_when_Axi4Crossbar_l815_1 != 3'b100))) || ((! _zz_when_Axi4Crossbar_l878_16) && (|_zz_when_Axi4Crossbar_l878_17)));
  end

  always @(*) begin
    _zz_when_Axi4Crossbar_l878_11[0] = (_zz_when_Axi4Crossbar_l878_18[0] && ((_zz_when_Axi4Crossbar_l878_7 == 3'b000) || (_zz_when_Axi4Crossbar_l878_9 == 2'b00)));
    _zz_when_Axi4Crossbar_l878_11[1] = (_zz_when_Axi4Crossbar_l878_18[1] && ((_zz_when_Axi4Crossbar_l878_7 == 3'b000) || (_zz_when_Axi4Crossbar_l878_9 == 2'b01)));
    _zz_when_Axi4Crossbar_l878_11[2] = (_zz_when_Axi4Crossbar_l878_18[2] && ((_zz_when_Axi4Crossbar_l878_7 == 3'b000) || (_zz_when_Axi4Crossbar_l878_9 == 2'b10)));
  end

  assign _zz_when_Axi4Crossbar_l1081_9 = io_masters_0_ar_payload_id;
  assign _zz_when_Axi4Crossbar_l1081_10 = (_zz_when_Axi4Crossbar_l808_8 && (_zz_when_Axi4Crossbar_l808_12 == _zz_when_Axi4Crossbar_l1081_9));
  assign _zz_when_Axi4Crossbar_l1081_11 = (_zz_when_Axi4Crossbar_l808_9 && (_zz_when_Axi4Crossbar_l808_13 == _zz_when_Axi4Crossbar_l1081_9));
  assign _zz_when_Axi4Crossbar_l1081_12 = (_zz_when_Axi4Crossbar_l1081_10 || _zz_when_Axi4Crossbar_l1081_11);
  always @(*) begin
    _zz_when_Axi4Crossbar_l1081_13[0] = (! _zz_when_Axi4Crossbar_l808_8);
    _zz_when_Axi4Crossbar_l1081_13[1] = (! _zz_when_Axi4Crossbar_l808_9);
  end

  always @(*) begin
    _zz_when_Axi4Crossbar_l1081_14[0] = ((((_zz_when_Axi4Crossbar_l1081_10 && (_zz_when_Axi4Crossbar_l1081_3 == 2'b00)) && (_zz_when_Axi4Crossbar_l815_4 != 3'b100)) || ((_zz_when_Axi4Crossbar_l1081_11 && (_zz_when_Axi4Crossbar_l1081_4 == 2'b00)) && (_zz_when_Axi4Crossbar_l815_5 != 3'b100))) || ((! _zz_when_Axi4Crossbar_l1081_12) && (|_zz_when_Axi4Crossbar_l1081_13)));
    _zz_when_Axi4Crossbar_l1081_14[1] = ((((_zz_when_Axi4Crossbar_l1081_10 && (_zz_when_Axi4Crossbar_l1081_3 == 2'b01)) && (_zz_when_Axi4Crossbar_l815_4 != 3'b100)) || ((_zz_when_Axi4Crossbar_l1081_11 && (_zz_when_Axi4Crossbar_l1081_4 == 2'b01)) && (_zz_when_Axi4Crossbar_l815_5 != 3'b100))) || ((! _zz_when_Axi4Crossbar_l1081_12) && (|_zz_when_Axi4Crossbar_l1081_13)));
    _zz_when_Axi4Crossbar_l1081_14[2] = ((((_zz_when_Axi4Crossbar_l1081_10 && (_zz_when_Axi4Crossbar_l1081_3 == 2'b10)) && (_zz_when_Axi4Crossbar_l815_4 != 3'b100)) || ((_zz_when_Axi4Crossbar_l1081_11 && (_zz_when_Axi4Crossbar_l1081_4 == 2'b10)) && (_zz_when_Axi4Crossbar_l815_5 != 3'b100))) || ((! _zz_when_Axi4Crossbar_l1081_12) && (|_zz_when_Axi4Crossbar_l1081_13)));
  end

  assign _zz_when_Axi4Crossbar_l1081_7 = _zz_when_Axi4Crossbar_l1081_14;
  assign _zz_when_Axi4Crossbar_l878_19 = io_masters_1_aw_payload_id;
  assign _zz_when_Axi4Crossbar_l878_20 = (_zz_when_Axi4Crossbar_l808_2 && (_zz_when_Axi4Crossbar_l808_6 == _zz_when_Axi4Crossbar_l878_19));
  assign _zz_when_Axi4Crossbar_l878_21 = (_zz_when_Axi4Crossbar_l808_3 && (_zz_when_Axi4Crossbar_l808_7 == _zz_when_Axi4Crossbar_l878_19));
  assign _zz_when_Axi4Crossbar_l878_22 = (_zz_when_Axi4Crossbar_l878_20 || _zz_when_Axi4Crossbar_l878_21);
  always @(*) begin
    _zz_when_Axi4Crossbar_l878_23[0] = (! _zz_when_Axi4Crossbar_l808_2);
    _zz_when_Axi4Crossbar_l878_23[1] = (! _zz_when_Axi4Crossbar_l808_3);
  end

  always @(*) begin
    _zz_when_Axi4Crossbar_l878_24[0] = ((((_zz_when_Axi4Crossbar_l878_20 && (_zz_when_Axi4Crossbar_l878_5 == 2'b00)) && (_zz_when_Axi4Crossbar_l815_2 != 3'b100)) || ((_zz_when_Axi4Crossbar_l878_21 && (_zz_when_Axi4Crossbar_l878_6 == 2'b00)) && (_zz_when_Axi4Crossbar_l815_3 != 3'b100))) || ((! _zz_when_Axi4Crossbar_l878_22) && (|_zz_when_Axi4Crossbar_l878_23)));
    _zz_when_Axi4Crossbar_l878_24[1] = ((((_zz_when_Axi4Crossbar_l878_20 && (_zz_when_Axi4Crossbar_l878_5 == 2'b01)) && (_zz_when_Axi4Crossbar_l815_2 != 3'b100)) || ((_zz_when_Axi4Crossbar_l878_21 && (_zz_when_Axi4Crossbar_l878_6 == 2'b01)) && (_zz_when_Axi4Crossbar_l815_3 != 3'b100))) || ((! _zz_when_Axi4Crossbar_l878_22) && (|_zz_when_Axi4Crossbar_l878_23)));
    _zz_when_Axi4Crossbar_l878_24[2] = ((((_zz_when_Axi4Crossbar_l878_20 && (_zz_when_Axi4Crossbar_l878_5 == 2'b10)) && (_zz_when_Axi4Crossbar_l815_2 != 3'b100)) || ((_zz_when_Axi4Crossbar_l878_21 && (_zz_when_Axi4Crossbar_l878_6 == 2'b10)) && (_zz_when_Axi4Crossbar_l815_3 != 3'b100))) || ((! _zz_when_Axi4Crossbar_l878_22) && (|_zz_when_Axi4Crossbar_l878_23)));
  end

  always @(*) begin
    _zz_when_Axi4Crossbar_l878_12[0] = (_zz_when_Axi4Crossbar_l878_24[0] && ((_zz_when_Axi4Crossbar_l878_8 == 3'b000) || (_zz_when_Axi4Crossbar_l878_10 == 2'b00)));
    _zz_when_Axi4Crossbar_l878_12[1] = (_zz_when_Axi4Crossbar_l878_24[1] && ((_zz_when_Axi4Crossbar_l878_8 == 3'b000) || (_zz_when_Axi4Crossbar_l878_10 == 2'b01)));
    _zz_when_Axi4Crossbar_l878_12[2] = (_zz_when_Axi4Crossbar_l878_24[2] && ((_zz_when_Axi4Crossbar_l878_8 == 3'b000) || (_zz_when_Axi4Crossbar_l878_10 == 2'b10)));
  end

  assign _zz_when_Axi4Crossbar_l1081_15 = io_masters_1_ar_payload_id;
  assign _zz_when_Axi4Crossbar_l1081_16 = (_zz_when_Axi4Crossbar_l808_10 && (_zz_when_Axi4Crossbar_l808_14 == _zz_when_Axi4Crossbar_l1081_15));
  assign _zz_when_Axi4Crossbar_l1081_17 = (_zz_when_Axi4Crossbar_l808_11 && (_zz_when_Axi4Crossbar_l808_15 == _zz_when_Axi4Crossbar_l1081_15));
  assign _zz_when_Axi4Crossbar_l1081_18 = (_zz_when_Axi4Crossbar_l1081_16 || _zz_when_Axi4Crossbar_l1081_17);
  always @(*) begin
    _zz_when_Axi4Crossbar_l1081_19[0] = (! _zz_when_Axi4Crossbar_l808_10);
    _zz_when_Axi4Crossbar_l1081_19[1] = (! _zz_when_Axi4Crossbar_l808_11);
  end

  always @(*) begin
    _zz_when_Axi4Crossbar_l1081_20[0] = ((((_zz_when_Axi4Crossbar_l1081_16 && (_zz_when_Axi4Crossbar_l1081_5 == 2'b00)) && (_zz_when_Axi4Crossbar_l815_6 != 3'b100)) || ((_zz_when_Axi4Crossbar_l1081_17 && (_zz_when_Axi4Crossbar_l1081_6 == 2'b00)) && (_zz_when_Axi4Crossbar_l815_7 != 3'b100))) || ((! _zz_when_Axi4Crossbar_l1081_18) && (|_zz_when_Axi4Crossbar_l1081_19)));
    _zz_when_Axi4Crossbar_l1081_20[1] = ((((_zz_when_Axi4Crossbar_l1081_16 && (_zz_when_Axi4Crossbar_l1081_5 == 2'b01)) && (_zz_when_Axi4Crossbar_l815_6 != 3'b100)) || ((_zz_when_Axi4Crossbar_l1081_17 && (_zz_when_Axi4Crossbar_l1081_6 == 2'b01)) && (_zz_when_Axi4Crossbar_l815_7 != 3'b100))) || ((! _zz_when_Axi4Crossbar_l1081_18) && (|_zz_when_Axi4Crossbar_l1081_19)));
    _zz_when_Axi4Crossbar_l1081_20[2] = ((((_zz_when_Axi4Crossbar_l1081_16 && (_zz_when_Axi4Crossbar_l1081_5 == 2'b10)) && (_zz_when_Axi4Crossbar_l815_6 != 3'b100)) || ((_zz_when_Axi4Crossbar_l1081_17 && (_zz_when_Axi4Crossbar_l1081_6 == 2'b10)) && (_zz_when_Axi4Crossbar_l815_7 != 3'b100))) || ((! _zz_when_Axi4Crossbar_l1081_18) && (|_zz_when_Axi4Crossbar_l1081_19)));
  end

  assign _zz_when_Axi4Crossbar_l1081_8 = _zz_when_Axi4Crossbar_l1081_20;
  assign _zz_when_Axi4Crossbar_l878_25 = (_zz_when_Axi4Crossbar_l878 < 3'b100);
  always @(*) begin
    _zz_when_Axi4Crossbar_l878_27[0] = (io_masters_0_aw_payload_addr[31 : 16] == 16'h0);
    _zz_when_Axi4Crossbar_l878_27[1] = (io_masters_0_aw_payload_addr[31 : 16] == 16'h0001);
  end

  always @(*) begin
    _zz_when_Axi4Crossbar_l878_26[0] = ((io_masters_0_aw_valid && _zz__zz_when_Axi4Crossbar_l878_26[0]) && _zz_when_Axi4Crossbar_l878_11[0]);
    _zz_when_Axi4Crossbar_l878_26[1] = ((io_masters_1_aw_valid && _zz__zz_when_Axi4Crossbar_l878_26_1[0]) && _zz_when_Axi4Crossbar_l878_12[0]);
  end

  always @(*) begin
    _zz_when_Axi4Crossbar_l878_28[0] = (io_masters_1_aw_payload_addr[31 : 16] == 16'h0);
    _zz_when_Axi4Crossbar_l878_28[1] = (io_masters_1_aw_payload_addr[31 : 16] == 16'h0001);
  end

  always @(*) begin
    _zz_when_Axi4Crossbar_l340[0] = (wrRrPtr_0 <= 1'b0);
    _zz_when_Axi4Crossbar_l340[1] = (wrRrPtr_0 <= 1'b1);
  end

  assign _zz_when_Axi4Crossbar_l340_1 = (_zz_when_Axi4Crossbar_l878_26 & _zz_when_Axi4Crossbar_l340);
  assign _zz_when_Axi4Crossbar_l340_2 = _zz_when_Axi4Crossbar_l340_1;
  assign _zz_when_Axi4Crossbar_l340_3 = _zz_when_Axi4Crossbar_l878_26;
  assign _zz_when_Axi4Crossbar_l340_4 = ((|_zz_when_Axi4Crossbar_l340_1) ? (_zz_when_Axi4Crossbar_l340_2 & (~ _zz__zz_when_Axi4Crossbar_l340_4)) : (_zz_when_Axi4Crossbar_l340_3 & (~ _zz__zz_when_Axi4Crossbar_l340_4_1)));
  always @(*) begin
    _zz_io_slaves_0_aw_payload_id = 1'b0;
    if(when_Axi4Crossbar_l340) begin
      _zz_io_slaves_0_aw_payload_id = 1'b0;
    end
    if(when_Axi4Crossbar_l340_1) begin
      _zz_io_slaves_0_aw_payload_id = 1'b1;
    end
  end

  assign when_Axi4Crossbar_l340 = _zz_when_Axi4Crossbar_l340_4[0];
  assign when_Axi4Crossbar_l340_1 = _zz_when_Axi4Crossbar_l340_4[1];
  assign _zz_io_slaves_0_aw_payload_id_1 = (grantLock ? grantLockIdx : _zz_io_slaves_0_aw_payload_id);
  assign when_Axi4Crossbar_l269 = (io_slaves_0_aw_valid && (! io_slaves_0_aw_ready));
  assign _zz_when_Axi4Crossbar_l878_29 = (|_zz_when_Axi4Crossbar_l878_26);
  assign _zz_when_Axi4Crossbar_l895_3 = (_zz_when_Axi4Crossbar_l895 == 3'b000);
  assign _zz_when_Axi4Crossbar_l942_3 = _zz_4_spinal_port0;
  assign when_Axi4Crossbar_l878 = (_zz_when_Axi4Crossbar_l878_25 && _zz_when_Axi4Crossbar_l878_29);
  assign when_Axi4Crossbar_l881 = (_zz_io_slaves_0_aw_payload_id_1 == 1'b0);
  assign when_Axi4Crossbar_l895 = (_zz_when_Axi4Crossbar_l895_3 && (! _zz_when_Axi4Crossbar_l895_4));
  assign when_Axi4Crossbar_l881_1 = (_zz_io_slaves_0_aw_payload_id_1 == 1'b1);
  assign when_Axi4Crossbar_l895_1 = (_zz_when_Axi4Crossbar_l895_3 && (! _zz_when_Axi4Crossbar_l895_4));
  assign io_slaves_0_aw_fire = (io_slaves_0_aw_valid && io_slaves_0_aw_ready);
  assign io_slaves_0_w_fire = (io_slaves_0_w_valid && io_slaves_0_w_ready);
  assign _zz_when_Axi4Crossbar_l914 = ((((_zz_when_Axi4Crossbar_l878_25 && _zz_when_Axi4Crossbar_l878_29) && _zz_when_Axi4Crossbar_l895_3) && (! _zz_when_Axi4Crossbar_l895_4)) && io_slaves_0_w_fire);
  assign _zz_when_Axi4Crossbar_l926 = (_zz_when_Axi4Crossbar_l895_4 || (_zz_when_Axi4Crossbar_l914 && io_slaves_0_w_payload_last));
  assign when_Axi4Crossbar_l914 = (_zz_when_Axi4Crossbar_l914 && io_slaves_0_w_payload_last);
  always @(*) begin
    _zz_when_Axi4Crossbar_l1021[0] = (_zz_when_Axi4Crossbar_l914 && (_zz_io_slaves_0_aw_payload_id_1 == 1'b0));
    _zz_when_Axi4Crossbar_l1021[1] = (_zz_when_Axi4Crossbar_l914_1 && (_zz_io_slaves_1_aw_payload_id_1 == 1'b0));
    _zz_when_Axi4Crossbar_l1021[2] = (_zz_when_Axi4Crossbar_l914_2 && (_zz_wrRrPtr_2_1 == 1'b0));
  end

  always @(*) begin
    _zz_when_Axi4Crossbar_l1026[0] = ((io_slaves_0_aw_fire && _zz_when_Axi4Crossbar_l926) && (_zz_io_slaves_0_aw_payload_id_1 == 1'b0));
    _zz_when_Axi4Crossbar_l1026[1] = ((io_slaves_1_aw_fire && _zz_when_Axi4Crossbar_l926_1) && (_zz_io_slaves_1_aw_payload_id_1 == 1'b0));
    _zz_when_Axi4Crossbar_l1026[2] = ((decErr_io_axi_aw_fire && _zz_when_Axi4Crossbar_l926_2) && (_zz_wrRrPtr_2_1 == 1'b0));
  end

  always @(*) begin
    _zz_when_Axi4Crossbar_l1021_1[0] = (_zz_when_Axi4Crossbar_l914 && (_zz_io_slaves_0_aw_payload_id_1 == 1'b1));
    _zz_when_Axi4Crossbar_l1021_1[1] = (_zz_when_Axi4Crossbar_l914_1 && (_zz_io_slaves_1_aw_payload_id_1 == 1'b1));
    _zz_when_Axi4Crossbar_l1021_1[2] = (_zz_when_Axi4Crossbar_l914_2 && (_zz_wrRrPtr_2_1 == 1'b1));
  end

  always @(*) begin
    _zz_when_Axi4Crossbar_l1026_1[0] = ((io_slaves_0_aw_fire && _zz_when_Axi4Crossbar_l926) && (_zz_io_slaves_0_aw_payload_id_1 == 1'b1));
    _zz_when_Axi4Crossbar_l1026_1[1] = ((io_slaves_1_aw_fire && _zz_when_Axi4Crossbar_l926_1) && (_zz_io_slaves_1_aw_payload_id_1 == 1'b1));
    _zz_when_Axi4Crossbar_l1026_1[2] = ((decErr_io_axi_aw_fire && _zz_when_Axi4Crossbar_l926_2) && (_zz_wrRrPtr_2_1 == 1'b1));
  end

  assign when_Axi4Crossbar_l926 = (io_slaves_0_aw_fire && (! _zz_when_Axi4Crossbar_l926));
  assign when_Axi4Crossbar_l940 = (! _zz_when_Axi4Crossbar_l895_3);
  assign when_Axi4Crossbar_l942 = (_zz_when_Axi4Crossbar_l942_3 == 1'b0);
  assign when_Axi4Crossbar_l942_1 = (_zz_when_Axi4Crossbar_l942_3 == 1'b1);
  assign when_Axi4Crossbar_l953 = ((io_slaves_0_w_fire && io_slaves_0_w_payload_last) && (! _zz_when_Axi4Crossbar_l914));
  assign when_Axi4Crossbar_l959 = (when_Axi4Crossbar_l926 && (! when_Axi4Crossbar_l953));
  assign when_Axi4Crossbar_l961 = ((! when_Axi4Crossbar_l926) && when_Axi4Crossbar_l953);
  assign io_slaves_0_b_fire = (io_slaves_0_b_valid && io_slaves_0_b_ready);
  assign when_Axi4Crossbar_l968 = (io_slaves_0_aw_fire && (! io_slaves_0_b_fire));
  assign when_Axi4Crossbar_l970 = ((! io_slaves_0_aw_fire) && io_slaves_0_b_fire);
  assign _zz_when_Axi4Crossbar_l878_30 = (_zz_when_Axi4Crossbar_l878_1 < 3'b100);
  always @(*) begin
    _zz_when_Axi4Crossbar_l878_32[0] = (io_masters_0_aw_payload_addr[31 : 16] == 16'h0);
    _zz_when_Axi4Crossbar_l878_32[1] = (io_masters_0_aw_payload_addr[31 : 16] == 16'h0001);
  end

  always @(*) begin
    _zz_when_Axi4Crossbar_l878_31[0] = ((io_masters_0_aw_valid && _zz__zz_when_Axi4Crossbar_l878_31[1]) && _zz_when_Axi4Crossbar_l878_11[1]);
    _zz_when_Axi4Crossbar_l878_31[1] = ((io_masters_1_aw_valid && _zz__zz_when_Axi4Crossbar_l878_31_1[1]) && _zz_when_Axi4Crossbar_l878_12[1]);
  end

  always @(*) begin
    _zz_when_Axi4Crossbar_l878_33[0] = (io_masters_1_aw_payload_addr[31 : 16] == 16'h0);
    _zz_when_Axi4Crossbar_l878_33[1] = (io_masters_1_aw_payload_addr[31 : 16] == 16'h0001);
  end

  always @(*) begin
    _zz_when_Axi4Crossbar_l340_5[0] = (wrRrPtr_1 <= 1'b0);
    _zz_when_Axi4Crossbar_l340_5[1] = (wrRrPtr_1 <= 1'b1);
  end

  assign _zz_when_Axi4Crossbar_l340_6 = (_zz_when_Axi4Crossbar_l878_31 & _zz_when_Axi4Crossbar_l340_5);
  assign _zz_when_Axi4Crossbar_l340_7 = _zz_when_Axi4Crossbar_l340_6;
  assign _zz_when_Axi4Crossbar_l340_8 = _zz_when_Axi4Crossbar_l878_31;
  assign _zz_when_Axi4Crossbar_l340_9 = ((|_zz_when_Axi4Crossbar_l340_6) ? (_zz_when_Axi4Crossbar_l340_7 & (~ _zz__zz_when_Axi4Crossbar_l340_9)) : (_zz_when_Axi4Crossbar_l340_8 & (~ _zz__zz_when_Axi4Crossbar_l340_9_1)));
  always @(*) begin
    _zz_io_slaves_1_aw_payload_id = 1'b0;
    if(when_Axi4Crossbar_l340_2) begin
      _zz_io_slaves_1_aw_payload_id = 1'b0;
    end
    if(when_Axi4Crossbar_l340_3) begin
      _zz_io_slaves_1_aw_payload_id = 1'b1;
    end
  end

  assign when_Axi4Crossbar_l340_2 = _zz_when_Axi4Crossbar_l340_9[0];
  assign when_Axi4Crossbar_l340_3 = _zz_when_Axi4Crossbar_l340_9[1];
  assign _zz_io_slaves_1_aw_payload_id_1 = (grantLock_1 ? grantLockIdx_1 : _zz_io_slaves_1_aw_payload_id);
  assign when_Axi4Crossbar_l269_1 = (io_slaves_1_aw_valid && (! io_slaves_1_aw_ready));
  assign _zz_when_Axi4Crossbar_l878_34 = (|_zz_when_Axi4Crossbar_l878_31);
  assign _zz_when_Axi4Crossbar_l895_5 = (_zz_when_Axi4Crossbar_l895_1 == 3'b000);
  assign _zz_when_Axi4Crossbar_l942_4 = _zz_5_spinal_port0;
  assign when_Axi4Crossbar_l878_1 = (_zz_when_Axi4Crossbar_l878_30 && _zz_when_Axi4Crossbar_l878_34);
  assign when_Axi4Crossbar_l881_2 = (_zz_io_slaves_1_aw_payload_id_1 == 1'b0);
  assign when_Axi4Crossbar_l895_2 = (_zz_when_Axi4Crossbar_l895_5 && (! _zz_when_Axi4Crossbar_l895_6));
  assign when_Axi4Crossbar_l881_3 = (_zz_io_slaves_1_aw_payload_id_1 == 1'b1);
  assign when_Axi4Crossbar_l895_3 = (_zz_when_Axi4Crossbar_l895_5 && (! _zz_when_Axi4Crossbar_l895_6));
  assign io_slaves_1_aw_fire = (io_slaves_1_aw_valid && io_slaves_1_aw_ready);
  assign io_slaves_1_w_fire = (io_slaves_1_w_valid && io_slaves_1_w_ready);
  assign _zz_when_Axi4Crossbar_l914_1 = ((((_zz_when_Axi4Crossbar_l878_30 && _zz_when_Axi4Crossbar_l878_34) && _zz_when_Axi4Crossbar_l895_5) && (! _zz_when_Axi4Crossbar_l895_6)) && io_slaves_1_w_fire);
  assign _zz_when_Axi4Crossbar_l926_1 = (_zz_when_Axi4Crossbar_l895_6 || (_zz_when_Axi4Crossbar_l914_1 && io_slaves_1_w_payload_last));
  assign when_Axi4Crossbar_l914_1 = (_zz_when_Axi4Crossbar_l914_1 && io_slaves_1_w_payload_last);
  assign when_Axi4Crossbar_l926_1 = (io_slaves_1_aw_fire && (! _zz_when_Axi4Crossbar_l926_1));
  assign when_Axi4Crossbar_l940_1 = (! _zz_when_Axi4Crossbar_l895_5);
  assign when_Axi4Crossbar_l942_2 = (_zz_when_Axi4Crossbar_l942_4 == 1'b0);
  assign when_Axi4Crossbar_l942_3 = (_zz_when_Axi4Crossbar_l942_4 == 1'b1);
  assign when_Axi4Crossbar_l953_1 = ((io_slaves_1_w_fire && io_slaves_1_w_payload_last) && (! _zz_when_Axi4Crossbar_l914_1));
  assign when_Axi4Crossbar_l959_1 = (when_Axi4Crossbar_l926_1 && (! when_Axi4Crossbar_l953_1));
  assign when_Axi4Crossbar_l961_1 = ((! when_Axi4Crossbar_l926_1) && when_Axi4Crossbar_l953_1);
  assign io_slaves_1_b_fire = (io_slaves_1_b_valid && io_slaves_1_b_ready);
  assign when_Axi4Crossbar_l968_1 = (io_slaves_1_aw_fire && (! io_slaves_1_b_fire));
  assign when_Axi4Crossbar_l970_1 = ((! io_slaves_1_aw_fire) && io_slaves_1_b_fire);
  assign _zz_when_Axi4Crossbar_l878_35 = (_zz_when_Axi4Crossbar_l878_2 < 3'b100);
  always @(*) begin
    _zz_when_Axi4Crossbar_l878_37[0] = (io_masters_0_aw_payload_addr[31 : 16] == 16'h0);
    _zz_when_Axi4Crossbar_l878_37[1] = (io_masters_0_aw_payload_addr[31 : 16] == 16'h0001);
  end

  always @(*) begin
    _zz_when_Axi4Crossbar_l878_36[0] = ((io_masters_0_aw_valid && _zz__zz_when_Axi4Crossbar_l878_36[2]) && _zz_when_Axi4Crossbar_l878_11[2]);
    _zz_when_Axi4Crossbar_l878_36[1] = ((io_masters_1_aw_valid && _zz__zz_when_Axi4Crossbar_l878_36_1[2]) && _zz_when_Axi4Crossbar_l878_12[2]);
  end

  always @(*) begin
    _zz_when_Axi4Crossbar_l878_38[0] = (io_masters_1_aw_payload_addr[31 : 16] == 16'h0);
    _zz_when_Axi4Crossbar_l878_38[1] = (io_masters_1_aw_payload_addr[31 : 16] == 16'h0001);
  end

  always @(*) begin
    _zz_when_Axi4Crossbar_l340_10[0] = (wrRrPtr_2 <= 1'b0);
    _zz_when_Axi4Crossbar_l340_10[1] = (wrRrPtr_2 <= 1'b1);
  end

  assign _zz_when_Axi4Crossbar_l340_11 = (_zz_when_Axi4Crossbar_l878_36 & _zz_when_Axi4Crossbar_l340_10);
  assign _zz_when_Axi4Crossbar_l340_12 = _zz_when_Axi4Crossbar_l340_11;
  assign _zz_when_Axi4Crossbar_l340_13 = _zz_when_Axi4Crossbar_l878_36;
  assign _zz_when_Axi4Crossbar_l340_14 = ((|_zz_when_Axi4Crossbar_l340_11) ? (_zz_when_Axi4Crossbar_l340_12 & (~ _zz__zz_when_Axi4Crossbar_l340_14)) : (_zz_when_Axi4Crossbar_l340_13 & (~ _zz__zz_when_Axi4Crossbar_l340_14_1)));
  always @(*) begin
    _zz_wrRrPtr_2 = 1'b0;
    if(when_Axi4Crossbar_l340_4) begin
      _zz_wrRrPtr_2 = 1'b0;
    end
    if(when_Axi4Crossbar_l340_5) begin
      _zz_wrRrPtr_2 = 1'b1;
    end
  end

  assign when_Axi4Crossbar_l340_4 = _zz_when_Axi4Crossbar_l340_14[0];
  assign when_Axi4Crossbar_l340_5 = _zz_when_Axi4Crossbar_l340_14[1];
  assign _zz_wrRrPtr_2_1 = (grantLock_2 ? grantLockIdx_2 : _zz_wrRrPtr_2);
  assign when_Axi4Crossbar_l269_2 = (decErr_io_axi_aw_valid && (! decErr_io_axi_aw_ready));
  assign _zz_when_Axi4Crossbar_l878_39 = (|_zz_when_Axi4Crossbar_l878_36);
  assign _zz_when_Axi4Crossbar_l895_7 = (_zz_when_Axi4Crossbar_l895_2 == 3'b000);
  assign _zz_when_Axi4Crossbar_l942_5 = _zz_6_spinal_port0;
  assign when_Axi4Crossbar_l878_2 = (_zz_when_Axi4Crossbar_l878_35 && _zz_when_Axi4Crossbar_l878_39);
  assign when_Axi4Crossbar_l881_4 = (_zz_wrRrPtr_2_1 == 1'b0);
  assign when_Axi4Crossbar_l895_4 = (_zz_when_Axi4Crossbar_l895_7 && (! _zz_when_Axi4Crossbar_l895_8));
  assign when_Axi4Crossbar_l881_5 = (_zz_wrRrPtr_2_1 == 1'b1);
  assign when_Axi4Crossbar_l895_5 = (_zz_when_Axi4Crossbar_l895_7 && (! _zz_when_Axi4Crossbar_l895_8));
  assign decErr_io_axi_aw_fire = (decErr_io_axi_aw_valid && decErr_io_axi_aw_ready);
  assign decErr_io_axi_w_fire = (decErr_io_axi_w_valid && decErr_io_axi_w_ready);
  assign _zz_when_Axi4Crossbar_l914_2 = ((((_zz_when_Axi4Crossbar_l878_35 && _zz_when_Axi4Crossbar_l878_39) && _zz_when_Axi4Crossbar_l895_7) && (! _zz_when_Axi4Crossbar_l895_8)) && decErr_io_axi_w_fire);
  assign _zz_when_Axi4Crossbar_l926_2 = (_zz_when_Axi4Crossbar_l895_8 || (_zz_when_Axi4Crossbar_l914_2 && decErr_io_axi_w_payload_last));
  assign when_Axi4Crossbar_l914_2 = (_zz_when_Axi4Crossbar_l914_2 && decErr_io_axi_w_payload_last);
  assign when_Axi4Crossbar_l926_2 = (decErr_io_axi_aw_fire && (! _zz_when_Axi4Crossbar_l926_2));
  assign when_Axi4Crossbar_l940_2 = (! _zz_when_Axi4Crossbar_l895_7);
  assign when_Axi4Crossbar_l942_4 = (_zz_when_Axi4Crossbar_l942_5 == 1'b0);
  assign when_Axi4Crossbar_l942_5 = (_zz_when_Axi4Crossbar_l942_5 == 1'b1);
  assign when_Axi4Crossbar_l953_2 = ((decErr_io_axi_w_fire && decErr_io_axi_w_payload_last) && (! _zz_when_Axi4Crossbar_l914_2));
  assign when_Axi4Crossbar_l959_2 = (when_Axi4Crossbar_l926_2 && (! when_Axi4Crossbar_l953_2));
  assign when_Axi4Crossbar_l961_2 = ((! when_Axi4Crossbar_l926_2) && when_Axi4Crossbar_l953_2);
  assign decErr_io_axi_b_fire = (decErr_io_axi_b_valid && decErr_io_axi_b_ready);
  assign when_Axi4Crossbar_l968_2 = (decErr_io_axi_aw_fire && (! decErr_io_axi_b_fire));
  assign when_Axi4Crossbar_l970_2 = ((! decErr_io_axi_aw_fire) && decErr_io_axi_b_fire);
  assign _zz_when_Axi4Crossbar_l808_16 = (io_masters_0_aw_valid && io_masters_0_aw_ready);
  assign _zz_when_Axi4Crossbar_l808_17 = io_masters_0_aw_payload_id;
  always @(*) begin
    _zz_when_Axi4Crossbar_l728[0] = (io_masters_0_aw_payload_addr[31 : 16] == 16'h0);
    _zz_when_Axi4Crossbar_l728[1] = (io_masters_0_aw_payload_addr[31 : 16] == 16'h0001);
  end

  assign _zz_when_Axi4Crossbar_l728_1 = {(! (|_zz_when_Axi4Crossbar_l728)),_zz_when_Axi4Crossbar_l728};
  always @(*) begin
    _zz_when_Axi4Crossbar_l878_40 = 2'b00;
    if(when_Axi4Crossbar_l728) begin
      _zz_when_Axi4Crossbar_l878_40 = 2'b00;
    end
    if(when_Axi4Crossbar_l728_1) begin
      _zz_when_Axi4Crossbar_l878_40 = 2'b01;
    end
    if(when_Axi4Crossbar_l728_2) begin
      _zz_when_Axi4Crossbar_l878_40 = 2'b10;
    end
  end

  assign when_Axi4Crossbar_l728 = _zz_when_Axi4Crossbar_l728_1[0];
  assign when_Axi4Crossbar_l728_1 = _zz_when_Axi4Crossbar_l728_1[1];
  assign when_Axi4Crossbar_l728_2 = _zz_when_Axi4Crossbar_l728_1[2];
  assign _zz_when_Axi4Crossbar_l808_18 = (io_masters_0_b_valid && io_masters_0_b_ready);
  assign _zz_when_Axi4Crossbar_l808_19 = io_masters_0_b_payload_id;
  assign _zz_when_Axi4Crossbar_l808_20 = (_zz_when_Axi4Crossbar_l808 && (_zz_when_Axi4Crossbar_l808_4 == _zz_when_Axi4Crossbar_l808_17));
  assign _zz_when_Axi4Crossbar_l808_21 = (_zz_when_Axi4Crossbar_l808_1 && (_zz_when_Axi4Crossbar_l808_5 == _zz_when_Axi4Crossbar_l808_17));
  assign _zz_when_Axi4Crossbar_l808_22 = (_zz_when_Axi4Crossbar_l808_20 || _zz_when_Axi4Crossbar_l808_21);
  always @(*) begin
    _zz_when_Axi4Crossbar_l808_23[0] = (! _zz_when_Axi4Crossbar_l808);
    _zz_when_Axi4Crossbar_l808_23[1] = (! _zz_when_Axi4Crossbar_l808_1);
  end

  assign _zz_when_Axi4Crossbar_l808_24 = _zz_when_Axi4Crossbar_l808_23;
  assign _zz_when_Axi4Crossbar_l808_25 = (_zz_when_Axi4Crossbar_l808_24 & (~ _zz__zz_when_Axi4Crossbar_l808_25));
  assign _zz_when_Axi4Crossbar_l808_26 = ((_zz_when_Axi4Crossbar_l808_16 && (! _zz_when_Axi4Crossbar_l808_22)) && _zz_when_Axi4Crossbar_l808_25[0]);
  assign _zz_when_Axi4Crossbar_l808_27 = (_zz_when_Axi4Crossbar_l808_16 && (_zz_when_Axi4Crossbar_l808_20 || _zz_when_Axi4Crossbar_l808_26));
  assign _zz_when_Axi4Crossbar_l808_28 = ((_zz_when_Axi4Crossbar_l808_18 && (_zz_when_Axi4Crossbar_l808 || _zz_when_Axi4Crossbar_l808_26)) && ((_zz_when_Axi4Crossbar_l808_26 ? _zz_when_Axi4Crossbar_l808_17 : _zz_when_Axi4Crossbar_l808_4) == _zz_when_Axi4Crossbar_l808_19));
  assign when_Axi4Crossbar_l808 = (_zz_when_Axi4Crossbar_l808_27 && (! _zz_when_Axi4Crossbar_l808_28));
  assign when_Axi4Crossbar_l815 = (_zz_when_Axi4Crossbar_l815 == 3'b001);
  assign when_Axi4Crossbar_l813 = ((! _zz_when_Axi4Crossbar_l808_27) && _zz_when_Axi4Crossbar_l808_28);
  assign _zz_when_Axi4Crossbar_l808_29 = ((_zz_when_Axi4Crossbar_l808_16 && (! _zz_when_Axi4Crossbar_l808_22)) && _zz_when_Axi4Crossbar_l808_25[1]);
  assign _zz_when_Axi4Crossbar_l808_30 = (_zz_when_Axi4Crossbar_l808_16 && (_zz_when_Axi4Crossbar_l808_21 || _zz_when_Axi4Crossbar_l808_29));
  assign _zz_when_Axi4Crossbar_l808_31 = ((_zz_when_Axi4Crossbar_l808_18 && (_zz_when_Axi4Crossbar_l808_1 || _zz_when_Axi4Crossbar_l808_29)) && ((_zz_when_Axi4Crossbar_l808_29 ? _zz_when_Axi4Crossbar_l808_17 : _zz_when_Axi4Crossbar_l808_5) == _zz_when_Axi4Crossbar_l808_19));
  assign when_Axi4Crossbar_l808_1 = (_zz_when_Axi4Crossbar_l808_30 && (! _zz_when_Axi4Crossbar_l808_31));
  assign when_Axi4Crossbar_l815_1 = (_zz_when_Axi4Crossbar_l815_1 == 3'b001);
  assign when_Axi4Crossbar_l813_1 = ((! _zz_when_Axi4Crossbar_l808_30) && _zz_when_Axi4Crossbar_l808_31);
  assign _zz_when_Axi4Crossbar_l808_32 = (io_masters_0_ar_valid && io_masters_0_ar_ready);
  assign _zz_when_Axi4Crossbar_l808_33 = io_masters_0_ar_payload_id;
  always @(*) begin
    _zz_when_Axi4Crossbar_l728_2[0] = (io_masters_0_ar_payload_addr[31 : 16] == 16'h0);
    _zz_when_Axi4Crossbar_l728_2[1] = (io_masters_0_ar_payload_addr[31 : 16] == 16'h0001);
  end

  assign _zz_when_Axi4Crossbar_l728_3 = {(! (|_zz_when_Axi4Crossbar_l728_2)),_zz_when_Axi4Crossbar_l728_2};
  always @(*) begin
    _zz_when_Axi4Crossbar_l1081_21 = 2'b00;
    if(when_Axi4Crossbar_l728_3) begin
      _zz_when_Axi4Crossbar_l1081_21 = 2'b00;
    end
    if(when_Axi4Crossbar_l728_4) begin
      _zz_when_Axi4Crossbar_l1081_21 = 2'b01;
    end
    if(when_Axi4Crossbar_l728_5) begin
      _zz_when_Axi4Crossbar_l1081_21 = 2'b10;
    end
  end

  assign when_Axi4Crossbar_l728_3 = _zz_when_Axi4Crossbar_l728_3[0];
  assign when_Axi4Crossbar_l728_4 = _zz_when_Axi4Crossbar_l728_3[1];
  assign when_Axi4Crossbar_l728_5 = _zz_when_Axi4Crossbar_l728_3[2];
  assign _zz_when_Axi4Crossbar_l808_34 = ((io_masters_0_r_valid && io_masters_0_r_ready) && io_masters_0_r_payload_last);
  assign _zz_when_Axi4Crossbar_l808_35 = io_masters_0_r_payload_id;
  assign _zz_when_Axi4Crossbar_l808_36 = (_zz_when_Axi4Crossbar_l808_8 && (_zz_when_Axi4Crossbar_l808_12 == _zz_when_Axi4Crossbar_l808_33));
  assign _zz_when_Axi4Crossbar_l808_37 = (_zz_when_Axi4Crossbar_l808_9 && (_zz_when_Axi4Crossbar_l808_13 == _zz_when_Axi4Crossbar_l808_33));
  assign _zz_when_Axi4Crossbar_l808_38 = (_zz_when_Axi4Crossbar_l808_36 || _zz_when_Axi4Crossbar_l808_37);
  always @(*) begin
    _zz_when_Axi4Crossbar_l808_39[0] = (! _zz_when_Axi4Crossbar_l808_8);
    _zz_when_Axi4Crossbar_l808_39[1] = (! _zz_when_Axi4Crossbar_l808_9);
  end

  assign _zz_when_Axi4Crossbar_l808_40 = _zz_when_Axi4Crossbar_l808_39;
  assign _zz_when_Axi4Crossbar_l808_41 = (_zz_when_Axi4Crossbar_l808_40 & (~ _zz__zz_when_Axi4Crossbar_l808_41));
  assign _zz_when_Axi4Crossbar_l808_42 = ((_zz_when_Axi4Crossbar_l808_32 && (! _zz_when_Axi4Crossbar_l808_38)) && _zz_when_Axi4Crossbar_l808_41[0]);
  assign _zz_when_Axi4Crossbar_l808_43 = (_zz_when_Axi4Crossbar_l808_32 && (_zz_when_Axi4Crossbar_l808_36 || _zz_when_Axi4Crossbar_l808_42));
  assign _zz_when_Axi4Crossbar_l808_44 = ((_zz_when_Axi4Crossbar_l808_34 && (_zz_when_Axi4Crossbar_l808_8 || _zz_when_Axi4Crossbar_l808_42)) && ((_zz_when_Axi4Crossbar_l808_42 ? _zz_when_Axi4Crossbar_l808_33 : _zz_when_Axi4Crossbar_l808_12) == _zz_when_Axi4Crossbar_l808_35));
  assign when_Axi4Crossbar_l808_2 = (_zz_when_Axi4Crossbar_l808_43 && (! _zz_when_Axi4Crossbar_l808_44));
  assign when_Axi4Crossbar_l815_2 = (_zz_when_Axi4Crossbar_l815_4 == 3'b001);
  assign when_Axi4Crossbar_l813_2 = ((! _zz_when_Axi4Crossbar_l808_43) && _zz_when_Axi4Crossbar_l808_44);
  assign _zz_when_Axi4Crossbar_l808_45 = ((_zz_when_Axi4Crossbar_l808_32 && (! _zz_when_Axi4Crossbar_l808_38)) && _zz_when_Axi4Crossbar_l808_41[1]);
  assign _zz_when_Axi4Crossbar_l808_46 = (_zz_when_Axi4Crossbar_l808_32 && (_zz_when_Axi4Crossbar_l808_37 || _zz_when_Axi4Crossbar_l808_45));
  assign _zz_when_Axi4Crossbar_l808_47 = ((_zz_when_Axi4Crossbar_l808_34 && (_zz_when_Axi4Crossbar_l808_9 || _zz_when_Axi4Crossbar_l808_45)) && ((_zz_when_Axi4Crossbar_l808_45 ? _zz_when_Axi4Crossbar_l808_33 : _zz_when_Axi4Crossbar_l808_13) == _zz_when_Axi4Crossbar_l808_35));
  assign when_Axi4Crossbar_l808_3 = (_zz_when_Axi4Crossbar_l808_46 && (! _zz_when_Axi4Crossbar_l808_47));
  assign when_Axi4Crossbar_l815_3 = (_zz_when_Axi4Crossbar_l815_5 == 3'b001);
  assign when_Axi4Crossbar_l813_3 = ((! _zz_when_Axi4Crossbar_l808_46) && _zz_when_Axi4Crossbar_l808_47);
  assign when_Axi4Crossbar_l1026 = ((io_masters_0_aw_valid && io_masters_0_aw_ready) && (! (|_zz_when_Axi4Crossbar_l1026)));
  assign _zz_when_Axi4Crossbar_l1021_2 = (((io_masters_0_w_valid && io_masters_0_w_ready) && io_masters_0_w_payload_last) && (! (|_zz_when_Axi4Crossbar_l1021)));
  assign when_Axi4Crossbar_l1021 = (when_Axi4Crossbar_l1026 && (! _zz_when_Axi4Crossbar_l1021_2));
  assign when_Axi4Crossbar_l1023 = ((! when_Axi4Crossbar_l1026) && _zz_when_Axi4Crossbar_l1021_2);
  always @(*) begin
    _zz_when_Axi4Crossbar_l728_4[0] = (io_masters_0_aw_payload_addr[31 : 16] == 16'h0);
    _zz_when_Axi4Crossbar_l728_4[1] = (io_masters_0_aw_payload_addr[31 : 16] == 16'h0001);
  end

  assign _zz_when_Axi4Crossbar_l728_5 = {(! (|_zz_when_Axi4Crossbar_l728_4)),_zz_when_Axi4Crossbar_l728_4};
  always @(*) begin
    _zz_when_Axi4Crossbar_l878_41 = 2'b00;
    if(when_Axi4Crossbar_l728_6) begin
      _zz_when_Axi4Crossbar_l878_41 = 2'b00;
    end
    if(when_Axi4Crossbar_l728_7) begin
      _zz_when_Axi4Crossbar_l878_41 = 2'b01;
    end
    if(when_Axi4Crossbar_l728_8) begin
      _zz_when_Axi4Crossbar_l878_41 = 2'b10;
    end
  end

  assign when_Axi4Crossbar_l728_6 = _zz_when_Axi4Crossbar_l728_5[0];
  assign when_Axi4Crossbar_l728_7 = _zz_when_Axi4Crossbar_l728_5[1];
  assign when_Axi4Crossbar_l728_8 = _zz_when_Axi4Crossbar_l728_5[2];
  assign _zz_when_Axi4Crossbar_l808_48 = (io_masters_1_aw_valid && io_masters_1_aw_ready);
  assign _zz_when_Axi4Crossbar_l808_49 = io_masters_1_aw_payload_id;
  always @(*) begin
    _zz_when_Axi4Crossbar_l728_6[0] = (io_masters_1_aw_payload_addr[31 : 16] == 16'h0);
    _zz_when_Axi4Crossbar_l728_6[1] = (io_masters_1_aw_payload_addr[31 : 16] == 16'h0001);
  end

  assign _zz_when_Axi4Crossbar_l728_7 = {(! (|_zz_when_Axi4Crossbar_l728_6)),_zz_when_Axi4Crossbar_l728_6};
  always @(*) begin
    _zz_when_Axi4Crossbar_l878_42 = 2'b00;
    if(when_Axi4Crossbar_l728_9) begin
      _zz_when_Axi4Crossbar_l878_42 = 2'b00;
    end
    if(when_Axi4Crossbar_l728_10) begin
      _zz_when_Axi4Crossbar_l878_42 = 2'b01;
    end
    if(when_Axi4Crossbar_l728_11) begin
      _zz_when_Axi4Crossbar_l878_42 = 2'b10;
    end
  end

  assign when_Axi4Crossbar_l728_9 = _zz_when_Axi4Crossbar_l728_7[0];
  assign when_Axi4Crossbar_l728_10 = _zz_when_Axi4Crossbar_l728_7[1];
  assign when_Axi4Crossbar_l728_11 = _zz_when_Axi4Crossbar_l728_7[2];
  assign _zz_when_Axi4Crossbar_l808_50 = (io_masters_1_b_valid && io_masters_1_b_ready);
  assign _zz_when_Axi4Crossbar_l808_51 = io_masters_1_b_payload_id;
  assign _zz_when_Axi4Crossbar_l808_52 = (_zz_when_Axi4Crossbar_l808_2 && (_zz_when_Axi4Crossbar_l808_6 == _zz_when_Axi4Crossbar_l808_49));
  assign _zz_when_Axi4Crossbar_l808_53 = (_zz_when_Axi4Crossbar_l808_3 && (_zz_when_Axi4Crossbar_l808_7 == _zz_when_Axi4Crossbar_l808_49));
  assign _zz_when_Axi4Crossbar_l808_54 = (_zz_when_Axi4Crossbar_l808_52 || _zz_when_Axi4Crossbar_l808_53);
  always @(*) begin
    _zz_when_Axi4Crossbar_l808_55[0] = (! _zz_when_Axi4Crossbar_l808_2);
    _zz_when_Axi4Crossbar_l808_55[1] = (! _zz_when_Axi4Crossbar_l808_3);
  end

  assign _zz_when_Axi4Crossbar_l808_56 = _zz_when_Axi4Crossbar_l808_55;
  assign _zz_when_Axi4Crossbar_l808_57 = (_zz_when_Axi4Crossbar_l808_56 & (~ _zz__zz_when_Axi4Crossbar_l808_57));
  assign _zz_when_Axi4Crossbar_l808_58 = ((_zz_when_Axi4Crossbar_l808_48 && (! _zz_when_Axi4Crossbar_l808_54)) && _zz_when_Axi4Crossbar_l808_57[0]);
  assign _zz_when_Axi4Crossbar_l808_59 = (_zz_when_Axi4Crossbar_l808_48 && (_zz_when_Axi4Crossbar_l808_52 || _zz_when_Axi4Crossbar_l808_58));
  assign _zz_when_Axi4Crossbar_l808_60 = ((_zz_when_Axi4Crossbar_l808_50 && (_zz_when_Axi4Crossbar_l808_2 || _zz_when_Axi4Crossbar_l808_58)) && ((_zz_when_Axi4Crossbar_l808_58 ? _zz_when_Axi4Crossbar_l808_49 : _zz_when_Axi4Crossbar_l808_6) == _zz_when_Axi4Crossbar_l808_51));
  assign when_Axi4Crossbar_l808_4 = (_zz_when_Axi4Crossbar_l808_59 && (! _zz_when_Axi4Crossbar_l808_60));
  assign when_Axi4Crossbar_l815_4 = (_zz_when_Axi4Crossbar_l815_2 == 3'b001);
  assign when_Axi4Crossbar_l813_4 = ((! _zz_when_Axi4Crossbar_l808_59) && _zz_when_Axi4Crossbar_l808_60);
  assign _zz_when_Axi4Crossbar_l808_61 = ((_zz_when_Axi4Crossbar_l808_48 && (! _zz_when_Axi4Crossbar_l808_54)) && _zz_when_Axi4Crossbar_l808_57[1]);
  assign _zz_when_Axi4Crossbar_l808_62 = (_zz_when_Axi4Crossbar_l808_48 && (_zz_when_Axi4Crossbar_l808_53 || _zz_when_Axi4Crossbar_l808_61));
  assign _zz_when_Axi4Crossbar_l808_63 = ((_zz_when_Axi4Crossbar_l808_50 && (_zz_when_Axi4Crossbar_l808_3 || _zz_when_Axi4Crossbar_l808_61)) && ((_zz_when_Axi4Crossbar_l808_61 ? _zz_when_Axi4Crossbar_l808_49 : _zz_when_Axi4Crossbar_l808_7) == _zz_when_Axi4Crossbar_l808_51));
  assign when_Axi4Crossbar_l808_5 = (_zz_when_Axi4Crossbar_l808_62 && (! _zz_when_Axi4Crossbar_l808_63));
  assign when_Axi4Crossbar_l815_5 = (_zz_when_Axi4Crossbar_l815_3 == 3'b001);
  assign when_Axi4Crossbar_l813_5 = ((! _zz_when_Axi4Crossbar_l808_62) && _zz_when_Axi4Crossbar_l808_63);
  assign _zz_when_Axi4Crossbar_l808_64 = (io_masters_1_ar_valid && io_masters_1_ar_ready);
  assign _zz_when_Axi4Crossbar_l808_65 = io_masters_1_ar_payload_id;
  always @(*) begin
    _zz_when_Axi4Crossbar_l728_8[0] = (io_masters_1_ar_payload_addr[31 : 16] == 16'h0);
    _zz_when_Axi4Crossbar_l728_8[1] = (io_masters_1_ar_payload_addr[31 : 16] == 16'h0001);
  end

  assign _zz_when_Axi4Crossbar_l728_9 = {(! (|_zz_when_Axi4Crossbar_l728_8)),_zz_when_Axi4Crossbar_l728_8};
  always @(*) begin
    _zz_when_Axi4Crossbar_l1081_22 = 2'b00;
    if(when_Axi4Crossbar_l728_12) begin
      _zz_when_Axi4Crossbar_l1081_22 = 2'b00;
    end
    if(when_Axi4Crossbar_l728_13) begin
      _zz_when_Axi4Crossbar_l1081_22 = 2'b01;
    end
    if(when_Axi4Crossbar_l728_14) begin
      _zz_when_Axi4Crossbar_l1081_22 = 2'b10;
    end
  end

  assign when_Axi4Crossbar_l728_12 = _zz_when_Axi4Crossbar_l728_9[0];
  assign when_Axi4Crossbar_l728_13 = _zz_when_Axi4Crossbar_l728_9[1];
  assign when_Axi4Crossbar_l728_14 = _zz_when_Axi4Crossbar_l728_9[2];
  assign _zz_when_Axi4Crossbar_l808_66 = ((io_masters_1_r_valid && io_masters_1_r_ready) && io_masters_1_r_payload_last);
  assign _zz_when_Axi4Crossbar_l808_67 = io_masters_1_r_payload_id;
  assign _zz_when_Axi4Crossbar_l808_68 = (_zz_when_Axi4Crossbar_l808_10 && (_zz_when_Axi4Crossbar_l808_14 == _zz_when_Axi4Crossbar_l808_65));
  assign _zz_when_Axi4Crossbar_l808_69 = (_zz_when_Axi4Crossbar_l808_11 && (_zz_when_Axi4Crossbar_l808_15 == _zz_when_Axi4Crossbar_l808_65));
  assign _zz_when_Axi4Crossbar_l808_70 = (_zz_when_Axi4Crossbar_l808_68 || _zz_when_Axi4Crossbar_l808_69);
  always @(*) begin
    _zz_when_Axi4Crossbar_l808_71[0] = (! _zz_when_Axi4Crossbar_l808_10);
    _zz_when_Axi4Crossbar_l808_71[1] = (! _zz_when_Axi4Crossbar_l808_11);
  end

  assign _zz_when_Axi4Crossbar_l808_72 = _zz_when_Axi4Crossbar_l808_71;
  assign _zz_when_Axi4Crossbar_l808_73 = (_zz_when_Axi4Crossbar_l808_72 & (~ _zz__zz_when_Axi4Crossbar_l808_73));
  assign _zz_when_Axi4Crossbar_l808_74 = ((_zz_when_Axi4Crossbar_l808_64 && (! _zz_when_Axi4Crossbar_l808_70)) && _zz_when_Axi4Crossbar_l808_73[0]);
  assign _zz_when_Axi4Crossbar_l808_75 = (_zz_when_Axi4Crossbar_l808_64 && (_zz_when_Axi4Crossbar_l808_68 || _zz_when_Axi4Crossbar_l808_74));
  assign _zz_when_Axi4Crossbar_l808_76 = ((_zz_when_Axi4Crossbar_l808_66 && (_zz_when_Axi4Crossbar_l808_10 || _zz_when_Axi4Crossbar_l808_74)) && ((_zz_when_Axi4Crossbar_l808_74 ? _zz_when_Axi4Crossbar_l808_65 : _zz_when_Axi4Crossbar_l808_14) == _zz_when_Axi4Crossbar_l808_67));
  assign when_Axi4Crossbar_l808_6 = (_zz_when_Axi4Crossbar_l808_75 && (! _zz_when_Axi4Crossbar_l808_76));
  assign when_Axi4Crossbar_l815_6 = (_zz_when_Axi4Crossbar_l815_6 == 3'b001);
  assign when_Axi4Crossbar_l813_6 = ((! _zz_when_Axi4Crossbar_l808_75) && _zz_when_Axi4Crossbar_l808_76);
  assign _zz_when_Axi4Crossbar_l808_77 = ((_zz_when_Axi4Crossbar_l808_64 && (! _zz_when_Axi4Crossbar_l808_70)) && _zz_when_Axi4Crossbar_l808_73[1]);
  assign _zz_when_Axi4Crossbar_l808_78 = (_zz_when_Axi4Crossbar_l808_64 && (_zz_when_Axi4Crossbar_l808_69 || _zz_when_Axi4Crossbar_l808_77));
  assign _zz_when_Axi4Crossbar_l808_79 = ((_zz_when_Axi4Crossbar_l808_66 && (_zz_when_Axi4Crossbar_l808_11 || _zz_when_Axi4Crossbar_l808_77)) && ((_zz_when_Axi4Crossbar_l808_77 ? _zz_when_Axi4Crossbar_l808_65 : _zz_when_Axi4Crossbar_l808_15) == _zz_when_Axi4Crossbar_l808_67));
  assign when_Axi4Crossbar_l808_7 = (_zz_when_Axi4Crossbar_l808_78 && (! _zz_when_Axi4Crossbar_l808_79));
  assign when_Axi4Crossbar_l815_7 = (_zz_when_Axi4Crossbar_l815_7 == 3'b001);
  assign when_Axi4Crossbar_l813_7 = ((! _zz_when_Axi4Crossbar_l808_78) && _zz_when_Axi4Crossbar_l808_79);
  assign when_Axi4Crossbar_l1026_1 = ((io_masters_1_aw_valid && io_masters_1_aw_ready) && (! (|_zz_when_Axi4Crossbar_l1026_1)));
  assign _zz_when_Axi4Crossbar_l1021_3 = (((io_masters_1_w_valid && io_masters_1_w_ready) && io_masters_1_w_payload_last) && (! (|_zz_when_Axi4Crossbar_l1021_1)));
  assign when_Axi4Crossbar_l1021_1 = (when_Axi4Crossbar_l1026_1 && (! _zz_when_Axi4Crossbar_l1021_3));
  assign when_Axi4Crossbar_l1023_1 = ((! when_Axi4Crossbar_l1026_1) && _zz_when_Axi4Crossbar_l1021_3);
  always @(*) begin
    _zz_when_Axi4Crossbar_l728_10[0] = (io_masters_1_aw_payload_addr[31 : 16] == 16'h0);
    _zz_when_Axi4Crossbar_l728_10[1] = (io_masters_1_aw_payload_addr[31 : 16] == 16'h0001);
  end

  assign _zz_when_Axi4Crossbar_l728_11 = {(! (|_zz_when_Axi4Crossbar_l728_10)),_zz_when_Axi4Crossbar_l728_10};
  always @(*) begin
    _zz_when_Axi4Crossbar_l878_43 = 2'b00;
    if(when_Axi4Crossbar_l728_15) begin
      _zz_when_Axi4Crossbar_l878_43 = 2'b00;
    end
    if(when_Axi4Crossbar_l728_16) begin
      _zz_when_Axi4Crossbar_l878_43 = 2'b01;
    end
    if(when_Axi4Crossbar_l728_17) begin
      _zz_when_Axi4Crossbar_l878_43 = 2'b10;
    end
  end

  assign when_Axi4Crossbar_l728_15 = _zz_when_Axi4Crossbar_l728_11[0];
  assign when_Axi4Crossbar_l728_16 = _zz_when_Axi4Crossbar_l728_11[1];
  assign when_Axi4Crossbar_l728_17 = _zz_when_Axi4Crossbar_l728_11[2];
  always @(*) begin
    _zz_respLockOH[0] = (io_slaves_0_b_valid && (_zz__zz_respLockOH == 1'b0));
    _zz_respLockOH[1] = (io_slaves_1_b_valid && (_zz__zz_respLockOH_1 == 1'b0));
    _zz_respLockOH[2] = (decErr_io_axi_b_valid && (_zz__zz_respLockOH_2 == 1'b0));
  end

  assign _zz_respLockOH_1 = _zz_respLockOH;
  assign _zz_respLockOH_2 = (respLock ? respLockOH : (_zz_respLockOH_1 & (~ _zz__zz_respLockOH_2_1)));
  assign when_Axi4Crossbar_l311 = ((|_zz_respLockOH_2) && (! io_masters_0_b_ready));
  assign when_Axi4Crossbar_l1045 = _zz_respLockOH_2[0];
  assign when_Axi4Crossbar_l1045_1 = _zz_respLockOH_2[1];
  assign when_Axi4Crossbar_l1045_2 = _zz_respLockOH_2[2];
  always @(*) begin
    _zz_respLockOH_3[0] = (io_slaves_0_b_valid && (_zz__zz_respLockOH_3 == 1'b1));
    _zz_respLockOH_3[1] = (io_slaves_1_b_valid && (_zz__zz_respLockOH_3_1 == 1'b1));
    _zz_respLockOH_3[2] = (decErr_io_axi_b_valid && (_zz__zz_respLockOH_3_2 == 1'b1));
  end

  assign _zz_respLockOH_4 = _zz_respLockOH_3;
  assign _zz_respLockOH_5 = (respLock_1 ? respLockOH_1 : (_zz_respLockOH_4 & (~ _zz__zz_respLockOH_5)));
  assign when_Axi4Crossbar_l311_1 = ((|_zz_respLockOH_5) && (! io_masters_1_b_ready));
  assign when_Axi4Crossbar_l1045_3 = _zz_respLockOH_5[0];
  assign when_Axi4Crossbar_l1045_4 = _zz_respLockOH_5[1];
  assign when_Axi4Crossbar_l1045_5 = _zz_respLockOH_5[2];
  always @(*) begin
    _zz_when_Axi4Crossbar_l1081_24[0] = (io_masters_0_ar_payload_addr[31 : 16] == 16'h0);
    _zz_when_Axi4Crossbar_l1081_24[1] = (io_masters_0_ar_payload_addr[31 : 16] == 16'h0001);
  end

  always @(*) begin
    _zz_when_Axi4Crossbar_l1081_23[0] = ((io_masters_0_ar_valid && _zz__zz_when_Axi4Crossbar_l1081_23[0]) && _zz_when_Axi4Crossbar_l1081_7[0]);
    _zz_when_Axi4Crossbar_l1081_23[1] = ((io_masters_1_ar_valid && _zz__zz_when_Axi4Crossbar_l1081_23_1[0]) && _zz_when_Axi4Crossbar_l1081_8[0]);
  end

  always @(*) begin
    _zz_when_Axi4Crossbar_l1081_25[0] = (io_masters_1_ar_payload_addr[31 : 16] == 16'h0);
    _zz_when_Axi4Crossbar_l1081_25[1] = (io_masters_1_ar_payload_addr[31 : 16] == 16'h0001);
  end

  always @(*) begin
    _zz_when_Axi4Crossbar_l340_15[0] = (rdRrPtr_0 <= 1'b0);
    _zz_when_Axi4Crossbar_l340_15[1] = (rdRrPtr_0 <= 1'b1);
  end

  assign _zz_when_Axi4Crossbar_l340_16 = (_zz_when_Axi4Crossbar_l1081_23 & _zz_when_Axi4Crossbar_l340_15);
  assign _zz_when_Axi4Crossbar_l340_17 = _zz_when_Axi4Crossbar_l340_16;
  assign _zz_when_Axi4Crossbar_l340_18 = _zz_when_Axi4Crossbar_l1081_23;
  assign _zz_when_Axi4Crossbar_l340_19 = ((|_zz_when_Axi4Crossbar_l340_16) ? (_zz_when_Axi4Crossbar_l340_17 & (~ _zz__zz_when_Axi4Crossbar_l340_19)) : (_zz_when_Axi4Crossbar_l340_18 & (~ _zz__zz_when_Axi4Crossbar_l340_19_1)));
  always @(*) begin
    _zz_io_slaves_0_ar_payload_id = 1'b0;
    if(when_Axi4Crossbar_l340_6) begin
      _zz_io_slaves_0_ar_payload_id = 1'b0;
    end
    if(when_Axi4Crossbar_l340_7) begin
      _zz_io_slaves_0_ar_payload_id = 1'b1;
    end
  end

  assign when_Axi4Crossbar_l340_6 = _zz_when_Axi4Crossbar_l340_19[0];
  assign when_Axi4Crossbar_l340_7 = _zz_when_Axi4Crossbar_l340_19[1];
  assign _zz_io_slaves_0_ar_payload_id_1 = (grantLock_3 ? grantLockIdx_3 : _zz_io_slaves_0_ar_payload_id);
  assign when_Axi4Crossbar_l269_3 = (io_slaves_0_ar_valid && (! io_slaves_0_ar_ready));
  assign when_Axi4Crossbar_l1081 = ((_zz_when_Axi4Crossbar_l1081 < 3'b100) && (|_zz_when_Axi4Crossbar_l1081_23));
  assign when_Axi4Crossbar_l1084 = (_zz_io_slaves_0_ar_payload_id_1 == 1'b0);
  assign when_Axi4Crossbar_l1084_1 = (_zz_io_slaves_0_ar_payload_id_1 == 1'b1);
  assign io_slaves_0_ar_fire = (io_slaves_0_ar_valid && io_slaves_0_ar_ready);
  assign io_slaves_0_r_fire = (io_slaves_0_r_valid && io_slaves_0_r_ready);
  assign _zz_when_Axi4Crossbar_l1102 = (io_slaves_0_r_fire && io_slaves_0_r_payload_last);
  assign when_Axi4Crossbar_l1102 = (io_slaves_0_ar_fire && (! _zz_when_Axi4Crossbar_l1102));
  assign when_Axi4Crossbar_l1104 = ((! io_slaves_0_ar_fire) && _zz_when_Axi4Crossbar_l1102);
  always @(*) begin
    _zz_when_Axi4Crossbar_l1081_27[0] = (io_masters_0_ar_payload_addr[31 : 16] == 16'h0);
    _zz_when_Axi4Crossbar_l1081_27[1] = (io_masters_0_ar_payload_addr[31 : 16] == 16'h0001);
  end

  always @(*) begin
    _zz_when_Axi4Crossbar_l1081_26[0] = ((io_masters_0_ar_valid && _zz__zz_when_Axi4Crossbar_l1081_26[1]) && _zz_when_Axi4Crossbar_l1081_7[1]);
    _zz_when_Axi4Crossbar_l1081_26[1] = ((io_masters_1_ar_valid && _zz__zz_when_Axi4Crossbar_l1081_26_1[1]) && _zz_when_Axi4Crossbar_l1081_8[1]);
  end

  always @(*) begin
    _zz_when_Axi4Crossbar_l1081_28[0] = (io_masters_1_ar_payload_addr[31 : 16] == 16'h0);
    _zz_when_Axi4Crossbar_l1081_28[1] = (io_masters_1_ar_payload_addr[31 : 16] == 16'h0001);
  end

  always @(*) begin
    _zz_when_Axi4Crossbar_l340_20[0] = (rdRrPtr_1 <= 1'b0);
    _zz_when_Axi4Crossbar_l340_20[1] = (rdRrPtr_1 <= 1'b1);
  end

  assign _zz_when_Axi4Crossbar_l340_21 = (_zz_when_Axi4Crossbar_l1081_26 & _zz_when_Axi4Crossbar_l340_20);
  assign _zz_when_Axi4Crossbar_l340_22 = _zz_when_Axi4Crossbar_l340_21;
  assign _zz_when_Axi4Crossbar_l340_23 = _zz_when_Axi4Crossbar_l1081_26;
  assign _zz_when_Axi4Crossbar_l340_24 = ((|_zz_when_Axi4Crossbar_l340_21) ? (_zz_when_Axi4Crossbar_l340_22 & (~ _zz__zz_when_Axi4Crossbar_l340_24)) : (_zz_when_Axi4Crossbar_l340_23 & (~ _zz__zz_when_Axi4Crossbar_l340_24_1)));
  always @(*) begin
    _zz_io_slaves_1_ar_payload_id = 1'b0;
    if(when_Axi4Crossbar_l340_8) begin
      _zz_io_slaves_1_ar_payload_id = 1'b0;
    end
    if(when_Axi4Crossbar_l340_9) begin
      _zz_io_slaves_1_ar_payload_id = 1'b1;
    end
  end

  assign when_Axi4Crossbar_l340_8 = _zz_when_Axi4Crossbar_l340_24[0];
  assign when_Axi4Crossbar_l340_9 = _zz_when_Axi4Crossbar_l340_24[1];
  assign _zz_io_slaves_1_ar_payload_id_1 = (grantLock_4 ? grantLockIdx_4 : _zz_io_slaves_1_ar_payload_id);
  assign when_Axi4Crossbar_l269_4 = (io_slaves_1_ar_valid && (! io_slaves_1_ar_ready));
  assign when_Axi4Crossbar_l1081_1 = ((_zz_when_Axi4Crossbar_l1081_1 < 3'b100) && (|_zz_when_Axi4Crossbar_l1081_26));
  assign when_Axi4Crossbar_l1084_2 = (_zz_io_slaves_1_ar_payload_id_1 == 1'b0);
  assign when_Axi4Crossbar_l1084_3 = (_zz_io_slaves_1_ar_payload_id_1 == 1'b1);
  assign io_slaves_1_ar_fire = (io_slaves_1_ar_valid && io_slaves_1_ar_ready);
  assign io_slaves_1_r_fire = (io_slaves_1_r_valid && io_slaves_1_r_ready);
  assign _zz_when_Axi4Crossbar_l1102_1 = (io_slaves_1_r_fire && io_slaves_1_r_payload_last);
  assign when_Axi4Crossbar_l1102_1 = (io_slaves_1_ar_fire && (! _zz_when_Axi4Crossbar_l1102_1));
  assign when_Axi4Crossbar_l1104_1 = ((! io_slaves_1_ar_fire) && _zz_when_Axi4Crossbar_l1102_1);
  always @(*) begin
    _zz_when_Axi4Crossbar_l1081_30[0] = (io_masters_0_ar_payload_addr[31 : 16] == 16'h0);
    _zz_when_Axi4Crossbar_l1081_30[1] = (io_masters_0_ar_payload_addr[31 : 16] == 16'h0001);
  end

  always @(*) begin
    _zz_when_Axi4Crossbar_l1081_29[0] = ((io_masters_0_ar_valid && _zz__zz_when_Axi4Crossbar_l1081_29[2]) && _zz_when_Axi4Crossbar_l1081_7[2]);
    _zz_when_Axi4Crossbar_l1081_29[1] = ((io_masters_1_ar_valid && _zz__zz_when_Axi4Crossbar_l1081_29_1[2]) && _zz_when_Axi4Crossbar_l1081_8[2]);
  end

  always @(*) begin
    _zz_when_Axi4Crossbar_l1081_31[0] = (io_masters_1_ar_payload_addr[31 : 16] == 16'h0);
    _zz_when_Axi4Crossbar_l1081_31[1] = (io_masters_1_ar_payload_addr[31 : 16] == 16'h0001);
  end

  always @(*) begin
    _zz_when_Axi4Crossbar_l340_25[0] = (rdRrPtr_2 <= 1'b0);
    _zz_when_Axi4Crossbar_l340_25[1] = (rdRrPtr_2 <= 1'b1);
  end

  assign _zz_when_Axi4Crossbar_l340_26 = (_zz_when_Axi4Crossbar_l1081_29 & _zz_when_Axi4Crossbar_l340_25);
  assign _zz_when_Axi4Crossbar_l340_27 = _zz_when_Axi4Crossbar_l340_26;
  assign _zz_when_Axi4Crossbar_l340_28 = _zz_when_Axi4Crossbar_l1081_29;
  assign _zz_when_Axi4Crossbar_l340_29 = ((|_zz_when_Axi4Crossbar_l340_26) ? (_zz_when_Axi4Crossbar_l340_27 & (~ _zz__zz_when_Axi4Crossbar_l340_29)) : (_zz_when_Axi4Crossbar_l340_28 & (~ _zz__zz_when_Axi4Crossbar_l340_29_1)));
  always @(*) begin
    _zz_rdRrPtr_2 = 1'b0;
    if(when_Axi4Crossbar_l340_10) begin
      _zz_rdRrPtr_2 = 1'b0;
    end
    if(when_Axi4Crossbar_l340_11) begin
      _zz_rdRrPtr_2 = 1'b1;
    end
  end

  assign when_Axi4Crossbar_l340_10 = _zz_when_Axi4Crossbar_l340_29[0];
  assign when_Axi4Crossbar_l340_11 = _zz_when_Axi4Crossbar_l340_29[1];
  assign _zz_rdRrPtr_2_1 = (grantLock_5 ? grantLockIdx_5 : _zz_rdRrPtr_2);
  assign when_Axi4Crossbar_l269_5 = (decErr_io_axi_ar_valid && (! decErr_io_axi_ar_ready));
  assign when_Axi4Crossbar_l1081_2 = ((_zz_when_Axi4Crossbar_l1081_2 < 3'b100) && (|_zz_when_Axi4Crossbar_l1081_29));
  assign when_Axi4Crossbar_l1084_4 = (_zz_rdRrPtr_2_1 == 1'b0);
  assign when_Axi4Crossbar_l1084_5 = (_zz_rdRrPtr_2_1 == 1'b1);
  assign decErr_io_axi_ar_fire = (decErr_io_axi_ar_valid && decErr_io_axi_ar_ready);
  assign decErr_io_axi_r_fire = (decErr_io_axi_r_valid && decErr_io_axi_r_ready);
  assign _zz_when_Axi4Crossbar_l1102_2 = (decErr_io_axi_r_fire && decErr_io_axi_r_payload_last);
  assign when_Axi4Crossbar_l1102_2 = (decErr_io_axi_ar_fire && (! _zz_when_Axi4Crossbar_l1102_2));
  assign when_Axi4Crossbar_l1104_2 = ((! decErr_io_axi_ar_fire) && _zz_when_Axi4Crossbar_l1102_2);
  always @(*) begin
    _zz_respLockOH_6[0] = (io_slaves_0_r_valid && (_zz__zz_respLockOH_6 == 1'b0));
    _zz_respLockOH_6[1] = (io_slaves_1_r_valid && (_zz__zz_respLockOH_6_1 == 1'b0));
    _zz_respLockOH_6[2] = (decErr_io_axi_r_valid && (_zz__zz_respLockOH_6_2 == 1'b0));
  end

  assign _zz_respLockOH_7 = _zz_respLockOH_6;
  assign _zz_respLockOH_8 = (respLock_2 ? respLockOH_2 : (_zz_respLockOH_7 & (~ _zz__zz_respLockOH_8)));
  assign when_Axi4Crossbar_l311_2 = ((|_zz_respLockOH_8) && (! (io_masters_0_r_ready && (((_zz_respLockOH_8[0] && io_slaves_0_r_payload_last) || (_zz_respLockOH_8[1] && io_slaves_1_r_payload_last)) || (_zz_respLockOH_8[2] && decErr_io_axi_r_payload_last)))));
  assign when_Axi4Crossbar_l1128 = _zz_respLockOH_8[0];
  assign when_Axi4Crossbar_l1128_1 = _zz_respLockOH_8[1];
  assign when_Axi4Crossbar_l1128_2 = _zz_respLockOH_8[2];
  always @(*) begin
    _zz_respLockOH_9[0] = (io_slaves_0_r_valid && (_zz__zz_respLockOH_9 == 1'b1));
    _zz_respLockOH_9[1] = (io_slaves_1_r_valid && (_zz__zz_respLockOH_9_1 == 1'b1));
    _zz_respLockOH_9[2] = (decErr_io_axi_r_valid && (_zz__zz_respLockOH_9_2 == 1'b1));
  end

  assign _zz_respLockOH_10 = _zz_respLockOH_9;
  assign _zz_respLockOH_11 = (respLock_3 ? respLockOH_3 : (_zz_respLockOH_10 & (~ _zz__zz_respLockOH_11)));
  assign when_Axi4Crossbar_l311_3 = ((|_zz_respLockOH_11) && (! (io_masters_1_r_ready && (((_zz_respLockOH_11[0] && io_slaves_0_r_payload_last) || (_zz_respLockOH_11[1] && io_slaves_1_r_payload_last)) || (_zz_respLockOH_11[2] && decErr_io_axi_r_payload_last)))));
  assign when_Axi4Crossbar_l1128_3 = _zz_respLockOH_11[0];
  assign when_Axi4Crossbar_l1128_4 = _zz_respLockOH_11[1];
  assign when_Axi4Crossbar_l1128_5 = _zz_respLockOH_11[2];
  always @(posedge clk) begin
    if(!resetn) begin
      wrRrPtr_0 <= 1'b0;
      wrRrPtr_1 <= 1'b0;
      wrRrPtr_2 <= 1'b0;
      rdRrPtr_0 <= 1'b0;
      rdRrPtr_1 <= 1'b0;
      rdRrPtr_2 <= 1'b0;
      _zz_when_Axi4Crossbar_l878 <= 3'b000;
      _zz_when_Axi4Crossbar_l878_1 <= 3'b000;
      _zz_when_Axi4Crossbar_l878_2 <= 3'b000;
      _zz_7 <= 2'b00;
      _zz_8 <= 2'b00;
      _zz_9 <= 2'b00;
      _zz_when_Axi4Crossbar_l942 <= 2'b00;
      _zz_when_Axi4Crossbar_l942_1 <= 2'b00;
      _zz_when_Axi4Crossbar_l942_2 <= 2'b00;
      _zz_when_Axi4Crossbar_l895 <= 3'b000;
      _zz_when_Axi4Crossbar_l895_1 <= 3'b000;
      _zz_when_Axi4Crossbar_l895_2 <= 3'b000;
      _zz_when_Axi4Crossbar_l1081 <= 3'b000;
      _zz_when_Axi4Crossbar_l1081_1 <= 3'b000;
      _zz_when_Axi4Crossbar_l1081_2 <= 3'b000;
      _zz_when_Axi4Crossbar_l808 <= 1'b0;
      _zz_when_Axi4Crossbar_l808_1 <= 1'b0;
      _zz_when_Axi4Crossbar_l808_2 <= 1'b0;
      _zz_when_Axi4Crossbar_l808_3 <= 1'b0;
      _zz_when_Axi4Crossbar_l808_4 <= 4'b0000;
      _zz_when_Axi4Crossbar_l808_5 <= 4'b0000;
      _zz_when_Axi4Crossbar_l808_6 <= 4'b0000;
      _zz_when_Axi4Crossbar_l808_7 <= 4'b0000;
      _zz_when_Axi4Crossbar_l878_3 <= 2'b00;
      _zz_when_Axi4Crossbar_l878_4 <= 2'b00;
      _zz_when_Axi4Crossbar_l878_5 <= 2'b00;
      _zz_when_Axi4Crossbar_l878_6 <= 2'b00;
      _zz_when_Axi4Crossbar_l815 <= 3'b000;
      _zz_when_Axi4Crossbar_l815_1 <= 3'b000;
      _zz_when_Axi4Crossbar_l815_2 <= 3'b000;
      _zz_when_Axi4Crossbar_l815_3 <= 3'b000;
      _zz_when_Axi4Crossbar_l808_8 <= 1'b0;
      _zz_when_Axi4Crossbar_l808_9 <= 1'b0;
      _zz_when_Axi4Crossbar_l808_10 <= 1'b0;
      _zz_when_Axi4Crossbar_l808_11 <= 1'b0;
      _zz_when_Axi4Crossbar_l808_12 <= 4'b0000;
      _zz_when_Axi4Crossbar_l808_13 <= 4'b0000;
      _zz_when_Axi4Crossbar_l808_14 <= 4'b0000;
      _zz_when_Axi4Crossbar_l808_15 <= 4'b0000;
      _zz_when_Axi4Crossbar_l1081_3 <= 2'b00;
      _zz_when_Axi4Crossbar_l1081_4 <= 2'b00;
      _zz_when_Axi4Crossbar_l1081_5 <= 2'b00;
      _zz_when_Axi4Crossbar_l1081_6 <= 2'b00;
      _zz_when_Axi4Crossbar_l815_4 <= 3'b000;
      _zz_when_Axi4Crossbar_l815_5 <= 3'b000;
      _zz_when_Axi4Crossbar_l815_6 <= 3'b000;
      _zz_when_Axi4Crossbar_l815_7 <= 3'b000;
      _zz_when_Axi4Crossbar_l878_7 <= 3'b000;
      _zz_when_Axi4Crossbar_l878_8 <= 3'b000;
      _zz_when_Axi4Crossbar_l878_9 <= 2'b00;
      _zz_when_Axi4Crossbar_l878_10 <= 2'b00;
      grantLock <= 1'b0;
      grantLockIdx <= 1'b0;
      _zz_when_Axi4Crossbar_l895_4 <= 1'b0;
      grantLock_1 <= 1'b0;
      grantLockIdx_1 <= 1'b0;
      _zz_when_Axi4Crossbar_l895_6 <= 1'b0;
      grantLock_2 <= 1'b0;
      grantLockIdx_2 <= 1'b0;
      _zz_when_Axi4Crossbar_l895_8 <= 1'b0;
      respLock <= 1'b0;
      respLockOH <= 3'b000;
      respLock_1 <= 1'b0;
      respLockOH_1 <= 3'b000;
      grantLock_3 <= 1'b0;
      grantLockIdx_3 <= 1'b0;
      grantLock_4 <= 1'b0;
      grantLockIdx_4 <= 1'b0;
      grantLock_5 <= 1'b0;
      grantLockIdx_5 <= 1'b0;
      respLock_2 <= 1'b0;
      respLockOH_2 <= 3'b000;
      respLock_3 <= 1'b0;
      respLockOH_3 <= 3'b000;
    end else begin
      if(when_Axi4Crossbar_l269) begin
        grantLock <= 1'b1;
        grantLockIdx <= _zz_io_slaves_0_aw_payload_id_1;
      end else begin
        grantLock <= 1'b0;
      end
      if(io_slaves_0_aw_fire) begin
        _zz_when_Axi4Crossbar_l895_4 <= 1'b0;
      end else begin
        if(when_Axi4Crossbar_l914) begin
          _zz_when_Axi4Crossbar_l895_4 <= 1'b1;
        end
      end
      if(when_Axi4Crossbar_l926) begin
        _zz_7 <= ((_zz_7 == 2'b11) ? 2'b00 : _zz__zz_7);
      end
      if(io_slaves_0_aw_fire) begin
        wrRrPtr_0 <= (_zz_io_slaves_0_aw_payload_id_1 + 1'b1);
      end
      if(when_Axi4Crossbar_l953) begin
        _zz_when_Axi4Crossbar_l942 <= ((_zz_when_Axi4Crossbar_l942 == 2'b11) ? 2'b00 : _zz__zz_when_Axi4Crossbar_l942);
      end
      if(when_Axi4Crossbar_l959) begin
        _zz_when_Axi4Crossbar_l895 <= (_zz_when_Axi4Crossbar_l895 + 3'b001);
      end else begin
        if(when_Axi4Crossbar_l961) begin
          _zz_when_Axi4Crossbar_l895 <= (_zz_when_Axi4Crossbar_l895 - 3'b001);
        end
      end
      if(when_Axi4Crossbar_l968) begin
        _zz_when_Axi4Crossbar_l878 <= (_zz_when_Axi4Crossbar_l878 + 3'b001);
      end else begin
        if(when_Axi4Crossbar_l970) begin
          _zz_when_Axi4Crossbar_l878 <= (_zz_when_Axi4Crossbar_l878 - 3'b001);
        end
      end
      if(when_Axi4Crossbar_l269_1) begin
        grantLock_1 <= 1'b1;
        grantLockIdx_1 <= _zz_io_slaves_1_aw_payload_id_1;
      end else begin
        grantLock_1 <= 1'b0;
      end
      if(io_slaves_1_aw_fire) begin
        _zz_when_Axi4Crossbar_l895_6 <= 1'b0;
      end else begin
        if(when_Axi4Crossbar_l914_1) begin
          _zz_when_Axi4Crossbar_l895_6 <= 1'b1;
        end
      end
      if(when_Axi4Crossbar_l926_1) begin
        _zz_8 <= ((_zz_8 == 2'b11) ? 2'b00 : _zz__zz_8);
      end
      if(io_slaves_1_aw_fire) begin
        wrRrPtr_1 <= (_zz_io_slaves_1_aw_payload_id_1 + 1'b1);
      end
      if(when_Axi4Crossbar_l953_1) begin
        _zz_when_Axi4Crossbar_l942_1 <= ((_zz_when_Axi4Crossbar_l942_1 == 2'b11) ? 2'b00 : _zz__zz_when_Axi4Crossbar_l942_1);
      end
      if(when_Axi4Crossbar_l959_1) begin
        _zz_when_Axi4Crossbar_l895_1 <= (_zz_when_Axi4Crossbar_l895_1 + 3'b001);
      end else begin
        if(when_Axi4Crossbar_l961_1) begin
          _zz_when_Axi4Crossbar_l895_1 <= (_zz_when_Axi4Crossbar_l895_1 - 3'b001);
        end
      end
      if(when_Axi4Crossbar_l968_1) begin
        _zz_when_Axi4Crossbar_l878_1 <= (_zz_when_Axi4Crossbar_l878_1 + 3'b001);
      end else begin
        if(when_Axi4Crossbar_l970_1) begin
          _zz_when_Axi4Crossbar_l878_1 <= (_zz_when_Axi4Crossbar_l878_1 - 3'b001);
        end
      end
      if(when_Axi4Crossbar_l269_2) begin
        grantLock_2 <= 1'b1;
        grantLockIdx_2 <= _zz_wrRrPtr_2_1;
      end else begin
        grantLock_2 <= 1'b0;
      end
      if(decErr_io_axi_aw_fire) begin
        _zz_when_Axi4Crossbar_l895_8 <= 1'b0;
      end else begin
        if(when_Axi4Crossbar_l914_2) begin
          _zz_when_Axi4Crossbar_l895_8 <= 1'b1;
        end
      end
      if(when_Axi4Crossbar_l926_2) begin
        _zz_9 <= ((_zz_9 == 2'b11) ? 2'b00 : _zz__zz_9);
      end
      if(decErr_io_axi_aw_fire) begin
        wrRrPtr_2 <= (_zz_wrRrPtr_2_1 + 1'b1);
      end
      if(when_Axi4Crossbar_l953_2) begin
        _zz_when_Axi4Crossbar_l942_2 <= ((_zz_when_Axi4Crossbar_l942_2 == 2'b11) ? 2'b00 : _zz__zz_when_Axi4Crossbar_l942_2);
      end
      if(when_Axi4Crossbar_l959_2) begin
        _zz_when_Axi4Crossbar_l895_2 <= (_zz_when_Axi4Crossbar_l895_2 + 3'b001);
      end else begin
        if(when_Axi4Crossbar_l961_2) begin
          _zz_when_Axi4Crossbar_l895_2 <= (_zz_when_Axi4Crossbar_l895_2 - 3'b001);
        end
      end
      if(when_Axi4Crossbar_l968_2) begin
        _zz_when_Axi4Crossbar_l878_2 <= (_zz_when_Axi4Crossbar_l878_2 + 3'b001);
      end else begin
        if(when_Axi4Crossbar_l970_2) begin
          _zz_when_Axi4Crossbar_l878_2 <= (_zz_when_Axi4Crossbar_l878_2 - 3'b001);
        end
      end
      if(when_Axi4Crossbar_l808) begin
        _zz_when_Axi4Crossbar_l808 <= 1'b1;
        _zz_when_Axi4Crossbar_l808_4 <= _zz_when_Axi4Crossbar_l808_17;
        _zz_when_Axi4Crossbar_l878_3 <= _zz_when_Axi4Crossbar_l878_40;
        _zz_when_Axi4Crossbar_l815 <= (_zz_when_Axi4Crossbar_l815 + 3'b001);
      end else begin
        if(when_Axi4Crossbar_l813) begin
          _zz_when_Axi4Crossbar_l815 <= (_zz_when_Axi4Crossbar_l815 - 3'b001);
          if(when_Axi4Crossbar_l815) begin
            _zz_when_Axi4Crossbar_l808 <= 1'b0;
          end
        end
      end
      if(when_Axi4Crossbar_l808_1) begin
        _zz_when_Axi4Crossbar_l808_1 <= 1'b1;
        _zz_when_Axi4Crossbar_l808_5 <= _zz_when_Axi4Crossbar_l808_17;
        _zz_when_Axi4Crossbar_l878_4 <= _zz_when_Axi4Crossbar_l878_40;
        _zz_when_Axi4Crossbar_l815_1 <= (_zz_when_Axi4Crossbar_l815_1 + 3'b001);
      end else begin
        if(when_Axi4Crossbar_l813_1) begin
          _zz_when_Axi4Crossbar_l815_1 <= (_zz_when_Axi4Crossbar_l815_1 - 3'b001);
          if(when_Axi4Crossbar_l815_1) begin
            _zz_when_Axi4Crossbar_l808_1 <= 1'b0;
          end
        end
      end
      if(when_Axi4Crossbar_l808_2) begin
        _zz_when_Axi4Crossbar_l808_8 <= 1'b1;
        _zz_when_Axi4Crossbar_l808_12 <= _zz_when_Axi4Crossbar_l808_33;
        _zz_when_Axi4Crossbar_l1081_3 <= _zz_when_Axi4Crossbar_l1081_21;
        _zz_when_Axi4Crossbar_l815_4 <= (_zz_when_Axi4Crossbar_l815_4 + 3'b001);
      end else begin
        if(when_Axi4Crossbar_l813_2) begin
          _zz_when_Axi4Crossbar_l815_4 <= (_zz_when_Axi4Crossbar_l815_4 - 3'b001);
          if(when_Axi4Crossbar_l815_2) begin
            _zz_when_Axi4Crossbar_l808_8 <= 1'b0;
          end
        end
      end
      if(when_Axi4Crossbar_l808_3) begin
        _zz_when_Axi4Crossbar_l808_9 <= 1'b1;
        _zz_when_Axi4Crossbar_l808_13 <= _zz_when_Axi4Crossbar_l808_33;
        _zz_when_Axi4Crossbar_l1081_4 <= _zz_when_Axi4Crossbar_l1081_21;
        _zz_when_Axi4Crossbar_l815_5 <= (_zz_when_Axi4Crossbar_l815_5 + 3'b001);
      end else begin
        if(when_Axi4Crossbar_l813_3) begin
          _zz_when_Axi4Crossbar_l815_5 <= (_zz_when_Axi4Crossbar_l815_5 - 3'b001);
          if(when_Axi4Crossbar_l815_3) begin
            _zz_when_Axi4Crossbar_l808_9 <= 1'b0;
          end
        end
      end
      if(when_Axi4Crossbar_l1021) begin
        _zz_when_Axi4Crossbar_l878_7 <= (_zz_when_Axi4Crossbar_l878_7 + 3'b001);
      end else begin
        if(when_Axi4Crossbar_l1023) begin
          _zz_when_Axi4Crossbar_l878_7 <= (_zz_when_Axi4Crossbar_l878_7 - 3'b001);
        end
      end
      if(when_Axi4Crossbar_l1026) begin
        _zz_when_Axi4Crossbar_l878_9 <= _zz_when_Axi4Crossbar_l878_41;
      end
      if(when_Axi4Crossbar_l808_4) begin
        _zz_when_Axi4Crossbar_l808_2 <= 1'b1;
        _zz_when_Axi4Crossbar_l808_6 <= _zz_when_Axi4Crossbar_l808_49;
        _zz_when_Axi4Crossbar_l878_5 <= _zz_when_Axi4Crossbar_l878_42;
        _zz_when_Axi4Crossbar_l815_2 <= (_zz_when_Axi4Crossbar_l815_2 + 3'b001);
      end else begin
        if(when_Axi4Crossbar_l813_4) begin
          _zz_when_Axi4Crossbar_l815_2 <= (_zz_when_Axi4Crossbar_l815_2 - 3'b001);
          if(when_Axi4Crossbar_l815_4) begin
            _zz_when_Axi4Crossbar_l808_2 <= 1'b0;
          end
        end
      end
      if(when_Axi4Crossbar_l808_5) begin
        _zz_when_Axi4Crossbar_l808_3 <= 1'b1;
        _zz_when_Axi4Crossbar_l808_7 <= _zz_when_Axi4Crossbar_l808_49;
        _zz_when_Axi4Crossbar_l878_6 <= _zz_when_Axi4Crossbar_l878_42;
        _zz_when_Axi4Crossbar_l815_3 <= (_zz_when_Axi4Crossbar_l815_3 + 3'b001);
      end else begin
        if(when_Axi4Crossbar_l813_5) begin
          _zz_when_Axi4Crossbar_l815_3 <= (_zz_when_Axi4Crossbar_l815_3 - 3'b001);
          if(when_Axi4Crossbar_l815_5) begin
            _zz_when_Axi4Crossbar_l808_3 <= 1'b0;
          end
        end
      end
      if(when_Axi4Crossbar_l808_6) begin
        _zz_when_Axi4Crossbar_l808_10 <= 1'b1;
        _zz_when_Axi4Crossbar_l808_14 <= _zz_when_Axi4Crossbar_l808_65;
        _zz_when_Axi4Crossbar_l1081_5 <= _zz_when_Axi4Crossbar_l1081_22;
        _zz_when_Axi4Crossbar_l815_6 <= (_zz_when_Axi4Crossbar_l815_6 + 3'b001);
      end else begin
        if(when_Axi4Crossbar_l813_6) begin
          _zz_when_Axi4Crossbar_l815_6 <= (_zz_when_Axi4Crossbar_l815_6 - 3'b001);
          if(when_Axi4Crossbar_l815_6) begin
            _zz_when_Axi4Crossbar_l808_10 <= 1'b0;
          end
        end
      end
      if(when_Axi4Crossbar_l808_7) begin
        _zz_when_Axi4Crossbar_l808_11 <= 1'b1;
        _zz_when_Axi4Crossbar_l808_15 <= _zz_when_Axi4Crossbar_l808_65;
        _zz_when_Axi4Crossbar_l1081_6 <= _zz_when_Axi4Crossbar_l1081_22;
        _zz_when_Axi4Crossbar_l815_7 <= (_zz_when_Axi4Crossbar_l815_7 + 3'b001);
      end else begin
        if(when_Axi4Crossbar_l813_7) begin
          _zz_when_Axi4Crossbar_l815_7 <= (_zz_when_Axi4Crossbar_l815_7 - 3'b001);
          if(when_Axi4Crossbar_l815_7) begin
            _zz_when_Axi4Crossbar_l808_11 <= 1'b0;
          end
        end
      end
      if(when_Axi4Crossbar_l1021_1) begin
        _zz_when_Axi4Crossbar_l878_8 <= (_zz_when_Axi4Crossbar_l878_8 + 3'b001);
      end else begin
        if(when_Axi4Crossbar_l1023_1) begin
          _zz_when_Axi4Crossbar_l878_8 <= (_zz_when_Axi4Crossbar_l878_8 - 3'b001);
        end
      end
      if(when_Axi4Crossbar_l1026_1) begin
        _zz_when_Axi4Crossbar_l878_10 <= _zz_when_Axi4Crossbar_l878_43;
      end
      if(when_Axi4Crossbar_l311) begin
        respLock <= 1'b1;
        respLockOH <= _zz_respLockOH_2;
      end else begin
        respLock <= 1'b0;
      end
      if(when_Axi4Crossbar_l311_1) begin
        respLock_1 <= 1'b1;
        respLockOH_1 <= _zz_respLockOH_5;
      end else begin
        respLock_1 <= 1'b0;
      end
      if(when_Axi4Crossbar_l269_3) begin
        grantLock_3 <= 1'b1;
        grantLockIdx_3 <= _zz_io_slaves_0_ar_payload_id_1;
      end else begin
        grantLock_3 <= 1'b0;
      end
      if(io_slaves_0_ar_fire) begin
        rdRrPtr_0 <= (_zz_io_slaves_0_ar_payload_id_1 + 1'b1);
      end
      if(when_Axi4Crossbar_l1102) begin
        _zz_when_Axi4Crossbar_l1081 <= (_zz_when_Axi4Crossbar_l1081 + 3'b001);
      end else begin
        if(when_Axi4Crossbar_l1104) begin
          _zz_when_Axi4Crossbar_l1081 <= (_zz_when_Axi4Crossbar_l1081 - 3'b001);
        end
      end
      if(when_Axi4Crossbar_l269_4) begin
        grantLock_4 <= 1'b1;
        grantLockIdx_4 <= _zz_io_slaves_1_ar_payload_id_1;
      end else begin
        grantLock_4 <= 1'b0;
      end
      if(io_slaves_1_ar_fire) begin
        rdRrPtr_1 <= (_zz_io_slaves_1_ar_payload_id_1 + 1'b1);
      end
      if(when_Axi4Crossbar_l1102_1) begin
        _zz_when_Axi4Crossbar_l1081_1 <= (_zz_when_Axi4Crossbar_l1081_1 + 3'b001);
      end else begin
        if(when_Axi4Crossbar_l1104_1) begin
          _zz_when_Axi4Crossbar_l1081_1 <= (_zz_when_Axi4Crossbar_l1081_1 - 3'b001);
        end
      end
      if(when_Axi4Crossbar_l269_5) begin
        grantLock_5 <= 1'b1;
        grantLockIdx_5 <= _zz_rdRrPtr_2_1;
      end else begin
        grantLock_5 <= 1'b0;
      end
      if(decErr_io_axi_ar_fire) begin
        rdRrPtr_2 <= (_zz_rdRrPtr_2_1 + 1'b1);
      end
      if(when_Axi4Crossbar_l1102_2) begin
        _zz_when_Axi4Crossbar_l1081_2 <= (_zz_when_Axi4Crossbar_l1081_2 + 3'b001);
      end else begin
        if(when_Axi4Crossbar_l1104_2) begin
          _zz_when_Axi4Crossbar_l1081_2 <= (_zz_when_Axi4Crossbar_l1081_2 - 3'b001);
        end
      end
      if(when_Axi4Crossbar_l311_2) begin
        respLock_2 <= 1'b1;
        respLockOH_2 <= _zz_respLockOH_8;
      end else begin
        respLock_2 <= 1'b0;
      end
      if(when_Axi4Crossbar_l311_3) begin
        respLock_3 <= 1'b1;
        respLockOH_3 <= _zz_respLockOH_11;
      end else begin
        respLock_3 <= 1'b0;
      end
    end
  end


endmodule

module Axi4DecErrSlave (
  input  wire          io_axi_aw_valid,
  output wire          io_axi_aw_ready,
  input  wire [31:0]   io_axi_aw_payload_addr,
  input  wire [4:0]    io_axi_aw_payload_id,
  input  wire [3:0]    io_axi_aw_payload_region,
  input  wire [7:0]    io_axi_aw_payload_len,
  input  wire [2:0]    io_axi_aw_payload_size,
  input  wire [1:0]    io_axi_aw_payload_burst,
  input  wire [0:0]    io_axi_aw_payload_lock,
  input  wire [3:0]    io_axi_aw_payload_cache,
  input  wire [3:0]    io_axi_aw_payload_qos,
  input  wire [2:0]    io_axi_aw_payload_prot,
  input  wire          io_axi_w_valid,
  output wire          io_axi_w_ready,
  input  wire [31:0]   io_axi_w_payload_data,
  input  wire [3:0]    io_axi_w_payload_strb,
  input  wire          io_axi_w_payload_last,
  output wire          io_axi_b_valid,
  input  wire          io_axi_b_ready,
  output reg  [4:0]    io_axi_b_payload_id,
  output reg  [1:0]    io_axi_b_payload_resp,
  input  wire          io_axi_ar_valid,
  output wire          io_axi_ar_ready,
  input  wire [31:0]   io_axi_ar_payload_addr,
  input  wire [4:0]    io_axi_ar_payload_id,
  input  wire [3:0]    io_axi_ar_payload_region,
  input  wire [7:0]    io_axi_ar_payload_len,
  input  wire [2:0]    io_axi_ar_payload_size,
  input  wire [1:0]    io_axi_ar_payload_burst,
  input  wire [0:0]    io_axi_ar_payload_lock,
  input  wire [3:0]    io_axi_ar_payload_cache,
  input  wire [3:0]    io_axi_ar_payload_qos,
  input  wire [2:0]    io_axi_ar_payload_prot,
  output wire          io_axi_r_valid,
  input  wire          io_axi_r_ready,
  output reg  [31:0]   io_axi_r_payload_data,
  output reg  [4:0]    io_axi_r_payload_id,
  output reg  [1:0]    io_axi_r_payload_resp,
  output reg           io_axi_r_payload_last,
  input  wire          clk,
  input  wire          resetn
);

  reg                 write_sinking;
  reg                 write_answering;
  reg        [4:0]    write_id;
  wire                io_axi_aw_fire;
  wire                io_axi_w_fire;
  wire                when_Axi4DecErrSlave_l59;
  wire       [6:0]    _zz_io_axi_b_payload_id;
  wire                io_axi_b_fire;
  reg                 read_busy;
  reg        [4:0]    read_id;
  reg        [7:0]    read_beatsLeft;
  wire                io_axi_ar_fire;
  wire       [39:0]   _zz_io_axi_r_payload_data;
  wire                io_axi_r_fire;
  wire                when_Axi4DecErrSlave_l97;

  assign io_axi_aw_ready = ((! write_sinking) && (! write_answering));
  assign io_axi_aw_fire = (io_axi_aw_valid && io_axi_aw_ready);
  assign io_axi_w_ready = write_sinking;
  assign io_axi_w_fire = (io_axi_w_valid && io_axi_w_ready);
  assign when_Axi4DecErrSlave_l59 = ((write_sinking && io_axi_w_fire) && io_axi_w_payload_last);
  assign io_axi_b_valid = write_answering;
  assign _zz_io_axi_b_payload_id = 7'h0;
  always @(*) begin
    io_axi_b_payload_id = _zz_io_axi_b_payload_id[4 : 0];
    io_axi_b_payload_id = write_id;
  end

  always @(*) begin
    io_axi_b_payload_resp = _zz_io_axi_b_payload_id[6 : 5];
    io_axi_b_payload_resp = 2'b11;
  end

  assign io_axi_b_fire = (io_axi_b_valid && io_axi_b_ready);
  assign io_axi_ar_ready = (! read_busy);
  assign io_axi_ar_fire = (io_axi_ar_valid && io_axi_ar_ready);
  assign io_axi_r_valid = read_busy;
  assign _zz_io_axi_r_payload_data = 40'h0;
  always @(*) begin
    io_axi_r_payload_data = _zz_io_axi_r_payload_data[31 : 0];
    io_axi_r_payload_data = 32'h0;
  end

  always @(*) begin
    io_axi_r_payload_id = _zz_io_axi_r_payload_data[36 : 32];
    io_axi_r_payload_id = read_id;
  end

  always @(*) begin
    io_axi_r_payload_resp = _zz_io_axi_r_payload_data[38 : 37];
    io_axi_r_payload_resp = 2'b11;
  end

  always @(*) begin
    io_axi_r_payload_last = _zz_io_axi_r_payload_data[39];
    io_axi_r_payload_last = (read_beatsLeft == 8'h0);
  end

  assign io_axi_r_fire = (io_axi_r_valid && io_axi_r_ready);
  assign when_Axi4DecErrSlave_l97 = (read_beatsLeft == 8'h0);
  always @(posedge clk) begin
    if(!resetn) begin
      write_sinking <= 1'b0;
      write_answering <= 1'b0;
      write_id <= 5'h0;
      read_busy <= 1'b0;
      read_id <= 5'h0;
      read_beatsLeft <= 8'h0;
    end else begin
      if(io_axi_aw_fire) begin
        write_sinking <= 1'b1;
        write_id <= io_axi_aw_payload_id;
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
        read_id <= io_axi_ar_payload_id;
        read_beatsLeft <= io_axi_ar_payload_len;
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
