create database student_management;
use student_management;
CREATE TABLE student (
    student_id INT PRIMARY KEY AUTO_INCREMENT,
    student_name VARCHAR(200),
    student_age INT,
    student_country VARCHAR(50)
);
CREATE TABLE class (
    class_id INT PRIMARY KEY AUTO_INCREMENT,
    class_name VARCHAR(200)
);
CREATE TABLE teacher (
    teacher_id INT PRIMARY KEY AUTO_INCREMENT,
    teacher_name VARCHAR(200),
    teacher_age INT,
    teacher_country VARCHAR(50)
);
 insert into student(student_name,student_age,student_country)
 value ("Thuận",27,"Việt Nam"),
		("Giang",22,"Việt Nam"),
		("Hữu",24,"Việt Nam"),
        ("Kiệt",22,"Việt Nam"),
		("Tuấn",18,"Việt Nam"),
        ("Quyền",19,"Việt Nam");
update student set student_country = "USA" where student_id = 1;
update student set student_age = 10 where student_id =3;
delete from student where student_id =1;
alter table student
add student_gender varchar(10);
UPDATE student 
SET 
    student_gender = 'male'
WHERE
    student_id = 2;
insert into student(student_name,student_age,student_country,student_gender) 
value ("Đạt",30,"Việt Nam","male");
alter table student add test int;
alter table student drop test;