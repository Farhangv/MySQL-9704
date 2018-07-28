SELECT @@global.general_log;
SET GLOBAL general_log = 'OFF';
SET GLOBAL performance_schema = 'ON';
SELECT @@global.performance_schema;
SHOW VARIABLES LIKE 'performance_schema';

SELECT *
FROM performance_schema.setup_instruments;

SELECT * 
FROM performance_schema.setup_consumers;

SELECT *
FROM performance_schema.setup_instruments
WHERE NAME LIKE 'statement/%';

UPDATE performance_schema.setup_instruments
SET ENABLED = 'YES', TIMED = 'YES'
WHERE NAME LIKE 'statement/%';

SELECT *
FROM performance_schema.setup_instruments
WHERE NAME LIKE '%events%';

UPDATE performance_schema.setup_instruments
SET ENABLED = 'YES'
WHERE NAME LIKE '%events%';

SELECT *
FROM performance_schema.setup_consumers
WHERE NAME LIKE '%events%';

UPDATE performance_schema.setup_consumers
SET ENABLED = 'YES'
WHERE NAME LIKE '%events%';


SELECT * FROM performance_timers;
SELECT * FROM setup_timers;

#Step 1
SELECT *
FROM sakila.actor;

#Step 2
SELECT CURRENT_USER(), CONNECTION_ID();
SELECT NOW();

#Step 3
SHOW FULL PROCESSLIST;

#Step 4
SELECT THREAD_ID, PROCESSLIST_ID
FROM performance_schema.threads
WHERE PROCESSLIST_ID = CONNECTION_ID();

#Select all waits for current events
SELECT * 
FROM performance_schema.events_waits_current;
SELECT *
FROM performance_schema.events_waits_history;

SELECT * 
FROM performance_schema.events_waits_current e
INNER JOIN performance_schema.threads t ON e.THREAD_ID = t.THREAD_ID
WHERE PROCESSLIST_ID = CONNECTION_ID();

SELECT 
EVENT_NAME,
(TIMER_END-TIMER_START) / 1000000000 'Duration(ms)',
OBJECT_NAME, OBJECT_TYPE, INDEX_NAME,OPERATION	
FROM performance_schema.events_waits_current e
INNER JOIN performance_schema.threads t ON e.THREAD_ID = t.THREAD_ID
WHERE PROCESSLIST_ID = CONNECTION_ID();