// Copyright (c) 2026 Leonardo Capossio - bard0 design  hello@bard0.com
// SPDX-License-Identifier: MIT
package axizero.sim

import org.scalatest.funsuite.AnyFunSuite
import spinal.core._
import spinal.core.sim._
import spinal.lib._
import spinal.lib.bus.amba4.axi._
import axizero._
import axizero.verif._

// ---------------------------------------------------------------------------
// AxiSatGenSpec  —  the generator has to be trustworthy before it can accuse
// anything else.
//
// AxiSatGen is going onto hardware as the thing that decides whether a
// crossbar passed, so a bug in it reads as a bug in the fabric. These tests
// pin down the three properties the stress designs rely on:
//
//   1. Against a working RAM it reports zero errors and keeps lapping.
//   2. Its own traffic is protocol-legal -- it is checked by the same
//      Axi4ProtocolChecker that guards the fabric, so a generator that
//      wobbled a payload or miscounted a burst could not quietly poison a
//      stress run.
//   3. It actually catches corruption. A RAM that drops one byte lane makes
//      dataErrors non-zero; if it did not, a green hardware result would
//      mean nothing.
//
//   4. It notices when it has stopped. A fabric that accepts a burst and
//      never answers leaves the error counters at zero; `stalled` is what
//      turns that into a failure.
//   5. Straddling two slaves with B/R back-pressure, it neither hangs nor
//      misreads, and the crossbar in front of it stays protocol-legal. No
//      other master in the suite stalls a response or keeps same-ID bursts
//      in flight across a slave boundary, and it was that combination that
//      found the pipelined crossbar's W-steering deadlock.
//
// Property 3 is the one worth the most: 1 and 2 only say the generator is
// well behaved, and a generator that checks nothing is also well behaved.
// ---------------------------------------------------------------------------
class AxiSatGenSpec extends AnyFunSuite {

  private val spinalCfg = SpinalConfig(
    defaultConfigForClockDomains = ClockDomainConfig(
      clockEdge = RISING,
      resetKind = SYNC,
      resetActiveLevel = LOW
    )
  )

  private def simCfg = SimConfig.withConfig(spinalCfg)

  private val axiCfg = Axi4Config(
    addressWidth = 32,
    dataWidth = 32,
    idWidth = 4,
    useId = true,
    useLen = true,
    useSize = true,
    useBurst = true,
    useLast = true,
    useResp = true,
    useStrb = true,
    useLock = false,
    useCache = false,
    useProt = false,
    useQos = true,
    useRegion = false
  )

  // ── Harness ───────────────────────────────────────────────────────────────
  // Generator -> protocol checker -> on-chip RAM. `breakStrobe` drops the top
  // byte lane of every write, which is the cheapest way to make the RAM lie
  // without touching the generator.
  private class Harness(
    genCfg: AxiSatGenConfig,
    ramWords: Int,
    breakStrobe: Boolean = false
  ) extends Component {
    val io = new Bundle {
      val done       = out Bool ()
      val dataErrors = out UInt (8 bits)
      val respErrors = out UInt (8 bits)
      val laps       = out UInt (16 bits)
      val stalled    = out Bool ()
      val violation  = out Bits (Axi4ProtocolChecker.ruleCount bits)
      val overflow   = out Bool ()
    }

    val gen = new AxiSatGen(axiCfg, genCfg)

    val check = Axi4ProtocolChecker(gen.io.axi, "gen")

    val ram = Axi4SharedOnChipRam(
      dataWidth = 32,
      byteCount = ramWords * 4,
      idWidth = axiCfg.idWidth
    )
    ram.ram.init(Seq.fill(ramWords)(B(0, 32 bits)))

    private val toRam = gen.io.axi.toShared()
    ram.io.axi << toRam
    if (breakStrobe) ram.io.axi.writeData.strb.allowOverride := toRam.writeData.strb & B"0111"

    io.done       := gen.io.done
    io.dataErrors := gen.io.dataErrors
    io.respErrors := gen.io.respErrors
    io.laps       := gen.io.laps
    io.stalled    := gen.io.stalled
    io.violation  := check.sticky
    io.overflow   := check.overflow
  }

  // ── Two-slave harness ─────────────────────────────────────────────────────
  // Generator -> checker -> pipelined 1M2S crossbar -> two RAMs, with the
  // generator's window straddling the boundary between the slaves and its
  // B/R channels stalled by respStall. Every pass runs a stream of same-ID
  // bursts from one slave straight into the other with several in flight,
  // which is the traffic that deadlocked the pipelined crossbar: its W route
  // was a queue per slave, so a second AW accepted at the other slave while
  // the first burst's data was still owed handed that data to both. The
  // outputs report what the test needs to show that traffic really happened.
  private class XbarHarness(genCfg: AxiSatGenConfig) extends Component {
    // Every optional field on: the crossbar's internal fabric carries all of
    // them, and a port bundle missing one cannot be zipped onto it.
    private val xbarCfg = Axi4Config(addressWidth = 32, dataWidth = 32, idWidth = 4)

    val io = new Bundle {
      val dataErrors = out UInt (8 bits)
      val respErrors = out UInt (8 bits)
      val laps       = out UInt (16 bits)
      val stalled    = out Bool ()
      val violation  = out Bits (Axi4ProtocolChecker.ruleCount bits)
      val overflow   = out Bool ()
      val bStalled   = out Bool ()
      val rStalled   = out Bool ()
      val awAt       = out Bits (2 bits)
      val arAt       = out Bits (2 bits)
    }

    val xbar = new AxiZeroMixedTop(
      AxiZeroConfig(
        masters = Seq(MasterPort(xbarCfg, FullAxi4)),
        slaves = Seq(
          SlavePort(xbarCfg, FullAxi4, BigInt(0x000), BigInt(0x100)),
          SlavePort(xbarCfg, FullAxi4, BigInt(0x100), BigInt(0x100))
        ),
        arbitration = RoundRobin,
        maxOutstanding = 4
      )
    )

    val gen = new AxiSatGen(xbarCfg, genCfg)
    xbar.io.masters(0) << gen.io.axi

    val check = Axi4ProtocolChecker(gen.io.axi, "gen")

    for (si <- 0 until 2) {
      val ram = Axi4SharedOnChipRam(dataWidth = 32, byteCount = 256, idWidth = xbarCfg.idWidth)
      ram.ram.init(Seq.fill(64)(B(0, 32 bits)))
      ram.io.axi << xbar.io.slaves(si).toShared()
    }

    private val s = xbar.io.slaves
    io.bStalled := gen.io.axi.b.valid && !gen.io.axi.b.ready
    io.rStalled := gen.io.axi.r.valid && !gen.io.axi.r.ready
    io.awAt     := (s(1).aw.valid && s(1).aw.ready) ## (s(0).aw.valid && s(0).aw.ready)
    io.arAt     := (s(1).ar.valid && s(1).ar.ready) ## (s(0).ar.valid && s(0).ar.ready)

    io.dataErrors := gen.io.dataErrors
    io.respErrors := gen.io.respErrors
    io.laps       := gen.io.laps
    io.stalled    := gen.io.stalled
    io.violation  := check.sticky
    io.overflow   := check.overflow
  }

  private def decode(sticky: BigInt): String =
    Axi4ProtocolChecker.decode(sticky).mkString(", ")

  // A generator window that starts at zero so it can address a small RAM
  // directly, with every burst length the pass schedule produces.
  //
  // hangCycles is far below the default so a hang is seen in a short run --
  // and so the tests that expect no stall are asking something: against a
  // working RAM the generator never goes a tenth of that without a handshake.
  private def genCfg(
    qos: Int = 0,
    continuous: Boolean = true,
    windowWords: Int = 64,
    respStall: Int = 0
  ) =
    AxiSatGenConfig(
      baseAddr = 0,
      windowWords = windowWords,
      dataPattern = 0xb3000000L,
      passes = 8,
      maxBurstLen = 8,
      maxOutstanding = 4,
      qos = qos,
      continuous = continuous,
      respStall = respStall,
      hangCycles = 512
    )

  test("a full run against a working RAM reports no errors") {
    simCfg.compile(new Harness(genCfg(continuous = false), ramWords = 64)).doSim { dut =>
      dut.clockDomain.forkStimulus(10)
      dut.clockDomain.waitSampling(5)

      var guard = 0
      while (!dut.io.done.toBoolean && guard < 200000) {
        dut.clockDomain.waitSampling()
        guard += 1
      }
      assert(dut.io.done.toBoolean, s"generator never finished (stopped after $guard cycles)")
      assert(dut.io.dataErrors.toInt == 0, s"dataErrors = ${dut.io.dataErrors.toInt}")
      assert(dut.io.respErrors.toInt == 0, s"respErrors = ${dut.io.respErrors.toInt}")
      assert(dut.io.laps.toInt == 1, s"laps = ${dut.io.laps.toInt}, expected exactly one")
      assert(!dut.io.stalled.toBoolean, "a generator that finished was reported as stalled")
    }
  }

  test("the generator's own traffic is protocol-legal") {
    simCfg.compile(new Harness(genCfg(qos = 9), ramWords = 64)).doSim { dut =>
      dut.clockDomain.forkStimulus(10)
      dut.clockDomain.waitSampling(5)

      // Long enough to cover several laps, so every burst length in the pass
      // schedule is seen more than once.
      dut.clockDomain.waitSampling(60000)

      val sticky = dut.io.violation.toBigInt
      assert(sticky == 0, s"generator violated AXI4: ${decode(sticky)}")
      assert(!dut.io.overflow.toBoolean, "protocol checker overflowed tracking its traffic")
      assert(dut.io.laps.toInt >= 2, s"only ${dut.io.laps.toInt} laps in 60000 cycles")
      assert(dut.io.dataErrors.toInt == 0, s"dataErrors = ${dut.io.dataErrors.toInt}")
      assert(!dut.io.stalled.toBoolean, "stall reported against a working RAM")
    }
  }

  test("a RAM that drops a byte lane is caught") {
    simCfg
      .compile(new Harness(genCfg(continuous = false), ramWords = 64, breakStrobe = true))
      .doSim { dut =>
        dut.clockDomain.forkStimulus(10)
        dut.clockDomain.waitSampling(5)

        var guard = 0
        while (!dut.io.done.toBoolean && guard < 200000) {
          dut.clockDomain.waitSampling()
          guard += 1
        }
        assert(dut.io.done.toBoolean, "generator never finished")
        // The pattern's top byte is 0xB3 in every word, so every read-back
        // mismatches; the counter saturates rather than counting them all.
        assert(dut.io.dataErrors.toInt > 0, "corrupted RAM read back as correct")
        assert(dut.io.respErrors.toInt == 0, s"respErrors = ${dut.io.respErrors.toInt}")
      }
  }

  test("enable low keeps the generator off the bus") {
    class Gated extends Component {
      val io = new Bundle {
        val enable  = in Bool ()
        val laps    = out UInt (16 bits)
        val awSeen  = out Bool ()
        val stalled = out Bool ()
      }
      val gen = new AxiSatGen(axiCfg, genCfg())
      gen.io.enable := io.enable
      val ram = Axi4SharedOnChipRam(dataWidth = 32, byteCount = 256, idWidth = axiCfg.idWidth)
      ram.ram.init(Seq.fill(64)(B(0, 32 bits)))
      ram.io.axi << gen.io.axi.toShared()
      io.laps    := gen.io.laps
      io.awSeen  := RegNextWhen(True, gen.io.axi.aw.valid) init (False)
      io.stalled := gen.io.stalled
    }

    simCfg.compile(new Gated).doSim { dut =>
      dut.clockDomain.forkStimulus(10)
      dut.io.enable #= false
      dut.clockDomain.waitSampling(2000)
      assert(!dut.io.awSeen.toBoolean, "generator drove AWVALID while disabled")
      // Four times hangCycles with nothing on the bus: being told to wait is
      // not a hang, so the watchdog must not count it.
      assert(!dut.io.stalled.toBoolean, "a disabled generator was reported as stalled")

      dut.io.enable #= true
      dut.clockDomain.waitSampling(20000)
      assert(dut.io.laps.toInt >= 1, "generator did not start when enabled")
      assert(!dut.io.stalled.toBoolean, "stall reported after enabling")
    }
  }

  test("a fabric that stops answering is reported as a stall") {
    // Accepts every address and every data beat, and never answers either.
    // The generator fills its outstanding budget in a few cycles and then has
    // nothing it is allowed to do -- zero errors, zero laps, for ever.
    class Mute extends Component {
      val io = new Bundle {
        val stalled = out Bool ()
        val laps    = out UInt (16 bits)
        val errors  = out UInt (8 bits)
      }
      val gen = new AxiSatGen(axiCfg, genCfg())
      gen.io.axi.aw.ready := True
      gen.io.axi.w.ready  := True
      gen.io.axi.ar.ready := True
      gen.io.axi.b.valid  := False
      gen.io.axi.b.payload.assignDontCare()
      gen.io.axi.r.valid := False
      gen.io.axi.r.payload.assignDontCare()
      io.stalled := gen.io.stalled
      io.laps    := gen.io.laps
      io.errors  := gen.io.dataErrors | gen.io.respErrors
    }

    simCfg.compile(new Mute).doSim { dut =>
      dut.clockDomain.forkStimulus(10)
      dut.clockDomain.waitSampling(5)

      dut.clockDomain.waitSampling(400)
      assert(!dut.io.stalled.toBoolean, "stall reported before hangCycles had elapsed")

      dut.clockDomain.waitSampling(400)
      assert(dut.io.stalled.toBoolean, "a generator nobody answers was not reported as stalled")
      // What the verdict had to go on before `stalled` existed: all clean.
      assert(dut.io.errors.toInt == 0 && dut.io.laps.toInt == 0)
    }
  }

  test("a master straddling two slaves under B/R back-pressure neither hangs nor misreads") {
    simCfg.compile(new XbarHarness(genCfg(windowWords = 128, respStall = 8))).doSim { dut =>
      dut.clockDomain.forkStimulus(10)
      dut.clockDomain.waitSampling(5)

      var bStalled = 0
      var rStalled = 0
      val awAt     = Array(0, 0)
      val arAt     = Array(0, 0)
      dut.clockDomain.onSamplings {
        if (dut.io.bStalled.toBoolean) bStalled += 1
        if (dut.io.rStalled.toBoolean) rStalled += 1
        for (si <- 0 until 2) {
          if (((dut.io.awAt.toInt >> si) & 1) != 0) awAt(si) += 1
          if (((dut.io.arAt.toInt >> si) & 1) != 0) arAt(si) += 1
        }
      }

      dut.clockDomain.waitSampling(60000)

      // What makes the run worth anything has to have happened: both slaves
      // served both directions, and the generator held a live response on
      // thousands of cycles. Without that a clean result says nothing.
      for (si <- 0 until 2) {
        assert(awAt(si) > 100, s"only ${awAt(si)} writes reached slave $si")
        assert(arAt(si) > 100, s"only ${arAt(si)} reads reached slave $si")
      }
      assert(bStalled > 1000, s"B was stalled on only $bStalled cycles")
      assert(rStalled > 1000, s"R was stalled on only $rStalled cycles")

      val sticky = dut.io.violation.toBigInt
      assert(sticky == 0, s"crossbar broke AXI4 toward the master: ${decode(sticky)}")
      assert(!dut.io.overflow.toBoolean, "protocol checker overflowed")
      assert(dut.io.dataErrors.toInt == 0, s"dataErrors = ${dut.io.dataErrors.toInt}")
      assert(dut.io.respErrors.toInt == 0, s"respErrors = ${dut.io.respErrors.toInt}")
      assert(!dut.io.stalled.toBoolean, "generator stalled")
      assert(dut.io.laps.toInt >= 2, s"only ${dut.io.laps.toInt} laps in 60000 cycles")
    }
  }
}
