create database night;
use night;
create table exam(id int, name varchar(20),marks int, check(marks>0 and marks<100));
insert into exam values(1,'Raj',99);
insert into exam values(1,'Raj',909);