USE sakila;
EXPLAIN SELECT *
FROM inventory ia 
INNER JOIN film f ON f.film_id = ia.film_id
INNER JOIN store st ON st.store_id = ia.store_id
WHERE rating IN ('PG', 'R');


EXPLAIN SELECT * 
FROM actor a
LEFT OUTER JOIN film_actor fa ON a.actor_id = fa.actor_id
LEFT OUTER JOIN film f ON f.film_id = fa.film_id
WHERE 
a.last_name = 'GABLE'
AND 
a.first_name = 'CHRISTIAN' 
;

EXPLAIN actor;


CREATE INDEX idx_actor_last_name ON actor(last_name);
CREATE INDEX IX_firstlastname ON actor(first_name, last_name);
CREATE INDEX idx_firstname ON actor(first_name);
DROP INDEX idx_actor_last_name ON actor;
DROP INDEX IX_firstlastname ON actor;
DROP INDEX idx_firstname ON actor;
SHOW PROFILES;
