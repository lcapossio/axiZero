// Copyright (c) 2026 Leonardo Capossio — bard0 design  hello@bard0.com
// SPDX-License-Identifier: MIT
/*
 * platform.h  —  Arty A7-100T axiZero hardware test
 *
 * Address map (matches create_project.tcl assignments):
 *
 *   0x0000_0000 – 0x0000_7FFF   Local BRAM (32 KB, via LMB)  — code + data
 *   0xC000_0000 – 0xC000_FFFF   AXI BRAM #0 (64 KB, via axiZero S0)
 *   0xC001_0000 – 0xC001_FFFF   AXI BRAM #1 (64 KB, via axiZero S1)
 *   0xC002_0000 – 0xC002_0FFF   AXI GPIO    (4 LEDs, via axiZero S2)
 *   0xC003_0000 – 0xC003_0FFF   AXI UART Lite (115200, via axiZero S3)
 */

#ifndef PLATFORM_H
#define PLATFORM_H

#include <stdint.h>

/* ── Peripheral base addresses ─────────────────────────────────────────── */

#define BRAM0_BASEADDR    0xC0000000UL   /* AXI BRAM Controller 0 */
#define BRAM1_BASEADDR    0xC0010000UL   /* AXI BRAM Controller 1 */
#define GPIO_BASEADDR     0xC0020000UL   /* AXI GPIO (channel 1 = 4 LEDs) */
#define UART_BASEADDR     0xC0030000UL   /* AXI UART Lite */
#define AXIS_STATUS_BASEADDR 0xC0040000UL /* AXIS smoke status GPIO */

/* ── Region sizes ──────────────────────────────────────────────────────── */

#define BRAM_SIZE         0x00010000UL   /* 64 KB each */
#define BRAM_WORDS        (BRAM_SIZE / 4)

/* ── AXI GPIO register offsets (Xilinx PG144) ──────────────────────────── */

#define GPIO_DATA_OFF     0x0000         /* GPIO channel 1 data */
#define GPIO_TRI_OFF      0x0004         /* GPIO channel 1 tri (0 = output) */

/* LED convenience macros */
#define GPIO_DATA         (*(volatile uint32_t *)(GPIO_BASEADDR + GPIO_DATA_OFF))
#define GPIO_TRI          (*(volatile uint32_t *)(GPIO_BASEADDR + GPIO_TRI_OFF))

#define LED_LD4           (1u << 0)
#define LED_LD5           (1u << 1)
#define LED_LD6           (1u << 2)
#define LED_LD7           (1u << 3)
#define LED_ALL           (LED_LD4 | LED_LD5 | LED_LD6 | LED_LD7)

/* ── AXI UART Lite register offsets (Xilinx PG142) ─────────────────────── */

#define ULITE_RX_FIFO     0x0000         /* Receive data FIFO */
#define ULITE_TX_FIFO     0x0004         /* Transmit data FIFO */
#define ULITE_STAT_REG    0x0008         /* Status register */
#define ULITE_CTRL_REG    0x000C         /* Control register */

#define ULITE_STAT_TX_FULL   (1u << 3)   /* TX FIFO full */
#define ULITE_STAT_TX_EMPTY  (1u << 2)   /* TX FIFO empty */
#define ULITE_STAT_RX_FULL   (1u << 1)   /* RX FIFO full */
#define ULITE_STAT_RX_VALID  (1u << 0)   /* RX FIFO has data */

#define ULITE_CTRL_RST_TX    (1u << 0)   /* Reset TX FIFO */
#define ULITE_CTRL_RST_RX    (1u << 1)   /* Reset RX FIFO */

/* ── UART Lite helper (polled, no interrupt) ────────────────────────────── */

static inline void uart_putc(char c)
{
    volatile uint32_t *stat = (volatile uint32_t *)(UART_BASEADDR + ULITE_STAT_REG);
    volatile uint32_t *tx   = (volatile uint32_t *)(UART_BASEADDR + ULITE_TX_FIFO);
    while (*stat & ULITE_STAT_TX_FULL)
        ;
    *tx = (uint8_t)c;
}

static inline void uart_puts(const char *s)
{
    while (*s) {
        if (*s == '\n') uart_putc('\r');
        uart_putc(*s++);
    }
}

/* ── MDM JTAG-UART (output via MicroBlaze putd debug instruction) ────────
 * Readable from xsdb with: connect; targets MicroBlaze; jtagterminal      */
static inline void mdm_putc(char c)
{
    /* putd Rb, Ra: write Rb to debug port indexed by Ra (0 = write JTAG TX) */
    __asm__ volatile ("putd %0, r0" :: "d"((unsigned)(unsigned char)c));
}

static inline void mdm_puts(const char *s)
{
    while (*s) mdm_putc(*s++);
}

/* Tiny hex printer — avoids pulling in printf */
static inline void uart_hex32(uint32_t v)
{
    static const char hex[] = "0123456789ABCDEF";
    uart_puts("0x");
    for (int i = 28; i >= 0; i -= 4)
        uart_putc(hex[(v >> i) & 0xF]);
}

/* ── Bare-metal memory access helpers ───────────────────────────────────── */

static inline void     wr32(uint32_t addr, uint32_t val) { *(volatile uint32_t *)addr = val; }
static inline uint32_t rd32(uint32_t addr)               { return *(volatile uint32_t *)addr; }

#endif /* PLATFORM_H */
