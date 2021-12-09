-- DROP DATABASE IF EXISTS dbLektion9;
-- CREATE DATABASE dbLektion9;
-- USE dbLektion9;

SELECT * FROM tblRestaurant;

SELECT COUNT(*) FROM tblRestaurant WHERE fldCloseHour >= DATE_ADD(fldOpenHour, INTERVAL 12 HOUR);

SELECT * FROM film;

SELECT COUNT(*) FROM film WHERE rating = 'PG-13';

SELECT ROUND(AVG(viewer_rating)) FROM film WHERE rating = 'PG-13';

SELECT CONCAT(title, ': ', description) AS 'movies' FROM film WHERE title LIKE 'w%';

SELECT title, CHAR_LENGTH(description) FROM film ORDER BY CHAR_LENGTH(description) DESC LIMIT 1;
SELECT title, CHAR_LENGTH(description) FROM film ORDER BY CHAR_LENGTH(description) ASC LIMIT 1;

SELECT title, IF(rating = 'G', 'Suitable for children', '') AS suitability FROM film;
