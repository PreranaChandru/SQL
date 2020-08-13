# SOLUTION 1

SELECT p.product_id, p.product_name 
FROM Sales s
LEFT JOIN Product p
USING (product_id)
GROUP BY p.product_id
HAVING MIN(sale_date) >= '2019-01-01' AND MAX(sale_date) <= '2019-03-31';


# SOLUTION 2

SELECT product_id, product_name 
FROM Product
GROUP BY product_id
HAVING product_id IN (SELECT product_id 
                        FROM Sales 
                        GROUP BY product_id
                        HAVING MIN(sale_date) >= '2019-01-01'
                        AND MAX(sale_date) <= '2019-03-31');