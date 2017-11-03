%include "io.inc"

section .data
   %include "input.inc"
   incorect db "Baza incorecta", 0
      
section .text
global CMAIN
CMAIN:
    mov ebp, esp
    xor eax, eax
    xor edx, edx

    mov ecx, -1                 ; Pentru a putea incrementa in iterare
    
iterare:
    INC ecx
        
    cmp ecx, [nums]             ; Verific daca am iterat toate elementele
    je final                    

    mov ebx, [base_array + 4 * ecx]
    
    cmp ebx, 2                  ; Verific daca am baza corecta
    jl bazainc
    cmp ebx, 16
    jg bazainc
    
memorare:                       ; Recurenta pentru retinerea corecta a numarului
    mov dx, [nums_array + 4*ecx + 2]
    mov ax, [nums_array + 4*ecx]
    
transformare:
    div bx
    push dx
    
    cmp ax, 0                   ; Daca avem rezultat zero, insemna ca am ajuns la ultimul element
    je printare                 ; Asa ca putem printa numarul de pe stiva
    
    mov dx, 0                   
    
    jmp transformare            ; Fac loop pana cand transform tot numarul

printare:
    cmp esp, ebp
    je newline

DeAici:                         ; Am pus acest label pentru a nu pune o infinitate de newline-uri
    cmp esp, ebp                ; Se continua cu urmatorul numar
    je iterare
    
    pop dx                      ; Iau de pe stiva si printez in ordinea corecta
    PRINT_HEX 2, dx
    
    jmp printare

newline:                        ; Label pentru newline-uri
    NEWLINE
    jmp DeAici
    
bazainc:                        ; Printez stringul definit in section .data
    PRINT_STRING incorect
    NEWLINE
    jmp iterare                 ; Trec la urmatorul element
    
final:                          
    ret