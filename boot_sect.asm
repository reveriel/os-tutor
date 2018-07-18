
; use org, tell assambler the starting address
; so the assambler can help us add it to all lables
[org 0x7c00]
; boot sector is 512 bytes, last two bytes must be 0xaa55

mov ah, 0x0e

mov bp, 0x8000
mov sp, bp

; 8000 .   sp bp
; 7fff .
; 7ffe A
; 7ffd .
; 7ffc B
; 7ffb .
; 7ffa C
; 7ffe .

push 'A'
push 'B'
push 'C'

; pop bx
; mov al, bl
; int 0x10

; pop bx
; mov al, bl
; int 0x10


; mov al, [0x8000]
; int 0x10
mov al, [0x7fff]
int 0x10
mov al, [0x7ffe]
int 0x10
mov al, [0x7ffd]
int 0x10
mov al, [0x7ffc]
int 0x10
mov al, [0x7ffb]
int 0x10
mov al, [0x7ffa]
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