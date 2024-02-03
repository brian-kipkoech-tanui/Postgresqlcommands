# SQL Query ReadMe

---
## Basic Example
### Query using `OR` conditions
```sql
-- Example using OR conditions
SELECT title
FROM films
WHERE release_year=1920
OR release_year=1930
OR release_year=1940;
```
## Overview
This SQL query is designed to retrieve film titles from the "films" table where the release year is either 1920, 1930, or 1940. The same result can be achieved using both the explicit `OR` conditions and the more concise `IN` clause.

## Query Explanation
The first query uses multiple `OR` conditions to filter films based on specific release years (1920, 1930, and 1940). The second query achieves the same result using the `IN` clause, which provides a more compact and readable syntax.

## Usage
- Ensure that you have the necessary permissions to access the "films" table.
- Copy and paste either of the provided SQL queries into your preferred SQL environment (e.g., MySQL, PostgreSQL).
- Execute the query to retrieve film titles from the specified release years.

## Query Result
The result set includes one column:
- `title`: The titles of films released in the specified years (1920, 1930, 1940).

### Query using `IN` clause
```sql
-- Example using IN clause
SELECT title
FROM films
WHERE release_year IN (1920, 1930, 1940);
```
## Overview
This set of SQL queries demonstrates various functions related to date and time manipulation in a relational database. Each query showcases different functionalities such as retrieving the current date and time, truncating timestamps, calculating age, and extracting specific components from timestamps.

## Queries Explanation

1. **Current Date and Time**
   ```sql
   SELECT now();
   ```
   Returns the current date and time.

2. **Truncate Timestamp to Start of Month**
   ```sql
   SELECT date_trunc('month', timestamp '2022-03-15 14:25:36');
   ```
   Truncates the provided timestamp to the start of the month.

3. **Calculate Age**
   ```sql
   SELECT age(date '2000-01-01', now());
   ```
   Calculates the age of a person in years based on the provided birthdate and the current date.

4. **Extract Month from Timestamp**
   ```sql
   SELECT extract(month from timestamp '2022-03-15 14:25:36');
   ```
   Extracts the month component from the provided timestamp.

5. **Extract Year from Timestamp**
   ```sql
   SELECT date_part('year', timestamp '2022-03-15 14:25:36');
   ```
   Extracts the year component from the provided timestamp.

6. **Format Timestamp**
   ```sql
   SELECT to_char(timestamp '2022-03-15 14:25:36', 'YYYY-MM-DD');
   ```
   Formats the provided timestamp as 'YYYY-MM-DD'.

## Usage
- Ensure that you have the necessary permissions to run queries on your database.
- Copy and paste the SQL queries into your preferred SQL environment (e.g., MySQL, PostgreSQL).
- Execute the queries to observe the results of each date and time manipulation function.
Certainly! Here's a ReadMe template for the provided SQL query:

---

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

---
## Example5: elclasico (Games where either barcelona or RealMadrid were the clubs)
```sql
-- Example of how to use the query
SELECT 
	date,
	CASE WHEN hometeam_id = 8634 THEN 'FC Barcelona' ELSE 'Real Madrid CF' END AS home,
	CASE WHEN awayteam_id = 8634 THEN 'FC Barcelona' ELSE 'Real Madrid CF' END AS away
FROM matches_spain
WHERE (awayteam_id = 8634 OR hometeam_id = 8634)
      AND (awayteam_id = 8633 OR hometeam_id = 8633);
```
## Overview
This SQL query is designed to identify matches in the Spanish football league (La Liga) where either FC Barcelona or Real Madrid CF played. It selects the date, home team (identified as FC Barcelona or Real Madrid CF), and away team (identified as FC Barcelona or Real Madrid CF) for these matches.

## Query Explanation
The query uses two `CASE` statements to categorize the home and away teams as either FC Barcelona or Real Madrid CF based on their respective team IDs. The result set includes the date, home team, and away team for matches where either FC Barcelona or Real Madrid CF participated. The conditions in the `WHERE` clause ensure that matches involve both FC Barcelona and Real Madrid CF.

## Usage
- Ensure that you have the necessary permissions to access the `matches_spain` table.
- Copy and paste the SQL query into your preferred SQL environment (e.g., MySQL, PostgreSQL).
- Execute the query to retrieve information on matches involving FC Barcelona and Real Madrid CF.

## Query Result
The result set includes three columns:
- `date`: The date of the match.
- `home`: The home team, identified as either FC Barcelona or Real Madrid CF.
- `away`: The away team, identified as either FC Barcelona or Real Madrid CF.
Certainly! Here's a ReadMe template for the provided SQL query:

---
## Example6: home_goal score greater than or equal to 8
```sql
-- Example of how to use the query
SELECT
	team_long_name,
	team_short_name
FROM team
WHERE team_api_id IN
	  (SELECT hometeam_id 
       FROM match
       WHERE home_goal >= 8);
```
## Overview
This SQL query is designed to retrieve information about teams with 8 or more home goals in the provided dataset. It selects the long and short names of teams based on their API IDs from the `team` table. The condition for inclusion in the result set is that the team's API ID is present in the list of home teams with 8 or more goals from the `match` table.

## Query Explanation
The query utilizes a subquery in the `WHERE` clause to filter teams based on their API IDs. The subquery selects home team IDs from the `match` table where the number of home goals is greater than or equal to 8. The main query then selects the long and short names of teams from the `team` table that meet the specified condition.

## Usage
- Ensure that you have the necessary permissions to access the `team` and `match` tables.
- Copy and paste the SQL query into your preferred SQL environment (e.g., MySQL, PostgreSQL).
- Execute the query to retrieve information on teams with 8 or more home goals.

## Query Result
The result set includes two columns:
- `team_long_name`: The long name of the team.
- `team_short_name`: The short name or abbreviation of the team.
Certainly! Here's a ReadMe template for the given SQL query:

---
## Example7: Barcelona Home Performance with opponents
```sql
-- Example of how to use the query
SELECT 
	m.date,
	t.team_long_name AS opponent,
	CASE WHEN m.home_goal > m.away_goal THEN 'Barcelona win!'
         WHEN m.home_goal < m.away_goal THEN 'Barcelona loss :(' 
         ELSE 'Tie' END AS outcome 
FROM matches_spain AS m
LEFT JOIN teams_spain AS t 
ON m.awayteam_id = t.team_api_id
WHERE m.hometeam_id = 8634;
```
## Overview
This SQL query is designed to provide information about FC Barcelona's matches in the Spanish football league (La Liga). It selects the date, the long name of the opposing team, and the match outcome for matches where FC Barcelona played as the home team.

## Query Explanation
The query uses a `LEFT JOIN` to link the `matches_spain` table (`m`) with the `teams_spain` table (`t`) based on the away team's API ID. The query selects the date, the long name of the opposing team (`t.team_long_name`), and the match outcome using a `CASE` statement. The outcome is determined based on whether Barcelona scored more, less, or the same number of goals as the opposing team. The results are filtered to include only matches where Barcelona played as the home team (`m.hometeam_id = 8634`).

## Usage
- Ensure that you have the necessary permissions to access the `matches_spain` and `teams_spain` tables.
- Copy and paste the SQL query into your preferred SQL environment (e.g., MySQL, PostgreSQL).
- Execute the query to retrieve information on FC Barcelona's matches as the home team.

## Query Result
The result set includes three columns:
- `date`: The date of the match.
- `opponent`: The long name of the opposing team.
- `outcome`: The outcome of the match, indicating whether Barcelona won, lost, or the match ended in a tie.
Certainly! Here's a ReadMe template for the provided SQL query:

---
## Example8: the outcomes of matches in the Spanish football league (La Liga)
```sql
-- Example of how to use the query
SELECT 
	date,
	CASE WHEN home_goal > away_goal THEN 'Home win!'
         WHEN home_goal < away_goal THEN 'Home loss :(' 
         ELSE 'Tie' END AS outcome
FROM matches_spain;
```
## Overview
This SQL query is designed to provide information about the outcomes of matches in the Spanish football league (La Liga). It selects the date of the match and identifies whether the home team won, lost, or if the match ended in a tie based on the goal scores.

## Query Explanation
The query uses a `CASE` statement to categorize the match outcome. If the number of home goals is greater than the number of away goals, the outcome is labeled as a "Home win!". If the number of home goals is less than the number of away goals, the outcome is labeled as a "Home loss :(". If the home and away goals are equal, the outcome is labeled as a "Tie". The result set includes the date of the match.

## Usage
- Ensure that you have the necessary permissions to access the `matches_spain` table.
- Copy and paste the SQL query into your preferred SQL environment (e.g., MySQL, PostgreSQL).
- Execute the query to retrieve information on match outcomes in the Spanish football league.

## Query Result
The result set includes two columns:
- `date`: The date of the match.
- `outcome`: The match outcome, indicating whether the home team won, lost, or the match ended in a tie.
Certainly! Here's a ReadMe template for the provided SQL query:

---
## Example9: analyze football match outcomes in various countries
```sql
-- Example of how to use the query
SELECT 
    c.name AS country,
    COUNT(CASE WHEN m.home_goal > m.away_goal THEN m.id END) AS home_wins,
    COUNT(CASE WHEN m.home_goal < m.away_goal THEN m.id END) AS away_wins,
    COUNT(CASE WHEN m.home_goal = m.away_goal THEN m.id END) AS ties
FROM country AS c
LEFT JOIN matches AS m
ON c.id = m.country_id
GROUP BY country;
```

## Overview
This SQL query is designed to analyze football match outcomes in various countries. It selects the country name and counts the number of home wins, away wins, and ties based on the goal scores from the provided dataset.

## Query Explanation
The query utilizes three `COUNT` functions with `CASE` statements to categorize match outcomes. It counts the number of home wins, away wins, and ties for each country. The `LEFT JOIN` links the `country` and `matches` tables based on the country ID. The result set is grouped by country.

## Usage
- Ensure that you have the necessary permissions to access the `country` and `matches` tables.
- Copy and paste the SQL query into your preferred SQL environment (e.g., MySQL, PostgreSQL).
- Execute the query to retrieve information on match outcomes for each country.

## Query Result
The result set includes four columns:
- `country`: The name of the country.
- `home_wins`: The count of matches where the home team won.
- `away_wins`: The count of matches where the away team won.
- `ties`: The count of matches that ended in a tie.
Certainly! Here's a ReadMe template for the provided SQL query:

---
## Example10: Count the number of football matches played in each country during the 2012/2013 season
```sql
-- Example of how to use the query
SELECT 
	c.name AS country,
    COUNT(CASE WHEN m.season = '2012/2013' THEN m.id ELSE NULL END) AS matches_2012_2013
FROM country AS c
LEFT JOIN match AS m
ON c.id = m.country_id
GROUP BY country;
```

## Overview
This SQL query is designed to count the number of football matches played in each country during the 2012/2013 season. It selects the country name and counts the matches from the specified season.

## Query Explanation
The query utilizes a `COUNT` function with a `CASE` statement to count the matches from the 2012/2013 season for each country. The `LEFT JOIN` links the `country` and `match` tables based on the country ID. The result set is grouped by country.

## Usage
- Ensure that you have the necessary permissions to access the `country` and `match` tables.
- Copy and paste the SQL query into your preferred SQL environment (e.g., MySQL, PostgreSQL).
- Execute the query to retrieve information on the number of matches played in each country during the 2012/2013 season.

## Query Result
The result set includes two columns:
- `country`: The name of the country.
- `matches_2012_2013`: The count of matches played in the 2012/2013 season.
Certainly! Here's a ReadMe template for the provided SQL query:

---
## Example11: count the number of matches in each country where the total number of goals (home and away combined) is 10 or more
```sql
-- Example of how to use the query
SELECT
	c.name AS country_name,
    COUNT(sub.id) AS matches
FROM country AS c
INNER JOIN (SELECT country_id, id 
            FROM match
            WHERE (home_goal + away_goal) >= 10) AS sub
ON c.id = sub.country_id
GROUP BY country_name;
```

## Overview
This SQL query is designed to count the number of matches in each country where the total number of goals (home and away combined) is 10 or more. It selects the country name and counts the match IDs for matches meeting the specified criteria.

## Query Explanation
The query uses a subquery (aliased as `sub`) to filter matches with 10 or more total goals from the `match` table. The main query then performs an inner join between the `country` table (`c`) and the subquery based on the country ID. The result set includes the country name and the count of match IDs for matches meeting the criteria. The results are grouped by country.

## Usage
- Ensure that you have the necessary permissions to access the `country` and `match` tables.
- Copy and paste the SQL query into your preferred SQL environment (e.g., MySQL, PostgreSQL).
- Execute the query to retrieve information on the number of matches in each country with 10 or more total goals.

## Query Result
The result set includes two columns:
- `country_name`: The name of the country.
- `matches`: The count of match IDs for matches with 10 or more total goals.
Certainly! Here's a ReadMe template for the provided SQL query:

---
## Example12: count the number of matches played in each country for three different seasons: 2012/2013, 2013/2014, and 2014/2015.
```sql
-- Example of how to use the query
SELECT 
	c.name AS country,
    COUNT(CASE WHEN m.season = '2012/2013' THEN m.id END) AS matches_2012_2013,
	COUNT(CASE WHEN m.season = '2013/2014' THEN m.id END) AS matches_2013_2014,
	COUNT(CASE WHEN m.season = '2014/2015' THEN m.id END) AS matches_2014_2015
FROM country AS c
LEFT JOIN match AS m
ON c.id = m.country_id
GROUP BY country;
```

## Overview
This SQL query is designed to count the number of matches played in each country for three different seasons: 2012/2013, 2013/2014, and 2014/2015. It selects the country name and counts the match IDs for each season.

## Query Explanation
The query uses three `COUNT` functions with `CASE` statements to categorize matches for each season. The `LEFT JOIN` links the `country` and `match` tables based on the country ID. The result set includes the country name and the count of match IDs for each of the specified seasons. The results are grouped by country.

## Usage
- Ensure that you have the necessary permissions to access the `country` and `match` tables.
- Copy and paste the SQL query into your preferred SQL environment (e.g., MySQL, PostgreSQL).
- Execute the query to retrieve information on the number of matches played in each country for each of the specified seasons.

## Query Result
The result set includes four columns:
- `country`: The name of the country.
- `matches_2012_2013`: The count of match IDs for the 2012/2013 season.
- `matches_2013_2014`: The count of match IDs for the 2013/2014 season.
- `matches_2014_2015`: The count of match IDs for the 2014/2015 season.
Certainly! Here's a ReadMe template for the provided SQL query:

---
## Example13: retrieve information about football matches where the total number of goals (home and away combined) is 10 or more
```sql
-- Example of how to use the query
SELECT
	country,
	date,
	home_goal,
	away_goal
FROM
	(SELECT c.name AS country, 
     	    m.date, 
     		m.home_goal, 
     		m.away_goal,
           (m.home_goal + m.away_goal) AS total_goals
    FROM match AS m
    LEFT JOIN country AS c
    ON m.country_id = c.id) AS subquery
WHERE total_goals >= 10;
```

## Overview
This SQL query is designed to retrieve information about football matches where the total number of goals (home and away combined) is 10 or more. It selects the country name, date, home goals, and away goals from a subquery that combines data from the `match` and `country` tables.

## Query Explanation
The subquery (`subquery`) selects the country name (`c.name`), date (`m.date`), home goals (`m.home_goal`), away goals (`m.away_goal`), and calculates the total goals as the sum of home and away goals. The main query then filters the results from the subquery based on matches where the total goals are 10 or more.

## Usage
- Ensure that you have the necessary permissions to access the `match` and `country` tables.
- Copy and paste the SQL query into your preferred SQL environment (e.g., MySQL, PostgreSQL).
- Execute the query to retrieve information on football matches with 10 or more total goals.

## Query Result
The result set includes four columns:
- `country`: The name of the country.
- `date`: The date of the match.
- `home_goal`: The number of goals scored by the home team.
- `away_goal`: The number of goals scored by the away team.
Certainly! Here's a ReadMe template for the provided SQL query:

---
## Example14: calculate the average percentage of tied games (matches with the same number of home and away goals) for two different seasons (2013/2014 and 2014/2015) in each country
```sql
-- Example of how to use the query
SELECT 
	c.name AS country,
    ROUND(AVG(CASE WHEN m.season='2013/2014' AND m.home_goal = m.away_goal THEN 1
			 WHEN m.season='2013/2014' AND m.home_goal != m.away_goal THEN 0
			 END),2) AS pct_ties_2013_2014,
	ROUND(AVG(CASE WHEN m.season='2014/2015' AND m.home_goal = m.away_goal THEN 1
			 WHEN m.season='2014/2015' AND m.home_goal != m.away_goal THEN 0
			 END),2) AS pct_ties_2014_2015
FROM country AS c
LEFT JOIN matches AS m
ON c.id = m.country_id
GROUP BY country;
```

## Overview
This SQL query is designed to calculate the average percentage of tied games (matches with the same number of home and away goals) for two different seasons (2013/2014 and 2014/2015) in each country. It selects the country name and rounds the calculated percentages to two decimal points.

## Query Explanation
The query uses two `AVG` functions with `CASE` statements to calculate the average percentage of tied games for each specified season. The `LEFT JOIN` links the `country` and `matches` tables based on the country ID. The result set includes the country name and the rounded percentages for the two specified seasons.

## Usage
- Ensure that you have the necessary permissions to access the `country` and `matches` tables.
- Copy and paste the SQL query into your preferred SQL environment (e.g., MySQL, PostgreSQL).
- Execute the query to retrieve information on the average percentage of tied games in each country for the specified seasons.

## Query Result
The result set includes three columns:
- `country`: The name of the country.
- `pct_ties_2013_2014`: The average percentage of tied games for the 2013/2014 season.
- `pct_ties_2014_2015`: The average percentage of tied games for the 2014/2015 season.
---
## Example15: Subquery with NOT IN
```sql
-- Example of how to use the query
SELECT 
	team_long_name,
	team_short_name
FROM team
WHERE team_api_id NOT IN
     (SELECT DISTINCT hometeam_id FROM match);
```

## Overview
This SQL query is designed to retrieve the long and short names of football teams (`team_long_name` and `team_short_name`) that are not present in the home team IDs (`hometeam_id`) from a subquery within the `match` table.

## Query Explanation
The query uses a `NOT IN` clause to exclude teams whose `team_api_id` values are present in the subquery. The subquery selects distinct `hometeam_id` values from the `match` table. The result set includes the long and short names of teams that are not associated with any home team IDs in the specified subquery.

## Usage
- Ensure that you have the necessary permissions to access the `team` and `match` tables.
- Copy and paste the SQL query into your preferred SQL environment (e.g., MySQL, PostgreSQL).
- Execute the query to retrieve information on teams that are not home teams in the specified subquery.

## Query Result
The result set includes two columns:
- `team_long_name`: The long name of the team.
- `team_short_name`: The short name or abbreviation of the team.
Certainly! Here's a ReadMe template for the provided SQL query:

---
## Example16: retrieve information about football matches from the `matches_2013_2014` table
```sql
-- Example of how to use the query
SELECT 
	date,
	home_goal,
	away_goal
FROM  matches_2013_2014
WHERE (home_goal + away_goal) > 
       (SELECT 3 * AVG(home_goal + away_goal)
        FROM matches_2013_2014);
```

## Overview
This SQL query is designed to retrieve information about football matches from the `matches_2013_2014` table. It selects the date of the match (`date`), the number of home goals (`home_goal`), and the number of away goals (`away_goal`). The query filters for matches where the total number of goals (home and away combined) exceeds three times the average total goals for the specified season.

## Query Explanation
The main query includes a `WHERE` clause that compares the total goals scored in each match with three times the average total goals for the 2013/2014 season. The average is calculated using a subquery within the `WHERE` clause.

## Usage
- Ensure that you have the necessary permissions to access the `matches_2013_2014` table.
- Copy and paste the SQL query into your preferred SQL environment (e.g., MySQL, PostgreSQL).
- Execute the query to retrieve information on matches where the total goals exceed three times the average for the specified season.

## Query Result
The result set includes three columns:
- `date`: The date of the match.
- `home_goal`: The number of goals scored by the home team.
- `away_goal`: The number of goals scored by the away team.