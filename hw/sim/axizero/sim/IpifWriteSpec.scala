// Copyright (c) 2026 Leonardo Capossio — bard0 design  hello@bard0.com
// SPDX-License-Identifier: MIT
package axizero.sim

import org.scalatest.funsuite.AnyFunSuite
import spinal.core._
import spinal.core.sim._
import spinal.lib.bus.amba4.axi.Axi4Config
import axizero._

// ---------------------------------------------------------------------------
// IpifWriteSpec  —  regression tests for the IPIF AW+W deadlock fix
//
// Background
// ──────────
// Xilinx IPIF-based AXI4-Lite peripherals (axi_gpio, axi_uartlite …) require
// that AWVALID and WVALID be asserted simultaneously before they assert
// AWREADY / WREADY.  The axiZero crossbar was previously presenting AWVALID=1
// to the slave while WVALID=0, causing a permanent handshake deadlock.
//
// The fix forward W alongside AW during the AW-presentation phase in both:
//   • blocking mode  (maxOutstanding = 1, Axi4Crossbar blocking path)
//   • pipelined mode (maxOutstanding > 1, Axi4Crossbar pipelined path)
// and in Axi4LiteCrossbar (all-Lite topologies).
//
// Test topology: 1 Full master → AxiZeroMixedTop → 1 IPIF Lite slave
//   Slave base address: 0x0000_0000, size: 64 KB
//
// spawnIpifLiteSlave models the Xilinx IPIF: it only accepts AW+W when both
// AWVALID and WVALID are high simultaneously.  Without the fix the simulation
// hangs; with the fix it completes within a bounded number of cycles.
// ---------------------------------------------------------------------------
class IpifWriteSpec extends AnyFunSuite {

  private val spinalCfg = SpinalConfig(
    defaultConfigForClockDomains = ClockDomainConfig(
      clockEdge        = RISING,
      resetKind        = SYNC,
      resetActiveLevel = LOW
    )
  )

  private def simCfg = SimConfig.withConfig(spinalCfg)

  private val slaveBase = BigInt("00000000", 16)
  private val slaveSize = BigInt("00010000", 16)

  // AXI4-Lite config (no IDs, no bursts)
  private val liteSlaveCfg = Axi4Config(
    addressWidth = 32, dataWidth = 32,
    useId     = false, useRegion = false,
    useBurst  = false, useLock   = false,
    useCache  = false, useSize   = false,
    useQos    = false, useLen    = false,
    useLast   = false, useResp   = true,
    useProt   = true,  useStrb   = true
  )

  // Full AXI4 master config
  private val fullMasterCfg = Axi4Config(
    addressWidth = 32, dataWidth = 32, idWidth = 4
  )

  // ── Helpers ──────────────────────────────────────────────────────────────

  private def makeAxiZeroCfg(maxOut: Int) = AxiZeroConfig(
    masters = Seq(MasterPort(fullMasterCfg, FullAxi4)),
    slaves  = Seq(SlavePort(liteSlaveCfg, LiteAxi4, slaveBase, slaveSize)),
    arbitration    = RoundRobin,
    maxOutstanding = maxOut
  )

  // Run a single IPIF write→read round-trip and assert correctness.
  // Times out after 500 cycles if the slave never accepts the write.
  private def runIpifRoundTrip(dut: AxiZeroMixedTop, addr: Long,
                                wdata: Long, expectedMem: Long): Unit = {
    val cd  = dut.clockDomain
    val mem = SimHelpers.spawnIpifLiteSlave(dut.io.slaves(0), cd)
    SimHelpers.initMaster(dut.io.masters(0))
    cd.waitSampling(5)

    // liteWriteSimul presents AW and W simultaneously — this is the stimulus
    // that was previously causing a deadlock without the fix.
    SimHelpers.liteWriteSimul(dut.io.masters(0), cd, addr, wdata)

    val got = mem.getOrElse(addr, -1L)
    assert(got == expectedMem,
      f"IPIF write round-trip failed at 0x$addr%08x: " +
      f"expected 0x$expectedMem%08x, got 0x$got%08x")
  }

  // ── Test 1: blocking mode (maxOutstanding = 1) ───────────────────────────

  test("IPIF write completes without deadlock — blocking mode (maxOutstanding=1)") {
    simCfg.compile(new AxiZeroMixedTop(makeAxiZeroCfg(1))).doSim { dut =>
      dut.clockDomain.forkStimulus(10)
      runIpifRoundTrip(dut,
        addr         = slaveBase.toLong + 0x0100L,
        wdata        = 0xDEADBEEFL,
        expectedMem  = 0xDEADBEEFL)
      dut.clockDomain.waitSampling(10)
    }
  }

  // ── Test 2: pipelined mode (maxOutstanding = 4) ──────────────────────────

  test("IPIF write completes without deadlock — pipelined mode (maxOutstanding=4)") {
    simCfg.compile(new AxiZeroMixedTop(makeAxiZeroCfg(4))).doSim { dut =>
      dut.clockDomain.forkStimulus(10)
      runIpifRoundTrip(dut,
        addr         = slaveBase.toLong + 0x0200L,
        wdata        = 0xCAFEBABEL,
        expectedMem  = 0xCAFEBABEL)
      dut.clockDomain.waitSampling(10)
    }
  }

  // ── Test 3: multiple consecutive IPIF writes — blocking ──────────────────

  test("multiple consecutive IPIF writes — blocking mode") {
    simCfg.compile(new AxiZeroMixedTop(makeAxiZeroCfg(1))).doSim { dut =>
      val cd  = dut.clockDomain
      val mem = SimHelpers.spawnIpifLiteSlave(dut.io.slaves(0), cd)
      SimHelpers.initMaster(dut.io.masters(0))
      cd.forkStimulus(10)
      cd.waitSampling(5)

      val writes = Seq(
        (slaveBase.toLong + 0x10L, 0x11111111L),
        (slaveBase.toLong + 0x14L, 0x22222222L),
        (slaveBase.toLong + 0x18L, 0x33333333L)
      )
      for ((addr, data) <- writes)
        SimHelpers.liteWriteSimul(dut.io.masters(0), cd, addr, data)

      for ((addr, expected) <- writes) {
        val got = mem.getOrElse(addr, -1L)
        assert(got == expected,
          f"multi-write: addr 0x$addr%08x expected 0x$expected%08x got 0x$got%08x")
      }
      cd.waitSampling(10)
    }
  }

  // ── Test 4: multiple consecutive IPIF writes — pipelined ─────────────────

  test("multiple consecutive IPIF writes — pipelined mode") {
    simCfg.compile(new AxiZeroMixedTop(makeAxiZeroCfg(4))).doSim { dut =>
      val cd  = dut.clockDomain
      val mem = SimHelpers.spawnIpifLiteSlave(dut.io.slaves(0), cd)
      SimHelpers.initMaster(dut.io.masters(0))
      cd.forkStimulus(10)
      cd.waitSampling(5)

      val writes = Seq(
        (slaveBase.toLong + 0x20L, 0xAAAAAAAAL),
        (slaveBase.toLong + 0x24L, 0xBBBBBBBBL),
        (slaveBase.toLong + 0x28L, 0xCCCCCCCCL)
      )
      for ((addr, data) <- writes)
        SimHelpers.liteWriteSimul(dut.io.masters(0), cd, addr, data)

      for ((addr, expected) <- writes) {
        val got = mem.getOrElse(addr, -1L)
        assert(got == expected,
          f"multi-write pipelined: addr 0x$addr%08x expected 0x$expected%08x got 0x$got%08x")
      }
      cd.waitSampling(10)
    }
  }

  // ── Test 5: IPIF write followed by standard read-back ────────────────────
  //
  // After the IPIF write completes the crossbar must be able to issue a
  // standard AR→R read to the same slave.

  test("IPIF write then standard read-back — pipelined mode") {
    simCfg.compile(new AxiZeroMixedTop(makeAxiZeroCfg(4))).doSim { dut =>
      val cd  = dut.clockDomain
      val mem = SimHelpers.spawnIpifLiteSlave(dut.io.slaves(0), cd)
      SimHelpers.initMaster(dut.io.masters(0))
      cd.forkStimulus(10)
      cd.waitSampling(5)

      val addr  = slaveBase.toLong + 0x0300L
      val wdata = 0xFACEFACEL
      SimHelpers.liteWriteSimul(dut.io.masters(0), cd, addr, wdata)

      // Standard read via fullRead (AR then R — works for any slave)
      val (rdata, _) = SimHelpers.fullRead(dut.io.masters(0), cd, addr)
      assert(rdata == wdata,
        f"IPIF write then read: expected 0x$wdata%08x got 0x$rdata%08x")

      cd.waitSampling(10)
    }
  }
}
