create database marathon;
use marathon;
drop table enrollments;
create table Students(studentid int, firstname varchar(20),lastname varchar(20),age int, gpa decimal(18,2));
insert into Students values(1,'John','Smith',20,3.75),(2,'Emily','Johnson',22,3.90),(3,'Michael','Davis',21,3.60);

create table Courses(courseid int, coursename varchar(20),credits int);
insert into Courses values(101,'Mathematics',3),(102,'History',4),(103,'Computer Science',3);

create table Enrollments(enrollmentid int, studentid int,courseid int,enrollmentdate datetime);
insert into Enrollments values(1,1,101,'2023-01-15 10:30:00'),(2,2,102,'2023-02-20 14:45:00'),(3,1,103,'2023-03-05 08:15:00');
--1
select firstname, lastname  from Students where gpa>3.7;
--2
select sum(Courses.credits) from Courses inner join Enrollments on Courses.courseid=Enrollments.courseid 
inner join students on Enrollments.studentid=students.studentid
group by Courses.credits;


--3
select Enrollments.studentid , Courses.courseid, coursename from Enrollments inner join  Courses on Enrollments.courseid=Courses.courseid where coursename='Mathematics';
--4
select Enrollments.studentid , Courses.courseid, coursename, 
(select avg(age)from students where studentid=1) from Enrollments
inner join  Courses on Enrollments.courseid=Courses.courseid 
inner join Students on Enrollments.studentid= Students.studentid where coursename='Computer Science';
--5

select*from students;
update students set gpa=0.1+gpa;

--6


select c.coursename,count(e.courseid)as 'highest' from employees e
join courses c on e.courseid=c.courseid group by c.courseid order by highest;










-------------------------------------
create database marathon3;
use marathon3;
create table Customers(customerid int, firstname varchar(20),lastname varchar(20),email varchar(30), registrationDate date);
insert into Customers values(1,'john','doe','john@example.com','2023-01-10'),(2,'jane','smith','jane@example.com','2023-02-15'),(3,'michael','johnson','michael@example.com','2023-03-20');


create table orders(orderid int,customerid int,orderdate datetime,totalamount decimal(18,2) );
insert into orders values(101,1,'2023-01-15 10:30:00',150.00);
insert into orders values(102,2,'2023-02-20 14:45:00',200.00);
insert into orders values(103,1,'2023-03-05 08:15:00',75.00);
drop table orders;
create table products(productid int,productname varchar(20),prise decimal(18,2),quantityinstock int)
insert into products values(1001,'widget A',25.00,50);
insert into products values(1002,'widget B',30.00,75);
insert into products values(1003,'widget C',20.00,30);


select*from customers;
select*from orders;
select* from products;


select Customers.firstname  from Customers inner join  orders on Customers.customerid=orders.orderid 
where orderdate=(select DATEPART(month,orderdate) from Customers);

select Customers.firstname  from Customers inner join  orders on Customers.customerid=orders.orderid 
where 02=(select DATEPART(month,orderdate) from Customers);



--1
SELECT DISTINCT c.firstname, c.lastname FROM Customers c JOIN orders o ON c.customerid = o.customerid where MONTH(o.orderdate) = 2 AND YEAR(o.orderdate) = 2023;

--2
SELECT c.customerid, c.firstname, c.lastname, sum(o.totalamount) AS totalamount FROM Customers c LEFT JOIN orders o ON c.customerid = o.customerid GROUP BY c.customerid, c.firstname, c.lastname;
--3
SELECT *FROM products WHERE prise > 25.00 AND quantityinstock > 50;

--4
SELECT avg(totalamount)  FROM orders WHERE MONTH(orderdate) = 1 AND YEAR(orderdate) = 2023;

--5
UPDATE products set prise = 30.00
where productname = 'widget A';
select*from products;

--6

select Customers.firstname from customers inner join orders on customers.customerid=orders.customerid where orders.totalamount=(select max(totalamount)from orders) group by customers.firstname;











--------------------------------------------------3----------------------
------------------------
create database marathon2;
use marathon2;
create table products(productid int, productname varchar(20),categoryid int,price decimal(18,2),quantityinstock int);
insert into products values(1,'laptop',1,1800.00,10);
insert into products values(2,'smartphone',1,1500.00,20);
insert into products values(3,'Monitor',2,1250.00,15);

drop table products;
create table categories(categoryid int, categoryname varchar(20));
insert into categories values(1,'Electronics'),(2,'peripherals'),(3,'Furniture');
create table orders(orderid int,customerid int,orderdate datetime,totalamount decimal(18,2));
insert into orders values(101,1,'2023-01-15 10:30:00',1500.00),(102,2,'2023-02-20 14:45:00',800.00),(103,1,'2023-03-05 08:15:00',450.00);

select*from products;
select*from categories;
select * from orders;




--1
SELECT productname
FROM products
WHERE categoryid = (SELECT category FROM categories WHERE categoryname = 'Electronics');


--2

select products.productname,products.price from products
inner join categories on products.categoryid=categories.categoryid
where products.price=(select max(price) from products);


--3
SELECT *
FROM products
WHERE price > 300 AND quantityinstock > 5;

--4
SELECT AVG(totalamount) AS average_total_amount
FROM orders
WHERE MONTH(orderdate) = 2 AND YEAR(orderdate) = 2023;



--5
UPDATE products
SET quantityinstock = 15
WHERE productname = 'laptop';


--6 
select top 1 customerid,sum(totalamount) as maxtotalamount from orders group by customerid order by maxtotalamount desc;


-------------5----------------------
create database mp2;
use  mp2;
create table student( studentid int primary key, firstname varchar(20),lastname varchar(20),age int ,gpa decimal(18,2));
 insert into student values(1,'john','doe',23,3.75),(2,'jane','simith',22,3.90),(3,'michaal','johnson',21,3.60);

 create table courses (courseid int, coursenamr varchar(20),instutuctor varchar(20), credit int;

 insert into courses values(1,'database','dr smith',3),(2,'data structure','pof'






--------------------------------------------------4--------------------------------


create database lastmarathon;
use lastmarathon;

create table employees(employeeid int, firstname varchar(20),lastname varchar(20),departmentid int,salary decimal(18,2));

insert into employees values(1,'john','doe',101,60000.00),(2,'jane','smith',102,55000.00),(3,'michael','johnson',101,65000.00);

create table departments(departmentid int,departmentname varchar(20));
insert into departments values(101,'sales'),(102,'Marketing'),(103,'finance');

create table orders(orderid int,employeeid int,orderdate date,totalamount decimal(18,2));
insert into orders values(1001,1,'2023-01-15',1500.00),(1002,2,'2023-02-20',800.00),(1003,1,'2023-03-05',450.00);



--1
SELECT firstname, lastname, salary
FROM employees
WHERE departmentid = (SELECT departmentid FROM departments WHERE departmentname = 'sales');
--2
SELECT e.firstname, e.lastname, COALESCE(SUM(o.totalamount), 0) AS total_order_amount
FROM employees e
LEFT JOIN orders o ON e.employeeid = o.employeeid
WHERE e.departmentid = (SELECT departmentid FROM departments WHERE departmentname = 'sales')
GROUP BY e.employeeid, e.firstname, e.lastname;

--3
SELECT *
FROM employees
WHERE salary > 5500 AND departmentid = (SELECT departmentid FROM departments WHERE departmentname = 'Marketing');

--4
SELECT AVG(totalamount) AS avg_total_amount
FROM orders
WHERE MONTH(orderdate) = 2 AND YEAR(orderdate) = 2023;

--5
UPDATE employees
SET salary = 65000
WHERE firstname = 'John' AND lastname = 'Doe';

--6

select top 1 departments.departmentname, avg(salary) as total from departments join employees on departments.departmentid=employees.departmentid group by departmentname order by total desc;






---------5-------
