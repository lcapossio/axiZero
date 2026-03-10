// Copyright (c) 2026 Leonardo Capossio — bard0 design  hello@bard0.com
// SPDX-License-Identifier: MIT
package axizero.sim

import org.scalatest.funsuite.AnyFunSuite
import spinal.core._
import spinal.core.sim._
import spinal.lib.bus.amba4.axi.Axi4Config
import axizero._

// ---------------------------------------------------------------------------
// MixedCrossbarSpec  —  functional tests for AxiZeroMixedTop
//
// Topology: 2 masters (1 full AXI4 id=4, 1 AXI4-Lite), 2 slaves
//           (1 full AXI4 id=5, 1 AXI4-Lite).
//
//   effectiveIdW   = 4  (max id_width of full masters)
//   masterIndexBits= 1  (ceil log2 of 2 masters)
//   slaveIdW       = 5  (effectiveIdW + masterIndexBits)
//
// The full slave's external Axi4Config must declare idWidth=5 so it matches
// the width the crossbar drives on its slave-side ports.
// ---------------------------------------------------------------------------
class MixedCrossbarSpec extends AnyFunSuite {

  // ── Shared SpinalConfig ───────────────────────────────────────────────────

  private val spinalCfg = SpinalConfig(
    defaultConfigForClockDomains = ClockDomainConfig(
      clockEdge        = RISING,
      resetKind        = SYNC,
      resetActiveLevel = LOW
    )
  )

  private def simCfg = SimConfig.withConfig(spinalCfg)

  // ── Address map: two slaves, 64 KB each ──────────────────────────────────

  private val slave0Base = BigInt("00000000", 16)
  private val slave1Base = BigInt("00010000", 16)
  private val slaveSize  = BigInt("00010000", 16)

  // ── Bus configs ───────────────────────────────────────────────────────────

  private val fullMasterCfg = Axi4Config(
    addressWidth = 32, dataWidth = 32, idWidth = 4
  )

  private val liteCfg = Axi4Config(
    addressWidth = 32, dataWidth = 32,
    useId     = false, useRegion = false,
    useBurst  = false, useLock   = false,
    useCache  = false, useSize   = false,
    useQos    = false, useLen    = false,
    useLast   = false, useResp   = true,
    useProt   = true,  useStrb   = true
  )

  // slaveIdW = effectiveIdW(4) + masterIndexBits(1) = 5
  private val fullSlaveCfg = Axi4Config(
    addressWidth = 32, dataWidth = 32, idWidth = 5
  )

  // ── Design factory ────────────────────────────────────────────────────────

  private def makeMixed = AxiZeroConfig(
    masters = Seq(
      MasterPort(fullMasterCfg, FullAxi4),
      MasterPort(liteCfg,       LiteAxi4)
    ),
    slaves = Seq(
      SlavePort(fullSlaveCfg, FullAxi4, slave0Base, slaveSize),
      SlavePort(liteCfg,      LiteAxi4, slave1Base, slaveSize)
    ),
    arbitration = RoundRobin
  )

  // ── Test 1: full master write + read to full slave ────────────────────────
  //
  // Verifies that the full AXI4 crossbar path works end-to-end and that the
  // ID encoding/decoding round-trip preserves the originating transaction ID.

  test("full master write-read to full slave with ID echo") {
    simCfg.compile(new AxiZeroMixedTop(makeMixed)).doSim { dut =>
      val cd = dut.clockDomain
      cd.forkStimulus(10)

      SimHelpers.initMaster(dut.io.masters(0))
      SimHelpers.initMaster(dut.io.masters(1))
      val mem0 = SimHelpers.spawnFullSlave(dut.io.slaves(0), cd)
      SimHelpers.spawnLiteSlave(dut.io.slaves(1), cd)

      cd.waitSampling(5)

      val wId = SimHelpers.fullWrite(dut.io.masters(0), cd,
        addr = slave0Base.toLong + 0x0100L, data = 0x12345678L, id = 3)
      assert(wId == 3, s"B.id echo mismatch: expected 3, got $wId")

      val (rData, rId) = SimHelpers.fullRead(dut.io.masters(0), cd,
        addr = slave0Base.toLong + 0x0100L, id = 7)
      assert(rData == 0x12345678L, f"read data mismatch: 0x${rData}%08x")
      assert(rId == 7, s"R.id echo mismatch: expected 7, got $rId")

      cd.waitSampling(5)
    }
  }

  // ── Test 2: full master write to lite slave (FullToLite adapter) ──────────
  //
  // The crossbar routes the write to the Lite slave via Axi4FullToLiteAdapter.
  // The write must land in the lite slave's memory model.

  test("full master write to lite slave via FullToLite adapter") {
    simCfg.compile(new AxiZeroMixedTop(makeMixed)).doSim { dut =>
      val cd = dut.clockDomain
      cd.forkStimulus(10)

      SimHelpers.initMaster(dut.io.masters(0))
      SimHelpers.initMaster(dut.io.masters(1))
      SimHelpers.spawnFullSlave(dut.io.slaves(0), cd)
      val mem1 = SimHelpers.spawnLiteSlave(dut.io.slaves(1), cd)

      cd.waitSampling(5)

      SimHelpers.fullWrite(dut.io.masters(0), cd,
        addr = slave1Base.toLong + 0x0040L, data = 0xDEADBEEFL)

      assert(mem1.getOrElse(slave1Base.toLong + 0x0040L, -1L) == 0xDEADBEEFL,
        "full master write to lite slave must land in slave-1 memory")

      cd.waitSampling(5)
    }
  }

  // ── Test 3: lite master write + read to full slave (LiteToFull adapter) ───
  //
  // The lite master drives io.masters(1).  The LiteToFullAdapter wraps it
  // into a full AXI4 burst before it enters the crossbar.  The write must
  // reach the full slave and the read-back must return the same data.

  test("lite master write-read to full slave via LiteToFull adapter") {
    simCfg.compile(new AxiZeroMixedTop(makeMixed)).doSim { dut =>
      val cd = dut.clockDomain
      cd.forkStimulus(10)

      SimHelpers.initMaster(dut.io.masters(0))
      SimHelpers.initMaster(dut.io.masters(1))
      SimHelpers.spawnFullSlave(dut.io.slaves(0), cd)
      SimHelpers.spawnLiteSlave(dut.io.slaves(1), cd)

      cd.waitSampling(5)

      SimHelpers.liteWrite(dut.io.masters(1), cd,
        addr = slave0Base.toLong + 0x0200L, data = 0xCAFEF00DL)

      val rData = SimHelpers.liteRead(dut.io.masters(1), cd,
        addr = slave0Base.toLong + 0x0200L)
      assert(rData == 0xCAFEF00DL,
        f"lite master round-trip via full slave failed: 0x${rData}%08x")

      cd.waitSampling(5)
    }
  }

  // ── Test 4: lite master write + read to lite slave ────────────────────────
  //
  // Both the LiteToFull adapter (master side) and FullToLite adapter (slave
  // side) are in the path.  Data must survive both adapter crossings.

  test("lite master write-read to lite slave through both adapters") {
    simCfg.compile(new AxiZeroMixedTop(makeMixed)).doSim { dut =>
      val cd = dut.clockDomain
      cd.forkStimulus(10)

      SimHelpers.initMaster(dut.io.masters(0))
      SimHelpers.initMaster(dut.io.masters(1))
      SimHelpers.spawnFullSlave(dut.io.slaves(0), cd)
      val mem1 = SimHelpers.spawnLiteSlave(dut.io.slaves(1), cd)

      cd.waitSampling(5)

      SimHelpers.liteWrite(dut.io.masters(1), cd,
        addr = slave1Base.toLong + 0x0080L, data = 0xBEEFCAFEL)

      val rData = SimHelpers.liteRead(dut.io.masters(1), cd,
        addr = slave1Base.toLong + 0x0080L)
      assert(rData == 0xBEEFCAFEL,
        f"lite→lite round-trip failed: 0x${rData}%08x")

      cd.waitSampling(5)
    }
  }
}
