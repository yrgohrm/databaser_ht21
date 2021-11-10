DROP DATABASE IF EXISTS dbLektion2;
CREATE DATABASE dbLektion2;
USE dbLektion2;

CREATE TABLE tblBook (
    fldId INT PRIMARY KEY,
    fldIsbn CHAR(13),
    fldTitle VARCHAR(50),
    fldAuthor VARCHAR(50),
    fldAvailable BOOL,
    fldPurchaseDate DATE
);

-- 9781943872367, Murach's MySQL (3rd Edition), Joel Murach
INSERT INTO tblBook VALUES
    (1, "9781943872367", "Murach's MySQL (3rd Edition)", "Joel Murach", true, "2021-11-10");

SELECT * FROM tblBook;
