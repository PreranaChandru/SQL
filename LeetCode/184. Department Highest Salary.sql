# SOLUTION 1

SELECT d.Name AS Department, e.Name as Employee, e.Salary AS Salary
FROM Employee e
INNER JOIN Department d
ON e.DepartmentId = d.Id
WHERE (e.DepartmentId, e.Salary) IN (SELECT DepartmentId, MAX(Salary)
                                  	FROM Employee
                                  	GROUP BY DepartmentId);

# SOLUTION 2 

SELECT d.Name AS Department,
       s.Name AS Employee, 
       s.Salary
FROM (SELECT Name, 
             Salary, 
             DepartmentId, 
             DENSE_RANK() OVER(PARTITION BY DepartmentId ORDER BY Salary DESC) AS 'Rank'
      FROM Employee
      ) AS s
INNER JOIN Department d
ON s.DepartmentId = d.Id
WHERE s.Rank = 1; 
       