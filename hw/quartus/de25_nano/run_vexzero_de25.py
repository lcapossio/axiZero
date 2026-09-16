#!/usr/bin/env python3
# Copyright (c) 2026 Leonardo Capossio - bard0 design - hello@bard0.com
# SPDX-License-Identifier: MIT
"""Build, program and test the VexZero example on a Terasic DE25-Nano.

The board has no serial port. Its only link to a host is the on-board
USB-Blaster, so this runner does not listen for a report -- it reads one. The
design puts fpgacapZero's JTAG-to-AXI bridge on the axiZero crossbar as a
third master, and everything checked below is fetched through that bridge,
across the same interconnect the CPU is using at the time.

Six designs share the flow:

  verdict      the self-test firmware. The host reads the done marker, the
               computed result, the GPIO register, the switches and the
               hardware verdict register, and checks them the same way the
               Arty's hardware does.

  bench        Dhrystone. The host drains the console out of the benchmark
               peripheral's buffer, then re-runs Dhrystone's own self-checks
               on the text and recomputes the score from the cycle count.

  stress_rr    the self test again, but with two saturating self-checking
  stress_wrr   traffic generators loading the crossbar for the whole run --
  stress_qos   one build per arbitration policy -- plus one with the CPU's
  stress_axi3  load/store port routed through AXI3 and back. Each carries the
  stress_ids   AXI4-Stream smoke test as well. stress_ids is the exception:
               its generators vary their ID and split each ID's traffic across
               two on-chip RAMs, so it asks the fabric for AXI4 ordering --
               same-ID responses in issue order, one slave per live ID --
               rather than only for arbitration.

The five stress builds are the same source, the same configurations and the
same checks as the Vivado builds in hw/vivado/arty_a7. They replace the
MicroBlaze wrr, qos, qos_stress, axi3 and axis suites, which were Xilinx-only
and could never have run on this board at all.

Usage:
    python run_vexzero_de25.py                       # verdict: generate, build, run
    python run_vexzero_de25.py --design bench        # Dhrystone instead
    python run_vexzero_de25.py --design stress_qos   # the QoS-arbitrated build
    python run_vexzero_de25.py --design all          # every design bar bench
    python run_vexzero_de25.py --skip-build          # reprogram and re-read only
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

# The stress builds differ only in which arbitration policy they were built
# with, so their entries are generated rather than written out five times.
for _policy in ("rr", "wrr", "qos", "axi3", "ids"):
    DESIGNS[f"stress_{_policy}"] = {
        "top": f"VexZeroStressDe25_{_policy}",
        "netlist": f"VexZeroStressDe25_{_policy}.v",
        "project": f"vexzero_stress_{_policy}_de25",
        "generator": f"vexzero.gen.VexZeroStressDe25Gen {_policy}",
    }

# Everything the self-test path can check. bench is excluded from --design all
# because it is a benchmark rather than a pass/fail test and takes minutes to
# drain.
VERDICT_DESIGNS = ["verdict"] + [f"stress_{p}" for p in ("rr", "wrr", "qos", "axi3", "ids")]

# ── Address map, as the SoC defines it ─────────────────────────────────────
RAM_BASE = 0x8000_0000
GPIO_BASE = 0xF000_0000
SYSCTRL_BASE = 0xF001_0000
BENCH_BASE = 0xF00F_F000

GPIO_LED = GPIO_BASE + 0x00
GPIO_SWITCH = GPIO_BASE + 0x04
SYS_STATUS = SYSCTRL_BASE + 0x08
SYS_RESULT = SYSCTRL_BASE + 0x0C
# The hardware verdict register; see VexZeroSysCtrl in Peripherals.scala.
SYS_VERDICT = SYSCTRL_BASE + 0x10

VERDICT_BUS_VIOLATION = 1 << 0
VERDICT_GEN_OK = 1 << 1
VERDICT_AXIS_OK = 1 << 2
VERDICT_CHECKER_OVERFLOW = 1 << 3
VERDICT_HAS_CHECKERS = 1 << 8
VERDICT_HAS_GENS = 1 << 9
VERDICT_HAS_ISLAND = 1 << 10
VERDICT_GEN_FAULT_SHIFT = 16

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


def read_settled_verdict(axi, observe: float = 5.0, interval: float = 0.5) -> int:
    """Read the verdict word, then keep reading it for `observe` seconds and require it to hold.

    A single read samples the design once, moments after configuration, and calls that the result.
    Every bit in this word is sticky -- a protocol violation, a checker that lost track and a
    generator error all latch and never clear -- so a fault that first appears a second later is
    real, is still being reported, and was simply never looked at. The traffic generators run for as
    long as the board is powered, and the first read is the least traffic they will ever have run.

    Re-reading costs a few seconds of JTAG and turns "it passed when we looked" into "it passed for
    as long as we watched". A word that changes is reported with both values, because which bit
    moved is the whole of the information.
    """
    first = axi.axi_read(SYS_VERDICT)
    deadline = time.time() + observe
    reads = 1
    while time.time() < deadline:
        time.sleep(interval)
        again = axi.axi_read(SYS_VERDICT)
        reads += 1
        if again != first:
            print("  verdict word changed while the board kept running:")
            print(f"    first = 0x{first:08X}")
            print(f"    later = 0x{again:08X}")
            print("    Every bit in this word is sticky, so this is a fault that took longer")
            print("    to appear than the first read took to arrive.")
            return again
    print(f"  verdict word held across {reads} reads over {observe:g}s")
    return first


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

    # The parts of the verdict no firmware value can reach: whether the fabric
    # kept the protocol, whether the traffic generators read back what they
    # wrote, and whether the stream island passed. Each is only reported when
    # the build actually contains it -- a design with no protocol checkers
    # would otherwise "pass" the protocol check by having nobody watching.
    verdict = read_settled_verdict(axi)
    if verdict & VERDICT_HAS_CHECKERS:
        clean = not (verdict & VERDICT_BUS_VIOLATION)
        # Overflow is reported on its own line because it means something
        # different from a rule violation: nothing was seen breaking, and the
        # checker can no longer promise it would have seen it.
        overflowed = bool(verdict & VERDICT_CHECKER_OVERFLOW)
        why = "checker lost track" if overflowed else "violation seen"
        checks.append(("bus protocol", clean, why if not clean else "clean", "clean"))
        checks.append(
            ("checker tracking", not overflowed, "ran out of state", "held every transaction")
        )
    if verdict & VERDICT_HAS_GENS:
        gens_ok = bool(verdict & VERDICT_GEN_OK)
        faults = (verdict >> VERDICT_GEN_FAULT_SHIFT) & 0xFF
        checks.append(("generators", gens_ok, f"fault mask 0x{faults:02X}", "no faults, laps done"))
    if verdict & VERDICT_HAS_ISLAND:
        checks.append(("stream island", bool(verdict & VERDICT_AXIS_OK), "failed", "passed"))

    print()
    print("=" * 50)
    print("  VexZero DE25-Nano -- self test")
    print("=" * 50)
    print(f"  verdict word  = 0x{verdict:08X}")
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
def check_timing(build_dir: Path, design_name: str, allow_failure: bool) -> None:
    """Refuse to read a board result from a build that missed timing.

    Quartus writes a .sof whether or not the design closes, and a board loaded
    with one will usually still boot and report a pass -- setup violations show
    up as occasional wrong bits, not as an obvious halt. Accepting that would
    mean certifying the report rather than the design.

    The slack is recorded by build_vexzero_de25.tcl. A build directory produced
    before this check existed will not have the file; that is reported rather
    than passed over, because "no evidence of a problem" and "evidence of no
    problem" are not the same thing.
    """
    record = build_dir / "vexzero_timing.txt"
    if not record.is_file():
        raise BuildError(
            f"no timing record at {record} -- rebuild with --force-build; "
            "closure cannot be confirmed without it"
        )

    slack = None
    for line in record.read_text().splitlines():
        parts = line.split()
        if len(parts) == 2 and parts[0] == "slack":
            try:
                slack = float(parts[1])
            except ValueError:
                slack = None

    if slack is None:
        raise BuildError(f"no usable setup slack in {record}")

    if slack < 0:
        print(f"  timing        = FAIL (worst setup slack {slack:+.3f} ns)")
        if not allow_failure:
            raise BuildError(
                f"{design_name} does not meet timing (worst setup slack "
                f"{slack:+.3f} ns); the board result from this bitstream is not "
                "evidence and was not read. Re-run with --allow-timing-failure "
                "to program it anyway for debugging."
            )
        print("  (--allow-timing-failure given: continuing, result is not evidence)")
    else:
        print(f"  timing        = PASS (worst setup slack {slack:+.3f} ns)")


def run_one(name: str, args, quartus_sh: Path, quartus_pgm: Path, quartus_stp: Path) -> bool:
    """Build if needed, program, and read one design's verdict off the board."""
    design = DESIGNS[name]
    build_dir = HERE / design["project"]
    sof = build_dir / f"{design['project']}.sof"

    banner(f"design: {name}")

    if not args.skip_build and (args.force_build or not sof.is_file()):
        generate_netlist(design)
        build_bitstream(quartus_sh, name, build_dir)

    if not sof.is_file():
        raise BuildError(f"no bitstream at {sof} -- build it first (drop --skip-build)")

    check_timing(build_dir, name, args.allow_timing_failure)

    program(quartus_pgm, sof)

    transport, axi = open_bridge(quartus_stp)
    try:
        if name == "bench":
            text = drain_console(axi, args.seconds)
            finished = axi.axi_read(BENCH_STATUS) & 1
            exit_code = axi.axi_read(BENCH_EXIT)
            if not finished:
                print("\n  the program had not written its exit register when time ran out")
            return report_bench(text, exit_code) and bool(finished)
        return check_verdict(axi, args.switches)
    finally:
        transport.close()


def main() -> int:
    parser = argparse.ArgumentParser(description=__doc__, formatter_class=argparse.RawDescriptionHelpFormatter)
    parser.add_argument("--design", choices=sorted(DESIGNS) + ["all"], default="verdict")
    parser.add_argument(
        "--allow-timing-failure",
        action="store_true",
        help="Program and read a bitstream that misses timing. For debugging a "
        "failing path only: the board result it produces is not evidence.",
    )
    parser.add_argument("--skip-build", action="store_true", help="reprogram and re-read only")
    parser.add_argument("--force-build", action="store_true", help="rebuild even if a bitstream exists")
    parser.add_argument("--seconds", type=float, default=60.0, help="how long to drain the console")
    parser.add_argument("--switches", type=lambda v: int(v, 0), default=None,
                        help="switch nibble to expect, e.g. 0xF")
    args = parser.parse_args()

    names = VERDICT_DESIGNS if args.design == "all" else [args.design]

    print(f"VexZero on DE25-Nano -- {', '.join(names)}")

    if not (FCAPZ / "rtl" / "fcapz_ejtagaxi_intel.v").is_file():
        print("[error] the fpgacapZero submodule is missing.")
        print("        run: git submodule update --init fcapz")
        return 2

    try:
        quartus_sh, quartus_stp = find_quartus()
        quartus_pgm = quartus_sh.with_name(quartus_sh.name.replace("quartus_sh", "quartus_pgm"))
        print(f"  quartus_sh : {quartus_sh}")
        print(f"  quartus_stp: {quartus_stp}")

        all_ok = True
        for name in names:
            ok = run_one(name, args, quartus_sh, quartus_pgm, quartus_stp)
            all_ok = all_ok and ok
        return 0 if all_ok else 1

    except BuildError as exc:
        print(f"[error] {exc}")
        return 2


if __name__ == "__main__":
    raise SystemExit(main())
