# Euclidean distance
The Euclidean distance formula is used to find the distance between two points on a plane. 
This formula says the distance between two points (x1 1 , y1 1 ) and (x2 2 , y2 2 ) is d = √[(x2 – x1)2 + (y2 – y1)2].

SELECT ROUND(
             POW(
                 ((POW((MAX(LAT_N)-MIN(LAT_N)),2)) + (POW((MAX(LONG_W)-MIN(LONG_W)),2)))
                 , 0.5)
             , 4)
FROM STATION
