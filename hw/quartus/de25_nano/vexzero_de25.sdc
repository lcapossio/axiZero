# Copyright (c) 2026 Leonardo Capossio - bard0 design - hello@bard0.com
# SPDX-License-Identifier: MIT
#
# Timing constraints for the VexZero example on the DE25-Nano.
#
# One clock: the board's 50 MHz oscillator, which the whole SoC runs on.
# The JTAG-to-AXI bridge is the only thing with a second clock, and that one
# (TCK) is created by the virtual-JTAG primitive rather than by a port, so it
# is not constrained here. The bridge crosses between the two domains through
# its own asynchronous FIFOs, which is why the crossing needs no constraint of
# ours -- see the fpgacapZero submodule.

create_clock -name clk_50mhz -period 20.000 [get_ports {CLOCK1_50}]

derive_clock_uncertainty

# The buttons and switches are asynchronous to everything and are synchronised
# in the design (BufferCC), so there is no timing relationship to hold.
set_false_path -from [get_ports {KEY[*]}] -to *
set_false_path -from [get_ports {SW[*]}] -to *

# The LEDs are read by a person.
set_false_path -from * -to [get_ports {LEDR[*]}]
