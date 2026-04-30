// Copyright (c) 2026 Leonardo Capossio - bard0 design  hello@bard0.com
// SPDX-License-Identifier: MIT
/*
 * main_axis.c - Arty A7-100T axiZero AXI4-Stream smoke hardware test
 */

#include "platform.h"

int g_pass = 0;
int g_fail = 0;
volatile uint32_t g_axis_status = 0;

#define AXIS_DONE       (1u << 0)
#define AXIS_PASS       (1u << 1)
#define AXIS_FAIL       (1u << 2)
#define AXIS_DEMUX0_BYTES_OK      (1u << 3)
#define AXIS_DEMUX1_BYTES_OK      (1u << 4)
#define AXIS_BCAST0_BEATS_OK      (1u << 5)
#define AXIS_BCAST1_BEATS_OK      (1u << 6)
#define AXIS_SUMS_OK              (1u << 7)
#define AXIS_FRAMES_OK            (1u << 8)
#define AXIS_BACKPRESSURE_SEEN    (1u << 9)
#define AXIS_ROUTE_OK             (1u << 10)
#define AXIS_DETAIL_MASK          0x000007FFu
#define AXIS_EXPECTED \
    (AXIS_DONE | AXIS_PASS | AXIS_DEMUX0_BYTES_OK | AXIS_DEMUX1_BYTES_OK | \
     AXIS_BCAST0_BEATS_OK | AXIS_BCAST1_BEATS_OK | AXIS_SUMS_OK | \
     AXIS_FRAMES_OK | AXIS_BACKPRESSURE_SEEN | AXIS_ROUTE_OK)
#define AXIS_STATUS     (*(volatile uint32_t *)(AXIS_STATUS_BASEADDR + GPIO_DATA_OFF))

static void pass(const char *name)
{
    g_pass++;
    uart_puts("[PASS] ");
    uart_puts(name);
    uart_puts("\n");
}

static void fail(const char *name, uint32_t got, uint32_t exp)
{
    g_fail++;
    uart_puts("[FAIL] ");
    uart_puts(name);
    uart_puts(" got=");
    uart_hex32(got);
    uart_puts(" exp=");
    uart_hex32(exp);
    uart_puts("\n");
}

static void test_axis_smoke(void)
{
    uint32_t status = 0;

    for (uint32_t i = 0; i < 1000000u; i++) {
        status = AXIS_STATUS;
        g_axis_status = status;
        if (status & AXIS_DONE) {
            break;
        }
    }

    uart_puts("AXIS status = ");
    uart_hex32(status);
    uart_puts("\n");

    if (!(status & AXIS_DONE)) {
        fail("AXI4-Stream smoke timeout", status, AXIS_DONE);
        return;
    }

    if ((status & (AXIS_DONE | AXIS_PASS | AXIS_FAIL)) != (AXIS_DONE | AXIS_PASS)) {
        fail("AXI4-Stream smoke status bits", status, AXIS_EXPECTED);
        return;
    }

    if ((status & AXIS_DETAIL_MASK) != AXIS_EXPECTED) {
        fail("AXI4-Stream smoke detail bits", status & AXIS_DETAIL_MASK, AXIS_EXPECTED);
        return;
    }

    pass("AXI4-Stream smoke path");
}

int main(void)
{
    volatile uint32_t *ctrl = (volatile uint32_t *)(UART_BASEADDR + ULITE_CTRL_REG);
    *ctrl = ULITE_CTRL_RST_TX | ULITE_CTRL_RST_RX;

    for (volatile uint32_t i = 0; i < 3000000u; i++) {
        ;
    }

    uart_puts("\n==========================================\n");
    uart_puts("  axiZero Arty A7-100T AXI4-Stream smoke \n");
    uart_puts("==========================================\n");

    GPIO_TRI = 0;
    GPIO_DATA = 0;

    test_axis_smoke();

    if (g_fail == 0) {
        GPIO_DATA = LED_ALL;
        uart_puts("\n*** ALL AXIS HW TESTS PASSED ***\n");
    } else {
        while (1) {
            GPIO_DATA = LED_LD7;
            for (volatile uint32_t i = 0; i < 1000000u; i++) {
                ;
            }
            GPIO_DATA = 0;
            for (volatile uint32_t i = 0; i < 1000000u; i++) {
                ;
            }
        }
    }

    while (1) {
        ;
    }

    return 0;
}
