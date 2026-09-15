// Copyright (c) 2026 Leonardo Capossio - bard0 design  hello@bard0.com
// SPDX-License-Identifier: MIT
// Generator : SpinalHDL v1.14.2    git head : 78f29dc66110fc099a777992b6daa2f803ab445e
// Component : AxiZeroMixedTop
// Git hash  : 3e8059ccc21b9a6bda55f1f4b6741f370017686c

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
  wire       [2:0]    _zz__zz_when_Axi4Crossbar_l847_26;
  wire       [2:0]    _zz__zz_when_Axi4Crossbar_l847_26_1;
  wire       [1:0]    _zz__zz_when_Axi4Crossbar_l340_4;
  wire       [1:0]    _zz__zz_when_Axi4Crossbar_l340_4_1;
  wire       [1:0]    _zz__zz_7;
  wire       [0:0]    _zz__zz_4_port;
  wire       [1:0]    _zz__zz_when_Axi4Crossbar_l911;
  wire       [2:0]    _zz__zz_when_Axi4Crossbar_l847_31;
  wire       [2:0]    _zz__zz_when_Axi4Crossbar_l847_31_1;
  wire       [1:0]    _zz__zz_when_Axi4Crossbar_l340_9;
  wire       [1:0]    _zz__zz_when_Axi4Crossbar_l340_9_1;
  wire       [1:0]    _zz__zz_8;
  wire       [0:0]    _zz__zz_5_port;
  wire       [1:0]    _zz__zz_when_Axi4Crossbar_l911_1;
  wire       [2:0]    _zz__zz_when_Axi4Crossbar_l847_36;
  wire       [2:0]    _zz__zz_when_Axi4Crossbar_l847_36_1;
  wire       [1:0]    _zz__zz_when_Axi4Crossbar_l340_14;
  wire       [1:0]    _zz__zz_when_Axi4Crossbar_l340_14_1;
  wire       [1:0]    _zz__zz_9;
  wire       [0:0]    _zz__zz_6_port;
  wire       [1:0]    _zz__zz_when_Axi4Crossbar_l911_2;
  wire       [1:0]    _zz__zz_when_Axi4Crossbar_l777_25;
  wire       [1:0]    _zz__zz_when_Axi4Crossbar_l777_41;
  wire       [1:0]    _zz__zz_when_Axi4Crossbar_l777_57;
  wire       [1:0]    _zz__zz_when_Axi4Crossbar_l777_73;
  wire       [0:0]    _zz__zz_respLockOH;
  wire       [0:0]    _zz__zz_respLockOH_1;
  wire       [0:0]    _zz__zz_respLockOH_2;
  wire       [2:0]    _zz__zz_respLockOH_2_1;
  wire       [0:0]    _zz__zz_respLockOH_3;
  wire       [0:0]    _zz__zz_respLockOH_3_1;
  wire       [0:0]    _zz__zz_respLockOH_3_2;
  wire       [2:0]    _zz__zz_respLockOH_5;
  wire       [2:0]    _zz__zz_when_Axi4Crossbar_l1050_23;
  wire       [2:0]    _zz__zz_when_Axi4Crossbar_l1050_23_1;
  wire       [1:0]    _zz__zz_when_Axi4Crossbar_l340_19;
  wire       [1:0]    _zz__zz_when_Axi4Crossbar_l340_19_1;
  wire       [2:0]    _zz__zz_when_Axi4Crossbar_l1050_26;
  wire       [2:0]    _zz__zz_when_Axi4Crossbar_l1050_26_1;
  wire       [1:0]    _zz__zz_when_Axi4Crossbar_l340_24;
  wire       [1:0]    _zz__zz_when_Axi4Crossbar_l340_24_1;
  wire       [2:0]    _zz__zz_when_Axi4Crossbar_l1050_29;
  wire       [2:0]    _zz__zz_when_Axi4Crossbar_l1050_29_1;
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
  reg        [2:0]    _zz_when_Axi4Crossbar_l847;
  reg        [2:0]    _zz_when_Axi4Crossbar_l847_1;
  reg        [2:0]    _zz_when_Axi4Crossbar_l847_2;
  reg        [1:0]    _zz_7;
  reg        [1:0]    _zz_8;
  reg        [1:0]    _zz_9;
  reg        [1:0]    _zz_when_Axi4Crossbar_l911;
  reg        [1:0]    _zz_when_Axi4Crossbar_l911_1;
  reg        [1:0]    _zz_when_Axi4Crossbar_l911_2;
  reg        [2:0]    _zz_when_Axi4Crossbar_l864;
  reg        [2:0]    _zz_when_Axi4Crossbar_l864_1;
  reg        [2:0]    _zz_when_Axi4Crossbar_l864_2;
  reg        [2:0]    _zz_when_Axi4Crossbar_l1050;
  reg        [2:0]    _zz_when_Axi4Crossbar_l1050_1;
  reg        [2:0]    _zz_when_Axi4Crossbar_l1050_2;
  reg                 _zz_when_Axi4Crossbar_l777;
  reg                 _zz_when_Axi4Crossbar_l777_1;
  reg                 _zz_when_Axi4Crossbar_l777_2;
  reg                 _zz_when_Axi4Crossbar_l777_3;
  reg        [3:0]    _zz_when_Axi4Crossbar_l777_4;
  reg        [3:0]    _zz_when_Axi4Crossbar_l777_5;
  reg        [3:0]    _zz_when_Axi4Crossbar_l777_6;
  reg        [3:0]    _zz_when_Axi4Crossbar_l777_7;
  reg        [1:0]    _zz_when_Axi4Crossbar_l847_3;
  reg        [1:0]    _zz_when_Axi4Crossbar_l847_4;
  reg        [1:0]    _zz_when_Axi4Crossbar_l847_5;
  reg        [1:0]    _zz_when_Axi4Crossbar_l847_6;
  reg        [2:0]    _zz_when_Axi4Crossbar_l784;
  reg        [2:0]    _zz_when_Axi4Crossbar_l784_1;
  reg        [2:0]    _zz_when_Axi4Crossbar_l784_2;
  reg        [2:0]    _zz_when_Axi4Crossbar_l784_3;
  reg                 _zz_when_Axi4Crossbar_l777_8;
  reg                 _zz_when_Axi4Crossbar_l777_9;
  reg                 _zz_when_Axi4Crossbar_l777_10;
  reg                 _zz_when_Axi4Crossbar_l777_11;
  reg        [3:0]    _zz_when_Axi4Crossbar_l777_12;
  reg        [3:0]    _zz_when_Axi4Crossbar_l777_13;
  reg        [3:0]    _zz_when_Axi4Crossbar_l777_14;
  reg        [3:0]    _zz_when_Axi4Crossbar_l777_15;
  reg        [1:0]    _zz_when_Axi4Crossbar_l1050_3;
  reg        [1:0]    _zz_when_Axi4Crossbar_l1050_4;
  reg        [1:0]    _zz_when_Axi4Crossbar_l1050_5;
  reg        [1:0]    _zz_when_Axi4Crossbar_l1050_6;
  reg        [2:0]    _zz_when_Axi4Crossbar_l784_4;
  reg        [2:0]    _zz_when_Axi4Crossbar_l784_5;
  reg        [2:0]    _zz_when_Axi4Crossbar_l784_6;
  reg        [2:0]    _zz_when_Axi4Crossbar_l784_7;
  reg        [2:0]    _zz_when_Axi4Crossbar_l847_7;
  reg        [2:0]    _zz_when_Axi4Crossbar_l847_8;
  reg        [1:0]    _zz_when_Axi4Crossbar_l847_9;
  reg        [1:0]    _zz_when_Axi4Crossbar_l847_10;
  reg        [2:0]    _zz_when_Axi4Crossbar_l847_11;
  reg        [2:0]    _zz_when_Axi4Crossbar_l847_12;
  wire       [2:0]    _zz_when_Axi4Crossbar_l1050_7;
  wire       [2:0]    _zz_when_Axi4Crossbar_l1050_8;
  wire       [3:0]    _zz_when_Axi4Crossbar_l847_13;
  wire                _zz_when_Axi4Crossbar_l847_14;
  wire                _zz_when_Axi4Crossbar_l847_15;
  wire                _zz_when_Axi4Crossbar_l847_16;
  reg        [1:0]    _zz_when_Axi4Crossbar_l847_17;
  reg        [2:0]    _zz_when_Axi4Crossbar_l847_18;
  wire       [3:0]    _zz_when_Axi4Crossbar_l1050_9;
  wire                _zz_when_Axi4Crossbar_l1050_10;
  wire                _zz_when_Axi4Crossbar_l1050_11;
  wire                _zz_when_Axi4Crossbar_l1050_12;
  reg        [1:0]    _zz_when_Axi4Crossbar_l1050_13;
  reg        [2:0]    _zz_when_Axi4Crossbar_l1050_14;
  wire       [3:0]    _zz_when_Axi4Crossbar_l847_19;
  wire                _zz_when_Axi4Crossbar_l847_20;
  wire                _zz_when_Axi4Crossbar_l847_21;
  wire                _zz_when_Axi4Crossbar_l847_22;
  reg        [1:0]    _zz_when_Axi4Crossbar_l847_23;
  reg        [2:0]    _zz_when_Axi4Crossbar_l847_24;
  wire       [3:0]    _zz_when_Axi4Crossbar_l1050_15;
  wire                _zz_when_Axi4Crossbar_l1050_16;
  wire                _zz_when_Axi4Crossbar_l1050_17;
  wire                _zz_when_Axi4Crossbar_l1050_18;
  reg        [1:0]    _zz_when_Axi4Crossbar_l1050_19;
  reg        [2:0]    _zz_when_Axi4Crossbar_l1050_20;
  reg        [2:0]    _zz_when_Axi4Crossbar_l990;
  reg        [2:0]    _zz_when_Axi4Crossbar_l990_1;
  reg        [2:0]    _zz_when_Axi4Crossbar_l995;
  reg        [2:0]    _zz_when_Axi4Crossbar_l995_1;
  wire                _zz_when_Axi4Crossbar_l847_25;
  reg        [1:0]    _zz_when_Axi4Crossbar_l847_26;
  reg        [1:0]    _zz_when_Axi4Crossbar_l847_27;
  reg        [1:0]    _zz_when_Axi4Crossbar_l847_28;
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
  wire                _zz_when_Axi4Crossbar_l847_29;
  wire                _zz_when_Axi4Crossbar_l864_3;
  wire       [0:0]    _zz_when_Axi4Crossbar_l911_3;
  reg                 _zz_when_Axi4Crossbar_l864_4;
  wire                when_Axi4Crossbar_l847;
  wire                when_Axi4Crossbar_l850;
  wire                when_Axi4Crossbar_l864;
  wire                when_Axi4Crossbar_l850_1;
  wire                when_Axi4Crossbar_l864_1;
  wire                io_slaves_0_aw_fire;
  wire                io_slaves_0_w_fire;
  wire                _zz_when_Axi4Crossbar_l883;
  wire                _zz_when_Axi4Crossbar_l895;
  wire                when_Axi4Crossbar_l883;
  wire                when_Axi4Crossbar_l895;
  wire                when_Axi4Crossbar_l909;
  wire                when_Axi4Crossbar_l911;
  wire                when_Axi4Crossbar_l911_1;
  wire                when_Axi4Crossbar_l922;
  wire                when_Axi4Crossbar_l928;
  wire                when_Axi4Crossbar_l930;
  wire                io_slaves_0_b_fire;
  wire                when_Axi4Crossbar_l937;
  wire                when_Axi4Crossbar_l939;
  wire                _zz_when_Axi4Crossbar_l847_30;
  reg        [1:0]    _zz_when_Axi4Crossbar_l847_31;
  reg        [1:0]    _zz_when_Axi4Crossbar_l847_32;
  reg        [1:0]    _zz_when_Axi4Crossbar_l847_33;
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
  wire                _zz_when_Axi4Crossbar_l847_34;
  wire                _zz_when_Axi4Crossbar_l864_5;
  wire       [0:0]    _zz_when_Axi4Crossbar_l911_4;
  reg                 _zz_when_Axi4Crossbar_l864_6;
  wire                when_Axi4Crossbar_l847_1;
  wire                when_Axi4Crossbar_l850_2;
  wire                when_Axi4Crossbar_l864_2;
  wire                when_Axi4Crossbar_l850_3;
  wire                when_Axi4Crossbar_l864_3;
  wire                io_slaves_1_aw_fire;
  wire                io_slaves_1_w_fire;
  wire                _zz_when_Axi4Crossbar_l883_1;
  wire                _zz_when_Axi4Crossbar_l895_1;
  wire                when_Axi4Crossbar_l883_1;
  wire                when_Axi4Crossbar_l895_1;
  wire                when_Axi4Crossbar_l909_1;
  wire                when_Axi4Crossbar_l911_2;
  wire                when_Axi4Crossbar_l911_3;
  wire                when_Axi4Crossbar_l922_1;
  wire                when_Axi4Crossbar_l928_1;
  wire                when_Axi4Crossbar_l930_1;
  wire                io_slaves_1_b_fire;
  wire                when_Axi4Crossbar_l937_1;
  wire                when_Axi4Crossbar_l939_1;
  wire                _zz_when_Axi4Crossbar_l847_35;
  reg        [1:0]    _zz_when_Axi4Crossbar_l847_36;
  reg        [1:0]    _zz_when_Axi4Crossbar_l847_37;
  reg        [1:0]    _zz_when_Axi4Crossbar_l847_38;
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
  wire                _zz_when_Axi4Crossbar_l847_39;
  wire                _zz_when_Axi4Crossbar_l864_7;
  wire       [0:0]    _zz_when_Axi4Crossbar_l911_5;
  reg                 _zz_when_Axi4Crossbar_l864_8;
  wire                when_Axi4Crossbar_l847_2;
  wire                when_Axi4Crossbar_l850_4;
  wire                when_Axi4Crossbar_l864_4;
  wire                when_Axi4Crossbar_l850_5;
  wire                when_Axi4Crossbar_l864_5;
  wire                decErr_io_axi_aw_fire;
  wire                decErr_io_axi_w_fire;
  wire                _zz_when_Axi4Crossbar_l883_2;
  wire                _zz_when_Axi4Crossbar_l895_2;
  wire                when_Axi4Crossbar_l883_2;
  wire                when_Axi4Crossbar_l895_2;
  wire                when_Axi4Crossbar_l909_2;
  wire                when_Axi4Crossbar_l911_4;
  wire                when_Axi4Crossbar_l911_5;
  wire                when_Axi4Crossbar_l922_2;
  wire                when_Axi4Crossbar_l928_2;
  wire                when_Axi4Crossbar_l930_2;
  wire                decErr_io_axi_b_fire;
  wire                when_Axi4Crossbar_l937_2;
  wire                when_Axi4Crossbar_l939_2;
  wire                _zz_when_Axi4Crossbar_l777_16;
  wire       [3:0]    _zz_when_Axi4Crossbar_l777_17;
  reg        [1:0]    _zz_when_Axi4Crossbar_l697;
  wire       [2:0]    _zz_when_Axi4Crossbar_l697_1;
  reg        [1:0]    _zz_when_Axi4Crossbar_l847_40;
  wire                when_Axi4Crossbar_l697;
  wire                when_Axi4Crossbar_l697_1;
  wire                when_Axi4Crossbar_l697_2;
  wire                _zz_when_Axi4Crossbar_l777_18;
  wire       [3:0]    _zz_when_Axi4Crossbar_l777_19;
  wire                _zz_when_Axi4Crossbar_l777_20;
  wire                _zz_when_Axi4Crossbar_l777_21;
  wire                _zz_when_Axi4Crossbar_l777_22;
  reg        [1:0]    _zz_when_Axi4Crossbar_l777_23;
  wire       [1:0]    _zz_when_Axi4Crossbar_l777_24;
  wire       [1:0]    _zz_when_Axi4Crossbar_l777_25;
  wire                _zz_when_Axi4Crossbar_l777_26;
  wire                _zz_when_Axi4Crossbar_l777_27;
  wire                _zz_when_Axi4Crossbar_l777_28;
  wire                when_Axi4Crossbar_l777;
  wire                when_Axi4Crossbar_l784;
  wire                when_Axi4Crossbar_l782;
  wire                _zz_when_Axi4Crossbar_l777_29;
  wire                _zz_when_Axi4Crossbar_l777_30;
  wire                _zz_when_Axi4Crossbar_l777_31;
  wire                when_Axi4Crossbar_l777_1;
  wire                when_Axi4Crossbar_l784_1;
  wire                when_Axi4Crossbar_l782_1;
  wire                _zz_when_Axi4Crossbar_l777_32;
  wire       [3:0]    _zz_when_Axi4Crossbar_l777_33;
  reg        [1:0]    _zz_when_Axi4Crossbar_l697_2;
  wire       [2:0]    _zz_when_Axi4Crossbar_l697_3;
  reg        [1:0]    _zz_when_Axi4Crossbar_l1050_21;
  wire                when_Axi4Crossbar_l697_3;
  wire                when_Axi4Crossbar_l697_4;
  wire                when_Axi4Crossbar_l697_5;
  wire                _zz_when_Axi4Crossbar_l777_34;
  wire       [3:0]    _zz_when_Axi4Crossbar_l777_35;
  wire                _zz_when_Axi4Crossbar_l777_36;
  wire                _zz_when_Axi4Crossbar_l777_37;
  wire                _zz_when_Axi4Crossbar_l777_38;
  reg        [1:0]    _zz_when_Axi4Crossbar_l777_39;
  wire       [1:0]    _zz_when_Axi4Crossbar_l777_40;
  wire       [1:0]    _zz_when_Axi4Crossbar_l777_41;
  wire                _zz_when_Axi4Crossbar_l777_42;
  wire                _zz_when_Axi4Crossbar_l777_43;
  wire                _zz_when_Axi4Crossbar_l777_44;
  wire                when_Axi4Crossbar_l777_2;
  wire                when_Axi4Crossbar_l784_2;
  wire                when_Axi4Crossbar_l782_2;
  wire                _zz_when_Axi4Crossbar_l777_45;
  wire                _zz_when_Axi4Crossbar_l777_46;
  wire                _zz_when_Axi4Crossbar_l777_47;
  wire                when_Axi4Crossbar_l777_3;
  wire                when_Axi4Crossbar_l784_3;
  wire                when_Axi4Crossbar_l782_3;
  wire                when_Axi4Crossbar_l995;
  wire                _zz_when_Axi4Crossbar_l990_2;
  wire                when_Axi4Crossbar_l990;
  wire                when_Axi4Crossbar_l992;
  reg        [1:0]    _zz_when_Axi4Crossbar_l697_4;
  wire       [2:0]    _zz_when_Axi4Crossbar_l697_5;
  reg        [1:0]    _zz_when_Axi4Crossbar_l847_41;
  wire                when_Axi4Crossbar_l697_6;
  wire                when_Axi4Crossbar_l697_7;
  wire                when_Axi4Crossbar_l697_8;
  wire                _zz_when_Axi4Crossbar_l777_48;
  wire       [3:0]    _zz_when_Axi4Crossbar_l777_49;
  reg        [1:0]    _zz_when_Axi4Crossbar_l697_6;
  wire       [2:0]    _zz_when_Axi4Crossbar_l697_7;
  reg        [1:0]    _zz_when_Axi4Crossbar_l847_42;
  wire                when_Axi4Crossbar_l697_9;
  wire                when_Axi4Crossbar_l697_10;
  wire                when_Axi4Crossbar_l697_11;
  wire                _zz_when_Axi4Crossbar_l777_50;
  wire       [3:0]    _zz_when_Axi4Crossbar_l777_51;
  wire                _zz_when_Axi4Crossbar_l777_52;
  wire                _zz_when_Axi4Crossbar_l777_53;
  wire                _zz_when_Axi4Crossbar_l777_54;
  reg        [1:0]    _zz_when_Axi4Crossbar_l777_55;
  wire       [1:0]    _zz_when_Axi4Crossbar_l777_56;
  wire       [1:0]    _zz_when_Axi4Crossbar_l777_57;
  wire                _zz_when_Axi4Crossbar_l777_58;
  wire                _zz_when_Axi4Crossbar_l777_59;
  wire                _zz_when_Axi4Crossbar_l777_60;
  wire                when_Axi4Crossbar_l777_4;
  wire                when_Axi4Crossbar_l784_4;
  wire                when_Axi4Crossbar_l782_4;
  wire                _zz_when_Axi4Crossbar_l777_61;
  wire                _zz_when_Axi4Crossbar_l777_62;
  wire                _zz_when_Axi4Crossbar_l777_63;
  wire                when_Axi4Crossbar_l777_5;
  wire                when_Axi4Crossbar_l784_5;
  wire                when_Axi4Crossbar_l782_5;
  wire                _zz_when_Axi4Crossbar_l777_64;
  wire       [3:0]    _zz_when_Axi4Crossbar_l777_65;
  reg        [1:0]    _zz_when_Axi4Crossbar_l697_8;
  wire       [2:0]    _zz_when_Axi4Crossbar_l697_9;
  reg        [1:0]    _zz_when_Axi4Crossbar_l1050_22;
  wire                when_Axi4Crossbar_l697_12;
  wire                when_Axi4Crossbar_l697_13;
  wire                when_Axi4Crossbar_l697_14;
  wire                _zz_when_Axi4Crossbar_l777_66;
  wire       [3:0]    _zz_when_Axi4Crossbar_l777_67;
  wire                _zz_when_Axi4Crossbar_l777_68;
  wire                _zz_when_Axi4Crossbar_l777_69;
  wire                _zz_when_Axi4Crossbar_l777_70;
  reg        [1:0]    _zz_when_Axi4Crossbar_l777_71;
  wire       [1:0]    _zz_when_Axi4Crossbar_l777_72;
  wire       [1:0]    _zz_when_Axi4Crossbar_l777_73;
  wire                _zz_when_Axi4Crossbar_l777_74;
  wire                _zz_when_Axi4Crossbar_l777_75;
  wire                _zz_when_Axi4Crossbar_l777_76;
  wire                when_Axi4Crossbar_l777_6;
  wire                when_Axi4Crossbar_l784_6;
  wire                when_Axi4Crossbar_l782_6;
  wire                _zz_when_Axi4Crossbar_l777_77;
  wire                _zz_when_Axi4Crossbar_l777_78;
  wire                _zz_when_Axi4Crossbar_l777_79;
  wire                when_Axi4Crossbar_l777_7;
  wire                when_Axi4Crossbar_l784_7;
  wire                when_Axi4Crossbar_l782_7;
  wire                when_Axi4Crossbar_l995_1;
  wire                _zz_when_Axi4Crossbar_l990_3;
  wire                when_Axi4Crossbar_l990_1;
  wire                when_Axi4Crossbar_l992_1;
  reg        [1:0]    _zz_when_Axi4Crossbar_l697_10;
  wire       [2:0]    _zz_when_Axi4Crossbar_l697_11;
  reg        [1:0]    _zz_when_Axi4Crossbar_l847_43;
  wire                when_Axi4Crossbar_l697_15;
  wire                when_Axi4Crossbar_l697_16;
  wire                when_Axi4Crossbar_l697_17;
  reg        [2:0]    _zz_respLockOH;
  wire       [2:0]    _zz_respLockOH_1;
  reg                 respLock;
  reg        [2:0]    respLockOH;
  wire       [2:0]    _zz_respLockOH_2;
  wire                when_Axi4Crossbar_l311;
  wire                when_Axi4Crossbar_l1014;
  wire                when_Axi4Crossbar_l1014_1;
  wire                when_Axi4Crossbar_l1014_2;
  reg        [2:0]    _zz_respLockOH_3;
  wire       [2:0]    _zz_respLockOH_4;
  reg                 respLock_1;
  reg        [2:0]    respLockOH_1;
  wire       [2:0]    _zz_respLockOH_5;
  wire                when_Axi4Crossbar_l311_1;
  wire                when_Axi4Crossbar_l1014_3;
  wire                when_Axi4Crossbar_l1014_4;
  wire                when_Axi4Crossbar_l1014_5;
  reg        [1:0]    _zz_when_Axi4Crossbar_l1050_23;
  reg        [1:0]    _zz_when_Axi4Crossbar_l1050_24;
  reg        [1:0]    _zz_when_Axi4Crossbar_l1050_25;
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
  wire                when_Axi4Crossbar_l1050;
  wire                when_Axi4Crossbar_l1053;
  wire                when_Axi4Crossbar_l1053_1;
  wire                io_slaves_0_ar_fire;
  wire                _zz_when_Axi4Crossbar_l1071;
  wire                io_slaves_0_r_fire;
  wire                when_Axi4Crossbar_l1071;
  wire                when_Axi4Crossbar_l1073;
  reg        [1:0]    _zz_when_Axi4Crossbar_l1050_26;
  reg        [1:0]    _zz_when_Axi4Crossbar_l1050_27;
  reg        [1:0]    _zz_when_Axi4Crossbar_l1050_28;
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
  wire                when_Axi4Crossbar_l1050_1;
  wire                when_Axi4Crossbar_l1053_2;
  wire                when_Axi4Crossbar_l1053_3;
  wire                io_slaves_1_ar_fire;
  wire                _zz_when_Axi4Crossbar_l1071_1;
  wire                io_slaves_1_r_fire;
  wire                when_Axi4Crossbar_l1071_1;
  wire                when_Axi4Crossbar_l1073_1;
  reg        [1:0]    _zz_when_Axi4Crossbar_l1050_29;
  reg        [1:0]    _zz_when_Axi4Crossbar_l1050_30;
  reg        [1:0]    _zz_when_Axi4Crossbar_l1050_31;
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
  wire                when_Axi4Crossbar_l1050_2;
  wire                when_Axi4Crossbar_l1053_4;
  wire                when_Axi4Crossbar_l1053_5;
  wire                decErr_io_axi_ar_fire;
  wire                _zz_when_Axi4Crossbar_l1071_2;
  wire                decErr_io_axi_r_fire;
  wire                when_Axi4Crossbar_l1071_2;
  wire                when_Axi4Crossbar_l1073_2;
  reg        [2:0]    _zz_respLockOH_6;
  wire       [2:0]    _zz_respLockOH_7;
  reg                 respLock_2;
  reg        [2:0]    respLockOH_2;
  wire       [2:0]    _zz_respLockOH_8;
  wire                when_Axi4Crossbar_l311_2;
  wire                when_Axi4Crossbar_l1097;
  wire                when_Axi4Crossbar_l1097_1;
  wire                when_Axi4Crossbar_l1097_2;
  reg        [2:0]    _zz_respLockOH_9;
  wire       [2:0]    _zz_respLockOH_10;
  reg                 respLock_3;
  reg        [2:0]    respLockOH_3;
  wire       [2:0]    _zz_respLockOH_11;
  wire                when_Axi4Crossbar_l311_3;
  wire                when_Axi4Crossbar_l1097_3;
  wire                when_Axi4Crossbar_l1097_4;
  wire                when_Axi4Crossbar_l1097_5;
  (* ram_style = "distributed" *) reg [0:0] _zz_4 [0:3];
  (* ram_style = "distributed" *) reg [0:0] _zz_5 [0:3];
  (* ram_style = "distributed" *) reg [0:0] _zz_6 [0:3];

  assign _zz__zz_when_Axi4Crossbar_l847_26 = {(! (|_zz_when_Axi4Crossbar_l847_27)),_zz_when_Axi4Crossbar_l847_27};
  assign _zz__zz_when_Axi4Crossbar_l847_26_1 = {(! (|_zz_when_Axi4Crossbar_l847_28)),_zz_when_Axi4Crossbar_l847_28};
  assign _zz__zz_when_Axi4Crossbar_l340_4 = (_zz_when_Axi4Crossbar_l340_2 - 2'b01);
  assign _zz__zz_when_Axi4Crossbar_l340_4_1 = (_zz_when_Axi4Crossbar_l340_3 - 2'b01);
  assign _zz__zz_7 = (_zz_7 + 2'b01);
  assign _zz__zz_when_Axi4Crossbar_l911 = (_zz_when_Axi4Crossbar_l911 + 2'b01);
  assign _zz__zz_when_Axi4Crossbar_l847_31 = {(! (|_zz_when_Axi4Crossbar_l847_32)),_zz_when_Axi4Crossbar_l847_32};
  assign _zz__zz_when_Axi4Crossbar_l847_31_1 = {(! (|_zz_when_Axi4Crossbar_l847_33)),_zz_when_Axi4Crossbar_l847_33};
  assign _zz__zz_when_Axi4Crossbar_l340_9 = (_zz_when_Axi4Crossbar_l340_7 - 2'b01);
  assign _zz__zz_when_Axi4Crossbar_l340_9_1 = (_zz_when_Axi4Crossbar_l340_8 - 2'b01);
  assign _zz__zz_8 = (_zz_8 + 2'b01);
  assign _zz__zz_when_Axi4Crossbar_l911_1 = (_zz_when_Axi4Crossbar_l911_1 + 2'b01);
  assign _zz__zz_when_Axi4Crossbar_l847_36 = {(! (|_zz_when_Axi4Crossbar_l847_37)),_zz_when_Axi4Crossbar_l847_37};
  assign _zz__zz_when_Axi4Crossbar_l847_36_1 = {(! (|_zz_when_Axi4Crossbar_l847_38)),_zz_when_Axi4Crossbar_l847_38};
  assign _zz__zz_when_Axi4Crossbar_l340_14 = (_zz_when_Axi4Crossbar_l340_12 - 2'b01);
  assign _zz__zz_when_Axi4Crossbar_l340_14_1 = (_zz_when_Axi4Crossbar_l340_13 - 2'b01);
  assign _zz__zz_9 = (_zz_9 + 2'b01);
  assign _zz__zz_when_Axi4Crossbar_l911_2 = (_zz_when_Axi4Crossbar_l911_2 + 2'b01);
  assign _zz__zz_when_Axi4Crossbar_l777_25 = (_zz_when_Axi4Crossbar_l777_24 - 2'b01);
  assign _zz__zz_when_Axi4Crossbar_l777_41 = (_zz_when_Axi4Crossbar_l777_40 - 2'b01);
  assign _zz__zz_when_Axi4Crossbar_l777_57 = (_zz_when_Axi4Crossbar_l777_56 - 2'b01);
  assign _zz__zz_when_Axi4Crossbar_l777_73 = (_zz_when_Axi4Crossbar_l777_72 - 2'b01);
  assign _zz__zz_respLockOH = (io_slaves_0_b_payload_id >>> 3'd4);
  assign _zz__zz_respLockOH_1 = (io_slaves_1_b_payload_id >>> 3'd4);
  assign _zz__zz_respLockOH_2 = (decErr_io_axi_b_payload_id >>> 3'd4);
  assign _zz__zz_respLockOH_2_1 = (_zz_respLockOH_1 - 3'b001);
  assign _zz__zz_respLockOH_3 = (io_slaves_0_b_payload_id >>> 3'd4);
  assign _zz__zz_respLockOH_3_1 = (io_slaves_1_b_payload_id >>> 3'd4);
  assign _zz__zz_respLockOH_3_2 = (decErr_io_axi_b_payload_id >>> 3'd4);
  assign _zz__zz_respLockOH_5 = (_zz_respLockOH_4 - 3'b001);
  assign _zz__zz_when_Axi4Crossbar_l1050_23 = {(! (|_zz_when_Axi4Crossbar_l1050_24)),_zz_when_Axi4Crossbar_l1050_24};
  assign _zz__zz_when_Axi4Crossbar_l1050_23_1 = {(! (|_zz_when_Axi4Crossbar_l1050_25)),_zz_when_Axi4Crossbar_l1050_25};
  assign _zz__zz_when_Axi4Crossbar_l340_19 = (_zz_when_Axi4Crossbar_l340_17 - 2'b01);
  assign _zz__zz_when_Axi4Crossbar_l340_19_1 = (_zz_when_Axi4Crossbar_l340_18 - 2'b01);
  assign _zz__zz_when_Axi4Crossbar_l1050_26 = {(! (|_zz_when_Axi4Crossbar_l1050_27)),_zz_when_Axi4Crossbar_l1050_27};
  assign _zz__zz_when_Axi4Crossbar_l1050_26_1 = {(! (|_zz_when_Axi4Crossbar_l1050_28)),_zz_when_Axi4Crossbar_l1050_28};
  assign _zz__zz_when_Axi4Crossbar_l340_24 = (_zz_when_Axi4Crossbar_l340_22 - 2'b01);
  assign _zz__zz_when_Axi4Crossbar_l340_24_1 = (_zz_when_Axi4Crossbar_l340_23 - 2'b01);
  assign _zz__zz_when_Axi4Crossbar_l1050_29 = {(! (|_zz_when_Axi4Crossbar_l1050_30)),_zz_when_Axi4Crossbar_l1050_30};
  assign _zz__zz_when_Axi4Crossbar_l1050_29_1 = {(! (|_zz_when_Axi4Crossbar_l1050_31)),_zz_when_Axi4Crossbar_l1050_31};
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
  assign _zz_4_spinal_port0 = _zz_4[_zz_when_Axi4Crossbar_l911];
  always @(posedge clk) begin
    if(_zz_3) begin
      _zz_4[_zz_7] <= _zz__zz_4_port;
    end
  end

  assign _zz_5_spinal_port0 = _zz_5[_zz_when_Axi4Crossbar_l911_1];
  always @(posedge clk) begin
    if(_zz_2) begin
      _zz_5[_zz_8] <= _zz__zz_5_port;
    end
  end

  assign _zz_6_spinal_port0 = _zz_6[_zz_when_Axi4Crossbar_l911_2];
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
    if(when_Axi4Crossbar_l895_2) begin
      _zz_1 = 1'b1;
    end
  end

  always @(*) begin
    _zz_2 = 1'b0;
    if(when_Axi4Crossbar_l895_1) begin
      _zz_2 = 1'b1;
    end
  end

  always @(*) begin
    _zz_3 = 1'b0;
    if(when_Axi4Crossbar_l895) begin
      _zz_3 = 1'b1;
    end
  end

  always @(*) begin
    io_masters_0_aw_ready = 1'b0;
    if(when_Axi4Crossbar_l847) begin
      if(when_Axi4Crossbar_l850) begin
        io_masters_0_aw_ready = io_slaves_0_aw_ready;
      end
    end
    if(when_Axi4Crossbar_l847_1) begin
      if(when_Axi4Crossbar_l850_2) begin
        io_masters_0_aw_ready = io_slaves_1_aw_ready;
      end
    end
    if(when_Axi4Crossbar_l847_2) begin
      if(when_Axi4Crossbar_l850_4) begin
        io_masters_0_aw_ready = decErr_io_axi_aw_ready;
      end
    end
  end

  always @(*) begin
    io_masters_0_w_ready = 1'b0;
    if(when_Axi4Crossbar_l847) begin
      if(when_Axi4Crossbar_l850) begin
        if(when_Axi4Crossbar_l864) begin
          io_masters_0_w_ready = io_slaves_0_w_ready;
        end
      end
    end
    if(when_Axi4Crossbar_l909) begin
      if(when_Axi4Crossbar_l911) begin
        io_masters_0_w_ready = io_slaves_0_w_ready;
      end
    end
    if(when_Axi4Crossbar_l847_1) begin
      if(when_Axi4Crossbar_l850_2) begin
        if(when_Axi4Crossbar_l864_2) begin
          io_masters_0_w_ready = io_slaves_1_w_ready;
        end
      end
    end
    if(when_Axi4Crossbar_l909_1) begin
      if(when_Axi4Crossbar_l911_2) begin
        io_masters_0_w_ready = io_slaves_1_w_ready;
      end
    end
    if(when_Axi4Crossbar_l847_2) begin
      if(when_Axi4Crossbar_l850_4) begin
        if(when_Axi4Crossbar_l864_4) begin
          io_masters_0_w_ready = decErr_io_axi_w_ready;
        end
      end
    end
    if(when_Axi4Crossbar_l909_2) begin
      if(when_Axi4Crossbar_l911_4) begin
        io_masters_0_w_ready = decErr_io_axi_w_ready;
      end
    end
  end

  always @(*) begin
    io_masters_0_b_valid = 1'b0;
    if(when_Axi4Crossbar_l1014) begin
      io_masters_0_b_valid = io_slaves_0_b_valid;
    end
    if(when_Axi4Crossbar_l1014_1) begin
      io_masters_0_b_valid = io_slaves_1_b_valid;
    end
    if(when_Axi4Crossbar_l1014_2) begin
      io_masters_0_b_valid = decErr_io_axi_b_valid;
    end
  end

  assign _zz_io_masters_0_b_payload_id = 6'h0;
  always @(*) begin
    io_masters_0_b_payload_id = _zz_io_masters_0_b_payload_id[3 : 0];
    if(when_Axi4Crossbar_l1014) begin
      io_masters_0_b_payload_id = io_slaves_0_b_payload_id[3 : 0];
    end
    if(when_Axi4Crossbar_l1014_1) begin
      io_masters_0_b_payload_id = io_slaves_1_b_payload_id[3 : 0];
    end
    if(when_Axi4Crossbar_l1014_2) begin
      io_masters_0_b_payload_id = decErr_io_axi_b_payload_id[3 : 0];
    end
  end

  always @(*) begin
    io_masters_0_b_payload_resp = _zz_io_masters_0_b_payload_id[5 : 4];
    if(when_Axi4Crossbar_l1014) begin
      io_masters_0_b_payload_resp = io_slaves_0_b_payload_resp;
    end
    if(when_Axi4Crossbar_l1014_1) begin
      io_masters_0_b_payload_resp = io_slaves_1_b_payload_resp;
    end
    if(when_Axi4Crossbar_l1014_2) begin
      io_masters_0_b_payload_resp = decErr_io_axi_b_payload_resp;
    end
  end

  always @(*) begin
    io_masters_0_ar_ready = 1'b0;
    if(when_Axi4Crossbar_l1050) begin
      if(when_Axi4Crossbar_l1053) begin
        io_masters_0_ar_ready = io_slaves_0_ar_ready;
      end
    end
    if(when_Axi4Crossbar_l1050_1) begin
      if(when_Axi4Crossbar_l1053_2) begin
        io_masters_0_ar_ready = io_slaves_1_ar_ready;
      end
    end
    if(when_Axi4Crossbar_l1050_2) begin
      if(when_Axi4Crossbar_l1053_4) begin
        io_masters_0_ar_ready = decErr_io_axi_ar_ready;
      end
    end
  end

  always @(*) begin
    io_masters_0_r_valid = 1'b0;
    if(when_Axi4Crossbar_l1097) begin
      io_masters_0_r_valid = io_slaves_0_r_valid;
    end
    if(when_Axi4Crossbar_l1097_1) begin
      io_masters_0_r_valid = io_slaves_1_r_valid;
    end
    if(when_Axi4Crossbar_l1097_2) begin
      io_masters_0_r_valid = decErr_io_axi_r_valid;
    end
  end

  assign _zz_io_masters_0_r_payload_data = 39'h0;
  always @(*) begin
    io_masters_0_r_payload_data = _zz_io_masters_0_r_payload_data[31 : 0];
    if(when_Axi4Crossbar_l1097) begin
      io_masters_0_r_payload_data = io_slaves_0_r_payload_data;
    end
    if(when_Axi4Crossbar_l1097_1) begin
      io_masters_0_r_payload_data = io_slaves_1_r_payload_data;
    end
    if(when_Axi4Crossbar_l1097_2) begin
      io_masters_0_r_payload_data = decErr_io_axi_r_payload_data;
    end
  end

  always @(*) begin
    io_masters_0_r_payload_id = _zz_io_masters_0_r_payload_data[35 : 32];
    if(when_Axi4Crossbar_l1097) begin
      io_masters_0_r_payload_id = io_slaves_0_r_payload_id[3 : 0];
    end
    if(when_Axi4Crossbar_l1097_1) begin
      io_masters_0_r_payload_id = io_slaves_1_r_payload_id[3 : 0];
    end
    if(when_Axi4Crossbar_l1097_2) begin
      io_masters_0_r_payload_id = decErr_io_axi_r_payload_id[3 : 0];
    end
  end

  always @(*) begin
    io_masters_0_r_payload_resp = _zz_io_masters_0_r_payload_data[37 : 36];
    if(when_Axi4Crossbar_l1097) begin
      io_masters_0_r_payload_resp = io_slaves_0_r_payload_resp;
    end
    if(when_Axi4Crossbar_l1097_1) begin
      io_masters_0_r_payload_resp = io_slaves_1_r_payload_resp;
    end
    if(when_Axi4Crossbar_l1097_2) begin
      io_masters_0_r_payload_resp = decErr_io_axi_r_payload_resp;
    end
  end

  always @(*) begin
    io_masters_0_r_payload_last = _zz_io_masters_0_r_payload_data[38];
    if(when_Axi4Crossbar_l1097) begin
      io_masters_0_r_payload_last = io_slaves_0_r_payload_last;
    end
    if(when_Axi4Crossbar_l1097_1) begin
      io_masters_0_r_payload_last = io_slaves_1_r_payload_last;
    end
    if(when_Axi4Crossbar_l1097_2) begin
      io_masters_0_r_payload_last = decErr_io_axi_r_payload_last;
    end
  end

  always @(*) begin
    io_masters_1_aw_ready = 1'b0;
    if(when_Axi4Crossbar_l847) begin
      if(when_Axi4Crossbar_l850_1) begin
        io_masters_1_aw_ready = io_slaves_0_aw_ready;
      end
    end
    if(when_Axi4Crossbar_l847_1) begin
      if(when_Axi4Crossbar_l850_3) begin
        io_masters_1_aw_ready = io_slaves_1_aw_ready;
      end
    end
    if(when_Axi4Crossbar_l847_2) begin
      if(when_Axi4Crossbar_l850_5) begin
        io_masters_1_aw_ready = decErr_io_axi_aw_ready;
      end
    end
  end

  always @(*) begin
    io_masters_1_w_ready = 1'b0;
    if(when_Axi4Crossbar_l847) begin
      if(when_Axi4Crossbar_l850_1) begin
        if(when_Axi4Crossbar_l864_1) begin
          io_masters_1_w_ready = io_slaves_0_w_ready;
        end
      end
    end
    if(when_Axi4Crossbar_l909) begin
      if(when_Axi4Crossbar_l911_1) begin
        io_masters_1_w_ready = io_slaves_0_w_ready;
      end
    end
    if(when_Axi4Crossbar_l847_1) begin
      if(when_Axi4Crossbar_l850_3) begin
        if(when_Axi4Crossbar_l864_3) begin
          io_masters_1_w_ready = io_slaves_1_w_ready;
        end
      end
    end
    if(when_Axi4Crossbar_l909_1) begin
      if(when_Axi4Crossbar_l911_3) begin
        io_masters_1_w_ready = io_slaves_1_w_ready;
      end
    end
    if(when_Axi4Crossbar_l847_2) begin
      if(when_Axi4Crossbar_l850_5) begin
        if(when_Axi4Crossbar_l864_5) begin
          io_masters_1_w_ready = decErr_io_axi_w_ready;
        end
      end
    end
    if(when_Axi4Crossbar_l909_2) begin
      if(when_Axi4Crossbar_l911_5) begin
        io_masters_1_w_ready = decErr_io_axi_w_ready;
      end
    end
  end

  always @(*) begin
    io_masters_1_b_valid = 1'b0;
    if(when_Axi4Crossbar_l1014_3) begin
      io_masters_1_b_valid = io_slaves_0_b_valid;
    end
    if(when_Axi4Crossbar_l1014_4) begin
      io_masters_1_b_valid = io_slaves_1_b_valid;
    end
    if(when_Axi4Crossbar_l1014_5) begin
      io_masters_1_b_valid = decErr_io_axi_b_valid;
    end
  end

  assign _zz_io_masters_1_b_payload_id = 6'h0;
  always @(*) begin
    io_masters_1_b_payload_id = _zz_io_masters_1_b_payload_id[3 : 0];
    if(when_Axi4Crossbar_l1014_3) begin
      io_masters_1_b_payload_id = io_slaves_0_b_payload_id[3 : 0];
    end
    if(when_Axi4Crossbar_l1014_4) begin
      io_masters_1_b_payload_id = io_slaves_1_b_payload_id[3 : 0];
    end
    if(when_Axi4Crossbar_l1014_5) begin
      io_masters_1_b_payload_id = decErr_io_axi_b_payload_id[3 : 0];
    end
  end

  always @(*) begin
    io_masters_1_b_payload_resp = _zz_io_masters_1_b_payload_id[5 : 4];
    if(when_Axi4Crossbar_l1014_3) begin
      io_masters_1_b_payload_resp = io_slaves_0_b_payload_resp;
    end
    if(when_Axi4Crossbar_l1014_4) begin
      io_masters_1_b_payload_resp = io_slaves_1_b_payload_resp;
    end
    if(when_Axi4Crossbar_l1014_5) begin
      io_masters_1_b_payload_resp = decErr_io_axi_b_payload_resp;
    end
  end

  always @(*) begin
    io_masters_1_ar_ready = 1'b0;
    if(when_Axi4Crossbar_l1050) begin
      if(when_Axi4Crossbar_l1053_1) begin
        io_masters_1_ar_ready = io_slaves_0_ar_ready;
      end
    end
    if(when_Axi4Crossbar_l1050_1) begin
      if(when_Axi4Crossbar_l1053_3) begin
        io_masters_1_ar_ready = io_slaves_1_ar_ready;
      end
    end
    if(when_Axi4Crossbar_l1050_2) begin
      if(when_Axi4Crossbar_l1053_5) begin
        io_masters_1_ar_ready = decErr_io_axi_ar_ready;
      end
    end
  end

  always @(*) begin
    io_masters_1_r_valid = 1'b0;
    if(when_Axi4Crossbar_l1097_3) begin
      io_masters_1_r_valid = io_slaves_0_r_valid;
    end
    if(when_Axi4Crossbar_l1097_4) begin
      io_masters_1_r_valid = io_slaves_1_r_valid;
    end
    if(when_Axi4Crossbar_l1097_5) begin
      io_masters_1_r_valid = decErr_io_axi_r_valid;
    end
  end

  assign _zz_io_masters_1_r_payload_data = 39'h0;
  always @(*) begin
    io_masters_1_r_payload_data = _zz_io_masters_1_r_payload_data[31 : 0];
    if(when_Axi4Crossbar_l1097_3) begin
      io_masters_1_r_payload_data = io_slaves_0_r_payload_data;
    end
    if(when_Axi4Crossbar_l1097_4) begin
      io_masters_1_r_payload_data = io_slaves_1_r_payload_data;
    end
    if(when_Axi4Crossbar_l1097_5) begin
      io_masters_1_r_payload_data = decErr_io_axi_r_payload_data;
    end
  end

  always @(*) begin
    io_masters_1_r_payload_id = _zz_io_masters_1_r_payload_data[35 : 32];
    if(when_Axi4Crossbar_l1097_3) begin
      io_masters_1_r_payload_id = io_slaves_0_r_payload_id[3 : 0];
    end
    if(when_Axi4Crossbar_l1097_4) begin
      io_masters_1_r_payload_id = io_slaves_1_r_payload_id[3 : 0];
    end
    if(when_Axi4Crossbar_l1097_5) begin
      io_masters_1_r_payload_id = decErr_io_axi_r_payload_id[3 : 0];
    end
  end

  always @(*) begin
    io_masters_1_r_payload_resp = _zz_io_masters_1_r_payload_data[37 : 36];
    if(when_Axi4Crossbar_l1097_3) begin
      io_masters_1_r_payload_resp = io_slaves_0_r_payload_resp;
    end
    if(when_Axi4Crossbar_l1097_4) begin
      io_masters_1_r_payload_resp = io_slaves_1_r_payload_resp;
    end
    if(when_Axi4Crossbar_l1097_5) begin
      io_masters_1_r_payload_resp = decErr_io_axi_r_payload_resp;
    end
  end

  always @(*) begin
    io_masters_1_r_payload_last = _zz_io_masters_1_r_payload_data[38];
    if(when_Axi4Crossbar_l1097_3) begin
      io_masters_1_r_payload_last = io_slaves_0_r_payload_last;
    end
    if(when_Axi4Crossbar_l1097_4) begin
      io_masters_1_r_payload_last = io_slaves_1_r_payload_last;
    end
    if(when_Axi4Crossbar_l1097_5) begin
      io_masters_1_r_payload_last = decErr_io_axi_r_payload_last;
    end
  end

  always @(*) begin
    io_slaves_0_aw_valid = 1'b0;
    if(when_Axi4Crossbar_l847) begin
      io_slaves_0_aw_valid = 1'b1;
    end
  end

  assign _zz_io_slaves_0_aw_payload_addr = 66'h0;
  always @(*) begin
    io_slaves_0_aw_payload_addr = _zz_io_slaves_0_aw_payload_addr[31 : 0];
    if(when_Axi4Crossbar_l847) begin
      if(when_Axi4Crossbar_l850) begin
        io_slaves_0_aw_payload_addr = io_masters_0_aw_payload_addr;
      end
      if(when_Axi4Crossbar_l850_1) begin
        io_slaves_0_aw_payload_addr = io_masters_1_aw_payload_addr;
      end
    end
  end

  always @(*) begin
    io_slaves_0_aw_payload_id = _zz_io_slaves_0_aw_payload_addr[36 : 32];
    if(when_Axi4Crossbar_l847) begin
      if(when_Axi4Crossbar_l850) begin
        io_slaves_0_aw_payload_id = {_zz_io_slaves_0_aw_payload_id_1,io_masters_0_aw_payload_id};
      end
      if(when_Axi4Crossbar_l850_1) begin
        io_slaves_0_aw_payload_id = {_zz_io_slaves_0_aw_payload_id_1,io_masters_1_aw_payload_id};
      end
    end
  end

  assign io_slaves_0_aw_payload_region = _zz_io_slaves_0_aw_payload_addr[40 : 37];
  always @(*) begin
    io_slaves_0_aw_payload_len = _zz_io_slaves_0_aw_payload_addr[48 : 41];
    if(when_Axi4Crossbar_l847) begin
      if(when_Axi4Crossbar_l850) begin
        io_slaves_0_aw_payload_len = io_masters_0_aw_payload_len;
      end
      if(when_Axi4Crossbar_l850_1) begin
        io_slaves_0_aw_payload_len = io_masters_1_aw_payload_len;
      end
    end
  end

  always @(*) begin
    io_slaves_0_aw_payload_size = _zz_io_slaves_0_aw_payload_addr[51 : 49];
    if(when_Axi4Crossbar_l847) begin
      if(when_Axi4Crossbar_l850) begin
        io_slaves_0_aw_payload_size = io_masters_0_aw_payload_size;
      end
      if(when_Axi4Crossbar_l850_1) begin
        io_slaves_0_aw_payload_size = io_masters_1_aw_payload_size;
      end
    end
  end

  always @(*) begin
    io_slaves_0_aw_payload_burst = _zz_io_slaves_0_aw_payload_addr[53 : 52];
    if(when_Axi4Crossbar_l847) begin
      if(when_Axi4Crossbar_l850) begin
        io_slaves_0_aw_payload_burst = io_masters_0_aw_payload_burst;
      end
      if(when_Axi4Crossbar_l850_1) begin
        io_slaves_0_aw_payload_burst = io_masters_1_aw_payload_burst;
      end
    end
  end

  always @(*) begin
    io_slaves_0_aw_payload_lock = _zz_io_slaves_0_aw_payload_addr[54 : 54];
    if(when_Axi4Crossbar_l847) begin
      if(when_Axi4Crossbar_l850) begin
        io_slaves_0_aw_payload_lock = io_masters_0_aw_payload_lock;
      end
      if(when_Axi4Crossbar_l850_1) begin
        io_slaves_0_aw_payload_lock = io_masters_1_aw_payload_lock;
      end
    end
  end

  always @(*) begin
    io_slaves_0_aw_payload_cache = _zz_io_slaves_0_aw_payload_addr[58 : 55];
    if(when_Axi4Crossbar_l847) begin
      if(when_Axi4Crossbar_l850) begin
        io_slaves_0_aw_payload_cache = io_masters_0_aw_payload_cache;
      end
      if(when_Axi4Crossbar_l850_1) begin
        io_slaves_0_aw_payload_cache = io_masters_1_aw_payload_cache;
      end
    end
  end

  always @(*) begin
    io_slaves_0_aw_payload_qos = _zz_io_slaves_0_aw_payload_addr[62 : 59];
    if(when_Axi4Crossbar_l847) begin
      if(when_Axi4Crossbar_l850) begin
        io_slaves_0_aw_payload_qos = io_masters_0_aw_payload_qos;
      end
      if(when_Axi4Crossbar_l850_1) begin
        io_slaves_0_aw_payload_qos = io_masters_1_aw_payload_qos;
      end
    end
  end

  always @(*) begin
    io_slaves_0_aw_payload_prot = _zz_io_slaves_0_aw_payload_addr[65 : 63];
    if(when_Axi4Crossbar_l847) begin
      if(when_Axi4Crossbar_l850) begin
        io_slaves_0_aw_payload_prot = io_masters_0_aw_payload_prot;
      end
      if(when_Axi4Crossbar_l850_1) begin
        io_slaves_0_aw_payload_prot = io_masters_1_aw_payload_prot;
      end
    end
  end

  always @(*) begin
    io_slaves_0_w_valid = 1'b0;
    if(when_Axi4Crossbar_l847) begin
      if(when_Axi4Crossbar_l850) begin
        if(when_Axi4Crossbar_l864) begin
          io_slaves_0_w_valid = io_masters_0_w_valid;
        end
      end
      if(when_Axi4Crossbar_l850_1) begin
        if(when_Axi4Crossbar_l864_1) begin
          io_slaves_0_w_valid = io_masters_1_w_valid;
        end
      end
    end
    if(when_Axi4Crossbar_l909) begin
      if(when_Axi4Crossbar_l911) begin
        io_slaves_0_w_valid = io_masters_0_w_valid;
      end
      if(when_Axi4Crossbar_l911_1) begin
        io_slaves_0_w_valid = io_masters_1_w_valid;
      end
    end
  end

  assign _zz_io_slaves_0_w_payload_data = 37'h0;
  always @(*) begin
    io_slaves_0_w_payload_data = _zz_io_slaves_0_w_payload_data[31 : 0];
    if(when_Axi4Crossbar_l847) begin
      if(when_Axi4Crossbar_l850) begin
        if(when_Axi4Crossbar_l864) begin
          io_slaves_0_w_payload_data = io_masters_0_w_payload_data;
        end
      end
      if(when_Axi4Crossbar_l850_1) begin
        if(when_Axi4Crossbar_l864_1) begin
          io_slaves_0_w_payload_data = io_masters_1_w_payload_data;
        end
      end
    end
    if(when_Axi4Crossbar_l909) begin
      if(when_Axi4Crossbar_l911) begin
        io_slaves_0_w_payload_data = io_masters_0_w_payload_data;
      end
      if(when_Axi4Crossbar_l911_1) begin
        io_slaves_0_w_payload_data = io_masters_1_w_payload_data;
      end
    end
  end

  always @(*) begin
    io_slaves_0_w_payload_strb = _zz_io_slaves_0_w_payload_data[35 : 32];
    if(when_Axi4Crossbar_l847) begin
      if(when_Axi4Crossbar_l850) begin
        if(when_Axi4Crossbar_l864) begin
          io_slaves_0_w_payload_strb = io_masters_0_w_payload_strb;
        end
      end
      if(when_Axi4Crossbar_l850_1) begin
        if(when_Axi4Crossbar_l864_1) begin
          io_slaves_0_w_payload_strb = io_masters_1_w_payload_strb;
        end
      end
    end
    if(when_Axi4Crossbar_l909) begin
      if(when_Axi4Crossbar_l911) begin
        io_slaves_0_w_payload_strb = io_masters_0_w_payload_strb;
      end
      if(when_Axi4Crossbar_l911_1) begin
        io_slaves_0_w_payload_strb = io_masters_1_w_payload_strb;
      end
    end
  end

  always @(*) begin
    io_slaves_0_w_payload_last = _zz_io_slaves_0_w_payload_data[36];
    if(when_Axi4Crossbar_l847) begin
      if(when_Axi4Crossbar_l850) begin
        if(when_Axi4Crossbar_l864) begin
          io_slaves_0_w_payload_last = io_masters_0_w_payload_last;
        end
      end
      if(when_Axi4Crossbar_l850_1) begin
        if(when_Axi4Crossbar_l864_1) begin
          io_slaves_0_w_payload_last = io_masters_1_w_payload_last;
        end
      end
    end
    if(when_Axi4Crossbar_l909) begin
      if(when_Axi4Crossbar_l911) begin
        io_slaves_0_w_payload_last = io_masters_0_w_payload_last;
      end
      if(when_Axi4Crossbar_l911_1) begin
        io_slaves_0_w_payload_last = io_masters_1_w_payload_last;
      end
    end
  end

  always @(*) begin
    io_slaves_0_b_ready = 1'b0;
    if(when_Axi4Crossbar_l1014) begin
      io_slaves_0_b_ready = io_masters_0_b_ready;
    end
    if(when_Axi4Crossbar_l1014_3) begin
      io_slaves_0_b_ready = io_masters_1_b_ready;
    end
  end

  always @(*) begin
    io_slaves_0_ar_valid = 1'b0;
    if(when_Axi4Crossbar_l1050) begin
      io_slaves_0_ar_valid = 1'b1;
    end
  end

  assign _zz_io_slaves_0_ar_payload_addr = 66'h0;
  always @(*) begin
    io_slaves_0_ar_payload_addr = _zz_io_slaves_0_ar_payload_addr[31 : 0];
    if(when_Axi4Crossbar_l1050) begin
      if(when_Axi4Crossbar_l1053) begin
        io_slaves_0_ar_payload_addr = io_masters_0_ar_payload_addr;
      end
      if(when_Axi4Crossbar_l1053_1) begin
        io_slaves_0_ar_payload_addr = io_masters_1_ar_payload_addr;
      end
    end
  end

  always @(*) begin
    io_slaves_0_ar_payload_id = _zz_io_slaves_0_ar_payload_addr[36 : 32];
    if(when_Axi4Crossbar_l1050) begin
      if(when_Axi4Crossbar_l1053) begin
        io_slaves_0_ar_payload_id = {_zz_io_slaves_0_ar_payload_id_1,io_masters_0_ar_payload_id};
      end
      if(when_Axi4Crossbar_l1053_1) begin
        io_slaves_0_ar_payload_id = {_zz_io_slaves_0_ar_payload_id_1,io_masters_1_ar_payload_id};
      end
    end
  end

  assign io_slaves_0_ar_payload_region = _zz_io_slaves_0_ar_payload_addr[40 : 37];
  always @(*) begin
    io_slaves_0_ar_payload_len = _zz_io_slaves_0_ar_payload_addr[48 : 41];
    if(when_Axi4Crossbar_l1050) begin
      if(when_Axi4Crossbar_l1053) begin
        io_slaves_0_ar_payload_len = io_masters_0_ar_payload_len;
      end
      if(when_Axi4Crossbar_l1053_1) begin
        io_slaves_0_ar_payload_len = io_masters_1_ar_payload_len;
      end
    end
  end

  always @(*) begin
    io_slaves_0_ar_payload_size = _zz_io_slaves_0_ar_payload_addr[51 : 49];
    if(when_Axi4Crossbar_l1050) begin
      if(when_Axi4Crossbar_l1053) begin
        io_slaves_0_ar_payload_size = io_masters_0_ar_payload_size;
      end
      if(when_Axi4Crossbar_l1053_1) begin
        io_slaves_0_ar_payload_size = io_masters_1_ar_payload_size;
      end
    end
  end

  always @(*) begin
    io_slaves_0_ar_payload_burst = _zz_io_slaves_0_ar_payload_addr[53 : 52];
    if(when_Axi4Crossbar_l1050) begin
      if(when_Axi4Crossbar_l1053) begin
        io_slaves_0_ar_payload_burst = io_masters_0_ar_payload_burst;
      end
      if(when_Axi4Crossbar_l1053_1) begin
        io_slaves_0_ar_payload_burst = io_masters_1_ar_payload_burst;
      end
    end
  end

  always @(*) begin
    io_slaves_0_ar_payload_lock = _zz_io_slaves_0_ar_payload_addr[54 : 54];
    if(when_Axi4Crossbar_l1050) begin
      if(when_Axi4Crossbar_l1053) begin
        io_slaves_0_ar_payload_lock = io_masters_0_ar_payload_lock;
      end
      if(when_Axi4Crossbar_l1053_1) begin
        io_slaves_0_ar_payload_lock = io_masters_1_ar_payload_lock;
      end
    end
  end

  always @(*) begin
    io_slaves_0_ar_payload_cache = _zz_io_slaves_0_ar_payload_addr[58 : 55];
    if(when_Axi4Crossbar_l1050) begin
      if(when_Axi4Crossbar_l1053) begin
        io_slaves_0_ar_payload_cache = io_masters_0_ar_payload_cache;
      end
      if(when_Axi4Crossbar_l1053_1) begin
        io_slaves_0_ar_payload_cache = io_masters_1_ar_payload_cache;
      end
    end
  end

  always @(*) begin
    io_slaves_0_ar_payload_qos = _zz_io_slaves_0_ar_payload_addr[62 : 59];
    if(when_Axi4Crossbar_l1050) begin
      if(when_Axi4Crossbar_l1053) begin
        io_slaves_0_ar_payload_qos = io_masters_0_ar_payload_qos;
      end
      if(when_Axi4Crossbar_l1053_1) begin
        io_slaves_0_ar_payload_qos = io_masters_1_ar_payload_qos;
      end
    end
  end

  always @(*) begin
    io_slaves_0_ar_payload_prot = _zz_io_slaves_0_ar_payload_addr[65 : 63];
    if(when_Axi4Crossbar_l1050) begin
      if(when_Axi4Crossbar_l1053) begin
        io_slaves_0_ar_payload_prot = io_masters_0_ar_payload_prot;
      end
      if(when_Axi4Crossbar_l1053_1) begin
        io_slaves_0_ar_payload_prot = io_masters_1_ar_payload_prot;
      end
    end
  end

  always @(*) begin
    io_slaves_0_r_ready = 1'b0;
    if(when_Axi4Crossbar_l1097) begin
      io_slaves_0_r_ready = io_masters_0_r_ready;
    end
    if(when_Axi4Crossbar_l1097_3) begin
      io_slaves_0_r_ready = io_masters_1_r_ready;
    end
  end

  always @(*) begin
    io_slaves_1_aw_valid = 1'b0;
    if(when_Axi4Crossbar_l847_1) begin
      io_slaves_1_aw_valid = 1'b1;
    end
  end

  assign _zz_io_slaves_1_aw_payload_addr = 66'h0;
  always @(*) begin
    io_slaves_1_aw_payload_addr = _zz_io_slaves_1_aw_payload_addr[31 : 0];
    if(when_Axi4Crossbar_l847_1) begin
      if(when_Axi4Crossbar_l850_2) begin
        io_slaves_1_aw_payload_addr = io_masters_0_aw_payload_addr;
      end
      if(when_Axi4Crossbar_l850_3) begin
        io_slaves_1_aw_payload_addr = io_masters_1_aw_payload_addr;
      end
    end
  end

  always @(*) begin
    io_slaves_1_aw_payload_id = _zz_io_slaves_1_aw_payload_addr[36 : 32];
    if(when_Axi4Crossbar_l847_1) begin
      if(when_Axi4Crossbar_l850_2) begin
        io_slaves_1_aw_payload_id = {_zz_io_slaves_1_aw_payload_id_1,io_masters_0_aw_payload_id};
      end
      if(when_Axi4Crossbar_l850_3) begin
        io_slaves_1_aw_payload_id = {_zz_io_slaves_1_aw_payload_id_1,io_masters_1_aw_payload_id};
      end
    end
  end

  assign io_slaves_1_aw_payload_region = _zz_io_slaves_1_aw_payload_addr[40 : 37];
  always @(*) begin
    io_slaves_1_aw_payload_len = _zz_io_slaves_1_aw_payload_addr[48 : 41];
    if(when_Axi4Crossbar_l847_1) begin
      if(when_Axi4Crossbar_l850_2) begin
        io_slaves_1_aw_payload_len = io_masters_0_aw_payload_len;
      end
      if(when_Axi4Crossbar_l850_3) begin
        io_slaves_1_aw_payload_len = io_masters_1_aw_payload_len;
      end
    end
  end

  always @(*) begin
    io_slaves_1_aw_payload_size = _zz_io_slaves_1_aw_payload_addr[51 : 49];
    if(when_Axi4Crossbar_l847_1) begin
      if(when_Axi4Crossbar_l850_2) begin
        io_slaves_1_aw_payload_size = io_masters_0_aw_payload_size;
      end
      if(when_Axi4Crossbar_l850_3) begin
        io_slaves_1_aw_payload_size = io_masters_1_aw_payload_size;
      end
    end
  end

  always @(*) begin
    io_slaves_1_aw_payload_burst = _zz_io_slaves_1_aw_payload_addr[53 : 52];
    if(when_Axi4Crossbar_l847_1) begin
      if(when_Axi4Crossbar_l850_2) begin
        io_slaves_1_aw_payload_burst = io_masters_0_aw_payload_burst;
      end
      if(when_Axi4Crossbar_l850_3) begin
        io_slaves_1_aw_payload_burst = io_masters_1_aw_payload_burst;
      end
    end
  end

  always @(*) begin
    io_slaves_1_aw_payload_lock = _zz_io_slaves_1_aw_payload_addr[54 : 54];
    if(when_Axi4Crossbar_l847_1) begin
      if(when_Axi4Crossbar_l850_2) begin
        io_slaves_1_aw_payload_lock = io_masters_0_aw_payload_lock;
      end
      if(when_Axi4Crossbar_l850_3) begin
        io_slaves_1_aw_payload_lock = io_masters_1_aw_payload_lock;
      end
    end
  end

  always @(*) begin
    io_slaves_1_aw_payload_cache = _zz_io_slaves_1_aw_payload_addr[58 : 55];
    if(when_Axi4Crossbar_l847_1) begin
      if(when_Axi4Crossbar_l850_2) begin
        io_slaves_1_aw_payload_cache = io_masters_0_aw_payload_cache;
      end
      if(when_Axi4Crossbar_l850_3) begin
        io_slaves_1_aw_payload_cache = io_masters_1_aw_payload_cache;
      end
    end
  end

  always @(*) begin
    io_slaves_1_aw_payload_qos = _zz_io_slaves_1_aw_payload_addr[62 : 59];
    if(when_Axi4Crossbar_l847_1) begin
      if(when_Axi4Crossbar_l850_2) begin
        io_slaves_1_aw_payload_qos = io_masters_0_aw_payload_qos;
      end
      if(when_Axi4Crossbar_l850_3) begin
        io_slaves_1_aw_payload_qos = io_masters_1_aw_payload_qos;
      end
    end
  end

  always @(*) begin
    io_slaves_1_aw_payload_prot = _zz_io_slaves_1_aw_payload_addr[65 : 63];
    if(when_Axi4Crossbar_l847_1) begin
      if(when_Axi4Crossbar_l850_2) begin
        io_slaves_1_aw_payload_prot = io_masters_0_aw_payload_prot;
      end
      if(when_Axi4Crossbar_l850_3) begin
        io_slaves_1_aw_payload_prot = io_masters_1_aw_payload_prot;
      end
    end
  end

  always @(*) begin
    io_slaves_1_w_valid = 1'b0;
    if(when_Axi4Crossbar_l847_1) begin
      if(when_Axi4Crossbar_l850_2) begin
        if(when_Axi4Crossbar_l864_2) begin
          io_slaves_1_w_valid = io_masters_0_w_valid;
        end
      end
      if(when_Axi4Crossbar_l850_3) begin
        if(when_Axi4Crossbar_l864_3) begin
          io_slaves_1_w_valid = io_masters_1_w_valid;
        end
      end
    end
    if(when_Axi4Crossbar_l909_1) begin
      if(when_Axi4Crossbar_l911_2) begin
        io_slaves_1_w_valid = io_masters_0_w_valid;
      end
      if(when_Axi4Crossbar_l911_3) begin
        io_slaves_1_w_valid = io_masters_1_w_valid;
      end
    end
  end

  assign _zz_io_slaves_1_w_payload_data = 37'h0;
  always @(*) begin
    io_slaves_1_w_payload_data = _zz_io_slaves_1_w_payload_data[31 : 0];
    if(when_Axi4Crossbar_l847_1) begin
      if(when_Axi4Crossbar_l850_2) begin
        if(when_Axi4Crossbar_l864_2) begin
          io_slaves_1_w_payload_data = io_masters_0_w_payload_data;
        end
      end
      if(when_Axi4Crossbar_l850_3) begin
        if(when_Axi4Crossbar_l864_3) begin
          io_slaves_1_w_payload_data = io_masters_1_w_payload_data;
        end
      end
    end
    if(when_Axi4Crossbar_l909_1) begin
      if(when_Axi4Crossbar_l911_2) begin
        io_slaves_1_w_payload_data = io_masters_0_w_payload_data;
      end
      if(when_Axi4Crossbar_l911_3) begin
        io_slaves_1_w_payload_data = io_masters_1_w_payload_data;
      end
    end
  end

  always @(*) begin
    io_slaves_1_w_payload_strb = _zz_io_slaves_1_w_payload_data[35 : 32];
    if(when_Axi4Crossbar_l847_1) begin
      if(when_Axi4Crossbar_l850_2) begin
        if(when_Axi4Crossbar_l864_2) begin
          io_slaves_1_w_payload_strb = io_masters_0_w_payload_strb;
        end
      end
      if(when_Axi4Crossbar_l850_3) begin
        if(when_Axi4Crossbar_l864_3) begin
          io_slaves_1_w_payload_strb = io_masters_1_w_payload_strb;
        end
      end
    end
    if(when_Axi4Crossbar_l909_1) begin
      if(when_Axi4Crossbar_l911_2) begin
        io_slaves_1_w_payload_strb = io_masters_0_w_payload_strb;
      end
      if(when_Axi4Crossbar_l911_3) begin
        io_slaves_1_w_payload_strb = io_masters_1_w_payload_strb;
      end
    end
  end

  always @(*) begin
    io_slaves_1_w_payload_last = _zz_io_slaves_1_w_payload_data[36];
    if(when_Axi4Crossbar_l847_1) begin
      if(when_Axi4Crossbar_l850_2) begin
        if(when_Axi4Crossbar_l864_2) begin
          io_slaves_1_w_payload_last = io_masters_0_w_payload_last;
        end
      end
      if(when_Axi4Crossbar_l850_3) begin
        if(when_Axi4Crossbar_l864_3) begin
          io_slaves_1_w_payload_last = io_masters_1_w_payload_last;
        end
      end
    end
    if(when_Axi4Crossbar_l909_1) begin
      if(when_Axi4Crossbar_l911_2) begin
        io_slaves_1_w_payload_last = io_masters_0_w_payload_last;
      end
      if(when_Axi4Crossbar_l911_3) begin
        io_slaves_1_w_payload_last = io_masters_1_w_payload_last;
      end
    end
  end

  always @(*) begin
    io_slaves_1_b_ready = 1'b0;
    if(when_Axi4Crossbar_l1014_1) begin
      io_slaves_1_b_ready = io_masters_0_b_ready;
    end
    if(when_Axi4Crossbar_l1014_4) begin
      io_slaves_1_b_ready = io_masters_1_b_ready;
    end
  end

  always @(*) begin
    io_slaves_1_ar_valid = 1'b0;
    if(when_Axi4Crossbar_l1050_1) begin
      io_slaves_1_ar_valid = 1'b1;
    end
  end

  assign _zz_io_slaves_1_ar_payload_addr = 66'h0;
  always @(*) begin
    io_slaves_1_ar_payload_addr = _zz_io_slaves_1_ar_payload_addr[31 : 0];
    if(when_Axi4Crossbar_l1050_1) begin
      if(when_Axi4Crossbar_l1053_2) begin
        io_slaves_1_ar_payload_addr = io_masters_0_ar_payload_addr;
      end
      if(when_Axi4Crossbar_l1053_3) begin
        io_slaves_1_ar_payload_addr = io_masters_1_ar_payload_addr;
      end
    end
  end

  always @(*) begin
    io_slaves_1_ar_payload_id = _zz_io_slaves_1_ar_payload_addr[36 : 32];
    if(when_Axi4Crossbar_l1050_1) begin
      if(when_Axi4Crossbar_l1053_2) begin
        io_slaves_1_ar_payload_id = {_zz_io_slaves_1_ar_payload_id_1,io_masters_0_ar_payload_id};
      end
      if(when_Axi4Crossbar_l1053_3) begin
        io_slaves_1_ar_payload_id = {_zz_io_slaves_1_ar_payload_id_1,io_masters_1_ar_payload_id};
      end
    end
  end

  assign io_slaves_1_ar_payload_region = _zz_io_slaves_1_ar_payload_addr[40 : 37];
  always @(*) begin
    io_slaves_1_ar_payload_len = _zz_io_slaves_1_ar_payload_addr[48 : 41];
    if(when_Axi4Crossbar_l1050_1) begin
      if(when_Axi4Crossbar_l1053_2) begin
        io_slaves_1_ar_payload_len = io_masters_0_ar_payload_len;
      end
      if(when_Axi4Crossbar_l1053_3) begin
        io_slaves_1_ar_payload_len = io_masters_1_ar_payload_len;
      end
    end
  end

  always @(*) begin
    io_slaves_1_ar_payload_size = _zz_io_slaves_1_ar_payload_addr[51 : 49];
    if(when_Axi4Crossbar_l1050_1) begin
      if(when_Axi4Crossbar_l1053_2) begin
        io_slaves_1_ar_payload_size = io_masters_0_ar_payload_size;
      end
      if(when_Axi4Crossbar_l1053_3) begin
        io_slaves_1_ar_payload_size = io_masters_1_ar_payload_size;
      end
    end
  end

  always @(*) begin
    io_slaves_1_ar_payload_burst = _zz_io_slaves_1_ar_payload_addr[53 : 52];
    if(when_Axi4Crossbar_l1050_1) begin
      if(when_Axi4Crossbar_l1053_2) begin
        io_slaves_1_ar_payload_burst = io_masters_0_ar_payload_burst;
      end
      if(when_Axi4Crossbar_l1053_3) begin
        io_slaves_1_ar_payload_burst = io_masters_1_ar_payload_burst;
      end
    end
  end

  always @(*) begin
    io_slaves_1_ar_payload_lock = _zz_io_slaves_1_ar_payload_addr[54 : 54];
    if(when_Axi4Crossbar_l1050_1) begin
      if(when_Axi4Crossbar_l1053_2) begin
        io_slaves_1_ar_payload_lock = io_masters_0_ar_payload_lock;
      end
      if(when_Axi4Crossbar_l1053_3) begin
        io_slaves_1_ar_payload_lock = io_masters_1_ar_payload_lock;
      end
    end
  end

  always @(*) begin
    io_slaves_1_ar_payload_cache = _zz_io_slaves_1_ar_payload_addr[58 : 55];
    if(when_Axi4Crossbar_l1050_1) begin
      if(when_Axi4Crossbar_l1053_2) begin
        io_slaves_1_ar_payload_cache = io_masters_0_ar_payload_cache;
      end
      if(when_Axi4Crossbar_l1053_3) begin
        io_slaves_1_ar_payload_cache = io_masters_1_ar_payload_cache;
      end
    end
  end

  always @(*) begin
    io_slaves_1_ar_payload_qos = _zz_io_slaves_1_ar_payload_addr[62 : 59];
    if(when_Axi4Crossbar_l1050_1) begin
      if(when_Axi4Crossbar_l1053_2) begin
        io_slaves_1_ar_payload_qos = io_masters_0_ar_payload_qos;
      end
      if(when_Axi4Crossbar_l1053_3) begin
        io_slaves_1_ar_payload_qos = io_masters_1_ar_payload_qos;
      end
    end
  end

  always @(*) begin
    io_slaves_1_ar_payload_prot = _zz_io_slaves_1_ar_payload_addr[65 : 63];
    if(when_Axi4Crossbar_l1050_1) begin
      if(when_Axi4Crossbar_l1053_2) begin
        io_slaves_1_ar_payload_prot = io_masters_0_ar_payload_prot;
      end
      if(when_Axi4Crossbar_l1053_3) begin
        io_slaves_1_ar_payload_prot = io_masters_1_ar_payload_prot;
      end
    end
  end

  always @(*) begin
    io_slaves_1_r_ready = 1'b0;
    if(when_Axi4Crossbar_l1097_1) begin
      io_slaves_1_r_ready = io_masters_0_r_ready;
    end
    if(when_Axi4Crossbar_l1097_4) begin
      io_slaves_1_r_ready = io_masters_1_r_ready;
    end
  end

  always @(*) begin
    decErr_io_axi_aw_valid = 1'b0;
    if(when_Axi4Crossbar_l847_2) begin
      decErr_io_axi_aw_valid = 1'b1;
    end
  end

  assign _zz_io_axi_aw_payload_addr = 66'h0;
  always @(*) begin
    decErr_io_axi_aw_payload_addr = _zz_io_axi_aw_payload_addr[31 : 0];
    if(when_Axi4Crossbar_l847_2) begin
      if(when_Axi4Crossbar_l850_4) begin
        decErr_io_axi_aw_payload_addr = io_masters_0_aw_payload_addr;
      end
      if(when_Axi4Crossbar_l850_5) begin
        decErr_io_axi_aw_payload_addr = io_masters_1_aw_payload_addr;
      end
    end
  end

  always @(*) begin
    decErr_io_axi_aw_payload_id = _zz_io_axi_aw_payload_addr[36 : 32];
    if(when_Axi4Crossbar_l847_2) begin
      if(when_Axi4Crossbar_l850_4) begin
        decErr_io_axi_aw_payload_id = {_zz_wrRrPtr_2_1,io_masters_0_aw_payload_id};
      end
      if(when_Axi4Crossbar_l850_5) begin
        decErr_io_axi_aw_payload_id = {_zz_wrRrPtr_2_1,io_masters_1_aw_payload_id};
      end
    end
  end

  assign decErr_io_axi_aw_payload_region = _zz_io_axi_aw_payload_addr[40 : 37];
  always @(*) begin
    decErr_io_axi_aw_payload_len = _zz_io_axi_aw_payload_addr[48 : 41];
    if(when_Axi4Crossbar_l847_2) begin
      if(when_Axi4Crossbar_l850_4) begin
        decErr_io_axi_aw_payload_len = io_masters_0_aw_payload_len;
      end
      if(when_Axi4Crossbar_l850_5) begin
        decErr_io_axi_aw_payload_len = io_masters_1_aw_payload_len;
      end
    end
  end

  always @(*) begin
    decErr_io_axi_aw_payload_size = _zz_io_axi_aw_payload_addr[51 : 49];
    if(when_Axi4Crossbar_l847_2) begin
      if(when_Axi4Crossbar_l850_4) begin
        decErr_io_axi_aw_payload_size = io_masters_0_aw_payload_size;
      end
      if(when_Axi4Crossbar_l850_5) begin
        decErr_io_axi_aw_payload_size = io_masters_1_aw_payload_size;
      end
    end
  end

  always @(*) begin
    decErr_io_axi_aw_payload_burst = _zz_io_axi_aw_payload_addr[53 : 52];
    if(when_Axi4Crossbar_l847_2) begin
      if(when_Axi4Crossbar_l850_4) begin
        decErr_io_axi_aw_payload_burst = io_masters_0_aw_payload_burst;
      end
      if(when_Axi4Crossbar_l850_5) begin
        decErr_io_axi_aw_payload_burst = io_masters_1_aw_payload_burst;
      end
    end
  end

  always @(*) begin
    decErr_io_axi_aw_payload_lock = _zz_io_axi_aw_payload_addr[54 : 54];
    if(when_Axi4Crossbar_l847_2) begin
      if(when_Axi4Crossbar_l850_4) begin
        decErr_io_axi_aw_payload_lock = io_masters_0_aw_payload_lock;
      end
      if(when_Axi4Crossbar_l850_5) begin
        decErr_io_axi_aw_payload_lock = io_masters_1_aw_payload_lock;
      end
    end
  end

  always @(*) begin
    decErr_io_axi_aw_payload_cache = _zz_io_axi_aw_payload_addr[58 : 55];
    if(when_Axi4Crossbar_l847_2) begin
      if(when_Axi4Crossbar_l850_4) begin
        decErr_io_axi_aw_payload_cache = io_masters_0_aw_payload_cache;
      end
      if(when_Axi4Crossbar_l850_5) begin
        decErr_io_axi_aw_payload_cache = io_masters_1_aw_payload_cache;
      end
    end
  end

  always @(*) begin
    decErr_io_axi_aw_payload_qos = _zz_io_axi_aw_payload_addr[62 : 59];
    if(when_Axi4Crossbar_l847_2) begin
      if(when_Axi4Crossbar_l850_4) begin
        decErr_io_axi_aw_payload_qos = io_masters_0_aw_payload_qos;
      end
      if(when_Axi4Crossbar_l850_5) begin
        decErr_io_axi_aw_payload_qos = io_masters_1_aw_payload_qos;
      end
    end
  end

  always @(*) begin
    decErr_io_axi_aw_payload_prot = _zz_io_axi_aw_payload_addr[65 : 63];
    if(when_Axi4Crossbar_l847_2) begin
      if(when_Axi4Crossbar_l850_4) begin
        decErr_io_axi_aw_payload_prot = io_masters_0_aw_payload_prot;
      end
      if(when_Axi4Crossbar_l850_5) begin
        decErr_io_axi_aw_payload_prot = io_masters_1_aw_payload_prot;
      end
    end
  end

  always @(*) begin
    decErr_io_axi_w_valid = 1'b0;
    if(when_Axi4Crossbar_l847_2) begin
      if(when_Axi4Crossbar_l850_4) begin
        if(when_Axi4Crossbar_l864_4) begin
          decErr_io_axi_w_valid = io_masters_0_w_valid;
        end
      end
      if(when_Axi4Crossbar_l850_5) begin
        if(when_Axi4Crossbar_l864_5) begin
          decErr_io_axi_w_valid = io_masters_1_w_valid;
        end
      end
    end
    if(when_Axi4Crossbar_l909_2) begin
      if(when_Axi4Crossbar_l911_4) begin
        decErr_io_axi_w_valid = io_masters_0_w_valid;
      end
      if(when_Axi4Crossbar_l911_5) begin
        decErr_io_axi_w_valid = io_masters_1_w_valid;
      end
    end
  end

  assign _zz_io_axi_w_payload_data = 37'h0;
  always @(*) begin
    decErr_io_axi_w_payload_data = _zz_io_axi_w_payload_data[31 : 0];
    if(when_Axi4Crossbar_l847_2) begin
      if(when_Axi4Crossbar_l850_4) begin
        if(when_Axi4Crossbar_l864_4) begin
          decErr_io_axi_w_payload_data = io_masters_0_w_payload_data;
        end
      end
      if(when_Axi4Crossbar_l850_5) begin
        if(when_Axi4Crossbar_l864_5) begin
          decErr_io_axi_w_payload_data = io_masters_1_w_payload_data;
        end
      end
    end
    if(when_Axi4Crossbar_l909_2) begin
      if(when_Axi4Crossbar_l911_4) begin
        decErr_io_axi_w_payload_data = io_masters_0_w_payload_data;
      end
      if(when_Axi4Crossbar_l911_5) begin
        decErr_io_axi_w_payload_data = io_masters_1_w_payload_data;
      end
    end
  end

  always @(*) begin
    decErr_io_axi_w_payload_strb = _zz_io_axi_w_payload_data[35 : 32];
    if(when_Axi4Crossbar_l847_2) begin
      if(when_Axi4Crossbar_l850_4) begin
        if(when_Axi4Crossbar_l864_4) begin
          decErr_io_axi_w_payload_strb = io_masters_0_w_payload_strb;
        end
      end
      if(when_Axi4Crossbar_l850_5) begin
        if(when_Axi4Crossbar_l864_5) begin
          decErr_io_axi_w_payload_strb = io_masters_1_w_payload_strb;
        end
      end
    end
    if(when_Axi4Crossbar_l909_2) begin
      if(when_Axi4Crossbar_l911_4) begin
        decErr_io_axi_w_payload_strb = io_masters_0_w_payload_strb;
      end
      if(when_Axi4Crossbar_l911_5) begin
        decErr_io_axi_w_payload_strb = io_masters_1_w_payload_strb;
      end
    end
  end

  always @(*) begin
    decErr_io_axi_w_payload_last = _zz_io_axi_w_payload_data[36];
    if(when_Axi4Crossbar_l847_2) begin
      if(when_Axi4Crossbar_l850_4) begin
        if(when_Axi4Crossbar_l864_4) begin
          decErr_io_axi_w_payload_last = io_masters_0_w_payload_last;
        end
      end
      if(when_Axi4Crossbar_l850_5) begin
        if(when_Axi4Crossbar_l864_5) begin
          decErr_io_axi_w_payload_last = io_masters_1_w_payload_last;
        end
      end
    end
    if(when_Axi4Crossbar_l909_2) begin
      if(when_Axi4Crossbar_l911_4) begin
        decErr_io_axi_w_payload_last = io_masters_0_w_payload_last;
      end
      if(when_Axi4Crossbar_l911_5) begin
        decErr_io_axi_w_payload_last = io_masters_1_w_payload_last;
      end
    end
  end

  always @(*) begin
    decErr_io_axi_b_ready = 1'b0;
    if(when_Axi4Crossbar_l1014_2) begin
      decErr_io_axi_b_ready = io_masters_0_b_ready;
    end
    if(when_Axi4Crossbar_l1014_5) begin
      decErr_io_axi_b_ready = io_masters_1_b_ready;
    end
  end

  always @(*) begin
    decErr_io_axi_ar_valid = 1'b0;
    if(when_Axi4Crossbar_l1050_2) begin
      decErr_io_axi_ar_valid = 1'b1;
    end
  end

  assign _zz_io_axi_ar_payload_addr = 66'h0;
  always @(*) begin
    decErr_io_axi_ar_payload_addr = _zz_io_axi_ar_payload_addr[31 : 0];
    if(when_Axi4Crossbar_l1050_2) begin
      if(when_Axi4Crossbar_l1053_4) begin
        decErr_io_axi_ar_payload_addr = io_masters_0_ar_payload_addr;
      end
      if(when_Axi4Crossbar_l1053_5) begin
        decErr_io_axi_ar_payload_addr = io_masters_1_ar_payload_addr;
      end
    end
  end

  always @(*) begin
    decErr_io_axi_ar_payload_id = _zz_io_axi_ar_payload_addr[36 : 32];
    if(when_Axi4Crossbar_l1050_2) begin
      if(when_Axi4Crossbar_l1053_4) begin
        decErr_io_axi_ar_payload_id = {_zz_rdRrPtr_2_1,io_masters_0_ar_payload_id};
      end
      if(when_Axi4Crossbar_l1053_5) begin
        decErr_io_axi_ar_payload_id = {_zz_rdRrPtr_2_1,io_masters_1_ar_payload_id};
      end
    end
  end

  assign decErr_io_axi_ar_payload_region = _zz_io_axi_ar_payload_addr[40 : 37];
  always @(*) begin
    decErr_io_axi_ar_payload_len = _zz_io_axi_ar_payload_addr[48 : 41];
    if(when_Axi4Crossbar_l1050_2) begin
      if(when_Axi4Crossbar_l1053_4) begin
        decErr_io_axi_ar_payload_len = io_masters_0_ar_payload_len;
      end
      if(when_Axi4Crossbar_l1053_5) begin
        decErr_io_axi_ar_payload_len = io_masters_1_ar_payload_len;
      end
    end
  end

  always @(*) begin
    decErr_io_axi_ar_payload_size = _zz_io_axi_ar_payload_addr[51 : 49];
    if(when_Axi4Crossbar_l1050_2) begin
      if(when_Axi4Crossbar_l1053_4) begin
        decErr_io_axi_ar_payload_size = io_masters_0_ar_payload_size;
      end
      if(when_Axi4Crossbar_l1053_5) begin
        decErr_io_axi_ar_payload_size = io_masters_1_ar_payload_size;
      end
    end
  end

  always @(*) begin
    decErr_io_axi_ar_payload_burst = _zz_io_axi_ar_payload_addr[53 : 52];
    if(when_Axi4Crossbar_l1050_2) begin
      if(when_Axi4Crossbar_l1053_4) begin
        decErr_io_axi_ar_payload_burst = io_masters_0_ar_payload_burst;
      end
      if(when_Axi4Crossbar_l1053_5) begin
        decErr_io_axi_ar_payload_burst = io_masters_1_ar_payload_burst;
      end
    end
  end

  always @(*) begin
    decErr_io_axi_ar_payload_lock = _zz_io_axi_ar_payload_addr[54 : 54];
    if(when_Axi4Crossbar_l1050_2) begin
      if(when_Axi4Crossbar_l1053_4) begin
        decErr_io_axi_ar_payload_lock = io_masters_0_ar_payload_lock;
      end
      if(when_Axi4Crossbar_l1053_5) begin
        decErr_io_axi_ar_payload_lock = io_masters_1_ar_payload_lock;
      end
    end
  end

  always @(*) begin
    decErr_io_axi_ar_payload_cache = _zz_io_axi_ar_payload_addr[58 : 55];
    if(when_Axi4Crossbar_l1050_2) begin
      if(when_Axi4Crossbar_l1053_4) begin
        decErr_io_axi_ar_payload_cache = io_masters_0_ar_payload_cache;
      end
      if(when_Axi4Crossbar_l1053_5) begin
        decErr_io_axi_ar_payload_cache = io_masters_1_ar_payload_cache;
      end
    end
  end

  always @(*) begin
    decErr_io_axi_ar_payload_qos = _zz_io_axi_ar_payload_addr[62 : 59];
    if(when_Axi4Crossbar_l1050_2) begin
      if(when_Axi4Crossbar_l1053_4) begin
        decErr_io_axi_ar_payload_qos = io_masters_0_ar_payload_qos;
      end
      if(when_Axi4Crossbar_l1053_5) begin
        decErr_io_axi_ar_payload_qos = io_masters_1_ar_payload_qos;
      end
    end
  end

  always @(*) begin
    decErr_io_axi_ar_payload_prot = _zz_io_axi_ar_payload_addr[65 : 63];
    if(when_Axi4Crossbar_l1050_2) begin
      if(when_Axi4Crossbar_l1053_4) begin
        decErr_io_axi_ar_payload_prot = io_masters_0_ar_payload_prot;
      end
      if(when_Axi4Crossbar_l1053_5) begin
        decErr_io_axi_ar_payload_prot = io_masters_1_ar_payload_prot;
      end
    end
  end

  always @(*) begin
    decErr_io_axi_r_ready = 1'b0;
    if(when_Axi4Crossbar_l1097_2) begin
      decErr_io_axi_r_ready = io_masters_0_r_ready;
    end
    if(when_Axi4Crossbar_l1097_5) begin
      decErr_io_axi_r_ready = io_masters_1_r_ready;
    end
  end

  assign _zz_when_Axi4Crossbar_l847_13 = io_masters_0_aw_payload_id;
  assign _zz_when_Axi4Crossbar_l847_14 = (_zz_when_Axi4Crossbar_l777 && (_zz_when_Axi4Crossbar_l777_4 == _zz_when_Axi4Crossbar_l847_13));
  assign _zz_when_Axi4Crossbar_l847_15 = (_zz_when_Axi4Crossbar_l777_1 && (_zz_when_Axi4Crossbar_l777_5 == _zz_when_Axi4Crossbar_l847_13));
  assign _zz_when_Axi4Crossbar_l847_16 = (_zz_when_Axi4Crossbar_l847_14 || _zz_when_Axi4Crossbar_l847_15);
  always @(*) begin
    _zz_when_Axi4Crossbar_l847_17[0] = (! _zz_when_Axi4Crossbar_l777);
    _zz_when_Axi4Crossbar_l847_17[1] = (! _zz_when_Axi4Crossbar_l777_1);
  end

  always @(*) begin
    _zz_when_Axi4Crossbar_l847_18[0] = ((((_zz_when_Axi4Crossbar_l847_14 && (_zz_when_Axi4Crossbar_l847_3 == 2'b00)) && (_zz_when_Axi4Crossbar_l784 != 3'b100)) || ((_zz_when_Axi4Crossbar_l847_15 && (_zz_when_Axi4Crossbar_l847_4 == 2'b00)) && (_zz_when_Axi4Crossbar_l784_1 != 3'b100))) || ((! _zz_when_Axi4Crossbar_l847_16) && (|_zz_when_Axi4Crossbar_l847_17)));
    _zz_when_Axi4Crossbar_l847_18[1] = ((((_zz_when_Axi4Crossbar_l847_14 && (_zz_when_Axi4Crossbar_l847_3 == 2'b01)) && (_zz_when_Axi4Crossbar_l784 != 3'b100)) || ((_zz_when_Axi4Crossbar_l847_15 && (_zz_when_Axi4Crossbar_l847_4 == 2'b01)) && (_zz_when_Axi4Crossbar_l784_1 != 3'b100))) || ((! _zz_when_Axi4Crossbar_l847_16) && (|_zz_when_Axi4Crossbar_l847_17)));
    _zz_when_Axi4Crossbar_l847_18[2] = ((((_zz_when_Axi4Crossbar_l847_14 && (_zz_when_Axi4Crossbar_l847_3 == 2'b10)) && (_zz_when_Axi4Crossbar_l784 != 3'b100)) || ((_zz_when_Axi4Crossbar_l847_15 && (_zz_when_Axi4Crossbar_l847_4 == 2'b10)) && (_zz_when_Axi4Crossbar_l784_1 != 3'b100))) || ((! _zz_when_Axi4Crossbar_l847_16) && (|_zz_when_Axi4Crossbar_l847_17)));
  end

  always @(*) begin
    _zz_when_Axi4Crossbar_l847_11[0] = (_zz_when_Axi4Crossbar_l847_18[0] && ((_zz_when_Axi4Crossbar_l847_7 == 3'b000) || (_zz_when_Axi4Crossbar_l847_9 == 2'b00)));
    _zz_when_Axi4Crossbar_l847_11[1] = (_zz_when_Axi4Crossbar_l847_18[1] && ((_zz_when_Axi4Crossbar_l847_7 == 3'b000) || (_zz_when_Axi4Crossbar_l847_9 == 2'b01)));
    _zz_when_Axi4Crossbar_l847_11[2] = (_zz_when_Axi4Crossbar_l847_18[2] && ((_zz_when_Axi4Crossbar_l847_7 == 3'b000) || (_zz_when_Axi4Crossbar_l847_9 == 2'b10)));
  end

  assign _zz_when_Axi4Crossbar_l1050_9 = io_masters_0_ar_payload_id;
  assign _zz_when_Axi4Crossbar_l1050_10 = (_zz_when_Axi4Crossbar_l777_8 && (_zz_when_Axi4Crossbar_l777_12 == _zz_when_Axi4Crossbar_l1050_9));
  assign _zz_when_Axi4Crossbar_l1050_11 = (_zz_when_Axi4Crossbar_l777_9 && (_zz_when_Axi4Crossbar_l777_13 == _zz_when_Axi4Crossbar_l1050_9));
  assign _zz_when_Axi4Crossbar_l1050_12 = (_zz_when_Axi4Crossbar_l1050_10 || _zz_when_Axi4Crossbar_l1050_11);
  always @(*) begin
    _zz_when_Axi4Crossbar_l1050_13[0] = (! _zz_when_Axi4Crossbar_l777_8);
    _zz_when_Axi4Crossbar_l1050_13[1] = (! _zz_when_Axi4Crossbar_l777_9);
  end

  always @(*) begin
    _zz_when_Axi4Crossbar_l1050_14[0] = ((((_zz_when_Axi4Crossbar_l1050_10 && (_zz_when_Axi4Crossbar_l1050_3 == 2'b00)) && (_zz_when_Axi4Crossbar_l784_4 != 3'b100)) || ((_zz_when_Axi4Crossbar_l1050_11 && (_zz_when_Axi4Crossbar_l1050_4 == 2'b00)) && (_zz_when_Axi4Crossbar_l784_5 != 3'b100))) || ((! _zz_when_Axi4Crossbar_l1050_12) && (|_zz_when_Axi4Crossbar_l1050_13)));
    _zz_when_Axi4Crossbar_l1050_14[1] = ((((_zz_when_Axi4Crossbar_l1050_10 && (_zz_when_Axi4Crossbar_l1050_3 == 2'b01)) && (_zz_when_Axi4Crossbar_l784_4 != 3'b100)) || ((_zz_when_Axi4Crossbar_l1050_11 && (_zz_when_Axi4Crossbar_l1050_4 == 2'b01)) && (_zz_when_Axi4Crossbar_l784_5 != 3'b100))) || ((! _zz_when_Axi4Crossbar_l1050_12) && (|_zz_when_Axi4Crossbar_l1050_13)));
    _zz_when_Axi4Crossbar_l1050_14[2] = ((((_zz_when_Axi4Crossbar_l1050_10 && (_zz_when_Axi4Crossbar_l1050_3 == 2'b10)) && (_zz_when_Axi4Crossbar_l784_4 != 3'b100)) || ((_zz_when_Axi4Crossbar_l1050_11 && (_zz_when_Axi4Crossbar_l1050_4 == 2'b10)) && (_zz_when_Axi4Crossbar_l784_5 != 3'b100))) || ((! _zz_when_Axi4Crossbar_l1050_12) && (|_zz_when_Axi4Crossbar_l1050_13)));
  end

  assign _zz_when_Axi4Crossbar_l1050_7 = _zz_when_Axi4Crossbar_l1050_14;
  assign _zz_when_Axi4Crossbar_l847_19 = io_masters_1_aw_payload_id;
  assign _zz_when_Axi4Crossbar_l847_20 = (_zz_when_Axi4Crossbar_l777_2 && (_zz_when_Axi4Crossbar_l777_6 == _zz_when_Axi4Crossbar_l847_19));
  assign _zz_when_Axi4Crossbar_l847_21 = (_zz_when_Axi4Crossbar_l777_3 && (_zz_when_Axi4Crossbar_l777_7 == _zz_when_Axi4Crossbar_l847_19));
  assign _zz_when_Axi4Crossbar_l847_22 = (_zz_when_Axi4Crossbar_l847_20 || _zz_when_Axi4Crossbar_l847_21);
  always @(*) begin
    _zz_when_Axi4Crossbar_l847_23[0] = (! _zz_when_Axi4Crossbar_l777_2);
    _zz_when_Axi4Crossbar_l847_23[1] = (! _zz_when_Axi4Crossbar_l777_3);
  end

  always @(*) begin
    _zz_when_Axi4Crossbar_l847_24[0] = ((((_zz_when_Axi4Crossbar_l847_20 && (_zz_when_Axi4Crossbar_l847_5 == 2'b00)) && (_zz_when_Axi4Crossbar_l784_2 != 3'b100)) || ((_zz_when_Axi4Crossbar_l847_21 && (_zz_when_Axi4Crossbar_l847_6 == 2'b00)) && (_zz_when_Axi4Crossbar_l784_3 != 3'b100))) || ((! _zz_when_Axi4Crossbar_l847_22) && (|_zz_when_Axi4Crossbar_l847_23)));
    _zz_when_Axi4Crossbar_l847_24[1] = ((((_zz_when_Axi4Crossbar_l847_20 && (_zz_when_Axi4Crossbar_l847_5 == 2'b01)) && (_zz_when_Axi4Crossbar_l784_2 != 3'b100)) || ((_zz_when_Axi4Crossbar_l847_21 && (_zz_when_Axi4Crossbar_l847_6 == 2'b01)) && (_zz_when_Axi4Crossbar_l784_3 != 3'b100))) || ((! _zz_when_Axi4Crossbar_l847_22) && (|_zz_when_Axi4Crossbar_l847_23)));
    _zz_when_Axi4Crossbar_l847_24[2] = ((((_zz_when_Axi4Crossbar_l847_20 && (_zz_when_Axi4Crossbar_l847_5 == 2'b10)) && (_zz_when_Axi4Crossbar_l784_2 != 3'b100)) || ((_zz_when_Axi4Crossbar_l847_21 && (_zz_when_Axi4Crossbar_l847_6 == 2'b10)) && (_zz_when_Axi4Crossbar_l784_3 != 3'b100))) || ((! _zz_when_Axi4Crossbar_l847_22) && (|_zz_when_Axi4Crossbar_l847_23)));
  end

  always @(*) begin
    _zz_when_Axi4Crossbar_l847_12[0] = (_zz_when_Axi4Crossbar_l847_24[0] && ((_zz_when_Axi4Crossbar_l847_8 == 3'b000) || (_zz_when_Axi4Crossbar_l847_10 == 2'b00)));
    _zz_when_Axi4Crossbar_l847_12[1] = (_zz_when_Axi4Crossbar_l847_24[1] && ((_zz_when_Axi4Crossbar_l847_8 == 3'b000) || (_zz_when_Axi4Crossbar_l847_10 == 2'b01)));
    _zz_when_Axi4Crossbar_l847_12[2] = (_zz_when_Axi4Crossbar_l847_24[2] && ((_zz_when_Axi4Crossbar_l847_8 == 3'b000) || (_zz_when_Axi4Crossbar_l847_10 == 2'b10)));
  end

  assign _zz_when_Axi4Crossbar_l1050_15 = io_masters_1_ar_payload_id;
  assign _zz_when_Axi4Crossbar_l1050_16 = (_zz_when_Axi4Crossbar_l777_10 && (_zz_when_Axi4Crossbar_l777_14 == _zz_when_Axi4Crossbar_l1050_15));
  assign _zz_when_Axi4Crossbar_l1050_17 = (_zz_when_Axi4Crossbar_l777_11 && (_zz_when_Axi4Crossbar_l777_15 == _zz_when_Axi4Crossbar_l1050_15));
  assign _zz_when_Axi4Crossbar_l1050_18 = (_zz_when_Axi4Crossbar_l1050_16 || _zz_when_Axi4Crossbar_l1050_17);
  always @(*) begin
    _zz_when_Axi4Crossbar_l1050_19[0] = (! _zz_when_Axi4Crossbar_l777_10);
    _zz_when_Axi4Crossbar_l1050_19[1] = (! _zz_when_Axi4Crossbar_l777_11);
  end

  always @(*) begin
    _zz_when_Axi4Crossbar_l1050_20[0] = ((((_zz_when_Axi4Crossbar_l1050_16 && (_zz_when_Axi4Crossbar_l1050_5 == 2'b00)) && (_zz_when_Axi4Crossbar_l784_6 != 3'b100)) || ((_zz_when_Axi4Crossbar_l1050_17 && (_zz_when_Axi4Crossbar_l1050_6 == 2'b00)) && (_zz_when_Axi4Crossbar_l784_7 != 3'b100))) || ((! _zz_when_Axi4Crossbar_l1050_18) && (|_zz_when_Axi4Crossbar_l1050_19)));
    _zz_when_Axi4Crossbar_l1050_20[1] = ((((_zz_when_Axi4Crossbar_l1050_16 && (_zz_when_Axi4Crossbar_l1050_5 == 2'b01)) && (_zz_when_Axi4Crossbar_l784_6 != 3'b100)) || ((_zz_when_Axi4Crossbar_l1050_17 && (_zz_when_Axi4Crossbar_l1050_6 == 2'b01)) && (_zz_when_Axi4Crossbar_l784_7 != 3'b100))) || ((! _zz_when_Axi4Crossbar_l1050_18) && (|_zz_when_Axi4Crossbar_l1050_19)));
    _zz_when_Axi4Crossbar_l1050_20[2] = ((((_zz_when_Axi4Crossbar_l1050_16 && (_zz_when_Axi4Crossbar_l1050_5 == 2'b10)) && (_zz_when_Axi4Crossbar_l784_6 != 3'b100)) || ((_zz_when_Axi4Crossbar_l1050_17 && (_zz_when_Axi4Crossbar_l1050_6 == 2'b10)) && (_zz_when_Axi4Crossbar_l784_7 != 3'b100))) || ((! _zz_when_Axi4Crossbar_l1050_18) && (|_zz_when_Axi4Crossbar_l1050_19)));
  end

  assign _zz_when_Axi4Crossbar_l1050_8 = _zz_when_Axi4Crossbar_l1050_20;
  assign _zz_when_Axi4Crossbar_l847_25 = (_zz_when_Axi4Crossbar_l847 < 3'b100);
  always @(*) begin
    _zz_when_Axi4Crossbar_l847_27[0] = (io_masters_0_aw_payload_addr[31 : 16] == 16'h0);
    _zz_when_Axi4Crossbar_l847_27[1] = (io_masters_0_aw_payload_addr[31 : 16] == 16'h0001);
  end

  always @(*) begin
    _zz_when_Axi4Crossbar_l847_26[0] = ((io_masters_0_aw_valid && _zz__zz_when_Axi4Crossbar_l847_26[0]) && _zz_when_Axi4Crossbar_l847_11[0]);
    _zz_when_Axi4Crossbar_l847_26[1] = ((io_masters_1_aw_valid && _zz__zz_when_Axi4Crossbar_l847_26_1[0]) && _zz_when_Axi4Crossbar_l847_12[0]);
  end

  always @(*) begin
    _zz_when_Axi4Crossbar_l847_28[0] = (io_masters_1_aw_payload_addr[31 : 16] == 16'h0);
    _zz_when_Axi4Crossbar_l847_28[1] = (io_masters_1_aw_payload_addr[31 : 16] == 16'h0001);
  end

  always @(*) begin
    _zz_when_Axi4Crossbar_l340[0] = (wrRrPtr_0 <= 1'b0);
    _zz_when_Axi4Crossbar_l340[1] = (wrRrPtr_0 <= 1'b1);
  end

  assign _zz_when_Axi4Crossbar_l340_1 = (_zz_when_Axi4Crossbar_l847_26 & _zz_when_Axi4Crossbar_l340);
  assign _zz_when_Axi4Crossbar_l340_2 = _zz_when_Axi4Crossbar_l340_1;
  assign _zz_when_Axi4Crossbar_l340_3 = _zz_when_Axi4Crossbar_l847_26;
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
  assign _zz_when_Axi4Crossbar_l847_29 = (|_zz_when_Axi4Crossbar_l847_26);
  assign _zz_when_Axi4Crossbar_l864_3 = (_zz_when_Axi4Crossbar_l864 == 3'b000);
  assign _zz_when_Axi4Crossbar_l911_3 = _zz_4_spinal_port0;
  assign when_Axi4Crossbar_l847 = (_zz_when_Axi4Crossbar_l847_25 && _zz_when_Axi4Crossbar_l847_29);
  assign when_Axi4Crossbar_l850 = (_zz_io_slaves_0_aw_payload_id_1 == 1'b0);
  assign when_Axi4Crossbar_l864 = (_zz_when_Axi4Crossbar_l864_3 && (! _zz_when_Axi4Crossbar_l864_4));
  assign when_Axi4Crossbar_l850_1 = (_zz_io_slaves_0_aw_payload_id_1 == 1'b1);
  assign when_Axi4Crossbar_l864_1 = (_zz_when_Axi4Crossbar_l864_3 && (! _zz_when_Axi4Crossbar_l864_4));
  assign io_slaves_0_aw_fire = (io_slaves_0_aw_valid && io_slaves_0_aw_ready);
  assign io_slaves_0_w_fire = (io_slaves_0_w_valid && io_slaves_0_w_ready);
  assign _zz_when_Axi4Crossbar_l883 = ((((_zz_when_Axi4Crossbar_l847_25 && _zz_when_Axi4Crossbar_l847_29) && _zz_when_Axi4Crossbar_l864_3) && (! _zz_when_Axi4Crossbar_l864_4)) && io_slaves_0_w_fire);
  assign _zz_when_Axi4Crossbar_l895 = (_zz_when_Axi4Crossbar_l864_4 || (_zz_when_Axi4Crossbar_l883 && io_slaves_0_w_payload_last));
  assign when_Axi4Crossbar_l883 = (_zz_when_Axi4Crossbar_l883 && io_slaves_0_w_payload_last);
  always @(*) begin
    _zz_when_Axi4Crossbar_l990[0] = (_zz_when_Axi4Crossbar_l883 && (_zz_io_slaves_0_aw_payload_id_1 == 1'b0));
    _zz_when_Axi4Crossbar_l990[1] = (_zz_when_Axi4Crossbar_l883_1 && (_zz_io_slaves_1_aw_payload_id_1 == 1'b0));
    _zz_when_Axi4Crossbar_l990[2] = (_zz_when_Axi4Crossbar_l883_2 && (_zz_wrRrPtr_2_1 == 1'b0));
  end

  always @(*) begin
    _zz_when_Axi4Crossbar_l995[0] = ((io_slaves_0_aw_fire && _zz_when_Axi4Crossbar_l895) && (_zz_io_slaves_0_aw_payload_id_1 == 1'b0));
    _zz_when_Axi4Crossbar_l995[1] = ((io_slaves_1_aw_fire && _zz_when_Axi4Crossbar_l895_1) && (_zz_io_slaves_1_aw_payload_id_1 == 1'b0));
    _zz_when_Axi4Crossbar_l995[2] = ((decErr_io_axi_aw_fire && _zz_when_Axi4Crossbar_l895_2) && (_zz_wrRrPtr_2_1 == 1'b0));
  end

  always @(*) begin
    _zz_when_Axi4Crossbar_l990_1[0] = (_zz_when_Axi4Crossbar_l883 && (_zz_io_slaves_0_aw_payload_id_1 == 1'b1));
    _zz_when_Axi4Crossbar_l990_1[1] = (_zz_when_Axi4Crossbar_l883_1 && (_zz_io_slaves_1_aw_payload_id_1 == 1'b1));
    _zz_when_Axi4Crossbar_l990_1[2] = (_zz_when_Axi4Crossbar_l883_2 && (_zz_wrRrPtr_2_1 == 1'b1));
  end

  always @(*) begin
    _zz_when_Axi4Crossbar_l995_1[0] = ((io_slaves_0_aw_fire && _zz_when_Axi4Crossbar_l895) && (_zz_io_slaves_0_aw_payload_id_1 == 1'b1));
    _zz_when_Axi4Crossbar_l995_1[1] = ((io_slaves_1_aw_fire && _zz_when_Axi4Crossbar_l895_1) && (_zz_io_slaves_1_aw_payload_id_1 == 1'b1));
    _zz_when_Axi4Crossbar_l995_1[2] = ((decErr_io_axi_aw_fire && _zz_when_Axi4Crossbar_l895_2) && (_zz_wrRrPtr_2_1 == 1'b1));
  end

  assign when_Axi4Crossbar_l895 = (io_slaves_0_aw_fire && (! _zz_when_Axi4Crossbar_l895));
  assign when_Axi4Crossbar_l909 = (! _zz_when_Axi4Crossbar_l864_3);
  assign when_Axi4Crossbar_l911 = (_zz_when_Axi4Crossbar_l911_3 == 1'b0);
  assign when_Axi4Crossbar_l911_1 = (_zz_when_Axi4Crossbar_l911_3 == 1'b1);
  assign when_Axi4Crossbar_l922 = ((io_slaves_0_w_fire && io_slaves_0_w_payload_last) && (! _zz_when_Axi4Crossbar_l883));
  assign when_Axi4Crossbar_l928 = (when_Axi4Crossbar_l895 && (! when_Axi4Crossbar_l922));
  assign when_Axi4Crossbar_l930 = ((! when_Axi4Crossbar_l895) && when_Axi4Crossbar_l922);
  assign io_slaves_0_b_fire = (io_slaves_0_b_valid && io_slaves_0_b_ready);
  assign when_Axi4Crossbar_l937 = (io_slaves_0_aw_fire && (! io_slaves_0_b_fire));
  assign when_Axi4Crossbar_l939 = ((! io_slaves_0_aw_fire) && io_slaves_0_b_fire);
  assign _zz_when_Axi4Crossbar_l847_30 = (_zz_when_Axi4Crossbar_l847_1 < 3'b100);
  always @(*) begin
    _zz_when_Axi4Crossbar_l847_32[0] = (io_masters_0_aw_payload_addr[31 : 16] == 16'h0);
    _zz_when_Axi4Crossbar_l847_32[1] = (io_masters_0_aw_payload_addr[31 : 16] == 16'h0001);
  end

  always @(*) begin
    _zz_when_Axi4Crossbar_l847_31[0] = ((io_masters_0_aw_valid && _zz__zz_when_Axi4Crossbar_l847_31[1]) && _zz_when_Axi4Crossbar_l847_11[1]);
    _zz_when_Axi4Crossbar_l847_31[1] = ((io_masters_1_aw_valid && _zz__zz_when_Axi4Crossbar_l847_31_1[1]) && _zz_when_Axi4Crossbar_l847_12[1]);
  end

  always @(*) begin
    _zz_when_Axi4Crossbar_l847_33[0] = (io_masters_1_aw_payload_addr[31 : 16] == 16'h0);
    _zz_when_Axi4Crossbar_l847_33[1] = (io_masters_1_aw_payload_addr[31 : 16] == 16'h0001);
  end

  always @(*) begin
    _zz_when_Axi4Crossbar_l340_5[0] = (wrRrPtr_1 <= 1'b0);
    _zz_when_Axi4Crossbar_l340_5[1] = (wrRrPtr_1 <= 1'b1);
  end

  assign _zz_when_Axi4Crossbar_l340_6 = (_zz_when_Axi4Crossbar_l847_31 & _zz_when_Axi4Crossbar_l340_5);
  assign _zz_when_Axi4Crossbar_l340_7 = _zz_when_Axi4Crossbar_l340_6;
  assign _zz_when_Axi4Crossbar_l340_8 = _zz_when_Axi4Crossbar_l847_31;
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
  assign _zz_when_Axi4Crossbar_l847_34 = (|_zz_when_Axi4Crossbar_l847_31);
  assign _zz_when_Axi4Crossbar_l864_5 = (_zz_when_Axi4Crossbar_l864_1 == 3'b000);
  assign _zz_when_Axi4Crossbar_l911_4 = _zz_5_spinal_port0;
  assign when_Axi4Crossbar_l847_1 = (_zz_when_Axi4Crossbar_l847_30 && _zz_when_Axi4Crossbar_l847_34);
  assign when_Axi4Crossbar_l850_2 = (_zz_io_slaves_1_aw_payload_id_1 == 1'b0);
  assign when_Axi4Crossbar_l864_2 = (_zz_when_Axi4Crossbar_l864_5 && (! _zz_when_Axi4Crossbar_l864_6));
  assign when_Axi4Crossbar_l850_3 = (_zz_io_slaves_1_aw_payload_id_1 == 1'b1);
  assign when_Axi4Crossbar_l864_3 = (_zz_when_Axi4Crossbar_l864_5 && (! _zz_when_Axi4Crossbar_l864_6));
  assign io_slaves_1_aw_fire = (io_slaves_1_aw_valid && io_slaves_1_aw_ready);
  assign io_slaves_1_w_fire = (io_slaves_1_w_valid && io_slaves_1_w_ready);
  assign _zz_when_Axi4Crossbar_l883_1 = ((((_zz_when_Axi4Crossbar_l847_30 && _zz_when_Axi4Crossbar_l847_34) && _zz_when_Axi4Crossbar_l864_5) && (! _zz_when_Axi4Crossbar_l864_6)) && io_slaves_1_w_fire);
  assign _zz_when_Axi4Crossbar_l895_1 = (_zz_when_Axi4Crossbar_l864_6 || (_zz_when_Axi4Crossbar_l883_1 && io_slaves_1_w_payload_last));
  assign when_Axi4Crossbar_l883_1 = (_zz_when_Axi4Crossbar_l883_1 && io_slaves_1_w_payload_last);
  assign when_Axi4Crossbar_l895_1 = (io_slaves_1_aw_fire && (! _zz_when_Axi4Crossbar_l895_1));
  assign when_Axi4Crossbar_l909_1 = (! _zz_when_Axi4Crossbar_l864_5);
  assign when_Axi4Crossbar_l911_2 = (_zz_when_Axi4Crossbar_l911_4 == 1'b0);
  assign when_Axi4Crossbar_l911_3 = (_zz_when_Axi4Crossbar_l911_4 == 1'b1);
  assign when_Axi4Crossbar_l922_1 = ((io_slaves_1_w_fire && io_slaves_1_w_payload_last) && (! _zz_when_Axi4Crossbar_l883_1));
  assign when_Axi4Crossbar_l928_1 = (when_Axi4Crossbar_l895_1 && (! when_Axi4Crossbar_l922_1));
  assign when_Axi4Crossbar_l930_1 = ((! when_Axi4Crossbar_l895_1) && when_Axi4Crossbar_l922_1);
  assign io_slaves_1_b_fire = (io_slaves_1_b_valid && io_slaves_1_b_ready);
  assign when_Axi4Crossbar_l937_1 = (io_slaves_1_aw_fire && (! io_slaves_1_b_fire));
  assign when_Axi4Crossbar_l939_1 = ((! io_slaves_1_aw_fire) && io_slaves_1_b_fire);
  assign _zz_when_Axi4Crossbar_l847_35 = (_zz_when_Axi4Crossbar_l847_2 < 3'b100);
  always @(*) begin
    _zz_when_Axi4Crossbar_l847_37[0] = (io_masters_0_aw_payload_addr[31 : 16] == 16'h0);
    _zz_when_Axi4Crossbar_l847_37[1] = (io_masters_0_aw_payload_addr[31 : 16] == 16'h0001);
  end

  always @(*) begin
    _zz_when_Axi4Crossbar_l847_36[0] = ((io_masters_0_aw_valid && _zz__zz_when_Axi4Crossbar_l847_36[2]) && _zz_when_Axi4Crossbar_l847_11[2]);
    _zz_when_Axi4Crossbar_l847_36[1] = ((io_masters_1_aw_valid && _zz__zz_when_Axi4Crossbar_l847_36_1[2]) && _zz_when_Axi4Crossbar_l847_12[2]);
  end

  always @(*) begin
    _zz_when_Axi4Crossbar_l847_38[0] = (io_masters_1_aw_payload_addr[31 : 16] == 16'h0);
    _zz_when_Axi4Crossbar_l847_38[1] = (io_masters_1_aw_payload_addr[31 : 16] == 16'h0001);
  end

  always @(*) begin
    _zz_when_Axi4Crossbar_l340_10[0] = (wrRrPtr_2 <= 1'b0);
    _zz_when_Axi4Crossbar_l340_10[1] = (wrRrPtr_2 <= 1'b1);
  end

  assign _zz_when_Axi4Crossbar_l340_11 = (_zz_when_Axi4Crossbar_l847_36 & _zz_when_Axi4Crossbar_l340_10);
  assign _zz_when_Axi4Crossbar_l340_12 = _zz_when_Axi4Crossbar_l340_11;
  assign _zz_when_Axi4Crossbar_l340_13 = _zz_when_Axi4Crossbar_l847_36;
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
  assign _zz_when_Axi4Crossbar_l847_39 = (|_zz_when_Axi4Crossbar_l847_36);
  assign _zz_when_Axi4Crossbar_l864_7 = (_zz_when_Axi4Crossbar_l864_2 == 3'b000);
  assign _zz_when_Axi4Crossbar_l911_5 = _zz_6_spinal_port0;
  assign when_Axi4Crossbar_l847_2 = (_zz_when_Axi4Crossbar_l847_35 && _zz_when_Axi4Crossbar_l847_39);
  assign when_Axi4Crossbar_l850_4 = (_zz_wrRrPtr_2_1 == 1'b0);
  assign when_Axi4Crossbar_l864_4 = (_zz_when_Axi4Crossbar_l864_7 && (! _zz_when_Axi4Crossbar_l864_8));
  assign when_Axi4Crossbar_l850_5 = (_zz_wrRrPtr_2_1 == 1'b1);
  assign when_Axi4Crossbar_l864_5 = (_zz_when_Axi4Crossbar_l864_7 && (! _zz_when_Axi4Crossbar_l864_8));
  assign decErr_io_axi_aw_fire = (decErr_io_axi_aw_valid && decErr_io_axi_aw_ready);
  assign decErr_io_axi_w_fire = (decErr_io_axi_w_valid && decErr_io_axi_w_ready);
  assign _zz_when_Axi4Crossbar_l883_2 = ((((_zz_when_Axi4Crossbar_l847_35 && _zz_when_Axi4Crossbar_l847_39) && _zz_when_Axi4Crossbar_l864_7) && (! _zz_when_Axi4Crossbar_l864_8)) && decErr_io_axi_w_fire);
  assign _zz_when_Axi4Crossbar_l895_2 = (_zz_when_Axi4Crossbar_l864_8 || (_zz_when_Axi4Crossbar_l883_2 && decErr_io_axi_w_payload_last));
  assign when_Axi4Crossbar_l883_2 = (_zz_when_Axi4Crossbar_l883_2 && decErr_io_axi_w_payload_last);
  assign when_Axi4Crossbar_l895_2 = (decErr_io_axi_aw_fire && (! _zz_when_Axi4Crossbar_l895_2));
  assign when_Axi4Crossbar_l909_2 = (! _zz_when_Axi4Crossbar_l864_7);
  assign when_Axi4Crossbar_l911_4 = (_zz_when_Axi4Crossbar_l911_5 == 1'b0);
  assign when_Axi4Crossbar_l911_5 = (_zz_when_Axi4Crossbar_l911_5 == 1'b1);
  assign when_Axi4Crossbar_l922_2 = ((decErr_io_axi_w_fire && decErr_io_axi_w_payload_last) && (! _zz_when_Axi4Crossbar_l883_2));
  assign when_Axi4Crossbar_l928_2 = (when_Axi4Crossbar_l895_2 && (! when_Axi4Crossbar_l922_2));
  assign when_Axi4Crossbar_l930_2 = ((! when_Axi4Crossbar_l895_2) && when_Axi4Crossbar_l922_2);
  assign decErr_io_axi_b_fire = (decErr_io_axi_b_valid && decErr_io_axi_b_ready);
  assign when_Axi4Crossbar_l937_2 = (decErr_io_axi_aw_fire && (! decErr_io_axi_b_fire));
  assign when_Axi4Crossbar_l939_2 = ((! decErr_io_axi_aw_fire) && decErr_io_axi_b_fire);
  assign _zz_when_Axi4Crossbar_l777_16 = (io_masters_0_aw_valid && io_masters_0_aw_ready);
  assign _zz_when_Axi4Crossbar_l777_17 = io_masters_0_aw_payload_id;
  always @(*) begin
    _zz_when_Axi4Crossbar_l697[0] = (io_masters_0_aw_payload_addr[31 : 16] == 16'h0);
    _zz_when_Axi4Crossbar_l697[1] = (io_masters_0_aw_payload_addr[31 : 16] == 16'h0001);
  end

  assign _zz_when_Axi4Crossbar_l697_1 = {(! (|_zz_when_Axi4Crossbar_l697)),_zz_when_Axi4Crossbar_l697};
  always @(*) begin
    _zz_when_Axi4Crossbar_l847_40 = 2'b00;
    if(when_Axi4Crossbar_l697) begin
      _zz_when_Axi4Crossbar_l847_40 = 2'b00;
    end
    if(when_Axi4Crossbar_l697_1) begin
      _zz_when_Axi4Crossbar_l847_40 = 2'b01;
    end
    if(when_Axi4Crossbar_l697_2) begin
      _zz_when_Axi4Crossbar_l847_40 = 2'b10;
    end
  end

  assign when_Axi4Crossbar_l697 = _zz_when_Axi4Crossbar_l697_1[0];
  assign when_Axi4Crossbar_l697_1 = _zz_when_Axi4Crossbar_l697_1[1];
  assign when_Axi4Crossbar_l697_2 = _zz_when_Axi4Crossbar_l697_1[2];
  assign _zz_when_Axi4Crossbar_l777_18 = (io_masters_0_b_valid && io_masters_0_b_ready);
  assign _zz_when_Axi4Crossbar_l777_19 = io_masters_0_b_payload_id;
  assign _zz_when_Axi4Crossbar_l777_20 = (_zz_when_Axi4Crossbar_l777 && (_zz_when_Axi4Crossbar_l777_4 == _zz_when_Axi4Crossbar_l777_17));
  assign _zz_when_Axi4Crossbar_l777_21 = (_zz_when_Axi4Crossbar_l777_1 && (_zz_when_Axi4Crossbar_l777_5 == _zz_when_Axi4Crossbar_l777_17));
  assign _zz_when_Axi4Crossbar_l777_22 = (_zz_when_Axi4Crossbar_l777_20 || _zz_when_Axi4Crossbar_l777_21);
  always @(*) begin
    _zz_when_Axi4Crossbar_l777_23[0] = (! _zz_when_Axi4Crossbar_l777);
    _zz_when_Axi4Crossbar_l777_23[1] = (! _zz_when_Axi4Crossbar_l777_1);
  end

  assign _zz_when_Axi4Crossbar_l777_24 = _zz_when_Axi4Crossbar_l777_23;
  assign _zz_when_Axi4Crossbar_l777_25 = (_zz_when_Axi4Crossbar_l777_24 & (~ _zz__zz_when_Axi4Crossbar_l777_25));
  assign _zz_when_Axi4Crossbar_l777_26 = ((_zz_when_Axi4Crossbar_l777_16 && (! _zz_when_Axi4Crossbar_l777_22)) && _zz_when_Axi4Crossbar_l777_25[0]);
  assign _zz_when_Axi4Crossbar_l777_27 = (_zz_when_Axi4Crossbar_l777_16 && (_zz_when_Axi4Crossbar_l777_20 || _zz_when_Axi4Crossbar_l777_26));
  assign _zz_when_Axi4Crossbar_l777_28 = ((_zz_when_Axi4Crossbar_l777_18 && (_zz_when_Axi4Crossbar_l777 || _zz_when_Axi4Crossbar_l777_26)) && ((_zz_when_Axi4Crossbar_l777_26 ? _zz_when_Axi4Crossbar_l777_17 : _zz_when_Axi4Crossbar_l777_4) == _zz_when_Axi4Crossbar_l777_19));
  assign when_Axi4Crossbar_l777 = (_zz_when_Axi4Crossbar_l777_27 && (! _zz_when_Axi4Crossbar_l777_28));
  assign when_Axi4Crossbar_l784 = (_zz_when_Axi4Crossbar_l784 == 3'b001);
  assign when_Axi4Crossbar_l782 = ((! _zz_when_Axi4Crossbar_l777_27) && _zz_when_Axi4Crossbar_l777_28);
  assign _zz_when_Axi4Crossbar_l777_29 = ((_zz_when_Axi4Crossbar_l777_16 && (! _zz_when_Axi4Crossbar_l777_22)) && _zz_when_Axi4Crossbar_l777_25[1]);
  assign _zz_when_Axi4Crossbar_l777_30 = (_zz_when_Axi4Crossbar_l777_16 && (_zz_when_Axi4Crossbar_l777_21 || _zz_when_Axi4Crossbar_l777_29));
  assign _zz_when_Axi4Crossbar_l777_31 = ((_zz_when_Axi4Crossbar_l777_18 && (_zz_when_Axi4Crossbar_l777_1 || _zz_when_Axi4Crossbar_l777_29)) && ((_zz_when_Axi4Crossbar_l777_29 ? _zz_when_Axi4Crossbar_l777_17 : _zz_when_Axi4Crossbar_l777_5) == _zz_when_Axi4Crossbar_l777_19));
  assign when_Axi4Crossbar_l777_1 = (_zz_when_Axi4Crossbar_l777_30 && (! _zz_when_Axi4Crossbar_l777_31));
  assign when_Axi4Crossbar_l784_1 = (_zz_when_Axi4Crossbar_l784_1 == 3'b001);
  assign when_Axi4Crossbar_l782_1 = ((! _zz_when_Axi4Crossbar_l777_30) && _zz_when_Axi4Crossbar_l777_31);
  assign _zz_when_Axi4Crossbar_l777_32 = (io_masters_0_ar_valid && io_masters_0_ar_ready);
  assign _zz_when_Axi4Crossbar_l777_33 = io_masters_0_ar_payload_id;
  always @(*) begin
    _zz_when_Axi4Crossbar_l697_2[0] = (io_masters_0_ar_payload_addr[31 : 16] == 16'h0);
    _zz_when_Axi4Crossbar_l697_2[1] = (io_masters_0_ar_payload_addr[31 : 16] == 16'h0001);
  end

  assign _zz_when_Axi4Crossbar_l697_3 = {(! (|_zz_when_Axi4Crossbar_l697_2)),_zz_when_Axi4Crossbar_l697_2};
  always @(*) begin
    _zz_when_Axi4Crossbar_l1050_21 = 2'b00;
    if(when_Axi4Crossbar_l697_3) begin
      _zz_when_Axi4Crossbar_l1050_21 = 2'b00;
    end
    if(when_Axi4Crossbar_l697_4) begin
      _zz_when_Axi4Crossbar_l1050_21 = 2'b01;
    end
    if(when_Axi4Crossbar_l697_5) begin
      _zz_when_Axi4Crossbar_l1050_21 = 2'b10;
    end
  end

  assign when_Axi4Crossbar_l697_3 = _zz_when_Axi4Crossbar_l697_3[0];
  assign when_Axi4Crossbar_l697_4 = _zz_when_Axi4Crossbar_l697_3[1];
  assign when_Axi4Crossbar_l697_5 = _zz_when_Axi4Crossbar_l697_3[2];
  assign _zz_when_Axi4Crossbar_l777_34 = ((io_masters_0_r_valid && io_masters_0_r_ready) && io_masters_0_r_payload_last);
  assign _zz_when_Axi4Crossbar_l777_35 = io_masters_0_r_payload_id;
  assign _zz_when_Axi4Crossbar_l777_36 = (_zz_when_Axi4Crossbar_l777_8 && (_zz_when_Axi4Crossbar_l777_12 == _zz_when_Axi4Crossbar_l777_33));
  assign _zz_when_Axi4Crossbar_l777_37 = (_zz_when_Axi4Crossbar_l777_9 && (_zz_when_Axi4Crossbar_l777_13 == _zz_when_Axi4Crossbar_l777_33));
  assign _zz_when_Axi4Crossbar_l777_38 = (_zz_when_Axi4Crossbar_l777_36 || _zz_when_Axi4Crossbar_l777_37);
  always @(*) begin
    _zz_when_Axi4Crossbar_l777_39[0] = (! _zz_when_Axi4Crossbar_l777_8);
    _zz_when_Axi4Crossbar_l777_39[1] = (! _zz_when_Axi4Crossbar_l777_9);
  end

  assign _zz_when_Axi4Crossbar_l777_40 = _zz_when_Axi4Crossbar_l777_39;
  assign _zz_when_Axi4Crossbar_l777_41 = (_zz_when_Axi4Crossbar_l777_40 & (~ _zz__zz_when_Axi4Crossbar_l777_41));
  assign _zz_when_Axi4Crossbar_l777_42 = ((_zz_when_Axi4Crossbar_l777_32 && (! _zz_when_Axi4Crossbar_l777_38)) && _zz_when_Axi4Crossbar_l777_41[0]);
  assign _zz_when_Axi4Crossbar_l777_43 = (_zz_when_Axi4Crossbar_l777_32 && (_zz_when_Axi4Crossbar_l777_36 || _zz_when_Axi4Crossbar_l777_42));
  assign _zz_when_Axi4Crossbar_l777_44 = ((_zz_when_Axi4Crossbar_l777_34 && (_zz_when_Axi4Crossbar_l777_8 || _zz_when_Axi4Crossbar_l777_42)) && ((_zz_when_Axi4Crossbar_l777_42 ? _zz_when_Axi4Crossbar_l777_33 : _zz_when_Axi4Crossbar_l777_12) == _zz_when_Axi4Crossbar_l777_35));
  assign when_Axi4Crossbar_l777_2 = (_zz_when_Axi4Crossbar_l777_43 && (! _zz_when_Axi4Crossbar_l777_44));
  assign when_Axi4Crossbar_l784_2 = (_zz_when_Axi4Crossbar_l784_4 == 3'b001);
  assign when_Axi4Crossbar_l782_2 = ((! _zz_when_Axi4Crossbar_l777_43) && _zz_when_Axi4Crossbar_l777_44);
  assign _zz_when_Axi4Crossbar_l777_45 = ((_zz_when_Axi4Crossbar_l777_32 && (! _zz_when_Axi4Crossbar_l777_38)) && _zz_when_Axi4Crossbar_l777_41[1]);
  assign _zz_when_Axi4Crossbar_l777_46 = (_zz_when_Axi4Crossbar_l777_32 && (_zz_when_Axi4Crossbar_l777_37 || _zz_when_Axi4Crossbar_l777_45));
  assign _zz_when_Axi4Crossbar_l777_47 = ((_zz_when_Axi4Crossbar_l777_34 && (_zz_when_Axi4Crossbar_l777_9 || _zz_when_Axi4Crossbar_l777_45)) && ((_zz_when_Axi4Crossbar_l777_45 ? _zz_when_Axi4Crossbar_l777_33 : _zz_when_Axi4Crossbar_l777_13) == _zz_when_Axi4Crossbar_l777_35));
  assign when_Axi4Crossbar_l777_3 = (_zz_when_Axi4Crossbar_l777_46 && (! _zz_when_Axi4Crossbar_l777_47));
  assign when_Axi4Crossbar_l784_3 = (_zz_when_Axi4Crossbar_l784_5 == 3'b001);
  assign when_Axi4Crossbar_l782_3 = ((! _zz_when_Axi4Crossbar_l777_46) && _zz_when_Axi4Crossbar_l777_47);
  assign when_Axi4Crossbar_l995 = ((io_masters_0_aw_valid && io_masters_0_aw_ready) && (! (|_zz_when_Axi4Crossbar_l995)));
  assign _zz_when_Axi4Crossbar_l990_2 = (((io_masters_0_w_valid && io_masters_0_w_ready) && io_masters_0_w_payload_last) && (! (|_zz_when_Axi4Crossbar_l990)));
  assign when_Axi4Crossbar_l990 = (when_Axi4Crossbar_l995 && (! _zz_when_Axi4Crossbar_l990_2));
  assign when_Axi4Crossbar_l992 = ((! when_Axi4Crossbar_l995) && _zz_when_Axi4Crossbar_l990_2);
  always @(*) begin
    _zz_when_Axi4Crossbar_l697_4[0] = (io_masters_0_aw_payload_addr[31 : 16] == 16'h0);
    _zz_when_Axi4Crossbar_l697_4[1] = (io_masters_0_aw_payload_addr[31 : 16] == 16'h0001);
  end

  assign _zz_when_Axi4Crossbar_l697_5 = {(! (|_zz_when_Axi4Crossbar_l697_4)),_zz_when_Axi4Crossbar_l697_4};
  always @(*) begin
    _zz_when_Axi4Crossbar_l847_41 = 2'b00;
    if(when_Axi4Crossbar_l697_6) begin
      _zz_when_Axi4Crossbar_l847_41 = 2'b00;
    end
    if(when_Axi4Crossbar_l697_7) begin
      _zz_when_Axi4Crossbar_l847_41 = 2'b01;
    end
    if(when_Axi4Crossbar_l697_8) begin
      _zz_when_Axi4Crossbar_l847_41 = 2'b10;
    end
  end

  assign when_Axi4Crossbar_l697_6 = _zz_when_Axi4Crossbar_l697_5[0];
  assign when_Axi4Crossbar_l697_7 = _zz_when_Axi4Crossbar_l697_5[1];
  assign when_Axi4Crossbar_l697_8 = _zz_when_Axi4Crossbar_l697_5[2];
  assign _zz_when_Axi4Crossbar_l777_48 = (io_masters_1_aw_valid && io_masters_1_aw_ready);
  assign _zz_when_Axi4Crossbar_l777_49 = io_masters_1_aw_payload_id;
  always @(*) begin
    _zz_when_Axi4Crossbar_l697_6[0] = (io_masters_1_aw_payload_addr[31 : 16] == 16'h0);
    _zz_when_Axi4Crossbar_l697_6[1] = (io_masters_1_aw_payload_addr[31 : 16] == 16'h0001);
  end

  assign _zz_when_Axi4Crossbar_l697_7 = {(! (|_zz_when_Axi4Crossbar_l697_6)),_zz_when_Axi4Crossbar_l697_6};
  always @(*) begin
    _zz_when_Axi4Crossbar_l847_42 = 2'b00;
    if(when_Axi4Crossbar_l697_9) begin
      _zz_when_Axi4Crossbar_l847_42 = 2'b00;
    end
    if(when_Axi4Crossbar_l697_10) begin
      _zz_when_Axi4Crossbar_l847_42 = 2'b01;
    end
    if(when_Axi4Crossbar_l697_11) begin
      _zz_when_Axi4Crossbar_l847_42 = 2'b10;
    end
  end

  assign when_Axi4Crossbar_l697_9 = _zz_when_Axi4Crossbar_l697_7[0];
  assign when_Axi4Crossbar_l697_10 = _zz_when_Axi4Crossbar_l697_7[1];
  assign when_Axi4Crossbar_l697_11 = _zz_when_Axi4Crossbar_l697_7[2];
  assign _zz_when_Axi4Crossbar_l777_50 = (io_masters_1_b_valid && io_masters_1_b_ready);
  assign _zz_when_Axi4Crossbar_l777_51 = io_masters_1_b_payload_id;
  assign _zz_when_Axi4Crossbar_l777_52 = (_zz_when_Axi4Crossbar_l777_2 && (_zz_when_Axi4Crossbar_l777_6 == _zz_when_Axi4Crossbar_l777_49));
  assign _zz_when_Axi4Crossbar_l777_53 = (_zz_when_Axi4Crossbar_l777_3 && (_zz_when_Axi4Crossbar_l777_7 == _zz_when_Axi4Crossbar_l777_49));
  assign _zz_when_Axi4Crossbar_l777_54 = (_zz_when_Axi4Crossbar_l777_52 || _zz_when_Axi4Crossbar_l777_53);
  always @(*) begin
    _zz_when_Axi4Crossbar_l777_55[0] = (! _zz_when_Axi4Crossbar_l777_2);
    _zz_when_Axi4Crossbar_l777_55[1] = (! _zz_when_Axi4Crossbar_l777_3);
  end

  assign _zz_when_Axi4Crossbar_l777_56 = _zz_when_Axi4Crossbar_l777_55;
  assign _zz_when_Axi4Crossbar_l777_57 = (_zz_when_Axi4Crossbar_l777_56 & (~ _zz__zz_when_Axi4Crossbar_l777_57));
  assign _zz_when_Axi4Crossbar_l777_58 = ((_zz_when_Axi4Crossbar_l777_48 && (! _zz_when_Axi4Crossbar_l777_54)) && _zz_when_Axi4Crossbar_l777_57[0]);
  assign _zz_when_Axi4Crossbar_l777_59 = (_zz_when_Axi4Crossbar_l777_48 && (_zz_when_Axi4Crossbar_l777_52 || _zz_when_Axi4Crossbar_l777_58));
  assign _zz_when_Axi4Crossbar_l777_60 = ((_zz_when_Axi4Crossbar_l777_50 && (_zz_when_Axi4Crossbar_l777_2 || _zz_when_Axi4Crossbar_l777_58)) && ((_zz_when_Axi4Crossbar_l777_58 ? _zz_when_Axi4Crossbar_l777_49 : _zz_when_Axi4Crossbar_l777_6) == _zz_when_Axi4Crossbar_l777_51));
  assign when_Axi4Crossbar_l777_4 = (_zz_when_Axi4Crossbar_l777_59 && (! _zz_when_Axi4Crossbar_l777_60));
  assign when_Axi4Crossbar_l784_4 = (_zz_when_Axi4Crossbar_l784_2 == 3'b001);
  assign when_Axi4Crossbar_l782_4 = ((! _zz_when_Axi4Crossbar_l777_59) && _zz_when_Axi4Crossbar_l777_60);
  assign _zz_when_Axi4Crossbar_l777_61 = ((_zz_when_Axi4Crossbar_l777_48 && (! _zz_when_Axi4Crossbar_l777_54)) && _zz_when_Axi4Crossbar_l777_57[1]);
  assign _zz_when_Axi4Crossbar_l777_62 = (_zz_when_Axi4Crossbar_l777_48 && (_zz_when_Axi4Crossbar_l777_53 || _zz_when_Axi4Crossbar_l777_61));
  assign _zz_when_Axi4Crossbar_l777_63 = ((_zz_when_Axi4Crossbar_l777_50 && (_zz_when_Axi4Crossbar_l777_3 || _zz_when_Axi4Crossbar_l777_61)) && ((_zz_when_Axi4Crossbar_l777_61 ? _zz_when_Axi4Crossbar_l777_49 : _zz_when_Axi4Crossbar_l777_7) == _zz_when_Axi4Crossbar_l777_51));
  assign when_Axi4Crossbar_l777_5 = (_zz_when_Axi4Crossbar_l777_62 && (! _zz_when_Axi4Crossbar_l777_63));
  assign when_Axi4Crossbar_l784_5 = (_zz_when_Axi4Crossbar_l784_3 == 3'b001);
  assign when_Axi4Crossbar_l782_5 = ((! _zz_when_Axi4Crossbar_l777_62) && _zz_when_Axi4Crossbar_l777_63);
  assign _zz_when_Axi4Crossbar_l777_64 = (io_masters_1_ar_valid && io_masters_1_ar_ready);
  assign _zz_when_Axi4Crossbar_l777_65 = io_masters_1_ar_payload_id;
  always @(*) begin
    _zz_when_Axi4Crossbar_l697_8[0] = (io_masters_1_ar_payload_addr[31 : 16] == 16'h0);
    _zz_when_Axi4Crossbar_l697_8[1] = (io_masters_1_ar_payload_addr[31 : 16] == 16'h0001);
  end

  assign _zz_when_Axi4Crossbar_l697_9 = {(! (|_zz_when_Axi4Crossbar_l697_8)),_zz_when_Axi4Crossbar_l697_8};
  always @(*) begin
    _zz_when_Axi4Crossbar_l1050_22 = 2'b00;
    if(when_Axi4Crossbar_l697_12) begin
      _zz_when_Axi4Crossbar_l1050_22 = 2'b00;
    end
    if(when_Axi4Crossbar_l697_13) begin
      _zz_when_Axi4Crossbar_l1050_22 = 2'b01;
    end
    if(when_Axi4Crossbar_l697_14) begin
      _zz_when_Axi4Crossbar_l1050_22 = 2'b10;
    end
  end

  assign when_Axi4Crossbar_l697_12 = _zz_when_Axi4Crossbar_l697_9[0];
  assign when_Axi4Crossbar_l697_13 = _zz_when_Axi4Crossbar_l697_9[1];
  assign when_Axi4Crossbar_l697_14 = _zz_when_Axi4Crossbar_l697_9[2];
  assign _zz_when_Axi4Crossbar_l777_66 = ((io_masters_1_r_valid && io_masters_1_r_ready) && io_masters_1_r_payload_last);
  assign _zz_when_Axi4Crossbar_l777_67 = io_masters_1_r_payload_id;
  assign _zz_when_Axi4Crossbar_l777_68 = (_zz_when_Axi4Crossbar_l777_10 && (_zz_when_Axi4Crossbar_l777_14 == _zz_when_Axi4Crossbar_l777_65));
  assign _zz_when_Axi4Crossbar_l777_69 = (_zz_when_Axi4Crossbar_l777_11 && (_zz_when_Axi4Crossbar_l777_15 == _zz_when_Axi4Crossbar_l777_65));
  assign _zz_when_Axi4Crossbar_l777_70 = (_zz_when_Axi4Crossbar_l777_68 || _zz_when_Axi4Crossbar_l777_69);
  always @(*) begin
    _zz_when_Axi4Crossbar_l777_71[0] = (! _zz_when_Axi4Crossbar_l777_10);
    _zz_when_Axi4Crossbar_l777_71[1] = (! _zz_when_Axi4Crossbar_l777_11);
  end

  assign _zz_when_Axi4Crossbar_l777_72 = _zz_when_Axi4Crossbar_l777_71;
  assign _zz_when_Axi4Crossbar_l777_73 = (_zz_when_Axi4Crossbar_l777_72 & (~ _zz__zz_when_Axi4Crossbar_l777_73));
  assign _zz_when_Axi4Crossbar_l777_74 = ((_zz_when_Axi4Crossbar_l777_64 && (! _zz_when_Axi4Crossbar_l777_70)) && _zz_when_Axi4Crossbar_l777_73[0]);
  assign _zz_when_Axi4Crossbar_l777_75 = (_zz_when_Axi4Crossbar_l777_64 && (_zz_when_Axi4Crossbar_l777_68 || _zz_when_Axi4Crossbar_l777_74));
  assign _zz_when_Axi4Crossbar_l777_76 = ((_zz_when_Axi4Crossbar_l777_66 && (_zz_when_Axi4Crossbar_l777_10 || _zz_when_Axi4Crossbar_l777_74)) && ((_zz_when_Axi4Crossbar_l777_74 ? _zz_when_Axi4Crossbar_l777_65 : _zz_when_Axi4Crossbar_l777_14) == _zz_when_Axi4Crossbar_l777_67));
  assign when_Axi4Crossbar_l777_6 = (_zz_when_Axi4Crossbar_l777_75 && (! _zz_when_Axi4Crossbar_l777_76));
  assign when_Axi4Crossbar_l784_6 = (_zz_when_Axi4Crossbar_l784_6 == 3'b001);
  assign when_Axi4Crossbar_l782_6 = ((! _zz_when_Axi4Crossbar_l777_75) && _zz_when_Axi4Crossbar_l777_76);
  assign _zz_when_Axi4Crossbar_l777_77 = ((_zz_when_Axi4Crossbar_l777_64 && (! _zz_when_Axi4Crossbar_l777_70)) && _zz_when_Axi4Crossbar_l777_73[1]);
  assign _zz_when_Axi4Crossbar_l777_78 = (_zz_when_Axi4Crossbar_l777_64 && (_zz_when_Axi4Crossbar_l777_69 || _zz_when_Axi4Crossbar_l777_77));
  assign _zz_when_Axi4Crossbar_l777_79 = ((_zz_when_Axi4Crossbar_l777_66 && (_zz_when_Axi4Crossbar_l777_11 || _zz_when_Axi4Crossbar_l777_77)) && ((_zz_when_Axi4Crossbar_l777_77 ? _zz_when_Axi4Crossbar_l777_65 : _zz_when_Axi4Crossbar_l777_15) == _zz_when_Axi4Crossbar_l777_67));
  assign when_Axi4Crossbar_l777_7 = (_zz_when_Axi4Crossbar_l777_78 && (! _zz_when_Axi4Crossbar_l777_79));
  assign when_Axi4Crossbar_l784_7 = (_zz_when_Axi4Crossbar_l784_7 == 3'b001);
  assign when_Axi4Crossbar_l782_7 = ((! _zz_when_Axi4Crossbar_l777_78) && _zz_when_Axi4Crossbar_l777_79);
  assign when_Axi4Crossbar_l995_1 = ((io_masters_1_aw_valid && io_masters_1_aw_ready) && (! (|_zz_when_Axi4Crossbar_l995_1)));
  assign _zz_when_Axi4Crossbar_l990_3 = (((io_masters_1_w_valid && io_masters_1_w_ready) && io_masters_1_w_payload_last) && (! (|_zz_when_Axi4Crossbar_l990_1)));
  assign when_Axi4Crossbar_l990_1 = (when_Axi4Crossbar_l995_1 && (! _zz_when_Axi4Crossbar_l990_3));
  assign when_Axi4Crossbar_l992_1 = ((! when_Axi4Crossbar_l995_1) && _zz_when_Axi4Crossbar_l990_3);
  always @(*) begin
    _zz_when_Axi4Crossbar_l697_10[0] = (io_masters_1_aw_payload_addr[31 : 16] == 16'h0);
    _zz_when_Axi4Crossbar_l697_10[1] = (io_masters_1_aw_payload_addr[31 : 16] == 16'h0001);
  end

  assign _zz_when_Axi4Crossbar_l697_11 = {(! (|_zz_when_Axi4Crossbar_l697_10)),_zz_when_Axi4Crossbar_l697_10};
  always @(*) begin
    _zz_when_Axi4Crossbar_l847_43 = 2'b00;
    if(when_Axi4Crossbar_l697_15) begin
      _zz_when_Axi4Crossbar_l847_43 = 2'b00;
    end
    if(when_Axi4Crossbar_l697_16) begin
      _zz_when_Axi4Crossbar_l847_43 = 2'b01;
    end
    if(when_Axi4Crossbar_l697_17) begin
      _zz_when_Axi4Crossbar_l847_43 = 2'b10;
    end
  end

  assign when_Axi4Crossbar_l697_15 = _zz_when_Axi4Crossbar_l697_11[0];
  assign when_Axi4Crossbar_l697_16 = _zz_when_Axi4Crossbar_l697_11[1];
  assign when_Axi4Crossbar_l697_17 = _zz_when_Axi4Crossbar_l697_11[2];
  always @(*) begin
    _zz_respLockOH[0] = (io_slaves_0_b_valid && (_zz__zz_respLockOH == 1'b0));
    _zz_respLockOH[1] = (io_slaves_1_b_valid && (_zz__zz_respLockOH_1 == 1'b0));
    _zz_respLockOH[2] = (decErr_io_axi_b_valid && (_zz__zz_respLockOH_2 == 1'b0));
  end

  assign _zz_respLockOH_1 = _zz_respLockOH;
  assign _zz_respLockOH_2 = (respLock ? respLockOH : (_zz_respLockOH_1 & (~ _zz__zz_respLockOH_2_1)));
  assign when_Axi4Crossbar_l311 = ((|_zz_respLockOH_2) && (! io_masters_0_b_ready));
  assign when_Axi4Crossbar_l1014 = _zz_respLockOH_2[0];
  assign when_Axi4Crossbar_l1014_1 = _zz_respLockOH_2[1];
  assign when_Axi4Crossbar_l1014_2 = _zz_respLockOH_2[2];
  always @(*) begin
    _zz_respLockOH_3[0] = (io_slaves_0_b_valid && (_zz__zz_respLockOH_3 == 1'b1));
    _zz_respLockOH_3[1] = (io_slaves_1_b_valid && (_zz__zz_respLockOH_3_1 == 1'b1));
    _zz_respLockOH_3[2] = (decErr_io_axi_b_valid && (_zz__zz_respLockOH_3_2 == 1'b1));
  end

  assign _zz_respLockOH_4 = _zz_respLockOH_3;
  assign _zz_respLockOH_5 = (respLock_1 ? respLockOH_1 : (_zz_respLockOH_4 & (~ _zz__zz_respLockOH_5)));
  assign when_Axi4Crossbar_l311_1 = ((|_zz_respLockOH_5) && (! io_masters_1_b_ready));
  assign when_Axi4Crossbar_l1014_3 = _zz_respLockOH_5[0];
  assign when_Axi4Crossbar_l1014_4 = _zz_respLockOH_5[1];
  assign when_Axi4Crossbar_l1014_5 = _zz_respLockOH_5[2];
  always @(*) begin
    _zz_when_Axi4Crossbar_l1050_24[0] = (io_masters_0_ar_payload_addr[31 : 16] == 16'h0);
    _zz_when_Axi4Crossbar_l1050_24[1] = (io_masters_0_ar_payload_addr[31 : 16] == 16'h0001);
  end

  always @(*) begin
    _zz_when_Axi4Crossbar_l1050_23[0] = ((io_masters_0_ar_valid && _zz__zz_when_Axi4Crossbar_l1050_23[0]) && _zz_when_Axi4Crossbar_l1050_7[0]);
    _zz_when_Axi4Crossbar_l1050_23[1] = ((io_masters_1_ar_valid && _zz__zz_when_Axi4Crossbar_l1050_23_1[0]) && _zz_when_Axi4Crossbar_l1050_8[0]);
  end

  always @(*) begin
    _zz_when_Axi4Crossbar_l1050_25[0] = (io_masters_1_ar_payload_addr[31 : 16] == 16'h0);
    _zz_when_Axi4Crossbar_l1050_25[1] = (io_masters_1_ar_payload_addr[31 : 16] == 16'h0001);
  end

  always @(*) begin
    _zz_when_Axi4Crossbar_l340_15[0] = (rdRrPtr_0 <= 1'b0);
    _zz_when_Axi4Crossbar_l340_15[1] = (rdRrPtr_0 <= 1'b1);
  end

  assign _zz_when_Axi4Crossbar_l340_16 = (_zz_when_Axi4Crossbar_l1050_23 & _zz_when_Axi4Crossbar_l340_15);
  assign _zz_when_Axi4Crossbar_l340_17 = _zz_when_Axi4Crossbar_l340_16;
  assign _zz_when_Axi4Crossbar_l340_18 = _zz_when_Axi4Crossbar_l1050_23;
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
  assign when_Axi4Crossbar_l1050 = ((_zz_when_Axi4Crossbar_l1050 < 3'b100) && (|_zz_when_Axi4Crossbar_l1050_23));
  assign when_Axi4Crossbar_l1053 = (_zz_io_slaves_0_ar_payload_id_1 == 1'b0);
  assign when_Axi4Crossbar_l1053_1 = (_zz_io_slaves_0_ar_payload_id_1 == 1'b1);
  assign io_slaves_0_ar_fire = (io_slaves_0_ar_valid && io_slaves_0_ar_ready);
  assign io_slaves_0_r_fire = (io_slaves_0_r_valid && io_slaves_0_r_ready);
  assign _zz_when_Axi4Crossbar_l1071 = (io_slaves_0_r_fire && io_slaves_0_r_payload_last);
  assign when_Axi4Crossbar_l1071 = (io_slaves_0_ar_fire && (! _zz_when_Axi4Crossbar_l1071));
  assign when_Axi4Crossbar_l1073 = ((! io_slaves_0_ar_fire) && _zz_when_Axi4Crossbar_l1071);
  always @(*) begin
    _zz_when_Axi4Crossbar_l1050_27[0] = (io_masters_0_ar_payload_addr[31 : 16] == 16'h0);
    _zz_when_Axi4Crossbar_l1050_27[1] = (io_masters_0_ar_payload_addr[31 : 16] == 16'h0001);
  end

  always @(*) begin
    _zz_when_Axi4Crossbar_l1050_26[0] = ((io_masters_0_ar_valid && _zz__zz_when_Axi4Crossbar_l1050_26[1]) && _zz_when_Axi4Crossbar_l1050_7[1]);
    _zz_when_Axi4Crossbar_l1050_26[1] = ((io_masters_1_ar_valid && _zz__zz_when_Axi4Crossbar_l1050_26_1[1]) && _zz_when_Axi4Crossbar_l1050_8[1]);
  end

  always @(*) begin
    _zz_when_Axi4Crossbar_l1050_28[0] = (io_masters_1_ar_payload_addr[31 : 16] == 16'h0);
    _zz_when_Axi4Crossbar_l1050_28[1] = (io_masters_1_ar_payload_addr[31 : 16] == 16'h0001);
  end

  always @(*) begin
    _zz_when_Axi4Crossbar_l340_20[0] = (rdRrPtr_1 <= 1'b0);
    _zz_when_Axi4Crossbar_l340_20[1] = (rdRrPtr_1 <= 1'b1);
  end

  assign _zz_when_Axi4Crossbar_l340_21 = (_zz_when_Axi4Crossbar_l1050_26 & _zz_when_Axi4Crossbar_l340_20);
  assign _zz_when_Axi4Crossbar_l340_22 = _zz_when_Axi4Crossbar_l340_21;
  assign _zz_when_Axi4Crossbar_l340_23 = _zz_when_Axi4Crossbar_l1050_26;
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
  assign when_Axi4Crossbar_l1050_1 = ((_zz_when_Axi4Crossbar_l1050_1 < 3'b100) && (|_zz_when_Axi4Crossbar_l1050_26));
  assign when_Axi4Crossbar_l1053_2 = (_zz_io_slaves_1_ar_payload_id_1 == 1'b0);
  assign when_Axi4Crossbar_l1053_3 = (_zz_io_slaves_1_ar_payload_id_1 == 1'b1);
  assign io_slaves_1_ar_fire = (io_slaves_1_ar_valid && io_slaves_1_ar_ready);
  assign io_slaves_1_r_fire = (io_slaves_1_r_valid && io_slaves_1_r_ready);
  assign _zz_when_Axi4Crossbar_l1071_1 = (io_slaves_1_r_fire && io_slaves_1_r_payload_last);
  assign when_Axi4Crossbar_l1071_1 = (io_slaves_1_ar_fire && (! _zz_when_Axi4Crossbar_l1071_1));
  assign when_Axi4Crossbar_l1073_1 = ((! io_slaves_1_ar_fire) && _zz_when_Axi4Crossbar_l1071_1);
  always @(*) begin
    _zz_when_Axi4Crossbar_l1050_30[0] = (io_masters_0_ar_payload_addr[31 : 16] == 16'h0);
    _zz_when_Axi4Crossbar_l1050_30[1] = (io_masters_0_ar_payload_addr[31 : 16] == 16'h0001);
  end

  always @(*) begin
    _zz_when_Axi4Crossbar_l1050_29[0] = ((io_masters_0_ar_valid && _zz__zz_when_Axi4Crossbar_l1050_29[2]) && _zz_when_Axi4Crossbar_l1050_7[2]);
    _zz_when_Axi4Crossbar_l1050_29[1] = ((io_masters_1_ar_valid && _zz__zz_when_Axi4Crossbar_l1050_29_1[2]) && _zz_when_Axi4Crossbar_l1050_8[2]);
  end

  always @(*) begin
    _zz_when_Axi4Crossbar_l1050_31[0] = (io_masters_1_ar_payload_addr[31 : 16] == 16'h0);
    _zz_when_Axi4Crossbar_l1050_31[1] = (io_masters_1_ar_payload_addr[31 : 16] == 16'h0001);
  end

  always @(*) begin
    _zz_when_Axi4Crossbar_l340_25[0] = (rdRrPtr_2 <= 1'b0);
    _zz_when_Axi4Crossbar_l340_25[1] = (rdRrPtr_2 <= 1'b1);
  end

  assign _zz_when_Axi4Crossbar_l340_26 = (_zz_when_Axi4Crossbar_l1050_29 & _zz_when_Axi4Crossbar_l340_25);
  assign _zz_when_Axi4Crossbar_l340_27 = _zz_when_Axi4Crossbar_l340_26;
  assign _zz_when_Axi4Crossbar_l340_28 = _zz_when_Axi4Crossbar_l1050_29;
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
  assign when_Axi4Crossbar_l1050_2 = ((_zz_when_Axi4Crossbar_l1050_2 < 3'b100) && (|_zz_when_Axi4Crossbar_l1050_29));
  assign when_Axi4Crossbar_l1053_4 = (_zz_rdRrPtr_2_1 == 1'b0);
  assign when_Axi4Crossbar_l1053_5 = (_zz_rdRrPtr_2_1 == 1'b1);
  assign decErr_io_axi_ar_fire = (decErr_io_axi_ar_valid && decErr_io_axi_ar_ready);
  assign decErr_io_axi_r_fire = (decErr_io_axi_r_valid && decErr_io_axi_r_ready);
  assign _zz_when_Axi4Crossbar_l1071_2 = (decErr_io_axi_r_fire && decErr_io_axi_r_payload_last);
  assign when_Axi4Crossbar_l1071_2 = (decErr_io_axi_ar_fire && (! _zz_when_Axi4Crossbar_l1071_2));
  assign when_Axi4Crossbar_l1073_2 = ((! decErr_io_axi_ar_fire) && _zz_when_Axi4Crossbar_l1071_2);
  always @(*) begin
    _zz_respLockOH_6[0] = (io_slaves_0_r_valid && (_zz__zz_respLockOH_6 == 1'b0));
    _zz_respLockOH_6[1] = (io_slaves_1_r_valid && (_zz__zz_respLockOH_6_1 == 1'b0));
    _zz_respLockOH_6[2] = (decErr_io_axi_r_valid && (_zz__zz_respLockOH_6_2 == 1'b0));
  end

  assign _zz_respLockOH_7 = _zz_respLockOH_6;
  assign _zz_respLockOH_8 = (respLock_2 ? respLockOH_2 : (_zz_respLockOH_7 & (~ _zz__zz_respLockOH_8)));
  assign when_Axi4Crossbar_l311_2 = ((|_zz_respLockOH_8) && (! (io_masters_0_r_ready && (((_zz_respLockOH_8[0] && io_slaves_0_r_payload_last) || (_zz_respLockOH_8[1] && io_slaves_1_r_payload_last)) || (_zz_respLockOH_8[2] && decErr_io_axi_r_payload_last)))));
  assign when_Axi4Crossbar_l1097 = _zz_respLockOH_8[0];
  assign when_Axi4Crossbar_l1097_1 = _zz_respLockOH_8[1];
  assign when_Axi4Crossbar_l1097_2 = _zz_respLockOH_8[2];
  always @(*) begin
    _zz_respLockOH_9[0] = (io_slaves_0_r_valid && (_zz__zz_respLockOH_9 == 1'b1));
    _zz_respLockOH_9[1] = (io_slaves_1_r_valid && (_zz__zz_respLockOH_9_1 == 1'b1));
    _zz_respLockOH_9[2] = (decErr_io_axi_r_valid && (_zz__zz_respLockOH_9_2 == 1'b1));
  end

  assign _zz_respLockOH_10 = _zz_respLockOH_9;
  assign _zz_respLockOH_11 = (respLock_3 ? respLockOH_3 : (_zz_respLockOH_10 & (~ _zz__zz_respLockOH_11)));
  assign when_Axi4Crossbar_l311_3 = ((|_zz_respLockOH_11) && (! (io_masters_1_r_ready && (((_zz_respLockOH_11[0] && io_slaves_0_r_payload_last) || (_zz_respLockOH_11[1] && io_slaves_1_r_payload_last)) || (_zz_respLockOH_11[2] && decErr_io_axi_r_payload_last)))));
  assign when_Axi4Crossbar_l1097_3 = _zz_respLockOH_11[0];
  assign when_Axi4Crossbar_l1097_4 = _zz_respLockOH_11[1];
  assign when_Axi4Crossbar_l1097_5 = _zz_respLockOH_11[2];
  always @(posedge clk) begin
    if(!resetn) begin
      wrRrPtr_0 <= 1'b0;
      wrRrPtr_1 <= 1'b0;
      wrRrPtr_2 <= 1'b0;
      rdRrPtr_0 <= 1'b0;
      rdRrPtr_1 <= 1'b0;
      rdRrPtr_2 <= 1'b0;
      _zz_when_Axi4Crossbar_l847 <= 3'b000;
      _zz_when_Axi4Crossbar_l847_1 <= 3'b000;
      _zz_when_Axi4Crossbar_l847_2 <= 3'b000;
      _zz_7 <= 2'b00;
      _zz_8 <= 2'b00;
      _zz_9 <= 2'b00;
      _zz_when_Axi4Crossbar_l911 <= 2'b00;
      _zz_when_Axi4Crossbar_l911_1 <= 2'b00;
      _zz_when_Axi4Crossbar_l911_2 <= 2'b00;
      _zz_when_Axi4Crossbar_l864 <= 3'b000;
      _zz_when_Axi4Crossbar_l864_1 <= 3'b000;
      _zz_when_Axi4Crossbar_l864_2 <= 3'b000;
      _zz_when_Axi4Crossbar_l1050 <= 3'b000;
      _zz_when_Axi4Crossbar_l1050_1 <= 3'b000;
      _zz_when_Axi4Crossbar_l1050_2 <= 3'b000;
      _zz_when_Axi4Crossbar_l777 <= 1'b0;
      _zz_when_Axi4Crossbar_l777_1 <= 1'b0;
      _zz_when_Axi4Crossbar_l777_2 <= 1'b0;
      _zz_when_Axi4Crossbar_l777_3 <= 1'b0;
      _zz_when_Axi4Crossbar_l777_4 <= 4'b0000;
      _zz_when_Axi4Crossbar_l777_5 <= 4'b0000;
      _zz_when_Axi4Crossbar_l777_6 <= 4'b0000;
      _zz_when_Axi4Crossbar_l777_7 <= 4'b0000;
      _zz_when_Axi4Crossbar_l847_3 <= 2'b00;
      _zz_when_Axi4Crossbar_l847_4 <= 2'b00;
      _zz_when_Axi4Crossbar_l847_5 <= 2'b00;
      _zz_when_Axi4Crossbar_l847_6 <= 2'b00;
      _zz_when_Axi4Crossbar_l784 <= 3'b000;
      _zz_when_Axi4Crossbar_l784_1 <= 3'b000;
      _zz_when_Axi4Crossbar_l784_2 <= 3'b000;
      _zz_when_Axi4Crossbar_l784_3 <= 3'b000;
      _zz_when_Axi4Crossbar_l777_8 <= 1'b0;
      _zz_when_Axi4Crossbar_l777_9 <= 1'b0;
      _zz_when_Axi4Crossbar_l777_10 <= 1'b0;
      _zz_when_Axi4Crossbar_l777_11 <= 1'b0;
      _zz_when_Axi4Crossbar_l777_12 <= 4'b0000;
      _zz_when_Axi4Crossbar_l777_13 <= 4'b0000;
      _zz_when_Axi4Crossbar_l777_14 <= 4'b0000;
      _zz_when_Axi4Crossbar_l777_15 <= 4'b0000;
      _zz_when_Axi4Crossbar_l1050_3 <= 2'b00;
      _zz_when_Axi4Crossbar_l1050_4 <= 2'b00;
      _zz_when_Axi4Crossbar_l1050_5 <= 2'b00;
      _zz_when_Axi4Crossbar_l1050_6 <= 2'b00;
      _zz_when_Axi4Crossbar_l784_4 <= 3'b000;
      _zz_when_Axi4Crossbar_l784_5 <= 3'b000;
      _zz_when_Axi4Crossbar_l784_6 <= 3'b000;
      _zz_when_Axi4Crossbar_l784_7 <= 3'b000;
      _zz_when_Axi4Crossbar_l847_7 <= 3'b000;
      _zz_when_Axi4Crossbar_l847_8 <= 3'b000;
      _zz_when_Axi4Crossbar_l847_9 <= 2'b00;
      _zz_when_Axi4Crossbar_l847_10 <= 2'b00;
      grantLock <= 1'b0;
      grantLockIdx <= 1'b0;
      _zz_when_Axi4Crossbar_l864_4 <= 1'b0;
      grantLock_1 <= 1'b0;
      grantLockIdx_1 <= 1'b0;
      _zz_when_Axi4Crossbar_l864_6 <= 1'b0;
      grantLock_2 <= 1'b0;
      grantLockIdx_2 <= 1'b0;
      _zz_when_Axi4Crossbar_l864_8 <= 1'b0;
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
        _zz_when_Axi4Crossbar_l864_4 <= 1'b0;
      end else begin
        if(when_Axi4Crossbar_l883) begin
          _zz_when_Axi4Crossbar_l864_4 <= 1'b1;
        end
      end
      if(when_Axi4Crossbar_l895) begin
        _zz_7 <= ((_zz_7 == 2'b11) ? 2'b00 : _zz__zz_7);
      end
      if(io_slaves_0_aw_fire) begin
        wrRrPtr_0 <= (_zz_io_slaves_0_aw_payload_id_1 + 1'b1);
      end
      if(when_Axi4Crossbar_l922) begin
        _zz_when_Axi4Crossbar_l911 <= ((_zz_when_Axi4Crossbar_l911 == 2'b11) ? 2'b00 : _zz__zz_when_Axi4Crossbar_l911);
      end
      if(when_Axi4Crossbar_l928) begin
        _zz_when_Axi4Crossbar_l864 <= (_zz_when_Axi4Crossbar_l864 + 3'b001);
      end else begin
        if(when_Axi4Crossbar_l930) begin
          _zz_when_Axi4Crossbar_l864 <= (_zz_when_Axi4Crossbar_l864 - 3'b001);
        end
      end
      if(when_Axi4Crossbar_l937) begin
        _zz_when_Axi4Crossbar_l847 <= (_zz_when_Axi4Crossbar_l847 + 3'b001);
      end else begin
        if(when_Axi4Crossbar_l939) begin
          _zz_when_Axi4Crossbar_l847 <= (_zz_when_Axi4Crossbar_l847 - 3'b001);
        end
      end
      if(when_Axi4Crossbar_l269_1) begin
        grantLock_1 <= 1'b1;
        grantLockIdx_1 <= _zz_io_slaves_1_aw_payload_id_1;
      end else begin
        grantLock_1 <= 1'b0;
      end
      if(io_slaves_1_aw_fire) begin
        _zz_when_Axi4Crossbar_l864_6 <= 1'b0;
      end else begin
        if(when_Axi4Crossbar_l883_1) begin
          _zz_when_Axi4Crossbar_l864_6 <= 1'b1;
        end
      end
      if(when_Axi4Crossbar_l895_1) begin
        _zz_8 <= ((_zz_8 == 2'b11) ? 2'b00 : _zz__zz_8);
      end
      if(io_slaves_1_aw_fire) begin
        wrRrPtr_1 <= (_zz_io_slaves_1_aw_payload_id_1 + 1'b1);
      end
      if(when_Axi4Crossbar_l922_1) begin
        _zz_when_Axi4Crossbar_l911_1 <= ((_zz_when_Axi4Crossbar_l911_1 == 2'b11) ? 2'b00 : _zz__zz_when_Axi4Crossbar_l911_1);
      end
      if(when_Axi4Crossbar_l928_1) begin
        _zz_when_Axi4Crossbar_l864_1 <= (_zz_when_Axi4Crossbar_l864_1 + 3'b001);
      end else begin
        if(when_Axi4Crossbar_l930_1) begin
          _zz_when_Axi4Crossbar_l864_1 <= (_zz_when_Axi4Crossbar_l864_1 - 3'b001);
        end
      end
      if(when_Axi4Crossbar_l937_1) begin
        _zz_when_Axi4Crossbar_l847_1 <= (_zz_when_Axi4Crossbar_l847_1 + 3'b001);
      end else begin
        if(when_Axi4Crossbar_l939_1) begin
          _zz_when_Axi4Crossbar_l847_1 <= (_zz_when_Axi4Crossbar_l847_1 - 3'b001);
        end
      end
      if(when_Axi4Crossbar_l269_2) begin
        grantLock_2 <= 1'b1;
        grantLockIdx_2 <= _zz_wrRrPtr_2_1;
      end else begin
        grantLock_2 <= 1'b0;
      end
      if(decErr_io_axi_aw_fire) begin
        _zz_when_Axi4Crossbar_l864_8 <= 1'b0;
      end else begin
        if(when_Axi4Crossbar_l883_2) begin
          _zz_when_Axi4Crossbar_l864_8 <= 1'b1;
        end
      end
      if(when_Axi4Crossbar_l895_2) begin
        _zz_9 <= ((_zz_9 == 2'b11) ? 2'b00 : _zz__zz_9);
      end
      if(decErr_io_axi_aw_fire) begin
        wrRrPtr_2 <= (_zz_wrRrPtr_2_1 + 1'b1);
      end
      if(when_Axi4Crossbar_l922_2) begin
        _zz_when_Axi4Crossbar_l911_2 <= ((_zz_when_Axi4Crossbar_l911_2 == 2'b11) ? 2'b00 : _zz__zz_when_Axi4Crossbar_l911_2);
      end
      if(when_Axi4Crossbar_l928_2) begin
        _zz_when_Axi4Crossbar_l864_2 <= (_zz_when_Axi4Crossbar_l864_2 + 3'b001);
      end else begin
        if(when_Axi4Crossbar_l930_2) begin
          _zz_when_Axi4Crossbar_l864_2 <= (_zz_when_Axi4Crossbar_l864_2 - 3'b001);
        end
      end
      if(when_Axi4Crossbar_l937_2) begin
        _zz_when_Axi4Crossbar_l847_2 <= (_zz_when_Axi4Crossbar_l847_2 + 3'b001);
      end else begin
        if(when_Axi4Crossbar_l939_2) begin
          _zz_when_Axi4Crossbar_l847_2 <= (_zz_when_Axi4Crossbar_l847_2 - 3'b001);
        end
      end
      if(when_Axi4Crossbar_l777) begin
        _zz_when_Axi4Crossbar_l777 <= 1'b1;
        _zz_when_Axi4Crossbar_l777_4 <= _zz_when_Axi4Crossbar_l777_17;
        _zz_when_Axi4Crossbar_l847_3 <= _zz_when_Axi4Crossbar_l847_40;
        _zz_when_Axi4Crossbar_l784 <= (_zz_when_Axi4Crossbar_l784 + 3'b001);
      end else begin
        if(when_Axi4Crossbar_l782) begin
          _zz_when_Axi4Crossbar_l784 <= (_zz_when_Axi4Crossbar_l784 - 3'b001);
          if(when_Axi4Crossbar_l784) begin
            _zz_when_Axi4Crossbar_l777 <= 1'b0;
          end
        end
      end
      if(when_Axi4Crossbar_l777_1) begin
        _zz_when_Axi4Crossbar_l777_1 <= 1'b1;
        _zz_when_Axi4Crossbar_l777_5 <= _zz_when_Axi4Crossbar_l777_17;
        _zz_when_Axi4Crossbar_l847_4 <= _zz_when_Axi4Crossbar_l847_40;
        _zz_when_Axi4Crossbar_l784_1 <= (_zz_when_Axi4Crossbar_l784_1 + 3'b001);
      end else begin
        if(when_Axi4Crossbar_l782_1) begin
          _zz_when_Axi4Crossbar_l784_1 <= (_zz_when_Axi4Crossbar_l784_1 - 3'b001);
          if(when_Axi4Crossbar_l784_1) begin
            _zz_when_Axi4Crossbar_l777_1 <= 1'b0;
          end
        end
      end
      if(when_Axi4Crossbar_l777_2) begin
        _zz_when_Axi4Crossbar_l777_8 <= 1'b1;
        _zz_when_Axi4Crossbar_l777_12 <= _zz_when_Axi4Crossbar_l777_33;
        _zz_when_Axi4Crossbar_l1050_3 <= _zz_when_Axi4Crossbar_l1050_21;
        _zz_when_Axi4Crossbar_l784_4 <= (_zz_when_Axi4Crossbar_l784_4 + 3'b001);
      end else begin
        if(when_Axi4Crossbar_l782_2) begin
          _zz_when_Axi4Crossbar_l784_4 <= (_zz_when_Axi4Crossbar_l784_4 - 3'b001);
          if(when_Axi4Crossbar_l784_2) begin
            _zz_when_Axi4Crossbar_l777_8 <= 1'b0;
          end
        end
      end
      if(when_Axi4Crossbar_l777_3) begin
        _zz_when_Axi4Crossbar_l777_9 <= 1'b1;
        _zz_when_Axi4Crossbar_l777_13 <= _zz_when_Axi4Crossbar_l777_33;
        _zz_when_Axi4Crossbar_l1050_4 <= _zz_when_Axi4Crossbar_l1050_21;
        _zz_when_Axi4Crossbar_l784_5 <= (_zz_when_Axi4Crossbar_l784_5 + 3'b001);
      end else begin
        if(when_Axi4Crossbar_l782_3) begin
          _zz_when_Axi4Crossbar_l784_5 <= (_zz_when_Axi4Crossbar_l784_5 - 3'b001);
          if(when_Axi4Crossbar_l784_3) begin
            _zz_when_Axi4Crossbar_l777_9 <= 1'b0;
          end
        end
      end
      if(when_Axi4Crossbar_l990) begin
        _zz_when_Axi4Crossbar_l847_7 <= (_zz_when_Axi4Crossbar_l847_7 + 3'b001);
      end else begin
        if(when_Axi4Crossbar_l992) begin
          _zz_when_Axi4Crossbar_l847_7 <= (_zz_when_Axi4Crossbar_l847_7 - 3'b001);
        end
      end
      if(when_Axi4Crossbar_l995) begin
        _zz_when_Axi4Crossbar_l847_9 <= _zz_when_Axi4Crossbar_l847_41;
      end
      if(when_Axi4Crossbar_l777_4) begin
        _zz_when_Axi4Crossbar_l777_2 <= 1'b1;
        _zz_when_Axi4Crossbar_l777_6 <= _zz_when_Axi4Crossbar_l777_49;
        _zz_when_Axi4Crossbar_l847_5 <= _zz_when_Axi4Crossbar_l847_42;
        _zz_when_Axi4Crossbar_l784_2 <= (_zz_when_Axi4Crossbar_l784_2 + 3'b001);
      end else begin
        if(when_Axi4Crossbar_l782_4) begin
          _zz_when_Axi4Crossbar_l784_2 <= (_zz_when_Axi4Crossbar_l784_2 - 3'b001);
          if(when_Axi4Crossbar_l784_4) begin
            _zz_when_Axi4Crossbar_l777_2 <= 1'b0;
          end
        end
      end
      if(when_Axi4Crossbar_l777_5) begin
        _zz_when_Axi4Crossbar_l777_3 <= 1'b1;
        _zz_when_Axi4Crossbar_l777_7 <= _zz_when_Axi4Crossbar_l777_49;
        _zz_when_Axi4Crossbar_l847_6 <= _zz_when_Axi4Crossbar_l847_42;
        _zz_when_Axi4Crossbar_l784_3 <= (_zz_when_Axi4Crossbar_l784_3 + 3'b001);
      end else begin
        if(when_Axi4Crossbar_l782_5) begin
          _zz_when_Axi4Crossbar_l784_3 <= (_zz_when_Axi4Crossbar_l784_3 - 3'b001);
          if(when_Axi4Crossbar_l784_5) begin
            _zz_when_Axi4Crossbar_l777_3 <= 1'b0;
          end
        end
      end
      if(when_Axi4Crossbar_l777_6) begin
        _zz_when_Axi4Crossbar_l777_10 <= 1'b1;
        _zz_when_Axi4Crossbar_l777_14 <= _zz_when_Axi4Crossbar_l777_65;
        _zz_when_Axi4Crossbar_l1050_5 <= _zz_when_Axi4Crossbar_l1050_22;
        _zz_when_Axi4Crossbar_l784_6 <= (_zz_when_Axi4Crossbar_l784_6 + 3'b001);
      end else begin
        if(when_Axi4Crossbar_l782_6) begin
          _zz_when_Axi4Crossbar_l784_6 <= (_zz_when_Axi4Crossbar_l784_6 - 3'b001);
          if(when_Axi4Crossbar_l784_6) begin
            _zz_when_Axi4Crossbar_l777_10 <= 1'b0;
          end
        end
      end
      if(when_Axi4Crossbar_l777_7) begin
        _zz_when_Axi4Crossbar_l777_11 <= 1'b1;
        _zz_when_Axi4Crossbar_l777_15 <= _zz_when_Axi4Crossbar_l777_65;
        _zz_when_Axi4Crossbar_l1050_6 <= _zz_when_Axi4Crossbar_l1050_22;
        _zz_when_Axi4Crossbar_l784_7 <= (_zz_when_Axi4Crossbar_l784_7 + 3'b001);
      end else begin
        if(when_Axi4Crossbar_l782_7) begin
          _zz_when_Axi4Crossbar_l784_7 <= (_zz_when_Axi4Crossbar_l784_7 - 3'b001);
          if(when_Axi4Crossbar_l784_7) begin
            _zz_when_Axi4Crossbar_l777_11 <= 1'b0;
          end
        end
      end
      if(when_Axi4Crossbar_l990_1) begin
        _zz_when_Axi4Crossbar_l847_8 <= (_zz_when_Axi4Crossbar_l847_8 + 3'b001);
      end else begin
        if(when_Axi4Crossbar_l992_1) begin
          _zz_when_Axi4Crossbar_l847_8 <= (_zz_when_Axi4Crossbar_l847_8 - 3'b001);
        end
      end
      if(when_Axi4Crossbar_l995_1) begin
        _zz_when_Axi4Crossbar_l847_10 <= _zz_when_Axi4Crossbar_l847_43;
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
      if(when_Axi4Crossbar_l1071) begin
        _zz_when_Axi4Crossbar_l1050 <= (_zz_when_Axi4Crossbar_l1050 + 3'b001);
      end else begin
        if(when_Axi4Crossbar_l1073) begin
          _zz_when_Axi4Crossbar_l1050 <= (_zz_when_Axi4Crossbar_l1050 - 3'b001);
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
      if(when_Axi4Crossbar_l1071_1) begin
        _zz_when_Axi4Crossbar_l1050_1 <= (_zz_when_Axi4Crossbar_l1050_1 + 3'b001);
      end else begin
        if(when_Axi4Crossbar_l1073_1) begin
          _zz_when_Axi4Crossbar_l1050_1 <= (_zz_when_Axi4Crossbar_l1050_1 - 3'b001);
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
      if(when_Axi4Crossbar_l1071_2) begin
        _zz_when_Axi4Crossbar_l1050_2 <= (_zz_when_Axi4Crossbar_l1050_2 + 3'b001);
      end else begin
        if(when_Axi4Crossbar_l1073_2) begin
          _zz_when_Axi4Crossbar_l1050_2 <= (_zz_when_Axi4Crossbar_l1050_2 - 3'b001);
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
