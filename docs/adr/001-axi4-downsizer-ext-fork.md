# ADR 001 — Fork SpinalHDL Axi4Downsizer as Axi4DownsizerExt

**Status:** Accepted  
**Date:** 2026-03-01  
**Author:** Leonardo Capossio

---

## Context

axiZero inserts a data-width downsizer (`wide fabric → narrow slave port`) whenever a Full AXI4
slave port has a narrower `dataWidth` than the internal fabric.  SpinalHDL 1.10.1 ships
`spinal.lib.bus.amba4.axi.Axi4Downsizer` for this purpose.

Before adopting it we hit two hard `assert` statements in the upstream class:

```scala
assert(!config.useBurst, "Axi4Downsizer does not support bursts")
assert(!config.useId,    "Axi4Downsizer does not support IDs")
```

axiZero's fabric always uses full AXI4 (IDs for response routing, INCR/FIXED/WRAP bursts for
DMA traffic).  Hitting those asserts would make the width-converter unusable for any realistic
configuration.

---

## Decision

Fork `Axi4Downsizer` as `axizero.adapters.Axi4DownsizerExt` (file:
`hw/spinal/axizero/adapters/Axi4DownsizerExt.scala`) and remove both assertions.

Additional changes over upstream:

| Change | Reason |
|--------|--------|
| Remove `assert(!config.useBurst)` | Logic already handles INCR; burst field flows through `assignUnassignedByName` |
| Remove `assert(!config.useId)` | IDs propagate naturally through sub-transaction generator and response path |
| Add FIXED burst support | Downstream slave may see FIXED access; sub-AW must cycle through byte lanes |
| Add WRAP burst support | Required for cache-line refill patterns (e.g., Cortex-A series) |
| Add simulation assertion for reserved burst `0b11` | Catch protocol violations early in sim |
| Rename classes with `Ext` suffix | Avoids import collision with SpinalHDL upstream class |

### Why not upstream the fix?

The upstream guard was intentional — the original code was written before burst/ID support was
added.  Removing the asserts without adding the FIXED/WRAP address logic would silently produce
wrong addresses.  The correct fix (full FIXED/WRAP support) is non-trivial and specific to
axiZero's sub-transaction expansion strategy, making an upstream PR high-risk with uncertain
review timeline.

---

## Consequences

* **Positive:** Full AXI4 width conversion (all burst types, all ID widths) works correctly.
  Verified by `WidthConverterSpec` (6 SpinalSim tests: upsizing, downsizing, passthrough).

* **Negative:** We own the maintenance of this class.  Bugs fixed upstream in `Axi4Downsizer`
  must be manually evaluated and ported.  The relevant upstream file is
  `spinal/lib/src/main/scala/spinal/lib/bus/amba4/axi/Axi4Downsizer.scala` in the SpinalHDL
  repository.

* **Versioning:** Forked from SpinalHDL 1.10.1 (the version pinned in `build.sbt`).  When
  upgrading SpinalHDL, diff the upstream `Axi4Downsizer` against our fork and incorporate any
  relevant fixes.
