#!/usr/bin/env python3
# Copyright (c) 2026 Leonardo Capossio — bard0 design  hello@bard0.com
# SPDX-License-Identifier: MIT
"""
run_sim.py — Run SpinalSim tests (sbt test) from any platform.

On Linux/macOS/WSL: runs sbt directly (sbt must be on PATH).
On Windows:         runs sbt inside WSL (wsl sbt test).

Usage:
    python scripts/run_sim.py            # sbt test
    python scripts/run_sim.py compile    # sbt compile only
"""

import pathlib
import subprocess
import sys
import platform
import shutil


REPO_ROOT = pathlib.Path(__file__).resolve().parent.parent


def run_in_wsl(sbt_cmd):
    """Run an sbt command via WSL on Windows."""
    if not shutil.which("wsl"):
        print("ERROR: wsl not found. Install WSL Ubuntu 24.04:")
        print("  wsl --install -d Ubuntu-24.04")
        print("Then run: python scripts/install_deps.py")
        sys.exit(1)
    wsl_path = "/mnt/" + REPO_ROOT.drive.lower().rstrip(":") + REPO_ROOT.as_posix()[2:]
    cmd = ["wsl", "bash", "-lc", f"cd {wsl_path!r} && sbt {sbt_cmd!r}"]
    return subprocess.run(cmd)


def run_native(sbt_cmd):
    """Run sbt directly on Linux/macOS."""
    if not shutil.which("sbt"):
        print("ERROR: sbt not found on PATH. Run: python scripts/install_deps.py")
        sys.exit(1)
    return subprocess.run(["sbt", sbt_cmd], cwd=REPO_ROOT)


def main():
    sbt_cmd = sys.argv[1] if len(sys.argv) > 1 else "test"
    if platform.system() == "Windows":
        result = run_in_wsl(sbt_cmd)
    else:
        result = run_native(sbt_cmd)
    sys.exit(result.returncode)


if __name__ == "__main__":
    main()
