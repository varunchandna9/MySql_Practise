create database college;
use college;
create table faculty (fid int , fname varchar (100) , qualification varchar (50) , deptid int ) ;
create table student (sid int , sname varchar (100) , branch varchar (50) , marks int ) ;
create table department (deptid int , dname varchar (100) ) ;


insert into faculty values (1,"aman","btech",1);
insert into faculty values (2,"vishal","mtech",1);
insert into faculty values (3,"mohan","mtech",1);
insert into faculty values (4,"priya","phd",2);
insert into faculty values (5,"ravi","phd",3);
insert into faculty values (6,"aarti","m.tech",2);


insert into student values (1,"lalit","it",75);
insert into student values (2,"mahesh","it",90);
insert into student values (3,"sagar","cse",92);
insert into student values (4,"arun","cse",45);
insert into student values (5,"shikha","ece",56);
insert into student values (6,"anand","ece",78);
insert into student values (7,"parul","it",82);



insert into department values (1,"it");
insert into department values (2,"cse");
insert into department values (3,"ece");


select fname from faculty;


select fid , fname from faculty;

select * from faculty;

select deptid, dname from department;



select  * from department ;


select branch from student;

select distinct  branch from student;


select * from faculty;

select distinct qualification ,deptid from faculty;

commit;

select fid ,fname from faculty
where qualification ="btech";

select * from faculty
where qualification !="phd"; 

select sname from student
where branch ="it" and marks <80;

select sname from student 
where branch ="it" or branch="ece"; 


select fname from faculty 
where deptid=1 or deptid =3;

select fname from faculty
where deptid  in (1,3);

select * from faculty
where qualification   in ('btech','phd');


select * from student
where branch  not in ('it','cse');

select * from student
where marks  between 60 and 90;

select * from student
where marks not between 50 and 60 ;

select * from student
where marks not between 70 and 90 ;

select * from faculty
limit 4 ;

select * from faculty
limit 1,4 ;

select * from faculty
limit 1,2 ;

select * from student order by marks desc limit 1,1;

select sname from student order by marks desc limit 1,1;
insert into student(sid,sname,marks  )
values(8,"jhon",82);


select sname from student 
where branch is null;

select sname from student 
where branch is not null;

select * from faculty
where fname like "a%";

select * from faculty
where fname like "%n";

select sname ,marks from student
where sname like "_a%" ;

select sname ,marks from student
where sname like "p____" ;

select * from faculty
where fname  not like "%n";

select sname ,marks from student
where sname  not like "_a%" ;

select * from student order by  sname asc ;

select * from student order by  sname desc ;

select * from student order by  marks desc ;

select * from student order by sname desc ,marks asc ;

select * from faculty order by qualification;


select * from faculty order by  field(qualification,'mtech','phd','btech');

select * from faculty;
select * from department;

select * from faculty cross join department ;

select * from faculty cross join department d where d.deptid = 1;

select * from department ;
select f.fname , d.dname from faculty f inner join department d
on f.deptid=d.deptid;

select * from department ;
select f.fname , d.dname from faculty f inner join department d
on f.deptid = d.deptid
where d.deptid=2;

insert into department values(4,"eee");

select * from department ;
select f.fname , d.dname from faculty f left join department d
on f.deptid = d.deptid;

select * from department ;
select f.fname , d.dname from faculty f right join department d
on f.deptid = d.deptid;


insert into faculty values(7,"varun","phd",5) ;

create table emp( empid int, ename varchar(20), esuper int);
insert into emp (empid,ename,esuper)
values
(1,"a",2),
(2,"b",3),
(3,"c",4);

select e.ename as "employee name" , s.ename as "supervisor" 
from emp e, emp s
where e.esuper = s.empid;

select * from student;
select sum(marks) from student;


select count(*) from student;

select branch,count(*) from student group by branch;

select branch,sum(marks) from student group by branch;

select branch,avg(marks) from student group by branch having  branch in ("cse" , "it");

select branch,sum(marks) from student group by branch having  branch in ("cse" , "it");

select * from faculty;
select * from department;

select fname from faculty where deptid  in (select deptid from department where dname = "it");


#select fname from faculty where deptid  = (select deptid from department where dname in ("it","cse");


select fname from faculty where deptid  in (select deptid from department where dname in ("it","cse"));

select branch ,avg(marks) from student
where branch in (select dname from department where deptid not in (1,3 ))
group by branch;

select branch ,avg(marks) from student
where exists (select dname from department where deptid not in (1,3 ))
group by branch;

select * from student where exists (select * from department where deptid=1);
select * from student where exists (select * from department where deptid=5);


select * from student where not exists (select * from department where deptid=1);

select * from student where not exists (select * from department where deptid=5);

select sname from student
union
select fname from faculty;

insert into student values(9,"varun","ece",70) ;

select sname from student
union all
select fname from faculty;

#intersect
select fname from faculty where fname in (select sname from student);


select  distinct fname from faculty where fname in (select sname from student);



select * from faculty;
select * from department;

select deptid from faculty left join department d using(deptid) where d.deptid is null;

#minus
select fname from faculty 
where  deptid in (select deptid from faculty left join department d using(deptid) where d.deptid is null);




insert into department values (5,"ice");

insert into department (dname,deptid) values ("temp",5);

insert into department values ("temp",5);

insert into department values
(7,"a"),
(8,"b");

create table  dept_temp ( deptid int ,deptname varchar (20) );


insert into dept_temp
select deptid,dname from  department;

commit;


update dept_temp
set deptname = "applied science"
where deptid=7;

update dept_temp
set deptname =(select branch from student where sname ="lalit")
where deptid =1;


select * from dept_temp;

delete from dept_temp
limit 2;

delete from dept_temp
where deptid = 0 ;

delete from dept_temp;

select * from dept_temp;

rollback;

create database eec;

show databases;

use college;

drop database eec;

create table emp_new (empid int , ename varchar(20) not null, salary int);

insert into emp_new (empid,ename,salary) 
values(1,"a",2000);

insert into emp_new (empid,ename) 
values(2,"c");

create table emp_new (empid int unique , ename varchar(20) , salary int  not null);

insert into emp_new (empid,ename) 
values(3,"b");

insert into emp_new (empid,ename,salary) 
values(2,"b",4000);

alter table emp_new
change salary salary int not null;

describe emp_new;

insert into emp_new (empid,ename,salary) 
values(2,"b",4000);

create table emp_new (empid int unique , ename varchar(20) , salary int  not null, constraint u1 unique(empid,ename));
insert into emp_new (empid,ename,salary) 
values(2,"b",4000);

create table emp_new (empid int unique , ename varchar(20) , salary int default 1000);
insert into emp_new (empid,ename) 
values(2,"b");

insert into emp_new (empid,ename,salary) 
values(3,"c",4000);

create table emp_new (empid int unique auto_increment primary key , ename varchar(20) , salary int default 1000);

insert into emp_new (ename,salary) 
values("b",4000);


create table emp1(empid int primary key , ename varchar (10) );
create table emp2(empid int primary key , ename varchar (10) );

describe emp2;

create table emp3(empid int, ename varchar (10),primary key (empid,ename) );

describe emp3;

create table emp4(empid int, ename varchar (10) );

alter table emp4
add primary key (empid);


describe emp4;

create table e1 (eid int primary key ) engine = InnoDB;

create table d1 (did int ,foreign key(did) references e1(eid)) engine=InnoDB;


insert into e1 value (1);
insert into e1 value (2);

insert into di (did) values (1);

insert into di values (3);

alter table emp2
add column dept int not null
after empid;

describe emp2;


alter table emp2
add column temp int not null;

alter table emp2
drop column temp ;
 
rename table emp2 to emp6;

describe emp6;


truncate emp6;

drop  table emp6;

create table emp1(empid int, ename varchar (10) );
create index i1 on emp1 (empid);

show index from emp1;

drop index i1 on emp1;


create table e1 (eid int primary key ) engine = InnoDB;

create index i1 on e1 (eid);

show index from e1;

drop index i1 on e1;


select *from student;

create view view1
as 
select * from student
where branch in ("it","cse");


select*from view1;


use college;
create view f1
as 
select f.sname,d.dname 
from faculty f , department d
where f.sid = d.deptid ; 

select avg(marks) from student;

create view f2
as 
select sname, marks from student
where marks > (select avg(marks) from student);

select * from f2;

insert into student values(10,"marry","eee",90);

select * from f2;


create view v4 
as 
select * from faculty 
where deptid in(1,2);

select * from v4;


insert into v4 values (10,"temp1","php",1);
insert into v4 values (11,"temp2","phd",3);


select * from faculty;

select * from v4;


update v4
set deptid = 3 where fid = 6;

delete from v4 where fid = 7;

create  view v5 
as 
select * from department where deptid = 1; 

select * from v5;


insert into v5 values (10,"maths");
select * from department ;


create  view v6 
as 
select * from department where deptid = 1 with check option; 

select * from v6;
insert into v6 values (10,"maths");
select * from department ;


show create view v6;


alter view v6
as 
select * from department where deptid = 2;
select * from v6;


drop view v6;

