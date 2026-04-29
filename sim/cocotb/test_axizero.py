# Copyright (c) 2026 Leonardo Capossio — bard0 design  hello@bard0.com
# SPDX-License-Identifier: MIT
"""
test_axizero.py  —  cocotb constrained-random tests for AxiZeroWrapper

Topology: 2 AXI4 masters (M0, M1) × 2 AXI RAM slaves (S0, S1)
  Slave 0 address region: 0x0000_0000 – 0x0000_FFFF
  Slave 1 address region: 0x0001_0000 – 0x0001_FFFF

Requirements (install in WSL Python env):
  pip install cocotb cocotbext-axi

Run:  make  (from sim/cocotb/ in WSL)
"""

import random
import cocotb
from cocotb.clock import Clock
from cocotb.triggers import RisingEdge
from cocotbext.axi import AxiBus, AxiMaster, AxiRam

# ── Address map ─────────────────────────────────────────────────────────────
SLAVE0_BASE = 0x0000_0000
SLAVE1_BASE = 0x0001_0000
SLAVE_SIZE  = 0x0001_0000   # 64 KB each


async def reset_dut(dut, cycles: int = 8):
    """Assert active-low sync reset for `cycles` clock edges."""
    dut.resetn.value = 0
    for _ in range(cycles):
        await RisingEdge(dut.clk)
    dut.resetn.value = 1
    await RisingEdge(dut.clk)


def make_masters_and_rams(dut):
    """
    Build cocotbext-axi AxiMaster and AxiRam objects from the wrapper ports.

    AxiBus.from_prefix(dut, "m0") picks up all signals with prefix "m0_"
    (awvalid, awready, awaddr, …).  Similarly for slaves.

    AxiRam is a self-contained behavioural RAM: it drives the slave port
    and stores data internally.  We use its mem attribute to inject and
    inspect data.
    """
    m0 = AxiMaster(AxiBus.from_prefix(dut, "m0"), dut.clk, dut.resetn,
                   reset_active_level=0)
    m1 = AxiMaster(AxiBus.from_prefix(dut, "m1"), dut.clk, dut.resetn,
                   reset_active_level=0)
    s0 = AxiRam(AxiBus.from_prefix(dut, "s0"), dut.clk, dut.resetn,
                reset_active_level=0, size=SLAVE_SIZE)
    s1 = AxiRam(AxiBus.from_prefix(dut, "s1"), dut.clk, dut.resetn,
                reset_active_level=0, size=SLAVE_SIZE)
    return m0, m1, s0, s1


# ── Test 1: single-beat write / read ────────────────────────────────────────

@cocotb.test()
async def test_single_beat_write_read(dut):
    """M0 writes one word to S0, reads it back. M1 writes to S1, reads back."""
    cocotb.start_soon(Clock(dut.clk, 10, units="ns").start())
    await reset_dut(dut)
    m0, m1, s0, s1 = make_masters_and_rams(dut)

    addr0 = SLAVE0_BASE + 0x100
    addr1 = SLAVE1_BASE + 0x200
    data0 = 0xDEAD_BEEF
    data1 = 0xCAFE_BABE

    await m0.write(addr0, data0.to_bytes(4, "little"))
    await m1.write(addr1, data1.to_bytes(4, "little"))

    r0 = await m0.read(addr0, 4)
    r1 = await m1.read(addr1, 4)

    assert int.from_bytes(r0.data, "little") == data0, \
        f"S0 read-back mismatch: {r0.data.hex()} != {data0:08x}"
    assert int.from_bytes(r1.data, "little") == data1, \
        f"S1 read-back mismatch: {r1.data.hex()} != {data1:08x}"


# ── Test 2: address routing ──────────────────────────────────────────────────

@cocotb.test()
async def test_address_routing(dut):
    """Writes to both slave regions land in the correct slave RAM."""
    cocotb.start_soon(Clock(dut.clk, 10, units="ns").start())
    await reset_dut(dut)
    m0, m1, s0, s1 = make_masters_and_rams(dut)

    sentinel0 = 0x1111_1111
    sentinel1 = 0x2222_2222

    await m0.write(SLAVE0_BASE + 0x10, sentinel0.to_bytes(4, "little"))
    await m0.write(SLAVE1_BASE + 0x10, sentinel1.to_bytes(4, "little"))

    # Verify via AxiRam internal memory (offset within the RAM)
    got0 = int.from_bytes(s0.read(0x10, 4), "little")
    got1 = int.from_bytes(s1.read(0x10, 4), "little")

    assert got0 == sentinel0, f"S0 wrong value: {got0:#010x}"
    assert got1 == sentinel1, f"S1 wrong value: {got1:#010x}"


# ── Test 3: burst write / read (16 beats) ───────────────────────────────────

@cocotb.test()
async def test_burst_16_beat(dut):
    """M0 issues a 16-beat INCR burst to S0 and reads it back."""
    cocotb.start_soon(Clock(dut.clk, 10, units="ns").start())
    await reset_dut(dut)
    m0, m1, s0, s1 = make_masters_and_rams(dut)

    base  = SLAVE0_BASE + 0x1000
    beats = 16
    wdata = bytes(range(beats * 4))   # 64 bytes

    await m0.write(base, wdata)
    result = await m0.read(base, len(wdata))

    assert result.data == wdata, \
        f"16-beat burst mismatch:\n  wrote {wdata.hex()}\n  read  {result.data.hex()}"


# ── Test 4: burst write / read (64 beats) ───────────────────────────────────

@cocotb.test()
async def test_burst_64_beat(dut):
    """M0 issues a 64-beat INCR burst, exercises AWLEN=63."""
    cocotb.start_soon(Clock(dut.clk, 10, units="ns").start())
    await reset_dut(dut)
    m0, m1, s0, s1 = make_masters_and_rams(dut)

    base  = SLAVE0_BASE + 0x2000
    beats = 64
    wdata = bytes(random.randint(0, 255) for _ in range(beats * 4))

    await m0.write(base, wdata)
    result = await m0.read(base, len(wdata))

    first_diff = next((i for i, (a, b) in enumerate(zip(result.data, wdata)) if a != b), -1)
    assert result.data == wdata, \
        f"64-beat burst data mismatch (first diff at byte {first_diff})"


# ── Test 5: two masters concurrent bursts to different slaves ────────────────

@cocotb.test()
async def test_concurrent_masters_different_slaves(dut):
    """M0 and M1 issue 16-beat bursts simultaneously to S0 and S1."""
    cocotb.start_soon(Clock(dut.clk, 10, units="ns").start())
    await reset_dut(dut)
    m0, m1, s0, s1 = make_masters_and_rams(dut)

    base0 = SLAVE0_BASE + 0x3000
    base1 = SLAVE1_BASE + 0x3000
    data0 = bytes(i & 0xFF for i in range(64))
    data1 = bytes((i + 128) & 0xFF for i in range(64))

    wr0 = cocotb.start_soon(m0.write(base0, data0))
    wr1 = cocotb.start_soon(m1.write(base1, data1))
    await wr0
    await wr1

    r0 = await m0.read(base0, 64)
    r1 = await m1.read(base1, 64)

    assert r0.data == data0, "M0→S0 concurrent burst mismatch"
    assert r1.data == data1, "M1→S1 concurrent burst mismatch"


# ── Test 6: two masters, same slave (arbitration) ────────────────────────────

@cocotb.test()
async def test_concurrent_masters_same_slave(dut):
    """M0 and M1 both target S0; crossbar must serialise and not corrupt."""
    cocotb.start_soon(Clock(dut.clk, 10, units="ns").start())
    await reset_dut(dut)
    m0, m1, s0, s1 = make_masters_and_rams(dut)

    base0 = SLAVE0_BASE + 0x4000
    base1 = SLAVE0_BASE + 0x4100   # different offset, same slave
    data0 = b'\xAA' * 16
    data1 = b'\xBB' * 16

    wr0 = cocotb.start_soon(m0.write(base0, data0))
    wr1 = cocotb.start_soon(m1.write(base1, data1))
    await wr0
    await wr1

    r0 = await m0.read(base0, 16)
    r1 = await m1.read(base1, 16)

    assert r0.data == data0, f"same-slave M0 data corrupted: {r0.data.hex()}"
    assert r1.data == data1, f"same-slave M1 data corrupted: {r1.data.hex()}"


# ── Test 7: constrained-random write/read ───────────────────────────────────

@cocotb.test()
async def test_random_accesses(dut):
    """
    50 random single-beat writes from random masters to random slaves,
    followed by read-back verification.
    """
    cocotb.start_soon(Clock(dut.clk, 10, units="ns").start())
    await reset_dut(dut)
    m0, m1, s0, s1 = make_masters_and_rams(dut)

    masters = [m0, m1]
    bases   = [SLAVE0_BASE, SLAVE1_BASE]
    refs    = {}   # addr → bytes

    for _ in range(50):
        master = random.choice(masters)
        base   = random.choice(bases)
        offset = random.randint(0, (SLAVE_SIZE // 4) - 1) * 4
        addr   = base + offset
        val    = random.randint(0, 0xFFFF_FFFF)
        payload = val.to_bytes(4, "little")
        refs[addr] = payload
        await master.write(addr, payload)

    for addr, expected in refs.items():
        master = random.choice(masters)
        result = await master.read(addr, 4)
        assert result.data == expected, \
            f"random r/w mismatch at {addr:#010x}: " \
            f"expected {expected.hex()}, got {result.data.hex()}"


# ── Test 8: ID echo check ────────────────────────────────────────────────────

@cocotb.test()
async def test_id_roundtrip(dut):
    """
    Issue writes and reads with varying AXI IDs and verify data integrity.
    Each id=N writes a unique pattern and reads it back — exercises that the
    crossbar routes responses to the correct master regardless of the ID used.
    """
    cocotb.start_soon(Clock(dut.clk, 10, units="ns").start())
    await reset_dut(dut)
    m0, m1, s0, s1 = make_masters_and_rams(dut)

    for txid in [0, 3, 7, 12, 15]:
        addr = SLAVE0_BASE + txid * 4
        wdata = (0xF0000000 | txid).to_bytes(4, "little")
        await m0.write(addr, wdata, awid=txid)

        rd = await m0.read(addr, 4, arid=txid)
        assert rd.data == wdata, \
            f"Read-back mismatch at id={txid}: expected {wdata.hex()}, got {rd.data.hex()}"
