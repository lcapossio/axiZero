# ADR 004 — Retire the MicroBlaze hardware suites; validate on VexRiscv, on both vendors

**Status:** Accepted
**Date:** 2026-09-08
**Author:** Leonardo Capossio

---

## Context

axiZero claims to be a vendor-neutral AXI interconnect. Its hardware validation was not.

Six suites ran on an Arty A7-100T — base, wrr, qos, qos_stress, axi3, axis — and each was built
around a Xilinx MicroBlaze. Counted from their `create_project*.tcl`, each pulls in ten or eleven
Xilinx IP cores (`microblaze`, `axi_bram_ctrl`, `axi_gpio`, `axi_uartlite`, `lmb_bram_if_cntlr`,
`lmb_v10`, `mdm`, `blk_mem_gen`, `proc_sys_reset`, `xlconstant`, `xlslice`) plus a block design.
None of that can be built for Altera. So the only evidence that the interconnect worked in silicon
was evidence about one vendor's silicon, and the DE25-Nano (Agilex 5) port — which exists, and which
runs the same RTL — had nothing corresponding to it.

That is not merely an aesthetic problem. Three of the six suites existed to test arbitration under
contention, which is the part of a crossbar most likely to behave differently once real timing and
real memory latency are involved. Having that only on Artix-7 meant a whole class of question was
being answered for half the supported hardware.

The suites also could not be extended cheaply. Adding a master meant editing a block design; adding
a check meant editing MicroBlaze C and rebuilding with `mb-gcc`, a toolchain the VexZero flow does
not need at all. One of them had already produced a hardware failure caused by traffic generators
writing status words into aliased BRAM — a defect in the reporting mechanism, not in the thing under
test.

What was worth keeping was not the Xilinx half. The traffic generators in
`hw/vivado/arty_a7/ip/rtl/` — `axi_sat_gen.v` above all — are our own portable Verilog. Only the CPU
and the peripherals were the lock.

Meanwhile [`VexZero`](../../hw/examples/vexriscv) already ran on both boards: a real RISC-V core
booting through the crossbar, written in SpinalHDL like axiZero itself, so it simulates end to end
with no vendor toolchain and generates for Vivado and Quartus from one source.

## Decision

Retire the six MicroBlaze suites and rebuild what they covered on VexZero, for both vendors.

Three things were needed to make that a real replacement rather than a smaller one.

**A synthesizable load.** [`AxiSatGen`](../../hw/spinal/axizero/verif/AxiSatGen.scala) is the
SpinalHDL successor to `axi_sat_gen.v`: a saturating, self-checking AXI4 master that plugs into a
crossbar port. It keeps several bursts in flight, so AW runs ahead of W and of B; a master that
waits for each response before issuing the next address never makes an arbiter choose. VexRiscv on
its own cannot supply that load — measured on this SoC running Dhrystone, its two ports both want
the bus in about one cycle in a hundred, and being write-through with no dirty bit it cannot produce
a write burst at all. With two generators attached the fabric is contended for 97% of the run.

**A verdict that is a wire.** The generator reads back every word it wrote, which needs no stored
reference because the data is a function of the address. Its result comes out on `io.genOk` and
folds into `VexZeroChecks` beside the firmware's own checks, so there is no status word in memory
for anything to alias and no firmware polling loop to get wrong. The Arty prints it as one more
letter on its serial line; the DE25-Nano publishes it, with the protocol-checker and stream verdicts,
in a system-control register the host reads back across the crossbar under test.

**One definition of each configuration.**
[`VexZeroStress`](../../hw/examples/vexriscv/spinal/vexzero/VexZeroStress.scala) holds the four
loaded builds — round robin, weighted 3:1, QoS across three ranks, and round robin with the CPU's
load/store path routed through the AXI3 adapter. The simulation spec and both board generators build
from it. A hardware run confirms a simulation only if the two were the same design, and this makes
that structural rather than a matter of keeping two files in step.

The AXI4-Stream suite gets no build of its own. `AxiStreamArtySmoke` shares nothing with the bus but
the clock, so it rides in all four stress builds as an island; what the retired suite needed a
MicroBlaze for was reading its status word, and here that is a wire.

**Nothing is deleted.** The retired scripts still work and stay in the tree with a retirement notice
and [`RETIRED.md`](../../hw/vivado/arty_a7/RETIRED.md) mapping each to its replacement. What changed
is that they are not run, not maintained, and not a gate on a push.

## Consequences

- Every hardware claim about arbitration now holds on Artix-7 *and* Agilex 5, from one source.
- The suites test more than they did. The retired ones checked values; these also judge the bus
  against AXI4 continuously, on every fabric port, for the whole run.
- `mb-gcc` leaves the required toolchain list. A hardware run needs Vivado plus xsdb, or Quartus.
- Five bitstreams per board replace six, because `stress_qos` covers what qos and qos_stress covered
  separately and the stream island needs no build of its own.
- The MicroBlaze scripts will rot. They are not compiled or run by anything, so an RTL change can
  break them silently. That is the accepted cost of retiring rather than deleting: the history and
  the portable Verilog stay available, and `RETIRED.md` says plainly that they are frozen.
- The generators are closed-loop, each waiting on its own responses, so a 3:1 weight buys a 1.78:1
  share rather than 3:1. That is a property of the stimulus, not of the arbiter, and the tests assert
  the direction and the absence of starvation rather than a ratio that would only describe this
  particular load.

## Alternatives rejected

**Keep the MicroBlaze suites as a second opinion.** Tempting — two independent CPUs finding the same
answer is stronger than one. But they were not independent evidence about the crossbar; they were
evidence about the crossbar plus ten Xilinx IPs, on one vendor, and keeping them meant keeping a
`mb-gcc` dependency and a block-design edit path for every future change. The value of a second
opinion did not survive the cost of maintaining it in a repository whose central claim is
vendor-neutrality.

**Port MicroBlaze designs to Altera.** Not possible; that is the whole problem.

**Use a Nios V equivalent on the DE25-Nano.** This would double the vendor-specific surface rather
than remove it — two CPUs, two block-design flows, two firmware toolchains — to end up with two
single-vendor suites instead of one.

**Reuse the Verilog generators inside VexZero.** `axi_sat_gen.v` is portable and would have worked.
Porting it to SpinalHDL instead means it elaborates against the SoC's own bus config, simulates in
SpinalSim with the rest of the design, is checked by the same protocol checker that guards the
fabric, and reports through wires rather than memory. The Verilog stays in the tree; nothing was
lost by not depending on it.

**Load the fabric with the CPU alone, with caches tuned to miss.** Already measured in
`VexZeroProfileSpec`: a 512-byte data cache raises the load/store port to 3,327 line refills and
still produces no write bursts and almost no contention. A CPU is the wrong instrument for this.
