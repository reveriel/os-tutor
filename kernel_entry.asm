[bits 32]
[extern main]           ; Define calling point. Must have same name as kernel
                        ; 'main' function
call main               ; call the C function, The linker wiil know where
jmp $