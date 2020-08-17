SELECT c.country_name, 
CASE  
    WHEN AVG(w.weather_state) <= 15 THEN 'Cold'
    WHEN AVG(w.weather_state) >= 25 THEN 'Hot' 
    ELSE 'Warm'
  END AS weather_type
FROM Countries c 
INNER JOIN Weather w
USING (country_id)
WHERE w.day BETWEEN '2019-11-01' AND '2019-11-30'
GROUP BY w.country_id ;