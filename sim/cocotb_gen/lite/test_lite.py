# Copyright (c) 2026 Leonardo Capossio — bard0 design  hello@bard0.com
# SPDX-License-Identifier: MIT
"""
test_lite.py  —  cocotbext-axi tests for generated MyLite_1M4S.v

Topology: 1 AXI4-Lite master × 4 AXI4-Lite slaves
  s0_axi       : master port (AxiLiteMaster connects here)
  m0_axi       : slave 0, address 0x00000000 – 0x00000FFF
  m1_axi       : slave 1, address 0x00010000 – 0x00010FFF
  m2_axi       : slave 2, address 0x00020000 – 0x00020FFF
  m3_axi       : slave 3, address 0x00030000 – 0x00030FFF

Data width: 32 bits
Clock: aclk   Reset: aresetn (active-low)

All verification goes through AXI reads (no direct RAM memory access) to
avoid SparseMemory address-range errors at non-zero slave bases.
"""

import random
import cocotb
from cocotb.clock import Clock
from cocotb.triggers import RisingEdge
from cocotbext.axi import AxiLiteBus, AxiLiteMaster, AxiLiteRam

SLAVE_BASES = [0x0000_0000, 0x0001_0000, 0x0002_0000, 0x0003_0000]
DATA_BYTES  = 4   # 32-bit data bus


async def reset_dut(dut, cycles=8):
    dut.aresetn.value = 0
    for _ in range(cycles):
        await RisingEdge(dut.aclk)
    dut.aresetn.value = 1
    await RisingEdge(dut.aclk)


def make_bfms(dut):
    master = AxiLiteMaster(AxiLiteBus.from_prefix(dut, "s0_axi"), dut.aclk, dut.aresetn,
                           reset_active_level=0)
    rams = [
        AxiLiteRam(AxiLiteBus.from_prefix(dut, f"m{i}_axi"), dut.aclk, dut.aresetn,
                   reset_active_level=0, size=0x1_0000)
        for i in range(4)
    ]
    return master, rams


# ── Test 1: single write / read to each slave ────────────────────────────────

@cocotb.test()
async def test_single_rw_all_slaves(dut):
    """Write one word to each slave, read all back via AXI."""
    cocotb.start_soon(Clock(dut.aclk, 10, units="ns").start())
    await reset_dut(dut)
    master, rams = make_bfms(dut)

    for i, base in enumerate(SLAVE_BASES):
        val = (0x1000_0000 * (i + 1)).to_bytes(DATA_BYTES, "little")
        await master.write(base + 4, val)
        result = await master.read(base + 4, DATA_BYTES)
        assert result.data == val, \
            f"Slave {i} mismatch: {result.data.hex()} != {val.hex()}"


# ── Test 2: address routing ──────────────────────────────────────────────────

@cocotb.test()
async def test_address_routing(dut):
    """
    Write a unique sentinel to each slave.  Read back via AXI and verify each
    read returns the value written to THAT slave's address range.
    """
    cocotb.start_soon(Clock(dut.aclk, 10, units="ns").start())
    await reset_dut(dut)
    master, rams = make_bfms(dut)

    sentinels = [
        (0xAAAA_0000 | i).to_bytes(DATA_BYTES, "little")
        for i in range(4)
    ]
    offset = 0x10

    # Write each sentinel to its slave
    for i, base in enumerate(SLAVE_BASES):
        await master.write(base + offset, sentinels[i])

    # Read back from each slave — verifies routing and data integrity
    for i, base in enumerate(SLAVE_BASES):
        result = await master.read(base + offset, DATA_BYTES)
        assert result.data == sentinels[i], \
            f"Slave {i} routing mismatch: got {result.data.hex()}, expected {sentinels[i].hex()}"


# ── Test 3: sequential writes within one slave ───────────────────────────────

@cocotb.test()
async def test_sequential_writes(dut):
    """16 sequential word writes within slave 0, verify all via AXI read."""
    cocotb.start_soon(Clock(dut.aclk, 10, units="ns").start())
    await reset_dut(dut)
    master, rams = make_bfms(dut)

    base = SLAVE_BASES[0]
    count = 16
    payloads = [(0xDEAD_0000 | i).to_bytes(DATA_BYTES, "little") for i in range(count)]

    for i, val in enumerate(payloads):
        await master.write(base + i * DATA_BYTES, val)

    for i, expected in enumerate(payloads):
        result = await master.read(base + i * DATA_BYTES, DATA_BYTES)
        assert result.data == expected, \
            f"Sequential mismatch at offset {i*DATA_BYTES:#x}: {result.data.hex()} != {expected.hex()}"


# ── Test 4: write-then-read across all four slaves ───────────────────────────

@cocotb.test()
async def test_all_slaves_read_after_write(dut):
    """Write a pattern to all slaves, then read all back and compare."""
    cocotb.start_soon(Clock(dut.aclk, 10, units="ns").start())
    await reset_dut(dut)
    master, rams = make_bfms(dut)

    pattern = {}
    for i, base in enumerate(SLAVE_BASES):
        for j in range(8):
            addr = base + j * DATA_BYTES
            val  = (i << 28 | j).to_bytes(DATA_BYTES, "little")
            await master.write(addr, val)
            pattern[addr] = val

    for addr, expected in pattern.items():
        result = await master.read(addr, DATA_BYTES)
        assert result.data == expected, \
            f"Mismatch at {addr:#010x}: {result.data.hex()} != {expected.hex()}"


# ── Test 5: overwrite and address independence ───────────────────────────────

@cocotb.test()
async def test_overwrite(dut):
    """
    Write a value to each slave, then overwrite with a different value.
    Verify the read returns the latest write, not the previous one.
    Also verifies that adjacent addresses in the same slave are independent.
    """
    cocotb.start_soon(Clock(dut.aclk, 10, units="ns").start())
    await reset_dut(dut)
    master, rams = make_bfms(dut)

    for i, base in enumerate(SLAVE_BASES):
        addr_a = base + 0x10
        addr_b = base + 0x14   # adjacent word

        first  = (0x1111_0000 | i).to_bytes(DATA_BYTES, "little")
        second = (0x2222_0000 | i).to_bytes(DATA_BYTES, "little")
        other  = (0x9999_0000 | i).to_bytes(DATA_BYTES, "little")

        await master.write(addr_a, first)
        await master.write(addr_b, other)
        await master.write(addr_a, second)   # overwrite addr_a

        r_a = await master.read(addr_a, DATA_BYTES)
        r_b = await master.read(addr_b, DATA_BYTES)

        assert r_a.data == second, \
            f"Slave {i} addr_a: expected overwrite {second.hex()}, got {r_a.data.hex()}"
        assert r_b.data == other, \
            f"Slave {i} addr_b: expected {other.hex()}, got {r_b.data.hex()} (addr_a overwrite bled into addr_b)"


# ── Test 6: constrained-random accesses ──────────────────────────────────────

@cocotb.test()
async def test_random_accesses(dut):
    """60 random writes to random slaves, then read-back verification."""
    cocotb.start_soon(Clock(dut.aclk, 10, units="ns").start())
    await reset_dut(dut)
    master, rams = make_bfms(dut)

    refs = {}
    for _ in range(60):
        base   = random.choice(SLAVE_BASES)
        offset = random.randint(0, (0x0800 // DATA_BYTES) - 1) * DATA_BYTES
        val    = random.randint(0, 0xFFFF_FFFF).to_bytes(DATA_BYTES, "little")
        addr   = base + offset
        refs[addr] = val
        await master.write(addr, val)

    for addr, expected in refs.items():
        result = await master.read(addr, DATA_BYTES)
        assert result.data == expected, \
            f"Random r/w mismatch at {addr:#010x}: {result.data.hex()} != {expected.hex()}"
