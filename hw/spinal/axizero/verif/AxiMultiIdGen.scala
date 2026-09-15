// Copyright (c) 2026 Leonardo Capossio - bard0 design  hello@bard0.com
// SPDX-License-Identifier: MIT
//
// AxiMultiIdGen - a self-checking AXI4 master that varies its transaction ID.
//
// Why this exists. AXI4 orders transactions that share an ID and a direction:
// they complete in the order they were issued, whichever slave each one went
// to. Transactions of different IDs are unordered. The crossbar keeps the
// first promise with the industry's single-slave-per-ID rule -- an ID may only
// have work outstanding at one slave, so a request that would move a live ID
// somewhere else waits for the first slave to finish -- and that machinery is
// the part of the design whose correctness depends on a master actually using
// more than one ID.
//
// Nothing in this repository did. VexRiscv drives a constant ID, and so does
// AxiSatGen, so every simulation and every bitstream exercised the ordering
// table in its degenerate shape: one master, one thread, nothing to order and
// nothing to hold back. MultiIdOrderingSpec closed that in simulation. This is
// the same coverage on silicon, which needs a generator that can check itself
// without a scoreboard in Scala.
//
// How it checks. Everything is a function of the address, as in AxiSatGen:
//
//     data(word, region, pass) = dataPattern | (pass << 16) | (region << 15) | word
//
// so a read can be predicted from what was written there, and the region bit
// means a burst answered out of the wrong RAM reads back as the wrong value
// rather than as a plausible one.
//
// The ordering promise is checked directly, in hardware. Each ID owns a small
// queue of the read bursts issued under it, oldest first, and every R beat is
// compared against the head of the queue its RID names. Three separate
// failures land on that comparison:
//
//   * a same-ID response that overtook an earlier one carries the data of the
//     wrong burst, because the head of the queue is still the earlier one;
//   * a response returned under the wrong RID is checked against an ID whose
//     queue holds something else, or nothing at all;
//   * a burst answered with the wrong number of beats desynchronises RLAST
//     from the beat counter.
//
// Each ID also owns a disjoint slice of both windows, so two IDs can never
// disagree about what a word should hold, and a burst delivered under the
// wrong ID is a data error rather than an ambiguity.
//
// What the traffic does. Bursts are issued in a fixed order -- the region
// first, then the ID, then the offset within the slice -- so one ID's two
// consecutive bursts land in *different* RAMs, and the second is presented
// while the first is still in flight. That is the single-slave-per-ID rule's
// own case: the fabric may not admit the second until the first has retired,
// and a fabric that admits it anyway answers out of order and fails here. The
// ID changes every second burst, so several IDs are in flight at once as well.
//
// Both directions run this pattern, but the ordering proof is on the read
// side. A write's only response is BID and BRESP, so two same-ID writes
// answered in the wrong order are indistinguishable -- what the write side
// proves is that the fabric routed every beat to the address its AW named,
// which the read-back checks word by word.

package axizero.verif

import spinal.core._
import spinal.lib._
import spinal.lib.bus.amba4.axi._

/** Configuration for [[AxiMultiIdGen]].
  *
  * @param regionABase
  *   Base of this generator's window in the first slave.
  * @param regionBBase
  *   Base of its window in the second slave. The two windows are the same size, and the generator
  *   owns both exclusively: it predicts what every word in them holds.
  * @param windowWords
  *   Words in each window. Split evenly between the IDs, so each ID owns `windowWords / idCount`
  *   words of each window and no two IDs ever address the same one.
  * @param idCount
  *   How many IDs the generator uses, a power of two of at least 2. More IDs than the crossbar has
  *   threads is deliberate and supported: the extra ones wait for a thread, which is its own case.
  * @param dataPattern
  *   Upper bits of the generated data, which is how a failure names the generator that wrote it.
  *   Its low 16 bits must be clear, because the pass, the region and the word go there.
  * @param passes
  *   Passes per lap. Each uses a different burst length and a different data value.
  * @param maxBurstLen
  *   Longest burst, in beats. Capped at 16 so a burst cannot cross a 4 KiB boundary from any
  *   aligned base.
  * @param outstandingPerId
  *   Read bursts one ID may have in flight. This is the depth of that ID's expectation queue, and
  *   the whole point of more than one: an ID with a single outstanding burst cannot have its
  *   responses reordered, so nothing would be proved.
  * @param qos
  *   AXQOS presented on both address channels.
  * @param continuous
  *   Restart after the last pass instead of stopping, which is what a stress build wants.
  * @param respStall
  *   Back-pressure on B and R, 0 to 15, from a free-running LFSR, as in [[AxiSatGen]]. A master
  *   that never stalls a response never asks the fabric to hold one.
  * @param hangCycles
  *   Cycles with no handshake on any channel, while enabled and unfinished, after which `stalled`
  *   latches. Single-slave-per-ID makes a master wait by design, so this is set well above any wait
  *   the rule itself can produce.
  */
case class AxiMultiIdGenConfig(
  regionABase: BigInt,
  regionBBase: BigInt,
  windowWords: Int = 128,
  idCount: Int = 4,
  dataPattern: Long = 0xd1000000L,
  passes: Int = 4,
  maxBurstLen: Int = 4,
  outstandingPerId: Int = 2,
  qos: Int = 0,
  continuous: Boolean = true,
  respStall: Int = 0,
  hangCycles: Int = 1 << 16
) {
  private def isPow2(n: Int): Boolean = n > 0 && (n & (n - 1)) == 0

  require(
    idCount >= 2 && isPow2(idCount),
    s"AxiMultiIdGenConfig: idCount must be a power of two of at least 2, not $idCount"
  )
  require(
    isPow2(maxBurstLen) && maxBurstLen >= 1 && maxBurstLen <= 16,
    s"AxiMultiIdGenConfig: maxBurstLen must be a power of two up to 16, not $maxBurstLen"
  )
  require(
    isPow2(windowWords),
    s"AxiMultiIdGenConfig: windowWords must be a power of two, not $windowWords"
  )
  require(
    windowWords % (idCount * maxBurstLen) == 0,
    s"AxiMultiIdGenConfig: windowWords ($windowWords) must divide into $idCount slices of whole " +
      s"bursts of up to $maxBurstLen beats"
  )
  require(
    windowWords <= (1 << 15),
    "AxiMultiIdGenConfig: the word index is 15 bits of the data word"
  )
  require(
    (dataPattern & 0xffffL) == 0,
    f"AxiMultiIdGenConfig: dataPattern 0x$dataPattern%x must leave its low 16 bits clear for the " +
      "pass, the region and the word"
  )
  require(passes >= 1, "AxiMultiIdGenConfig: passes must be at least 1")
  // Two, not one: an ID with a single outstanding burst cannot have its
  // responses reordered, so a depth of one would check nothing about order.
  // A power of two, because the queue pointers wrap by truncation.
  require(
    outstandingPerId >= 2 && isPow2(outstandingPerId),
    s"AxiMultiIdGenConfig: outstandingPerId must be a power of two of at least 2, not $outstandingPerId"
  )
  require(qos >= 0 && qos <= 15, s"AxiMultiIdGenConfig: qos must fit AXQOS's four bits, not $qos")
  require(
    respStall >= 0 && respStall <= 15,
    s"AxiMultiIdGenConfig: respStall is a fraction of 16 from 0 to 15, not $respStall"
  )
  require(hangCycles >= 16, s"AxiMultiIdGenConfig: hangCycles must be at least 16, not $hangCycles")

  /** Words one ID owns in each window. */
  val sliceWords: Int = windowWords / idCount

  /** Bytes each window covers. */
  val windowBytes: BigInt = BigInt(windowWords) * 4

  for ((name, base) <- Seq(("regionABase", regionABase), ("regionBBase", regionBBase))) {
    require(
      (base % (maxBurstLen * 4)) == 0,
      f"AxiMultiIdGenConfig: $name 0x$base%x must be aligned to maxBurstLen * 4 bytes, or a burst " +
        "could cross a 4 KiB boundary"
    )
  }
  require(
    regionABase + windowBytes <= regionBBase || regionBBase + windowBytes <= regionABase,
    f"AxiMultiIdGenConfig: the two windows overlap at 0x$regionABase%x; they are meant to be in " +
      "two different slaves"
  )
}

/** A self-checking AXI4 master that varies its transaction ID. See the file header.
  *
  * Errors are sticky and saturating: once any of them is non-zero the run has failed, and the count
  * says roughly how badly rather than exactly.
  */
class AxiMultiIdGen(axiConfig: Axi4Config, cfg: AxiMultiIdGenConfig) extends Component {

  require(
    axiConfig.useLen && axiConfig.useSize && axiConfig.useBurst && axiConfig.useId,
    "AxiMultiIdGen needs full AXI4 with an ID field -- varying the ID is the whole point"
  )
  require(
    axiConfig.idWidth >= log2Up(cfg.idCount),
    s"AxiMultiIdGen: idWidth ${axiConfig.idWidth} cannot carry ${cfg.idCount} IDs"
  )

  val io = new Bundle {

    /** The bus. Reads and writes only inside this generator's own two windows. */
    val axi = master(Axi4(axiConfig))

    /** Hold low to keep the generator idle; it free-runs while high. */
    val enable = in Bool () default (True)

    /** High when a non-continuous generator has finished its last pass. */
    val done = out Bool ()

    /** Words that read back as something other than what was written. Saturates.
      *
      * This is where a same-ID response that overtook an earlier one lands: the expectation it is
      * compared against is the earlier burst's, so the data does not match.
      */
    val dataErrors = out UInt (8 bits)

    /** Responses that were not OKAY. Saturates. */
    val respErrors = out UInt (8 bits)

    /** Responses that broke the ordering contract in a way the data cannot show: an R beat or a B
      * under an ID with nothing outstanding, or a burst whose RLAST did not land on its last beat.
      * Saturates.
      */
    val orderErrors = out UInt (8 bits)

    /** Completed laps. Zero at the end of a run means the generator never got going, which is a
      * different failure from getting a wrong answer.
      */
    val laps = out UInt (16 bits)

    /** Latched once the generator has gone `hangCycles` cycles without a handshake. Sticky. */
    val stalled = out Bool ()

    /** Latched once two or more IDs had reads outstanding at the same time.
      *
      * Without this a run that serialised itself -- one ID at a time, for whatever reason -- would
      * report a clean pass while proving nothing about ordering, which is the failure mode of every
      * stress test that assumes its own load.
      */
    val multiIdSeen = out Bool ()

    /** Latched once this generator *asked* to move a live ID to the other slave: an address was
      * presented for one region while that ID still had a burst in flight for the other.
      *
      * Asked, not achieved, and the difference is the whole point. A working fabric never lets one
      * ID have work outstanding at two slaves at once -- that is the rule -- so a signal that
      * waited to observe it would stay low against correct hardware and high only against broken
      * hardware, which is not evidence a run can assert. What a run can assert is that the rule was
      * put under load: the request was there, and the fabric held it.
      */
    val crossSlaveTried = out Bool ()
  }

  private val idW    = log2Up(cfg.idCount)
  private val passW  = log2Up(cfg.passes)
  private val sliceW = log2Up(cfg.sliceWords)
  private val roundW = log2Up(cfg.sliceWords) + 1
  private val beatW  = log2Up(cfg.maxBurstLen) max 1
  private val outW   = log2Up(cfg.outstandingPerId + 1)
  private val maxSel = log2Up(cfg.maxBurstLen)
  private val wordW  = log2Up(cfg.windowWords)

  // ── Where the run has got to ──────────────────────────────────────────────
  private val passIdx = Reg(UInt(passW bits)) init (0)
  private val laps    = Reg(UInt(16 bits)) init (0)
  private val done    = Reg(Bool()) init (False)
  if (cfg.continuous) done := False

  // Pass p uses 1 << (p % 4) beats, capped at maxBurstLen -- the same mix of
  // short and long bursts AxiSatGen uses, for the same reason: a long burst
  // holds a slave while other IDs queue behind it, and a short one makes the
  // fabric decide often.
  private val lenSelRaw = if (passW >= 2) passIdx(1 downto 0) else passIdx.resize(2)
  private val lenSel: UInt =
    if (maxSel >= 3) lenSelRaw
    else Mux(lenSelRaw > maxSel, U(maxSel, 2 bits), lenSelRaw).setName("lenSel")

  /** Beats per burst this pass. */
  private val beats = (U(1, 5 bits) |<< lenSel)

  /** Bursts one ID issues per region per pass. Every slice is a whole number of bursts. */
  private val roundsPerPass = (U(cfg.sliceWords, roundW bits) >> lenSel)

  private def regionBase(region: Bool): UInt =
    region ? U(cfg.regionBBase, axiConfig.addressWidth bits) | U(
      cfg.regionABase,
      axiConfig.addressWidth bits
    )

  /** The word a burst starts at: its ID's slice, then its offset inside it. */
  private def startWord(id: UInt, round: UInt): UInt =
    ((id.resize(wordW + 1) |<< sliceW) + (round.resize(wordW + 1) |<< lenSel)).resize(wordW + 1)

  private def addrOf(region: Bool, word: UInt): UInt =
    (regionBase(region) + (word.resize(axiConfig.addressWidth) |<< 2))

  /** data(word, region, pass) -- see the header. */
  private def dataOf(word: UInt, region: Bool, pass: UInt): Bits =
    (B(cfg.dataPattern, 32 bits) | (pass.resize(32) |<< 16).asBits |
      (region.asUInt.resize(32) |<< 15).asBits | word.resize(32).asBits)

  private val errData  = Reg(UInt(8 bits)) init (0)
  private val errResp  = Reg(UInt(8 bits)) init (0)
  private val errOrder = Reg(UInt(8 bits)) init (0)

  private def bump(counter: UInt): Unit =
    when(counter =/= counter.maxValue) { counter := counter + 1 }

  /** A cursor over the burst order: region fastest, then the ID, then the offset in the slice.
    *
    * Region fastest is what puts the single-slave-per-ID rule under load. One ID's two consecutive
    * bursts go to *different* slaves, so the second is presented while the first is still in flight
    * and the fabric has to hold it back. With the ID stepping fastest instead, an ID's next burst
    * comes round several bursts later, by which time its earlier one has long retired and the rule
    * is never asked for anything.
    *
    * The ID still changes every second burst, so different IDs remain concurrent -- which is the
    * other half of what is being tested.
    */
  private class Cursor(name: String) {
    val id     = Reg(UInt(idW bits)) init (0)
    val region = Reg(Bool()) init (False)
    val round  = Reg(UInt(roundW bits)) init (0)
    id.setName(s"${name}_id")
    region.setName(s"${name}_region")
    round.setName(s"${name}_round")

    /** Every burst of this pass has been issued. */
    def exhausted: Bool = round === roundsPerPass

    def step(): Unit = {
      when(!region) {
        region := True
      } otherwise {
        region := False
        when(id === (cfg.idCount - 1)) {
          id    := 0
          round := round + 1
        } otherwise {
          id := id + 1
        }
      }
    }

    def rewind(): Unit = {
      id     := 0
      region := False
      round  := 0
    }
  }

  // ── Phases ────────────────────────────────────────────────────────────────
  // Write everything, wait for every response, then read it all back. The two
  // are kept apart because AXI orders nothing between the write and read
  // channel groups: a read issued before its write's B may legally be served
  // first, and would report a failure that is the generator's fault.
  private object Phase extends SpinalEnum {
    val WRITE, WDRAIN, READ, RDRAIN, NEXT, IDLE = newElement()
  }
  private val phase = Reg(Phase()) init (Phase.WRITE)

  // ── Response back-pressure ────────────────────────────────────────────────
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

  // ── Write address ─────────────────────────────────────────────────────────
  private val awCur     = new Cursor("aw")
  private val wrPending = Vec(Reg(UInt(outW bits)) init (0), cfg.idCount) // AW issued, B not back
  private val awId      = awCur.id
  private val awRoom    = wrPending(awId) < cfg.outstandingPerId

  io.axi.aw.valid := False
  io.axi.aw.payload.assignDontCare()
  io.axi.aw.addr                          := addrOf(awCur.region, startWord(awCur.id, awCur.round))
  io.axi.aw.id                            := awCur.id.resized
  io.axi.aw.len                           := (beats - 1).resized
  io.axi.aw.size                          := U(2, 3 bits) // 4 bytes
  io.axi.aw.burst                         := B(1, 2 bits) // INCR
  if (axiConfig.useLock) io.axi.aw.lock   := 0
  if (axiConfig.useCache) io.axi.aw.cache := 0
  if (axiConfig.useProt) io.axi.aw.prot   := 0
  if (axiConfig.useQos) io.axi.aw.qos     := B(cfg.qos, 4 bits)
  if (axiConfig.useRegion) io.axi.aw.region := 0

  when(io.enable && phase === Phase.WRITE && !awCur.exhausted && awRoom) {
    io.axi.aw.valid := True
  }

  // ── Write data ────────────────────────────────────────────────────────────
  // W carries no ID: its beats belong to the AWs in the order they were
  // issued, so the W cursor walks the same order the AW cursor does and
  // trails it. It is deliberately not gated on AWREADY -- AXI4 A3.3.1 permits
  // data before address, and a slave that merges AW and W into one command
  // channel will not accept the address until a beat is there to go with it.
  private val wCur   = new Cursor("w")
  private val wBeat  = Reg(UInt(beatW + 1 bits)) init (0)
  private val wAhead = Reg(UInt(log2Up(cfg.idCount * cfg.outstandingPerId + 2) bits)) init (0)
  private val wArmed =
    (phase === Phase.WRITE || phase === Phase.WDRAIN) && !wCur.exhausted &&
      wAhead < (cfg.idCount * cfg.outstandingPerId)

  private val wWord = (startWord(wCur.id, wCur.round) + wBeat).resize(wordW + 1)

  io.axi.w.valid                       := io.enable && wArmed
  io.axi.w.data                        := dataOf(wWord, wCur.region, passIdx)
  if (axiConfig.useStrb) io.axi.w.strb := B(axiConfig.bytePerWord bits, default -> True)
  if (axiConfig.useLast) io.axi.w.last := wBeat === (beats - 1)

  io.axi.b.ready := respReady(0)

  // ── Read address ──────────────────────────────────────────────────────────
  // Each ID owns a queue of the bursts issued under it, oldest first. The
  // queue is what the ordering check compares against, and its depth is how
  // many chances the fabric gets to answer one ID out of order.
  private val arCur     = new Cursor("ar")
  private val rdQRegion = Vec(Vec(Reg(Bool()) init (False), cfg.outstandingPerId), cfg.idCount)
  private val rdQRound =
    Vec(Vec(Reg(UInt(roundW bits)) init (0), cfg.outstandingPerId), cfg.idCount)
  private val rdQHead  = Vec(Reg(UInt(log2Up(cfg.outstandingPerId) bits)) init (0), cfg.idCount)
  private val rdQTail  = Vec(Reg(UInt(log2Up(cfg.outstandingPerId) bits)) init (0), cfg.idCount)
  private val rdQCount = Vec(Reg(UInt(outW bits)) init (0), cfg.idCount)
  private val rBeat    = Vec(Reg(UInt(beatW + 1 bits)) init (0), cfg.idCount)

  private val arId   = arCur.id
  private val arRoom = rdQCount(arId) < cfg.outstandingPerId

  io.axi.ar.valid := False
  io.axi.ar.payload.assignDontCare()
  io.axi.ar.addr                          := addrOf(arCur.region, startWord(arCur.id, arCur.round))
  io.axi.ar.id                            := arCur.id.resized
  io.axi.ar.len                           := (beats - 1).resized
  io.axi.ar.size                          := U(2, 3 bits)
  io.axi.ar.burst                         := B(1, 2 bits)
  if (axiConfig.useLock) io.axi.ar.lock   := 0
  if (axiConfig.useCache) io.axi.ar.cache := 0
  if (axiConfig.useProt) io.axi.ar.prot   := 0
  if (axiConfig.useQos) io.axi.ar.qos     := B(cfg.qos, 4 bits)
  if (axiConfig.useRegion) io.axi.ar.region := 0

  when(io.enable && phase === Phase.READ && !arCur.exhausted && arRoom) {
    io.axi.ar.valid := True
  }

  io.axi.r.ready := respReady(8)

  // ── Handshakes ────────────────────────────────────────────────────────────
  private val awFire = io.axi.aw.valid && io.axi.aw.ready
  private val wFire  = io.axi.w.valid && io.axi.w.ready
  private val bFire  = io.axi.b.valid && io.axi.b.ready
  private val arFire = io.axi.ar.valid && io.axi.ar.ready
  private val rFire  = io.axi.r.valid && io.axi.r.ready
  private val rLast  = if (axiConfig.useLast) io.axi.r.last else True

  private val bId = io.axi.b.id.resize(idW)
  private val rId = io.axi.r.id.resize(idW)

  when(awFire) { awCur.step() }
  when(arFire) { arCur.step() }

  when(wFire) {
    when(wBeat === (beats - 1)) {
      wBeat := 0
      wCur.step()
    } otherwise {
      wBeat := wBeat + 1
    }
  }

  // Bursts whose W is done but whose AW has not been issued, so W cannot run
  // arbitrarily far ahead of the addresses it belongs to.
  private val wBurstDone = wFire && wBeat === (beats - 1)
  when(wBurstDone && !awFire) {
    wAhead := wAhead + 1
  } elsewhen (!wBurstDone && awFire && wAhead =/= 0) {
    wAhead := wAhead - 1
  }

  // ── Write responses ───────────────────────────────────────────────────────
  // B carries an ID and a response and nothing else, so what can be checked
  // here is that the fabric answered an ID that was actually waiting for one.
  // Where the write data went is checked by the read-back, word by word.
  when(bFire) {
    if (axiConfig.useResp) when(io.axi.b.resp =/= 0) { bump(errResp) }
    when(wrPending(bId) === 0) { bump(errOrder) }
  }
  for (i <- 0 until cfg.idCount) {
    val inc = awFire && awId === i
    val dec = bFire && bId === i && wrPending(i) =/= 0
    when(inc && !dec) {
      wrPending(i) := wrPending(i) + 1
    } elsewhen (!inc && dec) {
      wrPending(i) := wrPending(i) - 1
    }
  }

  // ── Read responses: the ordering check ────────────────────────────────────
  // The head of this ID's queue is the burst that must be answered next. Its
  // region and offset give the word this beat has to carry, so a response that
  // overtook an earlier one of the same ID is a data error here, and one under
  // an ID with nothing outstanding is an ordering error.
  private val rHeadRegion = rdQRegion(rId)(rdQHead(rId))
  private val rHeadRound  = rdQRound(rId)(rdQHead(rId))
  private val rWord       = (startWord(rId, rHeadRound) + rBeat(rId)).resize(wordW + 1)

  when(rFire) {
    when(rdQCount(rId) === 0) {
      bump(errOrder)
    } otherwise {
      when(io.axi.r.data =/= dataOf(rWord, rHeadRegion, passIdx)) { bump(errData) }
      when(rLast =/= (rBeat(rId) === (beats - 1))) { bump(errOrder) }
    }
    if (axiConfig.useResp) when(io.axi.r.resp =/= 0) { bump(errResp) }
  }

  for (i <- 0 until cfg.idCount) {
    val push = arFire && arId === i
    val pop  = rFire && rLast && rId === i && rdQCount(i) =/= 0

    when(push) {
      rdQRegion(i)(rdQTail(i)) := arCur.region
      rdQRound(i)(rdQTail(i))  := arCur.round
      rdQTail(i)               := (rdQTail(i) + 1).resized
    }
    when(pop) {
      rdQHead(i) := (rdQHead(i) + 1).resized
    }
    when(push && !pop) {
      rdQCount(i) := rdQCount(i) + 1
    } elsewhen (!push && pop) {
      rdQCount(i) := rdQCount(i) - 1
    }

    // Beats are counted per ID, because two IDs' bursts may interleave on R.
    when(rFire && rId === i) {
      when(rLast) { rBeat(i) := 0 } otherwise { rBeat(i) := rBeat(i) + 1 }
    }
  }

  // ── Evidence that the load was what it claims ─────────────────────────────
  private val idsBusy     = Vec((0 until cfg.idCount).map(i => rdQCount(i) =/= 0))
  private val busyCount   = CountOne(idsBusy.asBits)
  private val multiIdSeen = Reg(Bool()) init (False)
  private val crossSeen   = Reg(Bool()) init (False)
  when(busyCount >= 2) { multiIdSeen := True }

  // An address presented for one region while that ID is live at the other is
  // the single-slave-per-ID rule being asked for something. The fabric answers
  // by holding the address until the first slave has finished, which is why
  // this records the request rather than waiting to see both in flight: with a
  // correct fabric, both in flight never happens.
  for (i <- 0 until cfg.idCount) {
    // Slot s of this ID's queue is live when it is one of the `count` entries
    // starting at the head. The pointer wraps because the depth is a power of
    // two, which is what the config requires.
    val live = (0 until cfg.outstandingPerId).map { s =>
      val slot = (rdQHead(i) + s).resized
      (rdQCount(i) > s, rdQRegion(i)(slot))
    }
    val liveA  = live.map { case (busy, region) => busy && !region }.reduceBalancedTree(_ || _)
    val liveB  = live.map { case (busy, region) => busy && region }.reduceBalancedTree(_ || _)
    val asking = io.axi.ar.valid && arId === i
    when(asking && ((arCur.region && liveA) || (!arCur.region && liveB))) { crossSeen := True }
  }

  // ── Liveness ──────────────────────────────────────────────────────────────
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

  private val writesDone =
    awCur.exhausted && wCur.exhausted && wrPending.map(_ === 0).reduceBalancedTree(_ && _)
  private val readsDone =
    arCur.exhausted && rdQCount.map(_ === 0).reduceBalancedTree(_ && _)

  switch(phase) {
    is(Phase.WRITE) {
      when(awCur.exhausted) { phase := Phase.WDRAIN }
    }
    is(Phase.WDRAIN) {
      when(writesDone) { phase := Phase.READ }
    }
    is(Phase.READ) {
      when(arCur.exhausted) { phase := Phase.RDRAIN }
    }
    is(Phase.RDRAIN) {
      when(readsDone) { phase := Phase.NEXT }
    }
    is(Phase.NEXT) {
      awCur.rewind()
      wCur.rewind()
      arCur.rewind()
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

  io.done            := done
  io.dataErrors      := errData
  io.respErrors      := errResp
  io.orderErrors     := errOrder
  io.laps            := laps
  io.stalled         := stalled
  io.multiIdSeen     := multiIdSeen
  io.crossSlaveTried := crossSeen
}
