// Copyright (c) 2026 Leonardo Capossio — bard0 design  hello@bard0.com
// SPDX-License-Identifier: MIT
package vexzero

import spinal.core._

// ---------------------------------------------------------------------------
// VexZeroChecks  —  the self test, judged in hardware
//
// The SoC publishes what the firmware did on wires: a done marker, a computed
// result, a character stream and the GPIO register it wrote. Deciding whether
// those are right is the same job on every board, so it lives here and each
// board wrapper only chooses how to report the answer — a serial line on the
// Arty, LEDs and a host reading over JTAG on the DE25-Nano.
//
// The checks are deliberately value-based. A crossbar that merely keeps the
// bus alive, returning zeros or stale data, fails every one of them.
// ---------------------------------------------------------------------------
case class VexZeroChecks(
  done: Bool,
  resultOk: Bool,
  charsOk: Bool,
  ledsOk: Bool,
  /** The switch nibble the firmware read back over AXI4-Lite, held from before it finished. */
  switchesAtBoot: Bits
) {

  /** Everything passed and the program actually finished. */
  def pass: Bool = done && resultOk && charsOk && ledsOk
}

object VexZeroChecks {

  /** Build the checks for a SoC running [[Firmware]].
    *
    * Must be called inside the SoC's clock domain — it registers the character stream as it goes
    * past, which is the only one of the four that cannot be re-read later.
    */
  def apply(soc: VexZeroSoc, cfg: VexZeroSocConfig): VexZeroChecks = {
    val done = soc.io.status === B(Firmware.doneMarker, 32 bits)

    // ── Check 1: the value the firmware computed ─────────────────────────
    // result = Σ RAM words + switches. Hold the switch sample until the
    // firmware is done, so flipping a switch afterwards cannot fake a
    // failure — the firmware read them once, early.
    val switchesAtBoot = Reg(Bits(cfg.switchWidth bits)) init (0)
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
        Firmware.checksum & ((1L << cfg.ledWidth) - 1),
        cfg.ledWidth bits
      )

    VexZeroChecks(done, resultOk, charsOk, ledsOk, switchesAtBoot)
  }
}
