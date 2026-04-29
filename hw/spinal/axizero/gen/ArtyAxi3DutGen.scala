// Copyright (c) 2026 Leonardo Capossio
// SPDX-License-Identifier: MIT
package axizero.gen

import spinal.core._
import spinal.lib._
import spinal.lib.bus.amba4.axi._
import axizero._
import axizero.adapters._

// ArtyAxi3DutGen — generates AxiZeroArtyAxi3DUT.v for AXI3 adapter HW test
//
// Topology (single-master, 4-slave):
//   AXI4 slave port (MB connects here)
//     → internal AXI4-to-AXI3 conversion (add WID, truncate LEN/LOCK)
//     → Axi3ToAxi4Adapter (the module under test)
//     → AxiZeroMixedTop crossbar
//     → 4 slave ports (BRAM0, BRAM1, GPIO, UART)
//
// This creates a round-trip: AXI4 → AXI3 → AXI4, proving the adapter
// correctly bridges the protocols in real hardware.
//
//   sbt "runMain axizero.gen.ArtyAxi3DutGen"
//
// Output: hw/vivado/arty_a7/ip/rtl/AxiZeroArtyAxi3DUT.v
object ArtyAxi3DutGen extends App {

  // The crossbar config (1M×4S, same as base design)
  val axi4MasterCfg = Axi4Config(addressWidth = 32, dataWidth = 32, idWidth = 1)

  val fullSlaveCfg = Axi4Config(addressWidth = 32, dataWidth = 32, idWidth = 1)

  val liteSlaveCfg = Axi4Config(
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

  val crossbarCfg = AxiZeroConfig(
    masters = Seq(
      MasterPort(axi4MasterCfg, FullAxi4)
    ),
    slaves = Seq(
      SlavePort(fullSlaveCfg, FullAxi4, BigInt("C0000000", 16), BigInt("00010000", 16)),
      SlavePort(fullSlaveCfg, FullAxi4, BigInt("C0010000", 16), BigInt("00010000", 16)),
      SlavePort(liteSlaveCfg, LiteAxi4, BigInt("C0020000", 16), BigInt("00001000", 16)),
      SlavePort(liteSlaveCfg, LiteAxi4, BigInt("C0030000", 16), BigInt("00001000", 16))
    ),
    maxOutstanding = 4
  )

  // AXI3 config matching the AXI4 master
  val axi3Cfg = Axi3Config(addressWidth = 32, dataWidth = 32, idWidth = 1)

  // Top-level component that wraps AXI3 adapter + crossbar
  class Axi3BridgeTestTop extends Component {
    val io = new Bundle {
      // AXI4 slave port (MicroBlaze connects here)
      val s0 = slave(Axi4(axi4MasterCfg))
      // Slave-side ports (same as normal crossbar)
      val m0 = master(Axi4(fullSlaveCfg))
      val m1 = master(Axi4(fullSlaveCfg))
      val m2 = master(Axi4(liteSlaveCfg))
      val m3 = master(Axi4(liteSlaveCfg))
    }

    // ── AXI4 → AXI3 conversion (trivial wire shim) ──
    val axi3Bus = Axi3(axi3Cfg)

    axi3Bus.aw.valid := io.s0.aw.valid
    io.s0.aw.ready   := axi3Bus.aw.ready
    axi3Bus.aw.id    := io.s0.aw.id
    axi3Bus.aw.addr  := io.s0.aw.addr
    axi3Bus.aw.len   := io.s0.aw.len.resize(4)
    axi3Bus.aw.size  := io.s0.aw.size
    axi3Bus.aw.burst := io.s0.aw.burst
    axi3Bus.aw.lock  := io.s0.aw.lock.resize(2)
    axi3Bus.aw.cache := io.s0.aw.cache
    axi3Bus.aw.prot  := io.s0.aw.prot

    axi3Bus.w.valid := io.s0.w.valid
    io.s0.w.ready   := axi3Bus.w.ready
    axi3Bus.w.id    := 0
    axi3Bus.w.data  := io.s0.w.data
    axi3Bus.w.strb  := io.s0.w.strb
    axi3Bus.w.last  := io.s0.w.last

    io.s0.b.valid   := axi3Bus.b.valid
    axi3Bus.b.ready := io.s0.b.ready
    io.s0.b.id      := axi3Bus.b.id
    io.s0.b.resp    := axi3Bus.b.resp

    axi3Bus.ar.valid := io.s0.ar.valid
    io.s0.ar.ready   := axi3Bus.ar.ready
    axi3Bus.ar.id    := io.s0.ar.id
    axi3Bus.ar.addr  := io.s0.ar.addr
    axi3Bus.ar.len   := io.s0.ar.len.resize(4)
    axi3Bus.ar.size  := io.s0.ar.size
    axi3Bus.ar.burst := io.s0.ar.burst
    axi3Bus.ar.lock  := io.s0.ar.lock.resize(2)
    axi3Bus.ar.cache := io.s0.ar.cache
    axi3Bus.ar.prot  := io.s0.ar.prot

    io.s0.r.valid   := axi3Bus.r.valid
    axi3Bus.r.ready := io.s0.r.ready
    io.s0.r.id      := axi3Bus.r.id
    io.s0.r.data    := axi3Bus.r.data
    io.s0.r.resp    := axi3Bus.r.resp
    io.s0.r.last    := axi3Bus.r.last

    // ── AXI3 → AXI4 adapter (module under test) ──
    val adapter = new Axi3ToAxi4Adapter(axi3Cfg, axi4MasterCfg, maxOutstanding = 4)
    adapter.io.axi3 <> axi3Bus

    // ── Crossbar ──
    val crossbar = new AxiZeroMixedTop(crossbarCfg)
    crossbar.io.masters(0) <> adapter.io.axi4

    // ── Slave ports ──
    io.m0 <> crossbar.io.slaves(0)
    io.m1 <> crossbar.io.slaves(1)
    io.m2 <> crossbar.io.slaves(2)
    io.m3 <> crossbar.io.slaves(3)
  }

  SpinalConfig(
    targetDirectory = "hw/vivado/arty_a7/ip/rtl",
    netlistFileName = "AxiZeroArtyAxi3DUT.v",
    defaultConfigForClockDomains = ClockDomainConfig(
      clockEdge = RISING,
      resetKind = SYNC,
      resetActiveLevel = LOW
    )
  ).generateVerilog(new Axi3BridgeTestTop)

  GenHelper.prependCopyright(
    java.nio.file.Paths.get("hw/vivado/arty_a7/ip/rtl/AxiZeroArtyAxi3DUT.v")
  )

  // Rename ports to AXI standard naming (flatten SpinalHDL Stream payloads)
  val path    = java.nio.file.Paths.get("hw/vivado/arty_a7/ip/rtl/AxiZeroArtyAxi3DUT.v")
  val content = new String(java.nio.file.Files.readAllBytes(path), "UTF-8")
  val renamed = content
    // io_s0_aw_valid → s0_axi_awvalid, io_s0_aw_payload_addr → s0_axi_awaddr, etc.
    .replaceAll("io_s(\\d+)_", "s$1_axi_")
    .replaceAll("io_m(\\d+)_", "m$1_axi_")
    .replaceAll("_payload_", "") // flatten aw_payload_addr → awaddr
    .replaceAll("_aw_valid", "_awvalid")
    .replaceAll("_aw_ready", "_awready")
    .replaceAll("_w_valid", "_wvalid")
    .replaceAll("_w_ready", "_wready")
    .replaceAll("_b_valid", "_bvalid")
    .replaceAll("_b_ready", "_bready")
    .replaceAll("_ar_valid", "_arvalid")
    .replaceAll("_ar_ready", "_arready")
    .replaceAll("_r_valid", "_rvalid")
    .replaceAll("_r_ready", "_rready")
  java.nio.file.Files.write(path, renamed.getBytes("UTF-8"))

  println("[ArtyAxi3DutGen] Done -> hw/vivado/arty_a7/ip/rtl/AxiZeroArtyAxi3DUT.v")
}
