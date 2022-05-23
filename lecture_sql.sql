
create database testdb;
-- drop database testdb;

use testdb;

create table person (
id int not null,
first_name varchar(80) not null,
last_name varchar(255) not null,
status tinyint default false
);

alter table person add birth_date date;
alter table person modify first_name varchar(255);
alter table person add reg_date datetime default now();
alter table person rename column reg_date to registration_date;

drop table person;


create table person (
id int not null,
first_name varchar(255) not null,
last_name varchar(255) not null,
birth_date date not null,
city varchar(80),
status tinyint default false
);


drop table person;

create table person (
id int not null,
first_name varchar(255) not null,
last_name varchar(255) not null,
email varchar(255) not null unique,
birth_date date not null,
city varchar(80),
status tinyint default false
);

drop table person;


create table person (
id int not null primary key auto_increment,
first_name varchar(255) not null,
last_name varchar(255) not null,
email varchar(255) not null unique,
birth_date date not null,
reg_date datetime default now(),
city varchar(80),
status tinyint default false
);

insert into person (first_name, last_name, email, birth_date, reg_date , city, status) values ('mehrdad', 'javan', 'mehrdad.javan@lexicon.se', '1989-02-27', now() , 'vaxjo', false);
insert into person (first_name, last_name, email, birth_date, reg_date , city) values ('mehrdad', 'javan', 'test.test@lexicon.se', '1989-02-27', now() , 'vaxjo');
insert into person value (0, 'test', 'test', 'test.test@test.se', '2000-01-01', now(), 'vaxjo', true);
insert into person (first_name, last_name, email, birth_date, reg_date ) values ('mehrdad', 'javan', 'test.test1@lexicon.se', '1989-02-27', now() );

select * from person;

create table task (
id int not null primary key auto_increment,
title varchar(255) not null,
description varchar(400),
person_id int,
foreign key (person_id) references person(id)
);

select * from task;
select * from  person;
insert into task (title, description, person_id) values('task1', 'test task 1', 1);

create table group_(
id int not null primary key auto_increment,
group_name varchar(255) not null
);

select * from group_;

insert into group_ values(0, 'Java');
insert into group_ values(0, 'C#');



create table persons_groups(
id int not null primary key auto_increment,
person_id int not null,
group_id int not null,
foreign key (person_id) references person(id),
foreign key (group_id) references group_(id)
);

select * from persons_groups;
insert into persons_groups values(0 ,3, 2);



select first_name, last_name from person;
select * from person;

select distinct first_name from person;

select * from person where id = 1 and first_name = 'mehrdad';
select * from person where first_name = 'mehrdad' or city is null;
select * from person where first_name = 'mehrdad' and city is null;

select * from person where id in (1,2,6);
select * from person where birth_date between '1990-02-27' and '2000-01-01';

select * from person where first_name like 'm%';
select * from person where first_name like '%dad';

select * from person order by id desc;

select count(*) from person;


select person.first_name, person.last_name, task.title from person join task on person.id = task.person_id;

select p.first_name, p.last_name from person p;

select * from person;


delete from person where id = 6;

update person set first_name = 'test', last_name = 'test' where id = 6;
