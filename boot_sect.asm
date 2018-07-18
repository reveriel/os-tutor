
; use org, tell assambler the starting address
; so the assambler can help us add it to all lables
[org 0x7c00]
; boot sector is 512 bytes, last two bytes must be 0xaa55


mov bx, 43

    cmp bx, 4
    jg else1
    mov al, 'A'
    jmp end
else1:
    cmp bx, 40
    jge else2
    mov al, 'B'
    jmp end
else2:
    mov al, 'C'
end:

mov ah, 0x0e
int 0x10


jmp $




; string , null terminating
my_string:
    db 'Booting OS', 0

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