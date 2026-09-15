# Retired: the MicroBlaze Arty suites

*Retired 2026-09-08. Superseded by the VexZero designs in the same directory.*

Six hardware suites in this directory were built around a Xilinx MicroBlaze and
are no longer maintained, no longer run, and no longer a gate on a push:

| suite | scripts | what it covered |
|---|---|---|
| base | `create_project.tcl`, `run_base_test.py`, `rename_base_ports.py` | 1M×4S crossbar, round robin |
| wrr | `create_project_wrr.tcl`, `run_wrr_test.py`, `rename_wrr_ports.py` | weighted round robin |
| qos | `create_project_qos.tcl`, `run_qos_test.py`, `rename_qos_ports.py` | QoS arbitration |
| qos_stress | `create_project_qos_stress.tcl`, `run_qos_stress_test.py`, `rename_qos_stress_ports.py` | QoS under saturation |
| axi3 | `create_project_axi3.tcl`, `run_axi3_test.py` | the AXI3-to-AXI4 adapter |
| axis | `create_project_axis.tcl`, `run_axis_test.py`, `rename_axis_ports.py` | the AXI4-Stream components |

The files are still here and still work; nothing has been deleted. What has
changed is that they are not part of the test flow and will not be kept working
as the RTL moves on.

## Why

Every one of those designs pulls in ten or eleven Xilinx IP cores — `microblaze`,
`axi_bram_ctrl`, `axi_gpio`, `axi_uartlite`, `lmb_bram_if_cntlr`, `lmb_v10`,
`mdm`, `blk_mem_gen`, `proc_sys_reset`, `xlconstant`, `xlslice` — plus a block
design. None of that can be built for Altera, so none of it could ever run on
the DE25-Nano, and axiZero is meant to be vendor-neutral. A hardware suite that
can only be run on one vendor's silicon is evidence about one vendor's silicon.

The parts that were actually doing the testing were never the Xilinx parts. The
traffic generators in `ip/rtl/` are our own portable Verilog; only the CPU and
the peripherals were the lock. So the suites were rebuilt around VexRiscv, which
is written in SpinalHDL like axiZero itself, and which already ran on both
boards.

## What replaced them

The [`VexZero`](../../examples/vexriscv) example SoC, in five builds:

| build | replaces | run it |
|---|---|---|
| `verdict` | base | `python run_vexzero_test.py` |
| `stress_rr` | base under load | `python run_vexzero_test.py --design stress_rr` |
| `stress_wrr` | wrr | `python run_vexzero_test.py --design stress_wrr` |
| `stress_qos` | qos, qos_stress | `python run_vexzero_test.py --design stress_qos` |
| `stress_axi3` | axi3 | `python run_vexzero_test.py --design stress_axi3` |

The AXI4-Stream suite has no build of its own: the stream island rides in all
four stress builds, because it shares nothing with the bus and so costs a
bitstream almost nothing to carry.

`python run_vexzero_test.py --design all` runs the lot.

The same five build for Quartus and run on the DE25-Nano —
`python ../../quartus/de25_nano/run_vexzero_de25.py --design all` — which is the
entire point of having replaced them.

Two things the retired suites could not do at all:

- **The load is self-checking.** [`AxiSatGen`](../../spinal/axizero/verif/AxiSatGen.scala)
  is the SpinalHDL successor to `ip/rtl/axi_sat_gen.v`. It reads back every word
  it wrote, so a mis-routed beat fails on the board rather than only in
  simulation, and its verdict is a wire rather than a status word in aliased
  BRAM.
- **The protocol itself is judged.** Every fabric port carries a passive
  [`Axi4ProtocolChecker`](../../spinal/axizero/verif/Axi4ProtocolChecker.scala)
  for the whole run, so a crossbar that returns the right data while violating
  AXI4 does not pass.
