# Copyright (c) 2026 Leonardo Capossio
# SPDX-License-Identifier: MIT
## package_ip.tcl
##
## Packages an axiZero crossbar as a Platform Designer (Qsys) component.
## Parses the Verilog port list and creates AXI4 / AXI4-Lite interface
## definitions automatically from the sN_axi_* / mN_axi_* naming convention.
##
## Usage:
##   # From repo root — package the default 2M×2S Full AXI4 crossbar:
##   quartus_sh -t hw/quartus/package_ip.tcl
##
##   # Package a different configuration:
##   quartus_sh -t hw/quartus/package_ip.tcl generated/MyLite_1M4S.v
##
## Output: hw/quartus/axizero_ip/<name>_hw.tcl
##
## To add to Platform Designer:
##   1. Project > IP Components > Add Component Search Path
##      → add hw/quartus/axizero_ip/
##   2. The component appears under "axiZero" in the IP catalog
##   3. Drag into your system, connect clk/reset and AXI interfaces

package require Tcl 8.5

# ---------------------------------------------------------------------------
# Configuration
# ---------------------------------------------------------------------------
set script_dir [file dirname [file normalize [info script]]]
set repo_root  [file normalize "$script_dir/../.."]

if {$argc > 0} {
    set rtl_file [file normalize [lindex $argv 0]]
} else {
    set rtl_file [file normalize "$repo_root/generated/MyFull_2M2S.v"]
}

if {![file exists $rtl_file]} {
    puts "ERROR: RTL file not found: $rtl_file"
    exit 1
}

set ip_dir [file normalize "$script_dir/axizero_ip"]
file mkdir $ip_dir

# ---------------------------------------------------------------------------
# Parse Verilog module ports
# ---------------------------------------------------------------------------
# Returns list of {direction width name} triples
proc parse_verilog_ports {filename} {
    set ports {}
    set f [open $filename r]
    set in_top_module 0
    set in_port_list 0
    while {[gets $f line] >= 0} {
        # Only parse the first module declaration.  Generated SpinalHDL files
        # can contain helper modules; scanning the whole file would collect
        # duplicate interface ports from those nested declarations too.
        if {!$in_top_module} {
            if {[regexp {^\s*module\s+\w+\s*\(} $line]} {
                set in_top_module 1
                set in_port_list 1
            } else {
                continue
            }
        }
        if {!$in_port_list} {
            continue
        }
        if {[regexp {^\s*\);\s*$} $line]} {
            break
        }
        # Match: input/output wire [W:0] name
        if {[regexp {^\s*(input|output)\s+wire\s+(?:\[(\d+):0\]\s+)?(\w+)} $line -> dir msb name]} {
            if {$msb eq ""} {
                set width 1
            } else {
                set width [expr {$msb + 1}]
            }
            lappend ports [list $dir $width $name]
        }
    }
    close $f
    return $ports
}

# Extract module name from Verilog
proc parse_module_name {filename} {
    set f [open $filename r]
    while {[gets $f line] >= 0} {
        if {[regexp {^\s*module\s+(\w+)} $line -> name]} {
            close $f
            return $name
        }
    }
    close $f
    return "AxiZeroTop"
}

# ---------------------------------------------------------------------------
# Classify ports into interfaces
# ---------------------------------------------------------------------------
# AXI4 signal role mapping for Platform Designer
# Key: suffix after sN_axi_ or mN_axi_
# Value: {axi_signal_name role_for_slave role_for_master}
#   slave interface  = sN (where external masters connect)
#   master interface = mN (where external slaves connect)

# Full AXI4 signal map
array set axi4_signals {
    awvalid {awvalid}  awready {awready}  awaddr  {awaddr}
    awid    {awid}     awlen   {awlen}    awsize  {awsize}
    awburst {awburst}  awlock  {awlock}   awcache {awcache}
    awqos   {awqos}    awprot  {awprot}   awregion {awregion}
    wvalid  {wvalid}   wready  {wready}   wdata   {wdata}
    wstrb   {wstrb}    wlast   {wlast}
    bvalid  {bvalid}   bready  {bready}   bid     {bid}
    bresp   {bresp}
    arvalid {arvalid}  arready {arready}  araddr  {araddr}
    arid    {arid}     arlen   {arlen}    arsize  {arsize}
    arburst {arburst}  arlock  {arlock}   arcache {arcache}
    arqos   {arqos}    arprot  {arprot}   arregion {arregion}
    rvalid  {rvalid}   rready  {rready}   rdata   {rdata}
    rid     {rid}      rresp   {rresp}    rlast   {rlast}
}

# Signals that indicate Full AXI4 (not present in AXI4-Lite)
set full_only_signals {awid awlen awsize awburst awlock awcache awqos awregion \
                       wlast bid arid arlen arsize arburst arlock arcache arqos \
                       arregion rid rlast}

proc classify_ports {ports} {
    set interfaces {}  ;# dict: name -> {type prefix signals}
    set clock_ports {}
    set reset_ports {}

    foreach port $ports {
        lassign $port dir width name

        if {$name eq "aclk" || $name eq "clk"} {
            lappend clock_ports $port
            continue
        }
        if {$name eq "aresetn" || $name eq "resetn" || $name eq "reset_n"} {
            lappend reset_ports $port
            continue
        }

        # Match sN_axi_SIGNAL or mN_axi_SIGNAL
        if {[regexp {^(s|m)(\d+)_axi_(\w+)$} $name -> sm idx suffix]} {
            set iface_name "${sm}${idx}_axi"
            if {![dict exists $interfaces $iface_name]} {
                if {$sm eq "s"} {
                    set iface_type "slave"
                } else {
                    set iface_type "master"
                }
                dict set interfaces $iface_name type $iface_type
                dict set interfaces $iface_name prefix "${sm}${idx}_axi"
                dict set interfaces $iface_name signals {}
            }
            set sigs [dict get $interfaces $iface_name signals]
            lappend sigs [list $suffix $dir $width $name]
            dict set interfaces $iface_name signals $sigs
        }
    }

    return [list $interfaces $clock_ports $reset_ports]
}

# Determine if an interface is Full AXI4 or AXI4-Lite
proc is_full_axi4 {signals} {
    foreach sig $signals {
        lassign $sig suffix dir width name
        if {$suffix eq "awlen" || $suffix eq "awid" || $suffix eq "wlast"} {
            return 1
        }
    }
    return 0
}

# ---------------------------------------------------------------------------
# Generate _hw.tcl
# ---------------------------------------------------------------------------
set ports [parse_verilog_ports $rtl_file]
set module_name [parse_module_name $rtl_file]

lassign [classify_ports $ports] interfaces clock_ports reset_ports

set rtl_basename [file tail $rtl_file]
set hw_tcl_file "$ip_dir/${module_name}_hw.tcl"

set f [open $hw_tcl_file w]

puts $f "# Copyright (c) 2026 Leonardo Capossio"
puts $f "# SPDX-License-Identifier: MIT"
puts $f "#"
puts $f "# Auto-generated Platform Designer component for $module_name"
puts $f "# Source: $rtl_basename"
puts $f "#"
puts $f "# DO NOT EDIT — regenerate with:"
puts $f "#   quartus_sh -t hw/quartus/package_ip.tcl generated/$rtl_basename"
puts $f ""
puts $f "package require -exact qsys 16.0"
puts $f ""

# -- Component declaration --
puts $f "# ---------------------------------------------------------------------------"
puts $f "# Component declaration"
puts $f "# ---------------------------------------------------------------------------"
puts $f "set_module_property NAME $module_name"
puts $f "set_module_property DISPLAY_NAME \"axiZero $module_name\""
puts $f "set_module_property DESCRIPTION \"MIT-licensed AXI4/AXI4-Lite crossbar (axiZero)\""
puts $f "set_module_property VERSION 0.3.1"
puts $f "set_module_property GROUP \"Interconnect/AXI\""
puts $f "set_module_property AUTHOR \"Leonardo Capossio\""
puts $f "set_module_property INSTANTIATE_IN_SYSTEM_MODULE true"
puts $f "set_module_property EDITABLE false"
puts $f "set_module_property ELABORATION_CALLBACK {}"
puts $f ""

# -- HDL file --
puts $f "# ---------------------------------------------------------------------------"
puts $f "# HDL files"
puts $f "# ---------------------------------------------------------------------------"
puts $f "add_fileset QUARTUS_SYNTH QUARTUS_SYNTH {} {}"
puts $f "set_fileset_property QUARTUS_SYNTH TOP_LEVEL $module_name"
puts $f "add_fileset_file $rtl_basename VERILOG PATH $rtl_basename"
puts $f ""
puts $f "add_fileset SIM_VERILOG SIM_VERILOG {} {}"
puts $f "set_fileset_property SIM_VERILOG TOP_LEVEL $module_name"
puts $f "add_fileset_file $rtl_basename VERILOG PATH $rtl_basename"
puts $f ""

# -- Clock interface --
puts $f "# ---------------------------------------------------------------------------"
puts $f "# Clock interface"
puts $f "# ---------------------------------------------------------------------------"
puts $f "add_interface clk clock end"
puts $f "set_interface_property clk ENABLED true"
foreach port $clock_ports {
    lassign $port dir width name
    puts $f "add_interface_port clk $name clk Input 1"
}
puts $f ""

# -- Reset interface --
puts $f "# ---------------------------------------------------------------------------"
puts $f "# Reset interface (active-low)"
puts $f "# ---------------------------------------------------------------------------"
puts $f "add_interface reset reset end"
puts $f "set_interface_property reset associatedClock clk"
puts $f "set_interface_property reset ENABLED true"
foreach port $reset_ports {
    lassign $port dir width name
    puts $f "add_interface_port reset $name reset_n Input 1"
}
puts $f ""

# -- AXI interfaces --
puts $f "# ---------------------------------------------------------------------------"
puts $f "# AXI interfaces"
puts $f "# ---------------------------------------------------------------------------"

# Platform Designer AXI signal role names
# For an AXI slave interface (sN), input signals have no suffix change
# For an AXI master interface (mN), directions are reversed
array set pd_axi_roles {
    awvalid awvalid   awready awready   awaddr  awaddr
    awid    awid      awlen   awlen     awsize  awsize
    awburst awburst   awlock  awlock    awcache awcache
    awqos   awqos     awprot  awprot    awregion awregion
    wvalid  wvalid    wready  wready    wdata   wdata
    wstrb   wstrb     wlast   wlast
    bvalid  bvalid    bready  bready    bid     bid
    bresp   bresp
    arvalid arvalid   arready arready   araddr  araddr
    arid    arid      arlen   arlen     arsize  arsize
    arburst arburst   arlock  arlock    arcache arcache
    arqos   arqos     arprot  arprot    arregion arregion
    rvalid  rvalid    rready  rready    rdata   rdata
    rid     rid       rresp   rresp     rlast   rlast
}

set iface_names [dict keys $interfaces]
set sorted_ifaces [lsort $iface_names]

foreach iface_name $sorted_ifaces {
    set iface_data [dict get $interfaces $iface_name]
    set iface_type [dict get $iface_data type]
    set signals    [dict get $iface_data signals]
    set is_full    [is_full_axi4 $signals]

    if {$is_full} {
        set proto "axi4"
    } else {
        set proto "axi4lite"
    }

    # Platform Designer: "end" = slave (accepts transactions), "start" = master (issues transactions)
    # sN interfaces are slave-facing on the crossbar = the crossbar is the slave = "end"
    # mN interfaces are master-facing on the crossbar = the crossbar is the master = "start"
    if {$iface_type eq "slave"} {
        set pd_role "end"
    } else {
        set pd_role "start"
    }

    puts $f ""
    puts $f "# -- $iface_name ($proto, $iface_type) --"
    puts $f "add_interface $iface_name $proto $pd_role"
    puts $f "set_interface_property $iface_name associatedClock clk"
    puts $f "set_interface_property $iface_name associatedReset reset"
    puts $f "set_interface_property $iface_name readAcceptanceCapability 1"
    puts $f "set_interface_property $iface_name writeAcceptanceCapability 1"
    puts $f "set_interface_property $iface_name combinedAcceptanceCapability 1"
    puts $f "set_interface_property $iface_name readDataReorderingDepth 1"
    puts $f "set_interface_property $iface_name ENABLED true"

    foreach sig $signals {
        lassign $sig suffix dir width portname

        # Map direction: Verilog input/output → Platform Designer Input/Output
        if {$dir eq "input"} {
            set pd_dir "Input"
        } else {
            set pd_dir "Output"
        }

        # Signal role name for Platform Designer
        if {[info exists pd_axi_roles($suffix)]} {
            set role $pd_axi_roles($suffix)
        } else {
            set role $suffix
        }

        puts $f "add_interface_port $iface_name $portname $role $pd_dir $width"
    }
}

puts $f ""
puts $f "# ---------------------------------------------------------------------------"
puts $f "# End of component"
puts $f "# ---------------------------------------------------------------------------"

close $f

# ---------------------------------------------------------------------------
# Copy RTL file into IP directory
# ---------------------------------------------------------------------------
file copy -force $rtl_file "$ip_dir/$rtl_basename"

# ---------------------------------------------------------------------------
# Summary
# ---------------------------------------------------------------------------
puts ""
puts "=== Platform Designer component generated ==="
puts "  _hw.tcl : $hw_tcl_file"
puts "  RTL     : $ip_dir/$rtl_basename"
puts ""
puts "Interfaces:"
foreach iface_name $sorted_ifaces {
    set iface_data [dict get $interfaces $iface_name]
    set iface_type [dict get $iface_data type]
    set signals    [dict get $iface_data signals]
    set is_full    [is_full_axi4 $signals]
    if {$is_full} { set proto "AXI4" } else { set proto "AXI4-Lite" }
    set nsigs [llength $signals]
    puts "  $iface_name  $iface_type  $proto  ($nsigs signals)"
}
puts ""
puts "Add to Platform Designer:"
puts "  IP Components > Add Component Search Path > $ip_dir"
puts ""
