####Subqueries
-- #1 Find all the employees with the same hire date as employee 101010 using a sub-query.69 Rows
select * from employees
where hire_date = "1986-06-26" limit 69;

-- #2 Find all the titles held by all employees with the first name Aamod. 314 total titles, 6 unique titles
select distinct title from titles
where emp_no
in (
select emp_no from employees where first_name = "Aamod");

-- #3 How many people in the employees table are no longer working for the company?
select count(*)
from employees
where emp_no in (select emp_no from dept_emp where to_date > "9999-01-01");

-- #4 Find all the current department managers that are female.
select first_name, last_name
from employees
join dept_manager on employees.emp_no = dept_manager.emp_no
where employees.gender = "F";

/* #5 Find all the employees that currently have a higher than average salary.
154543 rows in total. Here is what the first 5 rows will look like: */

select first_name, last_name
from employees 
where emp_no in (salaries where salary > (select avg(salary) from salaries);
