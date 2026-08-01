# Copyright (c) 2026 Leonardo Capossio - bard0 design  hello@bard0.com
# SPDX-License-Identifier: MIT
"""cocotbext-axi tests for the generated AXI4-Stream broadcaster core."""

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
async def test_broadcaster_replicates_with_backpressure(dut):
    cocotb.start_soon(Clock(dut.aclk, 10, units="ns").start())
    await reset_dut(dut)

    source = AxiStreamSource(AxiStreamBus.from_prefix(dut, "s_axis"), dut.aclk, dut.aresetn, reset_active_level=0)
    sink0 = AxiStreamSink(AxiStreamBus.from_prefix(dut, "m0_axis"), dut.aclk, dut.aresetn, reset_active_level=0)
    sink1 = AxiStreamSink(AxiStreamBus.from_prefix(dut, "m1_axis"), dut.aclk, dut.aresetn, reset_active_level=0)

    sink1.pause = True
    frame = AxiStreamFrame(bytes([0x60, 0x61, 0x62, 0x63, 0x64]), tkeep=[1] * 5)
    send_task = cocotb.start_soon(source.send(frame))
    for _ in range(5):
        await RisingEdge(dut.aclk)
    sink1.pause = False
    await send_task

    got0 = await sink0.recv(compact=False)
    got1 = await sink1.recv(compact=False)
    expected_keep = [1, 1, 1, 1, 1, 0, 0, 0]
    assert bytes(got0.tdata[: len(frame.tdata)]) == bytes(frame.tdata)
    assert bytes(got1.tdata[: len(frame.tdata)]) == bytes(frame.tdata)
    assert list(got0.tkeep) == expected_keep
    assert list(got1.tkeep) == expected_keep
