use gt171023;

create table goods(
id int primary key auto_increment,
title varchar(128) not null,
descr varchar(129) not null,
price numeric (5, 2) check(price between 0 and 100),
in_stock varchar(128) check (in_stock in ('Y', 'N'))
);

drop table goods;

insert into goods (title, descr, price, in_stock)
value ('Lime', 'good lime', 36.57, 'Y'),
('Ananas', 'Good ananas', 46.89, 'N');

insert into goods (title, descr, price, in_stock)
value ('Kiwi', 'good kiwi', 13.09, 'Y'),
('Orange', 'Good orange', 47.09, 'N'),
('Lemone', 'Good lemone', 17.09, 'N');

-- 2. Сбросить таблицу до первоначального состояния
truncate goods;

-- 3. Удалить позицию из таблицу по id
delete from goods
where id =5;

-- 4. Удалить все строки из таблицы
delete from goods;

--  5. Отключить safe update mode
set sql_safe_updates = 0; -- отключаем безопасный режим

-- 6. Включить safe update mode
set sql_safe_updates = 1;

-- 8. У поля in_stock поменять тип данных на char(1)

alter table goods
modify column in_stock char(1);

-- 9. Добавить новое поле country со значением по умолчанию Germany
alter table goods
add column country varchar (128) default 'Germany'

-- 10. Переименовать поле descr в info (без изменения типа данных)

alter table goods
change descr info varchar(129) not null;

alter table goods
rename  column descr to info;

-- 11. Удалить поле country

alter table goods
drop column country;

-- 12. Переименовать таблицу goods в products

rename table goods to product;


