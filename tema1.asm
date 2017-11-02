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
    
    PRINT_CHAR [hexa]       ; Apelezi cu adresa + offset
    
    
    ret