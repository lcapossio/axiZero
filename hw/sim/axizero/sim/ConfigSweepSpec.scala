// Copyright (c) 2026 Leonardo Capossio
// SPDX-License-Identifier: MIT
package axizero.sim

import java.nio.file.{Files, Path}
import java.util.Comparator

import org.scalatest.funsuite.AnyFunSuite
import spinal.core._
import spinal.lib.bus.amba4.axi.Axi4Config
import axizero._
import axizero.adapters.Axi3Config

// ---------------------------------------------------------------------------
// ConfigSweepSpec — every configuration knob, elaborated
//
// The simulation suites each build a handful of designs, chosen for what they
// test, so most combinations of options are never built at all: an 8-bit Lite
// slave on a 64-bit fabric, AXI3 and Lite masters on one crossbar, a fabric
// narrower than its ports. A combination that fails to elaborate is a
// generator that crashes on a user's YAML, and nothing else would find it.
//
// These elaborate each one to Verilog -- no simulation, so they are cheap --
// and check that the configuration checks refuse what they should, with a
// message that says why.
// ---------------------------------------------------------------------------
class ConfigSweepSpec extends AnyFunSuite {

  /** A port as the sweep describes it; the builder turns it into a real config. */
  private case class P(
    mode: PortMode,
    dw: Int = 32,
    idW: Int = 2,
    aw: Int = 32,
    rs: Boolean = false,
    skid: Boolean = false
  )

  private def liteCfg(dw: Int, aw: Int) = Axi4Config(
    addressWidth = aw,
    dataWidth = dw,
    useId = false,
    useLen = false,
    useSize = false,
    useBurst = false,
    useLock = false,
    useCache = false,
    useQos = false,
    useRegion = false,
    useLast = false
  )

  private def fullCfg(dw: Int, idW: Int, aw: Int) =
    Axi4Config(addressWidth = aw, dataWidth = dw, idWidth = idW)

  private val slaveSize = BigInt(0x1000)

  /** Builds the config, giving each Full slave the ID width the mixed top requires of it. */
  private def build(
    ms: Seq[P],
    ss: Seq[P],
    arbitration: ArbitrationPolicy = RoundRobin,
    internalDataWidth: Option[Int] = None,
    maxOutstanding: Int = 1,
    idThreads: Int = 2,
    decodeErrorResponse: Boolean = true,
    observeMasters: Boolean = false
  ): AxiZeroConfig = {
    val indexBits = if (ms.size <= 1) 0 else log2Up(ms.size)
    val masterIdW = (ms.filter(_.mode != LiteAxi4).map(_.idW) :+ 1).max
    AxiZeroConfig(
      masters = ms.map { p =>
        p.mode match {
          case LiteAxi4 =>
            MasterPort(liteCfg(p.dw, p.aw), LiteAxi4, p.rs, regSliceSkid = p.skid)
          case FullAxi4 =>
            MasterPort(fullCfg(p.dw, p.idW, p.aw), FullAxi4, p.rs, regSliceSkid = p.skid)
          case Axi3Mode =>
            MasterPort(
              fullCfg(p.dw, p.idW, p.aw),
              Axi3Mode,
              p.rs,
              axi3Cfg = Some(Axi3Config(p.aw, p.dw, p.idW)),
              regSliceSkid = p.skid
            )
        }
      },
      slaves = ss.zipWithIndex.map {
        case (p, i) =>
          val c =
            if (p.mode == LiteAxi4) liteCfg(p.dw, p.aw)
            else fullCfg(p.dw, masterIdW + indexBits, p.aw)
          SlavePort(c, p.mode, slaveSize * i, slaveSize, p.rs, p.skid)
      },
      arbitration = arbitration,
      internalDataWidth = internalDataWidth,
      maxOutstanding = maxOutstanding,
      idThreads = idThreads,
      decodeErrorResponse = decodeErrorResponse,
      observeMasters = observeMasters
    )
  }

  /** Elaborates to Verilog in a scratch directory that is removed afterwards. */
  private def elaborate(cfg: AxiZeroConfig): Unit = {
    val dir: Path = Files.createTempDirectory("axizero-sweep")
    try {
      val report = SpinalConfig(targetDirectory = dir.toString).generateVerilog(
        if (cfg.isAllLite) new AxiZeroLiteTop(cfg) else new AxiZeroMixedTop(cfg)
      )
      assert(report.toplevel != null)
    } finally {
      Files.walk(dir).sorted(Comparator.reverseOrder[Path]()).forEach(p => Files.delete(p))
    }
  }

  private val lite        = P(LiteAxi4)
  private val full        = P(FullAxi4)
  private val axi3        = P(Axi3Mode, idW = 4)
  private val arbs        = Seq(RoundRobin, FixedPriority, QosBased)
  private def wrr(n: Int) = WeightedRoundRobin(Seq.tabulate(n)(_ + 1))

  // ── All-Lite fabric ───────────────────────────────────────────────────────

  private val liteCases: Seq[(String, AxiZeroConfig)] =
    Seq(
      "one master, one slave" -> build(Seq(lite), Seq(lite))
    ) ++ (arbs :+ wrr(3)).map(a =>
      s"3x2, $a" -> build(Seq(lite, lite, lite), Seq(lite, lite), arbitration = a)
    ) ++ Seq(
      "register slices, skid and not, on every port" -> build(
        Seq(lite.copy(rs = true), lite.copy(rs = true, skid = true)),
        Seq(lite.copy(rs = true, skid = true), lite.copy(rs = true))
      ),
      "8/16/64-bit ports on one fabric" -> build(
        Seq(lite.copy(dw = 16), lite.copy(dw = 64)),
        Seq(lite.copy(dw = 8), lite.copy(dw = 16), lite.copy(dw = 64))
      ),
      "fabric narrower than every port" -> build(
        Seq(lite.copy(dw = 64), lite),
        Seq(lite, lite.copy(dw = 64, rs = true)),
        internalDataWidth = Some(16)
      ),
      "slaves with narrower address buses" -> build(
        Seq(lite),
        Seq(lite.copy(aw = 16), lite.copy(aw = 24))
      ),
      "no DECERR responder" -> build(Seq(lite, lite), Seq(lite), decodeErrorResponse = false),
      "outstanding transactions allowed" -> build(
        Seq(lite, lite),
        Seq(lite, lite),
        maxOutstanding = 4
      )
    )

  for ((name, cfg) <- liteCases)
    test(s"Lite: $name") { elaborate(cfg) }

  // ── Full and mixed fabric ─────────────────────────────────────────────────

  private val fullCases: Seq[(String, AxiZeroConfig)] =
    Seq(
      "one master, one slave"           -> build(Seq(full), Seq(full)),
      "one Lite master, one Full slave" -> build(Seq(lite), Seq(full))
    ) ++ (for {
      a  <- arbs :+ wrr(2)
      mo <- Seq(1, 4)
    } yield s"2x2, $a, maxOutstanding=$mo" ->
      build(Seq(full, full), Seq(full, full), arbitration = a, maxOutstanding = mo)) ++
      Seq(1, 4).map(t =>
        s"three masters, idThreads=$t" ->
          build(Seq(full, full, full), Seq(full, lite), maxOutstanding = 4, idThreads = t)
      ) ++ Seq(
        "observed masters" -> build(
          Seq(full, lite, axi3),
          Seq(full),
          maxOutstanding = 2,
          observeMasters = true
        ),
        "32/64/128-bit Full ports and 8/16-bit Lite ports" -> build(
          Seq(full, full.copy(dw = 64), lite.copy(dw = 16)),
          Seq(full.copy(dw = 128), full, lite.copy(dw = 8)),
          maxOutstanding = 2
        ),
        "AXI3, Full and Lite masters, register slices everywhere" -> build(
          Seq(axi3.copy(rs = true), full.copy(rs = true, skid = true), lite.copy(rs = true)),
          Seq(full.copy(rs = true, skid = true), lite.copy(rs = true, skid = true)),
          arbitration = QosBased,
          maxOutstanding = 4
        ),
        "fabric narrower than a Full and a Lite port" -> build(
          Seq(full.copy(dw = 64), lite.copy(dw = 64)),
          Seq(full.copy(dw = 64), lite),
          internalDataWidth = Some(32)
        ),
        "mismatched address widths" -> build(
          Seq(full, full.copy(aw = 24)),
          Seq(full.copy(aw = 16), lite.copy(aw = 20))
        ),
        "different master ID widths" -> build(
          Seq(full.copy(idW = 1), full.copy(idW = 5), lite),
          Seq(full, full),
          maxOutstanding = 4,
          arbitration = wrr(3)
        ),
        "no DECERR responder, deep outstanding" -> build(
          Seq(full, lite),
          Seq(full, full),
          maxOutstanding = 8,
          decodeErrorResponse = false
        )
      )

  for ((name, cfg) <- fullCases)
    test(s"Full/mixed: $name") { elaborate(cfg) }

  // ── Configurations that must be refused ─────────────────────────────────

  /** Runs `body` and expects it to be refused with a message containing `why`. */
  private def refused(why: String)(body: => Any): Unit = {
    val e = intercept[IllegalArgumentException](body)
    assert(e.getMessage.contains(why), s"refused, but with: ${e.getMessage}")
  }

  private val oneLite = Seq(SlavePort(liteCfg(32, 32), LiteAxi4, 0, slaveSize))
  private val oneMst  = Seq(MasterPort(liteCfg(32, 32), LiteAxi4))

  private val refusals: Seq[(String, String, () => Any)] = Seq(
    ("no masters", "At least one master", () => AxiZeroConfig(Nil, oneLite)),
    ("no slaves", "At least one slave", () => AxiZeroConfig(oneMst, Nil)),
    (
      "maxOutstanding 0",
      "maxOutstanding",
      () => AxiZeroConfig(oneMst, oneLite, maxOutstanding = 0)
    ),
    ("idThreads 0", "idThreads", () => AxiZeroConfig(oneMst, oneLite, idThreads = 0)),
    (
      "observing an all-Lite fabric",
      "observeMasters",
      () => build(Seq(lite), Seq(lite), observeMasters = true)
    ),
    (
      "WRR weights for the wrong master count",
      "weights.size",
      () => build(Seq(lite), Seq(lite), arbitration = wrr(2))
    ),
    ("a zero WRR weight", "weights must be positive", () => WeightedRoundRobin(Seq(1, 0))),
    (
      "master skid without a slice",
      "regSliceSkid needs regSlice",
      () => MasterPort(liteCfg(32, 32), LiteAxi4, regSliceSkid = true)
    ),
    (
      "slave skid without a slice",
      "regSliceSkid needs regSlice",
      () => SlavePort(liteCfg(32, 32), LiteAxi4, 0, slaveSize, regSliceSkid = true)
    ),
    (
      "an AXI3 master with no AXI3 config",
      "axi3Cfg must be set",
      () => MasterPort(fullCfg(32, 2, 32), Axi3Mode)
    ),
    (
      "an AXI3 config on a Full master",
      "axi3Cfg must only be set",
      () => MasterPort(fullCfg(32, 2, 32), FullAxi4, axi3Cfg = Some(Axi3Config(32, 32, 2)))
    ),
    (
      "a slave size that is not a power of two",
      "must be a power of 2",
      () => AxiZeroConfig(oneMst, Seq(SlavePort(liteCfg(32, 32), LiteAxi4, 0, 0x3000)))
    ),
    (
      "a misaligned base",
      "must be aligned",
      () => AxiZeroConfig(oneMst, Seq(SlavePort(liteCfg(32, 32), LiteAxi4, 0x800, slaveSize)))
    ),
    (
      "a slave beyond every master's reach",
      "outside",
      () =>
        AxiZeroConfig(
          Seq(MasterPort(liteCfg(32, 12), LiteAxi4)),
          Seq(SlavePort(liteCfg(32, 32), LiteAxi4, slaveSize, slaveSize))
        )
    ),
    (
      "overlapping slaves",
      "overlaps",
      () =>
        AxiZeroConfig(
          oneMst,
          Seq(
            SlavePort(liteCfg(32, 32), LiteAxi4, 0, slaveSize * 2),
            SlavePort(liteCfg(32, 32), LiteAxi4, slaveSize, slaveSize)
          )
        )
    ),
    (
      "a Full config on the Lite top",
      "requires all ports to be LiteAxi4",
      () => SpinalConfig().generateVerilog(new AxiZeroLiteTop(build(Seq(full), Seq(full))))
    ),
    (
      "an all-Lite config on the mixed top",
      "at least one FullAxi4",
      () => SpinalConfig().generateVerilog(new AxiZeroMixedTop(build(Seq(lite), Seq(lite))))
    )
  )

  for ((name, why, body) <- refusals)
    test(s"refused: $name") { refused(why)(body()) }
}
