use sakila;

/* -1. Create two or three queries using address table in sakila db:

include postal_code in where (try with in/not it operator)
eventually join the table with city/country tables.
measure execution time.
Then create an index for postal_code on address table.
measure execution time again and compare with the previous ones.
Explain the results
*/
SET profiling = 1;

SHOW PROFILES;

select postal_code, address, address_id from address where postal_code in(35200, 17886, 83579) ;-- 0.02919275  --> 0.00070925

select postal_code, address, address_id from address inner join city using(city_id) inner join country using(country_id) where postal_code in(35200, 17886, 83579);-- 0.05070150 --> 0.00274975

create index postal_code_index on address (postal_code);
-- drop index postal_code_index on address;

-- The results show that the amount of time when excecuting the query was minimized after creating an index for the column to search. 


-- -2. Run queries using actor table, searching for first and last name columns independently. Explain the differences and why is that happening?


select first_name from actor; -- '0.03108750'

select last_name from actor; -- 0.00073050

-- The last_name query's time was much faster than the first_name, so i decided to check for indexes on that table:
SHOW INDEXES FROM actor; -- When i excecuted this query i realized that it was a index on the column last name, thats why is faster than the first_name column

-- 3. Compare results finding text in the description on table film with LIKE and in the film_text using MATCH ... AGAINST. Explain the results.

select description from film where description like "%feminist%";

select description from film_text where match(description) against("%feminist%");

-- The film_text table doesnt have a full text index, thats why we cant use match against, but if it was a full text, the search for the word feminist would be much faster than using like.