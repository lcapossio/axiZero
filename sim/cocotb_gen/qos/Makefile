# Makefile  —  cocotb/Verilator tests for generated MyFull_2M2S_QoS.v
# DUT: AxiZeroMixedTop  (2 AXI4 masters, 2 AXI4 slaves, 32-bit, QoS arb)
#
# Usage (from WSL):
#   make        — run all tests
#   make clean  — remove build artefacts

REPO_ROOT := $(abspath ../../..)
RTL_FILE  := $(REPO_ROOT)/generated/MyFull_2M2S_QoS.v

TOPLEVEL_LANG  := verilog
TOPLEVEL       := AxiZeroMixedTop
MODULE         := test_qos
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
