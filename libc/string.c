#include "string.h"

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
    revsere_n(str, i);
}

void reverse(char *s) {
    revsere_n(s, strlen(s));
}

// reverse the array s of length len
void revsere_n(char *s, unsigned int len) {
    char *e = s + len -1;
    while (s < e) {
        char tmp = *s; *s = *e; *e = tmp;
        ++s, --e;
    }
}

// don't count the '/0'
int strlen(char *s) {
    int i = 0;
    while (s[i] != '\0') ++i;
    return i;
}

void append(char *s, char n) {
    while (*s++);
    *s++ = n;
    *s = '\0';
}

void backspace(char *s) {
    while (*s++);
    *--s = '\0';
}

int strcmp(char *s1, char *s2) {
    while (*s1 && (*s1 == *s2))
        s1++, s2++;
    return *s1 - *s2;
}


