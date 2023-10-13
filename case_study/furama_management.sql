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
contract_id int not null,
service_id int not null,
foreign key (contract_id) references contract(id),
foreign key (service_id) references service(id)
);
-- add data all table
insert into positions(name)
value
("Quản Lý"),
("Nhân viên");
insert into levels(name)
value
("Trung Cấp"),
("Cao Đẳng"),
("Đại Học"),
("Sau Đại Học");
insert into parts(name)
value
("Sale-Marketing"),
("Hành chính"),
("Phục vụ"),
("Quản lý");
insert into staffs (name,date_of_births,id_card,salary,phone, email, address, positions_id, levels_id, parts_id)
value
('Nguyễn Văn An', '1970-11-07', '456231786', 10000000, '0901234121', 'annguyen@gmail.com', '295 Nguyễn Tất Thành, Đà Nẵng', 1, 3, 1),
('Lê Văn Bình', '1997-04-09', '654231234', 7000000, '0934212314', 'binhlv@gmail.com', '22 Yên Bái, Đà Nẵng', 1, 2, 2),
('Hồ Thị Yến', '1995-12-12', '999231723', 14000000, '0412352315', 'thiyen@gmail.com', 'K234/11 Điện Biên Phủ, Gia Lai', 1, 3, 2),
('Võ Công Toản', '1980-04-04', '123231365', 17000000, '0374443232', 'toan0404@gmail.com', '77 Hoàng Diệu, Quảng Trị', 1, 4, 4),
('Nguyễn Bỉnh Phát', '1999-12-09', '454363232', 6000000, '0902341231', 'phatphat@gmail.com', '43 Yên Bái, Đà Nẵng', 2, 1, 1),
('Khúc Nguyễn An Nghi', '2000-11-08', '964542311', 7000000, '0978653213', 'annghi20@gmail.com', '294 Nguyễn Tất Thành, Đà Nẵng', 2, 2, 3),
('Nguyễn Hữu Hà', '1993-01-01', '534323231', 8000000, '0941234553', 'nhh0101@gmail.com', '4 Nguyễn Chí Thanh, Huế', 2, 3, 2),
('Nguyễn Hà Đông', '1989-09-03', '234414123', 9000000, '0642123111', 'donghanguyen@gmail.com', '111 Hùng Vương, Hà Nội', 2, 4, 4),
('Tòng Hoang', '1982-09-03', '256781231', 6000000, '0245144444', 'hoangtong@gmail.com', '213 Hàm Nghi, Đà Nẵng', 2, 4, 4),
('Nguyễn Công Đạo', '1994-01-08', '755434343', 8000000, '0988767111', 'nguyencongdao12@gmail.com', '6 Hoà Khánh, Đồng Nai', 2, 3, 2);
insert into customer_type(name)
value
("Diamond"),
("Platinium"),
("Gold"),
("Silver"),
("Member");
insert into customer (name, date_of_births, gender, id_card, phone, email, address, customer_type_id)
value
('Nguyễn Thị Hào', '1970-11-07', 0, '643431213', '0945423362', 'thihao07@gmail.com', '23 Nguyễn Hoàng, Đà Nẵng', 5),
('Phạm Xuân Diệu', '1992-08-08', 1, '865342123', '0954333333', 'xuandieu92@gmail.com', 'K77/22 Thái Phiên, Quảng Trị', 3),
('Trương Đình Nghệ', '1990-02-27', 1, '488645199', '0373213122', 'nghenhan2702@gmail.com', 'K323/12 Ông Ích Khiêm, Vinh', 1),
('Dương Văn Quan', '1981-07-08', 1, '543432111', '0490039241', 'duongquan@gmail.com', 'K453/12 Lê Lợi, Đà Nẵng', 1),
('Hoàng Trần Nhi Nhi', '1995-12-09', 0, '795453345', '0312345678', 'nhinhi123@gmail.com', '224 Lý Thái Tổ, Gia Lai', 4),
('Tôn Nữ Mộc Châu', '2005-12-06', 0, '732434215', '0988888844', 'tonnuchau@gmail.com', '37 Yên Thế, Đà Nẵng', 4),
('Nguyễn Mỹ Kim', '1984-04-08', 0, '856453123', '0912345698', 'kimcuong84@gmail.com', 'K123/45 Lê Lợi, Hồ Chí Minh', 1),
('Nguyễn Thị Hào', '1999-04-08', 0, '965656433', '0763212345', 'haohao99@gmail.com', '55 Nguyễn Văn Linh, Kon Tum', 3),
('Trần Đại Danh', '1994-07-01', 1, '432341235', '0643343433', 'danhhai99@gmail.com', '24 Lý Thường Kiệt, Quảng Ngãi', 1),
('Nguyễn Tâm Đắc', '1989-07-01', 1, '344343432', '0987654321', 'dactam@gmail.com', '22 Ngô Quyền, Đà Nẵng', 2);
insert into rental_type(name)
value
("year"),
("month"),
("day"),
("hour");
insert into type_service(name)
value
("Villa"),
("House"),
("Room");
insert into service (name, area, rental_costs, max_people, room_standard, other_amenities_described, pool_area, number_floors, accompanied_free_servicee, rental_type_id, type_service_id)
value
('Villa Beach Front', 25000, 1000000, 10, 'vip', 'Có hồ bơi', 500, 4, null, 3, 1),
('House Princess 01', 14000, 5000000, 7, 'vip', 'Có thêm bếp nướng', null, 3, null, 2, 2),
('Room Twin 01', 5000, 1000000, 2, 'normal', 'Có tivi', null, null, '1 Xe máy, 1 Xe đạp', 4, 3),
('Villa No Beach Front', 22000, 9000000, 8, 'normal', 'Có hồ bơi', 300, 3, null, 3, 1),
('House Princess 02', 10000, 4000000, 5, 'normal', 'Có thêm bếp nướng', null, 2, null, 3, 2),
('Room Twin 02', 3000, 900000, 2, 'normal', 'Có tivi', null, null, '1 Xe máy', 4, 3);
insert into accompanied_service(name,price,unit,status)
value
('Karaoke', 10000, 'giờ', 'tiện nghi, hiện tại'),
('Thuê xe máy', 10000, 'chiếc', 'hỏng 1 xe'),
('Thuê xe đạp', 20000, 'chiếc', 'tốt'),
('Buffet buổi sáng', 15000, 'suất', 'đầy đủ đồ ăn, tráng miệng'),
('Buffet buổi trưa', 90000, 'suất', 'đầy đủ đồ ăn, tráng miệng'),
('Buffet buổi tối', 16000, 'suất', 'đầy đủ đồ ăn, tráng miệng');
insert into contract(contract_start_date, contract_end_date, deposits, staffs_id, customer_id, service_id)
value
('2020-12-08', '2020-12-08', 0, 3, 1, 3),
('2020-07-14', '2020-07-21', 200000, 7, 3, 1),
('2021-03-15', '2021-03-17', 50000, 3, 4, 2),
('2021-01-14', '2021-01-18', 100000, 7, 5, 5),
('2021-07-14', '2021-07-15', 0, 7, 2, 6),
('2021-06-01', '2021-06-03', 0, 7, 7, 6),
('2021-09-02', '2021-09-05', 100000, 7, 4, 4),
('2021-06-17', '2021-06-18', 150000, 3, 4, 1),
('2020-11-19', '2020-11-19', 0, 3, 4, 3),
('2021-04-12', '2021-04-14', 0, 10, 3, 5),
('2021-04-25', '2021-04-25', 0, 2, 2, 1),
('2021-05-25', '2021-05-27', 0, 7, 10, 1);
use furama_management;
select k.id , k.name , l.name , h.id , count(h.id) as so_lan_dat_phong
from customer k
join customer_type l on k.id = l.id
join contract h on k.id = h.id
where l.name ='Diamond'
group by h.id
order by so_lan_dat_phong;