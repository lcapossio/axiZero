// Copyright (c) 2026 Leonardo Capossio — bard0 design  hello@bard0.com
// SPDX-License-Identifier: MIT
package vexzero

import spinal.core._
import spinal.lib._
import spinal.lib.com.uart._

// ---------------------------------------------------------------------------
// VexZeroArty  —  board wrapper that runs VexZeroSoc on an Arty A7-100T
//
// The SoC publishes its results on wires; a board has no wires to a test
// runner, so this wrapper checks them in hardware and reports the verdict two
// ways:
//
//   LEDs     LD4 done · LD5 pass · LD6 fail · LD7 heartbeat (~1.5 Hz)
//   UART     one 9-byte line every ~0.67 s, 115200 8N1 on the USB-UART
//
//              V Z <verdict> <done> <result> <chars> <leds> <switches> \n
//
//            upper case = that check passed, lower case = it did not, and
//            the last byte is the switch nibble the firmware read back
//            over AXI4-Lite:
//              VZPDRCL5\n  everything passed, switches read back as 0x5
//              VZFdrcl0\n  the CPU never finished (still in reset, or hung)
//
// The line repeats forever so a reader can attach at any time — nothing is
// lost by opening the serial port after the bitstream is already running.
//
// The heartbeat matters on its own: if LD7 is dark the design is not being
// clocked or is held in reset, which is a different fault from a failing test.
// ---------------------------------------------------------------------------
class VexZeroArty(
  socConfig: VexZeroSocConfig = VexZeroSocConfig(switchWidth = 4),
  clkFrequency: HertzNumber = 100 MHz,
  baudRate: HertzNumber = 115200 Hz,
  /** Report period, as a counter width: one line every 2^n clocks. The default is ~0.67 s on a 100
    * MHz board; the simulation shortens it so a test does not have to wait out a hardware-sized
    * interval.
    */
  reportPeriodBits: Int = 26
) extends Component {

  val io = new Bundle {
    val sys_clk      = in Bool ()
    val ck_rst       = in Bool ()  // push button, active low
    val sw           = in Bits (4 bits)
    val led          = out Bits (4 bits)
    val uart_rxd_out = out Bool () // FPGA TX → PC RX
  }
  noIoPrefix()

  // ── Reset generation ─────────────────────────────────────────────────────
  // bootDomain is not private: a simulation drives the board clock through it.
  val (bootDomain, systemDomain) =
    VexZeroBoard.domains(io.sys_clk, io.ck_rst, clkFrequency)

  val system = new ClockingArea(systemDomain) {

    val soc = new VexZeroSoc(socConfig)
    soc.io.switches := BufferCC(io.sw)

    val done = soc.io.status === B(Firmware.doneMarker, 32 bits)

    // ── Check 1: the value the firmware computed ─────────────────────────
    // result = Σ RAM words + switches. Hold the switch sample until the
    // firmware is done, so flipping a switch afterwards cannot fake a
    // failure — the firmware read them once, early.
    val switchesAtBoot = Reg(Bits(socConfig.switchWidth bits)) init (0)
    when(!done) { switchesAtBoot := soc.io.switches }

    val expectedResult =
      U(Firmware.checksum, 32 bits) + switchesAtBoot.asUInt.resize(32 bits)
    val resultOk = soc.io.result.asUInt === expectedResult

    // ── Check 2: the character stream ────────────────────────────────────
    val expectedChars = Vec(Firmware.chars.map(c => B(c.toInt, 8 bits)))
    val charIndex     = Reg(UInt(2 bits)) init (0)
    val charSeen      = Reg(Bool()) init (True)
    when(soc.io.charOut.valid) {
      when(charIndex === Firmware.chars.length) {
        charSeen := False // more characters than the program emits
      } otherwise {
        when(soc.io.charOut.payload =/= expectedChars(charIndex)) {
          charSeen := False
        }
        charIndex := charIndex + 1
      }
    }
    val charsOk = charSeen && charIndex === Firmware.chars.length

    // ── Check 3: the GPIO LED register the firmware wrote ────────────────
    val ledsOk =
      soc.io.leds === B(
        Firmware.checksum & ((1L << socConfig.ledWidth) - 1),
        socConfig.ledWidth bits
      )

    val pass = done && resultOk && charsOk && ledsOk

    // ── LEDs ─────────────────────────────────────────────────────────────
    val heartbeat = Reg(UInt(26 bits)) init (0)
    heartbeat := heartbeat + 1

    io.led(0) := done
    io.led(1) := pass
    io.led(2) := done && !pass
    io.led(3) := heartbeat.msb

    // ── UART report ──────────────────────────────────────────────────────
    def verdict(ok: Bool, yes: Char, no: Char): Bits =
      ok ? B(yes.toInt, 8 bits) | B(no.toInt, 8 bits)

    // The switch nibble goes out too, because it is the condition the
    // result check ran under: result = checksum + switches, so with every
    // switch down a Lite read that always returned zero would pass. A
    // non-zero nibble in the line says the read path returned real pins.
    val hexDigits = Vec("0123456789ABCDEF".map(c => B(c.toInt, 8 bits)))
    val swHex     = hexDigits(switchesAtBoot.asUInt.resize(4 bits))

    val report = Vec(
      B('V'.toInt, 8 bits),
      B('Z'.toInt, 8 bits),
      verdict(pass, 'P', 'F'),
      verdict(done, 'D', 'd'),
      verdict(resultOk, 'R', 'r'),
      verdict(charsOk, 'C', 'c'),
      verdict(ledsOk, 'L', 'l'),
      swHex,
      B('\n'.toInt, 8 bits)
    )

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

    // Latch the whole line when transmission starts, so a check that changes
    // mid-line cannot produce a half-old, half-new report.
    val lineTimer  = Reg(UInt(reportPeriodBits bits)) init (0)
    val lineActive = RegInit(False)
    val lineIndex  = Reg(UInt(log2Up(report.length) bits)) init (0)
    val lineBytes  = Reg(Vec(Bits(8 bits), report.length))

    lineTimer := lineTimer + 1
    when(lineTimer === lineTimer.maxValue && !lineActive) {
      lineActive := True
      lineIndex  := 0
      lineBytes  := report
    }

    uartCtrl.io.write.valid   := lineActive
    uartCtrl.io.write.payload := lineBytes(lineIndex)
    when(uartCtrl.io.write.fire) {
      lineIndex := lineIndex + 1
      when(lineIndex === report.length - 1) { lineActive := False }
    }
  }
}
