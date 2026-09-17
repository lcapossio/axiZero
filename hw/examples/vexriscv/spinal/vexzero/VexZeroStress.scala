// Copyright (c) 2026 Leonardo Capossio — bard0 design  hello@bard0.com
// SPDX-License-Identifier: MIT
package vexzero

import spinal.core._
import axizero._
import axizero.verif.{AxiMultiIdGenConfig, AxiSatGenConfig}

// ---------------------------------------------------------------------------
// VexZeroStress  —  the loaded configurations, defined once
//
// These are the VexRiscv replacements for the retired MicroBlaze wrr, qos,
// qos_stress, axi3 and axis Arty suites. Each of those needed a Xilinx CPU and
// ten Xilinx IPs to say what a `VexZeroSocConfig` says here, and none of them
// could ever have been built for Altera; these run in simulation, on the Arty
// A7-100T through Vivado and on the DE25-Nano through Quartus, from one source.
//
// They live in one object rather than in each test and each generator main
// because the point of a hardware run is to confirm what a simulation claimed.
// If the board built a different address map, a different window size or a
// different set of weights from the one [[vexzero.sim.VexZeroGenStressSpec]]
// simulated, the two would be measuring different designs and neither would
// support the other.
//
// What every variant has in common:
//
//   two generators   saturating and self-checking, one window of RAM each,
//                    several bursts in flight, running from reset and never
//                    stopping. Without them a crossbar arbitrates in about one
//                    cycle in a hundred and an arbitration policy is invisible.
//
//   the self test    the same firmware the plain VexZero design runs, still
//                    required to produce the right checksum, LEDs and
//                    characters -- now while competing for the RAM it fetches
//                    from.
//
//   the checkers     a passive AXI4 protocol checker on every fabric port, so
//                    a board that ran for hours has been judged against the
//                    protocol for all of it.
//
//   the island       the AXI4-Stream smoke test, which shares nothing with the
//                    bus but the clock and so costs a bitstream nothing to
//                    carry. It is why there is no separate stream build.
//
// What differs between them is one field: how the crossbar chooses.
// ---------------------------------------------------------------------------
object VexZeroStress {

  /** Larger than the self test's 8 KiB because the generators need windows of their own above the
    * firmware. Still one BRAM-shaped block on both boards.
    */
  val ramSize: BigInt = 32 KiB

  val ramBase: BigInt = BigInt("80000000", 16)

  /** Words each generator owns. 256 words is 1 KiB, which at eight beats a burst is 32 bursts a
    * pass -- long enough that arbitration decisions accumulate into a measurable share, short
    * enough that a lap completes in a few thousand cycles and a hardware run laps constantly.
    */
  val windowWords: Int = 256

  /** Generator windows, a page apart and both above the firmware's data at RAM + 0x1000. */
  val window0: BigInt = ramBase + 0x2000
  val window1: BigInt = ramBase + 0x4000

  /** The two generators, differing only in the AXQOS they present and in the top byte of the data
    * they write -- which is what names the culprit when a word turns up in the wrong window.
    */
  def generators(qos0: Int, qos1: Int): Seq[AxiSatGenConfig] = Seq(
    AxiSatGenConfig(
      baseAddr = window0,
      windowWords = windowWords,
      dataPattern = 0xa1000000L,
      qos = qos0
    ),
    AxiSatGenConfig(
      baseAddr = window1,
      windowWords = windowWords,
      dataPattern = 0xa2000000L,
      qos = qos1
    )
  )

  /** How the crossbar chooses, and what each choice is meant to demonstrate. */
  sealed trait Policy {
    def name: String
  }

  /** No ranking at all: every master in turn. The baseline the others are read against. */
  case object Rr extends Policy { val name = "rr" }

  /** Static shares. gen0 is given three times gen1's weight, so the fabric should carry clearly
    * more of its traffic without ever shutting gen1 out.
    */
  case object Wrr extends Policy { val name = "wrr" }

  /** Ranking by AXQOS, with aging. The CPU outranks both generators and gen0 outranks gen1, so all
    * three levels are in use at once.
    */
  case object Qos extends Policy { val name = "qos" }

  /** Round-robin, but with the CPU's load/store port routed through AXI3 and back. */
  case object Axi3 extends Policy { val name = "axi3" }

  /** Round-robin, with a second RAM and two multi-ID generators driving IDs between the two.
    *
    * The other four builds say what the fabric does under load. This one says what it does about
    * *order*: every other master on this board, VexRiscv included, drives one constant ID, so until
    * this build the ordering table went to hardware having only ever been exercised in simulation.
    * See [[AxiMultiIdGen]] for what is checked and how.
    */
  case object Ids extends Policy { val name = "ids" }

  val policies: Seq[Policy] = Seq(Rr, Wrr, Qos, Axi3, Ids)

  def policyOf(name: String): Policy =
    policies
      .find(_.name == name)
      .getOrElse(
        throw new IllegalArgumentException(
          s"unknown stress policy '$name'; expected one of ${policies.map(_.name).mkString(", ")}"
        )
      )

  /** Weights for [[WeightedRoundRobin]], which needs one per master port.
    *
    * The CPU's two ports and the host bridge keep a weight of one and gen0 is given three, so the
    * ratio under test is between the two generators -- the only two masters doing identical work.
    */
  private def weights(hostMaster: Boolean): Seq[Int] =
    Seq(1, 1) ++ (if (hostMaster) Seq(1) else Nil) ++ Seq(3, 1)

  /** Build a loaded SoC configuration.
    *
    * @param policy
    *   which of the four variants this is.
    * @param switchWidth
    *   board switch count; four on both boards used here.
    * @param hostMaster
    *   add the debug-cable master port. The DE25-Nano reports over it and so needs it; the Arty
    *   reports over its UART and does not.
    */
  /** The second RAM, and the windows the multi-ID generators own in each.
    *
    * 4 KiB is one BRAM on either board and far more than the generators need: each one owns 128
    * words of each RAM, which at four beats a burst is 32 bursts a pass per region.
    */
  val ram2Base: BigInt = BigInt("90000000", 16)

  /** An address no slave claims, which the crossbar's own decode-error responder answers.
    *
    * It is the only thing on this bus that makes one write response distinguishable from another:
    * every RAM here answers OKAY, so a B swapped between two waiting IDs is bit-for-bit a correct
    * one. See [[AxiMultiIdGen]]. Nothing is stored there and nothing reads it back -- and because
    * the responder is already part of every fabric, this costs the design no slave port, no arbiter
    * input and no decode term. It also puts the responder itself on the board, which nothing else
    * here does.
    */
  val errRegionBase: BigInt = BigInt("91000000", 16)
  val ram2Size: BigInt      = 4 KiB

  private val idWindowWords = 128
  private val idWindowBytes = idWindowWords * 4

  /** The two multi-ID generators. Four IDs each -- twice the crossbar's default of two threads per
    * master per direction, so an ID that finds no free thread has to wait for one, which is its own
    * case and one no constant-ID master can produce.
    *
    * Four outstanding per ID, not two: bursts go out in pairs at one RAM before crossing to the
    * other, and the crossing request has to be offered while *both* members of the pair are still
    * live. At a depth of two the queue is full by then and the cross waits for room rather than for
    * the single-slave-per-ID rule, which asks the fabric's per-ID count for nothing beyond
    * zero-or-one.
    */
  def multiIdGenerators: Seq[AxiMultiIdGenConfig] = Seq(
    AxiMultiIdGenConfig(
      regionABase = ramBase + 0x6000,
      regionBBase = ram2Base,
      windowWords = idWindowWords,
      idCount = 4,
      dataPattern = 0xd1000000L,
      outstandingPerId = 4,
      respStall = 3,
      errRegionBase = Some(errRegionBase)
    ),
    // Two IDs rather than four, and that is the point: its port is one ID bit
    // wide where the fabric carries two, so everything it issues crosses
    // Axi4IdWidener with an ID that changes. The widener is in every mixed-width
    // design in this repository and until now the only narrow master on either
    // board was the CPU, whose ID is a constant -- so the zero-extension was
    // carried by a signal that never moved, which is exactly where a padding or
    // truncation bug survives. Two IDs is still enough for the ordering rule to
    // have something to hold: one ID crossing while the other is live.
    AxiMultiIdGenConfig(
      regionABase = ramBase + 0x6000 + idWindowBytes,
      regionBBase = ram2Base + idWindowBytes,
      windowWords = idWindowWords,
      idCount = 2,
      dataPattern = 0xd2000000L,
      outstandingPerId = 4,
      respStall = 5,
      // Its own words in the error region -- one per ID, and the first
      // generator owns the four below these.
      errRegionBase = Some(errRegionBase + 0x10)
    )
  )

  def socConfig(
    policy: Policy,
    switchWidth: Int = 4,
    hostMaster: Boolean = false
  ): VexZeroSocConfig = {
    // QoS is the only variant that ranks anything, so it is the only one where
    // the AXQOS values mean something. Everywhere else they are left at zero
    // rather than set to values no arbiter reads.
    val (cpuQos, qos0, qos1) = policy match {
      case Qos => (12, 6, 2)
      case _   => (0, 0, 0)
    }

    val arbitration: ArbitrationPolicy = policy match {
      case Rr   => RoundRobin
      case Wrr  => WeightedRoundRobin(weights(hostMaster))
      case Qos  => QosBased
      case Axi3 => RoundRobin
      case Ids  => RoundRobin
    }

    VexZeroSocConfig(
      ramSize = ramSize,
      switchWidth = switchWidth,
      hostMaster = hostMaster,
      maxOutstanding = 4,
      arbitration = arbitration,
      cpuQos = cpuQos,
      slaveRegSlices = true,
      masterRegSliceSkid = true,
      protocolCheck = true,
      trafficGens = generators(qos0, qos1),
      axi3DataPath = policy == Axi3,
      axisSmoke = true,
      // The ordering build carries the second RAM and the multi-ID generators
      // on top of everything the others carry, so what it adds is the ordering
      // traffic and not a different design.
      ram2Base = Option.when(policy == Ids)(ram2Base),
      ram2Size = ram2Size,
      multiIdGens = if (policy == Ids) multiIdGenerators else Nil
    )
  }
}
