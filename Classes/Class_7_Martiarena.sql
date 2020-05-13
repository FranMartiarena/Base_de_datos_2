use sakila;

/*film with less duration showing title and rating*/

select title, length, rating from film  where length <= all(select  length from film f2) limit 1;

/*Write a query that returns the tiltle of the film which duration is the lowest.
 If there are more than one film with the lowest durtation, the query returns an empty resultset.*/

select title, length, rating from film f1 where length <= all(select  length from film f2) having count(length) = 1;
		
/*Generate a report with list of customers showing the lowest payments done by each of them.
 Show customer information, the address and the lowest amount, provide both solution using ALL
 and/or ANY and MIN.*/

select first_name, address, (select amount from payment where payment.customer_id = customer.customer_id 
			and amount <= all(select amount from payment where customer.customer_id = payment.customer_id)limit 1) as amount
			from customer, address where address.address_id = customer.address_id order by first_name;

/*Generate a report that shows the customer's information with the highest payment and the lowest payment in the same row.*/

select first_name, address, (select amount from payment where payment.customer_id = customer.customer_id 
			and amount <= all(select amount from payment where customer.customer_id = payment.customer_id)limit 1) as lowest,
                        (select amount from payment where payment.customer_id = customer.customer_id 
			and amount >= all(select amount from payment where customer.customer_id = payment.customer_id)limit 1) as highest 
			from customer, address where address.address_id = customer.address_id order by first_name;


