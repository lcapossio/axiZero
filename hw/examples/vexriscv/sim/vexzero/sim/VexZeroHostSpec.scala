// Copyright (c) 2026 Leonardo Capossio — bard0 design  hello@bard0.com
// SPDX-License-Identifier: MIT
package vexzero.sim

import org.scalatest.funsuite.AnyFunSuite
import spinal.core._
import spinal.core.sim._
import spinal.lib.bus.amba4.axi.Axi4
import vexzero._

// ---------------------------------------------------------------------------
// VexZeroHostSpec  —  the host reading the SoC over its third master port
//
// On the DE25-Nano the report does not leave the chip on a wire: the host
// becomes a bus master and reads the registers the firmware wrote. That path
// is worth proving here rather than on the board, because on the board it is
// also the only way to see anything, so a fault in it looks exactly like a
// fault in everything else.
//
// The JTAG bridge itself is a vendor primitive and cannot be simulated, but it
// is not what needs proving — it is a well-defined AXI4 master. What needs
// proving is the SoC with three masters on the crossbar: that the host's reads
// are arbitrated against a CPU which is still fetching, and that they return
// the values the CPU actually wrote. So the test drives the SoC's host port
// directly with the same transactions the bridge would issue.
// ---------------------------------------------------------------------------
class VexZeroHostSpec extends AnyFunSuite {

  private val spinalCfg = SpinalConfig(
    defaultConfigForClockDomains = ClockDomainConfig(
      clockEdge = RISING,
      resetKind = SYNC,
      resetActiveLevel = LOW
    )
  )

  private def simCfg = SimConfig.withConfig(spinalCfg)

  /** A single-beat AXI4 read on the host port, returning the data.
    *
    * Deliberately one transaction at a time: that is what the bridge does, and it is what makes a
    * constant ID enough for the pipelined crossbar to route the response.
    */
  private def hostRead(axi: Axi4, cd: ClockDomain, address: Long): Long = {
    axi.ar.valid #= true
    axi.ar.payload.addr #= address
    axi.ar.payload.id #= 0
    axi.ar.payload.len #= 0
    axi.ar.payload.size #= 2  // 4 bytes
    axi.ar.payload.burst #= 1 // INCR
    axi.r.ready #= true

    cd.waitSamplingWhere(axi.ar.ready.toBoolean)
    axi.ar.valid #= false

    cd.waitSamplingWhere(axi.r.valid.toBoolean)
    val data = axi.r.payload.data.toLong
    assert(axi.r.payload.resp.toInt == 0, f"read of 0x$address%08X answered with a bus error")
    axi.r.ready #= false
    data
  }

  private def hostWrite(axi: Axi4, cd: ClockDomain, address: Long, value: Long): Unit = {
    axi.aw.valid #= true
    axi.aw.payload.addr #= address
    axi.aw.payload.id #= 0
    axi.aw.payload.len #= 0
    axi.aw.payload.size #= 2
    axi.aw.payload.burst #= 1
    axi.w.valid #= true
    axi.w.payload.data #= value
    axi.w.payload.strb #= 0xf
    axi.w.payload.last #= true
    axi.b.ready #= true

    cd.waitSamplingWhere(axi.aw.ready.toBoolean)
    axi.aw.valid #= false
    cd.waitSamplingWhere(axi.w.ready.toBoolean)
    axi.w.valid #= false

    cd.waitSamplingWhere(axi.b.valid.toBoolean)
    assert(axi.b.payload.resp.toInt == 0, f"write to 0x$address%08X answered with a bus error")
    axi.b.ready #= false
  }

  /** Idle the port and let the design come out of reset before anything is issued.
    *
    * An AR driven while reset is still asserted is taken by the master port's register slice and
    * then wiped by the reset, so it is never answered and the read waits for a response that cannot
    * arrive. The real bridge cannot do this — it is held in reset alongside the fabric — but a
    * testbench can, and the failure looks exactly like a routing bug.
    */
  private def startHost(axi: Axi4, cd: ClockDomain): Unit = {
    idleHost(axi)
    cd.waitSampling(32)
  }

  private def idleHost(axi: Axi4): Unit = {
    axi.ar.valid #= false
    axi.aw.valid #= false
    axi.w.valid #= false
    axi.r.ready #= false
    axi.b.ready #= false
  }

  test("the host reads the firmware's verdict over the third master port") {
    val cfg = VexZeroSocConfig(switchWidth = 4, hostMaster = true)

    simCfg.compile(new VexZeroSoc(cfg)).doSim("vexzero_host_verdict") { dut =>
      SimTimeout(2000000)
      dut.clockDomain.forkStimulus(10)
      startHost(dut.io.host, dut.clockDomain)
      dut.io.switches #= 0x5

      // Let the firmware run to its done marker, the same way the board does.
      dut.clockDomain.waitSamplingWhere(
        dut.io.status.toLong == (Firmware.doneMarker & 0xffffffffL)
      )

      // Everything below arrives through the crossbar, from the host's port.
      val status = hostRead(dut.io.host, dut.clockDomain, (cfg.sysCtrlBase + 0x08).toLong)
      val result = hostRead(dut.io.host, dut.clockDomain, (cfg.sysCtrlBase + 0x0c).toLong)
      val leds   = hostRead(dut.io.host, dut.clockDomain, (cfg.gpioBase + 0x00).toLong)
      val sw     = hostRead(dut.io.host, dut.clockDomain, (cfg.gpioBase + 0x04).toLong)

      assert(
        status == (Firmware.doneMarker & 0xffffffffL),
        f"host read status 0x$status%08X, expected the done marker"
      )

      val expected = (Firmware.checksum + 0x5) & 0xffffffffL
      assert(
        result == expected,
        f"host read result 0x$result%08X, expected 0x$expected%08X (checksum + switches)"
      )

      // The register keeps the whole 32-bit word the firmware stored; only the
      // pins are truncated to ledWidth. The host sees the register, so it can
      // check more than a person looking at the board can.
      val expectedLeds = Firmware.checksum & 0xffffffffL
      assert(
        leds == expectedLeds,
        f"host read LED register 0x$leds%08X, expected 0x$expectedLeds%08X"
      )
      assert(sw == 0x5, f"host read switches 0x$sw%X, expected 0x5")

      // The RAM is on a different slave and a different port type; read one
      // word of the program back to prove the host reaches it too.
      val firstWord    = hostRead(dut.io.host, dut.clockDomain, cfg.ramBase.toLong)
      val expectedWord = Firmware.image(cfg.ramBase, cfg.gpioBase, cfg.sysCtrlBase).head
      assert(
        firstWord == expectedWord,
        f"host read 0x$firstWord%08X at the reset vector, expected 0x$expectedWord%08X"
      )

      println(f"  host saw status=0x$status%08X result=0x$result%08X leds=0x$leds%02X sw=0x$sw%X")
    }
  }

  test("the host and the CPU share the crossbar without disturbing each other") {
    val cfg = VexZeroSocConfig(switchWidth = 4, hostMaster = true)

    simCfg.compile(new VexZeroSoc(cfg)).doSim("vexzero_host_contention") { dut =>
      // Sharing the RAM slave with the host roughly halves what the CPU gets,
      // so the firmware takes noticeably longer here than it does alone.
      SimTimeout(20000000)
      dut.clockDomain.forkStimulus(10)
      startHost(dut.io.host, dut.clockDomain)
      dut.io.switches #= 0xa

      // Hammer the RAM from the host while the CPU is fetching out of it, so
      // every host read is arbitrated against instruction fetch. If the
      // crossbar mixed responses up between the two masters, either the host
      // would see wrong data or the firmware would never reach its marker.
      val image = Firmware.image(cfg.ramBase, cfg.gpioBase, cfg.sysCtrlBase)
      var reads = 0
      val done  = Firmware.doneMarker & 0xffffffffL
      while (dut.io.status.toLong != done) {
        val word = reads % image.length
        val got  = hostRead(dut.io.host, dut.clockDomain, (cfg.ramBase + word * 4).toLong)
        assert(
          got == image(word),
          f"host read 0x$got%08X at word $word while the CPU ran, expected 0x${image(word)}%08X"
        )
        reads += 1
        // A JTAG host cannot issue back-to-back AXI reads; leaving a gap keeps
        // the contention realistic rather than pathological.
        dut.clockDomain.waitSampling(8)
      }

      val expected = (Firmware.checksum + 0xa) & 0xffffffffL
      assert(
        dut.io.result.toLong == expected,
        "the firmware's result changed while the host was using the bus"
      )
      assert(reads > 20, s"only $reads host reads landed during the run — the test proved little")
      println(s"  $reads host reads interleaved with the CPU, all correct")
    }
  }

  test("the host drains the benchmark console over the bus") {
    val cfg = VexZeroBenchDe25.socConfig()

    simCfg.compile(new VexZeroSoc(cfg)).doSim("vexzero_host_console") { dut =>
      SimTimeout(200000000)
      dut.clockDomain.forkStimulus(10)
      startHost(dut.io.host, dut.clockDomain)
      dut.io.switches #= 0

      val drain   = (cfg.benchIoBase.get + VexZeroBenchIo.drainWord * 4).toLong
      val console = new StringBuilder

      // Drain the way the runner does: read until the buffer says empty, and
      // keep going until the program reports it has exited.
      while (!dut.io.bench.done.toBoolean || console.isEmpty) {
        val word = hostRead(dut.io.host, dut.clockDomain, drain)
        if ((word >> VexZeroBenchIo.drainValidBit & 1) == 1) console += (word & 0xff).toChar
        else dut.clockDomain.waitSampling(200)
      }
      // Whatever is still buffered after the exit register was written.
      var draining = true
      while (draining) {
        val word = hostRead(dut.io.host, dut.clockDomain, drain)
        if ((word >> VexZeroBenchIo.drainValidBit & 1) == 1) console += (word & 0xff).toChar
        else draining = false
      }

      val text = console.toString
      assert(
        text.contains("Dhrystone Benchmark"),
        s"the host drained ${text.length} characters and none of them were the banner:\n$text"
      )
      assert(
        dut.io.bench.exitCode.toLong == 0,
        s"the benchmark exited with ${dut.io.bench.exitCode.toLong}"
      )

      val compared = DhrystoneConsole.verify(text)
      println(f"  host drained ${text.length}%d characters, $compared%d self-checks all passing")
    }
  }
}
