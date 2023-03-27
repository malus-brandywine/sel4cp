/*
 * Copyright 2021, Breakaway Consulting Pty. Ltd.
 *
 * SPDX-License-Identifier: BSD-2-Clause
 */
#include <stdint.h>
#include <sel4cp.h>

void
init(void)
{
    sel4cp_dbg_puts("Crashing PD starting!\n");
    int *x = 0;
    *x = 123;
}

void
notified(sel4cp_channel ch)
{
}