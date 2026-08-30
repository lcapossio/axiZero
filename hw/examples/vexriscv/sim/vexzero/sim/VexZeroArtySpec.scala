// Copyright (c) 2026 Leonardo Capossio — bard0 design  hello@bard0.com
// SPDX-License-Identifier: MIT
package vexzero.sim

import org.scalatest.funsuite.AnyFunSuite
import scala.collection.mutable
import spinal.core._
import spinal.core.sim._
import vexzero._

// ---------------------------------------------------------------------------
// VexZeroArtySpec  —  simulate the board wrapper, UART and all
//
//   sbt vexZero/test
//
// The Arty test has no way to read the SoC's status and result wires: the
// wrapper checks them on the FPGA and reports over the USB-UART, and the
// runner on the PC only ever sees that serial line. So the thing worth
// simulating is exactly that line — decoded from uart_rxd_out at the real
// 115200 8N1 the board will use, not from the internal signals feeding it.
//
// A Vivado build is a twenty-minute round trip; this is a two-minute one.
// ---------------------------------------------------------------------------
class VexZeroArtySpec extends AnyFunSuite {

  private val spinalCfg = SpinalConfig(
    defaultConfigForClockDomains = ClockDomainConfig(
      clockEdge = RISING,
      resetKind = SYNC,
      resetActiveLevel = LOW
    )
  )

  private def simCfg = SimConfig.withConfig(spinalCfg)

  private val bitCycles = UartRx.bitCycles(clockHz = 100000000L, baud = 115200L)

  test("the board wrapper reports every check passing over the UART") {
    // 2^15 clocks between lines: long enough for the firmware to finish,
    // short enough that the simulation is not waiting on a 0.67 s interval.
    simCfg.compile(new VexZeroArty(reportPeriodBits = 15)).doSim("vexzero_arty_uart") { dut =>
      // The board's only clock is sys_clk; the SoC's reset comes from the
      // wrapper's own counter, so nothing else has to be driven here.
      val cd = dut.bootDomain
      dut.io.sw #= 0x5
      dut.io.ck_rst #= true // reset button not pressed
      cd.forkStimulus(10)

      // The wrapper's own reset generator holds the SoC down for 256 clocks
      // after configuration, so the external domain is free-running here.
      // The last byte of the line is the switch nibble the firmware read
      // back over AXI4-Lite, so it pins the switch value too.
      val expected = "VZPDRCL5"
      val lines    = mutable.ArrayBuffer[String]()
      var pass     = false
      while (lines.length < 3 && !pass) {
        val line = UartRx.line(() => dut.io.uart_rxd_out.toBoolean, cd, bitCycles)
        lines += line
        if (line == expected) pass = true
      }

      assert(
        pass,
        s"expected $expected; saw ${lines.map("\"" + _ + "\"").mkString(", ")}"
      )

      // LD4/LD5 are what a human reads when there is no serial port attached:
      // done and pass lit, fail dark. LD7 is the free-running heartbeat, so it
      // is masked off rather than predicted.
      val leds = dut.io.led.toInt & 0x7
      assert(leds == 0x3, f"led=0x$leds%X, expected done and pass set with fail clear")
    }
  }
}
