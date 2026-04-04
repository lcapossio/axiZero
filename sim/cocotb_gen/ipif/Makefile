# Makefile  —  cocotb/Verilator tests for IPIF slave compatibility
# DUT: AxiZeroLiteTop  (1 AXI4-Lite master, 4 AXI4-Lite slaves, 32-bit)
# Tests that AWVALID+WVALID are presented simultaneously to strict IPIF slaves.
#
# Usage (from WSL):
#   make        — run all tests
#   make clean  — remove build artefacts

REPO_ROOT := $(abspath ../../..)
RTL_FILE  := $(REPO_ROOT)/generated/MyLite_1M4S.v

TOPLEVEL_LANG  := verilog
TOPLEVEL       := AxiZeroLiteTop
MODULE         := test_ipif
SIM            := verilator

EXTRA_ARGS := --trace --trace-structs \
              -Wno-WIDTHTRUNC -Wno-WIDTHEXPAND \
              -Wno-UNSIGNED -Wno-CMPCONST

VERILOG_SOURCES := $(RTL_FILE)

export TOPLEVEL_LANG TOPLEVEL MODULE SIM EXTRA_ARGS VERILOG_SOURCES

.PHONY: all sim clean

all: sim

sim:
	$(MAKE) -f $$(cocotb-config --makefiles)/Makefile.sim

clean:
	$(MAKE) -f $$(cocotb-config --makefiles)/Makefile.sim clean
	rm -rf sim_build __pycache__ results.xml dump.vcd
