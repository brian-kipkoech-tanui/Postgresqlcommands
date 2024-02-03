SELECT 
	region,
	ROUND(AVG(happiness_rank),2) AS avg_rank
FROM socialind2015
GROUP BY region
ORDER BY avg_rank ASC;