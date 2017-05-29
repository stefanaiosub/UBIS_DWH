
--drop table carte;
--drop table cerere;
--drop table client;


create or replace type lista_autori as table of varchar2(100);


create table carte
(
ISBN varchar2(13) not null, 
nume_carte varchar2(100) not null,-- ISBN =identificarea unic? atat a documentelor, cat si a editurilor;
autor lista_autori,
data_publicare date ,
editura varchar2(30) ,
disponibilitate number not null,
cantitate number,
constraint carte_pk primary key (ISBN)
)
nested table autor store as lista;


create table cerere
(
id_cerere number,
CNP varchar2(15),
ISBN varchar2(13),
data_imprumut date not null,
data_returnare date not null,

constraint cerere_pk primary key (id_cerere)
--constraint fk_carte foreign key (ISBN) references carte(ISBN),
--constraint fk_client foreign key (CNP) references client(CNP)
)


create table client
(
CNP varchar2(15),
nume_client varchar2(100),
domiciliu varchar2(50),
email varchar2(50),

constraint client_pk primary key (CNP)
)



--CARTE!

--INSERARI


insert into carte(ISBN,nume_carte,autor, data_publicare, editura,disponibilitate,cantitate) values('978-9920-0-8','Rosu si negru',lista_autori('Stendhal'),'12.apr.2004','Polirom',1,4);
insert into carte(ISBN,nume_carte,autor, data_publicare, editura,disponibilitate,cantitate) values('978-9921-0-9','Rosu si negru',lista_autori('Stendhal'),'24.sep.1998','Teora',1,2);
insert into carte(ISBN,nume_carte,autor, data_publicare, editura,disponibilitate,cantitate) values('978-9922-0-0','Antologie de poezii',lista_autori('Ana Blandiana','Elena Farago'),'07.mar.2001','Nemira',0,0);
insert into carte(ISBN,nume_carte,autor, data_publicare, editura,disponibilitate,cantitate) values('978-9923-0-1','Harry Potter si Piatra filozofala',lista_autori('J.K.Rowling'),'23.dec.2004','Arte',1,25);
insert into carte(ISBN,nume_carte,autor, data_publicare, editura,disponibilitate,cantitate) values('978-9923-0-2','Harry Potter si Camera Secretelor',lista_autori('J.K.Rowling'),'13.jun.2005','Arte',1,43);


--UPDATE-URI
update carte set nume_carte='Harry Potter si Piatra Filozofala' where ISBN='978-9923-0-1';


--STERGERI
delete from carte where autor='J.K.Rowling';


--SELECT-URI
select max(disponibilitate) from carte group by ISBN;
select max(cantitate) from carte group by nume_carte;-- cele 2 carti 'Rosu si Negru' , chiar daca sunt de la edituri diferite, cantitatile din fiecare vor fi insumate;



--CLIENT!

--INSERARI
insert into client(CNP,nume_client,domiciliu,email) values('101012001231232','Lucian Lazar','Ialomita','lucian1@yahoo.com');
insert into client(CNP,nume_client,domiciliu,email) values('202021995123765','Consuela Manea','Bucuresti','consuela_manea_95@gmail.com');
insert into client(CNP,nume_client,domiciliu,email) values('103039872229988','Mihai Sava','Cluj-Napoca','Sava1Mihai@hotmail.com');
insert into client(CNP,nume_client,domiciliu,email) values('204041988232988','Raluca Munteanu','Bucuresti','raluca_munteanu@gmail.com');
insert into client(CNP,nume_client,domiciliu,email) values('254051995212378','Miruna Vujan','Bucuresti','mirunici_vuj@gmail.com');

--UPDATE-URI
update client set email='sava1mihai@gmail.com' where CNP='103039872229988';

--STERGERI
delete from client where domiciliu='Bucuresti';


--SELECT-URI

select count(*) from client where domiciliu='Bucuresti';
select count(*) from client group by (CNP);---unicitatea;





--CERERE!

--INSERARI
insert into cerere(id_cerere,CNP,ISBN,data_imprumut,data_returnare) values(1,'101012001231232','978-9923-0-1','20.mar.2017','21.apr.2017');
insert into cerere(id_cerere,CNP,ISBN,data_imprumut,data_returnare) values(2,'101012001231232','978-9922-0-0','20.mar.2017','21.apr.2017');
insert into cerere(id_cerere,CNP,ISBN,data_imprumut,data_returnare) values(3,'254051995212378','978-9920-0-8','22.apr.2017','23.may.2017');
insert into cerere(id_cerere,CNP,ISBN,data_imprumut,data_returnare) values(4,'204041988232988','978-9920-0-9','02.may.2017','21.may.2017');



--UPDATE-URI

update cerere set data_imprumut='03.may.2017' where id_cerere=4;

--STERGERI

delete from cerere where to_char(data_imprumut,'mon')='may';


--SELECT-URI

select c1.data_imprumut from cerere c1 join client c2 on c1.CNP=c2.CNP;
select count(*) from cerere group by (id_cerere);
select count(*) from cerere group by (CNP);
select max(data_imprumut) from cerere;
select max(c1.data_imprumut) from cerere c1 join client c2 on c1.CNP=c2.CNP group by TO_CHAR(c1.data_imprumut,'yyyy');
select max(TO_CHAR(c1.data_imprumut,'yyyy')) from cerere c1 join client c2 on c1.CNP=c2.CNP group by c1.data_imprumut;
select max(TO_CHAR(c1.data_imprumut,'dd')) from cerere c1 join client c2 on c1.CNP=c2.CNP group by c1.data_imprumut order by TO_CHAR(c1.data_imprumut,'dd') asc;


