SELECT *
FROM customer c
JOIN address a ON c.address_id = a.address_id
WHERE a.district = 'Texas';

-- Question 1 for day 3 well that was kewl,
-- so there are 5 of them Jennifer, Kim, Richard, Bryan, & Ian

SELECT CONCAT(c.first_name, ' ', c.last_name) AS "Customer Name", p.amount
FROM payment p
JOIN customer c ON p.customer_id = c.customer_id
WHERE p.amount > 6.99;

-- got it for question 2
-- i need more practice though this took all to catch up.


SELECT CONCAT(first_name, ' ', last_name) AS "Customer Name"
FROM customer
WHERE customer_id IN (
    SELECT customer_id 
    FROM payment 
    WHERE amount > 175
);

-- question 3 i am coming up nothing on this one i may have made a mistake
-- somewhere im not sure, i did about the same as before.

SELECT c.*
FROM customer c
JOIN address a ON c.address_id = a.address_id
JOIN city ci ON a.city_id = ci.city_id
JOIN country co ON ci.country_id = co.country_id
WHERE co.country = 'Nepal';

-- Question 4

SELECT staff_id, COUNT(*) AS "Transaction Count"
FROM payment
GROUP BY staff_id
ORDER BY COUNT(*) DESC
LIMIT 1;

-- Question 5 answer is staff memeber 2


SELECT rating, COUNT(*) AS "Movie Count"
FROM film
GROUP BY rating;

-- Question 6 answer is PG 194, R 195,  NC-17 210, PG-13 223, G 178

SELECT CONCAT(c.first_name, ' ', c.last_name) AS "Customer Name"
FROM customer c
WHERE c.customer_id IN (
    SELECT p.customer_id 
    FROM payment p
    GROUP BY p.customer_id
    HAVING COUNT(*) = 1 AND MAX(p.amount) > 6.99
);

-- Question 7 BOOM i got stuck for a bit

SELECT *
FROM payment
WHERE amount = 0;

SELECT COUNT(*) AS "Number of Zero Payments"
FROM payment
WHERE amount = 0;


-- Question 8 is 24 i think.....




