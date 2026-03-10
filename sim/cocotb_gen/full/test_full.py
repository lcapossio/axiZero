# Copyright (c) 2026 Leonardo Capossio — bard0 design  hello@bard0.com
# SPDX-License-Identifier: MIT
"""
test_full.py  —  cocotbext-axi tests for generated MyFull_2M2S.v

Topology: 1 AXI4 master × 2 AXI4 slaves
  s0_axi       : master port (AxiMaster connects here)
  m0_axi       : slave 0 port (AxiRam), address 0x00000000 – 0x7FFFFFFF
  m1_axi       : slave 1 port (AxiRam), address 0x80000000 – 0x9FFFFFFF

Data width: 64 bits  ID width: 4 bits (master), 4 bits (slave, 1 master so no expansion)
Clock: aclk   Reset: aresetn (active-low)

Address notes:
  AxiRam stores at (address % size). 0x80000000 is a multiple of RAM_SIZE,
  so (0x80000000 + offset) % RAM_SIZE == offset for any offset < RAM_SIZE.
  Direct-memory verification uses this offset.
"""

import random
import cocotb
from cocotb.clock import Clock
from cocotb.triggers import RisingEdge
from cocotbext.axi import AxiBus, AxiMaster, AxiRam

SLAVE0_BASE = 0x0000_0000
SLAVE1_BASE = 0x8000_0000
RAM_SIZE    = 0x1_0000   # 64 KB per slave RAM (addresses wrap: mod RAM_SIZE)
DATA_BYTES  = 8          # 64-bit data bus


async def reset_dut(dut, cycles=8):
    dut.aresetn.value = 0
    for _ in range(cycles):
        await RisingEdge(dut.aclk)
    dut.aresetn.value = 1
    await RisingEdge(dut.aclk)


def make_bfms(dut):
    master = AxiMaster(AxiBus.from_prefix(dut, "s0_axi"), dut.aclk, dut.aresetn,
                       reset_active_level=0)
    ram0 = AxiRam(AxiBus.from_prefix(dut, "m0_axi"), dut.aclk, dut.aresetn,
                  reset_active_level=0, size=RAM_SIZE)
    ram1 = AxiRam(AxiBus.from_prefix(dut, "m1_axi"), dut.aclk, dut.aresetn,
                  reset_active_level=0, size=RAM_SIZE)
    return master, ram0, ram1


# ── Test 1: single-beat write / read to each slave ──────────────────────────

@cocotb.test()
async def test_single_beat_rw(dut):
    """Write one word to slave 0 and one word to slave 1, read both back."""
    cocotb.start_soon(Clock(dut.aclk, 10, units="ns").start())
    await reset_dut(dut)
    master, ram0, ram1 = make_bfms(dut)

    addr0 = SLAVE0_BASE + 0x100
    addr1 = SLAVE1_BASE + 0x100
    data0 = (0xDEAD_BEEF_0000_0001).to_bytes(DATA_BYTES, "little")
    data1 = (0xCAFE_BABE_0000_0002).to_bytes(DATA_BYTES, "little")

    await master.write(addr0, data0)
    await master.write(addr1, data1)

    r0 = await master.read(addr0, DATA_BYTES)
    r1 = await master.read(addr1, DATA_BYTES)

    assert r0.data == data0, f"Slave 0 mismatch: {r0.data.hex()} != {data0.hex()}"
    assert r1.data == data1, f"Slave 1 mismatch: {r1.data.hex()} != {data1.hex()}"


# ── Test 2: address routing ──────────────────────────────────────────────────

@cocotb.test()
async def test_address_routing(dut):
    """Writes to different slave regions land in the correct slave RAM."""
    cocotb.start_soon(Clock(dut.aclk, 10, units="ns").start())
    await reset_dut(dut)
    master, ram0, ram1 = make_bfms(dut)

    sentinel0 = (0x1111_2222_3333_4444).to_bytes(DATA_BYTES, "little")
    sentinel1 = (0xAAAA_BBBB_CCCC_DDDD).to_bytes(DATA_BYTES, "little")
    offset = 0x200

    await master.write(SLAVE0_BASE + offset, sentinel0)
    await master.write(SLAVE1_BASE + offset, sentinel1)

    # Verify via AXI reads — routing is correct if master gets back what it wrote
    r0 = await master.read(SLAVE0_BASE + offset, DATA_BYTES)
    r1 = await master.read(SLAVE1_BASE + offset, DATA_BYTES)

    assert r0.data == sentinel0, f"Slave 0 mismatch: {r0.data.hex()}"
    assert r1.data == sentinel1, f"Slave 1 mismatch: {r1.data.hex()}"

    # Verify isolation: write a different value to slave 0's offset in slave 1's range
    # If routing were broken, one RAM would serve both.
    other = (0xDEAD_DEAD_DEAD_DEAD).to_bytes(DATA_BYTES, "little")
    await master.write(SLAVE1_BASE + offset + 0x10, other)
    r0_check = await master.read(SLAVE0_BASE + offset, DATA_BYTES)
    assert r0_check.data == sentinel0, \
        "Slave 0 data changed after write to slave 1 — isolation failure"


# ── Test 3: 16-beat burst ────────────────────────────────────────────────────

@cocotb.test()
async def test_burst_16_beat(dut):
    """16-beat INCR burst write to slave 0, read back via AXI."""
    cocotb.start_soon(Clock(dut.aclk, 10, units="ns").start())
    await reset_dut(dut)
    master, ram0, ram1 = make_bfms(dut)

    base  = SLAVE0_BASE + 0x1000
    wdata = bytes(i & 0xFF for i in range(16 * DATA_BYTES))

    await master.write(base, wdata)
    result = await master.read(base, len(wdata))

    assert result.data == wdata, \
        f"16-beat burst mismatch at byte {next(i for i,(a,b) in enumerate(zip(result.data,wdata)) if a!=b)}"


# ── Test 4: 64-beat burst ────────────────────────────────────────────────────

@cocotb.test()
async def test_burst_64_beat(dut):
    """64-beat INCR burst (AWLEN=63), exercises maximum burst length."""
    cocotb.start_soon(Clock(dut.aclk, 10, units="ns").start())
    await reset_dut(dut)
    master, ram0, ram1 = make_bfms(dut)

    base  = SLAVE0_BASE + 0x2000
    wdata = bytes(random.randint(0, 255) for _ in range(64 * DATA_BYTES))

    await master.write(base, wdata)
    result = await master.read(base, len(wdata))

    assert result.data == wdata, \
        f"64-beat burst mismatch; first bad byte: {next(i for i,(a,b) in enumerate(zip(result.data,wdata)) if a!=b)}"


# ── Test 5: alternating slave targets ────────────────────────────────────────

@cocotb.test()
async def test_alternating_slaves(dut):
    """Alternate writes between slave 0 and slave 1 to test address decode."""
    cocotb.start_soon(Clock(dut.aclk, 10, units="ns").start())
    await reset_dut(dut)
    master, ram0, ram1 = make_bfms(dut)

    refs = {}
    for i in range(8):
        base   = SLAVE0_BASE if i % 2 == 0 else SLAVE1_BASE
        offset = 0x10 * (i + 1)
        val    = (0xF000_0000_0000_0000 | i).to_bytes(DATA_BYTES, "little")
        await master.write(base + offset, val)
        refs[base + offset] = val

    for addr, expected in refs.items():
        result = await master.read(addr, DATA_BYTES)
        assert result.data == expected, \
            f"Mismatch at {addr:#010x}: {result.data.hex()} != {expected.hex()}"


# ── Test 6: constrained-random accesses ──────────────────────────────────────

@cocotb.test()
async def test_random_accesses(dut):
    """40 random writes to random slaves, then read-back verification."""
    cocotb.start_soon(Clock(dut.aclk, 10, units="ns").start())
    await reset_dut(dut)
    master, ram0, ram1 = make_bfms(dut)

    bases = [SLAVE0_BASE, SLAVE1_BASE]
    refs  = {}

    for _ in range(40):
        base   = random.choice(bases)
        offset = random.randint(0, (0x8000 // DATA_BYTES) - 1) * DATA_BYTES
        val    = random.randint(0, (1 << 64) - 1).to_bytes(DATA_BYTES, "little")
        addr   = base + offset
        refs[addr] = val
        await master.write(addr, val)

    for addr, expected in refs.items():
        result = await master.read(addr, DATA_BYTES)
        assert result.data == expected, \
            f"Random r/w mismatch at {addr:#010x}: {result.data.hex()} != {expected.hex()}"
