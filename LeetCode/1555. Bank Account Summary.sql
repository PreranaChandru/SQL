# SOLUTION 1

SELECT u.user_id, u.user_name, 
(u.credit + 
SUM(CASE WHEN  u.user_id = t.paid_to THEN t.amount ELSE 0 END) - 
SUM(CASE WHEN  u.user_id = t.paid_by THEN t.amount ELSE 0 END) ) AS credit,
(CASE WHEN (u.credit + SUM(CASE WHEN  u.user_id = t.paid_to THEN t.amount ELSE 0 END) - SUM(CASE WHEN  u.user_id = t.paid_by THEN t.amount ELSE 0 END) ) < 0 THEN 'Yes' ELSE 'No' END) AS credit_limit_breached
FROM Users u 
LEFT JOIN Transaction t
ON u.user_id = t.paid_to OR u.user_id = t.paid_by
GROUP BY u.user_id;
    

# SOLUTION 2

SELECT u.user_id, 
       u.user_name, 
       u.credit - IFNULL(t1.amount, 0) + IFNULL(t2.amount, 0) AS credit,
       (CASE 
            WHEN (u.credit - IFNULL(t1.amount, 0) + IFNULL(t2.amount, 0)) < 0 
            THEN 'Yes' 
            ELSE 'No'
        END)  AS credit_limit_breached   
FROM Users u 
LEFT JOIN 
(SELECT paid_by, SUM(IFNULL(amount, 0)) AS amount FROM Transaction GROUP BY paid_by) t1
ON u.user_id = t1.paid_by
LEFT JOIN 
(SELECT paid_to, SUM(IFNULL(amount, 0)) AS amount FROM Transaction GROUP BY paid_to) t2
ON u.user_id = t2.paid_to
GROUP BY u.user_id;
        