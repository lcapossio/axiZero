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
  wire                axi4LiteRegSlice_2_io_upstream_ar_ready;
  wire                axi4LiteRegSlice_2_io_upstream_aw_ready;
  wire                axi4LiteRegSlice_2_io_upstream_w_ready;
  wire                axi4LiteRegSlice_2_io_upstream_r_valid;
  wire       [31:0]   axi4LiteRegSlice_2_io_upstream_r_payload_data;
  wire       [1:0]    axi4LiteRegSlice_2_io_upstream_r_payload_resp;
  wire                axi4LiteRegSlice_2_io_upstream_b_valid;
  wire       [1:0]    axi4LiteRegSlice_2_io_upstream_b_payload_resp;
  wire                axi4LiteRegSlice_2_io_downstream_ar_valid;
  wire       [31:0]   axi4LiteRegSlice_2_io_downstream_ar_payload_addr;
  wire       [2:0]    axi4LiteRegSlice_2_io_downstream_ar_payload_prot;
  wire                axi4LiteRegSlice_2_io_downstream_aw_valid;
  wire       [31:0]   axi4LiteRegSlice_2_io_downstream_aw_payload_addr;
  wire       [2:0]    axi4LiteRegSlice_2_io_downstream_aw_payload_prot;
  wire                axi4LiteRegSlice_2_io_downstream_w_valid;
  wire       [31:0]   axi4LiteRegSlice_2_io_downstream_w_payload_data;
  wire       [3:0]    axi4LiteRegSlice_2_io_downstream_w_payload_strb;
  wire                axi4LiteRegSlice_2_io_downstream_r_ready;
  wire                axi4LiteRegSlice_2_io_downstream_b_ready;
  wire                axi4LiteRegSlice_3_io_upstream_ar_ready;
  wire                axi4LiteRegSlice_3_io_upstream_aw_ready;
  wire                axi4LiteRegSlice_3_io_upstream_w_ready;
  wire                axi4LiteRegSlice_3_io_upstream_r_valid;
  wire       [31:0]   axi4LiteRegSlice_3_io_upstream_r_payload_data;
  wire       [1:0]    axi4LiteRegSlice_3_io_upstream_r_payload_resp;
  wire                axi4LiteRegSlice_3_io_upstream_b_valid;
  wire       [1:0]    axi4LiteRegSlice_3_io_upstream_b_payload_resp;
  wire                axi4LiteRegSlice_3_io_downstream_ar_valid;
  wire       [31:0]   axi4LiteRegSlice_3_io_downstream_ar_payload_addr;
  wire       [2:0]    axi4LiteRegSlice_3_io_downstream_ar_payload_prot;
  wire                axi4LiteRegSlice_3_io_downstream_aw_valid;
  wire       [31:0]   axi4LiteRegSlice_3_io_downstream_aw_payload_addr;
  wire       [2:0]    axi4LiteRegSlice_3_io_downstream_aw_payload_prot;
  wire                axi4LiteRegSlice_3_io_downstream_w_valid;
  wire       [31:0]   axi4LiteRegSlice_3_io_downstream_w_payload_data;
  wire       [3:0]    axi4LiteRegSlice_3_io_downstream_w_payload_strb;
  wire                axi4LiteRegSlice_3_io_downstream_r_ready;
  wire                axi4LiteRegSlice_3_io_downstream_b_ready;

  Axi4LiteCrossbar xbar (
    .io_masters_0_aw_valid        (axi4LiteRegSlice_2_io_downstream_aw_valid             ), //i
    .io_masters_0_aw_ready        (xbar_io_masters_0_aw_ready                            ), //o
    .io_masters_0_aw_payload_addr (axi4LiteRegSlice_2_io_downstream_aw_payload_addr[31:0]), //i
    .io_masters_0_aw_payload_prot (axi4LiteRegSlice_2_io_downstream_aw_payload_prot[2:0] ), //i
    .io_masters_0_w_valid         (axi4LiteRegSlice_2_io_downstream_w_valid              ), //i
    .io_masters_0_w_ready         (xbar_io_masters_0_w_ready                             ), //o
    .io_masters_0_w_payload_data  (axi4LiteRegSlice_2_io_downstream_w_payload_data[31:0] ), //i
    .io_masters_0_w_payload_strb  (axi4LiteRegSlice_2_io_downstream_w_payload_strb[3:0]  ), //i
    .io_masters_0_b_valid         (xbar_io_masters_0_b_valid                             ), //o
    .io_masters_0_b_ready         (axi4LiteRegSlice_2_io_downstream_b_ready              ), //i
    .io_masters_0_b_payload_resp  (xbar_io_masters_0_b_payload_resp[1:0]                 ), //o
    .io_masters_0_ar_valid        (axi4LiteRegSlice_2_io_downstream_ar_valid             ), //i
    .io_masters_0_ar_ready        (xbar_io_masters_0_ar_ready                            ), //o
    .io_masters_0_ar_payload_addr (axi4LiteRegSlice_2_io_downstream_ar_payload_addr[31:0]), //i
    .io_masters_0_ar_payload_prot (axi4LiteRegSlice_2_io_downstream_ar_payload_prot[2:0] ), //i
    .io_masters_0_r_valid         (xbar_io_masters_0_r_valid                             ), //o
    .io_masters_0_r_ready         (axi4LiteRegSlice_2_io_downstream_r_ready              ), //i
    .io_masters_0_r_payload_data  (xbar_io_masters_0_r_payload_data[31:0]                ), //o
    .io_masters_0_r_payload_resp  (xbar_io_masters_0_r_payload_resp[1:0]                 ), //o
    .io_masters_1_aw_valid        (io_masters_1_aw_valid                                 ), //i
    .io_masters_1_aw_ready        (xbar_io_masters_1_aw_ready                            ), //o
    .io_masters_1_aw_payload_addr (io_masters_1_aw_payload_addr[31:0]                    ), //i
    .io_masters_1_aw_payload_prot (io_masters_1_aw_payload_prot[2:0]                     ), //i
    .io_masters_1_w_valid         (io_masters_1_w_valid                                  ), //i
    .io_masters_1_w_ready         (xbar_io_masters_1_w_ready                             ), //o
    .io_masters_1_w_payload_data  (io_masters_1_w_payload_data[31:0]                     ), //i
    .io_masters_1_w_payload_strb  (io_masters_1_w_payload_strb[3:0]                      ), //i
    .io_masters_1_b_valid         (xbar_io_masters_1_b_valid                             ), //o
    .io_masters_1_b_ready         (io_masters_1_b_ready                                  ), //i
    .io_masters_1_b_payload_resp  (xbar_io_masters_1_b_payload_resp[1:0]                 ), //o
    .io_masters_1_ar_valid        (io_masters_1_ar_valid                                 ), //i
    .io_masters_1_ar_ready        (xbar_io_masters_1_ar_ready                            ), //o
    .io_masters_1_ar_payload_addr (io_masters_1_ar_payload_addr[31:0]                    ), //i
    .io_masters_1_ar_payload_prot (io_masters_1_ar_payload_prot[2:0]                     ), //i
    .io_masters_1_r_valid         (xbar_io_masters_1_r_valid                             ), //o
    .io_masters_1_r_ready         (io_masters_1_r_ready                                  ), //i
    .io_masters_1_r_payload_data  (xbar_io_masters_1_r_payload_data[31:0]                ), //o
    .io_masters_1_r_payload_resp  (xbar_io_masters_1_r_payload_resp[1:0]                 ), //o
    .io_slaves_0_aw_valid         (xbar_io_slaves_0_aw_valid                             ), //o
    .io_slaves_0_aw_ready         (axi4LiteRegSlice_3_io_upstream_aw_ready               ), //i
    .io_slaves_0_aw_payload_addr  (xbar_io_slaves_0_aw_payload_addr[31:0]                ), //o
    .io_slaves_0_aw_payload_prot  (xbar_io_slaves_0_aw_payload_prot[2:0]                 ), //o
    .io_slaves_0_w_valid          (xbar_io_slaves_0_w_valid                              ), //o
    .io_slaves_0_w_ready          (axi4LiteRegSlice_3_io_upstream_w_ready                ), //i
    .io_slaves_0_w_payload_data   (xbar_io_slaves_0_w_payload_data[31:0]                 ), //o
    .io_slaves_0_w_payload_strb   (xbar_io_slaves_0_w_payload_strb[3:0]                  ), //o
    .io_slaves_0_b_valid          (axi4LiteRegSlice_3_io_upstream_b_valid                ), //i
    .io_slaves_0_b_ready          (xbar_io_slaves_0_b_ready                              ), //o
    .io_slaves_0_b_payload_resp   (axi4LiteRegSlice_3_io_upstream_b_payload_resp[1:0]    ), //i
    .io_slaves_0_ar_valid         (xbar_io_slaves_0_ar_valid                             ), //o
    .io_slaves_0_ar_ready         (axi4LiteRegSlice_3_io_upstream_ar_ready               ), //i
    .io_slaves_0_ar_payload_addr  (xbar_io_slaves_0_ar_payload_addr[31:0]                ), //o
    .io_slaves_0_ar_payload_prot  (xbar_io_slaves_0_ar_payload_prot[2:0]                 ), //o
    .io_slaves_0_r_valid          (axi4LiteRegSlice_3_io_upstream_r_valid                ), //i
    .io_slaves_0_r_ready          (xbar_io_slaves_0_r_ready                              ), //o
    .io_slaves_0_r_payload_data   (axi4LiteRegSlice_3_io_upstream_r_payload_data[31:0]   ), //i
    .io_slaves_0_r_payload_resp   (axi4LiteRegSlice_3_io_upstream_r_payload_resp[1:0]    ), //i
    .io_slaves_1_aw_valid         (xbar_io_slaves_1_aw_valid                             ), //o
    .io_slaves_1_aw_ready         (io_slaves_1_aw_ready                                  ), //i
    .io_slaves_1_aw_payload_addr  (xbar_io_slaves_1_aw_payload_addr[31:0]                ), //o
    .io_slaves_1_aw_payload_prot  (xbar_io_slaves_1_aw_payload_prot[2:0]                 ), //o
    .io_slaves_1_w_valid          (xbar_io_slaves_1_w_valid                              ), //o
    .io_slaves_1_w_ready          (io_slaves_1_w_ready                                   ), //i
    .io_slaves_1_w_payload_data   (xbar_io_slaves_1_w_payload_data[31:0]                 ), //o
    .io_slaves_1_w_payload_strb   (xbar_io_slaves_1_w_payload_strb[3:0]                  ), //o
    .io_slaves_1_b_valid          (io_slaves_1_b_valid                                   ), //i
    .io_slaves_1_b_ready          (xbar_io_slaves_1_b_ready                              ), //o
    .io_slaves_1_b_payload_resp   (io_slaves_1_b_payload_resp[1:0]                       ), //i
    .io_slaves_1_ar_valid         (xbar_io_slaves_1_ar_valid                             ), //o
    .io_slaves_1_ar_ready         (io_slaves_1_ar_ready                                  ), //i
    .io_slaves_1_ar_payload_addr  (xbar_io_slaves_1_ar_payload_addr[31:0]                ), //o
    .io_slaves_1_ar_payload_prot  (xbar_io_slaves_1_ar_payload_prot[2:0]                 ), //o
    .io_slaves_1_r_valid          (io_slaves_1_r_valid                                   ), //i
    .io_slaves_1_r_ready          (xbar_io_slaves_1_r_ready                              ), //o
    .io_slaves_1_r_payload_data   (io_slaves_1_r_payload_data[31:0]                      ), //i
    .io_slaves_1_r_payload_resp   (io_slaves_1_r_payload_resp[1:0]                       ), //i
    .clk                          (clk                                                   ), //i
    .resetn                       (resetn                                                )  //i
  );
  Axi4LiteRegSlice axi4LiteRegSlice_2 (
    .io_upstream_aw_valid          (io_masters_0_aw_valid                                 ), //i
    .io_upstream_aw_ready          (axi4LiteRegSlice_2_io_upstream_aw_ready               ), //o
    .io_upstream_aw_payload_addr   (io_masters_0_aw_payload_addr[31:0]                    ), //i
    .io_upstream_aw_payload_prot   (io_masters_0_aw_payload_prot[2:0]                     ), //i
    .io_upstream_w_valid           (io_masters_0_w_valid                                  ), //i
    .io_upstream_w_ready           (axi4LiteRegSlice_2_io_upstream_w_ready                ), //o
    .io_upstream_w_payload_data    (io_masters_0_w_payload_data[31:0]                     ), //i
    .io_upstream_w_payload_strb    (io_masters_0_w_payload_strb[3:0]                      ), //i
    .io_upstream_b_valid           (axi4LiteRegSlice_2_io_upstream_b_valid                ), //o
    .io_upstream_b_ready           (io_masters_0_b_ready                                  ), //i
    .io_upstream_b_payload_resp    (axi4LiteRegSlice_2_io_upstream_b_payload_resp[1:0]    ), //o
    .io_upstream_ar_valid          (io_masters_0_ar_valid                                 ), //i
    .io_upstream_ar_ready          (axi4LiteRegSlice_2_io_upstream_ar_ready               ), //o
    .io_upstream_ar_payload_addr   (io_masters_0_ar_payload_addr[31:0]                    ), //i
    .io_upstream_ar_payload_prot   (io_masters_0_ar_payload_prot[2:0]                     ), //i
    .io_upstream_r_valid           (axi4LiteRegSlice_2_io_upstream_r_valid                ), //o
    .io_upstream_r_ready           (io_masters_0_r_ready                                  ), //i
    .io_upstream_r_payload_data    (axi4LiteRegSlice_2_io_upstream_r_payload_data[31:0]   ), //o
    .io_upstream_r_payload_resp    (axi4LiteRegSlice_2_io_upstream_r_payload_resp[1:0]    ), //o
    .io_downstream_aw_valid        (axi4LiteRegSlice_2_io_downstream_aw_valid             ), //o
    .io_downstream_aw_ready        (xbar_io_masters_0_aw_ready                            ), //i
    .io_downstream_aw_payload_addr (axi4LiteRegSlice_2_io_downstream_aw_payload_addr[31:0]), //o
    .io_downstream_aw_payload_prot (axi4LiteRegSlice_2_io_downstream_aw_payload_prot[2:0] ), //o
    .io_downstream_w_valid         (axi4LiteRegSlice_2_io_downstream_w_valid              ), //o
    .io_downstream_w_ready         (xbar_io_masters_0_w_ready                             ), //i
    .io_downstream_w_payload_data  (axi4LiteRegSlice_2_io_downstream_w_payload_data[31:0] ), //o
    .io_downstream_w_payload_strb  (axi4LiteRegSlice_2_io_downstream_w_payload_strb[3:0]  ), //o
    .io_downstream_b_valid         (xbar_io_masters_0_b_valid                             ), //i
    .io_downstream_b_ready         (axi4LiteRegSlice_2_io_downstream_b_ready              ), //o
    .io_downstream_b_payload_resp  (xbar_io_masters_0_b_payload_resp[1:0]                 ), //i
    .io_downstream_ar_valid        (axi4LiteRegSlice_2_io_downstream_ar_valid             ), //o
    .io_downstream_ar_ready        (xbar_io_masters_0_ar_ready                            ), //i
    .io_downstream_ar_payload_addr (axi4LiteRegSlice_2_io_downstream_ar_payload_addr[31:0]), //o
    .io_downstream_ar_payload_prot (axi4LiteRegSlice_2_io_downstream_ar_payload_prot[2:0] ), //o
    .io_downstream_r_valid         (xbar_io_masters_0_r_valid                             ), //i
    .io_downstream_r_ready         (axi4LiteRegSlice_2_io_downstream_r_ready              ), //o
    .io_downstream_r_payload_data  (xbar_io_masters_0_r_payload_data[31:0]                ), //i
    .io_downstream_r_payload_resp  (xbar_io_masters_0_r_payload_resp[1:0]                 ), //i
    .clk                           (clk                                                   ), //i
    .resetn                        (resetn                                                )  //i
  );
  Axi4LiteRegSlice axi4LiteRegSlice_3 (
    .io_upstream_aw_valid          (xbar_io_slaves_0_aw_valid                             ), //i
    .io_upstream_aw_ready          (axi4LiteRegSlice_3_io_upstream_aw_ready               ), //o
    .io_upstream_aw_payload_addr   (xbar_io_slaves_0_aw_payload_addr[31:0]                ), //i
    .io_upstream_aw_payload_prot   (xbar_io_slaves_0_aw_payload_prot[2:0]                 ), //i
    .io_upstream_w_valid           (xbar_io_slaves_0_w_valid                              ), //i
    .io_upstream_w_ready           (axi4LiteRegSlice_3_io_upstream_w_ready                ), //o
    .io_upstream_w_payload_data    (xbar_io_slaves_0_w_payload_data[31:0]                 ), //i
    .io_upstream_w_payload_strb    (xbar_io_slaves_0_w_payload_strb[3:0]                  ), //i
    .io_upstream_b_valid           (axi4LiteRegSlice_3_io_upstream_b_valid                ), //o
    .io_upstream_b_ready           (xbar_io_slaves_0_b_ready                              ), //i
    .io_upstream_b_payload_resp    (axi4LiteRegSlice_3_io_upstream_b_payload_resp[1:0]    ), //o
    .io_upstream_ar_valid          (xbar_io_slaves_0_ar_valid                             ), //i
    .io_upstream_ar_ready          (axi4LiteRegSlice_3_io_upstream_ar_ready               ), //o
    .io_upstream_ar_payload_addr   (xbar_io_slaves_0_ar_payload_addr[31:0]                ), //i
    .io_upstream_ar_payload_prot   (xbar_io_slaves_0_ar_payload_prot[2:0]                 ), //i
    .io_upstream_r_valid           (axi4LiteRegSlice_3_io_upstream_r_valid                ), //o
    .io_upstream_r_ready           (xbar_io_slaves_0_r_ready                              ), //i
    .io_upstream_r_payload_data    (axi4LiteRegSlice_3_io_upstream_r_payload_data[31:0]   ), //o
    .io_upstream_r_payload_resp    (axi4LiteRegSlice_3_io_upstream_r_payload_resp[1:0]    ), //o
    .io_downstream_aw_valid        (axi4LiteRegSlice_3_io_downstream_aw_valid             ), //o
    .io_downstream_aw_ready        (io_slaves_0_aw_ready                                  ), //i
    .io_downstream_aw_payload_addr (axi4LiteRegSlice_3_io_downstream_aw_payload_addr[31:0]), //o
    .io_downstream_aw_payload_prot (axi4LiteRegSlice_3_io_downstream_aw_payload_prot[2:0] ), //o
    .io_downstream_w_valid         (axi4LiteRegSlice_3_io_downstream_w_valid              ), //o
    .io_downstream_w_ready         (io_slaves_0_w_ready                                   ), //i
    .io_downstream_w_payload_data  (axi4LiteRegSlice_3_io_downstream_w_payload_data[31:0] ), //o
    .io_downstream_w_payload_strb  (axi4LiteRegSlice_3_io_downstream_w_payload_strb[3:0]  ), //o
    .io_downstream_b_valid         (io_slaves_0_b_valid                                   ), //i
    .io_downstream_b_ready         (axi4LiteRegSlice_3_io_downstream_b_ready              ), //o
    .io_downstream_b_payload_resp  (io_slaves_0_b_payload_resp[1:0]                       ), //i
    .io_downstream_ar_valid        (axi4LiteRegSlice_3_io_downstream_ar_valid             ), //o
    .io_downstream_ar_ready        (io_slaves_0_ar_ready                                  ), //i
    .io_downstream_ar_payload_addr (axi4LiteRegSlice_3_io_downstream_ar_payload_addr[31:0]), //o
    .io_downstream_ar_payload_prot (axi4LiteRegSlice_3_io_downstream_ar_payload_prot[2:0] ), //o
    .io_downstream_r_valid         (io_slaves_0_r_valid                                   ), //i
    .io_downstream_r_ready         (axi4LiteRegSlice_3_io_downstream_r_ready              ), //o
    .io_downstream_r_payload_data  (io_slaves_0_r_payload_data[31:0]                      ), //i
    .io_downstream_r_payload_resp  (io_slaves_0_r_payload_resp[1:0]                       ), //i
    .clk                           (clk                                                   ), //i
    .resetn                        (resetn                                                )  //i
  );
  assign io_masters_0_aw_ready = axi4LiteRegSlice_2_io_upstream_aw_ready;
  assign io_masters_0_w_ready = axi4LiteRegSlice_2_io_upstream_w_ready;
  assign io_masters_0_b_valid = axi4LiteRegSlice_2_io_upstream_b_valid;
  assign io_masters_0_b_payload_resp = axi4LiteRegSlice_2_io_upstream_b_payload_resp;
  assign io_masters_0_ar_ready = axi4LiteRegSlice_2_io_upstream_ar_ready;
  assign io_masters_0_r_valid = axi4LiteRegSlice_2_io_upstream_r_valid;
  assign io_masters_0_r_payload_data = axi4LiteRegSlice_2_io_upstream_r_payload_data;
  assign io_masters_0_r_payload_resp = axi4LiteRegSlice_2_io_upstream_r_payload_resp;
  assign io_masters_1_aw_ready = xbar_io_masters_1_aw_ready;
  assign io_masters_1_w_ready = xbar_io_masters_1_w_ready;
  assign io_masters_1_b_valid = xbar_io_masters_1_b_valid;
  assign io_masters_1_b_payload_resp = xbar_io_masters_1_b_payload_resp;
  assign io_masters_1_ar_ready = xbar_io_masters_1_ar_ready;
  assign io_masters_1_r_valid = xbar_io_masters_1_r_valid;
  assign io_masters_1_r_payload_data = xbar_io_masters_1_r_payload_data;
  assign io_masters_1_r_payload_resp = xbar_io_masters_1_r_payload_resp;
  assign io_slaves_0_aw_valid = axi4LiteRegSlice_3_io_downstream_aw_valid;
  assign io_slaves_0_aw_payload_addr = axi4LiteRegSlice_3_io_downstream_aw_payload_addr;
  assign io_slaves_0_aw_payload_prot = axi4LiteRegSlice_3_io_downstream_aw_payload_prot;
  assign io_slaves_0_w_valid = axi4LiteRegSlice_3_io_downstream_w_valid;
  assign io_slaves_0_w_payload_data = axi4LiteRegSlice_3_io_downstream_w_payload_data;
  assign io_slaves_0_w_payload_strb = axi4LiteRegSlice_3_io_downstream_w_payload_strb;
  assign io_slaves_0_b_ready = axi4LiteRegSlice_3_io_downstream_b_ready;
  assign io_slaves_0_ar_valid = axi4LiteRegSlice_3_io_downstream_ar_valid;
  assign io_slaves_0_ar_payload_addr = axi4LiteRegSlice_3_io_downstream_ar_payload_addr;
  assign io_slaves_0_ar_payload_prot = axi4LiteRegSlice_3_io_downstream_ar_payload_prot;
  assign io_slaves_0_r_ready = axi4LiteRegSlice_3_io_downstream_r_ready;
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

endmodule

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

  wire                io_upstream_aw_m2sPipe_valid;
  wire                io_upstream_aw_m2sPipe_ready;
  wire       [31:0]   io_upstream_aw_m2sPipe_payload_addr;
  wire       [2:0]    io_upstream_aw_m2sPipe_payload_prot;
  reg                 io_upstream_aw_rValid;
  reg        [31:0]   io_upstream_aw_rData_addr;
  reg        [2:0]    io_upstream_aw_rData_prot;
  wire                when_Stream_l369;
  wire                io_upstream_w_m2sPipe_valid;
  wire                io_upstream_w_m2sPipe_ready;
  wire       [31:0]   io_upstream_w_m2sPipe_payload_data;
  wire       [3:0]    io_upstream_w_m2sPipe_payload_strb;
  reg                 io_upstream_w_rValid;
  reg        [31:0]   io_upstream_w_rData_data;
  reg        [3:0]    io_upstream_w_rData_strb;
  wire                when_Stream_l369_1;
  wire                io_upstream_ar_m2sPipe_valid;
  wire                io_upstream_ar_m2sPipe_ready;
  wire       [31:0]   io_upstream_ar_m2sPipe_payload_addr;
  wire       [2:0]    io_upstream_ar_m2sPipe_payload_prot;
  reg                 io_upstream_ar_rValid;
  reg        [31:0]   io_upstream_ar_rData_addr;
  reg        [2:0]    io_upstream_ar_rData_prot;
  wire                when_Stream_l369_2;
  wire                io_downstream_b_m2sPipe_valid;
  wire                io_downstream_b_m2sPipe_ready;
  wire       [1:0]    io_downstream_b_m2sPipe_payload_resp;
  reg                 io_downstream_b_rValid;
  reg        [1:0]    io_downstream_b_rData_resp;
  wire                when_Stream_l369_3;
  wire                io_downstream_r_m2sPipe_valid;
  wire                io_downstream_r_m2sPipe_ready;
  wire       [31:0]   io_downstream_r_m2sPipe_payload_data;
  wire       [1:0]    io_downstream_r_m2sPipe_payload_resp;
  reg                 io_downstream_r_rValid;
  reg        [31:0]   io_downstream_r_rData_data;
  reg        [1:0]    io_downstream_r_rData_resp;
  wire                when_Stream_l369_4;

  always @(*) begin
    io_upstream_aw_ready = io_upstream_aw_m2sPipe_ready;
    if(when_Stream_l369) begin
      io_upstream_aw_ready = 1'b1;
    end
  end

  assign when_Stream_l369 = (! io_upstream_aw_m2sPipe_valid);
  assign io_upstream_aw_m2sPipe_valid = io_upstream_aw_rValid;
  assign io_upstream_aw_m2sPipe_payload_addr = io_upstream_aw_rData_addr;
  assign io_upstream_aw_m2sPipe_payload_prot = io_upstream_aw_rData_prot;
  assign io_downstream_aw_valid = io_upstream_aw_m2sPipe_valid;
  assign io_upstream_aw_m2sPipe_ready = io_downstream_aw_ready;
  assign io_downstream_aw_payload_addr = io_upstream_aw_m2sPipe_payload_addr;
  assign io_downstream_aw_payload_prot = io_upstream_aw_m2sPipe_payload_prot;
  always @(*) begin
    io_upstream_w_ready = io_upstream_w_m2sPipe_ready;
    if(when_Stream_l369_1) begin
      io_upstream_w_ready = 1'b1;
    end
  end

  assign when_Stream_l369_1 = (! io_upstream_w_m2sPipe_valid);
  assign io_upstream_w_m2sPipe_valid = io_upstream_w_rValid;
  assign io_upstream_w_m2sPipe_payload_data = io_upstream_w_rData_data;
  assign io_upstream_w_m2sPipe_payload_strb = io_upstream_w_rData_strb;
  assign io_downstream_w_valid = io_upstream_w_m2sPipe_valid;
  assign io_upstream_w_m2sPipe_ready = io_downstream_w_ready;
  assign io_downstream_w_payload_data = io_upstream_w_m2sPipe_payload_data;
  assign io_downstream_w_payload_strb = io_upstream_w_m2sPipe_payload_strb;
  always @(*) begin
    io_upstream_ar_ready = io_upstream_ar_m2sPipe_ready;
    if(when_Stream_l369_2) begin
      io_upstream_ar_ready = 1'b1;
    end
  end

  assign when_Stream_l369_2 = (! io_upstream_ar_m2sPipe_valid);
  assign io_upstream_ar_m2sPipe_valid = io_upstream_ar_rValid;
  assign io_upstream_ar_m2sPipe_payload_addr = io_upstream_ar_rData_addr;
  assign io_upstream_ar_m2sPipe_payload_prot = io_upstream_ar_rData_prot;
  assign io_downstream_ar_valid = io_upstream_ar_m2sPipe_valid;
  assign io_upstream_ar_m2sPipe_ready = io_downstream_ar_ready;
  assign io_downstream_ar_payload_addr = io_upstream_ar_m2sPipe_payload_addr;
  assign io_downstream_ar_payload_prot = io_upstream_ar_m2sPipe_payload_prot;
  always @(*) begin
    io_downstream_b_ready = io_downstream_b_m2sPipe_ready;
    if(when_Stream_l369_3) begin
      io_downstream_b_ready = 1'b1;
    end
  end

  assign when_Stream_l369_3 = (! io_downstream_b_m2sPipe_valid);
  assign io_downstream_b_m2sPipe_valid = io_downstream_b_rValid;
  assign io_downstream_b_m2sPipe_payload_resp = io_downstream_b_rData_resp;
  assign io_upstream_b_valid = io_downstream_b_m2sPipe_valid;
  assign io_downstream_b_m2sPipe_ready = io_upstream_b_ready;
  assign io_upstream_b_payload_resp = io_downstream_b_m2sPipe_payload_resp;
  always @(*) begin
    io_downstream_r_ready = io_downstream_r_m2sPipe_ready;
    if(when_Stream_l369_4) begin
      io_downstream_r_ready = 1'b1;
    end
  end

  assign when_Stream_l369_4 = (! io_downstream_r_m2sPipe_valid);
  assign io_downstream_r_m2sPipe_valid = io_downstream_r_rValid;
  assign io_downstream_r_m2sPipe_payload_data = io_downstream_r_rData_data;
  assign io_downstream_r_m2sPipe_payload_resp = io_downstream_r_rData_resp;
  assign io_upstream_r_valid = io_downstream_r_m2sPipe_valid;
  assign io_downstream_r_m2sPipe_ready = io_upstream_r_ready;
  assign io_upstream_r_payload_data = io_downstream_r_m2sPipe_payload_data;
  assign io_upstream_r_payload_resp = io_downstream_r_m2sPipe_payload_resp;
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
  input  wire          clk,
  input  wire          resetn
);

  wire       [1:0]    _zz_io_masters_0_b_payload_resp;
  wire       [1:0]    _zz_io_masters_1_b_payload_resp;
  wire       [1:0]    _zz__zz_when_Axi4LiteCrossbar_l131_9;
  wire       [1:0]    _zz__zz_when_Axi4LiteCrossbar_l131_9_1;
  wire       [1:0]    _zz__zz_when_Axi4LiteCrossbar_l131_9_2;
  wire       [1:0]    _zz__zz_when_Axi4LiteCrossbar_l131_9_3;
  wire       [1:0]    _zz__zz_when_Axi4LiteCrossbar_l131_19;
  wire       [1:0]    _zz__zz_when_Axi4LiteCrossbar_l131_19_1;
  wire       [1:0]    _zz__zz_when_Axi4LiteCrossbar_l131_19_2;
  wire       [1:0]    _zz__zz_when_Axi4LiteCrossbar_l131_19_3;
  wire       [1:0]    _zz__zz_when_Axi4LiteCrossbar_l131_29;
  wire       [1:0]    _zz__zz_when_Axi4LiteCrossbar_l131_29_1;
  wire       [1:0]    _zz__zz_when_Axi4LiteCrossbar_l131_29_2;
  wire       [1:0]    _zz__zz_when_Axi4LiteCrossbar_l131_29_3;
  wire       [1:0]    _zz__zz_when_Axi4LiteCrossbar_l131_39;
  wire       [1:0]    _zz__zz_when_Axi4LiteCrossbar_l131_39_1;
  wire       [1:0]    _zz__zz_when_Axi4LiteCrossbar_l131_39_2;
  wire       [1:0]    _zz__zz_when_Axi4LiteCrossbar_l131_39_3;
  reg                 wrActive_0;
  reg                 wrActive_1;
  reg        [0:0]    wrGranted_0;
  reg        [0:0]    wrGranted_1;
  reg        [0:0]    wrRrPtr_0;
  reg        [0:0]    wrRrPtr_1;
  reg                 rdActive_0;
  reg                 rdActive_1;
  reg        [0:0]    rdGranted_0;
  reg        [0:0]    rdGranted_1;
  reg        [0:0]    rdRrPtr_0;
  reg        [0:0]    rdRrPtr_1;
  reg        [1:0]    wrCredits_0_0;
  reg        [1:0]    wrCredits_0_1;
  reg        [1:0]    wrCredits_1_0;
  reg        [1:0]    wrCredits_1_1;
  reg        [1:0]    rdCredits_0_0;
  reg        [1:0]    rdCredits_0_1;
  reg        [1:0]    rdCredits_1_0;
  reg        [1:0]    rdCredits_1_1;
  wire       [33:0]   _zz_io_masters_0_r_payload_data;
  wire       [33:0]   _zz_io_masters_1_r_payload_data;
  wire       [34:0]   _zz_io_slaves_0_aw_payload_addr;
  wire       [35:0]   _zz_io_slaves_0_w_payload_data;
  wire       [34:0]   _zz_io_slaves_0_ar_payload_addr;
  wire       [34:0]   _zz_io_slaves_1_aw_payload_addr;
  wire       [35:0]   _zz_io_slaves_1_w_payload_data;
  wire       [34:0]   _zz_io_slaves_1_ar_payload_addr;
  wire                when_Axi4LiteCrossbar_l194;
  reg        [1:0]    _zz_when_Axi4LiteCrossbar_l206;
  reg        [1:0]    _zz_when_Axi4LiteCrossbar_l206_1;
  reg        [1:0]    _zz_when_Axi4LiteCrossbar_l206_2;
  reg        [1:0]    _zz_when_Axi4LiteCrossbar_l131;
  reg        [1:0]    _zz_when_Axi4LiteCrossbar_l131_1;
  wire                when_Axi4LiteCrossbar_l89;
  wire       [1:0]    _zz_when_Axi4LiteCrossbar_l131_2;
  wire       [1:0]    _zz_when_Axi4LiteCrossbar_l131_3;
  wire       [1:0]    _zz_when_Axi4LiteCrossbar_l131_4;
  reg        [1:0]    _zz_when_Axi4LiteCrossbar_l131_5;
  wire                when_Axi4LiteCrossbar_l89_1;
  wire       [1:0]    _zz_when_Axi4LiteCrossbar_l131_6;
  wire       [1:0]    _zz_when_Axi4LiteCrossbar_l131_7;
  wire       [1:0]    _zz_when_Axi4LiteCrossbar_l131_8;
  wire       [1:0]    _zz_when_Axi4LiteCrossbar_l131_9;
  reg        [0:0]    _zz_wrGranted_0;
  wire                when_Axi4LiteCrossbar_l131;
  wire                when_Axi4LiteCrossbar_l131_1;
  wire                when_Axi4LiteCrossbar_l206;
  wire                when_Axi4LiteCrossbar_l210;
  wire                when_Axi4LiteCrossbar_l210_1;
  wire                io_slaves_0_aw_fire;
  wire                when_Axi4LiteCrossbar_l230;
  wire                when_Axi4LiteCrossbar_l230_1;
  reg                 when_Axi4LiteCrossbar_l248;
  wire                when_Axi4LiteCrossbar_l238;
  reg        [1:0]    _zz_when_Axi4LiteCrossbar_l245;
  wire                when_Axi4LiteCrossbar_l242;
  wire                when_Axi4LiteCrossbar_l245;
  wire                when_Axi4LiteCrossbar_l238_1;
  reg        [1:0]    _zz_when_Axi4LiteCrossbar_l245_1;
  wire                when_Axi4LiteCrossbar_l242_1;
  wire                when_Axi4LiteCrossbar_l245_1;
  wire                when_Axi4LiteCrossbar_l262;
  wire                when_Axi4LiteCrossbar_l262_1;
  wire                io_slaves_0_b_fire;
  wire                when_Axi4LiteCrossbar_l194_1;
  reg        [1:0]    _zz_when_Axi4LiteCrossbar_l206_3;
  reg        [1:0]    _zz_when_Axi4LiteCrossbar_l206_4;
  reg        [1:0]    _zz_when_Axi4LiteCrossbar_l206_5;
  reg        [1:0]    _zz_when_Axi4LiteCrossbar_l131_10;
  reg        [1:0]    _zz_when_Axi4LiteCrossbar_l131_11;
  wire                when_Axi4LiteCrossbar_l89_2;
  wire       [1:0]    _zz_when_Axi4LiteCrossbar_l131_12;
  wire       [1:0]    _zz_when_Axi4LiteCrossbar_l131_13;
  wire       [1:0]    _zz_when_Axi4LiteCrossbar_l131_14;
  reg        [1:0]    _zz_when_Axi4LiteCrossbar_l131_15;
  wire                when_Axi4LiteCrossbar_l89_3;
  wire       [1:0]    _zz_when_Axi4LiteCrossbar_l131_16;
  wire       [1:0]    _zz_when_Axi4LiteCrossbar_l131_17;
  wire       [1:0]    _zz_when_Axi4LiteCrossbar_l131_18;
  wire       [1:0]    _zz_when_Axi4LiteCrossbar_l131_19;
  reg        [0:0]    _zz_wrGranted_1;
  wire                when_Axi4LiteCrossbar_l131_2;
  wire                when_Axi4LiteCrossbar_l131_3;
  wire                when_Axi4LiteCrossbar_l206_1;
  wire                when_Axi4LiteCrossbar_l210_2;
  wire                when_Axi4LiteCrossbar_l210_3;
  wire                io_slaves_1_aw_fire;
  wire                when_Axi4LiteCrossbar_l230_2;
  wire                when_Axi4LiteCrossbar_l230_3;
  reg                 when_Axi4LiteCrossbar_l248_1;
  wire                when_Axi4LiteCrossbar_l238_2;
  reg        [1:0]    _zz_when_Axi4LiteCrossbar_l245_2;
  wire                when_Axi4LiteCrossbar_l242_2;
  wire                when_Axi4LiteCrossbar_l245_2;
  wire                when_Axi4LiteCrossbar_l238_3;
  reg        [1:0]    _zz_when_Axi4LiteCrossbar_l245_3;
  wire                when_Axi4LiteCrossbar_l242_3;
  wire                when_Axi4LiteCrossbar_l245_3;
  wire                when_Axi4LiteCrossbar_l262_2;
  wire                when_Axi4LiteCrossbar_l262_3;
  wire                io_slaves_1_b_fire;
  wire                when_Axi4LiteCrossbar_l283;
  reg        [1:0]    _zz_when_Axi4LiteCrossbar_l294;
  reg        [1:0]    _zz_when_Axi4LiteCrossbar_l294_1;
  reg        [1:0]    _zz_when_Axi4LiteCrossbar_l294_2;
  reg        [1:0]    _zz_when_Axi4LiteCrossbar_l131_20;
  reg        [1:0]    _zz_when_Axi4LiteCrossbar_l131_21;
  wire                when_Axi4LiteCrossbar_l89_4;
  wire       [1:0]    _zz_when_Axi4LiteCrossbar_l131_22;
  wire       [1:0]    _zz_when_Axi4LiteCrossbar_l131_23;
  wire       [1:0]    _zz_when_Axi4LiteCrossbar_l131_24;
  reg        [1:0]    _zz_when_Axi4LiteCrossbar_l131_25;
  wire                when_Axi4LiteCrossbar_l89_5;
  wire       [1:0]    _zz_when_Axi4LiteCrossbar_l131_26;
  wire       [1:0]    _zz_when_Axi4LiteCrossbar_l131_27;
  wire       [1:0]    _zz_when_Axi4LiteCrossbar_l131_28;
  wire       [1:0]    _zz_when_Axi4LiteCrossbar_l131_29;
  reg        [0:0]    _zz_rdGranted_0;
  wire                when_Axi4LiteCrossbar_l131_4;
  wire                when_Axi4LiteCrossbar_l131_5;
  wire                when_Axi4LiteCrossbar_l294;
  wire                when_Axi4LiteCrossbar_l297;
  wire                when_Axi4LiteCrossbar_l297_1;
  wire                io_slaves_0_ar_fire;
  wire                when_Axi4LiteCrossbar_l311;
  wire                when_Axi4LiteCrossbar_l311_1;
  reg                 when_Axi4LiteCrossbar_l327;
  wire                when_Axi4LiteCrossbar_l318;
  reg        [1:0]    _zz_when_Axi4LiteCrossbar_l324;
  wire                when_Axi4LiteCrossbar_l321;
  wire                when_Axi4LiteCrossbar_l324;
  wire                when_Axi4LiteCrossbar_l318_1;
  reg        [1:0]    _zz_when_Axi4LiteCrossbar_l324_1;
  wire                when_Axi4LiteCrossbar_l321_1;
  wire                when_Axi4LiteCrossbar_l324_1;
  wire                when_Axi4LiteCrossbar_l340;
  wire                when_Axi4LiteCrossbar_l340_1;
  wire                io_slaves_0_r_fire;
  wire                when_Axi4LiteCrossbar_l283_1;
  reg        [1:0]    _zz_when_Axi4LiteCrossbar_l294_3;
  reg        [1:0]    _zz_when_Axi4LiteCrossbar_l294_4;
  reg        [1:0]    _zz_when_Axi4LiteCrossbar_l294_5;
  reg        [1:0]    _zz_when_Axi4LiteCrossbar_l131_30;
  reg        [1:0]    _zz_when_Axi4LiteCrossbar_l131_31;
  wire                when_Axi4LiteCrossbar_l89_6;
  wire       [1:0]    _zz_when_Axi4LiteCrossbar_l131_32;
  wire       [1:0]    _zz_when_Axi4LiteCrossbar_l131_33;
  wire       [1:0]    _zz_when_Axi4LiteCrossbar_l131_34;
  reg        [1:0]    _zz_when_Axi4LiteCrossbar_l131_35;
  wire                when_Axi4LiteCrossbar_l89_7;
  wire       [1:0]    _zz_when_Axi4LiteCrossbar_l131_36;
  wire       [1:0]    _zz_when_Axi4LiteCrossbar_l131_37;
  wire       [1:0]    _zz_when_Axi4LiteCrossbar_l131_38;
  wire       [1:0]    _zz_when_Axi4LiteCrossbar_l131_39;
  reg        [0:0]    _zz_rdGranted_1;
  wire                when_Axi4LiteCrossbar_l131_6;
  wire                when_Axi4LiteCrossbar_l131_7;
  wire                when_Axi4LiteCrossbar_l294_1;
  wire                when_Axi4LiteCrossbar_l297_2;
  wire                when_Axi4LiteCrossbar_l297_3;
  wire                io_slaves_1_ar_fire;
  wire                when_Axi4LiteCrossbar_l311_2;
  wire                when_Axi4LiteCrossbar_l311_3;
  reg                 when_Axi4LiteCrossbar_l327_1;
  wire                when_Axi4LiteCrossbar_l318_2;
  reg        [1:0]    _zz_when_Axi4LiteCrossbar_l324_2;
  wire                when_Axi4LiteCrossbar_l321_2;
  wire                when_Axi4LiteCrossbar_l324_2;
  wire                when_Axi4LiteCrossbar_l318_3;
  reg        [1:0]    _zz_when_Axi4LiteCrossbar_l324_3;
  wire                when_Axi4LiteCrossbar_l321_3;
  wire                when_Axi4LiteCrossbar_l324_3;
  wire                when_Axi4LiteCrossbar_l340_2;
  wire                when_Axi4LiteCrossbar_l340_3;
  wire                io_slaves_1_r_fire;

  assign _zz_io_masters_0_b_payload_resp = 2'b00;
  assign _zz_io_masters_1_b_payload_resp = 2'b00;
  assign _zz__zz_when_Axi4LiteCrossbar_l131_9 = (_zz_when_Axi4LiteCrossbar_l131_3 - 2'b01);
  assign _zz__zz_when_Axi4LiteCrossbar_l131_9_1 = (_zz_when_Axi4LiteCrossbar_l131_4 - 2'b01);
  assign _zz__zz_when_Axi4LiteCrossbar_l131_9_2 = (_zz_when_Axi4LiteCrossbar_l131_7 - 2'b01);
  assign _zz__zz_when_Axi4LiteCrossbar_l131_9_3 = (_zz_when_Axi4LiteCrossbar_l131_8 - 2'b01);
  assign _zz__zz_when_Axi4LiteCrossbar_l131_19 = (_zz_when_Axi4LiteCrossbar_l131_13 - 2'b01);
  assign _zz__zz_when_Axi4LiteCrossbar_l131_19_1 = (_zz_when_Axi4LiteCrossbar_l131_14 - 2'b01);
  assign _zz__zz_when_Axi4LiteCrossbar_l131_19_2 = (_zz_when_Axi4LiteCrossbar_l131_17 - 2'b01);
  assign _zz__zz_when_Axi4LiteCrossbar_l131_19_3 = (_zz_when_Axi4LiteCrossbar_l131_18 - 2'b01);
  assign _zz__zz_when_Axi4LiteCrossbar_l131_29 = (_zz_when_Axi4LiteCrossbar_l131_23 - 2'b01);
  assign _zz__zz_when_Axi4LiteCrossbar_l131_29_1 = (_zz_when_Axi4LiteCrossbar_l131_24 - 2'b01);
  assign _zz__zz_when_Axi4LiteCrossbar_l131_29_2 = (_zz_when_Axi4LiteCrossbar_l131_27 - 2'b01);
  assign _zz__zz_when_Axi4LiteCrossbar_l131_29_3 = (_zz_when_Axi4LiteCrossbar_l131_28 - 2'b01);
  assign _zz__zz_when_Axi4LiteCrossbar_l131_39 = (_zz_when_Axi4LiteCrossbar_l131_33 - 2'b01);
  assign _zz__zz_when_Axi4LiteCrossbar_l131_39_1 = (_zz_when_Axi4LiteCrossbar_l131_34 - 2'b01);
  assign _zz__zz_when_Axi4LiteCrossbar_l131_39_2 = (_zz_when_Axi4LiteCrossbar_l131_37 - 2'b01);
  assign _zz__zz_when_Axi4LiteCrossbar_l131_39_3 = (_zz_when_Axi4LiteCrossbar_l131_38 - 2'b01);
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
        if(when_Axi4LiteCrossbar_l210_2) begin
          io_masters_0_aw_ready = io_slaves_1_aw_ready;
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
        if(when_Axi4LiteCrossbar_l210_2) begin
          io_masters_0_w_ready = io_slaves_1_w_ready;
        end
      end
    end else begin
      if(when_Axi4LiteCrossbar_l262_2) begin
        io_masters_0_w_ready = io_slaves_1_w_ready;
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
      if(when_Axi4LiteCrossbar_l262_2) begin
        io_masters_0_b_valid = io_slaves_1_b_valid;
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
      if(when_Axi4LiteCrossbar_l262_2) begin
        io_masters_0_b_payload_resp = io_slaves_1_b_payload_resp;
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
        if(when_Axi4LiteCrossbar_l297_2) begin
          io_masters_0_ar_ready = io_slaves_1_ar_ready;
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
      if(when_Axi4LiteCrossbar_l340_2) begin
        io_masters_0_r_valid = io_slaves_1_r_valid;
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
      if(when_Axi4LiteCrossbar_l340_2) begin
        io_masters_0_r_payload_data = io_slaves_1_r_payload_data;
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
      if(when_Axi4LiteCrossbar_l340_2) begin
        io_masters_0_r_payload_resp = io_slaves_1_r_payload_resp;
      end
    end
  end

  always @(*) begin
    io_masters_1_aw_ready = 1'b0;
    if(when_Axi4LiteCrossbar_l194) begin
      if(when_Axi4LiteCrossbar_l206) begin
        if(when_Axi4LiteCrossbar_l210_1) begin
          io_masters_1_aw_ready = io_slaves_0_aw_ready;
        end
      end
    end
    if(when_Axi4LiteCrossbar_l194_1) begin
      if(when_Axi4LiteCrossbar_l206_1) begin
        if(when_Axi4LiteCrossbar_l210_3) begin
          io_masters_1_aw_ready = io_slaves_1_aw_ready;
        end
      end
    end
  end

  always @(*) begin
    io_masters_1_w_ready = 1'b0;
    if(when_Axi4LiteCrossbar_l194) begin
      if(when_Axi4LiteCrossbar_l206) begin
        if(when_Axi4LiteCrossbar_l210_1) begin
          io_masters_1_w_ready = io_slaves_0_w_ready;
        end
      end
    end else begin
      if(when_Axi4LiteCrossbar_l262_1) begin
        io_masters_1_w_ready = io_slaves_0_w_ready;
      end
    end
    if(when_Axi4LiteCrossbar_l194_1) begin
      if(when_Axi4LiteCrossbar_l206_1) begin
        if(when_Axi4LiteCrossbar_l210_3) begin
          io_masters_1_w_ready = io_slaves_1_w_ready;
        end
      end
    end else begin
      if(when_Axi4LiteCrossbar_l262_3) begin
        io_masters_1_w_ready = io_slaves_1_w_ready;
      end
    end
  end

  always @(*) begin
    io_masters_1_b_valid = 1'b0;
    if(!when_Axi4LiteCrossbar_l194) begin
      if(when_Axi4LiteCrossbar_l262_1) begin
        io_masters_1_b_valid = io_slaves_0_b_valid;
      end
    end
    if(!when_Axi4LiteCrossbar_l194_1) begin
      if(when_Axi4LiteCrossbar_l262_3) begin
        io_masters_1_b_valid = io_slaves_1_b_valid;
      end
    end
  end

  always @(*) begin
    io_masters_1_b_payload_resp = _zz_io_masters_1_b_payload_resp[1 : 0];
    if(!when_Axi4LiteCrossbar_l194) begin
      if(when_Axi4LiteCrossbar_l262_1) begin
        io_masters_1_b_payload_resp = io_slaves_0_b_payload_resp;
      end
    end
    if(!when_Axi4LiteCrossbar_l194_1) begin
      if(when_Axi4LiteCrossbar_l262_3) begin
        io_masters_1_b_payload_resp = io_slaves_1_b_payload_resp;
      end
    end
  end

  always @(*) begin
    io_masters_1_ar_ready = 1'b0;
    if(when_Axi4LiteCrossbar_l283) begin
      if(when_Axi4LiteCrossbar_l294) begin
        if(when_Axi4LiteCrossbar_l297_1) begin
          io_masters_1_ar_ready = io_slaves_0_ar_ready;
        end
      end
    end
    if(when_Axi4LiteCrossbar_l283_1) begin
      if(when_Axi4LiteCrossbar_l294_1) begin
        if(when_Axi4LiteCrossbar_l297_3) begin
          io_masters_1_ar_ready = io_slaves_1_ar_ready;
        end
      end
    end
  end

  always @(*) begin
    io_masters_1_r_valid = 1'b0;
    if(!when_Axi4LiteCrossbar_l283) begin
      if(when_Axi4LiteCrossbar_l340_1) begin
        io_masters_1_r_valid = io_slaves_0_r_valid;
      end
    end
    if(!when_Axi4LiteCrossbar_l283_1) begin
      if(when_Axi4LiteCrossbar_l340_3) begin
        io_masters_1_r_valid = io_slaves_1_r_valid;
      end
    end
  end

  assign _zz_io_masters_1_r_payload_data = 34'h000000000;
  always @(*) begin
    io_masters_1_r_payload_data = _zz_io_masters_1_r_payload_data[31 : 0];
    if(!when_Axi4LiteCrossbar_l283) begin
      if(when_Axi4LiteCrossbar_l340_1) begin
        io_masters_1_r_payload_data = io_slaves_0_r_payload_data;
      end
    end
    if(!when_Axi4LiteCrossbar_l283_1) begin
      if(when_Axi4LiteCrossbar_l340_3) begin
        io_masters_1_r_payload_data = io_slaves_1_r_payload_data;
      end
    end
  end

  always @(*) begin
    io_masters_1_r_payload_resp = _zz_io_masters_1_r_payload_data[33 : 32];
    if(!when_Axi4LiteCrossbar_l283) begin
      if(when_Axi4LiteCrossbar_l340_1) begin
        io_masters_1_r_payload_resp = io_slaves_0_r_payload_resp;
      end
    end
    if(!when_Axi4LiteCrossbar_l283_1) begin
      if(when_Axi4LiteCrossbar_l340_3) begin
        io_masters_1_r_payload_resp = io_slaves_1_r_payload_resp;
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
        if(when_Axi4LiteCrossbar_l210_1) begin
          io_slaves_0_aw_payload_addr = io_masters_1_aw_payload_addr;
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
        if(when_Axi4LiteCrossbar_l210_1) begin
          io_slaves_0_aw_payload_prot = io_masters_1_aw_payload_prot;
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
        if(when_Axi4LiteCrossbar_l210_1) begin
          io_slaves_0_w_valid = io_masters_1_w_valid;
        end
      end
    end else begin
      if(when_Axi4LiteCrossbar_l262) begin
        io_slaves_0_w_valid = io_masters_0_w_valid;
      end
      if(when_Axi4LiteCrossbar_l262_1) begin
        io_slaves_0_w_valid = io_masters_1_w_valid;
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
        if(when_Axi4LiteCrossbar_l210_1) begin
          io_slaves_0_w_payload_data = io_masters_1_w_payload_data;
        end
      end
    end else begin
      if(when_Axi4LiteCrossbar_l262) begin
        io_slaves_0_w_payload_data = io_masters_0_w_payload_data;
      end
      if(when_Axi4LiteCrossbar_l262_1) begin
        io_slaves_0_w_payload_data = io_masters_1_w_payload_data;
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
        if(when_Axi4LiteCrossbar_l210_1) begin
          io_slaves_0_w_payload_strb = io_masters_1_w_payload_strb;
        end
      end
    end else begin
      if(when_Axi4LiteCrossbar_l262) begin
        io_slaves_0_w_payload_strb = io_masters_0_w_payload_strb;
      end
      if(when_Axi4LiteCrossbar_l262_1) begin
        io_slaves_0_w_payload_strb = io_masters_1_w_payload_strb;
      end
    end
  end

  always @(*) begin
    io_slaves_0_b_ready = 1'b0;
    if(!when_Axi4LiteCrossbar_l194) begin
      if(when_Axi4LiteCrossbar_l262) begin
        io_slaves_0_b_ready = io_masters_0_b_ready;
      end
      if(when_Axi4LiteCrossbar_l262_1) begin
        io_slaves_0_b_ready = io_masters_1_b_ready;
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
        if(when_Axi4LiteCrossbar_l297_1) begin
          io_slaves_0_ar_payload_addr = io_masters_1_ar_payload_addr;
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
        if(when_Axi4LiteCrossbar_l297_1) begin
          io_slaves_0_ar_payload_prot = io_masters_1_ar_payload_prot;
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
      if(when_Axi4LiteCrossbar_l340_1) begin
        io_slaves_0_r_ready = io_masters_1_r_ready;
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
        if(when_Axi4LiteCrossbar_l210_2) begin
          io_slaves_1_aw_payload_addr = io_masters_0_aw_payload_addr;
        end
        if(when_Axi4LiteCrossbar_l210_3) begin
          io_slaves_1_aw_payload_addr = io_masters_1_aw_payload_addr;
        end
      end
    end
  end

  always @(*) begin
    io_slaves_1_aw_payload_prot = _zz_io_slaves_1_aw_payload_addr[34 : 32];
    if(when_Axi4LiteCrossbar_l194_1) begin
      if(when_Axi4LiteCrossbar_l206_1) begin
        if(when_Axi4LiteCrossbar_l210_2) begin
          io_slaves_1_aw_payload_prot = io_masters_0_aw_payload_prot;
        end
        if(when_Axi4LiteCrossbar_l210_3) begin
          io_slaves_1_aw_payload_prot = io_masters_1_aw_payload_prot;
        end
      end
    end
  end

  always @(*) begin
    io_slaves_1_w_valid = 1'b0;
    if(when_Axi4LiteCrossbar_l194_1) begin
      if(when_Axi4LiteCrossbar_l206_1) begin
        if(when_Axi4LiteCrossbar_l210_2) begin
          io_slaves_1_w_valid = io_masters_0_w_valid;
        end
        if(when_Axi4LiteCrossbar_l210_3) begin
          io_slaves_1_w_valid = io_masters_1_w_valid;
        end
      end
    end else begin
      if(when_Axi4LiteCrossbar_l262_2) begin
        io_slaves_1_w_valid = io_masters_0_w_valid;
      end
      if(when_Axi4LiteCrossbar_l262_3) begin
        io_slaves_1_w_valid = io_masters_1_w_valid;
      end
    end
  end

  assign _zz_io_slaves_1_w_payload_data = 36'h000000000;
  always @(*) begin
    io_slaves_1_w_payload_data = _zz_io_slaves_1_w_payload_data[31 : 0];
    if(when_Axi4LiteCrossbar_l194_1) begin
      if(when_Axi4LiteCrossbar_l206_1) begin
        if(when_Axi4LiteCrossbar_l210_2) begin
          io_slaves_1_w_payload_data = io_masters_0_w_payload_data;
        end
        if(when_Axi4LiteCrossbar_l210_3) begin
          io_slaves_1_w_payload_data = io_masters_1_w_payload_data;
        end
      end
    end else begin
      if(when_Axi4LiteCrossbar_l262_2) begin
        io_slaves_1_w_payload_data = io_masters_0_w_payload_data;
      end
      if(when_Axi4LiteCrossbar_l262_3) begin
        io_slaves_1_w_payload_data = io_masters_1_w_payload_data;
      end
    end
  end

  always @(*) begin
    io_slaves_1_w_payload_strb = _zz_io_slaves_1_w_payload_data[35 : 32];
    if(when_Axi4LiteCrossbar_l194_1) begin
      if(when_Axi4LiteCrossbar_l206_1) begin
        if(when_Axi4LiteCrossbar_l210_2) begin
          io_slaves_1_w_payload_strb = io_masters_0_w_payload_strb;
        end
        if(when_Axi4LiteCrossbar_l210_3) begin
          io_slaves_1_w_payload_strb = io_masters_1_w_payload_strb;
        end
      end
    end else begin
      if(when_Axi4LiteCrossbar_l262_2) begin
        io_slaves_1_w_payload_strb = io_masters_0_w_payload_strb;
      end
      if(when_Axi4LiteCrossbar_l262_3) begin
        io_slaves_1_w_payload_strb = io_masters_1_w_payload_strb;
      end
    end
  end

  always @(*) begin
    io_slaves_1_b_ready = 1'b0;
    if(!when_Axi4LiteCrossbar_l194_1) begin
      if(when_Axi4LiteCrossbar_l262_2) begin
        io_slaves_1_b_ready = io_masters_0_b_ready;
      end
      if(when_Axi4LiteCrossbar_l262_3) begin
        io_slaves_1_b_ready = io_masters_1_b_ready;
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
        if(when_Axi4LiteCrossbar_l297_2) begin
          io_slaves_1_ar_payload_addr = io_masters_0_ar_payload_addr;
        end
        if(when_Axi4LiteCrossbar_l297_3) begin
          io_slaves_1_ar_payload_addr = io_masters_1_ar_payload_addr;
        end
      end
    end
  end

  always @(*) begin
    io_slaves_1_ar_payload_prot = _zz_io_slaves_1_ar_payload_addr[34 : 32];
    if(when_Axi4LiteCrossbar_l283_1) begin
      if(when_Axi4LiteCrossbar_l294_1) begin
        if(when_Axi4LiteCrossbar_l297_2) begin
          io_slaves_1_ar_payload_prot = io_masters_0_ar_payload_prot;
        end
        if(when_Axi4LiteCrossbar_l297_3) begin
          io_slaves_1_ar_payload_prot = io_masters_1_ar_payload_prot;
        end
      end
    end
  end

  always @(*) begin
    io_slaves_1_r_ready = 1'b0;
    if(!when_Axi4LiteCrossbar_l283_1) begin
      if(when_Axi4LiteCrossbar_l340_2) begin
        io_slaves_1_r_ready = io_masters_0_r_ready;
      end
      if(when_Axi4LiteCrossbar_l340_3) begin
        io_slaves_1_r_ready = io_masters_1_r_ready;
      end
    end
  end

  assign when_Axi4LiteCrossbar_l194 = (! wrActive_0);
  always @(*) begin
    _zz_when_Axi4LiteCrossbar_l206_1[0] = ((32'h00000000 <= io_masters_0_aw_payload_addr) && (io_masters_0_aw_payload_addr < 32'h00010000));
    _zz_when_Axi4LiteCrossbar_l206_1[1] = ((32'h00010000 <= io_masters_0_aw_payload_addr) && (io_masters_0_aw_payload_addr < 32'h00020000));
  end

  always @(*) begin
    _zz_when_Axi4LiteCrossbar_l206[0] = (io_masters_0_aw_valid && _zz_when_Axi4LiteCrossbar_l206_1[0]);
    _zz_when_Axi4LiteCrossbar_l206[1] = (io_masters_1_aw_valid && _zz_when_Axi4LiteCrossbar_l206_2[0]);
  end

  always @(*) begin
    _zz_when_Axi4LiteCrossbar_l206_2[0] = ((32'h00000000 <= io_masters_1_aw_payload_addr) && (io_masters_1_aw_payload_addr < 32'h00010000));
    _zz_when_Axi4LiteCrossbar_l206_2[1] = ((32'h00010000 <= io_masters_1_aw_payload_addr) && (io_masters_1_aw_payload_addr < 32'h00020000));
  end

  always @(*) begin
    _zz_when_Axi4LiteCrossbar_l131[0] = (_zz_when_Axi4LiteCrossbar_l206[0] && (wrCredits_0_0 != 2'b00));
    _zz_when_Axi4LiteCrossbar_l131[1] = (_zz_when_Axi4LiteCrossbar_l206[1] && (wrCredits_0_1 != 2'b00));
  end

  always @(*) begin
    _zz_when_Axi4LiteCrossbar_l131_1 = 2'b00;
    if(when_Axi4LiteCrossbar_l89) begin
      _zz_when_Axi4LiteCrossbar_l131_1 = 2'b01;
    end
  end

  assign when_Axi4LiteCrossbar_l89 = (1'b1 <= wrRrPtr_0);
  assign _zz_when_Axi4LiteCrossbar_l131_2 = (_zz_when_Axi4LiteCrossbar_l131 & (~ _zz_when_Axi4LiteCrossbar_l131_1));
  assign _zz_when_Axi4LiteCrossbar_l131_3 = _zz_when_Axi4LiteCrossbar_l131_2;
  assign _zz_when_Axi4LiteCrossbar_l131_4 = _zz_when_Axi4LiteCrossbar_l131;
  always @(*) begin
    _zz_when_Axi4LiteCrossbar_l131_5 = 2'b00;
    if(when_Axi4LiteCrossbar_l89_1) begin
      _zz_when_Axi4LiteCrossbar_l131_5 = 2'b01;
    end
  end

  assign when_Axi4LiteCrossbar_l89_1 = (1'b1 <= wrRrPtr_0);
  assign _zz_when_Axi4LiteCrossbar_l131_6 = (_zz_when_Axi4LiteCrossbar_l206 & (~ _zz_when_Axi4LiteCrossbar_l131_5));
  assign _zz_when_Axi4LiteCrossbar_l131_7 = _zz_when_Axi4LiteCrossbar_l131_6;
  assign _zz_when_Axi4LiteCrossbar_l131_8 = _zz_when_Axi4LiteCrossbar_l206;
  assign _zz_when_Axi4LiteCrossbar_l131_9 = ((|_zz_when_Axi4LiteCrossbar_l131) ? ((|_zz_when_Axi4LiteCrossbar_l131_2) ? (_zz_when_Axi4LiteCrossbar_l131_3 & (~ _zz__zz_when_Axi4LiteCrossbar_l131_9)) : (_zz_when_Axi4LiteCrossbar_l131_4 & (~ _zz__zz_when_Axi4LiteCrossbar_l131_9_1))) : ((|_zz_when_Axi4LiteCrossbar_l131_6) ? (_zz_when_Axi4LiteCrossbar_l131_7 & (~ _zz__zz_when_Axi4LiteCrossbar_l131_9_2)) : (_zz_when_Axi4LiteCrossbar_l131_8 & (~ _zz__zz_when_Axi4LiteCrossbar_l131_9_3))));
  always @(*) begin
    _zz_wrGranted_0 = 1'b0;
    if(when_Axi4LiteCrossbar_l131) begin
      _zz_wrGranted_0 = 1'b0;
    end
    if(when_Axi4LiteCrossbar_l131_1) begin
      _zz_wrGranted_0 = 1'b1;
    end
  end

  assign when_Axi4LiteCrossbar_l131 = _zz_when_Axi4LiteCrossbar_l131_9[0];
  assign when_Axi4LiteCrossbar_l131_1 = _zz_when_Axi4LiteCrossbar_l131_9[1];
  assign when_Axi4LiteCrossbar_l206 = (|_zz_when_Axi4LiteCrossbar_l206);
  assign when_Axi4LiteCrossbar_l210 = (_zz_wrGranted_0 == 1'b0);
  assign when_Axi4LiteCrossbar_l210_1 = (_zz_wrGranted_0 == 1'b1);
  assign io_slaves_0_aw_fire = (io_slaves_0_aw_valid && io_slaves_0_aw_ready);
  assign when_Axi4LiteCrossbar_l230 = ((_zz_wrGranted_0 == 1'b0) && (wrCredits_0_0 != 2'b00));
  assign when_Axi4LiteCrossbar_l230_1 = ((_zz_wrGranted_0 == 1'b1) && (wrCredits_0_1 != 2'b00));
  always @(*) begin
    when_Axi4LiteCrossbar_l248 = 1'b1;
    if(when_Axi4LiteCrossbar_l238) begin
      if(when_Axi4LiteCrossbar_l245) begin
        when_Axi4LiteCrossbar_l248 = 1'b0;
      end
    end
    if(when_Axi4LiteCrossbar_l238_1) begin
      if(when_Axi4LiteCrossbar_l245_1) begin
        when_Axi4LiteCrossbar_l248 = 1'b0;
      end
    end
  end

  assign when_Axi4LiteCrossbar_l238 = _zz_when_Axi4LiteCrossbar_l206[0];
  always @(*) begin
    _zz_when_Axi4LiteCrossbar_l245 = wrCredits_0_0;
    if(when_Axi4LiteCrossbar_l242) begin
      _zz_when_Axi4LiteCrossbar_l245 = (wrCredits_0_0 - 2'b01);
    end
  end

  assign when_Axi4LiteCrossbar_l242 = ((_zz_wrGranted_0 == 1'b0) && (wrCredits_0_0 != 2'b00));
  assign when_Axi4LiteCrossbar_l245 = (_zz_when_Axi4LiteCrossbar_l245 != 2'b00);
  assign when_Axi4LiteCrossbar_l238_1 = _zz_when_Axi4LiteCrossbar_l206[1];
  always @(*) begin
    _zz_when_Axi4LiteCrossbar_l245_1 = wrCredits_0_1;
    if(when_Axi4LiteCrossbar_l242_1) begin
      _zz_when_Axi4LiteCrossbar_l245_1 = (wrCredits_0_1 - 2'b01);
    end
  end

  assign when_Axi4LiteCrossbar_l242_1 = ((_zz_wrGranted_0 == 1'b1) && (wrCredits_0_1 != 2'b00));
  assign when_Axi4LiteCrossbar_l245_1 = (_zz_when_Axi4LiteCrossbar_l245_1 != 2'b00);
  assign when_Axi4LiteCrossbar_l262 = (wrGranted_0 == 1'b0);
  assign when_Axi4LiteCrossbar_l262_1 = (wrGranted_0 == 1'b1);
  assign io_slaves_0_b_fire = (io_slaves_0_b_valid && io_slaves_0_b_ready);
  assign when_Axi4LiteCrossbar_l194_1 = (! wrActive_1);
  always @(*) begin
    _zz_when_Axi4LiteCrossbar_l206_4[0] = ((32'h00000000 <= io_masters_0_aw_payload_addr) && (io_masters_0_aw_payload_addr < 32'h00010000));
    _zz_when_Axi4LiteCrossbar_l206_4[1] = ((32'h00010000 <= io_masters_0_aw_payload_addr) && (io_masters_0_aw_payload_addr < 32'h00020000));
  end

  always @(*) begin
    _zz_when_Axi4LiteCrossbar_l206_3[0] = (io_masters_0_aw_valid && _zz_when_Axi4LiteCrossbar_l206_4[1]);
    _zz_when_Axi4LiteCrossbar_l206_3[1] = (io_masters_1_aw_valid && _zz_when_Axi4LiteCrossbar_l206_5[1]);
  end

  always @(*) begin
    _zz_when_Axi4LiteCrossbar_l206_5[0] = ((32'h00000000 <= io_masters_1_aw_payload_addr) && (io_masters_1_aw_payload_addr < 32'h00010000));
    _zz_when_Axi4LiteCrossbar_l206_5[1] = ((32'h00010000 <= io_masters_1_aw_payload_addr) && (io_masters_1_aw_payload_addr < 32'h00020000));
  end

  always @(*) begin
    _zz_when_Axi4LiteCrossbar_l131_10[0] = (_zz_when_Axi4LiteCrossbar_l206_3[0] && (wrCredits_1_0 != 2'b00));
    _zz_when_Axi4LiteCrossbar_l131_10[1] = (_zz_when_Axi4LiteCrossbar_l206_3[1] && (wrCredits_1_1 != 2'b00));
  end

  always @(*) begin
    _zz_when_Axi4LiteCrossbar_l131_11 = 2'b00;
    if(when_Axi4LiteCrossbar_l89_2) begin
      _zz_when_Axi4LiteCrossbar_l131_11 = 2'b01;
    end
  end

  assign when_Axi4LiteCrossbar_l89_2 = (1'b1 <= wrRrPtr_1);
  assign _zz_when_Axi4LiteCrossbar_l131_12 = (_zz_when_Axi4LiteCrossbar_l131_10 & (~ _zz_when_Axi4LiteCrossbar_l131_11));
  assign _zz_when_Axi4LiteCrossbar_l131_13 = _zz_when_Axi4LiteCrossbar_l131_12;
  assign _zz_when_Axi4LiteCrossbar_l131_14 = _zz_when_Axi4LiteCrossbar_l131_10;
  always @(*) begin
    _zz_when_Axi4LiteCrossbar_l131_15 = 2'b00;
    if(when_Axi4LiteCrossbar_l89_3) begin
      _zz_when_Axi4LiteCrossbar_l131_15 = 2'b01;
    end
  end

  assign when_Axi4LiteCrossbar_l89_3 = (1'b1 <= wrRrPtr_1);
  assign _zz_when_Axi4LiteCrossbar_l131_16 = (_zz_when_Axi4LiteCrossbar_l206_3 & (~ _zz_when_Axi4LiteCrossbar_l131_15));
  assign _zz_when_Axi4LiteCrossbar_l131_17 = _zz_when_Axi4LiteCrossbar_l131_16;
  assign _zz_when_Axi4LiteCrossbar_l131_18 = _zz_when_Axi4LiteCrossbar_l206_3;
  assign _zz_when_Axi4LiteCrossbar_l131_19 = ((|_zz_when_Axi4LiteCrossbar_l131_10) ? ((|_zz_when_Axi4LiteCrossbar_l131_12) ? (_zz_when_Axi4LiteCrossbar_l131_13 & (~ _zz__zz_when_Axi4LiteCrossbar_l131_19)) : (_zz_when_Axi4LiteCrossbar_l131_14 & (~ _zz__zz_when_Axi4LiteCrossbar_l131_19_1))) : ((|_zz_when_Axi4LiteCrossbar_l131_16) ? (_zz_when_Axi4LiteCrossbar_l131_17 & (~ _zz__zz_when_Axi4LiteCrossbar_l131_19_2)) : (_zz_when_Axi4LiteCrossbar_l131_18 & (~ _zz__zz_when_Axi4LiteCrossbar_l131_19_3))));
  always @(*) begin
    _zz_wrGranted_1 = 1'b0;
    if(when_Axi4LiteCrossbar_l131_2) begin
      _zz_wrGranted_1 = 1'b0;
    end
    if(when_Axi4LiteCrossbar_l131_3) begin
      _zz_wrGranted_1 = 1'b1;
    end
  end

  assign when_Axi4LiteCrossbar_l131_2 = _zz_when_Axi4LiteCrossbar_l131_19[0];
  assign when_Axi4LiteCrossbar_l131_3 = _zz_when_Axi4LiteCrossbar_l131_19[1];
  assign when_Axi4LiteCrossbar_l206_1 = (|_zz_when_Axi4LiteCrossbar_l206_3);
  assign when_Axi4LiteCrossbar_l210_2 = (_zz_wrGranted_1 == 1'b0);
  assign when_Axi4LiteCrossbar_l210_3 = (_zz_wrGranted_1 == 1'b1);
  assign io_slaves_1_aw_fire = (io_slaves_1_aw_valid && io_slaves_1_aw_ready);
  assign when_Axi4LiteCrossbar_l230_2 = ((_zz_wrGranted_1 == 1'b0) && (wrCredits_1_0 != 2'b00));
  assign when_Axi4LiteCrossbar_l230_3 = ((_zz_wrGranted_1 == 1'b1) && (wrCredits_1_1 != 2'b00));
  always @(*) begin
    when_Axi4LiteCrossbar_l248_1 = 1'b1;
    if(when_Axi4LiteCrossbar_l238_2) begin
      if(when_Axi4LiteCrossbar_l245_2) begin
        when_Axi4LiteCrossbar_l248_1 = 1'b0;
      end
    end
    if(when_Axi4LiteCrossbar_l238_3) begin
      if(when_Axi4LiteCrossbar_l245_3) begin
        when_Axi4LiteCrossbar_l248_1 = 1'b0;
      end
    end
  end

  assign when_Axi4LiteCrossbar_l238_2 = _zz_when_Axi4LiteCrossbar_l206_3[0];
  always @(*) begin
    _zz_when_Axi4LiteCrossbar_l245_2 = wrCredits_1_0;
    if(when_Axi4LiteCrossbar_l242_2) begin
      _zz_when_Axi4LiteCrossbar_l245_2 = (wrCredits_1_0 - 2'b01);
    end
  end

  assign when_Axi4LiteCrossbar_l242_2 = ((_zz_wrGranted_1 == 1'b0) && (wrCredits_1_0 != 2'b00));
  assign when_Axi4LiteCrossbar_l245_2 = (_zz_when_Axi4LiteCrossbar_l245_2 != 2'b00);
  assign when_Axi4LiteCrossbar_l238_3 = _zz_when_Axi4LiteCrossbar_l206_3[1];
  always @(*) begin
    _zz_when_Axi4LiteCrossbar_l245_3 = wrCredits_1_1;
    if(when_Axi4LiteCrossbar_l242_3) begin
      _zz_when_Axi4LiteCrossbar_l245_3 = (wrCredits_1_1 - 2'b01);
    end
  end

  assign when_Axi4LiteCrossbar_l242_3 = ((_zz_wrGranted_1 == 1'b1) && (wrCredits_1_1 != 2'b00));
  assign when_Axi4LiteCrossbar_l245_3 = (_zz_when_Axi4LiteCrossbar_l245_3 != 2'b00);
  assign when_Axi4LiteCrossbar_l262_2 = (wrGranted_1 == 1'b0);
  assign when_Axi4LiteCrossbar_l262_3 = (wrGranted_1 == 1'b1);
  assign io_slaves_1_b_fire = (io_slaves_1_b_valid && io_slaves_1_b_ready);
  assign when_Axi4LiteCrossbar_l283 = (! rdActive_0);
  always @(*) begin
    _zz_when_Axi4LiteCrossbar_l294_1[0] = ((32'h00000000 <= io_masters_0_ar_payload_addr) && (io_masters_0_ar_payload_addr < 32'h00010000));
    _zz_when_Axi4LiteCrossbar_l294_1[1] = ((32'h00010000 <= io_masters_0_ar_payload_addr) && (io_masters_0_ar_payload_addr < 32'h00020000));
  end

  always @(*) begin
    _zz_when_Axi4LiteCrossbar_l294[0] = (io_masters_0_ar_valid && _zz_when_Axi4LiteCrossbar_l294_1[0]);
    _zz_when_Axi4LiteCrossbar_l294[1] = (io_masters_1_ar_valid && _zz_when_Axi4LiteCrossbar_l294_2[0]);
  end

  always @(*) begin
    _zz_when_Axi4LiteCrossbar_l294_2[0] = ((32'h00000000 <= io_masters_1_ar_payload_addr) && (io_masters_1_ar_payload_addr < 32'h00010000));
    _zz_when_Axi4LiteCrossbar_l294_2[1] = ((32'h00010000 <= io_masters_1_ar_payload_addr) && (io_masters_1_ar_payload_addr < 32'h00020000));
  end

  always @(*) begin
    _zz_when_Axi4LiteCrossbar_l131_20[0] = (_zz_when_Axi4LiteCrossbar_l294[0] && (rdCredits_0_0 != 2'b00));
    _zz_when_Axi4LiteCrossbar_l131_20[1] = (_zz_when_Axi4LiteCrossbar_l294[1] && (rdCredits_0_1 != 2'b00));
  end

  always @(*) begin
    _zz_when_Axi4LiteCrossbar_l131_21 = 2'b00;
    if(when_Axi4LiteCrossbar_l89_4) begin
      _zz_when_Axi4LiteCrossbar_l131_21 = 2'b01;
    end
  end

  assign when_Axi4LiteCrossbar_l89_4 = (1'b1 <= rdRrPtr_0);
  assign _zz_when_Axi4LiteCrossbar_l131_22 = (_zz_when_Axi4LiteCrossbar_l131_20 & (~ _zz_when_Axi4LiteCrossbar_l131_21));
  assign _zz_when_Axi4LiteCrossbar_l131_23 = _zz_when_Axi4LiteCrossbar_l131_22;
  assign _zz_when_Axi4LiteCrossbar_l131_24 = _zz_when_Axi4LiteCrossbar_l131_20;
  always @(*) begin
    _zz_when_Axi4LiteCrossbar_l131_25 = 2'b00;
    if(when_Axi4LiteCrossbar_l89_5) begin
      _zz_when_Axi4LiteCrossbar_l131_25 = 2'b01;
    end
  end

  assign when_Axi4LiteCrossbar_l89_5 = (1'b1 <= rdRrPtr_0);
  assign _zz_when_Axi4LiteCrossbar_l131_26 = (_zz_when_Axi4LiteCrossbar_l294 & (~ _zz_when_Axi4LiteCrossbar_l131_25));
  assign _zz_when_Axi4LiteCrossbar_l131_27 = _zz_when_Axi4LiteCrossbar_l131_26;
  assign _zz_when_Axi4LiteCrossbar_l131_28 = _zz_when_Axi4LiteCrossbar_l294;
  assign _zz_when_Axi4LiteCrossbar_l131_29 = ((|_zz_when_Axi4LiteCrossbar_l131_20) ? ((|_zz_when_Axi4LiteCrossbar_l131_22) ? (_zz_when_Axi4LiteCrossbar_l131_23 & (~ _zz__zz_when_Axi4LiteCrossbar_l131_29)) : (_zz_when_Axi4LiteCrossbar_l131_24 & (~ _zz__zz_when_Axi4LiteCrossbar_l131_29_1))) : ((|_zz_when_Axi4LiteCrossbar_l131_26) ? (_zz_when_Axi4LiteCrossbar_l131_27 & (~ _zz__zz_when_Axi4LiteCrossbar_l131_29_2)) : (_zz_when_Axi4LiteCrossbar_l131_28 & (~ _zz__zz_when_Axi4LiteCrossbar_l131_29_3))));
  always @(*) begin
    _zz_rdGranted_0 = 1'b0;
    if(when_Axi4LiteCrossbar_l131_4) begin
      _zz_rdGranted_0 = 1'b0;
    end
    if(when_Axi4LiteCrossbar_l131_5) begin
      _zz_rdGranted_0 = 1'b1;
    end
  end

  assign when_Axi4LiteCrossbar_l131_4 = _zz_when_Axi4LiteCrossbar_l131_29[0];
  assign when_Axi4LiteCrossbar_l131_5 = _zz_when_Axi4LiteCrossbar_l131_29[1];
  assign when_Axi4LiteCrossbar_l294 = (|_zz_when_Axi4LiteCrossbar_l294);
  assign when_Axi4LiteCrossbar_l297 = (_zz_rdGranted_0 == 1'b0);
  assign when_Axi4LiteCrossbar_l297_1 = (_zz_rdGranted_0 == 1'b1);
  assign io_slaves_0_ar_fire = (io_slaves_0_ar_valid && io_slaves_0_ar_ready);
  assign when_Axi4LiteCrossbar_l311 = ((_zz_rdGranted_0 == 1'b0) && (rdCredits_0_0 != 2'b00));
  assign when_Axi4LiteCrossbar_l311_1 = ((_zz_rdGranted_0 == 1'b1) && (rdCredits_0_1 != 2'b00));
  always @(*) begin
    when_Axi4LiteCrossbar_l327 = 1'b1;
    if(when_Axi4LiteCrossbar_l318) begin
      if(when_Axi4LiteCrossbar_l324) begin
        when_Axi4LiteCrossbar_l327 = 1'b0;
      end
    end
    if(when_Axi4LiteCrossbar_l318_1) begin
      if(when_Axi4LiteCrossbar_l324_1) begin
        when_Axi4LiteCrossbar_l327 = 1'b0;
      end
    end
  end

  assign when_Axi4LiteCrossbar_l318 = _zz_when_Axi4LiteCrossbar_l294[0];
  always @(*) begin
    _zz_when_Axi4LiteCrossbar_l324 = rdCredits_0_0;
    if(when_Axi4LiteCrossbar_l321) begin
      _zz_when_Axi4LiteCrossbar_l324 = (rdCredits_0_0 - 2'b01);
    end
  end

  assign when_Axi4LiteCrossbar_l321 = ((_zz_rdGranted_0 == 1'b0) && (rdCredits_0_0 != 2'b00));
  assign when_Axi4LiteCrossbar_l324 = (_zz_when_Axi4LiteCrossbar_l324 != 2'b00);
  assign when_Axi4LiteCrossbar_l318_1 = _zz_when_Axi4LiteCrossbar_l294[1];
  always @(*) begin
    _zz_when_Axi4LiteCrossbar_l324_1 = rdCredits_0_1;
    if(when_Axi4LiteCrossbar_l321_1) begin
      _zz_when_Axi4LiteCrossbar_l324_1 = (rdCredits_0_1 - 2'b01);
    end
  end

  assign when_Axi4LiteCrossbar_l321_1 = ((_zz_rdGranted_0 == 1'b1) && (rdCredits_0_1 != 2'b00));
  assign when_Axi4LiteCrossbar_l324_1 = (_zz_when_Axi4LiteCrossbar_l324_1 != 2'b00);
  assign when_Axi4LiteCrossbar_l340 = (rdGranted_0 == 1'b0);
  assign when_Axi4LiteCrossbar_l340_1 = (rdGranted_0 == 1'b1);
  assign io_slaves_0_r_fire = (io_slaves_0_r_valid && io_slaves_0_r_ready);
  assign when_Axi4LiteCrossbar_l283_1 = (! rdActive_1);
  always @(*) begin
    _zz_when_Axi4LiteCrossbar_l294_4[0] = ((32'h00000000 <= io_masters_0_ar_payload_addr) && (io_masters_0_ar_payload_addr < 32'h00010000));
    _zz_when_Axi4LiteCrossbar_l294_4[1] = ((32'h00010000 <= io_masters_0_ar_payload_addr) && (io_masters_0_ar_payload_addr < 32'h00020000));
  end

  always @(*) begin
    _zz_when_Axi4LiteCrossbar_l294_3[0] = (io_masters_0_ar_valid && _zz_when_Axi4LiteCrossbar_l294_4[1]);
    _zz_when_Axi4LiteCrossbar_l294_3[1] = (io_masters_1_ar_valid && _zz_when_Axi4LiteCrossbar_l294_5[1]);
  end

  always @(*) begin
    _zz_when_Axi4LiteCrossbar_l294_5[0] = ((32'h00000000 <= io_masters_1_ar_payload_addr) && (io_masters_1_ar_payload_addr < 32'h00010000));
    _zz_when_Axi4LiteCrossbar_l294_5[1] = ((32'h00010000 <= io_masters_1_ar_payload_addr) && (io_masters_1_ar_payload_addr < 32'h00020000));
  end

  always @(*) begin
    _zz_when_Axi4LiteCrossbar_l131_30[0] = (_zz_when_Axi4LiteCrossbar_l294_3[0] && (rdCredits_1_0 != 2'b00));
    _zz_when_Axi4LiteCrossbar_l131_30[1] = (_zz_when_Axi4LiteCrossbar_l294_3[1] && (rdCredits_1_1 != 2'b00));
  end

  always @(*) begin
    _zz_when_Axi4LiteCrossbar_l131_31 = 2'b00;
    if(when_Axi4LiteCrossbar_l89_6) begin
      _zz_when_Axi4LiteCrossbar_l131_31 = 2'b01;
    end
  end

  assign when_Axi4LiteCrossbar_l89_6 = (1'b1 <= rdRrPtr_1);
  assign _zz_when_Axi4LiteCrossbar_l131_32 = (_zz_when_Axi4LiteCrossbar_l131_30 & (~ _zz_when_Axi4LiteCrossbar_l131_31));
  assign _zz_when_Axi4LiteCrossbar_l131_33 = _zz_when_Axi4LiteCrossbar_l131_32;
  assign _zz_when_Axi4LiteCrossbar_l131_34 = _zz_when_Axi4LiteCrossbar_l131_30;
  always @(*) begin
    _zz_when_Axi4LiteCrossbar_l131_35 = 2'b00;
    if(when_Axi4LiteCrossbar_l89_7) begin
      _zz_when_Axi4LiteCrossbar_l131_35 = 2'b01;
    end
  end

  assign when_Axi4LiteCrossbar_l89_7 = (1'b1 <= rdRrPtr_1);
  assign _zz_when_Axi4LiteCrossbar_l131_36 = (_zz_when_Axi4LiteCrossbar_l294_3 & (~ _zz_when_Axi4LiteCrossbar_l131_35));
  assign _zz_when_Axi4LiteCrossbar_l131_37 = _zz_when_Axi4LiteCrossbar_l131_36;
  assign _zz_when_Axi4LiteCrossbar_l131_38 = _zz_when_Axi4LiteCrossbar_l294_3;
  assign _zz_when_Axi4LiteCrossbar_l131_39 = ((|_zz_when_Axi4LiteCrossbar_l131_30) ? ((|_zz_when_Axi4LiteCrossbar_l131_32) ? (_zz_when_Axi4LiteCrossbar_l131_33 & (~ _zz__zz_when_Axi4LiteCrossbar_l131_39)) : (_zz_when_Axi4LiteCrossbar_l131_34 & (~ _zz__zz_when_Axi4LiteCrossbar_l131_39_1))) : ((|_zz_when_Axi4LiteCrossbar_l131_36) ? (_zz_when_Axi4LiteCrossbar_l131_37 & (~ _zz__zz_when_Axi4LiteCrossbar_l131_39_2)) : (_zz_when_Axi4LiteCrossbar_l131_38 & (~ _zz__zz_when_Axi4LiteCrossbar_l131_39_3))));
  always @(*) begin
    _zz_rdGranted_1 = 1'b0;
    if(when_Axi4LiteCrossbar_l131_6) begin
      _zz_rdGranted_1 = 1'b0;
    end
    if(when_Axi4LiteCrossbar_l131_7) begin
      _zz_rdGranted_1 = 1'b1;
    end
  end

  assign when_Axi4LiteCrossbar_l131_6 = _zz_when_Axi4LiteCrossbar_l131_39[0];
  assign when_Axi4LiteCrossbar_l131_7 = _zz_when_Axi4LiteCrossbar_l131_39[1];
  assign when_Axi4LiteCrossbar_l294_1 = (|_zz_when_Axi4LiteCrossbar_l294_3);
  assign when_Axi4LiteCrossbar_l297_2 = (_zz_rdGranted_1 == 1'b0);
  assign when_Axi4LiteCrossbar_l297_3 = (_zz_rdGranted_1 == 1'b1);
  assign io_slaves_1_ar_fire = (io_slaves_1_ar_valid && io_slaves_1_ar_ready);
  assign when_Axi4LiteCrossbar_l311_2 = ((_zz_rdGranted_1 == 1'b0) && (rdCredits_1_0 != 2'b00));
  assign when_Axi4LiteCrossbar_l311_3 = ((_zz_rdGranted_1 == 1'b1) && (rdCredits_1_1 != 2'b00));
  always @(*) begin
    when_Axi4LiteCrossbar_l327_1 = 1'b1;
    if(when_Axi4LiteCrossbar_l318_2) begin
      if(when_Axi4LiteCrossbar_l324_2) begin
        when_Axi4LiteCrossbar_l327_1 = 1'b0;
      end
    end
    if(when_Axi4LiteCrossbar_l318_3) begin
      if(when_Axi4LiteCrossbar_l324_3) begin
        when_Axi4LiteCrossbar_l327_1 = 1'b0;
      end
    end
  end

  assign when_Axi4LiteCrossbar_l318_2 = _zz_when_Axi4LiteCrossbar_l294_3[0];
  always @(*) begin
    _zz_when_Axi4LiteCrossbar_l324_2 = rdCredits_1_0;
    if(when_Axi4LiteCrossbar_l321_2) begin
      _zz_when_Axi4LiteCrossbar_l324_2 = (rdCredits_1_0 - 2'b01);
    end
  end

  assign when_Axi4LiteCrossbar_l321_2 = ((_zz_rdGranted_1 == 1'b0) && (rdCredits_1_0 != 2'b00));
  assign when_Axi4LiteCrossbar_l324_2 = (_zz_when_Axi4LiteCrossbar_l324_2 != 2'b00);
  assign when_Axi4LiteCrossbar_l318_3 = _zz_when_Axi4LiteCrossbar_l294_3[1];
  always @(*) begin
    _zz_when_Axi4LiteCrossbar_l324_3 = rdCredits_1_1;
    if(when_Axi4LiteCrossbar_l321_3) begin
      _zz_when_Axi4LiteCrossbar_l324_3 = (rdCredits_1_1 - 2'b01);
    end
  end

  assign when_Axi4LiteCrossbar_l321_3 = ((_zz_rdGranted_1 == 1'b1) && (rdCredits_1_1 != 2'b00));
  assign when_Axi4LiteCrossbar_l324_3 = (_zz_when_Axi4LiteCrossbar_l324_3 != 2'b00);
  assign when_Axi4LiteCrossbar_l340_2 = (rdGranted_1 == 1'b0);
  assign when_Axi4LiteCrossbar_l340_3 = (rdGranted_1 == 1'b1);
  assign io_slaves_1_r_fire = (io_slaves_1_r_valid && io_slaves_1_r_ready);
  always @(posedge clk) begin
    if(!resetn) begin
      wrActive_0 <= 1'b0;
      wrActive_1 <= 1'b0;
      wrGranted_0 <= 1'b0;
      wrGranted_1 <= 1'b0;
      wrRrPtr_0 <= 1'b0;
      wrRrPtr_1 <= 1'b0;
      rdActive_0 <= 1'b0;
      rdActive_1 <= 1'b0;
      rdGranted_0 <= 1'b0;
      rdGranted_1 <= 1'b0;
      rdRrPtr_0 <= 1'b0;
      rdRrPtr_1 <= 1'b0;
      wrCredits_0_0 <= 2'b11;
      wrCredits_0_1 <= 2'b01;
      wrCredits_1_0 <= 2'b11;
      wrCredits_1_1 <= 2'b01;
      rdCredits_0_0 <= 2'b11;
      rdCredits_0_1 <= 2'b01;
      rdCredits_1_0 <= 2'b11;
      rdCredits_1_1 <= 2'b01;
    end else begin
      if(when_Axi4LiteCrossbar_l194) begin
        if(when_Axi4LiteCrossbar_l206) begin
          if(io_slaves_0_aw_fire) begin
            wrActive_0 <= 1'b1;
            wrGranted_0 <= _zz_wrGranted_0;
            wrRrPtr_0 <= (_zz_wrGranted_0 + 1'b1);
            if(when_Axi4LiteCrossbar_l230) begin
              wrCredits_0_0 <= (wrCredits_0_0 - 2'b01);
            end
            if(when_Axi4LiteCrossbar_l230_1) begin
              wrCredits_0_1 <= (wrCredits_0_1 - 2'b01);
            end
            if(when_Axi4LiteCrossbar_l248) begin
              wrCredits_0_0 <= 2'b11;
              wrCredits_0_1 <= 2'b01;
            end
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
            if(when_Axi4LiteCrossbar_l230_2) begin
              wrCredits_1_0 <= (wrCredits_1_0 - 2'b01);
            end
            if(when_Axi4LiteCrossbar_l230_3) begin
              wrCredits_1_1 <= (wrCredits_1_1 - 2'b01);
            end
            if(when_Axi4LiteCrossbar_l248_1) begin
              wrCredits_1_0 <= 2'b11;
              wrCredits_1_1 <= 2'b01;
            end
          end
        end
      end else begin
        if(io_slaves_1_b_fire) begin
          wrActive_1 <= 1'b0;
        end
      end
      if(when_Axi4LiteCrossbar_l283) begin
        if(when_Axi4LiteCrossbar_l294) begin
          if(io_slaves_0_ar_fire) begin
            rdActive_0 <= 1'b1;
            rdGranted_0 <= _zz_rdGranted_0;
            rdRrPtr_0 <= (_zz_rdGranted_0 + 1'b1);
            if(when_Axi4LiteCrossbar_l311) begin
              rdCredits_0_0 <= (rdCredits_0_0 - 2'b01);
            end
            if(when_Axi4LiteCrossbar_l311_1) begin
              rdCredits_0_1 <= (rdCredits_0_1 - 2'b01);
            end
            if(when_Axi4LiteCrossbar_l327) begin
              rdCredits_0_0 <= 2'b11;
              rdCredits_0_1 <= 2'b01;
            end
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
            if(when_Axi4LiteCrossbar_l311_2) begin
              rdCredits_1_0 <= (rdCredits_1_0 - 2'b01);
            end
            if(when_Axi4LiteCrossbar_l311_3) begin
              rdCredits_1_1 <= (rdCredits_1_1 - 2'b01);
            end
            if(when_Axi4LiteCrossbar_l327_1) begin
              rdCredits_1_0 <= 2'b11;
              rdCredits_1_1 <= 2'b01;
            end
          end
        end
      end else begin
        if(io_slaves_1_r_fire) begin
          rdActive_1 <= 1'b0;
        end
      end
    end
  end


endmodule
