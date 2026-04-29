// Copyright (c) 2026 Leonardo Capossio — bard0 design  hello@bard0.com
// SPDX-License-Identifier: MIT
package axizero

import spinal.lib.bus.amba4.axi.Axi4Config

// ---------------------------------------------------------------------------
// Port mode: full AXI4, AXI4-Lite, or AXI3 master
// ---------------------------------------------------------------------------
sealed trait PortMode
case object FullAxi4 extends PortMode
case object LiteAxi4 extends PortMode
/** AXI3 master port.  The crossbar auto-inserts an Axi3ToAxi4Adapter between
 *  the external AXI3 port and the internal AXI4 fabric.
 *  Requires MasterPort.axi3Cfg to be set. */
case object Axi3Mode extends PortMode

// ---------------------------------------------------------------------------
// Arbitration policy
// ---------------------------------------------------------------------------
sealed trait ArbitrationPolicy
/** Classic round-robin: each master gets a fair turn. */
case object RoundRobin extends ArbitrationPolicy
/** Fixed priority: master 0 has highest priority, master N-1 lowest. */
case object FixedPriority extends ArbitrationPolicy
/** QoS-based: uses AXQOS to rank requests and falls back to round-robin
 *  among equal-priority requests. Masters without QoS signal are treated
 *  as AXQOS=0. Waiting requesters receive age boost to prevent starvation. */
case object QosBased extends ArbitrationPolicy
/** Weighted round-robin: master i gets weights(i) grants per round.
 *  weights.size must equal the number of masters. */
case class WeightedRoundRobin(weights: Seq[Int]) extends ArbitrationPolicy {
  require(weights.nonEmpty && weights.forall(_ > 0),
    "WeightedRoundRobin: all weights must be positive")
}

// ---------------------------------------------------------------------------
// Per-port configuration
// ---------------------------------------------------------------------------

/** Configuration for one master-side port. */
case class MasterPort(
  /** AXI bus parameters (address/data/id widths, optional signals).
   *  For Axi3Mode ports this describes the internal AXI4 representation;
   *  the external port is an Axi3 bundle derived from axi3Cfg. */
  config  : Axi4Config,
  /** AXI4-Lite, full AXI4, or AXI3. */
  mode    : PortMode = FullAxi4,
  /** Insert a register slice between this master and the crossbar fabric.
   *  Helps with timing closure; costs one cycle of additional latency. */
  regSlice: Boolean  = false,
  /** Required when mode == Axi3Mode.  Describes the external AXI3 port
   *  (address/data/id widths must match config). */
  axi3Cfg : Option[axizero.adapters.Axi3Config] = None
) {
  require(
    mode != Axi3Mode || axi3Cfg.isDefined,
    "MasterPort: axi3Cfg must be set when mode == Axi3Mode"
  )
  require(
    mode == Axi3Mode || axi3Cfg.isEmpty,
    "MasterPort: axi3Cfg must only be set when mode == Axi3Mode"
  )
}

/** Configuration for one slave-side port. */
case class SlavePort(
  /** AXI bus parameters. */
  config     : Axi4Config,
  /** AXI4-Lite or full AXI4. */
  mode       : PortMode = FullAxi4,
  /** Base address of the slave's memory region. */
  baseAddress: BigInt,
  /** Size of the slave's memory region in bytes. */
  size       : BigInt,
  /** Insert a register slice between the crossbar fabric and this slave. */
  regSlice   : Boolean  = false
) {
  def endAddress: BigInt = baseAddress + size
}

// ---------------------------------------------------------------------------
// Top-level interconnect configuration
// ---------------------------------------------------------------------------

case class AxiZeroConfig(
  masters          : Seq[MasterPort],
  slaves           : Seq[SlavePort],
  arbitration      : ArbitrationPolicy = RoundRobin,
  /** Override the internal fabric data width. When None the fabric uses the
   *  maximum data width across all ports; width converters are inserted at
   *  ports with a narrower config. */
  internalDataWidth: Option[Int] = None,
  /** Maximum outstanding transactions per slave per direction.
   *  1 = blocking (simple, no FIFOs — good for single-master or low-contention).
   *  >1 = non-blocking / pipelined (uses per-slave W-route FIFOs and
   *        ID-based response routing — better throughput when multiple masters
   *        target the same slave).
   *  Only affects the full AXI4 crossbar; the Lite crossbar is always blocking. */
  maxOutstanding   : Int = 1
) {
  // ---- basic sanity -------------------------------------------------------
  require(masters.nonEmpty, "At least one master port is required")
  require(slaves.nonEmpty,  "At least one slave port is required")
  require(maxOutstanding >= 1, "maxOutstanding must be >= 1")

  arbitration match {
    case WeightedRoundRobin(w) =>
      require(w.size == masters.size,
        s"WeightedRoundRobin.weights.size (${w.size}) must equal numMasters (${masters.size})")
    case _ =>
  }

  // ---- derived counts -----------------------------------------------------
  val numMasters: Int = masters.size
  val numSlaves : Int = slaves.size

  // ---- mode helpers -------------------------------------------------------

  /** True when every master AND every slave is AXI4-Lite.
   *  Enables the resource-efficient all-lite crossbar path. */
  val isAllLite: Boolean =
    masters.forall(_.mode == LiteAxi4) && slaves.forall(_.mode == LiteAxi4)

  /** True when every master AND every slave is full AXI4 (no Lite, no AXI3). */
  val isAllFull: Boolean =
    masters.forall(_.mode == FullAxi4) && slaves.forall(_.mode == FullAxi4)

  /** True when at least one master is AXI3 (uses Axi3Mode). */
  val hasAxi3Masters: Boolean = masters.exists(_.mode == Axi3Mode)

  // ---- fabric data width --------------------------------------------------
  val fabricDataWidth: Int = internalDataWidth.getOrElse(
    (masters.map(_.config.dataWidth) ++ slaves.map(_.config.dataWidth)).max
  )

  // ---- ID width management (full AXI4 only) --------------------------------
  /** Bits required to encode the originating master index in slave-side IDs. */
  val masterIndexBits: Int = if (numMasters <= 1) 0 else log2Up(numMasters)

  /** Slave-side ID width: expands master IDs with originating-master bits. */
  def slaveSideIdWidth(masterIdWidth: Int): Int = masterIdWidth + masterIndexBits

  // ---- address map validation ----------------------------------------------
  for (si <- slaves.indices) {
    val sp = slaves(si)
    require(sp.size > 0 && (sp.size & (sp.size - 1)) == 0,
      s"Slave $si: size (0x${sp.size.toString(16)}) must be a power of 2")
    require((sp.baseAddress & (sp.size - 1)) == 0,
      s"Slave $si: baseAddress (0x${sp.baseAddress.toString(16)}) must be aligned to size (0x${sp.size.toString(16)})")
  }
  for (i <- slaves.indices; j <- slaves.indices if i < j) {
    val a = slaves(i); val b = slaves(j)
    require(
      a.baseAddress >= b.endAddress || b.baseAddress >= a.endAddress,
      s"Slave $i [0x${a.baseAddress.toString(16)}, 0x${a.endAddress.toString(16)}) " +
      s"overlaps with slave $j [0x${b.baseAddress.toString(16)}, 0x${b.endAddress.toString(16)})"
    )
  }

  // ---- helpers ------------------------------------------------------------
  private def log2Up(x: Int): Int = {
    require(x > 0)
    if (x == 1) 1 else (math.log(x - 1) / math.log(2)).toInt + 1
  }
}

// ---------------------------------------------------------------------------
// Convenience constructors
// ---------------------------------------------------------------------------
object AxiZeroConfig {

  /** Build an all-AXI4-Lite config quickly (all ports share the same
   *  address and data widths). */
  def allLite(
    numMasters  : Int,
    numSlaves   : Int,
    addrWidth   : Int,
    dataWidth   : Int,
    addressMap  : Seq[(BigInt, BigInt)],   // (base, size) per slave
    arbitration : ArbitrationPolicy = RoundRobin,
    masterRegSlices: Boolean = false,
    slaveRegSlices : Boolean = false
  ): AxiZeroConfig = {
    require(addressMap.size == numSlaves,
      "addressMap.size must equal numSlaves")

    val liteCfg = Axi4Config(
      addressWidth = addrWidth,
      dataWidth    = dataWidth,
      useId        = false,
      useRegion    = false,
      useBurst     = false,
      useLock      = false,
      useCache     = false,
      useSize      = false,
      useQos       = false,
      useLen       = false,
      useLast      = false,
      useResp      = true,
      useProt      = true,
      useStrb      = true
    )

    AxiZeroConfig(
      masters     = Seq.fill(numMasters)(MasterPort(liteCfg, LiteAxi4, masterRegSlices)),
      slaves      = addressMap.map { case (base, sz) =>
                      SlavePort(liteCfg, LiteAxi4, base, sz, slaveRegSlices) },
      arbitration = arbitration
    )
  }

  /** Build an all-AXI4 (full) config quickly. */
  def allFull(
    numMasters     : Int,
    numSlaves      : Int,
    addrWidth      : Int,
    dataWidth      : Int,
    idWidth        : Int,
    addressMap     : Seq[(BigInt, BigInt)],
    arbitration    : ArbitrationPolicy = RoundRobin,
    masterRegSlices: Boolean = false,
    slaveRegSlices : Boolean = false,
    maxOutstanding : Int = 1
  ): AxiZeroConfig = {
    require(addressMap.size == numSlaves, "addressMap.size must equal numSlaves")

    val fullCfg = Axi4Config(
      addressWidth = addrWidth,
      dataWidth    = dataWidth,
      idWidth      = idWidth
    )

    AxiZeroConfig(
      masters        = Seq.fill(numMasters)(MasterPort(fullCfg, FullAxi4, masterRegSlices)),
      slaves         = addressMap.map { case (base, sz) =>
                         SlavePort(fullCfg, FullAxi4, base, sz, slaveRegSlices) },
      arbitration    = arbitration,
      maxOutstanding = maxOutstanding
    )
  }
}
