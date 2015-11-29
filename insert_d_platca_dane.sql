/*
Vytvorenie sequencie na ID_PLATCA v tabulku PLATCA_DANE
*/
drop SEQUENCE platca_dane_seq;
CREATE SEQUENCE platca_dane_seq
  MINVALUE 1
  MAXVALUE 999999999999999999999999999
  START WITH 1
  INCREMENT BY 1
  CACHE 20;

/*
Vytvorenie sequencie na ID_PLATBA v tabulku PLATBA
*/
drop SEQUENCE platba_seq;
CREATE SEQUENCE platba_seq
  MINVALUE 1
  MAXVALUE 999999999999999999999999999
  START WITH 1
  INCREMENT BY 1
  CACHE 20;

/*
Vsetky osoby ktore maju vyplnene DIC preklapam do platcu dane
*/
insert into d_platca_dane(id_platca, dic_firma, dic_podnikatel)
select platca_dane_seq.nextval, null, dic_podnikatel from d_OSOBA where dic_podnikatel is not null;

/*
Vsetky firmy preklapam do platcu dane
*/
insert into d_platca_dane(id_platca, dic_firma, dic_podnikatel)
select platca_dane_seq.nextval, dic_firma, null from d_firma ;

/*
chybajuci typ dane
*/
insert into d_typ_dane(id_typ_dane, nazov_dane) values(8, 'dan z databaz');

/*
preriedenie vlasnikov firiem...
po tomto update existuju osoby ktore maju (0,1,2,3) firmy
*/
delete from d_vlastnici_firmy where rodne_cislo in ('000214/7970',
'195913/9410',
'200806/2791',
'255805/3596',
'460201/0000',
'460327/0001',
'471121/4196',
'471603/0000',
'480108/0001',
'480408/0127',
'480914/0000',
'490127/4112') and dic_firma in(1,2,4,3,5,6,7,8,9,10,11,12);