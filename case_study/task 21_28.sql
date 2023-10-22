-- 21.	Tạo khung nhìn có tên là v_nhan_vien để lấy được thông tin của tất cả các nhân viên có địa chỉ là “Hải Châu”
-- và đã từng lập hợp đồng cho một hoặc nhiều khách hàng bất kì với ngày lập hợp đồng là “12/12/2019”
create view v_staffs
as (
	select s.*
    from staffs s
    join contract c on c.staffs_id = s.id
    where s.address like '% Yên Bái%' and c.contract_start_date = '2021-04-25'
    );
-- 22.	Thông qua khung nhìn v_nhan_vien thực hiện cập nhật địa chỉ thành “Liên Chiểu” đối với
-- tất cả các nhân viên được nhìn thấy bởi khung nhìn này.
set sql_safe_updates =0;
truncate table staffs;
update v_staffs
set address = "Liên Chiểu, Đà Nẵng";
-- 23. Tạo Stored Procedure sp_xoa_khach_hang dùng để xóa thông tin của một khách hàng nào đó với
-- ma_khach_hang được truyền vào như là 1 tham số của sp_xoa_khach_hang.
delimiter //
create procedure delete_customer(id int)
begin
delete from customer
where customer.id = id;
end //
delimiter ;
call delete_customer(1);
-- 24.	Tạo Stored Procedure sp_them_moi_hop_dong dùng để thêm mới vào bảng hop_dong với yêu cầu
-- sp_them_moi_hop_dong phải thực hiện kiểm tra tính hợp lệ của dữ liệu bổ sung,
-- với nguyên tắc không được trùng khóa chính và đảm bảo toàn vẹn tham chiếu đến các bảng liên quan.
SET GLOBAL log_bin_trust_function_creators = 1;
-- check id staffs
delimiter //
create function check_staff_id(id int)
returns boolean
begin
if exists (select staffs.id from staffs where id = staffs.id) then 
	return true;
else
	return false;
end if;
end //
delimiter ;
-- check id customer
delimiter //
create function check_customer_id(id int)
returns boolean
begin
if exists (select customer.id from customer where id = customer.id) then 
	return true;
else
	return false;
end if;
end //
delimiter ;
-- check id service
delimiter //
create function check_service_id(id int)
returns boolean
begin
if exists (select service.id from service where id = service.id) then 
	return true;
else
	return false;
end if;
end //
delimiter ;
-- create contract
delimiter //
create procedure create_contract(ip_contract_start_date datetime, ip_contract_end_date datetime,
ip_deposits int, ip_staff_id int, ip_customer_id int, ip_service_id int)
begin
if(check_staff_id(ip_staff_id) and check_customer_id(ip_customer_id) and check_service_id(ip_service_id)) then
	insert into contract(contract_start_date, contract_end_date, deposits, staffs_id, customer_id, service_id)
	value(ip_contract_start_date, ip_contract_end_date ,ip_deposits , ip_staff_id , ip_customer_id , ip_service_id);
else select 'cant create contract';
end if;
end //
delimiter ;
call create_contract('2023-11-11','2023-11-15',123123,2,2,2);
-- 25.	Tạo Trigger có tên tr_xoa_hop_dong khi xóa bản ghi trong bảng hop_dong thì hiển thị tổng số lượng bản ghi còn lại có trong bảng hop_dong ra giao diện console của database.
-- Lưu ý: Đối với MySQL thì sử dụng SIGNAL hoặc ghi log thay cho việc ghi ở console.
create table log (
total_contract int,
time_now datetime);
delimiter //
create trigger tr_delete_contract
after delete on contract
for each row
begin
declare total_contract int;
select count(id) into total_contract from contract;
insert into log
value(total_contract,now());
end //
delimiter ;
drop trigger tr_delete_contract;
delete from contract
where contract.id = 11;
select * from log;
-- 26.	Tạo Trigger có tên tr_cap_nhat_hop_dong khi cập nhật ngày kết thúc hợp đồng, cần kiểm tra xem thời gian
-- cập nhật có phù hợp hay không, với quy tắc sau: Ngày kết thúc hợp đồng phải lớn hơn ngày làm hợp đồng ít nhất là 2 ngày.
-- Nếu dữ liệu hợp lệ thì cho phép cập nhật, nếu dữ liệu không hợp lệ thì in ra thông báo
-- “Ngày kết thúc hợp đồng phải lớn hơn ngày làm hợp đồng ít nhất là 2 ngày” trên console của database.
-- Lưu ý: Đối với MySQL thì sử dụng SIGNAL hoặc ghi log thay cho việc ghi ở console.
delimiter //
create trigger tr_update_contract
before update on contract
for each row
begin
declare message varchar(50);
if(datediff(new.contract_end_date, old.contract_start_date) < 2) then
	set message = "invalid";
	signal sqlstate '45000' set message_text = message;
end if;
end //
delimiter ;
drop trigger tr_update_contract;
update contract
set contract_end_date = "2020-07-11"
where id = 2;
-- 27. a.Tạo Function func_dem_dich_vu: Đếm các dịch vụ đã được sử dụng với tổng tiền là > 2.000.000 VNĐ.
set sql_mode=(select replace(@@sql_mode,'ONLY_FULL_GROUP_BY',''));
delimiter //
create function f_count_service()
returns int
begin
declare total int;
with temp as(
	select s.id , (ifnull(s.rental_costs,0) + ifnull(dc.quantity,0) * ifnull(acs.price,0)) as total_price
	from contract ctr
	join service s on s.id = ctr.service_id
	join detail_contract dc on dc.contract_id = ctr.id
	join accompanied_service acs on acs.id = dc.accompanied_service_id
	group by s.id
	having total_price > 2000000
    )
select count(id) into total from temp;
return total;
end //
delimiter ;
select f_count_service();
-- b. Tạo Function func_tinh_thoi_gian_hop_dong: Tính khoảng thời gian dài nhất tính từ lúc bắt đầu
-- làm hợp đồng đến lúc kết thúc hợp đồng mà khách hàng đã thực hiện thuê dịch vụ
-- (lưu ý chỉ xét các khoảng thời gian dựa vào từng lần làm hợp đồng thuê dịch vụ,
-- không xét trên toàn bộ các lần làm hợp đồng). Mã của khách hàng được truyền vào như là 1 tham số của function này.
delimiter //
create function f_count_time_contract(ip_customer_id int)
returns int
begin
declare max_time int;
select max(datediff(contract_end_date,contract_start_date)) into max_time 
from contract
where customer_id = ip_customer_id;
return max_time;
end //
delimiter ;
select f_count_time_contract(4);
-- 28.	Tạo Stored Procedure sp_xoa_dich_vu_va_hd_room để tìm các dịch vụ được thuê bởi khách hàng
-- với loại dịch vụ là “Room” từ đầu năm 2015 đến hết năm 2019 để xóa thông tin của các dịch vụ đó
-- (tức là xóa các bảng ghi trong bảng dich_vu) và xóa những hop_dong sử dụng dịch vụ liên quan
-- (tức là phải xóa những bản gi trong bảng hop_dong) và những bản liên quan khác.
create view temp_contract_id as (
	select ct.id as id_contract, dc.id as id_contract_detail 
	from service s
	join type_service ts on ts.id = s.type_service_id
	join contract ct on ct.service_id = s.id
	left join detail_contract dc on dc.contract_id = ct.id
	where ts.name ='Room' and (year(contract_start_date) between 2015 and 2029)
);
create view temp_service_id as (
	select s.id as id_service
	from service s
	join type_service ts on ts.id = s.type_service_id
	join contract ct on ct.service_id = s.id
	left join detail_contract dc on dc.contract_id = ct.id
	where ts.name ='Room' and (year(contract_start_date) between 2015 and 2029)
);
delimiter //
create procedure sp_delete_service_contract() 
begin
with detail_contract_temp as(select id_contract_detail from temp)
delete from detail_contract
where id in (select * from detail_contract_temp);
with contract_temp as (select id_contract from temp)
delete from contract 
where id in (select * from contract_temp);
with service_temp as(select id_service from temp)
delete from service 
where id in (select * from service_temp);
end //
delimiter ;
set sql_safe_updates = 0 ;
call sp_delete_service_contract();