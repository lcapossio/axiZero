// Copyright (c) 2026 Leonardo Capossio — bard0 design  hello@bard0.com
// SPDX-License-Identifier: MIT
package axizero.sim

import org.scalatest.funsuite.AnyFunSuite
import spinal.core._
import spinal.core.sim._
import spinal.lib.bus.amba4.axi.Axi4Config
import axizero._

// ---------------------------------------------------------------------------
// WidthConverterSpec  —  sim tests for Axi4LiteWidthConverter and
//                        Axi4WidthConverter wired inside AxiZeroMixedTop
//
// Topology per test: 1 Full-AXI4 master, 1 Full-AXI4 slave, single slave.
// With one master masterIndexBits = 0, so slaveIdW = masterIdW.
//
// Tests
// ─────
//  1. 32→64 upsizing: single-beat write-read round-trip
//  2. 32→64 upsizing: 4-beat burst write-read round-trip
//  3. 64→32 downsizing: single-beat write-read round-trip
//  4. 64→32 downsizing: 2-beat burst write-read round-trip
//  5. 32→64→32 passthrough: 32-bit master + forced 64-bit fabric + 32-bit slave
//  6. 32→64 upsizing: address routing to two slaves
// ---------------------------------------------------------------------------
class WidthConverterSpec extends AnyFunSuite {

  private val spinalCfg = SpinalConfig(
    defaultConfigForClockDomains = ClockDomainConfig(
      clockEdge        = RISING,
      resetKind        = SYNC,
      resetActiveLevel = LOW
    )
  )

  private def simCfg = SimConfig.withConfig(spinalCfg)

  private val slave0Base = BigInt("00000000", 16)
  private val slave1Base = BigInt("00010000", 16)
  private val slaveSize  = BigInt("00010000", 16)

  // With 1 master: masterIndexBits = 0 → slaveIdW = masterIdW
  private val idW = 2

  // ── Upsize: 32-bit master, 64-bit slave ───────────────────────────────────
  private val up32MasterCfg = Axi4Config(addressWidth = 32, dataWidth = 32, idWidth = idW)
  private val up64SlaveCfg  = Axi4Config(addressWidth = 32, dataWidth = 64, idWidth = idW)

  private def makeUpsizeCfg = AxiZeroConfig(
    masters = Seq(MasterPort(up32MasterCfg, FullAxi4)),
    slaves  = Seq(SlavePort(up64SlaveCfg, FullAxi4, slave0Base, slaveSize))
    // fabricDataWidth = max(32, 64) = 64  →  upsizer at master port
  )

  // ── Downsize: 64-bit master, 32-bit slave ─────────────────────────────────
  private val down64MasterCfg = Axi4Config(addressWidth = 32, dataWidth = 64, idWidth = idW)
  private val down32SlaveCfg  = Axi4Config(addressWidth = 32, dataWidth = 32, idWidth = idW)

  private def makeDownsizeCfg = AxiZeroConfig(
    masters = Seq(MasterPort(down64MasterCfg, FullAxi4)),
    slaves  = Seq(SlavePort(down32SlaveCfg, FullAxi4, slave0Base, slaveSize))
    // fabricDataWidth = max(64, 32) = 64  →  downsizer at slave port
  )

  // ── Forced 64-bit fabric with 32-bit endpoints ────────────────────────────
  private val narrow32Cfg = Axi4Config(addressWidth = 32, dataWidth = 32, idWidth = idW)

  private def makeBothConvCfg = AxiZeroConfig(
    masters           = Seq(MasterPort(narrow32Cfg, FullAxi4)),
    slaves            = Seq(SlavePort(narrow32Cfg, FullAxi4, slave0Base, slaveSize)),
    internalDataWidth = Some(64)
    // upsizer at master (32→64), downsizer at slave (64→32)
  )

  // ── Test 1: 32→64 upsizing, single-beat write-read ───────────────────────
  test("upsize 32→64: single-beat write-read round-trip") {
    simCfg.compile(new AxiZeroMixedTop(makeUpsizeCfg)).doSim { dut =>
      val cd = dut.clockDomain
      cd.forkStimulus(10)

      SimHelpers.initMaster(dut.io.masters(0))
      SimHelpers.spawnFullSlave(dut.io.slaves(0), cd)

      cd.waitSampling(5)

      val bid = SimHelpers.fullWrite(dut.io.masters(0), cd,
        addr = slave0Base.toLong + 0x100L, data = 0xAABBCCDDL, id = 1)
      assert(bid == 1, s"B.id echo mismatch: got $bid")

      val (rData, rid) = SimHelpers.fullRead(dut.io.masters(0), cd,
        addr = slave0Base.toLong + 0x100L, id = 2)
      assert(rData == 0xAABBCCDDL, f"read back mismatch: got 0x${rData}%08x")
      assert(rid == 2, s"R.id echo mismatch: got $rid")

      cd.waitSampling(5)
    }
  }

  // ── Test 2: 32→64 upsizing, 4-beat burst ─────────────────────────────────
  //
  // The upsizer merges pairs of 32-bit beats into 64-bit beats for the slave,
  // then splits them back on the read path.  The master should see the same
  // data sequence it wrote.
  test("upsize 32→64: 4-beat burst write-read round-trip") {
    simCfg.compile(new AxiZeroMixedTop(makeUpsizeCfg)).doSim { dut =>
      val cd = dut.clockDomain
      cd.forkStimulus(10)

      SimHelpers.initMaster(dut.io.masters(0))
      SimHelpers.spawnFullSlave(dut.io.slaves(0), cd)

      cd.waitSampling(5)

      val baseAddr  = slave0Base.toLong + 0x200L
      val writeData = (0 until 4).map(i => 0x10000000L | i.toLong)

      SimHelpers.fullBurstWrite(dut.io.masters(0), cd,
        addr = baseAddr, data = writeData, id = 3)

      val (readData, rid) = SimHelpers.fullBurstRead(dut.io.masters(0), cd,
        addr = baseAddr, beats = 4, id = 3)
      assert(rid == 3, s"R.id mismatch: got $rid")
      for (i <- 0 until 4)
        assert(readData(i) == writeData(i),
          f"beat $i: wrote 0x${writeData(i)}%08x, read 0x${readData(i)}%08x")

      cd.waitSampling(5)
    }
  }

  // ── Test 3: 64→32 downsizing, single-beat write-read ─────────────────────
  //
  // The downsizer splits the 64-bit write beat into two 32-bit beats for the
  // narrow slave, then reassembles them on the read path.
  test("downsize 64→32: single-beat write-read round-trip") {
    simCfg.compile(new AxiZeroMixedTop(makeDownsizeCfg)).doSim { dut =>
      val cd = dut.clockDomain
      cd.forkStimulus(10)

      SimHelpers.initMaster(dut.io.masters(0))
      SimHelpers.spawnFullSlave(dut.io.slaves(0), cd)

      cd.waitSampling(5)

      val writeVal = 0x0102030405060708L
      val bid = SimHelpers.fullWrite(dut.io.masters(0), cd,
        addr = slave0Base.toLong + 0x300L, data = writeVal, id = 1, strb = 0xFF)
      assert(bid == 1, s"B.id echo mismatch: got $bid")

      val (rData, rid) = SimHelpers.fullRead(dut.io.masters(0), cd,
        addr = slave0Base.toLong + 0x300L, id = 2)
      assert(rData == writeVal, f"read back mismatch: got 0x${rData}%016x")
      assert(rid == 2, s"R.id echo mismatch: got $rid")

      cd.waitSampling(5)
    }
  }

  // ── Test 4: 64→32 downsizing, 2-beat burst ───────────────────────────────
  test("downsize 64→32: 2-beat burst write-read round-trip") {
    simCfg.compile(new AxiZeroMixedTop(makeDownsizeCfg)).doSim { dut =>
      val cd = dut.clockDomain
      cd.forkStimulus(10)

      SimHelpers.initMaster(dut.io.masters(0))
      SimHelpers.spawnFullSlave(dut.io.slaves(0), cd)

      cd.waitSampling(5)

      val baseAddr  = slave0Base.toLong + 0x400L
      val writeData = Seq(0x0102030405060708L, 0x090A0B0C0D0E0F10L)

      SimHelpers.fullBurstWrite(dut.io.masters(0), cd,
        addr = baseAddr, data = writeData, id = 3, strb = 0xFF)

      val (readData, rid) = SimHelpers.fullBurstRead(dut.io.masters(0), cd,
        addr = baseAddr, beats = 2, id = 3)
      assert(rid == 3, s"R.id mismatch: got $rid")
      for (i <- 0 until 2)
        assert(readData(i) == writeData(i),
          f"beat $i: wrote 0x${writeData(i)}%016x, read 0x${readData(i)}%016x")

      cd.waitSampling(5)
    }
  }

  // ── Test 5: 32→64→32 passthrough (upsizer + downsizer in series) ──────────
  //
  // Forces a 64-bit internal fabric with 32-bit master and slave ports.
  // An Axi4Upsizer (master side) and Axi4Downsizer (slave side) are both
  // instantiated; the full round-trip must be transparent to the 32-bit master.
  test("upsize+downsize: 32-bit through 64-bit fabric round-trip") {
    simCfg.compile(new AxiZeroMixedTop(makeBothConvCfg)).doSim { dut =>
      val cd = dut.clockDomain
      cd.forkStimulus(10)

      SimHelpers.initMaster(dut.io.masters(0))
      SimHelpers.spawnFullSlave(dut.io.slaves(0), cd)

      cd.waitSampling(5)

      // Single-beat round-trip
      SimHelpers.fullWrite(dut.io.masters(0), cd,
        addr = slave0Base.toLong + 0x500L, data = 0xDEADBEEFL, id = 1)
      val (r0, _) = SimHelpers.fullRead(dut.io.masters(0), cd,
        addr = slave0Base.toLong + 0x500L, id = 1)
      assert(r0 == 0xDEADBEEFL, f"single-beat mismatch: got 0x${r0}%08x")

      // 4-beat burst round-trip
      val baseAddr  = slave0Base.toLong + 0x600L
      val writeData = (0 until 4).map(i => 0x20000000L | i.toLong)
      SimHelpers.fullBurstWrite(dut.io.masters(0), cd,
        addr = baseAddr, data = writeData, id = 2)
      val (readData, _) = SimHelpers.fullBurstRead(dut.io.masters(0), cd,
        addr = baseAddr, beats = 4, id = 2)
      for (i <- 0 until 4)
        assert(readData(i) == writeData(i),
          f"burst beat $i: wrote 0x${writeData(i)}%08x, read 0x${readData(i)}%08x")

      cd.waitSampling(5)
    }
  }

  // ── Test 6: 32→64 upsizing, writes route to correct slave ────────────────
  test("upsize 32→64: address routing to correct slave") {
    val twoSlaveCfg = AxiZeroConfig(
      masters = Seq(MasterPort(up32MasterCfg, FullAxi4)),
      slaves  = Seq(
        SlavePort(up64SlaveCfg, FullAxi4, slave0Base, slaveSize),
        SlavePort(up64SlaveCfg, FullAxi4, slave1Base, slaveSize)
      )
    )

    simCfg.compile(new AxiZeroMixedTop(twoSlaveCfg)).doSim { dut =>
      val cd = dut.clockDomain
      cd.forkStimulus(10)

      SimHelpers.initMaster(dut.io.masters(0))
      SimHelpers.spawnFullSlave(dut.io.slaves(0), cd)
      SimHelpers.spawnFullSlave(dut.io.slaves(1), cd)

      cd.waitSampling(5)

      SimHelpers.fullWrite(dut.io.masters(0), cd,
        addr = slave0Base.toLong + 0x100L, data = 0x11111111L, id = 1)
      SimHelpers.fullWrite(dut.io.masters(0), cd,
        addr = slave1Base.toLong + 0x200L, data = 0x22222222L, id = 2)

      val (r0, _) = SimHelpers.fullRead(dut.io.masters(0), cd,
        addr = slave0Base.toLong + 0x100L, id = 1)
      val (r1, _) = SimHelpers.fullRead(dut.io.masters(0), cd,
        addr = slave1Base.toLong + 0x200L, id = 2)

      assert(r0 == 0x11111111L, f"slave 0 read mismatch: 0x${r0}%08x")
      assert(r1 == 0x22222222L, f"slave 1 read mismatch: 0x${r1}%08x")

      cd.waitSampling(5)
    }
  }
}
