-- CRUD
-- Create - create database, create table 
-- Read - select
-- Update - alter table, update
-- Delete - drop database, drop table, delete

-- create table(..)

-- not null
-- unique
-- check
-- default
-- primary key = not null + unique

-- varchar
-- char
-- int
-- decimal
-- boolean

-- insert into table_name(...)
-- values(...)

-- select column_name..,...
-- from table_name
-- [where ...]
-- limit
-- order by
-- inner join
-- group by
-- having


-- [not] between min and max
-- [not] in ('','','')
-- [not] like '%_'
-- > < >= <= = != <> 
-- is [not] null

-- alter table 
-- add
-- drop
-- modify
-- rename/change

-- set sql_safe_updates = 0;

-- update table_name
-- set ...
-- [where ..]

-- delete from table_name
-- [where ...]

-- inner join 
-- self join
-- left join
-- right join

-- union/union all

-- 1. Создать базу данных tasks. 
-- 2. Переключится на бд tasks.

-- 3. Создать таблицу с названием Employees, которая будет содержать информацию о сотрудниках компании. Таблица должна иметь следующие поля:

-- employee_id - уникальный идентификатор сотрудника (Primary Key, автозаполнение)
-- first_name - имя сотрудника (Not Null)
-- last_name - фамилия сотрудника (Not Null)
-- email - адрес электронной почты сотрудника (Unique, Not Null)
-- age - возраст сотрудника (больше или равно 18)

create table Employees(
	employee_id int primary key auto_increment,
    first_name varchar(128) not null,
    last_name varchar(128) not null,
    email varchar(128) unique not null,
    age int check(age>=18)
);

-- 4. Заполнить таблицу данными с помощью следующих записей:

-- Сотрудник с именем "John", фамилией "Doe", адресом электронной почты "john.doe@example.com" и возрастом 30 лет.
-- Сотрудник с именем "Jane", фамилией "Smith", адресом электронной почты "jane.smith@example.com" и возрастом 25 лет.
-- Сотрудник с именем "Michael", фамилией "Johnson", адресом электронной почты "michael.johnson@example.com" и возрастом 22 года.
-- Сотрудник с именем "Emily", фамилией "Brown", адресом электронной почты "emily.brown@example.com" и возрастом 19 лет.

insert into Employees(first_name, last_name, email, age)
values 
('John', 'Doe', 'john.doe@example.com', 30),
('Jane', 'Smith', 'jane.smith@example.com', 25),
('Michael', 'Johnson', 'michael.johnson@example.com', 22),
('Emily', 'Brown', 'emily.brown@example.com', 19);

-- 5. Найти всех сотрудников в возрасте от 20 до 30 лет.

select * from Employees
where age between 20 and 30;

-- 6. Найти сотрудников с именами "John", "Jane" и "Michael".

select * from Employees
where first_name in ('John', 'Jane', 'Michael');

-- 7. Найти всех сотрудников, у которых адрес электронной почты заканчивается на ".com".

select * from Employees
where email like '%.com';

-- 8. Добавить столбец salary, тип int, где значение по умолчанию будет 0.
alter table Employees
add salary int default 0;

-- 9. Удалить столбец email, который больше не нужен.

-- 10. Изменить тип данных столбца salary на DECIMAL(10,2), чтобы хранить зарплату с точностью до двух знаков после запятой.

alter table Employees
modify salary DECIMAL(10, 2);

set sql_safe_updates = 0;

-- 11. Обновить возраст сотрудника с именем "John" на 32 года.
update employees
set age = 32
where first_name = 'John';

-- 12. Изменить фамилию сотрудника с именем "Emily" на "Jameson".

update employees
set last_name = 'Jameson'
where first_name = 'Emily';

-- 13. Обновить имя и фамилию сотрудника с именем "Jane" и фамилией "Smith" на "Jessica" и "Williams" соответственно.

update employees
set first_name = 'Jessica', last_name = 'Williams'
where first_name = 'Jane' and last_name = 'Smith';

-- 14. Создать столбец status (int)
-- 15. Изменить тип данных столбца на varchar
alter table employees
modify status varchar(128);

-- 16. Обновить столбец status для сотрудников в зависимости от их возраста. Если возраст сотрудника меньше 25, 
-- установить статус "Junior", иначе установить статус "Senior".

update employees
set status = case
				when age < 25 then 'Junior'
                else 'Senior'
			end;
            
-- 17. Создать столбец full_name, который содержит полное имя сотрудника в формате "Имя Фамилия".

alter table employees
add full_name varchar(128);

update employees
set full_name = concat(first_name, ' ', last_name);

-- 18. Удалить таблицу employees
-- 19. Удалить базу данных tasks.
drop database tasks;

-- 20. Создать базу данных shop
-- https://github.com/NelliEfr/MySQL_databases/blob/main/shop.txt

-- 21. Получить информацию о заказах, включая имена продавцов и их города. ORDER_ID, AMT, ODATE, SNAME, CITY
select t1.ORDER_ID, t1.AMT, t1.ODATE, t2.SNAME, t2.CITY
from orders t1
join sellers t2
on t1.sell_id = t2.sell_id;

-- 22. Вывести имя покупателя(CNAME), даты его заказа(ODATE) и имя продавца товара(SNAME).

select t2.CNAME, t1.ODATE, t3.SNAME
from orders t1
join customers t2
on t1.CUST_ID = t2.CUST_ID
join sellers t3
on t1.SELL_ID = t3.SELL_ID;

-- 23. Вывести кол/во продавцов.
select count(*) as sellers_count
from sellers;

-- 24. Найти общее количество продавцов в каждом городе. Вывести город и кол/во.
select city, count(*) as sellers_count
from sellers
group by city;

-- 25. Получить среднюю комиссию для продавцов в каждом городе.



