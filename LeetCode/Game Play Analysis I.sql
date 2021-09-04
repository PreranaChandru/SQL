# SOLUTION 1

SELECT player_id, MIN(event_date) as first_login 
FROM Activity
GROUP BY player_id;

# SOLUTION 2 (Using Window Function)

SELECT DISTINCT player_id, 
       FIRST_VALUE(event_date) OVER(PARTITION BY player_id ORDER BY event_date) AS first_login
FROM Activity;

