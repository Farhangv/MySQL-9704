#Longest Running Queries
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
SUM_CREATED_TMP_TABLES AS tmp_tables,
SUM_CREATED_TMP_DISK_TABLES AS tmp_disk_tables,
SUM_SORT_ROWS AS rows_sorted,
LAST_SEEN AS last_seen
FROM performance_schema.events_statements_summary_by_digest
ORDER BY MAX_TIMER_WAIT DESC;

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
SUM_CREATED_TMP_TABLES AS tmp_tables,
SUM_CREATED_TMP_DISK_TABLES AS tmp_disk_tables,
SUM_SORT_ROWS AS rows_sorted,
LAST_SEEN AS last_seen
FROM performance_schema.events_statements_summary_by_digest
WHERE DIGEST_TEXT NOT LIKE '%performance_schema%' AND
DIGEST_TEXT NOT LIKE 'SHOW%' AND
DIGEST_TEXT NOT LIKE 'SET%'
ORDER BY MAX_TIMER_WAIT DESC;

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
SUM_CREATED_TMP_TABLES AS tmp_tables,
SUM_CREATED_TMP_DISK_TABLES AS tmp_disk_tables,
SUM_SORT_ROWS AS rows_sorted,
LAST_SEEN AS last_seen
FROM performance_schema.events_statements_summary_by_digest
WHERE DIGEST_TEXT LIKE '%sakila%' AND DIGEST_TEXT NOT LIKE 'SHOW%'
ORDER BY MAX_TIMER_WAIT DESC;

SELECT * FROM sakila.actor WHERE actor_id = 10;

SELECT * FROM sakila.actor WHERE first_name LIKE 'VIV%';