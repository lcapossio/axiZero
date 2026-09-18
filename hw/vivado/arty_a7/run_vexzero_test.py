#!/usr/bin/env python3
# Copyright (c) 2026 Leonardo Capossio - bard0 design  hello@bard0.com
# SPDX-License-Identifier: MIT
"""Build, program, and run a VexZero design on an Arty A7-100T.

The SoC boots VexRiscv out of on-chip RAM, drives the axiZero crossbar with a
mixed AXI4 / AXI4-Lite address map, and the board wrapper (``VexZeroArty``)
checks the results in hardware.  A board has no wires back to a test runner, so
the verdict comes out of the USB-UART as one 12-byte line, repeated forever::

    VZPDRCLBGS5    every check passed, switches read back as 0x5
    VZFdrclBGS0    the CPU never finished (held in reset, or hung)
    VZFDRCLbGS5    the program was right and the bus broke AXI4 while it ran
    VZFDRCLBgS5    a traffic generator read back data it had not written

Upper case means that check passed: P/F overall, D done, R result, C chars,
L leds, B bus protocol, G traffic generators, S stream island.  A check the
build leaves out reads upper case, so one parser reads every variant.  The last
byte is the switch nibble the firmware read back over AXI4-Lite -- the result
check is ``checksum + switches``, so a non-zero nibble is what tells a working
Lite read from one that always returns zero.  The same verdict is on LD4-LD7
(done, pass, fail, heartbeat) for anyone watching the board itself.

Six designs share this runner.  ``verdict`` is the plain self test; the five
``stress_*`` builds add two saturating self-checking traffic generators that
load the crossbar for the whole run, one per arbitration policy, and carry the
AXI4-Stream smoke test along with them.  ``stress_ids`` is the odd one out: its
generators vary their ID and split each ID's traffic across two on-chip RAMs,
so it is the build that asks the fabric for AXI4 ordering -- same-ID responses
in issue order, one slave per live ID -- rather than only for arbitration.
Between them they replace the retired
MicroBlaze base, wrr, qos, qos_stress, axi3 and axis suites, and unlike those
they build for Altera as well -- see ``hw/quartus/de25_nano``.

Steps: generate RTL with sbt, build with Vivado, program with xsdb, then read
the serial line.  Each step can be skipped when it has already been done::

    python run_vexzero_test.py                     # build if needed, program, check
    python run_vexzero_test.py --design stress_qos # the QoS-arbitrated build
    python run_vexzero_test.py --design all        # every design, in turn
    python run_vexzero_test.py --force-build       # rebuild the bitstream
    python run_vexzero_test.py --skip-build        # program the existing bitstream
    python run_vexzero_test.py --port COM4         # skip serial port autodetection
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

# design name -> (top module, Vivado project directory, sbt main and its args).
# The names match create_project_vexzero.tcl's -tclargs, so the two cannot
# drift apart without one of them failing loudly.
DESIGNS = {
    "verdict": ("VexZeroArty", "vexzero_arty", ["vexzero.gen.VexZeroArtyGen"]),
    "stress_rr": (
        "VexZeroStressArty_rr",
        "vexzero_stress_rr",
        ["vexzero.gen.VexZeroStressArtyGen", "rr"],
    ),
    "stress_wrr": (
        "VexZeroStressArty_wrr",
        "vexzero_stress_wrr",
        ["vexzero.gen.VexZeroStressArtyGen", "wrr"],
    ),
    "stress_qos": (
        "VexZeroStressArty_qos",
        "vexzero_stress_qos",
        ["vexzero.gen.VexZeroStressArtyGen", "qos"],
    ),
    "stress_axi3": (
        "VexZeroStressArty_axi3",
        "vexzero_stress_axi3",
        ["vexzero.gen.VexZeroStressArtyGen", "axi3"],
    ),
    "stress_ids": (
        "VexZeroStressArty_ids",
        "vexzero_stress_ids",
        ["vexzero.gen.VexZeroStressArtyGen", "ids"],
    ),
}

REPORT_RE = re.compile(r"^VZ([PF])([Dd])([Rr])([Cc])([Ll])([Bb])([Gg])([Ss])([0-9A-F])$")


class Design:
    """Where one design's netlist, project and bitstream live."""

    def __init__(self, name):
        top, proj, gen_main = DESIGNS[name]
        self.name = name
        self.top = top
        self.proj_dir = SCRIPT_DIR / proj
        self.bit_file = self.proj_dir / f"{proj}.runs" / "impl_1" / f"{top}.bit"
        self.rtl_file = REPO_ROOT / "generated" / "vexriscv" / f"{top}.v"
        self.gen_main = gen_main
        self.timing_file = self.proj_dir / "vexzero_timing.txt"

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


def step_generate_rtl(design):
    main = " ".join(design.gen_main)
    sbt = os.environ.get("SBT_BIN") or shutil.which("sbt") or shutil.which("sbt.bat")
    if sbt:
        cmd = [sbt, f"vexZero/runMain {main}"]
    elif sys.platform == "win32" and shutil.which("wsl"):
        cmd = [
            "wsl",
            "-e",
            "bash",
            "-lc",
            f"cd {wsl_path(REPO_ROOT)} && sbt 'vexZero/runMain {main}'",
        ]
    else:
        print("*** ERROR: sbt not found. Set SBT_BIN or install sbt on PATH.")
        sys.exit(1)

    run(cmd, cwd=REPO_ROOT, timeout=1800, desc=f"sbt: generate {design.top}.v")
    if not design.rtl_file.exists():
        print(f"*** ERROR: netlist not found at {design.rtl_file}")
        sys.exit(1)
    print(f"[ok] Netlist: {design.rtl_file} ({design.rtl_file.stat().st_size} bytes)")


def step_vivado(design, force_build, jobs):
    if design.bit_file.exists() and not force_build:
        print(f"[skip] Bitstream already exists: {design.bit_file}")
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
            design.name,
        ],
        cwd=REPO_ROOT,
        timeout=7200,
        desc=f"Vivado: create project + synth + impl + bitstream ({design.name})",
        env=vivado_env(),
    )
    if not design.bit_file.exists():
        print(f"*** ERROR: bitstream not found at {design.bit_file}")
        sys.exit(1)
    print(f"[ok] Bitstream: {design.bit_file}")


def step_program(design):
    """Configure the Arty over JTAG.

    The name filter matters: other AMD boards may be attached to the same
    hw_server, and only the Artix-7 on the Arty answers to ``xc7a100t``.
    """
    if not design.bit_file.exists():
        print(f"*** ERROR: bitstream not found at {design.bit_file} (build it first)")
        sys.exit(1)

    xsdb_tcl = SCRIPT_DIR / "_vexzero_xsdb_temp.tcl"
    bit_path = str(design.bit_file).replace("\\", "/")
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


def step_serial(design, port, seconds, observe):
    """Read the board's report line, then keep reading for `observe` more seconds.

    Stopping at the first report line samples the design once, a fraction of a second after
    configuration, and calls that the result. Every verdict the board reports is sticky -- a
    generator error, a protocol violation and a checker that lost track all latch and never clear --
    so a fault that first appears a second in is real, is still being reported, and was simply never
    looked at. The generators run for as long as the board is powered, and the first report line is
    the least traffic they will ever have run.

    So the verdict is required to hold. Every report seen during the window has to match the first;
    one that changes fails the run, and both lines are printed, because which bit moved and in which
    direction is the whole of the information.
    """
    import serial

    print(f"\n{'=' * 60}")
    print(f"  serial: listening on {port} at 115200 8N1 for {seconds}s")
    print(f"  then holding the verdict under observation for {observe}s")
    print(f"{'=' * 60}\n", flush=True)

    reports = []
    deadline = time.time() + seconds
    observe_deadline = None
    with serial.Serial(port, 115200, timeout=1) as ser:
        ser.reset_input_buffer()
        buf = ""
        while time.time() < deadline and (
            observe_deadline is None or time.time() < observe_deadline
        ):
            chunk = ser.read(64).decode("ascii", errors="replace")
            if not chunk:
                continue
            buf += chunk
            while "\n" in buf:
                line, buf = buf.split("\n", 1)
                line = line.strip("\r")
                if not line:
                    continue
                if not REPORT_RE.match(line):
                    print(f"  <- {line}")
                elif not reports:
                    # The first report starts the observation window, and pushes
                    # the overall deadline out so a slow boot cannot eat it.
                    observe_deadline = time.time() + observe
                    deadline = max(deadline, observe_deadline + 1.0)
                    print(f"  <- {line}")
                    reports.append(line)
                else:
                    if line != reports[0]:
                        print(f"  <- {line}   <-- changed")
                    reports.append(line)

    print()
    if not reports:
        print("*** FAILED: no report line on the serial port.")
        print("    LD7 (heartbeat) dark means the design is not being clocked;")
        print("    lit means it runs but nothing reached the UART.")
        sys.exit(1)

    changed = [r for r in reports if r != reports[0]]
    print(f"  observed {len(reports)} report lines over {observe}s")
    if changed:
        print("*** FAILED: the verdict changed while the board kept running.")
        print(f"    first = {reports[0]}")
        print(f"    later = {changed[-1]}")
        print("    Every reported verdict is sticky, so this is a fault that took longer")
        print("    to appear than the first report line took to arrive.")
        sys.exit(1)

    latest = reports[-1]
    groups = REPORT_RE.match(latest).groups()
    overall, done, result, chars, leds, bus, gens, stream, switches = groups
    print("=" * 46)
    print(f"  VexZero hardware test -- Arty A7-100T ({design.name})")
    print("=" * 46)
    print(f"  report line   = {latest}")
    for name, flag, ok_char in (
        ("overall", overall, "P"),
        ("done", done, "D"),
        ("result", result, "R"),
        ("chars", chars, "C"),
        ("leds", leds, "L"),
        ("bus protocol", bus, "B"),
        ("generators", gens, "G"),
        ("stream island", stream, "S"),
    ):
        print(f"  {name:<13} = {'PASS' if flag == ok_char else 'FAIL'}")
    print(f"  switches      = 0x{switches}")
    print("=" * 46)

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
        "--design",
        default="verdict",
        choices=sorted(DESIGNS) + ["all"],
        help=(
            "Which VexZero design to build and run (default: verdict). "
            "'all' runs every one of them in turn."
        ),
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
        "--allow-timing-failure",
        action="store_true",
        help="Program and read a bitstream that misses timing. For debugging a "
        "failing path only: the board result it produces is not evidence.",
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
        help="How long to listen for the first report line (default: 20).",
    )
    parser.add_argument(
        "--observe",
        type=float,
        default=5.0,
        help=(
            "After the first report line, how long to keep reading and require the verdict to "
            "stay the same (default: 5). The verdicts are sticky, so this is what catches a "
            "fault that takes longer to appear than the first line takes to arrive."
        ),
    )
    return parser.parse_args()


def step_timing(design, allow_failure):
    """Refuse to report a board result from a bitstream that misses timing.

    Vivado writes a bitstream whether or not the design closes, and such a
    bitstream will usually still program, boot and print a passing report line --
    setup violations show up as occasional wrong bits, not as an obvious halt.
    A suite that accepted that would be certifying the report rather than the
    design, so closure is checked here and a miss stops the run.

    The file is written by create_project_vexzero.tcl. An older project directory
    built before this check existed will not have one; that is reported rather
    than passed over, because "no evidence of a problem" and "evidence of no
    problem" are not the same thing.
    """
    if not design.timing_file.exists():
        print(f"*** ERROR: no timing record at {design.timing_file}")
        print("    Rebuild with --force-build; closure cannot be confirmed without it.")
        sys.exit(1)

    values = {}
    for line in design.timing_file.read_text().splitlines():
        parts = line.split()
        if len(parts) == 2:
            values[parts[0]] = float(parts[1])

    wns = values.get("wns")
    period = values.get("period", 10.0)
    if wns is None:
        print(f"*** ERROR: no WNS in {design.timing_file}")
        sys.exit(1)

    fmax = 1000.0 / (period - wns)
    clk = 1000.0 / period
    if wns < 0:
        print(f"  timing       = FAIL (WNS {wns:+.3f} ns at {clk:.0f} MHz, Fmax {fmax:.1f} MHz)")
        if not allow_failure:
            print("")
            print(f"*** TIMING NOT MET: {design.name} does not close at {clk:.0f} MHz.")
            print("    The board result from this bitstream is not evidence and was not read.")
            print("    Re-run with --allow-timing-failure to program it anyway for debugging.")
            sys.exit(1)
        print("  (--allow-timing-failure given: continuing, result is not evidence)")
    else:
        print(f"  timing       = PASS (WNS {wns:+.3f} ns at {clk:.0f} MHz, Fmax {fmax:.1f} MHz)")


def run_design(design, args, port):
    print(f"\n#### {design.name} " + "#" * (60 - len(design.name)))
    if not args.skip_build:
        step_generate_rtl(design)
        step_vivado(design, args.force_build, args.jobs)
    step_timing(design, args.allow_timing_failure)
    if not args.skip_program:
        step_program(design)
    step_serial(design, port, args.seconds, args.observe)


def main():
    args = parse_args()
    names = sorted(DESIGNS) if args.design == "all" else [args.design]
    print("VexZero hardware test -- Arty A7-100T")
    print(f"  designs: {', '.join(names)}")
    print(f"  Vivado: {VIVADO_BIN}")
    print(f"  xsdb:   {XSDB_BIN}")

    # One serial port for all of them: the board is the same board, and
    # autodetecting once keeps a multi-design run from re-enumerating USB
    # between bitstreams.
    port = args.port or find_serial_port()
    for name in names:
        run_design(Design(name), args, port)

    if len(names) > 1:
        print(f"  *** ALL {len(names)} VEXZERO HW TESTS PASSED ***\n")


if __name__ == "__main__":
    main()
