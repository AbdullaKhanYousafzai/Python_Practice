-- creating and deleting databases
show databases;
create database amazon;
create database school30;
show databases;
select database();
use amazon;
select database();
show tables;
drop database amazon;
show databases;
select database();
use school30;
select database();
show tables;
drop database school30;
show databases;

-- creating and deleting tables

create database instamart;

use instamart;
select database();

create table product(
pcode int,
Item varchar(25),
price float,
quanity int,
DOE date,
company char
);


show tables;


create table customer(
id int,
name varchar(250),
email varchar(230),
mobile bigint,
DOB date,
LastLoin datetime,
address varchar(255),
last_order varchar(260)
);

show tables;

drop table product;

show tables;
describe customer;

-- 09-04-2025

select database();
create database tgc09;
select database();
use tgc09;

create table students(
rollNo int,
name varchar(255)
);

show tables;
describe students;

-- alter
alter table students add class int;
alter table students add column age varchar(255);
alter table students modify column age int;
alter table students drop class;
alter table students rename column name to fullname;
alter table students rename to teachers;
describe teachers;


drop table teachers;

show tables;
create table students(
id int not null unique primary key,
name varchar(255) default "unknown",
age int not null check(age>=5),
class int not null
);

create table marks(
sid int primary key,
python int,
msql int,
maths int
);

describe students;

create table sdetails(
rollNo int auto_increment,
address varchar(255),
mobile int,
email varchar(255),
foreign key(rollNo) references students(id),
foreign key(rollNo) references marks(sid)
on delete cascade
on update cascade
);


show tables;

describe students;
describe sdetails;
describe marks;

drop table sdetails;
drop table marks;


-- Insert

use tgc09;

select database();
show tables;

describe students;

-- Approch 1 
insert into students
(id, name, age, class)
values
(1, 'mohit', 18, 12),
(2, 'rohit', 17, 11),
(3, 'jatin', 14, 8);

-- DQl Select

select * from students;

-- Approch 2

insert into students
values
(4, 'shweta', 19,12),
(5, 'prateek', 14, 8),
(6, 'vishnu', 12, 7),
(7, 'mahesh', 17, 10),
(8, 'aparna', 16, 11),
(9, 'jatin', 17, 11),
(10, 'rohit',13,8);

select * from students;


-- Select

select * from students;
select name from students;
select age, name from students;
select class, id, age, name from students;


-- distinct
select name from students;
select distinct name from students;
select * from students;
select distinct name , class from students;

-- Limit, offset or orderby

select * from students;
select * from students limit 2;
select * from students limit 4;
select * from students limit 2 offset 2;
select * from students limit 3 offset 5;
select * from students;
select * from students order by class;
select * from students order by class asc;
select * from students order by class desc;
select * from students order by class, age;
select * from students order by class, age desc;

-- Where Clause

select * from students where id = 5;
select * from students where name = 'rohit';
select * from students where age >= 17;
select * from students  where class = 12;

-- Logical Operators 
-- AND, OR, NOT, IN, Betweem, Like, 

select * from students where class>=11 and age>17;
select * from students where class>=11 or age>17;
select * from students where name = "jatin";
select * from students where not name = "jatin";
select * from students where age between 13 and 17;  

-- Like - for pattern matching
-- wildcards : 
-- % - n characters
-- _ - single character

select database();
use tgc09;

select database();
select * from students where name = 'rohit';
select * from students where not name = 'rohit';
select  * from students where name like "j%";
select * from students where name like "%a";
select * from students where name like "p%";
select * from students where name like "%i_";
select * from students where name like "_p%";
select * from students where name like "%ti%";

-- update , delete

select * from students;

update students set age = 20 where id = 2;

update students set name = "pooja",
age = 25, class = 10 where id = 1;

update students set age = 15;

set sql_safe_updates = 0;

select * from students;
delete from students where id = 3;
delete from students where id = 5;
delete from students;

-- TCL 
-- commit
-- rollback
-- savepoint

select * from students;
update students set name = "ankit", age = 20, class = 12 where id = 3;

start transaction;
select * from students;
update students set name = "prateek" , class = 12 where id = 2;
delete from students where id = 4;
update students set name = "gautam";
delete from students;

-- commit -- for saving
rollback;
select * from students;

-- savepoint
select * from students;
begin;
select * from students;
savepoint point1;

update students set name = 'clerk', age = 60, class = 15 where id = 3;
select * from students;
savepoint point2;
delete from students where id in (4,5,6);
select * from students;
savepoint point3;
update students set age = 100;
select * from students;
savepoint point4;
delete from students;
select * from students;
savepoint point5;

-- commit 
rollback to point3;
select * from students;
rollback to point2;
select * from students;
commit;
select * from students;
rollback;


-- Function in mysql
-- Aggregate Functions -- single value 
-- min, max, count, sum, avg

select database();
use tgc09;

show tables;

select * from students;

select min(age) from students;
select max(class) from students;

-- allias in mysql
-- as
select max(class) as maximum_age from students;
select count(*) as total from students;
select avg(age) average_age from students;
select sum(age) total from students;

-- string functions

select length(name) from students;
select length("i love mysql");

select concat("Hello " , "World");
select concat("Mr." ,name) from students;
select upper(name) from students;
select lower("MOBILE");
select substr("abcdefgh", 3, 3);
select substr("I love Mysql", 3, 4);
select replace("I love mysql", "mysql", "python");
select trim("   hello                  ");
select trim("               Machine                     learning                    ");
select trim("deep            learning");

-- Numeric Functions

select abs(56);
select abs(-89);
select floor(89.8996569);
select ceil(2.36598);
select round(5.2);
select round(6.71236568745, 4);
select mod(12 , 9);
select mod(15 , 10);
select power(2, 3);
select pow(5, 3);
select sqrt(49);
select sqrt(81);
select sqrt(17); 

-- date time functions
select now();
select current_date();
select curtime();
select date_add("2025-05-20", interval 10 day);
select date_add("2025-05-20", interval 2 month);
select date_add("2025-05-20", interval 2 year);
select datediff("2025-07-10", "2025-05-15");
select day("2025-04-30");
select month("2025-04-30");
select year("2025-04-30");


-- Control Flow 
-- if -  it is used for single condition
-- case - for multiple conditions

select if((4>2), "True", "False");

select if(15>20, "Yes", "No");

use tgc09;

show tables;
select * from students;

select *,
if(age>=18, "Senior", "Teen") as age_status from students;

-- nested if
-- whenever we write if inside if that is known as nested if

select *, if(age>50, "old age", if(age>=15, "middle age", "kid")) from students;


-- case

select *, 
case 
	when age>50 then "senior"
    when age >= 17 then "middle"
    when age >= 14 then "teen"
    else "kid" 
end as age_status
from students;


select *,
case
	when class = 12 then "its twelve"
    when class = 11 then "its eleven"
    when class = 10 then "its ten"
    else "other class"
end as class_status
from students;


-- group by

select * from students;

-- 1 we never fetch * in group by

select * from students group by class;

select class from students group by class;

-- 2. we always use aggregate functions in group by
select class, count(class) from students group by class;

-- 3. we always use having having in group by 
select class, count(class) as total from students group by class where total>=2;

select class, count(class) as total from students group by class having total>=2;



-- sql joins

use tgc09;
show tables;
select * from students;

create table marks(
id int not null,
subject varchar(255) not null,
marks int
);

describe marks;
SET FOREIGN_KEY_CHECKS=0;

drop table marks;
drop table sdetails;

insert into marks
(id, subject, marks)
values
(9, 'maths', 89),
(2, 'english', 75),
(1, 'maths', 91),
(4, 'science', 97),
(10, 'computer', 83),
(1, 'english', 55),
(3,'maths',58);

select * from marks;
select * from students;

-- joins

select name, age, subject, marks
from students
join marks
on students.id = marks.id;

select  name, age, subject, marks
from students
inner join marks
on students.id = marks.id;

select name, age, class, subject, marks
from students
left join marks
on students.id = marks.id;

select name, age, class, subject, marks
from students
right join marks
on students.id = marks.id; 

select name, age, class, subject, marks
from students
left join marks
on students.id = marks.id
union
select name, age, class, subject, marks
from students
right join marks
on students.id = marks.id; 

select name, age, class, subject, marks
from students
left join marks
on students.id = marks.id
union all
select name, age, class, subject, marks
from students
right join marks
on students.id = marks.id; 

-- cross 

select name, age, class , subject, marks
from students
cross join marks;


select s.id,name, age, subject, marks
from students as s
inner join marks m
on s.id = m.id;


-- self

select s1.name, s2.age, s1.class
from students as s1
join students as s2
on s1.id = s2.id;


-- DCL
-- grant, revoke 

create user "ankit@123";
create user "pooja@123" identified by "mysql";
show grants for "ankit@123";
grant select, update, delete, drop, alter on tgc09.* to "ankit@123";
grant update, delete on cvdb.pdf_profile to "pooja@123";
show grants for "pooja@123";
revoke select, delete, drop, alter on tgc09.* from "ankit@123";
revoke update on cvdb.pdf_profile from "pooja@123";
drop user "pooja@123";
drop user "ankit@123";

create database test_db;


SHOW GRANTS FOR 'root'@'localhost';











