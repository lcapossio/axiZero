// Copyright (c) 2026 Leonardo Capossio — bard0 design  hello@bard0.com
// SPDX-License-Identifier: MIT
package vexzero

import spinal.core._
import spinal.lib._
import spinal.lib.com.uart._

// ---------------------------------------------------------------------------
// VexZeroBenchArty  —  run a prebuilt RISC-V benchmark on the board and print it
//
// Where VexZeroArty checks a fixed self test and reports a verdict, this top
// level runs a program that reports for itself: Dhrystone prints its results,
// its cycle count and its DMIPS/MHz, and everything it prints comes out of the
// USB-UART verbatim. There is nothing to decode — a serial terminal shows the
// benchmark's own output.
//
//   LEDs   LD4 finished · LD5 exit code 0 · LD6 exit code non-zero · LD7 heartbeat
//   UART   the program's console, 115200 8N1
//
// The character path backpressures the whole way: a full FIFO stalls the store
// in the CPU rather than dropping a byte, so a slow line costs time but never
// a corrupted result line. Nothing prints inside a benchmark's timed loop, so
// that stall does not reach the measurement.
//
// The pin-out is the same as VexZeroArty's, so both share one XDC.
// ---------------------------------------------------------------------------

object VexZeroBenchArty {

  /** RV32I Dhrystone 2.1, prebuilt, from the pinned VexRiscv submodule.
    *
    * It links at 0x8000_0000 and talks to the console addresses VexRiscv's own regression testbench
    * implements, which is why [[VexZeroBenchIo]] answers at those addresses rather than at ones of
    * our choosing.
    */
  val dhrystoneHex = "third_party/VexRiscv/src/test/resources/hex/dhrystoneO3.hex"

  val ramBase: BigInt     = BigInt("80000000", 16)
  val benchIoBase: BigInt = BigInt("F00FF000", 16)

  /** Enough for the benchmark's text, bss and stack (it reaches 0x8000_6910). */
  val ramSize: BigInt = 32 KiB

  def socConfig(hexPath: String = dhrystoneHex): VexZeroSocConfig = VexZeroSocConfig(
    ramBase = ramBase,
    ramSize = ramSize,
    switchWidth = 4,
    benchIoBase = Some(benchIoBase),
    bootImage = HexImage.loadWords(hexPath, ramBase)
  )
}

class VexZeroBenchArty(
  socConfig: VexZeroSocConfig = VexZeroBenchArty.socConfig(),
  clkFrequency: HertzNumber = 100 MHz,
  baudRate: HertzNumber = 115200 Hz,
  /** Characters buffered between the CPU and the line. Small on purpose: the CPU is stalled by a
    * full FIFO, and stalling costs nothing here.
    */
  fifoDepth: Int = 64
) extends Component {

  val io = new Bundle {
    val sys_clk      = in Bool ()
    val ck_rst       = in Bool ()  // push button, active low
    val sw           = in Bits (4 bits)
    val led          = out Bits (4 bits)
    val uart_rxd_out = out Bool () // FPGA TX → PC RX
  }
  noIoPrefix()

  require(socConfig.benchIoBase.isDefined, "this top level needs a benchmark console in the SoC")

  // bootDomain is not private: a simulation drives the board clock through it.
  val (bootDomain, systemDomain) =
    VexZeroBoard.domains(io.sys_clk, io.ck_rst, clkFrequency)

  val system = new ClockingArea(systemDomain) {

    val soc = new VexZeroSoc(socConfig)
    soc.io.switches := BufferCC(io.sw)

    // ── Console → UART ───────────────────────────────────────────────────
    val uartCtrl = new UartCtrl(
      UartCtrlGenerics(
        dataWidthMax = 8,
        clockDividerWidth = 20,
        preSamplingSize = 1,
        samplingSize = 5,
        postSamplingSize = 2
      )
    )
    uartCtrl.io.config.setClockDivider(baudRate)
    uartCtrl.io.config.frame.dataLength := 7    // 8 data bits
    uartCtrl.io.config.frame.parity     := UartParityType.NONE
    uartCtrl.io.config.frame.stop       := UartStopType.ONE
    uartCtrl.io.writeBreak              := False
    uartCtrl.io.uart.rxd                := True // RX unused
    uartCtrl.io.read.ready              := True
    io.uart_rxd_out                     := uartCtrl.io.uart.txd

    uartCtrl.io.write << soc.io.bench.charOut.queue(fifoDepth)

    // ── LEDs ─────────────────────────────────────────────────────────────
    val done   = soc.io.bench.done
    val passed = done && soc.io.bench.exitCode === 0

    val heartbeat = Reg(UInt(26 bits)) init (0)
    heartbeat := heartbeat + 1

    io.led(0) := done
    io.led(1) := passed
    io.led(2) := done && !passed
    io.led(3) := heartbeat.msb
  }
}
