show databases;
create database kshitij_bank;
use kshitij_bank;
create table Branch(
Branchname varchar(30) Primary Key,
Branchcity char(30),
Assets real
);
create table BankAccount(
Accno int primary key,
Branchname varchar(30),
balance int,
foreign key(Branchname)  references Branch(Branchname)
);
create table BankCustomer(
Customername varchar(20) primary key,
Customer_Street varchar(30),
City varchar(20)
);
create table Depositor(
Customername varchar(20),
Accno int,
Primary key(Customername,Accno),
foreign key(Customername) references BankCustomer(Customername),
foreign key(Accno) references BankAccount(Accno)
);
Create table Loan(
Loannumber int primary key,
Branchname varchar(30),
Amount int,
foreign key(Branchname)  references Branch(Branchname)
);
Insert into Branch values("SBI_Chamrajpet","Banglore",50000);
Insert into Branch values("SBI_ResidencyRoad","Banglore",10000);
Insert into Branch values("SBI_ShivajiRoad","Bombay",20000);
Insert into Branch values("SBI_ParlimentRoad","Delhi",10000);
Insert into Branch values("SBI_JantarMantar","Delhi",20000);
select*from Branch;
Insert into BankAccount values(1,"SBI_Chamrajpet",2000);
Insert into BankAccount values(2,"SBI_ResidencyRoad",5000);
Insert into BankAccount values(3,"SBI_ShivajiRoad",6000);
Insert into BankAccount values(4,"SBI_ParlimentRoad",9000);
Insert into BankAccount values(5,"SBI_JantarMantar",8000);
Insert into BankAccount values(6,"SBI_ShivajiRoad",4000);
Insert into BankAccount values(8,"SBI_ResidencyRoad",4000);
Insert into BankAccount values(9,"SBI_ParlimentRoad",3000);
Insert into BankAccount values(10,"SBI_ResidencyRoad",5000);
Insert into BankAccount values(11,"SBI_JantarMantar",2000);
select * from BankAccount;
Insert into BankCustomer values("Avinash","Bull_Temple_Road","Banglore");
Insert into BankCustomer values("Dinesh","Bannergatta_Road","Banglore");
Insert into BankCustomer values("Mohan","NationalCollege_Road","Banglore");
Insert into BankCustomer values("Nikil","Akbar_Road","Delhi");
Insert into BankCustomer values("Ravi","Prithviraj_Road","Delhi");
select * from BankCustomer;
Insert into Depositor values("Avinash",1);
Insert into Depositor values("Dinesh",2);
Insert into Depositor values("Nikil",4);
Insert into Depositor values("Ravi",5);
Insert into Depositor values("Avinash",8);
Insert into Depositor values("Nikil",9);
Insert into Depositor values("Dinesh",10);
Insert into Depositor values("Nikil",11);
select * from Depositor;
Insert into Loan values(1,"SBI_Chamrajpet",1000);
Insert into Loan values(2,"SBI_ResidencyRoad",2000);
Insert into Loan values(3,"SBI_ShivajiRoad",3000);
Insert into Loan values(4,"SBI_ParlimentRoad",4000);
Insert into Loan values(5,"SBI_JantarMantar",5000);
select * from Loan;
select Branchname,(Assets/100000) as assets_in_lakhs
from Branch;
Select D.Customername
from Depositor D,BankAccount B
where B.Accno = D.Accno And B.Branchname = "SBI_ResidencyRoad"
Group by D.Customername
Having count(D.Accno)>=2 ;
create view loanview1(Branchname,Total_Loan) as
select Branchname, SUM(Amount)
from Loan
group by Branchname;
select * from loanview1;
select D.customername
from BankAccount B,Depositor D
where B.Accno in (select Accno from Bankaccount group By Branchname Having Count(Accno)>= 2);
select 
