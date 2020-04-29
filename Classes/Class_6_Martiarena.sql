use sakila;
/*Any of the 2 firsts exercices represent ex.1 of class 6*/

select first_name, last_name from actor a1 where
	 	 exists(select * from actor a2 where
		 a1.last_name = a2.last_name and a1.actor_id != a2.actor_id) order by last_name;

select first_name, last_name from actor a1 where last_name in (select last_name from actor a2
		where a2.actor_id != a1.actor_id) order by last_name;

select first_name, last_name, title  from film inner join film_actor on film.film_id = film_actor.film_id 
					       inner join actor on film_actor.actor_id = actor.actor_id
					       where film.title = 'BETRAYED REAR' or film.title = 'CATCH AMISTAD';

select first_name, last_name, title  from film inner join film_actor on film.film_id = film_actor.film_id 
					       inner join actor on film_actor.actor_id = actor.actor_id
					       where film.title = 'BETRAYED REAR' and actor.actor_id not in (
						select actor.actor_id from actor inner join film_actor on actor.actor_id = film_actor.actor_id 
					       inner join film on film_actor.film_id = film.film_id
					       where film.title = 'CATCH AMISTAD');
					     
select first_name, last_name, title  from film inner join film_actor on film.film_id = film_actor.film_id 
					       inner join actor on film_actor.actor_id = actor.actor_id
					       where film.title = 'BETRAYED REAR' and actor.actor_id  in (
						select actor.actor_id from actor inner join film_actor on actor.actor_id = film_actor.actor_id 
					       inner join film on film_actor.film_id = film.film_id
					       where film.title = 'CATCH AMISTAD');

/*Any of the 2 last exercices represent ex.8 of class 6*/

select distinct first_name, last_name  from film inner join film_actor on film.film_id = film_actor.film_id 
					       inner join actor on film_actor.actor_id = actor.actor_id
					       where actor.actor_id  in (
						select actor.actor_id from actor inner join film_actor on actor.actor_id = film_actor.actor_id 
					       inner join film on film_actor.film_id = film.film_id
					       where film.title != 'CATCH AMISTAD' or film.title != 'BETRAYED REAR' );

select distinct first_name, last_name  from film inner join film_actor on film.film_id = film_actor.film_id 
					       inner join actor on film_actor.actor_id = actor.actor_id
					       where film.title != 'CATCH AMISTAD' or film.title != 'BETRAYED REAR'



