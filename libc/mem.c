#include "mem.h"
#include "../cpu/types.h"


void memory_copy(u8 *src, u8 *dst, u32 nbytes) {
    while (nbytes--) *dst++ = *src++;
}

void memory_set(u8 *dst, u8 val, u32 len) {
    while (len--) *dst++ = val;
}