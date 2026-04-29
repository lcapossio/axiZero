// Copyright (c) 2026 Leonardo Capossio - bard0 design  hello@bard0.com
// SPDX-License-Identifier: MIT
package axizero.stream

import spinal.core._
import spinal.lib._
import spinal.lib.bus.amba4.axis._

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
  require(
    inputConfig.dataWidth % 8 == 0 && outputConfig.dataWidth % 8 == 0,
    "AXI4-Stream data widths must be byte-aligned"
  )

  val io = new Bundle {
    val input  = slave(Axi4Stream(inputConfig))
    val output = master(Axi4Stream(outputConfig))
  }

  Axi4StreamSimpleWidthAdapter(io.input, io.output)
}
