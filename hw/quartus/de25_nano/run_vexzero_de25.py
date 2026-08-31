#!/usr/bin/env python3
# Copyright (c) 2026 Leonardo Capossio - bard0 design - hello@bard0.com
# SPDX-License-Identifier: MIT
"""Build, program and test the VexZero example on a Terasic DE25-Nano.

The board has no serial port. Its only link to a host is the on-board
USB-Blaster, so this runner does not listen for a report -- it reads one. The
design puts fpgacapZero's JTAG-to-AXI bridge on the axiZero crossbar as a
third master, and everything checked below is fetched through that bridge,
across the same interconnect the CPU is using at the time.

Two designs share the flow:

  verdict   the self-test firmware. The host reads the done marker, the
            computed result, the GPIO register and the switches, and checks
            them the same way the Arty's hardware does.

  bench     Dhrystone. The host drains the console out of the benchmark
            peripheral's buffer, then re-runs Dhrystone's own self-checks on
            the text and recomputes the score from the cycle count.

Usage:
    python run_vexzero_de25.py                  # verdict: generate, build, run
    python run_vexzero_de25.py --design bench   # Dhrystone instead
    python run_vexzero_de25.py --skip-build     # reprogram and re-read only
"""

from __future__ import annotations

import argparse
import re
import subprocess
import sys
import time
from pathlib import Path

REPO = Path(__file__).resolve().parents[3]
HERE = Path(__file__).resolve().parent
FCAPZ = REPO / "fcapz"

# The host library lives in the pinned submodule; it is the counterpart of the
# bridge in the design, so the two cannot drift apart.
sys.path.insert(0, str(FCAPZ / "host"))

DESIGNS = {
    "verdict": {
        "top": "VexZeroDe25",
        "netlist": "VexZeroDe25.v",
        "project": "vexzero_de25",
        "generator": "vexzero.gen.VexZeroDe25Gen",
    },
    "bench": {
        "top": "VexZeroBenchDe25",
        "netlist": "VexZeroBenchDe25.v",
        "project": "vexzero_bench_de25",
        "generator": "vexzero.gen.VexZeroBenchDe25Gen",
    },
}

# ── Address map, as the SoC defines it ─────────────────────────────────────
RAM_BASE = 0x8000_0000
GPIO_BASE = 0xF000_0000
SYSCTRL_BASE = 0xF001_0000
BENCH_BASE = 0xF00F_F000

GPIO_LED = GPIO_BASE + 0x00
GPIO_SWITCH = GPIO_BASE + 0x04
SYS_STATUS = SYSCTRL_BASE + 0x08
SYS_RESULT = SYSCTRL_BASE + 0x0C

BENCH_DRAIN = BENCH_BASE + 0x00  # [7:0] character, [8] valid -- reading pops
BENCH_LEVEL = BENCH_BASE + 0x04
BENCH_STATUS = BENCH_BASE + 0x08  # [0] the program has written its exit register
BENCH_EXIT = BENCH_BASE + 0xF20   # readback of the code it exited with

DRAIN_VALID = 1 << 8

# Firmware constants, mirrored from vexzero.Firmware. A mismatch here shows up
# as a failed check rather than as a silent pass, which is the safe direction.
DONE_MARKER = 0x0000_C0DE
CHECKSUM = 0x0000_01D8

# Dhrystone, as compiled into the prebuilt image.
DHRYSTONE_RUNS = 200
VAX_DHRYSTONES_PER_SECOND = 1757.0
CLOCK_HZ = 50_000_000


class BuildError(RuntimeError):
    pass


# ── Tools ──────────────────────────────────────────────────────────────────
def find_quartus() -> tuple[Path, Path]:
    """Locate quartus_sh and quartus_stp, PATH first."""
    import shutil

    found = {}
    for tool in ("quartus_sh", "quartus_stp"):
        path = shutil.which(tool)
        if path:
            found[tool] = Path(path)

    if len(found) == 2:
        return found["quartus_sh"], found["quartus_stp"]

    # Not on PATH: look where the Altera installers put it.
    roots = sorted(
        (p for base in (Path("C:/altera_pro"), Path("C:/intelFPGA_pro"), Path("/opt/altera_pro"))
         if base.is_dir()
         for p in base.iterdir() if p.is_dir()),
        reverse=True,
    )
    for root in roots:
        for binhint in ("quartus/bin64", "quartus/bin"):
            cand = root / binhint
            sh = cand / ("quartus_sh.exe" if sys.platform == "win32" else "quartus_sh")
            stp = cand / ("quartus_stp.exe" if sys.platform == "win32" else "quartus_stp")
            if sh.exists() and stp.exists():
                return sh, stp

    raise BuildError(
        "quartus_sh / quartus_stp were not found on PATH or in a known install "
        "location. Add the Quartus bin directory to PATH and try again."
    )


def run(cmd: list[str], cwd: Path | None = None) -> None:
    print(f"  cmd: {' '.join(str(c) for c in cmd)}", flush=True)
    result = subprocess.run(cmd, cwd=cwd)
    if result.returncode != 0:
        raise BuildError(f"command failed with exit code {result.returncode}")


def wsl_path(path: Path) -> str:
    """C:\\Projects\\axiZero -> /mnt/c/Projects/axiZero."""
    resolved = path.resolve()
    drive = resolved.drive.rstrip(":").lower()
    rest = resolved.as_posix()[len(resolved.drive):]
    return f"/mnt/{drive}{rest}"


def generate_netlist(design: dict) -> None:
    banner("sbt: generate " + design["netlist"])
    import shutil

    sbt = f'vexZero/runMain {design["generator"]}'
    if shutil.which("sbt"):
        run(["sbt", sbt], cwd=REPO)
    elif sys.platform == "win32" and shutil.which("wsl"):
        # No native sbt: this repo's usual Windows setup keeps it in WSL.
        run(["wsl", "-e", "bash", "-lc", f"cd {wsl_path(REPO)} && sbt '{sbt}'"])
    else:
        raise BuildError("sbt was not found on PATH -- install it, or generate the netlist yourself")

    netlist = REPO / "generated" / "vexriscv" / design["netlist"]
    if not netlist.is_file():
        raise BuildError(f"the generator did not write {netlist}")
    print(f"[ok] Netlist: {netlist} ({netlist.stat().st_size} bytes)")


def build_bitstream(quartus_sh: Path, design_name: str, build_dir: Path) -> None:
    banner("Quartus: synthesis, fit, assemble")
    build_dir.mkdir(parents=True, exist_ok=True)
    run(
        [str(quartus_sh), "-t", str(HERE / "build_vexzero_de25.tcl"), str(REPO), design_name],
        cwd=build_dir,
    )


def program(quartus_pgm: Path, sof: Path) -> None:
    banner(f"Programming {sof.name}")
    run([str(quartus_pgm), "-m", "jtag", "-o", f"P;{sof}"])


def banner(text: str) -> None:
    print()
    print("=" * 60)
    print(f"  {text}")
    print("=" * 60)


# ── Talking to the board ───────────────────────────────────────────────────
def open_bridge(quartus_stp: Path):
    """Open the JTAG-to-AXI bridge on the board's USB-Blaster."""
    from fcapz.ejtagaxi import EjtagAxiController
    from fcapz.transport import QuartusStpTransport

    transport = QuartusStpTransport(quartus_stp_path=str(quartus_stp))
    transport.connect()
    # CHAIN 4 in the design's JtagAxiMaster; the two have to agree.
    controller = EjtagAxiController(transport, chain=4)
    return transport, controller


def check_verdict(axi, switches_expected: int | None) -> bool:
    banner("Reading the verdict over JTAG-AXI")

    status = axi.axi_read(SYS_STATUS)
    result = axi.axi_read(SYS_RESULT)
    leds = axi.axi_read(GPIO_LED)
    switches = axi.axi_read(GPIO_SWITCH) & 0xF

    expected_result = (CHECKSUM + switches) & 0xFFFF_FFFF

    checks = [
        ("done marker", status == DONE_MARKER, f"0x{status:08X}", f"0x{DONE_MARKER:08X}"),
        ("result", result == expected_result, f"0x{result:08X}", f"0x{expected_result:08X}"),
        ("LED register", leds == CHECKSUM, f"0x{leds:08X}", f"0x{CHECKSUM:08X}"),
    ]
    if switches_expected is not None:
        checks.append(
            ("switches", switches == switches_expected, f"0x{switches:X}", f"0x{switches_expected:X}")
        )

    # The RAM is a different slave and a different port type; read the reset
    # vector back so a pass means the host reached both kinds.
    first = axi.axi_read(RAM_BASE)
    checks.append(("RAM readable", first != 0 and first != 0xFFFF_FFFF, f"0x{first:08X}", "non-trivial"))

    print()
    print("=" * 50)
    print("  VexZero DE25-Nano -- self test")
    print("=" * 50)
    for name, ok, got, want in checks:
        state = "PASS" if ok else f"FAIL (got {got}, want {want})"
        print(f"  {name:<14}= {state}")
    print(f"  switch nibble = 0x{switches:X}")
    print("=" * 50)

    if switches == 0:
        print("  note: all switches are down, so the result check ran against")
        print("        checksum + 0. Flip a switch to make it prove more.")

    passed = all(ok for _, ok, _, _ in checks)
    print("  *** VEXZERO DE25 TEST PASSED ***" if passed else "  *** VEXZERO DE25 TEST FAILED ***")
    return passed


def drain_console(axi, seconds: float) -> str:
    """Read the benchmark console out of the peripheral's buffer.

    The buffer backpressures the CPU, so reading slowly costs the benchmark time but never a
    character. Nothing prints inside Dhrystone's timed loop, so the measurement is unaffected.
    """
    banner(f"Draining the console over JTAG-AXI for up to {seconds:.0f}s")
    text: list[str] = []
    deadline = time.monotonic() + seconds
    idle_since = None

    while time.monotonic() < deadline:
        word = axi.axi_read(BENCH_DRAIN)
        if word & DRAIN_VALID:
            char = chr(word & 0xFF)
            text.append(char)
            sys.stdout.write(char)
            sys.stdout.flush()
            idle_since = None
            continue

        # Nothing waiting. Stop once the program has exited and stayed quiet.
        if idle_since is None:
            idle_since = time.monotonic()
        finished = axi.axi_read(BENCH_STATUS) & 1
        if finished and time.monotonic() - idle_since > 0.5:
            break
        time.sleep(0.02)

    return "".join(text)


def self_check(text: str) -> tuple[int, list[str]]:
    """Re-run every check Dhrystone printed, and report the ones that disagree."""
    lines = text.splitlines()
    compared = 0
    failed: list[str] = []

    for i in range(1, len(lines)):
        stripped = lines[i].strip()
        if not stripped.startswith("should be:"):
            continue
        expected = stripped[len("should be:"):].strip()
        if expected.startswith("(implementation-dependent"):
            continue
        label, _, actual = lines[i - 1].partition(":")
        label, actual = label.strip(), actual.strip()
        if expected == "Number_Of_Runs + 10":
            expected = str(DHRYSTONE_RUNS + 10)
        compared += 1
        if actual != expected:
            failed.append(f"{label}: got '{actual}', should be '{expected}'")

    # The two pointer prints are the same object seen through two records.
    pointers = [
        lines[i - 1].partition(":")[2].strip()
        for i in range(1, len(lines))
        if lines[i].strip().startswith("should be:")
        and lines[i - 1].partition(":")[0].strip() == "Ptr_Comp"
    ]
    if len(pointers) == 2 and len(set(pointers)) != 1:
        failed.append(f"Ptr_Comp printed {pointers[0]} and {pointers[1]}")

    return compared, failed


def report_bench(text: str, exit_code: int) -> bool:
    match = re.search(r"Clock cycles=(\d+)", text)
    if not match:
        print("\n  the console carried no cycle count -- nothing to score")
        return False

    cycles = int(match.group(1))
    per_run = cycles / DHRYSTONE_RUNS
    dhrystones = DHRYSTONE_RUNS / (cycles / CLOCK_HZ)
    dmips = 1e6 * DHRYSTONE_RUNS / (cycles * VAX_DHRYSTONES_PER_SECOND)

    compared, failed = self_check(text)

    print()
    print("=" * 52)
    print(f"  VexZero benchmark -- DE25-Nano, {CLOCK_HZ / 1e6:.0f} MHz")
    print("=" * 52)
    print(f"  timed loop    = {cycles} cycles for {DHRYSTONE_RUNS} runs ({per_run:.1f} per run)")
    print(f"  Dhrystones/s  = {dhrystones:,.0f} at {CLOCK_HZ / 1e6:.0f} MHz")
    print(f"  DMIPS/MHz     = {dmips:.3f}")
    print(f"  self checks   = {compared} compared, {len(failed)} failed")
    print(f"  exit code     = {exit_code}")
    print("=" * 52)
    for problem in failed:
        print(f"  ! {problem}")

    passed = not failed and exit_code == 0 and compared >= 15
    print("  *** VEXZERO DE25 BENCHMARK PASSED ***" if passed
          else "  *** VEXZERO DE25 BENCHMARK FAILED ***")
    return passed


# ── Entry point ────────────────────────────────────────────────────────────
def main() -> int:
    parser = argparse.ArgumentParser(description=__doc__, formatter_class=argparse.RawDescriptionHelpFormatter)
    parser.add_argument("--design", choices=sorted(DESIGNS), default="verdict")
    parser.add_argument("--skip-build", action="store_true", help="reprogram and re-read only")
    parser.add_argument("--force-build", action="store_true", help="rebuild even if a bitstream exists")
    parser.add_argument("--seconds", type=float, default=60.0, help="how long to drain the console")
    parser.add_argument("--switches", type=lambda v: int(v, 0), default=None,
                        help="switch nibble to expect, e.g. 0xF")
    args = parser.parse_args()

    design = DESIGNS[args.design]
    build_dir = HERE / design["project"]
    sof = build_dir / f"{design['project']}.sof"

    print(f"VexZero on DE25-Nano -- {args.design}")

    if not (FCAPZ / "rtl" / "fcapz_ejtagaxi_intel.v").is_file():
        print("[error] the fpgacapZero submodule is missing.")
        print("        run: git submodule update --init fcapz")
        return 2

    try:
        quartus_sh, quartus_stp = find_quartus()
        quartus_pgm = quartus_sh.with_name(quartus_sh.name.replace("quartus_sh", "quartus_pgm"))
        print(f"  quartus_sh : {quartus_sh}")
        print(f"  quartus_stp: {quartus_stp}")

        if not args.skip_build and (args.force_build or not sof.is_file()):
            generate_netlist(design)
            build_bitstream(quartus_sh, args.design, build_dir)

        if not sof.is_file():
            raise BuildError(f"no bitstream at {sof} -- build it first (drop --skip-build)")

        program(quartus_pgm, sof)

        transport, axi = open_bridge(quartus_stp)
        try:
            if args.design == "verdict":
                ok = check_verdict(axi, args.switches)
            else:
                text = drain_console(axi, args.seconds)
                finished = axi.axi_read(BENCH_STATUS) & 1
                exit_code = axi.axi_read(BENCH_EXIT)
                if not finished:
                    print("\n  the program had not written its exit register when time ran out")
                ok = report_bench(text, exit_code) and bool(finished)
        finally:
            transport.close()

        return 0 if ok else 1

    except BuildError as exc:
        print(f"[error] {exc}")
        return 2


if __name__ == "__main__":
    raise SystemExit(main())
