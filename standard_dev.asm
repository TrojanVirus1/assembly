;
; file: standard_dev.asm

%include "asm_io.inc"
%include "defines.inc"
%define     n       dword[ebp + 12]
%define     array   dword[ebp + 8]

;
; code is put in the .text segment
;
segment .text
        global  standard_dev
        extern  printf

standard_dev:
        enter   0,0               ; setup routine
        pusha
        ; Calculate the average first
        push    n
        push    array
        call    average
        add     esp,8
        popa
        leave                     
        ret

segment .data
L1 db "%f",10,0
some_value dq 42.42
;
; write the code necessary to calculate the average
;
segment .text
        global  average
        extern  printf

average:
        enter   0,0               ; setup routine
        push    eax
        mov     eax,array        
        mov     ecx,n
        push    eax
        xor     esi,esi
forloop01:
        mov     eax,array
        lea     eax,[eax+DOUBLE_SIZE*esi]
        ; the following will print out the value in the array, use this 
        ; to iterate and calculate the average
        ;push    ecx
        ;push    dword[eax+4]
        ;push    dword[eax]
        ;push    L1
        ;call    printf
        ;add     esp,12
        ;pop     ecx
        inc     esi
        loop    forloop01
end_forloop01:
        pop     eax

        fld     qword[some_value]

        pop     eax
        leave                     
        ret
