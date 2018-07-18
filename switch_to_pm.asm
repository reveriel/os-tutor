[bits 16]
; swtich to pretected mode
switch_to_pm:
    cli                 ; switch off interrupts until set-up pm interrupt vector

    lgdt [gdt_descriptor]   ; load global descriptor table

    mov eax, cr0            ; set the first bit of CR0
    or eax, 0x1
    mov cr0, eax

    jmp CODE_SEG:init_pm    ; a far jump to flush pipeline

[bits 32]
; Initialise registers and the stack one in PM,
init_pm:
    mov ax, DATA_SEG
    mov ds, ax
    mov ss, ax
    mov es, ax
    mov fs, ax
    mov gs, ax

    mov ebp, 0x90000
    mov esp, ebp

    call BEGIN_PM