/*
Created		3. 10. 2015
Modified		28. 11. 2015
Project		
Model		
Company		
Author		
Version		
Database		Oracle 10g 
*/


Drop table d_kontakt_dan_urad cascade constraint
/
Drop table d_firma_h_adresy cascade constraint
/
Drop table d_osoba_h_adresy cascade constraint
/
Drop table d_prislusnost_k_du cascade constraint
/
Drop table d_kontakt_osoby cascade constraint
/
Drop table d_kontakt_firmy cascade constraint
/
Drop table d_typ_kontaktu cascade constraint
/
Drop table d_krajina cascade constraint
/
Drop table d_mesto cascade constraint
/
Drop table d_adresa cascade constraint
/
Drop table d_typ_dane cascade constraint
/
Drop table d_dan_prislusnost cascade constraint
/
Drop table d_platca_dane cascade constraint
/
Drop table d_vlastnici_firmy cascade constraint
/
Drop table d_firma cascade constraint
/
Drop table d_osoba cascade constraint
/
Drop table d_dan cascade constraint
/
Drop table d_platba cascade constraint
/
Drop table d_danovy_urad cascade constraint
/


-- Create Types section


-- Create Tables section


Create table d_danovy_urad (
	id_urad Integer NOT NULL ,
	riaditel Char (11) NOT NULL ,
	id_adresy Integer NOT NULL ,
	pocet_zamestnancov Integer,
primary key (id_urad) 
) 
/

Create table d_platba (
	id_platby Integer NOT NULL ,
	id_platca Integer NOT NULL ,
	id_typ_dane Integer NOT NULL ,
	datum_od Date NOT NULL ,
	id_urad Integer NOT NULL ,
	suma Integer NOT NULL ,
	datum_vzniku Date NOT NULL ,
	datum_zaplatenia Date,
primary key (id_platby) 
) 
/

Create table d_dan (
	id_typ_dane Integer NOT NULL ,
	datum_od Date NOT NULL ,
	percento Integer NOT NULL ,
	datum_do Date,
primary key (id_typ_dane,datum_od) 
) 
/

Create table d_osoba (
	rodne_cislo Char (11) NOT NULL ,
	zamestnavatel Integer,
	dic_podnikatel Integer,
	meno Varchar2 (30) NOT NULL ,
	priezvisko Varchar2 (30) NOT NULL ,
	titul Varchar2 (30),
	datum_od Date NOT NULL ,
	datum_do Date,
primary key (rodne_cislo) 
) 
/

Create table d_firma (
	dic_firma Integer NOT NULL ,
	nazov Varchar2 (60) NOT NULL ,
	datum_vzniku Date NOT NULL ,
	ico Integer NOT NULL ,
	datum_zaniku Date,
primary key (dic_firma) 
) 
/

Create table d_vlastnici_firmy (
	rodne_cislo Char (11) NOT NULL ,
	dic_firma Integer NOT NULL ,
	datum_od Date NOT NULL ,
	datum_do Date,
primary key (rodne_cislo,dic_firma) 
) 
/

Create table d_platca_dane (
	id_platca Integer NOT NULL ,
	dic_firma Integer UNIQUE ,
	dic_podnikatel Integer UNIQUE ,
   CONSTRAINT xor CHECK((dic_firma is null AND dic_podnikatel is not null)OR(dic_firma is not null AND dic_podnikatel is null)),
primary key (id_platca) 
) 
/

Create table d_dan_prislusnost (
	id_platca Integer NOT NULL ,
	id_typ_dane Integer NOT NULL ,
	datum_od Date NOT NULL ,
primary key (id_platca,id_typ_dane,datum_od) 
) 
/

Create table d_typ_dane (
	id_typ_dane Integer NOT NULL ,
	nazov_dane Varchar2 (60) NOT NULL ,
primary key (id_typ_dane) 
) 
/

Create table d_adresa (
	id_adresy Integer NOT NULL ,
	id_mesta Integer NOT NULL ,
	id_krajiny Integer NOT NULL ,
	ulica Varchar2 (60) NOT NULL ,
	cislo Varchar2 (30) NOT NULL ,
primary key (id_adresy) 
) 
/

Create table d_mesto (
	id_mesta Integer NOT NULL ,
	id_krajiny Integer NOT NULL ,
	nazov_mesta Varchar2 (30) NOT NULL ,
primary key (id_mesta,id_krajiny) 
) 
/

Create table d_krajina (
	id_krajiny Integer NOT NULL ,
	nazov_statu Varchar2 (60) NOT NULL ,
primary key (id_krajiny) 
) 
/

Create table d_typ_kontaktu (
	id_typ_kontaktu Integer NOT NULL ,
	nazov_typu Varchar2 (60) NOT NULL ,
primary key (id_typ_kontaktu) 
) 
/

Create table d_kontakt_firmy (
	id Integer NOT NULL ,
	dic_firma Integer NOT NULL ,
	id_typ_kontaktu Integer NOT NULL ,
	kontakt Varchar2 (30) NOT NULL ,
primary key (id,dic_firma,id_typ_kontaktu) 
) 
/

Create table d_kontakt_osoby (
	id Integer NOT NULL ,
	rodne_cislo Char (11) NOT NULL ,
	id_typ_kontaktu Integer NOT NULL ,
	kontakt Varchar2 (60) NOT NULL ,
primary key (id,rodne_cislo,id_typ_kontaktu) 
) 
/

Create table d_prislusnost_k_du (
	id_urad Integer NOT NULL ,
	id_platca Integer NOT NULL ,
	datum_od Date NOT NULL ,
	datum_do Date,
primary key (id_urad,id_platca,datum_od) 
) 
/

Create table d_osoba_h_adresy (
	datum_od Date NOT NULL ,
	id_adresy Integer NOT NULL ,
	rodne_cislo Char (11) NOT NULL ,
	datum_do Date,
primary key (datum_od,id_adresy,rodne_cislo) 
) 
/

Create table d_firma_h_adresy (
	datum_od Date NOT NULL ,
	id_adresy Integer NOT NULL ,
	dic_firma Integer NOT NULL ,
	datum_do Date,
	nazov Varchar2 (30),
primary key (datum_od,id_adresy,dic_firma) 
) 
/

Create table d_kontakt_dan_urad (
	id Integer NOT NULL ,
	id_urad Integer NOT NULL ,
	id_typ_kontaktu Integer NOT NULL ,
	kontakt Varchar2 (30) NOT NULL ,
primary key (id,id_urad,id_typ_kontaktu) 
) 
/


-- Create Foreign keys section

Alter table d_prislusnost_k_du add  foreign key (id_urad) references d_danovy_urad (id_urad) 
/

Alter table d_platba add  foreign key (id_urad) references d_danovy_urad (id_urad) 
/

Alter table d_kontakt_dan_urad add  foreign key (id_urad) references d_danovy_urad (id_urad) 
/

Alter table d_platba add  foreign key (id_typ_dane,datum_od) references d_dan (id_typ_dane,datum_od) 
/

Alter table d_dan_prislusnost add  foreign key (id_typ_dane,datum_od) references d_dan (id_typ_dane,datum_od) 
/

Alter table d_vlastnici_firmy add  foreign key (rodne_cislo) references d_osoba (rodne_cislo) 
/

Alter table d_danovy_urad add  foreign key (riaditel) references d_osoba (rodne_cislo) 
/

Alter table d_platca_dane add  foreign key (dic_podnikatel) references d_osoba (dic_podnikatel) 
/

Alter table d_kontakt_osoby add  foreign key (rodne_cislo) references d_osoba (rodne_cislo) 
/

Alter table d_osoba_h_adresy add  foreign key (rodne_cislo) references d_osoba (rodne_cislo) 
/

Alter table d_vlastnici_firmy add  foreign key (dic_firma) references d_firma (dic_firma) 
/

Alter table d_platca_dane add  foreign key (dic_firma) references d_firma (dic_firma) 
/

Alter table d_kontakt_firmy add  foreign key (dic_firma) references d_firma (dic_firma) 
/

Alter table d_firma_h_adresy add  foreign key (dic_firma) references d_firma (dic_firma) 
/

Alter table d_platba add  foreign key (id_platca) references d_platca_dane (id_platca) 
/

Alter table d_dan_prislusnost add  foreign key (id_platca) references d_platca_dane (id_platca) 
/

Alter table d_prislusnost_k_du add  foreign key (id_platca) references d_platca_dane (id_platca) 
/

Alter table d_osoba add  foreign key (zamestnavatel) references d_platca_dane (id_platca) 
/

Alter table d_dan add  foreign key (id_typ_dane) references d_typ_dane (id_typ_dane) 
/

Alter table d_osoba_h_adresy add  foreign key (id_adresy) references d_adresa (id_adresy) 
/

Alter table d_firma_h_adresy add  foreign key (id_adresy) references d_adresa (id_adresy) 
/

Alter table d_danovy_urad add  foreign key (id_adresy) references d_adresa (id_adresy) 
/

Alter table d_adresa add  foreign key (id_mesta,id_krajiny) references d_mesto (id_mesta,id_krajiny) 
/

Alter table d_mesto add  foreign key (id_krajiny) references d_krajina (id_krajiny) 
/

Alter table d_kontakt_firmy add  foreign key (id_typ_kontaktu) references d_typ_kontaktu (id_typ_kontaktu) 
/

Alter table d_kontakt_osoby add  foreign key (id_typ_kontaktu) references d_typ_kontaktu (id_typ_kontaktu) 
/

Alter table d_kontakt_dan_urad add  foreign key (id_typ_kontaktu) references d_typ_kontaktu (id_typ_kontaktu) 
/


-- Create Object Tables section


-- Create XMLType Tables section


-- Create Functions section


-- Create Sequences section


-- Create Packages section


-- Create Synonyms section


-- Create Table comments section


-- Create Attribute comments section


