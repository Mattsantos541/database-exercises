## Day 2 SQL
-- Create a file named 3.5.1_where_exercises.sql. Make sure to use the employees database
-- Find all employees with first names 'Irena', 'Vidya', or 'Maya' — 709 rows (Hint: Use IN).
use employees;
select * from employees where first_name in ('Irena', 'Vidya', 'Maya');

-- Find all employees whose last name starts with 'E' — 7,330 rows.
select * from employees where last_name = "E%";

-- Find all employees hired in the 90s — 135,214 rows.
select * from employees where char(hire_date, "yy") between 90 and 99;
-- Find all employees born on Christmas — 842 rows.
select * from employees where char(birth_date, "mmdd") = 12
-- Find all employees with a 'q' in their last name — 1,873 rows.