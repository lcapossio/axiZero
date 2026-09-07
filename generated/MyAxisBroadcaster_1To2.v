// Copyright (c) 2026 Leonardo Capossio - bard0 design  hello@bard0.com
// SPDX-License-Identifier: MIT
// Generator : SpinalHDL v1.14.2    git head : 78f29dc66110fc099a777992b6daa2f803ab445e
// Component : AxiStreamBroadcaster
// Git hash  : e4ae231ab45f2af93f68dbb509b855f6a8cb625a

`timescale 1ns/1ps

module AxiStreamBroadcaster (
  input  wire          s_axis_tvalid,
  output wire          s_axis_tready,
  input  wire [31:0]   s_axis_tdata,
  input  wire [3:0]    s_axis_tstrb,
  input  wire [3:0]    s_axis_tkeep,
  input  wire          s_axis_tlast,
  output wire          m0_axis_tvalid,
  input  wire          m0_axis_tready,
  output wire [31:0]   m0_axis_tdata,
  output wire [3:0]    m0_axis_tstrb,
  output wire [3:0]    m0_axis_tkeep,
  output wire          m0_axis_tlast,
  output wire          m1_axis_tvalid,
  input  wire          m1_axis_tready,
  output wire [31:0]   m1_axis_tdata,
  output wire [3:0]    m1_axis_tstrb,
  output wire [3:0]    m1_axis_tkeep,
  output wire          m1_axis_tlast
);

  wire                io_input_fork_io_input_ready;
  wire                io_input_fork_io_outputs_0_valid;
  wire       [31:0]   io_input_fork_io_outputs_0_payload_data;
  wire       [3:0]    io_input_fork_io_outputs_0_payload_strb;
  wire       [3:0]    io_input_fork_io_outputs_0_payload_keep;
  wire                io_input_fork_io_outputs_0_payload_last;
  wire                io_input_fork_io_outputs_1_valid;
  wire       [31:0]   io_input_fork_io_outputs_1_payload_data;
  wire       [3:0]    io_input_fork_io_outputs_1_payload_strb;
  wire       [3:0]    io_input_fork_io_outputs_1_payload_keep;
  wire                io_input_fork_io_outputs_1_payload_last;

  StreamFork io_input_fork (
    .s_axis_tvalid            (s_axis_tvalid                               ), //i
    .s_axis_tready            (io_input_fork_io_input_ready                 ), //o
    .s_axis_tdata     (s_axis_tdata[31:0]                  ), //i
    .s_axis_tstrb     (s_axis_tstrb[3:0]                   ), //i
    .s_axis_tkeep     (s_axis_tkeep[3:0]                   ), //i
    .s_axis_tlast     (s_axis_tlast                        ), //i
    .m0_axis_tvalid        (io_input_fork_io_outputs_0_valid             ), //o
    .m0_axis_tready        (m0_axis_tready                           ), //i
    .m0_axis_tdata (io_input_fork_io_outputs_0_payload_data[31:0]), //o
    .m0_axis_tstrb (io_input_fork_io_outputs_0_payload_strb[3:0] ), //o
    .m0_axis_tkeep (io_input_fork_io_outputs_0_payload_keep[3:0] ), //o
    .m0_axis_tlast (io_input_fork_io_outputs_0_payload_last      ), //o
    .m1_axis_tvalid        (io_input_fork_io_outputs_1_valid             ), //o
    .m1_axis_tready        (m1_axis_tready                           ), //i
    .m1_axis_tdata (io_input_fork_io_outputs_1_payload_data[31:0]), //o
    .m1_axis_tstrb (io_input_fork_io_outputs_1_payload_strb[3:0] ), //o
    .m1_axis_tkeep (io_input_fork_io_outputs_1_payload_keep[3:0] ), //o
    .m1_axis_tlast (io_input_fork_io_outputs_1_payload_last      )  //o
  );
  assign s_axis_tready = io_input_fork_io_input_ready;
  assign m0_axis_tvalid = io_input_fork_io_outputs_0_valid;
  assign m0_axis_tdata = io_input_fork_io_outputs_0_payload_data;
  assign m0_axis_tstrb = io_input_fork_io_outputs_0_payload_strb;
  assign m0_axis_tkeep = io_input_fork_io_outputs_0_payload_keep;
  assign m0_axis_tlast = io_input_fork_io_outputs_0_payload_last;
  assign m1_axis_tvalid = io_input_fork_io_outputs_1_valid;
  assign m1_axis_tdata = io_input_fork_io_outputs_1_payload_data;
  assign m1_axis_tstrb = io_input_fork_io_outputs_1_payload_strb;
  assign m1_axis_tkeep = io_input_fork_io_outputs_1_payload_keep;
  assign m1_axis_tlast = io_input_fork_io_outputs_1_payload_last;

endmodule

module StreamFork (
  input  wire          s_axis_tvalid,
  output wire          s_axis_tready,
  input  wire [31:0]   s_axis_tdata,
  input  wire [3:0]    s_axis_tstrb,
  input  wire [3:0]    s_axis_tkeep,
  input  wire          s_axis_tlast,
  output wire          m0_axis_tvalid,
  input  wire          m0_axis_tready,
  output wire [31:0]   m0_axis_tdata,
  output wire [3:0]    m0_axis_tstrb,
  output wire [3:0]    m0_axis_tkeep,
  output wire          m0_axis_tlast,
  output wire          m1_axis_tvalid,
  input  wire          m1_axis_tready,
  output wire [31:0]   m1_axis_tdata,
  output wire [3:0]    m1_axis_tstrb,
  output wire [3:0]    m1_axis_tkeep,
  output wire          m1_axis_tlast
);


  assign s_axis_tready = (m0_axis_tready && m1_axis_tready);
  assign m0_axis_tvalid = (s_axis_tvalid && s_axis_tready);
  assign m1_axis_tvalid = (s_axis_tvalid && s_axis_tready);
  assign m0_axis_tdata = s_axis_tdata;
  assign m0_axis_tstrb = s_axis_tstrb;
  assign m0_axis_tkeep = s_axis_tkeep;
  assign m0_axis_tlast = s_axis_tlast;
  assign m1_axis_tdata = s_axis_tdata;
  assign m1_axis_tstrb = s_axis_tstrb;
  assign m1_axis_tkeep = s_axis_tkeep;
  assign m1_axis_tlast = s_axis_tlast;

endmodule
