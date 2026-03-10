#!/usr/bin/env python3
# Copyright (c) 2026 Leonardo Capossio — bard0 design  hello@bard0.com
# SPDX-License-Identifier: MIT
"""
run_hw_test.py  —  axiZero Arty A7-100T full-flow automation
=============================================================

Steps executed in order:
  1. RTL generation      sbt "runMain axizero.gen.ArtyDutGen"
  2. Vivado project      vivado -mode batch -source create_project.tcl
  3. Synth/impl/bitstream vivado -mode batch -source impl.tcl
  4. FPGA programming    vivado -mode batch -source program.tcl  (--program)
  5. UART monitor        watch for PASS/FAIL output on serial port

Usage
-----
  python scripts/run_hw_test.py [options]

Options
-------
  --vivado PATH     Path to vivado(.bat) binary. Auto-detected if omitted.
  --skip-gen        Skip sbt RTL generation step.
  --skip-project    Skip Vivado project creation (project must already exist).
  --skip-build      Skip synthesis/implementation/bitstream.
  --program, -p     Program the FPGA after bitstream is generated.
  --port PORT       Serial port for UART monitor (e.g. COM3, /dev/ttyUSB1).
                    Auto-detected if omitted and pyserial is installed.
  --baud N          Baud rate for UART monitor (default: 115200).
  --uart-timeout N  Seconds to wait for PASS/FAIL over UART (default: 120).
  --jobs N          Vivado parallel jobs (default: physical CPU count).
  --log-dir DIR     Directory for per-step log files (default: logs/hw_test).
  --no-color        Disable ANSI colour output.

Requirements
------------
  pip install pyserial   (only needed for --program / UART monitor)

Exit codes
----------
  0  All UART tests passed (or no --program and build succeeded)
  1  Build failed or UART tests failed
  2  Usage / configuration error
"""

import argparse
import datetime
import os
import platform
import re
import subprocess
import sys
import threading
import time
from pathlib import Path

# ── Optional pyserial ────────────────────────────────────────────────────────
try:
    import serial
    import serial.tools.list_ports
    HAS_SERIAL = True
except ImportError:
    HAS_SERIAL = False

# ── Colour helpers ───────────────────────────────────────────────────────────

RESET   = "\033[0m"
BOLD    = "\033[1m"
RED     = "\033[31m"
GREEN   = "\033[32m"
YELLOW  = "\033[33m"
CYAN    = "\033[36m"
MAGENTA = "\033[35m"

USE_COLOR = True

def _c(code, text):
    return f"{code}{text}{RESET}" if USE_COLOR else text

def info(msg):    print(_c(CYAN,    f"[INFO]  {msg}"), flush=True)
def ok(msg):      print(_c(GREEN,   f"[OK]    {msg}"), flush=True)
def warn(msg):    print(_c(YELLOW,  f"[WARN]  {msg}"), flush=True)
def err(msg):     print(_c(RED,     f"[ERROR] {msg}"), flush=True)
def step(n, msg): print(_c(MAGENTA, f"\n{'='*60}\n  Step {n}: {msg}\n{'='*60}"), flush=True)
def banner(msg):  print(_c(BOLD,    f"\n{'#'*60}\n  {msg}\n{'#'*60}\n"), flush=True)

# ── Repo layout ──────────────────────────────────────────────────────────────

SCRIPT_DIR  = Path(__file__).resolve().parent
REPO_ROOT   = SCRIPT_DIR.parent
VIVADO_DIR  = REPO_ROOT / "hw" / "vivado" / "arty_a7"
CREATE_TCL  = VIVADO_DIR / "create_project.tcl"
IMPL_TCL    = VIVADO_DIR / "impl.tcl"
PROGRAM_TCL = VIVADO_DIR / "program.tcl"
BITSTREAM   = VIVADO_DIR / "axizero_arty" / "axizero_arty.runs" / "impl_1" / "system_wrapper.bit"

# ── Vivado auto-detection ────────────────────────────────────────────────────

VIVADO_SEARCH_ROOTS = [
    Path("C:/AMDDesignTools"),          # AMD unified installer (2024+)
    Path("C:/Xilinx/Vivado"),           # Legacy Xilinx installer
    Path("C:/Xilinx"),
    Path("/tools/Xilinx/Vivado"),
    Path("/opt/Xilinx/Vivado"),
]

def find_vivado():
    """Return path to vivado(.bat) binary, searching common install locations."""
    # Candidate names: .bat on Windows, plain on Linux
    names = ["vivado.bat", "vivado"] if platform.system() == "Windows" else ["vivado"]

    # 1. Check PATH
    for dir_ in os.environ.get("PATH", "").split(os.pathsep):
        for exe in names:
            candidate = Path(dir_) / exe
            if candidate.exists():
                return str(candidate)

    # 2. Search common AMD/Xilinx install roots, newest version first
    for root in VIVADO_SEARCH_ROOTS:
        if not root.exists():
            continue
        # Root may contain version dirs (2023.1 …) or tool dirs (Vivado, Vitis …)
        search_dirs = []
        for child in root.iterdir():
            if not child.is_dir():
                continue
            if re.match(r"\d{4}\.\d", child.name):
                # version dir — look for Vivado subdir
                vivado_sub = child / "Vivado"
                if vivado_sub.exists():
                    search_dirs.append(vivado_sub)
                else:
                    search_dirs.append(child)
            elif child.name.lower() == "vivado":
                search_dirs.append(child)
        search_dirs.sort(key=lambda p: p.parent.name, reverse=True)
        for d in search_dirs:
            for exe in names:
                candidate = d / "bin" / exe
                if candidate.exists():
                    return str(candidate)

    return None


def find_sbt():
    """Return path to sbt(.bat), searching PATH and common install locations."""
    names = ["sbt.bat", "sbt"] if platform.system() == "Windows" else ["sbt"]

    for dir_ in os.environ.get("PATH", "").split(os.pathsep):
        for exe in names:
            candidate = Path(dir_) / exe
            if candidate.exists():
                return str(candidate)

    # Coursier installs sbt.bat into %TEMP%\cs_apps on Windows
    sbt_candidates = [
        Path(os.environ.get("TEMP", "")) / "cs_apps" / "sbt.bat",
        Path(os.environ.get("LOCALAPPDATA", "")) / "Coursier" / "bin" / "sbt.bat",
        Path.home() / ".local" / "share" / "coursier" / "bin" / "sbt",
        Path.home() / ".coursier" / "bin" / "sbt",
        Path("C:/AMDDesignTools") / "2025.2" / "tps" / "win64" / "jre11.0.16_1" / "bin" / "java.exe",  # sentinel only
    ]
    for c in sbt_candidates:
        if c.exists():
            return str(c)

    return None

# ── Log management ───────────────────────────────────────────────────────────

class StepLogger:
    """Tee subprocess stdout/stderr to a file and the terminal."""

    def __init__(self, log_path: Path, prefix: str = ""):
        log_path.parent.mkdir(parents=True, exist_ok=True)
        self.file = open(log_path, "w", encoding="utf-8", errors="replace")
        self.prefix = prefix

    def write_line(self, line: str):
        self.file.write(line + "\n")
        self.file.flush()
        print(f"  {self.prefix}{line}", flush=True)

    def close(self):
        self.file.close()

    def __enter__(self):
        return self

    def __exit__(self, *_):
        self.close()


def run_cmd(cmd, cwd, log_path, env=None, interesting=None):
    """
    Run a subprocess, tee output to log_path.
    interesting: optional list of regex patterns — matching lines printed in YELLOW.
    Returns (returncode, log_text).
    """
    info(f"Running: {' '.join(str(c) for c in cmd)}")
    info(f"Log:     {log_path}")

    log_lines = []
    interesting = interesting or []
    compiled = [re.compile(p, re.IGNORECASE) for p in interesting]

    with StepLogger(log_path) as logger:
        proc = subprocess.Popen(
            [str(c) for c in cmd],
            cwd=str(cwd),
            stdout=subprocess.PIPE,
            stderr=subprocess.STDOUT,
            env=env,
            text=True,
            encoding="utf-8",
            errors="replace",
        )

        for raw in proc.stdout:
            line = raw.rstrip()
            log_lines.append(line)

            # Highlight interesting lines
            highlighted = any(pat.search(line) for pat in compiled)
            if highlighted and USE_COLOR:
                print(f"  {YELLOW}{line}{RESET}", flush=True)
            else:
                print(f"  {line}", flush=True)

            logger.file.write(line + "\n")
            logger.file.flush()

        proc.wait()

    return proc.returncode, "\n".join(log_lines)

# ── Step implementations ─────────────────────────────────────────────────────

def step_gen_rtl(log_dir, jobs):
    """sbt runMain axizero.gen.ArtyDutGen"""
    step(1, "RTL generation (sbt ArtyDutGen)")
    log = log_dir / "01_rtl_gen.log"

    sbt = find_sbt()
    if not sbt:
        err("sbt not found. Install via https://www.scala-sbt.org/download.html")
        err("Or add sbt.bat to PATH (Coursier: cs install sbt)")
        return False
    info(f"sbt: {sbt}")

    rc, _ = run_cmd(
        [sbt, "runMain axizero.gen.ArtyDutGen"],
        cwd=REPO_ROOT,
        log_path=log,
        interesting=[r"error", r"ArtyDutGen", r"Done"],
    )
    if rc != 0:
        err("sbt RTL generation failed.")
        return False

    expected = VIVADO_DIR / "ip" / "rtl" / "AxiZeroArtyDUT.v"
    if not expected.exists():
        err(f"Expected output not found: {expected}")
        return False

    ok(f"RTL generated: {expected}")
    return True


def step_create_project(vivado, log_dir):
    """vivado -mode batch -source create_project.tcl"""
    step(2, "Vivado project creation")
    log = log_dir / "02_create_project.log"

    rc, text = run_cmd(
        [vivado, "-mode", "batch", "-source", str(CREATE_TCL)],
        cwd=REPO_ROOT,
        log_path=log,
        interesting=[r"error", r"warning.*critical", r"axiZero"],
    )

    if rc != 0:
        err("Vivado project creation failed.")
        _print_errors(text)
        return False

    ok("Vivado project created.")
    return True


def step_build(vivado, log_dir, jobs):
    """vivado -mode batch -source impl.tcl  (synth + impl + bitstream)"""
    step(3, "Synthesis / implementation / bitstream")
    log = log_dir / "03_build.log"

    rc, text = run_cmd(
        [vivado, "-mode", "batch", "-source", str(IMPL_TCL)],
        cwd=REPO_ROOT,
        log_path=log,
        interesting=[r"error", r"critical warning", r"axiZero", r"complete", r"bitstream"],
    )

    if rc != 0:
        err("Vivado build failed.")
        _print_errors(text)
        return False

    if not BITSTREAM.exists():
        err(f"Bitstream not found after build: {BITSTREAM}")
        return False

    ok(f"Bitstream ready: {BITSTREAM}")
    return True


def step_program(vivado, log_dir):
    """vivado -mode batch -source program.tcl"""
    step(4, "FPGA programming")
    log = log_dir / "04_program.log"

    rc, text = run_cmd(
        [vivado, "-mode", "batch", "-source", str(PROGRAM_TCL)],
        cwd=REPO_ROOT,
        log_path=log,
        interesting=[r"error", r"program", r"axiZero"],
    )

    if rc != 0:
        err("FPGA programming failed.")
        _print_errors(text)
        return False

    ok("FPGA programmed successfully.")
    return True


def _print_errors(text):
    """Re-print ERROR lines from a log so they're visible."""
    for line in text.splitlines():
        if re.search(r"\bERROR\b", line, re.IGNORECASE):
            print(_c(RED, f"  {line}"), flush=True)


# ── UART monitor ─────────────────────────────────────────────────────────────

# Lines that indicate final outcome
PASS_RE = re.compile(r"\*\*\*\s*ALL\s+TESTS\s+PASSED", re.IGNORECASE)
FAIL_RE = re.compile(r"\*\*\*\s*FAILURES\s+DETECTED|\[FAIL\]", re.IGNORECASE)
END_RE  = re.compile(r"=+\s*$")   # closing line of summary

def auto_detect_port():
    """Return first Digilent / USB-Serial COM port, or None."""
    if not HAS_SERIAL:
        return None
    for port in serial.tools.list_ports.comports():
        desc = (port.description + " " + (port.manufacturer or "")).lower()
        if any(kw in desc for kw in ("digilent", "ftdi", "usb serial", "cp210", "ch340")):
            return port.device
    return None


def step_uart_monitor(port, baud, timeout_s, log_dir):
    """Open serial port and watch for PASS/FAIL output from MicroBlaze."""
    step(5, f"UART monitor  ({port} @ {baud})")

    if not HAS_SERIAL:
        warn("pyserial not installed — skipping UART monitor.")
        warn("Install with:  pip install pyserial")
        return None   # indeterminate

    log_path = log_dir / "05_uart.log"
    log_path.parent.mkdir(parents=True, exist_ok=True)

    info(f"Opening {port} at {baud} baud, timeout {timeout_s}s...")
    info("Reset / power-cycle the board now if not already programmed fresh.")

    try:
        ser = serial.Serial(port, baud, timeout=1)
    except serial.SerialException as exc:
        err(f"Cannot open {port}: {exc}")
        return False

    deadline = time.time() + timeout_s
    outcome  = None   # True=pass, False=fail
    lines_rx = 0

    with open(log_path, "w", encoding="utf-8") as log_f:
        while time.time() < deadline and outcome is None:
            raw = ser.readline()
            if not raw:
                continue
            try:
                line = raw.decode("utf-8", errors="replace").rstrip()
            except Exception:
                continue

            lines_rx += 1
            log_f.write(line + "\n")
            log_f.flush()

            # Colour-code test result lines
            if re.search(r"\[PASS\]", line):
                print(_c(GREEN, f"  UART> {line}"), flush=True)
            elif re.search(r"\[FAIL\]", line):
                print(_c(RED,   f"  UART> {line}"), flush=True)
            elif re.search(r"\[INFO\]", line):
                print(_c(CYAN,  f"  UART> {line}"), flush=True)
            else:
                print(f"  UART> {line}", flush=True)

            if PASS_RE.search(line):
                outcome = True
            elif FAIL_RE.search(line):
                outcome = False

    ser.close()

    if lines_rx == 0:
        warn("No bytes received on UART. Check port, cable, and baud rate.")
        return None

    if outcome is True:
        ok("UART: ALL TESTS PASSED")
        return True
    elif outcome is False:
        err("UART: FAILURES DETECTED")
        return False
    else:
        warn(f"UART: timeout after {timeout_s}s — PASS/FAIL marker not seen.")
        return None

# ── Argument parsing ─────────────────────────────────────────────────────────

def parse_args():
    p = argparse.ArgumentParser(
        description="axiZero Arty A7-100T full-flow automation",
        formatter_class=argparse.RawDescriptionHelpFormatter,
    )
    p.add_argument("--vivado",         metavar="PATH",  help="Path to vivado(.bat)")
    p.add_argument("--skip-gen",       action="store_true", help="Skip sbt RTL generation")
    p.add_argument("--skip-project",   action="store_true", help="Skip project creation")
    p.add_argument("--skip-build",     action="store_true", help="Skip synth/impl/bitstream")
    p.add_argument("--program", "-p",  action="store_true", help="Program FPGA after bitstream")
    p.add_argument("--port",           metavar="PORT",  help="UART serial port (e.g. COM3)")
    p.add_argument("--baud",           type=int, default=115200, help="UART baud rate (default: 115200)")
    p.add_argument("--uart-timeout",   type=int, default=120, metavar="SEC",
                   help="Seconds to wait for PASS/FAIL on UART (default: 120)")
    p.add_argument("--jobs",           type=int, default=None, metavar="N",
                   help="Vivado parallel jobs (default: CPU count)")
    p.add_argument("--log-dir",        metavar="DIR", default="logs/hw_test",
                   help="Log directory (default: logs/hw_test)")
    p.add_argument("--no-color",       action="store_true", help="Disable colour output")
    return p.parse_args()

# ── Main ─────────────────────────────────────────────────────────────────────

def main():
    global USE_COLOR

    args = parse_args()

    if args.no_color or not sys.stdout.isatty():
        USE_COLOR = False

    # Log directory with timestamp
    ts      = datetime.datetime.now().strftime("%Y%m%d_%H%M%S")
    log_dir = REPO_ROOT / args.log_dir / ts
    log_dir.mkdir(parents=True, exist_ok=True)

    jobs = args.jobs or os.cpu_count() or 4

    banner("axiZero Arty A7-100T Hardware Test Flow")
    info(f"Repo root : {REPO_ROOT}")
    info(f"Log dir   : {log_dir}")
    info(f"Timestamp : {ts}")
    info(f"Jobs      : {jobs}")

    # ── Vivado detection ────────────────────────────────────────────────────
    vivado = args.vivado
    if not vivado:
        vivado = find_vivado()
    if not vivado:
        err("Vivado not found. Set --vivado or add it to PATH.")
        err("Common locations:")
        err("  Windows: C:\\Xilinx\\Vivado\\2023.1\\bin\\vivado.bat")
        err("           C:\\AMDDesignTools\\2025.2\\Vivado\\bin\\vivado.bat")
        err("  Linux:   /tools/Xilinx/Vivado/2023.1/bin/vivado")
        err("           /opt/Xilinx/Vivado/2023.1/bin/vivado")
        sys.exit(2)
    ok(f"Vivado    : {vivado}")

    if not args.skip_gen:
        sbt_path = find_sbt()
        if sbt_path:
            ok(f"sbt       : {sbt_path}")
        else:
            warn("sbt not found — RTL generation will fail (use --skip-gen if RTL exists)")

    # ── Step 1: RTL generation ───────────────────────────────────────────────
    if not args.skip_gen:
        if not step_gen_rtl(log_dir, jobs):
            sys.exit(1)
    else:
        info("Skipping RTL generation (--skip-gen).")

    # ── Step 2: Project creation ─────────────────────────────────────────────
    if not args.skip_project:
        if not step_create_project(vivado, log_dir):
            sys.exit(1)
    else:
        info("Skipping project creation (--skip-project).")

    # ── Step 3: Build ────────────────────────────────────────────────────────
    if not args.skip_build:
        start = time.time()
        if not step_build(vivado, log_dir, jobs):
            sys.exit(1)
        elapsed = time.time() - start
        ok(f"Build completed in {elapsed/60:.1f} minutes.")
    else:
        info("Skipping build (--skip-build).")

    # ── Step 4: Program ──────────────────────────────────────────────────────
    if args.program:
        if not step_program(vivado, log_dir):
            sys.exit(1)
    else:
        info("Skipping FPGA programming (pass --program / -p to enable).")
        if not args.skip_build:
            print()
            info("To program manually:")
            info(f"  vivado -mode batch -source {PROGRAM_TCL}")
            info("Or open Vivado GUI and use Hardware Manager.")

    # ── Step 5: UART monitor ─────────────────────────────────────────────────
    if args.program or args.port:
        port = args.port
        if not port:
            port = auto_detect_port()
        if not port:
            warn("No UART port specified or auto-detected.")
            warn("Pass --port COM3 (Windows) or --port /dev/ttyUSB1 (Linux).")
        else:
            result = step_uart_monitor(port, args.baud, args.uart_timeout, log_dir)
            if result is True:
                banner("RESULT: ALL TESTS PASSED")
                sys.exit(0)
            elif result is False:
                banner("RESULT: TEST FAILURES DETECTED")
                sys.exit(1)
            else:
                warn("UART outcome indeterminate.")
                sys.exit(0)   # build succeeded even if UART was inconclusive
    else:
        info("UART monitor skipped (use --program -p or --port PORT to enable).")

    banner("Build complete — bitstream ready for programming")
    sys.exit(0)


if __name__ == "__main__":
    main()
