; hello world in flat assembler
format ELF64 executable

; entrypoint -------------------------------------------------------------------
segment readable executable 

entry $                  ; $ evaluates to current memory offset 
    mov edx, msg_size    
    lea rsi, [msg]       ; transfers memory offset of the msg variable to rsi
    mov edi, 1           ; STDOUT
    mov eax, 1           ; sys_write

    syscall              ; interrupt that makes the system call stored in the eax register
                         ; in this case it will call sys_writes which writes the value stored in the eax register
                         ; to the buffer stored in the edi register (sys_call

    mov edi, 0           ; exit code 0
    mov eax, 60          ; sys_exit

    syscall              ; calls sys_exit with return 0

; data ------------------------------------------------------------------------
segment readable
    msg db 'Hello Unix!', 0xA ; 0xA = "\n"
    msg_size = $-msg          ; calculate length of msg 
