SELECT
	-- Select region from socialind2015
	s15.region,
	-- Find the average happiness index for each year
	ROUND(AVG(s15.happiness_rank),2) AS avg_rank15,
	ROUND(AVG(s16.happiness_rank),2) AS avg_rank16,
	ROUND(AVG(s17.happiness_rank),2) AS avg_rank17,
	ROUND(AVG(s18.overall_rank),2) AS avg_rank18,
	ROUND(AVG(s19.overall_rank),2) AS avg_rank19
FROM socialind2015 AS s15
-- Left Join the other tables using country column
LEFT JOIN socialind2016 AS s16
USING(country)
LEFT JOIN socialind2017 AS s17
USING(country)
LEFT JOIN socialind2018 AS s18
USING(country)
LEFT JOIN socialind2019 AS s19
USING(country)
-- Group by region
GROUP BY s15.region
-- Include only those regions whose countries are top 50 on avg
HAVING(ROUND(AVG(s15.happiness_rank),2) <= 50 AND
	   ROUND(AVG(s16.happiness_rank),2) <= 50 AND
	   ROUND(AVG(s17.happiness_rank),2) <= 50 AND
	   ROUND(AVG(s18.overall_rank),2) <= 50   AND
	   ROUND(AVG(s19.overall_rank),2) <= 50)
-- Order by the avg rank of 2019
ORDER BY avg_rank19;