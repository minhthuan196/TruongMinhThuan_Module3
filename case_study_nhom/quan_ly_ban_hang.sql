create database quan_ly_ban_hang;
use quan_ly_ban_hang;
create table loai_khach_hang (
ma_loai_khach int primary key auto_increment,
ten_loai_khach varchar(30) not null unique);
create table khach_hang (
ma_khach_hang int primary key auto_increment,
ho_ten varchar(150) not null,
gioi_tinh varchar(10) not null,
so_dien_thoai varchar(20) not null,
gmail varchar(50) not null,
dia_chi varchar(200) not null,
ma_loai_khach int not null,
user_name varchar(30) not null unique,
pass_word varchar(20) not null,
foreign key (ma_loai_khach) references loai_khach_hang(ma_loai_khach)
);
create table loai_san_pham (
ma_loai int primary key auto_increment,
ten_loai varchar(50)not null unique,
mo_ta text);
create table san_pham (
ma_san_pham int primary key auto_increment,
ma_loai int not null,
ten_san_pham varchar(100) not null,
so_luong int check(so_luong >=0),
gia float check(gia>0),
mo_ta text,
hinh_anh text,
trang_thai bit(1) default 1,
foreign key (ma_loai) references loai_san_pham(ma_loai));
create table thanh_toan (
ma_tt int primary key auto_increment,
ten_tt varchar (30) not null,
trang_thai bit(1));
create table van_chuyen (
ma_van_chuyen int primary key auto_increment,
trang_thai varchar(50) not null);
create table voucher (
ma_voucher int primary key auto_increment,
giam_gia int check(giam_gia>0),
mo_ta text);
create table don_hang (
ma_don_hang int primary key auto_increment,
ma_tt int not null,
ma_khach_hang int not null,
ma_van_chuyen int not null,
ngay_mua datetime not null,
ngay_giao datetime not null,
trang_thai bit(1),
ten_nguoi_nhan varchar(150) not null,
dia_chi_nhan varchar(200) not null,
so_dien_thoai varchar (20) not null,
ma_voucher int default 1,
foreign key (ma_voucher) references voucher(ma_voucher),
foreign key (ma_tt) references thanh_toan(ma_tt),
foreign key (ma_khach_hang) references khach_hang(ma_khach_hang),
foreign key (ma_van_chuyen) references van_chuyen(ma_van_chuyen));
create table chi_tiet_don_hang (
ma_dhct int primary key auto_increment,
ma_don_hang int not null,
ma_san_pham int not null,
so_luong int default 0 check (so_luong >=0),
foreign key (ma_don_hang) references don_hang(ma_don_hang),
foreign key (ma_san_pham) references san_pham(ma_san_pham));
create table account_admin (
user_ad varchar(20) primary key,
pass_word varchar(20) not null,
trang_thai bit(1));