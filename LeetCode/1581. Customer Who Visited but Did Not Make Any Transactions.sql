SELECT customer_id, COUNT(v.visit_id) AS count_no_trans
FROM Visits v
LEFT JOIN Transactions t 
USING(visit_id)
WHERE transaction_id IS NULL
GROUP BY customer_id
ORDER BY COUNT(v.visit_id) DESC
