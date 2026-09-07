// Copyright (c) 2026 Leonardo Capossio - bard0 design  hello@bard0.com
// SPDX-License-Identifier: MIT
// Generator : SpinalHDL v1.14.2    git head : 78f29dc66110fc099a777992b6daa2f803ab445e
// Component : AxiStreamFifo
// Git hash  : e4ae231ab45f2af93f68dbb509b855f6a8cb625a

`timescale 1ns/1ps

module AxiStreamFifo (
  input  wire          s_axis_tvalid,
  output wire          s_axis_tready,
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

  wire                io_input_fifo_io_push_ready;
  wire                io_input_fifo_io_pop_valid;
  wire       [31:0]   io_input_fifo_io_pop_payload_data;
  wire       [3:0]    io_input_fifo_io_pop_payload_strb;
  wire       [3:0]    io_input_fifo_io_pop_payload_keep;
  wire                io_input_fifo_io_pop_payload_last;
  wire       [4:0]    io_input_fifo_io_occupancy;
  wire       [4:0]    io_input_fifo_io_availability;

  StreamFifo io_input_fifo (
    .io_push_valid        (s_axis_tvalid                         ), //i
    .io_push_ready        (io_input_fifo_io_push_ready            ), //o
    .io_push_payload_data (s_axis_tdata[31:0]            ), //i
    .io_push_payload_strb (s_axis_tstrb[3:0]             ), //i
    .io_push_payload_keep (s_axis_tkeep[3:0]             ), //i
    .io_push_payload_last (s_axis_tlast                  ), //i
    .io_pop_valid         (io_input_fifo_io_pop_valid             ), //o
    .io_pop_ready         (m_axis_tready                        ), //i
    .io_pop_payload_data  (io_input_fifo_io_pop_payload_data[31:0]), //o
    .io_pop_payload_strb  (io_input_fifo_io_pop_payload_strb[3:0] ), //o
    .io_pop_payload_keep  (io_input_fifo_io_pop_payload_keep[3:0] ), //o
    .io_pop_payload_last  (io_input_fifo_io_pop_payload_last      ), //o
    .io_flush             (1'b0                                   ), //i
    .io_occupancy         (io_input_fifo_io_occupancy[4:0]        ), //o
    .io_availability      (io_input_fifo_io_availability[4:0]     ), //o
    .aclk                  (aclk                                    ), //i
    .aresetn               (aresetn                                 )  //i
  );
  assign s_axis_tready = io_input_fifo_io_push_ready;
  assign m_axis_tvalid = io_input_fifo_io_pop_valid;
  assign m_axis_tdata = io_input_fifo_io_pop_payload_data;
  assign m_axis_tstrb = io_input_fifo_io_pop_payload_strb;
  assign m_axis_tkeep = io_input_fifo_io_pop_payload_keep;
  assign m_axis_tlast = io_input_fifo_io_pop_payload_last;

endmodule

module StreamFifo (
  input  wire          io_push_valid,
  output wire          io_push_ready,
  input  wire [31:0]   io_push_payload_data,
  input  wire [3:0]    io_push_payload_strb,
  input  wire [3:0]    io_push_payload_keep,
  input  wire          io_push_payload_last,
  output wire          io_pop_valid,
  input  wire          io_pop_ready,
  output wire [31:0]   io_pop_payload_data,
  output wire [3:0]    io_pop_payload_strb,
  output wire [3:0]    io_pop_payload_keep,
  output wire          io_pop_payload_last,
  input  wire          io_flush,
  output wire [4:0]    io_occupancy,
  output wire [4:0]    io_availability,
  input  wire          aclk,
  input  wire          aresetn
);

  reg        [40:0]   logic_ram_spinal_port1;
  wire       [40:0]   _zz_logic_ram_port;
  reg                 _zz_1;
  wire                logic_ptr_doPush;
  wire                logic_ptr_doPop;
  wire                logic_ptr_full;
  wire                logic_ptr_empty;
  reg        [4:0]    logic_ptr_push;
  reg        [4:0]    logic_ptr_pop;
  wire       [4:0]    logic_ptr_occupancy;
  wire       [4:0]    logic_ptr_popOnIo;
  wire                when_Stream_l1557;
  reg                 logic_ptr_wentUp;
  wire                io_push_fire;
  wire                logic_push_onRam_write_valid;
  wire       [3:0]    logic_push_onRam_write_payload_address;
  wire       [31:0]   logic_push_onRam_write_payload_data_data;
  wire       [3:0]    logic_push_onRam_write_payload_data_strb;
  wire       [3:0]    logic_push_onRam_write_payload_data_keep;
  wire                logic_push_onRam_write_payload_data_last;
  wire                logic_pop_addressGen_valid;
  reg                 logic_pop_addressGen_ready;
  wire       [3:0]    logic_pop_addressGen_payload;
  wire                logic_pop_addressGen_fire;
  wire                logic_pop_sync_readArbitration_valid;
  wire                logic_pop_sync_readArbitration_ready;
  wire       [3:0]    logic_pop_sync_readArbitration_payload;
  reg                 logic_pop_addressGen_rValid;
  reg        [3:0]    logic_pop_addressGen_rData;
  wire                when_Stream_l477;
  wire                logic_pop_sync_readPort_cmd_valid;
  wire       [3:0]    logic_pop_sync_readPort_cmd_payload;
  wire       [31:0]   logic_pop_sync_readPort_rsp_data;
  wire       [3:0]    logic_pop_sync_readPort_rsp_strb;
  wire       [3:0]    logic_pop_sync_readPort_rsp_keep;
  wire                logic_pop_sync_readPort_rsp_last;
  wire       [40:0]   _zz_logic_pop_sync_readPort_rsp_data;
  wire                logic_pop_addressGen_toFlowFire_valid;
  wire       [3:0]    logic_pop_addressGen_toFlowFire_payload;
  wire                logic_pop_sync_readArbitration_translated_valid;
  wire                logic_pop_sync_readArbitration_translated_ready;
  wire       [31:0]   logic_pop_sync_readArbitration_translated_payload_data;
  wire       [3:0]    logic_pop_sync_readArbitration_translated_payload_strb;
  wire       [3:0]    logic_pop_sync_readArbitration_translated_payload_keep;
  wire                logic_pop_sync_readArbitration_translated_payload_last;
  wire                logic_pop_sync_readArbitration_fire;
  reg        [4:0]    logic_pop_sync_popReg;
  reg [40:0] logic_ram [0:15];

  assign _zz_logic_ram_port = {logic_push_onRam_write_payload_data_last,{logic_push_onRam_write_payload_data_keep,{logic_push_onRam_write_payload_data_strb,logic_push_onRam_write_payload_data_data}}};
  always @(posedge aclk) begin
    if(_zz_1) begin
      logic_ram[logic_push_onRam_write_payload_address] <= _zz_logic_ram_port;
    end
  end

  always @(posedge aclk) begin
    if(logic_pop_sync_readPort_cmd_valid) begin
      logic_ram_spinal_port1 <= logic_ram[logic_pop_sync_readPort_cmd_payload];
    end
  end

  always @(*) begin
    _zz_1 = 1'b0;
    if(logic_push_onRam_write_valid) begin
      _zz_1 = 1'b1;
    end
  end

  assign when_Stream_l1557 = (logic_ptr_doPush != logic_ptr_doPop);
  assign logic_ptr_full = (((logic_ptr_push ^ logic_ptr_popOnIo) ^ 5'h10) == 5'h0);
  assign logic_ptr_empty = (logic_ptr_push == logic_ptr_pop);
  assign logic_ptr_occupancy = (logic_ptr_push - logic_ptr_popOnIo);
  assign io_push_ready = (! logic_ptr_full);
  assign io_push_fire = (io_push_valid && io_push_ready);
  assign logic_ptr_doPush = io_push_fire;
  assign logic_push_onRam_write_valid = io_push_fire;
  assign logic_push_onRam_write_payload_address = logic_ptr_push[3:0];
  assign logic_push_onRam_write_payload_data_data = io_push_payload_data;
  assign logic_push_onRam_write_payload_data_strb = io_push_payload_strb;
  assign logic_push_onRam_write_payload_data_keep = io_push_payload_keep;
  assign logic_push_onRam_write_payload_data_last = io_push_payload_last;
  assign logic_pop_addressGen_valid = (! logic_ptr_empty);
  assign logic_pop_addressGen_payload = logic_ptr_pop[3:0];
  assign logic_pop_addressGen_fire = (logic_pop_addressGen_valid && logic_pop_addressGen_ready);
  assign logic_ptr_doPop = logic_pop_addressGen_fire;
  always @(*) begin
    logic_pop_addressGen_ready = logic_pop_sync_readArbitration_ready;
    if(when_Stream_l477) begin
      logic_pop_addressGen_ready = 1'b1;
    end
  end

  assign when_Stream_l477 = (! logic_pop_sync_readArbitration_valid);
  assign logic_pop_sync_readArbitration_valid = logic_pop_addressGen_rValid;
  assign logic_pop_sync_readArbitration_payload = logic_pop_addressGen_rData;
  assign _zz_logic_pop_sync_readPort_rsp_data = logic_ram_spinal_port1;
  assign logic_pop_sync_readPort_rsp_data = _zz_logic_pop_sync_readPort_rsp_data[31 : 0];
  assign logic_pop_sync_readPort_rsp_strb = _zz_logic_pop_sync_readPort_rsp_data[35 : 32];
  assign logic_pop_sync_readPort_rsp_keep = _zz_logic_pop_sync_readPort_rsp_data[39 : 36];
  assign logic_pop_sync_readPort_rsp_last = _zz_logic_pop_sync_readPort_rsp_data[40];
  assign logic_pop_addressGen_toFlowFire_valid = logic_pop_addressGen_fire;
  assign logic_pop_addressGen_toFlowFire_payload = logic_pop_addressGen_payload;
  assign logic_pop_sync_readPort_cmd_valid = logic_pop_addressGen_toFlowFire_valid;
  assign logic_pop_sync_readPort_cmd_payload = logic_pop_addressGen_toFlowFire_payload;
  assign logic_pop_sync_readArbitration_translated_valid = logic_pop_sync_readArbitration_valid;
  assign logic_pop_sync_readArbitration_ready = logic_pop_sync_readArbitration_translated_ready;
  assign logic_pop_sync_readArbitration_translated_payload_data = logic_pop_sync_readPort_rsp_data;
  assign logic_pop_sync_readArbitration_translated_payload_strb = logic_pop_sync_readPort_rsp_strb;
  assign logic_pop_sync_readArbitration_translated_payload_keep = logic_pop_sync_readPort_rsp_keep;
  assign logic_pop_sync_readArbitration_translated_payload_last = logic_pop_sync_readPort_rsp_last;
  assign io_pop_valid = logic_pop_sync_readArbitration_translated_valid;
  assign logic_pop_sync_readArbitration_translated_ready = io_pop_ready;
  assign io_pop_payload_data = logic_pop_sync_readArbitration_translated_payload_data;
  assign io_pop_payload_strb = logic_pop_sync_readArbitration_translated_payload_strb;
  assign io_pop_payload_keep = logic_pop_sync_readArbitration_translated_payload_keep;
  assign io_pop_payload_last = logic_pop_sync_readArbitration_translated_payload_last;
  assign logic_pop_sync_readArbitration_fire = (logic_pop_sync_readArbitration_valid && logic_pop_sync_readArbitration_ready);
  assign logic_ptr_popOnIo = logic_pop_sync_popReg;
  assign io_occupancy = logic_ptr_occupancy;
  assign io_availability = (5'h10 - logic_ptr_occupancy);
  always @(posedge aclk) begin
    if(!aresetn) begin
      logic_ptr_push <= 5'h0;
      logic_ptr_pop <= 5'h0;
      logic_ptr_wentUp <= 1'b0;
      logic_pop_addressGen_rValid <= 1'b0;
      logic_pop_sync_popReg <= 5'h0;
    end else begin
      if(when_Stream_l1557) begin
        logic_ptr_wentUp <= logic_ptr_doPush;
      end
      if(io_flush) begin
        logic_ptr_wentUp <= 1'b0;
      end
      if(logic_ptr_doPush) begin
        logic_ptr_push <= (logic_ptr_push + 5'h01);
      end
      if(logic_ptr_doPop) begin
        logic_ptr_pop <= (logic_ptr_pop + 5'h01);
      end
      if(io_flush) begin
        logic_ptr_push <= 5'h0;
        logic_ptr_pop <= 5'h0;
      end
      if(logic_pop_addressGen_ready) begin
        logic_pop_addressGen_rValid <= logic_pop_addressGen_valid;
      end
      if(io_flush) begin
        logic_pop_addressGen_rValid <= 1'b0;
      end
      if(logic_pop_sync_readArbitration_fire) begin
        logic_pop_sync_popReg <= logic_ptr_pop;
      end
      if(io_flush) begin
        logic_pop_sync_popReg <= 5'h0;
      end
    end
  end

  always @(posedge aclk) begin
    if(logic_pop_addressGen_ready) begin
      logic_pop_addressGen_rData <= logic_pop_addressGen_payload;
    end
  end


endmodule
