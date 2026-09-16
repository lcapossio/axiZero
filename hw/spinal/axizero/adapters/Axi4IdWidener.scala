// Copyright (c) 2026 Leonardo Capossio — bard0 design  hello@bard0.com
// SPDX-License-Identifier: MIT
package axizero.adapters

import spinal.core._
import spinal.lib._
import spinal.lib.bus.amba4.axi._

// ---------------------------------------------------------------------------
// Axi4IdWidener
//
// Pads a master port's ID up to the fabric ID width and drops the padding on
// the way back.  A design may mix masters that use different numbers of IDs
// (a CPU with a single ID next to a generator with four); the fabric carries
// the widest of them, so the narrower ports need their requests zero-extended.
//
// Stateless: the padding bits are constant zero on the request path, so a
// response for this master always carries the same zeros and truncating the
// returned ID is exact.  Everything other than the ID passes through
// untouched; the two configs must be identical apart from the ID width.
// ---------------------------------------------------------------------------
class Axi4IdWidener(inCfg: Axi4Config, outCfg: Axi4Config) extends Component {
  require(
    inCfg.idWidth <= outCfg.idWidth,
    s"Axi4IdWidener only widens IDs (in=${inCfg.idWidth}, out=${outCfg.idWidth})"
  )
  require(
    inCfg.copy(idWidth = outCfg.idWidth) == outCfg,
    "Axi4IdWidener requires two configs that differ only in idWidth"
  )

  val io = new Bundle {
    val input  = slave(Axi4(inCfg))   // master side, narrow IDs
    val output = master(Axi4(outCfg)) // fabric side, full-width IDs
  }

  // Copy a channel payload field by field. The two bundles hold the same
  // fields in the same order; only the ID members differ in width, and a
  // resize is what this component exists to do -- zero-extending on the way
  // out, truncating on the way back.
  private def copyPayload(dst: Bundle, src: Bundle): Unit =
    for ((name, d) <- dst.elements) {
      val s = src.find(name)
      (d, s) match {
        case (du: UInt, su: UInt) if du.getWidth != su.getWidth => du := su.resized
        case _                                                  => d  := s
      }
    }

  private def forward[T <: Bundle](to: Stream[T], from: Stream[T]): Unit = {
    to.valid   := from.valid
    from.ready := to.ready
    copyPayload(to.payload, from.payload)
  }

  forward(io.output.aw, io.input.aw)
  forward(io.output.w, io.input.w)
  forward(io.input.b, io.output.b)
  forward(io.output.ar, io.input.ar)
  forward(io.input.r, io.output.r)
}
