# Copyright (c) 2026 Leonardo Capossio — bard0 design  hello@bard0.com
# SPDX-License-Identifier: MIT
/* arty.ld – Linker script for MicroBlaze LMB BRAM (32 KB @ 0x0)
 * Stack is placed at top of BRAM and grows downward.
 * No external RAM; everything fits in 32 KB. */

ENTRY(_start)

MEMORY {
    lmb (rwx) : ORIGIN = 0x00000000, LENGTH = 32K
}

SECTIONS {
    .vectors 0x0 : {
        KEEP(*(.vectors))
    } > lmb

    .text : {
        *(.text.startup)
        *(.text*)
        *(.rodata*)
    } > lmb

    .data : {
        *(.data*)
    } > lmb

    .bss : {
        __bss_start = .;
        *(.bss*)
        *(COMMON)
        __bss_end = .;
    } > lmb

    /* Stack lives at top; linker just needs to not place data there */
    _stack_top = ORIGIN(lmb) + LENGTH(lmb) - 4;
}
