USE WorldCupAnalysis;
GO

/*
Create one reusable, deduplicated match view.
The source CSV contains blank rows and 16 duplicated 2014 MatchIDs.
*/
CREATE OR ALTER VIEW dbo.vw_CleanWorldCupMatches
AS
WITH RankedMatches AS (
    SELECT
        *,
        ROW_NUMBER() OVER (
            PARTITION BY MatchID
            ORDER BY [Datetime], Home_Team_Name, Away_Team_Name
        ) AS duplicate_rank
    FROM dbo.WorldCupMatches
    WHERE [Year] IS NOT NULL
      AND MatchID IS NOT NULL
)
SELECT *
FROM RankedMatches
WHERE duplicate_rank = 1;
GO
