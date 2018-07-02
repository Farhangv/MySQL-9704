SELECT * FROM `sakila`.`actor`;
SELECT * FROM `sakila`.`customer`;

GRANT SELECT ON sakila.customer TO 'mary'@'%';
GRANT SELECT ON sakila.actor TO 'mary'@'%';

SELECT * FROM `sakila`.`payment`;


SELECT * FROM information_schema.APPLICABLE_ROLES;
SELECT * FROM information_schema.ENABLED_ROLES;

SET ROLE 'accountant';

SELECT CURRENT_ROLE();

SELECT * FROM `sakila`.`payment`;



UPDATE `sakila`.`payment` SET `amount` = 10
WHERE payment_id = 1;

