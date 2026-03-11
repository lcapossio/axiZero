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
// Burst-level width conversion delegates to SpinalHDL's Axi4Upsizer for
// upsizing, and Axi4DownsizerExt (local fork) for downsizing.
//
// The Axi4WidthConverter component exposes:
//   io.input  — slave-facing (receives AW/AR/W, drives B/R back)
//   io.output — master-facing (drives AW/AR/W, receives B/R)
//
// When inputCfg.dataWidth < outputCfg.dataWidth (upsizing):
//   Merges N narrow W beats into one wide beat; splits one wide R beat
//   into N narrow beats.  Used at narrow master ports.
//
// When inputCfg.dataWidth > outputCfg.dataWidth (downsizing):
//   Splits one wide W beat into N narrow beats; merges N narrow R beats
//   into one wide beat.  Used at narrow slave ports.
//
// inputCfg and outputCfg must agree on all fields except dataWidth.
// The dataWidth ratio must be a whole number.
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

// ── Full AXI4 width converter ────────────────────────────────────────────────

/** Full AXI4 burst-level data-width converter.
 *
 *  io.input  — slave-facing port: receives AW/AR/W from upstream, drives B/R back.
 *  io.output — master-facing port: drives AW/AR/W downstream, receives B/R.
 *
 *  inputCfg.dataWidth < outputCfg.dataWidth  →  upsizing  (Axi4Upsizer)
 *  inputCfg.dataWidth > outputCfg.dataWidth  →  downsizing (Axi4DownsizerExt)
 *  inputCfg.dataWidth == outputCfg.dataWidth →  wire-through
 *
 *  Both configs must agree on all fields except dataWidth.
 *  The dataWidth ratio must be a whole number.
 *  readPendingQueueSize controls the depth of the in-flight read-transaction
 *  queue inside Axi4Upsizer (only used when upsizing). */
class Axi4WidthConverter(
    inputCfg:            Axi4Config,
    outputCfg:           Axi4Config,
    readPendingQueueSize: Int = 4
) extends Component {

  private val inW  = inputCfg.dataWidth
  private val outW = outputCfg.dataWidth

  require(
    if (inW <= outW) outW % inW == 0 else inW % outW == 0,
    s"Axi4WidthConverter: dataWidth ratio must be a whole number ($inW ↔ $outW)"
  )

  val io = new Bundle {
    val input  = slave(Axi4(inputCfg))
    val output = master(Axi4(outputCfg))
  }

  if (inW == outW) {
    io.output <> io.input

  } else if (inW < outW) {
    // ── Upsizing: merge N narrow beats → 1 wide beat; split 1 wide R beat ──
    val ups = Axi4Upsizer(inputCfg, outputCfg, readPendingQueueSize)
    ups.io.input  <> io.input
    io.output     <> ups.io.output

  } else {
    // ── Downsizing: split 1 wide beat → N narrow beats; merge N narrow R ───
    //
    // Axi4DownsizerExt is a local fork of SpinalHDL's Axi4Downsizer with
    // the useBurst and useId assertions removed.  IDs and burst types flow
    // through naturally via assignUnassignedByName in the sub-transaction
    // generator.  Only INCR burst type is supported.
    val downs = Axi4DownsizerExt(inputCfg, outputCfg)
    downs.io.input  <> io.input
    io.output       <> downs.io.output
  }
}
