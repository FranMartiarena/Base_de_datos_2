use sakila;

-- 1
create or replace view list_of_customers as 
select customer_id, concat(first_name," ",last_name) as "full name",
address, postal_code, phone, city, country, case active 
when 1 then "Active"
else "Inactive"
end as status,store_id
from customer inner join address using(address_id)
inner join city using(city_id)
inner join country using(country_id)
inner join store using(store_id);

select * from list_of_customers limit 5;

-- 2
create or replace view film_details as 
select film_id, title, description, category.name as category, replacement_cost as price , length, rating,
GROUP_CONCAT(distinct concat(a1.first_name," ", a1.last_name)) as actors
from film f1
 join film_category using(film_id)
 join category using(category_id)
 join film_actor using(film_id)
 join actor a1 using(actor_id) group by film_id;

select * from film_details limit 5;

-- 3
create or replace view sales_by_film_category as 
select category.name, count(rental_id) as total_rental from category
inner join film_category using(category_id)
inner join film using(film_id)
inner join inventory using(film_id)
inner join rental using(inventory_id) group by category.category_id;

select * from sales_by_film_category limit 5;

-- 4
create or replace view actor_information as -- creates or updates a view called actor_information 
select actor_id, first_name, last_name, count(film_id) as films-- which is going to have actor _id, name of the actor and it will tell the amount of film this person was in by doing a count on the films id joined to the actor 
from actor -- we get the data from the table actor
inner join film_actor using(actor_id) -- which will need to be joined with film actor and film to determine in which film the actor took part in
inner join film using(film_id) group by actor_id; -- finally we group by actor_id so as to return every actor

select * from actor_information limit 5;

/* Views are used for sharing some specific data from various tables
 in only one and mantaine other data as private. */
