# axiZero

[![CI](https://github.com/lcapossio/axiZero/actions/workflows/ci.yml/badge.svg)](https://github.com/lcapossio/axiZero/actions/workflows/ci.yml)
[![License: MIT](https://img.shields.io/badge/License-MIT-blue.svg)](LICENSE)
[![Board](https://img.shields.io/badge/HW--validated-Arty%20A7--100T-green)](hw/vivado/arty_a7/)

Author: Leonardo Capossio — [bard0 design](https://www.bard0.com) — hello@bard0.com

Open source AXI4 / AXI4-Lite interconnect generator. Describe your bus topology in YAML, get Verilog. Or use a [pre-built output](generated/) directly.

MIT licensed. Built with [SpinalHDL](https://spinalhdl.github.io/SpinalDoc-RTD/).

Hardware-validated on Xilinx Arty A7-100T and Altera DE25-Nano. 245 SpinalSim + 46 cocotb tests pass.

---

## Table of contents

- [What it does](#what-it-does)
- [Comparison](#comparison)
- [Quick start](#quick-start)
  - [Option A — generate from YAML](#option-a--generate-from-yaml)
  - [Option B — use a pre-built Verilog file](#option-b--use-a-pre-built-verilog-file)
  - [Option C — instantiate it from Scala](#option-c--instantiate-it-from-scala)
- [YAML configuration reference](#yaml-configuration-reference)
  - [Top-level keys](#top-level-keys)
  - [Master port keys](#master-port-keys)
  - [Slave port keys](#slave-port-keys)
  - [Arbitration modes](#arbitration-modes)
  - [Data-width conversion](#data-width-conversion)
  - [Pipelined vs blocking mode](#pipelined-vs-blocking-mode)
  - [Transaction ordering](#transaction-ordering)
  - [Decode errors](#decode-errors)
  - [AXI4-Stream utility cores](#axi4-stream-utility-cores)
- [Simulation](#simulation)
  - [SpinalSim (unit tests)](#spinalsim-unit-tests-run-with-sbt)
  - [cocotb (integration tests)](#cocotb-integration-tests-against-pre-built-verilog-run-with-python)
- [Protocol checking](#protocol-checking)
- [Example system — VexRiscv SoC](#example-system--vexriscv-soc)
  - [Running it](#running-it)
  - [No cross compiler required](#no-cross-compiler-required)
  - [On hardware](#on-hardware)
  - [Benchmark — Dhrystone](#benchmark--dhrystone)
  - [What Dhrystone does not test](#what-dhrystone-does-not-test)
  - [Stress — the crossbar under load](#stress--the-crossbar-under-load)
  - [QoS, and when it stops working](#qos-and-when-it-stops-working)
  - [Loading the crossbar on hardware](#loading-the-crossbar-on-hardware)
  - [Video — a third-party IP core writing frames to RAM](#video--a-third-party-ip-core-writing-frames-to-ram)
  - [A second board — DE25-Nano (Agilex 5)](#a-second-board--de25-nano-agilex-5)
- [Hardware validation](#hardware-validation)
  - [The current suites](#the-current-suites)
  - [Retired — the MicroBlaze suites](#retired--the-microblaze-suites)
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
- Decode-error responses — an address that falls outside every slave's range is completed with `DECERR` on B or R instead of being left unacknowledged, so a stray address raises a bus fault rather than wedging the master forever
- A synthesizable AXI4 protocol checker — 19 rules, passive, one sticky bit each, running in simulation and in the bitstream from the same source; it is what caught the arbitration bug described in [Protocol checking](#protocol-checking)
- A synthesizable saturating self-checking traffic generator — keeps several bursts in flight and reads back every word it wrote, so a crossbar can be loaded and judged on the board and not only in simulation; see [loading the crossbar on hardware](#loading-the-crossbar-on-hardware)
- YAML → Verilog generator with port-name post-processing for Vivado AXI naming conventions
- AXI3-to-AXI4 bridge adapter with WID reorder buffer (write interleaving → strict AW-order), locked access conversion, LEN/LOCK field adaptation

- Standalone AXI4-Stream utility cores: register slice, width adapter, FIFO, packet arb-mux, packet demux, broadcaster
- VexRiscv example SoC: a RISC-V core booting through the crossbar into a mixed AXI4 / AXI4-Lite address map, in simulation and on an Arty A7-100T
- Dhrystone 2.1 on that SoC, in simulation and on the board, with per-port AXI latency and occupancy measured at the crossbar
- A system-level stress test: the same SoC with caches on and a third master saturating the fabric — 100.0% occupied and 80.8% of cycles contended, 1,064,161 burst beats checked against their expected values while the program on top still passes all 20 of its own self-checks
- QoS measured where it matters: ranking the masters moves 9.2 points of bus share with 4-beat bursts and 0.3 with 16-beat ones, because the crossbar's anti-starvation age boost erases a priority gap that is smaller than the wait
- A third-party video IP core (vtpgZero) as a fourth master, writing real 16-beat frames into RAM while the CPU runs from it — the only bursting write master in the design, and the one that found a response-routing bug in the Lite adapter
- The same SoC on two FPGA families — Xilinx Artix-7 and Altera Agilex 5 — with a JTAG-to-AXI bridge acting as a third bus master on the board that has no UART
- Arbitration validated on real silicon rather than only in simulation: four bitstreams — round robin, weighted, QoS, and one with the CPU's load/store path routed through the AXI3 adapter — each driven by two self-checking generators that hold the fabric contended 97% of the time in simulation of the same configuration, and each built for both vendors from one configuration object
- AXI4's **same-ID ordering rule** validated on silicon too, which needs a master that actually varies its ID — nothing else here does, VexRiscv included. A fifth bitstream runs two multi-ID generators across two RAMs, each checking in hardware that every response came back under the right ID and in the right order, with a probe on the crossbar's own master port watching the single-slave-per-ID rule where it is enforced rather than inferring it from answers that arrived. Write responses carry only an ID and a status, so a swapped BID would be invisible between two RAMs that both answer OKAY: the generators write to an unmapped address as well, and hold every response to what its ID was owed

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

Every key the config file accepts — port modes, address maps, data and ID widths, arbitration
policy, register slices, outstanding depth — is documented in the
[YAML configuration reference](#yaml-configuration-reference), along with what the generator
validates before it emits anything.

### Option B — use a pre-built Verilog file

Fifteen configurations are pre-generated in [`generated/`](generated/). Copy the appropriate file into your project and instantiate it.

Resource usage is post-synthesis, out-of-context, Vivado 2025.2 targeting
xc7a100tcsg324-1 with no timing constraint applied; Fmax is derived from the
worst-case path Vivado reports under those conditions, so treat it as an upper
bound rather than a closed-timing figure. `n/a` means the design had no
internal path for Vivado to rank. Regenerate the whole table with
`vivado -mode batch -source hw/vivado/synth_resource_usage.tcl`. No BRAM or DSP
is used by any configuration. The memory-mapped configurations include the decode-error
responder, which is on by default; the AXI4-Stream cores have no address map and are unaffected.

| File | Description | LUTs | FFs | LUTRAM | Fmax (MHz) |
|---|---|---:|---:|---:|---:|
| `MyLite_1M4S.v` | 1M×4S AXI4-Lite, round-robin | 278 | 13 | 0 | 344.8 |
| `AxiZeroLite_1M4S.v` | 1M×4S AXI4-Lite, round-robin (wider addr) | 278 | 13 | 0 | n/a |
| `MyLite_2M2S_WRR.v` | 2M×2S AXI4-Lite, weighted round-robin (3:1) | 387 | 301 | 0 | 185.2 |
| `MyLite_2M4S_FP.v` | 2M×4S AXI4-Lite, fixed priority | 555 | 23 | 0 | 322.6 |
| `AxiZeroLite_2M4S_RS.v` | 2M×4S AXI4-Lite, register slices on all ports | 668 | 793 | 0 | n/a |
| `AxiZeroLite_4M4S_FP.v` | 4M×4S AXI4-Lite, fixed priority | 1467 | 33 | 0 | n/a |
| `MyFull_2M2S.v` | 2M×2S AXI4 Full, 64-bit, round-robin | 644 | 37 | 0 | 227.3 |
| `MyFull_2M2S_QoS.v` | 2M×2S AXI4 Full, 64-bit, QoS arbitration | 772 | 114 | 6 | 125.0 |
| `MyMixed_2M3S.v` | 2M×3S mixed (Full + Lite), auto adapters | 580 | 59 | 0 | 263.2 |
| `MyAxisRegSlice.v` | AXI4-Stream register slice, 32-bit | 2 | 42 | 0 | 500.0 |
| `MyAxisWidth_8To32.v` | AXI4-Stream width adapter, 8→32-bit | 10 | 44 | 0 | 333.3 |
| `MyAxisFifo.v` | AXI4-Stream FIFO, 32-bit | 42 | 57 | 28 | 294.1 |
| `MyAxisMux_2To1.v` | AXI4-Stream arb-mux, 2→1, round-robin | 49 | 3 | 0 | 434.8 |
| `MyAxisDemux_1To2.v` | AXI4-Stream demux, 1→2 | 6 | 3 | 0 | 434.8 |
| `MyAxisBroadcaster_1To2.v` | AXI4-Stream broadcaster, 1→2 | 2 | 0 | 0 | n/a |

Every file in the table is reproducible from the generators, and CI regenerates
and compares them on each run, so the table cannot drift from the RTL unnoticed.

If none of these match your topology, generate a custom one with Option A.

### Option C — instantiate it from Scala

The YAML flow is a front end: it emits Scala that calls the same API described here, so anything the
generator can build can be built directly, and a few things it cannot — an `Axi4Config` with an
unusual combination of optional signals, for instance — can only be built this way. If your design
is already SpinalHDL, this is the shorter path, because the crossbar becomes an ordinary `Component`
you wire up rather than a Verilog file you instantiate.

There are three tops, all taking the same `AxiZeroConfig`: `AxiZeroLiteTop` when every port is
AXI4-Lite, `AxiZeroFullTop` when every port is full AXI4, and `AxiZeroMixedTop` for any mixture,
which inserts the Full↔Lite adapters and width converters for you. The mixed top is the general
case and the other two are narrower, cheaper specialisations.

```scala
import spinal.core._
import spinal.lib.bus.amba4.axi.Axi4Config
import axizero._

object MyFabric extends App {

  val cpuCfg = Axi4Config(addressWidth = 32, dataWidth = 32, idWidth = 4)
  val ramCfg = Axi4Config(addressWidth = 32, dataWidth = 32, idWidth = 5)

  // An AXI4-Lite port is a full config with the optional signals turned off.
  val regCfg = Axi4Config(
    addressWidth = 32, dataWidth = 32,
    useId = false, useRegion = false, useBurst = false, useLock = false,
    useCache = false, useSize = false, useQos = false, useLen = false,
    useLast = false, useResp = true, useProt = true, useStrb = true
  )

  val cfg = AxiZeroConfig(
    masters = Seq(
      MasterPort(cpuCfg, FullAxi4, regSlice = true),
      MasterPort(cpuCfg, FullAxi4)
    ),
    slaves = Seq(
      SlavePort(ramCfg, FullAxi4, baseAddress = 0x80000000L, size = 64 KiB),
      SlavePort(regCfg, LiteAxi4, baseAddress = 0xf0000000L, size = 4 KiB)
    ),
    arbitration    = QosBased,
    maxOutstanding = 4
  )

  SpinalConfig(targetDirectory = "generated")
    .generateVerilog(new AxiZeroMixedTop(cfg))
}
```

Slave-side ID width must leave room for the originating master index — `slaveSideIdWidth` on the
config gives the rule, which is why `ramCfg` above is one bit wider than `cpuCfg`. The constructor
checks the address map for overlap, power-of-two sizes and alignment, so a bad map fails at
elaboration with a message rather than in simulation.

Master ports need not agree on their ID width: the fabric carries the widest of them and a narrower
port has its IDs zero-extended on the way in and truncated on the way back, so a CPU with a single
ID can sit next to a master that runs four. A design whose masters all declare the same width gets
exactly the netlist it did before — the padding is only inserted where the widths differ.

To wire it into a design instead of emitting Verilog, the ports are plain `Vec[Axi4]`, named from
the crossbar's point of view: `io.masters` are slave interfaces you drive from your masters, and
`io.slaves` are master interfaces you connect to your slaves.

```scala
val fabric = new AxiZeroMixedTop(cfg)
fabric.io.masters(0) << cpu.iBus          // your master drives the fabric
fabric.io.masters(1) << cpu.dBus
ram.io.axi           << fabric.io.slaves(0).toShared()   // fabric drives your slave
regBlock.io.ctrl     << fabric.io.slaves(1)
```

[`VexZeroSoc`](hw/examples/vexriscv/spinal/vexzero/VexZeroSoc.scala) is a worked example of exactly
this: a four-master SoC built around `AxiZeroMixedTop` in Scala, with a VexRiscv on two of the
ports. The AXI4-Stream cores in `axizero.stream` and the standalone adapters in `axizero.adapters`
— AXI3→AXI4, Full→Lite, register slices, width converters — are instantiated the same way.

**Getting the dependency.** axiZero is not published to a public repository yet, so there is no
coordinate to depend on. Until there is, use it as a source dependency, or run `sbt publishLocal`
and depend on `"io.axizero" %% "axizero" % "0.4.0"` from the local Ivy cache. Note that
`AxiZeroUserGen.scala` in `hw/spinal/axizero/gen/` is written by `scripts/axizero.py` and
overwritten on every YAML run — it is the generator's output, not a file to edit or copy from.

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
| `id_threads` | int | `2` | How many distinct in-flight transaction IDs the pipelined crossbar tracks per master per direction, to keep same-ID transactions in issue order. Ignored when `max_outstanding` is 1. See [Transaction ordering](#transaction-ordering). |
| `fabric_data_width` | int | max of all ports | Override the internal fabric data width. Width converters are inserted automatically at any port whose `data_width` differs. See [Data-width conversion](#data-width-conversion). |
| `decode_error_response` | bool | `true` | Answer an address that decodes to no slave with `DECERR`. Set `false` to restore the older behaviour, where such an address is never acknowledged. See [Decode errors](#decode-errors). |

### Master port keys

Each entry in the `masters` list defines one slave-facing AXI interface on the crossbar (where you connect your CPU, DMA, etc.).

| Key | Type | Default | Description |
|---|---|---|---|
| `type` | string | `full` | `full` (AXI4 with IDs and bursts), `lite` (AXI4-Lite, single-beat, no IDs), or `axi3` (AXI3 master — see below). A Lite master gets an automatic Lite-to-Full adapter; an AXI3 master gets an automatic AXI3-to-AXI4 bridge. |
| `addr_width` | int | *required* | Address bus width in bits (typically 32). AXI3 limit: ≤ 32. |
| `data_width` | int | *required* | Data bus width in bits (32, 64, 128, …). If it differs from `fabric_data_width`, a width converter is inserted. |
| `id_width` | int | `4` | Transaction ID width. Full AXI4 and AXI3 only; ignored for Lite. AXI3 limit: ≤ 4. The crossbar appends `ceil(log2(nMasters))` master-index bits internally. |
| `reg_slice` | bool | `false` | Insert a register slice (pipeline stage) on this master port for timing closure. Registers VALID and the payload; READY stays combinational through the slice. |
| `reg_slice_skid` | bool | `false` | Make that slice a full pipe, so the READY the master sees is registered too. Needs `reg_slice`. Costs one more set of payload registers on AW/W/AR; forward latency and throughput are unchanged. |

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
| `reg_slice` | bool | `false` | Insert a register slice on this slave port. Registers VALID and the payload; READY stays combinational through the slice. |
| `reg_slice_skid` | bool | `false` | Make that slice a full pipe, so the READY the fabric sees is registered too. Needs `reg_slice`. Same cost and same reasoning as on a master port. |

Address regions must not overlap. The crossbar uses a bitmask decoder: for each slave, bits above `log2(size)` must match `base`. Addresses that match no slave are answered by the decode-error responder with DECERR (see `decode_error_response`, on by default).

### Arbitration modes

| Mode | Key value | Extra keys | Behavior |
|---|---|---|---|
| Round-robin | `round_robin` | — | Equal turns among contending masters. No starvation. Default. |
| Fixed priority | `fixed_priority` | — | Master 0 (first listed) has highest priority. Lower-priority masters may starve under sustained load. |
| Weighted round-robin | `weighted_round_robin` | `weights` | Like round-robin, but master *i* gets `weights[i]` consecutive grants before yielding. Example: `weights: [3, 1]` gives master 0 three turns for every one turn of master 1. |
| QoS-based | `qos` | — | Arbitrates on AXI `AXQOS[3:0]`: higher QoS wins. Equal QoS falls back to round-robin. An aging counter increments for each cycle a request waits; once the age exceeds a threshold, it boosts effective QoS to prevent starvation. |

### Data-width conversion

When a port's `data_width` differs from `fabric_data_width`, the generator inserts a converter automatically:

- **AXI4-Lite upsize** (narrow port → wider bus): data and strobe go on the byte lanes the address selects, and read data comes back off them. One beat in, one beat out; the lane offset is taken from AW/AR and held for its data beat, since W carries no address.
- **AXI4-Lite downsize** (wide port → narrower bus): one narrow transaction per chunk of the wide word. Writes go out only for chunks with a strobe set, so a slave with write side effects never sees bytes the master did not name; reads run from the chunk the address names to the end of the word; the worst of the chunk responses comes back. One transaction per direction at a time.

  Both apply wherever a Lite port and the bus it meets differ in width — a master or a slave, on the all-Lite fabric or on the mixed one, including a fabric that `internalDataWidth` makes narrower than its ports.
- **Full AXI4 upsize** (narrow port → wider fabric): SpinalHDL `Axi4Upsizer`. Assembles narrow beats into wide beats.
- **Full AXI4 downsize** (wide port → narrower fabric): `Axi4DownsizerExt` (local fork). Splits wide beats into narrow sub-transactions. INCR bursts stay multi-beat for efficiency. FIXED and WRAP bursts are flattened to single-beat sub-transactions with addresses computed internally.

### Pipelined vs blocking mode

| `max_outstanding` | Mode | Behavior |
|---|---|---|
| `1` | Blocking | One transaction in flight per slave per direction. No FIFOs. Minimal area. |
| `> 1` | Pipelined | Per-slave W-route FIFOs, ID-based B/R response routing. Multiple transactions can be in flight simultaneously to different slaves. Required for high-throughput designs. |

Only affects the Full AXI4 crossbar. The Lite-only crossbar is always single-outstanding (blocking).

### Transaction ordering

AXI4 makes two ordering promises that a crossbar has to keep on the master's behalf, and neither falls out of counting work per slave:

- Transactions that **share an ID and a direction** complete in the order they were issued, whichever slave each went to. Different IDs are unordered.
- **Write data follows write address.** W has carried no ID since AXI3, so a master's W beats go in the order of its own AWs, and the fabric must steer each burst to the slave its AW went to.

The pipelined crossbar keeps both with the rule the industry uses, **single slave per ID**: an ID may have work outstanding at only one slave at a time, and a request naming a second one waits. AMD states it in PG059, Arm's NIC-400 calls it a cyclic-dependency avoidance scheme, and Forencich's `verilog-axi` and PULP's `axi_demux` both implement it. W gets one rule more, NIC-400's *extended write rule*: a master may not address a new slave until every write it has already issued has sent its last W beat. Per-ID tracking alone does not cover that, because a master using two IDs could legally owe write data at two slaves at once.

`id_threads` is the size of the table of live IDs, per master per direction — a small fixed number, the way AMD's, Arm's and Forencich's are (`verilog-axi` defaults to 2 as well), rather than one entry per ID value. A request whose ID matches no live thread and finds none free waits for one, so the number costs throughput under many-ID traffic and never correctness. `id_threads: 1` gives a master one destination in flight per direction, which is already what a constant-ID master gets.

None of this applies in blocking mode, which holds a master to one transaction per direction outright, or to the Lite crossbar, which has no IDs and no bursts.

### Decode errors

An address that falls outside every slave's range belongs to no port, and a crossbar that only drives
AWREADY/ARREADY for addresses it can place has no way to refuse one it cannot. Left like that, the
master holds its request waiting for a handshake that never comes and the port is wedged for good —
no error, no timeout, and nothing in a waveform to say which address did it.

By default the fabric answers instead. An internal responder owns every unmapped address, accepts the
handshake and completes the transaction with `DECERR`: on B for a write, and on every beat of a read
(all `len + 1` of them, with RLAST on the last), carrying the requesting master's ID so the response
routes back the way any other does. The master gets its answer and a CPU sees a bus fault it can
report. It costs one small state machine per direction, shared across all masters and slaves.

This is not hypothetical. A single corrupted word in the VexRiscv example SoC's boot image made the
CPU compute a store address of `0x4E4F549B`, which decodes to nothing; without a decode-error path
the load/store port then sat with AWVALID unaccepted for 19,948,154 of 20,000,000 simulated cycles.
One bad word became a dead system.

Set `decode_error_response: false` (`decodeErrorResponse = false` in Scala) to restore the older
behaviour. `DecodeErrorSpec` covers both, including a test that pins the unacknowledged failure mode
so it stays documented.

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

245 tests pass across 32 suites:

For the focused AXI4-Stream loop, including lint, YAML generator smoke tests, and cocotbext-axi generated-RTL tests:

```bash
python3 scripts/run_sim.py axis
```

| Suite | Tests | Description |
|---|---|---|
| `LiteCrossbarSpec` | 6 | AXI4-Lite crossbar: arbitration, address decode, WRR |
| `LiteSameCycleResponseSpec` | 2 | AXI4-Lite slave that raises RVALID in the same cycle as ARREADY: the Full→Lite adapter cannot capture the response ID a cycle late, and a master that reads such a slave — where the ordering table's claim and release land on one cycle — can still reach another slave afterwards |
| `PipelinedCrossbarSpec` | 8 | Full AXI4: bursts, back-pressure, outstanding transactions |
| `ChannelSkewSpec` | 3 | The channel skews AXI4 permits and no other slave model here produces: a slave that raises WREADY before AWREADY, so a W beat reaches it ahead of its address; a burst whose data all arrives early, where the forwarding path has to close again so the *next* burst's data is not swallowed by the slave still holding the first address; and a Lite slave whose answer lands on the cycle the next address is accepted |
| `BlockingWriteBoundarySpec` | 3 | Where one write's data ends and the next begins in the blocking engines, which both crossbars carry their own copy of: a slave holding a write whose data is complete while its response is still outstanding, and a write whose data reached the slave before its address. In both the master may legally offer the next write's data, and the forwarding path has to be shut or that data is written under the previous address — at a slave it was never addressed to |
| `AxiMultiIdGenSpec` | 8 | The synthesizable multi-ID generator that goes on the boards, checked against a crossbar with two RAMs: that a clean run really did have several IDs in flight and really did ask to move a live ID between slaves, that it catches a dropped byte lane, and — with a deliberately reordering RAM model — that it catches two same-ID reads answered out of order. A self-checking generator that cannot fail is worth nothing on hardware, so each of its checks is shown failing. Three more cover the write side, which the read-back cannot reach at all: a clean run whose extra writes go to an address no slave claims, answered DECERR by the fabric's own decode-error responder, with that answer required as evidence; a model that exchanges two BIDs between waiting IDs, caught; and the same model labelling every response correctly, clean. The control is also where the limit is written down — a swap between two OKAY responses stays invisible, because the two traces are the same bits |
| `Axi4OrderingProbeSpec` | 6 | The ordering probe that goes on the boards, driven directly so it can be shown failing: the single-slave-per-ID rule broken with **every response still in issue order**, caught (a check that waited for a wrong answer would call that run clean); a request admitted on the cycle the last outstanding one retires, correctly allowed; a crossing request held against two live bursts recorded as the evidence it is; one-burst-at-a-time traffic claiming no evidence it did not earn; reads and writes judged apart; and the same violation on the write channels |
| `MultiIdOrderingSpec` | 2 | Randomised multi-ID traffic — four IDs, two slaves, both directions, random response latency and master back-pressure — against a per-ID scoreboard. The only coverage of a master that varies its ID; every other master here, VexRiscv included, drives a constant one. B carries nothing but an ID and a response, so a swap between two busy IDs is invisible unless the two slaves answer differently: one slave returns SLVERR, which gives every write response an identity the scoreboard can hold it to, and the second test proves that scoreboard catches an exchanged BID and a same-ID response reordering while passing a correct trace |
| `MixedCrossbarSpec` | 4 | Full↔Lite adapters, mixed address maps |
| `ArtySpec` | 5 | Sequence matching the Arty A7 hardware tests (T4, T5, T6, T9, combined) |
| `IpifWriteSpec` | 5 | IPIF-style slaves (Xilinx GPIO/UART-Lite require AW+W simultaneous), blocking and pipelined modes |
| `WidthConverterSpec` | 6 | Full AXI4 width conversion: 32→64 upsize, 64→32 downsize, 32→64→32 passthrough; single-beat, burst, routing |
| `BurstTypeSpec` | 6 | Downsizer burst types: INCR baseline, FIXED 1-beat and 2-beat overwrite, WRAP aligned, WRAP 4-beat, WRAP with actual wrap-around |
| `ArbitrationSpec` | 7 | FixedPriority and WeightedRoundRobin: contention ordering, throughput proportionality, data integrity |
| `LiteWidthPathsSpec` | 7 | Every other place an AXI4-Lite port changes width: a narrow slave on the Lite fabric (both halves written, a strobed half going out alone, the worst response of the halves returned), a fabric narrower than its master, a narrow Lite master and a narrow Lite slave on the mixed fabric, and a slave with a narrower address bus than the crossbar. Every address is chosen so a converter using the low lanes regardless would fail |
| `ConfigSweepSpec` | 47 | Elaborates 30 configurations no simulation suite builds — every arbitration policy against one to three masters, 8- to 128-bit ports on one fabric, fabrics narrower than their ports, AXI3 + Full + Lite masters with register slices everywhere, mismatched address and ID widths, observed masters — and checks 17 invalid configurations are refused with a message naming the problem |
| `Axi4ToAxi3Spec` | 5 | The AXI4→AXI3 shim VexZeroSoc uses: every field mapped (AXI4 exclusive is AXI3 `01`), what a missing field is driven to, a burst out to AXI3 and back through `Axi3ToAxi4Adapter`, and WID naming its own burst whether the data trails the address or leads it |
| `AxiStreamArtySmokeSpec` | 1 | The self-checking AXI4-Stream design the Arty build runs, simulated to its status word: every check bit set, the pass bit latched and still set 200 cycles later |
| `RegSliceAndLiteWidthSpec` | 10 | Register slices (Full + Lite, master/slave/both), AXI4-Lite width conversion (16→32 upsizing) including byte-lane placement and strobe preservation |
| `MixedIdWidthSpec` | 2 | Masters declaring different numbers of IDs, so the narrow port's requests cross `Axi4IdWidener`. Every test checks the ID a response came back under, not just the data: the padding is constant zero outward, so the truncation back is exact only if the fabric returns the same zeros. No other root test builds a mixed-ID-width config — the widener's only exercise was through the VexRiscv example, a separate sbt project |
| `RegSliceSkidSpec` | 6 | What `regSliceSkid` actually buys, rather than inferring it from timing closure: a stalled plain slice accepts one beat and a skid two; the plain slice's READY is combinational from the far side and the skid's is not, shown by stalling and releasing on one cycle; 400 beats survive random back-pressure through both; latency stays one cycle and throughput full for both; B and R keep the plain slice they are given; and the Lite slice behaves the same way. The skid buffer is on the AW/W/AR path of every registered master on both boards, and until now no test told the two apart |
| `PipelinedArbitrationSpec` | 9 | Pipelined FixedPriority, WRR, and QoS: contention, concurrent bursts, data integrity |
| `NarrowPortSpec` | 6 | Narrow ports: 32→16 downsizing, 16→32 upsizing, mixed Full+Lite concurrent traffic |
| `QosCrossbarSpec` | 5 | QoS arbitration: higher AWQOS/ARQOS wins (blocking + pipelined), equal-QoS round-robin tie-break, aging anti-starvation |
| `DecodeErrorSpec` | 17 | Decode errors: DECERR on B and on every read beat, blocking and pipelined, burst reads, W beats sunk, ID routing back to the right master, Lite, all four arbitration policies, two masters erroring at once, AXQOS deciding which of two contending masters the responder serves first (both orderings, reads and writes), and the unacknowledged failure mode with the responder disabled |
| `QosStressShortSpec` | 1 | Short 4-master QoS stress: distinct patterns (sequential, reverse, sparse, random short bursts), concurrent traffic, end-state validation |
| `Axi3ToAxi4Spec` | 5 | AXI3→AXI4 bridge: single-beat, INCR burst, write interleaving (WID reorder), locked→SLVERR, multiple outstanding |
| `Axi3MixedCrossbarSpec` | 5 | Axi3Mode auto-adapter: single-beat to full slave, single-beat to Lite slave, routing to both, 4-beat INCR burst, register-sliced path |
| `Axi4ProtocolCheckerSpec` | 17 | The protocol checker itself: clean traffic of every burst shape stays silent, each rule fires on its own injected violation, a burst ending exactly on a 4 KiB boundary does not, and losing track reports overflow rather than a violation |
| `ResponseStabilitySpec` | 8 | Response channels and ordering under back-pressure: B and R payloads hold while the master stalls and a second slave answers, an R burst is not interleaved by another slave, a slave that bubbles mid-burst produces no phantom beats, both writes get their response in blocking mode, same-ID reads to two slaves come back in issue order, a second write to another slave does not take the first write's data, a same-ID write to another slave waits for the first response, and a read with a new ID waits for a free thread and then completes |
| `AxiSatGenSpec` | 6 | The saturating self-checking traffic generator: a full run against a working RAM reports no errors, its own traffic passes the protocol checker, a RAM that drops a byte lane is caught, it stays off the bus while disabled, a fabric that stops answering is reported as a stall rather than as a pass, and a master straddling two slaves under B/R back-pressure neither hangs nor misreads |
| `AxiStreamCoreSpec` | 17 | AXI4-Stream utility cores: register slice, width adapter, FIFO, packet arb-mux, packet demux, broadcaster, sparse TKEEP/TSTRB/TLAST edge cases, TID/TDEST/TUSER propagation |

### Generator unit tests (no sbt, no JDK)

```bash
python3 scripts/test_axizero.py
```

32 tests covering the YAML front end's Scala emitters and its config validator. They
import `scripts/axizero.py` directly and never invoke sbt, so a mistake in a port
template or a validation rule is caught in milliseconds instead of at the far end of
an elaboration. Run in CI ahead of the end-to-end generate.

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

46 tests pass across 6 suites:

| Suite | DUT | Tests | Description |
|---|---|---|---|
| `lite` | `MyLite_1M4S.v` | 7 | AxiLiteMaster → 4-slave crossbar: single R/W, address routing, sequential writes, multi-slave pattern, overwrite isolation, 60× random, byte and half-word strobes through every slave |
| `full` | `MyFull_2M2S.v` | 14 | AxiMaster → 2-slave crossbar: single R/W, address routing + isolation, 16-beat burst, 64-beat burst (AWLEN=63), alternating slaves, 40× random; WRAP and FIXED bursts (checked in the slave RAM, not only by read-back), sub-word strobes and narrow AxSIZE, 2/3/8/32-beat bursts, unaligned starts and ends, W ahead of AW and AW ahead of W, every handshake stalling mid-burst, and AxLOCK/AxCACHE/AxPROT arriving at the slave as sent |
| `wrr` | `MyLite_2M2S_WRR.v` | 6 | 2-master WRR crossbar: dual-master R/W, address routing, concurrent bandwidth, no starvation, concurrent different slaves, 80× random |
| `qos` | `MyFull_2M2S_QoS.v` | 7 | 2-master QoS crossbar: dual-master R/W, address routing, higher QoS wins contention, equal-QoS round-robin, aging anti-starvation, QoS read priority, eight reads with distinct IDs outstanding together (the test asserts they overlapped) |
| `ipif` | `MyLite_1M4S.v` | 4 | IPIF slave compatibility: strict IpifRam model requires AWVALID+WVALID simultaneously, routing unaffected |
| `axis` | generated AXI4-Stream cores | 8 | cocotbext-axi stream BFM tests for reg slice, width adapter, FIFO, arb-mux, demux, broadcaster |

---

## Protocol checking

Every other test here is value-based: drive traffic, check the numbers that come back. That catches
an interconnect which loses or corrupts data. It is blind to one that returns every right answer
while breaking AXI4 on the way — changing an address while AWVALID is waiting for AWREADY, putting
WLAST on the wrong beat, answering a response nobody asked for. A tolerant slave hides it; the next
slave, on the next board, does not.

[`Axi4ProtocolChecker`](hw/spinal/axizero/verif/Axi4ProtocolChecker.scala) watches instead of asking.
It is an `Area`, not a `Component`: it snoops a bus in place, reads only VALID, READY and payload,
and drives nothing, so adding one cannot change what the design does.

```scala
val fabric = new AxiZeroMixedTop(config)
val check  = Axi4ProtocolChecker(fabric.io.slaves(0), label = "s0")
io.violation := check.any     // one wire, one spare LED
```

Each rule sets one bit of `sticky`, held until reset, so a violation that happens once in a
ten-minute run is still there at the end. `any` is their OR. The bit numbering is part of the
interface — firmware and test benches decode it by index — so it is append-only.

| # | Rule | Fires when |
|---:|---|---|
| 0–4 | `{AW,W,B,AR,R}_UNSTABLE` | VALID dropped before READY, or the payload moved while stalled |
| 5 | `W_BEATS_OVERRUN` | the write burst carried more beats than its AWLEN+1 |
| 6 | `W_LAST_MISPLACED` | WLAST arrived before the burst reached AWLEN+1 beats |
| 7 | `R_BEATS_OVERRUN` | the read burst carried more beats than its ARLEN+1 |
| 8 | `R_LAST_MISPLACED` | RLAST arrived on a beat that is not the ARLEN'th |
| 9 | `B_UNEXPECTED` | write response with no outstanding write of that ID |
| 10 | `R_UNEXPECTED` | read data with no outstanding read of that ID |
| 11–12 | `{AW,AR}_BURST_RESERVED` | AxBURST is the reserved encoding `2'b11` |
| 13–14 | `{AW,AR}_WRAP_BAD_LEN` | a WRAP burst whose length is not 2, 4, 8 or 16 |
| 15–16 | `{AW,AR}_4K_CROSS` | an INCR burst crosses a 4 KiB boundary |
| 17–18 | `{AW,AR}_LEN_EXCEEDS_MAX` | a burst longer than the configured `maxBurstLen` |

Write address and write data are queued independently and judged when both halves arrive, because
AXI4 lets a master issue write data before its address. Read beats are counted per ID, because AXI4
lets read data for different IDs interleave — a single counter would fire on legal traffic. Losing
track of either sets `overflow`, which is not a rule: it says the checker stopped being able to see
everything, so silence from that port stopped being evidence.

It does not check X or unknown values (those need simulation semantics and mean nothing in
hardware), exclusive access, the low-power interface, or timing. It is a protocol checker, not a
liveness checker: a bus that stops entirely violates nothing here.

See [ADR 003](docs/adr/003-synthesizable-protocol-checker.md) for why this is written here rather
than taken from a vendor or replaced with formal.

### Why not the vendor's

AMD ships a 160-rule `axi_protocol_checker`, and it is a Vivado block-design IP. It cannot be
instantiated in a plain RTL project, it cannot run in SpinalSim, and it cannot be built for Altera
at all — which rules out every design this interconnect is actually validated on. The VexZero SoC is
one generated Verilog file with no block design, built for both Vivado and Quartus. This checker is
ordinary SpinalHDL, so the same source runs in simulation, on Artix-7 and on Agilex 5.

### What it found

Turning it on for the first time, on a loaded crossbar, reported `s0: AR_UNSTABLE` — the read
address to the RAM slave changing while ARVALID was high and ARREADY low:

```
[ 574] PAYLOAD MOVED: 0x80008380/id 4/len 15 -> 0x80001020/id 2/len 7
```

The arbiter re-evaluated its grant every cycle from the live request vector. A master that raised
its request while an already-granted address was waiting for AxREADY could win the next cycle and
swap the address out from under the slave. AxVALID never dropped, so no handshake was lost; both
requests were real and both were issued eventually, which is exactly why 133 value-based tests and
six hardware suites all passed over it. A slave that latches the address before asserting READY —
a normal thing to do for timing — latches the wrong one.

The fix is `lockGrant` in both crossbars: the grant is held from the cycle AxVALID is asserted until
AxREADY. It costs nothing in throughput, because the held master was going to be served in that
cycle anyway. All six arbitration sites (blocking and pipelined, read and write, full and Lite) were
affected.

### On hardware

`protocolCheck = true` in `VexZeroSocConfig` puts a checker on every fabric port — master side and
slave side — and brings the verdict out on `io.busViolation`. It is on by default in both board
wrappers, where it is worth the most: a bitstream runs the same traffic for hours at 100 MHz, far
more of it than any simulation, and the checkers turn all of it into one reported letter. See the
`B`/`b` byte in the [Arty UART line](#on-hardware).

| Test (`sbt vexZero/test`) | Description |
|---|---|
| `the crossbar keeps AXI4 while the boot firmware runs on it` | every fabric port silent through a full boot |
| `the crossbar keeps AXI4 with a cached CPU and a host contending for the same RAM` | 16-beat bursts, several outstanding, two masters on one slave |
| `an illegal burst on the host port lights the verdict the board reports` | the control: one 4 KiB-crossing read has to reach `io.busViolation`, or the two silences above prove nothing |

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
| `VexZeroProtocolSpec` (3 tests) | every fabric port judged against AXI4 itself; see [Protocol checking](#protocol-checking) |

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
12-byte line on the USB-UART at 115200 8N1, repeated every ~0.67 s, for the runner.

| Line | Meaning |
|---|---|
| `VZPDRCLBGS5` | every check passed; the switch nibble read back over AXI4-Lite was `0x5` (the value varies with the switches) |
| `VZFdrclBGS0` | the CPU never finished — held in reset, or hung |
| `VZFDRCLbGS5` | the program computed everything correctly and the bus broke AXI4 while it did |
| `VZFDRCLBgS5` | a traffic generator read back data it had not written |

Upper case is a passing check: **P** overall, **D** done marker, **R** result value, **C** character
stream, **L** LED register, **B** [bus protocol](#protocol-checking), **G** [traffic
generators](#loading-the-crossbar-on-hardware), **S** the AXI4-Stream island. A check the build
leaves out reads upper case, so the line has the same shape whatever the configuration and one
parser reads every variant. The last byte is the switch nibble the firmware read back through the
AXI4-Lite GPIO. It is reported because the result check is `checksum + switches`, so with every
switch down a Lite read that always returned zero would pass; the runner says as much when it sees a
zero nibble.

The same three verdict bits are also readable over the bus, at `sysCtrl + 0x10`, because a board
whose only link to a host is a debug cable has no serial line to print them on. That the host then
reads them across the crossbar under test is deliberate: a fabric broken badly enough to hide its
own verdict cannot report a pass either.

Bit 3 of that word is the protocol checkers' **overflow** flag, and it fails the run. Each checker
tracks a bounded number of outstanding transactions and says so when it runs out; a run that
overflowed has a checker whose silence means "stopped counting", not "saw nothing". It now fails the
run on both boards — it is folded into the `B` the Arty prints, and the DE25-Nano runner, which reads
the whole word, names which of the two it was — so a board that overflowed is never mistaken for a
board that was watched and found clean.

```bash
python hw/vivado/arty_a7/run_vexzero_test.py                # generate, build, program, verify
python hw/vivado/arty_a7/run_vexzero_test.py --skip-build   # reprogram and re-read only
python hw/vivado/arty_a7/run_vexzero_test.py --design all   # every VexZero build in turn
```

The runner generates the netlist with sbt, builds the bitstream, programs the board over JTAG with
xsdb, then decodes the serial line. There is no MicroBlaze in this design, so unlike the crossbar HW
tests it needs no `mb-gcc` — the firmware is already inside the bitstream.

It does not stop at the first report line. Every verdict the board reports is **sticky** — a
generator error, a protocol violation and a checker that lost track all latch and never clear — so a
fault that first appears a second in is real, is still being reported, and would simply never have
been looked at; and the first report line is the least traffic the generators will ever have run
behind them. So the runner keeps reading for `--observe` seconds (default 5) and requires every
later report to match the first, printing both and failing the run if one changes. The DE25-Nano
runner does the same thing with the verdict word it reads over JTAG-AXI.

**Result** — the board reports `VZPDRCLBGSF`. The `B` is the [protocol checker](#protocol-checking)
verdict: five checkers, one on every fabric port, saw no AXI4 violation in the whole run. The
trailing nibble is the switch register read back over AXI4-Lite (all four slide switches up on this
run), so the result check ran against `checksum + 15` rather than against zero. Timing closes:

| Resource | Used | Available | Utilisation |
|---|---:|---:|---:|
| Slice LUTs | 2087 | 63400 | 3.29% |
| Slice registers | 2654 | 126800 | 2.09% |
| Block RAM tiles | 3 | 135 | 2.22% |
| DSPs | 0 | 240 | 0.00% |

Test conditions: Vivado 2025.2, `xc7a100tcsg324-1` (speed grade -1), default synthesis and
implementation strategies, one 100 MHz clock domain, WNS **+0.472 ns** (105.0 MHz Fmax). The figures
cover the whole SoC — VexRiscv, the axiZero crossbar, the 8 KB RAM, both peripherals, the UART
reporter and the five protocol checkers — not the crossbar alone; see
[crossbar-only resource usage](#hardware-validation) for that.

The checkers are most of the difference from the 1140 LUTs / 1161 registers this design used before
they existed: they roughly double it, which is what watching five ports with per-ID tracking costs
and is the reason `protocolCheck` is a switch rather than always on. Their cost in Fmax is small but
it is not nothing, and it took work to get there: the first build with checkers came in at **+0.027
ns**, with the critical path running from a register slice's stored AWADDR through the burst
arithmetic and the 19-way OR into the sticky register's clock enable. Registering the rule outputs
before they reach `sticky` ends that path at the rules; the bit only records whether something ever
happened, so a cycle of latency on it changes nothing. `pipelineInputs` later took the checker off
the fabric's critical path entirely — see [timing closure on the loaded
builds](#timing-closure-on-the-loaded-builds).

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
| Slice LUTs | 1292 | 63400 | 2.04% |
| Slice registers | 1282 | 126800 | 1.01% |
| Block RAM tiles | 9 | 135 | 6.67% |
| DSPs | 0 | 240 | 0.00% |

WNS **+0.593 ns** (106.3 MHz Fmax). The figures cover the whole benchmark SoC — VexRiscv, the
axiZero crossbar, 32 KB of RAM, three slaves and the UART — not the crossbar alone.

### What Dhrystone does not test

Dhrystone is the right test for *does a real program run correctly across the fabric*. It is the
wrong test for *is the fabric any good*, and the difference is large enough to be worth measuring
rather than asserting.
[`VexZeroProfileSpec`](hw/examples/vexriscv/sim/vexzero/sim/VexZeroProfileSpec.scala) counts what
the crossbar was actually asked for during a run, at its master ports:

| | Uncached | Cached, 4 KiB D$ | Cached, 512 B D$ |
|---|---:|---:|---:|
| Transactions | 189,937 | 21,190 | 24,454 |
| Beats carried | 189,937 | 37,921 | 64,033 |
| Instruction fetch | 153,187 × 1-beat | 2,328 × **8-beat** | 2,328 × **8-beat** |
| Data reads | 17,953 × 1-beat | 63 × 8-beat | **3,327 × 8-beat** |
| Data writes | 18,797 × 1-beat | 18,797 × 1-beat | 18,797 × 1-beat |
| Peak in flight, any port | 2 | 4 | 4 |
| Cycles with any request | 36.5% | 8.2% | 7.9% |
| **Cycles with two masters requesting** | **1.1%** | **0.0%** | **0.0%** |
| DMIPS/MHz | 0.347 | 0.687 | 0.526 |

Coverage is maximal and pressure is minimal. With no caches every instruction and every load or
store crosses the crossbar — bus traffic *is* the whole program — but all 189,937 transactions are
single beats, never more than two are in flight, and the two masters want the bus in the same cycle
in 1.1% of cycles. The measured 3.00–3.09 cycle latencies sit exactly on the registered-path floor,
which is another way of saying the crossbar never queued. Bursts, outstanding depth and arbitration
under contention are simply not on trial.

Turning the caches on (`cachedCpu = true`) buys the bursts — each miss becomes an 8-beat INCR line
refill — and nearly doubles DMIPS/MHz, but it makes the *pressure* problem worse, not better: the
hit rate is so high that the fabric goes idle 92% of the time and contention falls to zero.

Two things about the load/store port are worth stating plainly, because they bound what any
workload on this CPU can prove:

- **Cache size decides whether that port is a bus master at all.** Dhrystone's data working set
  fits inside 4 KiB with room to spare, so a 4 KiB data cache misses 63 times in a whole run.
  Sized to miss (`dCacheSize = 512`), the same port issues 3,327 line refills instead — a 50×
  difference in how hard it works the fabric, for a 24% drop in score. The stress test below uses
  the small one for exactly that reason.
- **No configuration makes this CPU write in bursts.** VexRiscv's data cache has no dirty bit, so
  it is write-through by construction, and the write-aggregation buffer that could merge stores
  exists only on its BMB port and emits one wide beat rather than a burst. All 18,797 stores are
  single beats in every column above. Write bursts have to come from a different kind of master —
  in a real system a DMA engine, and here the traffic generator below.

So no configuration of this CPU loads the interconnect. The pressure has to come from somewhere
else.

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

Both columns below use the 512 B data cache, so the comparison isolates what the third master
adds rather than mixing in a cache-size change:

| | Dhrystone alone | Dhrystone + host traffic |
|---|---:|---:|
| Cycles with any request | 7.9% | **100.0%** |
| Cycles with two or more masters requesting | 0.0% | **80.8%** |
| Longest burst | 8 beats | 16 beats |
| Transactions / beats | 24,454 / 64,033 | 90,967 / 1,128,200 |
| Instruction-fetch latency | 10.0 cycles | 40.2 cycles |
| Data-read latency | 10.0 cycles | 50.1 cycles |
| Host read-burst latency | — | 42.4 cycles |
| Host beats checked | — | 1,064,161, **0 mismatches** |
| Dhrystone self-checks | 20/20 pass | 20/20 pass, exit 0 |

Latency rising from 10 to 40–50 cycles is the point: under Dhrystone alone the crossbar never
queued, and here it queues constantly, while the program on top still computes every one of its
results correctly.

**Pipelined against blocking, under real load.** With the fabric at 100.0% occupancy the two modes
move almost the same total traffic — 90,967 transactions in 1,126,518 cycles pipelined against
80,713 in 969,991 blocking, which is 3.0% *fewer* transactions per cycle for the pipelined path.
What changes is who gets the bandwidth: the pipelined path completes 18.2% more host bursts and
costs Dhrystone 20.5% in timed cycles. That is not a defect. This load is bandwidth-bound at a
single RAM slave, and allowing more transactions outstanding to one slave reorders who waits rather
than creating bandwidth that is not there — the host master, which always has another burst ready,
is simply better placed to use the extra slots than a CPU that stalls on each miss. The pipelined
path's advantage is concurrency across *different* slaves, which is what
[`PipelinedArbitrationSpec`](hw/sim/axizero/sim/PipelinedArbitrationSpec.scala) measures directly.

Test conditions: SpinalSim + Verilator, 3-master × 4-slave `AxiZeroMixedTop`, round-robin, 64 KB
on-chip RAM, VexRiscv RV32I with a 4 KiB one-way instruction cache and a 512 B data cache, both
32-byte lines, Dhrystone 2.1 `-O3`, 200 runs, master register slices as full pipes. The host reads
the program text back from where it is being fetched and round-trips a pattern through the unused
top 16 KB of RAM. Latency and beat counts are measured at the external master ports, because
latency is what the master waited for, register slices included; occupancy and contention are
measured one level in, at the crossbar's own master inputs, because that is where the arbiter makes
its choice. Measured outside the slices the same run reads as 60% contended rather than 81%: a
slice accepts an address beat the cycle it appears, so the master's VALID drops again immediately
and a request that has only just reached the arbiter looks finished.

### QoS, and when it stops working

QoS only means anything when there is not enough bus to go round, which is what the load above
supplies. Both masters are given a rank — the CPU's is declared by the SoC (`cpuQos`), because
VexRiscv has no QoS output of its own — and the same experiment is run with the ranking swapped, so
nothing but the QoS values can explain the difference.

The result depends on something no unit test surfaces. The crossbar boosts a waiting master's
effective priority by one per cycle, saturating at 15
([`Axi4Crossbar.scala:89`](hw/spinal/axizero/crossbar/Axi4Crossbar.scala#L89)), so a master that
waits longer than its own distance from 15 arrives at the arbiter with the gap already erased:

| Burst | Ranking | CPU grants | Host grants | Host share | Host latency |
|---|---|---:|---:|---:|---:|
| 4 beats | CPU 12, host 2 | 22,290 | 58,949 | 72.6% | 11.7 cycles |
| 4 beats | CPU 2, host 12 | 14,564 | 65,378 | **81.8%** | 11.9 cycles |
| 16 beats | CPU 12, host 2 | 6,784 | 17,853 | 72.5% | 42.2 cycles |
| 16 beats | CPU 2, host 12 | 6,702 | 17,867 | **72.7%** | 42.2 cycles |

Swapping the ranking moves **9.2 points** of bus share at 4-beat bursts and **0.3 points** at 16.
A four-beat read completes in 11.7 cycles end to end, so a master that loses a grant is asking
again long before the boost has carried it to 15, and the declared ranking decides the split. A
sixteen-beat read takes 42.2, every wait outlasts the boost, both masters reach an effective 15
before they are looked at, and the arbiter is round-robin again — the setting is still there and
it no longer does anything.

That is the anti-starvation mechanism working as specified rather than a defect, and it is worth
knowing before relying on a QoS number: **a QoS gap survives only while the low-ranked master's
wait is shorter than its distance from 15.** Rank 2 against 12 and the gap holds for waits up to 13
cycles. If your masters issue long bursts, rank them further apart, or expect round-robin.

Neither ranking starves anyone in either regime. Demoting the CPU from 12 to 2 costs it a third of
its grants (22,290 down to 14,564) rather than all of them, and the host's read latency moves by
0.2 cycles whichever way it is ranked. That is the same age boost, doing the job it is there for.

```
sbt "vexZero/testOnly *VexZeroStressSpec"    # both the load and the QoS experiment
```

Test conditions: as above, plus `QosBased` arbitration and a fixed 300,000-cycle window per run
rather than a whole Dhrystone — the question is how the bus was shared, and the test above already
establishes that the program finishes correctly under the same load.

### Loading the crossbar on hardware

Everything above is simulation. A simulation of 300,000 cycles is about three milliseconds of a
100 MHz board, and the load that produced those numbers — [`HostTraffic`](hw/examples/vexriscv/sim/vexzero/sim/HostTraffic.scala)
— is Scala and cannot be synthesised. To ask the same questions of real silicon, the load has to be
hardware.

[`AxiSatGen`](hw/spinal/axizero/verif/AxiSatGen.scala) is that load: a saturating, self-checking
AXI4 master, in SpinalHDL, that plugs into a crossbar port. Two properties make it worth more than a
generic traffic generator.

**It saturates.** It keeps several bursts in flight, so AW runs ahead of W and of B. A master that
waits for each response before issuing the next address never makes an arbiter choose, which is why
a CPU alone proves so little: measured on this SoC running Dhrystone, the two CPU ports both want
the bus in about one cycle in a hundred. With two generators attached, the fabric is contended for
**97%** of the run.

**It checks itself.** It reads back every word it wrote and compares. That is possible without
storing anything because the data is a function of the address:

```
data(k, p) = dataPattern | (p << 16) | k
```

with `k` the word offset in the generator's window and `p` the pass index. A pass covers the window
exactly, so after its write phase every word holds `data(k, p)` and the read phase predicts each
value from the address alone. A dropped or mis-routed beat then fails on the board rather than only
in simulation, and the verdict is a wire — `io.genOk` — folded into the same report the firmware's
checks go into. It is false if any generator miscompares, sees a response other than OKAY, has
never completed a lap, or has gone `hangCycles` (65,536 by default) cycles without a single
handshake on any channel. The last is there because the other three only describe what happened
before a generator stopped: one that deadlocks after its first lap keeps zero errors and a non-zero
lap count for ever, and would otherwise read as a pass. Burst length varies per pass, `1 << (p % 4)` beats, because long bursts are what
make an arbitration ranking decay while short ones make the arbiter choose often.

Five builds put this on both boards, four of them differing in one field — how the crossbar chooses
— and the fifth in what the masters do:

| Build | Arbitration | Asks |
|---|---|---|
| `stress_rr` | round robin | does the fabric stay correct when saturated, and split evenly? |
| `stress_wrr` | weighted 3:1 | do the weights move the split, without starving the lower one? |
| `stress_qos` | QoS 12 / 6 / 2 | does ranking hold across three levels at once? |
| `stress_axi3` | round robin | does the [AXI3 adapter](#axi3-adapter-test-1m4s-axi3-bridge-in-data-path) carry a CPU's whole load/store path under that load? |
| `stress_ids` | round robin | does the fabric keep AXI4's **ordering** promise — same-ID responses in issue order, one slave per live ID — with masters that actually vary their ID across two RAMs? |

`stress_ids` is the one that is not about arbitration. Every other master in this repository —
VexRiscv included, and `AxiSatGen` — drives a **constant** transaction ID, so until this build every
bitstream exercised the crossbar's ordering machinery in its degenerate shape: one thread per
master, nothing to order and nothing to hold back. It adds a second 4 KiB on-chip RAM at
`0x9000_0000` and two [`AxiMultiIdGen`](hw/spinal/axizero/verif/AxiMultiIdGen.scala) masters — one
running four IDs, one running two — with up to four read bursts in flight per ID and sending each ID's bursts to the two
RAMs in *pairs* — two to one, two to the other. That is the single-slave-per-ID rule's own case, in
the shape that is hard rather than the shape that is easy: when the crossing request arrives, two of
that ID's bursts are still outstanding at the other RAM, so the fabric's per-ID *count* has to be
right and not merely its record of one live destination. It may not admit the crossing burst until
both have retired, and a fabric that admits it anyway answers out of order.

The generators check that themselves, in hardware, with no scoreboard in Scala: each ID owns a queue
of the bursts issued under it and every R beat is compared against the head of the queue its RID
names, so a same-ID response that overtook an earlier one, a response returned under the wrong RID
and a burst answered with the wrong number of beats all land as errors. They also report two pieces
of evidence that the run was the run it claims — that more than one ID really was outstanding at
once, and that an ID really did ask to move to the other RAM while it was still live at one — and a
run without both is a *failure*, because a clean result from a generator that quietly issued one ID
at a time to one slave proves nothing.

The generators can only report what they saw from their own boundary, though, and that is not where
the rule is enforced. A register slice sits between each master and the crossbar: the skid accepts
requests the crossbar has not admitted, so a generator can truthfully report "several IDs in flight"
and "a live ID asked to cross" while the crossbar downstream was serializing everything and its ID
table never held two IDs at once. The evidence would be true and would prove nothing about the
machinery it is named after. So each generator also carries an
[`Axi4OrderingProbe`](hw/spinal/axizero/verif/Axi4OrderingProbe.scala) watching the **crossbar's own
master port**, where ARREADY *is* the admission decision. It latches a violation if the fabric ever
admits a request for one RAM while that ID still has work outstanding at the other — seen directly,
rather than inferred from a response arriving late, which matters because two identical RAMs can
answer in issue order by luck — and it latches the proof that the interesting case was reached: a
crossing request presented and **held** while two of that ID's bursts were live elsewhere. Reads and
writes are tracked apart, because AXI4 orders each direction on its own. Both verdicts fold into
`io.genOk`, so a bitstream whose traffic never reached that case fails rather than passing quietly. `AxiMultiIdGenSpec` shows the data check failing against a
RAM that drops a byte lane and the ordering check failing against a RAM model that deliberately
answers two same-ID reads out of order, before any of it goes to a board.

The write side needed something the read-back cannot give it. A BID exchanged between two IDs that
are both waiting moves no data — W beats follow the AW that preceded them — so memory ends up
correct and reads back correct; the error is in the *label* on the response, and a label is an ID
and two bits of status. Between two RAMs that both answer OKAY, the swapped trace and the correct
one are the same bits. That is a property of AXI4, not of this fabric, and no amount of reading
memory back reaches it.

So each generator issues one extra single-beat write per round to `0x9100_0000`, **an address no
slave claims**. What answers it is the fabric's own
[`Axi4DecErrSlave`](hw/spinal/axizero/crossbar/Axi4DecErrSlave.scala), wired into every crossbar as
one more slave owning everything unmapped: it takes the address, sinks the beat and answers DECERR.
Each generator keeps, per ID, a queue of what its outstanding writes are owed — one bit each, error
or OKAY, which is enough because AXI4 orders same-ID writes — and every B is checked against the
head of the queue its BID names, so a swapped response lands where an OKAY was expected and an error
was owed. Nothing is ever read back from that region; its whole purpose is to make one master's
writes answerable in two distinguishable ways. `errRespSeen` reports that an error really did come
back, and `io.genOk` requires it — a bitstream whose extra writes never arrived would otherwise pass
a check nothing exercised.

Using the responder that is already there rather than adding a slave for the purpose is not just
tidiness, and the first attempt here is worth recording. A dedicated SLVERR slave works and was
measured working on both boards, but a sixth port widens the arbitration and decode it sits inside
and spreads the logic further apart: it cost **942 LUTs and took the Arty from +0.325 ns of slack to
+0.017 ns**, on a path that is 80% routing. The unmapped address costs no port, no arbiter input and
no decode term — 203 LUTs and +0.101 ns, against a build with no write-response check at all. It
also puts the decode-error responder itself on a board, which nothing here did before; until now its
only coverage was in simulation.

The two generators are also deliberately **different widths**. Each one's port is sized to its own
ID count, so the two-ID generator reaches the fabric one ID bit wide where the fabric carries two,
and everything it issues crosses
[`Axi4IdWidener`](hw/spinal/axizero/adapters/Axi4IdWidener.scala) with an ID that changes. That
widener sits in every mixed-width design here, but until this build the only narrow master on either
board was the CPU, whose ID is a constant — so its zero-extension was carried by a signal that never
moved, which is exactly where a padding or truncation bug survives a bitstream. Two IDs is still
enough for the ordering rule to have something to hold: one ID crossing while the other is live.

Each also runs the firmware self test, so the program on top still has to compute the right
checksum, LEDs and characters while the generators compete with it for the RAM it fetches from; each
carries a [protocol checker](#protocol-checking) on every fabric port; and each carries the
AXI4-Stream smoke island, which shares nothing with the bus and so costs a bitstream almost nothing
to bring along. The configurations live in one place,
[`VexZeroStress`](hw/examples/vexriscv/spinal/vexzero/VexZeroStress.scala), and both the simulation
and the two board generators build from it — a hardware run confirms a simulation only if the two
were the same design.

```bash
sbt "vexZero/testOnly *VexZeroGenStressSpec"                 # all five, in simulation
python hw/vivado/arty_a7/run_vexzero_test.py --design all    # all five, on the Arty
python hw/quartus/de25_nano/run_vexzero_de25.py --design all # all five, on the DE25-Nano
```

What simulation measured, per policy, over a 60,000-cycle window after boot with two identical
generators (256-word windows, up to 8-beat bursts, 4 outstanding) and the CPU running from the same
RAM:

| Policy | gen0 : gen1 beats | Contended | Result |
|---|---|---:|---|
| round robin | 25,940 : 25,874 (1.00:1) | 98.2% | even, as declared |
| weighted 3:1 | 34,235 : 19,187 (1.78:1) | 97.5% | skewed, neither starved |
| QoS 6 vs 2, CPU 12 | 31,092 : 20,581 (1.51:1) | 97.2% | ranked, neither starved |
| AXI3, round robin | 25,943 : 25,873 (1.00:1) | 98.2% | the adapter does not change the split |

`stress_ids` is not in that table because it is not measuring a split. What it measures is that
nothing came back in the wrong order: over the same 60,000-cycle window, **100.0% contended**, its
two multi-ID generators each completed 10 full laps of both windows — 9,749 read bursts and 10,010
write bursts between them — with **zero data, response and ordering errors**, and both reported
having had several IDs outstanding at once and having asked to move a live ID to the other RAM. At
the crossbar's own master ports, where the rule is enforced rather than observed, both probes
recorded **two IDs live at once, one ID two bursts deep, and a crossing request held against two
live bursts, with no violation** — so the fabric was measured doing the holding, not merely
producing answers that happened to be in order. The
saturating generators and the CPU are running underneath all of it, so the ordering traffic is being
held up against real contention rather than against an idle fabric.

A 3:1 weight does not produce a 3:1 throughput and is not meant to: the generators are closed-loop,
each waiting on its own responses, so a weight buys a share of the grants rather than a share of the
bandwidth. What has to hold — and does — is that the weighted port is served clearly more and the
other is still served at all.

Test conditions: SpinalSim/Verilator, `VexZeroSoc` with `maxOutstanding = 4`, 32 KB RAM,
`protocolCheck` on, register slices on every master and slave port, two `AxiSatGen` masters plus
VexRiscv's two ports; measurement window starts after the firmware writes its done marker, so the
boot transient is excluded.

The two columns are read at different points, deliberately. Beats are counted at the fabric's master
ports, which is what each master was actually carried. Contention is counted one level further in,
at the crossbar's own master inputs, because that is where the arbiter makes its choice: a register
slice accepts an address beat into its own storage the cycle it appears, so at the external port the
master's VALID drops again immediately and the request looks finished when the arbiter has only just
received it. Measured outside the slices the same saturated run reads as 42-70% contended, which
says nothing about the arbiter.

### Video — a third-party IP core writing frames to RAM

Every write in the sections above is a single beat, and that is a property of VexRiscv rather than
of the crossbar: its data cache has no dirty bit, so it is write-through by construction and no
setting makes it burst. The only bursting write master so far has been `HostTraffic`, which is
Scala and exists only in simulation.

[vtpgZero](https://github.com/lcapossio/vtpgZero) is neither. It is a synthesizable video test
pattern generator, carried as a pinned submodule, and it joins the SoC as **two** ports at once: a
write-only AXI4 master that fills a framebuffer in RAM, and the AXI4-Lite slave that programs it.
Putting the control window on the fabric rather than beside it means configuring the generator is
itself arbitrated bus traffic.

```
  vtpgz_axilite_top ──AXI4-Stream──> axis_to_ddr_writer ──AXI4 write bursts──> crossbar ──> RAM
         ▲
         └── AXI4-Lite, a slave on the same crossbar
```

Both modules are plain Verilog-2001 with no vendor primitives, so unlike the JTAG bridge this
blackbox **simulates**: Verilator compiles the submodule's own sources, and the traffic in the test
is the traffic the board would produce. A 32×32 frame becomes:

| | |
|---|---|
| Write bursts | 64 |
| Write beats | 1,024 |
| Burst lengths | 16-beat × 64 |
| Read commands | **0** — the writer's read channel is tied off |
| Pixels verified | 1,024 of 1,024 |

Three things here are new to this interconnect: write bursts from real hardware, a **write-only
master** (a port shape nothing else here has), and a burst length that varies, since the writer
flushes a short burst at the end of a frame rather than only full ones.

```
git submodule update --init third_party/vtpgZero
sbt "vexZero/testOnly *VexZeroVideoSpec"
```

Test conditions: SpinalSim + Verilator, 4-master × 4-slave `AxiZeroMixedTop`, round-robin,
`maxOutstanding = 4`, 64 KB on-chip RAM, framebuffer at RAM + 0xC000, 32×32 solid-colour frame at
one pixel per clock. Solid colour is deliberate: every pixel of every frame is then the same
predictable `{R,G,B,0xFF}` word, so the read-back checks all 1,024 exactly and a burst landing at
the wrong address fails rather than merely looking wrong.

vtpgZero is Apache-2.0; it is referenced as a submodule, not vendored into this MIT-licensed tree.
Initialise it non-recursively — it carries its own `fcapz` submodule pointing at the same
fpgacapZero this repository already pins at v0.4.9, and a recursive init would clone a second copy
at a different commit.

#### Can the CPU be ranked above the video core?

The natural thing to want from a SoC like this is maximum priority for processor reads while the
video path keeps a bounded worst case, and `QosBased` arbitration with `cpu_qos` at 15 looks like
the lever for it. It is not, and
[`VexZeroVideoQosSpec`](hw/examples/vexriscv/sim/vexzero/sim/VexZeroVideoQosSpec.scala) exists to
say so with numbers rather than with an argument. It runs the real CPU against the real video core
at two burst lengths under both policies:

| Policy | Video burst | ifetch mean/worst | Video write mean/worst | Fetches | Video bursts |
|---|---:|---:|---:|---:|---:|
| round-robin | 16 | 0.13 / 2 | 19.00 / 19 | 19,993 | 2,668 |
| QoS, `cpu_qos = 15` | 16 | 0.13 / 2 | 19.00 / 19 | 19,993 | 2,668 |
| round-robin | 4 | 0.27 / 2 | 7.00 / 7 | 26,187 | 7,145 |
| QoS, `cpu_qos = 15` | 4 | 0.27 / 2 | 7.00 / 7 | 26,187 | 7,145 |

The two policies are byte-identical, which is the shape of a lever that does nothing rather than one
that is merely weak. **AXQOS ranks masters competing for one slave on one channel, and the crossbar
arbitrates reads and writes independently** — separate grant logic and separate per-slave age state,
`wrQosAge` for AW and `rdQosAge` for AR. The CPU's active port issues only reads and the video core
issues only writes, so the two never appear in the same arbiter and no AXQOS value can order them.
Where they actually meet is the RAM's shared command port: `Axi4SharedOnChipRam` has one address
channel, so AR and AW are merged by `toShared()` on the crossbar's finished slave port — downstream
of the arbiter that AXQOS feeds.

The second number worth reading is that there is nothing to arbitrate here anyway. Single-cycle
on-chip RAM answers a beat per clock; even after tripling the video load the two masters together
ask for about 63% of it, every video burst is served in exactly its own transfer time, and the worst
instruction fetch waits two cycles. A mean equal to a maximum is the signature of a queue that never
forms.

So: QoS between a read stream and a write stream is not expressible in this fabric, and at this
memory it is also unnecessary. It becomes a real question only if the memory becomes the bottleneck
— a slower external memory, or a much larger frame — and answering it then would mean QoS-aware
merging at the shared slave port, which is a fabric feature that does not exist today. What QoS
*does* rank, today and on hardware, is two masters on the same channel; that is what
[arbitration modes](#arbitration-modes) and `DecodeErrorSpec`'s QoS tests cover.

Test conditions: SpinalSim + Verilator, 4-master × 4-slave `AxiZeroMixedTop`, `max_outstanding = 4`,
64 KB on-chip RAM, 32×32 solid-colour frame, `frame_rate = 1200` clocks, 100,000-cycle measurement
window taken after the generator is programmed and running. Latencies are AR/AW accepted to the last
response beat, in cycles.

#### What integrating it found

A third-party core is worth more than a testbench precisely because it does not do what your
testbench does. This one answers reads **in the same cycle it accepts the address** — it raises
ARREADY and RVALID from one register, which AXI permits and small register files commonly do.

`Axi4FullToLiteAdapter` could not carry that. It returned each response with an ID captured into a
register on the address handshake, and a register updates at the end of the cycle, so a same-cycle
response went out tagged with the *previous* transaction's ID. The pipelined crossbar routes
responses to masters by ID, so the answer never reached the master that asked and that master
waited forever. The adapter now takes the live ID whenever the address is firing in that cycle, on
both the read and the write path.

Two things kept it hidden. It needs the pipelined crossbar — the blocking path remembers which
master it granted and never consults the ID — and it needs a slave that answers this fast, where
every other Lite slave here holds READY combinationally and answers a cycle later.
[`LiteSameCycleResponseSpec`](hw/sim/axizero/sim/LiteSameCycleResponseSpec.scala) now pins it with
a slave modelled on the one that found it. Revert the fix and it reports the failure exactly:
master 1's read is answered to master 0, whose ID is the zero the register resets to. A test using
only master 0 would have passed throughout.

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
| ALMs | 6,163.3 | 4,885 | 46,800 |
| Registers | 9,351 | 6,960 | — |
| RAM blocks | 6 | 19 | 358 |
| DSP blocks | 0 | 0 | 376 |

Test conditions: Quartus Prime Pro 26.1, `A5EB013BB23BE4SR1`, default synthesis and fitter settings,
one 50 MHz clock domain. Worst-case setup slack **+12.655 ns** (self test) and **+11.859 ns**
(benchmark), zero failing endpoints in both. The self-test figures are from the 2026-09-10 rebuild on the fixed RTL that
also produced the [loaded-build table](#timing-closure-on-the-loaded-builds); the benchmark column
predates the protocol checkers and the decode-error responder and has not been rebuilt since, so
treat it as the older design it is. The figures cover the whole system — VexRiscv, the axiZero crossbar, the RAM, the
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
- **`regSlice` registers VALID, not READY.** Each channel uses SpinalHDL's `Stream.stage()`, which
  is `m2sPipe`: VALID and the payload are registered and `upstream.ready = !rValid || downstream.ready`
  stays combinational. That is correct and loses no beat — READY has to stay combinational for
  bubbles to collapse — but it means an arbiter's grant can reach a master's READY in the same
  cycle, which is what the critical path on the loaded builds turned out to be. `regSliceSkid = true`
  makes the three forward channels full pipes (`s2mPipe` + `m2sPipe`) so READY is registered too;
  the skid register is what makes that safe, because once READY is a cycle stale the upstream can
  complete a handshake the downstream did not accept and the beat needs somewhere to go. Forward
  latency and throughput are unchanged. It is off by default and set only on the stress builds —
  see [timing closure on the loaded builds](#timing-closure-on-the-loaded-builds).
- **Response ordering.** Pipelined mode routes B/R by ID and both CPU ports drive a constant ID,
  so ordering only has to hold per master. IBus fetches never leave the RAM region, and
  `DBusSimplePlugin` keeps at most one read in flight and blocks reads while a write is
  outstanding.

See [ADR 002](docs/adr/002-vexriscv-example-soc.md) for why VexRiscv is carried as a pinned
submodule in its own sbt project.

---

## Hardware validation

Validation runs on two boards from two vendors: a Xilinx Arty A7-100T (`xc7a100t`) at 100 MHz
through Vivado, and a Terasic DE25-Nano (Agilex 5) at 50 MHz through Quartus. Both run the same
SpinalHDL source.

### The current suites

Six builds of the [VexRiscv example SoC](#example-system--vexriscv-soc), each built for both
boards from the same configuration object:

| Build | What it adds | Replaces |
|---|---|---|
| `verdict` | the firmware self test on a quiet fabric, **on the blocking crossbar** (`maxOutstanding = 1`) | base |
| `stress_rr` | two saturating self-checking generators, round robin | base under load |
| `stress_wrr` | the same, weighted 3:1 | wrr |
| `stress_qos` | the same, QoS across three ranks | qos, qos_stress |
| `stress_axi3` | the same, CPU load/store routed through AXI3 | axi3 |
| `stress_ids` | a second RAM and two multi-ID generators driving IDs between the two | — |

`verdict` is the only one built on the blocking engine. Blocking and pipelined are separate RTL
paths, and until now every bitstream here was the pipelined one — the blocking engine had
simulation coverage and no silicon. `verdict` is where it belongs: on a quiet fabric a stall shows
up as a boot that never finishes rather than as a statistic, so carrying the other engine costs
nothing that build was measuring. The five stress builds stay pipelined, which is where
arbitration and ordering have something to do.

Every one of them carries a [protocol checker](#protocol-checking) on each fabric port and the
AXI4-Stream smoke island, so the stream components are covered by all five stress builds rather than
by a build of their own — that is what replaces the axis suite. See [loading the crossbar on
hardware](#loading-the-crossbar-on-hardware) for what the generators do and why.

```bash
python hw/vivado/arty_a7/run_vexzero_test.py --design all       # Arty A7-100T, Vivado
python hw/quartus/de25_nano/run_vexzero_de25.py --design all    # DE25-Nano, Quartus
```

### Timing closure on the loaded builds

The `verdict` build closes at 100 MHz with room to spare. The four stress builds did not, and the
reason is worth writing down: a register slice as `Stream.stage()` registers VALID and the payload
but leaves READY combinational, so on a fabric with four masters the arbiter's grant could reach a
master's READY through the decode-error slave in a single cycle. Three changes closed it, measured
one at a time on `stress_qos`, the worst of the four:

| Step | WNS | Failing endpoints | TNS |
|---|---:|---:|---:|
| baseline | −1.902 ns | 821 | −416.8 |
| + `pipelineInputs` on the protocol checkers | −1.021 ns | 255 | −83.0 |
| + `slaveRegSlices` | −0.552 ns | 68 | −23.7 |
| + `masterRegSliceSkid` | **+0.316 ns** | 0 | — |

That progression was measured on the RTL as it stood before the response-channel fix described in
the changelog, so its last row (+0.316 ns) is not the number in the final table below (+0.540 ns) —
the crossbar has since gained the response-channel hold, and every build in the final table was
rebuilt from scratch on the fixed RTL. The rows are kept because what they show is the *shape* of
the problem and which change moved it, and re-running three intermediate builds to restate an
already-answered question would buy nothing.

None of the three changes is supposed to alter an arbitration decision, and the one that was most
likely to — the master-side skid, which changes when a master's request reaches the arbiter — was
checked: the generator beat counts before and after it are bit-identical (34,235 : 19,187 on the
weighted build). The other two rows were not re-measured beat-for-beat, so read that as "structural
by construction, confirmed for the step that mattered" rather than as four measured rows.

One attempt that did not work is worth recording too. Registering the QoS arbiter's effective-QoS
computation, at the source of the path, made things *worse* — −0.917 ns and 448 failing endpoints.
The path was 78–82% routing, not logic, so cutting it at its origin left the same long haul across
the die with one fewer level of logic to hide it. The register had to go mid-haul, which is what the
master-side skid does.

Final builds, all six programmed and verified on the board:

| Build | LUTs | FFs | BRAM | WNS | Fmax |
|---|---:|---:|---:|---:|---:|
| `verdict` | 2087 | 2654 | 3 | +0.472 ns | 105.0 MHz |
| `stress_rr` | 3579 | 4556 | 9 | +1.036 ns | 111.6 MHz |
| `stress_wrr` | 3707 | 4571 | 9 | +0.993 ns | 111.0 MHz |
| `stress_qos` | 3767 | 4617 | 9 | +0.075 ns | 100.8 MHz |
| `stress_axi3` | 4203 | 5056 | 9 | +0.986 ns | 110.9 MHz |
| `stress_ids` | 9441 | 8198 | 11 | +0.101 ns | 101.0 MHz |

Those are whole-SoC figures — VexRiscv, 8 KB RAM, peripherals, two traffic generators, a protocol
checker on every fabric port and the AXI4-Stream island — not the crossbar alone.

`stress_ids` is more than twice the size of the others, and the reason is worth being explicit
about: it is a bigger *system*, not a more expensive crossbar. It carries six masters where the
others carry four and four slaves where they carry three, and the crossbar's cost is roughly the
product of the two — every extra master-slave pair is another arbiter input, another decode and
another ordering-table entry. On top of that its two multi-ID generators carry four and two per-ID
expectation queues and the comparison logic that checks every R beat against one, and three more
protocol checkers come with the three extra ports, since every fabric port gets one. It is the
price of the *test*, paid once in a build that exists to run it.

Test conditions: Vivado 2025.2, `xc7a100tcsg324-1` (speed grade −1), 100 MHz target, Vivado
Implementation Defaults strategy with no directives, and implementation at `--jobs 8` (the
runner's own default is 4). The design instantiates no Xilinx IP, so nothing is synthesised
out-of-context. WNS is `STATS.WNS` of `impl_1` and Fmax is `1000 / (10 − WNS)`; the
implementation strategy is recorded beside the slack in `vexzero_timing.txt`, because an Fmax
without the strategy that produced it is not reproducible.

Both runners refuse to program a board when the worst setup slack is negative. Three limits are
worth stating plainly rather than leaving to be discovered: the gate reads **setup only**, so a hold
or pulse-width violation passes it (the tightest hold margin measured here is +0.011 ns on the Arty
`stress_qos` — positive, but not by much); `--allow-timing-failure` still ends in `PASSED` and exit
0, having said once, earlier, that the result is not evidence; and `run_vexzero_bench.py` has no
timing gate at all, so a Dhrystone score can come off a bitstream that missed timing.

`stress_ids` is worth a note of its own. Adding the write-response check cost it slack — +0.325 ns
before, **+0.101 ns** now — and the critical path is inside the crossbar's own ordering and
W-routing logic: 12 levels of logic but **80% routing delay**, the same placement-bound shape the
QoS path has. The first version of that check, with a slave added for it, came out at +0.017 ns;
using the decode-error responder already in the fabric bought most of that back. What is left is the
generators' own per-ID expectation queues and the traffic they add, and +0.101 ns is a real margin
rather than a rounding error — but it is still a design to re-measure rather than assume when
anything near the crossbar changes. On the DE25-Nano at 50 MHz none of this matters: the same builds
sit between +9.0 ns and +9.8 ns, and the variation there is placement noise, not the change.

`stress_qos` is the one to watch: its margin is thin enough that placement variation moves it
noticeably. Six builds of this design have come out at +0.316 ns, +0.121 ns, +0.540 ns, +0.373 ns,
+0.026 ns and +0.044 ns — several consecutive pairs of which differed only by a fix adding a
register or a handful of gates and no combinational depth. So the design has something like 0.5 ns
of run-to-run spread at this frequency, and its Fmax should be read as ~100-106 MHz rather than as
any one of those numbers. Every one of the six closed with zero failing endpoints.

The ordering table added for the AXI4 same-ID rule costs roughly 80-160 LUTs per build here (four
masters, `idThreads = 2`, four slaves plus the decode-error responder), and the write-data skew
tracking that goes with it a further handful of registers per slave. No build came out of closure.

The same six builds on the DE25-Nano, where the 50 MHz clock leaves far more margin and timing was
never the constraint:

| Build | ALMs | Registers | Block memory | Worst setup slack | Verdict word |
|---|---:|---:|---:|---:|---|
| `verdict` | 6121.6 (13%) | 9269 | 67,584 bits | +11.070 ns | `0x00000106` |
| `stress_rr` | 7822.4 (16%) | 12097 | 264,464 bits | +12.748 ns | `0x00000706` |
| `stress_wrr` | 7874.8 (16%) | 12108 | 264,464 bits | +12.054 ns | `0x00000706` |
| `stress_qos` | 8025.1 (17%) | 12191 | 264,464 bits | +9.942 ns | `0x00000706` |
| `stress_axi3` | 7891.5 (16%) | 12250 | 265,216 bits | +12.801 ns | `0x00000706` |
| `stress_ids` | 13179.2 (28%) | 19274 | 297,232 bits | +9.093 ns | `0x00000706` |

The ordering matches the Arty: `stress_qos` is the tightest of the four arbitration builds on both
boards, for the same reason, and `stress_ids` is the largest on both for the reason given above —
six masters and four slaves, plus the checking hardware inside the generators themselves.

The verdict word is read back over JTAG-AXI *across the crossbar under test*, because the
board has no serial link to a host — a fabric broken badly enough to hide its own verdict cannot
report a pass either.

Test conditions: Quartus Prime Pro 26.1, Agilex 5 `A5EB013BB23BE4SR1`, 50 MHz target (20 ns
period), default synthesis and fitter settings, Hyper-Retimer enabled but reporting no retiming
opportunities. Slack is the worst setup slack from the Setup Summary of the post-fit timing
analysis, and the runner refuses to program the board when it is negative. Quartus reports this
device's timing and clock-uncertainty characteristics as *preliminary*, so treat the Agilex slack
figures as indicative rather than final — the margin is large enough that it does not change the
conclusion.

### Retired — the MicroBlaze suites

**The six suites below are retired as of 2026-09-08.** They are not run, not maintained, and not a
gate on a push. Nothing has been deleted and they still work; see
[`hw/vivado/arty_a7/RETIRED.md`](hw/vivado/arty_a7/RETIRED.md) for the details and the replacement
map.

They were retired because each pulls in ten or eleven Xilinx IP cores plus a block design, so none
of them could ever be built for Altera — a hardware suite that runs on one vendor's silicon is
evidence about one vendor's silicon. The parts that were doing the testing were never the Xilinx
parts: the traffic generators in `hw/vivado/arty_a7/ip/rtl/` are our own portable Verilog, and only
the CPU and the peripherals were the lock. `ip/rtl/axi_sat_gen.v` in particular lives on as
[`AxiSatGen`](hw/spinal/axizero/verif/AxiSatGen.scala), which does the same job in SpinalHDL and so
runs in simulation and on both vendors. See [ADR 004](docs/adr/004-vendor-neutral-hardware-validation.md)
for the decision and what was rejected along the way.

The results below are the last ones recorded, kept for the record.

#### Base test (1M×4S)

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

#### WRR test (2M×4S, weighted round-robin)

Topology: MicroBlaze + hardware traffic generator → axiZero 2M×4S WRR (weights 3:1) → same slaves as base test.

All 3 tests pass (g\_fail=0, g\_pass=3).

| Test | Description |
|---|---|
| T1 | Sanity: single-word write/read to both BRAMs |
| T2 | Contention: MB and traffic gen write concurrently, both regions verified |
| T3 | Starvation: lower-weight master still makes progress under sustained load |

#### QoS hardware stress (4M×4S, heavy traffic)

Topology: MicroBlaze QoS=15 plus 3 hardware traffic generators (QoS=8/4/0) → axiZero 4M×4S QoS → same slaves as base test.
Each generator issues 512 words × 8 passes per iteration with intentionally different patterns:

- **G0** (QoS=8): sequential writes to BRAM0, each word read back and compared in hardware
- **G1** (QoS=4): reverse-order writes to BRAM1, each word read back and compared in hardware
- **G2** (QoS=0): saturating generator on a 128-word BRAM1 window, 64 passes — bursts of 1, 2, 4 and 8 beats (one length per pass) with up to 4 outstanding, every word read back and compared. Fewer words and more passes than the other two, chosen so its beat count matches theirs even though bursts retire faster

The generators drive the read address channel as well as the write one, so AR
arbitration sees generated traffic at each generator's own QoS rather than the
CPU alone, and G2 keeps several bursts in flight at once, which is the case the
crossbar's per-slave W-route FIFO exists for. Each generator ends its run by
writing a status word of its own:

```
status = TAG | (resp_errors << 8) | data_errors
```

so a clean run leaves the bare tag, and the firmware can tell "never finished"
apart from "finished and found errors". A read beat that is dropped or
mis-routed therefore fails on hardware, not only in simulation.

`run_qos_stress_test.py` monitors the board continuously for 10 minutes and fails if:
- `g_fail` becomes non-zero,
- heartbeat (`g_heartbeat`) stops advancing for 30 seconds,
- no stress iteration (`g_iteration`) completes,
- `g_pass` does not match the number of completed iterations (one sanity check
  at startup plus a fixed 6 sub-tests per iteration, so a build where they
  silently stopped running can no longer pass on a live heartbeat alone).

Result over a 10-minute continuous run on an Arty A7-100T at 100 MHz (Vivado 2025.2, `xc7a100tcsg324-1`): **12,734 iterations, 76,400 sub-test checks, 0 failures**, with all three generators reporting a clean read-back status on every iteration. The load is deterministic now that no generator randomises its addresses or data — two consecutive runs reach the same iteration count and agree at every 5-second sample — so a change in the numbers is a change in the design, not in the weather.

#### AXI3 adapter test (1M×4S, AXI3 bridge in data path)

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

#### AXI4-Stream smoke test

Topology: MicroBlaze plus the dedicated fcapz EJTAG-AXI debug ingress -> axiZero 2M x 5S -> the normal base-test slaves plus a 32-bit AXI GPIO input at `0xC004_0000`.

The GPIO samples a self-running `AxiStreamArtySmoke` datapath:

`3 sources` -> `AxiStreamArbMux` -> `AxiStreamFifo` -> `AxiStreamRegSlice` -> `AxiStreamWidthAdapter` 32-to-8 -> `AxiStreamDemux` -> direct byte sink or `AxiStreamWidthAdapter` 8-to-32 -> `AxiStreamBroadcaster`.

The smoke engine sends three two-beat 32-bit frames, arbitrates between all three sources, unpacks to bytes, routes frame 1 through the repack/broadcast path and frames 0/2 through the direct byte path, deliberately stalls one broadcast sink, then reports done/pass/fail, byte counts, frame counts, checksum matches, route checks, and backpressure observation. The MicroBlaze firmware polls that status through axiZero and passes only when the board-observed status has `done=1`, `pass=1`, `fail=0`, the expected counts/checksums/frame boundaries match, and backpressure was actually seen.

#### Arty fcapz debug

All Arty Vivado builds source `hw/vivado/arty_a7/fcapz_debug.tcl`, which adds the project-local `axizero_fcapz_debug` wrapper. The AXIS build inherits this through `create_project_axis.tcl` because it derives from the base Arty script. Builds with an appended debug ingress connect USER4 to the highest-numbered free `s*_axi` port, so existing MicroBlaze and traffic-generator ports keep their original wiring.

Debug chains:

| Chain | Function | Wiring |
|---|---|---|
| USER1 | fcapz ELA | Captures USER4 EJTAG-AXI requests plus the main-fabric `BRESP`/`RRESP` returned to that master. The default trigger fires on AXI `BRESP[1]` or `RRESP[1]`. |
| USER4 | fcapz EJTAG-AXI | Enters the main axiZero fabric through a dedicated appended AXI4-Lite ingress (`s1_axi` on base/AXIS, `s2_axi` on WRR/QoS, `s4_axi` on QoS stress), then reaches the normal axiZero slave map. |

### Running HW tests

The runners auto-detect Vivado, xsdb and Quartus by searching `PATH` and common install locations
(Windows and Linux). Override with environment variables if needed:

```bash
# Arty A7-100T, Vivado
python hw/vivado/arty_a7/run_vexzero_test.py                   # the self test
python hw/vivado/arty_a7/run_vexzero_test.py --design all      # every build, in turn
python hw/vivado/arty_a7/run_vexzero_bench.py                  # Dhrystone on the same SoC

# DE25-Nano, Quartus
python hw/quartus/de25_nano/run_vexzero_de25.py --design all

# Override tool paths via env vars
VIVADO_BIN=/opt/Xilinx/2025.2/Vivado/bin/vivado \
XSDB_BIN=/opt/Xilinx/2025.2/Vitis/bin/xsdb \
  python hw/vivado/arty_a7/run_vexzero_test.py
```

Each runner generates the netlist with sbt, builds the bitstream, programs the board, and reads the
verdict back — off the USB-UART with pyserial on the Arty, over the JTAG-to-AXI bridge on the
DE25-Nano. No `mb-gcc` is involved: the VexRiscv firmware is inside the bitstream. See
[example system](#example-system--vexriscv-soc).

The retired MicroBlaze runners (`run_base_test.py`, `run_wrr_test.py`, `run_qos_test.py`,
`run_qos_stress_test.py`, `run_axi3_test.py`, `run_axis_test.py`) additionally need `mb-gcc` to
compile their firmware. They still work; they are not part of the flow above.

**Crossbar-only resource usage** — the interconnect alone, without the MicroBlaze, the BRAM
controllers or the traffic generators around it:

| Configuration | LUTs | FFs |
|---|---:|---:|
| Base 2M×4S (round-robin, pipelined, max\_outstanding=4) | 804 | 98 |
| WRR 3M×4S (weighted round-robin 3:1:1, pipelined) | 1545 | 154 |
| QoS 3M×4S (QoS arbitration, pipelined) | 2008 | 234 |
| QoS stress 5M×4S (QoS arbitration, pipelined) | 3814 | 330 |

Test conditions: Vivado 2025.2, `xc7a100tcsg324-1`, out-of-context synthesis with no timing
constraint applied, `decode_error_response` at its default of on. Every topology counts the fcapz
debug master alongside the functional ones — for example the base design is the MicroBlaze plus the
debug port, so it is 2M×4S rather than 1M×4S.

What the decode responder itself costs, measured by regenerating the same four designs with
`decode_error_response = false` and synthesising them the same way:

| Configuration | LUTs off → on | FFs off → on |
|---|---:|---:|
| Base 2M×4S | 706 → 804 (+98) | 68 → 98 (+30) |
| WRR 3M×4S | 1226 → 1545 (+319) | 120 → 154 (+34) |
| QoS 3M×4S | 1796 → 2008 (+212) | 176 → 234 (+58) |
| QoS stress 5M×4S | 3577 → 3814 (+237) | 252 → 330 (+78) |

The responder is one extra slave port on the fabric, so it costs a slave's worth of arbitration and
routing rather than a fixed adder — which is why the widest topology does not pay the most.

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
    Axi4ToAxi3.scala           # the other direction, as wires: an AXI4 master presented on AXI3
    Axi4IdWidener.scala        # pads a narrow master's ID to the fabric width, truncates it back
  verif/
    Axi4ProtocolChecker.scala  # passive synthesizable AXI4 checker, 19 rules, one sticky bit each
    AxiSatGen.scala            # saturating self-checking AXI4 master — the synthesizable load
    AxiMultiIdGen.scala        # multi-ID self-checking AXI4 master — the synthesizable order check
  stream/
    AxiStreamCores.scala       # AXI4-Stream reg slice, width adapter, FIFO, arb-mux, demux, broadcaster
  gen/
    AxiZeroGen.scala           # built-in generation entry point
    ArtyDutGen.scala           # (retired) Arty A7 MicroBlaze DUT (1M×4S)
    ArtyQosDutGen.scala        # (retired) Arty A7 QoS DUT (2M×4S, QoS arbitration)
    ArtyAxi3DutGen.scala       # (retired) Arty A7 AXI3 adapter DUT
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
    VexZeroStress.scala        # the five loaded configurations, shared by sim and both boards
    JtagAxi.scala              # fpgacapZero JTAG-to-AXI bridge as an axiZero master
    HexImage.scala             # Intel HEX reader for prebuilt firmware images
    gen/VexZeroSocGen.scala    # -> generated/vexriscv/VexZeroSoc.v
    gen/VexZeroArtyGen.scala   # -> generated/vexriscv/VexZeroArty.v (ROM inlined)
    gen/VexZeroBenchArtyGen.scala  # -> generated/vexriscv/VexZeroBenchArty.v
    gen/VexZeroDe25Gen.scala   # -> generated/vexriscv/VexZero{,Bench}De25.v
    gen/VexZeroStressGen.scala # -> generated/vexriscv/VexZeroStress{Arty,De25}_<policy>.v
  sim/vexzero/sim/             # SpinalSim tests for the example (sbt vexZero/test)
    VexZeroBenchSpec.scala     #   Dhrystone over the crossbar, pipelined vs blocking
    VexZeroProfileSpec.scala   #   what that run asks of the fabric, uncached vs cached
    VexZeroStressSpec.scala    #   the same SoC with a third master saturating the fabric
    VexZeroGenStressSpec.scala #   the five board builds: arbitration under 97% contention, and ordering
    VexZeroProtocolSpec.scala  #   the protocol checkers on every fabric port, in the SoC
    VexZeroVideoQosSpec.scala  #   why AXQOS cannot rank CPU reads against video writes
    HostTraffic.scala          #   the saturating master: 16-beat bursts, AW ahead of W
    AxiProfile.scala           #   per-port traffic shape and latency, measured at the master ports
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
  find_xilinx_tools.py         # cross-platform Vivado/xsdb/mb-gcc auto-detection
  create_project_vexzero.tcl   # plain RTL project for any VexZero board wrapper
  run_vexzero_test.py          # VexZero HW test runner: verdict + the four stress builds
  run_vexzero_bench.py         # VexZero Dhrystone runner (UART console)
  RETIRED.md                   # what the MicroBlaze suites were, and what replaced them
  ip/rtl/                      # (retired) Arty handoff RTL for the MicroBlaze block designs
  run_{base,wrr,qos,qos_stress,axi3,axis}_test.py   # (retired) MicroBlaze HW test runners
hw/quartus/de25_nano/
  build_vexzero_de25.tcl       # Quartus batch build for any VexZero DE25 wrapper
  run_vexzero_de25.py          # DE25-Nano runner: verdict read back over JTAG-AXI
```

---

## License

MIT — see [LICENSE](LICENSE).

Copyright © Leonardo Capossio, [bard0 design](https://www.bard0.com) — hello@bard0.com
