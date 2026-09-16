// Copyright (c) 2026 Leonardo Capossio - bard0 design  hello@bard0.com
// SPDX-License-Identifier: MIT
package axizero.adapters

import spinal.core._
import spinal.lib._
import spinal.lib.bus.amba4.axi._

/** Presents an AXI4 master's traffic on an AXI3 bus.
  *
  * This is not an adapter and does nothing clever: AXI4 and AXI3 differ, on the master side, only
  * in how wide two fields are. AWLEN/ARLEN narrow from eight bits to four, AWLOCK/ARLOCK widen from
  * one to two, and AXI3 adds WID, which is zero for a master that uses a single ID. Everything else
  * is the same wire.
  *
  * It exists so that a test can put a real AXI3 master in front of [[Axi3ToAxi4Adapter]] without a
  * second traffic generator: whatever drives the AXI4 side -- a CPU, a bridge, a stress generator
  * -- becomes an AXI3 master, and the adapter under test has to carry it.
  *
  * Every optional AXI4 field is optional here too, because the buses this is used on are real ones
  * rather than fully populated examples: VexRiscv's data bus carries no LEN, no BURST and no LOCK
  * at all. A field the source does not have is driven to what a single-beat INCR transfer would
  * carry, which is exactly what such a master means.
  *
  * The caller is responsible for the narrowing: a burst longer than 16 beats has no AXI3 encoding
  * and its length is truncated here rather than split. Every master this is used with issues at
  * most 16 beats.
  *
  * @param src
  *   the upstream bus, whose VALIDs are driven by the master and whose READYs this drives.
  */
object Axi4ToAxi3 {
  def apply(src: Axi4, axi3Cfg: Axi3Config): Axi3 = {
    val cfg  = src.config
    val axi3 = Axi3(axi3Cfg)

    // What an absent field stands for. A master with no LEN issues one beat,
    // with no SIZE a full data word, with no BURST an incrementing one. These
    // are the meanings AXI gives those defaults, not placeholders.
    val noLen   = U(0, 4 bits)
    val noSize  = U(log2Up(cfg.bytePerWord), 3 bits)
    val incr    = B(1, 2 bits)
    val noLock  = B(0, 2 bits)
    val noCache = B(0, 4 bits)
    val noProt  = B(0, 3 bits)

    // AW. Axi3Aw and Axi3Ar are separate bundles with the same fields, so the
    // two address channels are written out rather than shared through a
    // common supertype that does not exist.
    axi3.aw.valid := src.aw.valid
    src.aw.ready  := axi3.aw.ready
    axi3.aw.id    := (if (cfg.useId) src.aw.id.resized else U(0))
    axi3.aw.addr  := src.aw.addr
    axi3.aw.len   := (if (cfg.useLen) src.aw.len.resize(4) else noLen)
    axi3.aw.size  := (if (cfg.useSize) src.aw.size else noSize)
    axi3.aw.burst := (if (cfg.useBurst) src.aw.burst else incr)
    axi3.aw.lock  := (if (cfg.useLock) src.aw.lock.resize(2) else noLock)
    axi3.aw.cache := (if (cfg.useCache) src.aw.cache else noCache)
    axi3.aw.prot  := (if (cfg.useProt) src.aw.prot else noProt)

    axi3.w.valid := src.w.valid
    src.w.ready  := axi3.w.ready
    axi3.w.id    := 0 // one ID in, one ID out; AXI3 write interleaving is not used
    axi3.w.data  := src.w.data
    axi3.w.strb  := (if (cfg.useStrb) src.w.strb else B(axi3Cfg.bytePerWord bits, default -> True))
    axi3.w.last  := (if (cfg.useLast) src.w.last else True)

    src.b.valid                 := axi3.b.valid
    axi3.b.ready                := src.b.ready
    if (cfg.useId) src.b.id     := axi3.b.id.resized
    if (cfg.useResp) src.b.resp := axi3.b.resp

    // AR.
    axi3.ar.valid := src.ar.valid
    src.ar.ready  := axi3.ar.ready
    axi3.ar.id    := (if (cfg.useId) src.ar.id.resized else U(0))
    axi3.ar.addr  := src.ar.addr
    axi3.ar.len   := (if (cfg.useLen) src.ar.len.resize(4) else noLen)
    axi3.ar.size  := (if (cfg.useSize) src.ar.size else noSize)
    axi3.ar.burst := (if (cfg.useBurst) src.ar.burst else incr)
    axi3.ar.lock  := (if (cfg.useLock) src.ar.lock.resize(2) else noLock)
    axi3.ar.cache := (if (cfg.useCache) src.ar.cache else noCache)
    axi3.ar.prot  := (if (cfg.useProt) src.ar.prot else noProt)

    src.r.valid                 := axi3.r.valid
    axi3.r.ready                := src.r.ready
    src.r.data                  := axi3.r.data
    if (cfg.useId) src.r.id     := axi3.r.id.resized
    if (cfg.useResp) src.r.resp := axi3.r.resp
    if (cfg.useLast) src.r.last := axi3.r.last

    axi3
  }
}
