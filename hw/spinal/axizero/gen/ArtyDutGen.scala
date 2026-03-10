// Copyright (c) 2026 Leonardo Capossio — bard0 design  hello@bard0.com
// SPDX-License-Identifier: MIT
package axizero.gen

import spinal.core._
import spinal.lib.bus.amba4.axi.Axi4Config
import axizero._

// ---------------------------------------------------------------------------
// ArtyDutGen  —  generates AxiZeroArtyDUT.v for the Arty A7-100T hardware test
//
//   sbt "runMain axizero.gen.ArtyDutGen"
//
// Output: hw/vivado/arty_a7/ip/rtl/AxiZeroArtyDUT.v
//
// System topology (1 master × 4 slaves, mixed AXI4 / AXI4-Lite):
//
//   Master 0  ──  MicroBlaze M_AXI_DP  (AXI4-Full, idW=1)
//
//   Slave 0   ──  AXI BRAM Ctrl 0      (Full,  64 KB, 0xC000_0000)
//   Slave 1   ──  AXI BRAM Ctrl 1      (Full,  64 KB, 0xC001_0000)
//   Slave 2   ──  AXI GPIO             (Lite,   4 KB, 0xC002_0000)
//   Slave 3   ──  AXI UART Lite        (Lite,   4 KB, 0xC003_0000)
//
// Notes
// ─────
//   • 1 master → masterIndexBits = log2Up(1) = 0 → slaveIdW = masterIdW = 1
//   • maxOutstanding = 4 selects the pipelined crossbar path
//   • Lite slaves use the built-in Full→Lite adapter inside AxiZeroMixedTop
// ---------------------------------------------------------------------------
object ArtyDutGen extends App {

  // ── Master config: MicroBlaze M_AXI_DP ─────────────────────────────────
  // Standard MicroBlaze AXI4-Full data peripheral port.
  // C_M_AXI_DP_THREAD_ID_WIDTH defaults to 1 in Vivado.
  val masterCfg = Axi4Config(addressWidth = 32, dataWidth = 32, idWidth = 1)

  // ── Full AXI4 slave config (BRAM controllers) ───────────────────────────
  // 1 master → masterIndexBits=0 → slaveIdW = masterIdW = 1
  val fullSlaveCfg = Axi4Config(addressWidth = 32, dataWidth = 32, idWidth = 1)

  // ── AXI4-Lite slave config (GPIO, UART) ────────────────────────────────
  val liteSlaveCfg = Axi4Config(
    addressWidth = 32,
    dataWidth    = 32,
    useId        = false,
    useRegion    = false,
    useBurst     = false,
    useLock      = false,
    useCache     = false,
    useSize      = false,
    useQos       = false,
    useLen       = false,
    useLast      = false,
    useResp      = true,
    useProt      = true,
    useStrb      = true
  )

  val cfg = AxiZeroConfig(
    masters = Seq(
      MasterPort(masterCfg, FullAxi4)
    ),
    slaves = Seq(
      SlavePort(fullSlaveCfg, FullAxi4, BigInt("C0000000", 16), BigInt("00010000", 16)),  // BRAM #0 64 KB
      SlavePort(fullSlaveCfg, FullAxi4, BigInt("C0010000", 16), BigInt("00010000", 16)),  // BRAM #1 64 KB
      SlavePort(liteSlaveCfg, LiteAxi4, BigInt("C0020000", 16), BigInt("00001000", 16)),  // GPIO 4 KB
      SlavePort(liteSlaveCfg, LiteAxi4, BigInt("C0030000", 16), BigInt("00001000", 16))   // UART Lite 4 KB
    ),
    arbitration    = RoundRobin,
    maxOutstanding = 4
  )

  SpinalConfig(
    targetDirectory = "hw/vivado/arty_a7/ip/rtl",
    netlistFileName = "AxiZeroArtyDUT.v",
    defaultConfigForClockDomains = ClockDomainConfig(
      clockEdge        = RISING,
      resetKind        = SYNC,
      resetActiveLevel = LOW
    )
  ).generateVerilog(new AxiZeroMixedTop(cfg))

  println("[ArtyDutGen] Done → hw/vivado/arty_a7/ip/rtl/AxiZeroArtyDUT.v")
}
