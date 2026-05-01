// Copyright (c) 2026 Leonardo Capossio - bard0 design  hello@bard0.com
// SPDX-License-Identifier: MIT
//
// Formal wrapper for the generated AXI4-Stream register slice.

`default_nettype none
`timescale 1ns/1ps

module axis_ready_valid_regslice (
    input wire clk,
    input wire rst
);
    wire resetn = !rst;

    (* anyseq *) wire        s_valid;
    wire                    s_ready;
    (* anyseq *) wire [31:0] s_data;
    (* anyseq *) wire [3:0]  s_strb;
    (* anyseq *) wire [3:0]  s_keep;
    (* anyseq *) wire        s_last;

    wire        m_valid;
    (* anyseq *) wire m_ready;
    wire [31:0] m_data;
    wire [3:0]  m_strb;
    wire [3:0]  m_keep;
    wire        m_last;

    AxiStreamRegSlice dut (
        .s_axis_tvalid(s_valid),
        .s_axis_tready(s_ready),
        .s_axis_tdata (s_data),
        .s_axis_tstrb (s_strb),
        .s_axis_tkeep (s_keep),
        .s_axis_tlast (s_last),
        .m_axis_tvalid(m_valid),
        .m_axis_tready(m_ready),
        .m_axis_tdata (m_data),
        .m_axis_tstrb (m_strb),
        .m_axis_tkeep (m_keep),
        .m_axis_tlast (m_last),
        .aclk         (clk),
        .aresetn      (resetn)
    );

    axis_ready_valid_props #(
        .DATA_WIDTH(32),
        .KEEP_WIDTH(4),
        .STRB_WIDTH(4),
        .HAS_KEEP(1),
        .HAS_STRB(1),
        .HAS_LAST(1),
        .ASSUME(1)
    ) s_axis_props (
        .aclk   (clk),
        .aresetn(resetn),
        .tvalid (s_valid),
        .tready (s_ready),
        .tdata  (s_data),
        .tkeep  (s_keep),
        .tstrb  (s_strb),
        .tlast  (s_last),
        .tid    (1'b0),
        .tdest  (1'b0),
        .tuser  (1'b0)
    );

    axis_ready_valid_props #(
        .DATA_WIDTH(32),
        .KEEP_WIDTH(4),
        .STRB_WIDTH(4),
        .HAS_KEEP(1),
        .HAS_STRB(1),
        .HAS_LAST(1),
        .ASSUME(0)
    ) m_axis_props (
        .aclk   (clk),
        .aresetn(resetn),
        .tvalid (m_valid),
        .tready (m_ready),
        .tdata  (m_data),
        .tkeep  (m_keep),
        .tstrb  (m_strb),
        .tlast  (m_last),
        .tid    (1'b0),
        .tdest  (1'b0),
        .tuser  (1'b0)
    );
endmodule

`default_nettype wire
