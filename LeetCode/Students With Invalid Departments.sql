# SOLUTION 1
SELECT s.id, s.name
FROM Students s
WHERE s.department_id NOT IN (SELECT id from Departments);

# SOLUTION 2
SELECT s.id, s.name
FROM Students s
LEFT JOIN Departments d
ON s.department_id = d.id
WHERE d.id IS Null;