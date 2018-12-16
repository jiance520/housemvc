create database house;
create table district
(
  ID   INT not NULL PRIMARY KEY,
  NAME VARCHAR(50) not null
) ;

create table street
(
  ID  INT PRIMARY KEY,
  NAME        VARCHAR(50),
  DISTRICT_ID INT
) ;

alter table street
  add constraint FK_D foreign key (DISTRICT_ID)
  references district (ID);

create table type2
(
  ID   INT primary key not null,
  NAME VARCHAR(20) not null
) ;

create table users
(
  ID        INT PRIMARY KEY not null AUTO_INCREMENT,
  NAME      VARCHAR(50),
  PASSWORD  VARCHAR(50),
  TELEPHONE VARCHAR(15),
  USERNAME  VARCHAR(50),
  ISADMIN   VARCHAR(5)
) ;

create table house
(
  ID          INT PRIMARY KEY not null AUTO_INCREMENT,
  USER_ID     INT,
  TYPE_ID     INT,
  TITLE       VARCHAR(50),
  DESCRIPTION VARCHAR(2000),
  PRICE       INT,
  PUBDATE     timestamp,
  FLOORAGE    INT,
  CONTACT     VARCHAR(100),
  STREET_ID   INT
) ;

alter table house
  add constraint FK_S foreign key (STREET_ID)
  references street (ID);
alter table house
  add constraint FK_T foreign key (TYPE_ID)
  references type2 (ID);
alter table house
  add constraint FK_U foreign key (USER_ID)
  references users (ID);
-------------------------------------------------------

insert into district (ID, NAME)
values (1001, '����');
insert into district (ID, NAME)
values (1002, '����');
insert into district (ID, NAME)
values (1003, 'ʯ��ɽ');
insert into district (ID, NAME)
values (1006, '����');
insert into district (ID, NAME)
values (1000, '��̨');
insert into district (ID, NAME)
values (1004, '����');
commit;

insert into street (ID, NAME, DISTRICT_ID)
values (1000, '֪��·', 1004);
insert into street (ID, NAME, DISTRICT_ID)
values (1001, '�йش���', 1004);
insert into street (ID, NAME, DISTRICT_ID)
values (1002, 'ѧԺ·', 1004);
insert into street (ID, NAME, DISTRICT_ID)
values (1003, '����·', 1006);
commit;

insert into type2 (ID, NAME)
values (1000, 'һ��һ��');
insert into type2 (ID, NAME)
values (1001, 'һ������');
insert into type2 (ID, NAME)
values (1002, '����һ��');
insert into type2 (ID, NAME)
values (1003, '��������');
insert into type2 (ID, NAME)
values (1004, '����һ��');
insert into type2 (ID, NAME)
values (1005, '��������');
insert into type2 (ID, NAME)
values (1006, '����һ��');
insert into type2 (ID, NAME)
values (1007, '��������');
insert into type2 (ID, NAME)
values (1008, '��������');
commit;

insert into users (ID, NAME, PASSWORD, TELEPHONE, USERNAME, ISADMIN)
values (1001, 'accp', 'accp', null, null, null);
insert into users (ID, NAME, PASSWORD, TELEPHONE, USERNAME, ISADMIN)
values (1002, 'jbit', 'jbit', null, null, null);
insert into users (ID, NAME, PASSWORD, TELEPHONE, USERNAME, ISADMIN)
values (1000, 'admin', 'admin', null, null, null);
insert into users (ID, NAME, PASSWORD, TELEPHONE, USERNAME, ISADMIN)
values (960, 'admin', '123456', null, null, null);
insert into users (ID, NAME, PASSWORD, TELEPHONE, USERNAME, ISADMIN)
values (977, 'accp5', 'accp5', null, null, null);
commit;

insert into house (ID, USER_ID, TYPE_ID, TITLE, DESCRIPTION, PRICE, PUBDATE, FLOORAGE, CONTACT, STREET_ID)
values (1000, 1000, 1000, '���˳���', '��װ�޼ҵ���ȫ', 8000, '2018-02-08', 90, '16888888888', 1000);
insert into house (ID, USER_ID, TYPE_ID, TITLE, DESCRIPTION, PRICE, PUBDATE, FLOORAGE, CONTACT, STREET_ID)
values (1001, 1000, 1001, '�÷���', '�Ͼӵ�����', 2000, '2018-02-08', 40, '010-88888888', 1001);
commit;
