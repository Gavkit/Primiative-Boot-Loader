bits 16

global _start

_start:
    ;; set up dx register for disk loading
    mov dh, 2
    mov dl, 0

    ;; set up stack
    mov bp, 0x9000
    mov sp, bp

    ;; set up ES:BX memory address
    mov bx, 0x1000
    mov es, bx
    mov bx, 0

    call disk_load
    jmp 0x1000:0


%include "drivers/disk.asm"

;; boot sector magic
times 510-($ - $$) db 0
dw 0xAA55