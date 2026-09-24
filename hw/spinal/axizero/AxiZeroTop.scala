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
      val rs = new Axi4LiteRegSlice(mp.config, mp.regSliceSkid)
      rs.io.upstream <> extPort
      rs.io.downstream
    } else extPort

    // Step 2: width conversion to the fabric's width, in either direction --
    // internalDataWidth can make the fabric narrower than a master
    val afterConv: Axi4 = Axi4LiteWidth.adapt(afterRS, cfg.fabricDataWidth)

    // Step 3: connect to crossbar (normCfg port)
    link(afterConv, xbar.io.masters(mi))
  }

  // ── Slave-side wiring ────────────────────────────────────────────────────
  for (si <- 0 until cfg.numSlaves) {
    val sp      = cfg.slaves(si)
    val extPort = io.slaves(si) // external (user-facing)

    // Step 1: width conversion (fabric width → slave width), in either direction
    val afterConv: Axi4 = Axi4LiteWidth.adapt(xbar.io.slaves(si), sp.config.dataWidth)

    // Step 2: optional register slice
    if (sp.regSlice) {
      val rs = new Axi4LiteRegSlice(sp.config, sp.regSliceSkid)
      link(afterConv, rs.io.upstream)
      extPort <> rs.io.downstream
    } else {
      link(afterConv, extPort)
    }
  }

  /** Joins two Lite ports of the same data width whose configs may otherwise differ.
    *
    * The crossbar runs every port at its own normalised config -- the widest address of any port,
    * with PROT, strobe and response all present -- so a port can be narrower in address or lack an
    * optional signal, and `<>` refuses both. The address is resized (the decoder has already picked
    * the slave, so the bits a slave does not have are the ones that chose it), and a signal only
    * one side has is given what its absence means: PROT unprivileged/non-secure/data, every byte
    * strobed, the response OKAY.
    */
  private def link(up: Axi4, down: Axi4): Unit = {
    val u = up.config
    val d = down.config
    require(u.dataWidth == d.dataWidth, "link joins ports of one data width")

    def ax(from: Stream[_ <: Axi4Ax], to: Stream[_ <: Axi4Ax]): Unit = {
      to.valid               := from.valid
      from.ready             := to.ready
      to.addr                := from.addr.resized
      if (d.useProt) to.prot := (if (u.useProt) from.prot else B"010")
    }
    // Channel by channel in AW, W, B, AR, R order, which is the order `<>`
    // emits them in -- so a design whose ports all match gets the same
    // netlist it always did.
    ax(up.aw, down.aw)

    down.w.valid := up.w.valid
    up.w.ready   := down.w.ready
    down.w.data  := up.w.data
    if (d.useStrb)
      down.w.strb := (if (u.useStrb) up.w.strb else B(d.bytePerWord bits, default -> True))

    up.b.valid               := down.b.valid
    down.b.ready             := up.b.ready
    if (u.useResp) up.b.resp := (if (d.useResp) down.b.resp else B"00")

    ax(up.ar, down.ar)

    up.r.valid               := down.r.valid
    down.r.ready             := up.r.ready
    up.r.data                := down.r.data
    if (u.useResp) up.r.resp := (if (d.useResp) down.r.resp else B"00")
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

  val io = new Bundle {
    val masters = Vec(cfg.masters.indices.map(i => slave(Axi4(cfg.masters(i).config))))
    val slaves  = Vec(cfg.slaves.indices.map(i => master(Axi4(cfg.slaves(i).config))))

    /** The crossbar's own master ports, read-only, when `observeMasters` is on. See
      * [[Axi4MasterObs]]: this is the boundary where READY means admitted, which the external ports
      * cannot show once a register slice is in the way.
      */
    val obs = cfg.observeMasters generate
      Vec(cfg.masters.indices.map(i => out(Axi4MasterObs(internalMasterCfg(cfg.masters(i))))))
  }

  private val xbarCfg = cfg.copy(
    masters = cfg.masters.map(mp => MasterPort(internalMasterCfg(mp), FullAxi4, regSlice = false)),
    slaves = cfg.slaves.map(sp =>
      SlavePort(internalSlaveCfg(sp), FullAxi4, sp.baseAddress, sp.size, regSlice = false)
    )
  )

  // Not private, and deliberately so: a testbench that wants to know whether
  // the arbiter actually had a choice to make has to look at the ports the
  // arbiter sees, not at the external ones. Anything between them -- register
  // slices, protocol bridges, width converters -- holds requests of its own,
  // so measuring contention outside them measures the wrong thing. This
  // matches AxiZeroLiteTop, whose xbar has always been visible.
  val xbar = new Axi4Crossbar(xbarCfg)

  // ── Master-side wiring ────────────────────────────────────────────────────
  for (mi <- 0 until cfg.numMasters) {
    val mp      = cfg.masters(mi)
    val extPort = io.masters(mi)

    // Optional register slice on the external port side.
    // For Axi3Mode: Axi4RegSlice sits before the bridge (operates on the
    // AXI4 bundle; the protocol adapter is downstream and unaffected).
    val afterRS: Axi4 = if (mp.regSlice && mp.mode == LiteAxi4) {
      val rs = new Axi4LiteRegSlice(mp.config, mp.regSliceSkid)
      rs.io.upstream <> extPort
      rs.io.downstream
    } else if (mp.regSlice) {
      val rs = new Axi4RegSlice(mp.config, mp.regSliceSkid)
      rs.io.upstream <> extPort
      rs.io.downstream
    } else extPort

    // Lite → Full adapter, AXI3 → AXI4 adapter, or pass-through
    val afterAdapt: Axi4 = mp.mode match {
      case LiteAxi4 =>
        // Bring the Lite port to the fabric's width first, so its data sits on
        // the lanes its address selects; the adapter then only adds the
        // burst fields.
        val atFabric = Axi4LiteWidth.adapt(afterRS, cfg.fabricDataWidth)
        val adpt = new Axi4LiteToFullAdapter(
          atFabric.config,
          xbarCfg.masters(mi).config,
          transferBytes = Some(scala.math.min(mp.config.dataWidth, cfg.fabricDataWidth) / 8)
        )
        adpt.io.lite <> atFabric
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

    // A master may declare fewer IDs than the widest master in the design;
    // the fabric carries the widest, so pad this port's IDs out to it.
    val afterIdWiden: Axi4 =
      if (afterWidthConv.config.idWidth != xbarCfg.masters(mi).config.idWidth) {
        val widen = new Axi4IdWidener(afterWidthConv.config, xbarCfg.masters(mi).config)
        widen.io.input <> afterWidthConv
        widen.io.output
      } else afterWidthConv

    xbar.io.masters(mi) <> afterIdWiden

    // What the crossbar sees, for anyone watching from outside. Reads only.
    if (cfg.observeMasters) io.obs(mi).watch(xbar.io.masters(mi))
  }

  // ── Slave-side wiring ─────────────────────────────────────────────────────
  for (si <- 0 until cfg.numSlaves) {
    val sp       = cfg.slaves(si)
    val extPort  = io.slaves(si)
    val xbarPort = xbar.io.slaves(si) // Full AXI4 with slaveIdW-bit IDs

    // Full → Lite adapter if this slave port is AXI4-Lite, at the fabric's
    // width, then narrowed or widened to the slave's own.
    val afterAdapt: Axi4 = if (sp.mode == LiteAxi4) {
      val adpt = new Axi4FullToLiteAdapter(
        xbarCfg.slaves(si).config,
        sp.config.copy(dataWidth = cfg.fabricDataWidth)
      )
      adpt.io.full <> xbarPort
      Axi4LiteWidth.adapt(adpt.io.lite, sp.config.dataWidth)
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
      val rs = new Axi4LiteRegSlice(sp.config, sp.regSliceSkid)
      rs.io.upstream <> afterWidthConv
      extPort <> rs.io.downstream
    } else if (sp.regSlice) {
      val rs = new Axi4RegSlice(sp.config, sp.regSliceSkid)
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
