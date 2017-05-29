/*
CARTE
Nume carte, 
Autor/Autori (o carte poate avea mai multi autori), 
ISBN, 
Data publicarii cartii, 
Editura, 

IMPRUMUT
Carte disponibila, 
Bucati existente in biblioteca din cartea respectiva, 
Data imprumutului, 
Data returnare, 

CLIENT
Client, 
CNP client, 
Domiciliu client, 
Adresa de email client  

*/


create or replace type lista_autori
as
table of varchar2(100);


create table carte
(
ISBN varchar2(13) not null, 
nume_carte varchar2(100) not null,-- ISBN =identificarea unicã atat a documentelor, cat si a editurilor;
autor lista_autori not null,
data_publicare date not null,
editura varchar2(30) not null,
disponibilitate boolean not null,
cantitate number,
constraint carte_pk primary key (ISBN)
)

nested table autor store as lista;


create table publicare
(

ISBN varchar(13) not null,
data_publicare date not null,
editura varchar2(30) not null,
constraint fk_carte foreign key (ISBN) references carte(ISBN)

)


create table evidenta
(

ISBN varchar(13) not null,
disponibilitate boolean not null,
cantitate number,
constraint fk_carte foreign key (ISBN) references carte(ISBN)

)



Create sequence id_cerere_sequence start with 1
increment by 1
minvalue 1
maxvalue 1000000;



create table cerere
(
id_cerere number,
CNP varchar2(13),
ISBN varchar2(13),
data_imprumut date not null,
data_returnare date not null,

constraint cerere_pk primary key (id_cerere),
constraint fk_carte foreign key (ISBN) references carte(ISBN),
constraint fk_client foreign key (CNP) references client(CNP)
)


create table client
(
CNP varchar2(13),
nume_client varchar2(100),
domiciliu varchar2(50),
email varchar2(50),

constraint client_pk primary key (CNP)
)
