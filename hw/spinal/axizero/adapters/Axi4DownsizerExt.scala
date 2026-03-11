// Copyright (c) 2026 Leonardo Capossio — bard0 design  hello@bard0.com
// SPDX-License-Identifier: MIT
//
// Forked from SpinalHDL v1.10.1 spinal.lib.bus.amba4.axi.Axi4Downsizer
//
// Changes from upstream:
//   - Removed `assert(!config.useBurst)` — the logic already handles INCR
//     bursts correctly; the burst field flows through assignUnassignedByName.
//   - Removed `assert(!config.useId)` — IDs propagate naturally through
//     the sub-transaction generator and response paths.
//   - Renamed classes with Ext suffix to avoid collision with SpinalHDL.
//
// All three AXI4 burst types are supported:
//   FIXED (0b00) — sub-transaction addresses step by 2^sizeOut (byte lane only)
//   INCR  (0b01) — sub-transaction addresses step by (len+1)<<sizeOut
//   WRAP  (0b10) — same stride as INCR, wrapped at the input burst boundary
// Reserved burst type 0b11 triggers a simulation assertion.
package axizero.adapters

import spinal.core._
import spinal.lib._
import spinal.lib.bus.amba4.axi._

// ---------------------------------------------------------------------------
// Sub-transaction generator — splits one wide AX command into N narrow ones.
//
// Burst type handling:
//   The address update between sub-transactions depends on the input burst:
//   FIXED: stride = 2^sizeOut  (next byte lane within the wide word)
//   INCR:  stride = (len+1) << sizeOut  (next contiguous narrow region)
//   WRAP:  stride = same as INCR, but address wraps at the input burst's
//          wrap boundary = (len+1) << sizeIn
//   When useBurst=false, INCR is assumed (no extra logic generated).
// ---------------------------------------------------------------------------
object Axi4DownsizerExtSubTransactionGenerator {
  def apply[T <: Axi4Ax](
      input:        Stream[T],
      output:       Stream[T],
      inputConfig:  Axi4Config,
      outputConfig: Axi4Config
  ): Axi4DownsizerExtSubTransactionGenerator[T] = {
    val gen = new Axi4DownsizerExtSubTransactionGenerator(
      input.payloadType, inputConfig, outputConfig)
    gen.io.input  << input
    gen.io.output >> output
    gen
  }
}

class Axi4DownsizerExtSubTransactionGenerator[T <: Axi4Ax](
    dataType:     HardType[T],
    inputConfig:  Axi4Config,
    outputConfig: Axi4Config
) extends Component {

  val sizeWidth  = 3
  val ratioWidth = (1 << sizeWidth) - 1

  val io = new Bundle {
    val input   = slave(Stream(dataType))
    val output  = master(Stream(dataType))
    val start   = out UInt (inputConfig.addressWidth bits)
    val ratio   = out UInt (ratioWidth bits)
    val size    = out UInt (sizeWidth bits)
    val working = out Bool ()
    val last    = out Bool ()
    val done    = out Bool ()
  }

  val sizeMaxOut = log2Up(outputConfig.bytePerWord)
  val sizeMaxIn  = log2Up(inputConfig.bytePerWord)

  val startAddress = cloneOf(io.input.addr)
  val sizeIn       = if (inputConfig.useSize) io.input.size else U(sizeMaxIn, sizeWidth bits)
  val sizeDiff     = sizeIn - sizeMaxOut
  val sizePerTrans = UInt(sizeWidth bits)
  val ratio        = cloneOf(io.ratio)

  when(sizeIn > sizeMaxOut) {
    startAddress := (io.input.addr |>> sizeIn) |<< sizeIn
    ratio        := (U(1, ratioWidth bits) |<< sizeDiff) - 1
    sizePerTrans := sizeMaxOut
  } otherwise {
    startAddress := io.input.addr
    ratio        := 0
    sizePerTrans := sizeIn
  }

  val cmdStreamWithSize = cloneOf(io.input)
  cmdStreamWithSize.translateFrom(io.input) { (to, from) =>
    to.addr := startAddress
    if (inputConfig.useSize) to.size := sizePerTrans
    to.assignUnassignedByName(from)
  }
  val size = RegNextWhen(sizePerTrans, io.input.fire) init sizeMaxOut

  val cmdExtendedStream = cloneOf(io.input)
  val cmdExtender       = StreamTransactionExtender(cmdStreamWithSize, cmdExtendedStream, ratio) {
    (id, p, _) => p
  }

  // ── Burst type support ────────────────────────────────────────────────────
  // When useBurst=true, capture the burst type and compute WRAP mask on
  // io.input.fire so they're stable during sub-transaction generation.
  // When useBurst=false, the else branches compile to pure INCR (no muxes).
  private val hasBurst = inputConfig.useBurst

  val burstTypeReg = if (hasBurst) RegNextWhen(io.input.burst, io.input.fire) init B"01" else null
  val startAddrReg = if (hasBurst) RegNextWhen(startAddress, io.input.fire) init U(0) else null
  val wrapMaskReg  = if (hasBurst) {
    val reg = Reg(UInt(inputConfig.addressWidth bits)) init 0
    when(io.input.fire) {
      // WRAP len is always 1,3,7,15 → len+1 is power of 2
      val lenP1    = if (inputConfig.useLen) (io.input.len +^ U(1)).resize(9) else U(1, 9 bits)
      val wrapSize = (lenP1 << sizeIn).resize(inputConfig.addressWidth)
      reg := (wrapSize - 1).resize(inputConfig.addressWidth)
    }
    reg
  } else null

  val address = RegInit(U(0, io.input.addr.getWidth bits))
  when(cmdStreamWithSize.fire) {
    address := cmdStreamWithSize.addr
  } elsewhen (cmdExtendedStream.fire) {
    if (hasBurst) {
      val incrStride  = ((cmdExtendedStream.len +^ 1) << size).resized
      val fixedStride = (U(1) << size).resized
      when(burstTypeReg === B"00") {         // FIXED — byte lane offset only
        address := address + fixedStride
      } elsewhen (burstTypeReg === B"10") {  // WRAP — INCR with wrap-around
        val nextAddr = (address + incrStride).resize(inputConfig.addressWidth)
        val wrapBase = startAddrReg & ~wrapMaskReg
        address := wrapBase | (nextAddr & wrapMaskReg)
      } otherwise {                          // INCR (01) or RESERVED (11)
        address := address + incrStride
      }
    } else {
      address := address + ((cmdExtendedStream.len +^ 1) << size).resized
    }
  }

  val cmdStream = cloneOf(io.input)
  cmdStream.translateFrom(cmdExtendedStream) { (to, from) =>
    to.addr := address
    to.assignUnassignedByName(from)
  }

  val dataRatio = RegNextWhen(ratio, io.input.fire) init 0
  when(io.input.fire) {
    io.ratio := ratio
    io.size  := sizePerTrans
  } otherwise {
    io.ratio := dataRatio
    io.size  := size
  }

  io.working := cmdExtender.io.working
  io.last    := cmdExtender.io.last
  io.done    := cmdExtender.io.done
  io.start   := startAddress
  io.output  << cmdStream

  def formalAsserts() = new Composite(this, "asserts") {
    def ratio2size(x: UInt): UInt = {
      OHToUInt(OHMasking.first(x + 1))
    }

    val alignRange = 12 until inputConfig.addressWidth
    val cmdAddress = address
    val cmdWidth   = size + ratio2size(cmdExtender.counter.expected)
    val cmdBoundAddress =
      cmdAddress + (((cmdExtendedStream.len +^ 1) << cmdWidth) - 1).resized
    when(cmdExtender.counter.working & cmdExtender.counter.io.value === 0) {
      assert(cmdAddress(alignRange) === cmdBoundAddress(alignRange))
    }
  }
}

// ---------------------------------------------------------------------------
// Write-only downsizer (FIXED/INCR/WRAP burst, with ID support)
// ---------------------------------------------------------------------------
case class Axi4WriteOnlyDownsizerExt(
    inputConfig:  Axi4Config,
    outputConfig: Axi4Config,
    rspDepth:     Int = 2
) extends Component {

  val io = new Bundle {
    val input  = slave(Axi4WriteOnly(inputConfig))
    val output = master(Axi4WriteOnly(outputConfig))
  }

  val sizeMaxOut = log2Up(outputConfig.bytePerWord)
  val sizeMaxIn  = log2Up(inputConfig.bytePerWord)

  val writeStream = cloneOf(io.output)
  val dataWorking = Bool()
  val writeCmd    = io.input.writeCmd.haltWhen(dataWorking)
  val cmdStream   = cloneOf(writeCmd)
  val generator   = Axi4DownsizerExtSubTransactionGenerator(
    writeCmd, cmdStream, inputConfig, outputConfig)

  val staleInputData   = Bool()
  val writeData        = io.input.writeData.haltWhen(staleInputData)
  val inputDataCounter = StreamTransactionCounter(writeCmd, writeData, writeCmd.len, true)
  staleInputData := !inputDataCounter.io.working

  val (rspCountStream, countCmdStream, outCmdStream) = StreamFork3(cmdStream)
  writeStream.writeCmd << outCmdStream

  val dataStream    = cloneOf(writeData)
  val streamCounter = StreamTransactionCounter(
    countCmdStream, dataStream, countCmdStream.len, true)
  countCmdStream.ready := streamCounter.io.available

  val beatOffsetReg = RegNextWhen(
    countCmdStream.addr(inputConfig.symbolRange), countCmdStream.fire)
  val beatOffset = CombInit(beatOffsetReg)
  when(countCmdStream.fire) {
    beatOffset := countCmdStream.addr(inputConfig.symbolRange)
  }
  when(dataStream.fire) {
    beatOffsetReg := (beatOffset + (1 << generator.io.size)).resized
  }

  val offset = beatOffset & ~U((1 << sizeMaxOut) - 1, sizeMaxIn bits)
  val dataExtender = StreamTransactionExtender(writeData, dataStream, generator.io.ratio) {
    (id, p, last) =>
      val out = cloneOf(p)
      if (outputConfig.useLast) out.last := last && p.last
      out.assignUnassignedByName(p)
      out
  }
  dataWorking := !inputDataCounter.io.available || !writeData.ready

  val staleData = !streamCounter.io.working
  writeStream.writeData.translateFrom(dataStream.haltWhen(staleData)) { (to, from) =>
    to.data := from.data(offset << 3, outputConfig.dataWidth bits)
    if (outputConfig.useLast) to.last := streamCounter.io.last
    if (outputConfig.useStrb) to.strb := from.strb(offset, outputConfig.bytePerWord bits)
    to.assignUnassignedByName(from)
  }

  val rspCtrlStream = Stream(Bool())
  rspCtrlStream.translateFrom(rspCountStream) { (to, from) =>
    to := generator.io.last
  }
  val rspStream = StreamJoin(rspCtrlStream.queue(rspDepth), writeStream.writeRsp)
  io.input.writeRsp.translateFrom(rspStream.throwWhen(!rspStream._1)) { (to, from) =>
    to := from._2
  }

  io.output << writeStream
}

// ---------------------------------------------------------------------------
// Read-only downsizer (FIXED/INCR/WRAP burst, with ID support)
// ---------------------------------------------------------------------------
case class Axi4ReadOnlyDownsizerExt(
    inputConfig:  Axi4Config,
    outputConfig: Axi4Config
) extends Component {

  val io = new Bundle {
    val input  = slave(Axi4ReadOnly(inputConfig))
    val output = master(Axi4ReadOnly(outputConfig))
  }

  val sizeMaxOut = log2Up(outputConfig.bytePerWord)
  val sizeMaxIn  = log2Up(inputConfig.bytePerWord)

  val readCmd                    = io.input.readCmd
  val (readCmdGen, readCmdCount) = StreamFork2(readCmd, true)

  val cmdStream = cloneOf(readCmd)
  val generator = Axi4DownsizerExtSubTransactionGenerator(
    readCmdGen, cmdStream, inputConfig, outputConfig)
  io.output.readCmd << cmdStream

  val cmdState = new Bundle {
    val ratio = cloneOf(generator.io.ratio)
    val size  = cloneOf(generator.io.size)
    val len   = cloneOf(readCmdCount.len)
    val start = cloneOf(generator.io.start)
  }

  val countCmdStream = Stream(cmdState)
  countCmdStream.translateFrom(readCmdCount) { (to, from) =>
    to.ratio := generator.io.ratio
    to.size  := generator.io.size
    to.len   := readCmdCount.len
    to.start := generator.io.start
  }
  val countOutStream = Stream(cmdState)
  val dataOutCounter = StreamTransactionExtender(
    countCmdStream, countOutStream, countCmdStream.len) { (_, p, last) => p }

  val dataIn      = io.output.readRsp
  val countStream = Stream(cmdState)
  val dataCounter = StreamTransactionExtender(
    countOutStream, countStream, countOutStream.ratio) { (_, p, _) => p }
  countStream.ready := dataIn.fire

  val dataReg    = Reg(Bits(inputConfig.dataWidth bits)) init (0)
  val beatOffset = RegInit(U(0, sizeMaxIn bits))
  when(countOutStream.fire && dataOutCounter.io.first) {
    beatOffset := countOutStream.start(inputConfig.symbolRange)
  } elsewhen (dataIn.fire) {
    beatOffset := (beatOffset + (1 << countStream.size)).resized
  }

  val offset = beatOffset & ~U((1 << sizeMaxOut) - 1, sizeMaxIn bits)
  when(dataIn.valid) {
    dataReg(offset << 3, outputConfig.dataWidth bits) := dataIn.data
  }
  val dataOut = cloneOf(io.input.readRsp)

  val lastLast = RegInit(False)
  when(dataOutCounter.io.working && dataOutCounter.io.last && countOutStream.fire) {
    lastLast := True
  } elsewhen (dataCounter.io.last && dataIn.fire) {
    lastLast := False
  }
  dataOut.translateFrom(dataIn.throwWhen(!dataCounter.io.last)) { (to, from) =>
    to.data := dataReg.getAheadValue().addAttribute("nowrshmsk")
    if (inputConfig.useLast) to.last := from.last && lastLast
    to.assignUnassignedByName(from)
  }
  io.input.readRsp << dataOut

  def formalAsserts() = new Composite(this, "asserts") {
    val cmdCounter   = generator.cmdExtender.counter
    val cmdChecker   = cmdCounter.formalAsserts()
    val lenCounter   = dataOutCounter.counter
    val lenChecker   = lenCounter.formalAsserts()
    val ratioCounter = dataCounter.counter
    val ratioChecker = ratioCounter.formalAsserts()

    val generatorChecker = generator.formalAsserts()

    when(lenChecker.startedReg) {
      assert(countStream.payload === countOutStream.payload)
    }
    when(lenCounter.working & countOutStream.ratio > 0) {
      assert(countOutStream.size === sizeMaxOut)
    }
    when(ratioCounter.working & countStream.ratio > 0) {
      assert(countStream.size === sizeMaxOut)
    }
    when(lenCounter.working) {
      assert(countOutStream.size  === cmdStream.size)
      assert(countOutStream.len   === cmdStream.len)
      assert(countOutStream.ratio === cmdCounter.expected)
    }

    def ratio2size(x: UInt): UInt = {
      OHToUInt(OHMasking.first(x + 1))
    }
    val addrLowWidth = countOutStream.size + ratio2size(countOutStream.ratio)
    val addrMask     = (U(1) << addrLowWidth - 1)
    when(lenCounter.working & addrLowWidth === sizeMaxIn) {
      assert((countOutStream.start & addrMask.resized) === 0)
    }
  }
}

// ---------------------------------------------------------------------------
// Combined read+write downsizer (drop-in replacement for Axi4Downsizer)
// ---------------------------------------------------------------------------
case class Axi4DownsizerExt(
    inputConfig:  Axi4Config,
    outputConfig: Axi4Config,
    rspDepth:     Int = 2
) extends Component {

  val io = new Bundle {
    val input  = slave(Axi4(inputConfig))
    val output = master(Axi4(outputConfig))
  }

  val readOnly  = Axi4ReadOnlyDownsizerExt(inputConfig, outputConfig)
  val writeOnly = Axi4WriteOnlyDownsizerExt(inputConfig, outputConfig, rspDepth)

  readOnly.io.input.ar  <> io.input.ar
  readOnly.io.input.r   <> io.input.r
  writeOnly.io.input.aw <> io.input.aw
  writeOnly.io.input.w  <> io.input.w
  writeOnly.io.input.b  <> io.input.b

  readOnly.io.output.ar  <> io.output.ar
  readOnly.io.output.r   <> io.output.r
  writeOnly.io.output.aw <> io.output.aw
  writeOnly.io.output.w  <> io.output.w
  writeOnly.io.output.b  <> io.output.b

  // Simulation assertion: reject reserved burst type 0b11
  if (inputConfig.useBurst) {
    when(io.input.aw.valid && io.input.aw.burst === B"11") {
      report(Seq("Axi4DownsizerExt: RESERVED burst type (0b11) on AW channel"), FAILURE)
    }
    when(io.input.ar.valid && io.input.ar.burst === B"11") {
      report(Seq("Axi4DownsizerExt: RESERVED burst type (0b11) on AR channel"), FAILURE)
    }
  }
}
