// Copyright (c) 2026 Leonardo Capossio - bard0 design  hello@bard0.com
// SPDX-License-Identifier: MIT
// Clocked cocotb wrapper for axizero.stream.AxiStreamBroadcaster.
//
// AxiStreamBroadcaster is combinational and intentionally has no clock/reset
// ports, while cocotbext-axi stream BFMs are clocked. Keep this port list in
// lockstep with the generated AxiStreamBroadcaster wrapper port naming.

`timescale 1ns/1ps

module AxisBroadcastWrapper (
  input  wire          aclk,
  input  wire          aresetn,
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

  wire unused_clock_reset = aclk ^ aresetn;

  AxiStreamBroadcaster dut (
    .s_axis_tvalid(s_axis_tvalid),
    .s_axis_tready(s_axis_tready),
    .s_axis_tdata(s_axis_tdata),
    .s_axis_tstrb(s_axis_tstrb),
    .s_axis_tkeep(s_axis_tkeep),
    .s_axis_tlast(s_axis_tlast),
    .m0_axis_tvalid(m0_axis_tvalid),
    .m0_axis_tready(m0_axis_tready),
    .m0_axis_tdata(m0_axis_tdata),
    .m0_axis_tstrb(m0_axis_tstrb),
    .m0_axis_tkeep(m0_axis_tkeep),
    .m0_axis_tlast(m0_axis_tlast),
    .m1_axis_tvalid(m1_axis_tvalid),
    .m1_axis_tready(m1_axis_tready),
    .m1_axis_tdata(m1_axis_tdata),
    .m1_axis_tstrb(m1_axis_tstrb),
    .m1_axis_tkeep(m1_axis_tkeep),
    .m1_axis_tlast(m1_axis_tlast)
  );

endmodule
