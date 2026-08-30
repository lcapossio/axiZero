// Copyright (c) 2026 Leonardo Capossio — bard0 design  hello@bard0.com
// SPDX-License-Identifier: MIT
package vexzero

import java.nio.file.{Files, Paths}
import scala.collection.mutable
import scala.jdk.CollectionConverters._

// ---------------------------------------------------------------------------
// HexImage  —  read an Intel HEX file into a boot image
//
// The benchmark firmware is not assembled here the way Firmware is: it is a
// prebuilt RV32I binary that ships with the pinned VexRiscv submodule, in the
// Intel HEX format its own regression tests use. Reading it needs the four
// record types those files contain:
//
//   00  data                 payload bytes at (segment base + offset)
//   01  end of file
//   04  extended linear addr  payload is the upper 16 bits of the address
//   05  start linear addr     entry point; the reset vector covers this, so
//                             it is parsed for the checksum and then dropped
//
// Every line is :LLAAAATT<payload>CC with the checksum CC being the two's
// complement of the sum of every preceding byte. It is verified: a corrupt
// image would otherwise show up as a CPU that wanders off into nothing.
// ---------------------------------------------------------------------------
object HexImage {

  /** Bytes of an Intel HEX file, keyed by absolute address. */
  def loadBytes(path: String): Map[Long, Byte] = {
    val file = Paths.get(path)
    require(Files.isRegularFile(file), s"Intel HEX file not found: $path")

    val bytes   = mutable.Map.empty[Long, Byte]
    var segment = 0L
    var ended   = false

    for ((raw, index) <- Files.readAllLines(file).asScala.zipWithIndex) {
      val line              = raw.trim
      def fail(why: String) = sys.error(s"$path:${index + 1}: $why")

      if (line.nonEmpty) {
        if (ended) fail("record after the end-of-file record")
        if (line.head != ':') fail(s"record does not start with ':': $line")

        val digits = line.tail
        if (digits.length < 10 || digits.length % 2 != 0) fail(s"malformed record: $line")
        val raws = digits.grouped(2).map(pair => Integer.parseInt(pair, 16)).toArray

        val length = raws(0)
        if (raws.length != length + 5)
          fail(s"record length $length does not match ${raws.length - 5}")
        if (raws.sum % 256 != 0) fail("checksum mismatch")

        val offset  = (raws(1) << 8) | raws(2)
        val kind    = raws(3)
        val payload = raws.slice(4, 4 + length)

        kind match {
          case 0x00 =>
            for ((byte, i) <- payload.zipWithIndex)
              bytes(segment + offset + i) = byte.toByte
          case 0x01 => ended = true
          case 0x04 =>
            if (length != 2) fail("extended linear address record must carry two bytes")
            segment = ((payload(0).toLong << 8) | payload(1).toLong) << 16
          case 0x05  => // entry point; the SoC's reset vector decides where it starts
          case other => fail(f"unsupported record type 0x$other%02X")
        }
      }
    }

    if (!ended) sys.error(s"$path: no end-of-file record")
    bytes.toMap
  }

  /** Load an Intel HEX file as 32-bit little-endian words starting at `base`.
    *
    * Gaps read as zero, and the result is trimmed to the highest address the file touches, so the
    * caller decides how much RAM sits behind it.
    */
  def loadWords(path: String, base: BigInt): Seq[Long] = {
    val bytes = loadBytes(path)
    require(bytes.nonEmpty, s"$path holds no data records")

    val origin = base.toLong
    val lowest = bytes.keys.min
    require(
      lowest >= origin,
      f"$path starts at 0x$lowest%08X, below the image base 0x$origin%08X"
    )

    val wordCount = ((bytes.keys.max - origin) / 4 + 1).toInt
    Seq.tabulate(wordCount) { word =>
      val address = origin + word * 4L
      (0 until 4).foldLeft(0L) { (acc, byte) =>
        acc | ((bytes.getOrElse(address + byte, 0.toByte).toLong & 0xff) << (8 * byte))
      }
    }
  }
}
