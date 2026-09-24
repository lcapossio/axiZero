// Copyright (c) 2026 Leonardo Capossio
// SPDX-License-Identifier: MIT
package axizero.sim

import org.scalatest.funsuite.AnyFunSuite
import spinal.core._
import spinal.core.sim._
import spinal.lib.bus.amba4.axi.{Axi4, Axi4Config}
import axizero._

// ---------------------------------------------------------------------------
// LiteWidthPathsSpec — every place an AXI4-Lite port changes data width
//
// A Lite port can meet a fabric of another width four ways: as a narrow or a
// wide master, as a narrow or a wide slave, on the all-Lite fabric or on the
// mixed one. Each has to put data on the byte lanes its address selects, and
// each is easy to get wrong the same way -- zero-extend or truncate into the
// low lanes -- in a way that passes every test whose addresses happen to have
// their lane-select bits clear.
//
// That is how the narrow-master path on the all-Lite fabric was found wrong.
// These cover the rest, and every address is chosen so that a converter using
// the low lanes regardless would fail.
// ---------------------------------------------------------------------------
class LiteWidthPathsSpec extends AnyFunSuite {

  private val spinalCfg = SpinalConfig(
    defaultConfigForClockDomains = ClockDomainConfig(
      clockEdge = RISING,
      resetKind = SYNC,
      resetActiveLevel = LOW
    )
  )

  private def simCfg = SimConfig.withConfig(spinalCfg)

  private def lite(dw: Int) = Axi4Config(
    addressWidth = 32,
    dataWidth = dw,
    useId = false,
    useLen = false,
    useSize = false,
    useBurst = false,
    useLock = false,
    useCache = false,
    useQos = false,
    useRegion = false,
    useLast = false
  )

  /** Count the address handshakes a port sees -- to tell one write from a write split in two, and a
    * skipped chunk from one that went out.
    */
  private def countFires(s: Axi4, cd: ClockDomain): (() => Int, () => Int) = {
    var aw = 0
    var ar = 0
    fork {
      while (true) {
        cd.waitSampling()
        if (s.aw.valid.toBoolean && s.aw.ready.toBoolean) aw += 1
        if (s.ar.valid.toBoolean && s.ar.ready.toBoolean) ar += 1
      }
    }
    (() => aw, () => ar)
  }

  // =========================================================================
  // All-Lite fabric: a 32-bit master and a 16-bit slave
  // =========================================================================

  private def liteNarrowSlaveCfg = AxiZeroConfig(
    masters = Seq(MasterPort(lite(32), LiteAxi4)),
    slaves = Seq(SlavePort(lite(16), LiteAxi4, BigInt(0), BigInt(0x10000)))
  )

  test("Lite fabric, narrow slave: a full-width write reaches both halves") {
    simCfg.compile(new AxiZeroLiteTop(liteNarrowSlaveCfg)).doSim { dut =>
      val cd  = dut.clockDomain
      val mem = SimHelpers.spawnLiteSlave(dut.io.slaves(0), cd)
      SimHelpers.initMaster(dut.io.masters(0))
      cd.forkStimulus(10)
      cd.waitSampling(5)

      SimHelpers.liteWrite(dut.io.masters(0), cd, 0x0L, 0xaabbccddL, strb = 0xf)
      assert(mem.getOrElse(0x0L, -1L) == 0xccddL, f"low half: 0x${mem.getOrElse(0x0L, -1L)}%X")
      assert(mem.getOrElse(0x2L, -1L) == 0xaabbL, f"high half: 0x${mem.getOrElse(0x2L, -1L)}%X")

      val got = SimHelpers.liteRead(dut.io.masters(0), cd, 0x0L)
      assert(got == 0xaabbccddL, f"read back 0x$got%08X")
    }
  }

  test("Lite fabric, narrow slave: a strobed half goes out alone") {
    simCfg.compile(new AxiZeroLiteTop(liteNarrowSlaveCfg)).doSim { dut =>
      val cd       = dut.clockDomain
      val mem      = SimHelpers.spawnLiteSlave(dut.io.slaves(0), cd)
      val (aw, ar) = countFires(dut.io.slaves(0), cd)
      SimHelpers.initMaster(dut.io.masters(0))
      cd.forkStimulus(10)
      cd.waitSampling(5)

      // Only the upper half is strobed. A slave with write side effects -- a
      // FIFO, a clear-on-write flag -- must not see a write to the lower half.
      SimHelpers.liteWrite(dut.io.masters(0), cd, 0x0L, 0x12340000L, strb = 0xc)
      assert(aw() == 1, s"expected one narrow write, the slave saw ${aw()}")
      assert(mem.getOrElse(0x2L, -1L) == 0x1234L)
      assert(!mem.contains(0x0L), "the unstrobed half was written")

      // A read at 0x2 names the upper half and nothing below it.
      val got = SimHelpers.liteRead(dut.io.masters(0), cd, 0x2L)
      assert(ar() == 1, s"expected one narrow read, the slave saw ${ar()}")
      assert((got >> 16) == 0x1234L, f"upper lanes: 0x$got%08X")
    }
  }

  test("Lite fabric, narrow slave: the worst response of the halves comes back") {
    simCfg.compile(new AxiZeroLiteTop(liteNarrowSlaveCfg)).doSim { dut =>
      val cd = dut.clockDomain
      val s  = dut.io.slaves(0)
      SimHelpers.initSlave(s)
      SimHelpers.initMaster(dut.io.masters(0))

      // SLVERR for the low half, OKAY for the high one -- the error comes
      // first, so a converter that kept only the last response would lose it.
      fork {
        while (true) {
          s.aw.ready #= true
          while ({ cd.waitSampling(); !s.aw.valid.toBoolean }) {}
          val addr = s.aw.addr.toLong
          s.aw.ready #= false
          s.w.ready #= true
          while ({ cd.waitSampling(); !s.w.valid.toBoolean }) {}
          s.w.ready #= false
          s.b.valid #= true
          s.b.resp #= (if ((addr & 0x2L) == 0) 2 else 0)
          while ({ cd.waitSampling(); !s.b.ready.toBoolean }) {}
          s.b.valid #= false
        }
      }
      cd.forkStimulus(10)
      cd.waitSampling(5)

      val m = dut.io.masters(0)
      m.aw.valid #= true
      m.aw.addr #= 0
      m.w.valid #= true
      m.w.data #= 0x11112222L
      m.w.strb #= 0xf
      var awDone = false
      var wDone  = false
      while (!awDone || !wDone) {
        cd.waitSampling()
        if (!awDone && m.aw.ready.toBoolean) { awDone = true; m.aw.valid #= false }
        if (!wDone && m.w.ready.toBoolean) { wDone = true; m.w.valid #= false }
      }
      m.b.ready #= true
      while ({ cd.waitSampling(); !m.b.valid.toBoolean }) {}
      val resp = m.b.resp.toInt
      m.b.ready #= false
      assert(resp == 2, s"one half answered SLVERR, the master saw resp=$resp")
    }
  }

  // A fabric narrower than a master, which internalDataWidth allows: the
  // master side then has to split rather than widen.
  test("Lite fabric narrower than its master: a full-width write survives") {
    val cfg = AxiZeroConfig(
      masters = Seq(MasterPort(lite(32), LiteAxi4)),
      slaves = Seq(SlavePort(lite(16), LiteAxi4, BigInt(0), BigInt(0x10000))),
      internalDataWidth = Some(16)
    )
    simCfg.compile(new AxiZeroLiteTop(cfg)).doSim { dut =>
      val cd = dut.clockDomain
      SimHelpers.spawnLiteSlave(dut.io.slaves(0), cd)
      SimHelpers.initMaster(dut.io.masters(0))
      cd.forkStimulus(10)
      cd.waitSampling(5)

      SimHelpers.liteWrite(dut.io.masters(0), cd, 0x4L, 0x5a5a3c3cL)
      val got = SimHelpers.liteRead(dut.io.masters(0), cd, 0x4L)
      assert(got == 0x5a5a3c3cL, f"read back 0x$got%08X")
    }
  }

  // The crossbar carries the widest address of any port, so a slave with a
  // narrower address bus has to be joined to it with the address cut down --
  // which `<>` refused, so this did not elaborate at all.
  test("Lite fabric, slave with a 16-bit address bus: sees the low address bits") {
    val cfg = AxiZeroConfig(
      masters = Seq(MasterPort(lite(32), LiteAxi4)),
      slaves = Seq(
        SlavePort(lite(32), LiteAxi4, BigInt(0), BigInt(0x1000)),
        SlavePort(lite(32).copy(addressWidth = 16), LiteAxi4, BigInt(0x1000), BigInt(0x1000))
      )
    )
    simCfg.compile(new AxiZeroLiteTop(cfg)).doSim { dut =>
      val cd = dut.clockDomain
      SimHelpers.spawnLiteSlave(dut.io.slaves(0), cd)
      val mem = SimHelpers.spawnLiteSlave(dut.io.slaves(1), cd)
      SimHelpers.initMaster(dut.io.masters(0))
      cd.forkStimulus(10)
      cd.waitSampling(5)

      SimHelpers.liteWrite(dut.io.masters(0), cd, 0x1234L, 0xfeedc0deL)
      assert(mem.getOrElse(0x1234L, -1L) == 0xfeedc0deL, s"slave 1 memory: $mem")
      val got = SimHelpers.liteRead(dut.io.masters(0), cd, 0x1234L)
      assert(got == 0xfeedc0deL, f"read back 0x$got%08X")
    }
  }

  // =========================================================================
  // Mixed fabric at 64 bits: a 32-bit Lite master and a 32-bit Lite slave
  // =========================================================================

  private val full64 = Axi4Config(addressWidth = 32, dataWidth = 64, idWidth = 2)
  // slaveIdW = max master idWidth (2) + masterIndexBits (1).
  private val full64S  = Axi4Config(addressWidth = 32, dataWidth = 64, idWidth = 3)
  private val ramBase  = 0x00000000L
  private val liteBase = 0x00010000L

  private def mixedCfg = AxiZeroConfig(
    masters = Seq(MasterPort(full64, FullAxi4), MasterPort(lite(32), LiteAxi4)),
    slaves = Seq(
      SlavePort(full64S, FullAxi4, BigInt(ramBase), BigInt(0x10000)),
      SlavePort(lite(32), LiteAxi4, BigInt(liteBase), BigInt(0x10000))
    )
  )

  test("mixed fabric, narrow Lite master: each half of a wide word lands in its own lanes") {
    simCfg.compile(new AxiZeroMixedTop(mixedCfg)).doSim { dut =>
      val cd = dut.clockDomain
      SimHelpers.spawnFullSlave(dut.io.slaves(0), cd)
      SimHelpers.spawnLiteSlave(dut.io.slaves(1), cd)
      SimHelpers.initMaster(dut.io.masters(0))
      SimHelpers.initMaster(dut.io.masters(1))
      cd.forkStimulus(10)
      cd.waitSampling(5)

      val lm = dut.io.masters(1)
      SimHelpers.liteWrite(lm, cd, ramBase + 0x0L, 0x22222222L)
      SimHelpers.liteWrite(lm, cd, ramBase + 0x4L, 0x11111111L)

      // The 64-bit master sees one word with both halves where they belong.
      val (word, _) = SimHelpers.fullRead(dut.io.masters(0), cd, ramBase, id = 1)
      assert(word == 0x1111111122222222L, f"64-bit word: 0x$word%016X")

      // And the Lite master reads each half back off its own lanes.
      val hi = SimHelpers.liteRead(lm, cd, ramBase + 0x4L)
      val lo = SimHelpers.liteRead(lm, cd, ramBase + 0x0L)
      assert(hi == 0x11111111L, f"upper half: 0x$hi%08X")
      assert(lo == 0x22222222L, f"lower half: 0x$lo%08X")
    }
  }

  test("mixed fabric, narrow Lite slave: a 64-bit write from a full master reaches both halves") {
    simCfg.compile(new AxiZeroMixedTop(mixedCfg)).doSim { dut =>
      val cd  = dut.clockDomain
      val mem = SimHelpers.spawnLiteSlave(dut.io.slaves(1), cd)
      SimHelpers.spawnFullSlave(dut.io.slaves(0), cd)
      SimHelpers.initMaster(dut.io.masters(0))
      SimHelpers.initMaster(dut.io.masters(1))
      cd.forkStimulus(10)
      cd.waitSampling(5)

      val fm = dut.io.masters(0)
      SimHelpers.fullWrite(fm, cd, liteBase, 0x1122334455667788L, id = 1, strb = 0xff)
      val lo = mem.getOrElse(liteBase, -1L)
      val hi = mem.getOrElse(liteBase + 4, -1L)
      assert(lo == 0x55667788L, f"low half: 0x$lo%X")
      assert(hi == 0x11223344L, f"high half: 0x$hi%X")

      val (word, rid) = SimHelpers.fullRead(fm, cd, liteBase, id = 1)
      assert(word == 0x1122334455667788L, f"64-bit read back: 0x$word%016X")
      assert(rid == 1)
    }
  }
}
