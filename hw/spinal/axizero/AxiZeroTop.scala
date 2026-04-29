// Copyright (c) 2026 Leonardo Capossio — bard0 design  hello@bard0.com
// SPDX-License-Identifier: MIT
package axizero

import spinal.core._
import spinal.lib._
import spinal.lib.bus.amba4.axi._
import axizero.crossbar._
import axizero.adapters._

// ---------------------------------------------------------------------------
// AxiZeroLiteTop  —  top-level component for all-AXI4-Lite configurations
//
// Port io.masters(i) is the interface seen by external master i.
// Port io.slaves(i)  is the interface seen by external slave i.
//
// Per-port data-width conversion and register slices are inserted here,
// so the inner Axi4LiteCrossbar always operates on normCfg.
// ---------------------------------------------------------------------------
class AxiZeroLiteTop(cfg: AxiZeroConfig) extends Component {
  require(cfg.isAllLite, "AxiZeroLiteTop requires all ports to be LiteAxi4")

  // Expose external ports using each port's declared config
  val io = new Bundle {
    val masters = Vec(cfg.masters.indices.map(i => slave(Axi4(cfg.masters(i).config))))
    val slaves  = Vec(cfg.slaves.indices.map(i => master(Axi4(cfg.slaves(i).config))))
  }

  val xbar = new Axi4LiteCrossbar(cfg)

  // ── Master-side wiring ───────────────────────────────────────────────────
  for (mi <- 0 until cfg.numMasters) {
    val mp      = cfg.masters(mi)
    val extPort = io.masters(mi) // external (user-facing)

    // Step 1: optional register slice
    val afterRS: Axi4 = if (mp.regSlice) {
      val rs = new Axi4LiteRegSlice(mp.config)
      rs.io.upstream <> extPort
      rs.io.downstream
    } else extPort

    // Step 2: optional width conversion (narrow → fabric width)
    val afterConv: Axi4 = if (mp.config.dataWidth != cfg.fabricDataWidth) {
      val fabricCfg = mp.config.copy(dataWidth = cfg.fabricDataWidth)
      val conv      = new Axi4LiteWidthConverter(mp.config, fabricCfg)
      conv.io.narrow <> afterRS
      conv.io.wide
    } else afterRS

    // Step 3: connect to crossbar (normCfg port)
    xbar.io.masters(mi) <> afterConv
  }

  // ── Slave-side wiring ────────────────────────────────────────────────────
  for (si <- 0 until cfg.numSlaves) {
    val sp      = cfg.slaves(si)
    val extPort = io.slaves(si) // external (user-facing)

    // Step 1: optional width conversion (fabric width → slave width)
    val afterConv: Axi4 = if (sp.config.dataWidth != cfg.fabricDataWidth) {
      val fabricCfg = sp.config.copy(dataWidth = cfg.fabricDataWidth)
      val conv      = new Axi4LiteWidthConverter(sp.config, fabricCfg)
      // xbar drives wide side; narrow side goes to slave
      conv.io.wide <> xbar.io.slaves(si)
      conv.io.narrow
    } else xbar.io.slaves(si)

    // Step 2: optional register slice
    if (sp.regSlice) {
      val rs = new Axi4LiteRegSlice(sp.config)
      rs.io.upstream <> afterConv
      extPort <> rs.io.downstream
    } else {
      extPort <> afterConv
    }
  }
}

// ---------------------------------------------------------------------------
// AxiZeroMixedTop  —  top-level for full-AXI4 and mixed (Full + Lite) configs
//
// Routing rule
// ────────────
//   All-Lite  →  use AxiZeroLiteTop (resource-efficient, no ID logic).
//   Any Full  →  this class: Axi4Crossbar fabric + thin adapters at Lite ports.
//
// Internal ID widths
// ──────────────────
//   effectiveIdW  = max(idWidth of Full masters)   ← Lite masters drive id=0
//   slaveIdW      = effectiveIdW + masterIndexBits  ← {master_index,master_id}
//
// Full AXI4 slave ports must have idWidth == slaveIdW so the crossbar can
// echo back the routing ID.  The Python generator sets this automatically.
// ---------------------------------------------------------------------------
class AxiZeroMixedTop(cfg: AxiZeroConfig) extends Component {
  require(
    !cfg.isAllLite,
    "AxiZeroMixedTop requires at least one FullAxi4 port. Use AxiZeroLiteTop for all-Lite."
  )

  val io = new Bundle {
    val masters = Vec(cfg.masters.indices.map(i => slave(Axi4(cfg.masters(i).config))))
    val slaves  = Vec(cfg.slaves.indices.map(i => master(Axi4(cfg.slaves(i).config))))
  }

  // ── Normalised internal ID widths ─────────────────────────────────────────
  private val effectiveIdW: Int =
    // Axi3Mode and FullAxi4 master ports carry IDs; LiteAxi4 drives id=0.
    (cfg.masters.collect {
      case mp if mp.mode == FullAxi4 || mp.mode == Axi3Mode => mp.config.idWidth
    } :+ 1).max

  private val slaveIdW: Int = effectiveIdW + cfg.masterIndexBits

  // ── All-Full AXI4 internal configs for the crossbar ───────────────────────
  private def internalMasterCfg(mp: MasterPort): Axi4Config =
    // Axi3Mode ports use the same internal AXI4 config; the adapter handles
    // AXI3→AXI4 conversion before the signal reaches the crossbar.
    Axi4Config(mp.config.addressWidth, cfg.fabricDataWidth, effectiveIdW)

  private def internalSlaveCfg(sp: SlavePort): Axi4Config =
    Axi4Config(sp.config.addressWidth, cfg.fabricDataWidth, slaveIdW)

  private val xbarCfg = cfg.copy(
    masters = cfg.masters.map(mp => MasterPort(internalMasterCfg(mp), FullAxi4, regSlice = false)),
    slaves = cfg.slaves.map(sp =>
      SlavePort(internalSlaveCfg(sp), FullAxi4, sp.baseAddress, sp.size, regSlice = false)
    )
  )

  private val xbar = new Axi4Crossbar(xbarCfg)

  // ── Master-side wiring ────────────────────────────────────────────────────
  for (mi <- 0 until cfg.numMasters) {
    val mp      = cfg.masters(mi)
    val extPort = io.masters(mi)

    // Optional register slice on the external port side.
    // For Axi3Mode: Axi4RegSlice sits before the bridge (operates on the
    // AXI4 bundle; the protocol adapter is downstream and unaffected).
    val afterRS: Axi4 = if (mp.regSlice && mp.mode == LiteAxi4) {
      val rs = new Axi4LiteRegSlice(mp.config)
      rs.io.upstream <> extPort
      rs.io.downstream
    } else if (mp.regSlice) {
      val rs = new Axi4RegSlice(mp.config)
      rs.io.upstream <> extPort
      rs.io.downstream
    } else extPort

    // Lite → Full adapter, AXI3 → AXI4 adapter, or pass-through
    val afterAdapt: Axi4 = mp.mode match {
      case LiteAxi4 =>
        val adpt = new Axi4LiteToFullAdapter(mp.config, xbarCfg.masters(mi).config)
        adpt.io.lite <> afterRS
        adpt.io.full
      case Axi3Mode =>
        // Auto-insert AXI3→AXI4 bridge.  The external port (extPort) is an
        // Axi4 bundle whose fields are constrained to AXI3 limits (4-bit LEN
        // etc.) by the caller; the shim converts it to Axi3 then the adapter
        // converts back to full AXI4 for the crossbar fabric.
        val a3cfg = mp.axi3Cfg.get
        val bridge = new Axi3MasterBridgeFromAxi4(
          mp.config,
          a3cfg,
          xbarCfg.masters(mi).config,
          cfg.maxOutstanding
        )
        bridge.io.axi4in <> afterRS
        bridge.io.axi4out
      case _ => afterRS
    }

    // Data-width upsizing for narrow Full AXI4 master ports
    val afterWidthConv: Axi4 =
      if (
        mp.mode == FullAxi4 &&
        mp.config.dataWidth != cfg.fabricDataWidth
      ) {
        val conv = new Axi4WidthConverter(mp.config, xbarCfg.masters(mi).config, cfg.maxOutstanding)
        conv.io.input <> afterAdapt
        conv.io.output
      } else afterAdapt

    xbar.io.masters(mi) <> afterWidthConv
  }

  // ── Slave-side wiring ─────────────────────────────────────────────────────
  for (si <- 0 until cfg.numSlaves) {
    val sp       = cfg.slaves(si)
    val extPort  = io.slaves(si)
    val xbarPort = xbar.io.slaves(si) // Full AXI4 with slaveIdW-bit IDs

    // Full → Lite adapter if this slave port is AXI4-Lite
    val afterAdapt: Axi4 = if (sp.mode == LiteAxi4) {
      val adpt = new Axi4FullToLiteAdapter(xbarCfg.slaves(si).config, sp.config)
      adpt.io.full <> xbarPort
      adpt.io.lite
    } else xbarPort

    // Data-width downsizing for narrow Full AXI4 slave ports
    val afterWidthConv: Axi4 =
      if (
        sp.mode == FullAxi4 &&
        sp.config.dataWidth != cfg.fabricDataWidth
      ) {
        val conv = new Axi4WidthConverter(xbarCfg.slaves(si).config, sp.config, cfg.maxOutstanding)
        conv.io.input <> afterAdapt
        conv.io.output
      } else afterAdapt

    // Optional register slice between adapter/converter and external port
    if (sp.regSlice && sp.mode == LiteAxi4) {
      val rs = new Axi4LiteRegSlice(sp.config)
      rs.io.upstream <> afterWidthConv
      extPort <> rs.io.downstream
    } else if (sp.regSlice) {
      val rs = new Axi4RegSlice(sp.config)
      rs.io.upstream <> afterWidthConv
      extPort <> rs.io.downstream
    } else {
      extPort <> afterWidthConv
    }
  }
}

// ---------------------------------------------------------------------------
// AxiZeroFullTop  —  backward-compatible alias for all-Full AXI4 configs
//                    (delegates to AxiZeroMixedTop)
// ---------------------------------------------------------------------------
class AxiZeroFullTop(cfg: AxiZeroConfig) extends Component {
  val io = new Bundle {
    val masters = Vec(cfg.masters.indices.map(i => slave(Axi4(cfg.masters(i).config))))
    val slaves  = Vec(cfg.slaves.indices.map(i => master(Axi4(cfg.slaves(i).config))))
  }

  val inner = new AxiZeroMixedTop(cfg)

  for (mi <- 0 until cfg.numMasters) inner.io.masters(mi) <> io.masters(mi)
  for (si <- 0 until cfg.numSlaves) inner.io.slaves(si) <> io.slaves(si)
}
