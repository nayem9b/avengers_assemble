.model small
.stack 100h      ; Define the stack size

.data                           ; Data segment starts here, for variable declarations
num1 db 'input 1st digit:$'      ; String to prompt input for the 1st digit
num2 db 'input 2nd digit:$'      ; String to prompt input for the 2nd digit
result db  'result:$'            ; String to show the result

.code                            ; Code segment starts here
main proc
    mov ax, @data                ; Initialize the data segment, load data segment address into AX
    mov ds, ax                   ; Move the data segment address into DS register

    mov ah, 9                    ; AH=9 for string output
    lea dx, num1                 ; Load effective address of num1 into DX
    int 21h                      ; DOS interrupt to print string

    mov ah, 1                    ; AH=1 for single character input function
    int 21h                      ; Interrupt 21h to take user input
    mov bl, al                   ; Store the input character from AL into BL register

    mov ah, 2                    ; AH=2 for character output function
    mov dl, 10                   ; Load DL with ASCII newline character (line feed)
    int 21h                      ; Interrupt 21h to output the newline
    mov dl, 13                   ; Load DL with ASCII carriage return
    int 21h                      ; Interrupt 21h to output the carriage return

    mov ah, 9                    ; AH=9 for string output
    lea dx, num2                 ; Load effective address of num2 into DX
    int 21h                      ; DOS interrupt to print string

    mov ah, 1                    ; AH=1 for single character input function
    int 21h                      ; Interrupt 21h to take user input
    mov bh, al                   ; Store the input character from AL into BH register

    mov ah, 2                    ; AH=2 for character output function
    mov dl, 10                   ; Load DL with ASCII newline character (line feed)
    int 21h                      ; Interrupt 21h to output the newline
    mov dl, 13                   ; Load DL with ASCII carriage return
    int 21h                      ; Interrupt 21h to output the carriage return

    mov ah, 9                    ; AH=9 for string output
    lea dx, result               ; Load effective address of result string into DX
    int 21h                      ; DOS interrupt to print the result prompt

    add bl, bh                   ; Add the values of BL and BH (the two input digits)
    sub bl, 48                   ; Convert ASCII to integer (subtract 48 because ASCII '0' is 48)

    mov ah, 2                    ; AH=2 for character output function
    mov dl, bl                   ; Move the result from BL into DL for output
    int 21h                      ; Interrupt 21h to output the result

exit:
    mov ah, 4Ch                  ; AH=4Ch for program termination
    int 21h                      ; Interrupt 21h to exit the program
main endp
end main
