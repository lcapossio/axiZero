# Copyright (c) 2026 Leonardo Capossio — bard0 design  hello@bard0.com
# SPDX-License-Identifier: MIT
"""
run_all.py  —  Run all cocotb_gen test suites against generated Verilog.

Usage (from WSL):
    python run_all.py             # run lite + full
    python run_all.py lite        # run lite only
    python run_all.py full        # run full only

Requires: cocotb, cocotbext-axi, verilator
"""

import pathlib
import sys
import xml.etree.ElementTree as ET
from cocotb.runner import get_runner

REPO_ROOT = pathlib.Path(__file__).resolve().parent.parent.parent
HERE      = pathlib.Path(__file__).resolve().parent

BUILD_ARGS = [
    "--trace", "--trace-structs",
    "-Wno-WIDTHTRUNC", "-Wno-WIDTHEXPAND",
    "-Wno-UNSIGNED", "-Wno-CMPCONST",
]

SUITES = {
    "lite": {
        "rtl":      REPO_ROOT / "generated" / "MyLite_1M4S.v",
        "toplevel": "AxiZeroLiteTop",
        "module":   "test_lite",
        "test_dir": HERE / "lite",
    },
    "full": {
        "rtl":      REPO_ROOT / "generated" / "MyFull_2M2S.v",
        "toplevel": "AxiZeroMixedTop",
        "module":   "test_full",
        "test_dir": HERE / "full",
    },
    "wrr": {
        "rtl":      REPO_ROOT / "generated" / "MyLite_2M2S_WRR.v",
        "toplevel": "AxiZeroLiteTop",
        "module":   "test_wrr",
        "test_dir": HERE / "wrr",
    },
}


def parse_results(xml_path):
    """Return (passed, failed, total) from a cocotb results XML file.

    cocotb XML: <testsuites> → <testsuite> → <testcase [<failure/>]>
    A testcase has failed if it contains a <failure> or <error> child element.
    """
    try:
        tree = ET.parse(xml_path)
        testcases = tree.findall(".//testcase")
        total   = len(testcases)
        failed  = sum(1 for tc in testcases if tc.find("failure") is not None
                                            or tc.find("error")   is not None)
        passed  = total - failed
        return passed, failed, total
    except Exception:
        return 0, 1, 1  # treat parse failure as test failure


def run_suite(name, cfg):
    print(f"\n{'='*60}")
    print(f"  Suite: {name}  ({cfg['rtl'].name})")
    print(f"{'='*60}")
    runner = get_runner("verilator")
    build_dir = cfg["test_dir"] / "sim_build"
    results_xml = cfg["test_dir"] / "results.xml"
    runner.build(
        verilog_sources=[cfg["rtl"]],
        hdl_toplevel=cfg["toplevel"],
        build_args=BUILD_ARGS,
        build_dir=build_dir,
        always=True,
    )
    runner.test(
        hdl_toplevel=cfg["toplevel"],
        test_module=cfg["module"],
        test_dir=cfg["test_dir"],
        build_dir=build_dir,
        results_xml=str(results_xml),
    )
    return parse_results(results_xml)


def main():
    requested = sys.argv[1:] or list(SUITES.keys())
    unknown = [s for s in requested if s not in SUITES]
    if unknown:
        print(f"Unknown suite(s): {unknown}. Valid: {list(SUITES)}")
        sys.exit(1)

    results = {}
    for name in requested:
        results[name] = run_suite(name, SUITES[name])

    print(f"\n{'='*60}")
    print("  Results")
    print(f"{'='*60}")
    all_pass = True
    for name, (passed, failed, total) in results.items():
        status = "PASS" if failed == 0 else "FAIL"
        print(f"  {name:10s}  {status}  ({passed}/{total} tests)")
        if failed > 0:
            all_pass = False

    sys.exit(0 if all_pass else 1)


if __name__ == "__main__":
    main()
