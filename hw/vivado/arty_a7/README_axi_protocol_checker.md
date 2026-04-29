# AMD AXI Protocol Checker integration (optional)

The base `create_project.tcl` flow can optionally instantiate the
[AMD AXI Protocol Checker IP](https://docs.amd.com/r/en-US/pg101-axi-protocol-checker)
on the `m0_axi` interface (axiZero → `axi_bram_ctrl_0`) for runtime AXI4
protocol monitoring on real hardware.

## What it does

The IP is a synthesizable port of ARM's official AMBA AXI protocol assertions.
When attached to an interface it actively checks for protocol violations such
as:

- **Handshake stability** — `AXI_ERRM_AWVALID_STABLE`, `AXI_ERRM_WVALID_STABLE`,
  `AXI_ERRS_RVALID_STABLE`, `AXI_ERRS_BVALID_STABLE`
- **Payload stability while VALID && !READY** — `AXI_ERRM_AWADDR_STABLE`,
  `AXI_ERRM_WDATA_STABLE`, `AXI_ERRM_WSTRB_STABLE`, `AXI_ERRM_WLAST_STABLE`
- **Reset rules** — `AXI_ERRM_AWVALID_RESET`, `AXI_ERRS_BVALID_RESET`, etc.
- **Burst boundary** — `AXI_ERRM_AWLEN_BOUNDARY` (no 4 KB crossings)
- **Burst type encoding** — `AXI_ERRM_AWBURST`
- **Exclusive access** — `AXI_ERRM_EXCL_ALIGN`, `AXI_ERRM_EXCL_LEN`
- **Response/length matching** — `AXI_ERRS_BRESP_WLAST`, `AXI_ERRS_RDATA_NUM`
- **Exclusive response** — `AXI_ERRS_BRESP_EXOKAY`
- **X-checks** on control signals

It is **passive** — it only observes the same signals that already feed
`axi_bram_ctrl_0`, so the rest of the design is unchanged.

## How to enable

```bash
# From the repository root, with Vivado in PATH:
vivado -mode batch -source hw/vivado/arty_a7/create_project.tcl -tclargs 4 1
#                                                                       │ │
#                                                                       │ └── enable_axi_pc = 1
#                                                                       └──── -jobs 4
```

Default is `0` (off) so the baseline build is bit-identical to the original.

## How to read the violation status on hardware

The full `pc_status[159:0]` bus is latched into sticky flip-flops by
`axi_pc_sticky.v`. The OR-reduction of all sticky bits is routed to a new
top-level output port `axi_pc_violation` on **LD0_R** (Arty A7-100T RGB LED 0,
red — pin G6).

| LED state            | Meaning                                                       |
|----------------------|---------------------------------------------------------------|
| Red OFF (LD0_R = 0)  | No protocol violation detected since last reset.              |
| Red ON  (LD0_R = 1)  | At least one rule fired. Sticky — stays on until system reset.|

The helper also exposes a 32-bit software view through AXI GPIO channel 2 at
`0xC0020008` when the checker is enabled:

| View bits | Meaning |
|-----------|---------|
| `view[29:0]` | `pc_status[59:30]`, bit-for-bit sticky detail view |
| `view[30]` | Reserved, reads 0 |
| `view[31]` | OR of all 160 sticky bits |

`run_base_test.py` reads this value after halting MicroBlaze and decodes the
visible `pc_status[59:30]` rule names. A successful base test run should leave
LD0_R off and print `axi_pc view = 0x00000000`. If `g_pass=10` but bit 31 is
set, the functional test passed while the protocol checker saw a violation.

## Resource impact

The checker IP adds roughly 200–400 LUTs and 100–200 FFs to the design.
It is purely synthesizable RTL — no special license required to build or
deploy. (The Xilinx IP itself ships with Vivado at no extra cost.)

## Limitations

- Vivado-only. The IP source is IEEE-1735 encrypted and **cannot** be used
  with Verilator, Icarus, or other open-source simulators. For Verilator-based
  CI we use the cocotb test suites and SymbiYosys formal proofs instead.
- The checker only watches `m0_axi`. The other slave interfaces (`m1_axi`,
  `m2_axi`, `m3_axi`) and the master interface from MicroBlaze are not
  monitored. To extend coverage, instantiate additional `axi_pc_*` cells
  following the same pattern in `create_project.tcl`.
- Some `pc_axi_*qos`/`*region` pins may not exist depending on the IP version
  selected; the script uses `safe_net` for these so older Vivado releases
  still work.

## Files added by this integration

| File                                                          | Purpose                                                       |
|---------------------------------------------------------------|---------------------------------------------------------------|
| `hw/vivado/arty_a7/axi_pc_sticky.v`                           | Sticky-latches `pc_status[159:0]` and exposes a 32-bit view   |
| `hw/vivado/arty_a7/constraints/arty_a7_100t_pc.xdc`           | Pin assignment for `axi_pc_violation` → LD0_R                 |
| `hw/vivado/arty_a7/create_project.tcl` (`enable_axi_pc` block) | IP instantiation, snoop wiring, sticky flag, top-level port  |
