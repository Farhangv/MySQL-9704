USE sakila;

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

USE world;

EXPLAIN SELECT co.`Code`,COUNT(ci.Id) `CityCount`
FROM world.country co
LEFT OUTER JOIN world.city ci
ON ci.CountryCode = co.`Code`
GROUP BY co.`Code`;


EXPLAIN SELECT SUM(city.Population) FROM country JOIN city WHERE
city.CountryCode=country.Code AND country.HeadOfState="Vladimir Putin";

USE world;
SELECT ci.CountryCode,ci.District, SUM(ci.population) `DistrictPopulation`
FROM city ci
WHERE ci.CountryCode IN (
SELECT co.Code
FROM country co
WHERE (population > 20*1000*1000 AND co.Continent IN ('Asia', 'Europe'))    
	OR
    co.Name = 'Australia'
)
GROUP BY ci.CountryCode,ci.District
ORDER BY DistrictPopulation DESC;