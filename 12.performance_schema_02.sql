#Find File with Max IO Size
USE performance_schema;
SHOW TABLES;

SELECT *
FROM performance_schema.setup_instruments
WHERE NAME LIKE '%file%';

UPDATE performance_schema.setup_instruments
SET ENABLED = 'YES', TIMED = 'YES'
WHERE NAME LIKE '%file%';

SELECT *
FROM performance_schema.setup_consumers
WHERE NAME LIKE '%file%';

SELECT * FROM performance_schema.file_summary_by_instance;

SELECT
performance_schema.file_summary_by_instance.FILE_NAME,
performance_schema.file_summary_by_instance.SUM_NUMBER_OF_BYTES_READ AS total_read,
performance_schema.file_summary_by_instance.SUM_NUMBER_OF_BYTES_WRITE AS total_write,

(performance_schema.file_summary_by_instance.SUM_NUMBER_OF_BYTES_READ + 
performance_schema.file_summary_by_instance.SUM_NUMBER_OF_BYTES_WRITE) AS total,
(performance_schema.file_summary_by_instance.SUM_NUMBER_OF_BYTES_WRITE / 
(performance_schema.file_summary_by_instance.SUM_NUMBER_OF_BYTES_READ + 
performance_schema.file_summary_by_instance.SUM_NUMBER_OF_BYTES_WRITE)) AS pct
FROM performance_schema.file_summary_by_instance
ORDER BY pct DESC;