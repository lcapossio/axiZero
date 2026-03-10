# Copyright (c) 2026 Leonardo Capossio — bard0 design  hello@bard0.com
# SPDX-License-Identifier: MIT
## package_ip.tcl
##
## Packages the axiZero 2M×4S mixed crossbar (ArtyDC_2M4S.v) as a proper
## Vivado IP.  Because ports already follow the Vivado/AMD AXI naming convention
## (sN_axi_*, mN_axi_*, aclk, aresetn), Vivado's IP packager infers the AXI
## bus interfaces automatically — no manual port mapping required.
##
## Usage (from repo root):
##   vivado -mode batch -source hw/vivado/package_ip.tcl
##
## Output: hw/vivado/axizero_ip/  (contains component.xml and xgui/)
##
## To add to your project's IP catalog:
##   1. File > IP Settings > IP Repositories > + hw/vivado/axizero_ip
##   2. Drag "axiZero" from the IP catalog into your block design
##   3. IP Integrator auto-connects aclk, aresetn, and the AXI interfaces
##
## Adapt for other configurations:
##   - Change RTL_FILE to point to a different generated/ Verilog
##   - Re-run; interface inference is driven by the sN/mN port names

set script_dir [file dirname [file normalize [info script]]]
set rtl_file   [file normalize "$script_dir/arty_a7/ip/rtl/ArtyDC_2M4S.v"]
set ip_dir     [file normalize "$script_dir/axizero_ip"]
set tmp_proj   [file normalize "$script_dir/axizero_ip_pkg_tmp"]

# ---------------------------------------------------------------------------
# Create a temporary project for IP packaging (removed afterwards)
# ---------------------------------------------------------------------------
create_project axizero_pkg $tmp_proj -part xc7a100tcsg324-1 -force

add_files -norecurse $rtl_file
set_property top AxiZeroMixedTop [current_fileset]
update_compile_order -fileset sources_1

# ---------------------------------------------------------------------------
# Package — Vivado infers AXI interfaces from sN_axi_*/mN_axi_* port names
# ---------------------------------------------------------------------------
file mkdir $ip_dir

ipx::package_project \
    -root_dir  $ip_dir    \
    -vendor    io.axizero  \
    -library   axiZero     \
    -name      axiZero     \
    -version   0.1.0       \
    -taxonomy  /Interconnect \
    -import_files          \
    -force

# ---------------------------------------------------------------------------
# Metadata
# ---------------------------------------------------------------------------
set_property DISPLAY_NAME        "axiZero AXI Crossbar"                    [ipx::current_core]
set_property DESCRIPTION         "MIT-licensed mixed AXI4/AXI4-Lite crossbar" [ipx::current_core]
set_property VENDOR_DISPLAY_NAME "axiZero"                                 [ipx::current_core]
set_property COMPANY_URL         "https://github.com/celeras/axiZero"      [ipx::current_core]

# ---------------------------------------------------------------------------
# aresetn: mark active-low so IP Integrator wires it to processor_aresetn
# ---------------------------------------------------------------------------
set ri [ipx::get_bus_interfaces aresetn -of_objects [ipx::current_core]]
if {$ri ne ""} {
    catch {
        ipx::add_bus_parameter POLARITY $ri
        set_property VALUE ACTIVE_LOW \
            [ipx::get_bus_parameters POLARITY -of_objects $ri]
    }
}

# ---------------------------------------------------------------------------
# aclk: associate with every inferred AXI interface
# ---------------------------------------------------------------------------
set ci [ipx::get_bus_interfaces aclk -of_objects [ipx::current_core]]
if {$ci ne ""} {
    set axi_names {}
    foreach i [ipx::get_bus_interfaces -of_objects [ipx::current_core]] {
        if {[get_property BUS_TYPE_VLNV $i] eq "xilinx.com:interface:aximm:1.0"} {
            lappend axi_names [get_property NAME $i]
        }
    }
    if {[llength $axi_names] > 0} {
        catch {
            ipx::add_bus_parameter ASSOCIATED_BUSIF $ci
            set_property VALUE [join $axi_names ":"] \
                [ipx::get_bus_parameters ASSOCIATED_BUSIF -of_objects $ci]
        }
    }
}

# ---------------------------------------------------------------------------
# Save and verify
# ---------------------------------------------------------------------------
ipx::save_core [ipx::current_core]

set issues [ipx::check_integrity -quiet [ipx::current_core]]
if {[llength $issues] == 0} {
    puts "\n=== IP integrity OK ==="
} else {
    puts "\n=== IP integrity warnings ==="
    foreach r $issues { puts "  $r" }
}

puts "\n=== IP packaged to: $ip_dir ==="
puts "Interfaces inferred:"
foreach i [ipx::get_bus_interfaces -of_objects [ipx::current_core]] {
    puts "  [get_property NAME $i]  [get_property INTERFACE_MODE $i]  [get_property BUS_TYPE_VLNV $i]"
}

# ---------------------------------------------------------------------------
# Clean up temporary packaging project
# ---------------------------------------------------------------------------
close_project
file delete -force $tmp_proj

puts ""
puts "Add to Vivado IP catalog:"
puts "  IP Settings > IP Repositories > + $ip_dir"
puts ""
exit 0
