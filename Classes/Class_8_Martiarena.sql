use sakila

--Get the amount of cities per country in the database. Sort them by country, country_id.

select country, count(4) from country, city
	 where country.country_id = city.country_id
	 group by country order by country.country_id, country;

--Get the amount of cities per country in the database.
--Show only the countries with more than 10 cities, order from the highest amount of cities to the lowest

select country, count(*) as ciudades from country, city
	 where country.country_id = city.country_id
	 group by country having count(*) > 10 order by ciudades desc;

--Generate a report with customer (first, last) name, address, total films rented and the total money spent renting films.
--Show the ones who spent more money first .

select first_name, last_name, address, count(*) as rented, (select sum(amount) from payment p1 where c1.customer_id = p1.customer_id) as payed
	 from customer c1, rental r1, address a1
	where c1.customer_id = r1.customer_id and c1.address_id = a1.address_id 
	group by c1.customer_id;

--select first_name, last_name, amount from payment p1, customer c1 where c1.customer_id = p1.customer_id; --debugging purposes

--Which film categories have the larger film duration (comparing average)?
--Order by average in descending order

select name, avg(length) as avg_duration from film f1, category c1, film_category fc1
	 where f1.film_id = fc1.film_id and c1.category_id = fc1.category_id
	 group by c1.name order by avg_duration desc;

--Show sales per film rating

select rating, count(*) as sales from film f1, inventory i1, rental r1 
	where f1.film_id = i1.film_id and i1.inventory_id = r1.inventory_id  
	group by rating;



