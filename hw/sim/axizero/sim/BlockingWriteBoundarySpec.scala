// Copyright (c) 2026 Leonardo Capossio — bard0 design  hello@bard0.com
// SPDX-License-Identifier: MIT
package axizero.sim

import org.scalatest.funsuite.AnyFunSuite
import spinal.core._
import spinal.core.sim._
import spinal.lib.bus.amba4.axi.{Axi4, Axi4Config}
import axizero._

// ---------------------------------------------------------------------------
// BlockingWriteBoundarySpec  —  where one write's data ends and the next begins
//
// The blocking crossbars own a slave from the AW that started a write until the
// B that ends it, and forward the granted master's W channel for that whole
// time. Nothing in that window says which write a beat belongs to, and AXI4
// lets a master present the next write's data before its address:
//
//   * before AW -- the crossbar offers W alongside the AW it is presenting, so
//     an IPIF-style slave that wants AWVALID and WVALID together can handshake.
//     A slave that takes the data and not yet the address leaves that path open
//     for whatever the master offers next.
//   * after AW -- the burst's last beat has gone through and B has not come
//     back yet. The master may not issue its next address anywhere (a blocking
//     master is held to one slave at a time), but it may offer that write's
//     data, and the path is still open.
//
// Either way the beats are taken by the slave holding the current write and
// written under its address -- so the next write's data lands at the wrong
// address, at a slave it was never addressed to, and its own slave is later
// left waiting for data that is already gone.
//
// This is the blocking counterpart of the case ChannelSkewSpec covers for the
// pipelined path. Both crossbars are exercised here because each has its own
// copy of the blocking write engine: the full AXI4 one, where the boundary is
// WLAST, and the AXI4-Lite one, where every beat is a whole write.
// ---------------------------------------------------------------------------
class BlockingWriteBoundarySpec extends AnyFunSuite {

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
  private val fullCfg   = Axi4Config(addressWidth = 32, dataWidth = 32, idWidth = 4)

  /** maxOutstanding = 1 selects the blocking engine, which is the point of this spec. */
  private def cfgTwoFullBlocking = AxiZeroConfig(
    masters = Seq(MasterPort(masterCfg, FullAxi4)),
    slaves = Seq(
      SlavePort(fullCfg, FullAxi4, s0Base, slaveSize),
      SlavePort(fullCfg, FullAxi4, s1Base, slaveSize)
    ),
    maxOutstanding = 1
  )

  private def cfgTwoLite = AxiZeroConfig.allLite(
    numMasters = 1,
    numSlaves = 2,
    addrWidth = 32,
    dataWidth = 32,
    addressMap = Seq(s0Base -> slaveSize, s1Base -> slaveSize),
    arbitration = RoundRobin
  )

  private def waitUpTo(cd: ClockDomain, limit: Int)(cond: => Boolean): Boolean = {
    if (cond) return true
    var n = 0
    while ({ cd.waitSampling(); n += 1; !cond && n < limit }) {}
    cond
  }

  /** A slave that takes everything at once and answers late.
    *
    * AWREADY goes up after `awDelay` cycles of AWVALID, WREADY is high from reset, and B is held
    * for `bDelay` cycles after the write is complete. The delayed B is what opens the window this
    * spec is about: the write the slave is holding is finished as far as data goes, and the master
    * is free to offer the next one's.
    *
    * It records every beat with the address it was written under, so a beat that landed at the
    * wrong slave or under the wrong address shows up as data, not just as a count.
    */
  private class SlowAnswerSlave(
    axi: Axi4,
    cd: ClockDomain,
    awDelay: Int = 0,
    bDelay: Int = 0,
    hasLast: Boolean = true
  ) {
    val mem           = scala.collection.mutable.HashMap[Long, Long]()
    var wBeats        = 0
    var awFires       = 0
    private var stall = 0
    private var bWait = 0
    // The write being held: its address, how many beats it has taken, and
    // whether its last beat has arrived. Both halves may arrive in either order.
    private var addr    = 0L
    private var beats   = 0
    private var haveAw  = false
    private var dataEnd = false
    private val early   = scala.collection.mutable.ArrayBuffer[Long]()

    axi.aw.ready #= false
    axi.w.ready #= true
    axi.b.valid #= false
    axi.ar.ready #= false
    axi.r.valid #= false

    cd.onSamplings {
      val awFire = axi.aw.valid.toBoolean && axi.aw.ready.toBoolean
      val wFire  = axi.w.valid.toBoolean && axi.w.ready.toBoolean
      val bFire  = axi.b.valid.toBoolean && axi.b.ready.toBoolean

      // The address first: a beat arriving in the same cycle as the AW belongs
      // to that AW, so the model has to know the address before it files it.
      if (awFire) {
        awFires += 1
        addr = axi.aw.addr.toLong
        haveAw = true
        // Beats that ran ahead of the address get theirs now.
        for ((d, i) <- early.zipWithIndex) mem(addr + i * 4) = d
        beats = early.size
        early.clear()
        stall = 0
        axi.aw.ready #= false
      } else if (axi.aw.valid.toBoolean) {
        stall += 1
        if (stall >= awDelay) axi.aw.ready #= true
      }

      if (wFire) {
        wBeats += 1
        val d = axi.w.data.toLong
        // Data may legally run ahead of the address; those beats are held until
        // the AW says where they go.
        if (haveAw) { mem(addr + beats * 4) = d; beats += 1 }
        else early += d
        if (!hasLast || axi.w.last.toBoolean) dataEnd = true
      }

      if (bFire) {
        axi.b.valid #= false
        haveAw = false
        dataEnd = false
        beats = 0
        early.clear()
        bWait = 0
      } else if (haveAw && dataEnd && !axi.b.valid.toBoolean) {
        if (bWait >= bDelay) {
          axi.b.valid #= true
          if (axi.config.useId) axi.b.id #= 0
          axi.b.resp #= 0
        } else bWait += 1
      }
    }
  }

  test("a blocking slave holding a finished write does not take the next write's data") {
    // The post-AW window: AW1 and its only beat are both taken by slave 1, and
    // B is held. The master offers write 2's data, addressed to slave 0. Slave
    // 1 has all the data it was given, so it must not take that beat.
    simCfg.compile(new AxiZeroMixedTop(cfgTwoFullBlocking)).doSim("blocking_b_delayed") { dut =>
      SimTimeout(100000)
      val cd = dut.clockDomain
      val m  = dut.io.masters(0)
      SimHelpers.initMaster(m)
      val s0 = new SlowAnswerSlave(dut.io.slaves(0), cd)
      val s1 = new SlowAnswerSlave(dut.io.slaves(1), cd, bDelay = 25)
      cd.forkStimulus(10)
      cd.waitSampling(5)
      m.b.ready #= true
      m.r.ready #= true

      // Counted at the master's own handshakes: a beat can be taken in the same
      // cycle as the AW that unblocks it, and a poll one cycle later sees a beat
      // that has already gone.
      var mW  = 0
      var mAW = 0
      var mB  = 0
      cd.onSamplings {
        if (m.w.valid.toBoolean && m.w.ready.toBoolean) mW += 1
        if (m.aw.valid.toBoolean && m.aw.ready.toBoolean) mAW += 1
        if (m.b.valid.toBoolean && m.b.ready.toBoolean) mB += 1
      }

      m.aw.valid #= true
      m.aw.addr #= s1Base
      m.aw.id #= 2
      m.aw.len #= 0
      m.aw.size #= 2
      m.aw.burst #= 1
      m.w.valid #= true
      m.w.data #= 0x11110000L
      m.w.strb #= 0xf
      m.w.last #= true
      assert(waitUpTo(cd, 200)(mAW == 1 && mW == 1), s"write 1 did not go (AW $mAW, W $mW)")
      m.aw.valid #= false
      m.w.valid #= false

      // Write 2's data, offered while slave 1 still owes a B. Its address is
      // presented too and must not be accepted anywhere until that B arrives --
      // a blocking master occupies one slave at a time.
      m.w.valid #= true
      m.w.data #= 0x22220000L
      m.w.strb #= 0xf
      m.w.last #= true
      m.aw.valid #= true
      m.aw.addr #= s0Base
      m.aw.id #= 2
      assert(
        !waitUpTo(cd, 15)(mW > 1),
        "write 2's beat was taken while slave 1 still held write 1 -- " +
          s"slave 0 has ${s0.wBeats} beats, slave 1 has ${s1.wBeats}"
      )

      // Now let it finish: B comes back, write 2 goes to slave 0.
      assert(waitUpTo(cd, 200)(mB == 1), "write 1 was never answered")
      assert(waitUpTo(cd, 200)(mAW == 2 && mW == 2), s"write 2 did not go (AW $mAW, W $mW)")
      m.aw.valid #= false
      m.w.valid #= false
      assert(waitUpTo(cd, 200)(mB == 2), "write 2 was never answered")
      cd.waitSampling()

      assert(s1.wBeats == 1, s"slave 1 was given ${s1.wBeats} beats, expected exactly 1")
      assert(s0.wBeats == 1, s"slave 0 was given ${s0.wBeats} beats, expected exactly 1")
      assert(
        s0.mem.get(s0Base.toLong).contains(0x22220000L),
        s"slave 0 holds ${s0.mem.get(s0Base.toLong)} at its base, expected 0x22220000"
      )
      assert(
        s1.mem.get(s1Base.toLong).contains(0x11110000L),
        s"slave 1 holds ${s1.mem.get(s1Base.toLong)} at its base, expected 0x11110000"
      )
    }
  }

  test("a blocking bypass closes once the data it was opened for is complete") {
    // The pre-AW window: slave 1 takes the beat several cycles before the
    // address. The bypass was opened for that write and has to close, because
    // what the master offers next belongs to a write it cannot issue yet.
    simCfg.compile(new AxiZeroMixedTop(cfgTwoFullBlocking)).doSim("blocking_w_before_aw") { dut =>
      SimTimeout(100000)
      val cd = dut.clockDomain
      val m  = dut.io.masters(0)
      SimHelpers.initMaster(m)
      val s0 = new SlowAnswerSlave(dut.io.slaves(0), cd)
      val s1 = new SlowAnswerSlave(dut.io.slaves(1), cd, awDelay = 25)
      cd.forkStimulus(10)
      cd.waitSampling(5)
      m.b.ready #= true
      m.r.ready #= true

      var mW  = 0
      var mAW = 0
      var mB  = 0
      cd.onSamplings {
        if (m.w.valid.toBoolean && m.w.ready.toBoolean) mW += 1
        if (m.aw.valid.toBoolean && m.aw.ready.toBoolean) mAW += 1
        if (m.b.valid.toBoolean && m.b.ready.toBoolean) mB += 1
      }

      m.aw.valid #= true
      m.aw.addr #= s1Base
      m.aw.id #= 5
      m.aw.len #= 0
      m.aw.size #= 2
      m.aw.burst #= 1
      m.w.valid #= true
      m.w.data #= 0x33330000L
      m.w.strb #= 0xf
      m.w.last #= true
      assert(waitUpTo(cd, 200)(mW == 1), "the early beat was never taken")
      m.w.valid #= false
      assert(mAW == 0, "slave 1 took the address too, so this is not the pre-AW case")

      // Write 2's data while write 1's address is still stalled at slave 1.
      m.w.valid #= true
      m.w.data #= 0x44440000L
      m.w.strb #= 0xf
      m.w.last #= true
      assert(
        !waitUpTo(cd, 15)(mW > 1),
        "write 2's beat was taken while write 1's address was still unissued -- " +
          s"slave 0 has ${s0.wBeats} beats, slave 1 has ${s1.wBeats}"
      )

      assert(waitUpTo(cd, 200)(mAW == 1), "write 1's address was never taken")
      m.aw.valid #= false
      assert(waitUpTo(cd, 200)(mB == 1), "write 1 was never answered")
      cd.waitSampling()

      m.aw.valid #= true
      m.aw.addr #= s0Base
      m.aw.id #= 5
      // Both valids stay up until both handshakes have happened: the data may
      // legally go first, and dropping AWVALID before AWREADY would be this
      // testbench breaking A3.2.1 rather than the fabric.
      assert(waitUpTo(cd, 200)(mW == 2 && mAW == 2), s"write 2 did not go (AW $mAW, W $mW)")
      m.aw.valid #= false
      m.w.valid #= false
      assert(waitUpTo(cd, 200)(mB == 2), "write 2 was never answered")
      cd.waitSampling()

      assert(s1.wBeats == 1, s"slave 1 was given ${s1.wBeats} beats, expected exactly 1")
      assert(s0.wBeats == 1, s"slave 0 was given ${s0.wBeats} beats, expected exactly 1")
      assert(
        s0.mem.get(s0Base.toLong).contains(0x44440000L),
        s"slave 0 holds ${s0.mem.get(s0Base.toLong)} at its base, expected 0x44440000"
      )
    }
  }

  test("an all-Lite slave holding a finished write does not take the next write's data") {
    // Same window, the Lite crossbar's own copy of the engine. AXI4-Lite has no
    // LAST, so the boundary is every beat: the second beat is always the second
    // write's, and while B is outstanding its address cannot have been accepted.
    simCfg.compile(new AxiZeroLiteTop(cfgTwoLite)).doSim("lite_blocking_b_delayed") { dut =>
      SimTimeout(100000)
      val cd = dut.clockDomain
      val m  = dut.io.masters(0)
      SimHelpers.initMaster(m)
      val s0 = new SlowAnswerSlave(dut.io.slaves(0), cd, hasLast = false)
      val s1 = new SlowAnswerSlave(dut.io.slaves(1), cd, bDelay = 25, hasLast = false)
      cd.forkStimulus(10)
      cd.waitSampling(5)
      m.b.ready #= true
      m.r.ready #= true

      var mW  = 0
      var mAW = 0
      var mB  = 0
      cd.onSamplings {
        if (m.w.valid.toBoolean && m.w.ready.toBoolean) mW += 1
        if (m.aw.valid.toBoolean && m.aw.ready.toBoolean) mAW += 1
        if (m.b.valid.toBoolean && m.b.ready.toBoolean) mB += 1
      }

      m.aw.valid #= true
      m.aw.addr #= s1Base
      m.w.valid #= true
      m.w.data #= 0x55550000L
      m.w.strb #= 0xf
      assert(waitUpTo(cd, 200)(mAW == 1 && mW == 1), s"write 1 did not go (AW $mAW, W $mW)")
      m.aw.valid #= false
      m.w.valid #= false

      m.w.valid #= true
      m.w.data #= 0x66660000L
      m.w.strb #= 0xf
      m.aw.valid #= true
      m.aw.addr #= s0Base
      assert(
        !waitUpTo(cd, 15)(mW > 1),
        "write 2's beat was taken while slave 1 still held write 1 -- " +
          s"slave 0 has ${s0.wBeats} beats, slave 1 has ${s1.wBeats}"
      )

      assert(waitUpTo(cd, 200)(mB == 1), "write 1 was never answered")
      assert(waitUpTo(cd, 200)(mAW == 2 && mW == 2), s"write 2 did not go (AW $mAW, W $mW)")
      m.aw.valid #= false
      m.w.valid #= false
      assert(waitUpTo(cd, 200)(mB == 2), "write 2 was never answered")
      cd.waitSampling()

      assert(s1.wBeats == 1, s"slave 1 was given ${s1.wBeats} beats, expected exactly 1")
      assert(s0.wBeats == 1, s"slave 0 was given ${s0.wBeats} beats, expected exactly 1")
      assert(
        s0.mem.get(s0Base.toLong).contains(0x66660000L),
        s"slave 0 holds ${s0.mem.get(s0Base.toLong)} at its base, expected 0x66660000"
      )
      assert(
        s1.mem.get(s1Base.toLong).contains(0x55550000L),
        s"slave 1 holds ${s1.mem.get(s1Base.toLong)} at its base, expected 0x55550000"
      )
    }
  }
}
