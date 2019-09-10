### Temp Tables
-- Using the example from the lesson, re-create the employees_with_departments table.

Add a column named full_name to this table. It should be a VARCHAR whose length is the sum of the lengths of the first name and last name columns
Update the table so that full name column contains the correct data
Remove the first_name and last_name columns from the table.
What is another way you could have ended up with this same table?


CREATE TEMPORARY TABLE employees_with_departments 
SELECT emp_no, first_name, last_name, dept_no, dept_name
FROM employees
JOIN dept_emp USING(emp_no)
JOIN departments USING(dept_no)
LIMIT 100;

alter table full_name varchar(256)

alter table drop first_name, last_name;


-- Create a temporary table based on the payment table from the sakila database.
-- Write SQL to transform the amount column such that it is stored as an integer representing the number of cents of the payment. For example, 1.99 should become 199.

USE sakila;

CREATE TEMPORARY TABLE hundreds_of_pennies AS
	SELECT amount from payment;

ALTER TABLE hundreds_of_pennies ADD hundred_pennies INT;

UPDATE hundreds_of_pennies
SET hundred_pennies = amount * 100;

SELECT * from hundreds_of_pennies;
-- Find out how the average pay in each department compares to the overall average pay. In order to make the comparison easier, you should use the Z-score for salaries. In terms of salary, what is the best department to work for? The worst?
CREATE TEMPORARY TABLE dept_average_salaries AS 
	select departments.dept_name, avg(salaries.salary) as department_average
	from salaries
	join dept_emp using(emp_no)
	join departments using(dept_no)
	where salaries.to_date > now()
	and dept_emp.to_date > now()
	group by departments.dept_name;