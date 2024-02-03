SELECT 
	home_team, 
	away_team, 
	CASE WHEN fthg > ftag THEN 'Home Team Won'
		 WHEN ftag > fthg THEN 'Away team Won'
		 ELSE 'Draw' END AS outcome
FROM premier;
SELECT * FROM premier;