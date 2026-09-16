# Copyright (c) 2026 Leonardo Capossio - bard0 design - hello@bard0.com
# SPDX-License-Identifier: MIT
#
# Quartus batch build for the VexZero example on the Terasic DE25-Nano.
#
#   quartus_sh -t build_vexzero_de25.tcl <repo_root> <design>
#
# where <design> is one of:
#
#   verdict      the self test
#   bench        Dhrystone
#   stress_rr    the self test with two saturating self-checking traffic
#   stress_wrr   generators loading the crossbar, one build per arbitration
#   stress_qos   policy, plus one with the CPU's load/store port routed
#   stress_axi3  through AXI3 and back, plus one whose generators vary their
#   stress_ids   ID across two on-chip RAMs to exercise AXI4 ordering
#
# Every top level presents the same pins, so they all use the same QSF and SDC
# and only the top-level entity and the netlist differ.
#
# The five stress builds are the Altera half of what replaced the MicroBlaze
# wrr, qos, qos_stress, axi3 and axis Arty suites. Those could only ever be
# built for Xilinx; these are the same source, the same configurations and the
# same checks as the Vivado builds in hw/vivado/arty_a7, which is the whole
# reason for having replaced them.
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
    stress_rr - stress_wrr - stress_qos - stress_axi3 - stress_ids {
        set policy  [string range $design 7 end]
        set top     VexZeroStressDe25_$policy
        set netlist $top.v
        set project vexzero_stress_${policy}_de25
    }
    default {
        error "unknown design '$design' -- expected verdict, bench, or one of\
               stress_rr / stress_wrr / stress_qos / stress_axi3 / stress_ids"
    }
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

# Worst setup slack, read from the Setup Summary table.
#
# Three things in the report look like the table and are not:
#   - the table of contents entry, "  9. Setup Summary", which has no leading
#     ";" -- matching it and then breaking on " 10. Hold Summary" was how an
#     earlier version of this proc silently returned "n/a" for every build;
#   - the pass/fail roll-up, ";  Setup Summary ; Pass ;", which carries a
#     second column, so the banner is required to end at the first ";";
#   - the Hold, Recovery, Removal and Minimum Pulse Width tables, which have
#     the same column layout and would otherwise be read as setup slack.
#
# So: match the wide single-column banner, confirm the "Clock ; Slack" column
# header before trusting a row, and take the smallest slack in the table.
# Slack is the SECOND column -- the first is the clock name.
proc worst_setup_slack {path} {
    if {![file exists $path]} { return "n/a" }
    set fh [open $path r]
    set data [read $fh]
    close $fh
    set state idle
    set worst ""
    foreach line [split $data "\n"] {
        switch -- $state {
            idle {
                if {[regexp {^;\s*Setup Summary\s*;$} $line]} { set state header }
            }
            header {
                if {[regexp {^;\s*Clock\s*;\s*Slack\s*;} $line]} { set state rows }
            }
            rows {
                if {[regexp {^;\s*[^;]+;\s*(-?[0-9]+\.[0-9]+)\s*;} $line -> value]} {
                    if {$worst eq "" || $value < $worst} { set worst $value }
                } elseif {[regexp {^\+} $line] && $worst ne ""} {
                    break
                }
            }
        }
    }
    if {$worst eq ""} { return "n/a" }
    return $worst
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

# Worst-case setup slack, from the STA report the flow just wrote.
#
# Quartus writes a .sof whether or not the design closes, and a board loaded
# with one that misses timing will usually still boot and report a pass --
# setup violations show up as occasional wrong bits, not as a halt. So the
# slack is recorded next to the resource numbers, and run_vexzero_de25.py
# refuses to read a board result from a build that did not close. This is the
# same gate create_project_vexzero.tcl applies on the Vivado side; a suite that
# claims to validate on two vendors has to judge both by the same standard.
set slack [worst_setup_slack $sta_rpt]
puts "  Worst setup slack: $slack ns"
puts "===================================================="

set tfh [open "vexzero_timing.txt" w]
puts $tfh "slack $slack"
close $tfh
if {[string is double -strict $slack] && $slack < 0} {
    puts "*** TIMING NOT MET: worst setup slack $slack ns ***"
}

project_close
