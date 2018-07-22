#ifndef IDT_H
#define IDT_H

#include <stdint.h>

#define KERNEL_CS 0x08

typedef struct {
    uint16_t low_offset;     // lower 16 bits of handler function address
    uint16_t sel;            // kernel segment selector
    uint8_t always0;
    // first byte
    // bit 7: interrupt is present
    // bit 6-5: privilege level of caller (0:kernel, 3:user)
    // bit 4: set to 0 for interrupt gates
    // bits 3-0: bits 110
    uint8_t flags;
    uint16_t high_offset;    // higher 16 bits of handler function address
}__attribute__((packed)) idt_gate_t;

// pointer to the idt
// lidt  read it
typedef struct {
    uint16_t limit;
    uint32_t base;
}__attribute__((packed)) idt_register_t;


#define IDT_ENTRIES 256
idt_gate_t idt[IDT_ENTRIES];
idt_register_t idt_reg;

void set_idt_gate(int n, uint32_t handler);
void set_idt();

#endif

