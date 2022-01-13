


create table Hastaneler
(
ID varchar(20) primary key,
ISIM varchar(30),
SEHIR varchar(30),
OZEL char(1)
);


insert into Hastaneler values('H101','ACI BADEM HASTANSI','ISTANBUL','Y');
insert into Hastaneler values('H102','HASEKI HASTANESI','ISTANBUL','N');
insert into Hastaneler values('H103','MEDIKOL HASANESI','IZMIR','Y');
insert into Hastaneler values('H104','NEMIRYOL HASTANSI','ANKARA','Y');


select * from hastaneler;

create table Hastalar
(
KIMLIK_NO varchar(11) primary key,
ISIM varchar(30),
TESHIS varchar(30)
);

insert into Hastalar values('12345678901','Ali Can','Gizli Seker');
insert into Hastalar values('45678901121','Ayse Yilmaz','Hipertansiyon');
insert into Hastalar values('78901123451','Steve Job','Pankreatit');
insert into Hastalar values('12344321251','Tom Hanks','COVID 19');

SELECT * FROM Hastalar;

create table Bolumler (
BOLUM_ID varchar(10) primary key,
BOLUM_ADI varchar(25)
);


insert into Bolumler values('DHL','Dahiliye');
insert into Bolumler values('KBB','Kulak-Burun-Bogaz');
insert into Bolumler values('NRJ','Noroloji');
insert into Bolumler values('GAST','Gastoroloji');
insert into Bolumler values('KARD','Kardioloji');
insert into Bolumler values('PSK','Psikiyatri');
insert into Bolumler values('GOZ','Goz Hastaliklari');



create table Hasta_kayitlar (
KIMLIK_NO varchar(11) primary key,
HAST_ISIM varchar(40),
HASTANE_ADI varchar(30),
BOLUM_ADI varchar(20),
TESIS varchar (30)
);


INSERT INTO hasta_kayitlar VALUES ('1111', 'NONAME', NULL, NULL, NULL);
INSERT INTO hasta_kayitlar VALUES ('2222', 'NONAME', NULL, NULL, NULL);
INSERT INTO hasta_kayitlar VALUES ('3333', 'NONAME', NULL, NULL, NULL);


select * from hasta_kayitlar;

update Hasta_kayitlar
set HAST_ISIM ='Salvadore Dali',
HASTANE_ADI='John Hopins',
BOLUM_ADI='Noroloji',
TESIS='Parkinson',
KIMLIK_NO='99991111222'
where KIMLIK_NO='3333';


update Hasta_kayitlar
set HAST_ISIM =(SELECT ISIM  from Hastalar where ISIM='Ali Can'),
HASTANE_ADI=(select ISIM from Hastaneler where ID='H104'),
BOLUM_ADI=(select BOLUM_ADI from Bolumler WHERE BOLUM_ID='DHL'),
TESIS=(select TESIS from Hastalar where ISIM='ALi Can'),
KIMLIK_NO=(select KIMLIK_NO from Hastalar where ISIM='ALi Can')
where KIMLIK_NO='1111';





