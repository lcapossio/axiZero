/* crt0.S – Minimal MicroBlaze startup for bare-metal axiZero test
 * Reset vector lives at 0x0; we branch immediately to _start.
 * LMB BRAM is 32 KB (0x0000–0x7FFF); stack grows down from top. */

    .section .vectors,"ax"
    .global _vector_table

_vector_table:
    bri  _start          /* 0x00 reset            */
    bri  _exception      /* 0x08 machine check    */
    bri  _exception      /* 0x10 reserved         */
    bri  _exception      /* 0x18 interrupt        */
    bri  _exception      /* 0x20 break            */
    bri  _exception      /* 0x28 hw exception     */

    .section .text
    .global _start
_start:
    /* Stack pointer = top of 32 KB LMB BRAM – 4 */
    addik r1, r0, 0x7FFC
    /* Clear the link register so backtraces terminate */
    addk  r15, r0, r0
    /* Jump to main (never returns) */
    bralid r15, main
    nop

_exit:
    bri  _exit

_exception:
    bri  _exception
/* Copyright (c) 2026 Leonardo Capossio - bard0 design  hello@bard0.com
 * SPDX-License-Identifier: MIT */
