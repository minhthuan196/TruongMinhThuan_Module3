use quan_ly_sinh_vien;
select address, count(id) as 'Số lượng học viên'
from Student
group by address;
--
select s.id,s.name, avg(mark)
from student s 
join mark m on s.id = m.student_id
group by s.id;
--
select s.id,s.name, avg(mark)
from student s 
join mark m on s.id = m.student_id
group by s.id
having avg(mark) >15;
--
select s.id,s.name, avg(mark)
from student s 
join mark m on s.id = m.student_id
group by s.id
having avg(mark) >= all (select avg(mark) from mark group by mark.student_id);