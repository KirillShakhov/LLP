section .data
codes:
    db      '0123456789ABCDEF'

section .text

extern print_hex
global _start

exit:
    mov     rax, 60         ;  Это функция
    xor     rdi, rdi           ;  Это функция
    syscall

_start:
   mov rdi, 0x32321
   push rdi
   call print_hex
   call exit