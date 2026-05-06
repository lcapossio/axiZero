// Copyright (c) 2026 Leonardo Capossio - bard0 design  hello@bard0.com
// SPDX-License-Identifier: MIT

`timescale 1ns/1ps

// Arty debug wrapper for fpgacapZero.
//
// USER1: ELA captures EJTAG-AXI traffic and fabric responses.
// USER4: EJTAG-AXI exposes an AXI4 master port. The Vivado BD helper connects
// it to a dedicated appended axiZero ingress so existing masters keep their
// original ports.
(* DONT_TOUCH = "true" *)
module axizero_fcapz_debug #(
    parameter ELA_DEPTH = 1024
) (
    input  wire        aclk,
    input  wire        aresetn,

    output wire        ela_trigger_out,
    output wire        ela_armed,

    output wire [31:0] m_axi_awaddr,
    output wire [7:0]  m_axi_awlen,
    output wire [2:0]  m_axi_awsize,
    output wire [1:0]  m_axi_awburst,
    output wire        m_axi_awvalid,
    input  wire        m_axi_awready,
    output wire [2:0]  m_axi_awprot,
    output wire [31:0] m_axi_wdata,
    output wire [3:0]  m_axi_wstrb,
    output wire        m_axi_wvalid,
    input  wire        m_axi_wready,
    output wire        m_axi_wlast,
    input  wire [1:0]  m_axi_bresp,
    input  wire        m_axi_bvalid,
    output wire        m_axi_bready,
    output wire [31:0] m_axi_araddr,
    output wire [7:0]  m_axi_arlen,
    output wire [2:0]  m_axi_arsize,
    output wire [1:0]  m_axi_arburst,
    output wire        m_axi_arvalid,
    input  wire        m_axi_arready,
    output wire [2:0]  m_axi_arprot,
    input  wire [31:0] m_axi_rdata,
    input  wire [1:0]  m_axi_rresp,
    input  wire        m_axi_rvalid,
    input  wire        m_axi_rlast,
    output wire        m_axi_rready
);
    localparam SAMPLE_W = 160;

    wire rst = !aresetn;

    wire [SAMPLE_W-1:0] probe = {
        8'b0,
        m_axi_rresp,
        m_axi_rdata,
        m_axi_rready,
        m_axi_rvalid,
        m_axi_arprot,
        m_axi_araddr,
        m_axi_arready,
        m_axi_arvalid,
        m_axi_bresp,
        m_axi_bready,
        m_axi_bvalid,
        m_axi_wstrb,
        m_axi_wdata,
        m_axi_wready,
        m_axi_wvalid,
        m_axi_awprot,
        m_axi_awaddr,
        m_axi_awready,
        m_axi_awvalid
    };

    wire any_error = (m_axi_bvalid && m_axi_bready && m_axi_bresp[1]) ||
                     (m_axi_rvalid && m_axi_rready && m_axi_rresp[1]);

    (* DONT_TOUCH = "true" *) fcapz_ela_xilinx7 #(
        .SAMPLE_W(SAMPLE_W),
        .DEPTH(ELA_DEPTH),
        .INPUT_PIPE(1),
        .EXT_TRIG_EN(1),
        .STARTUP_ARM(1),
        .DEFAULT_TRIG_EXT(2),
        .SINGLE_CHAIN_BURST(1),
        .USER1_DATA_EN(0),
        .CTRL_CHAIN(1),
        .DATA_CHAIN(2)
    ) u_ela (
        .sample_clk(aclk),
        .sample_rst(rst),
        .probe_in(probe),
        .trigger_in(any_error),
        .trigger_out(ela_trigger_out),
        .armed_out(ela_armed),
        .eio_probe_in(1'b0),
        .eio_probe_out()
    );

    (* DONT_TOUCH = "true" *) fcapz_ejtagaxi_xilinx7 #(
        .ADDR_W(32),
        .DATA_W(32),
        .FIFO_DEPTH(16),
        .CMD_FIFO_DEPTH(16),
        .RESP_FIFO_DEPTH(16),
        .CMD_FIFO_MEMORY_TYPE("distributed"),
        .RESP_FIFO_MEMORY_TYPE("distributed"),
        .BURST_FIFO_MEMORY_TYPE("distributed"),
        .TIMEOUT(4096),
        .DEBUG_EN(0),
        .CHAIN(4)
    ) u_ejtagaxi (
        .axi_clk(aclk),
        .axi_rst(rst),
        .m_axi_awaddr(m_axi_awaddr),
        .m_axi_awlen(m_axi_awlen),
        .m_axi_awsize(m_axi_awsize),
        .m_axi_awburst(m_axi_awburst),
        .m_axi_awvalid(m_axi_awvalid),
        .m_axi_awready(m_axi_awready),
        .m_axi_awprot(m_axi_awprot),
        .m_axi_wdata(m_axi_wdata),
        .m_axi_wstrb(m_axi_wstrb),
        .m_axi_wvalid(m_axi_wvalid),
        .m_axi_wready(m_axi_wready),
        .m_axi_wlast(m_axi_wlast),
        .m_axi_bresp(m_axi_bresp),
        .m_axi_bvalid(m_axi_bvalid),
        .m_axi_bready(m_axi_bready),
        .m_axi_araddr(m_axi_araddr),
        .m_axi_arlen(m_axi_arlen),
        .m_axi_arsize(m_axi_arsize),
        .m_axi_arburst(m_axi_arburst),
        .m_axi_arvalid(m_axi_arvalid),
        .m_axi_arready(m_axi_arready),
        .m_axi_arprot(m_axi_arprot),
        .m_axi_rdata(m_axi_rdata),
        .m_axi_rresp(m_axi_rresp),
        .m_axi_rvalid(m_axi_rvalid),
        .m_axi_rlast(m_axi_rlast),
        .m_axi_rready(m_axi_rready),
        .debug_tck(),
        .debug_tck_edge(),
        .debug_axi(),
        .debug_axi_edge()
    );
endmodule
