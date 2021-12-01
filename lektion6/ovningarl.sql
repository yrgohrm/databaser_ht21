DROP DATABASE IF EXISTS dbLektion5;
CREATE DATABASE dbLektion5;
USE dbLektion5;

-- Exercise 6

CREATE TABLE tblCountry
(
    fldCode CHAR(2) PRIMARY KEY, -- Let's have a simple primary key
    fldName VARCHAR(35),
    fldLanguage VARCHAR(30),
    fldPopulation INT,
    fldBNP INT
);

INSERT INTO tblCountry VALUES
    ('SE', 'Sverige', 'Svenska', 10099300, 530),
    ('CH', 'Schweiz', 'Tyska', 8654700, 703),
    ('SY', 'Syrien', 'Arabiska', 17500000, 40),
    ('EG', 'Egypten', 'Arabiska', 100685000, 1200),
    ('YE', 'Jemen', 'Arabiska', 23580000, 58);

-- Excercise 7

SELECT fldName FROM tblCountry WHERE fldLanguage = 'Arabiska';

SELECT fldPopulation / 1000000 FROM tblCountry WHERE fldCode = 'SE';

SELECT fldName FROM tblCountry WHERE fldLanguage = 'Arabiska' AND fldPopulation > 20000000;

-- fldBNP is in billion usd
SELECT fldName, (1000000000 * fldBNP) / fldPopulation FROM tblCountry;

SELECT AVG(fldPopulation) / 1000000 FROM tblCountry;

SELECT * FROM tblCountry WHERE fldName LIKE 'S%';
