USE WorldCupAnalysis;
GO

/* Convert each match into one row per participating team. */
WITH TeamMatches AS (
    SELECT
        MatchID,
        Home_Team_Name AS team,
        Home_Team_Goals AS goals_for,
        Away_Team_Goals AS goals_against
    FROM dbo.vw_CleanWorldCupMatches

    UNION ALL

    SELECT
        MatchID,
        Away_Team_Name,
        Away_Team_Goals,
        Home_Team_Goals
    FROM dbo.vw_CleanWorldCupMatches
),
TeamSummary AS (
    SELECT
        team,
        COUNT(*) AS matches_played,
        SUM(CASE WHEN goals_for > goals_against THEN 1 ELSE 0 END) AS wins,
        SUM(CASE WHEN goals_for = goals_against THEN 1 ELSE 0 END) AS draws,
        SUM(CASE WHEN goals_for < goals_against THEN 1 ELSE 0 END) AS losses,
        SUM(goals_for) AS goals_for,
        SUM(goals_against) AS goals_against
    FROM TeamMatches
    WHERE team IS NOT NULL
    GROUP BY team
)
SELECT
    team,
    matches_played,
    wins,
    draws,
    losses,
    goals_for,
    goals_against,
    goals_for - goals_against AS goal_difference,
    CAST(100.0 * wins / NULLIF(matches_played, 0) AS DECIMAL(5, 2)) AS win_percentage
FROM TeamSummary
ORDER BY matches_played DESC, wins DESC;
