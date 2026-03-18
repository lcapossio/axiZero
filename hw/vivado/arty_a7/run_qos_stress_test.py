#!/usr/bin/env python3
# Copyright (c) 2026 Leonardo Capossio - bard0 design  hello@bard0.com
# SPDX-License-Identifier: MIT
"""
run_qos_stress_test.py - Build, program, and run the QoS hardware stress test on Arty A7-100T.

Steps:
  1. Vivado: create project + synth + impl + bitstream  (create_project_qos_stress.tcl)
  2. mb-gcc: compile main_qos_stress.c -> main_qos_stress_le.elf
  3. xsdb:   program bitstream + ELF, monitor 10 minutes for fail/stuck
"""

import pathlib
import subprocess
import sys

from find_xilinx_tools import require_tools

# Paths
SCRIPT_DIR = pathlib.Path(__file__).resolve().parent
REPO_ROOT = SCRIPT_DIR / ".." / ".." / ".."
SW_DIR = REPO_ROOT / "sw" / "arty_a7"
SRC_DIR = SW_DIR / "src"

VIVADO_BIN, XSDB_BIN, MBGCC_BIN = require_tools()

PROJ_DIR = SCRIPT_DIR / "axizero_arty_qos_stress"
BIT_FILE = PROJ_DIR / "axizero_arty_qos_stress.runs" / "impl_1" / "system_wrapper.bit"
ELF_FILE = SW_DIR / "build" / "main_qos_stress_le.elf"

CREATE_TCL = SCRIPT_DIR / "create_project_qos_stress.tcl"
RUN_SECONDS = 10 * 60
POLL_SECONDS = 5
STUCK_SECONDS = 30


def run(cmd, cwd=None, timeout=None, desc=""):
    """Run a command, streaming output."""
    print(f"\n{'='*60}")
    print(f"  {desc}")
    print(f"  cmd: {' '.join(str(c) for c in cmd)}")
    print(f"{'='*60}\n")
    result = subprocess.run(
        [str(c) for c in cmd],
        cwd=str(cwd) if cwd else None,
        timeout=timeout,
    )
    if result.returncode != 0:
        print(f"\n*** FAILED (rc={result.returncode}): {desc}")
        sys.exit(result.returncode)
    return result


def step_vivado():
    """Run create_project_qos_stress.tcl through Vivado batch mode."""
    if BIT_FILE.exists():
        print(f"[skip] Bitstream already exists: {BIT_FILE}")
        return
    run(
        [VIVADO_BIN, "-mode", "batch", "-source", str(CREATE_TCL)],
        cwd=REPO_ROOT,
        timeout=3600,
        desc="Vivado: create project + synth + impl + bitstream",
    )
    if not BIT_FILE.exists():
        print(f"*** ERROR: bitstream not found at {BIT_FILE}")
        sys.exit(1)
    print(f"[ok] Bitstream: {BIT_FILE}")


def step_compile():
    """Compile main_qos_stress.c with mb-gcc."""
    ELF_FILE.parent.mkdir(parents=True, exist_ok=True)
    run(
        [
            MBGCC_BIN,
            "-O2", "-mlittle-endian", "-mxl-soft-mul",
            "-nostdlib",
            "-I", str(SRC_DIR),
            str(SRC_DIR / "crt0.S"),
            str(SRC_DIR / "main_qos_stress.c"),
            "-T", str(SRC_DIR / "arty.ld"),
            "-lgcc",
            "-o", str(ELF_FILE),
        ],
        cwd=SW_DIR,
        timeout=60,
        desc="mb-gcc: compile main_qos_stress_le.elf",
    )
    print(f"[ok] ELF: {ELF_FILE}  ({ELF_FILE.stat().st_size} bytes)")


def find_symbols():
    """Extract monitor symbol addresses from the ELF using mb-nm."""
    nm_bin = MBGCC_BIN.parent / ("mb-nm.exe" if sys.platform == "win32" else "mb-nm")
    result = subprocess.run(
        [str(nm_bin), str(ELF_FILE)],
        capture_output=True, text=True, timeout=10,
    )
    addrs = {}
    for line in result.stdout.splitlines():
        parts = line.split()
        if len(parts) >= 3:
            name = parts[2]
            if name in ("g_fail", "g_pass", "g_heartbeat", "g_iteration",
                        "g_fail_test", "g_fail_got", "g_fail_exp",
                        "g_probe_gpio", "g_probe_g0", "g_probe_g1", "g_probe_g2"):
                addrs[name] = int(parts[0], 16)

    required = ("g_fail", "g_pass", "g_heartbeat", "g_iteration",
                "g_fail_test", "g_fail_got", "g_fail_exp",
                "g_probe_gpio", "g_probe_g0", "g_probe_g1", "g_probe_g2")
    if any(name not in addrs for name in required):
        print("*** Could not find required monitor symbols in ELF")
        print("    nm output (last 20 lines):\n")
        for line in result.stdout.splitlines()[-20:]:
            print(f"    {line}")
        sys.exit(1)

    print(
        "[ok] symbols: "
        f"g_fail @ 0x{addrs['g_fail']:08X}, "
        f"g_pass @ 0x{addrs['g_pass']:08X}, "
        f"g_heartbeat @ 0x{addrs['g_heartbeat']:08X}, "
        f"g_iteration @ 0x{addrs['g_iteration']:08X}, "
        f"g_fail_test @ 0x{addrs['g_fail_test']:08X}, "
        f"g_fail_got @ 0x{addrs['g_fail_got']:08X}, "
        f"g_fail_exp @ 0x{addrs['g_fail_exp']:08X}, "
        f"probes @ gpio=0x{addrs['g_probe_gpio']:08X} g0=0x{addrs['g_probe_g0']:08X} g1=0x{addrs['g_probe_g1']:08X} g2=0x{addrs['g_probe_g2']:08X}"
    )
    return addrs


def step_run(addrs):
    """Program the Arty A7 and monitor for continuous run errors/stalls."""
    g_fail_addr = addrs["g_fail"]
    g_pass_addr = addrs["g_pass"]
    g_heartbeat_addr = addrs["g_heartbeat"]
    g_iteration_addr = addrs["g_iteration"]
    g_fail_test_addr = addrs["g_fail_test"]
    g_fail_got_addr = addrs["g_fail_got"]
    g_fail_exp_addr = addrs["g_fail_exp"]
    g_probe_gpio_addr = addrs["g_probe_gpio"]
    g_probe_g0_addr = addrs["g_probe_g0"]
    g_probe_g1_addr = addrs["g_probe_g1"]
    g_probe_g2_addr = addrs["g_probe_g2"]

    poll_ms = POLL_SECONDS * 1000
    run_ms = RUN_SECONDS * 1000
    stuck_polls = max(1, STUCK_SECONDS // POLL_SECONDS)

    xsdb_tcl = SCRIPT_DIR / "_qos_stress_xsdb_temp.tcl"
    xsdb_tcl.write_text(f"""\
# Auto-generated by run_qos_stress_test.py
connect
after 500
fpga {str(BIT_FILE).replace(chr(92), '/')}
after 1000

# Target MicroBlaze #0 (not the Debug Module)
targets -set -filter {{name =~ "MicroBlaze #0"}}
after 200

# Reset and download ELF
rst -processor
after 200
dow {str(ELF_FILE).replace(chr(92), '/')}
after 200
con

set fail_addr      0x{g_fail_addr:08X}
set pass_addr      0x{g_pass_addr:08X}
set heartbeat_addr 0x{g_heartbeat_addr:08X}
set iter_addr      0x{g_iteration_addr:08X}
set ftest_addr     0x{g_fail_test_addr:08X}
set fgot_addr      0x{g_fail_got_addr:08X}
set fexp_addr      0x{g_fail_exp_addr:08X}
set pgpio_addr     0x{g_probe_gpio_addr:08X}
set pg0_addr       0x{g_probe_g0_addr:08X}
set pg1_addr       0x{g_probe_g1_addr:08X}
set pg2_addr       0x{g_probe_g2_addr:08X}

set poll_ms     {poll_ms}
set run_ms      {run_ms}
set stuck_polls {stuck_polls}

set status "PASS"
set start_ms [clock milliseconds]
set last_hb [mrd -value $heartbeat_addr]
set stuck_count 0

puts "\nMonitoring stress run for {RUN_SECONDS}s (poll={POLL_SECONDS}s, stuck={STUCK_SECONDS}s)..."

while {{([clock milliseconds] - $start_ms) < $run_ms}} {{
    after $poll_ms
    set fail_val [mrd -value $fail_addr]
    set pass_val [mrd -value $pass_addr]
    set hb_val   [mrd -value $heartbeat_addr]
    set it_val   [mrd -value $iter_addr]
    set elapsed  [expr {{([clock milliseconds] - $start_ms) / 1000}}]

    puts [format "  t=%4ds  iter=%d  hb=%d  pass=%d  fail=%d" $elapsed $it_val $hb_val $pass_val $fail_val]

    if {{$fail_val != 0}} {{
        set status "FAIL_ERROR"
        break
    }}

    if {{$hb_val == $last_hb}} {{
        incr stuck_count
    }} else {{
        set stuck_count 0
        set last_hb $hb_val
    }}

    if {{$stuck_count >= $stuck_polls}} {{
        set status "FAIL_STUCK"
        break
    }}
}}

rst -processor
after 300

set fail_end [mrd -value $fail_addr]
set pass_end [mrd -value $pass_addr]
set hb_end   [mrd -value $heartbeat_addr]
set it_end   [mrd -value $iter_addr]

if {{$it_end == 0 && $status == "PASS"}} {{
    set status "FAIL_NO_PROGRESS"
}}

puts "\n=========================================="
puts "  QoS Stress HW Test Results"
puts "=========================================="
puts "  status      = $status"
puts "  g_iteration = $it_end   (@ 0x{g_iteration_addr:08X})"
puts "  g_heartbeat = $hb_end   (@ 0x{g_heartbeat_addr:08X})"
puts "  g_pass      = $pass_end (@ 0x{g_pass_addr:08X})"
puts "  g_fail      = $fail_end (@ 0x{g_fail_addr:08X})"

set ftest_val [mrd -value $ftest_addr]
set fgot_val  [mrd -value $fgot_addr]
set fexp_val  [mrd -value $fexp_addr]
puts "  fail_test   = $ftest_val (1=T1a 2=T1b 3=T2prog 4/5/6=sent 7=MB 8=G0 9=G1 10=GPIO 11=G2mix)"
puts [format "  fail_got    = 0x%08X" $fgot_val]
puts [format "  fail_exp    = 0x%08X" $fexp_val]
set pgpio_val [mrd -value $pgpio_addr]
set pg0_val   [mrd -value $pg0_addr]
set pg1_val   [mrd -value $pg1_addr]
set pg2_val   [mrd -value $pg2_addr]
puts "  --- generator probes (after 1M-cycle delay) ---"
puts [format "  probe_gpio  = 0x%08X (expect 0x0000000E)" $pgpio_val]
puts [format "  probe_g0    = 0x%08X (expect 0xB1000000)" $pg0_val]
puts [format "  probe_g1    = 0x%08X (expect 0xB20001FF)" $pg1_val]
puts [format "  probe_g2    = 0x%08X (expect 0xB3005502)" $pg2_val]
puts "=========================================="
puts "RESULT=$status"
puts ""

disconnect
exit
""", encoding="utf-8")

    print(f"\n{'='*60}")
    print("  xsdb: program + monitor continuous stress run")
    print(f"  cmd: {XSDB_BIN} {xsdb_tcl}")
    print(f"{'='*60}\n")

    result = subprocess.run(
        [str(XSDB_BIN), str(xsdb_tcl)],
        cwd=str(SCRIPT_DIR),
        capture_output=True,
        text=True,
        timeout=RUN_SECONDS + 300,
    )

    if result.stdout:
        print(result.stdout)
    if result.stderr:
        print(result.stderr, file=sys.stderr)

    if result.returncode != 0:
        print(f"*** FAILED (rc={result.returncode}): xsdb run")
        xsdb_tcl.unlink(missing_ok=True)
        sys.exit(result.returncode)

    xsdb_tcl.unlink(missing_ok=True)

    if "RESULT=PASS" not in result.stdout:
        print("*** FAILED: stress monitor reported failure/stall")
        sys.exit(1)


def main():
    print("axiZero QoS hardware stress test - Arty A7-100T")
    print(f"  Vivado:  {VIVADO_BIN}")
    print(f"  mb-gcc:  {MBGCC_BIN}")
    print(f"  xsdb:    {XSDB_BIN}")
    print(f"  monitor: {RUN_SECONDS}s total, poll {POLL_SECONDS}s, stuck {STUCK_SECONDS}s")
    print()

    step_vivado()
    step_compile()
    addrs = find_symbols()
    step_run(addrs)


if __name__ == "__main__":
    main()
