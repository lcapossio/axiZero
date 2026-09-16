// Copyright (c) 2026 Leonardo Capossio — bard0 design  hello@bard0.com
// SPDX-License-Identifier: MIT
package vexzero

// ---------------------------------------------------------------------------
// Rv32  —  a hand encoder for the RV32I subset the boot firmware needs
//
// The example's firmware is assembled here rather than by a RISC-V toolchain
// so that `sbt vexZero/test` and the Verilog generator run on a plain JDK,
// with no cross compiler to install and no binary blob tracked in git.
//
// Field layouts (RISC-V unprivileged spec, chapter 2.3):
//   R  funct7[31:25] rs2[24:20] rs1[19:15] funct3[14:12] rd[11:7] op[6:0]
//   I  imm[31:20]              rs1[19:15] funct3[14:12] rd[11:7] op[6:0]
//   S  imm[31:25] rs2[24:20]   rs1[19:15] funct3[14:12] imm[11:7] op[6:0]
//   B  imm12[31] imm10_5[30:25] rs2 rs1 funct3 imm4_1[11:8] imm11[7] op
//   U  imm[31:12]                                       rd[11:7] op[6:0]
//   J  imm20[31] imm10_1[30:21] imm11[20] imm19_12[19:12] rd[11:7] op[6:0]
// ---------------------------------------------------------------------------
object Rv32 {

  // ── Register numbers (ABI names) ─────────────────────────────────────────
  val zero = 0
  val ra   = 1
  val sp   = 2
  val t0   = 5
  val t1   = 6
  val t2   = 7
  val a0   = 10
  val a1   = 11
  val a2   = 12
  val a3   = 13
  val a4   = 14
  val a5   = 15
  val a6   = 16
  val a7   = 17

  private val mask32 = 0xffffffffL

  private def bits(value: Long, hi: Int, lo: Int): Long =
    (value >> lo) & ((1L << (hi - lo + 1)) - 1)

  private def checkReg(r: Int): Int = {
    require(r >= 0 && r < 32, s"register index out of range: $r")
    r
  }

  private def checkSigned(imm: Int, width: Int): Long = {
    val lim = 1 << (width - 1)
    require(imm >= -lim && imm < lim, s"immediate $imm does not fit in $width signed bits")
    imm.toLong & ((1L << width) - 1)
  }

  // ── Formats ──────────────────────────────────────────────────────────────
  private def rType(funct7: Int, rs2: Int, rs1: Int, funct3: Int, rd: Int, op: Int): Long =
    ((funct7.toLong << 25) | (checkReg(rs2).toLong << 20) | (checkReg(rs1).toLong << 15) |
      (funct3.toLong << 12) | (checkReg(rd).toLong << 7) | op.toLong) & mask32

  private def iType(imm: Int, rs1: Int, funct3: Int, rd: Int, op: Int): Long = {
    val i = checkSigned(imm, 12)
    ((i << 20) | (checkReg(rs1).toLong << 15) | (funct3.toLong << 12) |
      (checkReg(rd).toLong << 7) | op.toLong) & mask32
  }

  private def sType(imm: Int, rs2: Int, rs1: Int, funct3: Int, op: Int): Long = {
    val i = checkSigned(imm, 12)
    ((bits(i, 11, 5) << 25) | (checkReg(rs2).toLong << 20) | (checkReg(rs1).toLong << 15) |
      (funct3.toLong << 12) | (bits(i, 4, 0) << 7) | op.toLong) & mask32
  }

  private def bType(imm: Int, rs2: Int, rs1: Int, funct3: Int, op: Int): Long = {
    require((imm & 1) == 0, s"branch offset $imm must be even")
    val i = checkSigned(imm, 13)
    ((bits(i, 12, 12) << 31) | (bits(i, 10, 5) << 25) | (checkReg(rs2).toLong << 20) |
      (checkReg(rs1).toLong << 15) | (funct3.toLong << 12) | (bits(i, 4, 1) << 8) |
      (bits(i, 11, 11) << 7) | op.toLong) & mask32
  }

  private def uType(imm20: Int, rd: Int, op: Int): Long = {
    require(imm20 >= 0 && imm20 < (1 << 20), s"U-type immediate $imm20 out of range")
    ((imm20.toLong << 12) | (checkReg(rd).toLong << 7) | op.toLong) & mask32
  }

  private def jType(imm: Int, rd: Int, op: Int): Long = {
    require((imm & 1) == 0, s"jump offset $imm must be even")
    val i = checkSigned(imm, 21)
    ((bits(i, 20, 20) << 31) | (bits(i, 10, 1) << 21) | (bits(i, 11, 11) << 20) |
      (bits(i, 19, 12) << 12) | (checkReg(rd).toLong << 7) | op.toLong) & mask32
  }

  // ── Instructions ─────────────────────────────────────────────────────────
  def lui(rd: Int, imm20: Int): Long          = uType(imm20, rd, 0x37)
  def addi(rd: Int, rs1: Int, imm: Int): Long = iType(imm, rs1, 0x0, rd, 0x13)
  def slli(rd: Int, rs1: Int, shamt: Int): Long = {
    require(shamt >= 0 && shamt < 32, s"shift amount $shamt out of range")
    iType(shamt, rs1, 0x1, rd, 0x13)
  }
  def add(rd: Int, rs1: Int, rs2: Int): Long  = rType(0x00, rs2, rs1, 0x0, rd, 0x33)
  def lw(rd: Int, rs1: Int, off: Int): Long   = iType(off, rs1, 0x2, rd, 0x03)
  def sw(rs2: Int, rs1: Int, off: Int): Long  = sType(off, rs2, rs1, 0x2, 0x23)
  def bne(rs1: Int, rs2: Int, off: Int): Long = bType(off, rs2, rs1, 0x1, 0x63)
  def jal(rd: Int, off: Int): Long            = jType(off, rd, 0x6f)

  /** Upper 20 bits for `lui`, given a 4 KiB-aligned absolute address. */
  def hi20(address: BigInt): Int = {
    require((address & 0xfff) == 0, f"address 0x$address%X must be 4 KiB aligned for a bare lui")
    ((address >> 12) & 0xfffff).toInt
  }
}
