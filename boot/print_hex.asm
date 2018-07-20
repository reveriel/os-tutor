
; input : a wrod in dx
; return
;   e.g.  dx = 0x1fb6, print '1fb6'
;   data in dx is modified
; algorithm:
; byte to char
print_hex:
    pusha
    mov ah, 0x0e
    ; first digit
    mov bl, dh
    shr bl, 4
    call hex_char
    mov al, bl
    int 0x10
    ; second
    mov bl, dh
    and bl, 0x0f
    call hex_char
    mov al, bl
    int 0x10
    ; third
    mov bl, dl
    shr bl, 4
    call hex_char
    mov al, bl
    int 0x10
    ; fourth
    mov bl, dl
    and bl, 0x0f
    call hex_char
    mov al, bl
    int 0x10
    popa
    ret

; input: a byte in bl, its lower 4 bits
; return: bl
; 0x0 to 0x9 ->  '0' to '9'
; 0xa to 0xf  -> 'a' to 'f'
hex_char:
    cmp bl, 9
    jg hex_char_else
    add bl, '0'
    jmp hex_char_end
hex_char_else:
    sub bl, 10
    add bl, 'a'
hex_char_end:
    ret