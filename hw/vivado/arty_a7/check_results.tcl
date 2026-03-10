# Copyright (c) 2026 Leonardo Capossio — bard0 design  hello@bard0.com
# SPDX-License-Identifier: MIT
## check_results3.tcl — Use rst -processor to halt MB (avoids stop/overrun issue)
## LMB BRAM data (g_fail, g_pass, test sentinels) survives processor reset

set repo_root [file normalize [file join [file dirname [info script]] .. .. ..]]
set bit_file  [file join $repo_root hw vivado arty_a7 axizero_arty axizero_arty.runs impl_1 system_wrapper.bit]
set elf_main  [file join $repo_root sw arty_a7 build main_le.elf]

connect
after 500
catch {targets -set -filter {name =~ "xc7a*"}}
fpga $bit_file
after 1000
targets -set -filter {name =~ "MicroBlaze #0*"}

catch { rst -processor }
after 300
dow $elf_main
after 100

puts "=== Running main_le.elf (waiting 42s: ~18s startup + tests) ==="
catch { con }
after 42000

## Use rst -processor to halt MB (preserves BRAM/peripheral state)
puts "=== Halting MB via rst -processor ==="
catch { rst -processor }
after 1000

## g_fail / g_pass  (main_le.elf rebuilt 2026-03-09: g_fail=0x11EC, g_pass=0x11F0)
puts "\n=== g_fail (0x11EC) / g_pass (0x11F0) ==="
catch { mrd 0x11EC 2 } gv; puts "raw: $gv"
catch { mrd 0x11EC 1 } fail_raw
catch { mrd 0x11F0 1 } pass_raw
set fail_val ""; set pass_val ""
foreach w [split $fail_raw] { if {[string length $w] == 8 && [string is xdigit $w]} { set fail_val $w } }
foreach w [split $pass_raw] { if {[string length $w] == 8 && [string is xdigit $w]} { set pass_val $w } }
if {$fail_val eq ""} { set fail_val "00000000" }
if {$pass_val eq ""} { set pass_val "00000000" }
puts "g_fail = $fail_val = [expr 0x$fail_val] tests failed"
puts "g_pass = $pass_val = [expr 0x$pass_val] tests passed"

## GPIO
puts "\n=== GPIO AXI-Lite S2 ==="
catch { mrd 0xC0020000 1 } v; puts "GPIO_DATA: $v"

## UART
puts "\n=== UART AXI-Lite S3 ==="
catch { mrd 0xC0030008 1 } v; puts "UART_STAT: $v"

## BRAM0
puts "\n=== BRAM0 sentinels ==="
catch { mrd 0xC0000000 4 } v; puts "BRAM0\[0..C\]   T9 AA55AA55: $v"
catch { mrd 0xC0000100 1 } v; puts "BRAM0\[0x100\]  T1=DEADBEEF/T9=AA: $v"
catch { mrd 0xC0001000 2 } v; puts "BRAM0\[0x1000\] T4 pattern/T9=AA: $v"
catch { mrd 0xC000FFFC 1 } v; puts "BRAM0\[last\]   T10=FEEDFACE: $v"

## BRAM1
puts "\n=== BRAM1 sentinels ==="
catch { mrd 0xC0010000 2 } v; puts "BRAM1\[0x0000\] T10=0D15EA5E: $v"
catch { mrd 0xC0010200 1 } v; puts "BRAM1\[0x0200\] T2=CAFEBABE: $v"
catch { mrd 0xC0012000 8 } v; puts "BRAM1\[0x2000\] T5 walking-1 01,02,04...: $v"

puts ""
if {$fail_val eq "00000000"} {
    puts "*** ALL $pass_val TESTS PASSED ***"
} else {
    puts "*** [expr 0x$fail_val] FAILED, [expr 0x$pass_val] PASSED ***"
}

disconnect
exit 0
