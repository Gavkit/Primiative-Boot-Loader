;;;
;;; Everything Related To The Screen
;;;

;; Sets The Video Mode
set_video_mode:
  mov ah, 0x00
  mov al, 0x03
  int 0x10
  ret

enable_graphics_mode:
  mov ah, 0x00
  mov al, 0x12
  int 0x10
  
  call read_keyboard
  call set_video_mode
  call restart_shell

;; Changes The Termial Background Color
change_color:
  mov ah, 0x0b
  mov bh, 0x00
  int 0x10
  ret

;; Clears The Screen
clear_screen:
  push ax
  mov ax, 0x0003
  int 0x10
  pop ax
  ret

;; Prints a Singular Char
print_char:
  pusha
  mov ah, 0x0e
  int 0x10
  popa
  ret

;; Prints a New Line
new_line:
  push ax
  mov ax, 0x0a
  call print_char
  mov al, 0x0d
  call print_char
  pop ax
  ret

;; Prints a Line Of Chars
print_string:
  mov al, [si]
  cmp al, 0x00
  je end_print
  call print_char
  inc si
  jmp print_string

end_print:
  ret




