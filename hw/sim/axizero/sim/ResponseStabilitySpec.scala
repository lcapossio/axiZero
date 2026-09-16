// Copyright (c) 2026 Leonardo Capossio — bard0 design  hello@bard0.com
// SPDX-License-Identifier: MIT
package axizero.sim

import org.scalatest.funsuite.AnyFunSuite
import spinal.core._
import spinal.core.sim._
import spinal.lib.bus.amba4.axi.Axi4Config
import axizero._

// ---------------------------------------------------------------------------
// ResponseStabilitySpec  —  AXI4 A3.2.1 on the *response* channels
//
// The crossbar's B and R muxes pick, per master, among the slaves holding a
// response for it. That pick was a bare OHMasking.first over the live valid
// vector, recomputed every cycle, so with responses waiting at two slaves and
// the master stalling, a lower-numbered slave going valid swapped the response
// out from under a live BVALID/RVALID. A3.2.1 applies here exactly as it does
// to AW/AR: once VALID is asserted the payload holds until READY.
//
// Nothing in the rest of the suite can see this. Every simulated master ties
// BREADY/RREADY high, VexRiscv never stalls a response, and no other spec puts
// one master's responses at two slaves at once -- so the fabric is never asked
// the question. These tests ask it.
//
// The ordering matters and is not incidental: the mux picked the *lowest*
// numbered slave, so a violation only appears when the low-numbered slave
// answers second. Each test therefore starts the transaction at slave 1 and
// only then starts one at slave 0.
// ---------------------------------------------------------------------------
class ResponseStabilitySpec extends AnyFunSuite {

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
  private val slaveCfg = Axi4Config(addressWidth = 32, dataWidth = 32, idWidth = 4)

  /** One master, two slaves, pipelined so both can hold a response at once. */
  private def cfgPipelined = AxiZeroConfig(
    masters = Seq(MasterPort(masterCfg, FullAxi4)),
    slaves = Seq(
      SlavePort(slaveCfg, FullAxi4, s0Base, slaveSize),
      SlavePort(slaveCfg, FullAxi4, s1Base, slaveSize)
    ),
    arbitration = RoundRobin,
    maxOutstanding = 4
  )

  /** Drive one AW plus its single W beat, without waiting for B. */
  private def issueWrite(
    m: spinal.lib.bus.amba4.axi.Axi4,
    cd: ClockDomain,
    addr: BigInt,
    id: Int,
    data: BigInt
  ): Unit = {
    m.aw.valid #= true
    m.aw.addr #= addr
    m.aw.id #= id
    m.aw.len #= 0
    m.aw.size #= 2
    m.aw.burst #= 1
    cd.waitSamplingWhere(m.aw.ready.toBoolean)
    m.aw.valid #= false

    m.w.valid #= true
    m.w.data #= data
    m.w.strb #= 0xf
    m.w.last #= true
    cd.waitSamplingWhere(m.w.ready.toBoolean)
    m.w.valid #= false
  }

  /** Drive one AR, without consuming R. */
  private def issueRead(
    m: spinal.lib.bus.amba4.axi.Axi4,
    cd: ClockDomain,
    addr: BigInt,
    id: Int,
    len: Int
  ): Unit = {
    m.ar.valid #= true
    m.ar.addr #= addr
    m.ar.id #= id
    m.ar.len #= len
    m.ar.size #= 2
    m.ar.burst #= 1
    cd.waitSamplingWhere(m.ar.ready.toBoolean)
    m.ar.valid #= false
  }

  /** `waitSamplingWhere` with a limit: false if `cond` never came. The ordering tests below reach
    * states a broken fabric never leaves, and a test should fail there rather than hang sbt.
    */
  private def waitUpTo(cd: ClockDomain, limit: Int)(cond: => Boolean): Boolean = {
    var n = 0
    while ({ cd.waitSampling(); n += 1; !cond && n < limit }) {}
    cond
  }

  // ── B channel ───────────────────────────────────────────────────────────
  test("B payload holds while the master stalls and a second slave answers") {
    simCfg.compile(new AxiZeroMixedTop(cfgPipelined)).doSim { dut =>
      val cd = dut.clockDomain
      cd.forkStimulus(10)
      SimHelpers.initMaster(dut.io.masters(0))
      SimHelpers.spawnFullSlave(dut.io.slaves(0), cd)
      SimHelpers.spawnFullSlave(dut.io.slaves(1), cd)
      cd.waitSampling(5)

      val m = dut.io.masters(0)
      m.b.ready #= false // stall every response
      m.r.ready #= true

      // Slave 1 answers first, slave 0 second -- the order that used to swap
      // the response, because the mux preferred the lower-numbered slave.
      issueWrite(m, cd, s1Base, id = 1, data = 0x11111111L)
      cd.waitSamplingWhere(m.b.valid.toBoolean)

      val firstId   = m.b.id.toInt
      val firstResp = m.b.resp.toInt
      assert(firstId == 1, s"expected the slave-1 response first, got id $firstId")

      issueWrite(m, cd, s0Base, id = 2, data = 0x22222222L)

      // Hold the stall long enough for slave 0's response to arrive and, if the
      // mux were still free to change its mind, to take over.
      for (_ <- 0 until 40) {
        cd.waitSampling()
        if (m.b.valid.toBoolean) {
          assert(
            m.b.id.toInt == firstId && m.b.resp.toInt == firstResp,
            s"B payload changed while BVALID was high and BREADY low: " +
              s"id $firstId -> ${m.b.id.toInt}, resp $firstResp -> ${m.b.resp.toInt}"
          )
        }
      }

      // Both responses must still be delivered, in some order, once accepted.
      val seen = scala.collection.mutable.Set[Int]()
      m.b.ready #= true
      var guard = 0
      while (seen.size < 2 && guard < 500) {
        cd.waitSampling()
        if (m.b.valid.toBoolean && m.b.ready.toBoolean) seen += m.b.id.toInt
        guard += 1
      }
      assert(seen == Set(1, 2), s"expected both responses, saw $seen")
    }
  }

  // ── R channel ───────────────────────────────────────────────────────────
  test("an R burst is not interleaved when a second slave answers mid-burst") {
    simCfg.compile(new AxiZeroMixedTop(cfgPipelined)).doSim { dut =>
      val cd = dut.clockDomain
      cd.forkStimulus(10)
      SimHelpers.initMaster(dut.io.masters(0))
      SimHelpers.spawnFullSlave(dut.io.slaves(0), cd)
      SimHelpers.spawnFullSlave(dut.io.slaves(1), cd)
      cd.waitSampling(5)

      val m = dut.io.masters(0)
      m.b.ready #= true
      m.r.ready #= false

      issueRead(m, cd, s1Base, id = 1, len = 7) // 8 beats from the high slave
      cd.waitSamplingWhere(m.r.valid.toBoolean)
      val burstId = m.r.id.toInt
      assert(burstId == 1, s"expected the slave-1 burst first, got id $burstId")

      issueRead(m, cd, s0Base, id = 2, len = 0) // one beat from the low slave

      // Stalled: the payload must not change under a live RVALID.
      for (_ <- 0 until 30) {
        cd.waitSampling()
        if (m.r.valid.toBoolean) {
          assert(
            m.r.id.toInt == burstId,
            s"R payload changed while RVALID was high and RREADY low: " +
              s"id $burstId -> ${m.r.id.toInt}"
          )
        }
      }

      // Now drain, and require the first burst to complete before the second
      // starts. Interleaving two bursts that carry the same master ID is
      // illegal, and it is what releasing the mux per beat would produce.
      m.r.ready #= true
      val order   = scala.collection.mutable.ArrayBuffer[Int]()
      var beats   = 0
      var guard   = 0
      var lastSaw = false
      while (beats < 9 && guard < 800) {
        cd.waitSampling()
        if (m.r.valid.toBoolean && m.r.ready.toBoolean) {
          order += m.r.id.toInt
          beats += 1
          if (m.r.last.toBoolean) lastSaw = true
        }
        guard += 1
      }
      assert(beats == 9, s"expected 9 R beats (8 + 1), saw $beats")
      assert(lastSaw, "never saw RLAST")
      val firstRun = order.takeWhile(_ == 1)
      assert(
        firstRun.length == 8 && order.drop(8).forall(_ == 2),
        s"bursts were interleaved: $order"
      )
    }
  }

  // ── A held selection must not invent beats ──────────────────────────────
  test("a slave that bubbles mid-burst does not produce phantom beats") {
    // Holding the R selection across stalls means it can point at a slave on a
    // cycle that slave is offering nothing: a slave may legally insert bubbles
    // between beats of a burst. If the mux asserts the master's RVALID from the
    // selection rather than from the slave's own RVALID, every bubble becomes a
    // phantom beat carrying stale data -- more beats than AWLEN promised, and
    // wrong values. The board caught this before this test existed; the point of
    // the test is that it should not have had to.
    simCfg.compile(new AxiZeroMixedTop(cfgPipelined)).doSim { dut =>
      val cd = dut.clockDomain
      cd.forkStimulus(10)
      SimHelpers.initMaster(dut.io.masters(0))
      val mem = SimHelpers.spawnFullSlave(dut.io.slaves(1), cd, stallR = 3)
      SimHelpers.spawnFullSlave(dut.io.slaves(0), cd)
      cd.waitSampling(5)

      for (i <- 0 until 8) mem(s1Base.toLong + i * 4) = 0xa0000000L + i

      val m = dut.io.masters(0)
      m.b.ready #= true
      m.r.ready #= true

      issueRead(m, cd, s1Base, id = 3, len = 7)

      val got   = scala.collection.mutable.ArrayBuffer[Long]()
      var lasts = 0
      var guard = 0
      while (lasts == 0 && guard < 1000) {
        cd.waitSampling()
        if (m.r.valid.toBoolean && m.r.ready.toBoolean) {
          got += m.r.data.toLong
          if (m.r.last.toBoolean) lasts += 1
        }
        guard += 1
      }
      assert(lasts == 1, s"expected exactly one RLAST, saw $lasts")
      assert(got.length == 8, s"expected 8 beats, saw ${got.length}: $got")
      val want = (0 until 8).map(i => 0xa0000000L + i)
      assert(got.toSeq == want, s"read data wrong: got $got, want $want")
    }
  }

  // ── Blocking: both responses reach the master ───────────────────────────
  // Unlike the two above, this one passes with and against the master-busy
  // guard in blocking mode, so it does not demonstrate that guard -- it pins
  // the ordinary behaviour it must not break. Reaching the state the guard
  // forecloses needs a master to issue a second AW before its first W, which
  // the slave model cannot answer: it withholds AWREADY until a W beat is up.
  test("blocking: writes to two slaves both get their response") {
    val blocking = cfgPipelined.copy(maxOutstanding = 1)
    simCfg.compile(new AxiZeroMixedTop(blocking)).doSim { dut =>
      val cd = dut.clockDomain
      cd.forkStimulus(10)
      SimHelpers.initMaster(dut.io.masters(0))
      // The loss is directional. Blocking mode drives the master's B from
      // inside each active slave's block, so the highest-numbered active slave
      // wins the master's BVALID -- while every active slave is still handed
      // that master's BREADY. So slave 0 must answer *first*, into a master
      // that is looking at slave 1: its response fires and reaches no one.
      // Slave 1 stalls long enough for both writes to be in flight at once,
      // which is the state the guard now prevents.
      SimHelpers.spawnFullSlave(dut.io.slaves(0), cd, stallW = 0)
      SimHelpers.spawnFullSlave(dut.io.slaves(1), cd, stallW = 60)
      cd.waitSampling(5)

      val m = dut.io.masters(0)
      m.r.ready #= true
      m.b.ready #= true

      val seen = scala.collection.mutable.Set[Int]()
      val rx = fork {
        var guard = 0
        while (seen.size < 2 && guard < 2000) {
          cd.waitSampling()
          if (m.b.valid.toBoolean && m.b.ready.toBoolean) seen += m.b.id.toInt
          guard += 1
        }
      }

      issueWrite(m, cd, s1Base, id = 1, data = 0x33333333L)
      issueWrite(m, cd, s0Base, id = 2, data = 0x44444444L)
      rx.join()
      assert(seen == Set(1, 2), s"a write response was lost: saw $seen")
    }
  }

  // ── Same-ID ordering across slaves ──────────────────────────────────────
  // AXI4 requires transactions that share an ID to complete in the order they
  // were issued, whichever slave each went to. The crossbar routes responses
  // back by ID but counts outstanding work per slave, so nothing it tracks
  // stops a same-ID read to a fast slave overtaking one still waiting on a
  // slow one.
  test("same-ID reads to two slaves are answered in issue order") {
    simCfg.compile(new AxiZeroMixedTop(cfgPipelined)).doSim { dut =>
      val cd = dut.clockDomain
      cd.forkStimulus(10)
      SimHelpers.initMaster(dut.io.masters(0))
      // stallR delays every beat, the first included, so slave 1 answers 20
      // cycles after it takes the address and slave 0 almost at once.
      val slow = SimHelpers.spawnFullSlave(dut.io.slaves(1), cd, stallR = 20)
      val fast = SimHelpers.spawnFullSlave(dut.io.slaves(0), cd)
      cd.waitSampling(5)
      slow(s1Base.toLong) = 0x51L
      fast(s0Base.toLong) = 0x50L

      val m = dut.io.masters(0)
      m.b.ready #= true
      m.r.ready #= true

      val got = scala.collection.mutable.ArrayBuffer[Long]()
      val rx = fork {
        var guard = 0
        while (got.length < 2 && guard < 2000) {
          cd.waitSampling()
          if (m.r.valid.toBoolean && m.r.ready.toBoolean) got += m.r.data.toLong
          guard += 1
        }
      }

      issueRead(m, cd, s1Base, id = 0, len = 0)
      issueRead(m, cd, s0Base, id = 0, len = 0)
      rx.join()

      assert(got.length == 2, s"expected two read responses, saw ${got.length}")
      assert(
        got.toSeq == Seq(0x51L, 0x50L),
        "same-ID reads were answered out of issue order: " + got.map(v => f"0x$v%x").mkString(", ")
      )
    }
  }

  // ── Single slave per ID, write direction ────────────────────────────────
  // The read test above shows the rule mattering for ordering. This one shows
  // the fabric actually withholding the handshake: a second write carrying an
  // ID whose earlier write has not been answered yet may not be issued to a
  // different slave, because once it were, nothing could keep the two
  // responses in order.
  test("a same-ID write to another slave waits for the first response") {
    simCfg.compile(new AxiZeroMixedTop(cfgPipelined)).doSim { dut =>
      val cd = dut.clockDomain
      cd.forkStimulus(10)
      SimHelpers.initMaster(dut.io.masters(0))
      SimHelpers.spawnFullSlave(dut.io.slaves(1), cd)
      SimHelpers.spawnFullSlave(dut.io.slaves(0), cd)
      cd.waitSampling(5)

      val m = dut.io.masters(0)
      m.r.ready #= true
      m.b.ready #= false // hold the first response so its thread stays live

      issueWrite(m, cd, s1Base, id = 5, data = 0xaaaa0001L)
      assert(waitUpTo(cd, 200)(m.b.valid.toBoolean), "first write was never answered")

      m.aw.valid #= true
      m.aw.addr #= s0Base
      m.aw.id #= 5
      m.aw.len #= 0
      m.aw.size #= 2
      m.aw.burst #= 1

      var admitted = false
      for (_ <- 0 until 30) {
        cd.waitSampling()
        if (m.aw.ready.toBoolean) admitted = true
      }
      assert(
        !admitted,
        "a second write with a live ID was issued to another slave before the first was answered"
      )

      // Retire the first, and the thread is free to move.
      m.b.ready #= true
      assert(waitUpTo(cd, 200)(m.aw.ready.toBoolean), "second write never admitted")
      m.aw.valid #= false
    }
  }

  // ── A new ID waits for a free thread ────────────────────────────────────
  // The table of live IDs is small and fixed (cfg.idThreads, 2 here), the way
  // AMD's, Arm's and Forencich's are. A request whose ID matches no live thread
  // and finds none free waits: a stall, never a reordering.
  //
  // The third read goes to an unmapped address on purpose. Both real slaves are
  // busy by then and the slave model holds ARREADY low for a whole burst, so a
  // third read aimed at either would stall for a reason that has nothing to do
  // with the thread table and the test would pass while proving nothing. The
  // decode-error responder is the one destination that is always free to take
  // an address immediately -- so when it does not, the table is the only thing
  // holding the request back.
  test("a read with a new ID waits for a free thread, then completes") {
    simCfg.compile(new AxiZeroMixedTop(cfgPipelined)).doSim { dut =>
      val cd = dut.clockDomain
      cd.forkStimulus(10)
      SimHelpers.initMaster(dut.io.masters(0))
      val mem1 = SimHelpers.spawnFullSlave(dut.io.slaves(1), cd)
      val mem0 = SimHelpers.spawnFullSlave(dut.io.slaves(0), cd)
      cd.waitSampling(5)
      mem0(s0Base.toLong) = 0x61L
      mem1(s1Base.toLong) = 0x62L

      val m = dut.io.masters(0)
      m.b.ready #= true

      var lasts = 0
      fork {
        while (true) {
          cd.waitSampling()
          if (m.r.valid.toBoolean && m.r.ready.toBoolean && m.r.last.toBoolean) lasts += 1
        }
      }

      // Unmapped: the decode-error responder owns it. With nothing else in
      // flight it is admitted at once -- the control for the wait below.
      val unmapped = BigInt("80000000", 16)
      m.r.ready #= true
      issueRead(m, cd, unmapped, id = 3, len = 0)
      assert(waitUpTo(cd, 200)(lasts == 1), "the responder did not answer a lone read")

      // Now park a read at each slave and stall R, so neither retires and both
      // threads stay live.
      m.r.ready #= false
      issueRead(m, cd, s0Base, id = 1, len = 0)
      issueRead(m, cd, s1Base, id = 2, len = 0)

      m.ar.valid #= true
      m.ar.addr #= unmapped
      m.ar.id #= 3
      m.ar.len #= 0
      m.ar.size #= 2
      m.ar.burst #= 1

      var admitted = false
      for (_ <- 0 until 20) {
        cd.waitSampling()
        if (m.ar.ready.toBoolean) admitted = true
      }
      assert(!admitted, "a third live ID was admitted with no thread free to track it")

      // Let the parked reads retire, and the same request goes through.
      m.r.ready #= true
      assert(waitUpTo(cd, 600)(m.ar.ready.toBoolean), "the third read was never admitted")
      m.ar.valid #= false

      assert(waitUpTo(cd, 600)(lasts == 4), s"not every read came back: saw $lasts of 4")
    }
  }

  // ── Write data follows the address it belongs to ────────────────────────
  // W carries no ID in AXI4: a master's write beats go in the order of its
  // AWs, and the fabric must steer each one to the slave its AW went to. The
  // W route is a queue per slave naming the master whose data comes next, so
  // with a second AW accepted at another slave while the first burst's data
  // was still owed, both queues named this master at their head and both
  // slaves were handed its beats. Slave 1 holds off its W for 20 cycles so
  // that the second AW is presented while the first beat is still outstanding.
  test("a second write to another slave does not take the first write's data") {
    simCfg.compile(new AxiZeroMixedTop(cfgPipelined)).doSim { dut =>
      val cd = dut.clockDomain
      cd.forkStimulus(10)
      SimHelpers.initMaster(dut.io.masters(0))
      val mem1 = SimHelpers.spawnFullSlave(dut.io.slaves(1), cd, stallW = 20)
      val mem0 = SimHelpers.spawnFullSlave(dut.io.slaves(0), cd)
      cd.waitSampling(5)

      val m = dut.io.masters(0)
      m.r.ready #= true
      m.b.ready #= true

      var bSeen = 0
      fork {
        while (true) {
          cd.waitSampling()
          if (m.b.valid.toBoolean && m.b.ready.toBoolean) bSeen += 1
        }
      }

      m.aw.valid #= true
      m.aw.addr #= s1Base
      m.aw.id #= 0
      m.aw.len #= 0
      m.aw.size #= 2
      m.aw.burst #= 1
      assert(waitUpTo(cd, 200)(m.aw.ready.toBoolean), "first AW never accepted")

      // The second AW goes up at once; its data is not due until the first
      // beat has been taken.
      m.aw.addr #= s0Base
      val aw2 = fork {
        waitUpTo(cd, 400)(m.aw.ready.toBoolean)
        m.aw.valid #= false
      }

      m.w.valid #= true
      m.w.data #= 0x11111111L
      m.w.strb #= 0xf
      m.w.last #= true
      val w1 = waitUpTo(cd, 400)(m.w.ready.toBoolean)
      m.w.data #= 0x22222222L
      val w2 = w1 && waitUpTo(cd, 400)(m.w.ready.toBoolean)
      m.w.valid #= false
      aw2.join()
      waitUpTo(cd, 200)(bSeen >= 2)

      assert(w1 && w2, s"write data was not accepted (first beat $w1, second beat $w2)")
      assert(
        mem1
          .get(s1Base.toLong)
          .contains(0x11111111L) && mem0.get(s0Base.toLong).contains(0x22222222L),
        s"write data reached the wrong slave: slave 1 holds ${mem1.get(s1Base.toLong)}, " +
          s"slave 0 holds ${mem0.get(s0Base.toLong)}"
      )
      assert(bSeen == 2, s"expected two write responses, saw $bSeen")
    }
  }
}
