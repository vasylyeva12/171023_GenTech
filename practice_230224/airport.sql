use airport;
-- 1. Разделите самолеты на ближне-, средне- и дальнемагистральные. 
-- Ближнемагистральными будем считать самолеты, дальность полета которых > 1000 км и <= 2500 км. 
-- Среднемагистральными — с дальностью полета > 2500 км и <= 6000 км. 
-- Дальнемагистральными — с дальностью полета > 6000 км. 
-- В выборке должно быть два столбца, где в первом указана модель самолета. 
-- Во втором, category, — категория, со значениями short-haul, medium-haul, long-haul (ближне-, средне- и дальнемагистральные соответственно). 
-- Если максимальная дальность полета <= 1000 км или данных о дальности полета нет, в category выведите 'UNDEFINED'.
-- В выборке должны присутствовать два атрибута — model_name, category.

select
model_name,
case
	when _range > 6000 then 'long-haul'	
    when _range > 2500 then 'medium-haul'
    when _range > 1000 then 'short-haul'
    else 'UNDEFINED'
end as category
from airliners;

-- 2. Разделите самолеты на три класса по возрасту. 
-- Если самолет произведен раньше 2000 года, то отнесите его к классу 'Old'. 
-- Если самолет произведен между 2000 и 2010 годами включительно, то отнесите его к классу 'Mid'. 
-- Более новые самолеты отнесите к классу 'New'. 
-- Исключите из выборки дальнемагистральные самолеты с максимальной дальностью полета больше 10000 км. 
-- В выборке должны присутствовать два атрибута — side_number, age.

select
side_number,

case
	when production_year < 2000 then 'Old'	
    when production_year between 2000 and 2010 then 'Mid'    
    else 'New'
end as age
from airliners
where _range <= 10000;

-- extra tasks

-- 3. Руководство авиакомпании снизило цены на билеты рейсов LL4S1G8PQW, 0SE4S0HRRU и JQF04Q8I9G. 
-- Скидка на билет экономкласса (Economy) составила 15%, на билет бизнес-класса (Business) — 10%, а на билет комфорт-класса 
-- (PremiumEconomy) — 20%. 
-- Определите цену билета в каждом сегменте с учетом скидки.
-- В выборке должны присутствовать три атрибута — id, trip_id, new_price.

select
id,
trip_id,
round  (case when service_class = "Economy" then price * 0.90	
    when service_class = "Business" then price * 0.85 
    when service_class = "PremiumEconomy" then price * 0.80
    
end) as new_price
from tickets
where trip_id in ('LL4S1G8PQW', '0SE4S0HRRU','JQF04Q8I9G');


-- 4. Некоторые самолеты авиакомпании требуют проверки бортовых документов. 
-- Выведите бортовые номера и статус проверки для всех самолетов. Если самолет выпущен ранее 2000 года, то выведите статус 'review_old'. 
-- Если самолет выпущен позже 2010 года, то выведите статус 'no_review'. 
-- Для самолетов, которые выпущены в промежутке с 2000 до 2010 года включительно статус завист от максимальной дальности полета. 
-- Если дальность полета более 6000 км, то выведите статус 'review_mid_long_haul'. 
-- Если дальность полета более 2500 км, но не более 6000 км, то выведите статус 'review_mid_medium_haul'. 
-- Иначе выведите статус 'review_mid_short_haul'.
-- В выборке должны присутствовать два атрибута — side_number, review_status.
use airport;

select
side_number,
case when production_year < 2000 then 'review_old'   
    when production_year > 2010  then 'no_review'
	when production_year between 2000 and 2010 then 
    
		case
			 when _range > 6000 then  'review_mid_long_haul'
			 when _range > 6000 then  'review_mid_medium_haul'    
			ELSE 'review_mid_short_haul'
		end
end as review_status
from airliners;


-- 5. Выведите возрастную категорию пассажиров, купивших билет в бизнес- или первый класс. 
-- Возрастные категории следующие : < 18 - Ребенок; 18-50 - Взрослый; > 50 Пожилой.
-- В выборке должны присутствовать два атрибута: id, age_category

select
	id,
    case
		when age < 18 then 'Ребенок'
        when age between 18 and 50 then 'Взрослый'
        else 'Пожилой'
    end as age_category
from clients
where id in (
			select
				client_id
			from tickets
			where service_class in ('Business', 'FirstClass')
);

