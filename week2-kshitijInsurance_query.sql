show databases;
use kshitij_insurance;
show tables;
select*from car;
select*from participated;
select * from owns;
select*from accident;
update participated
set  damage_amount=26000 
where report_num = 12 && reg_num = "KA053408";
select * from car order by Dyear;
select count(model) from car,accident where model = "Audi";
select count(accident_date) from accident where accident_date like"%08";
insert into accident values(16,"18-feb-05","banglore");
select count(car.reg_num)
from participated,car
where car.model = "Audi" && car.reg_num = participated.reg_num;
select count(participated.driver_id)
from participated,accident
where accident.accident_date like "%08" && accident.report_num = participated.report_num;
insert into car values("KA095476","Audi",1999);
select avg(damage_amount) from participated;
delete from participated where damage_amount < (select avg(damage_amount) from participated);
