-- CREATE DATABASE dbLektion7;
USE dbLektion7;

CREATE TABLE tblDirector (
    fldId INT AUTO_INCREMENT PRIMARY KEY,
    fldName VARCHAR(100)
);

CREATE TABLE tblActor (
    fldId INT AUTO_INCREMENT PRIMARY KEY,
    fldName VARCHAR(100)
);

CREATE TABLE tblMovie (
    fldId INT AUTO_INCREMENT PRIMARY KEY,
    fldName VARCHAR(100),
    fldRating INT
);

CREATE TABLE tblDirectedBy (
    fldDirector INT,
    fldMovie INT,
    PRIMARY KEY (fldDirector, fldMovie),
    FOREIGN KEY (fldDirector) REFERENCES tblDirector(fldId),
    FOREIGN KEY (fldMovie) REFERENCES tblMovie(fldId)
);

CREATE TABLE tblActedIn (
    fldActor INT,
    fldMovie INT,
    PRIMARY KEY (fldActor, fldMovie),
    FOREIGN KEY (fldActor) REFERENCES tblActor(fldId),
    FOREIGN KEY (fldMovie) REFERENCES tblMovie(fldId)
);

INSERT INTO tblActor VALUES (DEFAULT, 'Jessica Alba');

INSERT INTO tblDirector VALUES (DEFAULT, 'Steven Spielberg');

INSERT INTO tblMovie VALUES (DEFAULT, 'Dark Angel 2', 10);

INSERT INTO tblActedIn VALUES (1, 1);

INSERT INTO tblDirectedBy VALUES (1, 1);

INSERT INTO tblActedIn VALUES (23, 34);

SELECT a.fldName,m.fldName FROM tblActor AS a
    JOIN tblActedIn AS ai ON a.fldId = ai.fldActor
    JOIN tblMovie AS m ON ai.fldMovie = m.fldId;