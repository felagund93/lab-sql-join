# Lab | SQL Join
# In this lab, you will be using the Sakila database of movie rentals.
USE sakila;
# Instructions
## List number of films per category.
SELECT a.name, COUNT(c.film_id) AS num_film FROM sakila.category a
JOIN sakila.film_category b ON a.category_id = b.category_id
JOIN sakila.film c ON b.film_id = c.film_id
GROUP BY a.name;

## Display the first and last names, as well as the address, of each staff member.
SELECT a.first_name, a.last_name, b.address FROM sakila.staff a
JOIN sakila.address b ON a.address_id = b.address_id;

## Display the total amount rung up by each staff member in August of 2005.
SELECT * FROM sakila.payment;

SELECT a.first_name, a.last_name, SUM(b.amount) AS ring_up FROM sakila.staff a
JOIN sakila.payment b ON a.staff_id = b.staff_id
WHERE MONTH(b.payment_date) = 8
GROUP BY a.first_name, a.last_name;

## List each film and the number of actors who are listed for that film.
SELECT a.title, COUNT(b.actor_id) AS num_actors FROM sakila.film a
JOIN sakila.film_actor b ON a.film_id = b.film_id
GROUP BY a.title;

## Using the tables payment and customer and the JOIN command, list the total paid by each customer.
SELECT a.first_name, a.last_name, SUM(b.amount) AS total_paid FROM sakila.customer a
JOIN sakila.payment b ON a.customer_id = b.customer_id
GROUP BY a.first_name, a.last_name;

# List the customers alphabetically by last name.
SELECT a.last_name, a.first_name, SUM(b.amount) AS total_paid FROM sakila.customer a
JOIN sakila.payment b ON a.customer_id = b.customer_id
GROUP BY a.last_name, a.first_name
ORDER BY a.last_name;