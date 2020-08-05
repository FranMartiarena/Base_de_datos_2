use sakila;
/*Write a query that gets all the customers that live in Argentina.
 Show the first and last name in one column, the address and the city.*/
select concat(first_name, ' ', last_name) as 'Name & Last Name', address, city from customer 
			inner join address using(address_id)
			inner join city using(city_id) 
			inner join country using(country_id)
			where country = 'Argentina';

/*Write a query that shows the film title, language and rating. 
Rating shall be shown as the full text described here:
    G (General Audiences) – All ages admitted.
    PG (Parental Guidance Suggested) – Some material may not be suitable for children.
    PG-13 (Parents Strongly Cautioned) – Some material may be inappropriate for children under 13.
    R (Restricted) – Under 17 requires accompanying parent or adult guardian.
    NC-17 (Adults Only) – No one 17 and under admitted.
 Hint: use case.*/

select title, name, 
	case rating
			when  'G' then 'G (General Audiences) – All ages admitted.'
			when 'PG' then 'PG (Parental Guidance Suggested) – Some material may not be suitable for children'
			when 'PG-13' then 'PG-13 (Parents Strongly Cautioned) – Some material may be inappropriate for children under 13'
			when 'R' then 'R (Restricted) – Under 17 requires accompanying parent or adult guardian.'
			when 'NC-17' then 'NC-17 (Adults Only) – No one 17 and under admitted.'
	end  as rating
	from film inner join language using(language_id);

/*Write a search query that shows all the films (title and release year) an actor was part of. 
Assume the actor comes from a text box introduced by hand from a web page. 
Make sure to "adjust" the input text to try to find the films as effectively as you think is possible.*/

set @fname = 'peNelope';
set @lname = 'Guiness' ;
select title, first_name, last_name from film inner join film_actor using(film_id)
				inner join actor using(actor_id)
				where actor.first_name = upper(@fname) and actor.last_name = upper(@lname);

/*Find all the rentals done in the months of May and June. 
Show the film title, customer name and if it was returned or not. 
There should be returned column with two possible values 'Yes' and 'No'.*/

select title, first_name,
	 if(return_date is NULL, 'No', 'Yes') as 'Returned'
	from rental inner join customer using(customer_id)
						inner join inventory using(inventory_id)
						inner join film using(film_id)
	where month(rental_date) = 5 or month(rental_date) = 6;


/*Investigate CAST and CONVERT functions.
 Explain the differences if any, write examples based on sakila DB.*/

/*CAST and CONVERT do the same thing, except that CONVERT allows more options, 
such as changing character set with USING. examples:*/
SELECT CONCAT('MySQL CAST example #',CAST(2 AS CHAR)); 
insert into language (language_id, name, last_update) values (7, 'Marciano', cast('2003-01-01' as DATETIME));
SELECT CONVERT('mysql.com' USING utf8);

/*Investigate NVL, ISNULL, IFNULL, COALESCE, etc type of function.
Explain what they do. Which ones are not in MySql and write usage examples.*/

/*
IFNULL() function lets you return an alternative value if an expression is NULL: IFNULL(return_date, 0))
or we can use the COALESCE() function, like this: COALESCE(return_date, 0)
The SQL Server ISNULL() function lets you return an alternative value when an expression is NULL: ISNULL(return_date, 0)
The Oracle NVL() function achieves the same result: NVL(return_date, 0))





