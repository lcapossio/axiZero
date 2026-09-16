// Copyright (c) 2026 Leonardo Capossio - bard0 design  hello@bard0.com
// SPDX-License-Identifier: MIT
//
// AxiSatGen - a saturating, self-checking AXI4 master.
//
// This is the SpinalHDL counterpart of hw/vivado/arty_a7/ip/rtl/axi_sat_gen.v.
// The Verilog original could only ever be dropped into a Vivado block design
// beside a MicroBlaze; this one is a plain Axi4 master that plugs into an
// axiZero port directly, simulates in SpinalSim with the rest of the design,
// and generates for Vivado and Quartus from the same source.
//
// What it is for. A crossbar's arbitration, its per-slave W-route FIFO and its
// response routing only do anything when more than one master wants the same
// slave at the same time, with more than one transaction in flight. A CPU does
// not produce that on its own: VexRiscv issues at most a couple of outstanding
// reads and, being write-through with no dirty bit, cannot produce a write
// burst at all. This generator is what puts the fabric under load on hardware,
// where a Scala traffic generator cannot go.
//
// Two properties make it worth more than a load:
//
//   Saturation. It keeps up to `maxOutstanding` bursts in flight, so AW runs
//   ahead of W and of B. A master that waits for each response before issuing
//   the next address never makes an arbiter choose.
//
//   Self-checking. It reads back every word it wrote and compares. A dropped
//   or mis-routed beat fails on the board rather than only in simulation.
//
// Determinism is what makes the read check possible without storing anything:
//
//     data(k, p) = dataPattern | (p << 16) | k
//
// with k the word offset inside the window and p the pass index. A pass covers
// the window exactly, so after its write phase every word holds data(k, p) and
// the read phase predicts each value from the address alone.
//
// Burst length varies per pass rather than per burst -- pass p uses
// 1 << (p % 4) beats, capped at `maxBurstLen`. Long bursts are what make an
// arbitration ranking decay, because a waiting master's priority ages one step
// per cycle; short ones make the arbiter choose often. Keeping the length
// constant within a pass means AW and W cannot disagree about it, so no length
// queue is needed between them.

package axizero.verif

import spinal.core._
import spinal.lib._
import spinal.lib.bus.amba4.axi._

/** Configuration for [[AxiSatGen]].
  *
  * @param baseAddr
  *   Base of the window this generator owns. It must own it exclusively: the generator predicts
  *   what every word holds, so anything else writing there is a failure it will report.
  * @param windowWords
  *   Words in the window. Must be a multiple of `maxBurstLen` so a pass divides evenly into bursts.
  * @param dataPattern
  *   Upper bits of the generated data, which is how a failure names the generator that wrote it.
  * @param passes
  *   Passes per lap. Each uses a different burst length and a different data value.
  * @param maxBurstLen
  *   Longest burst, in beats. Capped at 16 so that a burst cannot cross a 4 KiB boundary from any
  *   `maxBurstLen`-aligned base.
  * @param maxOutstanding
  *   Bursts in flight before the generator stops issuing addresses.
  * @param qos
  *   AXQOS presented on both address channels, for designs whose arbitration reads it.
  * @param continuous
  *   Restart after the last pass instead of stopping. A stress design wants this: the load has to
  *   outlast whatever is being observed.
  * @param respStall
  *   Back-pressure on B and R, 0 to 15: BREADY and RREADY are each held low on about `respStall`/16
  *   of cycles, from a free-running LFSR. 0 ties both high and generates no LFSR. A master that
  *   never stalls a response never asks the fabric to hold one, so without this a response-channel
  *   mux may swap the payload under a waiting VALID and nothing downstream sees it.
  * @param hangCycles
  *   Cycles with no handshake on any channel, while enabled and not finished, after which `stalled`
  *   latches. A saturating generator always has something to issue or collect, so going this long
  *   without one means the fabric has stopped answering it -- which zero errors and a non-zero lap
  *   count would otherwise report as a pass.
  */
case class AxiSatGenConfig(
  baseAddr: BigInt,
  windowWords: Int = 128,
  dataPattern: Long = 0xb3000000L,
  passes: Int = 8,
  maxBurstLen: Int = 8,
  maxOutstanding: Int = 4,
  qos: Int = 0,
  continuous: Boolean = true,
  respStall: Int = 0,
  hangCycles: Int = 1 << 16
) {
  require(windowWords >= maxBurstLen, "AxiSatGenConfig: the window must hold at least one burst")
  require(
    windowWords % maxBurstLen == 0,
    s"AxiSatGenConfig: windowWords ($windowWords) must be a multiple of maxBurstLen ($maxBurstLen)"
  )
  require(
    maxBurstLen >= 1 && maxBurstLen <= 16 && isPow2(maxBurstLen),
    s"AxiSatGenConfig: maxBurstLen must be a power of two up to 16, not $maxBurstLen"
  )
  require(passes >= 1, "AxiSatGenConfig: passes must be at least 1")
  require(maxOutstanding >= 1, "AxiSatGenConfig: maxOutstanding must be at least 1")
  require(qos >= 0 && qos <= 15, s"AxiSatGenConfig: qos must fit AXQOS's four bits, not $qos")
  require(
    respStall >= 0 && respStall <= 15,
    s"AxiSatGenConfig: respStall is a fraction of 16 from 0 to 15, not $respStall"
  )
  require(hangCycles >= 16, s"AxiSatGenConfig: hangCycles must be at least 16, not $hangCycles")
  require(
    (baseAddr % (maxBurstLen * 4)) == 0,
    f"AxiSatGenConfig: baseAddr 0x${baseAddr}%x must be aligned to maxBurstLen * 4 bytes, or a " +
      "burst could cross a 4 KiB boundary"
  )

  /** Bytes the window covers. */
  val windowBytes: BigInt = BigInt(windowWords) * 4

  private def isPow2(n: Int): Boolean = n > 0 && (n & (n - 1)) == 0
}

/** A saturating, self-checking AXI4 master. See the file header for what it is for.
  *
  * Errors are sticky and saturating: once `dataErrors` or `respErrors` is non-zero the run has
  * failed, and the count says roughly how badly rather than exactly.
  */
class AxiSatGen(axiConfig: Axi4Config, cfg: AxiSatGenConfig) extends Component {

  require(axiConfig.useLen && axiConfig.useSize && axiConfig.useBurst, "AxiSatGen needs full AXI4")

  val io = new Bundle {

    /** The bus. Reads and writes only inside this generator's own window. */
    val axi = master(Axi4(axiConfig))

    /** Hold low to keep the generator idle; it free-runs while high. */
    val enable = in Bool () default (True)

    /** High when a non-continuous generator has finished its last pass. */
    val done = out Bool ()

    /** Words that read back as something other than what was written. Saturates. */
    val dataErrors = out UInt (8 bits)

    /** Responses that were not OKAY. Saturates. */
    val respErrors = out UInt (8 bits)

    /** Completed laps of `passes` passes. Zero at the end of a run means the generator never got
      * going, which is a different failure from getting a wrong answer.
      */
    val laps = out UInt (16 bits)

    /** Latched once the generator has gone `hangCycles` cycles without a handshake. Sticky: a
      * fabric that deadlocks and later recovers has still failed.
      */
    val stalled = out Bool ()
  }

  private val wordW   = log2Up(cfg.windowWords)
  private val passW   = log2Up(cfg.passes)
  private val outW    = log2Up(cfg.maxOutstanding + 1)
  private val beatW   = log2Up(cfg.maxBurstLen) max 1
  private val burstsW = log2Up(cfg.windowWords) + 1

  // ── Where the run has got to ──────────────────────────────────────────────
  private val passIdx = Reg(UInt(passW bits)) init (0)
  private val laps    = Reg(UInt(16 bits)) init (0)
  private val done    = Reg(Bool()) init (False)

  // A continuous generator never finishes, so nothing below ever writes `done`
  // and it stays low for the life of the run. Say so, rather than leaving the
  // register undriven: to a reader and to the elaborator alike, a register
  // that is deliberately constant and one that was forgotten look the same,
  // and SpinalHDL reports the second as an unassigned-register error.
  if (cfg.continuous) done := False

  // Pass p uses 1 << (p % 4) beats, capped at maxBurstLen: a mix of short and
  // long bursts without a per-burst length to carry between AW and W.
  private val maxSel    = log2Up(cfg.maxBurstLen)
  private val lenSelRaw = if (passW >= 2) passIdx(1 downto 0) else passIdx.resize(2)

  /** log2 of this pass's burst length, after the maxBurstLen cap. Everything below is derived from
    * it, so AW, W, AR and R cannot disagree about how long a burst is.
    */
  private val lenSel: UInt =
    if (maxSel >= 3) lenSelRaw
    else Mux(lenSelRaw > maxSel, U(maxSel, 2 bits), lenSelRaw).setName("lenSel")

  /** Beats per burst this pass. */
  private val beats = (U(1, 5 bits) |<< lenSel)

  /** Bursts in this pass. windowWords is a multiple of every length used, so this divides. */
  private val burstsPerPass = (U(cfg.windowWords, burstsW bits) >> lenSel).resized

  /** The word a burst index starts at. */
  private def wordOf(burst: UInt): UInt = (burst << lenSel).resize(wordW + 1)

  private def addrOf(word: UInt): UInt =
    (U(cfg.baseAddr, axiConfig.addressWidth bits) + (word << 2).resized)

  /** data(k, p) -- see the header. */
  private def dataOf(word: UInt, pass: UInt): Bits =
    (B(cfg.dataPattern, 32 bits) | (pass.resize(32) |<< 16).asBits | word.resize(32).asBits)

  private val errData = Reg(UInt(8 bits)) init (0)
  private val errResp = Reg(UInt(8 bits)) init (0)

  private def bump(counter: UInt): Unit =
    when(counter =/= counter.maxValue) { counter := counter + 1 }

  // ── Phases ────────────────────────────────────────────────────────────────
  // A pass writes the whole window, waits for every response, reads it all back
  // and checks it. Write and read are kept apart because AXI orders nothing
  // between the two channel groups: a read issued before its write's B response
  // may legally be served first, and would then report a failure that is the
  // test's fault rather than the fabric's.
  private object Phase extends SpinalEnum {
    val WRITE, WDRAIN, READ, RDRAIN, NEXT, IDLE = newElement()
  }
  private val phase = Reg(Phase()) init (Phase.WRITE)

  // ── Write address ─────────────────────────────────────────────────────────
  private val awBurst   = Reg(UInt(burstsW bits)) init (0)
  private val awPending = Reg(UInt(outW bits)) init (0) // issued, B not yet returned
  private val awMore    = awBurst < burstsPerPass

  io.axi.aw.valid := False
  io.axi.aw.payload.assignDontCare()
  io.axi.aw.addr                            := addrOf(wordOf(awBurst).resized)
  io.axi.aw.len                             := (beats - 1).resized
  io.axi.aw.size                            := U(2, 3 bits) // 4 bytes
  io.axi.aw.burst                           := B(1, 2 bits) // INCR
  if (axiConfig.useId) io.axi.aw.id         := 0
  if (axiConfig.useLock) io.axi.aw.lock     := 0
  if (axiConfig.useCache) io.axi.aw.cache   := 0
  if (axiConfig.useProt) io.axi.aw.prot     := 0
  if (axiConfig.useQos) io.axi.aw.qos       := B(cfg.qos, 4 bits)
  if (axiConfig.useRegion) io.axi.aw.region := 0

  when(io.enable && phase === Phase.WRITE && awMore && awPending < cfg.maxOutstanding) {
    io.axi.aw.valid := True
  }

  // ── Write data ────────────────────────────────────────────────────────────
  // W is deliberately NOT gated on AW having been accepted. AXI4 A3.3.1 lets a
  // master present write data before its address, and some slaves require it:
  // a bridge that merges the two into one shared command channel -- SpinalHDL's
  // Axi4Shared, for one -- will not accept AW until a W beat is there to go
  // with it. A generator that waited for AWREADY first would deadlock against
  // one of those and never issue a single burst.
  //
  // So W is paced by the pass, not by AW, and only kept from running more than
  // `maxOutstanding` bursts ahead so it cannot get arbitrarily far in front.
  // It still counts whole bursts rather than beats: every burst in a pass has
  // the same length, so no length has to be carried from AW to W.
  private val wBurst = Reg(UInt(burstsW bits)) init (0)
  private val wBeat  = Reg(UInt(beatW + 1 bits)) init (0)
  private val wArmed =
    (phase === Phase.WRITE || phase === Phase.WDRAIN) &&
      wBurst < burstsPerPass &&
      wBurst < (awBurst +^ cfg.maxOutstanding)

  private val wWord = (wordOf(wBurst) + wBeat).resize(wordW + 1)

  io.axi.w.valid                       := io.enable && wArmed
  io.axi.w.data                        := dataOf(wWord.resized, passIdx)
  if (axiConfig.useStrb) io.axi.w.strb := B(axiConfig.bytePerWord bits, default -> True)
  if (axiConfig.useLast) io.axi.w.last := wBeat === (beats - 1)

  // ── Response back-pressure ──────────────────────────────────────────────
  // A 16-bit maximal-length Galois LFSR, seeded from the data pattern so two
  // generators on one fabric do not stall in lock-step. B reads one nibble of
  // it and R another, and each is ready when its nibble is at least respStall,
  // so the two stall independently at about respStall/16 of cycles. READY may
  // fall at any time under AXI4 -- only VALID is bound to hold -- so this is
  // legal whatever the pattern.
  private val stallLfsr = Option.when(cfg.respStall > 0) {
    val seed  = ((cfg.dataPattern >> 16) & 0xffff) | 1
    val state = Reg(Bits(16 bits)) init (B(seed, 16 bits))
    state := (state |>> 1) ^ (state(0) ? B(0xb400, 16 bits) | B(0, 16 bits))
    state.setName("respStallLfsr")
  }

  private def respReady(lsb: Int): Bool = stallLfsr match {
    case Some(state) => state(lsb + 3 downto lsb).asUInt >= cfg.respStall
    case None        => True
  }

  io.axi.b.ready := respReady(0)

  // ── Read address ──────────────────────────────────────────────────────────
  private val arBurst   = Reg(UInt(burstsW bits)) init (0)
  private val arPending = Reg(UInt(outW bits)) init (0)
  private val arMore    = arBurst < burstsPerPass

  io.axi.ar.valid := False
  io.axi.ar.payload.assignDontCare()
  io.axi.ar.addr                            := addrOf(wordOf(arBurst).resized)
  io.axi.ar.len                             := (beats - 1).resized
  io.axi.ar.size                            := U(2, 3 bits)
  io.axi.ar.burst                           := B(1, 2 bits)
  if (axiConfig.useId) io.axi.ar.id         := 0
  if (axiConfig.useLock) io.axi.ar.lock     := 0
  if (axiConfig.useCache) io.axi.ar.cache   := 0
  if (axiConfig.useProt) io.axi.ar.prot     := 0
  if (axiConfig.useQos) io.axi.ar.qos       := B(cfg.qos, 4 bits)
  if (axiConfig.useRegion) io.axi.ar.region := 0

  when(io.enable && phase === Phase.READ && arMore && arPending < cfg.maxOutstanding) {
    io.axi.ar.valid := True
  }

  // R is checked against what the write phase must have left at that address.
  // The burst being returned is tracked separately from the one being issued,
  // because AR runs ahead.
  private val rBurst = Reg(UInt(burstsW bits)) init (0)
  private val rBeat  = Reg(UInt(beatW + 1 bits)) init (0)
  private val rWord  = (wordOf(rBurst) + rBeat).resize(wordW + 1)

  io.axi.r.ready := respReady(8)

  // ── Sequencing ────────────────────────────────────────────────────────────
  private val awFire = io.axi.aw.valid && io.axi.aw.ready
  private val wFire  = io.axi.w.valid && io.axi.w.ready
  private val bFire  = io.axi.b.valid && io.axi.b.ready
  private val arFire = io.axi.ar.valid && io.axi.ar.ready
  private val rFire  = io.axi.r.valid && io.axi.r.ready
  private val rLast  = if (axiConfig.useLast) io.axi.r.last else True

  when(awFire) { awBurst := awBurst + 1 }

  when(wFire) {
    when(wBeat === (beats - 1)) {
      wBeat  := 0
      wBurst := wBurst + 1
    } otherwise {
      wBeat := wBeat + 1
    }
  }

  // AW issued minus B returned, so the generator can cap what is in flight.
  when(awFire && !bFire) {
    awPending := awPending + 1
  } elsewhen (!awFire && bFire) {
    awPending := awPending - 1
  }

  when(bFire) {
    if (axiConfig.useResp) when(io.axi.b.resp =/= 0) { bump(errResp) }
  }

  when(arFire) { arBurst := arBurst + 1 }
  when(arFire && !(rFire && rLast)) {
    arPending := arPending + 1
  } elsewhen (!arFire && rFire && rLast) {
    arPending := arPending - 1
  }

  when(rFire) {
    when(io.axi.r.data =/= dataOf(rWord.resized, passIdx)) { bump(errData) }
    if (axiConfig.useResp) when(io.axi.r.resp =/= 0) { bump(errResp) }
    when(rLast) {
      rBeat  := 0
      rBurst := rBurst + 1
    } otherwise {
      rBeat := rBeat + 1
    }
  }

  // ── Liveness ──────────────────────────────────────────────────────────────
  // Errors and laps only say what happened before the generator stopped. One
  // that completes a lap and then deadlocks against the fabric reports zero
  // errors and a lap count of one for ever after, which reads as a pass. While
  // enabled it always has an address to issue, data to send or a response to
  // collect, so a long enough run of cycles with no handshake at all is a hang.
  private val progress  = awFire || wFire || bFire || arFire || rFire
  private val idleCount = Reg(UInt(log2Up(cfg.hangCycles + 1) bits)) init (0)
  private val stalled   = Reg(Bool()) init (False)

  when(!io.enable || phase === Phase.IDLE || progress) {
    idleCount := 0
  } elsewhen (idleCount =/= cfg.hangCycles) {
    idleCount := idleCount + 1
  } otherwise {
    stalled := True
  }

  private val writesDone = !awMore && wBurst === burstsPerPass && awPending === 0
  private val readsDone  = !arMore && rBurst === burstsPerPass && arPending === 0

  switch(phase) {
    is(Phase.WRITE) {
      when(!awMore) { phase := Phase.WDRAIN }
    }
    is(Phase.WDRAIN) {
      when(writesDone) { phase := Phase.READ }
    }
    is(Phase.READ) {
      when(!arMore) { phase := Phase.RDRAIN }
    }
    is(Phase.RDRAIN) {
      when(readsDone) { phase := Phase.NEXT }
    }
    is(Phase.NEXT) {
      awBurst := 0
      wBurst  := 0
      arBurst := 0
      rBurst  := 0
      when(passIdx === cfg.passes - 1) {
        passIdx := 0
        when(laps =/= laps.maxValue) { laps := laps + 1 }
        if (cfg.continuous) {
          phase := Phase.WRITE
        } else {
          done  := True
          phase := Phase.IDLE
        }
      } otherwise {
        passIdx := passIdx + 1
        phase   := Phase.WRITE
      }
    }
    is(Phase.IDLE) {
      // Finished, and not continuous. Nothing more is driven onto the bus.
    }
  }

  io.done       := done
  io.dataErrors := errData
  io.respErrors := errResp
  io.laps       := laps
  io.stalled    := stalled
}
