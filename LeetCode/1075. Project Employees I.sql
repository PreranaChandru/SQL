SELECT p.project_id, ROUND(AVG (e.experience_years), 2) AS average_years
FROM Project p
INNER JOIN Employee e
USING (employee_id)
GROUP BY p.project_id;



SELECT DISTINCT p.project_id, 
       ROUND((AVG(e.experience_years) OVER(PARTITION BY p.project_id)),2) AS average_years
FROM Project p
JOIN Employee e
    USING(employee_id)
