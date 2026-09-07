# Copyright (c) 2026 Leonardo Capossio - bard0 design  hello@bard0.com
# SPDX-License-Identifier: MIT
## =============================================================================
## create_project_vexzero.tcl  —  Arty A7-100T VexZero example SoC
##
## Targets: xc7a100tcsg324-1
##
## Two designs share this script and the same XDC, because they have the same
## pin-out:
##
##   verdict  VexZeroArty       the SoC's self test, reported on LEDs and UART
##   bench    VexZeroBenchArty  a prebuilt RISC-V benchmark, console on the UART
##
## Prerequisite
## ────────────
##   sbt "vexZero/runMain vexzero.gen.VexZeroArtyGen"        ;# verdict
##   sbt "vexZero/runMain vexzero.gen.VexZeroBenchArtyGen"   ;# bench
##   (writes generated/vexriscv/<top>.v, ROM inlined)
##
## Usage
## ─────
##   vivado -mode batch -source hw/vivado/arty_a7/create_project_vexzero.tcl
##   vivado -mode batch -source ... -tclargs 8            ;# 8 parallel jobs
##   vivado -mode batch -source ... -tclargs 8 bench      ;# the benchmark build
##
## Unlike the other Arty projects here there is no block design and no
## MicroBlaze: the whole SoC — VexRiscv, the axiZero crossbar, the RAM and the
## peripherals — is one SpinalHDL-generated Verilog file, so this is a plain
## RTL project with a top module and one constraints file.
## =============================================================================

set script_dir [file dirname [file normalize [info script]]]
set repo_root  [file normalize "$script_dir/../../.."]
set xdc_file   "$script_dir/constraints/arty_a7_100t_vexzero.xdc"

if {[info exists argc] && $argc > 0} {
    set jobs [lindex $argv 0]
} else {
    set jobs 4
}
if {[info exists argc] && $argc > 1} {
    set design [lindex $argv 1]
} else {
    set design verdict
}

switch -- $design {
    verdict {
        set top       VexZeroArty
        set proj_name vexzero_arty
        set gen_main  vexzero.gen.VexZeroArtyGen
    }
    bench {
        set top       VexZeroBenchArty
        set proj_name vexzero_bench
        set gen_main  vexzero.gen.VexZeroBenchArtyGen
    }
    default {
        error "unknown design '$design' — expected 'verdict' or 'bench'"
    }
}

set proj_dir "$script_dir/$proj_name"
set rtl_file "$repo_root/generated/vexriscv/$top.v"

if {![file exists $rtl_file]} {
    error "Netlist not found: $rtl_file\nRun: sbt \"vexZero/runMain $gen_main\""
}

## ─── 1. Project ─────────────────────────────────────────────────────────────
create_project $proj_name $proj_dir -part xc7a100tcsg324-1 -force
catch { set_property board_part digilentinc.com:arty-a7-100:part0:1.1 [current_project] } errmsg
if {[info exists errmsg] && $errmsg ne ""} {
    puts "\[vexZero\] Note: board_part not found (Digilent board files not installed) — continuing with part only."
}

add_files -norecurse $rtl_file
set_property file_type {Verilog} [get_files "$top.v"]
set_property top $top [current_fileset]

add_files -fileset constrs_1 -norecurse $xdc_file

## ─── 2. Synthesis and implementation ────────────────────────────────────────
# Synthesis is deliberately serialized regardless of $jobs. Parallel
# out-of-context IP runs each load the Vivado tclapp store independently
# and contend over it; an arbitrary subset then dies with
#   ERROR: [Common 17-354] Could not open 'C' for writing.
# in unrelated Xilinx IP. Measured on 2025.2: at -jobs 4 this hit four of
# five builds, at -jobs 1 none of four. $jobs still applies to
# implementation below, which does not have the contention.
launch_runs synth_1 -jobs 1
wait_on_run synth_1
if {[get_property PROGRESS [get_runs synth_1]] ne "100%"} {
    error "Synthesis failed — see $proj_dir/$proj_name.runs/synth_1/runme.log"
}

launch_runs impl_1 -to_step write_bitstream -jobs $jobs
wait_on_run impl_1
if {[get_property PROGRESS [get_runs impl_1]] ne "100%"} {
    error "Implementation failed — see $proj_dir/$proj_name.runs/impl_1/runme.log"
}

## ─── 3. Resource and timing report ──────────────────────────────────────────
## The numbers quoted in the README come from here; keep the format stable so
## a later build can be compared against it.
open_run impl_1
report_utilization    -file "$proj_dir/vexzero_utilization.rpt"
report_timing_summary -file "$proj_dir/vexzero_timing.rpt"

## The counts are read back out of the report rather than recounted from the
## netlist, so what is printed here is the same number the report shows and
## the README can quote either one.
proc util_row {path label} {
    set fh [open $path r]
    set data [read $fh]
    close $fh
    foreach line [split $data "\n"] {
        if {[string match "| $label *" $line] || [string match "| $label|*" $line]} {
            return [string trim [lindex [split $line "|"] 2]]
        }
    }
    return "n/a"
}

set util "$proj_dir/vexzero_utilization.rpt"

set wns [get_property STATS.WNS [get_runs impl_1]]
set clk_period 10.0
set fmax [expr {1000.0 / ($clk_period - $wns)}]

puts "\n\[vexZero\] ── Implementation summary ($design) ──────────────────────────────"
puts "\[vexZero\]   Slice LUTs      : [util_row $util {Slice LUTs}]"
puts "\[vexZero\]   Slice Registers : [util_row $util {Slice Registers}]"
puts "\[vexZero\]   Block RAM Tiles : [util_row $util {Block RAM Tile}]"
puts "\[vexZero\]   DSPs            : [util_row $util {DSPs}]"
puts [format "\[vexZero\]   WNS             : %.3f ns at 100 MHz" $wns]
puts [format "\[vexZero\]   Fmax            : %.1f MHz" $fmax]
puts "\[vexZero\] Bitstream: $proj_dir/$proj_name.runs/impl_1/$top.bit"
puts ""
