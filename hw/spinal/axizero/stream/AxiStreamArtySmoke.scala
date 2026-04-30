// Copyright (c) 2026 Leonardo Capossio - bard0 design  hello@bard0.com
// SPDX-License-Identifier: MIT
package axizero.stream

import spinal.core._
import spinal.lib.bus.amba4.axis._

/** Self-running AXI4-Stream smoke test for the Arty A7 hardware flow.
  *
  * Three sources send multi-beat frames through arbitration, buffering, register slicing, 32-to-8
  * and 8-to-32 width conversion, packet demuxing, broadcast fanout, and deliberate sink
  * backpressure. A sticky 32-bit status word is exposed to software through an AXI GPIO input.
  */
class AxiStreamArtySmoke extends Component {
  val io = new Bundle {
    val status = out Bits (32 bits)
  }

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

  private val wideCfg = axisCfg(4)
  private val byteCfg = axisCfg(1)

  private val src0 = Axi4Stream(wideCfg)
  private val src1 = Axi4Stream(wideCfg)
  private val src2 = Axi4Stream(wideCfg)

  private val src0Sent = RegInit(False)
  private val src1Sent = RegInit(False)
  private val src2Sent = RegInit(False)
  private val src0Beat = RegInit(False)
  private val src1Beat = RegInit(False)
  private val src2Beat = RegInit(False)

  src0.valid        := !src0Sent
  src0.payload.data := Mux(src0Beat, B(BigInt("17161514", 16), 32 bits), B(BigInt("13121110", 16), 32 bits))
  src0.payload.strb := B"4'b1111"
  src0.payload.keep := B"4'b1111"
  src0.payload.last := src0Beat
  when(src0.fire) {
    when(src0Beat) {
      src0Sent := True
    } otherwise {
      src0Beat := True
    }
  }

  src1.valid        := !src1Sent
  src1.payload.data := Mux(src1Beat, B(BigInt("27262524", 16), 32 bits), B(BigInt("23222120", 16), 32 bits))
  src1.payload.strb := B"4'b1111"
  src1.payload.keep := B"4'b1111"
  src1.payload.last := src1Beat
  when(src1.fire) {
    when(src1Beat) {
      src1Sent := True
    } otherwise {
      src1Beat := True
    }
  }

  src2.valid        := !src2Sent
  src2.payload.data := Mux(src2Beat, B(BigInt("37363534", 16), 32 bits), B(BigInt("33323130", 16), 32 bits))
  src2.payload.strb := B"4'b1111"
  src2.payload.keep := B"4'b1111"
  src2.payload.last := src2Beat
  when(src2.fire) {
    when(src2Beat) {
      src2Sent := True
    } otherwise {
      src2Beat := True
    }
  }

  private val arb       = new AxiStreamArbMux(wideCfg, inputCount = 3)
  private val fifo      = new AxiStreamFifo(wideCfg, depth = 16)
  private val regSlice  = new AxiStreamRegSlice(wideCfg)
  private val unpack    = new AxiStreamWidthAdapter(wideCfg, byteCfg)
  private val demux     = new AxiStreamDemux(byteCfg, outputCount = 2)
  private val repack    = new AxiStreamWidthAdapter(byteCfg, wideCfg)
  private val broadcast = new AxiStreamBroadcaster(wideCfg, outputCount = 2)

  arb.io.inputs(0) <> src0
  arb.io.inputs(1) <> src1
  arb.io.inputs(2) <> src2
  fifo.io.input <> arb.io.output
  regSlice.io.input <> fifo.io.output
  unpack.io.input <> regSlice.io.output

  private val packetIndex = RegInit(U(0, 2 bits))

  demux.io.input <> unpack.io.output
  demux.io.select := (packetIndex === 1).asUInt.resized
  when(demux.io.input.fire && demux.io.input.payload.last) {
    packetIndex := packetIndex + 1
  }

  demux.io.outputs(0).ready := True
  repack.io.input <> demux.io.outputs(1)
  broadcast.io.input <> repack.io.output
  private val stallCounter = RegInit(U(0, 2 bits))
  stallCounter := stallCounter + 1
  broadcast.io.outputs(0).ready := True
  broadcast.io.outputs(1).ready := stallCounter =/= 0

  private def sumWideBytes(data: Bits): UInt =
    data(7 downto 0).asUInt.resize(12) +
      data(15 downto 8).asUInt.resize(12) +
      data(23 downto 16).asUInt.resize(12) +
      data(31 downto 24).asUInt.resize(12)

  private val demux0Bytes      = RegInit(U(0, 8 bits))
  private val demux1Bytes      = RegInit(U(0, 8 bits))
  private val demux0Frames     = RegInit(U(0, 4 bits))
  private val demux1Frames     = RegInit(U(0, 4 bits))
  private val bcast0Beats      = RegInit(U(0, 4 bits))
  private val bcast1Beats      = RegInit(U(0, 4 bits))
  private val bcast0Frames     = RegInit(U(0, 4 bits))
  private val bcast1Frames     = RegInit(U(0, 4 bits))
  private val demux0Sum        = RegInit(U(0, 12 bits))
  private val demux1Sum        = RegInit(U(0, 12 bits))
  private val bcast0Sum        = RegInit(U(0, 12 bits))
  private val bcast1Sum        = RegInit(U(0, 12 bits))
  private val backpressureSeen = RegInit(False)
  private val timeout          = RegInit(U(0, 12 bits))

  when(demux.io.outputs(0).fire) {
    demux0Bytes := demux0Bytes + 1
    demux0Sum   := demux0Sum + demux.io.outputs(0).payload.data.asUInt.resized
    when(demux.io.outputs(0).payload.last) {
      demux0Frames := demux0Frames + 1
    }
  }

  when(demux.io.outputs(1).fire) {
    demux1Bytes := demux1Bytes + 1
    demux1Sum   := demux1Sum + demux.io.outputs(1).payload.data.asUInt.resized
    when(demux.io.outputs(1).payload.last) {
      demux1Frames := demux1Frames + 1
    }
  }

  when(broadcast.io.outputs(0).fire) {
    bcast0Beats := bcast0Beats + 1
    bcast0Sum   := bcast0Sum + sumWideBytes(broadcast.io.outputs(0).payload.data)
    when(broadcast.io.outputs(0).payload.last) {
      bcast0Frames := bcast0Frames + 1
    }
  }

  when(broadcast.io.outputs(1).fire) {
    bcast1Beats := bcast1Beats + 1
    bcast1Sum   := bcast1Sum + sumWideBytes(broadcast.io.outputs(1).payload.data)
    when(broadcast.io.outputs(1).payload.last) {
      bcast1Frames := bcast1Frames + 1
    }
  }

  when(broadcast.io.input.valid && !broadcast.io.input.ready) {
    backpressureSeen := True
  }

  when(!timeout.andR) {
    timeout := timeout + 1
  }

  private val demux0BytesOk = demux0Bytes === 16
  private val demux1BytesOk = demux1Bytes === 8
  private val bcast0BeatsOk = bcast0Beats === 2
  private val bcast1BeatsOk = bcast1Beats === 2
  private val sumsOk =
    demux0Sum === U(0x238, 12 bits) &&
      demux1Sum === U(0x11c, 12 bits) &&
      bcast0Sum === U(0x11c, 12 bits) &&
      bcast1Sum === U(0x11c, 12 bits)
  private val framesOk =
    packetIndex === 3 &&
      demux0Frames === 2 &&
      demux1Frames === 1 &&
      bcast0Frames === 1 &&
      bcast1Frames === 1
  private val routeOk = demux0BytesOk && demux1BytesOk && framesOk
  private val pass =
    demux0BytesOk &&
      demux1BytesOk &&
      bcast0BeatsOk &&
      bcast1BeatsOk &&
      sumsOk &&
      framesOk &&
      backpressureSeen &&
      routeOk
  private val done = pass || timeout.andR
  private val fail = done && !pass

  io.status := B(0, 32 bits)
  io.status(0)             := done
  io.status(1)             := pass
  io.status(2)             := fail
  io.status(3)             := demux0BytesOk
  io.status(4)             := demux1BytesOk
  io.status(5)             := bcast0BeatsOk
  io.status(6)             := bcast1BeatsOk
  io.status(7)             := sumsOk
  io.status(8)             := framesOk
  io.status(9)             := backpressureSeen
  io.status(10)            := routeOk
  io.status(15 downto 11)  := packetIndex.asBits.resized
  io.status(23 downto 16)  := demux0Bytes.asBits
  io.status(31 downto 24)  := demux1Bytes.asBits
}
