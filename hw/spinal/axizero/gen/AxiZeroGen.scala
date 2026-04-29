// Copyright (c) 2026 Leonardo Capossio — bard0 design  hello@bard0.com
// SPDX-License-Identifier: MIT
package axizero.gen

import spinal.core._
import axizero._

// ---------------------------------------------------------------------------
// AxiZeroGen — Verilog generation entry point
//
//   sbt "runMain axizero.gen.AxiZeroGen"
//
// Generates Verilog in generated/ for every example configuration below.
// ---------------------------------------------------------------------------
object AxiZeroGen extends App {

  // ── Primary example: 1 master × 4 slaves, AXI4-Lite ─────────────────────
  //
  // Address map (32-bit, 4 KB each):
  //   Slave 0  SRAM        0x0000_0000 – 0x0000_0FFF
  //   Slave 1  UART regs   0x0001_0000 – 0x0001_0FFF
  //   Slave 2  GPIO regs   0x0002_0000 – 0x0002_0FFF
  //   Slave 3  SPI regs    0x0003_0000 – 0x0003_0FFF
  val lite1M4S = AxiZeroConfig.allLite(
    numMasters = 1,
    numSlaves = 4,
    addrWidth = 32,
    dataWidth = 32,
    addressMap = Seq(
      BigInt("00000000", 16) -> BigInt("00001000", 16),
      BigInt("00010000", 16) -> BigInt("00001000", 16),
      BigInt("00020000", 16) -> BigInt("00001000", 16),
      BigInt("00030000", 16) -> BigInt("00001000", 16)
    ),
    arbitration = RoundRobin
  )
  GenHelper.liteCrossbar(lite1M4S, "AxiZeroLite_1M4S")

  // ── 2 masters × 4 slaves, AXI4-Lite, with register slices ───────────────
  val lite2M4S_RS = AxiZeroConfig.allLite(
    numMasters = 2,
    numSlaves = 4,
    addrWidth = 32,
    dataWidth = 32,
    addressMap = Seq(
      BigInt("00000000", 16) -> BigInt("00010000", 16),
      BigInt("00010000", 16) -> BigInt("00010000", 16),
      BigInt("00020000", 16) -> BigInt("00010000", 16),
      BigInt("00030000", 16) -> BigInt("00010000", 16)
    ),
    arbitration = RoundRobin,
    masterRegSlices = true,
    slaveRegSlices = true
  )
  GenHelper.liteCrossbar(lite2M4S_RS, "AxiZeroLite_2M4S_RS")

  // ── 4 masters × 4 slaves, AXI4-Lite, fixed priority ─────────────────────
  val lite4M4S_FP = AxiZeroConfig.allLite(
    numMasters = 4,
    numSlaves = 4,
    addrWidth = 32,
    dataWidth = 32,
    addressMap = Seq(
      BigInt("00000000", 16) -> BigInt("00010000", 16),
      BigInt("00010000", 16) -> BigInt("00010000", 16),
      BigInt("00020000", 16) -> BigInt("00010000", 16),
      BigInt("00030000", 16) -> BigInt("00010000", 16)
    ),
    arbitration = FixedPriority
  )
  GenHelper.liteCrossbar(lite4M4S_FP, "AxiZeroLite_4M4S_FP")
}

// ---------------------------------------------------------------------------
object GenHelper {

  private val COPYRIGHT =
    "// Copyright (c) 2026 Leonardo Capossio - bard0 design  hello@bard0.com\n" +
      "// SPDX-License-Identifier: MIT\n"

  private def spinalCfg(name: String) =
    SpinalConfig(
      targetDirectory = "generated",
      netlistFileName = s"$name.v",
      defaultConfigForClockDomains = ClockDomainConfig(
        clockEdge = RISING,
        resetKind = SYNC,
        resetActiveLevel = LOW
      )
    )

  def prependCopyright(path: java.nio.file.Path): Unit = {
    val existing = java.nio.file.Files.readString(path)
    if (!existing.startsWith("// Copyright"))
      java.nio.file.Files.writeString(path, COPYRIGHT + existing)
  }

  def liteCrossbar(cfg: AxiZeroConfig, name: String): Unit = {
    println(s"\n[axiZero] Generating $name ...")
    val report = spinalCfg(name).generateVerilog(new AxiZeroLiteTop(cfg))
    prependCopyright(java.nio.file.Paths.get("generated", s"$name.v"))
    println(s"[axiZero] Done → generated/$name.v")
  }

  def fullCrossbar(cfg: AxiZeroConfig, name: String): Unit =
    mixedCrossbar(cfg, name)

  // Use this for full-AXI4 and mixed (Full + Lite) configurations.
  def mixedCrossbar(cfg: AxiZeroConfig, name: String): Unit = {
    println(s"\n[axiZero] Generating $name ...")
    spinalCfg(name).generateVerilog(new AxiZeroMixedTop(cfg))
    prependCopyright(java.nio.file.Paths.get("generated", s"$name.v"))
    println(s"[axiZero] Done → generated/$name.v")
  }
}
