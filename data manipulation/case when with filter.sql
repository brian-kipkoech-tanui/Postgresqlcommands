SELECT 
	home_team, 
	away_team, 
	CASE WHEN home_team='Argentina' AND 
			  home_score > away_score THEN 'Argentina Home Win'
		 WHEN away_team='Argentina' AND 
		 	  away_score > home_score THEN 'Argentina Away Win'
		 END AS Argentina_outcome
FROM results
WHERE CASE WHEN home_team='Argentina' AND 
			    home_score > away_score THEN 'Argentina Home Win'
		   WHEN away_team='Argentina' AND 
		 	    away_score > home_score THEN 'Argentina Away Win'
		   END IS NOT NULL AND tournament NOT IN ('Friendly');

SELECT * FROM goalscorers;
SELECT * FROM results;