-- функции для работ со сторками
-- условные операторы 
-- as псевдоним


-- Создать таблицу phones

use gt171023;

create table phones(
	id int primary key auto_increment,
	product_name varchar(128) not null, 
	product_count int,
	starting_price int
);

insert into Phones(Product_Name, Product_Count, Starting_Price) 
	values('iPhone X', 3, 680),
	 ('iPhone XR', 2, 700),
	 ('iPhone XS', 10, 720),
	 ('iPhone 11', 1, 790),
	 ('iPhone 11 Pro', 12, 850),
	 ('iPhone 11 Pro Max', 2, 890),
	 ('iPhone SE', 1, 850),
	 ('iPhone 12 Mini', 15, 890),
	 ('iPhone 12', 20, 910),
	 ('iPhone 12 Pro', 5, 950),
	 ('iPhone 12 Pro Max', 13, 1000);

select * from phones;

-- Оператор AS(alias)
-- С помощью оператора AS можно изменить название выходного столбца или определить его псевдоним:
select product_name as title
from phones;
-- Вывести поле product_name как title, посчитать и вывести общую сумму заказов (product_count * 
-- starting_price) как total_sum

select product_name as title, product_count*starting_price as total_sum
from phones;

-- Вывести поля product_name как name, product_count как count и starting_price как price.

select product_name as name, product_count as count, starting_price as price
from phones;

-- Созадть поле total_sum
alter table phones
add total_sum int default 0;

select * from phones;

set sql_safe_updates = 0;

-- Заполнить поле total_sum формулօй product_count*starting_price
UPDATE phones 
SET 
    total_sum = product_count * starting_price;

-- Оператор CASE (if - else if - else)

-- CASE
	-- When условие1 then результат1
    -- When условие2 then результат2
    -- When условие3 then результат3
    -- ...
    -- Else альтернативный результат
-- END

-- Use with SELECT, UPDATE

-- Вывести product_name, product_count, новое поле count_info, заполнить ее: 
-- Если Product_Count меньше/равно 2, count_info = 'Товар заканчивается',
-- Если Product_Count меньше/равно 5, count_info = 'Мало товара',
-- Если Product_Count меньше/равно 10, count_info = 'Есть в наличии',
-- В остальных случаях count_info ='Много товара';

select product_name, product_count, 
			case
				when product_count <= 2 then 'Товар заканчивается'
                when product_count <= 5 then 'Мало товара'
                when product_count <= 10 then 'Есть в наличии'
                else 'Много товара'
			end as count_info
from phones;

alter table phones
add count_info varchar(128);

select * from phones;

update phones
set count_info = 
				case
					 when product_count <= 2 then 'Товар заканчивается'
					 when product_count <= 5 then 'Мало товара'
					 when product_count <= 10 then 'Есть в наличии'
					 else 'Много товара'
                end;

-- Вывести product_name как name, starting_price как price и новое поле tax 
-- Заполнить поле tax
-- Если начальная цена меньше/равно 700, tax = null,
-- если больше 700 и меньше 850, tax = 15,
-- если больше или равно 850, tax = 25

select product_name as name,  starting_price as price,
case
				when starting_price <= 700 then null
                when starting_price > 700 and starting_price < 850 then '15'
                when starting_price >= 850 then '25'              
			end as tax
from phones;

-- Создать новое поле tax целое число
-- Заполнить поле tax
-- Если начальная цена меньше 700, tax = null,
-- если больше либо равно 700 и меньше 850, tax = 15,
-- если больше или равно 850, tax = 25
alter table phones
add column tax int;

update phones
set tax =
case
				when starting_price <= 700 then null
                when starting_price > 700 and starting_price < 850 then 15
                else 25              
			end;
            
select* from phones;

-- Посчитать конечную цену и представить его как Final price(starting price + starting price * tax / 100)

select product_name, starting_price, starting_price + starting_price * tax/100 as final_price
from phones;

select product_name, starting_price, tax, case
when tax is null then starting_price
else starting_price + starting_price * tax/100
end as final_price
from phones;

-- Создать новое поле для final_price numeric(6, 2)
-- Заполнить (starting_price + starting_price * tax / 100)

alter table phones
add column final_price numeric(6, 2);

update phones
set final_price =
case
				when tax is null then starting_price
				else starting_price + starting_price * tax/100            
			end;
            
create table users1 (
	id int primary key auto_increment,
    first_name varchar(128),
    last_name varchar(128),
    phone varchar(128),
    email varchar(128)
);

insert into users1 (first_name, last_name, phone, email)
values ('Tom', 'Smith', '+1809735873', null),
	('Bob', 'Smith', null, 'bob@gmail.com'),
    ('John', 'Simpson', '+72742398', 'john@gmail.com'),
    ('Ally', 'Brown', null, null);
select * from users1;
