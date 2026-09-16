// Copyright (c) 2026 Leonardo Capossio — bard0 design  hello@bard0.com
// SPDX-License-Identifier: MIT
package vexzero

import spinal.core._
import spinal.lib._

// ---------------------------------------------------------------------------
// VexZeroBoard  —  the bits every board wrapper needs
//
// There is more than one top level for the Arty (one reports a pass/fail
// verdict, one streams a benchmark's console), and they agree on how the
// design comes out of reset. That agreement lives here rather than being
// copied.
// ---------------------------------------------------------------------------
object VexZeroBoard {

  /** Clock domains for a board with one clock and an active-low reset button.
    *
    * The returned pair is (boot, system). Registers in the boot domain come out of FPGA
    * configuration already initialised — that is what BOOT reset means on Xilinx parts — so the
    * counter starts from a known value with no reset of its own, and the system domain stays in
    * reset until it has run out and the button is released.
    *
    * @param clock
    *   the board oscillator
    * @param buttonN
    *   reset button, asserted low, asynchronous
    * @param frequency
    *   what `clock` actually runs at, for the UART divider and for timing constraints derived from
    *   the design
    * @param holdCycles
    *   how long to keep the system in reset after configuration
    */
  def domains(
    clock: Bool,
    buttonN: Bool,
    frequency: HertzNumber,
    holdCycles: Int = 256
  ): (ClockDomain, ClockDomain) = {
    require(holdCycles >= 2, "the reset hold must outlast the button synchroniser")

    val boot = ClockDomain(
      clock = clock,
      config = ClockDomainConfig(clockEdge = RISING, resetKind = BOOT),
      frequency = FixedFrequency(frequency)
    )

    val systemResetN = boot on {
      val button  = BufferCC(buttonN, init = False)
      val counter = Reg(UInt(log2Up(holdCycles) bits)) init (0)
      when(counter =/= holdCycles - 1) { counter := counter + 1 }
      when(!button) { counter := 0 }
      RegNext(counter === holdCycles - 1) init (False)
    }

    val system = ClockDomain(
      clock = clock,
      reset = systemResetN,
      config = ClockDomainConfig(
        clockEdge = RISING,
        resetKind = SYNC,
        resetActiveLevel = LOW
      ),
      frequency = FixedFrequency(frequency)
    )

    (boot, system)
  }
}
