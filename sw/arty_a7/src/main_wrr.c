// Copyright (c) 2026 Leonardo Capossio — bard0 design  hello@bard0.com
// SPDX-License-Identifier: MIT
/*
 * main_wrr.c  —  Arty A7-100T axiZero WRR hardware test
 *
 * Runs on MicroBlaze (local BRAM at 0x0000_0000).
 * Tests 2-master weighted round-robin arbitration through axiZero crossbar.
 *
 * System: 2M × 4S, WeightedRoundRobin(weights=[3,1])
 *   Master 0 = MicroBlaze M_AXI_DP (weight 3)
 *   Master 1 = AXI Traffic Gen      (weight 1)
 *
 * Traffic gen is triggered by GPIO bit 3.  It writes 256 words to
 * BRAM #0 at 0xC0008000 with pattern 0xB0000000|i.
 *
 * Test plan
 * ─────────
 *  T1  Sanity: single-word write/read to BRAM #0 and #1
 *  T2  WRR contention: MB + traffic gen both write to BRAM #0
 *      simultaneously; verify all data from both masters is correct
 *  T3  WRR starvation: verify traffic gen (weight=1) completes all 256 words
 */

#include "platform.h"

/* Traffic gen parameters (must match axi_traffic_gen.v) */
#define TGEN_BASE_ADDR   0xC0001000UL
#define TGEN_NWORDS      256
#define TGEN_PATTERN     0xB0000000UL

/* MicroBlaze write region (lower half of BRAM #0) */
#define MB_BASE_ADDR     0xC0000000UL
#define MB_NWORDS        256
#define MB_PATTERN       0xA0000000UL

/* GPIO bit 3 = traffic gen trigger */
#define TGEN_TRIGGER_BIT (1u << 3)

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

static void delay(volatile uint32_t n)
{
    while (n--) __asm__("nop");
}

/* ══════════════════════════════════════════════════════════════════════════
 * T1  Sanity: single-word write/read to each BRAM
 * ══════════════════════════════════════════════════════════════════════════ */

static void test_t1(void)
{
    const uint32_t ADDR0 = BRAM0_BASEADDR + 0x100;
    const uint32_t ADDR1 = BRAM1_BASEADDR + 0x100;

    wr32(ADDR0, 0xDEADBEEF);
    wr32(ADDR1, 0xCAFEBABE);

    uint32_t g0 = rd32(ADDR0);
    uint32_t g1 = rd32(ADDR1);

    int ok = 1;
    if (g0 != 0xDEADBEEF) { fail("T1 sanity", "BRAM0", g0, 0xDEADBEEF); ok = 0; }
    if (g1 != 0xCAFEBABE) { fail("T1 sanity", "BRAM1", g1, 0xCAFEBABE); ok = 0; }
    if (ok) pass("T1 sanity write/read BRAM0+BRAM1");
}

/* ══════════════════════════════════════════════════════════════════════════
 * T2  WRR contention — both masters write to BRAM #0 simultaneously
 *
 * 1. Clear both regions in BRAM #0
 * 2. Trigger traffic gen (GPIO bit 3 = 1)
 * 3. MicroBlaze immediately writes 256 words to lower half
 * 4. Wait for traffic gen to finish (poll last word sentinel)
 * 5. Verify MicroBlaze region
 * 6. Verify traffic gen region
 * ══════════════════════════════════════════════════════════════════════════ */

static void test_t2_t3(void)
{
    uint32_t i;
    int ok;

    uart_puts("[INFO] T2/T3 clearing BRAM #0 regions...\n");

    /* 1. Clear both regions */
    for (i = 0; i < MB_NWORDS; i++)
        wr32(MB_BASE_ADDR + i * 4, 0);
    for (i = 0; i < TGEN_NWORDS; i++)
        wr32(TGEN_BASE_ADDR + i * 4, 0);

    /* 2. Trigger traffic gen: GPIO bit 3 = 1 */
    uart_puts("[INFO] T2/T3 triggering traffic gen + MB concurrent writes...\n");
    GPIO_TRI  = 0;
    GPIO_DATA = TGEN_TRIGGER_BIT;

    /* 3. MicroBlaze writes 256 words to lower half immediately */
    for (i = 0; i < MB_NWORDS; i++)
        wr32(MB_BASE_ADDR + i * 4, MB_PATTERN | i);

    /* 4. Wait for traffic gen — poll the last word (sentinel) */
    /*    Traffic gen writes word[255] = 0xB00000FF as its final write */
    {
        uint32_t sentinel_addr = TGEN_BASE_ADDR + (TGEN_NWORDS - 1) * 4;
        uint32_t sentinel_exp  = TGEN_PATTERN | (TGEN_NWORDS - 1);
        uint32_t timeout = 1000000;
        while (rd32(sentinel_addr) != sentinel_exp && --timeout)
            ;
        if (timeout == 0) {
            fail("T2 WRR contention", "traffic gen timeout",
                 rd32(sentinel_addr), sentinel_exp);
            GPIO_DATA = 0;
            return;
        }
    }

    /* De-assert trigger */
    GPIO_DATA = 0;

    /* 5. Verify MicroBlaze region (T2) */
    uart_puts("[INFO] T2 verifying MicroBlaze writes...\n");
    ok = 1;
    for (i = 0; i < MB_NWORDS; i++) {
        uint32_t exp = MB_PATTERN | i;
        uint32_t got = rd32(MB_BASE_ADDR + i * 4);
        if (got != exp) {
            fail("T2 WRR MB writes", "word mismatch", got, exp);
            ok = 0;
            break;
        }
    }
    if (ok) pass("T2 WRR contention — MB writes correct");

    /* 6. Verify traffic gen region (T3: starvation check) */
    uart_puts("[INFO] T3 verifying traffic gen writes (starvation check)...\n");
    ok = 1;
    for (i = 0; i < TGEN_NWORDS; i++) {
        uint32_t exp = TGEN_PATTERN | i;
        uint32_t got = rd32(TGEN_BASE_ADDR + i * 4);
        if (got != exp) {
            fail("T3 WRR starvation", "tgen word mismatch", got, exp);
            ok = 0;
            break;
        }
    }
    if (ok) pass("T3 WRR no starvation — traffic gen writes correct");
}

/* ══════════════════════════════════════════════════════════════════════════
 * Entry point
 * ══════════════════════════════════════════════════════════════════════════ */

int main(void)
{
    /* Init UART FIFOs */
    volatile uint32_t *ctrl = (volatile uint32_t *)(UART_BASEADDR + ULITE_CTRL_REG);
    *ctrl = ULITE_CTRL_RST_TX | ULITE_CTRL_RST_RX;
    *ctrl = 0;

    mdm_puts("\n[axiZero-WRR] booted via MDM JTAG-UART\n");
    uart_puts("\n[axiZero-WRR] booted — waiting for host...\n");
    delay(300000000U);

    mdm_puts("[axiZero-WRR] starting WRR tests...\n");
    uart_puts("\n");
    uart_puts("==============================================\n");
    uart_puts("  axiZero Arty A7-100T WRR test suite        \n");
    uart_puts("==============================================\n");
    uart_puts("  2M x 4S, WRR weights=[3,1]                \n");
    uart_puts("  M0=MicroBlaze(w=3) M1=TrafficGen(w=1)     \n");
    uart_puts("----------------------------------------------\n");

    test_t1();
    test_t2_t3();

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
            mdm_puts("  *** ALL WRR TESTS PASSED ***\n");
            uart_puts("  *** ALL WRR TESTS PASSED ***\n");
            delay(150000000U);
        }
    } else {
        GPIO_TRI = 0;
        while (1) {
            mdm_puts("  *** WRR FAILURES DETECTED ***\n");
            uart_puts("  *** WRR FAILURES DETECTED ***\n");
            GPIO_DATA = LED_LD7;
            delay(75000000U);
            GPIO_DATA = 0;
            delay(75000000U);
        }
    }
    return 0;
}
