# Copyright (c) 2026 Leonardo Capossio - bard0 design  hello@bard0.com
# SPDX-License-Identifier: MIT
## Arty A7-100T constraints for the VexZero example SoC (top: VexZeroArty)
## ─────────────────────────────────────────────────────────────────────────────
## Timing budget: 100 MHz system clock (10 ns period), single clock domain.

## System clock (100 MHz crystal oscillator — pin E3)
create_clock -period 10.000 -name sys_clk_pin -waveform {0.000 5.000} \
    [get_ports sys_clk]
set_property -dict {PACKAGE_PIN E3 IOSTANDARD LVCMOS33} [get_ports sys_clk]

## Reset push button CK_RST (active low, debounced in the design by a counter)
set_property -dict {PACKAGE_PIN C2 IOSTANDARD LVCMOS33} [get_ports ck_rst]

## Slide switches SW0-SW3 — the firmware adds them to its checksum
set_property -dict {PACKAGE_PIN A8  IOSTANDARD LVCMOS33} [get_ports {sw[0]}]
set_property -dict {PACKAGE_PIN C11 IOSTANDARD LVCMOS33} [get_ports {sw[1]}]
set_property -dict {PACKAGE_PIN C10 IOSTANDARD LVCMOS33} [get_ports {sw[2]}]
set_property -dict {PACKAGE_PIN A10 IOSTANDARD LVCMOS33} [get_ports {sw[3]}]

## LEDs LD4-LD7 (active high): done, pass, fail, heartbeat
set_property -dict {PACKAGE_PIN H5  IOSTANDARD LVCMOS33} [get_ports {led[0]}]
set_property -dict {PACKAGE_PIN J5  IOSTANDARD LVCMOS33} [get_ports {led[1]}]
set_property -dict {PACKAGE_PIN T9  IOSTANDARD LVCMOS33} [get_ports {led[2]}]
set_property -dict {PACKAGE_PIN T10 IOSTANDARD LVCMOS33} [get_ports {led[3]}]

## USB-UART (FT2232H channel B): FPGA TX -> PC RX. The PC-to-FPGA direction is
## unused, so uart_txd_in is left unconstrained and unconnected.
set_property -dict {PACKAGE_PIN D10 IOSTANDARD LVCMOS33} [get_ports uart_rxd_out]

## Asynchronous I/O. The buttons and switches are synchronised inside the
## design (BufferCC); the LEDs and the serial line have no external timing
## requirement, so none of these paths need to be timed.
set_false_path -from [get_ports ck_rst]
set_false_path -from [get_ports {sw[*]}]
set_false_path -to [get_ports {led[*]}]
set_false_path -to [get_ports uart_rxd_out]

## Configuration bank voltage (silences the CFGBVS/CONFIG_VOLTAGE DRC)
set_property CFGBVS VCCO [current_design]
set_property CONFIG_VOLTAGE 3.3 [current_design]
