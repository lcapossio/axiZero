// Copyright (c) 2026 Leonardo Capossio — bard0 design  hello@bard0.com
// SPDX-License-Identifier: MIT
package vexzero.sim

import org.scalatest.funsuite.AnyFunSuite
import scala.collection.mutable
import spinal.core._
import spinal.core.sim._
import vexzero._

// ---------------------------------------------------------------------------
// VexZeroSocSpec  —  boot a real RISC-V core through the axiZero crossbar
//
//   sbt vexZero/test
//
// The firmware (see vexzero.Firmware) fills and sums a block of on-chip RAM,
// reads and writes both AXI4-Lite peripherals, and finally publishes a done
// marker. Reaching the marker means instruction fetch, loads, stores and the
// full→Lite adapters all worked; the checked values pin down *what* was moved,
// so a crossbar that merely keeps the bus alive cannot pass.
// ---------------------------------------------------------------------------
class VexZeroSocSpec extends AnyFunSuite {

  private val spinalCfg = SpinalConfig(
    defaultConfigForClockDomains = ClockDomainConfig(
      clockEdge = RISING,
      resetKind = SYNC,
      resetActiveLevel = LOW
    )
  )

  private def simCfg = SimConfig.withConfig(spinalCfg)

  /** Plenty for a 37-instruction program on a 5-stage core with no caches. */
  private val timeoutCycles = 20000

  private val switchValue = 0x5a

  private def runBoot(socConfig: VexZeroSocConfig, name: String): Unit =
    simCfg.compile(new VexZeroSoc(socConfig)).doSim(name) { dut =>
      dut.io.switches #= switchValue
      dut.clockDomain.forkStimulus(10)

      val chars = mutable.ArrayBuffer[Char]()
      dut.clockDomain.onSamplings {
        if (dut.io.charOut.valid.toBoolean) chars += dut.io.charOut.payload.toInt.toChar
      }

      val timedOut = dut.clockDomain.waitSamplingWhere(timeoutCycles)(
        dut.io.status.toLong == Firmware.doneMarker
      )
      assert(
        !timedOut,
        s"firmware never wrote the done marker (status=0x${dut.io.status.toLong.toHexString})"
      )

      // result = Σ RAM words + switches — proves the RAM round trip and the
      // AXI4-Lite read path both delivered real data.
      val expectedResult = Firmware.checksum + switchValue
      assert(
        dut.io.result.toLong == expectedResult,
        s"result=${dut.io.result.toLong}, expected $expectedResult"
      )

      // LEDs hold the checksum before the switches were folded in.
      val expectedLeds = Firmware.checksum & ((1L << socConfig.ledWidth) - 1)
      assert(
        dut.io.leds.toLong == expectedLeds,
        s"leds=0x${dut.io.leds.toLong.toHexString}, expected 0x${expectedLeds.toHexString}"
      )

      assert(
        chars.toSeq == Firmware.chars,
        s"charOut stream was ${chars.map(_.toInt).mkString(",")}"
      )
    }

  test("boot firmware completes on the pipelined crossbar") {
    runBoot(VexZeroSocConfig(maxOutstanding = 4), "vexzero_pipelined")
  }

  test("boot firmware completes on the blocking crossbar") {
    runBoot(VexZeroSocConfig(maxOutstanding = 1), "vexzero_blocking")
  }

  test("the firmware image is a valid RV32I encoding of the documented program") {
    val cfg   = VexZeroSocConfig()
    val image = Firmware.image(cfg.ramBase, cfg.gpioBase, cfg.sysCtrlBase)

    assert(image.forall(w => w >= 0 && w <= 0xffffffffL), "instruction word out of range")
    // lui t0, 0x80001  →  0x80001000 into x5
    assert(image.head == 0x800012b7L, f"first instruction is 0x${image.head}%08X")
    // jal x0, 0  →  spin in place
    assert(image.last == 0x0000006fL, f"last instruction is 0x${image.last}%08X")
    assert(Firmware.checksum == 472, s"checksum constant drifted: ${Firmware.checksum}")
  }
}
