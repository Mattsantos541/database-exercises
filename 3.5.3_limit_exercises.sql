-- Update your queries for employees whose names start and end with 'E'. Use concat() to combine their first and last name together as a single column named full_name.
select * from employees where last_name like "E%E" order by emp_no asc;
select CONCAT(first_name," ", last_name) from employees where last_name like "E%E";

-- Convert the names produced in your last query to all uppercase;
select upper(CONCAT(first_name," ", last_name)) from employees where last_name like "E%E";

-- For your query of employees born on Christmas and hired in the 90s, use datediff() to find how many days they have been working at the company (Hint: You will also need to use NOW() or CURDATE())
select datediff(curdate(), hire_date) from employees where birth_date like "%12-25" and hire_date > "1990"and hire_date < "1999";


-- Find the smallest and largest salary from the salaries table.
select * from salaries;
select min(salary) from salaries;
select max(salary) from salaries;

-- Use your knowledge of built in SQL functions to generate a username for all of the employees. A username should be all lowercase, and consist of the first character of the employees first name, the first 4 characters of the employees last name, an underscore, the month the employee was born, and the last two digits of the year that they were born. Below is an example of what the first 10 rows will look like:
select 
CONCAT(
Lower(substr(first_name, 1, 1))
, lower(substr(last_name, 1, 4)),
"_",
substr(birth_date, 6, 2),
substr(birth_date, 3, 2)), 
first_name,
last_name,
birth_date
from employees;