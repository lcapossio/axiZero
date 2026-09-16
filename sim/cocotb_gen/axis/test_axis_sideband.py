# Copyright (c) 2026 Leonardo Capossio - bard0 design  hello@bard0.com
# SPDX-License-Identifier: MIT
"""cocotbext-axi tests for the generated AXI4-Stream sideband (TID/TDEST/TUSER) path.

Covers the generator's use_id/use_dest/use_user options end to end: the YAML sets the
sideband widths, the generated Verilog must expose tid/tdest/tuser ports, and the core
must carry every field through unchanged.
"""

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
async def test_reg_slice_preserves_tid_tdest_tuser(dut):
    cocotb.start_soon(Clock(dut.aclk, 10, units="ns").start())
    await reset_dut(dut)

    source = AxiStreamSource(AxiStreamBus.from_prefix(dut, "s_axis"), dut.aclk, dut.aresetn, reset_active_level=0)
    sink = AxiStreamSink(AxiStreamBus.from_prefix(dut, "m_axis"), dut.aclk, dut.aresetn, reset_active_level=0)

    # Two beats on a 4-byte bus. TID/TDEST are constant for the packet, TUSER varies
    # per beat so a core that latched one value for the whole frame would be caught.
    #
    # cocotbext-axi carries TID/TDEST/TUSER per byte, not per beat: a list shorter than
    # the frame is padded with its last element, and the value driven onto the bus for a
    # beat is the one belonging to that beat's last byte lane. Spelling out all eight
    # entries is what actually puts 0x2D on beat 0 and 0x13 on beat 1.
    frame = AxiStreamFrame(
        bytes([0x10, 0x11, 0x12, 0x13, 0x20, 0x21, 0x22, 0x23]),
        tkeep=[1] * 8,
        tid=0xB,
        tdest=0x5,
        tuser=[0x2D] * 4 + [0x13] * 4,
    )
    await source.send(frame)
    got = await sink.recv(compact=False)

    assert bytes(got.tdata) == bytes(frame.tdata)
    assert list(got.tid) == [0xB] * 8, f"TID was {list(got.tid)}"
    assert list(got.tdest) == [0x5] * 8, f"TDEST was {list(got.tdest)}"
    assert list(got.tuser) == [0x2D] * 4 + [0x13] * 4, f"TUSER was {list(got.tuser)}"


@cocotb.test()
async def test_reg_slice_preserves_sideband_under_backpressure(dut):
    cocotb.start_soon(Clock(dut.aclk, 10, units="ns").start())
    await reset_dut(dut)

    source = AxiStreamSource(AxiStreamBus.from_prefix(dut, "s_axis"), dut.aclk, dut.aresetn, reset_active_level=0)
    sink = AxiStreamSink(AxiStreamBus.from_prefix(dut, "m_axis"), dut.aclk, dut.aresetn, reset_active_level=0)

    sink.pause = True
    frame = AxiStreamFrame(
        bytes([0x30, 0x31, 0x32, 0x33]),
        tkeep=[1] * 4,
        tid=0x3,
        tdest=0x7,
        tuser=[0x99] * 4,
    )
    send_task = cocotb.start_soon(source.send(frame))
    for _ in range(8):
        await RisingEdge(dut.aclk)
    sink.pause = False
    await send_task

    got = await sink.recv(compact=False)

    assert bytes(got.tdata) == bytes(frame.tdata)
    assert list(got.tid) == [0x3] * 4, f"TID was {list(got.tid)}"
    assert list(got.tdest) == [0x7] * 4, f"TDEST was {list(got.tdest)}"
    assert list(got.tuser) == [0x99] * 4, f"TUSER was {list(got.tuser)}"
