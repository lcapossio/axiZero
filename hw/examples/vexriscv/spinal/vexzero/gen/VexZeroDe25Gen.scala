// Copyright (c) 2026 Leonardo Capossio — bard0 design  hello@bard0.com
// SPDX-License-Identifier: MIT
package vexzero.gen

import spinal.core._
import vexzero.{VexZeroBenchDe25, VexZeroDe25}

// ---------------------------------------------------------------------------
// VexZeroDe25Gen / VexZeroBenchDe25Gen  —  netlists for the DE25-Nano
//
//   sbt "vexZero/Compile/runMain vexzero.gen.VexZeroDe25Gen"
//   sbt "vexZero/Compile/runMain vexzero.gen.VexZeroBenchDe25Gen"
//
// Output: generated/vexriscv/VexZeroDe25.v, VexZeroBenchDe25.v
//
// Both instantiate fpgacapZero's JTAG-to-AXI bridge as a black box, so the
// Quartus project has to compile the bridge's own sources alongside the
// netlist; the build script takes that list from JtagAxiMaster.rtlFiles rather
// than repeating it.
//
// The firmware is inlined into the netlist exactly as it is for the Arty, so
// the bitstream carries the program and there is nothing to download before
// the board starts running.
// ---------------------------------------------------------------------------
private object De25Config {

  def apply(netlist: String): SpinalConfig = SpinalConfig(
    targetDirectory = "generated/vexriscv",
    netlistFileName = netlist,
    inlineRom = true,
    defaultConfigForClockDomains = ClockDomainConfig(
      clockEdge = RISING,
      resetKind = SYNC,
      resetActiveLevel = LOW
    )
  )

  def finish(netlist: String, generator: String): Unit = {
    val path = s"generated/vexriscv/$netlist"
    axizero.gen.GenHelper.prependCopyright(java.nio.file.Paths.get(path))
    println(s"[$generator] Done -> $path")
  }
}

object VexZeroDe25Gen extends App {
  private val netlist = "VexZeroDe25.v"
  De25Config(netlist).generateVerilog(new VexZeroDe25())
  De25Config.finish(netlist, "VexZeroDe25Gen")
}

object VexZeroBenchDe25Gen extends App {
  private val netlist = "VexZeroBenchDe25.v"
  De25Config(netlist).generateVerilog(new VexZeroBenchDe25())
  De25Config.finish(netlist, "VexZeroBenchDe25Gen")
}
