// Copyright (c) 2026 Leonardo Capossio — bard0 design  hello@bard0.com
// SPDX-License-Identifier: MIT
package axizero.crossbar

import spinal.core._
import spinal.lib._
import spinal.lib.bus.amba4.axi._
import axizero._

// ---------------------------------------------------------------------------
// Axi4Crossbar  (full AXI4)
//
// M×N crossbar with burst transactions, ID expansion, and pluggable
// arbitration.  Supports two operating modes selected by cfg.maxOutstanding:
//
//   maxOutstanding = 1   BLOCKING — one transaction per slave per direction.
//                        Simple, no FIFOs.  Best for single-master or
//                        low-contention topologies.
//
//   maxOutstanding > 1   PIPELINED — up to N outstanding transactions per
//                        slave per direction.  Uses a per-slave W-route FIFO
//                        to sequence W beats after multiple AW grants, and
//                        ID-based response routing for B/R channels.  Higher
//                        throughput when multiple masters target the same slave.
//
// ID management
// ─────────────
// Each master presents IDs of width cfg.masters(mi).config.idWidth.
// Inside the crossbar the slave-side IDs are widened by masterIndexBits
// (= ceil(log2(M))), which encodes the originating master port:
//
//   slave_side_id = { master_index[masterIndexBits-1:0],
//                     master_id[masterIdWidth-1:0] }
//
// On the return path (B/R), the upper bits are stripped and the response
// is routed to the correct master.
// ---------------------------------------------------------------------------
// ---------------------------------------------------------------------------
// Address decode, shared by both crossbars
// ---------------------------------------------------------------------------
object AddrDecode {

  /** Does `addr` fall in this slave's region?
    *
    * AxiZeroConfig requires every region to have a power-of-two size and a size-aligned base, which
    * makes membership an equality on the tag bits above log2(size) rather than a pair of magnitude
    * comparisons. That is the cheaper decode -- one narrow equality instead of two full-width carry
    * chains, on a path that feeds the arbiter's grant -- and it is the only one that is always
    * legal to build.
    *
    * The range form is not: `addr < base + size` is an out-of-range constant whenever the region
    * ends at the top of the bus, because `base + size` is then 2**addrWidth and one bit too wide
    * for the comparator, and `addr >= base` is out of range whenever the region starts above the
    * bus. SpinalHDL rejects both with "OUT OF RANGE CONSTANT. Operator UInt < UInt". Neither is
    * exotic: the first is any map reaching the top of the address space, and the second is what a
    * narrow master sees of a slave that a wider master on the same crossbar can reach, since each
    * master decodes in its own address width.
    *
    * Both of those are constants, not errors, and this returns them as constants.
    *
    * Correctness depends on the alignment require, not merely cost: for an unaligned base the tag
    * comparison would silently decode a different region than the range form would.
    */
  def hit(addr: UInt, sp: SlavePort): Bool = {
    val addrW = addr.getWidth
    val lsb   = log2Up(sp.size) // exact -- size is a power of two
    if (lsb >= addrW) {
      // The region is at least as large as this master's whole address space.
      // Based at zero it covers all of it; based anywhere else it is entirely
      // above it, because alignment puts any non-zero base at or past `size`.
      if (sp.baseAddress == 0) True else False
    } else if ((sp.baseAddress >> lsb) >= (BigInt(1) << (addrW - lsb))) {
      False // starts above what this master can address
    } else {
      addr(addrW - 1 downto lsb) === U(sp.baseAddress >> lsb, (addrW - lsb) bits)
    }
  }
}

class Axi4Crossbar(cfg: AxiZeroConfig) extends Component {

  val M             = cfg.numMasters
  val S             = cfg.numSlaves
  val masterIdxBits = cfg.masterIndexBits

  // The decode-error responder is wired in as one more slave, owning every
  // address no real slave claimed. Everything downstream -- arbitration, the
  // W-route FIFO, ID-based B/R routing -- then treats it like any other slave
  // and needs no special case. Sx counts the slaves the fabric routes to; S
  // stays the number of ports the user asked for.
  val decErrEnabled = cfg.decodeErrorResponse
  val decErrIdx     = S
  val Sx            = if (decErrEnabled) S + 1 else S

  // Derive a common master-side ID width (max across all masters)
  val maxMasterIdW = cfg.masters.map(_.config.idWidth).max

  // Slave-side ID width (expanded to encode originating master)
  val slaveIdW = maxMasterIdW + masterIdxBits

  // Build a slave-side Axi4Config (fabric width, expanded IDs)
  // Each slave port uses its own data width; width converters sit outside.
  def slaveFabricConfig(si: Int): Axi4Config =
    cfg
      .slaves(si)
      .config
      .copy(
        dataWidth = cfg.fabricDataWidth,
        idWidth = slaveIdW
      )

  val io = new Bundle {
    val masters = Vec(cfg.masters.indices.map(i => slave(Axi4(cfg.masters(i).config))))
    val slaves  = Vec(cfg.slaves.indices.map(i => master(Axi4(cfg.slaves(i).config))))
  }

  // =========================================================================
  // Decode-error responder — the slave for everything nothing else claimed
  // =========================================================================
  // Its config matches the other slave ports the crossbar drives (fabric data
  // width, expanded IDs) so the same copy helpers and payload assignments work
  // on it without a special case. The address width is the widest in play;
  // copyAwToSlave resizes into it either way.
  val decErrCfg = Axi4Config(
    addressWidth = (cfg.masters.map(_.config.addressWidth) ++
      cfg.slaves.map(_.config.addressWidth)).max,
    dataWidth = cfg.fabricDataWidth,
    idWidth = slaveIdW
  )
  val decErr = if (decErrEnabled) new Axi4DecErrSlave(decErrCfg) else null

  // Slave ports as the routing logic sees them: the real ones, then the
  // responder. Indexing through these keeps every loop below index-agnostic.
  val busSlaves: Seq[Axi4] =
    cfg.slaves.indices.map(io.slaves(_)) ++ (if (decErrEnabled) Seq(decErr.io.axi) else Nil)
  val busSlaveCfgs: Seq[Axi4Config] =
    cfg.slaves.map(_.config) ++ (if (decErrEnabled) Seq(decErrCfg) else Nil)

  // =========================================================================
  // Address decode helper — shared with the Lite crossbar (see AddrDecode)
  // =========================================================================
  def addrDecodeOH(addr: UInt): Bits = {
    // The mapped hits go in their own signal rather than into the result
    // vector: driving one bit of a Bits from the others reads as a loop to
    // PhaseCheckCombinationalLoops, which analyses whole signals.
    val hits = Bits(S bits)
    for (si <- 0 until S) hits(si) := AddrDecode.hit(addr, cfg.slaves(si))
    // The catch-all is the complement of the mapped region, so exactly one bit
    // is ever set and the vector stays one-hot for the arbiters.
    if (decErrEnabled) (!hits.orR).asBits ## hits else hits
  }

  // =========================================================================
  // Arbitration helpers (mirrored from Axi4LiteCrossbar)
  // =========================================================================
  def rrGrant(requests: Bits, rrPtr: UInt): Bits = {
    val n    = requests.getWidth
    val mask = Bits(n bits)
    for (i <- 0 until n) mask(i) := (U(i) >= rrPtr)
    val maskedReqs = requests & mask
    Mux(maskedReqs.orR, OHMasking.first(maskedReqs), OHMasking.first(requests))
  }

  val qosAgeMax = 15
  val qosAgeW   = log2Up(qosAgeMax + 1)

  def ageQos(rawQos: Vec[UInt], age: Vec[UInt]): Vec[UInt] = {
    val eff = Vec(UInt(4 bits), M)
    for (mi <- 0 until M) {
      val sum = UInt((4 + qosAgeW) bits)
      sum     := rawQos(mi).resize(4 + qosAgeW) + age(mi).resize(4 + qosAgeW)
      eff(mi) := Mux(sum > U(15, 4 + qosAgeW bits), U(15, 4 bits), sum.resize(4))
    }
    eff
  }

  def updateQosAge(age: Vec[UInt], requests: Bits, grantFire: Bool, grantIdx: UInt): Unit = {
    for (mi <- 0 until M) {
      when(!requests(mi)) {
        age(mi) := 0
      } elsewhen (grantFire && (grantIdx === mi)) {
        age(mi) := 0
      } otherwise {
        when(age(mi) =/= U(qosAgeMax, qosAgeW bits)) {
          age(mi) := age(mi) + 1
        }
      }
    }
  }

  /** Maximum of a sequence, as a balanced tree.
    *
    * `Seq.reduce` is left-associative, which builds a chain of M-1 comparators rather than a tree
    * of depth ceil(log2(M)) -- for the five-master stress builds, four levels where three would do.
    * The grant this feeds is already the critical path on those builds, so the shape is worth
    * stating explicitly rather than leaving to the fold direction.
    */
  private def maxTree(xs: Seq[UInt]): UInt =
    if (xs.length == 1) xs.head
    else {
      val (lo, hi) = xs.splitAt(xs.length / 2)
      val a        = maxTree(lo)
      val b        = maxTree(hi)
      Mux(a > b, a, b)
    }

  def qosGrant(requests: Bits, rrPtr: UInt, qos: Vec[UInt]): Bits = {
    // Max QoS among active requesters, as a balanced tree (no feedback).
    val maskedQos = (0 until M).map(mi => Mux(requests(mi), qos(mi), U(0, 4 bits)))
    val maxQ      = maxTree(maskedQos)

    val bestReqs = Bits(M bits)
    for (mi <- 0 until M) {
      bestReqs(mi) := requests(mi) && (qos(mi) === maxQ)
    }

    rrGrant(bestReqs, rrPtr)
  }

  def arbitrate(
    requests: Bits,
    rrPtr: UInt,
    qos: Vec[UInt] = null,
    credits: Vec[UInt] = null
  ): Bits = cfg.arbitration match {
    case RoundRobin            => rrGrant(requests, rrPtr)
    case FixedPriority         => OHMasking.first(requests)
    case QosBased              => qosGrant(requests, rrPtr, qos)
    case WeightedRoundRobin(_) => wrrGrant(requests, rrPtr, credits)
  }

  def wrrGrant(requests: Bits, rrPtr: UInt, credits: Vec[UInt]): Bits = {
    val eligible = Bits(M bits)
    for (mi <- 0 until M) eligible(mi) := requests(mi) && (credits(mi) =/= 0)
    Mux(eligible.orR, rrGrant(eligible, rrPtr), rrGrant(requests, rrPtr))
  }

  // =========================================================================
  // Grant locking
  // =========================================================================
  /** Hold an arbitration decision while the slave's address channel is stalled.
    *
    * AXI4 A3.2.1: once AxVALID is asserted, the payload must not change until AxREADY. The arbiter
    * re-evaluates every cycle from the live request vector, so a master that raises its request
    * while a granted address is still waiting for AxREADY can win the next cycle and swap the
    * address out from under the slave -- AxVALID never drops, but AxADDR and AxID move.
    *
    * Nothing is lost when that happens: both requests are real and both are issued eventually, so
    * every data-value check still passes. It is still a protocol violation, and a slave that
    * latches the address before it asserts READY -- which is a normal thing to do for timing --
    * latches the wrong one. Found by [[axizero.verif.Axi4ProtocolChecker]] on the slave-side port
    * of a loaded crossbar; see Axi4ProtocolCheckerSpec and VexZeroProtocolSpec.
    *
    * The lock releases on the handshake, so it costs no throughput: the held master was going to be
    * served in that cycle anyway.
    */
  def lockGrant(freshIdx: UInt, axValid: Bool, axReady: Bool): UInt = {
    // Named explicitly: these are per-slave registers created inside a helper,
    // so SpinalHDL would otherwise emit them as _zz_when_Axi4Crossbar_l<line>
    // in a netlist this project ships for people to read and instantiate.
    val held    = RegInit(False).setWeakName("grantLock")
    val heldIdx = Reg(UInt(ptrW bits)).init(0).setWeakName("grantLockIdx")
    val idx     = held ? heldIdx | freshIdx
    // Held only while the channel is actually stalled, which is exactly the
    // window the rule covers. Releasing it whenever AxVALID is low matters as
    // much as taking it: a stale lock would otherwise survive a master that
    // withdrew its request, and the next cycle would present a master that is
    // not asking for anything.
    when(axValid && !axReady) {
      held    := True
      heldIdx := idx
    } otherwise {
      held := False
    }
    idx
  }

  /** Hold a response-channel selection until the response it started has been delivered.
    *
    * The same rule as [[lockGrant]], one channel over. A master's B and R muxes pick among the
    * slaves that have a response pending for it, and that pick was a bare `OHMasking.first` over
    * the live valid vector: with responses outstanding at two slaves and the master holding
    * B/RREADY low, a lower-numbered slave going valid swapped the response out from under a live
    * B/RVALID. AXI4 A3.2.1 covers the response channels too -- once VALID is asserted, the payload
    * holds until READY -- so BID and BRESP were changing mid-handshake.
    *
    * On R it is worse than a payload swap. Releasing per beat would let a burst in progress from
    * one slave be preempted by another, which interleaves two bursts to the same master; AXI4
    * permits interleaving only across different IDs, and the masters here drive a constant ID. So R
    * holds to RLAST rather than to the beat, which is what `done` distinguishes.
    *
    * This cannot deadlock. The held slave has VALID asserted and must keep it asserted until READY,
    * the master's READY is not conditioned on any other slave, and the other slaves' responses are
    * simply made to wait their turn -- which the crossbar was free to do anyway.
    *
    * @param fresh
    *   the combinational one-hot pick for this cycle
    * @param done
    *   given the selection actually in force this cycle, the condition that releases it: B/RREADY
    *   for a single beat, RREADY && RLAST for a burst. It takes the selection rather than a plain
    *   Bool because while the lock is held the beat being delivered belongs to the *held* slave,
    *   not to the fresh pick, and reading RLAST from the wrong one would release mid-burst.
    */
  def lockResp(fresh: Bits)(done: Bits => Bool): Bits = {
    val held   = RegInit(False).setWeakName("respLock")
    val heldOH = Reg(Bits(fresh.getWidth bits)).init(0).setWeakName("respLockOH")
    val oh     = held ? heldOH | fresh
    // Nothing selected means nothing to hold, so the lock also clears itself
    // when the slaves go quiet -- a stale one would re-present a slave that is
    // no longer offering a response.
    when(oh.orR && !done(oh)) {
      held   := True
      heldOH := oh
    } otherwise {
      held := False
    }
    oh
  }

  // =========================================================================
  // ID encode / decode
  // =========================================================================
  def encodeId(masterIdx: UInt, masterId: UInt): UInt =
    (masterIdx.resize(masterIdxBits) ## masterId.resize(maxMasterIdW)).asUInt

  def decodeMasterIdx(expandedId: UInt): UInt =
    (expandedId >> maxMasterIdW).resize(masterIdxBits max 1)

  def decodeMasterId(expandedId: UInt): UInt =
    expandedId(maxMasterIdW - 1 downto 0)

  // =========================================================================
  // Safe one-hot → index (avoids 0-bit UInt from OHToUInt when M=1)
  // =========================================================================
  val ptrW = log2Up(M max 2)

  def ohToIdx(grant: Bits): UInt = {
    val idx = UInt(ptrW bits)
    idx := 0
    for (mi <- 0 until M) when(grant(mi)) { idx := mi }
    idx
  }

  // =========================================================================
  // AW/AR field copy helpers (handle id-width mismatch between master/slave)
  // =========================================================================
  def copyAwToSlave(si: Int, mi: Int, grantIdx: UInt): Unit = {
    val slv  = busSlaves(si)
    val mCfg = cfg.masters(mi).config
    slv.aw.addr                     := io.masters(mi).aw.addr.resized
    if (mCfg.useProt) slv.aw.prot   := io.masters(mi).aw.prot
    if (mCfg.useLen) slv.aw.len     := io.masters(mi).aw.len
    if (mCfg.useSize) slv.aw.size   := io.masters(mi).aw.size
    if (mCfg.useBurst) slv.aw.burst := io.masters(mi).aw.burst
    if (mCfg.useLock) slv.aw.lock   := io.masters(mi).aw.lock
    if (mCfg.useCache) slv.aw.cache := io.masters(mi).aw.cache
    if (mCfg.useQos) slv.aw.qos     := io.masters(mi).aw.qos
    // The master index goes into the ID even when the master has none of its
    // own: responses find their way home by ID, so an ID-less master that is
    // not master 0 would have its responses decoded as master 0's.
    if (busSlaveCfgs(si).useId)
      slv.aw.id := encodeId(grantIdx, if (mCfg.useId) io.masters(mi).aw.id else U(0, 1 bits))
    io.masters(mi).aw.ready := slv.aw.ready
  }

  def copyArToSlave(si: Int, mi: Int, grantIdx: UInt): Unit = {
    val slv  = busSlaves(si)
    val mCfg = cfg.masters(mi).config
    slv.ar.addr                     := io.masters(mi).ar.addr.resized
    if (mCfg.useProt) slv.ar.prot   := io.masters(mi).ar.prot
    if (mCfg.useLen) slv.ar.len     := io.masters(mi).ar.len
    if (mCfg.useSize) slv.ar.size   := io.masters(mi).ar.size
    if (mCfg.useBurst) slv.ar.burst := io.masters(mi).ar.burst
    if (mCfg.useLock) slv.ar.lock   := io.masters(mi).ar.lock
    if (mCfg.useCache) slv.ar.cache := io.masters(mi).ar.cache
    if (mCfg.useQos) slv.ar.qos     := io.masters(mi).ar.qos
    // The master index goes into the ID even when the master has none of its
    // own: responses find their way home by ID, so an ID-less master that is
    // not master 0 would have its responses decoded as master 0's.
    if (busSlaveCfgs(si).useId)
      slv.ar.id := encodeId(grantIdx, if (mCfg.useId) io.masters(mi).ar.id else U(0, 1 bits))
    io.masters(mi).ar.ready := slv.ar.ready
  }

  // =========================================================================
  // Shared round-robin pointers
  // =========================================================================
  val wrRrPtr = Vec(Seq.fill(Sx)(RegInit(U(0, ptrW bits))))
  val rdRrPtr = Vec(Seq.fill(Sx)(RegInit(U(0, ptrW bits))))

  // ── WRR credit counters (only allocated when WeightedRoundRobin) ────────
  val wrrWeights = cfg.arbitration match {
    case WeightedRoundRobin(w) => w
    case _                     => Seq.fill(M)(1)
  }
  val creditW = log2Up(wrrWeights.max + 1)

  val wrCredits = cfg.arbitration match {
    case WeightedRoundRobin(_) =>
      Vec(
        Seq.tabulate(Sx)(_ => Vec(Seq.tabulate(M)(mi => RegInit(U(wrrWeights(mi), creditW bits)))))
      )
    case _ => null
  }
  val rdCredits = cfg.arbitration match {
    case WeightedRoundRobin(_) =>
      Vec(
        Seq.tabulate(Sx)(_ => Vec(Seq.tabulate(M)(mi => RegInit(U(wrrWeights(mi), creditW bits)))))
      )
    case _ => null
  }

  val wrQosAge = cfg.arbitration match {
    case QosBased =>
      Vec(Seq.tabulate(Sx)(_ => Vec(Seq.fill(M)(RegInit(U(0, qosAgeW bits))))))
    case _ => null
  }
  val rdQosAge = cfg.arbitration match {
    case QosBased =>
      Vec(Seq.tabulate(Sx)(_ => Vec(Seq.fill(M)(RegInit(U(0, qosAgeW bits))))))
    case _ => null
  }

  /** Decrement credit for the granted master, reset all when exhausted. */
  def wrrOnGrant(credits: Vec[Vec[UInt]], si: Int, grantIdx: UInt, requests: Bits): Unit = {
    if (credits == null) return
    for (mi <- 0 until M) {
      when(grantIdx === mi && credits(si)(mi) =/= 0) {
        credits(si)(mi) := credits(si)(mi) - 1
      }
    }
    val allExhausted = Bool()
    allExhausted := True
    for (mi <- 0 until M) {
      when(requests(mi)) {
        val afterDec = UInt(creditW bits)
        afterDec := credits(si)(mi)
        when(grantIdx === mi && credits(si)(mi) =/= 0) {
          afterDec := credits(si)(mi) - 1
        }
        when(afterDec =/= 0) { allExhausted := False }
      }
    }
    when(allExhausted) {
      for (mi <- 0 until M) {
        credits(si)(mi) := U(wrrWeights(mi), creditW bits)
      }
    }
  }

  // =========================================================================
  // Defaults — every signal driven before any when() overrides
  // =========================================================================
  for (mi <- 0 until M) {
    io.masters(mi).aw.ready := False
    io.masters(mi).w.ready  := False
    io.masters(mi).b.valid  := False
    io.masters(mi).b.payload.clearAll()
    io.masters(mi).ar.ready := False
    io.masters(mi).r.valid  := False
    io.masters(mi).r.payload.clearAll()
  }
  for (si <- 0 until Sx) {
    busSlaves(si).aw.valid := False
    busSlaves(si).aw.payload.clearAll()
    busSlaves(si).w.valid := False
    busSlaves(si).w.payload.clearAll()
    busSlaves(si).b.ready  := False
    busSlaves(si).ar.valid := False
    busSlaves(si).ar.payload.clearAll()
    busSlaves(si).r.ready := False
  }

  // =========================================================================
  // Mode selection at elaboration time
  // =========================================================================
  if (cfg.maxOutstanding == 1) {
    // =====================================================================
    // BLOCKING mode — one transaction per slave per direction
    // =====================================================================
    val wrActive  = Vec(Seq.fill(Sx)(RegInit(False)))
    val wrGranted = Vec(Seq.fill(Sx)(RegInit(U(0, ptrW bits))))

    /** Has the write this slave is holding already had all of its data?
      *
      * Blocking mode owns a slave from AW until B and forwards the granted master's W for that
      * whole time -- including after the burst's last beat has already gone through. A master may
      * legally present the next burst's data before its AW is accepted, and while B is outstanding
      * that AW cannot be accepted anywhere (masterBusy holds the master to one slave), so those
      * beats land here, under the previous address, whichever slave the next burst was actually
      * addressed to. The same happens before AW: the bypass below is open while the AW waits, so a
      * burst delivered entirely early leaves it open for the beats after it.
      *
      * This bit closes W once the data this slave was given is complete, and opens it again when B
      * retires the transaction. It is the blocking counterpart of wPreLast in the pipelined path.
      */
    val wrDataDone = Vec(Seq.fill(Sx)(RegInit(False)))

    val rdActive  = Vec(Seq.fill(Sx)(RegInit(False)))
    val rdGranted = Vec(Seq.fill(Sx)(RegInit(U(0, ptrW bits))))

    /** Is this master already occupying some slave in this direction?
      *
      * Blocking mode routes W, B and R per slave, driving the granted master's channels from inside
      * the slave's own block. That is only sound while a master occupies at most one slave. With
      * two, both blocks drive the same master's B -- the last one written wins, and yet *both*
      * slaves are handed that master's BREADY, so the losing slave's response would fire and reach
      * no one. The W path would be worse, both slaves taking the same beat.
      *
      * This guard makes that invariant explicit rather than assumed: a master is held to one
      * transaction per direction, which is what "blocking" already claimed, and more than one in
      * flight is what the pipelined mode is for.
      *
      * Honest about its status: this is defensive. The hazard is visible in the structure above,
      * but no simulation here has reached the two-slaves-active state, because getting there needs
      * a master to issue a second AW before sending the first W and the slave models will not
      * assert AWREADY until a W beat is present. So it is an unreached state closed off, not a
      * reproduced bug fixed -- unlike the response-mux instability in lockResp, which
      * ResponseStabilitySpec demonstrates failing without it.
      */
    def masterBusy(active: Vec[Bool], granted: Vec[UInt], mi: Int): Bool =
      (0 until Sx).map(si => active(si) && granted(si) === mi).reduceBalancedTree(_ || _)

    // --- Blocking write path ---
    for (si <- 0 until Sx) {
      val slv = busSlaves(si)

      when(!wrActive(si)) {
        val requests = Bits(M bits)
        val qos      = Vec(UInt(4 bits), M)
        for (mi <- 0 until M) {
          requests(mi) := io.masters(mi).aw.valid && addrDecodeOH(io.masters(mi).aw.addr)(si) &&
            !masterBusy(wrActive, wrGranted, mi)
          qos(mi) := (if (cfg.masters(mi).config.useQos) io.masters(mi).aw.qos.asUInt
                      else U(0, 4 bits))
        }
        val qosEff = if (wrQosAge != null) ageQos(qos, wrQosAge(si)) else qos

        val grant =
          arbitrate(requests, wrRrPtr(si), qosEff, if (wrCredits != null) wrCredits(si) else null)
        val grantIdx = lockGrant(ohToIdx(grant), slv.aw.valid, slv.aw.ready)
        val anyReq   = requests.orR

        when(anyReq) {
          slv.aw.valid := True
          for (mi <- 0 until M) {
            when(grantIdx === mi) {
              copyAwToSlave(si, mi, grantIdx)
              // Also forward W alongside AW so that IPIF-based AXI4-Lite slaves
              // (which require AWVALID & WVALID simultaneously before asserting AWREADY)
              // can complete the handshake.  If the slave fires W here the master
              // deasserts wvalid and the 'otherwise' branch below sends nothing.
              // Closed again once this burst's data is all sent: what follows it
              // belongs to the next burst, which may not be for this slave.
              when(!wrDataDone(si)) {
                slv.w.valid            := io.masters(mi).w.valid
                slv.w.payload          := io.masters(mi).w.payload
                io.masters(mi).w.ready := slv.w.ready
              }
            }
          }
          when(slv.aw.fire) {
            wrActive(si)  := True
            wrGranted(si) := grantIdx
            wrRrPtr(si)   := (grantIdx + 1).resized
            wrrOnGrant(wrCredits, si, grantIdx, requests)
          }
        }
        if (wrQosAge != null) updateQosAge(wrQosAge(si), requests, slv.aw.fire, grantIdx)

      } otherwise {
        val gmi = wrGranted(si)
        for (mi <- 0 until M) {
          when(gmi === mi) {
            when(!wrDataDone(si)) {
              slv.w.valid            := io.masters(mi).w.valid
              slv.w.payload          := io.masters(mi).w.payload
              io.masters(mi).w.ready := slv.w.ready
            }

            io.masters(mi).b.valid                                    := slv.b.valid
            if (cfg.masters(mi).config.useResp) io.masters(mi).b.resp := slv.b.resp
            if (cfg.masters(mi).config.useId) io.masters(mi).b.id     := decodeMasterId(slv.b.id)
            slv.b.ready                                               := io.masters(mi).b.ready
          }
        }
        when(slv.b.fire) { wrActive(si) := False }
      }

      // B wins over a last beat in the same cycle: that pair ends the
      // transaction, and the next one starts with its data still to come.
      val wrLastBeat = if (busSlaveCfgs(si).useLast) slv.w.last else True
      when(slv.b.fire) {
        wrDataDone(si) := False
      } elsewhen (slv.w.fire && wrLastBeat) {
        wrDataDone(si) := True
      }
    }

    // --- Blocking read path ---
    for (si <- 0 until Sx) {
      val slv = busSlaves(si)

      when(!rdActive(si)) {
        val requests = Bits(M bits)
        val qos      = Vec(UInt(4 bits), M)
        for (mi <- 0 until M) {
          requests(mi) := io.masters(mi).ar.valid && addrDecodeOH(io.masters(mi).ar.addr)(si) &&
            !masterBusy(rdActive, rdGranted, mi)
          qos(mi) := (if (cfg.masters(mi).config.useQos) io.masters(mi).ar.qos.asUInt
                      else U(0, 4 bits))
        }
        val qosEff = if (rdQosAge != null) ageQos(qos, rdQosAge(si)) else qos

        val grant =
          arbitrate(requests, rdRrPtr(si), qosEff, if (rdCredits != null) rdCredits(si) else null)
        val grantIdx = lockGrant(ohToIdx(grant), slv.ar.valid, slv.ar.ready)
        val anyReq   = requests.orR

        when(anyReq) {
          slv.ar.valid := True
          for (mi <- 0 until M) {
            when(grantIdx === mi) { copyArToSlave(si, mi, grantIdx) }
          }
          when(slv.ar.fire) {
            rdActive(si)  := True
            rdGranted(si) := grantIdx
            rdRrPtr(si)   := (grantIdx + 1).resized
            wrrOnGrant(rdCredits, si, grantIdx, requests)
          }
        }
        if (rdQosAge != null) updateQosAge(rdQosAge(si), requests, slv.ar.fire, grantIdx)

      } otherwise {
        val gmi = rdGranted(si)
        for (mi <- 0 until M) {
          when(gmi === mi) {
            io.masters(mi).r.valid                                    := slv.r.valid
            io.masters(mi).r.data                                     := slv.r.data.resized
            if (cfg.masters(mi).config.useResp) io.masters(mi).r.resp := slv.r.resp
            if (cfg.masters(mi).config.useLast) io.masters(mi).r.last := slv.r.last
            if (cfg.masters(mi).config.useId) io.masters(mi).r.id     := decodeMasterId(slv.r.id)
            slv.r.ready                                               := io.masters(mi).r.ready
          }
        }
        if (busSlaveCfgs(si).useLast) {
          when(slv.r.fire && slv.r.last) { rdActive(si) := False }
        } else {
          when(slv.r.fire) { rdActive(si) := False }
        }
      }
    }

  } else {
    // =====================================================================
    // PIPELINED mode — up to maxOutstanding transactions per slave
    // =====================================================================
    val depth = cfg.maxOutstanding
    val cntW  = log2Up(depth + 1) // counter width to hold 0..depth

    // --- Per-slave write state ---
    val wrOutstanding = Vec(
      Seq.fill(Sx)(RegInit(U(0, cntW bits)))
    ) // AW accepted, B not yet returned
    val wFifoMem   = (0 until Sx).map(_ => Mem(UInt(ptrW bits), depth))
    val wFifoWrPtr = Vec(Seq.fill(Sx)(RegInit(U(0, log2Up(depth) bits))))
    val wFifoRdPtr = Vec(Seq.fill(Sx)(RegInit(U(0, log2Up(depth) bits))))
    val wFifoCount = Vec(Seq.fill(Sx)(RegInit(U(0, cntW bits)))) // entries with W pending

    // --- Per-slave read state ---
    val rdOutstanding = Vec(Seq.fill(Sx)(RegInit(U(0, cntW bits))))

    // =================================================================
    // Ordering: single slave per ID, plus the extended write rule
    // =================================================================
    // AXI4 requires transactions that share an ID and direction to complete in
    // the order they were issued, whichever slave each went to, and -- W having
    // carried no ID since AXI3 -- requires a master's write beats to follow its
    // own AW order. Neither falls out of the per-slave counters above: those
    // record what each slave still owes, not what each master is owed. Without
    // the state below, a same-ID read to a fast slave overtakes one still
    // waiting at a slow one, and a master with writes at two slaves has both
    // W-route FIFOs naming it at their heads, so both slaves take its beats and
    // the second beat is stranded. ResponseStabilitySpec demonstrates each.
    //
    // The rule is the one the industry uses, "single slave per ID": an ID may
    // have work outstanding at only one slave, and a request to a second one
    // waits. AMD states it in PG059, Arm's NIC-400 calls it a cyclic-dependency
    // -avoidance scheme, and Forencich's verilog-axi and PULP's axi_demux both
    // implement it. Like those, this is a small fixed table of live IDs
    // (cfg.idThreads, 2 by default) rather than an entry per ID value: a
    // request whose ID matches no live thread waits for a free thread, which
    // costs a stall and never correctness.
    //
    // W needs a second rule on top, NIC-400's "extended write rule": a master
    // may not address a new slave until every write it has already issued has
    // sent its last W beat. Per-ID threads do not cover this, because a master
    // using two IDs can legally have writes at two slaves and would then owe W
    // data to both.
    val threads = cfg.idThreads
    val destW   = log2Up(Sx max 2)
    val thIdW   = maxMasterIdW max 1

    // Indexed [master][thread].
    val wrThActive = Vec(Seq.fill(M)(Vec(Seq.fill(threads)(RegInit(False)))))
    val wrThId     = Vec(Seq.fill(M)(Vec(Seq.fill(threads)(RegInit(U(0, thIdW bits))))))
    val wrThDest   = Vec(Seq.fill(M)(Vec(Seq.fill(threads)(RegInit(U(0, destW bits))))))
    val wrThCount  = Vec(Seq.fill(M)(Vec(Seq.fill(threads)(RegInit(U(0, cntW bits))))))
    val rdThActive = Vec(Seq.fill(M)(Vec(Seq.fill(threads)(RegInit(False)))))
    val rdThId     = Vec(Seq.fill(M)(Vec(Seq.fill(threads)(RegInit(U(0, thIdW bits))))))
    val rdThDest   = Vec(Seq.fill(M)(Vec(Seq.fill(threads)(RegInit(U(0, destW bits))))))
    val rdThCount  = Vec(Seq.fill(M)(Vec(Seq.fill(threads)(RegInit(U(0, cntW bits))))))

    // Write beats still owed, and the slave they are owed to. Counted from the
    // master's own AW/W handshakes, so it is the master's debt rather than any
    // one slave's view of it.
    val wDebt    = Vec(Seq.fill(M)(RegInit(U(0, cntW bits))))
    val wDebtSlv = Vec(Seq.fill(M)(RegInit(U(0, destW bits))))

    /** Which slave a one-hot decode names.
      *
      * Written out rather than OHToUInt so that a single-slave fabric -- Sx = 1, where OHToUInt
      * would yield a zero-width result -- still produces a usable index (see ohToIdx).
      */
    def destOf(oh: Bits): UInt = {
      val idx = UInt(destW bits)
      idx := 0
      for (si <- 0 until Sx) when(oh(si)) { idx := si }
      idx
    }

    /** The ID a master's address channel is presenting, in the table's width.
      *
      * A master without IDs has exactly one implicit thread, which a constant zero gives it.
      */
    def awIdOf(mi: Int): UInt =
      if (cfg.masters(mi).config.useId) io.masters(mi).aw.id.resize(thIdW) else U(0, thIdW bits)
    def arIdOf(mi: Int): UInt =
      if (cfg.masters(mi).config.useId) io.masters(mi).ar.id.resize(thIdW) else U(0, thIdW bits)
    def bIdOf(mi: Int): UInt =
      if (cfg.masters(mi).config.useId) io.masters(mi).b.id.resize(thIdW) else U(0, thIdW bits)
    def rIdOf(mi: Int): UInt =
      if (cfg.masters(mi).config.useId) io.masters(mi).r.id.resize(thIdW) else U(0, thIdW bits)

    /** Which slaves this ID may be issued to this cycle.
      *
      * The slave its thread already targets, if it has one and that thread is not already at the
      * outstanding limit; any slave at all if the ID is new and a thread is free; nothing
      * otherwise.
      */
    def thAllow(
      active: Vec[Bool],
      tid: Vec[UInt],
      dest: Vec[UInt],
      count: Vec[UInt],
      id: UInt
    ): Bits = {
      val hit     = (0 until threads).map(t => active(t) && tid(t) === id)
      val anyHit  = hit.reduceBalancedTree(_ || _)
      val freeVec = Bits(threads bits)
      for (t <- 0 until threads) freeVec(t) := !active(t)
      val out = Bits(Sx bits)
      for (si <- 0 until Sx) {
        out(si) := (0 until threads)
          .map(t => hit(t) && dest(t) === si && count(t) =/= depth)
          .reduceBalancedTree(_ || _) || (!anyHit && freeVec.orR)
      }
      out
    }

    /** Claim and release a thread.
      *
      * Both halves live in one place because both can land on the same thread in the same cycle --
      * a response arriving as the next request of that ID is accepted -- and the count must then
      * simply hold rather than be written twice.
      */
    def thUpdate(
      active: Vec[Bool],
      tid: Vec[UInt],
      dest: Vec[UInt],
      count: Vec[UInt],
      iss: Bool,
      issId: UInt,
      issDest: UInt,
      ret: Bool,
      retId: UInt
    ): Unit = {
      val hit     = (0 until threads).map(t => active(t) && tid(t) === issId)
      val anyHit  = hit.reduceBalancedTree(_ || _)
      val freeVec = Bits(threads bits)
      for (t <- 0 until threads) freeVec(t) := !active(t)
      // First free thread, so a new ID lands on exactly one of them.
      val freeOH = OHMasking.first(freeVec)
      for (t <- 0 until threads) {
        val claim = iss && !anyHit && freeOH(t) // this thread is being taken now
        val inc   = iss && (hit(t) || claim)
        // What this thread holds *this cycle*, not what its register holds: a
        // thread being claimed in this very cycle already carries the ID being
        // claimed. A slave may answer in the same cycle it accepts the address
        // -- an AXI4-Lite register file does exactly that, which is what
        // LiteSameCycleResponseSpec pins -- so a transaction can retire on the
        // cycle it is issued. Reading the register here would miss that
        // release and strand the thread, and a stranded thread pins its master
        // to one slave for good.
        val heldId = claim ? issId | tid(t)
        val live   = active(t) || claim
        val dec    = ret && live && heldId === retId
        when(inc && !dec) {
          active(t) := True
          tid(t)    := issId
          dest(t)   := issDest
          count(t)  := count(t) + 1
        } elsewhen (!inc && dec) {
          count(t) := count(t) - 1
          when(count(t) === 1) { active(t) := False }
        }
      }
    }

    // Per-master admission masks, computed once and read by every slave's
    // arbiter below. The write mask carries the extended write rule as well.
    val awAllow = Vec(Bits(Sx bits), M)
    val arAllow = Vec(Bits(Sx bits), M)
    for (mi <- 0 until M) {
      val byId = thAllow(wrThActive(mi), wrThId(mi), wrThDest(mi), wrThCount(mi), awIdOf(mi))
      for (si <- 0 until Sx) {
        awAllow(mi)(si) := byId(si) && (wDebt(mi) === 0 || wDebtSlv(mi) === si)
      }
      arAllow(mi) := thAllow(rdThActive(mi), rdThId(mi), rdThDest(mi), rdThCount(mi), arIdOf(mi))
    }

    // A slave may raise WREADY before AWREADY -- AXI4 orders neither against
    // the other -- and the IPIF bypass below offers W alongside the AW it is
    // presenting, so a beat can reach the slave before its address does. The
    // data itself is fine: the bypass only runs while the W route is empty, so
    // the beat goes to the very slave the AW is aimed at. The bookkeeping is
    // not, because it counts a beat the FIFO never had an entry for and a debt
    // that was never incurred. These two report such beats back to the debt
    // counter, indexed [master](slave); each bit is driven exactly once, by the
    // slave block that owns it.
    val wPreBeatOH = Vec(Bits(Sx bits), M) // a beat went out ahead of its AW
    val wPreDoneOH = Vec(Bits(Sx bits), M) // an AW fired whose data is all sent

    // =================================================================
    // Per-slave AW arbitration + W forwarding
    // =================================================================
    for (si <- 0 until Sx) {
      val slv = busSlaves(si)

      // -- AW: accept new write addresses while below depth --
      val awCanAccept = wrOutstanding(si) < depth
      val requests    = Bits(M bits)
      val qos         = Vec(UInt(4 bits), M)
      for (mi <- 0 until M) {
        requests(mi) := io.masters(mi).aw.valid && addrDecodeOH(io.masters(mi).aw.addr)(si) &&
          awAllow(mi)(si)
        qos(mi) := (if (cfg.masters(mi).config.useQos) io.masters(mi).aw.qos.asUInt
                    else U(0, 4 bits))
      }
      val qosEff = if (wrQosAge != null) ageQos(qos, wrQosAge(si)) else qos

      val grant =
        arbitrate(requests, wrRrPtr(si), qosEff, if (wrCredits != null) wrCredits(si) else null)
      val grantIdx = lockGrant(ohToIdx(grant), slv.aw.valid, slv.aw.ready)
      val anyReq   = requests.orR

      // Declare FIFO-empty signal early — needed in both the AW block (IPIF fix)
      // and the W-forwarding block below.
      val wFifoEmpty  = wFifoCount(si) === 0
      val wHeadMaster = wFifoMem(si).readAsync(wFifoRdPtr(si))

      // Set when a whole burst reached this slave through the bypass before its
      // AW was accepted. Only one AW can be in that state at a time: the bypass
      // needs an empty route FIFO, and lockGrant holds the grant while the AW
      // waits, so the burst being offered cannot change underneath it.
      val wPreLast = RegInit(False)

      when(awCanAccept && anyReq) {
        slv.aw.valid := True
        for (mi <- 0 until M) {
          when(grantIdx === mi) {
            copyAwToSlave(si, mi, grantIdx)
            // Also forward W alongside AW when the W-route FIFO is empty, so that
            // IPIF-based AXI4-Lite slaves (which require AWVALID & WVALID
            // simultaneously before asserting AWREADY) can complete the handshake.
            // Once AW fires the FIFO entry is pushed and normal W routing takes over.
            //
            // Closed again once this burst's data is all sent (wPreLast). W runs
            // ahead of AW by master order, so the next beats belong to the master's
            // *next* AW -- which is still behind this stalled one and may be aimed
            // at a different slave. Leaving it open hands that burst's data to this
            // slave: to the wrong slave outright if it was addressed elsewhere, and
            // to a route entry and a debt that can never be discharged if it was
            // addressed here. It reopens when the stalled AW is finally accepted.
            when(wFifoEmpty && !wPreLast) {
              slv.w.valid            := io.masters(mi).w.valid
              slv.w.payload          := io.masters(mi).w.payload
              io.masters(mi).w.ready := slv.w.ready
            }
          }
        }
      }

      // A bypass beat is one this slave takes while the W route is empty: one
      // the block above offered alongside the AW it is presenting. If AW fires
      // in the same cycle the pair is ordinary; if it does not, the beat has
      // run ahead of its address and no FIFO entry exists for it.
      val wLastBeat  = if (busSlaveCfgs(si).useLast) slv.w.last else True
      val awFire     = slv.aw.fire
      val bypassBeat = awCanAccept && anyReq && wFifoEmpty && !wPreLast && slv.w.fire
      val bypassDone = wPreLast || (bypassBeat && wLastBeat)
      when(awFire) {
        wPreLast := False
      } elsewhen (bypassBeat && wLastBeat) {
        wPreLast := True
      }
      for (mi <- 0 until M) {
        wPreBeatOH(mi)(si) := bypassBeat && grantIdx === mi
        wPreDoneOH(mi)(si) := awFire && bypassDone && grantIdx === mi
      }

      // On AW handshake: push master index into W-route FIFO -- unless the
      // bypass has already delivered the whole burst, in which case there is
      // no data left to route and an entry would never be popped.
      val awPush = awFire && !bypassDone
      when(awPush) {
        wFifoMem(si).write(wFifoWrPtr(si), grantIdx)
        wFifoWrPtr(si) := ((wFifoWrPtr(si) === U(depth - 1)) ?
          U(0) | (wFifoWrPtr(si) + 1)).resized
      }
      // Arbitration bookkeeping follows the handshake, not the push: the slave
      // owes a B for every AW it accepted, whatever became of the data.
      when(awFire) {
        wrRrPtr(si) := (grantIdx + 1).resized
        wrrOnGrant(wrCredits, si, grantIdx, requests)
      }
      if (wrQosAge != null) updateQosAge(wrQosAge(si), requests, awFire, grantIdx)

      // -- W: forward beats from the master at the FIFO head --
      when(!wFifoEmpty) {
        for (mi <- 0 until M) {
          when(wHeadMaster === mi) {
            slv.w.valid            := io.masters(mi).w.valid
            slv.w.payload          := io.masters(mi).w.payload
            io.masters(mi).w.ready := slv.w.ready
          }
        }
      }

      // Pop FIFO when last W beat is accepted
      // Only beats routed through the FIFO pop it; a bypass beat has no entry.
      val wPop = slv.w.fire && wLastBeat && !bypassBeat
      when(wPop) {
        wFifoRdPtr(si) := ((wFifoRdPtr(si) === U(depth - 1)) ?
          U(0) | (wFifoRdPtr(si) + 1)).resized
      }

      // FIFO count: handle simultaneous push + pop
      when(awPush && !wPop) {
        wFifoCount(si) := wFifoCount(si) + 1
      } elsewhen (!awPush && wPop) {
        wFifoCount(si) := wFifoCount(si) - 1
      }
      // simultaneous push+pop: count stays the same

      // Outstanding write counter: inc on AW fire, dec on B fire
      val bDec = slv.b.fire
      when(awFire && !bDec) {
        wrOutstanding(si) := wrOutstanding(si) + 1
      } elsewhen (!awFire && bDec) {
        wrOutstanding(si) := wrOutstanding(si) - 1
      }
    }

    // --- Ordering bookkeeping, from the master's own handshakes -------------
    // Placed after the AW loop because it reads the AWREADY that loop drives.
    // The destination is read back out of the address decode rather than out of
    // the grant, which keeps it independent of which slave's arbiter won: the
    // decode is one-hot over Sx, and with the decode-error responder enabled
    // its bit is the catch-all, so an unmapped address names the responder.
    // With it disabled such an address is never accepted, so nothing fires.
    for (mi <- 0 until M) {
      val m = io.masters(mi)

      // Writes: claimed on AW, released on B.
      thUpdate(
        wrThActive(mi),
        wrThId(mi),
        wrThDest(mi),
        wrThCount(mi),
        iss = m.aw.valid && m.aw.ready,
        issId = awIdOf(mi),
        issDest = destOf(addrDecodeOH(m.aw.addr)),
        ret = m.b.valid && m.b.ready,
        retId = bIdOf(mi)
      )

      // Reads: claimed on AR, released on the last beat of R.
      val rLast = if (cfg.masters(mi).config.useLast) m.r.last else True
      thUpdate(
        rdThActive(mi),
        rdThId(mi),
        rdThDest(mi),
        rdThCount(mi),
        iss = m.ar.valid && m.ar.ready,
        issId = arIdOf(mi),
        issDest = destOf(addrDecodeOH(m.ar.addr)),
        ret = m.r.valid && m.r.ready && rLast,
        retId = rIdOf(mi)
      )

      // Write-data debt: incurred on AW, discharged by the burst's last W beat.
      // A beat the bypass sent ahead of its AW discharges a debt that has not
      // been incurred yet, and the AW it belongs to incurs one that is already
      // discharged. Suppressing both keeps the counter on its feet; letting
      // either through wraps it, and a wrapped debt withdraws an AWVALID the
      // slave is still looking at.
      val wLast   = if (cfg.masters(mi).config.useLast) m.w.last else True
      val debtInc = m.aw.valid && m.aw.ready && !wPreDoneOH(mi).orR
      val debtDec = m.w.valid && m.w.ready && wLast && !wPreBeatOH(mi).orR
      when(debtInc && !debtDec) {
        wDebt(mi) := wDebt(mi) + 1
      } elsewhen (!debtInc && debtDec) {
        wDebt(mi) := wDebt(mi) - 1
      }
      when(debtInc) { wDebtSlv(mi) := destOf(addrDecodeOH(m.aw.addr)) }
    }

    // =================================================================
    // Per-master B routing (ID-based)
    // =================================================================
    for (mi <- 0 until M) {
      // Which slaves have a B response destined for this master?
      val bHits = Bits(Sx bits)
      for (si <- 0 until Sx) {
        val slv = busSlaves(si)
        bHits(si) := slv.b.valid && (decodeMasterIdx(slv.b.id) === mi)
      }

      // Priority: pick lowest-numbered slave with a pending B, then hold that
      // pick until the master accepts it (see lockResp).
      val bGrant = lockResp(OHMasking.first(bHits))(_ => io.masters(mi).b.ready)

      for (si <- 0 until Sx) {
        when(bGrant(si)) {
          val slv = busSlaves(si)
          // From the slave's own VALID, not True. The selection is now held
          // across stalls, so it can point at a slave on a cycle that slave is
          // not offering anything -- before the hold it was derived from the
          // valid vector itself and True was safe.
          io.masters(mi).b.valid                                    := slv.b.valid
          if (cfg.masters(mi).config.useResp) io.masters(mi).b.resp := slv.b.resp
          if (cfg.masters(mi).config.useId) io.masters(mi).b.id     := decodeMasterId(slv.b.id)
          slv.b.ready                                               := io.masters(mi).b.ready
        }
      }
    }

    // =================================================================
    // Per-slave AR arbitration
    // =================================================================
    for (si <- 0 until Sx) {
      val slv = busSlaves(si)

      val arCanAccept = rdOutstanding(si) < depth
      val requests    = Bits(M bits)
      val qos         = Vec(UInt(4 bits), M)
      for (mi <- 0 until M) {
        requests(mi) := io.masters(mi).ar.valid && addrDecodeOH(io.masters(mi).ar.addr)(si) &&
          arAllow(mi)(si)
        qos(mi) := (if (cfg.masters(mi).config.useQos) io.masters(mi).ar.qos.asUInt
                    else U(0, 4 bits))
      }
      val qosEff = if (rdQosAge != null) ageQos(qos, rdQosAge(si)) else qos

      val grant =
        arbitrate(requests, rdRrPtr(si), qosEff, if (rdCredits != null) rdCredits(si) else null)
      val grantIdx = lockGrant(ohToIdx(grant), slv.ar.valid, slv.ar.ready)
      val anyReq   = requests.orR

      when(arCanAccept && anyReq) {
        slv.ar.valid := True
        for (mi <- 0 until M) {
          when(grantIdx === mi) { copyArToSlave(si, mi, grantIdx) }
        }
      }

      when(slv.ar.fire) {
        rdRrPtr(si) := (grantIdx + 1).resized
        wrrOnGrant(rdCredits, si, grantIdx, requests)
      }
      if (rdQosAge != null) updateQosAge(rdQosAge(si), requests, slv.ar.fire, grantIdx)

      // Outstanding read counter: inc on AR fire, dec on R last beat
      val rDec = Bool()
      if (busSlaveCfgs(si).useLast) {
        rDec := slv.r.fire && slv.r.last
      } else {
        rDec := slv.r.fire
      }
      val arInc = slv.ar.fire
      when(arInc && !rDec) {
        rdOutstanding(si) := rdOutstanding(si) + 1
      } elsewhen (!arInc && rDec) {
        rdOutstanding(si) := rdOutstanding(si) - 1
      }
    }

    // =================================================================
    // Per-master R routing (ID-based)
    // =================================================================
    for (mi <- 0 until M) {
      val rHits = Bits(Sx bits)
      for (si <- 0 until Sx) {
        val slv = busSlaves(si)
        rHits(si) := slv.r.valid && (decodeMasterIdx(slv.r.id) === mi)
      }

      // Held to RLAST, not to the beat, so a burst is never interleaved with
      // another slave's burst to the same master (see lockResp).
      val rGrant = lockResp(OHMasking.first(rHits)) { sel =>
        val lastSel =
          (0 until Sx).map(si => sel(si) && busSlaves(si).r.last).reduceBalancedTree(_ || _)
        io.masters(mi).r.ready && lastSel
      }

      for (si <- 0 until Sx) {
        when(rGrant(si)) {
          val slv = busSlaves(si)
          // See the B channel above. This one matters more: a slave is entitled
          // to insert a bubble between beats of a burst, and the held selection
          // would otherwise present that bubble to the master as a real beat
          // carrying stale data -- which is what took the board down.
          io.masters(mi).r.valid                                    := slv.r.valid
          io.masters(mi).r.data                                     := slv.r.data.resized
          if (cfg.masters(mi).config.useResp) io.masters(mi).r.resp := slv.r.resp
          if (cfg.masters(mi).config.useLast) io.masters(mi).r.last := slv.r.last
          if (cfg.masters(mi).config.useId) io.masters(mi).r.id     := decodeMasterId(slv.r.id)
          slv.r.ready                                               := io.masters(mi).r.ready
        }
      }
    }
  }
}
