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


.model small
.stack 100h

.data
    num1 db 11111b         ; Binary: 11111 (decimal 31)
    num2 db 10110b         ; Binary: 10110 (decimal 22)
    
.code

main proc
    ; Initialize data segment
    mov ax, @data
    mov ds, ax   

    ; --------------------------
    ; Binary Addition
    ; --------------------------
    mov al, num2           ; Load num2 (10110b) into AL
    mov bl, num1           ; Load num1 (11111b) into BL
    add bl, al             ; Add AL and BL, store result in BL
    
    mov cx, 8              ; Prepare to print 8 bits (binary format)
print_addition: 
    mov ah, 2              ; DOS function to print character
    mov dl, '0'            ; Default character is '0'
    test bl, 10000000b      ; Test the leftmost (MSB) bit
    jz zero_addition        ; If zero, skip setting DL to '1'
    mov dl, '1'            ; Set DL to '1' if MSB is set
zero_addition:  
    int 21h                ; Print the character (either '0' or '1')
    shl bl, 1              ; Shift BL left to check the next bit
loop print_addition         ; Repeat until all 8 bits are printed

    ; Print binary suffix to indicate binary number
    mov dl, 'b'            ; Print the 'b' suffix
    int 21h                ; Call DOS interrupt

    ; New line after binary addition result
    mov dl, 0Dh            ; Carriage return (to move to the beginning of the next line)
    int 21h                ; DOS interrupt for carriage return
    mov dl, 0Ah            ; Line feed (to move to the next line)
    int 21h                ; DOS interrupt for line feed

    ; --------------------------
    ; Binary Subtraction
    ; --------------------------
    mov al, num2           ; Load num2 (10110b) into AL
    mov bl, num1           ; Load num1 (11111b) into BL
    sub bl, al             ; Subtract AL from BL, store result in BL

    mov cx, 8              ; Prepare to print 8 bits (binary format)
print_subtraction: 
    mov ah, 2              ; DOS function to print character
    mov dl, '0'            ; Default character is '0'
    test bl, 10000000b      ; Test the leftmost (MSB) bit
    jz zero_subtraction     ; If zero, skip setting DL to '1'
    mov dl, '1'            ; Set DL to '1' if MSB is set
zero_subtraction:  
    int 21h                ; Print the character (either '0' or '1')
    shl bl, 1              ; Shift BL left to check the next bit
loop print_subtraction      ; Repeat until all 8 bits are printed

    ; Print binary suffix to indicate binary number
    mov dl, 'b'            ; Print the 'b' suffix
    int 21h                ; Call DOS interrupt

    ; --------------------------
    ; Exit the program
    ; --------------------------
    mov ah, 4Ch            ; DOS function to terminate program
    int 21h                ; Call DOS interrupt to exit
main endp

end main
