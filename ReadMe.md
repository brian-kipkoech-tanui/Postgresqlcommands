# SQL Query ReadMe

## Example1: Home Team Either Schalke 04 or Bayern Munich
```sql
-- Example of how to use the query
SELECT 
    CASE WHEN hometeam_id = 10189 THEN 'FC Schalke 04'
         WHEN hometeam_id = 9823 THEN 'FC Bayern Munich'
         ELSE 'Other' END AS home_team,
	COUNT(id) AS total_matches
FROM matches_germany
GROUP BY home_team;
```
## Overview
This SQL query is designed to identify the home team in a dataset containing German football matches. The home team is classified as either Bayern Munich, Schalke 04, or labeled as 'Other' if it is neither of these teams.

## Query Explanation
The query utilizes a `CASE` statement to categorize the home team based on their respective team IDs. The teams considered are FC Bayern Munich (team ID: 9823) and FC Schalke 04 (team ID: 10189). Any other team is labeled as 'Other'. The result includes the home team and the total number of matches played by each team.

## Usage
- Ensure that you have the necessary permissions to access the `matches_germany` table.
- Copy and paste the SQL query into your preferred SQL environment (e.g., MySQL, PostgreSQL).
- Execute the query to retrieve information on the home team and the total number of matches played.

## Query Result
The result set includes two columns:
- `home_team`: The name of the home team (FC Bayern Munich, FC Schalke 04, or Other).
- `total_matches`: The total number of matches played by each home team.
---
## Example2: Select season, date,  home_goal, away_goal where Bologna won
```sql
-- Example of how to use the query
SELECT 
	season,
    date,
	home_goal,
	away_goal
FROM matches_italy
WHERE 
	CASE WHEN hometeam_id = 9857 AND home_goal > away_goal THEN 'Bologna Win'
		WHEN awayteam_id = 9857 AND away_goal > home_goal THEN 'Bologna Win' 
		END IS NOT NULL;
```
## Overview
This SQL query is designed to retrieve information about matches in the Italian football league where Bologna won. It selects data such as the season, date, home goals, and away goals for games won by Bologna.

## Query Explanation
The query uses a `CASE` statement to identify matches won by Bologna. It checks both home and away scenarios where Bologna has a higher goal count than the opposing team. The result set includes information about the season, date, home goals, and away goals for the matches won by Bologna.

## Usage
- Ensure that you have the necessary permissions to access the `matches_italy` table.
- Copy and paste the SQL query into your preferred SQL environment (e.g., MySQL, PostgreSQL).
- Execute the query to retrieve information on matches won by Bologna.

## Query Result
The result set includes four columns:
- `season`: The season of the match.
- `date`: The date of the match.
- `home_goal`: The number of goals scored by the home team.
- `away_goal`: The number of goals scored by the away team.

---
## Example3: Calculate age with Postgress
```sql
-- Example of how to use the query
SELECT DATE_PART('year', age(birthdate::timestamp)) AS age
FROM people;
```
## Overview
This SQL query is designed to calculate the age of individuals based on their birthdate using the `DATE_PART` function. It extracts the year component of the age from the `people` table.

## Query Explanation
The query utilizes the `DATE_PART` function to calculate the age of individuals. It converts the `birthdate` column to a timestamp and then extracts the year component of the age. The result set includes the calculated age for each individual in the `people` table.

## Usage
- Ensure that you have the necessary permissions to access the `people` table.
- Copy and paste the SQL query into your preferred SQL environment (e.g., MySQL, PostgreSQL).
- Execute the query to retrieve the calculated age for each individual.

## Query Result
The result set includes one column:
- `age`: The calculated age of individuals based on their birthdate.

---

## Example4: summarize the number of matches won by the home team in different seasons for each country
```sql
-- Example of how to use the query
SELECT 
	c.name AS country,
    SUM(CASE WHEN m.season = '2012/2013' AND m.home_goal > m.away_goal THEN 1 ELSE 0 END) AS matches_2012_2013,
 	SUM(CASE WHEN m.season = '2013/2014' AND m.home_goal > m.away_goal THEN 1 ELSE 0 END) AS matches_2013_2014,
	SUM(CASE WHEN m.season = '2014/2015' AND m.home_goal > m.away_goal THEN 1 ELSE 0 END) AS matches_2014_2015
FROM country AS c
LEFT JOIN match AS m
ON c.id = m.country_id
GROUP BY country;
```

## Overview
This SQL query is designed to summarize the number of matches won by the home team in different seasons for each country. It calculates the count of winning matches for the seasons 2012/2013, 2013/2014, and 2014/2015 and presents the results grouped by country.

## Query Explanation
The query uses the `SUM` function with conditional aggregation (`CASE` statements) to count the matches won by the home team for each specified season. The results are then grouped by country using the `LEFT JOIN` between the `country` and `match` tables.

## Usage
- Ensure that you have the necessary permissions to access the `country` and `match` tables.
- Copy and paste the SQL query into your preferred SQL environment (e.g., MySQL, PostgreSQL).
- Execute the query to retrieve the summarized information on matches won by the home team for different seasons and countries.

## Query Result
The result set includes three columns:
- `country`: The name of the country.
- `matches_2012_2013`: The total number of matches won by the home team in the 2012/2013 season for each country.
- `matches_2013_2014`: The total number of matches won by the home team in the 2013/2014 season for each country.
- `matches_2014_2015`: The total number of matches won by the home team in the 2014/2015 season for each country.