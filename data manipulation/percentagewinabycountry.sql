SELECT
    countries.Country,
    COUNT(CASE WHEN home_team = countries.Country AND home_score > away_score
               THEN 1
               WHEN away_team = countries.Country AND away_score > home_score
               THEN 1
               ELSE NULL
               END) * 100.0 / COUNT(*) AS pct_wins
FROM
    (SELECT home_team AS Country FROM results
     UNION
     SELECT away_team AS Country FROM results) AS countries
JOIN results ON countries.Country IN (results.home_team, results.away_team)
GROUP BY countries.Country
ORDER BY pct_wins DESC;
