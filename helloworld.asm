;  Description: A simple "hello world" for Linux.

SECTION .data               ; Section containing initialized data

HelloWorld: db "Hello World!",10
HelloWorldLen: equ $-HelloWorld


SECTION .bss                ; Section containing uninitialized data

SECTION .text               ; Section containing code

global _start               ; Linker needs this to find the entry point

_start:
    nop                     ; This no-op keeps gdb happy
    mov eax,4               ; Specify sys_write syscall
    mov ebx,1               ; Specify File Descriptor 1: stdout
    mov ecx,HelloWorld      ; Pass offset of the message
    mov edx,HelloWorldLen   ; Pass the length of the message
    int 80H                 ; Make syscall to output the text to stdout

    mov eax,1               ; Specify exit syscall
    mov ebx,0               ; Return a code of zero
    int 80H                 ; Make syscall to terminate the program
