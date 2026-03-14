# axiZero

[![CI](https://github.com/bard0-design/axiZero/actions/workflows/ci.yml/badge.svg)](https://github.com/bard0-design/axiZero/actions/workflows/ci.yml)
[![License: MIT](https://img.shields.io/badge/License-MIT-blue.svg)](LICENSE)
[![Board](https://img.shields.io/badge/HW--validated-Arty%20A7--100T-green)](hw/vivado/arty_a7/)

Author: Leonardo Capossio — bard0 design hello@bard0.com

Open source AXI4 / AXI4-Lite interconnect generator. Describe your bus topology in YAML, get Verilog. Or use a [pre-built output](generated/) directly.

MIT licensed. Built with [SpinalHDL](https://spinalhdl.github.io/SpinalDoc-RTD/).

Hardware-validated on Xilinx Arty A7-100T. 40 SpinalSim + 24 cocotb tests pass.

---

**Contents:** [What it does](#what-it-does) · [Comparison](#comparison) · [Quick start](#quick-start) · [YAML reference](#yaml-configuration-reference) · [Simulation](#simulation) · [Hardware validation](#hardware-validation--arty-a7-100t) · [Port naming](#port-naming) · [Tool integration](#tool-integration) · [Project structure](#project-structure) · [License](#license)

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

Requirements: Python 3.8+ with PyYAML, Java 11+ (tested with Java 21), [sbt](https://get-coursier.io/).

On Linux or WSL, Verilator 5.x is also required (it is invoked internally during generation to validate the output).

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

```yaml
designs:
  - name: MySoC                  # output filename: MySoC.v

    # Arbitration mode when multiple masters contend for the same slave.
    #
    # round_robin         — equal turns; no starvation (default)
    #
    # fixed_priority      — master 0 has highest priority, master N−1 lowest.
    #                       Priority is determined solely by master order in the
    #                       YAML (first listed = highest priority). No extra keys
    #                       are needed. Lower-index masters always win contention,
    #                       so higher-index masters may starve under sustained load.
    #
    # weighted_round_robin — like round_robin but master i receives weights[i]
    #                        grants per arbitration round. Requires the `weights`
    #                        key with one integer entry per master.
    #
    # qos                 — highest AXQOS wins; equal AXQOS falls back to round_robin.
    #                       Waiting requests gain age-based boost to prevent starvation.
    #
    arbitration: round_robin     # round_robin | fixed_priority | weighted_round_robin | qos
    weights: [3, 1]              # weighted_round_robin only; one integer per master

    # Maximum outstanding transactions per slave per direction (AW and AR).
    # 1 = blocking: one transaction per slave at a time, no FIFOs.
    # >1 = pipelined: per-slave W-route FIFOs, ID-based response routing.
    # Only affects Full AXI4. The Lite crossbar is always blocking.
    max_outstanding: 4

    # Optional: override the internal fabric data width. Defaults to the
    # maximum data_width across all ports.
    # AXI4-Lite ports: zero-extend / truncate converter inserted automatically.
    # Full AXI4 ports: burst-level upsizer or downsizer inserted automatically.
    fabric_data_width: 64

    masters:
      - type: full               # full | lite
        addr_width: 32
        data_width: 64
        id_width: 4              # full AXI4 only
        reg_slice: false         # insert a register slice on this port

      - type: lite
        addr_width: 32
        data_width: 32
        reg_slice: false

    slaves:
      - base: 0x0000_0000
        size: 0x8000_0000
        type: full
        data_width: 64
        reg_slice: false

      - base: 0x8000_0000
        size: 0x0001_0000
        type: full
        data_width: 64

      - base: 0xC000_0000
        size: 0x0000_1000
        type: lite               # Full→Lite adapter inserted automatically
        data_width: 32
```

Full example with all options: [`scripts/example.yaml`](scripts/example.yaml).

---

## Simulation

Requires Verilator 5.x on Linux or WSL.

### SpinalSim (unit tests, run with sbt)

```bash
sbt test
```

40 tests pass across 8 suites:

| Suite | Tests | Description |
|---|---|---|
| `LiteCrossbarSpec` | 6 | AXI4-Lite crossbar: arbitration, address decode, WRR |
| `PipelinedCrossbarSpec` | 8 | Full AXI4: bursts, back-pressure, outstanding transactions |
| `MixedCrossbarSpec` | 4 | Full↔Lite adapters, mixed address maps |
| `ArtySpec` | 5 | Sequence matching the Arty A7 hardware tests (T4, T5, T6, T9, combined) |
| `IpifWriteSpec` | 5 | IPIF-style slaves (Xilinx GPIO/UART-Lite require AW+W simultaneous), blocking and pipelined modes |
| `WidthConverterSpec` | 6 | Full AXI4 width conversion: 32→64 upsize, 64→32 downsize, 32→64→32 passthrough; single-beat, burst, routing |
| `QosCrossbarSpec` | 5 | QoS arbitration: higher AWQOS/ARQOS wins (blocking + pipelined), equal-QoS round-robin tie-break, aging anti-starvation |
| `QosStressShortSpec` | 1 | Short 4-master QoS stress: distinct patterns (sequential, reverse, sparse, random short bursts), concurrent traffic, end-state validation |

### cocotb (integration tests against pre-built Verilog, run with Python)

Tests the generated Verilog files directly using [cocotbext-axi](https://github.com/alexforencich/cocotbext-axi) bus functional models.

```bash
# requires: pip install cocotb cocotbext-axi
python3 sim/cocotb_gen/run_all.py          # all suites
python3 sim/cocotb_gen/run_all.py lite     # MyLite_1M4S.v only
python3 sim/cocotb_gen/run_all.py full     # MyFull_2M2S.v only
python3 sim/cocotb_gen/run_all.py wrr      # MyLite_2M2S_WRR.v only
python3 sim/cocotb_gen/run_all.py qos      # MyFull_2M2S_QoS.v only
```

24 tests pass across 4 suites:

| Suite | DUT | Tests | Description |
|---|---|---|---|
| `lite` | `MyLite_1M4S.v` | 6 | AxiLiteMaster → 4-slave crossbar: single R/W, address routing, sequential writes, multi-slave pattern, overwrite isolation, 60× random |
| `full` | `MyFull_2M2S.v` | 6 | AxiMaster → 2-slave crossbar: single R/W, address routing + isolation, 16-beat burst, 64-beat burst (AWLEN=63), alternating slaves, 40× random |
| `wrr` | `MyLite_2M2S_WRR.v` | 6 | 2-master WRR crossbar: dual-master R/W, address routing, concurrent bandwidth, no starvation, concurrent different slaves, 80× random |
| `qos` | `MyFull_2M2S_QoS.v` | 6 | 2-master QoS crossbar: dual-master R/W, address routing, higher QoS wins contention, equal-QoS round-robin, aging anti-starvation, QoS read priority |

---

## Hardware validation — Arty A7-100T

Three test suites run on a Xilinx Arty A7-100T (xc7a100t) at 100 MHz. All three pass.

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

### Running HW tests

All three test runners auto-detect Vivado, xsdb, and mb-gcc by searching `PATH` and common AMD/Xilinx install locations (Windows and Linux). Override with environment variables if needed:

```bash
# Auto-detect (works on Windows and Linux)
python hw/vivado/arty_a7/run_wrr_test.py
python hw/vivado/arty_a7/run_qos_test.py
python hw/vivado/arty_a7/run_qos_stress_test.py

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

The `sN_axi_*` / `mN_axi_*` naming is Xilinx-specific. Platform Designer does not auto-infer these interfaces. Add the Verilog as a plain component and map AXI signals manually in the Component Editor → Signals & Interfaces tab.

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
    Axi4DownsizerExt.scala     # fork of SpinalHDL Axi4Downsizer with FIXED/INCR/WRAP support
  gen/
    AxiZeroGen.scala           # built-in generation entry point
    ArtyDutGen.scala           # Arty A7 DUT (1M×4S)
    ArtyQosDutGen.scala        # Arty A7 QoS DUT (2M×4S, QoS arbitration)
hw/sim/axizero/sim/            # SpinalSim testbenches (sbt test)
sim/cocotb_gen/
  run_all.py                   # Python runner (lite + full suites)
  lite/test_lite.py            # AxiLiteMaster tests against MyLite_1M4S.v
  full/test_full.py            # AxiMaster tests against MyFull_2M2S.v
scripts/
  axizero.py                   # YAML → Verilog generator
  example.yaml                 # all configuration options
generated/                     # pre-built Verilog
sw/arty_a7/                    # MicroBlaze firmware (source + linker script)
hw/vivado/arty_a7/             # Vivado TCL build and test scripts
  find_xilinx_tools.py         # cross-platform Vivado/xsdb/mb-gcc auto-detection
  run_wrr_test.py              # WRR HW test runner (build + program + verify)
  run_qos_test.py              # QoS HW test runner
  run_qos_stress_test.py       # QoS 10-minute stress test runner
```

---

## License

MIT — see [LICENSE](LICENSE).
