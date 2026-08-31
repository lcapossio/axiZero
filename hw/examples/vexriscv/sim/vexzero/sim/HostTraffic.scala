// Copyright (c) 2026 Leonardo Capossio — bard0 design  hello@bard0.com
// SPDX-License-Identifier: MIT
package vexzero.sim

import scala.collection.mutable
import spinal.core._
import spinal.core.sim._
import spinal.lib.bus.amba4.axi.Axi4

// ---------------------------------------------------------------------------
// HostTraffic  —  a third master that asks the crossbar for what a CPU cannot
//
// VexRiscv is a modest bus master by design. Uncached it issues single beats
// one at a time; cached it issues eight-beat line refills but hits in the
// cache most of the time, so the fabric spends most of the run idle. Neither
// shape tells you whether the crossbar handles long bursts, keeps several
// transactions in flight, routes write data correctly when AW has run ahead
// of W, or arbitrates fairly when two masters want the same slave at once.
//
// So the stress test adds a master that does all of those deliberately, on
// the SoC's third port — the same port a debug cable occupies on the
// DE25-Nano, so no hardware exists here that does not exist on a board.
//
// Four cooperating threads, one per channel group, which is what produces the
// concurrency: the AR thread keeps issuing while the R thread is still
// draining an earlier burst, and the AW thread runs ahead of the W thread, so
// write data arrives at the fabric after its address and has to be routed to
// the right slave from a queue rather than from the address beside it.
//
// Every read carries the value it expects, so this is a checker and not only
// a load: a crossbar that mis-routed a beat, dropped one, or returned another
// master's data fails here rather than merely running slowly.
// ---------------------------------------------------------------------------
class HostTraffic(axi: Axi4, cd: ClockDomain) {

  /** Reads issued and fully answered. */
  var reads = 0L

  /** Writes whose B response has come back. */
  var writes = 0L

  var readBeats  = 0L
  var writeBeats = 0L

  /** Peak read transactions the fabric had accepted but not yet fully answered.
    *
    * Counted from the AR handshake rather than from the queue, so it is what the crossbar was
    * actually carrying and not what this driver would have liked it to.
    */
  var peakOutstanding     = 0
  private var outstanding = 0

  /** Longest burst issued, in beats. */
  var longestBurst = 0

  /** Every beat that came back holding something other than what was written. */
  val mismatches = mutable.ArrayBuffer[String]()

  private var stopped = false

  private val readQueue    = mutable.Queue[(Long, IndexedSeq[Long])]()
  private val inFlight     = mutable.Queue[(Long, IndexedSeq[Long])]()
  private val writeQueue   = mutable.Queue[(Long, IndexedSeq[Long])]()
  private val dataQueue    = mutable.Queue[IndexedSeq[Long]]()
  private var writesIssued = 0L

  /** Queue a burst read of `expect.length` beats from `addr`, checked against `expect`. */
  def read(addr: Long, expect: IndexedSeq[Long]): Unit = readQueue.enqueue((addr, expect))

  /** Queue a burst write of `data` to `addr`. */
  def write(addr: Long, data: IndexedSeq[Long]): Unit = writeQueue.enqueue((addr, data))

  /** How much work is queued or still in the fabric — used to keep the port fed. */
  def backlog: Int = readQueue.size + inFlight.size + writeQueue.size

  def transactions: Long = reads + writes

  /** Block until every queued write has been answered.
    *
    * AXI orders nothing between the read and write channels, so a read-back of an address this
    * master has just written is only meaningful once the write's B has returned.
    */
  def drainWrites(): Unit =
    while (writes != writesIssued || writeQueue.nonEmpty) cd.waitSampling()

  def halt(): Unit = stopped = true

  private def idle(): Unit = {
    axi.ar.valid #= false
    axi.aw.valid #= false
    axi.w.valid #= false
    axi.r.ready #= false
    axi.b.ready #= false
  }

  /** Idle the port, let the design leave reset, then start driving.
    *
    * The wait is not politeness. A command driven while reset is still asserted is taken by the
    * master port's register slice and then wiped, so it is never answered and the collector waits
    * forever for a response that cannot arrive.
    */
  def start(): Unit = {
    idle()
    cd.waitSampling(32)
    fork(arThread())
    fork(rThread())
    fork(awThread())
    fork(wThread())
    fork(bThread())
  }

  // ── AR: issue read commands as fast as the fabric will take them ──────────
  private def arThread(): Unit =
    while (!stopped) {
      if (readQueue.isEmpty) cd.waitSampling()
      else {
        val (addr, expect) = readQueue.dequeue()
        // Recorded before the handshake, never after: the response cannot
        // precede the command, but the collector must not miss it either.
        inFlight.enqueue((addr, expect))
        if (expect.length > longestBurst) longestBurst = expect.length

        axi.ar.valid #= true
        axi.ar.payload.addr #= addr
        axi.ar.payload.id #= 0
        axi.ar.payload.len #= expect.length - 1
        axi.ar.payload.size #= 2  // 4 bytes
        axi.ar.payload.burst #= 1 // INCR
        cd.waitSamplingWhere(axi.ar.ready.toBoolean)
        axi.ar.valid #= false
        outstanding += 1
        if (outstanding > peakOutstanding) peakOutstanding = outstanding
      }
    }

  // ── R: check every beat against what the address should hold ──────────────
  private def rThread(): Unit = {
    axi.r.ready #= true
    var beat = 0
    while (!stopped) {
      cd.waitSampling()
      if (axi.r.valid.toBoolean) {
        val (addr, expect) = inFlight.head
        val got            = axi.r.payload.data.toLong & 0xffffffffL
        val want           = expect(beat) & 0xffffffffL
        if (got != want && mismatches.length < 20)
          mismatches += f"read 0x${addr + beat * 4}%08X beat $beat%d returned 0x$got%08X, " +
            f"expected 0x$want%08X"
        if (axi.r.payload.resp.toInt != 0 && mismatches.length < 20)
          mismatches += f"read 0x${addr + beat * 4}%08X answered with a bus error"
        readBeats += 1
        beat += 1
        if (axi.r.payload.last.toBoolean) {
          if (beat != expect.length && mismatches.length < 20)
            mismatches += f"read 0x$addr%08X ended after $beat%d beats, expected ${expect.length}%d"
          inFlight.dequeue()
          outstanding -= 1
          reads += 1
          beat = 0
        }
      }
    }
  }

  // ── AW: run ahead of the data, which is the case W routing exists for ─────
  private def awThread(): Unit =
    while (!stopped) {
      if (writeQueue.isEmpty) cd.waitSampling()
      else {
        val (addr, data) = writeQueue.dequeue()
        dataQueue.enqueue(data)
        writesIssued += 1
        if (data.length > longestBurst) longestBurst = data.length

        axi.aw.valid #= true
        axi.aw.payload.addr #= addr
        axi.aw.payload.id #= 0
        axi.aw.payload.len #= data.length - 1
        axi.aw.payload.size #= 2
        axi.aw.payload.burst #= 1
        cd.waitSamplingWhere(axi.aw.ready.toBoolean)
        axi.aw.valid #= false
      }
    }

  private def wThread(): Unit =
    while (!stopped) {
      if (dataQueue.isEmpty) cd.waitSampling()
      else {
        val data = dataQueue.dequeue()
        for ((word, i) <- data.zipWithIndex) {
          axi.w.valid #= true
          axi.w.payload.data #= word
          axi.w.payload.strb #= 0xf
          axi.w.payload.last #= (i == data.length - 1)
          cd.waitSamplingWhere(axi.w.ready.toBoolean)
          writeBeats += 1
        }
        axi.w.valid #= false
      }
    }

  private def bThread(): Unit = {
    axi.b.ready #= true
    while (!stopped) {
      cd.waitSampling()
      if (axi.b.valid.toBoolean) {
        if (axi.b.payload.resp.toInt != 0 && mismatches.length < 20)
          mismatches += "a write was answered with a bus error"
        writes += 1
      }
    }
  }
}
