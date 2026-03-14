# synth_resource_usage.tcl — Synthesize each generated/*.v in OOC mode
# and report LUT / FF / BRAM / DSP counts.
#
# Usage:  vivado -mode batch -source hw/vivado/synth_resource_usage.tcl
# Run from the repo root (c:/Projects/axiZero).

set gen_dir [file normalize [file join [file dirname [info script]] .. .. generated]]
set out_dir [file normalize [file join [file dirname [info script]] resource_reports]]
file mkdir $out_dir

set part "xc7a100tcsg324-1"

# Map filename → top module
proc detect_top {vfile} {
    set fp [open $vfile r]
    set data [read $fp]
    close $fp
    # First "module" declaration is the top-level wrapper
    if {[regexp {module\s+(\w+)\s*\(} $data -> modname]} {
        return $modname
    }
    return ""
}

# Collect results for summary
set results {}

foreach vfile [lsort [glob -nocomplain [file join $gen_dir *.v]]] {
    set fname [file tail $vfile]
    set top [detect_top $vfile]
    if {$top eq ""} {
        puts "SKIP $fname — no module found"
        continue
    }

    puts "\n============================================================"
    puts "  Synthesizing: $fname  (top=$top)"
    puts "============================================================\n"

    # Clean slate
    close_project -quiet
    create_project -in_memory -part $part synth_tmp

    read_verilog $vfile
    set_property top $top [current_fileset]

    # OOC synthesis — no I/O insertion
    synth_design -top $top -part $part -mode out_of_context

    # Extract utilization
    set rpt_file [file join $out_dir "${fname}.rpt"]
    report_utilization -file $rpt_file

    # Parse key numbers from the report
    set fp [open $rpt_file r]
    set rpt [read $fp]
    close $fp

    set luts 0
    set ffs  0
    set bram 0
    set dsps 0
    set lutram 0

    foreach line [split $rpt "\n"] {
        set line [string trim $line]
        # Match "| Slice LUTs* | NNN |" or "| Slice LUTs | NNN |"
        if {[regexp {^\|\s*Slice LUTs\*?\s*\|\s*(\d+)\s*\|} $line -> val]} {
            set luts $val
        }
        if {[regexp {^\|\s*Slice Registers\s*\|\s*(\d+)\s*\|} $line -> val]} {
            set ffs $val
        }
        if {[regexp {^\|\s*Block RAM Tile\s*\|\s*(\d+)\s*\|} $line -> val]} {
            set bram $val
        }
        if {[regexp {^\|\s*DSPs\s*\|\s*(\d+)\s*\|} $line -> val]} {
            set dsps $val
        }
        if {[regexp {^\|\s*LUT as Memory\s*\|\s*(\d+)\s*\|} $line -> val]} {
            set lutram $val
        }
    }

    lappend results [list $fname $top $luts $ffs $lutram $bram $dsps]

    puts "  => LUTs=$luts  FFs=$ffs  LUTRAM=$lutram  BRAM=$bram  DSP=$dsps"

    close_project
}

# Write summary
set sum_file [file join $out_dir "summary.txt"]
set fp [open $sum_file w]
puts $fp [format "%-30s %-20s %6s %6s %6s %5s %4s" "File" "Top" "LUTs" "FFs" "LUTRAM" "BRAM" "DSP"]
puts $fp [string repeat "-" 100]
foreach row $results {
    lassign $row fname top luts ffs lutram bram dsps
    puts $fp [format "%-30s %-20s %6d %6d %6d %5d %4d" $fname $top $luts $ffs $lutram $bram $dsps]
}
close $fp

puts "\n\n============================================================"
puts "  RESOURCE USAGE SUMMARY"
puts "============================================================"
set fp [open $sum_file r]
puts [read $fp]
close $fp
puts "============================================================"
puts "  Reports saved to: $out_dir"
puts "============================================================"
