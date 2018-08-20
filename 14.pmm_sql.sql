SET GLOBAL userstat=1;
INSTALL PLUGIN QUERY_RESPONSE_TIME_AUDIT SONAME 'query_response_time.so';
INSTALL PLUGIN QUERY_RESPONSE_TIME SONAME 'query_response_time.so';
INSTALL PLUGIN QUERY_RESPONSE_TIME_READ SONAME 'query_response_time.so';
INSTALL PLUGIN QUERY_RESPONSE_TIME_WRITE SONAME 'query_response_time.so';
SET GLOBAL query_response_time_stats=ON;

SHOW VARIABLES LIKE '%slow%';
SHOW VARIABLES LIKE '%long%';
SET GLOBAL long_query_time = 1;
SET GLOBAL slow_query_log = 0;
SHOW VARIABLES LIKE 'performance_schema';
select * from performance_schema.setup_consumers;