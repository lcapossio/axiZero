# Copyright (c) 2026 Leonardo Capossio - bard0 design  hello@bard0.com
# SPDX-License-Identifier: MIT
## create_project_axis.tcl -- Arty A7-100T AXI4-Stream hardware smoke test
##
## Prerequisite:
##   sbt "runMain axizero.gen.ArtyAxisDutGen"
##
## This script derives the AXIS board design from the baseline Arty block-design
## script and adds:
##   - AxiZeroArtyAxisDUT.v (1 master x 5 slaves)
##   - AxiStreamArtySmoke.v self-running stream datapath
##   - axi_gpio_axis at 0xC004_0000 exposing the smoke-test status word

set script_dir [file dirname [file normalize [info script]]]
set base_script "$script_dir/create_project.tcl"
set axis_script "$script_dir/_create_project_axis_gen.tcl"

set fh [open $base_script r]
set tcl [read $fh]
close $fh

set tcl [string map {
    "axizero_arty" "axizero_arty_axis"
    "AxiZeroArtyDUT.v" "AxiZeroArtyAxisDUT.v"
    "ArtyDutGen" "ArtyAxisDutGen"
} $tcl]

set rtl_marker {set_property file_type {Verilog} [get_files AxiZeroArtyAxisDUT.v]}
set rtl_insert "$rtl_marker\nadd_files -norecurse \"\$script_dir/ip/rtl/AxiStreamArtySmoke.v\"\nset_property file_type {Verilog} \[get_files AxiStreamArtySmoke.v\]"
set tcl [string map [list $rtl_marker $rtl_insert] $tcl]

set smoke_block {
## -- AXI4-Stream smoke engine -------------------------------------------------
create_bd_cell -type module -reference AxiStreamArtySmoke axis_smoke_0
connect_bd_net [get_bd_ports sys_clk] [get_bd_pins axis_smoke_0/clk]
connect_bd_net [get_bd_pins proc_sys_reset_0/peripheral_aresetn] [get_bd_pins axis_smoke_0/resetn]
}

set m2_marker {create_bd_cell -type ip -vlnv xilinx.com:ip:axi_gpio:2.0 axi_gpio_0}
set idx [string first $m2_marker $tcl]
if {$idx < 0} {
    error "Could not find GPIO insertion point in create_project.tcl"
}
set tcl "[string range $tcl 0 [expr {$idx - 1}]]$smoke_block\n[string range $tcl $idx end]"

set axis_gpio_block {
## -- axiZero S4 -> AXI GPIO input (AXI-Lite), AXIS smoke status --------------
create_bd_cell -type ip -vlnv xilinx.com:ip:axi_gpio:2.0 axi_gpio_axis
set_property -dict {
    CONFIG.C_GPIO_WIDTH  {32}
    CONFIG.C_ALL_INPUTS  {1}
} [get_bd_cells axi_gpio_axis]

connect_bd_net [get_bd_ports sys_clk] [get_bd_pins axi_gpio_axis/s_axi_aclk]
connect_bd_net [get_bd_pins proc_sys_reset_0/peripheral_aresetn] [get_bd_pins axi_gpio_axis/s_axi_aresetn]
connect_bd_net [get_bd_pins axis_smoke_0/io_status] [get_bd_pins axi_gpio_axis/gpio_io_i]

connect_bd_net [get_bd_pins axizero_0/m4_axi_awvalid] [get_bd_pins axi_gpio_axis/s_axi_awvalid]
connect_bd_net [get_bd_pins axi_gpio_axis/s_axi_awready] [get_bd_pins axizero_0/m4_axi_awready]
connect_bd_net [get_bd_pins axizero_0/m4_axi_awaddr] [get_bd_pins axi_gpio_axis/s_axi_awaddr]
safe_net axizero_0/m4_axi_awprot axi_gpio_axis/s_axi_awprot

connect_bd_net [get_bd_pins axizero_0/m4_axi_wvalid] [get_bd_pins axi_gpio_axis/s_axi_wvalid]
connect_bd_net [get_bd_pins axi_gpio_axis/s_axi_wready] [get_bd_pins axizero_0/m4_axi_wready]
connect_bd_net [get_bd_pins axizero_0/m4_axi_wdata] [get_bd_pins axi_gpio_axis/s_axi_wdata]
connect_bd_net [get_bd_pins axizero_0/m4_axi_wstrb] [get_bd_pins axi_gpio_axis/s_axi_wstrb]

connect_bd_net [get_bd_pins axi_gpio_axis/s_axi_bvalid] [get_bd_pins axizero_0/m4_axi_bvalid]
connect_bd_net [get_bd_pins axizero_0/m4_axi_bready] [get_bd_pins axi_gpio_axis/s_axi_bready]
connect_bd_net [get_bd_pins axi_gpio_axis/s_axi_bresp] [get_bd_pins axizero_0/m4_axi_bresp]

connect_bd_net [get_bd_pins axizero_0/m4_axi_arvalid] [get_bd_pins axi_gpio_axis/s_axi_arvalid]
connect_bd_net [get_bd_pins axi_gpio_axis/s_axi_arready] [get_bd_pins axizero_0/m4_axi_arready]
connect_bd_net [get_bd_pins axizero_0/m4_axi_araddr] [get_bd_pins axi_gpio_axis/s_axi_araddr]
safe_net axizero_0/m4_axi_arprot axi_gpio_axis/s_axi_arprot

connect_bd_net [get_bd_pins axi_gpio_axis/s_axi_rvalid] [get_bd_pins axizero_0/m4_axi_rvalid]
connect_bd_net [get_bd_pins axizero_0/m4_axi_rready] [get_bd_pins axi_gpio_axis/s_axi_rready]
connect_bd_net [get_bd_pins axi_gpio_axis/s_axi_rdata] [get_bd_pins axizero_0/m4_axi_rdata]
connect_bd_net [get_bd_pins axi_gpio_axis/s_axi_rresp] [get_bd_pins axizero_0/m4_axi_rresp]

}

set addr_marker {assign_bd_address [get_bd_addr_segs {axi_bram_ctrl_0/S_AXI/Mem0}]}
set idx [string first $addr_marker $tcl]
if {$idx < 0} {
    error "Could not find address insertion point in create_project.tcl"
}
set tcl "[string range $tcl 0 [expr {$idx - 1}]]$axis_gpio_block[string range $tcl $idx end]"

set uart_addr {assign_bd_address [get_bd_addr_segs {axi_uartlite_0/S_AXI/Reg}]    -range  4K -offset 0xC0030000}
set axis_addr "$uart_addr\nassign_bd_address \[get_bd_addr_segs {axi_gpio_axis/S_AXI/Reg}\]     -range  4K -offset 0xC0040000"
set tcl [string map [list $uart_addr $axis_addr] $tcl]

set fh [open $axis_script w]
puts $fh $tcl
close $fh

source $axis_script
