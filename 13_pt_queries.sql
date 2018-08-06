SELECT *
FROM customer c
INNER JOIN rental r ON r.customer_id = c.customer_id
INNER JOIN inventory ia ON r.inventory_id = ia.inventory_id
INNER JOIN film f ON f.film_id = ia.film_id
INNER JOIN store st ON st.store_id = ia.store_id
INNER JOIN address ad ON ad.address_id = st.address_id;


SELECT *
FROM customer c
INNER JOIN rental r ON r.customer_id = c.customer_id
INNER JOIN inventory ia ON r.inventory_id = ia.inventory_id
INNER JOIN film f ON f.film_id = ia.film_id
INNER JOIN store st ON st.store_id = ia.store_id
INNER JOIN address ad ON ad.address_id = st.address_id
WHERE f.film_id = 10;

SELECT *
FROM customer c
INNER JOIN rental r ON r.customer_id = c.customer_id
INNER JOIN inventory ia ON r.inventory_id = ia.inventory_id
INNER JOIN film f ON f.film_id = ia.film_id
INNER JOIN store st ON st.store_id = ia.store_id
INNER JOIN address ad ON ad.address_id = st.address_id
WHERE c.first_name LIKE '%JULIA%' AND rental_date BETWEEN '2005-01-01 00:00:00' AND '2005-06-01 00:00:00';


SELECT *
FROM customer c
INNER JOIN rental r ON r.customer_id = c.customer_id
INNER JOIN inventory ia ON r.inventory_id = ia.inventory_id
INNER JOIN film f ON f.film_id = ia.film_id
INNER JOIN store st ON st.store_id = ia.store_id
INNER JOIN address ad ON ad.address_id = st.address_id
WHERE (c.first_name LIKE '%JULIA%' OR  c.first_name LIKE '%HENRY%')
AND rental_date BETWEEN '2005-01-01 00:00:00' AND '2005-06-01 00:00:00';


SELECT *
FROM inventory ia 
INNER JOIN film f ON f.film_id = ia.film_id
INNER JOIN store st ON st.store_id = ia.store_id
WHERE rating IN ('PG', 'R');


SELECT * 
FROM actor a
LEFT OUTER JOIN film_actor fa ON a.actor_id = fa.actor_id
LEFT OUTER JOIN film f ON f.film_id = fa.film_id
WHERE a.first_name LIKE '%CHRISTIAN%' AND a.last_name = 'GABLE';



