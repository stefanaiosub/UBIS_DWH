# UBIS_DWH





DWH Project

Proiect realizat de
Iosub Stefana

Cuprins
I.	Descriere
II.	Structura
III.	Diagrama


I.	Descriere
Acest proiect vizeaza realizarea unei baze de date a unei biblioteci, stocand atat cartile aflate in posesia bibliotecii, cat si persoanele care au acces la imprumutul cartilor( clienti ).
Pentru acest proiect, am folosit limbajul procedural PL SQL  de la Oracle.
Ca si tool necesar, am folosit IDE-ul Oracle SQL Developer.
Am creat din command prompt un utilizator si o parola pentru managementul bazei de date, respectiv baza de date BIBLIOTECA.

II.	Structura(1)

Vom dispune de 3 tabele: Carte, Biblioteca si Client.
Tabelul Carte va contine urmatoarele campuri:
•	ISBN :
-  (pk);
-  Tip: sir de caractere;
-  ISBN =alcatuit din 13 caractere( cifre+cratime), permite identificarea unică atat a documentelor, cat si a editurilor;
-  avantaje: se evita astfel confuzia între titlurile identice, între ediţiile aceluiaşi titlu, sau între editurile cu aceeaşi denumire;
•	nume_carte:
-	Tip: sir de caractere;
•	data_publicare:
-	Tip:data;
•	editura:
-	Tip:sir de caractere;

•	disponibilitate:
-	Tip:numar;

•	cantitate:
-	Tip:numar;


Tabelul Cerere va contine urmatoarele campuri:
•	id_cerere
-  (pk);
-  Tip: number;

•	ISBN
-  (fk);
-  Tip: sir de caractere;

•	CNP
-  (fk);
-  Tip: sir de caractere;

•	data_imprumut:
-	Tip: data;

•	data_returnare:
-	Tip: data;

Tabelul Client va contine urmatoarele campuri:
•	CNP
-  (pk);
-  Tip: sir de caractere;

•	nume_client:
-	Tip:sir de caractere;
•	domiciliu:
-	Tip:sir de caractere;
•	email:
-	Tip:sir de caratere;





Structura(2)
Vom dispune de 5 tabele:CEREERE, CARTE, CLIENT, PUBLICARE, EVIDENTA

Tabelul CARTE:
•	ISBN :
-  (pk);
-  Tip: sir de caractere;
-  ISBN =alcatuit din 13 caractere( cifre+cratime), permite identificarea unică atat a documentelor, cat si a editurilor;
-  avantaje: se evita astfel confuzia între titlurile identice, între ediţiile aceluiaşi titlu, sau între editurile cu aceeaşi denumire;
•	nume_carte:
-	Tip: sir de caractere;


PULICARE
•	ISBN
-  (fk);
-  Tip: sir de caractere;
•	data_publicare:
-	Tip:data;
•	editura:
-	Tip:sir de caractere;


EVIDENTA
•	ISBN
-  (fk);
-  Tip: sir de caractere;
•	disponibilitate:
-	Tip:numar;

•	cantitate:
-	Tip:numar;



Tabelul CERERE:
•	id_cerere
-  (pk);
-  Tip: number;

•	ISBN
-  (fk);
-  Tip: sir de caractere;

•	CNP
-  (fk);
-  Tip: sir de caractere;

•	data_imprumut:
-	Tip: data;

•	data_returnare:
-	Tip: data;

Tabelul CLIENT:
•	CNP
-  (pk);
-  Tip: sir de caractere;

•	nume_client:
-	Tip:sir de caractere;
•	domiciliu:
-	Tip:sir de caractere;
•	email:
-	Tip:sir de caratere;

III.	Diagrama

STRUCTURA(1)- observam legaturi one-to-many si one-to-one(diagrama): 
-un client poate face mai multe cereri(pentru mai multe carti);
-o cerere se face doar pentru o carte;

STRUCTURA(2)- observam legaturi one-to-many(diagrama) si one-to-one: 
-un client poate face mai multe cereri(pentru mai multe carti);
-o cerere se face doar pentru o carte;
-one-to-one pentru pulicare si evidenta relativ la CARTE.



OBSERVATIE: Am creat un proiect JAVA prin care, cu ajutorul unor functii, face echivalentul unor select-uri si afiseaza intocmai ce vrem sa cautam--am atasat comentarii la fiecare pas.Am uploadat pe git clasele Client si Carte, respectiv clasa in care am facut conexiunea cu baza de date si clasa Main in care am instantiat obiectele si am apelat functiile.


