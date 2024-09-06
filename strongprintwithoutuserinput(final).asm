.model small
.stack 100h
.data
    text db 'Hello, World!$', 0

.code

main proc
    mov ax, @data
    mov ds, ax

    mov ah, 9
    lea dx, text
    int 21h


    ; Terminate the program
exit:
    mov ah, 4Ch
    int 21h

main endp
end main
