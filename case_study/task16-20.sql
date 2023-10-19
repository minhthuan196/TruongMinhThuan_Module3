use furama_management;
-- 16.Xóa những Nhân viên chưa từng lập được hợp đồng nào từ năm 2019 đến năm 2021.
set sql_safe_updates = 0;
with get_id_staffs as(
	select s.id
	from staffs s
	join contract c on c.staffs_id = s.id
	where year(c.contract_start_date) in (2019,2020,2021)
	group by s.id )
delete from staffs 
where staffs.id not in ( select id from get_id_staffs);
-- 17.	Cập nhật thông tin những khách hàng có ten_loai_khach từ Platinum lên Diamond,
-- chỉ cập nhật những khách hàng đã từng đặt phòng với Tổng Tiền thanh toán trong năm 2021 là lớn hơn 10.000.000 VNĐ.
SET sql_mode=(SELECT REPLACE(@@sql_mode,'ONLY_FULL_GROUP_BY',''));
with get_id_customer as(
	select c.id, ifnull(sum((ifnull(sv.rental_costs,0) + ifnull(dc.quantity,0) * ifnull(acs.price,0))),0) as total_bill
    from customer c
    join contract ctr on ctr.customer_id = c.id
    join service sv on sv.id = ctr.service_id
    left join detail_contract dc on dc.contract_id = ctr.id
    left join accompanied_service acs on acs.id = dc.accompanied_service_id
    join customer_type ct on ct.id = c.customer_type_id
    where year(ctr.contract_start_date) = 2021 and ct.name = "Platinium"
    group by c.id
    having total_bill > 1000000
    )
update customer
set customer_type_id = 1
where id in (select id from get_id_customer);
-- 18.	Xóa những khách hàng có hợp đồng trước năm 2021 (chú ý ràng buộc giữa các bảng).
with get_id_customer as(
	select c.id
    from customer c
	join contract ctr on ctr.customer_id = c.id
    where year(ctr.contract_start_date) < 2021
)
delete from customer
where customer.id in (select * from get_id_customer group by id);
-- 19.	Cập nhật giá cho các dịch vụ đi kèm được sử dụng trên 10 lần trong năm 2020 lên gấp đôi.
with get_id_accompanied_service as(
	select acs.id, sum(dc.quantity) as total_time_use
    from accompanied_service acs
    join detail_contract dc on dc.accompanied_service_id = acs.id
    join contract c on c.id = dc.contract_id
    where year(c.contract_start_date) = 2020
    group by acs.id
    having total_time_use >10
	)
update accompanied_service acs
set acs.price = acs.price * 2
where acs.id = (select id from get_id_accompanied_service);
-- 20.	Hiển thị thông tin của tất cả các nhân viên và khách hàng có trong hệ thống,
-- thông tin hiển thị bao gồm id (ma_nhan_vien, ma_khach_hang), ho_ten, email, so_dien_thoai, ngay_sinh, dia_chi.
select s.id, s.name, s.email, s.phone, s.address
from staffs s
union all
select c.id, c.name, c.email, c.phone, c.address
from customer c;
    