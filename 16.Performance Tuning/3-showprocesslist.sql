SHOW FULL PROCESSLIST ;

EXPLAIN EXTENDED SELECT * 
FROM sakila.actor
INNER JOIN sakila.film_actor
ON sakila.actor.actor_id = sakila.film_actor.actor_id;

SHOW WARNINGS;