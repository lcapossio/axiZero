# Copyright (c) 2026 Leonardo Capossio — bard0 design  hello@bard0.com
# SPDX-License-Identifier: MIT
"""
test_full.py  —  cocotbext-axi tests for generated MyFull_2M2S.v

Topology: 2 AXI4 masters × 2 AXI4 slaves
  s0_axi       : master port 0 (AxiMaster drives the traffic)
  s1_axi       : master port 1 (idle AxiMaster; present so the port is driven
                 rather than left floating, which would corrupt arbitration)
  m0_axi       : slave 0 port (AxiRam), address 0x00000000 – 0x7FFFFFFF
  m1_axi       : slave 1 port (AxiRam), address 0x80000000 – 0x9FFFFFFF

Data width: 64 bits  ID width: 4 bits (master); slave-side IDs widen by the
master-index bit, which the BFMs pick up from the bus automatically.
Clock: aclk   Reset: aresetn (active-low)

Address notes:
  AxiRam stores at (address % size). 0x80000000 is a multiple of RAM_SIZE,
  so (0x80000000 + offset) % RAM_SIZE == offset for any offset < RAM_SIZE.
  Direct-memory verification uses this offset.
"""

import itertools
import random
import cocotb
from cocotb.clock import Clock
from cocotb.triggers import RisingEdge
from cocotbext.axi import AxiBurstType, AxiBus, AxiLockType, AxiMaster, AxiRam

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
    # Master port 1 is not exercised, but it must still be driven: an
    # undriven port sits at 'x' and the arbiter would sample that as a
    # request. Attaching an idle master holds its valids low.
    AxiMaster(AxiBus.from_prefix(dut, "s1_axi"), dut.aclk, dut.aresetn,
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


# ── Helpers for the tests below ─────────────────────────────────────────────

async def start(dut):
    cocotb.start_soon(Clock(dut.aclk, 10, units="ns").start())
    await reset_dut(dut)
    return make_bfms(dut)


def beats(n, seed):
    """n distinct 64-bit beats, as bytes: beat k is the byte (seed+k) repeated."""
    return [bytes([(seed + k) & 0xFF] * DATA_BYTES) for k in range(n)]


def first_diff(a, b):
    return next((i for i, (x, y) in enumerate(zip(a, b)) if x != y), None)


# ── Test 7: WRAP bursts ──────────────────────────────────────────────────────
#
# AxiRam wraps the addresses of a WRAP burst; the master BFM sends the beats
# in order without wrapping them. So a burst that starts part-way through its
# wrap container lands in the RAM rotated, which shows the slave saw WRAP --
# the crossbar carried AWBURST through and counted the beats right.

@cocotb.test(timeout_time=2, timeout_unit="ms")
async def test_wrap_burst(dut):
    """4- and 16-beat WRAP bursts starting mid-container land rotated, and read back in order."""
    master, ram0, _ = await start(dut)

    for n, container, start_beat in ((4, 0x3000, 2), (16, 0x3400, 5)):
        data = beats(n, 0x40 + n)
        addr = container + start_beat * DATA_BYTES
        await master.write(addr, b"".join(data), burst=AxiBurstType.WRAP)

        # Beat k went to container + ((start_beat + k) mod n) * 8.
        expected = [None] * n
        for k in range(n):
            expected[(start_beat + k) % n] = data[k]
        stored = ram0.read(container, n * DATA_BYTES)
        assert stored == b"".join(expected), \
            f"{n}-beat WRAP stored wrong; first bad byte {first_diff(stored, b''.join(expected))}"

        # A WRAP read from the same address returns the beats in the order written.
        got = await master.read(addr, n * DATA_BYTES, burst=AxiBurstType.WRAP)
        assert got.data == b"".join(data), f"{n}-beat WRAP read back out of order"


# ── Test 8: FIXED bursts ─────────────────────────────────────────────────────

@cocotb.test(timeout_time=2, timeout_unit="ms")
async def test_fixed_burst(dut):
    """A 4-beat FIXED burst writes one address four times; a FIXED read returns it four times."""
    master, ram0, _ = await start(dut)

    addr = 0x3800
    guard = bytes([0xEE] * DATA_BYTES)
    ram0.write(addr + DATA_BYTES, guard)

    data = beats(4, 0x10)
    await master.write(addr, b"".join(data), burst=AxiBurstType.FIXED)
    assert ram0.read(addr, DATA_BYTES) == data[-1], "FIXED: the last beat did not win"
    assert ram0.read(addr + DATA_BYTES, DATA_BYTES) == guard, \
        "FIXED: the burst walked into the next word"

    got = await master.read(addr, 4 * DATA_BYTES, burst=AxiBurstType.FIXED)
    assert got.data == data[-1] * 4, "FIXED read did not return the same word four times"


# ── Test 9: sub-word strobes and narrow transfers ───────────────────────────

@cocotb.test(timeout_time=2, timeout_unit="ms")
async def test_sub_word_strobes(dut):
    """Partial-strobe and narrow-size writes change only the bytes they name."""
    master, ram0, _ = await start(dut)

    base = 0x4000
    fill = bytes([0xA5] * 4 * DATA_BYTES)
    ram0.write(base, fill)
    ref = bytearray(fill)

    # A byte, a pair and a triple, each on one full-size beat with a partial
    # strobe.
    for off, data in ((3, b"\x11"), (6, b"\x22\x33"), (DATA_BYTES + 1, b"\x44\x55\x66")):
        await master.write(base + off, data)
        ref[off:off + len(data)] = data

    # Narrow transfers: AWSIZE = 1 (2 bytes a beat) on the 64-bit bus, so each
    # beat moves to the next pair of lanes.
    narrow = bytes(range(0x70, 0x78))
    await master.write(base + 2 * DATA_BYTES + 2, narrow, size=1)
    ref[2 * DATA_BYTES + 2:2 * DATA_BYTES + 10] = narrow

    stored = ram0.read(base, len(ref))
    assert stored == bytes(ref), f"strobes not honoured; first bad byte {first_diff(stored, ref)}"

    got = await master.read(base + 2 * DATA_BYTES + 2, len(narrow), size=1)
    assert got.data == narrow, "narrow read back wrong"


# ── Test 10: burst lengths other than powers of four ────────────────────────

@cocotb.test(timeout_time=2, timeout_unit="ms")
async def test_varied_burst_lengths(dut):
    """2-, 3-, 8- and 32-beat INCR bursts, to each slave."""
    master, _, _ = await start(dut)

    for i, n in enumerate((2, 3, 8, 32)):
        for base in (SLAVE0_BASE, SLAVE1_BASE):
            addr = base + 0x5000 + i * 0x400
            data = bytes(random.randint(0, 255) for _ in range(n * DATA_BYTES))
            await master.write(addr, data)
            got = await master.read(addr, len(data))
            assert got.data == data, \
                f"{n}-beat burst at {addr:#x}: first bad byte {first_diff(got.data, data)}"


# ── Test 11: unaligned addresses ────────────────────────────────────────────

@cocotb.test(timeout_time=2, timeout_unit="ms")
async def test_unaligned(dut):
    """Writes and reads that start and end mid-word, the neighbours left alone."""
    master, ram0, _ = await start(dut)

    base = 0x6000
    fill = bytes([0x5A] * 0x40)
    ram0.write(base, fill)
    ref = bytearray(fill)

    for off, length in ((0x05, 13), (0x13, 1), (0x19, 22)):
        data = bytes(random.randint(0, 255) for _ in range(length))
        await master.write(base + off, data)
        ref[off:off + length] = data
        got = await master.read(base + off, length)
        assert got.data == data, f"unaligned read at +{off:#x} wrong"

    stored = ram0.read(base, len(ref))
    assert stored == bytes(ref), f"unaligned write spilled; first bad byte {first_diff(stored, ref)}"


# ── Test 12: write address and data out of step ────────────────────────────

@cocotb.test(timeout_time=2, timeout_unit="ms")
async def test_split_aw_w(dut):
    """W ahead of AW, then AW ahead of W: every write still lands."""
    master, ram0, _ = await start(dut)

    for name, channel in (("W first", master.write_if.aw_channel),
                          ("AW first", master.write_if.w_channel)):
        # Hold one channel back for several cycles per transfer so the other
        # arrives first.
        channel.set_pause_generator(itertools.cycle([1] * 6 + [0]))
        for k in range(4):
            addr = 0x8000 + k * 0x40 + (0x400 if name == "AW first" else 0)
            data = bytes(random.randint(0, 255) for _ in range((k + 1) * DATA_BYTES))
            await master.write(addr, data)
            assert ram0.read(addr, len(data)) == data, f"{name}: write {k} did not land"
        # Clearing the generator leaves the channel however it last paused
        # it, which may be stopped; release it by hand.
        channel.clear_pause_generator()
        channel.pause = False


# ── Test 13: backpressure in the middle of a burst ──────────────────────────

@cocotb.test(timeout_time=2, timeout_unit="ms")
async def test_mid_burst_backpressure(dut):
    """Every handshake stalls between beats -- slave WREADY/RVALID, master WVALID/RREADY."""
    master, ram0, _ = await start(dut)

    ram0.write_if.w_channel.set_pause_generator(itertools.cycle([0, 1, 1]))
    ram0.read_if.r_channel.set_pause_generator(itertools.cycle([1, 0]))
    master.write_if.w_channel.set_pause_generator(itertools.cycle([0, 0, 1]))
    master.read_if.r_channel.set_pause_generator(itertools.cycle([0, 1, 0, 1, 1]))

    for n in (4, 16):
        addr = 0x9000 + n * 0x100
        data = bytes(random.randint(0, 255) for _ in range(n * DATA_BYTES))
        await master.write(addr, data)
        got = await master.read(addr, len(data))
        assert got.data == data, f"{n}-beat burst under backpressure: first bad byte {first_diff(got.data, data)}"


# ── Test 14: LOCK, CACHE and PROT reach the slave ───────────────────────────

@cocotb.test(timeout_time=2, timeout_unit="ms")
async def test_lock_cache_prot(dut):
    """AxLOCK, AxCACHE and AxPROT arrive at the slave as the master sent them."""
    master, _, _ = await start(dut)

    seen = {"aw": [], "ar": []}

    async def watch(ch):
        valid = getattr(dut, f"m0_axi_{ch}valid")
        ready = getattr(dut, f"m0_axi_{ch}ready")
        while True:
            await RisingEdge(dut.aclk)
            if valid.value == 1 and ready.value == 1:
                seen[ch].append((int(getattr(dut, f"m0_axi_{ch}lock").value),
                                 int(getattr(dut, f"m0_axi_{ch}cache").value),
                                 int(getattr(dut, f"m0_axi_{ch}prot").value)))

    cocotb.start_soon(watch("aw"))
    cocotb.start_soon(watch("ar"))

    cases = ((AxiLockType.EXCLUSIVE, 0b1010, 0b101),
             (AxiLockType.NORMAL, 0b0110, 0b010),
             (AxiLockType.EXCLUSIVE, 0b1111, 0b111))
    for lock, cache, prot in cases:
        await master.write(0xA000, bytes(DATA_BYTES), lock=lock, cache=cache, prot=prot)
        await master.read(0xA000, DATA_BYTES, lock=lock, cache=cache, prot=prot)

    want = [(int(lock), cache, prot) for lock, cache, prot in cases]
    assert seen["aw"] == want, f"AW sideband: sent {want}, slave saw {seen['aw']}"
    assert seen["ar"] == want, f"AR sideband: sent {want}, slave saw {seen['ar']}"
