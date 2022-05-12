USE Northwind;

SELECT OBJECT_DEFINITION(OBJECT_ID('dbo.Alphabetical list of products'))

EXEC sp_helptext 'dbo.Alphabetical list of products'

SELECT *
FROM [Alphabetical list of products]
ORDER BY CategoryName, ProductName;
GO

CREATE DATABASE lektion15;
GO

USE lektion15;
GO

CREATE TABLE tblOne (
    id INT PRIMARY KEY,
    val INT,
    name VARCHAR(10));

CREATE TABLE tblTwo (
    id INT PRIMARY KEY,
    val2 INT,
    name2 VARCHAR(10)
);

INSERT INTO tblOne VALUES
    (0, 1, 'nisse'),
    (1, 2, 'lasse'),
    (2, 3, 'bosse');

INSERT INTO tblTwo VALUES
    (0, 100, 'lena'),
    (1, 200, 'lisa'),
    (2, 300, 'jane');
GO

INSERT INTO tblTwo VALUES
    (3, 100, 'lars'),
    (4, 100, 'kalle'),
    (5, 100, 'leyla');
GO


CREATE VIEW testVy AS
    SELECT * FROM tblTwo WHERE name2 LIKE 'l%';
GO

SELECT * FROM testVy;

DROP VIEW IF EXISTS dbo.EmployeeAndTerritories;
GO

CREATE VIEW dbo.EmployeeAndTerritories
AS
    SELECT e.EmployeeID, e.FirstName, e.LastName, t.TerritoryID, t.TerritoryDescription
    FROM Employees AS e
        JOIN EmployeeTerritories AS et
        ON e.EmployeeID = et.EmployeeID
        JOIN Territories AS t
        ON t.TerritoryID = et.TerritoryID;
GO

SELECT * FROM EmployeeAndTerritories WHERE EmployeeID = 2;

UPDATE EmployeeAndTerritories SET FirstName = 'Andrew' WHERE TerritoryID = '01581';
GO

CREATE VIEW dbo.EncEmployeeNames
    WITH ENCRYPTION
AS
    SELECT FirstName, LastName 
    FROM Employees;
GO

SELECT OBJECT_DEFINITION(OBJECT_ID('dbo.EncEmployeeNames'))
EXEC sp_helptext 'dbo.EncEmployeeNames'
GO

CREATE VIEW dbo.SbEmployeeNames
    WITH SCHEMABINDING
AS
    SELECT FirstName, LastName 
    FROM dbo.Employees;
GO

ALTER TABLE Employees DROP COLUMN LastName;
GO

CREATE VIEW dbo.CoEmployeeNames
AS
    SELECT FirstName, LastName 
    FROM Employees
    WHERE FirstName LIKE 'M%'
    WITH CHECK OPTION;           -- Whoa! Inte samma plats!
GO

SELECT * FROM CoEmployeeNames;

-- Fungerar ej! The attempted insert ... failed … did not qualify ...
INSERT INTO CoEmployeeNames VALUES ('Merika', 'Ericsson');
GO
