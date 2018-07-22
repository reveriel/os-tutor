#ifndef STRING_H
#define STRING_H

#include <stdint.h>

// convert n to a string, put in str
void int_to_ascii(int n, char *str);
// reverse a string
void reverse(char *s);
void revsere_n(char *s, unsigned int len);
int strlen(char *s);
// append char n to stirng s
void append(char *s, char n);
// delete the last character in s
void backspace(char *s);
int strcmp(char *s1, char *s2);

#endif