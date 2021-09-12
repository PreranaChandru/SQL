SELECT Name 
FROM Candidate c
INNER JOIN Vote v
ON c.id = v.candidateId
GROUP BY CandidateId
ORDER BY COUNT(CandidateId) DESC
LIMIT 1
