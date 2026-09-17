// Copyright (c) 2026 Leonardo Capossio — bard0 design  hello@bard0.com
// SPDX-License-Identifier: MIT
package axizero.crossbar

import spinal.core._
import spinal.lib._
import spinal.lib.bus.amba4.axi._

// ---------------------------------------------------------------------------
// Axi4DecErrSlave — the fabric's answer to an address that decodes to nothing
//
// A crossbar that only ever drives AWREADY/ARREADY for an address it can place
// has no way to refuse one it cannot. The master keeps its request asserted
// waiting for a handshake that will never come, and the port is wedged for
// good: no timeout, no error, no diagnostic -- just a bus that stops. A single
// stray address, from a corrupted instruction or a driver bug, takes the whole
// system down with it and leaves nothing behind to explain why.
//
// AXI already has the answer. AWREADY and ARREADY are accepted normally, and
// the transaction is completed with DECERR on B or R -- exactly what a real
// interconnect does for an unmapped address. The master gets its handshake,
// the bus keeps running, and the CPU sees a bus fault it can report.
//
// The crossbar wires this in as an ordinary extra slave that owns "everything
// no other slave claimed", so arbitration, W routing and ID-based response
// routing all apply to it unchanged.
//
// Reads and writes have independent engines, so an errored read and an errored
// write can be in flight together. Each engine handles one transaction at a
// time and holds READY low until it is done, which is all the backpressure the
// crossbar needs to throttle itself.
//
// The response code is a parameter, and DECERR is only its default. A mapped
// slave that answers SLVERR is the same hardware and is worth having for one
// reason: a write response carries nothing but an ID and a response code, so a
// B swapped between two IDs that are both waiting is invisible when every
// target answers OKAY. A target that answers something else gives each write
// response an identity, which is what AxiMultiIdGen's write-side check needs to
// have anything to compare against. See AxiMultiIdGen's header.
// ---------------------------------------------------------------------------
class Axi4DecErrSlave(config: Axi4Config, respCode: Int = 3) extends Component {

  require(
    respCode == 2 || respCode == 3,
    s"Axi4DecErrSlave: respCode is SLVERR (2) or DECERR (3), not $respCode -- a responder that " +
      "answers OKAY would report success for an address it refused"
  )

  // A def, not a val: each use emits the literal where it stands, so the
  // default build generates the same Verilog the hardcoded DECERR did rather
  // than a constant wire threaded through it.
  private def errResp: Bits = B(respCode, 2 bits)

  val io = new Bundle {
    val axi = slave(Axi4(config))
  }

  // ── Write: accept the address, sink every W beat, then answer DECERR ──────
  val write = new Area {
    // Split into "sinking W" and "answering B" so the response is never
    // presented before the last beat of write data has been taken. A master is
    // entitled to hold WVALID until WREADY, and dropping those beats would
    // leave the W channel out of step with every write that follows.
    val sinking   = RegInit(False)
    val answering = RegInit(False)
    // A Lite port carries no ID and reports idWidth as -1, so the register is
    // only built where there is an ID to remember.
    val id = if (config.useId) Reg(UInt(config.idWidth bits)) init (0) else null

    io.axi.aw.ready := !sinking && !answering
    when(io.axi.aw.fire) {
      sinking              := True
      if (config.useId) id := io.axi.aw.id
    }

    io.axi.w.ready := sinking
    val lastBeat = if (config.useLast) io.axi.w.last else True
    when(sinking && io.axi.w.fire && lastBeat) {
      sinking   := False
      answering := True
    }

    io.axi.b.valid := answering
    io.axi.b.payload.clearAll()
    if (config.useResp) io.axi.b.resp.allowOverride := errResp
    if (config.useId) io.axi.b.id.allowOverride     := id
    when(io.axi.b.fire) { answering := False }
  }

  // ── Read: accept the address, then return len+1 beats of DECERR ───────────
  val read = new Area {
    // A burst read must be answered beat for beat -- a master counts the beats
    // it asked for and waits for RLAST, so a single error beat would hang it
    // just as surely as no answer at all.
    val busy      = RegInit(False)
    val id        = if (config.useId) Reg(UInt(config.idWidth bits)) init (0) else null
    val beatsLeft = Reg(UInt(8 bits)) init (0)

    io.axi.ar.ready := !busy
    when(io.axi.ar.fire) {
      busy                 := True
      if (config.useId) id := io.axi.ar.id
      beatsLeft            := (if (config.useLen) io.axi.ar.len else U(0, 8 bits))
    }

    io.axi.r.valid := busy
    io.axi.r.payload.clearAll()
    // Read data is undefined for an errored beat; zero is the least surprising
    // thing to hand back, and keeps the beat reproducible in simulation.
    io.axi.r.data.allowOverride                     := 0
    if (config.useResp) io.axi.r.resp.allowOverride := errResp
    if (config.useId) io.axi.r.id.allowOverride     := id
    if (config.useLast) io.axi.r.last.allowOverride := beatsLeft === 0

    when(io.axi.r.fire) {
      when(beatsLeft === 0) {
        busy := False
      } otherwise {
        beatsLeft := beatsLeft - 1
      }
    }
  }
}
