// Copyright (c) 2026 Leonardo Capossio — bard0 design  hello@bard0.com
// SPDX-License-Identifier: MIT
package vexzero.sim

import scala.collection.mutable
import spinal.core._
import spinal.core.sim._
import spinal.lib.bus.amba4.axi.Axi4

// ---------------------------------------------------------------------------
// AxiProfile  —  what a master port actually asked the crossbar for
//
// Cycle counts alone cannot tell a crossbar that is working hard from one that
// is barely being used, and the difference decides what a benchmark number is
// worth. A run of 200,000 single-beat transactions with never more than one in
// flight proves the fabric is correct and nothing about whether it is fast.
//
// So the example's tests measure the traffic, not just the time. Per port:
// how many transactions, how long their bursts were, how many were in flight
// at once, how long each one took end to end, and how often the port had a
// request the fabric would not yet take. Read together across ports, those say
// whether the arbiter ever had a decision to make.
//
// Everything here is sampled at the crossbar's master ports, so it counts what
// the fabric was asked to do rather than what a master intended.
// ---------------------------------------------------------------------------
class AxiProfile(val name: String) {

  var arCount    = 0L
  var awCount    = 0L
  var rBeats     = 0L
  var wBeats     = 0L
  var busyCycles = 0L // cycles with AR or AW valid
  var arStalls   = 0L // cycles with AR valid and the fabric not ready
  var awStalls   = 0L

  /** Peak transactions accepted but not yet answered. */
  var maxOutstanding      = 0L
  private var outstanding = 0L

  val readLens  = mutable.Map[Int, Long]().withDefaultValue(0L)
  val writeLens = mutable.Map[Int, Long]().withDefaultValue(0L)

  private val readIssued  = mutable.Queue[Long]()
  private val writeIssued = mutable.Queue[Long]()
  private var readCycles  = 0L
  private var writeCycles = 0L
  private var readsDone   = 0L
  private var writesDone  = 0L

  /** Worst case, not the mean. "Bounded latency" is a claim about this number: a mean stays
    * comfortable while one starved transaction waits arbitrarily long behind a louder master.
    */
  var maxReadLatency  = 0L
  var maxWriteLatency = 0L

  private def issue(): Unit = {
    outstanding += 1
    if (outstanding > maxOutstanding) maxOutstanding = outstanding
  }
  private def retire(): Unit = outstanding -= 1

  def arFire(cycle: Long, len: Int): Unit = {
    arCount += 1
    readLens(len) += 1
    readIssued.enqueue(cycle)
    issue()
  }

  /** Called on the last beat of a read response. */
  def rLast(cycle: Long): Unit = {
    if (readIssued.nonEmpty) {
      val took = cycle - readIssued.dequeue()
      readCycles += took
      readsDone += 1
      if (took > maxReadLatency) maxReadLatency = took
    }
    retire()
  }

  def awFire(cycle: Long, len: Int): Unit = {
    awCount += 1
    writeLens(len) += 1
    writeIssued.enqueue(cycle)
    issue()
  }

  def bFire(cycle: Long): Unit = {
    if (writeIssued.nonEmpty) {
      val took = cycle - writeIssued.dequeue()
      writeCycles += took
      writesDone += 1
      if (took > maxWriteLatency) maxWriteLatency = took
    }
    retire()
  }

  def transactions: Long = arCount + awCount
  def beats: Long        = rBeats + wBeats

  /** AR accepted to the last R beat, averaged. The unloaded floor for this SoC is the registered
    * path through the fabric; anything above it is time spent queued behind another master.
    */
  def readLatency: Double  = if (readsDone == 0) 0.0 else readCycles.toDouble / readsDone
  def writeLatency: Double = if (writesDone == 0) 0.0 else writeCycles.toDouble / writesDone

  /** Mean beats per transaction — 1.0 means the port never issued a burst. */
  def meanReadBurst: Double =
    if (arCount == 0) 0.0
    else readLens.map { case (l, n) => (l + 1).toLong * n }.sum.toDouble / arCount
  def meanWriteBurst: Double =
    if (awCount == 0) 0.0
    else writeLens.map { case (l, n) => (l + 1).toLong * n }.sum.toDouble / awCount

  def burstSummary(lens: mutable.Map[Int, Long]): String =
    if (lens.isEmpty) "none"
    else lens.toSeq.sortBy(_._1).map { case (len, n) => f"${len + 1}%d-beat:$n%,d" }.mkString(" ")

  def readSummary: String  = burstSummary(readLens)
  def writeSummary: String = burstSummary(writeLens)
}

object AxiProfile {

  /** Make the handshakes and burst lengths of these ports visible to the simulator.
    *
    * Called inside the elaboration block passed to `SimConfig.compile`.
    */
  def publish(ports: collection.Seq[Axi4]): Unit =
    for (port <- ports) {
      for (channel <- Seq(port.ar, port.r, port.aw, port.b, port.w)) {
        channel.valid.simPublic()
        channel.ready.simPublic()
      }
      port.ar.payload.len.simPublic()
      port.aw.payload.len.simPublic()
      port.r.last.simPublic()
      port.w.last.simPublic()
    }

  /** Sample one cycle of every port. Call from `onSamplings` with a monotonic cycle count.
    *
    * Returns how many ports had a request up this cycle, which is what says whether the arbiter had
    * anything to decide: 0 is an idle fabric, 1 is an uncontended one, and more than 1 is the only
    * case a crossbar exists to handle.
    */
  def sample(ports: collection.Seq[Axi4], stats: Seq[AxiProfile], cycle: Long): Int = {
    var requesting = 0
    for ((port, stat) <- ports.zip(stats)) {
      val arValid = port.ar.valid.toBoolean
      val awValid = port.aw.valid.toBoolean
      if (arValid || awValid) { requesting += 1; stat.busyCycles += 1 }

      if (arValid) {
        if (port.ar.ready.toBoolean) stat.arFire(cycle, port.ar.payload.len.toInt)
        else stat.arStalls += 1
      }
      if (awValid) {
        if (port.aw.ready.toBoolean) stat.awFire(cycle, port.aw.payload.len.toInt)
        else stat.awStalls += 1
      }
      if (port.r.valid.toBoolean && port.r.ready.toBoolean) {
        stat.rBeats += 1
        if (port.r.last.toBoolean) stat.rLast(cycle)
      }
      if (port.w.valid.toBoolean && port.w.ready.toBoolean) stat.wBeats += 1
      if (port.b.valid.toBoolean && port.b.ready.toBoolean) stat.bFire(cycle)
    }
    requesting
  }

  /** One line per port, aligned, for a test's printed report. */
  def report(stats: Seq[AxiProfile]): String = {
    val sb = new StringBuilder
    for (s <- stats) {
      sb ++= f"  ${s.name}%-18s ${s.arCount}%,9d reads  ${s.awCount}%,8d writes\n"
      sb ++= f"  ${""}%-18s read  ${s.readSummary}%s\n"
      sb ++= f"  ${""}%-18s write ${s.writeSummary}%s\n"
      sb ++= f"  ${""}%-18s mean burst ${s.meanReadBurst}%.2f r / ${s.meanWriteBurst}%.2f w beats, " +
        f"peak ${s.maxOutstanding}%d in flight\n"
      sb ++= f"  ${""}%-18s latency ${s.readLatency}%.2f cycles read, ${s.writeLatency}%.2f write\n"
      sb ++= f"  ${""}%-18s worst   ${s.maxReadLatency}%,d cycles read, ${s.maxWriteLatency}%,d write\n"
    }
    sb.toString
  }
}
