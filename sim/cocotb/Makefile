# Makefile  —  cocotb/Verilator test bench for AxiZero 2M×2S pipelined crossbar
#
# Prerequisites (WSL / Linux):
#   apt install verilator
#   pip install cocotb cocotbext-axi
#   sbt installed for RTL generation step
#
# Usage:
#   make           — generate RTL, then run all cocotb tests
#   make gen       — (re)generate AxiZeroCocotbDUT.v from Scala sources
#   make sim       — run cocotb tests (assumes RTL already generated)
#   make clean     — remove build artefacts
#   make waves     — open GTKWave on the last VCD dump

# ── Paths ────────────────────────────────────────────────────────────────────

# Root of the axiZero repository (two levels above this Makefile)
REPO_ROOT   := $(abspath ../..)

# Where CocotbDutGen writes the Verilog
RTL_DIR     := $(CURDIR)/rtl

# Generated DUT + this wrapper
SRC_DUT     := $(RTL_DIR)/AxiZeroCocotbDUT.v
SRC_WRAP    := $(CURDIR)/AxiZeroWrapper.v

# ── cocotb / Verilator settings ──────────────────────────────────────────────

TOPLEVEL_LANG  := verilog
TOPLEVEL       := AxiZeroWrapper
MODULE         := test_axizero
SIM            := verilator

# Extra Verilator flags: enable VCD dump, suppress expected SpinalHDL lint warnings
EXTRA_ARGS     := --trace --trace-structs \
                  -Wno-WIDTHTRUNC -Wno-WIDTHEXPAND \
                  -Wno-UNSIGNED -Wno-CMPCONST \
                  -Wno-PINMISSING

VERILOG_SOURCES := $(SRC_DUT) $(SRC_WRAP)

# Export for cocotb Makefile
export TOPLEVEL_LANG
export TOPLEVEL
export MODULE
export SIM
export EXTRA_ARGS
export VERILOG_SOURCES

# ── Targets ──────────────────────────────────────────────────────────────────

.PHONY: all gen sim clean waves

all: gen sim

## Generate AxiZeroCocotbDUT.v from Scala
gen: $(SRC_DUT)

$(SRC_DUT): $(shell find $(REPO_ROOT)/hw/spinal -name "*.scala")
	@echo "[axiZero] Generating RTL..."
	mkdir -p $(RTL_DIR)
	cd $(REPO_ROOT) && sbt "runMain axizero.gen.CocotbDutGen"
	@echo "[axiZero] RTL ready: $(SRC_DUT)"

## Run cocotb tests (skip generation)
sim: $(SRC_DUT) $(SRC_WRAP)
	@echo "[axiZero] Running cocotb tests..."
	$(MAKE) -f $$(cocotb-config --makefiles)/Makefile.sim

## Clean build artefacts (keep generated RTL)
clean:
	$(MAKE) -f $$(cocotb-config --makefiles)/Makefile.sim clean
	rm -rf sim_build __pycache__ results.xml dump.vcd

## Open last VCD in GTKWave (if available)
waves:
	gtkwave dump.vcd &
# Copyright (c) 2026 Leonardo Capossio - bard0 design  hello@bard0.com
# SPDX-License-Identifier: MIT
