// Copyright (c) 2026 Leonardo Capossio — bard0 design  hello@bard0.com
// SPDX-License-Identifier: MIT
package vexzero.sim

import org.scalatest.funsuite.AnyFunSuite
import spinal.core._
import spinal.core.sim._
import axizero.{ArbitrationPolicy, QosBased, RoundRobin}
import vexzero._

// ---------------------------------------------------------------------------
// VexZeroVideoQosSpec — CPU reads cannot be ranked above video writes, and this
// records why
//
// The goal was maximum priority for processor reads while the video path keeps
// a bounded worst case, with QosBased arbitration and the CPU pinned at 15 as
// the lever. The measurement says the lever is not connected to this load, for
// a reason that is structural rather than a matter of tuning.
//
// AXQOS ranks masters competing for one slave *on one channel*. The crossbar
// arbitrates reads and writes independently: separate grant logic and separate
// per-slave age state, wrQosAge for AW and rdQosAge for AR. In this system the
// CPU's active port issues only reads and the video core issues only writes, so
// the two never appear in the same arbiter and no AXQOS value can order them.
// Both policies produce byte-identical counts and latencies, which is the shape
// of a lever that does nothing rather than one that is merely weak.
//
// Where they do meet is the RAM's shared command port. Axi4SharedOnChipRam has
// one address channel, so the fabric's AR and AW are merged by toShared() on
// the way in. That conversion is applied to the crossbar's finished slave port,
// downstream of the arbiter that AXQOS feeds, so whatever it does to order a
// read against a write, no AXQOS setting on the fabric can reach it.
//
// The second finding is that at this memory there is currently nothing to
// arbitrate. Single-cycle on-chip RAM answers a beat per cycle, and even with
// the frame rate tightened until the two masters together ask for well under
// the memory's bandwidth, every video burst is served in exactly its own
// transfer time and the worst instruction fetch waits two cycles. A mean equal
// to a maximum, as below, is the signature of a queue that never forms.
//
// So this is kept as a regression on both facts. If a future change gives the
// shared port QoS-aware merging, or puts the CPU and the video core on the same
// channel, the equality asserted here breaks and the numbers become worth
// reading again.
// ---------------------------------------------------------------------------
class VexZeroVideoQosSpec extends AnyFunSuite {

  private val spinalCfg = SpinalConfig(
    defaultConfigForClockDomains = ClockDomainConfig(
      clockEdge = RISING,
      resetKind = SYNC,
      resetActiveLevel = LOW
    )
  )

  private def simCfg =
    SimConfig.withConfig(spinalCfg).addSimulatorFlag(s"-I${VtpgZero.includeDir}")

  private val ramBase   = BigInt("80000000", 16)
  private val ramSize   = 64 * 1024
  private val videoBase = BigInt("F0030000", 16)

  private val solidColor = 0x2a5fc8L

  /** Clocks between frame starts. A 32x32 frame takes 32 * (32 + 1) = 1056 cycles to generate, so
    * this has to stay above that or the core is asked to restart a frame it has not finished.
    *
    * It also sets how hard the video path leans on the RAM, which is the whole point here. At the
    * 4096 the functional test uses, video asks for about a quarter of the memory's bandwidth and
    * the CPU for another quarter: the arbiter never has to choose, every burst is served the cycle
    * it arrives, and QoS and round-robin produce byte-identical numbers. Measuring arbitration
    * requires asking for more bandwidth than exists.
    */
  private val frameRate = 1200

  /** Cycles of steady state measured, after the generator is programmed and running. Long enough to
    * cover several frames at either burst length.
    */
  private val window = 100000

  private def reg(offset: Int): Long = (videoBase.toLong + offset) & 0xffffffffL

  private case class Run(
    policy: String,
    burstLen: Int,
    fetchMean: Double,
    fetchMax: Long,
    fetchReads: Long,
    loadStoreMean: Double,
    loadStoreMax: Long,
    videoMean: Double,
    videoMax: Long,
    videoWrites: Long
  )

  /** Programme the generator, then measure a fixed window of steady state. */
  private def measure(
    arbitration: ArbitrationPolicy,
    policy: String,
    cpuQos: Int,
    burstLen: Int
  ): Run = {
    val videoCfg = VtpgZeroConfig(
      width = 32,
      height = 32,
      frameBase = ramBase + 0xc000,
      burstLen = burstLen,
      qos = 0
    )

    val socConfig = VexZeroSocConfig(
      ramSize = ramSize,
      maxOutstanding = 4,
      arbitration = arbitration,
      cpuQos = cpuQos,
      hostMaster = true,
      videoBase = Some(videoBase),
      videoConfig = videoCfg
    )

    val compiled = simCfg.compile {
      val dut = new VexZeroSoc(socConfig)
      AxiProfile.publish(dut.fabric.io.masters)
      dut
    }

    var result: Run = null

    compiled.doSim(s"video_qos_${burstLen}") { dut =>
      SimTimeout(20000000)
      dut.io.switches #= 0
      dut.clockDomain.forkStimulus(10)

      // Idle the host port before anything waits on it; undriven it reads as X
      // and the master port's register slice latches a garbage AR that decodes
      // to nothing and never completes.
      val host = new HostTraffic(dut.io.host, dut.clockDomain)
      host.start()

      val stats = Seq(
        new AxiProfile("instruction fetch"),
        new AxiProfile("load / store"),
        new AxiProfile("host"),
        new AxiProfile("video writer")
      )

      // Programming traffic is not steady state, so nothing is counted until
      // the generator is running and the host has gone quiet again.
      var measuring = false
      var cycles    = 0L
      dut.clockDomain.onSamplings {
        cycles += 1
        if (measuring) AxiProfile.sample(dut.fabric.io.masters, stats, cycles)
      }

      def poke(offset: Int, value: Long): Unit = {
        host.write(reg(offset), IndexedSeq(value))
        host.drainWrites()
      }

      Seq(
        VtpgZero.regImgWidth   -> videoCfg.width.toLong,
        VtpgZero.regImgHeight  -> videoCfg.height.toLong,
        VtpgZero.regPatternSel -> VtpgZero.patSolid.toLong,
        VtpgZero.regSolidColor -> solidColor,
        VtpgZero.regFrameRate  -> frameRate.toLong,
        VtpgZero.regControl    -> VtpgZero.ctrlEnable.toLong
      ).foreach { case (offset, value) => poke(offset, value) }

      var left = 20000
      while (host.backlog > 0 && left > 0) { dut.clockDomain.waitSampling(); left -= 1 }
      assert(host.backlog == 0, s"$policy/$burstLen: the generator was never programmed")

      // Let the first frame get under way so the window sees steady state.
      dut.clockDomain.waitSampling(frameRate)
      measuring = true
      dut.clockDomain.waitSampling(window)
      measuring = false

      val fetch = stats(0)
      val ls    = stats(1)
      val video = stats(3)

      println(f"%n=== $policy%s, video burstLen=$burstLen%d, cpuQos=$cpuQos%d ===")
      print(AxiProfile.report(stats))

      result = Run(
        policy = policy,
        burstLen = burstLen,
        fetchMean = fetch.readLatency,
        fetchMax = fetch.maxReadLatency,
        fetchReads = fetch.arCount,
        loadStoreMean = ls.readLatency,
        loadStoreMax = ls.maxReadLatency,
        videoMean = video.writeLatency,
        videoMax = video.maxWriteLatency,
        videoWrites = video.awCount
      )
    }

    result
  }

  test("CPU read latency and video worst case, QoS versus round-robin at two burst lengths") {
    assume(VtpgZero.available, s"vtpgZero is missing — ${VtpgZero.initHint}")

    val runs = for {
      (arb, policy, cpuQos) <- Seq(
        (RoundRobin: ArbitrationPolicy, "round-robin", 0),
        (QosBased: ArbitrationPolicy, "qos cpu=15", 15)
      )
      burstLen <- Seq(16, 4)
    } yield measure(arb, policy, cpuQos, burstLen)

    println()
    println("=" * 80)
    println("  CPU reads under video load, in cycles (mean / worst case)")
    println("=" * 80)
    println("  policy       burst |   ifetch mean/worst | load-store mean/worst | video mean/worst")
    println("-" * 80)
    for (r <- runs) {
      println(
        f"  ${r.policy}%-12s ${r.burstLen}%5d | ${r.fetchMean}%8.2f /${r.fetchMax}%7d | " +
          f"${r.loadStoreMean}%10.2f /${r.loadStoreMax}%7d | ${r.videoMean}%7.2f /${r.videoMax}%6d"
      )
    }
    println("=" * 80)
    for (r <- runs) {
      println(
        f"  ${r.policy}%-12s burst ${r.burstLen}%2d: ${r.fetchReads}%,9d fetches, " +
          f"${r.videoWrites}%,6d video bursts"
      )
    }
    println()

    // The comparison is only worth reading if both masters were actually busy.
    for (r <- runs) {
      assert(
        r.fetchReads > 1000,
        s"${r.policy}/${r.burstLen}: only ${r.fetchReads} fetches in $window cycles, CPU not running"
      )
      assert(
        r.videoWrites > 10,
        s"${r.policy}/${r.burstLen}: only ${r.videoWrites} video bursts in $window cycles"
      )
      // Bounded latency is the half of the goal that must hold: the video path
      // is never starved, whatever the CPU is ranked.
      assert(
        r.videoMax > 0 && r.videoMax < window,
        s"${r.policy}/${r.burstLen}: video worst-case write latency was ${r.videoMax} cycles"
      )
    }

    // A read stream and a write stream never share an arbiter, so ranking the
    // CPU at 15 changes nothing at all. Pinning the equality is the point: it
    // states the limitation as a fact about this fabric rather than as a
    // comment, and it fails the day that stops being true.
    val byBurst = runs.groupBy(_.burstLen)
    for ((burstLen, pair) <- byBurst) {
      assert(pair.length == 2, s"burst $burstLen: expected one run per policy")
      val rr  = pair.find(_.policy.startsWith("round")).get
      val qos = pair.find(_.policy.startsWith("qos")).get
      assert(
        rr.fetchReads == qos.fetchReads && rr.videoWrites == qos.videoWrites,
        s"burst $burstLen: throughput differed between policies " +
          s"(${rr.fetchReads}/${rr.videoWrites} vs ${qos.fetchReads}/${qos.videoWrites}); " +
          "AXQOS now reaches this load, so the report above is worth reading"
      )
      assert(
        rr.fetchMax == qos.fetchMax && rr.videoMax == qos.videoMax,
        s"burst $burstLen: worst-case latency differed between policies " +
          s"(fetch ${rr.fetchMax} vs ${qos.fetchMax}, video ${rr.videoMax} vs ${qos.videoMax}); " +
          "reads and writes may now share an arbiter"
      )
    }
  }
}
