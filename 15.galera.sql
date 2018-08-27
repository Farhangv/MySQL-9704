SHOW VARIABLES LIKE '%wsrep%';

SHOW GLOBAL STATUS LIKE 'wsrep_cluster_size';

CREATE SCHEMA `new_db`;



create user 'myuser'@'%' identified by 'mypwd';
grant select on mysql.user to 'myuser'@'%';
grant select on mysql.db to 'myuser'@'%';
grant select on mysql.tables_priv to 'myuser'@'%';
grant show databases on *.* to 'myuser'@'%';