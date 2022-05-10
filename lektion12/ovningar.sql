SELECT *
  FROM tblCarSale
 WHERE fldPrice >
       (SELECT AVG(fldPrice)
          FROM tblCarSale);

SELECT o.fldName
  FROM tblCarSale AS cs
       RIGHT JOIN tblOwner AS o
       ON o.fldId = cs.fldOwner
 WHERE cs.fldOwner IS NULL;
 
 SELECT fldName
  FROM tblOwner
 WHERE fldId NOT IN
       (SELECT fldOwner FROM tblCarSale);

SELECT *
  FROM (SELECT fldOwner, fldPrice
          FROM tblCarSale
         ORDER BY fldPrice
         LIMIT 3) AS ls
  JOIN tblOwner AS o
    ON o.fldId = ls.fldOwner;

INSERT INTO tblOrder VALUES
    (0, '2021-12-29 12:45:00', 2, 2, 'EKCH', 'ESGG', 2, 3);

SELECT fldId 
FROM tblOrder 
WHERE fldChildren = (SELECT MAX(fldChildren) FROM tblOrder);

SELECT DISTINCT e.fldName
  FROM tblOrder AS o
  JOIN tblEmployee AS e
    ON o.fldSoldBy = e.fldId
 WHERE fldChildren = (SELECT MAX(fldChildren) FROM tblOrder);

SELECT fldName
  FROM tblEmployee
 WHERE fldId IN (SELECT DISTINCT fldSoldBy 
                   FROM tblOrder
                  WHERE fldChildren = 
                        (SELECT MAX(fldChildren) 
                           FROM tblOrder));

SELECT e.fldName
  FROM tblOrder AS o
  JOIN tblEmployee AS e
    ON o.fldSoldBy = e.fldId
 GROUP BY o.fldSoldBy
HAVING SUM(o.fldAdults) > 2;

SELECT fldName
  FROM tblEmployee
 WHERE fldId IN (SELECT fldSoldBy
                   FROM tblOrder
                  GROUP BY fldSoldBy
                 HAVING SUM(fldAdults) > 2);
