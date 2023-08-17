create database Assessment05
use Assessment05

create Schema bank

create table bank.Customer
(CId int primary key identity(1000,1),
CName nvarchar(50) not null,
CEmail nvarchar(50) not null unique,
Contact nvarchar(20) not null unique,
CPwd as  (Right(CName, 2) + convert(nvarchar(10),CId) + Left(Contact, 2)) Persisted
)

create table bank.MailInfo
(MailTo nvarchar(50),
MailDate Date,
MailMessage nvarchar(max)
)

create trigger bank.trgMailToCust
on bank.Customer
after insert
as
begin
insert into bank.MailInfo(MailTo, MailDate, MailMessage)
select i.CEmail, GETDATE(), 'Your net banking password is: '+i.CPwd+
'. It is valid upto 2 days only. Update it.' from inserted i
end

select * from bank.Customer

select * from bank.MailInfo

insert into bank.Customer values ('Viya','kavi@gmail.com','7397090543')
insert into bank.Customer values ('Priya','riya@gmail.com','8876942321')