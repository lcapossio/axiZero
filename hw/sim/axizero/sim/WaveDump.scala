// Copyright (c) 2026 Leonardo Capossio — bard0 design  hello@bard0.com
// SPDX-License-Identifier: MIT
package axizero.sim

import spinal.core._
import spinal.core.sim._
import spinal.lib.bus.amba4.axi.Axi4Config
import axizero._

// ---------------------------------------------------------------------------
// WaveDump  —  pipelined crossbar with 16-beat burst + W back-pressure.
//
// Scenario (all to slave 0):
//   1. M0 writes 16-beat burst  (slave stalls W.ready 2 cycles between beats)
//   2. M1 writes 16-beat burst  (same slave, exercises W-FIFO + arbitration)
//   3. M0 reads back 16 beats with 1-cycle R stall between beats
//   4. M1 reads back 16 beats
//
// Run:  sbt "Test / runMain axizero.sim.WaveDump"
// VCD:  simWorkspace/WaveDump/test/wave.vcd
// ---------------------------------------------------------------------------
object WaveDump extends App {

  val spinalCfg = SpinalConfig(
    defaultConfigForClockDomains = ClockDomainConfig(
      clockEdge        = RISING,
      resetKind        = SYNC,
      resetActiveLevel = LOW
    )
  )

  val slave0Base = BigInt("00000000", 16)
  val slave1Base = BigInt("00010000", 16)
  val slaveSize  = BigInt("00010000", 16)

  val masterCfg = Axi4Config(addressWidth = 32, dataWidth = 32, idWidth = 4)
  val slaveCfg  = Axi4Config(addressWidth = 32, dataWidth = 32, idWidth = 5)

  val cfg = AxiZeroConfig(
    masters = Seq.fill(2)(MasterPort(masterCfg, FullAxi4)),
    slaves  = Seq(
      SlavePort(slaveCfg, FullAxi4, slave0Base, slaveSize),
      SlavePort(slaveCfg, FullAxi4, slave1Base, slaveSize)
    ),
    arbitration    = RoundRobin,
    maxOutstanding = 4
  )

  SimConfig
    .withConfig(spinalCfg)
    .withWave
    .workspaceName("WaveDump")
    .compile(new AxiZeroMixedTop(cfg))
    .doSim { dut =>
      val cd = dut.clockDomain
      cd.forkStimulus(10)

      SimHelpers.initMaster(dut.io.masters(0))
      SimHelpers.initMaster(dut.io.masters(1))
      // stallW=2: slave holds w.ready low 2 cycles between beats
      // stallR=0: slave presents r.valid immediately each beat
      val mem0 = SimHelpers.spawnFullSlave(dut.io.slaves(0), cd, stallW = 2)
      SimHelpers.spawnFullSlave(dut.io.slaves(1), cd)

      cd.waitSampling(5)

      val base0 = slave0Base.toLong + 0x100L
      val base1 = slave0Base.toLong + 0x200L   // both in slave 0 region

      val data0 = (0 until 16).map(i => 0xA0000000L | i.toLong)
      val data1 = (0 until 16).map(i => 0xB0000000L | i.toLong)

      // M0 burst write (16 beats, W stall = 2 cycles each)
      SimHelpers.fullBurstWrite(dut.io.masters(0), cd, base0, data0, id = 1)

      // M1 burst write to same slave (after M0, exercises W-FIFO ordering)
      SimHelpers.fullBurstWrite(dut.io.masters(1), cd, base1, data1, id = 2)

      // M0 reads back with 1-cycle R stall between beats
      SimHelpers.fullBurstRead(dut.io.masters(0), cd, base0, 16, id = 3, stallCycles = 1)

      // M1 reads back (no stall)
      SimHelpers.fullBurstRead(dut.io.masters(1), cd, base1, 16, id = 4)

      cd.waitSampling(10)
    }

  println("[WaveDump] Done. VCD written to: simWorkspace/WaveDump/test/wave.vcd")
}
