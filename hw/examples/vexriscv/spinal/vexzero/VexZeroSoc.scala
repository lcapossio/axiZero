// Copyright (c) 2026 Leonardo Capossio — bard0 design  hello@bard0.com
// SPDX-License-Identifier: MIT
package vexzero

import spinal.core._
import spinal.lib._
import spinal.lib.bus.amba4.axi._
import vexriscv.plugin._
import vexriscv.{plugin, VexRiscv, VexRiscvConfig}
import axizero._

// ---------------------------------------------------------------------------
// VexZeroSoc  —  a minimal RISC-V system built around the axiZero interconnect
//
// The point of this example is the interconnect, not the CPU: it shows a real
// bus master (VexRiscv, also written in SpinalHDL) driving an axiZero crossbar
// with a mixed full-AXI4 / AXI4-Lite address map, and it runs end to end in
// SpinalSim without a RISC-V cross compiler.
//
//   VexRiscv IBus (Axi4ReadOnly) ─┐                    ┌─ S0  on-chip RAM   (AXI4 full)
//                                 ├─ AxiZeroMixedTop ──┼─ S1  GPIO          (AXI4-Lite)
//   VexRiscv DBus (Axi4Shared)  ──┘   2 masters × 3     └─ S2  system ctrl   (AXI4-Lite)
//
// Response ordering
// ─────────────────
// maxOutstanding > 1 selects the pipelined crossbar, which routes B/R by ID.
// Both CPU ports drive a constant ID, so ordering only has to hold per master:
//   • IBus fetches never leave the RAM region, so every outstanding read is to
//     one slave, and a single slave returns same-ID reads in order.
//   • DBusSimplePlugin keeps at most one read in flight and blocks reads while
//     any write is outstanding, so its responses cannot overtake each other.
// ---------------------------------------------------------------------------

case class VexZeroSocConfig(
  /** On-chip RAM base. Must be 4 KiB aligned — the firmware addresses it with a bare `lui`. */
  ramBase: BigInt = BigInt("80000000", 16),
  ramSize: BigInt = 8 KiB,
  gpioBase: BigInt = BigInt("F0000000", 16),
  sysCtrlBase: BigInt = BigInt("F0010000", 16),
  peripheralSize: BigInt = 4 KiB,
  ledWidth: Int = 8,
  switchWidth: Int = 8,
  /** > 1 selects the pipelined crossbar path; see the ordering note above. */
  maxOutstanding: Int = 4,
  /** Boot image words. Empty means "assemble Firmware for this memory map". */
  bootImage: Seq[Long] = Nil
) {
  require(ramSize >= (8 KiB), "the boot firmware keeps its data at RAM + 0x1000")
  val ramWords: Int = (ramSize / 4).toInt
}

class VexZeroSoc(cfg: VexZeroSocConfig = VexZeroSocConfig()) extends Component {

  val io = new Bundle {
    val leds     = out Bits (cfg.ledWidth bits)
    val switches = in Bits (cfg.switchWidth bits)
    val charOut  = master Flow (Bits(8 bits))
    val status   = out Bits (32 bits)
    val result   = out Bits (32 bits)
  }

  // ── Bus configurations ───────────────────────────────────────────────────
  // 2 masters → masterIndexBits = 1, and neither CPU port carries an ID, so
  // AxiZeroMixedTop's effective master ID width is 1 and slaveIdW = 2.
  private val masterCfg    = Axi4Config(addressWidth = 32, dataWidth = 32, idWidth = 1)
  private val fullSlaveCfg = Axi4Config(addressWidth = 32, dataWidth = 32, idWidth = 2)
  private val liteSlaveCfg = Axi4Config(
    addressWidth = 32,
    dataWidth = 32,
    useId = false,
    useRegion = false,
    useBurst = false,
    useLock = false,
    useCache = false,
    useSize = false,
    useQos = false,
    useLen = false,
    useLast = false,
    useResp = true,
    useProt = true,
    useStrb = true
  )

  val interconnectConfig = AxiZeroConfig(
    // regSlice is not optional here. VexRiscv couples its two bus ports
    // combinationally — a stalled DBus store stalls the pipeline, which pulls
    // IBusSimplePlugin's cmd.valid low — and Axi4SharedOnChipRam's AR/AW
    // arbiter derives AWREADY from ARVALID. Together those close a ready →
    // valid → ready ring through the fabric. The slices register every
    // master → fabric valid, so nothing in the fabric depends on a CPU valid
    // in the same cycle. They are what you would want for timing closure on
    // real silicon anyway.
    masters = Seq(
      MasterPort(masterCfg, FullAxi4, regSlice = true), // M0 — instruction fetch
      MasterPort(masterCfg, FullAxi4, regSlice = true)  // M1 — load / store
    ),
    slaves = Seq(
      SlavePort(fullSlaveCfg, FullAxi4, cfg.ramBase, cfg.ramSize),
      SlavePort(liteSlaveCfg, LiteAxi4, cfg.gpioBase, cfg.peripheralSize),
      SlavePort(liteSlaveCfg, LiteAxi4, cfg.sysCtrlBase, cfg.peripheralSize)
    ),
    arbitration = RoundRobin,
    maxOutstanding = cfg.maxOutstanding
  )

  // ── CPU ──────────────────────────────────────────────────────────────────
  val cpuConfig = VexZeroSoc.cpuConfig(cfg.ramBase)
  val cpu       = new VexRiscv(cpuConfig)

  private var iBus: Axi4ReadOnly = null
  private var dBus: Axi4Shared   = null
  for (p <- cpuConfig.plugins) p match {
    case p: IBusSimplePlugin => iBus = p.iBus.toAxi4ReadOnly()
    case p: DBusSimplePlugin => dBus = p.dBus.toAxi4Shared()
    case _                   =>
  }

  // ── Interconnect ─────────────────────────────────────────────────────────
  val fabric = new AxiZeroMixedTop(interconnectConfig)

  // M0: read-only. `<<` wires AR/R; the write channels are tied off here so the
  // crossbar port is fully driven.
  private val iPort = fabric.io.masters(0)
  iPort << iBus
  iPort.aw.valid := False
  iPort.aw.payload.clearAll()
  iPort.w.valid := False
  iPort.w.payload.clearAll()
  iPort.b.ready := False

  // M1: the shared AR/AW command channel is split back into AXI4 AR + AW.
  fabric.io.masters(1) << dBus.toAxi4()

  // ── S0 — on-chip RAM, preloaded with the boot image ──────────────────────
  val ram = Axi4SharedOnChipRam(
    dataWidth = 32,
    byteCount = cfg.ramSize,
    idWidth = fullSlaveCfg.idWidth
  )

  private val image =
    if (cfg.bootImage.nonEmpty) cfg.bootImage
    else Firmware.image(cfg.ramBase, cfg.gpioBase, cfg.sysCtrlBase)
  require(
    image.length <= cfg.ramWords,
    s"boot image (${image.length} words) does not fit in ${cfg.ramWords} words of RAM"
  )
  ram.ram.init(
    (image ++ Seq.fill(cfg.ramWords - image.length)(0L)).map(w => B(w, 32 bits))
  )

  ram.io.axi << fabric.io.slaves(0).toShared()

  // ── S1 — GPIO ────────────────────────────────────────────────────────────
  val gpio = new VexZeroGpio(liteSlaveCfg, cfg.ledWidth, cfg.switchWidth)
  gpio.io.axi <> fabric.io.slaves(1)
  gpio.io.switches := io.switches
  io.leds          := gpio.io.leds

  // ── S2 — system control ──────────────────────────────────────────────────
  val sysCtrl = new VexZeroSysCtrl(liteSlaveCfg)
  sysCtrl.io.axi <> fabric.io.slaves(2)
  io.charOut <> sysCtrl.io.charOut
  io.status := sysCtrl.io.status
  io.result := sysCtrl.io.result
}

object VexZeroSoc {

  /** The smallest VexRiscv that can run the example firmware and speak AXI4.
    *
    * `cmdForkPersistence` is required by `IBusSimplePlugin.toAxi4ReadOnly()`: AXI4 has no way to
    * retract an address once ARVALID is asserted.
    */
  def cpuConfig(resetVector: BigInt): VexRiscvConfig = VexRiscvConfig(
    plugins = List(
      new IBusSimplePlugin(
        resetVector = resetVector.toLong,
        cmdForkOnSecondStage = false,
        cmdForkPersistence = true,
        prediction = NONE,
        catchAccessFault = false,
        compressedGen = false
      ),
      new DBusSimplePlugin(
        catchAddressMisaligned = false,
        catchAccessFault = false,
        earlyInjection = false
      ),
      new DecoderSimplePlugin(catchIllegalInstruction = false),
      new RegFilePlugin(
        regFileReadyKind = plugin.SYNC,
        zeroBoot = true,
        writeRfInMemoryStage = false
      ),
      new IntAluPlugin,
      new SrcPlugin(separatedAddSub = false, executeInsertion = false),
      new LightShifterPlugin,
      new HazardSimplePlugin(
        bypassExecute = true,
        bypassMemory = true,
        bypassWriteBack = true,
        bypassWriteBackBuffer = true,
        pessimisticUseSrc = false,
        pessimisticWriteRegFile = false,
        pessimisticAddressMatch = false
      ),
      new BranchPlugin(earlyBranch = false, catchAddressMisaligned = false)
    )
  )
}
