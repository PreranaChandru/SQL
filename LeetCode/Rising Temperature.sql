SELECT w2.Id
FROM Weather w1
JOIN Weather w2
ON DATEDIFF(w2.RecordDate, w1.RecordDate) = 1 
WHERE w2.Temperature > w1.Temperature;