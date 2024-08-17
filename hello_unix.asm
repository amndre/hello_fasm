; hello world in flat assembler
format ELF64 executable

; entrypoint -------------------------------------------------------------------
segment readable executable 

entry $                  ; $ evaluates to current memory offset 
    mov edx, msg_size    
    mov ecx, msg         ; transfers memory offset of the msg variable to ecx

    mov ebx, 1           ; STDOUT
    mov eax, 4           ; sys_write

    int 0x80             ; interrupt that makes the system call stored in the eax register
                         ; in this case it will call sys_write which writes the value stored in the ecx register
                         ; to the buffer stored in the ebx register (STDOUT)

    mov edi, 0           ; exit code 0
    mov eax, 60          ; sys_exit

    syscall              ; calls sys_exit with return 0

; data -------------------------------------------------------------------------
segment readable
    msg db 'Hello Unix!', 0xA ; 0xA = "\n"
    msg_size = $-msg          ; calculate length of msg 
