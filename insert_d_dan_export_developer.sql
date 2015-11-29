--------------------------------------------------------
--  File created - Nede¾a-november-29-2015   
--------------------------------------------------------
--------------------------------------------------------
--  DDL for Table D_DAN
--------------------------------------------------------

  CREATE TABLE "DRABIKOVA8"."D_DAN" 
   (	"ID_TYP_DANE" NUMBER(*,0), 
	"DATUM_OD" DATE, 
	"PERCENTO" NUMBER(*,0), 
	"DATUM_DO" DATE
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "UCITELIA" ;
REM INSERTING into DRABIKOVA8.D_DAN
SET DEFINE OFF;
Insert into DRABIKOVA8.D_DAN (ID_TYP_DANE,DATUM_OD,PERCENTO,DATUM_DO) values ('1',to_date('01.01.11','DD.MM.RR'),'10',to_date('31.12.11','DD.MM.RR'));
Insert into DRABIKOVA8.D_DAN (ID_TYP_DANE,DATUM_OD,PERCENTO,DATUM_DO) values ('2',to_date('01.01.11','DD.MM.RR'),'3',to_date('31.12.11','DD.MM.RR'));
Insert into DRABIKOVA8.D_DAN (ID_TYP_DANE,DATUM_OD,PERCENTO,DATUM_DO) values ('3',to_date('01.01.11','DD.MM.RR'),'12',to_date('31.12.11','DD.MM.RR'));
Insert into DRABIKOVA8.D_DAN (ID_TYP_DANE,DATUM_OD,PERCENTO,DATUM_DO) values ('4',to_date('01.01.11','DD.MM.RR'),'11',to_date('31.12.11','DD.MM.RR'));
Insert into DRABIKOVA8.D_DAN (ID_TYP_DANE,DATUM_OD,PERCENTO,DATUM_DO) values ('5',to_date('01.01.11','DD.MM.RR'),'32',to_date('31.12.11','DD.MM.RR'));
Insert into DRABIKOVA8.D_DAN (ID_TYP_DANE,DATUM_OD,PERCENTO,DATUM_DO) values ('6',to_date('01.01.11','DD.MM.RR'),'12',to_date('31.12.11','DD.MM.RR'));
Insert into DRABIKOVA8.D_DAN (ID_TYP_DANE,DATUM_OD,PERCENTO,DATUM_DO) values ('7',to_date('01.01.11','DD.MM.RR'),'54',to_date('31.12.11','DD.MM.RR'));
Insert into DRABIKOVA8.D_DAN (ID_TYP_DANE,DATUM_OD,PERCENTO,DATUM_DO) values ('8',to_date('01.01.11','DD.MM.RR'),'23',to_date('31.12.11','DD.MM.RR'));
Insert into DRABIKOVA8.D_DAN (ID_TYP_DANE,DATUM_OD,PERCENTO,DATUM_DO) values ('9',to_date('01.01.11','DD.MM.RR'),'4',to_date('31.12.11','DD.MM.RR'));
Insert into DRABIKOVA8.D_DAN (ID_TYP_DANE,DATUM_OD,PERCENTO,DATUM_DO) values ('10',to_date('01.01.11','DD.MM.RR'),'5',to_date('31.12.11','DD.MM.RR'));
Insert into DRABIKOVA8.D_DAN (ID_TYP_DANE,DATUM_OD,PERCENTO,DATUM_DO) values ('11',to_date('01.01.11','DD.MM.RR'),'10',to_date('31.12.11','DD.MM.RR'));
Insert into DRABIKOVA8.D_DAN (ID_TYP_DANE,DATUM_OD,PERCENTO,DATUM_DO) values ('12',to_date('01.01.11','DD.MM.RR'),'54',to_date('31.12.11','DD.MM.RR'));
Insert into DRABIKOVA8.D_DAN (ID_TYP_DANE,DATUM_OD,PERCENTO,DATUM_DO) values ('13',to_date('01.01.11','DD.MM.RR'),'4',to_date('31.12.11','DD.MM.RR'));
Insert into DRABIKOVA8.D_DAN (ID_TYP_DANE,DATUM_OD,PERCENTO,DATUM_DO) values ('14',to_date('01.01.11','DD.MM.RR'),'3',to_date('31.12.11','DD.MM.RR'));
Insert into DRABIKOVA8.D_DAN (ID_TYP_DANE,DATUM_OD,PERCENTO,DATUM_DO) values ('15',to_date('01.01.11','DD.MM.RR'),'33',to_date('31.12.11','DD.MM.RR'));
Insert into DRABIKOVA8.D_DAN (ID_TYP_DANE,DATUM_OD,PERCENTO,DATUM_DO) values ('16',to_date('01.01.11','DD.MM.RR'),'22',to_date('31.12.11','DD.MM.RR'));
Insert into DRABIKOVA8.D_DAN (ID_TYP_DANE,DATUM_OD,PERCENTO,DATUM_DO) values ('17',to_date('01.01.11','DD.MM.RR'),'21',to_date('31.12.11','DD.MM.RR'));
Insert into DRABIKOVA8.D_DAN (ID_TYP_DANE,DATUM_OD,PERCENTO,DATUM_DO) values ('18',to_date('01.01.11','DD.MM.RR'),'10',to_date('31.12.11','DD.MM.RR'));
Insert into DRABIKOVA8.D_DAN (ID_TYP_DANE,DATUM_OD,PERCENTO,DATUM_DO) values ('19',to_date('01.01.11','DD.MM.RR'),'23',to_date('31.12.11','DD.MM.RR'));
Insert into DRABIKOVA8.D_DAN (ID_TYP_DANE,DATUM_OD,PERCENTO,DATUM_DO) values ('20',to_date('01.01.11','DD.MM.RR'),'9',to_date('31.12.11','DD.MM.RR'));
Insert into DRABIKOVA8.D_DAN (ID_TYP_DANE,DATUM_OD,PERCENTO,DATUM_DO) values ('1',to_date('01.01.12','DD.MM.RR'),'11',to_date('31.12.13','DD.MM.RR'));
Insert into DRABIKOVA8.D_DAN (ID_TYP_DANE,DATUM_OD,PERCENTO,DATUM_DO) values ('2',to_date('01.01.12','DD.MM.RR'),'4',to_date('31.12.13','DD.MM.RR'));
Insert into DRABIKOVA8.D_DAN (ID_TYP_DANE,DATUM_OD,PERCENTO,DATUM_DO) values ('3',to_date('01.01.12','DD.MM.RR'),'15',to_date('31.12.13','DD.MM.RR'));
Insert into DRABIKOVA8.D_DAN (ID_TYP_DANE,DATUM_OD,PERCENTO,DATUM_DO) values ('4',to_date('01.01.12','DD.MM.RR'),'13',to_date('31.12.13','DD.MM.RR'));
Insert into DRABIKOVA8.D_DAN (ID_TYP_DANE,DATUM_OD,PERCENTO,DATUM_DO) values ('5',to_date('01.01.12','DD.MM.RR'),'32',to_date('31.12.13','DD.MM.RR'));
Insert into DRABIKOVA8.D_DAN (ID_TYP_DANE,DATUM_OD,PERCENTO,DATUM_DO) values ('6',to_date('01.01.12','DD.MM.RR'),'11',to_date('31.12.13','DD.MM.RR'));
Insert into DRABIKOVA8.D_DAN (ID_TYP_DANE,DATUM_OD,PERCENTO,DATUM_DO) values ('7',to_date('01.01.12','DD.MM.RR'),'51',to_date('31.12.13','DD.MM.RR'));
Insert into DRABIKOVA8.D_DAN (ID_TYP_DANE,DATUM_OD,PERCENTO,DATUM_DO) values ('8',to_date('01.01.12','DD.MM.RR'),'21',to_date('31.12.13','DD.MM.RR'));
Insert into DRABIKOVA8.D_DAN (ID_TYP_DANE,DATUM_OD,PERCENTO,DATUM_DO) values ('9',to_date('01.01.12','DD.MM.RR'),'4',to_date('31.12.13','DD.MM.RR'));
Insert into DRABIKOVA8.D_DAN (ID_TYP_DANE,DATUM_OD,PERCENTO,DATUM_DO) values ('10',to_date('01.01.12','DD.MM.RR'),'2',to_date('31.12.13','DD.MM.RR'));
Insert into DRABIKOVA8.D_DAN (ID_TYP_DANE,DATUM_OD,PERCENTO,DATUM_DO) values ('11',to_date('01.01.12','DD.MM.RR'),'11',to_date('31.12.13','DD.MM.RR'));
Insert into DRABIKOVA8.D_DAN (ID_TYP_DANE,DATUM_OD,PERCENTO,DATUM_DO) values ('12',to_date('01.01.12','DD.MM.RR'),'4',to_date('31.12.13','DD.MM.RR'));
Insert into DRABIKOVA8.D_DAN (ID_TYP_DANE,DATUM_OD,PERCENTO,DATUM_DO) values ('13',to_date('01.01.12','DD.MM.RR'),'22',to_date('31.12.13','DD.MM.RR'));
Insert into DRABIKOVA8.D_DAN (ID_TYP_DANE,DATUM_OD,PERCENTO,DATUM_DO) values ('14',to_date('01.01.12','DD.MM.RR'),'13',to_date('31.12.13','DD.MM.RR'));
Insert into DRABIKOVA8.D_DAN (ID_TYP_DANE,DATUM_OD,PERCENTO,DATUM_DO) values ('15',to_date('01.01.12','DD.MM.RR'),'3',to_date('31.12.13','DD.MM.RR'));
Insert into DRABIKOVA8.D_DAN (ID_TYP_DANE,DATUM_OD,PERCENTO,DATUM_DO) values ('16',to_date('01.01.12','DD.MM.RR'),'12',to_date('31.12.13','DD.MM.RR'));
Insert into DRABIKOVA8.D_DAN (ID_TYP_DANE,DATUM_OD,PERCENTO,DATUM_DO) values ('17',to_date('01.01.12','DD.MM.RR'),'11',to_date('31.12.13','DD.MM.RR'));
Insert into DRABIKOVA8.D_DAN (ID_TYP_DANE,DATUM_OD,PERCENTO,DATUM_DO) values ('18',to_date('01.01.12','DD.MM.RR'),'11',to_date('31.12.13','DD.MM.RR'));
Insert into DRABIKOVA8.D_DAN (ID_TYP_DANE,DATUM_OD,PERCENTO,DATUM_DO) values ('19',to_date('01.01.12','DD.MM.RR'),'21',to_date('31.12.13','DD.MM.RR'));
Insert into DRABIKOVA8.D_DAN (ID_TYP_DANE,DATUM_OD,PERCENTO,DATUM_DO) values ('20',to_date('01.01.12','DD.MM.RR'),'19',to_date('31.12.13','DD.MM.RR'));
Insert into DRABIKOVA8.D_DAN (ID_TYP_DANE,DATUM_OD,PERCENTO,DATUM_DO) values ('1',to_date('01.01.14','DD.MM.RR'),'10',null);
Insert into DRABIKOVA8.D_DAN (ID_TYP_DANE,DATUM_OD,PERCENTO,DATUM_DO) values ('2',to_date('01.01.14','DD.MM.RR'),'4',null);
Insert into DRABIKOVA8.D_DAN (ID_TYP_DANE,DATUM_OD,PERCENTO,DATUM_DO) values ('3',to_date('01.01.14','DD.MM.RR'),'10',null);
Insert into DRABIKOVA8.D_DAN (ID_TYP_DANE,DATUM_OD,PERCENTO,DATUM_DO) values ('4',to_date('01.01.14','DD.MM.RR'),'10',null);
Insert into DRABIKOVA8.D_DAN (ID_TYP_DANE,DATUM_OD,PERCENTO,DATUM_DO) values ('5',to_date('01.01.14','DD.MM.RR'),'30',null);
Insert into DRABIKOVA8.D_DAN (ID_TYP_DANE,DATUM_OD,PERCENTO,DATUM_DO) values ('6',to_date('01.01.14','DD.MM.RR'),'10',null);
Insert into DRABIKOVA8.D_DAN (ID_TYP_DANE,DATUM_OD,PERCENTO,DATUM_DO) values ('7',to_date('01.01.14','DD.MM.RR'),'48',null);
Insert into DRABIKOVA8.D_DAN (ID_TYP_DANE,DATUM_OD,PERCENTO,DATUM_DO) values ('8',to_date('01.01.14','DD.MM.RR'),'20',null);
Insert into DRABIKOVA8.D_DAN (ID_TYP_DANE,DATUM_OD,PERCENTO,DATUM_DO) values ('9',to_date('01.01.14','DD.MM.RR'),'4',null);
Insert into DRABIKOVA8.D_DAN (ID_TYP_DANE,DATUM_OD,PERCENTO,DATUM_DO) values ('10',to_date('01.01.14','DD.MM.RR'),'12',null);
Insert into DRABIKOVA8.D_DAN (ID_TYP_DANE,DATUM_OD,PERCENTO,DATUM_DO) values ('11',to_date('01.01.14','DD.MM.RR'),'12',null);
Insert into DRABIKOVA8.D_DAN (ID_TYP_DANE,DATUM_OD,PERCENTO,DATUM_DO) values ('12',to_date('01.01.14','DD.MM.RR'),'14',null);
Insert into DRABIKOVA8.D_DAN (ID_TYP_DANE,DATUM_OD,PERCENTO,DATUM_DO) values ('13',to_date('01.01.14','DD.MM.RR'),'20',null);
Insert into DRABIKOVA8.D_DAN (ID_TYP_DANE,DATUM_OD,PERCENTO,DATUM_DO) values ('14',to_date('01.01.14','DD.MM.RR'),'10',null);
Insert into DRABIKOVA8.D_DAN (ID_TYP_DANE,DATUM_OD,PERCENTO,DATUM_DO) values ('15',to_date('01.01.14','DD.MM.RR'),'6',null);
Insert into DRABIKOVA8.D_DAN (ID_TYP_DANE,DATUM_OD,PERCENTO,DATUM_DO) values ('16',to_date('01.01.14','DD.MM.RR'),'10',null);
Insert into DRABIKOVA8.D_DAN (ID_TYP_DANE,DATUM_OD,PERCENTO,DATUM_DO) values ('17',to_date('01.01.14','DD.MM.RR'),'10',null);
Insert into DRABIKOVA8.D_DAN (ID_TYP_DANE,DATUM_OD,PERCENTO,DATUM_DO) values ('18',to_date('01.01.14','DD.MM.RR'),'10',null);
Insert into DRABIKOVA8.D_DAN (ID_TYP_DANE,DATUM_OD,PERCENTO,DATUM_DO) values ('19',to_date('01.01.14','DD.MM.RR'),'20',null);
Insert into DRABIKOVA8.D_DAN (ID_TYP_DANE,DATUM_OD,PERCENTO,DATUM_DO) values ('20',to_date('01.01.14','DD.MM.RR'),'10',null);
--------------------------------------------------------
--  DDL for Index SYS_C00519037
--------------------------------------------------------

  CREATE UNIQUE INDEX "DRABIKOVA8"."SYS_C00519037" ON "DRABIKOVA8"."D_DAN" ("ID_TYP_DANE", "DATUM_OD") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "UCITELIA" ;
--------------------------------------------------------
--  Constraints for Table D_DAN
--------------------------------------------------------

  ALTER TABLE "DRABIKOVA8"."D_DAN" MODIFY ("ID_TYP_DANE" NOT NULL ENABLE);
 
  ALTER TABLE "DRABIKOVA8"."D_DAN" MODIFY ("DATUM_OD" NOT NULL ENABLE);
 
  ALTER TABLE "DRABIKOVA8"."D_DAN" MODIFY ("PERCENTO" NOT NULL ENABLE);
 
  ALTER TABLE "DRABIKOVA8"."D_DAN" ADD PRIMARY KEY ("ID_TYP_DANE", "DATUM_OD")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "UCITELIA"  ENABLE;
--------------------------------------------------------
--  Ref Constraints for Table D_DAN
--------------------------------------------------------

  ALTER TABLE "DRABIKOVA8"."D_DAN" ADD FOREIGN KEY ("ID_TYP_DANE")
	  REFERENCES "DRABIKOVA8"."D_TYP_DANE" ("ID_TYP_DANE") ENABLE;
