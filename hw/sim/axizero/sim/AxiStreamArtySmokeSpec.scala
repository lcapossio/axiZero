// Copyright (c) 2026 Leonardo Capossio
// SPDX-License-Identifier: MIT
package axizero.sim

import org.scalatest.funsuite.AnyFunSuite
import spinal.core._
import spinal.core.sim._
import axizero.stream.AxiStreamArtySmoke

// ---------------------------------------------------------------------------
// AxiStreamArtySmokeSpec — the Arty stream smoke design passes in simulation
//
// The design checks itself and reports through a status word that software
// reads over GPIO on the board. A failure there costs a bitstream build to
// find; this runs the same design here, and says which check failed.
// ---------------------------------------------------------------------------
class AxiStreamArtySmokeSpec extends AnyFunSuite {

  private val spinalCfg = SpinalConfig(
    defaultConfigForClockDomains = ClockDomainConfig(
      clockEdge = RISING,
      resetKind = SYNC,
      resetActiveLevel = LOW
    )
  )

  // Status word layout, as AxiStreamArtySmoke drives it.
  private val checks = Seq(
    3  -> "demux output 0 byte count",
    4  -> "demux output 1 byte count",
    5  -> "broadcast output 0 beat count",
    6  -> "broadcast output 1 beat count",
    7  -> "byte sums",
    8  -> "frame counts",
    9  -> "backpressure was exercised",
    10 -> "routing"
  )

  test("the smoke design finishes, passes every check, and stays passed") {
    SimConfig.withConfig(spinalCfg).compile(new AxiStreamArtySmoke).doSim { dut =>
      val cd = dut.clockDomain
      cd.forkStimulus(10)

      def status = dut.io.status.toLong
      // It gives up after 4095 cycles; the traffic takes a few dozen.
      cd.waitSamplingWhere(4200)((status & 1) != 0)
      val st = status

      val failed = checks.collect { case (bit, what) if ((st >> bit) & 1) == 0 => what }
      assert(failed.isEmpty, f"status 0x$st%08X, failed: ${failed.mkString(", ")}")
      assert(((st >> 1) & 1) == 1, f"pass bit clear, status 0x$st%08X")
      assert(((st >> 2) & 1) == 0, f"fail bit set, status 0x$st%08X")
      assert(((st >> 11) & 0x1f) == 3, "three packets through the demux")
      assert(((st >> 16) & 0xff) == 16, "16 bytes out of demux output 0")
      assert(((st >> 24) & 0xff) == 8, "8 bytes out of demux output 1")

      // Nothing more arrives afterwards: a stray beat would move a count off
      // its expected value and drop the pass bit.
      cd.waitSampling(200)
      assert(status == st, f"status moved after passing: 0x$st%08X -> 0x$status%08X")
    }
  }
}
