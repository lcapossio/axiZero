#!/usr/bin/env python3
# Copyright (c) 2026 Leonardo Capossio — bard0 design  hello@bard0.com
# SPDX-License-Identifier: MIT
"""Rename SpinalHDL io_* ports in AxiZeroArtyQosDUT.v to AXI-standard names."""

import re
import pathlib

HERE = pathlib.Path(__file__).resolve().parent
V_FILE = HERE / "ip" / "rtl" / "AxiZeroArtyQosDUT.v"

# SpinalHDL channel/signal → AXI standard signal name
SPINAL_MAP = {
    ("aw", "valid"):        "awvalid",
    ("aw", "ready"):        "awready",
    ("aw", "payload_addr"): "awaddr",
    ("aw", "payload_id"):   "awid",
    ("aw", "payload_region"): "awregion",
    ("aw", "payload_len"):  "awlen",
    ("aw", "payload_size"): "awsize",
    ("aw", "payload_burst"): "awburst",
    ("aw", "payload_lock"): "awlock",
    ("aw", "payload_cache"): "awcache",
    ("aw", "payload_qos"):  "awqos",
    ("aw", "payload_prot"): "awprot",
    ("w",  "valid"):        "wvalid",
    ("w",  "ready"):        "wready",
    ("w",  "payload_data"): "wdata",
    ("w",  "payload_strb"): "wstrb",
    ("w",  "payload_last"): "wlast",
    ("b",  "valid"):        "bvalid",
    ("b",  "ready"):        "bready",
    ("b",  "payload_id"):   "bid",
    ("b",  "payload_resp"): "bresp",
    ("ar", "valid"):        "arvalid",
    ("ar", "ready"):        "arready",
    ("ar", "payload_addr"): "araddr",
    ("ar", "payload_id"):   "arid",
    ("ar", "payload_region"): "arregion",
    ("ar", "payload_len"):  "arlen",
    ("ar", "payload_size"): "arsize",
    ("ar", "payload_burst"): "arburst",
    ("ar", "payload_lock"): "arlock",
    ("ar", "payload_cache"): "arcache",
    ("ar", "payload_qos"):  "arqos",
    ("ar", "payload_prot"): "arprot",
    ("r",  "valid"):        "rvalid",
    ("r",  "ready"):        "rready",
    ("r",  "payload_data"): "rdata",
    ("r",  "payload_id"):   "rid",
    ("r",  "payload_resp"): "rresp",
    ("r",  "payload_last"): "rlast",
}

IO_RE = re.compile(r'io_(masters|slaves)_(\d+)_(\w+?)_(\w+)')

def rename(m):
    side, idx, channel, signal = m.group(1), m.group(2), m.group(3), m.group(4)
    axi_sig = SPINAL_MAP.get((channel, signal))
    if axi_sig is None:
        return m.group(0)
    prefix = "s" if side == "masters" else "m"
    return f"{prefix}{idx}_axi_{axi_sig}"

text = V_FILE.read_text(encoding="utf-8")
renamed = IO_RE.sub(rename, text)
renamed = re.sub(r'\bclk\b', 'aclk', renamed)
renamed = re.sub(r'\bresetn\b', 'aresetn', renamed)
V_FILE.write_text(renamed, encoding="utf-8")
print(f"Renamed ports in {V_FILE.name}")
