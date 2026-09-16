// Copyright (c) 2026 Leonardo Capossio - bard0 design  hello@bard0.com
// SPDX-License-Identifier: MIT
/*
 * main_qos_stress.c - Arty A7-100T axiZero multi-master QoS stress test
 *
 * Masters:
 *   s0: MicroBlaze full AXI4 (QoS tied to 0xF in BD)
 *   s1: QoS traffic gen #0 (QoS=0x8), sequential BRAM0 writes
 *   s2: QoS traffic gen #1 (QoS=0x4), reverse-order BRAM1 writes
 *   s3: saturating gen (QoS=0x0), up to 4 outstanding bursts in BRAM1
 *
 * Heavy traffic profile:
 *   MB:     512 words x 8 passes, writes only.
 *   G0/G1:  512 words x 8 passes, each word read back and compared in
 *           hardware, so the read address channel carries generated traffic
 *           at the generator's own QoS instead of the CPU's alone.
 *   G2:     128-word window x 64 passes of bursts (1, 2, 4, 8 beats by pass)
 *           with up to 4 outstanding, every word read back and compared.
 *           Fewer words and more passes than the other two, chosen so its
 *           beat count matches theirs despite bursts retiring faster.
 *
 * Each generator ends its run by writing a status word of its own:
 *
 *     status = TAG | (resp_errors << 8) | data_errors
 *
 * so a clean run leaves the bare TAG. Waiting on that word replaces the old
 * data-sentinel wait: it means "finished" the way a sentinel did, and it also
 * carries whatever the generator saw on its own read-back, which no amount of
 * checking from the CPU afterwards can reconstruct.
 */

#include "platform.h"

#define NWORDS          512U
#define NPASSES         8U
#define FINAL_PASS      (NPASSES - 1U)

#define MB_BASE_ADDR    0xC0000000UL
#define MB_PATTERN      0xA0000000UL

#define G0_BASE_ADDR    0xC0000800UL
#define G0_PATTERN      0xB1000000UL
#define G0_STATUS_ADDR  0xC0001FFCUL
#define G0_STATUS_TAG   0x5A710000UL

#define G1_BASE_ADDR    0xC0010800UL
#define G1_PATTERN      0xB2000000UL
#define G1_STATUS_ADDR  0xC0011000UL
#define G1_STATUS_TAG   0x5A720000UL

#define G2_BASE_ADDR    0xC0011800UL
#define G2_PATTERN      0xB3000000UL
#define G2_WORDS        128U
/*
 * The saturating generator covers a 128-word window per pass, against 512 for
 * the other two, and its bursts retire far faster than their single-beat
 * transactions. Matching their beat count keeps it contending for the whole
 * iteration instead of finishing early and leaving the fabric a master short.
 */
#define G2_NPASSES      64U
#define G2_FINAL_PASS   (G2_NPASSES - 1U)
#define G2_STATUS_ADDR  0xC0011FFCUL
#define G2_STATUS_TAG   0x5A700000UL

#define STATUS_TAG_MASK 0xFFFF0000UL

/*
 * Status words live in the gaps between the data windows, and every address
 * here must fit inside the 8 KB of physical BRAM behind each controller: the
 * block design assigns 64 K per controller, but the custom crossbar has no
 * BD-recognised AXI path, so MEM_DEPTH never propagates and anything above
 * 8 KB aliases back into the window. See the note in
 * create_project_qos_stress.tcl.
 *
 *   BRAM0 0xC0000000..0xC0001FFF   MB 0x000..0x7FF, G0 0x800..0xFFF
 *   BRAM1 0xC0010000..0xC0011FFF   G1 0x800..0xFFF, G2 0x1800..0x19FF
 */

#define G0_TRIG_BIT     (1u << 1)
#define G1_TRIG_BIT     (1u << 2)
#define G2_TRIG_BIT     (1u << 3)
/*
 * Keep all GPIO trigger bits high during launch.
 * This is robust against potential GPIO bus bit-order differences in BD slicing.
 */
#define ALL_TRIG_BITS   0xFu

int g_pass = 0;
int g_fail = 0;
volatile uint32_t g_heartbeat = 0;
volatile uint32_t g_iteration = 0;
volatile uint32_t g_fail_test = 0;   /* which sub-test failed (1-based code) */
volatile uint32_t g_fail_got  = 0;   /* actual value at failure */
volatile uint32_t g_fail_exp  = 0;   /* expected value at failure */
volatile uint32_t g_probe_gpio = 0;  /* GPIO readback after trigger */
volatile uint32_t g_probe_g0  = 0;   /* BRAM probe: G0 first word */
volatile uint32_t g_probe_g1  = 0;   /* BRAM probe: G1 last word (reverse) */
volatile uint32_t g_probe_g2  = 0;   /* BRAM probe: G2 first word */

static void pass(const char *name)
{
    mdm_puts("[PASS] "); mdm_puts(name); mdm_puts("\n");
    uart_puts("[PASS] "); uart_puts(name); uart_puts("\n");
    g_pass++;
}

static void fail_ex(uint32_t code, const char *name, const char *detail, uint32_t got, uint32_t exp)
{
    if (g_fail == 0) { g_fail_test = code; g_fail_got = got; g_fail_exp = exp; }
    mdm_puts("[FAIL] "); mdm_puts(name); mdm_puts("\n");
    uart_puts("[FAIL] "); uart_puts(name);
    uart_puts(" - "); uart_puts(detail);
    uart_puts("  got="); uart_hex32(got);
    uart_puts("  exp="); uart_hex32(exp);
    uart_puts("\n");
    g_fail++;
}

static void delay(volatile uint32_t n)
{
    while (n--) __asm__("nop");
}

static inline void beat(void)
{
    g_heartbeat++;
}

static inline void fire_triggers(void)
{
    GPIO_DATA = 0u;
    delay(256u);
    GPIO_DATA = ALL_TRIG_BITS;
}

static inline uint32_t exp_word(uint32_t pattern, uint32_t pass, uint32_t word)
{
    return pattern | ((pass & 0xFFu) << 16) | (word & 0xFFFFu);
}

static void clear_region(uint32_t base, uint32_t words)
{
    uint32_t i;
    for (i = 0; i < words; i++) {
        wr32(base + i * 4u, 0u);
        if ((i & 0x3Fu) == 0u) beat();
    }
}

/*
 * Wait for a generator's status word to appear, then report what it says.
 * Splitting the two apart keeps "the generator never finished" distinct from
 * "it finished and found errors", which a single equality wait would fold
 * into one indistinguishable timeout.
 */
static int wait_status(uint32_t addr, uint32_t tag, uint32_t timeout)
{
    while (((rd32(addr) & STATUS_TAG_MASK) != tag) && --timeout) {
        if ((timeout & 0x3FFu) == 0u) beat();
    }
    return (timeout != 0u);
}

static void test_t1_sanity(void)
{
    const uint32_t A0 = BRAM0_BASEADDR + 0x20;
    const uint32_t A1 = BRAM1_BASEADDR + 0x20;
    wr32(A0, 0xDEADBEEF);
    wr32(A1, 0xCAFEBABE);

    uint32_t g0 = rd32(A0);
    uint32_t g1 = rd32(A1);

    int ok = 1;
    if (g0 != 0xDEADBEEF) { fail_ex(1, "T1 sanity", "BRAM0", g0, 0xDEADBEEF); ok = 0; }
    if (g1 != 0xCAFEBABE) { fail_ex(2, "T1 sanity", "BRAM1", g1, 0xCAFEBABE); ok = 0; }
    if (ok) pass("T1 sanity BRAM0/BRAM1 read-write");
}

static void test_t2_t3_stress(void)
{
    uint32_t p, i;
    int ok;

    beat();
    uart_puts("[INFO] T2/T3 clearing BRAM0 stress regions...\n");
    clear_region(MB_BASE_ADDR, NWORDS);
    clear_region(G0_BASE_ADDR, NWORDS);
    clear_region(G1_BASE_ADDR, NWORDS);
    clear_region(G2_BASE_ADDR, G2_WORDS);
    /* Stale status words from a previous iteration would satisfy the wait
       below immediately, so they are cleared along with the data regions. */
    wr32(G0_STATUS_ADDR, 0u);
    wr32(G1_STATUS_ADDR, 0u);
    wr32(G2_STATUS_ADDR, 0u);

    GPIO_TRI  = 0;
    GPIO_DATA = 0;

    uart_puts("[INFO] Triggering three QoS traffic generators...\n");
    fire_triggers();

    int saw_g0_progress = 0;
    int saw_g1_progress = 0;
    int saw_g2_progress = 0;

    uart_puts("[INFO] Running MB heavy high-QoS stream...\n");
    for (p = 0; p < NPASSES; p++) {
        for (i = 0; i < NWORDS; i++) {
            wr32(MB_BASE_ADDR + i * 4u, exp_word(MB_PATTERN, p, i));
            if ((i & 0x3Fu) == 0u) {
                beat();
                /* Check for ANY non-zero value (region was cleared to 0).
                   Generators may overwrite pass-0 data with later passes
                   before we sample, so exact-match on pass 0 is unreliable. */
                if (rd32(G0_BASE_ADDR) != 0u) saw_g0_progress = 1;
                if (rd32(G1_BASE_ADDR + (NWORDS - 1u) * 4u) != 0u) saw_g1_progress = 1;
                if (rd32(G2_BASE_ADDR) != 0u ||
                    rd32(G2_BASE_ADDR + 0x40u) != 0u ||
                    rd32(G2_BASE_ADDR + 0x80u) != 0u) {
                    saw_g2_progress = 1;
                }
            }
        }
    }

    /* Capture generator probe values for diagnostics */
    g_probe_gpio = rd32(GPIO_BASEADDR + GPIO_DATA_OFF);
    g_probe_g0   = rd32(G0_BASE_ADDR);
    g_probe_g1   = rd32(G1_BASE_ADDR + (NWORDS - 1u) * 4u);
    g_probe_g2   = rd32(G2_BASE_ADDR);

    if (saw_g0_progress && saw_g1_progress && saw_g2_progress) {
        pass("T2 stress progress - all lower QoS generators progressed during MB stream");
    } else {
        fail_ex(3, "T2 stress progress", "at least one generator made no early progress",
             (saw_g0_progress << 2) | (saw_g1_progress << 1) | saw_g2_progress,
             0x7);
    }

    uart_puts("[INFO] Waiting for generator status words...\n");
    if (!wait_status(G0_STATUS_ADDR, G0_STATUS_TAG, 4000000u)) {
        fail_ex(4, "T3 completion G0", "timeout", rd32(G0_STATUS_ADDR), G0_STATUS_TAG);
        GPIO_DATA = 0;
        return;
    }
    if (!wait_status(G1_STATUS_ADDR, G1_STATUS_TAG, 4000000u)) {
        fail_ex(5, "T3 completion G1", "timeout", rd32(G1_STATUS_ADDR), G1_STATUS_TAG);
        GPIO_DATA = 0;
        return;
    }
    if (!wait_status(G2_STATUS_ADDR, G2_STATUS_TAG, 4000000u)) {
        fail_ex(6, "T3 completion G2", "timeout", rd32(G2_STATUS_ADDR), G2_STATUS_TAG);
        GPIO_DATA = 0;
        return;
    }

    /*
     * The tag arrived, so each generator ran to completion. The low half of
     * the word is its own verdict on the traffic it read back: a non-zero
     * low byte is a data mismatch it saw, the next byte up a non-OKAY
     * response. A clean run leaves the bare tag.
     */
    {
        uint32_t st0 = rd32(G0_STATUS_ADDR);
        uint32_t st1 = rd32(G1_STATUS_ADDR);
        uint32_t st2 = rd32(G2_STATUS_ADDR);
        if (st0 != G0_STATUS_TAG) {
            fail_ex(12, "T3 G0 read-back status", "generator reported errors",
                    st0, G0_STATUS_TAG);
        } else if (st1 != G1_STATUS_TAG) {
            fail_ex(13, "T3 G1 read-back status", "generator reported errors",
                    st1, G1_STATUS_TAG);
        } else if (st2 != G2_STATUS_TAG) {
            fail_ex(14, "T3 G2 read-back status", "generator reported errors",
                    st2, G2_STATUS_TAG);
        } else {
            pass("T3 generator hardware read-back clean on all three masters");
        }
    }

    /* NOTE: do NOT clear GPIO_DATA here — G2 GPIO verify needs to read it first */

    ok = 1;
    for (i = 0; i < NWORDS; i++) {
        uint32_t exp = exp_word(MB_PATTERN, FINAL_PASS, i);
        uint32_t got = rd32(MB_BASE_ADDR + i * 4u);
        if (got != exp) { fail_ex(7, "T3 MB verify", "word mismatch", got, exp); ok = 0; break; }
    }
    if (ok) pass("T3 MB final-pass region verify");

    ok = 1;
    for (i = 0; i < NWORDS; i++) {
        uint32_t exp = exp_word(G0_PATTERN, FINAL_PASS, i);
        uint32_t got = rd32(G0_BASE_ADDR + i * 4u);
        if (got != exp) { fail_ex(8, "T3 G0 verify", "word mismatch", got, exp); ok = 0; break; }
    }
    if (ok) pass("T3 G0 final-pass region verify");

    ok = 1;
    for (i = 0; i < NWORDS; i++) {
        uint32_t exp = exp_word(G1_PATTERN, FINAL_PASS, i);
        uint32_t got = rd32(G1_BASE_ADDR + i * 4u);
        if (got != exp) { fail_ex(9, "T3 G1 verify", "word mismatch", got, exp); ok = 0; break; }
    }
    if (ok) pass("T3 G1 reverse-pattern region verify");

    /*
     * The saturating generator covers its whole window on every pass, so the
     * final contents are fully determined and can be checked word for word.
     * The generator it replaced wrote random addresses, which is why this
     * check used to be a "some words were touched" heuristic that plain
     * round-robin would have satisfied just as well.
     */
    ok = 1;
    for (i = 0; i < G2_WORDS; i++) {
        uint32_t exp = exp_word(G2_PATTERN, G2_FINAL_PASS, i);
        uint32_t got = rd32(G2_BASE_ADDR + i * 4u);
        if (got != exp) { fail_ex(10, "T3 G2 verify", "word mismatch", got, exp); ok = 0; break; }
    }
    if (ok) pass("T3 G2 saturating-burst region verify");

    GPIO_DATA = 0;
}

int main(void)
{
    volatile uint32_t *ctrl = (volatile uint32_t *)(UART_BASEADDR + ULITE_CTRL_REG);
    *ctrl = ULITE_CTRL_RST_TX | ULITE_CTRL_RST_RX;
    *ctrl = 0;

    mdm_puts("\n[axiZero-QoS-Stress] booted\n");
    uart_puts("\n[axiZero-QoS-Stress] booted - waiting for host...\n");
    delay(300000000U);

    mdm_puts("[axiZero-QoS-Stress] starting tests...\n");
    uart_puts("\n==============================================\n");
    uart_puts("  axiZero Arty A7-100T QoS Stress Suite       \n");
    uart_puts("==============================================\n");
    uart_puts("  4 masters: MB(Q15), G0(Q8), G1(Q4), G2(Q0)  \n");
    uart_puts("  Heavy load: seq/reverse + random short bursts\n");
    uart_puts("----------------------------------------------\n");

    test_t1_sanity();

    while (1) {
        g_iteration++;
        beat();
        mdm_puts("[INFO] Stress iteration start\n");
        uart_puts("[INFO] Stress iteration start\n");

        test_t2_t3_stress();
        beat();

        if (g_fail != 0) {
            GPIO_TRI = 0;
            while (1) {
                mdm_puts("  *** QoS STRESS FAILURES DETECTED ***\n");
                uart_puts("  *** QoS STRESS FAILURES DETECTED ***\n");
                GPIO_DATA = LED_LD7;
                beat();
                delay(75000000U);
                GPIO_DATA = 0;
                beat();
                delay(75000000U);
            }
        }

        /*
         * The GPIO output also fans out to the traffic-generator triggers.
         * Keep it low between iterations; otherwise the generators can restart
         * while the next iteration is clearing/verifying memory.
         */
        GPIO_TRI = 0;
        GPIO_DATA = 0;
        beat();
    }

    return 0;
}
