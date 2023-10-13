create database seller_management;
use seller_management;
create table customer(
id int primary key auto_increment,
name varchar(25) not null,
age tinyint not null check (age >=6) 
);
create table product(
id int primary key auto_increment,
name varchar(25) not null,
price int not null check (price >0)
);
create table orders(
id int primary key auto_increment,
customer_id int not null,
date_order date not null,
total_price int,
foreign key (customer_id) references customer(id) 
);
create table order_detail(
order_id int not null,
product_id int not null,
quantity int not null check (quantity >0),
primary key (order_id,product_id),
foreign key (order_id) references orders(id),
foreign key (product_id) references product(id)
);
insert into customer (name,age)
value ("Minh Quan",10),
	("Ngoc Oanh",20),
	("Hong Ha",50);
insert into orders(customer_id,date_order,total_price)
value(1,'2006-03-21',null),
	(2,'2006-03-23',null),
    (1,'2006-03-16',null);
insert into product(name,price)
value("May Giat",3),
	("Tu Lanh",5),
    ("Dieu Hoa",7),
    ("Quat",1),
    ("Bep Dien",2);
insert into order_detail(order_id,product_id,quantity)
value(1,1,3),
	(1,3,7),
    (1,4,2),
    (2,1,1),
    (3,1,8),
    (2,5,4),
    (2,3,3);
-- Hiển thị các thông tin  gồm oID, oDate, oPrice của tất cả các hóa đơn trong bảng Order
select o.id, o.date_order, o.total_price
from orders o;
-- Hiển thị danh sách các khách hàng đã mua hàng, và danh sách sản phẩm được mua bởi các khách
select c.name as customer_name, p.name as product_name
from customer c
join orders o on c.id = o.customer_id
join order_detail od on od.order_id = o.id
join product p on p.id = od.product_id;
-- Hiển thị tên những khách hàng không mua bất kỳ một sản phẩm nào
select c.name,ifnull(o.customer_id,'khong mua hang') as product
from customer c
left join orders o on c.id = o.customer_id
where customer_id is null;
-- Hiển thị mã hóa đơn, ngày bán và giá tiền của từng hóa đơn 
-- (giá một hóa đơn được tính bằng tổng giá bán của từng loại mặt hàng xuất hiện trong hóa đơn
-- Giá bán của từng loại được tính = odQTY*pPrice)
select od.order_id,o.date_order,(od.quantity*p.price) as total_price_order
from orders o
join order_detail od on o.id =od.order_id
join product p on p.id = od.product_id;
