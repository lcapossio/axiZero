// Copyright (c) 2026 Leonardo Capossio - bard0 design  hello@bard0.com
// SPDX-License-Identifier: MIT
// Generator : SpinalHDL v1.14.2    git head : 78f29dc66110fc099a777992b6daa2f803ab445e
// Component : AxiStreamRegSlice
// Git hash  : c7f02aefbe00cd12f17e50e87e7cc6a26db8edf3

`timescale 1ns/1ps

module AxiStreamRegSlice (
  input  wire          s_axis_tvalid,
  output reg           s_axis_tready,
  input  wire [31:0]   s_axis_tdata,
  input  wire [3:0]    s_axis_tstrb,
  input  wire [3:0]    s_axis_tkeep,
  input  wire          s_axis_tlast,
  output wire          m_axis_tvalid,
  input  wire          m_axis_tready,
  output wire [31:0]   m_axis_tdata,
  output wire [3:0]    m_axis_tstrb,
  output wire [3:0]    m_axis_tkeep,
  output wire          m_axis_tlast,
  input  wire          aclk,
  input  wire          aresetn
);

  wire                io_input_stage_valid;
  wire                io_input_stage_ready;
  wire       [31:0]   io_input_stage_payload_data;
  wire       [3:0]    io_input_stage_payload_strb;
  wire       [3:0]    io_input_stage_payload_keep;
  wire                io_input_stage_payload_last;
  reg                 io_input_rValid;
  reg        [31:0]   io_input_rData_data;
  reg        [3:0]    io_input_rData_strb;
  reg        [3:0]    io_input_rData_keep;
  reg                 io_input_rData_last;
  wire                when_Stream_l477;

  always @(*) begin
    s_axis_tready = io_input_stage_ready;
    if(when_Stream_l477) begin
      s_axis_tready = 1'b1;
    end
  end

  assign when_Stream_l477 = (! io_input_stage_valid);
  assign io_input_stage_valid = io_input_rValid;
  assign io_input_stage_payload_data = io_input_rData_data;
  assign io_input_stage_payload_strb = io_input_rData_strb;
  assign io_input_stage_payload_keep = io_input_rData_keep;
  assign io_input_stage_payload_last = io_input_rData_last;
  assign m_axis_tvalid = io_input_stage_valid;
  assign io_input_stage_ready = m_axis_tready;
  assign m_axis_tdata = io_input_stage_payload_data;
  assign m_axis_tstrb = io_input_stage_payload_strb;
  assign m_axis_tkeep = io_input_stage_payload_keep;
  assign m_axis_tlast = io_input_stage_payload_last;
  always @(posedge aclk) begin
    if(!aresetn) begin
      io_input_rValid <= 1'b0;
    end else begin
      if(s_axis_tready) begin
        io_input_rValid <= s_axis_tvalid;
      end
    end
  end

  always @(posedge aclk) begin
    if(s_axis_tready) begin
      io_input_rData_data <= s_axis_tdata;
      io_input_rData_strb <= s_axis_tstrb;
      io_input_rData_keep <= s_axis_tkeep;
      io_input_rData_last <= s_axis_tlast;
    end
  end


endmodule
