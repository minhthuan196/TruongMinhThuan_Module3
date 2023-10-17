use quan_ly_sinh_vien;
-- Hiển thị tất cả các thông tin môn học (bảng subject) có credit lớn nhất
select *
from subjects
where credit = ( select max(credit) from subjects);
-- Hiển thị các thông tin môn học có điểm thi lớn nhất.
select sb.name as subjects_name, m.mark
from subjects sb
join mark m on m.subjects_id = sb.id
where m.mark = (select max(mark) from mark);
-- Hiển thị các thông tin sinh viên và điểm trung bình của mỗi sinh viên, xếp hạng theo thứ tự điểm giảm dần
select s.*, ifnull(avg(m.mark),0) as avg_mark
from student s
join mark m on m.student_id = s.id
group by s.id
order by avg_mark desc;
