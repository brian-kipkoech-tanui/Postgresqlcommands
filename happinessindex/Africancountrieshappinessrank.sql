SELECT 
	s15.country,
	s15.happiness_rank,
	s16.happiness_rank,
	s17.happiness_rank,
	s18.overall_rank,
	s19.overall_rank
FROM socialind2015 AS s15
INNER JOIN socialind2016 AS s16
USING(country)
INNER JOIN socialind2017 AS s17
USING(country)
INNER JOIN socialind2018 AS s18
USING(country)
INNER JOIN socialind2019 AS s19
USING(country)
WHERE s15.region IN ('Middle East and Nothern Africa', 'Sub-Saharan Africa');