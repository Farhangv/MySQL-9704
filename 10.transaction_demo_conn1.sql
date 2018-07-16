CREATE SCHEMA accounts;
USE accounts;
CREATE TABLE account
(
	Id INT PRIMARY KEY,
    Balance INT
);

CREATE TABLE Trx
(
	Id INT PRIMARY KEY auto_increment,
    FromAccount INT,
    ToAccount INT,
    Amount INT
);

INSERT INTO account VALUES (1, 1000),
(2,2000),
(3,3000),
(4,4000),
(7,7000),
(9,9000);

SELECT * FROM account;

SET innodb_table_locks = 1;
START TRANSACTION; 
SET autocommit = 0;
UPDATE account SET Balance = 1000 WHERE Id = 1;
SELECT * FROM account;
COMMIT;