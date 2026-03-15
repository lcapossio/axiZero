// Copyright (c) 2026 Leonardo Capossio
// SPDX-License-Identifier: MIT
package axizero.sim

import org.scalatest.funsuite.AnyFunSuite
import spinal.core._
import spinal.core.sim._
import spinal.lib.bus.amba4.axi.Axi4Config
import axizero._

// ---------------------------------------------------------------------------
// BurstTypeSpec  —  exercises FIXED and WRAP burst types through the
//                   Axi4DownsizerExt sub-transaction generator.
//
// Topology: 64-bit master → 32-bit slave (downsizer at slave port).
// FIXED  (burst=0): every beat uses the same address byte lanes.
// WRAP   (burst=2): address increments within a power-of-2 aligned window.
// INCR   (burst=1): already covered by WidthConverterSpec — included here
//                   as a baseline for comparison.
//
// The slave-side memory is exposed via spawnFullSlave; after each burst
// write we verify the raw 32-bit words the downsizer deposited.
// ---------------------------------------------------------------------------
class BurstTypeSpec extends AnyFunSuite {

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

  // 64-bit master, 32-bit slave → downsizer inserted at slave port
  private val masterCfg = Axi4Config(addressWidth = 32, dataWidth = 64, idWidth = idW)
  private val slaveCfg  = Axi4Config(addressWidth = 32, dataWidth = 32, idWidth = idW)

  private def makeCfg = AxiZeroConfig(
    masters = Seq(MasterPort(masterCfg, FullAxi4)),
    slaves  = Seq(SlavePort(slaveCfg, FullAxi4, slaveBase, slaveSize))
  )

  // Safely convert a Long (possibly negative due to bit 63) to unsigned BigInt
  // for SpinalHDL Bits assignment.
  private def u64(v: Long): BigInt =
    if (v >= 0) BigInt(v) else BigInt(v.toHexString, 16)

  // Helper: send a raw AXI4 burst with configurable burst type
  private def sendBurst(
    m:         spinal.lib.bus.amba4.axi.Axi4,
    cd:        ClockDomain,
    addr:      Long,
    beats:     Seq[Long],
    burstType: Int,          // 0=FIXED, 1=INCR, 2=WRAP
    id:        Int = 0
  ): Unit = {
    m.aw.valid #= true
    m.aw.addr  #= addr
    if (m.config.useId)    m.aw.id    #= id
    if (m.config.useLen)   m.aw.len   #= beats.length - 1
    if (m.config.useSize)  m.aw.size  #= 3 // log2(8 bytes) = 3 for 64-bit bus
    if (m.config.useBurst) m.aw.burst #= burstType
    while ({ cd.waitSampling(); !m.aw.ready.toBoolean }) {}
    m.aw.valid #= false

    for ((beat, i) <- beats.zipWithIndex) {
      m.w.valid #= true
      m.w.data  #= u64(beat)   // use unsigned BigInt — bit 63 safe
      if (m.config.useStrb) m.w.strb #= 0xFF
      if (m.config.useLast) m.w.last #= (i == beats.length - 1)
      while ({ cd.waitSampling(); !m.w.ready.toBoolean }) {}
    }
    m.w.valid #= false
    if (m.config.useLast) m.w.last #= false

    m.b.ready #= true
    while ({ cd.waitSampling(); !m.b.valid.toBoolean }) {}
    m.b.ready #= false
  }

  // =========================================================================
  // INCR burst (baseline)
  // =========================================================================

  test("downsize 64→32: INCR 2-beat burst data integrity") {
    // Downsizer splits each 64-bit INCR beat into two consecutive 32-bit words.
    simCfg.compile(new AxiZeroMixedTop(makeCfg)).doSim { dut =>
      val cd  = dut.clockDomain
      val mem = SimHelpers.spawnFullSlave(dut.io.slaves(0), cd)
      SimHelpers.initMaster(dut.io.masters(0))
      cd.forkStimulus(10)
      cd.waitSampling(5)

      // Beat 0: 0x1111111122222222, beat 1: 0x3333333344444444
      // INCR: beat0 → addr 0x00 (lo=0x22222222, hi=0x11111111)
      //        beat1 → addr 0x08 (lo=0x44444444, hi=0x33333333)
      val base = 0x0100L
      sendBurst(dut.io.masters(0), cd, base,
        Seq(0x1111111122222222L, 0x3333333344444444L), burstType = 1)
      cd.waitSampling(4)

      assert(mem.getOrElse(base,       0L) == 0x22222222L, "INCR beat0 lo")
      assert(mem.getOrElse(base + 4,   0L) == 0x11111111L, "INCR beat0 hi")
      assert(mem.getOrElse(base + 8,   0L) == 0x44444444L, "INCR beat1 lo")
      assert(mem.getOrElse(base + 12,  0L) == 0x33333333L, "INCR beat1 hi")
    }
  }

  // =========================================================================
  // FIXED burst (burst=0)
  // =========================================================================

  test("downsize 64→32: FIXED 1-beat burst stays at same address") {
    // FIXED burst: all beats target the same address.
    // Single-beat FIXED is the simplest case — just one 64→32 sub-transaction.
    simCfg.compile(new AxiZeroMixedTop(makeCfg)).doSim { dut =>
      val cd  = dut.clockDomain
      val mem = SimHelpers.spawnFullSlave(dut.io.slaves(0), cd)
      SimHelpers.initMaster(dut.io.masters(0))
      cd.forkStimulus(10)
      cd.waitSampling(5)

      val base = 0x0200L
      sendBurst(dut.io.masters(0), cd, base,
        Seq(0xDEADBEEFCAFEBABEL), burstType = 0)
      cd.waitSampling(4)

      // Lo half written to base, hi half to base+4
      assert(mem.getOrElse(base,     0L) == 0xCAFEBABEL, "FIXED lo word")
      assert(mem.getOrElse(base + 4, 0L) == 0xDEADBEEFL, "FIXED hi word")
    }
  }

  // =========================================================================
  // WRAP burst (burst=2)
  // =========================================================================

  test("downsize 64→32: WRAP 2-beat burst wraps within 16-byte window") {
    // WRAP with len=1 (2 beats), size=3 (8 bytes): wrap boundary = 2*8 = 16 bytes.
    // Starting at aligned base 0x0400: beat0→0x0400, beat1→0x0408.
    // No wrap occurs because the burst fits within the window.
    simCfg.compile(new AxiZeroMixedTop(makeCfg)).doSim { dut =>
      val cd  = dut.clockDomain
      val mem = SimHelpers.spawnFullSlave(dut.io.slaves(0), cd)
      SimHelpers.initMaster(dut.io.masters(0))
      cd.forkStimulus(10)
      cd.waitSampling(5)

      val base = 0x0400L  // 16-byte aligned
      sendBurst(dut.io.masters(0), cd, base,
        Seq(0xAAAAAAAABBBBBBBBL, 0xCCCCCCCCDDDDDDDDL), burstType = 2)
      cd.waitSampling(4)

      assert(mem.getOrElse(base,      0L) == 0xBBBBBBBBL, "WRAP beat0 lo")
      assert(mem.getOrElse(base + 4,  0L) == 0xAAAAAAAAL, "WRAP beat0 hi")
      assert(mem.getOrElse(base + 8,  0L) == 0xDDDDDDDDL, "WRAP beat1 lo")
      assert(mem.getOrElse(base + 12, 0L) == 0xCCCCCCCCL, "WRAP beat1 hi")
    }
  }

  test("downsize 64→32: WRAP 4-beat burst data integrity round-trip") {
    // WRAP with len=3 (4 beats), size=3 (8 bytes): wrap boundary = 4*8 = 32 bytes.
    // Start at 32-byte aligned base 0x0500:
    //   beat0→0x0500, beat1→0x0508, beat2→0x0510, beat3→0x0518 (no wrap since aligned).
    // Verifies the WRAP burst type is accepted and data is intact end-to-end.
    simCfg.compile(new AxiZeroMixedTop(makeCfg)).doSim { dut =>
      val cd  = dut.clockDomain
      val mem = SimHelpers.spawnFullSlave(dut.io.slaves(0), cd)
      SimHelpers.initMaster(dut.io.masters(0))
      cd.forkStimulus(10)
      cd.waitSampling(5)

      val base  = 0x0500L  // 32-byte aligned
      val beats = Seq(
        0x1111111122222222L,  // beat0 → 0x0500
        0x3333333344444444L,  // beat1 → 0x0508
        0x5555555566666666L,  // beat2 → 0x0510
        0x7777777788888888L   // beat3 → 0x0518
      )

      sendBurst(dut.io.masters(0), cd, base, beats, burstType = 2)
      cd.waitSampling(8)

      // Verify lo 32 bits of each 64-bit beat at expected 32-bit word addresses
      assert(mem.getOrElse(0x0500L, 0L) == 0x22222222L, "WRAP beat0 lo @ 0x500")
      assert(mem.getOrElse(0x0504L, 0L) == 0x11111111L, "WRAP beat0 hi @ 0x504")
      assert(mem.getOrElse(0x0508L, 0L) == 0x44444444L, "WRAP beat1 lo @ 0x508")
      assert(mem.getOrElse(0x050CL, 0L) == 0x33333333L, "WRAP beat1 hi @ 0x50C")
      assert(mem.getOrElse(0x0510L, 0L) == 0x66666666L, "WRAP beat2 lo @ 0x510")
      assert(mem.getOrElse(0x0514L, 0L) == 0x55555555L, "WRAP beat2 hi @ 0x514")
      assert(mem.getOrElse(0x0518L, 0L) == 0x88888888L, "WRAP beat3 lo @ 0x518")
      assert(mem.getOrElse(0x051CL, 0L) == 0x77777777L, "WRAP beat3 hi @ 0x51C")
    }
  }
}
