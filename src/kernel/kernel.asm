;;;
;;; Loads Kernel
;;;

start:
    call set_video_mode
    call init_shell
    
;; End
end_program:
    cli
    hlt

;;Include Drivers
    include "include.asm"

;; Variables


;; Sector Padding magic
    times 1024-($-$$) db 0