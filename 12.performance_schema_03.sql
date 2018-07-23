#Find File with Max IO Size
USE performance_schema;
SHOW TABLES;
SELECT * FROM performance_schema.events_statements_summary_by_digest;