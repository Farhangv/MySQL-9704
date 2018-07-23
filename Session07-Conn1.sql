USE sakila;
SET TRANSACTION ISOLATION LEVEL
READ COMMITTED;
SELECT * FROM film WHERE film_id = 100 
FOR UPDATE;
UPDATE film_availablity 
SET available_qty = available_qty -1
WHERE film_id = 100;
UPDATE film SET rental_duration = 10
WHERE film_id = 100;
ROLLBACK;