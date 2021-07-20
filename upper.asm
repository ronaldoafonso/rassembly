; Description: Upper case letters read from stdin.
;
;                 1) Read characters from stdin.
;                 2) Uppercase them.
;                 3) Write them to stdout.

section .data

section .bss
    BufferLen equ 1024
    Buff:     resb BufferLen

section .text

global _start

_start:
    nop

Read:
    mov eax,3           ; Specify sys_read call
    mov ebx,0           ; Specify File Descriptor 0: Standard Input
    mov ecx,Buff        ; Pass offset of the buffer to read to
    mov edx,BufferLen   ; Pass number of bytes to read at one pass
    int 80h             ; Call sys_read to fill the buffer
    mov esi,eax         ; Copy sys_read return value for safekeeping
    cmp eax,0           ; If eax=0, sys_read reached EOF on stdin
    je Exit             ; Jump If Equal (to 0, from compare)

    mov ecx,esi         ; Place the number of bytes read into ecx
    mov ebp,Buff        ; Place address of buffer into ebp
    dec ebp             ; Adjust count to offset

Scan:
    cmp byte [ebp+ecx],61h  ; Test input char against lowercase 'a’
    jb Next                 ; If below 'a’ in ASCII, not lowercase
    cmp byte [ebp+ecx],7Ah  ; Test input char against lowercase 'z’
    ja Next                 ; If above 'z’ in ASCII, not lowercase;
                            ;At this point, we have a lowercase char
    sub byte [ebp+ecx],20h  ; Subtract 20h to give uppercase...

Next:
    dec ecx             ; Decrement counter
    jnz Scan            ; If characters remain, loop back

Write:
    mov eax,4           ; Specify sys_write call
    mov ebx,1           ; Specify File Descriptor 1: Standard output
    mov ecx,Buff        ; Pass offset of the buffer
    mov edx,esi         ; Pass the # of bytes of data in the buffer
    int 80h             ; Make sys_write kernel call
    jmp Read            ; Loop back and load another buffer full

Exit:
    mov eax,1           ; Specify exit syscall
    mov ebx,0           ; Return a code of zero
    int 80H             ; Make syscall to terminate the program
