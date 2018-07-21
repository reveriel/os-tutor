#ifndef UTIL_H
#define UTIL_H

#include "../cpu/types.h"


#define SWAP(x, y) do { typeof(x) SWAP = x; x = y; y = SWAP; } while (0)

void memory_copy(u8 *src, u8 *dst, u32 nbytes);
void memory_set(u8 *dst, u8 val, u32 len);
void int_to_ascii(int n, char str[]);
void reverse(u8 *s);
void revsere_n(u8 *s, u32 len);
int strlen(u8 *s);

#endif
