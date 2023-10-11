create database student;
use student;
create table student(
 id int,
 name varchar(200),
 age int,
 country varchar(50)
 );
 create table class(
 id int primary key,
 name varchar(200)
 );
 create  table teacher(
 id int primary key,
 name varchar(200),
 age int,
 country varchar(50)
 );
 alter table student
 add primary key (id);
 
 insert into student(id,name,age,country)
 value (1,"Thuận",27,"Việt Nam");
  insert into student(id,name,age,country)
 value (2,"Giang",22,"Việt Nam");
  insert into student(id,name,age,country)
 value (3,"Hữu",24,"Việt Nam");
   insert into student value (4,"Kiệt",22,"Việt Nam"),
		(5,"Tuấn",18,"Việt Nam"),
        (6,"Quyền",19,"Việt Nam");
update student set country = "USA" where id = 1;
update student set age = 10 where id =3;
delete from student where id =1;
alter table student
add gender varchar(10);
update student set gender = "male" where id =2;
alter table student modify column id int not null auto_increment;
insert into student(name,age,country,gender) value ("Đạt",30,"Việt Nam","male");
alter table student add test int;
alter table student drop test;
