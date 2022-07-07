;;;
;;; Simple Boot loader
;;;
    org 0x7c00

    ;; set up ES:BX memory address
    mov bx, 0x1000
    mov es, bx                  
    mov bx, 0x0

    ;; Set up disk read
    mov dh, 0x0
    mov dl, 0x0
    mov ch, 0x0
    mov cl, 0x02

read_disk:
    mov ah, 0x02
    mov al, 0x02
    int 0x13

    jc read_disk

    mov ax, 0x1000
    mov ds, ax
    mov es, ax
    mov fs, ax
    mov gs, ax
    mov ss, ax

    jmp 0x1000:0x0


    ;; Boot Sector magic
    times 510-($-$$) db 0
    
    dw 0xaa55