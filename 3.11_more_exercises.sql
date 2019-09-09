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
