--index
create database Day5Db
use Day5Db

create table Emp
(Id int,
Names nvarchar(50),
Salary float)

insert into Emp values (3,'Viya',65000.90)
insert into Emp values (4,'Ravi',20000.50)
insert into Emp values (9,'Akshaya',40000.90)
insert into Emp values (6,'Prakash',35000.90)
select * from Emp
select * from Emp where Id = 6

--Create CLUSTERED INDEX indexname on <tablename>(column);
create clustered index emp_Id_Index on Emp(Id)
select * from Emp where Names='Prakash'

drop table Emp

create table Emp
(Id int primary key,
Names nvarchar(50),
Salary float)

Create clustered index Emp_Id_Index on Emp(Id)
insert into Emp values (3,'Viya',65000.90)
insert into Emp values (4,'Ravi',20000.50)
insert into Emp values (9,'Akshaya',40000.90)
insert into Emp values (6,'Prakash',35000.90)
select * from Emp
---------------------------------------------------
Create index Emp_Salary_Index on Emp(Salary)

------------------------------------------------------------------
--create NON-CLUSTERESINDEX ix_purchaseorderdetails_rejectedqty 
--on purchasing.purchaseorderdetail
--(rejectedqty desc, productId asc, duedate, orderqty);
--go
----------------------------------------------------
drop table Emp

create table Emp
(Id int primary key,
Names nvarchar(50)not null,
Salary float)

insert into Emp values (3,'Viya',65000.90)
insert into Emp values (4,'Ravi',20000.50)
insert into Emp values (9,'Akshaya',40000.90)
insert into Emp values (6,'Prakash',35000.90)
select * from Emp

create view Emp_view
as
select Names,Salary from Emp

select * from Emp_view

insert into Emp values (3,'Viya',65000.90)
delete from Emp_view where Names='Viya'

select * from Emp_view

alter view Emp_view
as
select Salary from Emp

create view Emp_view2
as
select Names,Salary from Emp

insert into Emp_view2 values ('Ravi',4)
select * from Emp_view2

alter table Emp drop column Names

select * from Emp_view
select * from Emp_view2

create schema bank
create table bank.Customers
(CId int primary key,
CName nvarchar(50) not null,
CODLimit float)

insert into bank.Customers values (3,'Viya',65000.90)
insert into bank.Customers values (4,'Ravi',20000.50)
insert into bank.Customers values (9,'Akshaya',40000.90)
insert into bank.Customers values (6,'Prakash',35000.90)

create view bank.cust_view2
with schemabinding
as
select CName,CId from bank.Customers

select * from bank.cust_view2

alter table bank.Customers drop column CName

use joins

create view viewEmpDept
as
select e.Id,e.Fname+''+e.Lname 'Full Name', d.DName 'Department', d.DId,e.Salary,e.Designation
from Emps e join Depts d on e.DId=d.DId

select * from viewEmpDept where Department = 'Web-Development'
select * from viewEmpDept where Salary>=86000
select * from viewEmpDept where Salary<=86000




