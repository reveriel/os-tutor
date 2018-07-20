void memory_copy(char *src, char *dst, int nbytes) {
    while (nbytes--)
        *dst++ = *src++;
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
    int j = 0;
    while (j < i) {
        int tmp = str[i];
        str[i] = str[j];
        str[j] = tmp;
        i--; j++;
    }
}
