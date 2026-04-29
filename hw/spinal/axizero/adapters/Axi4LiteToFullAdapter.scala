// Copyright (c) 2026 Leonardo Capossio — bard0 design  hello@bard0.com
// SPDX-License-Identifier: MIT
package axizero.adapters

import spinal.core._
import spinal.lib._
import spinal.lib.bus.amba4.axi._

// ---------------------------------------------------------------------------
// Axi4LiteToFullAdapter
//
// Adapts an AXI4-Lite master-side port to a full AXI4 port so a Lite master
// can issue transactions through an AXI4 crossbar fabric.
//
// Stateless: single-beat defaults are wired combinatorially.
//   AW/AR  addr + prot passed through; burst fields forced to single-beat
//          (len=0, size=log2(dataWidth/8), burst=INCR, lock/cache/qos=0).
//   W      data + strb passed through; last forced to 1.
//   B      resp passed back; id from fabric discarded (Lite has no IDs).
//   R      data + resp passed back; id and last from fabric discarded.
// ---------------------------------------------------------------------------
class Axi4LiteToFullAdapter(liteCfg: Axi4Config, fullCfg: Axi4Config) extends Component {

  val io = new Bundle {
    val lite = slave(Axi4(liteCfg))  // external Lite master
    val full = master(Axi4(fullCfg)) // fabric-side full AXI4
  }

  // ── AW ────────────────────────────────────────────────────────────────────
  io.full.aw.valid := io.lite.aw.valid
  io.full.aw.payload.clearAll()
  io.full.aw.addr.allowOverride                                         := io.lite.aw.addr.resized
  if (liteCfg.useProt && fullCfg.useProt) io.full.aw.prot.allowOverride := io.lite.aw.prot
  if (fullCfg.useId) io.full.aw.id.allowOverride                        := 0
  if (fullCfg.useLen) io.full.aw.len.allowOverride                      := 0
  if (fullCfg.useSize) io.full.aw.size.allowOverride   := log2Up(liteCfg.dataWidth / 8)
  if (fullCfg.useBurst) io.full.aw.burst.allowOverride := 1 // INCR
  io.lite.aw.ready                                     := io.full.aw.ready

  // ── W ─────────────────────────────────────────────────────────────────────
  io.full.w.valid := io.lite.w.valid
  io.full.w.payload.clearAll()
  io.full.w.data.allowOverride                                         := io.lite.w.data.resized
  if (liteCfg.useStrb && fullCfg.useStrb) io.full.w.strb.allowOverride := io.lite.w.strb.resized
  if (fullCfg.useLast) io.full.w.last.allowOverride := True // always last (single beat)
  io.lite.w.ready                                   := io.full.w.ready

  // ── B ─────────────────────────────────────────────────────────────────────
  io.lite.b.valid := io.full.b.valid
  io.lite.b.payload.clearAll()
  if (liteCfg.useResp && fullCfg.useResp) io.lite.b.resp.allowOverride := io.full.b.resp
  io.full.b.ready                                                      := io.lite.b.ready

  // ── AR ────────────────────────────────────────────────────────────────────
  io.full.ar.valid := io.lite.ar.valid
  io.full.ar.payload.clearAll()
  io.full.ar.addr.allowOverride                                         := io.lite.ar.addr.resized
  if (liteCfg.useProt && fullCfg.useProt) io.full.ar.prot.allowOverride := io.lite.ar.prot
  if (fullCfg.useId) io.full.ar.id.allowOverride                        := 0
  if (fullCfg.useLen) io.full.ar.len.allowOverride                      := 0
  if (fullCfg.useSize) io.full.ar.size.allowOverride   := log2Up(liteCfg.dataWidth / 8)
  if (fullCfg.useBurst) io.full.ar.burst.allowOverride := 1 // INCR
  io.lite.ar.ready                                     := io.full.ar.ready

  // ── R ─────────────────────────────────────────────────────────────────────
  io.lite.r.valid := io.full.r.valid
  io.lite.r.payload.clearAll()
  io.lite.r.data.allowOverride                                         := io.full.r.data.resized
  if (liteCfg.useResp && fullCfg.useResp) io.lite.r.resp.allowOverride := io.full.r.resp
  io.full.r.ready                                                      := io.lite.r.ready
}
