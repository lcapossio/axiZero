// Copyright (c) 2026 Leonardo Capossio - bard0 design  hello@bard0.com
// SPDX-License-Identifier: MIT
package vexzero.sim

import org.scalatest.funsuite.AnyFunSuite
import spinal.core._
import spinal.core.sim._
import axizero.verif._
import vexzero._

// ---------------------------------------------------------------------------
// VexZeroProtocolSpec  —  the crossbar judged against AXI4, not against answers
//
// Every other test of this interconnect is value-based: run a program, or a
// traffic pattern, and check the numbers that came back. That catches a
// crossbar which loses or corrupts data, and it is blind to one which returns
// every right answer while breaking the protocol on the way — dropping a
// VALID before its READY, sending a WLAST on the wrong beat, answering a
// response nobody asked for. A slave that tolerates it hides it, and the next
// slave, on the next board, does not.
//
// [[Axi4ProtocolChecker]] watches instead of asking. Here it is put on every
// port of the fabric inside a real SoC, and the run has to end with all of
// them silent.
//
// Silence only means something if the checkers were awake, so the last test
// is the control: the same SoC, the same checkers, and one deliberately
// illegal burst pushed in through the host port. If that does not light the
// verdict, the two tests above it prove nothing.
// ---------------------------------------------------------------------------
class VexZeroProtocolSpec extends AnyFunSuite {

  private val spinalCfg = SpinalConfig(
    defaultConfigForClockDomains = ClockDomainConfig(
      clockEdge = RISING,
      resetKind = SYNC,
      resetActiveLevel = LOW
    )
  )

  private def simCfg = SimConfig.withConfig(spinalCfg)

  private val ramBase     = BigInt("80000000", 16)
  private val ramSize     = 64 * 1024
  private val scratchBase = ramBase.toLong + 0x8000
  private val scratchSize = 0x8000

  /** Plenty for the boot firmware, which is 37 instructions on a 5-stage core. */
  private val bootTimeout = 40000

  /** The checker state a test needs to read back. It is all internal to the SoC, so it has to be
    * published while the design is being elaborated.
    */
  private def publish(dut: VexZeroSoc): VexZeroSoc = {
    dut.busCheck.foreach { bc =>
      bc.checkers.foreach { c =>
        c.sticky.simPublic()
        c.overflow.simPublic()
      }
    }
    dut
  }

  /** Read every checker back and fail with the port and the rule names, not just a bit pattern. */
  private def assertClean(dut: VexZeroSoc, label: String): Unit = {
    val bc = dut.busCheck.get
    val faults = bc.portNames.zip(bc.checkers).flatMap {
      case (port, checker) =>
        val sticky = checker.sticky.toBigInt
        Option.when(sticky != 0)(
          s"$port: ${Axi4ProtocolChecker.decode(sticky).mkString(", ")}"
        )
    }
    assert(
      faults.isEmpty,
      s"$label broke AXI4 on ${faults.length} port(s):\n  ${faults.mkString("\n  ")}"
    )

    // A checker that ran out of tracking state stops being evidence, so a run
    // that overflowed is not a run that passed -- it is a run that was not
    // fully watched, and the depth needs raising.
    val lost = bc.portNames.zip(bc.checkers).collect {
      case (port, checker) if checker.overflow.toBoolean => port
    }
    assert(
      lost.isEmpty,
      s"$label: the checkers lost track on ${lost.mkString(", ")}, so silence on those ports " +
        "means nothing. Raise trackDepth / perIdTrackDepth."
    )
  }

  // ── 1. The plain SoC, booting ─────────────────────────────────────────────
  test("the crossbar keeps AXI4 while the boot firmware runs on it") {
    val socConfig = VexZeroSocConfig(maxOutstanding = 4, protocolCheck = true)

    simCfg.compile(publish(new VexZeroSoc(socConfig))).doSim("vexzero_protocol_boot") { dut =>
      dut.io.switches #= 0x5a
      dut.clockDomain.forkStimulus(10)

      val timedOut = dut.clockDomain.waitSamplingWhere(bootTimeout)(
        dut.io.status.toLong == Firmware.doneMarker
      )
      assert(!timedOut, "firmware never wrote the done marker, so nothing was really exercised")

      // Let the tail of the last transaction retire before reading the verdict.
      dut.clockDomain.waitSampling(64)
      assertClean(dut, "the boot run")
      assert(
        !dut.io.busViolation.toBoolean,
        "io.busViolation is high but no checker reports a rule"
      )
    }
  }

  // ── 2. The SoC under load ─────────────────────────────────────────────────
  // Bursts, several outstanding, two masters wanting one slave. This is the
  // shape of traffic the value-based tests already pass on, which is exactly
  // why it is worth watching: if the crossbar breaks the protocol anywhere, it
  // breaks it here, and no existing test would have said so.
  test("the crossbar keeps AXI4 with a cached CPU and a host contending for the same RAM") {
    val socConfig = VexZeroSocConfig(
      ramSize = ramSize,
      maxOutstanding = 4,
      cachedCpu = true,
      dCacheSize = 512,
      hostMaster = true,
      protocolCheck = true
    )

    simCfg.compile(publish(new VexZeroSoc(socConfig))).doSim("vexzero_protocol_load") { dut =>
      SimTimeout(20000000)
      dut.io.switches #= 0
      dut.clockDomain.forkStimulus(10)

      val host = new HostTraffic(dut.io.host, dut.clockDomain)
      host.start()

      // 16-beat bursts, written and read back, aligned so that a legal master
      // never straddles a 4 KiB boundary -- if one did, the checker would be
      // right to complain and the test would be wrong.
      val burstBeats = 16
      var round      = 0
      val feeder = fork {
        while (round < 400) {
          if (host.backlog < 6) {
            val offset  = (round * burstBeats * 4) % (scratchSize - burstBeats * 4)
            val target  = scratchBase + offset
            val pattern = (0 until burstBeats).map(i => (round.toLong << 16 | i) & 0xffffffffL)
            host.write(target, pattern)
            host.drainWrites()
            host.read(target, pattern)
            round += 1
          } else dut.clockDomain.waitSampling()
        }
      }

      val timedOut = dut.clockDomain.waitSamplingWhere(bootTimeout * 20)(
        dut.io.status.toLong == Firmware.doneMarker
      )
      assert(!timedOut, "firmware never wrote the done marker")
      feeder.join()
      host.halt()
      dut.clockDomain.waitSampling(256)

      assert(
        host.mismatches.isEmpty,
        s"the host read back the wrong data, so this run says nothing about the protocol:\n  " +
          host.mismatches.mkString("\n  ")
      )
      assert(host.writes >= 100, s"the host only completed ${host.writes} write bursts")
      assertClean(dut, "the contended run")
      assert(
        !dut.io.busViolation.toBoolean,
        "io.busViolation is high but no checker reports a rule"
      )
    }
  }

  // ── 3. The control ────────────────────────────────────────────────────────
  // Two silent runs are worth exactly as much as the proof that these checkers
  // can speak. One illegal burst, on a port the SoC really has, has to reach
  // the same wire a board reports on.
  test("an illegal burst on the host port lights the verdict the board reports") {
    val socConfig = VexZeroSocConfig(
      ramSize = ramSize,
      maxOutstanding = 4,
      hostMaster = true,
      protocolCheck = true
    )

    simCfg.compile(publish(new VexZeroSoc(socConfig))).doSim("vexzero_protocol_control") { dut =>
      SimTimeout(2000000)
      dut.io.switches #= 0
      dut.io.host.ar.valid #= false
      dut.io.host.aw.valid #= false
      dut.io.host.w.valid #= false
      dut.io.host.r.ready #= true
      dut.io.host.b.ready #= true
      dut.clockDomain.forkStimulus(10)
      dut.clockDomain.waitSampling(64)

      assert(
        !dut.io.busViolation.toBoolean,
        "the verdict was already high before the illegal burst was issued"
      )

      // A 16-beat INCR read starting 8 words below a 4 KiB boundary. Both
      // halves are inside the RAM, so the fabric will serve it perfectly well
      // and every value-based check in the suite would still pass -- which is
      // the whole point of watching the protocol instead.
      val illegalAddr = ramBase.toLong + 0x0fe0
      dut.io.host.ar.valid #= true
      dut.io.host.ar.payload.addr #= illegalAddr
      dut.io.host.ar.payload.id #= 0
      dut.io.host.ar.payload.len #= 15
      dut.io.host.ar.payload.size #= 2
      dut.io.host.ar.payload.burst #= 1
      dut.io.host.ar.payload.qos #= 0
      dut.clockDomain.waitSamplingWhere(1000)(dut.io.host.ar.ready.toBoolean)
      dut.io.host.ar.valid #= false
      dut.clockDomain.waitSampling(64)

      assert(
        dut.io.busViolation.toBoolean,
        "a burst crossing a 4 KiB boundary went through without the verdict changing, so the " +
          "silence in the tests above proves nothing"
      )

      val bc = dut.busCheck.get
      val fired = bc.portNames.zip(bc.checkers).collect {
        case (port, checker) if checker.sticky.toBigInt != 0 =>
          port -> Axi4ProtocolChecker.decode(checker.sticky.toBigInt)
      }
      // The host is master 2, and it is the port the burst was issued on.
      assert(
        fired.exists { case (port, rules) => port == "m2" && rules.contains("AR_4K_CROSS") },
        s"expected m2 to report AR_4K_CROSS; got ${fired.mkString(", ")}"
      )
    }
  }
}
