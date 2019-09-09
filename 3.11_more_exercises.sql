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

