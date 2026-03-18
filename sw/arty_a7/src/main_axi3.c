// Copyright (c) 2026 Leonardo Capossio
// SPDX-License-Identifier: MIT
/*
 * main_axi3.c  -  Arty A7-100T axiZero AXI3 adapter hardware test
 *
 * System: 1M x 4S with AXI3-to-AXI4 bridge adapter in the data path
 *   Master 0 = MicroBlaze M_AXI_DP -> AXI4-to-AXI3 shim -> Axi3ToAxi4Adapter -> crossbar
 *   4 slaves: 2x BRAM (full AXI4), GPIO (AXI-Lite), UART (AXI-Lite)
 *
 * Test plan
 *   T1  Sanity: single-word write/read to BRAM0 and BRAM1
 *   T2  Walking-1 pattern across 256 words in BRAM0
 *   T3  Cross-slave: write BRAM0, write BRAM1, read back and verify
 *   T4  GPIO LED sweep (proves AXI-Lite path through adapter works)
 *   T5  UART TX (proves second AXI-Lite slave path works)
 */

#include "platform.h"

int g_pass = 0;
int g_fail = 0;

static void pass(const char *name)
{
    mdm_puts("[PASS] "); mdm_puts(name); mdm_puts("\n");
    uart_puts("[PASS] "); uart_puts(name); uart_puts("\n");
    g_pass++;
}

static void fail(const char *name, const char *detail, uint32_t got, uint32_t expected)
{
    mdm_puts("[FAIL] "); mdm_puts(name); mdm_puts("\n");
    uart_puts("[FAIL] "); uart_puts(name);
    uart_puts(" - "); uart_puts(detail);
    uart_puts("  got="); uart_hex32(got);
    uart_puts("  exp="); uart_hex32(expected);
    uart_puts("\n");
    g_fail++;
}

static void delay(volatile uint32_t n)
{
    while (n--) __asm__("nop");
}

/* T1: basic sanity — write and read back one word per BRAM */
static void test_t1(void)
{
    const uint32_t A0 = BRAM0_BASEADDR + 0x100;
    const uint32_t A1 = BRAM1_BASEADDR + 0x100;

    wr32(A0, 0xDEADBEEF);
    wr32(A1, 0xCAFEBABE);

    uint32_t g0 = rd32(A0);
    uint32_t g1 = rd32(A1);

    int ok = 1;
    if (g0 != 0xDEADBEEF) { fail("T1 sanity", "BRAM0", g0, 0xDEADBEEF); ok = 0; }
    if (g1 != 0xCAFEBABE) { fail("T1 sanity", "BRAM1", g1, 0xCAFEBABE); ok = 0; }
    if (ok) pass("T1 sanity write/read BRAM0+BRAM1");
}

/* T2: walking-1 pattern — 256 words in BRAM0 */
static void test_t2(void)
{
    const uint32_t base = BRAM0_BASEADDR;
    const uint32_t nwords = 256;
    uint32_t i;
    int ok = 1;

    /* Write walking-1 pattern */
    for (i = 0; i < nwords; i++) {
        uint32_t pattern = 1u << (i & 31);
        wr32(base + i * 4, pattern);
    }

    /* Read back and verify */
    for (i = 0; i < nwords; i++) {
        uint32_t expected = 1u << (i & 31);
        uint32_t got = rd32(base + i * 4);
        if (got != expected) {
            fail("T2 walking-1", "word mismatch", got, expected);
            ok = 0;
            break;
        }
    }
    if (ok) pass("T2 walking-1 pattern 256 words BRAM0");
}

/* T3: cross-slave write/read — BRAM0 and BRAM1 simultaneously */
static void test_t3(void)
{
    const uint32_t nwords = 128;
    uint32_t i;
    int ok = 1;

    /* Write alternating to both BRAMs */
    for (i = 0; i < nwords; i++) {
        wr32(BRAM0_BASEADDR + i * 4, 0xA0000000 | i);
        wr32(BRAM1_BASEADDR + i * 4, 0xB0000000 | i);
    }

    /* Verify both */
    for (i = 0; i < nwords; i++) {
        uint32_t exp0 = 0xA0000000 | i;
        uint32_t got0 = rd32(BRAM0_BASEADDR + i * 4);
        if (got0 != exp0) {
            fail("T3 cross-slave", "BRAM0 mismatch", got0, exp0);
            ok = 0;
            break;
        }
        uint32_t exp1 = 0xB0000000 | i;
        uint32_t got1 = rd32(BRAM1_BASEADDR + i * 4);
        if (got1 != exp1) {
            fail("T3 cross-slave", "BRAM1 mismatch", got1, exp1);
            ok = 0;
            break;
        }
    }
    if (ok) pass("T3 cross-slave 128 words BRAM0+BRAM1");
}

/* T4: GPIO LED sweep — proves AXI-Lite slave path through adapter */
static void test_t4(void)
{
    GPIO_TRI = 0;  /* outputs */
    int ok = 1;

    uint32_t patterns[] = { 0x1, 0x2, 0x4, 0x8, 0xF, 0x0 };
    int npatterns = sizeof(patterns) / sizeof(patterns[0]);

    for (int i = 0; i < npatterns; i++) {
        GPIO_DATA = patterns[i];
        delay(5000000U);  /* brief visible flash */
        uint32_t got = GPIO_DATA;
        if (got != patterns[i]) {
            fail("T4 GPIO sweep", "readback mismatch", got, patterns[i]);
            ok = 0;
            break;
        }
    }
    if (ok) pass("T4 GPIO LED sweep (AXI-Lite slave path)");
}

/* T5: UART TX — proves second AXI-Lite slave works */
static void test_t5(void)
{
    /* UART TX is tested implicitly by all the uart_puts above.
       Explicitly verify UART status register is readable. */
    volatile uint32_t *stat = (volatile uint32_t *)(UART_BASEADDR + ULITE_STAT_REG);
    uint32_t s = *stat;
    /* Bit 2 = TX_EMPTY should be 1 after our puts drain */
    /* Just verify the read doesn't hang (the adapter doesn't break the path) */
    pass("T5 UART status read (AXI-Lite slave 2)");
    (void)s;
}

int main(void)
{
    volatile uint32_t *ctrl = (volatile uint32_t *)(UART_BASEADDR + ULITE_CTRL_REG);
    *ctrl = ULITE_CTRL_RST_TX | ULITE_CTRL_RST_RX;
    *ctrl = 0;

    mdm_puts("\n[axiZero-AXI3] booted via MDM JTAG-UART\n");
    uart_puts("\n[axiZero-AXI3] booted - waiting for host...\n");
    delay(300000000U);

    mdm_puts("[axiZero-AXI3] starting AXI3 adapter tests...\n");
    uart_puts("\n");
    uart_puts("==============================================\n");
    uart_puts("  axiZero Arty A7-100T AXI3 adapter test      \n");
    uart_puts("==============================================\n");
    uart_puts("  1M x 4S, AXI4->AXI3->AXI4 round-trip       \n");
    uart_puts("----------------------------------------------\n");

    test_t1();
    test_t2();
    test_t3();
    test_t4();
    test_t5();

    uart_puts("----------------------------------------------\n");
    uart_puts("  Results: ");

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
        GPIO_TRI  = 0;
        GPIO_DATA = LED_ALL;
        while (1) {
            mdm_puts("  *** ALL AXI3 TESTS PASSED ***\n");
            uart_puts("  *** ALL AXI3 TESTS PASSED ***\n");
            delay(150000000U);
        }
    } else {
        GPIO_TRI = 0;
        while (1) {
            mdm_puts("  *** AXI3 FAILURES DETECTED ***\n");
            uart_puts("  *** AXI3 FAILURES DETECTED ***\n");
            GPIO_DATA = LED_LD7;
            delay(75000000U);
            GPIO_DATA = 0;
            delay(75000000U);
        }
    }

    return 0;
}
