#ifndef MEM_H
#define MEM_H

#include "../cpu/types.h"

void memory_copy(u8 *src, u8 *dst, u32 nbytes);
void memory_set(u8 *dst, u8 val, u32 len);

#endif