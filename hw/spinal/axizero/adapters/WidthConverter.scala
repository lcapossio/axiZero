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
//     • WDATA and WSTRB are placed on the byte lanes the address selects.
//     • RDATA is taken from those same lanes.
//     Both master and slave still transfer one beat per transaction.
//
//     The lane placement is the whole job here, and it is easy to get wrong.
//     AXI does not carry data in the low lanes and let the slave work out
//     where it belongs: a transfer occupies the lanes its address points at.
//     A 16-bit master writing at 0x2 on a 32-bit bus must drive lanes 2..3
//     with WSTRB 0b1100, not lanes 0..1 with 0b0011 -- a slave decoding the
//     address reads the upper half and would find nothing there. The bug is
//     invisible whenever the lane-select address bits happen to be zero,
//     which is every naturally-aligned-to-the-wide-word access, so it hides
//     from any test that only walks whole wide words.
//
//     W carries no address of its own, so the lane offset has to be taken
//     from AW and held until the beat it belongs to arrives -- AXI4-Lite
//     permits W before AW, and permits more than one write in flight. Hence
//     the two small offset queues below, one per direction; `outstanding`
//     sets how many transactions may be in flight before the address channel
//     back-pressures.
//
//   Narrowing at a Lite *slave* port is not implemented. This component is
//   built around a narrow master -- io.narrow receives AW, io.wide drives it
//   -- and a narrow slave needs the mirror of it. AxiZeroLiteTop rejects that
//   configuration with a message rather than letting it fail as a page of
//   autoconnect direction errors.
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

/** Converts between two AXI4-Lite configs that differ only in data width. The narrower side is
  * always io.narrow; the wider side is io.wide. If narrow == wide this is just a wire-through.
  */
class Axi4LiteWidthConverter(
  narrowCfg: Axi4Config,
  wideCfg: Axi4Config,
  outstanding: Int = 4
) extends Component {

  require(
    narrowCfg.dataWidth <= wideCfg.dataWidth,
    s"narrowCfg.dataWidth (${narrowCfg.dataWidth}) must be ≤ wideCfg.dataWidth (${wideCfg.dataWidth})"
  )
  require(wideCfg.dataWidth % narrowCfg.dataWidth == 0, "dataWidth ratio must be a whole number")

  val io = new Bundle {
    val narrow = slave(Axi4(narrowCfg)) // master-side / narrow
    val wide   = master(Axi4(wideCfg))  // slave-side / wide
  }

  val narrowW = narrowCfg.dataWidth
  val wideW   = wideCfg.dataWidth

  if (narrowW == wideW) {
    // ── Passthrough ──────────────────────────────────────────────────────
    io.wide <> io.narrow

  } else {
    require(outstanding >= 1, s"outstanding must be at least 1 (got $outstanding)")

    val wideBytes = wideW / 8
    // Bits of the address that select a byte lane within the wide word. The
    // low log2(narrowBytes) of them are zero for any naturally aligned
    // access, which is the only kind AXI4-Lite defines.
    val offBits = log2Up(wideBytes)

    /** Queue of lane offsets taken from an address channel, read back on the matching data beat. */
    def offsetQueue(
      addrIn: Stream[_ <: Axi4Ax],
      addrOut: Stream[_ <: Axi4Ax]
    ): Stream[UInt] = {
      val q = StreamFifo(UInt(offBits bits), outstanding)
      q.io.push.valid   := addrIn.valid && addrOut.ready
      q.io.push.payload := addrIn.addr(offBits - 1 downto 0)
      addrOut.valid     := addrIn.valid && q.io.push.ready
      addrIn.ready      := addrOut.ready && q.io.push.ready
      addrOut.payload.assignSomeByName(addrIn.payload)
      q.io.pop
    }

    // ── AW / AR: pass the address through, remember its lane offset ───────
    val awOff = offsetQueue(io.narrow.aw, io.wide.aw)
    val arOff = offsetQueue(io.narrow.ar, io.wide.ar)

    // ── W: shift data and strobe onto the lanes the address chose ─────────
    io.wide.w.valid   := io.narrow.w.valid && awOff.valid
    io.narrow.w.ready := io.wide.w.ready && awOff.valid
    awOff.ready       := io.narrow.w.valid && io.wide.w.ready
    io.wide.w.data    := io.narrow.w.data.resize(wideW) |<< (awOff.payload << 3)
    io.wide.w.strb    := io.narrow.w.strb.resize(wideBytes) |<< awOff.payload

    // ── B: pass through (resp only) ───────────────────────────────────────
    io.narrow.b.valid := io.wide.b.valid
    io.narrow.b.payload.assignSomeByName(io.wide.b.payload)
    io.wide.b.ready := io.narrow.b.ready

    // ── R: take the data off the lanes the read address chose ─────────────
    io.narrow.r.valid := io.wide.r.valid && arOff.valid
    io.wide.r.ready   := io.narrow.r.ready && arOff.valid
    arOff.ready       := io.wide.r.valid && io.narrow.r.ready
    io.narrow.r.data  := (io.wide.r.data |>> (arOff.payload << 3)).resize(narrowW)
    if (narrowCfg.useResp && wideCfg.useResp) io.narrow.r.resp := io.wide.r.resp
  }
}

// ── Full AXI4 width converter ────────────────────────────────────────────────

/** Full AXI4 burst-level data-width converter.
  *
  * io.input — slave-facing port: receives AW/AR/W from upstream, drives B/R back. io.output —
  * master-facing port: drives AW/AR/W downstream, receives B/R.
  *
  * inputCfg.dataWidth < outputCfg.dataWidth → upsizing (Axi4Upsizer) inputCfg.dataWidth >
  * outputCfg.dataWidth → downsizing (Axi4DownsizerExt) inputCfg.dataWidth == outputCfg.dataWidth →
  * wire-through
  *
  * Both configs must agree on all fields except dataWidth. The dataWidth ratio must be a whole
  * number. readPendingQueueSize controls the depth of the in-flight read-transaction queue inside
  * Axi4Upsizer (only used when upsizing).
  */
class Axi4WidthConverter(
  inputCfg: Axi4Config,
  outputCfg: Axi4Config,
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
    ups.io.input <> io.input
    io.output <> ups.io.output

  } else {
    // ── Downsizing: split 1 wide beat → N narrow beats; merge N narrow R ───
    //
    // Axi4DownsizerExt is a local fork of SpinalHDL's Axi4Downsizer with
    // the useBurst and useId assertions removed.  IDs and burst types flow
    // through naturally via assignUnassignedByName in the sub-transaction
    // generator.  Only INCR burst type is supported.
    val downs = Axi4DownsizerExt(inputCfg, outputCfg)
    downs.io.input <> io.input
    io.output <> downs.io.output
  }
}
