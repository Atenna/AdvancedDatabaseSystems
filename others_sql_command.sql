/*
chybajuci typ dane
*/
insert into typ_dane(id_typ_dane, nazov_dane) values(8, 'dan z databaz');

-- ak je nastaveny iny datumovy format
SELECT * FROM nls_session_parameters WHERE parameter = 'NLS_DATE_FORMAT';
ALTER SESSION SET NLS_DATE_FORMAT = 'DD.MM.YYYY';

/*
preriedenie vlasnikov firiem...
po tomto update existuju osoby ktore maju (0,1,2,3) firmy
*/
delete from vlastnici_firmy where rodne_cislo in ('000214/7970',
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
insert into platca_dane(id_platca, dic_firma, dic_podnikatel)
select platca_dane_seq.nextval, null, dic_podnikatel from OSOBA where dic_podnikatel is not null;

/*
Vsetky firmy preklapam do platcu dane
*/
insert into platca_dane(id_platca, dic_firma, dic_podnikatel)
select platca_dane_seq.nextval, dic_firma, null from firma ;

/*
Vkladanie do tabulky DAN_PRISLUSNOST
*/
INSERT INTO dan_prislusnost (id_platca,id_typ_dane,datum_od)
select id_platca,id_typ_dane, datum_od from platca_dane, dan
where id_typ_dane in (1,2,3,4,5)
and mod(id_platca,4)=0;

INSERT INTO dan_prislusnost (id_platca,id_typ_dane,datum_od)
select id_platca,id_typ_dane, datum_od from platca_dane, dan
where id_typ_dane in (6,7,8,9,10)
and mod(id_platca,4)=1;

INSERT INTO dan_prislusnost (id_platca,id_typ_dane,datum_od)
select id_platca,id_typ_dane, datum_od from platca_dane, dan
where id_typ_dane in (11,12,13,14,15)
and mod(id_platca,4)=2;

INSERT INTO dan_prislusnost (id_platca,id_typ_dane,datum_od)
select id_platca,id_typ_dane, datum_od from platca_dane, dan
where id_typ_dane in (16,17,18,19,20)
and mod(id_platca,4)=3;

/*
vkladanie danovych uradov do tam danovy_urad
*/
insert into DANOVY_URAD(id_urad, RODNE_CISLO, id_adresy, pocet_zamestnancov) VALUES(1,'195913/9410',1,50);
insert into DANOVY_URAD(id_urad, RODNE_CISLO, id_adresy, pocet_zamestnancov) VALUES(2,'200806/2791',2,5);
insert into DANOVY_URAD(id_urad, RODNE_CISLO, id_adresy, pocet_zamestnancov) VALUES(3,'255805/3596',3,15);
insert into DANOVY_URAD(id_urad, RODNE_CISLO, id_adresy, pocet_zamestnancov) VALUES(4,'430921/1854',4,20);
insert into DANOVY_URAD(id_urad, RODNE_CISLO, id_adresy, pocet_zamestnancov) VALUES(5,'460201/0000',5,25);
insert into DANOVY_URAD(id_urad, RODNE_CISLO, id_adresy, pocet_zamestnancov) VALUES(6,'460327/0001',6,59);
insert into DANOVY_URAD(id_urad, RODNE_CISLO, id_adresy, pocet_zamestnancov) VALUES(7,'470207/0000',7,23);
insert into DANOVY_URAD(id_urad, RODNE_CISLO, id_adresy, pocet_zamestnancov) VALUES(8,'471121/4196',8,23);
insert into DANOVY_URAD(id_urad, RODNE_CISLO, id_adresy, pocet_zamestnancov) VALUES(9,'471603/0000',9,321);
insert into DANOVY_URAD(id_urad, RODNE_CISLO, id_adresy, pocet_zamestnancov) VALUES(10,'480108/0001',10,45);


/*
pomocna tabulka na vkladanie platby dane...
v tejto tab bude iba: id_urad, suma, datum_vzniku, datum_zaplatenia
*/
DROP TABLE pom_table;

CREATE TABLE pom_table (
  ID_URAD number,
  SUMA NUMBER,
  DATUM_VZNIKU varchar2(255),
  DATUM_ZAPLATENIA varchar2(255)
);



CREATE TABLE pom_table (
  id number,
  ID_URAD varchar2(50) default NULL,
  SUMA varchar2(50) default NULL,
  DATUM_VZNIKU varchar2(255),
  DATUM_ZAPLATENIA varchar2(255)
);

INSERT INTO pom_table (ID_URAD,SUMA,DATUM_VZNIKU,DATUM_ZAPLATENIA) VALUES (5,227071,'03.05.81','01.05.86');
INSERT INTO pom_table (ID_URAD,SUMA,DATUM_VZNIKU,DATUM_ZAPLATENIA) VALUES (3,910098,'24.01.05','24.03.11');
INSERT INTO pom_table (ID_URAD,SUMA,DATUM_VZNIKU,DATUM_ZAPLATENIA) VALUES (10,230810,'07.08.03','26.11.01');
INSERT INTO pom_table (ID_URAD,SUMA,DATUM_VZNIKU,DATUM_ZAPLATENIA) VALUES (9,438499,'21.11.71','28.07.04');
INSERT INTO pom_table (ID_URAD,SUMA,DATUM_VZNIKU,DATUM_ZAPLATENIA) VALUES (1,927423,'04.06.70','01.07.11');
INSERT INTO pom_table (ID_URAD,SUMA,DATUM_VZNIKU,DATUM_ZAPLATENIA) VALUES (4,391861,'29.11.08','11.05.92');
INSERT INTO pom_table (ID_URAD,SUMA,DATUM_VZNIKU,DATUM_ZAPLATENIA) VALUES (8,500725,'25.10.88','20.05.72');
INSERT INTO pom_table (ID_URAD,SUMA,DATUM_VZNIKU,DATUM_ZAPLATENIA) VALUES (1,78005,'11.04.87','26.06.01');
INSERT INTO pom_table (ID_URAD,SUMA,DATUM_VZNIKU,DATUM_ZAPLATENIA) VALUES (7,530338,'29.07.73','16.09.91');
INSERT INTO pom_table (ID_URAD,SUMA,DATUM_VZNIKU,DATUM_ZAPLATENIA) VALUES (3,168000,'30.10.08','14.05.93');
INSERT INTO pom_table (ID_URAD,SUMA,DATUM_VZNIKU,DATUM_ZAPLATENIA) VALUES (3,550225,'17.06.15','12.02.90');
INSERT INTO pom_table (ID_URAD,SUMA,DATUM_VZNIKU,DATUM_ZAPLATENIA) VALUES (1,333623,'31.03.77','26.10.94');
INSERT INTO pom_table (ID_URAD,SUMA,DATUM_VZNIKU,DATUM_ZAPLATENIA) VALUES (4,50380,'11.02.78','07.12.87');
INSERT INTO pom_table (ID_URAD,SUMA,DATUM_VZNIKU,DATUM_ZAPLATENIA) VALUES (7,323977,'04.06.06','06.02.91');
INSERT INTO pom_table (ID_URAD,SUMA,DATUM_VZNIKU,DATUM_ZAPLATENIA) VALUES (8,492190,'15.11.76','29.05.98');
INSERT INTO pom_table (ID_URAD,SUMA,DATUM_VZNIKU,DATUM_ZAPLATENIA) VALUES (7,253257,'30.04.89','28.10.77');
INSERT INTO pom_table (ID_URAD,SUMA,DATUM_VZNIKU,DATUM_ZAPLATENIA) VALUES (10,890801,'25.12.97','28.11.76');
INSERT INTO pom_table (ID_URAD,SUMA,DATUM_VZNIKU,DATUM_ZAPLATENIA) VALUES (9,813980,'26.05.91','08.11.83');
INSERT INTO pom_table (ID_URAD,SUMA,DATUM_VZNIKU,DATUM_ZAPLATENIA) VALUES (1,252598,'27.04.75','02.11.92');
INSERT INTO pom_table (ID_URAD,SUMA,DATUM_VZNIKU,DATUM_ZAPLATENIA) VALUES (1,761527,'19.03.71','15.04.72');
INSERT INTO pom_table (ID_URAD,SUMA,DATUM_VZNIKU,DATUM_ZAPLATENIA) VALUES (5,918762,'24.10.09','15.08.77');
INSERT INTO pom_table (ID_URAD,SUMA,DATUM_VZNIKU,DATUM_ZAPLATENIA) VALUES (4,852580,'28.06.78','22.08.03');
INSERT INTO pom_table (ID_URAD,SUMA,DATUM_VZNIKU,DATUM_ZAPLATENIA) VALUES (8,444781,'08.10.83','04.09.72');
INSERT INTO pom_table (ID_URAD,SUMA,DATUM_VZNIKU,DATUM_ZAPLATENIA) VALUES (6,8966,'07.06.72','10.11.70');
INSERT INTO pom_table (ID_URAD,SUMA,DATUM_VZNIKU,DATUM_ZAPLATENIA) VALUES (8,290856,'16.06.69','17.09.71');
INSERT INTO pom_table (ID_URAD,SUMA,DATUM_VZNIKU,DATUM_ZAPLATENIA) VALUES (4,293548,'01.11.85','24.11.13');
INSERT INTO pom_table (ID_URAD,SUMA,DATUM_VZNIKU,DATUM_ZAPLATENIA) VALUES (9,754897,'18.03.08','16.10.92');
INSERT INTO pom_table (ID_URAD,SUMA,DATUM_VZNIKU,DATUM_ZAPLATENIA) VALUES (8,456096,'01.04.10','03.10.00');
INSERT INTO pom_table (ID_URAD,SUMA,DATUM_VZNIKU,DATUM_ZAPLATENIA) VALUES (2,834374,'12.07.81','24.09.01');
INSERT INTO pom_table (ID_URAD,SUMA,DATUM_VZNIKU,DATUM_ZAPLATENIA) VALUES (3,453022,'20.03.83','25.12.99');
INSERT INTO pom_table (ID_URAD,SUMA,DATUM_VZNIKU,DATUM_ZAPLATENIA) VALUES (10,941783,'12.01.99','02.11.75');
INSERT INTO pom_table (ID_URAD,SUMA,DATUM_VZNIKU,DATUM_ZAPLATENIA) VALUES (3,110916,'08.12.68','30.08.83');
INSERT INTO pom_table (ID_URAD,SUMA,DATUM_VZNIKU,DATUM_ZAPLATENIA) VALUES (7,536811,'14.12.83','07.10.90');
INSERT INTO pom_table (ID_URAD,SUMA,DATUM_VZNIKU,DATUM_ZAPLATENIA) VALUES (6,604322,'05.08.72','17.05.72');
INSERT INTO pom_table (ID_URAD,SUMA,DATUM_VZNIKU,DATUM_ZAPLATENIA) VALUES (1,817036,'21.04.93','26.08.76');
INSERT INTO pom_table (ID_URAD,SUMA,DATUM_VZNIKU,DATUM_ZAPLATENIA) VALUES (10,8841,'07.11.97','17.08.98');
INSERT INTO pom_table (ID_URAD,SUMA,DATUM_VZNIKU,DATUM_ZAPLATENIA) VALUES (8,36882,'20.01.01','17.09.71');
INSERT INTO pom_table (ID_URAD,SUMA,DATUM_VZNIKU,DATUM_ZAPLATENIA) VALUES (9,205456,'16.01.81','03.05.84');
INSERT INTO pom_table (ID_URAD,SUMA,DATUM_VZNIKU,DATUM_ZAPLATENIA) VALUES (8,670312,'29.07.70','08.10.87');
INSERT INTO pom_table (ID_URAD,SUMA,DATUM_VZNIKU,DATUM_ZAPLATENIA) VALUES (10,237334,'17.05.93','26.05.12');
INSERT INTO pom_table (ID_URAD,SUMA,DATUM_VZNIKU,DATUM_ZAPLATENIA) VALUES (8,4095,'27.01.72','24.10.79');
INSERT INTO pom_table (ID_URAD,SUMA,DATUM_VZNIKU,DATUM_ZAPLATENIA) VALUES (6,991902,'04.10.13','28.05.91');
INSERT INTO pom_table (ID_URAD,SUMA,DATUM_VZNIKU,DATUM_ZAPLATENIA) VALUES (3,415131,'02.03.98','18.03.76');
INSERT INTO pom_table (ID_URAD,SUMA,DATUM_VZNIKU,DATUM_ZAPLATENIA) VALUES (4,550003,'13.01.82','29.06.03');
INSERT INTO pom_table (ID_URAD,SUMA,DATUM_VZNIKU,DATUM_ZAPLATENIA) VALUES (5,149810,'10.05.06','11.04.92');
INSERT INTO pom_table (ID_URAD,SUMA,DATUM_VZNIKU,DATUM_ZAPLATENIA) VALUES (8,499125,'30.09.14','01.03.74');
INSERT INTO pom_table (ID_URAD,SUMA,DATUM_VZNIKU,DATUM_ZAPLATENIA) VALUES (5,181206,'30.09.95','14.05.89');
INSERT INTO pom_table (ID_URAD,SUMA,DATUM_VZNIKU,DATUM_ZAPLATENIA) VALUES (10,125577,'15.07.87','09.04.71');
INSERT INTO pom_table (ID_URAD,SUMA,DATUM_VZNIKU,DATUM_ZAPLATENIA) VALUES (7,794003,'17.10.02','28.11.73');
INSERT INTO pom_table (ID_URAD,SUMA,DATUM_VZNIKU,DATUM_ZAPLATENIA) VALUES (6,124111,'01.05.00','30.06.13');
INSERT INTO pom_table (ID_URAD,SUMA,DATUM_VZNIKU,DATUM_ZAPLATENIA) VALUES (7,336242,'26.04.86','09.11.12');
INSERT INTO pom_table (ID_URAD,SUMA,DATUM_VZNIKU,DATUM_ZAPLATENIA) VALUES (10,784333,'26.10.86','04.06.75');
INSERT INTO pom_table (ID_URAD,SUMA,DATUM_VZNIKU,DATUM_ZAPLATENIA) VALUES (1,771477,'12.04.83','02.11.02');
INSERT INTO pom_table (ID_URAD,SUMA,DATUM_VZNIKU,DATUM_ZAPLATENIA) VALUES (9,445859,'22.12.03','13.05.16');
INSERT INTO pom_table (ID_URAD,SUMA,DATUM_VZNIKU,DATUM_ZAPLATENIA) VALUES (5,11271,'21.08.08','25.08.88');
INSERT INTO pom_table (ID_URAD,SUMA,DATUM_VZNIKU,DATUM_ZAPLATENIA) VALUES (4,592373,'14.07.92','16.02.71');
INSERT INTO pom_table (ID_URAD,SUMA,DATUM_VZNIKU,DATUM_ZAPLATENIA) VALUES (4,676245,'08.06.81','20.01.90');
INSERT INTO pom_table (ID_URAD,SUMA,DATUM_VZNIKU,DATUM_ZAPLATENIA) VALUES (5,656177,'06.11.11','15.07.83');
INSERT INTO pom_table (ID_URAD,SUMA,DATUM_VZNIKU,DATUM_ZAPLATENIA) VALUES (7,190590,'26.08.05','23.11.09');
INSERT INTO pom_table (ID_URAD,SUMA,DATUM_VZNIKU,DATUM_ZAPLATENIA) VALUES (9,997757,'14.05.05','23.04.72');
INSERT INTO pom_table (ID_URAD,SUMA,DATUM_VZNIKU,DATUM_ZAPLATENIA) VALUES (5,911969,'27.03.86','12.10.03');
INSERT INTO pom_table (ID_URAD,SUMA,DATUM_VZNIKU,DATUM_ZAPLATENIA) VALUES (8,797342,'02.01.84','17.08.83');
INSERT INTO pom_table (ID_URAD,SUMA,DATUM_VZNIKU,DATUM_ZAPLATENIA) VALUES (10,705987,'01.10.99','01.04.76');
INSERT INTO pom_table (ID_URAD,SUMA,DATUM_VZNIKU,DATUM_ZAPLATENIA) VALUES (2,535839,'18.12.82','13.05.81');
INSERT INTO pom_table (ID_URAD,SUMA,DATUM_VZNIKU,DATUM_ZAPLATENIA) VALUES (8,295859,'31.10.80','10.11.94');
INSERT INTO pom_table (ID_URAD,SUMA,DATUM_VZNIKU,DATUM_ZAPLATENIA) VALUES (10,152965,'10.08.83','07.05.80');
INSERT INTO pom_table (ID_URAD,SUMA,DATUM_VZNIKU,DATUM_ZAPLATENIA) VALUES (4,354325,'17.09.05','22.01.03');
INSERT INTO pom_table (ID_URAD,SUMA,DATUM_VZNIKU,DATUM_ZAPLATENIA) VALUES (7,627733,'06.06.91','31.10.94');
INSERT INTO pom_table (ID_URAD,SUMA,DATUM_VZNIKU,DATUM_ZAPLATENIA) VALUES (5,613006,'03.06.81','07.02.89');
INSERT INTO pom_table (ID_URAD,SUMA,DATUM_VZNIKU,DATUM_ZAPLATENIA) VALUES (7,781963,'04.03.72','06.05.13');
INSERT INTO pom_table (ID_URAD,SUMA,DATUM_VZNIKU,DATUM_ZAPLATENIA) VALUES (1,929007,'15.09.76','06.10.92');
INSERT INTO pom_table (ID_URAD,SUMA,DATUM_VZNIKU,DATUM_ZAPLATENIA) VALUES (7,167520,'30.10.72','07.08.14');
INSERT INTO pom_table (ID_URAD,SUMA,DATUM_VZNIKU,DATUM_ZAPLATENIA) VALUES (3,753167,'03.03.84','29.03.12');
INSERT INTO pom_table (ID_URAD,SUMA,DATUM_VZNIKU,DATUM_ZAPLATENIA) VALUES (8,314767,'21.03.82','30.11.15');
INSERT INTO pom_table (ID_URAD,SUMA,DATUM_VZNIKU,DATUM_ZAPLATENIA) VALUES (9,619429,'23.07.86','26.08.03');
INSERT INTO pom_table (ID_URAD,SUMA,DATUM_VZNIKU,DATUM_ZAPLATENIA) VALUES (9,957216,'27.06.05','15.05.89');
INSERT INTO pom_table (ID_URAD,SUMA,DATUM_VZNIKU,DATUM_ZAPLATENIA) VALUES (3,709412,'03.09.03','09.12.95');
INSERT INTO pom_table (ID_URAD,SUMA,DATUM_VZNIKU,DATUM_ZAPLATENIA) VALUES (8,230070,'22.08.12','17.10.10');
INSERT INTO pom_table (ID_URAD,SUMA,DATUM_VZNIKU,DATUM_ZAPLATENIA) VALUES (3,936331,'14.10.10','03.01.77');
INSERT INTO pom_table (ID_URAD,SUMA,DATUM_VZNIKU,DATUM_ZAPLATENIA) VALUES (7,85877,'29.12.90','15.06.93');
INSERT INTO pom_table (ID_URAD,SUMA,DATUM_VZNIKU,DATUM_ZAPLATENIA) VALUES (7,433504,'17.08.06','30.06.98');
INSERT INTO pom_table (ID_URAD,SUMA,DATUM_VZNIKU,DATUM_ZAPLATENIA) VALUES (10,711703,'12.11.84','03.10.00');
INSERT INTO pom_table (ID_URAD,SUMA,DATUM_VZNIKU,DATUM_ZAPLATENIA) VALUES (2,704743,'10.06.10','19.02.73');
INSERT INTO pom_table (ID_URAD,SUMA,DATUM_VZNIKU,DATUM_ZAPLATENIA) VALUES (7,181135,'26.09.81','21.10.74');
INSERT INTO pom_table (ID_URAD,SUMA,DATUM_VZNIKU,DATUM_ZAPLATENIA) VALUES (5,728641,'11.05.74','01.04.79');
INSERT INTO pom_table (ID_URAD,SUMA,DATUM_VZNIKU,DATUM_ZAPLATENIA) VALUES (3,825565,'20.02.96','17.10.15');
INSERT INTO pom_table (ID_URAD,SUMA,DATUM_VZNIKU,DATUM_ZAPLATENIA) VALUES (6,681812,'24.04.98','05.04.72');
INSERT INTO pom_table (ID_URAD,SUMA,DATUM_VZNIKU,DATUM_ZAPLATENIA) VALUES (9,698742,'12.06.01','24.11.79');
INSERT INTO pom_table (ID_URAD,SUMA,DATUM_VZNIKU,DATUM_ZAPLATENIA) VALUES (2,321286,'20.01.09','16.04.98');
INSERT INTO pom_table (ID_URAD,SUMA,DATUM_VZNIKU,DATUM_ZAPLATENIA) VALUES (3,478289,'22.12.98','03.04.78');
INSERT INTO pom_table (ID_URAD,SUMA,DATUM_VZNIKU,DATUM_ZAPLATENIA) VALUES (3,599464,'04.04.96','03.07.98');
INSERT INTO pom_table (ID_URAD,SUMA,DATUM_VZNIKU,DATUM_ZAPLATENIA) VALUES (6,945522,'31.10.01','21.07.84');
INSERT INTO pom_table (ID_URAD,SUMA,DATUM_VZNIKU,DATUM_ZAPLATENIA) VALUES (7,513538,'27.10.93','07.03.74');
INSERT INTO pom_table (ID_URAD,SUMA,DATUM_VZNIKU,DATUM_ZAPLATENIA) VALUES (8,152010,'16.11.00','24.07.16');
INSERT INTO pom_table (ID_URAD,SUMA,DATUM_VZNIKU,DATUM_ZAPLATENIA) VALUES (3,944958,'04.01.89','17.06.01');
INSERT INTO pom_table (ID_URAD,SUMA,DATUM_VZNIKU,DATUM_ZAPLATENIA) VALUES (3,778597,'01.06.69','08.09.86');
INSERT INTO pom_table (ID_URAD,SUMA,DATUM_VZNIKU,DATUM_ZAPLATENIA) VALUES (1,412105,'13.08.92','18.06.86');
INSERT INTO pom_table (ID_URAD,SUMA,DATUM_VZNIKU,DATUM_ZAPLATENIA) VALUES (10,536524,'16.06.80','31.10.10');
INSERT INTO pom_table (ID_URAD,SUMA,DATUM_VZNIKU,DATUM_ZAPLATENIA) VALUES (7,738261,'27.03.09','01.07.11');
INSERT INTO pom_table (ID_URAD,SUMA,DATUM_VZNIKU,DATUM_ZAPLATENIA) VALUES (8,816180,'22.07.93','08.03.89');

/*
generovanie platba dane  cca 1 700 000 zaznamov
*/

insert into platba(id_platby, id_platca, id_typ_dane, datum_od, ID_URAD,SUMA,DATUM_VZNIKU,DATUM_ZAPLATENIA)
select platba_seq.nextval, id_platca, id_typ_dane, datum_od, ID_URAD,SUMA,DATUM_VZNIKU,DATUM_ZAPLATENIA
from pom_table, dan, PLATCA_DANE;

-- drop pomocnej tab
DROP TABLE pom_table;

/*
pomocna tabulka datumov pre prislusnost_k_du
*/
DROP TABLE pom_table;

CREATE TABLE pom_table (
  DATUM_OD varchar2(50)
);

INSERT INTO pom_table (DATUM_OD) VALUES ('20.11.08');
INSERT INTO pom_table (DATUM_OD) VALUES ('25.10.02');
INSERT INTO pom_table (DATUM_OD) VALUES ('25.07.10');
INSERT INTO pom_table (DATUM_OD) VALUES ('27.07.04');
INSERT INTO pom_table (DATUM_OD) VALUES ('28.07.75');
INSERT INTO pom_table (DATUM_OD) VALUES ('23.02.15');
INSERT INTO pom_table (DATUM_OD) VALUES ('28.03.75');
INSERT INTO pom_table (DATUM_OD) VALUES ('27.08.83');
INSERT INTO pom_table (DATUM_OD) VALUES ('08.12.78');
INSERT INTO pom_table (DATUM_OD) VALUES ('27.02.89');
INSERT INTO pom_table (DATUM_OD) VALUES ('04.11.03');
INSERT INTO pom_table (DATUM_OD) VALUES ('03.07.84');
INSERT INTO pom_table (DATUM_OD) VALUES ('08.09.71');
INSERT INTO pom_table (DATUM_OD) VALUES ('20.08.73');
INSERT INTO pom_table (DATUM_OD) VALUES ('07.08.87');
INSERT INTO pom_table (DATUM_OD) VALUES ('23.08.14');
INSERT INTO pom_table (DATUM_OD) VALUES ('02.12.96');
INSERT INTO pom_table (DATUM_OD) VALUES ('08.04.13');
INSERT INTO pom_table (DATUM_OD) VALUES ('17.05.03');
INSERT INTO pom_table (DATUM_OD) VALUES ('26.11.89');
INSERT INTO pom_table (DATUM_OD) VALUES ('26.09.79');
INSERT INTO pom_table (DATUM_OD) VALUES ('28.07.05');
INSERT INTO pom_table (DATUM_OD) VALUES ('21.01.82');
INSERT INTO pom_table (DATUM_OD) VALUES ('22.12.15');
INSERT INTO pom_table (DATUM_OD) VALUES ('23.09.07');
INSERT INTO pom_table (DATUM_OD) VALUES ('18.05.72');
INSERT INTO pom_table (DATUM_OD) VALUES ('25.06.90');
INSERT INTO pom_table (DATUM_OD) VALUES ('10.07.13');
INSERT INTO pom_table (DATUM_OD) VALUES ('14.07.07');
INSERT INTO pom_table (DATUM_OD) VALUES ('08.09.78');
INSERT INTO pom_table (DATUM_OD) VALUES ('19.09.79');
INSERT INTO pom_table (DATUM_OD) VALUES ('19.05.06');
INSERT INTO pom_table (DATUM_OD) VALUES ('21.10.89');
INSERT INTO pom_table (DATUM_OD) VALUES ('04.01.91');
INSERT INTO pom_table (DATUM_OD) VALUES ('30.09.84');
INSERT INTO pom_table (DATUM_OD) VALUES ('24.06.76');
INSERT INTO pom_table (DATUM_OD) VALUES ('14.02.01');
INSERT INTO pom_table (DATUM_OD) VALUES ('16.01.86');
INSERT INTO pom_table (DATUM_OD) VALUES ('25.11.12');
INSERT INTO pom_table (DATUM_OD) VALUES ('14.03.81');
INSERT INTO pom_table (DATUM_OD) VALUES ('10.10.12');
INSERT INTO pom_table (DATUM_OD) VALUES ('27.06.84');
INSERT INTO pom_table (DATUM_OD) VALUES ('12.07.09');
INSERT INTO pom_table (DATUM_OD) VALUES ('17.04.89');
INSERT INTO pom_table (DATUM_OD) VALUES ('14.03.75');
INSERT INTO pom_table (DATUM_OD) VALUES ('01.12.03');
INSERT INTO pom_table (DATUM_OD) VALUES ('10.02.77');
INSERT INTO pom_table (DATUM_OD) VALUES ('24.06.83');
INSERT INTO pom_table (DATUM_OD) VALUES ('30.04.14');
INSERT INTO pom_table (DATUM_OD) VALUES ('04.09.05');
INSERT INTO pom_table (DATUM_OD) VALUES ('13.09.08');
INSERT INTO pom_table (DATUM_OD) VALUES ('30.05.05');
INSERT INTO pom_table (DATUM_OD) VALUES ('24.03.74');
INSERT INTO pom_table (DATUM_OD) VALUES ('27.01.94');
INSERT INTO pom_table (DATUM_OD) VALUES ('07.06.80');
INSERT INTO pom_table (DATUM_OD) VALUES ('24.03.81');
INSERT INTO pom_table (DATUM_OD) VALUES ('13.09.88');
INSERT INTO pom_table (DATUM_OD) VALUES ('24.10.10');
INSERT INTO pom_table (DATUM_OD) VALUES ('13.03.14');
INSERT INTO pom_table (DATUM_OD) VALUES ('14.12.09');
INSERT INTO pom_table (DATUM_OD) VALUES ('23.02.76');
INSERT INTO pom_table (DATUM_OD) VALUES ('01.08.84');
INSERT INTO pom_table (DATUM_OD) VALUES ('05.08.86');
INSERT INTO pom_table (DATUM_OD) VALUES ('25.12.79');
INSERT INTO pom_table (DATUM_OD) VALUES ('29.04.91');
INSERT INTO pom_table (DATUM_OD) VALUES ('15.09.78');
INSERT INTO pom_table (DATUM_OD) VALUES ('21.06.79');
INSERT INTO pom_table (DATUM_OD) VALUES ('10.02.92');
INSERT INTO pom_table (DATUM_OD) VALUES ('05.12.14');
INSERT INTO pom_table (DATUM_OD) VALUES ('29.03.14');
INSERT INTO pom_table (DATUM_OD) VALUES ('11.06.80');
INSERT INTO pom_table (DATUM_OD) VALUES ('20.06.99');
INSERT INTO pom_table (DATUM_OD) VALUES ('09.11.74');
INSERT INTO pom_table (DATUM_OD) VALUES ('20.02.16');
INSERT INTO pom_table (DATUM_OD) VALUES ('01.07.72');
INSERT INTO pom_table (DATUM_OD) VALUES ('19.04.74');
INSERT INTO pom_table (DATUM_OD) VALUES ('18.04.77');
INSERT INTO pom_table (DATUM_OD) VALUES ('25.11.01');
INSERT INTO pom_table (DATUM_OD) VALUES ('30.11.92');
INSERT INTO pom_table (DATUM_OD) VALUES ('10.03.02');
INSERT INTO pom_table (DATUM_OD) VALUES ('29.01.82');
INSERT INTO pom_table (DATUM_OD) VALUES ('22.09.97');
INSERT INTO pom_table (DATUM_OD) VALUES ('02.10.76');
INSERT INTO pom_table (DATUM_OD) VALUES ('17.12.02');
INSERT INTO pom_table (DATUM_OD) VALUES ('09.08.86');
INSERT INTO pom_table (DATUM_OD) VALUES ('16.12.98');
INSERT INTO pom_table (DATUM_OD) VALUES ('25.05.10');
INSERT INTO pom_table (DATUM_OD) VALUES ('11.04.13');
INSERT INTO pom_table (DATUM_OD) VALUES ('11.11.85');
INSERT INTO pom_table (DATUM_OD) VALUES ('27.05.13');
INSERT INTO pom_table (DATUM_OD) VALUES ('19.04.96');
INSERT INTO pom_table (DATUM_OD) VALUES ('15.01.11');
INSERT INTO pom_table (DATUM_OD) VALUES ('12.06.89');
INSERT INTO pom_table (DATUM_OD) VALUES ('08.05.74');
INSERT INTO pom_table (DATUM_OD) VALUES ('26.07.79');
INSERT INTO pom_table (DATUM_OD) VALUES ('19.12.76');
INSERT INTO pom_table (DATUM_OD) VALUES ('17.04.98');
INSERT INTO pom_table (DATUM_OD) VALUES ('08.05.78');
INSERT INTO pom_table (DATUM_OD) VALUES ('03.08.07');
INSERT INTO pom_table (DATUM_OD) VALUES ('07.01.04');

-- vkladanie prislusnosti k danovemu uradu prislusnost_k_du 175 000
insert into prislusnost_k_du(id_urad, id_platca, datum_od)
select id_urad, id_platca, datum_od from
danovy_urad, platca_dane, pom_table;

-- vkladanie pre firma_h_adresy (implementovany nejaky trapny filter)
insert into firma_h_adresy(DATUM_OD, ID_ADRESY, DIC_FIRMA)
select pom_table.datum_od, adresa.id_adresy, firma.dic_firma
from adresa, firma, pom_table
where mod(ID_ADRESY,3)=0 and substr(pom_table.datum_od,7,2)>89;


-- vkladanie pre osoba_h_adresy (implementovany nejaky trapny filter)
insert into osoba_h_adresy(DATUM_OD, ID_ADRESY, rodne_cislo)
select pom_table.datum_od, adresa.id_adresy, osoba.rodne_cislo
from adresa, osoba, pom_table
where mod(ID_ADRESY,4)=0 and substr(pom_table.datum_od,7,2)>90;

drop table pom_table;

/*
vkladanie do tab kontakty_firmy
*/
INSERT INTO kontakt_firmy (dic_firma,id_typ_kontaktu,kontakt) VALUES (94,'1','ipsum.dolor@sedlibero.co.uk');
INSERT INTO kontakt_firmy (dic_firma,id_typ_kontaktu,kontakt) VALUES (75,'1','lorem.vitae@posuereenim.ca');
INSERT INTO kontakt_firmy (dic_firma,id_typ_kontaktu,kontakt) VALUES (64,'1','vitae@dapibusrutrumjusto.edu');
INSERT INTO kontakt_firmy (dic_firma,id_typ_kontaktu,kontakt) VALUES (60,'1','elit@egetmetuseu.edu');
INSERT INTO kontakt_firmy (dic_firma,id_typ_kontaktu,kontakt) VALUES (50,'1','Nulla.aliquet.Proin@ut.com');
INSERT INTO kontakt_firmy (dic_firma,id_typ_kontaktu,kontakt) VALUES (29,'1','a.enim@loremvehicula.co.uk');
INSERT INTO kontakt_firmy (dic_firma,id_typ_kontaktu,kontakt) VALUES (59,'1','quam.Curabitur.vel@semut.ca');
INSERT INTO kontakt_firmy (dic_firma,id_typ_kontaktu,kontakt) VALUES (96,'1','Fusce.mi@feugiat.co.uk');
INSERT INTO kontakt_firmy (dic_firma,id_typ_kontaktu,kontakt) VALUES (74,'1','dui@dictumeleifend.org');
INSERT INTO kontakt_firmy (dic_firma,id_typ_kontaktu,kontakt) VALUES (24,'1','neque.Sed@pedemalesuada.co.uk');
INSERT INTO kontakt_firmy (dic_firma,id_typ_kontaktu,kontakt) VALUES (30,'1','mus.Donec@penatibus.org');
INSERT INTO kontakt_firmy (dic_firma,id_typ_kontaktu,kontakt) VALUES (67,'1','Mauris@egestasascelerisque.ca');
INSERT INTO kontakt_firmy (dic_firma,id_typ_kontaktu,kontakt) VALUES (65,'1','non@augueeutellus.ca');
INSERT INTO kontakt_firmy (dic_firma,id_typ_kontaktu,kontakt) VALUES (54,'1','Aliquam@malesuadaut.com');
INSERT INTO kontakt_firmy (dic_firma,id_typ_kontaktu,kontakt) VALUES (42,'1','at@nasceturridiculusmus.edu');
INSERT INTO kontakt_firmy (dic_firma,id_typ_kontaktu,kontakt) VALUES (71,'1','odio@enim.co.uk');
INSERT INTO kontakt_firmy (dic_firma,id_typ_kontaktu,kontakt) VALUES (40,'1','Aenean.sed.pede@sedorci.ca');
INSERT INTO kontakt_firmy (dic_firma,id_typ_kontaktu,kontakt) VALUES (72,'1','laoreet.lectus@egestasnunc.com');
INSERT INTO kontakt_firmy (dic_firma,id_typ_kontaktu,kontakt) VALUES (28,'1','felis.Donec@Nuncquis.net');
INSERT INTO kontakt_firmy (dic_firma,id_typ_kontaktu,kontakt) VALUES (62,'1','et.nunc@nascetur.net');
INSERT INTO kontakt_firmy (dic_firma,id_typ_kontaktu,kontakt) VALUES (32,'1','congue@ametmetusAliquam.org');
INSERT INTO kontakt_firmy (dic_firma,id_typ_kontaktu,kontakt) VALUES (4,'1','nascetur@augueporttitor.net');
INSERT INTO kontakt_firmy (dic_firma,id_typ_kontaktu,kontakt) VALUES (66,'1','vulputate@mienim.co.uk');
INSERT INTO kontakt_firmy (dic_firma,id_typ_kontaktu,kontakt) VALUES (90,'1','ut.aliquam@placeratorci.org');
INSERT INTO kontakt_firmy (dic_firma,id_typ_kontaktu,kontakt) VALUES (27,'1','netus@vitaeodio.com');
INSERT INTO kontakt_firmy (dic_firma,id_typ_kontaktu,kontakt) VALUES (34,'1','Nam@ipsum.ca');
INSERT INTO kontakt_firmy (dic_firma,id_typ_kontaktu,kontakt) VALUES (63,'1','malesuada@Integerid.net');
INSERT INTO kontakt_firmy (dic_firma,id_typ_kontaktu,kontakt) VALUES (79,'1','Suspendisse.dui@eratSed.co.uk');
INSERT INTO kontakt_firmy (dic_firma,id_typ_kontaktu,kontakt) VALUES (84,'1','senectus.et.netus@augueSed.org');
INSERT INTO kontakt_firmy (dic_firma,id_typ_kontaktu,kontakt) VALUES (10,'1','egestas@dolorQuisque.net');
INSERT INTO kontakt_firmy (dic_firma,id_typ_kontaktu,kontakt) VALUES (8,'1','eu.odio.tristique@ipsum.com');
INSERT INTO kontakt_firmy (dic_firma,id_typ_kontaktu,kontakt) VALUES (11,'1','fringilla@et.co.uk');
INSERT INTO kontakt_firmy (dic_firma,id_typ_kontaktu,kontakt) VALUES (69,'1','at.arcu@maurisSuspendisse.net');
INSERT INTO kontakt_firmy (dic_firma,id_typ_kontaktu,kontakt) VALUES (84,'3','(076) 37424521');
INSERT INTO kontakt_firmy (dic_firma,id_typ_kontaktu,kontakt) VALUES (53,'3','(034045) 109470');
INSERT INTO kontakt_firmy (dic_firma,id_typ_kontaktu,kontakt) VALUES (33,'3','(013) 60518157');
INSERT INTO kontakt_firmy (dic_firma,id_typ_kontaktu,kontakt) VALUES (28,'3','(00880) 5920920');
INSERT INTO kontakt_firmy (dic_firma,id_typ_kontaktu,kontakt) VALUES (4,'3','(0611) 84696148');
INSERT INTO kontakt_firmy (dic_firma,id_typ_kontaktu,kontakt) VALUES (81,'3','(067) 00069531');
INSERT INTO kontakt_firmy (dic_firma,id_typ_kontaktu,kontakt) VALUES (95,'3','(0349) 17807589');
INSERT INTO kontakt_firmy (dic_firma,id_typ_kontaktu,kontakt) VALUES (40,'3','(0681) 67794074');
INSERT INTO kontakt_firmy (dic_firma,id_typ_kontaktu,kontakt) VALUES (78,'3','(039940) 633973');
INSERT INTO kontakt_firmy (dic_firma,id_typ_kontaktu,kontakt) VALUES (55,'3','(038083) 580479');
INSERT INTO kontakt_firmy (dic_firma,id_typ_kontaktu,kontakt) VALUES (18,'3','(037) 91763795');
INSERT INTO kontakt_firmy (dic_firma,id_typ_kontaktu,kontakt) VALUES (79,'3','(0767) 56038151');
INSERT INTO kontakt_firmy (dic_firma,id_typ_kontaktu,kontakt) VALUES (59,'3','(0615) 22613551');
INSERT INTO kontakt_firmy (dic_firma,id_typ_kontaktu,kontakt) VALUES (44,'3','(010) 22942588');
INSERT INTO kontakt_firmy (dic_firma,id_typ_kontaktu,kontakt) VALUES (94,'3','(01908) 7261318');
INSERT INTO kontakt_firmy (dic_firma,id_typ_kontaktu,kontakt) VALUES (17,'3','(03149) 2849989');
INSERT INTO kontakt_firmy (dic_firma,id_typ_kontaktu,kontakt) VALUES (80,'3','(09106) 9770050');
INSERT INTO kontakt_firmy (dic_firma,id_typ_kontaktu,kontakt) VALUES (90,'3','(0802) 71043290');
INSERT INTO kontakt_firmy (dic_firma,id_typ_kontaktu,kontakt) VALUES (26,'3','(0884) 51324514');
INSERT INTO kontakt_firmy (dic_firma,id_typ_kontaktu,kontakt) VALUES (74,'3','(0549) 99213927');
INSERT INTO kontakt_firmy (dic_firma,id_typ_kontaktu,kontakt) VALUES (9,'3','(035814) 433165');
INSERT INTO kontakt_firmy (dic_firma,id_typ_kontaktu,kontakt) VALUES (36,'3','(032311) 374972');
INSERT INTO kontakt_firmy (dic_firma,id_typ_kontaktu,kontakt) VALUES (42,'3','(024) 45142863');
INSERT INTO kontakt_firmy (dic_firma,id_typ_kontaktu,kontakt) VALUES (70,'3','(00506) 9361690');
INSERT INTO kontakt_firmy (dic_firma,id_typ_kontaktu,kontakt) VALUES (8,'3','(022) 44463116');
INSERT INTO kontakt_firmy (dic_firma,id_typ_kontaktu,kontakt) VALUES (39,'3','(0101) 37119508');
INSERT INTO kontakt_firmy (dic_firma,id_typ_kontaktu,kontakt) VALUES (73,'3','(0904) 48651044');
INSERT INTO kontakt_firmy (dic_firma,id_typ_kontaktu,kontakt) VALUES (69,'3','(08910) 4056721');
INSERT INTO kontakt_firmy (dic_firma,id_typ_kontaktu,kontakt) VALUES (31,'3','(0732) 29792133');
INSERT INTO kontakt_firmy (dic_firma,id_typ_kontaktu,kontakt) VALUES (10,'3','(039448) 600949');
INSERT INTO kontakt_firmy (dic_firma,id_typ_kontaktu,kontakt) VALUES (37,'3','(033597) 546442');
INSERT INTO kontakt_firmy (dic_firma,id_typ_kontaktu,kontakt) VALUES (46,'3','(073) 30188141');
INSERT INTO kontakt_firmy (dic_firma,id_typ_kontaktu,kontakt) VALUES (52,'3','(06111) 7942743');
INSERT INTO kontakt_firmy (dic_firma,id_typ_kontaktu,kontakt) VALUES (20,'3','(077) 12522278');
INSERT INTO kontakt_firmy (dic_firma,id_typ_kontaktu,kontakt) VALUES (22,'3','(0265) 89606651');
INSERT INTO kontakt_firmy (dic_firma,id_typ_kontaktu,kontakt) VALUES (58,'3','(02158) 5055117');
INSERT INTO kontakt_firmy (dic_firma,id_typ_kontaktu,kontakt) VALUES (16,'3','(0843) 71274602');
INSERT INTO kontakt_firmy (dic_firma,id_typ_kontaktu,kontakt) VALUES (83,'3','(019) 40561782');
INSERT INTO kontakt_firmy (dic_firma,id_typ_kontaktu,kontakt) VALUES (86,'3','(036331) 883047');
INSERT INTO kontakt_firmy (dic_firma,id_typ_kontaktu,kontakt) VALUES (30,'3','(07233) 9971934');
INSERT INTO kontakt_firmy (dic_firma,id_typ_kontaktu,kontakt) VALUES (21,'3','(07035) 5203367');
INSERT INTO kontakt_firmy (dic_firma,id_typ_kontaktu,kontakt) VALUES (49,'3','(06453) 3919806');

-- trochu mazem vela yaynamov v tabulke  PLATBA
delete from platba where mod(id_platby,7) in (3,5);
delete from platba where datum_zaplatenia<datum_vzniku;
select count(*) from platba;
































