/*
Historical FIFA World Cup Performance Analysis

File: 04_tournament_analysis.sql
Purpose: Analyse match, scoring and attendance trends by tournament.
*/

USE WorldCupAnalysis;
GO


/*
Create a reusable tournament-level performance view.
*/
CREATE OR ALTER VIEW dbo.vw_TournamentPerformance
AS

SELECT
    [Year],
    COUNT(*) AS matches_played,
    SUM(Home_Team_Goals + Away_Team_Goals) AS total_goals,
    CAST(
        1.0 * SUM(Home_Team_Goals + Away_Team_Goals)
        / NULLIF(COUNT(*), 0)
        AS DECIMAL(5, 2)
    ) AS goals_per_match,
    SUM(TRY_CONVERT(BIGINT, Attendance)) AS total_attendance,
    CAST(
        AVG(TRY_CONVERT(DECIMAL(18, 2), Attendance))
        AS DECIMAL(12, 2)
    ) AS average_attendance,
    COUNT(Attendance) AS matches_with_attendance
FROM dbo.vw_CleanWorldCupMatches
GROUP BY [Year];
GO


/*
Question 1
How did the number of matches change between tournaments?
*/
SELECT
    [Year],
    matches_played
FROM dbo.vw_TournamentPerformance
ORDER BY [Year];

/*
Expected insight:
The tournament expanded from 18 matches in 1930 to 64 matches
from 1998 onwards.
*/


/*
Question 2
Which tournaments produced the most total goals?
*/
SELECT TOP (5) WITH TIES
    [Year],
    matches_played,
    total_goals
FROM dbo.vw_TournamentPerformance
ORDER BY total_goals DESC;

/*
Expected result:
1998 and 2014 rank joint first with 171 goals.
2002 ranks next with 161.
*/


/*
Question 3
Which tournaments had the highest average goals per match?
*/
SELECT TOP (5)
    [Year],
    matches_played,
    total_goals,
    goals_per_match
FROM dbo.vw_TournamentPerformance
ORDER BY goals_per_match DESC, total_goals DESC;

/*
Expected result:
1954 ranks first with 5.38 goals per match.
1938 ranks second with 4.67.
1934 ranks third with 4.12.
*/


/*
Question 4
Which tournament had the lowest average goals per match?
*/
SELECT TOP (1)
    [Year],
    matches_played,
    total_goals,
    goals_per_match
FROM dbo.vw_TournamentPerformance
ORDER BY goals_per_match ASC, total_goals ASC;

/*
Expected result:
1990 had the lowest average with 2.21 goals per match.
*/


/*
Question 5
Which tournaments recorded the highest total attendance?
*/
SELECT TOP (5)
    [Year],
    matches_played,
    matches_with_attendance,
    total_attendance
FROM dbo.vw_TournamentPerformance
ORDER BY total_attendance DESC;

/*
Expected result:
1994 ranks first with a recorded total attendance of 3,587,538.
2014 ranks second with 3,386,810, although attendance is only
available for 63 of its 64 matches.
*/


/*
Question 6
Which tournaments recorded the highest average attendance?
*/
SELECT TOP (5)
    [Year],
    matches_with_attendance,
    average_attendance
FROM dbo.vw_TournamentPerformance
ORDER BY average_attendance DESC;

/*
Expected result:
1994 ranks first with an average recorded attendance of 68,991.12.
*/