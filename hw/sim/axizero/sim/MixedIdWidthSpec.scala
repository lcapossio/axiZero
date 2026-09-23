// Copyright (c) 2026 Leonardo Capossio
// SPDX-License-Identifier: MIT
package axizero.sim

import org.scalatest.funsuite.AnyFunSuite
import spinal.core._
import spinal.core.sim._
import spinal.lib.bus.amba4.axi.Axi4Config
import axizero._

// ---------------------------------------------------------------------------
// MixedIdWidthSpec — masters that declare different numbers of IDs
//
// The fabric carries the widest master's ID width, so a master that declares
// fewer has its requests zero-extended on the way out and the padding dropped
// on the way back, by Axi4IdWidener (AxiZeroTop, master-side wiring).
//
// Until this suite no root test built such a configuration: every test here
// gave all its masters the same idWidth, so the widener was never elaborated
// and the coverage report showed the file at 0%. The only exercise it had was
// through the VexRiscv example SoC, which is a separate sbt project -- so a
// checkout that never built that example had nothing covering this path.
//
// What can go wrong is narrow: the padding is constant zero on the way out, so
// the truncation back is only exact if the fabric returns the same zeros. A
// widener that padded the wrong end, or truncated the wrong end, would send a
// response to the wrong master ID or drop it -- which is why every test here
// checks the returned ID and not just the data.
// ---------------------------------------------------------------------------
class MixedIdWidthSpec extends AnyFunSuite {

  private val spinalCfg = SpinalConfig(
    defaultConfigForClockDomains = ClockDomainConfig(
      clockEdge = RISING,
      resetKind = SYNC,
      resetActiveLevel = LOW
    )
  )

  private def simCfg = SimConfig.withConfig(spinalCfg)

  private val slaveBase = BigInt("00000000", 16)
  private val slaveSize = BigInt("00010000", 16)

  // Master 0 declares four IDs, master 1 only one. The fabric carries two ID
  // bits, so master 1's port is one bit narrow and crosses the widener; master
  // 0's matches the fabric and does not.
  private val wideIdMaster   = Axi4Config(addressWidth = 32, dataWidth = 32, idWidth = 2)
  private val narrowIdMaster = Axi4Config(addressWidth = 32, dataWidth = 32, idWidth = 1)
  // slaveIdW = max master idWidth (2) + masterIndexBits (1), per AxiZeroMixedTop.
  private val slaveCfg = Axi4Config(addressWidth = 32, dataWidth = 32, idWidth = 3)

  private def mixedIdCfg = AxiZeroConfig(
    masters = Seq(MasterPort(wideIdMaster, FullAxi4), MasterPort(narrowIdMaster, FullAxi4)),
    slaves = Seq(SlavePort(slaveCfg, FullAxi4, slaveBase, slaveSize))
  )

  test("mixed ID widths: the narrow-ID master round-trips both of its IDs") {
    simCfg.compile(new AxiZeroMixedTop(mixedIdCfg)).doSim { dut =>
      val cd = dut.clockDomain
      SimHelpers.spawnFullSlave(dut.io.slaves(0), cd)
      SimHelpers.initMaster(dut.io.masters(0))
      SimHelpers.initMaster(dut.io.masters(1))
      cd.forkStimulus(10)
      cd.waitSampling(5)

      // Every ID a 1-bit port can drive, so the padding is exercised with the
      // low bit both clear and set.
      for (id <- 0 to 1) {
        val addr = 0x100L + id * 0x10L
        val data = 0xd0000000L | id.toLong
        SimHelpers.fullWrite(dut.io.masters(1), cd, addr, data, id = id)
        val (rdata, rid) = SimHelpers.fullBurstRead(dut.io.masters(1), cd, addr, 1, id = id)
        assert(rdata.head == data, f"narrow-ID master id=$id: got 0x${rdata.head}%08X")
        assert(rid == id, s"narrow-ID master: response came back as id=$rid, asked for $id")
      }
    }
  }

  test("mixed ID widths: both masters run together without crossing IDs") {
    simCfg.compile(new AxiZeroMixedTop(mixedIdCfg)).doSim { dut =>
      val cd = dut.clockDomain
      SimHelpers.spawnFullSlave(dut.io.slaves(0), cd)
      SimHelpers.initMaster(dut.io.masters(0))
      SimHelpers.initMaster(dut.io.masters(1))
      cd.forkStimulus(10)
      cd.waitSampling(5)

      // The wide-ID master uses id 3, which the narrow port cannot express at
      // all; if the widener padded the wrong end, the narrow master's id 1
      // would arrive looking like it.
      SimHelpers.fullWrite(dut.io.masters(0), cd, 0x200L, 0xaaaa0003L, id = 3)
      SimHelpers.fullWrite(dut.io.masters(1), cd, 0x300L, 0xbbbb0001L, id = 1)

      val (d0, i0) = SimHelpers.fullBurstRead(dut.io.masters(0), cd, 0x200L, 1, id = 3)
      val (d1, i1) = SimHelpers.fullBurstRead(dut.io.masters(1), cd, 0x300L, 1, id = 1)

      assert(d0.head == 0xaaaa0003L, f"wide-ID master: got 0x${d0.head}%08X")
      assert(i0 == 3, s"wide-ID master: response id=$i0, expected 3")
      assert(d1.head == 0xbbbb0001L, f"narrow-ID master: got 0x${d1.head}%08X")
      assert(i1 == 1, s"narrow-ID master: response id=$i1, expected 1")
    }
  }
}
