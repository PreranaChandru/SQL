SELECT c.customer_id, c.name 
FROM Customers c
INNER JOIN Orders o USING (customer_id)
INNER JOIN Product p USING (product_id)
GROUP BY c.customer_id
HAVING SUM( IF (LEFT(o.order_date, 7) = '2020-06', o.quantity, 0) * p.price) >= 100
AND SUM( IF (LEFT(o.order_date, 7) = '2020-07', o.quantity, 0) * p.price) >= 100;;