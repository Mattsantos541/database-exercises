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