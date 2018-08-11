USE world;
EXPLAIN SELECT ci.CountryCode,ci.District, 
SUM(ci.population) `DistrictPopulation`
FROM city ci
WHERE ci.CountryCode IN (
SELECT co.Code
FROM country co
WHERE (population > 20*1000*1000 AND co.Continent IN ('Asia', 'Europe'))    
	OR
    co.Name = 'Australia'
)
GROUP BY ci.CountryCode,ci.District
ORDER BY DistrictPopulation DESC;

EXPLAIN EXTENDED SELECT ci.CountryCode,ci.District, 
SUM(ci.population) `DistrictPopulation`
FROM city ci
WHERE ci.CountryCode IN (
SELECT co.Code
FROM country co
WHERE (population > 20*1000*1000 AND co.Continent IN ('Asia', 'Europe'))    
	OR
    co.Name = 'Australia'
)
GROUP BY ci.CountryCode,ci.District
ORDER BY DistrictPopulation DESC;
SHOW WARNINGS;

EXPLAIN SELECT ci.CountryCode,ci.District, 
SUM(ci.population) `DistrictPopulation`
FROM city ci
WHERE ci.CountryCode IN (
SELECT co.Code
FROM country co
WHERE (population > 20*1000*1000 AND co.Continent IN ('Asia', 'Europe'))    
	OR
    co.Name = 'Australia'
)
GROUP BY ci.CountryCode,ci.District
ORDER BY DistrictPopulation DESC;

explain select `world`.`ci`.`CountryCode`,`world`.`ci`.`District`,
sum(`world`.`ci`.`Population`) AS `DistrictPopulation` 
from `world`.`country` `co` join `world`.`city` `ci` 
where ((`world`.`ci`.`CountryCode` = `world`.`co`.`Code`) 
and 
(
		((`world`.`co`.`Population` > 20000000) and (`world`.`co`.`Continent` in ('Asia','Europe'))) 
		or 
		(`world`.`co`.`Name` = 'Australia'))
) 
group by `world`.`ci`.`CountryCode`,`world`.`ci`.`District` 
order by sum(`world`.`ci`.`Population`) desc;

SHOW PROFILES;

CREATE TABLE `TempResult`
(
	Id INT PRIMARY KEY AUTO_INCREMENT,
    CountryCode CHAR(3),
    District CHAR(50),
    DistrictPopulation INT
);

delimiter //
CREATE PROCEDURE LoadQ(p1 INT)
BEGIN
  label1: LOOP
    SET p1 = p1 - 1;
    IF p1 > 0 THEN		
		INSERT INTO `world`.`TempResult`
		(`CountryCode`,
		`District`,
		`DistrictPopulation`)
		select `world`.`ci`.`CountryCode`,`world`.`ci`.`District`,
		sum(`world`.`ci`.`Population`) AS `DistrictPopulation` 
		from `world`.`country` `co` join `world`.`city` `ci` 
		where ((`world`.`ci`.`CountryCode` = `world`.`co`.`Code`) 
		and 
		(
				((`world`.`co`.`Population` > 20000000) and (`world`.`co`.`Continent` in ('Asia','Europe'))) 
				or 
				(`world`.`co`.`Name` = 'Australia'))
		) 
		group by `world`.`ci`.`CountryCode`,`world`.`ci`.`District` 
		order by sum(`world`.`ci`.`Population`) desc;
      ITERATE label1;
    END IF;
    LEAVE label1;
  END LOOP label1;
END//
delimiter ;


delimiter //
CREATE PROCEDURE LoadQ2(p1 INT)
BEGIN
  label1: LOOP
    SET p1 = p1 - 1;
    IF p1 > 0 THEN		
		INSERT INTO `world`.`TempResult`
		(`CountryCode`,
		`District`,
		`DistrictPopulation`)
		SELECT ci.CountryCode,ci.District, 
		SUM(ci.population) `DistrictPopulation`
		FROM city ci
		WHERE ci.CountryCode IN (
		SELECT co.Code
		FROM country co
		WHERE (population > 20*1000*1000 AND co.Continent IN ('Asia', 'Europe'))    
			OR
			co.Name = 'Australia'
		)
		GROUP BY ci.CountryCode,ci.District
		ORDER BY DistrictPopulation DESC;
      ITERATE label1;
    END IF;
    LEAVE label1;
  END LOOP label1;
END//
delimiter ;

TRUNCATE TABLE TempResult;
CALL LoadQ(500);

TRUNCATE TABLE TempResult;
CALL LoadQ2(500);

CREATE INDEX IX_Population ON country(population);
DROP INDEX IX_Population ON country;

CREATE INDEX IX_Continent ON country(continent);
DROP INDEX IX_Continent ON country;

CREATE INDEX IX_Pop_Cont ON country(continent,population);

EXPLAIN SELECT ci.CountryCode,ci.District, 
SUM(ci.population) `DistrictPopulation`
FROM city ci
WHERE ci.CountryCode IN (
SELECT co.Code
FROM country co 
WHERE (population > 20*1000*1000 AND 
	co.Continent IN ('Asia', 'Europe'))    
	OR
    co.Name = 'Australia'
)
GROUP BY ci.CountryCode,ci.District
ORDER BY DistrictPopulation DESC;

