%include "asm_io.inc"
%include "defines.inc"
;
; This c callable function will create an array of the given size
;
;


segment .data
memory_failure db 10,"Failure to allocate memory",10,"-------------",10,0
L1 db 10,"memory allocated %d",10,"-------------",10,0

segment .bss

%define n dword[ebp + 8]

segment .text
    global  get_array
	extern  malloc
    extern  printf

get_array:
    enter   0,0
	push    ebx

	mov     eax,n 		; size of the array
	mov 	ebx,DOUBLE_SIZE
	mul 	ebx
	push    eax
	call    malloc			; call the system malloc function
	test    eax,eax
	jz   	fail_exit
	add     esp,4			; clean up the stack

done:
    pop     ebx
    leave                     
    ret

fail_exit:
	push dword memory_failure
	call printf
	add  esp,8
	jmp  done
