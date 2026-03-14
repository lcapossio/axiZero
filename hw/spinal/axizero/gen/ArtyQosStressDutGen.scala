// Copyright (c) 2026 Leonardo Capossio - bard0 design  hello@bard0.com
// SPDX-License-Identifier: MIT
package axizero.gen

import spinal.core._
import spinal.lib.bus.amba4.axi.Axi4Config
import axizero._

// ArtyQosStressDutGen - generates AxiZeroArtyQosStressDUT.v for multi-master QoS stress.
//
//   sbt "runMain axizero.gen.ArtyQosStressDutGen"
//
// Topology:
//   4 masters: MicroBlaze + 3 full-AXI traffic generators
//   4 slaves : BRAM0, BRAM1, GPIO (lite), UART (lite)
object ArtyQosStressDutGen extends App {

  val fullMasterCfg = Axi4Config(addressWidth = 32, dataWidth = 32, idWidth = 1)
  val fullSlaveCfg  = Axi4Config(addressWidth = 32, dataWidth = 32, idWidth = 3) // 4 masters -> +2 bits

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
      MasterPort(fullMasterCfg, FullAxi4),
      MasterPort(fullMasterCfg, FullAxi4),
      MasterPort(fullMasterCfg, FullAxi4),
      MasterPort(fullMasterCfg, FullAxi4)
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
    netlistFileName = "AxiZeroArtyQosStressDUT.v",
    defaultConfigForClockDomains = ClockDomainConfig(
      clockEdge        = RISING,
      resetKind        = SYNC,
      resetActiveLevel = LOW
    )
  ).generateVerilog(new AxiZeroMixedTop(cfg))

  GenHelper.prependCopyright(java.nio.file.Paths.get("hw/vivado/arty_a7/ip/rtl/AxiZeroArtyQosStressDUT.v"))
  println("[ArtyQosStressDutGen] Done -> hw/vivado/arty_a7/ip/rtl/AxiZeroArtyQosStressDUT.v")
}
