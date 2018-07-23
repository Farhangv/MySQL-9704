SHOW databases;
USE performance_schema;
SHOW TABLES;
USE information_schema;
SHOW TABLES;

SELECT @@GLOBAL.performance_schema;
SHOW VARIABLES LIKE 'performance_schema';

SHOW ENGINES;
USE performance_schema;
SELECT * FROM setup_timers;
SELECT * FROM user_variables_by_thread;


SELECT * FROM performance_schema.events_statements_summery_by_digest;