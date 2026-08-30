# ADR 002 — Carry VexRiscv as a pinned submodule, in its own sbt project

**Status:** Accepted  
**Date:** 2026-08-30  
**Author:** Leonardo Capossio

---

## Context

axiZero's test suite drives the crossbar with bus functional models. That proves protocol
conformance but not that a real CPU boots through the fabric: BFMs issue the transactions the
test author thought of, and they never stall the way a pipelined core does.

[VexRiscv](https://github.com/SpinalHDL/VexRiscv) is the obvious counterpart. It is a RISC-V
core written in the same language and framework as axiZero, its `IBusSimplePlugin` and
`DBusSimplePlugin` expose AXI4 directly, and it is small enough to elaborate and simulate in
seconds.

Three things had to be decided before adding it.

**How to obtain it.** VexRiscv publishes no artifact to Maven Central — the
`com.github.spinalhdl` group contains only SpinalHDL itself. The options were a git submodule, a
`RootProject(uri(...))` git dependency, or vendoring a pre-generated `VexRiscv.v` netlist.

**Which versions it compiles against.** VexRiscv's own build pins SpinalHDL 1.13.0 and defaults
to Scala 2.12.18. axiZero is on SpinalHDL 1.14.2 and Scala 2.13.12. Two Scala versions cannot
share one classpath, so a sub-build using VexRiscv's own settings was not an option.

**What it must not break.** Every other CI job, and every clean checkout, must behave exactly as
it did before — including for anyone who never fetches the submodule.

---

## Decision

Carry VexRiscv as a git submodule at `third_party/VexRiscv`, pinned by SHA, and compile its
sources in a separate sbt project (`vexZero`, based at `hw/examples/vexriscv`) using *this*
build's Scala and SpinalHDL versions.

- `root` neither aggregates nor depends on `vexZero`, so `sbt compile`, `sbt test`,
  `sbt scalafmtCheck` and `sbt "scalafix --check"` are untouched by its presence or absence.
- `vexZero` fails with `Run: git submodule update --init third_party/VexRiscv` rather than a
  wall of "not found: vexriscv" errors when the submodule is missing.
- `.gitmodules` records no branch for it: the pinned SHA is the only thing that selects a
  version, so `--remote` cannot silently move it.
- `.scalafmt.conf` excludes `third_party/`, so formatting checks cover the example's own sources
  and never rewrite vendored code.
- One CI job initialises only this submodule — not `submodules: true`, which would also pull
  `fcapz` for no reason.

VexRiscv commit `6807560` compiles clean against SpinalHDL 1.14.2 and Scala 2.13.12; only
deprecation and non-exhaustive-match warnings appear, all pre-existing upstream.

---

## Consequences

**Good**

- The interconnect is exercised by a real bus master: a stalling, out-of-order-issuing pipeline
  rather than a BFM script.
- No cross compiler and no binary blob. The boot firmware is assembled by `vexzero.Rv32`, a
  small RV32I encoder, so `sbt vexZero/test` runs on a plain JDK. Its output was verified
  byte-identical to `riscv64-unknown-elf-as` for the whole program.
- The example doubles as documentation for wiring a non-trivial master to `AxiZeroMixedTop`.

**Bad**

- One more submodule to initialise, and a CI job that clones ~14 MB.
- The pin has to be advanced by hand when a newer VexRiscv is wanted, and a SpinalHDL upgrade in
  `build.sbt` can break the example before it breaks anything else. That is the point of the
  dedicated CI job.

---

## Alternatives rejected

**`RootProject(uri("https://github.com/SpinalHDL/VexRiscv.git#<sha>"))`.** sbt clones it
automatically, so no submodule — but the checkout is built with VexRiscv's *own* `build.sbt`,
which pins Scala 2.12.18 and SpinalHDL 1.13.0. A project reference cannot override those, and a
2.12 project cannot be depended on from a 2.13 one.

**Vendor a pre-generated `VexRiscv.v` and wrap it in a `BlackBox`.** Removes the submodule and
the compile cost, but tracks a build artifact in git, gives up the ability to reconfigure the
CPU's plugins from Scala, and makes the example unsimulatable in SpinalSim without shipping the
netlist alongside.

**Aggregate `vexZero` under `root`.** Would make `sbt test` cover the example, at the cost of
breaking every command in the repository for anyone without the submodule.
