# axiZero Verification Coverage Report

Status as of 2026-04-06 — 86 SpinalSim + 28 cocotb tests passing.

---

## Current Test Coverage

### What is well covered

| Area | Suites | Notes |
|------|--------|-------|
| Address routing / decode | all 5 cocotb suites + SpinalSim | Writes to each slave verified via read-back |
| Single-beat read/write | all suites | AXI4-Lite and full AXI4 |
| INCR bursts (16, 64 beats) | `full`, `qos` cocotb + `PipelinedCrossbarSpec` | Multi-beat write + per-beat read-back |
| Multi-master WRR arbitration | `wrr` cocotb + `ArbitrationSpec` | Bandwidth proportionality, starvation prevention |
| Multi-master QoS arbitration | `qos` cocotb + `QosCrossbarSpec` | Priority ordering, aging, round-robin tie-break |
| IPIF simultaneous handshake | `ipif` cocotb + `IpifWriteSpec` | Strict AWVALID+WVALID contract |
| AXI3 adapter (WID reorder) | `Axi3ToAxi4Spec` + `Axi3MixedCrossbarSpec` | Single-beat, burst, interleaving, locked→SLVERR |
| Width conversion (32↔64) | `WidthConverterSpec` + `NarrowPortSpec` | Upsize, downsize, passthrough |
| FIXED/WRAP burst downsizing | `BurstTypeSpec` | SpinalSim only — not in cocotb |
| Register slices | `RegSliceAndLiteWidthSpec` + `Axi3MixedCrossbarSpec` | Full, Lite, Axi3Mode, both sides |
| Pipelined mode (maxOutstanding>1) | `PipelinedArbitrationSpec` | FP, WRR, QoS with concurrent bursts |
| Backpressure (B-channel) | `ipif` cocotb (`test_ipif_backpressure`) | Master holds bready low |

### Gaps — not tested

| Gap | Severity | Notes |
|-----|----------|-------|
| **Narrow transfers (sub-word WSTRB)** | HIGH | Every cocotb write uses full strobe. Never verified that untouched bytes are preserved. |
| **WRAP / FIXED bursts in cocotb** | HIGH | Only INCR tested in cocotb. SpinalSim covers WRAP/FIXED via `BurstTypeSpec` but generated Verilog is never exercised with non-INCR. |
| **Mid-burst backpressure** | HIGH | No test where slave holds WREADY low mid-burst or master stalls WVALID between beats. |
| **Varied burst lengths** | MEDIUM | Only 1, 4, 16, 64 tested. No 2, 3, 8, 32. |
| **Response error injection (SLVERR/DECERR)** | MEDIUM | All slaves return OKAY. Error path never exercised. |
| **ID interleaving / out-of-order** | MEDIUM | No cocotb test issues multiple outstanding reads with different IDs and verifies RID matching. |
| **Unaligned addresses** | MEDIUM | All accesses are naturally aligned. |
| **Write-data ordering (AW before W, W before AW)** | LOW | `AxiMaster.write()` always presents AW+W together. No test of split ordering. |
| **Exclusive access (AWLOCK)** | LOW | Not exercised. `AxiMaster` API does not expose AWLOCK. |
| **Cache/protection attributes** | LOW | BFM does not expose AWCACHE/AWPROT for targeted testing. |

---

## BFM & Protocol Checking

### Current state

The cocotb suites use **cocotbext-axi** (MIT, Alex Forencich) for BFMs:

- `AxiLiteMaster` / `AxiMaster` — drive transactions
- `AxiLiteRam` / `AxiRam` — slave memory models
- Custom `IpifRam` — strict IPIF slave model

**These are BFMs, not protocol checkers.** They do not independently
assert AXI protocol compliance. If the DUT drops AWVALID early, changes
ARADDR after valid without ready, or violates burst boundary rules, the
BFMs will not flag it. Only data correctness is verified.

### Available open-source AXI protocol checkers

| Tool | License | Protocols | Integration | Limitations |
|------|---------|-----------|-------------|-------------|
| **ZipCPU faxil_slave** | Apache 2.0 | AXI4-Lite (mature), AXI4 (partial) | `instantiate` under `ifdef FORMAL`, run with SymbiYosys | AXI4-full properties incomplete |
| **YosysHQ SVA-AXI4-FVIP** | ISC | AXI4-Full, AXI4-Lite, AXI4-Stream | `bind` or instantiate, per-channel modules | Requires commercial Tabby CAD tooling |
| **ARM Axi4PC (BP062)** | Proprietary | AXI3, AXI4, AXI4-Lite, AXI-Stream | `bind` in testbench | Not legally redistributable; ARM download page currently unavailable |
| **AMD/Xilinx AXI Protocol Checker** | Free w/ Vivado | AXI3, AXI4, AXI4-Lite | Vivado IP Catalog, synthesizable | Vivado-only |
| **PULP Platform axi** | SHL-0.51 | AXI4 | Scoreboard + bus compare modules | Data correctness, not protocol rules |
| **dh73 A_Formal_Tale** | See repo | AXI4, AXI4-Lite | SVA bind in formal flow | Educational/beta status |
| **tvip-axi** | Apache 2.0 | AXI4, AXI4-Lite | UVM agents (VCS/Xcelium) | Requires commercial simulators |

### Recommendations for axiZero

**Best fit for formal verification (already using SymbiYosys):**

- **ZipCPU `faxil_slave`** (Apache 2.0) for AXI4-Lite interfaces.
  Instantiate inside the formal wrapper alongside our existing properties.
  Mature, well-documented, open-source SymbiYosys compatible.
  - Repo: https://github.com/ZipCPU/wb2axip (`bench/formal/faxil_slave.v`)
  - Tutorial: https://zipcpu.com/formal/2018/12/28/axilite.html

**Best fit for simulation-time protocol checking:**

- **ARM Axi4PC** via `bind` in a Verilog testbench wrapper.
  The SVA assertions fire on protocol violations during Verilator/xsim runs.
  Legally, the files are ARM-proprietary — check your license terms.

**Best fit if using Vivado for hardware validation:**

- **AMD AXI Protocol Checker IP** from the Vivado IP Catalog.
  Free, synthesizable, can monitor live FPGA traffic on the Arty A7.

---

## SpinalHDL Simulation Utilities

SpinalHDL provides `spinal.lib.bus.amba4.axi.sim`:

- `Axi4Master` — simulation master agent
- `Axi4ReadOnlyMonitor` / `Axi4WriteOnlyMonitor` — passive monitors
- Slave agents for read/write

These are **BFMs and monitors**, not protocol assertion checkers.
axiZero's `SimHelpers.scala` wraps these in convenience functions
(`fullWrite`, `fullRead`, `spawnFullSlave`, etc.).

---

## Summary

| Dimension | Coverage |
|-----------|----------|
| Functional correctness (data integrity) | Strong |
| Address decode / routing | Strong |
| Arbitration (RR, FP, WRR, QoS) | Strong |
| Burst types (INCR) | Strong |
| Burst types (WRAP, FIXED) | SpinalSim only |
| Protocol compliance checking | None (BFMs only) |
| Narrow / sub-word transfers | Not tested |
| Mid-burst backpressure | Not tested |
| Error response handling | Not tested |
