#!/usr/bin/env python3
# Copyright (c) 2026 Leonardo Capossio - bard0 design  hello@bard0.com
# SPDX-License-Identifier: MIT
"""Build, program, and run the AXI4-Stream smoke HW test on Arty A7-100T."""

import os
import pathlib
import shutil
import subprocess
import sys

from find_xilinx_tools import require_tools

SCRIPT_DIR = pathlib.Path(__file__).resolve().parent
REPO_ROOT = SCRIPT_DIR / ".." / ".." / ".."
SW_DIR = REPO_ROOT / "sw" / "arty_a7"
SRC_DIR = SW_DIR / "src"

VIVADO_BIN, XSDB_BIN, MBGCC_BIN = require_tools()

PROJ_DIR = SCRIPT_DIR / "axizero_arty_axis"
BIT_FILE = PROJ_DIR / "axizero_arty_axis.runs" / "impl_1" / "system_wrapper.bit"
ELF_FILE = SW_DIR / "build" / "main_axis_le.elf"

CREATE_TCL = SCRIPT_DIR / "create_project_axis.tcl"


def run(cmd, cwd=None, timeout=None, desc="", env=None):
    print(f"\n{'=' * 60}")
    print(f"  {desc}")
    print(f"  cmd: {' '.join(str(c) for c in cmd)}")
    print(f"{'=' * 60}\n")
    result = subprocess.run(
        [str(c) for c in cmd],
        cwd=str(cwd) if cwd else None,
        timeout=timeout,
        env=env,
    )
    if result.returncode != 0:
        print(f"\n*** FAILED (rc={result.returncode}): {desc}")
        sys.exit(result.returncode)
    return result


def run_capture(cmd, cwd=None, timeout=None, desc="", env=None):
    print(f"\n{'=' * 60}")
    print(f"  {desc}")
    print(f"  cmd: {' '.join(str(c) for c in cmd)}")
    print(f"{'=' * 60}\n")
    result = subprocess.run(
        [str(c) for c in cmd],
        cwd=str(cwd) if cwd else None,
        timeout=timeout,
        env=env,
        text=True,
        stdout=subprocess.PIPE,
        stderr=subprocess.STDOUT,
    )
    print(result.stdout)
    if result.returncode != 0:
        print(f"\n*** FAILED (rc={result.returncode}): {desc}")
        sys.exit(result.returncode)
    return result.stdout


def wsl_path(path):
    resolved = pathlib.Path(path).resolve()
    drive = resolved.drive.rstrip(":").lower()
    rest = resolved.relative_to(resolved.anchor).as_posix()
    return f"/mnt/{drive}/{rest}"


def step_generate_rtl():
    sbt = os.environ.get("SBT_BIN") or shutil.which("sbt") or shutil.which("sbt.bat")
    if sbt:
        cmd = [sbt, "runMain axizero.gen.ArtyAxisDutGen"]
        cwd = REPO_ROOT
    elif sys.platform == "win32" and shutil.which("wsl"):
        cmd = [
            "wsl",
            "-e",
            "bash",
            "-lc",
            f"cd {wsl_path(REPO_ROOT)} && sbt 'runMain axizero.gen.ArtyAxisDutGen'",
        ]
        cwd = REPO_ROOT
    else:
        print("*** ERROR: sbt not found. Set SBT_BIN or install sbt on PATH.")
        sys.exit(1)

    run(
        cmd,
        cwd=cwd,
        timeout=600,
        desc="sbt: generate Arty AXIS RTL",
    )
    run(
        [sys.executable, str(SCRIPT_DIR / "rename_axis_ports.py")],
        cwd=REPO_ROOT,
        timeout=30,
        desc="rename Spinal ports for Vivado BD",
    )


def step_vivado():
    if BIT_FILE.exists():
        print(f"[skip] Bitstream already exists: {BIT_FILE}")
        return
    env = dict(os.environ)
    if sys.platform == "win32":
        for name in ("HOME", "USERPROFILE", "APPDATA", "LOCALAPPDATA", "TEMP", "TMP"):
            env[name] = ".vivado_user"
    elif "HOME" in env and env["HOME"].startswith("/"):
        env["HOME"] = str(pathlib.Path.home())
    (REPO_ROOT / ".vivado_user").mkdir(exist_ok=True)
    run(
        [VIVADO_BIN, "-mode", "batch", "-source", str(CREATE_TCL)],
        cwd=REPO_ROOT,
        timeout=3600,
        desc="Vivado: create project + synth + impl + bitstream",
        env=env,
    )
    if not BIT_FILE.exists():
        print(f"*** ERROR: bitstream not found at {BIT_FILE}")
        sys.exit(1)
    print(f"[ok] Bitstream: {BIT_FILE}")


def step_compile():
    ELF_FILE.parent.mkdir(parents=True, exist_ok=True)
    run(
        [
            MBGCC_BIN,
            "-O2",
            "-mlittle-endian",
            "-mxl-soft-mul",
            "-nostdlib",
            "-I",
            str(SRC_DIR),
            str(SRC_DIR / "crt0.S"),
            str(SRC_DIR / "main_axis.c"),
            "-T",
            str(SRC_DIR / "arty.ld"),
            "-lgcc",
            "-o",
            str(ELF_FILE),
        ],
        cwd=SW_DIR,
        timeout=60,
        desc="mb-gcc: compile main_axis_le.elf",
    )
    print(f"[ok] ELF: {ELF_FILE} ({ELF_FILE.stat().st_size} bytes)")


def find_symbols():
    nm_bin = MBGCC_BIN.parent / ("mb-nm.exe" if sys.platform == "win32" else "mb-nm")
    result = subprocess.run([str(nm_bin), str(ELF_FILE)], capture_output=True, text=True, timeout=10)
    addrs = {}
    for line in result.stdout.splitlines():
        parts = line.split()
        if len(parts) >= 3 and parts[2] in ("g_fail", "g_pass", "g_axis_status"):
            addrs[parts[2]] = int(parts[0], 16)
    missing = {"g_fail", "g_pass", "g_axis_status"} - set(addrs)
    if missing:
        print(f"*** Could not find ELF symbols: {', '.join(sorted(missing))}")
        for line in result.stdout.splitlines()[-20:]:
            print(f"    {line}")
        sys.exit(1)
    print(
        f"[ok] g_fail @ 0x{addrs['g_fail']:08X}, "
        f"g_pass @ 0x{addrs['g_pass']:08X}, "
        f"g_axis_status @ 0x{addrs['g_axis_status']:08X}"
    )
    return addrs


def step_run(addrs):
    xsdb_tcl = SCRIPT_DIR / "_axis_xsdb_temp.tcl"
    xsdb_tcl.write_text(
        f"""\
# Auto-generated by run_axis_test.py
connect
after 500
targets -set -filter {{name =~ "xc7a100t*"}}
after 200
fpga {str(BIT_FILE).replace(chr(92), '/')}
after 1000

targets -set -filter {{name =~ "MicroBlaze #0"}}
after 200

rst -processor
after 200
dow {str(ELF_FILE).replace(chr(92), '/')}
after 200
con

puts "\\nWaiting 12s for AXIS smoke test completion..."
after 12000

rst -processor
after 500

set fail_val [mrd -value 0x{addrs['g_fail']:08X}]
set pass_val [mrd -value 0x{addrs['g_pass']:08X}]
set axis_val [mrd -value 0x{addrs['g_axis_status']:08X}]
set axis_hex [format "%08X" $axis_val]

puts "\\n=========================================="
puts "  AXI4-Stream HW Smoke Test Results"
puts "=========================================="
puts "  g_fail        = $fail_val (@ 0x{addrs['g_fail']:08X})"
puts "  g_pass        = $pass_val (@ 0x{addrs['g_pass']:08X})"
puts "  g_axis_status = 0x$axis_hex (@ 0x{addrs['g_axis_status']:08X})"
puts "=========================================="

if {{$fail_val == 0 && $pass_val == 1}} {{
    puts "  *** ALL AXIS HW TESTS PASSED ***"
}} else {{
    puts "  *** AXIS HW FAILURES DETECTED ***"
}}
puts ""

disconnect
exit
""",
        encoding="utf-8",
    )

    try:
        output = run_capture(
            [XSDB_BIN, str(xsdb_tcl)],
            cwd=SCRIPT_DIR,
            timeout=120,
            desc="xsdb: program + run + read results",
        )
    finally:
        xsdb_tcl.unlink(missing_ok=True)

    if "no targets found" in output or "AXIS HW FAILURES DETECTED" in output:
        print("\n*** FAILED: AXIS hardware test did not pass")
        sys.exit(1)
    if "*** ALL AXIS HW TESTS PASSED ***" not in output:
        print("\n*** FAILED: AXIS hardware pass banner was not observed")
        sys.exit(1)


def main():
    print("axiZero AXI4-Stream hardware smoke test -- Arty A7-100T")
    print(f"  Vivado: {VIVADO_BIN}")
    print(f"  mb-gcc: {MBGCC_BIN}")
    print(f"  xsdb:   {XSDB_BIN}")
    print()

    step_generate_rtl()
    step_vivado()
    step_compile()
    step_run(find_symbols())


if __name__ == "__main__":
    main()
