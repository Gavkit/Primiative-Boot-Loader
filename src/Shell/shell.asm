init_shell:
    mov si, shellString
    call print_string
    call new_line
    jmp get_input

restart_shell:
    call set_video_mode
    mov di, cmdString
    call print_shell
    jmp key_loop

get_input:
    call new_line
    mov di, cmdString
    call print_shell

key_loop:
    call read_keyboard
    cmp al, 0xd
    je run_command
    call print_char
    mov [di], al
    inc di
    jmp key_loop


run_command:
    mov byte [di], 0
    mov al, [cmdString]
    cmp al, 'R'
    je restart
    cmp al, 'r'
    je restart
    cmp al, 'H'
    je help
    cmp al, 'h'
    je help
    cmp al, 'C'
    je calculator
    cmp al, 'c'
    je calculator
    cmp al, 'P'
    je clear
    cmp al, 'p'
    je clear
    cmp al, 'G'
    je graphics_mode
    cmp al, 'g'
    je graphics_mode


    mov si, failureString
    call new_line
    call print_string
    jmp get_input

calculator:
    call new_line
    call calculator_start
    ret

clear:
    call clear_screen
    jmp get_input

graphics_mode:
    call enable_graphics_mode

help:
    call new_line
    mov si, helpString
    call print_string
    jmp get_input

restart:
    jmp 0xffff:0x0000


shellString: db 'Kernel Booted, Welcome to Orbis OS!', 0
failureString: db 'Wrong Command, Type "H" or "h" for help', 0
cmdString: db '', 0
placeholder: db 'Placeholder', 0
helpString: db 'Shell Commands', 0xa, 0xd, \
    '   R) Reboot', 0xa, 0xd, \
    '   H) Help', 0xa, 0xd, \
    '   C) Calculator', 0xa, 0xd, \
    '   P) Clear Screen', 0xa, 0xd, \
    '   G) Graphics Mode Test', 0