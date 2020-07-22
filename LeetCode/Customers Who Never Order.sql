# SOLUTION 1
SELECT c.Name AS Customers
FROM Customers c
LEFT JOIN Orders o
ON c.Id = o.CustomerId
WHERE o.CustomerId IS Null;

# SOLUTION 2

SELECT c.Name as Customers
FROM Customers c
WHERE c.Id NOT IN (SELECT o.CustomerId FROM Orders o);
