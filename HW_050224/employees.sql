 -- 1 уровень сложности: 1. Создать таблицу employees;
-- employeeid целое число первичный ключ автоинкремент;
-- fname строка не null,
-- lastname строка не null,
-- email строка не null,
-- phone строка не null

use gt171023;

create table employees_hw(
id int primary key auto_increment,
fname varchar (128) not null,
lastname varchar (128) not null,
email varchar(128) not null,
phone varchar(128) not null
);


-- Ой, забыли про зарплату)) Добавить поле salary numeric(9, 2),

alter table employees_hw
add column salary numeric(9, 2);


-- Ойййй, нет, зарплата должна быть целым числом. Изменить тип salary на integer 
alter table employees_hw
modify column salary int;

-- Переименовать поле fname на first_name
alter table employees_hw
rename column fname to first_name;

-- Удалить поле phone
alter table employees_hw
drop column phone;

-- Добавить поле department строка не null 

alter table employees_hw
add column department varchar(128) not null;


-- Заполнить таблицу (7 строк)

insert into employees_hw(first_name, lastname, email, salary, department) 
				values ('Alex', 'Hunold', 'AHNOLD',  20500, 30),
                       ('John', 'Chen', 'JCHEN', 17890, 40),
                       ('Adam', 'Fripp', 'AFRIPP',  19876, 90),
                       ('Svetlana', 'Kim', 'SKIM',  17800, 30),
					   ('Julia', 'Male', 'JMALE',  15350, 30),
					   ('Max', 'Voronov', 'MVORONOV',  22890, 90),
					   ('Olena', 'Plaksina', 'OPLAKSINA', 20200, 40);
                       
select * from employees_hw;