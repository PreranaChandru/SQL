SELECT u.name, IFNULL(SUM(r.distance),0) AS travelled_distance
FROM Users u 
LEFT JOIN Rides r
ON r.user_id = u.id
GROUP BY u.name
ORDER BY travelled_distance DESC, u.name ASC;