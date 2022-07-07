calculator_start:
    call clear_screen
    mov si, startString
    call print_string
    call new_line
    mov si, enterDigit
    call print_string
    call new_line
    call cal_start
    jmp l1

l1:
    call read_keyboard
    cmp al, '1'
    je continue1
    cmp al, '2'
    je continue1
    cmp al, '3'
    je continue1
    cmp al, '4'
    je continue1
    cmp al, '5'
    je continue1
    cmp al, '6'
    je continue1
    cmp al, '7'
    je continue1
    cmp al, '8'
    je continue1
    cmp al, '9'
    je continue1
    cmp al, '0'
    je continue1
    jmp l1

continue1:
    call print_char
    call new_line
    mov cl, al
    mov si, digit1
    call print_string
    mov al, cl
    call print_char
    call new_line
    call cal_start
    jmp l2

l2:
    call read_keyboard
    cmp al, '1'
    je continue2
    cmp al, '2'
    je continue2
    cmp al, '3'
    je continue2
    cmp al, '4'
    je continue2
    cmp al, '5'
    je continue2
    cmp al, '6'
    je continue2
    cmp al, '7'
    je continue2
    cmp al, '8'
    je continue2
    cmp al, '9'
    je continue2
    cmp al, '0'
    je continue2
    jmp l2

continue2:
    call print_char
    call new_line
    mov dl, al
    mov si, digit2
    call print_string
    mov al, dl
    call print_char
    call new_line
    jmp add1

add1:
    mov al, cl
    call print_char
    mov si, ad
    call print_string
    mov al, dl
    call print_char
    mov si, equal
    call print_string
    sub cl, 48
    sub dl, 48
    add cl, dl
    add cl, 48
    mov al, cl
    call print_char
    jmp exit
    
exit:
    call new_line
    mov si, exitString
    call print_string
    call new_line
    call read_keyboard
    call restart_shell

cal_start:
    mov si, calStart
    call print_string
    ret

;; Variables
startString: db 'Starting Calculator!', 0
digit1: db 'Digit One: ', 0
digit2: db 'Digit Two: ', 0
enterDigit: db 'Please Enter Any Digit!', 0
ad: db ' + ', 0
equal: db ' = ', 0
exitString: db 'Press Any Key To Return To The Shell!', 0
calStart: db '>$ ', 0
    