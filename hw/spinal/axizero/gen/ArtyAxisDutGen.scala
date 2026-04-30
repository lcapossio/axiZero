// Copyright (c) 2026 Leonardo Capossio - bard0 design  hello@bard0.com
// SPDX-License-Identifier: MIT
package axizero.gen

import axizero._
import axizero.stream.AxiStreamArtySmoke
import spinal.core._
import spinal.lib.bus.amba4.axi.Axi4Config

/** Generate the Arty A7 AXI4-Stream hardware smoke-test RTL.
  *
  * Topology:
  *   MicroBlaze M_AXI_DP -> axiZero 1M x 5S
  *     S0 0xC000_0000  AXI BRAM #0
  *     S1 0xC001_0000  AXI BRAM #1
  *     S2 0xC002_0000  AXI GPIO LEDs
  *     S3 0xC003_0000  AXI UART Lite
  *     S4 0xC004_0000  AXI GPIO input exposing AxiStreamArtySmoke status
  */
object ArtyAxisDutGen extends App {

  private val masterCfg = Axi4Config(addressWidth = 32, dataWidth = 32, idWidth = 1)
  private val fullSlaveCfg = Axi4Config(addressWidth = 32, dataWidth = 32, idWidth = 1)
  private val liteSlaveCfg = Axi4Config(
    addressWidth = 32,
    dataWidth = 32,
    useId = false,
    useRegion = false,
    useBurst = false,
    useLock = false,
    useCache = false,
    useSize = false,
    useQos = false,
    useLen = false,
    useLast = false,
    useResp = true,
    useProt = true,
    useStrb = true
  )

  private val cfg = AxiZeroConfig(
    masters = Seq(MasterPort(masterCfg, FullAxi4)),
    slaves = Seq(
      SlavePort(fullSlaveCfg, FullAxi4, BigInt("C0000000", 16), BigInt("00010000", 16)),
      SlavePort(fullSlaveCfg, FullAxi4, BigInt("C0010000", 16), BigInt("00010000", 16)),
      SlavePort(liteSlaveCfg, LiteAxi4, BigInt("C0020000", 16), BigInt("00001000", 16)),
      SlavePort(liteSlaveCfg, LiteAxi4, BigInt("C0030000", 16), BigInt("00001000", 16)),
      SlavePort(liteSlaveCfg, LiteAxi4, BigInt("C0040000", 16), BigInt("00001000", 16))
    ),
    arbitration = RoundRobin,
    maxOutstanding = 4
  )

  private val spinalCfg = SpinalConfig(
    targetDirectory = "hw/vivado/arty_a7/ip/rtl",
    defaultConfigForClockDomains = ClockDomainConfig(
      clockEdge = RISING,
      resetKind = SYNC,
      resetActiveLevel = LOW
    )
  )

  spinalCfg.copy(netlistFileName = "AxiZeroArtyAxisDUT.v").generateVerilog(new AxiZeroMixedTop(cfg))
  spinalCfg.copy(netlistFileName = "AxiStreamArtySmoke.v").generateVerilog(new AxiStreamArtySmoke)

  GenHelper.prependCopyright(java.nio.file.Paths.get("hw/vivado/arty_a7/ip/rtl/AxiZeroArtyAxisDUT.v"))
  GenHelper.prependCopyright(java.nio.file.Paths.get("hw/vivado/arty_a7/ip/rtl/AxiStreamArtySmoke.v"))
  println("[ArtyAxisDutGen] Done -> hw/vivado/arty_a7/ip/rtl/AxiZeroArtyAxisDUT.v")
  println("[ArtyAxisDutGen] Done -> hw/vivado/arty_a7/ip/rtl/AxiStreamArtySmoke.v")
}
