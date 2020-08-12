# SOLUTION 1

SELECT s.buyer_id
FROM Sales s
INNER JOIN Product p
USING (product_id)
GROUP BY s.buyer_id
HAVING SUM(p.product_name = 'S8') > 0 
AND 
SUM(p.product_name = 'iPhone') = 0;


# SOLUTION 2

SELECT s.buyer_id
FROM Sales s
INNER JOIN Product p
USING (product_id)
GROUP BY s.buyer_id
HAVING SUM(CASE WHEN p.product_name = 'S8' THEN 1 ELSE 0 END) > 0 
AND 
SUM(CASE WHEN p.product_name = 'iPhone' THEN 1 ELSE 0 END) = 0;


# SOLUTION 3

SELECT DISTINCT s.buyer_id
FROM Sales s
INNER JOIN Product p
USING (product_id)
WHERE p.product_name = 'S8'  
AND s.buyer_id NOT IN
            (SELECT DISTINCT s.buyer_id
            FROM Sales s
            INNER JOIN Product p
            USING (product_id)
            WHERE p.product_name = 'iPhone');