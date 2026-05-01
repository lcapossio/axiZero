# Copyright (c) 2026 Leonardo Capossio - bard0 design  hello@bard0.com
# SPDX-License-Identifier: MIT
"""cocotbext-axi tests for the generated AXI4-Stream demux core."""

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
async def test_demux_routes_sparse_frame(dut):
    cocotb.start_soon(Clock(dut.aclk, 10, units="ns").start())
    await reset_dut(dut)

    source = AxiStreamSource(AxiStreamBus.from_prefix(dut, "s_axis"), dut.aclk, dut.aresetn, reset_active_level=0)
    sink1 = AxiStreamSink(AxiStreamBus.from_prefix(dut, "m1_axis"), dut.aclk, dut.aresetn, reset_active_level=0)

    dut.select.value = 1
    frame = AxiStreamFrame(bytes([0x50, 0x51, 0x52, 0x53]), tkeep=[1, 1, 0, 1])
    await source.send(frame)
    got = await sink1.recv(compact=False)

    assert bytes(got.tdata) == bytes(frame.tdata)
    assert list(got.tkeep) == list(frame.tkeep)
