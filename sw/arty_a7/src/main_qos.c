// Copyright (c) 2026 Leonardo Capossio - bard0 design  hello@bard0.com
// SPDX-License-Identifier: MIT
/*
 * main_qos.c  -  Arty A7-100T axiZero QoS hardware stress test
 *
 * System: 2M x 4S, QosBased arbitration + aging anti-starvation
 *   Master 0 = MicroBlaze M_AXI_DP (AWQOS/ARQOS tied to 0xF in BD)
 *   Master 1 = AXI Traffic Gen (AXI4-Lite -> QoS 0 through Lite->Full adapter)
 *
 * Test plan
 *   T1  Sanity: single-word write/read to BRAM0 and BRAM1
 *   T2  QoS stress: MB high-QoS stream + low-QoS traffic gen concurrently
 *       and verify low-QoS traffic makes progress before MB stream completes.
 *   T3  Completion check: verify full low-QoS region (no starvation).
 */

#include "platform.h"

#define TGEN_BASE_ADDR   0xC0001000UL
#define TGEN_NWORDS      256
#define TGEN_PATTERN     0xB0000000UL

#define MB_BASE_ADDR     0xC0000000UL
#define MB_NWORDS_STRESS 1024
#define MB_PATTERN       0xA0000000UL

#define TGEN_TRIGGER_BIT (1u << 3)

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

static void test_t2_t3(void)
{
    uint32_t i;
    int ok;

    uart_puts("[INFO] T2/T3 clearing BRAM0 regions...\n");
    for (i = 0; i < MB_NWORDS_STRESS; i++) wr32(MB_BASE_ADDR + i * 4, 0);
    for (i = 0; i < TGEN_NWORDS; i++)      wr32(TGEN_BASE_ADDR + i * 4, 0);

    uart_puts("[INFO] T2 triggering low-QoS traffic gen and starting MB high-QoS stream...\n");
    GPIO_TRI  = 0;
    GPIO_DATA = TGEN_TRIGGER_BIT;

    int saw_tgen_progress = 0;
    for (i = 0; i < MB_NWORDS_STRESS; i++) {
        wr32(MB_BASE_ADDR + i * 4, MB_PATTERN | i);
        if ((i & 0xF) == 0) {
            if (rd32(TGEN_BASE_ADDR) == (TGEN_PATTERN | 0u)) {
                saw_tgen_progress = 1;
            }
        }
    }

    if (!saw_tgen_progress) {
        fail("T2 QoS stress", "low-QoS traffic made no early progress", rd32(TGEN_BASE_ADDR), TGEN_PATTERN | 0u);
    } else {
        pass("T2 QoS stress - low-QoS traffic progressed during high-QoS stream");
    }

    {
        uint32_t sentinel_addr = TGEN_BASE_ADDR + (TGEN_NWORDS - 1) * 4;
        uint32_t sentinel_exp  = TGEN_PATTERN | (TGEN_NWORDS - 1);
        uint32_t timeout = 2000000;
        while (rd32(sentinel_addr) != sentinel_exp && --timeout) ;
        if (timeout == 0) {
            fail("T3 QoS no-starvation", "traffic gen timeout", rd32(sentinel_addr), sentinel_exp);
            GPIO_DATA = 0;
            return;
        }
    }

    GPIO_DATA = 0;

    ok = 1;
    for (i = 0; i < MB_NWORDS_STRESS; i++) {
        uint32_t exp = MB_PATTERN | i;
        uint32_t got = rd32(MB_BASE_ADDR + i * 4);
        if (got != exp) {
            fail("T3 MB region verify", "word mismatch", got, exp);
            ok = 0;
            break;
        }
    }
    if (ok) pass("T3 MB high-QoS region data intact");

    ok = 1;
    for (i = 0; i < TGEN_NWORDS; i++) {
        uint32_t exp = TGEN_PATTERN | i;
        uint32_t got = rd32(TGEN_BASE_ADDR + i * 4);
        if (got != exp) {
            fail("T3 low-QoS completion", "tgen word mismatch", got, exp);
            ok = 0;
            break;
        }
    }
    if (ok) pass("T3 low-QoS no-starvation - traffic gen region complete");
}

int main(void)
{
    volatile uint32_t *ctrl = (volatile uint32_t *)(UART_BASEADDR + ULITE_CTRL_REG);
    *ctrl = ULITE_CTRL_RST_TX | ULITE_CTRL_RST_RX;
    *ctrl = 0;

    mdm_puts("\n[axiZero-QoS] booted via MDM JTAG-UART\n");
    uart_puts("\n[axiZero-QoS] booted - waiting for host...\n");
    delay(300000000U);

    mdm_puts("[axiZero-QoS] starting QoS stress tests...\n");
    uart_puts("\n");
    uart_puts("==============================================\n");
    uart_puts("  axiZero Arty A7-100T QoS stress suite      \n");
    uart_puts("==============================================\n");
    uart_puts("  2M x 4S, QosBased + aging anti-starvation  \n");
    uart_puts("  M0=MicroBlaze(QoS=15)  M1=TrafficGen(QoS=0)\n");
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
            mdm_puts("  *** ALL QoS TESTS PASSED ***\n");
            uart_puts("  *** ALL QoS TESTS PASSED ***\n");
            delay(150000000U);
        }
    } else {
        GPIO_TRI = 0;
        while (1) {
            mdm_puts("  *** QoS FAILURES DETECTED ***\n");
            uart_puts("  *** QoS FAILURES DETECTED ***\n");
            GPIO_DATA = LED_LD7;
            delay(75000000U);
            GPIO_DATA = 0;
            delay(75000000U);
        }
    }

    return 0;
}
