// Copyright (c) 2026 Leonardo Capossio — bard0 design  hello@bard0.com
// SPDX-License-Identifier: MIT
package axizero.sim

import org.scalatest.funsuite.AnyFunSuite
import spinal.core._
import spinal.core.sim._
import spinal.lib.bus.amba4.axi.Axi4Config
import axizero._

// ---------------------------------------------------------------------------
// ArtySpec  —  reproduces the 1M×4S Arty A7 hardware failure pattern
//
// Config exactly matches ArtyDutGen:
//   Master 0  : AXI4-Full, idWidth=1  (MicroBlaze M_AXI_DP)
//   Slave  0/1: AXI4-Full, idWidth=1  (BRAM controllers)
//   Slave  2/3: AXI4-Lite             (GPIO, UART)
//   maxOutstanding = 4 (pipelined path)
//
// Failing hardware tests reproduced here:
//   T4 – 64 individual single-beat writes to slave 0 then readback
//   T5 – 64 individual single-beat writes to slave 1 then readback
//   T6 – 32 alternating single-beat writes to slave 0 / slave 1 then readback
//   T9 – 256 consecutive single-beat writes to slave 0 then readback
//        (subset of the 16384-write hardware test, enough to hit any bug)
// ---------------------------------------------------------------------------
class ArtySpec extends AnyFunSuite {

  private val spinalCfg = SpinalConfig(
    defaultConfigForClockDomains = ClockDomainConfig(
      clockEdge        = RISING,
      resetKind        = SYNC,
      resetActiveLevel = LOW
    )
  )

  private def simCfg = SimConfig.withConfig(spinalCfg)

  // ── Address map (matches Arty hardware) ───────────────────────────────────
  private val bram0Base  = BigInt("C0000000", 16)
  private val bram1Base  = BigInt("C0010000", 16)
  private val gpioBase   = BigInt("C0020000", 16)
  private val uartBase   = BigInt("C0030000", 16)
  private val slaveSize  = BigInt("00010000", 16)
  private val liteSize   = BigInt("00001000", 16)

  // ── Bus configs (exact match with ArtyDutGen) ─────────────────────────────
  private val masterCfg = Axi4Config(addressWidth = 32, dataWidth = 32, idWidth = 1)
  private val fullSlaveCfg = Axi4Config(addressWidth = 32, dataWidth = 32, idWidth = 1)
  private val liteSlaveCfg = Axi4Config(
    addressWidth = 32, dataWidth = 32,
    useId     = false, useRegion = false,
    useBurst  = false, useLock   = false,
    useCache  = false, useSize   = false,
    useQos    = false, useLen    = false,
    useLast   = false, useResp   = true,
    useProt   = true,  useStrb   = true
  )

  private def makeArtyConfig = AxiZeroConfig(
    masters = Seq(MasterPort(masterCfg, FullAxi4)),
    slaves  = Seq(
      SlavePort(fullSlaveCfg, FullAxi4, bram0Base, slaveSize),
      SlavePort(fullSlaveCfg, FullAxi4, bram1Base, slaveSize),
      SlavePort(liteSlaveCfg, LiteAxi4, gpioBase,  liteSize),
      SlavePort(liteSlaveCfg, LiteAxi4, uartBase,  liteSize)
    ),
    arbitration    = RoundRobin,
    maxOutstanding = 4
  )

  // ── T4: 64 individual writes to BRAM0, then readback ─────────────────────
  test("arty T4: 64 sequential single-beat writes to slave 0 (BRAM0)") {
    simCfg.compile(new AxiZeroMixedTop(makeArtyConfig)).doSim { dut =>
      val cd = dut.clockDomain
      cd.forkStimulus(10)

      SimHelpers.initMaster(dut.io.masters(0))
      val mem0 = SimHelpers.spawnFullSlave(dut.io.slaves(0), cd)
      val mem1 = SimHelpers.spawnFullSlave(dut.io.slaves(1), cd)
      SimHelpers.spawnLiteSlave(dut.io.slaves(2), cd)
      SimHelpers.spawnLiteSlave(dut.io.slaves(3), cd)

      cd.waitSampling(5)

      val base  = bram0Base.toLong + 0x1000L
      val nWords = 64

      // 64 individual single-beat writes (len=0 each) — mirrors firmware wr32 loop
      for (i <- 0 until nWords)
        SimHelpers.fullWrite(dut.io.masters(0), cd, base + i * 4, 0xA0000000L | i)

      // Read back
      for (i <- 0 until nWords) {
        val (got, _) = SimHelpers.fullRead(dut.io.masters(0), cd, base + i * 4)
        val exp = 0xA0000000L | i
        assert(got == exp,
          f"T4 word $i: wrote 0x${exp}%08x, read back 0x${got}%08x")
      }
    }
  }

  // ── T5: 64 individual writes to BRAM1, then readback ─────────────────────
  test("arty T5: 64 sequential single-beat writes to slave 1 (BRAM1)") {
    simCfg.compile(new AxiZeroMixedTop(makeArtyConfig)).doSim { dut =>
      val cd = dut.clockDomain
      cd.forkStimulus(10)

      SimHelpers.initMaster(dut.io.masters(0))
      val mem0 = SimHelpers.spawnFullSlave(dut.io.slaves(0), cd)
      val mem1 = SimHelpers.spawnFullSlave(dut.io.slaves(1), cd)
      SimHelpers.spawnLiteSlave(dut.io.slaves(2), cd)
      SimHelpers.spawnLiteSlave(dut.io.slaves(3), cd)

      cd.waitSampling(5)

      val base   = bram1Base.toLong + 0x2000L
      val nWords = 64

      for (i <- 0 until nWords) {
        val pat = 1L << (i & 31)
        SimHelpers.fullWrite(dut.io.masters(0), cd, base + i * 4, pat)
      }

      for (i <- 0 until nWords) {
        val exp = 1L << (i & 31)
        val (got, _) = SimHelpers.fullRead(dut.io.masters(0), cd, base + i * 4)
        assert(got == exp,
          f"T5 word $i: wrote 0x${exp}%08x, read back 0x${got}%08x")
      }
    }
  }

  // ── T6: 32 alternating writes to BRAM0 and BRAM1, then readback ──────────
  test("arty T6: 32 alternating single-beat writes to slave 0 / slave 1") {
    simCfg.compile(new AxiZeroMixedTop(makeArtyConfig)).doSim { dut =>
      val cd = dut.clockDomain
      cd.forkStimulus(10)

      SimHelpers.initMaster(dut.io.masters(0))
      val mem0 = SimHelpers.spawnFullSlave(dut.io.slaves(0), cd)
      val mem1 = SimHelpers.spawnFullSlave(dut.io.slaves(1), cd)
      SimHelpers.spawnLiteSlave(dut.io.slaves(2), cd)
      SimHelpers.spawnLiteSlave(dut.io.slaves(3), cd)

      cd.waitSampling(5)

      val base0  = bram0Base.toLong + 0x3000L
      val base1  = bram1Base.toLong + 0x3000L
      val nWords = 32

      // Write alternating: odd i → BRAM0, even i → BRAM1 (matches firmware)
      for (i <- 0 until nWords) {
        val addr = if ((i & 1) != 0) base0 + i * 4 else base1 + i * 4
        SimHelpers.fullWrite(dut.io.masters(0), cd, addr, 0xB0000000L | i)
      }

      // Read back
      for (i <- 0 until nWords) {
        val addr = if ((i & 1) != 0) base0 + i * 4 else base1 + i * 4
        val exp  = 0xB0000000L | i
        val (got, _) = SimHelpers.fullRead(dut.io.masters(0), cd, addr)
        assert(got == exp,
          f"T6 word $i: wrote 0x${exp}%08x, read back 0x${got}%08x")
      }
    }
  }

  // ── Combined T1→T2→T3→T4: full hardware sequence in one sim run ──────────
  //
  // Mirrors exactly what main_le.elf does before failing T4 in hardware.
  // If a state-based crossbar bug exists, T4 here will fail while the
  // isolated T4 test above passes.
  test("arty combined T1+T2+T3+T4: hardware sequence reproduced") {
    simCfg.compile(new AxiZeroMixedTop(makeArtyConfig)).doSim { dut =>
      val cd = dut.clockDomain
      cd.forkStimulus(10)

      SimHelpers.initMaster(dut.io.masters(0))
      val mem0 = SimHelpers.spawnFullSlave(dut.io.slaves(0), cd)
      val mem1 = SimHelpers.spawnFullSlave(dut.io.slaves(1), cd)
      SimHelpers.spawnLiteSlave(dut.io.slaves(2), cd)
      SimHelpers.spawnLiteSlave(dut.io.slaves(3), cd)

      cd.waitSampling(5)

      // T1 – single write+read BRAM0+0x100
      SimHelpers.fullWrite(dut.io.masters(0), cd, bram0Base.toLong + 0x100L, 0xDEADBEEFL)
      val (t1got, _) = SimHelpers.fullRead(dut.io.masters(0), cd, bram0Base.toLong + 0x100L)
      assert(t1got == 0xDEADBEEFL, f"T1 readback: got 0x$t1got%08x expected 0xDEADBEEF")

      // T2 – single write+read BRAM1+0x200
      SimHelpers.fullWrite(dut.io.masters(0), cd, bram1Base.toLong + 0x200L, 0xCAFEBABEL)
      val (t2got, _) = SimHelpers.fullRead(dut.io.masters(0), cd, bram1Base.toLong + 0x200L)
      assert(t2got == 0xCAFEBABEL, f"T2 readback: got 0x$t2got%08x expected 0xCAFEBABE")

      // T3 – 2 writes (BRAM0+0x10, BRAM1+0x10) then 2 reads
      SimHelpers.fullWrite(dut.io.masters(0), cd, bram0Base.toLong + 0x10L, 0x11111111L)
      SimHelpers.fullWrite(dut.io.masters(0), cd, bram1Base.toLong + 0x10L, 0x22222222L)
      val (t3g0, _) = SimHelpers.fullRead(dut.io.masters(0), cd, bram0Base.toLong + 0x10L)
      val (t3g1, _) = SimHelpers.fullRead(dut.io.masters(0), cd, bram1Base.toLong + 0x10L)
      assert(t3g0 == 0x11111111L, f"T3 BRAM0 readback: got 0x$t3g0%08x")
      assert(t3g1 == 0x22222222L, f"T3 BRAM1 readback: got 0x$t3g1%08x")

      // T4 – 64 sequential writes to BRAM0+0x1000, then readback
      val base4  = bram0Base.toLong + 0x1000L
      val nWords = 64
      for (i <- 0 until nWords)
        SimHelpers.fullWrite(dut.io.masters(0), cd, base4 + i * 4, 0xA0000000L | i)
      for (i <- 0 until nWords) {
        val exp = 0xA0000000L | i
        val (got, _) = SimHelpers.fullRead(dut.io.masters(0), cd, base4 + i * 4)
        assert(got == exp,
          f"T4 word $i after T1+T2+T3: wrote 0x$exp%08x, read back 0x$got%08x")
      }
    }
  }

  // ── T9 (subset): 256 individual writes to BRAM0, then readback ───────────
  //
  // The real T9 is 16384 words; 256 is enough to trigger any wFifo or
  // wrOutstanding counter bug that appears after a handful of transactions.
  test("arty T9-subset: 256 sequential single-beat writes to slave 0 (BRAM0)") {
    simCfg.compile(new AxiZeroMixedTop(makeArtyConfig)).doSim { dut =>
      val cd = dut.clockDomain
      cd.forkStimulus(10)

      SimHelpers.initMaster(dut.io.masters(0))
      val mem0 = SimHelpers.spawnFullSlave(dut.io.slaves(0), cd)
      val mem1 = SimHelpers.spawnFullSlave(dut.io.slaves(1), cd)
      SimHelpers.spawnLiteSlave(dut.io.slaves(2), cd)
      SimHelpers.spawnLiteSlave(dut.io.slaves(3), cd)

      cd.waitSampling(5)

      val base   = bram0Base.toLong
      val nWords = 256
      val EVEN   = 0x55555555L
      val ODD    = 0xAAAAAAAAL

      for (i <- 0 until nWords)
        SimHelpers.fullWrite(dut.io.masters(0), cd, base + i * 4,
          if ((i & 1) == 0) EVEN else ODD)

      for (i <- 0 until nWords) {
        val exp = if ((i & 1) == 0) EVEN else ODD
        val (got, _) = SimHelpers.fullRead(dut.io.masters(0), cd, base + i * 4)
        assert(got == exp,
          f"T9 word $i: wrote 0x${exp}%08x, read back 0x${got}%08x")
      }
    }
  }
}
