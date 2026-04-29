## Optional constraints for the AMD AXI Protocol Checker integration.
## Only added when create_project.tcl is invoked with `enable_axi_pc=1`.
##
## Routes the sticky `axi_pc_violation` flag to LD0_R (Arty A7-100T RGB LED 0,
## red channel — pin G6).  Red on = at least one AXI protocol rule fired
## during the hardware run.

set_property -dict {PACKAGE_PIN G6 IOSTANDARD LVCMOS33} [get_ports axi_pc_violation]
