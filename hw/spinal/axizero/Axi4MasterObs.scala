// Copyright (c) 2026 Leonardo Capossio - bard0 design  hello@bard0.com
// SPDX-License-Identifier: MIT
package axizero

import spinal.core._
import spinal.lib.bus.amba4.axi._

/** What a passive observer needs to see of a master port, brought out as an output.
  *
  * The crossbar's own master ports are where admission is decided: READY there is the arbiter and
  * the ordering table answering, not a register slice accepting a request into storage. They are
  * also two components deep, so nothing outside the fabric can read them -- which is why this
  * exists. A design that wants to watch what the crossbar did, rather than what its masters asked
  * for, turns on `observeMasters` and gets one of these per master port.
  *
  * Requests and responses only: an observer of ordering needs who asked, where, and whether it was
  * taken. Data and the write channel are deliberately absent -- they would double the width of this
  * for nothing, and a protocol checker on the external port already watches them.
  *
  * Costs nothing when unused. The signals are copies of wires that already exist, so anything not
  * read is pruned before synthesis.
  */
case class Axi4MasterObs(config: Axi4Config) extends Bundle {
  val arValid = Bool()
  val arReady = Bool()
  val arId    = UInt(config.idWidth bits)
  val arAddr  = UInt(config.addressWidth bits)

  val rValid = Bool()
  val rReady = Bool()
  val rId    = UInt(config.idWidth bits)
  val rLast  = Bool()

  val awValid = Bool()
  val awReady = Bool()
  val awId    = UInt(config.idWidth bits)
  val awAddr  = UInt(config.addressWidth bits)

  val bValid = Bool()
  val bReady = Bool()
  val bId    = UInt(config.idWidth bits)

  /** Snapshot a bus into this bundle. Reads only; drives nothing on the bus. */
  def watch(bus: Axi4): Unit = {
    arValid := bus.ar.valid
    arReady := bus.ar.ready
    arId    := (if (bus.config.useId) bus.ar.id.resized else U(0))
    arAddr  := bus.ar.addr.resized

    rValid := bus.r.valid
    rReady := bus.r.ready
    rId    := (if (bus.config.useId) bus.r.id.resized else U(0))
    rLast  := (if (bus.config.useLast) bus.r.last else True)

    awValid := bus.aw.valid
    awReady := bus.aw.ready
    awId    := (if (bus.config.useId) bus.aw.id.resized else U(0))
    awAddr  := bus.aw.addr.resized

    bValid := bus.b.valid
    bReady := bus.b.ready
    bId    := (if (bus.config.useId) bus.b.id.resized else U(0))
  }
}
