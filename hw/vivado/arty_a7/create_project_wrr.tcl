# Copyright (c) 2026 Leonardo Capossio — bard0 design  hello@bard0.com
# SPDX-License-Identifier: MIT
## =============================================================================
## create_project_wrr.tcl  —  Arty A7-100T WRR hardware test
##
## 2-master weighted round-robin:
##   Master 0 = MicroBlaze M_AXI_DP (weight 3)
##   Master 1 = AXI Traffic Gen     (weight 1)
##   4 slaves: 2× BRAM, GPIO, UART (same as base design)
##
## Prerequisites:
##   1. sbt "runMain axizero.gen.ArtyWrrDutGen"
##   2. python hw/vivado/arty_a7/rename_wrr_ports.py
##   3. vivado -mode batch -source hw/vivado/arty_a7/create_project_wrr.tcl
## =============================================================================

set script_dir [file dirname [file normalize [info script]]]
set repo_root  [file normalize "$script_dir/../../.."]

## ─── 1. Project creation ────────────────────────────────────────────────────
set proj_dir "$script_dir/axizero_arty_wrr"
create_project axizero_arty_wrr $proj_dir -part xc7a100tcsg324-1 -force
catch { set_property board_part digilentinc.com:arty-a7-100:part0:1.1 [current_project] }

## ─── 2. RTL sources ──────────────────────────────────────────────────────────
add_files -norecurse "$script_dir/ip/rtl/AxiZeroArtyWrrDUT.v"
add_files -norecurse "$script_dir/ip/rtl/axi_traffic_gen.v"
add_files -norecurse "$script_dir/ip/rtl/axi_id_echo.v"
set_property file_type {Verilog} [get_files AxiZeroArtyWrrDUT.v]
set_property file_type {Verilog} [get_files axi_traffic_gen.v]
set_property file_type {Verilog} [get_files axi_id_echo.v]
update_compile_order -fileset sources_1

## ─── 3. Block Design ────────────────────────────────────────────────────────

proc safe_net {a b} {
    set pa {}; set pb {}
    catch { set pa [get_bd_pins $a] }
    catch { set pb [get_bd_pins $b] }
    if {$pa eq ""} { catch { set pa [get_bd_ports $a] } }
    if {$pb eq ""} { catch { set pb [get_bd_ports $b] } }
    if {$pa eq "" || $pb eq ""} {
        puts "\[axiZero\] skip: $a <-> $b (pin not found)"
        return
    }
    connect_bd_net $pa $pb
}

create_bd_design "system"

## -- Clock and reset --
create_bd_cell -type ip -vlnv xilinx.com:ip:proc_sys_reset:5.0 proc_sys_reset_0
create_bd_port -dir I -type clk sys_clk
set_property CONFIG.FREQ_HZ 100000000 [get_bd_ports sys_clk]
create_bd_port -dir O -from 3 -to 0 leds
create_bd_port -dir O uart_rxd_out
create_bd_port -dir I uart_txd_in

connect_bd_net [get_bd_ports sys_clk] [get_bd_pins proc_sys_reset_0/slowest_sync_clk]
create_bd_cell -type ip -vlnv xilinx.com:ip:xlconstant:1.1 const_vcc
set_property CONFIG.CONST_WIDTH {1} [get_bd_cells const_vcc]
set_property CONFIG.CONST_VAL   {1} [get_bd_cells const_vcc]
connect_bd_net [get_bd_pins const_vcc/dout] [get_bd_pins proc_sys_reset_0/dcm_locked]
connect_bd_net [get_bd_pins const_vcc/dout] [get_bd_pins proc_sys_reset_0/ext_reset_in]

## -- MicroBlaze --
create_bd_cell -type ip -vlnv xilinx.com:ip:microblaze:11.0 microblaze_0
set mb_params {
    CONFIG.C_DEBUG_ENABLED     {1}
    CONFIG.C_D_AXI             {1}
    CONFIG.C_D_LMB             {1}
    CONFIG.C_I_LMB             {1}
    CONFIG.C_USE_BARREL        {0}
    CONFIG.C_USE_DIV           {0}
    CONFIG.C_USE_FPU           {0}
    CONFIG.C_AREA_OPTIMIZED    {1}
    CONFIG.C_ENDIANNESS        {1}
}
catch { lappend mb_params CONFIG.C_USE_MULT {0} CONFIG.C_USE_HW_MUL {0} }
set_property -dict $mb_params [get_bd_cells microblaze_0]
connect_bd_net [get_bd_ports sys_clk]                      [get_bd_pins microblaze_0/Clk]
connect_bd_net [get_bd_pins proc_sys_reset_0/mb_reset]     [get_bd_pins microblaze_0/Reset]

## -- MDM --
create_bd_cell -type ip -vlnv xilinx.com:ip:mdm:3.2 mdm_0
safe_net sys_clk mdm_0/S_AXI_ACLK
safe_net sys_clk mdm_0/Clk
safe_net proc_sys_reset_0/peripheral_aresetn mdm_0/S_AXI_ARESETN
connect_bd_intf_net [get_bd_intf_pins microblaze_0/DEBUG] [get_bd_intf_pins mdm_0/MBDEBUG_0]

## -- LMB (32 KB) --
create_bd_cell -type ip -vlnv xilinx.com:ip:lmb_v10:3.0 ilmb_v10_0
create_bd_cell -type ip -vlnv xilinx.com:ip:lmb_v10:3.0 dlmb_v10_0
create_bd_cell -type ip -vlnv xilinx.com:ip:lmb_bram_if_cntlr:4.0 ilmb_bram_if_cntlr_0
create_bd_cell -type ip -vlnv xilinx.com:ip:lmb_bram_if_cntlr:4.0 dlmb_bram_if_cntlr_0
create_bd_cell -type ip -vlnv xilinx.com:ip:blk_mem_gen:8.4 lmb_bram_0
set_property -dict {
    CONFIG.Memory_Type {True_Dual_Port_RAM}
    CONFIG.Use_Byte_Write_Enable {true}
    CONFIG.Byte_Size {8}
    CONFIG.Write_Width_A {32}  CONFIG.Read_Width_A {32}
    CONFIG.Write_Depth_A {8192}
    CONFIG.Write_Width_B {32}  CONFIG.Read_Width_B {32}
    CONFIG.Enable_B {Use_ENB_Pin}
    CONFIG.Register_PortA_Output_of_Memory_Primitives {false}
    CONFIG.Register_PortB_Output_of_Memory_Primitives {false}
} [get_bd_cells lmb_bram_0]

connect_bd_net [get_bd_ports sys_clk] [get_bd_pins ilmb_v10_0/LMB_Clk]
connect_bd_net [get_bd_ports sys_clk] [get_bd_pins dlmb_v10_0/LMB_Clk]
connect_bd_net [get_bd_pins proc_sys_reset_0/mb_reset] [get_bd_pins ilmb_v10_0/SYS_Rst]
connect_bd_net [get_bd_pins proc_sys_reset_0/mb_reset] [get_bd_pins dlmb_v10_0/SYS_Rst]
connect_bd_intf_net [get_bd_intf_pins microblaze_0/ILMB] [get_bd_intf_pins ilmb_v10_0/LMB_M]
connect_bd_intf_net [get_bd_intf_pins microblaze_0/DLMB] [get_bd_intf_pins dlmb_v10_0/LMB_M]
connect_bd_intf_net [get_bd_intf_pins ilmb_v10_0/LMB_Sl_0]  [get_bd_intf_pins ilmb_bram_if_cntlr_0/SLMB]
connect_bd_intf_net [get_bd_intf_pins dlmb_v10_0/LMB_Sl_0]  [get_bd_intf_pins dlmb_bram_if_cntlr_0/SLMB]
connect_bd_intf_net [get_bd_intf_pins ilmb_bram_if_cntlr_0/BRAM_PORT] [get_bd_intf_pins lmb_bram_0/BRAM_PORTA]
connect_bd_intf_net [get_bd_intf_pins dlmb_bram_if_cntlr_0/BRAM_PORT] [get_bd_intf_pins lmb_bram_0/BRAM_PORTB]
connect_bd_net [get_bd_ports sys_clk] [get_bd_pins ilmb_bram_if_cntlr_0/LMB_Clk]
connect_bd_net [get_bd_ports sys_clk] [get_bd_pins dlmb_bram_if_cntlr_0/LMB_Clk]
connect_bd_net [get_bd_pins proc_sys_reset_0/mb_reset] [get_bd_pins ilmb_bram_if_cntlr_0/LMB_Rst]
connect_bd_net [get_bd_pins proc_sys_reset_0/mb_reset] [get_bd_pins dlmb_bram_if_cntlr_0/LMB_Rst]

## ── axiZero crossbar (2M×4S WRR) ─────────────────────────────────────────
create_bd_cell -type module -reference AxiZeroMixedTop axizero_0
connect_bd_net [get_bd_ports sys_clk] [get_bd_pins axizero_0/aclk]
connect_bd_net [get_bd_pins proc_sys_reset_0/peripheral_aresetn] [get_bd_pins axizero_0/aresetn]

## ── AXI Traffic Gen (Master 1) ────────────────────────────────────────────
create_bd_cell -type module -reference axi_traffic_gen tgen_0
connect_bd_net [get_bd_ports sys_clk] [get_bd_pins tgen_0/aclk]
connect_bd_net [get_bd_pins proc_sys_reset_0/peripheral_aresetn] [get_bd_pins tgen_0/aresetn]

## ── ID Echo modules (BRAM ctrls have ID_WIDTH=0, crossbar needs ID echo) ──
create_bd_cell -type module -reference axi_id_echo id_echo_0
connect_bd_net [get_bd_ports sys_clk] [get_bd_pins id_echo_0/aclk]
connect_bd_net [get_bd_pins proc_sys_reset_0/peripheral_aresetn] [get_bd_pins id_echo_0/aresetn]

create_bd_cell -type module -reference axi_id_echo id_echo_1
connect_bd_net [get_bd_ports sys_clk] [get_bd_pins id_echo_1/aclk]
connect_bd_net [get_bd_pins proc_sys_reset_0/peripheral_aresetn] [get_bd_pins id_echo_1/aresetn]

## ── Constants for MB Full-AXI4 extras ─────────────────────────────────────
create_bd_cell -type ip -vlnv xilinx.com:ip:xlconstant:1.1 const_1b0
set_property -dict {CONFIG.CONST_WIDTH {1} CONFIG.CONST_VAL {0}} [get_bd_cells const_1b0]
create_bd_cell -type ip -vlnv xilinx.com:ip:xlconstant:1.1 const_wlast
set_property -dict {CONFIG.CONST_WIDTH {1} CONFIG.CONST_VAL {1}} [get_bd_cells const_wlast]
create_bd_cell -type ip -vlnv xilinx.com:ip:xlconstant:1.1 const_burst_incr
set_property -dict {CONFIG.CONST_WIDTH {2} CONFIG.CONST_VAL {1}} [get_bd_cells const_burst_incr]
create_bd_cell -type ip -vlnv xilinx.com:ip:xlconstant:1.1 const_size_word
set_property -dict {CONFIG.CONST_WIDTH {3} CONFIG.CONST_VAL {2}} [get_bd_cells const_size_word]
create_bd_cell -type ip -vlnv xilinx.com:ip:xlconstant:1.1 const_4b0
set_property -dict {CONFIG.CONST_WIDTH {4} CONFIG.CONST_VAL {0}} [get_bd_cells const_4b0]
create_bd_cell -type ip -vlnv xilinx.com:ip:xlconstant:1.1 const_8b0
set_property -dict {CONFIG.CONST_WIDTH {8} CONFIG.CONST_VAL {0}} [get_bd_cells const_8b0]

## ── s0: MicroBlaze → axiZero Master 0 ────────────────────────────────────
# AW
connect_bd_net [get_bd_pins microblaze_0/M_AXI_DP_AWVALID] [get_bd_pins axizero_0/s0_axi_awvalid]
connect_bd_net [get_bd_pins axizero_0/s0_axi_awready]      [get_bd_pins microblaze_0/M_AXI_DP_AWREADY]
connect_bd_net [get_bd_pins microblaze_0/M_AXI_DP_AWADDR]  [get_bd_pins axizero_0/s0_axi_awaddr]
connect_bd_net [get_bd_pins microblaze_0/M_AXI_DP_AWPROT]  [get_bd_pins axizero_0/s0_axi_awprot]
connect_bd_net [get_bd_pins const_1b0/dout]                 [get_bd_pins axizero_0/s0_axi_awid]
connect_bd_net [get_bd_pins const_8b0/dout]                 [get_bd_pins axizero_0/s0_axi_awlen]
connect_bd_net [get_bd_pins const_size_word/dout]           [get_bd_pins axizero_0/s0_axi_awsize]
connect_bd_net [get_bd_pins const_burst_incr/dout]          [get_bd_pins axizero_0/s0_axi_awburst]
connect_bd_net [get_bd_pins const_1b0/dout]                 [get_bd_pins axizero_0/s0_axi_awlock]
connect_bd_net [get_bd_pins const_4b0/dout]                 [get_bd_pins axizero_0/s0_axi_awcache]
connect_bd_net [get_bd_pins const_4b0/dout]                 [get_bd_pins axizero_0/s0_axi_awqos]
connect_bd_net [get_bd_pins const_4b0/dout]                 [get_bd_pins axizero_0/s0_axi_awregion]
# W
connect_bd_net [get_bd_pins microblaze_0/M_AXI_DP_WVALID]  [get_bd_pins axizero_0/s0_axi_wvalid]
connect_bd_net [get_bd_pins axizero_0/s0_axi_wready]       [get_bd_pins microblaze_0/M_AXI_DP_WREADY]
connect_bd_net [get_bd_pins microblaze_0/M_AXI_DP_WDATA]   [get_bd_pins axizero_0/s0_axi_wdata]
connect_bd_net [get_bd_pins microblaze_0/M_AXI_DP_WSTRB]   [get_bd_pins axizero_0/s0_axi_wstrb]
connect_bd_net [get_bd_pins const_wlast/dout]               [get_bd_pins axizero_0/s0_axi_wlast]
# B
connect_bd_net [get_bd_pins axizero_0/s0_axi_bvalid]       [get_bd_pins microblaze_0/M_AXI_DP_BVALID]
connect_bd_net [get_bd_pins microblaze_0/M_AXI_DP_BREADY]  [get_bd_pins axizero_0/s0_axi_bready]
connect_bd_net [get_bd_pins axizero_0/s0_axi_bresp]        [get_bd_pins microblaze_0/M_AXI_DP_BRESP]
# AR
connect_bd_net [get_bd_pins microblaze_0/M_AXI_DP_ARVALID] [get_bd_pins axizero_0/s0_axi_arvalid]
connect_bd_net [get_bd_pins axizero_0/s0_axi_arready]      [get_bd_pins microblaze_0/M_AXI_DP_ARREADY]
connect_bd_net [get_bd_pins microblaze_0/M_AXI_DP_ARADDR]  [get_bd_pins axizero_0/s0_axi_araddr]
connect_bd_net [get_bd_pins microblaze_0/M_AXI_DP_ARPROT]  [get_bd_pins axizero_0/s0_axi_arprot]
connect_bd_net [get_bd_pins const_1b0/dout]                 [get_bd_pins axizero_0/s0_axi_arid]
connect_bd_net [get_bd_pins const_8b0/dout]                 [get_bd_pins axizero_0/s0_axi_arlen]
connect_bd_net [get_bd_pins const_size_word/dout]           [get_bd_pins axizero_0/s0_axi_arsize]
connect_bd_net [get_bd_pins const_burst_incr/dout]          [get_bd_pins axizero_0/s0_axi_arburst]
connect_bd_net [get_bd_pins const_1b0/dout]                 [get_bd_pins axizero_0/s0_axi_arlock]
connect_bd_net [get_bd_pins const_4b0/dout]                 [get_bd_pins axizero_0/s0_axi_arcache]
connect_bd_net [get_bd_pins const_4b0/dout]                 [get_bd_pins axizero_0/s0_axi_arqos]
connect_bd_net [get_bd_pins const_4b0/dout]                 [get_bd_pins axizero_0/s0_axi_arregion]
# R
connect_bd_net [get_bd_pins axizero_0/s0_axi_rvalid]       [get_bd_pins microblaze_0/M_AXI_DP_RVALID]
connect_bd_net [get_bd_pins microblaze_0/M_AXI_DP_RREADY]  [get_bd_pins axizero_0/s0_axi_rready]
connect_bd_net [get_bd_pins axizero_0/s0_axi_rdata]        [get_bd_pins microblaze_0/M_AXI_DP_RDATA]
connect_bd_net [get_bd_pins axizero_0/s0_axi_rresp]        [get_bd_pins microblaze_0/M_AXI_DP_RRESP]

## ── s1: Traffic Gen → axiZero Master 1 (AXI4-Lite) ───────────────────────
connect_bd_net [get_bd_pins tgen_0/awvalid]  [get_bd_pins axizero_0/s1_axi_awvalid]
connect_bd_net [get_bd_pins axizero_0/s1_axi_awready] [get_bd_pins tgen_0/awready]
connect_bd_net [get_bd_pins tgen_0/awaddr]   [get_bd_pins axizero_0/s1_axi_awaddr]
connect_bd_net [get_bd_pins tgen_0/awprot]   [get_bd_pins axizero_0/s1_axi_awprot]
connect_bd_net [get_bd_pins tgen_0/wvalid]   [get_bd_pins axizero_0/s1_axi_wvalid]
connect_bd_net [get_bd_pins axizero_0/s1_axi_wready]  [get_bd_pins tgen_0/wready]
connect_bd_net [get_bd_pins tgen_0/wdata]    [get_bd_pins axizero_0/s1_axi_wdata]
connect_bd_net [get_bd_pins tgen_0/wstrb]    [get_bd_pins axizero_0/s1_axi_wstrb]
connect_bd_net [get_bd_pins axizero_0/s1_axi_bvalid]  [get_bd_pins tgen_0/bvalid]
connect_bd_net [get_bd_pins tgen_0/bready]   [get_bd_pins axizero_0/s1_axi_bready]
connect_bd_net [get_bd_pins axizero_0/s1_axi_bresp]   [get_bd_pins tgen_0/bresp]
connect_bd_net [get_bd_pins tgen_0/arvalid]  [get_bd_pins axizero_0/s1_axi_arvalid]
connect_bd_net [get_bd_pins axizero_0/s1_axi_arready] [get_bd_pins tgen_0/arready]
connect_bd_net [get_bd_pins tgen_0/araddr]   [get_bd_pins axizero_0/s1_axi_araddr]
connect_bd_net [get_bd_pins tgen_0/arprot]   [get_bd_pins axizero_0/s1_axi_arprot]
connect_bd_net [get_bd_pins axizero_0/s1_axi_rvalid]  [get_bd_pins tgen_0/rvalid]
connect_bd_net [get_bd_pins tgen_0/rready]   [get_bd_pins axizero_0/s1_axi_rready]
connect_bd_net [get_bd_pins axizero_0/s1_axi_rdata]   [get_bd_pins tgen_0/rdata]
connect_bd_net [get_bd_pins axizero_0/s1_axi_rresp]   [get_bd_pins tgen_0/rresp]

## ── GPIO trigger: bit 3 of gpio_io_o → tgen_0/trigger ────────────────────
create_bd_cell -type ip -vlnv xilinx.com:ip:xlslice:1.0 tgen_trigger_slice
set_property -dict {CONFIG.DIN_WIDTH {4} CONFIG.DIN_FROM {3} CONFIG.DIN_TO {3}} [get_bd_cells tgen_trigger_slice]

## ── m0: axiZero → AXI BRAM Controller 0 (64 KB, ID width=2) ─────────────
create_bd_cell -type ip -vlnv xilinx.com:ip:axi_bram_ctrl:4.1 axi_bram_ctrl_0
set_property -dict {
    CONFIG.DATA_WIDTH      {32}
    CONFIG.SINGLE_PORT_BRAM {0}
    CONFIG.MEM_DEPTH       {65536}
    CONFIG.ID_WIDTH        {2}
} [get_bd_cells axi_bram_ctrl_0]
create_bd_cell -type ip -vlnv xilinx.com:ip:blk_mem_gen:8.4 bram0
set_property -dict {
    CONFIG.Memory_Type         {True_Dual_Port_RAM}
    CONFIG.Use_Byte_Write_Enable {true}
    CONFIG.Byte_Size           {8}
    CONFIG.Write_Width_A {32}  CONFIG.Read_Width_A {32}
    CONFIG.Write_Depth_A {16384}
    CONFIG.Write_Width_B {32}  CONFIG.Read_Width_B {32}
    CONFIG.Enable_B {Use_ENB_Pin}
    CONFIG.use_bram_block {BRAM_Controller}
} [get_bd_cells bram0]

connect_bd_net [get_bd_ports sys_clk]                            [get_bd_pins axi_bram_ctrl_0/s_axi_aclk]
connect_bd_net [get_bd_pins proc_sys_reset_0/peripheral_aresetn] [get_bd_pins axi_bram_ctrl_0/s_axi_aresetn]
connect_bd_intf_net [get_bd_intf_pins axi_bram_ctrl_0/BRAM_PORTA] [get_bd_intf_pins bram0/BRAM_PORTA]
connect_bd_intf_net [get_bd_intf_pins axi_bram_ctrl_0/BRAM_PORTB] [get_bd_intf_pins bram0/BRAM_PORTB]

# AW
connect_bd_net [get_bd_pins axizero_0/m0_axi_awvalid]  [get_bd_pins axi_bram_ctrl_0/s_axi_awvalid]
connect_bd_net [get_bd_pins axi_bram_ctrl_0/s_axi_awready] [get_bd_pins axizero_0/m0_axi_awready]
connect_bd_net [get_bd_pins axizero_0/m0_axi_awaddr]   [get_bd_pins axi_bram_ctrl_0/s_axi_awaddr]
# AWID → id_echo_0 (BRAM ctrl has no ID support; echo module captures & returns IDs)
connect_bd_net [get_bd_pins axizero_0/m0_axi_awid]     [get_bd_pins id_echo_0/s_awid]
connect_bd_net [get_bd_pins axizero_0/m0_axi_awvalid]   [get_bd_pins id_echo_0/s_awvalid]
connect_bd_net [get_bd_pins axi_bram_ctrl_0/s_axi_awready] [get_bd_pins id_echo_0/s_awready]
connect_bd_net [get_bd_pins axizero_0/m0_axi_awlen]    [get_bd_pins axi_bram_ctrl_0/s_axi_awlen]
connect_bd_net [get_bd_pins axizero_0/m0_axi_awsize]   [get_bd_pins axi_bram_ctrl_0/s_axi_awsize]
connect_bd_net [get_bd_pins axizero_0/m0_axi_awburst]  [get_bd_pins axi_bram_ctrl_0/s_axi_awburst]
connect_bd_net [get_bd_pins axizero_0/m0_axi_awlock]   [get_bd_pins axi_bram_ctrl_0/s_axi_awlock]
connect_bd_net [get_bd_pins axizero_0/m0_axi_awcache]  [get_bd_pins axi_bram_ctrl_0/s_axi_awcache]
connect_bd_net [get_bd_pins axizero_0/m0_axi_awprot]   [get_bd_pins axi_bram_ctrl_0/s_axi_awprot]
# W
connect_bd_net [get_bd_pins axizero_0/m0_axi_wvalid]   [get_bd_pins axi_bram_ctrl_0/s_axi_wvalid]
connect_bd_net [get_bd_pins axi_bram_ctrl_0/s_axi_wready]  [get_bd_pins axizero_0/m0_axi_wready]
connect_bd_net [get_bd_pins axizero_0/m0_axi_wdata]    [get_bd_pins axi_bram_ctrl_0/s_axi_wdata]
connect_bd_net [get_bd_pins axizero_0/m0_axi_wstrb]    [get_bd_pins axi_bram_ctrl_0/s_axi_wstrb]
connect_bd_net [get_bd_pins axizero_0/m0_axi_wlast]    [get_bd_pins axi_bram_ctrl_0/s_axi_wlast]
# B
connect_bd_net [get_bd_pins axi_bram_ctrl_0/s_axi_bvalid]  [get_bd_pins axizero_0/m0_axi_bvalid]
connect_bd_net [get_bd_pins axizero_0/m0_axi_bready]   [get_bd_pins axi_bram_ctrl_0/s_axi_bready]
# BID from id_echo_0
connect_bd_net [get_bd_pins id_echo_0/s_bid]            [get_bd_pins axizero_0/m0_axi_bid]
connect_bd_net [get_bd_pins axi_bram_ctrl_0/s_axi_bvalid] [get_bd_pins id_echo_0/s_bvalid]
connect_bd_net [get_bd_pins axizero_0/m0_axi_bready]    [get_bd_pins id_echo_0/s_bready]
connect_bd_net [get_bd_pins axi_bram_ctrl_0/s_axi_bresp]   [get_bd_pins axizero_0/m0_axi_bresp]
# AR
connect_bd_net [get_bd_pins axizero_0/m0_axi_arvalid]  [get_bd_pins axi_bram_ctrl_0/s_axi_arvalid]
connect_bd_net [get_bd_pins axi_bram_ctrl_0/s_axi_arready] [get_bd_pins axizero_0/m0_axi_arready]
connect_bd_net [get_bd_pins axizero_0/m0_axi_araddr]   [get_bd_pins axi_bram_ctrl_0/s_axi_araddr]
# ARID → id_echo_0
connect_bd_net [get_bd_pins axizero_0/m0_axi_arid]     [get_bd_pins id_echo_0/s_arid]
connect_bd_net [get_bd_pins axizero_0/m0_axi_arvalid]   [get_bd_pins id_echo_0/s_arvalid]
connect_bd_net [get_bd_pins axi_bram_ctrl_0/s_axi_arready] [get_bd_pins id_echo_0/s_arready]
connect_bd_net [get_bd_pins axizero_0/m0_axi_arlen]    [get_bd_pins axi_bram_ctrl_0/s_axi_arlen]
connect_bd_net [get_bd_pins axizero_0/m0_axi_arsize]   [get_bd_pins axi_bram_ctrl_0/s_axi_arsize]
connect_bd_net [get_bd_pins axizero_0/m0_axi_arburst]  [get_bd_pins axi_bram_ctrl_0/s_axi_arburst]
connect_bd_net [get_bd_pins axizero_0/m0_axi_arlock]   [get_bd_pins axi_bram_ctrl_0/s_axi_arlock]
connect_bd_net [get_bd_pins axizero_0/m0_axi_arcache]  [get_bd_pins axi_bram_ctrl_0/s_axi_arcache]
connect_bd_net [get_bd_pins axizero_0/m0_axi_arprot]   [get_bd_pins axi_bram_ctrl_0/s_axi_arprot]
# R
connect_bd_net [get_bd_pins axi_bram_ctrl_0/s_axi_rvalid]  [get_bd_pins axizero_0/m0_axi_rvalid]
connect_bd_net [get_bd_pins axizero_0/m0_axi_rready]   [get_bd_pins axi_bram_ctrl_0/s_axi_rready]
connect_bd_net [get_bd_pins axi_bram_ctrl_0/s_axi_rdata]   [get_bd_pins axizero_0/m0_axi_rdata]
# RID from id_echo_0
connect_bd_net [get_bd_pins id_echo_0/s_rid]            [get_bd_pins axizero_0/m0_axi_rid]
connect_bd_net [get_bd_pins axi_bram_ctrl_0/s_axi_rvalid] [get_bd_pins id_echo_0/s_rvalid]
connect_bd_net [get_bd_pins axizero_0/m0_axi_rready]    [get_bd_pins id_echo_0/s_rready]
connect_bd_net [get_bd_pins axi_bram_ctrl_0/s_axi_rlast] [get_bd_pins id_echo_0/s_rlast]
connect_bd_net [get_bd_pins axi_bram_ctrl_0/s_axi_rresp]   [get_bd_pins axizero_0/m0_axi_rresp]
connect_bd_net [get_bd_pins axi_bram_ctrl_0/s_axi_rlast]   [get_bd_pins axizero_0/m0_axi_rlast]

## ── m1: axiZero → AXI BRAM Controller 1 (64 KB, ID width=2) ─────────────
create_bd_cell -type ip -vlnv xilinx.com:ip:axi_bram_ctrl:4.1 axi_bram_ctrl_1
set_property -dict {
    CONFIG.DATA_WIDTH      {32}
    CONFIG.SINGLE_PORT_BRAM {0}
    CONFIG.MEM_DEPTH       {65536}
    CONFIG.ID_WIDTH        {2}
} [get_bd_cells axi_bram_ctrl_1]
create_bd_cell -type ip -vlnv xilinx.com:ip:blk_mem_gen:8.4 bram1
set_property -dict {
    CONFIG.Memory_Type         {True_Dual_Port_RAM}
    CONFIG.Use_Byte_Write_Enable {true}
    CONFIG.Byte_Size           {8}
    CONFIG.Write_Width_A {32}  CONFIG.Read_Width_A {32}
    CONFIG.Write_Depth_A {16384}
    CONFIG.Write_Width_B {32}  CONFIG.Read_Width_B {32}
    CONFIG.Enable_B {Use_ENB_Pin}
    CONFIG.use_bram_block {BRAM_Controller}
} [get_bd_cells bram1]

connect_bd_net [get_bd_ports sys_clk]                            [get_bd_pins axi_bram_ctrl_1/s_axi_aclk]
connect_bd_net [get_bd_pins proc_sys_reset_0/peripheral_aresetn] [get_bd_pins axi_bram_ctrl_1/s_axi_aresetn]
connect_bd_intf_net [get_bd_intf_pins axi_bram_ctrl_1/BRAM_PORTA] [get_bd_intf_pins bram1/BRAM_PORTA]
connect_bd_intf_net [get_bd_intf_pins axi_bram_ctrl_1/BRAM_PORTB] [get_bd_intf_pins bram1/BRAM_PORTB]

connect_bd_net [get_bd_pins axizero_0/m1_axi_awvalid]  [get_bd_pins axi_bram_ctrl_1/s_axi_awvalid]
connect_bd_net [get_bd_pins axi_bram_ctrl_1/s_axi_awready] [get_bd_pins axizero_0/m1_axi_awready]
connect_bd_net [get_bd_pins axizero_0/m1_axi_awaddr]   [get_bd_pins axi_bram_ctrl_1/s_axi_awaddr]
# AWID → id_echo_1
connect_bd_net [get_bd_pins axizero_0/m1_axi_awid]     [get_bd_pins id_echo_1/s_awid]
connect_bd_net [get_bd_pins axizero_0/m1_axi_awvalid]   [get_bd_pins id_echo_1/s_awvalid]
connect_bd_net [get_bd_pins axi_bram_ctrl_1/s_axi_awready] [get_bd_pins id_echo_1/s_awready]
connect_bd_net [get_bd_pins axizero_0/m1_axi_awlen]    [get_bd_pins axi_bram_ctrl_1/s_axi_awlen]
connect_bd_net [get_bd_pins axizero_0/m1_axi_awsize]   [get_bd_pins axi_bram_ctrl_1/s_axi_awsize]
connect_bd_net [get_bd_pins axizero_0/m1_axi_awburst]  [get_bd_pins axi_bram_ctrl_1/s_axi_awburst]
connect_bd_net [get_bd_pins axizero_0/m1_axi_awlock]   [get_bd_pins axi_bram_ctrl_1/s_axi_awlock]
connect_bd_net [get_bd_pins axizero_0/m1_axi_awcache]  [get_bd_pins axi_bram_ctrl_1/s_axi_awcache]
connect_bd_net [get_bd_pins axizero_0/m1_axi_awprot]   [get_bd_pins axi_bram_ctrl_1/s_axi_awprot]
connect_bd_net [get_bd_pins axizero_0/m1_axi_wvalid]   [get_bd_pins axi_bram_ctrl_1/s_axi_wvalid]
connect_bd_net [get_bd_pins axi_bram_ctrl_1/s_axi_wready]  [get_bd_pins axizero_0/m1_axi_wready]
connect_bd_net [get_bd_pins axizero_0/m1_axi_wdata]    [get_bd_pins axi_bram_ctrl_1/s_axi_wdata]
connect_bd_net [get_bd_pins axizero_0/m1_axi_wstrb]    [get_bd_pins axi_bram_ctrl_1/s_axi_wstrb]
connect_bd_net [get_bd_pins axizero_0/m1_axi_wlast]    [get_bd_pins axi_bram_ctrl_1/s_axi_wlast]
connect_bd_net [get_bd_pins axi_bram_ctrl_1/s_axi_bvalid]  [get_bd_pins axizero_0/m1_axi_bvalid]
connect_bd_net [get_bd_pins axizero_0/m1_axi_bready]   [get_bd_pins axi_bram_ctrl_1/s_axi_bready]
# BID from id_echo_1
connect_bd_net [get_bd_pins id_echo_1/s_bid]            [get_bd_pins axizero_0/m1_axi_bid]
connect_bd_net [get_bd_pins axi_bram_ctrl_1/s_axi_bvalid] [get_bd_pins id_echo_1/s_bvalid]
connect_bd_net [get_bd_pins axizero_0/m1_axi_bready]    [get_bd_pins id_echo_1/s_bready]
connect_bd_net [get_bd_pins axi_bram_ctrl_1/s_axi_bresp]   [get_bd_pins axizero_0/m1_axi_bresp]
connect_bd_net [get_bd_pins axizero_0/m1_axi_arvalid]  [get_bd_pins axi_bram_ctrl_1/s_axi_arvalid]
connect_bd_net [get_bd_pins axi_bram_ctrl_1/s_axi_arready] [get_bd_pins axizero_0/m1_axi_arready]
connect_bd_net [get_bd_pins axizero_0/m1_axi_araddr]   [get_bd_pins axi_bram_ctrl_1/s_axi_araddr]
# ARID → id_echo_1
connect_bd_net [get_bd_pins axizero_0/m1_axi_arid]     [get_bd_pins id_echo_1/s_arid]
connect_bd_net [get_bd_pins axizero_0/m1_axi_arvalid]   [get_bd_pins id_echo_1/s_arvalid]
connect_bd_net [get_bd_pins axi_bram_ctrl_1/s_axi_arready] [get_bd_pins id_echo_1/s_arready]
connect_bd_net [get_bd_pins axizero_0/m1_axi_arlen]    [get_bd_pins axi_bram_ctrl_1/s_axi_arlen]
connect_bd_net [get_bd_pins axizero_0/m1_axi_arsize]   [get_bd_pins axi_bram_ctrl_1/s_axi_arsize]
connect_bd_net [get_bd_pins axizero_0/m1_axi_arburst]  [get_bd_pins axi_bram_ctrl_1/s_axi_arburst]
connect_bd_net [get_bd_pins axizero_0/m1_axi_arlock]   [get_bd_pins axi_bram_ctrl_1/s_axi_arlock]
connect_bd_net [get_bd_pins axizero_0/m1_axi_arcache]  [get_bd_pins axi_bram_ctrl_1/s_axi_arcache]
connect_bd_net [get_bd_pins axizero_0/m1_axi_arprot]   [get_bd_pins axi_bram_ctrl_1/s_axi_arprot]
connect_bd_net [get_bd_pins axi_bram_ctrl_1/s_axi_rvalid]  [get_bd_pins axizero_0/m1_axi_rvalid]
connect_bd_net [get_bd_pins axizero_0/m1_axi_rready]   [get_bd_pins axi_bram_ctrl_1/s_axi_rready]
connect_bd_net [get_bd_pins axi_bram_ctrl_1/s_axi_rdata]   [get_bd_pins axizero_0/m1_axi_rdata]
# RID from id_echo_1
connect_bd_net [get_bd_pins id_echo_1/s_rid]            [get_bd_pins axizero_0/m1_axi_rid]
connect_bd_net [get_bd_pins axi_bram_ctrl_1/s_axi_rvalid] [get_bd_pins id_echo_1/s_rvalid]
connect_bd_net [get_bd_pins axizero_0/m1_axi_rready]    [get_bd_pins id_echo_1/s_rready]
connect_bd_net [get_bd_pins axi_bram_ctrl_1/s_axi_rlast] [get_bd_pins id_echo_1/s_rlast]
connect_bd_net [get_bd_pins axi_bram_ctrl_1/s_axi_rresp]   [get_bd_pins axizero_0/m1_axi_rresp]
connect_bd_net [get_bd_pins axi_bram_ctrl_1/s_axi_rlast]   [get_bd_pins axizero_0/m1_axi_rlast]

## ── m2: axiZero → AXI GPIO (AXI-Lite) ────────────────────────────────────
create_bd_cell -type ip -vlnv xilinx.com:ip:axi_gpio:2.0 axi_gpio_0
set_property -dict {
    CONFIG.C_GPIO_WIDTH  {4}
    CONFIG.C_ALL_OUTPUTS {1}
} [get_bd_cells axi_gpio_0]

connect_bd_net [get_bd_ports sys_clk]                            [get_bd_pins axi_gpio_0/s_axi_aclk]
connect_bd_net [get_bd_pins proc_sys_reset_0/peripheral_aresetn] [get_bd_pins axi_gpio_0/s_axi_aresetn]
# GPIO output → LEDs (all 4 bits) AND trigger slice (bit 3)
connect_bd_net [get_bd_pins axi_gpio_0/gpio_io_o] [get_bd_ports leds]
connect_bd_net [get_bd_pins axi_gpio_0/gpio_io_o] [get_bd_pins tgen_trigger_slice/Din]
connect_bd_net [get_bd_pins tgen_trigger_slice/Dout] [get_bd_pins tgen_0/trigger]

# AW
connect_bd_net [get_bd_pins axizero_0/m2_axi_awvalid]  [get_bd_pins axi_gpio_0/s_axi_awvalid]
connect_bd_net [get_bd_pins axi_gpio_0/s_axi_awready]  [get_bd_pins axizero_0/m2_axi_awready]
connect_bd_net [get_bd_pins axizero_0/m2_axi_awaddr]   [get_bd_pins axi_gpio_0/s_axi_awaddr]
safe_net axizero_0/m2_axi_awprot axi_gpio_0/s_axi_awprot
# W
connect_bd_net [get_bd_pins axizero_0/m2_axi_wvalid]   [get_bd_pins axi_gpio_0/s_axi_wvalid]
connect_bd_net [get_bd_pins axi_gpio_0/s_axi_wready]   [get_bd_pins axizero_0/m2_axi_wready]
connect_bd_net [get_bd_pins axizero_0/m2_axi_wdata]    [get_bd_pins axi_gpio_0/s_axi_wdata]
connect_bd_net [get_bd_pins axizero_0/m2_axi_wstrb]    [get_bd_pins axi_gpio_0/s_axi_wstrb]
# B
connect_bd_net [get_bd_pins axi_gpio_0/s_axi_bvalid]   [get_bd_pins axizero_0/m2_axi_bvalid]
connect_bd_net [get_bd_pins axizero_0/m2_axi_bready]   [get_bd_pins axi_gpio_0/s_axi_bready]
connect_bd_net [get_bd_pins axi_gpio_0/s_axi_bresp]    [get_bd_pins axizero_0/m2_axi_bresp]
# AR
connect_bd_net [get_bd_pins axizero_0/m2_axi_arvalid]  [get_bd_pins axi_gpio_0/s_axi_arvalid]
connect_bd_net [get_bd_pins axi_gpio_0/s_axi_arready]  [get_bd_pins axizero_0/m2_axi_arready]
connect_bd_net [get_bd_pins axizero_0/m2_axi_araddr]   [get_bd_pins axi_gpio_0/s_axi_araddr]
safe_net axizero_0/m2_axi_arprot axi_gpio_0/s_axi_arprot
# R
connect_bd_net [get_bd_pins axi_gpio_0/s_axi_rvalid]   [get_bd_pins axizero_0/m2_axi_rvalid]
connect_bd_net [get_bd_pins axizero_0/m2_axi_rready]   [get_bd_pins axi_gpio_0/s_axi_rready]
connect_bd_net [get_bd_pins axi_gpio_0/s_axi_rdata]    [get_bd_pins axizero_0/m2_axi_rdata]
connect_bd_net [get_bd_pins axi_gpio_0/s_axi_rresp]    [get_bd_pins axizero_0/m2_axi_rresp]

## ── m3: axiZero → AXI UART Lite (AXI-Lite) ───────────────────────────────
create_bd_cell -type ip -vlnv xilinx.com:ip:axi_uartlite:2.0 axi_uartlite_0
set_property -dict {CONFIG.C_BAUDRATE {115200} CONFIG.C_DATA_BITS {8}} [get_bd_cells axi_uartlite_0]

connect_bd_net [get_bd_ports sys_clk]                            [get_bd_pins axi_uartlite_0/s_axi_aclk]
connect_bd_net [get_bd_pins proc_sys_reset_0/peripheral_aresetn] [get_bd_pins axi_uartlite_0/s_axi_aresetn]
connect_bd_net [get_bd_pins axi_uartlite_0/tx]                   [get_bd_ports uart_rxd_out]
connect_bd_net [get_bd_ports uart_txd_in]                        [get_bd_pins axi_uartlite_0/rx]

connect_bd_net [get_bd_pins axizero_0/m3_axi_awvalid]  [get_bd_pins axi_uartlite_0/s_axi_awvalid]
connect_bd_net [get_bd_pins axi_uartlite_0/s_axi_awready] [get_bd_pins axizero_0/m3_axi_awready]
connect_bd_net [get_bd_pins axizero_0/m3_axi_awaddr]   [get_bd_pins axi_uartlite_0/s_axi_awaddr]
connect_bd_net [get_bd_pins axizero_0/m3_axi_wvalid]   [get_bd_pins axi_uartlite_0/s_axi_wvalid]
connect_bd_net [get_bd_pins axi_uartlite_0/s_axi_wready]  [get_bd_pins axizero_0/m3_axi_wready]
connect_bd_net [get_bd_pins axizero_0/m3_axi_wdata]    [get_bd_pins axi_uartlite_0/s_axi_wdata]
connect_bd_net [get_bd_pins axizero_0/m3_axi_wstrb]    [get_bd_pins axi_uartlite_0/s_axi_wstrb]
connect_bd_net [get_bd_pins axi_uartlite_0/s_axi_bvalid]  [get_bd_pins axizero_0/m3_axi_bvalid]
connect_bd_net [get_bd_pins axizero_0/m3_axi_bready]   [get_bd_pins axi_uartlite_0/s_axi_bready]
connect_bd_net [get_bd_pins axi_uartlite_0/s_axi_bresp]   [get_bd_pins axizero_0/m3_axi_bresp]
connect_bd_net [get_bd_pins axizero_0/m3_axi_arvalid]  [get_bd_pins axi_uartlite_0/s_axi_arvalid]
connect_bd_net [get_bd_pins axi_uartlite_0/s_axi_arready] [get_bd_pins axizero_0/m3_axi_arready]
connect_bd_net [get_bd_pins axizero_0/m3_axi_araddr]   [get_bd_pins axi_uartlite_0/s_axi_araddr]
connect_bd_net [get_bd_pins axi_uartlite_0/s_axi_rvalid]  [get_bd_pins axizero_0/m3_axi_rvalid]
connect_bd_net [get_bd_pins axizero_0/m3_axi_rready]   [get_bd_pins axi_uartlite_0/s_axi_rready]
connect_bd_net [get_bd_pins axi_uartlite_0/s_axi_rdata]   [get_bd_pins axizero_0/m3_axi_rdata]
connect_bd_net [get_bd_pins axi_uartlite_0/s_axi_rresp]   [get_bd_pins axizero_0/m3_axi_rresp]

## ─── 5. Address editor ───────────────────────────────────────────────────────
assign_bd_address [get_bd_addr_segs {axi_bram_ctrl_0/S_AXI/Mem0}]    -range 64K -offset 0xC0000000
assign_bd_address [get_bd_addr_segs {axi_bram_ctrl_1/S_AXI/Mem0}]    -range 64K -offset 0xC0010000
assign_bd_address [get_bd_addr_segs {axi_gpio_0/S_AXI/Reg}]          -range  4K -offset 0xC0020000
assign_bd_address [get_bd_addr_segs {axi_uartlite_0/S_AXI/Reg}]      -range  4K -offset 0xC0030000
assign_bd_address [get_bd_addr_segs {ilmb_bram_if_cntlr_0/SLMB/Mem}] -range 32K -offset 0x00000000
assign_bd_address [get_bd_addr_segs {dlmb_bram_if_cntlr_0/SLMB/Mem}] -range 32K -offset 0x00000000

## C_MASK fix (same as base design)
set_property CONFIG.C_MASK {0x00000000FFFF8000} [get_bd_cells dlmb_bram_if_cntlr_0]
set_property CONFIG.C_MASK {0x00000000FFFF8000} [get_bd_cells ilmb_bram_if_cntlr_0]

## ─── 6. Validate and generate ────────────────────────────────────────────────
## NOTE: blk_mem_gen Write_Depth_A defaults to 2048 (8KB) because the custom
## crossbar module has no BD-recognized AXI path, so the address editor can't
## propagate MEM_DEPTH to the BRAM controllers.  All test addresses must fit
## within the 8KB physical BRAM to avoid aliasing.
validate_bd_design
save_bd_design
make_wrapper -files [get_files system.bd] -top
add_files -norecurse "$proj_dir/axizero_arty_wrr.srcs/sources_1/bd/system/hdl/system_wrapper.v"
set_property top system_wrapper [current_fileset]

## ─── 7. Constraints ──────────────────────────────────────────────────────────
add_files -fileset constrs_1 -norecurse "$script_dir/constraints/arty_a7_100t.xdc"

## ─── 8. Build ────────────────────────────────────────────────────────────────
launch_runs synth_1 -jobs 4
wait_on_run synth_1
launch_runs impl_1 -to_step write_bitstream -jobs 4
wait_on_run impl_1

puts "\n\[axiZero-WRR\] Project: $proj_dir"
puts "\[axiZero-WRR\] Bitstream: $proj_dir/axizero_arty_wrr.runs/impl_1/system_wrapper.bit"
