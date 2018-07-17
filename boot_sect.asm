
loop:
    jmp loop


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