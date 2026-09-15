// Copyright (c) 2026 Leonardo Capossio — bard0 design  hello@bard0.com
// SPDX-License-Identifier: MIT
package vexzero.gen

import spinal.core._
import vexzero.{VexZeroArty, VexZeroDe25, VexZeroStress}

// ---------------------------------------------------------------------------
// VexZeroStressArtyGen / VexZeroStressDe25Gen  —  the loaded builds
//
//   sbt "vexZero/runMain vexzero.gen.VexZeroStressArtyGen"          ;# all four
//   sbt "vexZero/runMain vexzero.gen.VexZeroStressArtyGen qos"      ;# just one
//   sbt "vexZero/runMain vexzero.gen.VexZeroStressDe25Gen"
//
// Output: generated/vexriscv/VexZeroStress{Arty,De25}_<policy>.v
//
// These are the VexRiscv replacements for the retired MicroBlaze wrr, qos,
// qos_stress, axi3 and axis Arty suites. One SoC, one board wrapper and four
// configurations, and — because nothing in any of them is vendor-specific —
// the same four build for Quartus as for Vivado. See [[VexZeroStress]] for
// what each variant is meant to demonstrate and why the configurations live
// there rather than here.
//
// Each netlist gets its own module name so that several can sit in one Vivado
// or Quartus workspace without colliding, and so a bitstream on a board can be
// identified from the report alone.
//
// inlineRom writes the RAM's boot image into the netlist rather than emitting
// $readmemb side files, so the one Verilog file is the whole design.
// ---------------------------------------------------------------------------
private object StressGen {

  val outputDir = "generated/vexriscv"

  def spinalConfig(netlist: String): SpinalConfig = SpinalConfig(
    targetDirectory = outputDir,
    netlistFileName = s"$netlist.v",
    inlineRom = true,
    defaultConfigForClockDomains = ClockDomainConfig(
      clockEdge = RISING,
      resetKind = SYNC,
      resetActiveLevel = LOW
    )
  )

  /** Which policies to build, from the command line, defaulting to every one of them. */
  def selected(args: Array[String]): Seq[VexZeroStress.Policy] =
    if (args.isEmpty) VexZeroStress.policies else args.toSeq.map(VexZeroStress.policyOf)

  def emit(netlist: String, gen: => Component, label: String): Unit = {
    spinalConfig(netlist).generateVerilog {
      val top = gen
      top.setDefinitionName(netlist)
      top
    }
    axizero.gen.GenHelper.prependCopyright(
      java.nio.file.Paths.get(s"$outputDir/$netlist.v")
    )
    println(s"[$label] Done -> $outputDir/$netlist.v")
  }
}

/** The Arty A7-100T builds. The board reports over its USB-UART, so no host master port. */
object VexZeroStressArtyGen extends App {
  for (policy <- StressGen.selected(args)) {
    StressGen.emit(
      s"VexZeroStressArty_${policy.name}",
      new VexZeroArty(socConfig = VexZeroStress.socConfig(policy)),
      "VexZeroStressArtyGen"
    )
  }
}

/** The DE25-Nano builds. The board has no UART, so the host reads the verdict back over the debug
  * cable and the SoC needs the extra master port for it.
  */
object VexZeroStressDe25Gen extends App {
  for (policy <- StressGen.selected(args)) {
    StressGen.emit(
      s"VexZeroStressDe25_${policy.name}",
      new VexZeroDe25(socConfig = VexZeroStress.socConfig(policy, hostMaster = true)),
      "VexZeroStressDe25Gen"
    )
  }
}
