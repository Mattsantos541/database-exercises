##join exercises
-- Using the example in the Associative Table Joins section as a guide, write a query that shows each department along with the name of the current manager for that department.
select departments.dept_name,
CONCAT(employees.first_name, " ", employees.last_name) as department_manager
from departments 
join dept_manager
on departments.dept_no = dept_manager.dept_no
join employees 
on employees.emp_no = dept_manager.emp_no;

-- Find the name of all departments currently managed by women.
select departments.dept_name,
CONCAT(employees.first_name, " ", employees.last_name) as department_manager
from departments 
join dept_manager
on departments.dept_no = dept_manager.dept_no
join employees 
on employees.emp_no = dept_manager.emp_no
where employees.gender = "F";