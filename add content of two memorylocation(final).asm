.model small
.stack 100h     

.data                           ;for variable declaration
num1 db 'input 1st digit:$'     ;define byte
num2 db  'input 2nd digit:$' 
result db  'result:$'       


.code                       ;code segment starts
main proc
    mov ax,@data            ;code segment connects with data segment
    mov ds,ax               ;have to store in ds register
    
    mov ah,9                ;string output
    lea dx,num1             ;load effective area
    int 21h
    
    mov ah,1           ; ah=1 simple char input fnc, 2=output, 9=string output
    int 21h            ;input function
    mov bl,al          ; by default it stores in al register
    
    mov ah,2           ;to output
    mov dl,10          ;to print newline
    int 21h            ;interrupt fnc call
    mov dl,13          ;carriage return
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
    mov dl,bl           ;output function , to output we use dl(data) register
    int 21h
    
    
    exit:
    mov ah,4ch
    int 21h
    main endp
end main