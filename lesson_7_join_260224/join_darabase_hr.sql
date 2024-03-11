use gt171023;

select * from employees;

-- Сделать сортировку по зарплате
select * from employees
order by salary desc;

-- Вывесто соотрудника который получает самую высокую зп:
select * from employees
order by salary desc
limit 1;

create table prod(
	id int primary key auto_increment,
    prodName varchar(128) not null,
    manufacturer varchar(128) not null,
    count int default 0,
    price int not null
);

insert into prod(prodName, manufacturer, count, price)
values ('iPhone 13 pro max', 'Apple', 3, 2000),
		('iPhone 13', 'Apple', 4, 1000),
        ('Galaxy S9', 'Samsung', 10, 800), 
        ('Galaxy S8', 'Samsung', 5, 700),
        ('Redmi note 9', 'Xiaomi', 10, 800);
        
-- Вывести всех производителей.

select manufacturer from prod;

-- DISTINCT - выборка уникальных значений 

 select distinct manufacturer from prod;
 
 insert into prod(prodName, manufacturer, count, price)
values ('iPhone 13 pro', 'Apple', 3, 2000);

select distinct manufacturer, count
from prod;

-- Если значения и manufacturer, и count повторяются, считается дубликатом

create table user_bremen(
id int primary key auto_increment, 
first_name varchar(128), 
last_name varchar(128),
age int);

create table user_berlin(
id int primary key auto_increment, 
first_name varchar(128), 
last_name varchar(128),
age int, 
phone varchar(128));
insert into user_bremen(first_name, last_name, age)
values ('Linda', 'Johnson', 45),
		('John', 'Smith', 25),
        ('Laura', 'Thomas', 35),
        ('Barbarra', 'Jones', 21);


insert into user_berlin(first_name, last_name, age, phone)
values ('Carol', 'Robinson', 32, '+12233245436'),
		('Barbarra', 'Jones', 21, '+234234232'),
		('Meliissa', 'King', 20, '+123242343'),
        ('Amy', 'Wans', 56, '+12343253654'),
        ('Laura', 'Thomas', 35, '+323423423423');
        
select  first_name, last_name, age
from user_bremen
union all
select first_name, last_name, age
from user_berlin;


-- Union позволяет обединоть две пднотипных выборки.
select  first_name, last_name, age
from user_bremen
union
select first_name, last_name, age
from user_berlin;

-- Получаем дубликаты, чтобы вывести только уникальные значения после обединения используем union.

select  first_name, last_name, age
from user_bremen
union
select first_name, last_name, age, phone
from user_berlin;
-- The used SELECT statements have a different number of columns
-- Кол/во столбцов не совп.

-- Добавляем новое поле null и даем ему псевдоним phone
select  first_name, last_name, age, null as phone
from user_bremen
union
select first_name, last_name, age, phone
from user_berlin;

create table goods(
id integer primary key,
title varchar(128),
quantity integer check(quantity between 0 and 10)
);

insert into goods (id, title, quantity) values(1, 'велосипед', 4);
insert into goods (id, title, quantity) values(2, 'лыжи', 5);
insert into goods (id, title, quantity) values(3, 'коньки', 7);
insert into goods (id, title, quantity) values(4, 'скейт', 2);

create table goods_1(
id integer primary key,
title varchar(128),
price integer,
quantity integer check(price between 0 and 10)
);

insert into goods_1 (id, title, price, quantity) values(1, 'велосипед', 12000, 4);
insert into goods_1 (id, title, price, quantity) values(2, 'лыжи', 10000, 5);
insert into goods_1 (id, title, price, quantity) values(3, 'коньки', 6000, 7);
insert into goods_1 (id, title, price, quantity) values(4, 'скейт', 10000, 2);

create table goods1(
id integer primary key,
title varchar(128),
quantity integer check(quantity between 0 and 10)
);

insert into goods1 (id, title, quantity) values(1, 'велосипед', 4);
insert into goods1 (id, title, quantity) values(2, 'лыжи', 5);
insert into goods1 (id, title, quantity) values(3, 'коньки', 7);
insert into goods1 (id, title, quantity) values(4, 'скейт', 2);

	create table goods2(
	id integer primary key,
	title varchar(128),
	price integer,
	quantity integer check(price between 0 and 10)
	);

insert into goods2 (id, title, price, quantity) values(1, 'велосипед', 12000, 4);
insert into goods2 (id, title, price, quantity) values(2, 'лыжи', 10000, 5);
insert into goods2 (id, title, price, quantity) values(3, 'коньки', 6000, 7);
insert into goods2 (id, title, price, quantity) values(4, 'скейт', 10000, 2);
-- объединить данные из goods1 и goods2 (без дублей)
create table goods2(
	id integer primary key,
	title varchar(128),
	price integer,
	quantity integer check(quantity between 0 and 10)
	);

insert into goods2 (id, title, price, quantity) values(1, 'велосипед', 12000, 4);
insert into goods2 (id, title, price, quantity) values(2, 'лыжи', 10000, 5);
insert into goods2 (id, title, price, quantity) values(3, 'коньки', 6000, 7);
insert into goods2 (id, title, price, quantity) values(4, 'скейт', 10000, 2);

-- объединить данные из goods1 и goods2 (без дублей)


-- объединить данные из goods1 и goods2 (все записи)

-- объединить данные из goods1 и goods2, указав price, где это возможно - Вывести title, quantity, price

select title, quantity, null as price
from goods1
union 
select title, quantity, price
from goods2;

select *
from regions;

select * 
from countries;

-- Вывести country_name, region_name
-- имя_таблицы.имя_столбца

 select countries.country_name, regions.region_name -- перечисление полей
 from countries -- основная таблица
 inner join regions -- объедняем с таблицей ...
 on countries.region_id = regions.region_id; -- через какое условие объединяем
 
 -- Вывести города(city) и страны(country_name)

 select locations.city, countries.country_name
 from locations
 join countries
 on locations.country_id = countries.country_id;
 
 -- Вывести города(city), страны(country_name), регионы(region_name)
 
 select locations.city, countries.country_name, regions.region_name
 from locations
 join countries
 on locations.country_id = countries.country_id
 join regions
 on countries.region_id = regions.region_id;
 
 
 select locations.city, countries.country_name, regions.region_name
 from countries
 join locations
 on locations.country_id = countries.country_id
 join regions
 on countries.region_id = regions.region_id;
 
 -- Вывести город и регион
 select locations.city, regions.region_name
 from countries
 join locations
 on locations.country_id = countries.country_id
 join regions
 on countries.region_id = regions.region_id;
 
 use hr;
 
 -- Вывести имя и фамилию сотрудника и название его департамента
 -- first_name, last_name, department_name
 
 select 
 t1.first_name,
 t1.last_name,
 t2.department_name
 from employees t1
 inner join departments t2
 on t1.department_id = t2.department_id;
 
 select first_name, last_name, department_name 
 from employees
 join departments
 on employees.department_id = departments.department_id and first_name like "A%";
 
 -- Вывести имя, фамилию и название департамента только тех сотрудников, у которых имя начинается на букву 'А'
 select first_name, last_name, department_name 
 from employees
 join departments
 on employees.department_id = departments.department_id
 where first_name like "A%";
 
 