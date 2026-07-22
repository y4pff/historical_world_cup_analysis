/*
Historical FIFA World Cup Performance Analysis

File: 05_england_analysis.sql
Purpose: Analyse England's World Cup performance.
*/

USE WorldCupAnalysis;
GO


WITH EnglandMatches AS (
    SELECT
        [Year],
        Stage,
        Away_Team_Name AS opponent,
        Home_Team_Goals AS goals_for,
        Away_Team_Goals AS goals_against,
        Win_conditions
    FROM dbo.vw_CleanWorldCupMatches
    WHERE Home_Team_Name = 'England'

    UNION ALL

    SELECT
        [Year],
        Stage,
        Home_Team_Name AS opponent,
        Away_Team_Goals AS goals_for,
        Home_Team_Goals AS goals_against,
        Win_conditions
    FROM dbo.vw_CleanWorldCupMatches
    WHERE Away_Team_Name = 'England'
)

SELECT 
    COUNT (*) AS matches_played,

    SUM(
        CASE
        WHEN goals_for > goals_against THEN 1
        ELSE 0
        END
    ) AS Wins,

    SUM(
        CASE WHEN goals_against = goals_for THEN 1
        ELSE 0
        END
    ) AS Draws,

    SUM(
        CASE
        When goals_for < goals_against THEN 1
        ELSE 0
        END
    ) AS Losses,

    SUM(goals_for) AS GoalsScored,

    SUM(goals_against) AS GoalsConceded
    
FROM EnglandMatches;

/*
How did England perform in each World Cup tournament?
*/

WITH EnglandMatches AS (
    SELECT
        [Year],
        Stage,
        Away_Team_Name AS opponent,
        Home_Team_Goals AS goals_for,
        Away_Team_Goals AS goals_against,
        Win_conditions
    FROM dbo.vw_CleanWorldCupMatches
    WHERE Home_Team_Name = 'England'

    UNION ALL

    SELECT
        [Year],
        Stage,
        Home_Team_Name AS opponent,
        Away_Team_Goals AS goals_for,
        Home_Team_Goals AS goals_against,
        Win_conditions
    FROM dbo.vw_CleanWorldCupMatches
    WHERE Away_Team_Name = 'England'
)

SELECT
    [Year],
    COUNT(*) AS matches_played,

    SUM(
        CASE
            WHEN goals_for > goals_against THEN 1
            ELSE 0
        END
    ) AS wins,

    SUM(
        CASE
            WHEN goals_for = goals_against THEN 1
            ELSE 0
        END
    ) AS draws,

    SUM(
        CASE
            WHEN goals_for < goals_against THEN 1
            ELSE 0
        END
    ) AS losses,

    SUM(goals_for) AS goals_scored,
    SUM(goals_against) AS goals_conceded,

    SUM(goals_for) - SUM(goals_against) AS goal_difference

FROM EnglandMatches

GROUP BY [Year]
ORDER BY [Year];

/*
What is England's scoreline record in World Cup knockout matches?
*/

WITH EnglandMatches AS (
    SELECT
        [Year],
        Stage,
        Away_Team_Name AS opponent,
        Home_Team_Goals AS goals_for,
        Away_Team_Goals AS goals_against,
        Win_conditions
    FROM dbo.vw_CleanWorldCupMatches
    WHERE Home_Team_Name = 'England'

    UNION ALL

    SELECT
        [Year],
        Stage,
        Home_Team_Name AS opponent,
        Away_Team_Goals AS goals_for,
        Home_Team_Goals AS goals_against,
        Win_conditions
    FROM dbo.vw_CleanWorldCupMatches
    WHERE Away_Team_Name = 'England'
),
EnglandKnockoutMatches AS (
    SELECT *
    FROM EnglandMatches
    WHERE Stage IN (
        'Round of 16',
        'Quarter-finals',
        'Semi-finals',
        'Final',
        'Match for third place'
    )
)

SELECT
    COUNT(*) AS knockout_matches,

    SUM(
        CASE
            WHEN goals_for > goals_against THEN 1
            ELSE 0
        END
    ) AS wins,

    SUM(
        CASE
            WHEN goals_for = goals_against THEN 1
            ELSE 0
        END
    ) AS draws,

    SUM(
        CASE
            WHEN goals_for < goals_against THEN 1
            ELSE 0
        END
    ) AS losses,

    SUM(goals_for) AS goals_scored,
    SUM(goals_against) AS goals_conceded

FROM EnglandKnockoutMatches;