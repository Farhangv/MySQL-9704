#Queries Using Temp Tables
USE performance_schema;
SHOW TABLES;

SELECT * FROM performance_schema.events_statements_summary_by_digest;

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
SUM_CREATED_TMP_TABLES AS tmp_memory_tables,
ROUND(IFNULL(SUM_CREATED_TMP_TABLES / COUNT_STAR, 0) * 100) AS pct_avg_tmp_memory_table_per_query,
SUM_CREATED_TMP_DISK_TABLES AS tmp_disk_tables,
ROUND(IFNULL(SUM_CREATED_TMP_DISK_TABLES / SUM_CREATED_TMP_TABLES, 0) * 100) AS pct_disk_to_total_tmp_tables,
SUM_SORT_ROWS AS rows_sorted,
LAST_SEEN AS last_seen
FROM performance_schema.events_statements_summary_by_digest
ORDER BY pct_disk_to_total_tmp_tables DESC, pct_avg_tmp_memory_table_per_query DESC;


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
SUM_CREATED_TMP_TABLES AS tmp_memory_tables,
ROUND(IFNULL(SUM_CREATED_TMP_TABLES / COUNT_STAR, 0)) AS avg_tmp_memory_table_per_query,
SUM_CREATED_TMP_DISK_TABLES AS tmp_disk_tables,
ROUND(IFNULL(SUM_CREATED_TMP_DISK_TABLES / SUM_CREATED_TMP_TABLES, 0)) AS disk_to_total_tmp_tables,
SUM_SORT_ROWS AS rows_sorted,
LAST_SEEN AS last_seen
FROM performance_schema.events_statements_summary_by_digest
WHERE DIGEST_TEXT LIKE '%sakila%'  AND DIGEST_TEXT NOT LIKE 'SHOW%'
ORDER BY SUM_CREATED_TMP_DISK_TABLES DESC, SUM_CREATED_TMP_TABLES DESC;



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
SUM_CREATED_TMP_TABLES AS tmp_memory_tables,
ROUND(IFNULL(SUM_CREATED_TMP_TABLES / COUNT_STAR, 0) * 100) AS pct_avg_tmp_memory_table_per_query,
SUM_CREATED_TMP_DISK_TABLES AS tmp_disk_tables,
ROUND(IFNULL(SUM_CREATED_TMP_DISK_TABLES / SUM_CREATED_TMP_TABLES, 0) * 100) AS pct_disk_to_total_tmp_tables,
SUM_SORT_ROWS AS rows_sorted,
LAST_SEEN AS last_seen
FROM performance_schema.events_statements_summary_by_digest
WHERE DIGEST_TEXT NOT LIKE 'SHOW%' AND DIGEST_TEXT NOT LIKE 'SET%'
AND DIGEST_TEXT NOT LIKE '%information_schema%'
ORDER BY pct_disk_to_total_tmp_tables DESC, pct_avg_tmp_memory_table_per_query DESC;