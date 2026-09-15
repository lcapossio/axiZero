// Copyright (c) 2026 Leonardo Capossio - bard0 design  hello@bard0.com
// SPDX-License-Identifier: MIT
package axizero.sim

import org.scalatest.funsuite.AnyFunSuite
import spinal.core._
import spinal.core.sim._
import spinal.lib._
import spinal.lib.bus.amba4.axi._
import axizero.Axi4MasterObs
import axizero.verif._

// ---------------------------------------------------------------------------
// Axi4OrderingProbeSpec  —  the probe has to be able to fail.
//
// Axi4OrderingProbe is what says, on a board, that the crossbar really held a
// request back because the single-slave-per-ID rule made it. Its verdict folds
// into the bitstream's pass/fail, so a probe that latches nothing reads exactly
// like a fabric that behaved. These tests drive its bus directly -- it is a
// passive observer, so a testbench can present any sequence of handshakes it
// likes, including ones a correct crossbar would never produce.
//
//   1. It catches the rule being broken: a request admitted for one region
//      while that ID is still outstanding in the other. No response is ever
//      reordered in this test, which is the point -- two similar slaves can
//      answer in issue order by luck, so a probe that waited for a wrong
//      answer would see nothing.
//   2. A request admitted on the very cycle the last outstanding one retires
//      is legal, and must not read as a violation.
//   3. The evidence bits mean what they say: a cross request presented while
//      two of that ID's bursts are live, and held, sets `deepCrossHeld`; the
//      same traffic without the hold does not.
//   4. Two IDs live at once sets `twoIdsLive`, and one ID alone does not.
//   5. Writes are judged on their own: an ID live at one region for reads and
//      the other for writes is legal, and a violation on the write channels is
//      still caught.
// ---------------------------------------------------------------------------
class Axi4OrderingProbeSpec extends AnyFunSuite {

  private val spinalCfg = SpinalConfig(
    defaultConfigForClockDomains = ClockDomainConfig(
      clockEdge = RISING,
      resetKind = SYNC,
      resetActiveLevel = LOW
    )
  )

  private def simCfg = SimConfig.withConfig(spinalCfg)

  private val axiCfg = Axi4Config(addressWidth = 32, dataWidth = 32, idWidth = 2)

  /** Region A is below bit 28, region B above it -- the same shape the SoC's two RAMs have. */
  private val regionBit = 28
  private val baseA     = BigInt(0)
  private val baseB     = BigInt(1) << regionBit

  /** The probe watching an observation bundle the testbench drives signal by signal.
    *
    * That is what it watches in a real design too -- the crossbar's own master port, brought out by
    * `observeMasters` -- and it means a test can present requests *and* responses, including
    * sequences a correct crossbar would never produce.
    */
  private class Harness(pipelineInputs: Boolean) extends Component {
    val io = new Bundle {
      val arValid   = in Bool ()
      val arReady   = in Bool ()
      val arId      = in UInt (axiCfg.idWidth bits)
      val arRegionB = in Bool ()
      val rValid    = in Bool ()
      val rReady    = in Bool ()
      val rId       = in UInt (axiCfg.idWidth bits)
      val rLast     = in Bool ()
      val awValid   = in Bool ()
      val awReady   = in Bool ()
      val awId      = in UInt (axiCfg.idWidth bits)
      val awRegionB = in Bool ()
      val bValid    = in Bool ()
      val bReady    = in Bool ()
      val bId       = in UInt (axiCfg.idWidth bits)

      val sspidViolation = out Bool ()
      val twoIdsLive     = out Bool ()
      val deepLive       = out Bool ()
      val crossHeld      = out Bool ()
      val deepCrossHeld  = out Bool ()
      val overflow       = out Bool ()
    }

    val obs = Axi4MasterObs(axiCfg)
    obs.arValid := io.arValid
    obs.arReady := io.arReady
    obs.arId    := io.arId
    obs.arAddr  := io.arRegionB ? U(baseB, 32 bits) | U(baseA, 32 bits)
    obs.rValid  := io.rValid
    obs.rReady  := io.rReady
    obs.rId     := io.rId
    obs.rLast   := io.rLast
    obs.awValid := io.awValid
    obs.awReady := io.awReady
    obs.awId    := io.awId
    obs.awAddr  := io.awRegionB ? U(baseB, 32 bits) | U(baseA, 32 bits)
    obs.bValid  := io.bValid
    obs.bReady  := io.bReady
    obs.bId     := io.bId

    val probe = Axi4OrderingProbe(
      obs,
      Axi4OrderingProbeConfig(idCount = 4, regionBit, pipelineInputs = pipelineInputs)
    )
    io.sspidViolation := probe.sspidViolation
    io.twoIdsLive     := probe.twoIdsLive
    io.deepLive       := probe.deepLive
    io.crossHeld      := probe.crossHeld
    io.deepCrossHeld  := probe.deepCrossHeld
    io.overflow       := probe.overflow
  }

  /** One cycle of stimulus, as the probe sees it. */
  private case class Beat(
    arValid: Boolean = false,
    arReady: Boolean = false,
    arId: Int = 0,
    arRegionB: Boolean = false,
    rValid: Boolean = false,
    rReady: Boolean = false,
    rId: Int = 0,
    rLast: Boolean = true,
    awValid: Boolean = false,
    awReady: Boolean = false,
    awId: Int = 0,
    awRegionB: Boolean = false,
    bValid: Boolean = false,
    bReady: Boolean = false,
    bId: Int = 0
  )

  /** Every sequence is run against both settings of `pipelineInputs`, and both have to reach the
    * same verdict. That is the claim the switch rests on -- delaying everything the probe sees by
    * the same cycle shifts the sequence it walks without changing it -- and it is cheap to hold the
    * probe to it here rather than to argue it in a comment.
    */
  private def drive(name: String, beats: Seq[Beat])(check: Harness => Unit): Unit =
    for (pipelined <- Seq(false, true))
      driveOne(s"$name-pipelined-$pipelined", pipelined, beats)(check)

  private def driveOne(name: String, pipelineInputs: Boolean, beats: Seq[Beat])(
    check: Harness => Unit
  ): Unit =
    simCfg.compile(new Harness(pipelineInputs)).doSim(name) { dut =>
      val cd = dut.clockDomain
      cd.forkStimulus(10)

      def idle(): Unit = {
        dut.io.arValid #= false
        dut.io.arReady #= false
        dut.io.rValid #= false
        dut.io.rReady #= false
        dut.io.awValid #= false
        dut.io.awReady #= false
        dut.io.bValid #= false
        dut.io.bReady #= false
      }

      idle()
      dut.io.arId #= 0
      dut.io.arRegionB #= false
      dut.io.rId #= 0
      dut.io.rLast #= true
      dut.io.awId #= 0
      dut.io.awRegionB #= false
      dut.io.bId #= 0
      // The registers come up randomised in SpinalSim, so nothing is read
      // until a clocked reset has been through them.
      cd.waitSampling(5)

      for (b <- beats) {
        dut.io.arValid #= b.arValid
        dut.io.arReady #= b.arReady
        dut.io.arId #= b.arId
        dut.io.arRegionB #= b.arRegionB
        dut.io.rValid #= b.rValid
        dut.io.rReady #= b.rReady
        dut.io.rId #= b.rId
        dut.io.rLast #= b.rLast
        dut.io.awValid #= b.awValid
        dut.io.awReady #= b.awReady
        dut.io.awId #= b.awId
        dut.io.awRegionB #= b.awRegionB
        dut.io.bValid #= b.bValid
        dut.io.bReady #= b.bReady
        dut.io.bId #= b.bId
        cd.waitSampling()
      }
      idle()
      // One extra cycle for the delayed copy to drain, so the pipelined and
      // unpipelined runs are read at the same point in the sequence.
      cd.waitSampling(3)
      check(dut)
    }

  /** An accepted read address. */
  private def ar(id: Int, regionB: Boolean) =
    Beat(arValid = true, arReady = true, arId = id, arRegionB = regionB)

  /** A read address presented and refused -- the fabric holding it. */
  private def arHeld(id: Int, regionB: Boolean) =
    Beat(arValid = true, arReady = false, arId = id, arRegionB = regionB)

  /** The last beat of a read response. */
  private def rDone(id: Int) = Beat(rValid = true, rReady = true, rId = id, rLast = true)

  test("a request admitted for the other region while the ID is live breaks the rule") {
    // Nothing is reordered here: A0 is issued first and answered first. The
    // rule is still broken, because the ID was admitted to a second slave
    // while the first still owed it a response -- and a probe that waited for
    // a wrong answer would call this run clean.
    drive(
      "sspid",
      Seq(
        ar(1, regionB = false),
        Beat(),
        ar(1, regionB = true), // the violation
        Beat(),
        rDone(1),
        rDone(1)
      )
    ) { dut =>
      assert(
        dut.io.sspidViolation.toBoolean,
        "admitting a live ID at a second slave went unnoticed"
      )
    }
  }

  test("a request admitted as the last outstanding one retires is legal") {
    // The thread is free again on the cycle it retires, so a fabric that takes
    // advantage of that is doing the right thing and must not be reported.
    drive(
      "same-cycle",
      Seq(
        ar(2, regionB = false),
        Beat(),
        // Admit the crossing request on the very cycle the first one finishes.
        Beat(
          arValid = true,
          arReady = true,
          arId = 2,
          arRegionB = true,
          rValid = true,
          rReady = true,
          rId = 2,
          rLast = true
        ),
        Beat(),
        rDone(2)
      )
    ) { dut =>
      assert(
        !dut.io.sspidViolation.toBoolean,
        "a request admitted as the last outstanding one retired was called a violation"
      )
    }
  }

  test("a cross request held while two of that ID are live is the evidence that matters") {
    drive(
      "deep-cross-held",
      Seq(
        ar(0, regionB = false),
        ar(0, regionB = false),    // two live at region A
        arHeld(0, regionB = true), // presented, refused: the gate doing its job
        arHeld(0, regionB = true),
        rDone(0),
        rDone(0),
        ar(0, regionB = true) // admitted once both retired
      )
    ) { dut =>
      assert(dut.io.deepLive.toBoolean, "two bursts live under one ID went unrecorded")
      assert(dut.io.crossHeld.toBoolean, "a held crossing request went unrecorded")
      assert(
        dut.io.deepCrossHeld.toBoolean,
        "a crossing request held against two live bursts went unrecorded -- this is the case the " +
          "whole build exists to reach"
      )
      assert(!dut.io.sspidViolation.toBoolean, "the legal sequence was reported as a violation")
    }
  }

  test("evidence is not claimed for traffic that never asked for it") {
    // One burst at a time, one ID, never crossing while live: a fabric could
    // have no gate at all and this would still pass, which is why the SoC
    // requires the evidence bits rather than only the absence of violations.
    drive(
      "no-evidence",
      Seq(
        ar(0, regionB = false),
        rDone(0),
        ar(0, regionB = true),
        rDone(0),
        ar(1, regionB = false),
        rDone(1)
      )
    ) { dut =>
      assert(!dut.io.sspidViolation.toBoolean, "a legal sequence was reported as a violation")
      assert(!dut.io.deepCrossHeld.toBoolean, "evidence was claimed for traffic that never asked")
      assert(!dut.io.twoIdsLive.toBoolean, "two IDs were never live at once")
      assert(!dut.io.deepLive.toBoolean, "one ID never had two bursts live")
    }
  }

  test("two IDs outstanding at once is recorded, and the directions are judged apart") {
    drive(
      "two-ids-and-directions",
      Seq(
        ar(0, regionB = false),
        // A write for the same ID at the *other* region: legal, because AXI4
        // orders reads and writes independently.
        Beat(awValid = true, awReady = true, awId = 0, awRegionB = true),
        ar(1, regionB = false), // two IDs live on the read side
        Beat(),
        rDone(0),
        rDone(1),
        Beat(bValid = true, bReady = true, bId = 0)
      )
    ) { dut =>
      assert(dut.io.twoIdsLive.toBoolean, "two IDs live at once went unrecorded")
      assert(
        !dut.io.sspidViolation.toBoolean,
        "an ID live at one region for reads and the other for writes is legal and was reported"
      )
    }
  }

  test("a write admitted at a second slave while the ID is live breaks the rule too") {
    drive(
      "sspid-write",
      Seq(
        Beat(awValid = true, awReady = true, awId = 3, awRegionB = false),
        Beat(),
        Beat(awValid = true, awReady = true, awId = 3, awRegionB = true), // the violation
        Beat(),
        Beat(bValid = true, bReady = true, bId = 3),
        Beat(bValid = true, bReady = true, bId = 3)
      )
    ) { dut =>
      assert(
        dut.io.sspidViolation.toBoolean,
        "the write channels are under the same rule and were not being watched"
      )
    }
  }
}
