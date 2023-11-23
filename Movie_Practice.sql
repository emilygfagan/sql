-- Extracting data of inactive customers.
SELECT * FROM sakila.customer
WHERE active = 0;

-- Retrieving the first name, last name, and emails of inactive customers.
SELECT first_name, last_name, email
FROM sakila.customer
WHERE active = 0;

-- Identify the store_id which has the highest number of inactive customers.
SELECT store_id AS 'Store Number', COUNT(store_id) AS 'Number of Inactive'
FROM sakila.customer
WHERE active = 0
GROUP BY store_id;

-- Retrieve the names of the PG-13 rated movies.
SELECT title 
FROM film
WHERE rating = 'PG-13';

-- Identify the top ten PG-13 movies with the longest running time.
SELECT title 
FROM film
WHERE rating = 'PG-13'
ORDER BY length DESC
LIMIT 10;

-- Find the most popular PG-13 movies based on rental duration.
SELECT title AS 'Most Popular PG-13'
FROM film
WHERE rating = 'PG-13'
ORDER BY rental_duration ASC;

-- Find average rental cost of the movies.
SELECT AVG(rental_rate) AS 'Average Rental Rate'
FROM film;

-- Find the total replacement cost of all the movies.
SELECT SUM(replacement_cost) AS 'Total Replacement Cost'
FROM film;

-- Identify the number of films in the Animation category.
SELECT COUNT(film_id) AS 'Animation'
FROM sakila.film_category
WHERE category_id = 2;

-- Identify the number of films in the Children category.
SELECT COUNT(film_id) AS 'Children'
FROM sakila.film_category
WHERE category_id = 3;