# SOLUTION 1

SELECT followee AS follower, COUNT(DISTINCT follower) AS num
FROM follow
GROUP BY followee
HAVING followee IN (SELECT follower FROM follow );


# SOLUTION 2

SELECT f1.follower, COUNT(DISTINCT f2.follower) AS num
FROM follow f1
INNER JOIN follow f2
ON f1.follower = f2.followee
GROUP BY f1.follower;
