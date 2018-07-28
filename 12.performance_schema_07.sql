#Index Usage Statistics
USE performance_schema;
SHOW TABLES; 

SELECT 
OBJECT_SCHEMA,
OBJECT_NAME,
INDEX_NAME,
COUNT_FETCH,
SUM_TIMER_FETCH,
COUNT_INSERT,
SUM_TIMER_INSERT,
COUNT_UPDATE,
SUM_TIMER_UPDATE,
COUNT_DELETE,
SUM_TIMER_DELETE
FROM performance_schema.table_io_waits_summary_by_index_usage
WHERE INDEX_NAME IS NOT NULL
ORDER BY SUM_TIMER_WAIT DESC;

SELECT 
OBJECT_SCHEMA,
OBJECT_NAME,
INDEX_NAME,
COUNT_FETCH,
SUM_TIMER_FETCH,
COUNT_INSERT,
SUM_TIMER_INSERT,
COUNT_UPDATE,
SUM_TIMER_UPDATE,
COUNT_DELETE,
SUM_TIMER_DELETE
FROM performance_schema.table_io_waits_summary_by_index_usage
WHERE INDEX_NAME IS NOT NULL AND OBJECT_SCHEMA LIKE 'sakila'
ORDER BY SUM_TIMER_WAIT DESC;