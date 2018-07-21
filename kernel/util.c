#include "util.h"

void memory_copy(u8 *src, u8 *dst, u32 nbytes) {
    while (nbytes--) *dst++ = *src++;
}

void memory_set(u8 *dst, u8 val, u32 len) {
    while (len--) *dst++ = val;
}

void int_to_ascii(int n, char str[]) {
    int i, sign;
    if ((sign = n) < 0) n = -n;
    i = 0;
    do {
        str[i++] = n % 10 + '0';
    } while ((n /= 10) > 0);
    if (sign < 0) str[i++] = '-';
    str[i--] = '\0';
    // reverse
    revsere_n((u8*)str, i);
}

void reverse(u8 *s) {
    revsere_n(s, strlen(s));
}

// reverse the array s of length len
void revsere_n(u8 *s, u32 len) {
    u8 *e = s + len;
    while (s < e) {
        SWAP(*s, *e);
        ++s, --e;
    }
}


// don't count the '/0'
int strlen(u8 *s) {
    int i = 0;
    while (s[i] != '\0') ++i;
    return i;
}
