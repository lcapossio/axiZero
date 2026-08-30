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
// VexZeroBenchSpec  —  run Dhrystone on the SoC, over the axiZero crossbar
//
//   sbt vexZero/test
//
// The binary is the RV32I Dhrystone 2.1 that ships prebuilt with the pinned
// VexRiscv submodule, unmodified: same code, same addresses, same 200 runs
// that VexRiscv's own regression uses. Nothing about it knows there is a
// crossbar underneath — every instruction fetch, every load and store, and
// every character it prints crosses one.
//
// Two things come out of the run:
//
//   correctness  Dhrystone prints each of its results next to the value it
//                should be. Every one of those pairs is compared here, so a
//                crossbar that corrupted or reordered anything fails the test
//                rather than merely scoring badly.
//
//   cost         the cycle count of the timed loop, taken from the SoC's own
//                counter, and the DMIPS/MHz that follows from it. Running the
//                same binary on the pipelined and the blocking crossbar puts
//                a number on what the interconnect costs.
// ---------------------------------------------------------------------------
class VexZeroBenchSpec extends AnyFunSuite {

  private val spinalCfg = SpinalConfig(
    defaultConfigForClockDomains = ClockDomainConfig(
      clockEdge = RISING,
      resetKind = SYNC,
      resetActiveLevel = LOW
    )
  )

  private def simCfg = SimConfig.withConfig(spinalCfg)

  /** Prebuilt RV32I Dhrystone from the submodule: no M or C extension, and it links at 0x8000_0000,
    * which is where this SoC's RAM lives.
    */
  private val hexPath = "third_party/VexRiscv/src/test/resources/hex/dhrystoneO3.hex"

  private val ramBase     = BigInt("80000000", 16)
  private val benchIoBase = BigInt("F00FF000", 16)

  /** Number_Of_Runs, compiled into the binary. */
  private val runs = 200

  /** One Dhrystone iteration is 1757 VAX instructions, by definition. */
  private val vaxDhrystonesPerSecond = 1757.0

  /** Generous: the whole run is a few hundred thousand cycles. */
  private val timeoutCycles = 8000000

  /** What one master port did over the run, measured at the crossbar. */
  private case class PortStats(name: String) {
    var reads                 = 0L
    var writes                = 0L
    var readCycles            = 0L // summed AR-accepted -> R-returned latency
    var writeCycles           = 0L // summed AW-accepted -> B-returned latency
    private val pendingReads  = scala.collection.mutable.Queue[Long]()
    private val pendingWrites = scala.collection.mutable.Queue[Long]()

    def arFire(cycle: Long): Unit = pendingReads.enqueue(cycle)
    def rLast(cycle: Long): Unit = {
      readCycles += cycle - pendingReads.dequeue()
      reads += 1
    }
    def awFire(cycle: Long): Unit = pendingWrites.enqueue(cycle)
    def bFire(cycle: Long): Unit = {
      writeCycles += cycle - pendingWrites.dequeue()
      writes += 1
    }

    def readLatency: Double  = if (reads == 0) 0 else readCycles.toDouble / reads
    def writeLatency: Double = if (writes == 0) 0 else writeCycles.toDouble / writes
  }

  private case class BenchRun(
    text: String,
    totalCycles: Long,
    exitCode: Long,
    ports: Seq[PortStats]
  ) {

    /** Cycles Dhrystone itself timed, straight out of its printout. */
    val userCycles: Long =
      """Clock cycles=(\d+)""".r
        .findFirstMatchIn(text)
        .map(_.group(1).toLong)
        .getOrElse(sys.error(s"Dhrystone printed no cycle count:\n$text"))

    val cyclesPerRun: Double = userCycles.toDouble / runs
    val dmipsPerMhz: Double  = 1e6 * runs / (userCycles * vaxDhrystonesPerSecond)

    /** Every "X: value" line followed by a "should be: value" line. */
    def selfChecks: Seq[(String, String, String)] = {
      val lines = text.linesIterator.toIndexedSeq
      for {
        i <- lines.indices.tail
        if lines(i).trim.startsWith("should be:")
        expected = lines(i).trim.stripPrefix("should be:").trim
        actual   = lines(i - 1).split(":", 2).last.trim
        label    = lines(i - 1).split(":", 2).head.trim
      } yield (label, actual, expected)
    }
  }

  private def runDhrystone(maxOutstanding: Int, name: String): BenchRun = {
    val socConfig = VexZeroSocConfig(
      ramSize = 32 KiB,
      maxOutstanding = maxOutstanding,
      benchIoBase = Some(benchIoBase),
      bootImage = HexImage.loadWords(hexPath, ramBase)
    )

    var result: BenchRun = null
    val compiled = simCfg.compile {
      val dut = new VexZeroSoc(socConfig)
      // The crossbar's master ports are what the benchmark actually exercises,
      // so make the handshakes visible to the simulator and count them.
      for (port <- dut.fabric.io.masters; channel <- Seq(port.ar, port.r, port.aw, port.b)) {
        channel.valid.simPublic()
        channel.ready.simPublic()
      }
      dut.fabric.io.masters.foreach(_.r.last.simPublic())
      dut
    }

    compiled.doSim(name) { dut =>
      dut.io.switches #= 0
      dut.io.bench.charOut.ready #= true
      dut.clockDomain.forkStimulus(10)

      val chars  = new mutable.StringBuilder
      var cycles = 0L
      val stats  = Seq(PortStats("instruction fetch"), PortStats("load / store"))

      dut.clockDomain.onSamplings {
        cycles += 1
        if (dut.io.bench.charOut.valid.toBoolean)
          chars += dut.io.bench.charOut.payload.toInt.toChar

        for ((port, stat) <- dut.fabric.io.masters.zip(stats)) {
          def fired(v: Bool, r: Bool) = v.toBoolean && r.toBoolean
          if (fired(port.ar.valid, port.ar.ready)) stat.arFire(cycles)
          if (fired(port.r.valid, port.r.ready) && port.r.last.toBoolean) stat.rLast(cycles)
          if (fired(port.aw.valid, port.aw.ready)) stat.awFire(cycles)
          if (fired(port.b.valid, port.b.ready)) stat.bFire(cycles)
        }
      }

      val timedOut =
        dut.clockDomain.waitSamplingWhere(timeoutCycles)(dut.io.bench.done.toBoolean)
      assert(!timedOut, s"Dhrystone never reached its exit write; output so far:\n$chars")

      result = BenchRun(chars.toString, cycles, dut.io.bench.exitCode.toLong, stats)
    }
    result
  }

  private def report(label: String, run: BenchRun): Unit = {
    println(s"\n──── Dhrystone 2.1, $runs runs — $label ────")
    println(run.text.trim)
    println(f"  timed loop      : ${run.userCycles}%d cycles (${run.cyclesPerRun}%.1f per run)")
    if (run.totalCycles > 0)
      println(f"  whole program   : ${run.totalCycles}%d cycles including printout")
    println(f"  DMIPS/MHz       : ${run.dmipsPerMhz}%.3f")
    for (port <- run.ports) {
      println(
        f"  ${port.name}%-17s: ${port.reads}%,d reads @ ${port.readLatency}%.2f cycles, " +
          f"${port.writes}%,d writes @ ${port.writeLatency}%.2f cycles"
      )
    }
    for (fetches <- run.ports.headOption.map(_.reads) if fetches > 0)
      println(
        f"  fetch rate      : one instruction every ${run.totalCycles.toDouble / fetches}%.2f cycles"
      )
    println()
  }

  private def checkResults(run: BenchRun): Unit = {
    val checks = run.selfChecks
    assert(
      checks.length >= 15,
      s"expected Dhrystone's result block, found ${checks.length} checks in:\n${run.text}"
    )
    for ((label, actual, expected) <- checks if !expected.startsWith("(implementation-dependent")) {
      // The one line Dhrystone prints symbolically rather than as a number.
      val want = if (expected == "Number_Of_Runs + 10") (runs + 10).toString else expected
      assert(actual == want, s"Dhrystone check '$label': got '$actual', should be '$want'")
    }

    // The two pointer prints are the same malloc'd object seen through two
    // records; their value is nobody's business but they must agree, which a
    // crossbar that mixed up two in-flight reads would not manage.
    val pointers = checks.collect { case ("Ptr_Comp", actual, _) => actual }
    assert(pointers.length == 2, s"expected two Ptr_Comp lines, saw ${pointers.length}")
    assert(pointers.distinct.length == 1, s"Ptr_Comp printed ${pointers.mkString(" and ")}")

    assert(run.exitCode == 0, s"Dhrystone exited with code ${run.exitCode}")
  }

  private def withDhrystone(body: => Unit): Unit = {
    assume(
      Files.isRegularFile(Paths.get(hexPath)),
      s"$hexPath is missing — run: git submodule update --init third_party/VexRiscv"
    )
    body
  }

  test("Dhrystone runs correctly on the pipelined crossbar") {
    withDhrystone {
      val run = runDhrystone(maxOutstanding = 4, name = "vexzero_dhrystone_pipelined")
      report("pipelined crossbar, max_outstanding = 4", run)
      checkResults(run)
      // A stalled or mis-scheduled bus shows up here long before it breaks a
      // result: this core cannot do better than a few hundred cycles per run.
      assert(
        run.dmipsPerMhz > 0.05,
        f"${run.dmipsPerMhz}%.3f DMIPS/MHz is far below anything this core should manage"
      )

      // Every load and store the program issued came back, and none of them
      // took anything like a stalled bus to do it. A crossbar that dropped or
      // stranded a response would hang instead, but one that quietly serialised
      // everything behind an arbiter would show up right here.
      val fetch = run.ports.head
      val data  = run.ports.last
      assert(
        fetch.reads > 100000,
        s"only ${fetch.reads} instruction fetches — the run was too short"
      )
      assert(
        data.reads > 10000 && data.writes > 10000,
        s"data port saw ${data.reads} reads, ${data.writes} writes"
      )
      for (port <- run.ports) {
        assert(
          port.readLatency < 12.0,
          f"${port.name} read latency ${port.readLatency}%.2f cycles is far above a BRAM round trip"
        )
      }
    }
  }

  test("Dhrystone runs correctly on the blocking crossbar") {
    withDhrystone {
      val run = runDhrystone(maxOutstanding = 1, name = "vexzero_dhrystone_blocking")
      report("blocking crossbar, max_outstanding = 1", run)
      checkResults(run)
    }
  }

  // The board wrapper is only observable through its serial line, so the test
  // that matters for it is whether the benchmark's console survives the trip
  // through the FIFO and the transmitter. The line is run far faster than the
  // board's 115200 so the whole printout fits in a short simulation; the
  // framing, the FIFO and the backpressure are the same either way.
  test("the board wrapper streams the benchmark's console over the UART") {
    withDhrystone {
      val simBaud   = 12500000L // 8 clocks per bit at 100 MHz
      val bitCycles = UartRx.bitCycles(clockHz = 100000000L, baud = simBaud)

      var text     = ""
      var exitCode = 1L

      simCfg.compile(new VexZeroBenchArty(baudRate = simBaud Hz)).doSim("vexzero_bench_arty") {
        dut =>
          SimTimeout(20 * 3000000L) // 3 M clocks at 10 ns
          val cd = dut.bootDomain
          dut.io.sw #= 0
          dut.io.ck_rst #= true
          cd.forkStimulus(10)

          val console = new mutable.StringBuilder
          val read    = () => dut.io.uart_rxd_out.toBoolean
          while (!console.toString.contains("DMIPS per Mhz") || !console.endsWith("\n")) {
            console += UartRx.byte(read, cd, bitCycles).toChar
          }
          // Let the exit write land after the last character.
          cd.waitSampling(1000)

          text = console.toString
          exitCode = if ((dut.io.led.toInt & 0x3) == 0x3) 0 else 1
      }

      val run = BenchRun(text, totalCycles = 0, exitCode = exitCode, ports = Nil)
      report("Arty wrapper, console decoded from uart_rxd_out", run)
      checkResults(run)
    }
  }
}
