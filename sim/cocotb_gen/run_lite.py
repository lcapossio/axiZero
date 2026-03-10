# Copyright (c) 2026 Leonardo Capossio — bard0 design  hello@bard0.com
# SPDX-License-Identifier: MIT
"""
run_lite.py  —  Python runner for cocotb tests against MyLite_1M4S.v

Usage (from WSL):
    python run_lite.py

Requires: cocotb, cocotbext-axi, verilator
"""

import pathlib
import sys
from cocotb.runner import get_runner

REPO_ROOT = pathlib.Path(__file__).resolve().parent.parent.parent
RTL_FILE  = REPO_ROOT / "generated" / "MyLite_1M4S.v"
TEST_DIR  = pathlib.Path(__file__).resolve().parent / "lite"

BUILD_ARGS = [
    "--trace", "--trace-structs",
    "-Wno-WIDTHTRUNC", "-Wno-WIDTHEXPAND",
    "-Wno-UNSIGNED", "-Wno-CMPCONST",
]


def main():
    runner = get_runner("verilator")
    runner.build(
        verilog_sources=[RTL_FILE],
        hdl_toplevel="AxiZeroLiteTop",
        build_args=BUILD_ARGS,
        build_dir=TEST_DIR / "sim_build",
        always=True,
    )
    rc = runner.test(
        hdl_toplevel="AxiZeroLiteTop",
        test_module="test_lite",
        test_dir=TEST_DIR,
        build_dir=TEST_DIR / "sim_build",
        results_xml=str(TEST_DIR / "results.xml"),
    )
    sys.exit(0 if rc == 0 else 1)


if __name__ == "__main__":
    main()
