-- 1. Создать БД airport
-- create database airport;

use airport;

-- 4. Клиент ищет билеты из точки А в точку Б. Однако есть важное условие — стоимость билета не должна превышать 13200. 
-- Напишите запрос, который выведет id билетов, стоимость которых меньше или равна 13200.
-- В выборке должен присутствовать один атрибут — id.

select 
id
from tickets
where price <= 13200;

-- 5. Выведите коды всех рейсов, в рамках которых воздушные судна вылетели из Москвы и в данный момент находятся в воздухе 
-- (статус таких рейсов —  departed). 
-- Коды аэропортов Москвы: SVO, VKO, DME.
-- В выборке должен присутствовать один атрибут — trip_code.

select 
trip_code
from trips
where departure in ('SVO', 'VKO', 'DME') 
and status = 'departed'
;
-- 1. Выведите бортовые номера и дальность полета всех ближне- и дальнемагистральных самолетов. 
-- Примечание: ближнемагистральными считайте те, дальность полета которых > 1000 км и <= 2500 км. 
-- Дальнемагистральными — с дальностью полета >= 6000 км.
-- В выборке должны присутствовать два атрибута — side_number и range.

select 
side_number,
_range
from airliners
where _range between 1000 and 2500 
or _range >=6000
;

-- 6. Найдите данные обо всех билетах с классом обслуживания не Economy и не Business. 
-- Таблица tickets может содержать значения NULL. 
-- В выборке должны присутствовать два атрибута — id, trip_id.
select 
id,
trip_id
from tickets
where service_class not in  ('Economy', 'Business')
;


-- 2. Выведите идентификаторы билетов бизнес-класса дешевле 65 000 и экономкласса дороже 15 000. 
-- Исключите из выборки билеты рейсов VR5SF5YIWN, OZAO28DLFP и LL4S1G8PQW, так как для них ценовая политика не меняется.
-- В выборке должен присутствовать один атрибут — id.

select 
id
from tickets
where service_class = 'Business' and price < 65000 
or service_class = 'Economy' and price > 15000
and trip_id not in ('VR5SF5YIWN', 'OZAO28DLFP','LL4S1G8PQW')
;

-- 3. Номера некоторых билетов рейса RL6EC4YWB1 внесены в базу некорректно: два последних символа билетов серии UE01H8UCJQXX 
-- введены неправильно. 
-- То есть на месте символов XX находятся некорректные значения. 
-- Номера некоторых билетов имеют значение NULL. 
-- Найдите идентификаторы пассажиров всех некорректно введенных билетов.
-- В выборке должен присутствовать один атрибут — client_id.

select 
trip_id
from tickets
where id like 'UE01H8UCJQ%'
;

-- Оператор LIMIT позволяет извлечь определенное количество строк и имеет следующий синтаксис:

-- LIMIT [offset,] rowcount
-- Если оператору LIMIT передается один параметр, то он указывает на количество извлекаемых строк. Если передается два параметра, то первый параметр устанавливает смещение относительно начала, то есть сколько строк нужно пропустить, а второй параметр также указывает на количество извлекаемых строк.

select *
from staff
where position like 'middle%' and age > 20
limit 1;

select *
from staff
where position like 'middle%' and age > 20
limit 2, 3;


-- Оператор ORDER BY сортируют значения по одному или нескольких столбцам.
-- по возрастанию 
select *
from staff
where position like 'middle%' and age > 20
order by age asc
limit 3;

-- по убыванию
select *
from staff
where position like 'middle%' and age > 20
order by age desc
limit 3;

-- Найти самого молодого работника 

select *
from staff
order by age, username;

-- Найти первых трех сотрудников, чьи имена начинаются на A

select * 
from staff
where firstname like 'a%'
limit 3;

-- Найти список работников, у который юзернейм состоит из 5 символов

select *
from staff
where username like '_____';


-- CRUD

-- Create
-- Read
-- Update
-- Delete

-- Простые типы данных

-- char - фиксирванная длина char(10) - max 255 symbol
-- varchar - varchar(100) максимальное кол/во символов - max 255 symbol
-- int/integer - целое число
-- number/numeric/decimal  - числовые данные

-- Создание таблиц

-- create table new_table(
-- 	поле_1 тип_данных,
--     поле_2 тип_данных,
--     поле_3 тип_данных
-- );

create table users(
	id int,
	fullname varchar(255),
	age int
); 

-- удаление таблицы 
drop table users;

create table users(
	id int,
	fullname varchar(255),
	age int
); 

select *
from users;

-- Добавление данных 

-- insert into имя_таблицы (поле_таблицы, ...)
-- values (значиение_поля_таблицы, ...);

insert into users (id, fullname, age)
values (1, 'John Smith', 30);

-- создать таблицу Employees с полями 
-- 	employee_id Целое число,
--  , first_name текст
--  , last_name текст
--  , email текст
--  , phone текст
--  , job_id текст
--  , salary числовое значение decimal
--  , commission_pct числовое значение
--  , manager_id целое число
--  , department_id целое число
--  
 drop table Employees;
 create table Employees(
	employee_id int,
    first_name varchar(20),
    last_name varchar(40),
    email varchar(40),
    phone varchar(20),
    job_id varchar(10),
    salary decimal,
    commission_pct decimal,
    manager_id int,
    department_id int
 );
 
 INSERT INTO employees 
 VALUES 
        ( 100
        , 'Steven'
        , 'King'
        , 'SKING'
        , '515.123.4567'
        , 'AD_PRES'
        , 24000
        , NULL
        , NULL
        , 90
        );
        
INSERT INTO employees VALUES 
	 ( 101
	 , 'Neena'
	 , 'Kochhar'
	 , 'NKOCHHAR'
	 , '515.123.4568'
	 , 'AD_VP'
	 , 17000
	 , NULL
	 , 100
	 , 90
	 );


select * 
from employees;

