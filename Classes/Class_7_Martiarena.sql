use sakila;

/*film with less duration showing title and rating*/

select title, length, rating from film  where length <= all(select  length from film f2) limit 1;

/*Write a query that returns the tiltle of the film which duration is the lowest.
 If there are more than one film with the lowest durtation, the query returns an empty resultset.*/

select title, length, rating from film f1 where length <= all(select  length from film f2) having count(length) = 1;
		
/*Generate a report with list of customers showing the lowest payments done by each of them.
 Show customer information, the address and the lowest amount, provide both solution using ALL
 and/or ANY and MIN.*/

select first_name, address, amount from customer c1, address a1, payment p1 where 
				c1.customer_id = p1.customer_id
				and c1.address_id = a1.address_id 
				and p1.amount <= all(select amount
				 from customer c2, address a2, payment p2 where 
					c2.customer_id = p2.customer_id
					and c2.address_id = a2.address_id );
