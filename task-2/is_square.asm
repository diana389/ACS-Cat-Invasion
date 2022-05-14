%include "../include/io.mac"

section .text
    global is_square
    extern printf

is_square:
    ;; DO NOT MODIFY
    push ebp
    mov ebp, esp
    pusha

    mov ebx, [ebp + 8]      ; dist
    mov eax, [ebp + 12]     ; nr
    mov ecx, [ebp + 16]     ; sq
    ;; DO NOT MODIFY
   
    ;; Your code starts here

    mov esi, ecx
    mov ecx, eax                    ;; Se muta eax in ecx pentru a putea forma loop-ul

    label:

        mov dword edi, 0

        find_sq:                    ;; Se gaseste cel mai mic patrat perfect mai mare 
                                    ;; sau egal ca distanta
            mov eax, edi
            mul edi                 ;; In eax se afla patratul perfect curent
            inc edi

        cmp eax, [ebx]
        jl find_sq

        jg not_pp                   ;; Daca este mai mare, nr nu este patrat perfect

        mov dword [esi], 1          ;; In caz de egalitate, este patrat perfect
                                    ;; => Se completeaza cu 1
        jmp exit

        not_pp:
        mov dword [esi], 0          ;; => Se completeaza cu 0

        exit:

        add ebx, 4                  ;; Se trece la elementul urmator
        add esi, 4                  ;; Se trece la elementul urmator

    loop label

    mov ecx, esi

    ;; Your code ends here
    
    ;; DO NOT MODIFY
    popa
    leave
    ret
    ;; DO NOT MODIFY