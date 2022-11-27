show databases;
create database Kshitij_insurance;
use kshitij_insurance;
create table person
( driver_id char(10) primary key,
Dname varchar(30),
address varchar(30));
create table Car
( reg_num char(10) primary key,
model varchar(20),
DYear int);
create table owns
( driver_id char(10),
reg_num char(10),
primary key(driver_id,reg_num),
foreign key(driver_id) references person(driver_id),
foreign key(reg_num) references Car(reg_num));
create table accident(
report_num int,
accident_date varchar(15),
location varchar(30),
primary key(report_num)
);
create table participated(
driver_id char(10),
reg_num char(10),
report_num int,
damage_amount int,
primary key(driver_id,reg_num,report_num),
foreign key(driver_id) references person(driver_id),
foreign key(reg_num) references Car(reg_num),
foreign key(report_num) references accident(report_num)
);
Insert into person values("A01","Richard","Srinivas nagar");
Insert into person values("A02","Pradeep","Rajeji Nagar");
Insert into person values("A03","Smith"," Ashok Nagar");
Insert into person values("A05","Jhon","Hanmanth Nagar");
Insert into person values("A04","Venu","N R Colony");
delete from person where driver_id = "A04";
Insert into car values("KA052250","Indica","1990");
Insert into car values("KA031181","Lauhncer","1957");
Insert into car values("KA095477","Toyota","1998");
Insert into car values("KA053408","Honda","2008");
Insert into car values("KA041702","Audi","2005");
Insert into accident values(11,"01-JAN-03","Mysore Road");
Insert into accident values(12,"02-FEb-04","South end circle");
Insert into accident values(13,"21-JAN_03","Bull Temple Road");
Insert into accident values(14,"17-FEB-08","Mysore Road");
Insert into accident values(15,"04-MAR-05","Kanakpura Road");
Insert into owns values("A01","KA052250");
Insert into owns values("A02","KA053408");
Insert into owns values("A03","KA031181");
Insert into owns values("A04","KA095477");
Insert into owns values("A05","KA041702");
Insert into participated values("A01","KA052250",11,10000);
Insert into participated values("A02","KA053408",12,50000);
Insert into participated values("A03","KA095477",13,25000);
Insert into participated values("A04","KA031181",14,3000);
Insert into participated values("A05","KA041702",15,50000);
select * from participated;
select * from person;
select * from owns;
select * from Car;
select * from accident;
select accident_date,location from accident;
select driver_id from participated where damage_amount >=25000;

