// Copyright (c) 2026 Leonardo Capossio — bard0 design  hello@bard0.com
// SPDX-License-Identifier: MIT
package axizero.sim

import org.scalatest.funsuite.AnyFunSuite
import spinal.core._
import spinal.core.sim._
import axizero._

// ---------------------------------------------------------------------------
// LiteCrossbarSpec  —  functional tests for AxiZeroLiteTop
//
// Prerequisites: Verilator must be installed and on PATH.
//   Linux/macOS:  apt install verilator  /  brew install verilator
//   Windows:      install via MSYS2 or WSL, then add to PATH
//
// Run:  sbt test
//       sbt "testOnly axizero.sim.LiteCrossbarSpec"
// ---------------------------------------------------------------------------
class LiteCrossbarSpec extends AnyFunSuite {

  // ── Shared SpinalConfig (must match the clock domain used in AxiZeroLiteTop) ─

  private val spinalCfg = SpinalConfig(
    defaultConfigForClockDomains = ClockDomainConfig(
      clockEdge        = RISING,
      resetKind        = SYNC,
      resetActiveLevel = LOW
    )
  )

  private def simCfg = SimConfig.withConfig(spinalCfg)

  // ── Address map: two slaves, 64 KB each ────────────────────────────────────

  private val slave0Base = BigInt("00000000", 16)
  private val slave1Base = BigInt("00010000", 16)
  private val slaveSize  = BigInt("00010000", 16)

  // ── Design configs ─────────────────────────────────────────────────────────

  private def make1M2S = AxiZeroConfig.allLite(
    numMasters  = 1,
    numSlaves   = 2,
    addrWidth   = 32,
    dataWidth   = 32,
    addressMap  = Seq(slave0Base -> slaveSize, slave1Base -> slaveSize),
    arbitration = RoundRobin
  )

  private def make2M2S = AxiZeroConfig.allLite(
    numMasters  = 2,
    numSlaves   = 2,
    addrWidth   = 32,
    dataWidth   = 32,
    addressMap  = Seq(slave0Base -> slaveSize, slave1Base -> slaveSize),
    arbitration = RoundRobin
  )

  // ── Test 1: address-based write routing ────────────────────────────────────
  //
  // A single master writes to two different addresses; each write must appear
  // in exactly the correct slave's memory and nowhere else.

  test("write routes to correct slave by address") {
    simCfg.compile(new AxiZeroLiteTop(make1M2S)).doSim { dut =>
      val cd = dut.clockDomain
      cd.forkStimulus(10)

      SimHelpers.initMaster(dut.io.masters(0))
      val mem0 = SimHelpers.spawnLiteSlave(dut.io.slaves(0), cd)
      val mem1 = SimHelpers.spawnLiteSlave(dut.io.slaves(1), cd)

      cd.waitSampling(5)

      // Write to slave 0's range
      SimHelpers.liteWrite(dut.io.masters(0), cd,
        addr = slave0Base.toLong + 0x1000L, data = 0xABCD1234L)

      assert(mem0.getOrElse(slave0Base.toLong + 0x1000L, -1L) == 0xABCD1234L,
        "write to slave-0 range must arrive at slave 0")
      assert(!mem1.contains(slave0Base.toLong + 0x1000L),
        "write to slave-0 range must NOT arrive at slave 1")

      // Write to slave 1's range
      SimHelpers.liteWrite(dut.io.masters(0), cd,
        addr = slave1Base.toLong + 0x0080L, data = 0x5678AABBL)

      assert(mem1.getOrElse(slave1Base.toLong + 0x0080L, -1L) == 0x5678AABBL,
        "write to slave-1 range must arrive at slave 1")
      assert(!mem0.contains(slave1Base.toLong + 0x0080L),
        "write to slave-1 range must NOT arrive at slave 0")

      cd.waitSampling(5)
    }
  }

  // ── Test 2: address-based read routing ─────────────────────────────────────
  //
  // Pre-load each slave's memory; confirm reads return the correct data from
  // the correct slave.

  test("read routes to correct slave by address") {
    simCfg.compile(new AxiZeroLiteTop(make1M2S)).doSim { dut =>
      val cd = dut.clockDomain
      cd.forkStimulus(10)

      SimHelpers.initMaster(dut.io.masters(0))
      val mem0 = SimHelpers.spawnLiteSlave(dut.io.slaves(0), cd)
      val mem1 = SimHelpers.spawnLiteSlave(dut.io.slaves(1), cd)

      mem0(slave0Base.toLong + 0x0200L) = 0x11111111L
      mem1(slave1Base.toLong + 0x0200L) = 0x22222222L

      cd.waitSampling(5)

      val d0 = SimHelpers.liteRead(dut.io.masters(0), cd, slave0Base.toLong + 0x0200L)
      assert(d0 == 0x11111111L, f"slave-0 read: expected 0x11111111, got 0x$d0%08x")

      val d1 = SimHelpers.liteRead(dut.io.masters(0), cd, slave1Base.toLong + 0x0200L)
      assert(d1 == 0x22222222L, f"slave-1 read: expected 0x22222222, got 0x$d1%08x")

      cd.waitSampling(5)
    }
  }

  // ── Test 3: 2-master concurrent writes (round-robin arbitration) ────────────
  //
  // Both masters try to write to the same slave simultaneously.  The crossbar
  // arbitrates; both writes must eventually complete and data must match.

  test("2-master round-robin: both complete writes to the same slave") {
    simCfg.compile(new AxiZeroLiteTop(make2M2S)).doSim { dut =>
      val cd = dut.clockDomain
      cd.forkStimulus(10)

      SimHelpers.initMaster(dut.io.masters(0))
      SimHelpers.initMaster(dut.io.masters(1))
      val mem0 = SimHelpers.spawnLiteSlave(dut.io.slaves(0), cd)
      SimHelpers.spawnLiteSlave(dut.io.slaves(1), cd)   // not used, but needs a responder

      cd.waitSampling(5)

      // Launch both masters concurrently into slave 0's address space
      val f0 = fork {
        SimHelpers.liteWrite(dut.io.masters(0), cd,
          addr = slave0Base.toLong + 0x0100L, data = 0xAAAA0000L)
      }
      val f1 = fork {
        SimHelpers.liteWrite(dut.io.masters(1), cd,
          addr = slave0Base.toLong + 0x0200L, data = 0xBBBB0000L)
      }

      f0.join()
      f1.join()

      assert(mem0.getOrElse(slave0Base.toLong + 0x0100L, -1L) == 0xAAAA0000L,
        "master-0 write must complete and data must match")
      assert(mem0.getOrElse(slave0Base.toLong + 0x0200L, -1L) == 0xBBBB0000L,
        "master-1 write must complete and data must match")

      cd.waitSampling(5)
    }
  }

  // ── Test 4: write then read (data integrity round-trip) ────────────────────

  test("write-then-read round-trip preserves data") {
    simCfg.compile(new AxiZeroLiteTop(make1M2S)).doSim { dut =>
      val cd = dut.clockDomain
      cd.forkStimulus(10)

      SimHelpers.initMaster(dut.io.masters(0))
      SimHelpers.spawnLiteSlave(dut.io.slaves(0), cd)
      SimHelpers.spawnLiteSlave(dut.io.slaves(1), cd)

      cd.waitSampling(5)

      val testAddr = slave0Base.toLong + 0x0400L
      val testData = 0xCAFEBABEL

      SimHelpers.liteWrite(dut.io.masters(0), cd, testAddr, testData)
      val readBack = SimHelpers.liteRead(dut.io.masters(0), cd, testAddr)

      assert(readBack == testData,
        f"round-trip failed: wrote 0x${testData}%08x, read back 0x${readBack}%08x")

      cd.waitSampling(5)
    }
  }

  // ── WRR config ──────────────────────────────────────────────────────────────

  private def make2M2S_WRR = AxiZeroConfig.allLite(
    numMasters  = 2,
    numSlaves   = 2,
    addrWidth   = 32,
    dataWidth   = 32,
    addressMap  = Seq(slave0Base -> slaveSize, slave1Base -> slaveSize),
    arbitration = WeightedRoundRobin(Seq(3, 1))
  )

  // ── Test 5: WRR — weighted master gets proportionally more grants ─────────
  //
  // weights = [3, 1]: master 0 should get ~75% of grants when both contend
  // continuously for the same slave.  We track how many writes each master
  // completes by a fixed cycle deadline.  Master 0 should complete more.

  test("WRR: weighted master gets proportionally more bandwidth") {
    simCfg.compile(new AxiZeroLiteTop(make2M2S_WRR)).doSim { dut =>
      val cd = dut.clockDomain
      cd.forkStimulus(10)

      SimHelpers.initMaster(dut.io.masters(0))
      SimHelpers.initMaster(dut.io.masters(1))
      SimHelpers.spawnLiteSlave(dut.io.slaves(0), cd)
      SimHelpers.spawnLiteSlave(dut.io.slaves(1), cd)

      cd.waitSampling(5)

      // Both masters fire writes concurrently to the same slave.
      // We record which master's AW handshake fires on each cycle by
      // observing the completion order: master 0 (weight 3) should
      // finish its batch faster than master 1 (weight 1).
      val N = 16
      var done0at = 0L
      var done1at = 0L

      val f0 = fork {
        for (i <- 0 until N) {
          SimHelpers.liteWrite(dut.io.masters(0), cd,
            addr = slave0Base.toLong + (i * 4).toLong, data = 0xA0000000L | i)
        }
        done0at = simTime()
      }
      val f1 = fork {
        for (i <- 0 until N) {
          SimHelpers.liteWrite(dut.io.masters(1), cd,
            addr = slave0Base.toLong + 0x1000L + (i * 4).toLong, data = 0xB0000000L | i)
        }
        done1at = simTime()
      }

      f0.join()
      f1.join()

      // Master 0 (weight 3) should finish before master 1 (weight 1)
      // when both contend for the same slave.
      assert(done0at < done1at,
        s"WRR: master-0 (weight=3) should finish before master-1 (weight=1). " +
        s"done0at=$done0at, done1at=$done1at")

      cd.waitSampling(5)
    }
  }

  // ── Test 6: WRR — both masters still make progress (no starvation) ────────

  test("WRR: low-weight master still completes all writes") {
    simCfg.compile(new AxiZeroLiteTop(make2M2S_WRR)).doSim { dut =>
      val cd = dut.clockDomain
      cd.forkStimulus(10)

      SimHelpers.initMaster(dut.io.masters(0))
      SimHelpers.initMaster(dut.io.masters(1))
      val mem0 = SimHelpers.spawnLiteSlave(dut.io.slaves(0), cd)
      SimHelpers.spawnLiteSlave(dut.io.slaves(1), cd)

      cd.waitSampling(5)

      // Master 1 (low weight) writes 16 distinct values
      val f1 = fork {
        for (i <- 0 until 16) {
          SimHelpers.liteWrite(dut.io.masters(1), cd,
            addr = slave0Base.toLong + 0x2000L + (i * 4).toLong,
            data = 0xDEAD0000L | i)
        }
      }
      // Master 0 (high weight) writes concurrently
      val f0 = fork {
        for (i <- 0 until 16) {
          SimHelpers.liteWrite(dut.io.masters(0), cd,
            addr = slave0Base.toLong + (i * 4).toLong,
            data = 0xBEEF0000L | i)
        }
      }

      f0.join()
      f1.join()

      // Verify all master-1 writes arrived
      for (i <- 0 until 16) {
        val got = mem0.getOrElse(slave0Base.toLong + 0x2000L + (i * 4).toLong, -1L)
        assert(got == (0xDEAD0000L | i),
          f"master-1 write[$i] expected 0x${0xDEAD0000L | i}%08x, got 0x$got%08x")
      }

      cd.waitSampling(5)
    }
  }
}
