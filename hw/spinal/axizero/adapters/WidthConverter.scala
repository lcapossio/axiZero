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
// Burst-level width conversion delegates to SpinalHDL's built-in
// Axi4Upsizer / Axi4Downsizer (spinal.lib.bus.amba4.axi).
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
 *  inputCfg.dataWidth > outputCfg.dataWidth  →  downsizing (Axi4Downsizer)
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
    // Axi4Downsizer (SpinalHDL v1.10.x) requires both useBurst=false (INCR
    // only, no variable burst type) and useId=false (no interleaved IDs).
    // We strip both fields, wire all channels manually, propagate AW/AR IDs
    // through registers, and harden BURST=INCR and ID=0 on the output side.
    val inCfgD  = inputCfg.copy(useBurst  = false, useId = false)
    val outCfgD = outputCfg.copy(useBurst = false, useId = false)
    val downs   = Axi4Downsizer(inCfgD, outCfgD)

    // ID registers — capture AW/AR IDs on handshake; inject into B/R
    val awIdReg = if (inputCfg.useId) Reg(UInt(inputCfg.idWidth bits)) init(0) else null
    val arIdReg = if (inputCfg.useId) Reg(UInt(inputCfg.idWidth bits)) init(0) else null

    // ── upstream AW ────────────────────────────────────────────────────────
    downs.io.input.aw.valid           := io.input.aw.valid
    downs.io.input.aw.payload.assignSomeByName(io.input.aw.payload)  // addr,len,size; strips id,burst
    io.input.aw.ready                 := downs.io.input.aw.ready
    if (inputCfg.useId)
      when(io.input.aw.valid && io.input.aw.ready) { awIdReg := io.input.aw.payload.id }

    // ── upstream W ─────────────────────────────────────────────────────────
    downs.io.input.w.valid            := io.input.w.valid
    downs.io.input.w.data             := io.input.w.data
    if (inCfgD.useStrb) downs.io.input.w.strb := io.input.w.strb
    if (inCfgD.useLast) downs.io.input.w.last := io.input.w.last
    io.input.w.ready                  := downs.io.input.w.ready

    // ── upstream B ─────────────────────────────────────────────────────────
    io.input.b.valid                  := downs.io.input.b.valid
    io.input.b.payload.assignSomeByName(downs.io.input.b.payload)  // resp; id left undriven below
    if (inputCfg.useId) io.input.b.payload.id := awIdReg  // inject captured write ID
    downs.io.input.b.ready            := io.input.b.ready

    // ── upstream AR ────────────────────────────────────────────────────────
    downs.io.input.ar.valid           := io.input.ar.valid
    downs.io.input.ar.payload.assignSomeByName(io.input.ar.payload)  // addr,len,size; strips id,burst
    io.input.ar.ready                 := downs.io.input.ar.ready
    if (inputCfg.useId)
      when(io.input.ar.valid && io.input.ar.ready) { arIdReg := io.input.ar.payload.id }

    // ── upstream R ─────────────────────────────────────────────────────────
    io.input.r.valid                  := downs.io.input.r.valid
    io.input.r.payload.assignSomeByName(downs.io.input.r.payload)  // data,resp,last; id left undriven
    if (inputCfg.useId) io.input.r.payload.id := arIdReg  // inject captured read ID
    downs.io.input.r.ready            := io.input.r.ready

    // ── downstream AW ──────────────────────────────────────────────────────
    io.output.aw.valid                := downs.io.output.aw.valid
    io.output.aw.payload.assignSomeByName(downs.io.output.aw.payload)  // addr,len,size
    if (outputCfg.useBurst) io.output.aw.payload.burst := 1   // INCR = 0b01
    if (outputCfg.useId)    io.output.aw.payload.id    := 0   // no interleaving needed
    downs.io.output.aw.ready          := io.output.aw.ready

    // ── downstream W ───────────────────────────────────────────────────────
    io.output.w.valid                 := downs.io.output.w.valid
    io.output.w.data                  := downs.io.output.w.data
    if (outCfgD.useStrb) io.output.w.strb := downs.io.output.w.strb
    if (outCfgD.useLast) io.output.w.last := downs.io.output.w.last
    downs.io.output.w.ready           := io.output.w.ready

    // ── downstream B (slave drives) ────────────────────────────────────────
    downs.io.output.b.valid           := io.output.b.valid
    downs.io.output.b.payload.assignSomeByName(io.output.b.payload)  // resp; no id in outCfgD
    io.output.b.ready                 := downs.io.output.b.ready

    // ── downstream AR ──────────────────────────────────────────────────────
    io.output.ar.valid                := downs.io.output.ar.valid
    io.output.ar.payload.assignSomeByName(downs.io.output.ar.payload)  // addr,len,size
    if (outputCfg.useBurst) io.output.ar.payload.burst := 1   // INCR = 0b01
    if (outputCfg.useId)    io.output.ar.payload.id    := 0   // no interleaving needed
    downs.io.output.ar.ready          := io.output.ar.ready

    // ── downstream R (slave drives) ────────────────────────────────────────
    downs.io.output.r.valid           := io.output.r.valid
    downs.io.output.r.payload.assignSomeByName(io.output.r.payload)  // data,resp,last; no id
    io.output.r.ready                 := downs.io.output.r.ready
  }
}
