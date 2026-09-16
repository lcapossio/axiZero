// Copyright (c) 2026 Leonardo Capossio - bard0 design  hello@bard0.com
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

  /** Config with the sideband fields enabled.
    *
    * The Axi4StreamMaster/Slave helpers only carry data bytes, so the sideband tests drive the
    * bus directly rather than through the BFMs.
    */
  private def axisSidebandCfg(dataWidth: Int): Axi4StreamConfig =
    Axi4StreamConfig(
      dataWidth = dataWidth,
      idWidth = 4,
      destWidth = 3,
      userWidth = 5,
      useStrb = true,
      useKeep = true,
      useLast = true,
      useId = true,
      useDest = true,
      useUser = true
    )

  /** Park a stream input at a defined idle state.
    *
    * Every payload field must be driven, not just valid: an undriven field stays at X, and
    * reading one through a core's payload mux fails with a raw64ToInt error rather than a
    * useful mismatch.
    */
  private def idleSidebandInput(stream: Axi4Stream.Axi4Stream): Unit = {
    stream.valid        #= false
    stream.payload.data #= 0
    stream.payload.id   #= 0
    stream.payload.dest #= 0
    stream.payload.user #= 0
    stream.payload.last #= false
    stream.payload.strb #= 0
    stream.payload.keep #= 0
  }

  /** Drive one beat with explicit sideband values and wait for it to be accepted. */
  private def sendSidebandBeat(
    stream: Axi4Stream.Axi4Stream,
    cd: ClockDomain,
    data: BigInt,
    id: Int,
    dest: Int,
    user: Int,
    last: Boolean = true
  ): Unit = {
    stream.valid       #= true
    stream.payload.data #= data
    stream.payload.id   #= id
    stream.payload.dest #= dest
    stream.payload.user #= user
    stream.payload.last #= last
    stream.payload.strb #= (BigInt(1) << (stream.payload.data.getWidth / 8)) - 1
    stream.payload.keep #= (BigInt(1) << (stream.payload.data.getWidth / 8)) - 1
    cd.waitSamplingWhere(stream.ready.toBoolean)
    stream.valid #= false
  }

  /** Wait for a beat and return its sideband fields.
    *
    * All four are read as BigInt rather than Int: TUSER is userWidth bits *per data byte*, so on
    * an 8-byte bus a userWidth of 5 is a 40-bit field and toInt overflows.
    */
  private def recvSidebandBeat(
    stream: Axi4Stream.Axi4Stream,
    cd: ClockDomain
  ): (BigInt, BigInt, BigInt, BigInt) = {
    stream.ready #= true
    cd.waitSamplingWhere(stream.valid.toBoolean)
    val out = (
      stream.payload.data.toBigInt,
      stream.payload.id.toBigInt,
      stream.payload.dest.toBigInt,
      stream.payload.user.toBigInt
    )
    stream.ready #= false
    out
  }

  private def byteFrame(values: Int*): List[Byte] =
    values.map(v => (v & 0xff).toByte).toList

  private def unsigned(bytes: List[Byte]): List[Int] =
    bytes.map(_ & 0xff)

  test("AXI Stream register slice preserves TID, TDEST and TUSER") {
    val cfg = axisSidebandCfg(8)

    simCfg.compile(new AxiStreamRegSlice(cfg)).doSim { dut =>
      val cd = dut.clockDomain

      idleSidebandInput(dut.io.input)
      dut.io.output.ready #= false
      cd.forkStimulus(10)
      cd.waitSampling(5)

      val send = fork {
        sendSidebandBeat(dut.io.input, cd, data = 0x5a, id = 0xd, dest = 0x5, user = 0x13)
      }
      val (data, id, dest, user) = recvSidebandBeat(dut.io.output, cd)
      send.join()

      assert(data == 0x5a, s"data was $data")
      assert(id == 0xd, s"TID was $id")
      assert(dest == 0x5, s"TDEST was $dest")
      assert(user == 0x13, s"TUSER was $user")
    }
  }

  test("AXI Stream FIFO preserves per-beat TUSER across a packet") {
    val cfg = axisSidebandCfg(8)

    simCfg.compile(new AxiStreamFifo(cfg, depth = 4)).doSim { dut =>
      val cd = dut.clockDomain

      idleSidebandInput(dut.io.input)
      dut.io.output.ready #= false
      cd.forkStimulus(10)
      cd.waitSampling(5)

      // TID/TDEST are constant for a packet, TUSER varies per beat.
      val beats = Seq((0x11, 0x01), (0x22, 0x02), (0x33, 0x04))

      val send = fork {
        beats.zipWithIndex.foreach { case ((data, user), i) =>
          sendSidebandBeat(
            dut.io.input, cd,
            data = data, id = 0x7, dest = 0x2, user = user,
            last = i == beats.length - 1
          )
        }
      }

      val got = beats.indices.map(_ => recvSidebandBeat(dut.io.output, cd))
      send.join()

      assert(got.map(_._1) == beats.map(b => BigInt(b._1)), s"data was ${got.map(_._1)}")
      assert(got.map(_._4) == beats.map(_._2), s"TUSER was ${got.map(_._4)}")
      assert(got.forall(_._2 == 0x7), s"TID was ${got.map(_._2)}")
      assert(got.forall(_._3 == 0x2), s"TDEST was ${got.map(_._3)}")
    }
  }

  test("AXI Stream arb-mux forwards sideband from the granted input") {
    val cfg = axisSidebandCfg(8)

    simCfg.compile(new AxiStreamArbMux(cfg, inputCount = 2)).doSim { dut =>
      val cd = dut.clockDomain

      dut.io.inputs.foreach(idleSidebandInput)
      dut.io.output.ready #= false
      cd.forkStimulus(10)
      cd.waitSampling(5)

      // Only input 1 is offered, so it must win and its sideband must appear.
      val send = fork {
        sendSidebandBeat(dut.io.inputs(1), cd, data = 0x3c, id = 0x9, dest = 0x6, user = 0x1a)
      }
      val (data, id, dest, user) = recvSidebandBeat(dut.io.output, cd)
      send.join()

      assert(data == 0x3c, s"data was $data")
      assert(id == 0x9, s"TID was $id")
      assert(dest == 0x6, s"TDEST was $dest")
      assert(user == 0x1a, s"TUSER was $user")
    }
  }

  test("AXI Stream demux forwards sideband to the selected output") {
    val cfg = axisSidebandCfg(8)

    simCfg.compile(new AxiStreamDemux(cfg, outputCount = 2)).doSim { dut =>
      val cd = dut.clockDomain

      idleSidebandInput(dut.io.input)
      dut.io.outputs.foreach(_.ready #= false)
      dut.io.select #= 1
      cd.forkStimulus(10)
      cd.waitSampling(5)

      val send = fork {
        sendSidebandBeat(dut.io.input, cd, data = 0x77, id = 0xa, dest = 0x3, user = 0x05)
      }
      val (data, id, dest, user) = recvSidebandBeat(dut.io.outputs(1), cd)
      send.join()

      assert(data == 0x77, s"data was $data")
      assert(id == 0xa, s"TID was $id")
      assert(dest == 0x3, s"TDEST was $dest")
      assert(user == 0x05, s"TUSER was $user")
    }
  }

  test("AXI Stream broadcaster replicates sideband to every output") {
    val cfg = axisSidebandCfg(8)

    simCfg.compile(new AxiStreamBroadcaster(cfg, outputCount = 2)).doSim { dut =>
      val cd = dut.clockDomain

      idleSidebandInput(dut.io.input)
      dut.io.outputs.foreach(_.ready #= false)
      cd.forkStimulus(10)
      cd.waitSampling(5)

      var got0 = (BigInt(0), BigInt(0), BigInt(0), BigInt(0))
      var got1 = (BigInt(0), BigInt(0), BigInt(0), BigInt(0))

      val recv0 = fork { got0 = recvSidebandBeat(dut.io.outputs(0), cd) }
      val recv1 = fork { got1 = recvSidebandBeat(dut.io.outputs(1), cd) }
      sendSidebandBeat(dut.io.input, cd, data = 0x2b, id = 0x6, dest = 0x1, user = 0x0f)
      recv0.join()
      recv1.join()

      assert(got0 == (BigInt(0x2b), 0x6, 0x1, 0x0f), s"output 0 got $got0")
      assert(got1 == (BigInt(0x2b), 0x6, 0x1, 0x0f), s"output 1 got $got1")
    }
  }

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

      val frames = List(unsigned(got0), unsigned(got1))
      assert(
        frames == List(unsigned(frame0), unsigned(frame1)) ||
          frames == List(unsigned(frame1), unsigned(frame0))
      )
      assert(frames.forall(frame => frame == unsigned(frame0) || frame == unsigned(frame1)))
    }
  }

  test("AXI Stream arb mux round robin wraps for three inputs") {
    val cfg = axisCfg(8)

    simCfg.compile(new AxiStreamArbMux(cfg, inputCount = 3)).doSim { dut =>
      val cd = dut.clockDomain

      for (i <- 0 until 3) {
        dut.io.inputs(i).valid #= false
        dut.io.inputs(i).payload.data #= 0
        dut.io.inputs(i).payload.strb #= 1
        dut.io.inputs(i).payload.keep #= 1
        dut.io.inputs(i).payload.last #= true
      }
      dut.io.output.ready #= true
      cd.forkStimulus(10)
      cd.waitSampling(5)

      dut.io.inputs(2).valid #= true
      dut.io.inputs(2).payload.data #= 0x30
      cd.waitSamplingWhere(dut.io.output.valid.toBoolean && dut.io.output.ready.toBoolean)
      assert(dut.io.output.payload.data.toBigInt == 0x30)
      cd.waitSampling()
      dut.io.inputs(2).valid #= false

      for (i <- 0 until 3) {
        dut.io.inputs(i).valid #= true
        dut.io.inputs(i).payload.data #= 0x10 + i
      }

      cd.waitSamplingWhere(dut.io.output.valid.toBoolean && dut.io.output.ready.toBoolean)
      assert(dut.io.output.payload.data.toBigInt == 0x10)
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

      val recv1 = fork { got1 = slave1.recv() }
      master.send(frame)
      // Join the sink rather than relying on a fixed cycle count: on a slow
      // host it has not appended the frame yet and got1 is still empty. The
      // settle afterwards is for the level check below, not for the data.
      recv1.join()
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

      val recv1 = fork { got1 = slave1.recv() }
      fork {
        cd.waitSamplingWhere(dut.io.input.valid.toBoolean && dut.io.input.ready.toBoolean)
        dut.io.select #= 0
      }
      master.send(frame)
      recv1.join()
      cd.waitSampling(5)

      assert(unsigned(got1) == unsigned(frame))
      assert(!dut.io.outputs(0).valid.toBoolean)
    }
  }

  test("AXI Stream demux samples select before a stalled first beat") {
    val cfg = axisCfg(8)

    simCfg.compile(new AxiStreamDemux(cfg, outputCount = 2)).doSim { dut =>
      val cd = dut.clockDomain

      dut.io.input.valid #= false
      dut.io.input.payload.data #= 0
      dut.io.input.payload.strb #= 1
      dut.io.input.payload.keep #= 1
      dut.io.input.payload.last #= true
      dut.io.outputs(0).ready #= false
      dut.io.outputs(1).ready #= true
      dut.io.select #= 0
      cd.forkStimulus(10)
      cd.waitSampling(5)

      dut.io.input.valid #= true
      dut.io.input.payload.data #= 0x5a
      cd.waitSampling(2)

      dut.io.select #= 1
      cd.waitSampling()

      assert(dut.io.outputs(0).valid.toBoolean)
      assert(!dut.io.outputs(1).valid.toBoolean)
      assert(!dut.io.input.ready.toBoolean)

      dut.io.outputs(0).ready #= true
      cd.waitSamplingWhere(dut.io.input.ready.toBoolean)
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
