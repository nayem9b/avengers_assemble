.model small
.stack 100h
.data
    asciiDigit db 'A'           ; Define a byte holding the ASCII character 'A' (which is 65 in decimal)
    resultStr db 'Result: $'    ; String for result output, the $ marks the end for string output in DOS
    numberStr db '   $'         ; Space for two characters plus the string terminator '$'

.code
main proc

    mov ax, @data               ; Initialize the data segment
    mov ds, ax                  ; Move data segment address into DS

    mov al, asciiDigit           ; Load the ASCII value of 'A' (65) into AL register

    mov bl, al                  ; Copy the value from AL to BL, preserving it for later use

    mov ah, 0                   ; Clear AH, preparing AL for division (AX will hold the value to be divided)
    mov cl, 10                  ; Load 10 into CL (we're going to divide the ASCII value by 10)
    div cl                      ; Divide AX (which contains 65) by 10, quotient goes to AL, remainder to AH
                                ; AL = 6 (quotient), AH = 5 (remainder)

    add al, '0'                 ; Convert the quotient to its ASCII value (6 + '0' = ASCII '6')
    mov numberStr[0], al        ; Store the ASCII '6' in the first position of the numberStr

    mov al, ah                  ; Move the remainder (AH = 5) into AL
    add al, '0'                 ; Convert the remainder to its ASCII value (5 + '0' = ASCII '5')
    mov numberStr[1], al        ; Store the ASCII '5' in the second position of the numberStr

    mov ah, 09h                 ; AH=09h, DOS interrupt for string output
    lea dx, resultStr           ; Load the effective address of resultStr into DX
    int 21h                     ; Call DOS interrupt to output the result string

    lea dx, numberStr           ; Load the effective address of numberStr into DX
    int 21h                     ; Call DOS interrupt to output the computed two-digit result

end:                   
    mov ah, 4Ch                 ; AH=4Ch, DOS interrupt for program termination
    int 21h                     ; Call DOS interrupt to terminate the program

main endp
end main
