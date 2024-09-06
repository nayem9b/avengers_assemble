.model small
.stack 100h

.data   
    
    num1 db 11111b ; binary 1111 (decimal 15)
    num2 db 10110b ; binary 1011 (decimal 11)
    
.code   

main proc
    mov ax, @data
    mov ds, ax   
    

    ; Addition
    mov al, num2
    mov bl, num1
    add bl, al  ;bl=bl+al
    
    mov cx, 8
print_addition: 
    mov ah, 2   ; print function.
    mov dl, '0'
    test bl, 10000000b  ; test first bit.
    jz zero_addition
    mov dl, '1'
zero_addition:  
    int 21h
    shl bl, 1
loop print_addition

    ; Print binary suffix for addition result:
    mov dl, 'b'
    int 21h

    ; New line
    mov dl, 0Dh ; Carriage return
    int 21h
    mov dl, 0Ah ; Line feed
    int 21h

    ; Subtraction
    mov al, num2
    mov bl, num1
    sub bl, al

    mov cx, 8
print_subtraction: 
    mov ah, 2   ; print function.
    mov dl, '0'
    test bl, 10000000b  ; test first bit.
    jz zero_subtraction
    mov dl, '1'
zero_subtraction:  
    int 21h
    shl bl, 1
loop print_subtraction

    ; Print binary suffix for subtraction result:
    mov dl, 'b'
    int 21h

    ; Exit program
    mov ah, 4Ch     ; DOS function to terminate program
    int 21h         ; Call DOS interrupt
main endp

end main