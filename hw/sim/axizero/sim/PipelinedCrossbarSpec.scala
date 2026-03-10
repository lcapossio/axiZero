// Copyright (c) 2026 Leonardo Capossio — bard0 design  hello@bard0.com
// SPDX-License-Identifier: MIT
package axizero.sim

import org.scalatest.funsuite.AnyFunSuite
import spinal.core._
import spinal.core.sim._
import spinal.lib.bus.amba4.axi.Axi4Config
import axizero._

// ---------------------------------------------------------------------------
// PipelinedCrossbarSpec  —  tests for Axi4Crossbar with maxOutstanding > 1
//
// Topology: 2 full-AXI4 masters, 2 full-AXI4 slaves.
// Uses maxOutstanding=4 so the pipelined datapath is elaborated.
//
// Each test attaches AxiMonitor instances to the slave ports to passively
// verify AXI protocol compliance (handshake stability, beat counts, LAST
// positioning, B.id / R.id sanity).
// ---------------------------------------------------------------------------
class PipelinedCrossbarSpec extends AnyFunSuite {

  private val spinalCfg = SpinalConfig(
    defaultConfigForClockDomains = ClockDomainConfig(
      clockEdge        = RISING,
      resetKind        = SYNC,
      resetActiveLevel = LOW
    )
  )

  private def simCfg = SimConfig.withConfig(spinalCfg)

  private val slave0Base = BigInt("00000000", 16)
  private val slave1Base = BigInt("00010000", 16)
  private val slaveSize  = BigInt("00010000", 16)

  // Master ID width = 4, slave ID width = 4 + 1 (masterIndexBits) = 5
  private val masterIdW = 4
  private val slaveIdW  = 5

  private val masterCfg = Axi4Config(addressWidth = 32, dataWidth = 32, idWidth = masterIdW)
  private val slaveCfg  = Axi4Config(addressWidth = 32, dataWidth = 32, idWidth = slaveIdW)

  /** Attach AxiMonitor to both slave ports; returns the two monitors. */
  private def attachMonitors(dut: AxiZeroMixedTop, cd: spinal.core.ClockDomain) = {
    val mon0 = AxiMonitor.attach(dut.io.slaves(0), cd, "S0")
    val mon1 = AxiMonitor.attach(dut.io.slaves(1), cd, "S1")
    (mon0, mon1)
  }

  private def makePipelinedCfg = AxiZeroConfig(
    masters = Seq.fill(2)(MasterPort(masterCfg, FullAxi4)),
    slaves  = Seq(
      SlavePort(slaveCfg, FullAxi4, slave0Base, slaveSize),
      SlavePort(slaveCfg, FullAxi4, slave1Base, slaveSize)
    ),
    arbitration    = RoundRobin,
    maxOutstanding = 4
  )

  // ── Test 1: single master write-read round-trip (pipelined path) ────────
  test("pipelined: single master write-read round-trip") {
    simCfg.compile(new AxiZeroMixedTop(makePipelinedCfg)).doSim { dut =>
      val cd = dut.clockDomain
      cd.forkStimulus(10)

      SimHelpers.initMaster(dut.io.masters(0))
      SimHelpers.initMaster(dut.io.masters(1))
      val mem0 = SimHelpers.spawnFullSlave(dut.io.slaves(0), cd)
      SimHelpers.spawnFullSlave(dut.io.slaves(1), cd)
      val (mon0, mon1) = attachMonitors(dut, cd)

      cd.waitSampling(5)

      // Write to slave 0 from master 0
      val wId = SimHelpers.fullWrite(dut.io.masters(0), cd,
        addr = slave0Base.toLong + 0x100L, data = 0xAABBCCDDL, id = 5)
      assert(wId == 5, s"B.id echo mismatch: expected 5, got $wId")

      // Read back
      val (rData, rId) = SimHelpers.fullRead(dut.io.masters(0), cd,
        addr = slave0Base.toLong + 0x100L, id = 9)
      assert(rData == 0xAABBCCDDL, f"read data mismatch: 0x${rData}%08x")
      assert(rId == 9, s"R.id echo mismatch: expected 9, got $rId")

      cd.waitSampling(5)
      mon0.assertNoErrors()
      mon1.assertNoErrors()
    }
  }

  // ── Test 2: two masters write to different slaves concurrently ──────────
  test("pipelined: two masters write to different slaves") {
    simCfg.compile(new AxiZeroMixedTop(makePipelinedCfg)).doSim { dut =>
      val cd = dut.clockDomain
      cd.forkStimulus(10)

      SimHelpers.initMaster(dut.io.masters(0))
      SimHelpers.initMaster(dut.io.masters(1))
      val mem0 = SimHelpers.spawnFullSlave(dut.io.slaves(0), cd)
      val mem1 = SimHelpers.spawnFullSlave(dut.io.slaves(1), cd)
      val (mon0, mon1) = attachMonitors(dut, cd)

      cd.waitSampling(5)

      // Fork both masters writing to different slaves simultaneously
      val t0 = fork {
        SimHelpers.fullWrite(dut.io.masters(0), cd,
          addr = slave0Base.toLong + 0x200L, data = 0x11111111L, id = 1)
      }
      val t1 = fork {
        SimHelpers.fullWrite(dut.io.masters(1), cd,
          addr = slave1Base.toLong + 0x300L, data = 0x22222222L, id = 2)
      }
      t0.join(); t1.join()

      assert(mem0.getOrElse(slave0Base.toLong + 0x200L, -1L) == 0x11111111L,
        "master 0 write to slave 0 missing")
      assert(mem1.getOrElse(slave1Base.toLong + 0x300L, -1L) == 0x22222222L,
        "master 1 write to slave 1 missing")

      cd.waitSampling(5)
      mon0.assertNoErrors()
      mon1.assertNoErrors()
    }
  }

  // ── Test 3: two masters write to the SAME slave (arbitration + W-FIFO) ──
  test("pipelined: two masters write to same slave sequentially") {
    simCfg.compile(new AxiZeroMixedTop(makePipelinedCfg)).doSim { dut =>
      val cd = dut.clockDomain
      cd.forkStimulus(10)

      SimHelpers.initMaster(dut.io.masters(0))
      SimHelpers.initMaster(dut.io.masters(1))
      val mem0 = SimHelpers.spawnFullSlave(dut.io.slaves(0), cd)
      SimHelpers.spawnFullSlave(dut.io.slaves(1), cd)
      val (mon0, mon1) = attachMonitors(dut, cd)

      cd.waitSampling(5)

      // Master 0 writes first
      SimHelpers.fullWrite(dut.io.masters(0), cd,
        addr = slave0Base.toLong + 0x400L, data = 0x33333333L, id = 3)
      // Master 1 writes second
      SimHelpers.fullWrite(dut.io.masters(1), cd,
        addr = slave0Base.toLong + 0x404L, data = 0x44444444L, id = 4)

      assert(mem0.getOrElse(slave0Base.toLong + 0x400L, -1L) == 0x33333333L,
        "master 0 write to slave 0 missing")
      assert(mem0.getOrElse(slave0Base.toLong + 0x404L, -1L) == 0x44444444L,
        "master 1 write to slave 0 missing")

      // Read back from master 1 to verify
      val (rData, _) = SimHelpers.fullRead(dut.io.masters(1), cd,
        addr = slave0Base.toLong + 0x400L, id = 0)
      assert(rData == 0x33333333L, f"cross-master read-back failed: 0x${rData}%08x")

      cd.waitSampling(5)
      mon0.assertNoErrors()
      mon1.assertNoErrors()
    }
  }

  // ── Test 4: write routing to correct slave by address (pipelined) ───────
  test("pipelined: write routes to correct slave by address") {
    simCfg.compile(new AxiZeroMixedTop(makePipelinedCfg)).doSim { dut =>
      val cd = dut.clockDomain
      cd.forkStimulus(10)

      SimHelpers.initMaster(dut.io.masters(0))
      SimHelpers.initMaster(dut.io.masters(1))
      val mem0 = SimHelpers.spawnFullSlave(dut.io.slaves(0), cd)
      val mem1 = SimHelpers.spawnFullSlave(dut.io.slaves(1), cd)
      val (mon0, mon1) = attachMonitors(dut, cd)

      cd.waitSampling(5)

      SimHelpers.fullWrite(dut.io.masters(0), cd,
        addr = slave0Base.toLong + 0x10L, data = 0xAAAAAAAAL, id = 0)
      SimHelpers.fullWrite(dut.io.masters(0), cd,
        addr = slave1Base.toLong + 0x20L, data = 0xBBBBBBBBL, id = 1)

      assert(mem0.getOrElse(slave0Base.toLong + 0x10L, -1L) == 0xAAAAAAAAL,
        "write to slave 0 region must land in slave 0")
      assert(mem1.getOrElse(slave1Base.toLong + 0x20L, -1L) == 0xBBBBBBBBL,
        "write to slave 1 region must land in slave 1")

      val (rData, _) = SimHelpers.fullRead(dut.io.masters(0), cd,
        addr = slave1Base.toLong + 0x20L, id = 2)
      assert(rData == 0xBBBBBBBBL, f"read from slave 1 failed: 0x${rData}%08x")

      cd.waitSampling(5)
      mon0.assertNoErrors()
      mon1.assertNoErrors()
    }
  }

  // ── Test 5: 64-beat burst write + read, no back-pressure ─────────────────
  //
  // Verifies that len=63 INCR bursts are forwarded correctly through the
  // pipelined crossbar and that all 64 beats are stored and read back intact.

  test("pipelined: 64-beat burst write-read, no back-pressure") {
    simCfg.compile(new AxiZeroMixedTop(makePipelinedCfg)).doSim { dut =>
      val cd = dut.clockDomain
      cd.forkStimulus(10)

      SimHelpers.initMaster(dut.io.masters(0))
      SimHelpers.initMaster(dut.io.masters(1))
      val mem0 = SimHelpers.spawnFullSlave(dut.io.slaves(0), cd)
      SimHelpers.spawnFullSlave(dut.io.slaves(1), cd)
      val (mon0, mon1) = attachMonitors(dut, cd)

      cd.waitSampling(5)

      val baseAddr = slave0Base.toLong + 0x1000L
      val writeData = (0 until 64).map(i => 0xAB000000L | i.toLong)

      SimHelpers.fullBurstWrite(dut.io.masters(0), cd, baseAddr, writeData, id = 1)

      val (readData, rid) = SimHelpers.fullBurstRead(dut.io.masters(0), cd, baseAddr, 64, id = 2)
      assert(rid == 2, s"R.id mismatch: expected 2, got $rid")
      for (i <- 0 until 64) {
        assert(readData(i) == writeData(i),
          f"beat $i mismatch: wrote 0x${writeData(i)}%08x, read 0x${readData(i)}%08x")
      }

      cd.waitSampling(5)
      mon0.assertNoErrors()
      mon1.assertNoErrors()
    }
  }

  // ── Test 6: 64-beat burst with W-channel back-pressure ───────────────────
  //
  // The slave stalls W.ready for 3 cycles between beats.  The master must
  // hold W.valid until accepted; the crossbar and slave must not lose beats
  // or corrupt data.

  test("pipelined: 64-beat burst with W-channel back-pressure") {
    simCfg.compile(new AxiZeroMixedTop(makePipelinedCfg)).doSim { dut =>
      val cd = dut.clockDomain
      cd.forkStimulus(10)

      SimHelpers.initMaster(dut.io.masters(0))
      SimHelpers.initMaster(dut.io.masters(1))
      // stallW=3: slave holds w.ready low for 3 cycles before each beat
      val mem0 = SimHelpers.spawnFullSlave(dut.io.slaves(0), cd, stallW = 3)
      SimHelpers.spawnFullSlave(dut.io.slaves(1), cd)
      val (mon0, mon1) = attachMonitors(dut, cd)

      cd.waitSampling(5)

      val baseAddr  = slave0Base.toLong + 0x2000L
      val writeData = (0 until 64).map(i => 0xCD000000L | i.toLong)

      SimHelpers.fullBurstWrite(dut.io.masters(0), cd, baseAddr, writeData, id = 3)

      val (readData, _) = SimHelpers.fullBurstRead(dut.io.masters(0), cd, baseAddr, 64, id = 4)
      for (i <- 0 until 64) {
        assert(readData(i) == writeData(i),
          f"beat $i mismatch after W back-pressure: wrote 0x${writeData(i)}%08x, " +
          f"read 0x${readData(i)}%08x")
      }

      cd.waitSampling(5)
      mon0.assertNoErrors()
      mon1.assertNoErrors()
    }
  }

  // ── Test 7: 64-beat burst with R-channel back-pressure ───────────────────
  //
  // The master deasserts R.ready for 2 cycles between beats.  The slave must
  // hold R.valid; no beats may be lost or corrupted.

  test("pipelined: 64-beat burst with R-channel back-pressure") {
    simCfg.compile(new AxiZeroMixedTop(makePipelinedCfg)).doSim { dut =>
      val cd = dut.clockDomain
      cd.forkStimulus(10)

      SimHelpers.initMaster(dut.io.masters(0))
      SimHelpers.initMaster(dut.io.masters(1))
      val mem0 = SimHelpers.spawnFullSlave(dut.io.slaves(0), cd)
      SimHelpers.spawnFullSlave(dut.io.slaves(1), cd)
      val (mon0, mon1) = attachMonitors(dut, cd)

      cd.waitSampling(5)

      val baseAddr  = slave0Base.toLong + 0x3000L
      val writeData = (0 until 64).map(i => 0xEF000000L | i.toLong)

      // Pre-load with no back-pressure
      SimHelpers.fullBurstWrite(dut.io.masters(0), cd, baseAddr, writeData, id = 5)

      // Read back with 2-cycle stall between beats (master-side back-pressure)
      val (readData, _) = SimHelpers.fullBurstRead(dut.io.masters(0), cd, baseAddr, 64,
        id = 6, stallCycles = 2)
      for (i <- 0 until 64) {
        assert(readData(i) == writeData(i),
          f"beat $i mismatch after R back-pressure: wrote 0x${writeData(i)}%08x, " +
          f"read 0x${readData(i)}%08x")
      }

      cd.waitSampling(5)
      mon0.assertNoErrors()
      mon1.assertNoErrors()
    }
  }

  // ── Test 8: two masters, concurrent 16-beat bursts to different slaves ───
  //
  // Both masters issue AW+W simultaneously to different slaves.  Verifies
  // that the crossbar routes both independently and B/R responses return to
  // the correct master.

  test("pipelined: two masters concurrent 16-beat bursts to different slaves") {
    simCfg.compile(new AxiZeroMixedTop(makePipelinedCfg)).doSim { dut =>
      val cd = dut.clockDomain
      cd.forkStimulus(10)

      SimHelpers.initMaster(dut.io.masters(0))
      SimHelpers.initMaster(dut.io.masters(1))
      val mem0 = SimHelpers.spawnFullSlave(dut.io.slaves(0), cd)
      val mem1 = SimHelpers.spawnFullSlave(dut.io.slaves(1), cd)
      val (mon0, mon1) = attachMonitors(dut, cd)

      cd.waitSampling(5)

      val data0 = (0 until 16).map(i => 0x10000000L + i)
      val data1 = (0 until 16).map(i => 0x20000000L + i)
      val base0 = slave0Base.toLong + 0x4000L
      val base1 = slave1Base.toLong + 0x4000L

      val t0 = fork { SimHelpers.fullBurstWrite(dut.io.masters(0), cd, base0, data0, id = 7) }
      val t1 = fork { SimHelpers.fullBurstWrite(dut.io.masters(1), cd, base1, data1, id = 8) }
      t0.join(); t1.join()

      // Verify memory
      for (i <- 0 until 16) {
        val a0 = base0 + i * 4
        val a1 = base1 + i * 4
        assert(mem0.getOrElse(a0, -1L) == data0(i),
          f"slave 0 beat $i: expected 0x${data0(i)}%08x, got 0x${mem0.getOrElse(a0,-1L)}%08x")
        assert(mem1.getOrElse(a1, -1L) == data1(i),
          f"slave 1 beat $i: expected 0x${data1(i)}%08x, got 0x${mem1.getOrElse(a1,-1L)}%08x")
      }

      // Read back via opposite masters (cross-master verification)
      val (rd0, rid0) = SimHelpers.fullBurstRead(dut.io.masters(1), cd, base0, 16, id = 9)
      val (rd1, rid1) = SimHelpers.fullBurstRead(dut.io.masters(0), cd, base1, 16, id = 10)
      assert(rid0 == 9,  s"R.id mismatch for master 1 reading slave 0: $rid0")
      assert(rid1 == 10, s"R.id mismatch for master 0 reading slave 1: $rid1")
      for (i <- 0 until 16) {
        assert(rd0(i) == data0(i), f"cross-read slave 0 beat $i mismatch")
        assert(rd1(i) == data1(i), f"cross-read slave 1 beat $i mismatch")
      }

      cd.waitSampling(5)
      mon0.assertNoErrors()
      mon1.assertNoErrors()
    }
  }
}
