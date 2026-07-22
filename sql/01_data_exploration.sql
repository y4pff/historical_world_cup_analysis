/*
Historical FIFA World Cup Performance Analysis

File: 01_data_exploration.sql
Purpose: Explore the cleaned WorldCupMatches data before deeper analysis.
*/

USE WorldCupAnalysis;
GO

/*
Question 1
How many historical World Cup matches are contained in the dataset?
*/

SELECT COUNT(*) AS total_matches
FROM dbo.vw_CleanWorldCupMatches;

/*
Result
836
*/

/*
Question 2
How many different World Cup tournaments are represented in the dataset?
*/


SELECT COUNT(DISTINCT Year) AS total_tournaments
FROM dbo.vw_CleanWorldCupMatches;

/*
Result
20
*/

/*
Question 3
What is the earliest and latest tournament in the data?
*/

SELECT
    MIN(Year) AS first_tournament,
    MAX(Year) AS latest_tournament
FROM dbo.vw_CleanWorldCupMatches;

/*
Result
1930 & 2014
*/

/*
Question 4 
How many unique countries have participated in the World Cup?
*/

SELECT COUNT(*) AS total_countries
FROM (
SELECT Home_Team_Name
FROM dbo.vw_CleanWorldCupMatches
UNION
SELECT Away_Team_Name
FROM dbo.vw_CleanWorldCupMatches
) AS CountryList;

/*
Result
83


** Historical labels such as Germany FR and Germany are separate. **

*/

/*
Question 5
Which tournament featured the highest number of matches?
*/

SELECT TOP 1 year, COUNT(year) AS highest_num_of_matches
FROM dbo.vw_CleanWorldCupMatches
GROUP BY year
ORDER BY COUNT(year) DESC;

/*
Result
2014, 2010, 2006, 2002, 1998
*/

/*
Question 6
Which countries have played the most World Cup matches?
*/

SELECT TOP 1 country, count(*) AS games_played FROM (
	SELECT home_team_name AS country
	FROM dbo.vw_CleanWorldCupMatches

	UNION ALL

	SELECT away_team_name
	FROM dbo.vw_CleanWorldCupMatches

	) AS teams

WHERE country IS NOT NULL

GROUP BY country
ORDER BY games_played DESC;

/*
Result
104


(Included 'WHERE' statement to remove null values.)

*/

/*
Question 7 
Which countries have won the most FIFA World Cup matches?
*/

SELECT winner, count(winner) AS games_won FROM (
	SELECT home_team_name AS winner
	FROM dbo.vw_CleanWorldCupMatches

	WHERE Home_Team_Goals > Away_Team_Goals

	UNION ALL

	SELECT away_team_name AS winner
	FROM dbo.vw_CleanWorldCupMatches

	WHERE Away_Team_Goals > Home_Team_Goals

	) AS teams

WHERE winner IS NOT NULL

GROUP BY winner
ORDER BY games_won DESC;

/*
Result
Brazil, 70

This counts wins on the recorded scoreline.
Penalty shootout outcomes require separate analysis.
*/