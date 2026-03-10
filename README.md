# axiZero

[![CI](https://github.com/YOUR_ORG/axiZero/actions/workflows/ci.yml/badge.svg)](https://github.com/YOUR_ORG/axiZero/actions/workflows/ci.yml)
[![License: MIT](https://img.shields.io/badge/License-MIT-blue.svg)](LICENSE)
[![Board](https://img.shields.io/badge/HW--validated-Arty%20A7--100T-green)](hw/vivado/arty_a7/)

Author: Leonardo Capossio — bard0 design hello@bard0.com

Open source AXI4 / AXI4-Lite interconnect generator. Describe your bus topology in YAML, get Verilog. Or use a [pre-built output](generated/) directly.

MIT licensed. Built with [SpinalHDL](https://spinalhdl.github.io/SpinalDoc-RTD/).

Hardware-validated on Xilinx Arty A7-100T. 26 SpinalSim + 12 cocotb tests pass.

---

## What it does

axiZero generates a non-blocking AXI interconnect that routes M masters to N slaves based on a static address map. Each port can be independently configured as AXI4 or AXI4-Lite; the required adapters are inserted automatically.

**Implemented and working:**

- AXI4 full (with IDs, bursts, outstanding transactions)
- AXI4-Lite (no IDs, single-beat)
- Per-port mixed AXI4 / AXI4-Lite with automatic adapter insertion
- AXI4-Lite data-width conversion (zero-extend / truncate at port boundaries)
- Register slices, per master and per slave port
- Round-robin and fixed-priority arbitration
- Pipelined mode (`max_outstanding > 1`) with per-slave W-route FIFOs and ID-based response routing
- IPIF compatibility — AW and W are presented simultaneously to slaves that require it
- YAML → Verilog generator with port-name post-processing for Vivado AXI naming conventions

**Accepted in config but not yet implemented (falls back with elaboration warning):**

- `weighted_round_robin` — falls back to round-robin
- `qos` — falls back to round-robin (AXQOS field is ignored)

**Not yet implemented:**

- Full AXI4 data-width conversion (burst-splitting / beat-merging): equal data widths required across Full AXI4 ports. Mismatched widths are rejected at elaboration time.
- Clock domain crossing: all ports share a single clock (`aclk`) and reset (`aresetn`).
- AXI4-Lite crossbar pipelined mode: the Lite-only path is always single-outstanding per slave.
- WRAP and FIXED burst types: only INCR bursts are routed. The crossbar does not inspect or transform `AxBURST`.

---

## Comparison

| | axiZero | PULP axi | verilog-axi | taxi | dpretet/axi-crossbar |
|---|:---:|:---:|:---:|:---:|:---:|
| License | MIT | SHL-0.51 | MIT | CERN-OHL-S¹ | MIT |
| AXI4 full | ✓ | ✓ | ✓ | ✓ | ✓ |
| AXI4-Lite | ✓ | ✓ | ✓ | ✓ | ✓ |
| Per-port mixed AXI4/Lite | ✓ | — | — | — | — |
| AXI4-Lite data-width conversion | ✓ | ✓ | ✓ | ✓ | — |
| Full AXI4 data-width conversion | planned | ✓ | ✓ | ✓ | — |
| Register slices | ✓ | ✓ | ✓ | ✓ | — |
| Round-robin / fixed-priority arbitration | ✓ | ✓ | ✓ | ✓ | ✓ |
| Weighted / QoS arbitration | planned² | ✓ | — | — | ✓ |

¹ CERN-OHL-S is copyleft (share-alike); requires releasing your full digital design on request.
² `weighted_round_robin` and `qos` are accepted as config values but currently fall back to round-robin with an elaboration warning.

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

Seven configurations are pre-generated in [`generated/`](generated/). Copy the appropriate file into your project and instantiate it.

```
generated/
  MyLite_1M4S.v             1 master, 4 AXI4-Lite slaves, round-robin
  AxiZeroLite_1M4S.v        1 master, 4 AXI4-Lite slaves, round-robin (wider addr variant)
  AxiZeroLite_2M4S_RS.v     2 masters, 4 AXI4-Lite slaves, register slices on all ports
  AxiZeroLite_4M4S_FP.v     4 masters, 4 AXI4-Lite slaves, fixed priority
  MyFull_2M2S.v             2 masters, 2 AXI4 Full slaves, 64-bit, round-robin
  MyLite_2M2S_WRR.v         2 masters, 2 AXI4-Lite slaves (WRR config, runs as round-robin)
  MyMixed_2M3S.v            2 masters (Full + Lite), 3 mixed slaves
```

If none of these match your topology, generate a custom one with Option A.

---

## YAML configuration reference

```yaml
designs:
  - name: MySoC                  # output filename: MySoC.v

    # Arbitration: round_robin and fixed_priority are fully implemented.
    # weighted_round_robin and qos fall back to round_robin with a warning.
    arbitration: round_robin     # round_robin | fixed_priority | weighted_round_robin | qos
    weights: [3, 1]              # weighted_round_robin only; one entry per master

    # Maximum outstanding transactions per slave per direction (AW and AR).
    # 1 = blocking: one transaction per slave at a time, no FIFOs.
    # >1 = pipelined: per-slave W-route FIFOs, ID-based response routing.
    # Only affects Full AXI4. The Lite crossbar is always blocking.
    max_outstanding: 4

    # Optional: override the internal fabric data width. Defaults to the
    # maximum data_width across all ports. AXI4-Lite width converters are
    # inserted at ports that are narrower than the fabric. Full AXI4 ports
    # must match the fabric width (data-width conversion not yet implemented).
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

26 tests pass across 5 suites:

| Suite | Tests | Description |
|---|---|---|
| `LiteCrossbarSpec` | 4 | AXI4-Lite crossbar: arbitration, address decode |
| `PipelinedCrossbarSpec` | 8 | Full AXI4: bursts, back-pressure, outstanding transactions |
| `MixedCrossbarSpec` | 4 | Full↔Lite adapters, mixed address maps |
| `ArtySpec` | 5 | Sequence matching the Arty A7 hardware tests (T4, T5, T6, T9, combined) |
| `IpifWriteSpec` | 5 | IPIF-style slaves (Xilinx GPIO/UART-Lite require AW+W simultaneous), blocking and pipelined modes |

### cocotb (integration tests against pre-built Verilog, run with Python)

Tests the generated Verilog files directly using [cocotbext-axi](https://github.com/alexforencich/cocotbext-axi) bus functional models.

```bash
# requires: pip install cocotb cocotbext-axi
python3 sim/cocotb_gen/run_all.py          # both suites
python3 sim/cocotb_gen/run_all.py lite     # MyLite_1M4S.v only
python3 sim/cocotb_gen/run_all.py full     # MyFull_2M2S.v only
```

12 tests pass across 2 suites:

| Suite | DUT | Tests | Description |
|---|---|---|---|
| `lite` | `MyLite_1M4S.v` | 6 | AxiLiteMaster → 4-slave crossbar: single R/W, address routing, sequential writes, multi-slave pattern, overwrite isolation, 60× random |
| `full` | `MyFull_2M2S.v` | 6 | AxiMaster → 2-slave crossbar: single R/W, address routing + isolation, 16-beat burst, 64-beat burst (AWLEN=63), alternating slaves, 40× random |

---

## Hardware validation — Arty A7-100T

Topology: MicroBlaze LE (M\_AXI\_DP) → axiZero 1M×4S → 2× AXI4 BRAM ctrl + AXI-Lite GPIO + AXI-Lite UART-Lite, 100 MHz, `max_outstanding=4`.

All 10 tests pass (g\_fail=0, g\_pass=10).

| Test | Description |
|---|---|
| T1–T3 | Single-word write/read, address isolation (AXI4 Full) |
| T4–T6 | 64-word sequential, walking-1, alternating-stride across both BRAMs |
| T7 | GPIO 16-pattern LED sweep (AXI-Lite) |
| T8 | UART-Lite TX FIFO reset and drain (AXI-Lite) |
| T9 | Full 64 KB BRAM checkerboard — 16 384 word write + verify |
| T10 | Cross-slave boundary: last word of BRAM #0, first word of BRAM #1 |

Vivado TCL scripts and MicroBlaze firmware: [`hw/vivado/arty_a7/`](hw/vivado/arty_a7/) and [`sw/arty_a7/`](sw/arty_a7/).

---

## Port naming

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
    WidthConverter.scala       # Lite: implemented; Full: equal-width passthrough only
  gen/
    AxiZeroGen.scala           # built-in generation entry point
    ArtyDutGen.scala           # Arty A7 DUT
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
```

---

## License

MIT — see [LICENSE](LICENSE).
