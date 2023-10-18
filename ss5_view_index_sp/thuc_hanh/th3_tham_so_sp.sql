-- IN
DELIMITER //
create procedure getCusById
(in cusNum int(11))
begin
  select * from customers where customerNumber = cusNum;
end //
DELIMITER ;
call getCusById(175);
-- OUT
DELIMITER //
create procedure GetCustomersCountByCity(
    in  in_city varchar(50),
    out total int
)
begin
    select count(customerNumber)
    into total
    from customers
    where city = in_city;
end//
DELIMITER ;
call GetCustomersCountByCity('Lyon',@total);
select @total;
-- INOUT
DELIMITER //
create procedure SetCounter(
    inout counter int,
    in inc int
)
begin
    set counter = counter + inc;
end//
DELIMITER ;
set @counter = 1;
call SetCounter(@counter,1); -- 2
call SetCounter(@counter,1); -- 3
call SetCounter(@counter,5); -- 8
select @counter; -- 8