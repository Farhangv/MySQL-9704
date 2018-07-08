create user 'reporting_app'@'%' identified by 'o90o90o90';
create user 'accounting_app'@'%' identified by 'o90o90o90';
create user 'hr_app'@'localhost' identified by 'o90o90o90';

create role 'data_read';
grant select on `employees`.* to 'data_read';

CREATE USER 'reza'@'localhost' IDENTIFIED BY 'o90o90o90';
CREATE USER 'mitra'@'localhost' IDENTIFIED BY 'o90o90o90';
CREATE USER 'maryam'@'localhost' IDENTIFIED BY 'o90o90o90';
CREATE USER 'hesam'@'localhost' IDENTIFIED BY 'o90o90o90';
CREATE USER 'payam'@'localhost' IDENTIFIED BY 'o90o90o90';

create role 'db_expert';
grant SELECT,INSERT,UPDATE,DELETE on `employees`.`employees` to 'db_expert';
grant SELECT,INSERT,UPDATE,DELETE on `employees`.`departments` to 'db_expert';
grant SELECT,INSERT,UPDATE,DELETE on `employees`.`dept_manager` to 'db_expert';
grant SELECT,INSERT,UPDATE,DELETE on `employees`.`dept_emp` to 'db_expert';
grant SELECT,INSERT,UPDATE,DELETE on `employees`.`titles` to  'db_expert';

create role 'non_dbexpert';
grant select , create view on `employees`.* to 'non_dbexpert';

GRANT 'db_expert' TO 'reza'@'localhost';
GRANT 'db_expert' TO 'maryam'@'localhost';
GRANT ALL PRIVILEGES ON `employees`.* TO 'hesam'@'localhost';
GRANT 'data_read' TO 'mitra'@'localhost';
GRANT 'data_read' TO 'payam'@'localhost';

SELECT * FROM mysql.user;
