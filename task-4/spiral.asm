%include "../include/io.mac"

section .text
    global spiral
    extern printf

; void spiral(int N, char *plain, int key[N][N], char *enc_string);
spiral:
    ;; DO NOT MODIFY
    push ebp
    mov ebp, esp
    pusha

    mov eax, [ebp + 8]  ; N (size of key line)
    mov ebx, [ebp + 12] ; plain (address of first element in string)
    mov ecx, [ebp + 16] ; key (address of first element in matrix)
    mov edx, [ebp + 20] ; enc_string (address of first element in string)
    ;; DO NOT MODIFY
    ;; TODO: Implement spiral encryption
    ;; FREESTYLE STARTS HERE

    mov edi, eax                        ;; in edi este pastrata lungimea a N bytes
    mov dword edi, 4
    mul edi
    mov edi, eax

    mov eax, [ebp + 8]
    mov ecx, [ebp + 8]                  ;; ecx ia valoarea lui eax
    mov esi, [ebp + 16]                 ;; esi ia valoarea lui ecx

    label:                              ;; se parcurge conturul matricei

        dec eax

        cmp eax, 0                      ;; daca s-a ajuns la 0, a ramas un singur element 
        je odd_nr                       ;; in mijlocul matricei si este tratat separat

        mov ecx, eax
        linia_1:                        ;; se parcurge prima linie din contur

            mov edx, [esi]
            add [ebx], edx              ;; numarul se adauga in plain
            inc ebx
            add esi, 4

        loop linia_1

        mov ecx, eax
        coloana_n:                      ;; se parcurge ultima coloana din contur

            mov edx, [esi]
            add [ebx], edx              ;; numarul se adauga in plain
            inc ebx
            add esi, edi

        loop coloana_n

        mov ecx, eax
        linia_n:                        ;; se parcurge ultima linie din contur

            mov edx, [esi]
            add [ebx], edx              ;; numarul se adauga in plain
            inc ebx
            sub esi, 4

        loop linia_n
        
        mov ecx, eax
        coloana_1:                      ;; se parcurge prima coloana din contur

            mov edx, [esi]
            add [ebx], edx              ;; numarul se adauga in plain
            inc ebx
            sub esi, edi

        loop coloana_1

        add esi, edi                    ;; se muta esi pe urmatoarea linie
        add esi, 4                      ;; se muta esi la urmatorul element (pe urmatorul cadran)
        dec eax                         ;; se micsoreaza lungimea liniei

    cmp eax, 0
    jg label
    jle exit

    odd_nr:
        mov edx, [esi]
        add [ebx], edx                  ;; numarul se adauga in plain

    exit:

        mov ebx, [ebp + 12]             ;; ebx isi reia valoarea initiala

        mov eax, [ebp + 8] 
        mov ecx, eax
        mul ecx
        mov ecx, eax

        mov edx, [ebp + 20]             ;; edx isi reia valoarea initiala

        copy_plain:                     ;; se face un loop cu N^2 iteratii
        
            mov edi, [ebx]
            mov [edx], edi              ;; se muta toate caracterele din plain in enc
            inc ebx
            inc edx
            
        loop copy_plain

    ;; FREESTYLE ENDS HERE
    ;; DO NOT MODIFY
    popa
    leave
    ret
    ;; DO NOT MODIFY
