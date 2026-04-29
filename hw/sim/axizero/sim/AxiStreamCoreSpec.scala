// Copyright (c) 2026 Leonardo Capossio
// SPDX-License-Identifier: MIT
package axizero.sim

import axizero.stream._
import org.scalatest.funsuite.AnyFunSuite
import spinal.core._
import spinal.core.sim._
import spinal.lib.bus.amba4.axis._
import spinal.lib.bus.amba4.axis.sim._

class AxiStreamCoreSpec extends AnyFunSuite {

  private val spinalCfg = SpinalConfig(
    defaultConfigForClockDomains = ClockDomainConfig(
      clockEdge = RISING,
      resetKind = SYNC,
      resetActiveLevel = LOW
    )
  )

  private def simCfg = SimConfig.withConfig(spinalCfg)

  private def axisCfg(dataWidth: Int): Axi4StreamConfig =
    Axi4StreamConfig(
      dataWidth = dataWidth,
      idWidth = 0,
      destWidth = 0,
      userWidth = 0,
      useStrb = true,
      useKeep = true,
      useLast = true,
      useId = false,
      useDest = false,
      useUser = false
    )

  private def byteFrame(values: Int*): List[Byte] =
    values.map(v => (v & 0xff).toByte).toList

  private def unsigned(bytes: List[Byte]): List[Int] =
    bytes.map(_ & 0xff)

  test("AXI Stream register slice preserves a byte frame") {
    val cfg = axisCfg(8)

    simCfg.compile(new AxiStreamRegSlice(cfg)).doSim { dut =>
      val cd     = dut.clockDomain
      val master = Axi4StreamMaster(dut.io.input, cd)
      val slave  = Axi4StreamSlave(dut.io.output, cd)
      val frame  = byteFrame(0x11, 0x22, 0x33, 0x44, 0x55)

      master.reset()
      slave.reset()
      cd.forkStimulus(10)
      cd.waitSampling(5)

      fork { master.send(frame) }
      val got = slave.recv()

      assert(unsigned(got) == unsigned(frame))
    }
  }

  test("AXI Stream width adapter packs 8-bit input into 32-bit output") {
    val inCfg  = axisCfg(8)
    val outCfg = axisCfg(32)

    simCfg.compile(new AxiStreamWidthAdapter(inCfg, outCfg)).doSim { dut =>
      val cd     = dut.clockDomain
      val master = Axi4StreamMaster(dut.io.input, cd)
      val slave  = Axi4StreamSlave(dut.io.output, cd)
      val frame  = byteFrame(0x01, 0x23, 0x45, 0x67, 0x89, 0xab, 0xcd)

      master.reset()
      slave.reset()
      cd.forkStimulus(10)
      cd.waitSampling(5)

      fork { master.send(frame) }
      val got = slave.recv()

      assert(unsigned(got) == unsigned(frame))
    }
  }

  test("AXI Stream width adapter unpacks 32-bit input into 8-bit output") {
    val inCfg  = axisCfg(32)
    val outCfg = axisCfg(8)

    simCfg.compile(new AxiStreamWidthAdapter(inCfg, outCfg)).doSim { dut =>
      val cd     = dut.clockDomain
      val master = Axi4StreamMaster(dut.io.input, cd)
      val slave  = Axi4StreamSlave(dut.io.output, cd)
      val frame  = byteFrame(0xde, 0xad, 0xbe, 0xef, 0xca, 0xfe)

      master.reset()
      slave.reset()
      cd.forkStimulus(10)
      cd.waitSampling(5)

      fork { master.send(frame) }
      val got = slave.recv()

      assert(unsigned(got) == unsigned(frame))
    }
  }
}
