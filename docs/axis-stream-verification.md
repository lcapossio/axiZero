<!-- Copyright (c) 2026 Leonardo Capossio - bard0 design  hello@bard0.com -->
<!-- SPDX-License-Identifier: MIT -->

# AXI4-Stream Verification

axiZero currently verifies the AXI4-Stream cores at four levels:

- SpinalSim unit tests cover each core's packet behavior, backpressure, TLAST routing, sparse TKEEP/TSTRB sidebands, and TID/TDEST/TUSER propagation.
- cocotb tests run generated Verilog through `cocotbext-axi` `AxiStreamSource` and `AxiStreamSink` BFMs.
- `formal/axis_ready_valid_props.sv` provides reusable ready/valid stability properties for bind or wrapper-based formal checks.
- The Arty A7 AXIS hardware smoke test runs a multi-source packet network in fabric and reports status through axiZero.

Run the focused regression:

```bash
python scripts/run_sim.py axis
```

That command lints Python, runs `AxiStreamCoreSpec`, generates all stream cores from YAML, checks generated port names, and runs the cocotb AXIS generated-RTL tests.

Current regression conditions:

| Layer | Tool/version | Conditions |
|---|---|---|
| SpinalSim | SpinalHDL 1.14.2, sbt 1.9.7, Java 21.0.11 | `AxiStreamCoreSpec`, 10 ns clock period, synchronous active-low reset |
| cocotb generated RTL | cocotb 2.0.1 runner (`cocotb_tools.runner`), cocotbext-axi BFMs, Verilator 5.048 | Generated smoke cores from `sim/cocotb_gen/run_all.py axis`, Verilator trace enabled |
| Formal smoke | SymbiYosys / z3 when installed | `axis_ready_valid_regslice.sby`, depth 20, ready/valid stability on the generated register slice |
| Hardware smoke | Vivado/Vitis 2025.2, Arty A7-100T | `run_axis_test.py`, 100 MHz board clock, status GPIO at `0xC004_0000` |

## TUSER width

`Axi4StreamConfig.userWidth` is bits **per data byte**, not the total TUSER width, matching the
AXI4-Stream specification. A config with `dataWidth = 8` (an 8-byte / 64-bit bus) and
`userWidth = 5` therefore carries a 40-bit `tuser` port. Testbenches must read `tuser` as a
`BigInt`; anything wider than 32 bits overflows `toInt`.

The generator's YAML `user_width` key feeds the same field, so `data_width: 32` with
`user_width: 2` emits an 8-bit `tuser` port. cocotbext-axi models the sideband per byte in both
directions: `AxiStreamSink.recv(compact=False)` reports one TID/TDEST/TUSER entry per byte lane,
and `AxiStreamSource.send()` pads a short list with its last element and drives each beat from
that beat's last byte lane. Supplying one entry per byte is the only way to vary TUSER per beat.

For a practical generator starting point, see:

```bash
python scripts/axizero.py generate scripts/examples/axis_packet_pipeline.yaml --output generated/axis_packet_pipeline
```

The example emits a packet-ingress chain: two-source arbiter, elastic FIFO, timing slice, 32-to-8 unpacker, packet demux, and monitor broadcaster. Wire the generated modules with AXIS `tvalid/tready/tdata/tkeep/tstrb/tlast` ports in your top-level RTL or Vivado block design.
