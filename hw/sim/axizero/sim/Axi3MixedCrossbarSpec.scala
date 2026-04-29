// Copyright (c) 2026 Leonardo Capossio — bard0 design  hello@bard0.com
// SPDX-License-Identifier: MIT
package axizero.sim

import org.scalatest.funsuite.AnyFunSuite
import spinal.core._
import spinal.core.sim._
import spinal.lib.bus.amba4.axi.Axi4Config
import axizero._
import axizero.adapters.Axi3Config

// ---------------------------------------------------------------------------
// Axi3MixedCrossbarSpec — integration test for Axi3Mode auto-adapter
//
// Verifies that AxiZeroMixedTop correctly auto-inserts Axi3MasterBridgeFromAxi4
// when a MasterPort is declared with mode = Axi3Mode.
//
// Topology: 1 Axi3Mode master (external AXI4 bundle, AXI3-constrained fields),
//           2 slaves (1 full AXI4, 1 AXI4-Lite).
//
// The test drives the external AXI4 port of the Axi3Mode master.  Internally
// the crossbar inserts: Axi4→Axi3 shim → Axi3ToAxi4Adapter → AXI4 fabric.
//
// Tests:
//   1. Single-beat write + read to full AXI4 slave
//   2. Single-beat write + read to AXI4-Lite slave
//   3. Routing: writes to both slaves, reads back from both
//   4. Short INCR burst (4 beats, len=3) to full AXI4 slave
// ---------------------------------------------------------------------------
class Axi3MixedCrossbarSpec extends AnyFunSuite {

  private val spinalCfg = SpinalConfig(
    defaultConfigForClockDomains = ClockDomainConfig(
      clockEdge        = RISING,
      resetKind        = SYNC,
      resetActiveLevel = LOW
    )
  )

  private def simCfg = SimConfig.withConfig(spinalCfg)

  // ── Address map ──────────────────────────────────────────────────────────

  private val slave0Base = BigInt("00000000", 16)
  private val slave1Base = BigInt("00010000", 16)
  private val slaveSize  = BigInt("00010000", 16)

  // ── Bus configs ──────────────────────────────────────────────────────────

  // External AXI4 config for the Axi3Mode master (used by AxiZeroMixedTop
  // to declare the io.masters(0) port; the bridge sits internally).
  // AXI3 constraints: len ≤ 15, no QoS, no region.  idWidth=4.
  private val axi3MasterAxi4Cfg = Axi4Config(
    addressWidth = 32, dataWidth = 32, idWidth = 4
  )

  private val axi3Cfg = Axi3Config(addressWidth = 32, dataWidth = 32, idWidth = 4)

  private val liteCfg = Axi4Config(
    addressWidth = 32, dataWidth = 32,
    useId        = false, useRegion = false,
    useBurst     = false, useLock   = false,
    useCache     = false, useSize   = false,
    useQos       = false, useLen    = false,
    useLast      = false, useResp   = true,
    useProt      = true,  useStrb   = true
  )

  // slaveIdW = effectiveIdW(4) + masterIndexBits(0 since numMasters=1) = 4
  private val fullSlaveIdW = 4

  private val fullSlaveCfg = Axi4Config(
    addressWidth = 32, dataWidth = 32, idWidth = fullSlaveIdW
  )

  // ── DUT ──────────────────────────────────────────────────────────────────

  private def makeCfg: AxiZeroConfig = AxiZeroConfig(
    masters = Seq(
      MasterPort(
        config   = axi3MasterAxi4Cfg,
        mode     = Axi3Mode,
        axi3Cfg  = Some(axi3Cfg)
      )
    ),
    slaves = Seq(
      SlavePort(fullSlaveCfg, FullAxi4, slave0Base, slaveSize),
      SlavePort(liteCfg,      LiteAxi4, slave1Base, slaveSize)
    )
  )

  private def makeCfgWithRegSlice: AxiZeroConfig = AxiZeroConfig(
    masters = Seq(
      MasterPort(
        config   = axi3MasterAxi4Cfg,
        mode     = Axi3Mode,
        axi3Cfg  = Some(axi3Cfg),
        regSlice = true
      )
    ),
    slaves = Seq(
      SlavePort(fullSlaveCfg, FullAxi4, slave0Base, slaveSize, regSlice = true),
      SlavePort(liteCfg,      LiteAxi4, slave1Base, slaveSize)
    )
  )

  // ── Tests ─────────────────────────────────────────────────────────────────

  test("Axi3Mode: single-beat write+read to full AXI4 slave") {
    simCfg.compile(new AxiZeroMixedTop(makeCfg)).doSim("axi3_single_full") { dut =>
      val cd = dut.clockDomain
      cd.forkStimulus(10)

      val master = dut.io.masters(0)
      val slave0 = dut.io.slaves(0)
      val slave1 = dut.io.slaves(1)

      SimHelpers.initMaster(master)
      val mem0 = SimHelpers.spawnFullSlave(slave0, cd)
      SimHelpers.spawnLiteSlave(slave1, cd)
      cd.waitSampling(5)

      SimHelpers.fullWrite(master, cd, slave0Base.toLong + 0x100L, 0xDEAD1234L, id = 2)
      val (data, _) = SimHelpers.fullRead(master, cd, slave0Base.toLong + 0x100L, id = 2)

      assert(data == 0xDEAD1234L, f"expected 0xDEAD1234, got 0x$data%08X")
      assert(mem0(slave0Base.toLong + 0x100L) == 0xDEAD1234L)
      cd.waitSampling(5)
    }
  }

  test("Axi3Mode: single-beat write+read to AXI4-Lite slave") {
    simCfg.compile(new AxiZeroMixedTop(makeCfg)).doSim("axi3_single_lite") { dut =>
      val cd = dut.clockDomain
      cd.forkStimulus(10)

      val master = dut.io.masters(0)
      val slave0 = dut.io.slaves(0)
      val slave1 = dut.io.slaves(1)

      SimHelpers.initMaster(master)
      SimHelpers.spawnFullSlave(slave0, cd)
      val mem1 = SimHelpers.spawnLiteSlave(slave1, cd)
      cd.waitSampling(5)

      SimHelpers.fullWrite(master, cd, slave1Base.toLong + 0x10L, 0xCAFEBABEL, id = 0)
      val (data, _) = SimHelpers.fullRead(master, cd, slave1Base.toLong + 0x10L, id = 0)

      assert(data == 0xCAFEBABEL, f"expected 0xCAFEBABE, got 0x$data%08X")
      cd.waitSampling(5)
    }
  }

  test("Axi3Mode: routing — writes to both slaves, reads back from both") {
    simCfg.compile(new AxiZeroMixedTop(makeCfg)).doSim("axi3_routing") { dut =>
      val cd = dut.clockDomain
      cd.forkStimulus(10)

      val master = dut.io.masters(0)
      val slave0 = dut.io.slaves(0)
      val slave1 = dut.io.slaves(1)

      SimHelpers.initMaster(master)
      SimHelpers.spawnFullSlave(slave0, cd)
      SimHelpers.spawnLiteSlave(slave1, cd)
      cd.waitSampling(5)

      val v0 = 0xAAAA0000L
      val v1 = 0xBBBB1111L

      SimHelpers.fullWrite(master, cd, slave0Base.toLong, v0, id = 1)
      SimHelpers.fullWrite(master, cd, slave1Base.toLong, v1, id = 2)

      val (d0, _) = SimHelpers.fullRead(master, cd, slave0Base.toLong, id = 1)
      val (d1, _) = SimHelpers.fullRead(master, cd, slave1Base.toLong, id = 2)

      assert(d0 == v0, f"slave0 mismatch: expected 0x$v0%08X, got 0x$d0%08X")
      assert(d1 == v1, f"slave1 mismatch: expected 0x$v1%08X, got 0x$d1%08X")
      cd.waitSampling(5)
    }
  }

  test("Axi3Mode: short INCR burst (4 beats) to full AXI4 slave") {
    simCfg.compile(new AxiZeroMixedTop(makeCfg)).doSim("axi3_burst") { dut =>
      val cd = dut.clockDomain
      cd.forkStimulus(10)

      val master = dut.io.masters(0)
      val slave0 = dut.io.slaves(0)
      val slave1 = dut.io.slaves(1)

      SimHelpers.initMaster(master)
      val mem0 = SimHelpers.spawnFullSlave(slave0, cd)
      SimHelpers.spawnLiteSlave(slave1, cd)
      cd.waitSampling(5)

      val baseAddr = slave0Base.toLong + 0x200L
      val beats = Seq(0x11111111L, 0x22222222L, 0x33333333L, 0x44444444L)

      SimHelpers.fullBurstWrite(master, cd, baseAddr, beats, id = 3)

      for ((expected, i) <- beats.zipWithIndex) {
        val (data, _) = SimHelpers.fullRead(master, cd, baseAddr + i * 4, id = 3)
        assert(data == expected,
          f"burst beat $i: expected 0x$expected%08X, got 0x$data%08X")
      }
      cd.waitSampling(5)
    }
  }

  test("Axi3Mode: regSlice on master and slave — write+read and burst") {
    simCfg.compile(new AxiZeroMixedTop(makeCfgWithRegSlice)).doSim("axi3_regslice") { dut =>
      val cd = dut.clockDomain
      cd.forkStimulus(10)

      val master = dut.io.masters(0)
      val slave0 = dut.io.slaves(0)
      val slave1 = dut.io.slaves(1)

      SimHelpers.initMaster(master)
      val mem0 = SimHelpers.spawnFullSlave(slave0, cd)
      SimHelpers.spawnLiteSlave(slave1, cd)
      cd.waitSampling(5)

      // Single-beat write+read through register slices
      SimHelpers.fullWrite(master, cd, slave0Base.toLong + 0x40L, 0xFACEFEEDL, id = 1)
      val (d0, _) = SimHelpers.fullRead(master, cd, slave0Base.toLong + 0x40L, id = 1)
      assert(d0 == 0xFACEFEEDL, f"regSlice single: expected 0xFACEFEED, got 0x$d0%08X")

      // 4-beat burst through register slices
      val baseAddr = slave0Base.toLong + 0x300L
      val beats = Seq(0xAA000001L, 0xBB000002L, 0xCC000003L, 0xDD000004L)
      SimHelpers.fullBurstWrite(master, cd, baseAddr, beats, id = 2)
      for ((expected, i) <- beats.zipWithIndex) {
        val (data, _) = SimHelpers.fullRead(master, cd, baseAddr + i * 4, id = 2)
        assert(data == expected,
          f"regSlice burst beat $i: expected 0x$expected%08X, got 0x$data%08X")
      }
      cd.waitSampling(5)
    }
  }
}
