-- USE lektion13;
-- GO

-- CREATE TABLE test (id INT PRIMARY KEY, val INT);
-- GO



-- CREATE DATABASE lektion13nr2;
-- GO

-- USE lektion13nr2;
-- GO

-- CREATE TABLE tblCompany (
--     fldId INT IDENTITY(1,1) PRIMARY KEY,
--     fldCompanyName VARCHAR(100) NOT NULL,
--     fldEmail VARCHAR(100)
-- );
-- GO

-- INSERT INTO tblCompany (fldCompanyName, fldEmail) VALUES 
--     ('Bosse Nisse AB', 'info@bossenisse.se'),
--     ('Lena Lamm Ltd.', 'info@llltd.co.uk'),
--     ('Acme Emca Industries', 'questions@aeind.com');
-- GO

-- SELECT * from tblCompany ORDER BY fldCompanyName ASC;
-- GO


-- SELECT name, database_id, compatibility_level 
-- FROM sys.databases;
-- GO

-- SELECT * FROM sys.databases;
-- GO

-- sp_helpdb lektion13;
-- GO

-- sp_help tblCompany;
-- GO

CREATE DATABASE TheGame;
GO

USE TheGame;
GO

CREATE TABLE highscore (
    id INT IDENTITY(1,1) PRIMARY KEY,
    date DATETIME2 NOT NULL,
    name VARCHAR(3) NOT NULL,
    points INT NOT NULL CHECK (points >= 0),
    difficulty TINYINT NOT NULL CHECK (difficulty > 0 AND difficulty <= 3)
);
GO

INSERT INTO highscore (date, name, points, difficulty) VALUES
    ('2022-04-23 10:00:00', 'HRM', 102000, 3),
    ('2022-04-23 12:00:00', 'PTH', 2000, 3),
    ('2022-04-23 13:00:00', 'AGK', 1234, 3),
    ('2022-04-26 14:00:00', 'HRM', 10200, 3);
GO

SELECT TOP(1) * FROM highscore WHERE name = 'HRM' ORDER BY date DESC;
GO
