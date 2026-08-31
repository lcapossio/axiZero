// Copyright (c) 2026 Leonardo Capossio — bard0 design  hello@bard0.com
// SPDX-License-Identifier: MIT
package vexzero

import spinal.core._
import spinal.lib._
import spinal.lib.bus.amba4.axi._
import vexriscv.ip.{DataCacheConfig, InstructionCacheConfig}
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
// A board whose only link to the host is a debug cable can add that host as a
// third master (`hostMaster`), which is how the DE25-Nano reports: the host
// reads the very registers the firmware wrote, arbitrated against the CPU by
// the crossbar under test. See [[JtagAxi]].
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
  /** How the crossbar picks between masters that want the same slave in the same cycle.
    *
    * Round-robin unless something in the system deserves to be ranked. With three masters sharing
    * one RAM, `QosBased` is the interesting one: it lets a latency-sensitive CPU outrank a bulk
    * transfer without starving it, because the crossbar boosts a waiting master's effective
    * priority until it reaches parity.
    */
  arbitration: ArbitrationPolicy = RoundRobin,
  /** AXQOS the CPU's two master ports present to the crossbar.
    *
    * The SoC declares this rather than the CPU driving it, because VexRiscv has no QoS output at
    * all: both of its buses are built with `useQos = false`, so without this they would arrive as
    * QoS 0 and could never be ranked above anything. Ignored unless `arbitration` reads AXQOS.
    */
  cpuQos: Int = 0,
  /** Boot image words. Empty means "assemble Firmware for this memory map". */
  bootImage: Seq[Long] = Nil,
  /** Base of the benchmark console, or None to leave it out of the crossbar.
    *
    * Set it to run a prebuilt VexRiscv regression binary (Dhrystone among them): the address is
    * theirs, not ours, so it has to match what their linker baked in. See [[VexZeroBenchIo]].
    */
  benchIoBase: Option[BigInt] = None,
  /** Add a third master port, brought out at the SoC boundary.
    *
    * Meant for a debug-cable bridge on boards with no UART. It is left at the SoC edge rather than
    * instantiated here so that a simulation can drive it directly and no vendor primitive has to
    * exist for the SoC to elaborate.
    */
  hostMaster: Boolean = false,
  /** Give the CPU caches, which changes the shape of its bus traffic completely.
    *
    * Uncached, every instruction and every load is one single-beat transaction, so the crossbar
    * sees a great many tiny requests and never a burst. Cached, a miss fetches a whole line as one
    * INCR burst and the two ports run far more independently, which is what a crossbar is actually
    * built for. The address map is unchanged: the peripheral region is marked as IO and stays
    * uncached, so the same firmware and the same benchmark binaries run either way.
    */
  cachedCpu: Boolean = false,
  /** Bytes of instruction cache, when `cachedCpu`. One way, 32-byte lines. */
  iCacheSize: Int = 4096,
  /** Bytes of data cache, when `cachedCpu`. One way, 32-byte lines.
    *
    * Worth setting smaller than the instruction cache when the point is to exercise the bus rather
    * than to go fast: Dhrystone's data working set fits in 4 KiB with room to spare, so a data
    * cache that size misses 63 times in a whole run and the load/store port effectively stops using
    * the crossbar. A smaller one keeps it busy with real line refills.
    */
  dCacheSize: Int = 4096,
  /** Depth of the benchmark console buffer the host drains over the bus.
    *
    * 0 keeps the console a stream for a UART. Anything else is for a board with no serial port; see
    * [[VexZeroBenchIo]].
    */
  benchHostDrain: Int = 0
) {
  require(ramSize >= (8 KiB), "the boot firmware keeps its data at RAM + 0x1000")
  require(cpuQos >= 0 && cpuQos <= 15, s"cpuQos must fit AXQOS's four bits, not $cpuQos")
  val ramWords: Int = (ramSize / 4).toInt
}

class VexZeroSoc(cfg: VexZeroSocConfig = VexZeroSocConfig()) extends Component {

  val io = new Bundle {
    val leds     = out Bits (cfg.ledWidth bits)
    val switches = in Bits (cfg.switchWidth bits)
    val charOut  = master Flow (Bits(8 bits))
    val status   = out Bits (32 bits)
    val result   = out Bits (32 bits)

    /** The third master port, present only with `hostMaster`. */
    val host = cfg.hostMaster generate slave(Axi4(VexZeroSoc.masterCfg))

    /** Present only with a benchmark console configured. */
    val bench = cfg.benchIoBase.isDefined generate new Bundle {

      /** Absent when the host drains the console over the bus instead. */
      val charOut  = (cfg.benchHostDrain == 0) generate master(Stream(Bits(8 bits)))
      val done     = out Bool ()
      val exitCode = out Bits (32 bits)
    }
  }

  // ── Bus configurations ───────────────────────────────────────────────────
  // No master port carries a meaningful ID (both CPU ports and the optional
  // host bridge drive a constant), so AxiZeroMixedTop's effective master ID
  // width is 1 and the slave side widens by the master index: 2 masters give
  // slaveIdW 2, and 3 masters give 3.
  private val masterCount = if (cfg.hostMaster) 3 else 2
  private val masterCfg   = VexZeroSoc.masterCfg
  private val fullSlaveCfg =
    Axi4Config(addressWidth = 32, dataWidth = 32, idWidth = masterCfg.idWidth + log2Up(masterCount))
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
    ) ++ Option.when(cfg.hostMaster)(
      MasterPort(masterCfg, FullAxi4, regSlice = true) // M2 — debug cable
    ),
    slaves = Seq(
      SlavePort(fullSlaveCfg, FullAxi4, cfg.ramBase, cfg.ramSize),
      SlavePort(liteSlaveCfg, LiteAxi4, cfg.gpioBase, cfg.peripheralSize),
      SlavePort(liteSlaveCfg, LiteAxi4, cfg.sysCtrlBase, cfg.peripheralSize)
    ) ++ cfg.benchIoBase.map(
      SlavePort(liteSlaveCfg, LiteAxi4, _, VexZeroBenchIo.windowSize)
    ),
    arbitration = cfg.arbitration,
    maxOutstanding = cfg.maxOutstanding
  )

  // ── CPU ──────────────────────────────────────────────────────────────────
  val cpuConfig =
    if (cfg.cachedCpu)
      VexZeroSoc.cachedCpuConfig(cfg.ramBase, cfg.iCacheSize, cfg.dCacheSize)
    else VexZeroSoc.cpuConfig(cfg.ramBase)
  val cpu = new VexRiscv(cpuConfig)

  private var iBus: Axi4ReadOnly = null
  private var dBus: Axi4Shared   = null
  for (p <- cpuConfig.plugins) p match {
    case p: IBusSimplePlugin => iBus = p.iBus.toAxi4ReadOnly()
    case p: DBusSimplePlugin => dBus = p.dBus.toAxi4Shared()
    case p: IBusCachedPlugin => iBus = p.iBus.toAxi4ReadOnly()
    // stageCmd: the cache's command path is registered before it reaches AXI, which keeps the
    // combinational ring described above from re-forming through the cache's own hazard logic.
    case p: DBusCachedPlugin => dBus = p.dBus.toAxi4Shared(true)
    case _                   =>
  }

  // ── Interconnect ─────────────────────────────────────────────────────────
  val fabric = new AxiZeroMixedTop(interconnectConfig)

  // M0: read-only. `<<` wires AR/R; the write channels are tied off here so the
  // crossbar port is fully driven.
  private val iPort = fabric.io.masters(0)
  iPort << iBus
  // `<<` has already driven QoS to zero -- driveWeak assigns every field the
  // source lacks, and VexRiscv's bus lacks this one -- so replacing it has to
  // be declared rather than merely written second.
  iPort.ar.qos.allowOverride := B(cfg.cpuQos, 4 bits)
  iPort.aw.valid             := False
  iPort.aw.payload.clearAll()
  iPort.w.valid := False
  iPort.w.payload.clearAll()
  iPort.b.ready := False

  // M1: the shared AR/AW command channel is split back into AXI4 AR + AW.
  private val dPort = fabric.io.masters(1)
  dPort << dBus.toAxi4()
  dPort.ar.qos.allowOverride := B(cfg.cpuQos, 4 bits)
  dPort.aw.qos.allowOverride := B(cfg.cpuQos, 4 bits)

  // M2: the host, if this board has one. It arrives already an Axi4, so the
  // crossbar sees it exactly as it sees the CPU ports -- including its AXQOS,
  // which is the host's own business and is not overridden here.
  if (cfg.hostMaster) fabric.io.masters(2) << io.host

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

  // ── S3 — benchmark console, only when one is configured ──────────────────
  val benchIo = cfg.benchIoBase.map { _ =>
    val peripheral = new VexZeroBenchIo(liteSlaveCfg, hostDrainDepth = cfg.benchHostDrain)
    peripheral.io.axi <> fabric.io.slaves(3)
    if (cfg.benchHostDrain == 0) io.bench.charOut << peripheral.io.charOut
    io.bench.done     := peripheral.io.done
    io.bench.exitCode := peripheral.io.exitCode
    peripheral
  }
}

object VexZeroSoc {

  /** The shape of every master port on this SoC.
    *
    * One ID bit, driven to a constant by all three masters; see the ordering note above.
    */
  val masterCfg: Axi4Config = Axi4Config(addressWidth = 32, dataWidth = 32, idWidth = 1)

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

  /** The same CPU with an instruction and a data cache in front of the bus.
    *
    * This is not here to make the example faster — it is here so the example asks the crossbar for
    * something a crossbar is built to answer. Uncached, VexRiscv issues one single-beat transaction
    * per instruction and never has more than one read in flight, so a run says nothing about burst
    * handling, response routing or arbitration under load. Cached:
    *
    *   - a miss fetches a whole 32-byte line as one 8-beat INCR read burst;
    *   - dirty lines leave as 8-beat write bursts, and `DataCache.toAxi4Shared` allows seven writes
    *     outstanding rather than one;
    *   - the two ports decouple, because neither one stalls the pipeline on every access any more.
    *
    * The address map does not change. `StaticMemoryTranslatorPlugin` marks everything at 0xF???????
    * as IO, so the GPIO, system-control and benchmark-console accesses bypass the cache and reach
    * their slaves as ordinary single beats — the same firmware and the same prebuilt benchmark
    * binaries run unmodified either way.
    *
    * Exception catching is off throughout, which is what keeps `CsrPlugin` out of the list: the
    * example has no trap handler to run, and a faulting access would be a test failure anyway.
    *
    * The bus stays 32 bits wide. A wider memory side would put the crossbar's width converters
    * under real CPU traffic, but VexRiscv cannot drive one: `DataCache.toAxi4Shared` builds the bus
    * at `memDataWidth` and then drives WDATA from a `cpuDataWidth` stage, so anything other than 32
    * fails to elaborate.
    */
  def cachedCpuConfig(
    resetVector: BigInt,
    iCacheSize: Int = 4096,
    dCacheSize: Int = 4096
  ): VexRiscvConfig = VexRiscvConfig(
    plugins = List(
      new IBusCachedPlugin(
        resetVector = resetVector.toLong,
        prediction = NONE,
        compressedGen = false,
        config = InstructionCacheConfig(
          cacheSize = iCacheSize,
          bytePerLine = 32,
          wayCount = 1,
          addressWidth = 32,
          cpuDataWidth = 32,
          memDataWidth = 32,
          catchIllegalAccess = false,
          catchAccessFault = false,
          asyncTagMemory = false,
          twoCycleRam = false,
          twoCycleCache = true
        )
      ),
      new DBusCachedPlugin(
        config = DataCacheConfig(
          cacheSize = dCacheSize,
          bytePerLine = 32,
          wayCount = 1,
          addressWidth = 32,
          cpuDataWidth = 32,
          memDataWidth = 32,
          catchAccessError = false,
          catchIllegal = false,
          catchUnaligned = false
        )
      ),
      // Everything in the peripheral window is IO, so it is never cached. The window is the top
      // nibble rather than the three individual slaves because that is what the address map
      // already reserves, and a cached peripheral write is a silent failure rather than a loud one.
      new StaticMemoryTranslatorPlugin(ioRange = _(31 downto 28) === 0xf),
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
