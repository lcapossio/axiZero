// Copyright (c) 2026 Leonardo Capossio — bard0 design  hello@bard0.com
// SPDX-License-Identifier: MIT
package vexzero.gen

import spinal.core._
import vexzero.{VexZeroSoc, VexZeroSocConfig}

// ---------------------------------------------------------------------------
// VexZeroSocGen  —  emit VexZeroSoc.v
//
//   sbt "vexZero/runMain vexzero.gen.VexZeroSocGen"
//
// Output: generated/vexriscv/VexZeroSoc.v
//
// The netlist is not tracked; it is a build product of the VexRiscv submodule
// plus this example, and `scripts/check_generated.py` does not cover it.
// ---------------------------------------------------------------------------
object VexZeroSocGen extends App {

  private val outputDir = "generated/vexriscv"

  SpinalConfig(
    targetDirectory = outputDir,
    netlistFileName = "VexZeroSoc.v",
    defaultConfigForClockDomains = ClockDomainConfig(
      clockEdge = RISING,
      resetKind = SYNC,
      resetActiveLevel = LOW
    )
  ).generateVerilog(new VexZeroSoc(VexZeroSocConfig()))

  println(s"[VexZeroSocGen] Done -> $outputDir/VexZeroSoc.v")
}
