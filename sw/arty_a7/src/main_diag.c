// Copyright (c) 2026 Leonardo Capossio — bard0 design  hello@bard0.com
// SPDX-License-Identifier: MIT
/*
 * main_diag.c  —  Diagnostic firmware for axiZero BRAM write failures
 *
 * Tests T4/T5/T6/T9 failures with three variants:
 *   _single : single write+read to the target address (no loop)
 *   _interleaved : loop with immediate write+read per word
 *   _bulk    : original bulk-write then bulk-read
 *
 * If _single passes but _interleaved fails  → first write to the address is broken
 * If _interleaved passes but _bulk fails    → something accumulates across writes
 * If all pass                               → no bug (shouldn't happen)
 */

#include "platform.h"

static int g_pass = 0;
static int g_fail = 0;

static void pass(const char *name)
{
    mdm_puts("[PASS] "); mdm_puts(name); mdm_puts("\n");
    uart_puts("[PASS] "); uart_puts(name); uart_puts("\n");
    g_pass++;
}

static void fail(const char *name, uint32_t got, uint32_t exp)
{
    mdm_puts("[FAIL] "); mdm_puts(name); mdm_puts("\n");
    uart_puts("[FAIL] "); uart_puts(name);
    uart_puts("  got="); uart_hex32(got);
    uart_puts("  exp="); uart_hex32(exp);
    uart_puts("\n");
    g_fail++;
}

static void delay(volatile uint32_t n) { while (n--) __asm__("nop"); }

/* ── Baseline: T1/T2/T3 exactly as in main.c ────────────────────────────── */

static void test_t1(void) {
    const uint32_t ADDR = BRAM0_BASEADDR + 0x0100;
    const uint32_t DATA = 0xDEADBEEF;
    wr32(ADDR, DATA);
    uint32_t got = rd32(ADDR);
    if (got == DATA) pass("T1 single BRAM0+0x100");
    else             fail("T1 single BRAM0+0x100", got, DATA);
}

static void test_t2(void) {
    const uint32_t ADDR = BRAM1_BASEADDR + 0x0200;
    const uint32_t DATA = 0xCAFEBABE;
    wr32(ADDR, DATA);
    uint32_t got = rd32(ADDR);
    if (got == DATA) pass("T2 single BRAM1+0x200");
    else             fail("T2 single BRAM1+0x200", got, DATA);
}

static void test_t3(void) {
    const uint32_t OFF = 0x0010;
    wr32(BRAM0_BASEADDR + OFF, 0x11111111);
    wr32(BRAM1_BASEADDR + OFF, 0x22222222);
    uint32_t g0 = rd32(BRAM0_BASEADDR + OFF);
    uint32_t g1 = rd32(BRAM1_BASEADDR + OFF);
    int ok = 1;
    if (g0 != 0x11111111) { fail("T3 BRAM0", g0, 0x11111111); ok=0; }
    if (g1 != 0x22222222) { fail("T3 BRAM1", g1, 0x22222222); ok=0; }
    if (ok) pass("T3 isolation");
}

/* ── T4 variants ─────────────────────────────────────────────────────────── */

/* Variant A: single write+read to BRAM0+0x1000 (like T1 but at T4's address) */
static void test_t4_single(void) {
    const uint32_t ADDR = BRAM0_BASEADDR + 0x1000;
    const uint32_t DATA = 0xA0000000;
    wr32(ADDR, DATA);
    uint32_t got = rd32(ADDR);
    if (got == DATA) pass("T4_single BRAM0+0x1000");
    else             fail("T4_single BRAM0+0x1000", got, DATA);
}

/* Variant B: 64 writes with immediate read-back per word */
static void test_t4_interleaved(void) {
    const uint32_t BASE   = BRAM0_BASEADDR + 0x1000;
    const uint32_t NWORDS = 64;
    int ok = 1;
    for (uint32_t i = 0; i < NWORDS; i++) {
        uint32_t exp = 0xA0000000 | i;
        wr32(BASE + i * 4, exp);
        uint32_t got = rd32(BASE + i * 4);
        if (got != exp) {
            fail("T4_interleaved BRAM0+0x1000", got, exp);
            ok = 0;
            break;
        }
    }
    if (ok) pass("T4_interleaved 64-word BRAM0");
}

/* Variant C: original bulk-write then bulk-read */
static void test_t4_bulk(void) {
    const uint32_t BASE   = BRAM0_BASEADDR + 0x2000;  /* different offset to avoid pollution */
    const uint32_t NWORDS = 64;
    int ok = 1;
    for (uint32_t i = 0; i < NWORDS; i++)
        wr32(BASE + i * 4, 0xB0000000 | i);
    for (uint32_t i = 0; i < NWORDS; i++) {
        uint32_t exp = 0xB0000000 | i;
        uint32_t got = rd32(BASE + i * 4);
        if (got != exp) {
            fail("T4_bulk BRAM0+0x2000", got, exp);
            ok = 0;
            break;
        }
    }
    if (ok) pass("T4_bulk 64-word BRAM0+0x2000");
}

/* Variant D: bulk write with delay between writes */
static void test_t4_delay(void) {
    const uint32_t BASE   = BRAM0_BASEADDR + 0x3000;
    const uint32_t NWORDS = 64;
    int ok = 1;
    for (uint32_t i = 0; i < NWORDS; i++) {
        wr32(BASE + i * 4, 0xC0000000 | i);
        delay(100);   /* ~100 NOPs between writes */
    }
    for (uint32_t i = 0; i < NWORDS; i++) {
        uint32_t exp = 0xC0000000 | i;
        uint32_t got = rd32(BASE + i * 4);
        if (got != exp) {
            fail("T4_delay BRAM0+0x3000", got, exp);
            ok = 0;
            break;
        }
    }
    if (ok) pass("T4_delay 64-word BRAM0+0x3000 (with delays)");
}

/* ── T9 single-write variant (just first word) ───────────────────────────── */
static void test_t9_single(void) {
    const uint32_t ADDR = BRAM0_BASEADDR + 0x0000;
    const uint32_t DATA = 0xAAAAAAAA;
    wr32(ADDR, DATA);
    uint32_t got = rd32(ADDR);
    if (got == DATA) pass("T9_single BRAM0+0x0000");
    else             fail("T9_single BRAM0+0x0000", got, DATA);
}

int main(void)
{
    /* Init UART */
    volatile uint32_t *ctrl = (volatile uint32_t *)(UART_BASEADDR + ULITE_CTRL_REG);
    *ctrl = ULITE_CTRL_RST_TX | ULITE_CTRL_RST_RX;
    *ctrl = 0;

    mdm_puts("\n[DIAG] axiZero diagnostic booted\n");
    uart_puts("\n[DIAG] axiZero diagnostic firmware\n");
    uart_puts("==========================================\n");
    delay(300000000U);

    mdm_puts("[DIAG] starting tests...\n");
    uart_puts("[DIAG] baseline T1/T2/T3:\n");

    test_t1();
    test_t2();
    test_t3();

    uart_puts("[DIAG] T4 variants:\n");
    test_t4_single();
    test_t4_interleaved();
    test_t4_bulk();
    test_t4_delay();

    uart_puts("[DIAG] T9 single:\n");
    test_t9_single();

    uart_puts("==========================================\n");

    /* Summary in MDM */
    char buf[4];
    int n;
    n = g_pass; buf[0]='0'+(n/10); buf[1]='0'+(n%10); buf[2]='\0';
    mdm_puts("PASS="); mdm_puts(buf); mdm_puts("  ");
    n = g_fail; buf[0]='0'+(n/10); buf[1]='0'+(n%10); buf[2]='\0';
    mdm_puts("FAIL="); mdm_puts(buf); mdm_puts("\n");

    uart_puts("PASS="); buf[0]='0'+(g_pass/10); buf[1]='0'+(g_pass%10); buf[2]='\0';
    uart_puts(buf); uart_puts("  FAIL=");
    buf[0]='0'+(g_fail/10); buf[1]='0'+(g_fail%10); buf[2]='\0';
    uart_puts(buf); uart_puts("\n");

    /* GPIO: all LEDs on = all pass, blink = failures */
    GPIO_TRI = 0;
    if (g_fail == 0) {
        GPIO_DATA = LED_ALL;
        while (1) { mdm_puts("[DIAG] ALL PASSED\n"); delay(150000000U); }
    } else {
        while (1) {
            mdm_puts("[DIAG] FAILURES DETECTED\n");
            GPIO_DATA = LED_LD7;
            delay(75000000U);
            GPIO_DATA = 0;
            delay(75000000U);
        }
    }
    return 0;
}
