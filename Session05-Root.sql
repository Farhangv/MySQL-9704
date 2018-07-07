SELECT * FROM employees.dept_emp;
SELECT * FROM employees.employees;

SELECT * FROM information_schema.GLOBAL_STATUS WHERE VARIABLE_NAME LIKE 'threadpool%';

CREATE SCHEMA dblog;

USE dblog;

CREATE TABLE thread_pool_log(threads INT, idle_threads INT, logdate DATETIME);
INSERT INTO thread_pool_log VALUES (1,1,NOW());
SELECT * FROM thread_pool_log;
CREATE EVENT threadpool_logger
    ON SCHEDULE AT CURRENT_TIMESTAMP + INTERVAL 1 MINUTE
    DO
		
		INSERT INTO thread_pool_log
        SELECT (
			SELECT VARIABLE_VALUE FROM information_schema.GLOBAL_STATUS WHERE VARIABLE_NAME =  'threadpool_threads'

        ), 
	    (
			SELECT VARIABLE_VALUE FROM information_schema.GLOBAL_STATUS WHERE VARIABLE_NAME =  'threadpool_idle_threads'

        ), NOW()
      