; Prend les deux derniers chiffres d'une valeur presente dans eax
; et les affiche sur la sortie standard dans l'ordre inverse

section .data
    dernier: db "",0   ; init de la variable qui va contenir le dernier chiffre
    length: equ $-dernier 
    avdernier: db "",0 ; init de la variable qui va contenir l'avant dernier chiffre
    len: equ $-avdernier
    eol: db 10         ; char de retour a la ligne

section .text
    global _start

_start:
    mov eax, 12868956 ; On met un nombre dans eax

    ; Obtenir dernier chiffre, il sera dans edx
    xor edx, edx      ; vider le registre pour la division
    mov ecx, 10       ; on va diviser par 10 pour sortir le dernier chiffre qui correspond au reste
    idiv ecx          ; division ; le résultat est stocké dans eax, le reste dans edx

    ; Mettre la valeur dans la variable
    mov ebx, edx ; on met dans ebx pour la conversion 
    add ebx, '0' ; conversion en ascii
    mov byte [dernier], bl ; deplace la valeur dans la variable

    ; Obtenir avdernier chiffre, il sera dans edx
    xor edx, edx      ; vider le registre pour la division
    mov ecx, 10       ; on va diviser par 10 pour sortir le dernier chiffre qui correspond au reste
    idiv ecx          ; division ; le résultat est stocké dans eax, le reste dans edx

    ; Mettre la valeur dans la variable
    mov ebx, edx ; on met dans ebx pour la conversion 
    add ebx, '0' ; conversion en ascii
    mov byte [avdernier], bl ; deplace la valeur dans la variable

    ; Affichage du chiffre avec la fonction write
    mov eax, 4       ; syscall de write
    mov ebx, 1       ; sortie std
    mov ecx, dernier ; valeur a afficher (dernier chiffre)
    mov edx, 1       ; longeur de la chaine
    int 0x80         ; interruption logiciel
    ; Affichage du chiffre avec la fonction write
    mov eax, 4         ; syscall de write
    mov ecx, avdernier ; valeur a afficher (avant dernier chiffre)
    int 0x80           ; interruption logiciel
    ; Retour a la ligne
    mov eax, 4         ; syscall de write
    mov ecx, eol       ; valeur a afficher (retour a la ligne)
    int 0x80           ; interruption logiciel

    ; Sortie du programme
    mov eax, 1         ; syscall stdout
    mov ebx, 0         ; exit code
    int 0x80           ; interruption logiciel 