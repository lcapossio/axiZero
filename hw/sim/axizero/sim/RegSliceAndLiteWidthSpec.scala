// Copyright (c) 2026 Leonardo Capossio
// SPDX-License-Identifier: MIT
package axizero.sim

import org.scalatest.funsuite.AnyFunSuite
import spinal.core._
import spinal.core.sim._
import spinal.lib.bus.amba4.axi.Axi4Config
import axizero._

// ---------------------------------------------------------------------------
// RegSliceAndLiteWidthSpec  —  exercises two previously uncovered paths:
//
//  1. Register slices (Axi4LiteRegSlice, Axi4RegSlice) inserted at master
//     and slave ports via MasterPort(regSlice=true) / SlavePort(regSlice=true)
//
//  2. Axi4LiteWidthConverter (narrow Lite master → wide Lite fabric)
//
// Tests are functional: data written must be readable back unchanged.
// ---------------------------------------------------------------------------
class RegSliceAndLiteWidthSpec extends AnyFunSuite {

  private val spinalCfg = SpinalConfig(
    defaultConfigForClockDomains = ClockDomainConfig(
      clockEdge        = RISING,
      resetKind        = SYNC,
      resetActiveLevel = LOW
    )
  )

  private def simCfg = SimConfig.withConfig(spinalCfg)

  private val slaveBase = BigInt("00000000", 16)
  private val slaveSize = BigInt("00010000", 16)

  // =========================================================================
  // Register slice tests (Full AXI4 master and slave, regSlice=true)
  // =========================================================================

  private val fullCfg = Axi4Config(addressWidth = 32, dataWidth = 32, idWidth = 4)
  // With 1 master: masterIndexBits = 0, so slave ID width equals master ID width (4)
  private val fullSlaveCfg = Axi4Config(addressWidth = 32, dataWidth = 32, idWidth = 4)

  private def makeFullRegSliceCfg(masterRS: Boolean, slaveRS: Boolean) = AxiZeroConfig(
    masters = Seq(MasterPort(fullCfg, FullAxi4, regSlice = masterRS)),
    slaves  = Seq(SlavePort(fullSlaveCfg, FullAxi4, slaveBase, slaveSize, regSlice = slaveRS))
  )

  test("regSlice: Full AXI4 master-side register slice write-read") {
    simCfg.compile(new AxiZeroMixedTop(makeFullRegSliceCfg(masterRS = true, slaveRS = false)))
      .doSim { dut =>
        val cd  = dut.clockDomain
        val mem = SimHelpers.spawnFullSlave(dut.io.slaves(0), cd)
        SimHelpers.initMaster(dut.io.masters(0))
        cd.forkStimulus(10)
        cd.waitSampling(10)

        SimHelpers.fullWrite(dut.io.masters(0), cd, 0x0000L, 0xDEADBEEFL)
        val (rdata, _) = SimHelpers.fullBurstRead(dut.io.masters(0), cd, 0x0000L, 1)
        assert(rdata.head == 0xDEADBEEFL, f"master-RS: got 0x${rdata.head}%08X")
      }
  }

  test("regSlice: Full AXI4 slave-side register slice write-read") {
    simCfg.compile(new AxiZeroMixedTop(makeFullRegSliceCfg(masterRS = false, slaveRS = true)))
      .doSim { dut =>
        val cd  = dut.clockDomain
        val mem = SimHelpers.spawnFullSlave(dut.io.slaves(0), cd)
        SimHelpers.initMaster(dut.io.masters(0))
        cd.forkStimulus(10)
        cd.waitSampling(10)

        SimHelpers.fullWrite(dut.io.masters(0), cd, 0x0004L, 0xCAFEBABEL)
        val (rdata, _) = SimHelpers.fullBurstRead(dut.io.masters(0), cd, 0x0004L, 1)
        assert(rdata.head == 0xCAFEBABEL, f"slave-RS: got 0x${rdata.head}%08X")
      }
  }

  test("regSlice: Full AXI4 both master and slave register slices write-read") {
    simCfg.compile(new AxiZeroMixedTop(makeFullRegSliceCfg(masterRS = true, slaveRS = true)))
      .doSim { dut =>
        val cd  = dut.clockDomain
        val mem = SimHelpers.spawnFullSlave(dut.io.slaves(0), cd)
        SimHelpers.initMaster(dut.io.masters(0))
        cd.forkStimulus(10)
        cd.waitSampling(10)

        val pairs = Seq(0x0000L -> 0x11111111L, 0x0004L -> 0x22222222L, 0x0008L -> 0x33333333L)
        for ((addr, data) <- pairs)
          SimHelpers.fullWrite(dut.io.masters(0), cd, addr, data)
        for ((addr, exp) <- pairs) {
          val (rdata, _) = SimHelpers.fullBurstRead(dut.io.masters(0), cd, addr, 1)
          assert(rdata.head == exp, f"both-RS addr=0x$addr%04X: exp=0x$exp%08X got=0x${rdata.head}%08X")
        }
      }
  }

  test("regSlice: Full AXI4 multi-beat burst through both register slices") {
    simCfg.compile(new AxiZeroMixedTop(makeFullRegSliceCfg(masterRS = true, slaveRS = true)))
      .doSim { dut =>
        val cd  = dut.clockDomain
        val mem = SimHelpers.spawnFullSlave(dut.io.slaves(0), cd)
        SimHelpers.initMaster(dut.io.masters(0))
        cd.forkStimulus(10)
        cd.waitSampling(10)

        val base  = 0x0100L
        val beats = (0 until 4).map(i => 0xA0000000L | i.toLong)
        SimHelpers.fullBurstWrite(dut.io.masters(0), cd, base, beats)
        val (rdata, _) = SimHelpers.fullBurstRead(dut.io.masters(0), cd, base, 4)
        assert(rdata == beats, s"burst through both RS: data mismatch\n  exp=$beats\n  got=$rdata")
      }
  }

  // =========================================================================
  // AXI4-Lite register slice (Lite master → Lite slave, regSlice=true)
  // =========================================================================

  private val liteCfg = Axi4Config(addressWidth = 32, dataWidth = 32,
    useId = false, useLen = false, useSize = false, useBurst = false,
    useLock = false, useCache = false, useQos = false, useRegion = false,
    useLast = false)

  private def makeLiteRegSliceCfg(masterRS: Boolean, slaveRS: Boolean) = AxiZeroConfig(
    masters = Seq(MasterPort(liteCfg, LiteAxi4, regSlice = masterRS)),
    slaves  = Seq(SlavePort(liteCfg, LiteAxi4, slaveBase, slaveSize, regSlice = slaveRS))
  )

  test("regSlice: AXI4-Lite master-side register slice write-read") {
    simCfg.compile(new AxiZeroLiteTop(makeLiteRegSliceCfg(masterRS = true, slaveRS = false)))
      .doSim { dut =>
        val cd  = dut.clockDomain
        val mem = SimHelpers.spawnLiteSlave(dut.io.slaves(0), cd)
        SimHelpers.initMaster(dut.io.masters(0))
        cd.forkStimulus(10)
        cd.waitSampling(10)

        SimHelpers.liteWrite(dut.io.masters(0), cd, 0x0000L, 0xABCD1234L)
        val rdata = SimHelpers.liteRead(dut.io.masters(0), cd, 0x0000L)
        assert(rdata == 0xABCD1234L, f"Lite master-RS: got 0x$rdata%08X")
      }
  }

  test("regSlice: AXI4-Lite both sides register slices write-read") {
    simCfg.compile(new AxiZeroLiteTop(makeLiteRegSliceCfg(masterRS = true, slaveRS = true)))
      .doSim { dut =>
        val cd  = dut.clockDomain
        val mem = SimHelpers.spawnLiteSlave(dut.io.slaves(0), cd)
        SimHelpers.initMaster(dut.io.masters(0))
        cd.forkStimulus(10)
        cd.waitSampling(10)

        SimHelpers.liteWrite(dut.io.masters(0), cd, 0x0010L, 0x55AA55AAL)
        val rdata = SimHelpers.liteRead(dut.io.masters(0), cd, 0x0010L)
        assert(rdata == 0x55AA55AAL, f"Lite both-RS: got 0x$rdata%08X")
      }
  }

  // =========================================================================
  // Axi4LiteWidthConverter — narrow 16-bit Lite master → 32-bit Lite fabric
  // =========================================================================

  private val narrow16 = Axi4Config(addressWidth = 32, dataWidth = 16,
    useId = false, useLen = false, useSize = false, useBurst = false,
    useLock = false, useCache = false, useQos = false, useRegion = false,
    useLast = false)
  private val wide32 = Axi4Config(addressWidth = 32, dataWidth = 32,
    useId = false, useLen = false, useSize = false, useBurst = false,
    useLock = false, useCache = false, useQos = false, useRegion = false,
    useLast = false)

  private def makeLiteWidthConvCfg = AxiZeroConfig(
    masters = Seq(MasterPort(narrow16, LiteAxi4)),
    slaves  = Seq(SlavePort(wide32,   LiteAxi4, slaveBase, slaveSize))
    // fabricDataWidth = max(16, 32) = 32 → LiteWidthConverter at master port
  )

  test("LiteWidthConverter: 16→32 upsizing write-read round-trip") {
    simCfg.compile(new AxiZeroLiteTop(makeLiteWidthConvCfg)).doSim { dut =>
      val cd  = dut.clockDomain
      val mem = SimHelpers.spawnLiteSlave(dut.io.slaves(0), cd)
      SimHelpers.initMaster(dut.io.masters(0))
      cd.forkStimulus(10)
      cd.waitSampling(5)

      // Write 0xBEEF (16-bit value): zero-extended to 0x0000BEEF in slave memory
      // strb=0x3 for 16-bit bus (2 byte lanes)
      SimHelpers.liteWrite(dut.io.masters(0), cd, 0x0000L, 0xBEEFL, strb = 0x3)
      // Read back: slave returns full 32-bit word; converter truncates to 16 bits
      val rdata = SimHelpers.liteRead(dut.io.masters(0), cd, 0x0000L)
      assert((rdata & 0xFFFFL) == 0xBEEFL,
        f"LiteWidthConv 16→32: exp 0xBEEF got 0x${rdata & 0xFFFFL}%04X")
    }
  }

  test("LiteWidthConverter: 16→32 multiple writes at different addresses") {
    simCfg.compile(new AxiZeroLiteTop(makeLiteWidthConvCfg)).doSim { dut =>
      val cd  = dut.clockDomain
      val mem = SimHelpers.spawnLiteSlave(dut.io.slaves(0), cd)
      SimHelpers.initMaster(dut.io.masters(0))
      cd.forkStimulus(10)
      cd.waitSampling(5)

      val pairs = Seq(0x0000L -> 0x1234L, 0x0004L -> 0x5678L, 0x0008L -> 0xABCDL)
      for ((addr, data) <- pairs)
        SimHelpers.liteWrite(dut.io.masters(0), cd, addr, data, strb = 0x3)
      for ((addr, exp) <- pairs) {
        val got = SimHelpers.liteRead(dut.io.masters(0), cd, addr) & 0xFFFFL
        assert(got == exp, f"LiteWidthConv addr=0x$addr%04X: exp=0x$exp%04X got=0x$got%04X")
      }
    }
  }
}
