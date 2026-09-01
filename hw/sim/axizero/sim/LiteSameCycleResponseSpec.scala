// Copyright (c) 2026 Leonardo Capossio
// SPDX-License-Identifier: MIT
package axizero.sim

import scala.collection.mutable

import org.scalatest.funsuite.AnyFunSuite
import spinal.core._
import spinal.core.sim._
import spinal.lib._
import spinal.lib.bus.amba4.axi.{Axi4, Axi4Config}
import axizero._

// ---------------------------------------------------------------------------
// LiteSameCycleResponseSpec — an AXI4-Lite slave that answers immediately
//
// AXI lets a slave assert RVALID in the same cycle it asserts ARREADY: the
// address handshake and the read data can complete together. Plenty of small
// register files do exactly that, because raising both from one register is
// the cheapest way to build one.
//
// Axi4FullToLiteAdapter used to return each response with an ID captured into
// a register on the address handshake. A register updates at the end of the
// cycle, so for a slave that answers in that same cycle the ID on R was still
// the previous transaction's. The pipelined crossbar routes responses back to
// masters by ID, so the answer did not reach the master that asked. Revert the
// fix and this test reports it exactly: master 1's read is answered to master 0,
// whose ID is the zero the register resets to.
//
// Two things had to line up for it to stay hidden, and every existing Lite
// test misses at least one: the crossbar has to be the pipelined one (the
// blocking path remembers which master it granted and never consults the ID),
// and the slave has to answer this fast (the other Lite slaves here hold READY
// combinationally and answer a cycle later).
// ---------------------------------------------------------------------------
class LiteSameCycleResponseSpec extends AnyFunSuite {

  private val spinalCfg = SpinalConfig(
    defaultConfigForClockDomains = ClockDomainConfig(
      clockEdge = RISING,
      resetKind = SYNC,
      resetActiveLevel = LOW
    )
  )

  private def simCfg = SimConfig.withConfig(spinalCfg)

  private val base = BigInt("F0000000", 16)
  private val size = BigInt(256)

  private val masterCfg = Axi4Config(addressWidth = 32, dataWidth = 32, idWidth = 1)
  private val liteCfg = Axi4Config(
    addressWidth = 32,
    dataWidth = 32,
    useId = false,
    useRegion = false,
    useBurst = false,
    useLock = false,
    useCache = false,
    useSize = false,
    useQos = false,
    useLen = false,
    useLast = false,
    useResp = true,
    useProt = true,
    useStrb = true
  )

  /** A register file that raises ARREADY and RVALID together, the way a small one does.
    *
    * Modelled on vtpgZero's `vtpgz_axil_regs`, which is where this behaviour was first met. Reads
    * return the address's low byte in the low half and a marker in the high half, so a response
    * delivered to the wrong master is recognisable rather than merely wrong.
    */
  private class SameCycleLiteSlave extends Component {
    val io = new Bundle { val axi = slave(Axi4(liteCfg)) }

    val arReady = RegInit(False)
    val rValid  = RegInit(False)
    val rData   = Reg(Bits(32 bits)) init (0)

    io.axi.ar.ready := arReady
    io.axi.r.valid  := rValid
    io.axi.r.data   := rData
    io.axi.r.resp   := 0

    // Both flags are set by the same assignment, so they rise on the same edge
    // and the response is on the bus in the cycle the address is accepted.
    when(!arReady && io.axi.ar.valid && !rValid) {
      arReady := True
      rValid  := True
      rData   := B"x5A5A0000" | io.axi.ar.addr(7 downto 0).asBits.resized
    } otherwise {
      arReady := False
      when(rValid && io.axi.r.ready) { rValid := False }
    }

    // Writes are accepted and discarded; this test is about the read path.
    val awReady = RegInit(False)
    val wReady  = RegInit(False)
    val bValid  = RegInit(False)
    io.axi.aw.ready := awReady
    io.axi.w.ready  := wReady
    io.axi.b.valid  := bValid
    io.axi.b.resp   := 0
    awReady         := !awReady && io.axi.aw.valid && !bValid
    wReady          := !wReady && io.axi.w.valid && !bValid
    when(io.axi.aw.fire) { bValid := True }.elsewhen(bValid && io.axi.b.ready) { bValid := False }
  }

  /** Two full masters and one such Lite slave behind the crossbar. */
  private class Dut extends Component {
    val io = new Bundle {
      val masters = Vec(slave(Axi4(masterCfg)), 2)
    }
    val fabric = new AxiZeroMixedTop(
      AxiZeroConfig(
        masters = Seq(MasterPort(masterCfg, FullAxi4), MasterPort(masterCfg, FullAxi4)),
        slaves = Seq(SlavePort(liteCfg, LiteAxi4, base, size)),
        // The pipelined crossbar is the one that routes responses by ID; the
        // blocking one remembers which master it granted and is immune, which
        // is half of why this went unnoticed.
        maxOutstanding = 4
      )
    )
    for (i <- 0 until 2) fabric.io.masters(i) << io.masters(i)
    val regs = new SameCycleLiteSlave
    regs.io.axi <> fabric.io.slaves(0)
  }

  test("a Lite slave that answers in the same cycle is answered to the right master") {
    simCfg.compile(new Dut).doSim("lite_same_cycle") { dut =>
      SimTimeout(200000)
      val cd = dut.clockDomain
      for (m <- dut.io.masters) {
        m.ar.valid #= false
        m.aw.valid #= false
        m.w.valid #= false
        m.r.ready #= true
        m.b.ready #= true
      }
      cd.forkStimulus(10)
      cd.waitSampling(8)

      // R beats are collected as they fire rather than polled afterwards. The
      // whole point of this slave is that its response can be valid in the very
      // cycle the address is accepted, and with R_READY held high that beat is
      // consumed on that same edge -- a loop that starts looking one cycle later
      // misses it and reports a hang that is the testbench's, not the fabric's.
      val answered = Array.fill(2)(mutable.Queue[Long]())
      cd.onSamplings {
        for (i <- 0 until 2) {
          val m = dut.io.masters(i)
          if (m.r.valid.toBoolean && m.r.ready.toBoolean) {
            answered(i).enqueue(m.r.payload.data.toLong)
          }
        }
      }

      /** Read from one master, and insist that master is the one that answers. */
      def readFrom(mi: Int, addr: Long): Long = {
        val m           = dut.io.masters(mi)
        val otherBefore = answered(1 - mi).size
        m.ar.valid #= true
        m.ar.payload.addr #= addr
        m.ar.payload.id #= 0
        m.ar.payload.len #= 0
        m.ar.payload.size #= 2
        m.ar.payload.burst #= 1
        cd.waitSamplingWhere(1000)(m.ar.ready.toBoolean)
        m.ar.valid #= false

        var left = 200
        while (answered(mi).isEmpty && left > 0) { cd.waitSampling(); left -= 1 }
        assert(
          answered(mi).nonEmpty,
          s"master $mi read 0x${addr.toHexString} and never got a response" +
            (if (answered(1 - mi).size > otherBefore)
               s"; master ${1 - mi} got one instead, so it was routed by a stale ID"
             else "")
        )
        answered(mi).dequeue()
      }

      // Master 0 is answered correctly even with the bug, because its expanded ID
      // is zero and so is the reset value of the register the response used.
      // Testing only this master proves nothing, which is the trap.
      val a = readFrom(0, (base + 0x10).toLong)
      assert(a == 0x5a5a0010L, f"master 0 read back 0x$a%08X, expected 0x5A5A0010")

      // Master 1 is where it shows: with the bug its response goes to master 0.
      val b = readFrom(1, (base + 0x24).toLong)
      assert(b == 0x5a5a0024L, f"master 1 read back 0x$b%08X, expected 0x5A5A0024")

      // And again, to catch an adapter that only works once.
      val c = readFrom(1, (base + 0x38).toLong)
      assert(
        c == 0x5a5a0038L,
        f"master 1 read back 0x$c%08X on its second read, expected 0x5A5A0038"
      )
    }
  }
}
