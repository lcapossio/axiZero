// Copyright (c) 2026 Leonardo Capossio — bard0 design  hello@bard0.com
// SPDX-License-Identifier: MIT
package vexzero

import spinal.core._
import spinal.lib._
import spinal.lib.bus.amba4.axi._

// ---------------------------------------------------------------------------
// LiteRegBus  —  minimal AXI4-Lite register-file back end
//
// One single-beat transaction in flight per direction: enough for a memory
// mapped peripheral and small enough to read in one sitting.  Instantiate it
// *after* the peripheral's registers so they can be referenced directly:
//
//   val ledReg = Reg(Bits(32 bits)) init (0)
//   val bus    = LiteRegBus(io.axi, wordCount = 2)
//   bus.readData := bus.readIndex.muxListDc(Seq(0 -> ledReg, 1 -> switches))
//   when(bus.writeFire) { switch(bus.writeIndex) { is(0) { ledReg := ... } } }
//
// readData is declared here and assigned by the user afterwards.
// ---------------------------------------------------------------------------
case class LiteRegBus(axi: Axi4, wordCount: Int, writeStall: Bool = False) extends Area {
  private val dataWidth = axi.config.dataWidth
  private val byteCount = dataWidth / 8
  private val idxW      = Math.max(log2Up(wordCount), 1)
  private val wordRange = (idxW + log2Up(byteCount) - 1) downto log2Up(byteCount)

  /** One-cycle pulse: AW and W have both landed, no B is pending, and the peripheral is not holding
    * the write off. `writeStall` is how a peripheral backpressures the CPU: the write simply does
    * not complete, so no B goes back and the store stalls in the pipeline.
    */
  val writeFire  = Bool()
  val writeIndex = UInt(idxW bits)
  val writeData  = Bits(dataWidth bits)
  val writeStrb  = Bits(byteCount bits)

  /** Register index being read; readData must answer combinationally. */
  val readIndex = UInt(idxW bits)
  val readData  = Bits(dataWidth bits)

  // ── Write channel ────────────────────────────────────────────────────────
  private val awHeld = RegInit(False)
  private val awIdx  = Reg(UInt(idxW bits)) init (0)
  private val wHeld  = RegInit(False)
  private val wData  = Reg(Bits(dataWidth bits)) init (0)
  private val wStrb  = Reg(Bits(byteCount bits)) init (0)
  private val bHeld  = RegInit(False)

  axi.aw.ready := !awHeld && !bHeld
  axi.w.ready  := !wHeld && !bHeld

  when(axi.aw.fire) {
    awHeld := True
    awIdx  := axi.aw.addr(wordRange).resized
  }
  when(axi.w.fire) {
    wHeld := True
    wData := axi.w.data
    wStrb := (if (axi.config.useStrb) axi.w.strb else B(byteCount bits, default -> true))
  }

  writeFire  := awHeld && wHeld && !bHeld && !writeStall
  writeIndex := awIdx
  writeData  := wData
  writeStrb  := wStrb

  when(writeFire) {
    awHeld := False
    wHeld  := False
    bHeld  := True
  }

  axi.b.valid                        := bHeld
  if (axi.config.useResp) axi.b.resp := Axi4.resp.OKAY
  if (axi.config.useId) axi.b.id     := 0
  when(axi.b.fire) { bHeld := False }

  // ── Read channel ─────────────────────────────────────────────────────────
  private val arHeld = RegInit(False)
  private val arIdx  = Reg(UInt(idxW bits)) init (0)

  axi.ar.ready := !arHeld
  when(axi.ar.fire) {
    arHeld := True
    arIdx  := axi.ar.addr(wordRange).resized
  }

  readIndex                          := arIdx
  axi.r.valid                        := arHeld
  axi.r.data                         := readData
  if (axi.config.useResp) axi.r.resp := Axi4.resp.OKAY
  if (axi.config.useId) axi.r.id     := 0
  if (axi.config.useLast) axi.r.last := True
  when(axi.r.fire) { arHeld := False }

  /** Byte-masked update of a register from the current write beat. */
  def maskedUpdate(reg: Bits): Unit =
    for (b <- 0 until byteCount) {
      val slice = (b * 8 + 7) downto (b * 8)
      when(writeStrb(b)) { reg(slice) := writeData(slice) }
    }
}

// ---------------------------------------------------------------------------
// VexZeroGpio  —  AXI4-Lite GPIO
//
//   0x00  led      RW   drives io.leds (low ledWidth bits)
//   0x04  switch   RO   samples io.switches
// ---------------------------------------------------------------------------
class VexZeroGpio(axiCfg: Axi4Config, ledWidth: Int, switchWidth: Int) extends Component {
  val io = new Bundle {
    val axi      = slave(Axi4(axiCfg))
    val leds     = out Bits (ledWidth bits)
    val switches = in Bits (switchWidth bits)
  }

  private val ledReg = Reg(Bits(axiCfg.dataWidth bits)) init (0)
  io.leds := ledReg(ledWidth - 1 downto 0)

  private val bus = LiteRegBus(io.axi, wordCount = 2)

  bus.readData := bus.readIndex.muxListDc(
    Seq(
      0 -> ledReg,
      1 -> io.switches.resize(axiCfg.dataWidth bits)
    )
  )

  when(bus.writeFire) {
    switch(bus.writeIndex) {
      is(0) { bus.maskedUpdate(ledReg) }
    }
  }
}

// ---------------------------------------------------------------------------
// VexZeroSysCtrl  —  AXI4-Lite system-control block
//
//   0x00  cycles   RO   free-running cycle counter
//   0x04  charOut  WO   byte written here is emitted on io.charOut
//   0x08  status   RW   drives io.status (firmware writes a done marker here)
//   0x0C  result   RW   drives io.result (firmware's computed value)
// ---------------------------------------------------------------------------
class VexZeroSysCtrl(axiCfg: Axi4Config) extends Component {
  val io = new Bundle {
    val axi     = slave(Axi4(axiCfg))
    val charOut = master Flow (Bits(8 bits))
    val status  = out Bits (axiCfg.dataWidth bits)
    val result  = out Bits (axiCfg.dataWidth bits)
  }

  private val cycles    = Reg(UInt(axiCfg.dataWidth bits)) init (0)
  private val statusReg = Reg(Bits(axiCfg.dataWidth bits)) init (0)
  private val resultReg = Reg(Bits(axiCfg.dataWidth bits)) init (0)

  cycles    := cycles + 1
  io.status := statusReg
  io.result := resultReg

  private val bus = LiteRegBus(io.axi, wordCount = 4)

  bus.readData := bus.readIndex.muxListDc(
    Seq(
      0 -> cycles.asBits,
      1 -> B(0, axiCfg.dataWidth bits), // charOut is write-only; read back as 0
      2 -> statusReg,
      3 -> resultReg
    )
  )

  io.charOut.valid   := False
  io.charOut.payload := bus.writeData(7 downto 0)

  when(bus.writeFire) {
    switch(bus.writeIndex) {
      is(1) { io.charOut.valid := True }
      is(2) { bus.maskedUpdate(statusReg) }
      is(3) { bus.maskedUpdate(resultReg) }
    }
  }
}

// ---------------------------------------------------------------------------
// VexZeroBenchIo  —  AXI4-Lite console and timer for prebuilt VexRiscv binaries
//
// The register layout is not ours: it is the one VexRiscv's own regression
// testbench implements, so the benchmark and test binaries that ship with the
// submodule run on this SoC unmodified, at the address their linker already
// baked in.
//
//   0xF00  W   putchar        byte written here leaves on io.charOut
//   0xF10  R   clock()        free-running cycle counter
//   0xF20  W   exit           end of run; 0 means success
//   0xF24  W   error          end of run, always a failure
//
// putchar backpressures. A CPU printing at one character per few hundred
// cycles outruns a 115200 baud line by two orders of magnitude, and a dropped
// character in the middle of a result line is worse than a slow print, so the
// store is held until the character is taken. Nothing in the timed part of a
// benchmark prints, so this does not touch the measurement.
// ---------------------------------------------------------------------------
object VexZeroBenchIo {
  val charWord  = 0xf00 / 4
  val clockWord = 0xf10 / 4
  val exitWord  = 0xf20 / 4
  val errorWord = 0xf24 / 4

  /** Window the peripheral needs: the offsets above are near the top of 4 KB. */
  val windowSize: BigInt = 4096
}

class VexZeroBenchIo(axiCfg: Axi4Config) extends Component {
  import VexZeroBenchIo._

  val io = new Bundle {
    val axi     = slave(Axi4(axiCfg))
    val charOut = master Stream (Bits(8 bits))

    /** High once the program has written the exit register. */
    val done = out Bool ()

    /** The value it exited with; 0 is success by the testbench's convention. */
    val exitCode = out Bits (axiCfg.dataWidth bits)
  }

  private val cycles   = Reg(UInt(axiCfg.dataWidth bits)) init (0)
  private val doneReg  = RegInit(False)
  private val codeReg  = Reg(Bits(axiCfg.dataWidth bits)) init (0)
  private val charReg  = Reg(Bits(8 bits)) init (0)
  private val charHeld = RegInit(False)

  cycles := cycles + 1

  // The next putchar waits for the previous character to be taken, so valid is
  // driven from registers only and never from the consumer's ready.
  private val stall = Bool()
  private val bus   = LiteRegBus(io.axi, wordCount = (windowSize / 4).toInt, writeStall = stall)
  stall := charHeld && bus.writeIndex === charWord

  bus.readData := B(0, axiCfg.dataWidth bits)
  when(bus.readIndex === clockWord) { bus.readData := cycles.asBits }

  when(bus.writeFire) {
    switch(bus.writeIndex) {
      is(charWord) {
        charReg  := bus.writeData(7 downto 0)
        charHeld := True
      }
      is(exitWord) {
        doneReg := True
        codeReg := bus.writeData
      }
      is(errorWord) {
        doneReg := True
        codeReg := bus.writeData.orR ? bus.writeData | B(1, axiCfg.dataWidth bits)
      }
    }
  }

  io.charOut.valid   := charHeld
  io.charOut.payload := charReg
  when(io.charOut.fire) { charHeld := False }

  io.done     := doneReg
  io.exitCode := codeReg
}
