SELECT 
	region,
	COUNT(country) AS num_countries
FROM socialind2015
GROUP BY region
ORDER BY num_countries DESC;