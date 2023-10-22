create database internet_management;
use internet_management;
create table computer(
id int primary key auto_increment,
manufacturer varchar(50) not null,
location varchar(50) not null);
create table customer_type(
id int primary key auto_increment,
name varchar(50) not null unique);
create table customer(
id int primary key auto_increment,
name varchar(50) not null,
phone varchar(10) not null,
email varchar(50) not null,
type_customer_id int,
foreign key (type_customer_id) references customer_type(id) on delete cascade on update cascade
);
create table accompanied_service(
id int primary key auto_increment,
name varchar(50) not null unique,
price int not null);
create table service(
id int primary key auto_increment,
computer_id int not null,
customer_id int not null,
start_time datetime not null,
end_time datetime not null,
price int not null,
foreign key (computer_id) references computer(id) on delete cascade on update cascade,
foreign key (customer_id) references customer(id) on delete cascade on update cascade
);
create table service_detail(
id int primary key auto_increment,
accompanied_service_id int not null,
service_id int not null,
quantity int not null,
unique(accompanied_service_id,service_id),
foreign key (accompanied_service_id) references accompanied_service(id) on delete cascade on update cascade,
foreign key (service_id) references service(id) on delete cascade on update cascade
);



