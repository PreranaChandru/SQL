 SELECT CEILING(
                AVG(SALARY) - AVG(CAST((REPLACE(CAST(SALARY AS CHAR), '0', '')) AS DECIMAL))
              )
FROM EMPLOYEES



SELECT CEILING(
              AVG(SALARY) - 
              AVG(CONVERT((REPLACE(CONVERT(SALARY, CHAR), '0', '')), DECIMAL))
              )
FROM EMPLOYEES



CAST(EXPR AS DATATYPE)
CONVERT(EXPR, DATATYPE)
DATATYPE --> CHAR, NCHAR, DECIMAL, DATETIME, DATE, TIME, BINARY, SIGNED, UNSIGNED 
REPLACE(STR, FIND_STRING, REPLACE_WITH)