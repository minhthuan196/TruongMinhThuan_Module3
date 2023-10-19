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
-- delimiter //
-- create function boolean check_staff_id(id int)
-- delimiter //
-- create procedure create_customer(ip_contract_start_date datetime, ip_contract_end_date datetime,
 -- ip_deposits int, ip_staff_id int, ip_customer_id int, ip_service_id int)
 -- begin
 -- insert into customer(contract_start_date, contract_end_date, deposits, staff_id, customer_id, service_id)
 -- value(
