# Copyright (c) 2026 Leonardo Capossio - bard0 design  hello@bard0.com
# SPDX-License-Identifier: MIT
# cocotb/Verilator tests for generated AXI4-Stream utility cores.

REPO_ROOT := $(abspath ../../..)

TOPLEVEL_LANG ?= verilog
FILE_STEM     ?= SmokeAxisRegSlice
TOPLEVEL      ?= AxiStreamRegSlice
MODULE        ?= test_axis_reg_slice
SIM           ?= verilator
SIM_BUILD     ?= sim_build_$(FILE_STEM)
RTL_FILE      ?= $(REPO_ROOT)/tmp/axis_regression/rtl/$(FILE_STEM).v
EXTRA_VERILOG_SOURCES ?=

EXTRA_ARGS := --trace --trace-structs \
              -Wno-WIDTHTRUNC -Wno-WIDTHEXPAND \
              -Wno-UNSIGNED -Wno-CMPCONST

VERILOG_SOURCES := $(RTL_FILE) $(EXTRA_VERILOG_SOURCES)

export TOPLEVEL_LANG FILE_STEM TOPLEVEL MODULE SIM SIM_BUILD EXTRA_ARGS VERILOG_SOURCES

.PHONY: all sim clean

all: sim

sim:
	$(MAKE) -f $$(cocotb-config --makefiles)/Makefile.sim

clean:
	$(MAKE) -f $$(cocotb-config --makefiles)/Makefile.sim clean
	rm -rf sim_build_* __pycache__ results.xml dump.vcd
