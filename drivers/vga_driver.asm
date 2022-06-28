ret


set_video_mode:
  mov ah, 0x00
  mov al, 0x01
  int 0x10

clear_screen:
    push ax
    mov ax, 0x0003
    int 0x10
    pop ax
    ret

print_char:
    push ax
    push bx
    push cx
    push dx
    push si 
    push di
    mov ah, 0x0e
    int 0x10
    pop di
    pop si
    pop dx
    pop cx
    pop bx
    pop ax
    ret

new_line:
    push ax
    mov ax, 0x0a
    call print_char
    mov al, 0x0d
    call print_char
    pop ax
    ret
