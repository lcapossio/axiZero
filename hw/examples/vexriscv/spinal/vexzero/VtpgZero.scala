// Copyright (c) 2026 Leonardo Capossio — bard0 design  hello@bard0.com
// SPDX-License-Identifier: MIT
package vexzero

import java.io.File

import spinal.core._
import spinal.lib._
import spinal.lib.bus.amba4.axi._

// ---------------------------------------------------------------------------
// VtpgZero  —  a video test pattern generator as a bus master
//
// Everything that has driven traffic through this crossbar so far has been a
// CPU or a testbench, and neither can produce an AXI4 write burst. VexRiscv's
// data cache has no dirty bit, so it is write-through by construction: every
// store is a single beat, whatever the cache is configured to do. The stress
// test's bursts come from `HostTraffic`, which is simulation-only Scala.
//
// vtpgZero is a real IP core that writes real bursts. The pattern generator
// emits pixels over AXI4-Stream; a second module buffers BURST_LEN of them and
// issues one INCR write. Together they are a write-only master that fills a
// framebuffer in RAM while the CPU is running out of the same RAM:
//
//   vtpgz_axilite_top ──AXI4-Stream──> axis_to_ddr_writer ──AXI4──> crossbar
//          ▲
//          └── AXI4-Lite, a slave on the same crossbar, so the CPU programs it
//
// Both modules are plain Verilog-2001 with no vendor primitives, so unlike
// [[JtagAxi]] this blackbox simulates: Verilator compiles the submodule's RTL
// directly and the traffic in a wave is the traffic the board would produce.
//
// What it exercises that nothing else does
// ────────────────────────────────────────
//   • write bursts at all, and of a length that varies — full BURST_LEN runs
//     inside a line, short ones flushed at the end of a frame
//   • a write-only master: the writer ties its whole read channel off, a port
//     shape no other master here has
//   • bursty rather than uniform pressure, shaped by line and frame timing
//
// Pixel format
// ────────────
// The writer takes 24-bit {B,G,R} and stores 32-bit {R,G,B,0xFF}, so a frame
// costs width * height * 4 bytes and every pixel word ends in 0xFF. That last
// byte is what makes a testbench able to tell a written pixel from untouched
// memory.
// ---------------------------------------------------------------------------

/** Where the submodule's sources live, and the register map its AXI4-Lite face exposes.
  *
  * Paths are relative to the repository root, which is where sbt runs, and are turned into absolute
  * ones only at elaboration — nothing here is baked into a generated file.
  */
object VtpgZero {

  /** The pattern generator and its register file. */
  val rtlDir = "third_party/vtpgZero/rtl"

  /** The stream-to-memory writer. It lives under the KV260 demo rather than in `rtl/`, so a
    * submodule bump can move it; that is the one part of this integration worth re-checking.
    */
  val writerDir = "third_party/vtpgZero/hw/kv260/rtl"

  private def rtl(dir: String, name: String) = new File(new File(dir), name).getAbsolutePath

  def topSource: String    = rtl(rtlDir, "vtpgz_axilite_top.v")
  def coreSource: String   = rtl(rtlDir, "vtpgz_core.v")
  def regsSource: String   = rtl(rtlDir, "vtpgz_axil_regs.v")
  def writerSource: String = rtl(writerDir, "axis_to_ddr_writer.v")

  /** `vtpgz_defs.vh` is pulled in by `\`include`, so the tool needs the directory, not the file. */
  def includeDir: String = new File(rtlDir).getAbsolutePath

  /** The generator's three files, and the writer's one. Kept apart so a blackbox adds only what
    * defines it -- handing the same module to Verilator twice is an error, not a no-op.
    */
  def tpgSources: Seq[String]    = Seq(topSource, coreSource, regsSource)
  def writerSources: Seq[String] = Seq(writerSource)
  def sources: Seq[String]       = tpgSources ++ writerSources

  /** True when the submodule is checked out. Simulations should skip rather than fail. */
  def available: Boolean = sources.forall(new File(_).isFile)

  val initHint = "run: git submodule update --init third_party/vtpgZero"

  // ── Register map, mirrored from rtl/vtpgz_defs.vh ────────────────────────
  // Byte offsets into the core's AXI4-Lite window. Kept here rather than read
  // from the header so the firmware and the testbench agree with the hardware
  // in one place; `VtpgZeroSpec` checks CORE_ID against the real core.
  val regCoreId      = 0x00
  val regVersion     = 0x04
  val regControl     = 0x08
  val regStatus      = 0x0c
  val regImgWidth    = 0x10
  val regImgHeight   = 0x14
  val regPatternSel  = 0x18
  val regSolidColor  = 0x20
  val regGridSpacing = 0x34
  val regGridColor   = 0x38
  val regCheckerSize = 0x3c
  val regFrameRate   = 0x40
  val regBarWidth    = 0x44
  val regHgStep      = 0x48
  val regVgStep      = 0x4c

  /** Reads back as "VTPG" little-endian. Cheap proof the bus reached the core. */
  val coreIdMagic = 0x47505456L

  /** CONTROL bit 0 — run. Bit 1 is a software frame sync, bit 2 selects the external one. */
  val ctrlEnable  = 1
  val ctrlSwFsync = 2
  val ctrlExtSync = 4

  val patColorbar = 0
  val patHgrad    = 1
  val patVgrad    = 2
  val patChecker  = 3
  val patSolid    = 4
  val patGrid     = 6
  val patRamp     = 7

  /** The window the core decodes. Its registers are 8-bit addressed. */
  val windowSize: BigInt = 256
}

/** Geometry and burst length, shared by the generator and the writer.
  *
  * The two have to agree: the writer counts `width * height` pixels per frame and drops the surplus
  * of a malformed one, so a generator programmed larger than the writer was built for silently
  * loses the tail of every frame.
  *
  * @param frameBase
  *   where frames land. Must be within a slave the writer can reach.
  * @param burstLen
  *   beats per write burst. The whole reason this master is interesting.
  */
case class VtpgZeroConfig(
  width: Int = 64,
  height: Int = 64,
  frameBase: BigInt = BigInt("8000C000", 16),
  burstLen: Int = 16,
  lineGapCycles: Int = 1,
  qos: Int = 0
) {
  require(width > 0 && height > 0, "a frame needs both dimensions")
  require(burstLen >= 1 && burstLen <= 256, s"AXI bursts are 1..256 beats, not $burstLen")
  require(
    isPow2(burstLen),
    s"the writer's beat counter is sized by log2, so burstLen must be a power of two, not $burstLen"
  )
  require(qos >= 0 && qos <= 15, s"qos must fit AXQOS's four bits, not $qos")

  /** Bytes a frame occupies: one 32-bit ABGR8888 word per pixel. */
  def frameBytes: BigInt = BigInt(width) * height * 4
}

/** `vtpgz_axilite_top` — the pattern generator with its register file.
  *
  * Only the build-time parameters this integration varies are forwarded. The rest keep the core's
  * own defaults, except the pattern enables: the ones we do not drive are switched off so the
  * netlist does not carry generators nothing selects.
  */
class VtpgzTopBlackBox(cfg: VtpgZeroConfig) extends BlackBox {

  setDefinitionName("vtpgz_axilite_top")

  addGenerics(
    "C_S_AXI_ADDR_WIDTH" -> 8,
    "C_S_AXI_DATA_WIDTH" -> 32,
    // Patterns worth having on a framebuffer a testbench has to predict: flat
    // colour, and two gradients whose value depends on the pixel's position,
    // which is what catches a burst written to the wrong address.
    "EN_COLORBAR"   -> 1,
    "EN_HGRAD"      -> 1,
    "EN_VGRAD"      -> 1,
    "EN_CHECKER"    -> 1,
    "EN_SOLID"      -> 1,
    "EN_MOVING_BOX" -> 0,
    "EN_GRID"       -> 0,
    "EN_RAMP"       -> 0,
    "EN_NOISE"      -> 0,
    "EN_IMAGE"      -> 0,
    "EN_BOX_IMAGE"  -> 0,
    // 8 bits per component, RGB, one pixel per clock: 24-bit TDATA, which is
    // exactly what the writer takes.
    "OUTPUT_MODE"      -> 0,
    "BPC"              -> 8,
    "PIXELS_PER_CLOCK" -> 1,
    "LINE_GAP_CYCLES"  -> cfg.lineGapCycles,
    "TID_WIDTH"        -> 0,
    "TDEST_WIDTH"      -> 0
  )

  val io = new Bundle {
    val aclk    = in Bool ()
    val aresetn = in Bool ()

    val s_axi_awaddr  = in UInt (8 bits)
    val s_axi_awprot  = in Bits (3 bits)
    val s_axi_awvalid = in Bool ()
    val s_axi_awready = out Bool ()
    val s_axi_wdata   = in Bits (32 bits)
    val s_axi_wstrb   = in Bits (4 bits)
    val s_axi_wvalid  = in Bool ()
    val s_axi_wready  = out Bool ()
    val s_axi_bresp   = out Bits (2 bits)
    val s_axi_bvalid  = out Bool ()
    val s_axi_bready  = in Bool ()
    val s_axi_araddr  = in UInt (8 bits)
    val s_axi_arprot  = in Bits (3 bits)
    val s_axi_arvalid = in Bool ()
    val s_axi_arready = out Bool ()
    val s_axi_rdata   = out Bits (32 bits)
    val s_axi_rresp   = out Bits (2 bits)
    val s_axi_rvalid  = out Bool ()
    val s_axi_rready  = in Bool ()

    val m_axis_tdata  = out Bits (24 bits)
    val m_axis_tvalid = out Bool ()
    val m_axis_tready = in Bool ()
    val m_axis_tlast  = out Bool ()
    val m_axis_tuser  = out Bool ()

    /** Tied to one bit each because TID_WIDTH and TDEST_WIDTH are zero; the core widens them to 1
      * rather than removing the port, so they have to be declared and then ignored.
      */
    val m_axis_tid   = out Bits (1 bits)
    val m_axis_tdest = out Bits (1 bits)

    val frame_sync_in = in Bool ()
  }

  noIoPrefix()
  mapCurrentClockDomain(clock = io.aclk, reset = io.aresetn, resetActiveLevel = LOW)

  VtpgZero.tpgSources.foreach(addRTLPath)
}

/** `axis_to_ddr_writer` — the stream turned into AXI4 write bursts.
  *
  * Buffers `BURST_LEN` pixels and issues one INCR write, flushing a short burst at `tlast` or at a
  * start-of-frame with data still pending. Its read channel exists but is tied off inside the
  * module, which is what makes this a write-only master.
  */
class VtpgzWriterBlackBox(cfg: VtpgZeroConfig, idWidth: Int) extends BlackBox {

  setDefinitionName("axis_to_ddr_writer")

  addGenerics(
    // A literal rather than a number: the base is a 32-bit parameter, and an
    // address at or above 0x8000_0000 does not fit a Scala Int, which is the
    // widest plain integer a generic takes.
    "FB_BASE"          -> U(cfg.frameBase, 32 bits),
    "IMG_W"            -> cfg.width,
    "IMG_H"            -> cfg.height,
    "BURST_LEN"        -> cfg.burstLen,
    "M_AXI_ID_WIDTH"   -> idWidth,
    "M_AXI_ADDR_WIDTH" -> 32,
    "M_AXI_DATA_WIDTH" -> 32
  )

  val io = new Bundle {
    val aclk    = in Bool ()
    val aresetn = in Bool ()

    val s_axis_tdata  = in Bits (24 bits)
    val s_axis_tvalid = in Bool ()
    val s_axis_tready = out Bool ()
    val s_axis_tlast  = in Bool ()
    val s_axis_tuser  = in Bool ()

    val m_axi_awid    = out UInt (idWidth bits)
    val m_axi_awaddr  = out UInt (32 bits)
    val m_axi_awlen   = out Bits (8 bits)
    val m_axi_awsize  = out Bits (3 bits)
    val m_axi_awburst = out Bits (2 bits)
    val m_axi_awlock  = out Bits (1 bits)
    val m_axi_awcache = out Bits (4 bits)
    val m_axi_awprot  = out Bits (3 bits)
    val m_axi_awqos   = out Bits (4 bits)
    val m_axi_awvalid = out Bool ()
    val m_axi_awready = in Bool ()

    val m_axi_wdata  = out Bits (32 bits)
    val m_axi_wstrb  = out Bits (4 bits)
    val m_axi_wlast  = out Bool ()
    val m_axi_wvalid = out Bool ()
    val m_axi_wready = in Bool ()

    val m_axi_bid    = in UInt (idWidth bits)
    val m_axi_bresp  = in Bits (2 bits)
    val m_axi_bvalid = in Bool ()
    val m_axi_bready = out Bool ()

    val m_axi_arid    = out UInt (idWidth bits)
    val m_axi_araddr  = out UInt (32 bits)
    val m_axi_arlen   = out Bits (8 bits)
    val m_axi_arsize  = out Bits (3 bits)
    val m_axi_arburst = out Bits (2 bits)
    val m_axi_arlock  = out Bits (1 bits)
    val m_axi_arcache = out Bits (4 bits)
    val m_axi_arprot  = out Bits (3 bits)
    val m_axi_arqos   = out Bits (4 bits)
    val m_axi_arvalid = out Bool ()
    val m_axi_arready = in Bool ()

    val m_axi_rid    = in UInt (idWidth bits)
    val m_axi_rdata  = in Bits (32 bits)
    val m_axi_rresp  = in Bits (2 bits)
    val m_axi_rlast  = in Bool ()
    val m_axi_rvalid = in Bool ()
    val m_axi_rready = out Bool ()
  }

  noIoPrefix()
  mapCurrentClockDomain(clock = io.aclk, reset = io.aresetn, resetActiveLevel = LOW)

  VtpgZero.writerSources.foreach(addRTLPath)
}

/** The pair, wired together and presented to the crossbar.
  *
  * One AXI4 master that only ever writes, and one AXI4-Lite slave that configures it. Both join the
  * same crossbar, so programming the generator is itself bus traffic arbitrated against everything
  * else — which is the point of putting the control port on the fabric rather than beside it.
  *
  * @param axiConfig
  *   the crossbar's master port config, so this matches whatever the SoC uses.
  * @param liteConfig
  *   the crossbar's Lite slave port config.
  */
class VtpgZeroVideo(cfg: VtpgZeroConfig, axiConfig: Axi4Config, liteConfig: Axi4Config)
    extends Component {

  val io = new Bundle {

    /** Frames, as write bursts. */
    val mem = master(Axi4(axiConfig))

    /** The generator's registers. */
    val ctrl = slave(Axi4(liteConfig))

    /** An external frame sync, for a board that has one. Tied low here otherwise. */
    val frameSync = (in Bool ()).default(False)
  }

  val tpg    = new VtpgzTopBlackBox(cfg)
  val writer = new VtpgzWriterBlackBox(cfg, axiConfig.idWidth)

  // ── generator ── AXI4-Stream ──> writer ──────────────────────────────────
  writer.io.s_axis_tdata  := tpg.io.m_axis_tdata
  writer.io.s_axis_tvalid := tpg.io.m_axis_tvalid
  writer.io.s_axis_tlast  := tpg.io.m_axis_tlast
  writer.io.s_axis_tuser  := tpg.io.m_axis_tuser
  tpg.io.m_axis_tready    := writer.io.s_axis_tready
  tpg.io.frame_sync_in    := io.frameSync

  // ── control: AXI4-Lite in the crossbar's clothing ────────────────────────
  // The fabric carries its Lite ports as Axi4 with the full-only fields turned
  // off, so this is a rename rather than a protocol conversion. Only the low
  // eight address bits reach the core; the decode above has already matched
  // the window.
  tpg.io.s_axi_awaddr  := io.ctrl.aw.payload.addr.resized
  tpg.io.s_axi_awprot  := io.ctrl.aw.payload.prot
  tpg.io.s_axi_awvalid := io.ctrl.aw.valid
  io.ctrl.aw.ready     := tpg.io.s_axi_awready

  tpg.io.s_axi_wdata  := io.ctrl.w.payload.data
  tpg.io.s_axi_wstrb  := io.ctrl.w.payload.strb
  tpg.io.s_axi_wvalid := io.ctrl.w.valid
  io.ctrl.w.ready     := tpg.io.s_axi_wready

  io.ctrl.b.valid        := tpg.io.s_axi_bvalid
  io.ctrl.b.payload.resp := tpg.io.s_axi_bresp
  tpg.io.s_axi_bready    := io.ctrl.b.ready

  tpg.io.s_axi_araddr  := io.ctrl.ar.payload.addr.resized
  tpg.io.s_axi_arprot  := io.ctrl.ar.payload.prot
  tpg.io.s_axi_arvalid := io.ctrl.ar.valid
  io.ctrl.ar.ready     := tpg.io.s_axi_arready

  io.ctrl.r.valid        := tpg.io.s_axi_rvalid
  io.ctrl.r.payload.data := tpg.io.s_axi_rdata
  io.ctrl.r.payload.resp := tpg.io.s_axi_rresp
  tpg.io.s_axi_rready    := io.ctrl.r.ready

  // ── the write master ─────────────────────────────────────────────────────
  io.mem.aw.valid         := writer.io.m_axi_awvalid
  io.mem.aw.payload.addr  := writer.io.m_axi_awaddr
  io.mem.aw.payload.id    := writer.io.m_axi_awid
  io.mem.aw.payload.len   := writer.io.m_axi_awlen.asUInt
  io.mem.aw.payload.size  := writer.io.m_axi_awsize.asUInt
  io.mem.aw.payload.burst := writer.io.m_axi_awburst
  io.mem.aw.payload.lock  := writer.io.m_axi_awlock
  io.mem.aw.payload.cache := writer.io.m_axi_awcache
  io.mem.aw.payload.prot  := writer.io.m_axi_awprot
  // The writer hardcodes AWQOS to zero, so the rank has to be declared here --
  // the same position VexZeroSoc is in with VexRiscv, which has no QoS output
  // at all. Reachable from the config so video can be ranked against the CPU.
  io.mem.aw.payload.qos := B(cfg.qos, 4 bits)
  // AWREGION is the one signal the writer does not carry.
  io.mem.aw.payload.region := B(0, 4 bits)
  writer.io.m_axi_awready  := io.mem.aw.ready

  io.mem.w.valid         := writer.io.m_axi_wvalid
  io.mem.w.payload.data  := writer.io.m_axi_wdata
  io.mem.w.payload.strb  := writer.io.m_axi_wstrb
  io.mem.w.payload.last  := writer.io.m_axi_wlast
  writer.io.m_axi_wready := io.mem.w.ready

  writer.io.m_axi_bid    := io.mem.b.payload.id
  writer.io.m_axi_bresp  := io.mem.b.payload.resp
  writer.io.m_axi_bvalid := io.mem.b.valid
  io.mem.b.ready         := writer.io.m_axi_bready

  // ── the read channel it never uses ───────────────────────────────────────
  // Driven from the writer rather than tied off here, so that if a later
  // version of the core does start reading, this wrapper carries it instead of
  // quietly dropping it.
  io.mem.ar.valid          := writer.io.m_axi_arvalid
  io.mem.ar.payload.addr   := writer.io.m_axi_araddr
  io.mem.ar.payload.id     := writer.io.m_axi_arid
  io.mem.ar.payload.len    := writer.io.m_axi_arlen.asUInt
  io.mem.ar.payload.size   := writer.io.m_axi_arsize.asUInt
  io.mem.ar.payload.burst  := writer.io.m_axi_arburst
  io.mem.ar.payload.lock   := writer.io.m_axi_arlock
  io.mem.ar.payload.cache  := writer.io.m_axi_arcache
  io.mem.ar.payload.prot   := writer.io.m_axi_arprot
  io.mem.ar.payload.qos    := writer.io.m_axi_arqos
  io.mem.ar.payload.region := B(0, 4 bits)
  writer.io.m_axi_arready  := io.mem.ar.ready

  writer.io.m_axi_rid    := io.mem.r.payload.id
  writer.io.m_axi_rdata  := io.mem.r.payload.data
  writer.io.m_axi_rresp  := io.mem.r.payload.resp
  writer.io.m_axi_rlast  := io.mem.r.payload.last
  writer.io.m_axi_rvalid := io.mem.r.valid
  io.mem.r.ready         := writer.io.m_axi_rready
}
