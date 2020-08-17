SELECT DISTINCT c.title
FROM Content c
INNER JOIN TVProgram t
USING (content_id)
WHERE Kids_content = 'Y' 
    AND content_type = 'Movies'
    AND program_date BETWEEN '2020-06-01' AND '2020-06-30';