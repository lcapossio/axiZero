// Copyright (c) 2026 Leonardo Capossio — bard0 design  hello@bard0.com
// SPDX-License-Identifier: MIT
package vexzero.gen

import spinal.core._
import vexzero.VexZeroBenchArty

// ---------------------------------------------------------------------------
// VexZeroBenchArtyGen  —  emit VexZeroBenchArty.v for the Arty A7-100T
//
//   sbt "vexZero/Compile/runMain vexzero.gen.VexZeroBenchArtyGen"
//
// Output: generated/vexriscv/VexZeroBenchArty.v
//
// The benchmark binary is read from the VexRiscv submodule at elaboration and
// inlined into the netlist, so the bitstream carries the program: there is no
// loader, no side file for Vivado to find, and nothing to download before the
// board starts running.
// ---------------------------------------------------------------------------
object VexZeroBenchArtyGen extends App {

  private val outputDir = "generated/vexriscv"

  SpinalConfig(
    targetDirectory = outputDir,
    netlistFileName = "VexZeroBenchArty.v",
    inlineRom = true,
    defaultConfigForClockDomains = ClockDomainConfig(
      clockEdge = RISING,
      resetKind = SYNC,
      resetActiveLevel = LOW
    )
  ).generateVerilog(new VexZeroBenchArty())

  axizero.gen.GenHelper.prependCopyright(
    java.nio.file.Paths.get(s"$outputDir/VexZeroBenchArty.v")
  )
  println(s"[VexZeroBenchArtyGen] Done -> $outputDir/VexZeroBenchArty.v")
}
