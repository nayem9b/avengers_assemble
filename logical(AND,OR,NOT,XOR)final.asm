.model small
.stack 100h
.data
a db 'for AND :$'
b db 'for OR  :$'
c db 'for XOR :$'
d db 'for NOT :$'
.code
main proc
    mov ax, @data
    mov ds, ax
    
    ; AND Operation
    and1:
    mov ah, 9
    lea dx, a
    int 21h
    
    mov bl, 111b
    and bl, 101b
    add bl, 48  ; Convert the result to ASCII (only works if result is 0 or 1)
    
    mov ah, 2
    mov dl, bl
    int 21h   
    
    
    mov ah,2
    mov dl,10
    int 21h
    mov dl,13
    int 21h
    
    ; OR Operation
    or1:
    mov ah, 9
    lea dx, b
    int 21h
    
    mov bl, 111b
    or bl, 101b
    add bl, 48  ; Convert the result to ASCII (only works if result is 0 or 1) 
    
    
    mov ah, 2
    mov dl, bl
    int 21h     
    
    mov ah,2
    mov dl,10
    int 21h
    mov dl,13
    int 21h
    
    ; XOR Operation
    xor1:
    mov ah, 9
    lea dx, c
    int 21h
    
    
    
    
    mov bl, 111b
    xor bl, 101b
    add bl, 48  ; Convert the result to ASCII (only works if result is 0 or 1)
    
    mov ah, 2
    mov dl, bl
    int 21h 
    
      
    mov ah,2
    mov dl,10
    int 21h
    mov dl,13
    int 21h   

    
    
    ; NOT Operation
    not1:
    mov ah, 9
    lea dx, d
    int 21h
    
    mov bl, 11000000b
    not bl            ; Perform the NOT operation (negates the entire register)
    and bl, 00000011b ; Mask to get the last two bits (since BL is 8 bits wide)
    add bl, 48        ; Convert to ASCII
    
    mov ah, 2
    mov dl, bl
    int 21h
    
    exit:
    mov ah, 4ch
    int 21h
main endp
end main
