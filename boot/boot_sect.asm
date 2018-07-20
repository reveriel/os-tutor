
; use org, tell assambler the starting address
; so the assambler can help us add it to all lables
[org 0x7c00]
; boot sector is 512 bytes, last two bytes must be 0xaa55

KERNEL_OFFSET equ 0x1000    ; load our kernel here

    mov [BOOT_DRIVER], dl   ; BIOS stores the boot driver in dl, save it

    mov bp, 0x9000          ; set the stack
    mov sp, bp

    mov bx, MSG_REAL_MODE
    call print_string
    call print_ln

    call load_kernel

    call switch_to_pm       ; a no-return call

    jmp $

%include "boot/print_string.asm"
%include "boot/disk_load.asm"
%include "boot/gdt.asm"
%include "boot/print_string_pm.asm"
%include "boot/switch_to_pm.asm"
; %include "print_hex.asm"

[bits 16]
; load_kernel
load_kernel:
    mov bx, MSG_LOAD_KERNEL
    call print_string
    call print_ln

    mov bx, KERNEL_OFFSET       ; read  sectors from boot disk to
    mov dh, 16                  ; KERNEL_OFFSET
    mov dl, [BOOT_DRIVER]
    call disk_load

    ret

[bits 32]
BEGIN_PM:
    mov ebx, MSG_PROT_MODE
    call print_string_pm

    call KERNEL_OFFSET          ; jump to the kernel code

    jmp $

; global variables
BOOT_DRIVER     db   0
MSG_REAL_MODE   db  "Started in 16-bit Real Mode", 0
MSG_PROT_MODE   db  "Successfully landed in 32-bit Protected Mode", 0
MSG_LOAD_KERNEL db  "Loading kernel into memory.", 0


; times  repeat something
; NASM supports two special tokens in expressions, allowing calculations to
; involve the current assembly position: the $ and $$ tokens. $ evaluates to the
; assembly position at the beginning of the line containing the expression; so
; you can code an infinite loop using JMP $. $$ evaluates to the beginning of the
; current section; so you can tell how far into the section you are by using
; ($-$$)

; Fill with 510 zeros minus the size of the previous code
times 510-($-$$) db 0

; magic
dw 0xaa55
