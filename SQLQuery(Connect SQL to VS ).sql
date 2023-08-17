create database OurDb
use OurDb

create table Employees
(ID int primary key,
FirstName nvarchar(50),
LastName nvarchar(50),
ManagerID int)

insert into Employees values (1,'Sam','DCosta', null)
insert into Employees values (2,'Arsh','Maan', 1)
insert into Employees values (3,'Ruhee','Nazir', null)
insert into Employees values (4,'Danish','Wani', 1)
insert into Employees values (6,'Aditi','Goyal', 3)
insert into Employees values (7,'Rohit','Sharma', 1)
insert into Employees values (9,'Viz','G', 3)

select * from Employees
