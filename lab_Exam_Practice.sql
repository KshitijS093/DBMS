create database proctor_management;
use proctor_management;
create table department
(DNo int primary key,
DName varchar(30),
HOD varchar(20));

create table faculty
(FID int primary key,
Faculty_name varchar(30),
Mobile_no long,
DNo int,
foreign key(DNo) references department(DNo));

create table student
(USN int primary key,
SName varchar(30),
Mobile_No long,
Email varchar(20),
PName varchar(30),
PNo long,
Address varchar(30),
FID int,
DNo int,
foreign key(DNo) references department(DNo),
foreign key(FID) references faculty(FID));

create table course
( CID int primary key,
CName varchar(30),
CCredit int);

create table sem_details
(USN int,
Sem int,
CID int,
CIE int,
Attendance int,
SEE int,
Grade char(1),
CGPA int,
SGPA int,
primary key(USN,CID),
foreign key(CID) references course(CID)
);


create table students_meet
(FID int,
SI_No int Primary key,
SMDate date,
purpose varchar(30),
Outcome varchar(30),
USN int,
foreign key(FID) references faculty(FID),
foreign key(USN) references student(USN)
);

create table parents_meet
(FID int,
SI_No int Primary key,
SMDate date,
purpose varchar(30),
Outcome varchar(30),
USN int,
foreign key(FID) references faculty(FID),
foreign key(USN) references student(USN)
);

create table Sleave
(USN int,
SI_No int primary key,
Ldate date,
reason varchar(30),
Duration varchar(10),
foreign key(USN) references student(USN));

create table activity
(SI_No int primary key,
ADate date,
Company_name varchar(30),
Duration varchar(10));

create table participated
(USN int,
SI_No int,
primary key(USN,SI_NO),
foreign key(USN) references student(USN),
foreign key(SI_No) references activity(SI_No));



Insert into department values(1,"CSE","ABC");
Insert into department values(2,"ISE","DEF");

Insert into Faculty values(1,"Pallavi",1234567890,1);
Insert into Faculty values(2,"Latha",0987654321,1);
Insert into Faculty values(3,"Kavitha",1423587690,2);


Insert into student values(1,"kri",1234567890,"kri@gamil.com","Shn",1234567891,"Jaipur",1,1);
Insert into student values(2,"ksh",1234567892,"ksh@gamil.com","iti",1234567893,"delhi",1,1);
Insert into student values(3,"tij",1234567894,"tij@gamil.com","jit",1234567895,"bengaluru",1,1);
Insert into student values(4,"Mal",1234567896,"mal@gamil.com","loo",1234567897,"Kolkata",2,1);
Insert into student values(5,"lam",1234567898,"lam@gamil.com","hns",1234567899,"Hyderabad",3,2);
Insert into student values(6,"ewn",1234567800,"ewm@gamil.com","mew",1234567801,"Punjab",3,2);

Insert into course values(1,"LD",2);
Insert into course values(2,"Java",3);
Insert into course values(3,"DBMS",4);

Insert into sem_details values(1,3,1,50,90,50,"O",10,10);
Insert into sem_details values(1,3,2,40,90,50,"O",10,10);
Insert into sem_details values(1,3,3,30,90,40,"A",10,10);
Insert into sem_details values(2,3,1,50,90,50,"O",8,9);
Insert into sem_details values(2,3,2,40,90,50,"O",9,9);
Insert into sem_details values(3,3,1,40,90,40,"S",10,10);
Insert into sem_details values(4,5,2,30,90,50,"A",9,9);
Insert into sem_details values(5,5,3,40,90,50,"O",10,10);
Insert into sem_details values(6,5,1,20,90,40,"P",6,6);

Insert into students_meet values(1,1,"2020-12-12","qwerty","ytrewq",1);
Insert into students_meet values(3,2,"2021-12-12","qwert","trewq",5);
Insert into students_meet values(3,3,"2021-12-20","qwer","rewq",5);

Insert into parents_meet values(1,1,"2020-11-12","qwe","ewq",1);
Insert into parents_meet values(1,2,"2021-12-12","qw","wq",1);
Insert into parents_meet values(2,3,"2021-10-20","wer","rew",4);


insert into Sleave values(1,1,"2020-03-12","home","7 days");
insert into Sleave values(1,2,"2020-06-12","relatives house","6 days");
insert into Sleave values(6,3,"2021-03-12","friend home","4 days");

insert into activity values(1,"2020-04-10","Cisco","2 months");
insert into activity values(2,"2021-04-10","absd","3 months");

insert into participated values(1,1);
insert into participated values(2,2);
insert into participated values(4,1);




