#!/usr/bin/env python3
# Copyright (c) 2026 Leonardo Capossio - bard0 design  hello@bard0.com
# SPDX-License-Identifier: MIT
"""Run a RISC-V benchmark on the VexZero SoC on an Arty A7-100T.

The bitstream carries a prebuilt RV32I Dhrystone 2.1 -- the one that ships with
the pinned VexRiscv submodule -- inside the SoC's on-chip RAM. Every instruction
fetch, load, store and printed character crosses the axiZero crossbar, so the
score is a measurement of the interconnect as much as of the core.

The program runs once, immediately after the FPGA is configured, and prints its
own results. This script therefore opens the serial port *before* programming:
the output is gone in a fraction of a second and there is nothing to ask the
board to repeat.

It then checks the benchmark's own answers. Dhrystone prints each result next
to the value it should be, so a crossbar that corrupted anything fails here
rather than merely scoring badly.

    python run_vexzero_bench.py                 # build if needed, program, run
    python run_vexzero_bench.py --force-build   # rebuild the bitstream
    python run_vexzero_bench.py --skip-build    # program the existing bitstream
    python run_vexzero_bench.py --port COM4     # skip serial port autodetection
"""

import argparse
import os
import pathlib
import re
import shutil
import subprocess
import sys
import time

from find_xilinx_tools import require_fpga_tools, vivado_env

SCRIPT_DIR = pathlib.Path(__file__).resolve().parent
REPO_ROOT = SCRIPT_DIR.parents[2]

CREATE_TCL = SCRIPT_DIR / "create_project_vexzero.tcl"
PROJ_DIR = SCRIPT_DIR / "vexzero_bench"
BIT_FILE = PROJ_DIR / "vexzero_bench.runs" / "impl_1" / "VexZeroBenchArty.bit"
RTL_FILE = REPO_ROOT / "generated" / "vexriscv" / "VexZeroBenchArty.v"

GEN_MAIN = "vexzero.gen.VexZeroBenchArtyGen"

# Number_Of_Runs compiled into the binary, and the VAX 11/780 reference rate.
RUNS = 200
VAX_DHRYSTONES_PER_SECOND = 1757.0

# FT2232H on the Arty: channel A is the JTAG bridge, channel B the USB-UART.
FTDI_VID = 0x0403
FT2232H_PID = 0x6010

VIVADO_BIN, XSDB_BIN = require_fpga_tools()


def run(cmd, cwd=None, timeout=None, desc="", env=None, capture=False):
    print(f"\n{'=' * 60}")
    print(f"  {desc}")
    print(f"  cmd: {' '.join(str(c) for c in cmd)}")
    print(f"{'=' * 60}\n", flush=True)
    result = subprocess.run(
        [str(c) for c in cmd],
        cwd=str(cwd) if cwd else None,
        timeout=timeout,
        env=env,
        text=True,
        stdout=subprocess.PIPE if capture else None,
        stderr=subprocess.STDOUT if capture else None,
    )
    if capture:
        print(result.stdout)
    if result.returncode != 0:
        print(f"\n*** FAILED (rc={result.returncode}): {desc}")
        sys.exit(result.returncode)
    return result.stdout if capture else ""


def wsl_path(path):
    resolved = pathlib.Path(path).resolve()
    drive = resolved.drive.rstrip(":").lower()
    rest = resolved.relative_to(resolved.anchor).as_posix()
    return f"/mnt/{drive}/{rest}"


def step_generate_rtl():
    sbt = os.environ.get("SBT_BIN") or shutil.which("sbt") or shutil.which("sbt.bat")
    if sbt:
        cmd = [sbt, f"vexZero/runMain {GEN_MAIN}"]
    elif sys.platform == "win32" and shutil.which("wsl"):
        cmd = [
            "wsl",
            "-e",
            "bash",
            "-lc",
            f"cd {wsl_path(REPO_ROOT)} && sbt 'vexZero/runMain {GEN_MAIN}'",
        ]
    else:
        print("*** ERROR: sbt not found. Set SBT_BIN or install sbt on PATH.")
        sys.exit(1)

    run(cmd, cwd=REPO_ROOT, timeout=1800, desc="sbt: generate VexZeroBenchArty.v")
    if not RTL_FILE.exists():
        print(f"*** ERROR: netlist not found at {RTL_FILE}")
        print("    The benchmark image comes from the VexRiscv submodule:")
        print("    git submodule update --init third_party/VexRiscv")
        sys.exit(1)
    print(f"[ok] Netlist: {RTL_FILE} ({RTL_FILE.stat().st_size} bytes)")


def step_vivado(force_build, jobs):
    if BIT_FILE.exists() and not force_build:
        print(f"[skip] Bitstream already exists: {BIT_FILE}")
        return
    run(
        [
            VIVADO_BIN,
            "-mode",
            "batch",
            "-source",
            str(CREATE_TCL),
            "-tclargs",
            str(jobs),
            "bench",
        ],
        cwd=REPO_ROOT,
        timeout=7200,
        desc="Vivado: create project + synth + impl + bitstream",
        env=vivado_env(),
    )
    if not BIT_FILE.exists():
        print(f"*** ERROR: bitstream not found at {BIT_FILE}")
        sys.exit(1)
    print(f"[ok] Bitstream: {BIT_FILE}")


def step_program():
    """Configure the Arty over JTAG, filtering out any other attached board."""
    if not BIT_FILE.exists():
        print(f"*** ERROR: bitstream not found at {BIT_FILE} (build it first)")
        sys.exit(1)

    xsdb_tcl = SCRIPT_DIR / "_vexzero_bench_xsdb_temp.tcl"
    bit_path = str(BIT_FILE).replace("\\", "/")
    xsdb_tcl.write_text(
        "# Auto-generated by run_vexzero_bench.py\n"
        "connect\n"
        "after 500\n"
        'targets -set -filter {name =~ "xc7a100t*"}\n'
        "after 200\n"
        f"fpga {bit_path}\n"
        'puts "VEXZERO_PROGRAMMED"\n'
        "disconnect\n"
        "exit\n",
        encoding="utf-8",
    )
    try:
        output = run(
            [XSDB_BIN, str(xsdb_tcl)],
            cwd=SCRIPT_DIR,
            timeout=300,
            desc="xsdb: configure the FPGA",
            capture=True,
        )
    finally:
        xsdb_tcl.unlink(missing_ok=True)

    if "VEXZERO_PROGRAMMED" not in output or "no targets found" in output:
        print("\n*** FAILED: could not configure the Arty")
        sys.exit(1)


def find_serial_port():
    """Return the Arty's USB-UART port, or exit listing what was found."""
    from serial.tools import list_ports

    ports = list(list_ports.comports())
    arty = [
        p
        for p in ports
        if p.vid == FTDI_VID
        and p.pid == FT2232H_PID
        and (p.serial_number or "").upper().endswith("B")
    ]
    if len(arty) == 1:
        print(f"[ok] Arty USB-UART: {arty[0].device} (serial {arty[0].serial_number})")
        return arty[0].device

    print("*** Could not identify the Arty USB-UART automatically.")
    for p in ports:
        print(f"    {p.device}  vid={p.vid} pid={p.pid} serial={p.serial_number}  {p.description}")
    print("    Pass the port explicitly, e.g. --port COM4 or --port /dev/ttyUSB1")
    sys.exit(1)


def self_check(text):
    """Compare every Dhrystone result with the value it prints beside it.

    Returns (checked, failures). Lines whose expected value is
    "(implementation-dependent)" carry no expectation; the two pointer prints
    are compared with each other instead.
    """
    lines = text.splitlines()
    checked, failures, pointers = 0, [], []

    for i in range(1, len(lines)):
        if not lines[i].strip().startswith("should be:"):
            continue
        expected = lines[i].strip()[len("should be:") :].strip()
        label, _, actual = lines[i - 1].partition(":")
        label, actual = label.strip(), actual.strip()

        if label == "Ptr_Comp":
            pointers.append(actual)
        if expected.startswith("(implementation-dependent"):
            continue
        if expected == "Number_Of_Runs + 10":
            expected = str(RUNS + 10)
        checked += 1
        if actual != expected:
            failures.append(f"{label}: got '{actual}', should be '{expected}'")

    if len(pointers) == 2 and pointers[0] != pointers[1]:
        failures.append(f"Ptr_Comp printed {pointers[0]} and {pointers[1]}")
    return checked, failures


def step_serial(port, seconds):
    """Open the line, configure the FPGA, and read what the program prints."""
    import serial

    print(f"\n{'=' * 60}")
    print(f"  serial: listening on {port} at 115200 8N1")
    print(f"{'=' * 60}\n", flush=True)

    with serial.Serial(port, 115200, timeout=1) as ser:
        ser.reset_input_buffer()
        step_program()

        text = ""
        deadline = time.time() + seconds
        while time.time() < deadline:
            chunk = ser.read(256).decode("ascii", errors="replace")
            if chunk:
                sys.stdout.write(chunk)
                sys.stdout.flush()
                text += chunk
                # The DMIPS line is the last thing the benchmark prints.
                if "DMIPS per Mhz" in text and text.rstrip().endswith(tuple("0123456789")):
                    break
    return text


def report(text):
    print(f"\n{'=' * 52}")
    print("  VexZero benchmark -- Arty A7-100T, 100 MHz")
    print("=" * 52)

    if not text.strip():
        print("  *** FAILED: nothing arrived on the serial port")
        print("  LD7 (heartbeat) dark means the design is not being clocked.")
        sys.exit(1)

    checked, failures = self_check(text)
    cycles = re.search(r"Clock cycles=(\d+)", text)
    dmips = re.search(r"DMIPS per Mhz:\s+([\d.]+)", text)

    if cycles:
        user = int(cycles.group(1))
        print(f"  timed loop    = {user} cycles for {RUNS} runs ({user / RUNS:.1f} per run)")
        print(f"  Dhrystones/s  = {1e8 * RUNS / user:,.0f} at 100 MHz")
        print(f"  DMIPS/MHz     = {1e6 * RUNS / (user * VAX_DHRYSTONES_PER_SECOND):.3f}")
    if dmips:
        print(f"  benchmark says  {dmips.group(1)} DMIPS/MHz")
    print(f"  self checks   = {checked} compared, {len(failures)} failed")
    print("=" * 52)

    if not cycles or not dmips:
        print("\n*** FAILED: the benchmark did not print a complete result\n")
        sys.exit(1)
    for failure in failures:
        print(f"  !! {failure}")
    if failures:
        print("\n*** FAILED: the benchmark's own checks did not pass\n")
        sys.exit(1)
    print("  *** VEXZERO BENCHMARK PASSED ***\n")


def parse_args():
    parser = argparse.ArgumentParser(
        description=__doc__, formatter_class=argparse.RawDescriptionHelpFormatter
    )
    parser.add_argument(
        "--force-build",
        action="store_true",
        help="Run Vivado even when the bitstream already exists.",
    )
    parser.add_argument(
        "--skip-build",
        action="store_true",
        help="Use the existing bitstream; do not run sbt or Vivado.",
    )
    parser.add_argument(
        "--jobs",
        type=int,
        default=4,
        help="Parallel synthesis/implementation jobs (default: 4).",
    )
    parser.add_argument(
        "--port",
        default=None,
        help="Serial port of the Arty USB-UART (default: autodetect).",
    )
    parser.add_argument(
        "--seconds",
        type=int,
        default=20,
        help="How long to read the benchmark's output (default: 20).",
    )
    return parser.parse_args()


def main():
    args = parse_args()
    print("VexZero benchmark -- Arty A7-100T")
    print(f"  Vivado: {VIVADO_BIN}")
    print(f"  xsdb:   {XSDB_BIN}")

    if not args.skip_build:
        step_generate_rtl()
        step_vivado(args.force_build, args.jobs)
    report(step_serial(args.port or find_serial_port(), args.seconds))


if __name__ == "__main__":
    main()
