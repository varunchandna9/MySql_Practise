create table city(
    cid int not null auto_increment,
    cityname varchar(50) not null ,
    primary key(cid)
);

insert into city (cityname)
values("agra"),
("delhi"),
("bhopal"),
("jaipur"),
("noida");

create table personal(
    id int not null,
    name varchar(50) not null,
    percentage int not null,
    age int not null,
    gender varchar(1) not null,
    city int not null,
    primary key(id),
    foreign key (city) references city (cid)
);


insert into personal (id,name,percentage,age,gender,city)
values
(1,"Ram Kumar",45,19,"m",1),
(2,"Sarita Kumari",55,22,"f",2),
(3,"Salman Khan",62,20,"m",1),
(4,"Juhi Chawala",47,18,"f",3),
(5,"Anil Kapoor",74,22,"m",1),
(6,"John Abraham",64,21,"m",2),
(7,"Shahid Kapoor",52,20,"m",1);


select * from personal p inner join city c
on p.city = c.cid;

select p.id,p.name,p.percentage,p.age,p.gender ,c.cityname from personal p left join city c
on p.city = c.cid
where c.cityname = "agra" order by p.name ;

select * from personal p  right join city c
on p.city = c.cid
where gender ="m"
order by name ;

select * from personal p  right join city c
on p.city = c.cid;


select p.id, p.name as Name  , c.cityname as city from personal p  cross join city c;


select p.id, p.name as Name  , c.cityname as city from personal p , city c;


create table courses(
    course_id int not null,
    courses_name varchar(30) not null ,
    primary key (course_id)
);


insert into courses (course_id,courses_name)
values
(1,"btech"),
(2,"bca"),
(3,"mba");


select * from personal p inner join city c
on p.city = c.cid
inner join courses cr
on p.city = cr.course_id;

select p.id,p.name,p.percentage,p.age,p.gender,c.cityname,cr.courses_name
 from personal p 
 inner join city c
on p.city = c.cid
inner join courses cr
on p.city = cr.course_id
where c.cityname = "agra";

SELECT c.cityname , count(p.city) as total
from personal p inner join city c
on p.city = c.cid
where p.age >= 20
group by city 
order by count(p.city) ;


SELECT c.cityname , count(p.city) as total
from personal p inner join city c
on p.city = c.cid
group by city 
having count(p.city) >3
order by count(p.city) ;


select name from personal
where city = (select cid from city where cityname = "agra");

select name from personal
where city in (select cid from city where cityname  in ( "agra","delhi"));


select name from personal
where   not exists (select cid from city where cityname  in ( "agra"));

select id, name from personal  where city  = "delhi"
union  
select cid , cityname from city where cityname  = "delhi";

select name , age from personal
where city =  (select cid from city where cityname ="delhi")
union all
select cid,cityname from city 
where city =(select cid from city where cityname ="delhi") ;

select p.name, p.age , c.cityname
from personal p inner join  city c
on p.city = c.cid
where c.cityname = "delhi"
union all
select pi.name ,pi.age 
from personal pi 
inner join  city ci 
on pi.city = ci.cid
where ci.cityname="delhi";


select id,name,percentage,
if ( percentage >= 50 , "pass" , "fail" ) as result
from personal ;

select id,name,percentage,
case
    when percentage >= 80 and percentage <=100 then  "merit" 
    when percentage >= 60 and percentage <80 then  "first division" 
	when percentage >= 40 and percentage <59 then  "second division"
    when percentage >= 33 and percentage <=39 then  "3 division"
    when percentage <33 then   "fail" 
    else "not correct %"
end as grade 
from personal ; 

update personal  set percentage = (case id 
    when 3 then 39
    when 7 then 62
end )
where id in (3,7) ;


select 15 + 6 as total ;
select 15 * 6 as total ;
select 15 / 6 as total ;
select 15 div 6 as total ;
select 15 mod 6 as total ;
select 15 - 6 as total ;

select id, name , ( percentage + 5 ) as "new percentage" from personal ;
select id, name , ( percentage * 5 ) as "new percentage" from personal ;


select pi () ;
select round (-4.3) ;
select round (4.3) ;
select round (4.51) ;
select round (1234.987,2) ;

select ceil ( 5.56 );

select floor(4.56);

select pow (10,2);
select sqrt ( 16 );
select sqrt ( 5 );
select round( sqrt ( 5 ) );
select rand ( ) *100 ;
select round(rand ()*100);
select floor ( 7 + rand()*6) ;
select floor(1+rand()*5);

select id ,name , percentage, rand()
from personal;

select id ,name , percentage, rand()
from personal
order by rand();

select abs (-64);

select abs(-.21);

select sign (25);
select sign (0);
select sign (-2);



select id , upper(name) as Name  , percentage
from personal; 

select id , ucase(name) as Name  , percentage
from personal; 

select id , lower(name) as Name  , percentage
from personal; 

select id , lcase(name) as Name  , percentage
from personal; 

select id , char_length(name) as Name  , percentage
from personal; 

select id , name , char_length(name) as Name  , percentage
from personal; 


select id , length(name) as Name  , percentage
from personal; 

select id , concat(name,"varun",percentage) as Name
from personal;

select concat("yahoo","gmail","oyo") as kutta;

select concat_ws("yahoo","gmail","oyo","foodpanda","uber") as kutta;

select ltrim("               yahoo                 ") as kutta;

select rtrim("yahoo                        ") as kutta;

select trim("               yahoooo                      ") as kutta;

select position("f" in "yahoo  gmail facbook") as kutta;


select instr ( "yahoo gmail oyo foodpanda uber", "yahoo" ) as kutta;


select instr ( "yahoo gmail oyo foodpanda uber", "yahoo" ) as kutta;


select locate("a","yahoo baba baba",3);

select substring_index("yahoo .baba .baba",".",4);

select left("yahoo.baba.baba",4);

select right("yahoo.baba.baba",4);

select rpad("yahoo baba",20,"-");

select lpad("yahoo baba",20,"-");

select space(100);

select reverse("yahoo baba");

select replace("yahoo baba","baba","wow");


select strcmp ( "Yahoo Baba"," yahoo baba" );


select strcmp("yahoo baba","yahoo");


select strcmp("baba"," yahoo baba");

select field("a","x","a","k");

select field(5,0,1,2,3,4,5);

select field("ram","varun","shyam","mohan","ram");

select find_in_set("ram","varun,shyam,mohan,ram");

select format(255.3568,2);

select current_date();

select curdate();

select sysdate();
select now();

select date('2021-05-10 16:45:59');

select month('2021-05-10 16:45:59');

select monthname('2021-05-10 16:45:59');

select year('2021-05-10 16:45:59');

select id ,name ,dob ,year(dob) as year from personal ;


select quarter('2021-05-10 16:45:59');

select day('2021-05-10 16:45:59');

select dayofmonth('2021-05-10 16:45:59');

select dayname('2021-05-10 16:45:59');

select dayofweek('2021-05-10 16:45:59');

select dayofyear('2021-05-10 16:45:59');

select week('2021-05-10 16:45:59');

select weekday('2021-05-10 16:45:59');

select yearweek('2021-05-10 16:45:59');

select last_day('2021-05-10 16:45:59');

select extract(month from '2021-05-10 16:45:59');

select extract(day from '2021-05-10 16:45:59');

select extract(year from '2021-05-10 16:45:59');

select extract(week from '2021-05-10 16:45:59');

select extract(hour from '2021-05-10 16:45:59');

select extract(minute from '2021-05-10 16:45:59');

select extract(second from '2021-05-10 16:45:59');

select extract(microsecond from '2021-05-10 16:45:59');

select extract(hour_minute from '2021-05-10 16:45:59');


select adddate("2021-05-10",interval 10 day );

select adddate("2021-05-10",interval 1 month );

select adddate("2021-05-10",interval 1 week );

select adddate("2021-05-10",interval 1 quarter );

select adddate("2021-05-10",interval 12 hour );

select adddate("2021-05-10",interval 24 hour );


select adddate("2021-05-10",interval 5000 minute );



select date_add("2021-05-10",interval 1 month );

select makedate(2023,3 );  #only for januray

select datediff("2021-12-10","1995-05-10" );

select to_days("2021-12-10" ); #since 1 year

select from_days( 738499);

select period_add(738499,5 );

select period_add(738499,5 );


select period_diff(436500,353 );

select date_format("2021-12-10","%d/%b/%y");


select date_format("2021-12-10","%d-%c-%y");



select date_format("2021-12-10","%d-%c-%y ,%W");


select date_format("2021-12-10 02:30:54:54","%d-%c-%y ,%h:%i");


select str_to_date("may 10 2021","%M %d %Y");

select date_sub("2021-12-10",interval 10 month);

select subdate("2021-05-10",interval 1 month );

select weekofyear("2021-05-10" );

select current_time();	

select curtime();


select current_timestamp();

select localtime();


select localtimestamp();

select time("2021-12-10 02:30:54:54");

select hour("2021-12-10 02:30:54:54");

select minute("2021-12-10 02:30:54:54");

select second("2021-12-10 02:30:54:54");


select microsecond("2021-12-10 02:30:54:54");

select timediff("02:30:54", "02:30:54");


select addtime("2021-12-10 02:30:54:54", "5:5:00000.3");

select addtime("2021-12-10 02:30:54:54", "2:25:5:00000.3");

select addtime("2021-12-10 02:30:54:54", " 5 2:25:5:00000.3");


select subtime("2021-12-10 02:30:54:54", " 5 2:25:5:00000.3");


select maketime(16,15,20); #make new time hour minute second

select timestamp("2021-12-10", "02:30:54:54");


select time_format("02:30:54:54","%H");

select time_format("02:30:54:54","%H %i %s");

select time_format("02:30:54:54","%H- %i- %s %p");

select time_to_sec("20:11:18"); #return total seconds

select sec_to_time("72678"); #return time

alter  table personal
add email varchar(250) ;

alter table personal
modify email varchar(250)
after  name ;


alter table personal
modify email int(10);

alter table personal
add unique(email);

alter table personal
change  email  email_id varchar (10);



alter table personal
drop column  email_id ;

alter table studentss
rename personal ;


alter table courses
auto_increment = 4;

truncate table courses;

drop table courses;


create view studentdata
as
select p.id , p.name ,c.cityname from personal p
inner join city c
on p.city = c.cid;

select * from studentdata;


alter view studentdata
as
select p.id , p.name ,c.cityname,p.age from personal p
inner join city c
on p.city = c.cid;

create or replace view  studentdata
as
select p.id , p.name ,c.cityname,p.age from personal p
inner join city c
on p.city = c.cid;


rename table studentdata
to studentcourse;

select * from studentcourse;

drop view studentcourse;


select * from personal
where gender ="m" ;

create index studentgender on personal (gender);

show index from personal;

drop index studentgender on personal;
 
