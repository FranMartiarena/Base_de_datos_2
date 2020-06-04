use sakila;

--Find all the film titles that are not in the inventory.

select title from film where title not in(
				select title from film 
				right join inventory on film.film_id = inventory.film_id);

/*Find all the films that are in the inventory but were never rented.
    Show title and inventory_id.
    This exercise is complicated.
    hint: use sub-queries in FROM and in WHERE or use left join and ask if one of the fields is null*/
select title, inventory.inventory_id, rental.last_update from film
			 inner join inventory on film.film_id = inventory.film_id
			 left join rental on inventory.inventory_id = rental.inventory_id
			 where rental.last_update is null;



/*Generate a report with:

    customer (first, last) name, store id, film title,
    when the film was rented and returned for each of these customers
    order by store_id, customer last_name*/
select first_name,last_name, customer.store_id, title, rental_date, return_date from customer 
					inner join store using(store_id)
					inner join rental using(customer_id)
					inner join inventory using(inventory_id)
					inner join film using(film_id) order by customer.store_id, last_name ;


/*Show sales per store (money of rented films)

    show store's city, country, manager info and total sales (money)
    (optional) Use concat to show city and country and manager first and last name*/
select store_id, concat(' Location ',city,' ',country,' Manager: ',first_name,' ', last_name) as info,
		sum(amount) as money_made from store 
		inner join address using(address_id)
		inner join city using(city_id)
		inner join country using(country_id)
		inner join staff using(store_id)
		inner join payment using(staff_id)
		group by store_id;

--Which actor has appeared in the most films?

select concat(first_name,' ',last_name) as name, count(title) as films from actor
				inner join film_actor using(actor_id)
				inner join film using(film_id)
				group by actor_id
				having films >= all(select count(title) as cant from actor a1
							inner join film_actor using(actor_id)
							inner join film using(film_id)
							group by actor_id);
				
	 	 
