### Group by 
-- In your script, use DISTINCT to find the unique titles in the titles table. Your results should look like:

use employees;
select distinct title from titles;

-- Find your query for employees whose last names start and end with 'E'. Update the query find just the unique last names that start and end with 'E' using GROUP BY. The results should be:
select last_name from employees where last_name like "E%E" group by last_name;