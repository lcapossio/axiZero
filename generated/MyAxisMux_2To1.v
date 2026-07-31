// Copyright (c) 2026 Leonardo Capossio - bard0 design  hello@bard0.com
// SPDX-License-Identifier: MIT
// Generator : SpinalHDL v1.14.2    git head : 78f29dc66110fc099a777992b6daa2f803ab445e
// Component : AxiStreamArbMux
// Git hash  : c7f02aefbe00cd12f17e50e87e7cc6a26db8edf3

`timescale 1ns/1ps

module AxiStreamArbMux (
  input  wire          s0_axis_tvalid,
  output reg           s0_axis_tready,
  input  wire [31:0]   s0_axis_tdata,
  input  wire [3:0]    s0_axis_tstrb,
  input  wire [3:0]    s0_axis_tkeep,
  input  wire          s0_axis_tlast,
  input  wire          s1_axis_tvalid,
  output reg           s1_axis_tready,
  input  wire [31:0]   s1_axis_tdata,
  input  wire [3:0]    s1_axis_tstrb,
  input  wire [3:0]    s1_axis_tkeep,
  input  wire          s1_axis_tlast,
  output wire          m_axis_tvalid,
  input  wire          m_axis_tready,
  output wire [31:0]   m_axis_tdata,
  output wire [3:0]    m_axis_tstrb,
  output wire [3:0]    m_axis_tkeep,
  output wire          m_axis_tlast,
  input  wire          aclk,
  input  wire          aresetn
);

  wire       [3:0]    _zz__zz_grantOh_2;
  wire       [3:0]    _zz__zz_grantOh_2_1;
  wire       [1:0]    _zz__zz_grantOh_2_2;
  wire       [1:0]    _zz__zz_grantOh_2_3;
  reg                 _zz_io_output_valid;
  reg        [31:0]   _zz_io_output_payload_data;
  reg        [3:0]    _zz_io_output_payload_strb;
  reg        [3:0]    _zz_io_output_payload_keep;
  reg                 _zz_io_output_payload_last;
  reg        [0:0]    rrPtr;
  reg                 active;
  reg        [0:0]    owner;
  reg        [1:0]    requests;
  wire       [1:0]    _zz_grantOh;
  wire       [3:0]    _zz_grantOh_1;
  wire       [3:0]    _zz_grantOh_2;
  wire       [1:0]    grantOh;
  wire                _zz_grantIdx;
  wire       [0:0]    grantIdx;
  wire       [0:0]    selIdx;
  wire                when_AxiStreamCores_l114;
  wire                when_AxiStreamCores_l114_1;
  wire                io_output_fire;
  wire                when_AxiStreamCores_l119;
  wire                when_AxiStreamCores_l121;
  wire                when_AxiStreamCores_l126;
  wire                when_AxiStreamCores_l133;

  assign _zz__zz_grantOh_2 = (_zz_grantOh_1 - _zz__zz_grantOh_2_1);
  assign _zz__zz_grantOh_2_2 = _zz__zz_grantOh_2_3;
  assign _zz__zz_grantOh_2_1 = {2'd0, _zz__zz_grantOh_2_2};
  assign _zz__zz_grantOh_2_3 = (2'b01 <<< rrPtr);
  always @(*) begin
    case(selIdx)
      1'b0 : begin
        _zz_io_output_valid = s0_axis_tvalid;
        _zz_io_output_payload_data = s0_axis_tdata;
        _zz_io_output_payload_strb = s0_axis_tstrb;
        _zz_io_output_payload_keep = s0_axis_tkeep;
        _zz_io_output_payload_last = s0_axis_tlast;
      end
      default : begin
        _zz_io_output_valid = s1_axis_tvalid;
        _zz_io_output_payload_data = s1_axis_tdata;
        _zz_io_output_payload_strb = s1_axis_tstrb;
        _zz_io_output_payload_keep = s1_axis_tkeep;
        _zz_io_output_payload_last = s1_axis_tlast;
      end
    endcase
  end

  always @(*) begin
    requests[0] = s0_axis_tvalid;
    requests[1] = s1_axis_tvalid;
  end

  always @(*) begin
    s0_axis_tready = 1'b0;
    if(when_AxiStreamCores_l114) begin
      s0_axis_tready = m_axis_tready;
    end
  end

  always @(*) begin
    s1_axis_tready = 1'b0;
    if(when_AxiStreamCores_l114_1) begin
      s1_axis_tready = m_axis_tready;
    end
  end

  assign _zz_grantOh = requests;
  assign _zz_grantOh_1 = {_zz_grantOh,_zz_grantOh};
  assign _zz_grantOh_2 = (_zz_grantOh_1 & (~ _zz__zz_grantOh_2));
  assign grantOh = (_zz_grantOh_2[3 : 2] | _zz_grantOh_2[1 : 0]);
  assign _zz_grantIdx = grantOh[1];
  assign grantIdx = _zz_grantIdx;
  assign selIdx = (active ? owner : grantIdx);
  assign m_axis_tvalid = _zz_io_output_valid;
  assign m_axis_tdata = _zz_io_output_payload_data;
  assign m_axis_tstrb = _zz_io_output_payload_strb;
  assign m_axis_tkeep = _zz_io_output_payload_keep;
  assign m_axis_tlast = _zz_io_output_payload_last;
  assign when_AxiStreamCores_l114 = (selIdx == 1'b0);
  assign when_AxiStreamCores_l114_1 = (selIdx == 1'b1);
  assign io_output_fire = (m_axis_tvalid && m_axis_tready);
  assign when_AxiStreamCores_l119 = ((! active) && io_output_fire);
  assign when_AxiStreamCores_l121 = (! m_axis_tlast);
  assign when_AxiStreamCores_l126 = (grantIdx == 1'b1);
  assign when_AxiStreamCores_l133 = ((active && io_output_fire) && m_axis_tlast);
  always @(posedge aclk) begin
    if(!aresetn) begin
      rrPtr <= 1'b0;
      active <= 1'b0;
      owner <= 1'b0;
    end else begin
      if(when_AxiStreamCores_l119) begin
        owner <= grantIdx;
        if(when_AxiStreamCores_l121) begin
          active <= 1'b1;
        end
        if(when_AxiStreamCores_l126) begin
          rrPtr <= 1'b0;
        end else begin
          rrPtr <= (grantIdx + 1'b1);
        end
      end else begin
        if(when_AxiStreamCores_l133) begin
          active <= 1'b0;
        end
      end
    end
  end


endmodule
