# SOLUTION 1

SELECT seller_id 
FROM Sales 
GROUP BY seller_id
HAVING SUM(price) = (SELECT SUM(price)
                        FROM Sales
                        GROUP BY seller_id
                        ORDER BY SUM(price) DESC
                        LIMIT 1);


# SOLUTION 2

SELECT seller_id
FROM Sales
GROUP BY seller_id 
HAVING SUM(price) >= ALL(SELECT SUM(price)
                    FROM Sales
                    GROUP BY seller_id);