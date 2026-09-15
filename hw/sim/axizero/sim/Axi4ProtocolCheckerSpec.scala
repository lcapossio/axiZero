// Copyright (c) 2026 Leonardo Capossio - bard0 design  hello@bard0.com
// SPDX-License-Identifier: MIT
package axizero.sim

import org.scalatest.funsuite.AnyFunSuite
import spinal.core._
import spinal.core.sim._
import spinal.lib._
import spinal.lib.bus.amba4.axi._
import axizero.verif._

// ---------------------------------------------------------------------------
// Axi4ProtocolCheckerSpec  —  every rule is shown firing, and shown silent.
//
// A checker is only worth having if both halves hold: it must catch the
// violation it claims to catch, and it must not fire on traffic that is
// legal. The second half is the one that decides whether anyone trusts a
// green result, so the clean-traffic test runs the same stimulus shapes as
// the violation tests -- bursts of every type, stalls on every channel,
// responses out of order -- and asserts the sticky vector is still zero.
//
// The harness exposes every AXI signal as a plain port so a test can drive
// the bus into states no real master would produce. That is the point: the
// checker has to see illegal traffic to be tested, and no legal master will
// generate it.
// ---------------------------------------------------------------------------
class Axi4ProtocolCheckerSpec extends AnyFunSuite {

  private val spinalCfg = SpinalConfig(
    defaultConfigForClockDomains = ClockDomainConfig(
      clockEdge = RISING,
      resetKind = SYNC,
      resetActiveLevel = LOW
    )
  )

  private def simCfg = SimConfig.withConfig(spinalCfg)

  private val axiCfg = Axi4Config(
    addressWidth = 32,
    dataWidth = 32,
    idWidth = 4,
    useId = true,
    useLen = true,
    useSize = true,
    useBurst = true,
    useLast = true,
    useResp = true,
    useStrb = true,
    useLock = false,
    useCache = false,
    useProt = false,
    useQos = false,
    useRegion = false
  )

  // ── Harness ───────────────────────────────────────────────────────────────
  // Every channel signal is an input, so the testbench owns both sides of the
  // bus and can present any sequence at all.
  private class Harness(cc: Axi4ProtocolCheckerConfig) extends Component {
    val io = new Bundle {
      val awvalid = in Bool ()
      val awready = in Bool ()
      val awaddr  = in UInt (32 bits)
      val awid    = in UInt (4 bits)
      val awlen   = in UInt (8 bits)
      val awsize  = in UInt (3 bits)
      val awburst = in Bits (2 bits)

      val wvalid = in Bool ()
      val wready = in Bool ()
      val wdata  = in Bits (32 bits)
      val wstrb  = in Bits (4 bits)
      val wlast  = in Bool ()

      val bvalid = in Bool ()
      val bready = in Bool ()
      val bid    = in UInt (4 bits)
      val bresp  = in Bits (2 bits)

      val arvalid = in Bool ()
      val arready = in Bool ()
      val araddr  = in UInt (32 bits)
      val arid    = in UInt (4 bits)
      val arlen   = in UInt (8 bits)
      val arsize  = in UInt (3 bits)
      val arburst = in Bits (2 bits)

      val rvalid = in Bool ()
      val rready = in Bool ()
      val rdata  = in Bits (32 bits)
      val rid    = in UInt (4 bits)
      val rresp  = in Bits (2 bits)
      val rlast  = in Bool ()

      val sticky   = out Bits (Axi4ProtocolChecker.ruleCount bits)
      val any      = out Bool ()
      val overflow = out Bool ()
    }

    val bus = Axi4(axiCfg)

    bus.aw.valid := io.awvalid
    bus.aw.ready := io.awready
    bus.aw.addr  := io.awaddr
    bus.aw.id    := io.awid
    bus.aw.len   := io.awlen
    bus.aw.size  := io.awsize
    bus.aw.burst := io.awburst

    bus.w.valid := io.wvalid
    bus.w.ready := io.wready
    bus.w.data  := io.wdata
    bus.w.strb  := io.wstrb
    bus.w.last  := io.wlast

    bus.b.valid := io.bvalid
    bus.b.ready := io.bready
    bus.b.id    := io.bid
    bus.b.resp  := io.bresp

    bus.ar.valid := io.arvalid
    bus.ar.ready := io.arready
    bus.ar.addr  := io.araddr
    bus.ar.id    := io.arid
    bus.ar.len   := io.arlen
    bus.ar.size  := io.arsize
    bus.ar.burst := io.arburst

    bus.r.valid := io.rvalid
    bus.r.ready := io.rready
    bus.r.data  := io.rdata
    bus.r.id    := io.rid
    bus.r.resp  := io.rresp
    bus.r.last  := io.rlast

    val checker = Axi4ProtocolChecker(bus, label = "dut", checkerConfig = cc)
    io.sticky   := checker.sticky
    io.any      := checker.any
    io.overflow := checker.overflow
  }

  // ── Driver helpers ────────────────────────────────────────────────────────
  private class Bus(dut: Harness) {
    private val pin = dut.io

    def idle(): Unit = {
      pin.awvalid #= false; pin.awready #= false
      pin.awaddr #= 0; pin.awid #= 0; pin.awlen #= 0; pin.awsize #= 2; pin.awburst #= 1
      pin.wvalid #= false; pin.wready #= false
      pin.wdata #= 0; pin.wstrb #= 0xf; pin.wlast #= false
      pin.bvalid #= false; pin.bready #= false; pin.bid #= 0; pin.bresp #= 0
      pin.arvalid #= false; pin.arready #= false
      pin.araddr #= 0; pin.arid #= 0; pin.arlen #= 0; pin.arsize #= 2; pin.arburst #= 1
      pin.rvalid #= false; pin.rready #= false
      pin.rdata #= 0; pin.rid #= 0; pin.rresp #= 0; pin.rlast #= false
    }

    /** One AW handshake in a single cycle. */
    def aw(addr: BigInt, id: Int = 0, len: Int = 0, size: Int = 2, burst: Int = 1): Unit = {
      pin.awvalid #= true; pin.awready #= true
      pin.awaddr #= addr; pin.awid #= id; pin.awlen #= len
      pin.awsize #= size; pin.awburst #= burst
      dut.clockDomain.waitSampling()
      pin.awvalid #= false; pin.awready #= false
    }

    def ar(addr: BigInt, id: Int = 0, len: Int = 0, size: Int = 2, burst: Int = 1): Unit = {
      pin.arvalid #= true; pin.arready #= true
      pin.araddr #= addr; pin.arid #= id; pin.arlen #= len
      pin.arsize #= size; pin.arburst #= burst
      dut.clockDomain.waitSampling()
      pin.arvalid #= false; pin.arready #= false
    }

    def w(data: BigInt, last: Boolean): Unit = {
      pin.wvalid #= true; pin.wready #= true; pin.wdata #= data; pin.wlast #= last
      dut.clockDomain.waitSampling()
      pin.wvalid #= false; pin.wready #= false; pin.wlast #= false
    }

    def b(id: Int = 0, resp: Int = 0): Unit = {
      pin.bvalid #= true; pin.bready #= true; pin.bid #= id; pin.bresp #= resp
      dut.clockDomain.waitSampling()
      pin.bvalid #= false; pin.bready #= false
    }

    def r(data: BigInt, id: Int = 0, last: Boolean = true, resp: Int = 0): Unit = {
      pin.rvalid #= true; pin.rready #= true; pin.rdata #= data
      pin.rid #= id; pin.rlast #= last; pin.rresp #= resp
      dut.clockDomain.waitSampling()
      pin.rvalid #= false; pin.rready #= false; pin.rlast #= false
    }

    def step(n: Int = 1): Unit = dut.clockDomain.waitSampling(n)
  }

  private def runTest(
    cc: Axi4ProtocolCheckerConfig = Axi4ProtocolCheckerConfig()
  )(body: (Harness, Bus) => Unit): Unit =
    simCfg.compile(new Harness(cc)).doSim { dut =>
      dut.clockDomain.forkStimulus(10)
      val bus = new Bus(dut)
      bus.idle()
      dut.clockDomain.waitSampling(4)
      body(dut, bus)
      dut.clockDomain.waitSampling(4)
    }

  private def stickyOf(dut: Harness): BigInt = dut.io.sticky.toBigInt

  private def assertFired(dut: Harness, index: Int): Unit = {
    val s = stickyOf(dut)
    assert(
      s.testBit(index),
      s"expected ${Axi4ProtocolChecker.nameOf(index)} (bit $index) to fire; " +
        s"sticky = 0x${s.toString(16)} -> ${Axi4ProtocolChecker.decode(s).mkString(", ")}"
    )
  }

  private def assertSilent(dut: Harness): Unit = {
    val s = stickyOf(dut)
    assert(
      s == 0,
      s"expected no violation; sticky = 0x${s.toString(16)} -> " +
        Axi4ProtocolChecker.decode(s).mkString(", ")
    )
  }

  // ── The half that decides whether a green result means anything ───────────

  test("clean traffic of every burst shape leaves the checker silent") {
    runTest() { (dut, bus) =>
      // Single-beat write and its response.
      bus.aw(0x1000, id = 3)
      bus.w(0xaaaa, last = true)
      bus.b(id = 3)

      // Four-beat INCR write, AW well ahead of W.
      bus.aw(0x2000, id = 1, len = 3)
      bus.step(3)
      bus.w(1, last = false)
      bus.step(2)
      bus.w(2, last = false)
      bus.w(3, last = false)
      bus.step(1)
      bus.w(4, last = true)
      bus.b(id = 1)

      // WRAP write of a legal length.
      bus.aw(0x3000, id = 2, len = 3, burst = 2)
      for (i <- 0 until 4) bus.w(i, last = i == 3)
      bus.b(id = 2)

      // FIXED write.
      bus.aw(0x4000, id = 4, len = 1, burst = 0)
      bus.w(1, last = false)
      bus.w(2, last = true)
      bus.b(id = 4)

      // An INCR burst that ends exactly on a 4 KiB boundary is legal, and is
      // the case an off-by-one in the crossing check gets wrong.
      bus.aw(0xfc0, id = 5, len = 15, size = 2)
      for (i <- 0 until 16) bus.w(i, last = i == 15)
      bus.b(id = 5)

      // Reads, including two outstanding retiring in a different order than
      // they were issued, which is legal across different IDs.
      bus.ar(0x1000, id = 7, len = 1)
      bus.ar(0x5000, id = 8, len = 0)
      bus.r(0xdead, id = 8, last = true)
      bus.r(0x11, id = 7, last = false)
      bus.r(0x22, id = 7, last = true)

      assertSilent(dut)
      assert(!dut.io.overflow.toBoolean, "clean traffic should not overflow the tracker")
    }
  }

  test("a stalled channel that drops VALID is caught") {
    runTest() { (dut, bus) =>
      dut.io.awvalid #= true
      dut.io.awready #= false
      dut.io.awaddr #= 0x100
      bus.step(2)
      dut.io.awvalid #= false // dropped before AWREADY
      bus.step(4)
      assertFired(dut, 0)
    }
  }

  test("a stalled channel whose payload changes is caught") {
    runTest() { (dut, bus) =>
      dut.io.awvalid #= true
      dut.io.awready #= false
      dut.io.awaddr #= 0x100
      bus.step(2)
      dut.io.awaddr #= 0x200 // payload moved while stalled
      bus.step(4)
      assertFired(dut, 0)
    }
  }

  test("a read channel that drops RVALID is caught") {
    runTest() { (dut, bus) =>
      bus.ar(0x1000, id = 1, len = 0)
      dut.io.rvalid #= true
      dut.io.rready #= false
      dut.io.rid #= 1
      dut.io.rlast #= true
      bus.step(2)
      dut.io.rvalid #= false
      bus.step(4)
      assertFired(dut, 4)
    }
  }

  test("WLAST on the wrong beat is caught") {
    runTest() { (dut, bus) =>
      bus.aw(0x1000, id = 1, len = 3) // four beats promised
      bus.w(1, last = true)           // LAST on the first
      bus.step(4)
      assertFired(dut, 6)
    }
  }

  test("more W beats than AWLEN promised is caught") {
    runTest() { (dut, bus) =>
      bus.aw(0x1000, id = 1, len = 0) // one beat promised
      bus.w(1, last = false)
      bus.w(2, last = false)
      bus.w(3, last = true) // three delivered
      bus.step(4)
      assertFired(dut, 5)
    }
  }

  test("RLAST on the wrong beat is caught") {
    runTest() { (dut, bus) =>
      bus.ar(0x1000, id = 1, len = 3)
      bus.r(1, id = 1, last = true) // LAST on the first of four
      bus.step(4)
      assertFired(dut, 8)
    }
  }

  test("a write response with nothing outstanding is caught") {
    runTest() { (dut, bus) =>
      bus.b(id = 5)
      bus.step(4)
      assertFired(dut, 9)
    }
  }

  test("read data with nothing outstanding is caught") {
    runTest() { (dut, bus) =>
      bus.r(0xbeef, id = 6, last = true)
      bus.step(4)
      assertFired(dut, 10)
    }
  }

  test("a response for an ID that was never requested is caught") {
    runTest() { (dut, bus) =>
      bus.aw(0x1000, id = 2)
      bus.w(1, last = true)
      bus.b(id = 9) // a different ID than the one outstanding
      bus.step(4)
      assertFired(dut, 9)
    }
  }

  test("the reserved burst encoding is caught on both address channels") {
    runTest() { (dut, bus) =>
      bus.aw(0x1000, id = 1, burst = 3)
      bus.step(4)
      assertFired(dut, 11)
    }
    runTest() { (dut, bus) =>
      bus.ar(0x1000, id = 1, burst = 3)
      bus.step(4)
      assertFired(dut, 12)
    }
  }

  test("a WRAP burst of an illegal length is caught") {
    runTest() { (dut, bus) =>
      bus.aw(0x1000, id = 1, len = 2, burst = 2) // three beats: not 2, 4, 8 or 16
      bus.step(4)
      assertFired(dut, 13)
    }
    runTest() { (dut, bus) =>
      bus.ar(0x1000, id = 1, len = 4, burst = 2) // five beats
      bus.step(4)
      assertFired(dut, 14)
    }
  }

  test("a burst crossing a 4 KiB boundary is caught") {
    runTest() { (dut, bus) =>
      // 0xFFC + 16 beats * 4 bytes runs to 0x103B, over the boundary at 0x1000.
      bus.aw(0xffc, id = 1, len = 15, size = 2)
      bus.step(4)
      assertFired(dut, 15)
    }
    runTest() { (dut, bus) =>
      bus.ar(0xff8, id = 1, len = 3, size = 2) // 0xFF8..0x1007
      bus.step(4)
      assertFired(dut, 16)
    }
  }

  test("an unaligned INCR burst that stays inside its page is not a crossing") {
    // AXI4 A3.4.1 measures the burst from the *aligned* start address: only the
    // first transfer may be unaligned, every later one starts at
    // Aligned + n*size, so the last byte is Aligned + beats*size - 1.
    //
    // Measuring from the unaligned address instead overstates the span by up to
    // size-1 bytes and reports a crossing on a burst that ends inside the page.
    // 0xFF2 with 4 beats of 4 bytes really spans 0xFF0..0xFFF and is legal;
    // measured from 0xFF2 it appears to reach 0x1001 and to cross.
    //
    // No master in this repository issues an unaligned burst, which is why this
    // went unnoticed: the rule was only ever exercised by word-aligned traffic.
    runTest() { (dut, bus) =>
      bus.aw(0xff2, id = 1, len = 3, size = 2)
      bus.step(4)
      assertSilent(dut)
    }
    runTest() { (dut, bus) =>
      bus.ar(0xff2, id = 1, len = 3, size = 2)
      bus.step(4)
      assertSilent(dut)
    }
    // The same shape one beat longer genuinely does cross, and must still fire:
    // 0xFF0 + 5*4 - 1 = 0x1003.
    runTest() { (dut, bus) =>
      bus.aw(0xff2, id = 1, len = 4, size = 2)
      bus.step(4)
      assertFired(dut, 15)
    }
  }

  test("a burst longer than the design should ever issue is caught") {
    runTest(Axi4ProtocolCheckerConfig(maxBurstLen = 8)) { (dut, bus) =>
      bus.aw(0x2000, id = 1, len = 15) // 16 beats, over the declared ceiling
      bus.step(4)
      assertFired(dut, 17)
    }
  }

  test("running past the tracker's depth reports overflow, not a violation") {
    runTest(Axi4ProtocolCheckerConfig(trackDepth = 2)) { (dut, bus) =>
      for (i <- 0 until 6) bus.aw(0x1000 + i * 0x10, id = 1, len = 0)
      bus.step(2)
      assert(dut.io.overflow.toBoolean, "expected the tracker to report overflow")
      // Losing track is not the bus misbehaving, so no rule should have fired.
      assertSilent(dut)
    }
  }

  test("sticky bits hold long after the violation has passed") {
    runTest() { (dut, bus) =>
      bus.b(id = 1) // unexpected response
      bus.step(4)
      assertFired(dut, 9)
      // Then behave perfectly for a while.
      for (i <- 0 until 20) {
        bus.aw(0x1000 + i * 4, id = 1)
        bus.w(i, last = true)
        bus.b(id = 1)
      }
      assertFired(dut, 9)
      assert(dut.io.any.toBoolean, "any should still be set")
    }
  }
}
