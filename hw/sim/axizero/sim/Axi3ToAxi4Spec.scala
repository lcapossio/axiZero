// Copyright (c) 2026 Leonardo Capossio
// SPDX-License-Identifier: MIT
package axizero.sim

import org.scalatest.funsuite.AnyFunSuite
import spinal.core._
import spinal.core.sim._
import spinal.lib._
import spinal.lib.bus.amba4.axi._
import axizero.adapters._

// ---------------------------------------------------------------------------
// Axi3ToAxi4Spec — tests the AXI3-to-AXI4 bridge adapter
//
// Test harness: AXI3 master → Axi3ToAxi4Adapter → AXI4 memory slave
//
// Tests:
//   1. Single-beat write + read (basic passthrough)
//   2. INCR burst write + read (LEN extension 4→8 bits)
//   3. Write interleaving — two AW issued, W beats interleaved by WID
//   4. Locked access → SLVERR on B response
//   5. Multiple outstanding writes, no interleaving (in-order)
// ---------------------------------------------------------------------------
class Axi3ToAxi4Spec extends AnyFunSuite {

  private val spinalCfg = SpinalConfig(
    defaultConfigForClockDomains = ClockDomainConfig(
      clockEdge        = RISING,
      resetKind        = SYNC,
      resetActiveLevel = LOW
    )
  )

  private def simCfg = SimConfig.withConfig(spinalCfg)

  private val addrW = 32
  private val dataW = 32
  private val idW   = 4

  private val axi3Cfg = Axi3Config(addressWidth = addrW, dataWidth = dataW, idWidth = idW)
  private val axi4Cfg = Axi4Config(
    addressWidth = addrW,
    dataWidth    = dataW,
    idWidth      = idW,
    useLen       = true,
    useSize      = true,
    useBurst     = true,
    useLock      = true,
    useCache     = true,
    useProt      = true,
    useQos       = true,
    useRegion    = true,
    useLast      = true,
    useResp      = true
  )

  // Test harness: adapter with AXI4 port exposed for sim driving
  class Axi3TestHarness extends Component {
    val io = new Bundle {
      val axi3 = slave(Axi3(axi3Cfg))
      val axi4 = master(Axi4(axi4Cfg))
    }

    val adapter = new Axi3ToAxi4Adapter(axi3Cfg, axi4Cfg, maxOutstanding = 4)
    adapter.io.axi3 <> io.axi3
    io.axi4 <> adapter.io.axi4
  }

  // ── AXI3 master driver helpers ──────────────────────────────────────────

  private def initAxi3Master(m: Axi3): Unit = {
    m.aw.valid #= false
    m.aw.id    #= 0
    m.aw.addr  #= 0
    m.aw.len   #= 0
    m.aw.size  #= 2  // 4 bytes
    m.aw.burst #= 1  // INCR
    m.aw.lock  #= 0
    m.aw.cache #= 0
    m.aw.prot  #= 0
    m.w.valid  #= false
    m.w.id     #= 0
    m.w.data   #= 0
    m.w.strb   #= 0
    m.w.last   #= false
    m.b.ready  #= false
    m.ar.valid #= false
    m.ar.id    #= 0
    m.ar.addr  #= 0
    m.ar.len   #= 0
    m.ar.size  #= 2
    m.ar.burst #= 1
    m.ar.lock  #= 0
    m.ar.cache #= 0
    m.ar.prot  #= 0
    m.r.ready  #= false
  }

  // Send AW and return immediately (for interleaving tests)
  private def sendAw(m: Axi3, cd: ClockDomain,
                     id: Int, addr: Long, len: Int,
                     burst: Int = 1, lock: Int = 0): Unit = {
    m.aw.valid #= true
    m.aw.id    #= id
    m.aw.addr  #= addr
    m.aw.len   #= len
    m.aw.size  #= 2
    m.aw.burst #= burst
    m.aw.lock  #= lock
    cd.waitSamplingWhere(m.aw.ready.toBoolean)
    m.aw.valid #= false
  }

  // Send one W beat
  private def sendWBeat(m: Axi3, cd: ClockDomain,
                        wid: Int, data: Long, last: Boolean): Unit = {
    m.w.valid #= true
    m.w.id    #= wid
    m.w.data  #= data
    m.w.strb  #= 0xF
    m.w.last  #= last
    cd.waitSamplingWhere(m.w.ready.toBoolean)
    m.w.valid #= false
  }

  // Collect B response
  private def collectB(m: Axi3, cd: ClockDomain): (Int, Int) = {
    m.b.ready #= true
    cd.waitSamplingWhere(m.b.valid.toBoolean)
    val id   = m.b.id.toInt
    val resp = m.b.resp.toInt
    m.b.ready #= false
    (id, resp)
  }

  // Single-beat write (AW+W+B)
  private def writeWord(m: Axi3, cd: ClockDomain,
                        addr: Long, data: Long, id: Int = 0): Int = {
    sendAw(m, cd, id, addr, len = 0)
    sendWBeat(m, cd, wid = id, data, last = true)
    val (_, resp) = collectB(m, cd)
    resp
  }

  // Single-beat read
  private def readWord(m: Axi3, cd: ClockDomain,
                       addr: Long, id: Int = 0): (Long, Int) = {
    m.ar.valid #= true
    m.ar.id    #= id
    m.ar.addr  #= addr
    m.ar.len   #= 0
    m.ar.size  #= 2
    m.ar.burst #= 1
    cd.waitSamplingWhere(m.ar.ready.toBoolean)
    m.ar.valid #= false

    m.r.ready #= true
    cd.waitSamplingWhere(m.r.valid.toBoolean)
    val data = m.r.data.toLong
    val resp = m.r.resp.toInt
    m.r.ready #= false
    (data, resp)
  }

  // ── AXI4 slave model (spawned in sim) ───────────────────────────────────

  private def spawnAxi4Slave(
    axi4: Axi4, cd: ClockDomain
  ): scala.collection.mutable.HashMap[Long, Long] = {
    val mem = new scala.collection.mutable.HashMap[Long, Long]()

    // Init slave outputs
    axi4.aw.ready #= false
    axi4.w.ready  #= false
    axi4.b.valid  #= false
    if (axi4.config.useId)   axi4.b.id   #= 0
    if (axi4.config.useResp) axi4.b.resp #= 0
    axi4.ar.ready #= false
    axi4.r.valid  #= false
    axi4.r.data   #= 0
    if (axi4.config.useId)   axi4.r.id   #= 0
    if (axi4.config.useResp) axi4.r.resp #= 0
    if (axi4.config.useLast) axi4.r.last #= false

    // Write handler
    fork {
      while (true) {
        // Accept AW
        axi4.aw.ready #= true
        cd.waitSamplingWhere(axi4.aw.valid.toBoolean)
        val awAddr = axi4.aw.addr.toLong
        val awLen  = if (axi4.config.useLen) axi4.aw.len.toInt else 0
        val awId   = if (axi4.config.useId)  axi4.aw.id.toInt  else 0
        axi4.aw.ready #= false

        // Accept W beats
        for (beat <- 0 to awLen) {
          axi4.w.ready #= true
          cd.waitSamplingWhere(axi4.w.valid.toBoolean)
          val wData = axi4.w.data.toLong
          mem(awAddr + beat * 4) = wData
          axi4.w.ready #= false
        }

        // Send B
        axi4.b.valid #= true
        if (axi4.config.useId)   axi4.b.id   #= awId
        if (axi4.config.useResp) axi4.b.resp #= 0
        cd.waitSamplingWhere(axi4.b.ready.toBoolean)
        axi4.b.valid #= false
      }
    }

    // Read handler
    fork {
      while (true) {
        axi4.ar.ready #= true
        cd.waitSamplingWhere(axi4.ar.valid.toBoolean)
        val arAddr = axi4.ar.addr.toLong
        val arLen  = if (axi4.config.useLen) axi4.ar.len.toInt else 0
        val arId   = if (axi4.config.useId)  axi4.ar.id.toInt  else 0
        axi4.ar.ready #= false

        for (beat <- 0 to arLen) {
          axi4.r.valid #= true
          axi4.r.data  #= mem.getOrElse(arAddr + beat * 4, 0L)
          if (axi4.config.useId)   axi4.r.id   #= arId
          if (axi4.config.useResp) axi4.r.resp #= 0
          if (axi4.config.useLast) axi4.r.last #= (beat == arLen)
          cd.waitSamplingWhere(axi4.r.ready.toBoolean)
          axi4.r.valid #= false
        }
      }
    }

    mem
  }

  // ── Tests ───────────────────────────────────────────────────────────────

  test("AXI3→AXI4 single-beat write and read") {
    simCfg.compile(new Axi3TestHarness).doSim("single_beat") { dut =>
      val cd = dut.clockDomain
      cd.forkStimulus(10)
      initAxi3Master(dut.io.axi3)
      val mem = spawnAxi4Slave(dut.io.axi4, cd)
      cd.waitSampling(5)

      writeWord(dut.io.axi3, cd, 0x1000L, 0xDEADBEEFL, id = 3)
      val (data, _) = readWord(dut.io.axi3, cd, 0x1000L, id = 3)

      assert(data == 0xDEADBEEFL, f"expected 0xDEADBEEF, got 0x$data%08X")
      assert(mem(0x1000L) == 0xDEADBEEFL)
      cd.waitSampling(5)
    }
  }

  test("AXI3→AXI4 INCR burst write and read (4 beats)") {
    simCfg.compile(new Axi3TestHarness).doSim("incr_burst") { dut =>
      val cd = dut.clockDomain
      cd.forkStimulus(10)
      initAxi3Master(dut.io.axi3)
      val mem = spawnAxi4Slave(dut.io.axi4, cd)
      cd.waitSampling(5)

      val baseAddr = 0x2000L
      val beats = Seq(0x11111111L, 0x22222222L, 0x33333333L, 0x44444444L)

      // AW: len=3 (4 beats)
      sendAw(dut.io.axi3, cd, id = 1, addr = baseAddr, len = 3)
      for (i <- beats.indices) {
        sendWBeat(dut.io.axi3, cd, wid = 1, beats(i), last = (i == 3))
      }
      val (bId, bResp) = collectB(dut.io.axi3, cd)
      assert(bId == 1)
      assert(bResp == 0)

      // Read back each word individually
      for (i <- beats.indices) {
        val (data, _) = readWord(dut.io.axi3, cd, baseAddr + i * 4, id = 1)
        assert(data == beats(i), f"beat $i: expected 0x${beats(i)}%08X, got 0x$data%08X")
      }
      cd.waitSampling(5)
    }
  }

  test("AXI3→AXI4 write interleaving — two transactions, interleaved W beats") {
    simCfg.compile(new Axi3TestHarness).doSim("interleave") { dut =>
      val cd = dut.clockDomain
      cd.forkStimulus(10)
      initAxi3Master(dut.io.axi3)
      val mem = spawnAxi4Slave(dut.io.axi4, cd)
      cd.waitSampling(5)

      // Issue two AWs: ID=1 to 0x3000 (2 beats), ID=2 to 0x4000 (2 beats)
      sendAw(dut.io.axi3, cd, id = 1, addr = 0x3000L, len = 1)
      sendAw(dut.io.axi3, cd, id = 2, addr = 0x4000L, len = 1)

      // Interleave W beats: ID2 beat0, ID1 beat0, ID2 beat1, ID1 beat1
      sendWBeat(dut.io.axi3, cd, wid = 2, 0xAAAA0000L, last = false)
      sendWBeat(dut.io.axi3, cd, wid = 1, 0xBBBB0000L, last = false)
      sendWBeat(dut.io.axi3, cd, wid = 2, 0xAAAA1111L, last = true)
      sendWBeat(dut.io.axi3, cd, wid = 1, 0xBBBB1111L, last = true)

      // Collect both B responses (ID=1 first since it was AW'd first)
      val (b1Id, b1Resp) = collectB(dut.io.axi3, cd)
      val (b2Id, b2Resp) = collectB(dut.io.axi3, cd)

      assert(b1Id == 1, s"first B should be ID=1, got $b1Id")
      assert(b2Id == 2, s"second B should be ID=2, got $b2Id")
      assert(b1Resp == 0)
      assert(b2Resp == 0)

      // Verify memory: ID1 → 0x3000, ID2 → 0x4000
      assert(mem(0x3000L) == 0xBBBB0000L, f"ID1 beat0: got 0x${mem(0x3000L)}%08X")
      assert(mem(0x3004L) == 0xBBBB1111L, f"ID1 beat1: got 0x${mem(0x3004L)}%08X")
      assert(mem(0x4000L) == 0xAAAA0000L, f"ID2 beat0: got 0x${mem(0x4000L)}%08X")
      assert(mem(0x4004L) == 0xAAAA1111L, f"ID2 beat1: got 0x${mem(0x4004L)}%08X")
      cd.waitSampling(5)
    }
  }

  test("AXI3→AXI4 locked access returns SLVERR") {
    simCfg.compile(new Axi3TestHarness).doSim("locked") { dut =>
      val cd = dut.clockDomain
      cd.forkStimulus(10)
      initAxi3Master(dut.io.axi3)
      spawnAxi4Slave(dut.io.axi4, cd)
      cd.waitSampling(5)

      // Send a locked write (lock=2'b10)
      sendAw(dut.io.axi3, cd, id = 5, addr = 0x5000L, len = 0, lock = 2)
      sendWBeat(dut.io.axi3, cd, wid = 5, 0x12345678L, last = true)
      val (bId, bResp) = collectB(dut.io.axi3, cd)

      assert(bId == 5)
      assert(bResp == 2, s"locked access should get SLVERR (2), got $bResp")
      cd.waitSampling(5)
    }
  }

  test("AXI3→AXI4 multiple outstanding writes, in-order (no interleaving)") {
    simCfg.compile(new Axi3TestHarness).doSim("multi_outstanding") { dut =>
      val cd = dut.clockDomain
      cd.forkStimulus(10)
      initAxi3Master(dut.io.axi3)
      val mem = spawnAxi4Slave(dut.io.axi4, cd)
      cd.waitSampling(5)

      // Issue 3 single-beat writes with different IDs back-to-back
      for (i <- 0 until 3) {
        sendAw(dut.io.axi3, cd, id = i, addr = 0x6000L + i * 4, len = 0)
      }
      for (i <- 0 until 3) {
        sendWBeat(dut.io.axi3, cd, wid = i, (0xA0 + i).toLong << 24, last = true)
      }

      // Collect 3 B responses in AW order
      for (i <- 0 until 3) {
        val (bId, bResp) = collectB(dut.io.axi3, cd)
        assert(bId == i, s"B response $i: expected ID=$i, got $bId")
        assert(bResp == 0)
      }

      // Verify memory
      for (i <- 0 until 3) {
        val expected = (0xA0 + i).toLong << 24
        assert(mem(0x6000L + i * 4) == expected,
          f"addr 0x${0x6000L + i * 4}%04X: expected 0x$expected%08X, got 0x${mem(0x6000L + i * 4)}%08X")
      }
      cd.waitSampling(5)
    }
  }
}
