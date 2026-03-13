# Changelog

All notable changes to axiZero will be documented in this file.

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
- **`Axi4DownsizerExt`** (`adapters/Axi4DownsizerExt.scala`) — local fork of SpinalHDL's `Axi4Downsizer` with FIXED, INCR, and WRAP burst types fully supported. IDs propagate naturally through the sub-transaction pipeline; no single-register workaround. Reserved burst type `0b11` triggers a simulation assertion.
- **`WidthConverterSpec`** — 6 SpinalSim tests covering 32→64 upsizing (single-beat, burst, routing), 64→32 downsizing (single-beat, burst), and 32→64→32 round-trip passthrough.

### Changed

- `WidthConverter.scala` downsizing branch simplified from ~70 lines of manual channel wiring to 3 lines using `Axi4DownsizerExt`.
- SpinalSim test count: 28 → 34 (6 new `WidthConverterSpec` tests).

## [0.1.0] — 2026-03-09

First public release.