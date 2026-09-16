// Copyright (c) 2026 Leonardo Capossio - bard0 design  hello@bard0.com
// SPDX-License-Identifier: MIT
//
// Axi4OrderingProbe - watches the single-slave-per-ID rule where it is enforced.
//
// AxiMultiIdGen checks the fabric's ORDERING promise from the master's own
// boundary: it issues the traffic and compares what comes back. What it cannot
// see from there is the rule the fabric keeps that promise WITH. An ID may only
// have work outstanding at one slave; a request that would move a live ID
// somewhere else has to wait. That decision is made at the crossbar's master
// input, and between the two there is a register slice: the skid can accept a
// request the crossbar has not admitted, and can hold a response the master has
// not consumed. So a generator counting its own outstanding bursts can report
// "two IDs in flight" and "a live ID asked to cross" while the crossbar,
// downstream, was serializing everything and its ID table never held two IDs at
// once. The evidence would be true and would prove nothing about the machinery
// it is named after.
//
// This closes that gap by observing the bus on the far side of the slice --
// point it at the crossbar's own master port -- where ARREADY is the admission
// decision itself. It does two jobs:
//
//   * a CHECK. `sspidViolation` latches when the fabric admits a request for
//     one region while that ID still has work outstanding in the other. That is
//     the rule being broken, seen directly, rather than inferred from a
//     response arriving in the wrong order -- and a broken gate does not have
//     to produce a wrong order to be broken. Two similar slaves can answer in
//     issue order by luck.
//
//   * EVIDENCE. `deepCrossHeld` latches when such a request was presented and
//     NOT admitted while two or more of that ID's bursts were live at the other
//     region. That is the interesting case: the counter had to be right at two,
//     the destination gate had to hold, and neither is exercised by an ID that
//     only ever has one burst outstanding.
//
// Reads and writes are tracked separately, because AXI4 orders each direction
// on its own: an ID may legally be live at one slave for reads and another for
// writes at the same time.
//
// Passive, like Axi4ProtocolChecker: it reads VALID, READY and payload and
// drives nothing, so wiring it in cannot change what the design does. Built as
// an Area for the same reason -- no ports, no connection for a mistake to hide
// in. And like that checker it registers what it observes by default
// (`pipelineInputs`), so the arbiter's READY does not reach a chain of per-ID
// comparators in the cycle it is decided; the verdicts are unchanged because
// every signal is delayed by the same cycle, which the spec holds it to by
// running every sequence both ways.

package axizero.verif

import spinal.core._
import spinal.lib._
import spinal.lib.bus.amba4.axi._
import axizero.Axi4MasterObs

/** Configuration for [[Axi4OrderingProbe]].
  *
  * @param idCount
  *   How many IDs the watched master uses. State is kept per ID, so this is what the probe costs.
  * @param regionBit
  *   The address bit that says which of the two slaves a request is for. The caller picks it from
  *   its own address map and must ensure each slave's whole span has one value of it.
  * @param maxLivePerId
  *   Where the per-ID counter saturates. A counter that wrapped would report a live ID as idle and
  *   hide the very case this exists to catch, so it sticks at the top instead and `overflow` says
  *   the count is no longer exact.
  */
case class Axi4OrderingProbeConfig(
  idCount: Int,
  regionBit: Int,
  maxLivePerId: Int = 8,
  /** Register everything the probe observes, so its comparators sit behind a register instead of
    * hanging off the live bus.
    *
    * The probe is passive and its only outputs are sticky bits read at the end of a run, so
    * delaying every signal it sees by the *same* cycle leaves every verdict identical -- the
    * sequence it walks is the same sequence, one cycle later. What it buys is that the arbiter's
    * ARREADY no longer reaches a chain of per-ID comparators in the cycle it is decided, which on
    * the loaded Arty build is the difference between closing at 100 MHz and not. Same reasoning,
    * and the same switch, as `pipelineInputs` on [[Axi4ProtocolCheckerConfig]].
    */
  pipelineInputs: Boolean = true
) {
  require(idCount >= 2, s"Axi4OrderingProbeConfig: idCount must be at least 2, not $idCount")
  require(
    maxLivePerId >= 2,
    s"Axi4OrderingProbeConfig: maxLivePerId must be at least 2, not $maxLivePerId"
  )
  require(
    regionBit >= 0,
    s"Axi4OrderingProbeConfig: regionBit must be non-negative, not $regionBit"
  )
}

/** Watches one master port for single-slave-per-ID violations. See the file header.
  *
  * It reads an [[axizero.Axi4MasterObs]] rather than a bus, because the port it has to watch is
  * inside the fabric: turn on `observeMasters` and the crossbar's own master ports come out.
  *
  * {{{
  * val probe = Axi4OrderingProbe(fabric.io.obs(mi), Axi4OrderingProbeConfig(4, regionBit))
  * io.orderingOk := probe.ok
  * }}}
  */
case class Axi4OrderingProbe(
  obs: Axi4MasterObs,
  probeConfig: Axi4OrderingProbeConfig,
  label: String = "ord"
) extends Area {

  private val cfg = probeConfig
  require(
    obs.config.addressWidth > cfg.regionBit,
    s"Axi4OrderingProbe: regionBit ${cfg.regionBit} is outside a " +
      s"${obs.config.addressWidth}-bit address"
  )
  require(
    obs.config.idWidth >= log2Up(cfg.idCount),
    s"Axi4OrderingProbe: idWidth ${obs.config.idWidth} cannot carry ${cfg.idCount} IDs"
  )

  /** What the checks actually read: the observation bundle, or a one-cycle-delayed copy of it. See
    * `pipelineInputs` for why the delay changes no verdict. READY is delayed exactly as VALID is --
    * the probe drives neither -- so a handshake is still a handshake afterwards.
    */
  private val o: Axi4MasterObs =
    if (!cfg.pipelineInputs) obs
    else {
      val snap = Axi4MasterObs(obs.config)
      snap.assignFromBits(RegNext(obs.asBits) init (B(0, obs.getBitsWidth bits)))
      snap
    }

  private val idW    = log2Up(cfg.idCount)
  private val liveW  = log2Up(cfg.maxLivePerId + 1)
  private val arFire = o.arValid && o.arReady
  private val awFire = o.awValid && o.awReady
  private val rFire  = o.rValid && o.rReady
  private val bFire  = o.bValid && o.bReady
  private val rLast  = o.rLast

  private val arId = o.arId.resize(idW)
  private val awId = o.awId.resize(idW)
  private val rId  = o.rId.resize(idW)
  private val bId  = o.bId.resize(idW)

  private val arRegion = o.arAddr(cfg.regionBit)
  private val awRegion = o.awAddr(cfg.regionBit)

  /** The rule was broken: a request admitted for one region while that ID was live in the other. */
  val sspidViolation = Reg(Bool()) init (False)

  /** Two IDs were admitted and unfinished at the same time. */
  val twoIdsLive = Reg(Bool()) init (False)

  /** One ID had two or more bursts live at one region -- depth the fabric had to count. */
  val deepLive = Reg(Bool()) init (False)

  /** A request for the other region was presented and held while that ID was live. */
  val crossHeld = Reg(Bool()) init (False)

  /** The same, while the ID had two or more live at the other region. The case this exists for. */
  val deepCrossHeld = Reg(Bool()) init (False)

  /** A per-ID counter hit its ceiling, so the counts below are no longer exact. */
  val overflow = Reg(Bool()) init (False)

  sspidViolation.setName(s"${label}_sspidViolation")
  twoIdsLive.setName(s"${label}_twoIdsLive")
  deepLive.setName(s"${label}_deepLive")
  crossHeld.setName(s"${label}_crossHeld")
  deepCrossHeld.setName(s"${label}_deepCrossHeld")
  overflow.setName(s"${label}_overflow")

  /** One direction's worth of state. Reads and writes never share it: AXI4 orders each direction on
    * its own, so an ID live at one slave for reads and another for writes is legal and must not
    * read as a violation.
    */
  private class Direction(
    name: String,
    issue: Bool,   // a request was admitted this cycle
    issueId: UInt, // whose
    issueRegion: Bool,
    retire: Bool, // a request finished this cycle
    retireId: UInt,
    ask: Bool, // a request is being presented (admitted or not)
    askId: UInt,
    askRegion: Bool,
    held: Bool // ... and was not admitted
  ) {
    val live   = Vec(Reg(UInt(liveW bits)) init (0), cfg.idCount)
    val region = Vec(Reg(Bool()) init (False), cfg.idCount)
    for (i <- 0 until cfg.idCount) {
      live(i).setName(s"${label}_${name}_live$i")
      region(i).setName(s"${label}_${name}_region$i")
    }

    for (i <- 0 until cfg.idCount) {
      val mine   = issue && issueId === i
      val done   = retire && retireId === i
      val isLive = live(i) =/= 0

      // A request admitted on the very cycle this ID's last outstanding one
      // retires is legal: the thread is free again as it retires, and a fabric
      // that took advantage of that is doing the right thing. So the count this
      // is judged against is the one that survives the cycle.
      val stillLive = live(i) > (done ? U(1) | U(0)).resized
      val crosses   = stillLive && region(i) =/= issueRegion

      // The check. A fabric that admits this has moved a live ID to a second
      // slave, whether or not the responses happen to come back in order.
      when(mine && crosses) { sspidViolation := True }

      // The evidence, from the request that was presented and held.
      val asking = ask && askId === i && isLive && region(i) =/= askRegion
      when(asking && held) {
        crossHeld := True
        when(live(i) >= 2) { deepCrossHeld := True }
      }

      when(live(i) >= 2) { deepLive := True }

      // A counter that wrapped would call a live ID idle, which is exactly the
      // state this probe must not get wrong, so it saturates and says so.
      when(mine && !done) {
        when(live(i) === cfg.maxLivePerId) {
          overflow := True
        } otherwise {
          live(i) := live(i) + 1
        }
      } elsewhen (!mine && done && isLive) {
        live(i) := live(i) - 1
      }

      // The region an ID is at is set by the request that made it live and is
      // meaningless while it is idle.
      when(mine && !isLive) { region(i) := issueRegion }
    }

    val busyCount = CountOne(Vec((0 until cfg.idCount).map(i => live(i) =/= 0)).asBits)
  }

  private val rd = new Direction(
    "rd",
    issue = arFire,
    issueId = arId,
    issueRegion = arRegion,
    retire = rFire && rLast,
    retireId = rId,
    ask = o.arValid,
    askId = arId,
    askRegion = arRegion,
    held = !o.arReady
  )

  private val wr = new Direction(
    "wr",
    issue = awFire,
    issueId = awId,
    issueRegion = awRegion,
    retire = bFire,
    retireId = bId,
    ask = o.awValid,
    askId = awId,
    askRegion = awRegion,
    held = !o.awReady
  )

  when(rd.busyCount >= 2 || wr.busyCount >= 2) { twoIdsLive := True }

  /** Nothing was seen breaking the rule, and the traffic that would have shown it was there. */
  def ok: Bool = !sspidViolation && !overflow && twoIdsLive && deepLive && deepCrossHeld
}
