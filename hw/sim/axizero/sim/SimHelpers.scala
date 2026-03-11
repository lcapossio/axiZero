// Copyright (c) 2026 Leonardo Capossio — bard0 design  hello@bard0.com
// SPDX-License-Identifier: MIT
package axizero.sim

import spinal.core._
import spinal.core.sim._
import spinal.lib.bus.amba4.axi._
import scala.collection.mutable

// ---------------------------------------------------------------------------
// SimHelpers  —  AXI4 / AXI4-Lite simulation drivers and slave models
//
// Conventions
// ───────────
//   • Functions block the calling simulation thread until the AXI handshake
//     (or multi-phase transaction) completes.
//   • Call initMaster / initSlave once before starting the clock.
//   • All writes use sequential AW-then-W so sequential slave models work.
//   • spawnLiteSlave / spawnFullSlave fork persistent threads and return
//     the shared memory map for inspection.
//   • spawnFullSlave supports multi-beat bursts and optional back-pressure:
//       stallW = cycles slave holds W.ready low between beats
//       stallR = cycles slave holds R.valid low between beats
// ---------------------------------------------------------------------------
object SimHelpers {

  // ── Initialise ─────────────────────────────────────────────────────────────

  def initMaster(m: Axi4): Unit = {
    m.aw.valid #= false
    m.aw.addr  #= 0
    if (m.config.useProt)  m.aw.prot  #= 0
    if (m.config.useId)    m.aw.id    #= 0
    if (m.config.useLen)   m.aw.len   #= 0
    if (m.config.useSize)  m.aw.size  #= 0
    if (m.config.useBurst) m.aw.burst #= 1  // INCR
    if (m.config.useLock)  m.aw.lock  #= 0
    if (m.config.useCache) m.aw.cache #= 0
    if (m.config.useQos)   m.aw.qos   #= 0

    m.w.valid #= false
    m.w.data  #= 0
    if (m.config.useStrb) m.w.strb #= 0
    if (m.config.useLast) m.w.last #= false

    m.b.ready #= false

    m.ar.valid #= false
    m.ar.addr  #= 0
    if (m.config.useProt)  m.ar.prot  #= 0
    if (m.config.useId)    m.ar.id    #= 0
    if (m.config.useLen)   m.ar.len   #= 0
    if (m.config.useSize)  m.ar.size  #= 0
    if (m.config.useBurst) m.ar.burst #= 1
    if (m.config.useLock)  m.ar.lock  #= 0
    if (m.config.useCache) m.ar.cache #= 0
    if (m.config.useQos)   m.ar.qos   #= 0

    m.r.ready #= false
  }

  def initSlave(s: Axi4): Unit = {
    s.aw.ready #= false
    s.w.ready  #= false
    s.b.valid  #= false
    if (s.config.useResp) s.b.resp #= 0
    if (s.config.useId)   s.b.id   #= 0
    s.ar.ready #= false
    s.r.valid  #= false
    s.r.data   #= 0
    if (s.config.useResp) s.r.resp #= 0
    if (s.config.useId)   s.r.id   #= 0
    if (s.config.useLast) s.r.last #= false
  }

  // ── AXI4-Lite master driver ─────────────────────────────────────────────────

  def liteWrite(m: Axi4, cd: ClockDomain, addr: Long, data: Long, strb: Int = 0xF): Unit = {
    m.aw.valid #= true
    m.aw.addr  #= addr
    while ({ cd.waitSampling(); !m.aw.ready.toBoolean }) {}
    m.aw.valid #= false

    m.w.valid #= true
    m.w.data  #= data
    if (m.config.useStrb) m.w.strb #= strb
    if (m.config.useLast) m.w.last #= true
    while ({ cd.waitSampling(); !m.w.ready.toBoolean }) {}
    m.w.valid #= false

    m.b.ready #= true
    while ({ cd.waitSampling(); !m.b.valid.toBoolean }) {}
    m.b.ready #= false
  }

  def liteRead(m: Axi4, cd: ClockDomain, addr: Long): Long = {
    m.ar.valid #= true
    m.ar.addr  #= addr
    while ({ cd.waitSampling(); !m.ar.ready.toBoolean }) {}
    m.ar.valid #= false

    m.r.ready #= true
    while ({ cd.waitSampling(); !m.r.valid.toBoolean }) {}
    val d = m.r.data.toLong
    m.r.ready #= false
    d
  }

  // ── Full AXI4 master driver ─────────────────────────────────────────────────

  private def sizeOf(m: Axi4): Int = {
    var n = m.config.dataWidth / 8; var s = 0
    while (n > 1) { n >>= 1; s += 1 }
    s   // log2(dataWidth/8)
  }

  /** Single-beat write. Returns echoed B.id. */
  def fullWrite(m: Axi4, cd: ClockDomain, addr: Long, data: Long,
                id: Int = 0, strb: Int = 0xF): Int =
    fullBurstWrite(m, cd, addr, Seq(data), id, strb)

  /** Single-beat read. Returns (data, echoed R.id). */
  def fullRead(m: Axi4, cd: ClockDomain, addr: Long, id: Int = 0): (Long, Int) = {
    val (data, rid) = fullBurstRead(m, cd, addr, 1, id)
    (data.head, rid)
  }

  /**
   * Multi-beat INCR burst write.  data.length = number of beats.
   * The slave receives consecutive addresses: addr, addr+4, addr+8, …
   * Returns the echoed B.id.
   */
  def fullBurstWrite(m: Axi4, cd: ClockDomain, addr: Long, data: Seq[Long],
                     id: Int = 0, strb: Int = 0xF): Int = {
    val numBeats = data.length
    m.aw.valid #= true
    m.aw.addr  #= addr
    if (m.config.useId)    m.aw.id    #= id
    if (m.config.useLen)   m.aw.len   #= numBeats - 1
    if (m.config.useSize)  m.aw.size  #= sizeOf(m)
    if (m.config.useBurst) m.aw.burst #= 1  // INCR
    while ({ cd.waitSampling(); !m.aw.ready.toBoolean }) {}
    m.aw.valid #= false

    for ((beat, i) <- data.zipWithIndex) {
      m.w.valid #= true
      m.w.data  #= beat
      if (m.config.useStrb) m.w.strb #= strb
      if (m.config.useLast) m.w.last #= (i == numBeats - 1)
      while ({ cd.waitSampling(); !m.w.ready.toBoolean }) {}
    }
    m.w.valid #= false
    if (m.config.useLast) m.w.last #= false

    m.b.ready #= true
    while ({ cd.waitSampling(); !m.b.valid.toBoolean }) {}
    val bid = if (m.config.useId) m.b.id.toInt else 0
    m.b.ready #= false
    bid
  }

  /**
   * Multi-beat INCR burst read.
   *
   * stallCycles: master deasserts r.ready for this many cycles between
   * beats, exercising R-channel back-pressure.
   *
   * Returns (Seq of beat data, echoed R.id from last beat).
   */
  def fullBurstRead(m: Axi4, cd: ClockDomain, addr: Long, beats: Int,
                    id: Int = 0, stallCycles: Int = 0): (Seq[Long], Int) = {
    m.ar.valid #= true
    m.ar.addr  #= addr
    if (m.config.useId)    m.ar.id    #= id
    if (m.config.useLen)   m.ar.len   #= beats - 1
    if (m.config.useSize)  m.ar.size  #= sizeOf(m)
    if (m.config.useBurst) m.ar.burst #= 1
    while ({ cd.waitSampling(); !m.ar.ready.toBoolean }) {}
    m.ar.valid #= false

    val collected = mutable.ArrayBuffer[Long]()
    var rid    = 0
    var isLast = false
    while (!isLast) {
      m.r.ready #= true
      while ({ cd.waitSampling(); !m.r.valid.toBoolean }) {}
      collected += m.r.data.toLong
      if (m.config.useId) rid = m.r.id.toInt
      isLast = if (m.config.useLast) m.r.last.toBoolean else (collected.length == beats)
      m.r.ready #= false
      if (!isLast) for (_ <- 0 until stallCycles) cd.waitSampling()
    }
    (collected.toSeq, rid)
  }

  // ── IPIF-style simultaneous AW+W master driver ──────────────────────────────

  /**
   * Write that presents AW and W simultaneously — required to exercise
   * Xilinx IPIF slaves which stall until both AWVALID and WVALID are high
   * in the same cycle before asserting AWREADY/WREADY.
   */
  def liteWriteSimul(m: Axi4, cd: ClockDomain, addr: Long, data: Long,
                     strb: Int = 0xF): Unit = {
    m.aw.valid #= true
    m.aw.addr  #= addr
    m.w.valid  #= true
    m.w.data   #= data
    if (m.config.useStrb) m.w.strb #= strb
    if (m.config.useLast) m.w.last #= true

    var awDone = false
    var wDone  = false
    while (!awDone || !wDone) {
      cd.waitSampling()
      if (!awDone && m.aw.ready.toBoolean) { awDone = true; m.aw.valid #= false }
      if (!wDone  && m.w.ready.toBoolean)  {
        wDone = true; m.w.valid #= false
        if (m.config.useLast) m.w.last #= false
      }
    }

    m.b.ready #= true
    while ({ cd.waitSampling(); !m.b.valid.toBoolean }) {}
    m.b.ready #= false
  }

  // ── Slave models ────────────────────────────────────────────────────────────

  /**
   * Spawn a simple AXI4-Lite slave responder (single-beat, no IDs).
   */
  def spawnLiteSlave(s: Axi4, cd: ClockDomain,
                     mem: mutable.HashMap[Long, Long] = mutable.HashMap()
                    ): mutable.HashMap[Long, Long] = {
    initSlave(s)

    fork {
      while (true) {
        s.aw.ready #= true
        while ({ cd.waitSampling(); !s.aw.valid.toBoolean }) {}
        val addr = s.aw.addr.toLong
        s.aw.ready #= false

        s.w.ready #= true
        while ({ cd.waitSampling(); !s.w.valid.toBoolean }) {}
        mem(addr) = s.w.data.toLong
        s.w.ready #= false

        s.b.valid #= true
        if (s.config.useResp) s.b.resp #= 0
        while ({ cd.waitSampling(); !s.b.ready.toBoolean }) {}
        s.b.valid #= false
      }
    }

    fork {
      while (true) {
        s.ar.ready #= true
        while ({ cd.waitSampling(); !s.ar.valid.toBoolean }) {}
        val addr = s.ar.addr.toLong
        s.ar.ready #= false

        s.r.data  #= mem.getOrElse(addr, 0xDEADBEEFL)
        s.r.valid #= true
        if (s.config.useResp) s.r.resp #= 0
        if (s.config.useLast) s.r.last #= true
        while ({ cd.waitSampling(); !s.r.ready.toBoolean }) {}
        s.r.valid #= false
      }
    }

    mem
  }

  /**
   * Spawn an IPIF-style AXI4-Lite slave that only accepts a write when
   * AWVALID and WVALID are asserted simultaneously (mirrors Xilinx GPIO /
   * UART-Lite IPIF behaviour).  The slave will never assert AWREADY or
   * WREADY unless both are valid in the same cycle.
   */
  def spawnIpifLiteSlave(s: Axi4, cd: ClockDomain,
                         mem: mutable.HashMap[Long, Long] = mutable.HashMap()
                        ): mutable.HashMap[Long, Long] = {
    initSlave(s)

    // Write path: require simultaneous AWVALID + WVALID
    fork {
      while (true) {
        s.aw.ready #= false
        s.w.ready  #= false
        // Wait until both valid simultaneously
        while ({ cd.waitSampling(); !(s.aw.valid.toBoolean && s.w.valid.toBoolean) }) {}
        // Accept both in the same cycle
        s.aw.ready #= true
        s.w.ready  #= true
        val addr = s.aw.addr.toLong
        val data = s.w.data.toLong
        val strb = if (s.config.useStrb) s.w.strb.toInt else 0xFF
        val bytesPerBeat = s.config.dataWidth / 8
        var merged = mem.getOrElse(addr, 0L)
        for (b <- 0 until bytesPerBeat) {
          if (((strb >> b) & 1) != 0) {
            val shift = b * 8
            merged = (merged & ~(0xFFL << shift)) | ((data >> shift & 0xFFL) << shift)
          }
        }
        mem(addr) = merged
        cd.waitSampling()
        s.aw.ready #= false
        s.w.ready  #= false

        s.b.valid #= true
        if (s.config.useResp) s.b.resp #= 0
        while ({ cd.waitSampling(); !s.b.ready.toBoolean }) {}
        s.b.valid #= false
      }
    }

    // Read path (standard)
    fork {
      while (true) {
        s.ar.ready #= true
        while ({ cd.waitSampling(); !s.ar.valid.toBoolean }) {}
        val addr = s.ar.addr.toLong
        s.ar.ready #= false

        s.r.data  #= mem.getOrElse(addr, 0xDEADBEEFL)
        s.r.valid #= true
        if (s.config.useResp) s.r.resp #= 0
        if (s.config.useLast) s.r.last #= true
        while ({ cd.waitSampling(); !s.r.ready.toBoolean }) {}
        s.r.valid #= false
      }
    }

    mem
  }

  /**
   * Spawn a full-AXI4 slave responder with burst and back-pressure support.
   *
   * Write path: accepts AW, then accepts each W beat (optionally stalling
   *   stallW cycles before asserting w.ready), then sends B with echoed ID.
   * Read path: accepts AR, then sends len+1 R beats (optionally stalling
   *   stallR cycles before asserting r.valid on each beat), with last on
   *   the final beat.
   *
   * Addresses for INCR burst: base + beatIndex * (dataWidth/8).
   */
  def spawnFullSlave(s: Axi4, cd: ClockDomain,
                     mem:   mutable.HashMap[Long, Long] = mutable.HashMap(),
                     stallW: Int = 0,
                     stallR: Int = 0
                    ): mutable.HashMap[Long, Long] = {
    initSlave(s)
    val bytesPerBeat = s.config.dataWidth / 8

    // Write path
    fork {
      while (true) {
        s.aw.ready #= true
        while ({ cd.waitSampling(); !s.aw.valid.toBoolean }) {}
        val baseAddr = s.aw.addr.toLong
        val id       = if (s.config.useId) s.aw.id.toLong else 0L
        s.aw.ready #= false

        // Accept W beats until LAST
        var isLast  = false
        var beatIdx = 0
        while (!isLast) {
          for (_ <- 0 until stallW) cd.waitSampling()
          s.w.ready #= true
          while ({ cd.waitSampling(); !s.w.valid.toBoolean }) {}
          mem(baseAddr + beatIdx * bytesPerBeat) = s.w.data.toLong
          isLast = if (s.config.useLast) s.w.last.toBoolean else true
          s.w.ready #= false
          beatIdx += 1
        }

        s.b.valid #= true
        if (s.config.useId)   s.b.id   #= id
        if (s.config.useResp) s.b.resp #= 0
        while ({ cd.waitSampling(); !s.b.ready.toBoolean }) {}
        s.b.valid #= false
      }
    }

    // Read path
    fork {
      while (true) {
        s.ar.ready #= true
        while ({ cd.waitSampling(); !s.ar.valid.toBoolean }) {}
        val baseAddr = s.ar.addr.toLong
        val id       = if (s.config.useId) s.ar.id.toLong else 0L
        val len      = if (s.config.useLen) s.ar.len.toInt else 0
        s.ar.ready #= false

        for (i <- 0 to len) {
          for (_ <- 0 until stallR) cd.waitSampling()
          // Use unsigned BigInt so 64-bit values with bit 63 set don't fail #=
          val rRaw = mem.getOrElse(baseAddr + i * bytesPerBeat, 0xDEADBEEFL)
          s.r.data  #= BigInt(java.lang.Long.toUnsignedString(rRaw))
          s.r.valid #= true
          if (s.config.useId)   s.r.id   #= id
          if (s.config.useResp) s.r.resp #= 0
          if (s.config.useLast) s.r.last #= (i == len)
          while ({ cd.waitSampling(); !s.r.ready.toBoolean }) {}
          s.r.valid #= false
        }
      }
    }

    mem
  }
}
