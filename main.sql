create database db01;
use db01;
create table  student(
id int primary key,
name varchar(50)
);
drop database db01;
create database college;
use college;
create table student(
id int primary key,
name varchar(50),
age int not null
);
insert into student values(1,"sai",20); -- colunm_name datatype constraint
select * from student;
-- data types 
-- char , char(50) , can store char of fixed length - 256 size
-- varchar , varchar(50) , can store char upto give length -256 size
-- blob , blob(1000) , can store large binary object , big string  
-- int  ,int,can store number
-- tinyint
-- bigint 
-- bit , bit(2) , 0,1
-- float ,decimal
-- double , decimal
--  boolean , true false
-- date , yyyy-mm- dd
-- year 
-- negative and positive numbers are called signed numbers 0-255
-- only positve numbers are called unsigned numbers 1-128(+ ,-)
-- crud - create remove update delete
-- tyoes of sql commands
--  ddl ->> data defination language    : create , alter , rename , truncate , drop
--  dql -->> data query language : select
-- dml -->> data manupulation language : insert , update ,delete
-- dcl -->> data control language : grant and revoke permission to users
-- tcl -->> transaction control language : start transcition , commit ,rollback
-- database releated qureies
-- create database db_name;
--  create database if not exists db_name;
-- drop database db_name;
-- drop datebase if exists db_name;
-- show databases;
-- show tables;
-- table related queries
-- create table tb_name(col_name datatyoe constraints, ...);
-- select and view all columns --> select * from tb_name;{dql}
select * from student;
-- insert into tb_name(col_name ,col_name)values(col v ,col_v) (, )....);
insert into student
(id ,name , age)
values
(4 ,"saikiran" ,29);
-- keys
-- primary key --> rule{ not null , unique value}
-- forign key -->a key which is in common with two or more tables and the key is primary key in one table which is used as forign key in other table
-- constraints
-- used to specify rules for data in table
-- 1> not null 2> primary key 3> unique
-- combination primary key --> primary key (col_1 ,col_2)
-- cust_id int ,
-- forign key (cust_id) references customer(id)
-- dafault value --> col_name d_type default value --> salary int default 5000
create table employee(
emp_id int ,
emp_salary int default 50000,
foreign key (emp_id) references student(id)

);

insert into employee values (1 , 10000); 
insert into employee (emp_id) values (4); 
select * from employee;
-- > check constraint


-- to change foreign key data through child table
-- create table tablename(
-- id int primary key );
-- use update cascade and delete cascade in child to update and delete





-- alter 
-- add column
-- alter tb_name add column col_name d_type constriant;

-- drop column
-- alter table tb_name drop column col_name;

-- rename table
-- alter table tb_name rename to new_tb_name;

-- change col_name
-- alter table tb_name
 -- change column old_name new_name d_type constraints
 
 -- modify col_name
 -- alter table tb_name
-- modify col_name new_d_type new_constraint;

-- truncate -- to delete all data in the table
-- truncate table tb_name ;

-- joins in sql
-- joins are used to combine rows from two or more tables based on releated column in between

-- type of joins 
-- inner joins
-- outer joins -->  left join , right join , full join
-- inner join
create table students(
id int primary key,
name varchar(15),
age int not null);

insert into students
values
(101,"sai",10),
(102,"kiran",15),
(103 ,"reddy",20),
(104,"varun",19);

select * from students;

create table graduates(
id int,
course varchar(20),
year int not null);

-- drop table graduates ;
insert into graduates
values
(102 ,"ai",2022),
(103,"ml",2023),
(104,"dsa",2023),
(105,"web",2021);

-- inner joins returns records that have matching values in both tables
-- syn --> select column from tableA innerjoin tableB on tableA.col_name = tableB.col_name;
select * 
from students as s
inner join graduates as g
 on s.id = g.id;

-- allias --> used to give a short name to table, after that using the shortname to refer the table
-- example os student as std ,etc ,..

-- outer joins --<> left join --> returns all records from the lefttable , and matched records from right table
-- suntax --> select column(s) from tableA left join tableB on tableA.col_name =tableB.col_name;
select * 
from students as s
left join  graduates as g
 on s.id = g.id;
 -- <> right join -- returns all records of right table and the matched records of left talbe
 select * 
from students as s
right join  graduates as g
 on s.id = g.id;
 -- full joins --> full outer joins --> left join union right join --> return all data from tables
 -- <>  select * from students as sright join  graduates as g on s.id = g.id  union  select * from students as sright join  graduates as g on s.id = g.id;
 
  select * 
  from students as s
  left join  graduates as g 
  on s.id = g.id  
  union  
  select * 
  from students as s
  right join  graduates as g 
  on s.id = g.id;
-- left exclusive join -- where b.id is  null;
--  right exclusive join -- where a.id is null;

-- self join 
-- joining tables which are simliar but made a part for compatabulity
-- <> syntax --> select column(s) from tablea join tableb on a.col_name = b.col_name;
select *
 from students as s
 join  graduates as g  
 on  s.id = g.id;
 -- union -> used to combine result sets of two or more selected statements
-- same no if columns -->col must have similar d_type -- > col in every select should be in same order
-- <> syntax --> select column(s) from tableA union select column(s) from tableB

-- subquery -- select col(s) from table where col >/</==/.. (sub query); | exm --> select(avr(col) from table);
-- used to make dynamic
-- where rollno in (ids)
-- select from (select * from table where condition ) as temp ;
-- view -- a virtual table based on the results of an sql statement
-- <> syntax -- create view view_name as select col(s) from table ;
-- data wont change -- delete --> drop view name;



  