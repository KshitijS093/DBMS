show databases;
create database kshitij_employee;
use kshitij_employee;
create table Dept(
DeptNo int Primary Key,
DName varchar(30),
DLoc varchar(30)
);
create table project(
PNo int Primary Key,
PLoc varchar(30),
PName varchar(30)
);

create table Employee(
EmpNo int Primary key,
Ename varchar(30),
MGR_No int,
HireDate date,
Sal int,
DeptNo int,
foreign key(DeptNo) references Dept(DeptNo)
);
create table incentives(
EmpNo int,
Incentive_date date,
Incentive_Amount int,
Primary key(EmpNo,Incentive_date),
foreign key(EmpNo) references Employee(EmpNo)
);
Create table Assigned_To(
EmpNo int,
PNo int,
Job_Role  varchar(30),
Primary key(EmpNo,PNo),
Foreign key(EmpNo) references Employee(EmpNo),
Foreign key(PNo) references project(PNo)
);

insert into dept values(1,'Accounts','Delhi');
insert into dept values(2,'Technical','Bengaluru');
insert into dept values(3,'HR','Kolkata');
insert into dept values(4,'Maintainence','Jaipur');
insert into dept values(5,'Sales','Mumbai');

insert into Employee values(21,'abc',22,'22-10-21',10000,1);
insert into Employee values(22,'def',22,'22-10-20',15000,2);
insert into Employee values(23,'ghi',22,'22-10-19',20000,3);
insert into Employee values(24,'jkl',null,'22-10-18',25000,4);
insert into Employee values(25,'mno',24,'22-10-17',30000,5);
insert into Employee values(26,'pqr',24,'22-10-16',35000,1);

insert into project values(11,'Jaipur','hex');
insert into project values(12,'Delhi','pqr');
insert into project values(13,'Bengaluru','stu');
insert into project values(14,'Kolkata','vwx');
insert into project values(15,'Jaipur','yz');
insert into Assigned_to values(21,15,'sd1');
insert into Assigned_to values(22,14,'sd2');
insert into Assigned_to values(23,13,'sd3');
insert into Assigned_to values(24,12,'sd4');
insert into Assigned_to values(25,11,'sd5');
insert into Assigned_to values(26,12,'sd6');
insert into Assigned_to values(21,13,'sd7');

insert into incentives values(21,'26-11-21',2000);
insert into incentives values(22,'27-12-22',2500);
insert into incentives values(23,'28-12-22',3000);
insert into incentives values(24,'29-12-22',3500);
insert into incentives values(25,'30-12-22',4000);

show tables;

select EmpNo
From Employee
where EmpNo in(select EmpNo from Assigned_to where PNo in (Select Pno from Project where PLoc in ('Bengaluru','Jaipur','Delhi')));

select EmpNo
From Employee
where EmpNo Not In (Select EmpNo from Incentives);

select e.EmpNo
from Employee e
where Not exists(select i.EmpNo from Incentives i where e.EmpNo = i.EmpNo);

select e.Ename,e.EmpNo,d.DName,a.Job_role,d.DLoc,p.Ploc
from Employee e,Dept d,Assigned_to a,Project p
where e.EmpNo = a.EmpNo and a.PNo = p.PNo and e.DeptNo = d.DeptNo and p.PLoc = d.Dloc;


