use furama_management;
-- 2. Hiển thị thông tin của tất cả nhân viên có trong hệ thống 
-- có tên bắt đầu là một trong các ký tự “H”, “T” hoặc “K” và có tối đa 15 kí tự
select *
from staffs
where ((name like 'H%') or (name like 'T%') or( name like 'K%')) and (char_length(name) <=15);
-- 3. Hiển thị thông tin của tất cả khách hàng có độ tuổi từ 18 đến 50 tuổi
-- và có địa chỉ ở “Đà Nẵng” hoặc “Quảng Trị”
select *
from customer
where DATEDIFF(curdate(),date_of_births)/365
between 18 and 50 and ((address like '% Đà Nẵng') or(address like '% Quảng Trị'));
-- 4. Đếm xem tương ứng với mỗi khách hàng đã từng đặt phòng bao nhiêu lần
-- Kết quả hiển thị được sắp xếp tăng dần theo số lần đặt phòng của khách hàng
-- Chỉ đếm những khách hàng nào có Tên loại khách hàng là “Diamond”
select c.id, c.name, count(c.id) as total_order
from customer c
join customer_type ct on ct.id = c.customer_type_id
join contract ctr on ctr.customer_id =c.id
where ct.name ='Diamond'
group by ctr.customer_id
order by total_order;
-- 5. Hiển thị ma_khach_hang, ho_ten, ten_loai_khach, ma_hop_dong, ten_dich_vu, ngay_lam_hop_dong, ngay_ket_thuc, tong_tien
-- (Với tổng tiền được tính theo công thức như sau: Chi Phí Thuê + Số Lượng * Giá, 
-- với Số Lượng và Giá là từ bảng dich_vu_di_kem, hop_dong_chi_tiet) cho tất cả các khách hàng đã từng đặt phòng
-- (những khách hàng nào chưa từng đặt phòng cũng phải hiển thị ra)
SET sql_mode=(SELECT REPLACE(@@sql_mode,'ONLY_FULL_GROUP_BY',''));
select c.id,c.name as name_customer,ct.name as name_customer_type,ctr.id as contract_id,
s.name as name_service,ctr.contract_start_date,ctr.contract_end_date,
(ifnull(s.rental_costs,0) + ifnull(dc.quantity,0) * ifnull(acs.price,0)) as total_price
from customer c
left join customer_type ct on ct.id = c.customer_type_id
left join contract ctr on ctr.customer_id = c.id
left join service s on s.id = ctr.service_id
left join detail_contract dc on dc.contract_id = ctr.id
left join accompanied_service acs on acs.id = dc.accompanied_service_id
group by ctr.id;