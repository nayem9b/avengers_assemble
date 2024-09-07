.model small             ; Use the small memory model
.stack 100h              ; Allocate 256 bytes for the stack
.data 
a db "Enter an alphabet: $" ; String to prompt the user for input
b db "Alphabet after case conversion is : $" ; String to display the result

.code
main proc 

    ; Initialize the data segment
    mov ax, @data        ; Load the address of the data segment into AX
    mov ds, ax           ; Set DS to point to the data segment
    
    ; Prompt the user for input
    mov ah, 9            ; DOS interrupt function 9h (display string)
    lea dx, a            ; Load address of string 'a' into DX
    int 21h              ; Interrupt 21h to print the string
    
    ; Get a single character from the user
    mov ah, 1            ; DOS interrupt function 1h (read a character)
    int 21h              ; Interrupt 21h to read character from the keyboard
    mov bl, al           ; Store the input character in BL for further processing
    
    ; Convert to uppercase if it's a lowercase letter
    cmp bl, 'a'          ; Compare BL with ASCII value of 'a'
    jb check_uppercase   ; If BL is below 'a', it's not lowercase, jump to uppercase check
    cmp bl, 'z'          ; Compare BL with ASCII value of 'z'
    ja check_uppercase   ; If BL is above 'z', it's not lowercase, jump to uppercase check
    sub bl, 32           ; If it's between 'a' and 'z', subtract 32 to convert to uppercase
    jmp display          ; Jump to the display section after conversion

check_uppercase:
    ; Convert to lowercase if it's an uppercase letter
    cmp bl, 'A'          ; Compare BL with ASCII value of 'A'
    jb display           ; If BL is below 'A', it's not uppercase, jump to display
    cmp bl, 'Z'          ; Compare BL with ASCII value of 'Z'
    ja display           ; If BL is above 'Z', it's not uppercase, jump to display
    add bl, 32           ; If it's between 'A' and 'Z', add 32 to convert to lowercase

display:
    ; Print a newline (CR + LF) to format output
    mov ah, 2            ; DOS interrupt function 2h (print a character)
    mov dl, 10           ; Line feed (LF)
    int 21h              ; Interrupt 21h to print LF
    mov dl, 13           ; Carriage return (CR)
    int 21h              ; Interrupt 21h to print CR
    
    ; Display the result message
    mov ah, 9            ; DOS interrupt function 9h (display string)
    lea dx, b            ; Load address of string 'b' into DX
    int 21h              ; Interrupt 21h to print the string

    ; Display the converted character
    mov ah, 2            ; DOS interrupt function 2h (print a character)
    mov dl, bl           ; Load the converted character from BL into DL
    int 21h              ; Interrupt 21h to print the character
    
    ; Exit the program
    exit:
    mov ah, 4ch          ; DOS interrupt function 4Ch (terminate program)
    int 21h              ; Interrupt 21h to terminate the program

main endp
end main
