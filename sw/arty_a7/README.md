# Arty A7-100T axiZero Software

MicroBlaze C test program for the axiZero 1M×4S hardware test.

## Test coverage

| Test | Description |
|------|-------------|
| T1   | Single-word write/read — BRAM #0 (AXI Full, S0) |
| T2   | Single-word write/read — BRAM #1 (AXI Full, S1) |
| T3   | Address isolation — write to B0 not visible in B1 |
| T4   | Sequential 64-word ascending pattern — BRAM #0 |
| T5   | Sequential 64-word walking-1 pattern — BRAM #1 |
| T6   | Alternating stride-2 pattern across both BRAMs |
| T7   | GPIO LED blink via AXI Lite (S2), 16 patterns |
| T8   | UART Lite TX FIFO reset + banner via AXI Lite (S3) |
| T9   | Full 64 KB BRAM #0 checkerboard (AA/55) |
| T10  | Cross-slave boundary: last word B0 / first word B1 |

Pass: all 4 LEDs on.  Fail: LD7 blinks.

## Address map

```
0xC000_0000  AXI BRAM #0   64 KB (S0, Full AXI4)
0xC001_0000  AXI BRAM #1   64 KB (S1, Full AXI4)
0xC002_0000  AXI GPIO       4 KB (S2, AXI Lite)
0xC003_0000  AXI UART Lite  4 KB (S3, AXI Lite)
```

## Building in Vitis (2025.2)

1. **Generate hardware**
   ```
   cd hw/vivado/arty_a7
   vivado -mode batch -source create_project.tcl
   # then in Vivado: File > Export > Export Hardware (include bitstream)
   ```

2. **Create Vitis platform + application**
   - Launch Vitis: `vitis -workspace ws_arty`
   - File > New > Platform Project → import the exported `.xsa`
   - File > New > Application Project → select platform, language C,
     template "Empty Application"
   - Copy `src/platform.h` and `src/main.c` into the application `src/`
   - Right-click application → Build

3. **Run / debug**
   - Connect Arty A7 via USB-JTAG
   - Open a terminal at 115 200 8N1 on the UART COM port
   - Run > Run As > Launch on Hardware

## Building with mb-gcc (standalone)

```bash
mb-gcc -O2 -mlittle-endian -mxl-soft-mul -nostdlib \
    -I src \
    src/crt0.S src/main.c \
    -T src/arty.ld \
    -lgcc \
    -o axizero_test.elf

mb-objcopy -O binary axizero_test.elf axizero_test.bin
```

`-lgcc` must come **after** the source files to resolve `__divsi3`/`__modsi3`.

Load with `xsdb` or Vitis debugger.
