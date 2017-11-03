%include "io.inc"

section .data
   %include "input.inc"
   incorect db "Baza incorecta"
   zecimal db "0123456789", 0   ; Sirul de caractere pentru baza 10
   hexa db "abcdef", 0          ; Sirul de caractere pana la baza 16
    
section .text
global CMAIN
CMAIN:
    xor eax, eax
    xor edx, edx
    mov ecx, -1                 ; Pentru a putea incrementa in memorare
    PRINT_CHAR [hexa]           ; Apelezi cu adresa + offset
    
memorare:
    INC ecx
    mov ebx, [base_array + 4 * ecx]
    cmp ecx, nums + 1           ; Verific daca am iterat toate elementele  
    je final                    

transformare:  
    mov dx, [num + 4*ecx + 2]   ; Pentru a lua partea high
    mov ax, [num + 4*ecx]       ; Partea low o retin in ax because Little Endian
    
    div bx
    
    ; Cand o sa transformi restul in caracter sa verifici de fiecare data
    ; Daca este ax = 0 dupa printare, pentru a putea itera elementele 
