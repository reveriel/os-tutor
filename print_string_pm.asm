[bits 32]

; define some constants
VIDEO_MEMORY equ 0xb8000
WHITE_ON_BLACK equ 0x0f

; prints a null-terminated string pointed to by EDX
print_string_pm:
    pusha
    mov edx, VIDEO_MEMORY       ; edx pointer to vid mem

print_string_pm_loop:
    mov al, [ebx]               ; ebx, the pointer to the string
    mov ah, WHITE_ON_BLACK      ; attribute

    cmp al, 0
    je print_string_pm_done

    mov [edx], ax

    add ebx, 1
    add edx, 2

    jmp print_string_pm_loop

print_string_pm_done:
    popa
    ret