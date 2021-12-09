DROP DATABASE IF EXISTS dbLektion8;
CREATE DATABASE dbLektion8;
USE dbLektion8;

CREATE TABLE tblUser (
    fldId INT PRIMARY KEY,
    fldEmail VARCHAR(70) NOT NULL,
    fldName VARCHAR(70)
);

INSERT INTO tblUser VALUES (0, 'bo@orm.se', 'Bo A Orm');

INSERT INTO tblUser VALUES (1, '', '');

INSERT INTO tblUser (fldId) VALUES (2);

SELECT * FROM tblUser;



CREATE TABLE tblAudit (
    fldTraceId CHAR(32) PRIMARY KEY,
    fldTimestamp TIMESTAMP DEFAULT CURRENT_TIMESTAMP(),
    fldLogText VARCHAR(200)
);

INSERT INTO tblAudit (fldTraceId, fldLogText) 
VALUES ('123e4567e89b12d3a456426614174000', 'My litte error');

INSERT INTO tblAudit VALUES ('123e4567e89b12d3a456426614174001', DEFAULT, 'My other litte error');

SELECT * FROM tblAudit;



CREATE TABLE tblCarOwner (
    fldId INT PRIMARY KEY,
    fldName VARCHAR(100)
);

CREATE TABLE tblCar (
    fldRegNo CHAR(6) PRIMARY KEY,
    fldModel VARCHAR(50),
    fldOwner INT,
    FOREIGN KEY (fldOwner) REFERENCES tblCarOwner(fldId)
);

INSERT INTO tblCarOwner VALUES (0, "Bosse Bredsladd");

INSERT INTO tblCar VALUES ('ANK313', 'Ford', 0);
INSERT INTO tblCar VALUES ('ANK131', 'Ford', 1); -- Error in FK. No such owner!

INSERT INTO tblCar (fldRegNo, fldModel) VALUES ('ANK131', 'Ford');

INSERT INTO tblCar VALUES ('ANK132', 'Ford', NULL);

SELECT * FROM tblCar;

DROP TABLE IF EXISTS tblNewsletter;

CREATE TABLE tblNewsletter (
    fldEmail VARCHAR(70) PRIMARY KEY CHECK (fldEmail LIKE '%@%'),
    fldNewsletter BOOLEAN NOT NULL DEFAULT FALSE
);

INSERT INTO tblNewsletter VALUES 
    ('apa@bepa.com', TRUE),
    ('nisse@bosse.com', DEFAULT);

SELECT * FROM tblNewsletter;