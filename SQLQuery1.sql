use school;
create table class1(roll int,name varchar(20),marks int check(marks>0));
insert into class1 values(1,'Dev',90),(2,'Ram',98),(3,'Sayam',89);
insert into class1 values(4,'ghansayam',90);
select*from class1;


--scalar function
create function dbo.getname(@rollno int)
returns varchar(20)
as
begin
      
	  return (select name from class1 where roll=@rollno);
end;
  select dbo.getname(2);

--inline table valued function (return table but execute only one query)
create function dbo.getstudentroll
(
  @inputroll int
  )
returns table
as
return
(
   select*from class1 where roll=@inputroll
)

select*from dbo.getstudentroll(1);


--multi-statement table valued function(return table but execute multiple query
select*from class1;

