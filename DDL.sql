Drop table firma_h_adresy cascade constraint
/
Drop table osoba_h_adresy cascade constraint
/
Drop table prislusnost_k_du cascade constraint
/
Drop table kontakt_osoby cascade constraint
/
Drop table kontakt_firmy cascade constraint
/
Drop table typ_kontaktu cascade constraint
/
Drop table krajina cascade constraint
/
Drop table mesto cascade constraint
/
Drop table adresa cascade constraint
/
Drop table typ_dane cascade constraint
/
Drop table dan_prislusnost cascade constraint
/
Drop table platca_dane cascade constraint
/
Drop table vlastnici_firmy cascade constraint
/
Drop table firma cascade constraint
/
Drop table osoba cascade constraint
/
Drop table dan cascade constraint
/
Drop table platba cascade constraint
/
Drop table danovy_urad cascade constraint
/


Create table danovy_urad (
	id_urad Integer NOT NULL ,
	rodne_cislo Char (11) NOT NULL ,
	id_adresy Integer NOT NULL ,
	pocet_zamestnancov Integer,
primary key (id_urad) 
) 
/

Create table platba (
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

Create table dan (
	id_typ_dane Integer NOT NULL ,
	datum_od Date NOT NULL ,
	percento Integer NOT NULL ,
	datum_do Date,
primary key (id_typ_dane,datum_od) 
) 
/

Create table osoba (
	rodne_cislo Char (11) NOT NULL ,
	dic_podnikatel Integer UNIQUE,
	meno Varchar2 (30) NOT NULL ,
	priezvisko Varchar2 (30) NOT NULL ,
	titul Varchar2 (30),
	datum_od Date NOT NULL ,
	datum_do Date,
primary key (rodne_cislo) 
) 
/

Create table firma (
	dic_firma Integer NOT NULL ,
	nazov Varchar2 (60) NOT NULL ,
	datum_vzniku Date NOT NULL ,
	ico Integer NOT NULL ,
	datum_od Date NOT NULL ,
	datum_do Date,
	datum_zaniku Date,
primary key (dic_firma) 
) 
/

Create table vlastnici_firmy (
	rodne_cislo Char (11) NOT NULL ,
	dic_firma Integer NOT NULL ,
	datum_od Date NOT NULL ,
	datum_do Date,
primary key (rodne_cislo,dic_firma) 
) 
/

Create table platca_dane (
	id_platca Integer NOT NULL ,
	dic_firma Integer UNIQUE ,
	dic_podnikatel Integer UNIQUE,
  CONSTRAINT xor CHECK((dic_podnikatel is null AND dic_firma is not null)OR(dic_podnikatel is not null AND dic_firma is null)),
primary key (id_platca) 
) 
/

Create table dan_prislusnost (
	id_platca Integer NOT NULL ,
	id_typ_dane Integer NOT NULL ,
	datum_od Date NOT NULL ,
primary key (id_platca,id_typ_dane,datum_od) 
) 
/

Create table typ_dane (
	id_typ_dane Integer NOT NULL ,
	nazov_dane Varchar2 (60) NOT NULL ,
primary key (id_typ_dane) 
) 
/

Create table adresa (
	id_adresy Integer NOT NULL ,
	id_mesta Integer NOT NULL ,
	id_krajiny Integer NOT NULL ,
	ulica Varchar2 (60) NOT NULL ,
	cislo Varchar2 (30) NOT NULL ,
primary key (id_adresy) 
) 
/

Create table mesto (
	id_mesta Integer NOT NULL ,
	id_krajiny Integer NOT NULL ,
	nazov_mesta Varchar2 (30) NOT NULL ,
primary key (id_mesta,id_krajiny) 
) 
/

Create table krajina (
	id_krajiny Integer NOT NULL ,
	nazov_statu Varchar2 (60) NOT NULL ,
primary key (id_krajiny) 
) 
/

Create table typ_kontaktu (
	id_typ_kontaktu Integer NOT NULL ,
	nazov_typu Varchar2 (60) NOT NULL ,
primary key (id_typ_kontaktu) 
) 
/

Create table kontakt_firmy (
	dic_firma Integer NOT NULL ,
	id_typ_kontaktu Integer NOT NULL ,
	kontakt Varchar2 (30) NOT NULL ,
primary key (dic_firma,id_typ_kontaktu) 
) 
/

Create table kontakt_osoby (
	rodne_cislo Char (11) NOT NULL ,
	id_typ_kontaktu Integer NOT NULL ,
	kontakt Varchar2 (60) NOT NULL ,
primary key (rodne_cislo,id_typ_kontaktu) 
) 
/

Create table prislusnost_k_du (
	id_urad Integer NOT NULL ,
	id_platca Integer NOT NULL ,
	datum_od Date NOT NULL ,
	datum_do Date,
primary key (id_urad,id_platca,datum_od) 
) 
/

Create table osoba_h_adresy (
	datum_od Date NOT NULL ,
	id_adresy Integer NOT NULL ,
	rodne_cislo Char (11) NOT NULL ,
	datum_do Date,
primary key (datum_od,id_adresy,rodne_cislo) 
) 
/

Create table firma_h_adresy (
	datum_od Date NOT NULL ,
	id_adresy Integer NOT NULL ,
	dic_firma Integer NOT NULL ,
	datum_do Date,
primary key (datum_od,id_adresy,dic_firma) 
) 
/


-- Create Foreign keys section

Alter table prislusnost_k_du add  foreign key (id_urad) references danovy_urad (id_urad) 
/

Alter table platba add  foreign key (id_urad) references danovy_urad (id_urad) 
/

Alter table platba add  foreign key (id_typ_dane,datum_od) references dan (id_typ_dane,datum_od) 
/

Alter table dan_prislusnost add  foreign key (id_typ_dane,datum_od) references dan (id_typ_dane,datum_od) 
/

Alter table vlastnici_firmy add  foreign key (rodne_cislo) references osoba (rodne_cislo) 
/

Alter table danovy_urad add  foreign key (rodne_cislo) references osoba (rodne_cislo) 
/

Alter table platca_dane add  foreign key (dic_podnikatel) references osoba (dic_podnikatel) 
/

Alter table kontakt_osoby add  foreign key (rodne_cislo) references osoba (rodne_cislo) 
/

Alter table osoba_h_adresy add  foreign key (rodne_cislo) references osoba (rodne_cislo) 
/

Alter table vlastnici_firmy add  foreign key (dic_firma) references firma (dic_firma) 
/

Alter table platca_dane add  foreign key (dic_firma) references firma (dic_firma) 
/

Alter table kontakt_firmy add  foreign key (dic_firma) references firma (dic_firma) 
/

Alter table firma_h_adresy add  foreign key (dic_firma) references firma (dic_firma) 
/

Alter table platba add  foreign key (id_platca) references platca_dane (id_platca) 
/

Alter table dan_prislusnost add  foreign key (id_platca) references platca_dane (id_platca) 
/

Alter table prislusnost_k_du add  foreign key (id_platca) references platca_dane (id_platca) 
/

Alter table dan add  foreign key (id_typ_dane) references typ_dane (id_typ_dane) 
/

Alter table osoba_h_adresy add  foreign key (id_adresy) references adresa (id_adresy) 
/

Alter table firma_h_adresy add  foreign key (id_adresy) references adresa (id_adresy) 
/

Alter table danovy_urad add  foreign key (id_adresy) references adresa (id_adresy) 
/

Alter table adresa add  foreign key (id_mesta,id_krajiny) references mesto (id_mesta,id_krajiny) 
/

Alter table mesto add  foreign key (id_krajiny) references krajina (id_krajiny) 
/

Alter table kontakt_firmy add  foreign key (id_typ_kontaktu) references typ_kontaktu (id_typ_kontaktu) 
/

Alter table kontakt_osoby add  foreign key (id_typ_kontaktu) references typ_kontaktu (id_typ_kontaktu) 
/
