#!/usr/bin/env python3
# Copyright (c) 2026 Leonardo Capossio
# SPDX-License-Identifier: MIT
"""
run_sim.py — Run SpinalSim tests (sbt) from any platform.

On Linux/macOS : runs sbt directly.
On Windows     : runs sbt inside WSL.

Usage:
    python scripts/run_sim.py              # sbt test
    python scripts/run_sim.py compile      # sbt compile only
    python scripts/run_sim.py coverage     # tests + scoverage HTML report
    python scripts/run_sim.py axis         # AXI Stream focused regression
"""

import pathlib
import re
import subprocess
import sys
import platform
import shutil
import shlex
import textwrap

REPO_ROOT = pathlib.Path(__file__).resolve().parent.parent

# sbt -Dcoverage=true must be passed at JVM startup (not as a session command)
# so the scalac instrumentation plugin is evaluated at load time.
_SBT_COVERAGE_FLAG = "-Dcoverage=true"
_COVERAGE_CMD = "clean; coverageTest"

# Mapping of friendly names to sbt commands
_CMDS = {
    "test":     "test",
    "compile":  "compile",
    "coverage": _COVERAGE_CMD,
    "axis":     "testOnly axizero.sim.AxiStreamCoreSpec",
}

_AXIS_SMOKE_YAML = textwrap.dedent("""\
    designs:
      - name: SmokeAxisRegSlice
        kind: axis
        core: reg_slice
        data_width: 32
        use_keep: true
        use_last: true

      - name: SmokeAxisWidth_8To32
        kind: axis
        core: width_adapter
        input_data_width: 8
        output_data_width: 32
        use_keep: true
        use_last: true

      - name: SmokeAxisFifo
        kind: axis
        core: fifo
        data_width: 32
        depth: 8
        use_keep: true
        use_last: true

      - name: SmokeAxisMux_2To1
        kind: axis
        core: arb_mux
        data_width: 32
        inputs: 2
        arbitration: round_robin
        use_keep: true
        use_last: true

      - name: SmokeAxisDemux_1To2
        kind: axis
        core: demux
        data_width: 32
        outputs: 2
        use_keep: true
        use_last: true

      - name: SmokeAxisBroadcaster_1To2
        kind: axis
        core: broadcaster
        data_width: 32
        outputs: 2
        use_keep: true
        use_last: true
""")

_AXIS_SMOKE_NAMES = (
    "SmokeAxisRegSlice",
    "SmokeAxisWidth_8To32",
    "SmokeAxisFifo",
    "SmokeAxisMux_2To1",
    "SmokeAxisDemux_1To2",
    "SmokeAxisBroadcaster_1To2",
)


def _wsl_path(p: pathlib.Path) -> str:
    return "/mnt/" + p.drive.lower().rstrip(":") + p.as_posix()[2:]


def _run(sbt_args: list[str]) -> "subprocess.CompletedProcess[bytes]":
    """Run sbt with the given argument list, streaming output."""
    if platform.system() == "Windows":
        if not shutil.which("wsl"):
            print("ERROR: wsl not found. Install WSL Ubuntu-24.04:")
            print("  wsl --install -d Ubuntu-24.04")
            sys.exit(1)
        wsl_dir = _wsl_path(REPO_ROOT)
        # Build: wsl bash -lc "cd '<dir>' && sbt <args>"
        inner = f"cd {wsl_dir!r} && sbt " + " ".join(f"{a!r}" for a in sbt_args)
        cmd = ["wsl", "bash", "-lc", inner]
    else:
        if not shutil.which("sbt"):
            print("ERROR: sbt not found on PATH. Run: python scripts/install_deps.py")
            sys.exit(1)
        cmd = ["sbt"] + sbt_args

    return subprocess.run(cmd, cwd=REPO_ROOT)


def _run_python_lint() -> int:
    """Run the Python lint/syntax checks used by focused regressions."""
    ruff = shutil.which("ruff")
    if not ruff:
        print("ERROR: ruff not found on PATH. Install it with: pip install ruff")
        return 1

    files = ["scripts/axizero.py", "scripts/run_sim.py"]
    rc = subprocess.run([ruff, "check", *files], cwd=REPO_ROOT).returncode
    if rc != 0:
        return rc

    return subprocess.run(
        [sys.executable, "-m", "py_compile", *files],
        cwd=REPO_ROOT,
    ).returncode


def _run_axis_generator_smoke() -> int:
    """Generate every AXI Stream core from YAML and sanity-check AXIS port names."""
    smoke_dir = REPO_ROOT / "tmp" / "axis_regression"
    rtl_dir = smoke_dir / "rtl"
    yaml_path = smoke_dir / "axis_smoke.yaml"
    smoke_dir.mkdir(parents=True, exist_ok=True)
    rtl_dir.mkdir(parents=True, exist_ok=True)
    for name in _AXIS_SMOKE_NAMES:
        stale = rtl_dir / f"{name}.v"
        if stale.exists():
            stale.unlink()
    yaml_path.write_text(_AXIS_SMOKE_YAML, encoding="utf-8")

    if platform.system() == "Windows":
        if not shutil.which("wsl"):
            print("ERROR: wsl not found. Install WSL Ubuntu-24.04:")
            print("  wsl --install -d Ubuntu-24.04")
            return 1
        wsl_dir = _wsl_path(REPO_ROOT)
        inner = (
            f"cd {shlex.quote(wsl_dir)} && "
            "python3 scripts/axizero.py generate "
            f"{shlex.quote('tmp/axis_regression/axis_smoke.yaml')} "
            f"--output {shlex.quote('tmp/axis_regression/rtl')}"
        )
        cmd = ["wsl", "bash", "-lc", inner]
    else:
        cmd = [
            sys.executable,
            "scripts/axizero.py",
            "generate",
            str(yaml_path),
            "--output",
            str(rtl_dir),
        ]

    rc = subprocess.run(cmd, cwd=REPO_ROOT).returncode
    if rc != 0:
        return rc

    try:
        _check_axis_smoke_outputs(rtl_dir)
    finally:
        for name in _AXIS_SMOKE_NAMES:
            generated = REPO_ROOT / "generated" / f"{name}.v"
            if generated.exists():
                generated.unlink()

    return 0


def _require_patterns(text: str, patterns: list[str], path: pathlib.Path) -> None:
    for pattern in patterns:
        if not re.search(pattern, text):
            raise RuntimeError(f"{path}: missing expected pattern {pattern!r}")


def _check_axis_smoke_outputs(rtl_dir: pathlib.Path) -> None:
    checks = {
        "SmokeAxisRegSlice": [
            r"\bs_axis_tvalid\b",
            r"\bm_axis_tvalid\b",
            r"\[31:0\]\s+s_axis_tdata\b",
            r"\[31:0\]\s+m_axis_tdata\b",
        ],
        "SmokeAxisWidth_8To32": [
            r"\[7:0\]\s+s_axis_tdata\b",
            r"\[31:0\]\s+m_axis_tdata\b",
        ],
        "SmokeAxisFifo": [
            r"\bs_axis_tvalid\b",
            r"\bm_axis_tvalid\b",
            r"\[31:0\]\s+s_axis_tdata\b",
            r"\[31:0\]\s+m_axis_tdata\b",
        ],
        "SmokeAxisMux_2To1": [
            r"\bs0_axis_tvalid\b",
            r"\bs1_axis_tvalid\b",
            r"\bm_axis_tvalid\b",
        ],
        "SmokeAxisDemux_1To2": [
            r"\bs_axis_tvalid\b",
            r"\bselect\b",
            r"\bm0_axis_tvalid\b",
            r"\bm1_axis_tvalid\b",
        ],
        "SmokeAxisBroadcaster_1To2": [
            r"\bs_axis_tvalid\b",
            r"\bm0_axis_tvalid\b",
            r"\bm1_axis_tvalid\b",
        ],
    }

    for name, patterns in checks.items():
        path = rtl_dir / f"{name}.v"
        if not path.exists():
            raise RuntimeError(f"Expected generated Verilog not found: {path}")
        _require_patterns(path.read_text(encoding="utf-8"), patterns, path)

    print("[run_sim] AXI Stream generator smoke passed")


def _run_axis_regression() -> int:
    print("[run_sim] AXI Stream regression: lint")
    rc = _run_python_lint()
    if rc != 0:
        return rc

    print("[run_sim] AXI Stream regression: SpinalSim")
    rc = _run([_CMDS["axis"]]).returncode
    if rc != 0:
        return rc

    print("[run_sim] AXI Stream regression: YAML generator smoke")
    return _run_axis_generator_smoke()


def _print_coverage_summary(log_lines: list[str]) -> None:
    """Extract and pretty-print the scoverage summary from captured sbt output."""
    stmt = branch = html = None
    for line in log_lines:
        m = re.search(r"Statement coverage\.\s*:\s*([\d.]+%)", line)
        if m:
            stmt = m.group(1)
        m = re.search(r"Branch coverage[. ]+:\s*([\d.]+%)", line)
        if m:
            branch = m.group(1)
        m = re.search(r"Written HTML coverage report \[(.+)\]", line)
        if m:
            html = m.group(1)
    if stmt or branch:
        print("\n=== Coverage Summary ===")
        if stmt:
            print(f"  Statement : {stmt}")
        if branch:
            print(f"  Branch    : {branch}")
        if html:
            print(f"  HTML      : {html}")


def main() -> None:
    mode = sys.argv[1] if len(sys.argv) > 1 else "test"
    if mode not in _CMDS:
        print(f"ERROR: unknown command {mode!r}. Choose: {', '.join(_CMDS)}")
        sys.exit(1)

    sbt_cmd = _CMDS[mode]

    if mode == "axis":
        sys.exit(_run_axis_regression())

    if mode == "coverage":
        # Stream output while also capturing it for the summary
        if platform.system() == "Windows":
            wsl_dir = _wsl_path(REPO_ROOT)
            inner = f"cd {wsl_dir!r} && sbt {_SBT_COVERAGE_FLAG!r} {sbt_cmd!r}"
            cmd = ["wsl", "bash", "-lc", inner]
        else:
            if not shutil.which("sbt"):
                print("ERROR: sbt not found on PATH.")
                sys.exit(1)
            cmd = ["sbt", _SBT_COVERAGE_FLAG, sbt_cmd]

        proc = subprocess.Popen(
            cmd, cwd=REPO_ROOT,
            stdout=subprocess.PIPE, stderr=subprocess.STDOUT, text=True,
        )
        captured: list[str] = []
        for line in proc.stdout:
            sys.stdout.write(line)
            captured.append(line)
        proc.wait()
        _print_coverage_summary(captured)
        sys.exit(proc.returncode)
    else:
        result = _run([sbt_cmd])
        sys.exit(result.returncode)


if __name__ == "__main__":
    main()
