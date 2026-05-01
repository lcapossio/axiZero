# axiZero

[![CI](https://github.com/lcapossio/axiZero/actions/workflows/ci.yml/badge.svg)](https://github.com/lcapossio/axiZero/actions/workflows/ci.yml)
[![License: MIT](https://img.shields.io/badge/License-MIT-blue.svg)](LICENSE)
[![Board](https://img.shields.io/badge/HW--validated-Arty%20A7--100T-green)](hw/vivado/arty_a7/)

Author: Leonardo Capossio — bard0 design hello@bard0.com

Open source AXI4 / AXI4-Lite interconnect generator. Describe your bus topology in YAML, get Verilog. Or use a [pre-built output](generated/) directly.

MIT licensed. Built with [SpinalHDL](https://spinalhdl.github.io/SpinalDoc-RTD/).

Hardware-validated on Xilinx Arty A7-100T. 96 SpinalSim + 33 cocotb tests pass.

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

Eleven configurations are pre-generated in [`generated/`](generated/). Copy the appropriate file into your project and instantiate it.

Resource usage is post-synthesis (Vivado 2025.2, xc7a100t, OOC mode). No BRAM or DSP used by any configuration.

| File | Description | LUTs | FFs |
|---|---|---:|---:|
| `MyLite_1M4S.v` | 1M×4S AXI4-Lite, round-robin | 237 | 8 |
| `AxiZeroLite_1M4S.v` | 1M×4S AXI4-Lite, round-robin (wider addr) | 245 | 8 |
| `MyLite_2M2S_WRR.v` | 2M×2S AXI4-Lite, weighted round-robin (3:1) | 352 | 286 |
| `MyLite_2M4S_FP.v` | 2M×4S AXI4-Lite, fixed priority | 527 | 16 |
| `AxiZeroLite_2M4S_RS.v` | 2M×4S AXI4-Lite, register slices on all ports | 563 | 784 |
| `AxiZeroLite_4M4S_FP.v` | 4M×4S AXI4-Lite, fixed priority | 1047 | 24 |
| `MyFull_2M2S.v` | 2M×2S AXI4 Full, 64-bit, round-robin | 379 | 4 |
| `MyFull_2M2S_QoS.v` | 2M×2S AXI4 Full, 64-bit, QoS arbitration | 626 | 62 |
| `MyMixed_2M3S.v` | 2M×3S mixed (Full + Lite), auto adapters | 421 | 34 |
| `ArtyDC_1M3S.v` | 1M×3S mixed, Arty A7 don't-care default config | 258 | 8 |
| `ArtyDC_2M4S.v` | 2M×4S mixed, Arty A7 don't-care default config | 591 | 28 |

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
| `AxiStreamCoreSpec` | 10 | AXI4-Stream utility cores: register slice, width adapter, FIFO, packet arb-mux, packet demux, broadcaster, sparse TKEEP/TSTRB/TLAST edge cases |

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

33 tests pass across 6 suites:

| Suite | DUT | Tests | Description |
|---|---|---|---|
| `lite` | `MyLite_1M4S.v` | 6 | AxiLiteMaster → 4-slave crossbar: single R/W, address routing, sequential writes, multi-slave pattern, overwrite isolation, 60× random |
| `full` | `MyFull_2M2S.v` | 6 | AxiMaster → 2-slave crossbar: single R/W, address routing + isolation, 16-beat burst, 64-beat burst (AWLEN=63), alternating slaves, 40× random |
| `wrr` | `MyLite_2M2S_WRR.v` | 6 | 2-master WRR crossbar: dual-master R/W, address routing, concurrent bandwidth, no starvation, concurrent different slaves, 80× random |
| `qos` | `MyFull_2M2S_QoS.v` | 6 | 2-master QoS crossbar: dual-master R/W, address routing, higher QoS wins contention, equal-QoS round-robin, aging anti-starvation, QoS read priority |
| `ipif` | `MyLite_1M4S.v` | 4 | IPIF slave compatibility: strict IpifRam model requires AWVALID+WVALID simultaneously, routing unaffected |
| `axis` | generated AXI4-Stream cores | 5 | cocotbext-axi stream BFM tests for reg slice, width adapter, arb-mux, demux, broadcaster |

---

## Hardware validation — Arty A7-100T

Four test suites run on a Xilinx Arty A7-100T (xc7a100t) at 100 MHz. All four pass.

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

Topology: MicroBlaze -> axiZero 1M x 5S -> the normal base-test slaves plus a 32-bit AXI GPIO input at `0xC004_0000`.

The GPIO samples a self-running `AxiStreamArtySmoke` datapath:

`3 sources` -> `AxiStreamArbMux` -> `AxiStreamFifo` -> `AxiStreamRegSlice` -> `AxiStreamWidthAdapter` 32-to-8 -> `AxiStreamDemux` -> direct byte sink or `AxiStreamWidthAdapter` 8-to-32 -> `AxiStreamBroadcaster`.

The smoke engine sends three two-beat 32-bit frames, arbitrates between all three sources, unpacks to bytes, routes frame 1 through the repack/broadcast path and frames 0/2 through the direct byte path, deliberately stalls one broadcast sink, then reports done/pass/fail, byte counts, frame counts, checksum matches, route checks, and backpressure observation. The MicroBlaze firmware polls that status through axiZero and passes only when the board-observed status has `done=1`, `pass=1`, `fail=0`, the expected counts/checksums/frame boundaries match, and backpressure was actually seen.

### Running HW tests

All four test runners auto-detect Vivado, xsdb, and mb-gcc by searching `PATH` and common AMD/Xilinx install locations (Windows and Linux). Override with environment variables if needed:

```bash
# Auto-detect (works on Windows and Linux)
python hw/vivado/arty_a7/run_wrr_test.py
python hw/vivado/arty_a7/run_qos_test.py
python hw/vivado/arty_a7/run_qos_stress_test.py
python hw/vivado/arty_a7/run_axi3_test.py
python hw/vivado/arty_a7/run_axis_test.py

# Override tool paths via env vars
VIVADO_BIN=/opt/Xilinx/2025.2/Vivado/bin/vivado \
XSDB_BIN=/opt/Xilinx/2025.2/Vitis/bin/xsdb \
MBGCC_BIN=/opt/Xilinx/2025.2/Vitis/gnu/microblaze/lin64/bin/mb-gcc \
  python hw/vivado/arty_a7/run_qos_stress_test.py
```

Each runner: (1) creates the Vivado project + bitstream if not already built, (2) compiles MicroBlaze firmware with mb-gcc, (3) programs the FPGA and runs tests via xsdb.

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
  run_qos_test.py              # QoS HW test runner
  run_qos_stress_test.py       # QoS 10-minute stress test runner
  run_axi3_test.py             # AXI3 adapter HW test runner
```

---

## License

MIT — see [LICENSE](LICENSE).
