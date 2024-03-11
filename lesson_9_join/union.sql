-- Вывести имя, фамилию, зарплату, должность(job_title) и минимальную зарплату(MIN_SALARY) для этой должности для всех сотрудников.

use hr;
select 
	emp.first_name, emp.last_name, emp.salary, jb.job_title, jb.min_salary
from employees emp
join jobs jb
on emp.job_id = jb.job_id;

-- Вывести имя, фамилию, зарплату, должность, минимальную и максимальную зарплату для
-- этой должности только тех сотрудников, у которых зарплата равняется либо минимальной
-- зарплате, либо максимальной.

select
t1.first_name,
t1.last_name,
t1.salary,
t2.job_title,
t2.min_salary,
t2.max_salary
from employees t1
inner join jobs t2
on t1.job_id = t2.job_id
where t1.salary = t2.min_salary or t1.salary = t2.max_salary;

-- Вывести имя(first_name), фамилию(last_name), должность(job_title), департамент(department_name) и название города(city), 
-- где находится департамент. 

select
t1.first_name,
t1.last_name,
t2.job_title,
t3.department_name,
t4.city
from employees t1
inner join jobs t2
on t1.job_id = t2.job_id
join departments t3
on t1.department_id = t3.department_id
join locations t4
on t3.location_id = t4.location_id;

-- Вывести имя, фамилию, должность и название департамента только тех работников, департамент которых находятся(country_id) 
-- в Великобритании(UK).

select
t1.first_name,
t1.last_name,
t2.job_title,
t3.department_name,
t4.country_id
from employees t1
inner join jobs t2
on t1.job_id = t2.job_id
join departments t3
on t1.department_id = t3.department_id
join locations t4
on t3.location_id = t4.location_id
where country_id in ("UK");

-- Вывести названия департаментов, улицу в которой он находится и название города, которые находятся в штатах/провинции.

select
t1.department_name,
t2.street_address,
t2.city
from departments t1
join locations t2
on t1.location_id = t2.location_id
where state_province is not null;


-- Вывести все департаменты, а также имена и фамилии их менеджеров. Только те департаменты, у которых есть назначенные менеджеры.

select
t1.department_name,
t2.first_name,
t2.last_name
from  departments t1
join employees t2
on t1.manager_id = t2.employee_id
;


-- LEFT JOIN - выборка будет содержать все строки из первой(левой) таблицы
select
t1.department_name,
t2.first_name,
t2.last_name
from  departments t1
left join employees t2
on t1.manager_id = t2.employee_id
;

-- Вывести всех менеджеров и название департаментов, которым они управляют. 
-- Выводим всех менеджеров, включая тех, у которых нет назначенного департамента.
select
t1.department_name,
t2.first_name,
t2.last_name
from  employees t2
left join departments t1
on t1.manager_id = t2.employee_id
;

-- RIGHT JOIN -   выборка будет содержать все строки из второй(правой) таблицы
-- Вывести всех сотрудников и название департаментов, которым они управляют. 
-- Выводим всех сотрудников, включая тех, у которых нет назначенного департамента.
-- Получить список всех городов и названий департаментов в компании.
-- Выводятся все города из таблицы локаций, включая те, у которых нет привязанных департаментов.

select
t1.city,
t2.department_name
from locations t1
left join departments t2
on t1.location_id = t2.location_id;

select
	t2.city, t1.department_name
from departments t1
right join locations t2
on t1.location_id = t2.location_id;

select
	t2.city, t1.department_name
from departments t1
right join locations t2
on t1.location_id = t2.location_id
where t2.department_name is null;


-- Вывести имя, фамилию, зарплату тех работников, которые зарабатывают больше, чем Den Raphaely.
select *
from employees
where first_name = "Den" and last_name = "Raphaely";

select 
t1.first_name,
t1.last_name,
t1.salary
from 
employees t1,
employees t2
where (t2.first_name = "Den" and t2.last_name = "Raphaely") 
and t2.salary < t1.salary;

-- Вывести имя, фамилию и department_id тех работников, которые работают в том же департаменте с Luis Popp. 

select 
	t1.first_name, t1.last_name, t1.department_id
from employees t1, employees t2
where (t2.first_name = 'Luis' and t2.last_name = 'Popp') and t2.department_id = t1.department_id;

-- ПОДЗАПРОСЫ

-- Получить список всех департаментов, в которых работают сотрудники.
select distinct department_id from employees;

-- Получить список всех департаментов, в которых работают сотрудники. Вывести имя департамента.
select department_name
from departments
where department_id IN (select distinct department_id from employees);


-- Получить список всех сотрудников, работающих в департаменте 'Sales'.

-- 1. Вывести department_id из таблицы departments где департапент Sales
select department_id from departments
where department_name = 'Sales';

-- 2. Вывести сотрудников из этого департамента
select first_name, last_name
from employees
where department_id = (select department_id from departments where department_name = 'Sales');



