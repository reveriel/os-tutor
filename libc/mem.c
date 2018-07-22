#include "mem.h"

void memory_copy(uint8_t *src, uint8_t *dst, uint32_t nbytes) {
    while (nbytes--) *dst++ = *src++;
}

void memory_set(uint8_t *dst, uint8_t val, uint32_t len) {
    while (len--) *dst++ = val;
}