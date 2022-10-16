Stefan Diana Maria - 312CC
Tema 2 - ACS Cat Invasion
----------------------------------------------------------------------------

TASK 1:

->simple:
Am folosit un loop care are "len" iteratii, pentru a parcurge simultan cele 2
siruri ("plain" si "enc_string"). Fiecare caracter din "plain" este salvat in 
ah, unde i se adauga pasul, iar daca depaseste 90 ('Z'), se micsoreaza cu 26, 
apoi se muta in "enc_string".

TASK 2:

->points_distance:
Am inceput prin a verifica daca segmentul este paralel cu Ox sau cu Oy, de
unde s-au desprins 2 cazuri, iar pentru fiecare am verificat coordonata carui
punct este mai mare, pentru a avea un numar pozitiv ca distanta. In oricare
dintre cazuri, am adaugat distanta in [eax].

->road:
Am folosit un loop cu "len - 1" iteratii, pentru a calcula distantele dintre
fiecare 2 puncte. Pentru asta am transmis parametrii si am apelat functia 
"points_distance", dupa care am trecut la urmatoarele elemente.

->is_square:
Am parcurs vectorul de distante printr-un loop, iar pesntru fiecare element
am calculat o serie de patrate perfecte consecutive, verificand 3 cazuri:
daca patratul este egal cu distanta, in vector se pune 1, daca este mai mare, 
se pune 0, iar daca este mai mic, se continua iteratiile.

TASK 3:
->beaufort:
Am inceput prin a completa sirul "enc" cu cheia, prin repetarea sa. Apoi, am 
parcurs paralel sirul "enc" si "plain". Pentru fiecare pereche de caractere, 
daca litera din "enc" este mai mare decat cea din "plain", se face diferenta
si se aduna cu 65 ('A'). In caz contrar, diferenta in modul se scade din 26, 
iar numarul obtinut este adunat cu 65 ('A'). Noul caracter este retinut in 
"enc".

TASK 4:

->spiral:
Se formeaza un loop cu N/2 iteratii, in care este parcursa matricea pe contur,
in felul urmator: prima linie, ultima coloana, ultima linie, prima coloana.
Dupa fiecare parcurgere, se reincepe acest proces din primul element din 
interiorul conturului. In cazul in care N este impar, elementul din mijloc
reprezinta un caz special, care este tradat ulterior. Pe masura ce se parcurge
matricea, elementul curent din "plain" se mareste cu elementul curent din
matrice. La final, sirul din "plain" este copiat in "enc_string".
