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
"""

import pathlib
import re
import subprocess
import sys
import platform
import shutil

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

    return subprocess.run(cmd, cwd=REPO_ROOT)


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
