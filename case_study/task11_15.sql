-- 11. Hiển thị thông tin các dịch vụ đi kèm đã được sử dụng bởi những khách hàng có 
-- ten_loai_khach là “Diamond” và có dia_chi ở “Vinh” hoặc “Quảng Ngãi”.
select acs.id, acs.name
from customer c
join customer_type ct on ct.id = c.customer_type_id
join contract ctr on ctr.customer_id = c.id
join detail_contract dc on dc.contract_id = ctr.id
join accompanied_service acs on acs.id = dc.accompanied_service_id
where ct.name = 'Diamond' and (c.address like '% Vinh' or c.address like '% Quảng Ngãi');
-- 12.	Hiển thị thông tin ma_hop_dong, ho_ten (nhân viên), ho_ten (khách hàng),
-- so_dien_thoai (khách hàng), ten_dich_vu, so_luong_dich_vu_di_kem (được tính dựa trên việc sum so_luong ở dich_vu_di_kem),
-- tien_dat_coc của tất cả các dịch vụ đã từng được khách hàng đặt vào 3 tháng cuối năm 2020
-- nhưng chưa từng được khách hàng đặt vào 6 tháng đầu năm 2021.
SET sql_mode=(SELECT REPLACE(@@sql_mode,'ONLY_FULL_GROUP_BY',''));
select ctr.id , s.name as staffs_name, c.name as customer_name, c.phone as customer_phone,
sv.name as  service_name, ifnull(sum(dc.quantity),0) as total_accompanied_service, ctr.deposits
from contract ctr
join customer c on c.id = ctr.customer_id
join staffs s on s.id = ctr.staffs_id
join service sv on sv.id = ctr.service_id
left join detail_contract dc on dc.contract_id = ctr.id
where year(ctr.contract_start_date) = 2020 and month(ctr.contract_start_date) in (10,11,12)
and ctr.id not in(
	select ctr.id
    from contract ctr
    where year(ctr.contract_start_date) = 2021 and month(ctr.contract_start_date) in (1,2,3,4,5,6)
)
group by ctr.id;
-- 13.	Hiển thị thông tin các Dịch vụ đi kèm được sử dụng nhiều nhất bởi các Khách hàng đã đặt phòng.
-- (Lưu ý là có thể có nhiều dịch vụ có số lần sử dụng nhiều như nhau).
with total as(
	select acs.id,acs.name, ifnull(sum(dc.quantity),0) as total_accompanied_service
	from detail_contract dc
	join accompanied_service acs on acs.id = dc.accompanied_service_id
	group by acs.id)
select *
from total
where total_accompanied_service = (select max(total_accompanied_service)
from total);
-- 14.Hiển thị thông tin tất cả các Dịch vụ đi kèm chỉ mới được sử dụng một lần duy nhất.
-- Thông tin hiển thị bao gồm ma_hop_dong, ten_loai_dich_vu, ten_dich_vu_di_kem, so_lan_su_dung
-- (được tính dựa trên việc count các ma_dich_vu_di_kem).
select ctr.id as contract_id, ts.name as type_service_name, acs.name accompanied_service_name,
count(dc.accompanied_service_id) as total_use_service
from contract ctr
join service sv on sv.id = ctr.service_id
join type_service ts on ts.id = sv.type_service_id
join detail_contract dc on dc.contract_id = ctr.id
join accompanied_service acs on acs.id = dc.accompanied_service_id
group by dc.accompanied_service_id
having count(dc.accompanied_service_id) = 1;
-- 15. Hiển thi thông tin của tất cả nhân viên bao gồm ma_nhan_vien, ho_ten, ten_trinh_do,
-- ten_bo_phan, so_dien_thoai, dia_chi mới chỉ lập được tối đa 3 hợp đồng từ năm 2020 đến 2021.
select s.id, s.name, l.name as levels, p.name as parts, s.phone, s.address
from staffs s
join parts p on p.id = s.parts_id
join levels l on l.id = s.levels_id
join contract c on c.staffs_id = s.id
group by c.staffs_id
having count(c.staffs_id) <=3;



