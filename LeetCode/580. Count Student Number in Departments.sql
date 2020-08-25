SELECT d.dept_name, COUNT(DISTINCT student_id) AS student_number
FROM student s
RIGHT JOIN department d
USING (dept_id)
GROUP BY dept_name 
ORDER BY student_number DESC;