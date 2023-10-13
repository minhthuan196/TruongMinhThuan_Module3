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
create table subjects(
id int auto_increment primary key,
name varchar(30) not null,
credit tinyint not null default 1 check ( Credit >= 1 ),
`status` bit default 1
);
create table mark (
id int auto_increment primary key,
subjects_id int not null,
student_id int not null,
mark float default 0 check (mark between 0 and 100),
exam_times tinyint default 1,
unique (subjects_id , student_id),
foreign key (subjects_id) references subjects (id),
foreign key (student_id) references student (id)
);
insert into class
values (1, 'A1', '2008-12-20', 1);
insert into class
values (2, 'A2', '2008-12-22', 1);
insert into class
values (3, 'B3', current_date, 0);
insert into student (name, address, phone, `status`, class_id)
values ('Hung', 'Ha Noi', '0912113113', 1, 1);
insert into student (name, address, `status`, class_id)
values ('Hoa', 'Hai phong', 1, 1);
insert into student (name, address, phone, `status`, class_id)
values ('Manh', 'HCM', '0123123123', 0, 2);
insert into subjects
values (1, 'CF', 5, 1),
 (2, 'C', 6, 1),
 (3, 'HDJ', 5, 1),
 (4, 'RDBMS', 10, 1);
 insert into mark (subjects_id, student_id, mark, exam_times)
values (1, 1, 8, 1),
 (1, 2, 10, 2),
 (2, 1, 12, 1);
 -- Hiển thị tất cả các sinh viên có tên bắt đầu bảng ký tự ‘h’
 select * from student
 where name like 'h%';
 -- Hiển thị các thông tin lớp học có thời gian bắt đầu vào tháng 12
 select * from class
 where month(start_date) = 12;
 -- Hiển thị tất cả các thông tin môn học có credit trong khoảng từ 3-5
 select * from subjects
 where credit between 3 and 5;
 -- Thay đổi mã lớp(ClassID) của sinh viên có tên ‘Hung’ là 2
 set sql_safe_updates = 0;
 update student
 set class_id =2
 where name ='Hung';
set sql_safe_updates = 1;
 -- Hiển thị các thông tin: StudentName, SubName, Mark. Dữ liệu sắp xếp theo điểm thi (mark) giảm dần. nếu trùng sắp theo tên tăng dần.
 select s.name as student_name,sb.name as subject_name,m.mark
 from student s
 join mark m on m.student_id = s.id
 join subjects sb on sb.id = m.subjects_id
 order by m.mark desc,s.name;
 