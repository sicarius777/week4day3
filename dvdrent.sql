SELECT * FROM customer;

SELECT * FROM rental;

SELECT first_name, last_name, rental_id
FROM customer
INNER JOIN rental
ON customer.customer_id = rental.customer_id;

SELECT CONCAT(first_name,' ', last_name) AS NAME, COUNT(rental_id) AS RentalsMade
FROM customer
INNER JOIN rental
ON customer.customer_id = rental.customer_id
GROUP BY Name; 

SELECT title, rating, CONCAT(first_name,' ', last_name) AS NAME
FROM film
JOIN film_actor
ON film_actor.film_id = film.film_id
JOIN actor
ON actor.actor_id = film_actor.actor_id

SELECT * FROM film;

SELECT * FROM category;

SELECT title, name 
FROM film
JOIN film_category
ON film_category.film_id = film.film_id
JOIN category
ON category.category_id = film_category.category_id
WHERE name = 'Animation'

SELECT CONCAT(first_name,' ', last_name) AS NAME, city, country, phone
FROM STAFF 
JOIN address ON staff.address_id = address.address_id
JOIN city ON address.city_id = city.city_id
JOIN country ON city.country_id = country.country_id
WHERE country = 'Canada'

SELECT * FROM staff

SELECT count(customer) FROM customer

SELECT count(customer_id), customer_id
FROM rental
GROUP BY customer_id

-- get count of rentals with nick wahlberg --

SELECT COUNT(rental_id)
FROM rental
JOIN inventory ON rental.inventory_id = inventory.inventory_id
JOIN film ON film.film_id = inventory.film_id
JOIN film_actor ON film_actor.film_id = film.film_id
JOIN actor ON actor.actor_id = film_actor.actor_id
WHERE last_name = 'wahlberg' AND first_name = 'nick'

SELECT COUNT(film_id)
 FROM film
JOIN language on film.language_id = language_id.language
WHERE language_id = 'Japanese'

--subqueries--

SELECT customer_id, SUM(amount)
FROM payment
GROUP BY customer_id
HAVING SUM(amount) >=175
ORDER BY SUM(amount) DESC


SELECT first_name, last_name, address_id
FROM customer
WHERE customer_id IN(
    SELECT customer_id
    FROM payment
    GROUP BY customer_id
    HAVING SUM(amount) >=175
    ORDER BY SUM(amount) DESC
)

SELECT amount
FROM payment
GROUP BY amount
HAVING amount >= AVG(amount)

SELECT payment_id, amount
FROM payment
WHERE amount >(
SELECT AVG(amount)
FROM payment)

SELECT title
FROM film
WHERE film_id IN(
SELECT film_id FROM film_actor
WHERE actor_id IN(
SELECT actor_id
FROM actor
WHERE last_name = 'Allen'
))