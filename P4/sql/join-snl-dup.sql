--Test simple nested loop join

create table da (id integer, gender integer, name char(20), ptr double);
create table db (id integer, gender integer, name char(20), ptr double);
create table dc (id integer, gender integer, name char(20), ptr double);

--create data
insert into da (name, id, gender, ptr) values ('aaa', 0, 0, 1.8);
insert into da (name, id, gender, ptr) values ('bbb', 1, 0, 1.8);
insert into da (name, id, gender, ptr) values ('ccc', 2, 1, 1.8);
insert into da (name, id, gender, ptr) values ('ddd', 3, 1, 2.1);
insert into da (name, id, gender, ptr) values ('eee', 4, 1, 2.5);
insert into da (name, id, gender, ptr) values ('fff', 5, 0, 1.6);
insert into da (name, id, gender, ptr) values ('ggg', 6, 0, 1.7);
insert into da (name, id, gender, ptr) values ('hhh', 7, 1, 2.3);
insert into da (name, id, gender, ptr) values ('iii', 8, 0, 1.9);
insert into da (name, id, gender, ptr) values ('jjj', 9, 1, 2.3);
insert into da (name, id, gender, ptr) values ('kkk', 10, 0, 1.7);
insert into da (name, id, gender, ptr) values ('lll', 11, 0, 1.8);
insert into da (name, id, gender, ptr) values ('mmm', 12, 1, 2.3);

insert into db (name, id, gender, ptr) values ('nnn', 0, 0, 1.8);
insert into db (name, id, gender, ptr) values ('ooo', 1, 0, 1.8);
insert into db (name, id, gender, ptr) values ('ppp', 2, 1, 1.8);
insert into db (name, id, gender, ptr) values ('qqq', 3, 1, 2.1);
insert into db (name, id, gender, ptr) values ('rrr', 4, 1, 2.5);
insert into db (name, id, gender, ptr) values ('sss', 5, 0, 1.6);
insert into db (name, id, gender, ptr) values ('ttt', 6, 0, 1.7);
insert into db (name, id, gender, ptr) values ('uuu', 7, 1, 2.3);
insert into db (name, id, gender, ptr) values ('vvv', 8, 0, 1.9);
insert into db (name, id, gender, ptr) values ('www', 9, 1, 2.3);
insert into db (name, id, gender, ptr) values ('xxx', 10, 0, 1.7);
insert into db (name, id, gender, ptr) values ('yyy', 11, 0, 1.8);
insert into db (name, id, gender, ptr) values ('zzz', 12, 1, 2.3);

insert into dc (name, id, gender, ptr) values ('nnn', 0, 0, 1.8);
insert into dc (name, id, gender, ptr) values ('ooo', 1, 0, 1.8);
insert into dc (name, id, gender, ptr) values ('ppp', 2, 1, 1.8);
insert into dc (name, id, gender, ptr) values ('qqq', 3, 1, 2.1);
insert into dc (name, id, gender, ptr) values ('rrr', 4, 1, 2.5);
insert into dc (name, id, gender, ptr) values ('sss', 5, 0, 1.6);
insert into dc (name, id, gender, ptr) values ('ttt', 6, 0, 1.7);
insert into dc (name, id, gender, ptr) values ('uuu', 7, 1, 2.3);
insert into dc (name, id, gender, ptr) values ('vvv', 8, 0, 1.9);
insert into dc (name, id, gender, ptr) values ('www', 9, 1, 2.3);
insert into dc (name, id, gender, ptr) values ('xxx', 10, 0, 1.7);
insert into dc (name, id, gender, ptr) values ('yyy', 11, 0, 1.8);
insert into dc (name, id, gender, ptr) values ('zzz', 12, 1, 2.3);

-- Test on joins on duplicate tuples
-- The result is out of order

-- Project 7 attrs, filter attr appear in projection
-- Operator LT
-- Join on int
SELECT da.name, db.name, da.gender, db.gender, da.ptr, db.ptr FROM da, db WHERE da.gender < db.gender;
-- Join on double
SELECT da.name, db.name, da.gender, db.gender, da.ptr, db.ptr FROM da, db WHERE da.ptr < db.ptr;
-- Join on string
SELECT da.name, dc.name, da.gender, dc.gender, da.ptr, dc.ptr FROM da, dc WHERE da.name < dc.name;

-- Project 5 attrs, filter attr doesn't appear in projection
-- Operator LTE
-- Join on int
SELECT da.name, db.name, da.ptr, db.ptr FROM da, db WHERE da.gender <= db.gender;
-- Join on double
SELECT da.name, db.name, da.gender, db.gender FROM da, db WHERE da.ptr <= db.ptr;
-- Join on string
SELECT da.gender, dc.gender, da.ptr, dc.ptr FROM da, dc WHERE da.name <= dc.name;

-- Project 3 attrs, only one side's info appears
-- Operator GTE
-- Join on int
SELECT da.name, db.name, da.ptr, db.ptr, da.gender FROM da, db WHERE da.gender >= db.gender;
-- Join on double
SELECT da.name, db.name, da.gender, db.gender, db.ptr FROM da, db WHERE da.ptr >= db.ptr;
-- Join on string
SELECT da.gender, dc.gender, da.ptr, dc.ptr, dc.name FROM da, dc WHERE da.name >= dc.name;

-- Project 3 attrs, only one side's info appears
-- Operator GT
-- Join on int
SELECT da.name, db.name, da.ptr, db.ptr, db.gender FROM da, db WHERE da.gender > db.gender;
-- Join on double
SELECT da.name, db.name, da.gender, db.gender, da.ptr FROM da, db WHERE da.ptr > db.ptr;
-- Join on string
SELECT da.gender, dc.gender, da.ptr, dc.ptr, da.name FROM da, dc WHERE da.name > dc.name;

-- Project 6 random attrs
-- Operator NE
-- Join on int
SELECT da.name, db.name, da.id, da.ptr, db.ptr, db.gender FROM da, db WHERE da.gender > db.gender;
-- Join on double
SELECT da.name, db.name, db.id, da.gender, db.gender, da.ptr FROM da, db WHERE da.ptr > db.ptr;
-- Join on string
SELECT da.gender, dc.gender, da.id, da.ptr, dc.ptr, da.name FROM da, dc WHERE da.name > dc.name;

DROP TABLE da;
DROP TABLE db;
