/* 
Historical FIFA World Cup Performance Analysis

File: 01_data_exploration.sql
Purpose: Explore the WorldCupMatches table before performing deeper analysis.
*/

/*
Question 1
How many historical World Cup matches are contained in the dataset?

SQL

*/
SELECT COUNT(*) AS total_matches
FROM dbo.WorldCupMatches;
/*

Result
4592

Question 2
How many different World Cup tournaments are represented in the dataset?

SQL

*/
SELECT COUNT(DISTINCT Year) AS total_tournaments
FROM dbo.WorldCupMatches;
/*

Result
20

Question 3
What is the earliest and lastest tournament in the data?

SQL

*/
SELECT
    MIN(Year) AS first_tournament,
    MAX(Year) AS latest_tournament
FROM dbo.WorldCupMatches;
/*

Result
1930 & 2014


Question 4 
How many unique countries have participated in the World Cup?

SQL 

*/
SELECT COUNT(*) AS total_countries
FROM (
SELECT Home_Team_Name
FROM dbo.WorldCupMatches
UNION
SELECT Away_Team_Name
FROM dbo.WorldCupMatches
) AS CountryList
/*

Result
84

Question 5
Which tournament featured the highest number of matches?

SQL 

*/
SELECT TOP 1 year, COUNT(year) AS highest_num_of_matches
FROM dbo.WorldCupMatches
GROUP BY year
ORDER BY COUNT(year) DESC
/*

Result
2014

Question 6
Which countries have played the most World Cup matches?

SQL

*/
SELECT TOP 1 country, count(*) AS games_played FROM (
	SELECT home_team_name AS country
	FROM dbo.WorldCupMatches

	UNION ALL

	SELECT away_team_name
	FROM dbo.WorldCupMatches

	) AS teams

WHERE country IS NOT NULL

GROUP BY country
ORDER BY games_played DESC
/*

Result
108

(Included 'WHERE' statement to remove null values.)