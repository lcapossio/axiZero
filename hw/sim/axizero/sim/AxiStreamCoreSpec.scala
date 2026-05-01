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

  test("AXI Stream FIFO buffers a frame while output is stalled") {
    val cfg = axisCfg(8)

    simCfg.compile(new AxiStreamFifo(cfg, depth = 8)).doSim { dut =>
      val cd     = dut.clockDomain
      val master = Axi4StreamMaster(dut.io.input, cd)
      val slave  = Axi4StreamSlave(dut.io.output, cd)
      val frame  = byteFrame(0x31, 0x32, 0x33, 0x34)

      master.reset()
      slave.reset()
      dut.io.output.ready #= false
      cd.forkStimulus(10)
      cd.waitSampling(5)

      fork { master.send(frame) }
      cd.waitSampling(3)
      dut.io.output.ready #= true

      val got = slave.recv()

      assert(unsigned(got) == unsigned(frame))
    }
  }

  test("AXI Stream FIFO preserves TKEEP TSTRB TLAST while output is stalled") {
    val cfg = axisCfg(32)

    simCfg.compile(new AxiStreamFifo(cfg, depth = 4)).doSim { dut =>
      val cd = dut.clockDomain

      dut.io.input.valid #= false
      dut.io.input.payload.data #= 0
      dut.io.input.payload.strb #= 0
      dut.io.input.payload.keep #= 0
      dut.io.input.payload.last #= false
      dut.io.output.ready #= false
      cd.forkStimulus(10)
      cd.waitSampling(5)

      dut.io.input.valid #= true
      dut.io.input.payload.data #= BigInt("ddccbbaa", 16)
      dut.io.input.payload.strb #= 0x7
      dut.io.input.payload.keep #= 0x5
      dut.io.input.payload.last #= true
      cd.waitSamplingWhere(dut.io.input.ready.toBoolean)
      cd.waitSampling()
      dut.io.input.valid #= false
      dut.io.input.payload.data #= 0
      dut.io.input.payload.strb #= 0
      dut.io.input.payload.keep #= 0
      dut.io.input.payload.last #= false

      cd.waitSamplingWhere(dut.io.output.valid.toBoolean)
      for (_ <- 0 until 4) {
        assert(dut.io.output.payload.data.toBigInt == BigInt("ddccbbaa", 16))
        assert(dut.io.output.payload.strb.toBigInt == 0x7)
        assert(dut.io.output.payload.keep.toBigInt == 0x5)
        assert(dut.io.output.payload.last.toBoolean)
        cd.waitSampling()
      }

      dut.io.output.ready #= true
      cd.waitSamplingWhere(!dut.io.output.valid.toBoolean)
    }
  }

  test("AXI Stream arb mux forwards competing inputs without dropping frames") {
    val cfg = axisCfg(8)

    simCfg.compile(new AxiStreamArbMux(cfg, inputCount = 2)).doSim { dut =>
      val cd      = dut.clockDomain
      val master0 = Axi4StreamMaster(dut.io.inputs(0), cd)
      val master1 = Axi4StreamMaster(dut.io.inputs(1), cd)
      val slave   = Axi4StreamSlave(dut.io.output, cd)
      val frame0  = byteFrame(0x10, 0x11, 0x12)
      val frame1  = byteFrame(0x20, 0x21, 0x22, 0x23)

      master0.reset()
      master1.reset()
      slave.reset()
      cd.forkStimulus(10)
      cd.waitSampling(5)

      fork { master0.send(frame0) }
      fork { master1.send(frame1) }

      val got0 = slave.recv()
      val got1 = slave.recv()

      assert(Set(unsigned(got0), unsigned(got1)) == Set(unsigned(frame0), unsigned(frame1)))
    }
  }

  test("AXI Stream demux forwards a frame to the selected output") {
    val cfg = axisCfg(8)

    simCfg.compile(new AxiStreamDemux(cfg, outputCount = 2)).doSim { dut =>
      val cd     = dut.clockDomain
      val master = Axi4StreamMaster(dut.io.input, cd)
      val slave0 = Axi4StreamSlave(dut.io.outputs(0), cd)
      val slave1 = Axi4StreamSlave(dut.io.outputs(1), cd)
      val frame  = byteFrame(0x41, 0x42, 0x43)
      var got1   = List.empty[Byte]

      master.reset()
      slave0.reset()
      slave1.reset()
      dut.io.select #= 1
      cd.forkStimulus(10)
      cd.waitSampling(5)

      fork { got1 = slave1.recv() }
      master.send(frame)

      cd.waitSampling(5)

      assert(unsigned(got1) == unsigned(frame))
      assert(!dut.io.outputs(0).valid.toBoolean)
    }
  }

  test("AXI Stream demux keeps a packet on one output when select changes") {
    val cfg = axisCfg(1)

    simCfg.compile(new AxiStreamDemux(cfg, outputCount = 2)).doSim { dut =>
      val cd     = dut.clockDomain
      val master = Axi4StreamMaster(dut.io.input, cd)
      val slave0 = Axi4StreamSlave(dut.io.outputs(0), cd)
      val slave1 = Axi4StreamSlave(dut.io.outputs(1), cd)
      val frame  = byteFrame(0x51, 0x52, 0x53, 0x54)
      var got1   = List.empty[Byte]

      master.reset()
      slave0.reset()
      slave1.reset()
      dut.io.select #= 1
      cd.forkStimulus(10)
      cd.waitSampling(5)

      fork { got1 = slave1.recv() }
      fork {
        cd.waitSamplingWhere(dut.io.input.valid.toBoolean && dut.io.input.ready.toBoolean)
        dut.io.select #= 0
      }
      master.send(frame)

      cd.waitSampling(5)

      assert(unsigned(got1) == unsigned(frame))
      assert(!dut.io.outputs(0).valid.toBoolean)
    }
  }

  test("AXI Stream demux preserves sidebands and packet routing across select changes") {
    val cfg = axisCfg(32)

    simCfg.compile(new AxiStreamDemux(cfg, outputCount = 2)).doSim { dut =>
      val cd = dut.clockDomain

      dut.io.input.valid #= false
      dut.io.input.payload.data #= 0
      dut.io.input.payload.strb #= 0
      dut.io.input.payload.keep #= 0
      dut.io.input.payload.last #= false
      dut.io.outputs(0).ready #= true
      dut.io.outputs(1).ready #= true
      dut.io.select #= 0
      cd.forkStimulus(10)
      cd.waitSampling(5)

      dut.io.input.valid #= true
      dut.io.input.payload.data #= BigInt("04030201", 16)
      dut.io.input.payload.strb #= 0xf
      dut.io.input.payload.keep #= 0xf
      dut.io.input.payload.last #= false
      cd.waitSamplingWhere(dut.io.input.ready.toBoolean)
      cd.waitSampling()

      dut.io.outputs(0).ready #= false
      dut.io.select #= 1
      dut.io.input.payload.data #= BigInt("08070605", 16)
      dut.io.input.payload.strb #= 0x3
      dut.io.input.payload.keep #= 0x3
      dut.io.input.payload.last #= true
      cd.waitSampling()

      assert(dut.io.outputs(0).valid.toBoolean)
      assert(dut.io.outputs(0).payload.data.toBigInt == BigInt("08070605", 16))
      assert(dut.io.outputs(0).payload.strb.toBigInt == 0x3)
      assert(dut.io.outputs(0).payload.keep.toBigInt == 0x3)
      assert(dut.io.outputs(0).payload.last.toBoolean)
      assert(!dut.io.outputs(1).valid.toBoolean)

      dut.io.outputs(0).ready #= true
      cd.waitSamplingWhere(dut.io.input.ready.toBoolean)
    }
  }

  test("AXI Stream broadcaster replicates a frame to all outputs") {
    val cfg = axisCfg(8)

    simCfg.compile(new AxiStreamBroadcaster(cfg, outputCount = 2)).doSim { dut =>
      val cd     = dut.clockDomain
      val master = Axi4StreamMaster(dut.io.input, cd)
      val slave0 = Axi4StreamSlave(dut.io.outputs(0), cd)
      val slave1 = Axi4StreamSlave(dut.io.outputs(1), cd)
      val frame  = byteFrame(0xa0, 0xa1, 0xa2, 0xa3, 0xa4)
      var got0   = List.empty[Byte]
      var got1   = List.empty[Byte]

      master.reset()
      slave0.reset()
      slave1.reset()
      cd.forkStimulus(10)
      cd.waitSampling(5)

      val recv0 = fork { got0 = slave0.recv() }
      val recv1 = fork { got1 = slave1.recv() }
      master.send(frame)

      recv0.join()
      recv1.join()

      assert(unsigned(got0) == unsigned(frame))
      assert(unsigned(got1) == unsigned(frame))
    }
  }
}
