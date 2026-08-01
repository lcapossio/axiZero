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

import os
import pathlib
import re
import subprocess
import sys
import platform
import shutil
import shlex

REPO_ROOT = pathlib.Path(__file__).resolve().parent.parent

# sbt -Dcoverage=true must be passed at JVM startup (not as a session command)
# so the scalac instrumentation plugin is evaluated at load time.
_SBT_COVERAGE_FLAG = "-Dcoverage=true"
_COVERAGE_CMD = "clean; coverageTest"

# Wall-clock ceiling for any single sbt invocation, in seconds. Generous enough
# for a cold coverage run (dependency resolution + full Verilator rebuild).
_SBT_TIMEOUT_DEFAULT = 3600

# Mapping of friendly names to sbt commands
_CMDS = {
    "test":     "test",
    "compile":  "compile",
    "coverage": _COVERAGE_CMD,
    "axis":     "testOnly axizero.sim.AxiStreamCoreSpec",
}


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

    # A forked test JVM that dies (e.g. a native segfault in the Verilator
    # backend) leaves sbt blocked forever in ScalaTestRunner.done(), waiting on
    # a socket the dead JVM will never open. Without a deadline that hang is
    # indistinguishable from a slow run. Override with AXIZERO_SBT_TIMEOUT.
    timeout_s = int(os.environ.get("AXIZERO_SBT_TIMEOUT", _SBT_TIMEOUT_DEFAULT))
    try:
        return subprocess.run(cmd, cwd=REPO_ROOT, timeout=timeout_s)
    except subprocess.TimeoutExpired:
        print(
            f"\nERROR: sbt exceeded {timeout_s}s and was killed.\n"
            "  A forked test JVM most likely crashed; check for hs_err_pid*.log\n"
            "  in the repo root. Raise the limit with AXIZERO_SBT_TIMEOUT=<seconds>.",
            file=sys.stderr,
        )
        return subprocess.CompletedProcess(cmd, returncode=124)


def _run_python_lint() -> int:
    """Run the Python lint/syntax checks used by focused regressions."""
    ruff = shutil.which("ruff")
    if not ruff:
        print("ERROR: ruff not found on PATH. Install it with: pip install ruff")
        return 1

    files = ["scripts/axizero.py", "scripts/run_sim.py"]
    # Lint every tracked Python tree, not just the two entry points: the Arty
    # runners under hw/ went unlinted for a long time and accumulated findings.
    lint_targets = ["scripts", "sim", "hw"]
    rc = subprocess.run([ruff, "check", *lint_targets], cwd=REPO_ROOT).returncode
    if rc != 0:
        return rc

    return subprocess.run(
        [sys.executable, "-m", "py_compile", *files],
        cwd=REPO_ROOT,
    ).returncode


def _run_axis_cocotb_regression() -> int:
    """Run the canonical Python cocotb runner for generated AXI Stream Verilog."""
    if platform.system() == "Windows":
        if not shutil.which("wsl"):
            print("ERROR: wsl not found. Install WSL Ubuntu-24.04:")
            print("  wsl --install -d Ubuntu-24.04")
            return 1
        wsl_repo = _wsl_path(REPO_ROOT)
        inner = f"cd {shlex.quote(wsl_repo)} && python3 sim/cocotb_gen/run_all.py axis"
        return subprocess.run(["wsl", "bash", "-lc", inner], cwd=REPO_ROOT).returncode

    return subprocess.run(
        [sys.executable, "sim/cocotb_gen/run_all.py", "axis"],
        cwd=REPO_ROOT,
    ).returncode


def _run_axis_regression() -> int:
    print("[run_sim] AXI Stream regression: lint")
    rc = _run_python_lint()
    if rc != 0:
        return rc

    print("[run_sim] AXI Stream regression: SpinalSim")
    rc = _run([_CMDS["axis"]]).returncode
    if rc != 0:
        return rc

    print("[run_sim] AXI Stream regression: cocotbext-axi generated RTL")
    return _run_axis_cocotb_regression()


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
