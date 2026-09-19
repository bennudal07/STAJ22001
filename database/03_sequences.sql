1- TOLLNER SEPSIS FORMU SEQUENCES

--1.1 Master Tablo Sequence
create sequence BD_MC_TOLLNER_SEPSIS_SEQ
minvalue 1
maxvalue 999999999999999999999999999
start with 121
increment by 1
cache 20;

-- 1.2 Detail Tablo Sequence
create sequence BD_MC_TOLLNER_SEPSIS_DET_SEQ
minvalue 1
maxvalue 999999999999999999999999999
start with 101
increment by 1
cache 20;


2- MODIFIYE SKOR SEQUENCES

-- 2.1 Master Tablo Sequence
create sequence BD_MC_MODIFIED_SCORE_SEQ
minvalue 1
maxvalue 9999999999999999999999999999
start with 4
increment by 1
nocache;

-- 2.2 Detail Tablo Sequence
create sequence BD_MC_MODIFIED_SCORE_DET_SEQ
minvalue 1
maxvalue 9999999999999999999999999999
start with 16
increment by 1
nocache;


3- EDINBURGH DEPRESYON OLCEGI SEQUENCES

-- 3.1 Master Tablo Sequence
create sequence BD_MC_EDINBURGH_DEP_SCALE_SEQ
minvalue 1
maxvalue 9999999999999999999999999999
start with 2
increment by 1
nocache;

-- 3.2 Detail Tablo Sequence
create sequence BD_MC_EDINBURGH_DEP_DET_SEQ
minvalue 1
maxvalue 9999999999999999999999999999
start with 25
increment by 1
nocache;
