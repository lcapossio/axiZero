// Copyright (c) 2026 Leonardo Capossio — bard0 design  hello@bard0.com
// SPDX-License-Identifier: MIT
/*
 * main.c  —  Arty A7-100T axiZero fabric test
 *
 * Runs on MicroBlaze (local BRAM at 0x0000_0000).
 * Tests axiZero 1M×4S mixed crossbar via polled register/BRAM accesses.
 *
 * Test plan
 * ─────────
 *  T1  Single-word write/read to BRAM #0 (S0, Full AXI4)
 *  T2  Single-word write/read to BRAM #1 (S1, Full AXI4)
 *  T3  Address isolation — word written to BRAM #0 not visible in BRAM #1
 *  T4  Sequential write/read — 64 words, ascending pattern, BRAM #0
 *  T5  Sequential write/read — 64 words, walking-1 pattern, BRAM #1
 *  T6  Alternating masters (stride-2 pattern) across both BRAMs
 *  T7  GPIO LED blink via AXI Lite (S2)
 *  T8  UART echo-back / TX FIFO drain via AXI Lite (S3)
 *  T9  Stress — full 64 KB of BRAM #0 (16 384 words, checkerboard)
 *  T10 Cross-slave boundary — last word of BRAM #0, first word of BRAM #1
 *
 * Output: UART at 115 200 baud.  Pass/fail printed per test; final summary.
 */

#include "platform.h"

/* ── Result tracking ────────────────────────────────────────────────────── */

static int g_pass = 0;
static int g_fail = 0;

static void pass(const char *name)
{
    mdm_puts("[PASS] ");
    mdm_puts(name);
    mdm_puts("\n");
    uart_puts("[PASS] ");
    uart_puts(name);
    uart_puts("\n");
    g_pass++;
}

static void fail(const char *name, const char *detail,
                 uint32_t got, uint32_t expected)
{
    mdm_puts("[FAIL] ");
    mdm_puts(name);
    mdm_puts("\n");
    uart_puts("[FAIL] ");
    uart_puts(name);
    uart_puts(" — ");
    uart_puts(detail);
    uart_puts("  got=");
    uart_hex32(got);
    uart_puts("  exp=");
    uart_hex32(expected);
    uart_puts("\n");
    g_fail++;
}

/* ── Small delay (not calibrated — just burns cycles) ───────────────────── */

static void delay(volatile uint32_t n)
{
    while (n--) __asm__("nop");
}

/* ══════════════════════════════════════════════════════════════════════════
 * T1  Single-word write/read — BRAM #0
 * ══════════════════════════════════════════════════════════════════════════ */

static void test_t1(void)
{
    const uint32_t ADDR = BRAM0_BASEADDR + 0x0100;
    const uint32_t DATA = 0xDEADBEEF;

    wr32(ADDR, DATA);
    uint32_t got = rd32(ADDR);
    if (got == DATA) pass("T1 single-word BRAM0");
    else             fail("T1 single-word BRAM0", "readback", got, DATA);
}

/* ══════════════════════════════════════════════════════════════════════════
 * T2  Single-word write/read — BRAM #1
 * ══════════════════════════════════════════════════════════════════════════ */

static void test_t2(void)
{
    const uint32_t ADDR = BRAM1_BASEADDR + 0x0200;
    const uint32_t DATA = 0xCAFEBABE;

    wr32(ADDR, DATA);
    uint32_t got = rd32(ADDR);
    if (got == DATA) pass("T2 single-word BRAM1");
    else             fail("T2 single-word BRAM1", "readback", got, DATA);
}

/* ══════════════════════════════════════════════════════════════════════════
 * T3  Address isolation — BRAM #0 write must NOT be visible in BRAM #1
 * ══════════════════════════════════════════════════════════════════════════ */

static void test_t3(void)
{
    const uint32_t OFFSET = 0x0010;
    const uint32_t DATA0  = 0x11111111;
    const uint32_t DATA1  = 0x22222222;

    /* Write distinguishable sentinels */
    wr32(BRAM0_BASEADDR + OFFSET, DATA0);
    wr32(BRAM1_BASEADDR + OFFSET, DATA1);

    uint32_t g0 = rd32(BRAM0_BASEADDR + OFFSET);
    uint32_t g1 = rd32(BRAM1_BASEADDR + OFFSET);

    int ok = 1;
    if (g0 != DATA0) { fail("T3 isolation", "BRAM0 wrong",  g0, DATA0); ok = 0; }
    if (g1 != DATA1) { fail("T3 isolation", "BRAM1 wrong",  g1, DATA1); ok = 0; }
    if (g0 == g1)    { fail("T3 isolation", "BRAMs aliased",g0, DATA1); ok = 0; }
    if (ok)          pass("T3 address isolation");
}

/* ══════════════════════════════════════════════════════════════════════════
 * T4  Sequential 64-word ascending pattern — BRAM #0
 * ══════════════════════════════════════════════════════════════════════════ */

static void test_t4(void)
{
    const uint32_t BASE   = BRAM0_BASEADDR + 0x1000;
    const uint32_t NWORDS = 64;
    int ok = 1;

    for (uint32_t i = 0; i < NWORDS; i++)
        wr32(BASE + i * 4, 0xA0000000 | i);

    for (uint32_t i = 0; i < NWORDS; i++) {
        uint32_t exp = 0xA0000000 | i;
        uint32_t got = rd32(BASE + i * 4);
        if (got != exp) {
            fail("T4 seq-64 BRAM0", "word mismatch", got, exp);
            ok = 0;
            break;
        }
    }
    if (ok) pass("T4 sequential 64-word BRAM0");
}

/* ══════════════════════════════════════════════════════════════════════════
 * T5  Sequential 64-word walking-1 pattern — BRAM #1
 * ══════════════════════════════════════════════════════════════════════════ */

static void test_t5(void)
{
    const uint32_t BASE   = BRAM1_BASEADDR + 0x2000;
    const uint32_t NWORDS = 64;
    int ok = 1;

    for (uint32_t i = 0; i < NWORDS; i++) {
        uint32_t pat = 1u << (i & 31);
        wr32(BASE + i * 4, pat);
    }

    for (uint32_t i = 0; i < NWORDS; i++) {
        uint32_t exp = 1u << (i & 31);
        uint32_t got = rd32(BASE + i * 4);
        if (got != exp) {
            fail("T5 walking-1 BRAM1", "word mismatch", got, exp);
            ok = 0;
            break;
        }
    }
    if (ok) pass("T5 walking-1 64-word BRAM1");
}

/* ══════════════════════════════════════════════════════════════════════════
 * T6  Alternating stride-2 pattern across both BRAMs
 *     Odd words → BRAM #0, even words → BRAM #1; read back and verify.
 * ══════════════════════════════════════════════════════════════════════════ */

static void test_t6(void)
{
    const uint32_t BASE0  = BRAM0_BASEADDR + 0x3000;
    const uint32_t BASE1  = BRAM1_BASEADDR + 0x3000;
    const uint32_t NWORDS = 32;
    int ok = 1;

    /* Write alternating to B0 / B1 */
    for (uint32_t i = 0; i < NWORDS; i++) {
        uint32_t val = 0xB0000000 | i;
        if (i & 1) wr32(BASE0 + i * 4, val);
        else        wr32(BASE1 + i * 4, val);
    }

    for (uint32_t i = 0; i < NWORDS; i++) {
        uint32_t exp = 0xB0000000 | i;
        uint32_t got = (i & 1) ? rd32(BASE0 + i * 4) : rd32(BASE1 + i * 4);
        if (got != exp) {
            fail("T6 alternating stride", "word mismatch", got, exp);
            ok = 0;
            break;
        }
    }
    if (ok) pass("T6 alternating-stride BRAM0/BRAM1");
}

/* ══════════════════════════════════════════════════════════════════════════
 * T7  GPIO LED blink via AXI Lite (S2)
 *     Configure all LED pins as outputs, cycle through 16 patterns.
 * ══════════════════════════════════════════════════════════════════════════ */

static void test_t7(void)
{
    /* Set all LED pins to output (TRI = 0) */
    GPIO_TRI  = 0;
    GPIO_DATA = 0;

    /* Walk through all 16 4-bit patterns */
    for (uint32_t pat = 0; pat < 16; pat++) {
        GPIO_DATA = pat;
        delay(50000);
        uint32_t readback = GPIO_DATA & LED_ALL;
        if (readback != (pat & LED_ALL)) {
            fail("T7 GPIO LED", "readback", readback, pat & LED_ALL);
            GPIO_DATA = 0;
            return;
        }
    }

    /* Leave LD4+LD5 on to signal "tests running" */
    GPIO_DATA = LED_LD4 | LED_LD5;
    pass("T7 GPIO LED blink");
}

/* ══════════════════════════════════════════════════════════════════════════
 * T8  UART Lite TX FIFO test via AXI Lite (S3)
 *     Reset FIFOs, send a banner string, verify TX goes empty.
 * ══════════════════════════════════════════════════════════════════════════ */

static void test_t8(void)
{
    volatile uint32_t *ctrl = (volatile uint32_t *)(UART_BASEADDR + ULITE_CTRL_REG);
    volatile uint32_t *stat = (volatile uint32_t *)(UART_BASEADDR + ULITE_STAT_REG);

    /* Reset both FIFOs */
    *ctrl = ULITE_CTRL_RST_TX | ULITE_CTRL_RST_RX;
    *ctrl = 0;
    delay(1000);

    /* Verify stat register is readable (not all-ones / all-zeros stuck) */
    uint32_t s = *stat;
    if (s == 0xFFFFFFFF || (s & ~0xFF) != 0) {
        fail("T8 UART stat", "bad stat reg", s, 0 /* any valid 8-bit val */);
        return;
    }

    /* Send test banner — uart_puts flushes via polled wait */
    uart_puts("\n--- axiZero UART T8 ---\n");

    /* Wait until TX FIFO empty */
    uint32_t timeout = 200000;
    while (!(*stat & ULITE_STAT_TX_EMPTY) && --timeout)
        ;
    if (timeout == 0) {
        fail("T8 UART TX empty", "timeout", *stat, ULITE_STAT_TX_EMPTY);
        return;
    }

    pass("T8 UART Lite TX");
}

/* ══════════════════════════════════════════════════════════════════════════
 * T9  Stress — full 64 KB BRAM #0 (16 384 words, checkerboard)
 * ══════════════════════════════════════════════════════════════════════════ */

static void test_t9(void)
{
    const uint32_t NWORDS   = BRAM_WORDS;   /* 16 384 */
    const uint32_t EVEN_PAT = 0xAAAAAAAA;
    const uint32_t ODD_PAT  = 0x55555555;
    int ok = 1;

    uart_puts("[INFO] T9 writing 64 KB BRAM0...\n");

    for (uint32_t i = 0; i < NWORDS; i++) {
        uint32_t val = (i & 1) ? ODD_PAT : EVEN_PAT;
        wr32(BRAM0_BASEADDR + i * 4, val);
    }

    uart_puts("[INFO] T9 verifying 64 KB BRAM0...\n");

    for (uint32_t i = 0; i < NWORDS; i++) {
        uint32_t exp = (i & 1) ? ODD_PAT : EVEN_PAT;
        uint32_t got = rd32(BRAM0_BASEADDR + i * 4);
        if (got != exp) {
            fail("T9 64KB BRAM0 checkerboard", "word mismatch", got, exp);
            uart_puts("       at word index ");
            uart_hex32(i);
            uart_puts("\n");
            ok = 0;
            break;
        }
    }
    if (ok) pass("T9 full 64 KB BRAM0 checkerboard");
}

/* ══════════════════════════════════════════════════════════════════════════
 * T10  Cross-slave boundary
 *      Last word of BRAM #0 and first word of BRAM #1 are independent.
 * ══════════════════════════════════════════════════════════════════════════ */

static void test_t10(void)
{
    /* Last accessible 32-bit word in BRAM #0 */
    const uint32_t LAST0  = BRAM0_BASEADDR + BRAM_SIZE - 4;
    /* First word of BRAM #1 */
    const uint32_t FIRST1 = BRAM1_BASEADDR;

    const uint32_t VAL0 = 0xFEEDFACE;
    const uint32_t VAL1 = 0x0D15EA5E;

    wr32(LAST0,  VAL0);
    wr32(FIRST1, VAL1);

    uint32_t g0 = rd32(LAST0);
    uint32_t g1 = rd32(FIRST1);

    int ok = 1;
    if (g0 != VAL0) { fail("T10 cross-boundary", "last word BRAM0", g0, VAL0); ok = 0; }
    if (g1 != VAL1) { fail("T10 cross-boundary", "first word BRAM1", g1, VAL1); ok = 0; }
    if (ok) pass("T10 cross-slave boundary");
}

/* ══════════════════════════════════════════════════════════════════════════
 * Entry point
 * ══════════════════════════════════════════════════════════════════════════ */

int main(void)
{
    /* Init UART FIFOs before any output */
    volatile uint32_t *ctrl = (volatile uint32_t *)(UART_BASEADDR + ULITE_CTRL_REG);
    *ctrl = ULITE_CTRL_RST_TX | ULITE_CTRL_RST_RX;
    *ctrl = 0;

    /* Wait ~10 s for the host serial port to open after FPGA programming.
     * At 100 MHz, 3 cycles/iteration ≈ 30 ns → 333 M iters ≈ 10 s */
    mdm_puts("\n[axiZero] booted via MDM JTAG-UART\n");
    uart_puts("\n[axiZero] booted — waiting for host...\n");
    delay(300000000U);

    mdm_puts("[axiZero] starting tests...\n");
    uart_puts("\n");
    uart_puts("==============================================\n");
    uart_puts("  axiZero Arty A7-100T hardware test suite   \n");
    uart_puts("==============================================\n");
    uart_puts("  1M x 4S mixed AXI crossbar (Full + Lite)\n");
    uart_puts("----------------------------------------------\n");

    test_t1();
    test_t2();
    test_t3();
    test_t4();
    test_t5();
    test_t6();
    test_t7();
    test_t8();
    test_t9();
    test_t10();

    uart_puts("----------------------------------------------\n");
    uart_puts("  Results: ");

    /* Print pass count */
    char buf[4];
    int n = g_pass;
    buf[0] = '0' + (n / 10);
    buf[1] = '0' + (n % 10);
    buf[2] = '\0';
    uart_puts(buf);
    uart_puts(" passed, ");

    n = g_fail;
    buf[0] = '0' + (n / 10);
    buf[1] = '0' + (n % 10);
    buf[2] = '\0';
    uart_puts(buf);
    uart_puts(" failed\n");

    uart_puts("==============================================\n");

    if (g_fail == 0) {
        /* All four LEDs on = success; reprint pass banner every ~5 s */
        GPIO_TRI  = 0;
        GPIO_DATA = LED_ALL;
        while (1) {
            mdm_puts("  *** ALL TESTS PASSED ***\n");
            uart_puts("  *** ALL TESTS PASSED ***\n");
            delay(150000000U);
        }
    } else {
        /* Blink LD7 to signal failure; reprint fail banner every ~5 s */
        GPIO_TRI = 0;
        while (1) {
            mdm_puts("  *** FAILURES DETECTED ***\n");
            uart_puts("  *** FAILURES DETECTED ***\n");
            GPIO_DATA = LED_LD7;
            delay(75000000U);
            GPIO_DATA = 0;
            delay(75000000U);
        }
    }
    return 0;
}
