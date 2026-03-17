#!/usr/bin/env python3
# Copyright (c) 2026 Leonardo Capossio — bard0 design  hello@bard0.com
# SPDX-License-Identifier: MIT
"""
axizero.py  —  Generate AXI/AXI-Lite interconnect Verilog from a YAML config.

Usage:
    python axizero.py generate config.yaml
    python axizero.py generate config.yaml --output rtl/
    python axizero.py generate config.yaml --java-home /path/to/jdk --sbt /path/to/sbt
    python axizero.py example               # print a working example YAML

Requirements:
    pip install pyyaml
"""

import argparse
import os
import re
import shutil
import subprocess
import sys
import textwrap
from pathlib import Path

# ---------------------------------------------------------------------------
# Dependency check
# ---------------------------------------------------------------------------
try:
    import yaml
except ImportError:
    print("ERROR: PyYAML not found.  Install it with:\n    pip install pyyaml")
    sys.exit(1)

# ---------------------------------------------------------------------------
# Paths
# ---------------------------------------------------------------------------
SCRIPTS_DIR = Path(__file__).resolve().parent
REPO_ROOT   = SCRIPTS_DIR.parent
GEN_DIR     = REPO_ROOT / "hw" / "spinal" / "axizero" / "gen"
USER_SCALA  = GEN_DIR / "AxiZeroUserGen.scala"
SBT_OUTDIR  = REPO_ROOT / "generated"

# ---------------------------------------------------------------------------
# Java / sbt auto-discovery
# ---------------------------------------------------------------------------

def _find_java() -> Path | None:
    # 1. JAVA_HOME env var
    jh = os.environ.get("JAVA_HOME")
    if jh:
        java = Path(jh) / "bin" / "java"
        if java.exists():
            return java
        java = Path(jh) / "bin" / "java.exe"
        if java.exists():
            return java

    # 2. java already on PATH
    found = shutil.which("java")
    if found:
        return Path(found)

    # 3. Coursier bootstrap (Windows — created by the axiZero dev bootstrap)
    coursier_base = (
        Path.home()
        / "AppData/Local/Coursier/cache/arc"
        / "https/github.com/adoptium/temurin21-binaries/releases/download"
    )
    if coursier_base.exists():
        for jdk_dir in sorted(coursier_base.iterdir(), reverse=True):
            for sub in jdk_dir.iterdir():
                java = sub / "bin" / "java.exe"
                if java.exists():
                    return java

    return None


def _find_sbt() -> Path | None:
    # 1. sbt / sbt.bat on PATH
    for name in ("sbt", "sbt.bat"):
        found = shutil.which(name)
        if found:
            return Path(found)

    # 2. Common Linux/macOS locations
    for candidate in [
        Path("/usr/local/bin/sbt"),
        Path.home() / ".local" / "share" / "coursier" / "bin" / "sbt",
        Path.home() / ".coursier" / "bin" / "sbt",
        Path.home() / ".sdkman" / "candidates" / "sbt" / "current" / "bin" / "sbt",
    ]:
        if candidate.exists():
            return candidate

    # 3. Common Windows locations
    for candidate in [
        Path("C:/Program Files/sbt/bin/sbt.bat"),
        Path("C:/sbt/bin/sbt.bat"),
        Path("/tmp/cs_apps/sbt.bat"),   # axiZero dev bootstrap
    ]:
        if candidate.exists():
            return candidate

    return None


INSTALL_HINT = textwrap.dedent("""
    Java and sbt are required to generate Verilog.  Quick install (all platforms):

        # 1. Install Coursier
        #    https://get-coursier.io/docs/cli-installation

        # 2. Use Coursier to install both:
        cs install java sbt

    Then re-run this script.  You can also point to an existing installation:
        python axizero.py generate config.yaml --java-home /path/to/jdk --sbt /path/to/sbt
""")

# ---------------------------------------------------------------------------
# YAML schema & validation
# ---------------------------------------------------------------------------

ARBITRATION_MAP = {
    "round_robin":          "RoundRobin",
    "fixed_priority":       "FixedPriority",
    "qos":                  "QosBased",
    "weighted_round_robin": "WeightedRoundRobin",
}

def _err(msg: str):
    print(f"ERROR: {msg}", file=sys.stderr)
    sys.exit(1)


def _validate_design(d: dict, idx: int):
    tag = f"designs[{idx}] ({d.get('name', '?')})"

    if "name" not in d:
        _err(f"{tag}: 'name' is required")
    design_type = d.get("type")
    if design_type is not None and design_type not in ("lite", "full"):
        _err(f"{tag}: 'type' must be 'lite' or 'full'")

    arb = d.get("arbitration", "round_robin")
    if arb not in ARBITRATION_MAP:
        _err(f"{tag}: unknown arbitration '{arb}'. "
             f"Choose: {', '.join(ARBITRATION_MAP)}")

    mo = d.get("max_outstanding", 1)
    if not isinstance(mo, int) or mo < 1:
        _err(f"{tag}: 'max_outstanding' must be a positive integer (got {mo!r})")

    if arb == "weighted_round_robin":
        weights = d.get("weights")
        if not weights or not isinstance(weights, list):
            _err(f"{tag}: 'weights' list required for weighted_round_robin")

    masters = d.get("masters", [])
    slaves  = d.get("slaves",  [])
    if not masters:
        _err(f"{tag}: at least one master is required")
    if not slaves:
        _err(f"{tag}: at least one slave is required")

    if arb == "weighted_round_robin" and len(d["weights"]) != len(masters):
        _err(f"{tag}: weights length ({len(d['weights'])}) must equal "
             f"number of masters ({len(masters)})")

    for mi, m in enumerate(masters):
        pt = m.get("type")
        if pt is not None and pt not in ("lite", "full"):
            _err(f"{tag} master[{mi}]: 'type' must be 'lite' or 'full'")

    for si, s in enumerate(slaves):
        if "base" not in s:
            _err(f"{tag} slave[{si}]: 'base' address is required")
        if "size" not in s:
            _err(f"{tag} slave[{si}]: 'size' is required")
        pt = s.get("type")
        if pt is not None and pt not in ("lite", "full"):
            _err(f"{tag} slave[{si}]: 'type' must be 'lite' or 'full'")

    # Validate slave id_width: if explicitly set on a full slave, it must be
    # at least as wide as the crossbar's expanded ID (master id + index bits).
    if not _is_all_lite(d):
        required_idw = _compute_slave_idw(d)
        for si, s in enumerate(slaves):
            if _port_type(s, d) == "full" and "id_width" in s:
                user_idw = s["id_width"]
                if user_idw < required_idw:
                    _err(f"{tag} slave[{si}]: id_width={user_idw} is too narrow; "
                         f"the crossbar expands IDs to {required_idw} bits "
                         f"(master id_width + {required_idw - max(m.get('id_width', 4) for m in masters if _port_type(m, d) == 'full')} "
                         f"index bits for {len(masters)} masters). "
                         f"Set id_width to at least {required_idw} or omit it for auto-computation.")


def _parse_int(v) -> int:
    """Accept int or hex string like '0x1000'."""
    if isinstance(v, int):
        return v
    return int(str(v), 0)

# ---------------------------------------------------------------------------
# Scala code generation
# ---------------------------------------------------------------------------

LITE_AXI4_CONFIG = """\
Axi4Config(
            addressWidth = {addr_width},
            dataWidth    = {data_width},
            useId        = false,
            useRegion    = false,
            useBurst     = false,
            useLock      = false,
            useCache     = false,
            useSize      = false,
            useQos       = false,
            useLen       = false,
            useLast      = false,
            useResp      = true,
            useProt      = true,
            useStrb      = true
          )"""

FULL_AXI4_CONFIG = """\
Axi4Config(
            addressWidth = {addr_width},
            dataWidth    = {data_width},
            idWidth      = {id_width}
          )"""


def _scala_bigint(value: int) -> str:
    return f'BigInt("{value:016x}", 16)'


def _scala_arbitration(d: dict) -> str:
    arb = d.get("arbitration", "round_robin")
    scala = ARBITRATION_MAP[arb]
    if arb == "weighted_round_robin":
        weights = d["weights"]
        return f"WeightedRoundRobin(Seq({', '.join(str(w) for w in weights)}))"
    return scala


def _default_addr_width(d: dict) -> int:
    widths = (
        [m.get("addr_width", 32) for m in d.get("masters", [])] +
        [s.get("addr_width", 32) for s in d.get("slaves",  [])]
    )
    return max(widths)


def _default_data_width(d: dict) -> int:
    widths = (
        [m.get("data_width", 32) for m in d.get("masters", [])] +
        [s.get("data_width", 32) for s in d.get("slaves",  [])]
    )
    return max(widths)


def _port_type(port: dict, design: dict) -> str:
    """Resolve per-port type: port-level overrides design-level, default 'full'."""
    return port.get("type", design.get("type", "full"))


def _is_all_lite(d: dict) -> bool:
    """True if every master and slave in the design is AXI4-Lite."""
    return (
        all(_port_type(m, d) == "lite" for m in d.get("masters", [])) and
        all(_port_type(s, d) == "lite" for s in d.get("slaves",  []))
    )


def _compute_slave_idw(d: dict) -> int:
    """Compute slave-side expanded ID width = max(full master id_widths) + masterIndexBits."""
    import math
    masters = d.get("masters", [])
    full_ids = [m.get("id_width", 4) for m in masters if _port_type(m, d) == "full"]
    effective = max(full_ids) if full_ids else 1
    n = len(masters)
    idx_bits = 0 if n <= 1 else math.ceil(math.log2(n))
    return effective + idx_bits


def _gen_master_port(m: dict, design: dict, global_addr_width: int) -> str:
    port_type = _port_type(m, design)
    addr_w  = m.get("addr_width",  global_addr_width)
    data_w  = m.get("data_width",  32)
    id_w    = m.get("id_width",    4)
    rs      = "true" if m.get("reg_slice", False) else "false"
    mode    = "LiteAxi4" if port_type == "lite" else "FullAxi4"

    if port_type == "lite":
        cfg = LITE_AXI4_CONFIG.format(addr_width=addr_w, data_width=data_w)
    else:
        cfg = FULL_AXI4_CONFIG.format(addr_width=addr_w, data_width=data_w, id_width=id_w)

    return textwrap.dedent(f"""\
        MasterPort(
          config   = {cfg},
          mode     = {mode},
          regSlice = {rs}
        )""")


def _gen_slave_port(s: dict, design: dict, global_addr_width: int, slave_idw: int) -> str:
    port_type = _port_type(s, design)
    addr_w  = s.get("addr_width",  global_addr_width)
    data_w  = s.get("data_width",  32)
    # For full slave ports in a mixed design the id_width is auto-computed (slave_idw),
    # but can be overridden per-port if the user explicitly sets id_width.
    id_w    = s.get("id_width", slave_idw)
    base    = _parse_int(s["base"])
    size    = _parse_int(s["size"])
    rs      = "true" if s.get("reg_slice", False) else "false"
    mode    = "LiteAxi4" if port_type == "lite" else "FullAxi4"

    if port_type == "lite":
        cfg = LITE_AXI4_CONFIG.format(addr_width=addr_w, data_width=data_w)
    else:
        cfg = FULL_AXI4_CONFIG.format(addr_width=addr_w, data_width=data_w, id_width=id_w)

    return textwrap.dedent(f"""\
        SlavePort(
          config      = {cfg},
          mode        = {mode},
          baseAddress = {_scala_bigint(base)},
          size        = {_scala_bigint(size)},
          regSlice    = {rs}
        )""")


def _gen_design_block(d: dict) -> str:
    name    = d["name"]
    arb     = _scala_arbitration(d)
    addr_w  = _default_addr_width(d)
    all_lite = _is_all_lite(d)
    slave_idw = _compute_slave_idw(d)   # only used for full slave ports

    fabric_line = ""
    if "fabric_data_width" in d:
        fabric_line = f",\n  internalDataWidth = Some({d['fabric_data_width']})"

    max_outstanding = d.get("max_outstanding", 1)
    mo_line = f",\n  maxOutstanding    = {max_outstanding}" if max_outstanding != 1 else ""

    masters_scala = ",\n    ".join(
        _gen_master_port(m, d, addr_w) for m in d["masters"]
    )
    slaves_scala = ",\n    ".join(
        _gen_slave_port(s, d, addr_w, slave_idw) for s in d["slaves"]
    )

    helper = "liteCrossbar" if all_lite else "mixedCrossbar"

    return textwrap.dedent(f"""\
        // ── {name} ──
        locally {{
          val cfg = AxiZeroConfig(
            masters = Seq(
              {masters_scala}
            ),
            slaves = Seq(
              {slaves_scala}
            ),
            arbitration = {arb}{fabric_line}{mo_line}
          )
          GenHelper.{helper}(cfg, "{name}")
        }}
    """)


def generate_scala(designs: list[dict]) -> str:
    blocks = "\n".join(_gen_design_block(d) for d in designs)
    return textwrap.dedent(f"""\
        // AUTO-GENERATED by axizero.py — do not edit by hand.
        package axizero.gen

        import spinal.core._
        import spinal.lib.bus.amba4.axi.Axi4Config
        import axizero._

        object AxiZeroUserGen extends App {{
        {textwrap.indent(blocks, "  ")}}}
    """)

# ---------------------------------------------------------------------------
# AXI port renaming (SpinalHDL io_* → Vivado-compatible naming)
# ---------------------------------------------------------------------------

# Maps (channel, signal_suffix) → AXI signal name suffix
_SPINAL_CHANNEL_SIGNAL = {
    # AW channel
    ("aw", "valid"):  "awvalid",  ("aw", "ready"):  "awready",
    ("aw", "addr"):   "awaddr",   ("aw", "id"):     "awid",
    ("aw", "region"): "awregion", ("aw", "len"):    "awlen",
    ("aw", "size"):   "awsize",   ("aw", "burst"):  "awburst",
    ("aw", "lock"):   "awlock",   ("aw", "cache"):  "awcache",
    ("aw", "qos"):    "awqos",    ("aw", "prot"):   "awprot",
    # W channel
    ("w",  "valid"):  "wvalid",   ("w",  "ready"):  "wready",
    ("w",  "data"):   "wdata",    ("w",  "strb"):   "wstrb",
    ("w",  "last"):   "wlast",
    # B channel
    ("b",  "valid"):  "bvalid",   ("b",  "ready"):  "bready",
    ("b",  "id"):     "bid",      ("b",  "resp"):   "bresp",
    # AR channel
    ("ar", "valid"):  "arvalid",  ("ar", "ready"):  "arready",
    ("ar", "addr"):   "araddr",   ("ar", "id"):     "arid",
    ("ar", "region"): "arregion", ("ar", "len"):    "arlen",
    ("ar", "size"):   "arsize",   ("ar", "burst"):  "arburst",
    ("ar", "lock"):   "arlock",   ("ar", "cache"):  "arcache",
    ("ar", "qos"):    "arqos",    ("ar", "prot"):   "arprot",
    # R channel
    ("r",  "valid"):  "rvalid",   ("r",  "ready"):  "rready",
    ("r",  "data"):   "rdata",    ("r",  "id"):     "rid",
    ("r",  "resp"):   "rresp",    ("r",  "last"):   "rlast",
}

_IO_PORT_RE = re.compile(
    r'\bio_(masters|slaves)_(\d+)_(aw|w|b|ar|r)_(?:payload_)?(\w+)\b'
)


def _rename_to_axi(verilog: str) -> str:
    """Rename SpinalHDL io_* ports to AXI-standard Vivado-compatible names.

    io_masters_N_*  → sN_axi_*   (crossbar slave interfaces — where masters connect)
    io_slaves_N_*   → mN_axi_*   (crossbar master interfaces — where slaves connect)
    clk             → aclk
    resetn          → aresetn
    """
    def _replace(m):
        side, idx, channel, signal = m.group(1), m.group(2), m.group(3), m.group(4)
        axi_sig = _SPINAL_CHANNEL_SIGNAL.get((channel, signal))
        if axi_sig is None:
            return m.group(0)  # unknown suffix — leave unchanged
        prefix = "s" if side == "masters" else "m"
        return f"{prefix}{idx}_axi_{axi_sig}"

    verilog = _IO_PORT_RE.sub(_replace, verilog)
    verilog = re.sub(r'\bclk\b',    'aclk',    verilog)
    verilog = re.sub(r'\bresetn\b', 'aresetn', verilog)
    return verilog


# ---------------------------------------------------------------------------
# Run sbt
# ---------------------------------------------------------------------------

def run_sbt(java: Path, sbt: Path, output_dir: Path | None, design_names: list[str]):
    env = os.environ.copy()
    env["JAVA_HOME"] = str(java.parent.parent)   # bin/java → parent = bin → parent = JAVA_HOME
    env["PATH"]      = str(java.parent) + os.pathsep + env.get("PATH", "")

    cmd = [str(sbt), "runMain axizero.gen.AxiZeroUserGen"]
    print(f"\n[axizero] Running: {' '.join(cmd)}")
    print(f"[axizero] Working dir: {REPO_ROOT}\n")

    result = subprocess.run(cmd, cwd=str(REPO_ROOT), env=env)

    if result.returncode != 0:
        print("\nERROR: sbt failed.  See output above for details.", file=sys.stderr)
        sys.exit(result.returncode)

    # Rename SpinalHDL io_* ports to AXI-standard names in generated files
    for name in design_names:
        v_file = SBT_OUTDIR / f"{name}.v"
        if v_file.exists():
            text = v_file.read_text(encoding="utf-8")
            renamed = _rename_to_axi(text)
            if renamed != text:
                v_file.write_text(renamed, encoding="utf-8")
                print(f"[axizero] Renamed ports -> AXI standard: {v_file.name}")

    # Copy .v files to output_dir if requested
    if output_dir:
        output_dir.mkdir(parents=True, exist_ok=True)
        for name in design_names:
            src = SBT_OUTDIR / f"{name}.v"
            if src.exists():
                dst = output_dir / f"{name}.v"
                shutil.copy2(src, dst)
                print(f"[axizero] Copied {dst}")
            else:
                print(f"[axizero] WARNING: expected output not found: {src}")

# ---------------------------------------------------------------------------
# Commands
# ---------------------------------------------------------------------------

EXAMPLE_YAML = textwrap.dedent("""\
    # axiZero interconnect configuration
    # Run with: python axizero.py generate this_file.yaml

    designs:

      # ── Example 1: simple 1-master × 4-slave AXI4-Lite crossbar ─────────────
      - name: MyLite_1M4S
        type: lite
        arbitration: round_robin

        masters:
          - addr_width: 32
            data_width: 32
            reg_slice: false

        slaves:
          - base: 0x00000000    # SRAM
            size: 0x1000
            data_width: 32
          - base: 0x00010000    # UART
            size: 0x1000
            data_width: 32
          - base: 0x00020000    # GPIO
            size: 0x1000
            data_width: 32
          - base: 0x00030000    # SPI
            size: 0x1000
            data_width: 32

      # ── Example 2: 2 masters, register slices, weighted arbitration ──────────
      - name: MyLite_2M2S_WRR
        type: lite
        arbitration: weighted_round_robin
        weights: [3, 1]         # master 0 gets 3x the grants

        masters:
          - addr_width: 32
            data_width: 32
            reg_slice: true     # register slice on this master
          - addr_width: 32
            data_width: 32
            reg_slice: false

        slaves:
          - base: 0x00000000
            size: 0x10000
            reg_slice: true     # register slice on this slave
          - base: 0x00010000
            size: 0x10000

      # ── Example 3: full AXI4 (with IDs and bursts) ───────────────────────────
      - name: MyFull_2M2S
        type: full
        arbitration: round_robin
        # max_outstanding: 1  — blocking (default): one transaction per slave at a time.
        #                       Use for single-master or low-contention designs.
        # max_outstanding: 4  — pipelined: up to 4 outstanding transactions per slave.
        #                       Uses a W-route FIFO + ID-based response routing.
        #                       Recommended when multiple masters target the same slave.
        max_outstanding: 4

        masters:
          - addr_width: 32
            data_width: 64
            id_width: 4

        slaves:
          - base: 0x00000000
            size: 0x80000000    # 2 GB
            data_width: 64
          - base: 0x80000000
            size: 0x20000000    # 512 MB
            data_width: 64

      # ── Example 4: mixed AXI4 + AXI4-Lite ports ──────────────────────────────
      #
      # A DMA engine (full AXI4, id_width=4) and a CPU config port (AXI4-Lite)
      # share three slaves: DDR (full AXI4) plus UART and GPIO (AXI4-Lite).
      #
      # The script automatically:
      #   • inserts Lite→Full adapters at Lite master ports
      #   • inserts Full→Lite adapters at Lite slave ports
      #   • computes the expanded slave ID width (effectiveIdW + masterIndexBits)
      #   • uses the resource-efficient Lite crossbar only when ALL ports are Lite
      #
      - name: MyMixed_2M3S
        arbitration: round_robin

        masters:
          - addr_width: 32
            data_width: 32
            id_width: 4
            type: full          # DMA engine — full AXI4
          - addr_width: 32
            data_width: 32
            type: lite          # CPU config port — AXI4-Lite

        slaves:
          - base: 0x00000000
            size: 0x80000000    # DDR — full AXI4
            data_width: 32
            type: full
          - base: 0x80000000
            size: 0x1000        # UART — AXI4-Lite
            data_width: 32
            type: lite
          - base: 0x80001000
            size: 0x1000        # GPIO — AXI4-Lite
            data_width: 32
            type: lite
""")


def cmd_example(args):
    print(EXAMPLE_YAML)


def cmd_generate(args):
    config_path = Path(args.config).resolve()
    if not config_path.exists():
        _err(f"Config file not found: {config_path}")

    with open(config_path) as f:
        raw = yaml.safe_load(f)

    if not isinstance(raw, dict) or "designs" not in raw:
        _err("Config file must contain a top-level 'designs' list")

    designs = raw["designs"]
    if not isinstance(designs, list) or len(designs) == 0:
        _err("'designs' must be a non-empty list")

    for i, d in enumerate(designs):
        _validate_design(d, i)

    # Resolve Java and sbt
    java = Path(args.java_home) / "bin" / "java" if args.java_home else _find_java()
    if not java or not java.exists():
        # try adding .exe
        if java and (Path(str(java) + ".exe")).exists():
            java = Path(str(java) + ".exe")
        else:
            print("ERROR: Java not found.\n" + INSTALL_HINT, file=sys.stderr)
            sys.exit(1)

    sbt = Path(args.sbt) if args.sbt else _find_sbt()
    if not sbt or not sbt.exists():
        print("ERROR: sbt not found.\n" + INSTALL_HINT, file=sys.stderr)
        sys.exit(1)

    print(f"[axizero] Java : {java}")
    print(f"[axizero] sbt  : {sbt}")
    print(f"[axizero] Designs to generate: {[d['name'] for d in designs]}")

    # Write generated Scala
    scala_src = generate_scala(designs)
    USER_SCALA.parent.mkdir(parents=True, exist_ok=True)
    USER_SCALA.write_text(scala_src, encoding="utf-8")
    print(f"[axizero] Wrote {USER_SCALA.relative_to(REPO_ROOT)}")

    # Output dir
    output_dir = Path(args.output).resolve() if args.output else None

    # Run sbt
    run_sbt(java, sbt, output_dir, [d["name"] for d in designs])

    if not output_dir:
        print(f"\n[axizero] Verilog written to: {SBT_OUTDIR}/")
    else:
        print(f"\n[axizero] Verilog written to: {output_dir}/")
    print("[axizero] Done.")

# ---------------------------------------------------------------------------
# CLI
# ---------------------------------------------------------------------------

def main():
    parser = argparse.ArgumentParser(
        prog="axizero",
        description="Generate AXI/AXI-Lite interconnect Verilog from a YAML config.",
        formatter_class=argparse.RawDescriptionHelpFormatter,
        epilog=textwrap.dedent("""\
            examples:
              python axizero.py example > myconfig.yaml
              python axizero.py generate myconfig.yaml
              python axizero.py generate myconfig.yaml --output rtl/
        """),
    )
    sub = parser.add_subparsers(dest="command", required=True)

    # generate
    p_gen = sub.add_parser("generate", help="Generate Verilog from a YAML config")
    p_gen.add_argument("config", help="Path to YAML config file")
    p_gen.add_argument("--output", "-o", metavar="DIR",
                       help="Copy generated .v files here (default: generated/)")
    p_gen.add_argument("--java-home", metavar="DIR",
                       help="Path to JDK home (auto-detected if omitted)")
    p_gen.add_argument("--sbt", metavar="PATH",
                       help="Path to sbt launcher (auto-detected if omitted)")

    # example
    p_ex = sub.add_parser("example", help="Print an example YAML config to stdout")

    args = parser.parse_args()

    if args.command == "generate":
        cmd_generate(args)
    elif args.command == "example":
        cmd_example(args)


if __name__ == "__main__":
    main()
