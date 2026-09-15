// Copyright (c) 2026 Leonardo Capossio — bard0 design  hello@bard0.com
// SPDX-License-Identifier: MIT
package axizero.adapters

import spinal.core._
import spinal.lib._
import spinal.lib.bus.amba4.axi._

// ---------------------------------------------------------------------------
// Axi4FullToLiteAdapter
//
// Adapts a full AXI4 port (driven by the crossbar) to an AXI4-Lite slave
// port so a Lite peripheral can sit behind a full AXI4 crossbar.
//
// The crossbar encodes the originating master in the upper bits of the
// slave-side AXI ID.  The Lite slave has no ID field, so this adapter
// saves the incoming ID in a register and injects it back into B/R
// responses, giving the crossbar the ID it needs to route the response
// to the correct master.
//
// Stateful: one register per direction, and the adapter itself holds the
// address channel closed until the response for the previous transaction has
// gone back, so only one per direction is ever in flight.
//
// Constraints:
//   • Burst transactions (len > 0) from a Full master aimed at a Lite slave
//     are ILLEGAL — the adapter forwards only the first beat.
//   • W channel: the last flag is consumed and not forwarded (Lite has none).
// ---------------------------------------------------------------------------
class Axi4FullToLiteAdapter(fullCfg: Axi4Config, liteCfg: Axi4Config) extends Component {

  val io = new Bundle {
    val full = slave(Axi4(fullCfg))  // crossbar slave port (expanded IDs)
    val lite = master(Axi4(liteCfg)) // external Lite slave
  }

  // One transaction per direction is tracked, by a single ID register each, so
  // one per direction is all that may be in flight. That used to be asserted
  // and left at that. It is not something the crossbar guarantees: it holds the
  // transactions of one ID to a single slave, but nothing stops it sending a
  // second transaction with a *different* ID to this same slave. Two in flight
  // and the response ID is taken from the wrong source the moment one retires
  // as the next is accepted -- the old response leaves carrying the new ID.
  // So these gate the address channels instead of merely complaining.
  private val trackIds               = fullCfg.useId
  private val wrBusy                 = RegInit(False)
  private val rdBusy                 = RegInit(False)
  private def free(busy: Bool): Bool = if (trackIds) !busy else True

  // ── AW ────────────────────────────────────────────────────────────────────
  io.lite.aw.valid := io.full.aw.valid && free(wrBusy)
  io.lite.aw.payload.clearAll()
  io.lite.aw.addr.allowOverride                                         := io.full.aw.addr.resized
  if (fullCfg.useProt && liteCfg.useProt) io.lite.aw.prot.allowOverride := io.full.aw.prot
  io.full.aw.ready := io.lite.aw.ready && free(wrBusy)

  // Store the incoming (expanded) write ID so it can be returned in B.
  // One outstanding write at a time, enforced by the AW gate above.
  if (fullCfg.useId) {
    val pendingWrId = Reg(UInt(fullCfg.idWidth bits)) init (0)
    when(io.full.aw.fire) { pendingWrId := io.full.aw.id; wrBusy := True }
    when(io.full.b.fire) { wrBusy := False }
    assert(
      !(wrBusy && io.full.aw.fire),
      "Axi4FullToLiteAdapter: new AW while previous write still in-flight"
    )

    // ── B ───────────────────────────────────────────────────────────────────
    io.full.b.valid := io.lite.b.valid
    io.full.b.payload.clearAll()
    // A Lite slave may answer in the same cycle it accepts the address -- AXI
    // permits BVALID with AWREADY -- and then the register above has not
    // updated yet and still holds the previous transaction's ID. Responses are
    // routed back to masters by ID, so using the stale one delivers the
    // response to the wrong master. Take the live ID whenever AW is firing:
    // AW can only fire with no write outstanding, so a B in that cycle can
    // only belong to the AW itself, and the two sources cannot disagree.
    io.full.b.id.allowOverride := Mux(io.full.aw.fire, io.full.aw.id, pendingWrId)
    if (fullCfg.useResp && liteCfg.useResp) io.full.b.resp.allowOverride := io.lite.b.resp
    io.lite.b.ready                                                      := io.full.b.ready
  } else {
    io.full.b.valid := io.lite.b.valid
    io.full.b.payload.clearAll()
    if (fullCfg.useResp && liteCfg.useResp) io.full.b.resp.allowOverride := io.lite.b.resp
    io.lite.b.ready                                                      := io.full.b.ready
  }

  // ── W ─────────────────────────────────────────────────────────────────────
  io.lite.w.valid := io.full.w.valid
  io.lite.w.payload.clearAll()
  io.lite.w.data.allowOverride                                         := io.full.w.data.resized
  if (fullCfg.useStrb && liteCfg.useStrb) io.lite.w.strb.allowOverride := io.full.w.strb.resized
  // w.last consumed but not forwarded — Lite has no last field
  io.full.w.ready := io.lite.w.ready

  // ── AR ────────────────────────────────────────────────────────────────────
  io.lite.ar.valid := io.full.ar.valid && free(rdBusy)
  io.lite.ar.payload.clearAll()
  io.lite.ar.addr.allowOverride                                         := io.full.ar.addr.resized
  if (fullCfg.useProt && liteCfg.useProt) io.lite.ar.prot.allowOverride := io.full.ar.prot
  io.full.ar.ready := io.lite.ar.ready && free(rdBusy)

  // Store the incoming (expanded) read ID so it can be returned in R.
  // One outstanding read at a time, enforced by the AR gate above.
  if (fullCfg.useId) {
    val pendingRdId = Reg(UInt(fullCfg.idWidth bits)) init (0)
    when(io.full.ar.fire) { pendingRdId := io.full.ar.id; rdBusy := True }
    when(io.full.r.fire && io.full.r.last) { rdBusy := False }
    assert(
      !(rdBusy && io.full.ar.fire),
      "Axi4FullToLiteAdapter: new AR while previous read still in-flight"
    )

    // ── R ───────────────────────────────────────────────────────────────────
    io.full.r.valid := io.lite.r.valid
    io.full.r.payload.clearAll()
    // Same race as B above, and this one is not theoretical: a register file
    // that registers ARREADY and RVALID together answers on the cycle AR fires.
    io.full.r.id.allowOverride   := Mux(io.full.ar.fire, io.full.ar.id, pendingRdId)
    io.full.r.data.allowOverride := io.lite.r.data.resized
    if (fullCfg.useResp && liteCfg.useResp) io.full.r.resp.allowOverride := io.lite.r.resp
    if (fullCfg.useLast) io.full.r.last.allowOverride := True // Lite is always single-beat
    io.lite.r.ready                                   := io.full.r.ready
  } else {
    io.full.r.valid := io.lite.r.valid
    io.full.r.payload.clearAll()
    io.full.r.data.allowOverride                                         := io.lite.r.data.resized
    if (fullCfg.useResp && liteCfg.useResp) io.full.r.resp.allowOverride := io.lite.r.resp
    if (fullCfg.useLast) io.full.r.last.allowOverride                    := True
    io.lite.r.ready                                                      := io.full.r.ready
  }
}
