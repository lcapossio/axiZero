// Copyright (c) 2026 Leonardo Capossio - bard0 design  hello@bard0.com
// SPDX-License-Identifier: MIT
package axizero.stream

import spinal.core._
import spinal.lib._
import spinal.lib.bus.amba4.axis._

sealed trait AxiStreamArbitrationPolicy
case object AxisRoundRobin    extends AxiStreamArbitrationPolicy
case object AxisFixedPriority extends AxiStreamArbitrationPolicy

/** One-stage AXI4-Stream register slice.
  *
  * This is the streaming equivalent of the memory-mapped AXI register slices: it preserves payload
  * sideband fields while registering the ready/valid path for timing closure.
  */
class AxiStreamRegSlice(config: Axi4StreamConfig) extends Component {
  val io = new Bundle {
    val input  = slave(Axi4Stream(config))
    val output = master(Axi4Stream(config))
  }

  io.output << io.input.stage()
}

/** AXI4-Stream data-width adapter wrapper.
  *
  * Delegates packing/unpacking to SpinalHDL's native AXI4-Stream width adapter while keeping
  * axiZero's stream cores under one package/API.
  */
class AxiStreamWidthAdapter(
  inputConfig: Axi4StreamConfig,
  outputConfig: Axi4StreamConfig
) extends Component {
  require(inputConfig.dataWidth > 0, "inputConfig.dataWidth must be positive")
  require(outputConfig.dataWidth > 0, "outputConfig.dataWidth must be positive")

  val io = new Bundle {
    val input  = slave(Axi4Stream(inputConfig))
    val output = master(Axi4Stream(outputConfig))
  }

  Axi4StreamSimpleWidthAdapter(io.input, io.output)
}

/** AXI4-Stream elastic FIFO.
  *
  * Stores complete stream beats, including all enabled sideband fields. TLAST is carried as part of
  * the payload, so frame boundaries are preserved without special handling.
  */
class AxiStreamFifo(config: Axi4StreamConfig, depth: Int) extends Component {
  require(depth >= 2, "AxiStreamFifo depth must be at least 2")

  val io = new Bundle {
    val input  = slave(Axi4Stream(config))
    val output = master(Axi4Stream(config))
  }

  io.output << io.input.queue(depth)
}

/** N-to-1 AXI4-Stream packet arbiter/mux.
  *
  * Arbitration happens at frame boundaries. Once an input wins, it keeps ownership until the beat
  * marked with TLAST transfers, preventing packets from different inputs from interleaving.
  */
class AxiStreamArbMux(
  config: Axi4StreamConfig,
  inputCount: Int,
  arbitration: AxiStreamArbitrationPolicy = AxisRoundRobin
) extends Component {
  require(inputCount >= 1, "AxiStreamArbMux requires at least one input")
  require(config.useLast, "AxiStreamArbMux requires TLAST so packet ownership can be locked")

  private val ptrWidth = log2Up(inputCount max 2)

  val io = new Bundle {
    val inputs = Vec(slave(Axi4Stream(config)), inputCount)
    val output = master(Axi4Stream(config))
  }

  private def firstOh(requests: Bits): Bits = OHMasking.first(requests)

  private def roundRobinOh(requests: Bits, ptr: UInt): Bits = {
    val maskLow = Bits(inputCount bits)
    maskLow := B(0, inputCount bits)
    for (i <- 1 until inputCount) {
      when(ptr >= U(i, ptrWidth bits)) {
        maskLow := B((BigInt(1) << i) - 1, inputCount bits)
      }
    }
    val masked = requests & ~maskLow
    Mux(masked.orR, OHMasking.first(masked), OHMasking.first(requests))
  }

  private def ohToIdx(oh: Bits): UInt = {
    val idx = UInt(ptrWidth bits)
    idx := 0
    for (i <- 0 until inputCount) {
      when(oh(i)) {
        idx := i
      }
    }
    idx
  }

  val rrPtr  = RegInit(U(0, ptrWidth bits))
  val active = RegInit(False)
  val owner  = RegInit(U(0, ptrWidth bits))

  val requests = Bits(inputCount bits)
  for (i <- 0 until inputCount) {
    requests(i)        := io.inputs(i).valid
    io.inputs(i).ready := False
  }

  val grantOh = arbitration match {
    case AxisRoundRobin    => roundRobinOh(requests, rrPtr)
    case AxisFixedPriority => firstOh(requests)
  }
  val grantIdx = ohToIdx(grantOh)
  val selIdx   = UInt(ptrWidth bits)
  selIdx := Mux(active, owner, grantIdx)

  io.output.valid := False
  io.output.payload.clearAll()

  for (i <- 0 until inputCount) {
    when(selIdx === i) {
      io.output.valid    := io.inputs(i).valid
      io.output.payload  := io.inputs(i).payload
      io.inputs(i).ready := io.output.ready
    }
  }

  when(!active && io.output.fire) {
    owner := grantIdx
    when(!io.output.last) {
      active := True
    }
    arbitration match {
      case AxisRoundRobin =>
        rrPtr := (grantIdx + 1).resized
      case AxisFixedPriority =>
    }
  } elsewhen (active && io.output.fire && io.output.last) {
    active := False
  }
}

/** 1-to-N AXI4-Stream broadcaster.
  *
  * Each input beat is accepted only when every output has accepted that beat, so all downstream
  * consumers see identical packet contents and boundaries.
  */
class AxiStreamBroadcaster(config: Axi4StreamConfig, outputCount: Int) extends Component {
  require(outputCount >= 1, "AxiStreamBroadcaster requires at least one output")

  val io = new Bundle {
    val input   = slave(Axi4Stream(config))
    val outputs = Vec(master(Axi4Stream(config)), outputCount)
  }

  val forks = StreamFork(io.input, outputCount, synchronous = true)
  for (i <- 0 until outputCount) {
    io.outputs(i) << forks(i)
  }
}
