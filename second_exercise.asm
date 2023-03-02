

;
; file: skel.asm
; This file is a skeleton that can be used to start assembly programs.

%include "asm_io.inc"
segment .data
;
; initialized data is put in the data segment here
;
; character db 77
; integer dd 255
; string db "Hello World 🤓", 0


; myName dd 66

hellow db "Hello World", 0





segment .bss
;
; uninitialized data is put in the bss segment
;


 

segment .text
        global  asm_main
asm_main:
        enter   0,0               ; setup routine
        pusha

;
; code is put in the text segment. Do not modify the code before
; or after this comment.
;

        ; mov eax, [integer]
        ; call print_nl
        ; call print_int

        ; mov eax, string
        ; call print_nl
        ; call print_string

        ; mov eax, [myName] ; moving into EAX, calling the label myName and deferencing the memory address.
        ; call print_char ; printing ASCII value.
        ; call print_nl ; newline.
        ; call print_int ; prints the value as an integer.
        ; call print_nl ; newline.

        mov eax, hellow ; moving into EAX and putting our labeled string into memory.
        call print_string ; printing EAX's string.
        call print_nl ; newline.
        dump_mem 1, hellow, 0 ; setting dump_mem to it's fist call.
        
        

        popa
        mov     eax, 0            ; return back to C
        leave                     
        ret


