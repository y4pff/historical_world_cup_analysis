/*
Historical FIFA World Cup Performance Analysis

File: 03_team_rankings.sql
Purpose: Rank teams using the cleaned team-performance view.
*/

USE WorldCupAnalysis;
GO


/*
Question 1
Which teams played the most World Cup matches?
*/
SELECT TOP (10)
    team,
    matches_played
FROM dbo.vw_TeamPerformance
ORDER BY matches_played DESC, wins DESC;

/*
Result:
Brazil played the most matches with 104.
Italy ranked second with 83.
Argentina ranked third with 77.
*/

/*
Question 2
Which teams recorded the most scoreline wins?
*/
SELECT TOP (10)
    team,
    wins,
    matches_played
FROM dbo.vw_TeamPerformance
ORDER BY wins DESC, matches_played DESC;

/*
Result:
Brazil recorded the most scoreline wins with 70.
Italy ranked second with 45.
Argentina ranked third with 42.
*/

/*
Question 3
Which teams scored the most goals?
*/
SELECT TOP (10)
    team,
    goals_for,
    matches_played
FROM dbo.vw_TeamPerformance
ORDER BY goals_for DESC, matches_played DESC;

/*
Result:
Brazil scored the most goals with 221.
Argentina and Germany FR both scored 131.
*/

/*
Question 4
Which teams recorded the best goal difference?
*/
SELECT TOP (10)
    team,
    goal_difference,
    goals_for,
    goals_against
FROM dbo.vw_TeamPerformance
ORDER BY goal_difference DESC, goals_for DESC;

/*
Result:
Brazil recorded the strongest goal difference at +119.
Germany FR ranked second at +54.
Italy ranked third at +51.
*/

/*
Question 5
Which teams recorded the highest win percentage?
Only teams that played at least 10 matches are included.
*/
SELECT TOP (10)
    team,
    matches_played,
    wins,
    win_percentage
FROM dbo.vw_TeamPerformance
WHERE matches_played >= 10
ORDER BY win_percentage DESC, matches_played DESC;

/*
Result:
Among teams with at least 10 matches, Germany recorded the
highest scoreline win percentage at 68.18%.

Brazil ranked second at 67.31%, followed by Germany FR at 58.06%.

Germany and Germany FR remain separate historical labels.
*/