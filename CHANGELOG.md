# Changelog

All notable changes to axiZero will be documented in this file.

## [Unreleased]

### Added

- **VexRiscv example SoC** (`hw/examples/vexriscv/`) — a RISC-V core booting through the crossbar into a mixed AXI4 / AXI4-Lite address map: VexRiscv IBus + DBus as the two masters, an 8 KB on-chip RAM on a full AXI4 port, and AXI4-Lite GPIO and system-control peripherals. Built as a separate sbt project (`vexZero`) against a pinned `third_party/VexRiscv` submodule; the root project neither aggregates nor depends on it, so a checkout without the submodule is unaffected. See [ADR 002](docs/adr/002-vexriscv-example-soc.md).
- **`vexzero.Rv32`** — a small RV32I encoder that assembles the example's boot firmware at elaboration time, so the SoC test needs no RISC-V cross compiler and no binary is tracked in git. Verified byte-identical to `riscv64-unknown-elf-as` for the whole program.
- **`VexZeroSocSpec`** — 3 tests: boot to completion on the pipelined crossbar, on the blocking crossbar, and a check that the assembled firmware image matches the documented program.
- **`VexZeroArty`** — an Arty A7-100T board wrapper for the example SoC. It reruns the SoC's checks in hardware and reports the verdict on LD4–LD7 and as a repeating 9-byte line on the USB-UART (115200 8N1), the last byte being the switch nibble the firmware read back over AXI4-Lite. Verified on the board: `VZPDRCLF`, 1093 LUTs, 1142 registers, 3 block RAM tiles, WNS +0.634 ns at 100 MHz (106.8 MHz Fmax) with Vivado 2025.2 on `xc7a100tcsg324-1`.
- **`VexZeroArtySpec`** — simulates the board wrapper and decodes its report line from `uart_rxd_out` at the real 115200 8N1, so a broken report is caught in a two-minute run instead of a twenty-minute Vivado round trip.
- **`run_vexzero_test.py`** — hardware test runner for the example SoC: generates the netlist, builds the bitstream, programs the Arty over JTAG and checks the serial verdict. Needs only Vivado and xsdb; there is no MicroBlaze in the design, so no `mb-gcc`.
- **CI job `VexRiscv example SoC`** — initialises only the VexRiscv submodule, then runs scalafmt, the boot tests, and the netlist generator.
- **Dhrystone benchmark on the example SoC** — `VexZeroBenchArty` runs the prebuilt RV32I `dhrystoneO3.hex` that ships with the pinned VexRiscv submodule and streams the benchmark's own console over the USB-UART. On the Arty A7-100T at 100 MHz: 328,048 cycles for 200 runs (1640.2 per run), 60,967 Dhrystones/s, **0.347 DMIPS/MHz**, all 20 self-checks passing — cycle-for-cycle identical to simulation. Blocking mode (`max_outstanding = 1`) costs 1.2% (331,848 cycles, 0.343 DMIPS/MHz). Measured at the crossbar's master ports: instruction fetch 153,191 reads at 3.04 cycles average AR→R latency; load/store 17,953 reads at 3.00 cycles and 18,796 writes at 3.09 cycles AW→B — the three-cycle floor of the registered path, so the fabric never queued under this load. Resources for the whole benchmark SoC: 1213 LUTs, 1263 registers, 9 block RAM tiles, 0 DSPs, WNS +0.521 ns (105.5 MHz Fmax), Vivado 2025.2 on `xc7a100tcsg324-1`.
- **`VexZeroBenchIo`** — a third AXI4-Lite slave implementing the console MMIO of VexRiscv's own regression testbench (`0xF00F_F000`: putchar, cycle counter, exit, error), so upstream firmware images run unmodified. Its putchar register backpressures: a full UART FIFO stalls the CPU's store rather than dropping a character.
- **`HexImage`** — an Intel HEX reader (records 00/01/04/05, checksums verified) that loads a prebuilt firmware image into the SoC's RAM at elaboration time, so a benchmark needs no cross compiler and no binary enters git.
- **`VexZeroBenchSpec`** — 3 tests: Dhrystone on the pipelined crossbar and on the blocking crossbar, both re-running the benchmark's own self-checks and asserting per-port AXI latency, plus a board-level test that decodes the whole console off `uart_rxd_out`.
- **`VexZeroBoard`** — the clock and reset generation both Arty wrappers share, so they cannot drift apart.
- **`run_vexzero_bench.py`** — hardware runner for the benchmark: opens the serial port before programming (the program runs once at configuration), streams the console, then re-runs Dhrystone's self-checks and recomputes the score from the cycle count.

## [0.3.1] — 2026-03-15

### Fixed

- **`Axi4DownsizerExt` FIXED burst multi-beat crash** — FIXED bursts with `len > 0` caused simulation deadlocks because the downsizer emitted multi-beat sub-AW transactions with incorrect data interleaving. Sub-transactions for FIXED bursts are now flattened to single-beat (`len=0, burst=INCR`), with addresses cycling through byte lanes within the wide word.
- **`Axi4DownsizerExt` WRAP burst wrap-around failure** — WRAP bursts that crossed the wrap boundary within a sub-AW transaction produced incorrect addresses because the downstream slave computed its own (narrower) wrap boundary. Sub-transactions for WRAP bursts are now flattened to single-beat (`len=0, burst=INCR`), with the sub-transaction generator computing all wrapped addresses internally.

### Added

- **`BurstTypeSpec`** — 6 tests: INCR 2-beat baseline, FIXED 1-beat and 2-beat overwrite, WRAP 2-beat aligned, WRAP 4-beat aligned, WRAP 4-beat with actual wrap-around.
- **`ArbitrationSpec`** — 7 tests: FixedPriority (smoke, contention, 3-master ordering) and WeightedRoundRobin (smoke, weight proportionality, equal-weight fairness, data integrity).
- **`RegSliceAndLiteWidthSpec`** — 8 tests: Full AXI4 register slices (master/slave/both, multi-beat burst), Lite register slices (master/both), AXI4-Lite width conversion (16→32 upsizing, multiple addresses).
- **`PipelinedArbitrationSpec`** — 9 tests: pipelined FixedPriority (smoke, contention, concurrent bursts), pipelined WRR (smoke, weight-3 wins, data integrity), pipelined QoS (write contention, read contention, data integrity).
- **`NarrowPortSpec`** — 6 tests: narrow slave 32→16 (single-beat, burst, scattered), narrow master 16→32, mixed concurrent Full+Lite from 2 masters.

### Changed

- SpinalSim test count: 40 → 76 (36 new tests across 5 new suites), 13 suites total.
- INCR burst path in `Axi4DownsizerExt` is unchanged (multi-beat sub-AW for efficiency).

## [0.3.0] — 2026-03-14

### Added

- **QoS-based arbitration** (`arbitration: qos`) — highest `AXQOS` value wins contention; equal QoS falls back to round-robin. Masters without `useQos` are treated as QoS 0. AXI4-Lite crossbar falls back to pure round-robin (no QoS field).
- **Aging-based anti-starvation** — per-master age counters increment each cycle a request is pending but not granted (saturates at 15). Effective QoS = min(rawQoS + age, 15), so a starved QoS-0 master eventually matches QoS 15 and gets served.
- **`QosCrossbarSpec`** — 5 SpinalSim tests: higher AWQOS wins (blocking and pipelined), higher ARQOS wins, equal-QoS round-robin tie-break, aging prevents starvation of low-QoS requester.
- **QoS hardware test** — 2-master stress harness (MicroBlaze + traffic generator) on Arty A7-100T with `ArtyQosDutGen`, `rename_qos_ports.py`, and `run_qos_test.py`. All 4 HW tests pass (g\_fail=0, g\_pass=4).
- **cocotb QoS test suite** — 6 cocotbext-axi integration tests (`sim/cocotb_gen/qos/test_qos.py`): dual-master R/W, address routing, higher QoS wins contention, equal-QoS round-robin, aging anti-starvation, QoS read priority.
- **QoS example design** — `MyFull_2M2S_QoS` added to `scripts/example.yaml` (2-master, 2-slave, full AXI4, QoS arbitration, `max_outstanding=4`).

### Changed

- SpinalSim test count: 34 → 39 (5 new `QosCrossbarSpec` tests), 7 suites total.
- cocotb test count: 18 → 24 (6 new QoS tests), 4 suites total.

## [0.2.0] — 2026-03-11

### Added

- **Full AXI4 data-width conversion** — burst-level upsizer (`Axi4Upsizer`) and downsizer (`Axi4DownsizerExt`) inserted automatically at Full AXI4 ports whose `data_width` differs from the internal fabric width. Supports arbitrary power-of-two ratios (e.g. 32↔64, 32↔128).
- **`Axi4DownsizerExt`** (`adapters/Axi4DownsizerExt.scala`) — local fork of SpinalHDL's `Axi4Downsizer` with FIXED, INCR, and WRAP burst types supported. IDs propagate naturally through the sub-transaction pipeline; no single-register workaround. Reserved burst type `0b11` triggers a simulation assertion. *(FIXED/WRAP multi-beat bugs fixed in v0.3.1.)*
- **`WidthConverterSpec`** — 6 SpinalSim tests covering 32→64 upsizing (single-beat, burst, routing), 64→32 downsizing (single-beat, burst), and 32→64→32 round-trip passthrough.

### Changed

- `WidthConverter.scala` downsizing branch simplified from ~70 lines of manual channel wiring to 3 lines using `Axi4DownsizerExt`.
- SpinalSim test count: 28 → 34 (6 new `WidthConverterSpec` tests).

## [0.1.0] — 2026-03-09

First public release.