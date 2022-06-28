bits 16

start:
  call set_video_mode
  call clear_screen
  mov al, 'P'
  call print_char
  mov al, 'l'
  call print_char
  mov al, 'e'
  call print_char
  mov al, 'a'
  call print_char
  mov al, 's'
  call print_char
  mov al, 'e'
  call print_char
  mov al, ' '
  call print_char
  mov al, 'I'
  call print_char
  mov al, 'n'
  call print_char
  mov al, 'p'
  call print_char
  mov al, 'u'
  call print_char
  mov al, 't'
  call print_char
  mov al, ' '
  call print_char
  mov al, 'A'
  call print_char
  mov al, 'n'
  call print_char
  mov al, 'y'
  call print_char
  mov al, ' '
  call print_char
  mov al, 'D'
  call print_char
  mov al, 'i'
  call print_char
  mov al, 'g'
  call print_char
  mov al, 'i'
  call print_char
  mov al, 't'
  call print_char
  mov al, '!'
  call print_char
l1:
  call new_line
  mov al, '>'
  call print_char
  mov al, ' '
  call print_char
  call read_keyboard
  call print_char
  cmp al, '1'
  mov cl, al
  cmp al, '2'
  mov cl, al
  cmp al, '3'
  mov cl, al
  cmp al, '4'
  mov cl, al
  cmp al, '5'
  mov cl, al
  cmp al, '6'
  mov cl, al
  cmp al, '7'
  mov cl, al
  cmp al, '8'
  mov cl, al
  cmp al, '9'
  mov cl, al
  cmp al, '0'
  mov cl, al
  mov al, '1'
  cmp al, '1'
  jne l1
  call new_line
  mov al, '1'
  call print_char
  mov al, 's'
  call print_char
  mov al, 't'
  call print_char
  mov al, ' '
  call print_char
  mov al, 'D'
  call print_char
  mov al, 'i'
  call print_char
  mov al, 'g'
  call print_char
  mov al, 'i'
  call print_char
  mov al, 't'
  call print_char
  mov al, ':'
  call print_char
  mov al, ' '
  call print_char
  mov al, cl
  call print_char
call new_line
call new_line
 mov al, 'P'
  call print_char
  mov al, 'l'
  call print_char
  mov al, 'e'
  call print_char
  mov al, 'a'
  call print_char
  mov al, 's'
  call print_char
  mov al, 'e'
  call print_char
  mov al, ' '
  call print_char
  mov al, 'I'
  call print_char
  mov al, 'n'
  call print_char
  mov al, 'p'
  call print_char
  mov al, 'u'
  call print_char
  mov al, 't'
  call print_char
  mov al, ' '
  call print_char
  mov al, 'A'
  call print_char
  mov al, 'n'
  call print_char
  mov al, 'y'
  call print_char
  mov al, ' '
  call print_char
  mov al, 'D'
  call print_char
  mov al, 'i'
  call print_char
  mov al, 'g'
  call print_char
  mov al, 'i'
  call print_char
  mov al, 't'
  call print_char
  mov al, '!'
  call print_char
l2:
  call new_line
  mov al, '>'
  call print_char
  mov al, ' '
  call print_char
  call read_keyboard
  call print_char
  cmp al, '1'
  mov dl, al
  cmp al, '2'
  mov dl, al
  cmp al, '3'
  mov dl, al
  cmp al, '4'
  mov dl, al
  cmp al, '5'
  mov dl, al
  cmp al, '6'
  mov dl, al
  cmp al, '7'
  mov dl, al
  cmp al, '8'
  mov dl, al
  cmp al, '9'
  mov dl, al
  cmp al, '0'
  mov dl, al
  mov al, '1'
  cmp al, '1'
  jne l2
  call new_line
  mov al, '2'
  call print_char
  mov al, 'n'
  call print_char
  mov al, 'd'
  call print_char
  mov al, ' '
  call print_char
  mov al, 'D'
  call print_char
  mov al, 'i'
  call print_char
  mov al, 'g'
  call print_char
  mov al, 'i'
  call print_char
  mov al, 't'
  call print_char
  mov al, ':'
  call print_char
  mov al, ' '
  call print_char
  mov al, dl
  call print_char
  call new_line
end:
  call new_line
  mov al, cl
  call print_char
  mov al, ' '
  call print_char
  mov al, '+'
  call print_char
  mov al, ' '
  call print_char
  mov al, dl
  call print_char
  mov al, ' '
  call print_char
  mov al, '='
  call print_char
  mov al, ' '
  call print_char
  sub cl, 48
  sub dl, 48
  add cl, dl
  add cl, 48
  mov al, cl
  call print_char

jmp $
%include "drivers/vga_driver.asm"
%include "drivers/keyboard_driver.asm"

times 1024-($-$$) db 0