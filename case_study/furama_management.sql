create database furama_management;
use furama_management;
create table positions(
id int primary key auto_increment,
name varchar(45) not null
);
create table levels(
id int primary key auto_increment,
name varchar(45) not null
);
create table parts(
id int primary key auto_increment,
name varchar(45)
);
create table staffs(
id int primary key auto_increment,
name varchar(45) not null,
date_of_births date not null,
id_card varchar(12) check (length(id_card) = 12 or length(id_card) = 9) not null unique,
salary int not null check (salary >0),
phone varchar(10) check (length(phone) = 10) not null unique,
email varchar(45) not null unique,
address varchar(45) not null,
positions_id int not null,
levels_id int not null,
parts_id int not null,
foreign key (positions_id) references positions(id),
foreign key (levels_id) references levels(id),
foreign key (parts_id) references parts(id)
);
create table customer_type(
id int primary key auto_increment,
name varchar(45) not null
);
create table customer(
id int primary key auto_increment,
name varchar(45) not null,
date_of_births date not null,
gender bit not null,
id_card varchar(12) check (length(id_card) = 12 or length(id_card) = 9) not null unique,
phone varchar(10) check (length(phone) = 10) not null unique,
email varchar(45) not null unique,
address varchar(45) not null,
customer_type_id int not null,
foreign key (customer_type_id) references customer_type(id)
);
create table accompanied_service(
id int primary key auto_increment,
name varchar(45) not null,
price double check (price >0) not null,
unit varchar(10) not null,
`status` varchar(45) not null
);
create table rental_type(
id int primary key auto_increment,
name varchar(45) not null
);
create table type_service(
id int primary key auto_increment,
name varchar(45) not null
);
create table service(
id int primary key auto_increment,
name varchar(45) not null,
area int not null check(area>=0),
rental_costs double not null check(rental_costs>0),
max_people int not null check (max_people >=0),
room_standard varchar(45) not null,
other_amenities_described varchar(45) not null,
pool_area double check(pool_area >0),
number_floors int check(number_floors >=0),
accompanied_free_servicee text ,
rental_type_id int not null,
type_service_id int not null,
foreign key (rental_type_id) references rental_type(id),
foreign key (type_service_id) references type_service(id)
);
create table contract(
id int primary key auto_increment,
contract_start_date datetime not null,
contract_end_date datetime not null,
deposits double not null check(deposits>=0),
staffs_id int not null,
customer_id int not null,
service_id int not null,
foreign key (staffs_id) references staffs(id),
foreign key (customer_id) references customer(id),
foreign key (staffs_id) references staffs(id)
);
create table detail_contract(
id int primary key auto_increment,
quantity int not null,
contract_id int not null,
accompanied_service_id int not null,
unique(contract_id,accompanied_service_id),
foreign key (contract_id) references contract(id),
foreign key (accompanied_service_id) references accompanied_service(id)
);
