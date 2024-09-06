.model small
.stack 100h
.data
    asciiDigit db 'A'          
    resultStr db 'Result: $'   
    numberStr db '   $'        

.code
main proc

    mov ax, @data
    mov ds, ax


    mov al, asciiDigit         


    mov bl, al


    mov ah, 0                  
    mov cl, 10                 
    div cl                     


    add al, '0'                
    mov numberStr[0], al      


    mov al, ah                 
    add al, '0'                
    mov numberStr[1], al       


    mov ah, 09h                
    lea dx, resultStr          
    int 21h                    


    lea dx, numberStr  
    int 21h 
    
end:                   
    mov ah, 4Ch                
    int 21h                    

main endp
end main
