// Copyright (c) 2026 Leonardo Capossio
// SPDX-License-Identifier: MIT
package axizero.adapters

import spinal.core._
import spinal.lib._
import spinal.lib.bus.amba4.axi._

// ---------------------------------------------------------------------------
// AXI3 Bus Definition
//
// SpinalHDL has no native AXI3 type.  This bundle matches the ARM AXI3 spec:
//   - AxLEN:  4 bits (burst length 1–16)
//   - AxLOCK: 2 bits (normal / exclusive / locked)
//   - WID:    present on write-data channel (write interleaving)
//   - No AxREGION, no AxQOS
// ---------------------------------------------------------------------------
case class Axi3Config(
  addressWidth: Int,
  dataWidth:    Int,
  idWidth:      Int
) {
  def bytePerWord: Int = dataWidth / 8
}

case class Axi3Aw(cfg: Axi3Config) extends Bundle {
  val id    = UInt(cfg.idWidth bits)
  val addr  = UInt(cfg.addressWidth bits)
  val len   = UInt(4 bits)              // AXI3: 4-bit (0–15 → 1–16 beats)
  val size  = UInt(3 bits)
  val burst = Bits(2 bits)
  val lock  = Bits(2 bits)              // AXI3: 2-bit (00=normal, 01=exclusive, 10=locked)
  val cache = Bits(4 bits)
  val prot  = Bits(3 bits)
}

case class Axi3W(cfg: Axi3Config) extends Bundle {
  val id   = UInt(cfg.idWidth bits)     // AXI3 WID — identifies which AW this beat belongs to
  val data = Bits(cfg.dataWidth bits)
  val strb = Bits(cfg.bytePerWord bits)
  val last = Bool()
}

case class Axi3B(cfg: Axi3Config) extends Bundle {
  val id   = UInt(cfg.idWidth bits)
  val resp = Bits(2 bits)
}

case class Axi3Ar(cfg: Axi3Config) extends Bundle {
  val id    = UInt(cfg.idWidth bits)
  val addr  = UInt(cfg.addressWidth bits)
  val len   = UInt(4 bits)
  val size  = UInt(3 bits)
  val burst = Bits(2 bits)
  val lock  = Bits(2 bits)
  val cache = Bits(4 bits)
  val prot  = Bits(3 bits)
}

case class Axi3R(cfg: Axi3Config) extends Bundle {
  val id   = UInt(cfg.idWidth bits)
  val data = Bits(cfg.dataWidth bits)
  val resp = Bits(2 bits)
  val last = Bool()
}

case class Axi3(cfg: Axi3Config) extends Bundle with IMasterSlave {
  val aw = Stream(Axi3Aw(cfg))
  val w  = Stream(Axi3W(cfg))
  val b  = Stream(Axi3B(cfg))
  val ar = Stream(Axi3Ar(cfg))
  val r  = Stream(Axi3R(cfg))

  override def asMaster(): Unit = {
    master(aw, w, ar)
    slave(b, r)
  }
}

// ---------------------------------------------------------------------------
// Axi3ToAxi4Adapter
//
// Bridges an AXI3 master to an AXI4 slave port.  Three conversions:
//
// 1. LEN:  zero-extend 4-bit → 8-bit
// 2. LOCK: truncate 2-bit → 1-bit; locked (2'b10) is converted to
//          exclusive (1'b1) with a SLVERR on B/R (AXI4 has no locked).
// 3. WID reorder buffer: AXI3 allows interleaved W beats from different
//    transactions (identified by WID).  AXI4 requires strict W order
//    matching AW order.  A small reorder buffer collects W beats and
//    emits them in AW-issue order.
//
// Architecture:
//   AXI3 AW → awCmdFifo (decoupled) → serialized AXI4 AW (one at a time)
//   AXI3 W  → per-WID slot FIFOs → drain in awCmdFifo order → AXI4 W
//   AXI4 B  → awLockedFifo check → AXI3 B (SLVERR if locked)
//
// The adapter serializes writes on the AXI4 side: one complete
// AW+W(beats)+B sequence at a time, because AXI4 has no WID.
//
// Read path: straight-through (no reordering needed).
// ---------------------------------------------------------------------------
class Axi3ToAxi4Adapter(
  axi3Cfg:        Axi3Config,
  axi4Cfg:        Axi4Config,
  maxOutstanding: Int = 4
) extends Component {

  require(axi3Cfg.addressWidth == axi4Cfg.addressWidth,
    "AXI3 and AXI4 address widths must match")
  require(axi3Cfg.dataWidth == axi4Cfg.dataWidth,
    "AXI3 and AXI4 data widths must match")
  require(axi3Cfg.idWidth == axi4Cfg.idWidth,
    "AXI3 and AXI4 ID widths must match")

  val io = new Bundle {
    val axi3 = slave(Axi3(axi3Cfg))
    val axi4 = master(Axi4(axi4Cfg))
  }

  // =========================================================================
  // AR path (read address) — straight-through with field conversion
  // =========================================================================
  io.axi4.ar.valid := io.axi3.ar.valid
  io.axi3.ar.ready := io.axi4.ar.ready

  io.axi4.ar.payload.clearAll()
  io.axi4.ar.addr.allowOverride   := io.axi3.ar.addr
  if (axi4Cfg.useId)     io.axi4.ar.id.allowOverride      := io.axi3.ar.id
  if (axi4Cfg.useLen)    io.axi4.ar.len.allowOverride     := io.axi3.ar.len.resize(8)
  if (axi4Cfg.useSize)   io.axi4.ar.size.allowOverride    := io.axi3.ar.size
  if (axi4Cfg.useBurst)  io.axi4.ar.burst.allowOverride   := io.axi3.ar.burst
  if (axi4Cfg.useLock)   io.axi4.ar.lock.allowOverride    := io.axi3.ar.lock(0 downto 0)
  if (axi4Cfg.useCache)  io.axi4.ar.cache.allowOverride   := io.axi3.ar.cache
  if (axi4Cfg.useProt)   io.axi4.ar.prot.allowOverride    := io.axi3.ar.prot
  if (axi4Cfg.useQos)    io.axi4.ar.qos.allowOverride     := 0
  if (axi4Cfg.useRegion) io.axi4.ar.region.allowOverride   := B(0, 4 bits)

  // ── R path — straight-through back to AXI3 ──
  io.axi3.r.valid    := io.axi4.r.valid
  io.axi4.r.ready    := io.axi3.r.ready
  io.axi3.r.id       := (if (axi4Cfg.useId) io.axi4.r.id else U(0, axi3Cfg.idWidth bits))
  io.axi3.r.data     := io.axi4.r.data
  io.axi3.r.resp     := (if (axi4Cfg.useResp) io.axi4.r.resp else B(0, 2 bits))
  io.axi3.r.last     := (if (axi4Cfg.useLast) io.axi4.r.last else True)

  // =========================================================================
  // AW path — decouple AXI3 AW acceptance from AXI4 AW forwarding
  //
  // AXI3 AWs are accepted immediately into awCmdFifo.  The FSM forwards
  // one AW at a time to AXI4, then drains the corresponding W beats,
  // then waits for B, then moves to the next.
  // =========================================================================

  // Stored AW command (everything needed to forward to AXI4)
  case class AwCmd() extends Bundle {
    val id     = UInt(axi3Cfg.idWidth bits)
    val addr   = UInt(axi3Cfg.addressWidth bits)
    val len    = UInt(4 bits)
    val size   = UInt(3 bits)
    val burst  = Bits(2 bits)
    val lock   = Bits(2 bits)
    val cache  = Bits(4 bits)
    val prot   = Bits(3 bits)
    val locked = Bool()   // was this a locked access?
  }

  val awCmdFifo = new StreamFifo(AwCmd(), maxOutstanding)

  // Accept AXI3 AW into the command FIFO (decoupled from AXI4)
  awCmdFifo.io.push.valid         := io.axi3.aw.valid
  awCmdFifo.io.push.payload.id    := io.axi3.aw.id
  awCmdFifo.io.push.payload.addr  := io.axi3.aw.addr
  awCmdFifo.io.push.payload.len   := io.axi3.aw.len
  awCmdFifo.io.push.payload.size  := io.axi3.aw.size
  awCmdFifo.io.push.payload.burst := io.axi3.aw.burst
  awCmdFifo.io.push.payload.lock  := io.axi3.aw.lock
  awCmdFifo.io.push.payload.cache := io.axi3.aw.cache
  awCmdFifo.io.push.payload.prot  := io.axi3.aw.prot
  awCmdFifo.io.push.payload.locked := (io.axi3.aw.lock === B"10")
  io.axi3.aw.ready := awCmdFifo.io.push.ready

  // =========================================================================
  // W path — WID-based reorder buffer
  //
  // AXI3 W beats are buffered into per-WID slot FIFOs.
  // The FSM drains beats from the slot matching the current AW command.
  // =========================================================================
  val numIds      = 1 << axi3Cfg.idWidth
  val maxBurstLen = 16                    // AXI3 max

  case class WBeat() extends Bundle {
    val data = Bits(axi3Cfg.dataWidth bits)
    val strb = Bits(axi3Cfg.bytePerWord bits)
    val last = Bool()
  }

  val wSlots = Array.fill(numIds)(new StreamFifo(WBeat(), maxBurstLen))

  // Route incoming W beats to the correct slot by WID
  for (i <- 0 until numIds) {
    wSlots(i).io.push.valid        := io.axi3.w.valid && io.axi3.w.id === i
    wSlots(i).io.push.payload.data := io.axi3.w.data
    wSlots(i).io.push.payload.strb := io.axi3.w.strb
    wSlots(i).io.push.payload.last := io.axi3.w.last
  }

  // W accepted when the target slot accepts
  io.axi3.w.ready := False
  for (i <- 0 until numIds) {
    when(io.axi3.w.id === i) {
      io.axi3.w.ready := wSlots(i).io.push.ready
    }
  }

  // =========================================================================
  // Write FSM — serializes AW+W+B on the AXI4 side
  //
  // States:
  //   IDLE      : wait for awCmdFifo to have a command
  //   SEND_AW   : forward the AW command to AXI4
  //   DRAIN_W   : emit W beats from the matching WID slot
  //   WAIT_B    : wait for B response from AXI4 slave
  // =========================================================================
  object FsmState extends SpinalEnum {
    val IDLE, SEND_AW, DRAIN_W, WAIT_B = newElement()
  }
  val state = RegInit(FsmState.IDLE)

  // Current command being processed (registered from awCmdFifo head)
  val curCmd    = Reg(AwCmd())
  val curCmdId  = curCmd.id

  // Default: don't pop awCmdFifo, don't drive AXI4 AW/W
  awCmdFifo.io.pop.ready := False

  io.axi4.aw.valid := False
  io.axi4.aw.payload.clearAll()

  io.axi4.w.valid := False
  io.axi4.w.payload.clearAll()

  // Mux the correct slot's pop interface for drain
  val drainBeat = WBeat()
  val slotValid = Bool()
  val drainReady = Bool()

  drainBeat.data := B(0, axi3Cfg.dataWidth bits)
  drainBeat.strb := B(0, axi3Cfg.bytePerWord bits)
  drainBeat.last := False
  slotValid      := False
  drainReady     := False

  for (i <- 0 until numIds) {
    wSlots(i).io.pop.ready := False
    when(curCmdId === i) {
      drainBeat := wSlots(i).io.pop.payload
      slotValid := wSlots(i).io.pop.valid
      wSlots(i).io.pop.ready := drainReady
    }
  }

  switch(state) {
    is(FsmState.IDLE) {
      when(awCmdFifo.io.pop.valid) {
        curCmd := awCmdFifo.io.pop.payload
        awCmdFifo.io.pop.ready := True
        state := FsmState.SEND_AW
      }
    }

    is(FsmState.SEND_AW) {
      // Forward buffered AW to AXI4.
      // Also forward W simultaneously so that IPIF-based AXI-Lite slaves
      // (GPIO, UART) which require AWVALID AND WVALID in the same cycle
      // before asserting AWREADY/WREADY will not deadlock.
      io.axi4.aw.valid := True
      io.axi4.aw.addr.allowOverride   := curCmd.addr
      if (axi4Cfg.useId)     io.axi4.aw.id.allowOverride      := curCmd.id
      if (axi4Cfg.useLen)    io.axi4.aw.len.allowOverride     := curCmd.len.resize(8)
      if (axi4Cfg.useSize)   io.axi4.aw.size.allowOverride    := curCmd.size
      if (axi4Cfg.useBurst)  io.axi4.aw.burst.allowOverride   := curCmd.burst
      if (axi4Cfg.useLock)   io.axi4.aw.lock.allowOverride    := curCmd.lock(0 downto 0)
      if (axi4Cfg.useCache)  io.axi4.aw.cache.allowOverride   := curCmd.cache
      if (axi4Cfg.useProt)   io.axi4.aw.prot.allowOverride    := curCmd.prot
      if (axi4Cfg.useQos)    io.axi4.aw.qos.allowOverride     := 0
      if (axi4Cfg.useRegion) io.axi4.aw.region.allowOverride   := B(0, 4 bits)

      // Drive W from the wSlot in parallel with AW
      io.axi4.w.valid := slotValid
      io.axi4.w.data.allowOverride := drainBeat.data
      if (axi4Cfg.useStrb) io.axi4.w.strb.allowOverride := drainBeat.strb
      if (axi4Cfg.useLast) io.axi4.w.last.allowOverride := drainBeat.last
      drainReady := io.axi4.w.ready

      when(io.axi4.aw.ready) {
        when(io.axi4.w.fire && drainBeat.last) {
          // AW accepted and last W beat sent in the same cycle (typical for
          // single-beat IPIF writes): skip DRAIN_W, go straight to WAIT_B
          state := FsmState.WAIT_B
        } otherwise {
          state := FsmState.DRAIN_W
        }
      }
    }

    is(FsmState.DRAIN_W) {
      // Emit remaining W beats from the WID slot matching curCmd.id
      io.axi4.w.valid := slotValid
      io.axi4.w.data.allowOverride := drainBeat.data
      if (axi4Cfg.useStrb) io.axi4.w.strb.allowOverride := drainBeat.strb
      if (axi4Cfg.useLast) io.axi4.w.last.allowOverride := drainBeat.last

      drainReady := io.axi4.w.ready

      when(io.axi4.w.fire && drainBeat.last) {
        state := FsmState.WAIT_B
      }
    }

    is(FsmState.WAIT_B) {
      // B is handled below; transition back on B fire
      when(io.axi3.b.fire) {
        state := FsmState.IDLE
      }
    }
  }

  // =========================================================================
  // B path — pass through, inject SLVERR for converted locked accesses
  // =========================================================================
  io.axi3.b.valid := io.axi4.b.valid && (state === FsmState.WAIT_B)
  io.axi4.b.ready := io.axi3.b.ready && (state === FsmState.WAIT_B)

  io.axi3.b.id   := (if (axi4Cfg.useId) io.axi4.b.id else U(0, axi3Cfg.idWidth bits))
  val bResp = if (axi4Cfg.useResp) io.axi4.b.resp else B(0, 2 bits)
  io.axi3.b.resp := Mux(curCmd.locked, B"10", bResp)
}
