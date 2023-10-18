create database products_management;
use products_management;
create table products (
id int primary key auto_increment,
product_code varchar(4) not null unique,
product_name varchar(50) not null,
product_price int not null check (product_price>0),
product_amount int not null check (product_amount>0),
product_description varchar(50),
product_status bit not null);

insert into products(product_code, product_name, product_price, product_amount, product_description, product_status)
value ("A001", "Sting", 10000, 10, "Không đường", 1),
("A002", "Coca", 10000, 15, "Không đường", 1),
("A003", "Rebull", 15000, 20, "Việt Nam", 0),
("A004", "Revive", 10000, 5, "Việt Nam", 0),
("A005", "Coca", 15000, 15, "Không đường", 1);
-- Tạo Unique Index trên bảng Products (sử dụng cột productCode để tạo chỉ mục)
create unique index i_product_code
on products(product_code);
-- Tạo Composite Index trên bảng Products (sử dụng 2 cột productName và productPrice)
create index i_composite_product_name_price 
on products(product_name,product_price);
-- Sử dụng câu lệnh EXPLAIN để biết được câu lệnh SQL của bạn thực thi như nào
drop index i_product_code on products;
drop index i_composite_product_name_price on products;
explain select* from products where product_code = "A003";
explain select * from products where product_name = "Coca" and product_price = 10000;
-- Tạo view lấy về các thông tin: productCode, productName, productPrice, productStatus từ bảng products
create view v_products 
as (
	select product_code, product_name, product_price, product_status
    from products
    );
-- Tiến hành sửa đổi view
update v_products
set product_name = "Aqua"
where product_code = "A001";
select * from products;
-- Tiến hành xoá view
drop view v_products;
-- Tạo store procedure lấy tất cả thông tin của tất cả các sản phẩm trong bảng product
delimiter //
create procedure get_all_product()
begin
select * from products;
end //
delimiter ;
call get_all_product;
-- Tạo store procedure thêm một sản phẩm mới
delimiter //
create procedure create_product(input_product_code varchar(4), input_product_name varchar(50), input_product_price int,
 input_product_amount int, input_product_description varchar(50),input_product_status bit)
begin
insert into products(product_code, product_name, product_price, product_amount, product_description, product_status)
value(input_product_code, input_product_name, input_product_price, input_product_amount, input_product_description,input_product_status);
end //
delimiter ;
call create_product("A006", "Sting", 20000, 15, "Không đường", 1);
-- Tạo store procedure sửa thông tin sản phẩm theo id
delimiter //
create procedure edit_product(id int, input_product_code varchar(4), input_product_name varchar(50), input_product_price int,
 input_product_amount int, input_product_description varchar(50),input_product_status bit)
begin
update products
set product_code = input_product_code,
 product_name = input_product_name,
 product_price = input_product_price,
 product_amount = input_product_amount,
 product_description = input_product_description,
 product_status = input_product_status
where products.id = id;
end //
delimiter ;
truncate table products;
call edit_product(6,"A006", "Test", 15000, 15, "Không đường", 1);
-- Tạo store procedure xoá sản phẩm theo id
delimiter //
create procedure delete_product(id int)
begin
delete from products
where products.id = id;
end //
delimiter ;
call delete_product(6);

