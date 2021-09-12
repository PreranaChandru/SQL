SELECT Name 
FROM Candidate c
INNER JOIN Vote v
ON c.id = v.candidateId
GROUP BY CandidateId
ORDER BY COUNT(CandidateId) DESC
LIMIT 1



SELECT name 
FROM Candidate
WHERE Id =
        (SELECT CandidateId
        FROM Vote
        GROUP BY CandidateId
        ORDER BY COUNT(*) DESC
        LIMIT 1)
        
        
SELECT Name 
FROM Candidate c
INNER JOIN  
        (SELECT CandidateId,
                DENSE_RANK() OVER(ORDER BY COUNT(CandidateId) DESC) AS dr
         FROM Vote       
         GROUP BY CandidateId
        ) AS temp
ON c.id = temp.candidateId
WHERE temp.dr = 1

        
