SELECT e.Name as Employee
FROM Employee e
INNER JOIN Employee m 
ON e.ManagerId = m.Id
WHERE e.Salary > m.Salary;