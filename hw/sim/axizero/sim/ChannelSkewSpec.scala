// Copyright (c) 2026 Leonardo Capossio — bard0 design  hello@bard0.com
// SPDX-License-Identifier: MIT
package axizero.sim

import scala.collection.mutable
import org.scalatest.funsuite.AnyFunSuite
import spinal.core._
import spinal.core.sim._
import spinal.lib.bus.amba4.axi.{Axi4, Axi4Config}
import axizero._

// ---------------------------------------------------------------------------
// ChannelSkewSpec  —  the two channels a slave is free to skew
//
// AXI4 orders the handshakes on a channel, and nothing at all between channels.
// Two consequences land on the fabric's bookkeeping, and the rest of the suite
// never produces either, because every slave model here accepts an address
// before it offers to take data and answers no earlier than the cycle after.
//
//   1. WREADY before AWREADY. The crossbar offers a master's W beat alongside
//      the AW it is presenting, so an IPIF-style Lite slave -- which will not
//      raise AWREADY until it sees AWVALID and WVALID together -- can complete
//      its handshake. A slave that raises WREADY while still holding AWREADY
//      low therefore takes the beat before the address. The data is fine; it
//      goes to the slave the AW is aimed at. The counters are what break: the
//      W-route FIFO is popped for an entry it never had, and the write-data
//      debt is discharged before it was incurred. Both wrap, and a wrapped
//      debt holds the master's writes to one slave for good.
//
//   2. A response arriving as the next address is accepted. A Lite slave has
//      no ID, so the adapter in front of it remembers the ID and puts it back
//      on the response. With two transactions in flight the response leaving
//      as the next address arrives is tagged with the *new* ID -- and the
//      crossbar routes and retires by ID, so one ID is answered twice and the
//      other never. Single-slave-per-ID does not prevent this: it holds one
//      ID to one slave, and says nothing about two different IDs at the same
//      slave, which is exactly what a multi-ID master produces.
// ---------------------------------------------------------------------------
class ChannelSkewSpec extends AnyFunSuite {

  private val spinalCfg = SpinalConfig(
    defaultConfigForClockDomains = ClockDomainConfig(
      clockEdge = RISING,
      resetKind = SYNC,
      resetActiveLevel = LOW
    )
  )

  private def simCfg = SimConfig.withConfig(spinalCfg)

  private val s0Base    = BigInt("00000000", 16)
  private val s1Base    = BigInt("00010000", 16)
  private val slaveSize = BigInt("00010000", 16)

  private val masterCfg = Axi4Config(addressWidth = 32, dataWidth = 32, idWidth = 4)
  // One master, so masterIndexBits is 0 and the slave-side ID is not widened.
  private val fullCfg = Axi4Config(addressWidth = 32, dataWidth = 32, idWidth = 4)
  private val liteCfg = Axi4Config(
    addressWidth = 32,
    dataWidth = 32,
    idWidth = 0,
    useId = false,
    useLen = false,
    useSize = false,
    useBurst = false,
    useLast = false,
    useLock = false,
    useCache = false,
    useQos = false,
    useRegion = false
  )

  /** `waitSampling` with a limit, so a fabric that has wedged fails here rather than hanging sbt.
    */
  private def waitUpTo(cd: ClockDomain, limit: Int)(cond: => Boolean): Boolean = {
    var n = 0
    while ({ cd.waitSampling(); n += 1; !cond && n < limit }) {}
    cond
  }

  // ── 1. WREADY before AWREADY ────────────────────────────────────────────
  private def cfgTwoFull = AxiZeroConfig(
    masters = Seq(MasterPort(masterCfg, FullAxi4)),
    slaves = Seq(
      SlavePort(fullCfg, FullAxi4, s0Base, slaveSize),
      SlavePort(fullCfg, FullAxi4, s1Base, slaveSize)
    ),
    maxOutstanding = 4
  )

  /** A slave that takes write data before it takes the address.
    *
    * WREADY is tied high from reset; AWREADY only goes up after `awDelay` cycles of AWVALID. Both
    * are legal on their own and AXI4 orders neither against the other. It counts the beats it was
    * given so the test can check the fabric neither dropped one nor sent it twice.
    */
  private class EarlyWriteDataSlave(axi: Axi4, cd: ClockDomain, awDelay: Int) {
    var wBeats        = 0
    var awFires       = 0
    private var stall = 0
    private val due   = mutable.Queue[BigInt]() // AWs accepted, B not yet sent
    private var lasts = 0                       // last-beats taken, awaiting an AW

    axi.aw.ready #= false
    axi.w.ready #= true // up front, before any address has arrived
    axi.b.valid #= false
    axi.ar.ready #= false
    axi.r.valid #= false

    cd.onSamplings {
      val awFire = axi.aw.valid.toBoolean && axi.aw.ready.toBoolean
      val wFire  = axi.w.valid.toBoolean && axi.w.ready.toBoolean
      val bFire  = axi.b.valid.toBoolean && axi.b.ready.toBoolean

      if (wFire) {
        wBeats += 1
        if (axi.w.last.toBoolean) lasts += 1
      }
      if (awFire) {
        awFires += 1
        due.enqueue(axi.aw.id.toBigInt)
        stall = 0
        axi.aw.ready #= false
      } else if (axi.aw.valid.toBoolean) {
        stall += 1
        if (stall >= awDelay) axi.aw.ready #= true
      }

      if (bFire) { due.dequeue(); lasts -= 1; axi.b.valid #= false }
      // A write is answerable once both halves of it have arrived, in either order.
      if (!axi.b.valid.toBoolean || bFire) {
        val ready = due.nonEmpty && lasts > 0 && !(bFire && due.size == 1)
        if (ready) {
          axi.b.valid #= true
          axi.b.id #= (if (bFire) due(1) else due.head)
          axi.b.resp #= 0
        }
      }
    }
  }

  test("a slave that takes W before AW does not strand the master at that slave") {
    simCfg.compile(new AxiZeroMixedTop(cfgTwoFull)).doSim("w_before_aw") { dut =>
      SimTimeout(100000)
      val cd = dut.clockDomain
      val m  = dut.io.masters(0)
      SimHelpers.initMaster(m)
      // The skewed slave is slave 1 deliberately. The debt counter names the
      // slave the debt is owed to, and it starts at 0, so an underflow that
      // leaves a phantom debt against slave 0 is invisible if the write under
      // test is going to slave 0 anyway -- and a single skewed write wraps the
      // counter twice, once down and once back up, so nothing else shows it.
      // Against slave 1 the phantom debt names the wrong slave, and the rule
      // that keeps a master's writes at one slave then refuses the address.
      SimHelpers.spawnFullSlave(dut.io.slaves(0), cd)
      val skewed = new EarlyWriteDataSlave(dut.io.slaves(1), cd, awDelay = 6)
      cd.forkStimulus(10)
      cd.waitSampling(5)
      m.b.ready #= true
      m.r.ready #= true

      // Present the address and its single beat of data together, which is what
      // a master does when it has the data ready. Slave 1 will take the beat
      // several cycles before it takes the address.
      m.aw.valid #= true
      m.aw.addr #= s1Base
      m.aw.id #= 3
      m.aw.len #= 0
      m.aw.size #= 2
      m.aw.burst #= 1
      m.w.valid #= true
      m.w.data #= 0xdeadbeefL
      m.w.strb #= 0xf
      m.w.last #= true

      assert(waitUpTo(cd, 200)(m.w.ready.toBoolean), "the write data was never taken")
      m.w.valid #= false
      assert(waitUpTo(cd, 200)(m.aw.ready.toBoolean), "the write address was never taken")
      m.aw.valid #= false

      assert(waitUpTo(cd, 200)(m.b.valid.toBoolean), "the skewed write was never answered")
      assert(m.b.id.toInt == 3, s"B came back with id ${m.b.id.toInt}, expected 3")
      cd.waitSampling()

      assert(skewed.wBeats == 1, s"slave 1 was given ${skewed.wBeats} W beats, expected exactly 1")
      assert(skewed.awFires == 1, s"slave 1 was given ${skewed.awFires} addresses, expected 1")

      // And the other direction: a write to the slave the phantom debt named.
      m.aw.valid #= true
      m.aw.addr #= s0Base
      m.aw.id #= 3
      assert(
        waitUpTo(cd, 200)(m.aw.ready.toBoolean),
        "a write to the other slave was never admitted: the write-data debt is stuck"
      )
      m.aw.valid #= false
      m.w.valid #= true
      m.w.data #= 0x5a5a5a5aL
      assert(waitUpTo(cd, 200)(m.w.ready.toBoolean), "the second write's data was never taken")
      m.w.valid #= false
      assert(waitUpTo(cd, 200)(m.b.valid.toBoolean), "the second write was never answered")
    }
  }

  test("a burst whose data ran ahead does not take the next burst's data too") {
    // The bypass exists so a slave that wants AWVALID and WVALID together can
    // handshake. Once the burst it was opened for has sent its last beat, it
    // has to close: W runs ahead of AW in the master's own AW order, so the
    // next beats belong to the master's *next* address -- which is still stuck
    // behind this stalled one, and may name a different slave. Left open, the
    // slave swallows that burst's data. Here the second write is addressed to
    // slave 0 while slave 1 is still holding the first address, so a bypass
    // that stays open sends slave 0's data to slave 1.
    simCfg.compile(new AxiZeroMixedTop(cfgTwoFull)).doSim("w_runs_past_last") { dut =>
      SimTimeout(100000)
      val cd = dut.clockDomain
      val m  = dut.io.masters(0)
      SimHelpers.initMaster(m)
      val plain  = new EarlyWriteDataSlave(dut.io.slaves(0), cd, awDelay = 0)
      val skewed = new EarlyWriteDataSlave(dut.io.slaves(1), cd, awDelay = 30)
      cd.forkStimulus(10)
      cd.waitSampling(5)
      m.b.ready #= true
      m.r.ready #= true

      // Counted at the master's own handshake rather than polled: a beat can be
      // taken in the same cycle as the AW that unblocks it, and a poll after
      // that cycle sees a beat that has already gone.
      var mW  = 0
      var mAW = 0
      cd.onSamplings {
        if (m.w.valid.toBoolean && m.w.ready.toBoolean) mW += 1
        if (m.aw.valid.toBoolean && m.aw.ready.toBoolean) mAW += 1
      }

      // First write: two beats at slave 1, whose AWREADY stays down long enough
      // for both to go early.
      m.aw.valid #= true
      m.aw.addr #= s1Base
      m.aw.id #= 1
      m.aw.len #= 1
      m.aw.size #= 2
      m.aw.burst #= 1
      for (i <- 0 until 2) {
        m.w.valid #= true
        m.w.data #= 0xa0000000L + i
        m.w.strb #= 0xf
        m.w.last #= (i == 1)
        assert(waitUpTo(cd, 200)(mW == i + 1), s"beat $i of the early burst was not taken")
        m.w.valid #= false
      }
      assert(skewed.wBeats == 2, s"slave 1 took ${skewed.wBeats} beats of the first burst")

      // The second burst's data, offered while the first address is still
      // stalled. Nothing may take it: its own address has not been issued yet,
      // and the master cannot issue it while AW is still holding the first.
      m.w.valid #= true
      m.w.data #= 0xb0000000L
      m.w.strb #= 0xf
      m.w.last #= true
      assert(
        !waitUpTo(cd, 20)(mW > 2),
        "the second burst's data was taken while its address was still unissued -- " +
          s"slave 0 has ${plain.wBeats} beats, slave 1 has ${skewed.wBeats}"
      )

      // Let the first address through, then address the second write to the
      // other slave and check its data lands there and nowhere else.
      assert(waitUpTo(cd, 200)(mAW == 1), "the first address was never taken")
      m.aw.valid #= false
      assert(waitUpTo(cd, 200)(m.b.valid.toBoolean), "the first write was never answered")
      cd.waitSampling()

      m.aw.valid #= true
      m.aw.addr #= s0Base
      m.aw.id #= 1
      m.aw.len #= 0
      // Both valids stay up until both handshakes have happened: the data may
      // legally go first, and dropping AWVALID before AWREADY would be this
      // testbench breaking A3.2.1 rather than the fabric.
      assert(
        waitUpTo(cd, 200)(mW == 3 && mAW == 2),
        s"the second write did not complete its handshakes (W $mW of 3, AW $mAW of 2)"
      )
      m.w.valid #= false
      m.aw.valid #= false
      assert(waitUpTo(cd, 200)(m.b.valid.toBoolean), "the second write was never answered")
      cd.waitSampling()

      assert(plain.wBeats == 1, s"slave 0 was given ${plain.wBeats} W beats, expected exactly 1")
      assert(skewed.wBeats == 2, s"slave 1 was given ${skewed.wBeats} W beats, expected exactly 2")
    }
  }

  // ── 2. A response leaving as the next address arrives ───────────────────
  private def cfgLiteAndFull = AxiZeroConfig(
    masters = Seq(MasterPort(masterCfg, FullAxi4)),
    slaves = Seq(
      SlavePort(liteCfg, LiteAxi4, s0Base, slaveSize),
      SlavePort(fullCfg, FullAxi4, s1Base, slaveSize)
    ),
    maxOutstanding = 4
  )

  /** A Lite slave whose read answer lands exactly on the cycle it would accept the next address.
    *
    * ARREADY is tied high and RVALID follows an accepted AR by one cycle, so back-to-back reads
    * hand over on a single edge. It returns `0xA5A50000 | addr` so each answer names its own
    * address.
    */
  private class TurnoverLiteSlave(axi: Axi4, cd: ClockDomain) {
    private var held: Option[Long] = None

    axi.ar.ready #= true
    axi.r.valid #= false
    axi.aw.ready #= false
    axi.w.ready #= false
    axi.b.valid #= false

    cd.onSamplings {
      val rFire  = axi.r.valid.toBoolean && axi.r.ready.toBoolean
      val arFire = axi.ar.valid.toBoolean && axi.ar.ready.toBoolean
      if (rFire) held = None
      assert(
        !(arFire && held.isDefined),
        "the Lite slave was given a second read while one was still pending"
      )
      if (arFire) held = Some(axi.ar.addr.toLong)
      axi.r.valid #= held.isDefined
      held.foreach(a => axi.r.data #= 0xa5a50000L | a)
      if (axi.r.config.useResp) axi.r.resp #= 0
    }
  }

  test("two IDs at one Lite slave keep their own answers across the handover") {
    simCfg.compile(new AxiZeroMixedTop(cfgLiteAndFull)).doSim("lite_id_turnover") { dut =>
      SimTimeout(100000)
      val cd = dut.clockDomain
      val m  = dut.io.masters(0)
      SimHelpers.initMaster(m)
      new TurnoverLiteSlave(dut.io.slaves(0), cd)
      SimHelpers.spawnFullSlave(dut.io.slaves(1), cd)
      cd.forkStimulus(10)
      cd.waitSampling(5)
      m.r.ready #= true
      m.b.ready #= true

      val got = mutable.Queue[(Int, Long)]()
      cd.onSamplings {
        if (m.r.valid.toBoolean && m.r.ready.toBoolean) {
          got.enqueue((m.r.id.toInt, m.r.payload.data.toLong))
        }
      }

      // Two reads of two different IDs at the same slave, the second offered
      // from the cycle the first is accepted so it arrives on the handover.
      def offer(addr: BigInt, id: Int): Unit = {
        m.ar.valid #= true
        m.ar.addr #= addr
        m.ar.id #= id
        m.ar.len #= 0
        m.ar.size #= 2
        m.ar.burst #= 1
        assert(waitUpTo(cd, 200)(m.ar.ready.toBoolean), s"the read of id $id was never accepted")
      }

      offer(s0Base + 0x10, id = 0)
      offer(s0Base + 0x20, id = 1)
      m.ar.valid #= false

      assert(waitUpTo(cd, 400)(got.size >= 2), s"only ${got.size} of 2 reads were answered")
      val (id0, d0) = got.dequeue()
      val (id1, d1) = got.dequeue()
      assert(id0 == 0, s"the first answer came back as id $id0, expected 0")
      assert(d0 == 0xa5a50010L, f"the first answer carried 0x$d0%08X, expected 0xA5A50010")
      assert(id1 == 1, s"the second answer came back as id $id1, expected 1")
      assert(d1 == 0xa5a50020L, f"the second answer carried 0x$d1%08X, expected 0xA5A50020")

      // Both IDs must have been released. If one answer was tagged with the
      // other's ID, one thread is still live at the Lite slave and a read of
      // that ID anywhere else is never admitted.
      for (id <- Seq(0, 1)) {
        m.ar.valid #= true
        m.ar.addr #= s1Base
        m.ar.id #= id
        assert(
          waitUpTo(cd, 200)(m.ar.ready.toBoolean),
          s"a later read of id $id to the other slave was never admitted"
        )
        m.ar.valid #= false
        assert(waitUpTo(cd, 400)(got.nonEmpty), s"the later read of id $id was never answered")
        val (rid, _) = got.dequeue()
        assert(rid == id, s"the later read of id $id came back as id $rid")
      }
    }
  }
}
