-- create
create view customer_views as
select customerNumber, customerName, phone
from  customers;
select * from customer_views;
-- update
create or replace view customer_views as
select customerNumber, customerName, contactFirstName, contactLastName, phone
from customers
where city = 'Nantes';
-- delete
drop view customer_views;