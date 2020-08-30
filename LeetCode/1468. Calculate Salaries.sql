SELECT s1.company_id, employee_id, employee_name, 
   (CASE WHEN s2.max_salary > 10000 THEN ROUND((s1.salary * 0.51), 0)
         WHEN s2.max_salary < 1000 THEN s1.salary    
         ELSE ROUND(s1.salary * 0.76, 0)
   END) AS salary
FROM Salaries s1
INNER JOIN 
(SELECT company_id, MAX(salary) AS max_salary FROM Salaries GROUP BY company_id) s2
ON s1.company_id = s2.company_id
