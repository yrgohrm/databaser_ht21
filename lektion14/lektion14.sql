
-- USE Northwind;
-- GO

-- SELECT employeeid, firstname, lastname FROM employees WHERE lastname = 'Fuller';
-- GO

CREATE DATABASE [lektion14];
GO

USE [lektion14];
GO

-- Först skapar vi highscore-tabellen och sätter in lite data för att ha något att jobba med.

DROP TABLE IF EXISTS highscore;
CREATE TABLE highscore (id INT IDENTITY(1,1) PRIMARY KEY,
                        date DATETIME2 NOT NULL,
                        score INT NOT NULL,
                        difficulty VARCHAR(7) NOT NULL,
                        name VARCHAR(10) NOT NULL);
GO

INSERT INTO highscore (date, score, difficulty, name) VALUES (SYSDATETIME(), FLOOR(RAND()*10000), 'hard',   CONCAT('user', FLOOR(RAND()*10000)));
INSERT INTO highscore (date, score, difficulty, name) VALUES (SYSDATETIME(), FLOOR(RAND()*10000), 'normal', CONCAT('user', FLOOR(RAND()*10000)));
INSERT INTO highscore (date, score, difficulty, name) VALUES (SYSDATETIME(), FLOOR(RAND()*10000), 'easy',   CONCAT('user', FLOOR(RAND()*10000)));
GO 3000

-- Just to make sure it's there
SELECT TOP(10) * FROM highscore ORDER BY score DESC;

-- Query to get database stats

SELECT DB_NAME(database_id),
    MAX(user_scans) AS max,
    AVG(user_scans) AS average
FROM sys.dm_db_index_usage_stats
GROUP BY db_name(database_id)
ORDER BY average DESC;

-- Query to make those stats change a bit

SELECT TOP(2) name, score FROM highscore WHERE name LIKE '%98%'; -- First one is a scan
SELECT TOP(2) name, score FROM highscore WHERE id = FLOOR(RAND()*4+1) -- This one is a seek
GO 20

-- Query to find which indexes has scans

SELECT OBJECT_NAME(idx.object_id) AS [table],
    idx.name AS [index], user_scans, user_seeks,
    CASE ustat.index_id
    WHEN 1 THEN 'CLUSTERED'
    ELSE 'NONCLUSTERED'
    END AS type
FROM sys.dm_db_index_usage_stats AS ustat
    JOIN sys.indexes idx
    ON  idx.object_id=ustat.object_id
        AND idx.index_id=ustat.index_id
        AND database_id=DB_ID('lektion14') -- don't forget to have the correct db here
ORDER BY user_scans DESC;

-- example of a relatively large execution plan

USE Northwind;
SELECT et.employeeId, e.FirstName, e.LastName, t.territoryDescription, r.regionDescription FROM Employees AS e
INNER JOIN [EmployeeTerritories] AS et
    ON (e.employeeId = et.employeeId)
INNER JOIN [Territories] AS t
    ON (et.territoryId = t.territoryId)
INNER JOIN [Region] AS r
    ON (t.RegionID = r.RegionID)
ORDER BY et.employeeId;

USE [lektion14];
GO

-- Have a look at the following query and how we can change how it behaves with indexes

SELECT TOP(10) name, score, date FROM highscore ORDER BY score DESC;

-- utan något index: 0.669704

CREATE INDEX highscore_idx ON highscore(score);
-- med ovan index 0.0365338

DROP INDEX highscore.highscore_idx;

CREATE INDEX highscore_idx ON highscore(score DESC, date ASC, name);
CREATE INDEX highscore_idx ON highscore(score DESC, date DESC, name);
-- med ovan index 0.0033233

-- med ovan index kan vi även sortera på datum utan större kostnad
SELECT TOP(10) name, score, date FROM highscore ORDER BY score DESC, date ASC;

-- DROP INDEX highscore.highscore_idx;