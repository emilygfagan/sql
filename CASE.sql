SELECT * FROM customer;

/* Use general case statement to return the first 100 
customers as Premium, the next 100 as Plus, 
and the rest as Normal. */

SELECT customer_id,
CASE
	WHEN (customer_id <= 100) THEN 'Premium'
	WHEN (customer_id BETWEEN 100 AND 200) THEN 'Plus'
	ELSE 'Normal'
END AS customer_class
FROM customer;

/* Running a raffle using case expression statement.
The case expression is the best one to use because
we are just checking for equality instead of conditions. */

SELECT customer_id,
CASE customer_id
	WHEN 2 THEN 'Winner'
	WHEN 5 THEN 'Second Place'
	ELSE 'Normal'
END AS raffle_results
FROM customer;

/* Using a CASE statement to make calculations.
Categorizing $0.99 movies as Bargains, $2.99
as Regular, and $4.99 as Premium. */

SELECT
SUM(CASE rental_rate
	WHEN 0.99 THEN 1
	ELSE 0
END) AS bargains,
SUM(CASE rental_rate
   WHEN 2.99 THEN 1
   ELSE 0
END) AS regular,
SUM(CASE rental_rate
   WHEN 4.99 THEN 1
   ELSE 0
END) AS premium
FROM film;

/* Compare the various amounts of films per movie
rating. Using the CASE expression because it is
easier in this task. */

SELECT
SUM(CASE rating
   	WHEN 'R' THEN 1
   	ELSE 0
END) AS r,
SUM(CASE rating
   	WHEN 'PG-13' THEN 1
   	ELSE 0
END) AS pg13,
SUM(CASE rating
   	WHEN 'PG' THEN 1
   	ELSE 0
END) AS pg,
SUM(CASE rating
   	WHEN 'G' THEN 1
   	ELSE 0
END) AS g,
SUM(CASE rating
   	WHEN 'NC-17' THEN 1
   	ELSE 0
END) AS nc17
FROM film;