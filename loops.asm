%include "asm_io.inc"
segment .data




rocket_message db "🚀!", 0

perfect_message db "PERFECT", 0
input db "Enter a number: ", 0

goat_message db "Fear the goat!", 0
char_prompt db "Enter a char: ", 0

segment .bss





segment .text
        global  asm_main
asm_main:
        enter   0,0               ; setup routine
        pusha





; ;; FOR LOOP
        
;         mov ecx, 5

; for:
;         mov eax, ecx
;         call print_int
;         call print_nl

;         loop for

; endfor:
;         mov eax, rocket_message
;         call print_string

;         mov eax, input
;         call read_int
;         call print_string




;; WHILE LOOP

        mov eax, input
        call print_string
        call read_int

while:

        mov ebx, eax
        dec ebx
        and eax, ebx

        jnz endwhile

        mov eax, perfect_message
        call print_string
        call print_nl
       
        mov eax, input
        call print_string
        call read_int

        jmp while

endwhile:


; ;; DO WHILE EXERCISE
; do:
        
;         mov eax, goat_message
;         call print_string

        
;         call print_nl
;         call print_nl
;         mov eax, char_prompt
;         call print_string
;         call print_nl
;         call read_char
        

;         mov ebx, eax
;         call read_char

;         cmp ebx, "!"
;         jne do


        



        popa
        mov     eax, 0            ; return back to C
        leave                     
        ret


