#!/usr/bin/env python3
# Copyright (c) 2026 Leonardo Capossio - bard0 design  hello@bard0.com
# SPDX-License-Identifier: MIT
"""Build, program, and run the VexZero example SoC on an Arty A7-100T.

The SoC boots VexRiscv out of on-chip RAM, drives the axiZero crossbar with a
mixed AXI4 / AXI4-Lite address map, and the board wrapper (``VexZeroArty``)
checks the results in hardware.  A board has no wires back to a test runner, so
the verdict comes out of the USB-UART as one 9-byte line, repeated forever::

    VZPDRCL5    every check passed, switches read back as 0x5
    VZFdrcl0    the CPU never finished (held in reset, or hung)

Upper case means that check passed: P/F overall, D done, R result, C chars,
L leds.  The last byte is the switch nibble the firmware read back over
AXI4-Lite -- the result check is ``checksum + switches``, so a non-zero nibble
is what tells a working Lite read from one that always returns zero.  The same
verdict is on LD4-LD7 (done, pass, fail, heartbeat) for anyone watching the
board itself.

Steps: generate RTL with sbt, build with Vivado, program with xsdb, then read
the serial line.  Each step can be skipped when it has already been done::

    python run_vexzero_test.py                 # build if needed, program, check
    python run_vexzero_test.py --force-build   # rebuild the bitstream
    python run_vexzero_test.py --skip-build    # program the existing bitstream
    python run_vexzero_test.py --port COM4     # skip serial port autodetection
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
PROJ_DIR = SCRIPT_DIR / "vexzero_arty"
BIT_FILE = PROJ_DIR / "vexzero_arty.runs" / "impl_1" / "VexZeroArty.bit"
RTL_FILE = REPO_ROOT / "generated" / "vexriscv" / "VexZeroArty.v"

GEN_MAIN = "vexzero.gen.VexZeroArtyGen"
REPORT_RE = re.compile(r"^VZ([PF])([Dd])([Rr])([Cc])([Ll])([0-9A-F])$")

# FT2232H on the Arty: channel A is the JTAG bridge, channel B the USB-UART,
# and Digilent gives the two channels one serial number with an A/B suffix.
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

    run(cmd, cwd=REPO_ROOT, timeout=1800, desc="sbt: generate VexZeroArty.v")
    if not RTL_FILE.exists():
        print(f"*** ERROR: netlist not found at {RTL_FILE}")
        sys.exit(1)
    print(f"[ok] Netlist: {RTL_FILE} ({RTL_FILE.stat().st_size} bytes)")


def step_vivado(force_build, jobs):
    if BIT_FILE.exists() and not force_build:
        print(f"[skip] Bitstream already exists: {BIT_FILE}")
        return
    run(
        [VIVADO_BIN, "-mode", "batch", "-source", str(CREATE_TCL), "-tclargs", str(jobs)],
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
    """Configure the Arty over JTAG.

    The name filter matters: other AMD boards may be attached to the same
    hw_server, and only the Artix-7 on the Arty answers to ``xc7a100t``.
    """
    if not BIT_FILE.exists():
        print(f"*** ERROR: bitstream not found at {BIT_FILE} (build it first)")
        sys.exit(1)

    xsdb_tcl = SCRIPT_DIR / "_vexzero_xsdb_temp.tcl"
    bit_path = str(BIT_FILE).replace("\\", "/")
    xsdb_tcl.write_text(
        "# Auto-generated by run_vexzero_test.py\n"
        "connect\n"
        "after 500\n"
        'targets -set -filter {name =~ "xc7a100t*"}\n'
        "after 200\n"
        f"fpga {bit_path}\n"
        "after 1000\n"
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


def step_serial(port, seconds):
    import serial

    print(f"\n{'=' * 60}")
    print(f"  serial: listening on {port} at 115200 8N1 for {seconds}s")
    print(f"{'=' * 60}\n", flush=True)

    reports = []
    deadline = time.time() + seconds
    with serial.Serial(port, 115200, timeout=1) as ser:
        ser.reset_input_buffer()
        buf = ""
        while time.time() < deadline and not reports:
            chunk = ser.read(64).decode("ascii", errors="replace")
            if not chunk:
                continue
            buf += chunk
            while "\n" in buf:
                line, buf = buf.split("\n", 1)
                line = line.strip("\r")
                if not line:
                    continue
                print(f"  <- {line}")
                if REPORT_RE.match(line):
                    reports.append(line)

    print()
    if not reports:
        print("*** FAILED: no report line on the serial port.")
        print("    LD7 (heartbeat) dark means the design is not being clocked;")
        print("    lit means it runs but nothing reached the UART.")
        sys.exit(1)

    latest = reports[-1]
    overall, done, result, chars, leds, switches = REPORT_RE.match(latest).groups()
    print("=" * 42)
    print("  VexZero SoC hardware test -- Arty A7-100T")
    print("=" * 42)
    print(f"  report line   = {latest}")
    for name, flag, ok_char in (
        ("overall", overall, "P"),
        ("done", done, "D"),
        ("result", result, "R"),
        ("chars", chars, "C"),
        ("leds", leds, "L"),
    ):
        print(f"  {name:<13} = {'PASS' if flag == ok_char else 'FAIL'}")
    print(f"  switches      = 0x{switches}")
    print("=" * 42)

    if overall != "P":
        print("\n*** FAILED: the board reported a failing check\n")
        sys.exit(1)
    if switches == "0":
        print("\n  Note: every slide switch is down, so result = checksum + 0 and")
        print("  the AXI4-Lite read of the switch register is not being pinned")
        print("  down by that check. Flip a switch and run again to cover it.")
    print("  *** VEXZERO HW TEST PASSED ***\n")


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
        "--skip-program",
        action="store_true",
        help="Do not reconfigure the FPGA; only read the serial line.",
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
        help="How long to listen for a report line (default: 20).",
    )
    return parser.parse_args()


def main():
    args = parse_args()
    print("VexZero example SoC hardware test -- Arty A7-100T")
    print(f"  Vivado: {VIVADO_BIN}")
    print(f"  xsdb:   {XSDB_BIN}")

    if not args.skip_build:
        step_generate_rtl()
        step_vivado(args.force_build, args.jobs)
    if not args.skip_program:
        step_program()
    step_serial(args.port or find_serial_port(), args.seconds)


if __name__ == "__main__":
    main()
