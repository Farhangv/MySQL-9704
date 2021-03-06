USE sakila;

ALTER TABLE sakila.film 
ADD KEY IX_length (length);

-- Optimize aggregate functions - MIN and MAX

SELECT *
FROM sakila.film
WHERE length = 100;

-- ---------------------------
-- Finding Minimum
SELECT MIN(film_id) , MAX(film_id), AVG(length)
FROM sakila.film 
WHERE length = 100;

-- Method 2
SELECT film_id
FROM sakila.film
WHERE length = 100
ORDER BY film_id
LIMIT 1;

-- Explain
EXPLAIN SELECT MIN(film_id) 
FROM sakila.film 
WHERE length = 100;

-- Method 2
EXPLAIN SELECT film_id
FROM sakila.film 
WHERE length = 100
ORDER BY film_id
LIMIT 1;

-- ---------------------------
-- Finding Maximum
-- Method 2
SELECT MAX(film_id) 
FROM sakila.film 
WHERE length = 100;

-- Method 2
SELECT film_id
FROM sakila.film 
WHERE length = 100
ORDER BY film_id DESC
LIMIT 1;

-- Explain
EXPLAIN SELECT MAX(film_id) 
FROM sakila.film 
WHERE length = 100;

-- Method 2
EXPLAIN SELECT film_id
FROM sakila.film 
WHERE length = 100
ORDER BY film_id DESC
LIMIT 1;


SELECT MIN(film_id) , MAX(film_id), AVG(film_id)
FROM sakila.film
WHERE length = 100;


EXPLAIN SELECT MIN(film_id) , MAX(film_id), AVG(film_id)
FROM sakila.film
WHERE length = 100;









