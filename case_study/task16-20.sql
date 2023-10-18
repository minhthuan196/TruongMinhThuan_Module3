use furama_management;
delete from staffs 
where id = id not in (
	select s.id
	from staffs s
	join contract c on c.staffs_id = s.id
	where year(c.contract_start_date) in (2019,2020,2021)
	group by s.id
    );