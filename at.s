.section .text
    .global _start
    .intel_syntax noprefix

/* TODO
- [x] Specify file as option, eg. `cat test`
- [ ] Reserve buffer space according to file size
*/

_start:
        /*  This gets argc, which stores the number of arguments
            At the moment not used for anything so
            just pop it out of stack to rdi
        */
        pop rdi

        /* C
        if (rax < 2) {
            return 0;
        }
        */
        cmp rdi, 2 # check that arguments are given, doesn't care for extra arguments
        jl exit # conditional jump, jumps if rax is less than 2

        pop rdi # remove program name from stack and put it into register
        pop rdi # replace program name with argument

        # sys_open open the file
        # argument already loaded into rdi, so no need to load it there again
        mov rax, 2
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
        jmp exit

exit:
    mov rax, 60
    mov rdi, 0
    syscall

