SELECT DISTINCT CITY 
FROM STATION 
WHERE RIGHT(CITY, 1) IN ('a', 'e', 'i', 'o', 'u') AND LEFT(CITY, 1) IN ('a', 'e', 'i', 'o', 'u');

OR 

SELECT DISTINCT CITY 
FROM STATION 
WHERE SUBSTRING(CITY, 1, 1) IN ('a', 'e', 'i', 'o', 'u') 
AND SUBSTRING(CITY, LEN(CITY), 1) IN ('a', 'e', 'i', 'o', 'u');