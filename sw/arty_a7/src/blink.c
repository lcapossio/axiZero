// Copyright (c) 2026 Leonardo Capossio — bard0 design  hello@bard0.com
// SPDX-License-Identifier: MIT
/*
 * blink.c — Minimal MicroBlaze boot test: NO putd, NO UART Lite.
 *
 * Sets all 4 Arty LEDs ON, then blinks them at ~1 Hz forever.
 * If LEDs blink → MB is running AND AXI GPIO through axiZero works.
 *
 * Address map (must match create_project.tcl):
 *   GPIO DATA  0xC002_0000
 *   GPIO TRI   0xC002_0004
 */

#include <stdint.h>

#define GPIO_BASE 0xC0020000UL

static inline void wr32(uint32_t a, uint32_t v)
{
    *(volatile uint32_t *)a = v;
}

static void spin(volatile uint32_t n)
{
    while (n--) __asm__("nop");
}

int main(void)
{
    volatile uint32_t *gpio_data = (volatile uint32_t *)(GPIO_BASE + 0x0000);
    volatile uint32_t *gpio_tri  = (volatile uint32_t *)(GPIO_BASE + 0x0004);

    /* All 4 LED pins → output */
    *gpio_tri  = 0x00000000;

    /* Blink forever: 50M nops per half-period ≈ 0.5 s @ 100 MHz */
    while (1) {
        *gpio_data = 0x0000000F;   /* all LEDs on  */
        spin(50000000U);
        *gpio_data = 0x00000000;   /* all LEDs off */
        spin(50000000U);
    }

    return 0;
}
