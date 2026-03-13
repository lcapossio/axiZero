// Copyright (c) 2026 Leonardo Capossio - bard0 design  hello@bard0.com
// SPDX-License-Identifier: MIT
package axizero.gen

import spinal.core._
import spinal.lib.bus.amba4.axi.Axi4Config
import axizero._

// ArtyQosDutGen - generates AxiZeroArtyQosDUT.v for the QoS hardware test
//
//   sbt "runMain axizero.gen.ArtyQosDutGen"
//
// Output: hw/vivado/arty_a7/ip/rtl/AxiZeroArtyQosDUT.v
object ArtyQosDutGen extends App {

  // Master 0: MicroBlaze M_AXI_DP (Full AXI4)
  val masterCfg = Axi4Config(addressWidth = 32, dataWidth = 32, idWidth = 1)

  // Master 1: Traffic Gen (AXI4-Lite)
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

  // Full AXI4 slave config (BRAM controllers, slaveIdW=2)
  val fullSlaveCfg = Axi4Config(addressWidth = 32, dataWidth = 32, idWidth = 2)

  // AXI4-Lite slave config (GPIO, UART)
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
      MasterPort(masterCfg, FullAxi4),
      MasterPort(tgenCfg,   LiteAxi4)
    ),
    slaves = Seq(
      SlavePort(fullSlaveCfg, FullAxi4, BigInt("C0000000", 16), BigInt("00010000", 16)),
      SlavePort(fullSlaveCfg, FullAxi4, BigInt("C0010000", 16), BigInt("00010000", 16)),
      SlavePort(liteSlaveCfg, LiteAxi4, BigInt("C0020000", 16), BigInt("00001000", 16)),
      SlavePort(liteSlaveCfg, LiteAxi4, BigInt("C0030000", 16), BigInt("00001000", 16))
    ),
    arbitration    = QosBased,
    maxOutstanding = 4
  )

  SpinalConfig(
    targetDirectory = "hw/vivado/arty_a7/ip/rtl",
    netlistFileName = "AxiZeroArtyQosDUT.v",
    defaultConfigForClockDomains = ClockDomainConfig(
      clockEdge        = RISING,
      resetKind        = SYNC,
      resetActiveLevel = LOW
    )
  ).generateVerilog(new AxiZeroMixedTop(cfg))

  GenHelper.prependCopyright(java.nio.file.Paths.get("hw/vivado/arty_a7/ip/rtl/AxiZeroArtyQosDUT.v"))
  println("[ArtyQosDutGen] Done -> hw/vivado/arty_a7/ip/rtl/AxiZeroArtyQosDUT.v")
}
