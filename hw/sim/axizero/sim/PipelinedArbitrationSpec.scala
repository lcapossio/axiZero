// Copyright (c) 2026 Leonardo Capossio
// SPDX-License-Identifier: MIT
package axizero.sim

import org.scalatest.funsuite.AnyFunSuite
import spinal.core._
import spinal.core.sim._
import spinal.lib.bus.amba4.axi.Axi4Config
import axizero._

// ---------------------------------------------------------------------------
// PipelinedArbitrationSpec — exercises FixedPriority, WRR, and QosBased
// arbitration through the PIPELINED datapath (maxOutstanding > 1).
//
// The existing PipelinedCrossbarSpec only tests RoundRobin; this spec
// covers the remaining arbitration modes in the pipelined code path.
//
// Topology: 2 full-AXI4 masters, 2 full-AXI4 slaves, maxOutstanding=4.
// ---------------------------------------------------------------------------
class PipelinedArbitrationSpec extends AnyFunSuite {

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

  private val masterCfg = Axi4Config(addressWidth = 32, dataWidth = 32, idWidth = 4, useQos = true)
  private val slaveCfg  = Axi4Config(addressWidth = 32, dataWidth = 32, idWidth = 5, useQos = true)

  private def makeCfg(arb: ArbitrationPolicy) = AxiZeroConfig(
    masters = Seq.fill(2)(MasterPort(masterCfg, FullAxi4)),
    slaves  = Seq(
      SlavePort(slaveCfg, FullAxi4, slave0Base, slaveSize),
      SlavePort(slaveCfg, FullAxi4, slave1Base, slaveSize)
    ),
    arbitration    = arb,
    maxOutstanding = 4
  )

  // =========================================================================
  // FixedPriority — pipelined
  // =========================================================================

  test("pipelined FP: basic write-read round-trip") {
    simCfg.compile(new AxiZeroMixedTop(makeCfg(FixedPriority))).doSim { dut =>
      val cd = dut.clockDomain
      cd.forkStimulus(10)
      SimHelpers.initMaster(dut.io.masters(0))
      SimHelpers.initMaster(dut.io.masters(1))
      SimHelpers.spawnFullSlave(dut.io.slaves(0), cd)
      SimHelpers.spawnFullSlave(dut.io.slaves(1), cd)
      cd.waitSampling(5)

      SimHelpers.fullWrite(dut.io.masters(0), cd, 0x0000L, 0xDEADBEEFL, id = 1)
      val (rdata, rid) = SimHelpers.fullBurstRead(dut.io.masters(0), cd, 0x0000L, 1, id = 2)
      assert(rdata.head == 0xDEADBEEFL, f"FP pipelined: got 0x${rdata.head}%08X")
      assert(rid == 2)
    }
  }

  test("pipelined FP: master 0 wins contention") {
    simCfg.compile(new AxiZeroMixedTop(makeCfg(FixedPriority))).doSim { dut =>
      val cd = dut.clockDomain
      cd.forkStimulus(10)
      SimHelpers.initMaster(dut.io.masters(0))
      SimHelpers.initMaster(dut.io.masters(1))
      SimHelpers.spawnFullSlave(dut.io.slaves(0), cd)
      SimHelpers.spawnFullSlave(dut.io.slaves(1), cd)
      cd.waitSampling(5)

      SimHelpers.fullWrite(dut.io.masters(0), cd, 0x0000L, 0xAAAAAAAAL)
      cd.waitSampling(2)

      var done0 = 0L; var done1 = 0L; var go = false
      val f0 = fork {
        while (!go) cd.waitSampling()
        SimHelpers.fullBurstRead(dut.io.masters(0), cd, 0x0000L, 1, id = 0)
        done0 = simTime()
      }
      val f1 = fork {
        while (!go) cd.waitSampling()
        SimHelpers.fullBurstRead(dut.io.masters(1), cd, 0x0000L, 1, id = 0)
        done1 = simTime()
      }
      cd.waitSampling(); go = true; f0.join(); f1.join()
      assert(done0 <= done1, s"FP pipelined: master 0 ($done0) should finish before master 1 ($done1)")
    }
  }

  test("pipelined FP: concurrent 4-beat bursts to different slaves") {
    simCfg.compile(new AxiZeroMixedTop(makeCfg(FixedPriority))).doSim { dut =>
      val cd = dut.clockDomain
      cd.forkStimulus(10)
      SimHelpers.initMaster(dut.io.masters(0))
      SimHelpers.initMaster(dut.io.masters(1))
      val mem0 = SimHelpers.spawnFullSlave(dut.io.slaves(0), cd)
      val mem1 = SimHelpers.spawnFullSlave(dut.io.slaves(1), cd)
      cd.waitSampling(5)

      val data0 = (0 until 4).map(i => 0xAA000000L | i.toLong)
      val data1 = (0 until 4).map(i => 0xBB000000L | i.toLong)

      val f0 = fork { SimHelpers.fullBurstWrite(dut.io.masters(0), cd, 0x0100L, data0, id = 3) }
      val f1 = fork { SimHelpers.fullBurstWrite(dut.io.masters(1), cd, slave1Base.toLong + 0x0100L, data1, id = 4) }
      f0.join(); f1.join()

      val (rd0, _) = SimHelpers.fullBurstRead(dut.io.masters(0), cd, 0x0100L, 4, id = 5)
      val (rd1, _) = SimHelpers.fullBurstRead(dut.io.masters(1), cd, slave1Base.toLong + 0x0100L, 4, id = 6)
      assert(rd0 == data0, "FP pipelined: slave 0 data mismatch")
      assert(rd1 == data1, "FP pipelined: slave 1 data mismatch")
    }
  }

  // =========================================================================
  // WeightedRoundRobin — pipelined
  // =========================================================================

  test("pipelined WRR: basic write-read with weights [3,1]") {
    simCfg.compile(new AxiZeroMixedTop(makeCfg(WeightedRoundRobin(Seq(3, 1))))).doSim { dut =>
      val cd = dut.clockDomain
      cd.forkStimulus(10)
      SimHelpers.initMaster(dut.io.masters(0))
      SimHelpers.initMaster(dut.io.masters(1))
      SimHelpers.spawnFullSlave(dut.io.slaves(0), cd)
      SimHelpers.spawnFullSlave(dut.io.slaves(1), cd)
      cd.waitSampling(5)

      SimHelpers.fullWrite(dut.io.masters(1), cd, 0x0020L, 0x12345678L, id = 1)
      val (rdata, _) = SimHelpers.fullBurstRead(dut.io.masters(1), cd, 0x0020L, 1, id = 2)
      assert(rdata.head == 0x12345678L, f"WRR pipelined: got 0x${rdata.head}%08X")
    }
  }

  test("pipelined WRR: master 0 (weight 3) finishes before master 1 (weight 1)") {
    simCfg.compile(new AxiZeroMixedTop(makeCfg(WeightedRoundRobin(Seq(3, 1))))).doSim { dut =>
      val cd = dut.clockDomain
      cd.forkStimulus(10)
      SimHelpers.initMaster(dut.io.masters(0))
      SimHelpers.initMaster(dut.io.masters(1))
      SimHelpers.spawnFullSlave(dut.io.slaves(0), cd)
      SimHelpers.spawnFullSlave(dut.io.slaves(1), cd)
      cd.waitSampling(5)

      val N = 8
      var done0 = 0L; var done1 = 0L; var go = false
      val f0 = fork {
        while (!go) cd.waitSampling()
        for (i <- 0 until N) SimHelpers.fullWrite(dut.io.masters(0), cd, (i * 4).toLong, i.toLong, id = 0)
        done0 = simTime()
      }
      val f1 = fork {
        while (!go) cd.waitSampling()
        for (i <- 0 until N) SimHelpers.fullWrite(dut.io.masters(1), cd, (0x1000 + i * 4).toLong, i.toLong, id = 0)
        done1 = simTime()
      }
      cd.waitSampling(); go = true; f0.join(); f1.join()
      assert(done0 < done1, s"WRR pipelined: master 0 ($done0) should finish before master 1 ($done1)")
    }
  }

  test("pipelined WRR: data integrity with concurrent 4-beat bursts") {
    simCfg.compile(new AxiZeroMixedTop(makeCfg(WeightedRoundRobin(Seq(2, 3))))).doSim { dut =>
      val cd = dut.clockDomain
      cd.forkStimulus(10)
      SimHelpers.initMaster(dut.io.masters(0))
      SimHelpers.initMaster(dut.io.masters(1))
      SimHelpers.spawnFullSlave(dut.io.slaves(0), cd)
      SimHelpers.spawnFullSlave(dut.io.slaves(1), cd)
      cd.waitSampling(5)

      val data0 = (0 until 4).map(i => 0xCC000000L | i.toLong)
      val data1 = (0 until 4).map(i => 0xDD000000L | i.toLong)

      val f0 = fork { SimHelpers.fullBurstWrite(dut.io.masters(0), cd, 0x0200L, data0, id = 1) }
      val f1 = fork { SimHelpers.fullBurstWrite(dut.io.masters(1), cd, slave1Base.toLong + 0x0200L, data1, id = 2) }
      f0.join(); f1.join()

      val (rd0, _) = SimHelpers.fullBurstRead(dut.io.masters(0), cd, 0x0200L, 4, id = 3)
      val (rd1, _) = SimHelpers.fullBurstRead(dut.io.masters(1), cd, slave1Base.toLong + 0x0200L, 4, id = 4)
      assert(rd0 == data0, "WRR pipelined: slave 0 data mismatch")
      assert(rd1 == data1, "WRR pipelined: slave 1 data mismatch")
    }
  }

  // =========================================================================
  // QosBased — pipelined
  // =========================================================================

  test("pipelined QoS: higher QoS wins contention") {
    simCfg.compile(new AxiZeroMixedTop(makeCfg(QosBased))).doSim { dut =>
      val cd = dut.clockDomain
      cd.forkStimulus(10)
      SimHelpers.initMaster(dut.io.masters(0))
      SimHelpers.initMaster(dut.io.masters(1))
      SimHelpers.spawnFullSlave(dut.io.slaves(0), cd)
      SimHelpers.spawnFullSlave(dut.io.slaves(1), cd)
      cd.waitSampling(5)

      SimHelpers.fullWrite(dut.io.masters(0), cd, 0x0000L, 0xAAAAAAAAL, id = 0)
      cd.waitSampling(2)

      // Master 0 with QoS=2, master 1 with QoS=15 — master 1 should win
      var done0 = 0L; var done1 = 0L; var go = false
      val f0 = fork {
        while (!go) cd.waitSampling()
        SimHelpers.fullWrite(dut.io.masters(0), cd, 0x0010L, 0x11111111L, id = 1, qos = 2)
        done0 = simTime()
      }
      val f1 = fork {
        while (!go) cd.waitSampling()
        SimHelpers.fullWrite(dut.io.masters(1), cd, 0x0020L, 0x22222222L, id = 2, qos = 15)
        done1 = simTime()
      }
      cd.waitSampling(); go = true; f0.join(); f1.join()
      assert(done1 <= done0,
        s"QoS pipelined: master 1 (QoS=15, done $done1) should finish before master 0 (QoS=2, done $done0)")
    }
  }

  test("pipelined QoS: read arbitration with QoS priority") {
    simCfg.compile(new AxiZeroMixedTop(makeCfg(QosBased))).doSim { dut =>
      val cd = dut.clockDomain
      cd.forkStimulus(10)
      SimHelpers.initMaster(dut.io.masters(0))
      SimHelpers.initMaster(dut.io.masters(1))
      SimHelpers.spawnFullSlave(dut.io.slaves(0), cd)
      SimHelpers.spawnFullSlave(dut.io.slaves(1), cd)
      cd.waitSampling(5)

      // Pre-populate
      SimHelpers.fullWrite(dut.io.masters(0), cd, 0x0000L, 0xCAFEBABEL, id = 0)
      cd.waitSampling(2)

      // Master 0 low QoS read, master 1 high QoS read — both to slave 0
      var done0 = 0L; var done1 = 0L; var go = false
      val f0 = fork {
        while (!go) cd.waitSampling()
        SimHelpers.fullBurstRead(dut.io.masters(0), cd, 0x0000L, 1, id = 3, qos = 1)
        done0 = simTime()
      }
      val f1 = fork {
        while (!go) cd.waitSampling()
        SimHelpers.fullBurstRead(dut.io.masters(1), cd, 0x0000L, 1, id = 4, qos = 14)
        done1 = simTime()
      }
      cd.waitSampling(); go = true; f0.join(); f1.join()
      assert(done1 <= done0,
        s"QoS pipelined read: master 1 (QoS=14, done $done1) should finish before master 0 (QoS=1, done $done0)")
    }
  }

  test("pipelined QoS: data integrity under concurrent traffic") {
    simCfg.compile(new AxiZeroMixedTop(makeCfg(QosBased))).doSim { dut =>
      val cd = dut.clockDomain
      cd.forkStimulus(10)
      SimHelpers.initMaster(dut.io.masters(0))
      SimHelpers.initMaster(dut.io.masters(1))
      SimHelpers.spawnFullSlave(dut.io.slaves(0), cd)
      SimHelpers.spawnFullSlave(dut.io.slaves(1), cd)
      cd.waitSampling(5)

      // Both masters write 4 values with different QoS to same slave
      val N = 4
      var go = false
      val f0 = fork {
        while (!go) cd.waitSampling()
        for (i <- 0 until N)
          SimHelpers.fullWrite(dut.io.masters(0), cd, (i * 4).toLong, (0xAA000000L | i), id = 0, qos = 5)
      }
      val f1 = fork {
        while (!go) cd.waitSampling()
        for (i <- 0 until N)
          SimHelpers.fullWrite(dut.io.masters(1), cd, (0x1000 + i * 4).toLong, (0xBB000000L | i), id = 0, qos = 12)
      }
      cd.waitSampling(); go = true; f0.join(); f1.join()

      // Both sets must be readable
      for (i <- 0 until N) {
        val (r0, _) = SimHelpers.fullBurstRead(dut.io.masters(0), cd, (i * 4).toLong, 1, id = 0)
        assert(r0.head == (0xAA000000L | i), f"QoS data integrity m0[$i]: got 0x${r0.head}%08X")
      }
      for (i <- 0 until N) {
        val (r1, _) = SimHelpers.fullBurstRead(dut.io.masters(1), cd, (0x1000 + i * 4).toLong, 1, id = 0)
        assert(r1.head == (0xBB000000L | i), f"QoS data integrity m1[$i]: got 0x${r1.head}%08X")
      }
    }
  }
}
