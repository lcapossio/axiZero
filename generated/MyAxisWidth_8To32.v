// Copyright (c) 2026 Leonardo Capossio - bard0 design  hello@bard0.com
// SPDX-License-Identifier: MIT
// Generator : SpinalHDL v1.14.2    git head : 78f29dc66110fc099a777992b6daa2f803ab445e
// Component : AxiStreamWidthAdapter
// Git hash  : c7f02aefbe00cd12f17e50e87e7cc6a26db8edf3

`timescale 1ns/1ps

module AxiStreamWidthAdapter (
  input  wire          s_axis_tvalid,
  output wire          s_axis_tready,
  input  wire [7:0]    s_axis_tdata,
  input  wire [0:0]    s_axis_tstrb,
  input  wire [0:0]    s_axis_tkeep,
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

  wire                axi4StreamSimpleWidthAdapter_1_io_axis_s_ready;
  wire                axi4StreamSimpleWidthAdapter_1_io_axis_m_valid;
  wire       [31:0]   axi4StreamSimpleWidthAdapter_1_io_axis_m_payload_data;
  wire       [3:0]    axi4StreamSimpleWidthAdapter_1_io_axis_m_payload_strb;
  wire       [3:0]    axi4StreamSimpleWidthAdapter_1_io_axis_m_payload_keep;
  wire                axi4StreamSimpleWidthAdapter_1_io_axis_m_payload_last;

  Axi4StreamSimpleWidthAdapter axi4StreamSimpleWidthAdapter_1 (
    .io_axis_s_valid        (s_axis_tvalid                                             ), //i
    .io_axis_s_ready        (axi4StreamSimpleWidthAdapter_1_io_axis_s_ready             ), //o
    .io_axis_s_payload_data (s_axis_tdata[7:0]                                 ), //i
    .io_axis_s_payload_strb (s_axis_tstrb                                      ), //i
    .io_axis_s_payload_keep (s_axis_tkeep                                      ), //i
    .io_axis_s_payload_last (s_axis_tlast                                      ), //i
    .io_axis_m_valid        (axi4StreamSimpleWidthAdapter_1_io_axis_m_valid             ), //o
    .io_axis_m_ready        (m_axis_tready                                            ), //i
    .io_axis_m_payload_data (axi4StreamSimpleWidthAdapter_1_io_axis_m_payload_data[31:0]), //o
    .io_axis_m_payload_strb (axi4StreamSimpleWidthAdapter_1_io_axis_m_payload_strb[3:0] ), //o
    .io_axis_m_payload_keep (axi4StreamSimpleWidthAdapter_1_io_axis_m_payload_keep[3:0] ), //o
    .io_axis_m_payload_last (axi4StreamSimpleWidthAdapter_1_io_axis_m_payload_last      ), //o
    .aclk                    (aclk                                                        ), //i
    .aresetn                 (aresetn                                                     )  //i
  );
  assign s_axis_tready = axi4StreamSimpleWidthAdapter_1_io_axis_s_ready;
  assign m_axis_tvalid = axi4StreamSimpleWidthAdapter_1_io_axis_m_valid;
  assign m_axis_tdata = axi4StreamSimpleWidthAdapter_1_io_axis_m_payload_data;
  assign m_axis_tstrb = axi4StreamSimpleWidthAdapter_1_io_axis_m_payload_strb;
  assign m_axis_tkeep = axi4StreamSimpleWidthAdapter_1_io_axis_m_payload_keep;
  assign m_axis_tlast = axi4StreamSimpleWidthAdapter_1_io_axis_m_payload_last;

endmodule

module Axi4StreamSimpleWidthAdapter (
  input  wire          io_axis_s_valid,
  output wire          io_axis_s_ready,
  input  wire [7:0]    io_axis_s_payload_data,
  input  wire [0:0]    io_axis_s_payload_strb,
  input  wire [0:0]    io_axis_s_payload_keep,
  input  wire          io_axis_s_payload_last,
  output wire          io_axis_m_valid,
  input  wire          io_axis_m_ready,
  output wire [31:0]   io_axis_m_payload_data,
  output wire [3:0]    io_axis_m_payload_strb,
  output wire [3:0]    io_axis_m_payload_keep,
  output wire          io_axis_m_payload_last,
  input  wire          aclk,
  input  wire          aresetn
);

  wire       [2:0]    _zz__zz_io_axis_s_ready_1;
  wire       [0:0]    _zz__zz_io_axis_s_ready_1_1;
  wire       [7:0]    _zz__zz_io_axis_m_payload_data;
  wire       [3:0]    _zz__zz_io_axis_m_payload_data_1;
  wire       [3:0]    _zz__zz_io_axis_m_payload_keep;
  wire       [3:0]    _zz__zz_io_axis_m_payload_strb;
  wire                io_axis_s_fire;
  reg                 _zz_io_axis_s_ready;
  reg                 _zz_1;
  reg        [2:0]    _zz_io_axis_s_ready_1;
  reg        [2:0]    _zz_io_axis_s_ready_2;
  wire                _zz_io_axis_s_ready_3;
  wire                _zz_2;
  reg        [31:0]   _zz_io_axis_m_payload_data;
  reg        [3:0]    _zz_io_axis_m_payload_strb;
  reg        [3:0]    _zz_io_axis_m_payload_keep;
  reg                 _zz_io_axis_s_ready_4;
  wire                io_axis_m_fire;
  wire                when_Axi4StreamSimpleWidthAdapter_l83;

  assign _zz__zz_io_axis_m_payload_data = (_zz__zz_io_axis_m_payload_data_1 * 4'b1000);
  assign _zz__zz_io_axis_m_payload_keep = (_zz_io_axis_s_ready_2 * 1'b1);
  assign _zz__zz_io_axis_m_payload_strb = (_zz_io_axis_s_ready_2 * 1'b1);
  assign _zz__zz_io_axis_s_ready_1_1 = _zz_io_axis_s_ready;
  assign _zz__zz_io_axis_s_ready_1 = {2'd0, _zz__zz_io_axis_s_ready_1_1};
  assign _zz__zz_io_axis_m_payload_data_1 = (_zz_io_axis_s_ready_2 * 1'b1);
  assign io_axis_s_fire = (io_axis_s_valid && io_axis_s_ready);
  always @(*) begin
    _zz_io_axis_s_ready = 1'b0;
    if(io_axis_s_fire) begin
      _zz_io_axis_s_ready = 1'b1;
    end
  end

  always @(*) begin
    _zz_1 = 1'b0;
    if(io_axis_m_fire) begin
      _zz_1 = 1'b1;
    end
  end

  assign _zz_io_axis_s_ready_3 = (_zz_io_axis_s_ready_2 == 3'b100);
  assign _zz_2 = (_zz_io_axis_s_ready_3 && _zz_io_axis_s_ready);
  always @(*) begin
    _zz_io_axis_s_ready_1 = (_zz_io_axis_s_ready_2 + _zz__zz_io_axis_s_ready_1);
    if(_zz_2) begin
      _zz_io_axis_s_ready_1 = 3'b000;
    end
    if(_zz_1) begin
      _zz_io_axis_s_ready_1 = 3'b000;
    end
  end

  assign io_axis_m_fire = (io_axis_m_valid && io_axis_m_ready);
  assign when_Axi4StreamSimpleWidthAdapter_l83 = (io_axis_s_payload_last && io_axis_s_fire);
  assign io_axis_m_payload_data = _zz_io_axis_m_payload_data;
  assign io_axis_m_payload_keep = _zz_io_axis_m_payload_keep;
  assign io_axis_m_payload_strb = _zz_io_axis_m_payload_strb;
  assign io_axis_m_payload_last = _zz_io_axis_s_ready_4;
  assign io_axis_s_ready = ((! _zz_io_axis_s_ready_3) && (! _zz_io_axis_s_ready_4));
  assign io_axis_m_valid = (_zz_io_axis_s_ready_3 || _zz_io_axis_s_ready_4);
  always @(posedge aclk) begin
    if(!aresetn) begin
      _zz_io_axis_s_ready_2 <= 3'b000;
      _zz_io_axis_m_payload_data <= 32'h0;
      _zz_io_axis_m_payload_keep <= 4'b0000;
      _zz_io_axis_m_payload_strb <= 4'b0000;
      _zz_io_axis_s_ready_4 <= 1'b0;
    end else begin
      _zz_io_axis_s_ready_2 <= _zz_io_axis_s_ready_1;
      if(io_axis_s_fire) begin
        _zz_io_axis_m_payload_data[_zz__zz_io_axis_m_payload_data +: 8] <= io_axis_s_payload_data;
        _zz_io_axis_m_payload_keep[_zz__zz_io_axis_m_payload_keep +: 1] <= io_axis_s_payload_keep;
        _zz_io_axis_m_payload_strb[_zz__zz_io_axis_m_payload_strb +: 1] <= io_axis_s_payload_strb;
      end
      if(when_Axi4StreamSimpleWidthAdapter_l83) begin
        _zz_io_axis_s_ready_4 <= 1'b1;
      end
      if(io_axis_m_fire) begin
        _zz_io_axis_s_ready_4 <= 1'b0;
      end
      if(io_axis_m_fire) begin
        _zz_io_axis_m_payload_data <= 32'h0;
        _zz_io_axis_m_payload_strb <= 4'b0000;
        _zz_io_axis_m_payload_keep <= 4'b0000;
      end
    end
  end


endmodule
