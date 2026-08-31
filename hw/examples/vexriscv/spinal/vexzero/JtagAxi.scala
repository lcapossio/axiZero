// Copyright (c) 2026 Leonardo Capossio — bard0 design  hello@bard0.com
// SPDX-License-Identifier: MIT
package vexzero

import spinal.core._
import spinal.lib._
import spinal.lib.bus.amba4.axi._

// ---------------------------------------------------------------------------
// JtagAxi  —  the debug cable as an AXI4 master
//
// The Arty reports over a USB-UART. The DE25-Nano has no UART: its only link
// to the host is the on-board USB-Blaster, so the report has to travel over
// JTAG. Rather than bolt a second reporting path onto the SoC, the host joins
// the system as a third bus master and reads the same registers the firmware
// wrote — which is a better demonstration of the interconnect anyway, since
// the host's transactions are arbitrated against the CPU's by the crossbar
// under test.
//
// The bridge itself is fpgacapZero's, carried as a pinned submodule. It is a
// plain AXI4 master with no IDs; everything vendor-specific is inside its own
// wrapper, one per family, and this file picks between them.
//
//   host ── USB-Blaster ── TAP ── fcapz_ejtagaxi ── Axi4 ──> axiZero crossbar
//
// Response ordering
// ─────────────────
// The bridge runs one transaction at a time — its 72-bit DR carries a command
// in and the previous result out — and a burst cannot span two slaves. So a
// constant ID is enough for the pipelined crossbar to route its responses,
// exactly as it is for the two CPU ports.
// ---------------------------------------------------------------------------

/** Which vendor's TAP primitive the bridge should instantiate. */
sealed trait JtagAxiVendor { def module: String }

/** Altera / Intel: `sld_virtual_jtag`, as used on the DE25-Nano. */
case object IntelJtagAxi extends JtagAxiVendor { val module = "fcapz_ejtagaxi_intel" }

/** Xilinx 7-series: `BSCANE2`. Not used by any board here yet, but the bridge ships the wrapper, so
  * naming it costs nothing and documents the way out.
  */
case object Xilinx7JtagAxi extends JtagAxiVendor { val module = "fcapz_ejtagaxi_xilinx7" }

/** The vendor bridge, as SpinalHDL sees it.
  *
  * Only the AXI signals the bridge actually has are declared. The ones an `Axi4Config` carries but
  * the bridge does not drive (ID, LOCK, CACHE, QOS, REGION) are tied off by [[JtagAxiMaster]],
  * which is the only thing that should instantiate this.
  */
class JtagAxiBlackBox(
  vendor: JtagAxiVendor,
  addressWidth: Int,
  dataWidth: Int,
  chain: Int,
  fifoDepth: Int,
  timeout: Int
) extends BlackBox {

  setDefinitionName(vendor.module)

  addGenerics(
    "ADDR_W"     -> addressWidth,
    "DATA_W"     -> dataWidth,
    "FIFO_DEPTH" -> fifoDepth,
    "TIMEOUT"    -> timeout,
    "CHAIN"      -> chain
  )

  val io = new Bundle {
    val axi_clk = in Bool ()

    /** Active high and asynchronous — the bridge resets on `posedge axi_rst`. */
    val axi_rst = in Bool ()

    val m_axi_awaddr  = out UInt (addressWidth bits)
    val m_axi_awlen   = out Bits (8 bits)
    val m_axi_awsize  = out Bits (3 bits)
    val m_axi_awburst = out Bits (2 bits)
    val m_axi_awvalid = out Bool ()
    val m_axi_awready = in Bool ()
    val m_axi_awprot  = out Bits (3 bits)

    val m_axi_wdata  = out Bits (dataWidth bits)
    val m_axi_wstrb  = out Bits (dataWidth / 8 bits)
    val m_axi_wvalid = out Bool ()
    val m_axi_wready = in Bool ()
    val m_axi_wlast  = out Bool ()

    val m_axi_bresp  = in Bits (2 bits)
    val m_axi_bvalid = in Bool ()
    val m_axi_bready = out Bool ()

    val m_axi_araddr  = out UInt (addressWidth bits)
    val m_axi_arlen   = out Bits (8 bits)
    val m_axi_arsize  = out Bits (3 bits)
    val m_axi_arburst = out Bits (2 bits)
    val m_axi_arvalid = out Bool ()
    val m_axi_arready = in Bool ()
    val m_axi_arprot  = out Bits (3 bits)

    val m_axi_rdata  = in Bits (dataWidth bits)
    val m_axi_rresp  = in Bits (2 bits)
    val m_axi_rvalid = in Bool ()
    val m_axi_rlast  = in Bool ()
    val m_axi_rready = out Bool ()

    // Present on the module and left unconnected; DEBUG_EN defaults to 0.
    val debug_tck      = out Bits (256 bits)
    val debug_tck_edge = out Bits (256 bits)
    val debug_axi      = out Bits (256 bits)
    val debug_axi_edge = out Bits (256 bits)
  }

  noIoPrefix()
  mapClockDomain(clock = io.axi_clk, reset = io.axi_rst, resetActiveLevel = HIGH)
}

/** The JTAG bridge presented as an ordinary axiZero master port.
  *
  * Everything the crossbar expects and the bridge does not drive is tied to a constant here, in one
  * place, so the SoC wires this up like any other master.
  */
class JtagAxiMaster(
  axiConfig: Axi4Config,
  vendor: JtagAxiVendor = IntelJtagAxi,
  /** `sld_instance_index`. The host addresses the bridge by this number, so it has to match what
    * the runner passes as its chain; 4 is the bridge's own default.
    */
  chain: Int = 4,
  fifoDepth: Int = 16,
  timeout: Int = 4096
) extends Component {

  val io = new Bundle {
    val axi = master(Axi4(axiConfig))
  }

  private val bridge = new JtagAxiBlackBox(
    vendor = vendor,
    addressWidth = axiConfig.addressWidth,
    dataWidth = axiConfig.dataWidth,
    chain = chain,
    fifoDepth = fifoDepth,
    timeout = timeout
  )

  // ── Write address ────────────────────────────────────────────────────────
  io.axi.aw.valid         := bridge.io.m_axi_awvalid
  io.axi.aw.payload.addr  := bridge.io.m_axi_awaddr
  io.axi.aw.payload.len   := bridge.io.m_axi_awlen.asUInt
  io.axi.aw.payload.size  := bridge.io.m_axi_awsize.asUInt
  io.axi.aw.payload.burst := bridge.io.m_axi_awburst
  io.axi.aw.payload.prot  := bridge.io.m_axi_awprot
  bridge.io.m_axi_awready := io.axi.aw.ready

  // ── Write data ───────────────────────────────────────────────────────────
  io.axi.w.valid         := bridge.io.m_axi_wvalid
  io.axi.w.payload.data  := bridge.io.m_axi_wdata
  io.axi.w.payload.strb  := bridge.io.m_axi_wstrb
  io.axi.w.payload.last  := bridge.io.m_axi_wlast
  bridge.io.m_axi_wready := io.axi.w.ready

  // ── Write response ───────────────────────────────────────────────────────
  bridge.io.m_axi_bresp  := io.axi.b.payload.resp
  bridge.io.m_axi_bvalid := io.axi.b.valid
  io.axi.b.ready         := bridge.io.m_axi_bready

  // ── Read address ─────────────────────────────────────────────────────────
  io.axi.ar.valid         := bridge.io.m_axi_arvalid
  io.axi.ar.payload.addr  := bridge.io.m_axi_araddr
  io.axi.ar.payload.len   := bridge.io.m_axi_arlen.asUInt
  io.axi.ar.payload.size  := bridge.io.m_axi_arsize.asUInt
  io.axi.ar.payload.burst := bridge.io.m_axi_arburst
  io.axi.ar.payload.prot  := bridge.io.m_axi_arprot
  bridge.io.m_axi_arready := io.axi.ar.ready

  // ── Read data ────────────────────────────────────────────────────────────
  bridge.io.m_axi_rdata  := io.axi.r.payload.data
  bridge.io.m_axi_rresp  := io.axi.r.payload.resp
  bridge.io.m_axi_rvalid := io.axi.r.valid
  bridge.io.m_axi_rlast  := io.axi.r.payload.last
  io.axi.r.ready         := bridge.io.m_axi_rready

  // ── Signals the bridge does not have ─────────────────────────────────────
  // A constant ID is what lets the pipelined crossbar route the responses; see
  // the ordering note at the top of this file.
  if (axiConfig.useId) {
    io.axi.aw.payload.id := 0
    io.axi.ar.payload.id := 0
  }
  if (axiConfig.useLock) {
    io.axi.aw.payload.lock := Axi4.lock.NORMAL
    io.axi.ar.payload.lock := Axi4.lock.NORMAL
  }
  if (axiConfig.useCache) {
    io.axi.aw.payload.cache := 0
    io.axi.ar.payload.cache := 0
  }
  if (axiConfig.useQos) {
    io.axi.aw.payload.qos := 0
    io.axi.ar.payload.qos := 0
  }
  if (axiConfig.useRegion) {
    io.axi.aw.payload.region := 0
    io.axi.ar.payload.region := 0
  }
}
