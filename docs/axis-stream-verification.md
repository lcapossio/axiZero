<!-- Copyright (c) 2026 Leonardo Capossio - bard0 design  hello@bard0.com -->
<!-- SPDX-License-Identifier: MIT -->

# AXI4-Stream Verification

axiZero currently verifies the AXI4-Stream cores at four levels:

- SpinalSim unit tests cover each core's packet behavior, backpressure, TLAST routing, and sparse TKEEP/TSTRB sidebands.
- cocotb tests run generated Verilog through `cocotbext-axi` `AxiStreamSource` and `AxiStreamSink` BFMs.
- `formal/axis_ready_valid_props.sv` provides reusable ready/valid stability properties for bind or wrapper-based formal checks.
- The Arty A7 AXIS hardware smoke test runs a multi-source packet network in fabric and reports status through axiZero.

Run the focused regression:

```bash
python scripts/run_sim.py axis
```

That command lints Python, runs `AxiStreamCoreSpec`, generates all stream cores from YAML, checks generated port names, and runs the cocotb AXIS generated-RTL tests.

For a practical generator starting point, see:

```bash
python scripts/axizero.py generate scripts/examples/axis_packet_pipeline.yaml --output generated/axis_packet_pipeline
```

The example emits a packet-ingress chain: two-source arbiter, elastic FIFO, timing slice, 32-to-8 unpacker, packet demux, and monitor broadcaster. Wire the generated modules with AXIS `tvalid/tready/tdata/tkeep/tstrb/tlast` ports in your top-level RTL or Vivado block design.
