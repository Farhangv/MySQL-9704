USE sakila;
CREATE TABLE film_availablity
(
	film_id INT PRIMARY KEY,
    available_qty INT
) ENGINE = InnoDB;
INSERT INTO film_availablity
SELECT film_id, FLOOR(RAND()*(15-1+1))+1
FROM film;