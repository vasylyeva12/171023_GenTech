create database gt171023;
use gt171023;
drop database gt171023;
drop table users;

create table users(
id int primary key auto_increment,
first_name varchar(50) not null,
last_name varchar(50) not null,
age int check(age > 18),
email varchar(70) unique,
user_password varchar(50) default '12345',
gender char(1) check (gender in ('f', 'm')),
has_child char(1) check (has_child in ('y', 'n')) 
);
insert into users 
values('Alona', 'Vasylieva', 25, 'dfgg@gmail.com', 'vasyl435', 'm', 'n');
insert into users(first_name, last_name, age, email, user_password, gender, has_child)
values('Bob', 'Steiger', 20, 'dugg@gmail.com', 'vtsyl435', 'm', 'n' );

insert into users 
values(3,'Sveta', 'Maluk', 65, 'dsveg@gmail.com', 'vtsyl435', 'f', 'y');

insert into users(first_name, last_name, age, email, user_password, gender, has_child)
values('Sveta', 'Maluk', 65, 'dsveg@gmail.com', 'vtsyl435', 'f', 'y');

create table students (
id int primary key auto_increment,
firstname varchar (50) not null,
lastname varchar (50) not null,
class integer check (class between 1 and 10),
subject varchar (34) not null,
mark integer check (mark between  0 and 5)
)