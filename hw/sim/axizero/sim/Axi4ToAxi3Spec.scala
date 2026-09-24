// Copyright (c) 2026 Leonardo Capossio
// SPDX-License-Identifier: MIT
package axizero.sim

import org.scalatest.funsuite.AnyFunSuite
import spinal.core._
import spinal.core.sim._
import spinal.lib._
import spinal.lib.bus.amba4.axi._
import axizero.adapters._

// ---------------------------------------------------------------------------
// Axi4ToAxi3Spec — the AXI4-to-AXI3 shim that puts a real AXI3 master in
// front of Axi3ToAxi4Adapter
//
// The shim is what VexZeroSoc relies on to turn a CPU into an AXI3 master,
// and it was tested there alone -- through a CPU that never sets an ID, LEN,
// BURST or LOCK. That is how it went unnoticed that it tied WID to zero, which
// hangs every write from a master that does use IDs. These check each field
// it maps, what it drives for a field the source does not have, that a burst
// survives the trip out to AXI3 and back through the adapter, and that WID
// names its own burst whether the data trails the address or leads it.
// ---------------------------------------------------------------------------
class Axi4ToAxi3Spec extends AnyFunSuite {

  private val spinalCfg = SpinalConfig(
    defaultConfigForClockDomains = ClockDomainConfig(
      clockEdge = RISING,
      resetKind = SYNC,
      resetActiveLevel = LOW
    )
  )

  private def simCfg = SimConfig.withConfig(spinalCfg)

  private val axi3Cfg = Axi3Config(addressWidth = 32, dataWidth = 32, idWidth = 4)

  /** Every field present, as a fully populated AXI4 master has them. */
  private val fullCfg = Axi4Config(
    addressWidth = 32,
    dataWidth = 32,
    idWidth = 4,
    useLock = true,
    useCache = true,
    useProt = true,
    useQos = true,
    useRegion = true
  )

  /** Only what VexRiscv's data bus carries: no ID, LEN, SIZE, BURST, LOCK, strobe or LAST. */
  private val bareCfg = Axi4Config(
    addressWidth = 32,
    dataWidth = 32,
    useId = false,
    useLen = false,
    useSize = false,
    useBurst = false,
    useLock = false,
    useCache = false,
    useProt = false,
    useQos = false,
    useRegion = false,
    useStrb = false,
    useLast = false
  )

  /** The shim alone, its AXI3 side exposed so each field can be looked at. */
  class Probe(srcCfg: Axi4Config) extends Component {
    val io = new Bundle {
      val src  = slave(Axi4(srcCfg))
      val axi3 = master(Axi3(axi3Cfg))
    }
    io.axi3 <> Axi4ToAxi3(io.src, axi3Cfg)
  }

  /** Out to AXI3 and back: the pairing VexZeroSoc builds. */
  class RoundTrip extends Component {
    val io = new Bundle {
      val src = slave(Axi4(fullCfg))
      val dst = master(Axi4(fullCfg))
    }
    val adapter = new Axi3ToAxi4Adapter(axi3Cfg, fullCfg, maxOutstanding = 4)
    adapter.io.axi3 <> Axi4ToAxi3(io.src, axi3Cfg)
    io.dst <> adapter.io.axi4
  }

  private def initAxi3Slave(s: Axi3): Unit = {
    s.aw.ready #= false
    s.w.ready #= false
    s.ar.ready #= false
    s.b.valid #= false
    s.b.id #= 0
    s.b.resp #= 0
    s.r.valid #= false
    s.r.id #= 0
    s.r.data #= 0
    s.r.resp #= 0
    s.r.last #= false
  }

  private val fieldNames = Seq("id", "addr", "len", "size", "burst", "lock", "cache", "prot")

  // Axi3Aw and Axi3Ar are separate bundles with no common supertype, so each
  // is read out into the same list.
  private def awFields(a: Stream[Axi3Aw]): Seq[Long] = {
    val p = a.payload
    Seq(p.id, p.addr, p.len, p.size).map(_.toLong) ++ Seq(p.burst, p.lock, p.cache, p.prot)
      .map(_.toLong)
  }

  private def arFields(a: Stream[Axi3Ar]): Seq[Long] = {
    val p = a.payload
    Seq(p.id, p.addr, p.len, p.size).map(_.toLong) ++ Seq(p.burst, p.lock, p.cache, p.prot)
      .map(_.toLong)
  }

  test("every AXI4 field lands on its AXI3 counterpart, and back") {
    simCfg.compile(new Probe(fullCfg)).doSim { dut =>
      val m = dut.io.src
      val s = dut.io.axi3
      SimHelpers.initMaster(m)
      initAxi3Slave(s)
      // The shim holds state when the source has IDs, so it needs a reset.
      // Everything below is checked between two clock edges, before any
      // handshake it sets up has completed.
      dut.clockDomain.forkStimulus(10)
      dut.clockDomain.waitSampling(3)

      // AW and AR: every field distinct, so a swap between two would show.
      for (ax <- Seq(m.aw, m.ar)) {
        ax.valid #= true
        ax.id #= 0xb
        ax.addr #= 0x12345678L
        ax.len #= 0x0f
        ax.size #= 1
        ax.burst #= 2 // WRAP
        ax.lock #= 1  // exclusive
        ax.cache #= 0xa
        ax.prot #= 5
      }
      s.aw.ready #= true
      s.ar.ready #= true
      sleep(1)
      // AXI4 exclusive (1) is AXI3 01.
      val expected = Seq(0xbL, 0x12345678L, 0xfL, 1L, 2L, 1L, 0xaL, 5L)
      for ((name, got) <- Seq(("AW", awFields(s.aw)), ("AR", arFields(s.ar))))
        for (((f, g), e) <- fieldNames.zip(got).zip(expected))
          assert(g == e, f"$name.$f: got 0x$g%X, expected 0x$e%X")
      assert(s.aw.valid.toBoolean && m.aw.ready.toBoolean, "AW handshake")
      assert(s.ar.valid.toBoolean && m.ar.ready.toBoolean, "AR handshake")

      // W: data, strobe and LAST through; WID names the burst on offer.
      m.w.valid #= true
      m.w.data #= 0xcafef00dL
      m.w.strb #= 0x6
      m.w.last #= true
      s.w.ready #= true
      sleep(1)
      assert(s.w.valid.toBoolean && m.w.ready.toBoolean)
      assert(s.w.data.toLong == 0xcafef00dL)
      assert(s.w.strb.toInt == 0x6)
      assert(s.w.last.toBoolean)
      assert(s.w.id.toInt == 0xb, s"WID ${s.w.id.toInt}, expected the offered AWID 0xb")

      // B and R come back with ID, response, data and LAST intact.
      s.b.valid #= true
      s.b.id #= 0x9
      s.b.resp #= 2
      m.b.ready #= true
      s.r.valid #= true
      s.r.id #= 0x6
      s.r.data #= 0x0badbeefL
      s.r.resp #= 3
      s.r.last #= true
      m.r.ready #= true
      sleep(1)
      assert(m.b.valid.toBoolean && s.b.ready.toBoolean)
      assert(m.b.id.toInt == 0x9 && m.b.resp.toInt == 2)
      assert(m.r.valid.toBoolean && s.r.ready.toBoolean)
      assert(m.r.id.toInt == 0x6 && m.r.resp.toInt == 3)
      assert(m.r.data.toLong == 0x0badbeefL && m.r.last.toBoolean)
    }
  }

  test("a field the source lacks carries what a single-beat INCR transfer means") {
    simCfg.compile(new Probe(bareCfg)).doSim { dut =>
      val m = dut.io.src
      val s = dut.io.axi3
      SimHelpers.initMaster(m)
      initAxi3Slave(s)

      m.aw.valid #= true
      m.aw.addr #= 0x40L
      m.ar.valid #= true
      m.ar.addr #= 0x80L
      m.w.valid #= true
      m.w.data #= 0x11223344L
      sleep(1)
      // One beat, the full 4-byte word, INCR, and nothing else set.
      for ((name, got, addr) <- Seq(("AW", awFields(s.aw), 0x40L), ("AR", arFields(s.ar), 0x80L)))
        for (((f, g), e) <- fieldNames.zip(got).zip(Seq(0L, addr, 0L, 2L, 1L, 0L, 0L, 0L)))
          assert(g == e, f"$name.$f: got 0x$g%X, expected 0x$e%X")
      assert(s.w.strb.toInt == 0xf, "no strobe means every byte")
      assert(s.w.last.toBoolean, "no LAST means every beat is the last")
    }
  }

  test("with no ID, WID is zero") {
    simCfg.compile(new Probe(bareCfg)).doSim { dut =>
      SimHelpers.initMaster(dut.io.src)
      initAxi3Slave(dut.io.axi3)
      dut.io.src.w.valid #= true
      sleep(1)
      assert(dut.io.axi3.w.valid.toBoolean, "a master with no ID need not offer AW first")
      assert(dut.io.axi3.w.id.toInt == 0)
    }
  }

  test("a burst goes out as AXI3 and comes back through the adapter intact") {
    simCfg.compile(new RoundTrip).doSim { dut =>
      val cd = dut.clockDomain
      SimHelpers.spawnFullSlave(dut.io.dst, cd, stallW = 1, stallR = 1)
      SimHelpers.initMaster(dut.io.src)
      cd.forkStimulus(10)
      cd.waitSampling(5)

      val data = Seq(0xa0a0a0a0L, 0xb1b1b1b1L, 0xc2c2c2c2L, 0xd3d3d3d3L)
      val bid  = SimHelpers.fullBurstWrite(dut.io.src, cd, 0x100L, data, id = 5)
      assert(bid == 5, s"write answered with id $bid")

      val (got, rid) = SimHelpers.fullBurstRead(dut.io.src, cd, 0x100L, data.length, id = 7)
      assert(rid == 7, s"read answered with id $rid")
      assert(got == data, got.map(d => f"0x$d%08X").mkString("read back ", ", ", ""))
    }
  }

  // Axi3ToAxi4Adapter sorts write data by WID, so a beat tagged with any ID
  // but its own burst's waits for an AW that never comes. With the WID tied
  // to zero, as the shim once did, the first write here hangs.
  test("data behind its address and data ahead of it both carry the right WID") {
    simCfg.compile(new RoundTrip).doSim { dut =>
      val cd  = dut.clockDomain
      val mem = SimHelpers.spawnFullSlave(dut.io.dst, cd)
      val m   = dut.io.src
      SimHelpers.initMaster(m)
      cd.forkStimulus(10)
      cd.waitSampling(5)

      def sendAw(id: Int, addr: Long, beats: Int): Unit = {
        m.aw.valid #= true
        m.aw.id #= id
        m.aw.addr #= addr
        m.aw.len #= beats - 1
        m.aw.size #= 2
        m.aw.burst #= 1
        while ({ cd.waitSampling(); !m.aw.ready.toBoolean }) {}
        m.aw.valid #= false
      }
      def sendW(data: Seq[Long]): Unit = {
        for ((d, i) <- data.zipWithIndex) {
          m.w.valid #= true
          m.w.data #= d
          m.w.strb #= 0xf
          m.w.last #= i == data.length - 1
          while ({ cd.waitSampling(); !m.w.ready.toBoolean }) {}
        }
        m.w.valid #= false
      }
      def takeB(): Int = {
        m.b.ready #= true
        while ({ cd.waitSampling(); !m.b.valid.toBoolean }) {}
        m.b.ready #= false
        m.b.id.toInt
      }
      val timeout = fork { cd.waitSampling(2000); simFailure("a write never finished") }

      // Two bursts, both addresses accepted before any data: the second
      // burst's beats must be tagged with its own ID, not the first's.
      sendAw(3, 0x200L, 2)
      sendAw(6, 0x300L, 1)
      sendW(Seq(0x11111111L, 0x22222222L))
      sendW(Seq(0x33333333L))
      val ids = Seq(takeB(), takeB())
      assert(ids.sorted == Seq(3, 6), s"responses for IDs $ids")

      // Data offered before its address: the beat waits for an AWID to tag
      // it with, and then goes with that one.
      m.w.valid #= true
      m.w.data #= 0x44444444L
      m.w.strb #= 0xf
      m.w.last #= true
      cd.waitSampling(5)
      assert(!m.w.ready.toBoolean, "a beat went out with no AWID to name it")
      val wThread = fork {
        while ({ cd.waitSampling(); !m.w.ready.toBoolean }) {}
        m.w.valid #= false
      }
      sendAw(9, 0x400L, 1)
      wThread.join()
      assert(takeB() == 9)
      timeout.terminate()

      for (
        (a, v) <- Seq(
          0x200L -> 0x11111111L,
          0x204L -> 0x22222222L,
          0x300L -> 0x33333333L,
          0x400L -> 0x44444444L
        )
      )
        assert(mem.getOrElse(a, -1L) == v, f"0x$a%X holds 0x${mem.getOrElse(a, -1L)}%X")
    }
  }
}
