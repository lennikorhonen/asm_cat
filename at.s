.section .data
    fname: .asciz "test"

.section .text
    .global _start
    .intel_syntax noprefix

/* TODO
- [ ] Specify file as option, eg. `cat test`
- [ ] Reserve buffer space according to file size
*/

_start:
        # sys_open open the file
        mov rax, 2
        lea rdi, [rip + fname]
        mov rsi, 0
        mov rdx, 0
        syscall
        
        push rax # push file descriptor onto stack
        sub rsp, 30 # reserve 30 bytes of memory

        # sys_read read file content from opened file
        mov rax, 0 # read, could also xor rax with itself, which is apparently more efficient
        mov rdi, [rsp + 30] # file descriptor
        mov rsi, rsp # buffer address
        mov rdx, 30 # buffer size
        syscall

        # sys_write read file to std_out
        mov rdx, rax # number of bytes
        mov rax, 1
        mov rdi, 1
        mov rsi, rsp
        syscall

        # sys_close close opened file
        mov rax, 3
        syscall

        # sys_exit
        mov rax, 60
        mov rdi, 0
        syscall

