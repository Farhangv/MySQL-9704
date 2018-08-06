USE sakila;

-- Retrieve all columns of the table film where length is less than 80 min

SELECT *
FROM sakila.film
WHERE length < 80;

EXPLAIN SELECT *
FROM sakila.film
WHERE length < 80;

ALTER TABLE sakila.film 
ADD KEY IX_length (length);

EXPLAIN SELECT *
FROM sakila.film
WHERE length < 80;

SELECT *
FROM sakila.film
WHERE length < 80;

SHOW STATUS LIKE 'Last_Query_Cost';

-- 
SELECT MAX(length) from sakila.film;
EXPLAIN SELECT *
FROM sakila.film
WHERE length < 61;

SELECT *
FROM sakila.film
WHERE length < 61;
SHOW STATUS LIKE 'Last_Query_Cost';


EXPLAIN EXTENDED SELECT *
FROM sakila.film
WHERE length >= 61 AND length <= 79;
SHOW WARNINGS;

EXPLAIN EXTENDED SELECT *
FROM sakila.film
WHERE length BETWEEN 61 AND 79;
SHOW WARNINGS;

ALTER TABLE sakila.film 
DROP KEY IX_length;














