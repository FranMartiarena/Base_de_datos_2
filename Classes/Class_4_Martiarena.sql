use sakila

select title, special_features from film where rating = 'PG-13';

select length ,title from film group by length order by length;

select title, rental_rate, replacement_cost from film 
	where replacement_cost between 20.00 and 24.00 ;

select title, description, rating from film where special_features = 'Behind the Scenes';

select first_name, last_name from actor_info where film_info = 'ZOOLANDER FICTION';

select address, city, country  from address, city, country, store
	 where store.store_id = 1
	 and store.address_id = address.address_id
	and city.city_id = address.city_id
	and country.country_id = city.country_id;

select concat(title,' ', rating) as pair from film order by rating ;

select title, concat(first_name,' ', last_name) as manager
       from staff, store, film, inventory 
	where store.store_id = 2
	 and store.store_id = staff.store_id
	  and inventory.store_id = store.store_id 
	  and film.film_id = inventory.film_id;
