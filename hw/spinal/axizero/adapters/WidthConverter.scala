// Copyright (c) 2026 Leonardo Capossio — bard0 design  hello@bard0.com
// SPDX-License-Identifier: MIT
package axizero.adapters

import spinal.core._
import spinal.lib._
import spinal.lib.bus.amba4.axi._

// ---------------------------------------------------------------------------
// Data-width converters for AXI4-Lite and full AXI4.
//
// These converters sit at the boundary between a port with a narrow (or wide)
// data bus and the crossbar fabric that operates at fabricDataWidth.
//
// AXI4-Lite width conversion
// ──────────────────────────
// AXI4-Lite has no bursts.  Each transaction is exactly one data beat, so
// width conversion is straightforward:
//
//   Upsizing  (narrow master → wide slave-side bus):
//     • WDATA is zero-extended;  WSTRB is zero-extended.
//     • RDATA is truncated to the master's data width.
//     Both master and slave still transfer one beat per transaction.
//     The slave sees more data lanes than used; unused WSTRB lanes are 0.
//
//   Downsizing (wide master → narrow slave-side bus):
//     • WDATA and WSTRB are truncated to the narrow width.
//     • RDATA is zero-extended back to the wide width.
//     This is a lossless operation only when the master only uses the low
//     bytes; the caller is responsible for ensuring this contract.
//
// Full AXI4 width conversion
// ──────────────────────────
// Burst-level width conversion requires splitting or merging beats.
// This is substantially more complex (AxSize tracking, beat counters,
// sub-word address alignment).  The full-AXI4 converter is a stub that
// delegates to SpinalHDL's built-in Axi4Upsizer / Axi4Downsizer from
// spinal.lib.bus.amba4.axi.Axi4Upsizer when available, and will be
// completed in a future iteration.
//
// Usage
// ─────
//   val conv = new Axi4LiteWidthConverter(narrowConfig, wideConfig)
//   conv.io.narrow <> masterPort          // narrow side
//   conv.io.wide   <> fabricPort          // wide side
// ---------------------------------------------------------------------------

// ── AXI4-Lite width converter ─────────────────────────────────────────────

/** Converts between two AXI4-Lite configs that differ only in data width.
 *  The narrower side is always io.narrow; the wider side is io.wide.
 *  If narrow == wide this is just a wire-through. */
class Axi4LiteWidthConverter(narrowCfg: Axi4Config, wideCfg: Axi4Config)
    extends Component {

  require(narrowCfg.dataWidth <= wideCfg.dataWidth,
    s"narrowCfg.dataWidth (${narrowCfg.dataWidth}) must be ≤ wideCfg.dataWidth (${wideCfg.dataWidth})")
  require(wideCfg.dataWidth % narrowCfg.dataWidth == 0,
    "dataWidth ratio must be a whole number")

  val io = new Bundle {
    val narrow = slave(Axi4(narrowCfg))   // master-side / narrow
    val wide   = master(Axi4(wideCfg))    // slave-side / wide
  }

  val narrowW = narrowCfg.dataWidth
  val wideW   = wideCfg.dataWidth

  if (narrowW == wideW) {
    // ── Passthrough ──────────────────────────────────────────────────────
    io.wide <> io.narrow

  } else {
    // ── AW / AR: address channels are address-width only — wire through ──
    io.wide.aw.valid   := io.narrow.aw.valid
    io.wide.aw.payload.assignSomeByName(io.narrow.aw.payload)
    io.narrow.aw.ready := io.wide.aw.ready

    io.wide.ar.valid   := io.narrow.ar.valid
    io.wide.ar.payload.assignSomeByName(io.narrow.ar.payload)
    io.narrow.ar.ready := io.wide.ar.ready

    // ── W: zero-extend data and strobe ────────────────────────────────────
    io.wide.w.valid            := io.narrow.w.valid
    io.wide.w.data             := io.narrow.w.data.resize(wideW)
    io.wide.w.strb             := io.narrow.w.strb.resize(wideW / 8)
    io.narrow.w.ready          := io.wide.w.ready

    // ── B: pass through (resp only) ───────────────────────────────────────
    io.narrow.b.valid          := io.wide.b.valid
    io.narrow.b.payload.assignSomeByName(io.wide.b.payload)
    io.wide.b.ready            := io.narrow.b.ready

    // ── R: truncate data to narrow width ─────────────────────────────────
    io.narrow.r.valid          := io.wide.r.valid
    io.narrow.r.data           := io.wide.r.data(narrowW - 1 downto 0)
    if (narrowCfg.useResp && wideCfg.useResp) io.narrow.r.resp := io.wide.r.resp
    io.wide.r.ready            := io.narrow.r.ready
  }
}

// ── Full AXI4 width converter stub ──────────────────────────────────────────

/** Stub for full AXI4 width conversion.  Currently implements a wire-through
 *  for equal widths and will require burst-splitting / beat-merging logic for
 *  mismatched widths.  Raises a compile-time error if widths differ until the
 *  full implementation is in place. */
class Axi4WidthConverter(narrowCfg: Axi4Config, wideCfg: Axi4Config)
    extends Component {

  require(narrowCfg.dataWidth == wideCfg.dataWidth,
    s"Full AXI4 width conversion (${narrowCfg.dataWidth}→${wideCfg.dataWidth} bits) " +
    "is not yet implemented.  Use equal data widths or contribute the burst-splitting logic.")

  val io = new Bundle {
    val narrow = slave(Axi4(narrowCfg))
    val wide   = master(Axi4(wideCfg))
  }

  io.wide <> io.narrow
}
