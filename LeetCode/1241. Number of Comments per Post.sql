SELECT DISTINCT s1.sub_id AS post_id, 
(SELECT COUNT(DISTINCT s2.sub_id) FROM Submissions s2 WHERE s2.parent_id = s1.sub_id) AS number_of_comments
FROM Submissions s1
WHERE s1.parent_id IS NULL
ORDER BY s1.sub_id;