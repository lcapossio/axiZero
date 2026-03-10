// Copyright (c) 2026 Leonardo Capossio — bard0 design  hello@bard0.com
// SPDX-License-Identifier: MIT
/*
 * blink_lmb.c — Write a known pattern to LMB BRAM top (no AXI at all).
 * If xsdb can read back 0xDEAD at 0x7F00, MB executed stores via D-LMB.
 * Then writes a counter to 0x7F04 in a loop to test if stop/read works.
 */
#include <stdint.h>

volatile uint32_t *flag    = (volatile uint32_t *)0x7F00;
volatile uint32_t *counter = (volatile uint32_t *)0x7F04;

int main(void) {
    *flag = 0xDEADBEEF;   /* sentinel — visible from xsdb mrd 0x7F00 */
    uint32_t n = 0;
    while (1) {
        *counter = n++;    /* increment so xsdb can see it changing   */
    }
    return 0;
}
