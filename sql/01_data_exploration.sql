USE WorldCupAnalysis;
GO

/* Raw, populated and cleaned row counts. */
SELECT
    COUNT(*) AS raw_rows,
    COUNT([Year]) AS populated_match_rows,
    COUNT(DISTINCT MatchID) AS unique_match_ids
FROM dbo.WorldCupMatches;

SELECT COUNT(*) AS cleaned_matches
FROM dbo.vw_CleanWorldCupMatches;

/* Tournament coverage. */
SELECT
    COUNT(DISTINCT [Year]) AS total_tournaments,
    MIN([Year]) AS first_tournament,
    MAX([Year]) AS latest_tournament
FROM dbo.vw_CleanWorldCupMatches;

/* Distinct raw team labels. */
WITH Teams AS (
    SELECT Home_Team_Name AS team
    FROM dbo.vw_CleanWorldCupMatches
    UNION
    SELECT Away_Team_Name
    FROM dbo.vw_CleanWorldCupMatches
)
SELECT COUNT(*) AS unique_team_labels
FROM Teams
WHERE team IS NOT NULL;

/* Match count for every tournament; the maximum is 64. */
SELECT [Year], COUNT(*) AS matches_played
FROM dbo.vw_CleanWorldCupMatches
GROUP BY [Year]
ORDER BY [Year];
