SELECT employee_id, COUNT(*) OVER( PARTITION BY team_id) AS team_size
FROM Employee;



SELECT e1.employee_id, (SELECT COUNT(employee_id)
                       FROM Employee e
                       WHERE e.team_id = e1.team_id
                       GROUP BY team_id) AS team_size
FROM Employee e1



SELECT e.employee_id, team_size
FROM Employee e
LEFT JOIN (SELECT team_id, COUNT(employee_id)  AS team_size
          FROM Employee 
          GROUP BY team_id) AS e1
    ON e.team_id = e1.team_id
