CREATE LOGIN TestUser 
WITH PASSWORD = 'someP4ssword',
CHECK_EXPIRATION = OFF;
GO

CREATE DATABASE lektion18;
GO

USE lektion18;
GO

CREATE USER TestUser FOR LOGIN TestUser WITH DEFAULT_SCHEMA = dbo;
GO

CREATE ROLE some_role;
GO

ALTER ROLE some_role ADD MEMBER TestUser;
GO

CREATE TABLE some_table (id INT PRIMARY KEY, val INT);
GO

GRANT SELECT, INSERT, UPDATE 
ON OBJECT :: dbo.some_table TO some_role;
GO

REVOKE INSERT ON OBJECT :: dbo.some_table
FROM some_role;
GO

CREATE ROLE no_update_role;
GO

ALTER ROLE no_update_role ADD MEMBER TestUser;
GO

DENY UPDATE ON OBJECT :: dbo.some_table TO no_update_role;
GO

REVOKE UPDATE ON OBJECT :: dbo.some_table TO no_update_role;
GO

CREATE SCHEMA hr;
GO

CREATE TABLE hr.a_table (id INT PRIMARY KEY, val INT);

GRANT SELECT, UPDATE, INSERT ON SCHEMA :: hr TO some_role;
GO
