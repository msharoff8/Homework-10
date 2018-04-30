USE sakila;
SELECT first_name, last_name
FROM actor;

SELECT CONCAT(first_name, ' ', last_name) As ActorName FROM actor;

SELECT actor_id, first_name, last_name FROM actor
WHERE first_name="Joe";

SELECT actor_id, first_name, last_name FROM actor
WHERE last_name LIKE "%GEN%";

SELECT actor_id, first_name, last_name FROM actor
WHERE last_name LIKE "%LI%"
order by last_name;

SELECT country_id, country 
FROM country
WHERE country in ("AFGHANISTAN", "BANGLADESH", "CHINA");

ALTER TABLE actor
  ADD middle_name VARCHAR(50) AFTER first_name;

ALTER TABLE actor
  MODIFY middle_name BLOB;

ALTER TABLE actor
  DROP middle_name;
  
SELECT last_name, COUNT(*) last_name
FROM actor
GROUP BY last_name;

UPDATE actor
SET first_name = "Harper"
WHERE first_name="Groucho" and last_name="Williams";

CREATE TABLE address (
	address_id smallint(5) NOT NULL,
    address VARCHAR (50),
    address2 VARCHAR(50),
    district VARCHAR(20),
    city_id smallint(5),
    postal_code VARCHAR(10),
    phone VARCHAR(20),
    location geometry,
    last_update timestamp,
    primary key (address_id)
);

SELECT first_name, last_name
FROM staff
LEFT JOIN address ON staff.address_id = address.address_id;


SELECT first_name, last_name, SUM(amount)
FROM payment
LEFT JOIN staff ON payment.staff_id = staff.staff_id
GROUP BY last_name;
	
SELECT title, COUNT(film_id)
FROM film
WHERE title="Hunchback Impossible";

SELECT *
FROM customer
INNER JOIN payment ON customer.customer_id = customer.customer_id
Group By last_name;


SELECT *
FROM film
WHERE title LIKE('K%') and language_id=1
or TITLE LIKE('Q%') and language_id=1;


SELECT first_name, last_name
FROM actor
WHERE actor_id IN
(
  SELECT actor_id
  FROM film_actor
  WHERE film_id IN
  (
    SELECT film_id
    FROM film
    WHERE title = 'Alone Trip'
	)
)

SELECT COUNT(film_id), film_id
FROM inventory
INNER JOIN rental ON inventory.inventory_id = rental.inventory_id
GROUP BY film_id
ORDER BY COUNT(film_id) DESC;
