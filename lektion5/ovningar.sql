-- Clean everything and set it up anew
DROP DATABASE IF EXISTS dbLektion5;
CREATE DATABASE dbLektion5;
USE dbLektion5;

-- Exercise 4
CREATE TABLE tblEmployee 
(
    fldId INT AUTO_INCREMENT PRIMARY KEY, 
    fldFirstName VARCHAR(30),
    fldLastName VARCHAR(30),
    fldSalary INT,
    fldDepartement VARCHAR(10),
    fldCity VARCHAR(20)
);

INSERT INTO tblEmployee VALUES
    (DEFAULT, 'Lars', 'Eriksson', 35000, 'Ekonomi', 'Göteborg'),
    (DEFAULT, 'Eliza', 'Hamilton', 42000, 'Ekonomi', 'Halmstad'),
    (DEFAULT, 'Nour', 'Amin', 32000, 'Inköp', 'Göteborg'),
    (DEFAULT, 'Elna', 'Lindström', 24000, 'Lager', 'Stockholm'),
    (DEFAULT, 'Erik', 'Smith', 24500, 'Lager', 'Uppsala'),
    (DEFAULT, 'Abdi', 'Merari', 25400, 'Inköp', 'Göteborg'),
    (DEFAULT, 'Bosse', 'Bredsladd', 22400, 'Inköp', 'Uppsala');
    
SELECT * FROM tblEmployee;

SELECT fldFirstName, fldLastName  
  FROM tblEmployee 
 WHERE fldCity = 'Göteborg';
 
SELECT fldFirstName, fldLastName, fldSalary  
  FROM tblEmployee 
 WHERE fldCity = 'Göteborg'
       AND fldSalary > 30000;
 
SELECT ROUND(AVG(fldSalary), -2) AS 'Snittlön Lager'
 FROM tblEmployee
WHERE fldDepartement = 'Lager';

SELECT *
  FROM tblEmployee
 ORDER BY fldSalary DESC;
 
SELECT DISTINCT fldCity
  FROM tblEmployee
 WHERE fldDepartement = 'Inköp';