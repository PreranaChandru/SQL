SELECT customer_number
FROM orders
GROUP BY customer_number
ORDER BY COUNT(*) DESC
LIMIT 1;


# SOLUTION 2 (Using Window Function)

SELECT customer_number 
FROM 
    (
        SELECT customer_number,
               DENSE_RANK() OVER(ORDER BY COUNT(order_number) DESC) AS dr
        FROM Orders
        GROUP BY customer_number
    ) AS temp
WHERE temp.dr = 1
