.model small
.stack 100h  
.data 
a db "Enter an alphabet: $"
b db "Alphabet after case conversion is : $"
.code

main proc 
    
    mov ax,@data
    mov ds,ax   
    
    mov ah,9
    lea dx,a
    int 21h
    
    mov ah,1
    int 21h
    mov bl,al 
    
    ; Convert to uppercase if lowercase
    cmp bl, 'a'
    jb check_uppercase
    cmp bl, 'z'
    ja check_uppercase
    sub bl, 32   ;substruction operation
    jmp display
    
check_uppercase:
    ; Convert to lowercase if uppercase
    cmp bl, 'A'
    jb display
    cmp bl, 'Z'
    ja display
    add bl, 32
    
display:
    mov ah, 2
    mov dl, 10
    int 21h
    mov dl, 13
    int 21h     
             
    
    mov ah,9
    lea dx,b
    int 21h
    
    mov ah,2
    mov dl,bl
    int 21h
    
    exit:
    mov ah,4ch
    int 21h
    main endp
end main
