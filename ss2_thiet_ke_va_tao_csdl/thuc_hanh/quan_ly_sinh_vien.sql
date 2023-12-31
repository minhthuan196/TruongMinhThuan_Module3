create database quan_ly_sinh_vien;
use quan_ly_sinh_vien;
create table class (
id int auto_increment primary key,
name varchar(60) not null,
start_date datetime not null,
`status` bit
);
create table student (
id int auto_increment primary key,
name varchar(30) not null,
address varchar(50) not null,
phone varchar(20) unique,
`status` bit,
class_id int not null,
foreign key (class_id) references class (id)
);
create table Subject(
         SubId int not null auto_increment primary key,
         SubName varchar(30) not null,
         Credit tinyint not null default 1 check ( Credit >= 1 ),
         Status bit default 1
);
create table Mark (
    MarkId int not null auto_increment primary key,
    SubId int not null,
    StudentId int not null,
    Mark float default 0 check (Mark between 0 and 100),
    ExamTimes tinyint default 1,
    unique (SubId , StudentId),
    foreign key (SubId)
        references Subject (SubId),
    foreign key (StudentId)
        references Student (StudentId)
);
insert into class
values (1, 'A1', '2008-12-20', 1);
insert into class
values (2, 'A2', '2008-12-22', 1);
insert into class
values (3, 'B3', current_date, 0);
insert into Student (StudentName, Address, Phone, Status, classId)
values ('Hung', 'Ha Noi', '0912113113', 1, 1);
insert into Student (StudentName, Address, Status, classId)
values ('Hoa', 'Hai phong', 1, 1);
insert into Student (StudentName, Address, Phone, Status, classId)
values ('Manh', 'HCM', '0123123123', 0, 2);
insert into Subject
values (1, 'CF', 5, 1),
 (2, 'C', 6, 1),
 (3, 'HDJ', 5, 1),
 (4, 'RDBMS', 10, 1);
 insert into Mark (SubId, StudentId, Mark, ExamTimes)
values (1, 1, 8, 1),
 (1, 2, 10, 2),
 (2, 1, 12, 1);
 select *
from Student;
select *
from Student
where Status = true;
select *
from Subject
where Credit < 10;
select S.StudentId, S.StudentName, C.className
from Student S join class C on S.classId = C.classID;
select S.StudentId, S.StudentName, C.className
from Student S join class C on S.classId = C.classID
where C.className = 'A1';
select S.StudentId, S.StudentName, Sub.SubName, M.Mark
from Student S join Mark M on S.StudentId = M.StudentId join Subject Sub on M.SubId = Sub.SubId;
select S.StudentId, S.StudentName, Sub.SubName, M.Mark
from Student S join Mark M on S.StudentId = M.StudentId join Subject Sub on M.SubId = Sub.SubId
where Sub.SubName = 'CF';