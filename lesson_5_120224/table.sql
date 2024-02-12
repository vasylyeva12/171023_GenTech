-- CRUD

-- create  
-- read 
-- update - update table_name 
-- delete - delete table_name

-- alter table table_name
-- add
-- modify
-- change 
-- drop

use gt171023;

-- Создать таблицу fruits
-- id целое число первичный ключ авто заполнение
-- name строка(128) не пустое
-- quantity число с плав. точкой 2, 1

create table fruits(
id int primary key auto_increment,
name varchar(128) not null,
quantity numeric (2, 1)
);

-- Добавить поле price целое число по умолчанию 0, вставить после name

alter table fruits
add column price int default (0) after name;

select * from fruits;

-- Поменять тип у quantity на целое число
alter table fruits
modify column quantity int;

-- Переименовать поле name на fruit_name

alter table fruits
rename column name to fruit_name;

insert into fruits(fruit_name, price, quantity)
values ('Apple', 30, 20),
('Banana', 36, 50),
('Kiwi', 10, 2),
('Pineapple', 65, 60),
('Avocado', 60, 0),
('Grapes', 25, 2),
('Mango', 45, 0),
('Apricot', 40, 10),
('Orange', 35, 3),
('Lime', 20, 65);


select * from fruits
where quantity > 30;

-- Удалене данных
-- delete from table_name
-- where ...;

delete from fruits
where quantity = 0;

-- Чтобы удалить или обновить данные нужно отключить этот режим

set sql_safe_updates = 0;

-- Update - изменение/обновление данных
-- update table_name
-- set column1 = new_value, column2 = new_value
-- where ...;

update fruits
set quantity = quantity + 2
where fruit_name = 'Apple';

select * from fruits;

-- Изменить цену киви на 15
update fruits
set price = 15
where fruit_name = 'Kiwi';

update fruits
set quantity = quantity + 20, price = price * 2
where fruit_name = 'Banana';

-- После изменений включаем режим безопасных обновлений
set sql_safe_updates = 1;

-- 1. создать таблицу Employees с полями 

-- employee_id целое число,
--  , first_name текст
--  , last_name текст
--  , email текст
--  , phone текст
--  , job_id текст
--  , salary целое число
--  , commission_pct целое число
--  , manager_id целое число
--  , department_id целое число
 
 create table employees(
 employee_id int primary key auto_increment
, first_name varchar (128)
, last_name varchar (128)
, email varchar (128)
, phone varchar (128)
, job_id varchar (128)
, salary int
, commission_pct int
, manager_id int
, department_id int 
 );
 
 select * from employees;
 
 -- Найти всех ИТ(IT_PROG) работников с зарплатой выше 12000
 
 select *
 from employees
 where job_id = 'IT_PROG' and salary > 5000;
 
 -- Повысить зарплату работников отдела Human Resources в 5 раз
 
 update employees
 set salary = salary * 5
 where job_id = 'HR_REP';
 
 -- Найти работников отдела FI_ACCOUNT с зарплатой ниже 14250.
 
 select *
 from employees
 where job_id = 'FI_ACCOUNT' and salary < 14250;
 
 -- У руководителя родились близнецы Лаура и Давид, в честь праздника он решил повысить 
-- зарплату работников с именами Лаура и Давид в 10 раз.

update employees
 set salary = salary * 10
 where first_name  in ('Laura', 'David');
 
 select *
 from employees
 where first_name  in ('Laura', 'David');
 
 -- Julia Nayer вышла замуж и поменяла фамилию на King. Поменяйте у  Julia Nayer фамилию на King.
 
 update employees
 set last_name = 'King'
 where last_name  = 'Nayer';
 
-- Всех работников отдела ST_CLERK уволили. Удалите работников ST_CLERK из таблицы.
 
 delete from employees
 where job_id = 'ST_CLERK';
 
 -- Peter Hall перевели в отдел HR_REP и повысили зарплату на 5000. Измените данные для 
-- работника Peter Hall.

 update employees
 set salary = salary + 5000, job_id = 'HR_REP'
 where last_name  = 'Hall' and first_name = 'Peter';
 
 update employees
 set salary = salary / 10
 where first_name  in ('Laura', 'David');
 
 -- Shelley Higgins поменяла свой мейл на SHELLYHIG. Измените данные для работника Shelley Higgins.
 
 update employees
 set email = 'SHELLYHIG'
 where last_name  = 'Higgins' and first_name = 'Shelley';
 
 select *
 from employees
 where first_name  = 'Shelley';
 
 -- Julia King развелась и поменяла фамилию обратно на Nayer. И в честь развода руководитель 
-- повысил ее зарплату на 2000. Измените данные для работника Julia King.

 update employees
 set last_name = 'Nayer', salary = salary + 2000
 where last_name  = 'King';
 
 select *
 from employees
 where last_name  = 'Nayer';
 


 
 
 
 
 
 


