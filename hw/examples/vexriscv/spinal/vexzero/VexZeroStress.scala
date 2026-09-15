// Copyright (c) 2026 Leonardo Capossio — bard0 design  hello@bard0.com
// SPDX-License-Identifier: MIT
package vexzero

import spinal.core._
import axizero._
import axizero.verif.AxiSatGenConfig

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

  val policies: Seq[Policy] = Seq(Rr, Wrr, Qos, Axi3)

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
      axisSmoke = true
    )
  }
}
