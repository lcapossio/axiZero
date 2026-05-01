# Copyright (c) 2026 Leonardo Capossio — bard0 design  hello@bard0.com
# SPDX-License-Identifier: MIT
"""
run_all.py  —  Run all cocotb_gen test suites against generated Verilog.

Usage (from WSL):
    python run_all.py             # run all suites
    python run_all.py lite        # run lite only
    python run_all.py full        # run full only
    python run_all.py axis        # generate and test AXI4-Stream cores

Requires: cocotb, cocotbext-axi, verilator
"""

import pathlib
import shutil
import subprocess
import sys
import textwrap
import xml.etree.ElementTree as ET
from cocotb.runner import get_runner

REPO_ROOT = pathlib.Path(__file__).resolve().parent.parent.parent
HERE      = pathlib.Path(__file__).resolve().parent

BUILD_ARGS = [
    "--trace", "--trace-structs",
    "-Wno-WIDTHTRUNC", "-Wno-WIDTHEXPAND",
    "-Wno-UNSIGNED", "-Wno-CMPCONST",
]

AXIS_SMOKE_YAML = textwrap.dedent("""\
    designs:
      - name: SmokeAxisRegSlice
        kind: axis
        core: reg_slice
        data_width: 32
        use_keep: true
        use_last: true

      - name: SmokeAxisWidth_8To32
        kind: axis
        core: width_adapter
        input_data_width: 8
        output_data_width: 32
        use_keep: true
        use_last: true

      - name: SmokeAxisFifo
        kind: axis
        core: fifo
        data_width: 32
        depth: 8
        use_keep: true
        use_last: true

      - name: SmokeAxisMux_2To1
        kind: axis
        core: arb_mux
        data_width: 32
        inputs: 2
        arbitration: round_robin
        use_keep: true
        use_last: true

      - name: SmokeAxisDemux_1To2
        kind: axis
        core: demux
        data_width: 32
        outputs: 2
        use_keep: true
        use_last: true

      - name: SmokeAxisBroadcaster_1To2
        kind: axis
        core: broadcaster
        data_width: 32
        outputs: 2
        use_keep: true
        use_last: true
""")

AXIS_RUNS = {
    "axis_reg_slice": {
        "rtl_name": "SmokeAxisRegSlice",
        "toplevel": "AxiStreamRegSlice",
        "module": "test_axis_reg_slice",
    },
    "axis_width": {
        "rtl_name": "SmokeAxisWidth_8To32",
        "toplevel": "AxiStreamWidthAdapter",
        "module": "test_axis_width",
    },
    "axis_fifo": {
        "rtl_name": "SmokeAxisFifo",
        "toplevel": "AxiStreamFifo",
        "module": "test_axis_fifo",
    },
    "axis_mux": {
        "rtl_name": "SmokeAxisMux_2To1",
        "toplevel": "AxiStreamArbMux",
        "module": "test_axis_mux",
    },
    "axis_demux": {
        "rtl_name": "SmokeAxisDemux_1To2",
        "toplevel": "AxiStreamDemux",
        "module": "test_axis_demux",
    },
    "axis_broadcast": {
        "rtl_name": "SmokeAxisBroadcaster_1To2",
        "toplevel": "AxisBroadcastWrapper",
        "module": "test_axis_broadcast",
        "extra_sources": [HERE / "axis" / "axis_broadcast_wrapper.v"],
    },
}

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
    "qos": {
        "rtl":      REPO_ROOT / "generated" / "MyFull_2M2S_QoS.v",
        "toplevel": "AxiZeroMixedTop",
        "module":   "test_qos",
        "test_dir": HERE / "qos",
    },
    "ipif": {
        "rtl":      REPO_ROOT / "generated" / "MyLite_1M4S.v",
        "toplevel": "AxiZeroLiteTop",
        "module":   "test_ipif",
        "test_dir": HERE / "ipif",
    },
    "axis": {
        "axis": True,
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


def generate_axis_rtl():
    axis_tmp = REPO_ROOT / "tmp" / "axis_regression"
    rtl_dir = axis_tmp / "rtl"
    config_path = axis_tmp / "config.yaml"

    axis_tmp.mkdir(parents=True, exist_ok=True)
    if rtl_dir.exists():
        shutil.rmtree(rtl_dir)
    rtl_dir.mkdir(parents=True, exist_ok=True)
    config_path.write_text(AXIS_SMOKE_YAML, encoding="utf-8")

    cmd = [
        sys.executable,
        str(REPO_ROOT / "scripts" / "axizero.py"),
        "generate",
        str(config_path),
        "--output",
        str(rtl_dir),
    ]
    subprocess.run(cmd, cwd=REPO_ROOT, check=True)

    for cfg in AXIS_RUNS.values():
        generated = REPO_ROOT / "generated" / f"{cfg['rtl_name']}.v"
        if generated.exists():
            generated.unlink()
    return rtl_dir


def run_axis_suite():
    print(f"\n{'='*60}")
    print("  Suite: axis  (generated AXI4-Stream cores)")
    print(f"{'='*60}")

    rtl_dir = generate_axis_rtl()
    test_dir = HERE / "axis"
    results = []

    for name, cfg in AXIS_RUNS.items():
        rtl = rtl_dir / f"{cfg['rtl_name']}.v"
        if not rtl.exists():
            raise FileNotFoundError(f"expected generated AXIS RTL not found: {rtl}")

        runner = get_runner("verilator")
        build_dir = test_dir / f"sim_build_{cfg['rtl_name']}"
        if build_dir.exists():
            shutil.rmtree(build_dir)

        results_xml = test_dir / f"results_{cfg['rtl_name']}.xml"
        verilog_sources = [rtl] + cfg.get("extra_sources", [])
        runner.build(
            verilog_sources=verilog_sources,
            hdl_toplevel=cfg["toplevel"],
            build_args=BUILD_ARGS,
            build_dir=build_dir,
            always=True,
        )
        runner.test(
            hdl_toplevel=cfg["toplevel"],
            test_module=cfg["module"],
            test_dir=test_dir,
            build_dir=build_dir,
            results_xml=str(results_xml),
        )
        results.append(parse_results(results_xml))

    passed = sum(item[0] for item in results)
    failed = sum(item[1] for item in results)
    total = sum(item[2] for item in results)
    return passed, failed, total


def main():
    requested = sys.argv[1:] or list(SUITES.keys())
    unknown = [s for s in requested if s not in SUITES]
    if unknown:
        print(f"Unknown suite(s): {unknown}. Valid: {list(SUITES)}")
        sys.exit(1)

    results = {}
    for name in requested:
        if SUITES[name].get("axis"):
            results[name] = run_axis_suite()
        else:
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
