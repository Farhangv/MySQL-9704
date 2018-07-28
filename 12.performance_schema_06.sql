#Queries Sorting Entire Table
USE performance_schema;
SHOW TABLES; 

SELECT 
DIGEST_TEXT AS `query`,
IF(((SUM_NO_GOOD_INDEX_USED > 0) OR (SUM_NO_INDEX_USED > 0)), 'Full Scan', '') full_scan,
COUNT_STAR AS exec_count,
SUM_TIMER_WAIT /1000000000 AS total_latency,
MAX_TIMER_WAIT /1000000000 AS max_latency,
AVG_TIMER_WAIT/1000000000 AS avg_latency,
ROUND(IFNULL(SUM_ROWS_EXAMINED / COUNT_STAR, 0)) AS avg_rows_examined,
ROUND(IFNULL(SUM_ROWS_SENT / COUNT_STAR, 0)) AS avg_rows_sent,
ROUND(IFNULL(SUM_ROWS_AFFECTED / COUNT_STAR, 0)) AS avg_rows_affected,

SUM_SORT_SCAN AS sorts_using_scans,
SUM_SORT_RANGE AS sorts_using_range,
SUM_SORT_ROWS AS rows_sorted,

ROUND(IFNULL(SUM_SORT_ROWS / COUNT_STAR, 0)) AS avg_rows_sorted,

LAST_SEEN AS last_seen
FROM performance_schema.events_statements_summary_by_digest
WHERE SUM_SORT_ROWS > 0 
ORDER BY SUM_SORT_ROWS DESC;

SELECT 
DIGEST_TEXT AS `query`,
IF(((SUM_NO_GOOD_INDEX_USED > 0) OR (SUM_NO_INDEX_USED > 0)), 'Full Scan', '') full_scan,
COUNT_STAR AS exec_count,
SUM_TIMER_WAIT /1000000000 AS total_latency,
MAX_TIMER_WAIT /1000000000 AS max_latency,
AVG_TIMER_WAIT/1000000000 AS avg_latency,
ROUND(IFNULL(SUM_ROWS_EXAMINED / COUNT_STAR, 0)) AS avg_rows_examined,
ROUND(IFNULL(SUM_ROWS_SENT / COUNT_STAR, 0)) AS avg_rows_sent,
ROUND(IFNULL(SUM_ROWS_AFFECTED / COUNT_STAR, 0)) AS avg_rows_affected,

SUM_SORT_SCAN AS sorts_using_scans,
SUM_SORT_RANGE AS sorts_using_range,
SUM_SORT_ROWS AS rows_sorted,

ROUND(IFNULL(SUM_SORT_ROWS / COUNT_STAR, 0)) AS avg_rows_sorted,

LAST_SEEN AS last_seen
FROM performance_schema.events_statements_summary_by_digest
WHERE SUM_SORT_ROWS > 0 AND DIGEST_TEXT LIKE '%sakila%'  AND DIGEST_TEXT NOT LIKE 'SHOW%'
ORDER BY SUM_SORT_ROWS DESC;


SELECT * FROM sakila.actor ORDER BY actor_id DESC;
SELECT * FROM sakila.actor ORDER BY first_name DESC;
SELECT * FROM sakila.actor ORDER BY last_name DESC;
SELECT * FROM sakila.actor 
WHERE last_name = 'WILLIAMS'
ORDER BY last_name DESC;
