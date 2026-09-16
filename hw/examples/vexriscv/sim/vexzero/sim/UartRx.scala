// Copyright (c) 2026 Leonardo Capossio — bard0 design  hello@bard0.com
// SPDX-License-Identifier: MIT
package vexzero.sim

import spinal.core.ClockDomain
import spinal.core.sim._

// ---------------------------------------------------------------------------
// UartRx  —  decode a serial line in simulation, the way the PC will
//
// Both board wrappers are only observable through their UART, so the tests
// read that line rather than the signals behind it. Decoding it here at the
// same framing the board uses is what makes a passing simulation mean the
// hardware will be readable.
// ---------------------------------------------------------------------------
object UartRx {

  /** Clocks per bit for SpinalHDL's UartCtrl.
    *
    * It divides the clock by (clk / baud / samplesPerBit) and then spends samplesPerBit of those
    * ticks on every bit, so the integer division has to be done in that order to land on the same
    * number the hardware uses.
    */
  def bitCycles(clockHz: Long, baud: Long, samplesPerBit: Int = 8): Int =
    ((clockHz / baud / samplesPerBit) * samplesPerBit).toInt

  /** Receive one 8N1 byte, LSB first, sampling in the middle of each bit. */
  def byte(line: () => Boolean, cd: ClockDomain, bitCycles: Int): Int = {
    while (line()) cd.waitSampling()           // wait out the idle-high line
    cd.waitSampling(bitCycles + bitCycles / 2) // into the middle of bit 0
    var value = 0
    for (bit <- 0 until 8) {
      if (line()) value |= 1 << bit
      cd.waitSampling(bitCycles)
    }
    value
  }

  /** Receive bytes up to and including a newline; the newline is dropped. */
  def line(read: () => Boolean, cd: ClockDomain, bitCycles: Int, maxBytes: Int = 32): String = {
    val text = new StringBuilder
    var done = false
    while (!done && text.length < maxBytes) {
      val c = byte(read, cd, bitCycles).toChar
      if (c == '\n') done = true else text += c
    }
    text.toString
  }
}
