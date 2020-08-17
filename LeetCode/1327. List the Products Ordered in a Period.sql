SELECT p.product_name, SUM(o.unit) AS unit
FROM Products p
INNER JOIN Orders o
USING (product_id)
WHERE o.order_date BETWEEN '2020-02-01' AND '2020-02-29'
GROUP BY o.product_id
HAVING SUM(o.unit) >= 100 ;