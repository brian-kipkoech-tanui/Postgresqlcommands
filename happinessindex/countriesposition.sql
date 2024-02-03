-- Top ten happiest countries in 2017 and their position in 2016
SELECT 
	s2016.country,
	s2016.happiness_rank AS happ_2016,
	s2017.happiness_rank AS happ2017,
	s2018.overall_rank AS happ2018,
	s2019.overall_rank AS happ2019
FROM socialind2016 AS s2016
INNER JOIN socialind2017 AS s2017 ON s2016.country=s2017.country
INNER JOIN socialind2018 AS s2018 ON s2016.country=s2018.country
INNER JOIN socialind2019 AS s2019 ON s2016.country=s2019.country
ORDER BY s2017.happiness_rank;