# Copyright (c) 2026 Leonardo Capossio - bard0 design - hello@bard0.com
# SPDX-License-Identifier: MIT
#
# Quartus batch build for the VexZero example on the Terasic DE25-Nano.
#
#   quartus_sh -t build_vexzero_de25.tcl <repo_root> <design>
#
# where <design> is "verdict" (the self test) or "bench" (Dhrystone). Both top
# levels present the same pins, so both use the same QSF and SDC and only the
# top-level entity and the netlist differ.
#
# The design instantiates fpgacapZero's JTAG-to-AXI bridge as a black box, so
# the bridge's own sources are compiled alongside the generated netlist. They
# come from the pinned submodule; a checkout without it cannot build this, and
# the script says so rather than failing later with a missing module.

if {$argc < 2} {
    error "usage: quartus_sh -t build_vexzero_de25.tcl <repo_root> <verdict|bench>"
}

set repo   [lindex $quartus(args) 0]
set design [lindex $quartus(args) 1]

switch -- $design {
    verdict {
        set top     VexZeroDe25
        set netlist VexZeroDe25.v
        set project vexzero_de25
    }
    bench {
        set top     VexZeroBenchDe25
        set netlist VexZeroBenchDe25.v
        set project vexzero_bench_de25
    }
    default { error "unknown design '$design' -- expected 'verdict' or 'bench'" }
}

set here     [file dirname [info script]]
set fcapz    "$repo/fcapz"
set netlists "$repo/generated/vexriscv"

if {![file exists "$fcapz/rtl/fcapz_ejtagaxi_intel.v"]} {
    error "the fpgacapZero submodule is missing -- run: git submodule update --init fcapz"
}
if {![file exists "$netlists/$netlist"]} {
    error "$netlist has not been generated -- run the sbt generator first"
}

# The bridge, bottom up: the async FIFO it buffers with, the vendor-agnostic
# core, the Altera TAP primitive wrapper, and the single-instantiation wrapper
# that ties those together.
set bridge_sources [list \
    "$fcapz/rtl/fcapz_async_fifo.v" \
    "$fcapz/rtl/fcapz_ejtagaxi.v" \
    "$fcapz/rtl/jtag_tap/jtag_tap_intel.v" \
    "$fcapz/rtl/fcapz_ejtagaxi_intel.v" \
]

package require ::quartus::project
package require ::quartus::flow

puts "\[vexZero\] design      : $design"
puts "\[vexZero\] top level   : $top"
puts "\[vexZero\] netlist     : $netlists/$netlist"

project_new $project -overwrite

source "$here/vexzero_de25.qsf"

set_global_assignment -name TOP_LEVEL_ENTITY $top
set_global_assignment -name VERILOG_FILE "$netlists/$netlist"
foreach src $bridge_sources {
    set_global_assignment -name VERILOG_FILE $src
}

# fcapz_ejtagaxi.v includes fcapz_version.vh from its own directory.
set_global_assignment -name SEARCH_PATH "$fcapz/rtl"

set_global_assignment -name SDC_FILE "$here/vexzero_de25.sdc"

execute_flow -compile

# ── Summary ────────────────────────────────────────────────────────────────
# Read the numbers back out of the reports the flow just wrote, rather than
# counting cells with a filter that can silently match the wrong primitives.
proc report_value {path pattern} {
    if {![file exists $path]} { return "n/a" }
    set fh [open $path r]
    set data [read $fh]
    close $fh
    foreach line [split $data "\n"] {
        if {[regexp $pattern $line -> value]} { return [string trim $value] }
    }
    return "n/a"
}

set fit_rpt "$project.fit.rpt"
set sta_rpt "$project.sta.rpt"

puts ""
puts "===================================================="
puts "  VexZero on DE25-Nano -- $design"
puts "===================================================="
puts "  ALMs            : [report_value $fit_rpt {ALMs needed \[=A-B\+C\]\s*;\s*([^;]+);}]"
puts "  Registers       : [report_value $fit_rpt {Total dedicated logic registers\s*;\s*([^;]+);}]"
puts "  Block memory    : [report_value $fit_rpt {Total block memory bits\s*;\s*([^;]+);}]"
puts "  DSP blocks      : [report_value $fit_rpt {Total DSP Blocks\s*;\s*([^;]+);}]"
puts "===================================================="

project_close
