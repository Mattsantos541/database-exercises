###More Exercises

-- What languages are spoken in Santa Monica?
select countrylanguage.Language as Language, countrylanguage.Percentage
from countrylanguage
join country
on countrylanguage.`CountryCode` = country.`Code`
where country.name = "Santa Monica";

-- How many different countries are in each region?
select country.region as Region, count(*) as num_countries
from country
group by  Region ORDER BY COUNT(*) asc;

-- What is the population for each region?
select country.region as Region, sum(population) as Population
from country
group by Region
order by Population desc;

-- What is the population for each continent?
select country.Continent as Region, sum(population) as Population
from country
group by Continent
order by Population desc;


-- What is the average life expectancy globally?
select avg(LifeExpectancy)
from country;


 /*What is the average life expectancy for each region, each continent? 
Sort the results from shortest to longest*/
select continent, avg(LifeExpectancy)
from country
group by continent
order by avg(LifeExpectancy);


select region, avg(LifeExpectancy)
from country
group by Region
order by avg(LifeExpectancy);



use sakila;
select lower(first_name), lower(last_name)
from actor;

/*You need to find the ID number, first name, and last name of an actor, of 
whom you know only the first name, "Joe." What is one query would you could 
use to obtain this information?*/

select actor_id as ID, first_name as "first name", last_name as "last name"
from actor
where first_name= "Joe";

-- Find all actors whose last name contain the letters "gen":
select actor_id as ID, first_name as "first name", last_name as "last name"
from actor
where last_name like "%gen%";

/*Find all actors whose last names contain the letters "li". 
This time, order the rows by last name and first name, in that order.*/
select actor_id as ID, first_name as "first name", last_name as "last name"
from actor
where last_name like "%li%"
order by last_name, first_name;


/*Using IN, display the country_id and country columns for the following 
countries: Afghanistan, Bangladesh, and China:*/

select country_id, country
from country
where country in ("Afghanistan", "Bangladesh", "China");

-- List the last names of all the actors, as well as how many 
actors have that last name.select last_name as "last name", count(*) as "same name"
from actor
group by  last_name  ORDER BY COUNT(*) asc;

/*List last names of actors and the number of actors who have that last name, 
but only for names that are shared by at least two actors*/
select last_name as "last name", count(last_name) as same_name
from actor
group by last_name
having count(last_name) >1;


/*You cannot locate the schema of the address table. Which query 
would you use to re-create it?*/
	create table address_new (
		address_id integer(11) NOT NULL,
    		address varchar(30) NOT NULL,
    		adress2 varchar(30) NOT NULL,
    		district varchar(30) NOT NULL,
    		city_id integer(11) NOT NULL,
    		postal_code integer(11) NOT NULL,
    		phone integer(10) NOT NULL,
    		location varchar(30) NOT NULL,
    		last_update datetime
	);

 -- Use JOIN to display the first and last names, as well as the address, of each staff member.
  select s.first_name as 'First Name', s.last_name as 'Last Name', a.address as 'Address'
	from staff as s
	join address as a 
	ON a.address_id = s.address_id;
-- Use JOIN to display the total amount rung up by each staff member in August of 2005.
select concat(staff.first_name,' ',staff.last_name) as "staff memeber", sum(payment.amount) as "Total Amount"
from payment
join staff
on payment.staff_id = staff.staff_id
where payment_date like '2005-08%'
group by payment.staff_id;



-- List each film and the number of actors who are listed for that film.
select film.title, count(*) as no_of_actors
from film
join film_actor
on film.film_id = film_actor.film_id
group by title;

-- How many copies of the film Hunchback Impossible exist in the inventory system?
select count(*)
from film
where title = "Hunchback Impossible";


/*The music of Queen and Kris Kristofferson have seen an unlikely resurgence. As an unintended consequence, films starting with the letters K and Q have also soared in popularity. Use subqueries to display the titles of movies starting with the letters K and Q whose language is English.*/
select title
from film
where title like "K%" or "Q%"
and language_id = "1";

-- Use subqueries to display all actors who appear in the film Alone Trip.
select CONCAT(first_name,' ',last_name) as 'Actors in Alone Trip'
	from actor
	where actor_id in 
	(select actor_id from film_actor where film_id = 
	(select film_id from film where title = 'Alone Trip'));

     /* You want to run an email marketing campaign in Canada, for which you will need 
the names and email addresses of all Canadian customers.*/


select concate(customer.first_name, " ", customer.last_name) as customer, customer.email as "Email"
from customer as customer
join address as address on customer.address_id = address.address_id
join city as country on a.city_id = country.city_id
join country as city on city.country_id = country.country_id
where city.country = 'Canada';

-- Sales have been lagging among young families, and you wish to target all family movies for a promotion. Identify all movies categorized as famiy films.

select title as "family titles"
from film
join film_category on film.film_id = film_category.film_id
join category on category.category_id = film_category.category_id
where category.name = "Family";

-- Write a query to display how much business, in dollars, each store brought in.
select store as 'Store', total_sales as 'Total Sales' from sales_by_store;

	select concat(c.city,', ',cy.country) as `Store`, s.store_id as 'Store ID', sum(p.amount) as `Total Sales` 
	from payment as p
	join rental as r on r.rental_id = p.rental_id
	join inventory as i on i.inventory_id = r.inventory_id
	join store as s on s.store_id = i.store_id
	join address as a on a.address_id = s.address_id
	join city as c on c.city_id = a.city_id
	join country as cy on cy.country_id = c.country_id
	group by s.store_id;

