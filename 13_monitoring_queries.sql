SET GLOBAL connect_timeout=28800;
SET GLOBAL wait_timeout=28800;
SET GLOBAL interactive_timeout=28800;
SET GLOBAL net_read_timeout = 28800;
SET GLOBAL net_write_timeout = 28800;

SELECT * FROM sakila.actor;
###################################################################
SELECT f.title, COUNT(*) AS actor_count
FROM sakila.actor a 
INNER JOIN sakila.film_actor fa ON a.actor_id = fa.actor_id
INNER JOIN sakila.film f ON fa.film_id = f.film_id
GROUP BY f.`title`
ORDER BY actor_count DESC; 
####################################################################
####################################################################
SELECT f.title, a.first_name, a.last_name
FROM sakila.actor a
CROSS JOIN
sakila.film f;
####################################################################
SELECT *
FROM employees.salaries
WHERE salary >= 50000;

#####################################################
SELECT * FROM sakila.actor
INNER JOIN sakila.film_actor USING(actor_id)
INNER JOIN sakila.film USING(film_id)
WHERE sakila.film.title = 'Academy Dinosaur';
#####################################################

SELECT sakila.actor.*
FROM sakila.actor
INNER JOIN sakila.film_actor USING(actor_id)
INNER JOIN sakila.film USING(film_id)
WHERE sakila.film.title = 'Academy Dinosaur';

SELECT * 
FROM sakila.actor
WHERE first_name LIKE '%r%';SELECT * 
FROM sakila.actor
WHERE first_name LIKE '%r%';SELECT * 
FROM sakila.actor
WHERE first_name LIKE '%r%';SELECT * 
FROM sakila.actor
WHERE first_name LIKE '%r%';SELECT * 
FROM sakila.actor
WHERE first_name LIKE '%r%';

SELECT * 
FROM sakila.actor
WHERE last_name LIKE '%G%';

SELECT ROUND(salary/1000) salary_range, YEAR(to_date),COUNT(*) count
FROM employees.salaries
GROUP BY ROUND(salary/1000), YEAR(to_date)
ORDER BY count DESC;


SELECT ROUND(salary/1000) salary_range, YEAR(to_date),COUNT(*) count
FROM employees.salaries
WHERE to_date > 1999
GROUP BY ROUND(salary/1000), YEAR(to_date)
ORDER BY count DESC;


SELECT ROUND(salary/1000) salary_range, YEAR(from_date),COUNT(*) count
FROM employees.salaries
WHERE from_date > 1999
GROUP BY ROUND(salary/1000), YEAR(from_date)
ORDER BY count DESC;

SELECT e.*,d.*  
FROM employees.employees e
INNER JOIN employees.dept_emp de USING(emp_no)
INNER JOIN employees.departments d USING(dept_no)
WHERE e.first_name = 'Patricia';

SELECT e.*,d.*  
FROM employees.employees e
INNER JOIN employees.dept_emp de USING(emp_no)
INNER JOIN employees.departments d USING(dept_no)
WHERE e.first_name LIKE '%Patricia%';

SELECT t.*,e.*,d.*  
FROM employees.titles t
INNER JOIN employees.employees e USING(emp_no)
INNER JOIN employees.dept_emp de USING(emp_no)
INNER JOIN employees.departments d USING(dept_no)
WHERE e.first_name LIKE '%Patricia%'
AND t.title LIKE '%engineer%';