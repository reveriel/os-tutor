

; bx is the string's starting address
; while [bx] != 0 {
;     print [bx]
;     bx + 1 }
print_string:
    pusha
    mov ah, 0x0e
while:
    mov al, [bx]
    cmp al, 0
    je end
    int 0x10
    add bx, 1
    jmp while
end:
    popa
    ret
