CREATE SCHEMA accounts;
USE accounts;
CREATE TABLE account
(
	Id INT PRIMARY KEY,
    Balance INT
);
TRUNCATE TABLE account;

INSERT INTO account(Id, Balance) 
VALUES 
(1,1000),
(2,2000),
(3,3000),
(4,4000),
(7,7000),
(9,9000);

SELECT @@GLOBAL.tx_isolation;


