
SHOW ENGINES;
INSTALL SONAME 'ha_blackhole';

CREATE USER 'john'@'%' IDENTIFIED BY 'o90o90o90';

SHOW GRANTS FOR 'john'@'%';

GRANT SELECT ON `sakila`.`actor` TO 'john'@'%';
SELECT * FROM mysql.user;
GRANT SELECT ON sakila.actor TO 'john'@'%' WITH GRANT OPTION;

CREATE USER 'mary'@'%' IDENTIFIED BY 'o90o90o90';

GRANT SELECT ON sakila.actor TO 'john'@'%' WITH GRANT OPTION
MAX_USER_CONNECTIONS 2
;

SET PASSWORD FOR 'john'@'%' = PASSWORD('123');

CREATE USER 'david'@'localhost' IDENTIFIED BY '123';



CREATE ROLE 'accountant';
GRANT SELECT,INSERT,UPDATE,DELETE ON `sakila`.`payment` 
TO 'accountant';


GRANT 'accountant' TO 'john'@'%';

SHOW STATUS LIKE 'threadpool%';

SHOW PROCESSLIST;
KILL USER 'john';

SELECT @@global.thread_handling;




SELECT @@Threadpool_threads;