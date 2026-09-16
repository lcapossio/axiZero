// Copyright (c) 2026 Leonardo Capossio — bard0 design  hello@bard0.com
// SPDX-License-Identifier: MIT
package axizero.sim

import scala.collection.mutable
import scala.util.Random
import org.scalatest.funsuite.AnyFunSuite
import spinal.core._
import spinal.core.sim._
import spinal.lib.bus.amba4.axi.Axi4Config
import axizero._

// ---------------------------------------------------------------------------
// MultiIdOrderingSpec  —  random traffic from a master that uses more than one ID
//
// AXI4 orders transactions that share an ID and a direction: they complete in
// the order they were issued, whichever slave each one went to. Transactions of
// different IDs are unordered and may complete in any order at all. The fabric
// keeps the first promise by holding the live transactions of one ID to a
// single slave at a time, which is the scheme every production interconnect
// uses, and it is the only part of the design whose correctness depends on a
// master actually varying its ID.
//
// Nothing else here does. Every other master in the repository, simulated or
// synthesised, drives one constant ID -- VexRiscv included -- so the ordering
// table has only ever been exercised in the degenerate shape where a master
// owns exactly one thread. This spec is the multi-ID coverage: four IDs, two
// slaves, both directions at once, randomised response latency and randomised
// backpressure from the master, checked against a per-ID scoreboard.
//
// The read side checks the promise directly: for each ID it holds the bursts
// issued under that ID in order, and every R beat must be the next word of the
// one at the head. A read answered out of order, answered under the wrong ID,
// or never answered fails here.
//
// The write side cannot be checked that way and does not claim to be. B carries
// an ID and a response and nothing else, so two same-ID writes answered in the
// wrong order are indistinguishable. What it checks instead is where the data
// went: every beat is unique to its address, and every address written is read
// back out of the slave models at the end. That catches a burst steered to the
// wrong slave, a dropped beat and a shifted one. The ordering rule itself, on
// the write side, is what ResponseStabilitySpec tests directly.
//
// The seed is fixed so a failure is reproducible.
// ---------------------------------------------------------------------------
class MultiIdOrderingSpec extends AnyFunSuite {

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

  // Reads and writes work in separate windows of each slave so a write landing
  // between a read's issue and its answer cannot change what the read expects.
  private val readWin  = 0x0000
  private val writeWin = 0x0800
  private val winWords = 64

  // Two ID bits, so four IDs over two threads: an ID arriving with both threads
  // busy has to wait for one, which is the case a single-ID master never makes.
  private val masterCfg = Axi4Config(addressWidth = 32, dataWidth = 32, idWidth = 2)
  private val slaveCfg  = Axi4Config(addressWidth = 32, dataWidth = 32, idWidth = 2)

  private def cfgMultiId = AxiZeroConfig(
    masters = Seq(MasterPort(masterCfg, FullAxi4)),
    slaves = Seq(
      SlavePort(slaveCfg, FullAxi4, s0Base, slaveSize),
      SlavePort(slaveCfg, FullAxi4, s1Base, slaveSize)
    ),
    maxOutstanding = 4,
    idThreads = 2
  )

  /** `waitSampling` with a limit: false if `cond` never came, so a wedged fabric fails here rather
    * than hanging sbt.
    */
  private def waitUpTo(cd: ClockDomain, limit: Int)(cond: => Boolean): Boolean = {
    // Checked before the first wait: what is being waited for may already have
    // happened in the cycle that led here, and a beat taken then is gone.
    if (cond) return true
    var n = 0
    while ({ cd.waitSampling(); n += 1; !cond && n < limit }) {}
    cond
  }

  private def wordOf(addr: Long): Long = 0xc0de0000L | (addr & 0xffffL)

  test("four IDs over two slaves keep same-ID order under random latency") {
    simCfg.compile(new AxiZeroMixedTop(cfgMultiId)).doSim("multi_id_random", seed = 0x5eed) { dut =>
      SimTimeout(2000000)
      val cd  = dut.clockDomain
      val m   = dut.io.masters(0)
      val rnd = new Random(0x5eed)

      SimHelpers.initMaster(m)
      // Different stalls per slave, so a read at one is routinely still in
      // flight when a read at the other has already been answered.
      val mem0 = SimHelpers.spawnFullSlave(dut.io.slaves(0), cd, stallR = 1)
      val mem1 = SimHelpers.spawnFullSlave(dut.io.slaves(1), cd, stallW = 2, stallR = 4)
      for (w <- 0 until winWords) {
        val off = (readWin + w * 4).toLong
        mem0(off) = wordOf(off)
        mem1((s1Base.toLong + off)) = wordOf(s1Base.toLong + off)
      }
      cd.forkStimulus(10)
      cd.waitSampling(5)

      val ids     = 4
      val nReads  = 120
      val nWrites = 80
      // Per ID, the bursts issued under it, oldest first: each is the sequence
      // of words its R beats must carry.
      val rdExpect = Array.fill(ids)(mutable.Queue[mutable.Queue[Long]]())
      val wrExpect = Array.fill(ids)(mutable.Queue[Long]())
      val failures = mutable.ArrayBuffer[String]()
      // What each written address should hold when the run is over. B carries
      // nothing but an ID, so counting B responses proves almost nothing on its
      // own -- a burst delivered to the wrong slave, a beat dropped, or a beat
      // sent twice all still produce the expected number of them. The data is
      // where those show up, so every beat is unique to its address and the
      // slave models' own memories are checked at the end. Addresses repeat
      // across the run, so a write overwritten by a later one at the same
      // address is the case this cannot see.
      val wrModel = mutable.HashMap[Long, Long]()
      var rBeats  = 0
      var bSeen   = 0
      // Every beat the writer offers, so the totals the fabric took can be
      // compared against what was issued rather than only against each other.
      var nWrBeats = 0
      var awFires  = 0
      var wFires   = 0

      // ── Response scoreboards ───────────────────────────────────────────
      cd.onSamplings {
        if (m.r.valid.toBoolean && m.r.ready.toBoolean) {
          val id   = m.r.id.toInt
          val data = m.r.payload.data.toLong
          rBeats += 1
          if (rdExpect(id).isEmpty) {
            failures += f"R beat 0x$data%08X arrived under id $id with nothing outstanding"
          } else {
            val burst = rdExpect(id).head
            val want  = burst.dequeue()
            if (data != want) {
              failures += f"id $id: expected 0x$want%08X, got 0x$data%08X"
            }
            val last = m.r.last.toBoolean
            if (last != burst.isEmpty) {
              failures += s"id $id: RLAST was $last with ${burst.size} beats still due"
            }
            if (burst.isEmpty) rdExpect(id).dequeue()
          }
        }
        if (m.aw.valid.toBoolean && m.aw.ready.toBoolean) awFires += 1
        if (m.w.valid.toBoolean && m.w.ready.toBoolean) wFires += 1
        if (m.b.valid.toBoolean && m.b.ready.toBoolean) {
          val id = m.b.id.toInt
          bSeen += 1
          if (wrExpect(id).isEmpty) failures += s"B arrived under id $id with nothing outstanding"
          else wrExpect(id).dequeue()
        }
      }

      // Random backpressure on both response channels: the fabric has to hold
      // its pick while the master is not looking.
      fork {
        while (true) {
          m.r.ready #= rnd.nextInt(4) != 0
          m.b.ready #= rnd.nextInt(4) != 0
          cd.waitSampling(1 + rnd.nextInt(3))
        }
      }

      // ── Read driver ────────────────────────────────────────────────────
      val reader = fork {
        for (_ <- 0 until nReads) {
          val id   = rnd.nextInt(ids)
          val len  = rnd.nextInt(4)
          val base = if (rnd.nextBoolean()) s0Base else s1Base
          // Keep the burst inside the window so the model's addresses stay put.
          val word = rnd.nextInt(winWords - len)
          val addr = base + readWin + word * 4
          val want = mutable.Queue[Long]()
          for (i <- 0 to len) want.enqueue(wordOf((addr + i * 4).toLong))
          // Enqueued before the handshake: the answer can arrive on the very
          // cycle the address is taken, and the scoreboard has to be ready.
          rdExpect(id).enqueue(want)
          m.ar.valid #= true
          m.ar.addr #= addr
          m.ar.id #= id
          m.ar.len #= len
          m.ar.size #= 2
          m.ar.burst #= 1
          cd.waitSamplingWhere(m.ar.ready.toBoolean)
          m.ar.valid #= false
          if (rnd.nextInt(3) == 0) cd.waitSampling(rnd.nextInt(4))
        }
      }

      // ── Write driver ───────────────────────────────────────────────────
      // One burst's W beats follow its AW, which is what a master must do: W
      // carries no ID and the fabric steers it by AW order.
      val writer = fork {
        for (_ <- 0 until nWrites) {
          val id   = rnd.nextInt(ids)
          val len  = rnd.nextInt(3)
          val base = if (rnd.nextBoolean()) s0Base else s1Base
          val word = rnd.nextInt(winWords - len)
          val addr = base + writeWin + word * 4
          nWrBeats += len + 1
          wrExpect(id).enqueue(addr.toLong)
          m.aw.valid #= true
          m.aw.addr #= addr
          m.aw.id #= id
          m.aw.len #= len
          m.aw.size #= 2
          m.aw.burst #= 1
          // The first beat is offered alongside the address rather than after
          // it, so the run covers W arriving while AW is still being
          // arbitrated. AWVALID drops on its own handshake and not a cycle
          // later: held high past it, a slave that loops straight back to
          // AWREADY accepts the same address twice.
          val wBase = wFires
          m.w.valid #= true
          m.w.data #= (0xbeef0000L | (addr.toLong & 0xffffL))
          m.w.strb #= 0xf
          m.w.last #= (len == 0)
          cd.waitSamplingWhere(m.aw.ready.toBoolean)
          m.aw.valid #= false
          for (i <- 0 to len) {
            val beatAddr = (addr + i * 4).toLong
            val beatData = 0xbeef0000L | (beatAddr & 0xffffL)
            wrModel(beatAddr) = beatData
            if (i > 0) {
              m.w.valid #= true
              m.w.data #= beatData
              m.w.strb #= 0xf
              m.w.last #= (i == len)
            }
            assert(
              waitUpTo(cd, 2000)(wFires >= wBase + i + 1),
              f"the W beat for 0x$beatAddr%08X stalled"
            )
            m.w.valid #= false
            if (rnd.nextInt(4) == 0) cd.waitSampling(1 + rnd.nextInt(3))
          }
          if (rnd.nextInt(3) == 0) cd.waitSampling(rnd.nextInt(5))
        }
      }

      reader.join()
      writer.join()

      // Drain. A fabric that has stranded a thread stops answering, so this
      // bound is what turns a wedge into a failure instead of a timeout.
      var idle = 0
      while (idle < 4000 && (rdExpect.exists(_.nonEmpty) || wrExpect.exists(_.nonEmpty))) {
        cd.waitSampling()
        idle += 1
      }

      val rdLeft =
        rdExpect.zipWithIndex.collect { case (q, i) if q.nonEmpty => s"id $i: ${q.size}" }
      val wrLeft =
        wrExpect.zipWithIndex.collect { case (q, i) if q.nonEmpty => s"id $i: ${q.size}" }
      assert(rdLeft.isEmpty, s"reads never answered -- ${rdLeft.mkString(", ")}")
      assert(wrLeft.isEmpty, s"writes never answered -- ${wrLeft.mkString(", ")}")
      assert(
        failures.isEmpty,
        s"${failures.size} ordering failures:\n  ${failures.take(10).mkString("\n  ")}"
      )
      assert(bSeen == nWrites, s"saw $bSeen B responses, expected $nWrites")
      assert(awFires == nWrites, s"the fabric took $awFires write addresses, expected $nWrites")
      assert(wFires == nWrBeats, s"the fabric took $wFires W beats, expected $nWrBeats")

      // Every written word, where it was written. This is what catches a burst
      // steered to the wrong slave, a beat dropped, or a beat delivered twice.
      val wrong = mutable.ArrayBuffer[String]()
      for ((addr, want) <- wrModel) {
        val mem = if (addr < s1Base.toLong) mem0 else mem1
        val got = mem.getOrElse(addr, -1L)
        if (got != want) wrong += f"0x$addr%08X: expected 0x$want%08X, slave holds 0x$got%08X"
      }
      assert(
        wrong.isEmpty,
        s"${wrong.size} of ${wrModel.size} written words are wrong: " +
          wrong.take(10).mkString("; ")
      )
      assert(rBeats >= nReads, s"saw only $rBeats R beats for $nReads reads")
    }
  }
}
