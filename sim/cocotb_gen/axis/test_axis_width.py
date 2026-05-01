# Copyright (c) 2026 Leonardo Capossio - bard0 design  hello@bard0.com
# SPDX-License-Identifier: MIT
"""cocotbext-axi tests for generated AXI4-Stream width adapter."""

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
async def test_width_adapter_sparse_tail(dut):
    cocotb.start_soon(Clock(dut.aclk, 10, units="ns").start())
    await reset_dut(dut)

    source = AxiStreamSource(AxiStreamBus.from_prefix(dut, "s_axis"), dut.aclk, dut.aresetn, reset_active_level=0)
    sink = AxiStreamSink(AxiStreamBus.from_prefix(dut, "m_axis"), dut.aclk, dut.aresetn, reset_active_level=0)

    frame = AxiStreamFrame(bytes([0x21, 0x22, 0x23, 0x24, 0x25, 0x26, 0x27]), tkeep=[1] * 7)
    await source.send(frame)
    got = await sink.recv(compact=False)

    assert bytes(got.tdata[: len(frame.tdata)]) == bytes(frame.tdata)
    assert list(got.tkeep) == [1, 1, 1, 1, 1, 1, 1, 0]
