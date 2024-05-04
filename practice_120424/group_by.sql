use hr;
-- 1. Вывести самую высокую зарплату в компании

select
	department_id,
	max(salary) as max_salary
from employees
group by department_id;

-- 3. Вывести самую высокую зарплату в каждом департаменте. Вывести информацию только о тех департаментах, где макс зарплата больше 10000
select
	department_id,
	max(salary) as max_salary
from employees
where salary > 10000
group by department_id
;

-- 3. Вывести самую высокую зарплату в каждом департаменте. Вывести информацию только о тех департаментах, где макс зарплата больше 10000

select
	department_id,
	avg(salary) as avg_salary
from employees
group by department_id
having avg_salary > 10000
;

-- 4. Вывести максимальную зарплату в каждом департаменте. Вывести информацию только о тех департаментах, где макс зарплата больше 10000

select
	department_id,
	max(salary) as max_salary
from employees
where salary > 10000
group by department_id;


select
	department_id,
	max(salary) as max_salary
from employees
group by department_id
having max_salary > 10000;

-- 5. Вывести среднюю зарплату в каждом департаменте. 
-- Вывести department_name и avg_salary

select
	t2.department_name,
    avg(t1.salary) as avg_salary 	
from employees t1
inner join departments t2 
on t1.department_id = t2.department_id
group by t2.department_name; 

-- 6. Вывести среднюю зарплату по каждой должности 
-- Вывести job_title и avg_salary
