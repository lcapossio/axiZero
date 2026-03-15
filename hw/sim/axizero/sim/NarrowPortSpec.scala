// Copyright (c) 2026 Leonardo Capossio
// SPDX-License-Identifier: MIT
package axizero.sim

import org.scalatest.funsuite.AnyFunSuite
import spinal.core._
import spinal.core.sim._
import spinal.lib.bus.amba4.axi.Axi4Config
import axizero._

// ---------------------------------------------------------------------------
// NarrowPortSpec — exercises data-width conversion for narrow Full AXI4 ports
// through AxiZeroMixedTop, covering:
//
//   1. Narrow slave port (16-bit) behind a 32-bit fabric (Axi4DownsizerExt)
//   2. Narrow master port (16-bit) → 32-bit fabric (Axi4Upsizer)
//   3. Mixed: narrow master + narrow slave + 32-bit fabric
//   4. Full→Lite adapter with concurrent traffic from two masters
// ---------------------------------------------------------------------------
class NarrowPortSpec extends AnyFunSuite {

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
  private val idW       = 2

  // =========================================================================
  // Narrow slave: 32-bit master → 16-bit slave (downsizer at slave)
  // =========================================================================

  private val wide32Master = Axi4Config(addressWidth = 32, dataWidth = 32, idWidth = idW)
  private val narrow16Slave = Axi4Config(addressWidth = 32, dataWidth = 16, idWidth = idW)

  private def makeNarrowSlaveCfg = AxiZeroConfig(
    masters = Seq(MasterPort(wide32Master, FullAxi4)),
    slaves  = Seq(SlavePort(narrow16Slave, FullAxi4, slaveBase, slaveSize))
  )

  test("narrow slave 32→16: single-beat write-read") {
    simCfg.compile(new AxiZeroMixedTop(makeNarrowSlaveCfg)).doSim { dut =>
      val cd  = dut.clockDomain
      val mem = SimHelpers.spawnFullSlave(dut.io.slaves(0), cd)
      SimHelpers.initMaster(dut.io.masters(0))
      cd.forkStimulus(10)
      cd.waitSampling(5)

      // Write 0xAABBCCDD: downsizer splits into two 16-bit writes
      SimHelpers.fullWrite(dut.io.masters(0), cd, 0x0100L, 0xAABBCCDDL, id = 1)
      val (rdata, rid) = SimHelpers.fullBurstRead(dut.io.masters(0), cd, 0x0100L, 1, id = 2)
      assert(rdata.head == 0xAABBCCDDL, f"narrow slave 32→16: got 0x${rdata.head}%08X")
      assert(rid == 2)
    }
  }

  test("narrow slave 32→16: 2-beat burst write-read") {
    simCfg.compile(new AxiZeroMixedTop(makeNarrowSlaveCfg)).doSim { dut =>
      val cd  = dut.clockDomain
      val mem = SimHelpers.spawnFullSlave(dut.io.slaves(0), cd)
      SimHelpers.initMaster(dut.io.masters(0))
      cd.forkStimulus(10)
      cd.waitSampling(5)

      val data = Seq(0x11223344L, 0x55667788L)
      SimHelpers.fullBurstWrite(dut.io.masters(0), cd, 0x0200L, data, id = 1)
      val (rdata, _) = SimHelpers.fullBurstRead(dut.io.masters(0), cd, 0x0200L, 2, id = 2)
      assert(rdata == data, s"narrow slave 32→16 burst: got $rdata, expected $data")
    }
  }

  test("narrow slave 32→16: multiple scattered writes and reads") {
    simCfg.compile(new AxiZeroMixedTop(makeNarrowSlaveCfg)).doSim { dut =>
      val cd  = dut.clockDomain
      val mem = SimHelpers.spawnFullSlave(dut.io.slaves(0), cd)
      SimHelpers.initMaster(dut.io.masters(0))
      cd.forkStimulus(10)
      cd.waitSampling(5)

      val pairs = Seq(
        0x0000L -> 0x12345678L,
        0x0010L -> 0xDEADBEEFL,
        0x0020L -> 0xCAFEBABEL,
        0x0030L -> 0x0BADF00DL
      )
      for ((addr, data) <- pairs)
        SimHelpers.fullWrite(dut.io.masters(0), cd, addr, data, id = 0)

      for ((addr, exp) <- pairs) {
        val (rdata, _) = SimHelpers.fullBurstRead(dut.io.masters(0), cd, addr, 1, id = 0)
        assert(rdata.head == exp, f"addr 0x$addr%04X: got 0x${rdata.head}%08X, exp 0x$exp%08X")
      }
    }
  }

  // =========================================================================
  // Narrow master: 16-bit master → 32-bit slave (upsizer at master)
  // =========================================================================

  private val narrow16Master = Axi4Config(addressWidth = 32, dataWidth = 16, idWidth = idW)
  private val wide32Slave    = Axi4Config(addressWidth = 32, dataWidth = 32, idWidth = idW)

  private def makeNarrowMasterCfg = AxiZeroConfig(
    masters = Seq(MasterPort(narrow16Master, FullAxi4)),
    slaves  = Seq(SlavePort(wide32Slave, FullAxi4, slaveBase, slaveSize))
  )

  test("narrow master 16→32: single-beat write-read") {
    simCfg.compile(new AxiZeroMixedTop(makeNarrowMasterCfg)).doSim { dut =>
      val cd  = dut.clockDomain
      val mem = SimHelpers.spawnFullSlave(dut.io.slaves(0), cd)
      SimHelpers.initMaster(dut.io.masters(0))
      cd.forkStimulus(10)
      cd.waitSampling(5)

      // 16-bit master: write 0xBEEF, upsizer zero-extends W to 0x0000BEEF
      dut.io.masters(0).aw.valid #= true
      dut.io.masters(0).aw.addr  #= 0x0000L
      if (dut.io.masters(0).config.useId)    dut.io.masters(0).aw.id    #= 1
      if (dut.io.masters(0).config.useLen)   dut.io.masters(0).aw.len   #= 0
      if (dut.io.masters(0).config.useSize)  dut.io.masters(0).aw.size  #= 1  // 2 bytes
      if (dut.io.masters(0).config.useBurst) dut.io.masters(0).aw.burst #= 1
      while ({ cd.waitSampling(); !dut.io.masters(0).aw.ready.toBoolean }) {}
      dut.io.masters(0).aw.valid #= false

      dut.io.masters(0).w.valid #= true
      dut.io.masters(0).w.data  #= 0xBEEF
      if (dut.io.masters(0).config.useStrb) dut.io.masters(0).w.strb #= 0x3
      if (dut.io.masters(0).config.useLast) dut.io.masters(0).w.last #= true
      while ({ cd.waitSampling(); !dut.io.masters(0).w.ready.toBoolean }) {}
      dut.io.masters(0).w.valid #= false

      dut.io.masters(0).b.ready #= true
      while ({ cd.waitSampling(); !dut.io.masters(0).b.valid.toBoolean }) {}
      val bid = if (dut.io.masters(0).config.useId) dut.io.masters(0).b.id.toInt else 0
      dut.io.masters(0).b.ready #= false
      assert(bid == 1, s"narrow master B.id: expected 1, got $bid")

      // Read back the 16-bit value
      dut.io.masters(0).ar.valid #= true
      dut.io.masters(0).ar.addr  #= 0x0000L
      if (dut.io.masters(0).config.useId)    dut.io.masters(0).ar.id    #= 2
      if (dut.io.masters(0).config.useLen)   dut.io.masters(0).ar.len   #= 0
      if (dut.io.masters(0).config.useSize)  dut.io.masters(0).ar.size  #= 1
      if (dut.io.masters(0).config.useBurst) dut.io.masters(0).ar.burst #= 1
      while ({ cd.waitSampling(); !dut.io.masters(0).ar.ready.toBoolean }) {}
      dut.io.masters(0).ar.valid #= false

      dut.io.masters(0).r.ready #= true
      while ({ cd.waitSampling(); !dut.io.masters(0).r.valid.toBoolean }) {}
      val rdata = dut.io.masters(0).r.data.toLong & 0xFFFFL
      dut.io.masters(0).r.ready #= false

      assert(rdata == 0xBEEFL, f"narrow master 16→32 read: got 0x$rdata%04X")
    }
  }

  // =========================================================================
  // Mixed concurrent adapters: 2 Full masters → 1 Full slave + 1 Lite slave
  // Tests the Full→Lite adapter under contention from two masters.
  // =========================================================================

  private val fullMasterCfg = Axi4Config(addressWidth = 32, dataWidth = 32, idWidth = 4)
  private val fullSlaveCfg  = Axi4Config(addressWidth = 32, dataWidth = 32, idWidth = 5)
  private val liteSlaveCfg  = Axi4Config(addressWidth = 32, dataWidth = 32,
    useId = false, useRegion = false, useBurst = false, useLock = false,
    useCache = false, useSize = false, useQos = false, useLen = false,
    useLast = false, useResp = true, useProt = true, useStrb = true)

  private val slave1Base = BigInt("00010000", 16)

  private def makeMixedConcurrentCfg = AxiZeroConfig(
    masters = Seq.fill(2)(MasterPort(fullMasterCfg, FullAxi4)),
    slaves  = Seq(
      SlavePort(fullSlaveCfg, FullAxi4, slaveBase, slaveSize),
      SlavePort(liteSlaveCfg, LiteAxi4, slave1Base, slaveSize)
    ),
    arbitration = RoundRobin
  )

  test("mixed: concurrent writes from 2 masters to lite slave") {
    simCfg.compile(new AxiZeroMixedTop(makeMixedConcurrentCfg)).doSim { dut =>
      val cd = dut.clockDomain
      cd.forkStimulus(10)
      SimHelpers.initMaster(dut.io.masters(0))
      SimHelpers.initMaster(dut.io.masters(1))
      SimHelpers.spawnFullSlave(dut.io.slaves(0), cd)
      val mem1 = SimHelpers.spawnLiteSlave(dut.io.slaves(1), cd)
      cd.waitSampling(5)

      // Both masters write to the lite slave (slave 1) sequentially
      // (lite slave is single-beat, crossbar serializes)
      SimHelpers.fullWrite(dut.io.masters(0), cd, slave1Base.toLong + 0x0000L, 0x11111111L, id = 1)
      SimHelpers.fullWrite(dut.io.masters(1), cd, slave1Base.toLong + 0x0004L, 0x22222222L, id = 2)

      assert(mem1.getOrElse(slave1Base.toLong + 0x0000L, -1L) == 0x11111111L, "master 0 → lite slave")
      assert(mem1.getOrElse(slave1Base.toLong + 0x0004L, -1L) == 0x22222222L, "master 1 → lite slave")

      // Cross-read: master 1 reads what master 0 wrote
      val (rdata, rid) = SimHelpers.fullBurstRead(dut.io.masters(1), cd, slave1Base.toLong + 0x0000L, 1, id = 3)
      assert(rdata.head == 0x11111111L, f"cross-read: got 0x${rdata.head}%08X")
      assert(rid == 3)
    }
  }

  test("mixed: concurrent writes to full and lite slaves from same master") {
    simCfg.compile(new AxiZeroMixedTop(makeMixedConcurrentCfg)).doSim { dut =>
      val cd = dut.clockDomain
      cd.forkStimulus(10)
      SimHelpers.initMaster(dut.io.masters(0))
      SimHelpers.initMaster(dut.io.masters(1))
      val mem0 = SimHelpers.spawnFullSlave(dut.io.slaves(0), cd)
      val mem1 = SimHelpers.spawnLiteSlave(dut.io.slaves(1), cd)
      cd.waitSampling(5)

      // Master 0 writes to full slave, then to lite slave
      SimHelpers.fullWrite(dut.io.masters(0), cd, 0x0100L, 0xDEAD0000L, id = 5)
      SimHelpers.fullWrite(dut.io.masters(0), cd, slave1Base.toLong + 0x0100L, 0xBEEF0000L, id = 6)

      assert(mem0.getOrElse(0x0100L, -1L) == 0xDEAD0000L, "write to full slave")
      assert(mem1.getOrElse(slave1Base.toLong + 0x0100L, -1L) == 0xBEEF0000L, "write to lite slave")

      // Read back both
      val (r0, _) = SimHelpers.fullBurstRead(dut.io.masters(0), cd, 0x0100L, 1, id = 7)
      val (r1, _) = SimHelpers.fullBurstRead(dut.io.masters(0), cd, slave1Base.toLong + 0x0100L, 1, id = 8)
      assert(r0.head == 0xDEAD0000L, "read from full slave")
      assert(r1.head == 0xBEEF0000L, "read from lite slave")
    }
  }
}
