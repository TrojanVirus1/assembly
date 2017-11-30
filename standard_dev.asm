;
; file: standard_dev.asm
; final project, using the numbers.txt file that is in this repository,
; the final answer should be:   11.39795414
%include "asm_io.inc"
%include "defines.inc"
%define     n       dword[ebp + 12]
%define     array   dword[ebp + 8]
segment .bss
; declare a temporary value for the average

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
; remember that the value for the average is in st0
; you might want to consider moving the value into a temporary
;
        add     esp,8
        popa
        leave                     
        ret

segment .data
L1 db "%f",10,0
;
; write the code necessary to calculate the average
;
segment .bss
tmp resd 1

segment .text
        global  average
        extern  printf

average:
        enter   0,0               ; setup routine
        mov     esi,array        
        mov     ecx,n
        push    eax
        xor     edx,edx
        fldz    
;total the sum of the
forloop01:
        mov     eax,array
        lea     eax,[eax+DOUBLE_SIZE*edx]
        fadd    qword[eax]
        inc     edx
        loop    forloop01
end_forloop01:

        mov   [tmp],edx
        fidiv  dword[tmp]

        pop     eax
        leave                     
        ret

        ; the following will print out the value at the offset in the array
        ;push    ecx
        ;push    dword[eax+4]
        ;push    dword[eax]
        ;push    L1
        ;call    printf
        ;add     esp,12
        ;pop     ecx
