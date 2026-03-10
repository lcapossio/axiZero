// Copyright (c) 2026 Leonardo Capossio — bard0 design  hello@bard0.com
// SPDX-License-Identifier: MIT
package axizero.crossbar

import spinal.core._
import spinal.lib._
import spinal.lib.bus.amba4.axi._
import axizero._

// ---------------------------------------------------------------------------
// Axi4LiteCrossbar
//
// Resource-efficient M×N crossbar for all-AXI4-Lite topologies.
//
// All internal ports use a single normalised config (normCfg):
//   • addressWidth = max of all port address widths
//   • dataWidth    = cfg.fabricDataWidth
//   • All optional AXI4 signals disabled (no id/burst/qos/len/last/…)
//
// Width and address adaptation between external port configs and normCfg is
// handled by AxiZeroLiteTop before / after this component.
//
// Write and read paths are fully independent per slave:
//   WRITE:  IDLE → accept AW from arbitrated master → ACTIVE: forward W,
//           route B back → IDLE
//   READ:   IDLE → accept AR from arbitrated master → ACTIVE: route R
//           back → IDLE
// ---------------------------------------------------------------------------
class Axi4LiteCrossbar(cfg: AxiZeroConfig) extends Component {
  require(cfg.isAllLite,
    "Axi4LiteCrossbar requires all master and slave ports to be LiteAxi4")

  val M = cfg.numMasters
  val S = cfg.numSlaves

  // Single normalised Axi4Config used for every internal port.
  val normCfg = Axi4Config(
    addressWidth = (cfg.masters.map(_.config.addressWidth) ++
                    cfg.slaves.map(_.config.addressWidth)).max,
    dataWidth    = cfg.fabricDataWidth,
    useId        = false,
    useRegion    = false,
    useBurst     = false,
    useLock      = false,
    useCache     = false,
    useSize      = false,
    useQos       = false,
    useLen       = false,
    useLast      = false,
    useResp      = true,
    useProt      = true,
    useStrb      = true
  )

  val io = new Bundle {
    // Masters drive AW/W/AR in; crossbar drives B/R back.
    val masters = Vec(slave(Axi4(normCfg)), M)
    // Crossbar drives AW/W/AR out; slaves drive B/R back.
    val slaves  = Vec(master(Axi4(normCfg)), S)
  }

  // -------------------------------------------------------------------------
  // Address decode: bit si = 1 iff addr falls in slaves(si)'s range.
  // -------------------------------------------------------------------------
  def addrDecodeOH(addr: UInt): Bits = {
    val result = Bits(S bits)
    for (si <- 0 until S) {
      val sp = cfg.slaves(si)
      result(si) := (addr >= sp.baseAddress) && (addr < (sp.baseAddress + sp.size))
    }
    result
  }

  // -------------------------------------------------------------------------
  // Round-robin arbiter (combinatorial).
  // rrPtr is the next master index to favour (binary, width log2Up(M)).
  // Returns a one-hot grant Bits(M bits).
  // Algorithm: prefer requests from rrPtr..M-1 first (via mask); fall back
  // to 0..rrPtr-1 if no request in the upper half.
  // -------------------------------------------------------------------------
  def rrGrant(requests: Bits, rrPtr: UInt): Bits = {
    val n    = requests.getWidth
    // Build maskLow: bit i = 1 iff i < rrPtr  (lower-priority half).
    // We build it via a priority-encoded when ladder so no arithmetic
    // overflow edge-cases arise.
    val maskLow = Bits(n bits)
    maskLow := B(0, n bits)   // default: rrPtr=0 → no bits masked
    for (ptr <- 1 until n) {
      when(rrPtr >= U(ptr)) {
        maskLow := B((BigInt(1) << ptr) - 1, n bits)  // bits 0..ptr-1 set
      }
    }
    val maskedReqs = requests & ~maskLow
    Mux(maskedReqs.orR,
      OHMasking.first(maskedReqs),   // someone in high-priority half
      OHMasking.first(requests))     // wrap: use full scan
  }

  // -------------------------------------------------------------------------
  // Dispatch to selected arbitration policy.
  // -------------------------------------------------------------------------
  def arbitrate(requests: Bits, rrPtr: UInt, credits: Vec[UInt] = null): Bits = cfg.arbitration match {
    case RoundRobin            => rrGrant(requests, rrPtr)
    case FixedPriority         => OHMasking.first(requests)
    case QosBased              => rrGrant(requests, rrPtr)  // AXI4-Lite has no QoS field — RR is correct
    case WeightedRoundRobin(_) => wrrGrant(requests, rrPtr, credits)
  }

  // -------------------------------------------------------------------------
  // Weighted round-robin: only consider masters that still have credit.
  // When no eligible master has credit, the caller resets all credits.
  // -------------------------------------------------------------------------
  def wrrGrant(requests: Bits, rrPtr: UInt, credits: Vec[UInt]): Bits = {
    val eligible = Bits(M bits)
    for (mi <- 0 until M) eligible(mi) := requests(mi) && (credits(mi) =/= 0)
    Mux(eligible.orR,
      rrGrant(eligible, rrPtr),
      rrGrant(requests, rrPtr))
  }

  // -------------------------------------------------------------------------
  // Safe one-hot → index conversion that always produces ptrW bits.
  // OHToUInt(Bits(1 bit)) returns a 0-bit UInt, which breaks width checks
  // when M=1.  This helper explicitly drives a ptrW-bit result.
  // -------------------------------------------------------------------------
  val ptrW = log2Up(M max 2)

  def ohToIdx(grant: Bits): UInt = {
    val idx = UInt(ptrW bits)
    idx := 0
    for (mi <- 0 until M) when(grant(mi)) { idx := mi }
    idx
  }

  // Write path
  val wrActive  = Vec(Seq.fill(S)(RegInit(False)))
  val wrGranted = Vec(Seq.fill(S)(RegInit(U(0, ptrW bits))))
  val wrRrPtr   = Vec(Seq.fill(S)(RegInit(U(0, ptrW bits))))

  // Read path
  val rdActive  = Vec(Seq.fill(S)(RegInit(False)))
  val rdGranted = Vec(Seq.fill(S)(RegInit(U(0, ptrW bits))))
  val rdRrPtr   = Vec(Seq.fill(S)(RegInit(U(0, ptrW bits))))

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

  // =========================================================================
  // Safe defaults (every signal driven before any when() overrides it).
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
  // Per-slave write path
  // =========================================================================
  for (si <- 0 until S) {
    val slv = io.slaves(si)

    when(!wrActive(si)) {
      // Collect write requests targeting this slave
      val requests = Bits(M bits)
      for (mi <- 0 until M) {
        requests(mi) := io.masters(mi).aw.valid &&
                        addrDecodeOH(io.masters(mi).aw.addr)(si)
      }

      val grant    = arbitrate(requests, wrRrPtr(si), if (wrCredits != null) wrCredits(si) else null)
      val grantIdx = ohToIdx(grant)
      val anyReq   = requests.orR

      when(anyReq) {
        // Present the winning master's AW to the downstream slave
        slv.aw.valid := True
        for (mi <- 0 until M) {
          when(grantIdx === mi) {
            slv.aw.payload          := io.masters(mi).aw.payload
            io.masters(mi).aw.ready := slv.aw.ready
            // Also forward W alongside AW so that IPIF-based AXI4-Lite slaves
            // (which require AWVALID & WVALID simultaneously) can accept AW.
            slv.w.valid              := io.masters(mi).w.valid
            slv.w.payload            := io.masters(mi).w.payload
            io.masters(mi).w.ready   := slv.w.ready
          }
        }

        // Latch the grant when AW handshake fires
        when(slv.aw.fire) {
          wrActive(si)  := True
          wrGranted(si) := grantIdx
          wrRrPtr(si)   := (grantIdx + 1).resized  // advance RR pointer

          // WRR: decrement credit; reset all when exhausted
          if (wrCredits != null) {
            for (mi <- 0 until M) {
              when(grantIdx === mi && wrCredits(si)(mi) =/= 0) {
                wrCredits(si)(mi) := wrCredits(si)(mi) - 1
              }
            }
            // Check if all requesting masters now have zero credit
            val allExhausted = Bool()
            allExhausted := True
            for (mi <- 0 until M) {
              when(requests(mi)) {
                // After this grant, what would the credit be?
                val afterDec = UInt(creditW bits)
                afterDec := wrCredits(si)(mi)
                when(grantIdx === mi && wrCredits(si)(mi) =/= 0) {
                  afterDec := wrCredits(si)(mi) - 1
                }
                when(afterDec =/= 0) { allExhausted := False }
              }
            }
            when(allExhausted) {
              for (mi <- 0 until M) {
                wrCredits(si)(mi) := U(wrrWeights(mi), creditW bits)
              }
            }
          }
        }
      }

    } otherwise {
      // Forward W from the latched master; route B back to it
      val gmi = wrGranted(si)

      for (mi <- 0 until M) {
        when(gmi === mi) {
          slv.w.valid              := io.masters(mi).w.valid
          slv.w.payload            := io.masters(mi).w.payload
          io.masters(mi).w.ready   := slv.w.ready

          io.masters(mi).b.valid   := slv.b.valid
          io.masters(mi).b.payload := slv.b.payload
          slv.b.ready              := io.masters(mi).b.ready
        }
      }

      when(slv.b.fire) { wrActive(si) := False }
    }
  }

  // =========================================================================
  // Per-slave read path
  // =========================================================================
  for (si <- 0 until S) {
    val slv = io.slaves(si)

    when(!rdActive(si)) {
      val requests = Bits(M bits)
      for (mi <- 0 until M) {
        requests(mi) := io.masters(mi).ar.valid &&
                        addrDecodeOH(io.masters(mi).ar.addr)(si)
      }

      val grant    = arbitrate(requests, rdRrPtr(si), if (rdCredits != null) rdCredits(si) else null)
      val grantIdx = ohToIdx(grant)
      val anyReq   = requests.orR

      when(anyReq) {
        slv.ar.valid := True
        for (mi <- 0 until M) {
          when(grantIdx === mi) {
            slv.ar.payload          := io.masters(mi).ar.payload
            io.masters(mi).ar.ready := slv.ar.ready
          }
        }

        when(slv.ar.fire) {
          rdActive(si)  := True
          rdGranted(si) := grantIdx
          rdRrPtr(si)   := (grantIdx + 1).resized

          // WRR: decrement credit; reset all when exhausted
          if (rdCredits != null) {
            for (mi <- 0 until M) {
              when(grantIdx === mi && rdCredits(si)(mi) =/= 0) {
                rdCredits(si)(mi) := rdCredits(si)(mi) - 1
              }
            }
            val allExhausted = Bool()
            allExhausted := True
            for (mi <- 0 until M) {
              when(requests(mi)) {
                val afterDec = UInt(creditW bits)
                afterDec := rdCredits(si)(mi)
                when(grantIdx === mi && rdCredits(si)(mi) =/= 0) {
                  afterDec := rdCredits(si)(mi) - 1
                }
                when(afterDec =/= 0) { allExhausted := False }
              }
            }
            when(allExhausted) {
              for (mi <- 0 until M) {
                rdCredits(si)(mi) := U(wrrWeights(mi), creditW bits)
              }
            }
          }
        }
      }

    } otherwise {
      val gmi = rdGranted(si)

      for (mi <- 0 until M) {
        when(gmi === mi) {
          io.masters(mi).r.valid   := slv.r.valid
          io.masters(mi).r.payload := slv.r.payload
          slv.r.ready              := io.masters(mi).r.ready
        }
      }

      // AXI4-Lite: R is always a single beat → release immediately
      when(slv.r.fire) { rdActive(si) := False }
    }
  }
}
