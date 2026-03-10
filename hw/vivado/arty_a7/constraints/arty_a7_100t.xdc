## Arty A7-100T constraints for axiZero hardware test
## ─────────────────────────────────────────────────────────────────────────────
## Timing budget: 100 MHz system clock (10 ns period)

## System clock (100 MHz crystal oscillator — pin E3)
create_clock -period 10.000 -name sys_clk_pin -waveform {0.000 5.000} \
    [get_ports sys_clk]
set_property -dict {PACKAGE_PIN E3 IOSTANDARD LVCMOS33} [get_ports sys_clk]

## sys_reset port removed — ext_reset_in tied low in BD (no external reset)

## USB-UART (via FT2232H on-board)
##   uart_rxd_out  = FPGA TX → PC RX
##   uart_txd_in   = PC TX → FPGA RX
set_property -dict {PACKAGE_PIN D10 IOSTANDARD LVCMOS33} [get_ports uart_rxd_out]
set_property -dict {PACKAGE_PIN A9  IOSTANDARD LVCMOS33} [get_ports uart_txd_in]

## LEDs  (LD4-LD7 on schematic, active-high)
set_property -dict {PACKAGE_PIN H5  IOSTANDARD LVCMOS33} [get_ports {leds[0]}]
set_property -dict {PACKAGE_PIN J5  IOSTANDARD LVCMOS33} [get_ports {leds[1]}]
set_property -dict {PACKAGE_PIN T9  IOSTANDARD LVCMOS33} [get_ports {leds[2]}]
set_property -dict {PACKAGE_PIN T10 IOSTANDARD LVCMOS33} [get_ports {leds[3]}]

