// Copyright (c) 2026 Leonardo Capossio - bard0 design  hello@bard0.com
// SPDX-License-Identifier: MIT
package axizero.sim

import org.scalatest.funsuite.AnyFunSuite
import spinal.core._
import spinal.core.sim._
import spinal.lib.bus.amba4.axi.Axi4Config
import axizero._
import scala.collection.mutable

class QosStressShortSpec extends AnyFunSuite {

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

  private val masterCfg = Axi4Config(
    addressWidth = 32,
    dataWidth    = 32,
    idWidth      = 4,
    useQos       = true
  )

  // 4 masters => +2 bits on returned ID path
  private val slaveCfg = Axi4Config(
    addressWidth = 32,
    dataWidth    = 32,
    idWidth      = 6,
    useQos       = true
  )

  private def makeCfg = AxiZeroConfig(
    masters = Seq.fill(4)(MasterPort(masterCfg, FullAxi4)),
    slaves  = Seq(
      SlavePort(slaveCfg, FullAxi4, slave0Base, slaveSize),
      SlavePort(slaveCfg, FullAxi4, slave1Base, slaveSize)
    ),
    arbitration    = QosBased,
    maxOutstanding = 4
  )

  private def xorshift32(x: Int): Int = {
    var v = x
    v ^= (v << 13)
    v ^= (v >>> 17)
    v ^= (v << 5)
    v
  }

  test("qos stress short: 4 masters with distinct traffic, including random short bursts") {
    simCfg.compile(new AxiZeroMixedTop(makeCfg)).doSim { dut =>
      SimTimeout(300000)
      val cd = dut.clockDomain
      cd.forkStimulus(10)

      (0 until 4).foreach(i => SimHelpers.initMaster(dut.io.masters(i)))
      val mem0 = SimHelpers.spawnFullSlave(dut.io.slaves(0), cd, stallW = 1, stallR = 1)
      val mem1 = SimHelpers.spawnFullSlave(dut.io.slaves(1), cd, stallW = 2, stallR = 1)
      cd.waitSampling(8)

      var go = false
      val expM2 = mutable.HashMap[Long, Long]()
      val expM3 = mutable.HashMap[Long, Long]()

      val m0 = fork {
        while (!go) cd.waitSampling()
        val base = slave0Base.toLong + 0x0000L
        for (i <- 0 until 64) {
          SimHelpers.fullWrite(
            dut.io.masters(0), cd,
            addr = base + i * 4L,
            data = 0xA0000000L | i.toLong,
            id   = 1,
            qos  = 15
          )
        }
      }

      val m1 = fork {
        while (!go) cd.waitSampling()
        val base = slave0Base.toLong + 0x1000L
        for (i <- 0 until 64) {
          val rev = 63 - i
          SimHelpers.fullWrite(
            dut.io.masters(1), cd,
            addr = base + i * 4L,
            data = 0xB1000000L | rev.toLong,
            id   = 2,
            qos  = 8
          )
        }
      }

      // Random short bursts (len 1..4), confined to one BRAM1 window.
      val m2 = fork {
        while (!go) cd.waitSampling()
        var rng = 0x1234ABCD
        val base = slave1Base.toLong + 0x0000L
        for (burst <- 0 until 48) {
          rng = xorshift32(rng)
          val len = (rng & 0x3) + 1
          val startWordRaw = (rng >>> 8) & 0x3F
          val startWord = (startWordRaw / 4) * 4 // keep room for up to 4 beats
          val awAddr = base + startWord.toLong * 4L
          val beats = (0 until len).map { beat =>
            val d = 0xC2000000L | ((burst & 0xFF).toLong << 8) | beat.toLong
            expM2(awAddr + beat * 4L) = d
            d
          }
          SimHelpers.fullBurstWrite(dut.io.masters(2), cd, awAddr, beats, id = 3, qos = 4)
        }
        val sentinelAddr = base + 0x03FCL
        val sentinelData = 0xD00D0000L
        expM2(sentinelAddr) = sentinelData
        SimHelpers.fullWrite(dut.io.masters(2), cd, sentinelAddr, sentinelData, id = 3, qos = 4)
      }

      // Low-QoS sparse writes alternating slaves + occasional reads.
      val m3 = fork {
        while (!go) cd.waitSampling()
        for (i <- 0 until 32) {
          val toS0 = (i % 2) == 0
          val addr = if (toS0) slave0Base.toLong + 0x2000L + i * 4L
                     else      slave1Base.toLong + 0x2000L + i * 4L
          val data = 0xD3000000L | i.toLong
          expM3(addr) = data
          SimHelpers.fullWrite(dut.io.masters(3), cd, addr, data, id = 4, qos = 0)
          if ((i % 8) == 7) {
            val (rd, _) = SimHelpers.fullRead(dut.io.masters(3), cd, addr, id = 4, qos = 0)
            assert(rd == data, f"m3 immediate readback mismatch at 0x$addr%08x: got=0x$rd%08x exp=0x$data%08x")
          }
        }
      }

      cd.waitSampling()
      go = true
      m0.join()
      m1.join()
      m2.join()
      m3.join()
      cd.waitSampling(12)

      // Deterministic windows.
      val m0Base = slave0Base.toLong + 0x0000L
      for (i <- 0 until 64) {
        val a = m0Base + i * 4L
        val e = 0xA0000000L | i.toLong
        assert(mem0.getOrElse(a, -1L) == e, f"m0 region mismatch @0x$a%08x: got=0x${mem0.getOrElse(a, -1L)}%08x exp=0x$e%08x")
      }

      val m1Base = slave0Base.toLong + 0x1000L
      for (i <- 0 until 64) {
        val a = m1Base + i * 4L
        val e = 0xB1000000L | (63 - i).toLong
        assert(mem0.getOrElse(a, -1L) == e, f"m1 reverse region mismatch @0x$a%08x")
      }

      // Random burst region: check final image against software-side model.
      for ((addr, exp) <- expM2) {
        assert(mem1.getOrElse(addr, -1L) == exp, f"m2 random region mismatch @0x$addr%08x: got=0x${mem1.getOrElse(addr, -1L)}%08x exp=0x$exp%08x")
      }

      // Sparse low-QoS writes must all land.
      for ((addr, exp) <- expM3) {
        val got = if (addr >= slave1Base.toLong) mem1.getOrElse(addr, -1L) else mem0.getOrElse(addr, -1L)
        assert(got == exp, f"m3 sparse write mismatch @0x$addr%08x: got=0x$got%08x exp=0x$exp%08x")
      }

      // Cross-master read spot checks.
      val (chk0, _) = SimHelpers.fullRead(dut.io.masters(0), cd, slave1Base.toLong + 0x03FCL, id = 1, qos = 15)
      assert(chk0 == 0xD00D0000L, f"sentinel readback mismatch: got=0x$chk0%08x")
      val (chk1, _) = SimHelpers.fullRead(dut.io.masters(1), cd, slave0Base.toLong + 0x0000L, id = 2, qos = 8)
      assert(chk1 == 0xA0000000L, f"m1 readback mismatch from m0 region: got=0x$chk1%08x")
    }
  }
}
