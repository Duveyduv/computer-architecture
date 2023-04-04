

;
; file: skel.asm
; This file is a skeleton that can be used to start assembly programs.

%include "asm_io.inc"
segment .data




segment .bss



 

segment .text
        global  asm_main
asm_main:
        enter   0,0               ; setup routine
        pusha

        push 1
        call fib
        pop ecx

        call print_int


        popa
        mov     eax, 0            ; return back to C
        leave                     
        ret

fib:
        enter 4,0
        
        mov eax, [ebp + 8]
        cmp eax, 0
        je zero_case

        cmp eax, 1
        je ones_case


        


       
        
zero_case:
        mov eax, 0
        jmp end
        

ones_case:
        mov eax, 1
        jmp end


end:
        leave
        ret

        
        
        
        

