show databases;
use kshitij_bank;
show tables;
select*from Depositor;
create table borrower(
Customername varchar(30),
Loannumber int,
primary key(Customername,Loannumber),
foreign key(Customername) references BankCustomer(Customername),
foreign key(Loannumber) references Loan(Loannumber));
Insert into borrower values("Avinash",1);
Insert into borrower values("Dinesh",2);
Insert into borrower values("Mohan",3);
Insert into borrower values("Nikil",4);
Insert into borrower values("Ravi",5);
select customername 
from depositor d
where d.accno = any(select accno from BankAccount b where b.branchname in(select branchname from branch where branchcity = ("Delhi")))
group by Customername
Having count(customername)=(select count(branchname) from branch where branchcity="Delhi");

select customername from borrower
where customername not in (select customername from depositor);
insert into Bankaccount values(12,"SBI_MantriMarg",2000);
select* from branch;
insert into branch values("SBI_MantriMarg","Delhi",200000);
select Branchname from branch
where Assets > (select max(Assets) from branch where Branchcity='Banglore') And Branchcity <> 'Banglore';
delete from BankAccount 
where Branchname in (select branchname from Branch where branchcity = 'Bombay');


select customername from borrower b
where b.loannumber = any(select l.loannumber from loan l where l.branchname = any(select branchname from branch where branchcity = "Banglore"))
and customername in (select customername from depositor where customername = any(select customername from bankcustomer where city = "Banglore"));

update BankAccount
set balance = 1.05 * balance;
select * from BankAccount;
select * from bankcustomer;


 
