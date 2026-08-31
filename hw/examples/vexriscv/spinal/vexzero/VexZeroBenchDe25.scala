// Copyright (c) 2026 Leonardo Capossio — bard0 design  hello@bard0.com
// SPDX-License-Identifier: MIT
package vexzero

import spinal.core._
import spinal.lib._

// ---------------------------------------------------------------------------
// VexZeroBenchDe25  —  Dhrystone on the DE25-Nano, read out over JTAG
//
// The benchmark counterpart of VexZeroDe25, and the same trade: with no serial
// port on the board, the console cannot be pushed out, so the host pulls it in
// over the JTAG-to-AXI bridge. The characters wait in a buffer inside the
// console peripheral and the host drains them a read at a time.
//
// Nothing is lost if the host is slow, or absent. The console backpressures:
// a full buffer stalls the store in the CPU rather than dropping a character,
// exactly as a full UART FIFO does on the Arty. Dhrystone prints nothing
// inside its timed loop, so the stall cannot reach the measurement — the
// cycle count is the cycle count whether or not anyone is listening.
//
//   host ── USB-Blaster ──> M2 ─┐
//        VexRiscv IBus ── M0 ───┼─ AxiZeroMixedTop ── RAM / GPIO / sysctrl / console
//        VexRiscv DBus ── M1 ───┘
//
//   LEDR   LD0 finished · LD1 exit code 0 · LD2 exit code non-zero · LD3 heartbeat
//   KEY0   reset, active low
//
// Same pin-out as VexZeroDe25, so both share one QSF.
// ---------------------------------------------------------------------------

object VexZeroBenchDe25 {

  /** Characters buffered for the host.
    *
    * A whole Dhrystone run prints about 1.5 KB, so this does not hold the run's output — it holds
    * enough that the CPU rarely waits between the host's reads.
    */
  val consoleDepth = 1024

  def socConfig(hexPath: String = VexZeroBenchArty.dhrystoneHex): VexZeroSocConfig =
    VexZeroSocConfig(
      ramBase = VexZeroBenchArty.ramBase,
      ramSize = VexZeroBenchArty.ramSize,
      switchWidth = 4,
      benchIoBase = Some(VexZeroBenchArty.benchIoBase),
      benchHostDrain = consoleDepth,
      hostMaster = true,
      bootImage = HexImage.loadWords(hexPath, VexZeroBenchArty.ramBase)
    )
}

class VexZeroBenchDe25(
  socConfig: VexZeroSocConfig = VexZeroBenchDe25.socConfig(),
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
  require(socConfig.benchIoBase.isDefined, "this top level needs a benchmark console in the SoC")
  require(
    socConfig.benchHostDrain > 0,
    "with no UART on the board the host has to drain the console"
  )

  // bootDomain is not private: a simulation drives the board clock through it.
  val (bootDomain, systemDomain) =
    VexZeroBoard.domains(io.CLOCK1_50, io.KEY(0), clkFrequency)

  val system = new ClockingArea(systemDomain) {

    val soc = new VexZeroSoc(socConfig)
    soc.io.switches := BufferCC(io.SW)

    // ── The host, as a third bus master ──────────────────────────────────
    val jtag = new JtagAxiMaster(VexZeroSoc.masterCfg, vendor = IntelJtagAxi)
    soc.io.host << jtag.io.axi

    // ── LEDs ─────────────────────────────────────────────────────────────
    val done   = soc.io.bench.done
    val passed = done && soc.io.bench.exitCode === 0

    val heartbeat = Reg(UInt(25 bits)) init (0)
    heartbeat := heartbeat + 1

    val lit = Bits(8 bits)
    lit    := 0
    lit(0) := done
    lit(1) := passed
    lit(2) := done && !passed
    lit(3) := heartbeat.msb

    io.LEDR := (if (VexZeroDe25.ledsActiveLow) ~lit else lit)
  }
}
