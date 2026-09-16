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
// VexZeroProfileSpec  —  what Dhrystone actually asks of the interconnect
//
// Dhrystone shows the crossbar carries a real program correctly. On its own it
// says very little about what the crossbar can do, and the difference matters
// when quoting its numbers. Two questions, and they have different answers:
//
//   coverage   how much of the workload touches AXI at all?
//   pressure   how hard does that traffic push — burst lengths, transactions
//              in flight, and how often two masters want the bus at once?
//
// With the uncached CPU, coverage is total and pressure is nil: every
// instruction is a bus transaction, and every transaction is a single beat
// with at most one more behind it. That is the maximum possible coverage and
// close to the minimum possible pressure, which is why a benchmark run on this
// configuration cannot distinguish a good crossbar from an adequate one.
//
// Caches invert it. Coverage drops sharply — a hit never leaves the CPU — but
// every miss becomes an eight-beat INCR read burst and several transactions
// can be in flight at once. The write path does not change at all: VexRiscv's
// data cache has no dirty bit, so it is write-through by construction and
// every store leaves as a single beat whether the cache is there or not. No
// configuration of this CPU issues a write burst on AXI.
//
// Cache *size* then decides whether the data port uses the bus at all, which
// is why three configurations are compared and not two. Dhrystone's data
// working set fits inside a 4 KiB data cache with room to spare, so that
// configuration misses 63 times in a whole run and the load/store port very
// nearly stops existing as a bus master. Sized to miss, the same port issues
// thousands of line refills instead.
//
// None of the three loads the fabric, though — even the busiest leaves the
// masters colliding in well under 1% of cycles. Pressure has to come from
// somewhere other than this CPU, which is what [[VexZeroStressSpec]] supplies.
//
// The numbers it prints are the ones quoted in the README.
// ---------------------------------------------------------------------------
class VexZeroProfileSpec extends AnyFunSuite {

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

  private case class Run(
    label: String,
    cycles: Long,
    timedCycles: Long,
    stats: Seq[AxiProfile],
    busyCycles: Long,
    contendedCycles: Long
  ) {
    def transactions: Long   = stats.map(_.transactions).sum
    def beats: Long          = stats.map(_.beats).sum
    def beatsPerTxn: Double  = beats.toDouble / transactions
    def dmipsPerMhz: Double  = DhrystoneConsole.dmipsPerMhz(timedCycles)
    def busyPct: Double      = 100.0 * busyCycles / cycles
    def contendedPct: Double = 100.0 * contendedCycles / cycles
  }

  private def profile(cached: Boolean, dCache: Int, label: String, name: String): Run = {
    val socConfig = VexZeroSocConfig(
      ramSize = 32 KiB,
      maxOutstanding = 4,
      cachedCpu = cached,
      dCacheSize = dCache,
      benchIoBase = Some(benchIoBase),
      bootImage = HexImage.loadWords(hexPath, ramBase)
    )

    var run: Run = null
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

      // Nothing is measured, and nothing is waited on, until the design is out
      // of reset. Before that every register still holds whatever the
      // simulator gave it, the benchmark's done flag among them — a run that
      // samples it early finishes instantly with an empty console.
      dut.clockDomain.waitSampling(16)

      val stats   = Seq(new AxiProfile("instruction fetch"), new AxiProfile("load / store"))
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

      val stalled = dut.clockDomain.waitSamplingWhere(20000000)(dut.io.bench.done.toBoolean)
      assert(!stalled, s"$label: Dhrystone never finished; console so far:\n$console")

      val text = console.toString
      // The same binary printing the same results either way is what makes the
      // two profiles comparable at all, so it is checked before they are read.
      DhrystoneConsole.verify(text)
      assert(dut.io.bench.exitCode.toLong == 0, s"$label: Dhrystone exited non-zero")

      run = Run(label, cycles, DhrystoneConsole.userCycles(text), stats, busy, contend)
    }
    run
  }

  test("Dhrystone's demand on the crossbar, uncached against cached") {
    assume(
      Files.isRegularFile(Paths.get(hexPath)),
      s"$hexPath is missing — run: git submodule update --init third_party/VexRiscv"
    )

    val simple = profile(cached = false, 4096, "uncached CPU", "vexzero_profile_uncached")
    val cached =
      profile(cached = true, 4096, "cached, 4 KiB I$ + 4 KiB D$", "vexzero_profile_cached")
    val missing =
      profile(cached = true, 512, "cached, 4 KiB I$ + 512 B D$", "vexzero_profile_smalld")

    for (run <- Seq(simple, cached, missing)) {
      println()
      println(s"  ---- ${run.label} ----")
      println(
        f"  run            : ${run.cycles}%,d cycles, ${run.timedCycles}%,d timed " +
          f"(${run.dmipsPerMhz}%.3f DMIPS/MHz)"
      )
      println(f"  transactions   : ${run.transactions}%,d carrying ${run.beats}%,d beats")
      print(AxiProfile.report(run.stats))
      println(
        f"  fabric busy    : ${run.busyCycles}%,d cycles (${run.busyPct}%.1f%%), " +
          f"contended ${run.contendedCycles}%,d (${run.contendedPct}%.1f%%)"
      )
    }

    println()
    println("  ---- What changed ----")
    println(
      f"  transactions   : ${simple.transactions}%,d -> ${cached.transactions}%,d " +
        f"(${100.0 * cached.transactions / simple.transactions}%.1f%% of uncached)"
    )
    println(f"  beats per txn  : ${simple.beatsPerTxn}%.2f -> ${cached.beatsPerTxn}%.2f")
    println(
      f"  peak in flight : ${simple.stats.map(_.maxOutstanding).max}%d -> " +
        f"${cached.stats.map(_.maxOutstanding).max}%d"
    )
    println(
      f"  contended      : ${simple.contendedPct}%.1f%% -> ${cached.contendedPct}%.1f%% of cycles"
    )
    println(f"  DMIPS/MHz      : ${simple.dmipsPerMhz}%.3f -> ${cached.dmipsPerMhz}%.3f")
    println()
    println("  ---- Sizing the data cache to miss ----")
    println(
      f"  data reads     : ${cached.stats(1).arCount}%,d -> ${missing.stats(1).arCount}%,d, " +
        f"of which bursts ${cached.stats(1).readLens.getOrElse(7, 0L)}%,d -> " +
        f"${missing.stats(1).readLens.getOrElse(7, 0L)}%,d"
    )
    println(
      f"  data writes    : ${cached.stats(1).awCount}%,d -> ${missing.stats(1).awCount}%,d, " +
        f"of which bursts ${cached.stats(1).writeLens.count(_._1 > 0)}%d -> " +
        f"${missing.stats(1).writeLens.count(_._1 > 0)}%d (write-through: never any)"
    )
    println(f"  DMIPS/MHz      : ${cached.dmipsPerMhz}%.3f -> ${missing.dmipsPerMhz}%.3f")
    println()

    // -- Uncached: maximum coverage, minimum pressure -------------------------
    val sFetch = simple.stats(0)
    val sData  = simple.stats(1)
    assert(sFetch.arCount > 100000, s"only ${sFetch.arCount} fetches — the CPU cannot have run")
    assert(
      sFetch.readLens.keys.forall(_ == 0) && sData.readLens.keys.forall(_ == 0),
      "the uncached CPU issued a burst, which none of its plugins can do"
    )
    assert(
      sFetch.maxOutstanding <= 2 && sData.maxOutstanding <= 2,
      s"uncached had more in flight than expected " +
        s"(${sFetch.maxOutstanding}, ${sData.maxOutstanding})"
    )

    // -- Cached: the traffic the crossbar is built for ------------------------
    val cFetch = cached.stats(0)
    val cData  = cached.stats(1)
    assert(
      cFetch.readLens.contains(7),
      s"instruction fetch issued no 8-beat line refill: ${cFetch.readSummary}"
    )
    assert(
      cData.readLens.contains(7),
      s"the data cache issued no burst line refill: read ${cData.readSummary}"
    )
    // Write-through, and worth pinning: it is the reason caching leaves the write
    // path of the crossbar exactly as lightly exercised as it was before.
    assert(
      cData.writeLens.keys.forall(_ == 0),
      s"the data cache issued a write burst, so it is no longer write-through: " +
        s"${cData.writeSummary}"
    )
    assert(
      cData.awCount == sData.awCount,
      s"write-through should send every store to the bus, but ${cData.awCount} " +
        s"came through cached against ${sData.awCount} uncached"
    )
    assert(
      cached.stats.map(_.maxOutstanding).max > 2,
      "caching did not deepen the outstanding pipeline, so the crossbar is still being " +
        "asked for one transaction at a time"
    )
    // A fabric that mishandled AWBURST would corrupt data here rather than merely run
    // slowly; DhrystoneConsole.verify above is what catches that, and this records that
    // bursts really were the bulk of the traffic it verified.
    assert(
      cFetch.meanReadBurst > 7.0,
      f"instruction fetch averaged ${cFetch.meanReadBurst}%.2f beats per read, not a line refill"
    )

    // The point the whole comparison exists to make: caching bought bursts and
    // depth, and cost the fabric almost all of its occupancy. Neither run leaves
    // the crossbar under load, so neither run's score says much about it.
    assert(
      cached.contendedPct < 1.0 && missing.contendedPct < 1.0,
      f"cached Dhrystone contended for ${cached.contendedPct}%.1f%% / " +
        f"${missing.contendedPct}%.1f%% of cycles — if that is no longer negligible, this " +
        "comparison and the README text around it need revisiting"
    )

    // -- Sizing the data cache to miss brings the load/store port back --------
    val mData = missing.stats(1)
    assert(
      mData.readLens.getOrElse(7, 0L) > 1000,
      s"a 512 B data cache should miss constantly, but the port issued only " +
        s"${mData.readLens.getOrElse(7, 0L)} line refills: ${mData.readSummary}"
    )
    assert(
      mData.arCount > 40 * cData.arCount,
      s"shrinking the data cache barely changed its traffic (${cData.arCount} -> ${mData.arCount})"
    )
    // The point that survives every configuration: no data cache size, and no
    // cache at all, ever makes this CPU issue a write burst.
    assert(
      mData.writeLens.keys.forall(_ == 0) && sData.writeLens.keys.forall(_ == 0),
      s"a write burst appeared, so VexRiscv is no longer write-through: ${mData.writeSummary}"
    )
  }
}
