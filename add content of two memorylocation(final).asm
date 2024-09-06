.model small
.stack 100h     

.data
num1 db 'input 1st digit:$'
num2 db  'input 2nd digit:$'
result db  'result:$'       


.code
main proc
    mov ax,@data
    mov ds,ax
    
    mov ah,9
    lea dx,num1
    int 21h
    
    mov ah,1
    int 21h
    mov bl,al 
    
    mov ah,2
    mov dl,10
    int 21h
    mov dl,13
    int 21h
    
    
    mov ah,9
    lea dx,num2
    int 21h
    
    mov ah,1
    int 21h
    mov bh,al 

    mov ah,2
    mov dl,10
    int 21h
    mov dl,13
    int 21h
    
    mov ah,9
    lea dx,result
    int 21h
    
    add bl,bh
    sub bl,48  


    
    mov ah,2 
    mov dl,bl
    int 21h
    
    
    exit:
    mov ah,4ch
    int 21h
    main endp
end main