SELECT student_id, MIN(course_id) AS course_id, grade 
FROM Enrollments
WHERE (student_id, grade) IN 
                            (
                                SELECT student_id, MAX(grade)
                                FROM Enrollments
                                GROUP BY student_id
                            )
GROUP BY student_id
ORDER BY student_id




SELECT temp.student_id, temp.course_id, temp.grade
FROM 
(
    SELECT student_id, course_id, grade,
        ROW_NUMBER() OVER(PARTITION BY student_id ORDER BY grade DESC, course_id ASC) AS rn
    FROM Enrollments
)AS temp
WHERE temp.rn = 1

