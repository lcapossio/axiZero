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
class Axi4Crossbar(cfg: AxiZeroConfig) extends Component {

  val M = cfg.numMasters
  val S = cfg.numSlaves
  val masterIdxBits = cfg.masterIndexBits

  // Derive a common master-side ID width (max across all masters)
  val maxMasterIdW = cfg.masters.map(_.config.idWidth).max

  // Slave-side ID width (expanded to encode originating master)
  val slaveIdW = maxMasterIdW + masterIdxBits

  // Build a slave-side Axi4Config (fabric width, expanded IDs)
  // Each slave port uses its own data width; width converters sit outside.
  def slaveFabricConfig(si: Int): Axi4Config =
    cfg.slaves(si).config.copy(
      dataWidth = cfg.fabricDataWidth,
      idWidth   = slaveIdW
    )

  val io = new Bundle {
    val masters = Vec(cfg.masters.indices.map(i => slave(Axi4(cfg.masters(i).config))))
    val slaves  = Vec(cfg.slaves.indices.map(i  => master(Axi4(cfg.slaves(i).config))))
  }

  // =========================================================================
  // Address decode helper — same as Lite crossbar
  // =========================================================================
  def addrDecodeOH(addr: UInt): Bits = {
    val result = Bits(S bits)
    for (si <- 0 until S) {
      val sp = cfg.slaves(si)
      result(si) := (addr >= sp.baseAddress) && (addr < (sp.baseAddress + sp.size))
    }
    result
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
      sum := rawQos(mi).resize(4 + qosAgeW) + age(mi).resize(4 + qosAgeW)
      eff(mi) := Mux(sum > U(15, 4 + qosAgeW bits), U(15, 4 bits), sum.resize(4))
    }
    eff
  }

  def updateQosAge(age: Vec[UInt], requests: Bits, grantFire: Bool, grantIdx: UInt): Unit = {
    for (mi <- 0 until M) {
      when(!requests(mi)) {
        age(mi) := 0
      } elsewhen(grantFire && (grantIdx === mi)) {
        age(mi) := 0
      } otherwise {
        when(age(mi) =/= U(qosAgeMax, qosAgeW bits)) {
          age(mi) := age(mi) + 1
        }
      }
    }
  }

  def qosGrant(requests: Bits, rrPtr: UInt, qos: Vec[UInt]): Bits = {
    // Compute max QoS among active requesters using a reduction tree (no feedback)
    val maskedQos = (0 until M).map(mi => Mux(requests(mi), qos(mi), U(0, 4 bits)))
    val maxQ = maskedQos.reduce((a, b) => Mux(a > b, a, b))

    val bestReqs = Bits(M bits)
    for (mi <- 0 until M) {
      bestReqs(mi) := requests(mi) && (qos(mi) === maxQ)
    }

    rrGrant(bestReqs, rrPtr)
  }

  def arbitrate(requests: Bits, rrPtr: UInt, qos: Vec[UInt] = null, credits: Vec[UInt] = null): Bits = cfg.arbitration match {
    case RoundRobin            => rrGrant(requests, rrPtr)
    case FixedPriority         => OHMasking.first(requests)
    case QosBased              => qosGrant(requests, rrPtr, qos)
    case WeightedRoundRobin(_) => wrrGrant(requests, rrPtr, credits)
  }

  def wrrGrant(requests: Bits, rrPtr: UInt, credits: Vec[UInt]): Bits = {
    val eligible = Bits(M bits)
    for (mi <- 0 until M) eligible(mi) := requests(mi) && (credits(mi) =/= 0)
    Mux(eligible.orR,
      rrGrant(eligible, rrPtr),
      rrGrant(requests, rrPtr))
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
    val slv = io.slaves(si)
    val mCfg = cfg.masters(mi).config
    slv.aw.addr  := io.masters(mi).aw.addr.resized
    if (mCfg.useProt)  slv.aw.prot  := io.masters(mi).aw.prot
    if (mCfg.useLen)   slv.aw.len   := io.masters(mi).aw.len
    if (mCfg.useSize)  slv.aw.size  := io.masters(mi).aw.size
    if (mCfg.useBurst) slv.aw.burst := io.masters(mi).aw.burst
    if (mCfg.useLock)  slv.aw.lock  := io.masters(mi).aw.lock
    if (mCfg.useCache) slv.aw.cache := io.masters(mi).aw.cache
    if (mCfg.useQos)   slv.aw.qos   := io.masters(mi).aw.qos
    if (mCfg.useId)    slv.aw.id    := encodeId(grantIdx, io.masters(mi).aw.id)
    io.masters(mi).aw.ready := slv.aw.ready
  }

  def copyArToSlave(si: Int, mi: Int, grantIdx: UInt): Unit = {
    val slv = io.slaves(si)
    val mCfg = cfg.masters(mi).config
    slv.ar.addr  := io.masters(mi).ar.addr.resized
    if (mCfg.useProt)  slv.ar.prot  := io.masters(mi).ar.prot
    if (mCfg.useLen)   slv.ar.len   := io.masters(mi).ar.len
    if (mCfg.useSize)  slv.ar.size  := io.masters(mi).ar.size
    if (mCfg.useBurst) slv.ar.burst := io.masters(mi).ar.burst
    if (mCfg.useLock)  slv.ar.lock  := io.masters(mi).ar.lock
    if (mCfg.useCache) slv.ar.cache := io.masters(mi).ar.cache
    if (mCfg.useQos)   slv.ar.qos   := io.masters(mi).ar.qos
    if (mCfg.useId)    slv.ar.id    := encodeId(grantIdx, io.masters(mi).ar.id)
    io.masters(mi).ar.ready := slv.ar.ready
  }

  // =========================================================================
  // Shared round-robin pointers
  // =========================================================================
  val wrRrPtr = Vec(Seq.fill(S)(RegInit(U(0, ptrW bits))))
  val rdRrPtr = Vec(Seq.fill(S)(RegInit(U(0, ptrW bits))))

  // ── WRR credit counters (only allocated when WeightedRoundRobin) ────────
  val wrrWeights = cfg.arbitration match {
    case WeightedRoundRobin(w) => w
    case _ => Seq.fill(M)(1)
  }
  val creditW = log2Up(wrrWeights.max + 1)

  val wrCredits = cfg.arbitration match {
    case WeightedRoundRobin(_) =>
      Vec(Seq.tabulate(S)(_ =>
        Vec(Seq.tabulate(M)(mi => RegInit(U(wrrWeights(mi), creditW bits))))))
    case _ => null
  }
  val rdCredits = cfg.arbitration match {
    case WeightedRoundRobin(_) =>
      Vec(Seq.tabulate(S)(_ =>
        Vec(Seq.tabulate(M)(mi => RegInit(U(wrrWeights(mi), creditW bits))))))
    case _ => null
  }

  val wrQosAge = cfg.arbitration match {
    case QosBased =>
      Vec(Seq.tabulate(S)(_ =>
        Vec(Seq.fill(M)(RegInit(U(0, qosAgeW bits))))))
    case _ => null
  }
  val rdQosAge = cfg.arbitration match {
    case QosBased =>
      Vec(Seq.tabulate(S)(_ =>
        Vec(Seq.fill(M)(RegInit(U(0, qosAgeW bits))))))
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
  for (si <- 0 until S) {
    io.slaves(si).aw.valid  := False
    io.slaves(si).aw.payload.clearAll()
    io.slaves(si).w.valid   := False
    io.slaves(si).w.payload.clearAll()
    io.slaves(si).b.ready   := False
    io.slaves(si).ar.valid  := False
    io.slaves(si).ar.payload.clearAll()
    io.slaves(si).r.ready   := False
  }

  // =========================================================================
  // Mode selection at elaboration time
  // =========================================================================
  if (cfg.maxOutstanding == 1) {
    // =====================================================================
    // BLOCKING mode — one transaction per slave per direction
    // =====================================================================
    val wrActive  = Vec(Seq.fill(S)(RegInit(False)))
    val wrGranted = Vec(Seq.fill(S)(RegInit(U(0, ptrW bits))))
    val rdActive  = Vec(Seq.fill(S)(RegInit(False)))
    val rdGranted = Vec(Seq.fill(S)(RegInit(U(0, ptrW bits))))

    // --- Blocking write path ---
    for (si <- 0 until S) {
      val slv = io.slaves(si)

      when(!wrActive(si)) {
        val requests = Bits(M bits)
        val qos      = Vec(UInt(4 bits), M)
        for (mi <- 0 until M) {
          requests(mi) := io.masters(mi).aw.valid && addrDecodeOH(io.masters(mi).aw.addr)(si)
          qos(mi)      := (if (cfg.masters(mi).config.useQos) io.masters(mi).aw.qos.asUInt else U(0, 4 bits))
        }
        val qosEff = if (wrQosAge != null) ageQos(qos, wrQosAge(si)) else qos

        val grant    = arbitrate(requests, wrRrPtr(si), qosEff, if (wrCredits != null) wrCredits(si) else null)
        val grantIdx = ohToIdx(grant)
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
              slv.w.valid            := io.masters(mi).w.valid
              slv.w.payload          := io.masters(mi).w.payload
              io.masters(mi).w.ready := slv.w.ready
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
            slv.w.valid   := io.masters(mi).w.valid
            slv.w.payload := io.masters(mi).w.payload
            io.masters(mi).w.ready := slv.w.ready

            io.masters(mi).b.valid := slv.b.valid
            if (cfg.masters(mi).config.useResp) io.masters(mi).b.resp := slv.b.resp
            if (cfg.masters(mi).config.useId)   io.masters(mi).b.id   := decodeMasterId(slv.b.id)
            slv.b.ready := io.masters(mi).b.ready
          }
        }
        when(slv.b.fire) { wrActive(si) := False }
      }
    }

    // --- Blocking read path ---
    for (si <- 0 until S) {
      val slv = io.slaves(si)

      when(!rdActive(si)) {
        val requests = Bits(M bits)
        val qos      = Vec(UInt(4 bits), M)
        for (mi <- 0 until M) {
          requests(mi) := io.masters(mi).ar.valid && addrDecodeOH(io.masters(mi).ar.addr)(si)
          qos(mi)      := (if (cfg.masters(mi).config.useQos) io.masters(mi).ar.qos.asUInt else U(0, 4 bits))
        }
        val qosEff = if (rdQosAge != null) ageQos(qos, rdQosAge(si)) else qos

        val grant    = arbitrate(requests, rdRrPtr(si), qosEff, if (rdCredits != null) rdCredits(si) else null)
        val grantIdx = ohToIdx(grant)
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
            io.masters(mi).r.valid := slv.r.valid
            io.masters(mi).r.data  := slv.r.data.resized
            if (cfg.masters(mi).config.useResp) io.masters(mi).r.resp := slv.r.resp
            if (cfg.masters(mi).config.useLast) io.masters(mi).r.last := slv.r.last
            if (cfg.masters(mi).config.useId)   io.masters(mi).r.id   := decodeMasterId(slv.r.id)
            slv.r.ready := io.masters(mi).r.ready
          }
        }
        if (cfg.slaves(si).config.useLast) {
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
    val depth    = cfg.maxOutstanding
    val cntW     = log2Up(depth + 1)   // counter width to hold 0..depth

    // --- Per-slave write state ---
    val wrOutstanding = Vec(Seq.fill(S)(RegInit(U(0, cntW bits))))  // AW accepted, B not yet returned
    val wFifoMem     = (0 until S).map(_ => Mem(UInt(ptrW bits), depth))
    val wFifoWrPtr   = Vec(Seq.fill(S)(RegInit(U(0, log2Up(depth) bits))))
    val wFifoRdPtr   = Vec(Seq.fill(S)(RegInit(U(0, log2Up(depth) bits))))
    val wFifoCount   = Vec(Seq.fill(S)(RegInit(U(0, cntW bits))))  // entries with W pending

    // --- Per-slave read state ---
    val rdOutstanding = Vec(Seq.fill(S)(RegInit(U(0, cntW bits))))

    // =================================================================
    // Per-slave AW arbitration + W forwarding
    // =================================================================
    for (si <- 0 until S) {
      val slv = io.slaves(si)

      // -- AW: accept new write addresses while below depth --
      val awCanAccept = wrOutstanding(si) < depth
      val requests    = Bits(M bits)
      val qos         = Vec(UInt(4 bits), M)
      for (mi <- 0 until M) {
        requests(mi) := io.masters(mi).aw.valid && addrDecodeOH(io.masters(mi).aw.addr)(si)
        qos(mi)      := (if (cfg.masters(mi).config.useQos) io.masters(mi).aw.qos.asUInt else U(0, 4 bits))
      }
      val qosEff = if (wrQosAge != null) ageQos(qos, wrQosAge(si)) else qos

      val grant    = arbitrate(requests, wrRrPtr(si), qosEff, if (wrCredits != null) wrCredits(si) else null)
      val grantIdx = ohToIdx(grant)
      val anyReq   = requests.orR

      // Declare FIFO-empty signal early — needed in both the AW block (IPIF fix)
      // and the W-forwarding block below.
      val wFifoEmpty  = wFifoCount(si) === 0
      val wHeadMaster = wFifoMem(si).readAsync(wFifoRdPtr(si))

      when(awCanAccept && anyReq) {
        slv.aw.valid := True
        for (mi <- 0 until M) {
          when(grantIdx === mi) {
            copyAwToSlave(si, mi, grantIdx)
            // Also forward W alongside AW when the W-route FIFO is empty, so that
            // IPIF-based AXI4-Lite slaves (which require AWVALID & WVALID
            // simultaneously before asserting AWREADY) can complete the handshake.
            // Once AW fires the FIFO entry is pushed and normal W routing takes over.
            when(wFifoEmpty) {
              slv.w.valid            := io.masters(mi).w.valid
              slv.w.payload          := io.masters(mi).w.payload
              io.masters(mi).w.ready := slv.w.ready
            }
          }
        }
      }

      // On AW handshake: push master index into W-route FIFO
      val awPush = slv.aw.fire
      when(awPush) {
        wFifoMem(si).write(wFifoWrPtr(si), grantIdx)
        wFifoWrPtr(si) := ((wFifoWrPtr(si) === U(depth - 1)) ?
          U(0) | (wFifoWrPtr(si) + 1)).resized
        wrRrPtr(si) := (grantIdx + 1).resized
        wrrOnGrant(wrCredits, si, grantIdx, requests)
      }
      if (wrQosAge != null) updateQosAge(wrQosAge(si), requests, awPush, grantIdx)

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
      val wPop = Bool()
      if (cfg.slaves(si).config.useLast) {
        wPop := slv.w.fire && slv.w.last
      } else {
        wPop := slv.w.fire  // Lite-behind-Full or single-beat: every beat is last
      }
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
      when(awPush && !bDec) {
        wrOutstanding(si) := wrOutstanding(si) + 1
      } elsewhen (!awPush && bDec) {
        wrOutstanding(si) := wrOutstanding(si) - 1
      }
    }

    // =================================================================
    // Per-master B routing (ID-based)
    // =================================================================
    for (mi <- 0 until M) {
      // Which slaves have a B response destined for this master?
      val bHits = Bits(S bits)
      for (si <- 0 until S) {
        val slv = io.slaves(si)
        bHits(si) := slv.b.valid && (decodeMasterIdx(slv.b.id) === mi)
      }

      // Priority: pick lowest-numbered slave with a pending B
      val bGrant = OHMasking.first(bHits)

      for (si <- 0 until S) {
        when(bGrant(si)) {
          val slv = io.slaves(si)
          io.masters(mi).b.valid := True
          if (cfg.masters(mi).config.useResp) io.masters(mi).b.resp := slv.b.resp
          if (cfg.masters(mi).config.useId)   io.masters(mi).b.id   := decodeMasterId(slv.b.id)
          slv.b.ready := io.masters(mi).b.ready
        }
      }
    }

    // =================================================================
    // Per-slave AR arbitration
    // =================================================================
    for (si <- 0 until S) {
      val slv = io.slaves(si)

      val arCanAccept = rdOutstanding(si) < depth
      val requests    = Bits(M bits)
      val qos         = Vec(UInt(4 bits), M)
      for (mi <- 0 until M) {
        requests(mi) := io.masters(mi).ar.valid && addrDecodeOH(io.masters(mi).ar.addr)(si)
        qos(mi)      := (if (cfg.masters(mi).config.useQos) io.masters(mi).ar.qos.asUInt else U(0, 4 bits))
      }
      val qosEff = if (rdQosAge != null) ageQos(qos, rdQosAge(si)) else qos

      val grant    = arbitrate(requests, rdRrPtr(si), qosEff, if (rdCredits != null) rdCredits(si) else null)
      val grantIdx = ohToIdx(grant)
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
      if (cfg.slaves(si).config.useLast) {
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
      val rHits = Bits(S bits)
      for (si <- 0 until S) {
        val slv = io.slaves(si)
        rHits(si) := slv.r.valid && (decodeMasterIdx(slv.r.id) === mi)
      }

      val rGrant = OHMasking.first(rHits)

      for (si <- 0 until S) {
        when(rGrant(si)) {
          val slv = io.slaves(si)
          io.masters(mi).r.valid := True
          io.masters(mi).r.data  := slv.r.data.resized
          if (cfg.masters(mi).config.useResp) io.masters(mi).r.resp := slv.r.resp
          if (cfg.masters(mi).config.useLast) io.masters(mi).r.last := slv.r.last
          if (cfg.masters(mi).config.useId)   io.masters(mi).r.id   := decodeMasterId(slv.r.id)
          slv.r.ready := io.masters(mi).r.ready
        }
      }
    }
  }
}
