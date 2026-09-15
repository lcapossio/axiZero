// Copyright (c) 2026 Leonardo Capossio — bard0 design  hello@bard0.com
// SPDX-License-Identifier: MIT
package axizero.adapters

import spinal.core._
import spinal.lib._
import spinal.lib.bus.amba4.axi._

// ---------------------------------------------------------------------------
// Register slices for AXI4 and AXI4-Lite
//
// A register slice cuts combinatorial paths by inserting one pipeline stage on
// every AXI channel.  Each channel uses SpinalHDL's Stream.stage(), which is
// m2sPipe: VALID and the payload are registered, and READY is not.
//
// What that does and does not break:
//   AW / W / AR travel master→slave; their valid and payload are registered.
//   B / R travel slave→master;       their valid and payload are registered.
//   So every forward arc is cut and the round-trip latency grows by 2 cycles.
//   The READY arc is NOT cut.  It stays combinational through the slice:
//
//       upstream.ready = !rValid || downstream.ready
//
//   Throughput is still full -- ready is asserted whenever the holding
//   register is empty or is being drained in the same cycle, so there is
//   always somewhere for an accepted beat to go and a beat is never lost.
//   That bubble collapsing is exactly why READY has to stay combinational.
//
// Registering READY as well needs a second payload register: once READY is a
// cycle stale the upstream can complete a handshake the downstream did not
// accept, and the extra register is what catches that beat.  That is what a
// skid buffer (m2sPipe + s2mPipe) is for.  This slice is not one, and on a
// contended fabric the uncut READY arc is visible: on the loaded Arty builds
// the critical path runs from the arbiter's grant, through the decode-error
// slave and the master's READY, into the CPU's pipeline in a single cycle.
//
// skidFwd = true is that second register.  It turns the three forward channels
// into full pipes (s2mPipe + m2sPipe): s2mPipe drives the upstream READY from
// a register of its own, upstream.ready = !skidValid, and parks the beat that
// arrives while the downstream is stalled in the skid register, so the stale
// READY costs nothing.  Forward latency and throughput are unchanged -- the
// skid only fills on a cycle the upstream would have been stalled anyway --
// and it costs one more set of payload registers per forward channel.
//
// Only the forward channels get it.  B and R carry READY from the master back
// into the fabric, which on the measured builds is not where the long paths
// are, so skidding them would buy nothing for the same storage.
//
// Usage: instantiate between a master (or slave) and the crossbar boundary.
//   val rs = new Axi4LiteRegSlice(config)
//   rs.io.upstream  <> masterPort
//   rs.io.downstream <> crossbarMasterInput
// ---------------------------------------------------------------------------

// ── AXI4-Lite ────────────────────────────────────────────────────────────────

class Axi4LiteRegSlice(config: Axi4Config, skidFwd: Boolean = false) extends Component {
  val io = new Bundle {
    val upstream   = slave(Axi4(config))  // toward the master
    val downstream = master(Axi4(config)) // toward the slave / crossbar
  }

  // Forward channels (master → slave): register each
  private def fwd[T <: Data](s: Stream[T]): Stream[T] =
    if (skidFwd) s.s2mPipe().m2sPipe() else s.stage()

  io.downstream.aw << fwd(io.upstream.aw)
  io.downstream.w << fwd(io.upstream.w)
  io.downstream.ar << fwd(io.upstream.ar)

  // Backward channels (slave → master): register each
  io.upstream.b << io.downstream.b.stage()
  io.upstream.r << io.downstream.r.stage()
}

// ── Full AXI4 ────────────────────────────────────────────────────────────────

class Axi4RegSlice(config: Axi4Config, skidFwd: Boolean = false) extends Component {
  val io = new Bundle {
    val upstream   = slave(Axi4(config))
    val downstream = master(Axi4(config))
  }

  private def fwd[T <: Data](s: Stream[T]): Stream[T] =
    if (skidFwd) s.s2mPipe().m2sPipe() else s.stage()

  io.downstream.aw << fwd(io.upstream.aw)
  io.downstream.w << fwd(io.upstream.w)
  io.downstream.ar << fwd(io.upstream.ar)

  io.upstream.b << io.downstream.b.stage()
  io.upstream.r << io.downstream.r.stage()
}

// ---------------------------------------------------------------------------
// Helpers: wrap an Axi4 / Axi4 stream with an optional register slice
// depending on the port's regSlice flag.  Used by AxiZeroTop.
// ---------------------------------------------------------------------------
object RegSliceOpt {

  /** If regSlice=true, insert an Axi4LiteRegSlice; otherwise pass through. */
  def applyLite(
    port: Axi4,
    config: Axi4Config,
    regSlice: Boolean,
    skidFwd: Boolean = false
  ): Axi4 = {
    if (!regSlice) port
    else {
      val rs = new Axi4LiteRegSlice(config, skidFwd)
      rs.io.upstream <> port
      rs.io.downstream
    }
  }

  /** If regSlice=true, insert an Axi4RegSlice; otherwise pass through. */
  def applyFull(
    port: Axi4,
    config: Axi4Config,
    regSlice: Boolean,
    skidFwd: Boolean = false
  ): Axi4 = {
    if (!regSlice) port
    else {
      val rs = new Axi4RegSlice(config, skidFwd)
      rs.io.upstream <> port
      rs.io.downstream
    }
  }
}
