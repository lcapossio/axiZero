// Copyright (c) 2026 Leonardo Capossio — bard0 design  hello@bard0.com
// SPDX-License-Identifier: MIT
package axizero.gen

import spinal.core._
import spinal.lib.bus.amba4.axi.Axi4Config
import axizero._

// ---------------------------------------------------------------------------
// CocotbDutGen  —  generates AxiZeroCocotbDUT.v for the cocotb test bench
//
//   sbt "runMain axizero.gen.CocotbDutGen"
//
// Output: sim/cocotb/rtl/AxiZeroCocotbDUT.v
//
// Configuration: 2 full-AXI4 masters × 2 full-AXI4 slaves, pipelined mode
//   (maxOutstanding = 4), address map:
//     Slave 0  0x0000_0000 – 0x0000_FFFF  (64 KB)
//     Slave 1  0x0001_0000 – 0x0001_FFFF  (64 KB)
// ---------------------------------------------------------------------------
object CocotbDutGen extends App {

  val slave0Base = BigInt("00000000", 16)
  val slave1Base = BigInt("00010000", 16)
  val slaveSize  = BigInt("00010000", 16)

  // masterIdW=4, slaveIdW=5 (4 + 1 master-index bit for 2 masters)
  val masterCfg = Axi4Config(addressWidth = 32, dataWidth = 32, idWidth = 4)
  val slaveCfg  = Axi4Config(addressWidth = 32, dataWidth = 32, idWidth = 5)

  val cfg = AxiZeroConfig(
    masters = Seq.fill(2)(MasterPort(masterCfg, FullAxi4)),
    slaves = Seq(
      SlavePort(slaveCfg, FullAxi4, slave0Base, slaveSize),
      SlavePort(slaveCfg, FullAxi4, slave1Base, slaveSize)
    ),
    arbitration = RoundRobin,
    maxOutstanding = 4
  )

  SpinalConfig(
    targetDirectory = "sim/cocotb/rtl",
    netlistFileName = "AxiZeroCocotbDUT.v",
    defaultConfigForClockDomains = ClockDomainConfig(
      clockEdge = RISING,
      resetKind = SYNC,
      resetActiveLevel = LOW
    )
  ).generateVerilog(new AxiZeroMixedTop(cfg))

  GenHelper.prependCopyright(java.nio.file.Paths.get("sim/cocotb/rtl/AxiZeroCocotbDUT.v"))
  println("[CocotbDutGen] Done → sim/cocotb/rtl/AxiZeroCocotbDUT.v")
}
