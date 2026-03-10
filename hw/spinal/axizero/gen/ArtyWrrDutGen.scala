// Copyright (c) 2026 Leonardo Capossio — bard0 design  hello@bard0.com
// SPDX-License-Identifier: MIT
package axizero.gen

import spinal.core._
import spinal.lib.bus.amba4.axi.Axi4Config
import axizero._

// ---------------------------------------------------------------------------
// ArtyWrrDutGen  —  generates AxiZeroArtyWrrDUT.v for the WRR hardware test
//
//   sbt "runMain axizero.gen.ArtyWrrDutGen"
//
// Output: hw/vivado/arty_a7/ip/rtl/AxiZeroArtyWrrDUT.v
//
// System topology (2 masters × 4 slaves, WRR weights [3, 1]):
//
//   Master 0  ──  MicroBlaze M_AXI_DP  (AXI4-Full, idW=1, weight=3)
//   Master 1  ──  AXI Traffic Gen      (AXI4-Lite,        weight=1)
//
//   Slave 0   ──  AXI BRAM Ctrl 0      (Full,  64 KB, 0xC000_0000)
//   Slave 1   ──  AXI BRAM Ctrl 1      (Full,  64 KB, 0xC001_0000)
//   Slave 2   ──  AXI GPIO             (Lite,   4 KB, 0xC002_0000)
//   Slave 3   ──  AXI UART Lite        (Lite,   4 KB, 0xC003_0000)
//
// Notes
// ─────
//   • 2 masters → masterIndexBits = 1 → slaveIdW = 1 + 1 = 2
//   • Master 1 is Lite → LiteToFull adapter inserted by AxiZeroMixedTop
//   • maxOutstanding = 4 selects the pipelined crossbar path
//   • WeightedRoundRobin(Seq(3,1)): MicroBlaze gets 3× grants vs traffic gen
// ---------------------------------------------------------------------------
object ArtyWrrDutGen extends App {

  // ── Master 0: MicroBlaze M_AXI_DP (Full AXI4) ──────────────────────────
  val masterCfg = Axi4Config(addressWidth = 32, dataWidth = 32, idWidth = 1)

  // ── Master 1: Traffic Gen (AXI4-Lite) ────────────────────────────────────
  val tgenCfg = Axi4Config(
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

  // ── Full AXI4 slave config (BRAM controllers, slaveIdW=2) ───────────────
  val fullSlaveCfg = Axi4Config(addressWidth = 32, dataWidth = 32, idWidth = 2)

  // ── AXI4-Lite slave config (GPIO, UART) ──────────────────────────────────
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
      MasterPort(masterCfg, FullAxi4),    // M0: MicroBlaze (weight 3)
      MasterPort(tgenCfg,   LiteAxi4)     // M1: Traffic Gen (weight 1)
    ),
    slaves = Seq(
      SlavePort(fullSlaveCfg, FullAxi4, BigInt("C0000000", 16), BigInt("00010000", 16)),  // BRAM #0 64 KB
      SlavePort(fullSlaveCfg, FullAxi4, BigInt("C0010000", 16), BigInt("00010000", 16)),  // BRAM #1 64 KB
      SlavePort(liteSlaveCfg, LiteAxi4, BigInt("C0020000", 16), BigInt("00001000", 16)),  // GPIO 4 KB
      SlavePort(liteSlaveCfg, LiteAxi4, BigInt("C0030000", 16), BigInt("00001000", 16))   // UART Lite 4 KB
    ),
    arbitration    = WeightedRoundRobin(Seq(3, 1)),
    maxOutstanding = 4
  )

  SpinalConfig(
    targetDirectory = "hw/vivado/arty_a7/ip/rtl",
    netlistFileName = "AxiZeroArtyWrrDUT.v",
    defaultConfigForClockDomains = ClockDomainConfig(
      clockEdge        = RISING,
      resetKind        = SYNC,
      resetActiveLevel = LOW
    )
  ).generateVerilog(new AxiZeroMixedTop(cfg))

  println("[ArtyWrrDutGen] Done → hw/vivado/arty_a7/ip/rtl/AxiZeroArtyWrrDUT.v")
}
