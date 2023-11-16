--How many payment transactions greater than 5
SELECT COUNT(*)
FROM payment
WHERE amount > 5;

--How many actors have the first name that starts with P
SELECT COUNT(*)
FROM actor
WHERE first_name LIKE 'P%';

--How many unique districts are our customers from?
SELECT DISTINCT(COUNT(district))
FROM address;

--Retrieve the names from the following question
SELECT DISTINCT district
FROM address;

--How many films have a rating of R and a replacement cost between 5 and 15
SELECT COUNT(*)
FROM film
WHERE rating = 'R' AND replacement_cost BETWEEN 5 AND 15;

--How many films have the word Truman somewhere in the title
SELECT COUNT(*)
FROM film
WHERE title LIKE '%Truman%';