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
// DecodeErrorSpec — an address that belongs to no slave must be refused, not
// ignored
//
// A crossbar that drives AWREADY only for an address it can place has no way
// to say no to one it cannot. The master holds AWVALID waiting for a handshake
// that never arrives and the port is wedged permanently: no error, no timeout,
// nothing in a waveform to say which address did it. A single stray address --
// a corrupted instruction, a driver writing through a dangling pointer -- takes
// the fabric down with it.
//
// This was not hypothetical. A one-bit memory corruption in a VexRiscv SoC made
// the CPU compute a store address of 0x4E4F549B, which decoded to no slave; the
// load/store port then sat with AWVALID unaccepted for 19,948,154 of 20,000,000
// simulated cycles. The corruption was a single bad word, and it was the missing
// decode-error path that turned it into a dead system.
//
// AXI's own answer is DECERR, and that is what the fabric now returns. These
// tests hold it to that on every path that can carry a transaction: blocking and
// pipelined full AXI4, and Lite. The last test pins the failure mode itself, so
// that what the responder prevents stays visible.
// ---------------------------------------------------------------------------
class DecodeErrorSpec extends AnyFunSuite {

  private val spinalCfg = SpinalConfig(
    defaultConfigForClockDomains = ClockDomainConfig(
      clockEdge = RISING,
      resetKind = SYNC,
      resetActiveLevel = LOW
    )
  )

  private def simCfg = SimConfig.withConfig(spinalCfg)

  // Two slaves covering 0x0000_0000..0x0001_FFFF. Everything above is unmapped.
  private val slave0Base = BigInt("00000000", 16)
  private val slave1Base = BigInt("00010000", 16)
  private val slaveSize  = BigInt("00010000", 16)
  private val unmapped   = 0xdead0000L
  private val unmapped2  = 0x4e4f549bL & 0xfffffffcL // the address from the SoC hang

  private val DECERR = 3
  private val OKAY   = 0

  private val masterIdW = 4
  private val slaveIdW  = masterIdW + 1 // + masterIndexBits for two masters

  // useQos is explicit: a QoS test against a bus without AXQOS would drive
  // nothing and pass for the wrong reason.
  private val masterCfg =
    Axi4Config(addressWidth = 32, dataWidth = 32, idWidth = masterIdW, useQos = true)
  private val slaveCfg =
    Axi4Config(addressWidth = 32, dataWidth = 32, idWidth = slaveIdW, useQos = true)

  private def fullCfg(
    maxOutstanding: Int,
    decErr: Boolean = true,
    arbitration: ArbitrationPolicy = RoundRobin
  ) = AxiZeroConfig(
    masters = Seq.fill(2)(MasterPort(masterCfg, FullAxi4)),
    slaves = Seq(
      SlavePort(slaveCfg, FullAxi4, slave0Base, slaveSize),
      SlavePort(slaveCfg, FullAxi4, slave1Base, slaveSize)
    ),
    arbitration = arbitration,
    maxOutstanding = maxOutstanding,
    decodeErrorResponse = decErr
  )

  // ── Drivers that keep the response code ───────────────────────────────────
  // SimHelpers' drivers discard B.resp and R.resp, which is exactly the field
  // every test here is about, so these two keep it.

  /** Write `beats` beats and return (B.id, B.resp). */
  private def writeResp(
    m: Axi4,
    cd: ClockDomain,
    addr: Long,
    id: Int = 0,
    beats: Int = 1,
    qos: Int = 0
  ): (Int, Int) = {
    m.aw.valid #= true
    m.aw.addr #= addr
    if (m.config.useId) m.aw.id #= id
    if (m.config.useQos) m.aw.qos #= qos
    if (m.config.useLen) m.aw.len #= beats - 1
    if (m.config.useSize) m.aw.size #= 2
    if (m.config.useBurst) m.aw.burst #= 1
    while ({ cd.waitSampling(); !m.aw.ready.toBoolean }) {}
    m.aw.valid #= false

    for (i <- 0 until beats) {
      m.w.valid #= true
      m.w.data #= 0xa5a50000L + i
      if (m.config.useStrb) m.w.strb #= 0xf
      if (m.config.useLast) m.w.last #= (i == beats - 1)
      while ({ cd.waitSampling(); !m.w.ready.toBoolean }) {}
    }
    m.w.valid #= false
    if (m.config.useLast) m.w.last #= false

    m.b.ready #= true
    while ({ cd.waitSampling(); !m.b.valid.toBoolean }) {}
    val out = (if (m.config.useId) m.b.id.toInt else 0, m.b.resp.toInt)
    m.b.ready #= false
    out
  }

  /** Read `beats` beats and return (per-beat resp, per-beat last, R.id). */
  private def readResp(
    m: Axi4,
    cd: ClockDomain,
    addr: Long,
    id: Int = 0,
    beats: Int = 1,
    qos: Int = 0
  ): (Seq[Int], Seq[Boolean], Int) = {
    m.ar.valid #= true
    m.ar.addr #= addr
    if (m.config.useId) m.ar.id #= id
    if (m.config.useQos) m.ar.qos #= qos
    if (m.config.useLen) m.ar.len #= beats - 1
    if (m.config.useSize) m.ar.size #= 2
    if (m.config.useBurst) m.ar.burst #= 1
    while ({ cd.waitSampling(); !m.ar.ready.toBoolean }) {}
    m.ar.valid #= false

    val resps = mutable.ArrayBuffer[Int]()
    val lasts = mutable.ArrayBuffer[Boolean]()
    var rid   = 0
    var done  = false
    while (!done) {
      m.r.ready #= true
      while ({ cd.waitSampling(); !m.r.valid.toBoolean }) {}
      resps += m.r.resp.toInt
      val isLast = if (m.config.useLast) m.r.last.toBoolean else resps.length == beats
      lasts += isLast
      if (m.config.useId) rid = m.r.id.toInt
      m.r.ready #= false
      done = isLast
    }
    (resps.toSeq, lasts.toSeq, rid)
  }

  private def bringUp(dut: AxiZeroMixedTop): ClockDomain = {
    val cd = dut.clockDomain
    cd.forkStimulus(10)
    for (m <- dut.io.masters) SimHelpers.initMaster(m)
    for (s <- dut.io.slaves) SimHelpers.spawnFullSlave(s, cd)
    cd.waitSampling(5)
    cd
  }

  // ── Blocking crossbar ─────────────────────────────────────────────────────

  test("blocking: an unmapped write is answered with DECERR, not left hanging") {
    simCfg.compile(new AxiZeroMixedTop(fullCfg(maxOutstanding = 1))).doSim { dut =>
      SimTimeout(200000)
      val cd = bringUp(dut)

      val (bid, bresp) = writeResp(dut.io.masters(0), cd, unmapped, id = 6)
      assert(bresp == DECERR, s"expected DECERR (3) for an unmapped write, got $bresp")
      assert(bid == 6, s"B.id echo mismatch: expected 6, got $bid")

      // The fabric has to survive it -- a decode error is an ordinary
      // transaction, not a reason to stop serving the mapped slaves.
      val (okId, okResp) = writeResp(dut.io.masters(0), cd, slave0Base.toLong + 0x40, id = 7)
      assert(okResp == OKAY, s"mapped write after a decode error returned $okResp")
      assert(okId == 7, s"B.id echo mismatch after a decode error: got $okId")
    }
  }

  test("blocking: an unmapped read is answered with DECERR on every beat") {
    simCfg.compile(new AxiZeroMixedTop(fullCfg(maxOutstanding = 1))).doSim { dut =>
      SimTimeout(200000)
      val cd = bringUp(dut)

      val (resps, lasts, rid) = readResp(dut.io.masters(0), cd, unmapped, id = 3)
      assert(resps == Seq(DECERR), s"expected one DECERR beat, got $resps")
      assert(lasts == Seq(true), "the single error beat must assert RLAST")
      assert(rid == 3, s"R.id echo mismatch: expected 3, got $rid")

      val (okResps, _, _) = readResp(dut.io.masters(0), cd, slave0Base.toLong + 0x40)
      assert(okResps == Seq(OKAY), s"mapped read after a decode error returned $okResps")
    }
  }

  // ── Pipelined crossbar ────────────────────────────────────────────────────

  test("pipelined: an unmapped burst read returns len+1 DECERR beats with one RLAST") {
    simCfg.compile(new AxiZeroMixedTop(fullCfg(maxOutstanding = 4))).doSim { dut =>
      SimTimeout(200000)
      val cd = bringUp(dut)

      // A master counts the beats it asked for and waits for RLAST. One error
      // beat in place of eight would hang it just as surely as no answer, so
      // the responder has to see the burst through.
      val (resps, lasts, rid) = readResp(dut.io.masters(0), cd, unmapped, id = 9, beats = 8)
      assert(resps.length == 8, s"expected 8 beats for an 8-beat burst, got ${resps.length}")
      assert(resps.forall(_ == DECERR), s"every beat must be DECERR, got $resps")
      assert(
        lasts == Seq(false, false, false, false, false, false, false, true),
        s"RLAST must land on the final beat only, got $lasts"
      )
      assert(rid == 9, s"R.id echo mismatch: expected 9, got $rid")
    }
  }

  test("pipelined: an unmapped write burst sinks every W beat before answering") {
    simCfg.compile(new AxiZeroMixedTop(fullCfg(maxOutstanding = 4))).doSim { dut =>
      SimTimeout(200000)
      val cd = bringUp(dut)

      // Dropping W beats would leave the W channel out of step with every write
      // that follows, so the beats have to be consumed even though nothing
      // stores them. The mapped write afterwards is what catches it if they are not.
      val (bid, bresp) = writeResp(dut.io.masters(1), cd, unmapped, id = 4, beats = 8)
      assert(bresp == DECERR, s"expected DECERR for an unmapped write burst, got $bresp")
      assert(bid == 4, s"B.id echo mismatch: expected 4, got $bid")

      val (okId, okResp) = writeResp(dut.io.masters(1), cd, slave1Base.toLong + 0x80, id = 5)
      assert(okResp == OKAY, s"mapped write after an errored burst returned $okResp")
      assert(okId == 5, s"B.id echo mismatch after an errored burst: got $okId")
    }
  }

  test("pipelined: the decode error goes back to the master that made it") {
    simCfg.compile(new AxiZeroMixedTop(fullCfg(maxOutstanding = 4))).doSim { dut =>
      SimTimeout(200000)
      val cd = bringUp(dut)

      // The pipelined crossbar routes responses by the master index encoded in
      // the slave-side ID, and the responder is routed through exactly that
      // path. Master 1 is the one that shows a mistake: master 0's expanded ID
      // is zero, so a response that loses the index still reaches it by luck.
      // fork's join returns Unit, so the forked read hands its result back
      // through these instead.
      var resps0 = Seq.empty[Int]
      var rid0   = -1
      val m0 = fork {
        val (r, _, id) = readResp(dut.io.masters(0), cd, slave0Base.toLong + 0x10, id = 1)
        resps0 = r
        rid0 = id
      }
      val (resps1, _, rid1) = readResp(dut.io.masters(1), cd, unmapped2, id = 2)
      m0.join()

      assert(resps1 == Seq(DECERR), s"master 1's unmapped read returned $resps1")
      assert(rid1 == 2, s"master 1 got R.id $rid1, expected its own 2")
      assert(resps0 == Seq(OKAY), s"master 0's mapped read returned $resps0")
      assert(rid0 == 1, s"master 0 got R.id $rid0, expected its own 1")
    }
  }

  // ── Lite crossbar ─────────────────────────────────────────────────────────

  test("lite: unmapped reads and writes are answered with DECERR") {
    val liteCfg = AxiZeroConfig.allLite(
      numMasters = 2,
      numSlaves = 2,
      addrWidth = 32,
      dataWidth = 32,
      addressMap = Seq(slave0Base -> slaveSize, slave1Base -> slaveSize)
    )
    simCfg.compile(new AxiZeroLiteTop(liteCfg)).doSim { dut =>
      SimTimeout(200000)
      val cd = dut.clockDomain
      cd.forkStimulus(10)
      for (m <- dut.io.masters) SimHelpers.initMaster(m)
      for (s <- dut.io.slaves) SimHelpers.spawnLiteSlave(s, cd)
      cd.waitSampling(5)

      val (_, bresp) = writeResp(dut.io.masters(1), cd, unmapped)
      assert(bresp == DECERR, s"expected DECERR for an unmapped Lite write, got $bresp")

      val (resps, _, _) = readResp(dut.io.masters(1), cd, unmapped)
      assert(resps == Seq(DECERR), s"expected DECERR for an unmapped Lite read, got $resps")

      val (_, okResp) = writeResp(dut.io.masters(0), cd, slave0Base.toLong + 0x20)
      assert(okResp == OKAY, s"mapped Lite write after a decode error returned $okResp")
    }
  }

  // ── Arbitration modes ─────────────────────────────────────────────────────
  //
  // The responder is wired in as one more slave, so the per-slave arbitration
  // state -- round-robin pointers, WRR credits, QoS age counters -- all had to
  // grow by one entry to match. Those arrays are indexed by slave, and an
  // off-by-one in any of them would corrupt a real slave's arbitration state
  // rather than raise an error, so every mode gets exercised against the
  // responder and against a mapped slave at the same time.

  /** Both masters transact at once, one unmapped and one mapped, and both must be served. */
  private def bothServed(dut: AxiZeroMixedTop, cd: ClockDomain, mode: String): Unit = {
    var resps0 = Seq.empty[Int]
    var rid0   = -1
    val m0 = fork {
      val (r, _, id) = readResp(dut.io.masters(0), cd, slave0Base.toLong + 0x10, id = 1)
      resps0 = r
      rid0 = id
    }
    val (resps1, _, rid1) = readResp(dut.io.masters(1), cd, unmapped, id = 2)
    m0.join()

    assert(resps1 == Seq(DECERR), s"$mode: master 1's unmapped read returned $resps1")
    assert(rid1 == 2, s"$mode: master 1 got R.id $rid1, expected its own 2")
    assert(resps0 == Seq(OKAY), s"$mode: master 0's mapped read returned $resps0")
    assert(rid0 == 1, s"$mode: master 0 got R.id $rid0, expected its own 1")
  }

  test("qos arbitration: a decode error is served without disturbing the mapped slave") {
    simCfg.compile(new AxiZeroMixedTop(fullCfg(maxOutstanding = 4, arbitration = QosBased))).doSim {
      dut =>
        SimTimeout(200000)
        val cd = bringUp(dut)
        bothServed(dut, cd, "qos")

        // And again with writes, which use the separate write-side QoS age array.
        val (bid, bresp) = writeResp(dut.io.masters(1), cd, unmapped, id = 8)
        assert(bresp == DECERR, s"qos: unmapped write returned $bresp")
        assert(bid == 8, s"qos: B.id echo mismatch, got $bid")
        val (okId, okResp) = writeResp(dut.io.masters(0), cd, slave0Base.toLong + 0x60, id = 9)
        assert(okResp == OKAY, s"qos: mapped write after a decode error returned $okResp")
        assert(okId == 9, s"qos: B.id echo mismatch after a decode error, got $okId")
    }
  }

  test("weighted round-robin: a decode error is served without disturbing the mapped slave") {
    val wrr = WeightedRoundRobin(Seq(3, 1))
    simCfg.compile(new AxiZeroMixedTop(fullCfg(maxOutstanding = 4, arbitration = wrr))).doSim {
      dut =>
        SimTimeout(200000)
        val cd = bringUp(dut)
        bothServed(dut, cd, "wrr")

        val (bid, bresp) = writeResp(dut.io.masters(1), cd, unmapped, id = 8)
        assert(bresp == DECERR, s"wrr: unmapped write returned $bresp")
        assert(bid == 8, s"wrr: B.id echo mismatch, got $bid")
        val (okId, okResp) = writeResp(dut.io.masters(0), cd, slave0Base.toLong + 0x60, id = 9)
        assert(okResp == OKAY, s"wrr: mapped write after a decode error returned $okResp")
        assert(okId == 9, s"wrr: B.id echo mismatch after a decode error, got $okId")
    }
  }

  test("blocking mode arbitrates the responder too") {
    // The blocking datapath routes responses by remembered grant rather than by
    // ID, so it reaches the responder through a different path than every
    // pipelined test above.
    simCfg.compile(new AxiZeroMixedTop(fullCfg(maxOutstanding = 1, arbitration = QosBased))).doSim {
      dut =>
        SimTimeout(200000)
        val cd = bringUp(dut)
        bothServed(dut, cd, "blocking+qos")
    }
  }

  test("two masters erroring at once are both answered") {
    simCfg.compile(new AxiZeroMixedTop(fullCfg(maxOutstanding = 4))).doSim { dut =>
      SimTimeout(200000)
      val cd = bringUp(dut)

      // The responder takes one transaction per direction at a time and holds
      // READY low until it is done, so two masters erroring together have to
      // serialise. Both still have to come back, each with its own ID -- losing
      // the second is the failure this catches.
      var resps0 = Seq.empty[Int]
      var rid0   = -1
      val m0 = fork {
        val (r, _, id) = readResp(dut.io.masters(0), cd, unmapped, id = 5)
        resps0 = r
        rid0 = id
      }
      val (resps1, _, rid1) = readResp(dut.io.masters(1), cd, unmapped2, id = 6)
      m0.join()

      assert(resps0 == Seq(DECERR), s"master 0's unmapped read returned $resps0")
      assert(resps1 == Seq(DECERR), s"master 1's unmapped read returned $resps1")
      assert(rid0 == 5, s"master 0 got R.id $rid0, expected its own 5")
      assert(rid1 == 6, s"master 1 got R.id $rid1, expected its own 6")

      // Writes contend on the other engine; both must complete as well.
      var b0 = (-1, -1)
      val w0 = fork { b0 = writeResp(dut.io.masters(0), cd, unmapped, id = 10) }
      val b1 = writeResp(dut.io.masters(1), cd, unmapped2, id = 11)
      w0.join()

      assert(b0 == (10, DECERR), s"master 0's unmapped write returned $b0")
      assert(b1 == (11, DECERR), s"master 1's unmapped write returned $b1")
    }
  }

  // ── QoS ranking at the responder ──────────────────────────────────────────
  // The responder is wired in as one more slave, so it owns an entry in the
  // per-slave QoS age arrays the crossbar resized to make room for it. Those
  // entries are only reached when two masters contend *at the responder* and
  // their AXQOS actually differ. A decode error racing a mapped access never
  // touches them, because each slave then has exactly one requester -- which is
  // what the two tests above do, and why they do not cover this.

  /** Both masters hit unmapped addresses on a common start; returns completion times, responses and
    * echoed IDs for each.
    */
  private def raceAtResponder(
    dut: AxiZeroMixedTop,
    cd: ClockDomain,
    qos0: Int,
    qos1: Int,
    write: Boolean
  ): (Long, Long, Int, Int, Int, Int) = {
    var go                     = false
    var t0                     = 0L
    var t1                     = 0L
    var resp0, resp1, id0, id1 = -1

    val f0 = fork {
      while (!go) cd.waitSampling()
      if (write) {
        val (b, r) = writeResp(dut.io.masters(0), cd, unmapped, id = 5, qos = qos0)
        id0 = b; resp0 = r
      } else {
        val (r, _, i) = readResp(dut.io.masters(0), cd, unmapped, id = 5, qos = qos0)
        resp0 = r.head; id0 = i
      }
      t0 = simTime()
    }
    val f1 = fork {
      while (!go) cd.waitSampling()
      if (write) {
        val (b, r) = writeResp(dut.io.masters(1), cd, unmapped2, id = 6, qos = qos1)
        id1 = b; resp1 = r
      } else {
        val (r, _, i) = readResp(dut.io.masters(1), cd, unmapped2, id = 6, qos = qos1)
        resp1 = r.head; id1 = i
      }
      t1 = simTime()
    }

    cd.waitSampling()
    go = true
    f0.join()
    f1.join()
    (t0, t1, resp0, resp1, id0, id1)
  }

  /** Race both masters at the responder twice on fresh state, once with each master holding the
    * higher AXQOS. Asserting only one direction would pass just as well against an arbiter with a
    * fixed bias toward one port, which is precisely the bug worth catching here.
    */
  private def qosDecidesAtResponder(
    compiled: SimCompiled[AxiZeroMixedTop],
    write: Boolean
  ): Unit = {
    val kind = if (write) "write" else "read"

    compiled.doSim { dut =>
      SimTimeout(200000)
      val cd = bringUp(dut)
      assert(dut.io.masters(0).config.useQos, "this test is vacuous without AXQOS on the port")
      val (t0, t1, r0, r1, i0, i1) = raceAtResponder(dut, cd, qos0 = 1, qos1 = 14, write = write)
      assert(r0 == DECERR && r1 == DECERR, s"both unmapped ${kind}s must DECERR, got $r0 and $r1")
      assert(i0 == 5 && i1 == 6, s"each master must get its own id back, got $i0 and $i1")
      assert(t1 < t0, s"$kind: QoS 14 on master 1 should win: t0=$t0 t1=$t1")
    }

    compiled.doSim { dut =>
      SimTimeout(200000)
      val cd                       = bringUp(dut)
      val (t0, t1, r0, r1, i0, i1) = raceAtResponder(dut, cd, qos0 = 14, qos1 = 1, write = write)
      assert(r0 == DECERR && r1 == DECERR, s"both unmapped ${kind}s must DECERR, got $r0 and $r1")
      assert(i0 == 5 && i1 == 6, s"each master must get its own id back, got $i0 and $i1")
      assert(t0 < t1, s"$kind: QoS 14 on master 0 should win: t0=$t0 t1=$t1")
    }
  }

  test("qos: AXQOS decides which master the responder serves first (reads)") {
    qosDecidesAtResponder(
      simCfg.compile(new AxiZeroMixedTop(fullCfg(maxOutstanding = 4, arbitration = QosBased))),
      write = false
    )
  }

  test("qos: AXQOS decides which master the responder serves first (writes)") {
    // Writes rank through a separate per-slave age array from reads, so the
    // responder's entry in it is only reached here.
    qosDecidesAtResponder(
      simCfg.compile(new AxiZeroMixedTop(fullCfg(maxOutstanding = 4, arbitration = QosBased))),
      write = true
    )
  }

  // ── The failure mode the responder exists to prevent ──────────────────────

  test("with the responder disabled, an unmapped write is never acknowledged") {
    simCfg.compile(new AxiZeroMixedTop(fullCfg(maxOutstanding = 4, decErr = false))).doSim { dut =>
      SimTimeout(200000)
      val cd = bringUp(dut)

      // This is the old behaviour, kept reachable by config and pinned here so
      // the hazard stays documented: AWVALID is asserted and simply never
      // accepted. Nothing times out, and nothing reports an error -- the port
      // is just gone.
      val m = dut.io.masters(0)
      m.aw.valid #= true
      m.aw.addr #= unmapped
      m.aw.id #= 1
      m.aw.len #= 0
      m.aw.size #= 2
      m.aw.burst #= 1

      var accepted = false
      for (_ <- 0 until 500) {
        cd.waitSampling()
        if (m.aw.ready.toBoolean) accepted = true
      }
      m.aw.valid #= false
      assert(
        !accepted,
        "AWREADY was asserted for an unmapped address with decodeErrorResponse off; " +
          "the test no longer pins the failure mode it is meant to describe"
      )
    }
  }
}
