// Copyright (c) 2026 Leonardo Capossio — bard0 design  hello@bard0.com
// SPDX-License-Identifier: MIT
package vexzero.sim

import org.scalatest.funsuite.AnyFunSuite
import scala.collection.mutable
import spinal.core._
import spinal.core.sim._
import axizero.verif.Axi4ProtocolChecker
import vexzero._
import vexzero.VexZeroStress.{Axi3, Ids, Qos, Rr, Wrr}

// ---------------------------------------------------------------------------
// VexZeroGenStressSpec  —  arbitration, judged on a loaded crossbar
//
// This is the VexRiscv replacement for the MicroBlaze wrr / qos / qos_stress
// Arty suites. Those needed a Xilinx CPU, ten Xilinx IPs and a block design to
// say what this says, and could only ever be built for one vendor. The thing
// that actually did the work in them — a saturating self-checking generator —
// was ours all along and is now [[axizero.verif.AxiSatGen]], in SpinalHDL, so
// it runs here in simulation and on both boards from the same source.
//
// What is being asked
// ───────────────────
// An arbitration policy is only observable when masters collide. A CPU alone
// does not collide with anything: [[VexZeroProfileSpec]] measured this SoC
// running Dhrystone and found the two CPU ports both wanting the bus in about
// one cycle per hundred. So every test here adds two generators that saturate
// the RAM slave and never stop, and then asks three separate questions:
//
//   1. Does the fabric still move the right data? Each generator reads back
//      every word it wrote, and the firmware's own self test still has to
//      produce the right checksum, LEDs and characters while they do it.
//   2. Does the fabric still obey AXI4? Every port is watched by a protocol
//      checker for the whole run.
//   3. Does the policy do what it claims? Round-robin should split the slave
//      evenly, weights should split it in the ratio asked for, and QoS should
//      rank one generator over another. Correct data under contention says
//      nothing about this — a badly skewed arbiter still returns right
//      answers, just not to everyone.
//
// Question 3 is the one the retired suites existed for, and the one a value
// check can never reach.
//
// Contention is asserted, not assumed. If the generators failed to load the
// fabric, questions 1 and 2 would be answered under no load at all and every
// test here would pass while proving nothing, so each run counts the cycles in
// which more than one master had a request up and requires that it is a large
// fraction of the run.
//
// One test per bitstream
// ──────────────────────
// The configurations come from [[VexZeroStress]], which is also what the board
// generators build from, so each test here simulates exactly the design that
// goes onto the Arty and the DE25-Nano -- not something shaped like it. A
// hardware run confirms a simulation only if the two were the same design.
// ---------------------------------------------------------------------------
class VexZeroGenStressSpec extends AnyFunSuite {

  private val spinalCfg = SpinalConfig(
    defaultConfigForClockDomains = ClockDomainConfig(
      clockEdge = RISING,
      resetKind = SYNC,
      resetActiveLevel = LOW
    )
  )

  private def simCfg = SimConfig.withConfig(spinalCfg)

  private val switchValue = 0x5

  /** One multi-ID generator's own verdict, read out of the DUT at the end of a run. */
  private case class MultiIdReport(
    dataErrors: Int,
    respErrors: Int,
    orderErrors: Int,
    laps: Int,
    stalled: Boolean,
    multiIdSeen: Boolean,
    crossSlaveTried: Boolean,
    /** What the probe at the crossbar's own master port saw; see [[Axi4OrderingProbe]]. */
    sspidViolation: Boolean,
    probeTwoIdsLive: Boolean,
    probeDeepLive: Boolean,
    probeDeepCrossHeld: Boolean,
    probeOverflow: Boolean
  )

  /** What one run measured, so a test can assert on the parts it cares about. */
  private case class Run(
    stats: Seq[AxiProfile],
    contendedCycles: Long,
    cycles: Long,
    genOk: Boolean,
    genFault: Int,
    violations: BigInt,
    overflow: Boolean,
    axisOk: Boolean,
    axisStatus: Long,
    /** Transactions the load/store port issued while the firmware was running.
      *
      * Counted separately from the profile because the profile window starts after the boot, and by
      * then the firmware has finished and is spinning in place -- it issues no loads or stores at
      * all. Anything that wants to claim the load/store path carried real traffic has to look here.
      */
    bootStoreLoads: Long,
    /** What the multi-ID generators reported, empty in the builds that have none. Each entry is one
      * generator: data, response and ordering error counts, laps, and the two pieces of evidence
      * that the traffic was what it claims -- more than one ID in flight at once, and an ID asking
      * to move to the other RAM while it was still live at one.
      */
    multiId: Seq[MultiIdReport] = Nil
  ) {
    def contendedFraction: Double = contendedCycles.toDouble / cycles

    /** Read beats the crossbar delivered to a master port. The generators ask for identical work,
      * so comparing two of these is comparing what the arbiter let through.
      */
    def beats(masterIndex: Int): Long = stats(masterIndex).beats
  }

  private val genMaster0 = 2 // masters: 0 fetch, 1 load/store, then generators
  private val genMaster1 = 3

  /** Boot the SoC, let the generators load it, and report what happened.
    *
    * `runCycles` is counted after the firmware finishes, so the measured window is generators and
    * CPU together at steady state rather than the boot transient.
    */
  private def run(
    socConfig: VexZeroSocConfig,
    name: String,
    runCycles: Int = 60000
  ): Run = {
    var result: Run = null
    simCfg
      .compile {
        val dut = new VexZeroSoc(socConfig)
        AxiProfile.publish(dut.fabric.io.masters)
        AxiProfile.publishRequests(dut.fabric.xbar.io.masters)
        dut.busCheck.foreach { bc =>
          bc.checkers.foreach { c => c.sticky.simPublic(); c.overflow.simPublic() }
        }
        dut.orderProbes.foreach { p =>
          p.sspidViolation.simPublic()
          p.twoIdsLive.simPublic()
          p.deepLive.simPublic()
          p.crossHeld.simPublic()
          p.deepCrossHeld.simPublic()
          p.overflow.simPublic()
        }
        dut.multiIdGens.foreach { g =>
          g.io.dataErrors.simPublic()
          g.io.respErrors.simPublic()
          g.io.orderErrors.simPublic()
          g.io.laps.simPublic()
          g.io.stalled.simPublic()
          g.io.multiIdSeen.simPublic()
          g.io.crossSlaveTried.simPublic()
        }
        dut
      }
      .doSim(name) { dut =>
        dut.io.switches #= switchValue
        dut.clockDomain.forkStimulus(10)

        val chars          = mutable.ArrayBuffer[Char]()
        val dPort          = dut.fabric.io.masters(1)
        var booting        = true
        var bootStoreLoads = 0L
        dut.clockDomain.onSamplings {
          if (dut.io.charOut.valid.toBoolean) chars += dut.io.charOut.payload.toInt.toChar
          if (booting) {
            if (dPort.ar.valid.toBoolean && dPort.ar.ready.toBoolean) bootStoreLoads += 1
            if (dPort.aw.valid.toBoolean && dPort.aw.ready.toBoolean) bootStoreLoads += 1
          }
        }

        // ── Boot ────────────────────────────────────────────────────────
        // The firmware is 37 instructions, but it is now competing with two
        // saturating masters for the RAM it fetches from, so it takes far
        // longer than the 20,000 cycles VexZeroSocSpec allows it.
        val timedOut = dut.clockDomain.waitSamplingWhere(400000)(
          dut.io.status.toLong == Firmware.doneMarker
        )
        assert(
          !timedOut,
          "firmware never finished under load — either it is starved or the fabric stopped " +
            s"(status=0x${dut.io.status.toLong.toHexString})"
        )

        val expectedResult = Firmware.checksum + switchValue
        assert(
          dut.io.result.toLong == expectedResult,
          s"result=${dut.io.result.toLong} under load, expected $expectedResult"
        )
        val expectedLeds = Firmware.checksum & ((1L << socConfig.ledWidth) - 1)
        assert(
          dut.io.leds.toLong == expectedLeds,
          s"leds=0x${dut.io.leds.toLong.toHexString}, expected 0x${expectedLeds.toHexString}"
        )
        assert(chars.toSeq == Firmware.chars, s"charOut was ${chars.mkString}")
        booting = false

        // ── Measure ─────────────────────────────────────────────────────
        val ports = dut.fabric.io.masters
        val names = Seq("m0 fetch", "m1 load/store", "m2 gen0", "m3 gen1") ++
          (4 until ports.length).map(i => s"m$i multiId${i - 4}")
        val stats = names.take(ports.length).map(new AxiProfile(_))

        var cycle     = 0L
        var contended = 0L
        dut.clockDomain.onSamplings {
          // Per-port traffic is measured at the external ports, because latency
          // is what the master waited, register slices included. Contention is
          // measured one level in, at the arbiter's own inputs, because that is
          // where the choice is made -- see AxiProfile.contending.
          AxiProfile.sample(ports, stats, cycle)
          if (AxiProfile.contending(dut.fabric.xbar.io.masters) > 1) contended += 1
          cycle += 1
        }

        dut.clockDomain.waitSampling(runCycles)

        val sticky = dut.busCheck
          .map(_.checkers.map(_.sticky.toBigInt).foldLeft(BigInt(0))(_ | _))
          .getOrElse(BigInt(0))
        val overflow = dut.busCheck.exists(_.checkers.exists(_.overflow.toBoolean))

        result = Run(
          stats = stats,
          contendedCycles = contended,
          cycles = cycle,
          genOk = dut.io.genOk.toBoolean,
          genFault = dut.io.genFault.toInt,
          violations = sticky,
          overflow = overflow,
          axisOk = dut.io.axisOk.toBoolean,
          axisStatus = dut.io.axisStatus.toLong,
          bootStoreLoads = bootStoreLoads,
          multiId = dut.multiIdGens.zip(dut.orderProbes).map {
            case (g, p) =>
              MultiIdReport(
                dataErrors = g.io.dataErrors.toInt,
                respErrors = g.io.respErrors.toInt,
                orderErrors = g.io.orderErrors.toInt,
                laps = g.io.laps.toInt,
                stalled = g.io.stalled.toBoolean,
                multiIdSeen = g.io.multiIdSeen.toBoolean,
                crossSlaveTried = g.io.crossSlaveTried.toBoolean,
                sspidViolation = p.sspidViolation.toBoolean,
                probeTwoIdsLive = p.twoIdsLive.toBoolean,
                probeDeepLive = p.deepLive.toBoolean,
                probeDeepCrossHeld = p.deepCrossHeld.toBoolean,
                probeOverflow = p.overflow.toBoolean
              )
          }
        )
      }
    result
  }

  /** Everything that must hold whatever the policy is. */
  private def assertHealthy(r: Run, name: String): Unit = {
    assert(
      r.violations == 0,
      s"$name broke AXI4: ${Axi4ProtocolChecker.decode(r.violations).mkString(", ")}"
    )
    assert(!r.overflow, s"$name: a protocol checker lost track, so its silence proves nothing")
    assert(
      r.genFault == 0,
      f"$name: generator(s) 0x${r.genFault}%x miscompared, saw a bad response or stalled"
    )
    assert(r.genOk, s"$name: a generator either miscompared or never completed a lap")
    assert(
      r.contendedFraction > 0.5,
      f"$name was only contended ${r.contendedFraction * 100}%.1f%% of the run, so nothing here " +
        "says anything about arbitration"
    )
    // The stream island rides in every one of these bitstreams, so it is
    // judged in every one of these tests rather than in a build of its own.
    // It shares nothing with the bus, so a failure here is its own.
    assert(
      r.axisOk,
      f"$name: the stream island did not pass; status 0x${r.axisStatus}%08x, where bit 0 is done, " +
        "bit 1 pass, bit 2 fail and bits 3..10 the individual checks"
    )
  }

  private def report(name: String, r: Run): Unit = {
    println(s"\n── $name ──")
    println(f"  contended ${r.contendedFraction * 100}%.1f%% of ${r.cycles}%,d cycles")
    print(AxiProfile.report(r.stats))
    println(f"  gen0/gen1 beats ${r.beats(genMaster0)}%,d / ${r.beats(genMaster1)}%,d")
    println(f"  load/store transactions during boot ${r.bootStoreLoads}%,d")
    for ((g, i) <- r.multiId.zipWithIndex) {
      println(
        f"  multiId$i%d laps ${g.laps}%,d, errors ${g.dataErrors}%d data / ${g.respErrors}%d resp " +
          f"/ ${g.orderErrors}%d order, several IDs in flight ${g.multiIdSeen}%s, " +
          f"live ID asked to cross ${g.crossSlaveTried}%s"
      )
      println(
        f"           at the crossbar: rule broken ${g.sspidViolation}%s, two IDs live " +
          f"${g.probeTwoIdsLive}%s, one ID two deep ${g.probeDeepLive}%s, cross held against " +
          f"two ${g.probeDeepCrossHeld}%s"
      )
    }
  }

  // ── Multi-ID ordering ─────────────────────────────────────────────────────
  test("multi-ID: several IDs cross two RAMs and every answer comes back in order") {
    // What this build adds to the other four: masters that vary their ID. The
    // other four load the fabric with constant-ID traffic, so they say what it
    // does about arbitration and nothing about order -- and AXI4's ordering
    // rule is the one part of the design whose correctness depends on a master
    // using more than one ID. The generators check that in hardware, so this
    // test is asking the same question the bitstream will.
    val r = run(VexZeroStress.socConfig(Ids), "vexzero_gen_ids")
    report("multi-ID", r)
    assertHealthy(r, "multi-ID")

    assert(r.multiId.size == 2, s"expected two multi-ID generators, got ${r.multiId.size}")
    for ((g, i) <- r.multiId.zipWithIndex) {
      // Order first: it is the one these generators exist for, and a data
      // error is how a response that overtook another one shows up.
      assert(
        g.orderErrors == 0,
        s"multi-ID generator $i saw ${g.orderErrors} responses under an ID with nothing " +
          "outstanding, or a burst of the wrong length"
      )
      assert(g.dataErrors == 0, s"multi-ID generator $i read back ${g.dataErrors} wrong words")
      assert(g.respErrors == 0, s"multi-ID generator $i saw ${g.respErrors} bad responses")
      assert(!g.stalled, s"multi-ID generator $i stopped getting answers")
      assert(g.laps > 0, s"multi-ID generator $i never completed a lap, so it proved nothing")

      // And the evidence that the run was the run it claims to be. Without
      // these a clean result would be indistinguishable from a generator that
      // quietly issued one ID at a time to one RAM.
      assert(g.multiIdSeen, s"multi-ID generator $i never had two IDs outstanding at once")
      assert(
        g.crossSlaveTried,
        s"multi-ID generator $i never asked to move a live ID to the other RAM, so the " +
          "single-slave-per-ID rule was never put under load"
      )

      // And what the crossbar itself did about it. The generator sits behind a
      // register slice, which accepts requests the crossbar has not admitted,
      // so everything above is what this master asked for and not what the
      // ordering table held back. These come from the probe on the crossbar's
      // own master port, where READY is the admission decision.
      assert(
        !g.sspidViolation,
        s"the crossbar admitted generator $i's ID at a second slave while it was still live at " +
          "the first -- the single-slave-per-ID rule, broken, whether or not any answer came " +
          "back out of order"
      )
      assert(!g.probeOverflow, s"probe $i ran out of per-ID counter range, so its counts are stale")
      assert(g.probeTwoIdsLive, s"the crossbar never had two of generator $i's IDs live at once")
      assert(
        g.probeDeepLive,
        s"the crossbar never had two of one ID's bursts live at one slave for generator $i, so " +
          "its per-ID count was never asked for anything past zero-or-one"
      )
      assert(
        g.probeDeepCrossHeld,
        s"the crossbar never held a crossing request against two live bursts of the same ID for " +
          s"generator $i -- the case this build exists to reach"
      )
    }
  }

  // ── Round robin ───────────────────────────────────────────────────────────
  test("round robin: the fabric stays correct under saturation and splits it evenly") {
    val r = run(VexZeroStress.socConfig(Rr), "vexzero_gen_rr")
    report("round robin", r)
    assertHealthy(r, "round robin")

    // Two identical generators, no ranking: the share each got should be
    // within a few per cent. The bound is loose because they are not in
    // lockstep -- one is reading while the other writes -- but a policy that
    // ignored one of them entirely would be nowhere near it.
    val ratio = r.beats(genMaster0).toDouble / r.beats(genMaster1)
    assert(
      ratio > 0.8 && ratio < 1.25,
      f"round robin gave the two identical generators $ratio%.2f:1, which is not even"
    )
  }

  // ── Weighted round robin ──────────────────────────────────────────────────
  test("weighted round robin: the split follows the weights") {
    // VexZeroStress gives the CPU ports a weight of one and gen0 three times
    // gen1's, so the ratio under test is between the only two masters doing
    // identical work.
    val r = run(VexZeroStress.socConfig(Wrr), "vexzero_gen_wrr")
    report("weighted round robin 3:1", r)
    assertHealthy(r, "weighted round robin")

    val ratio = r.beats(genMaster0).toDouble / r.beats(genMaster1)
    // The generators are closed-loop -- each waits for its own responses --
    // so a 3:1 weight does not produce a 3:1 throughput; what has to hold is
    // that the weighted port is served clearly more, and that the other is
    // still served at all. A weight is a share, not a licence to starve.
    assert(ratio > 1.3, f"weights 3:1 produced only $ratio%.2f:1, so the weight did nothing")
    assert(
      r.beats(genMaster1) > 0,
      "the lower-weighted generator got nothing at all, which is starvation and not weighting"
    )
  }

  // ── QoS ───────────────────────────────────────────────────────────────────
  test("QoS: three ranks at once, and nothing at the bottom is starved") {
    // The board's QoS build puts the CPU at 12, gen0 at 6 and gen1 at 2, so
    // all three levels are in use and both claims the policy makes are on
    // trial in one run: bulk traffic is ranked against bulk traffic, and a
    // latency-sensitive master is ranked above both.
    val r = run(VexZeroStress.socConfig(Qos), "vexzero_gen_qos")
    report("QoS: CPU 12, gen0 6, gen1 2", r)
    assertHealthy(r, "QoS")

    val ratio = r.beats(genMaster0).toDouble / r.beats(genMaster1)
    assert(ratio > 1.15, f"QoS 6 over QoS 2 produced only $ratio%.2f:1, so the ranking did nothing")

    // Aging is the whole reason this policy is usable: a low-QoS master's
    // effective priority climbs one step per waiting cycle until it reaches
    // parity, so it is delayed rather than excluded. Had gen1 been shut out
    // it could not have completed a lap, and genOk -- which requires one --
    // would already have failed above.
    assert(
      r.beats(genMaster1) > r.beats(genMaster0) / 8,
      f"QoS 2 got ${r.beats(genMaster1)}%,d beats against ${r.beats(genMaster0)}%,d, which is " +
        "starvation rather than ranking"
    )

    // And the point of ranking the CPU: its worst wait for an instruction is
    // shorter than a generator's worst wait for data, on the same slave in
    // the same run.
    val fetchLatency = r.stats(0).maxReadLatency
    val gen0Latency  = r.stats(genMaster0).maxReadLatency
    assert(
      fetchLatency < gen0Latency,
      s"the ranked CPU's worst fetch waited $fetchLatency cycles against the generator's " +
        s"$gen0Latency, so ranking the CPU bought nothing"
    )
  }

  // ── AXI3 data path ────────────────────────────────────────────────────────
  test("AXI3: the CPU runs through the AXI3 adapter while the generators saturate the fabric") {
    // The VexRiscv replacement for the MicroBlaze axi3 suite. Every load and
    // store the firmware makes crosses Axi3ToAxi4Adapter, and it does so
    // while two generators keep the slave busy -- so the adapter has to hold
    // its responses together under back-pressure, not just in isolation.
    val r = run(VexZeroStress.socConfig(Axi3), "vexzero_gen_axi3")
    report("AXI3 load/store path", r)
    assertHealthy(r, "AXI3 data path")

    // The profile window above starts after the boot, and by then the firmware
    // is spinning and the load/store port is idle -- so the numbers printed for
    // m1 say nothing about the adapter. What does is the boot itself: the
    // firmware fills sixteen words, reads them back, and touches both Lite
    // peripherals, and every one of those crossed the adapter. The exact count
    // is not the point; that it is not zero is, because the value checks above
    // would pass on a RAM the CPU reached some other way.
    assert(
      r.bootStoreLoads >= 32,
      s"the load/store port issued only ${r.bootStoreLoads} transactions during boot, so the " +
        "AXI3 adapter was barely used and a passing run means little"
    )
  }

}
