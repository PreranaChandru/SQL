SELECT (MONTHS * SALARY) AS EARNINGS, COUNT((MONTHS * SALARY))
FROM EMPLOYEE
GROUP BY EARNINGS 
ORDER BY EARNINGS DESC
LIMIT 1;
