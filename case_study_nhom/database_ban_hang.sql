create database ban_hang;
use ban_hang;
create table loai_khach (
id int primary key auto_increment,
ma_khach_hang varchar(10) unique not null,
ten_loai_khach varchar(30),
uu_dai int );
create table vai_tro (
id int primary key auto_increment,
loai varchar(15) );
create table tai_khoan (
id int primary key auto_increment,
user_name varchar(30),
pass_word varchar(30),
id_vai_tro int,
foreign key (id_vai_tro) references vai_tro(id));
create table khach_hang (
id int primary key auto_increment,
ma_khach_hang varchar(20) unique not null,
ho_ten varchar(100),
so_dien_thoai varchar(15),
email varchar(50),
dia_chi varchar(200),
gioi_tinh varchar(15),
id_tai_khoan int,
loai_khach int,
foreign key (loai_khach) references loai_khach(id),
foreign key (id_tai_khoan) references tai_khoan(id) );
create table thanh_toan (
id int primary key auto_increment,
hinh_thuc varchar(20),
trang_thai bit(1) );
create table don_hang (
id int primary key auto_increment,
ma_don_hang varchar(15) unique not null,
id_tai_khoan int,
ten_nguoi_nhan varchar(100),
dia_chi_nhan varchar(200),
so_dien_thoai varchar(20),
email varchar(100),
ngay_dat_hang datetime,
ngay_giao_hang datetime,
trang_thai_van_chuyen varchar(30),
ma_thanh_toan int,
foreign key (id_tai_khoan) references tai_khoan(id),
foreign key (ma_thanh_toan) references thanh_toan(id));
create table loai_san_pham (
id int primary key auto_increment,
ten_loai varchar(50),
mo_ta text );
create table size (
id int primary key auto_increment,
ten_size varchar(50),
mo_ta text );
create table chat_lieu (
id int primary key auto_increment,
ten varchar(50),
mo_ta text );
create table san_pham (
id int primary key auto_increment,
ma_san_pham varchar(15) unique,
id_loai_san_pham int,
id_chat_lieu int,
id_size int,
gia float,
mo_ta text,
hinh_anh text,
foreign key (id_loai_san_pham) references loai_san_pham(id),
foreign key (id_chat_lieu) references chat_lieu(id),
foreign key (id_size) references size(id)
 );
create table chi_tiet_don_hang (
id int primary key auto_increment,
ma_ctdh varchar(15) unique,
id_don_hang int,
id_san_pham int,
gia float,
so_luong int,
foreign key (id_don_hang) references don_hang(id),
foreign key (id_san_pham) references san_pham(id)
);