# axiZero

[![CI](https://github.com/lcapossio/axiZero/actions/workflows/ci.yml/badge.svg)](https://github.com/lcapossio/axiZero/actions/workflows/ci.yml)
[![License: MIT](https://img.shields.io/badge/License-MIT-blue.svg)](LICENSE)
[![Board](https://img.shields.io/badge/HW--validated-Arty%20A7--100T-green)](hw/vivado/arty_a7/)

Author: Leonardo Capossio — bard0 design hello@bard0.com

Open source AXI4 / AXI4-Lite interconnect generator. Describe your bus topology in YAML, get Verilog. Or use a [pre-built output](generated/) directly.

MIT licensed. Built with [SpinalHDL](https://spinalhdl.github.io/SpinalDoc-RTD/).

Hardware-validated on Xilinx Arty A7-100T. 103 SpinalSim + 36 cocotb tests pass.

---

## Table of contents

- [What it does](#what-it-does)
- [Comparison](#comparison)
- [Quick start](#quick-start)
  - [Option A — generate from YAML](#option-a--generate-from-yaml)
  - [Option B — use a pre-built Verilog file](#option-b--use-a-pre-built-verilog-file)
- [YAML configuration reference](#yaml-configuration-reference)
  - [Top-level keys](#top-level-keys)
  - [Master port keys](#master-port-keys)
  - [Slave port keys](#slave-port-keys)
  - [Arbitration modes](#arbitration-modes)
  - [Data-width conversion](#data-width-conversion)
  - [Pipelined vs blocking mode](#pipelined-vs-blocking-mode)
  - [AXI4-Stream utility cores](#axi4-stream-utility-cores)
- [Simulation](#simulation)
  - [SpinalSim (unit tests)](#spinalsim-unit-tests-run-with-sbt)
  - [cocotb (integration tests)](#cocotb-integration-tests-against-pre-built-verilog-run-with-python)
- [Example system — VexRiscv SoC](#example-system--vexriscv-soc)
  - [Running it](#running-it)
  - [No cross compiler required](#no-cross-compiler-required)
  - [On hardware](#on-hardware)
  - [Benchmark — Dhrystone](#benchmark--dhrystone)
  - [What Dhrystone does not test](#what-dhrystone-does-not-test)
  - [Stress — the crossbar under load](#stress--the-crossbar-under-load)
  - [A second board — DE25-Nano (Agilex 5)](#a-second-board--de25-nano-agilex-5)
- [Hardware validation — Arty A7-100T](#hardware-validation--arty-a7-100t)
- [Port naming](#port-naming)
- [Tool integration](#tool-integration)
- [Project structure](#project-structure)
- [License](#license)

---

## What it does

axiZero generates a non-blocking AXI interconnect that routes M masters to N slaves based on a static address map. Each port can be independently configured as AXI4 or AXI4-Lite; the required adapters are inserted automatically.

**Implemented and working:**

- AXI4 full (with IDs, bursts, outstanding transactions)
- AXI4-Lite (no IDs, single-beat)
- Per-port mixed AXI4 / AXI4-Lite with automatic adapter insertion
- AXI4-Lite data-width conversion (zero-extend / truncate at port boundaries)
- Full AXI4 data-width conversion — burst-splitting upsizer and downsizer at port boundaries; all three burst types (FIXED, INCR, WRAP) supported
- Register slices, per master and per slave port
- Round-robin, fixed-priority, and weighted round-robin arbitration
- QoS arbitration (highest AXQOS wins) with aging-based anti-starvation
- Pipelined mode (`max_outstanding > 1`) with per-slave W-route FIFOs and ID-based response routing
- IPIF compatibility — AW and W are presented simultaneously to slaves that require it
- YAML → Verilog generator with port-name post-processing for Vivado AXI naming conventions
- AXI3-to-AXI4 bridge adapter with WID reorder buffer (write interleaving → strict AW-order), locked access conversion, LEN/LOCK field adaptation

- Standalone AXI4-Stream utility cores: register slice, width adapter, FIFO, packet arb-mux, packet demux, broadcaster
- VexRiscv example SoC: a RISC-V core booting through the crossbar into a mixed AXI4 / AXI4-Lite address map, in simulation and on an Arty A7-100T
- Dhrystone 2.1 on that SoC, in simulation and on the board, with per-port AXI latency and occupancy measured at the crossbar
- A system-level stress test: the same SoC with caches on and a third master saturating the fabric — 85.7% of cycles contended, 859,209 burst beats checked against their expected values while the program on top still passes all 20 of its own self-checks
- The same SoC on two FPGA families — Xilinx Artix-7 and Altera Agilex 5 — with a JTAG-to-AXI bridge acting as a third bus master on the board that has no UART

**Not yet implemented:**

- Clock domain crossing: all ports share a single clock (`aclk`) and reset (`aresetn`).
- AXI4-Lite crossbar pipelined mode: the Lite-only path is always single-outstanding per slave.

---

## Comparison

| | axiZero | PULP axi | verilog-axi | taxi | dpretet/axi-crossbar |
|---|:---:|:---:|:---:|:---:|:---:|
| License | MIT | SHL-0.51 | MIT | CERN-OHL-S¹ | MIT |
| AXI4 full | ✓ | ✓ | ✓ | ✓ | ✓ |
| AXI4-Lite | ✓ | ✓ | ✓ | ✓ | ✓ |
| Per-port mixed AXI4/Lite | ✓ | — | — | — | — |
| AXI4-Lite data-width conversion | ✓ | ✓ | ✓ | ✓ | — |
| Full AXI4 data-width conversion | ✓ | ✓ | ✓ | ✓ | — |
| Register slices | ✓ | ✓ | ✓ | ✓ | — |
| Round-robin / fixed-priority | ✓ | ✓ | ✓ | ✓ | ✓ |
| Weighted round-robin | ✓ | ✓ | — | — | ✓ |
| QoS arbitration | ✓ | ✓ | — | — | ✓ |

¹ CERN-OHL-S is copyleft (share-alike); requires releasing your full digital design on request.

---

## Quick start

### Option A — generate from YAML

Requirements: Python 3.8+ with PyYAML, Java 21+, [sbt](https://get-coursier.io/).

On Linux or WSL, Verilator 5.x is also required (SpinalHDL invokes it internally during `sbt` compilation and simulation).

#### Installing the toolchain (automated)

An install script handles Java, sbt, Verilator, and Python packages. It detects whether you are on Linux, WSL, macOS, or Windows and runs the appropriate package manager commands.

```bash
# Check what is / isn't installed
python scripts/install_deps.py --check

# Install everything
python scripts/install_deps.py
```

On Windows the script uses **winget**. On macOS it uses **Homebrew** (must be installed first). On Linux/WSL it uses **apt**. Note that Verilator and cocotb simulation require Linux or WSL — on Windows, install [WSL Ubuntu 24.04](https://learn.microsoft.com/en-us/windows/wsl/install) and run the script from inside it.

#### Installing manually

**Java 21** (required by sbt/SpinalHDL):

```bash
# Ubuntu / Debian / WSL
sudo apt-get install -y temurin-21-jdk        # via adoptium.net apt repo, or:
sudo apt-get install -y openjdk-21-jdk        # standard OpenJDK

# macOS (Homebrew)
brew install --cask temurin@21

# Windows: download from https://adoptium.net/
```

**sbt** (Scala build tool):

```bash
# Ubuntu / Debian / WSL — one-liner from sbt docs
echo "deb https://repo.scala-sbt.org/scalasbt/debian all main" \
  | sudo tee /etc/apt/sources.list.d/sbt.list
curl -sL "https://keyserver.ubuntu.com/pks/lookup?op=get&search=0x2EE0EA64E40A89B84B2DF73499E82A75642AC823" \
  | sudo apt-key add -
sudo apt-get update && sudo apt-get install -y sbt

# macOS
brew install sbt

# Windows: download the MSI from https://www.scala-sbt.org/download/
```

**Verilator 5.x** (Linux / WSL only; used to validate generated output):

```bash
sudo apt-get install -y verilator     # Ubuntu 24.04 ships Verilator 5.x
```

#### Generating Verilog

```bash
pip install pyyaml

# Print a working example config
python scripts/axizero.py example > my_design.yaml

# Generate Verilog
python scripts/axizero.py generate my_design.yaml --output rtl/
```

### Option B — use a pre-built Verilog file

Fifteen configurations are pre-generated in [`generated/`](generated/). Copy the appropriate file into your project and instantiate it.

Resource usage is post-synthesis, out-of-context, Vivado 2025.2 targeting
xc7a100tcsg324-1 with no timing constraint applied; Fmax is derived from the
worst-case path Vivado reports under those conditions, so treat it as an upper
bound rather than a closed-timing figure. `n/a` means the design had no
internal path for Vivado to rank. Regenerate the whole table with
`vivado -mode batch -source hw/vivado/synth_resource_usage.tcl`. No BRAM or DSP
is used by any configuration.

| File | Description | LUTs | FFs | LUTRAM | Fmax (MHz) |
|---|---|---:|---:|---:|---:|
| `MyLite_1M4S.v` | 1M×4S AXI4-Lite, round-robin | 237 | 8 | 0 | 400.0 |
| `AxiZeroLite_1M4S.v` | 1M×4S AXI4-Lite, round-robin (wider addr) | 237 | 8 | 0 | n/a |
| `MyLite_2M2S_WRR.v` | 2M×2S AXI4-Lite, weighted round-robin (3:1) | 352 | 286 | 0 | 208.3 |
| `MyLite_2M4S_FP.v` | 2M×4S AXI4-Lite, fixed priority | 527 | 16 | 0 | 400.0 |
| `AxiZeroLite_2M4S_RS.v` | 2M×4S AXI4-Lite, register slices on all ports | 656 | 784 | 0 | n/a |
| `AxiZeroLite_4M4S_FP.v` | 4M×4S AXI4-Lite, fixed priority | 1292 | 24 | 0 | n/a |
| `MyFull_2M2S.v` | 2M×2S AXI4 Full, 64-bit, round-robin | 582 | 12 | 0 | 384.6 |
| `MyFull_2M2S_QoS.v` | 2M×2S AXI4 Full, 64-bit, QoS arbitration | 626 | 62 | 4 | 117.6 |
| `MyMixed_2M3S.v` | 2M×3S mixed (Full + Lite), auto adapters | 421 | 34 | 0 | 312.5 |
| `MyAxisRegSlice.v` | AXI4-Stream register slice, 32-bit | 2 | 42 | 0 | 500.0 |
| `MyAxisWidth_8To32.v` | AXI4-Stream width adapter, 8→32-bit | 10 | 44 | 0 | 333.3 |
| `MyAxisFifo.v` | AXI4-Stream FIFO, 32-bit | 42 | 57 | 28 | 294.1 |
| `MyAxisMux_2To1.v` | AXI4-Stream arb-mux, 2→1, round-robin | 49 | 3 | 0 | 434.8 |
| `MyAxisDemux_1To2.v` | AXI4-Stream demux, 1→2 | 6 | 3 | 0 | 434.8 |
| `MyAxisBroadcaster_1To2.v` | AXI4-Stream broadcaster, 1→2 | 2 | 0 | 0 | n/a |

Every file in the table is reproducible from the generators, and CI regenerates
and compares them on each run, so the table cannot drift from the RTL unnoticed.

If none of these match your topology, generate a custom one with Option A.

---

## YAML configuration reference

The configuration file contains a `designs` list. Each entry generates one Verilog file.

```yaml
designs:
  - name: MySoC
    arbitration: round_robin
    max_outstanding: 4
    fabric_data_width: 64
    weights: [3, 1]

    masters:
      - type: full
        addr_width: 32
        data_width: 64
        id_width: 4
        reg_slice: false

    slaves:
      - base: 0x0000_0000
        size: 0x8000_0000
        type: full
        data_width: 64
        reg_slice: false
```

### Top-level keys

| Key | Type | Default | Description |
|---|---|---|---|
| `name` | string | *required* | Output filename (without `.v`). Must be a valid Verilog module name. |
| `type` | string | auto | Force `lite` (all-Lite crossbar) or `full` (Full AXI4 crossbar). If omitted, inferred from port types: all-Lite ports use the lightweight Lite crossbar; any Full port uses the Full crossbar with automatic adapters. |
| `arbitration` | string | `round_robin` | Arbitration policy when multiple masters contend for the same slave. See [Arbitration modes](#arbitration-modes). |
| `weights` | list[int] | — | One integer per master. Only used with `weighted_round_robin`. Master *i* receives `weights[i]` grants per round. |
| `max_outstanding` | int | `1` | Maximum outstanding transactions per slave per direction. See [Pipelined vs blocking mode](#pipelined-vs-blocking-mode). |
| `fabric_data_width` | int | max of all ports | Override the internal fabric data width. Width converters are inserted automatically at any port whose `data_width` differs. See [Data-width conversion](#data-width-conversion). |

### Master port keys

Each entry in the `masters` list defines one slave-facing AXI interface on the crossbar (where you connect your CPU, DMA, etc.).

| Key | Type | Default | Description |
|---|---|---|---|
| `type` | string | `full` | `full` (AXI4 with IDs and bursts), `lite` (AXI4-Lite, single-beat, no IDs), or `axi3` (AXI3 master — see below). A Lite master gets an automatic Lite-to-Full adapter; an AXI3 master gets an automatic AXI3-to-AXI4 bridge. |
| `addr_width` | int | *required* | Address bus width in bits (typically 32). AXI3 limit: ≤ 32. |
| `data_width` | int | *required* | Data bus width in bits (32, 64, 128, …). If it differs from `fabric_data_width`, a width converter is inserted. |
| `id_width` | int | `4` | Transaction ID width. Full AXI4 and AXI3 only; ignored for Lite. AXI3 limit: ≤ 4. The crossbar appends `ceil(log2(nMasters))` master-index bits internally. |
| `reg_slice` | bool | `false` | Insert a register slice (pipeline stage) on this master port for timing closure. |

#### AXI3 master (`type: axi3`)

When `type: axi3`, the generator inserts an `Axi3ToAxi4` bridge adapter between the AXI3 master port and the AXI4 crossbar fabric.  The bridge handles:

- **LEN**: 4-bit AXI3 burst length (max 16 beats) zero-extended to 8-bit AXI4.
- **LOCK**: 2-bit AXI3 lock truncated to 1-bit AXI4 exclusive; locked accesses (`2'b10`) return SLVERR.
- **WID**: AXI3 write-data ID used to reorder interleaved W beats into AXI4's strict AW-order sequence.

**AXI3 constraints** (validated by `axizero.py`):

| Field | AXI3 limit |
|-------|-----------|
| `addr_width` | ≤ 32 bits |
| `id_width` | ≤ 4 bits |
| burst length (`len`) | ≤ 15 (1–16 beats) |
| No `REGION` or `QOS` fields | — |

**Example:**
```yaml
masters:
  - type: axi3
    addr_width: 32
    data_width: 32
    id_width: 4
```

### Slave port keys

Each entry in the `slaves` list defines one master-facing AXI interface on the crossbar (where you connect your BRAM, peripheral, etc.).

| Key | Type | Default | Description |
|---|---|---|---|
| `base` | int | *required* | Base address. Hex (`0xC000_0000`) or decimal. Underscores are allowed for readability. |
| `size` | int | *required* | Address region size in bytes. Must be a power of 2. The slave occupies `[base, base+size)`. |
| `type` | string | `full` | `full` or `lite`. A Lite slave on a Full crossbar gets an automatic Full-to-Lite adapter. |
| `data_width` | int | *required* | Data bus width in bits. If it differs from `fabric_data_width`, a width converter is inserted. |
| `reg_slice` | bool | `false` | Insert a register slice on this slave port. |

Address regions must not overlap. The crossbar uses a bitmask decoder: for each slave, bits above `log2(size)` must match `base`. Addresses that don't match any slave are undefined (no default slave / error response).

### Arbitration modes

| Mode | Key value | Extra keys | Behavior |
|---|---|---|---|
| Round-robin | `round_robin` | — | Equal turns among contending masters. No starvation. Default. |
| Fixed priority | `fixed_priority` | — | Master 0 (first listed) has highest priority. Lower-priority masters may starve under sustained load. |
| Weighted round-robin | `weighted_round_robin` | `weights` | Like round-robin, but master *i* gets `weights[i]` consecutive grants before yielding. Example: `weights: [3, 1]` gives master 0 three turns for every one turn of master 1. |
| QoS-based | `qos` | — | Arbitrates on AXI `AXQOS[3:0]`: higher QoS wins. Equal QoS falls back to round-robin. An aging counter increments for each cycle a request waits; once the age exceeds a threshold, it boosts effective QoS to prevent starvation. |

### Data-width conversion

When a port's `data_width` differs from `fabric_data_width`, the generator inserts a converter automatically:

- **AXI4-Lite**: zero-extends writes to the wider bus, truncates reads to the narrower bus. Single-cycle, no buffering.
- **Full AXI4 upsize** (narrow port → wider fabric): SpinalHDL `Axi4Upsizer`. Assembles narrow beats into wide beats.
- **Full AXI4 downsize** (wide port → narrower fabric): `Axi4DownsizerExt` (local fork). Splits wide beats into narrow sub-transactions. INCR bursts stay multi-beat for efficiency. FIXED and WRAP bursts are flattened to single-beat sub-transactions with addresses computed internally.

### Pipelined vs blocking mode

| `max_outstanding` | Mode | Behavior |
|---|---|---|
| `1` | Blocking | One transaction in flight per slave per direction. No FIFOs. Minimal area. |
| `> 1` | Pipelined | Per-slave W-route FIFOs, ID-based B/R response routing. Multiple transactions can be in flight simultaneously to different slaves. Required for high-throughput designs. |

Only affects the Full AXI4 crossbar. The Lite-only crossbar is always single-outstanding (blocking).

### AXI4-Stream utility cores

Standalone AXI4-Stream cores use `kind: axis` in the YAML generator. They do not use `masters`, `slaves`, address maps, or memory-mapped arbitration settings.

Common keys:

| Key | Type | Default | Description |
|---|---|---|---|
| `kind` | string | *required* | Set to `axis`. |
| `core` | string | *required* | `reg_slice`, `width_adapter`, `fifo`, `arb_mux`, `demux`, or `broadcaster`. |
| `data_width` | int | *required except width adapter* | AXIS `TDATA` width in bits. Must be byte-aligned. |
| `input_data_width` | int | *width adapter only* | Input `TDATA` width in bits. |
| `output_data_width` | int | *width adapter only* | Output `TDATA` width in bits. |
| `use_keep` / `use_strb` / `use_last` | bool | `true` | Enable `TKEEP`, `TSTRB`, and `TLAST`. Packet mux/demux require `use_last: true`. |
| `id_width` / `dest_width` / `user_width` | int | `0` | Sideband widths. `use_id`, `use_dest`, and `use_user` default to true when the matching width is non-zero. |

Core-specific keys:

| Core | Extra keys | Behavior |
|---|---|---|
| `reg_slice` | none | One-stage ready/valid register slice for timing closure. |
| `width_adapter` | `input_data_width`, `output_data_width` | Packs or unpacks byte streams between different `TDATA` widths. |
| `fifo` | `depth` | Elastic FIFO storing full AXIS beats, including enabled sidebands. `depth` must be at least 2. |
| `arb_mux` | `inputs`, `arbitration` | N-to-1 packet arbiter/mux. `arbitration` is `round_robin` or `fixed_priority`; ownership is held until `TLAST`. |
| `demux` | `outputs` | 1-to-N packet demux. The explicit `select` input is sampled at packet start and held until `TLAST`. |
| `broadcaster` | `outputs` | 1-to-N synchronous broadcaster. A beat is accepted only when every output accepts it. |

Measured xc7a100t datapoint for the Arty AXIS smoke datapath, which instantiates all six utility cores (`AxiStreamArbMux`, FIFO, register slice, 32-to-8 and 8-to-32 width adapters, demux, broadcaster):

| Design | LUTs | FFs | LUTRAM | BRAM | DSP | Clock | Fmax note |
|---|---:|---:|---:|---:|---:|---:|---|
| `AxiStreamArtySmoke` submodule | 175 | 208 | 20 | 0 | 0 | 100 MHz | Routed Arty AXIS build (Vivado 2025.2, SpinalHDL 1.14.2) WNS 0.465 ns, equivalent single-clock margin to about 105 MHz |

Example:

```yaml
designs:
  - name: MyAxisFifo
    kind: axis
    core: fifo
    data_width: 32
    depth: 16
    use_keep: true
    use_last: true

  - name: MyAxisMux_2To1
    kind: axis
    core: arb_mux
    data_width: 32
    inputs: 2
    arbitration: round_robin
    use_keep: true
    use_last: true

  - name: MyAxisDemux_1To2
    kind: axis
    core: demux
    data_width: 32
    outputs: 2
    use_keep: true
    use_last: true
```

Generated ports are renamed to AXI4-Stream style: `s_axis_t*` and `m_axis_t*` for single-input/single-output cores, `s0_axis_t*`/`s1_axis_t*` for vector inputs, and `m0_axis_t*`/`m1_axis_t*` for vector outputs. The demux selector is emitted as `select`.

Full example with all options: [`scripts/example.yaml`](scripts/example.yaml).
Packet-pipeline example: [`scripts/examples/axis_packet_pipeline.yaml`](scripts/examples/axis_packet_pipeline.yaml).
Verification details: [`docs/axis-stream-verification.md`](docs/axis-stream-verification.md).

---

## Simulation

Requires Verilator 5.x on Linux or WSL.

### SpinalSim (unit tests, run with sbt)

```bash
sbt test
```

96 tests pass across 16 suites:

For the focused AXI4-Stream loop, including lint, YAML generator smoke tests, and cocotbext-axi generated-RTL tests:

```bash
python3 scripts/run_sim.py axis
```

| Suite | Tests | Description |
|---|---|---|
| `LiteCrossbarSpec` | 6 | AXI4-Lite crossbar: arbitration, address decode, WRR |
| `PipelinedCrossbarSpec` | 8 | Full AXI4: bursts, back-pressure, outstanding transactions |
| `MixedCrossbarSpec` | 4 | Full↔Lite adapters, mixed address maps |
| `ArtySpec` | 5 | Sequence matching the Arty A7 hardware tests (T4, T5, T6, T9, combined) |
| `IpifWriteSpec` | 5 | IPIF-style slaves (Xilinx GPIO/UART-Lite require AW+W simultaneous), blocking and pipelined modes |
| `WidthConverterSpec` | 6 | Full AXI4 width conversion: 32→64 upsize, 64→32 downsize, 32→64→32 passthrough; single-beat, burst, routing |
| `BurstTypeSpec` | 6 | Downsizer burst types: INCR baseline, FIXED 1-beat and 2-beat overwrite, WRAP aligned, WRAP 4-beat, WRAP with actual wrap-around |
| `ArbitrationSpec` | 7 | FixedPriority and WeightedRoundRobin: contention ordering, throughput proportionality, data integrity |
| `RegSliceAndLiteWidthSpec` | 8 | Register slices (Full + Lite, master/slave/both), AXI4-Lite width conversion (16→32 upsizing) |
| `PipelinedArbitrationSpec` | 9 | Pipelined FixedPriority, WRR, and QoS: contention, concurrent bursts, data integrity |
| `NarrowPortSpec` | 6 | Narrow ports: 32→16 downsizing, 16→32 upsizing, mixed Full+Lite concurrent traffic |
| `QosCrossbarSpec` | 5 | QoS arbitration: higher AWQOS/ARQOS wins (blocking + pipelined), equal-QoS round-robin tie-break, aging anti-starvation |
| `QosStressShortSpec` | 1 | Short 4-master QoS stress: distinct patterns (sequential, reverse, sparse, random short bursts), concurrent traffic, end-state validation |
| `Axi3ToAxi4Spec` | 5 | AXI3→AXI4 bridge: single-beat, INCR burst, write interleaving (WID reorder), locked→SLVERR, multiple outstanding |
| `Axi3MixedCrossbarSpec` | 5 | Axi3Mode auto-adapter: single-beat to full slave, single-beat to Lite slave, routing to both, 4-beat INCR burst, register-sliced path |
| `AxiStreamCoreSpec` | 17 | AXI4-Stream utility cores: register slice, width adapter, FIFO, packet arb-mux, packet demux, broadcaster, sparse TKEEP/TSTRB/TLAST edge cases, TID/TDEST/TUSER propagation |

### cocotb (integration tests against pre-built Verilog, run with Python)

Tests the generated Verilog files directly using [cocotbext-axi](https://github.com/alexforencich/cocotbext-axi) bus functional models.

```bash
# requires: pip install cocotb cocotbext-axi
python3 sim/cocotb_gen/run_all.py          # all cocotb suites
python3 sim/cocotb_gen/run_all.py lite     # MyLite_1M4S.v only
python3 sim/cocotb_gen/run_all.py full     # MyFull_2M2S.v only
python3 sim/cocotb_gen/run_all.py wrr      # MyLite_2M2S_WRR.v only
python3 sim/cocotb_gen/run_all.py qos      # MyFull_2M2S_QoS.v only
python3 sim/cocotb_gen/run_all.py ipif     # MyLite_1M4S.v IPIF slave only
python3 sim/cocotb_gen/run_all.py axis     # generated AXI4-Stream cocotb suite
```

34 tests pass across 6 suites:

| Suite | DUT | Tests | Description |
|---|---|---|---|
| `lite` | `MyLite_1M4S.v` | 6 | AxiLiteMaster → 4-slave crossbar: single R/W, address routing, sequential writes, multi-slave pattern, overwrite isolation, 60× random |
| `full` | `MyFull_2M2S.v` | 6 | AxiMaster → 2-slave crossbar: single R/W, address routing + isolation, 16-beat burst, 64-beat burst (AWLEN=63), alternating slaves, 40× random |
| `wrr` | `MyLite_2M2S_WRR.v` | 6 | 2-master WRR crossbar: dual-master R/W, address routing, concurrent bandwidth, no starvation, concurrent different slaves, 80× random |
| `qos` | `MyFull_2M2S_QoS.v` | 6 | 2-master QoS crossbar: dual-master R/W, address routing, higher QoS wins contention, equal-QoS round-robin, aging anti-starvation, QoS read priority |
| `ipif` | `MyLite_1M4S.v` | 4 | IPIF slave compatibility: strict IpifRam model requires AWVALID+WVALID simultaneously, routing unaffected |
| `axis` | generated AXI4-Stream cores | 6 | cocotbext-axi stream BFM tests for reg slice, width adapter, FIFO, arb-mux, demux, broadcaster |

---

## Example system — VexRiscv SoC

A complete RISC-V system built around the interconnect, under
[hw/examples/vexriscv/](hw/examples/vexriscv/). Where the test suite drives the crossbar with
bus functional models, this boots a real CPU through it —
[VexRiscv](https://github.com/SpinalHDL/VexRiscv), which is also written in SpinalHDL, so the
whole SoC elaborates from one Scala build.

```
  VexRiscv IBus (Axi4ReadOnly) ─┐                    ┌─ S0  on-chip RAM  (AXI4 full)
                                ├─ AxiZeroMixedTop ──┼─ S1  GPIO         (AXI4-Lite)
  VexRiscv DBus (Axi4Shared)  ──┘   2 masters x 3     └─ S2  system ctrl  (AXI4-Lite)
```

| Slave | Base | Size | Port | Registers |
|---|---|---|---|---|
| S0 on-chip RAM | `0x8000_0000` | 8 KB | AXI4 full | preloaded with the boot image |
| S1 GPIO | `0xF000_0000` | 4 KB | AXI4-Lite | `0x00` led RW, `0x04` switch RO |
| S2 system control | `0xF001_0000` | 4 KB | AXI4-Lite | `0x00` cycles RO, `0x04` charOut WO, `0x08` status RW, `0x0C` result RW |

### Running it

The example is a separate sbt project (`vexZero`) that needs the pinned VexRiscv submodule.
The root project neither aggregates nor depends on it, so a checkout without the submodule
builds and tests exactly as before.

```bash
git submodule update --init third_party/VexRiscv

sbt vexZero/test                                          # boot the SoC in SpinalSim
sbt "vexZero/Compile/runMain vexzero.gen.VexZeroSocGen"   # -> generated/vexriscv/VexZeroSoc.v
```

| Test | Description |
|---|---|
| `boot firmware completes on the pipelined crossbar` | `maxOutstanding = 4` |
| `boot firmware completes on the blocking crossbar` | `maxOutstanding = 1` |
| `the firmware image is a valid RV32I encoding` | pins the assembled program |

### No cross compiler required

The boot firmware is assembled by [`vexzero.Rv32`](hw/examples/vexriscv/spinal/vexzero/Rv32.scala),
a small RV32I encoder, so the example runs on a plain JDK and no binary is tracked in git. Its
output for the whole program is byte-identical to `riscv64-unknown-elf-as`.

The firmware fills and sums 16 words of RAM, writes the checksum to the GPIO LED register, reads
the switch register back, emits `OK` and a newline a byte at a time, parks the cycle counter in
RAM, then publishes the result and a done marker. Reaching the marker means fetch, load, store
and both full→Lite adapters all worked; the checked values pin down what was actually moved, so a
crossbar that merely keeps the bus alive cannot pass.

### On hardware

The example is not simulation-only — it runs on an Arty A7-100T. A board has no wires back to a
test runner, so the wrapper
([`VexZeroArty`](hw/examples/vexriscv/spinal/vexzero/VexZeroArty.scala)) reruns the SoC's checks in
hardware and reports the verdict two ways: LD4–LD7 (done, pass, fail, heartbeat) for a human, and a
9-byte line on the USB-UART at 115200 8N1, repeated every ~0.67 s, for the runner.

| Line | Meaning |
|---|---|
| `VZPDRCL5` | every check passed; the switch nibble read back over AXI4-Lite was `0x5` (the value varies with the switches) |
| `VZFdrcl0` | the CPU never finished — held in reset, or hung |

Upper case is a passing check: **P** overall, **D** done marker, **R** result value, **C** character
stream, **L** LED register. The last byte is the switch nibble the firmware read back through the
AXI4-Lite GPIO. It is reported because the result check is `checksum + switches`, so with every
switch down a Lite read that always returned zero would pass; the runner says as much when it sees
a zero nibble.

```bash
python hw/vivado/arty_a7/run_vexzero_test.py                # generate, build, program, verify
python hw/vivado/arty_a7/run_vexzero_test.py --skip-build   # reprogram and re-read only
```

The runner generates the netlist with sbt, builds the bitstream, programs the board over JTAG with
xsdb, then decodes the serial line. There is no MicroBlaze in this design, so unlike the crossbar HW
tests it needs no `mb-gcc` — the firmware is already inside the bitstream.

**Result** — the board reports `VZPDRCLF`. The trailing nibble is the switch register read back
over AXI4-Lite (all four slide switches up on this run), so the result check ran against
`checksum + 15` rather than against zero. Timing closes:

| Resource | Used | Available | Utilisation |
|---|---:|---:|---:|
| Slice LUTs | 1091 | 63400 | 1.72% |
| Slice registers | 1142 | 126800 | 0.90% |
| Block RAM tiles | 3 | 135 | 2.22% |
| DSPs | 0 | 240 | 0.00% |

Test conditions: Vivado 2025.2, `xc7a100tcsg324-1` (speed grade -1), default synthesis and
implementation strategies, one 100 MHz clock domain, WNS **+0.698 ns** (107.5 MHz Fmax). The figures
cover the whole SoC — VexRiscv, the axiZero crossbar, the 8 KB RAM, both peripherals and the UART
reporter — not the crossbar alone; see
[crossbar-only resource usage](#hardware-validation--arty-a7-100t) for that.

### Benchmark — Dhrystone

A firmware that reaches a done marker proves the crossbar moves the right bytes. It does not say
what the crossbar *costs*. For that the example carries a second board top level,
[`VexZeroBenchArty`](hw/examples/vexriscv/spinal/vexzero/VexZeroBenchArty.scala), which runs
Dhrystone 2.1 — a real program with a real working set — and prints the benchmark's own console
verbatim over the USB-UART.

The binary is the prebuilt RV32I `dhrystoneO3.hex` that ships inside the pinned VexRiscv submodule,
read into the RAM by [`HexImage`](hw/examples/vexriscv/spinal/vexzero/HexImage.scala). Nothing is
recompiled and no cross compiler is needed, and because it is the image VexRiscv's own regression
suite runs, the numbers are comparable to that suite's. Its console MMIO lives at the addresses that
testbench implements, so the SoC answers there through a fourth slave
([`VexZeroBenchIo`](hw/examples/vexriscv/spinal/vexzero/Peripherals.scala)), added to the address
map for this build only:

| Slave | Base | Size | Port | Registers |
|---|---|---|---|---|
| S3 benchmark console | `0xF00F_F000` | 4 KB | AXI4-Lite | `0xF00` putchar WO, `0xF10` cycles RO, `0xF20` exit WO, `0xF24` error WO |

The character path backpressures the whole way: a full FIFO stalls the CPU's store rather than
dropping a byte, so a 115200-baud line costs time but never corrupts a result line. Dhrystone prints
nothing inside its timed loop, so that stall never reaches the measurement.

```bash
sbt "vexZero/testOnly *VexZeroBenchSpec"                     # simulate the benchmark
python hw/vivado/arty_a7/run_vexzero_bench.py                # generate, build, program, stream
python hw/vivado/arty_a7/run_vexzero_bench.py --skip-build   # reprogram and re-read only
```

The program runs once at configuration, so the runner opens the serial port *before* programming
the board. It then re-runs Dhrystone's own self-checks on the captured text — every printed value
against the "should be:" line the benchmark prints beside it — and recomputes the score from the
cycle count rather than trusting the line the firmware printed.

**Results.** The board and the simulation agree on the cycle count exactly — 328,048 cycles for
200 runs — which is the strongest statement available here that the netlist behaves as simulated:

| | Timed loop (200 runs) | Cycles/run | Dhrystones/s | DMIPS/MHz |
|---|---:|---:|---:|---:|
| Arty A7-100T @ 100 MHz | 328,048 | 1640.2 | 60,967 | **0.347** |
| SpinalSim, `max_outstanding = 4` | 328,048 | 1640.2 | 60,967 | 0.347 |
| SpinalSim, `max_outstanding = 1` | 331,848 | 1659.2 | 60,269 | 0.343 |

All 20 of Dhrystone's self-checks pass in every case. Pipelined mode is 1.2% faster than blocking
mode, which is what a single-issue RV32I with one load or store in flight should show: there is
almost no concurrency for the crossbar to exploit, so this measures the fabric's overhead rather
than its throughput, and the overhead is small. That 1.2% is *not* a throughput result, and
[what Dhrystone does not test](#what-dhrystone-does-not-test) says why.

What the crossbar actually saw during a run, counted at its master ports in simulation (AR→R and
AW→B, in `aclk` cycles, pipelined mode):

| Master port | Reads | Read latency | Writes | Write latency |
|---|---:|---:|---:|---:|
| M0 instruction fetch (AXI4 full) | 153,191 | 3.04 cycles | — | — |
| M1 load / store (AXI4 full) | 17,953 | 3.00 cycles | 18,796 | 3.09 cycles |

Three cycles is the floor for this path — register slice in, arbitration and decode, register slice
out — and the measured averages sit on it, so under this load the crossbar never queues. One
instruction is fetched every 3.30 cycles, and the ~1.4 cycles between the fetch latency and that
interval is the uncached `IBusSimplePlugin` waiting on the fabric rather than the fabric waiting on
anything. A cache would close most of that gap; this configuration deliberately has none.

Test conditions: Vivado 2025.2, `xc7a100tcsg324-1` (speed grade -1), default strategies, one 100 MHz
clock domain, 32 KB on-chip RAM (the benchmark needs more than the 8 KB verdict build), Dhrystone
2.1 compiled `-O3` without the `register` attribute, 200 runs, `DMIPS/MHz = 10^6 x runs / (cycles x
1757)`.

| Resource | Used | Available | Utilisation |
|---|---:|---:|---:|
| Slice LUTs | 1213 | 63400 | 1.91% |
| Slice registers | 1263 | 126800 | 1.00% |
| Block RAM tiles | 9 | 135 | 6.67% |
| DSPs | 0 | 240 | 0.00% |

WNS **+0.521 ns** (105.5 MHz Fmax). The figures cover the whole benchmark SoC — VexRiscv, the
axiZero crossbar, 32 KB of RAM, three slaves and the UART — not the crossbar alone.

### What Dhrystone does not test

Dhrystone is the right test for *does a real program run correctly across the fabric*. It is the
wrong test for *is the fabric any good*, and the difference is large enough to be worth measuring
rather than asserting.
[`VexZeroProfileSpec`](hw/examples/vexriscv/sim/vexzero/sim/VexZeroProfileSpec.scala) counts what
the crossbar was actually asked for during a run, at its master ports:

| | Uncached CPU | Cached CPU (4 KiB I$ + D$) |
|---|---:|---:|
| Transactions | 189,937 | 21,190 |
| Beats carried | 189,937 | 37,921 |
| Instruction fetch | 153,187 × 1-beat | 2,328 × **8-beat** |
| Data reads | 17,953 × 1-beat | 63 × 8-beat, 2 × 1-beat |
| Data writes | 18,797 × 1-beat | 18,797 × 1-beat |
| Peak in flight, any port | 2 | 4 |
| Cycles with any request | 36.5% | 8.2% |
| **Cycles with two masters requesting** | **1.1%** | **0.0%** |
| DMIPS/MHz | 0.347 | 0.687 |

Coverage is maximal and pressure is minimal. With no caches every instruction and every load or
store crosses the crossbar — bus traffic *is* the whole program — but all 189,937 transactions are
single beats, never more than two are in flight, and the two masters want the bus in the same cycle
in 1.1% of cycles. The measured 3.00–3.09 cycle latencies sit exactly on the registered-path floor,
which is another way of saying the crossbar never queued. Bursts, outstanding depth and arbitration
under contention are simply not on trial.

Turning the caches on (`cachedCpu = true`) buys the bursts — each miss becomes an 8-beat INCR line
refill — and nearly doubles DMIPS/MHz, but it makes the *pressure* problem worse, not better: the
hit rate is so high that the fabric goes idle 92% of the time and contention falls to zero. Writes
do not change at all, because VexRiscv's data cache is write-through on a 32-bit bus, so every
store still leaves as a single beat.

So neither configuration loads the interconnect. The pressure has to come from somewhere other than
this CPU.

### Stress — the crossbar under load

[`VexZeroStressSpec`](hw/examples/vexriscv/sim/vexzero/sim/VexZeroStressSpec.scala) supplies it. The
CPU runs the same unmodified Dhrystone with caches on, and a third master —
[`HostTraffic`](hw/examples/vexriscv/sim/vexzero/sim/HostTraffic.scala), on the same port a debug
cable occupies on the DE25-Nano — drives the port as hard as it will go at **the same RAM slave the
CPU is fetching from**: 16-beat INCR bursts, several outstanding, and AW deliberately running ahead
of W so write data reaches the fabric after its address and has to be routed from a queue.

```
sbt "vexZero/testOnly *VexZeroProfileSpec"   # what Dhrystone asks for, uncached vs cached
sbt "vexZero/testOnly *VexZeroStressSpec"    # the same SoC with a third master saturating it
```

Every host burst carries the value it expects, so this is a checker and not only a load: a crossbar
that mis-routed a beat, dropped one or returned another master's data fails here rather than merely
running slowly.

| | Dhrystone alone (cached) | Dhrystone + host traffic |
|---|---:|---:|
| Cycles with any request | 8.2% | **99.8%** |
| Cycles with two or more masters requesting | 0.0% | **85.7%** |
| Longest burst | 8 beats | 16 beats |
| Beats carried | 37,921 | 897,137 |
| Instruction-fetch latency | 10.0 cycles | 25.0 cycles |
| Host read-burst latency | — | 42.0 cycles |
| Host beats checked | — | 859,209, **0 mismatches** |
| Dhrystone self-checks | 20/20 pass | 20/20 pass, exit 0 |

Latency rising from 10 to 25 cycles is the point: under Dhrystone alone the crossbar never queued,
and here it queues constantly, while the program on top still computes every one of its results
correctly.

**Pipelined against blocking, under real load.** With the fabric at 99.8% occupancy the two modes
come out level — 53,700 host transactions in 895,467 cycles pipelined against 52,583 in 880,430
blocking, a 0.4% difference in transactions per cycle, with Dhrystone itself 2.1% *slower* on the
pipelined path. That is not a defect: this load is bandwidth-bound at a single RAM slave, and
allowing more transactions outstanding to one slave reorders who waits rather than creating
bandwidth that is not there. The pipelined path's advantage is concurrency across *different*
slaves, which is what
[`PipelinedArbitrationSpec`](hw/sim/axizero/sim/PipelinedArbitrationSpec.scala) measures directly.

Test conditions: SpinalSim + Verilator, 3-master × 4-slave `AxiZeroMixedTop`, round-robin, 64 KB
on-chip RAM, VexRiscv RV32I with 4 KiB one-way 32-byte-line I$ and D$, Dhrystone 2.1 `-O3`, 200
runs. The host reads the program text back from where it is being fetched and round-trips a pattern
through the unused top 16 KB of RAM.

### A second board — DE25-Nano (Agilex 5)

The example is not tied to one FPGA family. The same SoC, the same crossbar and the same firmware
also run on a Terasic DE25-Nano (Altera Agilex 5), built with Quartus Prime Pro instead of Vivado.
Porting it needed no change to the interconnect and no vendor-specific memory or reset primitive —
the design is ordinary inferred RTL — but it did need a different answer to one question: how does
the board say what happened?

The DE25-Nano has no UART. Its only link to a host is the on-board USB-Blaster. So rather than the
design pushing a report out, the host reaches in: fpgacapZero's JTAG-to-AXI bridge joins the
crossbar as a **third bus master**, and the runner reads the registers the firmware wrote.

```
  host ── USB-Blaster ──> M2 ─┐
       VexRiscv IBus ── M0 ───┼─ AxiZeroMixedTop ──> RAM / GPIO / sysctrl / console
       VexRiscv DBus ── M1 ───┘      3 masters
```

That is a better arrangement than a side channel, because the report path is now part of what is
being tested. Every value the runner checks crosses the interconnect, arbitrated against a CPU that
is still fetching out of the same RAM. A crossbar that mixed up two masters' responses would fail
the test rather than quietly reporting on itself.

The bridge comes from the `fcapz` submodule — the same one the
[Arty debug flows](#arty-fcapz-debug) already use, so fpgacapZero is pinned once for the whole
repository rather than once per board. It is wrapped in
[`JtagAxi`](hw/examples/vexriscv/spinal/vexzero/JtagAxi.scala), which presents it as a plain axiZero
master port and ties off the signals it does not drive. It has no IDs and issues one transaction at
a time, so a constant ID is enough for the pipelined crossbar to route its responses — the same
argument that already covers the two CPU ports.

```bash
git submodule update --init fcapz

python hw/quartus/de25_nano/run_vexzero_de25.py                  # self test
python hw/quartus/de25_nano/run_vexzero_de25.py --design bench   # Dhrystone
python hw/quartus/de25_nano/run_vexzero_de25.py --skip-build     # reprogram and re-read
```

For the benchmark there is no serial line to stream the console over either, so the console is
buffered inside the peripheral and the host drains it a read at a time
([`VexZeroBenchIo`](hw/examples/vexriscv/spinal/vexzero/Peripherals.scala)). Backpressure is
unchanged: a full buffer stalls the store in the CPU rather than dropping a character, so a host
that reads slowly costs the run time and never a byte. Nothing prints inside Dhrystone's timed
loop, so the measurement is untouched.

**Results** — both designs pass on the board. The self test's every checked value is read back
over JTAG-AXI: the done marker, the computed result, the GPIO register the firmware wrote, and a
word of the program read straight out of RAM while the CPU was running. Dhrystone runs to
completion with its whole console drained through the bridge, all 20 of its self-checks passing
and an exit code of 0.

And it takes **328,048 cycles for 200 runs — the same count as the Arty, and the same count as
simulation**. Three platforms, two FPGA vendors, two toolchains, one number: the SoC is doing
exactly the same work on the Agilex 5 as it does on the Artix-7, cycle for cycle.

| | Timed loop | Cycles/run | Dhrystones/s | DMIPS/MHz |
|---|---:|---:|---:|---:|
| DE25-Nano @ 50 MHz | 328,048 | 1640.2 | 30,483 | **0.347** |
| Arty A7-100T @ 100 MHz | 328,048 | 1640.2 | 60,967 | 0.347 |
| SpinalSim | 328,048 | 1640.2 | — | 0.347 |

Only the wall-clock rate differs, because the DE25-Nano's oscillator is half the Arty's.

| Resource | Self test | Benchmark | Available |
|---|---:|---:|---:|
| ALMs | 4,589 | 4,802 | 46,800 |
| Registers | 6,618 | 6,861 | — |
| RAM blocks | 6 | 19 | 358 |
| DSP blocks | 0 | 0 | 376 |

Test conditions: Quartus Prime Pro 26.1, `A5EB013BB23BE4SR1`, default synthesis and fitter settings,
one 50 MHz clock domain. Worst-case slack **+12.824 ns** (self test) and **+12.631 ns** (benchmark),
zero failing endpoints in both, with reported Fmax of **139.35 MHz** and **135.70 MHz** on the Slow
0 °C model. The figures cover the whole system — VexRiscv, the axiZero crossbar, the RAM, the
peripherals *and* the JTAG-to-AXI bridge, which accounts for much of the register count and has no
counterpart in the Arty builds, so the two boards' numbers are not comparable to each other.

Simulation covers the three-master arrangement without needing the vendor primitive:
[`VexZeroHostSpec`](hw/examples/vexriscv/sim/vexzero/sim/VexZeroHostSpec.scala) drives the SoC's
host port directly with the transactions the bridge would issue.

| Test | What it proves |
|---|---|
| `the host reads the firmware's verdict over the third master port` | the host reaches both the Lite peripherals and the full-AXI4 RAM |
| `the host and the CPU share the crossbar without disturbing each other` | dozens of host reads interleaved with instruction fetch, all correct, and the firmware's own result unchanged |
| `the host drains the benchmark console over the bus` | a whole Dhrystone run read out through the buffer, with Dhrystone's own self-checks re-run on the text |

### Notes

- **Register slices on the CPU ports are required, not decorative.** VexRiscv couples its two bus
  ports combinationally — a stalled store stalls the pipeline, which pulls `IBusSimplePlugin`'s
  `cmd.valid` low — and `Axi4SharedOnChipRam`'s AR/AW arbiter derives `AWREADY` from `ARVALID`.
  Together those close a ready → valid → ready ring through the fabric. `regSlice = true` on both
  master ports registers every master → fabric valid and breaks it.
- **Response ordering.** Pipelined mode routes B/R by ID and both CPU ports drive a constant ID,
  so ordering only has to hold per master. IBus fetches never leave the RAM region, and
  `DBusSimplePlugin` keeps at most one read in flight and blocks reads while a write is
  outstanding.

See [ADR 002](docs/adr/002-vexriscv-example-soc.md) for why VexRiscv is carried as a pinned
submodule in its own sbt project.

---

## Hardware validation — Arty A7-100T

Six test suites run on a Xilinx Arty A7-100T (xc7a100t) at 100 MHz. All six pass. The
[VexRiscv example SoC](#example-system--vexriscv-soc) runs on the same board with its own
runner; its results are reported with the example.

### Base test (1M×4S)

Topology: MicroBlaze LE → axiZero 1M×4S → 2× AXI4 BRAM ctrl (64 KB each) + AXI-Lite GPIO + AXI-Lite UART-Lite, `max_outstanding=4`.

All 10 tests pass (g\_fail=0, g\_pass=10).

| Test | Description |
|---|---|
| T1–T3 | Single-word write/read, address isolation (AXI4 Full) |
| T4–T6 | 64-word sequential, walking-1, alternating-stride across both BRAMs |
| T7 | GPIO 16-pattern LED sweep (AXI-Lite) |
| T8 | UART-Lite TX FIFO reset and drain (AXI-Lite) |
| T9 | Full 64 KB BRAM checkerboard — 16 384 word write + verify |
| T10 | Cross-slave boundary: last word of BRAM #0, first word of BRAM #1 |

### WRR test (2M×4S, weighted round-robin)

Topology: MicroBlaze + hardware traffic generator → axiZero 2M×4S WRR (weights 3:1) → same slaves as base test.

All 3 tests pass (g\_fail=0, g\_pass=3).

| Test | Description |
|---|---|
| T1 | Sanity: single-word write/read to both BRAMs |
| T2 | Contention: MB and traffic gen write concurrently, both regions verified |
| T3 | Starvation: lower-weight master still makes progress under sustained load |

### QoS hardware stress (4M×4S, heavy traffic)

Topology: MicroBlaze QoS=15 plus 3 hardware traffic generators (QoS=8/4/0) → axiZero 4M×4S QoS → same slaves as base test.
Each generator issues 512 words × 8 passes per iteration with intentionally different patterns:

- **G0** (QoS=8): sequential writes to BRAM0
- **G1** (QoS=4): reverse-order writes to BRAM1
- **G2** (QoS=0): LFSR-based random short bursts (len 1–4) to BRAM1

`run_qos_stress_test.py` monitors the board continuously for 10 minutes and fails if:
- `g_fail` becomes non-zero,
- heartbeat (`g_heartbeat`) stops advancing for 30 seconds,
- no stress iteration (`g_iteration`) completes.

Result: 14 000+ iterations, 70 000+ passes, 0 failures over 10 minutes.

### AXI3 adapter test (1M×4S, AXI3 bridge in data path)

Topology: MicroBlaze (AXI4) → AXI4-to-AXI3 shim → Axi3ToAxi4Adapter → axiZero 1M×4S crossbar → same slaves as base test.

Every MicroBlaze transaction passes through the full AXI3→AXI4 round-trip, proving the adapter's FSM, WID reorder buffer, and field conversion work correctly in real hardware.

All 5 tests pass (g\_fail=0, g\_pass=5).

| Test | Description |
|---|---|
| T1 | Sanity: single-word write/read to BRAM0 and BRAM1 |
| T2 | Walking-1 pattern across 256 words in BRAM0 |
| T3 | Cross-slave: alternating writes to BRAM0+BRAM1, full verify |
| T4 | GPIO LED sweep (AXI-Lite slave path through adapter) |
| T5 | UART status read (second AXI-Lite slave path) |

### AXI4-Stream smoke test

Topology: MicroBlaze plus the dedicated fcapz EJTAG-AXI debug ingress -> axiZero 2M x 5S -> the normal base-test slaves plus a 32-bit AXI GPIO input at `0xC004_0000`.

The GPIO samples a self-running `AxiStreamArtySmoke` datapath:

`3 sources` -> `AxiStreamArbMux` -> `AxiStreamFifo` -> `AxiStreamRegSlice` -> `AxiStreamWidthAdapter` 32-to-8 -> `AxiStreamDemux` -> direct byte sink or `AxiStreamWidthAdapter` 8-to-32 -> `AxiStreamBroadcaster`.

The smoke engine sends three two-beat 32-bit frames, arbitrates between all three sources, unpacks to bytes, routes frame 1 through the repack/broadcast path and frames 0/2 through the direct byte path, deliberately stalls one broadcast sink, then reports done/pass/fail, byte counts, frame counts, checksum matches, route checks, and backpressure observation. The MicroBlaze firmware polls that status through axiZero and passes only when the board-observed status has `done=1`, `pass=1`, `fail=0`, the expected counts/checksums/frame boundaries match, and backpressure was actually seen.

### Arty fcapz debug

All Arty Vivado builds source `hw/vivado/arty_a7/fcapz_debug.tcl`, which adds the project-local `axizero_fcapz_debug` wrapper. The AXIS build inherits this through `create_project_axis.tcl` because it derives from the base Arty script. Builds with an appended debug ingress connect USER4 to the highest-numbered free `s*_axi` port, so existing MicroBlaze and traffic-generator ports keep their original wiring.

Debug chains:

| Chain | Function | Wiring |
|---|---|---|
| USER1 | fcapz ELA | Captures USER4 EJTAG-AXI requests plus the main-fabric `BRESP`/`RRESP` returned to that master. The default trigger fires on AXI `BRESP[1]` or `RRESP[1]`. |
| USER4 | fcapz EJTAG-AXI | Enters the main axiZero fabric through a dedicated appended AXI4-Lite ingress (`s1_axi` on base/AXIS, `s2_axi` on WRR/QoS, `s4_axi` on QoS stress), then reaches the normal axiZero slave map. |

### Running HW tests

All six test runners auto-detect Vivado, xsdb, and mb-gcc by searching `PATH` and common AMD/Xilinx install locations (Windows and Linux). Override with environment variables if needed:

```bash
# Auto-detect (works on Windows and Linux)
python hw/vivado/arty_a7/run_base_test.py
python hw/vivado/arty_a7/run_wrr_test.py
python hw/vivado/arty_a7/run_qos_test.py
python hw/vivado/arty_a7/run_qos_stress_test.py
python hw/vivado/arty_a7/run_axi3_test.py
python hw/vivado/arty_a7/run_axis_test.py

# The VexRiscv example SoC (no MicroBlaze, so no mb-gcc needed)
python hw/vivado/arty_a7/run_vexzero_test.py
python hw/vivado/arty_a7/run_vexzero_bench.py    # ... and Dhrystone on the same SoC

# Override tool paths via env vars
VIVADO_BIN=/opt/Xilinx/2025.2/Vivado/bin/vivado \
XSDB_BIN=/opt/Xilinx/2025.2/Vitis/bin/xsdb \
MBGCC_BIN=/opt/Xilinx/2025.2/Vitis/gnu/microblaze/lin64/bin/mb-gcc \
  python hw/vivado/arty_a7/run_qos_stress_test.py
```

Each runner: (1) creates the Vivado project + bitstream if not already built, (2) compiles MicroBlaze firmware with mb-gcc, (3) programs the FPGA and runs tests via xsdb. The two VexZero runners are the exception: the VexRiscv example SoC carries its firmware inside the bitstream, so they need only Vivado and xsdb, and they read the result off the USB-UART with pyserial. See [example system](#example-system--vexriscv-soc).

**Crossbar-only resource usage** (OOC synthesis, xc7a100t):

| Configuration | LUTs | FFs |
|---|---:|---:|
| Base 1M×4S (pipelined, max\_outstanding=4) | 382 | 40 |
| WRR 2M×4S (weighted round-robin, pipelined) | 818 | 92 |
| QoS 2M×4S (QoS arbitration, pipelined) | 1011 | 132 |
| QoS stress 4M×4S (QoS arbitration, pipelined) | 2587 | 208 |

Vivado TCL scripts and MicroBlaze firmware: [`hw/vivado/arty_a7/`](hw/vivado/arty_a7/) and [`sw/arty_a7/`](sw/arty_a7/).

---

## Port naming

```
                          axiZero crossbar
                  ┌──────────────────────────┐
   CPU / DMA ────►│ s0_axi_*    m0_axi_*  ├────► BRAM
                  │                          │
   Config port ──►│ s1_axi_*    m1_axi_*  ├────► GPIO (Lite)
                  │             m2_axi_*  ├────► UART (Lite)
                  └──────────────────────────┘
                 sN = slave-facing        mN = master-facing
                (connect masters here)  (connect slaves here)
```

`sN_axi_*` are the slave-facing interfaces — connect your AXI masters (CPUs, DMAs) here.
`mN_axi_*` are the master-facing interfaces — connect your AXI slaves (BRAMs, peripherals) here.

| Signal | Direction | Notes |
|---|---|---|
| `sN_axi_awvalid/awaddr/awready` | input | write address channel |
| `sN_axi_wvalid/wdata/wstrb/wready` | input | write data channel |
| `sN_axi_bvalid/bresp/bready` | output | write response channel |
| `sN_axi_arvalid/araddr/arready` | input | read address channel |
| `sN_axi_rvalid/rdata/rresp/rready` | output | read data channel |
| `sN_axi_awid/wid/bid/arid/rid` | — | Full AXI4 only |
| `sN_axi_awlen/awsize/awburst/…` | input | Full AXI4 only |
| `mN_axi_*` | reversed | crossbar drives the master-facing side |
| `aclk` | input | rising-edge clock |
| `aresetn` | input | active-low synchronous reset |

---

## Tool integration

### Plain RTL (Vivado, Quartus, Yosys, DC)

Add the generated Verilog to your project sources and instantiate it. All AXI signals are flat wires. This is how the [Arty A7 reference design](hw/vivado/arty_a7/create_project.tcl) is wired.

### Vivado IP packager

Port names match Vivado's AXI naming conventions, so IP Packager infers all interfaces automatically. [`hw/vivado/package_ip.tcl`](hw/vivado/package_ip.tcl) produces a packaged IP core:

```bash
vivado -mode batch -source hw/vivado/package_ip.tcl
# Output: hw/vivado/axizero_ip/  (contains component.xml)
```

To use: **IP Settings → IP Repositories → +** the `hw/vivado/axizero_ip` directory, then drag the IP into your block design. To package a different configuration, set `RTL_FILE` to the desired `generated/*.v` file and re-run.

### Quartus / Intel Platform Designer

[`hw/quartus/package_ip.tcl`](hw/quartus/package_ip.tcl) generates a `_hw.tcl` component description that maps all `sN_axi_*` / `mN_axi_*` ports to Platform Designer AXI4 or AXI4-Lite interfaces automatically. It parses the Verilog port list, detects Full vs Lite interfaces, and creates the correct clock/reset associations.

```bash
# Package the default 2M×2S Full AXI4 crossbar
quartus_sh -t hw/quartus/package_ip.tcl

# Package a different configuration
quartus_sh -t hw/quartus/package_ip.tcl generated/MyLite_1M4S.v
```

Output: `hw/quartus/axizero_ip/` containing `<ModuleName>_hw.tcl` and the Verilog source.

To use: **IP Components > Add Component Search Path** → add `hw/quartus/axizero_ip/`, then drag the component into your Platform Designer system. Clock, reset, and AXI interfaces are pre-mapped.

---

## Project structure

```
build.sbt
hw/spinal/axizero/
  AxiZeroConfig.scala          # configuration model
  AxiZeroTop.scala             # top-level (Lite-only / Mixed)
  crossbar/
    Axi4LiteCrossbar.scala     # Lite-only path (no ID logic)
    Axi4Crossbar.scala         # Full AXI4 path (ID expansion, pipelined)
  adapters/
    Axi4FullToLiteAdapter.scala
    Axi4LiteToFullAdapter.scala
    RegisterSlice.scala
    WidthConverter.scala       # Lite and Full AXI4 data-width conversion
    Axi4DownsizerExt.scala     # fork of SpinalHDL Axi4Downsizer; FIXED/WRAP flattened, INCR multi-beat
    Axi3ToAxi4Adapter.scala    # AXI3→AXI4 bridge: WID reorder buffer, locked access conversion
  stream/
    AxiStreamCores.scala       # AXI4-Stream reg slice, width adapter, FIFO, arb-mux, demux, broadcaster
  gen/
    AxiZeroGen.scala           # built-in generation entry point
    ArtyDutGen.scala           # Arty A7 DUT (1M×4S)
    ArtyQosDutGen.scala        # Arty A7 QoS DUT (2M×4S, QoS arbitration)
    ArtyAxi3DutGen.scala       # Arty A7 AXI3 adapter DUT (AXI4→AXI3→AXI4→crossbar)
hw/sim/axizero/sim/            # SpinalSim testbenches (sbt test)
hw/examples/vexriscv/          # VexRiscv example SoC — separate sbt project `vexZero`
  spinal/vexzero/
    VexZeroSoc.scala           # CPU + AxiZeroMixedTop + peripherals
    Peripherals.scala          # AXI4-Lite register bus, GPIO, system control
    Rv32.scala                 # RV32I encoder (no cross compiler needed)
    Firmware.scala             # boot image assembled from Rv32
    VexZeroArty.scala          # Arty A7-100T board wrapper: checks + LED/UART report
    VexZeroBenchArty.scala     # Arty A7-100T board wrapper: Dhrystone console over UART
    VexZeroBoard.scala         # clock/reset generation shared by the board wrappers
    VexZeroChecks.scala        # the self test's verdict, shared by the board wrappers
    VexZeroDe25.scala          # DE25-Nano board wrapper: verdict over JTAG-AXI
    VexZeroBenchDe25.scala     # DE25-Nano board wrapper: Dhrystone over JTAG-AXI
    JtagAxi.scala              # fpgacapZero JTAG-to-AXI bridge as an axiZero master
    HexImage.scala             # Intel HEX reader for prebuilt firmware images
    gen/VexZeroSocGen.scala    # -> generated/vexriscv/VexZeroSoc.v
    gen/VexZeroArtyGen.scala   # -> generated/vexriscv/VexZeroArty.v (ROM inlined)
    gen/VexZeroBenchArtyGen.scala  # -> generated/vexriscv/VexZeroBenchArty.v
    gen/VexZeroDe25Gen.scala   # -> generated/vexriscv/VexZero{,Bench}De25.v
  sim/vexzero/sim/             # SpinalSim tests for the example (sbt vexZero/test)
    VexZeroBenchSpec.scala     #   Dhrystone over the crossbar, pipelined vs blocking
    VexZeroProfileSpec.scala   #   what that run asks of the fabric, uncached vs cached
    VexZeroStressSpec.scala    #   the same SoC with a third master saturating the fabric
    HostTraffic.scala          #   the saturating master: 16-beat bursts, AW ahead of W
    AxiProfile.scala           #   per-port traffic shape, measured at the master ports
third_party/VexRiscv/          # pinned submodule, compiled by `vexZero` only
sim/cocotb_gen/
  run_all.py                   # Python runner (lite + full + wrr + qos + ipif + axis suites)
  lite/test_lite.py            # AxiLiteMaster tests against MyLite_1M4S.v
  full/test_full.py            # AxiMaster tests against MyFull_2M2S.v
scripts/
  axizero.py                   # YAML → Verilog generator
  example.yaml                 # all configuration options
generated/                     # pre-built Verilog
sw/arty_a7/                    # MicroBlaze firmware (source + linker script)
hw/quartus/
  package_ip.tcl               # Platform Designer _hw.tcl generator
hw/vivado/arty_a7/             # Vivado TCL build and test scripts
  ip/rtl/                      # tracked Arty handoff RTL consumed by Vivado IP integrator
  find_xilinx_tools.py         # cross-platform Vivado/xsdb/mb-gcc auto-detection
  run_wrr_test.py              # WRR HW test runner (build + program + verify)
  run_vexzero_test.py          # VexRiscv example SoC HW test runner (UART verdict)
  run_vexzero_bench.py         # VexRiscv example SoC Dhrystone runner (UART console)
  create_project_vexzero.tcl   # plain RTL project for either VexZero board wrapper
  run_qos_test.py              # QoS HW test runner
  run_qos_stress_test.py       # QoS 10-minute stress test runner
  run_axi3_test.py             # AXI3 adapter HW test runner
```

---

## License

MIT — see [LICENSE](LICENSE).
