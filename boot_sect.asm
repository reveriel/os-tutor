
; use org, tell assambler the starting address
; so the assambler can help us add it to all lables
[org 0x7c00]
; boot sector is 512 bytes, last two bytes must be 0xaa55


    mov [BOOT_DRIVE], dl    ; BISO stores our boot drive in DL, we save it

    mov bp , 0x8000         ; set stack away from here
    mov sp, bp

    mov bx, 0x9000          ; load 2 sectors to 0x0000:0x90000
    mov dh, 2
    mov dl, [BOOT_DRIVE]
    call disk_load

    mov dx, [0x9000]
    call print_hex

    mov dx, [0x9000 + 512]
    call print_hex

    jmp $

%include "print_string.asm"
%include "print_hex.asm"
%include "disk_load.asm"

; DATA
BOOT_DRIVE: db  0


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


; disk_load test data
; a sector is 512 bytes
times 256 dw 0xdada
times 256 dw 0xface


