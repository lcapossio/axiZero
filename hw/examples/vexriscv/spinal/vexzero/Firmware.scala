// Copyright (c) 2026 Leonardo Capossio — bard0 design  hello@bard0.com
// SPDX-License-Identifier: MIT
package vexzero

import Rv32._

// ---------------------------------------------------------------------------
// Firmware  —  the boot image preloaded into the SoC's on-chip RAM
//
// It exercises every path through the interconnect that a real SoC uses:
//
//   1. instruction fetch          IBus  → crossbar → RAM        (full AXI4)
//   2. data write / read-back     DBus  → crossbar → RAM        (full AXI4)
//   3. peripheral write           DBus  → crossbar → GPIO       (AXI4-Lite)
//   4. peripheral read            DBus  → crossbar → GPIO       (AXI4-Lite)
//   5. peripheral write / read    DBus  → crossbar → SysCtrl    (AXI4-Lite)
//
// Program
// ───────
//   fill  RAM[data + 4i] = 3i + 7        for i in 0..15
//   sum   checksum = Σ RAM[data + 4i]     → expected 472
//   gpio  led    = checksum               (low bits visible on io.leds)
//   gpio  result = checksum + switches    (proves the Lite read path)
//   char  emit 'O', 'K', '\n' on io.charOut
//   ram   RAM[data + 64] = cycle counter  (Lite read → full-AXI4 write)
//   done  status = 0xC0DE, then spin
//
// The test waits for status == doneMarker and then checks result / leds /
// the character stream.
// ---------------------------------------------------------------------------
object Firmware {

  /** Number of words the fill/sum loops touch. */
  val wordCount = 16

  /** Σ (3i + 7) for i in 0 until wordCount. */
  val checksum: Long = (0 until wordCount).map(i => 3L * i + 7L).sum

  /** Written to SysCtrl.status once every other step has completed. */
  val doneMarker: Long = 0xc0deL

  /** Characters the firmware pushes out of SysCtrl.charOut, in order. */
  val chars: Seq[Char] = Seq('O', 'K', '\n')

  /** Byte offset inside the RAM where the fill/sum loops keep their data. */
  val dataOffset: Int = 0x1000

  /** Byte offset inside the RAM where the sampled cycle count is stored. */
  val cycleOffset: Int = dataOffset + 64

  /** Assemble the boot image for a given memory map.
    *
    * All three bases must be 4 KiB aligned so that a bare `lui` reaches them.
    */
  def image(ramBase: BigInt, gpioBase: BigInt, sysCtrlBase: BigInt): Seq[Long] = {
    val dataBase = ramBase + dataOffset

    // Register allocation
    //   t0 data pointer   t1 loop index   t2 checksum   a0 loop bound
    //   a1 value          a2 address      a3 scratch    a4 GPIO base
    //   a5 SysCtrl base   a6 scratch      a7 cycle count
    val fillLoop = 3  // index of the first instruction of the fill loop
    val fillEnd  = 10 // index of the fill loop's branch
    val sumLoop  = 13
    val sumEnd   = 18
    val spin     = 36

    // The index map below is hand maintained; these pin the two things a
    // careless edit would silently break.
    require(chars.length == 3, "the program emits exactly three characters")
    // `lui` + `addi` only reconstructs doneMarker while its low 12 bits are
    // positive; addi sign-extends, so bit 11 would need the lui half bumped.
    require(
      (doneMarker & 0x800L) == 0 && doneMarker < 0x100000000L,
      f"doneMarker 0x$doneMarker%X needs a sign-extension fixup in the lui/addi pair"
    )

    val program = Seq(
      /* 0  */ lui(t0, hi20(dataBase)),
      /* 1  */ addi(t1, zero, 0),
      /* 2  */ addi(a0, zero, wordCount),
      // fill: RAM[t0 + 4i] = 3i + 7
      /* 3  */ slli(a1, t1, 1),
      /* 4  */ add(a1, a1, t1),
      /* 5  */ addi(a1, a1, 7),
      /* 6  */ slli(a2, t1, 2),
      /* 7  */ add(a2, a2, t0),
      /* 8  */ sw(a1, a2, 0),
      /* 9  */ addi(t1, t1, 1),
      /* 10 */ bne(t1, a0, (fillLoop - fillEnd) * 4),
      /* 11 */ addi(t1, zero, 0),
      /* 12 */ addi(t2, zero, 0),
      // sum: checksum += RAM[t0 + 4i]
      /* 13 */ slli(a2, t1, 2),
      /* 14 */ add(a2, a2, t0),
      /* 15 */ lw(a3, a2, 0),
      /* 16 */ add(t2, t2, a3),
      /* 17 */ addi(t1, t1, 1),
      /* 18 */ bne(t1, a0, (sumLoop - sumEnd) * 4),
      // GPIO: led = checksum, then checksum += switches
      /* 19 */ lui(a4, hi20(gpioBase)),
      /* 20 */ sw(t2, a4, 0),
      /* 21 */ lw(a3, a4, 4),
      /* 22 */ add(t2, t2, a3),
      // SysCtrl: emit "OK\n"
      /* 23 */ lui(a5, hi20(sysCtrlBase)),
      /* 24 */ addi(a6, zero, chars(0).toInt),
      /* 25 */ sw(a6, a5, 4),
      /* 26 */ addi(a6, zero, chars(1).toInt),
      /* 27 */ sw(a6, a5, 4),
      /* 28 */ addi(a6, zero, chars(2).toInt),
      /* 29 */ sw(a6, a5, 4),
      // Lite read → full-AXI4 write: park the cycle counter in RAM
      /* 30 */ lw(a7, a5, 0),
      /* 31 */ sw(a7, t0, cycleOffset - dataOffset),
      // Publish the result, then the done marker
      /* 32 */ sw(t2, a5, 12),
      /* 33 */ lui(a6, (doneMarker >> 12).toInt),
      /* 34 */ addi(a6, a6, (doneMarker & 0xfff).toInt),
      /* 35 */ sw(a6, a5, 8),
      /* 36 */ jal(zero, 0)
    )

    require(program.length == spin + 1, s"firmware index map is stale (${program.length} words)")
    program
  }
}
