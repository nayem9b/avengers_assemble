.model small        ; Define a small memory model
.stack 100h         ; Reserve 256 bytes for the stack
.data
a db 'for AND :$'   ; Define string for AND operation output
b db 'for OR  :$'   ; Define string for OR operation output
c db 'for XOR :$'   ; Define string for XOR operation output
d db 'for NOT :$'   ; Define string for NOT operation output
.code
main proc
    ; Set up data segment
    mov ax, @data   ; Load the address of data segment into AX
    mov ds, ax      ; Move the content of AX into DS to set up data segment

    ; AND Operation
    and1:
    mov ah, 9       ; Function 9h (DOS interrupt for displaying a string)
    lea dx, a       ; Load the address of string 'a' into DX
    int 21h         ; Interrupt 21h to print string

    mov bl, 111b    ; Load binary 111 into BL
    and bl, 101b    ; Perform bitwise AND with 101b
    add bl, 48      ; Convert the result (0 or 1) into ASCII by adding 48

    mov ah, 2       ; Function 2h (DOS interrupt for printing a character)
    mov dl, bl      ; Load the result in DL
    int 21h         ; Interrupt 21h to print the character (result of AND)

    ; Print newline (CR + LF)
    mov ah, 2       ; Prepare for another character output
    mov dl, 10      ; ASCII code for newline (LF)
    int 21h         ; Print newline (LF)
    mov dl, 13      ; ASCII code for carriage return (CR)
    int 21h         ; Print carriage return (CR)

    ; OR Operation
    or1:
    mov ah, 9       ; Function 9h to display string
    lea dx, b       ; Load the address of string 'b' into DX
    int 21h         ; Interrupt 21h to print the string

    mov bl, 111b    ; Load binary 111 into BL
    or bl, 101b     ; Perform bitwise OR with 101b
    add bl, 48      ; Convert the result (0 or 1) into ASCII

    mov ah, 2       ; Prepare to print the result
    mov dl, bl      ; Load the result in DL
    int 21h         ; Interrupt 21h to print the character (result of OR)

    ; Print newline (CR + LF)
    mov ah, 2
    mov dl, 10      ; Newline (LF)
    int 21h
    mov dl, 13      ; Carriage return (CR)
    int 21h

    ; XOR Operation
    xor1:
    mov ah, 9       ; Function 9h to display string
    lea dx, c       ; Load the address of string 'c' into DX
    int 21h         ; Interrupt 21h to print the string

    mov bl, 111b    ; Load binary 111 into BL
    xor bl, 101b    ; Perform bitwise XOR with 101b
    add bl, 48      ; Convert the result (0 or 1) into ASCII

    mov ah, 2       ; Prepare to print the result
    mov dl, bl      ; Load the result in DL
    int 21h         ; Interrupt 21h to print the character (result of XOR)

    ; Print newline (CR + LF)
    mov ah, 2
    mov dl, 10      ; Newline (LF)
    int 21h
    mov dl, 13      ; Carriage return (CR)
    int 21h

    ; NOT Operation
    not1:
    mov ah, 9       ; Function 9h to display string
    lea dx, d       ; Load the address of string 'd' into DX
    int 21h         ; Interrupt 21h to print the string

    mov bl, 11000000b ; Load binary 11000000 into BL
    not bl            ; Perform bitwise NOT (invert all bits of BL)
    and bl, 00000011b ; Mask with 00000011b to isolate the last two bits
    add bl, 48        ; Convert the result (0 or 1) into ASCII

    mov ah, 2         ; Prepare to print the result
    mov dl, bl        ; Load the result in DL
    int 21h           ; Interrupt 21h to print the character (result of NOT)

    ; Exit program
    exit:
    mov ah, 4ch      ; Function 4Ch to exit program
    int 21h          ; Interrupt 21h to terminate the program
main endp
end main
