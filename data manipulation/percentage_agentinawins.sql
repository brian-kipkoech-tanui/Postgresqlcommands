SELECT
home_team,
	COUNT(CASE WHEN home_team = 'Argentina' AND home_score > away_score
	   		 THEN 1
	   		 WHEN away_team = 'Argentina' AND away_score > home_score
	   		 THEN 1
	   		 ELSE NULL
	   		 END) * 100.0 / COUNT(*) AS pct_argentinawins
FROM results
WHERE home_team = 'Argentina' OR
	  away_team = 'Argentina'
GROUP BY home_team
ORDER BY pct_argentinawins DESC;
