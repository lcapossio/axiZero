// Copyright (c) 2026 Leonardo Capossio - bard0 design  hello@bard0.com
// SPDX-License-Identifier: MIT
// Generator : SpinalHDL v1.14.2    git head : 78f29dc66110fc099a777992b6daa2f803ab445e
// Component : AxiStreamDemux
// Git hash  : e4ae231ab45f2af93f68dbb509b855f6a8cb625a

`timescale 1ns/1ps

module AxiStreamDemux (
  input  wire          s_axis_tvalid,
  output reg           s_axis_tready,
  input  wire [31:0]   s_axis_tdata,
  input  wire [3:0]    s_axis_tstrb,
  input  wire [3:0]    s_axis_tkeep,
  input  wire          s_axis_tlast,
  input  wire [0:0]    select,
  output reg           m0_axis_tvalid,
  input  wire          m0_axis_tready,
  output wire [31:0]   m0_axis_tdata,
  output wire [3:0]    m0_axis_tstrb,
  output wire [3:0]    m0_axis_tkeep,
  output wire          m0_axis_tlast,
  output reg           m1_axis_tvalid,
  input  wire          m1_axis_tready,
  output wire [31:0]   m1_axis_tdata,
  output wire [3:0]    m1_axis_tstrb,
  output wire [3:0]    m1_axis_tkeep,
  output wire          m1_axis_tlast,
  input  wire          aclk,
  input  wire          aresetn
);

  reg                 active;
  reg        [0:0]    owner;
  reg                 ownerValid;
  wire       [0:0]    selIdx;
  wire                when_AxiStreamCores_l165;
  wire                when_AxiStreamCores_l165_1;
  wire                when_AxiStreamCores_l171;
  wire                when_AxiStreamCores_l174;
  wire                io_input_fire;
  wire                when_AxiStreamCores_l178;
  wire                when_AxiStreamCores_l179;
  wire                when_AxiStreamCores_l184;

  assign selIdx = ((active || ownerValid) ? owner : select);
  always @(*) begin
    s_axis_tready = 1'b0;
    if(when_AxiStreamCores_l165) begin
      s_axis_tready = m0_axis_tready;
    end
    if(when_AxiStreamCores_l165_1) begin
      s_axis_tready = m1_axis_tready;
    end
  end

  always @(*) begin
    m0_axis_tvalid = 1'b0;
    if(when_AxiStreamCores_l165) begin
      m0_axis_tvalid = s_axis_tvalid;
    end
  end

  assign m0_axis_tdata = s_axis_tdata;
  assign m0_axis_tstrb = s_axis_tstrb;
  assign m0_axis_tkeep = s_axis_tkeep;
  assign m0_axis_tlast = s_axis_tlast;
  assign when_AxiStreamCores_l165 = (selIdx == 1'b0);
  always @(*) begin
    m1_axis_tvalid = 1'b0;
    if(when_AxiStreamCores_l165_1) begin
      m1_axis_tvalid = s_axis_tvalid;
    end
  end

  assign m1_axis_tdata = s_axis_tdata;
  assign m1_axis_tstrb = s_axis_tstrb;
  assign m1_axis_tkeep = s_axis_tkeep;
  assign m1_axis_tlast = s_axis_tlast;
  assign when_AxiStreamCores_l165_1 = (selIdx == 1'b1);
  assign when_AxiStreamCores_l171 = (((! active) && s_axis_tvalid) && (! ownerValid));
  assign when_AxiStreamCores_l174 = ((! active) && (! s_axis_tvalid));
  assign io_input_fire = (s_axis_tvalid && s_axis_tready);
  assign when_AxiStreamCores_l178 = ((! active) && io_input_fire);
  assign when_AxiStreamCores_l179 = (! s_axis_tlast);
  assign when_AxiStreamCores_l184 = ((active && io_input_fire) && s_axis_tlast);
  always @(posedge aclk) begin
    if(!aresetn) begin
      active <= 1'b0;
      owner <= 1'b0;
      ownerValid <= 1'b0;
    end else begin
      if(when_AxiStreamCores_l171) begin
        owner <= select;
        ownerValid <= 1'b1;
      end else begin
        if(when_AxiStreamCores_l174) begin
          ownerValid <= 1'b0;
        end
      end
      if(when_AxiStreamCores_l178) begin
        if(when_AxiStreamCores_l179) begin
          active <= 1'b1;
        end else begin
          ownerValid <= 1'b0;
        end
      end else begin
        if(when_AxiStreamCores_l184) begin
          active <= 1'b0;
          ownerValid <= 1'b0;
        end
      end
    end
  end


endmodule
