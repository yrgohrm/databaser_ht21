SELECT c.fldRegNo, cs.fldSellDate, o.fldName 
  FROM tblCarSale AS cs
       JOIN tblCar AS c 
         ON c.fldRegNo = cs.fldRegNo
       JOIN tblOwner AS o
         ON cs.fldOwner = o.fldId;
         
SELECT c.fldRegNo, tblCarSale.fldSellDate, o.fldName 
  FROM tblCarSale
       JOIN tblCar AS c 
         ON c.fldRegNo = tblCarSale.fldRegNo
       JOIN tblOwner AS o
         ON tblCarSale.fldOwner = o.fldId;

 SELECT c.fldMake, COUNT(DISTINCT cs.fldRegNo), COUNT(DISTINCT o.fldId) 
   FROM tblCarSale AS cs 
        JOIN tblCar AS c 
        ON c.fldRegNo = cs.fldRegNo 
        JOIN tblOwner AS o 
        ON o.fldId = cs.fldOwner 
  WHERE cs.fldPrice > 10000 
  GROUP BY c.fldMake;
  
  SELECT * 
  FROM tblCarSale AS cs1 
       JOIN tblCarSale AS cs2 
       ON cs1.fldRegNo = cs2.fldRegNo
          AND cs1.fldSellDate < cs2.fldSellDate 
          AND cs1.fldPrice < cs2.fldPrice;
          
SELECT o.fldName
  FROM tblCarSale AS cs 
       RIGHT JOIN tblOwner AS o 
       ON o.fldId = cs.fldOwner
 WHERE cs.fldOwner IS NULL;

SELECT fldDate, fldFrom, fldTo, fldName
  FROM tblOrder AS o
       JOIN tblCustomer AS c
       ON o.fldCustomer = c.fldId;
       
SELECT fldDate, a1.fldName AS 'From', a2.fldName AS 'To', c.fldName
  FROM tblOrder AS o
       JOIN tblCustomer AS c
       ON o.fldCustomer = c.fldId
       JOIN tblAirport AS a1
       ON o.fldFrom = a1.fldIcao
       JOIN tblAirport AS a2
       ON o.fldTo = a2.fldIcao;
       
SELECT e1.fldName AS 'Person', e2.fldName AS 'Chef'
  FROM tblEmployee AS e1
       LEFT JOIN tblEmployee AS e2
       ON e1.fldSupervisor = e2.fldId;

SELECT DISTINCT tblCustomer.fldId, tblCustomer.fldName
  FROM tblOrder
       JOIN tblCustomer
       ON tblOrder.fldCustomer = tblCustomer.fldId
 WHERE fldChildren > 0;