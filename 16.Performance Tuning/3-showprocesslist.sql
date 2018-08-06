SHOW FULL PROCESSLIST ;

EXPLAIN EXTENDED SELECT * 
FROM sakila.actor
INNER JOIN sakila.film_actor
ON sakila.actor.actor_id = sakila.film_actor.actor_id;

SHOW WARNINGS;

EXPLAIN EXTENDED 
select `sakila`.`actor`.`actor_id` AS `actor_id`,`sakila`.`actor`.`first_name` AS `first_name`,`sakila`.`actor`.`last_name` AS `last_name`,`sakila`.`actor`.`last_update` AS `last_update`,`sakila`.`film_actor`.`actor_id` AS `actor_id`,`sakila`.`film_actor`.`film_id` AS `film_id`,`sakila`.`film_actor`.`last_update` AS `last_update` from `sakila`.`actor` join `sakila`.`film_actor` where (`sakila`.`film_actor`.`actor_id` = `sakila`.`actor`.`actor_id`);

SHOW WARNINGS;