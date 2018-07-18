
; use org, tell assambler the starting address
; so the assambler can help us add it to all lables
[org 0x7c00]
; boot sector is 512 bytes, last two bytes must be 0xaa55


    mov bx, HELLO_MSG
    call print_string

    mov bx, GOODBYE_MSG
    call print_string

    jmp $

%include "print_string.asm"

; DATA
HELLO_MSG:
    db 'Hello, World!', 0
GOODBYE_MSG:
    db 'Goodby!', 0


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