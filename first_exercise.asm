;MAKE SURE IF LOOKING UP INFO ON ASSEMBLY YOU ADD NASM TO IT!!!
;there's no libraries in assembly, you cant import anything.
;
; file: skel.asm
; This file is a skeleton that can be used to start assembly programs.

%include "asm_io.inc"
segment .data
;
; initialized data is put in the data segment here
;


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

;; playing and moving information around the main 32 bit register EAX

        ; dump_regs 1
        ; call print_nl   
        
        ; mov eax, 0ffffffffh
        
        ; dump_regs 2
        ; call print_nl

        ; mov ax, 0
        ; dump_regs 3
        ; call print_nl

        ; mov ah, 0AAh
        ; dump_regs 4
        ; call print_nl

        ; mov al, 0EEh
        ; dump_regs 5
        ; call print_nl

        ; mov eax, 0Ah
        ; dump_regs 1
        ; call print_nl

        ; add eax, 4
        ; dump_regs 2
        ; call print_nl

        ; mov ah, 5
        
        ; dump_regs 1
        ; call print_nl
        
        ; mov al, 7
        ; dump_regs 2
        ; call print_nl

        ; add al, ah
        ; dump_regs 3
        ; call print_nl

        ; mov eax, 0
        ; dump_regs 1
        ; call print_nl
        
        ; add eax, 40
        ; dump_regs 2
        ; call print_nl

        ; add eax, 2
        ; dump_regs 2
        ; call print_nl

        ;;
        ;;MOVing info into registers so we can store 16-4, then copying the value into another register and INC it.
        ;;

        
        mov eax, 0
        
        mov eax, 16
        dump_regs 1
        call print_nl
        
        sub eax, 4
        dump_regs 2 
        call print_nl
        
        mov ebx, eax
        dump_regs 3
        call print_nl
        
        inc ebx
        dump_regs 4
        call print_nl






        popa
        mov     eax, 0            ; return back to C
        leave                     
        ret


