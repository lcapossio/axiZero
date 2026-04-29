// Copyright (c) 2026 Leonardo Capossio — bard0 design  hello@bard0.com
// SPDX-License-Identifier: MIT
package axizero.adapters

import spinal.core._
import spinal.lib._
import spinal.lib.bus.amba4.axi._

// ---------------------------------------------------------------------------
// Register slices for AXI4 and AXI4-Lite
//
// A register slice cuts combinatorial paths by inserting one pipeline stage
// on every AXI channel.  Each channel uses SpinalHDL's Stream.stage() which
// implements a skid-buffer (one-cycle latency, full throughput).
//
// Why all five channels?
//   AW / W / AR travel master→slave; their valid is registered (adds 1 cycle).
//   B / R travel slave→master;       their valid is registered (adds 1 cycle).
//   In both directions the ready path is also cut, so the total round-trip
//   latency grows by 2 cycles but every timing arc is broken.
//
// Usage: instantiate between a master (or slave) and the crossbar boundary.
//   val rs = new Axi4LiteRegSlice(config)
//   rs.io.upstream  <> masterPort
//   rs.io.downstream <> crossbarMasterInput
// ---------------------------------------------------------------------------

// ── AXI4-Lite ────────────────────────────────────────────────────────────────

class Axi4LiteRegSlice(config: Axi4Config) extends Component {
  val io = new Bundle {
    val upstream   = slave(Axi4(config))  // toward the master
    val downstream = master(Axi4(config)) // toward the slave / crossbar
  }

  // Forward channels (master → slave): register each
  io.downstream.aw << io.upstream.aw.stage()
  io.downstream.w << io.upstream.w.stage()
  io.downstream.ar << io.upstream.ar.stage()

  // Backward channels (slave → master): register each
  io.upstream.b << io.downstream.b.stage()
  io.upstream.r << io.downstream.r.stage()
}

// ── Full AXI4 ────────────────────────────────────────────────────────────────

class Axi4RegSlice(config: Axi4Config) extends Component {
  val io = new Bundle {
    val upstream   = slave(Axi4(config))
    val downstream = master(Axi4(config))
  }

  io.downstream.aw << io.upstream.aw.stage()
  io.downstream.w << io.upstream.w.stage()
  io.downstream.ar << io.upstream.ar.stage()

  io.upstream.b << io.downstream.b.stage()
  io.upstream.r << io.downstream.r.stage()
}

// ---------------------------------------------------------------------------
// Helpers: wrap an Axi4 / Axi4 stream with an optional register slice
// depending on the port's regSlice flag.  Used by AxiZeroTop.
// ---------------------------------------------------------------------------
object RegSliceOpt {

  /** If regSlice=true, insert an Axi4LiteRegSlice; otherwise pass through. */
  def applyLite(port: Axi4, config: Axi4Config, regSlice: Boolean): Axi4 = {
    if (!regSlice) port
    else {
      val rs = new Axi4LiteRegSlice(config)
      rs.io.upstream <> port
      rs.io.downstream
    }
  }

  /** If regSlice=true, insert an Axi4RegSlice; otherwise pass through. */
  def applyFull(port: Axi4, config: Axi4Config, regSlice: Boolean): Axi4 = {
    if (!regSlice) port
    else {
      val rs = new Axi4RegSlice(config)
      rs.io.upstream <> port
      rs.io.downstream
    }
  }
}
