.model small
.stack 100h
.data
    message db 'Enter a string: $ '
    msg db 30, ?, 30 dup('$') 

.code

main proc
    mov ax, @data
    mov ds, ax
    

    mov ah, 9
    lea dx, message
    int 21h  
    
    mov ah, 2
    mov dl, 10

    int 21h
    mov dl, 13
    int 21h 
    

    mov ah, 0Ah
    lea dx, msg
    int 21h
 
    mov dl, 13
    mov ah, 2
    int 21h
    mov dl, 10
    int 21h
    

    mov ah, 9
    lea dx, msg + 2
    int 21h

exit:
    mov ah, 4Ch
    int 21h

main endp
end main
