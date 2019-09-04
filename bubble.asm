.model small
.data
        array dw 1520 , 2100 , 4500 , 1300

.code
        mov array, @data
        mov DS, array
        mov DX, 04
        dec DX

outer : mov CX, DX
        mov SI, offset array

again : mov AX,[SI]
        cmp AX,[SI+2]

        jbe l1
        xchg AX,[SI+2]
        xchg AX, [SI]

l1 :    inc SI
        inc SI
        dec CX
        jnz again
        dec DX
        jnz outer

        mov ah, 4ch
        int 21h

End
