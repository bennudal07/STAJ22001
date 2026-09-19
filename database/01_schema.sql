1.1- BD_MC_TOLLNER_SEPSIS 

-- Create table
create table BD_MC_TOLLNER_SEPSIS
(
  id     INTEGER not null,
  com_id INTEGER not null
)
tablespace BYZTS
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
-- Create/Recreate primary, unique and foreign key constraints 
alter table BD_MC_TOLLNER_SEPSIS
  add constraint PK_BD_MC_TOLLNER_SEPSIS primary key (ID)
  using index 
  tablespace BYZTS
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
alter table BD_MC_TOLLNER_SEPSIS
  add constraint FK_BD_MC_TOLLNER_SEPSIS_COM foreign key (COM_ID)
  references CONNECTIONS_OF_MEDCARD (ID)
  disable
  novalidate;

1.2- BD_MC_TOLLNER_SEPSIS_DET

-- Create table
create table BD_MC_TOLLNER_SEPSIS_DET
(
  id                             INTEGER not null,
  mts_id                         INTEGER,
  ctime                          DATE,
  cuser                          VARCHAR2(12),
  process_time                   DATE,
  change_in_skin_color           NUMBER(1),
  peripheral_circulation_disorde NUMBER(1),
  hypotony                       NUMBER(1),
  bradicardy                     NUMBER(1),
  apnea                          NUMBER(1),
  respiratory_distress           NUMBER(1),
  hepatomegali                   NUMBER(1),
  gastrointestinal_symptom       NUMBER(1),
  leukocide_number               NUMBER(1),
  left_shift                     NUMBER(1),
  thombocytopenia                NUMBER(1),
  metabolic_acidosis             NUMBER(1),
  sepsis_status                  VARCHAR2(25),
  sepsis_score                   NUMBER(2),
  nurse_id                       INTEGER
)
tablespace BYZTS
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
-- Add comments to the columns 
comment on column BD_MC_TOLLNER_SEPSIS_DET.mts_id
  is 'TOLLNER SEPSIS TABLOSU BAGLANTI ID';
comment on column BD_MC_TOLLNER_SEPSIS_DET.ctime
  is 'OLUSTURMA ZAMANI';
comment on column BD_MC_TOLLNER_SEPSIS_DET.cuser
  is 'OLUSTURAN KULLANICI';
comment on column BD_MC_TOLLNER_SEPSIS_DET.process_time
  is 'ISLEM ZAMANI';
comment on column BD_MC_TOLLNER_SEPSIS_DET.change_in_skin_color
  is 'DERI RENGINDE DEGISIKLIK YOK=0 ORTA=2 BELIRGIN=4';
comment on column BD_MC_TOLLNER_SEPSIS_DET.peripheral_circulation_disorde
  is 'PERIFERIK DOLANIM BOZUKLUGU DEGERI YOK=0 BOZUK=2 BELIRGIN=3';
comment on column BD_MC_TOLLNER_SEPSIS_DET.hypotony
  is 'HIPOTONI DEGERI YOK=0 ORTA=1 BELIRGIN=2';
comment on column BD_MC_TOLLNER_SEPSIS_DET.bradicardy
  is 'BRADIKARDI DEGERI YOK=0 VAR=1';
comment on column BD_MC_TOLLNER_SEPSIS_DET.apnea
  is 'APNE DEGERI YOK=0 VAR=1';
comment on column BD_MC_TOLLNER_SEPSIS_DET.respiratory_distress
  is 'RESPIRATUAR DISTRES DEGERI YOK=0 VAR=1';
comment on column BD_MC_TOLLNER_SEPSIS_DET.hepatomegali
  is 'HEPATOMEGALI DEGERI YOK=0 (>4 cm)=1';
comment on column BD_MC_TOLLNER_SEPSIS_DET.gastrointestinal_symptom
  is 'GASTROINTESTINAL BULGU DEGERI YOK=0 VAR=1';
comment on column BD_MC_TOLLNER_SEPSIS_DET.leukocide_number
  is 'LUKOSIT SAYISI NORMAL=0 LOKOSITOZ=1 LOKOPENI=3';
comment on column BD_MC_TOLLNER_SEPSIS_DET.left_shift
  is 'SOLA KAYMA DEGERI YOK=0 ORTA=2 BELIRGIN=3';
comment on column BD_MC_TOLLNER_SEPSIS_DET.thombocytopenia
  is 'TROMBOSITOPENI DEGERI YOK=0 VAR=2';
comment on column BD_MC_TOLLNER_SEPSIS_DET.metabolic_acidosis
  is 'METABOLIK ASIDOZ DEGERI YOK=0 (>7.2)=1 (<7.2)=2';
comment on column BD_MC_TOLLNER_SEPSIS_DET.sepsis_status
  is 'SEPSIS DURUMU ( < 5 = SEPSIS YOK ) (5-10 SEPSIS OLASILIGI ) ( >10 SEPSIS TANISI )';
comment on column BD_MC_TOLLNER_SEPSIS_DET.sepsis_score
  is 'SEPSIS PUANI';
comment on column BD_MC_TOLLNER_SEPSIS_DET.nurse_id
  is 'HEMSIRE ID';
-- Create/Recreate primary, unique and foreign key constraints 
alter table BD_MC_TOLLNER_SEPSIS_DET
  add constraint PK_BD_MC_TOLLNER_SEPSIS_DET primary key (ID)
  using index 
  tablespace BYZTS
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
alter table BD_MC_TOLLNER_SEPSIS_DET
  add constraint FK_BD_TOLLNER_SEPSIS_DET_MTS foreign key (MTS_ID)
  references BD_MC_TOLLNER_SEPSIS (ID) on delete cascade;


2.1- BD_MC_MODIFIED_SCORE

-- Create table
create table BD_MC_MODIFIED_SCORE
(
  id     INTEGER not null,
  com_id INTEGER
)
tablespace BYZTS
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
-- Create/Recreate primary, unique and foreign key constraints 
alter table BD_MC_MODIFIED_SCORE
  add constraint PK_BD_MC_MODIFIED_SCORE primary key (ID)
  using index 
  tablespace BYZTS
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
alter table BD_MC_MODIFIED_SCORE
  add constraint FK_BD_MC_MOD_SCORE_COM foreign key (COM_ID)
  references CONNECTIONS_OF_MEDCARD (ID);


2.2- BD_MC_MODIFIED_SCORE_DETAIL

-- Create table
create table BD_MC_MODIFIED_SCORE_DETAIL
(
  id                  INTEGER not null,
  ms_id               INTEGER not null,
  ctime               DATE not null,
  process_time        DATE not null,
  cuser               VARCHAR2(12) not null,
  level_consciousness NUMBER(4),
  activity            NUMBER(4),
  respiratory         NUMBER(4),
  spo2                NUMBER(4),
  blood_pressure      NUMBER(4),
  pulse               NUMBER(4),
  mas_score           NUMBER(2)
)
tablespace BYZTS
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
-- Add comments to the columns 
comment on column BD_MC_MODIFIED_SCORE_DETAIL.ms_id
  is 'MODIFIYE SKOR TABLOSU ID';
comment on column BD_MC_MODIFIED_SCORE_DETAIL.ctime
  is 'OLUSTURMA ZAMANI';
comment on column BD_MC_MODIFIED_SCORE_DETAIL.process_time
  is 'ISLEM ZAMANI';
comment on column BD_MC_MODIFIED_SCORE_DETAIL.cuser
  is 'OLUSTURAN KISI';
comment on column BD_MC_MODIFIED_SCORE_DETAIL.level_consciousness
  is 'BILINC DUZEYI';
comment on column BD_MC_MODIFIED_SCORE_DETAIL.activity
  is 'AKTIVITE';
comment on column BD_MC_MODIFIED_SCORE_DETAIL.respiratory
  is 'SOLUNUM';
comment on column BD_MC_MODIFIED_SCORE_DETAIL.spo2
  is 'SpO2';
comment on column BD_MC_MODIFIED_SCORE_DETAIL.blood_pressure
  is 'KAN BASINCI';
comment on column BD_MC_MODIFIED_SCORE_DETAIL.pulse
  is 'NABIZ';
comment on column BD_MC_MODIFIED_SCORE_DETAIL.mas_score
  is 'MAS SKORU';
-- Create/Recreate primary, unique and foreign key constraints 
alter table BD_MC_MODIFIED_SCORE_DETAIL
  add constraint PK_BD_MC_MODIFIED_SCORE_DETAIL primary key (ID)
  using index 
  tablespace BYZTS
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
alter table BD_MC_MODIFIED_SCORE_DETAIL
  add constraint FK_BD_MC_MODIFIED_SCORE_DETAIL foreign key (MS_ID)
  references BD_MC_MODIFIED_SCORE (ID);


3.1- BD_MC_EDINBURGH_DEP_SCALE

-- Create table
create table BD_MC_EDINBURGH_DEP_SCALE
(
  id     INTEGER not null,
  com_id INTEGER
)
tablespace BYZTS
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
-- Create/Recreate primary, unique and foreign key constraints 
alter table BD_MC_EDINBURGH_DEP_SCALE
  add constraint PK_BD_MC_EDINBURGH_DEP_SCALE primary key (ID)
  using index 
  tablespace BYZTS
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
alter table BD_MC_EDINBURGH_DEP_SCALE
  add constraint FK_BD_MC_EDS_COM foreign key (COM_ID)
  references CONNECTIONS_OF_MEDCARD (ID);


3.2- BD_MC_EDINBURGH_DEP_SCALE_DET

-- Create table
create table BD_MC_EDINBURGH_DEP_SCALE_DET
(
  id                        INTEGER not null,
  eds_id                    INTEGER not null,
  ctime                     DATE not null,
  process_time              DATE not null,
  cuser                     VARCHAR2(12) not null,
  laugh_funny_things        NUMBER(4),
  look_future_hopefully     NUMBER(4),
  bad_things_blame_herself  NUMBER(4),
  feel_distressed_anxious   NUMBER(4),
  feel_fear_panic           NUMBER(4),
  everything_getting_harder NUMBER(4),
  feel_sad_hard_sleep       NUMBER(4),
  feel_sad_depressed        NUMBER(4),
  feel_sad_cry              NUMBER(4),
  think_hurt_myself         NUMBER(4),
  feel_sad_want_cry         NUMBER(4),
  nurse_id                  INTEGER,
  edinburgh_score           NUMBER(2),
  note                      VARCHAR2(100),
  date_birth                DATE
)
tablespace BYZTS
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
-- Add comments to the columns 
comment on column BD_MC_EDINBURGH_DEP_SCALE_DET.id
  is 'DETAY ID';
comment on column BD_MC_EDINBURGH_DEP_SCALE_DET.eds_id
  is 'EDINBURGH POSTPARTUM DEPRESYON OLCEGI MASTER ID';
comment on column BD_MC_EDINBURGH_DEP_SCALE_DET.ctime
  is 'OLUSTURMA ZAMANI';
comment on column BD_MC_EDINBURGH_DEP_SCALE_DET.process_time
  is 'ISLEM ZAMANI';
comment on column BD_MC_EDINBURGH_DEP_SCALE_DET.cuser
  is 'OLUSTURAN KULLANICI';
comment on column BD_MC_EDINBURGH_DEP_SCALE_DET.laugh_funny_things
  is 'GULEBILIYOR VE OLAYLARIN KOMIK TARAFINI GOREBILIYORUM';
comment on column BD_MC_EDINBURGH_DEP_SCALE_DET.look_future_hopefully
  is 'GELECEGE HEVESLE BAKIYORUM';
comment on column BD_MC_EDINBURGH_DEP_SCALE_DET.bad_things_blame_herself
  is 'BIR SEYLER KOTU GITTIGINDE GEREKSIZ YERE KENDIMI SUCLUYORUM';
comment on column BD_MC_EDINBURGH_DEP_SCALE_DET.feel_distressed_anxious
  is 'NEDENSIZ YERE KENDIMI SIKINTILI YA DA ENDISELI HISSEDIYORUM';
comment on column BD_MC_EDINBURGH_DEP_SCALE_DET.feel_fear_panic
  is 'IYI BIR NEDENI OLMADIGI HALDE KORKUYOR YA DA PANIKLIYORUM';
comment on column BD_MC_EDINBURGH_DEP_SCALE_DET.everything_getting_harder
  is 'HER SEY GIDEREK SIRTIMA YUKLENIYOR';
comment on column BD_MC_EDINBURGH_DEP_SCALE_DET.feel_sad_hard_sleep
  is 'OYLESINE MUTSUZUM KI UYUMAKTA ZORLANIYORUM';
comment on column BD_MC_EDINBURGH_DEP_SCALE_DET.feel_sad_depressed
  is 'KENDIMI UZUNTULU YA DA COKKUN HISSEDIYORUM';
comment on column BD_MC_EDINBURGH_DEP_SCALE_DET.feel_sad_cry
  is 'OYLESINE MUTSUZUM KI AGLIYORUM';
comment on column BD_MC_EDINBURGH_DEP_SCALE_DET.think_hurt_myself
  is 'KENDIME ZARAR VERME DUSUNCESININ AKLIMA GELDIGI OLDU';
comment on column BD_MC_EDINBURGH_DEP_SCALE_DET.feel_sad_want_cry
  is 'OYLESINE MUTSUZUM KI ICIMDEN AGLAMAK GELIYOR VEYA AGLIYORUM';
comment on column BD_MC_EDINBURGH_DEP_SCALE_DET.nurse_id
  is 'HEMSIRE ID';
comment on column BD_MC_EDINBURGH_DEP_SCALE_DET.edinburgh_score
  is 'EDINBURGH SKORU';
comment on column BD_MC_EDINBURGH_DEP_SCALE_DET.note
  is 'NOT';
comment on column BD_MC_EDINBURGH_DEP_SCALE_DET.date_birth
  is 'DOGUM YAPTIGI TARIH';
-- Create/Recreate primary, unique and foreign key constraints 
alter table BD_MC_EDINBURGH_DEP_SCALE_DET
  add constraint PK_BD_MC_EDINBURGH_DEP_DET primary key (ID)
  using index 
  tablespace BYZTS
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
alter table BD_MC_EDINBURGH_DEP_SCALE_DET
  add constraint FK_BD_MC_EDINBURGH_DEP_DET foreign key (EDS_ID)
  references BD_MC_EDINBURGH_DEP_SCALE (ID);
