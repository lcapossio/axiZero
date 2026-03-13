// Copyright (c) 2026 Leonardo Capossio — bard0 design  hello@bard0.com
// SPDX-License-Identifier: MIT
package axizero.sim

import org.scalatest.funsuite.AnyFunSuite
import spinal.core._
import spinal.core.sim._
import spinal.lib.bus.amba4.axi.Axi4Config
import axizero._

class QosCrossbarSpec extends AnyFunSuite {

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

  private val masterCfg = Axi4Config(
    addressWidth = 32,
    dataWidth    = 32,
    idWidth      = 4,
    useQos       = true
  )

  private val slaveCfg = Axi4Config(
    addressWidth = 32,
    dataWidth    = 32,
    idWidth      = 5,
    useQos       = true
  )

  private def makeCfg(maxOutstanding: Int) = AxiZeroConfig(
    masters = Seq.fill(2)(MasterPort(masterCfg, FullAxi4)),
    slaves  = Seq(
      SlavePort(slaveCfg, FullAxi4, slaveBase, slaveSize)
    ),
    arbitration    = QosBased,
    maxOutstanding = maxOutstanding
  )

  private def concurrentWriteOrder(
    dut: AxiZeroMixedTop,
    qos0: Int,
    qos1: Int,
    addr0: Long,
    addr1: Long,
    data0: Long,
    data1: Long
  ): (Long, Long) = {
    val cd = dut.clockDomain
    var go = false
    var done0 = 0L
    var done1 = 0L

    val f0 = fork {
      while (!go) cd.waitSampling()
      SimHelpers.fullWrite(dut.io.masters(0), cd, addr0, data0, id = 1, qos = qos0)
      done0 = simTime()
    }
    val f1 = fork {
      while (!go) cd.waitSampling()
      SimHelpers.fullWrite(dut.io.masters(1), cd, addr1, data1, id = 2, qos = qos1)
      done1 = simTime()
    }

    cd.waitSampling()
    go = true
    f0.join()
    f1.join()
    (done0, done1)
  }

  test("qos: higher AWQOS wins in blocking mode") {
    simCfg.compile(new AxiZeroMixedTop(makeCfg(maxOutstanding = 1))).doSim { dut =>
      val cd = dut.clockDomain
      cd.forkStimulus(10)

      SimHelpers.initMaster(dut.io.masters(0))
      SimHelpers.initMaster(dut.io.masters(1))
      val mem = SimHelpers.spawnFullSlave(dut.io.slaves(0), cd)
      cd.waitSampling(5)

      val (done0, done1) = concurrentWriteOrder(
        dut,
        qos0  = 1,
        qos1  = 12,
        addr0 = slaveBase.toLong + 0x100L,
        addr1 = slaveBase.toLong + 0x104L,
        data0 = 0x11111111L,
        data1 = 0x22222222L
      )

      assert(done1 < done0, s"higher QoS master should complete first: done0=$done0 done1=$done1")
      assert(mem.getOrElse(slaveBase.toLong + 0x100L, -1L) == 0x11111111L)
      assert(mem.getOrElse(slaveBase.toLong + 0x104L, -1L) == 0x22222222L)
    }
  }

  test("qos: higher AWQOS wins in pipelined mode") {
    simCfg.compile(new AxiZeroMixedTop(makeCfg(maxOutstanding = 4))).doSim { dut =>
      val cd = dut.clockDomain
      cd.forkStimulus(10)

      SimHelpers.initMaster(dut.io.masters(0))
      SimHelpers.initMaster(dut.io.masters(1))
      val mem = SimHelpers.spawnFullSlave(dut.io.slaves(0), cd)
      cd.waitSampling(5)

      val (done0, done1) = concurrentWriteOrder(
        dut,
        qos0  = 2,
        qos1  = 15,
        addr0 = slaveBase.toLong + 0x200L,
        addr1 = slaveBase.toLong + 0x204L,
        data0 = 0x33333333L,
        data1 = 0x44444444L
      )

      assert(done1 < done0, s"higher QoS master should complete first: done0=$done0 done1=$done1")
      assert(mem.getOrElse(slaveBase.toLong + 0x200L, -1L) == 0x33333333L)
      assert(mem.getOrElse(slaveBase.toLong + 0x204L, -1L) == 0x44444444L)
    }
  }

  test("qos: equal QoS uses round-robin tie-break") {
    simCfg.compile(new AxiZeroMixedTop(makeCfg(maxOutstanding = 1))).doSim { dut =>
      val cd = dut.clockDomain
      cd.forkStimulus(10)

      SimHelpers.initMaster(dut.io.masters(0))
      SimHelpers.initMaster(dut.io.masters(1))
      SimHelpers.spawnFullSlave(dut.io.slaves(0), cd)
      cd.waitSampling(5)

      // Round 1: rrPtr starts at 0 → master 0 wins, then master 1 → rrPtr wraps to 0
      val (r1Done0, r1Done1) = concurrentWriteOrder(
        dut,
        qos0  = 7,
        qos1  = 7,
        addr0 = slaveBase.toLong + 0x300L,
        addr1 = slaveBase.toLong + 0x304L,
        data0 = 0xAAAA0001L,
        data1 = 0xBBBB0001L
      )
      // Round 2: rrPtr is back at 0 (wrapped after both masters served) → master 0 wins again
      val (r2Done0, r2Done1) = concurrentWriteOrder(
        dut,
        qos0  = 7,
        qos1  = 7,
        addr0 = slaveBase.toLong + 0x308L,
        addr1 = slaveBase.toLong + 0x30CL,
        data0 = 0xAAAA0002L,
        data1 = 0xBBBB0002L
      )

      // With 2 masters in blocking mode, each round serves both masters sequentially.
      // The RR pointer wraps after serving both, so master 0 wins first in both rounds.
      assert(r1Done0 < r1Done1, s"round 1 should prefer master 0 from reset RR pointer: m0=$r1Done0 m1=$r1Done1")
      assert(r2Done0 < r2Done1, s"round 2: RR pointer wrapped to 0, master 0 wins first again: m0=$r2Done0 m1=$r2Done1")
    }
  }

  test("qos: higher ARQOS wins on read arbitration") {
    simCfg.compile(new AxiZeroMixedTop(makeCfg(maxOutstanding = 1))).doSim { dut =>
      val cd = dut.clockDomain
      cd.forkStimulus(10)

      SimHelpers.initMaster(dut.io.masters(0))
      SimHelpers.initMaster(dut.io.masters(1))
      val mem = SimHelpers.spawnFullSlave(dut.io.slaves(0), cd)
      mem(slaveBase.toLong + 0x400L) = 0xABCD0001L
      mem(slaveBase.toLong + 0x404L) = 0xABCD0002L
      cd.waitSampling(5)

      var go = false
      var done0 = 0L
      var done1 = 0L
      var rd0 = 0L
      var rd1 = 0L

      val f0 = fork {
        while (!go) cd.waitSampling()
        rd0 = SimHelpers.fullRead(dut.io.masters(0), cd, slaveBase.toLong + 0x400L, id = 3, qos = 1)._1
        done0 = simTime()
      }
      val f1 = fork {
        while (!go) cd.waitSampling()
        rd1 = SimHelpers.fullRead(dut.io.masters(1), cd, slaveBase.toLong + 0x404L, id = 4, qos = 13)._1
        done1 = simTime()
      }

      cd.waitSampling()
      go = true
      f0.join()
      f1.join()

      assert(done1 < done0, s"higher QoS read should complete first: done0=$done0 done1=$done1")
      assert(rd0 == 0xABCD0001L, f"master 0 read mismatch: 0x$rd0%08x")
      assert(rd1 == 0xABCD0002L, f"master 1 read mismatch: 0x$rd1%08x")
    }
  }

  test("qos: aging prevents starvation of low-QoS requester") {
    simCfg.compile(new AxiZeroMixedTop(makeCfg(maxOutstanding = 1))).doSim { dut =>
      val cd = dut.clockDomain
      cd.forkStimulus(10)

      SimHelpers.initMaster(dut.io.masters(0))
      SimHelpers.initMaster(dut.io.masters(1))
      val mem = SimHelpers.spawnFullSlave(dut.io.slaves(0), cd)
      cd.waitSampling(5)

      var go = false
      var doneHi = 0L
      var doneLo = 0L

      val hi = fork {
        while (!go) cd.waitSampling()
        for (i <- 0 until 24) {
          SimHelpers.fullWrite(
            dut.io.masters(0), cd,
            addr = slaveBase.toLong + (i * 4).toLong,
            data = 0xF0000000L | i,
            id   = 1,
            qos  = 15
          )
        }
        doneHi = simTime()
      }

      val lo = fork {
        while (!go) cd.waitSampling()
        SimHelpers.fullWrite(
          dut.io.masters(1), cd,
          addr = slaveBase.toLong + 0x1000L,
          data = 0x0BADF00DL,
          id   = 2,
          qos  = 0
        )
        doneLo = simTime()
      }

      cd.waitSampling()
      go = true
      hi.join()
      lo.join()

      assert(doneLo < doneHi, s"low-QoS transaction should complete before high-QoS stream ends: lo=$doneLo hi=$doneHi")
      assert(mem.getOrElse(slaveBase.toLong + 0x1000L, -1L) == 0x0BADF00DL)
    }
  }
}
