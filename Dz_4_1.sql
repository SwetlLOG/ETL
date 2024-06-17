CREATE TABLE movies (
  Id INTEGER PRIMARY KEY,
  movies_type TEXT NOT NULL,
  director TEXT NOT NULL,
  year_of_issue DATE NOT NULL,
  length_in_minutes int8 NOT NULL,
  rate int8
);
select * from movies;
CREATE TABLE date_until_90(
CHECK(year_of_issue < '1990-01-01')) 
INHERITS (movies);
CREATE TABLE date_90_00(
CHECK(year_of_issue >= '1990-01-01' AND year_of_issue < '2000-01-01'))
INHERITS (movies);
CREATE TABLE date_00_10(
CHECK(year_of_issue >= '2000-01-01' AND year_of_issue < '2010-01-01'))
INHERITS (movies);
CREATE TABLE date_10_20(
CHECK(year_of_issue >= '2010-01-01' AND year_of_issue < '2020-01-01'))
INHERITS (movies);
CREATE TABLE date_after_20(
CHECK(year_of_issue >= '2020-01-01'))
INHERITS (movies);

CREATE TABLE film_lenght_less_40(
CHECK(length_in_minutes < 40)) 
INHERITS (movies);
CREATE TABLE film_lenght_40_90(
CHECK(length_in_minutes >= 40 and length_in_minutes < 90)) 
INHERITS (movies);
CREATE TABLE film_lenght_90_130(
CHECK(length_in_minutes >= 90 and length_in_minutes < 130)) 
INHERITS (movies);
CREATE TABLE film_lenght_more_130(
CHECK(length_in_minutes >= 130)) 
INHERITS (movies);

CREATE RULE date_until_90 as on insert to movies
where (year_of_issue < '1990-01-01')
do instead insert into date_until_90 VALUES (NEW.*);
CREATE RULE date_90_00 as on insert to movies
where (year_of_issue >= '1990-01-01' AND year_of_issue < '2000-01-01')
do instead insert into date_90_00 VALUES (NEW.*);
CREATE RULE date_00_10 as on insert to movies
where (year_of_issue >= '2000-01-01' AND year_of_issue < '2010-01-01')
do instead insert into date_00_10 VALUES (NEW.*);
CREATE RULE date_10_20 as on insert to movies
where (year_of_issue >= '2010-01-01' AND year_of_issue < '2020-01-01')
do instead insert into date_10_20 VALUES (NEW.*);
CREATE RULE date_after_20 as on insert to movies
where (year_of_issue > '2020-01-01')
do instead insert into date_after_20 VALUES (NEW.*);

CREATE RULE film_lenght_less_40 as on insert to movies
where (length_in_minutes < 40)
do instead insert into film_lenght_40 VALUES (NEW.*);
CREATE RULE film_lenght_40_90 as on insert to movies
where (length_in_minutes >= 40 and length_in_minutes < 90)
do instead insert into film_lenght_40_90 VALUES (NEW.*);
CREATE RULE film_lenght_90_130 as on insert to movies
where (length_in_minutes >= 90 and length_in_minutes < 130)
do instead insert into film_lenght_90_130 VALUES (NEW.*);
CREATE RULE film_lenght_more_130 as on insert to movies
where (length_in_minutes >= 130)
do instead insert into film_lenght_more_130 VALUES (NEW.*);


CREATE RULE rate_less_5 as on insert to movies
where (rate < 5)
do instead insert into rate_less_5 VALUES (NEW.*);
CREATE RULE rate_5_8 as on insert to movies
where (rate >= 5 and rate < 8)
do instead insert into rate_5_8 VALUES (NEW.*);
CREATE RULE rate_8_10 as on insert to movies
where (rate >= 8 and rate <= 10)
do instead insert into rate_8_10 VALUES (NEW.*);

INSERT INTO movies VALUES (1, 'drama', 'Cameron', '2000-02-01', 39, 4);
INSERT INTO movies VALUES (2, 'fantastic', 'Spilberg', '1993-01-01', 89, 5);
INSERT INTO movies VALUES (3, 'melodrama', 'Menshov', '1982-01-01', 95, 6);
INSERT INTO movies VALUES (4, 'fantastic', 'Cameron', '2011-01-01', 131, 7);
INSERT INTO movies VALUES (5, 'fantastic', 'Cameron', '2020-02-01', 120, 8);
INSERT INTO movies VALUES (6, 'drama', 'Cameron', '2003-02-01', 23, 9);
INSERT INTO movies VALUES (7, 'fantastic', 'Spilberg', '1994-01-01', 66, 10);
INSERT INTO movies VALUES (8, 'melodrama', 'Menshov', '1987-01-01', 97, 3);
INSERT INTO movies VALUES (9, 'fantastic', 'Cameron', '2012-01-01', 140, 5);
INSERT INTO movies VALUES (10, 'fantastic', 'Cameron', '2021-02-01', 120, 8);
INSERT INTO movies VALUES (11, 'drama', 'Cameron', '2007-02-01', 34, 9);
INSERT INTO movies VALUES (12, 'fantastic', 'Spilberg', '1996-01-01', 77, 7);
INSERT INTO movies VALUES (13, 'melodrama', 'Menshov', '1983-01-01', 120, 2);
INSERT INTO movies VALUES (14, 'fantastic', 'Cameron', '2015-01-01', 150, 5);
INSERT INTO movies VALUES (15, 'fantastic', 'Cameron', '2024-02-01', 120, 10);


select * from movies;
select * from date_until_90;
select * from date_90_00;
select * from date_00_10;
select * from date_10_20;
select * from date_after_20;
select * from duration_less_40;
select * from duration_40_90;
select * from duration_90_130;
select * from duration_more_130;
select * from rate_less_5;
select * from rate_5_8;
select * from rate_8_10;

INSERT INTO movies VALUES (16, 'fantastic', 'Cameron', '2024-02-01', 120, 11);
INSERT INTO movies VALUES (12, 'fantastic', 'Spilberg', '1996-01-01', 77, 12);

select * from movies;