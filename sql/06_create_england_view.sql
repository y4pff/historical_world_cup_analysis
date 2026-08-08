USE WorldCupAnalysis;
GO

CREATE OR ALTER VIEW dbo.vw_EnglandMatches AS

SELECT
    MatchID,
    [Year],
    Stage,
    Away_Team_Name AS opponent,
    Home_Team_Goals AS goals_for,
    Away_Team_Goals AS goals_against,
    Win_conditions,
    CASE
        WHEN Home_Team_Goals > Away_Team_Goals THEN 'Win'
        WHEN Home_Team_Goals = Away_Team_Goals THEN 'Draw'
        ELSE 'Loss'
    END AS result
FROM dbo.vw_CleanWorldCupMatches
WHERE Home_Team_Name = 'England'

UNION ALL

SELECT
    MatchID,
    [Year],
    Stage,
    Home_Team_Name AS opponent,
    Away_Team_Goals AS goals_for,
    Home_Team_Goals AS goals_against,
    Win_conditions,
    CASE
        WHEN Away_Team_Goals > Home_Team_Goals THEN 'Win'
        WHEN Away_Team_Goals = Home_Team_Goals THEN 'Draw'
        ELSE 'Loss'
    END AS result
FROM dbo.vw_CleanWorldCupMatches
WHERE Away_Team_Name = 'England';
GO

SELECT COUNT(*) AS england_matches
FROM dbo.vw_EnglandMatches;