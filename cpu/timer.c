#include "timer.h"
#include "../drivers/screen.h"
#include "../kernel/util.h"
#include "isr.h"
#include "../drivers/ports.h"

u32 tick = 0;

static void timer_callback(registers_t regs) {
    tick++;
    kprint("Tick: ");

    char tick_ascii[256];
    int_to_ascii(tick, tick_ascii);
    kprint(tick_ascii);
    kprint("\n");
}

void init_timer(u32 freq) {
    register_interrupt_handler(IRQ0, timer_callback);

    //  hardware clock at 1193180 hz
    u32 divisor = 1193180 / freq;
    u8 low = (u8)(divisor & 0xff);
    u8 high = (u8)((divisor >> 8) & 0xff);

    port_byte_out(0x43, 0x36);  // command port
    port_byte_out(0x40, low);
    port_byte_out(0x40, high);

}
