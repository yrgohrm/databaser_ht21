SELECT * FROM tblOwner;

SELECT fldRegNo, COUNT(fldRegNo) FROM tblOwner GROUP BY fldRegNo;

SELECT fldRegNo, COUNT(fldRegNo) 
FROM tblOwner 
GROUP BY fldRegNo
HAVING COUNT(fldRegNo) > 1;

SELECT fldRegNo, COUNT(fldRegNo) 
FROM tblOwner 
WHERE fldMeterCount > 12064
GROUP BY fldRegNo
HAVING COUNT(fldRegNo) > 1;

SELECT fldCourse, COUNT(fldStudent)
FROM tblAttendance
WHERE fldCourse <> 'OOP'
GROUP BY fldCourse;

SELECT fldCourse, COUNT(fldStudent)
FROM tblAttendance
GROUP BY fldCourse
HAVING fldCourse <> 'OOP';


SELECT * FROM tblCarSale;

SELECT fldRegNo, COUNT(fldSellDate) 
FROM tblCarSale 
GROUP BY fldRegNo 
HAVING COUNT(fldSellDate) > 1;

SELECT fldMake, COUNT(DISTINCT fldModel) FROM tblCarSale GROUP BY fldMake;

SELECT YEAR(fldSellDate), COUNT(*) AS sales
FROM tblCarSale 
GROUP BY YEAR(fldSellDate)
ORDER BY sales DESC;

SELECT fldMake, fldModel, ROUND(AVG(fldPrice), -3) 
FROM tblCarSale
GROUP BY fldMake, fldModel;

SELECT fldMake, fldModel, ROUND(AVG(fldPrice), -3) 
FROM tblCarSale
WHERE fldMeterCount < 10000
GROUP BY fldMake, fldModel;

