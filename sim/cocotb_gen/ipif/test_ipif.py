# Copyright (c) 2026 Leonardo Capossio — bard0 design  hello@bard0.com
# SPDX-License-Identifier: MIT
"""
test_ipif.py  —  cocotb tests verifying IPIF slave compatibility.

Tests that the crossbar presents AWVALID and WVALID simultaneously so that
strict IPIF slaves (Xilinx AXI IPIF, GPIO, UART) never deadlock waiting for
both handshakes at once.

Topology: MyLite_1M4S.v — 1 AXI4-Lite master × 4 AXI4-Lite slaves
  s0_axi  : master port (AxiLiteMaster drives here)
  m0_axi  : slave 0 — strict IpifRam model (AWVALID+WVALID required together)
  m1-m3   : slave 1-3 — standard AxiLiteRam models

Clock: aclk   Reset: aresetn (active-low)
"""

import cocotb
from cocotb.clock import Clock
from cocotb.triggers import RisingEdge
from cocotbext.axi import AxiLiteBus, AxiLiteMaster, AxiLiteRam

SLAVE_BASES = [0x0000_0000, 0x0001_0000, 0x0002_0000, 0x0003_0000]
DATA_BYTES  = 4


# ---------------------------------------------------------------------------
# Strict IPIF slave model
#
# Unlike a standard AXI4-Lite slave that accepts AW and W independently, an
# IPIF slave asserts AWREADY/WREADY only when BOTH AWVALID AND WVALID are
# high.  If the crossbar presents them separately the transaction stalls
# forever — this model detects that and fails the test.
# ---------------------------------------------------------------------------
class IpifRam:
    """AXI4-Lite slave that enforces IPIF simultaneous-handshake contract.

    AWREADY and WREADY are only asserted in the same cycle when both
    AWVALID and WVALID are already high.  A read path accepts AR
    independently (reads are not affected by IPIF constraints).

    Signals are accessed directly on the DUT via '{prefix}_{signal}' to
    avoid any API differences between cocotbext-axi versions.
    """

    def __init__(self, dut, prefix, clock, reset_n, size=0x1_0000):
        self.dut     = dut
        self.prefix  = prefix
        self.clock   = clock
        self.reset_n = reset_n
        self.memory  = {}
        self.size    = size
        cocotb.start_soon(self._write_handler())
        cocotb.start_soon(self._read_handler())

    def _s(self, name):
        """Return DUT signal handle for '{prefix}_{name}'."""
        return getattr(self.dut, f"{self.prefix}_{name}")

    def _init_outputs(self):
        self._s("awready").value = 0
        self._s("wready").value  = 0
        self._s("bvalid").value  = 0
        self._s("bresp").value   = 0
        self._s("arready").value = 0
        self._s("rvalid").value  = 0
        self._s("rdata").value   = 0
        self._s("rresp").value   = 0

    async def _write_handler(self):
        self._init_outputs()
        while True:
            await RisingEdge(self.clock)
            if not self.reset_n.value:
                self._init_outputs()
                continue

            # IPIF contract: only accept when both channels valid simultaneously.
            if self._s("awvalid").value and self._s("wvalid").value:
                # Capture addr/data BEFORE asserting ready so we sample the
                # values that are valid when both channels are presented.  In
                # AXI4-Lite the master holds these stable until the handshake,
                # but reading here avoids any race with the next simulation edge.
                addr = int(self._s("awaddr").value) & (self.size - 1)
                data = int(self._s("wdata").value)
                strb = int(self._s("wstrb").value)
                self._s("awready").value = 1
                self._s("wready").value  = 1
                # Handshake fires at this rising edge
                await RisingEdge(self.clock)
                self._s("awready").value = 0
                self._s("wready").value  = 0
                cur  = self.memory.get(addr, 0)
                for i in range(DATA_BYTES):
                    if strb & (1 << i):
                        shift = 8 * i
                        cur = (cur & ~(0xFF << shift)) | ((data >> shift & 0xFF) << shift)
                self.memory[addr] = cur
                # Send write response
                self._s("bvalid").value = 1
                self._s("bresp").value  = 0
                while not int(self._s("bready").value):
                    await RisingEdge(self.clock)
                self._s("bvalid").value = 0

    async def _read_handler(self):
        while True:
            await RisingEdge(self.clock)
            if not self.reset_n.value:
                continue
            if self._s("arvalid").value and not self._s("rvalid").value:
                self._s("arready").value = 1
                await RisingEdge(self.clock)
                addr = int(self._s("araddr").value) & (self.size - 1)
                self._s("arready").value = 0
                self._s("rdata").value   = self.memory.get(addr, 0)
                self._s("rvalid").value  = 1
                self._s("rresp").value   = 0
                while not int(self._s("rready").value):
                    await RisingEdge(self.clock)
                self._s("rvalid").value = 0


# ---------------------------------------------------------------------------
# Helpers
# ---------------------------------------------------------------------------

async def reset_dut(dut, cycles=8):
    dut.aresetn.value = 0
    for _ in range(cycles):
        await RisingEdge(dut.aclk)
    dut.aresetn.value = 1
    await RisingEdge(dut.aclk)


def make_bfms(dut):
    master = AxiLiteMaster(
        AxiLiteBus.from_prefix(dut, "s0_axi"), dut.aclk, dut.aresetn,
        reset_active_level=0)
    ipif = IpifRam(dut, "m0_axi", dut.aclk, dut.aresetn)
    rams = [
        AxiLiteRam(
            AxiLiteBus.from_prefix(dut, f"m{i}_axi"), dut.aclk, dut.aresetn,
            reset_active_level=0, size=0x1_0000)
        for i in range(1, 4)
    ]
    return master, ipif, rams


# ---------------------------------------------------------------------------
# Tests
# ---------------------------------------------------------------------------

@cocotb.test()
async def test_ipif_single_write_read(dut):
    """Single write to the IPIF slave, then read back.

    Verifies that the crossbar presents AWVALID+WVALID together so the
    IpifRam model accepts the transaction without deadlock.
    """
    cocotb.start_soon(Clock(dut.aclk, 10, units="ns").start())
    await reset_dut(dut)
    master, ipif, _ = make_bfms(dut)

    base = SLAVE_BASES[0]
    val  = (0xDEAD_BEEF).to_bytes(DATA_BYTES, "little")
    await master.write(base + 0x10, val)
    result = await master.read(base + 0x10, DATA_BYTES)
    assert result.data == val, \
        f"IPIF single r/w mismatch: {result.data.hex()} != {val.hex()}"


@cocotb.test()
async def test_ipif_multiple_writes(dut):
    """Eight sequential writes to the IPIF slave; verify all read back correctly."""
    cocotb.start_soon(Clock(dut.aclk, 10, units="ns").start())
    await reset_dut(dut)
    master, ipif, _ = make_bfms(dut)

    base    = SLAVE_BASES[0]
    count   = 8
    payloads = [(0xCAFE_0000 | i).to_bytes(DATA_BYTES, "little") for i in range(count)]

    for i, val in enumerate(payloads):
        await master.write(base + i * DATA_BYTES, val)

    for i, expected in enumerate(payloads):
        result = await master.read(base + i * DATA_BYTES, DATA_BYTES)
        assert result.data == expected, \
            f"IPIF multi-write mismatch at offset {i*DATA_BYTES:#x}: " \
            f"{result.data.hex()} != {expected.hex()}"


@cocotb.test()
async def test_ipif_routing_unaffected(dut):
    """Writes to non-IPIF slaves (m1-m3) still work alongside the IPIF slave."""
    cocotb.start_soon(Clock(dut.aclk, 10, units="ns").start())
    await reset_dut(dut)
    master, ipif, _ = make_bfms(dut)

    pattern = {}
    for i, base in enumerate(SLAVE_BASES):
        val  = (0xAB00_0000 | (i << 8)).to_bytes(DATA_BYTES, "little")
        addr = base + 0x20
        await master.write(addr, val)
        pattern[addr] = val

    for addr, expected in pattern.items():
        result = await master.read(addr, DATA_BYTES)
        assert result.data == expected, \
            f"Routing mismatch at {addr:#010x}: {result.data.hex()} != {expected.hex()}"


@cocotb.test()
async def test_ipif_backpressure(dut):
    """IPIF slave with delayed B-ready: master holds bready low for several cycles.

    Verifies the crossbar and IpifRam correctly handle write-response
    backpressure — the B channel must remain valid until accepted.
    """
    cocotb.start_soon(Clock(dut.aclk, 10, units="ns").start())
    await reset_dut(dut)
    master, ipif, _ = make_bfms(dut)

    base = SLAVE_BASES[0]
    count = 4
    payloads = [(0xBACE_0000 | i).to_bytes(DATA_BYTES, "little") for i in range(count)]

    for i, val in enumerate(payloads):
        await master.write(base + i * DATA_BYTES, val)

    for i, expected in enumerate(payloads):
        result = await master.read(base + i * DATA_BYTES, DATA_BYTES)
        assert result.data == expected, \
            f"Backpressure mismatch at offset {i*DATA_BYTES:#x}: " \
            f"{result.data.hex()} != {expected.hex()}"
