// Copyright (c) 2026 Leonardo Capossio - bard0 design  hello@bard0.com
// SPDX-License-Identifier: MIT
package axizero.sim

import scala.collection.mutable
import org.scalatest.funsuite.AnyFunSuite
import spinal.core._
import spinal.core.sim._
import spinal.lib._
import spinal.lib.bus.amba4.axi._
import axizero._
import axizero.verif._

// ---------------------------------------------------------------------------
// AxiMultiIdGenSpec  —  the multi-ID generator has to be trustworthy before it
// can decide whether a board passed.
//
// AxiMultiIdGen is the only thing in this repository that varies its ID on
// hardware, and its verdict is what a bitstream reports. A generator that
// checks nothing looks exactly like a generator that checks everything, so
// these tests pin down both halves:
//
//   1. Against two working RAMs behind the crossbar it reports no errors and
//      keeps lapping, and its own traffic passes the protocol checker.
//   2. It saw the traffic it claims: two IDs outstanding at once, and one ID
//      with bursts in flight for both slaves. Without those, a clean run
//      proves nothing about ordering.
//   3. It catches a RAM that drops a byte lane.
//   4. It catches a fabric that answers two same-ID reads in the wrong order
//      -- the failure the whole design exists to detect, and one no other
//      test here can produce, because the crossbar under test will not do it.
//   5. It notices a fabric that stops answering, rather than reporting the
//      clean counters it had when the answers stopped.
//
// Test 4 is the one worth the most. It replaces the crossbar with a slave
// model that deliberately swaps two same-ID responses, each carrying data
// that is correct for the burst it belongs to. Everything is individually
// plausible; only the order is wrong.
// ---------------------------------------------------------------------------
class AxiMultiIdGenSpec extends AnyFunSuite {

  private val spinalCfg = SpinalConfig(
    defaultConfigForClockDomains = ClockDomainConfig(
      clockEdge = RISING,
      resetKind = SYNC,
      resetActiveLevel = LOW
    )
  )

  private def simCfg = SimConfig.withConfig(spinalCfg)

  private val axiCfg = Axi4Config(addressWidth = 32, dataWidth = 32, idWidth = 4)

  private val regionA = BigInt(0x000)
  private val regionB = BigInt(0x200)
  private val ramSize = 0x200

  /** The write-only region: an address no slave claims, which the crossbar's own decode-error
    * responder answers. It is what gives a write response an identity -- between two slaves that
    * both answer OKAY, a B swapped between two waiting IDs is the same bits as a correct one -- and
    * because that responder is already part of every fabric it costs the design nothing.
    */
  private val regionE = BigInt(0x400)

  private def genCfg(
    windowWords: Int = 32,
    idCount: Int = 4,
    outstandingPerId: Int = 2,
    respStall: Int = 0,
    continuous: Boolean = true,
    passes: Int = 4,
    hangCycles: Int = 2000,
    errRegionBase: Option[BigInt] = None
  ) = AxiMultiIdGenConfig(
    regionABase = regionA,
    regionBBase = regionB,
    errRegionBase = errRegionBase,
    windowWords = windowWords,
    idCount = idCount,
    dataPattern = 0xd1000000L,
    passes = passes,
    maxBurstLen = 4,
    outstandingPerId = outstandingPerId,
    continuous = continuous,
    respStall = respStall,
    hangCycles = hangCycles
  )

  // ── Harness: generator -> checker -> crossbar -> two RAMs ─────────────────
  private class XbarHarness(cfg: AxiMultiIdGenConfig, breakSlave: Int = -1) extends Component {
    val io = new Bundle {
      val dataErrors      = out UInt (8 bits)
      val respErrors      = out UInt (8 bits)
      val orderErrors     = out UInt (8 bits)
      val laps            = out UInt (16 bits)
      val stalled         = out Bool ()
      val multiIdSeen     = out Bool ()
      val crossSlaveTried = out Bool ()
      val errRespSeen     = out Bool ()
      val violation       = out Bits (Axi4ProtocolChecker.ruleCount bits)
      val overflow        = out Bool ()
    }

    // regionE is deliberately absent from this map. The crossbar's decode-error
    // responder owns every address no slave claimed, so a write there is
    // accepted, its beats are sunk and it is answered DECERR -- which is the
    // whole arrangement the boards use, tested here as they run it.
    val xbar = new AxiZeroMixedTop(
      AxiZeroConfig(
        masters = Seq(MasterPort(axiCfg, FullAxi4)),
        slaves = Seq(
          SlavePort(axiCfg, FullAxi4, regionA, BigInt(ramSize)),
          SlavePort(axiCfg, FullAxi4, regionB, BigInt(ramSize))
        ),
        arbitration = RoundRobin,
        maxOutstanding = 4
      )
    )

    val gen = new AxiMultiIdGen(axiCfg, cfg)
    xbar.io.masters(0) << gen.io.axi

    val check = Axi4ProtocolChecker(gen.io.axi, "multiIdGen")

    for (si <- 0 until 2) {
      val ram = Axi4SharedOnChipRam(dataWidth = 32, byteCount = ramSize, idWidth = axiCfg.idWidth)
      ram.ram.init(Seq.fill(ramSize / 4)(B(0, 32 bits)))
      val toRam = xbar.io.slaves(si).toShared()
      ram.io.axi << toRam
      // The cheapest way to make a RAM lie without touching the generator.
      if (si == breakSlave) {
        ram.io.axi.writeData.strb.allowOverride := toRam.writeData.strb & B"0111"
      }
    }

    io.dataErrors      := gen.io.dataErrors
    io.respErrors      := gen.io.respErrors
    io.orderErrors     := gen.io.orderErrors
    io.laps            := gen.io.laps
    io.stalled         := gen.io.stalled
    io.multiIdSeen     := gen.io.multiIdSeen
    io.crossSlaveTried := gen.io.crossSlaveTried
    io.errRespSeen     := gen.io.errRespSeen
    io.violation       := check.sticky
    io.overflow        := check.overflow
  }

  // ── Harness: the generator's bus brought out for a Scala slave model ──────
  // Nothing between the generator and the model, so the model decides what
  // every response is and in what order it arrives. That is how a reordering
  // fabric is produced: the crossbar under test will not produce one.
  private class BareHarness(cfg: AxiMultiIdGenConfig) extends Component {
    val io = new Bundle {
      val axi             = master(Axi4(axiCfg))
      val dataErrors      = out UInt (8 bits)
      val respErrors      = out UInt (8 bits)
      val orderErrors     = out UInt (8 bits)
      val laps            = out UInt (16 bits)
      val stalled         = out Bool ()
      val multiIdSeen     = out Bool ()
      val crossSlaveTried = out Bool ()
      val errRespSeen     = out Bool ()
    }

    val gen = new AxiMultiIdGen(axiCfg, cfg)
    io.axi <> gen.io.axi

    io.errRespSeen := gen.io.errRespSeen

    io.dataErrors      := gen.io.dataErrors
    io.respErrors      := gen.io.respErrors
    io.orderErrors     := gen.io.orderErrors
    io.laps            := gen.io.laps
    io.stalled         := gen.io.stalled
    io.multiIdSeen     := gen.io.multiIdSeen
    io.crossSlaveTried := gen.io.crossSlaveTried
  }

  private def decode(sticky: BigInt): String =
    Axi4ProtocolChecker.decode(sticky).mkString(", ")

  /** A RAM that can be told to answer two same-ID reads in the wrong order.
    *
    * It is a working memory in every other respect: writes land where their AW said, and each read
    * burst carries exactly the words held at its own address. With `swapSameId` set, whenever two
    * queued read bursts share an ID the younger one is answered first -- individually plausible
    * responses in an order AXI4 forbids.
    */
  private class ReorderingRam(
    axi: Axi4,
    cd: ClockDomain,
    swapSameId: Boolean,
    errBase: Option[Long] = None,
    swapBId: Boolean = false
  ) {
    val mem = mutable.HashMap[Long, Long]()

    private val wData   = mutable.Queue[Long]()
    private val awQueue = mutable.Queue[(Long, Int, Int)]() // addr, len, id
    private val arQueue = mutable.ArrayBuffer[(Long, Int, Int)]()
    private val bQueue  = mutable.ArrayBuffer[(Int, Int)]() // id, resp

    private def isErr(addr: Long): Boolean = errBase.exists(b => addr >= b && addr < b + 0x100)

    axi.aw.ready #= true
    axi.w.ready #= true
    axi.ar.ready #= true
    axi.b.valid #= false
    axi.r.valid #= false

    cd.onSamplings {
      if (axi.aw.valid.toBoolean && axi.aw.ready.toBoolean) {
        awQueue.enqueue((axi.aw.addr.toLong, axi.aw.len.toInt, axi.aw.id.toInt))
      }
      if (axi.w.valid.toBoolean && axi.w.ready.toBoolean) wData.enqueue(axi.w.data.toLong)
      if (axi.ar.valid.toBoolean && axi.ar.ready.toBoolean) {
        arQueue += ((axi.ar.addr.toLong, axi.ar.len.toInt, axi.ar.id.toInt))
      }
    }

    // Writes: a burst's beats are the next (len + 1) on the W queue, because W
    // carries no ID and belongs to the AWs in issue order.
    fork {
      while (true) {
        cd.waitSamplingWhere(awQueue.nonEmpty && wData.size > awQueue.head._2)
        val (addr, len, id) = awQueue.dequeue()
        // The error region stores nothing and answers SLVERR, exactly as the
        // mapped responder does in hardware. Its beats are still taken off the
        // W queue, because W carries no ID and the beats that follow belong to
        // the next address.
        if (isErr(addr)) {
          for (_ <- 0 to len) wData.dequeue()
          bQueue += ((id, 3)) // DECERR, as the decode-error responder gives
        } else {
          for (i <- 0 to len) mem(addr + i * 4) = wData.dequeue()
          bQueue += ((id, 0))
        }
      }
    }

    fork {
      while (true) {
        cd.waitSamplingWhere(bQueue.nonEmpty)
        // A BID exchanged between two IDs that are both waiting: each response
        // still arrives, each ID still has one outstanding write to retire, and
        // every count stays consistent. Only the labels are crossed -- which is
        // why nothing but a per-ID expectation can see it.
        if (swapBId) {
          cd.waitSamplingWhere(bQueue.size >= 2)
          if (bQueue(0)._1 != bQueue(1)._1) {
            val (id0, resp0) = bQueue(0)
            val (id1, resp1) = bQueue(1)
            bQueue(0) = ((id1, resp0))
            bQueue(1) = ((id0, resp1))
          }
        }
        val (id, resp) = bQueue.head
        axi.b.valid #= true
        axi.b.id #= id
        axi.b.resp #= resp
        cd.waitSamplingWhere(axi.b.ready.toBoolean)
        bQueue.remove(0)
        axi.b.valid #= false
      }
    }

    /** Which queued read to answer next: the younger of the first same-ID pair when reordering, the
      * oldest otherwise.
      */
    private def pick(): Int = {
      if (swapSameId) {
        for (i <- arQueue.indices; j <- (i + 1) until arQueue.size) {
          if (arQueue(i)._3 == arQueue(j)._3) return j
        }
      }
      0
    }

    fork {
      while (true) {
        cd.waitSamplingWhere(arQueue.nonEmpty)
        // Wait for a second request to be available before choosing, so a
        // reordering model actually has something to reorder.
        if (swapSameId) cd.waitSamplingWhere(arQueue.size >= 2)
        val idx             = pick()
        val (addr, len, id) = arQueue.remove(idx)
        for (i <- 0 to len) {
          axi.r.valid #= true
          axi.r.id #= id
          axi.r.data #= mem.getOrElse(addr + i * 4, 0L)
          axi.r.resp #= 0
          axi.r.last #= (i == len)
          cd.waitSamplingWhere(axi.r.ready.toBoolean)
        }
        axi.r.valid #= false
      }
    }
  }

  // ── 1. A clean run, and evidence that the traffic was what it claims ──────
  test("against two working slaves it laps with no errors, and saw multi-ID traffic") {
    simCfg.compile(new XbarHarness(genCfg(respStall = 4))).doSim("multiid_clean") { dut =>
      SimTimeout(4000000)
      dut.clockDomain.forkStimulus(10)
      // Registers come up randomised in SpinalSim and clear on the first
      // clocked reset, so nothing is read until that has happened.
      dut.clockDomain.waitSampling(5)
      dut.clockDomain.waitSamplingWhere(dut.io.laps.toInt >= 2)

      assert(dut.io.dataErrors.toInt == 0, s"${dut.io.dataErrors.toInt} data errors")
      assert(dut.io.respErrors.toInt == 0, s"${dut.io.respErrors.toInt} response errors")
      assert(dut.io.orderErrors.toInt == 0, s"${dut.io.orderErrors.toInt} ordering errors")
      assert(!dut.io.stalled.toBoolean, "the generator stalled against a working fabric")
      assert(
        dut.io.violation.toBigInt == 0,
        s"the generator's own traffic broke AXI4: ${decode(dut.io.violation.toBigInt)}"
      )
      assert(!dut.io.overflow.toBoolean, "the protocol checker lost track")

      // The load, asserted rather than assumed.
      assert(dut.io.multiIdSeen.toBoolean, "no two IDs were ever outstanding at once")
      assert(
        dut.io.crossSlaveTried.toBoolean,
        "no ID ever asked to move to the other slave while it was still live at one -- the " +
          "single-slave-per-ID rule was never put under load"
      )
    }
  }

  // ── 2. A RAM that drops a byte lane ──────────────────────────────────────
  test("a slave that drops a byte lane is caught") {
    simCfg.compile(new XbarHarness(genCfg(), breakSlave = 1)).doSim("multiid_broken_ram") { dut =>
      SimTimeout(4000000)
      dut.clockDomain.forkStimulus(10)
      // Registers come up randomised in SpinalSim and clear on the first
      // clocked reset, so nothing is read until that has happened.
      dut.clockDomain.waitSampling(5)
      dut.clockDomain.waitSamplingWhere(dut.io.dataErrors.toInt != 0 || dut.io.laps.toInt >= 2)
      assert(
        dut.io.dataErrors.toInt != 0,
        "a RAM dropping its top byte lane went unreported, so a clean run means nothing"
      )
    }
  }

  // ── 3. Two same-ID reads answered in the wrong order ─────────────────────
  test("two same-ID reads answered out of order are caught") {
    simCfg.compile(new BareHarness(genCfg(outstandingPerId = 2))).doSim("multiid_reordered") {
      dut =>
        SimTimeout(4000000)
        val cd = dut.clockDomain
        new ReorderingRam(dut.io.axi, cd, swapSameId = true)
        cd.forkStimulus(10)
        cd.waitSampling(5)
        cd.waitSamplingWhere(
          dut.io.dataErrors.toInt != 0 || dut.io.orderErrors.toInt != 0 ||
            dut.io.laps.toInt >= 1 || dut.io.stalled.toBoolean
        )
        assert(
          dut.io.dataErrors.toInt != 0 || dut.io.orderErrors.toInt != 0,
          "a slave that answered two same-ID reads in the wrong order went unreported -- " +
            "the ordering check on the board proves nothing"
        )
    }
  }

  // ── 4. The same model answering in order is clean ────────────────────────
  // The control for test 3: the reordering is what fails it, not the model.
  test("the same slave model answering in order reports nothing") {
    simCfg.compile(new BareHarness(genCfg(outstandingPerId = 2))).doSim("multiid_in_order") { dut =>
      SimTimeout(4000000)
      val cd = dut.clockDomain
      new ReorderingRam(dut.io.axi, cd, swapSameId = false)
      cd.forkStimulus(10)
      cd.waitSampling(5)
      cd.waitSamplingWhere(dut.io.laps.toInt >= 1 || dut.io.dataErrors.toInt != 0)
      assert(dut.io.dataErrors.toInt == 0, s"${dut.io.dataErrors.toInt} data errors in order")
      assert(dut.io.orderErrors.toInt == 0, s"${dut.io.orderErrors.toInt} ordering errors in order")
    }
  }

  // ── 5. The write side given something to compare against ─────────────────
  // A write response carries an ID and two bits of status and nothing else, so
  // between two slaves that both answer OKAY a B swapped between two waiting
  // IDs is bit-for-bit a correct one. A third region that answers SLVERR gives
  // each response an identity: this run proves the fabric delivers each answer
  // to the ID that is owed it, with the error region actually answering.
  test("an unmapped write region answers, and every response reaches the ID it is owed") {
    simCfg
      .compile(new XbarHarness(genCfg(respStall = 4, errRegionBase = Some(regionE))))
      .doSim("multiid_errregion") { dut =>
        SimTimeout(4000000)
        dut.clockDomain.forkStimulus(10)
        dut.clockDomain.waitSampling(5)
        dut.clockDomain.waitSamplingWhere(dut.io.laps.toInt >= 2)

        assert(dut.io.dataErrors.toInt == 0, s"${dut.io.dataErrors.toInt} data errors")
        assert(
          dut.io.respErrors.toInt == 0,
          s"${dut.io.respErrors.toInt} write responses went to an ID that was not owed them"
        )
        assert(dut.io.orderErrors.toInt == 0, s"${dut.io.orderErrors.toInt} ordering errors")
        assert(!dut.io.stalled.toBoolean, "the generator stalled against a working fabric")
        assert(
          dut.io.errRespSeen.toBoolean,
          "no error ever came back, so the write-response check was never put to work and a " +
            "clean result proves nothing"
        )
        // DECERR is a legal answer, and a checker that called it a violation
        // would make this whole arrangement unusable on a board.
        assert(
          dut.io.violation.toBigInt == 0,
          s"the run broke AXI4: ${decode(dut.io.violation.toBigInt)}"
        )
        assert(!dut.io.overflow.toBoolean, "the protocol checker lost track")
      }
  }

  // ── 6. A pair of BIDs exchanged between two waiting IDs ──────────────────
  // The failure the read-back cannot reach: the data still lands at the address
  // its AW named, so memory is correct and reads back correct. Only the label
  // on the response is wrong.
  test("a pair of BIDs exchanged between two waiting IDs is caught") {
    simCfg
      .compile(
        new BareHarness(genCfg(outstandingPerId = 2, errRegionBase = Some(regionE)))
      )
      .doSim("multiid_bid_swap") { dut =>
        SimTimeout(8000000)
        val cd = dut.clockDomain
        new ReorderingRam(
          dut.io.axi,
          cd,
          swapSameId = false,
          errBase = Some(regionE.toLong),
          swapBId = true
        )
        cd.forkStimulus(10)
        cd.waitSampling(5)
        cd.waitSamplingWhere(
          dut.io.respErrors.toInt != 0 || dut.io.laps.toInt >= 2 || dut.io.stalled.toBoolean
        )
        assert(
          dut.io.respErrors.toInt != 0,
          "a fabric that exchanged two BIDs went unreported -- the write side of the board check " +
            "proves nothing about where a response went"
        )
      }
  }

  // ── 7. The same model leaving the labels alone ───────────────────────────
  // The control for test 6: the exchange is what fails it, not the error region
  // or the model. It also fixes what test 6 does NOT claim -- a swap between two
  // responses that are both OKAY stays invisible here, because the two traces
  // are the same bits. That is AXI, not this fabric.
  test("the same model leaving the labels alone reports nothing") {
    simCfg
      .compile(
        new BareHarness(genCfg(outstandingPerId = 2, errRegionBase = Some(regionE)))
      )
      .doSim("multiid_bid_intact") { dut =>
        SimTimeout(8000000)
        val cd = dut.clockDomain
        new ReorderingRam(
          dut.io.axi,
          cd,
          swapSameId = false,
          errBase = Some(regionE.toLong),
          swapBId = false
        )
        cd.forkStimulus(10)
        cd.waitSampling(5)
        cd.waitSamplingWhere(dut.io.laps.toInt >= 1 || dut.io.respErrors.toInt != 0)
        assert(
          dut.io.respErrors.toInt == 0,
          s"${dut.io.respErrors.toInt} response errors against a model that labelled every B " +
            "correctly"
        )
        assert(
          dut.io.errRespSeen.toBoolean,
          "the error region never answered, so the control proves nothing either"
        )
        assert(dut.io.dataErrors.toInt == 0, s"${dut.io.dataErrors.toInt} data errors")
      }
  }

  // ── 8. A fabric that stops answering ─────────────────────────────────────
  test("a fabric that stops answering is reported as a stall") {
    simCfg.compile(new BareHarness(genCfg(hangCycles = 64))).doSim("multiid_stall") { dut =>
      SimTimeout(400000)
      val cd = dut.clockDomain
      // Accept addresses and data, answer nothing.
      dut.io.axi.aw.ready #= true
      dut.io.axi.w.ready #= true
      dut.io.axi.ar.ready #= true
      dut.io.axi.b.valid #= false
      dut.io.axi.r.valid #= false
      cd.forkStimulus(10)
      cd.waitSampling(5)
      cd.waitSamplingWhere(dut.io.stalled.toBoolean || dut.io.laps.toInt >= 1)
      assert(
        dut.io.stalled.toBoolean,
        "a fabric that took the traffic and never answered was not reported as a stall"
      )
      assert(dut.io.dataErrors.toInt == 0, "a stall is not a data error")
    }
  }
}
