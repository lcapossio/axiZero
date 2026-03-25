#!/usr/bin/env python3
# Copyright (c) 2026 Leonardo Capossio — bard0 design  hello@bard0.com
# SPDX-License-Identifier: MIT
"""
install_deps.py — Install axiZero toolchain dependencies.

Installs: Java 21, sbt, Verilator 5.x (Linux/WSL only), PyYAML,
          cocotb, cocotbext-axi.

Usage:
    python scripts/install_deps.py          # install everything
    python scripts/install_deps.py --check  # check what is/isn't installed
"""

import argparse
import platform
import shutil
import subprocess
import sys
import os
import re


# ── Platform detection ────────────────────────────────────────────────────────

def _read_file(path):
    try:
        with open(path) as f:
            return f.read()
    except OSError:
        return ""


def detect_platform():
    """
    Returns one of: 'linux-apt', 'wsl-apt', 'macos', 'windows', 'unknown'.
    """
    system = platform.system()
    if system == "Darwin":
        return "macos"
    if system == "Windows":
        return "windows"
    if system == "Linux":
        proc_version = _read_file("/proc/version").lower()
        if "microsoft" in proc_version or "wsl" in proc_version:
            return "wsl-apt"
        # Check for apt
        if shutil.which("apt-get"):
            return "linux-apt"
        return "unknown"
    return "unknown"


# ── Helpers ───────────────────────────────────────────────────────────────────

def run(cmd, check=True, capture=False):
    kwargs = {"shell": True}
    if capture:
        kwargs["stdout"] = subprocess.PIPE
        kwargs["stderr"] = subprocess.PIPE
        kwargs["text"] = True
    return subprocess.run(cmd, check=check, **kwargs)


def ok(msg):     print(f"  [OK]   {msg}", flush=True)
def skip(msg):   print(f"  [--]   {msg}", flush=True)
def info(msg):   print(f"         {msg}", flush=True)
def err(msg):    print(f"  [FAIL] {msg}", flush=True)
def header(msg): print(f"\n{msg}\n{'-' * len(msg)}", flush=True)


# ── Version checks ────────────────────────────────────────────────────────────

def java_version():
    """Returns (major, version_string) or (0, '') if not found."""
    if not shutil.which("java"):
        return 0, ""
    r = run("java -version 2>&1", capture=True, check=False)
    text = r.stdout + r.stderr
    m = re.search(r'version "(?:1\.)?(\d+)', text)
    if m:
        return int(m.group(1)), text.split("\n")[0].strip()
    return 0, ""


def sbt_present():
    return shutil.which("sbt") is not None


def verilator_version():
    """Returns (major, version_string) or (0, '') if not found."""
    if not shutil.which("verilator"):
        return 0, ""
    r = run("verilator --version 2>&1", capture=True, check=False)
    text = r.stdout.strip()
    m = re.search(r"Verilator (\d+)\.", text)
    if m:
        return int(m.group(1)), text
    return 0, ""


def python_pkg_present(pkg):
    r = run(f'python3 -m pip show {pkg} 2>&1', capture=True, check=False)
    return r.returncode == 0


# ── Status check ──────────────────────────────────────────────────────────────

def check_all():
    header("Checking dependencies")

    java_maj, java_str = java_version()
    if java_maj >= 21:
        ok(f"Java {java_maj}  ({java_str})")
    elif java_maj > 0:
        err(f"Java {java_maj} found but >= 21 required  ({java_str})")
    else:
        err("Java not found")

    if sbt_present():
        ok("sbt")
    else:
        err("sbt not found")

    plat = detect_platform()
    if plat in ("linux-apt", "wsl-apt"):
        ver_maj, ver_str = verilator_version()
        if ver_maj >= 5:
            ok(f"Verilator {ver_maj}  ({ver_str})")
        elif ver_maj > 0:
            err(f"Verilator {ver_maj} found but ≥ 5 required  ({ver_str})")
        else:
            err("Verilator not found")
    else:
        skip("Verilator (not required on this platform)")

    for pkg in ("pyyaml", "cocotb", "cocotbext-axi"):
        pip_name = pkg
        import_name = pkg.replace("-", "_")
        if python_pkg_present(pip_name):
            ok(f"Python: {pkg}")
        else:
            err(f"Python: {pkg} not installed")


# ── Installers ────────────────────────────────────────────────────────────────

def install_linux_apt(check_only):
    header("Installing for Linux / WSL (apt)")

    # ── Java 21 ───────────────────────────────────────────────────────────────
    java_maj, java_str = java_version()
    if java_maj >= 21:
        skip(f"Java {java_maj} already installed ({java_str})")
    else:
        info("Installing OpenJDK 21...")
        try:
            run("sudo apt-get update -qq && sudo apt-get install -y openjdk-21-jdk")
            ok("Java 21 installed")
        except subprocess.CalledProcessError:
            err("Failed to install Java 21 via apt.")
            info("Try: sudo apt-get install -y openjdk-21-jdk")
            info("Or install Temurin from https://adoptium.net/")

    # ── sbt ───────────────────────────────────────────────────────────────────
    if sbt_present():
        skip("sbt already installed")
    else:
        info("Adding sbt apt repository and installing...")
        try:
            run(
                "echo 'deb https://repo.scala-sbt.org/scalasbt/debian all main'"
                " | sudo tee /etc/apt/sources.list.d/sbt.list && "
                "curl -sL 'https://keyserver.ubuntu.com/pks/lookup"
                "?op=get&search=0x2EE0EA64E40A89B84B2DF73499E82A75642AC823'"
                " | sudo apt-key add - && "
                "sudo apt-get update -qq && sudo apt-get install -y sbt"
            )
            ok("sbt installed")
        except subprocess.CalledProcessError:
            err("Failed to install sbt.")
            info("See https://www.scala-sbt.org/download/")

    # ── Verilator ─────────────────────────────────────────────────────────────
    ver_maj, ver_str = verilator_version()
    if ver_maj >= 5:
        skip(f"Verilator {ver_maj} already installed ({ver_str})")
    else:
        info("Installing Verilator (apt)...")
        try:
            run("sudo apt-get install -y --no-install-recommends verilator")
            ver_maj2, ver_str2 = verilator_version()
            if ver_maj2 >= 5:
                ok(f"Verilator {ver_maj2} installed")
            else:
                err(f"Verilator {ver_maj2 or '?'} installed but ≥ 5 expected. "
                    "Ubuntu 22.04 ships 4.x — upgrade to Ubuntu 24.04 or build from source.")
        except subprocess.CalledProcessError:
            err("Failed to install Verilator.")

    install_python_deps()


def install_macos(check_only):
    header("Installing for macOS (Homebrew)")

    if not shutil.which("brew"):
        err("Homebrew not found. Install it first:")
        info('/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"')
        sys.exit(1)

    java_maj, java_str = java_version()
    if java_maj >= 21:
        skip(f"Java {java_maj} already installed ({java_str})")
    else:
        info("Installing Temurin 21 via Homebrew...")
        try:
            run("brew install --cask temurin@21")
            ok("Java 21 installed")
        except subprocess.CalledProcessError:
            err("Failed to install Java. Try: brew install --cask temurin@21")

    if sbt_present():
        skip("sbt already installed")
    else:
        info("Installing sbt via Homebrew...")
        try:
            run("brew install sbt")
            ok("sbt installed")
        except subprocess.CalledProcessError:
            err("Failed to install sbt.")

    skip("Verilator (cocotb simulation not supported on macOS; use Linux/WSL)")

    install_python_deps()


def install_windows(check_only):
    header("Installing for Windows")

    info("Checking for winget...")
    has_winget = shutil.which("winget") is not None

    java_maj, java_str = java_version()
    if java_maj >= 21:
        skip(f"Java {java_maj} already installed ({java_str})")
    elif has_winget:
        info("Installing Eclipse Temurin 21 via winget...")
        try:
            run("winget install --id EclipseAdoptium.Temurin.21.JDK -e --silent")
            ok("Java 21 installed (restart shell to update PATH)")
        except subprocess.CalledProcessError:
            err("winget install failed.")
            info("Manual: https://adoptium.net/")
    else:
        err("Java not found and winget unavailable.")
        info("Install Java 21 manually: https://adoptium.net/")

    if sbt_present():
        skip("sbt already installed")
    elif has_winget:
        info("Installing sbt via winget...")
        try:
            run("winget install --id Lightbend.sbt -e --silent")
            ok("sbt installed (restart shell to update PATH)")
        except subprocess.CalledProcessError:
            err("winget install failed.")
            info("Manual: https://www.scala-sbt.org/download/")
    else:
        err("sbt not found and winget unavailable.")
        info("Install sbt manually: https://www.scala-sbt.org/download/")

    info("")
    info("Note: Verilator and cocotb simulation require Linux or WSL.")
    info("To run sim tests, use WSL Ubuntu 24.04:")
    info("  wsl --install -d Ubuntu-24.04")
    info("  then re-run this script from inside WSL.")

    install_python_deps()


def install_python_deps():
    header("Installing Python dependencies")
    pkgs = ["pyyaml", "cocotb", "cocotbext-axi"]
    missing = [p for p in pkgs if not python_pkg_present(p)]
    if not missing:
        skip("All Python packages already installed")
        return
    info(f"pip install {' '.join(missing)}")
    try:
        run(f"{sys.executable} -m pip install {' '.join(missing)}")
        ok("Python packages installed")
    except subprocess.CalledProcessError:
        err("pip install failed. Try running with --user or inside a venv.")


# ── Main ──────────────────────────────────────────────────────────────────────

def main():
    parser = argparse.ArgumentParser(
        description="Install axiZero toolchain dependencies."
    )
    parser.add_argument(
        "--check", action="store_true",
        help="Only check what is/isn't installed; do not install anything."
    )
    args = parser.parse_args()

    plat = detect_platform()
    print(f"Platform: {plat}")

    if args.check:
        check_all()
        return

    if plat in ("linux-apt", "wsl-apt"):
        install_linux_apt(args.check)
    elif plat == "macos":
        install_macos(args.check)
    elif plat == "windows":
        install_windows(args.check)
    else:
        err("Unrecognised platform. Supported: Ubuntu/Debian Linux, WSL, macOS, Windows.")
        info("Install manually:")
        info("  Java 21:   https://adoptium.net/")
        info("  sbt:       https://www.scala-sbt.org/download/")
        info("  Verilator: https://verilator.org/guide/latest/install.html")
        info("  Python:    pip install pyyaml cocotb cocotbext-axi")
        sys.exit(1)

    header("Done")
    check_all()


if __name__ == "__main__":
    main()
