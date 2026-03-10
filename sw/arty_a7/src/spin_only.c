// Copyright (c) 2026 Leonardo Capossio — bard0 design  hello@bard0.com
// SPDX-License-Identifier: MIT
/* spin_only.c — No AXI writes, just infinite spin. Tests if xsdb stop works. */
int main(void) {
    volatile int x = 0;
    while (1) {
        x++;
    }
    return 0;
}
