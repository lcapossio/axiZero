// Copyright (c) 2026 Leonardo Capossio — bard0 design  hello@bard0.com
// SPDX-License-Identifier: MIT
package vexzero.gen

import spinal.core._
import vexzero.VexZeroArty

// ---------------------------------------------------------------------------
// VexZeroArtyGen  —  emit VexZeroArty.v for the Arty A7-100T hardware test
//
//   sbt "vexZero/Compile/runMain vexzero.gen.VexZeroArtyGen"
//
// Output: generated/vexriscv/VexZeroArty.v
//
// inlineRom writes the RAM's boot image and the register file into the
// netlist instead of emitting $readmemb side files. One self-contained
// Verilog file is far easier to hand to Vivado, which otherwise has to be
// told where to find the .bin files at both synthesis and simulation time.
//
// The netlist is not tracked: it is a build product of the VexRiscv submodule
// plus this example.
// ---------------------------------------------------------------------------
object VexZeroArtyGen extends App {

  private val outputDir = "generated/vexriscv"

  SpinalConfig(
    targetDirectory = outputDir,
    netlistFileName = "VexZeroArty.v",
    inlineRom = true,
    defaultConfigForClockDomains = ClockDomainConfig(
      clockEdge = RISING,
      resetKind = SYNC,
      resetActiveLevel = LOW
    )
  ).generateVerilog(new VexZeroArty())

  axizero.gen.GenHelper.prependCopyright(
    java.nio.file.Paths.get(s"$outputDir/VexZeroArty.v")
  )
  println(s"[VexZeroArtyGen] Done -> $outputDir/VexZeroArty.v")
}
