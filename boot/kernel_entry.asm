global _start
[bits 32]

_start:
[extern kernel_main]           ; Define calling point. Must have same name as kernel
                        ; 'main' function
call kernel_main               ; call the C function, The linker wiil know where
jmp $