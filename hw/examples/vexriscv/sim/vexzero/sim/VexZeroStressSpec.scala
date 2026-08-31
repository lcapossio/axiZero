// Copyright (c) 2026 Leonardo Capossio — bard0 design  hello@bard0.com
// SPDX-License-Identifier: MIT
package vexzero.sim

import java.nio.file.{Files, Paths}
import org.scalatest.funsuite.AnyFunSuite
import scala.collection.mutable
import spinal.core._
import spinal.core.sim._
import axizero.{ArbitrationPolicy, QosBased, RoundRobin}
import vexzero._

// ---------------------------------------------------------------------------
// VexZeroStressSpec  —  a real program on a crossbar that is actually loaded
//
// [[VexZeroBenchSpec]] proves Dhrystone runs correctly over the interconnect,
// and [[VexZeroProfileSpec]] measures what that costs the interconnect: almost
// nothing. Uncached, VexRiscv asks for 190,000 single beats and never has more
// than two in flight. Cached, it asks for eight-beat bursts but hits so often
// that the fabric is idle 92% of the time. Either way the two masters want the
// bus in the same cycle about one per cent of the run, so the arbiter is
// essentially never asked to arbitrate and the pipelined path is essentially
// never asked to pipeline.
//
// A benchmark that never loads the thing it is benchmarking cannot tell a good
// crossbar from an adequate one. This test loads it, and then checks that the
// program on top still got the right answers.
//
//   the CPU     runs the same unmodified Dhrystone, with caches on, so its
//               traffic is line refills — eight-beat INCR bursts — rather than
//               one transaction per instruction. The data cache is deliberately
//               small: Dhrystone's working set fits in 4 KiB, and a data cache
//               that never misses is a load/store port that never uses the bus.
//
//   the host    occupies the SoC's third master port, the one a debug cable
//               uses on the DE25-Nano, and drives it as hard as it will go:
//               16-beat bursts, several outstanding, AW deliberately running
//               ahead of W, aimed at the same RAM slave the CPU is fetching
//               from. See [[HostTraffic]].
//
// Both masters therefore contend for one slave for most of the run, which is
// the only condition under which arbitration, response routing and write-data
// routing are all being exercised at once. Three things are then checked, and
// the third is the one that matters:
//
//   1. every host burst returned exactly the words that address holds;
//   2. Dhrystone's own self-checks still all pass and it still exits zero;
//   3. the run really was contended, so 1 and 2 mean something.
//
// The same stress is run over the pipelined and the blocking crossbar. On
// Dhrystone alone those two are within about a per cent of each other, which
// says more about Dhrystone than about the crossbar; here the difference is
// whatever it actually is.
// ---------------------------------------------------------------------------
class VexZeroStressSpec extends AnyFunSuite {

  private val spinalCfg = SpinalConfig(
    defaultConfigForClockDomains = ClockDomainConfig(
      clockEdge = RISING,
      resetKind = SYNC,
      resetActiveLevel = LOW
    )
  )

  private def simCfg = SimConfig.withConfig(spinalCfg)

  private val hexPath     = "third_party/VexRiscv/src/test/resources/hex/dhrystoneO3.hex"
  private val ramBase     = BigInt("80000000", 16)
  private val benchIoBase = BigInt("F00FF000", 16)

  /** 64 KiB of RAM, of which the program occupies the bottom ~15 KiB and puts its stack below the
    * 32 KiB mark. The top 16 KiB is therefore free, and the host uses it as scratch.
    *
    * Nothing here relies on that being true: if the program did reach the scratch region, its own
    * self-checks and the host's read-backs would both fail, in opposite directions.
    */
  private val ramSize     = 64 * 1024
  private val scratchBase = ramBase.toLong + 0xc000
  private val scratchSize = 0x4000

  /** Long enough to be a real burst, short enough not to cross a 4 KiB boundary. */
  private val burstBeats = 16

  private case class StressRun(
    label: String,
    cycles: Long,
    timedCycles: Long,
    stats: Seq[AxiProfile],
    busyCycles: Long,
    contendedCycles: Long,
    host: HostTraffic
  ) {
    def dmipsPerMhz: Double  = DhrystoneConsole.dmipsPerMhz(timedCycles)
    def contendedPct: Double = 100.0 * contendedCycles / cycles
    def busyPct: Double      = 100.0 * busyCycles / cycles
    def beats: Long          = stats.map(_.beats).sum
    def transactions: Long   = stats.map(_.transactions).sum
  }

  private def stress(
    maxOutstanding: Int,
    label: String,
    name: String,
    arbitration: ArbitrationPolicy = RoundRobin,
    cpuQos: Int = 0,
    hostQos: Int = 0
  ): StressRun = {
    val image = HexImage.loadWords(hexPath, ramBase)
    val socConfig = VexZeroSocConfig(
      ramSize = ramSize,
      maxOutstanding = maxOutstanding,
      arbitration = arbitration,
      cpuQos = cpuQos,
      cachedCpu = true,
      // Sized to miss. At 4 KiB this port issues 63 reads in a whole run; at
      // 512 B it issues thousands, all of them line refills, which is the only
      // way the load/store port contributes bursts to the load at all.
      dCacheSize = 512,
      hostMaster = true,
      benchIoBase = Some(benchIoBase),
      bootImage = image
    )

    var run: StressRun = null
    val compiled = simCfg.compile {
      val dut = new VexZeroSoc(socConfig)
      AxiProfile.publish(dut.fabric.io.masters)
      dut
    }

    compiled.doSim(name) { dut =>
      SimTimeout(400000000)
      dut.io.switches #= 0
      dut.io.bench.charOut.ready #= true
      dut.clockDomain.forkStimulus(10)

      val stats = Seq(
        new AxiProfile("instruction fetch"),
        new AxiProfile("load / store"),
        new AxiProfile("host")
      )
      val console = new mutable.StringBuilder
      var cycles  = 0L
      var busy    = 0L
      var contend = 0L

      dut.clockDomain.onSamplings {
        cycles += 1
        if (dut.io.bench.charOut.valid.toBoolean)
          console += dut.io.bench.charOut.payload.toInt.toChar

        val requesting = AxiProfile.sample(dut.fabric.io.masters, stats, cycles)
        if (requesting > 0) busy += 1
        if (requesting > 1) contend += 1
      }

      val host = new HostTraffic(dut.io.host, dut.clockDomain, qos = hostQos)
      host.start()

      // ── The load ─────────────────────────────────────────────────────────
      // Two kinds of traffic, alternating, both aimed at the RAM the CPU is
      // running out of:
      //
      //   text     read the program back from where it is being fetched. This
      //            is the traffic that collides with instruction-cache
      //            refills, and the boot image says what every word must be.
      //
      //   scratch  write a pattern into the unused top of the RAM and read it
      //            back. Reads and writes are unordered against each other in
      //            AXI, so the read-back waits for the write's B response;
      //            everything else stays overlapped on purpose.
      val feeder = fork {
        val textWords = math.min(image.length, 0x2000 / 4)
        var round     = 0
        while (!dut.io.bench.done.toBoolean) {
          if (host.backlog < 6) {
            // A burst of the program text, aligned so it cannot straddle 4 KiB.
            val word = (round * burstBeats) % math.max(1, textWords - burstBeats)
            val addr = ramBase.toLong + (word & ~(burstBeats - 1)) * 4
            val base = ((addr - ramBase.toLong) / 4).toInt
            host.read(addr, (0 until burstBeats).map(i => image(base + i)))

            // A scratch round-trip, written and then verified. The stride is one
            // whole burst, so no round can still be reading an address that the
            // next round is already writing -- AXI orders nothing between the
            // read and write channels, and a shorter stride turns that into a
            // data mismatch that looks exactly like a crossbar fault.
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

      val stalled = dut.clockDomain.waitSamplingWhere(40000000)(dut.io.bench.done.toBoolean)
      assert(!stalled, s"$label: Dhrystone never finished; console so far:\n$console")
      feeder.join()
      host.halt()

      val text = console.toString
      DhrystoneConsole.verify(text)
      assert(dut.io.bench.exitCode.toLong == 0, s"$label: Dhrystone exited non-zero")

      run = StressRun(label, cycles, DhrystoneConsole.userCycles(text), stats, busy, contend, host)
    }
    run
  }

  private def report(run: StressRun): Unit = {
    println()
    println(s"  ---- ${run.label} ----")
    println(
      f"  run            : ${run.cycles}%,d cycles, ${run.timedCycles}%,d timed " +
        f"(${run.dmipsPerMhz}%.3f DMIPS/MHz)"
    )
    print(AxiProfile.report(run.stats))
    println(
      f"  carried        : ${run.transactions}%,d transactions, ${run.beats}%,d beats"
    )
    println(
      f"  host checked   : ${run.host.reads}%,d read bursts (${run.host.readBeats}%,d beats), " +
        f"${run.host.writes}%,d write bursts (${run.host.writeBeats}%,d beats), " +
        f"${run.host.mismatches.length}%d mismatches"
    )
    println(
      f"  fabric busy    : ${run.busyCycles}%,d cycles (${run.busyPct}%.1f%%), " +
        f"contended ${run.contendedCycles}%,d (${run.contendedPct}%.1f%%)"
    )
  }

  private def check(run: StressRun): Unit = {
    // 1. The host got back what it asked for, beat by beat.
    assert(
      run.host.mismatches.isEmpty,
      s"${run.label}: the crossbar returned wrong data under load:\n  " +
        run.host.mismatches.mkString("\n  ")
    )
    // Tens of thousands of each are expected; these thresholds only have to be
    // high enough that a port which quietly stopped issuing is caught.
    assert(
      run.host.reads > 5000,
      s"${run.label}: the host only completed ${run.host.reads} read bursts"
    )
    assert(
      run.host.writes > 2500,
      s"${run.label}: the host only completed ${run.host.writes} write bursts"
    )

    // 2. The traffic really was the shape this test exists to create.
    val hostStat = run.stats(2)
    assert(
      hostStat.readLens.contains(burstBeats - 1) && hostStat.writeLens.contains(burstBeats - 1),
      s"${run.label}: the host issued no $burstBeats-beat burst: " +
        s"read ${hostStat.readSummary}, write ${hostStat.writeSummary}"
    )
    assert(
      run.host.peakOutstanding > 1,
      s"${run.label}: the host never had more than one read in flight, so nothing was pipelined"
    )
    assert(
      run.stats(0).readLens.contains(7),
      s"${run.label}: instruction fetch issued no line refill: ${run.stats(0).readSummary}"
    )
    // Both CPU ports have to be pulling their weight, not just the fetcher.
    assert(
      run.stats(1).readLens.getOrElse(7, 0L) > 1000,
      s"${run.label}: the load/store port issued only " +
        s"${run.stats(1).readLens.getOrElse(7, 0L)} line refills, so it is barely on the bus: " +
        s"${run.stats(1).readSummary}"
    )

    // 3. And it really was contended, which is what makes 1 mean anything.
    assert(
      run.contendedPct > 10.0,
      f"${run.label}: masters collided in only ${run.contendedPct}%.1f%% of cycles, so this is " +
        "not the load this test is supposed to apply"
    )
  }

  test("the crossbar carries Dhrystone correctly while a third master saturates it") {
    assume(
      Files.isRegularFile(Paths.get(hexPath)),
      s"$hexPath is missing — run: git submodule update --init third_party/VexRiscv"
    )

    val pipelined =
      stress(maxOutstanding = 4, "pipelined, max_outstanding = 4", "vexzero_stress_pipelined")
    val blocking =
      stress(maxOutstanding = 1, "blocking, max_outstanding = 1", "vexzero_stress_blocking")

    report(pipelined)
    report(blocking)

    println()
    println("  ---- Pipelined against blocking, under load ----")
    println(
      f"  Dhrystone      : ${pipelined.timedCycles}%,d vs ${blocking.timedCycles}%,d timed cycles " +
        f"(${100.0 * (blocking.timedCycles - pipelined.timedCycles) / blocking.timedCycles}%+.1f%% " +
        "for the pipelined path)"
    )
    println(
      f"  host bursts    : ${pipelined.host.reads}%,d vs ${blocking.host.reads}%,d reads completed " +
        f"in ${pipelined.cycles}%,d vs ${blocking.cycles}%,d cycles"
    )
    println(
      f"  host latency   : ${pipelined.stats(2).readLatency}%.1f vs " +
        f"${blocking.stats(2).readLatency}%.1f cycles per read burst"
    )
    println(
      f"  peak in flight : ${pipelined.stats.map(_.maxOutstanding).max}%d vs " +
        f"${blocking.stats.map(_.maxOutstanding).max}%d"
    )
    println()

    check(pipelined)
    check(blocking)
  }

  // -------------------------------------------------------------------------
  // QoS, and the condition under which it stops meaning anything
  //
  // QosCrossbarSpec already shows that a higher AXQOS wins a grant and that a
  // starved low-QoS requester is eventually let through. The question an
  // integrator actually has is different: if I rank the CPU above a bulk
  // transfer, how much of the bus does that move?
  //
  // The answer depends on something the unit tests cannot show, because it
  // only appears when transactions are long enough to make masters wait. The
  // crossbar boosts a waiting master's effective priority by one per cycle and
  // saturates it at 15 (Axi4Crossbar.qosAgeMax), so the ranking is erased once
  // the low-ranked master has waited its own distance from 15. Rank 12 against
  // 2 and the difference is intact after a ten-cycle wait and gone after
  // thirteen, whatever the two numbers were.
  //
  // So this runs the same ranking at two burst lengths. Four beats: waits are
  // short, ranking decides the split. Sixteen beats: every wait outlasts the
  // boost, both masters arrive saturated at 15, and the arbiter falls back to
  // round-robin between them — ranking buys almost nothing. That is not a
  // defect, it is the anti-starvation mechanism doing exactly what it says,
  // and it is the difference between a QoS setting that will work in a system
  // and one that will quietly do nothing.
  //
  // Each run is a fixed window rather than a whole Dhrystone: the question is
  // how the bus was shared, not whether the program finished, and the test
  // above already answers the latter.
  // -------------------------------------------------------------------------
  private case class ShareRun(
    label: String,
    burst: Int,
    stats: Seq[AxiProfile],
    host: HostTraffic
  ) {
    def cpuGrants: Long   = stats(0).transactions + stats(1).transactions
    def hostGrants: Long  = stats(2).transactions
    def hostShare: Double = 100.0 * hostGrants / (cpuGrants + hostGrants)
  }

  /** Run the saturating load for a fixed window under QosBased arbitration, and report who got the
    * bus.
    */
  private def qosShare(
    burst: Int,
    cpuQos: Int,
    hostQos: Int,
    window: Int,
    label: String,
    name: String
  ): ShareRun = {
    val image = HexImage.loadWords(hexPath, ramBase)
    val socConfig = VexZeroSocConfig(
      ramSize = ramSize,
      maxOutstanding = 4,
      arbitration = QosBased,
      cpuQos = cpuQos,
      cachedCpu = true,
      dCacheSize = 512,
      hostMaster = true,
      benchIoBase = Some(benchIoBase),
      bootImage = image
    )

    var run: ShareRun = null
    val compiled = simCfg.compile {
      val dut = new VexZeroSoc(socConfig)
      AxiProfile.publish(dut.fabric.io.masters)
      dut
    }

    compiled.doSim(name) { dut =>
      SimTimeout(400000000)
      dut.io.switches #= 0
      dut.io.bench.charOut.ready #= true
      dut.clockDomain.forkStimulus(10)

      val stats = Seq(
        new AxiProfile("instruction fetch"),
        new AxiProfile("load / store"),
        new AxiProfile("host")
      )
      var cycles = 0L
      dut.clockDomain.onSamplings {
        cycles += 1
        AxiProfile.sample(dut.fabric.io.masters, stats, cycles)
      }

      val host = new HostTraffic(dut.io.host, dut.clockDomain, qos = hostQos)
      host.start()

      var feeding = true
      val feeder = fork {
        var round = 0
        while (feeding) {
          if (host.backlog < 6) {
            val textWords = math.min(image.length, 0x2000 / 4)
            val word      = (round * burst) % math.max(1, textWords - burst)
            val addr      = ramBase.toLong + (word & ~(burst - 1)) * 4
            val base      = ((addr - ramBase.toLong) / 4).toInt
            host.read(addr, (0 until burst).map(i => image(base + i)))

            val offset  = (round * burst * 4) % (scratchSize - burst * 4)
            val target  = scratchBase + offset
            val pattern = (0 until burst).map(i => (round.toLong << 16 | i) & 0xffffffffL)
            host.write(target, pattern)
            host.drainWrites()
            host.read(target, pattern)
            round += 1
          } else dut.clockDomain.waitSampling()
        }
      }

      dut.clockDomain.waitSampling(window)
      feeding = false
      feeder.join()
      host.halt()

      run = ShareRun(label, burst, stats, host)
    }
    run
  }

  private def reportShare(a: ShareRun, b: ShareRun): Unit = {
    println()
    println(s"  ---- ${a.burst}-beat bursts ----")
    for (r <- Seq(a, b)) {
      println(
        f"  ${r.label}%-22s cpu ${r.cpuGrants}%,7d  host ${r.hostGrants}%,7d  " +
          f"host share ${r.hostShare}%5.1f%%  host latency ${r.stats(2).readLatency}%5.1f cycles"
      )
    }
    println(f"  ${"ranking moved the split by"}%-22s ${b.hostShare - a.hostShare}%+.1f points")
  }

  test("QoS decides how a saturated crossbar is shared, until the age boost erases it") {
    assume(
      Files.isRegularFile(Paths.get(hexPath)),
      s"$hexPath is missing — run: git submodule update --init third_party/VexRiscv"
    )

    val window = 300000

    // Short bursts: a waiting master is granted again before the boost can
    // close a ten-point gap, so the ranking is what decides the split.
    val shortCpu =
      qosShare(4, 12, 2, window, "CPU 12, host 2", "vexzero_qos_short_cpu")
    val shortHost =
      qosShare(4, 2, 12, window, "CPU 2, host 12", "vexzero_qos_short_host")

    // Long bursts: every wait outlasts the boost, both arrive at 15, and the
    // arbiter is round-robin again no matter what was asked for.
    val longCpu =
      qosShare(16, 12, 2, window, "CPU 12, host 2", "vexzero_qos_long_cpu")
    val longHost =
      qosShare(16, 2, 12, window, "CPU 2, host 12", "vexzero_qos_long_host")

    reportShare(shortCpu, shortHost)
    reportShare(longCpu, longHost)

    val shortSwing = shortHost.hostShare - shortCpu.hostShare
    val longSwing  = longHost.hostShare - longCpu.hostShare
    println()
    println("  ---- What the ranking was worth ----")
    println(f"  4-beat bursts  : $shortSwing%+.1f points of bus share")
    println(f"  16-beat bursts : $longSwing%+.1f points of bus share")
    println(
      "  a waiting master gains one point of effective QoS per cycle up to 15,"
    )
    println(
      "  so a burst long enough to make the low-ranked master wait its own"
    )
    println(
      "  distance from 15 erases the ranking before the arbiter ever sees it"
    )
    println()

    // Nothing here is worth reading if the data came back wrong.
    for (r <- Seq(shortCpu, shortHost, longCpu, longHost)) {
      assert(
        r.host.mismatches.isEmpty,
        s"${r.burst}-beat ${r.label}: the crossbar returned wrong data:\n  " +
          r.host.mismatches.mkString("\n  ")
      )
      assert(
        r.hostGrants > 500 && r.cpuGrants > 500,
        s"${r.burst}-beat ${r.label}: too little traffic to compare " +
          s"(cpu ${r.cpuGrants}, host ${r.hostGrants})"
      )
      assert(
        r.stats(2).readLens.contains(r.burst - 1),
        s"${r.burst}-beat ${r.label}: the host issued no ${r.burst}-beat burst: " +
          r.stats(2).readSummary
      )
    }

    // 1. With short transactions, ranking decides the split, and by a margin
    //    nobody would mistake for noise.
    assert(
      shortSwing > 5.0,
      f"swapping the ranking moved the bus share by only $shortSwing%+.1f points at 4-beat " +
        "bursts, where the age boost should not have had time to erase a ten-point gap"
    )

    // 2. With long ones it does not, because the boost got there first. Pinned
    //    so that a change to qosAgeMax has to be noticed here.
    assert(
      math.abs(longSwing) < shortSwing / 2,
      f"at 16-beat bursts the ranking moved the share by $longSwing%+.1f points against " +
        f"$shortSwing%+.1f at 4 beats — if the age boost no longer erases the gap, this test " +
        "and the README section on it need rewriting"
    )

    // 3. Neither ranking starves the loser in either regime. This is the whole
    //    reason the boost exists, and it has to hold where QoS is effective.
    for ((a, b) <- Seq(shortCpu -> shortHost, longCpu -> longHost)) {
      assert(
        a.hostShare > 10.0 && b.hostShare < 90.0,
        f"${a.burst}%d-beat: a ranking left one master with almost nothing " +
          f"(host share ${a.hostShare}%.1f%% when ranked low, ${b.hostShare}%.1f%% when high)"
      )
    }
  }
}
