#SOLUTION 1

SELECT IFNULL(ROUND(COUNT(DISTINCT session_id) / COUNT(DISTINCT user_id), 2), 0) AS average_sessions_per_user
FROM Activity
WHERE activity_date BETWEEN '2019-06-28' AND '2019-07-27';


#SOLUTION 2

SELECT IFNULL(ROUND(AVG(number_of_session), 2),0) AS average_sessions_per_user
FROM (SELECT DISTINCT user_id, COUNT(DISTINCT session_id ) AS number_of_session
        FROM Activity
        WHERE DATEDIFF('2019-07-27', activity_date) < 30
        GROUP BY user_id) AS A;