

;
; file: skel.asm
; This file is a skeleton that can be used to start assembly programs.

%include "asm_io.inc"
segment .data

;; SETUP ;;

prompt1 db "How many square feet of wall are you painting? ", 0
prompt2 db "How much does a gallon of paint cost? ", 0

;; SETUP ;;

prompt3 db "Gallons of paint: ", 0
prompt4 db "Hours of labor: ", 0
prompt5 db "Cost of paint: ", 0
prompt6 db "Cost of labor: ", 0
prompt7 db "Total cost: ", 0

;; PROMPTS FOR OUTPUT ;;

segment .bss

;; VALUES TO STORE OUR DATA INTO ;;

total_gallons resd 1 
square_footage resd 1
paint_cost resd 1
hours resd 1
total resd 1


 

segment .text
        global  asm_main
asm_main:
        enter   0,0                     ; setup routine.
        pusha

        mov eax, prompt1                ;; prompt1 and reading int, storing into varaible. 
        call print_string
        call read_int
        mov [square_footage], eax
        
        push eax                        ;; pushing first value into stack.

        mov eax, prompt2                ;; prompt2 and reading in int, storing into variable.
        call print_string
        call read_int
        call print_nl
        mov [total_gallons], eax

        push total_gallons              ;; pushing value into stack.
        call gallons_of_paint           ;; calling first subprogram so jump to it.
        add esp, 8                      ;; add 8 so we remove both parameters.
        
        mov eax, prompt3                ;; mov prompt3 into eax and print it.
        call print_string               
        mov eax, ebx                    ;; mov our value that was in subprogram from ebx into eax.
        call print_int                  ;; print it and newline.
        call print_nl

        push ebx                        ;; pushing same value into stack.
        call hours_of_labor             ;; call subprogram.
        add esp, 4                      ;; remove single parameter from stack.

        mov eax, prompt4                ;; mov prompt4 into eax and print it.
        call print_string              
        mov eax, ebx                    ;; mov ebx into eax then print it and newline.
        call print_int
        call print_nl
        
        mov eax, [total_gallons]        ;; moving total gallons into eax, push it, moving square footage into eax, push it.
        push eax
        mov eax, [square_footage]
        push eax
        call cost_of_paint              ;; call cost_of_paint.
        add esp, 8
        
        mov eax, prompt5                ;; prompt5, print it.
        call print_string               
        mov eax, ebx                    ;; moving paint cost into eax and printing it.
        call print_int
        call print_nl

        mov eax, [hours]                ;; moving hours into eax, push it and call cost of labor.
        push eax
        call cost_of_labor
        add esp, 4

        mov eax, prompt6                ;; printing out prompt and values.
        call print_string
        mov eax, ebx
        call print_int
        call print_nl

        push eax                      ;; pushing cost of labor into stack.
        mov ebx, [paint_cost]
        push ebx                      ;; pushing paint cost into ebx.
        call total_cost               ;; call total cost
        add esp, 8
        
        mov eax, prompt7              ;; printing out our total values and ending program.
        call print_string
        mov eax, [total]
        call print_int
        call print_nl

        popa
        mov     eax, 0            ; return back to C
        leave                     
        ret



gallons_of_paint:
        push ebp        ;;
        mov ebp, esp    ;; PROLOGUE
        sub esp, 8      ;; 
        
        mov eax, [ebp + 12]             ;; putting our first value as a parameter into eax
        mov edx, 0                      ;; 0'ing edx so we can divide
        mov ecx, 10                     ;; putting 10 into ecx for our divisor
        div ecx                         ;; divide by 10, quotient in eax
        mov ebx, eax                    ;; move eax into ebx
        mov [square_footage], eax       ;; also put it into variable for usage later.

        mov esp, ebp    ;;
        pop ebp         ;; EPILOGUE
        ret             ;;


hours_of_labor:
        push ebp        ;;
        mov ebp, esp    ;; PROLOGUE
        sub esp, 4      ;; 

        mov ecx, [ebp + 8]      ;; putting our parameter into ecx
        imul ecx, 8             ;; multiply ecx by hours for one gallon of paint
        mov ebx, ecx            ;; 
        mov [hours], ecx        ;; mov value into ebx and hours

        mov esp, ebp   ;;
        pop ebp        ;; EPILOGUE
        ret            ;;


cost_of_paint:
        push ebp        ;;
        mov ebp, esp    ;; PROLOGUE
        sub esp, 8      ;;

        mov ecx, [ebp + 12]     ;; mov total gallons and square footage into registers
        mov ebx, [ebp + 8]
        imul ebx, ecx           ;; multiplying them, and moving ebx into [paint_cost]
        mov [paint_cost], ebx

        mov esp, ebp    ;;
        pop ebp         ;; EPILOGUE
        ret             ;; 


cost_of_labor:
        push ebp        ;;
        mov ebp, esp    ;; PROLOGUE
        sub esp, 4      ;;

        mov ecx, [ebp + 8]      ;; moving hours into ecx, multiplying total hours by 35
        imul ecx, 35
        mov ebx, ecx            ;; moving that value into ebx

        mov esp, ebp    ;; 
        pop ebp         ;; EPILOGUE
        ret             ;;
        

total_cost:
        push ebp        ;;
        mov ebp, esp    ;; PROLOGUE
        sub esp, 8      ;;

        mov eax, [ebp + 8]      ;; moving our total hours and paint cost into eax and ebx
        mov ebx, [ebp + 12]     
        add eax, ebx            ;; adding them together

        mov [total], eax        ;; moving our total value into... well... [total]

        mov esp, ebp    ;; 
        pop ebp         ;; EPILOGUE
        ret             ;;







