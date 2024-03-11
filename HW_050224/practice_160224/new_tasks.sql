set sql_safe_updates = 0;
-- Обновить зарплату сотрудника с именем "Steven" на 25000.

set sql_safe_updates = 0;

update employees
set salary = 25000
where first_name = 'Steven';

-- Удалить всех сотрудников из департамента "Marketing".
delete from employees
where department = 'Marketing';

--Изменить тип столбца salary на DECIMAL(10,2).
-- alter table
-- add
-- drop
-- modify
-- change
-- rename

-- Удалить столбец email.

-- Добавить столбец manager_id для хранения идентификатора менеджера с типом integer и со значением по умолчанию 1

-- Добавить столбец manager_id для хранения идентификатора менеджера с типом integer и со значением по умолчанию 1
-- default ..
alter table employees
add manager_id int default 1;


-- Обновить департамент сотрудника с именем "Adam" на "Human Resources".

-- Обновить департамент сотрудника с именем "Adam" на "IT".

-- Обновить департамент сотрудника с именем "Adam" на "IT".
update employees
set department = 'IT'
where first_name = 'Adam';

-- Изменить имя столбца department на dept_name.

-- Удалить всех сотрудников с зарплатой менее 7000.

-- Удалить все строки из таблицы employees.
delete from employees;
truncate table employees;