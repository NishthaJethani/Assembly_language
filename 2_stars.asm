section .text
    global _start   ;must be declared for linker
    
_start:             ;tells linker the entry point
    mov edx, len    ;length of message
    mov ecx, msg    ;message to be printed
    mov ebx, 1      ;file descriptor(stdout)
    mov eax, 4      ;system call numer (sys_write)
    int 0x80        ;call kernel
    
    mov edx, 9
    mov ecx, s
    mov ebx, 1
    mov eax, 4
    int 0x80
    
    mov eax, 1      ;system call number (sys_exit)
    int 0x80        ;call kernel
    
section .data
msg db "Displaying 9 stars", 0xa   ;string to be printed
len equ $-msg               ;length, $ represents current position
s times 9 db "*"
