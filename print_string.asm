

; bx is the string's starting address
; while [bx] != 0 {
;     print [bx]
;     bx + 1 }
print_string:
    pusha
    mov ah, 0x0e
print_string_while:
    mov al, [bx]
    cmp al, 0
    je print_string_end
    int 0x10
    add bx, 1
    jmp print_string_while
print_string_end:
    popa
    ret

; print lf cr
print_ln:
    pusha
    mov ah, 0x0e
    mov al, 0x0a
    int 0x10
    mov al, 0x0d
    int 0x10
    popa
    ret