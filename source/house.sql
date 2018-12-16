/*
drop table DISTRICT cascade constraints ;
drop table STREET cascade constraints ;
drop table TYPE2 cascade constraints ;
drop table HOUSE cascade constraints ;
drop table USERS cascade constraints ;
*/
create table DISTRICT
(
  ID   NUMBER not NULL PRIMARY KEY,
  NAME VARCHAR2(50) not null
) ;

create table STREET
(
  ID  NUMBER PRIMARY KEY,
  NAME        VARCHAR2(50),
  DISTRICT_ID NUMBER
) ;

alter table STREET
  add constraint FK_D foreign key (DISTRICT_ID)
  references DISTRICT (ID);

create table TYPE2
(
  ID   NUMBER primary key not null,
  NAME VARCHAR2(20) not null
) ;

create table USERS
(
  ID        NUMBER PRIMARY KEY not null,
  NAME      VARCHAR2(50),
  PASSWORD  VARCHAR2(50),
  TELEPHONE VARCHAR2(15),
  USERNAME  VARCHAR2(50),
  ISADMIN   VARCHAR2(5)
) ;

create table HOUSE
(
  ID          NUMBER PRIMARY KEY not null,
  USER_ID     NUMBER,
  TYPE_ID     NUMBER,
  TITLE       NVARCHAR2(50),
  DESCRIPTION NVARCHAR2(2000),
  PRICE       NUMBER,
  PUBDATE     DATE,
  FLOORAGE    NUMBER,
  CONTACT     VARCHAR2(100),
  STREET_ID   NUMBER
) ;

alter table HOUSE
  add constraint FK_S foreign key (STREET_ID)
  references STREET (ID);
alter table HOUSE
  add constraint FK_T foreign key (TYPE_ID)
  references TYPE2 (ID);
alter table HOUSE
  add constraint FK_U foreign key (USER_ID)
  references USERS (ID);
-------------------------------------------------------

insert into DISTRICT (ID, NAME)
values (1001, '东城');
insert into DISTRICT (ID, NAME)
values (1002, '西城');
insert into DISTRICT (ID, NAME)
values (1003, '石景山');
insert into DISTRICT (ID, NAME)
values (1006, '朝阳');
insert into DISTRICT (ID, NAME)
values (1000, '丰台');
insert into DISTRICT (ID, NAME)
values (1004, '海淀');
commit;

insert into STREET (ID, NAME, DISTRICT_ID)
values (1000, '知春路', 1004);
insert into STREET (ID, NAME, DISTRICT_ID)
values (1001, '中关村大街', 1004);
insert into STREET (ID, NAME, DISTRICT_ID)
values (1002, '学院路', 1004);
insert into STREET (ID, NAME, DISTRICT_ID)
values (1003, '朝阳路', 1006);
commit;

insert into TYPE2 (ID, NAME)
values (1000, '一室一厅');
insert into TYPE2 (ID, NAME)
values (1001, '一室两厅');
insert into TYPE2 (ID, NAME)
values (1002, '两室一厅');
insert into TYPE2 (ID, NAME)
values (1003, '两室两厅');
insert into TYPE2 (ID, NAME)
values (1004, '三室一厅');
insert into TYPE2 (ID, NAME)
values (1005, '三室两厅');
insert into TYPE2 (ID, NAME)
values (1006, '四室一厅');
insert into TYPE2 (ID, NAME)
values (1007, '四室两厅');
insert into TYPE2 (ID, NAME)
values (1008, '四室三厅');
commit;

insert into USERS (ID, NAME, PASSWORD, TELEPHONE, USERNAME, ISADMIN)
values (1001, 'accp', 'accp', null, null, null);
insert into USERS (ID, NAME, PASSWORD, TELEPHONE, USERNAME, ISADMIN)
values (1002, 'jbit', 'jbit', null, null, null);
insert into USERS (ID, NAME, PASSWORD, TELEPHONE, USERNAME, ISADMIN)
values (1000, 'admin', 'admin', null, null, null);
insert into USERS (ID, NAME, PASSWORD, TELEPHONE, USERNAME, ISADMIN)
values (60, 'admin', '123456', null, null, null);
insert into USERS (ID, NAME, PASSWORD, TELEPHONE, USERNAME, ISADMIN)
values (77, 'accp5', 'accp5', null, null, null);
commit;

insert into HOUSE (ID, USER_ID, TYPE_ID, TITLE, DESCRIPTION, PRICE, PUBDATE, FLOORAGE, CONTACT, STREET_ID)
values (1000, 1000, 1000, '便宜出租', '精装修家电齐全', 8000, to_date('01-08-2012', 'dd-mm-yyyy'), 90, '16888888888', 1000);
insert into HOUSE (ID, USER_ID, TYPE_ID, TITLE, DESCRIPTION, PRICE, PUBDATE, FLOORAGE, CONTACT, STREET_ID)
values (1001, 1000, 1001, '好房子', '蜗居地下室', 2000, to_date('02-08-2012', 'dd-mm-yyyy'), 40, '010-88888888', 1001);
commit;

---create sequence house_seq ;

---select house_seq.nextval from dual ;
----------------------------------------------------
---select * from  DISTRICT  ;
---select * from  STREET  ;
---select * from  TYPE2  ;
---select * from  HOUSE  ;
---select * from  USERS ;
