;;;
;;; Everything Related To The Keyboard And User Input
;;;
print_shell:
    mov si, shellStarter
    call print_string
    ret

read_keyboard:
    mov ax, 0x00
    int 0x16
    ret

;; Variables
shellStarter: db '[root@orbis]$ ', 0