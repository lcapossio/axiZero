// Copyright (c) 2026 Leonardo Capossio — bard0 design  hello@bard0.com
// SPDX-License-Identifier: MIT
package axizero.sim

import spinal.core._
import spinal.core.sim._
import spinal.lib.bus.amba4.axi._
import scala.collection.mutable

// ---------------------------------------------------------------------------
// AxiMonitor  —  passive AXI4 protocol checker for SpinalSim
//
// Spawn one monitor per AXI4 interface (master or slave side).  The monitor
// forks background threads that check:
//
//   1. Handshake stability  – valid must not deassert before ready
//   2. W-beat count         – exactly AWLEN+1 beats, LAST on beat AWLEN
//   3. R-beat count         – exactly ARLEN+1 beats, LAST on beat ARLEN
//   4. B.id / R.id sanity  – ids seen must match outstanding transaction ids
//
// Usage:
//   val mon = AxiMonitor.attach(dut.io.slaves(0), cd, name = "S0")
//   // ... run simulation ...
//   mon.assertNoErrors()
//
// The monitor records violations; call assertNoErrors() at test end.
// ---------------------------------------------------------------------------
class AxiMonitor(name: String) {
  private val errors = mutable.ArrayBuffer[String]()

  private def err(msg: String): Unit = {
    val s = s"[AxiMonitor:$name] VIOLATION: $msg"
    println(s)
    errors += s
  }

  def assertNoErrors(): Unit =
    assert(errors.isEmpty, s"\n${errors.mkString("\n")}")

  // ── AW channel stability ────────────────────────────────────────────────

  def monitorAwStability(ifc: Axi4, cd: ClockDomain): Unit = fork {
    var wasValid = false
    var wasReady = false
    while (true) {
      cd.waitSampling()
      val v = ifc.aw.valid.toBoolean
      val r = ifc.aw.ready.toBoolean
      if (wasValid && !wasReady && !v)
        err(s"AW: valid deasserted before ready")
      wasValid = v
      wasReady = r
    }
  }

  def monitorArStability(ifc: Axi4, cd: ClockDomain): Unit = fork {
    var wasValid = false
    var wasReady = false
    while (true) {
      cd.waitSampling()
      val v = ifc.ar.valid.toBoolean
      val r = ifc.ar.ready.toBoolean
      if (wasValid && !wasReady && !v)
        err(s"AR: valid deasserted before ready")
      wasValid = v
      wasReady = r
    }
  }

  def monitorWStability(ifc: Axi4, cd: ClockDomain): Unit = fork {
    var wasValid = false
    var wasReady = false
    while (true) {
      cd.waitSampling()
      val v = ifc.w.valid.toBoolean
      val r = ifc.w.ready.toBoolean
      if (wasValid && !wasReady && !v)
        err(s"W: valid deasserted before ready")
      wasValid = v
      wasReady = r
    }
  }

  // ── W-beat count checker ────────────────────────────────────────────────
  //
  // Single thread observes both AW and W each clock cycle to avoid the
  // cross-thread timing race where the first W beat can land on the same
  // clock edge as the AW handshake.

  def monitorWriteBursts(ifc: Axi4, cd: ClockDomain): Unit = fork {
    // Queue of AWLEN values for accepted AW transactions not yet started on W
    val pendingLens = mutable.Queue[Int]()
    var curLen   = -1   // -1 = no active burst
    var curBeats = 0    //  expected beats for active burst
    var beat     = 0    //  beats seen so far

    while (true) {
      cd.waitSampling()

      // Process AW handshake
      if (ifc.aw.valid.toBoolean && ifc.aw.ready.toBoolean) {
        val len = if (ifc.config.useLen) ifc.aw.len.toInt else 0
        pendingLens.enqueue(len)
      }

      // Process W handshake
      if (ifc.w.valid.toBoolean && ifc.w.ready.toBoolean) {
        // Latch next burst if idle
        if (curLen < 0) {
          if (pendingLens.isEmpty)
            err(s"W beat with no pending AW")
          else {
            curLen   = pendingLens.dequeue()
            curBeats = curLen + 1
            beat     = 0
          }
        }
        if (curLen >= 0) {
          beat += 1
          val isLast = if (ifc.config.useLast) ifc.w.last.toBoolean else true
          if (isLast) {
            if (beat != curBeats)
              err(s"W: LAST on beat $beat, expected beat $curBeats (AWLEN=$curLen)")
            curLen = -1
          } else if (beat >= curBeats) {
            err(s"W: $beat beats without LAST (AWLEN=$curLen)")
            curLen = -1
          }
        }
      }
    }
  }

  // ── R-beat count checker ────────────────────────────────────────────────

  def monitorReadBursts(ifc: Axi4, cd: ClockDomain): Unit = fork {
    val pendingLens = mutable.Queue[Int]()
    var curLen   = -1
    var curBeats = 0
    var beat     = 0

    while (true) {
      cd.waitSampling()

      // Process AR handshake
      if (ifc.ar.valid.toBoolean && ifc.ar.ready.toBoolean) {
        val len = if (ifc.config.useLen) ifc.ar.len.toInt else 0
        pendingLens.enqueue(len)
      }

      // Process R handshake
      if (ifc.r.valid.toBoolean && ifc.r.ready.toBoolean) {
        if (curLen < 0) {
          if (pendingLens.isEmpty)
            err(s"R beat with no pending AR")
          else {
            curLen   = pendingLens.dequeue()
            curBeats = curLen + 1
            beat     = 0
          }
        }
        if (curLen >= 0) {
          beat += 1
          val isLast = if (ifc.config.useLast) ifc.r.last.toBoolean else true
          if (isLast) {
            if (beat != curBeats)
              err(s"R: LAST on beat $beat, expected beat $curBeats (ARLEN=$curLen)")
            curLen = -1
          } else if (beat >= curBeats) {
            err(s"R: $beat beats without LAST (ARLEN=$curLen)")
            curLen = -1
          }
        }
      }
    }
  }

  // ── B.id / R.id sanity ──────────────────────────────────────────────────

  def monitorBId(ifc: Axi4, cd: ClockDomain): Unit = {
    if (!ifc.config.useId) return
    fork {
      val outstanding = mutable.HashMap[Int, Int]().withDefaultValue(0)
      while (true) {
        cd.waitSampling()
        if (ifc.aw.valid.toBoolean && ifc.aw.ready.toBoolean)
          outstanding(ifc.aw.id.toInt) += 1
        if (ifc.b.valid.toBoolean && ifc.b.ready.toBoolean) {
          val bid = ifc.b.id.toInt
          if (outstanding(bid) == 0)
            err(s"B.id=0x${bid.toHexString} has no matching outstanding AW.id")
          else
            outstanding(bid) -= 1
        }
      }
    }
  }

  def monitorRId(ifc: Axi4, cd: ClockDomain): Unit = {
    if (!ifc.config.useId) return
    fork {
      val outstanding = mutable.HashMap[Int, Int]().withDefaultValue(0)
      while (true) {
        cd.waitSampling()
        if (ifc.ar.valid.toBoolean && ifc.ar.ready.toBoolean)
          outstanding(ifc.ar.id.toInt) += 1
        if (ifc.r.valid.toBoolean && ifc.r.ready.toBoolean &&
            (if (ifc.config.useLast) ifc.r.last.toBoolean else true)) {
          val rid = ifc.r.id.toInt
          if (outstanding(rid) == 0)
            err(s"R.id=0x${rid.toHexString} (last beat) has no matching outstanding AR.id")
          else
            outstanding(rid) -= 1
        }
      }
    }
  }
}

object AxiMonitor {

  /**
   * Attach a full-featured monitor to an AXI4 interface.
   * Starts all checks immediately as background threads.
   */
  def attach(ifc: Axi4, cd: ClockDomain, name: String): AxiMonitor = {
    val mon = new AxiMonitor(name)
    mon.monitorAwStability(ifc, cd)
    mon.monitorArStability(ifc, cd)
    mon.monitorWStability(ifc, cd)
    mon.monitorWriteBursts(ifc, cd)
    mon.monitorReadBursts(ifc, cd)
    mon.monitorBId(ifc, cd)
    mon.monitorRId(ifc, cd)
    mon
  }
}
