SELECT project_id
FROM Project 
GROUP BY project_id
HAVING COUNT(*) = (SELECT COUNT(*)
                    FROM Project
                    GROUP BY project_id
                    ORDER BY COUNT(*) DESC
                    LIMIT 1);
                    
                    
                    
# SOLUTION 2

WITH CTE AS
(SELECT project_id, DENSE_RANK() OVER(ORDER BY COUNT(employee_id) DESC) AS dr
FROM Project
GROUP BY project_id)

SELECT project_id
FROM CTE
WHERE dr = 1
