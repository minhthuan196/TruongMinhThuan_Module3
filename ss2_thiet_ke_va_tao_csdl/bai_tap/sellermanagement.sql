create database seller_management;
use seller_management;
create table customer(
id int primary key,
name varchar(50) not null,
age int not null check (age >=6) 
);
create table product(
id int primary key,
name varchar(50) not null,
price float not null check (price >0)
);
create table orders(
id int primary key,
customer_id int not null,
date_order date not null,
total_price float not null check (total_price>0),
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
