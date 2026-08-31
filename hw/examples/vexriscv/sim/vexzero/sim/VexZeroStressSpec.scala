// Copyright (c) 2026 Leonardo Capossio — bard0 design  hello@bard0.com
// SPDX-License-Identifier: MIT
package vexzero.sim

import java.nio.file.{Files, Paths}
import org.scalatest.funsuite.AnyFunSuite
import scala.collection.mutable
import spinal.core._
import spinal.core.sim._
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

  private def stress(maxOutstanding: Int, label: String, name: String): StressRun = {
    val image = HexImage.loadWords(hexPath, ramBase)
    val socConfig = VexZeroSocConfig(
      ramSize = ramSize,
      maxOutstanding = maxOutstanding,
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

      val host = new HostTraffic(dut.io.host, dut.clockDomain)
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

            // A scratch round-trip, written and then verified.
            val offset  = (round * burstBeats * 4) % (scratchSize - burstBeats * 4)
            val target  = scratchBase + (offset & ~0x3f)
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
}
