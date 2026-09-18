# axiZero Verification Coverage Report

Status as of 2026-09-18 — 181 SpinalSim tests in 27 suites, 24 VexZero SoC tests in 10
suites, 36 cocotb tests in 6 suites, and 2 SymbiYosys proofs, all passing. Every design
listed below is also built and run on an Arty A7-100T (Vivado) and a DE25-Nano (Quartus).

---

## Current Test Coverage

### What is well covered

| Area | Suites | Notes |
|------|--------|-------|
| Address routing / decode | all 6 cocotb suites + SpinalSim | Writes to each slave verified via read-back |
| Single-beat read/write | all suites | AXI4-Lite and full AXI4 |
| INCR bursts (16, 64 beats) | `full`, `qos` cocotb + `PipelinedCrossbarSpec` | Multi-beat write + per-beat read-back |
| Multi-master WRR arbitration | `wrr` cocotb + `ArbitrationSpec` | Bandwidth proportionality, starvation prevention |
| Multi-master QoS arbitration | `qos` cocotb + `QosCrossbarSpec` | Priority ordering, aging, round-robin tie-break |
| IPIF simultaneous handshake | `ipif` cocotb + `IpifWriteSpec` | Strict AWVALID+WVALID contract |
| AXI3 adapter (WID reorder) | `Axi3ToAxi4Spec` + `Axi3MixedCrossbarSpec` | Single-beat, burst, interleaving, locked→SLVERR |
| Width conversion (32↔64) | `WidthConverterSpec` + `NarrowPortSpec` | Upsize, downsize, passthrough |
| FIXED/WRAP burst downsizing | `BurstTypeSpec` | SpinalSim only — not in cocotb |
| Pipelined mode (maxOutstanding>1) | `PipelinedArbitrationSpec` | FP, WRR, QoS with concurrent bursts |
| Backpressure (B-channel) | `ipif` cocotb (`test_ipif_backpressure`) | Master holds bready low |
| Same-ID ordering / SSPID | `MultiIdOrderingSpec`, `AxiMultiIdGenSpec`, `Axi4OrderingProbeSpec` | Per-ID response order and single-slave-per-ID, plus a formal proof (`write_response_routing.sby`) |
| Write-response identity | `MultiIdOrderingSpec`, `AxiMultiIdGenSpec` | A per-ID expectation queue catches a B delivered under the wrong ID — which needs a target answering something other than OKAY |
| Error responses (SLVERR / DECERR) | `DecodeErrorSpec`, `MultiIdOrderingSpec`, `AxiMultiIdGenSpec` | Decode errors from the fabric's own responder; a slave returning SLVERR |
| Protocol compliance (synthesizable) | `Axi4ProtocolCheckerSpec` + every VexZero board build | One passive checker per fabric port, on hardware as well as in simulation. See ADR 003 |
| Register slices / skid buffers | `RegSliceSkidSpec`, `RegSliceAndLiteWidthSpec`, `Axi3MixedCrossbarSpec` | Full, Lite and Axi3Mode, both sides; capacity while stalled, READY-arc recovery, throughput, plus a formal proof (`axis_ready_valid_regslice.sby`) |
| Channel skew / response stability | `ChannelSkewSpec`, `ResponseStabilitySpec` | AW/W arriving apart; payload stable while VALID && !READY |
| Real CPU through the fabric | VexZero suites + both boards | VexRiscv boots and runs its self test while traffic generators saturate the crossbar |

### Gaps — not tested

| Gap | Severity | Notes |
|-----|----------|-------|
| **Narrow transfers (sub-word WSTRB)** | HIGH | Every cocotb write uses full strobe. `NarrowPortSpec` drives a partial strobe, but no test verifies that untouched bytes are preserved. |
| **WRAP / FIXED bursts in cocotb** | HIGH | Only INCR tested in cocotb. SpinalSim covers WRAP/FIXED via `BurstTypeSpec` but generated Verilog is never exercised with non-INCR. |
| **Mid-burst backpressure** | HIGH | No test where slave holds WREADY low mid-burst or master stalls WVALID between beats. |
| **Varied burst lengths** | MEDIUM | Only 1, 4, 16, 64 tested. No 2, 3, 8, 32. |
| **Unaligned addresses** | MEDIUM | All accesses are naturally aligned. |
| **ID interleaving in cocotb** | LOW | Covered in SpinalSim and on both boards by the multi-ID generators, but no cocotb test issues multiple outstanding reads with different IDs against the generated Verilog. |
| **Write-data ordering in cocotb** | LOW | `ChannelSkewSpec` covers AW/W skew in SpinalSim, but `AxiMaster.write()` always presents AW+W together, so the generated Verilog never sees split ordering. |
| **Exclusive access (AWLOCK)** | LOW | Not exercised. `AxiMaster` API does not expose AWLOCK. |
| **Cache/protection attributes** | LOW | BFM does not expose AWCACHE/AWPROT for targeted testing. |

---

## BFM & Protocol Checking

*The survey below is what was read before ADR 003 was written. The decision it led to —
a synthesizable checker of axiZero's own, in `hw/spinal/axizero/verif/Axi4ProtocolChecker.scala`
— is in place and runs on both boards. The survey is kept for the reasoning, not as a
statement of what is missing.*

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
| Protocol compliance checking | Strong — synthesizable checker on every fabric port, in simulation and on both boards |
| Same-ID ordering / response identity | Strong — simulation, formal, and both boards |
| Error response handling | Strong — SLVERR and DECERR paths exercised, including on hardware |
| Narrow / sub-word transfers | Weak — no byte-preservation test |
| Mid-burst backpressure | Not tested |
| Exclusive access (AWLOCK) | Not tested |
