.model small
.stack 100h
.code

main proc
    mov ah, 1       ; Read character into AL
    int 21h
    mov bl, al      ; Move input character into BL
    sub bl, 17      ; Subtract 17 from BL

    mov ah, 2       ; Output character
    mov dl, 10      ; Newline (Line feed)
    int 21h
    mov dl, 13      ; Carriage return
    int 21h

    mov ah, 2       ; Output character
    mov dl, 49      ; ASCII '1'
    int 21h

    mov ah, 2       ; Output character
    mov dl, bl      ; Output modified BL
    int 21h

exit:
    mov ah, 4Ch     ; Terminate program
    int 21h
main endp
end main
