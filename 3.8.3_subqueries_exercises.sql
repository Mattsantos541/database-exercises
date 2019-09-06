####Subqueries
-- #1 Find all the employees with the same hire date as employee 101010 using a sub-query.69 Rows
select * from employees
where hire_date = "1986-06-26" limit 69;

-- #2 Find all the titles held by all employees with the first name Aamod. 314 total titles, 6 unique titles
select distinct title from titles
where emp_no
in (
select emp_no from employees where first_name = "Aamod");

-- Find all the current department managers that are female.
select first_name, last_name
from employees
join dept_manager on employees.emp_no = dept_manager.emp_no
where employees.gender = "F";