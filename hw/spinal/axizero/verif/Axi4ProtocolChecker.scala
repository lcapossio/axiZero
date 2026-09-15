// Copyright (c) 2026 Leonardo Capossio - bard0 design  hello@bard0.com
// SPDX-License-Identifier: MIT
//
// Axi4ProtocolChecker - a passive, synthesizable AXI4 protocol checker.
//
// The simulation monitor in hw/sim (AxiMonitor) checks four things and only
// exists inside SpinalSim. AMD's axi_protocol_checker IP checks a great deal
// more but is a Vivado block-design IP: it cannot be instantiated in a plain
// RTL project, it cannot run in simulation here, and it cannot be built for
// Altera at all. The designs this interconnect is validated on are exactly
// the ones neither of those covers -- the VexZero SoC is one generated
// Verilog file with no block design, built for both Vivado and Quartus.
//
// So this is ordinary SpinalHDL that snoops a bus and latches what it sees.
// It is passive: it reads VALID, READY and payload and drives nothing on the
// bus, so wiring it in cannot change what the design does. The same source
// runs in SpinalSim, on Artix-7 and on Agilex 5.
//
// Every rule sets one sticky bit, held until reset, so a violation that
// happens once in a ten-minute run is still there at the end. `any` is the
// OR of all of them, which is what a board with one spare LED reports.
//
// What it does NOT check, so that the absence is on the record rather than
// implied: no X or unknown-value checks (those need simulation semantics and
// have no meaning in hardware), no exclusive-access rules, no low-power
// interface, no timing or deadlock rules. This is a protocol checker, not a
// liveness checker: a bus that stops entirely violates nothing here.

package axizero.verif

import spinal.core._
import spinal.lib._
import spinal.lib.bus.amba4.axi._

/** One rule the checker enforces. `index` is the bit it sets in the sticky vector. */
case class Axi4CheckRule(index: Int, name: String, description: String)

object Axi4ProtocolChecker {

  // Rule numbering is part of the interface: firmware and test benches decode
  // the sticky vector by index, so these are append-only. Do not renumber.
  val rules: Seq[Axi4CheckRule] = Seq(
    Axi4CheckRule(
      0,
      "AW_UNSTABLE",
      "AWVALID dropped before AWREADY, or AW payload changed while stalled"
    ),
    Axi4CheckRule(
      1,
      "W_UNSTABLE",
      "WVALID dropped before WREADY, or W payload changed while stalled"
    ),
    Axi4CheckRule(
      2,
      "B_UNSTABLE",
      "BVALID dropped before BREADY, or B payload changed while stalled"
    ),
    Axi4CheckRule(
      3,
      "AR_UNSTABLE",
      "ARVALID dropped before ARREADY, or AR payload changed while stalled"
    ),
    Axi4CheckRule(
      4,
      "R_UNSTABLE",
      "RVALID dropped before RREADY, or R payload changed while stalled"
    ),
    Axi4CheckRule(5, "W_BEATS_OVERRUN", "the write burst carried more beats than its AWLEN+1"),
    Axi4CheckRule(6, "W_LAST_MISPLACED", "WLAST arrived before the burst reached AWLEN+1 beats"),
    Axi4CheckRule(7, "R_BEATS_OVERRUN", "the read burst carried more beats than its ARLEN+1"),
    Axi4CheckRule(8, "R_LAST_MISPLACED", "RLAST arrived on a beat that is not the ARLEN'th"),
    Axi4CheckRule(9, "B_UNEXPECTED", "write response with no outstanding write of that ID"),
    Axi4CheckRule(10, "R_UNEXPECTED", "read data with no outstanding read of that ID"),
    Axi4CheckRule(11, "AW_BURST_RESERVED", "AWBURST is the reserved encoding 2'b11"),
    Axi4CheckRule(12, "AR_BURST_RESERVED", "ARBURST is the reserved encoding 2'b11"),
    Axi4CheckRule(13, "AW_WRAP_BAD_LEN", "WRAP write burst whose length is not 2, 4, 8 or 16"),
    Axi4CheckRule(14, "AR_WRAP_BAD_LEN", "WRAP read burst whose length is not 2, 4, 8 or 16"),
    Axi4CheckRule(15, "AW_4K_CROSS", "INCR write burst crosses a 4 KiB boundary"),
    Axi4CheckRule(16, "AR_4K_CROSS", "INCR read burst crosses a 4 KiB boundary"),
    Axi4CheckRule(17, "AW_LEN_EXCEEDS_MAX", "write burst longer than the configured maxBurstLen"),
    Axi4CheckRule(18, "AR_LEN_EXCEEDS_MAX", "read burst longer than the configured maxBurstLen")
  )

  val ruleCount: Int = rules.size

  def nameOf(index: Int): String =
    rules.find(_.index == index).map(_.name).getOrElse(s"RULE_$index")

  /** Decode a sticky vector into the names of the rules it reports. */
  def decode(sticky: BigInt): Seq[String] =
    rules.filter(r => sticky.testBit(r.index)).map(_.name)
}

/** Configuration for [[Axi4ProtocolChecker]].
  *
  * Each group can be switched off so a design that only wants the cheap checks does not pay for the
  * tracking state the expensive ones need.
  */
case class Axi4ProtocolCheckerConfig(
  /** Channel handshake stability: VALID held until READY, payload constant while stalled. Cheap --
    * one payload-width register and comparator per channel.
    */
  checkHandshake: Boolean = true,
  /** Burst legality on AW and AR. Combinational; costs almost nothing. */
  checkBurstLegality: Boolean = true,
  /** W and R beat counts against their AWLEN/ARLEN, and LAST placement. Needs a length FIFO on the
    * write side and one per ID on the read side; see `perIdTrackDepth`.
    */
  checkBeatCounts: Boolean = true,
  /** Responses arriving with nothing outstanding. Needs one counter per ID value. */
  checkResponses: Boolean = true,
  /** Depth of the write-side length FIFOs, and the per-ID outstanding-transaction ceiling. A bus
    * that exceeds this is not a protocol violation, so overflow does not raise a rule -- it sets
    * `overflow`, which says the checker stopped being able to see everything.
    */
  trackDepth: Int = 16,
  /** Depth of the per-ID read length FIFO. AXI4 lets read data interleave across IDs, so the read
    * side needs one of these per ID value and the area scales with 2^idWidth -- keep it small.
    */
  perIdTrackDepth: Int = 4,
  /** Longest burst the design is expected to issue, checked as rules 17 and 18. AXI4 allows 256
    * beats for INCR and 16 for the others; a design that never issues long bursts can set this
    * lower and find out when something does.
    */
  maxBurstLen: Int = 256,
  /** Register everything the checker observes before any rule looks at it.
    *
    * The checker is passive and its only output is a set of sticky bits read at the end of a run,
    * so delaying every signal it sees by one uniform cycle leaves each rule's verdict identical --
    * the relations the rules test are between the observed signals, and all of them shift together.
    *
    * It is on by default because of where the checkers sit. A checker on a slave-side port watches
    * the bus *after* arbitration, so without this its rule logic hangs off the arbitration cone and
    * extends it: on the Arty VexZero stress builds the worst path in every variant ran from a
    * master register slice's stored ARADDR, through address decode and the arbiter, into this
    * Area's `violationReg`. That cost 100 MHz closure outright under the two arbiters that carry
    * per-master state -- weighted round robin missed by 0.466 ns and QoS by 1.902 ns, while round
    * robin scraped in at 0.173 ns. Registering here splits that path in two and ends the
    * arbitration half at a register.
    *
    * The cost is one payload-width register per channel. Turn it off for a checker on a path that
    * is already short, where the registers are worth more than the slack.
    */
  pipelineInputs: Boolean = true,
  /** Per-ID tracking allocates 2^idWidth counters, and a FIFO each when `checkBeatCounts` is on.
    * Above this width the area stops being reasonable, so the checker refuses rather than silently
    * costing more than the design it watches.
    */
  maxTrackedIdWidth: Int = 6
) {
  require(trackDepth >= 1, "Axi4ProtocolCheckerConfig: trackDepth must be at least 1")
  require(perIdTrackDepth >= 1, "Axi4ProtocolCheckerConfig: perIdTrackDepth must be at least 1")
  require(
    maxBurstLen >= 1 && maxBurstLen <= 256,
    "Axi4ProtocolCheckerConfig: maxBurstLen must be between 1 and 256"
  )
}

/** Passive protocol checker snooping `bus`.
  *
  * Built as an `Area` rather than a `Component` on purpose: it reads the bus in place, so it needs
  * no ports and adds no connection for a mistake to hide in. Instantiate it next to whatever drives
  * the bus:
  *
  * {{{
  * val check = Axi4ProtocolChecker(fabric.io.slaves(0), label = "s0")
  * io.violation := check.any
  * }}}
  *
  * `sticky` holds one bit per rule, latched until reset. `any` is their OR.
  */
case class Axi4ProtocolChecker(
  bus: Axi4,
  label: String = "axi",
  checkerConfig: Axi4ProtocolCheckerConfig = Axi4ProtocolCheckerConfig()
) extends Area {

  private val cfg = bus.config
  private val cc  = checkerConfig

  /** What the rules actually read. Either the bus itself or a one-cycle-delayed copy of it; see
    * `pipelineInputs` for why the delay is invisible to every rule.
    *
    * Both directions are captured. READY is an input to this Area exactly as VALID is -- the
    * checker drives nothing either way -- so a handshake is still a handshake after the delay.
    */
  private val obs: Axi4 =
    if (!cc.pipelineInputs) bus
    else {
      val snap = Axi4(cfg)
      def capture[T <: Data](src: Stream[T], dst: Stream[T]): Unit = {
        dst.valid   := RegNext(src.valid) init (False)
        dst.ready   := RegNext(src.ready) init (False)
        dst.payload := RegNext(src.payload)
      }
      capture(bus.aw, snap.aw)
      capture(bus.w, snap.w)
      capture(bus.b, snap.b)
      capture(bus.ar, snap.ar)
      capture(bus.r, snap.r)
      snap
    }

  private val perIdTracking = cc.checkResponses || cc.checkBeatCounts
  require(
    !perIdTracking || !cfg.useId || cfg.idWidth <= cc.maxTrackedIdWidth,
    s"Axi4ProtocolChecker($label): response and beat-count checking allocate state per ID value " +
      s"and idWidth is ${cfg.idWidth}, above maxTrackedIdWidth ${cc.maxTrackedIdWidth}. Raise " +
      "maxTrackedIdWidth deliberately, or turn those checks off."
  )

  private val ruleCount = Axi4ProtocolChecker.ruleCount

  /** One bit per rule, set on first violation and held until reset. */
  val sticky = Reg(Bits(ruleCount bits)) init (0)

  /** True once any rule has fired. */
  val any = sticky.orR

  /** The checker ran out of tracking state, so silence is no longer evidence of correctness. Not a
    * protocol violation -- a fact about the checker.
    */
  val overflow = Reg(Bool()) init (False)

  private val violation = Bits(ruleCount bits)
  violation := 0

  private def raise(index: Int)(cond: Bool): Unit = when(cond)(violation(index) := True)

  // The rule outputs are registered before they reach `sticky`, which costs a
  // cycle of latency on a bit that only records whether something ever
  // happened -- nothing reads it in the cycle it is set. It buys back the
  // timing: without it the whole cone, from a bus payload register through the
  // burst arithmetic and the 19-way OR to the sticky register's clock enable,
  // is one combinational path, and on the Arty VexZero build that path was the
  // critical one at +0.027 ns of slack. The pipeline register ends it at the
  // rule outputs instead.
  private val violationReg = RegNext(violation) init (0)

  when(violationReg.orR) {
    sticky := sticky | violationReg
  }

  // Beat counts are held as "number of transfers" (AxLEN + 1), which needs one
  // bit more than AxLEN so that a full 256-beat burst is representable.
  private val beatsWidth = 9

  private val awFire = obs.aw.valid && obs.aw.ready
  private val arFire = obs.ar.valid && obs.ar.ready
  private val wFire  = obs.w.valid && obs.w.ready
  private val rFire  = obs.r.valid && obs.r.ready
  private val wLast  = if (cfg.useLast) obs.w.last else True
  private val rLast  = if (cfg.useLast) obs.r.last else True

  // A burst has to be judged the moment its second half arrives, and a plain
  // StreamFifo reads through a synchronous RAM -- two cycles between a push
  // and the pushed entry appearing at the pop side. A slave may legally return
  // read data the cycle after ARVALID, or even in the same cycle, so that delay
  // would be a hole the checker never looks through. Async read plus bypass
  // makes an entry visible as it is pushed.
  private def lenFifo(depth: Int) =
    new StreamFifo(UInt(beatsWidth bits), depth, withAsyncRead = true, withBypass = true)

  private def beatsOf(ax: Axi4Ax): UInt =
    if (cfg.useLen) (ax.len +^ 1).resize(beatsWidth) else U(1, beatsWidth bits)

  private val zeroId  = U(0, 1 bits)
  private val awId    = if (cfg.useId) obs.aw.id else zeroId
  private val arId    = if (cfg.useId) obs.ar.id else zeroId
  private val bId     = if (cfg.useId) obs.b.id else zeroId
  private val rId     = if (cfg.useId) obs.r.id else zeroId
  private val idCount = if (cfg.useId) 1 << cfg.idWidth else 1

  // ── Handshake stability ───────────────────────────────────────────────────
  // AXI4 A3.2.1: once VALID is asserted it must stay asserted until the
  // handshake completes, and the payload must not change in the meantime.
  private def handshakeRule[T <: Data](stream: Stream[T], index: Int): Unit = {
    val wasValid = RegNext(stream.valid) init (False)
    val wasReady = RegNext(stream.ready) init (False)
    val stalled  = wasValid && !wasReady
    val prev     = RegNextWhen(stream.payload.asBits, stream.valid)
    raise(index)(stalled && !stream.valid)
    raise(index)(stalled && stream.valid && stream.payload.asBits =/= prev)
  }

  if (cc.checkHandshake) {
    handshakeRule(obs.aw, 0)
    handshakeRule(obs.w, 1)
    handshakeRule(obs.b, 2)
    handshakeRule(obs.ar, 3)
    handshakeRule(obs.r, 4)
  }

  // ── Burst legality ────────────────────────────────────────────────────────
  // Checked on the address channels, where the whole burst is described in one
  // beat, so none of this needs state.
  private def burstRules(
    ax: Stream[_ <: Axi4Ax],
    fire: Bool,
    reservedIdx: Int,
    wrapIdx: Int,
    crossIdx: Int,
    lenIdx: Int
  ): Unit = {
    if (cfg.useBurst) {
      raise(reservedIdx)(fire && ax.burst === 3)
    }

    if (cfg.useLen) {
      // AXI4 A3.4.1: a WRAP burst has 2, 4, 8 or 16 transfers, so len+1 must be
      // a power of two in that range -- len is 1, 3, 7 or 15.
      if (cfg.useBurst) {
        val len       = ax.len
        val wrapLenOk = len === 1 || len === 3 || len === 7 || len === 15
        raise(wrapIdx)(fire && ax.burst === 2 && !wrapLenOk)
      }

      raise(lenIdx)(fire && ax.len > U(cc.maxBurstLen - 1, 8 bits))

      // AXI4 A3.4.1: a burst must not cross a 4 KiB boundary. The last byte's
      // address is base + ((len+1) << size) - 1; only bits inside the 4 KiB
      // page matter, so compare page offsets. A burst ending exactly on the
      // boundary is legal, which is why this is > and not >=.
      if (cfg.useSize) {
        val beats = (ax.len +^ 1).resize(beatsWidth)
        val bytes = (beats << ax.size).resize(beatsWidth + 7)
        // A3.4.1 measures the burst from the *aligned* start address: only the
        // first transfer may be unaligned, and every later one starts at
        // Aligned + n*size, so the last byte is Aligned + beats*size - 1. Using
        // the unaligned address here overstates the span by up to size-1 bytes
        // and raises a crossing on bursts that end exactly inside the page --
        // 0xFF2 / len 3 / size 2 really spans 0xFF0..0xFFF and is legal.
        val aligned = ax.addr(11 downto 0) & ~((U(1, 12 bits) << ax.size) - 1).resize(12)
        val offset  = aligned.resize(bytes.getWidth)
        val lastOff = offset + bytes - 1
        val crosses = lastOff > U(4095, lastOff.getWidth bits)
        if (cfg.useBurst) {
          raise(crossIdx)(fire && ax.burst === 1 && crosses)
        } else {
          raise(crossIdx)(fire && crosses)
        }
      }
    }
  }

  if (cc.checkBurstLegality) {
    burstRules(obs.aw, awFire, 11, 13, 15, 17)
    burstRules(obs.ar, arFire, 12, 14, 16, 18)
  }

  // ── Write beat counts ─────────────────────────────────────────────────────
  // AXI4 A3.3.1 lets a master issue write data before its address, so the two
  // channels cannot be assumed to arrive in any particular order. Rather than
  // pick an order and be wrong on a legal master, each side is queued -- the
  // expected length on AW, the observed length on WLAST -- and a burst is
  // judged when both halves are present, whichever came second. W has no ID
  // and AXI4 forbids write interleaving, so one queue per side is enough.
  if (cc.checkBeatCounts) {
    val expectedFifo = lenFifo(cc.trackDepth)
    expectedFifo.io.push.valid   := awFire
    expectedFifo.io.push.payload := beatsOf(obs.aw.payload)
    when(expectedFifo.io.push.valid && !expectedFifo.io.push.ready) { overflow := True }

    val wBeat        = Reg(UInt(beatsWidth bits)) init (0)
    val observedFifo = lenFifo(cc.trackDepth)
    observedFifo.io.push.valid   := wFire && wLast
    observedFifo.io.push.payload := wBeat + 1
    when(observedFifo.io.push.valid && !observedFifo.io.push.ready) { overflow := True }

    when(wFire) {
      when(wLast) {
        wBeat := 0
      } otherwise {
        // A 257th beat cannot belong to any legal burst, so say so rather than
        // waiting for a WLAST that is never coming.
        raise(5)(wBeat === U(255, beatsWidth bits))
        wBeat := wBeat + 1
      }
    }

    val judged = expectedFifo.io.pop.valid && observedFifo.io.pop.valid
    expectedFifo.io.pop.ready := judged
    observedFifo.io.pop.ready := judged
    val expected = expectedFifo.io.pop.payload
    val observed = observedFifo.io.pop.payload
    raise(5)(judged && observed > expected)
    raise(6)(judged && observed < expected)
  }

  // ── Read beat counts ──────────────────────────────────────────────────────
  // Read data cannot precede its address, so the read side can use the simple
  // ordered form -- but AXI4 allows read data for different IDs to interleave,
  // so the beat counter and the length queue are per ID. Within one ID, read
  // data must come back in order, which is what makes a FIFO the right shape.
  if (cc.checkBeatCounts) {
    val lenFifos = Seq.tabulate(idCount) { i =>
      val f = lenFifo(cc.perIdTrackDepth)
      f.io.push.valid   := arFire && (arId === i)
      f.io.push.payload := beatsOf(obs.ar.payload)
      f.io.pop.ready    := False
      when(f.io.push.valid && !f.io.push.ready) { overflow := True }
      f
    }
    val rBeats = Seq.fill(idCount)(Reg(UInt(beatsWidth bits)) init (0))

    for (i <- 0 until idCount) {
      val f = lenFifos(i)
      when(rFire && (rId === i) && f.io.pop.valid) {
        val expected = f.io.pop.payload
        val count    = rBeats(i) + 1
        // The burst is retired on RLAST alone, never on reaching the expected
        // count, so a RLAST that comes too late leaves the extra beats visible
        // instead of quietly starting the next burst's count.
        raise(7)(count > expected)
        raise(8)(rLast && count =/= expected)
        when(rLast) {
          rBeats(i)      := 0
          f.io.pop.ready := True
        } otherwise {
          when(count =/= count.maxValue) { rBeats(i) := count }
        }
      }
    }
  }

  // ── Unexpected responses ──────────────────────────────────────────────────
  // One counter per ID value, incremented on the address handshake and
  // decremented when the response retires. A response arriving while its
  // counter is zero had no request. This holds whatever order responses come
  // back in, so it needs no assumption about interleaving.
  if (cc.checkResponses) {
    val ctrW = log2Up(cc.trackDepth + 1) + 1

    def responseRule(
      issue: Bool,
      issueId: UInt,
      retire: Bool,
      retireId: UInt,
      index: Int
    ): Unit = {
      val outstanding = Seq.fill(idCount)(Reg(UInt(ctrW bits)) init (0))

      // A bus with no ID field has exactly one counter, and indexing a Vec of
      // one with a one-bit address is not something SpinalHDL will build.
      val retiring = if (idCount == 1) outstanding.head else Vec(outstanding)(retireId)
      raise(index)(retire && retiring === 0)

      for (i <- 0 until idCount) {
        val inc = issue && (issueId === i)
        val dec = retire && (retireId === i) && outstanding(i) =/= 0
        when(inc && !dec) {
          when(outstanding(i) === outstanding(i).maxValue) {
            overflow := True
          } otherwise {
            outstanding(i) := outstanding(i) + 1
          }
        } elsewhen (dec && !inc) {
          outstanding(i) := outstanding(i) - 1
        }
      }
    }

    responseRule(awFire, awId, obs.b.valid && obs.b.ready, bId, 9)
    responseRule(arFire, arId, rFire && rLast, rId, 10)
  }
}
