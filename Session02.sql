SELECT * FROM mysql.user;
CREATE USER 'isc'@'%' IDENTIFIED BY 'q12q12q12';

SHOW GRANTS FOR 'isc'@'%';
GRANT USAGE on *.* TO 'isc'@'%';
GRANT ALL PRIVILEGES ON test.* TO 'isc'@'%';
SHOW GRANTS FOR 'isc'@'%';
GRANT ALL PRIVILEGES ON *.* TO 'isc'@'%';
SHOW GRANTS FOR 'isc'@'%';



SHOW GRANTS;
SHOW GRANTS FOR CURRENT_USER;
SHOW GRANTS FOR CURRENT_USER();

