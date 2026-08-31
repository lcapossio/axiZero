// Copyright (c) 2026 Leonardo Capossio — bard0 design  hello@bard0.com
// SPDX-License-Identifier: MIT
package vexzero

import spinal.core._
import spinal.lib._

// ---------------------------------------------------------------------------
// VexZeroDe25  —  the example SoC on a Terasic DE25-Nano (Agilex 5)
//
// Same SoC, same crossbar, a different board and a different way of talking to
// it. The Arty reports over a USB-UART; this board has none, and its only link
// to a host is the on-board USB-Blaster. So instead of the design pushing a
// report out, the host reaches in: fpgacapZero's JTAG-to-AXI bridge joins the
// crossbar as a third master and reads the registers the firmware wrote.
//
// That makes the report path part of what is being tested rather than a way
// around it. Every value the runner checks arrives through the interconnect,
// arbitrated against a CPU that is still fetching out of the same RAM.
//
//   host ── USB-Blaster ──> M2 ─┐
//        VexRiscv IBus ── M0 ───┼─ AxiZeroMixedTop ── RAM / GPIO / sysctrl
//        VexRiscv DBus ── M1 ───┘
//
//   LEDR   LD0 done · LD1 pass · LD2 fail · LD3 heartbeat  (active low)
//   KEY0   reset, active low
//
// The board also judges itself on the LEDs, using the same checks the Arty
// reports over its serial line, so a board with no cable attached still says
// something a person can read. What the host verifies independently is the
// evidence underneath: the done marker, the computed result, the GPIO
// register and the switches, each read back over AXI.
//
// Board I/O is per the Terasic DE25-Nano manual — one 50 MHz clock, two
// buttons, four switches, eight LEDs — and the QSF pins all of it down.
// ---------------------------------------------------------------------------

object VexZeroDe25 {

  /** The board's clock. Half the Arty's; nothing in the design depends on the rate. */
  val clockFrequency: HertzNumber = 50 MHz

  /** LEDR sinks current on this board, so a low output lights the LED. */
  val ledsActiveLow = true

  /** The self-test SoC, plus the host master the report travels over. */
  def socConfig: VexZeroSocConfig = VexZeroSocConfig(switchWidth = 4, hostMaster = true)
}

class VexZeroDe25(
  socConfig: VexZeroSocConfig = VexZeroDe25.socConfig,
  clkFrequency: HertzNumber = VexZeroDe25.clockFrequency
) extends Component {

  val io = new Bundle {
    val CLOCK1_50 = in Bool ()
    val KEY       = in Bits (2 bits)  // push buttons, active low
    val SW        = in Bits (4 bits)
    val LEDR      = out Bits (8 bits) // active low
  }
  noIoPrefix()

  require(socConfig.hostMaster, "the DE25-Nano reports over JTAG, so it needs the host master port")

  // KEY[0] is the reset button. bootDomain is not private: a simulation drives
  // the board clock through it.
  val (bootDomain, systemDomain) =
    VexZeroBoard.domains(io.CLOCK1_50, io.KEY(0), clkFrequency)

  val system = new ClockingArea(systemDomain) {

    val soc = new VexZeroSoc(socConfig)
    soc.io.switches := BufferCC(io.SW)

    // ── The host, as a third bus master ──────────────────────────────────
    val jtag = new JtagAxiMaster(VexZeroSoc.masterCfg, vendor = IntelJtagAxi)
    soc.io.host << jtag.io.axi

    // ── Verdict ──────────────────────────────────────────────────────────
    val checks = VexZeroChecks(soc, socConfig)

    val heartbeat = Reg(UInt(25 bits)) init (0)
    heartbeat := heartbeat + 1

    val lit = Bits(8 bits)
    lit    := 0
    lit(0) := checks.done
    lit(1) := checks.pass
    lit(2) := checks.done && !checks.pass
    lit(3) := heartbeat.msb

    io.LEDR := (if (VexZeroDe25.ledsActiveLow) ~lit else lit)
  }
}
