create database kpit;
use kpit;
create table employee (id TINYINT primary key, name varchar(20),salary float,DOJ date);
insert into employee (id,name,salary,DOJ) values(1,'Dev',20988,'2024-01-15');
insert into employee (id,name,salary,DOJ) values(2,'Raj',20988,'2020-08-15');
insert into employee (id,name,salary,DOJ) values(3,'Ram',20944,'2024-09-10');
insert into employee (id,name,salary,DOJ) values(4,'Sayam',26688,'2021-01-31');
insert into employee (id,name,salary,DOJ) values(5,'Ghansayam',90988,'2014-11-05');
insert into employee (id,name,salary,DOJ,location) values(7,'Ayushi',9099.98,'2019-11-05','Darbhanga');

select*from employee;
alter table employee add location varchar(50);
update employee set location='Pune' where id=1;
update employee set location='Samastipur' where id=2;
update employee set location='Gopalganj' where id=3;
update employee set location='Patna' where id=4;
update employee set location='Bettiah' where id=5;
select*from employee;
select name,salary from employee where salary>21000;

select* from employee where salary>(select avg(salary) from employee);

select*from employee where salary>20000 and id>5;
select* from employee where salary<10000 or location='darbhanga';
select*from employee where not location='darbhanga';
select salary, salary*2000 from employee;
select*from employee where location like 'p%';
select*from employee where name like '%r%';
select*from employee where name like '_a%';
select*from employee where name like '[ps]%';
select*from employee where name like '[^p^s]%';
select SUM(salary) as sumofsalary from employee;
select avg(salary) as avgsalary from employee;
select count(salary) from employee;
select count(*) from employee;
select min(salary) from employee;
select max(salary)from employee;
select*from employee;

select floor(salary)from employee where id=7;
select round(salary,1)from employee where id=7;
select ceiling(salary)from employee where id=7;
select upper(name)from employee;
select lower(name)from employee;
select name, len(name) as namelen from employee;
select name,replace(name,'sayam','raja') from employee;
select name, SUBSTRING(name,1,3)from employee;

select DOJ,getdate() from employee;
select DOJ,getdate(),DATEDIFF(year,DOJ,getdate()) from employee;

select DOJ,DATEADD(month,2,DOJ)from employee where id=1;
select DOJ,dateadd(year,-6,DOJ)from employee where id=6;
select DOJ from employee;

select doj ,DATEPART(year,DOJ)from employee;


select doj, datepart(day,DOJ)from employee;



select id from employee order by id desc ;


alter table employee add departmeny varchar(20);
alter table employee drop column departmeny;

select*from employee;
alter table employee add department varchar(20);

update employee set department='CSE' where id=1;
update employee set department='Civil' where id=2;
update employee set department='Civil' where id=3;
update employee set department='ME' where id=4;
update employee set department='CSE' where id=6;
select*from employee;

select department,avg(salary) from employee group by department;

select department,sum(salary) as sumofdep from employee  group by department;
select distinct salary from employee;

create table sales(salesId TINYINT primary key, id TINYINT,itemName varchar(20),itemCost int);
--drop table sales;
--alter table employee add foreign key(id) references sales(id);

insert into sales values(1,1,'pizza',99),(2,1,'Butter chicken',120),(3,7,'puti',30);
select*from sales;
select*from employee;
select*from employee inner join sales on employee.id =sales.id;
select employee.name,Sales.itemCost from employee inner join sales on employee.id=sales.id where itemcost>=(select avg(itemcost) from sales);
select*from employee left join sales on employee.id=sales.id;

select*from employee right join sales on employee.id=sales.id;

select*from employee full outer join sales on employee.id=sales.id;

create table project(projectId TINYINT primary key, id TINYINT,projectName varchar(20),projectlocation varchar(30));
insert into project values(1,1,'automotive','pune'),(2,1,'body','bihar'),(3,6,'automotive','bettiah');
select*from project;

create table orders(orderid TINYINT primary key,orderdate date,id TINYINT, foreign key(id) references project(projectid), ON DELETE CASCADE);

insert into orders values(1,'2024-09-08',1);
select*from orders;
select*from employee right join sales on employee.id=sales.id inner join project on sales.id=project.id;

create view illusion as select*from project;
select*from illusion;

select employee.name,sales.itemName from employee inner join sales on employee.id=sales.id 
where sales.itemName like 'p%';

select * from employee;
select * from sales;

select sales.itemName, employee.name from sales inner join employee on sales.id=employee.id where DOJ>(GETDATE(month,doj)> from employee);




