###More Exercises

-- What languages are spoken in Santa Monica?
select countrylanguage.Language as Language, countrylanguage.Percentage
from countrylanguage
join country
on countrylanguage.`CountryCode` = country.`Code`
where country.name = "Santa Monica";