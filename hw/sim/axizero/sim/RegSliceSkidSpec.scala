// Copyright (c) 2026 Leonardo Capossio - bard0 design  hello@bard0.com
// SPDX-License-Identifier: MIT
package axizero.sim

import org.scalatest.funsuite.AnyFunSuite
import spinal.core._
import spinal.core.sim._
import spinal.lib._
import spinal.lib.bus.amba4.axi._
import axizero.adapters._

// ---------------------------------------------------------------------------
// RegSliceSkidSpec  —  what `regSliceSkid` actually changes, and what it must not.
//
// The skid option closed timing on every loaded board build: it is what takes
// the arbiter's grant off the master's READY, and the stress designs carry it.
// Until now its only evidence was those builds meeting timing, which says the
// path got shorter and says nothing about the data still being right. A skid
// buffer is exactly the structure where "shorter" and "right" come apart --
// once READY is a cycle stale the upstream can complete a handshake the
// downstream did not accept, and if the second register is missing or misused
// that beat is silently dropped or duplicated.
//
// So these tests pin down all four claims the source file makes for it:
//
//   1. It IS a second register. With the downstream stalled from the first
//      cycle, a plain slice accepts one beat and a skidded one accepts two.
//      That difference is the whole feature; a skidFwd that quietly did
//      nothing would pass every functional test in the suite but this one.
//   2. READY is registered. When the downstream finally accepts, the plain
//      slice's upstream READY rises in that same cycle -- it is combinational
//      through the slice -- and the skidded one's rises a cycle later. That is
//      the arc being cut, observed rather than inferred from a timing report.
//   3. No beat is lost, reordered or duplicated. Random back-pressure on both
//      sides, every beat checked for value and order.
//   4. Throughput and latency are unchanged. A skid that cost a cycle of
//      latency, or a beat every other cycle, would be a bad trade for slack,
//      so both are measured rather than asserted.
//
// The response channels are checked too, for the opposite reason: B and R are
// deliberately NOT skidded, and a change that skidded everything would be
// invisible except here.
// ---------------------------------------------------------------------------
class RegSliceSkidSpec extends AnyFunSuite {

  private val spinalCfg = SpinalConfig(
    defaultConfigForClockDomains = ClockDomainConfig(
      clockEdge = RISING,
      resetKind = SYNC,
      resetActiveLevel = LOW
    )
  )

  private def simCfg = SimConfig.withConfig(spinalCfg)

  private val fullCfg = Axi4Config(addressWidth = 32, dataWidth = 32, idWidth = 4)
  private val liteCfg = Axi4Config(
    addressWidth = 32,
    dataWidth = 32,
    idWidth = 1,
    useId = false,
    useLen = false,
    useSize = false,
    useBurst = false,
    useLast = false,
    useResp = true,
    useStrb = true
  )

  /** Start the clock and let a reset through the registers before anything is read.
    *
    * `idle` must drive every input this test uses, and it runs *before* the first edge. SpinalSim
    * leaves an unassigned input undefined, so a VALID that is only driven after the reset cycles
    * have run has already been sampled as whatever it happened to be -- which for a register slice
    * means it can arrive here full, and every capacity measurement below then reads zero.
    */
  private def settle(dut: Component)(idle: => Unit): Unit = {
    dut.clockDomain.forkStimulus(10)
    idle
    dut.clockDomain.waitSampling(5)
  }

  /** The AR payload fields, so a test that only cares about handshakes need not restate them. */
  private def driveArPayload(ar: spinal.lib.Stream[Axi4Ar], addr: Long, id: Int): Unit = {
    ar.payload.addr #= addr
    ar.payload.id #= id
    ar.payload.len #= 0
    ar.payload.size #= 2
    ar.payload.burst #= 1
  }

  // ── 1. the second register exists ────────────────────────────────────────

  /** How many beats the slice swallows before it refuses, with the downstream never accepting.
    *
    * This is the one measurement that separates a skid from a plain stage: storage. One register
    * holds one beat; the skid's job is to hold the beat that arrives while READY was still stale,
    * so it holds two.
    */
  private def acceptedWhileStalled(skid: Boolean): Int = {
    var accepted = 0
    simCfg.compile(new Axi4RegSlice(fullCfg, skid)).doSim(s"capacity-skid-$skid") { dut =>
      settle(dut) {
        dut.io.downstream.ar.ready #= false // never drains
        dut.io.upstream.ar.valid #= false
        driveArPayload(dut.io.upstream.ar, 0x1000, 1)
      }
      dut.io.upstream.ar.valid #= true

      // A handshake happens at the edge, so the pair is read once the
      // combinational logic has settled and *before* the edge that consumes
      // it. Reading after waitSampling would report the next cycle's values.
      // Long enough that a slice with any amount of storage has filled it.
      for (_ <- 0 until 8) {
        sleep(1)
        if (dut.io.upstream.ar.valid.toBoolean && dut.io.upstream.ar.ready.toBoolean)
          accepted += 1
        dut.clockDomain.waitSampling()
      }
    }
    accepted
  }

  test("the skid is a second register: it takes one more beat than a plain slice can hold") {
    val plain   = acceptedWhileStalled(skid = false)
    val skidded = acceptedWhileStalled(skid = true)
    assert(plain == 1, s"a plain register slice should hold exactly one stalled beat, held $plain")
    assert(
      skidded == 2,
      s"the skid should hold one more than the plain slice, held $skidded -- a skidFwd that " +
        "generated the same logic as the plain slice would look like this"
    )
  }

  // ── 2. READY is registered ───────────────────────────────────────────────

  /** Whether upstream READY comes back in the same cycle the downstream starts accepting.
    *
    * With a plain slice it does: `upstream.ready = !rValid || downstream.ready` runs straight
    * through. With the skid it cannot, because upstream READY is driven from a register of its own
    * -- which is the entire point, and the reason the loaded builds close.
    */
  private def readyRecoversSameCycle(skid: Boolean): Boolean = {
    var sameCycle = false
    simCfg.compile(new Axi4RegSlice(fullCfg, skid)).doSim(s"ready-arc-skid-$skid") { dut =>
      settle(dut) {
        dut.io.downstream.ar.ready #= false
        dut.io.upstream.ar.valid #= false
        driveArPayload(dut.io.upstream.ar, 0x2000, 2)
      }
      dut.io.upstream.ar.valid #= true

      // Fill it until it refuses, so upstream READY is low and has to recover.
      dut.clockDomain.waitSamplingWhere(!dut.io.upstream.ar.ready.toBoolean)

      // Open the downstream and look at upstream READY in that same cycle,
      // before any clock edge has had the chance to carry the news.
      dut.io.downstream.ar.ready #= true
      sleep(1)
      sameCycle = dut.io.upstream.ar.ready.toBoolean
    }
    sameCycle
  }

  test("the skid takes the downstream READY arc off the upstream READY") {
    assert(
      readyRecoversSameCycle(skid = false),
      "a plain slice's upstream READY is combinational through the slice and should recover in " +
        "the same cycle -- if this fails the test is no longer measuring what it thinks"
    )
    assert(
      !readyRecoversSameCycle(skid = true),
      "the skidded slice's upstream READY still moved in the same cycle as the downstream's, so " +
        "the arc the loaded builds need cut is not cut"
    )
  }

  // ── 3. nothing is lost, reordered or duplicated ──────────────────────────

  test("every beat survives random back-pressure on both sides, in order and exactly once") {
    simCfg.compile(new Axi4RegSlice(fullCfg, skidFwd = true)).doSim("integrity") { dut =>
      val beats = 400
      val seen  = scala.collection.mutable.ArrayBuffer[BigInt]()

      settle(dut) {
        dut.io.upstream.ar.valid #= false
        dut.io.downstream.ar.ready #= false
        driveArPayload(dut.io.upstream.ar, 0, 0)
      }

      val rng = new scala.util.Random(1)

      // Offer each address once, only advancing when the beat is taken.
      // Collected at the sampling edge for the same reason as above.
      dut.clockDomain.onSamplings {
        if (dut.io.downstream.ar.valid.toBoolean && dut.io.downstream.ar.ready.toBoolean)
          seen += dut.io.downstream.ar.payload.addr.toBigInt
      }

      val driver = fork {
        for (i <- 0 until beats) {
          // Idle cycles between beats, so the slice is entered from both a
          // running and a stopped upstream.
          while (rng.nextInt(100) >= 70) {
            dut.io.upstream.ar.valid #= false
            dut.clockDomain.waitSampling()
          }
          dut.io.upstream.ar.valid #= true
          dut.io.upstream.ar.payload.addr #= i * 4
          dut.io.upstream.ar.payload.id #= i % 16
          dut.io.upstream.ar.payload.len #= 0
          dut.io.upstream.ar.payload.size #= 2
          dut.io.upstream.ar.payload.burst #= 1
          dut.clockDomain.waitSamplingWhere(dut.io.upstream.ar.ready.toBoolean)
        }
        dut.io.upstream.ar.valid #= false
      }

      val sink = fork {
        while (seen.size < beats) {
          dut.io.downstream.ar.ready #= rng.nextInt(100) < 60
          dut.clockDomain.waitSampling()
        }
        dut.io.downstream.ar.ready #= true
      }

      driver.join()
      sink.join()

      assert(seen.size == beats, s"expected $beats beats through the slice, saw ${seen.size}")
      for (i <- 0 until beats)
        assert(
          seen(i) == BigInt(i * 4),
          s"beat $i came out as 0x${seen(i).toString(16)}, not 0x${(i * 4).toHexString} -- the " +
            "skid dropped, duplicated or reordered a beat"
        )
    }
  }

  // ── 4. it costs neither throughput nor latency ───────────────────────────

  test("the skid keeps full throughput and the plain slice's latency") {
    for (skid <- Seq(false, true)) {
      simCfg.compile(new Axi4RegSlice(fullCfg, skid)).doSim(s"rate-skid-$skid") { dut =>
        settle(dut) {
          dut.io.downstream.ar.ready #= true
          dut.io.upstream.ar.valid #= false
          driveArPayload(dut.io.upstream.ar, 0, 0)
        }

        // Latency: sampling edges from the first beat being taken upstream to
        // it being taken downstream.
        dut.io.upstream.ar.valid #= true
        dut.clockDomain.waitSamplingWhere(dut.io.upstream.ar.ready.toBoolean)
        var latency = 0
        while (!(dut.io.downstream.ar.valid.toBoolean && dut.io.downstream.ar.ready.toBoolean)) {
          dut.clockDomain.waitSampling()
          latency += 1
        }
        assert(
          latency == 1,
          s"skid=$skid forward latency is $latency cycles, not the one cycle a register slice " +
            "costs -- the skid must not add a stage"
        )

        // Throughput: with the downstream always ready, every cycle carries a beat.
        var taken = 0
        dut.clockDomain.onSamplings {
          if (dut.io.downstream.ar.valid.toBoolean && dut.io.downstream.ar.ready.toBoolean)
            taken += 1
        }
        dut.clockDomain.waitSampling(50)
        assert(
          taken == 50,
          s"skid=$skid passed $taken beats in 50 cycles, not one per cycle -- the skid must not " +
            "cost throughput, which is what makes it worth its registers"
        )
      }
    }
  }

  // ── 5. the response channels are deliberately not skidded ────────────────

  test("B and R stay plain slices even when the forward channels are skidded") {
    simCfg.compile(new Axi4RegSlice(fullCfg, skidFwd = true)).doSim("response-not-skidded") { dut =>
      settle(dut) {
        dut.io.upstream.r.ready #= false // the master never takes a response
        dut.io.downstream.r.valid #= false
        dut.io.downstream.r.payload.data #= 0xdead
        dut.io.downstream.r.payload.id #= 3
        dut.io.downstream.r.payload.resp #= 0
        dut.io.downstream.r.payload.last #= true
      }
      dut.io.downstream.r.valid #= true

      var accepted = 0
      for (_ <- 0 until 8) {
        sleep(1)
        if (dut.io.downstream.r.valid.toBoolean && dut.io.downstream.r.ready.toBoolean)
          accepted += 1
        dut.clockDomain.waitSampling()
      }
      assert(
        accepted == 1,
        s"the read response channel held $accepted beats: B and R are meant to stay plain " +
          "slices, because their READY runs from the master into the fabric and is not where " +
          "the long paths were measured to be"
      )
    }
  }

  // ── 6. the Lite slice carries the same option ────────────────────────────

  test("the AXI4-Lite slice skids its forward channels too") {
    def accepted(skid: Boolean): Int = {
      var n = 0
      simCfg.compile(new Axi4LiteRegSlice(liteCfg, skid)).doSim(s"lite-capacity-skid-$skid") {
        dut =>
          settle(dut) {
            dut.io.downstream.aw.ready #= false
            dut.io.upstream.aw.valid #= false
            dut.io.upstream.aw.payload.addr #= 0x40
          }
          dut.io.upstream.aw.valid #= true
          for (_ <- 0 until 8) {
            sleep(1)
            if (dut.io.upstream.aw.valid.toBoolean && dut.io.upstream.aw.ready.toBoolean) n += 1
            dut.clockDomain.waitSampling()
          }
      }
      n
    }
    assert(accepted(skid = false) == 1, "a plain Lite slice should hold one stalled beat")
    assert(
      accepted(skid = true) == 2,
      "the Lite slice ignored skidFwd -- the Lite ports on the loaded builds carry it too"
    )
  }
}
