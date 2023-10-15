use furama_management;
-- 6. Hiển thị ma_dich_vu, ten_dich_vu, dien_tich, chi_phi_thue, ten_loai_dich_vu của tất cả các loại dịch vụ
-- chưa từng được khách hàng thực hiện đặt từ quý 1 của năm 2021 (Quý 1 là tháng 1, 2, 3)
select s.id, s.name as service_name, s.area, s.rental_costs, ts.name as type_service_name
from service s
join type_service ts on ts.id = s.type_service_id
join contract c on c.service_id = s.id
where c.service_id not in(
	select c.service_id
	from contract c
	where(year(c.contract_start_date) = 2021 and month(c.contract_start_date) in(1,2,3))
)
group by s.id;
-- 7. Hiển thị thông tin ma_dich_vu, ten_dich_vu, dien_tich, so_nguoi_toi_da, chi_phi_thue, ten_loai_dich_vu
-- của tất cả các loại dịch vụ đã từng được khách hàng đặt phòng trong năm 2020 nhưng chưa từng được khách hàng đặt phòng trong năm 2021.
select s.id, s.name as service_name, s.area,s.max_people, s.rental_costs, ts.name as type_service_name
from service s
join type_service ts on ts.id = s.type_service_id
join contract c on c.service_id = s.id
where c.service_id not in(
	select c.service_id
	from contract c
	where(year(c.contract_start_date) = 2021 and not (year(c.contract_start_date) = 2020))
)
group by s.id;
-- 8. Hiển thị thông tin ho_ten khách hàng có trong hệ thống, với yêu cầu ho_ten không trùng nhau.
-- Học viên sử dụng theo 3 cách khác nhau để thực hiện yêu cầu trên.
-- c1
select c.name as customer_name
from customer c
group by c.name;
-- c2
select distinct c.name as customer_name
from customer c;
-- c3
select c.name as customer_name
from customer c
where c.id not in (
	select c2.id
	from customer c1
	join customer c2 on c2.name = c1.name
	where c2.id > c1.id
);
-- 9. Thực hiện thống kê doanh thu theo tháng, nghĩa là tương ứng với mỗi tháng trong năm 2021
-- thì sẽ có bao nhiêu khách hàng thực hiện đặt phòng


