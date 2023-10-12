create database import_export_management;
use import_export_management;
create table supplier(
id int primary key,
name varchar(50) not null,
address varchar(50) not null
);
create table phone_supplier(
phone varchar(20) not null,
supplier_id int not null,
foreign key (supplier_id) references supplier(id)
);
create table orders(
id int primary key,
order_date date not null,
supplier_id int not null,
foreign key (supplier_id) references supplier(id) 
);
create table exports(
id int primary key,
delivery_date date not null
);
create table supplies(
id int primary key,
name varchar(50) not null
);
create table imports(
id int primary key,
import_date date not null
);
create table detail_exports(
exports_id int not null,
supplies_id int not null,
exports_bill int not null,
exports_number int not null,
primary key(exports_id,supplies_id),
foreign key(exports_id) references exports(id),
foreign key(supplies_id) references supplies(id)
);
create table detail_imports(
supplies_id int not null,
imports_id int not null,
imports_bill int not null,
imports_number int not null,
primary key(supplies_id,imports_id),
foreign key(supplies_id) references supplies(id),
foreign key(imports_id) references imports(id)
);
create table detail_orders(
supplies_id int not null,
orders_id int not null,
supplies_bill int not null,
supplies_number int not null,
primary key(supplies_id,orders_id),
foreign key(supplies_id) references supplies(id),
foreign key(orders_id) references orders(id)
);
