# Copyright (c) 2026 Leonardo Capossio - bard0 design  hello@bard0.com
# SPDX-License-Identifier: MIT
"""cocotbext-axi tests for generated AXI4-Stream arbiter/mux."""

import cocotb
from cocotb.clock import Clock
from cocotb.triggers import RisingEdge
from cocotbext.axi import AxiStreamBus, AxiStreamFrame, AxiStreamSink, AxiStreamSource


async def reset_dut(dut, cycles=5):
    dut.aresetn.value = 0
    for _ in range(cycles):
        await RisingEdge(dut.aclk)
    dut.aresetn.value = 1
    await RisingEdge(dut.aclk)


@cocotb.test()
async def test_mux_keeps_packets_intact_under_contention(dut):
    cocotb.start_soon(Clock(dut.aclk, 10, units="ns").start())
    await reset_dut(dut)

    s0 = AxiStreamSource(AxiStreamBus.from_prefix(dut, "s0_axis"), dut.aclk, dut.aresetn, reset_active_level=0)
    s1 = AxiStreamSource(AxiStreamBus.from_prefix(dut, "s1_axis"), dut.aclk, dut.aresetn, reset_active_level=0)
    sink = AxiStreamSink(AxiStreamBus.from_prefix(dut, "m_axis"), dut.aclk, dut.aresetn, reset_active_level=0)

    f0 = AxiStreamFrame(bytes([0x30, 0x31, 0x32, 0x33, 0x34]), tkeep=[1] * 5)
    f1 = AxiStreamFrame(bytes([0x40, 0x41, 0x42]), tkeep=[1] * 3)

    cocotb.start_soon(s0.send(f0))
    cocotb.start_soon(s1.send(f1))

    got0 = await sink.recv()
    got1 = await sink.recv()

    assert {bytes(got0.tdata), bytes(got1.tdata)} == {bytes(f0.tdata), bytes(f1.tdata)}
