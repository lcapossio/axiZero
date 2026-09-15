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
import axizero.adapters.{Axi3Config, Axi3ToAxi4Adapter, Axi4ToAxi3}
import axizero.stream.AxiStreamArtySmoke
import axizero.verif._

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
// `videoBase` adds a fourth: a video test pattern generator that writes frames
// into the same RAM the CPU runs from, and the AXI4-Lite slave that programs
// it. It is the only master here that produces write bursts -- VexRiscv cannot
// -- and it is a third-party Verilog core rather than something written for
// this example. See [[VtpgZero]].
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
  /** Insert a register slice between the fabric and every slave.
    *
    * The master side always has one (see `interconnectConfig`); the slave side does not, so without
    * this the arbiter's grant reaches the RAM's address port through the address mux in the same
    * cycle. On the loaded Arty builds that is the critical path once the protocol checkers are off
    * it: master register slice, address decode, arbiter, mux, BRAM address -- eleven levels of
    * logic and, because the endpoints sit far apart, four fifths of the delay in routing.
    *
    * It costs a cycle of latency to every slave access and one payload register per port, which is
    * why it is off by default: the unloaded designs close comfortably without it and would only be
    * paying. The loaded ones need it.
    */
  slaveRegSlices: Boolean = false,
  /** Make the master-side register slices full pipes, so the READY the CPU and the generators see
    * is registered rather than combinational back through the arbiter. On the loaded builds the
    * critical path is the arbiter's grant reaching the CPU's pipeline in one cycle; this is what
    * cuts it. Costs registers, not cycles.
    */
  masterRegSliceSkid: Boolean = false,
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
  /** Base of the video generator's control window, or None to leave the video path out entirely.
    *
    * Setting this adds two ports at once: a write-only AXI4 master that fills a framebuffer in RAM,
    * and the AXI4-Lite slave that programs it. See [[VtpgZero]] for why a video core is the only
    * master here that produces write bursts.
    */
  videoBase: Option[BigInt] = None,
  /** Frame geometry, burst length and AXQOS of the video path. Ignored unless `videoBase` is set.
    */
  videoConfig: VtpgZeroConfig = VtpgZeroConfig(),
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
  benchHostDrain: Int = 0,
  /** Watch every fabric port with a passive AXI4 protocol checker.
    *
    * Off by default because it is real logic on the die and a design that is not being validated
    * should not carry it. On, it judges the interconnect against the protocol continuously, in
    * simulation and on the board alike, rather than only against the handful of values the firmware
    * happens to compute. See [[Axi4ProtocolChecker]].
    */
  protocolCheck: Boolean = false,
  /** Which rules the checkers enforce, and how much tracking state they carry. Ignored unless
    * `protocolCheck` is set.
    */
  protocolCheckerConfig: Axi4ProtocolCheckerConfig = Axi4ProtocolCheckerConfig(),
  /** Saturating self-checking traffic generators, one master port each.
    *
    * These are what put the crossbar under load. VexRiscv on its own cannot: it keeps one or two
    * reads in flight and, being write-through, never produces a write burst at all, so arbitration,
    * the per-slave W route and response routing barely get exercised. A generator keeps several
    * bursts in flight and reads back everything it wrote, so a mis-route fails on the board rather
    * than only in simulation. See [[AxiSatGen]].
    *
    * Each generator owns its window exclusively -- it predicts what every word in it holds -- so
    * the windows must not overlap each other, the firmware's region, or a framebuffer.
    */
  trafficGens: Seq[AxiSatGenConfig] = Nil,
  /** Route the CPU's load/store port through AXI3 on its way to the crossbar.
    *
    * The port is narrowed to an AXI3 bus and brought back by [[Axi3ToAxi4Adapter]], so the adapter
    * carries every load, store and cache refill the program makes. A working boot is then evidence
    * about the adapter and not only about the fabric, which is what the retired MicroBlaze AXI3
    * suite was for -- except that this one builds for both vendors.
    */
  axi3DataPath: Boolean = false,
  /** Include the AXI4-Stream smoke test as an island beside the bus.
    *
    * It shares nothing with the crossbar but the clock: three sources through arbitration,
    * buffering, register slicing, width conversion, demux and broadcast, checking themselves. It
    * rides along because it needs no CPU and no bus, and a board build has room for it. See
    * [[AxiStreamArtySmoke]].
    */
  axisSmoke: Boolean = false
) {
  require(ramSize >= (8 KiB), "the boot firmware keeps its data at RAM + 0x1000")
  require(cpuQos >= 0 && cpuQos <= 15, s"cpuQos must fit AXQOS's four bits, not $cpuQos")
  val ramWords: Int = (ramSize / 4).toInt

  // A generator that shares a word with anything else reports a data error the
  // moment the other writer touches it, and the failure would look like the
  // crossbar losing a beat. Catch the overlap at elaboration instead.
  private val firmwareTop = ramBase + 0x2000
  for ((g, i) <- trafficGens.zipWithIndex) {
    require(
      g.baseAddr >= firmwareTop && g.baseAddr + g.windowBytes <= ramBase + ramSize,
      f"traffic generator $i covers 0x${g.baseAddr}%x..0x${g.baseAddr + g.windowBytes}%x, which " +
        f"is not inside the RAM above the firmware " +
        f"(0x$firmwareTop%x..0x${ramBase + ramSize}%x)"
    )
    for (j <- 0 until i) {
      val other = trafficGens(j)
      require(
        g.baseAddr + g.windowBytes <= other.baseAddr ||
          other.baseAddr + other.windowBytes <= g.baseAddr,
        f"traffic generators $j and $i overlap at 0x${g.baseAddr}%x; each one owns its window"
      )
    }
  }
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

    /** High once any fabric port has been seen breaking AXI4. Only with `protocolCheck`. */
    val busViolation = cfg.protocolCheck generate out(Bool())

    /** Every traffic generator has read back what it wrote, has completed at least one lap, and has
      * not stopped making progress.
      *
      * The lap term is what makes a green result mean something: a generator that never got onto
      * the bus also never miscompares, and would otherwise report success by doing nothing. The
      * stall term does the same for one that got going and then hung: its errors stay zero and its
      * lap count stays non-zero for ever, so without it a deadlocked fabric reads as a pass.
      */
    val genOk = cfg.trafficGens.nonEmpty generate out(Bool())

    /** One bit per generator that has miscompared, seen a bad response or stalled, so a failure
      * names the window it happened in rather than the whole fabric.
      */
    val genFault = cfg.trafficGens.nonEmpty generate out(Bits(cfg.trafficGens.size bits))

    /** The AXI4-Stream island passed every one of its checks. Only with `axisSmoke`. */
    val axisOk = cfg.axisSmoke generate out(Bool())

    /** The stream island's raw sticky status word, for a board that can show it. */
    val axisStatus = cfg.axisSmoke generate out(Bits(32 bits))

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
  private val hasVideo = cfg.videoBase.isDefined
  private val genCount = cfg.trafficGens.size
  private val masterCount =
    2 + (if (cfg.hostMaster) 1 else 0) + (if (hasVideo) 1 else 0) + genCount

  // Masters are added in a fixed order so an index never moves under a config
  // that leaves one of them out: fetch, load/store, the host, video, then the
  // traffic generators.
  private val hostIndex  = Option.when(cfg.hostMaster)(2)
  private val videoIndex = Option.when(hasVideo)(2 + (if (cfg.hostMaster) 1 else 0))
  private val genIndex0  = 2 + (if (cfg.hostMaster) 1 else 0) + (if (hasVideo) 1 else 0)
  private val masterCfg  = VexZeroSoc.masterCfg
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
      MasterPort(
        masterCfg,
        FullAxi4,
        regSlice = true,
        regSliceSkid = cfg.masterRegSliceSkid
      ), // M0 — instruction fetch
      MasterPort(
        masterCfg,
        FullAxi4,
        regSlice = true,
        regSliceSkid = cfg.masterRegSliceSkid
      ) // M1 — load / store
    ) ++ Option.when(cfg.hostMaster)(
      MasterPort(
        masterCfg,
        FullAxi4,
        regSlice = true,
        regSliceSkid = cfg.masterRegSliceSkid
      ) // M2 — debug cable
    ) ++ Option.when(hasVideo)(
      MasterPort(
        masterCfg,
        FullAxi4,
        regSlice = true,
        regSliceSkid = cfg.masterRegSliceSkid
      ) // M3 — video writer
    ) ++ Seq.fill(genCount)(
      MasterPort(
        masterCfg,
        FullAxi4,
        regSlice = true,
        regSliceSkid = cfg.masterRegSliceSkid
      ) // traffic generators
    ),
    slaves = Seq(
      SlavePort(fullSlaveCfg, FullAxi4, cfg.ramBase, cfg.ramSize, cfg.slaveRegSlices),
      SlavePort(liteSlaveCfg, LiteAxi4, cfg.gpioBase, cfg.peripheralSize, cfg.slaveRegSlices),
      SlavePort(liteSlaveCfg, LiteAxi4, cfg.sysCtrlBase, cfg.peripheralSize, cfg.slaveRegSlices)
    ) ++ cfg.benchIoBase.map(
      SlavePort(liteSlaveCfg, LiteAxi4, _, VexZeroBenchIo.windowSize, cfg.slaveRegSlices)
    ) ++ cfg.videoBase.map(
      SlavePort(liteSlaveCfg, LiteAxi4, _, VtpgZero.windowSize, cfg.slaveRegSlices)
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
  //
  // With `axi3DataPath` it takes a detour on the way: the port is narrowed to
  // AXI3 and brought back by Axi3ToAxi4Adapter, so every load, store and cache
  // refill the program makes crosses the adapter. That is a harder test of it
  // than a traffic generator is, because the CPU stalls on the answer -- a lost
  // or mis-ordered response hangs the boot rather than being counted.
  private val dPort = fabric.io.masters(1)
  private val dAxi4 = dBus.toAxi4()
  if (cfg.axi3DataPath) {
    val axi3 = Axi4ToAxi3(dAxi4, VexZeroSoc.axi3Cfg)
    val adapter =
      new Axi3ToAxi4Adapter(VexZeroSoc.axi3Cfg, masterCfg, maxOutstanding = cfg.maxOutstanding)
    adapter.io.axi3 <> axi3
    dPort << adapter.io.axi4
  } else {
    dPort << dAxi4
  }
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

  private val ramBus = fabric.io.slaves(0).toShared()
  ram.io.axi << ramBus

  // Axi4SharedOnChipRam commits a byte lane whenever its write strobe is set
  // and its internal stage0 fires; nothing in that condition is qualified by
  // reset. The valid that drives stage0 comes from the unburstify buffer,
  // which is a synchronously reset register -- so on the very first clock edge
  // it still holds its power-up value, and a design that comes up with that
  // bit set writes one beat of whatever the address, data and strobe lines
  // happen to carry straight into the RAM. That corrupts the boot image before
  // the CPU has fetched an instruction, and the same window reopens on any
  // warm reset asserted mid-write.
  //
  // Masking the strobes while reset is asserted closes it. isResetActive is
  // combinational from the reset input, so unlike a guard register it is
  // already correct on that first edge.
  ram.io.axi.w.strb.allowOverride := ramBus.w.strb.andMask(
    !ClockDomain.current.isResetActive
  )

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

  // ── The video path — one master and one slave ────────────────────────────
  // The generator's control window sits on the fabric rather than beside it,
  // so programming it is bus traffic too: the CPU's configuration writes are
  // arbitrated against the frames the same core is writing back into RAM.
  val video = cfg.videoBase.map { _ =>
    val core = new VtpgZeroVideo(cfg.videoConfig, masterCfg, liteSlaveCfg)
    fabric.io.masters(videoIndex.get) << core.io.mem
    core.io.ctrl <> fabric.io.slaves(3 + (if (cfg.benchIoBase.isDefined) 1 else 0))
    core.io.frameSync := False
    core
  }

  // ── Traffic generators ───────────────────────────────────────────────────
  // Each one owns a window of RAM and hammers it, several bursts in flight, so
  // the crossbar has to arbitrate between them and the CPU for the whole run
  // rather than only when the program happens to miss its cache.
  val trafficGens = cfg.trafficGens.zipWithIndex.map {
    case (genCfg, i) =>
      val gen = new AxiSatGen(masterCfg, genCfg)
      gen.setWeakName(s"trafficGen$i")
      fabric.io.masters(genIndex0 + i) << gen.io.axi
      gen
  }

  if (trafficGens.nonEmpty) {
    io.genFault := Cat(
      trafficGens.map(g => g.io.dataErrors =/= 0 || g.io.respErrors =/= 0 || g.io.stalled)
    )
    io.genOk := trafficGens
      .map(g => g.io.dataErrors === 0 && g.io.respErrors === 0 && g.io.laps =/= 0 && !g.io.stalled)
      .reduce(_ && _)
  }

  // ── AXI4-Stream island ───────────────────────────────────────────────────
  // Shares nothing with the bus but the clock. It is here so a board build can
  // cover the stream components in the same bitstream as the crossbar rather
  // than needing one of its own.
  val axisIsland = Option.when(cfg.axisSmoke) {
    val smoke = new AxiStreamArtySmoke
    io.axisStatus := smoke.io.status
    // status(0) done, status(1) pass, status(2) fail; see AxiStreamArtySmoke.
    io.axisOk := smoke.io.status(0) && smoke.io.status(1) && !smoke.io.status(2)
    smoke
  }

  // ── Bus protocol checking ────────────────────────────────────────────────
  // Every fabric port is watched, master side and slave side, because the two
  // answer different questions: a master-side port says whether the CPU and
  // the video core keep the protocol, and a slave-side port says whether the
  // crossbar does. Only the second one is this project under test, but a
  // checker that fires on the first is worth just as much -- it means the
  // stimulus was not what the test thought it was.
  //
  // The checkers are passive, so this whole block can be removed by config
  // without changing a single wire of the design it watches.
  val busCheck = Option.when(cfg.protocolCheck) {
    new Area {
      private val ports =
        fabric.io.masters.zipWithIndex.map { case (bus, i) => (s"m$i", bus) } ++
          fabric.io.slaves.zipWithIndex.map { case (bus, i) => (s"s$i", bus) }

      val checkers = ports.map {
        case (portName, bus) =>
          Axi4ProtocolChecker(bus, portName, cfg.protocolCheckerConfig)
      }

      /** The names of the ports being watched, in the order `checkers` holds them. */
      val portNames: Seq[String] = ports.map(_._1).toSeq

      /** Union of every port's rules: one vector saying what was seen anywhere. */
      val sticky = checkers.map(_.sticky).reduce(_ | _)

      /** One bit per port, so a failure names a port instead of blaming the fabric. */
      val perPort = Vec(checkers.map(_.any))

      val any = perPort.orR

      /** Any checker lost track. Silence from that port stops being evidence. */
      val overflow = checkers.map(_.overflow).reduce(_ || _)
    }
  }
  if (cfg.protocolCheck) io.busViolation := busCheck.get.any

  // ── The verdict, as something a host can read over the bus ───────────────
  // The Arty prints these on its serial line; a board with only a debug cable
  // has no line to print on, so they are published as a system-control
  // register too. That the host then reads them across the crossbar under test
  // is deliberate: a fabric broken enough to hide its own verdict cannot
  // report a pass either.
  private val verdict = Bits(32 bits)
  verdict                                 := 0
  verdict(VexZeroSysCtrl.busViolationBit) := (if (cfg.protocolCheck) busCheck.get.any else False)
  verdict(VexZeroSysCtrl.genOkBit)        := (if (trafficGens.nonEmpty) io.genOk else True)
  verdict(VexZeroSysCtrl.axisOkBit)       := (if (cfg.axisSmoke) io.axisOk else True)
  verdict(VexZeroSysCtrl.hasCheckersBit)  := Bool(cfg.protocolCheck)
  verdict(VexZeroSysCtrl.hasGensBit)      := Bool(trafficGens.nonEmpty)
  verdict(VexZeroSysCtrl.hasIslandBit)    := Bool(cfg.axisSmoke)
  if (trafficGens.nonEmpty) {
    verdict(VexZeroSysCtrl.genFaultShift, trafficGens.size bits) := io.genFault
  }
  sysCtrl.io.verdict := verdict

  // The framebuffer has to land somewhere the writer can actually reach, and a
  // frame that runs off the end of RAM would be silently dropped by the
  // crossbar's decode rather than reported.
  if (hasVideo) {
    val vc  = cfg.videoConfig
    val end = vc.frameBase + vc.frameBytes
    require(
      vc.frameBase >= cfg.ramBase && end <= cfg.ramBase + cfg.ramSize,
      s"a ${vc.width}x${vc.height} frame at 0x${vc.frameBase.toString(16)} runs from " +
        s"0x${vc.frameBase.toString(16)} to 0x${end.toString(16)}, which is not inside the " +
        s"${cfg.ramSize} byte RAM at 0x${cfg.ramBase.toString(16)}"
    )
  }
}

object VexZeroSoc {

  /** The shape of every master port on this SoC.
    *
    * One ID bit, driven to a constant by all three masters; see the ordering note above.
    */
  val masterCfg: Axi4Config = Axi4Config(addressWidth = 32, dataWidth = 32, idWidth = 1)

  /** The AXI3 shape the load/store port is narrowed to under `axi3DataPath`.
    *
    * It matches `masterCfg` except where the two protocols differ: AXI3 carries four length bits,
    * so a burst is capped at 16 beats. Nothing on this SoC issues a longer one -- a cache line is
    * eight beats and a generator burst at most eight.
    */
  val axi3Cfg: Axi3Config = Axi3Config(addressWidth = 32, dataWidth = 32, idWidth = 1)

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
