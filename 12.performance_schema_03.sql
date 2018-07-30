#Frequently Executed Queries
USE performance_schema;
SHOW TABLES;
SELECT * FROM performance_schema.
events_statements_summary_by_digest 
ORDER BY COUNT_STAR DESC;

SELECT 
DIGEST_TEXT AS `query`,
IF(((SUM_NO_GOOD_INDEX_USED > 0) OR (SUM_NO_INDEX_USED > 0)), 'Full Scan', '') full_scan,
COUNT_STAR AS exec_count,
ROUND(IFNULL(SUM_ROWS_EXAMINED / COUNT_STAR, 0)) AS avg_rows_examined,
ROUND(IFNULL(SUM_ROWS_SENT / COUNT_STAR, 0)) AS avg_rows_sent,
ROUND(IFNULL(SUM_ROWS_AFFECTED / COUNT_STAR, 0)) AS avg_rows_affected,
AVG_TIMER_WAIT/1000000000 AS avg_latency,
SUM_CREATED_TMP_TABLES AS tmp_tables,
SUM_CREATED_TMP_DISK_TABLES AS tmp_disk_tables,
SUM_SORT_ROWS AS rows_sorted,
LAST_SEEN AS last_seen
FROM performance_schema.events_statements_summary_by_digest
WHERE (DIGEST_TEXT LIKE '%sakila%' OR  DIGEST_TEXT LIKE '%employees%')
AND DIGEST_TEXT NOT LIKE 'SHOW%'
AND DIGEST_TEXT NOT LIKE 'EXPLAIN%'
ORDER BY exec_count DESC;