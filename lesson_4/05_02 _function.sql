use gt171023

-- 1. Создать таблицу products
-- id первичный ключ автоинкремент
-- title строка 128
-- quantity integer от 0 до 10
    
    create table products (
id int primary key auto_increment,
title varchar (128) not null,
quantity integer check (quantity between 0 and 10)
);

insert into products(title, quantity)
values('Orange', '9')
;

insert into products(title, quantity)
values('Kiwi', '5'),
      ('Anannas', '3'),
      ('Bananna', '8')
;

-- CRUD

-- Create
-- create database database_name;
-- create table table_name(...);
 
-- Read
-- select * from table_name;

-- Update
-- alter table - таблица, столбец
-- update - значение, строки

 -- Delete
-- drop database database_name;
-- drop table table_name;
-- drop column column_name - столбец
-- delete - значение, строки


-- alter table table_name
-- add название столбца тип_данных огрю - добавление нового столбца
-- drop column название столбца - удаление столбца
-- modify column - название столбца, меняем тип данных
-- change название_столбца новое_название_столбца тип_данных - изменение название столбца
-- add constraint (ограничение) добавление ограничения
-- drop constraint - удаление ограничения

use gt171023;
alter table products
add price int default 0;

select*from products;

-- Изменить тип price на decimal(8, 2)
alter table products
modify column price decimal(8, 2);

-- Изменить тип price обратно на integer

alter table products
modify column price int default 0;

alter table products
change price item_price int;

-- 1. Добавить поле quality типа decimal(4, 2) со значение по умолчанию 0
alter table products
modify column quantity decimal(4, 2);
-- 2. Изменить тип quality на integer

alter table products
modify column quantity int default 0;

select*from products;

alter table products
drop column item_price;

-- Создать таблицу students с полями
-- name строка (не null)
-- lastname строка (не null)
-- avg_mark целое число (от 0 до 5)
-- gender строка(128) (или “M” или “F”)

create table student (
name varchar (50) not null,
lastname varchar (50) not null,
avg_mark integer check (avg_mark between  0 and 5),
gender varchar(128) check(gender in ('M', 'F'))
);

-- Добавить поле id integer primary key auto_increment

alter table student
add id int primary key auto_increment;

select*from student;

alter table student
drop column id;

alter table student
add id int primary key auto_increment first;

-- Добавить поле age (тип целое число) после lastname

alter table student
add age int after lastname;

-- Поменять тип у gender на char(1)
alter table student
modify column gender char(1);  


 alter table student
 modify column avg_mark decimal(2, 1);
 
 -- Переименовать поле name на firstname
 
 alter table student
change name firstname varchar(60);

insert into student (firstname, lastname, age, avg_mark, gender)
values('Alona', 'Vasylieva', 35, '4.6', 'F'),
('Sasha', 'Melnik', 60, '3.5', 'M'),
('Igor', 'Melnikov', 40, '3.7', 'M'),
('Sveta', 'Kim', 20, '3.4', 'F'),
('Ivan', '', 28, '4.3', 'M')
;
 
 -- Функции для работы с числами
 
 select 5 as number;
 
 select 
 firstname as name
 from student;
 
 -- ABS: возвращает абсолютное значение числа.
select abs(-23) as abs;

-- POW(m, n): возвращает m, возведенную в степень n.
select pow(4, 2) as pow;

select age, pow(age, 2) as pow
from students;

-- SQRT: получает квадратный корень числа.
select sqrt(225) as sqrt;

-- CEILING: возвращает наименьшее целое число, которое больше или равно текущему значению.
select ceiling(123.45) as ceiling_1;
select ceiling(-123.45) as ceiling_2;

-- FLOOR: возвращает наибольшее целое число, которое меньше или равно текущему значению.
select floor(123.45) as floor_1;
select floor(-123.45) as floor_2;

-- ROUND: округляет число. В качестве первого параметра передается число. Второй параметр указывает на длину. 
-- Если длина представляет положительное число, то оно указывает, до какой цифры после запятой идет округление. 
-- Если длина представляет отрицательное число, то оно указывает, до какой цифры с конца числа до запятой идет округление

select round(1234.567, 2) as round_1;
select round(1234.567, -2) as round_2;
select round(1258.567, -2) as round_3;
 
 
 





