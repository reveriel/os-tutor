#include "timer.h"
#include "../drivers/screen.h"
#include "isr.h"
#include "../cpu/ports.h"
#include "../libc/string.h"
#include "../libc/function.h"


unsigned int tick = 0;

static void timer_callback(registers_t regs) {
    tick++;
    UNUSED(regs);
    // kprint("Tick: ");

    // char tick_ascii[256];
    // int_to_ascii(tick, tick_ascii);
    // kprint(tick_ascii);
    // kprint("\n");
}

void init_timer(uint32_t freq) {
    register_interrupt_handler(IRQ0, timer_callback);

    //  hardware clock at 1193180 hz
    unsigned int divisor = 1193180 / freq;
    uint8_t low = (uint8_t)(divisor & 0xff);
    uint8_t high = (uint8_t)((divisor >> 8) & 0xff);

    port_byte_out(0x43, 0x36);  // command port
    port_byte_out(0x40, low);
    port_byte_out(0x40, high);

}
