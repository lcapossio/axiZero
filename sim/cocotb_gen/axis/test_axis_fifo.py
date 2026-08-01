# Copyright (c) 2026 Leonardo Capossio - bard0 design  hello@bard0.com
# SPDX-License-Identifier: MIT
"""cocotbext-axi tests for generated AXI4-Stream FIFO."""

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
async def test_fifo_preserves_sparse_frames_under_backpressure(dut):
    cocotb.start_soon(Clock(dut.aclk, 10, units="ns").start())
    await reset_dut(dut)

    source = AxiStreamSource(AxiStreamBus.from_prefix(dut, "s_axis"), dut.aclk, dut.aresetn, reset_active_level=0)
    sink = AxiStreamSink(AxiStreamBus.from_prefix(dut, "m_axis"), dut.aclk, dut.aresetn, reset_active_level=0)

    sink.pause = True
    frame0 = AxiStreamFrame(bytes([0x70, 0x71, 0x72, 0x73]), tkeep=[1, 0, 1, 1])
    frame1 = AxiStreamFrame(bytes([0x80, 0x81, 0x82, 0x83, 0x84]), tkeep=[1] * 5)

    send0 = cocotb.start_soon(source.send(frame0))
    send1 = cocotb.start_soon(source.send(frame1))
    for _ in range(10):
        await RisingEdge(dut.aclk)
    sink.pause = False
    await send0
    await send1

    got0 = await sink.recv(compact=False)
    got1 = await sink.recv(compact=False)

    assert bytes(got0.tdata) == bytes(frame0.tdata)
    assert list(got0.tkeep) == list(frame0.tkeep)
    assert bytes(got1.tdata[: len(frame1.tdata)]) == bytes(frame1.tdata)
    assert list(got1.tkeep) == [1, 1, 1, 1, 1, 0, 0, 0]
