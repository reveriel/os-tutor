#ifndef MEM_H
#define MEM_H

#include <stdint.h>

void memory_copy(uint8_t *src, uint8_t *dst, uint32_t nbytes);
void memory_set(uint8_t *dst, uint8_t val, uint32_t len);

#endif