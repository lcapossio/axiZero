# Copyright (c) 2026 Leonardo Capossio — bard0 design  hello@bard0.com
# SPDX-License-Identifier: MIT
## =============================================================================
## create_project.tcl  —  Arty A7-100T axiZero hardware test
##
## Tested with Vivado 2023.1 / 2022.2.
## Targets: xc7a100tcsg324-1
##
## Prerequisites
## ─────────────
##   1.  Run:  sbt "runMain axizero.gen.ArtyDutGen"
##             from the repository root to regenerate
##             hw/vivado/arty_a7/ip/rtl/AxiZeroArtyDUT.v
##
##   2.  Source this script from the Vivado Tcl Console or batch mode:
##         vivado -mode batch -source hw/vivado/arty_a7/create_project.tcl
##       (run from the repository root)
##
## What this script does
## ─────────────────────
##   • Creates project  hw/vivado/arty_a7/axizero_arty/
##   • Adds the axiZero RTL (AxiZeroArtyDUT.v = AxiZeroMixedTop module)
##   • Creates a block design "system" with:
##       - MicroBlaze (no cache, debug-only)
##       - LMB + 32 KB local BRAM  (0x0000_0000 – 0x0000_7FFF)
##       - axiZero crossbar (RTL module reference) for M_AXI_DP
##       - AXI BRAM Controller 0 → 64 KB BRAM  (0xC000_0000)
##       - AXI BRAM Controller 1 → 64 KB BRAM  (0xC001_0000)
##       - AXI GPIO (4 LEDs)                   (0xC002_0000)
##       - AXI UART Lite (115200 baud)          (0xC003_0000)
##   • Generates the block-design HDL wrapper
##   • Adds XDC constraints
##   • Runs synthesis and implementation through bitstream
##
## =============================================================================

set script_dir [file dirname [file normalize [info script]]]
set repo_root  [file normalize "$script_dir/../../.."]

## ─── 1. Project creation ────────────────────────────────────────────────────
set proj_dir "$script_dir/axizero_arty"

create_project axizero_arty $proj_dir -part xc7a100tcsg324-1 -force
# Board files optional — gracefully skip if not installed
catch { set_property board_part digilentinc.com:arty-a7-100:part0:1.1 [current_project] } errmsg
if {[string length $errmsg] > 0} {
    puts "\[axiZero\] Note: board_part not found (Digilent board files not installed) — continuing with part only."
}

## ─── 2. RTL sources: axiZero crossbar ───────────────────────────────────────
add_files -norecurse "$script_dir/ip/rtl/AxiZeroArtyDUT.v"
set_property file_type {Verilog} [get_files AxiZeroArtyDUT.v]
update_compile_order -fileset sources_1

## ─── 3. Generate required Xilinx IPs ────────────────────────────────────────

# -- AXI BRAM Controller 0 (64 KB, ID width = 1) --
create_ip -name axi_bram_ctrl -vendor xilinx.com -library ip \
          -version 4.1 -module_name axi_bram_ctrl_0
set_property -dict {
    CONFIG.DATA_WIDTH      {32}
    CONFIG.SINGLE_PORT_BRAM {0}
    CONFIG.ECC_TYPE        {0}
    CONFIG.ID_WIDTH        {1}
    CONFIG.SUPPORTS_NARROW_BURST {0}
} [get_ips axi_bram_ctrl_0]
generate_target {synthesis simulation} [get_ips axi_bram_ctrl_0]

# -- BRAM for BRAM Controller 0 (64 KB, dual-port) --
create_ip -name blk_mem_gen -vendor xilinx.com -library ip \
          -version 8.4 -module_name blk_mem_gen_0
set_property -dict {
    CONFIG.Memory_Type         {True_Dual_Port_RAM}
    CONFIG.Use_Byte_Write_Enable {true}
    CONFIG.Byte_Size           {8}
    CONFIG.Write_Width_A       {32}
    CONFIG.Read_Width_A        {32}
    CONFIG.Write_Depth_A       {16384}
    CONFIG.Write_Width_B       {32}
    CONFIG.Read_Width_B        {32}
    CONFIG.Enable_B            {Use_ENB_Pin}
    CONFIG.Register_PortA_Output_of_Memory_Primitives {false}
    CONFIG.Register_PortB_Output_of_Memory_Primitives {false}
    CONFIG.Use_RSTA_Pin        {true}
    CONFIG.Use_RSTB_Pin        {true}
    CONFIG.use_bram_block      {BRAM_Controller}
} [get_ips blk_mem_gen_0]
generate_target {synthesis simulation} [get_ips blk_mem_gen_0]

# -- AXI BRAM Controller 1 (64 KB, ID width = 1) --
create_ip -name axi_bram_ctrl -vendor xilinx.com -library ip \
          -version 4.1 -module_name axi_bram_ctrl_1
set_property -dict {
    CONFIG.DATA_WIDTH      {32}
    CONFIG.SINGLE_PORT_BRAM {0}
    CONFIG.ECC_TYPE        {0}
    CONFIG.ID_WIDTH        {1}
    CONFIG.SUPPORTS_NARROW_BURST {0}
} [get_ips axi_bram_ctrl_1]
generate_target {synthesis simulation} [get_ips axi_bram_ctrl_1]

# -- BRAM for BRAM Controller 1 --
create_ip -name blk_mem_gen -vendor xilinx.com -library ip \
          -version 8.4 -module_name blk_mem_gen_1
set_property -dict {
    CONFIG.Memory_Type         {True_Dual_Port_RAM}
    CONFIG.Use_Byte_Write_Enable {true}
    CONFIG.Byte_Size           {8}
    CONFIG.Write_Width_A       {32}
    CONFIG.Read_Width_A        {32}
    CONFIG.Write_Depth_A       {16384}
    CONFIG.Write_Width_B       {32}
    CONFIG.Read_Width_B        {32}
    CONFIG.Enable_B            {Use_ENB_Pin}
    CONFIG.Register_PortA_Output_of_Memory_Primitives {false}
    CONFIG.Register_PortB_Output_of_Memory_Primitives {false}
    CONFIG.Use_RSTA_Pin        {true}
    CONFIG.Use_RSTB_Pin        {true}
    CONFIG.use_bram_block      {BRAM_Controller}
} [get_ips blk_mem_gen_1]
generate_target {synthesis simulation} [get_ips blk_mem_gen_1]

# -- AXI GPIO (4 LEDs, tri-state off) --
create_ip -name axi_gpio -vendor xilinx.com -library ip \
          -version 2.0 -module_name axi_gpio_0
set_property -dict {
    CONFIG.C_GPIO_WIDTH      {4}
    CONFIG.C_ALL_OUTPUTS     {1}
    CONFIG.C_DOUT_DEFAULT    {0x00000000}
    CONFIG.C_IS_DUAL         {0}
} [get_ips axi_gpio_0]
generate_target {synthesis simulation} [get_ips axi_gpio_0]

# -- AXI UART Lite (115200 baud) --
create_ip -name axi_uartlite -vendor xilinx.com -library ip \
          -version 2.0 -module_name axi_uartlite_0
set_property -dict {
    CONFIG.C_BAUDRATE  {115200}
    CONFIG.C_DATA_BITS {8}
    CONFIG.C_ODD_PARITY {0}
    CONFIG.C_USE_PARITY {0}
} [get_ips axi_uartlite_0]
generate_target {synthesis simulation} [get_ips axi_uartlite_0]

## ─── 4. Block Design ─────────────────────────────────────────────────────────

# safe_net: connect two pins/ports by name; silently skip if either is absent.
# Usage: safe_net src_pin dst_pin
proc safe_net {a b} {
    set pa {}; set pb {}
    catch { set pa [get_bd_pins $a] }
    catch { set pb [get_bd_pins $b] }
    # Fall back to bd ports if not a cell pin
    if {$pa eq ""} { catch { set pa [get_bd_ports $a] } }
    if {$pb eq ""} { catch { set pb [get_bd_ports $b] } }
    if {$pa eq "" || $pb eq ""} {
        puts "\[axiZero\] skip: $a <-> $b (pin not found in this Vivado version)"
        return
    }
    connect_bd_net $pa $pb
}

create_bd_design "system"

## -- Clock and reset infrastructure --
create_bd_cell -type ip -vlnv xilinx.com:ip:proc_sys_reset:5.0 proc_sys_reset_0

create_bd_port -dir I -type clk sys_clk
set_property CONFIG.FREQ_HZ 100000000 [get_bd_ports sys_clk]
## sys_reset tied low — no external reset; proc_sys_reset uses dcm_locked for init pulse
create_bd_port -dir O -from 3 -to 0 leds
create_bd_port -dir O uart_rxd_out
create_bd_port -dir I uart_txd_in

connect_bd_net [get_bd_ports sys_clk]   [get_bd_pins proc_sys_reset_0/slowest_sync_clk]
# ext_reset_in tied low (inactive) — no external reset button needed
# dcm_locked tied to VCC — no MMCM in design, clock is always valid
create_bd_cell -type ip -vlnv xilinx.com:ip:xlconstant:1.1 const_vcc
set_property CONFIG.CONST_WIDTH {1} [get_bd_cells const_vcc]
set_property CONFIG.CONST_VAL   {1} [get_bd_cells const_vcc]
connect_bd_net [get_bd_pins const_vcc/dout] [get_bd_pins proc_sys_reset_0/dcm_locked]
connect_bd_net [get_bd_pins const_vcc/dout] [get_bd_pins proc_sys_reset_0/ext_reset_in]

## -- MicroBlaze --
create_bd_cell -type ip -vlnv xilinx.com:ip:microblaze:11.0 microblaze_0
# C_USE_MULT was removed in MicroBlaze 11.0 (Vivado 2024+); use catch for forward compat
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

connect_bd_net [get_bd_ports sys_clk]                           [get_bd_pins microblaze_0/Clk]
connect_bd_net [get_bd_pins proc_sys_reset_0/mb_reset]          [get_bd_pins microblaze_0/Reset]

## -- MicroBlaze Debug Module --
# Pin names vary by Vivado version: S_AXI_ACLK (pre-2024), Clk (2024+)
create_bd_cell -type ip -vlnv xilinx.com:ip:mdm:3.2 mdm_0
safe_net sys_clk mdm_0/S_AXI_ACLK
safe_net sys_clk mdm_0/Clk
safe_net proc_sys_reset_0/peripheral_aresetn mdm_0/S_AXI_ARESETN
connect_bd_intf_net [get_bd_intf_pins microblaze_0/DEBUG] \
                    [get_bd_intf_pins mdm_0/MBDEBUG_0]
# mdm_0/Debug_SYS_Rst intentionally NOT connected to mb_debug_sys_rst:
# Connecting it causes a feedback loop: xsdb stop → MDM asserts Debug_SYS_Rst
# → proc_sys_reset_0 asserts mb_reset → MB is RESET (all registers cleared, PC lost)
# MDM halts MB via its own debug mechanism; no system reset needed.

## -- LMB infrastructure (32 KB local instruction + data BRAM) --
create_bd_cell -type ip -vlnv xilinx.com:ip:lmb_v10:3.0 ilmb_v10_0
create_bd_cell -type ip -vlnv xilinx.com:ip:lmb_v10:3.0 dlmb_v10_0
create_bd_cell -type ip -vlnv xilinx.com:ip:lmb_bram_if_cntlr:4.0 ilmb_bram_if_cntlr_0
create_bd_cell -type ip -vlnv xilinx.com:ip:lmb_bram_if_cntlr:4.0 dlmb_bram_if_cntlr_0
create_bd_cell -type ip -vlnv xilinx.com:ip:blk_mem_gen:8.4 lmb_bram_0
set_property -dict {
    CONFIG.Memory_Type {True_Dual_Port_RAM}
    CONFIG.Use_Byte_Write_Enable {true}
    CONFIG.Byte_Size {8}
    CONFIG.Write_Width_A {32}
    CONFIG.Read_Width_A  {32}
    CONFIG.Write_Depth_A {8192}
    CONFIG.Write_Width_B {32}
    CONFIG.Read_Width_B  {32}
    CONFIG.Enable_B  {Use_ENB_Pin}
    CONFIG.Register_PortA_Output_of_Memory_Primitives {false}
    CONFIG.Register_PortB_Output_of_Memory_Primitives {false}
} [get_bd_cells lmb_bram_0]

connect_bd_net [get_bd_ports sys_clk] [get_bd_pins ilmb_v10_0/LMB_Clk]
connect_bd_net [get_bd_ports sys_clk] [get_bd_pins dlmb_v10_0/LMB_Clk]
connect_bd_net [get_bd_pins proc_sys_reset_0/mb_reset] [get_bd_pins ilmb_v10_0/SYS_Rst]
connect_bd_net [get_bd_pins proc_sys_reset_0/mb_reset] [get_bd_pins dlmb_v10_0/SYS_Rst]

connect_bd_intf_net [get_bd_intf_pins microblaze_0/ILMB] [get_bd_intf_pins ilmb_v10_0/LMB_M]
connect_bd_intf_net [get_bd_intf_pins microblaze_0/DLMB] [get_bd_intf_pins dlmb_v10_0/LMB_M]
connect_bd_intf_net [get_bd_intf_pins ilmb_v10_0/LMB_Sl_0] \
                    [get_bd_intf_pins ilmb_bram_if_cntlr_0/SLMB]
connect_bd_intf_net [get_bd_intf_pins dlmb_v10_0/LMB_Sl_0] \
                    [get_bd_intf_pins dlmb_bram_if_cntlr_0/SLMB]
connect_bd_intf_net [get_bd_intf_pins ilmb_bram_if_cntlr_0/BRAM_PORT] \
                    [get_bd_intf_pins lmb_bram_0/BRAM_PORTA]
connect_bd_intf_net [get_bd_intf_pins dlmb_bram_if_cntlr_0/BRAM_PORT] \
                    [get_bd_intf_pins lmb_bram_0/BRAM_PORTB]
connect_bd_net [get_bd_ports sys_clk] [get_bd_pins ilmb_bram_if_cntlr_0/LMB_Clk]
connect_bd_net [get_bd_ports sys_clk] [get_bd_pins dlmb_bram_if_cntlr_0/LMB_Clk]
connect_bd_net [get_bd_pins proc_sys_reset_0/mb_reset] [get_bd_pins ilmb_bram_if_cntlr_0/LMB_Rst]
connect_bd_net [get_bd_pins proc_sys_reset_0/mb_reset] [get_bd_pins dlmb_bram_if_cntlr_0/LMB_Rst]

## -- axiZero crossbar (RTL module reference) --
create_bd_cell -type module -reference AxiZeroMixedTop axizero_0

connect_bd_net [get_bd_ports sys_clk] [get_bd_pins axizero_0/aclk]
connect_bd_net [get_bd_pins proc_sys_reset_0/peripheral_aresetn] \
               [get_bd_pins axizero_0/aresetn]

## ── axiZero M0 ← MicroBlaze M_AXI_DP ───────────────────────────────────────
# MicroBlaze 11.0 without cache exposes only AXI4-Lite signals on M_AXI_DP.
# Full-AXI4 extras (AWLEN/AWSIZE/AWBURST/AWLOCK/AWCACHE/AWQOS/AWID/WLAST etc.)
# are not present. We tie them to safe constants so axiZero sees valid single-
# beat AXI4 transactions (AWLEN=0, AWSIZE=2, AWBURST=INCR, WLAST=1).

# ── Constants for Full-AXI4 extras ──────────────────────────────────────────
# 1-bit 0 (ID=0, LOCK=0)
create_bd_cell -type ip -vlnv xilinx.com:ip:xlconstant:1.1 const_1b0
set_property CONFIG.CONST_WIDTH {1} [get_bd_cells const_1b0]
set_property CONFIG.CONST_VAL   {0} [get_bd_cells const_1b0]
# 1-bit 1 (WLAST=1, single-beat always last)
create_bd_cell -type ip -vlnv xilinx.com:ip:xlconstant:1.1 const_wlast
set_property CONFIG.CONST_WIDTH {1} [get_bd_cells const_wlast]
set_property CONFIG.CONST_VAL   {1} [get_bd_cells const_wlast]
# 2-bit 1 = INCR burst
create_bd_cell -type ip -vlnv xilinx.com:ip:xlconstant:1.1 const_burst_incr
set_property CONFIG.CONST_WIDTH {2} [get_bd_cells const_burst_incr]
set_property CONFIG.CONST_VAL   {1} [get_bd_cells const_burst_incr]
# 3-bit 2 = AXSIZE 32-bit word
create_bd_cell -type ip -vlnv xilinx.com:ip:xlconstant:1.1 const_size_word
set_property CONFIG.CONST_WIDTH {3} [get_bd_cells const_size_word]
set_property CONFIG.CONST_VAL   {2} [get_bd_cells const_size_word]
# 4-bit 0 (CACHE=0, QOS=0, REGION=0)
create_bd_cell -type ip -vlnv xilinx.com:ip:xlconstant:1.1 const_4b0
set_property CONFIG.CONST_WIDTH {4} [get_bd_cells const_4b0]
set_property CONFIG.CONST_VAL   {0} [get_bd_cells const_4b0]
# 8-bit 0 (AWLEN=0 = single beat)
create_bd_cell -type ip -vlnv xilinx.com:ip:xlconstant:1.1 const_8b0
set_property CONFIG.CONST_WIDTH {8} [get_bd_cells const_8b0]
set_property CONFIG.CONST_VAL   {0} [get_bd_cells const_8b0]

# ── AW channel ───────────────────────────────────────────────────────────────
connect_bd_net [get_bd_pins microblaze_0/M_AXI_DP_AWVALID] [get_bd_pins axizero_0/s0_axi_awvalid]
connect_bd_net [get_bd_pins axizero_0/s0_axi_awready] [get_bd_pins microblaze_0/M_AXI_DP_AWREADY]
connect_bd_net [get_bd_pins microblaze_0/M_AXI_DP_AWADDR]  [get_bd_pins axizero_0/s0_axi_awaddr]
connect_bd_net [get_bd_pins microblaze_0/M_AXI_DP_AWPROT]  [get_bd_pins axizero_0/s0_axi_awprot]
# Full-AXI4 extras absent on MB Lite interface — tied to constants
connect_bd_net [get_bd_pins const_1b0/dout]       [get_bd_pins axizero_0/s0_axi_awid]
connect_bd_net [get_bd_pins const_8b0/dout]       [get_bd_pins axizero_0/s0_axi_awlen]
connect_bd_net [get_bd_pins const_size_word/dout] [get_bd_pins axizero_0/s0_axi_awsize]
connect_bd_net [get_bd_pins const_burst_incr/dout] [get_bd_pins axizero_0/s0_axi_awburst]
connect_bd_net [get_bd_pins const_1b0/dout]       [get_bd_pins axizero_0/s0_axi_awlock]
connect_bd_net [get_bd_pins const_4b0/dout]       [get_bd_pins axizero_0/s0_axi_awcache]
connect_bd_net [get_bd_pins const_4b0/dout]       [get_bd_pins axizero_0/s0_axi_awqos]
connect_bd_net [get_bd_pins const_4b0/dout]       [get_bd_pins axizero_0/s0_axi_awregion]

# ── W channel ────────────────────────────────────────────────────────────────
connect_bd_net [get_bd_pins microblaze_0/M_AXI_DP_WVALID] [get_bd_pins axizero_0/s0_axi_wvalid]
connect_bd_net [get_bd_pins axizero_0/s0_axi_wready] [get_bd_pins microblaze_0/M_AXI_DP_WREADY]
connect_bd_net [get_bd_pins microblaze_0/M_AXI_DP_WDATA]  [get_bd_pins axizero_0/s0_axi_wdata]
connect_bd_net [get_bd_pins microblaze_0/M_AXI_DP_WSTRB]  [get_bd_pins axizero_0/s0_axi_wstrb]
connect_bd_net [get_bd_pins const_wlast/dout]              [get_bd_pins axizero_0/s0_axi_wlast]

# ── B channel ────────────────────────────────────────────────────────────────
connect_bd_net [get_bd_pins axizero_0/s0_axi_bvalid]        [get_bd_pins microblaze_0/M_AXI_DP_BVALID]
connect_bd_net [get_bd_pins microblaze_0/M_AXI_DP_BREADY]         [get_bd_pins axizero_0/s0_axi_bready]
connect_bd_net [get_bd_pins axizero_0/s0_axi_bresp] [get_bd_pins microblaze_0/M_AXI_DP_BRESP]
# BID not connected — MB doesn't have M_AXI_DP_BID pin

# ── AR channel ───────────────────────────────────────────────────────────────
connect_bd_net [get_bd_pins microblaze_0/M_AXI_DP_ARVALID] [get_bd_pins axizero_0/s0_axi_arvalid]
connect_bd_net [get_bd_pins axizero_0/s0_axi_arready] [get_bd_pins microblaze_0/M_AXI_DP_ARREADY]
connect_bd_net [get_bd_pins microblaze_0/M_AXI_DP_ARADDR]  [get_bd_pins axizero_0/s0_axi_araddr]
connect_bd_net [get_bd_pins microblaze_0/M_AXI_DP_ARPROT]  [get_bd_pins axizero_0/s0_axi_arprot]
# Full-AXI4 extras tied to constants
connect_bd_net [get_bd_pins const_1b0/dout]       [get_bd_pins axizero_0/s0_axi_arid]
connect_bd_net [get_bd_pins const_8b0/dout]       [get_bd_pins axizero_0/s0_axi_arlen]
connect_bd_net [get_bd_pins const_size_word/dout] [get_bd_pins axizero_0/s0_axi_arsize]
connect_bd_net [get_bd_pins const_burst_incr/dout] [get_bd_pins axizero_0/s0_axi_arburst]
connect_bd_net [get_bd_pins const_1b0/dout]       [get_bd_pins axizero_0/s0_axi_arlock]
connect_bd_net [get_bd_pins const_4b0/dout]       [get_bd_pins axizero_0/s0_axi_arcache]
connect_bd_net [get_bd_pins const_4b0/dout]       [get_bd_pins axizero_0/s0_axi_arqos]
connect_bd_net [get_bd_pins const_4b0/dout]       [get_bd_pins axizero_0/s0_axi_arregion]

# ── R channel ────────────────────────────────────────────────────────────────
connect_bd_net [get_bd_pins axizero_0/s0_axi_rvalid]        [get_bd_pins microblaze_0/M_AXI_DP_RVALID]
connect_bd_net [get_bd_pins microblaze_0/M_AXI_DP_RREADY]         [get_bd_pins axizero_0/s0_axi_rready]
connect_bd_net [get_bd_pins axizero_0/s0_axi_rdata] [get_bd_pins microblaze_0/M_AXI_DP_RDATA]
connect_bd_net [get_bd_pins axizero_0/s0_axi_rresp] [get_bd_pins microblaze_0/M_AXI_DP_RRESP]
# RID, RLAST not connected — MB doesn't have those pins

## ── axiZero S0 → AXI BRAM Controller 0 ─────────────────────────────────────
# Bring the IP-generated BRAM controller into the BD
create_bd_cell -type ip -vlnv xilinx.com:ip:axi_bram_ctrl:4.1 axi_bram_ctrl_0
set_property -dict {
    CONFIG.DATA_WIDTH      {32}
    CONFIG.SINGLE_PORT_BRAM {0}
    CONFIG.MEM_DEPTH       {65536}
} [get_bd_cells axi_bram_ctrl_0]
create_bd_cell -type ip -vlnv xilinx.com:ip:blk_mem_gen:8.4 bram0
set_property -dict {
    CONFIG.Memory_Type         {True_Dual_Port_RAM}
    CONFIG.Use_Byte_Write_Enable {true}
    CONFIG.Byte_Size           {8}
    CONFIG.Write_Width_A       {32}
    CONFIG.Read_Width_A        {32}
    CONFIG.Write_Depth_A       {16384}
    CONFIG.Write_Width_B       {32}
    CONFIG.Read_Width_B        {32}
    CONFIG.Enable_B            {Use_ENB_Pin}
    CONFIG.use_bram_block      {BRAM_Controller}
} [get_bd_cells bram0]

connect_bd_net [get_bd_ports sys_clk]                            [get_bd_pins axi_bram_ctrl_0/s_axi_aclk]
connect_bd_net [get_bd_pins proc_sys_reset_0/peripheral_aresetn] [get_bd_pins axi_bram_ctrl_0/s_axi_aresetn]
connect_bd_intf_net [get_bd_intf_pins axi_bram_ctrl_0/BRAM_PORTA] [get_bd_intf_pins bram0/BRAM_PORTA]
connect_bd_intf_net [get_bd_intf_pins axi_bram_ctrl_0/BRAM_PORTB] [get_bd_intf_pins bram0/BRAM_PORTB]

# AW
connect_bd_net [get_bd_pins axizero_0/m0_axi_awvalid]           [get_bd_pins axi_bram_ctrl_0/s_axi_awvalid]
connect_bd_net [get_bd_pins axi_bram_ctrl_0/s_axi_awready]            [get_bd_pins axizero_0/m0_axi_awready]
connect_bd_net [get_bd_pins axizero_0/m0_axi_awaddr]    [get_bd_pins axi_bram_ctrl_0/s_axi_awaddr]
safe_net axizero_0/m0_axi_awid axi_bram_ctrl_0/s_axi_awid
connect_bd_net [get_bd_pins axizero_0/m0_axi_awlen]     [get_bd_pins axi_bram_ctrl_0/s_axi_awlen]
connect_bd_net [get_bd_pins axizero_0/m0_axi_awsize]    [get_bd_pins axi_bram_ctrl_0/s_axi_awsize]
connect_bd_net [get_bd_pins axizero_0/m0_axi_awburst]   [get_bd_pins axi_bram_ctrl_0/s_axi_awburst]
connect_bd_net [get_bd_pins axizero_0/m0_axi_awlock]    [get_bd_pins axi_bram_ctrl_0/s_axi_awlock]
connect_bd_net [get_bd_pins axizero_0/m0_axi_awcache]   [get_bd_pins axi_bram_ctrl_0/s_axi_awcache]
connect_bd_net [get_bd_pins axizero_0/m0_axi_awprot]    [get_bd_pins axi_bram_ctrl_0/s_axi_awprot]
# W
connect_bd_net [get_bd_pins axizero_0/m0_axi_wvalid]            [get_bd_pins axi_bram_ctrl_0/s_axi_wvalid]
connect_bd_net [get_bd_pins axi_bram_ctrl_0/s_axi_wready]             [get_bd_pins axizero_0/m0_axi_wready]
connect_bd_net [get_bd_pins axizero_0/m0_axi_wdata]     [get_bd_pins axi_bram_ctrl_0/s_axi_wdata]
connect_bd_net [get_bd_pins axizero_0/m0_axi_wstrb]     [get_bd_pins axi_bram_ctrl_0/s_axi_wstrb]
connect_bd_net [get_bd_pins axizero_0/m0_axi_wlast]     [get_bd_pins axi_bram_ctrl_0/s_axi_wlast]
# B
connect_bd_net [get_bd_pins axi_bram_ctrl_0/s_axi_bvalid]             [get_bd_pins axizero_0/m0_axi_bvalid]
connect_bd_net [get_bd_pins axizero_0/m0_axi_bready]            [get_bd_pins axi_bram_ctrl_0/s_axi_bready]
safe_net axi_bram_ctrl_0/s_axi_bid axizero_0/m0_axi_bid
connect_bd_net [get_bd_pins axi_bram_ctrl_0/s_axi_bresp]              [get_bd_pins axizero_0/m0_axi_bresp]
# AR
connect_bd_net [get_bd_pins axizero_0/m0_axi_arvalid]           [get_bd_pins axi_bram_ctrl_0/s_axi_arvalid]
connect_bd_net [get_bd_pins axi_bram_ctrl_0/s_axi_arready]            [get_bd_pins axizero_0/m0_axi_arready]
connect_bd_net [get_bd_pins axizero_0/m0_axi_araddr]    [get_bd_pins axi_bram_ctrl_0/s_axi_araddr]
safe_net axizero_0/m0_axi_arid axi_bram_ctrl_0/s_axi_arid
connect_bd_net [get_bd_pins axizero_0/m0_axi_arlen]     [get_bd_pins axi_bram_ctrl_0/s_axi_arlen]
connect_bd_net [get_bd_pins axizero_0/m0_axi_arsize]    [get_bd_pins axi_bram_ctrl_0/s_axi_arsize]
connect_bd_net [get_bd_pins axizero_0/m0_axi_arburst]   [get_bd_pins axi_bram_ctrl_0/s_axi_arburst]
connect_bd_net [get_bd_pins axizero_0/m0_axi_arlock]    [get_bd_pins axi_bram_ctrl_0/s_axi_arlock]
connect_bd_net [get_bd_pins axizero_0/m0_axi_arcache]   [get_bd_pins axi_bram_ctrl_0/s_axi_arcache]
connect_bd_net [get_bd_pins axizero_0/m0_axi_arprot]    [get_bd_pins axi_bram_ctrl_0/s_axi_arprot]
# R
connect_bd_net [get_bd_pins axi_bram_ctrl_0/s_axi_rvalid]             [get_bd_pins axizero_0/m0_axi_rvalid]
connect_bd_net [get_bd_pins axizero_0/m0_axi_rready]            [get_bd_pins axi_bram_ctrl_0/s_axi_rready]
connect_bd_net [get_bd_pins axi_bram_ctrl_0/s_axi_rdata]              [get_bd_pins axizero_0/m0_axi_rdata]
safe_net axi_bram_ctrl_0/s_axi_rid axizero_0/m0_axi_rid
connect_bd_net [get_bd_pins axi_bram_ctrl_0/s_axi_rresp]              [get_bd_pins axizero_0/m0_axi_rresp]
connect_bd_net [get_bd_pins axi_bram_ctrl_0/s_axi_rlast]              [get_bd_pins axizero_0/m0_axi_rlast]

## ── axiZero S1 → AXI BRAM Controller 1 ─────────────────────────────────────
create_bd_cell -type ip -vlnv xilinx.com:ip:axi_bram_ctrl:4.1 axi_bram_ctrl_1
set_property -dict {
    CONFIG.DATA_WIDTH      {32}
    CONFIG.SINGLE_PORT_BRAM {0}
    CONFIG.MEM_DEPTH       {65536}
} [get_bd_cells axi_bram_ctrl_1]
create_bd_cell -type ip -vlnv xilinx.com:ip:blk_mem_gen:8.4 bram1
set_property -dict {
    CONFIG.Memory_Type         {True_Dual_Port_RAM}
    CONFIG.Use_Byte_Write_Enable {true}
    CONFIG.Byte_Size           {8}
    CONFIG.Write_Width_A       {32}
    CONFIG.Read_Width_A        {32}
    CONFIG.Write_Depth_A       {16384}
    CONFIG.Write_Width_B       {32}
    CONFIG.Read_Width_B        {32}
    CONFIG.Enable_B            {Use_ENB_Pin}
    CONFIG.use_bram_block      {BRAM_Controller}
} [get_bd_cells bram1]

connect_bd_net [get_bd_ports sys_clk]                            [get_bd_pins axi_bram_ctrl_1/s_axi_aclk]
connect_bd_net [get_bd_pins proc_sys_reset_0/peripheral_aresetn] [get_bd_pins axi_bram_ctrl_1/s_axi_aresetn]
connect_bd_intf_net [get_bd_intf_pins axi_bram_ctrl_1/BRAM_PORTA] [get_bd_intf_pins bram1/BRAM_PORTA]
connect_bd_intf_net [get_bd_intf_pins axi_bram_ctrl_1/BRAM_PORTB] [get_bd_intf_pins bram1/BRAM_PORTB]

connect_bd_net [get_bd_pins axizero_0/m1_axi_awvalid]           [get_bd_pins axi_bram_ctrl_1/s_axi_awvalid]
connect_bd_net [get_bd_pins axi_bram_ctrl_1/s_axi_awready]            [get_bd_pins axizero_0/m1_axi_awready]
connect_bd_net [get_bd_pins axizero_0/m1_axi_awaddr]    [get_bd_pins axi_bram_ctrl_1/s_axi_awaddr]
safe_net axizero_0/m1_axi_awid axi_bram_ctrl_1/s_axi_awid
connect_bd_net [get_bd_pins axizero_0/m1_axi_awlen]     [get_bd_pins axi_bram_ctrl_1/s_axi_awlen]
connect_bd_net [get_bd_pins axizero_0/m1_axi_awsize]    [get_bd_pins axi_bram_ctrl_1/s_axi_awsize]
connect_bd_net [get_bd_pins axizero_0/m1_axi_awburst]   [get_bd_pins axi_bram_ctrl_1/s_axi_awburst]
connect_bd_net [get_bd_pins axizero_0/m1_axi_awlock]    [get_bd_pins axi_bram_ctrl_1/s_axi_awlock]
connect_bd_net [get_bd_pins axizero_0/m1_axi_awcache]   [get_bd_pins axi_bram_ctrl_1/s_axi_awcache]
connect_bd_net [get_bd_pins axizero_0/m1_axi_awprot]    [get_bd_pins axi_bram_ctrl_1/s_axi_awprot]
connect_bd_net [get_bd_pins axizero_0/m1_axi_wvalid]            [get_bd_pins axi_bram_ctrl_1/s_axi_wvalid]
connect_bd_net [get_bd_pins axi_bram_ctrl_1/s_axi_wready]             [get_bd_pins axizero_0/m1_axi_wready]
connect_bd_net [get_bd_pins axizero_0/m1_axi_wdata]     [get_bd_pins axi_bram_ctrl_1/s_axi_wdata]
connect_bd_net [get_bd_pins axizero_0/m1_axi_wstrb]     [get_bd_pins axi_bram_ctrl_1/s_axi_wstrb]
connect_bd_net [get_bd_pins axizero_0/m1_axi_wlast]     [get_bd_pins axi_bram_ctrl_1/s_axi_wlast]
connect_bd_net [get_bd_pins axi_bram_ctrl_1/s_axi_bvalid]             [get_bd_pins axizero_0/m1_axi_bvalid]
connect_bd_net [get_bd_pins axizero_0/m1_axi_bready]            [get_bd_pins axi_bram_ctrl_1/s_axi_bready]
safe_net axi_bram_ctrl_1/s_axi_bid axizero_0/m1_axi_bid
connect_bd_net [get_bd_pins axi_bram_ctrl_1/s_axi_bresp]              [get_bd_pins axizero_0/m1_axi_bresp]
connect_bd_net [get_bd_pins axizero_0/m1_axi_arvalid]           [get_bd_pins axi_bram_ctrl_1/s_axi_arvalid]
connect_bd_net [get_bd_pins axi_bram_ctrl_1/s_axi_arready]            [get_bd_pins axizero_0/m1_axi_arready]
connect_bd_net [get_bd_pins axizero_0/m1_axi_araddr]    [get_bd_pins axi_bram_ctrl_1/s_axi_araddr]
safe_net axizero_0/m1_axi_arid axi_bram_ctrl_1/s_axi_arid
connect_bd_net [get_bd_pins axizero_0/m1_axi_arlen]     [get_bd_pins axi_bram_ctrl_1/s_axi_arlen]
connect_bd_net [get_bd_pins axizero_0/m1_axi_arsize]    [get_bd_pins axi_bram_ctrl_1/s_axi_arsize]
connect_bd_net [get_bd_pins axizero_0/m1_axi_arburst]   [get_bd_pins axi_bram_ctrl_1/s_axi_arburst]
connect_bd_net [get_bd_pins axizero_0/m1_axi_arlock]    [get_bd_pins axi_bram_ctrl_1/s_axi_arlock]
connect_bd_net [get_bd_pins axizero_0/m1_axi_arcache]   [get_bd_pins axi_bram_ctrl_1/s_axi_arcache]
connect_bd_net [get_bd_pins axizero_0/m1_axi_arprot]    [get_bd_pins axi_bram_ctrl_1/s_axi_arprot]
connect_bd_net [get_bd_pins axi_bram_ctrl_1/s_axi_rvalid]             [get_bd_pins axizero_0/m1_axi_rvalid]
connect_bd_net [get_bd_pins axizero_0/m1_axi_rready]            [get_bd_pins axi_bram_ctrl_1/s_axi_rready]
connect_bd_net [get_bd_pins axi_bram_ctrl_1/s_axi_rdata]              [get_bd_pins axizero_0/m1_axi_rdata]
safe_net axi_bram_ctrl_1/s_axi_rid axizero_0/m1_axi_rid
connect_bd_net [get_bd_pins axi_bram_ctrl_1/s_axi_rresp]              [get_bd_pins axizero_0/m1_axi_rresp]
connect_bd_net [get_bd_pins axi_bram_ctrl_1/s_axi_rlast]              [get_bd_pins axizero_0/m1_axi_rlast]

## ── axiZero S2 → AXI GPIO (AXI-Lite) ────────────────────────────────────────
create_bd_cell -type ip -vlnv xilinx.com:ip:axi_gpio:2.0 axi_gpio_0
set_property -dict {
    CONFIG.C_GPIO_WIDTH  {4}
    CONFIG.C_ALL_OUTPUTS {1}
} [get_bd_cells axi_gpio_0]

connect_bd_net [get_bd_ports sys_clk]                            [get_bd_pins axi_gpio_0/s_axi_aclk]
connect_bd_net [get_bd_pins proc_sys_reset_0/peripheral_aresetn] [get_bd_pins axi_gpio_0/s_axi_aresetn]
connect_bd_net [get_bd_pins axi_gpio_0/gpio_io_o]               [get_bd_ports leds]

# AW (Lite — no id/len/size/burst/lock/cache/qos)
connect_bd_net [get_bd_pins axizero_0/m2_axi_awvalid]        [get_bd_pins axi_gpio_0/s_axi_awvalid]
connect_bd_net [get_bd_pins axi_gpio_0/s_axi_awready]              [get_bd_pins axizero_0/m2_axi_awready]
connect_bd_net [get_bd_pins axizero_0/m2_axi_awaddr] [get_bd_pins axi_gpio_0/s_axi_awaddr]
safe_net axizero_0/m2_axi_awprot axi_gpio_0/s_axi_awprot
# W
connect_bd_net [get_bd_pins axizero_0/m2_axi_wvalid]         [get_bd_pins axi_gpio_0/s_axi_wvalid]
connect_bd_net [get_bd_pins axi_gpio_0/s_axi_wready]               [get_bd_pins axizero_0/m2_axi_wready]
connect_bd_net [get_bd_pins axizero_0/m2_axi_wdata]  [get_bd_pins axi_gpio_0/s_axi_wdata]
connect_bd_net [get_bd_pins axizero_0/m2_axi_wstrb]  [get_bd_pins axi_gpio_0/s_axi_wstrb]
# B
connect_bd_net [get_bd_pins axi_gpio_0/s_axi_bvalid]               [get_bd_pins axizero_0/m2_axi_bvalid]
connect_bd_net [get_bd_pins axizero_0/m2_axi_bready]         [get_bd_pins axi_gpio_0/s_axi_bready]
connect_bd_net [get_bd_pins axi_gpio_0/s_axi_bresp]                [get_bd_pins axizero_0/m2_axi_bresp]
# AR
connect_bd_net [get_bd_pins axizero_0/m2_axi_arvalid]        [get_bd_pins axi_gpio_0/s_axi_arvalid]
connect_bd_net [get_bd_pins axi_gpio_0/s_axi_arready]              [get_bd_pins axizero_0/m2_axi_arready]
connect_bd_net [get_bd_pins axizero_0/m2_axi_araddr] [get_bd_pins axi_gpio_0/s_axi_araddr]
safe_net axizero_0/m2_axi_arprot axi_gpio_0/s_axi_arprot
# R
connect_bd_net [get_bd_pins axi_gpio_0/s_axi_rvalid]               [get_bd_pins axizero_0/m2_axi_rvalid]
connect_bd_net [get_bd_pins axizero_0/m2_axi_rready]         [get_bd_pins axi_gpio_0/s_axi_rready]
connect_bd_net [get_bd_pins axi_gpio_0/s_axi_rdata]                [get_bd_pins axizero_0/m2_axi_rdata]
connect_bd_net [get_bd_pins axi_gpio_0/s_axi_rresp]                [get_bd_pins axizero_0/m2_axi_rresp]

## ── axiZero S3 → AXI UART Lite (AXI-Lite) ───────────────────────────────────
create_bd_cell -type ip -vlnv xilinx.com:ip:axi_uartlite:2.0 axi_uartlite_0
set_property -dict {
    CONFIG.C_BAUDRATE  {115200}
    CONFIG.C_DATA_BITS {8}
} [get_bd_cells axi_uartlite_0]

connect_bd_net [get_bd_ports sys_clk]                            [get_bd_pins axi_uartlite_0/s_axi_aclk]
connect_bd_net [get_bd_pins proc_sys_reset_0/peripheral_aresetn] [get_bd_pins axi_uartlite_0/s_axi_aresetn]
connect_bd_net [get_bd_pins axi_uartlite_0/tx]                   [get_bd_ports uart_rxd_out]
connect_bd_net [get_bd_ports uart_txd_in]                        [get_bd_pins axi_uartlite_0/rx]

connect_bd_net [get_bd_pins axizero_0/m3_axi_awvalid]        [get_bd_pins axi_uartlite_0/s_axi_awvalid]
connect_bd_net [get_bd_pins axi_uartlite_0/s_axi_awready]          [get_bd_pins axizero_0/m3_axi_awready]
connect_bd_net [get_bd_pins axizero_0/m3_axi_awaddr] [get_bd_pins axi_uartlite_0/s_axi_awaddr]
connect_bd_net [get_bd_pins axizero_0/m3_axi_wvalid]         [get_bd_pins axi_uartlite_0/s_axi_wvalid]
connect_bd_net [get_bd_pins axi_uartlite_0/s_axi_wready]           [get_bd_pins axizero_0/m3_axi_wready]
connect_bd_net [get_bd_pins axizero_0/m3_axi_wdata]  [get_bd_pins axi_uartlite_0/s_axi_wdata]
connect_bd_net [get_bd_pins axizero_0/m3_axi_wstrb]  [get_bd_pins axi_uartlite_0/s_axi_wstrb]
connect_bd_net [get_bd_pins axi_uartlite_0/s_axi_bvalid]           [get_bd_pins axizero_0/m3_axi_bvalid]
connect_bd_net [get_bd_pins axizero_0/m3_axi_bready]         [get_bd_pins axi_uartlite_0/s_axi_bready]
connect_bd_net [get_bd_pins axi_uartlite_0/s_axi_bresp]            [get_bd_pins axizero_0/m3_axi_bresp]
connect_bd_net [get_bd_pins axizero_0/m3_axi_arvalid]        [get_bd_pins axi_uartlite_0/s_axi_arvalid]
connect_bd_net [get_bd_pins axi_uartlite_0/s_axi_arready]          [get_bd_pins axizero_0/m3_axi_arready]
connect_bd_net [get_bd_pins axizero_0/m3_axi_araddr] [get_bd_pins axi_uartlite_0/s_axi_araddr]
connect_bd_net [get_bd_pins axi_uartlite_0/s_axi_rvalid]           [get_bd_pins axizero_0/m3_axi_rvalid]
connect_bd_net [get_bd_pins axizero_0/m3_axi_rready]         [get_bd_pins axi_uartlite_0/s_axi_rready]
connect_bd_net [get_bd_pins axi_uartlite_0/s_axi_rdata]            [get_bd_pins axizero_0/m3_axi_rdata]
connect_bd_net [get_bd_pins axi_uartlite_0/s_axi_rresp]            [get_bd_pins axizero_0/m3_axi_rresp]

## ─── 5. Address editor ───────────────────────────────────────────────────────
# These must match the AxiZeroConfig address map in ArtyDutGen.scala
assign_bd_address [get_bd_addr_segs {axi_bram_ctrl_0/S_AXI/Mem0}] -range 64K -offset 0xC0000000
assign_bd_address [get_bd_addr_segs {axi_bram_ctrl_1/S_AXI/Mem0}] -range 64K -offset 0xC0010000
assign_bd_address [get_bd_addr_segs {axi_gpio_0/S_AXI/Reg}]        -range  4K -offset 0xC0020000
assign_bd_address [get_bd_addr_segs {axi_uartlite_0/S_AXI/Reg}]    -range  4K -offset 0xC0030000
# LMB BRAM: instruction and data controllers mapped at 0x0
assign_bd_address [get_bd_addr_segs {ilmb_bram_if_cntlr_0/SLMB/Mem}] -range 32K -offset 0x00000000
assign_bd_address [get_bd_addr_segs {dlmb_bram_if_cntlr_0/SLMB/Mem}] -range 32K -offset 0x00000000

## WORKAROUND: Vivado 2025.2 BD automation leaves C_MASK=0 for LMB controllers when
## axiZero is an RTL module reference (no AXI slave interfaces visible to BD).
## C_MASK=0 makes pselect_mask respond to ALL addresses (Nr=0 → CS=Valid always),
## so MB data writes to 0xC0020000 (GPIO) land in D-LMB BRAM instead of M_AXI_DP.
## Fix: explicitly set C_MASK = 0x00000000FFFF8000 for 32K at 0x0 (bits [31:15] = 1).
set_property CONFIG.C_MASK {0x00000000FFFF8000} [get_bd_cells dlmb_bram_if_cntlr_0]
set_property CONFIG.C_MASK {0x00000000FFFF8000} [get_bd_cells ilmb_bram_if_cntlr_0]

## ─── 6. Validate and generate HDL wrapper ───────────────────────────────────
validate_bd_design
save_bd_design
make_wrapper -files [get_files system.bd] -top
add_files -norecurse "$proj_dir/axizero_arty.srcs/sources_1/bd/system/hdl/system_wrapper.v"
set_property top system_wrapper [current_fileset]

## ─── 7. Constraints ──────────────────────────────────────────────────────────
add_files -fileset constrs_1 -norecurse "$script_dir/constraints/arty_a7_100t.xdc"

## ─── 8. Synthesis and implementation ────────────────────────────────────────
# Accept -jobs from tclargs (default: 4)
if {[info exists argc] && $argc > 0} {
    set jobs [lindex $argv 0]
} else {
    set jobs 4
}

launch_runs synth_1 -jobs $jobs
wait_on_run synth_1
launch_runs impl_1 -to_step write_bitstream -jobs $jobs
wait_on_run impl_1

puts "\n\[axiZero\] Project created at: $proj_dir"
puts "\[axiZero\] Bitstream generated with $jobs parallel jobs."
puts "\[axiZero\] Software project: sw/arty_a7/  (build with Vitis / xsct)\n"
