use sakila 


/*    Add a new customer
        To store 1
        For address use an existing address. The one that has the biggest address_id in 'United States'*/

insert into customer (store_id, first_name, last_name, email, address_id, active, create_date, last_update) 
			select 1, 'Pepe', 'Gonzales','pepito@protonmail.com',address_id, 1, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP from address
			inner join city using(city_id)
			inner join country using(country_id)
			where country.country = 'United States' 
			and address_id >= all(select address_id from address 
						inner join city using(city_id)
						inner join country using(country_id)
						where country.country = 'United States') limit 1;


/*    Add a rental
        Make easy to select any film title. I.e. I should be able to put 'film tile' in the where, and not the id.
        Do not check if the film is already rented, just use any from the inventory, e.g. the one with highest id.
        Select any staff_id from Store 2.*/

insert into rental (rental_date, inventory_id, customer_id, return_date, staff_id, last_update)
		select CURRENT_TIMESTAMP, inventory_id, 500, NULL, max(staff_id), CURRENT_TIMESTAMP
		from film
		inner join inventory using(film_id)
		inner join store using(store_id)
		inner join customer using(store_id)
		inner join staff using(store_id)
		where store.store_id = 2 and film.title = 'ACADEMY DINOSAUR';
 
/*

    Update film year based on the rating
        For example if rating is 'G' release date will be '2001'
        You can choose the mapping between rating and year.
        Write as many statements as needed.*/

UPDATE film
SET release_year = '2001'
WHERE rating = 'G';

UPDATE film
SET release_year = '2002'
WHERE rating = 'PG';

UPDATE film
SET release_year = '2003'
WHERE rating = 'PG-13';

UPDATE film
SET release_year = '2004'
WHERE rating = 'R';

UPDATE film
SET release_year = '2005'
WHERE rating = 'NC-17';

/*    Return a film
        Write the necessary statements and queries for the following steps.
        Find a film that was not yet returned. And use that rental id. Pick the latest that was rented for example.
        Use the id to return the film.*/

select title, film_id, return_date from film inner join inventory using(film_id)
			inner join rental using(inventory_id)
			where return_date is NULL order by rental_date desc;

/*
    Try to delete a film
        Check what happens, describe what to do.
        Write all the necessary delete statements to entirely remove the film from the DB.
*/

--Every film is related to other tables through its id, thats why we cant delete them with this query.
--Im sure there is a way, but i couldnt find it :)
delete from film_category where film_id = 5;
delete from film_actor where film_id = 5;
delete from inventory where film_id = 5;
DELETE FROM film WHERE film_id = 5; 

/*
    Rent a film
        Find an inventory id that is available for rent (available in store) pick any movie. Save this id somewhere.
        Add a rental entry
        Add a payment entry
        Use sub-queries for everything, except for the inventory id that can be used directly in the queries.*/
 
inser 

