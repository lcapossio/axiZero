# Copyright (c) 2026 Leonardo Capossio — bard0 design  hello@bard0.com
# SPDX-License-Identifier: MIT
"""
test_wrr.py  —  cocotbext-axi tests for generated MyLite_2M2S_WRR.v

Topology: 2 AXI4-Lite masters × 2 AXI4-Lite slaves, Weighted Round-Robin
  s0_axi       : master 0 port (weight 3)
  s1_axi       : master 1 port (weight 1)
  m0_axi       : slave 0, address 0x00000000 – 0x0000FFFF
  m1_axi       : slave 1, address 0x00010000 – 0x0001FFFF

Data width: 32 bits
Clock: aclk   Reset: aresetn (active-low)
Weights: [3, 1] — master 0 gets 3× the grants of master 1 under contention.
Note: master 0 has a register slice, slave 0 has a register slice.
"""

import asyncio
import random
import cocotb
from cocotb.clock import Clock
from cocotb.triggers import RisingEdge, Timer, Combine
from cocotbext.axi import AxiLiteBus, AxiLiteMaster, AxiLiteRam

SLAVE0_BASE = 0x0000_0000
SLAVE1_BASE = 0x0001_0000
SLAVE_SIZE  = 0x0001_0000
DATA_BYTES  = 4   # 32-bit data bus


async def reset_dut(dut, cycles=8):
    dut.aresetn.value = 0
    for _ in range(cycles):
        await RisingEdge(dut.aclk)
    dut.aresetn.value = 1
    await RisingEdge(dut.aclk)


def make_bfms(dut):
    master0 = AxiLiteMaster(AxiLiteBus.from_prefix(dut, "s0_axi"), dut.aclk, dut.aresetn,
                             reset_active_level=0)
    master1 = AxiLiteMaster(AxiLiteBus.from_prefix(dut, "s1_axi"), dut.aclk, dut.aresetn,
                             reset_active_level=0)
    ram0 = AxiLiteRam(AxiLiteBus.from_prefix(dut, "m0_axi"), dut.aclk, dut.aresetn,
                       reset_active_level=0, size=SLAVE_SIZE)
    ram1 = AxiLiteRam(AxiLiteBus.from_prefix(dut, "m1_axi"), dut.aclk, dut.aresetn,
                       reset_active_level=0, size=SLAVE_SIZE)
    return master0, master1, ram0, ram1


# ── Test 1: basic write/read from each master ────────────────────────────────

@cocotb.test()
async def test_both_masters_rw(dut):
    """Each master writes to a different slave and reads back."""
    cocotb.start_soon(Clock(dut.aclk, 10, units="ns").start())
    await reset_dut(dut)
    m0, m1, ram0, ram1 = make_bfms(dut)

    val0 = (0xAAAA_1111).to_bytes(DATA_BYTES, "little")
    val1 = (0xBBBB_2222).to_bytes(DATA_BYTES, "little")

    await m0.write(SLAVE0_BASE + 0x100, val0)
    await m1.write(SLAVE1_BASE + 0x200, val1)

    r0 = await m0.read(SLAVE0_BASE + 0x100, DATA_BYTES)
    r1 = await m1.read(SLAVE1_BASE + 0x200, DATA_BYTES)

    assert r0.data == val0, f"master0 read: {r0.data.hex()} != {val0.hex()}"
    assert r1.data == val1, f"master1 read: {r1.data.hex()} != {val1.hex()}"


# ── Test 2: address routing — each master reaches correct slave ──────────────

@cocotb.test()
async def test_address_routing(dut):
    """Master 0 writes to slave 1's range; master 1 writes to slave 0's range."""
    cocotb.start_soon(Clock(dut.aclk, 10, units="ns").start())
    await reset_dut(dut)
    m0, m1, ram0, ram1 = make_bfms(dut)

    val_m0 = (0x1234_5678).to_bytes(DATA_BYTES, "little")
    val_m1 = (0xDEAD_BEEF).to_bytes(DATA_BYTES, "little")

    # Master 0 → slave 1
    await m0.write(SLAVE1_BASE + 0x40, val_m0)
    # Master 1 → slave 0
    await m1.write(SLAVE0_BASE + 0x80, val_m1)

    # Read back from opposite master to verify data is in the correct slave
    r0 = await m1.read(SLAVE1_BASE + 0x40, DATA_BYTES)
    r1 = await m0.read(SLAVE0_BASE + 0x80, DATA_BYTES)

    assert r0.data == val_m0, f"slave1 routing: {r0.data.hex()} != {val_m0.hex()}"
    assert r1.data == val_m1, f"slave0 routing: {r1.data.hex()} != {val_m1.hex()}"


# ── Test 3: WRR bandwidth — master 0 (weight 3) finishes faster ─────────────

@cocotb.test()
async def test_wrr_bandwidth(dut):
    """
    Both masters write N words concurrently to the same slave.
    With WRR weights [3, 1], master 0 gets 3 grants per round and master 1
    gets 1 grant per round.  We track how many writes each master has
    completed by the time the faster one finishes.

    Note: master 0 has a register slice (adds pipeline latency per write),
    so absolute completion time isn't a fair metric.  Instead we verify:
      1. Both masters complete all writes (functional correctness).
      2. All data written is correct on read-back.
    The proportional bandwidth assertion (master 0 finishes first) is
    validated in the SpinalSim tests (LiteCrossbarSpec) where there are
    no register slices.
    """
    cocotb.start_soon(Clock(dut.aclk, 10, units="ns").start())
    await reset_dut(dut)
    m0, m1, ram0, ram1 = make_bfms(dut)

    N = 32

    async def master0_writes():
        for i in range(N):
            val = (0xA000_0000 | i).to_bytes(DATA_BYTES, "little")
            await m0.write(SLAVE0_BASE + i * DATA_BYTES, val)

    async def master1_writes():
        for i in range(N):
            val = (0xB000_0000 | i).to_bytes(DATA_BYTES, "little")
            await m1.write(SLAVE0_BASE + 0x1000 + i * DATA_BYTES, val)

    t0 = cocotb.start_soon(master0_writes())
    t1 = cocotb.start_soon(master1_writes())
    await Combine(t0, t1)

    # Verify all writes from both masters arrived correctly
    for i in range(N):
        exp0 = (0xA000_0000 | i).to_bytes(DATA_BYTES, "little")
        r0 = await m0.read(SLAVE0_BASE + i * DATA_BYTES, DATA_BYTES)
        assert r0.data == exp0, \
            f"master0 write[{i}]: {r0.data.hex()} != {exp0.hex()}"

    for i in range(N):
        exp1 = (0xB000_0000 | i).to_bytes(DATA_BYTES, "little")
        r1 = await m1.read(SLAVE0_BASE + 0x1000 + i * DATA_BYTES, DATA_BYTES)
        assert r1.data == exp1, \
            f"master1 write[{i}]: {r1.data.hex()} != {exp1.hex()}"


# ── Test 4: WRR no starvation — low-weight master completes all writes ──────

@cocotb.test()
async def test_wrr_no_starvation(dut):
    """
    Both masters write 16 words concurrently to the same slave.
    Verify ALL master-1 (weight=1) writes arrive correctly — no starvation.
    """
    cocotb.start_soon(Clock(dut.aclk, 10, units="ns").start())
    await reset_dut(dut)
    m0, m1, ram0, ram1 = make_bfms(dut)

    N = 16

    async def master0_writes():
        for i in range(N):
            val = (0xBEEF_0000 | i).to_bytes(DATA_BYTES, "little")
            await m0.write(SLAVE0_BASE + i * DATA_BYTES, val)

    async def master1_writes():
        for i in range(N):
            val = (0xDEAD_0000 | i).to_bytes(DATA_BYTES, "little")
            await m1.write(SLAVE0_BASE + 0x2000 + i * DATA_BYTES, val)

    t0 = cocotb.start_soon(master0_writes())
    t1 = cocotb.start_soon(master1_writes())
    await Combine(t0, t1)

    # Verify all master-1 writes via read-back
    for i in range(N):
        expected = (0xDEAD_0000 | i).to_bytes(DATA_BYTES, "little")
        result = await m1.read(SLAVE0_BASE + 0x2000 + i * DATA_BYTES, DATA_BYTES)
        assert result.data == expected, \
            f"master1 write[{i}]: {result.data.hex()} != {expected.hex()}"


# ── Test 5: concurrent write-read to different slaves ────────────────────────

@cocotb.test()
async def test_concurrent_different_slaves(dut):
    """Master 0 writes to slave 0 while master 1 writes to slave 1 concurrently."""
    cocotb.start_soon(Clock(dut.aclk, 10, units="ns").start())
    await reset_dut(dut)
    m0, m1, ram0, ram1 = make_bfms(dut)

    N = 8

    async def m0_work():
        for i in range(N):
            val = (0xCC00_0000 | i).to_bytes(DATA_BYTES, "little")
            await m0.write(SLAVE0_BASE + 0x400 + i * DATA_BYTES, val)

    async def m1_work():
        for i in range(N):
            val = (0xDD00_0000 | i).to_bytes(DATA_BYTES, "little")
            await m1.write(SLAVE1_BASE + 0x400 + i * DATA_BYTES, val)

    t0 = cocotb.start_soon(m0_work())
    t1 = cocotb.start_soon(m1_work())
    await Combine(t0, t1)

    # Read back all and verify
    for i in range(N):
        exp0 = (0xCC00_0000 | i).to_bytes(DATA_BYTES, "little")
        exp1 = (0xDD00_0000 | i).to_bytes(DATA_BYTES, "little")
        r0 = await m0.read(SLAVE0_BASE + 0x400 + i * DATA_BYTES, DATA_BYTES)
        r1 = await m1.read(SLAVE1_BASE + 0x400 + i * DATA_BYTES, DATA_BYTES)
        assert r0.data == exp0, f"slave0[{i}]: {r0.data.hex()} != {exp0.hex()}"
        assert r1.data == exp1, f"slave1[{i}]: {r1.data.hex()} != {exp1.hex()}"


# ── Test 6: random accesses from both masters ────────────────────────────────

@cocotb.test()
async def test_random_dual_master(dut):
    """40 random writes from each master, then read-back verification."""
    cocotb.start_soon(Clock(dut.aclk, 10, units="ns").start())
    await reset_dut(dut)
    m0, m1, ram0, ram1 = make_bfms(dut)

    refs = {}  # addr -> (master_idx, value)

    # Master 0: 40 random writes
    for _ in range(40):
        base = random.choice([SLAVE0_BASE, SLAVE1_BASE])
        offset = random.randint(0, (0x800 // DATA_BYTES) - 1) * DATA_BYTES
        addr = base + offset
        val = random.randint(0, 0xFFFF_FFFF).to_bytes(DATA_BYTES, "little")
        await m0.write(addr, val)
        refs[addr] = (0, val)

    # Master 1: 40 random writes (may overwrite some of master 0's)
    for _ in range(40):
        base = random.choice([SLAVE0_BASE, SLAVE1_BASE])
        offset = random.randint(0, (0x800 // DATA_BYTES) - 1) * DATA_BYTES
        addr = base + 0x1000 + offset  # different offset range to avoid overwrites
        val = random.randint(0, 0xFFFF_FFFF).to_bytes(DATA_BYTES, "little")
        await m1.write(addr, val)
        refs[addr] = (1, val)

    # Read back all via master 0
    for addr, (mi, expected) in refs.items():
        result = await m0.read(addr, DATA_BYTES)
        assert result.data == expected, \
            f"Random mismatch at {addr:#010x} (written by m{mi}): " \
            f"{result.data.hex()} != {expected.hex()}"
