#include "../drivers/screen.h"
#include "util.h"

void main() {
    clear_screen();

    for (int i = 0; i < 24; i++) {
        char str[255];
        int_to_ascii(i, str);
        kprint_at(str, 0, i);
    }

    kprint_at("This text forces the kernel to sroll.\n", 60, 24);
    kprint("And with this, the kernel will scroll again.\n");
}
