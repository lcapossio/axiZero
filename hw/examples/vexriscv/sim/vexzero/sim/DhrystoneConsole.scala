// Copyright (c) 2026 Leonardo Capossio — bard0 design  hello@bard0.com
// SPDX-License-Identifier: MIT
package vexzero.sim

// ---------------------------------------------------------------------------
// DhrystoneConsole  —  reading Dhrystone's own printout
//
// Dhrystone reports on itself: every result it prints is followed by the value
// that result should be. That makes the console, and not any signal in the
// design, the authority on whether the run was correct — so the tests parse it
// rather than trusting a score.
//
// The parsing lives here because more than one test needs it. On the Arty the
// console arrives over a UART; on the DE25-Nano the host drains it over the
// bus; in simulation it is taken straight off the peripheral. Same text, same
// verdict, one implementation.
// ---------------------------------------------------------------------------
object DhrystoneConsole {

  /** Number_Of_Runs, compiled into the prebuilt binary. */
  val runs = 200

  /** One Dhrystone iteration is 1757 VAX instructions, by definition. */
  val vaxDhrystonesPerSecond = 1757.0

  /** Every "X: value" line followed by a "should be: value" line. */
  def selfChecks(text: String): Seq[(String, String, String)] = {
    val lines = text.linesIterator.toIndexedSeq
    for {
      i <- lines.indices.tail
      if lines(i).trim.startsWith("should be:")
      expected = lines(i).trim.stripPrefix("should be:").trim
      actual   = lines(i - 1).split(":", 2).last.trim
      label    = lines(i - 1).split(":", 2).head.trim
    } yield (label, actual, expected)
  }

  /** Cycles Dhrystone itself timed, straight out of its printout. */
  def userCycles(text: String): Long =
    """Clock cycles=(\d+)""".r
      .findFirstMatchIn(text)
      .map(_.group(1).toLong)
      .getOrElse(sys.error(s"Dhrystone printed no cycle count:\n$text"))

  def dmipsPerMhz(cycles: Long): Double = 1e6 * runs / (cycles * vaxDhrystonesPerSecond)

  /** Re-run every check Dhrystone printed, and throw on the first one that disagrees.
    *
    * Returns how many were compared, so a caller can assert the result block was actually there and
    * not merely absent.
    */
  def verify(text: String): Int = {
    val checks = selfChecks(text)
    assert(
      checks.length >= 15,
      s"expected Dhrystone's result block, found ${checks.length} checks in:\n$text"
    )

    for ((label, actual, expected) <- checks if !expected.startsWith("(implementation-dependent")) {
      // The one line Dhrystone prints symbolically rather than as a number.
      val want = if (expected == "Number_Of_Runs + 10") (runs + 10).toString else expected
      assert(actual == want, s"Dhrystone check '$label': got '$actual', should be '$want'")
    }

    // The two pointer prints are the same malloc'd object seen through two
    // records; their value is nobody's business but they must agree, which a
    // crossbar that mixed up two in-flight reads would not manage.
    val pointers = checks.collect { case ("Ptr_Comp", actual, _) => actual }
    assert(pointers.length == 2, s"expected two Ptr_Comp lines, saw ${pointers.length}")
    assert(pointers.distinct.length == 1, s"Ptr_Comp printed ${pointers.mkString(" and ")}")

    checks.length
  }
}
