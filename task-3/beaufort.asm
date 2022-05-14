%include "../include/io.mac"

section .text
    global beaufort
    extern printf

; void beaufort(int len_plain, char *plain, int len_key, char *key, char tabula_recta[26][26], char *enc) ;
beaufort:
    ;; DO NOT MODIFY
    push ebp
    mov ebp, esp
    pusha

    mov eax, [ebp + 8]  ; len_plain
    mov ebx, [ebp + 12] ; plain (address of first element in string)
    mov ecx, [ebp + 16] ; len_key
    mov edx, [ebp + 20] ; key (address of first element in matrix)
    mov edi, [ebp + 24] ; tabula_recta
    mov esi, [ebp + 28] ; enc
    ;; DO NOT MODIFY
    ;; TODO: Implement spiral encryption
    ;; FREESTYLE STARTS HERE

    mov edi, [ebp + 8]          ;; Se stocheaza in edi len_plain
    mov dword eax, 0

    complete_enc:

    label:

        mov ah, [edx]           ;; Se completeaza enc cu sirul key
        mov [esi], ah

        inc esi
        inc edx

    loop label

    mov edx, [ebp + 20]         ;; edx isi reia valoarea
    mov ecx, [ebp + 16]         ;; ecx isi reia valoarea
    sub edi, ecx                ;; Se calculeaza cate litere mai sunt de completat

    cmp edi, 0                  ;; enc este completat cu cheia repetata
    jle gata

    cmp edi, ecx                ;; Mai incape o repetare completa a cheii
    jge complete_enc

    mov ecx, edi                ;; Se completeaza cu cate litere mai este nevoie
    jmp complete_enc

    gata:

    mov esi, [ebp + 28]         ;; esi revine la inceputul sirului
    mov ecx, [ebp + 8]          ;; ecx retine len_plain

    mov dword eax, 0

    label2:                     ;; se parcurge enc

        mov al, [esi]
        cmp al, [ebx]
        jl case1                ;; litera din plain este mai mica decat cea din enc

        sub al, [ebx]           ;; se face diferenta dintre cele 2 litere
        jmp case2

        case1:
        mov al, [ebx]           ;; valorile se inverseaza si se face diferenta
        sub al, [esi]
        mov ah, 26              ;; diferenta se scade din 26
        sub ah, al              ;; numarul obtinut se scade din litera
        mov al, ah

        case2:

        add byte al, 65         ;; se aduna litera 'A' pentru a obtine noua litera
        mov [esi], al           ;; litera se inlocuieste in enc

        inc esi                 ;; se trece la urmatorul caracter
        inc ebx                 ;; se trece la urmatorul caracter
        
    loop label2

    ;; FREESTYLE ENDS HERE
    ;; DO NOT MODIFY
    popa
    leave
    ret
    ;; DO NOT MODIFY
