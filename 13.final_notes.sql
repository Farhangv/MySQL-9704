SET profiling = 1;

USE world;
SELECT SQL_SMALL_RESULT Name,Count(*) AS Cities FROM city GROUP BY Name HAVING Cities > 2;
SELECT SQL_BIG_RESULT Name,Count(*) AS Cities FROM city GROUP BY Name HAVING Cities > 2;
EXPLAIN SELECT SQL_SMALL_RESULT Name,Count(*) AS Cities FROM city GROUP BY Name HAVING Cities > 2;
SHOW PROFILES;
EXPLAIN SELECT SQL_BIG_RESULT Name,Count(*) AS Cities FROM city GROUP BY Name HAVING Cities > 2;
SHOW PROFILE FOR QUERY 1;

#Forcing Usage of Temporary Tables
CREATE INDEX Name ON city (Name);

EXPLAIN SELECT Name,Count(*) AS Cities FROM city
GROUP BY Name HAVING Cities > 2;

EXPLAIN SELECT SQL_BUFFER_RESULT Name,Count(*) AS Cities FROM city
GROUP BY Name HAVING Cities > 2;

DROP INDEX Name ON city;


#Memory Table
SET max_heap_table_size = 1024*516;

CREATE TABLE t (a VARCHAR(10), b INT) ENGINE = MEMORY;

SET max_heap_table_size = @@max_heap_table_size;