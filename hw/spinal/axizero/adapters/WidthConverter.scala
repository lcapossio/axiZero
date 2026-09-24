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
//   Downsizing (wide side upstream → narrow side downstream):
//     Axi4LiteDownsizer. A Lite transfer is the full width of its bus, so one
//     wide beat becomes one narrow transaction per chunk of the wide word:
//     • Writes go out only for chunks with a strobe set. A slave with write
//       side effects -- a FIFO, a clear-on-write flag -- must not see a write
//       to bytes the master did not name. A write with no strobe at all still
//       goes out once, to the chunk its address names, so it is not lost.
//     • Reads start at the chunk the address names and run to the end of the
//       wide word. Bytes below the address are not part of the transfer; bytes
//       above it may be, and Lite carries no size to say otherwise, so they
//       are read. Lanes not read come back as zero.
//     • The response is the worst of the chunks' responses, so an error from
//       any one of them reaches the master.
//     One transaction per direction is in flight at a time.
//
//   Axi4LiteWidth.adapt picks between the two, or a plain wire, for any pair
//   of widths. Both tops route every Lite width change through it, so a Lite
//   master or slave on either side of the fabric's width is handled alike.
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

// ── AXI4-Lite downsizer ──────────────────────────────────────────────────────

/** Splits each wide AXI4-Lite transaction into one narrow transaction per chunk of the wide word.
  *
  * io.wide receives from upstream (a wide master, or the fabric); io.narrow drives downstream (the
  * fabric, or a narrow slave). The two configs may differ in address width and in which optional
  * signals they carry as well as in data width -- the Lite fabric normalises its own ports -- so
  * every field is mapped across explicitly.
  */
class Axi4LiteDownsizer(wideCfg: Axi4Config, narrowCfg: Axi4Config) extends Component {
  require(
    wideCfg.dataWidth > narrowCfg.dataWidth,
    s"Axi4LiteDownsizer narrows (wide=${wideCfg.dataWidth}, narrow=${narrowCfg.dataWidth})"
  )
  require(
    wideCfg.dataWidth % narrowCfg.dataWidth == 0,
    "Axi4LiteDownsizer: dataWidth ratio must be a whole number"
  )

  val io = new Bundle {
    val wide   = slave(Axi4(wideCfg))
    val narrow = master(Axi4(narrowCfg))
  }

  private val wideW     = wideCfg.dataWidth
  private val narrowW   = narrowCfg.dataWidth
  private val ratio     = wideW / narrowW
  private val wideBytes = wideW / 8
  private val chunkBits = log2Up(ratio)
  private val narrowOff = log2Up(narrowW / 8)
  private val wideOff   = log2Up(wideBytes)
  private val addrW     = wideCfg.addressWidth
  private val withProt  = wideCfg.useProt && narrowCfg.useProt
  private val withStrb  = wideCfg.useStrb && narrowCfg.useStrb

  /** Which chunk of its wide word an address falls in. */
  private def chunkOf(addr: UInt): UInt = addr(wideOff - 1 downto narrowOff)

  /** The address of chunk `k` of the wide word holding `addr`. */
  private def chunkAddr(addr: UInt, k: UInt): UInt = {
    val word = addr(addrW - 1 downto wideOff) ## k
    (if (narrowOff > 0) word ## B(0, narrowOff bits) else word).asUInt
  }

  /** The worse of two responses: DECERR > SLVERR > OKAY, which is their numeric order. */
  private def worst(a: Bits, b: Bits): Bits = Mux(a.asUInt > b.asUInt, a, b)

  // ── Write ────────────────────────────────────────────────────────────────
  val wr = new Area {
    val haveAw    = RegInit(False)
    val haveW     = RegInit(False)
    val issuing   = RegInit(False)
    val answering = RegInit(False)
    val awDone    = RegInit(False)
    val wDone     = RegInit(False)
    val addr      = Reg(UInt(addrW bits)) init (0)
    val prot      = Reg(Bits(3 bits)) init (0)
    val data      = Reg(Bits(wideW bits)) init (0)
    val strb      = Reg(Bits(wideBytes bits)) init (0)
    val chunk     = Reg(UInt(chunkBits bits)) init (0)
    val resp      = Reg(Bits(2 bits)) init (0)

    val idle = !issuing && !answering
    io.wide.aw.ready := !haveAw && idle
    io.wide.w.ready  := !haveW && idle
    when(io.wide.aw.fire) {
      haveAw             := True
      addr               := io.wide.aw.addr
      if (withProt) prot := io.wide.aw.prot
    }
    when(io.wide.w.fire) {
      haveW := True
      data  := io.wide.w.data
      strb  := (if (wideCfg.useStrb) io.wide.w.strb else B(wideBytes bits, default -> True))
    }
    when(haveAw && haveW && idle) {
      haveAw  := False
      haveW   := False
      issuing := True
      chunk   := 0
      resp    := 0
    }

    val chunkStrb = strb.subdivideIn(ratio slices)(chunk)
    // Send this chunk if it carries a strobe -- or, for a write with none at
    // all, if it is the chunk the address names, so the write is not lost.
    val take = chunkStrb =/= 0 || (strb === 0 && chunk === chunkOf(addr))
    val last = chunk === ratio - 1

    io.narrow.aw.valid                       := issuing && take && !awDone
    io.narrow.aw.addr                        := chunkAddr(addr, chunk).resized
    if (narrowCfg.useProt) io.narrow.aw.prot := (if (withProt) prot else B"010")

    io.narrow.w.valid                       := issuing && take && !wDone
    io.narrow.w.data                        := data.subdivideIn(ratio slices)(chunk)
    if (narrowCfg.useStrb) io.narrow.w.strb := chunkStrb

    io.narrow.b.ready := issuing && awDone && wDone

    when(io.narrow.aw.fire) { awDone := True }
    when(io.narrow.w.fire) { wDone := True }

    def advance(): Unit =
      when(last) {
        issuing   := False
        answering := True
      } otherwise {
        chunk := chunk + 1
      }

    when(issuing && !take) { advance() }
    when(io.narrow.b.fire) {
      awDone                      := False
      wDone                       := False
      if (narrowCfg.useResp) resp := worst(resp, io.narrow.b.resp)
      advance()
    }

    io.wide.b.valid                     := answering
    if (wideCfg.useResp) io.wide.b.resp := resp
    when(io.wide.b.fire) { answering := False }
  }

  // ── Read ─────────────────────────────────────────────────────────────────
  val rd = new Area {
    val busy      = RegInit(False)
    val answering = RegInit(False)
    val arDone    = RegInit(False)
    val addr      = Reg(UInt(addrW bits)) init (0)
    val prot      = Reg(Bits(3 bits)) init (0)
    val data      = Reg(Bits(wideW bits)) init (0)
    val chunk     = Reg(UInt(chunkBits bits)) init (0)
    val resp      = Reg(Bits(2 bits)) init (0)

    io.wide.ar.ready := !busy && !answering
    when(io.wide.ar.fire) {
      busy               := True
      arDone             := False
      addr               := io.wide.ar.addr
      if (withProt) prot := io.wide.ar.prot
      // Start at the chunk the address names: bytes below it are not part of
      // the transfer, and lanes that are not read come back as zero.
      chunk := chunkOf(io.wide.ar.addr)
      data  := 0
      resp  := 0
    }

    io.narrow.ar.valid                       := busy && !arDone
    io.narrow.ar.addr                        := chunkAddr(addr, chunk).resized
    if (narrowCfg.useProt) io.narrow.ar.prot := (if (withProt) prot else B"010")
    when(io.narrow.ar.fire) { arDone := True }

    io.narrow.r.ready := busy && arDone
    when(io.narrow.r.fire) {
      for (k <- 0 until ratio)
        when(chunk === k) { data(k * narrowW, narrowW bits) := io.narrow.r.data }
      if (narrowCfg.useResp) resp := worst(resp, io.narrow.r.resp)
      arDone                      := False
      when(chunk === ratio - 1) {
        busy      := False
        answering := True
      } otherwise {
        chunk := chunk + 1
      }
    }

    io.wide.r.valid                     := answering
    io.wide.r.data                      := data
    if (wideCfg.useResp) io.wide.r.resp := resp
    when(io.wide.r.fire) { answering := False }
  }
}

/** Carry an AXI4-Lite port across a change of data width, in whichever direction it goes. */
object Axi4LiteWidth {

  /** The downstream end of `upstream` at `dataWidth` bits, its config otherwise unchanged: through
    * the upsizer when it widens, the downsizer when it narrows, and `upstream` itself when the
    * width already agrees.
    */
  def adapt(upstream: Axi4, dataWidth: Int): Axi4 = {
    val inCfg  = upstream.config
    val outCfg = inCfg.copy(dataWidth = dataWidth)
    if (inCfg.dataWidth == dataWidth) upstream
    else if (inCfg.dataWidth < outCfg.dataWidth) {
      val up = new Axi4LiteWidthConverter(inCfg, outCfg)
      up.io.narrow << upstream
      up.io.wide
    } else {
      val down = new Axi4LiteDownsizer(inCfg, outCfg)
      down.io.wide << upstream
      down.io.narrow
    }
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
