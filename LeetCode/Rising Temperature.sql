SELECT w2.Id
FROM Weather w1
JOIN Weather w2
ON DATEDIFF(w2.RecordDate, w1.RecordDate) = 1 
WHERE w2.Temperature > w1.Temperature;

# SOLUTION 2 (Using Window Function)

SELECT id
FROM 
(
    SELECT id,
           Temperature - LAG(Temperature) OVER(ORDER BY recordDate) AS temp_diff,
           DATEDIFF(recordDate, LAG(recordDate) OVER(ORDER BY recordDate)) AS date_diff
    FROM Weather 
) AS t
WHERE t.temp_diff > 0  AND t.date_diff = 1
