// Copyright (c) 2026 Leonardo Capossio — bard0 design  hello@bard0.com
// SPDX-License-Identifier: MIT
package vexzero.sim

import java.io.File

import org.scalatest.funsuite.AnyFunSuite
import spinal.core._
import spinal.core.sim._
import spinal.lib.bus.amba4.axi.Axi4Config
import vexzero._

// ---------------------------------------------------------------------------
// VexZeroVideoSpec — a real IP core writing real bursts through the crossbar
//
// Every write this interconnect has carried until now has been a single beat.
// That is not a property of the crossbar, it is a property of VexRiscv: its
// data cache has no dirty bit, so it is write-through by construction and no
// configuration makes it burst. The stress test's write bursts come from
// `HostTraffic`, which is Scala and exists only in simulation.
//
// vtpgZero is neither. It is a synthesizable Verilog core, carried as a pinned
// submodule and compiled by Verilator from the same sources a board would use,
// and it fills a framebuffer in RAM with 16-beat INCR writes while the CPU
// runs out of the same RAM.
//
// The pattern is solid colour on purpose. Every pixel of every frame is then
// the same predictable 32-bit word -- {R,G,B,0xFF} -- so the read-back is an
// exact check on all 1024 of them rather than a plausibility test, and a burst
// landing at the wrong address shows up as a mismatch rather than as noise
// that happens to look like a picture.
// ---------------------------------------------------------------------------
class VexZeroVideoSpec extends AnyFunSuite {

  private val spinalCfg = SpinalConfig(
    defaultConfigForClockDomains = ClockDomainConfig(
      clockEdge = RISING,
      resetKind = SYNC,
      resetActiveLevel = LOW
    )
  )

  /** Verilator resolves `\`include "vtpgz_defs.vh"` against its include path, and the header sits
    * beside the sources rather than in the simulation workspace.
    */
  private def simCfg =
    SimConfig.withConfig(spinalCfg).addSimulatorFlag(s"-I${VtpgZero.includeDir}")

  private val ramBase   = BigInt("80000000", 16)
  private val ramSize   = 64 * 1024
  private val videoBase = BigInt("F0030000", 16)

  /** A 32x32 frame is 4 KiB, which fits in the top of RAM well clear of the firmware's data. */
  private val videoCfg = VtpgZeroConfig(
    width = 32,
    height = 32,
    frameBase = ramBase + 0xc000,
    burstLen = 16
  )

  private val pixels         = videoCfg.width * videoCfg.height
  private val burstsPerFrame = pixels / videoCfg.burstLen

  /** 0xRRGGBB going in; the writer stores {R,G,B,0xFF}, so this is what memory must hold. */
  private val solidColor   = 0x2a5fc8L
  private val expectedWord = ((solidColor << 8) | 0xff) & 0xffffffffL

  /** Clocks between frame starts. Has to exceed a frame's own length -- 1024 pixels plus one gap
    * cycle per line -- or the core would be asked to start a frame it has not finished.
    */
  private val frameRate = 4096

  private def reg(offset: Int): Long = (videoBase.toLong + offset) & 0xffffffffL

  /** The crossbar's Lite slave ports, rebuilt here so the wrapper can be driven on its own. */
  private val liteCfg = Axi4Config(
    addressWidth = 32,
    dataWidth = 32,
    useId = false,
    useRegion = false,
    useBurst = false,
    useLock = false,
    useCache = false,
    useSize = false,
    useQos = false,
    useLen = false,
    useLast = false,
    useResp = true,
    useProt = true,
    useStrb = true
  )

  // The control port on its own, with no crossbar and no CPU in the way. When
  // the full test fails there are three candidates -- the core, this wrapper,
  // and the fabric -- and this rules the first two in or out in seconds.
  test("the video wrapper answers register reads and writes") {
    assume(VtpgZero.available, s"vtpgZero is missing — ${VtpgZero.initHint}")

    simCfg.compile(new VtpgZeroVideo(videoCfg, VexZeroSoc.masterCfg, liteCfg)).doSim("vtpgz_ctrl") {
      dut =>
        SimTimeout(1000000)
        dut.io.ctrl.aw.valid #= false
        dut.io.ctrl.w.valid #= false
        dut.io.ctrl.b.ready #= true
        dut.io.ctrl.ar.valid #= false
        dut.io.ctrl.r.ready #= true
        dut.io.mem.aw.ready #= true
        dut.io.mem.w.ready #= true
        dut.io.mem.b.valid #= false
        dut.io.mem.ar.ready #= true
        dut.io.mem.r.valid #= false
        dut.io.frameSync #= false
        dut.clockDomain.forkStimulus(10)
        dut.clockDomain.waitSampling(16)

        def write(offset: Int, value: Long): Unit = {
          dut.io.ctrl.aw.valid #= true
          dut.io.ctrl.aw.payload.addr #= videoBase.toLong + offset
          dut.io.ctrl.aw.payload.prot #= 0
          dut.io.ctrl.w.valid #= true
          dut.io.ctrl.w.payload.data #= value
          dut.io.ctrl.w.payload.strb #= 0xf
          var awDone = false
          var wDone  = false
          while (!awDone || !wDone) {
            dut.clockDomain.waitSampling()
            if (!awDone && dut.io.ctrl.aw.ready.toBoolean) {
              awDone = true; dut.io.ctrl.aw.valid #= false
            }
            if (!wDone && dut.io.ctrl.w.ready.toBoolean) {
              wDone = true; dut.io.ctrl.w.valid #= false
            }
          }
          dut.clockDomain.waitSamplingWhere(1000)(dut.io.ctrl.b.valid.toBoolean)
        }

        def read(offset: Int): Long = {
          dut.io.ctrl.ar.valid #= true
          dut.io.ctrl.ar.payload.addr #= videoBase.toLong + offset
          dut.io.ctrl.ar.payload.prot #= 0
          dut.clockDomain.waitSamplingWhere(1000)(dut.io.ctrl.ar.ready.toBoolean)
          dut.io.ctrl.ar.valid #= false
          dut.clockDomain.waitSamplingWhere(1000)(dut.io.ctrl.r.valid.toBoolean)
          dut.io.ctrl.r.payload.data.toLong
        }

        val id = read(VtpgZero.regCoreId)
        assert(
          id == VtpgZero.coreIdMagic,
          f"CORE_ID read back 0x$id%08X, expected 0x${VtpgZero.coreIdMagic}%08X"
        )

        write(VtpgZero.regImgWidth, videoCfg.width.toLong)
        val w = read(VtpgZero.regImgWidth)
        assert(w == videoCfg.width.toLong, s"IMG_WIDTH read back $w, expected ${videoCfg.width}")

        // The read that the full test hangs on: a second one, after a write.
        val id2 = read(VtpgZero.regCoreId)
        assert(
          id2 == VtpgZero.coreIdMagic,
          f"the second CORE_ID read returned 0x$id2%08X; the slave does not recover between reads"
        )
    }
  }

  test("a video core fills a framebuffer over the crossbar, in 16-beat write bursts") {
    assume(VtpgZero.available, s"vtpgZero is missing — ${VtpgZero.initHint}")

    val socConfig = VexZeroSocConfig(
      ramSize = ramSize,
      maxOutstanding = 4,
      hostMaster = true,
      videoBase = Some(videoBase),
      videoConfig = videoCfg
    )

    val compiled = simCfg.compile {
      val dut = new VexZeroSoc(socConfig)
      AxiProfile.publish(dut.fabric.io.masters)
      dut
    }

    compiled.doSim("vexzero_video") { dut =>
      SimTimeout(20000000)
      dut.io.switches #= 0
      dut.clockDomain.forkStimulus(10)

      // The host port has to be idled before anything else waits, not after.
      // Left undriven it reads as X, and the master port's register slice
      // latches that as a real AR to a garbage address -- one that decodes to
      // no slave, so it is never accepted and every later read queues behind it
      // forever. start() idles the port and then waits out reset.
      val host = new HostTraffic(dut.io.host, dut.clockDomain)
      host.start()

      val stats = Seq(
        new AxiProfile("instruction fetch"),
        new AxiProfile("load / store"),
        new AxiProfile("host"),
        new AxiProfile("video writer")
      )
      var cycles = 0L
      dut.clockDomain.onSamplings {
        cycles += 1
        AxiProfile.sample(dut.fabric.io.masters, stats, cycles)
      }
      val video = stats(3)

      // ── Program the generator, over the same crossbar it writes through ──
      def poke(offset: Int, value: Long): Unit = {
        host.write(reg(offset), IndexedSeq(value))
        host.drainWrites()
      }

      val program = Seq(
        VtpgZero.regImgWidth   -> videoCfg.width.toLong,
        VtpgZero.regImgHeight  -> videoCfg.height.toLong,
        VtpgZero.regPatternSel -> VtpgZero.patSolid.toLong,
        VtpgZero.regSolidColor -> solidColor,
        VtpgZero.regFrameRate  -> frameRate.toLong,
        VtpgZero.regControl    -> VtpgZero.ctrlEnable.toLong
      )
      program.foreach { case (offset, value) => poke(offset, value) }

      // Read every one of them back before believing any of it. A register that
      // did not take is otherwise indistinguishable from a core that will not
      // generate, and the two have completely different causes. CORE_ID rides
      // along as a read-only control: it proves the bus reached the core even
      // if every writable register turns out empty.
      // Every wait here is bounded and says what it was waiting for. An
      // unbounded spin on a transaction that never returns is indistinguishable
      // from a slow simulation until the whole run times out with no clue.
      def settle(what: String, budget: Int = 20000): Unit = {
        var left = budget
        while (host.backlog > 0 && left > 0) { dut.clockDomain.waitSampling(); left -= 1 }
        assert(
          host.backlog == 0,
          s"$what: ${host.backlog} transactions were still unanswered after $budget cycles"
        )
      }

      def readOne(offset: Int, value: Long): Unit = {
        host.read(reg(offset), IndexedSeq(value))
        settle(f"read of the generator's register at +0x$offset%02x")
      }
      readOne(VtpgZero.regCoreId, VtpgZero.coreIdMagic)
      program.foreach { case (offset, value) => readOne(offset, value) }
      host.drainWrites()
      dut.clockDomain.waitSampling(200)
      assert(
        host.mismatches.isEmpty,
        "the generator's registers did not read back what was written, so the control " +
          "path is at fault before the video path is: " + host.mismatches.mkString("; ")
      )

      // ── Let it write a whole frame ───────────────────────────────────────
      // A frame starts within frameRate cycles and takes about one cycle per
      // pixel, so this budget is generous by two orders of magnitude; it is
      // sized to fail fast rather than to wait hopefully.
      dut.clockDomain.waitSamplingWhere(100000)(video.awCount >= burstsPerFrame)
      assert(
        video.awCount >= burstsPerFrame,
        s"the video core issued only ${video.awCount} write bursts in the time a " +
          s"${videoCfg.width}x${videoCfg.height} frame needs $burstsPerFrame of them"
      )

      // Stop it, so the read-back is of a finished frame rather than a race
      // with the next one. With a solid pattern the two would agree anyway,
      // which is exactly why this also checks that CONTROL actually stops it.
      poke(VtpgZero.regControl, 0)
      dut.clockDomain.waitSampling(200)
      val burstsAtStop = video.awCount
      dut.clockDomain.waitSampling(4 * frameRate)
      assert(
        video.awCount == burstsAtStop,
        s"clearing CONTROL did not stop the core: ${video.awCount - burstsAtStop} more bursts " +
          s"arrived over ${4 * frameRate} cycles"
      )

      // ── Read every pixel back ────────────────────────────────────────────
      val expected = IndexedSeq.fill(videoCfg.burstLen)(expectedWord)
      for (word <- 0 until pixels by videoCfg.burstLen) {
        host.read(videoCfg.frameBase.toLong + word * 4, expected)
        // The framebuffer is RAM, which takes pipelined reads happily, but the
        // backlog still has to drain before halt() stops the threads driving it.
        if (host.backlog > 8) settle("framebuffer read-back")
      }
      settle("framebuffer read-back", 100000)
      host.halt()

      println()
      println(f"  ---- Video writer ----")
      println(f"  frame            : ${videoCfg.width}%d x ${videoCfg.height}%d, $pixels%,d pixels")
      println(f"  write bursts     : ${video.awCount}%,d")
      println(f"  write beats      : ${video.wBeats}%,d")
      println(f"  read commands    : ${video.arCount}%,d")
      println(f"  burst lengths    : ${video.writeSummary}")
      println(f"  mean write burst : ${video.meanWriteBurst}%.1f beats")
      println()

      // 1. Every pixel came back exactly right, at exactly the right address.
      assert(
        host.mismatches.isEmpty,
        s"the framebuffer read back wrong:\n  " + host.mismatches.take(8).mkString("\n  ")
      )

      // 2. It bursts. This is the whole reason the core is here -- no VexRiscv
      //    configuration can produce this line.
      assert(
        video.writeLens.getOrElse(videoCfg.burstLen - 1, 0L) >= burstsPerFrame,
        s"expected at least $burstsPerFrame full ${videoCfg.burstLen}-beat write bursts, got " +
          video.writeSummary
      )

      // 3. And it is a write-only master, a port shape nothing else here has.
      assert(
        video.arCount == 0,
        s"the video port issued ${video.arCount} read commands; it is supposed to only write"
      )
    }
  }
}
