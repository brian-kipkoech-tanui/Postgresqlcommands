SELECT
	home_team,
	away_team,
	COUNT(CASE WHEN home_score > away_score
		  THEN home_team END) AS home_wins,
	COUNT(CASE WHEN home_score < away_score
		  THEN away_team END) AS away_wins,
	COUNT(CASE WHEN home_score = away_score
		  THEN away_team END) AS ties
FROM results
WHERE tournament='Copa América'
GROUP BY home_team, away_team
ORDER BY home_wins DESC;


SELECT * FROM goalscorers;

SELECT * FROM results
