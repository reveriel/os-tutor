
; load DH sectors to ES:BX from drive DL
disk_load:
    pusha
    push dx

    mov ah, 0x02        ; BISO read sector function
    mov al, dh          ; dh sectors
    mov ch, 0x00        ; cylinder 0
    mov dh, 0x00        ; head 0
    mov cl, 0x02        ; second sector
    int 0x13            ; BIOS interrupt

    jc disk_error

    pop dx
    cmp dh, al          ; if AL(sectors read) != DH(sectors expected)
    jne disk_error_sec

    popa
    ret

disk_error:
    mov bx, DISK_ERROR_MSG
    call print_string
    call print_ln
    jmp $

disk_error_sec:
    mov bx, DISK_ERROR_SEC
    call print_string
    call print_ln
    jmp $

DISK_ERROR_MSG:
    db "Disk read error!", 0
DISK_ERROR_SEC:
    db "Disk read sec num err!", 0