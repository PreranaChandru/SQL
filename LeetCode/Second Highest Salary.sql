# SOLUTION 1
SELECT MAX(Salary) AS SecondHighestSalary
FROM Employee
WHERE Salary < (SELECT MAX(Salary) FROM Employee);

# SOLUTION 2 

SELECT 
   (SELECT DISTINCT Salary 
    FROM Employee
    ORDER BY Salary DESC
    LIMIT 1 OFFSET 1)
AS SecondHighestSalary;

# SOULTION 3 (Using Window Function)

SELECT MAX(Salary) AS SecondHighestSalary                            
FROM 
     (SELECT Salary,
             DENSE_RANK() OVER(ORDER BY Salary DESC) AS R
      FROM Employee
     ) AS temp
WHERE temp.R = 2;    
