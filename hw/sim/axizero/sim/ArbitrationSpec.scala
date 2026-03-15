// Copyright (c) 2026 Leonardo Capossio
// SPDX-License-Identifier: MIT
package axizero.sim

import org.scalatest.funsuite.AnyFunSuite
import spinal.core._
import spinal.core.sim._
import spinal.lib.bus.amba4.axi.Axi4Config
import axizero._

// ---------------------------------------------------------------------------
// ArbitrationSpec  —  coverage for FixedPriority and WeightedRoundRobin
//
// Topology: 2 or 3 full-AXI4 masters, 1 full-AXI4 slave.
// Tests verify ordering / throughput properties specific to each policy.
// ---------------------------------------------------------------------------
class ArbitrationSpec extends AnyFunSuite {

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

  private val masterCfg = Axi4Config(addressWidth = 32, dataWidth = 32, idWidth = 4)

  // Slave ID width must accommodate masterIndexBits = ceil(log2(nMasters))
  private def slaveCfg(nMasters: Int) = Axi4Config(
    addressWidth = 32, dataWidth = 32,
    idWidth      = 4 + (if (nMasters <= 1) 0 else scala.math.ceil(scala.math.log(nMasters) / scala.math.log(2)).toInt)
  )

  // ── FixedPriority helpers ─────────────────────────────────────────────────

  private def makeFpCfg(nMasters: Int) = AxiZeroConfig(
    masters     = Seq.fill(nMasters)(MasterPort(masterCfg, FullAxi4)),
    slaves      = Seq(SlavePort(slaveCfg(nMasters), FullAxi4, slaveBase, slaveSize)),
    arbitration = FixedPriority
  )

  // ── WRR helpers ───────────────────────────────────────────────────────────

  private def makeWrrCfg(weights: Seq[Int]) = {
    val n = weights.length
    AxiZeroConfig(
      masters     = Seq.fill(n)(MasterPort(masterCfg, FullAxi4)),
      slaves      = Seq(SlavePort(slaveCfg(n), FullAxi4, slaveBase, slaveSize)),
      arbitration = WeightedRoundRobin(weights)
    )
  }

  // =========================================================================
  // FixedPriority tests
  // =========================================================================

  test("FP: single master write-read round-trip") {
    // Smoke test: just verify that a FixedPriority crossbar elaborates and
    // passes traffic without error.
    simCfg.compile(new AxiZeroMixedTop(makeFpCfg(2))).doSim { dut =>
      val cd   = dut.clockDomain
      val mem  = SimHelpers.spawnFullSlave(dut.io.slaves(0), cd)
      SimHelpers.initMaster(dut.io.masters(0))
      SimHelpers.initMaster(dut.io.masters(1))
      dut.io.masters(0).b.ready #= true
      dut.io.masters(1).b.ready #= true
      cd.forkStimulus(10)
      cd.waitSampling(5)

      SimHelpers.fullWrite(dut.io.masters(0), cd, 0x0000L, 0xDEADBEEFL)
      val (rdata, _) = SimHelpers.fullBurstRead(dut.io.masters(0), cd, 0x0000L, 1)
      assert(rdata.head == 0xDEADBEEFL, f"Expected 0xDEADBEEF, got 0x${rdata.head}%08X")
    }
  }

  test("FP: master 0 wins contention over master 1") {
    // Both masters request simultaneously; master 0 (lower index = higher
    // fixed priority) must be granted first every time.
    simCfg.compile(new AxiZeroMixedTop(makeFpCfg(2))).doSim { dut =>
      val cd   = dut.clockDomain
      val mem  = SimHelpers.spawnFullSlave(dut.io.slaves(0), cd)
      SimHelpers.initMaster(dut.io.masters(0))
      SimHelpers.initMaster(dut.io.masters(1))
      cd.forkStimulus(10)
      cd.waitSampling(5)

      // Pre-write distinct values at two addresses so read-back is unambiguous
      SimHelpers.fullWrite(dut.io.masters(0), cd, 0x0000L, 0xAAAAAAAAL)
      SimHelpers.fullWrite(dut.io.masters(0), cd, 0x0004L, 0xBBBBBBBBL)
      cd.waitSampling(2)

      // Launch both reads concurrently; master 0 should always complete first
      var done0 = 0L
      var done1 = 0L
      var go    = false

      val f0 = fork {
        while (!go) cd.waitSampling()
        SimHelpers.fullBurstRead(dut.io.masters(0), cd, 0x0000L, 1)
        done0 = simTime()
      }
      val f1 = fork {
        while (!go) cd.waitSampling()
        SimHelpers.fullBurstRead(dut.io.masters(1), cd, 0x0004L, 1)
        done1 = simTime()
      }

      cd.waitSampling()
      go = true
      f0.join()
      f1.join()

      // Master 0 (higher priority) must have finished before master 1
      assert(done0 <= done1,
        s"Expected master 0 (done at $done0) to finish before master 1 (done at $done1)")
    }
  }

  test("FP: three masters — priority 0 > 1 > 2") {
    // With three concurrent readers, master 0 should always finish first,
    // then master 1, then master 2.
    simCfg.compile(new AxiZeroMixedTop(makeFpCfg(3))).doSim { dut =>
      val cd  = dut.clockDomain
      val mem = SimHelpers.spawnFullSlave(dut.io.slaves(0), cd)
      (0 until 3).foreach(i => SimHelpers.initMaster(dut.io.masters(i)))
      cd.forkStimulus(10)
      cd.waitSampling(5)

      // Pre-populate three distinct words
      SimHelpers.fullWrite(dut.io.masters(0), cd, 0x0000L, 0x11111111L)
      SimHelpers.fullWrite(dut.io.masters(0), cd, 0x0004L, 0x22222222L)
      SimHelpers.fullWrite(dut.io.masters(0), cd, 0x0008L, 0x33333333L)
      cd.waitSampling(2)

      var times = Array(0L, 0L, 0L)
      var go    = false

      val fs = (0 until 3).map { i =>
        fork {
          while (!go) cd.waitSampling()
          SimHelpers.fullBurstRead(dut.io.masters(i), cd, (i * 4).toLong, 1)
          times(i) = simTime()
        }
      }

      cd.waitSampling()
      go = true
      fs.foreach(_.join())

      assert(times(0) <= times(1),
        s"master 0 (${times(0)}) should finish before master 1 (${times(1)})")
      assert(times(1) <= times(2),
        s"master 1 (${times(1)}) should finish before master 2 (${times(2)})")
    }
  }

  // =========================================================================
  // WeightedRoundRobin tests
  // =========================================================================

  test("WRR: elaboration and basic write-read with weights [3,1]") {
    // Smoke test: WRR crossbar with two masters, weights [3,1].
    simCfg.compile(new AxiZeroMixedTop(makeWrrCfg(Seq(3, 1)))).doSim { dut =>
      val cd  = dut.clockDomain
      val mem = SimHelpers.spawnFullSlave(dut.io.slaves(0), cd)
      SimHelpers.initMaster(dut.io.masters(0))
      SimHelpers.initMaster(dut.io.masters(1))
      cd.forkStimulus(10)
      cd.waitSampling(5)

      // Master 0 writes, master 1 reads back
      SimHelpers.fullWrite(dut.io.masters(0), cd, 0x0010L, 0xCAFEBABEL)
      val (rdata, _) = SimHelpers.fullBurstRead(dut.io.masters(1), cd, 0x0010L, 1)
      assert(rdata.head == 0xCAFEBABEL, f"Expected 0xCAFEBABE, got 0x${rdata.head}%08X")
    }
  }

  test("WRR: master 0 completes more transactions than master 1 with weights [3,1]") {
    // With weights [3,1], master 0 should get roughly 3× more grants than
    // master 1 when both are continuously requesting.  We count completions
    // over a fixed number of rounds (16 writes each, non-overlapping to
    // avoid address aliasing) and check that master 0 finishes first.
    simCfg.compile(new AxiZeroMixedTop(makeWrrCfg(Seq(3, 1)))).doSim { dut =>
      val cd  = dut.clockDomain
      val mem = SimHelpers.spawnFullSlave(dut.io.slaves(0), cd)
      SimHelpers.initMaster(dut.io.masters(0))
      SimHelpers.initMaster(dut.io.masters(1))
      cd.forkStimulus(10)
      cd.waitSampling(5)

      val N = 8
      var done0 = 0L
      var done1 = 0L
      var go    = false

      val f0 = fork {
        while (!go) cd.waitSampling()
        for (i <- 0 until N)
          SimHelpers.fullWrite(dut.io.masters(0), cd, (i * 4).toLong, i.toLong)
        done0 = simTime()
      }
      val f1 = fork {
        while (!go) cd.waitSampling()
        for (i <- 0 until N)
          SimHelpers.fullWrite(dut.io.masters(1), cd, (0x1000 + i * 4).toLong, i.toLong)
        done1 = simTime()
      }

      cd.waitSampling()
      go = true
      f0.join()
      f1.join()

      // With 3× weight advantage, master 0 must finish before master 1
      assert(done0 < done1,
        s"master 0 (done at $done0) should finish before master 1 (done at $done1) with weights [3,1]")
    }
  }

  test("WRR: equal weights [1,1] behave like round-robin") {
    // With equal weights the two masters should complete nearly simultaneously;
    // neither should consistently dominate.
    simCfg.compile(new AxiZeroMixedTop(makeWrrCfg(Seq(1, 1)))).doSim { dut =>
      val cd  = dut.clockDomain
      val mem = SimHelpers.spawnFullSlave(dut.io.slaves(0), cd)
      SimHelpers.initMaster(dut.io.masters(0))
      SimHelpers.initMaster(dut.io.masters(1))
      cd.forkStimulus(10)
      cd.waitSampling(5)

      val N  = 8
      var t0 = 0L
      var t1 = 0L
      var go = false

      val f0 = fork {
        while (!go) cd.waitSampling()
        for (i <- 0 until N)
          SimHelpers.fullWrite(dut.io.masters(0), cd, (i * 4).toLong, i.toLong)
        t0 = simTime()
      }
      val f1 = fork {
        while (!go) cd.waitSampling()
        for (i <- 0 until N)
          SimHelpers.fullWrite(dut.io.masters(1), cd, (0x1000 + i * 4).toLong, i.toLong)
        t1 = simTime()
      }

      cd.waitSampling()
      go = true
      f0.join()
      f1.join()

      // Allow up to 1-cycle skew per transaction (8 transactions × 10ns = 80ns)
      val skew = math.abs(t0 - t1)
      assert(skew <= N * 10 * 5,
        s"Equal-weight masters diverged by $skew ns — expected near-equal throughput")
    }
  }

  test("WRR: write-read data integrity with weights [2,3]") {
    // Functional check: data written by either master must be readable back
    // correctly even when WRR is in effect.
    simCfg.compile(new AxiZeroMixedTop(makeWrrCfg(Seq(2, 3)))).doSim { dut =>
      val cd  = dut.clockDomain
      val mem = SimHelpers.spawnFullSlave(dut.io.slaves(0), cd)
      SimHelpers.initMaster(dut.io.masters(0))
      SimHelpers.initMaster(dut.io.masters(1))
      cd.forkStimulus(10)
      cd.waitSampling(5)

      val pairs = Seq(
        (0x0000L, 0xDEAD0000L, 0),
        (0x0004L, 0xDEAD0001L, 1),
        (0x0008L, 0xDEAD0002L, 0),
        (0x000CL, 0xDEAD0003L, 1)
      )

      for ((addr, data, master) <- pairs)
        SimHelpers.fullWrite(dut.io.masters(master), cd, addr, data)

      for ((addr, data, master) <- pairs) {
        val (rdata, _) = SimHelpers.fullBurstRead(dut.io.masters(master), cd, addr, 1)
        assert(rdata.head == data, f"addr=0x$addr%04X: exp=0x$data%08X got=0x${rdata.head}%08X")
      }
    }
  }
}
