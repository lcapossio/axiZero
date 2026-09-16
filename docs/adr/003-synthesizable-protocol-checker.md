# ADR 003 — Write our own synthesizable AXI4 protocol checker

**Status:** Accepted
**Date:** 2026-09-08
**Author:** Leonardo Capossio

---

## Context

Everything that validated this interconnect was value-based. Drive traffic, check the numbers that
come back: 133 simulation tests, six Arty hardware suites, a RISC-V core booting through the fabric,
Dhrystone, a saturating stress load, a video core writing real frames. All of it asks the same
question — did the right data arrive — and none of it asks whether the bus kept the protocol while
delivering it.

The two are not the same. An interconnect can return every correct value while changing an address
mid-handshake, putting `WLAST` on the wrong beat, or answering a response nobody asked for. A
tolerant slave absorbs all of that. The next slave, on the next board, does not, and the failure
then looks like a board bringup problem rather than an interconnect bug.

What was already available did not cover it:

- **`AxiMonitor`** (`hw/sim/`) checks four things — handshake stability, W-beat count, R-beat count,
  ID sanity — and exists only inside SpinalSim.
- **AMD's `axi_protocol_checker`** checks 160 rules and is a Vivado block-design IP. It cannot be
  instantiated in a plain RTL project, it cannot run in SpinalSim, and it cannot be built for Altera
  at all. It has never been in any axiZero bitstream: the base design's `enable_axi_pc` defaults to
  0.
- **Formal.** `formalAsserts()` exists in five places in `Axi4DownsizerExt.scala` and is never
  called; there is no `SpinalFormalConfig` anywhere in the repository.

The designs that matter are exactly the ones the vendor IP cannot reach. VexRiscv is now the
standard validator, and the VexZero SoC is one SpinalHDL-generated Verilog file with no block design,
built for both Vivado (Arty A7-100T) and Quartus (DE25-Nano).

## Decision

Write the checker in SpinalHDL, as a passive `Area`.

**SpinalHDL, not a vendor IP or a simulation-only monitor.** One source then runs in SpinalSim, on
Artix-7 and on Agilex 5. The board is where it earns the most: a bitstream runs the same traffic for
hours at 100 MHz, orders of magnitude more of it than any simulation, and until now none of that was
judged against anything but a handful of firmware-computed values.

**An `Area`, not a `Component`.** It snoops the bus in place, reads only VALID, READY and payload,
and drives nothing. There are no ports to wire, so there is no connection for a mistake to hide in,
and instantiating one cannot change the behaviour of the design it watches.

**Sticky bits, not assertions.** Each rule sets one bit held until reset, and `any` is their OR. A
violation that happens once in a ten-minute board run is still there at the end, reportable through a
single LED or one byte of a UART line. Rule numbering is part of the interface and is append-only.

**Configurable groups, and an honest `overflow`.** Handshake, burst legality, beat counts and
response tracking can each be switched off so a design pays only for what it wants. Running out of
tracking state sets `overflow` rather than raising a rule: that is a fact about the checker, not
about the bus, and conflating them would turn "I stopped watching" into "everything was fine".

**Not a liveness checker.** No X-value checks (they need simulation semantics and mean nothing in
hardware), no exclusive access, no low-power interface, no timing. A bus that stops entirely violates
nothing here. Saying so in the source is the point: an unstated gap reads as coverage.

## Consequences

It found a real bug the first time it was pointed at a loaded crossbar. Both crossbars re-evaluated
their arbitration grant every cycle from the live request vector, so a master raising its request
while an already-granted address waited for `AxREADY` could win the next cycle and change the
address, ID and length presented to the slave — with `AxVALID` never dropping. Nothing was lost, both
requests were real and both were issued eventually, which is precisely why 133 value-based tests and
six hardware suites had all run over it. Fixed with `lockGrant` at all six arbitration sites.

Area is not free. Response tracking allocates a counter per ID value and beat counting allocates a
small FIFO per ID value, so cost scales with `2^idWidth`; `maxTrackedIdWidth` refuses rather than
silently costing more than the design it watches. It is off by default in `VexZeroSocConfig` and on
by default in the two board wrappers.

The checker is only as good as its own tests. `Axi4ProtocolCheckerSpec` shows each rule firing on an
injected violation *and* shows clean traffic of every burst shape leaving it silent, and
`VexZeroProtocolSpec` ends with a control that pushes one illegal burst through a real SoC — because
two silent runs are worth exactly as much as the proof that the checkers can speak.

## Alternatives rejected

**Turn on Vivado's `axi_protocol_checker`.** More rules, and free. It only reaches the MicroBlaze
block designs, which are the suites VexRiscv replaced as the primary validator; it cannot go into
VexZero on either board, and it cannot run in simulation, so a rule it would catch stays uncaught
everywhere the design is actually developed.

**Formal verification instead.** Stronger where it applies, and the right long-term answer for the
adapters. It is not a substitute here: formal proves properties of the RTL, and this checker also
runs inside the bitstream on real traffic for hours, which is a different kind of evidence. Wiring up
the dead `formalAsserts()` remains worth doing separately.

**Extend `AxiMonitor`.** Cheapest, and it would have found the same arbitration bug. It would still
have been simulation-only, so nothing on either board would ever be judged against the protocol.
