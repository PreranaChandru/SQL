#SOLUTION 1

SELECT DISTINCT a.seat_id
FROM cinema a JOIN cinema b
ON ABS(a.seat_id - b.seat_id) = 1
AND a.free = True AND b.free = True
ORDER BY a.seat_id;

#SOLUTION 2

SELECT DISTINCT a.seat_id
FROM cinema a JOIN cinema b
ON a.seat_id = b.seat_id - 1 OR a.seat_id = b.seat_id + 1
WHERE a.free = True AND b.free = True
ORDER BY a.seat_id;