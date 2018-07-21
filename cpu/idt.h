#ifndef IDT_H
#define IDT_H

#include "types.h"

#define KERNEL_CS 0x08

typedef struct {
    u16 low_offset;     // lower 16 bits of handler function address
    u16 sel;            // kernel segment selector
    u8 always0;
    // first byte
    // bit 7: interrupt is present
    // bit 6-5: privilege level of caller (0:kernel, 3:user)
    // bit 4: set to 0 for interrupt gates
    // bits 3-0: bits 110
    u8 flags;
    u16 high_offset;    // higher 16 bits of handler function address
}__attribute__((packed)) idt_gate_t;

// pointer to the idt
// lidt  read it
typedef struct {
    u16 limit;
    u32 base;
}__attribute__((packed)) idt_register_t;


#define IDT_ENTRIES 256
idt_gate_t idt[IDT_ENTRIES];
idt_register_t idt_reg;

void set_idt_gate(int n, u32 handler);
void set_idt();

#endif

