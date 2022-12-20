create database kshitij_Supplier;
use kshitij_Supplier;
create table suppliers(
sid int primary key,
sname char(25),
city char(25)
);
create table parts(
pid int primary key,
pname char(15),
color char(15)
);
create table catalog(
sid int,
pid int,
cost int,
primary key (sid, pid),
foreign key (sid) references suppliers(sid),
foreign key (pid) references parts(pid));

insert into suppliers values 
(10001, 'Acme Widget', 'Bangalore'),
(10002, 'Johns', 'Kolkata'),
(10003, 'Vimal', 'Mumbai'),
(10004, 'Reliance', 'Delhi');
insert into parts values
(20001, 'Book', 'Red'),
(20002, 'Pen', 'Red'),
(20003, 'Pencil', 'Green'),
(20004, 'Mobile', 'Green'),
(20005, 'Charger', 'Black');
insert into catalog values
(10001, 20001, 10),
(10001, 20002, 10),
(10001, 20003, 30),
(10001, 20004, 10),
(10001, 20005, 10),
(10002, 20001, 10),
(10002, 20002, 20),
(10003, 20003, 30),
(10004, 20003, 40);


select distinct p.pname 
from parts p,catalog c
where p.pid = c.pid; 

select s.sname 
from suppliers s
where ((select count(p.pid) from parts p)=(select count(c.pid) from catalog c where c.sid = s.sid));

select sname
from suppliers
where sid in (select sid 
			 from catalog 
			 group by sid
             having pid = ALL(Select pid
							   from parts));
                               
                               

select distinct sname
from suppliers s,parts p,catalog c
where s.sid = c.sid and c.pid = p.pid and p.color='Red';




select pname from parts 
where pid in (select pid from catalog 
			   where sid=(select sid from suppliers where sname="Acme Widget") and pid not in (select distinct pid from catalog where sid!=(select sid from suppliers where sname="Acme Widget")));




select sid
from catalog c
where cost > (select Avg(cost)
			  from catalog p
			   where c.pid = p.pid
               group by pid);
               
               
select pid,sname
from suppliers s, catalog c
where s.sid = c.sid and s.sid in (select sid
								from catalog 
								where cost = (select max(cost)
												from catalog p
												where c.pid = p.pid
												group by pid));
                            
		
               
               
               











